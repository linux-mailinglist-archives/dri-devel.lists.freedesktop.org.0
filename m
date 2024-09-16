Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0AF97A47A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8DA10E3A5;
	Mon, 16 Sep 2024 14:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7003kxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89D510E3A9;
 Mon, 16 Sep 2024 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726498311; x=1758034311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ym8mdaAkB+dXBYTVbmhaTVZprwHT/NtSCwXnzODRSRs=;
 b=W7003kxByCmM7pb/pga7b8IBwOTMW76BAfw8iGHd28cg22lmBms/Y/B1
 N3rpi99Qp6RIVqWshxDmj9kWaqqXU1wHON2CKkMUGMc24BrhLBREYF1VK
 pvws8tR5fCuhDhJOupx8hCgHXFbu7JNhYTRvo6bW9Fu5w4A0j5CYm1LH1
 /wy5pPo/C/PsmJ6cJGUmbOy0sq6N+kemULh+ZOwAcSOKl6p+WYELmdmyM
 viiiqX4zZADM7wFzQLdWni17j5Lih07xdT09i1llOlreWEn81s05rVnC/
 jTs9KD4nqvB5afli2c2gH5rB0Qz5p0m3lJaGf+x/xUEQWS0RzgzLkmcAV A==;
X-CSE-ConnectionGUID: 2dnyUnbLRPSJQv3YD7724w==
X-CSE-MsgGUID: yGDYmkMhQf+JGwSAYqeX1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25259479"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25259479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:51 -0700
X-CSE-ConnectionGUID: 9E/aQTwVR1uLgNwIoMfKhA==
X-CSE-MsgGUID: YnTxCizkQRmodAUFqNMuVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68572970"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.45])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v10 5/7] drm/ttm: Add a shrinker helper and a macro to perform
 LRU iteration
Date: Mon, 16 Sep 2024 16:51:10 +0200
Message-ID: <20240916145112.3336-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
References: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
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

Following the design direction communicated here:

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

Export the LRU walker for driver shrinker use and add a bo
shrinker helper for initial use by the xe driver.

v8:
- Split out from another patch.
- Use a struct for bool arguments to increase readability (Matt Brost).
- Unmap user-space cpu-mappings before shrinking pages.
- Explain non-fatal error codes (Matt Brost)

v10:
- Instead of using the existing helper, Wrap the interface inside out and
  provide a loop to de-midlayer things the LRU iteration (Christian König).
- Removing the R-B by Matt Brost since the patch was significantly changed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 204 +++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo.h          |  88 +++++++++++++
 2 files changed, 288 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 454a51239614..b619cd7b3fab 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -769,12 +769,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	return ret;
 }
 
-static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
+static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
 				 struct ttm_buffer_object *bo,
 				 bool *needs_unlock)
 {
-	struct ttm_operation_ctx *ctx = walk->ctx;
-
 	*needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
@@ -877,7 +875,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		 * since if we do it the other way around, and the trylock fails,
 		 * we need to drop the lru lock to put the bo.
 		 */
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
 			bo_locked = true;
 		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
 			 walk->trylock_only)
@@ -920,3 +918,201 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
+
+/**
+ * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
+ * @ctx: The struct ttm_operation_ctx used for the shrinking operation.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_try_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return 0;
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0) {
+		if (lret == -ERESTARTSYS)
+			return lret;
+		return 0;
+	}
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+
+	if (lret < 0 && lret != -EINTR)
+		return 0;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_try_shrink);
+
+static void ttm_bo_lru_cursor_cleanup_bo(struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = curs->bo;
+
+	if (bo) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		ttm_bo_put(bo);
+		curs->bo = NULL;
+	}
+}
+
+/**
+ * ttm_bo_lru_cursor_fini() - Stop using a struct ttm_bo_lru_cursor
+ * and clean up any iteration it was used for.
+ * @curs: The cursor.
+ */
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+	spin_lock(lru_lock);
+	ttm_resource_cursor_fini(&curs->res_curs);
+	spin_unlock(lru_lock);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
+
+/**
+ * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
+ * @curs: The ttm_bo_lru_cursor to initialize.
+ * @man: The ttm resource_manager whose LRU lists to iterate over.
+ * @ctx: The ttm_operation_ctx to govern the locking.
+ *
+ * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
+ * or prelocked buffer objects are available as detailed by
+ * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
+ * supported.
+ *
+ * Return: Pointer to @curs. The function does not fail.
+ */
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx)
+{
+	memset(curs, 0, sizeof(*curs));
+	ttm_resource_cursor_init(&curs->res_curs, man);
+	curs->ctx = ctx;
+
+	return curs;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
+
+static struct ttm_buffer_object *
+ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = res->bo;
+
+	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
+		return NULL;
+
+	if (!ttm_bo_get_unless_zero(bo)) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		return NULL;
+	}
+
+	curs->bo = bo;
+	return bo;
+}
+
+/**
+ * ttm_bo_lru_cursor_next() - Continue iterating a manager's LRU lists
+ * to find and lock buffer object.
+ * @curs: The cursor initialized using ttm_bo_lru_cursor_init() and
+ * ttm_bo_lru_cursor_first().
+ *
+ * Return: A pointer to a locked and reference-counted buffer object,
+ * or NULL if none could be found and looping should be terminated.
+ */
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_resource *res = NULL;
+	struct ttm_buffer_object *bo;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+
+	spin_lock(lru_lock);
+	for (;;) {
+		res = ttm_resource_manager_next(&curs->res_curs);
+		if (!res)
+			break;
+
+		bo = ttm_bo_from_res_reserved(res, curs);
+		if (bo)
+			break;
+	}
+
+	spin_unlock(lru_lock);
+	return res ? bo : NULL;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
+
+/**
+ * ttm_bo_lru_cursor_first() - Start iterating a manager's LRU lists
+ * to find and lock buffer object.
+ * @curs: The cursor initialized using ttm_bo_lru_cursor_init().
+ *
+ * Return: A pointer to a locked and reference-counted buffer object,
+ * or NULL if none could be found and looping should be terminated.
+ */
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
+
+	spin_lock(lru_lock);
+	res = ttm_resource_manager_first(&curs->res_curs);
+	if (!res) {
+		spin_unlock(lru_lock);
+		return NULL;
+	}
+
+	bo = ttm_bo_from_res_reserved(res, curs);
+	spin_unlock(lru_lock);
+
+	return bo ? bo : ttm_bo_lru_cursor_next(curs);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 7b56d1ca36d7..48749c097f93 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -225,6 +225,23 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_try_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
@@ -463,4 +480,75 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 
+/* Driver LRU walk helpers initially targeted for shrinking. */
+
+/**
+ * struct ttm_bo_lru_cursor - Iterator cursor for TTM LRU list looping
+ */
+struct ttm_bo_lru_cursor {
+	/** @res_curs: Embedded struct ttm_resource_cursor. */
+	struct ttm_resource_cursor res_curs;
+	/**
+	 * @ctx: The struct ttm_operation_ctx used while looping.
+	 * governs the locking mode.
+	 */
+	struct ttm_operation_ctx *ctx;
+	/**
+	 * @bo: Buffer object pointer if a buffer object is refcounted,
+	 * NULL otherwise.
+	 */
+	struct ttm_buffer_object *bo;
+	/**
+	 * @needs_unlock: Valid iff @bo != NULL. The bo resv needs
+	 * unlock before the next iteration or after loop exit.
+	 */
+	bool needs_unlock;
+};
+
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
+
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs);
+
+/*
+ * Defines needed to use autocleanup (linux/cleanup.h) with struct ttm_bo_lru_cursor.
+ */
+DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
+	     ttm_bo_lru_cursor_init(curs, man, ctx),
+	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
+	     struct ttm_operation_ctx *ctx);
+static inline void *
+class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
+{ return *_T; }
+
+/**
+ * ttm_bo_lru_for_each_reserved_guarded() - Iterate over buffer objects owning
+ * resources on LRU lists.
+ * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
+ * @_man: The resource manager whose LRU lists to iterate over.
+ * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
+ * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
+ * for the current iteration.
+ *
+ * Iterate over all resources of @_man and for each resource, attempt to
+ * reference and lock (using the locking mode detailed in @_ctx) the buffer
+ * object it points to. If successful, assign @_bo to the address of the
+ * buffer object and update @_cursor. The iteration is guarded in the
+ * sense that @_cursor will be initialized before looping start and cleaned
+ * up at looping termination, even if terminated prematurely by, for
+ * example a return or break statement. Exiting the loop will also unlock
+ * (if needed) and unreference @_bo.
+ */
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))
+
 #endif
-- 
2.46.0

