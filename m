Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C213D8B1D8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73589DF9;
	Tue, 13 Aug 2019 07:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690071.outbound.protection.outlook.com [40.107.69.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1C689DF9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYMM/Tp+vJb2rK88PQpbNbMyuX6ib9skgJ0IRUNtopaIrvIKVmMIqG7h1eG5hk7bG/lIeoW9oY7zSzPlzJDYcGOxLvd26Ymubz1YGnBmWTicxUH4wvBdopkkekEjua8TVEBLK1IOM6v2IqTXDhiOU5WDJc4SlOpdMZPiQLtGTkp+8UG6cMRluXlnfSincJscN0l92xJAIgAOZSyQf/Qpz8vp/mJh+HZfcUpHl5gKeqOZcyk334+QphyaNNUiSKf/rxJPg5unLF24Ycm/6c31adX76EPwf8sjuUBkC764bQ2tPnEFiRnlMcxcM1HVoZ+tbnmnbUcjCqjChNpEwtmcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooIPPa0G5Zt+S29w2XT/WXIPMug1p+vSxqBsR+USUlo=;
 b=TlxJGm4kACL79Xd2Kvsc6JxYYyvSYeVCS+S+woX7hIlzVMFYJ+g7FXr0MTzKNzZkDwfpQJq8Su+QHmzORqHKC5YD5txQ44IAqwf/AZ7RAtHlSHfSiJCUurdT7Bvs1VEBFVNNEvAkEyuuHGjLMb4gRF3gSsM6PxGzWxgosLyun37nfbkjuvWpARyZIuzbUmVHpDjbLfYUWNbQeTcG+PDfcjmydt20ljp1ZjhVDxnVtegSwwwuaqJj0M3xxzmFlEpQJ6VjMwX6VIjjYK5+wvfT0IlrjXAqrbsfKcwX+yHZKBbo+mfseSkzsjtfMR1Lo0oa82D1E58p1WMeC61sdSzh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3182.namprd12.prod.outlook.com (20.179.83.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 07:58:43 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::69c2:5f32:2f63:5c]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::69c2:5f32:2f63:5c%3]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 07:58:43 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>
Subject: RE: [PATCH] drm/scheduler: use job count instead of peek
Thread-Topic: [PATCH] drm/scheduler: use job count instead of peek
Thread-Index: AQHVTsd652fGPi2VSkmA6NzCq2jz2qb4vD4w
Date: Tue, 13 Aug 2019 07:58:43 +0000
Message-ID: <MN2PR12MB3933C016F39597E293B2729C84D20@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <20190809153109.79228-1-christian.koenig@amd.com>
In-Reply-To: <20190809153109.79228-1-christian.koenig@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2315f885-9853-44c2-498b-08d71fc40fb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3182; 
x-ms-traffictypediagnostic: MN2PR12MB3182:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3182040AF9C866D4B87286C284D20@MN2PR12MB3182.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(13464003)(55016002)(52536014)(5660300002)(186003)(2501003)(305945005)(66066001)(99286004)(229853002)(6436002)(9686003)(8676002)(33656002)(74316002)(53936002)(6246003)(14454004)(86362001)(6636002)(8936002)(102836004)(25786009)(486006)(53546011)(26005)(7736002)(66556008)(2906002)(14444005)(66946007)(66446008)(64756008)(66476007)(316002)(71190400001)(7696005)(3846002)(76116006)(478600001)(76176011)(71200400001)(256004)(11346002)(66574012)(81156014)(446003)(476003)(110136005)(6116002)(6506007)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3182;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: soUwR0oipXU/eRMCkVHUzorryO3r7vS+DPHgAAyk5vtStclM0vvgOYNHgJ9wOK77SBNUOg8J3bFbKcDT+ngpBdCGloHuzlF4/JDHCqW+jnYTuz3r5tofvGN5jlUGe0Vc9HWBM0nn6h7Hr0VthZ42q40TY/e+xkl4Hwquq0xHi+JygcL0uQtwIy8D7WRNhMZtAeyCcHC9E2KjbajKIbwrZonuD/+xQk4NNG20YB2Or/VkdmW5vrqa66x6/QDnfzuponWsncHtOihG2Y4jT/W7k2asThbrt1KeiMlLBWAvKAYpDi4k9p9WPlFFXuPupArT0EoZxnUN0I+GFuAc5lQsdQ6TegDgqG553WiCfOCXUtgxZHSCr2JmhT+i18m9v+OFTLpE9+H2IN7150mzBQ6EP4ohbdtL7xeR8O1gIqDEmFA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2315f885-9853-44c2-498b-08d71fc40fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 07:58:43.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHQsNhS966e3HUnvKSViebIq9jObBTErDocVxagPeti7Wlxe0lVAN5dcifTG8gqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3182
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooIPPa0G5Zt+S29w2XT/WXIPMug1p+vSxqBsR+USUlo=;
 b=V7jTX2KqN1ZdPVC31AC89ET8+0xWpCEtMya6CLC+Rp+Aod9BetOyBXb+6NMYdMCv0WzXL2bSe2APqy+xKfIrgHLIm8JxfaHE1uxa4bH9yxsRAPiCtFbFG0wf5FmJ7AiqfoOtFjCAQ8Uh4oBjXY4gn2wYu9CPbtpWVOgthla0OEM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE1vbmsubGl1QGFtZC5jb20NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KTW9uayBMaXV8R1BVIFZpcnR1YWxpemF0aW9uIFRlYW0gfEFNRA0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29l
bmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIEF1Z3VzdCA5LCAy
MDE5IDExOjMxIFBNDQpUbzogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBh
bWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGl1LCBNb25rIDxNb25r
LkxpdUBhbWQuY29tPjsgRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NClN1YmplY3Q6
IFtQQVRDSF0gZHJtL3NjaGVkdWxlcjogdXNlIGpvYiBjb3VudCBpbnN0ZWFkIG9mIHBlZWsNCg0K
VGhlIHNwc2NfcXVldWVfcGVlayBmdW5jdGlvbiBpcyBhY2Nlc3NpbmcgcXVldWUtPmhlYWQgd2hp
Y2ggYmVsb25ncyB0byB0aGUgY29uc3VtZXIgdGhyZWFkIGFuZCBzaG91bGRuJ3QgYmUgYWNjZXNz
ZWQgYnkgdGhlIHByb2R1Y2VyDQoNClRoaXMgaXMgZml4aW5nIGEgcmFyZSByYWNlIGNvbmRpdGlv
biB3aGVuIGRlc3Ryb3lpbmcgZW50aXRpZXMuDQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZW50aXR5LmMNCmluZGV4IDM1ZGRiZWMxMzc1YS4uNjcxYzkwZjM0ZWRlIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYw0KQEAgLTk1LDcgKzk1LDcgQEAgc3Rh
dGljIGJvb2wgZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5
ICplbnRpdHkpDQogCXJtYigpOyAvKiBmb3IgbGlzdF9lbXB0eSB0byB3b3JrIHdpdGhvdXQgbG9j
ayAqLw0KIA0KIAlpZiAobGlzdF9lbXB0eSgmZW50aXR5LT5saXN0KSB8fA0KLQkgICAgc3BzY19x
dWV1ZV9wZWVrKCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gTlVMTCkNCisJICAgIHNwc2NfcXVldWVf
Y291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSAwKQ0KIAkJcmV0dXJuIHRydWU7DQogDQogCXJl
dHVybiBmYWxzZTsNCkBAIC0yODEsNyArMjgxLDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2Zp
bmkoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkNCiAJLyogQ29uc3VtcHRpb24gb2Yg
ZXhpc3RpbmcgSUJzIHdhc24ndCBjb21wbGV0ZWQuIEZvcmNlZnVsbHkNCiAJICogcmVtb3ZlIHRo
ZW0gaGVyZS4NCiAJICovDQotCWlmIChzcHNjX3F1ZXVlX3BlZWsoJmVudGl0eS0+am9iX3F1ZXVl
KSkgew0KKwlpZiAoc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5LT5qb2JfcXVldWUpKSB7DQogCQlp
ZiAoc2NoZWQpIHsNCiAJCQkvKiBQYXJrIHRoZSBrZXJuZWwgZm9yIGEgbW9tZW50IHRvIG1ha2Ug
c3VyZSBpdCBpc24ndCBwcm9jZXNzaW5nDQogCQkJICogb3VyIGVuaXR5Lg0KLS0NCjIuMTcuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
