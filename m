Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7119622E9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E410E4DD;
	Wed, 28 Aug 2024 09:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzd8FhWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8C010E4DC;
 Wed, 28 Aug 2024 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724835899; x=1756371899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kFYlhd6DXkKtZSyNINtr5HTwAwPZ046yNe4tNx94bVE=;
 b=jzd8FhWljBz2D8IgPIIaoIBGiGwdSdNMxi+NsauRoRDWwE9fB8vVttII
 ah8eFMk816pCXkv7ATEZe6/wwE6Ah20Y+D6ItGiXdMQSjkkF6nCxmkuBd
 0rLANqGpnqW+nOL3AJZ7GkhgQNTIrDejJVeBtBuRMzju5PIFdCwK3zvaL
 KortNBAq9eu6flo2eEAD9zbDP8AK+CfY/Kkt+8kL/yEpTS/E2tbReIMec
 jP9cT2CsyVEXpxZc9yhE3LZgF8q9y6HTkymR71zjKGdi4wRbnwGwEOptb
 mYYulMYgG+t+zDJMcSTgO5bQ7XnoRmyaEl8sga9UGUM+Su2yYPBHbmPV+ g==;
X-CSE-ConnectionGUID: 671zDerbRfe784MvrWzUxA==
X-CSE-MsgGUID: TT7/huWdRF2ESytzcORzhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27235215"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="27235215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:04:58 -0700
X-CSE-ConnectionGUID: RcxoFumdRFip1M55k0lj6A==
X-CSE-MsgGUID: Yj/Cpu20TZ6gYvftgdzbqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67525631"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:04:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] Revert "drm/xe/lnl: Offload system clear page activity to
 GPU"
Date: Wed, 28 Aug 2024 10:36:34 +0200
Message-ID: <20240828083635.23601-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
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

This optimization relied on having to clear CCS on allocations.
If there is no need to clear CCS on allocations then this would mostly
help in reducing CPU utilization.

Revert this patch at this moment because of:
1 Currently Xe can't do clear on free and using a invalid ttm flag,
TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
multi-device setup.

2 Also for LNL CPU:WB doesn't require clearing CCS as such BO will
not be allowed to bind with compression PTE. Subsequent patch will
disable clearing CCS for CPU:WB BOs for LNL.

This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275.

Cc: Christian König <christian.koenig@amd.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 26 ++------------------------
 drivers/gpu/drm/xe/xe_device_types.h |  2 --
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 12 ------------
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9d6632f92fa9..25d0c939ba31 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -396,14 +396,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
-	/*
-	 * If the device can support gpu clear system pages then set proper ttm
-	 * flag. Zeroed pages are only required for ttm_bo_type_device so
-	 * unwanted data is not leaked to userspace.
-	 */
-	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
-		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
-
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
@@ -425,10 +417,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
-	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
-	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
-		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
-
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
@@ -671,16 +659,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
-	bool clear_system_pages;
 	int ret = 0;
 
-	/*
-	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
-	 * moving to system as the bo doesn't have dma_mapping.
-	 */
-	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
-		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
-
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -703,10 +683,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
-	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
-		clear_system_pages;
+		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -818,7 +796,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (move_lacks_source) {
 			u32 flags = 0;
 
-			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
+			if (mem_type_is_vram(new_mem->mem_type))
 				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
 			else if (handle_system_ccs)
 				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4ecd620921a3..e73fb0c23932 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -333,8 +333,6 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
-		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
-		bool gpu_page_clear_sys;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index e0ac20f20758..9844a8edbfe1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -117,17 +117,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
-
-	/*
-	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
-	 * and use GPU to clear pages as well.
-	 *
-	 * Disable this when init_on_free and/or init_on_alloc is on to avoid double
-	 * zeroing pages with CPU and GPU.
-	 */
-	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
-	    !want_init_on_alloc(GFP_USER) && !want_init_on_free())
-		xe->mem.gpu_page_clear_sys = true;
-
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
-- 
2.42.0

