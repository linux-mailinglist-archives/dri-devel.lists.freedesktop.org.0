Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F7C3A3C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ED86E855;
	Tue,  1 Oct 2019 16:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617846E854;
 Tue,  1 Oct 2019 16:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsALBvQhY2LoAZP5c/H4y6xDjaEJQDFSj299qP+H3mZJ6SgepzePH+fNffUHxM2R7s23OL2XYQYoyaop13HoU3Vr9W0wNqh//bVERE0kTFDGHYL8LRxSyO70Y1b0QivXauGu3WH9+d4g1Llm9brJGWJIY6Kwp8A2dSGY54sBDPI+3XX+Uf1U1Br1eNUHQtwLqYPRSwOk4OBBHHLqLoATM7KZwp1IFwBB3OgJnuWDJldcDJVngu1xoc0opiENwtMOV2fj8h4W3niertUHdXsJ9vpwdx7U5/gqPFT+0oV0YRfuyPQjzZscrQM9G60dBU/Lknr+ejPizbVvCua9hL6vAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klLwLc0qRYCDWNg+laesVThdIWL/F/MRC+QP7wI6e2s=;
 b=m2/HOfIjUaegwgbd8+C6fFM6aUyXJG3pvAqMLlVJ9JJ51pnCQpOkhvHTykgoTgsiDHEdSVUROUQmGR33WBajXv8RsiPOuvW/OCt4IJN9+EGfVCzGN7RsMYrAokGhZR394duWAKLSlTf3MTCeYea10fgFwdlBUq2BUmYDyEXJXqqe09z9oxC9R32QeRLv8iTd8U20NMeZZN8rwWB+zxLu0EWqZkXDdnVkZ1UsQhNFpxnVZZm9nNarNor1JcViPD+hG0bEJk+SkMG0nWAmuio2l/xvv5I5Knjzasfw8qTjVfwiOLkVaqSgZsBS1oOKlil/I929ZhAVRGNeUfYhojutmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by CY4PR1201MB0216.namprd12.prod.outlook.com (2603:10b6:910:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Tue, 1 Oct
 2019 16:17:42 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:40 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:36 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/14] drm/amd/display: Validate DSC caps on MST endpoints
Date: Tue, 1 Oct 2019 12:17:17 -0400
Message-ID: <20191001161721.13793-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-10-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
 <20191001161721.13793-10-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(428003)(199004)(189003)(316002)(16586007)(54906003)(8936002)(50466002)(70586007)(70206006)(15650500001)(8676002)(81166006)(81156014)(50226002)(86362001)(14444005)(2906002)(305945005)(36756003)(2876002)(47776003)(48376002)(478600001)(186003)(6916009)(26005)(2351001)(76176011)(7696005)(51416003)(356004)(6666004)(450100002)(1076003)(5660300002)(53416004)(11346002)(2616005)(476003)(126002)(426003)(486006)(4326008)(446003)(336012)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0216; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b703967c-b07b-48eb-596c-08d7468ae227
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0216:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02162A1FDF75B7F1523F4ADBE49D0@CY4PR1201MB0216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WvHz18OEbIO0Ul3eltSBfqDrTRrd5RJFVOTYyX3WjOuQt4OPzslkg0lzPG77Zb4J8Zw7B7sz/ilTRW9l/ild3nadxvRyOl2rX3q735ot794kXQOxt/Pry2fNaYC5+zxgjURgJQPn3YTcnKMlF/paFUtoJuVI+laGZDXKdI3g/QXJdHLNH5Ht3h/QAMD/Q1watHt9VmhLZkr0j58Q0DUWq6YVuyotxdnfusjtP94OBtSXXnIwtgVOtOK5ne7aV2EEKtRkonjzXZYXtOxTYLRCXbPhWTElgf4CGESFlsjHzEyCQTqLtV+RNtpBNWGy1U2AK5QEOJw0J84zeW+ML6K1sl8/hcqJc7d/Sd9JOoP7fkbMC512BZzcyN29ByNA856jsik+7Z/TQt1AplrPet7MvLTd0SLlfAH3wtY/6yP9KwE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:40.7963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b703967c-b07b-48eb-596c-08d7468ae227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klLwLc0qRYCDWNg+laesVThdIWL/F/MRC+QP7wI6e2s=;
 b=FoQhpb5AS0qMbXHbeFQNeyc7IL1Md+psokreDTJS/WiKZy2kcZmxJxRVeBhjYFIiTbNgWAO8HSaXAyIw60Fd79XATeKNUJNrn5MQ+sll7xqlMWZ+Nhnw4uaCoxs/eBUuvRQSFN0arxSR2D1eFmIdoDtj3BK3zNMhyIGZXjExoAk=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRHVyaW5nIE1TVCBt
b2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0
IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0IHRvIGdldCB0aGUgcmF3IGNhcHMsCnRoZW4gcGFyc2UgdGhlbSBvbnRvIGRjX3Npbmsg
d2l0aCBkY19kc2NfcGFyc2VfZHNjX2RwY2QuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdl
bmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZy
YW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmggfCAgMyArKwogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYyAgIHwgMzEgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXggM2NlMTA0MzI0MDk2Li44YmFlNmYyNjRl
ZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaApAQCAtMjc5LDYgKzI3OSw5IEBAIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yIHsK
IAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICptc3RfcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKm1zdF9lbmNvZGVyOworI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJc3RydWN0IGRybV9kcF9hdXggKmRz
Y19hdXg7CisjZW5kaWYKIAogCS8qIE1TVCBzcGVjaWZpYyAqLwogCXVpbnQzMl90IHZjcGlfc2xv
dHM7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmluZGV4IDdmM2NlMjliZDE0Yy4uMjcwZDk3MmM5YzNj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9tc3RfdHlwZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwpAQCAtMjUsNiArMjUsNyBAQAogCiAjaW5jbHVkZSA8
bGludXgvdmVyc2lvbi5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fZHBfbXN0X2hlbHBlci5oPgogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgi
CiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCkBAIC0xODcsNiAr
MTg4LDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBkbV9kcF9t
c3RfY29ubmVjdG9yX2Z1bmNzID0gewogCS5lYXJseV91bnJlZ2lzdGVyID0gYW1kZ3B1X2RtX21z
dF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlciwKIH07CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FN
RF9EQ19EU0NfU1VQUE9SVAorc3RhdGljIGJvb2wgdmFsaWRhdGVfZHNjX2NhcHNfb25fY29ubmVj
dG9yKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQoreworCXN0cnVjdCBk
Y19zaW5rICpkY19zaW5rID0gYWNvbm5lY3Rvci0+ZGNfc2luazsKKwlzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0ICpwb3J0ID0gYWNvbm5lY3Rvci0+cG9ydDsKKwl1OCBkc2NfY2Fwc1sxNl0gPSB7IDAg
fTsKKworCWFjb25uZWN0b3ItPmRzY19hdXggPSBkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQo
cG9ydCk7CisKKwlpZiAoIWFjb25uZWN0b3ItPmRzY19hdXgpCisJCXJldHVybiBmYWxzZTsKKwor
CWlmIChkcm1fZHBfZHBjZF9yZWFkKGFjb25uZWN0b3ItPmRzY19hdXgsIERQX0RTQ19TVVBQT1JU
LCBkc2NfY2FwcywgMTYpIDwgMCkKKwkJcmV0dXJuIGZhbHNlOworCisJaWYgKCFkY19kc2NfcGFy
c2VfZHNjX2RwY2QoZHNjX2NhcHMsIE5VTEwsICZkY19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19k
ZWNfY2FwcykpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorI2VuZGlmCisK
IHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogewogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9f
YW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwpAQCAtMjI5LDEwICsyNTIsMTYgQEAgc3Rh
dGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiAJCS8qIGRjX2xpbmtfYWRkX3JlbW90ZV9zaW5rIHJldHVybnMgYSBuZXcgcmVmZXJlbmNl
ICovCiAJCWFjb25uZWN0b3ItPmRjX3NpbmsgPSBkY19zaW5rOwogCi0JCWlmIChhY29ubmVjdG9y
LT5kY19zaW5rKQorCQlpZiAoYWNvbm5lY3Rvci0+ZGNfc2luaykgewogCQkJYW1kZ3B1X2RtX3Vw
ZGF0ZV9mcmVlc3luY19jYXBzKAogCQkJCQljb25uZWN0b3IsIGFjb25uZWN0b3ItPmVkaWQpOwog
CisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKwkJCWlmICghdmFsaWRhdGVf
ZHNjX2NhcHNfb25fY29ubmVjdG9yKGFjb25uZWN0b3IpKQorCQkJCW1lbXNldCgmYWNvbm5lY3Rv
ci0+ZGNfc2luay0+c2lua19kc2NfY2FwcywKKwkJCQkgICAgICAgMCwgc2l6ZW9mKGFjb25uZWN0
b3ItPmRjX3NpbmstPnNpbmtfZHNjX2NhcHMpKTsKKyNlbmRpZgorCQl9CiAJfQogCiAJZHJtX2Nv
bm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eSgKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
