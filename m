Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5EB9D566
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36EB6E290;
	Mon, 26 Aug 2019 18:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710054.outbound.protection.outlook.com [40.107.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099B16E285
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvzG/cS2iFlP0fPDQj4GJ816btQMlm0czQAa1USgS7lJgNsjel7u1Lusk/MBomTnXpzyZxb77tlzD95pG4YU8R37vHjq45kY53STAn8CTu/uLFLigQYGEGUWwdkv+ScAUPDxWXh675Q6KwVpIxGIlw4KRDzbT+HIkS8P5E9Bqllj3zLoRUoA8E0sCshFd2fBZ2ETFbi2T3gLGssAleyNCNT/hT9ubmdpzu3t99WN2klFe0OfCstZoX0DHoGtf7X/37EcPS950peIjKxYG/zAG+xgGApzSiswPB9PngEJEMYpBGJXrs+z1cL2M3XoM+c21NWveSvlutUWtzFwGGUqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C978YRaoHGcoNzrkPOW7NIP8XnezeR4rytagLslfHUE=;
 b=h03brFAJrLchD19Z2W3oQI7tUJmrfaTDvDvGH6cKCvm7sghsUJvu8DoBlUl3Ta5FMEwxObwsOnDSE0SV/sPgzm2tYzpr9cko72/PX+DzRNn9RxlChrK71LvUoWLRChRZbS/j5v2OZMEqsUmYq3+7CCI1R2xBhIoTVDyErgr5t6BVjFteQDQiPV2PJBktYuxTleZbjBzpYbWUTWeoXxdOkLE13xWCZugoBsQyReO9U0jEmHWR7ZtayHSIKR56ZUA/O/F1IPrKtFdBm5VSd6MVzoECb96hzOtI2/6fUKT4wAalymOOBwxS7w2Cxshv8jxXR1O7kfKPKgTrZfpFhLdmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0009.namprd12.prod.outlook.com
 (2603:10b6:301:4a::19) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Mon, 26 Aug
 2019 18:05:18 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0009.outlook.office365.com
 (2603:10b6:301:4a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 18:05:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 18:05:17 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 13:05:15 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 3/6] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Mon, 26 Aug 2019 14:05:04 -0400
Message-ID: <20190826180507.17802-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826180507.17802-1-David.Francis@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(189003)(199004)(426003)(446003)(305945005)(2351001)(4326008)(2906002)(8936002)(14444005)(50226002)(50466002)(16586007)(48376002)(316002)(356004)(6666004)(53936002)(51416003)(76176011)(36756003)(26005)(1076003)(186003)(478600001)(5660300002)(86362001)(47776003)(6916009)(486006)(49486002)(81166006)(11346002)(336012)(8676002)(2616005)(70206006)(126002)(70586007)(81156014)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 584a7842-b46a-4c5a-fcf8-08d72a4ff405
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2715F3BCA087CB5090D83C90EFA10@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pSUognF5wDzpZ912sNMM8Werav9c09gvYWnj6faiOG3V+i0cCIlX+Vyn2mMDKg5pnc9nuwvYKFVvHljeR50qLAkBlNh6MQOjIrz5+td6VLodulSQCinsXvIjr/qHnHGVWkJ16zRCigEBo6mEM9KY+inAfIWeN963BIDNda6ZHqNEG3bQYJ4Z6091IkoBgmuzUksEa4RsVhi3rp4ty+hKuRTyS44IE1S24OZQ6p8sxyBjvF9X88S4qzwUOFXSKwZUpQceWDf3wL3O+BGnczbPTPdgZGMue/AKy1BpStnZSqkxTbGLCwnb2aBkY/6ExhfHeFpR/1oqOxF7XP4YNAkgadBk4uTlnMHnU7vzTlekYu4s35wtyH1Seh4yleyfRzw05DfL/VdppBNEW6tZzZA3FZvWeWjsl9onr299+odLzEw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 18:05:17.8808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584a7842-b46a-4c5a-fcf8-08d72a4ff405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C978YRaoHGcoNzrkPOW7NIP8XnezeR4rytagLslfHUE=;
 b=4b/DsgrwFQpRW4RQZ+rqF/USPKbYQQ0Ch9UtTym80ZLgovbVT6mqPmR9osb5wUIzMnLiamq7K5/WxO7Tqb+V1Vxolj7YGn9ZFKu2bn2pd0X4k3N+k/ZBql3wgT9UHmkqiE3Q3Hcsg5iMCXysjypaHRa94PMejsjMwKGJPfiI1Og=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBoYXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9k
cGNkX3JlYWQvd3JpdGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRy
bV9kcF9kcGNkX3JlYWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRy
aXZlcnMgY2FuIG1ha2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgp2MjogRml4IHNwYWNpbmcKdjM6
IER1bXAgZHBjZCBhY2Nlc3Mgb24gTVNUIHJlYWQvd3JpdGVzCgpSZXZpZXdlZC1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2
aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5j
IHwgMTIgKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICB8IDMw
ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2F1eF9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCmluZGV4
IDBjZmIzODY3NTRjMy4uNDE4Y2FkNGY2NDlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2F1eF9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYwpA
QCAtMTYzLDExICsxNjMsNyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfcmVhZF9pdGVyKHN0cnVj
dCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICp0bykKIAkJCWJyZWFrOwogCQl9CiAKLQkJ
aWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3RlKQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3Jl
YWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgIHRvZG8pOwotCQllbHNlCi0JCQly
ZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOworCQly
ZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwogCiAJ
CWlmIChyZXMgPD0gMCkKIAkJCWJyZWFrOwpAQCAtMjE1LDExICsyMTEsNyBAQCBzdGF0aWMgc3Np
emVfdCBhdXhkZXZfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRl
ciAqZnJvbSkKIAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3Rl
KQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYs
Ci0JCQkJCQkgICAgdG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3dyaXRlKGF1
eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOworCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3Jp
dGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQogCQkJ
YnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLjJjYzIxZWZm
NGNmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvc2VxX2ZpbGUuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmlu
dC5oPgogI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKQEAgLTI1MSw3ICsyNTIsNyBAQCBz
dGF0aWMgaW50IGRybV9kcF9kcGNkX2FjY2VzcyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1OCBy
ZXF1ZXN0LAogCiAvKioKICAqIGRybV9kcF9kcGNkX3JlYWQoKSAtIHJlYWQgYSBzZXJpZXMgb2Yg
Ynl0ZXMgZnJvbSB0aGUgRFBDRAotICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAq
IEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsIChTU1Qgb3IgTVNUKQogICogQG9mZnNldDog
YWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byByZWFkCiAgKiBAYnVmZmVyOiBidWZm
ZXIgdG8gc3RvcmUgdGhlIHJlZ2lzdGVyIHZhbHVlcwogICogQHNpemU6IG51bWJlciBvZiBieXRl
cyBpbiBAYnVmZmVyCkBAIC0yODAsMTMgKzI4MSwxOCBAQCBzc2l6ZV90IGRybV9kcF9kcGNkX3Jl
YWQoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkgKiBXZSBq
dXN0IGhhdmUgdG8gZG8gaXQgYmVmb3JlIGFueSBEUENEIGFjY2VzcyBhbmQgaG9wZSB0aGF0IHRo
ZQogCSAqIG1vbml0b3IgZG9lc24ndCBwb3dlciBkb3duIGV4YWN0bHkgYWZ0ZXIgdGhlIHRocm93
IGF3YXkgcmVhZC4KIAkgKi8KLQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhf
TkFUSVZFX1JFQUQsIERQX0RQQ0RfUkVWLCBidWZmZXIsCi0JCQkJIDEpOwotCWlmIChyZXQgIT0g
MSkKLQkJZ290byBvdXQ7CisJaWYgKCFhdXgtPmlzX3JlbW90ZSkgeworCQlyZXQgPSBkcm1fZHBf
ZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIERQX0RQQ0RfUkVWLAorCQkJCQkg
YnVmZmVyLCAxKTsKKwkJaWYgKHJldCAhPSAxKQorCQkJZ290byBvdXQ7CisJfQogCi0JcmV0ID0g
ZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsIGJ1ZmZl
ciwKLQkJCQkgc2l6ZSk7CisJaWYgKGF1eC0+aXNfcmVtb3RlKQorCQlyZXQgPSBkcm1fZHBfbXN0
X2RwY2RfcmVhZChhdXgsIG9mZnNldCwgYnVmZmVyLCBzaXplKTsKKwllbHNlCisJCXJldCA9IGRy
bV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgb2Zmc2V0LAorCQkJCQkg
YnVmZmVyLCBzaXplKTsKIAogb3V0OgogCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9O
QVRJVkVfUkVBRCwgb2Zmc2V0LCBidWZmZXIsIHJldCk7CkBAIC0yOTYsNyArMzAyLDcgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkKTsKIAogLyoqCiAgKiBkcm1fZHBfZHBjZF93cml0
ZSgpIC0gd3JpdGUgYSBzZXJpZXMgb2YgYnl0ZXMgdG8gdGhlIERQQ0QKLSAqIEBhdXg6IERpc3Bs
YXlQb3J0IEFVWCBjaGFubmVsCisgKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbCAoU1NU
IG9yIE1TVCkKICAqIEBvZmZzZXQ6IGFkZHJlc3Mgb2YgdGhlIChmaXJzdCkgcmVnaXN0ZXIgdG8g
d3JpdGUKICAqIEBidWZmZXI6IGJ1ZmZlciBjb250YWluaW5nIHRoZSB2YWx1ZXMgdG8gd3JpdGUK
ICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMgaW4gQGJ1ZmZlcgpAQCAtMzEzLDggKzMxOSwxMiBA
QCBzc2l6ZV90IGRybV9kcF9kcGNkX3dyaXRlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHVuc2ln
bmVkIGludCBvZmZzZXQsCiB7CiAJaW50IHJldDsKIAotCXJldCA9IGRybV9kcF9kcGNkX2FjY2Vz
cyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwgYnVmZmVyLAotCQkJCSBzaXplKTsK
KwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldCA9IGRybV9kcF9tc3RfZHBjZF93cml0ZShhdXgs
IG9mZnNldCwgYnVmZmVyLCBzaXplKTsKKwllbHNlCisJCXJldCA9IGRybV9kcF9kcGNkX2FjY2Vz
cyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwKKwkJCQkJIGJ1ZmZlciwgc2l6ZSk7
CisKIAlkcm1fZHBfZHVtcF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1dSSVRFLCBvZmZzZXQs
IGJ1ZmZlciwgcmV0KTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
