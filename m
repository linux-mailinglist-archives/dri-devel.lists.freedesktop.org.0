Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A213324A3E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11689254;
	Tue, 21 May 2019 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720041.outbound.protection.outlook.com [40.107.72.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A6C89254
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:24:55 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6384.namprd05.prod.outlook.com (20.178.246.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.12; Tue, 21 May 2019 08:24:53 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 08:24:53 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/vmwgfx: Use the dma scatter-gather iterator to get
 dma addresses
Thread-Topic: [PATCH 4/6] drm/vmwgfx: Use the dma scatter-gather iterator to
 get dma addresses
Thread-Index: AQHVD66qNal7EytNE0eNifRrrUqBPw==
Date: Tue, 21 May 2019 08:24:53 +0000
Message-ID: <20190521082345.27286-4-thellstrom@vmware.com>
References: <20190521082345.27286-1-thellstrom@vmware.com>
In-Reply-To: <20190521082345.27286-1-thellstrom@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0156.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::34) To MN2PR05MB6141.namprd05.prod.outlook.com
 (2603:10b6:208:c7::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdd66728-616b-4b97-d0f3-08d6ddc5ccaa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6384; 
x-ms-traffictypediagnostic: MN2PR05MB6384:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR05MB638458017A79D2ED7A3AD2C4A1070@MN2PR05MB6384.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(25786009)(6116002)(8676002)(305945005)(14454004)(5660300002)(3846002)(476003)(54906003)(11346002)(81156014)(26005)(486006)(81166006)(256004)(14444005)(68736007)(76176011)(71200400001)(8936002)(7736002)(6916009)(1076003)(478600001)(2616005)(446003)(71190400001)(966005)(66476007)(66556008)(64756008)(66446008)(73956011)(36756003)(6512007)(86362001)(6306002)(66946007)(2906002)(66066001)(186003)(53936002)(52116002)(50226002)(316002)(4326008)(2501003)(102836004)(386003)(6506007)(99286004)(5640700003)(6436002)(2351001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6384;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eWeJAu9lzbEfx3GXFBRfjFaPTbZTye4X9SBzSfvB3nmtbwkbpqY5hwMVP78Eeo96u04eOrZLY5gb0FUoj6CPLpMoTuvaGYcEc7bU3D4H6eVD2WwQYwJ/1O09RvMmuGX082p6zXFGSHWjGskMRLGLf4xYgxEiwPXkiaUL3Qm75F4hQKMUcVrS0aohxgaJfHhugkVyu5KARFgYoBULfzix/jwY2NCLHLHHvR1UEeEtIkXBHcWkSbjSdkXgkeniUbnZ8OQbAgHqHAMuvtUko7CtoPOaULVfo27MlWsAqGkhCHDcQFwPJ5EZ96LRPJRXk1+LLdcxZvU++vH/8ecMn+GLBRbbOsO6pZ815uFXQ7hnEHi1uQ+Q6J3BvOj6kZIVIIsQDVRML4sr+qBuTw3qk228WgjkyZy8alcGVRPSlD21F6s=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd66728-616b-4b97-d0f3-08d6ddc5ccaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 08:24:53.5274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6384
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAJ06D/I1tJ/ruTVuxS/vHUc6uZG/+76HwmMu9uR+Xc=;
 b=xyFDzAOJwQTnPl68F8Xgw2NpAfDaDAR8Jdq+9eWyTCNWcnMruoKfx4ly2tC0Lib4BWvKV6tz45pevfOmgmh/dRF3X3Ug+uCWbc/s0kX/dNiZ4P6ip9a5p1L60v8r9FgqJJUcYR6kH/W9y6IAACgudxLYWFh+xZU2f1vY0Y7npko=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Jason Gunthorpe <jgg@mellanox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHN0cnVjdCBzZ19kbWFfcGFnZV9pdGVyIGluIGZhdm91ciBzdHJ1Y3Qgb2Ygc2dfcGFnZV9p
dGVyLCB3aGljaCBmYWlybHkNCnJlY2VudGx5IHdhcyBkZWNsYXJlZCB1c2VsZXNzIGZvciBvYnRh
aW5pbmcgZG1hIGFkZHJlc3Nlcy4NCg0KV2l0aCBhIHN0cnVjdCBzZ19kbWFfcGFnZV9pdGVyIHdl
IGNhbid0IGNhbGwgc2dfcGFnZV9pdGVyX3BhZ2UoKSBzbw0Kd2hlbiB0aGUgcGFnZSBpcyBuZWVk
ZWQsIHVzZSB0aGUgc2FtZSBwYWdlIGxvb2t1cCBtZWNoYW5pc20gYXMgZm9yIHRoZQ0Kbm9uLXNn
IGRtYSBtb2RlcyBpbnN0ZWFkIG9mIGNhbGxpbmcgc2dfZG1hX3BhZ2VfaXRlci4NCg0KTm90ZSwg
dGhlIGZpeGVzIHRhZyBkb2Vzbid0IHJlYWxseSBwb2ludCB0byBhIGNvbW1pdCBpbnRyb2R1Y2lu
ZyBhDQpmYWlsdXJlIC8gcmVncmVzc2lvbiwgYnV0IHJhdGhlciB0byBhIGNvbW1pdCB0aGF0IGlt
cGxlbWVudGVkIGEgc2ltcGxlDQp3b3JrYXJvdW5kIGZvciB0aGlzIHByb2JsZW0uDQoNCkNjOiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQpGaXhlczogZDkwMWIyNzYwZGM2ICgi
bGliL3NjYXR0ZXJsaXN0OiBQcm92aWRlIGEgRE1BIHBhZ2UgaXRlcmF0b3IiKQ0KU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KUmV2aWV3ZWQt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAyICstDQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0K
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgNCmluZGV4IDk2OTgzYzQ3ZmI0MC4uMzY2ZGNmYzFm
OWJiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oDQpAQCAtMjk2LDcgKzI5Niw3
IEBAIHN0cnVjdCB2bXdfc2dfdGFibGUgew0KIHN0cnVjdCB2bXdfcGl0ZXIgew0KIAlzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzOw0KIAljb25zdCBkbWFfYWRkcl90ICphZGRyczsNCi0Jc3RydWN0IHNnX3Bh
Z2VfaXRlciBpdGVyOw0KKwlzdHJ1Y3Qgc2dfZG1hX3BhZ2VfaXRlciBpdGVyOw0KIAl1bnNpZ25l
ZCBsb25nIGk7DQogCXVuc2lnbmVkIGxvbmcgbnVtX3BhZ2VzOw0KIAlib29sICgqbmV4dCkoc3Ry
dWN0IHZtd19waXRlciAqKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVm
ZmVyLmMNCmluZGV4IGEzMzU3ZmY3NTQwZC4uYTZlYTc1YjU4YTgzIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMNCkBAIC0yNjYsNyArMjY2LDkgQEAgc3Rh
dGljIGJvb2wgX192bXdfcGl0ZXJfbm9uX3NnX25leHQoc3RydWN0IHZtd19waXRlciAqdml0ZXIp
DQogDQogc3RhdGljIGJvb2wgX192bXdfcGl0ZXJfc2dfbmV4dChzdHJ1Y3Qgdm13X3BpdGVyICp2
aXRlcikNCiB7DQotCXJldHVybiBfX3NnX3BhZ2VfaXRlcl9uZXh0KCZ2aXRlci0+aXRlcik7DQor
CWJvb2wgcmV0ID0gX192bXdfcGl0ZXJfbm9uX3NnX25leHQodml0ZXIpOw0KKw0KKwlyZXR1cm4g
X19zZ19wYWdlX2l0ZXJfZG1hX25leHQoJnZpdGVyLT5pdGVyKSAmJiByZXQ7DQogfQ0KIA0KIA0K
QEAgLTI4NCwxMiArMjg2LDYgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpfX3Ztd19waXRlcl9ub25f
c2dfcGFnZShzdHJ1Y3Qgdm13X3BpdGVyICp2aXRlcikNCiAJcmV0dXJuIHZpdGVyLT5wYWdlc1t2
aXRlci0+aV07DQogfQ0KIA0KLXN0YXRpYyBzdHJ1Y3QgcGFnZSAqX192bXdfcGl0ZXJfc2dfcGFn
ZShzdHJ1Y3Qgdm13X3BpdGVyICp2aXRlcikNCi17DQotCXJldHVybiBzZ19wYWdlX2l0ZXJfcGFn
ZSgmdml0ZXItPml0ZXIpOw0KLX0NCi0NCi0NCiAvKioNCiAgKiBIZWxwZXIgZnVuY3Rpb25zIHRv
IHJldHVybiB0aGUgRE1BIGFkZHJlc3Mgb2YgdGhlIGN1cnJlbnQgcGFnZS4NCiAgKg0KQEAgLTMx
MSwxMyArMzA3LDcgQEAgc3RhdGljIGRtYV9hZGRyX3QgX192bXdfcGl0ZXJfZG1hX2FkZHIoc3Ry
dWN0IHZtd19waXRlciAqdml0ZXIpDQogDQogc3RhdGljIGRtYV9hZGRyX3QgX192bXdfcGl0ZXJf
c2dfYWRkcihzdHJ1Y3Qgdm13X3BpdGVyICp2aXRlcikNCiB7DQotCS8qDQotCSAqIEZJWE1FOiBU
aGlzIGRyaXZlciB3cm9uZ2x5IG1peGVzIERNQSBhbmQgQ1BVIFNHIGxpc3QgaXRlcmF0aW9uIGFu
ZA0KLQkgKiBuZWVkcyByZXZpc2lvbi4gU2VlDQotCSAqIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAxOTAxMDQyMjM1MzEuR0ExNzA1QHppZXBlLmNhLw0KLQkgKi8NCi0JcmV0dXJuIHNn
X3BhZ2VfaXRlcl9kbWFfYWRkcmVzcygNCi0JCWNvbnRhaW5lcl9vZigmdml0ZXItPml0ZXIsIHN0
cnVjdCBzZ19kbWFfcGFnZV9pdGVyLCBiYXNlKSk7DQorCXJldHVybiBzZ19wYWdlX2l0ZXJfZG1h
X2FkZHJlc3MoJnZpdGVyLT5pdGVyKTsNCiB9DQogDQogDQpAQCAtMzM2LDI2ICszMjYsMjMgQEAg
dm9pZCB2bXdfcGl0ZXJfc3RhcnQoc3RydWN0IHZtd19waXRlciAqdml0ZXIsIGNvbnN0IHN0cnVj
dCB2bXdfc2dfdGFibGUgKnZzZ3QsDQogew0KIAl2aXRlci0+aSA9IHBfb2Zmc2V0IC0gMTsNCiAJ
dml0ZXItPm51bV9wYWdlcyA9IHZzZ3QtPm51bV9wYWdlczsNCisJdml0ZXItPnBhZ2UgPSAmX192
bXdfcGl0ZXJfbm9uX3NnX3BhZ2U7DQorCXZpdGVyLT5wYWdlcyA9IHZzZ3QtPnBhZ2VzOw0KIAlz
d2l0Y2ggKHZzZ3QtPm1vZGUpIHsNCiAJY2FzZSB2bXdfZG1hX3BoeXM6DQogCQl2aXRlci0+bmV4
dCA9ICZfX3Ztd19waXRlcl9ub25fc2dfbmV4dDsNCiAJCXZpdGVyLT5kbWFfYWRkcmVzcyA9ICZf
X3Ztd19waXRlcl9waHlzX2FkZHI7DQotCQl2aXRlci0+cGFnZSA9ICZfX3Ztd19waXRlcl9ub25f
c2dfcGFnZTsNCi0JCXZpdGVyLT5wYWdlcyA9IHZzZ3QtPnBhZ2VzOw0KIAkJYnJlYWs7DQogCWNh
c2Ugdm13X2RtYV9hbGxvY19jb2hlcmVudDoNCiAJCXZpdGVyLT5uZXh0ID0gJl9fdm13X3BpdGVy
X25vbl9zZ19uZXh0Ow0KIAkJdml0ZXItPmRtYV9hZGRyZXNzID0gJl9fdm13X3BpdGVyX2RtYV9h
ZGRyOw0KLQkJdml0ZXItPnBhZ2UgPSAmX192bXdfcGl0ZXJfbm9uX3NnX3BhZ2U7DQogCQl2aXRl
ci0+YWRkcnMgPSB2c2d0LT5hZGRyczsNCi0JCXZpdGVyLT5wYWdlcyA9IHZzZ3QtPnBhZ2VzOw0K
IAkJYnJlYWs7DQogCWNhc2Ugdm13X2RtYV9tYXBfcG9wdWxhdGU6DQogCWNhc2Ugdm13X2RtYV9t
YXBfYmluZDoNCiAJCXZpdGVyLT5uZXh0ID0gJl9fdm13X3BpdGVyX3NnX25leHQ7DQogCQl2aXRl
ci0+ZG1hX2FkZHJlc3MgPSAmX192bXdfcGl0ZXJfc2dfYWRkcjsNCi0JCXZpdGVyLT5wYWdlID0g
Jl9fdm13X3BpdGVyX3NnX3BhZ2U7DQotCQlfX3NnX3BhZ2VfaXRlcl9zdGFydCgmdml0ZXItPml0
ZXIsIHZzZ3QtPnNndC0+c2dsLA0KKwkJX19zZ19wYWdlX2l0ZXJfc3RhcnQoJnZpdGVyLT5pdGVy
LmJhc2UsIHZzZ3QtPnNndC0+c2dsLA0KIAkJCQkgICAgIHZzZ3QtPnNndC0+b3JpZ19uZW50cywg
cF9vZmZzZXQpOw0KIAkJYnJlYWs7DQogCWRlZmF1bHQ6DQotLSANCjIuMjAuMQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
