Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC50162DF
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3F36E7A8;
	Tue,  7 May 2019 11:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730040.outbound.protection.outlook.com [40.107.73.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF296E7A8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:34:13 +0000 (UTC)
Received: from DM5PR12CA0013.namprd12.prod.outlook.com (2603:10b6:4:1::23) by
 BN6PR12MB1218.namprd12.prod.outlook.com (2603:10b6:404:1b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Tue, 7 May 2019 11:34:11 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM5PR12CA0013.outlook.office365.com
 (2603:10b6:4:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Tue, 7 May 2019 11:34:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 11:34:10 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 06:34:09 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 3/7] wrap syncobj timeline query/wait APIs for amdgpu v3
Date: Tue, 7 May 2019 19:33:55 +0800
Message-ID: <20190507113359.16387-3-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507113359.16387-1-david1.zhou@amd.com>
References: <20190507113359.16387-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(186003)(1076003)(486006)(2906002)(11346002)(72206003)(336012)(77096007)(48376002)(356004)(6666004)(70586007)(476003)(2616005)(126002)(70206006)(446003)(5660300002)(36756003)(47776003)(53936002)(86362001)(50466002)(14444005)(4326008)(7696005)(8936002)(426003)(305945005)(2351001)(54906003)(478600001)(68736007)(53416004)(8676002)(316002)(76176011)(6916009)(81166006)(51416003)(50226002)(16586007)(26005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1218; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c52033a-e9db-4ba5-3d3b-08d6d2dfec74
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1218; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1218:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1218A6015349E1A371AD8A7FB4310@BN6PR12MB1218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +7u3JySo4z5Gynl95izpr6rQ/gL0BkmXJFyDVrUxjVW0WOiqOHs9DmLH6gwRVdYOTjkB958+MfoCHs0TgqwpC3jC9vT3G24eRuSneZNCDFdaztlcyVw7T3msPg9ZUtLrJFCcBjBPWiF8fiCAytXsLOsHFrTnEHM3HKzhSiaYtngS1Scw7mreRSIZ+1tAc+H9GHkUgsHVoKwUWkWO9QxX5IblK5QhRgRDD3sNcR1vUa5wHggbvpB3LlxYjFIUMwdMqfWBgCRSUZyuWyAql9XYdOY/2Oo95AQ95Wyax8h4IXbf2Fg0OkuwGSJBL7CVyHF1NM26f0LNyQ0mE2C9OvD9UhePj/jizGKrT4I5vEyRFRAcTSdS23vopsdi4Ig1F5bhy2EpXXHSQpDPEzW3o/Vns6SNYfLV2RhwcC0nD5Tda0M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 11:34:10.4123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c52033a-e9db-4ba5-3d3b-08d6d2dfec74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0kPErcuxGeVeWMU2qOrsDSbuA0o7xrgffnQt3zPdiY=;
 b=GKdarCJe5A2AG3dJygtLGlDf8hpuIqWSHXa1txPz9cG/Mms7VQSol7DDdH5n/jbiTA63hCgHX7KmnFCEnUfUkWw3RyBenGmsJ7iRUTaxFTabjC78BP8+5DoqtztyqzFsLBVIGtWIlrMbDPpElmwyJam7I0++E5/oZ30oUjia6Dg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IHN5bWJvcyBhcmUgc3RvcmVkIGluIGxleGljYWwgb3JkZXIuCnYzOiBkcm9wIGV4cG9ydC9p
bXBvcnQgYW5kIGV4dHJhIHF1ZXJ5IGluZGlyZWN0aW9uCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWlu
ZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgotLS0KIGFtZGdwdS9hbWRncHUtc3ltYm9sLWNo
ZWNrIHwgIDIgKysKIGFtZGdwdS9hbWRncHUuaCAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sgYi9hbWRncHUvYW1k
Z3B1LXN5bWJvbC1jaGVjawppbmRleCA0ZDgwNjkyMi4uZDNjNWJiODkgMTAwNzU1Ci0tLSBhL2Ft
ZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCisrKyBiL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNr
CkBAIC01Myw4ICs1MywxMCBAQCBhbWRncHVfY3Nfc3VibWl0X3JhdwogYW1kZ3B1X2NzX3N1Ym1p
dF9yYXcyCiBhbWRncHVfY3Nfc3luY29ial9leHBvcnRfc3luY19maWxlCiBhbWRncHVfY3Nfc3lu
Y29ial9pbXBvcnRfc3luY19maWxlCithbWRncHVfY3Nfc3luY29ial9xdWVyeQogYW1kZ3B1X2Nz
X3N5bmNvYmpfcmVzZXQKIGFtZGdwdV9jc19zeW5jb2JqX3NpZ25hbAorYW1kZ3B1X2NzX3N5bmNv
YmpfdGltZWxpbmVfd2FpdAogYW1kZ3B1X2NzX3N5bmNvYmpfd2FpdAogYW1kZ3B1X2NzX3dhaXRf
ZmVuY2VzCiBhbWRncHVfY3Nfd2FpdF9zZW1hcGhvcmUKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRn
cHUuaCBiL2FtZGdwdS9hbWRncHUuaAppbmRleCBjNDRhNDk1YS4uNWViZmUxZTMgMTAwNjQ0Ci0t
LSBhL2FtZGdwdS9hbWRncHUuaAorKysgYi9hbWRncHUvYW1kZ3B1LmgKQEAgLTE1MzYsNiArMTUz
Niw0NSBAQCBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfd2FpdChhbWRncHVfZGV2aWNlX2hhbmRsZSBk
ZXYsCiAJCQkgICBpbnQ2NF90IHRpbWVvdXRfbnNlYywgdW5zaWduZWQgZmxhZ3MsCiAJCQkgICB1
aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwogCisvKioKKyAqICBXYWl0IGZvciBvbmUgb3IgYWxs
IHN5bmMgb2JqZWN0cyBvbiB0aGVpciBwb2ludHMgdG8gc2lnbmFsLgorICoKKyAqIFxwYXJhbSAg
IGRldgkgICAgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIGhhbmRsZXMg
LSBcYyBbaW5dIGFycmF5IG9mIHN5bmMgb2JqZWN0IGhhbmRsZXMKKyAqIFxwYXJhbSAgIHBvaW50
cyAtIFxjIFtpbl0gYXJyYXkgb2Ygc3luYyBwb2ludHMgdG8gd2FpdAorICogXHBhcmFtICAgbnVt
X2hhbmRsZXMgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIHRpbWVvdXRf
bnNlYyAtIFxjIFtpbl0gc2VsZi1leHBsYW5hdG9yeQorICogXHBhcmFtICAgZmxhZ3MgICAtIFxj
IFtpbl0gYSBiaXRtYXNrIG9mIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfKgorICogXHBhcmFtICAg
Zmlyc3Rfc2lnbmFsZWQgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqCisgKiBccmV0dXJu
ICAgMCBvbiBzdWNjZXNzXG4KKyAqICAgICAgICAgIC1FVElNRSAtIFRpbWVvdXQKKyAqICAgICAg
ICAgIDwwIC0gTmVnYXRpdmUgUE9TSVggRXJyb3IgY29kZQorICoKKyAqLworaW50IGFtZGdwdV9j
c19zeW5jb2JqX3RpbWVsaW5lX3dhaXQoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAorCQkJCSAg
ICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQkgICAgdW5zaWduZWQg
bnVtX2hhbmRsZXMsCisJCQkJICAgIGludDY0X3QgdGltZW91dF9uc2VjLCB1bnNpZ25lZCBmbGFn
cywKKwkJCQkgICAgdWludDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKKy8qKgorICogIFF1ZXJ5IHN5
bmMgb2JqZWN0cyBwYXlsb2Fkcy4KKyAqCisgKiBccGFyYW0gICBkZXYJICAgIC0gXGMgW2luXSBz
ZWxmLWV4cGxhbmF0b3J5CisgKiBccGFyYW0gICBoYW5kbGVzIC0gXGMgW2luXSBhcnJheSBvZiBz
eW5jIG9iamVjdCBoYW5kbGVzCisgKiBccGFyYW0gICBwb2ludHMgLSBcYyBbb3V0XSBhcnJheSBv
ZiBzeW5jIHBvaW50cyByZXR1cm5lZCwgd2hpY2ggcHJlc2VudHMKKyAqIHN5bmNvYmogcGF5bG9h
ZC4KKyAqIFxwYXJhbSAgIG51bV9oYW5kbGVzIC0gXGMgW2luXSBzZWxmLWV4cGxhbmF0b3J5Cisg
KgorICogXHJldHVybiAgIDAgb24gc3VjY2Vzc1xuCisgKiAgICAgICAgICAtRVRJTUUgLSBUaW1l
b3V0CisgKiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNvZGUKKyAqCisgKi8K
K2ludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCisJ
CQkgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkgICAgdW5zaWdu
ZWQgbnVtX2hhbmRsZXMpOworCiAvKioKICAqICBFeHBvcnQga2VybmVsIHN5bmMgb2JqZWN0IHRv
IHNoYXJlYWJsZSBmZC4KICAqCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2NzLmMgYi9hbWRn
cHUvYW1kZ3B1X2NzLmMKaW5kZXggN2M1YjlkMTMuLjlmY2FmMmM0IDEwMDY0NAotLS0gYS9hbWRn
cHUvYW1kZ3B1X2NzLmMKKysrIGIvYW1kZ3B1L2FtZGdwdV9jcy5jCkBAIC02ODYsNiArNjg2LDI5
IEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9jc19zeW5jb2JqX3dhaXQoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2LAogCQkJICAgICAgZmxhZ3MsIGZpcnN0X3NpZ25hbGVkKTsKIH0KIAorZHJtX3B1
YmxpYyBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfdGltZWxpbmVfd2FpdChhbWRncHVfZGV2aWNlX2hh
bmRsZSBkZXYsCisJCQkJCSAgICAgICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50
cywKKwkJCQkJICAgICAgIHVuc2lnbmVkIG51bV9oYW5kbGVzLAorCQkJCQkgICAgICAgaW50NjRf
dCB0aW1lb3V0X25zZWMsIHVuc2lnbmVkIGZsYWdzLAorCQkJCQkgICAgICAgdWludDMyX3QgKmZp
cnN0X3NpZ25hbGVkKQoreworCWlmIChOVUxMID09IGRldikKKwkJcmV0dXJuIC1FSU5WQUw7CisK
KwlyZXR1cm4gZHJtU3luY29ialRpbWVsaW5lV2FpdChkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMs
IG51bV9oYW5kbGVzLAorCQkJCSAgICAgIHRpbWVvdXRfbnNlYywgZmxhZ3MsIGZpcnN0X3NpZ25h
bGVkKTsKK30KKworZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfcXVlcnkoYW1kZ3B1
X2RldmljZV9oYW5kbGUgZGV2LAorCQkJCSAgICAgICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0
X3QgKnBvaW50cywKKwkJCQkgICAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpCit7CisJaWYgKE5V
TEwgPT0gZGV2KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiBkcm1TeW5jb2JqUXVlcnko
ZGV2LT5mZCwgaGFuZGxlcywgcG9pbnRzLCBudW1faGFuZGxlcyk7Cit9CisKIGRybV9wdWJsaWMg
aW50IGFtZGdwdV9jc19leHBvcnRfc3luY29iaihhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJ
CQkJCXVpbnQzMl90IGhhbmRsZSwKIAkJCQkJaW50ICpzaGFyZWRfZmQpCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
