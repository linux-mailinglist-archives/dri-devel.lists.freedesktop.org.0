Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515898060
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 18:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4B06E97A;
	Wed, 21 Aug 2019 16:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94EE6E977;
 Wed, 21 Aug 2019 16:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGoZQgouupDfIir+/5mJ1/R3uopSUtorDpE9Ui1XJ7fCaPpj/HoV+AnZFs4WEWkR214dVyxJhc4jS/0oDfHhH4EmoNWpTtI0FhszVEUz48cR8hdfWCxUJYF9hsUSN59VV6WFmkKtxiy6LFcyN/KVziQ/jo38Ei87C5n/OwtkGZcK6jIk/G2Jg84Auf807XAawAUnvHsdevo0B4sKIr3M/oylVVLM8UQCDZDQ3ReLHStuvGLXbR093C5z461YVFUma+N4GXA5gbUTEWSOqE59Vpta/Ljhi7zv6KYDlwKiUWZe7+92TnLGzOvfKaHEL26ZcCw/W9es/rd3N81c+8+bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9rtp3Ew6Kpy4cdQ5VZ++tCWTBw64TnggvE7WoWuO0Y=;
 b=IyW3v1xW/L9xOviPSZczkq9eP+Y/d2ODhg1JtB4ua7SKCbdKITV8AmyTDcJ3XpFF4323nSOKAWZiHKGJM+y8hVhckHwBVY70/qQMBNq4iMiTnyY7uH7jWwC/6d9uTERwYy531B/WgFrDF9Jn+0GJrPPN6BTYOWwUGxsfaIp9aQsI2JAeFrKF6HiifkJLqW2jM/wL2O4RgFN3cvU6RLP2UJ8FQswWtjkeRMACn8TX7T23Gz72zvdn5iLVP4eHatHBeq3feWk7Pvnh9V+2gb5j8b/GW0M/l2Z74F41sR6AsDgsivmKVIzmuxR6fAFvMhADvkFSOXdnOBV4f4f4XiCFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0055.namprd12.prod.outlook.com (10.172.77.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 16:40:17 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 16:40:16 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Nathan Chancellor <natechancellor@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: [PATCH] drm/amd/display: Fix 32-bit divide error in
 wait_for_alt_mode
Thread-Topic: [PATCH] drm/amd/display: Fix 32-bit divide error in
 wait_for_alt_mode
Thread-Index: AQHVV7MFnH4uDS8chUOr/aJXK/7Tz6cFzskA
Date: Wed, 21 Aug 2019 16:40:15 +0000
Message-ID: <f594d746-9eaf-76fe-d380-bb033cce06f8@amd.com>
References: <20190820235713.3429-1-natechancellor@gmail.com>
In-Reply-To: <20190820235713.3429-1-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cd013a6-0dae-4070-01fa-08d726563bd9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0055; 
x-ms-traffictypediagnostic: CY4PR1201MB0055:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0055B3DE9DC2077BC38A75188CAA0@CY4PR1201MB0055.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(189003)(199004)(4326008)(76176011)(8676002)(81156014)(81166006)(14444005)(256004)(31696002)(486006)(6636002)(3846002)(52116002)(54906003)(316002)(7736002)(99286004)(64756008)(66446008)(66946007)(110136005)(6116002)(58126008)(305945005)(25786009)(8936002)(2906002)(31686004)(66476007)(478600001)(66556008)(6246003)(45080400002)(53546011)(386003)(6512007)(65806001)(65956001)(66066001)(6506007)(2616005)(71200400001)(71190400001)(14454004)(53936002)(186003)(6436002)(36756003)(102836004)(26005)(476003)(6486002)(5660300002)(11346002)(446003)(229853002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0055;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 78xTGTOR1X21oSt1xp11/okXNgU6F83Ngm4/rQz7I89sVmMI7hI25O+7j3qmaXYxUL9FHBA7SEOy9zq8bJz+6coS+ifGb6MVRCZOYgRo2uuFVCW7jO/7qghveuRw0+I9MAVxoKQc2xapOxcZnugeVK34/2NjewJGgYSuVxZy0EZOSfAiu5b1793MW+HGJKcTGbT0Ri/KgRUoienpJhEh9Md8D0DmfegzzUZcUGzkRr/Ci4TAlrStIaTdg916i8SdupgqJWOyU98kFcmCppJBheimu46lgopeVU+kUVOraIsqABHiWBJqrK9tMKEFcAudn/F3Mv0zCvZ2Invpzw/BxiuoHMfmGzh5CPX2BSExXLQPL0h8j1CLZilxFrTJLQe/A2dfDb2siyKeL6OZzSTFDCATbfNsxstG31yt8z2bPLw=
Content-ID: <46A377C5DAB0164096A7EC287785F1DF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd013a6-0dae-4070-01fa-08d726563bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 16:40:15.7714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KT+u574U4ZAjO+FwcPmx5IBAkK35L8yvvPhOD+VerWvt5N8Y24r61k/gYN9tjLRyKS00xA6LQVZzE/Gydklv2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9rtp3Ew6Kpy4cdQ5VZ++tCWTBw64TnggvE7WoWuO0Y=;
 b=oEGFc3ZEqvjIr6+h0C6S8xm26uRbo/dCRz7sHbRWy1fTRZvDglbYzqWORY7RAsXacfjBA8pZhUcL3iifudrTlUBlA0gZ6CBURMrMmsEpaxxBX+wFnujHrFcdgQwKnBwtVU/HeyuAHTcLog8o6RAhS2sPrLN7LpHwd/Z2Iz66pYI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yMCA3OjU3IHAubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOg0KPiBXaGVu
IGJ1aWxkaW5nIGFybTMyIGFsbHllc2NvbmZpZzoNCj4gDQo+IGxkLmxsZDogZXJyb3I6IHVuZGVm
aW5lZCBzeW1ib2w6IF9fYWVhYmlfdWxkaXZtb2QNCj4+Pj4gcmVmZXJlbmNlZCBieSBkY19saW5r
LmMNCj4+Pj4gZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsubzood2FpdF9mb3Jf
YWx0X21vZGUpIGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hDQo+Pj4+IHJlZmVyZW5jZWQg
YnkgZGNfbGluay5jDQo+Pj4+IGdwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLm86
KHdhaXRfZm9yX2FsdF9tb2RlKSBpbiBhcmNoaXZlIGRyaXZlcnMvYnVpbHQtaW4uYQ0KPiANCj4g
dGltZV90YWtlbl9pbl9ucyBpcyBvZiB0eXBlIHVuc2lnbmVkIGxvbmcgbG9uZyBzbyB3ZSBuZWVk
IHRvIHVzZSBkaXZfdTY0DQo+IHRvIGF2b2lkIHRoaXMgZXJyb3IuDQo+IA0KPiBGaXhlczogYjVi
MWY0NTU0OTA0ICgiZHJtL2FtZC9kaXNwbGF5OiBFbmFibGUgdHlwZSBDIGhvdHBsdWciKQ0KPiBS
ZXBvcnRlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0K
SGFycnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMNCj4gaW5kZXggZjJkNzhkN2IwODllLi44NjM0OTIzYjQ0NDQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMNCj4gQEAg
LTcyMSw3ICs3MjEsNyBAQCBib29sIHdhaXRfZm9yX2FsdF9tb2RlKHN0cnVjdCBkY19saW5rICps
aW5rKQ0KPiAgCQkJdGltZV90YWtlbl9pbl9ucyA9IGRtX2dldF9lbGFwc2VfdGltZV9pbl9ucygN
Cj4gIAkJCQlsaW5rLT5jdHgsIGZpbmlzaF90aW1lc3RhbXAsIGVudGVyX3RpbWVzdGFtcCk7DQo+
ICAJCQlEQ19MT0dfV0FSTklORygiQWx0IG1vZGUgZW50ZXJlZCBmaW5pc2hlZCBhZnRlciAlbGx1
IG1zXG4iLA0KPiAtCQkJCSAgICAgICB0aW1lX3Rha2VuX2luX25zIC8gMTAwMDAwMCk7DQo+ICsJ
CQkJICAgICAgIGRpdl91NjQodGltZV90YWtlbl9pbl9ucywgMTAwMDAwMCkpOw0KPiAgCQkJcmV0
dXJuIHRydWU7DQo+ICAJCX0NCj4gIA0KPiBAQCAtNzMwLDcgKzczMCw3IEBAIGJvb2wgd2FpdF9m
b3JfYWx0X21vZGUoc3RydWN0IGRjX2xpbmsgKmxpbmspDQo+ICAJdGltZV90YWtlbl9pbl9ucyA9
IGRtX2dldF9lbGFwc2VfdGltZV9pbl9ucyhsaW5rLT5jdHgsIGZpbmlzaF90aW1lc3RhbXAsDQo+
ICAJCQkJCQkgICAgZW50ZXJfdGltZXN0YW1wKTsNCj4gIAlEQ19MT0dfV0FSTklORygiQWx0IG1v
ZGUgaGFzIHRpbWVkIG91dCBhZnRlciAlbGx1IG1zXG4iLA0KPiAtCQkJdGltZV90YWtlbl9pbl9u
cyAvIDEwMDAwMDApOw0KPiArCQkJZGl2X3U2NCh0aW1lX3Rha2VuX2luX25zLCAxMDAwMDAwKSk7
DQo+ICAJcmV0dXJuIGZhbHNlOw0KPiAgfQ0KPiAgDQo+IA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
