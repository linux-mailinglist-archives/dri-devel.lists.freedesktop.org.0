Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597490C435
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F310E5AD;
	Tue, 18 Jun 2024 07:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtI9pj6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4850A10E5A6;
 Tue, 18 Jun 2024 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695128; x=1750231128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGSBfs33EAo6r3NtiWL+vXUkkmhO4gG6wMOVlbZF7YQ=;
 b=ZtI9pj6cbvO6jEm0I816wpiliCvqCI9WPnvH6I8FZJbeyz2dXLKXXgoD
 /kgwOPMG/+fVMtJTtdbUBzZf9S43lN44CAqX1EuEig+s7triF4zlKwhKL
 o+GmDnJN2Hpn3QXq0KShcmHFPXTxJuyuSiHzTV/i2PBsUJT7Hid3kVVlJ
 RyZDcq4dhwYDKOWSP19GmRZ6/z5Gign0ohI3Sg/QXLOjJ+ergYaEB4p4P
 WhQECc8dkCfKk5wVuCGa6vKXmOvjGDhrBZ9EIiF1ayW8x6gQ+8VY+VncX
 XWXqYTlRtsuTqiP0PpPb03Wc0Zn6qO5oAjr5OAgJ3rK/2S21blAHVFBjp g==;
X-CSE-ConnectionGUID: uQvDBV7DS2+VtpBSwic50g==
X-CSE-MsgGUID: IePggDBhSj+lRBCOyxAqPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389347"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:48 -0700
X-CSE-ConnectionGUID: JD9LrtiNSbGwxWbci0+fSQ==
X-CSE-MsgGUID: ifRkIqIgRQ+KqMfjD7QYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910770"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/12] drm/ttm: Use the LRU walker for eviction
Date: Tue, 18 Jun 2024 09:18:15 +0200
Message-ID: <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
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

Use the LRU walker for eviction. This helps
removing a lot of code with weird locking
semantics.

The functionality is slightly changed so that
when trylocked buffer objects are exhausted, we
continue to interleave walks with ticket-locks while
there is still progress made. The list walks are
not restarted in-between evictions.

Also provide a separate ttm_bo_evict_first()
function for its single user. The context of that
user allows sleeping dma_resv locks.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 350 ++++++++++++-----------------
 drivers/gpu/drm/ttm/ttm_resource.c |  20 +-
 include/drm/ttm/ttm_bo.h           |   8 +-
 3 files changed, 145 insertions(+), 233 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 63a91b77f7da..316afe19a325 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	dma_resv_iter_end(&cursor);
 }
 
-/**
- * ttm_bo_cleanup_refs
- * If bo idle, remove from lru lists, and unref.
- * If not idle, block if possible.
- *
- * Must be called with lru_lock and reservation held, this function
- * will drop the lru lock and optionally the reservation lock before returning.
- *
- * @bo:                    The buffer object to clean-up
- * @interruptible:         Any sleeps should occur interruptibly.
- * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
- * @unlock_resv:           Unlock the reservation lock as well.
- */
-
-static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
-			       bool interruptible, bool no_wait_gpu,
-			       bool unlock_resv)
-{
-	struct dma_resv *resv = &bo->base._resv;
-	int ret;
-
-	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
-		ret = 0;
-	else
-		ret = -EBUSY;
-
-	if (ret && !no_wait_gpu) {
-		long lret;
-
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-
-		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
-					     interruptible,
-					     30 * HZ);
-
-		if (lret < 0)
-			return lret;
-		else if (lret == 0)
-			return -EBUSY;
-
-		spin_lock(&bo->bdev->lru_lock);
-		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
-			/*
-			 * We raced, and lost, someone else holds the reservation now,
-			 * and is probably busy in ttm_bo_cleanup_memtype_use.
-			 *
-			 * Even if it's not the case, because we finished waiting any
-			 * delayed destruction would succeed, so just return success
-			 * here.
-			 */
-			spin_unlock(&bo->bdev->lru_lock);
-			return 0;
-		}
-		ret = 0;
-	}
-
-	if (ret) {
-		if (unlock_resv)
-			dma_resv_unlock(bo->base.resv);
-		spin_unlock(&bo->bdev->lru_lock);
-		return ret;
-	}
-
-	spin_unlock(&bo->bdev->lru_lock);
-	ttm_bo_cleanup_memtype_use(bo);
-
-	if (unlock_resv)
-		dma_resv_unlock(bo->base.resv);
-
-	return 0;
-}
-
 /*
  * Block for the dma_resv object to become idle, lock the buffer and clean up
  * the resource and tt object.
@@ -505,151 +431,154 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/*
- * Check the target bo is allowable to be evicted or swapout, including cases:
- *
- * a. if share same reservation object with ctx->resv, have assumption
- * reservation objects should already be locked, so not lock again and
- * return true directly when either the opreation allow_reserved_eviction
- * or the target bo already is in delayed free list;
+/**
+ * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
+ * @bdev: The ttm device.
+ * @man: The manager whose bo to evict.
+ * @ctx: The TTM operation ctx governing the eviction.
  *
- * b. Otherwise, trylock it.
+ * Return: 0 if successful or the resource disappeared. Negative error code on error.
  */
-static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
-					   struct ttm_operation_ctx *ctx,
-					   const struct ttm_place *place,
-					   bool *locked, bool *busy)
+int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx)
 {
-	bool ret = false;
+	struct ttm_resource_cursor cursor;
+	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
+	unsigned int mem_type;
+	int ret = 0;
 
-	if (bo->pin_count) {
-		*locked = false;
-		if (busy)
-			*busy = false;
-		return false;
+	spin_lock(&bdev->lru_lock);
+	res = ttm_resource_manager_first(man, &cursor);
+	if (!res) {
+		ret = -ENOENT;
+		goto out_no_ref;
 	}
+	bo = res->bo;
+	if (!ttm_bo_get_unless_zero(bo))
+		goto out_no_ref;
+	mem_type = res->mem_type;
+	spin_unlock(&bdev->lru_lock);
+	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
+	if (ret)
+		goto out_no_lock;
+	if (bo->resource != res || res->mem_type != mem_type)
+		goto out_bad_res;
 
-	if (bo->base.resv == ctx->resv) {
-		dma_resv_assert_held(bo->base.resv);
-		if (ctx->allow_res_evict)
-			ret = true;
-		*locked = false;
-		if (busy)
-			*busy = false;
+	if (bo->deleted) {
+		ret = ttm_bo_wait_ctx(bo, ctx);
+		if (ret)
+			ttm_bo_cleanup_memtype_use(bo);
 	} else {
-		ret = dma_resv_trylock(bo->base.resv);
-		*locked = ret;
-		if (busy)
-			*busy = !ret;
-	}
-
-	if (ret && place && (bo->resource->mem_type != place->mem_type ||
-		!bo->bdev->funcs->eviction_valuable(bo, place))) {
-		ret = false;
-		if (*locked) {
-			dma_resv_unlock(bo->base.resv);
-			*locked = false;
-		}
+		ret = ttm_bo_evict(bo, ctx);
 	}
-
+out_bad_res:
+	dma_resv_unlock(bo->base.resv);
+out_no_lock:
+	ttm_bo_put(bo);
+	ttm_resource_cursor_fini(&cursor);
 	return ret;
+
+out_no_ref:
+	ttm_resource_cursor_fini_locked(&cursor);
+	spin_unlock(&bdev->lru_lock);
+	return -ENOENT;
 }
 
 /**
- * ttm_mem_evict_wait_busy - wait for a busy BO to become available
- *
- * @busy_bo: BO which couldn't be locked with trylock
- * @ctx: operation context
- * @ticket: acquire ticket
- *
- * Try to lock a busy buffer object to avoid failing eviction.
+ * struct ttm_bo_evict_walk - Parameters for the evict walk.
  */
-static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
-				   struct ttm_operation_ctx *ctx,
-				   struct ww_acquire_ctx *ticket)
-{
-	int r;
-
-	if (!busy_bo || !ticket)
-		return -EBUSY;
-
-	if (ctx->interruptible)
-		r = dma_resv_lock_interruptible(busy_bo->base.resv,
-							  ticket);
-	else
-		r = dma_resv_lock(busy_bo->base.resv, ticket);
-
-	/*
-	 * TODO: It would be better to keep the BO locked until allocation is at
-	 * least tried one more time, but that would mean a much larger rework
-	 * of TTM.
-	 */
-	if (!r)
-		dma_resv_unlock(busy_bo->base.resv);
-
-	return r == -EDEADLK ? -EBUSY : r;
-}
+struct ttm_bo_evict_walk {
+	/** @walk: The walk base parameters. */
+	struct ttm_lru_walk walk;
+	/** @place: The place passed to the resource allocation. */
+	const struct ttm_place *place;
+	/** @evictor: The buffer object we're trying to make room for. */
+	struct ttm_buffer_object *evictor;
+	/** @res: The allocated resource if any. */
+	struct ttm_resource **res;
+	/** @evicted: The number of evicted pages. */
+	unsigned long evicted;
+};
 
-int ttm_mem_evict_first(struct ttm_device *bdev,
-			struct ttm_resource_manager *man,
-			const struct ttm_place *place,
-			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket)
+static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
-	struct ttm_resource_cursor cursor;
-	struct ttm_resource *res;
-	bool locked = false;
-	int ret;
+	struct ttm_bo_evict_walk *evict_walk =
+		container_of(walk, typeof(*evict_walk), walk);
+	long lret;
 
-	spin_lock(&bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
-		bool busy;
-
-		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
-						    &locked, &busy)) {
-			if (busy && !busy_bo && ticket !=
-			    dma_resv_locking_ctx(res->bo->base.resv))
-				busy_bo = res->bo;
-			continue;
-		}
+	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
+		return 0;
 
-		if (ttm_bo_get_unless_zero(res->bo)) {
-			bo = res->bo;
-			break;
-		}
-		if (locked)
-			dma_resv_unlock(res->bo->base.resv);
+	if (bo->deleted) {
+		lret = ttm_bo_wait_ctx(bo, walk->ctx);
+		if (!lret)
+			ttm_bo_cleanup_memtype_use(bo);
+	} else {
+		lret = ttm_bo_evict(bo, walk->ctx);
 	}
-	ttm_resource_cursor_fini_locked(&cursor);
 
-	if (!bo) {
-		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
-			busy_bo = NULL;
-		spin_unlock(&bdev->lru_lock);
-		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
-		if (busy_bo)
-			ttm_bo_put(busy_bo);
-		return ret;
-	}
+	if (lret)
+		goto out;
 
-	if (bo->deleted) {
-		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
-					  ctx->no_wait_gpu, locked);
-		ttm_bo_put(bo);
-		return ret;
-	}
+	evict_walk->evicted++;
+	if (evict_walk->res)
+		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
+					  evict_walk->res);
+	if (lret == 0)
+		return 1;
+out:
+	/* Errors that should terminate the walk. */
+	if (lret == -ENOMEM || lret == -EINTR || lret == -ERESTARTSYS ||
+	    lret == -EAGAIN)
+		return lret;
 
-	spin_unlock(&bdev->lru_lock);
+	return 0;
+}
 
-	ret = ttm_bo_evict(bo, ctx);
-	if (locked)
-		ttm_bo_unreserve(bo);
-	else
-		ttm_bo_move_to_lru_tail_unlocked(bo);
+static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
+	.process_bo = ttm_bo_evict_cb,
+};
 
-	ttm_bo_put(bo);
-	return ret;
+static int ttm_bo_evict_alloc(struct ttm_device *bdev,
+			      struct ttm_resource_manager *man,
+			      const struct ttm_place *place,
+			      struct ttm_buffer_object *evictor,
+			      struct ttm_operation_ctx *ctx,
+			      struct ww_acquire_ctx *ticket,
+			      struct ttm_resource **res)
+{
+	struct ttm_bo_evict_walk evict_walk = {
+		.walk = {
+			.ops = &ttm_evict_walk_ops,
+			.ctx = ctx,
+			.ticket = ticket,
+		},
+		.place = place,
+		.evictor = evictor,
+		.res = res,
+	};
+	long lret;
+
+	evict_walk.walk.trylock_only = true;
+	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+	if (lret || !ticket)
+		goto out;
+
+	/* If ticket-locking, repeat while making progress. */
+	evict_walk.walk.trylock_only = false;
+	do {
+		/* The walk may clear the evict_walk.walk.ticket field */
+		evict_walk.walk.ticket = ticket;
+		evict_walk.evicted = 0;
+		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
+	} while (!lret && evict_walk.evicted);
+out:
+	if (lret < 0)
+		return lret;
+	if (lret == 0)
+		return -EBUSY;
+	return 0;
 }
 
 /**
@@ -760,6 +689,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 	for (i = 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
+		bool may_evict;
 
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
@@ -769,22 +699,21 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 				    TTM_PL_FLAG_FALLBACK))
 			continue;
 
-		do {
-			ret = ttm_resource_alloc(bo, place, res);
-			if (unlikely(ret && ret != -ENOSPC))
+		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
+		ret = ttm_resource_alloc(bo, place, res);
+		if (ret) {
+			if (ret != -ENOSPC)
 				return ret;
-			if (likely(!ret) || !force_space)
-				break;
-
-			ret = ttm_mem_evict_first(bdev, man, place, ctx,
-						  ticket);
-			if (unlikely(ret == -EBUSY))
-				break;
-			if (unlikely(ret))
+			if (!may_evict)
+				continue;
+
+			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
+						 ticket, res);
+			if (ret == -EBUSY)
+				continue;
+			if (ret)
 				return ret;
-		} while (1);
-		if (ret)
-			continue;
+		}
 
 		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
@@ -796,7 +725,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 		}
 		return 0;
 	}
-
 	return -ENOSPC;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index a03090683e79..6d0c66fc36e3 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -508,24 +508,10 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 	};
 	struct dma_fence *fence;
 	int ret;
-	unsigned i;
-
-	/*
-	 * Can't use standard list traversal since we're unlocking.
-	 */
 
-	spin_lock(&bdev->lru_lock);
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		while (!list_empty(&man->lru[i])) {
-			spin_unlock(&bdev->lru_lock);
-			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
-						  NULL);
-			if (ret)
-				return ret;
-			spin_lock(&bdev->lru_lock);
-		}
-	}
-	spin_unlock(&bdev->lru_lock);
+	do {
+		ret = ttm_bo_evict_first(bdev, man, &ctx);
+	} while (!ret);
 
 	spin_lock(&man->move_lock);
 	fence = dma_fence_get(man->move);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 472a55b69afb..148f49f625e4 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -415,11 +415,9 @@ long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		    pgoff_t target);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
-int ttm_mem_evict_first(struct ttm_device *bdev,
-			struct ttm_resource_manager *man,
-			const struct ttm_place *place,
-			struct ttm_operation_ctx *ctx,
-			struct ww_acquire_ctx *ticket);
+int ttm_bo_evict_first(struct ttm_device *bdev,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.44.0

