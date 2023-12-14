Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB998131EC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 14:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4E10E1AB;
	Thu, 14 Dec 2023 13:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8610E198;
 Thu, 14 Dec 2023 13:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVaAJz16VWEI7kY1G8C6GOAejFsXgnxgBmRcSl75sGJL9OsQaq4b9wNL6jqRBXLMER8oZV1H/mvfXAvp8KJbqi/se5SEUjzEUpLVb5tzO+7hqwOIILjASJXPGez+plJdAycDZp55xZPQgBGpI17GpZL0dDSNAYDN1kpieozXBehEPTyyBBja4bdbzRNowIFNy7g7AqjGVxct/IU5V6ARDWSegwVyX2DFY6Fc5upBNEhvJ0w79MoA+EMhiOk2B7MBOGEMcP7Ut7JoT+P5YuQHA3bR0TPb1sLMHFM8BV+8gI281HTKt9w71J+NBcwavSAqrL2Ovu6+4vqyBe2LXYuJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQTmQzhEUhVmYWo/7wbSikwiIC2rT5vFO30g+5lNhv0=;
 b=G2F6pMoaQux1J8l83HkqyFFRcRN8tA8gstmdmYrQKGJBu/hkrqOkuStGwiNCi6gA7mrEu1FE1iUzTuFaAmx2nnC/LVfdGdJNqjJGa0Zzqs4G/Jze5DiH8zFf8uXTg7MS5Fa9p/zIgOV4kDm5eaevDXD3BslVVz95QHB2//O9XuB3tlnvS7lLXHcg221lUG1fJc92LxFqE5XDPT/8BVsZolF6d0yc/3QWklY7nTucbadLJfdhJ/vBYJV2m3/ewtswmblm4JNFeR9DulfBVZlYQ4vIq8tv9o8vK541oZXuEhSQihHcNFq443cEERjMZocw+3MyED4mSefTwoIH8tz0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQTmQzhEUhVmYWo/7wbSikwiIC2rT5vFO30g+5lNhv0=;
 b=0Ce1yfx+ZXoy/7HArNiXdi3Rfwg/Td4wp5DCBX3YnMcU9emSJCo3uPHNCvTe7pybCSNg7zDWJvyHJ7vaNCTlvIT5RDiaBWPUnEtCKFbTg3/leLya+Lp2h1oarGpAZTGZDnQpOHe5djEOJa9V7Lkx3t60fUSt9qNHZaOCU5hTR/A=
Received: from MW4PR04CA0147.namprd04.prod.outlook.com (2603:10b6:303:84::32)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.38; Thu, 14 Dec
 2023 13:43:06 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::4c) by MW4PR04CA0147.outlook.office365.com
 (2603:10b6:303:84::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Thu, 14 Dec 2023 13:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Thu, 14 Dec 2023 13:43:06 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 14 Dec 2023 07:43:03 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/amdgpu: Enable clear page functionality
Date: Thu, 14 Dec 2023 05:42:40 -0800
Message-ID: <20231214134240.3183-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bfa631-b909-4d0b-5754-08dbfcaa9a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrGBm3bvbFinnbygqVw2gjIoguSWdHDOtHCizoHA+xkHoXlv2kEjPVozosgjiMbVIBMNypDREUFDGEs0LMU8HU1kuR29gSR22BxlX82GAxSb3xR87tZVRtZGIQTJbmJvQ3KtZ2ytdyhrsO2Gtd66TGeqpX+fbcGtHCFiH5BZbsaDB5QQm+Wi7RxcNlOaNrBPPsI8naIUlvtOFBYaFN6zttE5wQojkwYZBWTEd9HZ8JZKy91ICilnfm1CcN0aqWNcr99DTiM5LSDusWmVuBF9u9S67AZY1anLiJrbP+L/0hFH+cI1xYxPKiLfw7CnAUhjGEOrTW9G43elZm3m+k47Ky6WVd0FzWMv93F0IiUoDoWiLxbgfUiu19kOXEVyHk2D06S+/ReE1eKLoQhYwtrukn4FJNzuM1CN6zDJk31/SOYbLgTN2tTo2VkZ3M3mZo7xWCH0jO75ZKjdE5aLu9Uc+oBMtABvbYkTjYGhsKUDQ8YkrrYSEZOnDYMwfg+L0YUOTcBqKrsQesygf4OvEAFmhLI1xgXBts55bgCLruZoglp3+4dc7E+bTMOKNJthdL4iQqweJSTyUGDxXbxMUxS8cx1KxUw/BGG+8BOKgvx1PCptDsEhy4q++mi9f2IO1azBgKDzzcqRB6QYkDoRB56iVjPjnN1GKqmms8GjwBIyvVii8v5Kn8CxsuS7W0HRX1e8s5yEkjuV99bkoNh2/r615K7KFezd2PgcWggS7Gcz+ilPIS2i3yoqvK42/Jc5NE+JSczXN5LOoVwweI71HkVXtw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(81166007)(356005)(86362001)(36756003)(40480700001)(40460700003)(82740400003)(41300700001)(7696005)(6666004)(478600001)(70586007)(70206006)(54906003)(336012)(1076003)(26005)(83380400001)(2616005)(66574015)(426003)(36860700001)(2906002)(316002)(110136005)(47076005)(5660300002)(4326008)(16526019)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 13:43:06.1920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bfa631-b909-4d0b-5754-08dbfcaa9a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
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

v3:(Christian)
  - Remove buffer clear code in VRAM manager instead change the
    AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
    the DRM_BUDDY_CLEARED flag.
  - Remove ! from amdgpu_res_cleared(&cursor) check.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
 6 files changed, 111 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index cef920a93924..be8bf375d823 100644
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
@@ -1360,8 +1362,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
 		return;
 
-	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
+	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
 	if (!WARN_ON(r)) {
+		struct amdgpu_vram_mgr_resource *vres;
+
+		vres = to_amdgpu_vram_mgr_resource(bo->resource);
+		vres->flags |= DRM_BUDDY_CLEARED;
 		amdgpu_bo_fence(abo, fence, false);
 		dma_fence_put(fence);
 	}
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
index 05991c5c8ddb..c63510f5cb0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -383,11 +383,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
-					false);
+		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
+				       false);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
+			struct amdgpu_vram_mgr_resource *vres;
+
+			vres = to_amdgpu_vram_mgr_resource(bo->resource);
+			vres->flags |= DRM_BUDDY_CLEARED;
 			dma_fence_put(fence);
 			fence = wipe_fence;
 		}
@@ -2222,6 +2226,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
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
+		if (amdgpu_res_cleared(&cursor)) {
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
index 65ec82141a8e..b404d89d52e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -38,8 +38,6 @@
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
 #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
 
-#define AMDGPU_POISON	0xd0bed0be
-
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
 
@@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
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
index d0e199cc8f17..a25d2d511877 100644
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
@@ -589,7 +593,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 
 	amdgpu_vram_mgr_do_reserve(man);
 
-	drm_buddy_free_list(mm, &vres->blocks, 0);
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

