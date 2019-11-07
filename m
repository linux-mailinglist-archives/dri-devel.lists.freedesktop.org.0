Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCEF333D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED856F71A;
	Thu,  7 Nov 2019 15:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E186F700;
 Thu,  7 Nov 2019 15:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmVBJeFEUepNrWX4m1s/oTM7kV2rqEECBfq195Z9SW5yABDLQRQzZQ09Xd+VyjV4oZBRKTl1s2xFBoEWH0pDUtBGe0u6Z9T1zZ9rV0wBLP35aa4tU3v6LLamVD+yc7g7nqesNwnZeZW2ptf1+9InSNwFrqQ0BmA0JHZYnrCb4suN+auxK2/SMEXDvovYiYZG5RQuqo+7BvW6H4gHBa2bb5+JVdkB+j0sJqOdGH3WIJ2aVyb0Kq9rjY4eNSPo+nA6lzvdq2lR4LPjdZ1JrEotcvz6KWJEt5xxlXpXYhg3zvWWLTTyN7hIsRQB0pJ8KKQ3amKHJ2rLjEFpwzvRDh2Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+odq4Dv1isf6j3RciXnLyn+hJEA5951qCkgEInRvs0=;
 b=U9wvMNfs85CzIFUhrysTOullRfxAGx7fbsUvdK8RkIGIfz33pP48I/+KK32L8U/w8PHyf/Tl2M/tdclgOrfMSEKMrQfELjunhgIVMwdal+rTbjPMbNPiZCxW7u8mlZNQ5S7tKkisIpsyZR2riY/e9zRJsWIlZcsUpVZpqFGCRecSofG9T2xXXdJj2/YT8gmXKy73suyTtyaAg12e7gshm99twHcQiC4x0VfSV/ho6yw3UJxY50WTvI/yj/KY66su2CZc6GpZhjOYTivM6Bxjk55Ee9AKES0kxZCFJLU4/1nU98i0pesspc/v7eJUFOqqWagJbtxFIV7o7+zHVd0ABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Thu, 7 Nov
 2019 15:32:28 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:20 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:20 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 03/13] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Thu, 7 Nov 2019 10:32:02 -0500
Message-ID: <20191107153212.1145-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(428003)(199004)(189003)(50226002)(6666004)(54906003)(70586007)(1076003)(356004)(47776003)(50466002)(4326008)(316002)(2351001)(5660300002)(48376002)(2906002)(70206006)(7696005)(51416003)(6916009)(16586007)(336012)(76176011)(478600001)(486006)(446003)(26005)(186003)(426003)(8676002)(53416004)(14444005)(81166006)(81156014)(2876002)(11346002)(126002)(86362001)(450100002)(36756003)(305945005)(8936002)(2616005)(476003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4178; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e595f7-b83b-4c17-5182-08d76397b249
X-MS-TrafficTypeDiagnostic: BY5PR12MB4178:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4178DC5DC2819BFE6DCA7B06E4780@BY5PR12MB4178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDpYheODRx9oteocTKvUt3GHYfkROOXRdMZPXL20CCWaEvr591QCmUmzsLI2NqFATgjoqPeWEr0ZIHEEhFtElpLIgfJ3Hu0CS+EMSsiK+FDXVlgWjjVlgFC1dRkZmKxkR7SySr4Php4EzmAvwb0LAKNnWXo36IdjE/1q9f4dgJCfZYovODB+0FzC4ZviE3T2cwK1SMp/u9LpsTM3fFnjMRF97ziEdZSw3gcCffZMjdNgGTIwOOI1T21F62oiD7eAmgf9hi1jjZqNGCf8x9PgNIlF/SNMAXKplT94lb4mOe6MKmfrdJeSCN6vvk0EO2tiRKwMnVATiJb3b32g+NPEfx9Bob0T49BrisSxOHkQeCcjIK4leORHh/coEen+q7IMnexpI4H0GYI7mxWZACHttDyAXkcMDWaCV84p98D0DQrhPKvjjUT3pU47FXNiwYIK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:27.7714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e595f7-b83b-4c17-5182-08d76397b249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+odq4Dv1isf6j3RciXnLyn+hJEA5951qCkgEInRvs0=;
 b=zuLXd/yMBnNB6QX/N2ktOZEGikNu8XkQxre074l2fHc6K1921lzL/+4Ld0SeNw4rIHbvpbXKG7Xu8D9/Bi/tM/m69ngcw1he2mNXfhL9SrYrfHei7YGzNrvNETeuPXA4pfTELfN3uHEHcxxHoI4KASdWAplCdffk7R05WcAU8s8=
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
Y2Nlc3Mgb24gTVNUIHJlYWQvd3JpdGVzCnY0OiBGaXggY2FsbGluZyB3cm9uZyBmdW5jdGlvbiBv
biBEUENEIHdyaXRlCgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAxMiArKy0tLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMgIHwgMzEgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCmluZGV4IDBjZmIzODY3NTRjMy4uMjUxMDcxN2Q1YTA4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYwpAQCAtMTYzLDExICsxNjMsNyBAQCBzdGF0aWMg
c3NpemVfdCBhdXhkZXZfcmVhZF9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9p
dGVyICp0bykKIAkJCWJyZWFrOwogCQl9CiAKLQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3Rl
KQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwK
LQkJCQkJCSAgIHRvZG8pOwotCQllbHNlCi0JCQlyZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9k
ZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOworCQlyZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9k
ZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwogCiAJCWlmIChyZXMgPD0gMCkKIAkJCWJyZWFrOwpA
QCAtMjE1LDExICsyMTEsNyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfd3JpdGVfaXRlcihzdHJ1
Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKIAkJCWJyZWFrOwogCQl9CiAK
LQkJaWYgKGF1eF9kZXYtPmF1eC0+aXNfcmVtb3RlKQotCQkJcmVzID0gZHJtX2RwX21zdF9kcGNk
X3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsCi0JCQkJCQkgICAgdG9kbyk7Ci0JCWVsc2UK
LQkJCXJlcyA9IGRybV9kcF9kcGNkX3dyaXRlKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8p
OworCQlyZXMgPSBkcm1fZHBfZHBjZF93cml0ZShhdXhfZGV2LT5hdXgsIHBvcywgYnVmLCB0b2Rv
KTsKIAogCQlpZiAocmVzIDw9IDApCiAJCQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmlu
ZGV4IGZmYzY4ZDMwNWFmZS4uYWYxY2Q5NjhhZGZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMK
QEAgLTMyLDYgKzMyLDggQEAKICNpbmNsdWRlIDxkcm0vZHJtX2RwX2hlbHBlci5oPgogI2luY2x1
ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgorI2luY2x1
ZGUgPGRybS9kcm1fZHBfbXN0X2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAKICNp
bmNsdWRlICJkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCIKIApAQCAtMjUxLDcgKzI1Myw3IEBA
IHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHU4
IHJlcXVlc3QsCiAKIC8qKgogICogZHJtX2RwX2RwY2RfcmVhZCgpIC0gcmVhZCBhIHNlcmllcyBv
ZiBieXRlcyBmcm9tIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAor
ICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBvciBNU1QpCiAgKiBAb2Zmc2V0
OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHJlYWQKICAqIEBidWZmZXI6IGJ1
ZmZlciB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCiAgKiBAc2l6ZTogbnVtYmVyIG9mIGJ5
dGVzIGluIEBidWZmZXIKQEAgLTI4MCwxMyArMjgyLDE4IEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rf
cmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCSAqIFdl
IGp1c3QgaGF2ZSB0byBkbyBpdCBiZWZvcmUgYW55IERQQ0QgYWNjZXNzIGFuZCBob3BlIHRoYXQg
dGhlCiAJICogbW9uaXRvciBkb2Vzbid0IHBvd2VyIGRvd24gZXhhY3RseSBhZnRlciB0aGUgdGhy
b3cgYXdheSByZWFkLgogCSAqLwotCXJldCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FV
WF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsIGJ1ZmZlciwKLQkJCQkgMSk7Ci0JaWYgKHJldCAh
PSAxKQotCQlnb3RvIG91dDsKKwlpZiAoIWF1eC0+aXNfcmVtb3RlKSB7CisJCXJldCA9IGRybV9k
cF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsCisJCQkJ
CSBidWZmZXIsIDEpOworCQlpZiAocmV0ICE9IDEpCisJCQlnb3RvIG91dDsKKwl9CiAKLQlyZXQg
PSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIG9mZnNldCwgYnVm
ZmVyLAotCQkJCSBzaXplKTsKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldCA9IGRybV9kcF9t
c3RfZHBjZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0g
ZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsCisJCQkJ
CSBidWZmZXIsIHNpemUpOwogCiBvdXQ6CiAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1eCwgRFBfQVVY
X05BVElWRV9SRUFELCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsKQEAgLTI5Niw3ICszMDMsNyBAQCBF
WFBPUlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWQpOwogCiAvKioKICAqIGRybV9kcF9kcGNkX3dy
aXRlKCkgLSB3cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAotICogQGF1eDogRGlz
cGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsIChT
U1Qgb3IgTVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0
byB3cml0ZQogICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZhbHVlcyB0byB3cml0
ZQogICogQHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0zMTMsOCArMzIwLDEy
IEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5z
aWduZWQgaW50IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJtX2RwX2RwY2RfYWNj
ZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBidWZmZXIsCi0JCQkJIHNpemUp
OworCWlmIChhdXgtPmlzX3JlbW90ZSkKKwkJcmV0ID0gZHJtX2RwX21zdF9kcGNkX3dyaXRlKGF1
eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNj
ZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LAorCQkJCQkgYnVmZmVyLCBzaXpl
KTsKKwogCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNl
dCwgYnVmZmVyLCByZXQpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
