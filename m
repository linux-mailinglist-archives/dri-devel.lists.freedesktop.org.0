Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4D954C41
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 16:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DF610E7CA;
	Fri, 16 Aug 2024 14:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNc8FDaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F210E7CF;
 Fri, 16 Aug 2024 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723818016; x=1755354016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q2nnQZADhg/2I7vZQJOn2jVb7SmKhfe/x1YFHMhBpwY=;
 b=QNc8FDaDRgNAw/eyRvyd9JYGCEpQSs2wPGrgR7h38dQgXAr9DIXH8Pj/
 12QpTpFRJp2BDnU0KzDTdYsZ20XDoYKksKO/EBNJXoo1xDE6g+uPUu2Wp
 YQ2yOYJ+N5MDNEPyQs83GuQpkp4UqLa5GKUP0e9MW0HihL8TN/ot+naOE
 pASpX7nZgKHznIZ8Q+lMJCmPrwq+4S529VS/KJTU4QpA0dgUWc+XltEIv
 i6rPJanMYXillVpCzI3HYaMkNAOmd1ImVRR3Fjurs5GEwl3Wr4VupWyD1
 xnB2LjaucZQkVehBfk9eujIkUdYSRSHcOWuOIs+BYhfsHP3GtXa3HKt+Y A==;
X-CSE-ConnectionGUID: 999y+3xhSGij2sI85uDRGw==
X-CSE-MsgGUID: f7VS+AHnT3+cwMEx7ZmUxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21927897"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21927897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:20:16 -0700
X-CSE-ConnectionGUID: 4IiEA+VbTnOcQo1eVGtmyA==
X-CSE-MsgGUID: 6Zj/5k0xRHuW2uwMaaghXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59705135"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:20:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 2/2] drm/xe/lnl: Offload system clear page activity to GPU
Date: Fri, 16 Aug 2024 15:51:54 +0200
Message-ID: <20240816135154.19678-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240816135154.19678-1-nirmoy.das@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
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

On LNL because of flat CCS, driver creates migrates job to clear
CCS meta data. Extend that to also clear system pages using GPU.
Inform TTM to allocate pages without __GFP_ZERO to avoid double page
clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's clear
on free as XE now takes care of clearing pages. If a bo is in system
placement such as BO created with  DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
and there is a cpu map then for such BO gpu clear will be avoided as
there is no dma mapping for such BO at that moment to create migration
jobs.

Tested this patch api_overhead_benchmark_l0 from
https://github.com/intel/compute-benchmarks

Without the patch:
api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
UsmMemoryAllocation(api=l0 type=Host size=4KB) 84.206 us
UsmMemoryAllocation(api=l0 type=Host size=1GB) 105775.56 us
erf tool top 5 entries:
71.44% api_overhead_be  [kernel.kallsyms]   [k] clear_page_erms
6.34%  api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
2.24%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
2.15%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
1.94%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res

With the patch:
api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
Perf tool top 5 entries:
11.16% api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
7.85%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
7.59%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
7.24%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
5.53%  api_overhead_be  [kernel.kallsyms]   [k] lookup_address_in_pgd_attr

Without this patch clear_page_erms() dominates execution time which is
also not pipelined with migration jobs. With this patch page clearing
will get pipelined with migration job and will free CPU for more work.

v2: Handle regression on dgfx(Himal)
    Update commit message as no ttm API changes needed.
v3: Fix Kunit test.
v4: handle data leak on cpu mmap(Thomas)
v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
    it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
v6: Disable it when init_on_alloc and/or init_on_free is active(Matt)
    Use compute-benchmarks as reporter used it to report this
    allocation latency issue also a proper test application than mime.
    In v5, the test showed significant reduction in alloc latency but
    that is not the case any more, I think this was mostly because
    previous test was done on IFWI which had low mem BW from CPU.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 12 ++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 800119c8fc8d..1248acbdacfc 100644
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
index 16a24eadd94b..2aa18e32b32f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -339,6 +339,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
+		bool gpu_page_clear_sys;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..e0ac20f20758 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -117,5 +117,17 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
+
+	/*
+	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
+	 * and use GPU to clear pages as well.
+	 *
+	 * Disable this when init_on_free and/or init_on_alloc is on to avoid double
+	 * zeroing pages with CPU and GPU.
+	 */
+	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
+	    !want_init_on_alloc(GFP_USER) && !want_init_on_free())
+		xe->mem.gpu_page_clear_sys = true;
+
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
-- 
2.42.0

