Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD234580AAC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 07:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316E810E264;
	Tue, 26 Jul 2022 05:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF010E08B;
 Tue, 26 Jul 2022 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658812073; x=1690348073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PgsvW/BQzVTJjTG622vJK1i7onVocAcHIPYYsBC3vRE=;
 b=i/RjKXBAPghB24ZcSfW4DfBnx9ZCIxiM4UIJq65v/D+sjnynysLkkXMV
 5S4v/uAP1qkqrSRZ2XkRUlLYpJRTrghDvskWM3kbPs9PJGxpyBN+EE0wT
 RAtClbkoi+AXxFDT8rc+wdgw4qjBKexasfe2QwpzdOtocoEyqrb3/+HBL
 9Dnj/oWIAyMEz5TLhSneqFvedvxEvsyiN8oUsAgByYIDuJdKKoVyCaSaF
 L0WiMlY1hxdf679wWN22qH7ct+vhrw/EC7fnKtPFO0wubIgsR8NYFBTGE
 SnNiCeNWpMeA1s9v5A3BWWUqmhfIjgz/PFDpFvs3snKX1usQ4SdbnzxOS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="289048693"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="289048693"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 22:07:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="550259588"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 22:07:51 -0700
Date: Mon, 25 Jul 2022 22:07:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
Message-ID: <20220726050730.GH14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <284014b2-ceff-f80e-d805-f3534776306f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <284014b2-ceff-f80e-d805-f3534776306f@linux.intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 11:55:41AM +0100, Tvrtko Ursulin wrote:
>
>On 01/07/2022 23:50, Niranjana Vishwanathapura wrote:
>>Bind and unbind the mappings upon VM_BIND and VM_UNBIND calls.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  10 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  38 +++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 233 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   7 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>>  drivers/gpu/drm/i915/i915_driver.c            |  11 +-
>>  drivers/gpu/drm/i915/i915_vma.c               |   7 +-
>>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>>  drivers/gpu/drm/i915/i915_vma_types.h         |   8 +
>>  11 files changed, 318 insertions(+), 10 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index 522ef9b4aff3..4e1627e96c6e 100644
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
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>index 33673fe7ee0a..927a87e5ec59 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>@@ -15,10 +15,10 @@
>>  #include "i915_trace.h"
>>  #include "i915_user_extensions.h"
>>-static u32 object_max_page_size(struct intel_memory_region **placements,
>>-				unsigned int n_placements)
>>+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
>>+				  unsigned int n_placements)
>>  {
>>-	u32 max_page_size = 0;
>>+	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>>  	int i;
>>  	for (i = 0; i < n_placements; i++) {
>>@@ -28,7 +28,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
>>  		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>>  	}
>>-	GEM_BUG_ON(!max_page_size);
>>  	return max_page_size;
>>  }
>>@@ -99,7 +98,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>>  	i915_gem_flush_free_objects(i915);
>>-	size = round_up(size, object_max_page_size(placements, n_placements));
>>+	size = round_up(size, i915_gem_object_max_page_size(placements,
>>+							    n_placements));
>>  	if (size == 0)
>>  		return ERR_PTR(-EINVAL);
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>index 6f0a3ce35567..650de2224843 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>@@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>>  }
>>  void i915_gem_init__objects(struct drm_i915_private *i915);
>>+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
>>+				  unsigned int n_placements);
>>  void i915_objects_module_exit(void);
>>  int i915_objects_module_init(void);
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>new file mode 100644
>>index 000000000000..642cdb559f17
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>@@ -0,0 +1,38 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright � 2022 Intel Corporation
>>+ */
>>+
>>+#ifndef __I915_GEM_VM_BIND_H
>>+#define __I915_GEM_VM_BIND_H
>>+
>>+#include "i915_drv.h"
>>+
>>+#define assert_vm_bind_held(vm)   lockdep_assert_held(&(vm)->vm_bind_lock)
>>+
>>+static inline void i915_gem_vm_bind_lock(struct i915_address_space *vm)
>>+{
>>+	mutex_lock(&vm->vm_bind_lock);
>>+}
>>+
>>+static inline int
>>+i915_gem_vm_bind_lock_interruptible(struct i915_address_space *vm)
>>+{
>>+	return mutex_lock_interruptible(&vm->vm_bind_lock);
>>+}
>>+
>>+static inline void i915_gem_vm_bind_unlock(struct i915_address_space *vm)
>>+{
>>+	mutex_unlock(&vm->vm_bind_lock);
>>+}
>>+
>>+struct i915_vma *
>>+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>>+void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
>>+int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>+			 struct drm_i915_gem_vm_bind *va,
>>+			 struct drm_file *file);
>>+int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>>+			   struct drm_i915_gem_vm_unbind *va);
>>+
>>+#endif /* __I915_GEM_VM_BIND_H */
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>new file mode 100644
>>index 000000000000..43ceb4dcca6c
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -0,0 +1,233 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright � 2022 Intel Corporation
>>+ */
>>+
>>+#include <linux/interval_tree_generic.h>
>>+
>>+#include "gem/i915_gem_vm_bind.h"
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
>>+ * 1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock is taken in
>>+ *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
>>+ *    mapping.
>>+ *
>>+ *    In future, when GPU page faults are supported, we can potentially use a
>>+ *    rwsem instead, so that multiple page fault handlers can take the read
>>+ *    side lock to lookup the mapping and hence can run in parallel.
>>+ *    The older execbuf mode of binding do not need this lock.
>>+ *
>>+ * 2) Lock-B: The object's dma-resv lock will protect i915_vma state and needs
>>+ *    to be held while binding/unbinding a vma in the async worker and while
>>+ *    updating dma-resv fence list of an object. Note that private BOs of a VM
>>+ *    will all share a dma-resv object.
>>+ *
>>+ *    The future system allocator support will use the HMM prescribed locking
>>+ *    instead.
>>+ *
>>+ * 3) Lock-C: Spinlock/s to protect some of the VM's lists like the list of
>>+ *    invalidated vmas (due to eviction and userptr invalidation) etc.
>>+ */
>>+
>>+struct i915_vma *
>>+i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
>>+{
>>+	struct i915_vma *vma, *temp;
>>+
>>+	assert_vm_bind_held(vm);
>>+
>>+	vma = i915_vm_bind_it_iter_first(&vm->va, va, va);
>>+	/* Working around compiler error, remove later */
>>+	if (vma)
>>+		temp = i915_vm_bind_it_iter_next(vma, va + vma->size, -1);
>>+	return vma;
>>+}
>>+
>>+void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>+{
>>+	assert_vm_bind_held(vma->vm);
>>+
>>+	if (!list_empty(&vma->vm_bind_link)) {
>>+		list_del_init(&vma->vm_bind_link);
>>+		i915_vm_bind_it_remove(vma, &vma->vm->va);
>>+
>>+		/* Release object */
>>+		if (release_obj)
>>+			i915_vma_put(vma);
>>+	}
>>+}
>>+
>>+int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>>+			   struct drm_i915_gem_vm_unbind *va)
>>+{
>>+	struct drm_i915_gem_object *obj;
>>+	struct i915_vma *vma;
>>+	int ret;
>>+
>>+	va->start = gen8_noncanonical_addr(va->start);
>>+	ret = i915_gem_vm_bind_lock_interruptible(vm);
>>+	if (ret)
>>+		return ret;
>>+
>>+	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>>+	if (!vma) {
>>+		ret = -ENOENT;
>>+		goto out_unlock;
>>+	}
>>+
>>+	if (vma->size != va->length)
>>+		ret = -EINVAL;
>>+	else
>>+		i915_gem_vm_bind_remove(vma, false);
>>+
>>+out_unlock:
>>+	i915_gem_vm_bind_unlock(vm);
>>+	if (ret || !vma)
>>+		return ret;
>>+
>>+	/* Destroy vma and then release object */
>>+	obj = vma->obj;
>>+	ret = i915_gem_object_lock(obj, NULL);
>>+	if (ret)
>>+		return ret;
>>+
>>+	i915_vma_destroy(vma);
>>+	i915_gem_object_unlock(obj);
>>+	i915_gem_object_put(obj);
>>+
>>+	return 0;
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
>
>One pre-requisite, which was known for "years", was to refactor the 
>GGTT view code into a generic concept. (GGTT has no place in VM BIND 
>code.) It may be just a question of renaming things, or it may end up 
>a bit more, but in any case please do include that refactor in this 
>series.
>

Thanks Tvrtko,
Yah, as mentioned in the other thread, my plan is to rename ggtt_view
to gtt_view. But it requires changes in lot of places and it probably
not going to look good in this patch series. So, my take is to do it
after this patch seires lands.

Niranjana

>Regards,
>
>Tvrtko
>
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
>>+int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>+			 struct drm_i915_gem_vm_bind *va,
>>+			 struct drm_file *file)
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
>>+	ret = i915_gem_vm_bind_lock_interruptible(vm);
>>+	if (ret)
>>+		goto put_obj;
>>+
>>+	vma = vm_bind_get_vma(vm, obj, va);
>>+	if (IS_ERR(vma)) {
>>+		ret = PTR_ERR(vma);
>>+		goto unlock_vm;
>>+	}
>>+
>>+	i915_gem_ww_ctx_init(&ww, true);
>>+	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER;
>>+retry:
>>+	ret = i915_gem_object_lock(vma->obj, &ww);
>>+	if (ret)
>>+		goto out_ww;
>>+
>>+	ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
>>+	if (ret)
>>+		goto out_ww;
>>+
>>+	/* Make it evictable */
>>+	__i915_vma_unpin(vma);
>>+
>>+	list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>+	i915_vm_bind_it_insert(vma, &vm->va);
>>+
>>+	/* Hold object reference until vm_unbind */
>>+	i915_gem_object_get(vma->obj);
>>+out_ww:
>>+	if (ret == -EDEADLK) {
>>+		ret = i915_gem_ww_ctx_backoff(&ww);
>>+		if (!ret)
>>+			goto retry;
>>+	}
>>+
>>+	if (ret)
>>+		i915_vma_destroy(vma);
>>+
>>+	i915_gem_ww_ctx_fini(&ww);
>>+unlock_vm:
>>+	i915_gem_vm_bind_unlock(vm);
>>+put_obj:
>>+	i915_gem_object_put(obj);
>>+	return ret;
>>+}
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index b67831833c9a..135dc4a76724 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -176,6 +176,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>>  void i915_address_space_fini(struct i915_address_space *vm)
>>  {
>>  	drm_mm_takedown(&vm->mm);
>>+	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>>+	mutex_destroy(&vm->vm_bind_lock);
>>  }
>>  /**
>>@@ -282,6 +284,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
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
>>index c812aa9708ae..d4a6ce65251d 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>@@ -259,6 +259,15 @@ struct i915_address_space {
>>  	 */
>>  	struct list_head unbound_list;
>>+	/**
>>+	 * List of VM_BIND objects.
>>+	 */
>>+	struct mutex vm_bind_lock;  /* Protects vm_bind lists */
>>+	struct list_head vm_bind_list;
>>+	struct list_head vm_bound_list;
>>+	/* va tree of persistent vmas */
>>+	struct rb_root_cached va;
>>+
>>  	/* Global GTT */
>>  	bool is_ggtt:1;
>>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>index ccf990dfd99b..776ab7844f60 100644
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
>>@@ -1783,13 +1784,16 @@ static int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
>>  {
>>  	struct drm_i915_gem_vm_bind *args = data;
>>  	struct i915_address_space *vm;
>>+	int ret;
>>  	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>>  	if (unlikely(!vm))
>>  		return -ENOENT;
>>+	ret = i915_gem_vm_bind_obj(vm, args, file);
>>+
>>  	i915_vm_put(vm);
>>-	return -EINVAL;
>>+	return ret;
>>  }
>>  static int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>@@ -1797,13 +1801,16 @@ static int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>  {
>>  	struct drm_i915_gem_vm_unbind *args = data;
>>  	struct i915_address_space *vm;
>>+	int ret;
>>  	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>>  	if (unlikely(!vm))
>>  		return -ENOENT;
>>+	ret = i915_gem_vm_unbind_obj(vm, args);
>>+
>>  	i915_vm_put(vm);
>>-	return -EINVAL;
>>+	return ret;
>>  }
>>  static const struct drm_ioctl_desc i915_ioctls[] = {
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 43339ecabd73..d324e29cef0a 100644
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
>>@@ -1660,6 +1661,10 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>>  	spin_unlock(&obj->vma.lock);
>>+	i915_gem_vm_bind_lock(vma->vm);
>>+	i915_gem_vm_bind_remove(vma, true);
>>+	i915_gem_vm_bind_unlock(vma->vm);
>>+
>>  	spin_lock_irq(&gt->closed_lock);
>>  	__i915_vma_remove_closed(vma);
>>  	spin_unlock_irq(&gt->closed_lock);
>>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>>index 88ca0bd9c900..dcb49f79ff7e 100644
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
>>index be6e028c3b57..b6d179bdbfa0 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -289,6 +289,14 @@ struct i915_vma {
>>  	/** This object's place on the active/inactive lists */
>>  	struct list_head vm_link;
>>+	struct list_head vm_bind_link; /* Link in persistent VMA list */
>>+
>>+	/** Interval tree structures for persistent vma */
>>+	struct rb_node rb;
>>+	u64 start;
>>+	u64 last;
>>+	u64 __subtree_last;
>>+
>>  	struct list_head obj_link; /* Link in the object's VMA list */
>>  	struct rb_node obj_node;
>>  	struct hlist_node obj_hash;
