Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC25A8D5F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 07:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310010E58C;
	Thu,  1 Sep 2022 05:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA2A10E58C;
 Thu,  1 Sep 2022 05:31:26 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q81so13709562iod.9;
 Wed, 31 Aug 2022 22:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=cRnnE3akdHseCVOFjZ2mDV45xq2RkT0QoIsqo1ZHHHg=;
 b=gjuIoTED+soxNM3lUOtLhg5U2Qcsdztljd+aLSrw+pZZpX7XAwBm8KpvVf1ZMuP5Xg
 kNXJEFNxoSzfae+mwDhtTFVxhqr6XgTotHnsOw6xr5yuj2TpvDEOgRvASpiSrMs2ewZc
 ZktIoLrg9TMd+fuuuJOGHCfHGOxMAkKMdsRhZl2C/VlLo0zZCrloyfgqzedON/FV2Wrl
 7Gv9rAtFDFonBsq3qPj4nPPaaTiQDy3Y1HlJVem2tRMVr0L9/5jsdPYh1iQmHpHE0JSO
 yPAkv1yRajLAkFGrq5XgLXrEol+aHKM8y1SvtpOqqpKG+Y+FwibT/y08g40ZTR11H5Ea
 0czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cRnnE3akdHseCVOFjZ2mDV45xq2RkT0QoIsqo1ZHHHg=;
 b=0mo2ZaYkFsZoZ/v1HmE5kMOi1QGdQjfUX+Z0BfrDBvSC4D9jVyZxOqWcEybZaoNCiK
 AJ7zDAry2azBws+NXHVIxCxFjYSdouTB/dO0EveH6sCabOoS1MDJjz3Uza6HPydX2yJd
 QeTuA6BM4Gzz3F3jeZ8Y2wXXeOkXkMWU8rbj458qQxuHOAu7cWQS7b62FIiIeDY24qBf
 zf6TRmf5mNS2Yr/PlCTJFGZ/i75Yt+pfpOnV+6CgBCMpLS8nVSWYyESXei66z0QOaG+p
 LlOTxLvbUemOHhjrqhIb2IYud+3Ggeu1YWdJWUcudX/uKide/nqXi+thVjzQsSA3NQ5m
 busQ==
X-Gm-Message-State: ACgBeo3gWfL51pCjsq9MYvYosmTQSJdR9Yzw6SAWGvp27jKSD9OvSx/y
 lbu755Ax0MfA7CYN4XHwz6hOk5IBMG3qKyHtAuU=
X-Google-Smtp-Source: AA6agR7/RPCy779+hSk4jTIeQ1nOhJB0rtPjxvionWct4HZ1E+jwCQMUJ9vxKFEt1W7q1Ixv8aPexUPkTZnQOow9fJo=
X-Received: by 2002:a6b:c343:0:b0:68a:b1d0:3ddf with SMTP id
 t64-20020a6bc343000000b0068ab1d03ddfmr14430682iof.0.1662010285095; Wed, 31
 Aug 2022 22:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-5-andi.shyti@linux.intel.com>
In-Reply-To: <20220827194403.6495-5-andi.shyti@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Sep 2022 15:31:13 +1000
Message-ID: <CAPM=9twz1mcWiVBvNXHeVqg6phF96jNtpwtPp46ncc7yHCBo-w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/17] drm/i915: Implement bind and unbind of object
To: Andi Shyti <andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Aug 2022 at 05:45, Andi Shyti <andi.shyti@linux.intel.com> wrote=
:
>
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
> Implement the bind and unbind of an object at the specified GPU virtual
> addresses.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  21 ++
>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 322 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>  drivers/gpu/drm/i915/i915_vma.c               |   3 +-
>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>  drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>  include/uapi/drm/i915_drm.h                   | 163 +++++++++
>  10 files changed, 543 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 522ef9b4aff32..4e1627e96c6e0 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -165,6 +165,7 @@ gem-y +=3D \
>         gem/i915_gem_ttm_move.o \
>         gem/i915_gem_ttm_pm.o \
>         gem/i915_gem_userptr.o \
> +       gem/i915_gem_vm_bind_object.o \
>         gem/i915_gem_wait.o \
>         gem/i915_gemfs.o
>  i915-y +=3D \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/dr=
m/i915/gem/i915_gem_vm_bind.h
> new file mode 100644
> index 0000000000000..ebc493b7dafc1
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_VM_BIND_H
> +#define __I915_GEM_VM_BIND_H
> +
> +#include "i915_drv.h"
> +
> +struct i915_vma *
> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
> +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
> +
> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +                          struct drm_file *file);
> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> +                            struct drm_file *file);
> +
> +void i915_gem_vm_unbind_vma_all(struct i915_address_space *vm);
> +#endif /* __I915_GEM_VM_BIND_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers=
/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> new file mode 100644
> index 0000000000000..dadd1d4b1761b
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#include <linux/interval_tree_generic.h>
> +
> +#include "gem/i915_gem_vm_bind.h"
> +#include "gem/i915_gem_context.h"
> +#include "gt/gen8_engine_cs.h"
> +
> +#include "i915_drv.h"
> +#include "i915_gem_gtt.h"
> +
> +#define START(node) ((node)->start)
> +#define LAST(node) ((node)->last)
> +
> +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
> +                    START, LAST, static inline, i915_vm_bind_it)
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
> +       lockdep_assert_held(&vm->vm_bind_lock);
> +
> +       return i915_vm_bind_it_iter_first(&vm->va, va, va);
> +}
> +
> +/**
> + * i915_gem_vm_bind_remove() - Remove vma from the vm bind list
> + * @vma: vma that needs to be removed
> + * @release_obj: object to be release or not
> + *
> + * Removes the vma from the vm's lists custom interval tree
> + */
> +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
> +{
> +       lockdep_assert_held(&vma->vm->vm_bind_lock);
> +
> +       if (!list_empty(&vma->vm_bind_link)) {
> +               list_del_init(&vma->vm_bind_link);
> +               i915_vm_bind_it_remove(vma, &vma->vm->va);
> +
> +               /* Release object */
> +               if (release_obj)
> +                       i915_gem_object_put(vma->obj);
> +       }
> +}
> +
> +static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
> +                                 struct i915_vma *vma,
> +                                 struct drm_i915_gem_vm_unbind *va)
> +{
> +       struct drm_i915_gem_object *obj;
> +       int ret;
> +
> +       if (vma) {
> +               obj =3D vma->obj;
> +               i915_vma_destroy(vma);
> +
> +               goto exit;
> +       }
> +
> +       if (!va)
> +               return -EINVAL;
> +
> +       ret =3D mutex_lock_interruptible(&vm->vm_bind_lock);
> +       if (ret)
> +               return ret;
> +
> +       va->start =3D gen8_noncanonical_addr(va->start);
> +       vma =3D i915_gem_vm_bind_lookup_vma(vm, va->start);
> +
> +       if (!vma)
> +               ret =3D -ENOENT;
> +       else if (vma->size !=3D va->length)
> +               ret =3D -EINVAL;
> +
> +       if (ret) {
> +               mutex_unlock(&vm->vm_bind_lock);
> +               return ret;
> +       }
> +
> +       i915_gem_vm_bind_remove(vma, false);
> +
> +       mutex_unlock(&vm->vm_bind_lock);
> +
> +       /* Destroy vma and then release object */
> +       obj =3D vma->obj;
> +       ret =3D i915_gem_object_lock(obj, NULL);
> +       if (ret)
> +               return ret;
> +
> +       i915_vma_destroy(vma);
> +       i915_gem_object_unlock(obj);
> +
> +exit:
> +       i915_gem_object_put(obj);
> +
> +       return 0;
> +}
> +
> +/**
> + * i915_gem_vm_unbind_vma_all() - Unbind all vmas from an address space
> + * @vm: Address spece from which vma binding needs to be removed
> + *
> + * Unbind all userspace requested object binding
> + */
> +void i915_gem_vm_unbind_vma_all(struct i915_address_space *vm)
> +{
> +       struct i915_vma *vma, *t;
> +
> +       list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link=
)
> +               WARN_ON(i915_gem_vm_unbind_vma(vm, vma, NULL));
> +}
> +
> +static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
> +                                       struct drm_i915_gem_object *obj,
> +                                       struct drm_i915_gem_vm_bind *va)
> +{
> +       struct i915_ggtt_view view;
> +       struct i915_vma *vma;
> +
> +       va->start =3D gen8_noncanonical_addr(va->start);
> +       vma =3D i915_gem_vm_bind_lookup_vma(vm, va->start);
> +       if (vma)
> +               return ERR_PTR(-EEXIST);
> +
> +       view.type =3D I915_GGTT_VIEW_PARTIAL;
> +       view.partial.offset =3D va->offset >> PAGE_SHIFT;
> +       view.partial.size =3D va->length >> PAGE_SHIFT;
> +       vma =3D i915_vma_instance(obj, vm, &view);
> +       if (IS_ERR(vma))
> +               return vma;
> +
> +       vma->start =3D va->start;
> +       vma->last =3D va->start + va->length - 1;
> +
> +       return vma;
> +}
> +
> +static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> +                               struct drm_i915_gem_vm_bind *va,
> +                               struct drm_file *file)
> +{
> +       struct drm_i915_gem_object *obj;
> +       struct i915_vma *vma =3D NULL;
> +       struct i915_gem_ww_ctx ww;
> +       u64 pin_flags;
> +       int ret =3D 0;
> +
> +       if (!vm->vm_bind_mode)
> +               return -EOPNOTSUPP;
> +
> +       obj =3D i915_gem_object_lookup(file, va->handle);
> +       if (!obj)
> +               return -ENOENT;
> +
> +       if (!va->length ||
> +           !IS_ALIGNED(va->offset | va->length,
> +                       i915_gem_object_max_page_size(obj->mm.placements,
> +                                                     obj->mm.n_placement=
s)) ||
> +           range_overflows_t(u64, va->offset, va->length, obj->base.size=
)) {
> +               ret =3D -EINVAL;
> +               goto put_obj;
> +       }
> +
> +       ret =3D mutex_lock_interruptible(&vm->vm_bind_lock);
> +       if (ret)
> +               goto put_obj;
> +
> +       vma =3D vm_bind_get_vma(vm, obj, va);
> +       if (IS_ERR(vma)) {
> +               ret =3D PTR_ERR(vma);
> +               goto unlock_vm;
> +       }
> +
> +       for_i915_gem_ww(&ww, ret, true) {
> +retry:
> +               ret =3D i915_gem_object_lock(vma->obj, &ww);
> +               if (ret)
> +                       goto out_ww;
> +
> +               ret =3D i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
> +               if (ret)
> +                       goto out_ww;
> +
> +               /* Make it evictable */
> +               __i915_vma_unpin(vma);
> +
> +               list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
> +               i915_vm_bind_it_insert(vma, &vm->va);
> +
> +out_ww:
> +               if (ret =3D=3D -EDEADLK) {
> +                       ret =3D i915_gem_ww_ctx_backoff(&ww);
> +                       if (!ret)
> +                               goto retry;
> +               } else {
> +                       /* Hold object reference until vm_unbind */
> +                       i915_gem_object_get(vma->obj);
> +               }
> +       }
> +
> +unlock_vm:
> +       mutex_unlock(&vm->vm_bind_lock);
> +
> +put_obj:
> +       i915_gem_object_put(obj);
> +
> +       return ret;
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
> +                          struct drm_file *file)
> +{
> +       struct drm_i915_gem_vm_bind *args =3D data;
> +       struct i915_address_space *vm;
> +       int ret;
> +
> +       vm =3D i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +       if (unlikely(!vm))
> +               return -ENOENT;
> +
> +       ret =3D i915_gem_vm_bind_obj(vm, args, file);
> +
> +       i915_vm_put(vm);
> +       return ret;
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
> +                            struct drm_file *file)
> +{
> +       struct drm_i915_gem_vm_unbind *args =3D data;
> +       struct i915_address_space *vm;
> +       int ret;
> +
> +       vm =3D i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +       if (unlikely(!vm))
> +               return -ENOENT;
> +
> +       ret =3D i915_gem_vm_unbind_vma(vm, NULL, args);
> +
> +       i915_vm_put(vm);
> +       return ret;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/g=
t/intel_gtt.c
> index b67831833c9a3..cb188377b7bd9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -12,6 +12,7 @@
>
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
>         drm_mm_takedown(&vm->mm);
> +       GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
> +       mutex_destroy(&vm->vm_bind_lock);
>  }
>
>  /**
> @@ -204,6 +207,8 @@ static void __i915_vm_release(struct work_struct *wor=
k)
>
>         __i915_vm_close(vm);
>
> +       i915_gem_vm_unbind_vma_all(vm);
> +
>         /* Synchronize async unbinds. */
>         i915_vma_resource_bind_dep_sync_all(vm);
>
> @@ -282,6 +287,11 @@ void i915_address_space_init(struct i915_address_spa=
ce *vm, int subclass)
>
>         INIT_LIST_HEAD(&vm->bound_list);
>         INIT_LIST_HEAD(&vm->unbound_list);
> +
> +       vm->va =3D RB_ROOT_CACHED;
> +       INIT_LIST_HEAD(&vm->vm_bind_list);
> +       INIT_LIST_HEAD(&vm->vm_bound_list);
> +       mutex_init(&vm->vm_bind_lock);
>  }
>
>  void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/g=
t/intel_gtt.h
> index da21088890b3b..06a259475816b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -259,6 +259,15 @@ struct i915_address_space {
>          */
>         struct list_head unbound_list;
>
> +       /** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_l=
ist */
> +       struct mutex vm_bind_lock;
> +       /** @vm_bind_list: List of vm_binding in process */
> +       struct list_head vm_bind_list;
> +       /** @vm_bound_list: List of vm_binding completed */
> +       struct list_head vm_bound_list;
> +       /* @va: tree of persistent vmas */
> +       struct rb_root_cached va;
> +
>         /* Global GTT */
>         bool is_ggtt:1;
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 1332c70370a68..9a9010fd9ecfa 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -68,6 +68,7 @@
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_mman.h"
>  #include "gem/i915_gem_pm.h"
> +#include "gem/i915_gem_vm_bind.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_rc6.h"
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index 2603717164900..092ae4309d8a1 100644
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
>         spin_unlock(&obj->vma.lock);
>         mutex_unlock(&vm->mutex);
>
> +       INIT_LIST_HEAD(&vma->vm_bind_link);
>         return vma;
>
>  err_unlock:
> @@ -290,7 +292,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  {
>         struct i915_vma *vma;
>
> -       GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
>         GEM_BUG_ON(!kref_read(&vm->ref));
>
>         spin_lock(&obj->vma.lock);
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_=
vma.h
> index 33a58f605d75c..15eac55a3e274 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -164,8 +164,6 @@ i915_vma_compare(struct i915_vma *vma,
>  {
>         ptrdiff_t cmp;
>
> -       GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
> -
>         cmp =3D ptrdiff(vma->vm, vm);
>         if (cmp)
>                 return cmp;
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915=
/i915_vma_types.h
> index be6e028c3b57d..f746fecae85ed 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -289,6 +289,20 @@ struct i915_vma {
>         /** This object's place on the active/inactive lists */
>         struct list_head vm_link;
>
> +       /** @vm_bind_link: node for the vm_bind related lists of vm */
> +       struct list_head vm_bind_link;
> +
> +       /** Interval tree structures for persistent vma */
> +
> +       /** @rb: node for the interval tree of vm for persistent vmas */
> +       struct rb_node rb;
> +       /** @start: start endpoint of the rb node */
> +       u64 start;
> +       /** @last: Last endpoint of the rb node */
> +       u64 last;
> +       /** @__subtree_last: last in subtree */
> +       u64 __subtree_last;

Was a drm_mm node considered for this or was it overkill?

Dave.
