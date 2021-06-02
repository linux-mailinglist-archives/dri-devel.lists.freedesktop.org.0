Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C83985FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C706E6EC40;
	Wed,  2 Jun 2021 10:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D386EC3D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id e18so3008463eje.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0vGLHN7pg3G+g/Rh0UpOLW6wU/GNtM1rnF3Qkh+Fqu0=;
 b=gZDj5VjjUOFgt2GyhxYqL3QabUw23JQWwmvhwzQi0uQmn4Ew0DGq0pz8B1IRho0/W5
 ohlp9QKFEYvHfnzd4cfhdxVr52KZ4cCvH0Th0BuxIVGUSjLVXRxOZmfIDtHQ0JM/67xD
 aGDGSK5ObkOAl817UIPi7l7TG5bgjZ2V1//Xw9SCeeEMdjnvcWML7GIrJ4DK40pxXEXs
 e61bt9KGSSwZ2D6jmJhRII3XHFC0tLp4WDqq8fa3ks3y86OSkH7tY/wcU9ZojtDLaBfY
 ovNoctG/7AOYUNl/VQfPXwRbd4e0t6vz2lPZ82oJ/IFHVpVjdC/n3I63GgK86bQSSO6Y
 hHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vGLHN7pg3G+g/Rh0UpOLW6wU/GNtM1rnF3Qkh+Fqu0=;
 b=hHPCWHd1CS2pgsD9VPYbGqXdYSB8AdY9YTaakN18pDwwSVZDRnzmOCjfJ7tEEpKCgS
 bCf/aCPONltM6NeQ/XkavzbiJi9G7SXvbzgDHTxDFh52Rzxa3qSaOp2g5COZx41Bb+UL
 WaEtVSmSst8QP3FSXM7HlvT79Y0boWBpXErjrHqCYriGJ+1pih0vavlzwnVbaamTZB60
 o1tp/K/fpDb+erYdzlHJIheSjq19hCsHznKPIN++1rg1rf03bb31QlSdcFyBsu3FMJko
 y6sQdhci14nXvedWlYJdO2lAurViyc9FPnkv+bpdmOmC+ZWehDA6qYgQXkITklxhOEjH
 uVuQ==
X-Gm-Message-State: AOAM531tCpsb9/ENWtwlOcqfIon0rTMzej3IcxtiuyKw22dJy5794OZk
 AnSnm45ydVIpqmLWZ3BH/fxmajl0+zk=
X-Google-Smtp-Source: ABdhPJwvGIoaQfS8xGWke9BQ02natO/D4WVjZEOCnnSI+KjBrgmoqZoOTlrglo/2uttz9b+Rs9ZVrA==
X-Received: by 2002:a17:906:ae85:: with SMTP id
 md5mr20158839ejb.301.1622628562156; 
 Wed, 02 Jun 2021 03:09:22 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/ttm: flip the switch for driver allocated resources
 v2
Date: Wed,  2 Jun 2021 12:09:14 +0200
Message-Id: <20210602100914.46246-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Instead of both driver and TTM allocating memory finalize embedding the
ttm_resource object as base into the driver backends.

v2: fix typo in vmwgfx grid mgr and double init in amdgpu_vram_mgr.c

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 44 ++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 60 +++++++++----------
 drivers/gpu/drm/drm_gem_vram_helper.c         |  3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
 drivers/gpu/drm/nouveau/nouveau_mem.c         | 11 ++--
 drivers/gpu/drm/nouveau/nouveau_mem.h         | 14 ++---
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 32 +++++-----
 drivers/gpu/drm/ttm/ttm_range_manager.c       | 23 +++----
 drivers/gpu/drm/ttm/ttm_resource.c            | 18 +-----
 drivers/gpu/drm/ttm/ttm_sys_manager.c         | 12 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 24 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 27 ++++-----
 include/drm/ttm/ttm_range_manager.h           |  3 +-
 include/drm/ttm/ttm_resource.h                | 43 ++++++-------
 16 files changed, 140 insertions(+), 189 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 29113f72bc39..194f9eecf89c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -40,8 +40,7 @@ to_gtt_mgr(struct ttm_resource_manager *man)
 static inline struct amdgpu_gtt_node *
 to_amdgpu_gtt_node(struct ttm_resource *res)
 {
-	return container_of(res->mm_node, struct amdgpu_gtt_node,
-			    base.mm_nodes[0]);
+	return container_of(res, struct amdgpu_gtt_node, base.base);
 }
 
 /**
@@ -102,13 +101,13 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
 /**
  * amdgpu_gtt_mgr_has_gart_addr - Check if mem has address space
  *
- * @mem: the mem object to check
+ * @res: the mem object to check
  *
  * Check if a mem object has already address space allocated.
  */
-bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem)
+bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(mem);
+	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
 
 	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
 }
@@ -126,19 +125,20 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem)
 static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_buffer_object *tbo,
 			      const struct ttm_place *place,
-			      struct ttm_resource *mem)
+			      struct ttm_resource **res)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
+	uint32_t num_pages = PFN_UP(tbo->base.size);
 	struct amdgpu_gtt_node *node;
 	int r;
 
 	spin_lock(&mgr->lock);
-	if ((tbo->resource == mem || tbo->resource->mem_type != TTM_PL_TT) &&
-	    atomic64_read(&mgr->available) < mem->num_pages) {
+	if (tbo->resource && tbo->resource->mem_type != TTM_PL_TT &&
+	    atomic64_read(&mgr->available) < num_pages) {
 		spin_unlock(&mgr->lock);
 		return -ENOSPC;
 	}
-	atomic64_sub(mem->num_pages, &mgr->available);
+	atomic64_sub(num_pages, &mgr->available);
 	spin_unlock(&mgr->lock);
 
 	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
@@ -154,29 +154,28 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm,
 						&node->base.mm_nodes[0],
-						mem->num_pages,
-						tbo->page_alignment, 0,
-						place->fpfn, place->lpfn,
+						num_pages, tbo->page_alignment,
+						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
 		if (unlikely(r))
 			goto err_free;
 
-		mem->start = node->base.mm_nodes[0].start;
+		node->base.base.start = node->base.mm_nodes[0].start;
 	} else {
 		node->base.mm_nodes[0].start = 0;
-		node->base.mm_nodes[0].size = mem->num_pages;
-		mem->start = AMDGPU_BO_INVALID_OFFSET;
+		node->base.mm_nodes[0].size = node->base.base.num_pages;
+		node->base.base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
-	mem->mm_node = &node->base.mm_nodes[0];
+	*res = &node->base.base;
 	return 0;
 
 err_free:
 	kfree(node);
 
 err_out:
-	atomic64_add(mem->num_pages, &mgr->available);
+	atomic64_add(num_pages, &mgr->available);
 
 	return r;
 }
@@ -190,21 +189,16 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
  * Free the allocated GTT again.
  */
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
-			       struct ttm_resource *mem)
+			       struct ttm_resource *res)
 {
+	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	struct amdgpu_gtt_node *node;
-
-	if (!mem->mm_node)
-		return;
-
-	node = to_amdgpu_gtt_node(mem);
 
 	spin_lock(&mgr->lock);
 	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
 		drm_mm_remove_node(&node->base.mm_nodes[0]);
 	spin_unlock(&mgr->lock);
-	atomic64_add(mem->num_pages, &mgr->available);
+	atomic64_add(res->num_pages, &mgr->available);
 
 	kfree(node);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 59723c3d5826..19c1384a133f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1296,7 +1296,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
 
-	if (bo->resource->mem_type != TTM_PL_VRAM || !bo->resource->mm_node ||
+	if (bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 40f2adf305bc..59e0fefb15aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -28,6 +28,7 @@
 
 #include <drm/drm_mm.h>
 #include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
@@ -53,7 +54,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 {
 	struct drm_mm_node *node;
 
-	if (!res || !res->mm_node) {
+	if (!res) {
 		cur->start = start;
 		cur->size = size;
 		cur->remaining = size;
@@ -63,7 +64,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 
 	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-	node = res->mm_node;
+	node = to_ttm_range_mgr_node(res)->mm_nodes;
 	while (start >= node->size << PAGE_SHIFT)
 		start -= node++->size << PAGE_SHIFT;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 5ebfaed37e47..9a6df02477ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -219,19 +219,20 @@ static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
 u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct ttm_resource *mem = bo->tbo.resource;
-	struct drm_mm_node *nodes = mem->mm_node;
-	unsigned pages = mem->num_pages;
+	struct ttm_resource *res = bo->tbo.resource;
+	unsigned pages = res->num_pages;
+	struct drm_mm_node *mm;
 	u64 usage;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
 
-	if (mem->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
+	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	for (usage = 0; nodes && pages; pages -= nodes->size, nodes++)
-		usage += amdgpu_vram_mgr_vis_size(adev, nodes);
+	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
+	for (usage = 0; pages; pages -= mm->size, mm++)
+		usage += amdgpu_vram_mgr_vis_size(adev, mm);
 
 	return usage;
 }
@@ -367,7 +368,7 @@ static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
 static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *tbo,
 			       const struct ttm_place *place,
-			       struct ttm_resource *mem)
+			       struct ttm_resource **res)
 {
 	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
@@ -388,7 +389,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
 	/* bail out quickly if there's likely not enough VRAM for this BO */
-	mem_bytes = (u64)mem->num_pages << PAGE_SHIFT;
+	mem_bytes = tbo->base.size;
 	if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
 		r = -ENOSPC;
 		goto error_sub;
@@ -406,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 #endif
 		pages_per_node = max_t(uint32_t, pages_per_node,
 				       tbo->page_alignment);
-		num_nodes = DIV_ROUND_UP(mem->num_pages, pages_per_node);
+		num_nodes = DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
 	}
 
 	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
@@ -422,8 +423,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		mode = DRM_MM_INSERT_HIGH;
 
-	mem->start = 0;
-	pages_left = mem->num_pages;
+	pages_left = node->base.num_pages;
 
 	/* Limit maximum size to 2GB due to SG table limitations */
 	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
@@ -451,7 +451,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		}
 
 		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
-		amdgpu_vram_mgr_virt_start(mem, &node->mm_nodes[i]);
+		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
 		pages_left -= pages;
 		++i;
 
@@ -461,10 +461,10 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	spin_unlock(&mgr->lock);
 
 	if (i == 1)
-		mem->placement |= TTM_PL_FLAG_CONTIGUOUS;
+		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	atomic64_add(vis_usage, &mgr->vis_usage);
-	mem->mm_node = &node->mm_nodes[0];
+	*res = &node->base;
 	return 0;
 
 error_free:
@@ -487,28 +487,22 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
  * Free the allocated VRAM again.
  */
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
-				struct ttm_resource *mem)
+				struct ttm_resource *res)
 {
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct ttm_range_mgr_node *node;
 	uint64_t usage = 0, vis_usage = 0;
-	unsigned pages = mem->num_pages;
-	struct drm_mm_node *nodes;
-
-	if (!mem->mm_node)
-		return;
-
-	node = to_ttm_range_mgr_node(mem);
-	nodes = &node->mm_nodes[0];
+	unsigned i, pages;
 
 	spin_lock(&mgr->lock);
-	while (pages) {
-		pages -= nodes->size;
-		drm_mm_remove_node(nodes);
-		usage += nodes->size << PAGE_SHIFT;
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, nodes);
-		++nodes;
+	for (i = 0, pages = res->num_pages; pages;
+	     pages -= node->mm_nodes[i].size, ++i) {
+		struct drm_mm_node *mm = &node->mm_nodes[i];
+
+		drm_mm_remove_node(mm);
+		usage += mm->size << PAGE_SHIFT;
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
 	}
 	amdgpu_vram_mgr_do_reserve(man);
 	spin_unlock(&mgr->lock);
@@ -533,7 +527,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
  * Allocate and fill a sg table from a VRAM allocation.
  */
 int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
-			      struct ttm_resource *mem,
+			      struct ttm_resource *res,
 			      u64 offset, u64 length,
 			      struct device *dev,
 			      enum dma_data_direction dir,
@@ -549,7 +543,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 		return -ENOMEM;
 
 	/* Determine the number of DRM_MM nodes to export */
-	amdgpu_res_first(mem, offset, length, &cursor);
+	amdgpu_res_first(res, offset, length, &cursor);
 	while (cursor.remaining) {
 		num_entries++;
 		amdgpu_res_next(&cursor, cursor.size);
@@ -569,7 +563,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 	 * and the number of bytes from it. Access the following
 	 * DRM_MM node(s) if more buffer needs to exported
 	 */
-	amdgpu_res_first(mem, offset, length, &cursor);
+	amdgpu_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
 		phys_addr_t phys = cursor.start + adev->gmc.aper_base;
 		size_t size = cursor.size;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 17a4c5d47b6a..2a1229b8364e 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -250,7 +250,8 @@ EXPORT_SYMBOL(drm_gem_vram_put);
 static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
 {
 	/* Keep TTM behavior for now, remove when drivers are audited */
-	if (WARN_ON_ONCE(!gbo->bo.resource->mm_node))
+	if (WARN_ON_ONCE(!gbo->bo.resource ||
+			 gbo->bo.resource->mem_type == TTM_PL_SYSTEM))
 		return 0;
 
 	return gbo->bo.resource->start;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3a0d9b3bf991..c3d20bc80022 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -918,12 +918,8 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 		}
 	}
 
-	if (new_reg) {
-		if (new_reg->mm_node)
-			nvbo->offset = (new_reg->start << PAGE_SHIFT);
-		else
-			nvbo->offset = 0;
-	}
+	if (new_reg)
+		nvbo->offset = (new_reg->start << PAGE_SHIFT);
 
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index a1049e9feee1..0de6549fb875 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -178,25 +178,24 @@ void
 nouveau_mem_del(struct ttm_resource *reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
-	if (!mem)
-		return;
+
 	nouveau_mem_fini(mem);
-	kfree(reg->mm_node);
-	reg->mm_node = NULL;
+	kfree(mem);
 }
 
 int
 nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
-		struct ttm_resource *reg)
+		struct ttm_resource **res)
 {
 	struct nouveau_mem *mem;
 
 	if (!(mem = kzalloc(sizeof(*mem), GFP_KERNEL)))
 		return -ENOMEM;
+
 	mem->cli = cli;
 	mem->kind = kind;
 	mem->comp = comp;
 
-	reg->mm_node = mem;
+	*res = &mem->base;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 3a6a1be2ed52..2c01166a90f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -6,12 +6,6 @@ struct ttm_tt;
 #include <nvif/mem.h>
 #include <nvif/vmm.h>
 
-static inline struct nouveau_mem *
-nouveau_mem(struct ttm_resource *reg)
-{
-	return reg->mm_node;
-}
-
 struct nouveau_mem {
 	struct ttm_resource base;
 	struct nouveau_cli *cli;
@@ -21,8 +15,14 @@ struct nouveau_mem {
 	struct nvif_vma vma[2];
 };
 
+static inline struct nouveau_mem *
+nouveau_mem(struct ttm_resource *reg)
+{
+	return container_of(reg, struct nouveau_mem, base);
+}
+
 int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
-		    struct ttm_resource *);
+		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource *);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1ac2417effc0..f4c2e46b6fe1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -45,7 +45,7 @@ static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
-			 struct ttm_resource *reg)
+			 struct ttm_resource **res)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
@@ -54,15 +54,15 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 	if (drm->client.device.info.ram_size == 0)
 		return -ENOMEM;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
+	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
-	ttm_resource_init(bo, place, reg->mm_node);
+	ttm_resource_init(bo, place, *res);
 
-	ret = nouveau_mem_vram(reg, nvbo->contig, nvbo->page);
+	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
 	if (ret) {
-		nouveau_mem_del(reg);
+		nouveau_mem_del(*res);
 		return ret;
 	}
 
@@ -78,18 +78,18 @@ static int
 nouveau_gart_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
-			 struct ttm_resource *reg)
+			 struct ttm_resource **res)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	int ret;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
+	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
-	ttm_resource_init(bo, place, reg->mm_node);
-	reg->start = 0;
+	ttm_resource_init(bo, place, *res);
+	(*res)->start = 0;
 	return 0;
 }
 
@@ -102,27 +102,27 @@ static int
 nv04_gart_manager_new(struct ttm_resource_manager *man,
 		      struct ttm_buffer_object *bo,
 		      const struct ttm_place *place,
-		      struct ttm_resource *reg)
+		      struct ttm_resource **res)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_mem *mem;
 	int ret;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
-	mem = nouveau_mem(reg);
+	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
-	ttm_resource_init(bo, place, reg->mm_node);
+	mem = nouveau_mem(*res);
+	ttm_resource_init(bo, place, *res);
 	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
-			   (long)reg->num_pages << PAGE_SHIFT, &mem->vma[0]);
+			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
 	if (ret) {
-		nouveau_mem_del(reg);
+		nouveau_mem_del(*res);
 		return ret;
 	}
 
-	reg->start = mem->vma[0].addr >> PAGE_SHIFT;
+	(*res)->start = mem->vma[0].addr >> PAGE_SHIFT;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ce5d07ca384c..c32e1aee2481 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -58,7 +58,7 @@ to_range_manager(struct ttm_resource_manager *man)
 static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *bo,
 			       const struct ttm_place *place,
-			       struct ttm_resource *mem)
+			       struct ttm_resource **res)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
 	struct ttm_range_mgr_node *node;
@@ -83,37 +83,30 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  mem->num_pages, bo->page_alignment, 0,
+					  node->base.num_pages,
+					  bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
 
-	if (unlikely(ret)) {
+	if (unlikely(ret))
 		kfree(node);
-	} else {
-		mem->mm_node = &node->mm_nodes[0];
-		mem->start = node->mm_nodes[0].start;
-	}
+	else
+		node->base.start = node->mm_nodes[0].start;
 
 	return ret;
 }
 
 static void ttm_range_man_free(struct ttm_resource_manager *man,
-			       struct ttm_resource *mem)
+			       struct ttm_resource *res)
 {
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct ttm_range_manager *rman = to_range_manager(man);
-	struct ttm_range_mgr_node *node;
-
-	if (!mem->mm_node)
-		return;
-
-	node = to_ttm_range_mgr_node(mem);
 
 	spin_lock(&rman->lock);
 	drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&rman->lock);
 
 	kfree(node);
-	mem->mm_node = NULL;
 }
 
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2a51ace17614..2a68145572cc 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,7 +29,6 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res)
 {
-	res->mm_node = NULL;
 	res->start = 0;
 	res->num_pages = PFN_UP(bo->base.size);
 	res->mem_type = place->mem_type;
@@ -47,22 +46,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 {
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, place->mem_type);
-	struct ttm_resource *res;
-	int r;
-
-	res = kmalloc(sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return -ENOMEM;
-
-	ttm_resource_init(bo, place, res);
-	r = man->func->alloc(man, bo, place, res);
-	if (r) {
-		kfree(res);
-		return r;
-	}
 
-	*res_ptr = res;
-	return 0;
+	return man->func->alloc(man, bo, place, res_ptr);
 }
 
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
@@ -74,7 +59,6 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 
 	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
 	man->func->free(man, *res);
-	kfree(*res);
 	*res = NULL;
 }
 EXPORT_SYMBOL(ttm_resource_free);
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 2b75f493c3c9..63aca52f75e1 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -10,20 +10,20 @@
 static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
 			     struct ttm_buffer_object *bo,
 			     const struct ttm_place *place,
-			     struct ttm_resource *mem)
+			     struct ttm_resource **res)
 {
-	mem->mm_node = kzalloc(sizeof(*mem), GFP_KERNEL);
-	if (!mem->mm_node)
+	*res = kzalloc(sizeof(**res), GFP_KERNEL);
+	if (!*res)
 		return -ENOMEM;
 
-	ttm_resource_init(bo, place, mem->mm_node);
+	ttm_resource_init(bo, place, *res);
 	return 0;
 }
 
 static void ttm_sys_man_free(struct ttm_resource_manager *man,
-			     struct ttm_resource *mem)
+			     struct ttm_resource *res)
 {
-	kfree(mem->mm_node);
+	kfree(res);
 }
 
 static const struct ttm_resource_manager_func ttm_sys_manager_func = {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 82a5e6489810..28ceb749a733 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -52,16 +52,16 @@ static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_resource_manager *ma
 static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
-				  struct ttm_resource *mem)
+				  struct ttm_resource **res)
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 	int id;
 
-	mem->mm_node = kmalloc(sizeof(*mem), GFP_KERNEL);
-	if (!mem->mm_node)
+	*res = kmalloc(sizeof(**res), GFP_KERNEL);
+	if (!*res)
 		return -ENOMEM;
 
-	ttm_resource_init(bo, place, mem->mm_node);
+	ttm_resource_init(bo, place, *res);
 
 	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
 	if (id < 0)
@@ -70,34 +70,34 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	spin_lock(&gman->lock);
 
 	if (gman->max_gmr_pages > 0) {
-		gman->used_gmr_pages += mem->num_pages;
+		gman->used_gmr_pages += (*res)->num_pages;
 		if (unlikely(gman->used_gmr_pages > gman->max_gmr_pages))
 			goto nospace;
 	}
 
-	mem->mm_node = gman;
-	mem->start = id;
+	(*res)->start = id;
 
 	spin_unlock(&gman->lock);
 	return 0;
 
 nospace:
-	gman->used_gmr_pages -= mem->num_pages;
+	gman->used_gmr_pages -= (*res)->num_pages;
 	spin_unlock(&gman->lock);
 	ida_free(&gman->gmr_ida, id);
+	kfree(*res);
 	return -ENOSPC;
 }
 
 static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
-				   struct ttm_resource *mem)
+				   struct ttm_resource *res)
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
-	ida_free(&gman->gmr_ida, mem->start);
+	ida_free(&gman->gmr_ida, res->start);
 	spin_lock(&gman->lock);
-	gman->used_gmr_pages -= mem->num_pages;
+	gman->used_gmr_pages -= res->num_pages;
 	spin_unlock(&gman->lock);
-	kfree(mem->mm_node);
+	kfree(res);
 }
 
 static const struct ttm_resource_manager_func vmw_gmrid_manager_func;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 8765835696ac..2a3d3468e4e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -51,7 +51,7 @@ static int vmw_thp_insert_aligned(struct ttm_buffer_object *bo,
 static int vmw_thp_get_node(struct ttm_resource_manager *man,
 			    struct ttm_buffer_object *bo,
 			    const struct ttm_place *place,
-			    struct ttm_resource *mem)
+			    struct ttm_resource **res)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
@@ -78,26 +78,27 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 	spin_lock(&rman->lock);
 	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)) {
 		align_pages = (HPAGE_PUD_SIZE >> PAGE_SHIFT);
-		if (mem->num_pages >= align_pages) {
+		if (node->base.num_pages >= align_pages) {
 			ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
-						     align_pages, place, mem,
-						     lpfn, mode);
+						     align_pages, place,
+						     &node->base, lpfn, mode);
 			if (!ret)
 				goto found_unlock;
 		}
 	}
 
 	align_pages = (HPAGE_PMD_SIZE >> PAGE_SHIFT);
-	if (mem->num_pages >= align_pages) {
+	if (node->base.num_pages >= align_pages) {
 		ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
-					     align_pages, place, mem, lpfn,
-					     mode);
+					     align_pages, place, &node->base,
+					     lpfn, mode);
 		if (!ret)
 			goto found_unlock;
 	}
 
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  mem->num_pages, bo->page_alignment, 0,
+					  node->base.num_pages,
+					  bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 found_unlock:
 	spin_unlock(&rman->lock);
@@ -105,20 +106,18 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 	if (unlikely(ret)) {
 		kfree(node);
 	} else {
-		mem->mm_node = &node->mm_nodes[0];
-		mem->start = node->mm_nodes[0].start;
+		node->base.start = node->mm_nodes[0].start;
+		*res = &node->base;
 	}
 
 	return ret;
 }
 
-
-
 static void vmw_thp_put_node(struct ttm_resource_manager *man,
-			     struct ttm_resource *mem)
+			     struct ttm_resource *res)
 {
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct vmw_thp_manager *rman = to_thp_manager(man);
-	struct ttm_range_mgr_node * node = mem->mm_node;
 
 	spin_lock(&rman->lock);
 	drm_mm_remove_node(&node->mm_nodes[0]);
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 983f452ce54b..22b6fa42ac20 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -30,8 +30,7 @@ struct ttm_range_mgr_node {
 static inline struct ttm_range_mgr_node *
 to_ttm_range_mgr_node(struct ttm_resource *res)
 {
-	return container_of(res->mm_node, struct ttm_range_mgr_node,
-			    mm_nodes[0]);
+	return container_of(res, struct ttm_range_mgr_node, base);
 }
 
 int ttm_range_man_init(struct ttm_device *bdev,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 803e4875d779..4abb95b9fd11 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -45,46 +45,38 @@ struct ttm_resource_manager_func {
 	 *
 	 * @man: Pointer to a memory type manager.
 	 * @bo: Pointer to the buffer object we're allocating space for.
-	 * @placement: Placement details.
-	 * @flags: Additional placement flags.
-	 * @mem: Pointer to a struct ttm_resource to be filled in.
+	 * @place: Placement details.
+	 * @res: Resulting pointer to the ttm_resource.
 	 *
 	 * This function should allocate space in the memory type managed
-	 * by @man. Placement details if
-	 * applicable are given by @placement. If successful,
-	 * @mem::mm_node should be set to a non-null value, and
-	 * @mem::start should be set to a value identifying the beginning
+	 * by @man. Placement details if applicable are given by @place. If
+	 * successful, a filled in ttm_resource object should be returned in
+	 * @res. @res::start should be set to a value identifying the beginning
 	 * of the range allocated, and the function should return zero.
-	 * If the memory region accommodate the buffer object, @mem::mm_node
-	 * should be set to NULL, and the function should return 0.
+	 * If the manager can't fulfill the request -ENOSPC should be returned.
 	 * If a system error occurred, preventing the request to be fulfilled,
 	 * the function should return a negative error code.
 	 *
-	 * Note that @mem::mm_node will only be dereferenced by
-	 * struct ttm_resource_manager functions and optionally by the driver,
-	 * which has knowledge of the underlying type.
-	 *
-	 * This function may not be called from within atomic context, so
-	 * an implementation can and must use either a mutex or a spinlock to
-	 * protect any data structures managing the space.
+	 * This function may not be called from within atomic context and needs
+	 * to take care of its own locking to protect any data structures
+	 * managing the space.
 	 */
 	int  (*alloc)(struct ttm_resource_manager *man,
 		      struct ttm_buffer_object *bo,
 		      const struct ttm_place *place,
-		      struct ttm_resource *mem);
+		      struct ttm_resource **res);
 
 	/**
 	 * struct ttm_resource_manager_func member free
 	 *
 	 * @man: Pointer to a memory type manager.
-	 * @mem: Pointer to a struct ttm_resource to be filled in.
+	 * @res: Pointer to a struct ttm_resource to be freed.
 	 *
-	 * This function frees memory type resources previously allocated
-	 * and that are identified by @mem::mm_node and @mem::start. May not
-	 * be called from within atomic context.
+	 * This function frees memory type resources previously allocated.
+	 * May not be called from within atomic context.
 	 */
 	void (*free)(struct ttm_resource_manager *man,
-		     struct ttm_resource *mem);
+		     struct ttm_resource *res);
 
 	/**
 	 * struct ttm_resource_manager_func member debug
@@ -158,9 +150,9 @@ struct ttm_bus_placement {
 /**
  * struct ttm_resource
  *
- * @mm_node: Memory manager node.
- * @size: Requested size of memory region.
- * @num_pages: Actual size of memory region in pages.
+ * @start: Start of the allocation.
+ * @num_pages: Actual size of resource in pages.
+ * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
  *
@@ -168,7 +160,6 @@ struct ttm_bus_placement {
  * buffer object.
  */
 struct ttm_resource {
-	void *mm_node;
 	unsigned long start;
 	unsigned long num_pages;
 	uint32_t mem_type;
-- 
2.25.1

