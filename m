Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AF89C7F3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9691126E7;
	Mon,  8 Apr 2024 15:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FJG/va3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23591126E7;
 Mon,  8 Apr 2024 15:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dge+xqO1+gqmjxu54foe2+h+OoSreZxMaZa2pTFET2FZShRMzfAh58fp/eQaj9gZ/IVjC5vdOuSY9ehAIZFAW2nfmfBKX10o2uqoPx7wyJ5JAf6XtFyd6j6DgfeQ1b6TiQ85qh2H9w8kOgJGJadNF+T9xPPY4upylLDCG65dwXBe9N+dwBIpDteyjDMQySebdzq7lL1qFo5DqNXIoBooe2965aGIDtaM9M/0Bm+pJLDssRTKplwD1G26hKffnmQXi3U4I/1zt5wg7RlzdAkSlgWfU8a+yztHRN1gFhsvl0+1nxMx+omsXDmeahp7P9QqNKF5YSWI292odxQE03TnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ll4NKklJRnAh2UdMtervmPZFZbgVYSPymVb6Q+T9u0=;
 b=IKW7hh3hqUcR7+1L8JlbQT2qPTUdt3UyIHMa6GCFYzQ1VTH18JSvyVWPKVRMo1gwgM+ZiTWowMvtwwJr1Wk3doGmZ3x+qIuF9mOWOLxnHCoAh6bThDPNiAxjortWHdcd4ndc0c86NIdHVc8cCkgI8/aHo3WN5qF7agmrbpQCiQfKb242pIb3HgegHzHZ+on6bkx4AqXPCReE6b8/Ioz66Rc4m6jO31USdi2Z6CkrwZ/5RyJDweuDHEAPKeQhTwgjJcnkdH3cO2mLfL/+e3X6SBz7gpJA6P2IxZlbi7EGYZe8lr9ZuWWKTjtQ8kv/YUwzJxWsHxjz/hrSfkWsiztMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ll4NKklJRnAh2UdMtervmPZFZbgVYSPymVb6Q+T9u0=;
 b=FJG/va3cRT+XwVwTIXC62YI6k8SKwr49ddFEJ2kbxU3fV7WgpDn3utxwOoazkrG1e/HSnRENiK8e1UCcMTv2XOIhDESg2t2Td3BsSJJErbTsewAyGqcZFiRfEAHUGNbH9YLA7oQZOPRyuHoClE7MZgnK8zIbZ/O4lx0W+bLPlII=
Received: from BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 15:16:49 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::e6) by BY3PR04CA0022.outlook.office365.com
 (2603:10b6:a03:217::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Mon, 8 Apr 2024 15:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 15:16:48 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 10:16:45 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>,
 <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v10 2/3] drm/amdgpu: Enable clear page functionality
Date: Mon, 8 Apr 2024 20:46:19 +0530
Message-ID: <20240408151620.528163-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d874c2-e927-41e6-be4f-08dc57dee97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +y4db8t+C3TMlzmhQnMEIMvxcv7H5QBIQrry3OwMzFLiaxluATq5fYn48Jws7FnmQZdL0oWZDajKOAhvxAS4NHFGfVUluLSSGeybbSPHSvg+oUglRyPzjvPYsebKSsiaMNppER0inNuDas7pej7awi4fpzIqQEqY6HCBUvmnSeuL+WaMt+eQQs+mFacGj3lcyqpbVTGCTwjZjtQXQJ891Tx3q6ow3DaY4Fbh9J9spcqMGUAJxXP8jiHPzBdRE9qDt1ZP0vtkF48wvfz0i2iwCH9D//7CvxeAesXyVzInNHdhZtEvaRvqRVhaAFRbtwBC2vYME/B5eGoklPhpEKyQSqAV44shoJt6oXHngxpl9b2JqwMx282m0GQj3pGDfBHfltpL/zP+hTm/7aAFv80k33UYNJejQZG+SL8lGF+3OlDZBhfNCs5WWwaQpdpO099T7XCJx7G4z74O5j8jlk0bw+FRuHtStjXa64+dLMC/MmXzJhPsUekypd4mRvrlb3S4oYYOazIIsNHGCnR+M6xTj2lfkOZCfVGgGuPgddTWn5esb4XrykzYhMuoNuHBPy0K5NXJ2m7BIaTPXCTn2MIK+D+dU5Knok65/e3FH2/1Sjj4uGCDDxdxyxdsWokY8oiYWFK1PYer8wvXK+R3/ghBGpniSC62pjxbJkJb+Nlm1s10IS7DMhkNaDAYxvsTR97bl81Ka7Ud4kNEAWqyd7Jbcf8Fk+P9FweonM5EnNlgyEDXEUEtvPHFpCOaVWimerpz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 15:16:48.8709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d874c2-e927-41e6-be4f-08dc57dee97e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add clear page support in vram memory region.

v1(Christian):
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

v3(Christian):
  - Remove buffer clear code in VRAM manager instead change the
    AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
    the DRM_BUDDY_CLEARED flag.
  - Remove ! from amdgpu_res_cleared(&cursor) check.

v4(Christian):
  - vres flag setting move to vram manager file
  - use dma_fence_get_stub in amdgpu_ttm_clear_buffer function
  - make fence a mandatory parameter and drop the if and the get/put dance

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  9 +--
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 70 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  | 10 +++
 6 files changed, 116 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 8bc79924d171..e011a326fe86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -39,6 +39,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_vram_mgr.h"
 
 /**
  * DOC: amdgpu_object
@@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (!amdgpu_bo_support_uswc(bo->flags))
 		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
 
-	if (adev->ras_enabled)
-		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
+	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 
 	bo->tbo.bdev = &adev->mman.bdev;
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
@@ -634,7 +634,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
+		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1365,8 +1365,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
 		return;
 
-	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
+	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
 	if (!WARN_ON(r)) {
+		amdgpu_vram_mgr_set_cleared(bo->resource);
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
index fc418e670fda..f0b42b567357 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -378,11 +378,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
-					false);
+		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
+				       false);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
+			amdgpu_vram_mgr_set_cleared(bo->resource);
 			dma_fence_put(fence);
 			fence = wipe_fence;
 		}
@@ -2215,6 +2216,71 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	return 0;
 }
 
+/**
+ * amdgpu_ttm_clear_buffer - clear memory buffers
+ * @bo: amdgpu buffer object
+ * @resv: reservation object
+ * @fence: dma_fence associated with the operation
+ *
+ * Clear the memory buffer resource.
+ *
+ * Returns:
+ * 0 for success or a negative error code on failure.
+ */
+int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **fence)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_res_cursor cursor;
+	u64 addr;
+	int r;
+
+	if (!adev->mman.buffer_funcs_enabled)
+		return -EINVAL;
+
+	if (!fence)
+		return -EINVAL;
+
+	*fence = dma_fence_get_stub();
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
+		dma_fence_put(*fence);
+		*fence = next;
+
+		amdgpu_res_next(&cursor, size);
+	}
+err:
+	mutex_unlock(&adev->mman.gtt_window_lock);
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
index c0c851409241..e494f5bf136a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
 	u64 vis_usage = 0, max_bytes, min_block_size;
 	struct amdgpu_vram_mgr_resource *vres;
 	u64 size, remaining_size, lpfn, fpfn;
@@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
+		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
+
 	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
@@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 
 	amdgpu_vram_mgr_do_reserve(man);
 
-	drm_buddy_free_list(mm, &vres->blocks, 0);
+	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
 	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 0e04e42cf809..b256cbc2bc27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -53,10 +53,20 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
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
 	return container_of(res, struct amdgpu_vram_mgr_resource, base);
 }
 
+static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
+{
+	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
+}
+
 #endif
-- 
2.25.1

