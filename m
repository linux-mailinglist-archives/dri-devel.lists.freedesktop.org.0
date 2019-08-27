Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2DD9EA96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10E989BBD;
	Tue, 27 Aug 2019 14:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9789BA3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:13:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khwXTPY1EIMgqYnu7aAescuMs9dzt+/cxygu3CxngIfsNyeSbZZKZkof60npUDb/5zUfzH2ZYcvUsDGJ2aDl2ye5VoliFzSkiK7FDp4RRRt8jnDGkiSBrXCsIN7rQGUZacQ+/kTn052A85gy7eslUeU5Zk/liKtWr+Tc6ToLuUAT5iQ6uTH0p7KTn21OJtMuYUUVMoVPX8o8lA7NILkI48ADV3TFuEJRGW/HN0wG1NgWt6SE7hnm5xKnenBdIxpYJ7AoFKaVTkIw4VB1smgSGYTZ3s/gIeczYFqFX3voiq4ux/deTnVvkdmVlPfXTYZs1/iB6IXsZ4/rYvoYgsfOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oI2241rku6JrRwkSyCR5B0fRw0qUHJF5llSmv1WyQs=;
 b=CJazpWVwXT1hODRclxgtzclSjegELydfqATjKOXC2XRHFxl1yZFriEto365AoX/ui4vyAVBN6N5thV4pEkbHX+ya384IP8Nn2F8SkqqUAYqkdr5vTSPrnRaIiV2Mv3okS3FmzqU5yVJUFj6pDKSASHQ1dlT+iWGoSeCOQdVCWMdwHBTbIcV/WsW51LFdf19Dw6IEaRj4DC3ivbFR9uk2uNZ4Ky1hwI1jMshey6TYwgDN8/veRunMDLG0OVFAr2qSL9VB2Pj8xZjTepWi/ybnAQ00YlrEZWRgkw9FuZwCvD8JIa1OMRwvixokXsnA6wrsOXc64P4ThMKp1gP4vJKHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:405:4c::20) by BYAPR12MB2710.namprd12.prod.outlook.com
 (2603:10b6:a03:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Tue, 27 Aug
 2019 14:13:36 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR1201CA0010.outlook.office365.com
 (2603:10b6:405:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 14:13:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 14:13:36 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 09:13:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 3/6] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Tue, 27 Aug 2019 10:13:26 -0400
Message-ID: <20190827141329.30767-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141329.30767-1-David.Francis@amd.com>
References: <20190827141329.30767-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(2351001)(81166006)(70586007)(70206006)(426003)(53936002)(26005)(49486002)(316002)(50226002)(51416003)(1076003)(47776003)(48376002)(50466002)(16586007)(8936002)(6666004)(356004)(4326008)(76176011)(186003)(305945005)(5660300002)(14444005)(2906002)(86362001)(2616005)(486006)(6916009)(11346002)(478600001)(81156014)(476003)(446003)(8676002)(36756003)(126002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 736e0ca4-6d0e-4607-0947-08d72af8c078
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27105B2CC63C67CAA155B0C5EFA00@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pfc6NSUr3bruvQSq9hkj1S6uqzICEkrKYRyoWyCL1AlKNGpErqsscHtvp8fNoB2n29FToINIoBQ8wCW/NkMtSUjG7+9J3pWdSaKPRnsMMLvWydaCP+9qwYoXjaqnIaM5pFLHs3xp0Qo22C6E3MXpRKxpVzHlpB54+8DP1X8vkhly7KGEU/xmwE+DWHMlpW/2CyWfTyTkJvzuixqhRfMg7uLCUr6nzHoooFgiRHXbk3lnFytPkw1jQnuZP2Uv27XJI/pGzAFzo9P04wNsnoRwDoJrrUcHrJ8wO/q8UIt6mKXZueGJTpx+FfTUQ8m9GvIasRv29kLRSf7usQa1zDkr1dP5RejEdybibLEVbHrUAEfxtTqIWrSCIrnJE3fc1tQSYOJMHuxZ59a48Nq5wT/9c8OGd24jIDtE6m5hB77Sk1Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 14:13:36.4251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736e0ca4-6d0e-4607-0947-08d72af8c078
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oI2241rku6JrRwkSyCR5B0fRw0qUHJF5llSmv1WyQs=;
 b=MOf0dtWURwXkZBRJ2wRFFH8SCDhudmv0fc/sgo8cIdT38nBtb8irQLaKF9jqBY7J0p52oBik+cL0r6/n8DKlyQBJ2slexokfd6QHh6RvKfaatbyJX6zxWPGSqWN/84hbfDSJ6kbjMraCYe5yr2qruDcKmb8wdy8dNp0/UIrFJhM=
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
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5G
cmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAx
MiArKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgIHwgMzAgKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfYXV4X2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMKaW5kZXggMGNm
YjM4Njc1NGMzLi40MThjYWQ0ZjY0OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfYXV4X2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCkBAIC0x
NjMsMTEgKzE2Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl9yZWFkX2l0ZXIoc3RydWN0IGtp
b2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAo
YXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2RfcmVhZChh
dXhfZGV2LT5hdXgsIHBvcywgYnVmLAotCQkJCQkJICAgdG9kbyk7Ci0JCWVsc2UKLQkJCXJlcyA9
IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9
IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CiAKIAkJaWYg
KHJlcyA8PSAwKQogCQkJYnJlYWs7CkBAIC0yMTUsMTEgKzIxMSw3IEBAIHN0YXRpYyBzc2l6ZV90
IGF1eGRldl93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpm
cm9tKQogCQkJYnJlYWs7CiAJCX0KIAotCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCi0J
CQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKLQkJ
CQkJCSAgICB0b2RvKTsKLQkJZWxzZQotCQkJcmVzID0gZHJtX2RwX2RwY2Rfd3JpdGUoYXV4X2Rl
di0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7CisJCXJlcyA9IGRybV9kcF9tc3RfZHBjZF93cml0ZShh
dXhfZGV2LT5hdXgsIHBvcywgYnVmLCB0b2RvKTsKIAogCQlpZiAocmVzIDw9IDApCiAJCQlicmVh
azsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IGZmYzY4ZDMwNWFmZS4uMmNjMjFlZmY0Y2Yz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNpbmNsdWRlIDxs
aW51eC9zZXFfZmlsZS5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9kcF9oZWxwZXIuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIApAQCAtMjUxLDcgKzI1Miw3IEBAIHN0YXRp
YyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHU4IHJlcXVl
c3QsCiAKIC8qKgogICogZHJtX2RwX2RwY2RfcmVhZCgpIC0gcmVhZCBhIHNlcmllcyBvZiBieXRl
cyBmcm9tIHRoZSBEUENECi0gKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAorICogQGF1
eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBvciBNU1QpCiAgKiBAb2Zmc2V0OiBhZGRy
ZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRvIHJlYWQKICAqIEBidWZmZXI6IGJ1ZmZlciB0
byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCiAgKiBAc2l6ZTogbnVtYmVyIG9mIGJ5dGVzIGlu
IEBidWZmZXIKQEAgLTI4MCwxMyArMjgxLDE4IEBAIHNzaXplX3QgZHJtX2RwX2RwY2RfcmVhZChz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCSAqIFdlIGp1c3Qg
aGF2ZSB0byBkbyBpdCBiZWZvcmUgYW55IERQQ0QgYWNjZXNzIGFuZCBob3BlIHRoYXQgdGhlCiAJ
ICogbW9uaXRvciBkb2Vzbid0IHBvd2VyIGRvd24gZXhhY3RseSBhZnRlciB0aGUgdGhyb3cgYXdh
eSByZWFkLgogCSAqLwotCXJldCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJ
VkVfUkVBRCwgRFBfRFBDRF9SRVYsIGJ1ZmZlciwKLQkJCQkgMSk7Ci0JaWYgKHJldCAhPSAxKQot
CQlnb3RvIG91dDsKKwlpZiAoIWF1eC0+aXNfcmVtb3RlKSB7CisJCXJldCA9IGRybV9kcF9kcGNk
X2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsCisJCQkJCSBidWZm
ZXIsIDEpOworCQlpZiAocmV0ICE9IDEpCisJCQlnb3RvIG91dDsKKwl9CiAKLQlyZXQgPSBkcm1f
ZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1JFQUQsIG9mZnNldCwgYnVmZmVyLAot
CQkJCSBzaXplKTsKKwlpZiAoYXV4LT5pc19yZW1vdGUpCisJCXJldCA9IGRybV9kcF9tc3RfZHBj
ZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0gZHJtX2Rw
X2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsCisJCQkJCSBidWZm
ZXIsIHNpemUpOwogCiBvdXQ6CiAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElW
RV9SRUFELCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsKQEAgLTI5Niw3ICszMDIsNyBAQCBFWFBPUlRf
U1lNQk9MKGRybV9kcF9kcGNkX3JlYWQpOwogCiAvKioKICAqIGRybV9kcF9kcGNkX3dyaXRlKCkg
LSB3cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAotICogQGF1eDogRGlzcGxheVBv
cnQgQVVYIGNoYW5uZWwKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsIChTU1Qgb3Ig
TVNUKQogICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byB3cml0
ZQogICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZhbHVlcyB0byB3cml0ZQogICog
QHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyCkBAIC0zMTMsOCArMzE5LDEyIEBAIHNz
aXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQg
aW50IG9mZnNldCwKIHsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1
eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LCBidWZmZXIsCi0JCQkJIHNpemUpOworCWlm
IChhdXgtPmlzX3JlbW90ZSkKKwkJcmV0ID0gZHJtX2RwX21zdF9kcGNkX3dyaXRlKGF1eCwgb2Zm
c2V0LCBidWZmZXIsIHNpemUpOworCWVsc2UKKwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1
eCwgRFBfQVVYX05BVElWRV9XUklURSwgb2Zmc2V0LAorCQkJCQkgYnVmZmVyLCBzaXplKTsKKwog
CWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwgYnVm
ZmVyLCByZXQpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
