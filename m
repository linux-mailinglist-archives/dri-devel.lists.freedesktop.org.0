Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7A2CF36
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 21:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115946E28E;
	Tue, 28 May 2019 19:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F426E26C;
 Tue, 28 May 2019 19:09:21 +0000 (UTC)
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by BN7PR12MB2659.namprd12.prod.outlook.com (2603:10b6:408:29::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.17; Tue, 28 May
 2019 19:09:19 +0000
Received: from CO1NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.17 via Frontend
 Transport; Tue, 28 May 2019 19:09:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT050.mail.protection.outlook.com (10.152.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 19:09:18 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 28 May 2019
 14:09:15 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Only force modesets when toggling HDR
Date: Tue, 28 May 2019 15:08:36 -0400
Message-ID: <20190528190836.10738-3-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528190836.10738-1-nicholas.kazlauskas@amd.com>
References: <20190528190836.10738-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(68736007)(72206003)(54906003)(316002)(16586007)(110136005)(36756003)(50226002)(70586007)(14444005)(48376002)(86362001)(44832011)(2616005)(476003)(126002)(77096007)(50466002)(186003)(446003)(11346002)(26005)(486006)(336012)(426003)(1076003)(450100002)(4326008)(53416004)(5660300002)(81166006)(51416003)(7696005)(81156014)(2906002)(8676002)(478600001)(76176011)(70206006)(8936002)(6666004)(356004)(47776003)(53936002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2659; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b026f8d4-abff-4dae-a4f1-08d6e39ffbf8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2659; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2659:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2659F31150B158ADE40CF645EC1E0@BN7PR12MB2659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: X5s3v2vzuQWIJJWwM1Cvt2MlIHIj7D0iftXOii14nq5HmVCFLArBrecYABVTbXUP3s2vbYHq0HqXOANtlEYtPwQXBMODt9OWTn4gnAbztQdDExJRlYlcjeNgsXYB0jn3LsZQS+bPE9LAqiHqsb0AefbdqCsE2z3atyeTEyVXf1KqxA31eUC2YHiOi/FbtO/ozZ369briS2PejF1EUeA30NoTNMCAu1HiB4YyIGbjg29ACyjPDKqkQGsNFaExmLzYO1M/oIW8k7B66aeIjv+s98LU0OiQ/e4uZcLloEce/PCr/rKbMMPjL8vGMIVCABuDy2+kLujpCpoLkDtzv2szKpBMo4edf3nWVRBm6COnkw1GScJ4td9Nsa4m4ixw4o6Vr+z9uQccpj01bk67KX4JrGYoPhMK2PLsXKwf83nzq1M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 19:09:18.4374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b026f8d4-abff-4dae-a4f1-08d6e39ffbf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHeAArAqzdkRMPHRrW6qYlRt3Pf+BFwiCD4xAVyKIqs=;
 b=qkYhZkwrHfe7WxGeKc3POF/N5SrBPYDVq+aAvdaqopep5wSZ1TzhUzDQCmX6K4znm7lZVun7a/8+1m8wgS7kQY2d+F0015twlUyxekFbQaZ22JGwwWezgIlTedk9K72yWF+6wp5q2RIIKGTznuZUqcKahLCwupme1jmprj9b/tM=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KV2UgY2FuIGlzc3VlIEhEUiBzdGF0aWMgbWV0YWRhdGEgYXMgcGFydCBvZiBzdHJlYW0g
dXBkYXRlcyBmb3IKbm9uLW1vZGVzZXRzIGFzIGxvbmcgYXMgd2UgZm9yY2UgYSBtb2Rlc2V0IHdo
ZW4gZW50ZXJpbmcgb3IgZXhpdGluZyBIRFIuCgpUaGlzIGF2b2lkcyB1bm5lY2Vzc2FyeSBibGFu
a2luZyBmb3Igc2ltcGxlIG1ldGFkYXRhIHVwZGF0ZXMuCgpbSG93XQpXaGVuIGNoYW5naW5nIHNj
YWxpbmcgYW5kIGFibSBmb3IgdGhlIHN0cmVhbSBhbHNvIGNoZWNrIGlmIEhEUiBoYXMKY2hhbmdl
ZCBhbmQgc2VuZCB0aGUgc3RyZWFtIHVwZGF0ZS4gVGhpcyB3aWxsIG9ubHkgaGFwcGVuIGluIG5v
bi1tb2Rlc2V0CmNhc2VzLgoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIHwgMzQgKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZWIzMWFjY2E3ZWQ2Li40NDNiMTNlYzI2
OGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtMzk3OCw5ICszOTc4LDE2IEBAIGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uLAogCQkgKiBEQyBjb25zaWRlcnMgdGhl
IHN0cmVhbSBiYWNrZW5kcyBjaGFuZ2VkIGlmIHRoZQogCQkgKiBzdGF0aWMgbWV0YWRhdGEgY2hh
bmdlcy4gRm9yY2luZyB0aGUgbW9kZXNldCBhbHNvCiAJCSAqIGdpdmVzIGEgc2ltcGxlIHdheSBm
b3IgdXNlcnNwYWNlIHRvIHN3aXRjaCBmcm9tCi0JCSAqIDhicGMgdG8gMTBicGMgd2hlbiBzZXR0
aW5nIHRoZSBtZXRhZGF0YS4KKwkJICogOGJwYyB0byAxMGJwYyB3aGVuIHNldHRpbmcgdGhlIG1l
dGFkYXRhIHRvIGVudGVyCisJCSAqIG9yIGV4aXQgSERSLgorCQkgKgorCQkgKiBDaGFuZ2luZyB0
aGUgc3RhdGljIG1ldGFkYXRhIGFmdGVyIGl0J3MgYmVlbgorCQkgKiBzZXQgaXMgcGVybWlzc2li
bGUsIGhvd2V2ZXIuIFNvIG9ubHkgZm9yY2UgYQorCQkgKiBtb2Rlc2V0IGlmIHdlJ3JlIGVudGVy
aW5nIG9yIGV4aXRpbmcgSERSLgogCQkgKi8KLQkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hhbmdl
ZCA9IHRydWU7CisJCW5ld19jcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQgPQorCQkJIW9sZF9jb25f
c3RhdGUtPmhkcl9vdXRwdXRfbWV0YWRhdGEgfHwKKwkJCSFuZXdfY29uX3N0YXRlLT5oZHJfb3V0
cHV0X21ldGFkYXRhOwogCX0KIAogCXJldHVybiAwOwpAQCAtNTg4MSw3ICs1ODg4LDkgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpCiAJCXN0cnVjdCBhbWRncHVfY3J0YyAqYWNydGMgPSB0b19hbWRncHVfY3J0
YyhkbV9uZXdfY29uX3N0YXRlLT5iYXNlLmNydGMpOwogCQlzdHJ1Y3QgZGNfc3VyZmFjZV91cGRh
dGUgZHVtbXlfdXBkYXRlc1tNQVhfU1VSRkFDRVNdOwogCQlzdHJ1Y3QgZGNfc3RyZWFtX3VwZGF0
ZSBzdHJlYW1fdXBkYXRlOworCQlzdHJ1Y3QgZGNfaW5mb19wYWNrZXQgaGRyX3BhY2tldDsKIAkJ
c3RydWN0IGRjX3N0cmVhbV9zdGF0dXMgKnN0YXR1cyA9IE5VTEw7CisJCWJvb2wgYWJtX2NoYW5n
ZWQsIGhkcl9jaGFuZ2VkLCBzY2FsaW5nX2NoYW5nZWQ7CiAKIAkJbWVtc2V0KCZkdW1teV91cGRh
dGVzLCAwLCBzaXplb2YoZHVtbXlfdXBkYXRlcykpOwogCQltZW1zZXQoJnN0cmVhbV91cGRhdGUs
IDAsIHNpemVvZihzdHJlYW1fdXBkYXRlKSk7CkBAIC01ODk4LDExICs1OTA3LDE5IEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKQogCQlkbV9uZXdfY3J0Y19zdGF0ZSA9IHRvX2RtX2NydGNfc3RhdGUobmV3X2Ny
dGNfc3RhdGUpOwogCQlkbV9vbGRfY3J0Y19zdGF0ZSA9IHRvX2RtX2NydGNfc3RhdGUob2xkX2Ny
dGNfc3RhdGUpOwogCi0JCWlmICghaXNfc2NhbGluZ19zdGF0ZV9kaWZmZXJlbnQoZG1fbmV3X2Nv
bl9zdGF0ZSwgZG1fb2xkX2Nvbl9zdGF0ZSkgJiYKLQkJCQkoZG1fbmV3X2NydGNfc3RhdGUtPmFi
bV9sZXZlbCA9PSBkbV9vbGRfY3J0Y19zdGF0ZS0+YWJtX2xldmVsKSkKKwkJc2NhbGluZ19jaGFu
Z2VkID0gaXNfc2NhbGluZ19zdGF0ZV9kaWZmZXJlbnQoZG1fbmV3X2Nvbl9zdGF0ZSwKKwkJCQkJ
CQkgICAgIGRtX29sZF9jb25fc3RhdGUpOworCisJCWFibV9jaGFuZ2VkID0gZG1fbmV3X2NydGNf
c3RhdGUtPmFibV9sZXZlbCAhPQorCQkJICAgICAgZG1fb2xkX2NydGNfc3RhdGUtPmFibV9sZXZl
bDsKKworCQloZHJfY2hhbmdlZCA9CisJCQlpc19oZHJfbWV0YWRhdGFfZGlmZmVyZW50KG9sZF9j
b25fc3RhdGUsIG5ld19jb25fc3RhdGUpOworCisJCWlmICghc2NhbGluZ19jaGFuZ2VkICYmICFh
Ym1fY2hhbmdlZCAmJiAhaGRyX2NoYW5nZWQpCiAJCQljb250aW51ZTsKIAotCQlpZiAoaXNfc2Nh
bGluZ19zdGF0ZV9kaWZmZXJlbnQoZG1fbmV3X2Nvbl9zdGF0ZSwgZG1fb2xkX2Nvbl9zdGF0ZSkp
IHsKKwkJaWYgKHNjYWxpbmdfY2hhbmdlZCkgewogCQkJdXBkYXRlX3N0cmVhbV9zY2FsaW5nX3Nl
dHRpbmdzKCZkbV9uZXdfY29uX3N0YXRlLT5iYXNlLmNydGMtPm1vZGUsCiAJCQkJCWRtX25ld19j
b25fc3RhdGUsIChzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICopZG1fbmV3X2NydGNfc3RhdGUtPnN0
cmVhbSk7CiAKQEAgLTU5MTAsMTIgKzU5MjcsMTcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2F0
b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiAJCQlzdHJl
YW1fdXBkYXRlLmRzdCA9IGRtX25ld19jcnRjX3N0YXRlLT5zdHJlYW0tPmRzdDsKIAkJfQogCi0J
CWlmIChkbV9uZXdfY3J0Y19zdGF0ZS0+YWJtX2xldmVsICE9IGRtX29sZF9jcnRjX3N0YXRlLT5h
Ym1fbGV2ZWwpIHsKKwkJaWYgKGFibV9jaGFuZ2VkKSB7CiAJCQlkbV9uZXdfY3J0Y19zdGF0ZS0+
c3RyZWFtLT5hYm1fbGV2ZWwgPSBkbV9uZXdfY3J0Y19zdGF0ZS0+YWJtX2xldmVsOwogCiAJCQlz
dHJlYW1fdXBkYXRlLmFibV9sZXZlbCA9ICZkbV9uZXdfY3J0Y19zdGF0ZS0+YWJtX2xldmVsOwog
CQl9CiAKKwkJaWYgKGhkcl9jaGFuZ2VkKSB7CisJCQlmaWxsX2hkcl9pbmZvX3BhY2tldChuZXdf
Y29uX3N0YXRlLCAmaGRyX3BhY2tldCk7CisJCQlzdHJlYW1fdXBkYXRlLmhkcl9zdGF0aWNfbWV0
YWRhdGEgPSAmaGRyX3BhY2tldDsKKwkJfQorCiAJCXN0YXR1cyA9IGRjX3N0cmVhbV9nZXRfc3Rh
dHVzKGRtX25ld19jcnRjX3N0YXRlLT5zdHJlYW0pOwogCQlXQVJOX09OKCFzdGF0dXMpOwogCQlX
QVJOX09OKCFzdGF0dXMtPnBsYW5lX2NvdW50KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
