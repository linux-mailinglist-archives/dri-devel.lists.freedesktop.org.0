Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448E928BAE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B269D10EC0E;
	Fri,  5 Jul 2024 15:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQFyN2qx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121F210EC0B;
 Fri,  5 Jul 2024 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720193548; x=1751729548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rtpJ0/X3DMyyVQmtPJnq1BGk9BtVkcKaziYwDzpaAag=;
 b=VQFyN2qxy2tsc+m1tXuexLtbHc63/bPAhf7fxJTQo+y8TMpOOkYpxwuK
 fuPB5o+6yEUgaygI8Nv2/Nkzm8fXxVarxspep30kU5BKfK1QZ+F1q69SI
 wn5kglN3QxunvCZDf6iRLltKajgai4aO6Y8FXg/HvklbZ0bji8iEQ/pRF
 +VJVD24OWp6yBiL90evk2bJ2Ibg/g4ZvTa8gVxQwRIrMojFzX0rO5Nqv+
 mupGZ2IizWhp4FBiUnbevF8pdRUi7/m3Ve+HasNrXb4EHaSmqJRdBeMLb
 yb0+X0VMZI1ZRyTvnGppPb1G4eD9yugUjvAowxm6KpmMfiQEaMO9WDr1p Q==;
X-CSE-ConnectionGUID: T/k3p7ywQhOU7bgNd6eLIA==
X-CSE-MsgGUID: +vdwibjSQtKspqL9C8vDIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17622924"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17622924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:28 -0700
X-CSE-ConnectionGUID: tz7Lj4ZXRmC5+QdF1tsfTg==
X-CSE-MsgGUID: gE1wtCtpR7SZWgHlDFxtiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46844963"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v7 6/8] drm/ttm: Use the LRU walker helper for swapping
Date: Fri,  5 Jul 2024 17:32:04 +0200
Message-ID: <20240705153206.68526-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
References: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
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

Rework the TTM swapping to use the LRU walker helper.
This helps fixing up the ttm_bo_swapout() interface
to be consistent about not requiring any locking.

For now mimic the current behaviour of using trylock
only. We could be using ticket-locks here but defer
that until it's deemed necessary. The TTM swapout
functionality is a bit weird anyway since it
alternates between memory types without exhausting
TTM_PL_SYSTEM first.

Intentionally keep pages as the unit of progress since
changing that to bytes is an unrelated change that can
be done later.

v6:
- Improve on error code translation in the swapout callback
  (Matthew Brost).
v7:
- Use s64 rather than long.
- Remove ttm_resource_cursor_fini() since it's no longer used.
- Rename ttm_resource_cursor_fini_locked() to
  ttm_resource_cursor_fini().
- Don't swap out pinned bos.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 116 +++++++++++++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c  |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c   |  30 ++------
 drivers/gpu/drm/ttm/ttm_resource.c |  23 +-----
 include/drm/ttm/ttm_bo.h           |   5 +-
 include/drm/ttm/ttm_resource.h     |   2 -
 6 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 43eda720657f..f4b2b2bea6cb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -621,7 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		if (locked)
 			dma_resv_unlock(res->bo->base.resv);
 	}
-	ttm_resource_cursor_fini_locked(&cursor);
+	ttm_resource_cursor_fini(&cursor);
 
 	if (!bo) {
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
@@ -1118,12 +1118,24 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 }
 EXPORT_SYMBOL(ttm_bo_wait_ctx);
 
-int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-		   gfp_t gfp_flags)
+/**
+ * struct ttm_bo_swapout_walk - Parameters for the swapout walk
+ */
+struct ttm_bo_swapout_walk {
+	/** @walk: The walk base parameters. */
+	struct ttm_lru_walk walk;
+	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
+	gfp_t gfp_flags;
+};
+
+static s64
+ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	struct ttm_place place;
-	bool locked;
-	long ret;
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct ttm_bo_swapout_walk *swapout_walk =
+		container_of(walk, typeof(*swapout_walk), walk);
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	s64 ret;
 
 	/*
 	 * While the bo may already reside in SYSTEM placement, set
@@ -1131,28 +1143,29 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * The driver may use the fact that we're moving from SYSTEM
 	 * as an indication that we're about to swap out.
 	 */
-	memset(&place, 0, sizeof(place));
-	place.mem_type = bo->resource->mem_type;
-	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
-		return -EBUSY;
+	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, &place)) {
+		ret = -EBUSY;
+		goto out;
+	}
 
 	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
 	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
-	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
-	    !ttm_bo_get_unless_zero(bo)) {
-		if (locked)
-			dma_resv_unlock(bo->base.resv);
-		return -EBUSY;
+	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
+		ret = -EBUSY;
+		goto out;
 	}
 
 	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
-		ttm_bo_put(bo);
-		return ret == -EBUSY ? -ENOSPC : ret;
-	}
+		pgoff_t num_pages = bo->ttm->num_pages;
 
-	/* TODO: Cleanup the locking */
-	spin_unlock(&bo->bdev->lru_lock);
+		ret = ttm_bo_wait_ctx(bo, ctx);
+		if (ret)
+			goto out;
+
+		ttm_bo_cleanup_memtype_use(bo);
+		ret = num_pages;
+		goto out;
+	}
 
 	/*
 	 * Move to system cached
@@ -1164,12 +1177,13 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		memset(&hop, 0, sizeof(hop));
 		place.mem_type = TTM_PL_SYSTEM;
 		ret = ttm_resource_alloc(bo, &place, &evict_mem);
-		if (unlikely(ret))
+		if (ret)
 			goto out;
 
 		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
-		if (unlikely(ret != 0)) {
-			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
+		if (ret) {
+			WARN(ret == -EMULTIHOP,
+			     "Unexpected multihop in swapout - likely driver bug.\n");
 			ttm_resource_free(bo, &evict_mem);
 			goto out;
 		}
@@ -1179,30 +1193,54 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * Make sure BO is idle.
 	 */
 	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(ret != 0))
+	if (ret)
 		goto out;
 
 	ttm_bo_unmap_virtual(bo);
-
-	/*
-	 * Swap out. Buffer will be swapped in again as soon as
-	 * anyone tries to access a ttm page.
-	 */
 	if (bo->bdev->funcs->swap_notify)
 		bo->bdev->funcs->swap_notify(bo);
 
 	if (ttm_tt_is_populated(bo->ttm))
-		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
+		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
+
 out:
+	/* Consider -ENOMEM and -ENOSPC non-fatal. */
+	if (ret == -ENOMEM || ret == -ENOSPC)
+		ret = -EBUSY;
 
-	/*
-	 * Unreserve without putting on LRU to avoid swapping out an
-	 * already swapped buffer.
-	 */
-	if (locked)
-		dma_resv_unlock(bo->base.resv);
-	ttm_bo_put(bo);
-	return ret == -EBUSY ? -ENOSPC : ret;
+	return ret;
+}
+
+const struct ttm_lru_walk_ops ttm_swap_ops = {
+	.process_bo = ttm_bo_swapout_cb,
+};
+
+/**
+ * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
+ * @bdev: The ttm device.
+ * @ctx: The ttm_operation_ctx governing the swapout operation.
+ * @man: The resource manager whose resources / buffer objects are
+ * goint to be swapped out.
+ * @gfp_flags: The gfp flags used for shmem page allocations.
+ * @target: The desired number of bytes to swap out.
+ *
+ * Return: The number of bytes actually swapped out, or negative error code
+ * on error.
+ */
+s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		   struct ttm_resource_manager *man, gfp_t gfp_flags,
+		   s64 target)
+{
+	struct ttm_bo_swapout_walk swapout_walk = {
+		.walk = {
+			.ops = &ttm_swap_ops,
+			.ctx = ctx,
+			.trylock_only = true,
+		},
+		.gfp_flags = gfp_flags,
+	};
+
+	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
 }
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index c2759add58f5..3c07f4712d5c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -914,7 +914,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		if (progress < 0 || progress >= target)
 			break;
 	}
-	ttm_resource_cursor_fini_locked(&cursor);
+	ttm_resource_cursor_fini(&cursor);
 	spin_unlock(&bdev->lru_lock);
 
 	return progress;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f9e9b1ec8c8a..e7cc4954c1bc 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -148,40 +148,20 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
-	struct ttm_resource_cursor cursor;
 	struct ttm_resource_manager *man;
-	struct ttm_resource *res;
 	unsigned i;
-	int ret;
+	s64 lret;
 
-	spin_lock(&bdev->lru_lock);
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
 			continue;
 
-		ttm_resource_manager_for_each_res(man, &cursor, res) {
-			struct ttm_buffer_object *bo = res->bo;
-			uint32_t num_pages;
-
-			if (!bo || bo->resource != res)
-				continue;
-
-			num_pages = PFN_UP(bo->base.size);
-			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret) {
-				ttm_resource_cursor_fini(&cursor);
-				return num_pages;
-			}
-			if (ret != -EBUSY) {
-				ttm_resource_cursor_fini(&cursor);
-				return ret;
-			}
-		}
+		lret = ttm_bo_swapout(bdev, ctx, man, gfp_flags, 1);
+		/* Can be both positive (num_pages) and negative (error) */
+		if (lret)
+			return lret;
 	}
-	ttm_resource_cursor_fini_locked(&cursor);
-	spin_unlock(&bdev->lru_lock);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_device_swapout);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b6a2daac5518..b43d04a1dc91 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -81,37 +81,20 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
 }
 
 /**
- * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
+ * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
  *
  * The function pulls the LRU list cursor off any lists it was previusly
  * attached to. Needs to be called with the LRU lock held. The function
  * can be called multiple times after eachother.
  */
-void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
 {
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
 	list_del_init(&cursor->hitch.link);
 	ttm_resource_cursor_clear_bulk(cursor);
 }
 
-/**
- * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
- * @cursor: The struct ttm_resource_cursor to finalize.
- *
- * The function pulls the LRU list cursor off any lists it was previusly
- * attached to. Needs to be called without the LRU list lock held. The
- * function can be called multiple times after eachother.
- */
-void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
-{
-	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
-
-	spin_lock(lru_lock);
-	ttm_resource_cursor_fini_locked(cursor);
-	spin_unlock(lru_lock);
-}
-
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
  * @bulk: the structure to init
@@ -662,7 +645,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		ttm_resource_cursor_clear_bulk(cursor);
 	}
 
-	ttm_resource_cursor_fini_locked(cursor);
+	ttm_resource_cursor_fini(cursor);
 
 	return NULL;
 }
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 21fa9d5964ec..eb2692de06b8 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -417,8 +417,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-		   gfp_t gfp_flags);
+s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		   struct ttm_resource_manager *man, gfp_t gfp_flags,
+		   s64 target);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_mem_evict_first(struct ttm_device *bdev,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 571abb4861a6..be034be56ba1 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -325,8 +325,6 @@ struct ttm_resource_cursor {
 	unsigned int priority;
 };
 
-void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
-
 void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
 
 /**
-- 
2.44.0

