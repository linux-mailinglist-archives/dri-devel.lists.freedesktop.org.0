Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4BF914FF2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72110E478;
	Mon, 24 Jun 2024 14:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxabmSW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B93A10E475;
 Mon, 24 Jun 2024 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719239410; x=1750775410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3Cla2JCQszP9km9X7AcyTYHwnV6ZvTANqIcH5k8kEY=;
 b=QxabmSW8GmY8BDi8P/bTZKD6CrGkavOXWPfSGX6sCFajna+sVfmnHpns
 AxbPFJvfapHOvdyIzXQpnQEAk8A5/gqkxHeyHiMnNAyR2YuFbA7HsemPD
 CIV3xcq+wFEDCtLkJliFRd12iyRveo3JGfV6qTeQCCjCtUV3q5CWtBLCA
 0xe6QqzyO0J5KVwoqQL0VX+KUhNzp/fSkwqA1nzYGi7bvj+ThTko+EGrr
 O0gYPhXQOgP1qJk3cycFfgoY5kZ+V9ctyUQ9nsfg8NzTrM/kCxAMlHLQz
 g5Jo+JUkLeX7dM2Hf5y7AMKHCPQGJ0UVTgU7at1kfRmhPF5C2QV+A5lcw Q==;
X-CSE-ConnectionGUID: F7dK/4A+TQOEE4gaUMMZGw==
X-CSE-MsgGUID: fi8p3A+uTp+TRlswf5M5Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16037592"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16037592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 07:30:02 -0700
X-CSE-ConnectionGUID: wrX8slaARPmBciTg7dvi6A==
X-CSE-MsgGUID: jc3kMkeyTk6UIe8zc+XppA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="44020182"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 07:30:01 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 2/2] drm/xe/lnl: Offload system clear page activity to GPU
Date: Mon, 24 Jun 2024 16:14:56 +0200
Message-ID: <20240624141456.23195-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240624141456.23195-1-nirmoy.das@intel.com>
References: <20240624141456.23195-1-nirmoy.das@intel.com>
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

On LNL because of flat CCS, driver creates a migrate job to clear
CCS meta data. Extend that to also clear system pages using GPU.
Inform TTM to allocate pages without __GFP_ZERO to avoid double page
clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
clearn-on-free as XE now takes care of clearing pages.

To test the patch, I created a small test that tries to submit a job
after binding various sizes of buffer which shows good gains for larger
buffer. For lower buffer sizes, the result is not very reliable as the
results vary a lot.

With the patch
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719237905 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 9493 us
Time taken for size SZ_2M: 5503 us
Time taken for size SZ_64M: 13016 us
Time taken for size SZ_128M: 29464 us
Time taken for size SZ_256M: 38408 us
Time taken for size SZ_1G: 148758 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 3889 us
Time taken for size SZ_2M: 6091 us
Time taken for size SZ_64M: 20920 us
Time taken for size SZ_128M: 32394 us
Time taken for size SZ_256M: 61710 us
Time taken for size SZ_1G: 215437 us
Subtest basic-store-benchmark: SUCCESS (0.589s)

With the patch:
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719238062 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 11803 us
Time taken for size SZ_2M: 4237 us
Time taken for size SZ_64M: 8649 us
Time taken for size SZ_128M: 14682 us
Time taken for size SZ_256M: 22156 us
Time taken for size SZ_1G: 74457 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 5129 us
Time taken for size SZ_2M: 12563 us
Time taken for size SZ_64M: 14860 us
Time taken for size SZ_128M: 26064 us
Time taken for size SZ_256M: 47167 us
Time taken for size SZ_1G: 170304 us
Subtest basic-store-benchmark: SUCCESS (0.417s)

With the patch and init_on_alloc=0
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=1719238219 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 4803 us
Time taken for size SZ_2M: 9212 us
Time taken for size SZ_64M: 9643 us
Time taken for size SZ_128M: 13479 us
Time taken for size SZ_256M: 22429 us
Time taken for size SZ_1G: 83110 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 4003 us
Time taken for size SZ_2M: 4443 us
Time taken for size SZ_64M: 12960 us
Time taken for size SZ_128M: 13741 us
Time taken for size SZ_256M: 26841 us
Time taken for size SZ_1G: 84746 us
Subtest basic-store-benchmark: SUCCESS (0.290s)

v2: Handle regression on dgfx(Himal)
    Update commit message as no ttm API changes needed.
v3: Fix Kunit test.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 11 +++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  5 +++--
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..a9ce4347a7d7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -399,6 +399,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
 	int err;
 
 	/*
@@ -408,6 +409,10 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
+	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
+	if (xe->mem.gpu_page_clear)
+		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
+
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
@@ -417,9 +422,15 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return;
 
+	/* Add TTM_TT_FLAG_CLEARED_ON_FREE when GPU is set to clear pages */
+	if (xe->mem.gpu_page_clear)
+		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	xe_tt_unmap_sg(tt);
 
 	return ttm_pool_free(&ttm_dev->pool, tt);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ca5e8435485a..c9afff1d0734 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
+	/**
+	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
+	 * and use GPU to clear pages as well.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
+		xe->mem.gpu_page_clear = true;
+
 	err = xe_vram_probe(xe);
 	if (err)
 		goto err_irq_shutdown;
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
index 05f933787860..61bf3d80e896 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
+	bool clear_on_create = xe->mem.gpu_page_clear || !clear_system_ccs;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
@@ -1032,7 +1033,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					!clear_on_create ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
 
 		if (xe_device_has_flat_ccs(xe))
@@ -1060,7 +1061,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		if (!clear_system_ccs)
+		if (clear_on_create)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
 		if (xe_device_has_flat_ccs(xe)) {
-- 
2.42.0

