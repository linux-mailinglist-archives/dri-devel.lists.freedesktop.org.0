Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6D7DEBCB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315910E812;
	Thu,  2 Nov 2023 04:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36C10E7F9;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4PqUq6kMXcSWQgJfyfvlfN+oe1xQjTtJBgXUXi0IZtw=;
 b=kiWLSm4ZRft6IcF5DWDPMvLOQv8yI0LaJM1D+qGSWMoGdBX8YO9Z6Sbj
 w7LCRgotEf4hYOde0E3b0WS/FBi/n4ss437Ci4JUGncdYqLa62jm90N9c
 e9otI4WxIg+UDcHb1lcNEv3eZLY9IDty/1oRmOEDh9ryFSSHKpqqwS/PB
 WRnOLlx7fVeTHD7RssmZhK4+qj978/ZMegjIr1Xhzpudw9+ayGTqWCHuh
 Dz8077ZFrd1ewHFonKkZKs7dlZz7adPRAOgxwR8l/I+b8jBxQLBXpPGRt
 68zBmW5yhruVaBZ3KUFqyhyCC3xEG9OgOx9DB42fnvoIqu/eE9XPB88W3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930935"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930935"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762644"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762644"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 11/11] drm/ttm: Write ttm functions using drm lru manager
 functions
Date: Thu,  2 Nov 2023 00:33:06 -0400
Message-Id: <20231102043306.2931989-12-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
MIME-Version: 1.0
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace struct ttm_resource::lru with drm lru entity. Replace
struct ttm_resource_manager::lru[] with drm lru manager. Remove
ttm_lru_bulk_move functions and definitions as those are moved
to drm lru manager.

Some of ttm resource, ttm bo and ttm device functions are re-written
using drm lru manager functions.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                |  20 +--
 drivers/gpu/drm/ttm/ttm_bo_util.c           |  20 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c             |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c            |  10 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c     |   2 +-
 drivers/gpu/drm/ttm/ttm_resource.c          | 155 ++++----------------
 drivers/gpu/drm/xe/xe_bo.c                  |  44 +++---
 drivers/gpu/drm/xe/xe_bo.h                  |   3 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             |   4 +-
 drivers/gpu/drm/xe/xe_exec.c                |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   6 +-
 drivers/gpu/drm/xe/xe_res_cursor.h          |  10 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c         |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |  12 +-
 drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   2 +-
 include/drm/ttm/ttm_bo.h                    |   4 +-
 include/drm/ttm/ttm_resource.h              |  59 ++------
 21 files changed, 112 insertions(+), 253 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 747bcad86d5d..c977c00e986a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -369,7 +369,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm)
 {
 	spin_lock(adev->mman.bdev.lru_lock);
-	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+	drm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	spin_unlock(adev->mman.bdev.lru_lock);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 204ab13184ed..fec545b5d154 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -337,7 +337,7 @@ struct amdgpu_vm {
 	struct amdgpu_task_info task_info;
 
 	/* Store positions of group of BOs */
-	struct ttm_lru_bulk_move lru_bulk_move;
+	struct drm_lru_bulk_move lru_bulk_move;
 	/* Flag to indicate if VM is used for compute */
 	bool			is_compute_context;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index b1b423b68cdf..a62ca31b55df 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -90,7 +90,7 @@ static void ttm_device_fini_basic(struct kunit *test)
 	ttm_device_fini(ttm_dev);
 
 	KUNIT_ASSERT_FALSE(test, man->use_type);
-	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[0]));
+	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru_mgr->lru[0]));
 	KUNIT_ASSERT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9ec7a246e2ad..d44ca5e51dff 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -92,11 +92,11 @@ EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
  * resulting in much less overhead of maintaining the LRU.
  * The only requirement is that the resources stay together on the LRU and are
  * never separated. This is enforces by setting the bulk_move structure on a BO.
- * ttm_lru_bulk_move_tail() should be used to move all resources to the tail of
+ * drm_lru_bulk_move_tail() should be used to move all resources to the tail of
  * their LRU list.
  */
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
-			  struct ttm_lru_bulk_move *bulk)
+			  struct drm_lru_bulk_move *bulk)
 {
 	dma_resv_assert_held(bo->base.resv);
 
@@ -122,8 +122,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	bool old_use_tt, new_use_tt;
 	int ret;
 
-	old_use_tt = !bo->resource || ttm_manager_type(bdev, bo->resource->mem_type)->use_tt;
-	new_use_tt = ttm_manager_type(bdev, mem->mem_type)->use_tt;
+	old_use_tt = !bo->resource || ttm_manager_type(bdev, bo->resource->lru_entity.mem_type)->use_tt;
+	new_use_tt = ttm_manager_type(bdev, mem->lru_entity.mem_type)->use_tt;
 
 	ttm_bo_unmap_virtual(bo);
 
@@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		if (ret)
 			goto out_err;
 
-		if (mem->mem_type != TTM_PL_SYSTEM) {
+		if (mem->lru_entity.mem_type != TTM_PL_SYSTEM) {
 			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 			if (ret)
 				goto out_err;
@@ -492,7 +492,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	struct ttm_device *bdev = bo->bdev;
 
 	dma_resv_assert_held(bo->base.resv);
-	if (bo->resource->mem_type == TTM_PL_SYSTEM)
+	if (bo->resource->lru_entity.mem_type == TTM_PL_SYSTEM)
 		return true;
 
 	/* Don't evict this BO if it's outside of the
@@ -540,7 +540,7 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 			*busy = !ret;
 	}
 
-	if (ret && place && (bo->resource->mem_type != place->mem_type ||
+	if (ret && place && (bo->resource->lru_entity.mem_type != place->mem_type ||
 		!bo->bdev->funcs->eviction_valuable(bo, place))) {
 		ret = false;
 		if (*locked) {
@@ -1039,7 +1039,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * We might need to add a TTM.
 	 */
-	if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
+	if (!bo->resource || bo->resource->lru_entity.mem_type == TTM_PL_SYSTEM) {
 		ret = ttm_tt_create(bo, true);
 		if (ret)
 			return ret;
@@ -1259,7 +1259,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * as an indication that we're about to swap out.
 	 */
 	memset(&place, 0, sizeof(place));
-	place.mem_type = bo->resource->mem_type;
+	place.mem_type = bo->resource->lru_entity.mem_type;
 	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
 		return -EBUSY;
 
@@ -1284,7 +1284,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	/*
 	 * Move to system cached
 	 */
-	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
+	if (bo->resource->lru_entity.mem_type != TTM_PL_SYSTEM) {
 		struct ttm_resource *evict_mem;
 		struct ttm_place hop;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fd9fd3d15101..7176fbfca5eb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -145,7 +145,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 {
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *dst_man =
-		ttm_manager_type(bo->bdev, dst_mem->mem_type);
+		ttm_manager_type(bo->bdev, dst_mem->lru_entity.mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource *src_mem = bo->resource;
 	struct ttm_resource_manager *src_man;
@@ -160,7 +160,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	if (WARN_ON(!src_mem))
 		return -EINVAL;
 
-	src_man = ttm_manager_type(bdev, src_mem->mem_type);
+	src_man = ttm_manager_type(bdev, src_mem->lru_entity.mem_type);
 	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 		    dst_man->use_tt)) {
 		ret = ttm_tt_populate(bdev, ttm, ctx);
@@ -184,7 +184,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 
 	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
+		ttm_move_memcpy(clear, PFN_UP(dst_mem->lru_entity.size), dst_iter, src_iter);
 
 	if (!src_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
@@ -293,7 +293,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 	struct ttm_resource_manager *man;
 	enum ttm_caching caching;
 
-	man = ttm_manager_type(bo->bdev, res->mem_type);
+	man = ttm_manager_type(bo->bdev, res->lru_entity.mem_type);
 	caching = man->use_tt ? bo->ttm->caching : res->bus.caching;
 
 	return ttm_prot_from_caching(caching, tmp);
@@ -393,9 +393,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 
 	map->virtual = NULL;
 	map->bo = bo;
-	if (num_pages > PFN_UP(bo->resource->size))
+	if (num_pages > PFN_UP(bo->resource->lru_entity.size))
 		return -EINVAL;
-	if ((start_page + num_pages) > PFN_UP(bo->resource->size))
+	if ((start_page + num_pages) > PFN_UP(bo->resource->lru_entity.size))
 		return -EINVAL;
 
 	ret = ttm_mem_io_reserve(bo->bdev, bo->resource);
@@ -607,7 +607,7 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *from;
 
-	from = ttm_manager_type(bdev, bo->resource->mem_type);
+	from = ttm_manager_type(bdev, bo->resource->lru_entity.mem_type);
 
 	/**
 	 * BO doesn't have a TTM we need to bind/unbind. Just remember
@@ -646,8 +646,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem)
 {
 	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->resource->mem_type);
-	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->resource->lru_entity.mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->lru_entity.mem_type);
 	int ret = 0;
 
 	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
@@ -680,7 +680,7 @@ void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem)
 {
 	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->lru_entity.mem_type);
 	int ret;
 
 	ret = ttm_bo_wait_free_node(bo, man->use_tt);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..0e550430fa85 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -421,7 +421,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	if (ret)
 		return ret;
 
-	switch (bo->resource->mem_type) {
+	switch (bo->resource->lru_entity.mem_type) {
 	case TTM_PL_SYSTEM:
 		fallthrough;
 	case TTM_PL_TT:
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 881662d69aba..7e5bfdffc08d 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -250,7 +250,7 @@ void ttm_device_fini(struct ttm_device *bdev)
 
 	spin_lock(bdev->lru_lock);
 	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i)
-		if (list_empty(&man->lru[0]))
+		if (list_empty(&man->lru_mgr->lru[0]))
 			pr_debug("Swap list %d was clean\n", i);
 	spin_unlock(bdev->lru_lock);
 
@@ -263,16 +263,18 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 					      struct list_head *list)
 {
 	struct ttm_resource *res;
+	struct drm_lru_entity *entity;
 
 	spin_lock(bdev->lru_lock);
-	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
+	while ((entity = list_first_entry_or_null(list, typeof(*entity), lru))){
+		res = container_of(entity, struct ttm_resource, lru_entity);
 		struct ttm_buffer_object *bo = res->bo;
 
 		/* Take ref against racing releases once lru_lock is unlocked */
 		if (!ttm_bo_get_unless_zero(bo))
 			continue;
 
-		list_del_init(&res->lru);
+		list_del_init(&entity->lru);
 		spin_unlock(bdev->lru_lock);
 
 		if (bo->ttm)
@@ -297,7 +299,7 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
 			continue;
 
 		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j)
-			ttm_device_clear_lru_dma_mappings(bdev, &man->lru[j]);
+			ttm_device_clear_lru_dma_mappings(bdev, &man->lru_mgr->lru[j]);
 	}
 }
 EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 898ede7d25c4..afdea64ffc10 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -84,7 +84,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
+					  PFN_UP(node->base.lru_entity.size),
 					  bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 0c6e0dbeff07..b6ff3b9e0614 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -30,108 +30,12 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
 
-/**
- * ttm_lru_bulk_move_init - initialize a bulk move structure
- * @bulk: the structure to init
- *
- * For now just memset the structure to zero.
- */
-void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
-{
-	memset(bulk, 0, sizeof(*bulk));
-}
-EXPORT_SYMBOL(ttm_lru_bulk_move_init);
-
-/**
- * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
- *
- * @bulk: bulk move structure
- *
- * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
- * resource order never changes. Should be called with &drm_device.lru_lock held.
- */
-void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
-{
-	unsigned i, j;
-
-	for (i = 0; i < DRM_NUM_MEM_TYPES; ++i) {
-		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j) {
-			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
-			struct ttm_resource_manager *man;
-
-			if (!pos->first)
-				continue;
-
-			lockdep_assert_held(pos->first->bo->bdev->lru_lock);
-			dma_resv_assert_held(pos->first->bo->base.resv);
-			dma_resv_assert_held(pos->last->bo->base.resv);
-
-			man = ttm_manager_type(pos->first->bo->bdev, i);
-			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
-					    &pos->last->lru);
-		}
-	}
-}
-EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
-
-/* Return the bulk move pos object for this resource */
-static struct ttm_lru_bulk_move_pos *
-ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
-{
-	return &bulk->pos[res->mem_type][res->bo->priority];
-}
-
-/* Move the resource to the tail of the bulk move range */
-static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
-				       struct ttm_resource *res)
-{
-	if (pos->last != res) {
-		if (pos->first == res)
-			pos->first = list_next_entry(res, lru);
-		list_move(&res->lru, &pos->last->lru);
-		pos->last = res;
-	}
-}
-
-/* Add the resource to a bulk_move cursor */
-static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
-				  struct ttm_resource *res)
-{
-	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
-
-	if (!pos->first) {
-		pos->first = res;
-		pos->last = res;
-	} else {
-		ttm_lru_bulk_move_pos_tail(pos, res);
-	}
-}
-
-/* Remove the resource from a bulk_move range */
-static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
-				  struct ttm_resource *res)
-{
-	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
-
-	if (unlikely(WARN_ON(!pos->first || !pos->last) ||
-		     (pos->first == res && pos->last == res))) {
-		pos->first = NULL;
-		pos->last = NULL;
-	} else if (pos->first == res) {
-		pos->first = list_next_entry(res, lru);
-	} else if (pos->last == res) {
-		pos->last = list_prev_entry(res, lru);
-	} else {
-		list_move(&res->lru, &pos->last->lru);
-	}
-}
-
 /* Add the resource to a bulk move if the BO is configured for it */
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
 	if (bo->bulk_move && !bo->pin_count)
-		ttm_lru_bulk_move_add(bo->bulk_move, res);
+		drm_lru_add_bulk_move(&res->lru_entity, bo->bulk_move);
 }
 
 /* Remove the resource from a bulk move if the BO is configured for it */
@@ -139,7 +43,7 @@ void ttm_resource_del_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
 	if (bo->bulk_move && !bo->pin_count)
-		ttm_lru_bulk_move_del(bo->bulk_move, res);
+		drm_lru_del_bulk_move(&res->lru_entity, bo->bulk_move);
 }
 
 /* Move a resource to the LRU or bulk tail */
@@ -150,20 +54,16 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 
 	lockdep_assert_held(bo->bdev->lru_lock);
 
-	if (bo->pin_count) {
-		list_move_tail(&res->lru, &bdev->pinned);
+	if (bo->pin_count)
+		list_move_tail(&res->lru_entity.lru, &bdev->pinned);
 
-	} else	if (bo->bulk_move) {
-		struct ttm_lru_bulk_move_pos *pos =
-			ttm_lru_bulk_move_pos(bo->bulk_move, res);
+	else	if (bo->bulk_move) {
+		struct drm_lru_bulk_move_range *range =
+			&bo->bulk_move->range[res->lru_entity.mem_type][res->lru_entity.priority];
 
-		ttm_lru_bulk_move_pos_tail(pos, res);
-	} else {
-		struct ttm_resource_manager *man;
-
-		man = ttm_manager_type(bdev, res->mem_type);
-		list_move_tail(&res->lru, &man->lru[bo->priority]);
-	}
+		drm_lru_bulk_move_range_tail(range, &res->lru_entity);
+	} else
+		drm_lru_move_to_tail(&res->lru_entity);
 }
 
 /**
@@ -181,22 +81,22 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man;
 
 	res->start = 0;
-	res->size = bo->base.size;
-	res->mem_type = place->mem_type;
 	res->placement = place->flags;
 	res->bus.addr = NULL;
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+	drm_lru_entity_init(&res->lru_entity, bo->base.dev, place->mem_type,
+			bo->base.size, bo->priority, &ttm_evict_func);
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(bo->bdev->lru_lock);
 	if (bo->pin_count)
-		list_add_tail(&res->lru, &bo->bdev->pinned);
+		list_add_tail(&res->lru_entity.lru, &bo->bdev->pinned);
 	else
-		list_add_tail(&res->lru, &man->lru[bo->priority]);
-	man->usage += res->size;
+		drm_lru_add_entity(&res->lru_entity, man->lru_mgr, bo->priority);
+	man->usage += res->lru_entity.size;
 	spin_unlock(bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
@@ -217,8 +117,8 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 	struct ttm_device *bdev = man->bdev;
 
 	spin_lock(bdev->lru_lock);
-	list_del_init(&res->lru);
-	man->usage -= res->size;
+	drm_lru_remove_entity(&res->lru_entity, man->lru_mgr);
+	man->usage -= res->lru_entity.size;
 	spin_unlock(bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
@@ -251,7 +151,7 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 	spin_lock(bo->bdev->lru_lock);
 	ttm_resource_del_bulk_move(*res, bo);
 	spin_unlock(bo->bdev->lru_lock);
-	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
+	man = ttm_manager_type(bo->bdev, (*res)->lru_entity.mem_type);
 	man->func->free(man, *res);
 	*res = NULL;
 }
@@ -280,7 +180,7 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 	if (!res)
 		return false;
 
-	man = ttm_manager_type(bdev, res->mem_type);
+	man = ttm_manager_type(bdev, res->lru_entity.mem_type);
 	if (!place || !man->func->intersects)
 		return true;
 
@@ -309,7 +209,7 @@ bool ttm_resource_compatible(struct ttm_device *bdev,
 	if (!res || !place)
 		return false;
 
-	man = ttm_manager_type(bdev, res->mem_type);
+	man = ttm_manager_type(bdev, res->lru_entity.mem_type);
 	if (!man->func->compatible)
 		return true;
 
@@ -333,7 +233,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
-		if ((res->mem_type == heap->mem_type) &&
+		if ((res->lru_entity.mem_type == heap->mem_type) &&
 		    (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
 		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
 			return true;
@@ -386,15 +286,10 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
 			       uint64_t size)
 {
-	unsigned i;
-
 	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = size;
 	man->usage = 0;
-
-	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i)
-		INIT_LIST_HEAD(&man->lru[i]);
 	man->move = NULL;
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
@@ -426,7 +321,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 
 	spin_lock(bdev->lru_lock);
 	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i) {
-		while (!list_empty(&man->lru[i])) {
+		while (!list_empty(&man->lru_mgr->lru[i])) {
 			spin_unlock(bdev->lru_lock);
 			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
 						  NULL);
@@ -622,10 +517,10 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 		if (mem->bus.caching == ttm_write_combined)
 			iosys_map_set_vaddr_iomem(&iter_io->dmap,
 						  ioremap_wc(mem->bus.offset,
-							     mem->size));
+							     mem->lru_entity.size));
 		else if (mem->bus.caching == ttm_cached)
 			iosys_map_set_vaddr(&iter_io->dmap,
-					    memremap(mem->bus.offset, mem->size,
+					    memremap(mem->bus.offset, mem->lru_entity.size,
 						     MEMREMAP_WB |
 						     MEMREMAP_WT |
 						     MEMREMAP_WC));
@@ -634,7 +529,7 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 		if (iosys_map_is_null(&iter_io->dmap))
 			iosys_map_set_vaddr_iomem(&iter_io->dmap,
 						  ioremap(mem->bus.offset,
-							  mem->size));
+							  mem->lru_entity.size));
 
 		if (iosys_map_is_null(&iter_io->dmap)) {
 			ret = -ENOMEM;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 827f798cccc0..1cae43532eac 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -61,12 +61,12 @@ bool mem_type_is_vram(u32 mem_type)
 
 static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
 {
-	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
+	return res->lru_entity.mem_type == XE_PL_STOLEN && IS_DGFX(xe);
 }
 
 static bool resource_is_vram(struct ttm_resource *res)
 {
-	return mem_type_is_vram(res->mem_type);
+	return mem_type_is_vram(res->lru_entity.mem_type);
 }
 
 bool xe_bo_is_vram(struct xe_bo *bo)
@@ -77,7 +77,7 @@ bool xe_bo_is_vram(struct xe_bo *bo)
 
 bool xe_bo_is_stolen(struct xe_bo *bo)
 {
-	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
+	return bo->ttm.resource->lru_entity.mem_type == XE_PL_STOLEN;
 }
 
 /**
@@ -118,7 +118,7 @@ mem_type_to_tile(struct xe_device *xe, u32 mem_type)
  */
 struct xe_tile *xe_bo_to_tile(struct xe_bo *bo)
 {
-	return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->mem_type);
+	return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->lru_entity.mem_type);
 }
 
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
@@ -259,7 +259,7 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	 */
 
 	bo = ttm_to_xe_bo(tbo);
-	switch (tbo->resource->mem_type) {
+	switch (tbo->resource->lru_entity.mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
 	case XE_PL_STOLEN:
@@ -410,17 +410,17 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 {
 	struct xe_device *xe = ttm_to_xe_device(bdev);
 
-	switch (mem->mem_type) {
+	switch (mem->lru_entity.mem_type) {
 	case XE_PL_SYSTEM:
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_tile *tile = mem_type_to_tile(xe, mem->mem_type);
+		struct xe_tile *tile = mem_type_to_tile(xe, mem->lru_entity.mem_type);
 		struct xe_ttm_vram_mgr_resource *vres =
 			to_xe_ttm_vram_mgr_resource(mem);
 
-		if (vres->used_visible_size < mem->size)
+		if (vres->used_visible_size < mem->lru_entity.size)
 			return -EINVAL;
 
 		mem->bus.offset = mem->start << PAGE_SHIFT;
@@ -546,7 +546,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	XE_WARN_ON(!attach);
 	XE_WARN_ON(!ttm_bo->ttm);
 
-	if (new_res->mem_type == XE_PL_SYSTEM)
+	if (new_res->lru_entity.mem_type == XE_PL_SYSTEM)
 		goto out;
 
 	if (ttm_bo->sg) {
@@ -620,7 +620,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_resource *old_mem = ttm_bo->resource;
-	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
+	u32 old_mem_type = old_mem ? old_mem->lru_entity.mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
 	struct xe_tile *tile = NULL;
 	struct dma_fence *fence;
@@ -652,7 +652,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	if ((move_lacks_source && !needs_clear) ||
 	    (old_mem_type == XE_PL_SYSTEM &&
-	     new_mem->mem_type == XE_PL_TT)) {
+	     new_mem->lru_entity.mem_type == XE_PL_TT)) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
 	}
@@ -662,7 +662,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
 	 */
 	if (old_mem_type == XE_PL_TT &&
-	    new_mem->mem_type == XE_PL_TT) {
+	    new_mem->lru_entity.mem_type == XE_PL_TT) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
 	}
@@ -674,7 +674,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (old_mem_type == XE_PL_TT &&
-	    new_mem->mem_type == XE_PL_SYSTEM) {
+	    new_mem->lru_entity.mem_type == XE_PL_SYSTEM) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
 						     DMA_RESV_USAGE_BOOKKEEP,
 						     true,
@@ -690,7 +690,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	if (!move_lacks_source &&
 	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
 	     (mem_type_is_vram(old_mem_type) &&
-	      new_mem->mem_type == XE_PL_SYSTEM))) {
+	      new_mem->lru_entity.mem_type == XE_PL_SYSTEM))) {
 		hop->fpfn = 0;
 		hop->lpfn = 0;
 		hop->mem_type = XE_PL_TT;
@@ -702,7 +702,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	if (bo->tile)
 		tile = bo->tile;
 	else if (resource_is_vram(new_mem))
-		tile = mem_type_to_tile(xe, new_mem->mem_type);
+		tile = mem_type_to_tile(xe, new_mem->lru_entity.mem_type);
 	else if (mem_type_is_vram(old_mem_type))
 		tile = mem_type_to_tile(xe, old_mem_type);
 
@@ -777,7 +777,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	xe_device_mem_access_put(xe);
-	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
+	trace_printk("new_mem->lru_entity.mem_type=%d\n", new_mem->lru_entity.mem_type);
 
 out:
 	return ret;
@@ -918,10 +918,10 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 {
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
-	struct xe_tile *tile = mem_type_to_tile(xe, ttm_bo->resource->mem_type);
+	struct xe_tile *tile = mem_type_to_tile(xe, ttm_bo->resource->lru_entity.mem_type);
 	struct xe_res_cursor cursor;
 
-	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
+	if (ttm_bo->resource->lru_entity.mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
 
 	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
@@ -1183,7 +1183,7 @@ void xe_bo_free(struct xe_bo *bo)
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,
-				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    struct drm_lru_bulk_move *bulk, size_t size,
 				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
@@ -1452,9 +1452,9 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
-	struct xe_tile *tile = mem_type_to_tile(xe, res->mem_type);
+	struct xe_tile *tile = mem_type_to_tile(xe, res->lru_entity.mem_type);
 
-	if (res->mem_type == XE_PL_STOLEN)
+	if (res->lru_entity.mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
 	return tile->mem.vram.dpa_base;
@@ -1960,7 +1960,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 
 	xe_bo_assert_held(bo);
 
-	if (bo->ttm.resource->mem_type == mem_type)
+	if (bo->ttm.resource->lru_entity.mem_type == mem_type)
 		return 0;
 
 	if (xe_bo_is_pinned(bo))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9918b2d630e1..3ab17c81fe6e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -9,6 +9,7 @@
 #include "xe_bo_types.h"
 #include "xe_macros.h"
 #include "xe_vm_types.h"
+#include <drm/drm_evictable_lru.h>
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
@@ -83,7 +84,7 @@ void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,
-				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    struct drm_lru_bulk_move *bulk, size_t size,
 				    enum ttm_bo_type type, u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 09343b8b3e96..f22a4e0388d4 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -82,7 +82,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	if (!xe_bo_is_pinned(bo)) {
 		if (!attach->peer2peer ||
-		    bo->ttm.resource->mem_type == XE_PL_SYSTEM) {
+		    bo->ttm.resource->lru_entity.mem_type == XE_PL_SYSTEM) {
 			if (xe_bo_can_migrate(bo, XE_PL_TT))
 				r = xe_bo_migrate(bo, XE_PL_TT);
 			else
@@ -92,7 +92,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 			return ERR_PTR(r);
 	}
 
-	switch (bo->ttm.resource->mem_type) {
+	switch (bo->ttm.resource->lru_entity.mem_type) {
 	case XE_PL_TT:
 		sgt = drm_prime_pages_to_sg(obj->dev,
 					    bo->ttm.ttm->pages,
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index dafebdfb2368..100385e71a94 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -371,7 +371,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (!err && !xe_vm_no_dma_fences(vm)) {
 		spin_lock(xe->ttm.lru_lock);
-		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+		drm_lru_bulk_move_tail(&vm->lru_bulk_move);
 		spin_unlock(xe->ttm.lru_lock);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee8bc5f3ba3d..fdf2a448457d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -643,8 +643,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	u64 src_L0, dst_L0;
 	int pass = 0;
 	int err;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool src_is_vram = mem_type_is_vram(src->lru_entity.mem_type);
+	bool dst_is_vram = mem_type_is_vram(dst->lru_entity.mem_type);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
@@ -895,7 +895,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
 				   struct ttm_resource *dst)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = mem_type_is_vram(dst->lru_entity.mem_type);
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 5cb4b66a5d74..64c5549f4d44 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -53,8 +53,8 @@ static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
 
-	if (res->mem_type != XE_PL_STOLEN)
-		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
+	if (res->lru_entity.mem_type != XE_PL_STOLEN)
+		return &xe->tiles[res->lru_entity.mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
 
 	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 
@@ -79,9 +79,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 	if (!res)
 		goto fallback;
 
-	XE_WARN_ON(start + size > res->size);
+	XE_WARN_ON(start + size > res->lru_entity.size);
 
-	cur->mem_type = res->mem_type;
+	cur->mem_type = res->lru_entity.mem_type;
 
 	switch (cur->mem_type) {
 	case XE_PL_STOLEN:
@@ -128,7 +128,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->remaining = size;
 	cur->node = NULL;
 	cur->mem_type = XE_PL_TT;
-	XE_WARN_ON(res && start + size > res->size);
+	XE_WARN_ON(res && start + size > res->lru_entity.size);
 }
 
 static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index ace42852a419..7aa179e73d50 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -48,7 +48,7 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	node->base.mm_nodes[0].start = 0;
-	node->base.mm_nodes[0].size = PFN_UP(node->base.base.size);
+	node->base.mm_nodes[0].size = PFN_UP(node->base.base.lru_entity.size);
 	node->base.base.start = XE_BO_INVALID_OFFSET;
 
 	*res = &node->base.base;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index a3c1bf555c06..06a469cc8490 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -83,11 +83,11 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-	if (WARN_ON(!vres->base.size)) {
+	if (WARN_ON(!vres->base.lru_entity.size)) {
 		err = -EINVAL;
 		goto error_fini;
 	}
-	size = vres->base.size;
+	size = vres->base.lru_entity.size;
 
 	min_page_size = mgr->default_page_size;
 	if (tbo->page_alignment)
@@ -150,8 +150,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	} while (remaining_size);
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
-			size = vres->base.size;
+		if (!drm_buddy_block_trim(mm, vres->base.lru_entity.size, &vres->blocks))
+			size = vres->base.lru_entity.size;
 	}
 
 	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
@@ -378,14 +378,14 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_tile *tile = &xe->tiles[res->lru_entity.mem_type - XE_PL_VRAM0];
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
 	int num_entries = 0;
 	int i, r;
 
-	if (vres->used_visible_size < res->size)
+	if (vres->used_visible_size < res->lru_entity.size)
 		return -EOPNOTSUPP;
 
 	*sgt = kmalloc(sizeof(**sgt), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 44e038276d41..f96009b02800 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -652,7 +652,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 #undef retry_required
 
 	spin_lock(vm->xe->ttm.lru_lock);
-	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+	drm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	spin_unlock(vm->xe->ttm.lru_lock);
 
 	/* Point of no return. */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52e5eaed91c3..784b07660fff 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -149,7 +149,7 @@ struct xe_vm {
 	struct dma_resv resv;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
-	struct ttm_lru_bulk_move lru_bulk_move;
+	struct drm_lru_bulk_move lru_bulk_move;
 
 	u64 size;
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 223b198fe371..f4d939ee174c 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -118,7 +118,7 @@ struct ttm_buffer_object {
 	struct ttm_resource *resource;
 	struct ttm_tt *ttm;
 	bool deleted;
-	struct ttm_lru_bulk_move *bulk_move;
+	struct drm_lru_bulk_move *bulk_move;
 	unsigned priority;
 	unsigned pin_count;
 
@@ -355,7 +355,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
 void ttm_bo_put(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
-			  struct ttm_lru_bulk_move *bulk);
+			  struct drm_lru_bulk_move *bulk);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place);
 int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index c2528cec12e6..2401a7510ef6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -47,6 +47,7 @@ struct io_mapping;
 struct sg_table;
 struct scatterlist;
 struct drm_lru_mgr;
+struct drm_lru_entity;
 
 struct ttm_resource_manager_func {
 	/**
@@ -143,7 +144,7 @@ struct ttm_resource_manager_func {
  * @func: structure pointer implementing the range manager. See above
  * @move_lock: lock for move fence
  * @move: The fence of the last pipelined move operation.
- * @lru: The lru list for this memory type.
+ * @lru_mgr: The lru manager for this ttm_resource_manager
  *
  * This structure is used to identify and manage memory types for a device.
  */
@@ -163,14 +164,9 @@ struct ttm_resource_manager {
 	 */
 	struct dma_fence *move;
 
-	/*
-	 * Protected by the bdev->lru_lock.
-	 */
-	struct list_head lru[DRM_MAX_LRU_PRIORITY];
-
 	/**
 	 * @usage: How much of the resources are used, protected by the
-	 * bdev->lru_lock.
+	 * drm_device::lru_lock.
 	 */
 	uint64_t usage;
 
@@ -202,8 +198,6 @@ struct ttm_bus_placement {
  * struct ttm_resource
  *
  * @start: Start of the allocation.
- * @size: Actual size of resource in bytes.
- * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
  * @bo: weak reference to the BO, protected by ttm_device::lru_lock
@@ -214,44 +208,12 @@ struct ttm_bus_placement {
  */
 struct ttm_resource {
 	unsigned long start;
-	size_t size;
-	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
 	struct ttm_buffer_object *bo;
-
-	/**
-	 * @lru: Least recently used list, see &ttm_resource_manager.lru
-	 */
-	struct list_head lru;
 	struct drm_lru_entity lru_entity;
 };
 
-/**
- * struct ttm_lru_bulk_move_pos
- *
- * @first: first res in the bulk move range
- * @last: last res in the bulk move range
- *
- * Range of resources for a lru bulk move.
- */
-struct ttm_lru_bulk_move_pos {
-	struct ttm_resource *first;
-	struct ttm_resource *last;
-};
-
-/**
- * struct ttm_lru_bulk_move
- *
- * @pos: first/last lru entry for resources in the each domain/priority
- *
- * Container for the current bulk move state. Should be used with
- * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
- */
-struct ttm_lru_bulk_move {
-	struct ttm_lru_bulk_move_pos pos[DRM_NUM_MEM_TYPES][DRM_MAX_LRU_PRIORITY];
-};
-
 /**
  * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
  * struct sg_table backed struct ttm_resource.
@@ -306,7 +268,7 @@ ttm_resource_manager_set_used(struct ttm_resource_manager *man, bool used)
 	int i;
 
 	for (i = 0; i < DRM_MAX_LRU_PRIORITY; i++)
-		WARN_ON(!list_empty(&man->lru[i]));
+		WARN_ON(!list_empty(&man->lru_mgr->lru[i]));
 	man->use_type = used;
 }
 
@@ -350,13 +312,6 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 	man->move = NULL;
 }
 
-void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
-void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
-
-void ttm_resource_add_bulk_move(struct ttm_resource *res,
-				struct ttm_buffer_object *bo);
-void ttm_resource_del_bulk_move(struct ttm_resource *res,
-				struct ttm_buffer_object *bo);
 void ttm_resource_move_to_lru_tail(struct ttm_resource *res);
 
 void ttm_resource_init(struct ttm_buffer_object *bo,
@@ -382,6 +337,12 @@ bool ttm_resource_compat(struct ttm_resource *res,
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo);
 
+void ttm_resource_add_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo);
+
+void ttm_resource_del_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo);
+
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
 			       uint64_t size);
-- 
2.26.3

