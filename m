Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448016A153C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 04:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF710E06F;
	Fri, 24 Feb 2023 03:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD2E10E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 03:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeeF3hgeUerpMWN4f1FfUqGQcGFzeVCIQQIrUUYzWOjXW+aSy1Y3DUObeLbr0GXaQGDDLEYMO9KzIdbdaJHgaLZvnI9X/Wf37W7YcHVXksBc3bG+jcvOFu0CirlJucxfcAXs5Vxy9M99u6Fin3Cpgp7mXdMGD2ZoWwYLxiY928OWj0aVJQpv3QwXHgqXREgfRuq44iUDbEwCzhz0apLSZeUw5af9JgJVWqEXM3kb3UWcdZeTsWL48Aql3+kWpDFV8pwsPpRMMGYmK3DDPVoVyv6yrQOE/Z6WqIHBCTDS8gj4DvOsszAWrQ6tgSecTnwILYNVbcIiS5lc/KJAeFKm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz+jlTZYhJ8p4ZIC9Z1PYKo36wrq2vXLSLZLsRn9v4o=;
 b=n3HMxGn6D0/oMqjIyBQ8EK6N+E5xISeYR0z9iT/CKodKLb0LnLag1L6HmymyJcdqrORqxDC0KKiftZf+GFgGJPq52tp5sKBFR5v78RBXZdqkc3IkqX5A/3qGSVUEYK4lS17YU7x/EQbVp7aSbCyOVXZCQ5Q5gAl2MNQOth31OaUp9Cb4DZ7ID4Ge3hQKhPdLfwGXtUQ9DPyi68OWEr6YnmDGIzEfdUoWTy75NFrZ9VeSgtMcakrg3aDFGwVMXA2AdC6+WD3uqNQnLKArTsvwJtpddxJ+C2yH2uEF4XyK9FuJIkn/CZXLodgEhKiZ23me6PQWZJLLmYsVk8d8O+8pbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz+jlTZYhJ8p4ZIC9Z1PYKo36wrq2vXLSLZLsRn9v4o=;
 b=FW4q3PgZZ63TBhR77LSrHdbkyd/7Kr1xFPjIBhjbQ59HBnmzluYQ5YrGhmpqeD3g1eop7hhMY1fkseYdjsYa/kFlUcKgsKeZgNpWoK3WZQjx5DXZOrs/UKjFrOSeK5DBU1srgPCrnYgnnBkhlYs6kBxqah5qBjWCN25YilFEdM8=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by DM6PR05MB6074.namprd05.prod.outlook.com
 (2603:10b6:5:11c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 03:13:09 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 03:13:09 +0000
From: Zack Rusin <zackr@vmware.com>
To: "tangmeng@uniontech.com" <tangmeng@uniontech.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Topic: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Index: AQHZR1Unjoj41030h0yn+mDWgyFFg67cfB+AgADptICAAAdYAA==
Date: Fri, 24 Feb 2023 03:13:09 +0000
Message-ID: <2bc1750b4c3ebebf84c106b903178e5236dc396e.camel@vmware.com>
References: <20230223070405.20228-1-tangmeng@uniontech.com>
 <c5ba07a5ad3c6b101126a97eb094c51013ee83c0.camel@vmware.com>
 <113C6E516C95FA38+f2633fe9-fb5a-616e-0e35-7559750544c9@uniontech.com>
In-Reply-To: <113C6E516C95FA38+f2633fe9-fb5a-616e-0e35-7559750544c9@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|DM6PR05MB6074:EE_
x-ms-office365-filtering-correlation-id: 693430b5-836d-43b6-f868-08db16150e4b
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRyfAKfJFUYdirEHIBkxKWBn/lwuS2zhY2nYKWKqxi/WIjJO0I893b+877xDYMY5YuKPbnx7YRWCUPLwsxDc48tEwcrZ8ixwBiFZlDu0/m68FQEsEwCFeJ0pBNaNiegCSe5KZA7M8fo9mAy5cUMbemMBEcGwEd6sv8wh9FP7JtyjvlBY91SoSihilTB0StsxIo2tYNDGzLmImvwtLZWcJrSR7naQMA3RsM7yPg7tXjwhAYtuMILedwxL5VvqkgNIitx8oVE7pR2eXFDFNse7/ae4u6LRP4v7XG/5lxqOhKrQRgiYEafmrizlKcarTbPRwjtSmmgcd5uM88VJdJdEpRfgv1xcypnMrj4rw6Yopp4Bu1g+49XGInTO4/C4GFMLKy5NZdivLOhvsuSMjSMKH1QyIGoHQAznYJKXR/RaBAggH+66zLzmSyZ0XlSIx171BDAOlxi7pyFc5SIkHXXs3KC1TrTdGl9zB5Ohi52diua9KT6MOXp6hIaWKiafd4NE3SvtIt0xAACf6xvHxWjoOYJyGeeT/RznQt+Phsm8lhqqOhiAe9i3QKd1xtsziXYgzdU6EcuthgI5Bc9Ps7BYrymoLk0yKMWzdbHBZE7Ys6I8ImwE0ge47ub3+NQ9jvRbwDkFs386gLpzGjQLvdWkw2ZeggLigFxi87/o/xsRJBqQqHvlk9pcsjViqT2pk2BtOv9qWvWX4rgvYISArSkjsORkP8t0qkh5cPFLRkGlNDp2UnO+tIM5hAOFGtvjKJ/H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199018)(83380400001)(26005)(110136005)(36756003)(316002)(6486002)(6512007)(53546011)(6506007)(71200400001)(478600001)(2616005)(186003)(8936002)(38100700002)(86362001)(38070700005)(5660300002)(2906002)(91956017)(66556008)(41300700001)(122000001)(76116006)(66946007)(8676002)(64756008)(66446008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TURxc3E5ZjBKaEJmWjdUY0tVLzJLQ3lpa3N5N2RwNFJkbEQ3bHpyb2J2MjZC?=
 =?utf-8?B?THhUbFU3UWZQSGFHSHBMcmRma1UzQVNIUFNac0VtWlV4OFNVT2N2MFNNRnY1?=
 =?utf-8?B?Zk5Eb3Y4Yy9SMGpSR2ttVVVrZTZFQ01mUlo5OWJXZ0lBMkc1eW9mZXN5Tld6?=
 =?utf-8?B?aFd5bjRiZlowN3JsQ29HV1F2M2JxSHBmc0FoTTdmSTFNMEJNR0tja0luYmM2?=
 =?utf-8?B?cWMxZlFZakF0Z3M5NnpOOFRxVlhWbUtXVUNDeEVsTzBnZnk2ZG5tdnJ3Mmla?=
 =?utf-8?B?NXRxMlQ1QXo5WXhyZmgvQ0FTL2VLOWNubE1FaGlKVDBCb3NBNERYZit3aVN3?=
 =?utf-8?B?TjBEdS9hSzdBS1JoVzYzSGt3d0pBZ1hrb3d3SE15KzBuU2RPbk1ueE54Nm9U?=
 =?utf-8?B?RXhxak1PN3JZZ1pMMTliMVV2T2J2Uy9WSjdOUWpEVmRrdU9UQlNqT2txRVEv?=
 =?utf-8?B?bUk1aUZFa2xnN2pLTDZOK0lvQStvVnFFbTEzY1JrWHdHRkJUcWlBYUMycHJu?=
 =?utf-8?B?VldvandKeE0rb0tsM3I5VXc3ZDdvdE9hYkVRS2FIemR6eHExV2FzTUdHV1Rt?=
 =?utf-8?B?aTR3MllEUlRTYXZ0VDNZK05HNkxsemNxdUhhbHh2Ung2QWswRGRCT1FNaGo0?=
 =?utf-8?B?Tyt0ZEwyc1NsL3hnVDB2Z29JZlZiV2xMcCtHVkVVUVFIY1l1TS9tSzVXNDJY?=
 =?utf-8?B?RWM5R3dnMkNEcUMzSG1lb3dsa3dUaWRMUjNxbWZkTVJrM2xhTTluMHdUY01E?=
 =?utf-8?B?S2lXTUNwM0RqQkhuTzNUUWI4cXNIUHM4MXY1Y0dITEw1MHpJSHBpVEFsellO?=
 =?utf-8?B?cUlaRFNmajh5azVwWkdyWkJCUE1tWDBJM1FhZWErRnJvc002RHRRR1Y1VTgx?=
 =?utf-8?B?bktKRWNmdXFZOE91TUZrYkhleTVZWXF2OTFYRGpFOE5pNFJ0YmZnK0E0OWUx?=
 =?utf-8?B?NE5pSjM3c2MxanppNDBlOE93M3NvNXUzWGtLcGhjRllEUm4zMFRZVUFoWnRl?=
 =?utf-8?B?ZFdhbjllTXJVYjFUazZKVk9xTUxacEdNaFNpNHc0WVBQbVFFS25RbVpkZ1NR?=
 =?utf-8?B?bXR0NlR6NFZLKzVBZEdTZWZJQWxRN2djVnN1Vnl4dVlCQy9hUlU5akk0Zitu?=
 =?utf-8?B?bVkwK1hidmtsZlFFZ3hkcTNYcHZmWE9OMGpLMWx1VUFTSCt2VmJHc1FDaUk5?=
 =?utf-8?B?OU1KRW1RV3hTdVRzV2YyVWtwSDczeTdLVlFWbmpPU1g5b09ZSGZ2SE90QVEr?=
 =?utf-8?B?N05DK0xsM2haaDJGa0x0WkZIalVqeFdnZDk1U1FIbkE2V2wrMFNQU0tWakNm?=
 =?utf-8?B?WDFPaHJ6YVdqSVdpMGN4V3FwVGR0b05mK29uemxVcXpoWXdZZy9EQ3JpMmR6?=
 =?utf-8?B?UGpJTG9MY0hiWGZYaHhiWVhnaXY0emlNeHdkWDdVZitRNjQxdHVZK2ZNRURW?=
 =?utf-8?B?bTdRaWNnempUVjZRZFJSMnB3ZW9BanpJcTZtcDh2elg2b3VuQ2VJbWdIVjJP?=
 =?utf-8?B?UndjbzdjcFBacFppSTdCNmsvTmlTdTIzak1XRmt2MjNWRnBRbm9yT3J4SWhT?=
 =?utf-8?B?eFdPOEIzMlNJa3pOMEdkRjE1Smd2b3dHQmNhbWI3ZHZaQWxYT21ZM3JjQ0RC?=
 =?utf-8?B?bUxqUGpWaktpcmR3MzNUcG05OVdmN1JYTlBRVkJ2NVR2S20zRGRQRTZwKzRW?=
 =?utf-8?B?SWIyK3JRSDRkQzhsTUxaZU9ScGtsemM1ck9RbXBnM3hIM0krNHh4djVxd0RO?=
 =?utf-8?B?WUJPbEptMVkydklValA0dTdFSGRBbEE2bG9LNDN5UTdWV0N5ZGM3RkZPUWVj?=
 =?utf-8?B?eFJzVUZKKzRuRlA2NXV3V0ZoVTJxRGJQUldodzlndGI4Qy9aODdzUUo4L3RE?=
 =?utf-8?B?a1QrNjZNd1IxQ0lhRTcxcDBONVlFWmlyczNYN1FlK3lXcldGTUlFamtYVGRN?=
 =?utf-8?B?QXE0ZG5kYzIxMzk1Z0pDNVVBcTg1Wm5LTlNGdGFiNGx5dkt4OUgzUkF6ZUtJ?=
 =?utf-8?B?Y3JtVkYvdlB0MUdtcVNkalNqdVd2cHh0aGt5Zmd1TFh2VExEemxURkhPVlc3?=
 =?utf-8?B?MDhWLzdldER2N0p3bXpGNUpyWFZ0elRiaUY4L2gwUzBrL1A4NFJScTdvTUFx?=
 =?utf-8?Q?aoDs0zxbh3j9v3zsONAQ+SIam?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62719AA5207C2D4C87A6D740079D2DF9@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693430b5-836d-43b6-f868-08db16150e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 03:13:09.2416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G4o6nSEbIaPiB5MFWr9vyuh3Bi7E/bNjCR3q5ZzRRuuVGPWX52ltT0FWYW1TxPCwW+OCRBdJ7ivyDHjxgHrHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB6074
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

T24gRnJpLCAyMDIzLTAyLTI0IGF0IDEwOjQ2ICswODAwLCBNZW5nIFRhbmcgd3JvdGU6DQo+IE9u
IDIwMjMvMi8yMyAyMDo1MCwgWmFjayBSdXNpbiB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjMtMDIt
MjMgYXQgMTU6MDQgKzA4MDAsIE1lbmcgVGFuZyB3cm90ZToNCj4gPiA+IEEgcHJpdmlsZWdlIGVz
Y2FsYXRpb24gdnVsbmVyYWJpbGl0eSB3YXMgZm91bmQgaW4gdm13Z2Z4IGRyaXZlcg0KPiA+ID4g
aW4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgaW4gR1BVIGNvbXBvbmVudCBv
ZiBMaW51eA0KPiA+ID4ga2VybmVsIHdpdGggZGV2aWNlIGZpbGUgJy9kZXYvZHJpL3JlbmRlckQx
MjggKG9yIER4eHgpJy4gVGhpcyBmbGF3DQo+ID4gPiBhbGxvd3MgYSBsb2NhbCBhdHRhY2tlciB3
aXRoIGEgdXNlciBhY2NvdW50IG9uIHRoZSBzeXN0ZW0gdG8gZ2Fpbg0KPiA+ID4gcHJpdmlsZWdl
LCBjYXVzaW5nIGEgZGVuaWFsIG9mIHNlcnZpY2UoRG9TKS4NCj4gPiA+IA0KPiA+ID4gVGhpcyB2
dWxuZXJhYmlsaXR5IGNhbiBiZSBxdWlja2x5IHZlcmlmaWVkIGJ5IHRoZSBmb2xsb3dpbmcgY29k
ZQ0KPiA+ID4gbG9naWM6DQo+ID4gPiAuLi4NCj4gPiA+IGRyaV9mZCA9IG9wZW4oIi9kZXYvZHJp
L3JlbmRlckQxMjgiLCBPX1JEV1IpOw0KPiA+ID4gcmV0ID0gaW9jdGwoZHJpX2ZkLCAweEMwMTg2
NDQxLCAmYXJnKTsNCj4gPiA+IGlmIChyZXQgPT0gMCkgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgcHJpbnRmKCJbKl0gVk1XX0FMTE9DX0RNQUJVRiBTdWNjZXNzIVxuIik7DQo+ID4gPiB9DQo+
ID4gPiAuLi4NCj4gPiANCj4gPiBUaGlzIGlzIGp1c3QgcmVndWxhciB1c2FnZSBvZiB0aGF0IGlv
Y3RsLiBXaGF0J3MgdGhlIHZ1bG5lcmFiaWxpdHk/DQo+ID4gDQo+IFllcywgdGhpcyBpcyBhIHZl
cnkgY29tbW9uIHJlZ3VsYXIgdXNhZ2Ugb2YgdGhhdCBpb2N0bC4NCj4gQnV0IGlmIGFueSB1c2Vy
IGNhbiBvcGVyYXRlIC9kZXYvZHJpL3JlbmRlckQxMjggdGhyb3VnaCBpb2N0bCwgaXQgd2lsbCAN
Cj4gbGVhZCB0byBhIHZ1bG5lcmFiaWxpdHkuDQo+ID4gPiBTdWJtaXQgdGhpcyBjb21taXQgdG8g
Zml4IGl0Lg0KPiA+IA0KPiA+IE5vLCB0aGlzIGlzIGluY29ycmVjdC4gWW91J3JlIGVmZmVjdGl2
ZWx5IGp1c3QgZGlzYWJsaW5nIHRoZSBkcml2ZXIgZm9yIG5vcm1hbA0KPiA+IGFwcHMvdXNlcnMg
dXNpbmcgT3BlbkdMIG9yIGFueSBhY2NlbGVyYXRlZCBjb250ZXh0cywgd2hpY2ggaXMgZ29pbmcg
dG8NCj4gPiBjb21wbGV0ZWx5DQo+ID4gYnJlYWssIHdlbGwsIGVzc2VudGlhbGx5IGV2ZXJ5dGhp
bmcgdGhpcyBkcml2ZXIgaXMgZm9yLiBCZWluZyBhYmxlIHRvIHVzZQ0KPiA+IGlvY3RsJ3MNCj4g
PiB0aGF0IHdlcmUgbWVhbnQgdG8gYmUgdXNlZCBpcyBub3QgYSBidWcuDQo+ID4gDQo+ID4gSWYg
eW91IGhhdmUgYSBwcm9vZiBvZiBjb25jZXB0IG9yIGF0IGxlYXN0IGEgZGVzY3JpcHRpb24gb2Yg
dGhlIHZ1bG5lcmFiaWxpdHkNCj4gPiB0aGF0DQo+ID4geW91J3ZlIGZvdW5kIEknZCBiZSBoYXBw
eSB0byB0YWtlIGEgbG9vayBhdCBpdC4NCj4gPiANCj4gPiB6DQo+IA0KPiANCj4gJCBscyAvZGV2
L2RyaS9yZW5kZXJEMTI4IC1sYQ0KPiBjcnctcnctLS0tKyAxIHJvb3QgcmVuZGVyIDIyNiwgMTI4
IDI/wqAgMTUgMTE6NDUgL2Rldi9kcmkvcmVuZGVyRDEyOA0KPiANCj4gVGhlIHBlcm1pc3Npb24g
b2YgdGhlIGZpbGUgaXMg4oCdY3J3LXJ3LS0tLSvigJ0uDQo+IEkgdGhpbmsgb25seSB0aGUgcm9v
dCB1c2VyIG9yIHVzZXJzIHdpdGggY2VydGFpbiBwcml2aWxlZ2VzIGNhbiBhY2Nlc3MgDQo+IHRo
ZSAvZGV2L2RyaS9yZW5kZXJEMTI4IGRldmljZSBmaWxlIGF0IHRoaXMgdGltZS4NCj4gDQo+IEJ1
dCBpbiBmYWN0LCB1c2VycyBjYW4gYWNjZXNzIC9kZXYvZHJpL3JlbmRlckQxMjggdGhyb3VnaCBp
b2N0bCB3aXRob3V0IA0KPiBwZXJtaXNzaW9uLg0KPiANCj4gQXR0YWNobWVudCBwb2MuYyBpcyBh
IHRlc3QgY2FzZSwgYW55IHVzZXIgY2FuIGV4ZWN1dGUgdGhlIA0KPiBjYXNlKFZNV19BTExPQ19E
TUFCVUYpIHN1Y2Nlc3NmdWxseSwgYW5kIGV2ZW50dWFsbHkgbGVhZCB0byBhIGNhbGwgDQo+IHRy
YWNlKGxvZyBzZWUgYXR0YWNobWVudCBkbWVzZy50eHQpLg0KPiANCj4gVGhpcyB3aWxsIGNhdXNl
IHRoZSB1c2VyIHdpdGggcGVybWlzc2lvbiBWTVdfQUxMT0NfRE1BQlVGIGZhaWxlZC4NCg0KVGhh
dCdzIGNvcnJlY3QuIFRoYXQncyB0aGUgd2F5IHRoaXMgd29ya3MuIFRoZSBpb2N0bCBpcyBhbGxv
Y2F0aW5nIGEgYnVmZmVyLCB0aGVyZSdzDQpubyBpbmZpbml0ZSBzcGFjZSBmb3IgYnVmZmVycyBv
biBhIHN5c3RlbSBhbmQsIGdpdmVuIHRoYXQgeW91ciBhcHAganVzdCBhbGxvY2F0ZXMNCmFuZCBu
ZXZlciBmcmVlcyBidWZmZXJzLCBhdCBzb21lIHBvaW50IHRoZSBzcGFjZSB3aWxsIHJ1biBvdXQg
YW5kIHRoZSBpb2N0bCB3aWxsDQpyZXR1cm4gYSBmYWlsdXJlLsKgDQoNCkFzIHRvIHRoZSBzdGFj
ayB0cmFjZSwgSSdtIG5vdCBzdXJlIHdoYXQga2VybmVsIHlvdSB3ZXJlIHRlc3RpbmcgaXQgb24g
c28gSSBkb24ndA0KaGF2ZSBhY2Nlc3MgdG8gdGhlIGZ1bGwgbG9nIGJ1dCBJIGNhbid0IHJlcHJv
ZHVjZSBpdCBhbmQgdGhlcmUgd2FzIGEgY2hhbmdlIGZpeGluZw0KZXhhY3RseSB0aGlzIChpLmUu
IGJ1ZmZlciBmYWlsZWQgYWxsb2NhdGlvbiBidXQgd2Ugd2VyZSBzdGlsbCBhY2Nlc3NpbmcgaXQp
IHRoYXQgd2FzDQpmaXhlZCBpbiBpbiA2LjIgaW4gY29tbWl0IDFhNjg5NzkyMWY1MiAoImRybS92
bXdnZng6IFN0b3AgYWNjZXNzaW5nIGJ1ZmZlciBvYmplY3RzDQp3aGljaCBmYWlsZWQgaW5pdCIp
IHRoZSBjaGFuZ2Ugd2FzIGJhY2twb3J0ZWQgYXMgd2VsbCwgc28geW91IHNob3VsZCBiZSBhYmxl
IHRvDQp2ZXJpZnkgb24gYW55IGtlcm5lbCB3aXRoIGl0Lg0KDQp6DQoNCg==
