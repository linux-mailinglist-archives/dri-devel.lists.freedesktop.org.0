Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFD85D7C8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2610E71A;
	Wed, 21 Feb 2024 12:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BipTQYLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2819C10E710;
 Wed, 21 Feb 2024 12:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS4Vmzk5WUmOAmbF2Pn8vGBDh4uxrGR/cZHPz5dD6Iya0Zny7IgwXxjvV0mHgcV+mvZP7pnejh3ufv/8knRzCWTG7NPT93At15TLuIEjd+77BwkK523hJXlQ5pz7IZ8681xLYQ34ihr0Ni+GIAg11zmZSjqq602D419zOTDczB2pKYnwk0qzVICoAkTwbWYpf2ZFYuE/GKITxo4XHmnEFZsZPUN2d3mS4ytE5f5r9o5GjMkrKN1qKgF6wIO5Sbeiy1T9Esj2l9E+gVmqJy/ZGV4GsEKcVge6dJE2/MVT96P+L5QzBo/ctbUfmzHuBKCbqDG/9kFC3RejLYGvlrAYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss2YY91PxWm/OXlIBCigragxJICnaHPMaf8E/thEAmw=;
 b=VMdE3qXWHNT9xsz2HB9noA/IQN57Rmo5rn0AAmLW1OSeSbsy8/DRYuVlOnrFiuT6hJLBywihLJ4DI337CWqinorYRR+KeTW8viPWWAeTUU4A/8Hhwmp270MoZ7CneUsMepiuhf+CI9DQRZbX8yGm94Avkro1Oi2k9sFW+ANnufCI0Y6sYeoWbOrfGBl+6VPdmmSIhmmptfJCpDXUVhw01agfMzxs3leFhYVBlxRKow4b2/kgZlKZQRumtgapOsgVOENwKwhAQTLA3V3NXG1fSFtjdyd8SXXxFJDPFdJhfqKZMRJMbEWppGDqxN56mCOSyL68DFsUPkRM/j0UzO3+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss2YY91PxWm/OXlIBCigragxJICnaHPMaf8E/thEAmw=;
 b=BipTQYLZzdH+cG84UsJ9I8slPAgkHPLQv7izq31FQ2VNgv/2qBOJ4qhizeK+ucxRjFk7j29hN+1IoNti0seWpNBjDkpg+tYklGVERGfco/Dd2lULdjisw+IqYnREp9PMNXcdCyNbWVsOHCEttXHanXa8stM4EJv3rN8p2hfmGMo=
Received: from DM6PR02CA0137.namprd02.prod.outlook.com (2603:10b6:5:1b4::39)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Wed, 21 Feb
 2024 12:18:31 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::4a) by DM6PR02CA0137.outlook.office365.com
 (2603:10b6:5:1b4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Wed, 21 Feb 2024 12:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 12:18:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:18:27 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v7 2/3] drm/amdgpu: Enable clear page functionality
Date: Wed, 21 Feb 2024 17:48:00 +0530
Message-ID: <20240221121801.3252-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb36f9f-b928-4f9b-e264-08dc32d737e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SMqKw1G2khsTL6MngxDCkIXgNMnkVDSrbQqgtG5EAikS6mHefjEZLVFDreQN9aYBuC5+7Xl3SUGr6k4XQwGghM6JLHRbR4nU2d76OLoNK9dX/OTgHBN2+srRR2RVCOtwBdjpGxPkV7baOzTxzdiAByP43kcH2Smsz2kLA2gb46k1wzxfXFnoTgpXdgB3s+mdcbiWNlf+g7kn4N/sO2XmvqcaRSpjElQ+iUUAVZ/hBHHxILM7hcqvrvQGnG5+yDQtHEsr2mj4vntIHmmDYESiEOhMVU+zxKsEhI4sJZ977zyacfdR2XSJv1AF5AMZihqwERrPtnaeVysYixZjigNElFE2vaHUKlUmhXMf4ol4etFdym0xtqcnHj68z33O8He1S/GnBU6qXC2LS/s+7AOeAWLKlNQjvXeq4+sKpM0Z8P4MeC8pZuD15oVm2fEIkt5sjNeY22oMvWfyN1iqCnMC5KzBRckwJQ+bh14DbJRR2Z08ZH9iqUHgF2YUnSOdy0GVUUOOcOc0+Ij3QGMcVX9WRFjZNaHVeXrzfFl6uiOmxqqats+ssw6IqD8RHb2UCf5dPT8Nh54sHR56A6qjOilROg4k0F80tQSLRAx2fbs0DLj398fr3m+RssGeJB9jRxHlNpGgGnJq+DBSDZiPcplL4rsVsxYPt8IhsGNOeHnlV8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:18:31.5672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb36f9f-b928-4f9b-e264-08dc32d737e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
 6 files changed, 111 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 010b0cb7693c..904d71b3393f 100644
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
@@ -1359,8 +1361,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
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
index 8722beba494e..bcbffe909b47 100644
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
@@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
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

