Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79C314047
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BBF6E9EE;
	Mon,  8 Feb 2021 20:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCF56E9EE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGyef6ia744N3OwjjYJWspztUnZD5N9bwkp8QaCnkeaUm629IECVDUBxjnKkIow7+ACS1kQeavYcB91NAYodmO6tg+7+DgLQWJJKsb5e3Y1FdHlInGA2iTe9jLy0Xdc1mjFA1f6+DQ0v+7SGnbYWAbwF6F6hVtduEki6b8hOoIIsIfsE0rgrpdqKAAbcxZ4qsgqtgiGVZo3cTzsjTBg0Ocv5AoQnR/9OyX+4l+7bJ7k/FGEepxfEp2K0h/uPBNpEXyVBog6Ie84axe/X5PObSLkWnKAyCmCqWpfjKIl4MZVoYm6sdiPSNGEvqL1QOJ701jbV3u85Czq2F9bL5fFLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVR7la5kEqDdt982DQPno2UBQWMqDK74QDZhDxjnAOo=;
 b=UbdgCIxzSNtmHxu8TEzNiOKkaM0Czt2gOt7gKIXltWahWrdwyfSqrp710xCpKwpzRv4j82ED47J1kQpvrSzOhftYHsyflHUibTgbmwn4StM+ML21P+Tue17m7p8TspW21r6OYhXkS6Aq8KjOm6902ixMLuytre4pvM3lyCBWF6Z6zmoOgQXHRkDmaacKLn0iGU13POKhV6/+shUTWB8aOACIDtHnTNIEO5aXFeq+tAyWIWOsdmI5F6VnC4YZKWqhVmItF9FsFOUtnzWZyfkpqjKObvy/9/RZ10LTrt9YYWYDZdmOqc9SpzyDPk+fB7MUJxb4ZqAL9sGkHt9HJQuVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVR7la5kEqDdt982DQPno2UBQWMqDK74QDZhDxjnAOo=;
 b=I11zcI5JHr99CQAAKPpA90VJmKdv3uXFP2V5kamTk79g15c/4740dbF7PPw5FJESJzYvmqrLRq2fVuoyOEbFRLILgeU2fuzKY6B83ohdZkSybe9lm852ajfYF6AlvH/S532OllO3RPkY3v/kwN3W0BAnTYaBMDCtpB4tRhZmnfY=
Received: from (2603:10b6:208:8f::18) by
 BL0PR05MB5282.namprd05.prod.outlook.com (2603:10b6:208:2f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.15; Mon, 8 Feb 2021 20:21:24 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1%4]) with mapi id 15.20.3846.025; Mon, 8 Feb 2021
 20:21:24 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [Linux-graphics-maintainer] [PATCH 2/3] drm/ttm: move memory
 accounting into vmwgfx v3
Thread-Topic: [Linux-graphics-maintainer] [PATCH 2/3] drm/ttm: move memory
 accounting into vmwgfx v3
Thread-Index: AQHW+gV2NsHDcavmqECv2lrEwoaev6pOSm0AgABxeIA=
Date: Mon, 8 Feb 2021 20:21:24 +0000
Message-ID: <4E11F79F-685A-4969-B59E-B05AC40578F9@vmware.com>
References: <20210128131604.149660-1-christian.koenig@amd.com>
 <20210128131604.149660-2-christian.koenig@amd.com>
 <ddb5c9c9-173c-1919-6000-b51d451109ba@amd.com>
 <071AC444-2B1A-4333-83FA-CA1A53E35C1C@vmware.com>
 <003b1e64-2510-5d96-be62-f8f45843023b@amd.com>
 <5CBDA1F3-5801-45BA-B84A-A5B83FA95BEB@vmware.com>
 <9CB18811-DA0A-40C3-A719-A9EFAA98D0CE@vmware.com>
 <c0f31c1c-ccae-6441-16bf-2bc25c715f41@amd.com>
 <8d14d1b6-e3eb-87ad-a386-681f787ecf94@amd.com>
In-Reply-To: <8d14d1b6-e3eb-87ad-a386-681f787ecf94@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3abf52b4-d015-41b1-487c-08d8cc6f1b4c
x-ms-traffictypediagnostic: BL0PR05MB5282:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB52829BB284FDB16EE1C544CDCE8F9@BL0PR05MB5282.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U1FH5CIxXc+24HbN4Zn8pMb7zA4vXkNW4qpmGhsSFcUPg3pWlpFRFzCwwEjNFa98E9XuRGblE9ckinEQUs+Fb/3Lf22KSx05fkL1JUJp72eoa9JicOcr9NfrKLVro0Pln6gkBMMTFMB9lR/+PdEuUXCBHXMpx6t7hLXNlxmKEmsvkO6Y3/Np+dC655a/ZDJLW0/GT9MF0dyV+BtH+NKAs5Z/DfX0f8rREMDZmw2pFHk6U/4QQFfslpkNBA6xoMfgPYerJw+3OchxsRyEF8+ajTvEt4gQN76sYPeHDuE4vLYa/FZqQYsJmClCl9Pn/Je94753dg5l0RC4jq/r5R9TvrbwaDfbkfKz18oNfWS3J+kBjs3Y0Mic239FdTvDau3kFa26Uxwph+XfGPij4aH4OnaJ+IWv/z0OMT90oKH1UjeoxaL2XSmOKTTywJFUFYfh5Cm9GJTppkauslbhuE+o34AgMbBK1Qt3dDEfuy0B5qjz7d2QSm/UuDUcal9DskqOrNdQ6uVNowR0hpOLYEdKK8uyBHRFPaORnsE1R9WfK77G3rGFk0UXI07n92+Bzfzn2Fh/BGHxNNDWrvrvkzNecsqjYNFIs2XtZus134vxQkA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(186003)(4744005)(86362001)(5660300002)(2906002)(71200400001)(53546011)(66574015)(83380400001)(6916009)(4326008)(478600001)(26005)(66446008)(2616005)(66946007)(64756008)(66556008)(6486002)(8936002)(33656002)(6512007)(316002)(36756003)(54906003)(8676002)(66476007)(6506007)(76116006)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YUVhRTA2ZjdSNmtqSEpnNWFMWVpPNHhkWW1Xc3l3UjVDMGE3VnRkR2dKaUlo?=
 =?utf-8?B?TWtQSUYxTkp1VjlPUk5DYnJIVGpkZExOYUZlT0RHMGtTaGVZRHpNWUdXTU9w?=
 =?utf-8?B?Z1l1US9iMEdlUUNjN1pHYVI0QmNETlRzTW5jNXAxV0pVWmRaMFFkZWRvOWFx?=
 =?utf-8?B?SWhmQ242QjBWS05pZXAwVCsrUkxKeVBSOUdrR3VoVTZyZzFPYW95QzhjWE5y?=
 =?utf-8?B?S1dOTTkxcVpYL3VQRkp6ZEM5OVlaVnlKQjJMaFhrRmxkYVlRTHFFbWZVVWgz?=
 =?utf-8?B?ZXNockw2Ti9xNFd5ckttVGdyNzhDVFU4N2ZDNm1JSEg0Z3NBd2txU252Ymxn?=
 =?utf-8?B?UlVhMlJUQTZ1a1FKWit2bmZxVTdDOEg0MjVhUWZkWUJJMmthY2Z2b1FINFJu?=
 =?utf-8?B?blY1SjZRRDNvR2NON2UxUUJRcGdrM0daNmZzUy9yK1MxWU1WQ3htRXlKR2FI?=
 =?utf-8?B?b3J2QmNVRWVNaHRCOGZkeGN2bWpaUWRtTE9QbkRVcHQ4ZGNkRDFzcTVDcTE5?=
 =?utf-8?B?S0tpQ2lBYVo3SzhKcDBDVWRtV1JuOFgweU9RRjJFeDk1T3N0bXRlMjc5Mncv?=
 =?utf-8?B?TmxyUnI1RkdCWUNHVDVPMUhhblVCTDFxdHpIZHMzUENxbjYyL0NNT0ZJdS9H?=
 =?utf-8?B?Yk5MWXpJRFcwZy9TTTRiWXIrSUN3K1RtT2czM3hnWlVzekxqODZmR2pMa0xI?=
 =?utf-8?B?d1RleEpDYXFtSFIwSjdDZ3MwdXg3QkpyMVl5WUJMN2pVbE9WczNiOWdrbVBK?=
 =?utf-8?B?cGpmTWljMFpPU1Vtc1ZXa2Rvdnc0QnhITU9KNU40NGVzdUlGTUliWGZJaktR?=
 =?utf-8?B?aC9nWUxuRUFDSTVmUWpiWGZLL1VJK2k1dEZsdUdJYmFrYWpnc1pHckM2cnJp?=
 =?utf-8?B?L3NSZFhSaWQ2WnBIMjd2L0l2bU8yT0lRTlE3ZXMyMGZmSXNOTFZOQTRlWHRp?=
 =?utf-8?B?VDBrbFVKY0lqaFNRYTdkOTlicnNnSXpDam8rYlBTUjlQMkJlVnBzQ0VGOWJh?=
 =?utf-8?B?bEpIUlZkeE9ibGF6RXNvTnU3Ry8rOXlvYktDcTRGakc1TnczQTBmUjZVQ1hY?=
 =?utf-8?B?dnprWWdHL3VpbU0zWXArT3VUL1VOZGpYY3JFYm5mZjZLRDlXSU9wNHZ0SzNr?=
 =?utf-8?B?eDhSK2dIUFd0TGV4MU1HbHlyeTlsakJFcGtRQ2ZDRXZnYnhLbXg1OEVWczZk?=
 =?utf-8?B?d2pEN1RVRDd5NzB2eVNPY1RENlh5MmZPVCtINEt3d2hBRVA2UjlUa3Faak04?=
 =?utf-8?B?Ni9ZMFJNUGVGTTBlOCtKSEZ1NGZEUkluREprVGpsZWxsMFZRUEZkSGlrRVhY?=
 =?utf-8?B?VDFNaWFzZmdWRkhFeGJHUUNhREtNZ3ExT3pGcWNFdmt1UDRYRmM0WWhmWnBQ?=
 =?utf-8?B?SSt5Z3R2MjRjZ0pUSDN2R1NTaW8rV2MyNWNWVU5SNjBuUVV1VW40dXAxZENo?=
 =?utf-8?B?YnhRejE5U09XbTN0bCtiNjYwK1VWK2lBUi9LMWxvNlpLdWNHVDN2ZHFsWXJH?=
 =?utf-8?B?K3RqL1VqTURIdmY5UVdLQk1Wb2llUjRZbm91R09rYlQyWmVaaElDUE9sRWFo?=
 =?utf-8?B?dFduTDQ3MEV6Tzd2R25kUlB4VkdWUEE5UGFnZ1dsRFpyTnMxL3o1enBrRXJE?=
 =?utf-8?B?NnpyVHNYdVljMitYZ2xpMHlkNVJZOXZRNEJ2Ujkyc0U0WWVNQ1FuVzdGVndX?=
 =?utf-8?B?Z2NCYXh4WnNMR01DcTFiUVJXR1A2TlVmV1psdmNrRjIwM1NncG0xTlRoalYx?=
 =?utf-8?Q?4L18guw0TKMHXA39Jg6o4oeg7wZq6LYqMX5sB4L?=
Content-ID: <5742814D335D5047B064B8CD543FA71B@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abf52b4-d015-41b1-487c-08d8cc6f1b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 20:21:24.3795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6LQVCPQbNHqV/CNYbvDSzigSOqmP0R3IAUl1QzBqlq7GORWFGUaY1FWi/SDr41rg4DEWgQreeUp9Ea3/TYiNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5282
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIEZlYiA4LCAyMDIxLCBhdCAwODozNSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIFphY2ssDQo+IA0KPiBvayB3ZSBmaWd1
cmVkIG91dCBob3cgdG8gZG8gdGhpcyBjb3JyZWN0bHkuDQo+IA0KPiBCYXNpY2FsbHkgdXNpbmcg
dGhlIHBkZXYtPmtvYmogaW5zdGVhZCBvZiB0aGUgZHJtLT5wcmltYXJ5LT5rZGV2LT5rb2JqIHBv
aW50ZXIgd29ya2VkIHF1aXRlIHdlbGwuDQo+IA0KPiBJJ3ZlIGp1c3Qgc2VuZCB0aGUgbGF0ZXN0
IHBhdGNoZXMgdG8gdGhlIG1haWxpbmcgbGlzdC4gSWYgeW91IGRvbid0IGhhdmUgYW55IG9iamVj
dGlvbnMgSSB3aWxsIGNvbW1pdCB0aGF0IHRvbW9ycm93IHdpdGggeW91ciBhbmQgRGFuaWVscyBy
Yi4NCg0KVGhhdCBzb3VuZHMgZ29vZC4gVGhhdCBtb3ZlcyB0aGUgZW50cmllcyB1bmRlciAvc3lz
L2RldmljZXMvcGNpQlVTL0lEL21lbW9yeV9hY2NvdW50aW5nICwgeWVzPw0KDQp6Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
