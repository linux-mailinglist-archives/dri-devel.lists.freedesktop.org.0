Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA19B9094
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 12:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8429010E9B2;
	Fri,  1 Nov 2024 11:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnZ6TGO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA2510E9AF;
 Fri,  1 Nov 2024 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730461666; x=1761997666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51ubzrgv0Kp1907mFkxejGq9u/lMpTBlVD9cuH2DFOU=;
 b=KnZ6TGO5KEuVF+KYpfGzxET70UPvdFcylD/JNopFnELe3GFZEQ+bZMrG
 bLosE7Kjq03JcYRjL82Yxl1rl/I/PIE2xmM1DV5KNB/DimCetCKcHsX1q
 73AZNitp4Dg7S4uF9w3DFea7VKKUpMzsEUR60YzAj7I1R7enD4/VBoIQb
 U2DVI1G3/oNk0abVIKJSnFdHa5jXO351YBbg8ytFfYKEQVYhJWj7DZ6N0
 Zi3AfdgQL6t4+/gf8V+OZ7swIdZQJpRYX/G0vmJwDMr2/uEKlsYY6rSa9
 hEvQO1Der119ayRg6VXtaeGvd15hz8rPiN30G8W2SuVeoftOmQajgMTjU Q==;
X-CSE-ConnectionGUID: umSwzNNDSd2/539gnAqgag==
X-CSE-MsgGUID: 20bGS8eMR1qSbwWg+u5w7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41324540"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41324540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:46 -0700
X-CSE-ConnectionGUID: PU3jKCQxQdqoIx4FgYeLjQ==
X-CSE-MsgGUID: CLtxlqdXQW+oqHFthKJfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82626555"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v12 4/8] drm/ttm: Use fault-injection to test error paths
Date: Fri,  1 Nov 2024 12:47:15 +0100
Message-ID: <20241101114719.3225-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101114719.3225-1-thomas.hellstrom@linux.intel.com>
References: <20241101114719.3225-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_pool.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 0d224cd9f8eb..b2718aef2edf 100644
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
@@ -431,6 +438,7 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			       struct ttm_backup *backup,
 			       struct ttm_operation_ctx *ctx)
 {
+	static unsigned long __maybe_unused swappedin;
 	unsigned int i, nr = 1 << restore->order;
 	int ret = 0;
 
@@ -446,6 +454,12 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			if (handle == 0)
 				continue;
 
+			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
+			    should_fail(&backup_fault_inject, 1)) {
+				ret = -EINTR;
+				break;
+			}
+
 			ret = backup->ops->copy_backed_up_page
 				(backup, restore->first_page[i],
 				 handle, ctx->interruptible);
@@ -889,7 +903,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
 
 	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 
-	for (i = 0; i < ttm->num_pages; ++i) {
+	num_pages = ttm->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		page = ttm->pages[i];
 		if (unlikely(!page))
 			continue;
@@ -1178,6 +1199,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
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
2.46.2

