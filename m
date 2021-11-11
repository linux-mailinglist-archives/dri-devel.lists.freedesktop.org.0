Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06044D25B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA726E986;
	Thu, 11 Nov 2021 07:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60EF6E945;
 Thu, 11 Nov 2021 07:15:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212896398"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212896398"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452627331"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/ttm: Move the i915_gem_obj_copy_ttm() function
Date: Thu, 11 Nov 2021 08:14:59 +0100
Message-Id: <20211111071502.16826-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
References: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the i915_gem_obj_copy_ttm() function to i915_gem_ttm_move.h.
This will help keep a number of functions static when introducing
async moves.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 47 ---------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      |  4 --
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 63 ++++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h | 10 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  1 +
 5 files changed, 56 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 68cfe6e9ceab..537a81445b90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1063,50 +1063,3 @@ i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 	intel_memory_region_set_name(mr, "system-ttm");
 	return mr;
 }
-
-/**
- * i915_gem_obj_copy_ttm - Copy the contents of one ttm-based gem object to
- * another
- * @dst: The destination object
- * @src: The source object
- * @allow_accel: Allow using the blitter. Otherwise TTM memcpy is used.
- * @intr: Whether to perform waits interruptible:
- *
- * Note: The caller is responsible for assuring that the underlying
- * TTM objects are populated if needed and locked.
- *
- * Return: Zero on success. Negative error code on error. If @intr == true,
- * then it may return -ERESTARTSYS or -EINTR.
- */
-int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
-			  struct drm_i915_gem_object *src,
-			  bool allow_accel, bool intr)
-{
-	struct ttm_buffer_object *dst_bo = i915_gem_to_ttm(dst);
-	struct ttm_buffer_object *src_bo = i915_gem_to_ttm(src);
-	struct ttm_operation_ctx ctx = {
-		.interruptible = intr,
-	};
-	struct i915_refct_sgt *dst_rsgt;
-	int ret;
-
-	assert_object_held(dst);
-	assert_object_held(src);
-
-	/*
-	 * Sync for now. This will change with async moves.
-	 */
-	ret = ttm_bo_wait_ctx(dst_bo, &ctx);
-	if (!ret)
-		ret = ttm_bo_wait_ctx(src_bo, &ctx);
-	if (ret)
-		return ret;
-
-	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
-	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
-			dst_rsgt, allow_accel);
-
-	i915_refct_sgt_put(dst_rsgt);
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 074a7c08ff31..82cdabb542be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -49,10 +49,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       resource_size_t page_size,
 			       unsigned int flags);
 
-int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
-			  struct drm_i915_gem_object *src,
-			  bool allow_accel, bool intr);
-
 /* Internal I915 TTM declarations and definitions below. */
 
 #define I915_PL_LMEM0 TTM_PL_PRIV
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index ef22d4ed66ad..f35b386c56ca 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -378,18 +378,10 @@ i915_ttm_memcpy_work_arm(struct i915_ttm_memcpy_work *work,
 	return &work->fence;
 }
 
-/**
- * __i915_ttm_move - helper to perform TTM moves or clears.
- * @bo: The source buffer object.
- * @clear: Whether this is a clear operation.
- * @dst_mem: The destination ttm resource.
- * @dst_ttm: The destination ttm page vector.
- * @dst_rsgt: The destination refcounted sg-list.
- * @allow_accel: Whether to allow acceleration.
- */
-void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
-		     struct ttm_resource *dst_mem, struct ttm_tt *dst_ttm,
-		     struct i915_refct_sgt *dst_rsgt, bool allow_accel)
+static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
+			    struct ttm_resource *dst_mem,
+			    struct ttm_tt *dst_ttm,
+			    struct i915_refct_sgt *dst_rsgt, bool allow_accel)
 {
 	struct i915_ttm_memcpy_work *copy_work = NULL;
 	struct i915_ttm_memcpy_arg _arg, *arg = &_arg;
@@ -521,3 +513,50 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	i915_ttm_adjust_gem_after_move(obj);
 	return 0;
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
+	struct i915_refct_sgt *dst_rsgt;
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
+	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
+	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
+			dst_rsgt, allow_accel);
+
+	i915_refct_sgt_put(dst_rsgt);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
index 75b87e752af2..d2e7f149e05c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
@@ -23,13 +23,11 @@ int i915_ttm_move_notify(struct ttm_buffer_object *bo);
 I915_SELFTEST_DECLARE(void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
 							      bool work_allocation));
 
-/* Internal I915 TTM declarations and definitions below. */
+int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
+			  struct drm_i915_gem_object *src,
+			  bool allow_accel, bool intr);
 
-void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
-		     struct ttm_resource *dst_mem,
-		     struct ttm_tt *dst_ttm,
-		     struct i915_refct_sgt *dst_rsgt,
-		     bool allow_accel);
+/* Internal I915 TTM declarations and definitions below. */
 
 int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		  struct ttm_operation_ctx *ctx,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 3b6d14b5c604..60d10ab55d1e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -12,6 +12,7 @@
 
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
+#include "gem/i915_gem_ttm_move.h"
 #include "gem/i915_gem_ttm_pm.h"
 
 /**
-- 
2.31.1

