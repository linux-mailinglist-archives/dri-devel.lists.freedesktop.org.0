Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DE3C8471
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197386E241;
	Wed, 14 Jul 2021 12:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8716 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jul 2021 12:28:47 UTC
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517AB6E241;
 Wed, 14 Jul 2021 12:28:47 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 resent] drm/i915: Add TTM offset argument to mmap.
Date: Wed, 14 Jul 2021 14:28:33 +0200
Message-Id: <20210714122833.766586-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FIXED mapping is only used for ttm, and tells userspace that the
mapping type is pre-defined. This disables the other type of mmap
offsets when discrete memory is used, so fix the selftests as well.

Document the struct as well, so it shows up in docbook.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
Resent, forgot to cc dri-devel

 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 17 ++++++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 27 ++++++++++-
 include/uapi/drm/i915_drm.h                   | 46 ++++++++++++++-----
 4 files changed, 77 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a90f796e85c0..31c4021bb6be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -679,10 +679,16 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
 		return -ENODEV;
 
 	if (obj->ops->mmap_offset)  {
+		if (mmap_type != I915_MMAP_TYPE_FIXED)
+			return -ENODEV;
+
 		*offset = obj->ops->mmap_offset(obj);
 		return 0;
 	}
 
+	if (mmap_type == I915_MMAP_TYPE_FIXED)
+		return -ENODEV;
+
 	if (mmap_type != I915_MMAP_TYPE_GTT &&
 	    !i915_gem_object_has_struct_page(obj) &&
 	    !i915_gem_object_has_iomem(obj))
@@ -727,7 +733,9 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
 {
 	enum i915_mmap_type mmap_type;
 
-	if (boot_cpu_has(X86_FEATURE_PAT))
+	if (HAS_LMEM(to_i915(dev)))
+		mmap_type = I915_MMAP_TYPE_FIXED;
+	else if (boot_cpu_has(X86_FEATURE_PAT))
 		mmap_type = I915_MMAP_TYPE_WC;
 	else if (!i915_ggtt_has_aperture(&to_i915(dev)->ggtt))
 		return -ENODEV;
@@ -798,6 +806,10 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 		type = I915_MMAP_TYPE_UC;
 		break;
 
+	case I915_MMAP_OFFSET_FIXED:
+		type = I915_MMAP_TYPE_FIXED;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -968,6 +980,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		vma->vm_ops = &vm_ops_cpu;
 		break;
 
+	case I915_MMAP_TYPE_FIXED:
+		GEM_WARN_ON(1);
+		/* fall-through */
 	case I915_MMAP_TYPE_WB:
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 		vma->vm_ops = &vm_ops_cpu;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index ef3de2ae9723..afbadfc5516b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -105,6 +105,7 @@ enum i915_mmap_type {
 	I915_MMAP_TYPE_WC,
 	I915_MMAP_TYPE_WB,
 	I915_MMAP_TYPE_UC,
+	I915_MMAP_TYPE_FIXED,
 };
 
 struct i915_mmap_offset {
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 1da8bd675e54..52789c8ad337 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -573,6 +573,14 @@ static int make_obj_busy(struct drm_i915_gem_object *obj)
 	return 0;
 }
 
+static enum i915_mmap_type default_mapping(struct drm_i915_private *i915)
+{
+	if (HAS_LMEM(i915))
+		return I915_MMAP_TYPE_FIXED;
+
+	return I915_MMAP_TYPE_GTT;
+}
+
 static bool assert_mmap_offset(struct drm_i915_private *i915,
 			       unsigned long size,
 			       int expected)
@@ -585,7 +593,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 	if (IS_ERR(obj))
 		return expected && expected == PTR_ERR(obj);
 
-	ret = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
+	ret = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
 	i915_gem_object_put(obj);
 
 	return ret == expected;
@@ -689,7 +697,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
 		goto out;
 	}
 
-	err = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
+	err = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
 	if (err) {
 		pr_err("Unable to insert object into reclaimed hole\n");
 		goto err_obj;
@@ -831,8 +839,14 @@ static int wc_check(struct drm_i915_gem_object *obj)
 
 static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	bool no_map;
 
+	if (HAS_LMEM(i915))
+		return type == I915_MMAP_TYPE_FIXED;
+	else if (type == I915_MMAP_TYPE_FIXED)
+		return false;
+
 	if (type == I915_MMAP_TYPE_GTT &&
 	    !i915_ggtt_has_aperture(&to_i915(obj->base.dev)->ggtt))
 		return false;
@@ -970,6 +984,8 @@ static int igt_mmap(void *arg)
 			err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
 			if (err == 0)
 				err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
+			if (err == 0)
+				err = __igt_mmap(i915, obj, I915_MMAP_TYPE_FIXED);
 
 			i915_gem_object_put(obj);
 			if (err)
@@ -987,6 +1003,7 @@ static const char *repr_mmap_type(enum i915_mmap_type type)
 	case I915_MMAP_TYPE_WB: return "wb";
 	case I915_MMAP_TYPE_WC: return "wc";
 	case I915_MMAP_TYPE_UC: return "uc";
+	case I915_MMAP_TYPE_FIXED: return "ttm";
 	default: return "unknown";
 	}
 }
@@ -1100,6 +1117,8 @@ static int igt_mmap_access(void *arg)
 			err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WC);
 		if (err == 0)
 			err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_UC);
+		if (err == 0)
+			err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_FIXED);
 
 		i915_gem_object_put(obj);
 		if (err)
@@ -1241,6 +1260,8 @@ static int igt_mmap_gpu(void *arg)
 		err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
+		if (err == 0)
+			err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_FIXED);
 
 		i915_gem_object_put(obj);
 		if (err)
@@ -1396,6 +1417,8 @@ static int igt_mmap_revoke(void *arg)
 		err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
+		if (err == 0)
+			err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_FIXED);
 
 		i915_gem_object_put(obj);
 		if (err)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e334a8b14ef2..91aeffd69291 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -849,31 +849,55 @@ struct drm_i915_gem_mmap_gtt {
 	__u64 offset;
 };
 
+/**
+ * struct drm_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer object.
+ *
+ * This struct is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
+ * and is used to retrieve the fake offset to mmap an object specified by &handle.
+ *
+ * The legacy way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
+ * `DRM_IOCTL_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will behave
+ * as setting the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
+ */
 struct drm_i915_gem_mmap_offset {
-	/** Handle for the object being mapped. */
+	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
+	/** @pad: Must be zero */
 	__u32 pad;
 	/**
-	 * Fake offset to use for subsequent mmap call
+	 * @offset: The fake offset to use for subsequent mmap call
 	 *
 	 * This is a fixed-size type for 32/64 compatibility.
 	 */
 	__u64 offset;
 
 	/**
-	 * Flags for extended behaviour.
+	 * @flags: Flags for extended behaviour.
+	 *
+	 * It is mandatory that one of the `MMAP_OFFSET` types
+	 * should be included:
+	 * - `I915_MMAP_OFFSET_GTT`: Use mmap with the object bound to GTT. (Write-Combined)
+	 * - `I915_MMAP_OFFSET_WC`: Use Write-Combined caching.
+	 * - `I915_MMAP_OFFSET_WB`: Use Write-Back caching.
+	 * - `I915_MMAP_OFFSET_FIXED`: Use object placement to determine caching.
+	 *
+	 * On devices with local memory `I915_MMAP_OFFSET_FIXED` is the only valid
+	 * type. Ondevices without local memory, this caching mode is invalid.
 	 *
-	 * It is mandatory that one of the MMAP_OFFSET types
-	 * (GTT, WC, WB, UC, etc) should be included.
+	 * As caching mode when specifying `I915_MMAP_OFFSET_FIXED`, WC or WB will
+	 * be used, depending on the object placement on creation. WB will be used
+	 * when the object can only exist in system memory, WB otherwise.
 	 */
 	__u64 flags;
-#define I915_MMAP_OFFSET_GTT 0
-#define I915_MMAP_OFFSET_WC  1
-#define I915_MMAP_OFFSET_WB  2
-#define I915_MMAP_OFFSET_UC  3
 
-	/*
-	 * Zero-terminated chain of extensions.
+#define I915_MMAP_OFFSET_GTT	0
+#define I915_MMAP_OFFSET_WC	1
+#define I915_MMAP_OFFSET_WB	2
+#define I915_MMAP_OFFSET_UC	3
+#define I915_MMAP_OFFSET_FIXED	4
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
 	 *
 	 * No current extensions defined; mbz.
 	 */
-- 
2.31.0

