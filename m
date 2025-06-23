Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB663AE4954
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2B210E3EE;
	Mon, 23 Jun 2025 15:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j02x1IFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD1F10E3EE;
 Mon, 23 Jun 2025 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750694019; x=1782230019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpOjdE6d8kuC0TdWqfGEXfUuqUKbVmkX85aLb9/YrjA=;
 b=j02x1IFhEk50KOodWhnykXbPQ1bRztzGqAtcKeFKO5Ezlk1lxUAUU65X
 32mY54MJs0C0pr4GleSbMLIAs3qgECfl1fAivfyQVupVTObU95jc2XRQP
 YdZucnAhF6bogiX2ydahkjwAZsYqbyaxu9EHcEZI+9grT8oBSCprNFlxt
 dDPSTOwCEvy0ZQvKKAqd9GMp1mi9J2zT/DVR0OO/U4xzhD5Fo6O0UYnkk
 Clm7YHYSBazSqtD1TIExarbmOYfsD6KFdpmTuZuS3Vf8heizhh6sP6uGe
 CJjE5V2Kb5w3IV9Am08/5uvoeAhNi5ZAJ0ZeZUxbOuC/n6H84X+tlVwh3 w==;
X-CSE-ConnectionGUID: jfW3p3YlTBKXJ6AH4HaJ3Q==
X-CSE-MsgGUID: XgAvlodwTTWiqqPyhv/b0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52625721"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52625721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:39 -0700
X-CSE-ConnectionGUID: jEofUGnwRWuBqeYBYVqIeQ==
X-CSE-MsgGUID: o1YbwfrMTaGUhaaLaIIl3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="156198885"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 3/3] drm/ttm, drm_xe,
 Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
Date: Mon, 23 Jun 2025 17:53:13 +0200
Message-ID: <20250623155313.4901-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
References: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
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

To avoid duplicating the tricky bo locking implementation,
Implement ttm_lru_walk_for_evict() using the guarded bo LRU iteration.

To facilitate this, support ticketlocking from the guarded bo LRU
iteration.

v2:
- Clean up some static function interfaces (Christian König)
- Fix Handling -EALREADY from ticketlocking in the loop by
  skipping to the next item. (Intel CI)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 188 ++++++++++++------------------
 drivers/gpu/drm/xe/xe_shrinker.c  |   7 +-
 include/drm/ttm/ttm_bo.h          |   9 +-
 3 files changed, 88 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 6de1f0c432c2..250675d56b1c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -773,16 +773,15 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	return ret;
 }
 
-static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
-				 struct ttm_buffer_object *bo,
-				 bool *needs_unlock)
+static bool ttm_lru_walk_trylock(struct ttm_bo_lru_cursor *curs,
+				 struct ttm_buffer_object *bo)
 {
-	struct ttm_operation_ctx *ctx = arg->ctx;
+	struct ttm_operation_ctx *ctx = curs->arg->ctx;
 
-	*needs_unlock = false;
+	curs->needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
-		*needs_unlock = true;
+		curs->needs_unlock = true;
 		return true;
 	}
 
@@ -794,10 +793,10 @@ static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
 	return false;
 }
 
-static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
-				   struct ttm_buffer_object *bo,
-				   bool *needs_unlock)
+static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
+				   struct ttm_buffer_object *bo)
 {
+	struct ttm_lru_walk_arg *arg = curs->arg;
 	struct dma_resv *resv = bo->base.resv;
 	int ret;
 
@@ -807,7 +806,7 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
 		ret = dma_resv_lock(resv, arg->ticket);
 
 	if (!ret) {
-		*needs_unlock = true;
+		curs->needs_unlock = true;
 		/*
 		 * Only a single ticketlock per loop. Ticketlocks are prone
 		 * to return -EDEADLK causing the eviction to fail, so
@@ -823,12 +822,6 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
 	return ret;
 }
 
-static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
-{
-	if (locked)
-		dma_resv_unlock(bo->base.resv);
-}
-
 /**
  * ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
  * valid items.
@@ -863,64 +856,21 @@ static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target)
 {
-	struct ttm_resource_cursor cursor;
-	struct ttm_resource *res;
+	struct ttm_bo_lru_cursor cursor;
+	struct ttm_buffer_object *bo;
 	s64 progress = 0;
 	s64 lret;
 
-	spin_lock(&bdev->lru_lock);
-	ttm_resource_cursor_init(&cursor, man);
-	ttm_resource_manager_for_each_res(&cursor, res) {
-		struct ttm_buffer_object *bo = res->bo;
-		bool bo_needs_unlock = false;
-		bool bo_locked = false;
-		int mem_type;
-
-		/*
-		 * Attempt a trylock before taking a reference on the bo,
-		 * since if we do it the other way around, and the trylock fails,
-		 * we need to drop the lru lock to put the bo.
-		 */
-		if (ttm_lru_walk_trylock(&walk->arg, bo, &bo_needs_unlock))
-			bo_locked = true;
-		else if (!walk->arg.ticket || walk->arg.ctx->no_wait_gpu ||
-			 walk->arg.trylock_only)
-			continue;
-
-		if (!ttm_bo_get_unless_zero(bo)) {
-			ttm_lru_walk_unlock(bo, bo_needs_unlock);
-			continue;
-		}
-
-		mem_type = res->mem_type;
-		spin_unlock(&bdev->lru_lock);
-
-		lret = 0;
-		if (!bo_locked)
-			lret = ttm_lru_walk_ticketlock(&walk->arg, bo, &bo_needs_unlock);
-
-		/*
-		 * Note that in between the release of the lru lock and the
-		 * ticketlock, the bo may have switched resource,
-		 * and also memory type, since the resource may have been
-		 * freed and allocated again with a different memory type.
-		 * In that case, just skip it.
-		 */
-		if (!lret && bo->resource && bo->resource->mem_type == mem_type)
-			lret = walk->ops->process_bo(walk, bo);
-
-		ttm_lru_walk_unlock(bo, bo_needs_unlock);
-		ttm_bo_put(bo);
+	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &walk->arg, bo) {
+		lret = walk->ops->process_bo(walk, bo);
 		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		progress = (lret < 0) ? lret : progress + lret;
-
-		spin_lock(&bdev->lru_lock);
 		if (progress < 0 || progress >= target)
 			break;
 	}
-	ttm_resource_cursor_fini(&cursor);
-	spin_unlock(&bdev->lru_lock);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	return progress;
 }
@@ -960,10 +910,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
  * @man: The ttm resource_manager whose LRU lists to iterate over.
  * @arg: The ttm_lru_walk_arg to govern the walk.
  *
- * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
- * or prelocked buffer objects are available as detailed by
- * @arg->ctx.resv and @arg->ctx.allow_res_evict. Ticketlocking is not
- * supported.
+ * Initialize a struct ttm_bo_lru_cursor.
  *
  * Return: Pointer to @curs. The function does not fail.
  */
@@ -981,21 +928,67 @@ ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
 EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
 
 static struct ttm_buffer_object *
-ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
+__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
 {
-	struct ttm_buffer_object *bo = res->bo;
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_resource *res = NULL;
+	struct ttm_buffer_object *bo;
+	struct ttm_lru_walk_arg *arg = curs->arg;
+	bool first = !curs->bo;
 
-	if (!ttm_lru_walk_trylock(curs->arg, bo, &curs->needs_unlock))
-		return NULL;
+	ttm_bo_lru_cursor_cleanup_bo(curs);
 
-	if (!ttm_bo_get_unless_zero(bo)) {
-		if (curs->needs_unlock)
-			dma_resv_unlock(bo->base.resv);
-		return NULL;
+	spin_lock(lru_lock);
+	for (;;) {
+		int mem_type, ret = 0;
+		bool bo_locked = false;
+
+		if (first) {
+			res = ttm_resource_manager_first(&curs->res_curs);
+			first = false;
+		} else {
+			res = ttm_resource_manager_next(&curs->res_curs);
+		}
+		if (!res)
+			break;
+
+		bo = res->bo;
+		if (ttm_lru_walk_trylock(curs, bo))
+			bo_locked = true;
+		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
+			continue;
+
+		if (!ttm_bo_get_unless_zero(bo)) {
+			if (curs->needs_unlock)
+				dma_resv_unlock(bo->base.resv);
+			continue;
+		}
+
+		mem_type = res->mem_type;
+		spin_unlock(lru_lock);
+		if (!bo_locked)
+			ret = ttm_lru_walk_ticketlock(curs, bo);
+
+		/*
+		 * Note that in between the release of the lru lock and the
+		 * ticketlock, the bo may have switched resource,
+		 * and also memory type, since the resource may have been
+		 * freed and allocated again with a different memory type.
+		 * In that case, just skip it.
+		 */
+		curs->bo = bo;
+		if (!ret && bo->resource && bo->resource->mem_type == mem_type)
+			return bo;
+
+		ttm_bo_lru_cursor_cleanup_bo(curs);
+		if (ret && ret != -EALREADY)
+			return ERR_PTR(ret);
+
+		spin_lock(lru_lock);
 	}
 
-	curs->bo = bo;
-	return bo;
+	spin_unlock(lru_lock);
+	return res ? bo : NULL;
 }
 
 /**
@@ -1009,25 +1002,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
  */
 struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
 {
-	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
-	struct ttm_resource *res = NULL;
-	struct ttm_buffer_object *bo;
-
-	ttm_bo_lru_cursor_cleanup_bo(curs);
-
-	spin_lock(lru_lock);
-	for (;;) {
-		res = ttm_resource_manager_next(&curs->res_curs);
-		if (!res)
-			break;
-
-		bo = ttm_bo_from_res_reserved(res, curs);
-		if (bo)
-			break;
-	}
-
-	spin_unlock(lru_lock);
-	return res ? bo : NULL;
+	return __ttm_bo_lru_cursor_next(curs);
 }
 EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
 
@@ -1041,21 +1016,8 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
  */
 struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
 {
-	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
-	struct ttm_buffer_object *bo;
-	struct ttm_resource *res;
-
-	spin_lock(lru_lock);
-	res = ttm_resource_manager_first(&curs->res_curs);
-	if (!res) {
-		spin_unlock(lru_lock);
-		return NULL;
-	}
-
-	bo = ttm_bo_from_res_reserved(res, curs);
-	spin_unlock(lru_lock);
-
-	return bo ? bo : ttm_bo_lru_cursor_next(curs);
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+	return __ttm_bo_lru_cursor_next(curs);
 }
 EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
 
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index f8a1129da2c3..1c3c04d52f55 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -66,7 +66,10 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
 		struct ttm_bo_lru_cursor curs;
 		struct ttm_buffer_object *ttm_bo;
-		struct ttm_lru_walk_arg arg = {.ctx = ctx};
+		struct ttm_lru_walk_arg arg = {
+			.ctx = ctx,
+			.trylock_only = true,
+		};
 
 		if (!man || !man->use_tt)
 			continue;
@@ -83,6 +86,8 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 			if (*scanned >= to_scan)
 				break;
 		}
+		/* Trylocks should never error, just fail. */
+		xe_assert(xe, !IS_ERR(ttm_bo));
 	}
 
 	return freed;
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index ab9a6b343a53..894ff7ccd68e 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -529,10 +529,15 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
  * up at looping termination, even if terminated prematurely by, for
  * example a return or break statement. Exiting the loop will also unlock
  * (if needed) and unreference @_bo.
+ *
+ * Return: If locking of a bo returns an error, then iteration is terminated
+ * and @_bo is set to a corresponding error pointer. It's illegal to
+ * dereference @_bo after loop exit.
  */
 #define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
 	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
-		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
-		     (_bo) = ttm_bo_lru_cursor_next(_cursor))
+		for ((_bo) = ttm_bo_lru_cursor_first(_cursor);		\
+		       !IS_ERR_OR_NULL(_bo);				\
+		       (_bo) = ttm_bo_lru_cursor_next(_cursor))
 
 #endif
-- 
2.49.0

