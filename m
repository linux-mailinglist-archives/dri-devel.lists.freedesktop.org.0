Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FCC3A36
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E33B6E84F;
	Tue,  1 Oct 2019 16:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD996E844;
 Tue,  1 Oct 2019 16:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVsvh15oJQyzgYI3DQP3RqAE+6HXysARPTpicpyrmyOG6p60NcVe9NQvmDPDTfDJDbx3wxfaGOsK61TCO6IepLL9fz9qUlarQyKrkxIT6Sb7LNvJiy1MsGCzuufhoAGpzv4GlB/h1rQQ76QdC/iBRFBnPS11mjJKFPUjslumUUSWSn3TATdSwJbl8SDQubNq0dG8LUr/L0ZTV9s6weq+MLuAGjJFD0+V5ZXev5LiwqQLuw13vMuoO1YMnlQbIPqhdp0RBUONZQ5Y6/o4w/WzVFLydIzidFxszsGiARLpUED8ZewTMsdk9xIXUEnIRKNmC+84JU4TZ+PcoaVTld0rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXbiYfljFK+FCxUHfshxYitCtTKCr9KPjrlLso5+a4A=;
 b=EihZUvd5Os7hVFHMpg/goxkhjuOsrywxbeD+H3shG+2JiwR0ByWDj6QYtstpFOqZFrN4nEQRn7Zzsd1yVuF0LKUU/5TWLukwgQGY3bYTiXv6c3vz3G+/QBWiFm2viEUDoE8EqBk3fic2USZRtl3k0gN3/7fmT2YQ/U/EihChBQ2t59jeIDnRss6hBjxQNx3bRg+ubiSw7wBb5rSh4C55QatLgnhtu5Hvf1jmDYHB3TXG385Xdz8/ov8P2IAWm/G5tmZ2FWvkcXRVEtRj27eLfO+K1MyBQ7TGkDV6TfV6GOxtx2SJqJpZk4x8d3KJimmWHqa3lJ8wo8HOCrJGr3JC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by MN2PR12MB3888.namprd12.prod.outlook.com (2603:10b6:208:168::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Tue, 1 Oct
 2019 16:17:32 +0000
Received: from CO1NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT013.mail.protection.outlook.com (10.152.80.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:31 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:28 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/14] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Tue, 1 Oct 2019 12:17:11 -0400
Message-ID: <20191001161721.13793-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-4-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(199004)(189003)(4326008)(36756003)(2351001)(2876002)(186003)(76176011)(26005)(7696005)(51416003)(6666004)(356004)(450100002)(2906002)(5660300002)(305945005)(54906003)(86362001)(47776003)(446003)(70206006)(336012)(478600001)(50466002)(70586007)(14444005)(11346002)(426003)(16586007)(8676002)(486006)(476003)(126002)(53416004)(8936002)(50226002)(6916009)(81156014)(81166006)(48376002)(1076003)(2616005)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3888; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1a7e0b9-7bbc-4c15-3206-08d7468adcc2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3888:
X-Microsoft-Antispam-PRVS: <MN2PR12MB388841CCB36A1D0699476B38E49D0@MN2PR12MB3888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGPQN8hUXZB2t5LQP9RhLyWzC8/sPzjHWOT32ovUDVrEuInrHuHCKyyzDkqacQlmgDb6c2pR166ZJNZw01U4Dq0t8KNsQmYyxcMQ87OobVw8VQwuT/KJZqOkvkvwj5icHIBMD7mYef2GLeGoNfLiDYC+1GVvEXMomzMb6FbxLa9/vp1aIad6jhrqPQN2MAjzqZOx8RK8GceVH1BlICiUZLmzNME83bm4Vi7A/afJXJljffj1e3572/VOZvl+2xY6KCl/uJUzmcYNVB3rf174mfy4RqdMgQPwbG3aR/i6tXQkGSVcB9IwKJBF4e7VS8bdGUdX4YMmzHwig8MkjOcc8XKRMrhhC0ZKgVlNXSJ/Mb9KKLt07nuLwiVLAHQHMJk9omy7UKvTWycEr+oioXQGmAl5q/CTA56Lu6Z8WKxnDeg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:31.7458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a7e0b9-7bbc-4c15-3206-08d7468adcc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXbiYfljFK+FCxUHfshxYitCtTKCr9KPjrlLso5+a4A=;
 b=mCCe3gSSk9X4P3pYswmSst0difdGOQmJu75q94tIriwRbf5LHSKOhvo6CPZMa/nvVA1wXqgsgNETYCQsv/2vtRxRFl65MmXE8SrBBS4WTUqbQpAU4BdFuFF1NNHf8JV2pBrpyV1JP82qbwbOLdhWr3mLa+EnrX87NvGnBaHTg9k=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKSW5zdGVhZCBvZiBo
YXZpbmcgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBhbmQKZHJtX2RwX21zdF9kcGNkX3JlYWQvd3Jp
dGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCmF1eCBjb2RlLCBoYXZlIGRybV9kcF9kcGNkX3Jl
YWQvd3JpdGUgaGFuZGxlIGJvdGguCgpUaGlzIG1lYW5zIHRoYXQgRFJNIGRyaXZlcnMgY2FuIG1h
a2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCgp2MjogRml4IHNwYWNpbmcKdjM6IER1bXAgZHBjZCBh
Y2Nlc3Mgb24gTVNUIHJlYWQvd3JpdGVzCgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAxMiArKy0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgIHwgMzEgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCmluZGV4IDBjZmIzODY3NTRjMy4u
NDE4Y2FkNGY2NDlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYwpAQCAtMTYzLDExICsxNjMs
NyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfcmVhZF9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwg
c3RydWN0IGlvdl9pdGVyICp0bykKIAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGF1eF9kZXYtPmF1
eC0+aXNfcmVtb3RlKQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4
LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgIHRvZG8pOwotCQllbHNlCi0JCQlyZXMgPSBkcm1fZHBfZHBj
ZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOworCQlyZXMgPSBkcm1fZHBfZHBj
ZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwogCiAJCWlmIChyZXMgPD0gMCkK
IAkJCWJyZWFrOwpAQCAtMjE1LDExICsyMTEsNyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfd3Jp
dGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKIAkJCWJy
ZWFrOwogCQl9CiAKLQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3RlKQotCQkJcmVzID0gZHJt
X2RwX21zdF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsCi0JCQkJCQkgICAgdG9k
byk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9z
LCBidWYsIHRvZG8pOworCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4
LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQogCQkJYnJlYWs7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLmFmMWNkOTY4YWRmZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0zMiw2ICszMiw4IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9kcF9o
ZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV92
YmxhbmsuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4KKyNpbmNsdWRlIDxk
cm0vZHJtUC5oPgogCiAjaW5jbHVkZSAiZHJtX2NydGNfaGVscGVyX2ludGVybmFsLmgiCiAKQEAg
LTI1MSw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IGRybV9kcF9kcGNkX2FjY2VzcyhzdHJ1Y3QgZHJt
X2RwX2F1eCAqYXV4LCB1OCByZXF1ZXN0LAogCiAvKioKICAqIGRybV9kcF9kcGNkX3JlYWQoKSAt
IHJlYWQgYSBzZXJpZXMgb2YgYnl0ZXMgZnJvbSB0aGUgRFBDRAotICogQGF1eDogRGlzcGxheVBv
cnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsIChTU1Qgb3Ig
TVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byByZWFk
CiAgKiBAYnVmZmVyOiBidWZmZXIgdG8gc3RvcmUgdGhlIHJlZ2lzdGVyIHZhbHVlcwogICogQHNp
emU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0yODAsMTMgKzI4MiwxOCBAQCBzc2l6
ZV90IGRybV9kcF9kcGNkX3JlYWQoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50
IG9mZnNldCwKIAkgKiBXZSBqdXN0IGhhdmUgdG8gZG8gaXQgYmVmb3JlIGFueSBEUENEIGFjY2Vz
cyBhbmQgaG9wZSB0aGF0IHRoZQogCSAqIG1vbml0b3IgZG9lc24ndCBwb3dlciBkb3duIGV4YWN0
bHkgYWZ0ZXIgdGhlIHRocm93IGF3YXkgcmVhZC4KIAkgKi8KLQlyZXQgPSBkcm1fZHBfZHBjZF9h
Y2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIERQX0RQQ0RfUkVWLCBidWZmZXIsCi0JCQkJ
IDEpOwotCWlmIChyZXQgIT0gMSkKLQkJZ290byBvdXQ7CisJaWYgKCFhdXgtPmlzX3JlbW90ZSkg
eworCQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIERQ
X0RQQ0RfUkVWLAorCQkJCQkgYnVmZmVyLCAxKTsKKwkJaWYgKHJldCAhPSAxKQorCQkJZ290byBv
dXQ7CisJfQogCi0JcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9S
RUFELCBvZmZzZXQsIGJ1ZmZlciwKLQkJCQkgc2l6ZSk7CisJaWYgKGF1eC0+aXNfcmVtb3RlKQor
CQlyZXQgPSBkcm1fZHBfbXN0X2RwY2RfcmVhZChhdXgsIG9mZnNldCwgYnVmZmVyLCBzaXplKTsK
KwllbHNlCisJCXJldCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVB
RCwgb2Zmc2V0LAorCQkJCQkgYnVmZmVyLCBzaXplKTsKIAogb3V0OgogCWRybV9kcF9kdW1wX2Fj
Y2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgb2Zmc2V0LCBidWZmZXIsIHJldCk7CkBAIC0y
OTYsNyArMzAzLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkKTsKIAogLyoqCiAg
KiBkcm1fZHBfZHBjZF93cml0ZSgpIC0gd3JpdGUgYSBzZXJpZXMgb2YgYnl0ZXMgdG8gdGhlIERQ
Q0QKLSAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCisgKiBAYXV4OiBEaXNwbGF5UG9y
dCBBVVggY2hhbm5lbCAoU1NUIG9yIE1TVCkKICAqIEBvZmZzZXQ6IGFkZHJlc3Mgb2YgdGhlIChm
aXJzdCkgcmVnaXN0ZXIgdG8gd3JpdGUKICAqIEBidWZmZXI6IGJ1ZmZlciBjb250YWluaW5nIHRo
ZSB2YWx1ZXMgdG8gd3JpdGUKICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMgaW4gQGJ1ZmZlcgpA
QCAtMzEzLDggKzMyMCwxMiBAQCBzc2l6ZV90IGRybV9kcF9kcGNkX3dyaXRlKHN0cnVjdCBkcm1f
ZHBfYXV4ICphdXgsIHVuc2lnbmVkIGludCBvZmZzZXQsCiB7CiAJaW50IHJldDsKIAotCXJldCA9
IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwgYnVm
ZmVyLAotCQkJCSBzaXplKTsKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldCA9IGRybV9kcF9t
c3RfZHBjZF93cml0ZShhdXgsIG9mZnNldCwgYnVmZmVyLCBzaXplKTsKKwllbHNlCisJCXJldCA9
IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwKKwkJ
CQkJIGJ1ZmZlciwgc2l6ZSk7CisKIAlkcm1fZHBfZHVtcF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFU
SVZFX1dSSVRFLCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
