Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28517AE4952
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4950510E3ED;
	Mon, 23 Jun 2025 15:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEnlt/ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74CD10E3DC;
 Mon, 23 Jun 2025 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750694014; x=1782230014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCf5ZxagjMYvW0AwIIfIsWNXKU94WdUdzC+w6TsLqoU=;
 b=jEnlt/NDgnSd2I5yVzxWuwinY5OhfWfMofjm+WAjGWOla6of3+Mp0XcK
 63AdEiMTatZMdjnfwkEdTAmpUaNzpSIhZAoo9AmAh2YIo2aAqUa3bPfa+
 ME3wUDVSlEXNN0WkHnkxg+kJqqQM3H7lCi3CpO9zpdNLbzO/ZAHe21tzN
 CNFSOISpJlQKwrCtNkaY2jhXHEvWvncXJIoudPYEMsaQAtmrMRi6u/nAX
 Ci5WxSPLdT+jO5IGRJCOo9IzMySg/Ka00t1OnZgkZeEFXzGxQBN7AgYVE
 Z5Mk2QyFg3z9kxjC4Ak7qKqZMoaaHRQqSHAZ/rq3h/EElncqffX8skROe w==;
X-CSE-ConnectionGUID: ZbE30J2PSMy0iyBrVs+CBg==
X-CSE-MsgGUID: w0ihyrQzS3mSrNQLwvD0Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52625706"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52625706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:34 -0700
X-CSE-ConnectionGUID: wfE0v0utReu/oQc8v4aEnQ==
X-CSE-MsgGUID: ThwYZ0KOQTCsfUyskWxCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="156198855"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/3] drm/ttm: Use a struct for the common part of struct
 ttm_lru_walk and struct ttm_bo_lru_cursor
Date: Mon, 23 Jun 2025 17:53:11 +0200
Message-ID: <20250623155313.4901-2-thomas.hellstrom@linux.intel.com>
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

Let the locking functions take the new struct ttm_lru_walk_arg
as argument in order for them to be easily used from both
types of walk.

v2:
- Whitespace fix

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 24 ++++++++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 26 ++++++++++++++------------
 include/drm/ttm/ttm_bo.h          | 23 ++++++++++++++---------
 3 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bb9c5c8e16b5..f4d9e68b21e7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -526,11 +526,11 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 		return 0;
 
 	if (bo->deleted) {
-		lret = ttm_bo_wait_ctx(bo, walk->ctx);
+		lret = ttm_bo_wait_ctx(bo, walk->arg.ctx);
 		if (!lret)
 			ttm_bo_cleanup_memtype_use(bo);
 	} else {
-		lret = ttm_bo_evict(bo, walk->ctx);
+		lret = ttm_bo_evict(bo, walk->arg.ctx);
 	}
 
 	if (lret)
@@ -566,8 +566,10 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	struct ttm_bo_evict_walk evict_walk = {
 		.walk = {
 			.ops = &ttm_evict_walk_ops,
-			.ctx = ctx,
-			.ticket = ticket,
+			.arg = {
+				.ctx = ctx,
+				.ticket = ticket,
+			}
 		},
 		.place = place,
 		.evictor = evictor,
@@ -576,7 +578,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	};
 	s64 lret;
 
-	evict_walk.walk.trylock_only = true;
+	evict_walk.walk.arg.trylock_only = true;
 	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 
 	/* One more attempt if we hit low limit? */
@@ -590,12 +592,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	/* Reset low limit */
 	evict_walk.try_low = evict_walk.hit_low = false;
 	/* If ticket-locking, repeat while making progress. */
-	evict_walk.walk.trylock_only = false;
+	evict_walk.walk.arg.trylock_only = false;
 
 retry:
 	do {
 		/* The walk may clear the evict_walk.walk.ticket field */
-		evict_walk.walk.ticket = ticket;
+		evict_walk.walk.arg.ticket = ticket;
 		evict_walk.evicted = 0;
 		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 	} while (!lret && evict_walk.evicted);
@@ -1106,7 +1108,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	struct ttm_place place = {.mem_type = bo->resource->mem_type};
 	struct ttm_bo_swapout_walk *swapout_walk =
 		container_of(walk, typeof(*swapout_walk), walk);
-	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct ttm_operation_ctx *ctx = walk->arg.ctx;
 	s64 ret;
 
 	/*
@@ -1217,8 +1219,10 @@ s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	struct ttm_bo_swapout_walk swapout_walk = {
 		.walk = {
 			.ops = &ttm_swap_ops,
-			.ctx = ctx,
-			.trylock_only = true,
+			.arg = {
+				.ctx = ctx,
+				.trylock_only = true,
+			},
 		},
 		.gfp_flags = gfp_flags,
 	};
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b9a772b26fa1..5433eb87593d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -773,10 +773,12 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	return ret;
 }
 
-static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
+static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
 				 struct ttm_buffer_object *bo,
 				 bool *needs_unlock)
 {
+	struct ttm_operation_ctx *ctx = arg->ctx;
+
 	*needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
@@ -792,17 +794,17 @@ static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
 	return false;
 }
 
-static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
+static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
 				   struct ttm_buffer_object *bo,
 				   bool *needs_unlock)
 {
 	struct dma_resv *resv = bo->base.resv;
 	int ret;
 
-	if (walk->ctx->interruptible)
-		ret = dma_resv_lock_interruptible(resv, walk->ticket);
+	if (arg->ctx->interruptible)
+		ret = dma_resv_lock_interruptible(resv, arg->ticket);
 	else
-		ret = dma_resv_lock(resv, walk->ticket);
+		ret = dma_resv_lock(resv, arg->ticket);
 
 	if (!ret) {
 		*needs_unlock = true;
@@ -812,7 +814,7 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 		 * after waiting for the ticketlock, revert back to
 		 * trylocking for this walk.
 		 */
-		walk->ticket = NULL;
+		arg->ticket = NULL;
 	} else if (ret == -EDEADLK) {
 		/* Caller needs to exit the ww transaction. */
 		ret = -ENOSPC;
@@ -879,10 +881,10 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		 * since if we do it the other way around, and the trylock fails,
 		 * we need to drop the lru lock to put the bo.
 		 */
-		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
+		if (ttm_lru_walk_trylock(&walk->arg, bo, &bo_needs_unlock))
 			bo_locked = true;
-		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
-			 walk->trylock_only)
+		else if (!walk->arg.ticket || walk->arg.ctx->no_wait_gpu ||
+			 walk->arg.trylock_only)
 			continue;
 
 		if (!ttm_bo_get_unless_zero(bo)) {
@@ -895,7 +897,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		lret = 0;
 		if (!bo_locked)
-			lret = ttm_lru_walk_ticketlock(walk, bo, &bo_needs_unlock);
+			lret = ttm_lru_walk_ticketlock(&walk->arg, bo, &bo_needs_unlock);
 
 		/*
 		 * Note that in between the release of the lru lock and the
@@ -972,7 +974,7 @@ ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
 {
 	memset(curs, 0, sizeof(*curs));
 	ttm_resource_cursor_init(&curs->res_curs, man);
-	curs->ctx = ctx;
+	curs->arg.ctx = ctx;
 
 	return curs;
 }
@@ -983,7 +985,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
 {
 	struct ttm_buffer_object *bo = res->bo;
 
-	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
+	if (!ttm_lru_walk_trylock(&curs->arg, bo, &curs->needs_unlock))
 		return NULL;
 
 	if (!ttm_bo_get_unless_zero(bo)) {
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8ad6e2713625..c19ac92c33a9 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -207,11 +207,9 @@ struct ttm_lru_walk_ops {
 };
 
 /**
- * struct ttm_lru_walk - Structure describing a LRU walk.
+ * struct ttm_lru_walk_arg - Common part for the variants of BO LRU walk.
  */
-struct ttm_lru_walk {
-	/** @ops: Pointer to the ops structure. */
-	const struct ttm_lru_walk_ops *ops;
+struct ttm_lru_walk_arg {
 	/** @ctx: Pointer to the struct ttm_operation_ctx. */
 	struct ttm_operation_ctx *ctx;
 	/** @ticket: The struct ww_acquire_ctx if any. */
@@ -220,6 +218,16 @@ struct ttm_lru_walk {
 	bool trylock_only;
 };
 
+/**
+ * struct ttm_lru_walk - Structure describing a LRU walk.
+ */
+struct ttm_lru_walk {
+	/** @ops: Pointer to the ops structure. */
+	const struct ttm_lru_walk_ops *ops;
+	/** @arg: Common bo LRU walk arguments. */
+	struct ttm_lru_walk_arg arg;
+};
+
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
@@ -466,11 +474,6 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 struct ttm_bo_lru_cursor {
 	/** @res_curs: Embedded struct ttm_resource_cursor. */
 	struct ttm_resource_cursor res_curs;
-	/**
-	 * @ctx: The struct ttm_operation_ctx used while looping.
-	 * governs the locking mode.
-	 */
-	struct ttm_operation_ctx *ctx;
 	/**
 	 * @bo: Buffer object pointer if a buffer object is refcounted,
 	 * NULL otherwise.
@@ -481,6 +484,8 @@ struct ttm_bo_lru_cursor {
 	 * unlock before the next iteration or after loop exit.
 	 */
 	bool needs_unlock;
+	/** @arg: Common BO LRU walk arguments. */
+	struct ttm_lru_walk_arg arg;
 };
 
 void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
-- 
2.49.0

