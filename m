Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35FB3EB6EB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4682F6E83F;
	Fri, 13 Aug 2021 14:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E266E83F;
 Fri, 13 Aug 2021 14:43:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="212454812"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="212454812"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="447069633"
Received: from pheino-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.189])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/ttm, drm/i915: Update ttm_move_memcpy for async use
Date: Fri, 13 Aug 2021 16:43:31 +0200
Message-Id: <20210813144331.372957-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813144331.372957-1-thomas.hellstrom@linux.intel.com>
References: <20210813144331.372957-1-thomas.hellstrom@linux.intel.com>
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

The buffer object argument to ttm_move_memcpy was only used to
determine whether the destination memory should be cleared only
or whether we should copy data. Replace it with a "clear" bool, and
update the callers.

The intention here is to be able to use ttm_move_memcpy() async under
a dma-fence as a fallback if an accelerated blit fails in a security-
critical path where data might leak if the blit is not properly
performed. For that purpose the bo is an unsuitable argument since
its relevant members might already have changed at call time.

Finally, update the ttm_move_memcpy kerneldoc that seems to have
ended up with a stale version.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 ++++++++++----------
 include/drm/ttm/ttm_bo_driver.h         |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index d07de18529ab..6995c66cbe21 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -518,7 +518,7 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 						 obj->ttm.cached_io_st,
 						 src_reg->region.start);
 
-		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
+		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
 	}
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 763fa6f4e07d..5c20d0541cc3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -78,22 +78,21 @@ void ttm_mem_io_free(struct ttm_device *bdev,
 
 /**
  * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
- * @bo: The struct ttm_buffer_object.
- * @new_mem: The struct ttm_resource we're moving to (copy destination).
- * @new_iter: A struct ttm_kmap_iter representing the destination resource.
+ * @clear: Whether to clear rather than copy.
+ * @num_pages: Number of pages of the operation.
+ * @dst_iter: A struct ttm_kmap_iter representing the destination resource.
  * @src_iter: A struct ttm_kmap_iter representing the source resource.
  *
  * This function is intended to be able to move out async under a
  * dma-fence if desired.
  */
-void ttm_move_memcpy(struct ttm_buffer_object *bo,
+void ttm_move_memcpy(bool clear,
 		     u32 num_pages,
 		     struct ttm_kmap_iter *dst_iter,
 		     struct ttm_kmap_iter *src_iter)
 {
 	const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
 	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
-	struct ttm_tt *ttm = bo->ttm;
 	struct dma_buf_map src_map, dst_map;
 	pgoff_t i;
 
@@ -102,10 +101,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 		return;
 
 	/* Don't move nonexistent data. Clear destination instead. */
-	if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
-		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
-			return;
-
+	if (clear) {
 		for (i = 0; i < num_pages; ++i) {
 			dst_ops->map_local(dst_iter, &dst_map, i);
 			if (dst_map.is_iomem)
@@ -149,6 +145,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		struct ttm_kmap_iter_linear_io io;
 	} _dst_iter, _src_iter;
 	struct ttm_kmap_iter *dst_iter, *src_iter;
+	bool clear;
 	int ret = 0;
 
 	if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
@@ -172,7 +169,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		goto out_src_iter;
 	}
 
-	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
+	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
+	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
+		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
+
 	src_copy = *src_mem;
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 68d6069572aa..5f087575194b 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -322,7 +322,7 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
  */
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 
-void ttm_move_memcpy(struct ttm_buffer_object *bo,
+void ttm_move_memcpy(bool clear,
 		     u32 num_pages,
 		     struct ttm_kmap_iter *dst_iter,
 		     struct ttm_kmap_iter *src_iter);
-- 
2.31.1

