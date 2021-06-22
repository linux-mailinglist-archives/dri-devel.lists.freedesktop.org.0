Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810C3B0060
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72FE6E471;
	Tue, 22 Jun 2021 09:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A556E463;
 Tue, 22 Jun 2021 09:34:36 +0000 (UTC)
IronPort-SDR: hNrzEnzeVgKKFHbzI1CN8mxYKZgvigtaljr2yjph63WqkkAfqGU39WgCzFaUsxrJSvFl+D7Ewe
 zrMf8f6pXVsw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194159550"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="194159550"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:31 -0700
IronPort-SDR: kZ5Op/Dmoha1MsyH0kYaGXco0dV1KCooCYn2cHkUUDP7/bWON5HtjAJeMfnGE6hBhgF/+yUJa7
 PNVQcVhU6Fug==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="623410012"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/3] drm/i915: Update object placement flags to be mutable
Date: Tue, 22 Jun 2021 11:34:16 +0200
Message-Id: <20210622093418.153400-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
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

The object ops i915_GEM_OBJECT_HAS_IOMEM and the object
I915_BO_ALLOC_STRUCT_PAGE flags are considered immutable by
much of our code. Introduce a new mem_flags member to hold these
and make sure checks for these flags being set are either done
under the object lock or with pages properly pinned. The flags
will change during migration under the object lock.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2:
- Unconditionally set VM_IO on our VMAs in line with the rest core gem
  and TTM. Since the bo might be migrated while the VMA is still alive,
  there is no sense, whether or not it maps iomem might change.
v6:
- Introduce a __i915_gem_object_is_lmem() to be used in situations where we
  know that a fence that can't currently signal keeps the object from being
  migrated or evicted.
- Move a couple of shmem warnings for DGFX to a later patch where we
  actually move system memory to TTM.
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      | 22 +++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |  2 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 12 +++---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 38 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 14 ++-----
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 20 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  7 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  4 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |  4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  5 +--
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |  3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 17 files changed, 101 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ce6b664b10aa..13b217f75055 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -177,8 +177,8 @@ i915_gem_object_create_internal(struct drm_i915_private *i915,
 		return ERR_PTR(-ENOMEM);
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
-	i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class,
-			     I915_BO_ALLOC_STRUCT_PAGE);
+	i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class, 0);
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 
 	/*
 	 * Mark the object as volatile, such that the pages are marked as
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index d539dffa1554..41d5182cd367 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -71,6 +71,28 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
 }
 
+/**
+ * __i915_gem_object_is_lmem - Whether the object is resident in
+ * lmem while in the fence signaling critical path.
+ * @obj: The object to check.
+ *
+ * This function is intended to be called from within the fence signaling
+ * path where the fence keeps the object from being migrated. For example
+ * during gpu reset or similar.
+ *
+ * Return: Whether the object is resident in lmem.
+ */
+bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
+
+#ifdef CONFIG_LOCKDEP
+	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true));
+#endif
+	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
+		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
+}
+
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index ea76fd11ccb0..27a611deba47 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -21,6 +21,8 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
 
+bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
+
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2fd155742bd2..6497a2dbdab9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -684,7 +684,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
 
 	if (mmap_type != I915_MMAP_TYPE_GTT &&
 	    !i915_gem_object_has_struct_page(obj) &&
-	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
+	    !i915_gem_object_has_iomem(obj))
 		return -ENODEV;
 
 	mmo = mmap_offset_attach(obj, mmap_type, file);
@@ -708,7 +708,12 @@ __assign_mmap_offset_handle(struct drm_file *file,
 	if (!obj)
 		return -ENOENT;
 
+	err = i915_gem_object_lock_interruptible(obj, NULL);
+	if (err)
+		goto out_put;
 	err = __assign_mmap_offset(obj, mmap_type, offset, file);
+	i915_gem_object_unlock(obj);
+out_put:
 	i915_gem_object_put(obj);
 	return err;
 }
@@ -932,10 +937,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		return PTR_ERR(anon);
 	}
 
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
-
-	if (i915_gem_object_has_iomem(obj))
-		vma->vm_flags |= VM_IO;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
 
 	/*
 	 * We keep the ref on mmo->obj, not vm_file, but we require
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index cf18c430d51f..07e8ff9a8aae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -475,6 +475,44 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
 	return obj->mm.n_placements > 1;
 }
 
+/**
+ * i915_gem_object_has_struct_page - Whether the object is page-backed
+ * @obj: The object to query.
+ *
+ * This function should only be called while the object is locked or pinned,
+ * otherwise the page backing may change under the caller.
+ *
+ * Return: True if page-backed, false otherwise.
+ */
+bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
+{
+#ifdef CONFIG_LOCKDEP
+	if (IS_DGFX(to_i915(obj->base.dev)) &&
+	    i915_gem_object_evictable((void __force *)obj))
+		assert_object_held_shared(obj);
+#endif
+	return obj->mem_flags & I915_BO_FLAG_STRUCT_PAGE;
+}
+
+/**
+ * i915_gem_object_has_iomem - Whether the object is iomem-backed
+ * @obj: The object to query.
+ *
+ * This function should only be called while the object is locked or pinned,
+ * otherwise the iomem backing may change under the caller.
+ *
+ * Return: True if iomem-backed, false otherwise.
+ */
+bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
+{
+#ifdef CONFIG_LOCKDEP
+	if (IS_DGFX(to_i915(obj->base.dev)) &&
+	    i915_gem_object_evictable((void __force *)obj))
+		assert_object_held_shared(obj);
+#endif
+	return obj->mem_flags & I915_BO_FLAG_IOMEM;
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
 	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 7bf4dd46d8d2..ea3224a480c4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -148,7 +148,7 @@ i915_gem_object_put(struct drm_i915_gem_object *obj)
 /*
  * If more than one potential simultaneous locker, assert held.
  */
-static inline void assert_object_held_shared(struct drm_i915_gem_object *obj)
+static inline void assert_object_held_shared(const struct drm_i915_gem_object *obj)
 {
 	/*
 	 * Note mm list lookup is protected by
@@ -266,17 +266,9 @@ i915_gem_object_type_has(const struct drm_i915_gem_object *obj,
 	return obj->ops->flags & flags;
 }
 
-static inline bool
-i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
-{
-	return obj->flags & I915_BO_ALLOC_STRUCT_PAGE;
-}
+bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj);
 
-static inline bool
-i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
-{
-	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
-}
+bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj);
 
 static inline bool
 i915_gem_object_is_shrinkable(const struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 3a2d9ecf8e03..28dec0787b3d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -33,10 +33,9 @@ struct i915_lut_handle {
 
 struct drm_i915_gem_object_ops {
 	unsigned int flags;
-#define I915_GEM_OBJECT_HAS_IOMEM	BIT(1)
-#define I915_GEM_OBJECT_IS_SHRINKABLE	BIT(2)
-#define I915_GEM_OBJECT_IS_PROXY	BIT(3)
-#define I915_GEM_OBJECT_NO_MMAP		BIT(4)
+#define I915_GEM_OBJECT_IS_SHRINKABLE	BIT(1)
+#define I915_GEM_OBJECT_IS_PROXY	BIT(2)
+#define I915_GEM_OBJECT_NO_MMAP		BIT(3)
 
 	/* Interface between the GEM object and its backing storage.
 	 * get_pages() is called once prior to the use of the associated set
@@ -201,17 +200,18 @@ struct drm_i915_gem_object {
 	unsigned long flags;
 #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
 #define I915_BO_ALLOC_VOLATILE   BIT(1)
-#define I915_BO_ALLOC_STRUCT_PAGE BIT(2)
-#define I915_BO_ALLOC_CPU_CLEAR  BIT(3)
-#define I915_BO_ALLOC_USER       BIT(4)
+#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
+#define I915_BO_ALLOC_USER       BIT(3)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
-			     I915_BO_ALLOC_STRUCT_PAGE | \
 			     I915_BO_ALLOC_CPU_CLEAR | \
 			     I915_BO_ALLOC_USER)
-#define I915_BO_READONLY         BIT(5)
-#define I915_TILING_QUIRK_BIT    6 /* unknown swizzling; do not release! */
+#define I915_BO_READONLY         BIT(4)
+#define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
 
+	unsigned int mem_flags:2;
+#define I915_BO_FLAG_STRUCT_PAGE BIT(0)
+#define I915_BO_FLAG_IOMEM       BIT(1)
 	/*
 	 * Is the object to be mapped as read-only to the GPU
 	 * Only honoured if hardware has relevant pte bit
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 086005c1c7ea..f2f850e31b8e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -351,7 +351,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	int err;
 
 	if (!i915_gem_object_has_struct_page(obj) &&
-	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
+	    !i915_gem_object_has_iomem(obj))
 		return ERR_PTR(-ENXIO);
 
 	assert_object_held(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index be72ad0634ba..7986612f48fa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -76,7 +76,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
 
 	/* We're no longer struct page backed */
-	obj->flags &= ~I915_BO_ALLOC_STRUCT_PAGE;
+	obj->mem_flags &= ~I915_BO_FLAG_STRUCT_PAGE;
 	__i915_gem_object_set_pages(obj, st, sg->length);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 5d16c4462fda..7aa1c95c7b7d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -444,7 +444,7 @@ shmem_pread(struct drm_i915_gem_object *obj,
 
 static void shmem_release(struct drm_i915_gem_object *obj)
 {
-	if (obj->flags & I915_BO_ALLOC_STRUCT_PAGE)
+	if (i915_gem_object_has_struct_page(obj))
 		i915_gem_object_release_memory_region(obj);
 
 	fput(obj->base.filp);
@@ -513,9 +513,8 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	mapping_set_gfp_mask(mapping, mask);
 	GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
 
-	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class,
-			     I915_BO_ALLOC_STRUCT_PAGE);
-
+	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c5deb8b7227c..b5dd3b7037f4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -732,7 +732,6 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
 
 const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
-	.flags = I915_GEM_OBJECT_HAS_IOMEM,
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
@@ -777,6 +776,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_init_memory_region(obj, mem);
 	i915_gem_object_make_unshrinkable(obj);
 	obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
+	obj->mem_flags |= I915_BO_FLAG_IOMEM;
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 4b0acc7eaa27..56edfeff8c02 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -510,8 +510,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
 		return -ENOMEM;
 
 	drm_gem_private_object_init(dev, &obj->base, args->user_size);
-	i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class,
-			     I915_BO_ALLOC_STRUCT_PAGE);
+	i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class, 0);
+	obj->mem_flags = I915_BO_FLAG_STRUCT_PAGE;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
index 0c8ecfdf5405..f963b8e1e37b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
@@ -114,8 +114,8 @@ huge_gem_object(struct drm_i915_private *i915,
 		return ERR_PTR(-ENOMEM);
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, dma_size);
-	i915_gem_object_init(obj, &huge_ops, &lock_class,
-			     I915_BO_ALLOC_STRUCT_PAGE);
+	i915_gem_object_init(obj, &huge_ops, &lock_class, 0);
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index dadd485bc52f..ccc67ed1a84b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -167,9 +167,8 @@ huge_pages_object(struct drm_i915_private *i915,
 		return ERR_PTR(-ENOMEM);
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
-	i915_gem_object_init(obj, &huge_page_ops, &lock_class,
-			     I915_BO_ALLOC_STRUCT_PAGE);
-
+	i915_gem_object_init(obj, &huge_page_ops, &lock_class, 0);
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 	i915_gem_object_set_volatile(obj);
 
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 44b5de06ce64..fcea0ddabcc5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -837,7 +837,7 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 
 	if (type != I915_MMAP_TYPE_GTT &&
 	    !i915_gem_object_has_struct_page(obj) &&
-	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
+	    !i915_gem_object_has_iomem(obj))
 		return false;
 
 	return true;
@@ -991,7 +991,7 @@ static const char *repr_mmap_type(enum i915_mmap_type type)
 static bool can_access(const struct drm_i915_gem_object *obj)
 {
 	return i915_gem_object_has_struct_page(obj) ||
-	       i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
+	       i915_gem_object_has_iomem(obj);
 }
 
 static int __igt_mmap_access(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
index 3a6ce87f8b52..d43d8dae0f69 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
@@ -25,13 +25,14 @@ static int mock_phys_object(void *arg)
 		goto out;
 	}
 
+	i915_gem_object_lock(obj, NULL);
 	if (!i915_gem_object_has_struct_page(obj)) {
+		i915_gem_object_unlock(obj);
 		err = -EINVAL;
 		pr_err("shmem has no struct page\n");
 		goto out_obj;
 	}
 
-	i915_gem_object_lock(obj, NULL);
 	err = i915_gem_object_attach_phys(obj, PAGE_SIZE);
 	i915_gem_object_unlock(obj);
 	if (err) {
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index cb182c6d265a..a2c58b54a592 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1039,7 +1039,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			if (ret)
 				break;
 		}
-	} else if (i915_gem_object_is_lmem(vma->obj)) {
+	} else if (__i915_gem_object_is_lmem(vma->obj)) {
 		struct intel_memory_region *mem = vma->obj->mm.region;
 		dma_addr_t dma;
 
-- 
2.31.1

