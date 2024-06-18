Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACD90C439
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D04F10E5A2;
	Tue, 18 Jun 2024 07:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PufMdQCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8BC10E598;
 Tue, 18 Jun 2024 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695136; x=1750231136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e8AgJTo5trClSkz/yKvSuidIjAHsUi68KmoAxpcfOx0=;
 b=PufMdQCz9A7rrA1AYMjeXM4IV3oV52Gl/gO7kS45hkv4lotN2uoXNE/C
 Hkqkw8KGZGsxiDRIS5M6GZORNjb1jRXX4jGiYWyQLKeTCzj3apI7K44xZ
 6vm6paJvHh6VIX/vG0ae2Ths0d1KHgyXyCrtueJOL2Btt9ZjKjbyab3DK
 pzTB4EUPux66ZD1ZlzKDz6U4SxYT+7DkLtIOgt7HNn5KvoqcirQU4BeVz
 gPO9GqIR5jhjBoQwma/vNkSn4UEsqmbB32BIjVCJ4XKK2EX0wwOuaUCNV
 tHXSTyKqBjAv8ykH2U0GqmnSyQtOW5wjVvDVd5IA9lDyAq9IH1cQ6xsGz g==;
X-CSE-ConnectionGUID: 4xYlI9Q1RIqmRGTabJ4tBw==
X-CSE-MsgGUID: HSgY/zeBRC2XutaE1LxtpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389364"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:55 -0700
X-CSE-ConnectionGUID: 4veJraiPRxqGqBEPzslYeQ==
X-CSE-MsgGUID: 5OcFMxAPQkaDuXs5xh8wFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910843"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
Date: Tue, 18 Jun 2024 09:18:19 +0200
Message-ID: <20240618071820.130917-12-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c     |  67 ++++++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c      | 118 +++++++++++
 drivers/gpu/drm/xe/tests/xe_bo_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h |   1 +
 drivers/gpu/drm/xe/xe_bo.c            | 155 ++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h            |  26 +++
 drivers/gpu/drm/xe/xe_device.c        |   8 +
 drivers/gpu/drm/xe/xe_device_types.h  |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c      | 287 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h      |  18 ++
 include/drm/ttm/ttm_bo.h              |   3 +
 12 files changed, 671 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 45fcaf6f8644..44711f422459 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -913,3 +913,70 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	ttm_resource_cursor_fini(&cursor);
 	return sofar;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
+
+/**
+ * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
+ * @walk: The struct xe_ttm_lru_walk that describes the walk.
+ * @bo: The buffer object.
+ * @purge: Whether to attempt to purge the bo content since it's no
+ * longer needed.
+ * @writeback: If !@purge, attempt to write out to persistent storage.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		       bool purge, bool writeback)
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
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return 0;
+
+	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		if (ret) {
+			if (ret == -EINTR || ret == -EDEADLK ||
+			    ret == -ERESTARTSYS)
+				return ret;
+			return 0;
+		}
+	}
+
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0) {
+		if (lret == -ERESTARTSYS)
+			return lret;
+		return 0;
+	}
+
+	if (bo->deleted)
+		lret = ttm_tt_backup(bo->bdev, tt, true, writeback);
+	else
+		lret = ttm_tt_backup(bo->bdev, tt, purge, writeback);
+	if (lret < 0 && lret != -EINTR)
+		return 0;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_try_shrink);
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1905a80e61e3..46304592d94d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -107,6 +107,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..49617f16dc76 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,8 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include <uapi/linux/sysinfo.h>
+
 #include "tests/xe_bo_test.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
@@ -350,3 +352,119 @@ void xe_bo_evict_kunit(struct kunit *test)
 	xe_call_for_each_device(evict_test_run_device);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
+
+struct xe_bo_link {
+	struct list_head link;
+	struct xe_bo *bo;
+};
+
+#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
+
+/*
+ * Try to create system bos corresponding to twice the amount
+ * of available system memory to test shrinker functionality.
+ * If no swap space is available to accommodate the
+ * memory overcommit, mark bos purgeable.
+ */
+static int shrink_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = xe_cur_kunit();
+	LIST_HEAD(bos);
+	struct xe_bo_link *link, *next;
+	struct sysinfo si;
+	size_t total, alloced;
+	unsigned int interrupted = 0, successful = 0;
+
+	si_meminfo(&si);
+	total = si.freeram * si.mem_unit;
+
+	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
+		   (unsigned long) total);
+
+	total <<= 1;
+	for (alloced = 0; alloced < total ; alloced += XE_BO_SHRINK_SIZE) {
+		struct xe_bo *bo;
+		unsigned int mem_type;
+
+		link = kzalloc(sizeof(*link), GFP_KERNEL);
+		if (!link) {
+			KUNIT_FAIL(test, "Unexpeced link allocation failure\n");
+			break;
+		}
+
+		INIT_LIST_HEAD(&link->link);
+
+		/* We can create bos using WC caching here. But it is slower. */
+		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
+				       DRM_XE_GEM_CPU_CACHING_WB,
+				       ttm_bo_type_device,
+				       XE_BO_FLAG_SYSTEM);
+		if (IS_ERR(bo)) {
+			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
+			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
+				KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
+			kfree(link);
+			break;
+		}
+		link->bo = bo;
+		list_add_tail(&link->link, &bos);
+		xe_bo_lock(bo, false);
+
+		/*
+		 * If we're low on swap entries, we can't shrink unless the bo
+		 * is marked purgeable.
+		 */
+		if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >> PAGE_SHIFT) * 128) {
+			struct xe_ttm_tt *xe_tt =
+				container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
+			long num_pages = xe_tt->ttm.num_pages;
+
+			xe_tt->purgeable = true;
+			xe_shrinker_mod_pages(xe->mem.shrinker, -num_pages,
+					      num_pages);
+		}
+
+		mem_type = bo->ttm.resource->mem_type;
+		xe_bo_unlock(bo);
+		if (mem_type != XE_PL_TT)
+			KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
+				   bo->ttm.resource->mem_type);
+		cond_resched();
+		if (signal_pending(current))
+			break;
+	}
+
+	/* Read back and destroy bos */
+	list_for_each_entry_safe_reverse(link, next, &bos, link) {
+		static struct ttm_operation_ctx ctx = {.interruptible = true};
+		struct xe_bo *bo = link->bo;
+		int ret;
+
+		if (!signal_pending(current)) {
+			xe_bo_lock(bo, NULL);
+			ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
+			xe_bo_unlock(bo);
+			if (ret && ret != -EINTR)
+				KUNIT_FAIL(test, "Validation failed: %pe\n",
+					   ERR_PTR(ret));
+			else if (ret)
+				interrupted++;
+			else
+				successful++;
+		}
+		xe_bo_put(link->bo);
+		list_del(&link->link);
+		kfree(link);
+		cond_resched();
+	}
+	kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
+		   interrupted, successful);
+
+	return 0;
+}
+
+void xe_bo_shrink_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(shrink_test_run_device);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index a324cde77db8..317fa923e287 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -10,6 +10,7 @@
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE(xe_ccs_migrate_kunit),
 	KUNIT_CASE(xe_bo_evict_kunit),
+	KUNIT_CASE_SLOW(xe_bo_shrink_kunit),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
index 0113ab45066a..7f44d14a45c5 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
@@ -10,5 +10,6 @@ struct kunit;
 
 void xe_ccs_migrate_kunit(struct kunit *test);
 void xe_bo_evict_kunit(struct kunit *test);
+void xe_bo_shrink_kunit(struct kunit *test);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..7c62cdf20480 100644
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
@@ -278,11 +280,15 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
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
+	/** @purgeable - Whether the bo is purgeable (WONTNEED) */
+	bool purgeable;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -291,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
 
 	if (xe_tt->sg)
 		return 0;
@@ -299,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
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
@@ -321,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
 		xe_tt->sg = NULL;
@@ -336,21 +343,41 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+/*
+ * Account ttm pages against the device shrinker's shrinkable and
+ * purgeable counts.
+ */
+static void xe_ttm_tt_account(struct ttm_tt *tt, bool add)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	long num_pages = tt->num_pages;
+
+	if (!add)
+		num_pages = -num_pages;
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, num_pages, 0);
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
 	enum ttm_caching caching;
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
@@ -378,42 +405,128 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
 		caching = ttm_write_combined;
 
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
+	if (ttm_bo->type != ttm_bo_type_sg)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
-		kfree(tt);
+		kfree(xe_tt);
 		return NULL;
 	}
 
-	return &tt->ttm;
+	tt->backup = ttm_backup_shmem_create(tt->num_pages << PAGE_SHIFT);
+	if (IS_ERR(tt->backup)) {
+		ttm_tt_fini(tt);
+		kfree(xe_tt);
+		return NULL;
+	}
+
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
+	xe_ttm_tt_account(tt, true);
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
+	xe_ttm_tt_account(tt, false);
+}
+
+/**
+ * xe_bo_shrink() - Try to shrink an xe bo.
+ * @walk:  - The walk parameters
+ * @bo: The TTM buffer object
+ * @purge: Only consider purgeable bos.
+ * @writeback: Try to write back to persistent storage.
+ *
+ * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
+ * Note that we need to be able to handle also non xe bos
+ * (ghost bos), but only if the struct ttm_tt is embedded in
+ * a struct xe_ttm_tt.
+ *
+ * Return: The number of pages shrunken or purged, or negative error
+ * code on failure.
+ */
+long xe_bo_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		  bool purge, bool writeback)
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
+	struct xe_device *xe = xe_tt->xe;
+	bool needs_rpm;
+	long lret = 0L;
+
+	if (!tt || !ttm_tt_is_populated(tt) ||
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
+	    (purge && !xe_tt->purgeable))
+		return 0L;
+
+	if (!ttm_bo_eviction_valuable(bo, &place))
+		return 0L;
+
+	/* Beware of zombies (GEM object refcount == 0) and ghosts. */
+	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo)) {
+		struct ttm_placement null_placement = { .num_placement = 0 };
+
+		lret = ttm_bo_wait_ctx(bo, walk->ctx);
+		if (lret)
+			return lret;
+
+		/* Purge the bo content! */
+		ttm_bo_validate(bo, &null_placement, walk->ctx);
+		return tt->num_pages;
+	}
+
+	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
+	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
+		     xe_bo && xe_bo_needs_ccs_pages(xe_bo) && !xe_tt->purgeable);
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		goto out_unref;
+
+	lret = ttm_bo_try_shrink(walk, bo, xe_tt->purgeable, writeback);
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	if (lret > 0) {
+		xe_assert(xe, !ttm_tt_is_populated(tt));
+
+		xe_ttm_tt_account(tt, false);
+	}
+
+out_unref:
+	xe_bo_put(xe_bo);
+
+	return lret;
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1229,6 +1342,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
@@ -1672,6 +1786,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, false);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1730,6 +1846,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, false);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1764,6 +1882,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, true);
+
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1792,6 +1913,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..8463e3f3f6f1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -63,6 +63,7 @@
 #define XE_BO_PROPS_INVALID	(-1)
 
 struct sg_table;
+struct xe_ttm_lru_walk;
 
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
@@ -126,6 +127,28 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
 	return bo;
 }
 
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
 static inline void xe_bo_put(struct xe_bo *bo)
 {
 	if (bo)
@@ -315,6 +338,9 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
+long xe_bo_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		  bool purge, bool writeback);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94dbfe5cf19c..2c2f54c6e722 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,6 +46,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_shrinker.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -239,6 +240,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
+		xe_shrinker_destroy(xe->mem.shrinker);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -268,6 +272,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index f1c09824b145..0f281008f71c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -324,6 +324,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..3f9554bdc06b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/shrinker.h>
+#include <linux/swap.h>
+
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
+/**
+ * struct xe_shrink_lru_walk - lru_walk subclass for shrinker
+ * @walk: The embedded base class.
+ * @xe: Pointer to the xe device.
+ * @purge: Purgeable only request from the srinker.
+ * @writeback: Try to write back to persistent storage.
+ */
+struct xe_shrink_lru_walk {
+	struct ttm_lru_walk walk;
+	struct xe_device *xe;
+	bool purge;
+	bool writeback;
+};
+
+static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
+{
+	return shrink->private_data;
+}
+
+static struct xe_shrink_lru_walk *
+to_xe_shrink_lru_walk(struct ttm_lru_walk *walk)
+{
+	return container_of(walk, struct xe_shrink_lru_walk, walk);
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
+static long xe_shrinker_process_bo(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
+{
+	struct xe_shrink_lru_walk *shrink_walk = to_xe_shrink_lru_walk(walk);
+
+	return xe_bo_shrink(walk, bo, shrink_walk->purge, shrink_walk->writeback);
+}
+
+static long xe_shrinker_walk(struct xe_shrink_lru_walk *shrink_walk, long target)
+{
+	struct xe_device *xe = shrink_walk->xe;
+	struct ttm_resource_manager *man;
+	unsigned int mem_type;
+	long sofar = 0;
+	long lret;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		man = ttm_manager_type(&xe->ttm, mem_type);
+		if (!man || !man->use_tt)
+			continue;
+
+		lret = ttm_lru_walk_for_evict(&shrink_walk->walk, &xe->ttm, man, target);
+		if (lret < 0)
+			return lret;
+
+		sofar += lret;
+		if (sofar >= target)
+			break;
+	}
+
+	return sofar;
+}
+
+static unsigned long
+xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+
+	num_pages = get_nr_swap_pages();
+	read_lock(&shrinker->lock);
+	num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
+	num_pages += shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+static const struct ttm_lru_walk_ops xe_shrink_ops = {
+	.process_bo = xe_shrinker_process_bo,
+};
+
+/*
+ * Check if we need runtime pm, and if so try to grab a reference if
+ * already active. If grabbing a reference fails, queue a worker that
+ * does it for us outside of reclaim, but don't wait for it to complete.
+ * If bo shrinking needs an rpm reference and we don't have it (yet),
+ * that bo will be skipped anyway.
+ */
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
+				       unsigned long nr_to_scan)
+{
+	struct xe_device *xe = shrinker->xe;
+
+	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
+	    !get_nr_swap_pages())
+		return false;
+
+	if (!force) {
+		read_lock(&shrinker->lock);
+		force = (nr_to_scan > shrinker->purgeable_pages);
+		read_unlock(&shrinker->lock);
+		if (!force)
+			return false;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
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
+	bool is_kswapd = current_is_kswapd();
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = !is_kswapd,
+	};
+	unsigned long nr_to_scan, freed = 0;
+	struct xe_shrink_lru_walk shrink_walk = {
+		.walk = {
+			.ops = &xe_shrink_ops,
+			.ctx = &ctx,
+			.trylock_only = true,
+		},
+		.xe = shrinker->xe,
+		.purge = true,
+		.writeback = is_kswapd,
+	};
+	bool runtime_pm;
+	bool purgeable;
+	long ret;
+
+	sc->nr_scanned = 0;
+	nr_to_scan = sc->nr_to_scan;
+
+	read_lock(&shrinker->lock);
+	purgeable = !!shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	/* Might need runtime PM. Try to wake early if it looks like it. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan);
+
+	while (purgeable && freed < nr_to_scan) {
+		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+	if (freed < nr_to_scan)
+		nr_to_scan -= freed;
+	else
+		nr_to_scan = 0;
+	if (!nr_to_scan)
+		goto out;
+
+	/* If we didn't wake before, try to do it now if needed. */
+	if (!runtime_pm)
+		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0);
+
+	shrink_walk.purge = false;
+	nr_to_scan = sc->nr_to_scan;
+	while (freed < nr_to_scan) {
+		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+
+out:
+	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+	return freed ? freed : SHRINK_STOP;
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
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 148f49f625e4..deaedfb060ed 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -222,6 +222,9 @@ struct ttm_lru_walk {
 long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			    struct ttm_resource_manager *man, long target);
 
+long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		       bool purge, bool writeback);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.44.0

