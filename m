Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4C9125DF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 14:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6D110E272;
	Fri, 21 Jun 2024 12:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGa6BzXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631010E12D;
 Fri, 21 Jun 2024 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718974109; x=1750510109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IG43aYrTUDOdw9WnxVPoLKvOYVEwDMcavG3+jAI1BPA=;
 b=XGa6BzXunePcIJwAjXCQTaXj4fnGYbY41+FCpCKCr14TeDUkP1A9azCb
 FFp4XxKMnxn7Acj9qZF4NUvT4V391El2iMvkUlM+UjmLdA6cTZDld6xs9
 7/WUQXvjeWU/AMZERJ3Oen9L6A/rb/vyhDluBFB2k3OG39ep4fWcx4WpW
 x7d7xz9MyEOQ+14eSqVpqcn7SL8p9WigwQf0ZHaok44FjqzHkMys1P4Zf
 KVSheYd1KdRwJdDLwuXdXZpK0ANI05BswnThJi7CXfExdwQkFCpLVxotg
 0IV44V7SDvl/Mf9JT1Qek+QScrfhpi60+t63cZRic7/qQg7BD9DZAjsFZ A==;
X-CSE-ConnectionGUID: Rh8Nm16/RyG/9KncTm8AUw==
X-CSE-MsgGUID: x1Co66DCToOCpK/BECtOfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33547528"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="33547528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 05:48:28 -0700
X-CSE-ConnectionGUID: fIAhKQKeRh2gQAmbWfmzAw==
X-CSE-MsgGUID: KJDp927TTICZm74kftDbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47763371"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 05:48:26 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe/lnl: Offload system clear page activity to GPU
Date: Fri, 21 Jun 2024 14:33:29 +0200
Message-ID: <20240621123329.22126-1-nirmoy.das@intel.com>
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

On LNL because of flat CCS, driver creates a migrate job to clear
CCS meta data. Extend that to also clear system pages using GPU.
Inform TTM to allocate pages without __GFP_ZERO to avoid double page
clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag.

v2: Handle regression on dgfx(Himal)
    Update commit message as no ttm API changes needed.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

O
---
 drivers/gpu/drm/xe/xe_bo.c           | 4 ++++
 drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c      | 5 +++--
 4 files changed, 16 insertions(+), 2 deletions(-)

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
index 0d57eea8f083..b9ed30c84418 100644
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
index 05f933787860..7acf471a1a40 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
+	bool clear_on_create = xe->mem.gpu_page_clear || clear_vram;
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

