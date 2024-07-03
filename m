Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3C926509
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16B610E96B;
	Wed,  3 Jul 2024 15:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4RBYKKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF40510E974;
 Wed,  3 Jul 2024 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720021113; x=1751557113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bY7y0fPZmUJoOALBJLTQpTNq5PHwaDhTFuO0i1/8g2E=;
 b=n4RBYKKrgOwyyraws/4cUu/94o4xst6WJoifJwStOVA2nNowU8o8gKpX
 NUW0nok2jMxVr+6P2p0LLPIsFzhy75ciSv29fE7+OqtJezuBXupexB6gV
 rGvOExQLAggtGqe/Oxk788krURK3ixFwqCzKPYlBHzzZM5YBejga4YZgA
 W3tndTKmnf4C8sVRxvqVOc/OYJ3QDLSUz+hJt+amou8yoIk0HtpEd3T9F
 0aHlZ3N+9+W1/lpeyzRwRfabfeUsohkbwfhuT5veY8ZBZu6XCTj+mU8sJ
 3ntEeKYpxDvlRMvwKbsRP6iLRU8l/HuSeop+tTfFUEYuGV/GTbPMuMD2n w==;
X-CSE-ConnectionGUID: evxTbeGYQ2yUq8A4ae1JJg==
X-CSE-MsgGUID: N9tmF9yZRD2qJXvPcXs/Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20162607"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="20162607"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:33 -0700
X-CSE-ConnectionGUID: i2qLato2QMSOFaj7gg3ruA==
X-CSE-MsgGUID: WH/4C4J+QBa/GKqfZceReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46359394"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/12] drm/ttm: Provide a generic LRU walker helper
Date: Wed,  3 Jul 2024 17:38:06 +0200
Message-ID: <20240703153813.182001-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
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

Provide a generic LRU walker in TTM, in the spirit of drm_gem_lru_scan()
but building on the restartable TTM LRU functionality.

The LRU walker optionally supports locking objects as part of
a ww mutex locking transaction, to mimic to some extent the
current functionality in ttm. However any -EDEADLK return
is converted to -ENOSPC and then to -ENOMEM before reaching
the driver, so that the driver will need to backoff and possibly retry
without being able to keep the ticket.

v3:
- Move the helper to core ttm.
- Remove the drm_exec usage from it for now, it will be
  reintroduced later in the series.
v4:
- Handle the -EALREADY case if ticketlocking.
v6:
- Some cleanup and added code comments (Matthew Brost)
- Clarified the ticketlock in the commit message (Matthew Brost)

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 156 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          |  35 +++++++
 2 files changed, 191 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0b3f4267130c..c4f678f30fc2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -768,3 +768,159 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, ttm);
 	return ret;
 }
+
+static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
+				 struct ttm_buffer_object *bo,
+				 bool *needs_unlock)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+
+	*needs_unlock = false;
+
+	if (dma_resv_trylock(bo->base.resv)) {
+		*needs_unlock = true;
+		return true;
+	}
+
+	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
+		dma_resv_assert_held(bo->base.resv);
+		return true;
+	}
+
+	return false;
+}
+
+static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
+				   struct ttm_buffer_object *bo,
+				   bool *needs_unlock)
+{
+	struct dma_resv *resv = bo->base.resv;
+	int ret;
+
+	if (walk->ctx->interruptible)
+		ret = dma_resv_lock_interruptible(resv, walk->ticket);
+	else
+		ret = dma_resv_lock(resv, walk->ticket);
+
+	if (!ret) {
+		*needs_unlock = true;
+		/*
+		 * Only a single ticketlock per loop. Ticketlocks are prone
+		 * to return -EDEADLK causing the eviction to fail, so
+		 * after waiting for the ticketlock, revert back to
+		 * trylocking for this walk.
+		 */
+		walk->ticket = NULL;
+	} else if (ret == -EDEADLK) {
+		/* Caller needs to exit the ww transaction. */
+		ret = -ENOSPC;
+	}
+
+	return ret;
+}
+
+static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
+{
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+}
+
+/**
+ * ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
+ * valid items.
+ * @walk: describe the walks and actions taken
+ * @bdev: The TTM device.
+ * @man: The struct ttm_resource manager whose LRU lists we're walking.
+ * @target: The end condition for the walk.
+ *
+ * The LRU lists of @man are walk, and for each struct ttm_resource encountered,
+ * the corresponding ttm_buffer_object is locked and taken a reference on, and
+ * the LRU lock is dropped. the LRU lock may be dropped before locking and, in
+ * that case, it's verified that the item actually remains on the LRU list after
+ * the lock, and that the buffer object didn't switch resource in between.
+ *
+ * With a locked object, the actions indicated by @walk->process_bo are
+ * performed, and after that, the bo is unlocked, the refcount dropped and the
+ * next struct ttm_resource is processed. Here, the walker relies on
+ * TTM's restartable LRU list implementation.
+ *
+ * Typically @walk->process_bo() would return the number of pages evicted,
+ * swapped or shrunken, so that when the total exceeds @target, or when the
+ * LRU list has been walked in full, iteration is terminated. It's also terminated
+ * on error. Note that the definition of @target is done by the caller, it
+ * could have a different meaning than the number of pages.
+ *
+ * Note that the way dma_resv individualization is done, locking needs to be done
+ * either with the LRU lock held (trylocking only) or with a reference on the
+ * object.
+ *
+ * Return: The progress made towards target or negative error code on error.
+ */
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			    struct ttm_resource_manager *man, long target)
+{
+	struct ttm_resource_cursor cursor;
+	struct ttm_resource *res;
+	long progress = 0;
+	long lret;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		struct ttm_buffer_object *bo = res->bo;
+		bool bo_needs_unlock = false;
+		bool bo_locked = false;
+		int mem_type;
+
+		if (!bo || bo->resource != res)
+			continue;
+
+		/*
+		 * Attempt a trylock before taking a reference on the bo,
+		 * since if we do it the other way around, and the trylock fails,
+		 * we need to drop the lru lock to put the bo.
+		 */
+
+		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+			bo_locked = true;
+		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
+			 walk->trylock_only)
+			continue;
+
+		if (!ttm_bo_get_unless_zero(bo)) {
+			ttm_lru_walk_unlock(bo, bo_needs_unlock);
+			continue;
+		}
+
+		mem_type = res->mem_type;
+		spin_unlock(&bdev->lru_lock);
+
+		lret = 0;
+		if (!bo_locked)
+			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+
+		/*
+		 * Note that in between the release of the lru lock and the
+		 * ticketlock, the bo may have switched resource,
+		 * and also memory type, since the resource may have been
+		 * freed and allocated again with a different memory type.
+		 * In that case, just skip it.
+		 */
+		if (!lret && bo->resource == res && res->mem_type == mem_type)
+			lret = walk->ops->process_bo(walk, bo);
+
+		ttm_lru_walk_unlock(bo, bo_needs_unlock);
+		ttm_bo_put(bo);
+		if (lret == -EBUSY || lret == -EALREADY)
+			lret = 0;
+		progress = (lret < 0) ? lret : progress + lret;
+
+		cond_resched();
+		spin_lock(&bdev->lru_lock);
+		if (progress < 0 || progress >= target)
+			break;
+	}
+	ttm_resource_cursor_fini_locked(&cursor);
+	spin_unlock(&bdev->lru_lock);
+
+	return progress;
+}
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index ef0f52f56ebc..10bff3aecd5c 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -194,6 +194,41 @@ struct ttm_operation_ctx {
 	uint64_t bytes_moved;
 };
 
+struct ttm_lru_walk;
+
+/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
+struct ttm_lru_walk_ops {
+	/**
+	 * process_bo - Process this bo.
+	 * @walk: struct ttm_lru_walk describing the walk.
+	 * @bo: A locked and referenced buffer object.
+	 *
+	 * Return: Negative error code on error, User-defined positive value
+	 * (typically, but not always number of processed pages) on success.
+	 * On success, the returned values are summed by the walk and the
+	 * walk exits when its garget is met.
+	 * 0 also indicates success, -EBUSY means this bo was skipped.
+	 */
+	long (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
+};
+
+/**
+ * struct ttm_lru_walk - Structure describing a LRU walk.
+ */
+struct ttm_lru_walk {
+	/** @ops: Pointer to the ops structure. */
+	const struct ttm_lru_walk_ops *ops;
+	/** @ctx: Pointer to the struct ttm_operation_ctx. */
+	struct ttm_operation_ctx *ctx;
+	/** @ticket: The struct ww_acquire_ctx if any. */
+	struct ww_acquire_ctx *ticket;
+	/** @tryock_only: Only use trylock for locking. */
+	bool trylock_only;
+};
+
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			    struct ttm_resource_manager *man, long target);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.44.0

