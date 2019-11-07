Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0CF332E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0515E6F700;
	Thu,  7 Nov 2019 15:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730052.outbound.protection.outlook.com [40.107.73.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE26F700;
 Thu,  7 Nov 2019 15:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBIrcSS7uZqVzueJPHTCy+zj+Dxcq0lycas5e94pZky3wiEuPR+LYgLlhOxFG+0hFPOZ126CJZlnLYVg1pQhenpWPt68ksgtPpD9fZwFFdKu5RWvSplc/exqASCzsS5Ea8kffbOaSz0n7pAQvygdevEPVeG1T3VyrRFSTOgzPC6/21MzmGGmrwh9MlJqt8c0yhl51KI21BmjZBtSP4+xw0oGRFKTxyKYNiXpRwoBgwaGo9nXYNabgEXFU4G6vxFJr0g/2TtE6f7a2ohhtuaqcQJ4a6hWZj4Tgnbp2f63LwCJ5KIkWZ0sQ1t/P4wWMDCcSfIFArjIQjhgDPwqmLmNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0B6nFMOiji2jnP9EAD+OCkvPyxlN4xxaKh5F+SPKeM=;
 b=UgmQKVZ1Qsc5IlvUUv9mLHmARaK3vZUJnyJARE6eRdxt1y6wh6OsmMb2kjwJFefAcX1L/y6EFhg6CH1njon1DUD7Rl7hJp+KUU3Aicx4tt8X2D3qwYWUMuczN9hPj6K8FHTxDICjMN5qWa+RTBc69IZP5iFOPwRqOgmRGKv/FELr9J3pacUquMkA3h+aLl+WbWQKeZUYjQqpZRPtvBzBBj6N3lNf0gR9NR112xF10U4h0byIZX6DxC88dug2rnr9zii5zflq7hkhDn0fg13UJSm6X6YV5E0HGf/TYRfXNw31CwwmrnvaDKvqzXDFl99P7/4Ug4SS4NarR8CwMR62Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:18a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 15:32:28 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:25 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:24 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 08/13] drm/amd/display: Validate DSC caps on MST endpoints
Date: Thu, 7 Nov 2019 10:32:07 -0500
Message-ID: <20191107153212.1145-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(189003)(199004)(476003)(486006)(2616005)(11346002)(81166006)(7696005)(14444005)(48376002)(81156014)(336012)(426003)(446003)(50466002)(186003)(6916009)(126002)(450100002)(51416003)(50226002)(26005)(2906002)(76176011)(478600001)(2876002)(8676002)(4326008)(2351001)(36756003)(5660300002)(86362001)(305945005)(1076003)(8936002)(15650500001)(53416004)(70586007)(316002)(16586007)(6666004)(54906003)(70206006)(47776003)(356004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3514; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80dc29eb-1ffe-4d63-8ff9-08d76397b254
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3514D12D85FE389FFC5C868EE4780@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eaRIZGTZws3FJ3wcyrMjWlA53tj9d5pjxvZ91ZEeIma53h+hjO/SVh/795tPndNrNDG56e9q688zChP1NDtf21wEzXXt5NfzllglWmSbW5WTXcpaejpovLtnPmqdLG/occ5oMlau12FLXzzdK5dcf8BaVTzZGZE/HMtwYWvdcCFrkYYMKrpiUbngXbTIH7hP+QV9txsq21lP9wemXB6U4fJGhlru4VgAamyuRNv2cspGEr3atBeO/dy6LXFtRYzuIPTNQkluUCdvfL+y4kqIBN34jdtj8vwoF1qzu90/gnbPCyjstvwojgBvEWZm5/Gn4Z/oPh9uvPIzHIgQ3Ft3vIoTMujlYngxY1AxhEUksWtjP/vX6sV3ZLfF9PIGNkp+epfLp+T8HF8lik7fgngT62F3+EQtiU+MpzOymRKRIGLjssLGnsNjJ/DH31kPiQbT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:27.8391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dc29eb-1ffe-4d63-8ff9-08d76397b254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0B6nFMOiji2jnP9EAD+OCkvPyxlN4xxaKh5F+SPKeM=;
 b=C5YWIt/nnl64CQM5R2g5Pyj+0Hf7tEJOrP8BZBg4fb/hJbsXNbRPDufRTJIgyMwgZRMpoL5rboDQmuSiFxBZwT7akSBA4T4w0NpoYccckTJM7WSqUdB+ViRPtC0gW+JHakCzoHKrF+sdDflPGFXbrqCM1zlW/w+zHORY08SSWYk=
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
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXggZjZlMThkOGE5OTM2Li5jN2YxZTJmMDBm
YWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaApAQCAtMzIzLDYgKzMyMyw5IEBAIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yIHsK
IAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICptc3RfcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKm1zdF9lbmNvZGVyOworI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJc3RydWN0IGRybV9kcF9hdXggKmRz
Y19hdXg7CisjZW5kaWYKIAogCS8qIFRPRE8gc2VlIGlmIHdlIGNhbiBtZXJnZSB3aXRoIGRkY19i
dXMgb3IgbWFrZSBhIGRtX2Nvbm5lY3RvciAqLwogCXN0cnVjdCBhbWRncHVfaTJjX2FkYXB0ZXIg
KmkyYzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggMWExN2VhMWI0MmUwLi44MDRhMDAwODJi
ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0yNSw2ICsyNSw3IEBACiAKICNpbmNsdWRl
IDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSAiZG1fc2VydmljZXMu
aCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKQEAgLTE4OCw2
ICsxODksMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2Rw
X21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1f
bXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAorI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCitzdGF0aWMgYm9vbCB2YWxpZGF0ZV9kc2NfY2Fwc19vbl9jb25u
ZWN0b3Ioc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCit7CisJc3RydWN0
IGRjX3NpbmsgKmRjX3NpbmsgPSBhY29ubmVjdG9yLT5kY19zaW5rOworCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQgPSBhY29ubmVjdG9yLT5wb3J0OworCXU4IGRzY19jYXBzWzE2XSA9IHsg
MCB9OworCisJYWNvbm5lY3Rvci0+ZHNjX2F1eCA9IGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9y
dChwb3J0KTsKKworCWlmICghYWNvbm5lY3Rvci0+ZHNjX2F1eCkKKwkJcmV0dXJuIGZhbHNlOwor
CisJaWYgKGRybV9kcF9kcGNkX3JlYWQoYWNvbm5lY3Rvci0+ZHNjX2F1eCwgRFBfRFNDX1NVUFBP
UlQsIGRzY19jYXBzLCAxNikgPCAwKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoIWRjX2RzY19w
YXJzZV9kc2NfZHBjZChkc2NfY2FwcywgTlVMTCwgJmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNj
X2RlY19jYXBzKSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisjZW5kaWYK
Kwogc3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiB7CiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSB0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CkBAIC0yMzAsMTAgKzI1MywxNiBAQCBz
dGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKIAkJLyogZGNfbGlua19hZGRfcmVtb3RlX3NpbmsgcmV0dXJucyBhIG5ldyByZWZlcmVu
Y2UgKi8KIAkJYWNvbm5lY3Rvci0+ZGNfc2luayA9IGRjX3Npbms7CiAKLQkJaWYgKGFjb25uZWN0
b3ItPmRjX3NpbmspCisJCWlmIChhY29ubmVjdG9yLT5kY19zaW5rKSB7CiAJCQlhbWRncHVfZG1f
dXBkYXRlX2ZyZWVzeW5jX2NhcHMoCiAJCQkJCWNvbm5lY3RvciwgYWNvbm5lY3Rvci0+ZWRpZCk7
CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorCQkJaWYgKCF2YWxpZGF0
ZV9kc2NfY2Fwc19vbl9jb25uZWN0b3IoYWNvbm5lY3RvcikpCisJCQkJbWVtc2V0KCZhY29ubmVj
dG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLAorCQkJCSAgICAgICAwLCBzaXplb2YoYWNvbm5l
Y3Rvci0+ZGNfc2luay0+c2lua19kc2NfY2FwcykpOworI2VuZGlmCisJCX0KIAl9CiAKIAlkcm1f
Y29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
