Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EB61ED92
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF6810E277;
	Mon,  7 Nov 2022 08:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966A010E259;
 Mon,  7 Nov 2022 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811146; x=1699347146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tIsEl8tbPN4o3qrIEGGqkd3ZShd04l4xcKvvPs/qKQE=;
 b=LlrZ3WhRW7zmjjfWnlk7uGQiiYplw8Hg3JQ93BlvzsS+eFDEDTJEq29/
 UM89gDELXnCyimRsVwGRIZ+Dk9JgbA6cZvEb7YXraKNBCRSVySv3jyU5l
 SPU/4duzV6hgIasLY5Sj8La5UAYAtLsqjW4SZNKrtpAT5acE2GIat1SsK
 FWRGO05BZIUMSW3Ckn8YGsABmMTdSukAg5sEJm+HGlEN4YtY8UeCa1er7
 pBcapOkvcOgLtLyrcQgsTXizMSNGoWRmRHyj/xZO6KwY+pqabKgpBPTVp
 xPN0f2NUK0YSC7mJ7Q/Z1+emi2xg03lqZ1QwxMpaL04cbfeJi4Svd/djW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="312126171"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="312126171"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984625"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984625"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 06/20] drm/i915/vm_bind: Support for VM private BOs
Date: Mon,  7 Nov 2022 00:51:56 -0800
Message-Id: <20221107085210.17221-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
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
v3: Create root_obj only for ppgtt.
v4: Fix releasing of obj->priv_root. Do not create vm->root_obj yet.
    Allow vm private object creation only in vm_bind mode.
    Replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode().

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 54 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  6 +++
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++
 drivers/gpu/drm/i915/i915_vma.c               |  1 +
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
 include/uapi/drm/i915_drm.h                   | 33 ++++++++++++
 12 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 6bed0633f744..1630a52f387d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -83,6 +83,7 @@
 
 #include "i915_file_private.h"
 #include "i915_gem_context.h"
+#include "i915_gem_internal.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 5c6e396ab74d..62648341780b 100644
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
 
@@ -431,6 +457,17 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		return ret;
 
+	if (ext_data.vm_id) {
+		vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
+		if (unlikely(!vm))
+			return -ENOENT;
+
+		if (!i915_gem_vm_is_vm_bind_mode(vm)) {
+			ret = -EINVAL;
+			goto vm_put;
+		}
+	}
+
 	if (!ext_data.n_placements) {
 		ext_data.placements[0] =
 			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
@@ -457,8 +494,21 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
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
index ec6f7ae47783..a1c900a0c8ef 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -219,6 +219,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
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
index c5bc9f6e887f..43f29acfbec9 100644
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
index 733696057761..2abef7e5af81 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -111,6 +111,9 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 	mutex_destroy(&obj->mm.get_page.lock);
 	mutex_destroy(&obj->mm.get_dma_page.lock);
 	dma_resv_fini(&obj->base._resv);
+
+	if (obj->priv_root)
+		i915_gem_object_put(obj->priv_root);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index d0d6772e6f36..80a09d55b855 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -242,6 +242,12 @@ struct drm_i915_gem_object {
 
 	const struct drm_i915_gem_object_ops *ops;
 
+	/**
+	 * @priv_root: pointer to vm->root_obj if object is private,
+	 * NULL otherwise.
+	 */
+	struct drm_i915_gem_object *priv_root;
+
 	struct {
 		/**
 		 * @vma.lock: protect the list/tree of vmas
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 6f299806bee1..19f29fa76c19 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -87,6 +87,7 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 	lockdep_assert_held(&vma->vm->vm_bind_lock);
 
 	list_del_init(&vma->vm_bind_link);
+	list_del_init(&vma->non_priv_vm_bind_link);
 	i915_vm_bind_it_remove(vma, &vma->vm->va);
 
 	/* Release object */
@@ -216,6 +217,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
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
@@ -240,6 +246,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
+		if (!obj->priv_root)
+			list_add_tail(&vma->non_priv_vm_bind_link,
+				      &vm->non_priv_vm_bind_list);
 
 		/* Hold object reference until vm_unbind */
 		i915_gem_object_get(vma->obj);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 412368c67c46..74c3557e5bc4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -289,6 +289,7 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->vm_bind_list);
 	INIT_LIST_HEAD(&vm->vm_bound_list);
 	mutex_init(&vm->vm_bind_lock);
+	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 3a9bee1b9d03..3d0a452567e4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -268,6 +268,10 @@ struct i915_address_space {
 	struct list_head vm_bound_list;
 	/** @va: tree of persistent vmas */
 	struct rb_root_cached va;
+	/** @non_priv_vm_bind_list: list of non-private object mappings */
+	struct list_head non_priv_vm_bind_list;
+	/** @root_obj: root object for dma-resv sharing by private objects */
+	struct drm_i915_gem_object *root_obj;
 
 	/* Global GTT */
 	bool is_ggtt:1;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 6a64a130dbcd..0ffa24bc0954 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -240,6 +240,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	mutex_unlock(&vm->mutex);
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
+	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index db786d2d1530..9cd055738997 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -297,6 +297,8 @@ struct i915_vma {
 
 	/** @vm_bind_link: node for the vm_bind related lists of vm */
 	struct list_head vm_bind_link;
+	/** @non_priv_vm_bind_link: Link in non-private persistent VMA list */
+	struct list_head non_priv_vm_bind_link;
 
 	/** Interval tree structures for persistent vma */
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index f06a09f1db2d..d3d709035b0d 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3611,9 +3611,13 @@ struct drm_i915_gem_create_ext {
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
 
@@ -3731,6 +3735,35 @@ struct drm_i915_gem_create_ext_protected_content {
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

