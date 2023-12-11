Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B280C1F1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 08:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5BD10E34A;
	Mon, 11 Dec 2023 07:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D010E348;
 Mon, 11 Dec 2023 07:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSLC7z3rsBdLLSa1tNSmB8DWX9pbXP/c+BrHo5F+soMMidss/+etl2P1RfWSD3kJcpU58fnTQu7L7T7COUoduFwq4fY7YhVrexHirfEgo8m4aIDfwmgKzWywehxmtReLoSYmPR3FKOObRix2pE0TAasT1qNLe4HFw5ZMwUrKBWOajnIItVXR8L8D7Gu35XlZwys2oosBeuvuxYw0MtDqLg1cwbZUGiWcY+HeNHuzAEiC3MqpYD02iIDBXEgjaY84JKD8GPJfhFhjdf9lF/y71Nbna8cE/zI0o7tLjEy8Y1JJl/2bcEJCl477EHDwCmE/zSEQncxsp9suu2T6AJ6xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it6QCVF5XQyrU48VFojKtzrTUM5N49DoJA85+dDnMv0=;
 b=GHK9WN0YfnWexY7m+8qvppYhtK7R4ON3y1vywPfeR0ZZeKGATcL2YiqJVgrjjLWqP7R4fuilfVzn1FYm6E+wXreP/TMCu+b+jgFzsC+hDr7iZ2a9jnpBxwYjUCLMojHUvce0zCLjPeZNuRVGQ4W+L8yUXpaUzwVAfFiTDKaQYIaSmivgn6cPDpXlKvn849am0ra4BfUrNGnmPjRWDO4CoYE1L+LxUQSwzqRYWQE3msGZ3xVz1a+3TSa86x99qhvC/d3OJGmN43XihZmd8xiQal1TopXNbxLnLmJJz5od1/FtmtiX8PjoB7Et06jquvwsTNbNp4jxLaBzST+solm4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it6QCVF5XQyrU48VFojKtzrTUM5N49DoJA85+dDnMv0=;
 b=ET5PXXHZdqcKodJonzblWcp9L6fyIJ7R/ZkEvQV8a8FSAEGiTWdsK6fUR4lmmoSfITiEmt4JTR9GDkPx/zIEWZaf4DJZMLfW/rW0dfTUa0fp8c0iBnAaA5505WSqyaAIwSqKdHfqACcC4G5OCG++yhCCYxU18/bnMN/okLfEzls=
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 07:31:58 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::73) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 07:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 07:31:58 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 11 Dec 2023 01:31:55 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amdgpu: Enable clear page functionality
Date: Sun, 10 Dec 2023 23:31:13 -0800
Message-ID: <20231211073113.3234-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211073113.3234-1-Arunpravin.PaneerSelvam@amd.com>
References: <20231211073113.3234-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dc5591-ad8e-4780-d9d2-08dbfa1b421f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZCNWuSJnFs9pf8KqCoO/h6eHfPn+DRqJx3mymJkvEY+q8+p8Cemi65AsMB1b6LS30rpd3FIpgKzVuWbZIY0iJU9w/IY0XnpqOUheCp78GP+VokH31TZPg8JMxSJ44BZPUlUzdVrf58hQZxZ5C3gWShcvrXeoY598JK3L9BZi9fAUWpkp3i4M58dKdUMZ2wXvTtJyfFizum4Yc4ox7Cv+NnaElVFAwmf8KJ8darRB0loe0CscEEa4DMgvbU28sd7jzzFH1Js7jkqFQK5jvw0+tonoTnE0NVMnRteN9fDbSmihfTbaJPb5CXTFHeqFQRdnKXqqDlxSkZtdPurXt5LbtzrZVnxU/RymUmWJFKOvK0YTIGsnzwmXNU3Fi6TRcq33TDNOySDdf9kzF89MOt7Pg/WnAzejJuJxfBpwtotTcAST/1fnTWTNzGYlidP4rz8ig16dla6QedRrpZmPxOuYfkahErMxW6F5jElx8BYC/Vl27xrZ9ehCMo7UBkrWZibsNOohhuH8QgvfjMGdFpNgECxUfMtic7E4+MFJFQkcy0dtxtq2ML14l/kZNUrd6yI4CsY98Yz+2rQotEGIe/0qvEw/KCig9SdQn+XuwrDh2coimaxfESKStHK8ewsGEbskB35+3yEb+3CSto4E5F/ioW6dqlDIIW3zmq+f1VmKKdCFpW4ajwbuwtPpfg5GNjtshh9h+dKdb/KUTpem/tePJro6sl+g++Y6qOLHNn2dtb0JZncrzbLJpj0MYu+vOF4AKrptoJNkZihSlt0OULDGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(66574015)(426003)(336012)(16526019)(26005)(1076003)(2616005)(40460700003)(82740400003)(81166007)(86362001)(36756003)(356005)(47076005)(83380400001)(5660300002)(6666004)(7696005)(36860700001)(8936002)(8676002)(110136005)(70586007)(70206006)(54906003)(316002)(41300700001)(2906002)(478600001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 07:31:58.1783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc5591-ad8e-4780-d9d2-08dbfa1b421f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add clear page support in vram memory region.

v1:(Christian)
  - Dont handle clear page as TTM flag since when moving the BO back
    in from GTT again we don't need that.
  - Make a specialized version of amdgpu_fill_buffer() which only
    clears the VRAM areas which are not already cleared
  - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
    amdgpu_object.c

v2:
  - Modify the function name amdgpu_ttm_* (Alex)
  - Drop the delayed parameter (Christian)
  - handle amdgpu_res_cleared(&cursor) just above the size
    calculation (Christian)
  - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
    in the free path to properly wait for fences etc.. (Christian)

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 16 +++---
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 53 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 15 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
 6 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index cef920a93924..5a01b6266772 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -39,6 +39,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_vram_mgr.h"
 
 /**
  * DOC: amdgpu_object
@@ -598,8 +599,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (!amdgpu_bo_support_uswc(bo->flags))
 		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
 
-	if (adev->ras_enabled)
-		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
+	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 
 	bo->tbo.bdev = &adev->mman.bdev;
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
@@ -629,15 +629,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 
 	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
-		struct dma_fence *fence;
+		struct dma_fence *fence = NULL;
 
-		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
+		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
-		dma_fence_put(fence);
+		if (fence) {
+			dma_resv_add_fence(bo->tbo.base.resv, fence,
+					   DMA_RESV_USAGE_KERNEL);
+			dma_fence_put(fence);
+		}
 	}
 	if (!bp->resv)
 		amdgpu_bo_unreserve(bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 381101d2bf05..50fcd86e1033 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 	}
 }
 
+/**
+ * amdgpu_res_cleared - check if blocks are cleared
+ *
+ * @cur: the cursor to extract the block
+ *
+ * Check if the @cur block is cleared
+ */
+static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
+{
+	struct drm_buddy_block *block;
+
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		block = cur->node;
+
+		if (!amdgpu_vram_mgr_is_cleared(block))
+			return false;
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 05991c5c8ddb..252b384194c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2222,6 +2222,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	return 0;
 }
 
+int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **fence)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_res_cursor cursor;
+	struct dma_fence *f = NULL;
+	u64 addr;
+	int r;
+
+	if (!adev->mman.buffer_funcs_enabled)
+		return -EINVAL;
+
+	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
+
+	mutex_lock(&adev->mman.gtt_window_lock);
+	while (cursor.remaining) {
+		struct dma_fence *next = NULL;
+		u64 size;
+
+		if (!amdgpu_res_cleared(&cursor)) {
+			amdgpu_res_next(&cursor, cursor.size);
+			continue;
+		}
+
+		/* Never clear more than 256MiB at once to avoid timeouts */
+		size = min(cursor.size, 256ULL << 20);
+
+		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
+					  1, ring, false, &size, &addr);
+		if (r)
+			goto err;
+
+		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
+					&next, true, true);
+		if (r)
+			goto err;
+
+		dma_fence_put(f);
+		f = next;
+
+		amdgpu_res_next(&cursor, size);
+	}
+err:
+	mutex_unlock(&adev->mman.gtt_window_lock);
+	if (fence)
+		*fence = dma_fence_get(f);
+	dma_fence_put(f);
+
+	return r;
+}
+
 int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 65ec82141a8e..cf77489a7adb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -155,6 +155,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 			       uint64_t size, bool tmz,
 			       struct dma_resv *resv,
 			       struct dma_fence **f);
+int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d0e199cc8f17..f3d36c345b63 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
 	u64 vis_usage = 0, max_bytes, min_block_size;
 	struct amdgpu_vram_mgr_resource *vres;
 	u64 size, remaining_size, lpfn, fpfn;
@@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
+		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
+
 	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
@@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(res->bo);
 	struct drm_buddy *mm = &mgr->mm;
+	struct dma_fence *fence = NULL;
 	struct drm_buddy_block *block;
 	uint64_t vis_usage = 0;
 
@@ -589,7 +595,14 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 
 	amdgpu_vram_mgr_do_reserve(man);
 
-	drm_buddy_free_list(mm, &vres->blocks, 0);
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) {
+		if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
+			vres->flags |= DRM_BUDDY_CLEARED;
+			dma_fence_put(fence);
+		}
+	}
+
+	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
 	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 0e04e42cf809..8478522d7366 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
 	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
 }
 
+static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block);
+}
+
 static inline struct amdgpu_vram_mgr_resource *
 to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.25.1

