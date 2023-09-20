Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545857A7112
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 05:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABF010E284;
	Wed, 20 Sep 2023 03:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001.outbound.protection.outlook.com
 (mail-centralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9710E284
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 03:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aur9R72jQM0BjOPo7oHUCJ0fjWD1/7zG4aBsDWOyjtGPjbikadq5U4EadJ+mIxMUdA/b+itkrzZy077D61bmhbuQUeXAp4kmMrQ+80RZwutIrIA2ukbrx2q9r3tcrljxI9RHC8WtrGJjJqBp9ErGpx9qrKwVT8UdbnvuzLkZEWi4mVyF1+zratj8kopHG+K5jVuzi38cMmY83uFTeUDv3WW8QMUTNUP7q2frULHCwkCfvqb2OK+A3SK0S+VzcQwoEO1G/4oYopA423eH48r8koUql5JYPP/kGJkTikclTDdiCgrBZd3WvXKusNdmJFmG7xmutar/QBpQeeFWNgg6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QktPBP2hLK1AskpiJzaaTqVm/YVHrxahWC5v8mBDQnA=;
 b=hS0nH0j79tRHE9Z+xtak07KqTmMuAGZbVRCR2KBlmD6E30Ae8vd9VnRQTnKQugMn1dEnYrcL9o6ltbH6+5w+Ze9uI53F/E9xAGI7CX2O1fr3LLE0UhHRCsSOwgCgfKQE5lBa5/DFpVvo4w/H8Ml/NIJ5LIyBiO85CiykrT59a950bwvV4lNoFIwd9awNO00LiUKbC3QXY4EdffS1cERnyCK6byRgcZ0bX/e76c7biA85rAhIxiaGMppaiwv59ITxeroddmQGUH5SoEFAJVclp0UchhG+zf1L3ueiM69ry21THax92YfUrm++N4mQYHo/8WOL6Zl/WMZv7wu+vM1ltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QktPBP2hLK1AskpiJzaaTqVm/YVHrxahWC5v8mBDQnA=;
 b=if4xLbKESUQDVqEeQFxY5rajh5aPaR0LUY9Dkyv4K2K+hOKxiKnIiJ5gpLJjitJGD4OaW49wx2C/qVzipgpZyhmNf7HUXfj/wbWp0FXAaNkmA699Hfgm6RZWckwjCIGUqg0hzzMr5lRQYTqeqjPHeEB7tbHE5gYVt5Nz0kCiC2U=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by CH3PR05MB9387.namprd05.prod.outlook.com (2603:10b6:610:142::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 03:43:03 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::4d19:99e0:a7e8:2653]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::4d19:99e0:a7e8:2653%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 03:43:03 +0000
From: Zack Rusin <zackr@vmware.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: Decrypting tt maps in ttm
Thread-Topic: Decrypting tt maps in ttm
Thread-Index: AQHZ6eEE7lRDQCR+eU2u2hmQyPQPObAgdNYAgAA4JYCAAATBAIAACr6AgAAWKICAADTmgIAAVUwAgABG2wCAABWFAIAADhmAgAFODoA=
Date: Wed, 20 Sep 2023 03:43:03 +0000
Message-ID: <d61a3236737e13a6a303fd9902cf6938e29cf32d.camel@vmware.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
 <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
 <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
 <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
In-Reply-To: <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|CH3PR05MB9387:EE_
x-ms-office365-filtering-correlation-id: 5be460dd-7455-4c58-f57c-08dbb98bb1ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jH0Fb0mf3pBxU/O7Pkb7Z1X16KXSLYkwkT2GE1KntN67uFoaksL/DAACcu1aACC6sK6q0kpqEaj7QxwaGtDxY2z4GdLbV7w7lGM++3Le4KkkbmdtNp/lv4vsmA/RiKJPLf24+zl1UT1epo9u6qyKUBz9jc07T0L3U6jQ/gHEV/CLvI/ah6HY8eYX0ryNVqa7LSpFO45gUcYLuATZaj7YJA7wsaxevVBMUhH+IDcMFS5m4M+UIqlM+U6GvQSM11Rj2CSn9Hgm6qj9RLlwT2cxstSvOFBcffelHyZ6imp/Dfzq3IF2iB2Ykco8Y3izPmDVeHGdDjufADHiNB4YSha6I5y1uZty2Miw1o/sat+7tmvr3bx8vuV7rwfN+qj04a0dXeVPnC3AhDDUWOwrisXjpKlCZw/WroPyUXb88+aI9xP7y9MjIbGDErInBal3HCxPZ99NSy1nl/RluI+gb7C2DytO+g5kWVd5kjfY6bGtS0wrv9jsM6Dj/pOnYTTIbT69sEE9oUvYdBDEWn6fljF1K8mHIWAMvv8LNm9BmKlc83zYKWUzg4uK4De1sh6chiyXP/3/xJpD6DGH1KTFwa2VofSL4GxdJJ3sM0bbLZPgtgmFvBn6D1MCVjHXpgjQ3sx9CIVZJPxeLattlVfleKl9w4sU7vKpgeU7NFITpZZNg3/NI16iywx7tCu39syu4rcEEFA0Vp9/CqpQJv86JBzBzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(1800799009)(451199024)(186009)(71200400001)(8936002)(478600001)(966005)(41300700001)(83380400001)(5660300002)(66556008)(45080400002)(2906002)(54906003)(4326008)(66946007)(76116006)(64756008)(110136005)(66446008)(316002)(66476007)(8676002)(6486002)(6506007)(53546011)(6512007)(26005)(2616005)(66574015)(36756003)(122000001)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJQNUJIZWpZcmtKYUhjVzBWbWkvVlQrNGduREVUUEtPMG45cmRDT3RPNVla?=
 =?utf-8?B?T29CYUhZRS9uS1IxcXowajlpbWwxRzRsYWlTSSt3Qm1iaG00TG1aYTZUZDVa?=
 =?utf-8?B?SDZBTFlPVE9RM2dJS284R1lkN0owbHZsWnBNU1FDekxKTlZ0Zm1xczFSVS81?=
 =?utf-8?B?aWdUTnl4N0lNdDdlaTB6T1lVYlVEWWxHOTVqV0tieXQ0aEh5MW9BbmRSb2xM?=
 =?utf-8?B?dm42VUdxOE5DbG5ISlgvelRoUy9NM3p4dEg0MlZuT0twZG93MTlDaWw0QjZy?=
 =?utf-8?B?cFc1SmxkcTRVa0dBV3lEbExIRzBuazRhdDY3Rjd6V013RTdlRjlWVXlvNXdB?=
 =?utf-8?B?bVNwWFh1UzlUYWFJbTloWDFuUFhETWxKUDZoTms5alFhZERueGtxakdCb0NL?=
 =?utf-8?B?RVkwTWMzVE92UWZWaWFoZUpXOWI0dUxWTFpsNHNCNEx6YzdJV1RwYVlJMXk0?=
 =?utf-8?B?dkhtMitDeSs0UUZpa0R4Q3FtMktOK1VQVkdpWjZOVllwOGdBem9BYVVBS0dI?=
 =?utf-8?B?eEtWb1FwR0JSVHh6M2szUkJJd2crUGwxQlpmaklwS1pkOGVWU3U0MnVGWmoy?=
 =?utf-8?B?cFZ4VUZGUVpKRFZXbUVkQ1JQT1lEN2xIUk9uSkVtMTgxOFkybHdVd2dSL1Vr?=
 =?utf-8?B?eE1UV2t1WDErcU1DNFFGK1cyVVRQdUU2RGc4Z2VSSWowYWoxckM5ZjFjZEtp?=
 =?utf-8?B?Rm53Qy9iWXNDeE9CMDVHQ0ljNytNN2luRE50Zllkd0dPc0x6YVpUbGpzUE5r?=
 =?utf-8?B?VDM1TUJBZVgySUJtMlJzRWprSXluNDQwTHppUkg1TlJnYUpncENSRWJnVmFL?=
 =?utf-8?B?US9kczM5TzNUTFgySW5VRGZQNStjeThzYzQ3ZjRuQ2sxcFJ4TGl0dUtVSTc4?=
 =?utf-8?B?Y3hIY255WEdaZUpnY3JybzRUS1V4aWVDMjFxclhaOFZwa1NGdWpkU3M2Mk4w?=
 =?utf-8?B?aDl0R2RpQkVReWIyaW5FdFZOaDNPR2pHazB5aUZMVm4vWnBNbkpvU1dTK2pa?=
 =?utf-8?B?dmFrNEVVTDY1dk1kOGx1Q2s2L2s1RFdLUkkwa01kSzlJOVJ3N2dWQ1E4REQr?=
 =?utf-8?B?NzBlZmVOSlRmb3Fsb29raHpTM0hhMHViYXN0SHF2OW5TZjByTFNyUFZ0VHNx?=
 =?utf-8?B?LzhpaUlxY01ud1dCMjd5bmRwdDVVOElxYnZyOU4vY1k3dytzZ3VTWTdEQzYw?=
 =?utf-8?B?U09QK2lwbU01RjZFelI1WU1GY0xlU2tkckZ5WnVuSGhzNjRJMCtUOWpuWmtS?=
 =?utf-8?B?dXBpVnJ6c0RMaXNGb3piQTNxbFFGdVlMdzlBdWRPUWZYbVo3RktaY2JyTXFT?=
 =?utf-8?B?SXJUOFd2TGVtaC8vb3AyRDRxNWpEV0txL2pCci9UL3A5TllzSWR0RmhMTmpx?=
 =?utf-8?B?U25scEFtWmcrRGZoTzJLelpTbkxZY3EzWHh5ckpnUG5rQTZUcVNnWG9rMCty?=
 =?utf-8?B?d1FnQVQraWtsdk4zQzhxbjFZbWtFWmFlckxOTDlmUWoyWFlleWZreUYzWlBl?=
 =?utf-8?B?QU5yb0hiOTg3RldZMTFPcWFSWnZyeUNML0VGbkh1dGFBcmMraTE1WEFMRmN5?=
 =?utf-8?B?dllMTWM5TEtQUUxMbnpwSWJxNDFCV2NKUVhXZ1B0MXI3ZkZxMTJXRnphVmNy?=
 =?utf-8?B?b25SRWJyTEJzc0QxTFVvZEhoS0l2UGFIMWJtMVl5amsvVWx2L1JmaVcrUWU4?=
 =?utf-8?B?U3NMd0h3eCtmZTdwMTFBbE5Id3FLZEl1ZTkvbmkvRk1iNVRuUDR4bTFBVkk5?=
 =?utf-8?B?WkQxS0RhV0tmamlqdWFyV0k3dllGZWkrQTN1YnkyN2Y4TzczQ1R0U0ZXWnpJ?=
 =?utf-8?B?K3RLUTgzeGNqZlF1RDUxdDdXSHVCTVkwc0ppRVhicmlGZVJmYVR6T0ljblNF?=
 =?utf-8?B?aXJ5OFQ4YXRQdWg1a2tDTVNTU1phOWxnZFpPR24xdVAwZDhIWDU3TW5SMFhz?=
 =?utf-8?B?dXRvWkJIMUY1MTlKeUExUXZuNHVkOGlGRHMrbmRmSElQRWQ4N2J1dS9VSFJN?=
 =?utf-8?B?ZmJMc1pleEFaT05hUkJ6VkhZR29ZczViSkd6MUo3ZHIzSm5pR1VKMTdlR1Zh?=
 =?utf-8?B?WUplZGtGMi9oVklVa1BCekZkR0dzZ3pWSVZvNzBRbFl3TlByZE1SeDNoVS9i?=
 =?utf-8?Q?B7kn2DYpwc+cFW35ZSu7LIYAV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF9D8F089A37FE4A90E259C5015A116E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be460dd-7455-4c58-f57c-08dbb98bb1ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 03:43:03.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7LlTKO/AWnjdajqT+UiP38WXU3eD9wqHxu7sBet5drKBOuGtIBGbJN94daFm9Om7XC1x2snoBe9tlp4Ex38Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR05MB9387
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDA5OjQ3ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAhISBFeHRlcm5hbCBFbWFpbA0KPg0KPiBBbSAxOS4wOS4yMyB1bSAwODo1NiBzY2hyaWVi
IFRob21hcyBIZWxsc3Ryw7ZtOg0KPiA+DQo+ID4gT24gOS8xOS8yMyAwNzozOSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToNCj4gPiA+IEFtIDE5LjA5LjIzIHVtIDAzOjI2IHNjaHJpZWIgWmFjayBS
dXNpbjoNCj4gPiA+ID4gT24gTW9uLCAyMDIzLTA5LTE4IGF0IDE2OjIxIC0wNDAwLCBBbGV4IERl
dWNoZXIgd3JvdGU6DQo+ID4gPiA+ID4gISEgRXh0ZXJuYWwgRW1haWwNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDM6MDbigK9QTSBUaG9tYXMgSGVsbHN0csO2
bQ0KPiA+ID4gPiA+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gOS8xOC8yMyAxNzo1MiwgWmFjayBSdXNpbiB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gT24gTW9uLCAyMDIzLTA5LTE4IGF0IDE3OjEzICswMjAwLCBUaG9t
YXMgSGVsbHN0csO2bSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+IE9uIDkvMTgvMjMgMTY6NTYsIFRob21hcyBIZWxsc3Ryw7ZtIHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gSGkgWmFjaywgQ2hyaXN0aWFuDQo+ID4gPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gT24gOS8xOC8yMyAxMzozNiwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gSGkgWmFjaywNCj4gPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gYWRkaW5nIFRob21hcyBhbmQgRGFuaWVsLg0KPiA+ID4g
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBJIGJyaWVmbHkgcmVtZW1iZXIgdGhh
dCBJIHRhbGtlZCB3aXRoIFRob21hcyBhbmQgc29tZSBvdGhlcg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBwZW9wbGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gYWJvdXQgdGhhdCBxdWl0ZSBhIHdoaWxlIGFn
byBhcyB3ZWxsLCBidXQgSSBkb24ndCBmdWxseQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiByZW1lbWJl
ciB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gb3V0Y29tZS4NCj4gPiA+ID4gPiA+ID4gPiA+IEZv
dW5kIG9uZSBvbGQgdGhyZWFkLCBidXQgZGlkbid0IHJlYWQgaXQ6DQo+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2
ZXMvZHJpLWRldmVsLzIwMTktU2VwdGVtYmVyLzIzNDEwMC5odG1sDQo+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiAvVGhvbWFzDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiBVZ2guIE5vdyBzdGFydGluZyB0byByZWFkIHRoYXQgdGhyZWFkIEkgaGF2ZSBhIHZh
Z3VlDQo+ID4gPiA+ID4gPiA+ID4gcmVjb2xsZWN0aW9uIGl0IGFsbA0KPiA+ID4gPiA+ID4gPiA+
IGVuZGVkIHdpdGggbm90IHN1cHBvcnRpbmcgbWFwcGluZyBhbnkgZGV2aWNlIHBhZ2VzIHdoYXRz
b2V2ZXINCj4gPiA+ID4gPiA+ID4gPiB3aGVuIFNFVg0KPiA+ID4gPiA+ID4gPiA+IHdhcyBlbmFi
bGVkLCBidXQgcmF0aGVyIHJlc29ydGluZyB0byBsbHZtcGlwZSBhbmQgVk0tbG9jYWwgYm9zLg0K
PiA+ID4gPiA+ID4gPiBIaSwgVGhvbWFzLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBU
aGFua3MgZm9yIGZpbmRpbmcgdGhpcyEgSSdkIChvZiBjb3Vyc2UpIGxpa2UgdG8gc29sdmUgaXQN
Cj4gPiA+ID4gPiA+ID4gcHJvcGVybHkgYW5kIGdldA0KPiA+ID4gPiA+ID4gPiB2bXdnZngNCj4g
PiA+ID4gPiA+ID4gcnVubmluZyB3aXRoIDNkIHN1cHBvcnQgd2l0aCBTRVYtRVMgYWN0aXZlIGlu
c3RlYWQgb2YgZXNzZW50aWFsbHkNCj4gPiA+ID4gPiA+ID4gZGlzYWJsaW5nDQo+ID4gPiA+ID4g
PiA+IHRoZQ0KPiA+ID4gPiA+ID4gPiBkcml2ZXIgd2hlbiBTRVYtRVMgaXMgYWN0aXZlLg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBJIHRoaW5rIHRoZXJlIGFyZSB0d28gc2VwYXJhdGUg
ZGlzY3Vzc2lvbnMgdGhlcmUsIHRoZQ0KPiA+ID4gPiA+ID4gPiBub24tY29udHJvdmVyc2lhbCBv
bmUNCj4gPiA+ID4gPiA+ID4gYW5kIHRoZQ0KPiA+ID4gPiA+ID4gPiBjb250cm92ZXJzaWFsIG9u
ZToNCj4gPiA+ID4gPiA+ID4gMSkgVGhlIG5vbi1jb250cm92ZXJzaWFsOiBpcyB0aGVyZSBhIGNh
c2Ugd2hlcmUgZHJpdmVycyB3b3VsZA0KPiA+ID4gPiA+ID4gPiB3YW50IGVuY3J5cHRlZA0KPiA+
ID4gPiA+ID4gPiBtZW1vcnkNCj4gPiA+ID4gPiA+ID4gZm9yIFRUIHBhZ2VzIGJ1dCBub3QgZm9y
IGlvIG1lbSBtYXBwaW5ncz8gQmVjYXVzZSBpZiBub3QgdGhlbiBhcw0KPiA+ID4gPiA+ID4gPiBD
aHJpc3RpYW4NCj4gPiA+ID4gPiA+ID4gcG9pbnRlZA0KPiA+ID4gPiA+ID4gPiBvdXQgd2UgY291
bGQganVzdCBhZGQgcGdwcm90X2RlY3J5cHRlZCB0byB0dG1faW9fcHJvdCBhbmQgYmUNCj4gPiA+
ID4gPiA+ID4gZXNzZW50aWFsbHkgZG9uZS4NCj4gPiA+ID4gPiA+ID4gVGhlDQo+ID4gPiA+ID4g
PiA+IGN1cnJlbnQgbWV0aG9kIG9mIGRlY3J5cHRpbmcgaW8gbWVtIGJ1dCBsZWF2aW5nIHN5cyBt
ZW0gbWFwcGluZ3MNCj4gPiA+ID4gPiA+ID4gZW5jcnlwdGVkIGlzDQo+ID4gPiA+ID4gPiA+IGEg
Yml0DQo+ID4gPiA+ID4gPiA+IHdlaXJkIGFueXdheS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gSWYgdGhlIGFuc3dlciB0byB0aGF0IHF1ZXN0aW9uIGlzICJ5ZXMsIHNvbWUgZHJpdmVy
IGRvZXMgd2FudCB0aGUNCj4gPiA+ID4gPiA+ID4gVFQgbWFwcGluZ3MNCj4gPiA+ID4gPiA+ID4g
dG8gYmUNCj4gPiA+ID4gPiA+ID4gZW5jcnlwdGVkIiB0aGVuIHlvdXIgIltQQVRDSCB2MiAzLzRd
IGRybS90dG0sIGRybS92bXdnZng6DQo+ID4gPiA+ID4gPiA+IENvcnJlY3RseSBzdXBwb3J0DQo+
ID4gPiA+ID4gPiA+IHN1cHBvcnQNCj4gPiA+ID4gPiA+ID4gQU1EIG1lbW9yeSBlbmNyeXB0aW9u
IiBzb2x2ZXMgdGhhdC4gSSB0aGluayBnZXR0aW5nIG9uZSBvZiB0aG9zZQ0KPiA+ID4gPiA+ID4g
PiB0d28gaW4gbWFrZXMNCj4gPiA+ID4gPiA+ID4gc2Vuc2UNCj4gPiA+ID4gPiA+ID4gcmVnYXJk
bGVzcyBvZiBldmVyeXRoaW5nIGVsc2UsIGFncmVlZD8NCj4gPiA+ID4gPiA+IFdlbGwsIHRoZXJl
IGlzIG1vcmUgdG8gaXQgSSB0aGluay4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJSVJDLCB0
aGUgQU1EIFNNRSBlbmNyeXB0aW9uIG1vZGUgaGFzIGEgd2F5IGZvciBhIGRldmljZSB0byBoYXZl
IHRoZQ0KPiA+ID4gPiA+ID4gbWVtb3J5IGNvbnRyb2xsZXIgKD8pIGVuY3J5cHQgLyBkZWNyeXB0
IGRldmljZSB0cmFmZmljIGJ5IHVzaW5nIGFuDQo+ID4gPiA+ID4gPiBhZGRyZXNzIHJhbmdlIGFs
aWFzLCBzbyBpbiB0aGVvcnkgaXQgc3VwcG9ydHMgZW5jcnlwdGVkIFRUIHBhZ2VzLCBhbmQNCj4g
PiA+ID4gPiA+IHRoZSBkbWEtbGF5ZXIgbWF5IGluZGVlZCBoYW5kIGVuY3J5cHRlZCBETUEgcGFn
ZXMgdG8gVFRNIG9uIHN1Y2gNCj4gPiA+ID4gPiA+IHN5c3RlbXMNCj4gPiA+ID4gPiA+IGRlcGVu
ZGluZyBvbiB0aGUgZGV2aWNlJ3MgRE1BIG1hc2suIFRoYXQncyB3aHkgSSB0aGluayB0aGF0DQo+
ID4gPiA+ID4gPiBmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoKSBleHBvcnQgd2FzIG5lZWRlZCwgYW5k
IElmIHRoZSBhbWRncHUgZHJpdmVyDQo+ID4gPiA+ID4gPiBhY2Nlc3NlcyBUVCBtZW1vcnkgaW4g
U01FIG1vZGUgKndpdGhvdXQqIHBncHJvdF9kZWNyeXB0ZWQoKSBhbmQgaXQNCj4gPiA+ID4gPiA+
IHN0aWxsDQo+ID4gPiA+ID4gPiB3b3JrcywgdGhlbiBJIHRoaW5rIHRoYXQgbW9kZSBpcyBhY3R1
YWxseSB1c2VkLiBIb3cgY291bGQgaXQNCj4gPiA+ID4gPiA+IG90aGVyd2lzZSB3b3JrPw0KPiA+
ID4gPiA+IEZvciBTTUUsIGFzIGxvbmcgYXMgdGhlIGVuY3J5cHRlZCBiaXQgaXMgc2V0IGluIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzDQo+ID4gPiA+ID4gdXNlZCBmb3IgRE1BLCB0aGUgbWVtb3J5IGNv
bnRyb2xsZXIgd2lsbCBoYW5kbGUgdGhlIGVuY3J5cHQvZGVjcnlwdA0KPiA+ID4gPiA+IGZvciB0
aGUgZGV2aWNlLiAgRm9yIGRldmljZXMgd2l0aCBhIGxpbWl0ZWQgZG1hIG1hc2ssIHlvdSBuZWVk
IHRvIHVzZQ0KPiA+ID4gPiA+IHRoZSBJT01NVSBzbyB0aGF0IHRoZSBlbmNyeXB0ZWQgYml0IGlz
IHJldGFpbmVkIHdoZW4gdGhlIGFkZHJlc3MgaGl0cw0KPiA+ID4gPiA+IHRoZSBtZW1vcnkgY29u
dHJvbGxlci4NCj4gPiA+ID4gSG93IGRvZXMgdGhhdCB3b3JrIG9uIHN5c3RlbXMgd2l0aCBzd2lv
dGxiLCBlLmcuIHN3aW90bGI9Zm9yY2UsIG9yDQo+ID4gPiA+IGkuZS4gd2hhdCB3b3VsZA0KPiA+
ID4gPiBkZWNyeXB0IHRoZSB0dG0gdHQgbWFwcGluZ3Mgd2hlbiBjb3B5aW5nIGJldHdlZW4gc3lz
dGVtIGFuZCB2cmFtDQo+ID4gPiA+IHdoZW4gaW9tbXUgaXMNCj4gPiA+ID4gZGlzYWJsZWQvYWJz
ZW50Pw0KPiA+ID4NCj4gPiA+IFNNRSBtYWtlcyBpdCBtYW5kYXRvcnkgdGhhdCBhbGwgZGV2aWNl
cyBjYW4gaGFuZGxlIHRoZSBwaHlzaWNhbA0KPiA+ID4gYWRkcmVzcyB1c2VkIGZvciBETUEsIGVp
dGhlciBuYXRpdmUgb3Igd2l0aCB0aGUgaGVscCBvZiBJT01NVS4NCj4gPiA+DQo+ID4gPiBIYWNr
cyBsaWtlIFNXSU9UTEIgYXJlIG5vdCBkaXJlY3RseSBzdXBwb3J0ZWQgYXMgZmFyIGFzIEkga25v
dy4gTWF5YmUNCj4gPiA+IHNvbWVob3cgU1dJT1RMQiBtYW51YWxseSBkZWNyeXB0cyB0aGUgZGF0
YSB3aGlsZSBjb3B5aW5nIGl0IG9yDQo+ID4gPiBzb21ldGhpbmcgbGlrZSB0aGlzLCBidXQgSSdt
IG5vdCAxMDAlIHN1cmUgaWYgdGhhdCBpcyBhY3R1YWxseQ0KPiA+ID4gaW1wbGVtZW50ZWQuDQo+
ID4gPg0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IENocmlzdGlhbi4NCj4gPg0KPiA+IEEgYm9sZCBn
dWVzcyBhZnRlciBsb29raW5nIGF0IHZhcmlvdXMgY29kZSBhbmQgcGF0Y2hlczoNCj4gPg0KPiA+
IDEpIERldmljZXMgdW5kZXIgU01FIHRoYXQgZG9uJ3Qgc3VwcG9ydCB0aGUgZW5jcnlwdGlvbiBi
aXQgYW5kIFNFVjoNCj4gPiBhKSBDb2hlcmVudCBtZW1vcnkgaXMgdW5lbmNyeXB0ZWQuDQo+ID4g
YikgU3RyZWFtaW5nIERNQSB1bmRlciBJT01NVTogVGhlIElPTU1VIHNldHMgdGhlIGVuY3J5cHRl
ZCBiaXQuDQo+ID4gYykgU3RyZWFtaW5nIERNQSB3aXRoIFNXSU9UTEI6IFRoZSBib3VuY2UgYnVm
ZmVyIGlzIHVuZW5jcnlwdGVkLg0KPiA+IENvcHlpbmcgdG8vZnJvbSBib3VuY2UtYnVmZmVyIGRl
Y3J5cHRzL2VuY3J5cHRzLg0KPiA+DQo+ID4gMikgRGV2aWNlcyB1bmRlciBTTUUgdGhhdCBkbyBz
dXBwb3J0IHRoZSBlbmNyeXB0aW9uIGJpdCAod2hpY2ggSQ0KPiA+IGJlbGlldmUgaXMgbW9zdCBn
cmFwaGljcyBkZXZpY2VzIGluIGdlbmVyYWwgb24gU01FIHN5c3RlbXMsIG5vdCBqdXN0DQo+ID4g
YW1kZ3B1OyBpdCAianVzdCB3b3JrcyIpDQo+ID4gKikgQ29oZXJlbnQgbWVtb3J5IGlzIGVuY3J5
cHRlZC4gVGhlIERNQSBsYXllciBzZXRzIGRtYSBhZGRyZXNzZXMgYW5kDQo+ID4gcGdwcm90IGFj
Y29yZGluZ2x5Lg0KPiA+ICopIFN0cmVhbWluZyBETUEgaXMgZW5jcnlwdGVkLg0KPiA+DQo+ID4g
U28gdGhlIGJ1ZyBpbiBUVE0gd291bGQgdGhlbiBiZSBpdCdzIG5vdCBoYW5kbGluZyAxYSkgYW5k
IDFiKSBjb3JyZWN0bHkuDQo+ID4NCj4gPiBSZW1lZHk6DQo+ID4gMWIpIFNob3VsZG4ndCBiZSB1
c2VkIHdpdGggZW5jcnlwdGlvbi4NCj4gPiAxYSkgVGhpcyBpcyB3aGF0IHdlIHNob3VsZCB0cnkg
dG8gZml4LiBFeHBvcnRpbmcNCj4gPiBkbWFfZm9yY2VfdW5lbmNyeXB0ZWQoKSBkaWRuJ3Qgc2Vl
bSB0byBiZSBhIHdheSBmb3J3YXJkLiBQcm9wZXJseQ0KPiA+IGZpeGluZyB0aGlzIHdvdWxkLCBJ
IGd1ZXNzLCBtZWFuIGltcGxlbWVudCB0aGUgbWlzc2luZyBmdW5jdGlvbmFsaXR5DQo+ID4gaW4g
dGhlIGRtYSBsYXllcjogRm9yIHZtYXAgLyBrbWFwIHdlIGNvdWxkIHNpbXBseSByZXVzZSB0aGUg
dmlydHVhbA0KPiA+IGFkZHJlc3NlcyB3ZSBnZXQgYmFjayBmcm9tIGRtYV9hbGxvY19jb2hlcmVu
dCgpLCBidXQgZm9yIGZhdWx0aW5nIG9uZQ0KPiA+IHdvdWxkIHdhbnQgc29tZXRoaW5nIGxpa2Ug
ZG1hX2NvaGVyZW50X2luc2VydF9wZm4oKSAoaWYgaXQgZG9lc24ndA0KPiA+IGV4aXN0IGFscmVh
ZHkpIGFmdGVyIGEgcHJvcGVyIGRpc3Vzc2lvbiB3aXRoIENocmlzdG9waCBIZWxsd2lnLg0KPg0K
PiBDaHJpc3RvcGggb25jZSBwb2ludGVkIG1lIHRvIGRtYV9tbWFwX2F0dHJzKCkgZm9yIHRoaXMs
IGJ1dCBJIG5ldmVyDQo+IGZvdW5kIHRoZSB0aW1lIHRvIGZ1bGx5IGxvb2sgaW50byBpdC4NCg0K
SG1tLCB5ZWEsIHRoYXQgd291bGQgbWFrZSBzZW5zZQ0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9rZXJuZWwvZG1hL2RpcmVjdC5jI0w1NjQNClJlcGxhY2lu
ZyB0aGUgdm1hcCdzIHdpdGggZG1hX21tYXBfYXR0cnMgd291bGQgcHJvYmFibHkgZml4IHRoaXMs
IGJ1dCBpdCB3b3VsZA0KcmVxdWlyZSBhIGJpdCBvZiBleHRyYSBzZXR1cC4NCg0KU28gd2UncmUg
c2F5aW5nIHRoYXQgeWVzLCB3ZSBkb24ndCB3YW50IHVuY29uZGl0aW9uYWwgcGdwcm90X2RlY3J5
cHQgaW4gdHRtX2lvX3Byb3QuDQpXZSdkIGxpa2UgdG8gbGVhdmUgdGhvc2UgdHQgbWFwcGluZ3Mg
YXMgZW5jcnlwdGVkIHdoZW4gcG9zc2libGUgYW5kIGluc3RlYWQgbWF5YmUNCmFkZCBhIHZhZGRy
IHRvIHR0bV90dCAob3IgZXh0cmFjdCBpdCBmcm9tIHRoZSBwYWdlcy0+cHJpdmF0ZSB2aWEgdGhl
ICB0dG1fcG9vbF9kbWEsDQpidXQgdGhhdCBzZWVtcyByYXRoZXIgdWdseSksIHBsdXMgYWRkIGdl
dF92bV9hcmVhKCkgdG8gYmUgYWJsZSB0byB1c2UgZG1hX21tYXBfYXR0cnMNCmluc3RlYWQgb2Yg
dm1hcCB3aGVuIHVzZV9kbWFfYWxsb2MncyBpcyB0cnVlIGluIHR0bV9ib192bWFwL3R0bV9ib19r
bWFwPw0KDQp6DQoNCg0K
