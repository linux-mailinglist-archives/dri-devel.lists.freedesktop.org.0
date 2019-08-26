Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7169D164
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0530F6E0B9;
	Mon, 26 Aug 2019 14:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5589FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7QGHHUqZM1hNjW66XqEryKt/W63C/k+BNsyQHv5wo5KV0xbbGb9ZNpUZYGc5B/rxi9Nx2qbDDpcCDiua4+DMrAzzuBUh0NAJMTp72XwLsKjVPnZyn+X9NZTMAE3x4IjQk4KoCATfnRnZI3qBnwsLMp68G6XpoYsB/ULc6KQ+EzaMn8hakfFCRPFczU/Qee6O6ZIxcYLczYXDbPq9qH9MXknJs0G7Jd4WHGHxnfsV/WvmjjugkYDM1PjHzQr6FsR++NzXtRrfFJoP0nfh9VB12BBcDXzsqN4Xm6ss0+vX5Q47yj/7ldu07BNPG5/bDIgvhMcBkx4drYCsHwLfxuiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vLsilu+EJGfHul0sChq7uEcMdRNFtQJwTiECM3dn80=;
 b=k5ABUYBA7eVAm1Vmi8HZvf68okw/1yhFE5b5dv2Mq0Rxts+PibDmKIm2zgr8zRdCp+Li/w1eMkQA1wTss2R6d3eOpi/78Cnrq+C4SuJdlU8I6Nhc7/MkU8KhgRUKWWvFXiFS9L/FDsgjQYHXNunBNxXnvqtNpR8nu4NnSc8fCYBydhOIu85TQ+fHD68RM67osSV2grJmIH7F8nmQF2rEiCbOyPbjdex3qmNqOlaAxi4j2zWHrcy+55WBasndX8hLpMLbXfqU8q30+aMWE3rIRCcOJMD44kWCgMgjl908bcuOLjgHBbcf/ofEbpPkGeWJxFYfQaBe9Vfzi45cwOze/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0071.namprd12.prod.outlook.com (2603:10b6:3:103::33)
 by MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.19; Mon, 26 Aug
 2019 14:09:28 +0000
Received: from BY2NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0071.outlook.office365.com
 (2603:10b6:3:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 14:09:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT058.mail.protection.outlook.com (10.152.85.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:09:26 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 09:09:07 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 2/6] drm/dp_mst: Parse FEC capability on MST ports
Date: Mon, 26 Aug 2019 10:08:59 -0400
Message-ID: <20190826140903.12580-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826140903.12580-1-David.Francis@amd.com>
References: <20190826140903.12580-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(2980300002)(428003)(189003)(199004)(2616005)(126002)(53936002)(476003)(486006)(81156014)(81166006)(8936002)(446003)(26005)(8676002)(6916009)(305945005)(4326008)(70206006)(50466002)(47776003)(2351001)(6666004)(16586007)(48376002)(51416003)(356004)(50226002)(336012)(70586007)(11346002)(49486002)(426003)(1076003)(316002)(36756003)(2906002)(86362001)(478600001)(76176011)(5660300002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecec2911-f7c0-4c39-78ef-08d72a2f0102
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12804D7491F3E02A4BE70DB3EFA10@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FXdgdm7621NpNm3+/dhgIDoYW74t3wN+Fo74UjpysnI3D8FvHhM2wt0JjeuDWpj7MosX5XizNnsABjIvfr3eOP+P6EdQAZKd+tDtAtJrsixbtw/weYP//FMake+fs7iI/FKvO/hj7RC8m0ZleC7CVIhGMOQ/car405hszHem40SO75jqt+qhkP+YGmcW03RKpt6oT+XqLCcYpkx4wkwT5l8kTgDLqAfirK6k2Su5XtZKlNJKasO1D0orpZxKh+t7+u/UHicfOkJc4LlYsNqsc7JixgG/uQTvYRqn6OWQQeQ5jt6mGrl+mc5ocU36jfgBj1bu+wULmSpTms6QWMNvZokbD1aoV1J4zGgXp1rzMEg3/iraFBVpUIYG4g4kdS75hQEFEurdcPg123xnD8ijcKMUUBj+GyDIe35iXVrf5fo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:09:26.2511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecec2911-f7c0-4c39-78ef-08d72a2f0102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vLsilu+EJGfHul0sChq7uEcMdRNFtQJwTiECM3dn80=;
 b=J3NFJcN1v7opq1kJvQ++sBDukft5hX1YeFuQNfJ6SOl+fgJ4jFrMKc3IswVnCqqPn9WM4sk0khyFFROmyIsWiFFIzlzIWf4lA9ZjXi1uvRb5dMo8mRnkur5uUkzf2s5GRtHlCNixyurI3hFlTHmxG10caFeFbCP65qBSWHnb4aE=
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
