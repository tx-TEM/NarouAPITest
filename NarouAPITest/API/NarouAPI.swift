//
//  NarouAPI.swift
//  NarouAPITest
//
//  Created by yoshiki-t on 2018/09/29.
//  Copyright © 2018 yoshiki-t. All rights reserved.
//

import Alamofire

class NarouAPI {
    
    var baseURL: String
    
    init() {
        baseURL = "https://api.syosetu.com/novelapi/api/"
    }
    
    func getOverViewList(sortOption: NarouSortOption) {
        let parameters: Parameters = [
            "out" : "json",
            "order" : sortOption.rawValue,
            "of" : "t-n-u-w-s-gp-gl",
            
        ]
        
        Alamofire.request(baseURL,method: .get, parameters: parameters).response  { response in
            
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            guard let data = response.data else { return }
            let novelOverviewList: NovelOverviewList? = try? JSONDecoder().decode(NovelOverviewList.self, from: data)
            
            if let novelOverviewList = novelOverviewList {
                print(novelOverviewList.novelOverviews)
            }
            
        }
    }
    
    
    
}