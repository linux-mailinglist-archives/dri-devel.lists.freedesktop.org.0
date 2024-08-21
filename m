Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15481959793
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598710E8BF;
	Wed, 21 Aug 2024 10:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SONdqYpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311310E8BE;
 Wed, 21 Aug 2024 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724235538; x=1755771538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=676QHHPYwHAmDeDNfPzlPnq60iduL1BnfCns1TM0QqM=;
 b=SONdqYpUUa5Ncsy+5AP1Rd5rHGXgge02/a0oWjutx09tNBUvkgORjeCe
 8+xXCpEvg4AK9WRSAY0KDn3qnS+TpSnhbLHMVNVDIIcY1O0780wHtlPE5
 u6zirEma3jjDDcvrcHPYNkMEi12QBUfjgL6efZybhhyIRtseWLnkFrpbM
 IhtqZ8/A+lXCcTn0jA3/hi5vsAlKCy2TT2F5bjOPSJ357YCUyqCWtMSCv
 q+gBGNR6OgyjIO8MOMXtD4CiB7KTAlXOSQSCOUDhuKdhkuKU97k1cXObN
 gWhkLQMySDj59XOrM8QaDig4zK6UxMefGNj9w9y9Bu0EotCM9UCdZaMdz g==;
X-CSE-ConnectionGUID: 6oTKOBA4SUa2PBLB7KjrLA==
X-CSE-MsgGUID: 3r47IToLRAyrq0d/pNm2uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22720564"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22720564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:18:58 -0700
X-CSE-ConnectionGUID: KIyD/EjkSZSK/9UVHA6zBA==
X-CSE-MsgGUID: 8PKEwgnNTvOUNg+gxObOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65880963"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:18:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] Revert "drm/ttm: Add a flag to allow drivers to skip
 clear-on-free"
Date: Wed, 21 Aug 2024 11:50:35 +0200
Message-ID: <20240821095035.29083-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240821095035.29083-1-nirmoy.das@intel.com>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
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

Remove TTM_TT_FLAG_CLEARED_ON_FREE now that XE stopped using this
flag.

This reverts commit decbfaf06db05fa1f9b33149ebb3c145b44e878f.

Cc: Christian König <christian.koenig@amd.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++-----------
 include/drm/ttm/ttm_tt.h       |  6 +-----
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 935ab3cfd046..8504dbe19c1a 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -222,18 +222,15 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 }
 
 /* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p,
-			       bool cleared)
+static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
 	unsigned int i, num_pages = 1 << pt->order;
 
-	if (!cleared) {
-		for (i = 0; i < num_pages; ++i) {
-			if (PageHighMem(p))
-				clear_highpage(p + i);
-			else
-				clear_page(page_address(p + i));
-		}
+	for (i = 0; i < num_pages; ++i) {
+		if (PageHighMem(p))
+			clear_highpage(p + i);
+		else
+			clear_page(page_address(p + i));
 	}
 
 	spin_lock(&pt->lock);
@@ -397,7 +394,6 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
-	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
 	unsigned int order;
 	pgoff_t i, nr;
 
@@ -411,7 +407,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 
 		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages, cleared);
+			ttm_pool_type_give(pt, *pages);
 		else
 			ttm_pool_free_page(pool, caching, order, *pages);
 	}
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index cfaf49de2419..2b9d856ff388 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -85,9 +85,6 @@ struct ttm_tt {
 	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
 	 * used to assure pgprot always matches.
 	 *
-	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
-	 * clearing backing store
-	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -97,9 +94,8 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL		BIT(2)
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
-#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
 
-#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
-- 
2.42.0

