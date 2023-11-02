Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B37DEBC4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C4510E7FF;
	Thu,  2 Nov 2023 04:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE010E7FA;
 Thu,  2 Nov 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899071; x=1730435071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HDjBY6VY37svVHJzhhAHXoSsugcD4N0Z6EUBPnYr33o=;
 b=VebJ5+1eOewBZo5IOtv+xe96u9b3dCtQcC2Cjz3r5pMPQI11jPyT760Q
 ivTVY3HqrksPa5WhGu5Juoi3OBctwCMnSOsiA8oUyo/3OmbNd7Akz6MiF
 NRez11bC8BBPwnoeJujsk+7O7Hd4qvPrUeC9zgcxWvocpy7hY5SsFc9hs
 7kuemZRZ7ldxlLcx6LKBpC884zx11btrpy8PgZJiVzxxpYi10M47ZE7Kj
 QJYZjAcuLvwu18RSxQXCnSySygr6FA7MqPAOw34lynhPbx3R+key3aODA
 2VdzfhOOu6pMPASWYA86jv5NrNkVnY7GOTo0xU+9qCjI5Zv+32MzL6TxQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930904"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930904"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762616"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762616"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 02/11] drm: move lru_lock from ttm_device to drm_device
Date: Thu,  2 Nov 2023 00:32:57 -0400
Message-Id: <20231102043306.2931989-3-oak.zeng@intel.com>
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

In the coming patches, we will share the lru list b/t
ttm bo based memory allocator and hmm/svm based memory
allocator. Thus lru_lock (which is used mainly to protect
the lru list) is moved from struct ttm_device to struct
drm_device, so this lock can be shared b/t those two
memory allocators.

To minimize code change, struct ttm_device still hold
a weak reference of lru_lock, so ttm layer can still
reference to this lock easily.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  4 +-
 drivers/gpu/drm/drm_drv.c                    |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 | 40 +++++++++----------
 drivers/gpu/drm/ttm/ttm_device.c             | 18 ++++-----
 drivers/gpu/drm/ttm/ttm_resource.c           | 42 ++++++++++----------
 drivers/gpu/drm/xe/xe_bo.c                   |  4 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  4 +-
 drivers/gpu/drm/xe/xe_vm.c                   |  4 +-
 include/drm/drm_device.h                     |  5 +++
 include/drm/ttm/ttm_bo.h                     |  4 +-
 include/drm/ttm/ttm_device.h                 |  4 +-
 13 files changed, 72 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f5daadcec865..747bcad86d5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -368,9 +368,9 @@ int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm)
 {
-	spin_lock(&adev->mman.bdev.lru_lock);
+	spin_lock(adev->mman.bdev.lru_lock);
 	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
-	spin_unlock(&adev->mman.bdev.lru_lock);
+	spin_unlock(adev->mman.bdev.lru_lock);
 }
 
 /* Create scheduler entities for page table updates */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index c7085a747b03..b83e1741905e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -290,9 +290,9 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 
 		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
 		atomic64_add(vis_usage, &mgr->vis_usage);
-		spin_lock(&man->bdev->lru_lock);
+		spin_lock(man->bdev->lru_lock);
 		man->usage += rsv->size;
-		spin_unlock(&man->bdev->lru_lock);
+		spin_unlock(man->bdev->lru_lock);
 		list_move(&rsv->blocks, &mgr->reserved_pages);
 	}
 }
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3eda026ffac6..1943c38815aa 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -623,6 +623,7 @@ static int drm_dev_init(struct drm_device *dev,
 
 	INIT_LIST_HEAD(&dev->managed.resources);
 	spin_lock_init(&dev->managed.lock);
+	spin_lock_init(&dev->lru_lock);
 
 	/* no per-device feature limits by default */
 	dev->driver_features = ~0u;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 9227f8146a58..c46f54f83f54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -984,7 +984,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	/*
 	 * Put on the correct LRU list depending on the MADV status
 	 */
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	if (shrinkable) {
 		/* Try to keep shmem_tt from being considered for shrinking. */
 		bo->priority = TTM_MAX_BO_PRIORITY - 1;
@@ -1013,7 +1013,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	}
 
 	ttm_bo_move_to_lru_tail(bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 
 /*
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e58b7e249816..26e0555bad0c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -68,7 +68,7 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
  * @bo: The buffer object.
  *
  * Move this BO to the tail of all lru lists used to lookup and reserve an
- * object. This function must be called with struct ttm_global::lru_lock
+ * object. This function must be called with struct drm_device::lru_lock
  * held, and is used to make a BO less likely to be considered for eviction.
  */
 void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo)
@@ -102,13 +102,13 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 	if (bo->bulk_move == bulk)
 		return;
 
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
 	bo->bulk_move = bulk;
 	if (bo->resource)
 		ttm_resource_add_bulk_move(bo->resource, bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_set_bulk_move);
 
@@ -202,9 +202,9 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 		 * reference it any more. The only tricky case is the trylock on
 		 * the resv object while holding the lru_lock.
 		 */
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(bo->bdev->lru_lock);
 		bo->base.resv = &bo->base._resv;
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(bo->bdev->lru_lock);
 	}
 
 	return r;
@@ -255,7 +255,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 
 		if (unlock_resv)
 			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(bo->bdev->lru_lock);
 
 		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 					     interruptible,
@@ -266,7 +266,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		else if (lret == 0)
 			return -EBUSY;
 
-		spin_lock(&bo->bdev->lru_lock);
+		spin_lock(bo->bdev->lru_lock);
 		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
 			/*
 			 * We raced, and lost, someone else holds the reservation now,
@@ -276,7 +276,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 			 * delayed destruction would succeed, so just return success
 			 * here.
 			 */
-			spin_unlock(&bo->bdev->lru_lock);
+			spin_unlock(bo->bdev->lru_lock);
 			return 0;
 		}
 		ret = 0;
@@ -285,11 +285,11 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	if (ret) {
 		if (unlock_resv)
 			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
+		spin_unlock(bo->bdev->lru_lock);
 		return ret;
 	}
 
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
 
 	if (unlock_resv)
@@ -351,7 +351,7 @@ static void ttm_bo_release(struct kref *kref)
 			ttm_bo_flush_all_fences(bo);
 			bo->deleted = true;
 
-			spin_lock(&bo->bdev->lru_lock);
+			spin_lock(bo->bdev->lru_lock);
 
 			/*
 			 * Make pinned bos immediately available to
@@ -367,7 +367,7 @@ static void ttm_bo_release(struct kref *kref)
 			}
 
 			kref_init(&bo->kref);
-			spin_unlock(&bo->bdev->lru_lock);
+			spin_unlock(bo->bdev->lru_lock);
 
 			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
 			queue_work(bdev->wq, &bo->delayed_delete);
@@ -598,7 +598,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	bool locked = false;
 	int ret;
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	ttm_resource_manager_for_each_res(man, &cursor, res) {
 		bool busy;
 
@@ -621,7 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	if (!bo) {
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
 			busy_bo = NULL;
-		spin_unlock(&bdev->lru_lock);
+		spin_unlock(bdev->lru_lock);
 		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
 		if (busy_bo)
 			ttm_bo_put(busy_bo);
@@ -635,7 +635,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		return ret;
 	}
 
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 
 	ret = ttm_bo_evict(bo, ctx);
 	if (locked)
@@ -658,11 +658,11 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!kref_read(&bo->kref));
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
 	++bo->pin_count;
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_pin);
 
@@ -679,11 +679,11 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	--bo->pin_count;
 	if (bo->resource)
 		ttm_resource_add_bulk_move(bo->resource, bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_unpin);
 
@@ -1156,7 +1156,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	}
 
 	/* TODO: Cleanup the locking */
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 
 	/*
 	 * Move to system cached
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 12014788b595..d18eca86ebd6 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -147,7 +147,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	unsigned i;
 	int ret;
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
@@ -169,7 +169,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 				return ret;
 		}
 	}
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_device_swapout);
@@ -217,7 +217,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 				use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
-	spin_lock_init(&bdev->lru_lock);
+	bdev->lru_lock = &drm->lru_lock;
 	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
@@ -244,11 +244,11 @@ void ttm_device_fini(struct ttm_device *bdev)
 	drain_workqueue(bdev->wq);
 	destroy_workqueue(bdev->wq);
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		if (list_empty(&man->lru[0]))
 			pr_debug("Swap list %d was clean\n", i);
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 
 	ttm_pool_fini(&bdev->pool);
 	ttm_global_release();
@@ -260,7 +260,7 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 {
 	struct ttm_resource *res;
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
 		struct ttm_buffer_object *bo = res->bo;
 
@@ -269,15 +269,15 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 			continue;
 
 		list_del_init(&res->lru);
-		spin_unlock(&bdev->lru_lock);
+		spin_unlock(bdev->lru_lock);
 
 		if (bo->ttm)
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 
 		ttm_bo_put(bo);
-		spin_lock(&bdev->lru_lock);
+		spin_lock(bdev->lru_lock);
 	}
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 }
 
 void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 46ff9c75bb12..6ada77f51fba 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -48,7 +48,7 @@ EXPORT_SYMBOL(ttm_lru_bulk_move_init);
  * @bulk: bulk move structure
  *
  * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
- * resource order never changes. Should be called with &ttm_device.lru_lock held.
+ * resource order never changes. Should be called with &drm_device.lru_lock held.
  */
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 {
@@ -62,7 +62,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 			if (!pos->first)
 				continue;
 
-			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
+			lockdep_assert_held(pos->first->bo->bdev->lru_lock);
 			dma_resv_assert_held(pos->first->bo->base.resv);
 			dma_resv_assert_held(pos->last->bo->base.resv);
 
@@ -148,7 +148,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
 
-	lockdep_assert_held(&bo->bdev->lru_lock);
+	lockdep_assert_held(bo->bdev->lru_lock);
 
 	if (bo->pin_count) {
 		list_move_tail(&res->lru, &bdev->pinned);
@@ -191,13 +191,13 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bo = bo;
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	if (bo->pin_count)
 		list_add_tail(&res->lru, &bo->bdev->pinned);
 	else
 		list_add_tail(&res->lru, &man->lru[bo->priority]);
 	man->usage += res->size;
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
@@ -216,10 +216,10 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 {
 	struct ttm_device *bdev = man->bdev;
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	list_del_init(&res->lru);
 	man->usage -= res->size;
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
@@ -235,9 +235,9 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	ttm_resource_add_bulk_move(*res_ptr, bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 	return 0;
 }
 
@@ -248,9 +248,9 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 	if (!*res)
 		return;
 
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	ttm_resource_del_bulk_move(*res, bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
 	man->func->free(man, *res);
 	*res = NULL;
@@ -368,9 +368,9 @@ bool ttm_resource_compat(struct ttm_resource *res,
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo)
 {
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	res->bo = bo;
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 
 /**
@@ -424,18 +424,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 	 * Can't use standard list traversal since we're unlocking.
 	 */
 
-	spin_lock(&bdev->lru_lock);
+	spin_lock(bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 		while (!list_empty(&man->lru[i])) {
-			spin_unlock(&bdev->lru_lock);
+			spin_unlock(bdev->lru_lock);
 			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
 						  NULL);
 			if (ret)
 				return ret;
-			spin_lock(&bdev->lru_lock);
+			spin_lock(bdev->lru_lock);
 		}
 	}
-	spin_unlock(&bdev->lru_lock);
+	spin_unlock(bdev->lru_lock);
 
 	spin_lock(&man->move_lock);
 	fence = dma_fence_get(man->move);
@@ -463,9 +463,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
 {
 	uint64_t usage;
 
-	spin_lock(&man->bdev->lru_lock);
+	spin_lock(man->bdev->lru_lock);
 	usage = man->usage;
-	spin_unlock(&man->bdev->lru_lock);
+	spin_unlock(man->bdev->lru_lock);
 	return usage;
 }
 EXPORT_SYMBOL(ttm_resource_manager_usage);
@@ -502,7 +502,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 {
 	struct ttm_resource *res;
 
-	lockdep_assert_held(&man->bdev->lru_lock);
+	lockdep_assert_held(man->bdev->lru_lock);
 
 	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
@@ -526,7 +526,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res)
 {
-	lockdep_assert_held(&man->bdev->lru_lock);
+	lockdep_assert_held(man->bdev->lru_lock);
 
 	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
 		return res;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25fdc04627ca..827f798cccc0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -946,9 +946,9 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	 * the ttm_bo refcount is zero at this point. So trylocking *should*
 	 * always succeed here, as long as we hold the lru lock.
 	 */
-	spin_lock(&ttm_bo->bdev->lru_lock);
+	spin_lock(ttm_bo->bdev->lru_lock);
 	locked = dma_resv_trylock(ttm_bo->base.resv);
-	spin_unlock(&ttm_bo->bdev->lru_lock);
+	spin_unlock(ttm_bo->bdev->lru_lock);
 	XE_WARN_ON(!locked);
 
 	return locked;
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 890fadb0a93e..dafebdfb2368 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -370,9 +370,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_vm_reactivate_rebind(vm);
 
 	if (!err && !xe_vm_no_dma_fences(vm)) {
-		spin_lock(&xe->ttm.lru_lock);
+		spin_lock(xe->ttm.lru_lock);
 		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
-		spin_unlock(&xe->ttm.lru_lock);
+		spin_unlock(xe->ttm.lru_lock);
 	}
 
 err_repin:
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a6a0f17fec1d..44e038276d41 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -651,9 +651,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 #undef retry_required
 
-	spin_lock(&vm->xe->ttm.lru_lock);
+	spin_lock(vm->xe->ttm.lru_lock);
 	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
-	spin_unlock(&vm->xe->ttm.lru_lock);
+	spin_unlock(vm->xe->ttm.lru_lock);
 
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 7cf4afae2e79..d0b5f42786be 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -326,6 +326,11 @@ struct drm_device {
 	 */
 	struct list_head debugfs_list;
 
+	/**
+	 * @lru_lock: Protection for the per manager LRU and destroy lists.
+	 */
+	spinlock_t lru_lock;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b2..49f32df32204 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -290,9 +290,9 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
 static inline void
 ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
 {
-	spin_lock(&bo->bdev->lru_lock);
+	spin_lock(bo->bdev->lru_lock);
 	ttm_bo_move_to_lru_tail(bo);
-	spin_unlock(&bo->bdev->lru_lock);
+	spin_unlock(bo->bdev->lru_lock);
 }
 
 static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index bab868d55383..4d29e96bd892 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -248,9 +248,9 @@ struct ttm_device {
 	struct ttm_pool pool;
 
 	/**
-	 * @lru_lock: Protection for the per manager LRU and ddestroy lists.
+	 * @lru_lock: Weak reference to drm_device::lru_lock.
 	 */
-	spinlock_t lru_lock;
+	spinlock_t *lru_lock;
 
 	/**
 	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
-- 
2.26.3

