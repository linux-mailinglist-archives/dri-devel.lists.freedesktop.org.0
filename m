Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072FAFBD6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2E6EAA3;
	Wed, 11 Sep 2019 11:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780052.outbound.protection.outlook.com [40.107.78.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A70B6EAA1;
 Wed, 11 Sep 2019 11:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX4uOzxh8pup0MxUPKYklwKEm8YHNbe29E6m/gW5yRPT+GaQ/llLBJUwI7kZtaiW4R5XXtJpcy/O+083/5DZJQYlGK8h9XrUOmd7U5PlsF+ure2CxRIWrpzYu5dXeSkMdQtYt1YvZaPnZcaBKd1IiCgKeNMceHaUUK0gr9fIC95TjQy9Vxxxydybfhb2BrxwqdK/BrTVSKr74XPO6C6arIOGjbhVUoLV9m7ur48SmDQ8L/FgwwkKlPm1U6d4+MoKOQlWegCm5I1FE3z8lpDlcENJzpPOMWhUC8CBn3Lsok5XmMKWNwA0GULeAYzCtGd6iPYt5t8FHE+FZIhEZZqJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ1jaQjF39AyHi7EdHAgCUHusSy6xrpliVoWsokXikc=;
 b=Bku594q7v3vsXk69QEgM1A4mEroz7Fon+CPVHYnPCTAAav4jcAw8LQ3be8ydWr/D0mUIr+3dS8CXEYyZEcMSj+Td5kYtq4Ed13tAMx01VsJTAaDd8Un46USgukBwcp2V5G++3FhLPSPB3zMxnqPDf49ePGImTsFsO5aKLjQhtdYTNUS+a8dMC6PttppVnDMb5hieYItG9CrqrPYfsNCA1EcZ1MrInUOdWcoCpA+H8qarHOZc5vS0tW8QtBZOKlC56xKXKCn3RHZG+cLGItMDjJt2i4KW1M+1PVM545Rr26mXYKj/tFOfWCx0LLpywAYdV7n+90OTZmWCzvbj8taOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:19 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:19 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 05/14] drm/amdgpu: add amdgpu_tmz data structure
Thread-Topic: [PATCH 05/14] drm/amdgpu: add amdgpu_tmz data structure
Thread-Index: AQHVaJcV677oyjSkfkSXSgLTlys4rg==
Date: Wed, 11 Sep 2019 11:50:18 +0000
Message-ID: <1568202584-14471-6-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 6ca843db-d672-4a9e-99ea-08d736ae37e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3421F8423C547CFC4A830C96ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(14444005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 62MBWScXgZW+8BZ1wg1y+zLBzXVrw6WngjhIyYXIrhyA/ozdndGrz4MqFswDgtRdTi9/nzB3Zxy8vIf/I17SChi7S3DUO8Spb0DJOb9xNpXGaMzKXvWrTra6Gg8qVM+EftuSIZyHRxcDJHk9RYdVTPSWjLAoMCCSa3m24yt4YpBYW6TQ81HdPpOd2cYwV6yiApJWPJU8OG71+v854zl2HQUW1U1iUCnTriOq1su9Si+obApieGb/7GvH6wjBfZ9LZHlx2lLzCJgNUrr1jQ1g9FkL7BGf2e2XvVNtNZrfdIueUJNY48cwpxS7fYBwIc/uKjqhERJfUzHOW9FfTvwJ+x7828lBN/8BvMgdfAWV0SnPliPunjNrkWhDJLMXgy5R3Qf3NkH+OW+dREcdye4F43xDrhpu5CNTQoX02R3CT1Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca843db-d672-4a9e-99ea-08d736ae37e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:18.8602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35HwWp+JrfAgXblwG3GvvI+gjjK9D8qhJ55zr3Ky4XDrxA18o/yWpDMePcRsx4Noz84IOzUeqglyZsWBh8HF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ1jaQjF39AyHi7EdHAgCUHusSy6xrpliVoWsokXikc=;
 b=cJqxZza5BCJ109AZRdoqP2lna/cFmpgp9deA3toRDgYEqkBq71onqg5Xk4KoMfJ1odEKAynRPG437/gj0cr/LDqEZ5HRaxcTPtXaiqPNivJ04tEZIG4n0jFYNw81SD3HdVmaLp0KNy3ziN98RhtOYjHgVA0KMqHn65DiHXXK/SU=
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

VGhpcyBwYXRjaCB0byBhZGQgYW1kZ3B1X3RteiBzdHJ1Y3R1cmUgd2hpY2ggc3RvcmVzIGFsbCB0
bXogcmVsYXRlZCBmaWVsZHMuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICB8ICA2ICsr
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oIHwgMzYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdG16LmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmlu
ZGV4IDkzMDY0M2MuLjY5N2U4ZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBA
IC04OSw2ICs4OSw3IEBACiAjaW5jbHVkZSAiYW1kZ3B1X21lcy5oIgogI2luY2x1ZGUgImFtZGdw
dV91bWMuaCIKICNpbmNsdWRlICJhbWRncHVfbW1odWIuaCIKKyNpbmNsdWRlICJhbWRncHVfdG16
LmgiCiAKICNkZWZpbmUgTUFYX0dQVV9JTlNUQU5DRQkJMTYKIApAQCAtOTE2LDYgKzkxNyw5IEBA
IHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAlib29sICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVuYWJsZV9tZXM7CiAJc3RydWN0IGFtZGdwdV9tZXMgICAgICAgICAgICAgICBtZXM7CiAKKwkv
KiB0bXogKi8KKwlzdHJ1Y3QgYW1kZ3B1X3RtegkJdG16OworCiAJc3RydWN0IGFtZGdwdV9pcF9i
bG9jayAgICAgICAgICBpcF9ibG9ja3NbQU1ER1BVX01BWF9JUF9OVU1dOwogCWludAkJCQludW1f
aXBfYmxvY2tzOwogCXN0cnVjdCBtdXRleAltbl9sb2NrOwpAQCAtOTI3LDcgKzkzMSw3IEBAIHN0
cnVjdCBhbWRncHVfZGV2aWNlIHsKIAlhdG9taWM2NF90IGdhcnRfcGluX3NpemU7CiAKIAkvKiBz
b2MxNSByZWdpc3RlciBvZmZzZXQgYmFzZWQgb24gaXAsIGluc3RhbmNlIGFuZCAgc2VnbWVudCAq
LwotCXVpbnQzMl90IAkJKnJlZ19vZmZzZXRbTUFYX0hXSVBdW0hXSVBfTUFYX0lOU1RBTkNFXTsK
Kwl1aW50MzJfdAkJKnJlZ19vZmZzZXRbTUFYX0hXSVBdW0hXSVBfTUFYX0lOU1RBTkNFXTsKIAog
CWNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3MJKmRmX2Z1bmNzOwogCWNvbnN0IHN0cnVjdCBh
bWRncHVfbW1odWJfZnVuY3MJKm1taHViX2Z1bmNzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Rtei5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjI0YmJiYzIK
LS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16
LmgKQEAgLTAsMCArMSwzNiBAQAorLyoKKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3Jv
IERldmljZXMsIEluYy4KKyAqCisgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNv
ZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUi
KSwKKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1
ZGluZyB3aXRob3V0IGxpbWl0YXRpb24KKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2Rp
ZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNl
bGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20g
dGhlCisgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZv
bGxvd2luZyBjb25kaXRpb25zOgorICoKKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFu
ZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisgKiBhbGwgY29w
aWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyAqCisgKiBUSEUg
U09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lO
RCwgRVhQUkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBU
SEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKKyAq
IFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBD
TEFJTSwgREFNQUdFUyBPUgorICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCisgKiBBUklTSU5HIEZST00sIE9VVCBP
RiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKKyAqIE9U
SEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqCisgKi8KKworI2lmbmRlZiBfX0FNREdQ
VV9UTVpfSF9fCisjZGVmaW5lIF9fQU1ER1BVX1RNWl9IX18KKworI2luY2x1ZGUgImFtZGdwdS5o
IgorCisvKgorICogVHJ1c3QgbWVtb3J5IHpvbmUgc3R1ZmYKKyAqLworc3RydWN0IGFtZGdwdV90
bXogeworCWJvb2wJZW5hYmxlZDsKK307CisKKyNlbmRpZgotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
