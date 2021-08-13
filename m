Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC393EB6E6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262DB89AAD;
	Fri, 13 Aug 2021 14:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B09289AAD;
 Fri, 13 Aug 2021 14:43:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="212454804"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="212454804"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="447069627"
Received: from pheino-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.189])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/i915/ttm: Reorganize the ttm move code somewhat
Date: Fri, 13 Aug 2021 16:43:30 +0200
Message-Id: <20210813144331.372957-2-thomas.hellstrom@linux.intel.com>
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

In order to make the code a bit more readable and to facilitate
async memcpy moves, reorganize the move code a little. Determine
at an early stage whether to copy or to clear.

v2:
- Don't set up the memcpy iterators unless we are actually going to memcpy.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 77 ++++++++++++++-----------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 771eb2963123..d07de18529ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -431,6 +431,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 }
 
 static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
+			       bool clear,
 			       struct ttm_resource *dst_mem,
 			       struct sg_table *dst_st)
 {
@@ -449,13 +450,10 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		return -EINVAL;
 
 	dst_level = i915_ttm_cache_level(i915, dst_mem, ttm);
-	if (!ttm || !ttm_tt_is_populated(ttm)) {
+	if (clear) {
 		if (bo->type == ttm_bo_type_kernel)
 			return -EINVAL;
 
-		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
-			return 0;
-
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
 		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
 						  dst_st->sgl, dst_level,
@@ -489,6 +487,41 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	return ret;
 }
 
+static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
+			    struct ttm_resource *dst_mem,
+			    struct sg_table *dst_st)
+{
+	int ret;
+
+	ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_st);
+	if (ret) {
+		struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+		struct intel_memory_region *dst_reg, *src_reg;
+		union {
+			struct ttm_kmap_iter_tt tt;
+			struct ttm_kmap_iter_iomap io;
+		} _dst_iter, _src_iter;
+		struct ttm_kmap_iter *dst_iter, *src_iter;
+
+		dst_reg = i915_ttm_region(bo->bdev, dst_mem->mem_type);
+		src_reg = i915_ttm_region(bo->bdev, bo->resource->mem_type);
+		GEM_BUG_ON(!dst_reg || !src_reg);
+
+		dst_iter = !cpu_maps_iomem(dst_mem) ?
+			ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
+			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
+						 dst_st, dst_reg->region.start);
+
+		src_iter = !cpu_maps_iomem(bo->resource) ?
+			ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
+			ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
+						 obj->ttm.cached_io_st,
+						 src_reg->region.start);
+
+		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
+	}
+}
+
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 			 struct ttm_operation_ctx *ctx,
 			 struct ttm_resource *dst_mem,
@@ -497,19 +530,11 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	struct ttm_resource_manager *dst_man =
 		ttm_manager_type(bo->bdev, dst_mem->mem_type);
-	struct intel_memory_region *dst_reg, *src_reg;
-	union {
-		struct ttm_kmap_iter_tt tt;
-		struct ttm_kmap_iter_iomap io;
-	} _dst_iter, _src_iter;
-	struct ttm_kmap_iter *dst_iter, *src_iter;
+	struct ttm_tt *ttm = bo->ttm;
 	struct sg_table *dst_st;
+	bool clear;
 	int ret;
 
-	dst_reg = i915_ttm_region(bo->bdev, dst_mem->mem_type);
-	src_reg = i915_ttm_region(bo->bdev, bo->resource->mem_type);
-	GEM_BUG_ON(!dst_reg || !src_reg);
-
 	/* Sync for now. We could do the actual copy async. */
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -526,9 +551,8 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Populate ttm with pages if needed. Typically system memory. */
-	if (bo->ttm && (dst_man->use_tt ||
-			(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED))) {
-		ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_PAGE_FLAG_SWAPPED))) {
+		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
 		if (ret)
 			return ret;
 	}
@@ -537,23 +561,10 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	if (IS_ERR(dst_st))
 		return PTR_ERR(dst_st);
 
-	ret = i915_ttm_accel_move(bo, dst_mem, dst_st);
-	if (ret) {
-		/* If we start mapping GGTT, we can no longer use man::use_tt here. */
-		dst_iter = !cpu_maps_iomem(dst_mem) ?
-			ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
-			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
-						 dst_st, dst_reg->region.start);
-
-		src_iter = !cpu_maps_iomem(bo->resource) ?
-			ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
-			ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
-						 obj->ttm.cached_io_st,
-						 src_reg->region.start);
+	clear = !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
+	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
+		__i915_ttm_move(bo, clear, dst_mem, dst_st);
 
-		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
-	}
-	/* Below dst_mem becomes bo->resource. */
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_adjust_domains_after_move(obj);
 	i915_ttm_free_cached_io_st(obj);
-- 
2.31.1

