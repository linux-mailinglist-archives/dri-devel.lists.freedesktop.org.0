Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D79B6D96
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A58F72AF3;
	Wed, 18 Sep 2019 20:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820075.outbound.protection.outlook.com [40.107.82.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149F72AF8;
 Wed, 18 Sep 2019 20:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMsKz6hcvxdqwREiLl0MN5CRKU0nHKstiPLrVCERBmxymgnMgHC0a0OOfc2ft6cxj3F5wKFgS7XhIjLM8iazydZlI9AGKppTPX+NFCXVT08Ol50N4vUUumpiUFIiuO56voVY53HMFv86i1k/ckMf5K3WvkEh77qOMUw60Isy5Qs/cB55hTUUNK7IErhZ5XbXb2oAKPghp9PhziTinZeeGw5sh7Z2N4HGripj1b65g/nci9i2/aTzd407yAEOgvAoQdZY134rbuQp+pFPbIU3Vd6KUN83/o8l+dxfUInOnlaxcwgmB/N0mfkPxsVQW2tGZj/fTNBhZ/9r3AuFG3NY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CTGIpqzXImTeOTQD+i2qD0T6LR8r6uGNwp+nWgqSMo=;
 b=Q/ftBafBT1iMK4DlvYwxN4HzF7ordu5vey1giK3DXYv/m1d3AOiA2RGaku6rBQtMlX4uVYnruMpLNcQRHE4GA2HbexMbEP+WqaMe0Rea8/IFTjCrWovJMIPz030k+EYgbrGO2HOkVrJTHa3z6mfqwmMiqz22LfMVZc5Acgyw+Pn4lhxR7odogOuLhcCV6JG5a0Opt2bOMZD/iiPtk79do/VpGlLDZxveMu66tmGC4nYSb0vOww+IJ4x546td5UAbTxO90Oyxps4KCb43HCBae2ZrCG+HppGjiUfNTvES5T2S708++u9ZZUNWUMzgHPbwerifIkfO7rFq1mlgwSXyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by MWHPR12MB1805.namprd12.prod.outlook.com (2603:10b6:300:106::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.16; Wed, 18 Sep
 2019 20:27:26 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:26 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:24 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/15] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Wed, 18 Sep 2019 16:26:43 -0400
Message-ID: <48e5fd874caac1d8925626bb5b91d7244b819052.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(428003)(199004)(189003)(476003)(8936002)(48376002)(6916009)(50226002)(54906003)(81166006)(81156014)(8676002)(4326008)(5660300002)(16586007)(316002)(446003)(11346002)(2616005)(336012)(426003)(118296001)(450100002)(26005)(36756003)(14444005)(186003)(2906002)(478600001)(50466002)(47776003)(2351001)(486006)(305945005)(53416004)(7696005)(126002)(2876002)(70206006)(86362001)(70586007)(76176011)(356004)(6666004)(51416003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1805; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594ad33e-cae6-44f1-5dce-08d73c769ea7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1805; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1805:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1805D07B52D6AE931A0E3093E48E0@MWHPR12MB1805.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: J2j0i4ZqRJdxTJml1v7rXfyeiPiWkOzBp6eMVl6S114Fvnq1OEtlSXV5YM26Q7sy+OEjrefSR1ezcvu3PG8ZjyRd+eDfr1Cd/VdrC8gelDe07W4bUkcso3DdsIsq3pJtXDdIZkWBVMR7/f3ZLMe4ji8E7/Ty0REo84YmJPBnSth6Ydf7ZlrMOGIDYLFZma+HP0ti8RJoOdMK0GhaC/inzefLoUFjMEq9dzHC3zqz5fCnStv6Ja/EBY/zpIx8chLEFTKR7zSUWAvcl+hAi+6wTeZazxvF0jFMuNFS3thbYq5IDRI5N1fmIWNVANdejtNf+7k4lARkidFEFPRJxXf97sJF5EPMlrd9S9+X49Lo7iZleE6SmIc697B8nzzFaNnWC4vphq3v21s43NNAiLDp8hkHCxUMqXkYPzMjT4UIgdE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:26.0689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594ad33e-cae6-44f1-5dce-08d73c769ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CTGIpqzXImTeOTQD+i2qD0T6LR8r6uGNwp+nWgqSMo=;
 b=xKB5dQ72MXHJtgYYtTOj1gUTytWEnG6frMVjc9zMuH8FDbRFcYkMIfgAtZLzCNonmkFrpyTk3E6YRgNzMXGdwvGPbcA5XvP7/D9M6BXCI9lVLV9+Y6ibdlyjeEWKp92Tr9euqKXvO5tAeuegJqMR0/KmqPrk7mQOMEFCAuQ+Kgk=
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgIHwgMzAgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMKaW5kZXggMDA2MTBiZDhkNmMxLi4w
NzgwZmMzNTgzODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCkBAIC0xNjIsMTEgKzE2Miw3
IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl9yZWFkX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBz
dHJ1Y3QgaW92X2l0ZXIgKnRvKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4
LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2RfcmVhZChhdXhfZGV2LT5hdXgs
IHBvcywgYnVmLAotCQkJCQkJICAgdG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9IGRybV9kcF9kcGNk
X3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9kcGNk
X3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYgKHJlcyA8PSAwKQog
CQkJYnJlYWs7CkBAIC0yMTQsMTEgKzIxMCw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl93cml0
ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQogCQkJYnJl
YWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1f
ZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJCQkJCSAgICB0b2Rv
KTsKLQkJZWxzZQotCQkJcmVzID0gZHJtX2RwX2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3Ms
IGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9tc3RfZHBjZF93cml0ZShhdXhfZGV2LT5hdXgs
IHBvcywgYnVmLCB0b2RvKTsKIAogCQlpZiAocmVzIDw9IDApCiAJCQlicmVhazsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCmluZGV4IDU0YTY0MTRjNWQ5Ni4uMGNiZjEwNzI3YmQ2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKQEAgLTI5LDYgKzI5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9pMmMuaD4K
ICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVy
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KIAogI2luY2x1ZGUgImRybV9jcnRjX2hlbHBlcl9pbnRlcm5hbC5oIgpAQCAtMjcyLDcg
KzI3Myw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsIHU4IHJlcXVlc3QsCiAKIC8qKgogICogZHJtX2RwX2RwY2RfcmVhZCgpIC0gcmVhZCBh
IHNlcmllcyBvZiBieXRlcyBmcm9tIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVgg
Y2hhbm5lbAorICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBvciBNU1QpCiAg
KiBAb2Zmc2V0OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHJlYWQKICAqIEBi
dWZmZXI6IGJ1ZmZlciB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCiAgKiBAc2l6ZTogbnVt
YmVyIG9mIGJ5dGVzIGluIEBidWZmZXIKQEAgLTMwMSwxMyArMzAyLDE4IEBAIHNzaXplX3QgZHJt
X2RwX2RwY2RfcmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQgb2Zmc2V0
LAogCSAqIFdlIGp1c3QgaGF2ZSB0byBkbyBpdCBiZWZvcmUgYW55IERQQ0QgYWNjZXNzIGFuZCBo
b3BlIHRoYXQgdGhlCiAJICogbW9uaXRvciBkb2Vzbid0IHBvd2VyIGRvd24gZXhhY3RseSBhZnRl
ciB0aGUgdGhyb3cgYXdheSByZWFkLgogCSAqLwotCXJldCA9IGRybV9kcF9kcGNkX2FjY2Vzcyhh
dXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsIGJ1ZmZlciwKLQkJCQkgMSk7Ci0J
aWYgKHJldCAhPSAxKQotCQlnb3RvIG91dDsKKwlpZiAoIWF1eC0+aXNfcmVtb3RlKSB7CisJCXJl
dCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9S
RVYsCisJCQkJCSBidWZmZXIsIDEpOworCQlpZiAocmV0ICE9IDEpCisJCQlnb3RvIG91dDsKKwl9
CiAKLQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIG9m
ZnNldCwgYnVmZmVyLAotCQkJCSBzaXplKTsKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldCA9
IGRybV9kcF9tc3RfZHBjZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UK
KwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZz
ZXQsCisJCQkJCSBidWZmZXIsIHNpemUpOwogCiBvdXQ6CiAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1
eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsKQEAgLTMxNyw3ICsz
MjMsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWQpOwogCiAvKioKICAqIGRybV9k
cF9kcGNkX3dyaXRlKCkgLSB3cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAotICog
QGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBj
aGFubmVsIChTU1Qgb3IgTVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSBy
ZWdpc3RlciB0byB3cml0ZQogICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZhbHVl
cyB0byB3cml0ZQogICogQHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0zMzQs
OCArMzQwLDEyIEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJtX2Rw
X2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBidWZmZXIsCi0J
CQkJIHNpemUpOworCWlmIChhdXgtPmlzX3JlbW90ZSkKKwkJcmV0ID0gZHJtX2RwX21zdF9kcGNk
X3dyaXRlKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0gZHJtX2Rw
X2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LAorCQkJCQkgYnVm
ZmVyLCBzaXplKTsKKwogCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJ
VEUsIG9mZnNldCwgYnVmZmVyLCByZXQpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
