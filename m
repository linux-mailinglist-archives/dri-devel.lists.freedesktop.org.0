Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92FE80361C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D08C10E1DC;
	Mon,  4 Dec 2023 14:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032DD10E1DC;
 Mon,  4 Dec 2023 14:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=di73HZFk8MK44/AO6J4GAa8lepICtVY15WGqzGR+3h9zuFQIh1krG6wXRA0ucYlHpI76ZV6dWsupbT1xnMnE/rdZ5eOQ8bFQOFzPnWzZNO/MDzdOIb/GBJHhKAWaBpkRVaQBZqXXn6ox646U+GMDcsOPwiKQTK4AVOnxzVEDmVQUeqIn+dP1+K81AKS9/Ltm7vZPx0zxilWRLIsYE+zFYzv3I+wCx0Q3BLaomQtPWySVAyuyxyZqo9dxTSxrNDCebzZaE8PIewqvLCQ92yN799EeSMAC8jri2Et4DLe3kkAFOGJ35XMHQjqsiwVncZLdlnojD7CjCd0pDri3R0WYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V20EnNXoxawGGhUkIwB/3oJ24RAPMLd28e9MrLpLQ3E=;
 b=nQrmPkXZJyvotm6Q4lqFXpkChu+ViokT2n40JpDBQKbod4Ju5YJMHhTxoxzddxuNCWvpzS1isb27Gz2HtPX47IegMqWgx42KmgkHlrViuNLmGFOcXY2c/Hokbh/6TLHjBmVKjY0cSN+Mv0btAzX+Hqa+QXL0cad2EmnrmOl7tnsVDKVJuCTSz8RUbxM2YoXyGbYomx5QpkRJ5yrk0+ajToqSD/AYZ3UFctr+/VDgE/siy2YbBg7d4VmFrJ19qEa0617q7EsKWkBGCVpoh3BAR+MeNV18OHzO3H5twi8WmEpzxZ6pT8fZThUiIgOBibOP9lj5F9x+OHsMbK8pak6a/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V20EnNXoxawGGhUkIwB/3oJ24RAPMLd28e9MrLpLQ3E=;
 b=D+OEqLZoyRGMeE96bbLth5uFY2HcqYpm/nGdExEF11XZpJoV/mWA0b/SoW7uzNAVJUMqXx8Ekb8COLMUvm7mqKE8EBTmn2vbsIFrazIlzmaIc8wfwFwsu7A3ObLB2vKAx9U+65RRPaIBwPe2k82GmPCv2fpUUs5FWOm8eUxITNDxcgbDbsKCCU5AG2nIjtrrcGWDGJbpZ9tusWHqDqoGy/4uw/xxOh21X0xqX9pgzjMzfvnhdThuRF3Hfd5JC3qcf5/6tRCD5XWReJcv4/Os4MfznhWj7LvOlhSD4M1kcwPaqPePeh9mboK3Ml9KjeKTg8lep7syLaIOegEj+hyH9Q==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 14:11:02 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 14:11:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "gert.vanhaerents@hotmail.com" <gert.vanhaerents@hotmail.com>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
Thread-Topic: [Nouveau] Kernel problem with multiseat on one card
Thread-Index: AQHaJSIIsvKg2iKZ90y1m3UUReFMuLCWHhwAgAK1wwCAAFlIgA==
Date: Mon, 4 Dec 2023 14:11:02 +0000
Message-ID: <e046050c7e9be5d4f816d33dd1a9dd50e2de3308.camel@nvidia.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
 <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|LV2PR12MB5845:EE_
x-ms-office365-filtering-correlation-id: bf712b7f-25aa-47bd-4e3f-08dbf4d2d8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qogF/w2aPXsD3v72amKmdml5yrjFp4J8IJGyo+30TvSDB4M+JKT91tSBr26KqUI0uixmPlYTZ/6J2nCQFU+4FUqErgTLm7MSKqUjc34N8VU3U0IhcAZkSa6G7tSMZ2ZXmVmcrLXpIX8o86whDSPjYXIZIiyjKKXlJuCCP9R1ruwh5V2ZR1hBfdnRkmSCz7bqgYcTGP8lS4/1X3avXZJsirwIz27gatFYTdhtgcMsnZCrGfqwFEQ6NpTt+fKiE9gkdp+4bCVgIO5U+c1lzB8pe7Wlb0AEuWKCKdY9cEvA4nKN3/7vg0etVxqwxXfqglac1YPGVvPixhZtPW03GY8qUN8+nbMI+MwaUgMCN2T/ID81UUdQ/8Q/lJneAGwDtOddCMWsiFYAjTyV36BIjDlKOgHUIh3L33TI6jkFKK4eD6cfURAHMWLaKjag9ltx7bkJ5exKDb7GLRhGAlHWXIcTynG6sM0Dc2iMaGgO0W4ycynMJJjaXm7XPZJm4C8JWy6OoG/xeporeHfqMeSjLRy+35vTqDvAPsIFf7o7z523ISjFqKfCSyCo4hxe96xkNpzVx58/tRGOu9+ZALI47O2ewhehTY1s9BzlnoGOfwfW1ETl2J5EdZ4PgWNlE3e+MI5m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(478600001)(6486002)(71200400001)(6512007)(6506007)(36756003)(2616005)(316002)(91956017)(110136005)(66476007)(66446008)(64756008)(76116006)(66946007)(66556008)(122000001)(38100700002)(5660300002)(86362001)(2906002)(8936002)(8676002)(4744005)(41300700001)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXRRMkRZdjVEV2VuQTdMMWZ6aVlvMGozY2taTkRFWHNxcmxHL3VJZUdGZDJV?=
 =?utf-8?B?cG5aZTdNdDcxaXV5K01kc29iVzFPNnJTRU9sSFQvbnZxTFRIazFZdWFNTE5L?=
 =?utf-8?B?TWgxN1JxbS9PRFVQdnppKzVGZTBLUXVTYTQ2NGpzMHR6OEtrRVR4R0paa243?=
 =?utf-8?B?bkJucmx3R3diNjhFRnRxUy9yWEhwcTl6WkR3Q0crZmhxaXRHSnZqMCtLeGJU?=
 =?utf-8?B?VDVuSGVnd1ZYb1A2aTlhSFVyWVhUUHVhVlp4RmJJR3ZmbUtockVRNWFhSjdR?=
 =?utf-8?B?S091d0J4MFA0bGdndlRldmltQUJGQkU2cDlVM2wrcHdzYnVSZ3I4aldJRllH?=
 =?utf-8?B?bnU5cWk0MXZiUnRERGRDOStMSTlNbHc3WFZwWE9TNTJiUUdNTW1jWWRYMzJu?=
 =?utf-8?B?UVQ5cXRPRlJIT2tPVVd6VVVTZXZRb0xZcm9FREY2SnM1Q0N2N0ZaU1NRVHZ4?=
 =?utf-8?B?TEpsNHAvVDBWOTJZeWt6U0FqeUY0dDBiYmg3VHhlK2I5RUJtSmdRUTlrWHZi?=
 =?utf-8?B?M24xeHBKcFF1WFdqWXpxNWJNNFl2Wlg1YTNLMlBGakdvWkRSZVFFTlFrV3ZQ?=
 =?utf-8?B?VUt2eXBIdlpodmZ3MzU2ZlV2VDhjempBZVV3ZEZWVmprdjhDR0tvY3ZQWVND?=
 =?utf-8?B?SEc5UXNJdnZoU1pPaUlacG4wdnBkVUZZN1VwTUpEOW5PZW15cnRQdnhDcWZ6?=
 =?utf-8?B?THc4VWU2MkdXN3ZSaE5LRkMwUFVnTDFaNmI0WHpqL2lLSVFBQ3Y5Nm90Z0Jj?=
 =?utf-8?B?R1hwOC9ZdU9VNnE0cXBEejJveGxwZjlTK0dScWYvMUdrYnR3UmhwU2JMVVVC?=
 =?utf-8?B?dzNkaFJrSmN2R3JERFZsR0hxWHVkZ3BnRzVRaS9tL21xR2J2TXl3M293WFFs?=
 =?utf-8?B?RWljdFlNTllMenBYd1NDTVB6WkNnWTVnYVVBbWVYNzJJUlA2K2JWQjVKZmJQ?=
 =?utf-8?B?L0JHM1FQQ29lNmxsUTZWUmJiMWx4aTJSYlZsNitPWDdzN1VYMVFvU2xCbDNH?=
 =?utf-8?B?SFdNSWNpTEhhaFFJeGlmd2ZQVkQwS05EejZDM2tqYmRydTJRWFlaTzBkajE4?=
 =?utf-8?B?WGp5aUNmK0ZrQXVvQ3NnUEc0bGpIckxMZGNSRkRCQ2NjemVTYnl0bkhEVkFv?=
 =?utf-8?B?VEZFbjBZbWM1Z3dCSG9rUnNVTTd4YnI2WExvdVMyZVRtdlI3TUsxdVY1QUtE?=
 =?utf-8?B?UlU1aUtkRWZTSXpvWkRuV2ZxRFFWaXBra3FtcStNUFBrT2xrNVRnNDl1VGxY?=
 =?utf-8?B?Wld0bXVHNU5jR1gvdlV5L3JFMHFMMG04SXJJQnl2a3NvTjJlOUZrNmZBNmpB?=
 =?utf-8?B?N2Q2OFRiV3VFdzZ2MTZ4aVJGTUJYamd6dWx0Vm8zQUVXMXYyZ0JFT2RVRkdK?=
 =?utf-8?B?S3ZvdVV5eWNUSU41RC9IT1RXZGx3RHlPTVJsekhyalNKV1JnMWxIMEtHQy83?=
 =?utf-8?B?VHU5VjBGN1dqQWNTWTN6Y3pNclByNWRteXJBU3ZtemE2NlJHbStPZndHZ2dD?=
 =?utf-8?B?VVJVUUVSTXdGbmU1QkM3U2xpSzhNZnJuTndDZkYzaVBlS0ROcVZsdDhmNVBL?=
 =?utf-8?B?cG40K1k4M3RKNmdackFmRTVTbDVpVnB6ZHB5V3FpekxxL3B3ZzVRMHgyYnZD?=
 =?utf-8?B?SGx5Mi9iNCs0SjFCdHNRTDZJamJPOEdKOU1uMExtK3pBZVhiOWYwMzJndDlJ?=
 =?utf-8?B?ZUdqK0hOcmszOUh3MERLNloyYUNiazVyRTc4NXRGVzBubTlsb25CMVF0Sk9J?=
 =?utf-8?B?SDFKM0JLT0ZnUllUajFSSHlNbXM1Yy9aSDFOcmJra2ozYUZJbEprOWJ2Mzk1?=
 =?utf-8?B?Mm53QU1MbUJUVkZweDFLWHBrWDczUXhkQXZsODl4ZEpuQ2xmbTZwM0VzbGxX?=
 =?utf-8?B?VndRTGJDSmRwMDZJVHYrRE10c3hQdFc3b2xtYlVpTkRCbUxXcmFia3VYU294?=
 =?utf-8?B?WWxvMGhhcTlSWjhoUm4zclIzMTMyQTlQckJZMEdIM3k1SFhyMW1YYzhlVVBa?=
 =?utf-8?B?cmoyMHRWU1VGOUZjTnRuN2JKNlRTbmdIdS9MTVl2K2tOdVJiMzNnM05WL29X?=
 =?utf-8?B?Y3NoZFE4ZXlBa2tmL2RGVGNCN2tZY3RPb2EzU0dubXRBWStZZEdUUm5sTzh6?=
 =?utf-8?Q?P6bURKVxOm09BHA4aQjerElNW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF317C29D6038C4AA24861A44E3BFDD0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf712b7f-25aa-47bd-4e3f-08dbf4d2d8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 14:11:02.1156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvVw9DB4Ud7PmmTKCPAWE/t/Se/Wfoi1f+E//FL1f+h/lLTPI3mzlGFnajQMLFVrMWmbwWpBkK4mTTdebxoFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEyLTA0IGF0IDA5OjUxICswMTAwLCBHZXJ0IFZhbmhhZXJlbnRzIHdyb3Rl
Og0KPiBPS8KgIGkgd2lsbCByZXBvcnQgaXQgdG8gbnZpZGlhLiBCdXQgd2l0aCB0aGUgbm91dmVh
dSBkcml2ZXJzIGl0J3MgYWxzbyBub3QNCj4gd29ya2luZy4gQXJlIHlvdSBzdXJlIGl0J3Mgbm90
IGEga2VybmVsIHByb2JsZW0/IA0KPiBCZWNhdXNlIGFjY29yZGluZyB0byBzeXN0ZW1kIGl0IHdv
dWxkIGJlIGEga2VybmVsIHByb2JsZW0uwqAgKHBlcnNvbmFseSBpIGFtDQo+IGFsc28gdGhpbmtp
bmcgaXQncyBhIGRyaXZlciBwcm9ibGVtKQ0KDQpVbmZvcnR1bmF0ZWx5LCBpdCdzIG5vdCBlYXN5
IGZvciBOb3V2ZWF1IHRvIGRlYnVnIHByb2JsZW1zIHdpdGggR1NQLVJNLiANCkhvd2V2ZXIsIGlm
IHRoZSBwcm9ibGVtIGV4aXN0cyBpbiB0aGUgcHJvcHJpZXRhcnkgZHJpdmVyLCB0aGVuIE52aWRp
YSBjb3VsZA0KZml4IGl0LiAgVGhhdCB3b3VsZCB0aGVuIGxlYWQgdG8gYSBuZXcgdmVyc2lvbiBv
ZiBPcGVuUk0gdGhhdCBOb3V2ZWF1IGNvdWxkDQp1c2UuDQoNCg==
