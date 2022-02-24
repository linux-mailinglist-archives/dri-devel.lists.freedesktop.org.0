Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420184C27F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB110F41E;
	Thu, 24 Feb 2022 09:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427C110F40F;
 Thu, 24 Feb 2022 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645694428; x=1677230428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pngQ4mRh/M6WiMxudKVZlufYGk+dA9oHhygxd4XH3VI=;
 b=dQrBohyXlnA1XocOWWUJKGi4Hnl+gKY2OcZG6h/AYQBD8gJzOx5uOLYL
 t9HtzQFRYoKqQs8lbeMqyTM9xz2fzThA7FhwffZ+t4Gjr+nkVIpRwAOhW
 d7EFDIG7IprPCXEycHeUuwfyN4DqLqHfwmfEHMr6npR189ud1WQrsYtnW
 HBRAkKYhXFbf/gIGwsNWf10HtSOVWuTO02y0PlF6cI4nZ3TAtsjzNEodb
 5gRLjbMbg4LT4ErfIU/IniXyfV58mBlhwgJsYOVW9PrKcNUUEcES4wrDY
 GNQVqNU00aEyYakDljQ/QCLuO9OrM2jZfe3PFv6F/DeJWAPr6up2neTDv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232162986"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="232162986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 01:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="491537762"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2022 01:20:21 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH 2/6] drm/i915/uapi: implement object placement extension
Date: Thu, 24 Feb 2022 14:52:28 +0530
Message-Id: <20220224092232.780075-3-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224092232.780075-1-pallavi.mishra@intel.com>
References: <20220224092232.780075-1-pallavi.mishra@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 matthew.auld@intel.com, Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

Add new extension to support setting an immutable-priority-list of
potential placements, at creation time.

If we use the normal gem_create or gem_create_ext without the
extensions/placements then we still get the old behaviour with only
placing the object in system memory.

v2(Daniel & Jason):
    - Add a bunch of kernel-doc
    - Simplify design for placements extension

Testcase: igt/gem_create/create-ext-placement-sanity-check
Testcase: igt/gem_create/create-ext-placement-each
Testcase: igt/gem_create/create-ext-placement-all
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210429103056.407067-6-matthew.auld@intel.com
(cherry picked from commit 2459e56fd8af0b47fcbfbdff2fdc02e4077680ec)
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 218 ++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  26 +++
 drivers/gpu/drm/i915/intel_memory_region.c    |  16 ++
 drivers/gpu/drm/i915/intel_memory_region.h    |   4 +
 include/uapi/drm/i915_drm.h                   |  62 +++++
 7 files changed, 318 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 1e82633a3898..957f790c644b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -4,12 +4,51 @@
  */
 
 #include "gem/i915_gem_ioctls.h"
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 
 #include "i915_drv.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
+static u32 object_max_page_size(struct drm_i915_gem_object *obj)
+{
+	u32 max_page_size = 0;
+	int i;
+
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		struct intel_memory_region *mr = obj->mm.placements[i];
+
+		GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
+		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
+	}
+
+	GEM_BUG_ON(!max_page_size);
+	return max_page_size;
+}
+
+static void object_set_placements(struct drm_i915_gem_object *obj,
+				  struct intel_memory_region **placements,
+				  unsigned int n_placements)
+{
+	GEM_BUG_ON(!n_placements);
+
+	/*
+	 * For the common case of one memory region, skip storing an
+	 * allocated array and just point at the region directly.
+	 */
+	if (n_placements == 1) {
+		struct intel_memory_region *mr = placements[0];
+		struct drm_i915_private *i915 = mr->i915;
+
+		obj->mm.placements = &i915->mm.regions[mr->id];
+		obj->mm.n_placements = 1;
+	} else {
+		obj->mm.placements = placements;
+		obj->mm.n_placements = n_placements;
+	}
+}
+
 static int i915_gem_publish(struct drm_i915_gem_object *obj,
 			    struct drm_file *file,
 			    u64 *size_p,
@@ -29,14 +68,12 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
 }
 
 static int
-i915_gem_setup(struct drm_i915_gem_object *obj,
-	       struct intel_memory_region *mr,
-	       u64 size)
+i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 {
+	struct intel_memory_region *mr = obj->mm.placements[0];
 	int ret;
 
-	GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
-	size = round_up(size, mr->min_page_size);
+	size = round_up(size, object_max_page_size(obj));
 	if (size == 0)
 		return -EINVAL;
 
@@ -62,6 +99,7 @@ i915_gem_dumb_create(struct drm_file *file,
 		     struct drm_mode_create_dumb *args)
 {
 	struct drm_i915_gem_object *obj;
+	struct intel_memory_region *mr;
 	enum intel_memory_type mem_type;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	u32 format;
@@ -102,10 +140,10 @@ i915_gem_dumb_create(struct drm_file *file,
 	if (!obj)
 		return -ENOMEM;
 
-	ret = i915_gem_setup(obj,
-			     intel_memory_region_by_type(to_i915(dev),
-							 mem_type),
-			     args->size);
+	mr = intel_memory_region_by_type(to_i915(dev), mem_type);
+	object_set_placements(obj, &mr, 1);
+
+	ret = i915_gem_setup(obj, args->size);
 	if (ret)
 		goto object_free;
 
@@ -129,6 +167,7 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_create *args = data;
 	struct drm_i915_gem_object *obj;
+	struct intel_memory_region *mr;
 	int ret;
 
 	i915_gem_flush_free_objects(i915);
@@ -137,10 +176,10 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (!obj)
 		return -ENOMEM;
 
-	ret = i915_gem_setup(obj,
-			     intel_memory_region_by_type(i915,
-							 INTEL_MEMORY_SYSTEM),
-			     args->size);
+	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
+	object_set_placements(obj, &mr, 1);
+
+	ret = i915_gem_setup(obj, args->size);
 	if (ret)
 		goto object_free;
 
@@ -156,7 +195,144 @@ struct create_ext {
 	struct drm_i915_gem_object *vanilla_object;
 };
 
+static void repr_placements(char *buf, size_t size,
+			    struct intel_memory_region **placements,
+			    int n_placements)
+{
+	int i;
+
+	buf[0] = '\0';
+
+	for (i = 0; i < n_placements; i++) {
+		struct intel_memory_region *mr = placements[i];
+		int r;
+
+		r = snprintf(buf, size, "\n  %s -> { class: %d, inst: %d }",
+			     mr->name, mr->type, mr->instance);
+		if (r >= size)
+			return;
+
+		buf += r;
+		size -= r;
+	}
+}
+
+static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
+			  struct create_ext *ext_data)
+{
+	struct drm_i915_private *i915 = ext_data->i915;
+	struct drm_i915_gem_memory_class_instance __user *uregions =
+		u64_to_user_ptr(args->regions);
+	struct drm_i915_gem_object *obj = ext_data->vanilla_object;
+	struct intel_memory_region **placements;
+	u32 mask;
+	int i, ret = 0;
+
+	if (args->pad) {
+		drm_dbg(&i915->drm, "pad should be zero\n");
+		ret = -EINVAL;
+	}
+
+	if (!args->num_regions) {
+		drm_dbg(&i915->drm, "num_regions is zero\n");
+		ret = -EINVAL;
+	}
+
+	if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
+		drm_dbg(&i915->drm, "num_regions is too large\n");
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	placements = kmalloc_array(args->num_regions,
+				   sizeof(struct intel_memory_region *),
+				   GFP_KERNEL);
+	if (!placements)
+		return -ENOMEM;
+
+	mask = 0;
+	for (i = 0; i < args->num_regions; i++) {
+		struct drm_i915_gem_memory_class_instance region;
+		struct intel_memory_region *mr;
+
+		if (copy_from_user(&region, uregions, sizeof(region))) {
+			ret = -EFAULT;
+			goto out_free;
+		}
+
+		mr = intel_memory_region_lookup(i915,
+						region.memory_class,
+						region.memory_instance);
+		if (!mr || mr->private) {
+			drm_dbg(&i915->drm, "Device is missing region { class: %d, inst: %d } at index = %d\n",
+				region.memory_class, region.memory_instance, i);
+			ret = -EINVAL;
+			goto out_dump;
+		}
+
+		if (mask & BIT(mr->id)) {
+			drm_dbg(&i915->drm, "Found duplicate placement %s -> { class: %d, inst: %d } at index = %d\n",
+				mr->name, region.memory_class,
+				region.memory_instance, i);
+			ret = -EINVAL;
+			goto out_dump;
+		}
+
+		placements[i] = mr;
+		mask |= BIT(mr->id);
+
+		++uregions;
+	}
+
+	if (obj->mm.placements) {
+		ret = -EINVAL;
+		goto out_dump;
+	}
+
+	object_set_placements(obj, placements, args->num_regions);
+	if (args->num_regions == 1)
+		kfree(placements);
+
+	return 0;
+
+out_dump:
+	if (1) {
+		char buf[256];
+
+		if (obj->mm.placements) {
+			repr_placements(buf,
+					sizeof(buf),
+					obj->mm.placements,
+					obj->mm.n_placements);
+			drm_dbg(&i915->drm,
+				"Placements were already set in previous EXT. Existing placements: %s\n",
+				buf);
+		}
+
+		repr_placements(buf, sizeof(buf), placements, i);
+		drm_dbg(&i915->drm, "New placements(so far validated): %s\n", buf);
+	}
+
+out_free:
+	kfree(placements);
+	return ret;
+}
+
+static int ext_set_placements(struct i915_user_extension __user *base,
+			      void *data)
+{
+	struct drm_i915_gem_create_ext_memory_regions ext;
+
+	if (copy_from_user(&ext, base, sizeof(ext)))
+		return -EFAULT;
+
+	return set_placements(&ext, data);
+}
+
 static const i915_user_extension_fn create_extensions[] = {
+	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
 };
 
 /**
@@ -172,6 +348,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_create_ext *args = data;
 	struct create_ext ext_data = { .i915 = i915 };
+	struct intel_memory_region **placements_ext;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
@@ -189,19 +366,26 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 				   create_extensions,
 				   ARRAY_SIZE(create_extensions),
 				   &ext_data);
+	placements_ext = obj->mm.placements;
 	if (ret)
 		goto object_free;
 
-	ret = i915_gem_setup(obj,
-			     intel_memory_region_by_type(i915,
-							 INTEL_MEMORY_SYSTEM),
-			     args->size);
+	if (!placements_ext) {
+		struct intel_memory_region *mr =
+			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
+
+		object_set_placements(obj, &mr, 1);
+	}
+
+	ret = i915_gem_setup(obj, args->size);
 	if (ret)
 		goto object_free;
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
 
 object_free:
+	if (obj->mm.n_placements > 1)
+		kfree(placements_ext);
 	i915_gem_object_free(obj);
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 70f798405f7f..8620b8f4f62c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -253,6 +253,9 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 		if (obj->ops->release)
 			obj->ops->release(obj);
 
+		if (obj->mm.n_placements > 1)
+			kfree(obj->mm.placements);
+
 		/* But keep the pointer alive for RCU-protected lookups */
 		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
 		cond_resched();
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 0438e00d4ca7..b42294fe1303 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -217,6 +217,12 @@ struct drm_i915_gem_object {
 		atomic_t pages_pin_count;
 		atomic_t shrink_pin;
 
+		/**
+		 * Priority list of potential placements for this object.
+		 */
+		struct intel_memory_region **placements;
+		int n_placements;
+
 		/**
 		 * Memory region for this object.
 		 */
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 517a627f1f54..59a83efef858 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -843,6 +843,24 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 	return true;
 }
 
+static void object_set_placements(struct drm_i915_gem_object *obj,
+				  struct intel_memory_region **placements,
+				  unsigned int n_placements)
+{
+	GEM_BUG_ON(!n_placements);
+
+	if (n_placements == 1) {
+		struct drm_i915_private *i915 = to_i915(obj->base.dev);
+		struct intel_memory_region *mr = placements[0];
+
+		obj->mm.placements = &i915->mm.regions[mr->id];
+		obj->mm.n_placements = 1;
+	} else {
+		obj->mm.placements = placements;
+		obj->mm.n_placements = n_placements;
+	}
+}
+
 #define expand32(x) (((x) << 0) | ((x) << 8) | ((x) << 16) | ((x) << 24))
 static int __igt_mmap(struct drm_i915_private *i915,
 		      struct drm_i915_gem_object *obj,
@@ -951,6 +969,8 @@ static int igt_mmap(void *arg)
 			if (IS_ERR(obj))
 				return PTR_ERR(obj);
 
+			object_set_placements(obj, &mr, 1);
+
 			err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
 			if (err == 0)
 				err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
@@ -1071,6 +1091,8 @@ static int igt_mmap_access(void *arg)
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
+		object_set_placements(obj, &mr, 1);
+
 		err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WB);
@@ -1214,6 +1236,8 @@ static int igt_mmap_gpu(void *arg)
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
+		object_set_placements(obj, &mr, 1);
+
 		err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
@@ -1355,6 +1379,8 @@ static int igt_mmap_revoke(void *arg)
 		if (IS_ERR(obj))
 			return PTR_ERR(obj);
 
+		object_set_placements(obj, &mr, 1);
+
 		err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
 		if (err == 0)
 			err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 481a487faca6..d98e8b81d322 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -28,6 +28,22 @@ static const struct {
 	},
 };
 
+struct intel_memory_region *
+intel_memory_region_lookup(struct drm_i915_private *i915,
+			   u16 class, u16 instance)
+{
+	struct intel_memory_region *mr;
+	int id;
+
+	/* XXX: consider maybe converting to an rb tree at some point */
+	for_each_memory_region(mr, i915, id) {
+		if (mr->type == class && mr->instance == instance)
+			return mr;
+	}
+
+	return NULL;
+}
+
 struct intel_memory_region *
 intel_memory_region_by_type(struct drm_i915_private *i915,
 			    enum intel_memory_type mem_type)
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 7cd8e3d66a7f..d24ce5a0b30b 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -97,6 +97,10 @@ struct intel_memory_region {
 	} objects;
 };
 
+struct intel_memory_region *
+intel_memory_region_lookup(struct drm_i915_private *i915,
+			   u16 class, u16 instance);
+
 int intel_memory_region_init_buddy(struct intel_memory_region *mem);
 void intel_memory_region_release_buddy(struct intel_memory_region *mem);
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 06ccab39864b..a2a195404930 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2993,6 +2993,11 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * The (page-aligned) allocated size for the object will be returned.
 	 *
+	 * Note that for some devices we have might have further minimum
+	 * page-size restrictions(larger than 4K), like for device local-memory.
+	 * However in general the final size here should always reflect any
+	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
+	 * extension to place the object in device local-memory.
 	 */
 	__u64 size;
 	/**
@@ -3013,10 +3018,67 @@ struct drm_i915_gem_create_ext {
 	 * If we don't supply any extensions then we get the same old gem_create
 	 * behaviour.
 	 *
+	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
+	 * struct drm_i915_gem_create_ext_memory_regions.
 	 */
+#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
 	__u64 extensions;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_memory_regions - The
+ * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension.
+ *
+ * Set the object with the desired set of placements/regions in priority
+ * order. Each entry must be unique and supported by the device.
+ *
+ * This is provided as an array of struct drm_i915_gem_memory_class_instance, or
+ * an equivalent layout of class:instance pair encodings. See struct
+ * drm_i915_query_memory_regions and DRM_I915_QUERY_MEMORY_REGIONS for how to
+ * query the supported regions for a device.
+ *
+ * As an example, on discrete devices, if we wish to set the placement as
+ * device local-memory we can do something like:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_i915_gem_memory_class_instance region_lmem = {
+ *              .memory_class = I915_MEMORY_CLASS_DEVICE,
+ *              .memory_instance = 0,
+ *      };
+ *      struct drm_i915_gem_create_ext_memory_regions regions = {
+ *              .base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+ *              .regions = (uintptr_t)&region_lmem,
+ *              .num_regions = 1,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext = {
+ *              .size = 16 * PAGE_SIZE,
+ *              .extensions = (uintptr_t)&regions,
+ *      };
+ *
+ *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ *
+ * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
+ * along with the final object size in &drm_i915_gem_create_ext.size, which
+ * should account for any rounding up, if required.
+ */
+struct drm_i915_gem_create_ext_memory_regions {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @num_regions: Number of elements in the @regions array. */
+	__u32 num_regions;
+	/**
+	 * @regions: The regions/placements array.
+	 *
+	 * An array of struct drm_i915_gem_memory_class_instance.
+	 */
+	__u64 regions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
