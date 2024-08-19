Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB49565B3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27CD10E202;
	Mon, 19 Aug 2024 08:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVZorEPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410EF10E202;
 Mon, 19 Aug 2024 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724056517; x=1755592517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7INc+hw7jFd7k4aNXLA+ga+c35EFkhuzItcOtupZTaA=;
 b=iVZorEPSEnl1PXRtiU/83m0beXdzX++0GnBTB88C3rwA6LTx2/kMV/h/
 2lJRqWUbrNvslVksYSTKPKnTU4oyA6wcPAwwKSGP+gnFmBURVRYA7mgf8
 fmQga6VxHJVu2osU4i0tCpl3gaTIANPF+5cvfDAWQWISC5Mchf2Mfkz6M
 rYYUgMxmmYWm78MUO6TNuohMHfd5gZg3hFYHymuHtW3ucTYYrhDkNQuY+
 RcYFdpav35hcImNoSwD0lCAdM7HbuMxmX3JlRQe1aBt6FFXLtXOpnIXzy
 cgFaY59U+bnTaYZuiPbTrnvlYav/v7gTZ/J/U3pJnbcIOilTONQzlf/Jk A==;
X-CSE-ConnectionGUID: Ja4XM76yScaTYG8CGv/pPA==
X-CSE-MsgGUID: SgVFGvaNSpCUgkRrxolLwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32958500"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="32958500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:35:16 -0700
X-CSE-ConnectionGUID: Nw6pd0AySxilsIoUSmEb+w==
X-CSE-MsgGUID: GF9rKKp/SbaHT2yJZ/7lDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="59962289"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.132])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:35:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [PATCH v9 5/6] drm/xe: Add a shrinker for xe bos
Date: Mon, 19 Aug 2024 10:34:48 +0200
Message-ID: <20240819083449.56701-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240819083449.56701-1-thomas.hellstrom@linux.intel.com>
References: <20240819083449.56701-1-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     | 224 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c           | 166 +++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  36 ++++
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 289 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 ++
 8 files changed, 728 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b9670ae09a9e..3ca597253fd2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -92,6 +92,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 8dac069483e8..536e8eca9108 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,11 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include <linux/iosys-map.h>
+#include <linux/random.h>
+
+#include <uapi/linux/sysinfo.h>
+
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
@@ -358,9 +363,228 @@ static void xe_bo_evict_kunit(struct kunit *test)
 	evict_test_run_device(xe);
 }
 
+struct xe_bo_link {
+	struct list_head link;
+	struct xe_bo *bo;
+	u32 val;
+};
+
+#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
+
+static int shrink_test_fill_random(struct xe_bo *bo, struct rnd_state *state,
+				   struct xe_bo_link *link)
+{
+	struct iosys_map map;
+	int ret = ttm_bo_vmap(&bo->ttm, &map);
+	size_t __maybe_unused i;
+
+	if (ret)
+		return ret;
+
+	for (i = 0; i < bo->ttm.base.size; i += sizeof(u32)) {
+		u32 val = prandom_u32_state(state);
+
+		iosys_map_wr(&map, i, u32, val);
+		if (i == 0)
+			link->val = val;
+	}
+
+	ttm_bo_vunmap(&bo->ttm, &map);
+	return 0;
+}
+
+static bool shrink_test_verify(struct kunit *test, struct xe_bo *bo,
+			       unsigned int bo_nr, struct rnd_state *state,
+			       struct xe_bo_link *link)
+{
+	struct iosys_map map;
+	int ret = ttm_bo_vmap(&bo->ttm, &map);
+	size_t i;
+	bool failed = false;
+
+	if (ret) {
+		KUNIT_FAIL(test, "Error mapping bo %u for content check.\n", bo_nr);
+		return true;
+	}
+
+	for (i = 0; i < bo->ttm.base.size; i += sizeof(u32)) {
+		u32 val = prandom_u32_state(state);
+
+		if (iosys_map_rd(&map, i, u32) != val) {
+			KUNIT_FAIL(test, "Content not preserved, bo %u offset 0x%016llx",
+				   bo_nr, (unsigned long long)i);
+			kunit_info(test, "Failed value is 0x%08x, recorded 0x%08x\n",
+				   (unsigned int)iosys_map_rd(&map, i, u32), val);
+			if (i == 0 && val != link->val)
+				kunit_info(test, "Looks like PRNG is out of sync.\n");
+			failed = true;
+			break;
+		}
+	}
+
+	ttm_bo_vunmap(&bo->ttm, &map);
+
+	return failed;
+}
+
+/*
+ * Try to create system bos corresponding to twice the amount
+ * of available system memory to test shrinker functionality.
+ * If no swap space is available to accommodate the
+ * memory overcommit, mark bos purgeable.
+ */
+static int shrink_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	LIST_HEAD(bos);
+	struct xe_bo_link *link, *next;
+	struct sysinfo si;
+	size_t total, alloced;
+	unsigned int interrupted = 0, successful = 0, count = 0;
+	struct rnd_state prng;
+	u64 rand_seed;
+	bool failed = false;
+
+	rand_seed = get_random_u64();
+	prandom_seed_state(&prng, rand_seed);
+
+	si_meminfo(&si);
+	total = si.freeram * si.mem_unit;
+
+	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
+		   (unsigned long)total);
+
+	total <<= 1;
+	for (alloced = 0; alloced < total ; alloced += XE_BO_SHRINK_SIZE) {
+		struct xe_bo *bo;
+		unsigned int mem_type;
+		struct xe_ttm_tt *xe_tt;
+
+		link = kzalloc(sizeof(*link), GFP_KERNEL);
+		if (!link) {
+			KUNIT_FAIL(test, "Unexpected link allocation failure\n");
+			failed = true;
+			break;
+		}
+
+		INIT_LIST_HEAD(&link->link);
+
+		/* We can create bos using WC caching here. But it is slower. */
+		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
+				       DRM_XE_GEM_CPU_CACHING_WB,
+				       XE_BO_FLAG_SYSTEM);
+		if (IS_ERR(bo)) {
+			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
+			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
+				KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
+			kfree(link);
+			failed = true;
+			break;
+		}
+		xe_bo_lock(bo, false);
+		xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
+
+		/*
+		 * If we're low on swap entries, we can't shrink unless the bo
+		 * is marked purgeable.
+		 */
+		if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >> PAGE_SHIFT) * 128) {
+			long num_pages = xe_tt->ttm.num_pages;
+
+			xe_tt->purgeable = true;
+			xe_shrinker_mod_pages(xe->mem.shrinker, -num_pages,
+					      num_pages);
+		} else {
+			int ret = shrink_test_fill_random(bo, &prng, link);
+
+			if (ret) {
+				xe_bo_unlock(bo);
+				xe_bo_put(bo);
+				KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
+					   ERR_PTR(ret));
+				kfree(link);
+				failed = true;
+				break;
+			}
+		}
+
+		mem_type = bo->ttm.resource->mem_type;
+		xe_bo_unlock(bo);
+		link->bo = bo;
+		list_add_tail(&link->link, &bos);
+
+		if (mem_type != XE_PL_TT) {
+			KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
+				   bo->ttm.resource->mem_type);
+			failed = true;
+		}
+		cond_resched();
+		if (signal_pending(current))
+			break;
+	}
+
+	/*
+	 * Read back and destroy bos. Reset the pseudo-random seed to get an
+	 * identical pseudo-random number sequence for readback.
+	 */
+	prandom_seed_state(&prng, rand_seed);
+	list_for_each_entry_safe(link, next, &bos, link) {
+		static struct ttm_operation_ctx ctx = {.interruptible = true};
+		struct xe_bo *bo = link->bo;
+		struct xe_ttm_tt *xe_tt;
+		int ret;
+
+		count++;
+		if (!signal_pending(current) && !failed) {
+			bool purgeable, intr = false;
+
+			xe_bo_lock(bo, NULL);
+
+			/* xe_tt->purgeable is cleared on validate. */
+			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
+			purgeable = xe_tt->purgeable;
+			do {
+				ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
+				if (ret == -EINTR)
+					intr = true;
+			} while (ret == -EINTR && !signal_pending(current));
+
+			if (!ret && !purgeable)
+				failed = shrink_test_verify(test, bo, count, &prng, link);
+
+			xe_bo_unlock(bo);
+			if (ret) {
+				KUNIT_FAIL(test, "Validation failed: %pe\n",
+					   ERR_PTR(ret));
+				failed = true;
+			} else if (intr) {
+				interrupted++;
+			} else {
+				successful++;
+			}
+		}
+		xe_bo_put(link->bo);
+		list_del(&link->link);
+		kfree(link);
+	}
+	kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
+		   interrupted, successful);
+
+	return 0;
+}
+
+static void xe_bo_shrink_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	shrink_test_run_device(xe);
+}
+
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
+			      {.speed = KUNIT_SPEED_SLOW}),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ce8282e67e84..04d30e77ae8b 100644
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
@@ -336,21 +343,47 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
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
@@ -396,42 +429,135 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
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
 		return NULL;
 	}
 
-	return &tt->ttm;
+	tt->backup = ttm_backup_shmem_create((loff_t)tt->num_pages << PAGE_SHIFT);
+	if (IS_ERR(tt->backup)) {
+		tt->backup = NULL;
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
+}
+
+/**
+ * xe_bo_shrink() - Try to shrink an xe bo.
+ * @walk:  - The walk parameters
+ * @bo: The TTM buffer object
+ * @flags: Flags governing the shrink behaviour.
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
+		  const struct xe_bo_shrink_flags flags)
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
+	    (flags.purge && !xe_tt->purgeable))
+		return 0L;
+
+	if (!ttm_bo_eviction_valuable(bo, &place))
+		return 0L;
+
+	/* Beware of zombies (GEM object refcount == 0) and ghosts. */
+	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo)) {
+		lret = ttm_bo_wait_ctx(bo, walk->ctx);
+		if (lret)
+			return lret;
+
+		/*
+		 * We don't allow move from TT to SYSTEM for these objects,
+		 * hence we need to unmap sg first.
+		 */
+		xe_tt_unmap_sg(tt);
+		return ttm_bo_try_shrink(walk, bo, (struct ttm_bo_shrink_flags)
+					 {.purge = true,
+					  .writeback = false,
+					  .allow_move = false});
+	}
+
+	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
+	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
+		     xe_bo_needs_ccs_pages(xe_bo) && !xe_tt->purgeable);
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		goto out_unref;
+
+	lret = ttm_bo_try_shrink(walk, bo, (struct ttm_bo_shrink_flags)
+				 {.purge = xe_tt->purgeable,
+				  .writeback = flags.writeback,
+				  .allow_move = true});
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	if (lret > 0) {
+		xe_assert(xe, !ttm_tt_is_populated(tt));
+
+		xe_ttm_tt_account_subtract(tt);
+	}
+
+out_unref:
+	xe_bo_put(xe_bo);
+
+	return lret;
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1698,6 +1824,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1756,6 +1884,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1790,6 +1920,8 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1818,6 +1950,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 935a94279026..2c70a6bb57eb 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -64,6 +64,7 @@
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
@@ -315,6 +338,19 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
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
+long xe_bo_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6db7e082d88..a50f2e9e9236 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -48,6 +48,7 @@
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
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -326,6 +330,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index fc89420d0ba6..7c89cc764850 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -339,6 +339,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..4de98c1dd4a7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,289 @@
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
+static s64 xe_shrinker_process_bo(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
+{
+	struct xe_shrink_lru_walk *shrink_walk = to_xe_shrink_lru_walk(walk);
+
+	return xe_bo_shrink(walk, bo, (struct xe_bo_shrink_flags)
+			    {.purge = shrink_walk->purge,
+			     .writeback = shrink_walk->writeback});
+}
+
+static s64 xe_shrinker_walk(struct xe_shrink_lru_walk *shrink_walk, s64 target)
+{
+	struct xe_device *xe = shrink_walk->xe;
+	struct ttm_resource_manager *man;
+	unsigned int mem_type;
+	s64 progress = 0;
+	s64 lret;
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
+		progress += lret;
+		if (progress >= target)
+			break;
+	}
+
+	return progress;
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
+	s64 ret;
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
-- 
2.44.0

