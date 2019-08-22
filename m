Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697619959D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28CD6EB40;
	Thu, 22 Aug 2019 13:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A96EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It61KkfuBWzw6C7RKB6aE0in+rvKgRnY6JOtVNrkTX9N9U4ta2ZV3Q2C+KxKhbXkg2Nb4jQzgP7dKCghM2uVyLC/+DuS5JS0Apx5TkGFGEY3IDpnvkZantFRdKoYu2BSaSPITdIv3MLMloJ33ZfgJK325BRHtUg9k4WnWU2yWwbDxy4hmN29v0wUX5Sk2oTI3gxrbRKHpEfc6KfREBqLTc5aSZ1cVAeX/P975K4L8GEEWlldMACmD4RVuS3eVCmYsPZc8G18txQwCWKhf6wgnF2rUDuUAXqfsQN1rrozZpQa1wUek4fpyxc1iGzFYuLVW7KKeNGZ3vvYwkSyDglLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhnFxwuDTx5hpmT3OcJQP3Rt2TnQVf6HyR7XNSCJebg=;
 b=UQgFQI9v1CYTWFBP0V5eLvCmG5AuC6jJXpyAH3p5ziRcA3Ymyrln3p1gUzNL/7LDMokyWbKNnF4t7ayWRtHmyHet0XDcFRn+L3RET41frhsg88qYxj8m94yBKKdm7GebUMzQee+SSTxNE180X7Z5LiOKLicqMu2lhD/VJqPhtmoV2rs1liCUHxZZxo4HYBhh9DsEylU9/5dL97mShywP48146zFGWZ6FJ6oAg0Xour8D/9VFd1f40k5vWmHAzuxMDcZvvbA4VlbG9NHTart+9Dx8tzjHwonjrOZl8BCY29uWeEzCVa+qPpJlsKex0FB8oTTbgSmsjoLt0+eYI42ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0085.namprd12.prod.outlook.com (2603:10b6:0:57::29) by
 BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 13:57:48 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM3PR12CA0085.outlook.office365.com
 (2603:10b6:0:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 22 Aug 2019 13:57:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 13:57:47 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 22 Aug 2019 08:57:45 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/5] drm/dp-mst: Parse FEC capability on MST ports
Date: Thu, 22 Aug 2019 09:57:38 -0400
Message-ID: <20190822135741.12923-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(8936002)(305945005)(4326008)(81166006)(81156014)(336012)(53936002)(86362001)(2351001)(8676002)(50226002)(426003)(126002)(1076003)(486006)(476003)(47776003)(5660300002)(478600001)(186003)(50466002)(316002)(2616005)(26005)(48376002)(49486002)(11346002)(76176011)(36756003)(6916009)(2906002)(6666004)(16586007)(356004)(70206006)(446003)(51416003)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec2342e-612a-4790-0519-08d72708b6e5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711C24691133B8AFC5E70E8EFA50@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YvX/LjAkgIJ+4FxCZrlnrfFbnV5dmn2IQqOF/oLFPjYDi5gpyqDEjETWWKZedDCcdzEImuJvEEr6gP8w2HFOqtRwy5HQ1NAeq54ZH33lXzaisHIbZggNegAsSdLt3P9GJ6+uDCb5GyLrjvudCtHxuz79NsRBfEaxbu68HWYwyda5FGIqAldARhtmpUUFII7SFMGxT+WkBD7Dy54jOavsl5+QL3NvWP+1aSumWFVsqbxQTbFPKa6hfyWfp+PMGvj0IeZkPSElCE9yu6PQfO1AoHJEYgotAlVN5dI/n//3UfAJrG0SRfuemPiv8eHfp0qkGv5bBMQAuuRxDoq5Tikx3I+IkCwnM4zL58AALkIHdln1CNneSfRvpU1AQHlOisISTI7LpLKC8LXqYH57oAsRy8y0L8ji/PQHBSiQuiIdsgM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:57:47.5916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec2342e-612a-4790-0519-08d72708b6e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhnFxwuDTx5hpmT3OcJQP3Rt2TnQVf6HyR7XNSCJebg=;
 b=S/rSVBm3GeIGpyEKOZtQyjpatAWKgjXT/7zaoJfrFj6g+eae96fvuez15q8lZMTkMuwhgmHCCJXC3v9GzmNBm64ByijTJzIuQr8CIRh2FXNbOvBbmbp6DIRRDHDWvHQUtnRO/NTr7DUc/A8x9OE1z38A4Z++Br0pBqJRTgG2nLI=
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

QXMgb2YgRFAxLjQsIEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5n
CmlmIEZFQyBjYW4gYmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3
b3JrLgoKVGhlIGJpdCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNF
UyBhY2sgcmVwbHksCmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBv
ZiBEUCBzdGFuZGFyZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERT
QyBzdXBwb3J0CgpTdG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDIgKysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAz
ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwppbmRleCA4ZTJlNzMxYzM1YzUuLjUwYTA0NDcxODQzOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC01NTMsNiArNTUzLDcgQEAgc3RhdGlj
IGJvb2wgZHJtX2RwX3NpZGViYW5kX3BhcnNlX2VudW1fcGF0aF9yZXNvdXJjZXNfYWNrKHN0cnVj
dCBkcm1fZHBfc2lkZWJhbmQKIHsKIAlpbnQgaWR4ID0gMTsKIAlyZXBtc2ctPnUucGF0aF9yZXNv
dXJjZXMucG9ydF9udW1iZXIgPSAocmF3LT5tc2dbaWR4XSA+PiA0KSAmIDB4ZjsKKwlyZXBtc2ct
PnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGUgPSByYXctPm1zZ1tpZHhdICYgMHgxOwogCWlk
eCsrOwogCWlmIChpZHggPiByYXctPmN1cmxlbikKIAkJZ290byBmYWlsX2xlbjsKQEAgLTIxODMs
NiArMjE4NCw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhz
dHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCURSTV9ERUJVR19LTVMoImVu
dW0gcGF0aCByZXNvdXJjZXMgJWQ6ICVkICVkXG4iLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291
cmNlcy5wb3J0X251bWJlciwgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZnVsbF9wYXls
b2FkX2J3X251bWJlciwKIAkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5h
dmFpbF9wYXlsb2FkX2J3X251bWJlcik7CiAJCQlwb3J0LT5hdmFpbGFibGVfcGJuID0gdHhtc2ct
PnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuYXZhaWxfcGF5bG9hZF9id19udW1iZXI7CisJCQlwb3J0
LT5mZWNfY2FwYWJsZSA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmZlY19jYXBhYmxl
OwogCQl9CiAJfQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCBkZGI1MThmMjE1N2EuLmZh
OTczNzczYTRhNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC0xMDgsNiArMTA4LDggQEAg
c3RydWN0IGRybV9kcF9tc3RfcG9ydCB7CiAJICogYXVkaW8tY2FwYWJsZS4KIAkgKi8KIAlib29s
IGhhc19hdWRpbzsKKworCWJvb2wgZmVjX2NhcGFibGU7CiB9OwogCiAvKioKQEAgLTMxMiw2ICsz
MTQsNyBAQCBzdHJ1Y3QgZHJtX2RwX3BvcnRfbnVtYmVyX3JlcSB7CiAKIHN0cnVjdCBkcm1fZHBf
ZW51bV9wYXRoX3Jlc291cmNlc19hY2tfcmVwbHkgewogCXU4IHBvcnRfbnVtYmVyOworCWJvb2wg
ZmVjX2NhcGFibGU7CiAJdTE2IGZ1bGxfcGF5bG9hZF9id19udW1iZXI7CiAJdTE2IGF2YWlsX3Bh
eWxvYWRfYndfbnVtYmVyOwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
