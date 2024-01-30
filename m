Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70490842D47
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9B1134E9;
	Tue, 30 Jan 2024 19:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F661134E3;
 Tue, 30 Jan 2024 19:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kwll4l2uIq30OO+XuDKnwuvN+DmiqwTx6Ht6Yevs7O9B9uS+R1a1sMIKbKrGtOwxWuNLFX8onNoz5OjRpDTsbLnkCCrOk/8WI+VhuDjFnmClNDJ7f/YQutWcNEnC6Zj1ykNO+hXqQxtSf8+vyIFN5ybz0w8tN1cEdtyRB/6lYpqrnW27HAv+Ir8/47UE+wVyWE87+nyhQenA4KD+ByefU+9Tw7gwA6X3oTg3mdBRCL1ip8iR87YwM3QwbJZVtVR7R+whg8LTKMJRPjk3XunfeeFmQhTMdF1GlQs+Or83dNC+dpQbdGvVFJRCvAAVe1BvrCaoAcHhFKlrLDsZzNCqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i52MwAeVv5hTjPYFufQJPRm9L5hNvX6q8H0hqX2bqD8=;
 b=fhY27KqSVcnBj/6ojrT4AHwva/xWQKnxJCQ2larKZVFtK/NzEUdCmwYaLNo2xVYKyXfEVgk6gt8/NADDJtRVZiUszwhAKg8vrPAskMmrt1MI7CJJvCLVJfhOZtnFWUX6tGCqCSYZdGI/RkShPWHLiqMoNEoAXb526VmBqEoIlWMkmSAibvliAWCYwWjsNApNuvWHzFwOz6rmHn1ltL7WrG98ifsJued/CdUsv2p956VirR0Yg/ZPZE/wqYcrpejbVmwVACa2QJKjX2fSfcdNksvOf92kpJwhMBze/3SfrIqY3Fac9aOZK9SPuBxtHRTRBs0udVWqQqM4NwsXPDXPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i52MwAeVv5hTjPYFufQJPRm9L5hNvX6q8H0hqX2bqD8=;
 b=rSNq/QZ3BS8b6E43CeD8btT1V7QMceWmN/1rYP9hPkOssSG1GD7bH30jN6Em5YVLTGHibZEf8aZi7+LclvaCoKrDsgJEswrG+/L/c/zHf7FQbY240XRPzQaS19NGwsBOUVWBYkjFZimziXRGyxQSDpgYCcb05SpgC4PxwK1ReWY=
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by SJ0PR12MB6853.namprd12.prod.outlook.com (2603:10b6:a03:47b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 19:49:29 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::b3) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 19:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Tue, 30 Jan 2024 19:49:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 30 Jan 2024 13:49:26 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 2/3] drm/amdgpu: Enable clear page functionality
Date: Tue, 30 Jan 2024 11:48:25 -0800
Message-ID: <20240130194826.398208-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SJ0PR12MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac0a7eb-ede9-47be-db09-08dc21cc922a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72Pk2till9+hjzzPgfxLHM7tWeJXa0Y3Ja0yFGAZMpGkxNSPChEktiFQhyx2xq9m7w2jtcu01X051b2vKWhK23QOKmBJ3KYMBAlAeMvkHYpKt2hJH1VwTaY2mYtdH0T6Ym9EtlX5Muj482Hw3xi63PV031ASBbh3cJGzoaT2QBLVvGBZi3LUYKLC8xKMVv4reApDWR3gvKXIJ5zdC9v7b4TeWP5LTavn5ZuZ+9DUMLla0YyDz2LCVwxq2k82JBDNjly0DzuaaCuzA/jDGCJi59qUKfLCTh9fu9XqJzOCg+VSWwyiAP2OLfFF+jaxPfeSXc4t3Xr1V9djmyzg2fV7zvzzLePeSL7qcmwhCnz0qNXzYrvIBm+fsNCw68iqZCfo//CX0yfsdm7bHSdhfYRjztiMYhm98e9znsHp+5Fmik3cgKOzioSncZ3gv2AgxPNc+Oyyb9CfpRh6KVB578y8y84yR0FpDk3JOLbY1BMkHWJhSxbwMMgqvXfGH6U5VfNH+26+tH7v0DD1PCnDgB5172jd8LOF8nM5GLYwuSlTPzvkb9kLDS6OrfR0GdEgCf0noyjQO0+tg7PkRmWCo7LMxLi58Ji7AYSnoRogiQGhljWERCM9OtdE4yRpNB/QQueoDTXvhbQ+1nwXhsL4vKQvGflpgHO5mzN3+O/V0NeSxNH2kFDmRsndiBFzRJuR/sEakShUzVEWLBjElNmWO8XXz6beQ1Oz46TQMBhXl6jab+XYifV0IsIzcQQkydjfYQd+FJKYfTM4r7SWxFAnga3yiA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(83380400001)(66574015)(16526019)(426003)(1076003)(7696005)(336012)(2616005)(36860700001)(316002)(47076005)(8936002)(41300700001)(5660300002)(4326008)(81166007)(2906002)(70586007)(8676002)(54906003)(110136005)(70206006)(36756003)(86362001)(356005)(82740400003)(478600001)(26005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:49:28.7844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac0a7eb-ede9-47be-db09-08dc21cc922a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6853
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
index b2e9a2f81d82..be32f9852d19 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -39,6 +39,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_vram_mgr.h"
 
 /**
  * DOC: amdgpu_object
@@ -595,8 +596,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (!amdgpu_bo_support_uswc(bo->flags))
 		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
 
-	if (adev->ras_enabled)
-		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
+	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 
 	bo->tbo.bdev = &adev->mman.bdev;
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
@@ -626,15 +626,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 
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
@@ -1357,8 +1359,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
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
index 46a24d2308aa..15cdda77573c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
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
@@ -2215,6 +2219,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
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

