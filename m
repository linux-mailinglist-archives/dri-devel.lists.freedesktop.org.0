Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B01AFBDD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2BF6EAAB;
	Wed, 11 Sep 2019 11:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF056EAA9;
 Wed, 11 Sep 2019 11:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLLpxFuuh7EkuiNhTw6gkNk2/WA2bfuEH8af65He6G04P+iUwTmkHN7ypvTNC2SNjSXAiZlwPJqqSm4Rv8FTok1nKO1gu3BEJgmgwnoi3Lvj0buC5TLUUynnDE6yd6EOwRKWJ3JdQaKVyjTot/fo6IIHc/MiNP3o/diiCK0gE7+OBSxX0VxYbLo1Q7f1zXIB6YYneCduADHxQxuFnmEydv1rzjPt1TFMoNKpTX3PSeptL/ieh2g+Veev/Uaye22y2+Qpq3D9NkCHTUtq9fsihi3B1wCnjHQrmYtFR0uDiw0pxORwad38ZH0W/9tGzSSyHtavb6ClU6enzONhqpBN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvjBr4jobZm0RnLq5cM8BfEA3+pIPPW3eTsSzeBsEZk=;
 b=ey5vhnsPfpnt0DUSM2Y8S+OGx7zyX8H96jedfmtymPB5Tt5hvz5ZueSNgxyIHG/CND3Er/Pe0Szv/JlOLij6E4ixkQfGW8DPlk5bdF7RzqSbX87B5/uSFgS2DxN35e0aMTUbU5JXIMwV5dVcXGvg1NyLU0h3Uk+Ij1G30THJsBeucKPls9CslBCBbbVP4o4lfsocexQVjBlKmH3VFOzwdYMJjU7WY+WQWeJQjADrj+Jhcov3C2QdSR/cjgfg1D++yM7Uiy4In1mhfA9BJ3KfRuCpH4RyGfSdnwGvzjhkCgm6DFRHTxHLV5a/NXZigxw6o4RNlrAO464cFmOBHuwBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:29 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:29 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 08/14] drm/amdgpu: revise the function to allocate secure
 context (v2)
Thread-Topic: [PATCH 08/14] drm/amdgpu: revise the function to allocate secure
 context (v2)
Thread-Index: AQHVaJcbYClnrP8Se0CtGZ6ms8w1Sg==
Date: Wed, 11 Sep 2019 11:50:28 +0000
Message-ID: <1568202584-14471-9-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: fca1a5e9-12ab-4da4-3191-08d736ae3deb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34212FE7D2843F9C3B82B247ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(14444005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EJaXJ+/Co6qLdJHZuO5WQce86AFnw+Lx6AtH2UCMNWWvJV2JatDXMgo5/oJeT79Sq9+WGUwYFxMaajzH1iBK71X87owrpMdstvxSDP4snAUqhXXkLIrk+Cx44hou8JoS2Ux9BoRCEokj6FF39rwhn/gFzRysbnrfBbEZhRaMv60IGyzcPoIMV0VtQN3/LDafTw41asL31l7crpthCpyjwiDYlriIaIOI7BKoSHzCGDW2XgCsjaa1+5EBh6XuBSBme+4APncWoejLijIWN21K/4NhNkDs2V7KvMTbZc2PhEsrpt5p8xStDnckr842Uu+LlLi2ja243DYH56XiLxcn5n7CQe4wRYcjXqTxOyr0qkdEU+1NzdwwEe7o+TF73wP1Xa1VQoSWelAaVkUcB42WYsU99UwmNiE41IXw4oEQN2Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca1a5e9-12ab-4da4-3191-08d736ae3deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:28.9936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgEdttj72YVsJZBcROtwMgSeGdUZgC80Af8brz8q8WnVYa4IdswXyOB/T4a6RO8TEamllnLmFMSdEmDc821FeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvjBr4jobZm0RnLq5cM8BfEA3+pIPPW3eTsSzeBsEZk=;
 b=dcurRVn0PwitBXn3exr+zItDCb9QIjdjbLR7ZZU5TyYtD1uDPH+d4b6E/uOeMOVBrhRi8LKzYBzW0mluAd85sQTspMc+94IcyRvdXTBHoIt6i0vV5cMjqQe+OdM5pvbFGsro8VXgWc6IKorox93j1VT9mTnoYdLikIlHxH+PFB8=
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

VGhlIGlzX3NlY3VyZSBmbGFnIHdpbGwgaW5kaWNhdGUgdGhlIGN1cnJlbnQgY29uZXh0IGlzIHBy
b3RlY3RlZCBvciBub3QuCgp2Mjogd2hpbGUgdXNlciBtb2RlIGFza3MgdG8gY3JlYXRlIGEgY29u
dGV4dCwgYnV0IGlmIHRteiBpcyBkaXNhYmxlZCwgaXQgc2hvdWxkCnJldHVybiBmYWlsdXJlLgoK
U2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgfCAxOSArKysrKysrKysrKysrKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmggfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2N0eC5jCmluZGV4IDQ1YTMwYWEuLmFlMjhhZWMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKQEAgLTcyLDcgKzcyLDggQEAgc3RhdGljIGlu
dCBhbWRncHVfY3R4X3ByaW9yaXR5X3Blcm1pdChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCiBzdGF0
aWMgaW50IGFtZGdwdV9jdHhfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCSAg
IGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5LAogCQkJICAgc3RydWN0IGRybV9maWxl
ICpmaWxwLAotCQkJICAgc3RydWN0IGFtZGdwdV9jdHggKmN0eCkKKwkJCSAgIHN0cnVjdCBhbWRn
cHVfY3R4ICpjdHgsCisJCQkgICB1aW50MzJfdCBmbGFncykKIHsKIAl1bnNpZ25lZCBudW1fZW50
aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwogCXVuc2lnbmVkIGksIGos
IGs7CkBAIC0xMjEsNiArMTIyLDkgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJY3R4LT5pbml0X3ByaW9yaXR5ID0gcHJpb3JpdHk7CiAJ
Y3R4LT5vdmVycmlkZV9wcmlvcml0eSA9IERSTV9TQ0hFRF9QUklPUklUWV9VTlNFVDsKIAorCWlm
IChmbGFncyAmIEFNREdQVV9DVFhfQUxMT0NfRkxBR1NfU0VDVVJFKQorCQljdHgtPmlzX3NlY3Vy
ZSA9IHRydWU7CisKIAlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgKytpKSB7CiAJ
CXN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1ER1BVX01BWF9SSU5HU107CiAJCXN0cnVjdCBk
cm1fc2NoZWRfcnEgKnJxc1tBTURHUFVfTUFYX1JJTkdTXTsKQEAgLTI1Myw3ICsyNTcsNyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9jdHhfYWxsb2Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
CQkgICAgc3RydWN0IGFtZGdwdV9mcHJpdiAqZnByaXYsCiAJCQkgICAgc3RydWN0IGRybV9maWxl
ICpmaWxwLAogCQkJICAgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5LAotCQkJICAg
IHVpbnQzMl90ICppZCkKKwkJCSAgICB1aW50MzJfdCAqaWQsIHVpbnQzMl90IGZsYWdzKQogewog
CXN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyID0gJmZwcml2LT5jdHhfbWdyOwogCXN0cnVjdCBh
bWRncHVfY3R4ICpjdHg7CkBAIC0yNzIsNyArMjc2LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3R4
X2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCX0KIAogCSppZCA9ICh1aW50MzJf
dClyOwotCXIgPSBhbWRncHVfY3R4X2luaXQoYWRldiwgcHJpb3JpdHksIGZpbHAsIGN0eCk7CisJ
ciA9IGFtZGdwdV9jdHhfaW5pdChhZGV2LCBwcmlvcml0eSwgZmlscCwgY3R4LCBmbGFncyk7CiAJ
aWYgKHIpIHsKIAkJaWRyX3JlbW92ZSgmbWdyLT5jdHhfaGFuZGxlcywgKmlkKTsKIAkJKmlkID0g
MDsKQEAgLTQwNyw2ICs0MTEsMTIgQEAgaW50IGFtZGdwdV9jdHhfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRl
di0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IGFtZGdwdV9mcHJpdiAqZnByaXYgPSBmaWxwLT5kcml2
ZXJfcHJpdjsKIAorCWlmICghYWRldi0+dG16LmVuYWJsZWQgJiYKKwkgICAgKGFyZ3MtPmluLmZs
YWdzICYgQU1ER1BVX0NUWF9BTExPQ19GTEFHU19TRUNVUkUpKSB7CisJCURSTV9FUlJPUigiQ2Fu
bm90IGFsbG9jYXRlIHNlY3VyZSBjb250ZXh0IHdoaWxlIHRteiBpcyBkaXNhYmxlZFxuIik7CisJ
CXJldHVybiAtRUlOVkFMOworCX0KKwogCXIgPSAwOwogCWlkID0gYXJncy0+aW4uY3R4X2lkOwog
CXByaW9yaXR5ID0gYW1kZ3B1X3RvX3NjaGVkX3ByaW9yaXR5KGFyZ3MtPmluLnByaW9yaXR5KTsK
QEAgLTQxOCw3ICs0MjgsOCBAQCBpbnQgYW1kZ3B1X2N0eF9pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAogCiAJc3dpdGNoIChhcmdzLT5pbi5vcCkgewogCWNhc2UgQU1E
R1BVX0NUWF9PUF9BTExPQ19DVFg6Ci0JCXIgPSBhbWRncHVfY3R4X2FsbG9jKGFkZXYsIGZwcml2
LCBmaWxwLCBwcmlvcml0eSwgJmlkKTsKKwkJciA9IGFtZGdwdV9jdHhfYWxsb2MoYWRldiwgZnBy
aXYsIGZpbHAsIHByaW9yaXR5LAorCQkJCSAgICAgJmlkLCBhcmdzLT5pbi5mbGFncyk7CiAJCWFy
Z3MtPm91dC5hbGxvYy5jdHhfaWQgPSBpZDsKIAkJYnJlYWs7CiAJY2FzZSBBTURHUFVfQ1RYX09Q
X0ZSRUVfQ1RYOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2N0eC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5oCmluZGV4IGRh
ODA4NjMuLmFhODY0MmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jdHguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmgK
QEAgLTQ1LDYgKzQ1LDcgQEAgc3RydWN0IGFtZGdwdV9jdHggewogCXN0cnVjdCBkbWFfZmVuY2UJ
CSoqZmVuY2VzOwogCXN0cnVjdCBhbWRncHVfY3R4X2VudGl0eQkqZW50aXRpZXNbQU1ER1BVX0hX
X0lQX05VTV07CiAJYm9vbAkJCQlwcmVhbWJsZV9wcmVzZW50ZWQ7CisJYm9vbAkJCQlpc19zZWN1
cmU7CiAJZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkJCWluaXRfcHJpb3JpdHk7CiAJZW51bSBkcm1f
c2NoZWRfcHJpb3JpdHkJCW92ZXJyaWRlX3ByaW9yaXR5OwogCXN0cnVjdCBtdXRleAkJCWxvY2s7
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
