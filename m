Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9A200E9
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752A7892B7;
	Thu, 16 May 2019 08:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740085.outbound.protection.outlook.com [40.107.74.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5795A892B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:07:28 +0000 (UTC)
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Thu, 16 May
 2019 08:07:26 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 08:07:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 08:07:25 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 03:07:24 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 2/7] add timeline wait/query ioctl v2
Date: Thu, 16 May 2019 16:07:09 +0800
Message-ID: <20190516080714.14980-2-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516080714.14980-1-david1.zhou@amd.com>
References: <20190516080714.14980-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(26005)(72206003)(68736007)(478600001)(48376002)(356004)(8936002)(50466002)(36756003)(50226002)(5660300002)(70206006)(6666004)(53936002)(53416004)(47776003)(70586007)(76176011)(81166006)(11346002)(2906002)(16586007)(110136005)(305945005)(126002)(446003)(51416003)(336012)(7696005)(476003)(2616005)(86362001)(81156014)(8676002)(186003)(316002)(1076003)(426003)(486006)(77096007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a0fd104-563a-4f72-f102-08d6d9d5883c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00600504B4B2667C03B0D6A2B40A0@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3IbVIYunZn1Afcct2jzCBHkHO4Vy5pSNYmdr5UCwoiF6WvK9uGEptwmWeGawb664IW2zr1t8BStQj5v9WtuAxdjj7xXk0IMeURRdIG23/CiHIoyEVMVLC9r4QL3YDGU7+7iSeZ0NVfqeYMDD/WAmgCCwIGRMWrBH5KWfqYpqiLLub2jyFqP3um5lV3BYNAfhyk5vv4mcex3g7bmyeD/fJHHaVSDE7YDvH4/GFbmeyC00aQfn6k15czqY53CTsJLW6HXTsrwwnc4sIle3wyyw8vgkhgeKMrc/hRijwdEnQgFcy+XfV7LL2wTWwDxfvpwwtU/6jKmzgBbUaEDX28XriZPOOC7a4ndH8IFtzWXkV3V1Q4Az5Y4zN+RRU5HnROFzdWMug0ihsp97EjxnGO6yW7Fwi3zvNnG80wKgQuLOVHU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 08:07:25.5269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0fd104-563a-4f72-f102-08d6d9d5883c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7x0lnemXmXGXWcpJa5Uuy+ocHN7DPko4zcuwa9WaI8=;
 b=zkFdtJbEvo2xBrznAbCgSmmZOERFTm6/Y8p+zkkSt8ImK5VmXi+udaJjYsgajHlxdbTibnb0uxFm6MTjuULm6OZuNhr2uQoDYMk+9xA8EVFodnGtgWwXXRx4/HTlaPJseHNTyT76LvOCB9QC9jPPz/vgdM5qkz4gUNRQkwh03RQ=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IGRyb3AgZXhwb3J0L2ltcG9ydAoKU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2
aWQxLnpob3VAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwu
Zy5sYW5kd2VybGluQGludGVsLmNvbT4KLS0tCiB4Zjg2ZHJtLmMgfCA0NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGY4NmRybS5oIHwgIDYgKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94Zjg2ZHJtLmMg
Yi94Zjg2ZHJtLmMKaW5kZXggMmMxOTM3NmIuLjFhNzE3ZjAyIDEwMDY0NAotLS0gYS94Zjg2ZHJt
LmMKKysrIGIveGY4NmRybS5jCkBAIC00MjU2LDMgKzQyNTYsNDcgQEAgZHJtX3B1YmxpYyBpbnQg
ZHJtU3luY29ialNpZ25hbChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVzLAogICAgIHJl
dCA9IGRybUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9TSUdOQUwsICZhcmdzKTsKICAgICBy
ZXR1cm4gcmV0OwogfQorCitkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVGltZWxpbmVXYWl0KGlu
dCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkJICAgICAgdW5z
aWduZWQgbnVtX2hhbmRsZXMsCisJCQkJICAgICAgaW50NjRfdCB0aW1lb3V0X25zZWMsIHVuc2ln
bmVkIGZsYWdzLAorCQkJCSAgICAgIHVpbnQzMl90ICpmaXJzdF9zaWduYWxlZCkKK3sKKyAgICBz
dHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfd2FpdCBhcmdzOworICAgIGludCByZXQ7CisKKyAg
ICBtZW1jbGVhcihhcmdzKTsKKyAgICBhcmdzLmhhbmRsZXMgPSAodWludHB0cl90KWhhbmRsZXM7
CisgICAgYXJncy5wb2ludHMgPSAodWludHB0cl90KXBvaW50czsKKyAgICBhcmdzLnRpbWVvdXRf
bnNlYyA9IHRpbWVvdXRfbnNlYzsKKyAgICBhcmdzLmNvdW50X2hhbmRsZXMgPSBudW1faGFuZGxl
czsKKyAgICBhcmdzLmZsYWdzID0gZmxhZ3M7CisKKyAgICByZXQgPSBkcm1Jb2N0bChmZCwgRFJN
X0lPQ1RMX1NZTkNPQkpfVElNRUxJTkVfV0FJVCwgJmFyZ3MpOworICAgIGlmIChyZXQgPCAwKQor
ICAgICAgICByZXR1cm4gLWVycm5vOworCisgICAgaWYgKGZpcnN0X3NpZ25hbGVkKQorICAgICAg
ICAqZmlyc3Rfc2lnbmFsZWQgPSBhcmdzLmZpcnN0X3NpZ25hbGVkOworICAgIHJldHVybiByZXQ7
Cit9CisKKworZHJtX3B1YmxpYyBpbnQgZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3Qg
KmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkgICAgICAgdWludDMyX3QgaGFuZGxlX2Nv
dW50KQoreworICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSBhcmdzOworICAg
IGludCByZXQ7CisKKyAgICBtZW1jbGVhcihhcmdzKTsKKyAgICBhcmdzLmhhbmRsZXMgPSAodWlu
dHB0cl90KWhhbmRsZXM7CisgICAgYXJncy5wb2ludHMgPSAodWludHB0cl90KXBvaW50czsKKyAg
ICBhcmdzLmNvdW50X2hhbmRsZXMgPSBoYW5kbGVfY291bnQ7CisKKyAgICByZXQgPSBkcm1Jb2N0
bChmZCwgRFJNX0lPQ1RMX1NZTkNPQkpfUVVFUlksICZhcmdzKTsKKyAgICBpZiAocmV0KQorICAg
ICAgICByZXR1cm4gcmV0OworICAgIHJldHVybiAwOworfQorCisKZGlmZiAtLWdpdCBhL3hmODZk
cm0uaCBiL3hmODZkcm0uaAppbmRleCA4ODdlY2M3Ni4uNjBjN2E4NGYgMTAwNjQ0Ci0tLSBhL3hm
ODZkcm0uaAorKysgYi94Zjg2ZHJtLmgKQEAgLTg3Niw2ICs4NzYsMTIgQEAgZXh0ZXJuIGludCBk
cm1TeW5jb2JqV2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1bnNpZ25lZCBudW1faGFu
ZGxlcywKIAkJCSAgdWludDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKIGV4dGVybiBpbnQgZHJtU3lu
Y29ialJlc2V0KGludCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQzMl90IGhhbmRs
ZV9jb3VudCk7CiBleHRlcm4gaW50IGRybVN5bmNvYmpTaWduYWwoaW50IGZkLCBjb25zdCB1aW50
MzJfdCAqaGFuZGxlcywgdWludDMyX3QgaGFuZGxlX2NvdW50KTsKK2V4dGVybiBpbnQgZHJtU3lu
Y29ialRpbWVsaW5lV2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9p
bnRzLAorCQkJCSAgdW5zaWduZWQgbnVtX2hhbmRsZXMsCisJCQkJICBpbnQ2NF90IHRpbWVvdXRf
bnNlYywgdW5zaWduZWQgZmxhZ3MsCisJCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwor
ZXh0ZXJuIGludCBkcm1TeW5jb2JqUXVlcnkoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWlu
dDY0X3QgKnBvaW50cywKKwkJCSAgIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7CiAKICNpZiBkZWZp
bmVkKF9fY3BsdXNwbHVzKQogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
