Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12C89F4E9D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7310E9AC;
	Tue, 17 Dec 2024 14:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyEeCwbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E25310E9D9;
 Tue, 17 Dec 2024 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734447564; x=1765983564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pA/KiikVae2KhIZu87Mk5K1j4eGWeExt+ZGFs/utiU0=;
 b=LyEeCwbcH1bS0Vnb+2rh9BC05JHuoUBn47t+M/XoQps/YUkgSNskdwcA
 fWf8bfAVdVqVjABoEftmhrF5K6+SMsMxrvZ3rTi6EnrlLBU97i5IY4bh8
 SKNHF83dkC18OYhLUhc2HzgPCUCBIQUaiQqwe6kPanLXc4I1j6X8/vd2y
 ibRpMxdjvgZkK5tWAjqUORDszOSxVuiGBkkVayTJQgc17yiRZaw/4zNvm
 exynTtTlGXNRsGrEoU478kbGjWHxFhBzSplcUm+8ZMWCpWbNPY4UQHyvh
 dvCsY0On+RR4Qx0ifi59IUYzMXGHROmemAUc8w0I7ReLkjA2JgpX2vSio g==;
X-CSE-ConnectionGUID: JyZY2mjVSsO8u73xc6XRgw==
X-CSE-MsgGUID: 8T7H9dzGQtW3aKuZJ9SzrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34914463"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34914463"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:23 -0800
X-CSE-ConnectionGUID: nZSomYkyR52dJfmEbxGa8Q==
X-CSE-MsgGUID: a6t1/dkPSq+nN478h3152w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101694334"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v15 5/9] drm/ttm: Use fault-injection to test error paths
Date: Tue, 17 Dec 2024 15:58:48 +0100
Message-ID: <20241217145852.37342-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
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

Use fault-injection to test partial TTM swapout and interrupted swapin.
Return -EINTR for swapin to test the callers ability to handle and
restart the swapin, and on swapout perform a partial swapout to test that
the swapin and release_shrunken functionality.

v8:
- Use the core fault-injection system.
v9:
- Fix compliation failure for !CONFIG_FAULT_INJECTION

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7
---
 drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index ffb7abf52bab..83b10706ba89 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -48,6 +48,13 @@
 
 #include "ttm_module.h"
 
+#ifdef CONFIG_FAULT_INJECTION
+#include <linux/fault-inject.h>
+static DECLARE_FAULT_ATTR(backup_fault_inject);
+#else
+#define should_fail(...) false
+#endif
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -514,6 +521,12 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
 		if (ttm_backup_page_ptr_is_handle(p)) {
 			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
 
+			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
+			    should_fail(&backup_fault_inject, 1)) {
+				ret = -EINTR;
+				break;
+			}
+
 			if (handle == 0) {
 				restore->restored_pages++;
 				continue;
@@ -1007,7 +1020,13 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 
 	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 
-	for (i = 0; i < tt->num_pages; ++i) {
+	num_pages = tt->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		s64 shandle;
 
 		page = tt->pages[i];
@@ -1293,6 +1312,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_globals_fops);
 	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_shrink_fops);
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("backup_fault_inject", ttm_debugfs_root,
+				  &backup_fault_inject);
+#endif
 #endif
 
 	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
-- 
2.47.1

