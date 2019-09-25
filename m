Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE0BE05A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0296EBD6;
	Wed, 25 Sep 2019 14:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63B06EBD6;
 Wed, 25 Sep 2019 14:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1tO0GbTsHpKgT6Uwe8FtyDx2fP8LBFeQDPENNqoCGCTQ6Kn0fIuhWGyszPe4PoLZG3XQKYT8wsbwJ3sztiCuImQckSmj4OElRiA46mFKlpqHAiHZkhhg2AswyEl4oCegZyZzo36wiZr+ZUADsyLEouZQdUmFf8oUZEnaSXkTsGfI3iMSemrhW13ajXl9Lnq2RF6m03Jwl8URg4qilR0WufQyJoPo3o49Cpn0HZJg3XR8AVInP9JDFjBM3tj9s2QZP9LZ7dQjUxp3YBBt0NgK1QX5O++8a9zOcKqGZFJcZlKDQHggsHYUGB0FSMmjVjrVGd4LzqYxqiTy+zauBQVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrxMXaqJuSRJYiB/VyAticY06ABINF5WXuOvXN3Ggsc=;
 b=UGjDeoNjavyf8+1RRebNMSJLwbzXhQiWn9jFKVaE84ESoPhYDJPLH2Kk1hb312OPT9ONNiw2Pj+kLjYYE8p6VPicEEI2Z35nKtAoDr2ho1P05i6WgGvD7a68HC3D6K4U3s2MAdK9Y7iMJy77VY6aBay5h59z100ZbTasBubAPEq+EhJYYWvJuz/Gc2FJR6TA5OG491ZY4e37AQWFc0UkDtIx1QfUlARF5ccxGwVfBaX2JHGxRrVBg+whrk4A8cwaGLEhrbjpsEMeksaoFqrTd0fKWMe5kt+OPeTSZdckUj5wF4e3uq276rk9owrORU5L+dZ8dKnxDZ48USvUHHE2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3630.namprd12.prod.outlook.com (20.178.243.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Wed, 25 Sep 2019 14:38:17 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 14:38:17 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Topic: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Index: AQHVc67eAOP3HjJHn0i9QUAnxAttaw==
Date: Wed, 25 Sep 2019 14:38:17 +0000
Message-ID: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0P153CA0037.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::25) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80bbe05c-b655-4031-1793-08d741c600fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3630; 
x-ms-traffictypediagnostic: MN2PR12MB3630:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3630767A03EA6D90D6A5650BEC870@MN2PR12MB3630.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(189003)(199004)(64756008)(6486002)(486006)(2616005)(66556008)(476003)(8936002)(66446008)(6116002)(81156014)(71190400001)(2501003)(8676002)(36756003)(50226002)(6506007)(99286004)(386003)(26005)(52116002)(102836004)(478600001)(3846002)(86362001)(2906002)(305945005)(256004)(81166006)(66476007)(7736002)(5660300002)(186003)(4326008)(6512007)(6636002)(71200400001)(14454004)(25786009)(110136005)(54906003)(450100002)(66946007)(316002)(6436002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3630;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yuLoQeUBUZQRizfqrELmWS0chfYsx36H7lRsi1531fJUpWOgeQhkx3wzGvuFMcAcv4aQi4c15guQzWsRg0bYpGtj2ucE2G/w6pS9TqD1WIL/F7X4gzNvSTLOd43RKPih9ZtX9u89J0fJkDzAWi8mv5/r0jcM+TsrkTmFnUT8ec9rcGO46B1LltvtPT91wr6N8GSITciVSq2SIvf/uIgvrV8t5UjN4iFpot76ONJNRwMc6GSnewRc5EjKxj/M6E3Jhs6yESoLZtvW5XEGWpMJP+PCp8lwh3T2qsHUsLe8VmeOdS/nrbIypypyB3a3CzwFrXfJQrJIMpWs4MC1IhhTmqzVczcjYB9HQm9A6njRT5xJttj1yR2TrbGCZjVcCyUlO8TPPIkO2p5OtVinYw+4BJEVkM0mhLdZn0TlXdOOgAM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bbe05c-b655-4031-1793-08d741c600fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 14:38:17.5099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qtf1rhwmxiHOv6wIsQBQFa0JV1PW4Jvk0l0zaRgLsypwmhRhghcwWgCUtUPKTSDLDtf0x2oZHolLX0lnTWpHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3630
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrxMXaqJuSRJYiB/VyAticY06ABINF5WXuOvXN3Ggsc=;
 b=qPgpNKXGUj2uvebWpyA26sjFsavzgQorJntRiZBIQbxyJ4ao8nGnyfe7/UvDsvM8Q3m7EtfT64fM891uDRnrmQXxNWJPTPjKPH10ofAHePwmX/LJMqxDuLEsCnigW8OvhKzpO61dcQ+eocuXV5BXJa52CaJhoqQZE1dAhn79MpA=
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

TWFyayBhIGpvYiBhcyBzZWN1cmUsIGlmIGFuZCBvbmx5IGlmIHRoZSBjb21tYW5kCnN1Ym1pc3Np
b24gZmxhZyBoYXMgdGhlIHNlY3VyZSBmbGFnIHNldC4KCnYyOiBmaXggdGhlIG51bGwgam9iIHBv
aW50ZXIgd2hpbGUgaW4gdm1pZCAwCnN1Ym1pc3Npb24uCnYzOiBDb250ZXh0IC0tPiBDb21tYW5k
IHN1Ym1pc3Npb24uCnY0OiBmaWxsaW5nIGNzIHBhcnNlciB3aXRoIGNzLT5pbi5mbGFncwoKU2ln
bmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5
OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMdWJl
biBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oICAgICB8ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMgIHwgMTEgKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9q
b2IuaCB8ICAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCA2OTdlOGU1Li5mZDYw
Njk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAtNDg1LDYgKzQ4NSw5IEBA
IHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyIHsKIAl1aW50NjRfdAkJCWJ5dGVzX21vdmVkOwogCXVp
bnQ2NF90CQkJYnl0ZXNfbW92ZWRfdmlzOwogCisJLyogc2VjdXJlIGNzICovCisJYm9vbAkJCQlp
c19zZWN1cmU7CisKIAkvKiB1c2VyIGZlbmNlICovCiAJc3RydWN0IGFtZGdwdV9ib19saXN0X2Vu
dHJ5CXVmX2VudHJ5OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4
IDUxZjNkYjAuLjkwMzhkYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
CkBAIC0xMzMsNiArMTMzLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9pbml0KHN0
cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLCB1bmlvbiBkcm1fYW1kZ3B1X2NzCiAJCWdvdG8gZnJl
ZV9jaHVuazsKIAl9CiAKKwkvKioKKwkgKiBUaGUgY29tbWFuZCBzdWJtaXNzaW9uIChjcykgaXMg
YSB1bmlvbiwgc28gYW4gYXNzaWdubWVudCB0bworCSAqICdvdXQnIGlzIGRlc3RydWN0aXZlIHRv
IHRoZSBjcyAoYXQgbGVhc3QgdGhlIGZpcnN0IDgKKwkgKiBieXRlcykuIEZvciB0aGlzIHJlYXNv
biwgaW5xdWlyZSBhYm91dCB0aGUgZmxhZ3MgYmVmb3JlIHRoZQorCSAqIGFzc2lnbm1lbnQgdG8g
J291dCcuCisJICovCisJcC0+aXNfc2VjdXJlID0gY3MtPmluLmZsYWdzICYgQU1ER1BVX0NTX0ZM
QUdTX1NFQ1VSRTsKKwogCS8qIGdldCBjaHVua3MgKi8KIAljaHVua19hcnJheV91c2VyID0gdTY0
X3RvX3VzZXJfcHRyKGNzLT5pbi5jaHVua3MpOwogCWlmIChjb3B5X2Zyb21fdXNlcihjaHVua19h
cnJheSwgY2h1bmtfYXJyYXlfdXNlciwKQEAgLTEyNTIsOCArMTI2MCw5IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX3N1Ym1pdChzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKIAkJcC0+Y3R4LT5w
cmVhbWJsZV9wcmVzZW50ZWQgPSB0cnVlOwogCX0KIAotCWNzLT5vdXQuaGFuZGxlID0gc2VxOwor
CWpvYi0+c2VjdXJlID0gcC0+aXNfc2VjdXJlOwogCWpvYi0+dWZfc2VxdWVuY2UgPSBzZXE7CisJ
Y3MtPm91dC5oYW5kbGUgPSBzZXE7CiAKIAlhbWRncHVfam9iX2ZyZWVfcmVzb3VyY2VzKGpvYik7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggZTFkYzIyOS4uY2I5
YjY1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKQEAgLTIxMCw3ICsy
MTAsNyBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywg
dW5zaWduZWQgbnVtX2licywKIAlpZiAoam9iICYmIHJpbmctPmZ1bmNzLT5lbWl0X2NudHhjbnRs
KSB7CiAJCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0YXR1czsKIAkJc3RhdHVzIHw9IGpvYi0+
cHJlZW1wdGlvbl9zdGF0dXM7Ci0JCWFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwocmluZywgc3Rh
dHVzLCBmYWxzZSk7CisJCWFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwocmluZywgc3RhdHVzLCBq
b2ItPnNlY3VyZSk7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IG51bV9pYnM7ICsraSkgewpAQCAt
MjI5LDcgKzIyOSw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLAogCX0KIAogCWlmIChyaW5nLT5mdW5jcy0+ZW1pdF90
bXopCi0JCWFtZGdwdV9yaW5nX2VtaXRfdG16KHJpbmcsIGZhbHNlLCBmYWxzZSk7CisJCWFtZGdw
dV9yaW5nX2VtaXRfdG16KHJpbmcsIGZhbHNlLCBqb2IgPyBqb2ItPnNlY3VyZSA6IGZhbHNlKTsK
IAogI2lmZGVmIENPTkZJR19YODZfNjQKIAlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUp
KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oCmluZGV4IGRjN2VlOTMuLmFh
MGUzNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2Iu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKQEAgLTYzLDYg
KzYzLDggQEAgc3RydWN0IGFtZGdwdV9qb2IgewogCXVpbnQ2NF90CQl1Zl9hZGRyOwogCXVpbnQ2
NF90CQl1Zl9zZXF1ZW5jZTsKIAorCS8qIHRoZSBqb2IgaXMgZHVlIHRvIGEgc2VjdXJlIGNvbW1h
bmQgc3VibWlzc2lvbiAqLworCWJvb2wJCQlzZWN1cmU7CiB9OwogCiBpbnQgYW1kZ3B1X2pvYl9h
bGxvYyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbnVtX2licywKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
