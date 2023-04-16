//
//  ContentView.swift
//  MineDiLei
//
//  Created by Pan Sui Wang on 7/5/2022.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Image("Logo")
                Text("Welcome")
                    .fontWeight(.bold)
            } else {
                Image("Logo")
                Button("Enter") {
                    authenticate()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10.0)
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to make sure that it's you"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    //Problem
                }
            }
        } else {
            //No Biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
