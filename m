Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8661D984F9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B476E9E8;
	Wed, 21 Aug 2019 20:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8166E98B;
 Wed, 21 Aug 2019 20:02:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnoUwbHxKDv3x1M1bYOYzEwuGlO/D29CoiRuWrNoRAOICS4AvAPF96QwYn1NFoUzPjTl7PrRyTn9phO6bWdwBwaOcGp4SP7fEYod4+laRq2oD4KP5QmTDH101j1tnjV//QZmKqmLXawilRIKhCe1SjH60tGT6bYLpuy0xp0cec1a+rqw/ZCk/zcS+fISfRLEDtVhLVYZGsTF4B8aArDtCidUheScBkcr7QFd44lbB4EjZj9Ueho/6AeUgsZFmid1OlwRhxXLVZ5Ljh/FiHH9Kqt7umFooUOUbDlpkno3C+4LZAsL/LQOD6/I378t+1Qe2R+JumiPFlve6V7wbvEvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIvWAceDVD2k+60d16/y6RGV1tC12FlLoAugcbhXyvM=;
 b=hhbnfvb6D3PadHa1+ikm62zoPaZ5RSwRU+VZqNN6AHdxWa6kCK/fLMxkxuEIZzCfQKVrWA6zn4ohCVqOvmziv0fzHp6OyhJD1Z9wCtgRWQ9/gUzeNshUkOvJe5D0ynMK4glbo5PGJyZML6mQGxEDboR8bcc1mBfZ/H4mBllEFjFSuaSFl5plSNT48gxoqTC3S8cOKlDgfXDdrjZyBklVjfGle1bT8aDpiA3TkPijXHZSGrjR3ltkvXajvO1J6LOFCCmGanPwG+aUsu1vbCOP0USUyI176O/7mbk32v0gya514fRfOHaCp68JqFwQAcZ07SHvED7yhLh1elhyw16TIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0014.namprd12.prod.outlook.com (2603:10b6:403:2::24)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 21 Aug
 2019 20:01:59 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by BN4PR12CA0014.outlook.office365.com
 (2603:10b6:403:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:58 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:40 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 10/16] drm/dp-mst: Add MST support to DP DPCD R/W functions
Date: Wed, 21 Aug 2019 16:01:23 -0400
Message-ID: <20190821200129.11575-11-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(6666004)(2616005)(486006)(426003)(53936002)(476003)(336012)(126002)(14444005)(11346002)(76176011)(446003)(478600001)(70206006)(54906003)(186003)(26005)(51416003)(356004)(70586007)(36756003)(2906002)(5660300002)(1076003)(86362001)(50466002)(305945005)(8676002)(8936002)(49486002)(316002)(48376002)(81156014)(81166006)(47776003)(110136005)(16586007)(50226002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 429a918e-2598-47d7-4cd3-08d726726cb7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711661DB330A4095D5FFAF2EFAA0@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bOMCTiev1cROwiSF08jp//TLBpld6wL168DLlgPo7pe0hucToPCeZ4NaqYEa5rfhfwQ0y4ZjzAsbgJ0bPpS7DqKV6R0KLhLIvCx3tLHkhRux2Dd6bJGfcaRIwf7iDzNTBHV0IJogbKDoO6xjIbzbSb2mCAQ5sJOP2Z4rj5864BlmPACJoEGj3kjvgiXGMrcQS/xewOCnIj2ZkCGxwnm0kmL1lP76ZkRySN7MMtqz5ZmMgahpGXhTBpGgdrpI+2h3pamC5X6RdW2yYmgCPbGOhvA0pqZbbqJALz163TFFPzvZKYsfY5oVmTum6kadbWiaEPzMROH1kZbtde9obFITa5Olz9R2zs0IDaEUjlLJa0sJCL+SnlRJGq2r6MD3f2hGeAUOkKkTk0INzCKABEcYNfHCIavYWZBHcSxpFxrGZic=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:58.6292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429a918e-2598-47d7-4cd3-08d726726cb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIvWAceDVD2k+60d16/y6RGV1tC12FlLoAugcbhXyvM=;
 b=gSWbtGdeMGPl7xFSuVo8ukFVoeTPP87jZCFlXNzrfL4hHDYrhkJN1jR9ImJ1C1NZ88ePHphg4aeiMhSO2Z73FpX53Fpl9Ww3xv4bFhI+hroy3jMzB9b6PC5h28baKuNNYDrxNR9ys15TqhYN5tgUpJra5eAgUcucAKKsNazfKxg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBoYXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9k
cGNkX3JlYWQvd3JpdGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRy
bV9kcF9kcGNkX3JlYWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRy
aXZlcnMgY2FuIG1ha2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgpDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAxMiArKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMgIHwgMTAgKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2F1eF9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCmlu
ZGV4IDAwNjEwYmQ4ZDZjMS4uMDc4MGZjMzU4Mzg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2F1eF9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYu
YwpAQCAtMTYyLDExICsxNjIsNyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfcmVhZF9pdGVyKHN0
cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICp0bykKIAkJCWJyZWFrOwogCQl9CiAK
LQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3RlKQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNk
X3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgIHRvZG8pOwotCQllbHNlCi0J
CQlyZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwor
CQlyZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwog
CiAJCWlmIChyZXMgPD0gMCkKIAkJCWJyZWFrOwpAQCAtMjE0LDExICsyMTAsNyBAQCBzdGF0aWMg
c3NpemVfdCBhdXhkZXZfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3Zf
aXRlciAqZnJvbSkKIAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVt
b3RlKQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBi
dWYsCi0JCQkJCQkgICAgdG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3dyaXRl
KGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOworCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rf
d3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQog
CQkJYnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCA1NGE2NDE0YzVkOTYuLjlmOTc2
YjkwYzUzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5j
bHVkZSA8bGludXgvaTJjLmg+CiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2RwX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZHBfbXN0X2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAKICNpbmNsdWRlICJkcm1fY3J0Y19oZWxwZXJfaW50
ZXJuYWwuaCIKQEAgLTI3Miw3ICsyNzMsNyBAQCBzdGF0aWMgaW50IGRybV9kcF9kcGNkX2FjY2Vz
cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1OCByZXF1ZXN0LAogCiAvKioKICAqIGRybV9kcF9k
cGNkX3JlYWQoKSAtIHJlYWQgYSBzZXJpZXMgb2YgYnl0ZXMgZnJvbSB0aGUgRFBDRAotICogQGF1
eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFu
bmVsIChTU1Qgb3IgTVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdp
c3RlciB0byByZWFkCiAgKiBAYnVmZmVyOiBidWZmZXIgdG8gc3RvcmUgdGhlIHJlZ2lzdGVyIHZh
bHVlcwogICogQHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0yODksNiArMjkw
LDggQEAgc3NpemVfdCBkcm1fZHBfZHBjZF9yZWFkKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHVu
c2lnbmVkIGludCBvZmZzZXQsCiB7CiAJaW50IHJldDsKIAorICAgICAgICBpZiAoYXV4LT5pc19y
ZW1vdGUpCisgICAgICAgICAgICAgICAgcmV0dXJuIGRybV9kcF9tc3RfZHBjZF9yZWFkKGF1eCwg
b2Zmc2V0LCBidWZmZXIsIHNpemUpOwogCS8qCiAJICogSFAgWlIyNHcgY29ycnVwdHMgdGhlIGZp
cnN0IERQQ0QgYWNjZXNzIGFmdGVyIGVudGVyaW5nIHBvd2VyIHNhdmUKIAkgKiBtb2RlLiBFZy4g
b24gYSByZWFkLCB0aGUgZW50aXJlIGJ1ZmZlciB3aWxsIGJlIGZpbGxlZCB3aXRoIHRoZSBzYW1l
CkBAIC0zMTcsNyArMzIwLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkKTsKIAog
LyoqCiAgKiBkcm1fZHBfZHBjZF93cml0ZSgpIC0gd3JpdGUgYSBzZXJpZXMgb2YgYnl0ZXMgdG8g
dGhlIERQQ0QKLSAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCisgKiBAYXV4OiBEaXNw
bGF5UG9ydCBBVVggY2hhbm5lbCAoU1NUIG9yIE1TVCkKICAqIEBvZmZzZXQ6IGFkZHJlc3Mgb2Yg
dGhlIChmaXJzdCkgcmVnaXN0ZXIgdG8gd3JpdGUKICAqIEBidWZmZXI6IGJ1ZmZlciBjb250YWlu
aW5nIHRoZSB2YWx1ZXMgdG8gd3JpdGUKICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMgaW4gQGJ1
ZmZlcgpAQCAtMzM0LDYgKzMzNyw5IEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0
IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCisg
ICAgICAgIGlmIChhdXgtPmlzX3JlbW90ZSkKKyAgICAgICAgICAgICAgICByZXR1cm4gZHJtX2Rw
X21zdF9kcGNkX3dyaXRlKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCiAJcmV0ID0gZHJt
X2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBidWZmZXIs
CiAJCQkJIHNpemUpOwogCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJ
VEUsIG9mZnNldCwgYnVmZmVyLCByZXQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
