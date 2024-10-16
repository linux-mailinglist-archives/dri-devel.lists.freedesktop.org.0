Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAC9A04D6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7456210E6B7;
	Wed, 16 Oct 2024 08:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvRGELdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E010110E6B7;
 Wed, 16 Oct 2024 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729068993; x=1760604993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Tj4jUNuLYo0eSO4JPe4u6j5JmwyY1TSVuaRCchIkmw=;
 b=hvRGELdre4vzfU8e+kIo3ChcfIbatAwbW6zWPZVzJCRWRJb2wcGE+puQ
 AlE6Kkjgu1SZXWAz+QmFyBkaGN+L5a0iMGLUFh5sTPIivyeqUSqcUz7le
 vlqxXyFOZg9F/qi2YO3zDYp4gz77CZmIgZO6gjiZmfq4AhkaOubXPFSNY
 SPdQGcCbRSOGwlqjY0k7wfequtdQVbG05KVp1s1V+KV1t0EVArztzvQov
 JgabcCHDaFdoEwM13bwREIFW6bYrSI2OVgKRfGM+cH5svg6ndTvvD+KNu
 aPuUgwgQZjv4BkEOe7vInHzbe6543S9L0ZkhMMWC3r2k12KyhiUuuM9Vw Q==;
X-CSE-ConnectionGUID: lLRNGfL9TSWq+kxRkePciQ==
X-CSE-MsgGUID: Kq2H7zCaRlmxfY/N9fzR8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16123004"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="16123004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:33 -0700
X-CSE-ConnectionGUID: Z/CLsFvJR8mLYrocPLOIOw==
X-CSE-MsgGUID: Nfv65HpsT3ShaYW+ZkQ3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78184489"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v11 7/8] drm/xe: Add a shrinker for xe bos
Date: Wed, 16 Oct 2024 10:55:58 +0200
Message-ID: <20241016085559.11840-8-thomas.hellstrom@linux.intel.com>
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

Rather than relying on the TTM watermark accounting add a shrinker
for xe_bos in TT or system memory.

Leverage the newly added TTM per-page shrinking and shmem backup
support.

Although xe doesn't fully support WONTNEED (purgeable) bos yet,
introduce and add shrinker support for purgeable ttm_tts.

v2:
- Cleanups bugfixes and a KUNIT shrinker test.
- Add writeback support, and activate if kswapd.
v3:
- Move the try_shrink() helper to core TTM.
- Minor cleanups.
v4:
- Add runtime pm for the shrinker. Shrinking may require an active
  device for CCS metadata copying.
v5:
- Separately purge ghost- and zombie objects in the shrinker.
- Fix a format specifier - type inconsistency. (Kernel test robot).
v7:
- s/long/s64/ (Christian König)
- s/sofar/progress/ (Matt Brost)
v8:
- Rebase on Xe KUNIT update.
- Add content verifying to the shrinker kunit test.
- Split out TTM changes to a separate patch.
- Get rid of multiple bool arguments for clarity (Matt Brost)
- Avoid an error pointer dereference (Matt Brost)
- Avoid an integer overflow (Matt Auld)
- Address misc review comments by Matt Brost.
v9:
- Fix a compliation error.
- Rebase.
v10:
- Update to new LRU walk interface.
- Rework ghost-, zombie and purged object shrinking.
- Rebase.
v11:
- Use additional TTM helpers.
- Honor __GFP_FS and __GFP_IO
- Rabase.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c           | 194 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  36 ++++
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 258 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 ++
 8 files changed, 506 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da80c29aa363..04aeedc6bdbc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -94,6 +94,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index cd811aa2b227..606559b7353f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -508,8 +508,13 @@ static int shrink_test_run_device(struct xe_device *xe)
 		 * other way around, they may not be subject to swapping...
 		 */
 		if (alloced < purgeable) {
+			xe_ttm_tt_account_subtract(&xe_tt->ttm);
 			xe_tt->purgeable = true;
+			xe_ttm_tt_account_add(&xe_tt->ttm);
 			bo->ttm.priority = 0;
+			spin_lock(&bo->ttm.bdev->lru_lock);
+			ttm_bo_move_to_lru_tail(&bo->ttm);
+			spin_unlock(&bo->ttm.bdev->lru_lock);
 		} else {
 			int ret = shrink_test_fill_random(bo, &prng, link);
 
@@ -564,7 +569,6 @@ static int shrink_test_run_device(struct xe_device *xe)
 				if (ret == -EINTR)
 					intr = true;
 			} while (ret == -EINTR && !signal_pending(current));
-
 			if (!ret && !purgeable)
 				failed = shrink_test_verify(test, bo, count, &prng, link);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..d0223ab689dc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -10,6 +10,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -25,6 +26,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_shrinker.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -278,9 +280,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	}
 }
 
+/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
 struct xe_ttm_tt {
 	struct ttm_tt ttm;
-	struct device *dev;
+	/** @xe - The xe device */
+	struct xe_device *xe;
 	struct sg_table sgt;
 	struct sg_table *sg;
 	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
@@ -293,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
 
 	if (xe_tt->sg)
 		return 0;
@@ -301,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
 						num_pages, 0,
 						(u64)num_pages << PAGE_SHIFT,
-						xe_sg_segment_size(xe_tt->dev),
+						xe_sg_segment_size(xe_tt->xe->drm.dev),
 						GFP_KERNEL);
 	if (ret)
 		return ret;
 
 	xe_tt->sg = &xe_tt->sgt;
-	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg, DMA_BIDIRECTIONAL,
+	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
 		sg_free_table(xe_tt->sg);
@@ -323,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
 		xe_tt->sg = NULL;
@@ -338,21 +343,47 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+/*
+ * Account ttm pages against the device shrinker's shrinkable and
+ * purgeable counts.
+ */
+static void xe_ttm_tt_account_add(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
+}
+
+static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
+}
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ttm_tt *tt;
+	struct xe_ttm_tt *xe_tt;
+	struct ttm_tt *tt;
 	unsigned long extra_pages;
 	enum ttm_caching caching = ttm_cached;
 	int err;
 
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt)
+	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
+	if (!xe_tt)
 		return NULL;
 
-	tt->dev = xe->drm.dev;
+	tt = &xe_tt->ttm;
+	xe_tt->xe = xe;
 
 	extra_pages = 0;
 	if (xe_bo_needs_ccs_pages(bo))
@@ -398,42 +429,60 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
+	if (ttm_bo->type != ttm_bo_type_sg)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
-		kfree(tt);
+		kfree(xe_tt);
+		return NULL;
+	}
+
+	tt->backup = ttm_backup_shmem_create((loff_t)tt->num_pages << PAGE_SHIFT);
+	if (IS_ERR(tt->backup)) {
+		tt->backup = NULL;
+		ttm_tt_fini(tt);
+		kfree(xe_tt);
 		return NULL;
 	}
 
-	return &tt->ttm;
+	return tt;
 }
 
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 	int err;
 
 	/*
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
 	 */
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return 0;
 
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
 
-	return err;
+	xe_tt->purgeable = false;
+	xe_ttm_tt_account_add(tt);
+
+	return 0;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return;
 
 	xe_tt_unmap_sg(tt);
 
-	return ttm_pool_free(&ttm_dev->pool, tt);
+	ttm_pool_free(&ttm_dev->pool, tt);
+	xe_ttm_tt_account_subtract(tt);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -854,6 +903,111 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	return ret;
 }
 
+static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
+			       struct ttm_buffer_object *bo,
+			       unsigned long *scanned)
+{
+	long lret;
+
+	/* Fake move to system, without copying data. */
+	if (bo->resource->mem_type != XE_PL_SYSTEM) {
+		struct ttm_resource *new_resource;
+
+		lret = ttm_bo_wait_ctx(bo, ctx);
+		if (lret)
+			return lret;
+
+		lret = ttm_bo_mem_space(bo, &sys_placement, &new_resource, ctx);
+		if (lret)
+			return lret;
+
+		xe_tt_unmap_sg(bo->ttm);
+		ttm_bo_move_null(bo, new_resource);
+	}
+
+	*scanned += bo->ttm->num_pages;
+	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+			     {.purge = true,
+			      .writeback = false,
+			      .allow_move = false});
+
+	if (lret > 0)
+		xe_ttm_tt_account_subtract(bo->ttm);
+
+	return lret;
+}
+
+/**
+ * xe_bo_shrink() - Try to shrink an xe bo.
+ * @ctx: The struct ttm_operation_ctx used for shrinking.
+ * @bo: The TTM buffer object whose pages to shrink.
+ * @flags: Flags governing the shrink behaviour.
+ * @scanned: Pointer to a counter of the number of pages
+ * attempted to shrink.
+ *
+ * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
+ * Note that we need to be able to handle also non xe bos
+ * (ghost bos), but only if the struct ttm_tt is embedded in
+ * a struct xe_ttm_tt. When the function attempts to shrink
+ * the pages of a buffer object, The value pointed to by @scanned
+ * is updated.
+ *
+ * Return: The number of pages shrunken or purged, or negative error
+ * code on failure.
+ */
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned)
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
+	struct xe_device *xe = xe_tt->xe;
+	bool needs_rpm;
+	long lret = 0L;
+
+	if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
+	    (flags.purge && !xe_tt->purgeable))
+		return -EBUSY;
+
+	if (!ttm_bo_eviction_valuable(bo, &place))
+		return -EBUSY;
+
+	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
+		return xe_bo_shrink_purge(ctx, bo, scanned);
+
+	if (xe_tt->purgeable) {
+		if (bo->resource->mem_type != XE_PL_SYSTEM)
+			lret = xe_bo_move_notify(xe_bo, ctx);
+		if (!lret)
+			lret = xe_bo_shrink_purge(ctx, bo, scanned);
+		goto out_unref;
+	}
+
+	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
+	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
+		     xe_bo_needs_ccs_pages(xe_bo));
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		goto out_unref;
+
+	*scanned += tt->num_pages;
+	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+			     {.purge = false,
+			      .writeback = flags.writeback,
+			      .allow_move = true});
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	if (lret > 0)
+		xe_ttm_tt_account_subtract(tt);
+
+out_unref:
+	xe_bo_put(xe_bo);
+
+	return lret;
+}
+
 /**
  * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
  * @bo: The buffer object to move.
@@ -1754,6 +1908,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1812,6 +1968,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1846,6 +2004,8 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1874,6 +2034,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..33f546bfb4e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -134,6 +134,28 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
 
 void xe_bo_put(struct xe_bo *bo);
 
+/*
+ * xe_bo_get_unless_zero() - Conditionally obtain a GEM object refcount on an
+ * xe bo
+ * @bo: The bo for which we want to obtain a refcount.
+ *
+ * There is a short window between where the bo's GEM object refcount reaches
+ * zero and where we put the final ttm_bo reference. Code in the eviction- and
+ * shrinking path should therefore attempt to grab a gem object reference before
+ * trying to use members outside of the base class ttm object. This function is
+ * intended for that purpose. On successful return, this function must be paired
+ * with an xe_bo_put().
+ *
+ * Return: @bo on success, NULL on failure.
+ */
+static inline __must_check struct xe_bo *xe_bo_get_unless_zero(struct xe_bo *bo)
+{
+	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
+		return NULL;
+
+	return bo;
+}
+
 static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
 {
 	if (bo)
@@ -318,6 +340,20 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
+/**
+ * struct xe_bo_shrink_flags - flags governing the shrink behaviour.
+ * @purge: Only purging allowed. Don't shrink if bo not purgeable.
+ * @writeback: Attempt to immediately move content to swap.
+ */
+struct xe_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 088369897aa7..ef49aace937b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -49,6 +49,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_shrinker.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -297,6 +298,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
+		xe_shrinker_destroy(xe->mem.shrinker);
+
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
@@ -329,6 +333,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe->mem.shrinker = xe_shrinker_create(xe);
+	if (IS_ERR(xe->mem.shrinker))
+		return ERR_CAST(xe->mem.shrinker);
+
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 85bede4dd646..0eaa8e9f12f3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -365,6 +365,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..d9bb3ecab74e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/shrinker.h>
+
+#include <drm/ttm/ttm_backup.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "xe_bo.h"
+#include "xe_pm.h"
+#include "xe_shrinker.h"
+
+/**
+ * struct xe_shrinker - per-device shrinker
+ * @xe: Back pointer to the device.
+ * @lock: Lock protecting accounting.
+ * @shrinkable_pages: Number of pages that are currently shrinkable.
+ * @purgeable_pages: Number of pages that are currently purgeable.
+ * @shrink: Pointer to the mm shrinker.
+ * @pm_worker: Worker to wake up the device if required.
+ */
+struct xe_shrinker {
+	struct xe_device *xe;
+	rwlock_t lock;
+	long shrinkable_pages;
+	long purgeable_pages;
+	struct shrinker *shrink;
+	struct work_struct pm_worker;
+};
+
+static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
+{
+	return shrink->private_data;
+}
+
+/**
+ * xe_shrinker_mod_pages() - Modify shrinker page accounting
+ * @shrinker: Pointer to the struct xe_shrinker.
+ * @shrinkable: Shrinkable pages delta. May be negative.
+ * @purgeable: Purgeable page delta. May be negative.
+ *
+ * Modifies the shrinkable and purgeable pages accounting.
+ */
+void
+xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
+{
+	write_lock(&shrinker->lock);
+	shrinker->shrinkable_pages += shrinkable;
+	shrinker->purgeable_pages += purgeable;
+	write_unlock(&shrinker->lock);
+}
+
+static s64 xe_shrinker_walk(struct xe_device *xe,
+			    struct ttm_operation_ctx *ctx,
+			    const struct xe_bo_shrink_flags flags,
+			    unsigned long to_scan, unsigned long *scanned)
+{
+	unsigned int mem_type;
+	s64 freed = 0, lret;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+		struct ttm_bo_lru_cursor curs;
+		struct ttm_buffer_object *ttm_bo;
+
+		if (!man || !man->use_tt)
+			continue;
+
+		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
+			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
+				continue;
+
+			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			if (lret < 0)
+				return lret;
+
+			freed += lret;
+			if (*scanned >= to_scan)
+				break;
+		}
+	}
+
+	return freed;
+}
+
+static unsigned long
+xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
+
+	num_pages = ttm_backup_shmem_bytes_avail() >> PAGE_SHIFT;
+	read_lock(&shrinker->lock);
+
+	if (can_backup)
+		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
+	else
+		num_pages = 0;
+
+	num_pages += shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+/*
+ * Check if we need runtime pm, and if so try to grab a reference if
+ * already active. If grabbing a reference fails, queue a worker that
+ * does it for us outside of reclaim, but don't wait for it to complete.
+ * If bo shrinking needs an rpm reference and we don't have it (yet),
+ * that bo will be skipped anyway.
+ */
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
+				       unsigned long nr_to_scan, bool can_backup)
+{
+	struct xe_device *xe = shrinker->xe;
+
+	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
+	    !ttm_backup_shmem_bytes_avail())
+		return false;
+
+	if (!force) {
+		read_lock(&shrinker->lock);
+		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
+		read_unlock(&shrinker->lock);
+		if (!force)
+			return false;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
+			xe_pm_runtime_get(xe);
+			return true;
+		}
+		queue_work(xe->unordered_wq, &shrinker->pm_worker);
+		return false;
+	}
+
+	return true;
+}
+
+static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
+{
+	if (runtime_pm)
+		xe_pm_runtime_put(shrinker->xe);
+}
+
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
+	};
+	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
+	struct xe_bo_shrink_flags shrink_flags = {
+		.purge = true,
+		/* Don't request writeback without __GFP_IO. */
+		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
+	};
+	bool runtime_pm;
+	bool purgeable;
+	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
+	s64 lret;
+
+	nr_to_scan = sc->nr_to_scan;
+
+	read_lock(&shrinker->lock);
+	purgeable = !!shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	/* Might need runtime PM. Try to wake early if it looks like it. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
+
+	if (purgeable && nr_scanned < nr_to_scan) {
+		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+					nr_to_scan, &nr_scanned);
+		if (lret >= 0)
+			freed += lret;
+	}
+
+	sc->nr_scanned = nr_scanned;
+	if (nr_scanned >= nr_to_scan || !can_backup)
+		goto out;
+
+	/* If we didn't wake before, try to do it now if needed. */
+	if (!runtime_pm)
+		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
+
+	shrink_flags.purge = false;
+	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+				nr_to_scan, &nr_scanned);
+	if (lret >= 0)
+		freed += lret;
+
+	sc->nr_scanned = nr_scanned;
+out:
+	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+	return nr_scanned ? freed : SHRINK_STOP;
+}
+
+/* Wake up the device for shrinking. */
+static void xe_shrinker_pm(struct work_struct *work)
+{
+	struct xe_shrinker *shrinker =
+		container_of(work, typeof(*shrinker), pm_worker);
+
+	xe_pm_runtime_get(shrinker->xe);
+	xe_pm_runtime_put(shrinker->xe);
+}
+
+/**
+ * xe_shrinker_create() - Create an xe per-device shrinker
+ * @xe: Pointer to the xe device.
+ *
+ * Returns: A pointer to the created shrinker on success,
+ * Negative error code on failure.
+ */
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
+{
+	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
+
+	if (!shrinker)
+		return ERR_PTR(-ENOMEM);
+
+	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
+	if (!shrinker->shrink) {
+		kfree(shrinker);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
+	shrinker->xe = xe;
+	rwlock_init(&shrinker->lock);
+	shrinker->shrink->count_objects = xe_shrinker_count;
+	shrinker->shrink->scan_objects = xe_shrinker_scan;
+	shrinker->shrink->private_data = shrinker;
+	shrinker_register(shrinker->shrink);
+
+	return shrinker;
+}
+
+/**
+ * xe_shrinker_destroy() - Destroy an xe per-device shrinker
+ * @shrinker: Pointer to the shrinker to destroy.
+ */
+void xe_shrinker_destroy(struct xe_shrinker *shrinker)
+{
+	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
+	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
+	shrinker_free(shrinker->shrink);
+	flush_work(&shrinker->pm_worker);
+	kfree(shrinker);
+}
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
new file mode 100644
index 000000000000..28a038f4fcbf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_SHRINKER_H_
+#define _XE_SHRINKER_H_
+
+struct xe_shrinker;
+struct xe_device;
+
+void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
+
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
+
+void xe_shrinker_destroy(struct xe_shrinker *shrinker);
+
+#endif
-- 
2.46.0

