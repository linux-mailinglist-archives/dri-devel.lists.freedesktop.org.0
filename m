Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50F96935
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68986E876;
	Tue, 20 Aug 2019 19:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387236E869;
 Tue, 20 Aug 2019 19:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/PUSWstQa3xStCshcmSscd+1wofxjXjjokhxTrdSHfB5iUewPUoJBbVO/tsQOjJ+gFF+Cv79l0IyTE/M10QHOyAAfdrjH3JPDhPa2znmSdxWT7yrEO7nRBwnWhuPef60zolTHzi3Dl5EcNKBdcsspWIKy6gYVSZpGmdXfzAfO3cUy6OUV8pQefcVx7h42wTD3siuBtnV9pTgbXDxJ0UZJbNWacRHbemoqk9vnZ6KKlY7q2BE7ruPij45FMASXZ4c3PLbmAQcZ4whjRlDYt8GIJ9Ql7kvNVhvFx28hgDG/3iQd4TTn1ax7DAzG48RLzYL2nHNIvjCgdzz8iZ1nCs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOZrI9tcIvAzywlZL4IwEUISgUIiR80sWhNBq8yuZEc=;
 b=HaugrIk1Lbobiic+xJlGsYQ7bzeEwGqkKBjTMnv8600l3QUZ7TlXUy9T91B0wHlNnQBU1F4pxC50xQGQvIKJ9b0cbx75/Z5cBgb2WxVbmGPHKTuiQo+cpAyqCFwgYmBYETGACQG6oKu7uXFcPIvRkPJiH9mcbpPEzQpStXmLsQXDRbAzlPov4XtqnwjtUPT9zGHcD85v+dfPkcByWZG+lxtoxhLsEkEaZ+8FU/mXNJvwqUK0sgmwkm91CWLS3Kyw8EQqTB9tOwQZQvoZY1dZfTFzRpMwwT+DKTotTEF38FSv1Xi+QYM9qCrcsOE4REWBtDwbSWGKihaFj6Hwjb+oRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by MWHPR12MB1533.namprd12.prod.outlook.com
 (2603:10b6:301:f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 19:12:33 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
Date: Tue, 20 Aug 2019 15:12:03 -0400
Message-ID: <20190820191203.25807-15-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(6666004)(356004)(47776003)(8936002)(4326008)(50226002)(5024004)(186003)(70206006)(14444005)(11346002)(49486002)(426003)(2616005)(446003)(486006)(86362001)(336012)(476003)(126002)(305945005)(36756003)(50466002)(2906002)(26005)(76176011)(16586007)(110136005)(70586007)(51416003)(54906003)(478600001)(450100002)(53936002)(5660300002)(81156014)(48376002)(1076003)(8676002)(316002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1533; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 863c4f37-4d5d-48b5-1580-08d725a25a85
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1533; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1533:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15333665E0CDDAF18EB19CD1EFAB0@MWHPR12MB1533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iBbLKR/JdLBfnytsQq01+w51VPkLXQRMfO3ZNCSFkHtDMUf6YoEF0zhyf9xbH2DB19tKKyUV/mxbKZ1EP5++9nlkZ407qs1jx6jBZJGjV+xPp9WjV0p102jONVQ6ldqRW+itSWCZGKJkpuF0ukAbXr/UBEW7By5gPglviZpq7Q08p0Fh0rTcSjAEBqH4TWQj5jqBowm74N+d7IfCiL467dFTKVVjz4N+RCg1DvcjGNTlFI1GBUSTFHChLxyJgMCqEzmsDLLGccjsc65Nqf3xwrymxL8QsLnktcSr8uVb2yxEGUWtoLEQHSojip9Kb+xY+lDCMMMMEVczu4AhsOjLoV5YPyhO7K/5lry6S5gzdE78NpbD6tr0Vbk40qQr5gRaS6jih1KPP8OOJmGR4MprNZ8L0uvzh4Ugog1hC3KYUmM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:32.8154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 863c4f37-4d5d-48b5-1580-08d725a25a85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOZrI9tcIvAzywlZL4IwEUISgUIiR80sWhNBq8yuZEc=;
 b=APjzD3Eap/NP8buRBmazkmIkxpimOTi79VZJUQerByA/lgOYzukKDx/U7aVLUHWESzrxI1I2LlN08w+RmeFpUtd55Dik0TeFWx3ykMM37IGnvZBaz/w5IKelsNV3RCJ68IzbWePj9WqDVygCz8hzTLPcVNeQoPT8PiTvrxTadjc=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbmV2ZXIgYSBjb25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFj
aGVkLCBvcgp1bmRlcmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3Ry
ZWFtIG9uIHRoYXQKdG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5n
ZSB0aGVpciByZXF1aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWlu
ZywgYXMgdGhvdWdoIGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFt
IGRpZCBub3QgY2hhbmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBh
IE1TVCB0b3BvbG9neSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0
IGNydGMgKGFuZCBhbGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRv
bWljIHN0YXRlIGFuZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKdjI6IERvIHRoaXMg
Y2hlY2sgb25seSBvbiBOYXZpIGFuZCBiZWZvcmUgYWRkaW5nIGNvbm5lY3RvcnMKYW5kIHBsYW5l
cyBvbiBtb2Rlc2V0dGluZyBjcnRjcwoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpD
YzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNzQgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAxNDVm
ZDczMDI1ZGMuLmU2NGYyYTZlYjcxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02NDc1LDcgKzY0NzUsNzAgQEAgc3RhdGlj
IGludCBkb19hcXVpcmVfZ2xvYmFsX2xvY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCXJl
dHVybiByZXQgPCAwID8gcmV0IDogMDsKIH0KKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0Nf
U1VQUE9SVAorc3RhdGljIGludCBhZGRfYWZmZWN0ZWRfbXN0X2RzY19jcnRjcyhzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKK3sKKwlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpj
b25uX3N0YXRlOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7CisJ
c3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZTsKKwlzdHJ1Y3QgYW1kZ3B1X2Rt
X2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IE5VTEwsICphY29ubmVjdG9yX3RvX2FkZDsKKwlpbnQg
aSwgajsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGNzX2FmZmVjdGVkW0FNREdQVV9NQVhfQ1JUQ1Nd
ID0geyAwIH07CisKKwlmb3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKHN0YXRlLCBjb25u
ZWN0b3IsIGNvbm5fc3RhdGUsIGkpIHsKKwkJaWYgKGNvbm5fc3RhdGUtPmNydGMgIT0gY3J0YykK
KwkJCWNvbnRpbnVlOworCisJCWFjb25uZWN0b3IgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNv
bm5lY3Rvcik7CisJCWlmICghYWNvbm5lY3Rvci0+cG9ydCkKKwkJCWFjb25uZWN0b3IgPSBOVUxM
OworCQllbHNlCisJCQlicmVhazsKKwl9CisKKwlpZiAoIWFjb25uZWN0b3IpCisJCXJldHVybiAw
OworCisJaSA9IDA7CisJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oc3RhdGUtPmRldiwg
JmNvbm5faXRlcik7CisJZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3RvciwgJmNv
bm5faXRlcikgeworCQlpZiAoIWNvbm5lY3Rvci0+c3RhdGUgfHwgIWNvbm5lY3Rvci0+c3RhdGUt
PmNydGMpCisJCQljb250aW51ZTsKKworCQlhY29ubmVjdG9yX3RvX2FkZCA9IHRvX2FtZGdwdV9k
bV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwkJaWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+cG9ydCkK
KwkJCWNvbnRpbnVlOworCisJCWlmIChhY29ubmVjdG9yX3RvX2FkZC0+cG9ydC0+bWdyICE9IGFj
b25uZWN0b3ItPnBvcnQtPm1ncikKKwkJCWNvbnRpbnVlOwogCisJCWlmICghYWNvbm5lY3Rvcl90
b19hZGQtPmRjX3NpbmspCisJCQljb250aW51ZTsKKworCQlpZiAoIWFjb25uZWN0b3JfdG9fYWRk
LT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2Fwcy5pc19kc2Nfc3VwcG9ydGVkKQor
CQkJY29udGludWU7CisKKwkJaWYgKGkgPj0gQU1ER1BVX01BWF9DUlRDUykKKwkJCWNvbnRpbnVl
OworCisJCWNydGNzX2FmZmVjdGVkW2ldID0gY29ubmVjdG9yLT5zdGF0ZS0+Y3J0YzsKKwkJaSsr
OworCX0KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7CisKKwlmb3Ig
KGogPSAwOyBqIDwgaTsgaisrKSB7CisJCW5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRf
Y3J0Y19zdGF0ZShzdGF0ZSwgY3J0Y3NfYWZmZWN0ZWRbal0pOworCQlpZiAoSVNfRVJSKG5ld19j
cnRjX3N0YXRlKSkKKwkJCXJldHVybiBQVFJfRVJSKG5ld19jcnRjX3N0YXRlKTsKKworCQluZXdf
Y3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkID0gdHJ1ZTsKKwl9CisKKwlyZXR1cm4gMDsKKworfQor
I2VuZGlmCiBzdGF0aWMgdm9pZCBnZXRfZnJlZXN5bmNfY29uZmlnX2Zvcl9jcnRjKAogCXN0cnVj
dCBkbV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSwKIAlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0
YXRlICpuZXdfY29uX3N0YXRlKQpAQCAtNzE2MCw2ICs3MjIzLDE3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJ
CWdvdG8gZmFpbDsKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJaWYg
KGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgeworCQlmb3JfZWFjaF9vbGRuZXdfY3J0
Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBp
KSB7CisJCQlpZiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUp
KSB7CisJCQkJcmV0ID0gYWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RhdGUsIGNydGMpOwor
CQkJCWlmIChyZXQpCisJCQkJCWdvdG8gZmFpbDsKKwkJCX0KKwkJfQorCX0KKyNlbmRpZgogCWZv
cl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwg
bmV3X2NydGNfc3RhdGUsIGkpIHsKIAkJaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNl
dChuZXdfY3J0Y19zdGF0ZSkgJiYKIAkJICAgICFuZXdfY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9j
aGFuZ2VkICYmCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
