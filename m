Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156D5F287D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5310E238;
	Mon,  3 Oct 2022 06:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FD710E166;
 Mon,  3 Oct 2022 06:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664777598; x=1696313598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gvjiDFsiT/arl2i2fbEJ8UI3B0ZAkxJBMVeG5Y6gXCk=;
 b=HeCLZ51mKNgY3qtQk/LZqlx0toEQ2TVBJdujHuVnbMB0JNUMe4OUQ0jH
 8C0C45YjRLcxnYzf5BvCfF1KRvTC4Z5oMzpFt/RgahLqSPWpE/6mzALIN
 zu/IKOISOk3xXOxX8eH/i1dXSMc9AvEBH0EeWIFGHzFiH9jcQQlAASY92
 OsixbB0IiGKNTNl6+42h/NULifJRg8bEQ7VCrsfrO6+UvBwvAhUd7fGM2
 SHpeo6FVhqQaaWfKBuFuliAHVjczLsU4O2uCtgD89VQKTN/JI4N1u1eaX
 KLdM9hquQfNgRgadH/cvZgLTdgyt5YoaVO8XQFaPvCrDLzshHDvnr93Ko Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="300159065"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="300159065"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2022 23:13:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574516817"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="574516817"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2022 23:13:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/17] drm/i915/vm_bind: Support for VM private BOs
Date: Sun,  2 Oct 2022 23:12:34 -0700
Message-Id: <20221003061245.12716-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
References: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each VM creates a root_obj and shares it with all of its private objects
to use it as dma_resv object. This has a performance advantage as it
requires a single dma_resv object update for all private BOs vs list of
dma_resv objects update for shared BOs, in the execbuf path.

VM private BOs can be only mapped on specified VM and cannot be dmabuf
exported. Also, they are supported only in vm_bind mode.

v2: Pad struct drm_i915_gem_create_ext_vm_private for 64bit alignment,
    add input validity checks.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 49 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  4 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
 drivers/gpu/drm/i915/i915_vma.c               |  1 +
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
 include/uapi/drm/i915_drm.h                   | 33 +++++++++++++
 12 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 5c6e396ab74d..694d4638ac8b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -11,6 +11,7 @@
 #include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
+#include "i915_gem_context.h"
 #include "i915_gem_create.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
@@ -251,6 +252,7 @@ struct create_ext {
 	unsigned int n_placements;
 	unsigned int placement_mask;
 	unsigned long flags;
+	u32 vm_id;
 };
 
 static void repr_placements(char *buf, size_t size,
@@ -400,9 +402,32 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
 	return 0;
 }
 
+static int ext_set_vm_private(struct i915_user_extension __user *base,
+			      void *data)
+{
+	struct drm_i915_gem_create_ext_vm_private ext;
+	struct create_ext *ext_data = data;
+
+	if (copy_from_user(&ext, base, sizeof(ext)))
+		return -EFAULT;
+
+	/* Reserved fields must be 0 */
+	if (ext.rsvd)
+		return -EINVAL;
+
+	/* vm_id 0 is reserved */
+	if (!ext.vm_id)
+		return -ENOENT;
+
+	ext_data->vm_id = ext.vm_id;
+
+	return 0;
+}
+
 static const i915_user_extension_fn create_extensions[] = {
 	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
 	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
+	[I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
 };
 
 /**
@@ -418,6 +443,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_create_ext *args = data;
 	struct create_ext ext_data = { .i915 = i915 };
+	struct i915_address_space *vm = NULL;
 	struct drm_i915_gem_object *obj;
 	int ret;
 
@@ -431,6 +457,12 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		return ret;
 
+	if (ext_data.vm_id) {
+		vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
+		if (unlikely(!vm))
+			return -ENOENT;
+	}
+
 	if (!ext_data.n_placements) {
 		ext_data.placements[0] =
 			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
@@ -457,8 +489,21 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 						ext_data.placements,
 						ext_data.n_placements,
 						ext_data.flags);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto vm_put;
+	}
+
+	if (vm) {
+		obj->base.resv = vm->root_obj->base.resv;
+		obj->priv_root = i915_gem_object_get(vm->root_obj);
+		i915_vm_put(vm);
+	}
 
 	return i915_gem_publish(obj, file, &args->size, &args->handle);
+vm_put:
+	if (vm)
+		i915_vm_put(vm);
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f5062d0c6333..6433173c3e84 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
+	if (obj->priv_root) {
+		drm_dbg(obj->base.dev,
+			"Exporting VM private objects is not allowed\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	exp_info.ops = &i915_dmabuf_ops;
 	exp_info.size = gem_obj->size;
 	exp_info.flags = flags;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9fb9f6faafd8..4673e0812277 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -864,6 +864,10 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 		if (unlikely(!obj))
 			return ERR_PTR(-ENOENT);
 
+		/* VM private objects are not supported here */
+		if (obj->priv_root)
+			return ERR_PTR(-EINVAL);
+
 		/*
 		 * If the user has opted-in for protected-object tracking, make
 		 * sure the object encryption can be used.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 7ff9c7877bec..271ad62b3245 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -108,6 +108,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
  */
 void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 {
+	if (obj->priv_root && !obj->ttm.created)
+		i915_gem_object_put(obj->priv_root);
+
 	mutex_destroy(&obj->mm.get_page.lock);
 	mutex_destroy(&obj->mm.get_dma_page.lock);
 	dma_resv_fini(&obj->base._resv);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 40305e2bcd49..2e79cfc0b06a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -241,6 +241,9 @@ struct drm_i915_gem_object {
 
 	const struct drm_i915_gem_object_ops *ops;
 
+	/* For VM private BO, points to root_obj in VM. NULL otherwise */
+	struct drm_i915_gem_object *priv_root;
+
 	struct {
 		/**
 		 * @vma.lock: protect the list/tree of vmas
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 3dc6acfcf4ec..6daa0c76b3b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1154,6 +1154,9 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	mutex_destroy(&obj->ttm.get_io_page.lock);
 
 	if (obj->ttm.created) {
+		if (obj->priv_root)
+			i915_gem_object_put(obj->priv_root);
+
 		/*
 		 * We freely manage the shrinker LRU outide of the mm.pages life
 		 * cycle. As a result when destroying the object we should be
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 88314e3a99d1..1ade9a5847fa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -86,6 +86,7 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 	lockdep_assert_held(&vma->vm->vm_bind_lock);
 
 	list_del_init(&vma->vm_bind_link);
+	list_del_init(&vma->non_priv_vm_bind_link);
 	i915_vm_bind_it_remove(vma, &vma->vm->va);
 
 	/* Release object */
@@ -215,6 +216,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 	if (ret)
 		goto put_obj;
 
+	if (obj->priv_root && obj->priv_root != vm->root_obj) {
+		ret = -EINVAL;
+		goto put_obj;
+	}
+
 	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
 	if (ret)
 		goto put_obj;
@@ -245,6 +251,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		 */
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bind_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
+		if (!obj->priv_root)
+			list_add_tail(&vma->non_priv_vm_bind_link,
+				      &vm->non_priv_vm_bind_list);
 
 		/* Hold object reference until vm_unbind */
 		i915_gem_object_get(vma->obj);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 339f2f8f1e46..65276da137b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -177,6 +177,7 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
 void i915_address_space_fini(struct i915_address_space *vm)
 {
 	drm_mm_takedown(&vm->mm);
+	i915_gem_object_put(vm->root_obj);
 	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
 	mutex_destroy(&vm->vm_bind_lock);
 }
@@ -292,6 +293,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->vm_bind_list);
 	INIT_LIST_HEAD(&vm->vm_bound_list);
 	mutex_init(&vm->vm_bind_lock);
+	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
+	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
+	GEM_BUG_ON(IS_ERR(vm->root_obj));
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index ba2542eed59f..4ae5734f7d6b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -267,6 +267,8 @@ struct i915_address_space {
 	struct list_head vm_bound_list;
 	/* @va: tree of persistent vmas */
 	struct rb_root_cached va;
+	struct list_head non_priv_vm_bind_list;
+	struct drm_i915_gem_object *root_obj;
 
 	/**
 	 * @vm_bind_mode: flag to indicate vm_bind method of binding
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 90becd78d621..5d3d67a4bf47 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -240,6 +240,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	mutex_unlock(&vm->mutex);
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
+	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index db786d2d1530..b8176cca58c0 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -297,6 +297,8 @@ struct i915_vma {
 
 	/** @vm_bind_link: node for the vm_bind related lists of vm */
 	struct list_head vm_bind_link;
+	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
+	struct list_head non_priv_vm_bind_link;
 
 	/** Interval tree structures for persistent vma */
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 1c9f014b0875..7903b94127b7 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3601,9 +3601,13 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
 	 * struct drm_i915_gem_create_ext_protected_content.
+	 *
+	 * For I915_GEM_CREATE_EXT_VM_PRIVATE usage see
+	 * struct drm_i915_gem_create_ext_vm_private.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
 #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
+#define I915_GEM_CREATE_EXT_VM_PRIVATE 2
 	__u64 extensions;
 };
 
@@ -3721,6 +3725,35 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/**
+ * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
+ * private to the specified VM.
+ *
+ * See struct drm_i915_gem_create_ext.
+ *
+ * By default, BOs can be mapped on multiple VMs and can also be dma-buf
+ * exported. Hence these BOs are referred to as Shared BOs.
+ * During each execbuf3 submission, the request fence must be added to the
+ * dma-resv fence list of all shared BOs mapped on the VM.
+ *
+ * Unlike Shared BOs, these VM private BOs can only be mapped on the VM they
+ * are private to and can't be dma-buf exported. All private BOs of a VM share
+ * the dma-resv object. Hence during each execbuf3 submission, they need only
+ * one dma-resv fence list updated. Thus, the fast path (where required
+ * mappings are already bound) submission latency is O(1) w.r.t the number of
+ * VM private BOs.
+ */
+struct drm_i915_gem_create_ext_vm_private {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @vm_id: Id of the VM to which Object is private */
+	__u32 vm_id;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+};
+
 /**
  * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
  *
-- 
2.21.0.rc0.32.g243a4c7e27

