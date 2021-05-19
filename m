Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88243885E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 06:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F76E19A;
	Wed, 19 May 2021 04:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5256E182;
 Wed, 19 May 2021 04:09:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c07js6zqMSH16mlI6SojgLCOI+qDMXtX6EgP5mbSVnaCd3Z/n596vl6dkEwVlP5oB7ZAn2h40rSBEHVj9RDVWXqIZyDYW+vXDm5yqiz9cug3Cef8yOwjl30tXMooaK4iymOzWHD0Zy0VHGLRB/LI8rJbdw3jrh78dP1AWkdmMGDAAjGcPYSwiyMeYV9dQGUu2uxBagrQT7QBgPf6pC3OS1syni9xrfnL9vc5FdHdjE4hF6HTgCNPWDB5TZlY8GTObLIBOHTcHkTGyUN7I+wmM/T1QF3kdDXV5n7P8rnEJdESWYiUu7uiNdNUfOGS90465RYj6sMn4Wsv7db/WiG64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SETO1stTHl3rbCxmSCnPeUvT1o8oVpEdzVwV24uFzY4=;
 b=Cex+Bw7ry5hMyfdzDNUX3MyyNjBrNvUIQSPEFNbNdZRKLNXdaZtNkPiwIZsOOBi/EA7h2PhYh6esipxYRi/sl4gAUghrBniZcPH0Ub7P482DJ+BDr1i4j7rB1KRLcSsjl4WKcllPbNGf4p6xIXFgKjvpPW1r3gLff7MXSYUEYITAaSlEAdwTMAWZDQbMD4uIFSSCL+Cv8TQ/sVPaZlTe0G6Uisz2Hp3uRrBhI7/5kblLFZldVe1WDrVfuOCe4VfclzhaaAIK7PmV1ICwNMJVMnTnpygvP015CAZESR7THEqSu0r2tFb7urcps3ou6fJWfJ7JIriqo2hkk4r6GRMK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SETO1stTHl3rbCxmSCnPeUvT1o8oVpEdzVwV24uFzY4=;
 b=ehXYGVXOh28nR4Fz2tFIZNLu/7BUCveXQzwWwJvG7fbZlakyA8dWb/hU7GVwE9sYKsO5T4TvRif5Yl0qe9KqQ6dADEsYvF+YO0CLPEgip1+HiQVubTeEBa9V8nDAVG8WcmQqZhvg8bm+GGE93IHVb28jVo+r60yrb1mQBXQbU9s=
Received: from BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7)
 by BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 04:09:28 +0000
Received: from BN9PR12MB5163.namprd12.prod.outlook.com
 ([fe80::48a1:ee87:1ffc:b616]) by BN9PR12MB5163.namprd12.prod.outlook.com
 ([fe80::48a1:ee87:1ffc:b616%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 04:09:28 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDEvMl0gZHJtL2FtZGdwdTogRml4IG1lbW9y?=
 =?utf-8?Q?y_corruption_due_to_swapout_and_swapin?=
Thread-Topic: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout
 and swapin
Thread-Index: AQHXTFbLtz1o1HqhjUSdnwL4CAK9UqrqJZKAgAAJANU=
Date: Wed, 19 May 2021 04:09:28 +0000
Message-ID: <BN9PR12MB5163D9CC209C0B9B02CD8A5B872B9@BN9PR12MB5163.namprd12.prod.outlook.com>
References: <20210519022852.16766-1-xinhui.pan@amd.com>,
 <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
In-Reply-To: <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-19T04:09:27.295Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f043b70c-6d11-43ec-1deb-08d91a7be599
x-ms-traffictypediagnostic: BN9PR12MB5353:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR12MB53530F0570C2005A772109A6872B9@BN9PR12MB5353.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cv+U9PNpCXeKVPw07ucvzLM85oMsZycHLLx4PxXWGCIXQzHQgeteGVxCjNg2eRQEV4Oxl1uYJmXfEaZObgA+Cf80waic/hfiBbex19QEK+Edx4KPMYeg1j92o5xOqLV8plqwzHZKWNVlijKvaaCT4EF10x0WMOco8esOKzvyIkUveSTbV36pRBtj7bxA27KZj5MMjGxH8sPfD1v2pMdP22rS9O/d4t9dceIMx0m67SszO4HsCqTNxrEGyJk0/1K5y7VF+KbwhcRxKmcphC02K4n3hcRxJ7vRseIs9E7x3tB9MFEAA+1I4Ordd+9o+c4ar2fHadayDaRIdBbduAhY56yTM+uoaKDGTBI/n5WP4c0ks3l7AubKf3PX5Xilh+gy56ikcybkrYtKU6Xcm8XMIC5WDsljru5fOVe1bDI9rzMZTtl8Jf9Ipa5CB148NmDavuwmjj4C5ZMP6bGaQkgY6ZdvUoUsIUiLI0gjrBf47ryvksfl8EFrkenTmpvjxPWBwkHVNRcUqswn9D6AElyNIWYukEomgcQydreDxRvwjINsxn71mN2qYqWP1YOzkaE7/WO+2kQwfSPxNQFkBWX5qonsDs1hGZ7TNV1mV8NJQfDxq7qoyL2FZQQbjwi1+8EN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5163.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(478600001)(8936002)(55016002)(122000001)(38100700002)(9686003)(52536014)(966005)(2906002)(91956017)(110136005)(66556008)(54906003)(316002)(5660300002)(76116006)(66946007)(186003)(66446008)(66476007)(64756008)(86362001)(26005)(7696005)(224303003)(6506007)(53546011)(83380400001)(4326008)(66574015)(71200400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OXlQOFErWndGOVlBQkw2RmpkdWRtaUg2QW5rNmU1MDNOS2psc3BiWXJBVlRH?=
 =?utf-8?B?VmVDTUhnWG5jMUd3bFpxQ0RwQmJkYk8vN3pCTnE1WGxtSXFubFYzV3had1F2?=
 =?utf-8?B?TEU2UE4vamhjSkZINldQenVyMWtad05ZUnpwUkVxYzNaWUhRZHdNcjlFbStW?=
 =?utf-8?B?aGg3SUd3bWVXTkRkdnk2ZjlUR0JCWXJDTXNTTTB4ODVUL1JaQzdkUkdSeWNZ?=
 =?utf-8?B?S0pvWmxCTW1vblJvTVI4T2lPazFuc0V4WnN4ZWgvNGF3WUNzTnpMbXZRaFRj?=
 =?utf-8?B?QWxhTUVDWmlsaW5udFZ3M012OFBSQVZXWUNSdFlacUROTG1ncGdvZlltNEFy?=
 =?utf-8?B?bXNPMkxhak9ybVdCTE5ZUGVJcEN3Z2hWVXlUNmpxaG8vaXBFaVJrS1JuYU9L?=
 =?utf-8?B?UENUWkFrdWxmNkRaeWRzd0hJd2FOMnY0QlJjQmUxUnQ4VlFFTVRCSTFIQ21O?=
 =?utf-8?B?a0ZmeCtTYXkrU1BLQ1JrbzhGYit0YXhuc1BDUTVMZlN4MG5yK2RqcXRqOGlx?=
 =?utf-8?B?czBSdXVLd0JlVzdRS2tBRDVTeTdOVERubjBTNGFiV041SmwzMzZlU1FLL21v?=
 =?utf-8?B?aTJVSm0rMFl5WWdPTjFrWkI3cDhRZzJYWTV2aVZXRDFOQVFnTEl2STVVUDR6?=
 =?utf-8?B?a2JnbGhqYmJTQmY1K25HZG1vVlFrUmpmY0JRaWtubWI5N2FhVkJwZTM1TGdK?=
 =?utf-8?B?Q3ovU2l3QVoweWlmUGJ4b1JTazFLTTVwTGU0TTFHVEY4ajFLTS9KZmZ3dkk1?=
 =?utf-8?B?VDdMT2pZZTNQQzlyWi9ZOXFhb1VQdHdGb1k5VmpPRVRZZ2FpV2gxelFGYmJy?=
 =?utf-8?B?aFpaWWE3eS9hcTBoME16SlViOVRQa0xHUkNhc2tIajdyS3M5dFp5Tmd5VWFY?=
 =?utf-8?B?b3ZFUnNjd3IxZ2xQc1YwNzdtbjRvMHBDT1lhTFZhaGg1UmZwbVp0RldiY3lB?=
 =?utf-8?B?M1dVM3dsdTlHd2dJZGZVdkdHdVZNTkN6VmJpeXc3NFRBVWE3c3M3NVdCeVZo?=
 =?utf-8?B?Z3hSZ1hVaVQvRHo5V0dxTm1UNlVkdldyc3B3NmpiNnJlTzliSjY0ZTBWZzNy?=
 =?utf-8?B?NXFiSkcxTEJGaUYydW9icEhmNVlsd1JoSVpFcUhrQllUNmh0RU1jUCtUNTQw?=
 =?utf-8?B?TjhodDcwRHJ3Zzh5TnFqdmgxZ2hlN2ExZ1dyUk1Lakk3OVBUWGZYVUFXNHNx?=
 =?utf-8?B?K3Y0eGdzVzY1VnFIWDFJbTNHekQ1b0Z6Vk8xQTk1UmF1OFg4L0hBalV6cndF?=
 =?utf-8?B?RGN4U1hmTTdxMjFjUlJtVE9sYldEbzFlRXlTa3RNc2VQaHJLY2NjQTZYZjZa?=
 =?utf-8?B?ZGU1UGxPVUIxcW1ncFRvdzdmR25LblJJRlpxMmlIdFhaMEh0cEZDKzlGc0lq?=
 =?utf-8?B?RFEvVWFaQVNBc0YzbVhEbzh5QVlsNG01OHkzUWpGZUxKeWlSMDJ2QWFLdDI1?=
 =?utf-8?B?ZzBsYmlTL3U4UWtKZXcwRnVickpGcG1SWStBWHN4d0xoc1FGaXBPMEttWGF3?=
 =?utf-8?B?TytCdUNiR1ptZzdHQjlxYVMyaFVZWFR3VXJxejR5eGhPVmlyUytHOEpWYXRT?=
 =?utf-8?B?cTdPUThMWlVjcFZTWk56RG5uc3YrUnhnSXlaWnlaK0pzRklHUlR6b3BvMm9y?=
 =?utf-8?B?dFVudTJUOXBiVzBzRXR6d2hGY2VnTi9kUWRwUWI4d3hBRytwRkJuVmJ5Z3Rm?=
 =?utf-8?B?VHlLRFB6YVU0QTc5dGZHb00ySUM5em8wRmVVejhqUTJ0TExLeit1Sk1LZWJj?=
 =?utf-8?Q?bY4mcOyAJHfCaMmklTv/Om6FhavSEqheYXkIpIh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5163.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f043b70c-6d11-43ec-1deb-08d91a7be599
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 04:09:28.4175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/okBMOhfeyAsHj3NaOqpjZGTMxLO/d9IIQ25xOoPJtUxoD8vHpJHAFWdcT6jQ1N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KeWVzLCB3ZSByZWFsbHkgZG9udCBzd2Fwb3V0IFNH
IEJPcy4NClRoZSBwcm9ibGVtcyBpcyB0aGF0IGJlZm9yZSB3ZSB2YWxpZGF0ZSBhIHVzZXJwdHIg
Qk8sIHdlIGNyZWF0ZSB0aGlzIEJPIGluIENQVSBkb21haW4gYnkgZGVmYXVsdC4gU28gdGhpcyBC
TyBoYXMgY2hhbmNlIHRvIHN3YXBvdXQuDQoNCndlIHNldCBmbGFnIFRUTV9QQUdFX0ZMQUdfU0cg
b24gdXNlcnB0ciBCTyBpbiBwb3BsdWF0ZSgpIHdoaWNoIGlzIHRvbyBsYXRlLg0KSSBoYXZlIG5v
dCB0cnkgdG8gcmV2ZXJ0IENocmlzJyBwYXRjaCBhcyBJIHRoaW5rIGl0IGRlc250IGhlbHAuIE9y
IEkgY2FuIGhhdmUgYSB0cnkgbGF0ZXIuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCuWPkeS7tuS6ujogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0K5Y+R6YCB5pe26Ze0OiAyMDIx5bm0NeaciDE55pelIDExOjI5DQrmlLbku7bkuro6
IFBhbiwgWGluaHVpOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K5oqE6YCBOiBEZXVj
aGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0aWFuOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2gNCuS4u+mimDogUmU6IFtSRkMgUEFUQ0ggMS8yXSBk
cm0vYW1kZ3B1OiBGaXggbWVtb3J5IGNvcnJ1cHRpb24gZHVlIHRvIHN3YXBvdXQgYW5kIHN3YXBp
bg0KDQpTd2FwcGluZyBTRyBCT3MgbWFrZXMgbm8gc2Vuc2UsIGJlY2F1c2UgVFRNIGRvZXNuJ3Qg
b3duIHRoZSBwYWdlcyBvZg0KdGhpcyB0eXBlIG9mIEJPLg0KDQpMYXN0IEkgY2hlY2tlZCwgdXNl
cnB0ciBCT3MgKGFuZCBvdGhlciBTRyBCT3MpIHdlcmUgcHJvdGVjdGVkIGZyb20NCnN3YXBvdXQg
YnkgdGhlIGZhY3QgdGhhdCB0aGV5IHdvdWxkIG5vdCBiZSBhZGRlZCB0byB0aGUgc3dhcC1MUlUu
IEJ1dCBpdA0KbG9va3MgbGlrZSBDaHJpc3RpYW4ganVzdCByZW1vdmVkIHRoZSBzd2FwLUxSVS4g
SSBndWVzcyB0aGlzIGJyb2tlIHRoYXQNCnByb3RlY3Rpb246DQoNCmNvbW1pdCAyY2I1MWQyMmQ3
MGIxOGVhZjMzOWFiZjk3NThiZjBiNzYwOGRhNjVjDQpBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCkRhdGU6ICAgVHVlIE9jdCA2IDE2OjMwOjA5IDIw
MjAgKzAyMDANCg0KICAgICBkcm0vdHRtOiByZW1vdmUgc3dhcCBMUlUgdjMNCg0KICAgICBJbnN0
ZWFkIGV2aWN0IHJvdW5kIHJvYmluIGZyb20gZWFjaCBkZXZpY2VzIFNZU1RFTSBhbmQgVFQgZG9t
YWluLg0KDQogICAgIHYyOiByZW9yZGVyIG51bV9wYWdlcyBhY2Nlc3MgcmVwb3J0ZWQgYnkgRGFu
J3Mgc2NyaXB0DQogICAgIHYzOiBmaXggcmViYXNlIGZhbGxvdXQsIG51bV9wYWdlcyBzaG91bGQg
YmUgMzJiaXQNCg0KICAgICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+DQogICAgIFRlc3RlZC1ieTogTmlybW95IERhcyA8bmlybW95LmRh
c0BhbWQuY29tPg0KICAgICBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCiAgICAgUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCiAgICAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQy
NDAwOS8NCg0KUmVnYXJkcywNCiAgIEZlbGl4DQoNCg0KT24gMjAyMS0wNS0xOCAxMDoyOCBwLm0u
LCB4aW5odWkgcGFuIHdyb3RlOg0KPiBjcHUgMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjcHUgMg0KPiBrZmQgYWxsb2MgQk8gQSh1c2VycHRyKSAgICAgICAgICAg
ICAgICAgICAgICAgICBhbGxvYyBCTyBCKEdUVCkNCj4gICAgICAtPmluaXQgLT4gdmFsaWRhdGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gaW5pdCAtPiB2YWxpZGF0ZSAtPiBwb3B1
bGF0ZQ0KPiAgICAgIGluaXRfdXNlcl9wYWdlcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
PiBzd2Fwb3V0IEJPIEEgLy9oaXQgdHRtIHBhZ2VzIGxpbWl0DQo+ICAgICAgIC0+IGdldF91c2Vy
X3BhZ2VzIChmaWxsIHVwIHR0bS0+cGFnZXMpDQo+ICAgICAgICAtPiB2YWxpZGF0ZSAtPiBwb3B1
bGF0ZQ0KPiAgICAgICAgICAgIC0+IHN3YXBpbiBCTyBBIC8vIE5vdyBoaXQgdGhlIEJVRw0KPg0K
PiBXZSBrbm93IHRoYXQgZ2V0X3VzZXJfcGFnZXMgbWF5IHJhY2Ugd2l0aCBzd2Fwb3V0IG9uIHNh
bWUgQk8uDQo+IFRocmVyZSBhcmUgc29tZSBpc3N1ZXMgSSBoYXZlIG1ldC4NCj4gMSkgbWVtb3J5
IGNvcnJ1cHRpb24uDQo+IFRoaXMgaXMgYmVjYXVzZSB3ZSBkbyBhIHN3YXAgYmVmb3JlIG1lbW9y
eSBpcyBzZXR1cC4gdHRtX3R0X3N3YXBvdXQoKQ0KPiBqdXN0IGNyZWF0ZSBhIHN3YXBfc3RvcmFn
ZSB3aXRoIGl0cyBjb250ZW50IGJlaW5nIDB4MC4gU28gd2hlbiB3ZSBzZXR1cA0KPiBtZW1vcnkg
YWZ0ZXIgdGhlIHN3YXBvdXQuIFRoZSBmb2xsb3dpbmcgc3dhcGluIG1ha2VzIHRoZSBtZW1vcnkN
Cj4gY29ycnVwdGVkLg0KPg0KPiAyKSBwYW5pYw0KPiBXaGVuIHN3YXBvdXQgaGFwcGVzIHdpdGgg
Z2V0X3VzZXJfcGFnZXMsIHRoZXkgdG91Y2ggdHRtLT5wYWdlcyB3aXRob3V0DQo+IGFueWxvY2su
IEl0IGNhdXNlcyBtZW1vcnkgY29ycnVwdGlvbiB0b28uIEJ1dCBJIGhpdCBwYWdlIGZhdWx0IG1v
c3RseS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29t
Pg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMgfCAxNiArKysrKysrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCA5MjhlOGQ1N2NkMDguLjQyNDYw
ZTQ0ODBmOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ3B1dm0uYw0KPiBAQCAtODM1LDYgKzgzNSw3IEBAIHN0YXRpYyBpbnQgaW5pdF91
c2VyX3BhZ2VzKHN0cnVjdCBrZ2RfbWVtICptZW0sIHVpbnQ2NF90IHVzZXJfYWRkcikNCj4gICAg
ICAgc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9IG1lbS0+cHJvY2Vz
c19pbmZvOw0KPiAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IG1lbS0+Ym87DQo+ICAgICAg
IHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IHRydWUsIGZhbHNlIH07DQo+ICsgICAg
IHN0cnVjdCBwYWdlICoqcGFnZXM7DQo+ICAgICAgIGludCByZXQgPSAwOw0KPg0KPiAgICAgICBt
dXRleF9sb2NrKCZwcm9jZXNzX2luZm8tPmxvY2spOw0KPiBAQCAtODUyLDcgKzg1MywxMyBAQCBz
dGF0aWMgaW50IGluaXRfdXNlcl9wYWdlcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCB1
c2VyX2FkZHIpDQo+ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICAgICAgIH0NCj4NCj4gLSAg
ICAgcmV0ID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBh
Z2VzKTsNCj4gKyAgICAgcGFnZXMgPSBrdm1hbGxvY19hcnJheShiby0+dGJvLnR0bS0+bnVtX3Bh
Z2VzLA0KPiArICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBwYWdlICopLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0KPiArICAgICBp
ZiAoIXBhZ2VzKQ0KPiArICAgICAgICAgICAgIGdvdG8gdW5yZWdpc3Rlcl9vdXQ7DQo+ICsNCj4g
KyAgICAgcmV0ID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgcGFnZXMpOw0KPiAg
ICAgICBpZiAocmV0KSB7DQo+ICAgICAgICAgICAgICAgcHJfZXJyKCIlczogRmFpbGVkIHRvIGdl
dCB1c2VyIHBhZ2VzOiAlZFxuIiwgX19mdW5jX18sIHJldCk7DQo+ICAgICAgICAgICAgICAgZ290
byB1bnJlZ2lzdGVyX291dDsNCj4gQEAgLTg2Myw2ICs4NzAsMTIgQEAgc3RhdGljIGludCBpbml0
X3VzZXJfcGFnZXMoc3RydWN0IGtnZF9tZW0gKm1lbSwgdWludDY0X3QgdXNlcl9hZGRyKQ0KPiAg
ICAgICAgICAgICAgIHByX2VycigiJXM6IEZhaWxlZCB0byByZXNlcnZlIEJPXG4iLCBfX2Z1bmNf
Xyk7DQo+ICAgICAgICAgICAgICAgZ290byByZWxlYXNlX291dDsNCj4gICAgICAgfQ0KPiArDQo+
ICsgICAgIFdBUk5fT05fT05DRShiby0+dGJvLnR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZM
QUdfU1dBUFBFRCk7DQo+ICsNCj4gKyAgICAgbWVtY3B5KGJvLT50Ym8udHRtLT5wYWdlcywNCj4g
KyAgICAgICAgICAgICAgICAgICAgIHBhZ2VzLA0KPiArICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKHN0cnVjdCBwYWdlKikgKiBiby0+dGJvLnR0bS0+bnVtX3BhZ2VzKTsNCj4gICAgICAgYW1k
Z3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgbWVtLT5kb21haW4pOw0KPiAgICAgICBy
ZXQgPSB0dG1fYm9fdmFsaWRhdGUoJmJvLT50Ym8sICZiby0+cGxhY2VtZW50LCAmY3R4KTsNCj4g
ICAgICAgaWYgKHJldCkNCj4gQEAgLTg3Miw2ICs4ODUsNyBAQCBzdGF0aWMgaW50IGluaXRfdXNl
cl9wYWdlcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCB1c2VyX2FkZHIpDQo+ICAgcmVs
ZWFzZV9vdXQ6DQo+ICAgICAgIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShiby0+
dGJvLnR0bSk7DQo+ICAgdW5yZWdpc3Rlcl9vdXQ6DQo+ICsgICAgIGt2ZnJlZShwYWdlcyk7DQo+
ICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgYW1kZ3B1X21uX3VucmVnaXN0ZXIoYm8p
Ow0KPiAgIG91dDoNCg==
