Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435EB63BA90
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2381710E37E;
	Tue, 29 Nov 2022 07:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6FB10E371;
 Tue, 29 Nov 2022 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706806; x=1701242806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBc9mfQ893aukbh7JSppg95wl7/EUiSKKQR8rRAKupM=;
 b=gPRREr8R+v5Id/IDaSecU5p4euu4EnE154yLV1isFZechpptqGTDJDcm
 OwPlRveE6PdorRThPwFYXsxE7D09NDpGKU4mSr6mjI1SdqlZ0uLEEhS0H
 4n+Su8OUUXaHD7boq2XOnRaEgpcWXDwcQ8Ml9Usu9R7IrtDWS2xVZsvRv
 s1iwINd05pduIb2S9ER606bVS+Y9RRPVOSNOPP/20SLD8WmABkMvNkMiK
 atSbQzk+l9+LAn64g+xS0u1rlHP5QDf3Mwq0XQ1ZjIKFqZiGCA3Rjy8xx
 T9gUtzc41+pJnpOdIU8UV04T61Mdh/rxfUiT+DFdZiZ1lCHQxQD2KF/eX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418333"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525566"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525566"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:42 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 05/22] drm/i915/vm_bind: Implement bind and unbind of object
Date: Mon, 28 Nov 2022 23:26:18 -0800
Message-Id: <20221129072635.847-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add uapi and implement support for bind and unbind of an
object at the specified GPU virtual addresses.

The vm_bind mode is not supported in legacy execbuf2 ioctl.
It will be supported only in the newer execbuf3 ioctl.

v2: On older platforms ctx->vm is not set, check for it.
    In vm_bind call, add vma to vm_bind_list.
    Add more input validity checks.
    Update some documentation.
v3: In vm_bind call, add vma to vm_bound_list as user can
    request a fence and pass to execbuf3 as input fence.
    Remove short term pinning with PIN_VALIDATE flag.
v4: Replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode().
v5: Ensure all reserved fields are 0, use PIN_NOEVICT.
v6: Add reserved fields to drm_i915_gem_vm_bind.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  15 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  26 ++
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 330 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
 drivers/gpu/drm/i915/i915_driver.c            |   3 +
 drivers/gpu/drm/i915/i915_vma.c               |   1 +
 drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
 include/uapi/drm/i915_drm.h                   | 105 ++++++
 11 files changed, 519 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 01974b82d205..71d5eeeec992 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -168,6 +168,7 @@ gem-y += \
 	gem/i915_gem_ttm_move.o \
 	gem/i915_gem_ttm_pm.o \
 	gem/i915_gem_userptr.o \
+	gem/i915_gem_vm_bind_object.o \
 	gem/i915_gem_wait.o \
 	gem/i915_gemfs.o
 i915-y += \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 899fa8f1e0fe..e8b41aa8f8c4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -139,6 +139,21 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
 
+/**
+ * i915_gem_vm_is_vm_bind_mode() - Check if address space is in vm_bind mode
+ * @vm: the address space
+ *
+ * Returns:
+ * true: @vm is in vm_bind mode; allows only vm_bind method of binding.
+ * false: @vm is not in vm_bind mode; allows only legacy execbuff method
+ *        of binding.
+ */
+static inline bool i915_gem_vm_is_vm_bind_mode(struct i915_address_space *vm)
+{
+	/* No support to enable vm_bind mode yet */
+	return false;
+}
+
 struct i915_address_space *
 i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 29e9e8d5b6fe..6fdb7ce09afc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -782,6 +782,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	if (unlikely(IS_ERR(ctx)))
 		return PTR_ERR(ctx);
 
+	if (ctx->vm && i915_gem_vm_is_vm_bind_mode(ctx->vm)) {
+		i915_gem_context_put(ctx);
+		return -EOPNOTSUPP;
+	}
+
 	eb->gem_context = ctx;
 	if (i915_gem_context_has_full_ppgtt(ctx))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
new file mode 100644
index 000000000000..36262a6357b5
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __I915_GEM_VM_BIND_H
+#define __I915_GEM_VM_BIND_H
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_file;
+struct i915_address_space;
+struct i915_vma;
+
+struct i915_vma *
+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
+
+int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file);
+int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file);
+
+void i915_gem_vm_unbind_all(struct i915_address_space *vm);
+
+#endif /* __I915_GEM_VM_BIND_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
new file mode 100644
index 000000000000..5064aba9ab87
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <uapi/drm/i915_drm.h>
+
+#include <linux/interval_tree_generic.h>
+
+#include "gem/i915_gem_context.h"
+#include "gem/i915_gem_vm_bind.h"
+
+#include "gt/intel_gpu_commands.h"
+
+#define START(node) ((node)->start)
+#define LAST(node) ((node)->last)
+
+/* Not all defined functions are used, hence use __maybe_unused */
+INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
+		     START, LAST, __maybe_unused static inline, i915_vm_bind_it)
+
+#undef START
+#undef LAST
+
+/**
+ * DOC: VM_BIND/UNBIND ioctls
+ *
+ * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
+ * objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
+ * specified address space (VM). Multiple mappings can map to the same physical
+ * pages of an object (aliasing). These mappings (also referred to as persistent
+ * mappings) will be persistent across multiple GPU submissions (execbuf calls)
+ * issued by the UMD, without user having to provide a list of all required
+ * mappings during each submission (as required by older execbuf mode).
+ *
+ * The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence for
+ * signaling the completion of bind/unbind operation.
+ *
+ * VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
+ * User has to opt-in for VM_BIND mode of binding for an address space (VM)
+ * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_BIND/UNBIND operations can be
+ * done asynchronously, when valid out fence is specified.
+ *
+ * VM_BIND locking order is as below.
+ *
+ * 1) vm_bind_lock mutex will protect vm_bind lists. This lock is taken in
+ *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
+ *    mapping.
+ *
+ *    In future, when GPU page faults are supported, we can potentially use a
+ *    rwsem instead, so that multiple page fault handlers can take the read
+ *    side lock to lookup the mapping and hence can run in parallel.
+ *    The older execbuf mode of binding do not need this lock.
+ *
+ * 2) The object's dma-resv lock will protect i915_vma state and needs
+ *    to be held while binding/unbinding a vma in the async worker and while
+ *    updating dma-resv fence list of an object. Note that private BOs of a VM
+ *    will all share a dma-resv object.
+ *
+ * 3) Spinlock/s to protect some of the VM's lists like the list of
+ *    invalidated vmas (due to eviction and userptr invalidation) etc.
+ */
+
+/**
+ * i915_gem_vm_bind_lookup_vma() - lookup for persistent vma mapped at a
+ * specified address
+ * @vm: virtual address space to look for persistent vma
+ * @va: starting address where vma is mapped
+ *
+ * Retrieves the persistent vma mapped address @va from the @vm's vma tree.
+ *
+ * Returns vma pointer on success, NULL on failure.
+ */
+struct i915_vma *
+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
+{
+	lockdep_assert_held(&vm->vm_bind_lock);
+
+	return i915_vm_bind_it_iter_first(&vm->va, va, va);
+}
+
+static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
+{
+	lockdep_assert_held(&vma->vm->vm_bind_lock);
+
+	list_del_init(&vma->vm_bind_link);
+	i915_vm_bind_it_remove(vma, &vma->vm->va);
+
+	/* Release object */
+	if (release_obj)
+		i915_gem_object_put(vma->obj);
+}
+
+static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
+				  struct drm_i915_gem_vm_unbind *va)
+{
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	int ret;
+
+	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
+	if (ret)
+		return ret;
+
+	va->start = gen8_noncanonical_addr(va->start);
+	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
+
+	if (!vma)
+		ret = -ENOENT;
+	else if (vma->size != va->length)
+		ret = -EINVAL;
+
+	if (ret) {
+		mutex_unlock(&vm->vm_bind_lock);
+		return ret;
+	}
+
+	i915_gem_vm_bind_remove(vma, false);
+
+	mutex_unlock(&vm->vm_bind_lock);
+
+	/*
+	 * Destroy the vma and then release the object.
+	 * As persistent vma holds object reference, it can only be destroyed
+	 * either by vm_unbind ioctl or when VM is being released. As we are
+	 * holding VM reference here, it is safe accessing the vma here.
+	 */
+	obj = vma->obj;
+	i915_gem_object_lock(obj, NULL);
+	i915_vma_destroy(vma);
+	i915_gem_object_unlock(obj);
+
+	i915_gem_object_put(obj);
+
+	return 0;
+}
+
+/**
+ * i915_gem_vm_unbind_all() - unbind all persistent mappings from an
+ * address space
+ * @vm: Address spece to remove persistent mappings from
+ *
+ * Unbind all userspace requested vm_bind mappings from @vm.
+ */
+void i915_gem_vm_unbind_all(struct i915_address_space *vm)
+{
+	struct i915_vma *vma, *t;
+
+	mutex_lock(&vm->vm_bind_lock);
+	list_for_each_entry_safe(vma, t, &vm->vm_bind_list, vm_bind_link)
+		i915_gem_vm_bind_remove(vma, true);
+	list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link)
+		i915_gem_vm_bind_remove(vma, true);
+	mutex_unlock(&vm->vm_bind_lock);
+}
+
+static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
+					struct drm_i915_gem_object *obj,
+					struct drm_i915_gem_vm_bind *va)
+{
+	struct i915_gtt_view view;
+	struct i915_vma *vma;
+
+	va->start = gen8_noncanonical_addr(va->start);
+	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
+	if (vma)
+		return ERR_PTR(-EEXIST);
+
+	view.type = I915_GTT_VIEW_PARTIAL;
+	view.partial.offset = va->offset >> PAGE_SHIFT;
+	view.partial.size = va->length >> PAGE_SHIFT;
+	vma = i915_vma_create_persistent(obj, vm, &view);
+	if (IS_ERR(vma))
+		return vma;
+
+	vma->start = va->start;
+	vma->last = va->start + va->length - 1;
+
+	return vma;
+}
+
+static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
+				struct drm_i915_gem_vm_bind *va,
+				struct drm_file *file)
+{
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma = NULL;
+	struct i915_gem_ww_ctx ww;
+	u64 pin_flags;
+	int ret = 0;
+
+	if (!i915_gem_vm_is_vm_bind_mode(vm))
+		return -EOPNOTSUPP;
+
+	/* Ensure start and length fields are valid */
+	if (!va->length || !IS_ALIGNED(va->start, I915_GTT_PAGE_SIZE))
+		ret = -EINVAL;
+
+	obj = i915_gem_object_lookup(file, va->handle);
+	if (!obj)
+		return -ENOENT;
+
+	/* Ensure offset and length are aligned to object's max page size */
+	if (!IS_ALIGNED(va->offset | va->length,
+			i915_gem_object_max_page_size(obj->mm.placements,
+						      obj->mm.n_placements)))
+		ret = -EINVAL;
+
+	/* Check for mapping range overflow */
+	if (range_overflows_t(u64, va->offset, va->length, obj->base.size))
+		ret = -EINVAL;
+
+	if (ret)
+		goto put_obj;
+
+	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
+	if (ret)
+		goto put_obj;
+
+	vma = vm_bind_get_vma(vm, obj, va);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto unlock_vm;
+	}
+
+	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER |
+		    PIN_VALIDATE | PIN_NOEVICT;
+
+	for_i915_gem_ww(&ww, ret, true) {
+		ret = i915_gem_object_lock(vma->obj, &ww);
+		if (ret)
+			continue;
+
+		ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
+		if (ret)
+			continue;
+
+		/* Wait for bind to complete */
+		ret = i915_vma_wait_for_bind(vma);
+		if (ret)
+			continue;
+
+		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
+		i915_vm_bind_it_insert(vma, &vm->va);
+
+		/* Hold object reference until vm_unbind */
+		i915_gem_object_get(vma->obj);
+	}
+
+	if (ret)
+		i915_vma_destroy(vma);
+unlock_vm:
+	mutex_unlock(&vm->vm_bind_lock);
+put_obj:
+	i915_gem_object_put(obj);
+
+	return ret;
+}
+
+/**
+ * i915_gem_vm_bind_ioctl() - ioctl function for binding a section of object
+ * at a specified virtual address
+ * @dev: drm_device pointer
+ * @data: ioctl data structure
+ * @file: drm_file pointer
+ *
+ * Adds the specified persistent mapping (virtual address to a section of an
+ * object) and binds it in the device page table.
+ *
+ * Returns 0 on success, error code on failure.
+ */
+int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct drm_i915_gem_vm_bind *args = data;
+	struct i915_address_space *vm;
+	int ret;
+
+	/* Reserved fields must be 0 */
+	if ((args->flags & __I915_GEM_VM_BIND_UNKNOWN_FLAGS) ||
+	    args->rsvd[0] || args->rsvd[1] || args->extensions)
+		return -EINVAL;
+
+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
+	if (unlikely(!vm))
+		return -ENOENT;
+
+	ret = i915_gem_vm_bind_obj(vm, args, file);
+
+	i915_vm_put(vm);
+	return ret;
+}
+
+/**
+ * i915_gem_vm_unbind_ioctl() - ioctl function for unbinding a mapping at a
+ * specified virtual address
+ * @dev: drm_device pointer
+ * @data: ioctl data structure
+ * @file: drm_file pointer
+ *
+ * Removes the persistent mapping at the specified address and unbinds it
+ * from the device page table.
+ *
+ * Returns 0 on success, error code on failure. -ENOENT is returned if the
+ * specified mapping is not found.
+ */
+int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file)
+{
+	struct drm_i915_gem_vm_unbind *args = data;
+	struct i915_address_space *vm;
+	int ret;
+
+	/* Reserved fields must be 0 */
+	if ((args->flags & __I915_GEM_VM_UNBIND_UNKNOWN_FLAGS) ||
+	    args->pad || args->rsvd[0] || args->rsvd[1] || args->extensions)
+		return -EINVAL;
+
+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
+	if (unlikely(!vm))
+		return -ENOENT;
+
+	ret = i915_gem_vm_unbind_vma(vm, args);
+
+	i915_vm_put(vm);
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 2ba3983984b9..b938e235ae26 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -12,6 +12,7 @@
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
+#include "gem/i915_gem_vm_bind.h"
 #include "i915_reg.h"
 #include "i915_trace.h"
 #include "i915_utils.h"
@@ -178,6 +179,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
 void i915_address_space_fini(struct i915_address_space *vm)
 {
 	drm_mm_takedown(&vm->mm);
+	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
+	mutex_destroy(&vm->vm_bind_lock);
 }
 
 /**
@@ -204,6 +207,8 @@ static void __i915_vm_release(struct work_struct *work)
 	struct i915_address_space *vm =
 		container_of(work, struct i915_address_space, release_work);
 
+	i915_gem_vm_unbind_all(vm);
+
 	__i915_vm_close(vm);
 
 	/* Synchronize async unbinds. */
@@ -280,6 +285,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 
 	INIT_LIST_HEAD(&vm->bound_list);
 	INIT_LIST_HEAD(&vm->unbound_list);
+
+	vm->va = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&vm->vm_bind_list);
+	INIT_LIST_HEAD(&vm->vm_bound_list);
+	mutex_init(&vm->vm_bind_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index d1900fec6cd1..29a677c0baae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -260,6 +260,15 @@ struct i915_address_space {
 	 */
 	struct list_head unbound_list;
 
+	/** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_list */
+	struct mutex vm_bind_lock;
+	/** @vm_bind_list: List of vm_binding in process */
+	struct list_head vm_bind_list;
+	/** @vm_bound_list: List of vm_binding completed */
+	struct list_head vm_bound_list;
+	/** @va: tree of persistent vmas */
+	struct rb_root_cached va;
+
 	/* Global GTT */
 	bool is_ggtt:1;
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 4e1bb3c23c63..babd7a878efb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -69,6 +69,7 @@
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_pm.h"
+#include "gem/i915_gem_vm_bind.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
@@ -1892,6 +1893,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_VM_UNBIND, i915_gem_vm_unbind_ioctl, DRM_RENDER_ALLOW),
 };
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 9462a29764eb..e64330b6d70d 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -241,6 +241,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	spin_unlock(&obj->vma.lock);
 	mutex_unlock(&vm->mutex);
 
+	INIT_LIST_HEAD(&vma->vm_bind_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 3144d71a0c3e..db786d2d1530 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -295,6 +295,20 @@ struct i915_vma {
 	/** This object's place on the active/inactive lists */
 	struct list_head vm_link;
 
+	/** @vm_bind_link: node for the vm_bind related lists of vm */
+	struct list_head vm_bind_link;
+
+	/** Interval tree structures for persistent vma */
+
+	/** @rb: node for the interval tree of vm for persistent vmas */
+	struct rb_node rb;
+	/** @start: start endpoint of the rb node */
+	u64 start;
+	/** @last: Last endpoint of the rb node */
+	u64 last;
+	/** @__subtree_last: last in subtree */
+	u64 __subtree_last;
+
 	struct list_head obj_link; /* Link in the object's VMA list */
 	struct rb_node obj_node;
 	struct hlist_node obj_hash;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 8df261c5ab9b..6bb00ece001a 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -470,6 +470,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_GEM_VM_CREATE		0x3a
 #define DRM_I915_GEM_VM_DESTROY		0x3b
 #define DRM_I915_GEM_CREATE_EXT		0x3c
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -534,6 +536,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
 #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
+#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
 
 /* Allow drivers to submit batchbuffers directly to hardware, relying
  * on the security mechanisms provided by hardware.
@@ -3727,6 +3731,107 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/**
+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
+ *
+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
+ * virtual address (VA) range to the section of an object that should be bound
+ * in the device page table of the specified address space (VM).
+ * The VA range specified must be unique (ie., not currently bound) and can
+ * be mapped to whole object or a section of the object (partial binding).
+ * Multiple VA mappings can be created to the same section of the object
+ * (aliasing).
+ *
+ * The @start, @offset and @length must be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start, @offset and @length must be 64K aligned.
+ *
+ * Error code -EINVAL will be returned if @start, @offset and @length are not
+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
+ * -ENOSPC will be returned if the VA range specified can't be reserved.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered.
+ */
+struct drm_i915_gem_vm_bind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @handle: Object handle */
+	__u32 handle;
+
+	/** @start: Virtual Address start to bind */
+	__u64 start;
+
+	/** @offset: Offset in object to bind */
+	__u64 offset;
+
+	/** @length: Length of mapping to bind */
+	__u64 length;
+
+	/** @flags: Currently reserved, MBZ. */
+	__u64 flags;
+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd[2];
+
+	/** @rsvd2: Reserved for timeline fence */
+	__u64 rsvd2[2];
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). VM_UNBIND will force unbind the specified
+ * range from device page table without waiting for any GPU job to complete.
+ * It is UMDs responsibility to ensure the mapping is no longer in use before
+ * calling VM_UNBIND.
+ *
+ * If the specified mapping is not found, the ioctl will simply return without
+ * any error.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered.
+ */
+struct drm_i915_gem_vm_unbind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @pad: padding, MBZ */
+	__u32 pad;
+
+	/** @start: Virtual Address start to unbind */
+	__u64 start;
+
+	/** @length: Length of mapping to unbind */
+	__u64 length;
+
+	/** @flags: Currently reserved, MBZ. */
+	__u64 flags;
+#define __I915_GEM_VM_UNBIND_UNKNOWN_FLAGS (~0ull)
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd[2];
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27

