Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1141392D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777AF6E9FD;
	Tue, 21 Sep 2021 17:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563466E9FA;
 Tue, 21 Sep 2021 17:51:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210509807"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="210509807"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:51:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512413676"
Received: from rogerc2x-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.52])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:51:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 1/7] drm/i915/ttm: Implement a function to copy the
 contents of two TTM-based objects
Date: Tue, 21 Sep 2021 19:51:05 +0200
Message-Id: <20210921175111.850331-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921175111.850331-1-thomas.hellstrom@linux.intel.com>
References: <20210921175111.850331-1-thomas.hellstrom@linux.intel.com>
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

When backing up or restoring contents of pinned objects at suspend /
resume time we need to allocate a new object as the backup. Add a function
to facilitate copies between the two. Some data needs to be copied before
the migration context is ready for operation, so make sure we can
disable accelerated copies.

v2:
- Fix a missing return value check (Matthew Auld)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 69 +++++++++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h |  4 ++
 2 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 2f672f06b169..22d59510d0c3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -428,6 +428,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 			       bool clear,
 			       struct ttm_resource *dst_mem,
+			       struct ttm_tt *dst_ttm,
 			       struct sg_table *dst_st)
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
@@ -437,14 +438,14 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	struct sg_table *src_st;
 	struct i915_request *rq;
-	struct ttm_tt *ttm = bo->ttm;
+	struct ttm_tt *src_ttm = bo->ttm;
 	enum i915_cache_level src_level, dst_level;
 	int ret;
 
 	if (!i915->gt.migrate.context)
 		return -EINVAL;
 
-	dst_level = i915_ttm_cache_level(i915, dst_mem, ttm);
+	dst_level = i915_ttm_cache_level(i915, dst_mem, dst_ttm);
 	if (clear) {
 		if (bo->type == ttm_bo_type_kernel)
 			return -EINVAL;
@@ -461,10 +462,10 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		}
 		intel_engine_pm_put(i915->gt.migrate.context->engine);
 	} else {
-		src_st = src_man->use_tt ? i915_ttm_tt_get_st(ttm) :
+		src_st = src_man->use_tt ? i915_ttm_tt_get_st(src_ttm) :
 			obj->ttm.cached_io_st;
 
-		src_level = i915_ttm_cache_level(i915, bo->resource, ttm);
+		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
 		ret = intel_context_migrate_copy(i915->gt.migrate.context,
 						 NULL, src_st->sgl, src_level,
@@ -484,11 +485,14 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 
 static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 			    struct ttm_resource *dst_mem,
-			    struct sg_table *dst_st)
+			    struct ttm_tt *dst_ttm,
+			    struct sg_table *dst_st,
+			    bool allow_accel)
 {
-	int ret;
+	int ret = -EINVAL;
 
-	ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_st);
+	if (allow_accel)
+		ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm, dst_st);
 	if (ret) {
 		struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 		struct intel_memory_region *dst_reg, *src_reg;
@@ -503,7 +507,7 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 		GEM_BUG_ON(!dst_reg || !src_reg);
 
 		dst_iter = !cpu_maps_iomem(dst_mem) ?
-			ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
+			ttm_kmap_iter_tt_init(&_dst_iter.tt, dst_ttm) :
 			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
 						 dst_st, dst_reg->region.start);
 
@@ -558,7 +562,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 
 	clear = !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
-		__i915_ttm_move(bo, clear, dst_mem, dst_st);
+		__i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_st, true);
 
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_adjust_domains_after_move(obj);
@@ -973,3 +977,50 @@ i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 	intel_memory_region_set_name(mr, "system-ttm");
 	return mr;
 }
+
+/**
+ * i915_gem_obj_copy_ttm - Copy the contents of one ttm-based gem object to
+ * another
+ * @dst: The destination object
+ * @src: The source object
+ * @allow_accel: Allow using the blitter. Otherwise TTM memcpy is used.
+ * @intr: Whether to perform waits interruptible:
+ *
+ * Note: The caller is responsible for assuring that the underlying
+ * TTM objects are populated if needed and locked.
+ *
+ * Return: Zero on success. Negative error code on error. If @intr == true,
+ * then it may return -ERESTARTSYS or -EINTR.
+ */
+int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
+			  struct drm_i915_gem_object *src,
+			  bool allow_accel, bool intr)
+{
+	struct ttm_buffer_object *dst_bo = i915_gem_to_ttm(dst);
+	struct ttm_buffer_object *src_bo = i915_gem_to_ttm(src);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = intr,
+	};
+	struct sg_table *dst_st;
+	int ret;
+
+	assert_object_held(dst);
+	assert_object_held(src);
+
+	/*
+	 * Sync for now. This will change with async moves.
+	 */
+	ret = ttm_bo_wait_ctx(dst_bo, &ctx);
+	if (!ret)
+		ret = ttm_bo_wait_ctx(src_bo, &ctx);
+	if (ret)
+		return ret;
+
+	dst_st = gpu_binds_iomem(dst_bo->resource) ?
+		dst->ttm.cached_io_st : i915_ttm_tt_get_st(dst_bo->ttm);
+
+	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
+			dst_st, allow_accel);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 40927f67b6d9..34ac78d47b0d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -46,4 +46,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       resource_size_t size,
 			       resource_size_t page_size,
 			       unsigned int flags);
+
+int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
+			  struct drm_i915_gem_object *src,
+			  bool allow_accel, bool intr);
 #endif
-- 
2.31.1

