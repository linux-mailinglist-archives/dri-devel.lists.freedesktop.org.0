Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E85804929
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 06:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3040A10E21D;
	Tue,  5 Dec 2023 05:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381E10E1F5;
 Tue,  5 Dec 2023 05:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXL+5dRQGNhlTTz6jFY+8NJzodHSqOLBOcaL2CK/+4ksmhmh3pjdi78V44hJUZqwr1QEy1c9N6QtQ41lqfGdx08UfxVd74egolfvl4FxhRtSxbBXAeFMBEWIGrSV1BWJdBwRGUKCDi7Z5zWSOi5MHMJ9EcXQpZtlHIozqPdeklamret7bua4tQObVXSToB6lW/yrUgtgoEGjfuaUVHYLZi7OsQUngK4VQ23/cbCXA1R0J3/LeChmXnTs2F8i2LuYMXNKIBhxidP0/0OXrqXPScGg0+qcFl0RC9BCWlztxX38rdDCleqViLLwxMdWsPFLmeI9dsGJIv5X4Lbj3JHPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgTRLI8X/fTlmJP3qEJbAI57PazEB0EPkxV7cAnKxEM=;
 b=MmEnYFaX5HDNfDnEAiMk9kOzc/N/ydiaIJOR/m+Qr9kIUgnxoxMm0cLdHer6vIGuiRzLcC+e5gyllrdMx5d7FCmgWAqtb8A8LoZ6O8sOkRfiqvZ2hpDz3XLAc3wx+i/yMpwQ3q4VycshdTEXj9L5sGuBvH9VxiZdxCR1skSPgCbobP9LJsrYqgfKuFOMhZf/gdKC1rLG5N7TJVIOSXmbiRS4VylgmV6aYgfjuY0CZ7+ToNYqaNBDVqD3Ow7h6zMic3Aci5tNNIwKcf1t1wKThhyw2kD6bIpwmJLU2aZgOFAuFpzB6cST7vWXUOQlfs1hnJ0fZGE7T5j3OOmnZDI9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgTRLI8X/fTlmJP3qEJbAI57PazEB0EPkxV7cAnKxEM=;
 b=WKZEDnIbKYVnc6kzM/K18c14Xq6RGNGb0WvLrRIlIhS+971OwdwLlXmj1emixgKx0HmgA5vcQJLnignhVbkee2i0oHiQWrnK4qFstMQBiPXVeSPz5sUril6EOmrfdGKq0/gtGTN912zhe4cqCvsXsl46OmbSuBQ7rUFC4pgJWQJ28peyosRP3qHmXk8+R8KX8tJUwEuZrPfenMyVvR277aRtH7wsUIZSnjUAn4NmQG/4bWzrs45lA/JwVTgP3TdhVGHoxuvxowxwZhQJmjzySLyVwibfebRUqSeeodE7ghGvp5+0HUdmNVIjBXlm5OvkCJ8jyJpmlQzNRf5Z0t306g==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 05:06:36 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 05:06:36 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: drop the gsp failure message to a
 debug.
Thread-Topic: [Nouveau] [PATCH] nouveau/gsp: drop the gsp failure message to a
 debug.
Thread-Index: AQHaJx7rjYbBYj4WUEGwL3VIp5sPs7CaI2YA
Date: Tue, 5 Dec 2023 05:06:36 +0000
Message-ID: <ffbcfe8b0e0c3d2a1ef575f20c30aea06224e13d.camel@nvidia.com>
References: <20231205020101.746744-1-airlied@gmail.com>
In-Reply-To: <20231205020101.746744-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SN7PR12MB7856:EE_
x-ms-office365-filtering-correlation-id: dae569ad-0c63-4a76-567c-08dbf54ff50a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J/yY30HY7UlI0o3wD4dtfbetWvP3xdtPOy6uBqYnpKvaK9Fb/uqhhsy+a45PMEsxNlFomvYYyDLK7fpppbHdHd54CS1aj+HSn6eD/yBANW1dIM4+a8/Jm+StinW5qc9sDzhcaeY5E9ovbS+zpvLeJrhXWSN0V7ZOj46uZNtLmkC+NUCe9HREID2yeVeytctoRdbargX8OOTnNxL3WRabgMDKKPaKk7lZadfs6Thvr5M5XUK02F9f+jxgB05O1JiHr14r0CvtpSutQdUYXAwUuWLtCCXrtZRUEy198Yn/ANymq3k8DeJ36r5S59qexCOAsUUnj4MVgKXToIuTEU53NjRmisp7c7MXosXDGXStcyvegtA7ioGvtFk+kTtpAQM+ui4KAFlOPpo7Pet2fMSvY5x9oJ2Kn+eQCqK0VP3ua0YlvIzuigjQgu+jlF7Vwqd6Ae5Cc2/0w5Ztis062xgMa7MVxd9xevmMcEG2iuaaFg9CEYAOYWvRPF5YjugTXb4iQ3gYKfK4sfS/Sor61zOAwUGqaRnSxnN+clJrdymcWrdlxgoZmtuKIFU6H+cwWoaknHvGm6Uvm5gY5Qh5r0Q0YTjxo85KyDh/5gTssvHKbR0fFXDCgiL9zSmTqXCltjTg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(558084003)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(6512007)(6506007)(6486002)(478600001)(26005)(71200400001)(38100700002)(122000001)(110136005)(316002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clFGaDRxRzh3ckNWUzIxYjl1Qks3K1hHNEJGZ1VnK3Y0QW5WbE9HaVZ5dFRU?=
 =?utf-8?B?YVNNQkpYMjN6OWl3N1ovamZ3OVVRU1REUVVCWVpUWHFvSUgxdjNiZkc1aDdF?=
 =?utf-8?B?ajFaSFRrV0RJTlRSRlNGMnNERUE4UTROcnVJWkZsMlEwUnkzbFQwWi8rQW52?=
 =?utf-8?B?RnFTSWJ5UzZxQlBtcXY3Z2svbmxEWU56bGZ6REFtZWt6SGxLOGZhVTl5SFQz?=
 =?utf-8?B?Uk4rNzN0dXRlUmprOGw4ZWhpSDdjRkx0eXpwSk9wZXc4Nk44aVVBdDZ0Njlh?=
 =?utf-8?B?MmVqSENPS01hdTMvNlQxaGRIbXV4NDVHUEVMU3MrdlA0QjAxYzc0aGJjd1RL?=
 =?utf-8?B?bEFKOTQrYUlSclkweGJGTnVCR29jVVk2NzFPcmtFU1NYdFVFL3VrZDhQYjVJ?=
 =?utf-8?B?RGxzZ04wcHduZ25EajJJaGZ1M1VVbWZKd3dyVThNQjNXZUo0K0hUYUNxWkor?=
 =?utf-8?B?Z2F6NnAyRExYMmJRR0tqbzFNMk1YRTJnekFNdDdEM0VuQWRCMFcvU1BiSkk1?=
 =?utf-8?B?djNTQWl4L29qZFNTR0JCeEE3T1g2WW1ueUpBMFUyZW5IaXpSVTllY21xL0xJ?=
 =?utf-8?B?ZGtVa0ptU3ByY0lWZTNjZ3E2d1Q4SXRRdGJUbUhFVGEzR2EwdGFaUHI4dk1T?=
 =?utf-8?B?WCtpZlBuRFpVYWJWN0x5OU1LNW56MTVZMTFxejNBZXZSYitVZnk3Q1NjODJu?=
 =?utf-8?B?amtwNVEvVzl5Yjk2NS9CVE90aCtoQitZaUxoZVduYzRnQm1NM0ROd3pKY1Rp?=
 =?utf-8?B?TVlpTXczeFlxdS95c29HSXlDTHU3TVppcDExQnYzaDFyOFQ0Qm9jb3lRcmc2?=
 =?utf-8?B?SmxDbU0wQWhuSFZOT1N6cUxBY2ROcmQrVHF3bFNlNHByWGQ0VkpIblAzN1kx?=
 =?utf-8?B?ZDFFWHMwVzhmTGowc3JLU29PQ1VDY093RnBldE1ueTlTWk4rRUtFS2RNOW1x?=
 =?utf-8?B?Z0NmMTd1NWdpOVVzSnRUTlZFRnd6LzRlNC8zL0NoTGJMb2pnQzlYY1h1Y0Fz?=
 =?utf-8?B?eWo1RmhxdVIwT28vQ3JabUlEeGVXTGJaSHRWL1RYYVBMQVhWU3VJK0hsT0ht?=
 =?utf-8?B?dFpNRU1BYUFVN1phMTJBanp2L0lKOHJPZmszRVhhVlVFaU14UDlielNGdHpv?=
 =?utf-8?B?L0JnM2VsemZKNjdZYTh4Nk8rYVNBcmh5WEl6SmNRR1RwZ0U0eEVOQW4yMGNB?=
 =?utf-8?B?cjZjYkhBeVpCK24yVlA1bU1jZHVTZjdyVGcwdTVmWWtKakUvYVc0RGp0OVZm?=
 =?utf-8?B?ak1LT1pEVmJQWi81bnA2Z0dldkVsM240b1AyUmtNRFZZVjRVOW9MMEJVTE4y?=
 =?utf-8?B?RC9ZbkMxb3Y3VER5aHpGSDk2RkNKN2hNVjBPZHcvZDRjUE1tVkJub2Z6Y1JS?=
 =?utf-8?B?TmVOY3cvc29mMytjOGZ4NW9oc2xVWFlGZE83aEhjTGxNTG1sUGx3d1U4Qmw4?=
 =?utf-8?B?aC8xZTBZWGhjM0NseXBGeWV2cjNjOENQamhaRnI0NmpiaE1XU1g1YWNQRnBk?=
 =?utf-8?B?STlUMDJsSG1Ub0c3TFJWTnR1MGxKV3pLN1YxVXY1Wkg3d3RXVWVsSEszUDk1?=
 =?utf-8?B?Vjh5UHB4ZXdKcWV6NWcxcmtrZ0oxNVoveFZWUmVqNW00RWJKY1pSK3UyMXBW?=
 =?utf-8?B?MGZlaXBjR0QyK3Z6WklxTU9yVjRqRmFadnAveHRPbHh1UldwcjFYNFM0OHRB?=
 =?utf-8?B?V0FGZjMwTEdvMGNIVFFweWFRN3pLRFA4VXdIZVJTVlFrQk9HUHhSY0puS0xK?=
 =?utf-8?B?aUNIS0FScW96OEFKdTFlV0FDcUd3RjlCcjA1MW0yZ3ZqZ0p4TThQNFZKWkhL?=
 =?utf-8?B?dDkxREx3QzdRdUNkYmxJRGo1K2x1ZlFNSmJ6Z0thOGV6YUtMaTgrVnV4THU4?=
 =?utf-8?B?VmZIRkJxYmtTYkx4UkVKNVpheW9mVDZnT1lNQ2pQU3lIVDNEWnhHamxmWnZX?=
 =?utf-8?B?UXhGMDN5Q0NyeWlkNnk5VWorNDJFRlEwdjlkdld4NGR3K0FFUzUyUG5xL2w1?=
 =?utf-8?B?V3pEN1JXKy93aDZLdUV4LzNHWWZPRk1rQldiNzhhR1p6UUgxU2drTWh1Y2h3?=
 =?utf-8?B?RmhmUE5iYXc4SE53Wjk4bzZJNmljTmorUWNQazF1NmJZd2xBMFB3ZUtRMVBY?=
 =?utf-8?Q?d2gDHgbCRKIC8l2fVdTAzRSsQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19BB8EDAD5F72147A66AA59818F8F89B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae569ad-0c63-4a76-567c-08dbf54ff50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 05:06:36.4831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWMQUV6D8fzu7e6kb+ROmBQCpSrZOzwPqyJmVIBv5TTifiL8T2P1jTq4SnTvgjC15d4oxSmk5sy8FsrKGvWHvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEyLTA1IGF0IDEyOjAxICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
VGhlc2UgY2FuIGhhcHBlbiBpbiBub3JtYWwgb3BlcmF0aW9ucyBlc3Agd2l0aCBhdXhjaCB0cmFu
c2FjdGlvbnMuDQo+IA0KPiBHZXRzIHJpZCBvZg0KPiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZ3Nw
OiBjbGk6MHhjMWQwMDAwMiBvYmo6MHgwMDczMDAwMCBjdHJsIGNtZDoweDAwNzMxMzQxDQo+IGZh
aWxlZDogMHgwMDAwZmZmZg0KPiBpbiBsb2dzLg0KDQpJcyB0aGlzIHNvbWV0aGluZyB5b3Ugd2Fu
dCBtZSB0byBsb29rIGludG8/DQo=
