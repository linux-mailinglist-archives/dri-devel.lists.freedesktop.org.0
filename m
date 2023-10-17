Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752517CB973
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 05:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916D910E25F;
	Tue, 17 Oct 2023 03:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6654910E265;
 Tue, 17 Oct 2023 03:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj+RajsKRCKSVk081t0j8B57oNcFxIlwL4E7DAqrWzrURRwRbjlFUdgCvi0CgjKv7PUtHABopfBbHhr4btGf8Qu29mknCBCIyYO6X2XATsskDniAEp1uyyM8ehmDwfpP/ifc+/Y6uvc9uDpkucr3H1upAMCgegQqGVADCvoEdap1IXxJz9iy9Ug9fq6oWtQs8+EYFuCcmrVtkodJI+U7hRvfMDb9vw+ReK+HQI1XqOhOy0dhG2eTeTm6oEmJxZoHNm6VQeZXvAuCzlAZ07pAl2ygCNf0MxNToAl5+xgC83xh3k8sCCYHqSFkHcJNx9ilxOkjwXiIpzzHviSR3WkoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gluqtO/ZlGROqT+k2TEjtDkLeQcdjnACzIGnc9aq5c=;
 b=gU+q2DFqHZpEyg6PsjhPM/FAWDkA7vSdCcZwTsjiD0IO9iQene7EZNjX8XxEaHKZ7kHTic98kqI9JExdupedJJ9Jlpz8b2S+Lk224tmecXpfCuCcPunVI0rJC6pe1dmrdBnEJBkl6itexs2xSLUZYxt4Z1UD/625a5y8rXv4K8FUx3ev8nis3e9BK86OzWtAHwvKUALOj/qxE9Tx6kW5JYBc3rUjKVc13PugHm4uIZjOLBZhmZNwFnSit3PPWk5Q1JwB1TBqXM6sMN51XxPU/CR6RwX7/jTAEph6QN4SdJqcjmkskp5/pfhwWFrVqQe/dxQSZLOOVHBZTvik4j7sHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gluqtO/ZlGROqT+k2TEjtDkLeQcdjnACzIGnc9aq5c=;
 b=KkdFtR6PwwuxZe3s3fyk0v930YuGqxHPv7lcsbZwHPgUdRB7LrLpHLSrIuaYHCv4ofzQElHjAEGG9NfIr3ZvGARjDdLn1nof+OOTxbMfQGmVtodu3jbXy+YV+kjhZDU6Y7GvZYPj6qdLffuLX1iRbrtPR80hZW+FtVLl/CNTy78=
Received: from CYZPR17CA0014.namprd17.prod.outlook.com (2603:10b6:930:8c::10)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 03:57:10 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::54) by CYZPR17CA0014.outlook.office365.com
 (2603:10b6:930:8c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 03:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 03:57:10 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 22:57:07 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: AMD Graphics <amd-gfx@lists.freedesktop.org>, "Direct Rendering
 Infrastructure - Development" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Unset context priority is now invalid
Date: Mon, 16 Oct 2023 23:56:55 -0400
Message-ID: <20231017035656.8211-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2319f099-b99f-4f1c-d6ce-08dbcec52394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8AAC2X19NqiesQr8H+5PQ7Tb1aK7XXH5Do19ZpG+GGcoE3gshBSuXzW3efI9cLlX6tCJQgJJO7mmRRAMFPxJlYyhteMZ/IVhDrzLnC4/O7DZkUFdz6mGF1duNrbtI0b1Q2m2SX5VHdi5n36PNAMuX7TFGo4aI8hESxlNhxb456E5BUppbBKlq56r4rSM8ImnCcrDly8+NkbUHWH2xo3tf7RpEy4GxPSBi4stoTf/nIjA0Yxuip2pa4U50QJmfQLW+FkyS7qdEoPc/vQACH41mMUke4pcZC0JDYQfjjSflsM6qN3In1KhgReUqTLnaju2MJhz3ETzbJcGqIi3etUHFgJtcPxKyNEy3i2l9cbHsIfLm5PZiBnr4PqSknxv9ZQZjtcqTryAiZjtA7WIzDWO6lMMCvljsxLjGyW4YwuVk4Owe+d7BrFoSJ4HIyCV+LdVoBVaC/fP4ASApnoC7w+KHP6MFsp0RgENvTBCbSah5/2ZKoY5xIfMI9lraj2yLbDgquXogs1MfC7BSzFtrFiW/XvFTUhj59p76QUSSQMeSnNjUaQ1K9DKJZAUgzOB2oq7lxprMF1sFxKM11ViM3DGwe0HD4Nfq2p2q176mDjR6yarbxY1DUicHN9yOH51Y8vD/cIchbLJ4weV6Tq9H+9+X1Fi/nfsCgDGfe4X5YkAZKX+sjVEBs825UZJGo3ZfXB+431GsvSFk62kC9ohKlawwPmbv3YVpJQiUm5+ejRlAKVdk/27N/30ZEmpbiDRE89J2T+F60+FxdX7seA+1HwVQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(70206006)(478600001)(70586007)(2616005)(54906003)(316002)(1076003)(110136005)(426003)(336012)(66574015)(26005)(7696005)(16526019)(2906002)(8936002)(5660300002)(8676002)(4326008)(450100002)(44832011)(41300700001)(86362001)(36756003)(82740400003)(47076005)(83380400001)(6666004)(36860700001)(356005)(81166007)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 03:57:10.2799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2319f099-b99f-4f1c-d6ce-08dbcec52394
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A context priority value of AMD_CTX_PRIORITY_UNSET is now invalid--instead of
carrying it around and passing it to the Direct Rendering Manager--and it
becomes AMD_CTX_PRIORITY_NORMAL in amdgpu_ctx_ioctl(), the gateway to context
creation.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 0dc9c655c4fbdb..092962b93064fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -47,7 +47,6 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW_IP_NUM] = {
 bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
 {
 	switch (ctx_prio) {
-	case AMDGPU_CTX_PRIORITY_UNSET:
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
 	case AMDGPU_CTX_PRIORITY_LOW:
 	case AMDGPU_CTX_PRIORITY_NORMAL:
@@ -55,6 +54,7 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
 	case AMDGPU_CTX_PRIORITY_VERY_HIGH:
 		return true;
 	default:
+	case AMDGPU_CTX_PRIORITY_UNSET:
 		return false;
 	}
 }

base-commit: dc9b2e683bcba017588b9aaad80f442ad004a48f
-- 
2.42.0

