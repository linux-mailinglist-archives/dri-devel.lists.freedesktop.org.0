Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9C910738
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D8B10EA20;
	Thu, 20 Jun 2024 14:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpQ2P2yF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC2C10EA20;
 Thu, 20 Jun 2024 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718892147; x=1750428147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RECAOwZvp26Q5+EcRdFgMEkn5ErPxWipANBuyZMHtcg=;
 b=cpQ2P2yFFopAxewVze/hynYB7XbDZ6rtFhzcObLSp1axU3SwTb0q14nj
 jBqQBPO5C8zZENO85zWv4Ppitv2bsquhtBDkQsS45psusKo61ZZ15bNir
 ZugFgMFu2yGhFygfXZewFxunOyWimeeblSjcK++GhE8wTQzsR5eDWmDNq
 KAUZHB5T8NLw7qDfOGvvvy/shGUmJkDBHVNs0HZpIDt0OlwWdFzpjPcdI
 unF+X7kuaia3nEWrJsvss5y3LH3u8ZKNenkrPfN6Ncv3p0NGklRjEuB/R
 7NkaebG9uFyFL2nuuAPkzy9UHgoqtmO3VK29DmEBIkJELVJPiERTbx54l w==;
X-CSE-ConnectionGUID: iiBAMUXbQliwWRUwGlIHzA==
X-CSE-MsgGUID: IPBITd5UQ/iFNfGf1PgT7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16010296"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="16010296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:02:05 -0700
X-CSE-ConnectionGUID: qDtKSG4OSpagiptM5IZlLQ==
X-CSE-MsgGUID: HrNmmLPUTY2R5mpXX4Hjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42147667"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:02:03 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/lnl: Offload system clear page activity to GPU
Date: Thu, 20 Jun 2024 15:46:52 +0200
Message-ID: <20240620134656.14380-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240620134656.14380-1-nirmoy.das@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

On LNL because flat CCS, driver will create a migrate job to clear
CCS meta data. Extend that to also clear pages using GPU with new
ttm pool flag which allows offloading page clear activity to GPU.

This gives very nice improvement for large buffer:
Without the patch:
 ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
Using IGT_SRANDOM=1718889799 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 4882 us
Time taken for size SZ_2M: 3679 us
Time taken for size SZ_64M: 13367 us
Time taken for size SZ_128M: 21034 us
Time taken for size SZ_256M: 32940 us
Time taken for size SZ_1G: 116261 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 5417 us
Time taken for size SZ_2M: 5711 us
Time taken for size SZ_64M: 15718 us
Time taken for size SZ_128M: 26170 us
Time taken for size SZ_256M: 50529 us
Time taken for size SZ_1G: 177933 us
Subtest basic-store-benchmark: SUCCESS (0.504s)

With the patch:
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
Using IGT_SRANDOM=1718889593 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 4479 us
Time taken for size SZ_2M: 3291 us
Time taken for size SZ_64M: 6595 us
Time taken for size SZ_128M: 9069 us
Time taken for size SZ_256M: 12681 us
Time taken for size SZ_1G: 41806 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 3317 us
Time taken for size SZ_2M: 6458 us
Time taken for size SZ_64M: 12802 us
Time taken for size SZ_128M: 19579 us
Time taken for size SZ_256M: 38768 us
Time taken for size SZ_1G: 143250 us
Subtest basic-store-benchmark: SUCCESS (0.328s)

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  4 ++++
 drivers/gpu/drm/xe/xe_device.c       | 36 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++---
 4 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..10ec02412dc4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -387,6 +387,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
+	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
+	if (xe->mem.gpu_page_clear)
+		page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75d4c8ae9234..8e8d54c59aae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -240,8 +240,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
-
-	ttm_device_fini(&xe->ttm);
 }
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
@@ -260,12 +258,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (IS_ERR(xe))
 		return xe;
 
-	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
-			      xe->drm.anon_inode->i_mapping,
-			      xe->drm.vma_offset_manager, false, false);
-	if (WARN_ON(err))
-		goto err;
-
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
@@ -543,6 +535,13 @@ static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
 	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
+static void xe_device_destroy_ttm_device(struct drm_device *dev, void *dummy)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	ttm_device_fini(&xe->ttm);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -550,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 last_gt;
 	u8 id;
+	unsigned int ttm_pool_flags = 0;
 
 	xe_pat_init_early(xe);
 
@@ -572,6 +572,26 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	/* On iGFX device with flat CCS we clear CCS metadata, let's extend that
+	 * and use GPU to clear  pages as well.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe)) {
+		ttm_pool_flags = TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE;
+		xe->mem.gpu_page_clear = true;
+	}
+
+	err = ttm_device_init_with_pool_flags(&xe->ttm, &xe_ttm_funcs,
+					      xe->drm.dev,
+					      xe->drm.anon_inode->i_mapping,
+					      xe->drm.vma_offset_manager,
+					      false, false, ttm_pool_flags);
+	if (WARN_ON(err))
+		return err;
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy_ttm_device, NULL);
+	if (err)
+		return err;
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_early(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..ece68c6f3668 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -325,6 +325,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @gpu_page_clear: clear pages offloaded to GPU */
+		bool gpu_page_clear;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 05f933787860..0023f32d147d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
+	bool clear_on_create = xe->mem.gpu_page_clear;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
@@ -1022,7 +1023,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
 		u32 batch_size, update_idx;
-
 		bool usm = xe->info.has_usm;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
@@ -1032,7 +1032,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					!clear_on_create ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
 
 		if (xe_device_has_flat_ccs(xe))
@@ -1060,7 +1060,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		if (!clear_system_ccs)
+		if (clear_on_create)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
 		if (xe_device_has_flat_ccs(xe)) {
-- 
2.42.0

