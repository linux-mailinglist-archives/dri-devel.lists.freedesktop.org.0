Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A0395A6C
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648576E913;
	Mon, 31 May 2021 12:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12156E927;
 Mon, 31 May 2021 12:20:26 +0000 (UTC)
IronPort-SDR: KyDybwj8/GxH0/stZlJmyZzlbXIqx0ai556TSwPytLkegwUFMLpWTvq+cM9dY/NJNzpLGP4EbG
 BiFS3cFpwL/g==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="203147092"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="203147092"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:24 -0700
IronPort-SDR: TgVg5THgIrZXylYvQjOe9es9IcwobpkTId29rOKD1Jl0LYpCS3ir9QYQFHDpQahPihf/jrjDEd
 Yo8uX3rggWUg==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473904030"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 15/15] drm/i915: Use ttm mmap handling for ttm bo's.
Date: Mon, 31 May 2021 14:19:40 +0200
Message-Id: <20210531121940.267032-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Use the ttm handlers for servicing page faults, and vm_access.

We do our own validation of read-only access, otherwise use the
ttm handlers as much as possible.

Because the ttm handlers expect the vma_node at vma->base, we slightly
need to massage the mmap handlers to look at vma_node->driver_private
to fetch the bo, if it's NULL, we assume i915's normal mmap_offset uapi
is used.

This is the easiest way to achieve compatibility without changing ttm's
semantics.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
- Fixed some minor style issues. (Thomas Hellström)
- Added a mutex Destroy (Thomas Hellström)
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  83 ++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 121 +++++++++++++++++-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  90 ++++++-------
 drivers/gpu/drm/i915/selftests/igt_mmap.c     |  25 +++-
 drivers/gpu/drm/i915/selftests/igt_mmap.h     |  12 +-
 8 files changed, 251 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index fd1c9714f8d8..d1de97e4adfd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -19,6 +19,7 @@
 #include "i915_gem_mman.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
+#include "i915_gem_ttm.h"
 #include "i915_vma.h"
 
 static inline bool
@@ -622,6 +623,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	struct i915_mmap_offset *mmo;
 	int err;
 
+	GEM_BUG_ON(obj->ops->mmap_offset || obj->ops->mmap_ops);
+
 	mmo = lookup_mmo(obj, mmap_type);
 	if (mmo)
 		goto out;
@@ -664,40 +667,47 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 }
 
 static int
-__assign_mmap_offset(struct drm_file *file,
-		     u32 handle,
+__assign_mmap_offset(struct drm_i915_gem_object *obj,
 		     enum i915_mmap_type mmap_type,
-		     u64 *offset)
+		     u64 *offset, struct drm_file *file)
 {
-	struct drm_i915_gem_object *obj;
 	struct i915_mmap_offset *mmo;
-	int err;
 
-	obj = i915_gem_object_lookup(file, handle);
-	if (!obj)
-		return -ENOENT;
+	if (i915_gem_object_never_mmap(obj))
+		return -ENODEV;
 
-	if (i915_gem_object_never_mmap(obj)) {
-		err = -ENODEV;
-		goto out;
+	if (obj->ops->mmap_offset)  {
+		*offset = obj->ops->mmap_offset(obj);
+		return 0;
 	}
 
 	if (mmap_type != I915_MMAP_TYPE_GTT &&
 	    !i915_gem_object_has_struct_page(obj) &&
-	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM)) {
-		err = -ENODEV;
-		goto out;
-	}
+	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
+		return -ENODEV;
 
 	mmo = mmap_offset_attach(obj, mmap_type, file);
-	if (IS_ERR(mmo)) {
-		err = PTR_ERR(mmo);
-		goto out;
-	}
+	if (IS_ERR(mmo))
+		return PTR_ERR(mmo);
 
 	*offset = drm_vma_node_offset_addr(&mmo->vma_node);
-	err = 0;
-out:
+	return 0;
+}
+
+static int
+__assign_mmap_offset_handle(struct drm_file *file,
+			    u32 handle,
+			    enum i915_mmap_type mmap_type,
+			    u64 *offset)
+{
+	struct drm_i915_gem_object *obj;
+	int err;
+
+	obj = i915_gem_object_lookup(file, handle);
+	if (!obj)
+		return -ENOENT;
+
+	err = __assign_mmap_offset(obj, mmap_type, offset, file);
 	i915_gem_object_put(obj);
 	return err;
 }
@@ -717,7 +727,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
 	else
 		mmap_type = I915_MMAP_TYPE_GTT;
 
-	return __assign_mmap_offset(file, handle, mmap_type, offset);
+	return __assign_mmap_offset_handle(file, handle, mmap_type, offset);
 }
 
 /**
@@ -785,7 +795,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	return __assign_mmap_offset(file, args->handle, type, &args->offset);
+	return __assign_mmap_offset_handle(file, args->handle, type, &args->offset);
 }
 
 static void vm_open(struct vm_area_struct *vma)
@@ -889,8 +899,18 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		 * destroyed and will be invalid when the vma manager lock
 		 * is released.
 		 */
-		mmo = container_of(node, struct i915_mmap_offset, vma_node);
-		obj = i915_gem_object_get_rcu(mmo->obj);
+		if (!node->driver_private) {
+			mmo = container_of(node, struct i915_mmap_offset, vma_node);
+			obj = i915_gem_object_get_rcu(mmo->obj);
+
+			GEM_BUG_ON(obj && obj->ops->mmap_ops);
+		} else {
+			obj = i915_gem_object_get_rcu
+				(container_of(node, struct drm_i915_gem_object,
+					      base.vma_node));
+
+			GEM_BUG_ON(obj && !obj->ops->mmap_ops);
+		}
 	}
 	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
 	rcu_read_unlock();
@@ -912,7 +932,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	}
 
 	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_private_data = mmo;
+
+	if (i915_gem_object_has_iomem(obj))
+		vma->vm_flags |= VM_IO;
 
 	/*
 	 * We keep the ref on mmo->obj, not vm_file, but we require
@@ -926,6 +948,15 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	/* Drop the initial creation reference, the vma is now holding one. */
 	fput(anon);
 
+	if (obj->ops->mmap_ops) {
+		vma->vm_page_prot = pgprot_decrypted(vm_get_page_prot(vma->vm_flags));
+		vma->vm_ops = obj->ops->mmap_ops;
+		vma->vm_private_data = node->driver_private;
+		return 0;
+	}
+
+	vma->vm_private_data = mmo;
+
 	switch (mmo->mmap_type) {
 	case I915_MMAP_TYPE_WC:
 		vma->vm_page_prot =
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a3ad8cf4eefd..ff59e6c640e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -342,14 +342,14 @@ struct scatterlist *
 __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
-			 unsigned int *offset, bool allow_alloc);
+			 unsigned int *offset, bool allow_alloc, bool dma);
 
 static inline struct scatterlist *
 i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 		       unsigned int n,
 		       unsigned int *offset, bool allow_alloc)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc, false);
 }
 
 static inline struct scatterlist *
@@ -357,7 +357,7 @@ i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
 			   unsigned int n,
 			   unsigned int *offset, bool allow_alloc)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc, true);
 }
 
 struct page *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 68313474e6a6..2a23b77424b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -61,6 +61,7 @@ struct drm_i915_gem_object_ops {
 		     const struct drm_i915_gem_pread *arg);
 	int (*pwrite)(struct drm_i915_gem_object *obj,
 		      const struct drm_i915_gem_pwrite *arg);
+	u64 (*mmap_offset)(struct drm_i915_gem_object *obj);
 
 	int (*dmabuf_export)(struct drm_i915_gem_object *obj);
 
@@ -79,6 +80,7 @@ struct drm_i915_gem_object_ops {
 	void (*delayed_free)(struct drm_i915_gem_object *obj);
 	void (*release)(struct drm_i915_gem_object *obj);
 
+	const struct vm_operations_struct *mmap_ops;
 	const char *name; /* friendly name for debug, e.g. lockdep classes */
 };
 
@@ -328,6 +330,7 @@ struct drm_i915_gem_object {
 
 	struct {
 		struct sg_table *cached_io_st;
+		struct i915_gem_object_page_iter get_io_page;
 		bool created:1;
 	} ttm;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 6444e097016d..086005c1c7ea 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -467,9 +467,8 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
 			 unsigned int *offset,
-			 bool allow_alloc)
+			 bool allow_alloc, bool dma)
 {
-	const bool dma = iter == &obj->mm.get_dma_page;
 	struct scatterlist *sg;
 	unsigned int idx, count;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index fbb32b148be3..3748098b42d5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -13,6 +13,7 @@
 #include "gem/i915_gem_object.h"
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
+#include "gem/i915_gem_mman.h"
 
 #define I915_PL_LMEM0 TTM_PL_PRIV
 #define I915_PL_SYSTEM TTM_PL_SYSTEM
@@ -158,11 +159,20 @@ static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
 
 static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
 {
-	if (obj->ttm.cached_io_st) {
-		sg_free_table(obj->ttm.cached_io_st);
-		kfree(obj->ttm.cached_io_st);
-		obj->ttm.cached_io_st = NULL;
-	}
+	struct radix_tree_iter iter;
+	void __rcu **slot;
+
+	if (!obj->ttm.cached_io_st)
+		return;
+
+	rcu_read_lock();
+	radix_tree_for_each_slot(slot, &obj->ttm.get_io_page.radix, &iter, 0)
+		radix_tree_delete(&obj->ttm.get_io_page.radix, iter.index);
+	rcu_read_unlock();
+
+	sg_free_table(obj->ttm.cached_io_st);
+	kfree(obj->ttm.cached_io_st);
+	obj->ttm.cached_io_st = NULL;
 }
 
 static void i915_ttm_purge(struct drm_i915_gem_object *obj)
@@ -338,12 +348,41 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_free_cached_io_st(obj);
 
-	if (!dst_man->use_tt)
+	if (!dst_man->use_tt) {
 		obj->ttm.cached_io_st = dst_st;
+		obj->ttm.get_io_page.sg_pos = dst_st->sgl;
+		obj->ttm.get_io_page.sg_idx = 0;
+	}
 
 	return 0;
 }
 
+static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
+{
+	if (mem->mem_type < I915_PL_LMEM0)
+		return 0;
+
+	mem->bus.caching = ttm_write_combined;
+	mem->bus.is_iomem = true;
+
+	return 0;
+}
+
+static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
+					 unsigned long page_offset)
+{
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	unsigned long base = obj->mm.region->iomap.base - obj->mm.region->region.start;
+	struct scatterlist *sg;
+	unsigned int ofs;
+
+	GEM_WARN_ON(bo->ttm);
+
+	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs, true, true);
+
+	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
+}
+
 static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
 	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
@@ -353,6 +392,8 @@ static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.move = i915_ttm_move,
 	.swap_notify = i915_ttm_swap_notify,
 	.delete_mem_notify = i915_ttm_delete_mem_notify,
+	.io_mem_reserve = i915_ttm_io_mem_reserve,
+	.io_mem_pfn = i915_ttm_io_mem_pfn,
 };
 
 /**
@@ -460,7 +501,67 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 	}
 }
 
-static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
+static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
+{
+	struct vm_area_struct *area = vmf->vma;
+	struct drm_i915_gem_object *obj =
+		i915_ttm_to_gem(area->vm_private_data);
+
+	/* Sanity check that we allow writing into this object */
+	if (unlikely(i915_gem_object_is_readonly(obj) &&
+		     area->vm_flags & VM_WRITE))
+		return VM_FAULT_SIGBUS;
+
+	return ttm_bo_vm_fault(vmf);
+}
+
+static int
+vm_access_ttm(struct vm_area_struct *area, unsigned long addr,
+	      void *buf, int len, int write)
+{
+	struct drm_i915_gem_object *obj =
+		i915_ttm_to_gem(area->vm_private_data);
+
+	if (i915_gem_object_is_readonly(obj) && write)
+		return -EACCES;
+
+	return ttm_bo_vm_access(area, addr, buf, len, write);
+}
+
+static void ttm_vm_open(struct vm_area_struct *vma)
+{
+	struct drm_i915_gem_object *obj =
+		i915_ttm_to_gem(vma->vm_private_data);
+
+	GEM_BUG_ON(!obj);
+	i915_gem_object_get(obj);
+}
+
+static void ttm_vm_close(struct vm_area_struct *vma)
+{
+	struct drm_i915_gem_object *obj =
+		i915_ttm_to_gem(vma->vm_private_data);
+
+	GEM_BUG_ON(!obj);
+	i915_gem_object_put(obj);
+}
+
+static const struct vm_operations_struct vm_ops_ttm = {
+	.fault = vm_fault_ttm,
+	.access = vm_access_ttm,
+	.open = ttm_vm_open,
+	.close = ttm_vm_close,
+};
+
+static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
+{
+	/* The ttm_bo must be allocated with I915_BO_ALLOC_USER */
+	GEM_BUG_ON(!drm_mm_node_allocated(&obj->base.vma_node.vm_node));
+
+	return drm_vma_node_offset_addr(&obj->base.vma_node);
+}
+
+const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
 	.flags = I915_GEM_OBJECT_HAS_IOMEM,
 
@@ -469,6 +570,8 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.truncate = i915_ttm_purge,
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
+	.mmap_offset = i915_ttm_mmap_offset,
+	.mmap_ops = &vm_ops_ttm,
 };
 
 void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
@@ -476,6 +579,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
 	i915_gem_object_release_memory_region(obj);
+	mutex_destroy(&obj->ttm.get_io_page.lock);
 	if (obj->ttm.created)
 		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
 }
@@ -517,6 +621,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_make_unshrinkable(obj);
 	obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
+	mutex_init(&obj->ttm.get_io_page.lock);
 
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
@@ -528,6 +634,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
 	 * until successful initialization.
 	 */
+	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
 			  bo_type, &i915_sys_placement, alignment,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 05a3b29f545e..ca69a29b7f2a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -578,16 +578,17 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
 			       int expected)
 {
 	struct drm_i915_gem_object *obj;
-	struct i915_mmap_offset *mmo;
+	u64 offset;
+	int ret;
 
 	obj = i915_gem_object_create_internal(i915, size);
 	if (IS_ERR(obj))
-		return false;
+		return expected && expected == PTR_ERR(obj);
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
+	ret = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
 	i915_gem_object_put(obj);
 
-	return PTR_ERR_OR_ZERO(mmo) == expected;
+	return ret == expected;
 }
 
 static void disable_retire_worker(struct drm_i915_private *i915)
@@ -622,8 +623,8 @@ static int igt_mmap_offset_exhaustion(void *arg)
 	struct drm_mm *mm = &i915->drm.vma_offset_manager->vm_addr_space_mm;
 	struct drm_i915_gem_object *obj;
 	struct drm_mm_node *hole, *next;
-	struct i915_mmap_offset *mmo;
 	int loop, err = 0;
+	u64 offset;
 
 	/* Disable background reaper */
 	disable_retire_worker(i915);
@@ -684,13 +685,13 @@ static int igt_mmap_offset_exhaustion(void *arg)
 	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
+		pr_err("Unable to create object for reclaimed hole\n");
 		goto out;
 	}
 
-	mmo = mmap_offset_attach(obj, I915_MMAP_OFFSET_GTT, NULL);
-	if (IS_ERR(mmo)) {
+	err = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
+	if (err) {
 		pr_err("Unable to insert object into reclaimed hole\n");
-		err = PTR_ERR(mmo);
 		goto err_obj;
 	}
 
@@ -865,10 +866,10 @@ static int __igt_mmap(struct drm_i915_private *i915,
 		      struct drm_i915_gem_object *obj,
 		      enum i915_mmap_type type)
 {
-	struct i915_mmap_offset *mmo;
 	struct vm_area_struct *area;
 	unsigned long addr;
 	int err, i;
+	u64 offset;
 
 	if (!can_mmap(obj, type))
 		return 0;
@@ -879,11 +880,11 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
-	if (IS_ERR(mmo))
-		return PTR_ERR(mmo);
+	err = __assign_mmap_offset(obj, type, &offset, NULL);
+	if (err)
+		return err;
 
-	addr = igt_mmap_node(i915, &mmo->vma_node, 0, PROT_WRITE, MAP_SHARED);
+	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -897,13 +898,6 @@ static int __igt_mmap(struct drm_i915_private *i915,
 		goto out_unmap;
 	}
 
-	if (area->vm_private_data != mmo) {
-		pr_err("%s: vm_area_struct did not point back to our mmap_offset object!\n",
-		       obj->mm.region->name);
-		err = -EINVAL;
-		goto out_unmap;
-	}
-
 	for (i = 0; i < obj->base.size / sizeof(u32); i++) {
 		u32 __user *ux = u64_to_user_ptr((u64)(addr + i * sizeof(*ux)));
 		u32 x;
@@ -961,7 +955,7 @@ static int igt_mmap(void *arg)
 			struct drm_i915_gem_object *obj;
 			int err;
 
-			obj = i915_gem_object_create_region(mr, sizes[i], 0);
+			obj = i915_gem_object_create_region(mr, sizes[i], I915_BO_ALLOC_USER);
 			if (obj == ERR_PTR(-ENODEV))
 				continue;
 
@@ -1004,12 +998,12 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 			     struct drm_i915_gem_object *obj,
 			     enum i915_mmap_type type)
 {
-	struct i915_mmap_offset *mmo;
 	unsigned long __user *ptr;
 	unsigned long A, B;
 	unsigned long x, y;
 	unsigned long addr;
 	int err;
+	u64 offset;
 
 	memset(&A, 0xAA, sizeof(A));
 	memset(&B, 0xBB, sizeof(B));
@@ -1017,11 +1011,11 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 	if (!can_mmap(obj, type) || !can_access(obj))
 		return 0;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
-	if (IS_ERR(mmo))
-		return PTR_ERR(mmo);
+	err = __assign_mmap_offset(obj, type, &offset, NULL);
+	if (err)
+		return err;
 
-	addr = igt_mmap_node(i915, &mmo->vma_node, 0, PROT_WRITE, MAP_SHARED);
+	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 	ptr = (unsigned long __user *)addr;
@@ -1081,7 +1075,7 @@ static int igt_mmap_access(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
@@ -1111,11 +1105,11 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 			  enum i915_mmap_type type)
 {
 	struct intel_engine_cs *engine;
-	struct i915_mmap_offset *mmo;
 	unsigned long addr;
 	u32 __user *ux;
 	u32 bbe;
 	int err;
+	u64 offset;
 
 	/*
 	 * Verify that the mmap access into the backing store aligns with
@@ -1132,11 +1126,11 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
-	if (IS_ERR(mmo))
-		return PTR_ERR(mmo);
+	err = __assign_mmap_offset(obj, type, &offset, NULL);
+	if (err)
+		return err;
 
-	addr = igt_mmap_node(i915, &mmo->vma_node, 0, PROT_WRITE, MAP_SHARED);
+	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -1226,7 +1220,7 @@ static int igt_mmap_gpu(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
@@ -1303,18 +1297,18 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 			     struct drm_i915_gem_object *obj,
 			     enum i915_mmap_type type)
 {
-	struct i915_mmap_offset *mmo;
 	unsigned long addr;
 	int err;
+	u64 offset;
 
 	if (!can_mmap(obj, type))
 		return 0;
 
-	mmo = mmap_offset_attach(obj, type, NULL);
-	if (IS_ERR(mmo))
-		return PTR_ERR(mmo);
+	err = __assign_mmap_offset(obj, type, &offset, NULL);
+	if (err)
+		return err;
 
-	addr = igt_mmap_node(i915, &mmo->vma_node, 0, PROT_WRITE, MAP_SHARED);
+	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -1350,10 +1344,20 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 		}
 	}
 
-	err = check_absent(addr, obj->base.size);
-	if (err) {
-		pr_err("%s: was not absent\n", obj->mm.region->name);
-		goto out_unmap;
+	if (!obj->ops->mmap_ops) {
+		err = check_absent(addr, obj->base.size);
+		if (err) {
+			pr_err("%s: was not absent\n", obj->mm.region->name);
+			goto out_unmap;
+		}
+	} else {
+		/* ttm allows access to evicted regions by design */
+
+		err = check_present(addr, obj->base.size);
+		if (err) {
+			pr_err("%s: was not present\n", obj->mm.region->name);
+			goto out_unmap;
+		}
 	}
 
 out_unmap:
@@ -1371,7 +1375,7 @@ static int igt_mmap_revoke(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
-		obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0);
+		obj = i915_gem_object_create_region(mr, PAGE_SIZE, I915_BO_ALLOC_USER);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_mmap.c b/drivers/gpu/drm/i915/selftests/igt_mmap.c
index 583a4ff8b8c9..e920a461bd36 100644
--- a/drivers/gpu/drm/i915/selftests/igt_mmap.c
+++ b/drivers/gpu/drm/i915/selftests/igt_mmap.c
@@ -9,15 +9,28 @@
 #include "i915_drv.h"
 #include "igt_mmap.h"
 
-unsigned long igt_mmap_node(struct drm_i915_private *i915,
-			    struct drm_vma_offset_node *node,
-			    unsigned long addr,
-			    unsigned long prot,
-			    unsigned long flags)
+unsigned long igt_mmap_offset(struct drm_i915_private *i915,
+			      u64 offset,
+			      unsigned long size,
+			      unsigned long prot,
+			      unsigned long flags)
 {
+	struct drm_vma_offset_node *node;
 	struct file *file;
+	unsigned long addr;
 	int err;
 
+	/* no need to refcount, we own this object */
+	drm_vma_offset_lock_lookup(i915->drm.vma_offset_manager);
+	node = drm_vma_offset_exact_lookup_locked(i915->drm.vma_offset_manager,
+						  offset / PAGE_SIZE, size / PAGE_SIZE);
+	drm_vma_offset_unlock_lookup(i915->drm.vma_offset_manager);
+
+	if (GEM_WARN_ON(!node)) {
+		pr_info("Failed to lookup %llx\n", offset);
+		return -ENOENT;
+	}
+
 	/* Pretend to open("/dev/dri/card0") */
 	file = mock_drm_getfile(i915->drm.primary, O_RDWR);
 	if (IS_ERR(file))
@@ -29,7 +42,7 @@ unsigned long igt_mmap_node(struct drm_i915_private *i915,
 		goto out_file;
 	}
 
-	addr = vm_mmap(file, addr, drm_vma_node_size(node) << PAGE_SHIFT,
+	addr = vm_mmap(file, 0, drm_vma_node_size(node) << PAGE_SHIFT,
 		       prot, flags, drm_vma_node_offset_addr(node));
 
 	drm_vma_node_revoke(node, file->private_data);
diff --git a/drivers/gpu/drm/i915/selftests/igt_mmap.h b/drivers/gpu/drm/i915/selftests/igt_mmap.h
index 6e716cb59d7e..acbe34d81a6d 100644
--- a/drivers/gpu/drm/i915/selftests/igt_mmap.h
+++ b/drivers/gpu/drm/i915/selftests/igt_mmap.h
@@ -7,13 +7,15 @@
 #ifndef IGT_MMAP_H
 #define IGT_MMAP_H
 
+#include <linux/types.h>
+
 struct drm_i915_private;
 struct drm_vma_offset_node;
 
-unsigned long igt_mmap_node(struct drm_i915_private *i915,
-			    struct drm_vma_offset_node *node,
-			    unsigned long addr,
-			    unsigned long prot,
-			    unsigned long flags);
+unsigned long igt_mmap_offset(struct drm_i915_private *i915,
+			      u64 offset,
+			      unsigned long size,
+			      unsigned long prot,
+			      unsigned long flags);
 
 #endif /* IGT_MMAP_H */
-- 
2.31.1

