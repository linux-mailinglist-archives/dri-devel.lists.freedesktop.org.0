Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981FBAFBEB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D2B6EABE;
	Wed, 11 Sep 2019 11:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8388B6EABB;
 Wed, 11 Sep 2019 11:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmpy04ALaO6trkU4PVPjnhD+0ZzNYGV4+s0WCAB8q/EG0i4vsanZBD/n4dyTeCECV3gCZj9NHqqY4bF30nsObbS49s/c05vTigYvLlqu/KWndUqqLoqNN18UCzXJSvpCAla/9mayCMtR36RNbuUfGhgoAF71DHpSrE7E3Q3ltIN50uY4qv0wK/J7Nek5KKXtgjkuLMjD7YqqnRyHRtlnTFRUhTrspdIKJBBJqD2qrR3cjPO1wUbnfcUarxJy0P4LedtfdtG3W1wcfQ/hRg30Lh6EjiMZTFAICLmamtkDiZ89BX5rdBEpE873r/Tb/0AZxKxOSsP8HNfVjqeaq86Bew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKVckBOS3nLgyDrtUN8LLB9WCHBUEmwcLG6GRtkBP5c=;
 b=bzC+BMlPSW5Vs1DeOQTnNGSnJQepfqFWSDh75+P1Ayor1ooMpNle6AMCIRv/y1HOeZREJDdN3MFpPSaXlieyDz/P1Lbr1Cff/jsrxVuF+2k4WoMdZcVuxHEQyrpRbwjiUE2bPmafE3n8cpbUm9WqWOU98SEzdPXXC/WZOBEqXukXduuSgMdNqi2AZzCvwXTlrnqr1bMQ4LQOmrrAbu9/qAR/7J1/dk5y8PAFyApvQpfgcrEEtwOz9xLrkZbbbS/1vpXmj2KJiRgSDFfJb5ppG+psN0uA1Qgqj6cYwPhXspxM2DxJejz59K1GgqlqgcMY4xLpbkky9kzLAsmcf+YEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:46 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:46 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 13/14] drm/amdgpu: modify the method to use mem under buffer
 object for amdgpu_ttm_tt_pte_flags
Thread-Topic: [PATCH 13/14] drm/amdgpu: modify the method to use mem under
 buffer object for amdgpu_ttm_tt_pte_flags
Thread-Index: AQHVaJcmi5OyiTH93UO57cDX6vShjw==
Date: Wed, 11 Sep 2019 11:50:46 +0000
Message-ID: <1568202584-14471-14-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 17c1c8f9-cd18-496c-32c0-08d736ae4842
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3421F6E528D72D3325B545DEECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3Oli2A61G7RXX5I6sOzw1PWc8wOgfN27x0Gxq/rmangRJ/7UErGX8y3umuEuNQtncsk9mDikncDYUtiEPz44hqy4P6ltHNIyADlqumFQvfX/st3259t7cMDn3w13RccgHxokESoF9+HSbcEyvYuI35Ic8DbSMZYGaKsHLsS9f9FkFTLINQtKRlaO35pwy5PPTRK1arH0j2P/mY5QzBLXTlTyru5Dq3a3gjCY4Dy5ygiqSSAqf3CTDyrVvIuoUfWFfsFyy9eLxZNoMSotrEjXBxsBG7WbQG0Rc7PCt60V03vlvu4Y+D1K3SBTAd/bINtVIWHA1JByEE7RTc3ky3PAz+c6bk+asSm36LpI7BnWoALWi08K2BvfS3Ou+ZcZOlo81UpeBMnsic2MhQ9G3oCWVfMAimhbHUfDey9jSWRkP0s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c1c8f9-cd18-496c-32c0-08d736ae4842
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:46.6318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SoFtAKl88UjsTPy/vxPvqIg2kW6STjddjdzD6g6pRpnhxdmQIagP/1xwClnyYy5EXUIo0TSePhgXCBihJiVG2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKVckBOS3nLgyDrtUN8LLB9WCHBUEmwcLG6GRtkBP5c=;
 b=eRj9K5+jIevm4zphq0P8WG9SBicO9vnVYhqNbfdiTi4HL2naptyaXI0x7XQpfFzdIIy4VSLUMJHeKN9m1fZIXHXsJ5XZ8pdYg3VLJsIp7lHNW6f1gCGpkhyjVZThsZdDXTwlb9xfXtwxRnfDp1CXkKtubEpXWGr6GKXzSKiBBBc=
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

YW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3Mgd2lsbCBiZSB1c2VkIGZvciB1cGRhdGluZyB0bXogYml0
cyB3aGlsZSB0aGUgYm8gaXMKc2VjdXJlLCBzbyB3ZSBuZWVkIHBhc3MgdGhlIHR0bV9tZW1fcmVn
IHVuZGVyIGEgYnVmZmVyIG9iamVjdC4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwg
MTggKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5k
ZXggYzA1NjM4Yy4uMzY2MzY1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYwpAQCAtMTExNyw4ICsxMTE3LDggQEAgaW50IGFtZGdwdV90dG1fYWxsb2NfZ2FydChzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCX0gZWxzZSB7CiAKIAkJLyogYWxsb2NhdGUgR0FS
VCBzcGFjZSAqLwotCQl0bXAgPSBiby0+bWVtOwotCQl0bXAubW1fbm9kZSA9IE5VTEw7CisJCXRt
cCA9IGJvLT5tZW07IC8qIGNhY2hlIGJvLT5tZW0gKi8KKwkJYm8tPm1lbS5tbV9ub2RlID0gTlVM
TDsKIAkJcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgPSAxOwogCQlwbGFjZW1lbnQucGxhY2VtZW50
ID0gJnBsYWNlbWVudHM7CiAJCXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQgPSAxOwpAQCAt
MTEyOCwyMyArMTEyOCwyNSBAQCBpbnQgYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pCiAJCXBsYWNlbWVudHMuZmxhZ3MgPSAoYm8tPm1lbS5wbGFjZW1l
bnQgJiB+VFRNX1BMX01BU0tfTUVNKSB8CiAJCQlUVE1fUExfRkxBR19UVDsKIAotCQlyID0gdHRt
X2JvX21lbV9zcGFjZShibywgJnBsYWNlbWVudCwgJnRtcCwgJmN0eCk7Ci0JCWlmICh1bmxpa2Vs
eShyKSkKKwkJciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZiby0+bWVtLCAm
Y3R4KTsKKwkJaWYgKHVubGlrZWx5KHIpKSB7CisJCQliby0+bWVtID0gdG1wOwogCQkJcmV0dXJu
IHI7CisJCX0KIAogCQkvKiBjb21wdXRlIFBURSBmbGFncyBmb3IgdGhpcyBidWZmZXIgb2JqZWN0
ICovCi0JCWZsYWdzID0gYW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3MoYWRldiwgYm8tPnR0bSwgJnRt
cCk7CisJCWZsYWdzID0gYW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3MoYWRldiwgYm8tPnR0bSwgJmJv
LT5tZW0pOwogCiAJCS8qIEJpbmQgcGFnZXMgKi8KLQkJZ3R0LT5vZmZzZXQgPSAodTY0KXRtcC5z
dGFydCA8PCBQQUdFX1NISUZUOworCQlndHQtPm9mZnNldCA9ICh1NjQpYm8tPm1lbS5zdGFydCA8
PCBQQUdFX1NISUZUOwogCQlyID0gYW1kZ3B1X3R0bV9nYXJ0X2JpbmQoYWRldiwgYm8sIGZsYWdz
KTsKIAkJaWYgKHVubGlrZWx5KHIpKSB7CisJCQliby0+bWVtID0gdG1wOwogCQkJdHRtX2JvX21l
bV9wdXQoYm8sICZ0bXApOwogCQkJcmV0dXJuIHI7CiAJCX0KIAotCQl0dG1fYm9fbWVtX3B1dChi
bywgJmJvLT5tZW0pOwotCQliby0+bWVtID0gdG1wOworCQl0dG1fYm9fbWVtX3B1dChibywgJnRt
cCk7CiAJfQogCiAJYm8tPm9mZnNldCA9IChiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
