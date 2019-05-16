Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88286200EB
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC81892CC;
	Thu, 16 May 2019 08:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800052.outbound.protection.outlook.com [40.107.80.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C880B892CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:07:34 +0000 (UTC)
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Thu, 16 May 2019 08:07:32 +0000
Received: from DM3NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 08:07:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT056.mail.protection.outlook.com (10.152.83.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 08:07:32 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 03:07:30 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 4/7] add timeline signal/transfer ioctls v2
Date: Thu, 16 May 2019 16:07:11 +0800
Message-ID: <20190516080714.14980-4-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516080714.14980-1-david1.zhou@amd.com>
References: <20190516080714.14980-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(4326008)(1076003)(47776003)(53936002)(5660300002)(2906002)(426003)(110136005)(76176011)(51416003)(48376002)(6666004)(7696005)(50466002)(356004)(70586007)(70206006)(81166006)(8676002)(86362001)(478600001)(72206003)(336012)(2616005)(126002)(446003)(316002)(486006)(11346002)(476003)(8936002)(77096007)(305945005)(68736007)(26005)(50226002)(81156014)(53416004)(16586007)(36756003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2664; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc3fd7d4-d00e-4ce8-bd74-08d6d9d58c31
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2664; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2664:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26642C79C67A53FD00CBAD7FB40A0@BYAPR12MB2664.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mR8buN4CEgONUvB1AXkps6D9WErDnu0Wqq2qNzOFsM/D8upoeqKH3g/Quznt7oq+Gy1sReHdD5R+Ocz/ujywIaaq2x5zE/EHKLiysuLv5/X5YtC+zcUY9418hhy2j1xLY6FBa2DGvx4RxEFeRNY3IceakU/WluU7gMWXVPi2CA+4T+SKzZDUmrm6uNoKiXAHMFHfzv9vuMJ8bDWMoXMDjDJ75xRhjHBIxmJ3p9LraSPMgzqqb0exUdDCjzyP2+apEkIV5Hx8bStPVwfvnrVrJUsIc29k/rg/642afQ30Bu52s+uldkXIMOKxR4grM4QcwlWBiCmHGp5qJSTeVtiATZadMceK87sEahjlIitQuHp87l7euLST+/vu3gsHUsoD+ReldkKcZ1OYx4O18KiocWzOcDpDNIOFzP8dBNi6/2s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 08:07:32.1814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3fd7d4-d00e-4ce8-bd74-08d6d9d58c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BJslU7vJVtg6Rwi9klBc0Tbpt5PpdeTXRnkUIjzojw=;
 b=PTtuAa+hIflGIhu/VD+0gckcFI93XRBMnKSIcuQb+yYacV40xlD9bMdLhZ+k4lTc3k7bbGosw1J7eaqlD6w4cCuiBGwdNe0tSMcsSxQSQRoptd2G6g4YnYdkI5NOiIuvSwMb/dgJ3Im2q857m9dAYTnknV3iBs2itLzNq1+qq5c=
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

djI6IHVzZSBvbmUgdHJhbnNmZXIgaW9jdGwKClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3Ug
PGRhdmlkMS56aG91QGFtZC5jb20+ClJldmlld2VkLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlv
bmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Ci0tLQogeGY4NmRybS5jIHwgMzMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiB4Zjg2ZHJtLmggfCAgNiArKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hmODZkcm0uYyBiL3hmODZk
cm0uYwppbmRleCAxYTcxN2YwMi4uOTUzZmM3NjIgMTAwNjQ0Ci0tLSBhL3hmODZkcm0uYworKysg
Yi94Zjg2ZHJtLmMKQEAgLTQyNTcsNiArNDI1NywyMSBAQCBkcm1fcHVibGljIGludCBkcm1TeW5j
b2JqU2lnbmFsKGludCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsCiAgICAgcmV0dXJuIHJl
dDsKIH0KIAorZHJtX3B1YmxpYyBpbnQgZHJtU3luY29ialRpbWVsaW5lU2lnbmFsKGludCBmZCwg
Y29uc3QgdWludDMyX3QgKmhhbmRsZXMsCisJCQkJCXVpbnQ2NF90ICpwb2ludHMsIHVpbnQzMl90
IGhhbmRsZV9jb3VudCkKK3sKKyAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkg
YXJnczsKKyAgICBpbnQgcmV0OworCisgICAgbWVtY2xlYXIoYXJncyk7CisgICAgYXJncy5oYW5k
bGVzID0gKHVpbnRwdHJfdCloYW5kbGVzOworICAgIGFyZ3MucG9pbnRzID0gKHVpbnRwdHJfdClw
b2ludHM7CisgICAgYXJncy5jb3VudF9oYW5kbGVzID0gaGFuZGxlX2NvdW50OworCisgICAgcmV0
ID0gZHJtSW9jdGwoZmQsIERSTV9JT0NUTF9TWU5DT0JKX1RJTUVMSU5FX1NJR05BTCwgJmFyZ3Mp
OworICAgIHJldHVybiByZXQ7Cit9CisKIGRybV9wdWJsaWMgaW50IGRybVN5bmNvYmpUaW1lbGlu
ZVdhaXQoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKIAkJCQkg
ICAgICB1bnNpZ25lZCBudW1faGFuZGxlcywKIAkJCQkgICAgICBpbnQ2NF90IHRpbWVvdXRfbnNl
YywgdW5zaWduZWQgZmxhZ3MsCkBAIC00Mjk5LDQgKzQzMTQsMjIgQEAgZHJtX3B1YmxpYyBpbnQg
ZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2lu
dHMsCiAgICAgcmV0dXJuIDA7CiB9CiAKK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpUcmFuc2Zl
cihpbnQgZmQsCisJCQkJICB1aW50MzJfdCBkc3RfaGFuZGxlLCB1aW50NjRfdCBkc3RfcG9pbnQs
CisJCQkJICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50NjRfdCBzcmNfcG9pbnQsCisJCQkJICB1
aW50MzJfdCBmbGFncykKK3sKKyAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfdHJhbnNmZXIgYXJnczsK
KyAgICBpbnQgcmV0OworCisgICAgbWVtY2xlYXIoYXJncyk7CisgICAgYXJncy5zcmNfaGFuZGxl
ID0gc3JjX2hhbmRsZTsKKyAgICBhcmdzLmRzdF9oYW5kbGUgPSBkc3RfaGFuZGxlOworICAgIGFy
Z3Muc3JjX3BvaW50ID0gc3JjX3BvaW50OworICAgIGFyZ3MuZHN0X3BvaW50ID0gZHN0X3BvaW50
OworICAgIGFyZ3MuZmxhZ3MgPSBmbGFnczsKKworICAgIHJldCA9IGRybUlvY3RsKGZkLCBEUk1f
SU9DVExfU1lOQ09CSl9UUkFOU0ZFUiwgJmFyZ3MpOwogCisgICAgcmV0dXJuIHJldDsKK30KZGlm
ZiAtLWdpdCBhL3hmODZkcm0uaCBiL3hmODZkcm0uaAppbmRleCA2MGM3YTg0Zi4uM2ZiMWQxY2Eg
MTAwNjQ0Ci0tLSBhL3hmODZkcm0uaAorKysgYi94Zjg2ZHJtLmgKQEAgLTg3NiwxMiArODc2LDE4
IEBAIGV4dGVybiBpbnQgZHJtU3luY29ialdhaXQoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywg
dW5zaWduZWQgbnVtX2hhbmRsZXMsCiAJCQkgIHVpbnQzMl90ICpmaXJzdF9zaWduYWxlZCk7CiBl
eHRlcm4gaW50IGRybVN5bmNvYmpSZXNldChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVz
LCB1aW50MzJfdCBoYW5kbGVfY291bnQpOwogZXh0ZXJuIGludCBkcm1TeW5jb2JqU2lnbmFsKGlu
dCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Citl
eHRlcm4gaW50IGRybVN5bmNvYmpUaW1lbGluZVNpZ25hbChpbnQgZmQsIGNvbnN0IHVpbnQzMl90
ICpoYW5kbGVzLAorCQkJCSAgICB1aW50NjRfdCAqcG9pbnRzLCB1aW50MzJfdCBoYW5kbGVfY291
bnQpOwogZXh0ZXJuIGludCBkcm1TeW5jb2JqVGltZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3Qg
KmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAJCQkJICB1bnNpZ25lZCBudW1faGFuZGxlcywK
IAkJCQkgIGludDY0X3QgdGltZW91dF9uc2VjLCB1bnNpZ25lZCBmbGFncywKIAkJCQkgIHVpbnQz
Ml90ICpmaXJzdF9zaWduYWxlZCk7CiBleHRlcm4gaW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQs
IHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAogCQkJICAgdWludDMyX3QgaGFu
ZGxlX2NvdW50KTsKK2V4dGVybiBpbnQgZHJtU3luY29ialRyYW5zZmVyKGludCBmZCwKKwkJCSAg
ICAgIHVpbnQzMl90IGRzdF9oYW5kbGUsIHVpbnQ2NF90IGRzdF9wb2ludCwKKwkJCSAgICAgIHVp
bnQzMl90IHNyY19oYW5kbGUsIHVpbnQ2NF90IHNyY19wb2ludCwKKwkJCSAgICAgIHVpbnQzMl90
IGZsYWdzKTsKIAogI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCiB9Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
