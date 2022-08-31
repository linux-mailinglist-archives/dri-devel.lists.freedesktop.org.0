Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B95A7645
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78510E1CC;
	Wed, 31 Aug 2022 06:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375310E1D6;
 Wed, 31 Aug 2022 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926250; x=1693462250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eyplX0IHGmUQ8OsqjZy/ZzBLcPgVUjgqmPRN2ygll6Q=;
 b=OFPgT3bCRAryKy9DAWzpayEQpUNaM/hiZwGeCAAanvTvpnNoEWVmxKiD
 hYZOoHkkUkqWB7S6cL9S37VdCbXJESWKLuT6OQpKoHi97adV48A0uqOL0
 ra6rTUWKFYNvFbakGN5kVPSgrNlxz2btI1cwiyVFxuGnArFBVoZubYGge
 0A2kwxQ2RkV/r1LouEiQzu24A6nE5CikdvsU4GSZtYKrmSPGP1Oh5SzA6
 px5C60WxgY5j3rD1YuWfNClk2xxWHeGhoPhubk3y+kXm2uOGQEqYd1H4J
 AmopPFuAmecY/ZVv87mcyO2QBXReYMdXmv4P+MCGl6ORffLlVy/XJuhW7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="278396954"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="278396954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:10:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="588920403"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:10:49 -0700
Date: Tue, 30 Aug 2022 23:10:28 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC PATCH v3 04/17] drm/i915: Implement bind and unbind of object
Message-ID: <20220831061027.GB10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-5-andi.shyti@linux.intel.com>
 <e7a987e4-e306-bf6e-7d17-c5189eecaf49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a987e4-e306-bf6e-7d17-c5189eecaf49@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 06:37:55PM +0100, Matthew Auld wrote:
>On 27/08/2022 20:43, Andi Shyti wrote:
>>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>>Implement the bind and unbind of an object at the specified GPU virtual
>>addresses.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  21 ++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 322 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>  drivers/gpu/drm/i915/i915_vma.c               |   3 +-
>>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>>  include/uapi/drm/i915_drm.h                   | 163 +++++++++
>>  10 files changed, 543 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index 522ef9b4aff32..4e1627e96c6e0 100644
>>--- a/drivers/gpu/drm/i915/Makefile
>>+++ b/drivers/gpu/drm/i915/Makefile
>>@@ -165,6 +165,7 @@ gem-y += \
>>  	gem/i915_gem_ttm_move.o \
>>  	gem/i915_gem_ttm_pm.o \
>>  	gem/i915_gem_userptr.o \
>>+	gem/i915_gem_vm_bind_object.o \
>>  	gem/i915_gem_wait.o \
>>  	gem/i915_gemfs.o
>>  i915-y += \
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>new file mode 100644
>>index 0000000000000..ebc493b7dafc1
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>@@ -0,0 +1,21 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#ifndef __I915_GEM_VM_BIND_H
>>+#define __I915_GEM_VM_BIND_H
>>+
>>+#include "i915_drv.h"
>>+
>>+struct i915_vma *
>>+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>>+void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
>>+
>>+int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
>>+			   struct drm_file *file);
>>+int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>+			     struct drm_file *file);
>>+
>>+void i915_gem_vm_unbind_vma_all(struct i915_address_space *vm);
>>+#endif /* __I915_GEM_VM_BIND_H */
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>new file mode 100644
>>index 0000000000000..dadd1d4b1761b
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -0,0 +1,322 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#include <linux/interval_tree_generic.h>
>>+
>>+#include "gem/i915_gem_vm_bind.h"
>>+#include "gem/i915_gem_context.h"
>>+#include "gt/gen8_engine_cs.h"
>>+
>>+#include "i915_drv.h"
>>+#include "i915_gem_gtt.h"
>>+
>>+#define START(node) ((node)->start)
>>+#define LAST(node) ((node)->last)
>>+
>>+INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
>>+		     START, LAST, static inline, i915_vm_bind_it)
>>+
>>+#undef START
>>+#undef LAST
>>+
>>+/**
>>+ * DOC: VM_BIND/UNBIND ioctls
>>+ *
>>+ * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
>>+ * objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
>>+ * specified address space (VM). Multiple mappings can map to the same physical
>>+ * pages of an object (aliasing). These mappings (also referred to as persistent
>>+ * mappings) will be persistent across multiple GPU submissions (execbuf calls)
>>+ * issued by the UMD, without user having to provide a list of all required
>>+ * mappings during each submission (as required by older execbuf mode).
>>+ *
>>+ * The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence for
>>+ * signaling the completion of bind/unbind operation.
>>+ *
>>+ * VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
>>+ * User has to opt-in for VM_BIND mode of binding for an address space (VM)
>>+ * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
>>+ *
>>+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>>+ * are not ordered. Furthermore, parts of the VM_BIND/UNBIND operations can be
>>+ * done asynchronously, when valid out fence is specified.
>>+ *
>>+ * VM_BIND locking order is as below.
>>+ *
>>+ * 1) vm_bind_lock mutex will protect vm_bind lists. This lock is taken in
>>+ *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
>>+ *    mapping.
>>+ *
>>+ *    In future, when GPU page faults are supported, we can potentially use a
>>+ *    rwsem instead, so that multiple page fault handlers can take the read
>>+ *    side lock to lookup the mapping and hence can run in parallel.
>>+ *    The older execbuf mode of binding do not need this lock.
>>+ *
>>+ * 2) The object's dma-resv lock will protect i915_vma state and needs
>>+ *    to be held while binding/unbinding a vma in the async worker and while
>>+ *    updating dma-resv fence list of an object. Note that private BOs of a VM
>>+ *    will all share a dma-resv object.
>>+ *
>>+ * 3) Spinlock/s to protect some of the VM's lists like the list of
>>+ *    invalidated vmas (due to eviction and userptr invalidation) etc.
>>+ */
>>+
>>+/**
>>+ * i915_gem_vm_bind_lookup_vma() - lookup for the vma with a starting addr
>>+ * @vm: virtual address space in which vma needs to be looked for
>>+ * @va: starting addr of the vma
>>+ *
>>+ * retrieves the vma with a starting address from the vm's vma tree.
>>+ *
>>+ * Returns: returns vma on success, NULL on failure.
>>+ */
>>+struct i915_vma *
>>+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
>>+{
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	return i915_vm_bind_it_iter_first(&vm->va, va, va);
>>+}
>>+
>>+/**
>>+ * i915_gem_vm_bind_remove() - Remove vma from the vm bind list
>>+ * @vma: vma that needs to be removed
>>+ * @release_obj: object to be release or not
>>+ *
>>+ * Removes the vma from the vm's lists custom interval tree
>>+ */
>>+void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>+{
>>+	lockdep_assert_held(&vma->vm->vm_bind_lock);
>>+
>>+	if (!list_empty(&vma->vm_bind_link)) {
>>+		list_del_init(&vma->vm_bind_link);
>>+		i915_vm_bind_it_remove(vma, &vma->vm->va);
>>+
>>+		/* Release object */
>>+		if (release_obj)
>>+			i915_gem_object_put(vma->obj);
>>+	}
>>+}
>>+
>>+static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>+				  struct i915_vma *vma,
>>+				  struct drm_i915_gem_vm_unbind *va)
>>+{
>>+	struct drm_i915_gem_object *obj;
>>+	int ret;
>>+
>>+	if (vma) {
>>+		obj = vma->obj;
>>+		i915_vma_destroy(vma);
>>+
>>+		goto exit;
>>+	}

This function overloading based on whether vma is NULL or not
doesn't look right. More on this below.

>>+
>>+	if (!va)
>>+		return -EINVAL;
>>+
>>+	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>>+	if (ret)
>>+		return ret;
>>+
>>+	va->start = gen8_noncanonical_addr(va->start);
>>+	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>>+
>>+	if (!vma)
>>+		ret = -ENOENT;
>>+	else if (vma->size != va->length)
>>+		ret = -EINVAL;
>>+
>>+	if (ret) {
>>+		mutex_unlock(&vm->vm_bind_lock);
>>+		return ret;
>>+	}
>>+
>>+	i915_gem_vm_bind_remove(vma, false);
>>+
>>+	mutex_unlock(&vm->vm_bind_lock);
>>+
>>+	/* Destroy vma and then release object */
>>+	obj = vma->obj;
>>+	ret = i915_gem_object_lock(obj, NULL);
>>+	if (ret)
>>+		return ret;
>>+
>>+	i915_vma_destroy(vma);
>>+	i915_gem_object_unlock(obj);
>>+
>>+exit:
>>+	i915_gem_object_put(obj);
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * i915_gem_vm_unbind_vma_all() - Unbind all vmas from an address space
>>+ * @vm: Address spece from which vma binding needs to be removed
>>+ *
>>+ * Unbind all userspace requested object binding
>>+ */
>>+void i915_gem_vm_unbind_vma_all(struct i915_address_space *vm)
>>+{
>>+	struct i915_vma *vma, *t;
>>+
>>+	list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link)
>>+		WARN_ON(i915_gem_vm_unbind_vma(vm, vma, NULL));

I think this unbinding should be done for vmas in both vm_bound_list and
vm_bind_list.

>>+}
>>+
>>+static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
>>+					struct drm_i915_gem_object *obj,
>>+					struct drm_i915_gem_vm_bind *va)
>>+{
>>+	struct i915_ggtt_view view;
>>+	struct i915_vma *vma;
>>+
>>+	va->start = gen8_noncanonical_addr(va->start);
>>+	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>>+	if (vma)
>>+		return ERR_PTR(-EEXIST);
>>+
>>+	view.type = I915_GGTT_VIEW_PARTIAL;
>>+	view.partial.offset = va->offset >> PAGE_SHIFT;
>>+	view.partial.size = va->length >> PAGE_SHIFT;
>>+	vma = i915_vma_instance(obj, vm, &view);
>>+	if (IS_ERR(vma))
>>+		return vma;
>>+
>>+	vma->start = va->start;
>>+	vma->last = va->start + va->length - 1;
>>+
>>+	return vma;
>>+}
>>+
>>+static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>+				struct drm_i915_gem_vm_bind *va,
>>+				struct drm_file *file)
>>+{
>>+	struct drm_i915_gem_object *obj;
>>+	struct i915_vma *vma = NULL;
>>+	struct i915_gem_ww_ctx ww;
>>+	u64 pin_flags;
>>+	int ret = 0;
>>+
>>+	if (!vm->vm_bind_mode)
>>+		return -EOPNOTSUPP;
>>+
>>+	obj = i915_gem_object_lookup(file, va->handle);
>>+	if (!obj)
>>+		return -ENOENT;
>>+
>>+	if (!va->length ||
>>+	    !IS_ALIGNED(va->offset | va->length,
>>+			i915_gem_object_max_page_size(obj->mm.placements,
>>+						      obj->mm.n_placements)) ||
>>+	    range_overflows_t(u64, va->offset, va->length, obj->base.size)) {
>>+		ret = -EINVAL;
>>+		goto put_obj;
>>+	}
>>+
>>+	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>>+	if (ret)
>>+		goto put_obj;
>>+
>>+	vma = vm_bind_get_vma(vm, obj, va);
>>+	if (IS_ERR(vma)) {
>>+		ret = PTR_ERR(vma);
>>+		goto unlock_vm;
>>+	}
>>+
>>+	for_i915_gem_ww(&ww, ret, true) {
>>+retry:
>>+		ret = i915_gem_object_lock(vma->obj, &ww);
>>+		if (ret)
>>+			goto out_ww;
>>+
>>+		ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
>>+		if (ret)
>>+			goto out_ww;
>>+
>>+		/* Make it evictable */
>>+		__i915_vma_unpin(vma);
>>+
>>+		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>+		i915_vm_bind_it_insert(vma, &vm->va);
>>+
>>+out_ww:
>>+		if (ret == -EDEADLK) {
>>+			ret = i915_gem_ww_ctx_backoff(&ww);
>>+			if (!ret)
>>+				goto retry;
>>+		} else {
>>+			/* Hold object reference until vm_unbind */
>>+			i915_gem_object_get(vma->obj);
>>+		}
>>+	}
>
>Just a drive-by-comment, since this looks a little strange at a 
>glance. The main idea behind for_i915_gem_ww() is to handle this type 
>of stuff for you.
>
>With the usual pattern this would look something like:
>
>for_i915_gem_ww(&ww, ret, true) {
>    ret = i915_gem_object_lock(vma->obj, &ww);
>    if (ret)
>        continue;
>
>    ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
>    if (ret)
>        continue;
>
>    __i915_vma_unpin(vma);
>    list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>    i915_vm_bind_it_insert(vma, &vm->va);
>    i915_gem_object_get(vma->obj);
>}
>
>Does that not work here? If it doesn't then probably we shouldn't use 
>for_i915_gem_ww() here.
>

Yah, the for_i915_gem_ww() usage here is wrong.
The above pattern by Matt should work here.

Also, vma destruction upon error is missing here and got added in a
later patch. There is no reason not to handle error condition here
in this patch.

Niranjana

>>+
>>+unlock_vm:
>>+	mutex_unlock(&vm->vm_bind_lock);
>>+
>>+put_obj:
>>+	i915_gem_object_put(obj);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * i915_gem_vm_bind_ioctl() - ioctl function for binding an obj into
>>+ * virtual address
>>+ * @dev: drm device associated to the virtual address
>>+ * @data: data related to the vm bind required
>>+ * @file: drm_file related to he ioctl
>>+ *
>>+ * Implements a function to bind the object into the virtual address
>>+ *
>>+ * Returns 0 on success, error code on failure.
>>+ */
>>+int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
>>+			   struct drm_file *file)
>>+{
>>+	struct drm_i915_gem_vm_bind *args = data;
>>+	struct i915_address_space *vm;
>>+	int ret;
>>+
>>+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>>+	if (unlikely(!vm))
>>+		return -ENOENT;
>>+
>>+	ret = i915_gem_vm_bind_obj(vm, args, file);
>>+
>>+	i915_vm_put(vm);
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * i915_gem_vm_unbind_ioctl() - ioctl function for unbinding an obj from
>>+ * virtual address
>>+ * @dev: drm device associated to the virtual address
>>+ * @data: data related to the binding that needs to be unbinded
>>+ * @file: drm_file related to the ioctl
>>+ *
>>+ * Implements a function to unbind the object from the virtual address
>>+ *
>>+ * Returns 0 on success, error code on failure.
>>+ */
>>+int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>+			     struct drm_file *file)
>>+{
>>+	struct drm_i915_gem_vm_unbind *args = data;
>>+	struct i915_address_space *vm;
>>+	int ret;
>>+
>>+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>>+	if (unlikely(!vm))
>>+		return -ENOENT;
>>+
>>+	ret = i915_gem_vm_unbind_vma(vm, NULL, args);

By passing NULL for vma, we are essentially calling i915_vma_destroy()
here. But I think we should be calling i915_gem_vm_bind_remove() also.
So, this function overloading based on vma being NULL or not doesn't
look right to me.

>>+
>>+	i915_vm_put(vm);
>>+	return ret;
>>+}
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index b67831833c9a3..cb188377b7bd9 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -12,6 +12,7 @@
>>  #include "gem/i915_gem_internal.h"
>>  #include "gem/i915_gem_lmem.h"
>>+#include "gem/i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>  #include "i915_utils.h"
>>  #include "intel_gt.h"
>>@@ -176,6 +177,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>>  void i915_address_space_fini(struct i915_address_space *vm)
>>  {
>>  	drm_mm_takedown(&vm->mm);
>>+	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>>+	mutex_destroy(&vm->vm_bind_lock);
>>  }
>>  /**
>>@@ -204,6 +207,8 @@ static void __i915_vm_release(struct work_struct *work)
>>  	__i915_vm_close(vm);
>>+	i915_gem_vm_unbind_vma_all(vm);
>>+
>>  	/* Synchronize async unbinds. */
>>  	i915_vma_resource_bind_dep_sync_all(vm);
>>@@ -282,6 +287,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>  	INIT_LIST_HEAD(&vm->bound_list);
>>  	INIT_LIST_HEAD(&vm->unbound_list);
>>+
>>+	vm->va = RB_ROOT_CACHED;
>>+	INIT_LIST_HEAD(&vm->vm_bind_list);
>>+	INIT_LIST_HEAD(&vm->vm_bound_list);
>>+	mutex_init(&vm->vm_bind_lock);
>>  }
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>index da21088890b3b..06a259475816b 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>@@ -259,6 +259,15 @@ struct i915_address_space {
>>  	 */
>>  	struct list_head unbound_list;
>>+	/** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_list */
>>+	struct mutex vm_bind_lock;
>>+	/** @vm_bind_list: List of vm_binding in process */
>>+	struct list_head vm_bind_list;
>>+	/** @vm_bound_list: List of vm_binding completed */
>>+	struct list_head vm_bound_list;
>>+	/* @va: tree of persistent vmas */
>>+	struct rb_root_cached va;
>>+
>>  	/* Global GTT */
>>  	bool is_ggtt:1;
>>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>index 1332c70370a68..9a9010fd9ecfa 100644
>>--- a/drivers/gpu/drm/i915/i915_driver.c
>>+++ b/drivers/gpu/drm/i915/i915_driver.c
>>@@ -68,6 +68,7 @@
>>  #include "gem/i915_gem_ioctls.h"
>>  #include "gem/i915_gem_mman.h"
>>  #include "gem/i915_gem_pm.h"
>>+#include "gem/i915_gem_vm_bind.h"
>>  #include "gt/intel_gt.h"
>>  #include "gt/intel_gt_pm.h"
>>  #include "gt/intel_rc6.h"

Not used, should be removed.

>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 2603717164900..092ae4309d8a1 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -29,6 +29,7 @@
>>  #include "display/intel_frontbuffer.h"
>>  #include "gem/i915_gem_lmem.h"
>>  #include "gem/i915_gem_tiling.h"
>>+#include "gem/i915_gem_vm_bind.h"
>>  #include "gt/intel_engine.h"
>>  #include "gt/intel_engine_heartbeat.h"
>>  #include "gt/intel_gt.h"
>>@@ -234,6 +235,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>  	spin_unlock(&obj->vma.lock);
>>  	mutex_unlock(&vm->mutex);
>>+	INIT_LIST_HEAD(&vma->vm_bind_link);
>>  	return vma;
>>  err_unlock:
>>@@ -290,7 +292,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>>  {
>>  	struct i915_vma *vma;
>>-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>>  	GEM_BUG_ON(!kref_read(&vm->ref));
>>  	spin_lock(&obj->vma.lock);
>>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>>index 33a58f605d75c..15eac55a3e274 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>@@ -164,8 +164,6 @@ i915_vma_compare(struct i915_vma *vma,
>>  {
>>  	ptrdiff_t cmp;
>>-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>>-
>>  	cmp = ptrdiff(vma->vm, vm);
>>  	if (cmp)
>>  		return cmp;
>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>index be6e028c3b57d..f746fecae85ed 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -289,6 +289,20 @@ struct i915_vma {
>>  	/** This object's place on the active/inactive lists */
>>  	struct list_head vm_link;
>>+	/** @vm_bind_link: node for the vm_bind related lists of vm */
>>+	struct list_head vm_bind_link;
>>+
>>+	/** Interval tree structures for persistent vma */
>>+
>>+	/** @rb: node for the interval tree of vm for persistent vmas */
>>+	struct rb_node rb;
>>+	/** @start: start endpoint of the rb node */
>>+	u64 start;
>>+	/** @last: Last endpoint of the rb node */
>>+	u64 last;
>>+	/** @__subtree_last: last in subtree */
>>+	u64 __subtree_last;
>>+
>>  	struct list_head obj_link; /* Link in the object's VMA list */
>>  	struct rb_node obj_node;
>>  	struct hlist_node obj_hash;
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index 12435db751eb8..3da0e07f84bbd 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -1507,6 +1507,41 @@ struct drm_i915_gem_execbuffer2 {
>>  #define i915_execbuffer2_get_context_id(eb2) \
>>  	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>>+/**
>>+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
>>+ *
>>+ * The operation will wait for input fence to signal.
>>+ *
>>+ * The returned output fence will be signaled after the completion of the
>>+ * operation.
>>+ */
>>+struct drm_i915_gem_timeline_fence {
>>+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>>+	__u32 handle;
>>+
>>+	/**
>>+	 * @flags: Supported flags are:
>>+	 *
>>+	 * I915_TIMELINE_FENCE_WAIT:
>>+	 * Wait for the input fence before the operation.
>>+	 *
>>+	 * I915_TIMELINE_FENCE_SIGNAL:
>>+	 * Return operation completion fence as output.
>>+	 */
>>+	__u32 flags;
>>+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>>+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>>+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>>+
>>+	/**
>>+	 * @value: A point in the timeline.
>>+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>>+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>>+	 * binary one.
>>+	 */
>>+	__u64 value;
>>+};
>>+
>>  struct drm_i915_gem_pin {
>>  	/** Handle of the buffer to be pinned. */
>>  	__u32 handle;
>>@@ -3718,6 +3753,134 @@ struct drm_i915_gem_create_ext_protected_content {
>>  /* ID of the protected content session managed by i915 when PXP is active */
>>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>+/**
>>+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>+ *
>>+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
>>+ * virtual address (VA) range to the section of an object that should be bound
>>+ * in the device page table of the specified address space (VM).
>>+ * The VA range specified must be unique (ie., not currently bound) and can
>>+ * be mapped to whole object or a section of the object (partial binding).
>>+ * Multiple VA mappings can be created to the same section of the object
>>+ * (aliasing).
>>+ *
>>+ * The @start, @offset and @length must be 4K page aligned. However the DG2
>>+ * and XEHPSDV has 64K page size for device local memory and has compact page
>>+ * table. On those platforms, for binding device local-memory objects, the
>>+ * @start, @offset and @length must be 64K aligned. Also, UMDs should not mix
>>+ * the local memory 64K page and the system memory 4K page bindings in the same
>>+ * 2M range.
>>+ *
>>+ * Error code -EINVAL will be returned if @start, @offset and @length are not
>>+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
>>+ * -ENOSPC will be returned if the VA range specified can't be reserved.
>>+ *
>>+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>>+ * are not ordered. Furthermore, parts of the VM_BIND operation can be done
>>+ * asynchronously, if valid @fence is specified.
>>+ */
>>+struct drm_i915_gem_vm_bind {
>>+	/** @vm_id: VM (address space) id to bind */
>>+	__u32 vm_id;
>>+
>>+	/** @handle: Object handle */
>>+	__u32 handle;
>>+
>>+	/** @start: Virtual Address start to bind */
>>+	__u64 start;
>>+
>>+	/** @offset: Offset in object to bind */
>>+	__u64 offset;
>>+
>>+	/** @length: Length of mapping to bind */
>>+	__u64 length;
>>+
>>+	/**
>>+	 * @flags: Currently reserved, MBZ.
>>+	 *
>>+	 * Note that @fence carries its own flags.
>>+	 */
>>+	__u64 flags;
>>+
>>+	/**
>>+	 * @fence: Timeline fence for bind completion signaling.
>>+	 *
>>+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>>+	 *
>>+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>+	 * is invalid, and an error will be returned.
>>+	 *
>>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>>+	 * is not requested and binding is completed synchronously.
>>+	 */
>>+	struct drm_i915_gem_timeline_fence fence;
>>+
>>+	/**
>>+	 * @extensions: Zero-terminated chain of extensions.
>>+	 *
>>+	 * For future extensions. See struct i915_user_extension.
>>+	 */
>>+	__u64 extensions;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>>+ *
>>+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
>>+ * address (VA) range that should be unbound from the device page table of the
>>+ * specified address space (VM). VM_UNBIND will force unbind the specified
>>+ * range from device page table without waiting for any GPU job to complete.
>>+ * It is UMDs responsibility to ensure the mapping is no longer in use before
>>+ * calling VM_UNBIND.
>>+ *
>>+ * If the specified mapping is not found, the ioctl will simply return without
>>+ * any error.
>>+ *
>>+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>>+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
>>+ * asynchronously, if valid @fence is specified.
>>+ */
>>+struct drm_i915_gem_vm_unbind {
>>+	/** @vm_id: VM (address space) id to bind */
>>+	__u32 vm_id;
>>+
>>+	/** @rsvd: Reserved, MBZ */
>>+	__u32 rsvd;
>>+
>>+	/** @start: Virtual Address start to unbind */
>>+	__u64 start;
>>+
>>+	/** @length: Length of mapping to unbind */
>>+	__u64 length;
>>+
>>+	/**
>>+	 * @flags: Currently reserved, MBZ.
>>+	 *
>>+	 * Note that @fence carries its own flags.
>>+	 */
>>+	__u64 flags;
>>+
>>+	/**
>>+	 * @fence: Timeline fence for unbind completion signaling.
>>+	 *
>>+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>>+	 *
>>+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>+	 * is invalid, and an error will be returned.
>>+	 *
>>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>>+	 * is not requested and unbinding is completed synchronously.
>>+	 */
>>+	struct drm_i915_gem_timeline_fence fence;
>>+
>>+	/**
>>+	 * @extensions: Zero-terminated chain of extensions.
>>+	 *
>>+	 * For future extensions. See struct i915_user_extension.
>>+	 */
>>+	__u64 extensions;
>>+};
>>+
>>  #if defined(__cplusplus)
>>  }
>>  #endif
