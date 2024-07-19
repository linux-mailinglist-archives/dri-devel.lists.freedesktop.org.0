Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729D937682
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68C610EBB2;
	Fri, 19 Jul 2024 10:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pvv1R8mj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1549510EBB2;
 Fri, 19 Jul 2024 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721383878; x=1752919878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6snlh21hYGMqimH2sxpok/geLk8LtjhcUDMRHc0u2FM=;
 b=Pvv1R8mjiF1Neuk7A00izhD2nWUTb7aAdCa0uJljWNBKtMj1N34yo68L
 8RnqHjmLa45ZvHJfAfPWyBMzBHSfFIudQk255Nq7mWxFWMwknEWxWwc36
 +2MKwu9dX4BoNZPTyerjO7kKHFC5wxUN5yaNSQXHAXQG70hKMeIG3rafG
 BqOJ/6WtDwTxOsHuI0Y6NVBFVWkerLsC8hiF32NqtMTStnWH6UwXsLnv6
 EWeyT46eC18xFdBSuIZ2onMKi05NyykpGmig5LMzJwYG4jt/4L6O4Ga0C
 2iuoliOiPrMzYx/BjANx0bUdYcP8UY0ZIXMKi+OMkyeNbDihb5xqHI0VY w==;
X-CSE-ConnectionGUID: qniXGPByQK2qitLfqTv6Rw==
X-CSE-MsgGUID: Rz1w/qQsQMim/r8WnUu9RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22753313"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="22753313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:11:18 -0700
X-CSE-ConnectionGUID: YwXMurHdRr6qJElDVDanTA==
X-CSE-MsgGUID: gz1HObPbTsaMb+WMRidfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="50758630"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:11:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 3/3] drm/xe/lnl: Offload system clear page activity to GPU
Date: Fri, 19 Jul 2024 11:55:06 +0200
Message-ID: <20240719095506.4068-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240719095506.4068-1-nirmoy.das@intel.com>
References: <20240719095506.4068-1-nirmoy.das@intel.com>
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
clearn-on-free as XE now takes care of clearing pages. If a bo
is in system placement and there is a cpu map then for such BO gpu
clear will be avoided as there is no dma mapping for such BO at
that moment.

To test the patch, created a small test that tries to submit a job
after binding various sizes of buffer which shows good gains for larger
buffer. For lower buffer sizes, the result is not very reliable as the
results vary a lot for both CPU and GPU page clearing.

With the patch
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
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
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
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
sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
basic-store-benchmark
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
v4: handle data leak on cpu mmap(Thomas)
v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
    it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |  8 ++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0b7202dd4c9e..668c4c0f5ff0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -396,6 +396,14 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
+	/*
+	 * If the device can support gpu clear system pages then set proper ttm
+	 * flag. Zeroed pages are only required for ttm_bo_type_device so
+	 * unwanted data is not leaked to userspace.
+	 */
+	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
+		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
@@ -417,6 +425,10 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
+	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
+	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
+		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
+
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
@@ -659,8 +671,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
+	bool clear_system_pages;
 	int ret = 0;
 
+	/*
+	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
+	 * moving to system as the bo doesn't have dma_mapping.
+	 */
+	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
+		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -683,8 +703,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
+	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm && ttm_bo->type == ttm_bo_type_device);
+		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
+		clear_system_pages;
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -796,7 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (move_lacks_source) {
 			u32 flags = 0;
 
-			if (mem_type_is_vram(new_mem->mem_type))
+			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
 				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
 			else if (handle_system_ccs)
 				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 36252d5b1663..203ad50c894e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -332,6 +332,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
+		bool gpu_page_clear_sys;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..fde0512a838a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -117,5 +117,13 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
+
+	/*
+	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
+	 * and use GPU to clear pages as well.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
+		xe->mem.gpu_page_clear_sys = true;
+
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
-- 
2.42.0

