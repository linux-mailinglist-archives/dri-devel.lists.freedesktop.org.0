Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF925181D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0487389CB5;
	Mon, 24 Jun 2019 16:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5308A89CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:10:56 +0000 (UTC)
Received: from BYAPR05MB5240.namprd05.prod.outlook.com (20.177.231.90) by
 BYAPR05MB6341.namprd05.prod.outlook.com (20.178.197.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Mon, 24 Jun 2019 16:10:49 +0000
Received: from BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::400:2b5c:7cd8:8356]) by BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::400:2b5c:7cd8:8356%4]) with mapi id 15.20.2008.007; Mon, 24 Jun 2019
 16:10:49 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Colin King <colin.king@canonical.com>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, Thomas Hellstrom
 <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/vmwgfx: fix memory leak when too many retries have
 occurred
Thread-Topic: [PATCH] drm/vmwgfx: fix memory leak when too many retries have
 occurred
Thread-Index: AQHVKIGqKLB+io/n0UK4Yb3I5nUXuaaq/gqA
Date: Mon, 24 Jun 2019 16:10:49 +0000
Message-ID: <7b8430b3809eff2341d3e82c398038c1a9a0cc06.camel@vmware.com>
References: <20190621223534.14283-1-colin.king@canonical.com>
In-Reply-To: <20190621223534.14283-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To BYAPR05MB5240.namprd05.prod.outlook.com
 (2603:10b6:a03:9f::26)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70a715f9-39ac-4b6a-15c3-08d6f8be85c2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR05MB6341; 
x-ms-traffictypediagnostic: BYAPR05MB6341:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB634195D00A8523A60F64D0E3BAE00@BYAPR05MB6341.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(66446008)(25786009)(66066001)(2616005)(73956011)(14454004)(53936002)(76176011)(305945005)(66476007)(68736007)(2501003)(2906002)(66946007)(110136005)(478600001)(6116002)(6506007)(4326008)(14444005)(66556008)(3846002)(64756008)(316002)(6486002)(229853002)(54906003)(446003)(11346002)(256004)(71190400001)(50226002)(476003)(486006)(102836004)(81156014)(5660300002)(26005)(386003)(6512007)(8936002)(6246003)(81166006)(8676002)(86362001)(52116002)(99286004)(7736002)(71200400001)(6436002)(186003)(118296001)(36756003)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6341;
 H:BYAPR05MB5240.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2APgiZx/Htreq/Phcqu/3J9E4NYm1BhoQ8V/aW0vBhd/hldPJ4clfwTuInnuiLTHRyeD9snBWq9pig2TheIVgtSpoJhaA635TfZjKTFDBPZwmLxDMRPy/7CuE+jQFb0FzhK5vUKq3puuUNYXlVjUSTqXf7W88yEA60060BgSMVrh/claM3I1kLVXJW89uM7YdWaPC+4Po+dVT0KKtzwNVCexz3gu7zdrGr36/gHAMiGJvuWKC8X1dB9U+Fkvhqn7+ZJIDEfLvq+ZFmHe2FyMmAeb4I9G8vibfVwAfOCovV3Da0SAh13VY5LGwJXpM3Gj8CcoigxMlwyCEdvpGFjtcIASyPy/AbK+XH1hvt6t/oxBuTf31x4FGU4hKjpVQgtxoFasPc7liITk2UaEiE02q7xUbx6UFGBaZ+mETRDad18=
Content-ID: <0B8CB3EDAB0F1A4FB20E28752BE4FA16@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a715f9-39ac-4b6a-15c3-08d6f8be85c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 16:10:49.6224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drawat@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6341
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOsXs+cI5bcOLhB+pAxMhmfW/TNhk7z3OIzkAYrP358=;
 b=pyTK6DQq+eqSHs5MysNCk71Bwez02gadBkD6hCT94+OolNpLOQiomyK4TtvwCidWdp2mWmO00c1+nk5LjMEPxN8kRR6QXeMa0XrFdJIqjYI1lX52OemRplktycXxI1zi1tXSpcl/B9Ezvd/voQjBjKnLR+JMassQgp84deFElPM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29saW4sDQoNClRoYW5rcyBmb3IgZG9pbmcgdGhpcy4NCg0KUmV2aWV3ZWQtYnk6IERlZXBh
ayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+DQoNCkRvIHlvdSB3YW50IG1lIHRvIGluY2x1ZGUg
dGhpcyBpbiB2bXdnZngtbmV4dCBvciB3aWxsIHlvdSBzdWJtaXQgdGhpcw0KdmlhIGRybS1taWNz
Pw0KDQpPbiBGcmksIDIwMTktMDYtMjEgYXQgMjM6MzUgKzAxMDAsIENvbGluIEtpbmcgd3JvdGU6
DQo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0K
PiBDdXJyZW50bHkgd2hlbiB0b28gbWFueSByZXRyaWVzIGhhdmUgb2NjdXJyZWQgdGhlcmUgaXMg
YSBtZW1vcnkNCj4gbGVhayBvbiB0aGUgYWxsb2NhdGlvbiBmb3IgcmVwbHkgb24gdGhlIGVycm9y
IHJldHVybiBwYXRoLiBGaXgNCj4gdGhpcyBieSBrZnJlZSdpbmcgcmVwbHkgYmVmb3JlIHJldHVy
bmluZy4NCj4gDQo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJSZXNvdXJjZSBsZWFrIikNCj4gRml4
ZXM6IGE5Y2Q5YzA0NGFhOSAoImRybS92bXdnZng6IEFkZCBhIGNoZWNrIHRvIGhhbmRsZSBob3N0
IG1lc3NhZ2UNCj4gZmFpbHVyZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfbXNnLmMgfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9tc2cuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5j
DQo+IGluZGV4IDhiOTI3MGYzMTQwOS4uOGI2MWYxNmY1MGNmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9tc2cuYw0KPiBAQCAtMzAxLDggKzMwMSwxMCBAQCBzdGF0aWMgaW50IHZt
d19yZWN2X21zZyhzdHJ1Y3QgcnBjX2NoYW5uZWwNCj4gKmNoYW5uZWwsIHZvaWQgKiptc2csDQo+
ICAJCWJyZWFrOw0KPiAgCX0NCj4gIA0KPiAtCWlmIChyZXRyaWVzID09IFJFVFJJRVMpDQo+ICsJ
aWYgKHJldHJpZXMgPT0gUkVUUklFUykgew0KPiArCQlrZnJlZShyZXBseSk7DQo+ICAJCXJldHVy
biAtRUlOVkFMOw0KPiArCX0NCj4gIA0KPiAgCSptc2dfbGVuID0gcmVwbHlfbGVuOw0KPiAgCSpt
c2cgICAgID0gcmVwbHk7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
