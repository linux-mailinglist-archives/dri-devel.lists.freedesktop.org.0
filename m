Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7856CB56
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 22:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617F511B6A1;
	Sat,  9 Jul 2022 20:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD611B6A1;
 Sat,  9 Jul 2022 20:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657397699; x=1688933699;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VToTppwIpoZI/e1Z3YFEZ0oGuichoPhjZrr3o8QMp3k=;
 b=W7XMaCYXN+ADqNV+mAhx4KLdWJmcjgL2wucvmK1DsZXLxlbruSYgyVyD
 c0raRR1Ie1JucmXG+BM6ckKqfSr/lj6zmgR7zre/G2HdFcopcI7t6fFeB
 P2JCvps4cYmospwc6Sbusb1VHvQXKr/xNGvHbF7IMK+nyYyKmNZy9bRw3
 F2d7VrmdrnmU8J0a5ZBUrVu5OmDL6cV2jxRTcn1UN8nsNCxY5CmOqOXU3
 2K0Xc5mEol1X/L4v3pnhBIFEjVcbkXYjcIYsaOWpJzwiNu/KhSSuG4oGc
 u81mXCyzHN1Vh/jV7MBiU5J5NM3GjfD/hmpQzii5umYlO3LJ+JpbVdka+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285585094"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="285585094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:14:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="651954750"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:14:58 -0700
Date: Sat, 9 Jul 2022 13:14:39 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Message-ID: <20220709201439.GB14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
 <13a5c5ba-8860-512e-5e92-3f30beca2dc3@amd.com>
 <20220708132307.GV14039@nvishwa1-DESK>
 <0fe0fc02-1aed-242a-97be-8ec494a6f97b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fe0fc02-1aed-242a-97be-8ec494a6f97b@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 intel-gfx@lists.freedesktop.org, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 jason@jlekstrand.net, daniel.vetter@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 07:32:54PM +0200, Christian König wrote:
>Am 08.07.22 um 15:23 schrieb Niranjana Vishwanathapura:
>>On Thu, Jul 07, 2022 at 03:27:43PM +0200, Christian König wrote:
>>>Am 02.07.22 um 00:50 schrieb Niranjana Vishwanathapura:
>>>>Add uapi allowing user to specify a BO as private to a specified VM
>>>>during the BO creation.
>>>>VM private BOs can only be mapped on the specified VM and can't be
>>>>dma_buf exported. VM private BOs share a single common dma_resv object,
>>>>hence has a performance advantage requiring a single dma_resv object
>>>>update in the execbuf path compared to non-private (shared) BOs.
>>>
>>>Sounds like you picked up the per VM BO idea from amdgpu here :)
>>>
>>>Of hand looks like a good idea, but shouldn't we add a few 
>>>comments in the common documentation about that?
>>>
>>>E.g. something like "Multiple buffer objects sometimes share the 
>>>same dma_resv object....." to the dma_resv documentation.
>>>
>>>Probably best as a separate patch after this here has landed.
>>
>>:)
>>Sounds good. Probably we need to update documentation of
>>drm_gem_object.resv and drm_gem_object._resv here, right?
>
>Yes, I would also add a word or two to the dma_resv object. Something 
>like "Multiple buffers are sometimes using a single dma_resv 
>object..."
>

Ok, sounds good.

Niranjana

>Christian.
>
>>
>>Doing it in a separate patch after this series lands sounds good to me.
>>
>>Thanks,
>>Niranjana
>>
>>>
>>>Regards,
>>>Christian.
>>>
>>>>
>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>><niranjana.vishwanathapura@intel.com>
>>>>---
>>>> drivers/gpu/drm/i915/gem/i915_gem_create.c    | 41 ++++++++++++++++++-
>>>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
>>>> .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
>>>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
>>>> drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   | 11 +++++
>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
>>>> drivers/gpu/drm/i915/gt/intel_gtt.c           |  4 ++
>>>> drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>>>> drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>>> drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>>>> include/uapi/drm/i915_drm.h                   | 30 ++++++++++++++
>>>> 11 files changed, 110 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>index 927a87e5ec59..7e264566b51f 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>@@ -11,6 +11,7 @@
>>>> #include "pxp/intel_pxp.h"
>>>> #include "i915_drv.h"
>>>>+#include "i915_gem_context.h"
>>>> #include "i915_gem_create.h"
>>>> #include "i915_trace.h"
>>>> #include "i915_user_extensions.h"
>>>>@@ -243,6 +244,7 @@ struct create_ext {
>>>>     unsigned int n_placements;
>>>>     unsigned int placement_mask;
>>>>     unsigned long flags;
>>>>+    u32 vm_id;
>>>> };
>>>> static void repr_placements(char *buf, size_t size,
>>>>@@ -392,9 +394,24 @@ static int ext_set_protected(struct 
>>>>i915_user_extension __user *base, void *data
>>>>     return 0;
>>>> }
>>>>+static int ext_set_vm_private(struct i915_user_extension __user *base,
>>>>+                  void *data)
>>>>+{
>>>>+    struct drm_i915_gem_create_ext_vm_private ext;
>>>>+    struct create_ext *ext_data = data;
>>>>+
>>>>+    if (copy_from_user(&ext, base, sizeof(ext)))
>>>>+        return -EFAULT;
>>>>+
>>>>+    ext_data->vm_id = ext.vm_id;
>>>>+
>>>>+    return 0;
>>>>+}
>>>>+
>>>> static const i915_user_extension_fn create_extensions[] = {
>>>>     [I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>>>>     [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
>>>>+    [I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
>>>> };
>>>> /**
>>>>@@ -410,6 +427,7 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>>*dev, void *data,
>>>>     struct drm_i915_private *i915 = to_i915(dev);
>>>>     struct drm_i915_gem_create_ext *args = data;
>>>>     struct create_ext ext_data = { .i915 = i915 };
>>>>+    struct i915_address_space *vm = NULL;
>>>>     struct drm_i915_gem_object *obj;
>>>>     int ret;
>>>>@@ -423,6 +441,12 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>>*dev, void *data,
>>>>     if (ret)
>>>>         return ret;
>>>>+    if (ext_data.vm_id) {
>>>>+        vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
>>>>+        if (unlikely(!vm))
>>>>+            return -ENOENT;
>>>>+    }
>>>>+
>>>>     if (!ext_data.n_placements) {
>>>>         ext_data.placements[0] =
>>>>             intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
>>>>@@ -449,8 +473,21 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>>*dev, void *data,
>>>>                         ext_data.placements,
>>>>                         ext_data.n_placements,
>>>>                         ext_data.flags);
>>>>-    if (IS_ERR(obj))
>>>>-        return PTR_ERR(obj);
>>>>+    if (IS_ERR(obj)) {
>>>>+        ret = PTR_ERR(obj);
>>>>+        goto vm_put;
>>>>+    }
>>>>+
>>>>+    if (vm) {
>>>>+        obj->base.resv = vm->root_obj->base.resv;
>>>>+        obj->priv_root = i915_gem_object_get(vm->root_obj);
>>>>+        i915_vm_put(vm);
>>>>+    }
>>>>     return i915_gem_publish(obj, file, &args->size, &args->handle);
>>>>+vm_put:
>>>>+    if (vm)
>>>>+        i915_vm_put(vm);
>>>>+
>>>>+    return ret;
>>>> }
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>index f5062d0c6333..6433173c3e84 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>@@ -218,6 +218,12 @@ struct dma_buf 
>>>>*i915_gem_prime_export(struct drm_gem_object *gem_obj, int 
>>>>flags)
>>>>     struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>>>>     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>>>+    if (obj->priv_root) {
>>>>+        drm_dbg(obj->base.dev,
>>>>+            "Exporting VM private objects is not allowed\n");
>>>>+        return ERR_PTR(-EINVAL);
>>>>+    }
>>>>+
>>>>     exp_info.ops = &i915_dmabuf_ops;
>>>>     exp_info.size = gem_obj->size;
>>>>     exp_info.flags = flags;
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>index 5cf36a130061..9fe3395ad4d9 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>@@ -241,6 +241,9 @@ struct drm_i915_gem_object {
>>>>     const struct drm_i915_gem_object_ops *ops;
>>>>+    /* Shared root is object private to a VM; NULL otherwise */
>>>>+    struct drm_i915_gem_object *priv_root;
>>>>+
>>>>     struct {
>>>>         /**
>>>>          * @vma.lock: protect the list/tree of vmas
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>index 7e1f8b83077f..f1912b12db00 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>@@ -1152,6 +1152,9 @@ void i915_ttm_bo_destroy(struct 
>>>>ttm_buffer_object *bo)
>>>>     i915_gem_object_release_memory_region(obj);
>>>>     mutex_destroy(&obj->ttm.get_io_page.lock);
>>>>+    if (obj->priv_root)
>>>>+        i915_gem_object_put(obj->priv_root);
>>>>+
>>>>     if (obj->ttm.created) {
>>>>         /*
>>>>          * We freely manage the shrinker LRU outide of the 
>>>>mm.pages life
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>>>index 642cdb559f17..ee6e4c52e80e 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>>>@@ -26,6 +26,17 @@ static inline void 
>>>>i915_gem_vm_bind_unlock(struct i915_address_space *vm)
>>>>     mutex_unlock(&vm->vm_bind_lock);
>>>> }
>>>>+static inline int i915_gem_vm_priv_lock(struct i915_address_space *vm,
>>>>+                    struct i915_gem_ww_ctx *ww)
>>>>+{
>>>>+    return i915_gem_object_lock(vm->root_obj, ww);
>>>>+}
>>>>+
>>>>+static inline void i915_gem_vm_priv_unlock(struct 
>>>>i915_address_space *vm)
>>>>+{
>>>>+    i915_gem_object_unlock(vm->root_obj);
>>>>+}
>>>>+
>>>> struct i915_vma *
>>>> i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>>>> void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>index 43ceb4dcca6c..3201204c8e74 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>@@ -85,6 +85,7 @@ void i915_gem_vm_bind_remove(struct i915_vma 
>>>>*vma, bool release_obj)
>>>>     if (!list_empty(&vma->vm_bind_link)) {
>>>>         list_del_init(&vma->vm_bind_link);
>>>>+        list_del_init(&vma->non_priv_vm_bind_link);
>>>>         i915_vm_bind_it_remove(vma, &vma->vm->va);
>>>>         /* Release object */
>>>>@@ -185,6 +186,11 @@ int i915_gem_vm_bind_obj(struct 
>>>>i915_address_space *vm,
>>>>         goto put_obj;
>>>>     }
>>>>+    if (obj->priv_root && obj->priv_root != vm->root_obj) {
>>>>+        ret = -EINVAL;
>>>>+        goto put_obj;
>>>>+    }
>>>>+
>>>>     ret = i915_gem_vm_bind_lock_interruptible(vm);
>>>>     if (ret)
>>>>         goto put_obj;
>>>>@@ -211,6 +217,9 @@ int i915_gem_vm_bind_obj(struct 
>>>>i915_address_space *vm,
>>>>     list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>>     i915_vm_bind_it_insert(vma, &vm->va);
>>>>+    if (!obj->priv_root)
>>>>+        list_add_tail(&vma->non_priv_vm_bind_link,
>>>>+                  &vm->non_priv_vm_bind_list);
>>>>     /* Hold object reference until vm_unbind */
>>>>     i915_gem_object_get(vma->obj);
>>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>>>b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>index 135dc4a76724..df0a8459c3c6 100644
>>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>@@ -176,6 +176,7 @@ int i915_vm_lock_objects(struct 
>>>>i915_address_space *vm,
>>>> void i915_address_space_fini(struct i915_address_space *vm)
>>>> {
>>>>     drm_mm_takedown(&vm->mm);
>>>>+    i915_gem_object_put(vm->root_obj);
>>>>     GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>>>>     mutex_destroy(&vm->vm_bind_lock);
>>>> }
>>>>@@ -289,6 +290,9 @@ void i915_address_space_init(struct 
>>>>i915_address_space *vm, int subclass)
>>>>     INIT_LIST_HEAD(&vm->vm_bind_list);
>>>>     INIT_LIST_HEAD(&vm->vm_bound_list);
>>>>     mutex_init(&vm->vm_bind_lock);
>>>>+    INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>>>>+    vm->root_obj = i915_gem_object_create_internal(vm->i915, 
>>>>PAGE_SIZE);
>>>>+    GEM_BUG_ON(IS_ERR(vm->root_obj));
>>>> }
>>>> void *__px_vaddr(struct drm_i915_gem_object *p)
>>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>>>>b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>index d4a6ce65251d..f538ce9115c9 100644
>>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>@@ -267,6 +267,8 @@ struct i915_address_space {
>>>>     struct list_head vm_bound_list;
>>>>     /* va tree of persistent vmas */
>>>>     struct rb_root_cached va;
>>>>+    struct list_head non_priv_vm_bind_list;
>>>>+    struct drm_i915_gem_object *root_obj;
>>>>     /* Global GTT */
>>>>     bool is_ggtt:1;
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>index d324e29cef0a..f0226581d342 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>@@ -236,6 +236,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>     mutex_unlock(&vm->mutex);
>>>>     INIT_LIST_HEAD(&vma->vm_bind_link);
>>>>+    INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>>>     return vma;
>>>> err_unlock:
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>>>>b/drivers/gpu/drm/i915/i915_vma_types.h
>>>>index b6d179bdbfa0..2298b3d6b7c4 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>>>@@ -290,6 +290,8 @@ struct i915_vma {
>>>>     struct list_head vm_link;
>>>>     struct list_head vm_bind_link; /* Link in persistent VMA list */
>>>>+    /* Link in non-private persistent VMA list */
>>>>+    struct list_head non_priv_vm_bind_link;
>>>>     /** Interval tree structures for persistent vma */
>>>>     struct rb_node rb;
>>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>index 26cca49717f8..ce1c6592b0d7 100644
>>>>--- a/include/uapi/drm/i915_drm.h
>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>@@ -3542,9 +3542,13 @@ struct drm_i915_gem_create_ext {
>>>>      *
>>>>      * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>>      * struct drm_i915_gem_create_ext_protected_content.
>>>>+     *
>>>>+     * For I915_GEM_CREATE_EXT_VM_PRIVATE usage see
>>>>+     * struct drm_i915_gem_create_ext_vm_private.
>>>>      */
>>>> #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>> #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>>>+#define I915_GEM_CREATE_EXT_VM_PRIVATE 2
>>>>     __u64 extensions;
>>>> };
>>>>@@ -3662,6 +3666,32 @@ struct 
>>>>drm_i915_gem_create_ext_protected_content {
>>>> /* ID of the protected content session managed by i915 when PXP 
>>>>is active */
>>>> #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>>>+/**
>>>>+ * struct drm_i915_gem_create_ext_vm_private - Extension to 
>>>>make the object
>>>>+ * private to the specified VM.
>>>>+ *
>>>>+ * See struct drm_i915_gem_create_ext.
>>>>+ *
>>>>+ * By default, BOs can be mapped on multiple VMs and can also 
>>>>be dma-buf
>>>>+ * exported. Hence these BOs are referred to as Shared BOs.
>>>>+ * During each execbuf3 submission, the request fence must be 
>>>>added to the
>>>>+ * dma-resv fence list of all shared BOs mapped on the VM.
>>>>+ *
>>>>+ * Unlike Shared BOs, these VM private BOs can only be mapped 
>>>>on the VM they
>>>>+ * are private to and can't be dma-buf exported. All private 
>>>>BOs of a VM share
>>>>+ * the dma-resv object. Hence during each execbuf3 submission, 
>>>>they need only
>>>>+ * one dma-resv fence list updated. Thus, the fast path (where 
>>>>required
>>>>+ * mappings are already bound) submission latency is O(1) w.r.t 
>>>>the number of
>>>>+ * VM private BOs.
>>>>+ */
>>>>+struct drm_i915_gem_create_ext_vm_private {
>>>>+    /** @base: Extension link. See struct i915_user_extension. */
>>>>+    struct i915_user_extension base;
>>>>+
>>>>+    /** @vm_id: Id of the VM to which the object is private */
>>>>+    __u32 vm_id;
>>>>+};
>>>>+
>>>> /**
>>>>  * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>>>  *
>>>
>
