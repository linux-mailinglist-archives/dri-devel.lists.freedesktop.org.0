Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB6926510
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0765210E97C;
	Wed,  3 Jul 2024 15:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwcKzkTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336C10E97F;
 Wed,  3 Jul 2024 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720021121; x=1751557121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySniWZHIst/7N+CiSrenrd6NqfZJn1q3m09oKX/VImA=;
 b=mwcKzkTIwruVEKVn/N2Ar5xM8RYSAPONt3FaxZPRmkc0pb4+DLL40gjn
 Ns/jqCcKFtdLH6tu5f8Bnu2v+fh6F6nS5Hdu0T08Mz21Cw8Ak2jBhe12p
 5tnPZpDDOruNYqowhJRmg8jdy/Zw5GryGpmRycU1n8WrdLJhkiSckXwyP
 LiZZQ8yPu8Ah6hLpYU/plwvyywurqHDGu79jKG9r2wKUz6tIpkrZQ6WKN
 Ff2rbqr0d2BMvM/5pZc7nuA7f7F7kvYBe62m8Dh3Fd8LcrxCATBY4ASV3
 /ShRp+V4eNbEf9vmgt20sIpY276IdAI5o+TQOCid8JspWJQLIlgcLVG7t Q==;
X-CSE-ConnectionGUID: WsytWAwBSe2HeO6aeN9qjA==
X-CSE-MsgGUID: Jloxg/FrT3WcnQu8AF3WZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20162631"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="20162631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:41 -0700
X-CSE-ConnectionGUID: ASF6IEueTr2+gpZFV1K/0w==
X-CSE-MsgGUID: Xn4NQt4uSbiznTAD8U+/vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46359441"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 10/12] drm/ttm: Use fault-injection to test error paths
Date: Wed,  3 Jul 2024 17:38:11 +0200
Message-ID: <20240703153813.182001-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        | 10 ++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fd0749c0c630..9f27271bfab8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -272,6 +272,16 @@ config DRM_GPUVM
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

