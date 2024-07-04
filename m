Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6BE9271CE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086FB10EA26;
	Thu,  4 Jul 2024 08:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiqlde8a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECE310EA22;
 Thu,  4 Jul 2024 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720082026; x=1751618026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HtVUBkgUvp3WV2KMzg4FrE3KfdlNxhr8bIx1dnxf1Fc=;
 b=Iiqlde8axxvK5mxt1GApZzBIA+IwULAL4+EwCqUTFcjhSjflehuxoznM
 FTwgjJL/2iodg7WUvSH0xC2UCoFc5Js1C2Tm7VomFbpnehry4RkYzDXza
 CjOwfE5BXIj5/y96GgAJgGF9Re4NEgZslRmewUwUG9I+iO15c3ol0VzLX
 7dQ4pp/D0YaQ/Op/Y/rGLHHw8IftP4B3RqEdIsqOlF5X08LEtWmgS/kKp
 UMj2kxrcNAb8tmnBt+UA5GiDZBaY5Bb7llC238HcLfxQF4sGc/TeMXx28
 Wm3Oly7L8LccU/Cz9Qevm2hCXDcTzF6CwXOta6d7hwAefxzL2+Nv04ZY2 g==;
X-CSE-ConnectionGUID: xxR2k9UhTNWF08zQWUWwRg==
X-CSE-MsgGUID: 7+XTKxvDQKabPIB1lLZuJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17297710"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17297710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:33:46 -0700
X-CSE-ConnectionGUID: xXd7pXknRw6bNC6Y49Gnnw==
X-CSE-MsgGUID: +1WiYQhLTyGXsvtiO3qqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51703491"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:33:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 1/4] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
Date: Thu,  4 Jul 2024 10:18:38 +0200
Message-ID: <20240704081841.30212-1-nirmoy.das@intel.com>
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

Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
releasing backing stores if they want to skip clear-on-free.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
 include/drm/ttm/ttm_tt.h       |  6 +++++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..b78ee7524bcf 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 }
 
 /* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
+static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p,
+			       bool cleared)
 {
 	unsigned int i, num_pages = 1 << pt->order;
 
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
+	if (!cleared) {
+		for (i = 0; i < num_pages; ++i) {
+			if (PageHighMem(p))
+				clear_highpage(p + i);
+			else
+				clear_page(page_address(p + i));
+		}
 	}
 
 	spin_lock(&pt->lock);
@@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
+	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
 	unsigned int order;
 	pgoff_t i, nr;
 
@@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 
 		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, *pages, cleared);
 		else
 			ttm_pool_free_page(pool, caching, order, *pages);
 	}
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 2b9d856ff388..cfaf49de2419 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -85,6 +85,9 @@ struct ttm_tt {
 	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
 	 * used to assure pgprot always matches.
 	 *
+	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
+	 * clearing backing store
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -94,8 +97,9 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL		BIT(2)
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
+#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
 
-#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
-- 
2.42.0

