Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC18641C58C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE756EA73;
	Wed, 29 Sep 2021 13:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B3D6EA71;
 Wed, 29 Sep 2021 13:26:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="310487480"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="310487480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 06:26:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="554812583"
Received: from jleonard-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.71])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 06:26:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/3] drm/ttm: add some kernel-doc for TTM_TT_FLAG_*
Date: Wed, 29 Sep 2021 14:26:28 +0100
Message-Id: <20210929132629.353541-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210929132629.353541-1-matthew.auld@intel.com>
References: <20210929132629.353541-1-matthew.auld@intel.com>
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

Move it to inline kernel-doc, otherwise we can't add empty lines it
seems. Also drop the kernel-doc for pages_list, which doesn't seem to
exist.

v2(Christian):
  - Add a note that FLAG_SWAPPED shouldn't need to be touched by drivers.
  - Mention what FLAG_POPULATED does.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 include/drm/ttm/ttm_tt.h | 60 +++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index b023cd58ff38..86d74069be3e 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -38,35 +38,57 @@ struct ttm_resource;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
 
-#define TTM_TT_FLAG_SWAPPED	(1 << 0)
-#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
-#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
-
-#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
-
 /**
- * struct ttm_tt
- *
- * @pages: Array of pages backing the data.
- * @page_flags: see TTM_TT_FLAG_*
- * @num_pages: Number of pages in the page array.
- * @sg: for SG objects via dma-buf
- * @dma_address: The DMA (bus) addresses of the pages
- * @swap_storage: Pointer to shmem struct file for swap storage.
- * @pages_list: used by some page allocation backend
- * @caching: The current caching state of the pages, see enum ttm_caching.
- *
- * This is a structure holding the pages, caching- and aperture binding
- * status for a buffer object that isn't backed by fixed (VRAM / AGP)
+ * struct ttm_tt - This is a structure holding the pages, caching- and aperture
+ * binding status for a buffer object that isn't backed by fixed (VRAM / AGP)
  * memory.
  */
 struct ttm_tt {
+	/** @pages: Array of pages backing the data. */
 	struct page **pages;
+	/**
+	 * @page_flags: The page flags.
+	 *
+	 * Supported values:
+	 *
+	 * TTM_TT_FLAG_SWAPPED: Set by TTM when the pages have been unpopulated
+	 * and swapped out by TTM.  Calling ttm_tt_populate() will then swap the
+	 * pages back in, and unset the flag. Drivers should in general never
+	 * need to touch this.
+	 *
+	 * TTM_TT_FLAG_ZERO_ALLOC: Set if the pages will be zeroed on
+	 * allocation.
+	 *
+	 * TTM_TT_FLAG_EXTERNAL: Set if the underlying pages were allocated
+	 * externally, like with dma-buf or userptr. This effectively disables
+	 * TTM swapping out such pages.  Also important is to prevent TTM from
+	 * ever directly mapping these pages.
+	 *
+	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
+	 * this flag.
+	 *
+	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
+	 * set by TTM after ttm_tt_populate() has successfully returned, and is
+	 * then unset when TTM calls ttm_tt_unpopulate().
+	 */
+#define TTM_TT_FLAG_SWAPPED	(1 << 0)
+#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
+#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
+
+#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
 	uint32_t page_flags;
+	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
+	/** @sg: for SG objects via dma-buf. */
 	struct sg_table *sg;
+	/** @dma_address: The DMA (bus) addresses of the pages. */
 	dma_addr_t *dma_address;
+	/** @swap_storage: Pointer to shmem struct file for swap storage. */
 	struct file *swap_storage;
+	/**
+	 * @caching: The current caching state of the pages, see enum
+	 * ttm_caching.
+	 */
 	enum ttm_caching caching;
 };
 
-- 
2.26.3

