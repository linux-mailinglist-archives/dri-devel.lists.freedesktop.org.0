Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D6AFBED
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8756EAC0;
	Wed, 11 Sep 2019 11:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A5C6EABF;
 Wed, 11 Sep 2019 11:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTaQQ8I4tPsL+bzhLUZ5l21AaJBAAiN97kYhErAO8Dv+vUqZ/gvgfry0Z1zvA4V2rP6wSLn7NX7iMDmPpOV0ov5inZb6eU0NZQ0yAJ38gLQKUXIFg+xurwYBJfa3ApHmWWkn3NBO50cvddwIaAi3IVoRtMmEecsIQou202GFZx/9x3Rz7q7H+zB2FbUtIXiDEW0kL0NnBq+MVht4JoiUPkIujHL0MyOP/Vsl+9LAE+saSHbohUtGkP5IEAQpHHRsZF/5CwwO0zGpPBkH+Iatl0ftQSD5HVWr+P3IQP+NDK5mb7RPSGHOkxTf2m6Fwm7pg1rJjKlxMjoqOeFmle/eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i23x7E+IXkEnP4gtZ8uWh5WqSf4bhfJ2XqT5HoicJFc=;
 b=E0/CHtc1kz7q0HQnZZcSLG++RdRyDvvmDjofQqueoW/y3KXYjl4SFHCQdLeZP9elcgL9dvQbX6xk+3PLQH/OKP4A+hNNDh0r3TX92EXjH1mbVre7kamExK+0IS7oS9jnLP7C9OoD5hV7PeU5tHgxlQFZ9aXKqlsaXPqTBxHHbAFTZyM6YXFsUK7fnm6ctaBuGoyX7i29YMOVyVwKVvRJQvmJ6yDaXSVpIrmEeODtJTgrbOC91hNmCJXOpdzxJMN9SSl8LpswFbX9iPkaf/e53m3Qdercb+q+LvUfi8vg4CkTDBJP6Axi2xosQfAOjJJGZJW1HVOF+4uaA1UfIy8Lcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2942.namprd12.prod.outlook.com (20.179.84.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 11:50:50 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:50 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcopKpC1OzuDEifbwgZtSrWxw==
Date: Wed, 11 Sep 2019 11:50:49 +0000
Message-ID: <1568202584-14471-15-git-send-email-ray.huang@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd6c9886-9a64-4200-def2-08d736ae4a6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2942; 
x-ms-traffictypediagnostic: MN2PR12MB2942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2942FA3F05BEBD4234A1AC18ECB10@MN2PR12MB2942.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(199004)(189003)(478600001)(6486002)(53936002)(3846002)(26005)(6512007)(102836004)(6506007)(386003)(7736002)(66066001)(8676002)(81166006)(2616005)(11346002)(446003)(476003)(486006)(6116002)(50226002)(36756003)(81156014)(8936002)(52116002)(186003)(305945005)(2906002)(76176011)(6636002)(99286004)(110136005)(54906003)(316002)(14444005)(5660300002)(256004)(2501003)(86362001)(4326008)(450100002)(25786009)(66946007)(6436002)(66556008)(71200400001)(71190400001)(66476007)(66446008)(14454004)(64756008)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2942;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ClqkMOxTWgZS4jLkkSEHWp1jXB0eRjdt2syYPw8ifRDNHG2VhtjGHeSYMrA/RfNGllGY7Mu8JpYmW1AgYm04vjKFK1PHPYJ3UCPhpCdZ46j+26c1Spuf6SEdmHcir7bj9m11z8qENIvwMa3auRy0KV093GsdmBdxNazrocFwZGIy6ldteAV6f4PmDRNozNpR8Mc+6kNi0e+2SDy2PRbpOUutBJUzseuhsN23erftckVFlHiOnW9KtVvepEHC1sxxjjWDUpkV3DY5sCQd3C7AQtoYfyyYEz39J6anmZbdoEFM/RXGbERdcaAdPbLE/k7SdKPGlCdkaP9Y0cH7Fb15Bw3m/KsnU3G3q8XgN+oyEp8fSOFI5aFa1h1TLtCdMN5/XDiFrVF34AVBllqTCimXdlTluiCqYQtbg7hQWHO2Ag4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c9886-9a64-4200-def2-08d736ae4a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:49.9630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1i+ZbCHsBlqGmLOaf0hr5zVlrDPD8ZIBl56H89ghM/nvHEMb+/4L1CPJPeU4KxVMEN6nn5oE6FQaREt6cY4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i23x7E+IXkEnP4gtZ8uWh5WqSf4bhfJ2XqT5HoicJFc=;
 b=0xd+d8j+AEf0wK0Q/ZGsMSnFeAiVzbQsmGM7Si6UhTZWVxFlL4zvtQwlW6n6kuDYr/vZPgxmwmdHN67CeF/j8lEjZex48BEWPXrPrmbmRpg7PFnvxJVKfytgQ1qU1OZpFy0jQX+Boau48biVd/2UT9yOvhfctiIswBOUCTLp5jE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKSWYgb25lIGJv
IGlzIHNlY3VyZSAoY3JlYXRlZCB3aXRoIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCksIHRo
ZSBUTVogYml0cyBvZgpQVEVzIHRoYXQgYmVsb25ncyB0aGF0IGJvIHNob3VsZCBiZSBzZXQuIFRo
ZW4gcHNwIGlzIGFibGUgdG8gcHJvdGVjdCB0aGUgcGFnZXMKb2YgdGhpcyBibyB0byBhdm9pZCB0
aGUgYWNjZXNzIGZyb20gYW4gInVudHJ1c3QiIGRvbWFpbiBzdWNoIGFzIENQVS4KCnYxOiBkZXNp
Z24gYW5kIGRyYWZ0IHRoZSBza2VsZXRpb24gb2YgdG16IGJpdHMgc2V0dGluZyBvbiBQVEVzIChB
bGV4KQp2MjogcmV0dXJuIGZhaWx1cmUgb25jZSBjcmVhdGUgc2VjdXJlIGJvIG9uIG5vLXRteiBw
bGF0Zm9ybSAgKFJheSkKClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgIHwgMTIgKysrKysrKysrKystCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAxMCArKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAgNSArKysrKwog
MyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCmluZGV4IDIyZWFiNzQuLjUzMzIxMDQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTIyMiw3ICsyMjIsOCBA
QCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwKIAkJICAg
ICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVEIHwKIAkJICAgICAgQU1ER1BVX0dFTV9D
UkVBVEVfVk1fQUxXQVlTX1ZBTElEIHwKLQkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElD
SVRfU1lOQykpCisJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMgfAorCQkg
ICAgICBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpKQogCiAJCXJldHVybiAtRUlOVkFMOwog
CkBAIC0yMzAsNiArMjMxLDExIEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCWlmIChhcmdzLT5pbi5kb21haW5zICYgfkFN
REdQVV9HRU1fRE9NQUlOX01BU0spCiAJCXJldHVybiAtRUlOVkFMOwogCisJaWYgKCFhZGV2LT50
bXouZW5hYmxlZCAmJiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpKSB7CisJ
CURSTV9FUlJPUigiQ2Fubm90IGFsbG9jYXRlIHNlY3VyZSBidWZmZXIgd2hpbGUgdG16IGlzIGRp
c2FibGVkXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCiAJLyogY3JlYXRlIGEgZ2VtIG9i
amVjdCB0byBjb250YWluIHRoaXMgb2JqZWN0IGluICovCiAJaWYgKGFyZ3MtPmluLmRvbWFpbnMg
JiAoQU1ER1BVX0dFTV9ET01BSU5fR0RTIHwKIAkgICAgQU1ER1BVX0dFTV9ET01BSU5fR1dTIHwg
QU1ER1BVX0dFTV9ET01BSU5fT0EpKSB7CkBAIC0yNTEsNiArMjU3LDEwIEBAIGludCBhbWRncHVf
Z2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQly
ZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+dGJvLnJlc3Y7CiAJfQogCisJaWYgKGZsYWdzICYgQU1E
R1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKSB7CisJCS8qIFhYWDogcGFkIG91dCBhbGlnbm1lbnQg
dG8gbWVldCBUTVogcmVxdWlyZW1lbnRzICovCisJfQorCiAJciA9IGFtZGdwdV9nZW1fb2JqZWN0
X2NyZWF0ZShhZGV2LCBzaXplLCBhcmdzLT5pbi5hbGlnbm1lbnQsCiAJCQkJICAgICAodTMyKSgw
eGZmZmZmZmZmICYgYXJncy0+aW4uZG9tYWlucyksCiAJCQkJICAgICBmbGFncywgdHRtX2JvX3R5
cGVfZGV2aWNlLCByZXN2LCAmZ29iaik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmgKaW5kZXggNWEzYzE3Ny4uMjg2ZTJlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaApAQCAtMjI0LDYgKzIyNCwxNiBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgYW1kZ3B1X2JvX2V4cGxpY2l0X3N5bmMoc3RydWN0IGFtZGdwdV9ibyAqYm8pCiAJ
cmV0dXJuIGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkM7CiB9CiAK
Ky8qKgorICogYW1kZ3B1X2JvX2VuY3J5cHRlZCAtIHJldHVybiB3aGV0aGVyIHRoZSBibyBpcyBl
bmNyeXB0ZWQKKyAqLworc3RhdGljIGlubGluZSBib29sIGFtZGdwdV9ib19lbmNyeXB0ZWQoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8pCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRn
cHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKKworCXJldHVybiBhZGV2LT50bXouZW5hYmxlZCAm
JiAoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKTsKK30KKwogYm9vbCBh
bWRncHVfYm9faXNfYW1kZ3B1X2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogdm9p
ZCBhbWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9tYWluKHN0cnVjdCBhbWRncHVfYm8gKmFibywg
dTMyIGRvbWFpbik7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRl
eCAzNjYzNjU1Li44ZjAwYmIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jCkBAIC0xNDM0LDYgKzE0MzQsOCBAQCBib29sIGFtZGdwdV90dG1fdHRfaXNfcmVhZG9ubHko
c3RydWN0IHR0bV90dCAqdHRtKQogdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVfZmxhZ3Moc3Ry
dWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKIHsKIAl1aW50NjRfdCBm
bGFncyA9IDA7CisJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8gPSB0dG1fbWVtX3JlZ190
b19ibyhtZW0pOworCXN0cnVjdCBhbWRncHVfYm8gKmFibyA9IHR0bV90b19hbWRncHVfYm8odGJv
KTsKIAogCWlmIChtZW0gJiYgbWVtLT5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKQogCQlmbGFn
cyB8PSBBTURHUFVfUFRFX1ZBTElEOwpAQCAtMTQ0NCw2ICsxNDQ2LDkgQEAgdWludDY0X3QgYW1k
Z3B1X3R0bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX21lbV9y
ZWcgKm1lbSkKIAkJaWYgKHR0bS0+Y2FjaGluZ19zdGF0ZSA9PSB0dF9jYWNoZWQpCiAJCQlmbGFn
cyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7CiAJfQorCWlmIChhbWRncHVfYm9fZW5jcnlwdGVkKGFi
bykpIHsKKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9UTVo7CisJfQogCiAJcmV0dXJuIGZsYWdzOwog
fQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
