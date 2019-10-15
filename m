Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AED7C53
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9495A6E873;
	Tue, 15 Oct 2019 16:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12F6E384;
 Tue, 15 Oct 2019 16:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDFWa+MoS55D2Mdd73KNByErOxr+d+QT7SpJIaadBHmP9LGewQwCTl/FrWfliFHF4QIpMvziYeMyyH4TIFO+pozXFfygQlCe7yfFkTD4pR7nUUZLb4YjMi1BHeDR1mGDhNxlFS5uKQYPeMJlUmU+bgNaIodyetP1090glXEueXehMc3iX939hvUvKB471vhHxro7sKA0kwabgHsyNehjK2KBAjEuWCPSiWWWydZajTOLw5pUwB27S+90FGRVWb3SnZe4ZZtgsJtkqTRcySgGrnHf5O5TOK81I5yDBZEJyy64kHZKpbiraizsDm2EL4oxfr0ust/cBtbjiXz+fbwUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgUIIdWeRCKSA7Ro7s+bA1g9RACeID09vCP7CWvElEk=;
 b=jckq6hynMe8LlPAvFOKkaie2gSKbe8l9g8k/HYiPZa7qUjbQzBA8DSYOWwe498XJux6XLaTbT570weN9KEou1A/odmzMPH/mCtJTlfTCUQcSe2AfLWhETzsBRmIGQO2yoKHP5TzOVkAV1QcsJkHfCCm/qWNgCgqVxSRinEBsMg12ZT3hil6Oyg/hdkjzYIIHRlVFSSQzb9dvMaSo0CZvoc1K70dLfWZZ0xDYuFqfyrw1ZvyDVyftv2XEH+oHAgj4HKfHPio4fF5Lhir6pCya8XgbTEk5WaoO4fFGImnGwd+WM+EEBZF6wQg1n1IpjermtYCV8FbA9MTxu/4v18LCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0109.namprd12.prod.outlook.com (2603:10b6:802:21::44)
 by MWHPR12MB1359.namprd12.prod.outlook.com (2603:10b6:300:11::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 16:51:21 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0109.outlook.office365.com
 (2603:10b6:802:21::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Tue, 15 Oct 2019 16:51:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Tue, 15 Oct 2019 16:51:20 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 11:51:20 -0500
Received: from hersenwu-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 15 Oct 2019 11:51:19 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: fix build error casused by
 CONFIG_DRM_AMD_DC_DCN2_1
Date: Tue, 15 Oct 2019 12:51:17 -0400
Message-ID: <20191015165117.31195-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(428003)(189003)(199004)(51416003)(54906003)(26005)(450100002)(186003)(356004)(8936002)(7696005)(53416004)(2906002)(4744005)(305945005)(50226002)(1076003)(36756003)(4326008)(81156014)(8676002)(478600001)(16586007)(50466002)(86362001)(426003)(336012)(110136005)(2616005)(70586007)(316002)(70206006)(5660300002)(126002)(476003)(486006)(81166006)(48376002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1359; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1735f50-bb0f-4373-6e3d-08d7518fe7fd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1359:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1359FE4EAE951FEBCBB92390FD930@MWHPR12MB1359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJUrzfYA6vs9Qs1dCZmnUv+Lt6gJcH8aZ8iObKa7+50TB2/hsDRub6MHgfuAuXrUqBJcaRfZkn5erwzAsUY+MKOMMWZPLFP5HV+AhHAu3WGv+S9kxxtUFk+0+bRuRsaPXW5XiY+of2TdFV7B7TrglagIHzAvVKsKTFPjnORIMpa9aSy7yEjEfB3C/3ZAGxN35makRGv69K18sk6NkrE4I0zUVSTiFWWcejBBYg0iKJfipnHghQ1KHLlXkZi6iykzxmSxBqkhG87Iie3w05/pPtPEWhfRRxs4QoM85tPqFmk0c5WXx2iHW/1BNT5sWybBMmsOAU3qe5wXGwM7o664Ivcvc2uL1xCeEyRa3lWVEr/TWSIxOxSg3quogmlutKAwj8oJawBdHHuvOka4sFNxLtsKF2WuZ1nLgaSx8r2ZCcY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 16:51:20.9192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1735f50-bb0f-4373-6e3d-08d7518fe7fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgUIIdWeRCKSA7Ro7s+bA1g9RACeID09vCP7CWvElEk=;
 b=ZR4RHw2T0ugiEndnGWok/TbHF2F8NnuTvW239s2JH9O5Q2ExNjC0VbNesdoG5sDIpJC/ARhqW5M2TIMWF7BmrF9LaLt8qz5vb62PABpOpJCfzAfB6Zmx7oToidQYW9SqH3y3YvA2d4iB/Osg/9NpAukqJW2ZCUTWd2iCdw24Bkg=
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 Hersen Wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d2hlbiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEgaXMgbm90IGVuYWJsZSBpbiAuY29uZmlnLAp0
aGVyZSBpcyBidWlsZCBlcnJvci4gc3RydWN0IGRwbV9jbG9ja3Mgc2hvdWQgbm90IGJlCmd1YXJk
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBIZXJzZW4gV3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIHwgMyAtLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbV9wcF9zbXUuaAppbmRleCAyNGQ2NWRiYmQ3NDkuLmVmN2RmOWVmNmQ3ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaApAQCAtMjQ5LDggKzI0OSw2IEBA
IHN0cnVjdCBwcF9zbXVfZnVuY3NfbnYgewogfTsKICNlbmRpZgogCi0jaWYgZGVmaW5lZChDT05G
SUdfRFJNX0FNRF9EQ19EQ04yXzEpCi0KICNkZWZpbmUgUFBfU01VX05VTV9TT0NDTEtfRFBNX0xF
VkVMUyAgOAogI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19EUE1fTEVWRUxTICA4CiAjZGVmaW5l
IFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDQKQEAgLTI4OCw3ICsyODYsNiBAQCBzdHJ1
Y3QgcHBfc211X2Z1bmNzX3JuIHsKIAllbnVtIHBwX3NtdV9zdGF0dXMgKCpnZXRfZHBtX2Nsb2Nr
X3RhYmxlKSAoc3RydWN0IHBwX3NtdSAqcHAsCiAJCQlzdHJ1Y3QgZHBtX2Nsb2NrcyAqY2xvY2tf
dGFibGUpOwogfTsKLSNlbmRpZgogCiBzdHJ1Y3QgcHBfc211X2Z1bmNzIHsKIAlzdHJ1Y3QgcHBf
c211IGN0eDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
