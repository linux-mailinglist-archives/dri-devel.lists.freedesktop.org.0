Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97FBDF56
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FD16EBBA;
	Wed, 25 Sep 2019 13:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A26EBCD;
 Wed, 25 Sep 2019 13:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMEoRxwZazmIJs9KYu7OqLpfZemxFUaXGIYthbFVLjZyM9blFUvDwCba5jElMS3SacFTiLeTBQqahrwB/ZwCg52U1wKuv6kGq3xrux0nNO/fdkcpmR7embGjE4AaHzxv1J+zSYZjVEN3G9ztxmk5U+l4gQnOFJwwP8xACYsCavzj67gT4d+MwKGo/wW97pN4Jrxwj8Y9hOVELGYgS/dQ1mddPhCAIe8zJMcfZRqdBHaqUmDrTWfNfKZCox0PLYAw3bmafFM8yAE5KPpYaqqyB820W+ch9CkElmGY1hKaKHplMYlWtSSJWfYcmbTVWiV7bPRP+CfLMrCoOgHETSfA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWfqDO7YTemPIScxEfza/VZXafHJ6u1OmcRS3ig87aY=;
 b=WBi7vRX7+0HMDQz6XTaFTRVM/eNXiuOLJPnAulnLGqlSr5X4lBKnozBr9GAUnyp0ttNCVzj7+YdqIeL2NO2j/MtmfsfgWgtYcwO9xVXUbNg3qOd29TWsTc1RlJPxbEvgbKoxAW29zMh0HtgQRHg/kcKNrh/ru6ALyGHi2LPPqC3mxaLRihg4DvmGAprKW89M+UCP00VIAEf/jplC6BJYwK8SBGUKDiiHlBIfI79k5GWjwmk18bWdK9CBhEYZZpGAl9iXLPp9e6M3ts4vDs/dLL17BcaiIsd0UeQw0qSGOl58iwBU63g6yeRxvlrKIBgmWWpx4XnSlOh8ACfvLfxwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:46 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:45 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 11/11] drm/amdgpu: set TMZ bits in PTEs for secure BO (v4)
Thread-Topic: [PATCH v2 11/11] drm/amdgpu: set TMZ bits in PTEs for secure BO
 (v4)
Thread-Index: AQHVc6eI1d3ghHPBckefwNlAIA9rmQ==
Date: Wed, 25 Sep 2019 13:45:45 +0000
Message-ID: <1569419090-5304-12-git-send-email-ray.huang@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57b4a1d7-b5f5-487f-2b10-08d741beaa6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304587DACB592F78D493DC0EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(14444005)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qghEaAZAm/8MmJerLu1oHP6nOE3alHC5036KghR91ba82kQKkeslTgo+rdtwACfYYCrDORJnEW2WyMcAfC4//vHIi9pJligwo6vsIBZg/iL1HhP9gS1hclGTcGJcX5dWtGgjHx7ISS48PLXsv+ZsLtSLIpzRBv9CE1Nc19DEXF7lduHU7CLQXrdbKL2M4zqfAzMlBAPLkLxp609b1zPIfS7EUs9Q3//QvRQO7K1cXWaecORg7+6nQwpJNNYL58h/OAqshCuy9F9XPIlVxgvBdpvoz4jED5M5JQ93K9ulyKKr7pYnCHHH0MZ7XsqsiYOnOGHjGBXS+KdaBazFlddwVFEWS53ZJCPVvwg5b9V8ZC7LwtN5toPItbPHfy3UEEd7y2mePftAdAoKBZ85T3s0KmEvHv5ZPrGAb9wC/Buio34=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b4a1d7-b5f5-487f-2b10-08d741beaa6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:45.8168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DU/eco+EK8dFmfgBYG0dNmA12WPHgYhB2+KxffiXEhwsj+5LZp3oNrL9zUZIJtzoSLGrgg13VAoE52XxzzGlVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWfqDO7YTemPIScxEfza/VZXafHJ6u1OmcRS3ig87aY=;
 b=iKghWPiEOG/TtuikLf1RAuq8c3/rYeaikDzn6VkJibO9rTQOeon8FcUSVmV9TJUE6iVBWNyuMZwopiJ4c1IV98KctzppsOmH3RyDSjjk7YAv+ookr1MrXDvc+BbKe3c6Lz9VRNRaJgrZrdfnHKjcAGmBeEQyvYbEpG7J8oSrUcY=
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

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKSWYgYSBidWZm
ZXIgb2JqZWN0IGlzIHNlY3VyZSwgaS5lLiBjcmVhdGVkIHdpdGgKQU1ER1BVX0dFTV9DUkVBVEVf
RU5DUllQVEVELCB0aGVuIHRoZSBUTVogYml0IG9mCnRoZSBQVEVzIHRoYXQgYmVsb25nIHRoZSBi
dWZmZXIgb2JqZWN0IHNob3VsZCBiZQpzZXQuCgp2MTogZGVzaWduIGFuZCBkcmFmdCB0aGUgc2tl
bGV0aW9uIG9mIFRNWiBiaXRzIHNldHRpbmcgb24gUFRFcyAoQWxleCkKdjI6IHJldHVybiBmYWls
dXJlIG9uY2UgY3JlYXRlIHNlY3VyZSBCTyBvbiBub24tVE1aIHBsYXRmb3JtICAoUmF5KQp2Mzog
YW1kZ3B1X2JvX2VuY3J5cHRlZCgpIG9ubHkgY2hlY2tzIHRoZSBCTyAoTHViZW4pCnY0OiBtb3Zl
IFRNWiBmbGFnIHNldHRpbmcgaW50byBhbWRncHVfdm1fYm9fdXBkYXRlICAoQ2hyaXN0aWFuKQoK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpS
ZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292
IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMgICAgfCAxMiArKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaCB8IDExICsrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyAgICAgfCAgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jCmluZGV4IDIyZWFiNzQuLjUzMzIxMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2VtLmMKQEAgLTIyMiw3ICsyMjIsOCBAQCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJICAgICAgQU1ER1BV
X0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwKIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJB
TV9DTEVBUkVEIHwKIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVk1fQUxXQVlTX1ZBTElEIHwK
LQkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElDSVRfU1lOQykpCisJCSAgICAgIEFNREdQ
VV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMgfAorCQkgICAgICBBTURHUFVfR0VNX0NSRUFURV9F
TkNSWVBURUQpKQogCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC0yMzAsNiArMjMxLDExIEBAIGlu
dCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAogCWlmIChhcmdzLT5pbi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0spCiAJ
CXJldHVybiAtRUlOVkFMOwogCisJaWYgKCFhZGV2LT50bXouZW5hYmxlZCAmJiAoZmxhZ3MgJiBB
TURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpKSB7CisJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9j
YXRlIHNlY3VyZSBidWZmZXIgd2hpbGUgdG16IGlzIGRpc2FibGVkXG4iKTsKKwkJcmV0dXJuIC1F
SU5WQUw7CisJfQorCiAJLyogY3JlYXRlIGEgZ2VtIG9iamVjdCB0byBjb250YWluIHRoaXMgb2Jq
ZWN0IGluICovCiAJaWYgKGFyZ3MtPmluLmRvbWFpbnMgJiAoQU1ER1BVX0dFTV9ET01BSU5fR0RT
IHwKIAkgICAgQU1ER1BVX0dFTV9ET01BSU5fR1dTIHwgQU1ER1BVX0dFTV9ET01BSU5fT0EpKSB7
CkBAIC0yNTEsNiArMjU3LDEwIEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQlyZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+
dGJvLnJlc3Y7CiAJfQogCisJaWYgKGZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVE
KSB7CisJCS8qIFhYWDogcGFkIG91dCBhbGlnbm1lbnQgdG8gbWVldCBUTVogcmVxdWlyZW1lbnRz
ICovCisJfQorCiAJciA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2LCBzaXplLCBhcmdz
LT5pbi5hbGlnbm1lbnQsCiAJCQkJICAgICAodTMyKSgweGZmZmZmZmZmICYgYXJncy0+aW4uZG9t
YWlucyksCiAJCQkJICAgICBmbGFncywgdHRtX2JvX3R5cGVfZGV2aWNlLCByZXN2LCAmZ29iaik7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKaW5kZXggNWEzYzE3
Ny4uNzVjNzM5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
aApAQCAtMjI0LDYgKzIyNCwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2JvX2V4cGxp
Y2l0X3N5bmMoc3RydWN0IGFtZGdwdV9ibyAqYm8pCiAJcmV0dXJuIGJvLT5mbGFncyAmIEFNREdQ
VV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkM7CiB9CiAKKy8qKgorICogYW1kZ3B1X2JvX2VuY3J5
cHRlZCAtIHRlc3QgaWYgdGhlIEJPIGlzIGVuY3J5cHRlZAorICogQGJvOiBwb2ludGVyIHRvIGEg
YnVmZmVyIG9iamVjdAorICoKKyAqIFJldHVybiB0cnVlIGlmIHRoZSBidWZmZXIgb2JqZWN0IGlz
IGVuY3J5cHRlZCwgZmFsc2Ugb3RoZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGJvb2wgYW1k
Z3B1X2JvX2VuY3J5cHRlZChzdHJ1Y3QgYW1kZ3B1X2JvICpibykKK3sKKwlyZXR1cm4gYm8tPmZs
YWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEOworfQorCiBib29sIGFtZGdwdV9ib19p
c19hbWRncHVfYm8oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CiB2b2lkIGFtZGdwdV9i
b19wbGFjZW1lbnRfZnJvbV9kb21haW4oc3RydWN0IGFtZGdwdV9ibyAqYWJvLCB1MzIgZG9tYWlu
KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwppbmRleCBiMjg1YWIyLi44
ZTEzYjFmZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0xNjg4
LDYgKzE2ODgsMTEgQEAgaW50IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAKIAlpZiAoYm8pIHsKIAkJZmxhZ3MgPSBhbWRncHVfdHRtX3R0X3B0ZV9mbGFn
cyhhZGV2LCBiby0+dGJvLnR0bSwgbWVtKTsKKworCQlpZiAoYW1kZ3B1X2JvX2VuY3J5cHRlZChi
bykpIHsKKwkJCWZsYWdzIHw9IEFNREdQVV9QVEVfVE1aOworCQl9CisKIAkJYm9fYWRldiA9IGFt
ZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwogCX0gZWxzZSB7CiAJCWZsYWdzID0gMHgwOwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
