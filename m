Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7D85E5E9D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F35D10EA83;
	Thu, 22 Sep 2022 09:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71410EA82;
 Thu, 22 Sep 2022 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663838995; x=1695374995;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3f778uCGNXHzoQ5CoiKQlJ16qBxuSBUTw33WmeUeZmQ=;
 b=eyBpwWMYl7LPCJmCGEN2y6aN/tcgksId9t0/FEbv+eLPPSuJMzj7lYmC
 s3qNZ2IjEcCGkUJrhHe304Qd2Codhn/1KVermXUE5hkUcVLPCLqMGxkO4
 mzS7DwGX247tzTSCIOg3NesSYQqT+zDqWSZJyyXPjnm86JWKrT/fL67KJ
 pDditqzm2vx9w4qLVpyF1fu8TSHEoRxS0VN1uTH3NxfejLuETuWzuIA1m
 k81Pgzvjl8Nw+XKy+L3Cc5GNmEdFoFdH0mzmrbJ0DazDTF2QddxhmBmB5
 2pLca3ct/EbOwDnhC4D+LJfoP91sODj4tOtkxSeQOCM5oKAnJRtOsBTWx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326569226"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="326569226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:29:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="708807481"
Received: from akoska-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.156])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:29:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC v4 04/14] drm/i915/vm_bind: Implement bind and
 unbind of object
In-Reply-To: <20220921070945.27764-5-niranjana.vishwanathapura@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-5-niranjana.vishwanathapura@intel.com>
Date: Thu, 22 Sep 2022 12:29:35 +0300
Message-ID: <87czbn7o5c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Sep 2022, Niranjana Vishwanathapura <niranjana.vishwanathapura@i=
ntel.com> wrote:
> Add uapi and implement support for bind and unbind of an
> object at the specified GPU virtual addresses.
>
> The vm_bind mode is not supported in legacy execbuf2 ioctl.
> It will be supported only in the newer execbuf3 ioctl.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   5 +
>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  27 ++
>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 308 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  17 +
>  drivers/gpu/drm/i915/i915_driver.c            |   3 +
>  drivers/gpu/drm/i915/i915_vma.c               |   3 +-
>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>  drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>  include/uapi/drm/i915_drm.h                   | 167 ++++++++++
>  11 files changed, 554 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a26edcdadc21..9bf939ef18ea 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -166,6 +166,7 @@ gem-y +=3D \
>  	gem/i915_gem_ttm_move.o \
>  	gem/i915_gem_ttm_pm.o \
>  	gem/i915_gem_userptr.o \
> +	gem/i915_gem_vm_bind_object.o \
>  	gem/i915_gem_wait.o \
>  	gem/i915_gemfs.o
>  i915-y +=3D \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index cd75b0ca2555..f85f10cf9c34 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -781,6 +781,11 @@ static int eb_select_context(struct i915_execbuffer =
*eb)
>  	if (unlikely(IS_ERR(ctx)))
>  		return PTR_ERR(ctx);
>=20=20
> +	if (ctx->vm->vm_bind_mode) {
> +		i915_gem_context_put(ctx);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	eb->gem_context =3D ctx;
>  	if (i915_gem_context_has_full_ppgtt(ctx))
>  		eb->invalid_flags |=3D EXEC_OBJECT_NEEDS_GTT;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/dr=
m/i915/gem/i915_gem_vm_bind.h
> new file mode 100644
> index 000000000000..4f3cfa1f6ef6
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_VM_BIND_H
> +#define __I915_GEM_VM_BIND_H
> +
> +#include <linux/types.h>

This one's needed for u64, but none of the below includes are needed.
Please drop them and use forward declarations instead.

As a rule of thumb, don't include headers from headers if it can be
avoided. The interdependencies we have are already huge, and need to be
reduced, not increased.

BR,
Jani.

> +#include <drm/drm_file.h>
> +#include <drm/drm_device.h>
> +
> +#include "gt/intel_gtt.h"
> +#include "i915_vma_types.h"
> +
> +struct i915_vma *
> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
> +
> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file);
> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> +
> +void i915_gem_vm_unbind_all(struct i915_address_space *vm);
> +
> +#endif /* __I915_GEM_VM_BIND_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers=
/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> new file mode 100644
> index 000000000000..c24e22657617
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#include <uapi/drm/i915_drm.h>
> +
> +#include <linux/interval_tree_generic.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_vm_bind.h"
> +
> +#include "gt/intel_gpu_commands.h"
> +
> +#define START(node) ((node)->start)
> +#define LAST(node) ((node)->last)
> +
> +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
> +		     START, LAST, static inline, i915_vm_bind_it)
> +
> +#undef START
> +#undef LAST
> +
> +/**
> + * DOC: VM_BIND/UNBIND ioctls
> + *
> + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buff=
er
> + * objects (BOs) or sections of a BOs at specified GPU virtual addresses=
 on a
> + * specified address space (VM). Multiple mappings can map to the same p=
hysical
> + * pages of an object (aliasing). These mappings (also referred to as pe=
rsistent
> + * mappings) will be persistent across multiple GPU submissions (execbuf=
 calls)
> + * issued by the UMD, without user having to provide a list of all requi=
red
> + * mappings during each submission (as required by older execbuf mode).
> + *
> + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence f=
or
> + * signaling the completion of bind/unbind operation.
> + *
> + * VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
> + * User has to opt-in for VM_BIND mode of binding for an address space (=
VM)
> + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extensio=
n.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurre=
ntly
> + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND operations =
can be
> + * done asynchronously, when valid out fence is specified.
> + *
> + * VM_BIND locking order is as below.
> + *
> + * 1) vm_bind_lock mutex will protect vm_bind lists. This lock is taken =
in
> + *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while relea=
sing the
> + *    mapping.
> + *
> + *    In future, when GPU page faults are supported, we can potentially =
use a
> + *    rwsem instead, so that multiple page fault handlers can take the r=
ead
> + *    side lock to lookup the mapping and hence can run in parallel.
> + *    The older execbuf mode of binding do not need this lock.
> + *
> + * 2) The object's dma-resv lock will protect i915_vma state and needs
> + *    to be held while binding/unbinding a vma in the async worker and w=
hile
> + *    updating dma-resv fence list of an object. Note that private BOs o=
f a VM
> + *    will all share a dma-resv object.
> + *
> + * 3) Spinlock/s to protect some of the VM's lists like the list of
> + *    invalidated vmas (due to eviction and userptr invalidation) etc.
> + */
> +
> +/**
> + * i915_gem_vm_bind_lookup_vma() - lookup for the vma with a starting ad=
dr
> + * @vm: virtual address space in which vma needs to be looked for
> + * @va: starting addr of the vma
> + *
> + * retrieves the vma with a starting address from the vm's vma tree.
> + *
> + * Returns: returns vma on success, NULL on failure.
> + */
> +struct i915_vma *
> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
> +{
> +	lockdep_assert_held(&vm->vm_bind_lock);
> +
> +	return i915_vm_bind_it_iter_first(&vm->va, va, va);
> +}
> +
> +/**
> + * i915_gem_vm_bind_remove() - Remove vma from the vm bind list
> + * @vma: vma that needs to be removed
> + * @release_obj: release the object
> + *
> + * Removes the vma from the vm's lists and interval tree
> + */
> +static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_o=
bj)
> +{
> +	lockdep_assert_held(&vma->vm->vm_bind_lock);
> +
> +	list_del_init(&vma->vm_bind_link);
> +	i915_vm_bind_it_remove(vma, &vma->vm->va);
> +
> +	/* Release object */
> +	if (release_obj)
> +		i915_gem_object_put(vma->obj);
> +}
> +
> +static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
> +				  struct drm_i915_gem_vm_unbind *va)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma;
> +	int ret;
> +
> +	ret =3D mutex_lock_interruptible(&vm->vm_bind_lock);
> +	if (ret)
> +		return ret;
> +
> +	va->start =3D gen8_noncanonical_addr(va->start);
> +	vma =3D i915_gem_vm_bind_lookup_vma(vm, va->start);
> +
> +	if (!vma)
> +		ret =3D -ENOENT;
> +	else if (vma->size !=3D va->length)
> +		ret =3D -EINVAL;
> +
> +	if (ret) {
> +		mutex_unlock(&vm->vm_bind_lock);
> +		return ret;
> +	}
> +
> +	i915_gem_vm_bind_remove(vma, false);
> +
> +	mutex_unlock(&vm->vm_bind_lock);
> +
> +	/* Destroy vma and then release object */
> +	obj =3D vma->obj;
> +	ret =3D i915_gem_object_lock(obj, NULL);
> +	if (ret)
> +		return ret;
> +
> +	i915_vma_destroy(vma);
> +	i915_gem_object_unlock(obj);
> +
> +	i915_gem_object_put(obj);
> +
> +	return 0;
> +}
> +
> +/**
> + * i915_gem_vm_unbind_all() - Unbind all mappings from an address space
> + * @vm: Address spece to remove mappings from
> + *
> + * Unbind all userspace requested vm_bind mappings
> + */
> +void i915_gem_vm_unbind_all(struct i915_address_space *vm)
> +{
> +	struct i915_vma *vma, *t;
> +
> +	mutex_lock(&vm->vm_bind_lock);
> +	list_for_each_entry_safe(vma, t, &vm->vm_bind_list, vm_bind_link)
> +		i915_gem_vm_bind_remove(vma, true);
> +	list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link)
> +		i915_gem_vm_bind_remove(vma, true);
> +	mutex_unlock(&vm->vm_bind_lock);
> +}
> +
> +static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
> +					struct drm_i915_gem_object *obj,
> +					struct drm_i915_gem_vm_bind *va)
> +{
> +	struct i915_gtt_view view;
> +	struct i915_vma *vma;
> +
> +	va->start =3D gen8_noncanonical_addr(va->start);
> +	vma =3D i915_gem_vm_bind_lookup_vma(vm, va->start);
> +	if (vma)
> +		return ERR_PTR(-EEXIST);
> +
> +	view.type =3D I915_GTT_VIEW_PARTIAL;
> +	view.partial.offset =3D va->offset >> PAGE_SHIFT;
> +	view.partial.size =3D va->length >> PAGE_SHIFT;
> +	vma =3D i915_vma_instance(obj, vm, &view);
> +	if (IS_ERR(vma))
> +		return vma;
> +
> +	vma->start =3D va->start;
> +	vma->last =3D va->start + va->length - 1;
> +
> +	return vma;
> +}
> +
> +static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> +				struct drm_i915_gem_vm_bind *va,
> +				struct drm_file *file)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma =3D NULL;
> +	struct i915_gem_ww_ctx ww;
> +	u64 pin_flags;
> +	int ret =3D 0;
> +
> +	if (!vm->vm_bind_mode)
> +		return -EOPNOTSUPP;
> +
> +	obj =3D i915_gem_object_lookup(file, va->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (!va->length ||
> +	    !IS_ALIGNED(va->offset | va->length,
> +			i915_gem_object_max_page_size(obj->mm.placements,
> +						      obj->mm.n_placements)) ||
> +	    range_overflows_t(u64, va->offset, va->length, obj->base.size)) {
> +		ret =3D -EINVAL;
> +		goto put_obj;
> +	}
> +
> +	ret =3D mutex_lock_interruptible(&vm->vm_bind_lock);
> +	if (ret)
> +		goto put_obj;
> +
> +	vma =3D vm_bind_get_vma(vm, obj, va);
> +	if (IS_ERR(vma)) {
> +		ret =3D PTR_ERR(vma);
> +		goto unlock_vm;
> +	}
> +
> +	pin_flags =3D va->start | PIN_OFFSET_FIXED | PIN_USER;
> +
> +	for_i915_gem_ww(&ww, ret, true) {
> +		ret =3D i915_gem_object_lock(vma->obj, &ww);
> +		if (ret)
> +			continue;
> +
> +		ret =3D i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
> +		if (ret)
> +			continue;
> +
> +		/* Make it evictable */
> +		__i915_vma_unpin(vma);
> +
> +		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
> +		i915_vm_bind_it_insert(vma, &vm->va);
> +
> +		/* Hold object reference until vm_unbind */
> +		i915_gem_object_get(vma->obj);
> +	}
> +
> +	if (ret)
> +		i915_vma_destroy(vma);
> +unlock_vm:
> +	mutex_unlock(&vm->vm_bind_lock);
> +put_obj:
> +	i915_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
> +/**
> + * i915_gem_vm_bind_ioctl() - ioctl function for binding an obj into
> + * virtual address
> + * @dev: drm device associated to the virtual address
> + * @data: data related to the vm bind required
> + * @file: drm_file related to he ioctl
> + *
> + * Implements a function to bind the object into the virtual address
> + *
> + * Returns 0 on success, error code on failure.
> + */
> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct drm_i915_gem_vm_bind *args =3D data;
> +	struct i915_address_space *vm;
> +	int ret;
> +
> +	vm =3D i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +	if (unlikely(!vm))
> +		return -ENOENT;
> +
> +	ret =3D i915_gem_vm_bind_obj(vm, args, file);
> +
> +	i915_vm_put(vm);
> +	return ret;
> +}
> +
> +/**
> + * i915_gem_vm_unbind_ioctl() - ioctl function for unbinding an obj from
> + * virtual address
> + * @dev: drm device associated to the virtual address
> + * @data: data related to the binding that needs to be unbinded
> + * @file: drm_file related to the ioctl
> + *
> + * Implements a function to unbind the object from the virtual address
> + *
> + * Returns 0 on success, error code on failure.
> + */
> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file)
> +{
> +	struct drm_i915_gem_vm_unbind *args =3D data;
> +	struct i915_address_space *vm;
> +	int ret;
> +
> +	vm =3D i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +	if (unlikely(!vm))
> +		return -ENOENT;
> +
> +	ret =3D i915_gem_vm_unbind_vma(vm, args);
> +
> +	i915_vm_put(vm);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/g=
t/intel_gtt.c
> index b67831833c9a..0daa70c6ed0d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -12,6 +12,7 @@
>=20=20
>  #include "gem/i915_gem_internal.h"
>  #include "gem/i915_gem_lmem.h"
> +#include "gem/i915_gem_vm_bind.h"
>  #include "i915_trace.h"
>  #include "i915_utils.h"
>  #include "intel_gt.h"
> @@ -176,6 +177,8 @@ int i915_vm_lock_objects(struct i915_address_space *v=
m,
>  void i915_address_space_fini(struct i915_address_space *vm)
>  {
>  	drm_mm_takedown(&vm->mm);
> +	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
> +	mutex_destroy(&vm->vm_bind_lock);
>  }
>=20=20
>  /**
> @@ -202,6 +205,8 @@ static void __i915_vm_release(struct work_struct *wor=
k)
>  	struct i915_address_space *vm =3D
>  		container_of(work, struct i915_address_space, release_work);
>=20=20
> +	i915_gem_vm_unbind_all(vm);
> +
>  	__i915_vm_close(vm);
>=20=20
>  	/* Synchronize async unbinds. */
> @@ -282,6 +287,11 @@ void i915_address_space_init(struct i915_address_spa=
ce *vm, int subclass)
>=20=20
>  	INIT_LIST_HEAD(&vm->bound_list);
>  	INIT_LIST_HEAD(&vm->unbound_list);
> +
> +	vm->va =3D RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&vm->vm_bind_list);
> +	INIT_LIST_HEAD(&vm->vm_bound_list);
> +	mutex_init(&vm->vm_bind_lock);
>  }
>=20=20
>  void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/g=
t/intel_gtt.h
> index c0ca53cba9f0..b52061858161 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -259,6 +259,23 @@ struct i915_address_space {
>  	 */
>  	struct list_head unbound_list;
>=20=20
> +	/**
> +	 * @vm_bind_mode: flag to indicate vm_bind method of binding
> +	 *
> +	 * True: allow only vm_bind method of binding.
> +	 * False: allow only legacy execbuff method of binding.
> +	 */
> +	bool vm_bind_mode:1;
> +
> +	/** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_list */
> +	struct mutex vm_bind_lock;
> +	/** @vm_bind_list: List of vm_binding in process */
> +	struct list_head vm_bind_list;
> +	/** @vm_bound_list: List of vm_binding completed */
> +	struct list_head vm_bound_list;
> +	/* @va: tree of persistent vmas */
> +	struct rb_root_cached va;
> +
>  	/* Global GTT */
>  	bool is_ggtt:1;
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 9d1fc2477f80..f9e4a784dd0e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -69,6 +69,7 @@
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_mman.h"
>  #include "gem/i915_gem_pm.h"
> +#include "gem/i915_gem_vm_bind.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_rc6.h"
> @@ -1892,6 +1893,8 @@ static const struct drm_ioctl_desc i915_ioctls[] =
=3D {
>  	DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl, DRM_REN=
DER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_R=
ENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl, DRM_RENDER_=
ALLOW),
> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_UNBIND, i915_gem_vm_unbind_ioctl, DRM_REN=
DER_ALLOW),
>  };
>=20=20
>  /*
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index f17c09ead7d7..33cb0cbc7fb1 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -29,6 +29,7 @@
>  #include "display/intel_frontbuffer.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_tiling.h"
> +#include "gem/i915_gem_vm_bind.h"
>  #include "gt/intel_engine.h"
>  #include "gt/intel_engine_heartbeat.h"
>  #include "gt/intel_gt.h"
> @@ -234,6 +235,7 @@ vma_create(struct drm_i915_gem_object *obj,
>  	spin_unlock(&obj->vma.lock);
>  	mutex_unlock(&vm->mutex);
>=20=20
> +	INIT_LIST_HEAD(&vma->vm_bind_link);
>  	return vma;
>=20=20
>  err_unlock:
> @@ -290,7 +292,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  {
>  	struct i915_vma *vma;
>=20=20
> -	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>  	GEM_BUG_ON(!kref_read(&vm->ref));
>=20=20
>  	spin_lock(&obj->vma.lock);
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_=
vma.h
> index aecd9c64486b..6feef0305fe1 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -164,8 +164,6 @@ i915_vma_compare(struct i915_vma *vma,
>  {
>  	ptrdiff_t cmp;
>=20=20
> -	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
> -
>  	cmp =3D ptrdiff(vma->vm, vm);
>  	if (cmp)
>  		return cmp;
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915=
/i915_vma_types.h
> index ec0f6c9f57d0..bed7a344dcd7 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -289,6 +289,20 @@ struct i915_vma {
>  	/** This object's place on the active/inactive lists */
>  	struct list_head vm_link;
>=20=20
> +	/** @vm_bind_link: node for the vm_bind related lists of vm */
> +	struct list_head vm_bind_link;
> +
> +	/** Interval tree structures for persistent vma */
> +
> +	/** @rb: node for the interval tree of vm for persistent vmas */
> +	struct rb_node rb;
> +	/** @start: start endpoint of the rb node */
> +	u64 start;
> +	/** @last: Last endpoint of the rb node */
> +	u64 last;
> +	/** @__subtree_last: last in subtree */
> +	u64 __subtree_last;
> +
>  	struct list_head obj_link; /* Link in the object's VMA list */
>  	struct rb_node obj_node;
>  	struct hlist_node obj_hash;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 520ad2691a99..4a4f2a77388c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -470,6 +470,8 @@ typedef struct _drm_i915_sarea {
>  #define DRM_I915_GEM_VM_CREATE		0x3a
>  #define DRM_I915_GEM_VM_DESTROY		0x3b
>  #define DRM_I915_GEM_CREATE_EXT		0x3c
> +#define DRM_I915_GEM_VM_BIND		0x3d
> +#define DRM_I915_GEM_VM_UNBIND		0x3e
>  /* Must be kept compact -- no holes */
>=20=20
>  #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, =
drm_i915_init_t)
> @@ -534,6 +536,8 @@ typedef struct _drm_i915_sarea {
>  #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUER=
Y, struct drm_i915_query)
>  #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I91=
5_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
>  #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I9=
15_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
> +#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_=
GEM_VM_BIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I91=
5_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
>=20=20
>  /* Allow drivers to submit batchbuffers directly to hardware, relying
>   * on the security mechanisms provided by hardware.
> @@ -1507,6 +1511,41 @@ struct drm_i915_gem_execbuffer2 {
>  #define i915_execbuffer2_get_context_id(eb2) \
>  	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>=20=20
> +/**
> + * struct drm_i915_gem_timeline_fence - An input or output timeline fenc=
e.
> + *
> + * The operation will wait for input fence to signal.
> + *
> + * The returned output fence will be signaled after the completion of the
> + * operation.
> + */
> +struct drm_i915_gem_timeline_fence {
> +	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
> +	__u32 handle;
> +
> +	/**
> +	 * @flags: Supported flags are:
> +	 *
> +	 * I915_TIMELINE_FENCE_WAIT:
> +	 * Wait for the input fence before the operation.
> +	 *
> +	 * I915_TIMELINE_FENCE_SIGNAL:
> +	 * Return operation completion fence as output.
> +	 */
> +	__u32 flags;
> +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
> +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
> +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNA=
L << 1))
> +
> +	/**
> +	 * @value: A point in the timeline.
> +	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
> +	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
> +	 * binary one.
> +	 */
> +	__u64 value;
> +};
> +
>  struct drm_i915_gem_pin {
>  	/** Handle of the buffer to be pinned. */
>  	__u32 handle;
> @@ -3717,6 +3756,134 @@ struct drm_i915_gem_create_ext_protected_content {
>  /* ID of the protected content session managed by i915 when PXP is activ=
e */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>=20=20
> +/**
> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
> + *
> + * This structure is passed to VM_BIND ioctl and specifies the mapping o=
f GPU
> + * virtual address (VA) range to the section of an object that should be=
 bound
> + * in the device page table of the specified address space (VM).
> + * The VA range specified must be unique (ie., not currently bound) and =
can
> + * be mapped to whole object or a section of the object (partial binding=
).
> + * Multiple VA mappings can be created to the same section of the object
> + * (aliasing).
> + *
> + * The @start, @offset and @length must be 4K page aligned. However the =
DG2
> + * and XEHPSDV has 64K page size for device local memory and has compact=
 page
> + * table. On those platforms, for binding device local-memory objects, t=
he
> + * @start, @offset and @length must be 64K aligned. Also, UMDs should no=
t mix
> + * the local memory 64K page and the system memory 4K page bindings in t=
he same
> + * 2M range.
> + *
> + * Error code -EINVAL will be returned if @start, @offset and @length ar=
e not
> + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), erro=
r code
> + * -ENOSPC will be returned if the VA range specified can't be reserved.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurre=
ntly
> + * are not ordered. Furthermore, parts of the VM_BIND operation can be d=
one
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_bind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @handle: Object handle */
> +	__u32 handle;
> +
> +	/** @start: Virtual Address start to bind */
> +	__u64 start;
> +
> +	/** @offset: Offset in object to bind */
> +	__u64 offset;
> +
> +	/** @length: Length of mapping to bind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Currently reserved, MBZ.
> +	 *
> +	 * Note that @fence carries its own flags.
> +	 */
> +	__u64 flags;
> +
> +	/**
> +	 * @fence: Timeline fence for bind completion signaling.
> +	 *
> +	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
> +	 *
> +	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
> +	 * is invalid, and an error will be returned.
> +	 *
> +	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
> +	 * is not requested and binding is completed synchronously.
> +	 */
> +	struct drm_i915_gem_timeline_fence fence;
> +
> +	/**
> +	 * @extensions: Zero-terminated chain of extensions.
> +	 *
> +	 * For future extensions. See struct i915_user_extension.
> +	 */
> +	__u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
> + *
> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU vir=
tual
> + * address (VA) range that should be unbound from the device page table =
of the
> + * specified address space (VM). VM_UNBIND will force unbind the specifi=
ed
> + * range from device page table without waiting for any GPU job to compl=
ete.
> + * It is UMDs responsibility to ensure the mapping is no longer in use b=
efore
> + * calling VM_UNBIND.
> + *
> + * If the specified mapping is not found, the ioctl will simply return w=
ithout
> + * any error.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurre=
ntly
> + * are not ordered. Furthermore, parts of the VM_UNBIND operation can be=
 done
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_unbind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @rsvd: Reserved, MBZ */
> +	__u32 rsvd;
> +
> +	/** @start: Virtual Address start to unbind */
> +	__u64 start;
> +
> +	/** @length: Length of mapping to unbind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Currently reserved, MBZ.
> +	 *
> +	 * Note that @fence carries its own flags.
> +	 */
> +	__u64 flags;
> +
> +	/**
> +	 * @fence: Timeline fence for unbind completion signaling.
> +	 *
> +	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
> +	 *
> +	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
> +	 * is invalid, and an error will be returned.
> +	 *
> +	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
> +	 * is not requested and unbinding is completed synchronously.
> +	 */
> +	struct drm_i915_gem_timeline_fence fence;
> +
> +	/**
> +	 * @extensions: Zero-terminated chain of extensions.
> +	 *
> +	 * For future extensions. See struct i915_user_extension.
> +	 */
> +	__u64 extensions;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

--=20
Jani Nikula, Intel Open Source Graphics Center
