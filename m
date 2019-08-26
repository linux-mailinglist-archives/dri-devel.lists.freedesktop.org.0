Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29EF9D564
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8566E28C;
	Mon, 26 Aug 2019 18:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2C36E285
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWSgKAwk403F6r7IBLWhrvO0XXlgzfo9bXFrcD071PFwohGjjDk9PY03ky6nYtnz+5583yMAv31LKrfXEgQQeTGTuJZQ8SOHXO1XTSDoATs5jhqPD+kJpMK8xuZ0G2elnr259BytNPAHVDMLsQcFLDUFY7//glmBeDHnJkOjSpleFtwwnE5+/OvaRMaHorktCS9cHS8q7yag0WCudfzo0sYhCDhzz/yI/kT9JYS8DWAUsSm/7/wIxCcL+8X/dt+1TUUjS6XIymnu8WLBlhQLES29VGYNsa/yl2T8qCXlGYcCfgENwkV9RW38bfM9ADc68BpPI/nuQAOV4Et+JwWjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vLsilu+EJGfHul0sChq7uEcMdRNFtQJwTiECM3dn80=;
 b=ZstoTWYsqz4jZNTbl/jdzN8o3YoQI3aUOwP3r3i0iYRvF2Y5ey1E1g8GF+ZmRTGMSVnKmrjyW+1/t2Ru4d1/TjENYg0ww0o7DTQdgysc6WOsz6F7TsaoNt00CujnljOavaWgugV0Vxmb1/jYkiMf0c9FGTJFdGONqcDiRqRFoWtOmVBMqoGsFL3sWrBn01NSiWpbKGMS5mL+Z6a2ecbPII8f3UzZFDVUeFJ5xukxmR3L29yQlmGNlDgCWciMMhqty9u+C+Soc8Fdyr74QC9gASr9GCZ1pO+QdWrV81utWIrP6Ri3yjLQ9D24jJVtDK/qeWdwW6YNGVcRVrkonqTl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0009.namprd12.prod.outlook.com
 (2603:10b6:301:4a::19) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Mon, 26 Aug
 2019 18:05:17 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0009.outlook.office365.com
 (2603:10b6:301:4a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 18:05:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 18:05:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 13:05:14 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 2/6] drm/dp_mst: Parse FEC capability on MST ports
Date: Mon, 26 Aug 2019 14:05:03 -0400
Message-ID: <20190826180507.17802-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826180507.17802-1-David.Francis@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(189003)(199004)(426003)(446003)(305945005)(2351001)(4326008)(2906002)(8936002)(50226002)(50466002)(16586007)(48376002)(316002)(356004)(6666004)(53936002)(51416003)(76176011)(36756003)(26005)(1076003)(186003)(478600001)(5660300002)(86362001)(47776003)(6916009)(486006)(49486002)(81166006)(11346002)(336012)(8676002)(2616005)(70206006)(126002)(70586007)(81156014)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8d4ff7f-65b6-4ebb-29cf-08d72a4ff372
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27155AA6594DE7CDBDBF54DAEFA10@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cgwuRDB2jioDA6UV3Tp5iH+8rolHBRl0x3XnV0HyCxSBB/rcH90ve7SrJtxlqyiXBR2qDuFoe3kYyxAe5V+Mrfe68wy9B9sJnhwf69OA+SJWn1iTm0pPO/ofhH4J8cwKIVQmq0XcbRfnheYm2btymmOxVsYTJxePnMDjS5Ny9Kabh64vSaPs/MjlQ4fbC/bJM7FnfSBIATx/V3IgZyn94x10py8kpdXWQA3eQCTm5T0NH/LGbOchGClzKKRlSgUYJgAFFPXV4J2afT9N//CRz/IhgLEjyDftMZcf6KlfqJ6UDWLOQ4HTKBaHohmfBgllV8zfeHyhwHb+EllUcwPBk+zMj2NHy1G7285Pucex1bAEhRNGip1wab9lVXorXECNiQ40fLI3YKaCMSDCsyHg4BbHSlS/7N/3LIEC6WPyaEY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 18:05:16.9361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d4ff7f-65b6-4ebb-29cf-08d72a4ff372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vLsilu+EJGfHul0sChq7uEcMdRNFtQJwTiECM3dn80=;
 b=pOLL1OSZziRdoFF2/POOHwywVWhH5VGIz/fvZ4VwzjrpBtgL7PPkSZXc7AXdXckHXVC+F0Khz8oGC0FO5wZsIdiCDV/Pou6QCbV5IOTCJjNkXnIcqy3Vui++q3SHS3EytjKpsSZ1/qGVGBSajhtvQDwnzd/6IvgV0r0RmLCOeHM=
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
cF9tc3RfdG9wb2xvZ3kuYwppbmRleCAzZTdiNzU1M2NmNGQuLjlmMzYwNDM1NTcwNSAxMDA2NDQK
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
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCA5MTE2YjJjOTUyMzkuLmYx
MTNhZTA0ZmE4OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAor
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
