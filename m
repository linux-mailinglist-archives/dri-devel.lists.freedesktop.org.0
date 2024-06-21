Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBA912025
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A0F10F104;
	Fri, 21 Jun 2024 09:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Go7iDWqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD1210F104;
 Fri, 21 Jun 2024 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718960929; x=1750496929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3atznNuPU5t191k2mEP2XFpvy46wwWCTvUILW7L7tc=;
 b=Go7iDWqufvvTwubiTd9rzLyC5EpN9/M95Xsq842XsWk//YQKJr6lm4rg
 8pwWQZakMvC6Omqjy9UcxXT85Zeh+m0lXWJ+E4dekl72U9APJQJvtXgTX
 jBProruBvGXAo4QBZ72OoE0DjPALAGqkMy2xf40YemBTClOWdk0uchDQS
 nFJWkyS0gJ9jp6EoLoxAfjdYGNvhHuhD1gYY2HpCTqDWdrJdJhTJ/sg/Y
 U+JQdVqFIpRLx7JqfEu0lromXFs8J22+0L5Tb9vqkYuPpPWqBh/F+IxJT
 Ko5sQDwLbpDZ+FGHACqrUq+GQL1faWYg8BA3aTow7C5k2eBtCKHWaeIgR g==;
X-CSE-ConnectionGUID: SwYadqoTTNOCekKJDV4azA==
X-CSE-MsgGUID: 8nAsyfkDRHW3sDXdKsenHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="38508292"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="38508292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:08:48 -0700
X-CSE-ConnectionGUID: hSC+ypUlQZGGU3vn/L/dYQ==
X-CSE-MsgGUID: p62mu+B0Qsaov2GlP4qWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42629843"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:08:46 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/lnl: Offload system clear page activity to GPU
Date: Fri, 21 Jun 2024 10:53:48 +0200
Message-ID: <20240621085348.23372-1-nirmoy.das@intel.com>
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

On LNL because of flat CCS, driver will create a migrate job to clear
CCS meta data. Extend that to also clear pages using GPU with new
ttm pool flag which allows offloading page clear activity to GPU.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
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
index 0d57eea8f083..20548a5d3eff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
+	/**
+	 * On iGFX device with flat CCS we clear CCS metadata, let's extend that
+	 * and use GPU to clear  pages as well.
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
index 05f933787860..90c5a2e35075 100644
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

