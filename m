Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4ED90C433
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E510E5A9;
	Tue, 18 Jun 2024 07:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POXpBIak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9846210E5A3;
 Tue, 18 Jun 2024 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695126; x=1750231126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VSOZXNkBNqbEa7t5l8unBWmFDdTavYig+ZUUf1FznY=;
 b=POXpBIak3JDqPGM43zEyFb1EKP8hAmLigGCz5hUnuungbhS75Avug99n
 zabfYlxalP6DecPfXEGQFp38bybCb2PRsvjOSaIrQDDcGTwygFlqlCPo1
 zYSHjZNm138keio1Xvsi8TKOtgDV5w2EJFb1t9x5TggDf/NZOaz/E1zgL
 hoeVNmNcg64SVfP22lajLE/K77WdRFDbKbYpM1Wob5gRGG2qP4NeFY581
 9PlNEx/YfwpduCKTcoDYy28N89S6l5YcM/6+uow0gIzrX3bjAS9GSjvXH
 sj9K8XkD6IabKltKQpxulhgsgqdeYobcJez3j+rB/KX1ZlvlF/5TXmcN+ g==;
X-CSE-ConnectionGUID: zLlmW/LAT3GJ9swXJSG+vw==
X-CSE-MsgGUID: qalkEJINRCavcy4cJ+s26w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389336"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:46 -0700
X-CSE-ConnectionGUID: jdLgPnHLRiuD1fPzsC3yWg==
X-CSE-MsgGUID: YkAf9vzZR62/wIfWOFrAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910743"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/12] drm/ttm: Use the LRU walker helper for swapping
Date: Tue, 18 Jun 2024 09:18:14 +0200
Message-ID: <20240618071820.130917-7-thomas.hellstrom@linux.intel.com>
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

Rework the TTM swapping to use the LRU walker helper.
This helps fixing up the ttm_bo_swapout() interface
to be consistent about not requiring any locking.

For now mimic the current behaviour of using trylock
only. We could be using ticket-locks here but defer
that until it's deemed necessary. The TTM swapout
functionality is a bit weird anyway since it
alternates between memory types without exhausting
TTM_PL_SYSTEM first.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 112 +++++++++++++++++++++----------
 drivers/gpu/drm/ttm/ttm_device.c |  30 ++-------
 include/drm/ttm/ttm_bo.h         |   5 +-
 3 files changed, 83 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 43eda720657f..63a91b77f7da 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1118,11 +1118,23 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
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
+static long
+ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 {
-	struct ttm_place place;
-	bool locked;
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct ttm_bo_swapout_walk *swapout_walk =
+		container_of(walk, typeof(*swapout_walk), walk);
+	struct ttm_operation_ctx *ctx = walk->ctx;
 	long ret;
 
 	/*
@@ -1131,28 +1143,29 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * The driver may use the fact that we're moving from SYSTEM
 	 * as an indication that we're about to swap out.
 	 */
-	memset(&place, 0, sizeof(place));
-	place.mem_type = bo->resource->mem_type;
-	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
-		return -EBUSY;
+	if (!bo->bdev->funcs->eviction_valuable(bo, &place)) {
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
 out:
+	/* Consider some error codes fatal. Others may continue the walk. */
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS ||
+	    ret == -EAGAIN || ret > 0)
+		return ret;
 
-	/*
-	 * Unreserve without putting on LRU to avoid swapping out an
-	 * already swapped buffer.
-	 */
-	if (locked)
-		dma_resv_unlock(bo->base.resv);
-	ttm_bo_put(bo);
-	return ret == -EBUSY ? -ENOSPC : ret;
+	return 0;
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
+ * @target: The desired number of pages to swap out.
+ *
+ * Return: The number of pages actually swapped out, or negative error code
+ * on error.
+ */
+long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		    struct ttm_resource_manager *man, gfp_t gfp_flags,
+		    pgoff_t target)
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
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f9e9b1ec8c8a..ee575d8a54c0 100644
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
+	long lret;
 
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
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8b032298d66e..472a55b69afb 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -410,8 +410,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-		   gfp_t gfp_flags);
+long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
+		    struct ttm_resource_manager *man, gfp_t gfp_flags,
+		    pgoff_t target);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_mem_evict_first(struct ttm_device *bdev,
-- 
2.44.0

