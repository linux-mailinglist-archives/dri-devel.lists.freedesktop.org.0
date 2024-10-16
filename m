Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D799A04D4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5812210E6D3;
	Wed, 16 Oct 2024 08:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZY4paLXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A793810E6D3;
 Wed, 16 Oct 2024 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729068988; x=1760604988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imIb7OMm23ON/gr2iugWZnyr7SOe36Nu7PeNXGqQKjI=;
 b=ZY4paLXqwFy8VQKr3NOG927TZfHSgwMSXUUB22LCEeZ/Qv23ON1Voqhc
 ropongga2cKYfiOBMNtuaKK9CVqhvMAxx0KCzmOEk7CK4oob5uU8BpX8f
 0aEvFKsVcX02baJgf3i2QiLraQyQStzY0tbpiFnn95rKquPZXJyb4yY8F
 p0ekSqBoQCjRltwvmhoPucenbebpmfMG9Urbh0ch7bvSA21TZz0D69ibZ
 qmvClrRWT/4IzA7m0SKvM6m6nzz7BCCTg7XT4h2TMjV9rQeVQWwxCdQJ8
 mtCfgAq+Ng0SDJM+Fc/Dr6jfh0hU8I9IZy3n/O7vZWrnZjzjmb65T8NfM w==;
X-CSE-ConnectionGUID: uwMXj1tgT4WatnX+5971Cw==
X-CSE-MsgGUID: yviZgUiMSieuw5QIxerBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16122993"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="16122993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:27 -0700
X-CSE-ConnectionGUID: 707rggnESHuv/ezJ0Abhmw==
X-CSE-MsgGUID: SIKCyVt5ToS8nGLmk7oCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78184465"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v11 5/8] drm/ttm: Add a macro to perform LRU iteration
Date: Wed, 16 Oct 2024 10:55:56 +0200
Message-ID: <20241016085559.11840-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
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

Export a LRU walker for driver shrinker use. The walker
initially supports only trylocking, since that's the
method used by shrinkes. The walker makes use of
scoped_guard() to allow exiting from the LRU walk loop
without performing any explicit unlocking or
cleanup.

v8:
- Split out from another patch.
- Use a struct for bool arguments to increase readability (Matt Brost).
- Unmap user-space cpu-mappings before shrinking pages.
- Explain non-fatal error codes (Matt Brost)

v10:
- Instead of using the existing helper, Wrap the interface inside out and
  provide a loop to de-midlayer things the LRU iteration (Christian König).
- Removing the R-B by Matt Brost since the patch was significantly changed.

v11:
- Split the patch up to include just the LRU walk helper.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 140 +++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo.h          |  71 +++++++++++++++
 2 files changed, 207 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 917096bd5f68..0cac02a9764c 100644
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
@@ -920,3 +918,137 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
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
index 5804408815be..91ecbb64f6c8 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -465,4 +465,75 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
 
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

