Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C288A67C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FE610EFCE;
	Tue, 16 Apr 2024 10:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ve3R5JdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44944112B75;
 Tue, 16 Apr 2024 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713262127; x=1744798127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KyObCon4EOhktoKLWirdtBxKbwpO6gD6LKreW8d4M8=;
 b=Ve3R5JdWZ5nC43oXDbXC3X2ocNXdVVZy0DT+sbMEeNlVh6Q9nrUdnyuP
 Hakx/V1GqXcsUMS0iMBjauXZY2iQXcqU7OPQUbCMXK/QlcFpr8NOlkq5d
 8azKMOjIslwcpt7NWE22hm2EEc4zk11mEtVhiJAvp6WyMJU6PAHKDVVDi
 hufuBu8kisxJyRz1YEb1hPzfe/RaK4D6V6za/IP7jqhWdPa8ef0YKWV5E
 ZX2kHT+P/8Ax/GxVWQW1eIQ42dv6EvoJiduaKxR91B0fJepryTW719w+M
 b+YrtjrgDpKZUAKnCdRNKMscLSjAW+lm/de5iG/TG/iRuBCkujBATy0gZ Q==;
X-CSE-ConnectionGUID: bSaJ64iZQtuPo4yxkPn1Bg==
X-CSE-MsgGUID: rXQl1MMsSEKnedIqqjHudQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20112384"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="20112384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:47 -0700
X-CSE-ConnectionGUID: ddhHvekYR6uXMUH5Rwr8mw==
X-CSE-MsgGUID: Vi2CGyNiR+6l1SDJiP6Rkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22620366"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 7/9] drm/ttm: Use fault-injection to test error paths
Date: Tue, 16 Apr 2024 12:07:28 +0200
Message-ID: <20240416100730.6666-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        | 10 ++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a04101..032f069235d5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -258,6 +258,16 @@ config DRM_GPUVM
 	  GPU-VM representation providing helpers to manage a GPUs virtual
 	  address space
 
+config DRM_TTM_BACKUP_FAULT_INJECT
+	bool "Enable fault injection during TTM backup"
+	depends on DRM_TTM
+	default n
+	help
+	  Inject recoverable failures during TTM backup and recovery of
+	  backed-up objects. For DRM driver developers only.
+
+	  If in doubt, choose N.
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 38e50cf81b0a..d32a1f2e5e50 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -431,6 +431,7 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			       struct ttm_backup *backup,
 			       struct ttm_operation_ctx *ctx)
 {
+	static unsigned long __maybe_unused swappedin;
 	unsigned int i, nr = 1 << restore->order;
 	int ret = 0;
 
@@ -446,6 +447,13 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
 			if (handle == 0)
 				continue;
 
+			if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT) &&
+			    ctx->interruptible &&
+			    ++swappedin % 100 == 0) {
+				ret = -EINTR;
+				break;
+			}
+
 			ret = backup->ops->copy_backed_up_page
 				(backup, restore->first_page[i],
 				 handle, ctx->interruptible);
@@ -892,7 +900,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm, bool purge,
 
 	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 
-	for (i = 0; i < ttm->num_pages; ++i) {
+	num_pages = ttm->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+
+	if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		page = ttm->pages[i];
 		if (unlikely(!page))
 			continue;
-- 
2.44.0

