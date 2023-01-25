Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AED67B5C2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D939710E7EB;
	Wed, 25 Jan 2023 15:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DFD10E7E8;
 Wed, 25 Jan 2023 15:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc6Kro+aCjNYR86ZcuZjkL9CX3SMGl56qXU7Xcle0ktFMddvteakXKl6StHLAoTMm2/0dcJlgZYHcPCSSrH0oUH/+Z3lTX/g+nmV96ZsZkSnRJoEHTdzGUJnpmi4nrlxLZGECdsF8pWSabrQQNU5mCZ8URkI1galfUvki+Y5XPsi8TgfbxX0Z3Mxfyx9soxqHF1KQFA/66qsQ0olFfBloC0bQcWJ2QdQKBbNaFzbkWTDwZCQ7SVcgUUQC7FzZOgmNnfmodiqa1JTUEosbNy2su/77iVVMWEHI8O9BfHNE3p0EEzeGlMrMxXK/PB38sbVuIkdIU8/WefB0Tof3r8cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOgPOT1O9euVKue7RhTKwiyZhv968RSPV8HAlO4EqEw=;
 b=YT2f0miEG0Op0P2f2/91eM+/hw/M4EYVLuHWdkyxV6mJ1mlmCXZBsrRar+puBFR+RiDklhGphewp94kvHZc1k7M7neNQmiMnvt0XeaiDMNHIw2GA5Mq72nuChCTf9P7qChUCwSZMyUCeds//D7TVxAGc/EOp4d5f5kgJhDDgXU6etPVW+sBgT0hBxOEORqPjeSENY7F8adkdswVla7Uv7ginAPW6If1xLKvlLBEwAzAummg/KCDrVfNu8GbcdDWzThSbotUh3tkKn1hiPRz43hdIKYmaxK9cWxz/vXC5x9A6CdN6NGmavHHpEXJ4ZRs+m9m0OyUKs4mJqCv+kCbJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOgPOT1O9euVKue7RhTKwiyZhv968RSPV8HAlO4EqEw=;
 b=pkhUZFY7UewRNr2VwFhdGx0OYDoGdpgBLzHbVCM2e4/ue4PITeSy/K0zBwda5LU6kup+P1lrGnRgtGut9+I21rYGkB2DNGVDxS8HH0LTICo/QFsBWRAkZFHn4KF5TASoXSLyWziCBddESuLhgY3UuBjjV5pbswcssFs65EYC1NU=
Received: from BN9PR03CA0972.namprd03.prod.outlook.com (2603:10b6:408:109::17)
 by PH8PR12MB8432.namprd12.prod.outlook.com (2603:10b6:510:25b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:20:45 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::53) by BN9PR03CA0972.outlook.office365.com
 (2603:10b6:408:109::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 15:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Wed, 25 Jan 2023 15:20:44 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 09:20:40 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and size
 from pages to bytes
Date: Wed, 25 Jan 2023 20:50:05 +0530
Message-ID: <20230125152006.3945-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
References: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|PH8PR12MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: c48890c7-9409-40f5-9b1f-08dafee7baa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/AMRbXa5ojuAmN2fg0TCh/qvI7tDej3XwBhUvG3leavpFIiE+NfRjXSgbAsmMQ5wVsIJxDXj7TxIQtnpNxZ89NX9Hn+Xtg+ej2uYG533REPoif4cGW808FNULKMAi3bLWHW7QhPc6pillsl3li7auq1PvuTN9COzdTav9vEVwQSYfGjka9cT04F9P2H+/1yqykWK16IFTipOCna4Pu/+Z8ECICyF3CgWStQG+FtXjEt5FVxTZYorN6792daTK3r+V4d+b1ePkeW3Zz5ILxevZ54RhP2OX79q1zI+cW5K2/WR4UMaCORwhehA0JH930VT+psvPdcjtyM0g5gEqLE6rqklj6oFz3l7Sd9itfOr1kypssvICpOViyfRTXsqDM2XkZHsA82zbFZoBV0DEcX+NhZAxsUgNdoOQEqoUq9bcCP4hD9j+IjvYOV1w6KvKEN+8n5NP2iH/hGpLOPqMrf47x9aHPrBE/m0wnlRIMq6dx2g9ymOwCPZbWUyGmVKsQQHGIslWpebytzinvueVmWxOmqWwSe4DusZabJaIKafU3OBt7JM5PNjqTNGNZAEHtSpAizohyryDrmLHdQwjzxeXgz9AsYNPx+xHAP+pr4LEDTcJ7qR0DNy1VXTcu20sa7MhXp5JSyw+BeaeiOAN5Nvr/FWbq0caxLJudnrl7QsEJd82dqXF6k1/Zw4BFVYhgE+LnHHZBPe0zU8m1U0yBV4H4ObBSbiAwsCcPDhmc/9lY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(26005)(81166007)(5660300002)(2906002)(7696005)(356005)(82740400003)(41300700001)(86362001)(8936002)(4326008)(82310400005)(16526019)(6666004)(40460700003)(40480700001)(316002)(8676002)(186003)(47076005)(2616005)(426003)(336012)(54906003)(478600001)(110136005)(36756003)(450100002)(70586007)(70206006)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:20:44.7865 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48890c7-9409-40f5-9b1f-08dafee7baa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8432
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support GTT manager amdgpu_res_first, amdgpu_res_next
from pages to bytes and clean up PAGE_SHIFT operation.
Change the GTT manager init and allocate from pages to bytes
v1 -> v2: reorder patch sequence
v3 -> v4: reorder patch sequence

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 13 +++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  8 ++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..a1fbfc5984d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_resource **res)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	uint32_t num_pages = PFN_UP(tbo->base.size);
 	struct ttm_range_mgr_node *node;
 	int r;
 
@@ -134,8 +133,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-						num_pages, tbo->page_alignment,
-						0, place->fpfn, place->lpfn,
+						tbo->base.size,
+						tbo->page_alignment << PAGE_SHIFT, 0,
+						place->fpfn << PAGE_SHIFT,
+						place->lpfn << PAGE_SHIFT,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
 		if (unlikely(r))
@@ -144,7 +145,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		node->base.start = node->mm_nodes[0].start;
 	} else {
 		node->mm_nodes[0].start = 0;
-		node->mm_nodes[0].size = PFN_UP(node->base.size);
+		node->mm_nodes[0].size = node->base.size;
 		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
@@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
+	start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
+	size = adev->gmc.gart_size - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 5c4f93ee0c57..5c78f0b09351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 		while (start >= node->size << PAGE_SHIFT)
 			start -= node++->size << PAGE_SHIFT;
 
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->start = node->start + start;
+		cur->size = min(node->size - start, size);
 		cur->remaining = size;
 		cur->node = node;
 		break;
@@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		node = cur->node;
 
 		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		cur->start = node->start;
+		cur->size = min(node->size, cur->remaining);
 		break;
 	default:
 		return;
-- 
2.32.0

