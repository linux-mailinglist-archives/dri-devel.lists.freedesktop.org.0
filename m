Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD911EE17
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A0F6EE0C;
	Fri, 13 Dec 2019 22:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145C56EE15
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 22:58:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i6so441870edr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PX0L7R2xmOyFl79vE2cdal/0PMCVirGsmSQK8ghPXgk=;
 b=BbSw0iqkPS5K6zAmK/JL04SNtXbaxIgZ0OTFi2wehAgmdBJBT+GjUWCuh/LqTZ+OQ7
 A/AY6NTmZPf8MnQccrC5VnREALQonHkzqou7r8qwUk9MVMa+la5HzI4Dy+hsZP/CYwSK
 rPBomhHCgemE7ufsmmQwZ+TfC08O/anVS2iSclyQlgchGNMSQ1rAXYL93HbiAE/regDH
 vbyMrWVhHAZyvqw7rbXkANbkmB8sw1Vf3hAeXo2KoQoCTPyeDsglMyw4G/0Ue91syKBx
 5T+OQiyrnYxb5sFRiyhHDLW9SPOUrAHOEHqe7y2Dm+AI68okEARlA65b3j099w/egmEE
 y2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PX0L7R2xmOyFl79vE2cdal/0PMCVirGsmSQK8ghPXgk=;
 b=jJRd9teBy+vTPTkNRKXDKo5WEN6AEroTX3cOw5CQZnn1IgnpEW3cuYrDnmN2slqqfP
 pMo/B0skxjIxZTLUvjjo7HlsUsbozpyrpzPws7EqbTJIBrm15QOcLA0lcYx4Cjd2o/Tf
 QDqPqjTm5o6xv3B1kA9t9pX+G+mJyMrejCXqEUMVkD/UA8RvlpW2zYMe34KVw1z5UPUd
 +tWZv23fIIMu+OeuJo3gQ/pKIsYcPata9jXV0j+m7rh6m9ZuAwFNZfORBCiQw5Gk9YSd
 Ni0sRgwDilTCbb4HEylPF+xbVZRQtSfOg3TrZu4kRjvNN5UiHZMH+3b6JfjxwCkNREAO
 3JrA==
X-Gm-Message-State: APjAAAUH3ucv0DcScLqbseMnmYU2Pwu/MoporijxJcSzsAjjQPKx1Y7h
 NiYXUdlYidmsxhMkJmZB8xP4bW6a3JumNIjyz9S5yA==
X-Google-Smtp-Source: APXvYqzHpjYGE1ZZdKAZ2NWjQ5+10mnBjXvHBQdhRQuZFgXrgUKa2HRkFmrG5vz/zdYSqDEXVRB4kmzxmNmJoZS8R0w=
X-Received: by 2002:a17:906:d4a:: with SMTP id r10mr57273ejh.125.1576277933527; 
 Fri, 13 Dec 2019 14:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 13 Dec 2019 16:58:42 -0600
Message-ID: <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, sanjay.k.kumar@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, dave.hansen@intel.com,
 jglisse@redhat.com, jgg@mellanox.com, Daniel Vetter <daniel.vetter@intel.com>,
 dan.j.williams@intel.com, ira.weiny@intel.com
Content-Type: multipart/mixed; boundary="===============1797878423=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1797878423==
Content-Type: multipart/alternative; boundary="0000000000004ba94405999dced8"

--0000000000004ba94405999dced8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 4:07 PM Niranjana Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> Shared Virtual Memory (SVM) runtime allocator support allows
> binding a shared virtual address to a buffer object (BO) in the
> device page table through an ioctl call.
>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sudeep Dutt <sudeep.dutt@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <
> niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig                  | 11 ++++
>  drivers/gpu/drm/i915/Makefile                 |  3 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 58 ++++++++++++++----
>  drivers/gpu/drm/i915/gem/i915_gem_svm.c       | 60 +++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_svm.h       | 22 +++++++
>  drivers/gpu/drm/i915/i915_drv.c               | 21 +++++++
>  drivers/gpu/drm/i915/i915_drv.h               | 22 +++++++
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 +
>  drivers/gpu/drm/i915/i915_gem_gtt.h           | 13 ++++
>  include/uapi/drm/i915_drm.h                   | 27 +++++++++
>  10 files changed, 227 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.c
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.h
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index ba9595960bbe..c2e48710eec8 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -137,6 +137,16 @@ config DRM_I915_GVT_KVMGT
>           Choose this option if you want to enable KVMGT support for
>           Intel GVT-g.
>
> +config DRM_I915_SVM
> +       bool "Enable Shared Virtual Memory support in i915"
> +       depends on STAGING
> +       depends on DRM_I915
> +       default n
> +       help
> +         Choose this option if you want Shared Virtual Memory (SVM)
> +         support in i915. With SVM support, one can share the virtual
> +         address space between a process and the GPU.
> +
>  menu "drm/i915 Debugging"
>  depends on DRM_I915
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index e0fd10c0cfb8..75fe45633779 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -153,6 +153,9 @@ i915-y +=3D \
>           intel_region_lmem.o \
>           intel_wopcm.o
>
> +# SVM code
> +i915-$(CONFIG_DRM_I915_SVM) +=3D gem/i915_gem_svm.o
> +
>  # general-purpose microcontroller (GuC) support
>  obj-y +=3D gt/uc/
>  i915-y +=3D gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 5003e616a1ad..af360238a392 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2836,10 +2836,14 @@ int
>  i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>                            struct drm_file *file)
>  {
> +       struct drm_i915_gem_exec_object2 *exec2_list, *exec2_list_user;
>         struct drm_i915_gem_execbuffer2 *args =3D data;
> -       struct drm_i915_gem_exec_object2 *exec2_list;
> -       struct drm_syncobj **fences =3D NULL;
>         const size_t count =3D args->buffer_count;
> +       struct drm_syncobj **fences =3D NULL;
> +       unsigned int i =3D 0, svm_count =3D 0;
> +       struct i915_address_space *vm;
> +       struct i915_gem_context *ctx;
> +       struct i915_svm_obj *svm_obj;
>         int err;
>
>         if (!check_buffer_count(count)) {
> @@ -2851,15 +2855,46 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev=
,
> void *data,
>         if (err)
>                 return err;
>
> +       ctx =3D i915_gem_context_lookup(file->driver_priv, args->rsvd1);
> +       if (!ctx || !rcu_access_pointer(ctx->vm))
> +               return -ENOENT;
> +
> +       rcu_read_lock();
> +       vm =3D i915_vm_get(ctx->vm);
> +       rcu_read_unlock();
> +
> +alloc_again:
> +       svm_count =3D vm->svm_count;
>         /* Allocate an extra slot for use by the command parser */
> -       exec2_list =3D kvmalloc_array(count + 1, eb_element_size(),
> +       exec2_list =3D kvmalloc_array(count + svm_count + 1,
> eb_element_size(),
>                                     __GFP_NOWARN | GFP_KERNEL);
>         if (exec2_list =3D=3D NULL) {
>                 DRM_DEBUG("Failed to allocate exec list for %zd buffers\n=
",
> -                         count);
> +                         count + svm_count);
>                 return -ENOMEM;
>         }
> -       if (copy_from_user(exec2_list,
> +       mutex_lock(&vm->mutex);
> +       if (svm_count !=3D vm->svm_count) {
> +               mutex_unlock(&vm->mutex);
> +               kvfree(exec2_list);
> +               goto alloc_again;
> +       }
> +
> +       list_for_each_entry(svm_obj, &vm->svm_list, link) {
> +               memset(&exec2_list[i], 0, sizeof(*exec2_list));
> +               exec2_list[i].handle =3D svm_obj->handle;
> +               exec2_list[i].offset =3D svm_obj->offset;
> +               exec2_list[i].flags =3D EXEC_OBJECT_PINNED |
> +                                     EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +               i++;
> +       }
> +       exec2_list_user =3D &exec2_list[i];
> +       args->buffer_count +=3D svm_count;
> +       mutex_unlock(&vm->mutex);
> +       i915_vm_put(vm);
> +       i915_gem_context_put(ctx);
> +
> +       if (copy_from_user(exec2_list_user,
>                            u64_to_user_ptr(args->buffers_ptr),
>                            sizeof(*exec2_list) * count)) {
>                 DRM_DEBUG("copy %zd exec entries failed\n", count);
> @@ -2876,6 +2911,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev,
> void *data,
>         }
>
>         err =3D i915_gem_do_execbuffer(dev, file, args, exec2_list, fence=
s);
> +       args->buffer_count -=3D svm_count;
>
>         /*
>          * Now that we have begun execution of the batchbuffer, we ignore
> @@ -2886,7 +2922,6 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev,
> void *data,
>         if (args->flags & __EXEC_HAS_RELOC) {
>                 struct drm_i915_gem_exec_object2 __user *user_exec_list =
=3D
>                         u64_to_user_ptr(args->buffers_ptr);
> -               unsigned int i;
>
>                 /* Copy the new buffer offsets back to the user's exec
> list. */
>                 /*
> @@ -2900,13 +2935,14 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev=
,
> void *data,
>                         goto end;
>
>                 for (i =3D 0; i < args->buffer_count; i++) {
> -                       if (!(exec2_list[i].offset & UPDATE))
> +                       u64 *offset =3D &exec2_list_user[i].offset;
> +
> +                       if (!(*offset & UPDATE))
>                                 continue;
>
> -                       exec2_list[i].offset =3D
> -                               gen8_canonical_addr(exec2_list[i].offset =
&
> PIN_OFFSET_MASK);
> -                       unsafe_put_user(exec2_list[i].offset,
> -                                       &user_exec_list[i].offset,
> +                       *offset =3D gen8_canonical_addr(*offset &
> +                                                     PIN_OFFSET_MASK);
> +                       unsafe_put_user(*offset, &user_exec_list[i].offse=
t,
>                                         end_user);
>                 }
>  end_user:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_svm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_svm.c
> new file mode 100644
> index 000000000000..882fe56138e2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_svm.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "i915_gem_gtt.h"
> +#include "i915_gem_lmem.h"
> +
> +int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm,
> +                            struct drm_i915_gem_vm_bind *args,
> +                            struct drm_file *file)
> +{
> +       struct i915_svm_obj *svm_obj, *tmp;
> +       struct drm_i915_gem_object *obj;
> +       int ret =3D 0;
> +
> +       obj =3D i915_gem_object_lookup(file, args->handle);
> +       if (!obj)
> +               return -ENOENT;
> +
> +       /* For dgfx, ensure the obj is in device local memory only */
> +       if (IS_DGFX(vm->i915) && !i915_gem_object_is_lmem(obj))
> +               return -EINVAL;
> +
> +       /* FIXME: Need to handle case with unending batch buffers */
> +       if (!(args->flags & I915_GEM_VM_BIND_UNBIND)) {
> +               svm_obj =3D kmalloc(sizeof(*svm_obj), GFP_KERNEL);
> +               if (!svm_obj) {
> +                       ret =3D -ENOMEM;
> +                       goto put_obj;
> +               }
> +               svm_obj->handle =3D args->handle;
> +               svm_obj->offset =3D args->start;
> +       }
> +
> +       mutex_lock(&vm->mutex);
> +       if (!(args->flags & I915_GEM_VM_BIND_UNBIND)) {
> +               list_add(&svm_obj->link, &vm->svm_list);
> +               vm->svm_count++;
> +       } else {
> +               /*
> +                * FIXME: Need to handle case where object is
> migrated/closed
> +                * without unbinding first.
> +                */
> +               list_for_each_entry_safe(svm_obj, tmp, &vm->svm_list,
> link) {
> +                       if (svm_obj->handle !=3D args->handle)
> +                               continue;
> +
> +                       list_del_init(&svm_obj->link);
> +                       vm->svm_count--;
> +                       kfree(svm_obj);
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&vm->mutex);
> +put_obj:
> +       i915_gem_object_put(obj);
> +       return ret;
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_svm.h
> b/drivers/gpu/drm/i915/gem/i915_gem_svm.h
> new file mode 100644
> index 000000000000..d60b35c7d21a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_svm.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_SVM_H
> +#define __I915_GEM_SVM_H
> +
> +#include "i915_drv.h"
> +
> +#if defined(CONFIG_DRM_I915_SVM)
> +int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm,
> +                            struct drm_i915_gem_vm_bind *args,
> +                            struct drm_file *file);
> +#else
> +static inline int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm=
,
> +                                          struct drm_i915_gem_vm_bind
> *args,
> +                                          struct drm_file *file)
> +{ return -ENOTSUPP; }
> +#endif
> +
> +#endif /* __I915_GEM_SVM_H */
> diff --git a/drivers/gpu/drm/i915/i915_drv.c
> b/drivers/gpu/drm/i915/i915_drv.c
> index 2a11f60c4fd2..d452ea8e40b3 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -2680,6 +2680,26 @@ i915_gem_reject_pin_ioctl(struct drm_device *dev,
> void *data,
>         return -ENODEV;
>  }
>
> +static int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +                                 struct drm_file *file)
> +{
> +       struct drm_i915_gem_vm_bind *args =3D data;
> +       struct i915_address_space *vm;
> +       int ret =3D -EINVAL;
> +
> +       vm =3D i915_gem_address_space_lookup(file->driver_priv, args->vm_=
id);
> +       if (unlikely(!vm))
> +               return -ENOENT;
> +
> +       switch (args->type) {
> +       case I915_GEM_VM_BIND_SVM_OBJ:
> +               ret =3D i915_gem_vm_bind_svm_obj(vm, args, file);
> +       }
> +
> +       i915_vm_put(vm);
> +       return ret;
> +}
> +
>  static const struct drm_ioctl_desc i915_ioctls[] =3D {
>         DRM_IOCTL_DEF_DRV(I915_INIT, drm_noop,
> DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>         DRM_IOCTL_DEF_DRV(I915_FLUSH, drm_noop, DRM_AUTH),
> @@ -2739,6 +2759,7 @@ static const struct drm_ioctl_desc i915_ioctls[] =
=3D {
>         DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW)=
,
>         DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl,
> DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl,
> DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl,
> DRM_RENDER_ALLOW),
>  };
>
>  static struct drm_driver driver =3D {
> diff --git a/drivers/gpu/drm/i915/i915_drv.h
> b/drivers/gpu/drm/i915/i915_drv.h
> index ce130e1f1e47..2d0a7cd2dc44 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1909,6 +1909,28 @@ i915_gem_context_lookup(struct
> drm_i915_file_private *file_priv, u32 id)
>         return ctx;
>  }
>
> +static inline struct i915_address_space *
> +__i915_gem_address_space_lookup_rcu(struct drm_i915_file_private
> *file_priv,
> +                                   u32 id)
> +{
> +       return idr_find(&file_priv->vm_idr, id);
> +}
> +
> +static inline struct i915_address_space *
> +i915_gem_address_space_lookup(struct drm_i915_file_private *file_priv,
> +                             u32 id)
> +{
> +       struct i915_address_space *vm;
> +
> +       rcu_read_lock();
> +       vm =3D __i915_gem_address_space_lookup_rcu(file_priv, id);
> +       if (vm)
> +               vm =3D i915_vm_get(vm);
> +       rcu_read_unlock();
> +
> +       return vm;
> +}
> +
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>                                           u64 min_size, u64 alignment,
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c
> b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index be36719e7987..7d4f5fa84b02 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -586,6 +586,7 @@ static void i915_address_space_init(struct
> i915_address_space *vm, int subclass)
>         stash_init(&vm->free_pages);
>
>         INIT_LIST_HEAD(&vm->bound_list);
> +       INIT_LIST_HEAD(&vm->svm_list);
>  }
>
>  static int __setup_page_dma(struct i915_address_space *vm,
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h
> b/drivers/gpu/drm/i915/i915_gem_gtt.h
> index 31a4a96ddd0d..7c1b54c9677d 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
> @@ -285,6 +285,13 @@ struct pagestash {
>         struct pagevec pvec;
>  };
>
> +struct i915_svm_obj {
> +       /** This obj's place in the SVM object list */
> +       struct list_head link;
> +       u32 handle;
> +       u64 offset;
> +};
> +
>  struct i915_address_space {
>         struct kref ref;
>         struct rcu_work rcu;
> @@ -329,6 +336,12 @@ struct i915_address_space {
>          */
>         struct list_head bound_list;
>
> +       /**
> +        * List of SVM bind objects.
> +        */
> +       struct list_head svm_list;
> +       unsigned int svm_count;
> +
>         struct pagestash free_pages;
>
>         /* Global GTT */
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 20314eea632a..e10d7bf2cf9f 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -360,6 +360,7 @@ typedef struct _drm_i915_sarea {
>  #define DRM_I915_GEM_VM_CREATE         0x3a
>  #define DRM_I915_GEM_VM_DESTROY                0x3b
>  #define DRM_I915_GEM_OBJECT_SETPARAM   DRM_I915_GEM_CONTEXT_SETPARAM
> +#define DRM_I915_GEM_VM_BIND           0x3c
>  /* Must be kept compact -- no holes */
>
>  #define DRM_IOCTL_I915_INIT            DRM_IOW( DRM_COMMAND_BASE +
> DRM_I915_INIT, drm_i915_init_t)
> @@ -424,6 +425,7 @@ typedef struct _drm_i915_sarea {
>  #define DRM_IOCTL_I915_GEM_VM_CREATE   DRM_IOWR(DRM_COMMAND_BASE +
> DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
>  #define DRM_IOCTL_I915_GEM_VM_DESTROY  DRM_IOW (DRM_COMMAND_BASE +
> DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
>  #define DRM_IOCTL_I915_GEM_OBJECT_SETPARAM     DRM_IOWR(DRM_COMMAND_BASE
> + DRM_I915_GEM_OBJECT_SETPARAM, struct drm_i915_gem_object_param)
> +#define DRM_IOCTL_I915_GEM_VM_BIND             DRM_IOWR(DRM_COMMAND_BASE
> + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>
>  /* Allow drivers to submit batchbuffers directly to hardware, relying
>   * on the security mechanisms provided by hardware.
> @@ -2300,6 +2302,31 @@ struct drm_i915_query_perf_config {
>         __u8 data[];
>  };
>
> +/**
> + * struct drm_i915_gem_vm_bind
> + *
> + * Bind an object in a vm's page table.
>

First off, this is something I've wanted for a while for Vulkan, it's just
never made its way high enough up the priority list.  However, it's going
to have to come one way or another soon.  I'm glad to see kernel API for
this being proposed.

I do, however, have a few high-level comments/questions about the API:

 1. In order to be useful for sparse memory support, the API has to go the
other way around so that it binds a VA range to a range within the BO.  It
also needs to be able to handle overlapping where two different VA ranges
may map to the same underlying bytes in the BO.  This likely means that
unbind needs to also take a VA range and only unbind that range.

 2. If this is going to be useful for managing GL's address space where we
have lots of BOs, we probably want it to take a list of ranges so we aren't
making one ioctl for each thing we want to bind.

 3. Why are there no ways to synchronize this with anything?  For binding,
this probably isn't really needed as long as the VA range you're binding is
empty.  However, if you want to move bindings around or unbind something,
the only option is to block in userspace and then call bind/unbind.  This
can be done but it means even more threads in the UMD which is unpleasant.
One could argue that that's more or less what the kernel is going to have
to do so we may as well do it in userspace.  However, I'm not 100%
convinced that's true.

--Jason



> + */
> +struct drm_i915_gem_vm_bind {
> +       /** VA start to bind **/
> +       __u64 start;
> +
> +       /** Type of memory to [un]bind **/
> +       __u32 type;
> +#define I915_GEM_VM_BIND_SVM_OBJ      0
> +
> +       /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type *=
*/
> +       __u32 handle;
> +
> +       /** vm to [un]bind **/
> +       __u32 vm_id;
> +
> +       /** Flags **/
> +       __u32 flags;
> +#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
> +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.21.0.rc0.32.g243a4c7e27
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>

--0000000000004ba94405999dced8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2019 at 4:07 PM Niran=
jana Vishwanathapura &lt;<a href=3D"mailto:niranjana.vishwanathapura@intel.=
com">niranjana.vishwanathapura@intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Shared Virtual Memory (SVM) runtime=
 allocator support allows<br>
binding a shared virtual address to a buffer object (BO) in the<br>
device page table through an ioctl call.<br>
<br>
Cc: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.com" =
target=3D"_blank">joonas.lahtinen@linux.intel.com</a>&gt;<br>
Cc: Jon Bloomfield &lt;<a href=3D"mailto:jon.bloomfield@intel.com" target=
=3D"_blank">jon.bloomfield@intel.com</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@intel.com" target=3D"=
_blank">daniel.vetter@intel.com</a>&gt;<br>
Cc: Sudeep Dutt &lt;<a href=3D"mailto:sudeep.dutt@intel.com" target=3D"_bla=
nk">sudeep.dutt@intel.com</a>&gt;<br>
Signed-off-by: Niranjana Vishwanathapura &lt;<a href=3D"mailto:niranjana.vi=
shwanathapura@intel.com" target=3D"_blank">niranjana.vishwanathapura@intel.=
com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 11 ++++<br>
=C2=A0drivers/gpu/drm/i915/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0.../gpu/drm/i915/gem/i915_gem_execbuffer.c=C2=A0 =C2=A0 | 58 ++++++++=
++++++----<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_svm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
0 +++++++++++++++++++<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_svm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
2 +++++++<br>
=C2=A0drivers/gpu/drm/i915/i915_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 21 +++++++<br>
=C2=A0drivers/gpu/drm/i915/i915_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 22 +++++++<br>
=C2=A0drivers/gpu/drm/i915/i915_gem_gtt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/i915/i915_gem_gtt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 13 ++++<br>
=C2=A0include/uapi/drm/i915_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++<br>
=C2=A010 files changed, 227 insertions(+), 11 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.h<br>
<br>
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig<br=
>
index ba9595960bbe..c2e48710eec8 100644<br>
--- a/drivers/gpu/drm/i915/Kconfig<br>
+++ b/drivers/gpu/drm/i915/Kconfig<br>
@@ -137,6 +137,16 @@ config DRM_I915_GVT_KVMGT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Choose this option if you want to enable=
 KVMGT support for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Intel GVT-g.<br>
<br>
+config DRM_I915_SVM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable Shared Virtual Memory support=
 in i915&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on STAGING<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM_I915<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you want Shared Vi=
rtual Memory (SVM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support in i915. With SVM support, one c=
an share the virtual<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address space between a process and the =
GPU.<br>
+<br>
=C2=A0menu &quot;drm/i915 Debugging&quot;<br>
=C2=A0depends on DRM_I915<br>
=C2=A0depends on EXPERT<br>
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile<=
br>
index e0fd10c0cfb8..75fe45633779 100644<br>
--- a/drivers/gpu/drm/i915/Makefile<br>
+++ b/drivers/gpu/drm/i915/Makefile<br>
@@ -153,6 +153,9 @@ i915-y +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_region_lmem.o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_wopcm.o<br>
<br>
+# SVM code<br>
+i915-$(CONFIG_DRM_I915_SVM) +=3D gem/i915_gem_svm.o<br>
+<br>
=C2=A0# general-purpose microcontroller (GuC) support<br>
=C2=A0obj-y +=3D gt/uc/<br>
=C2=A0i915-y +=3D gt/uc/intel_uc.o \<br>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_execbuffer.c<br>
index 5003e616a1ad..af360238a392 100644<br>
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c<br>
@@ -2836,10 +2836,14 @@ int<br>
=C2=A0i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_exec_object2 *exec2_list, *=
exec2_list_user;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_gem_execbuffer2 *args =3D data;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_exec_object2 *exec2_list;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj **fences =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const size_t count =3D args-&gt;buffer_count;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj **fences =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0, svm_count =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_address_space *vm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_gem_context *ctx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_svm_obj *svm_obj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!check_buffer_count(count)) {<br>
@@ -2851,15 +2855,46 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D i915_gem_context_lookup(file-&gt;driver=
_priv, args-&gt;rsvd1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx || !rcu_access_pointer(ctx-&gt;vm))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vm =3D i915_vm_get(ctx-&gt;vm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
+<br>
+alloc_again:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0svm_count =3D vm-&gt;svm_count;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allocate an extra slot for use by the comman=
d parser */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list =3D kvmalloc_array(count + 1, eb_ele=
ment_size(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list =3D kvmalloc_array(count + svm_count=
 + 1, eb_element_size(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __GFP_NOWARN | GFP_KER=
NEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exec2_list =3D=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG(&quot;Fai=
led to allocate exec list for %zd buffers\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0count);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0count + svm_count);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(exec2_list,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;vm-&gt;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (svm_count !=3D vm-&gt;svm_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;v=
m-&gt;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kvfree(exec2_list);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto alloc_again;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(svm_obj, &amp;vm-&gt;svm_li=
st, link) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;exec2_l=
ist[i], 0, sizeof(*exec2_list));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list[i].handl=
e =3D svm_obj-&gt;handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list[i].offse=
t =3D svm_obj-&gt;offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list[i].flags=
 =3D EXEC_OBJECT_PINNED |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXEC_OBJECT_SUPP=
ORTS_48B_ADDRESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exec2_list_user =3D &amp;exec2_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;buffer_count +=3D svm_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;vm-&gt;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i915_vm_put(vm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i915_gem_context_put(ctx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(exec2_list_user,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0u64_to_user_ptr(args-&gt;buffers_ptr),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*exec2_list) * count)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG(&quot;cop=
y %zd exec entries failed\n&quot;, count);<br>
@@ -2876,6 +2911,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, vo=
id *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D i915_gem_do_execbuffer(dev, file, args,=
 exec2_list, fences);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;buffer_count -=3D svm_count;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Now that we have begun execution of the=
 batchbuffer, we ignore<br>
@@ -2886,7 +2922,6 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, vo=
id *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args-&gt;flags &amp; __EXEC_HAS_RELOC) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_gem=
_exec_object2 __user *user_exec_list =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u64_to_user_ptr(args-&gt;buffers_ptr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Copy the new buf=
fer offsets back to the user&#39;s exec list. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
@@ -2900,13 +2935,14 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto end;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; args-&gt;buffer_count; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!(exec2_list[i].offset &amp; UPDATE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u64 *offset =3D &amp;exec2_list_user[i].offset;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!(*offset &amp; UPDATE))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0exec2_list[i].offset =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen8_canonical_addr(exec2_list[i].off=
set &amp; PIN_OFFSET_MASK);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsafe_put_user(exec2_list[i].offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;user=
_exec_list[i].offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*offset =3D gen8_canonical_addr(*offset &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PIN_OFFSET_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsafe_put_user(*offset, &amp;user_exec_list[i].offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end_user=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0end_user:<br>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_svm.c b/drivers/gpu/drm/i915=
/gem/i915_gem_svm.c<br>
new file mode 100644<br>
index 000000000000..882fe56138e2<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_svm.c<br>
@@ -0,0 +1,60 @@<br>
+// SPDX-License-Identifier: MIT<br>
+/*<br>
+ * Copyright =C2=A9 2019 Intel Corporation<br>
+ */<br>
+<br>
+#include &quot;i915_drv.h&quot;<br>
+#include &quot;i915_gem_gtt.h&quot;<br>
+#include &quot;i915_gem_lmem.h&quot;<br>
+<br>
+int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_gem_vm_bind *args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_svm_obj *svm_obj, *tmp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_object *obj;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D i915_gem_object_lookup(file, args-&gt;h=
andle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* For dgfx, ensure the obj is in device local =
memory only */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_DGFX(vm-&gt;i915) &amp;&amp; !i915_gem_o=
bject_is_lmem(obj))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Need to handle case with unending bat=
ch buffers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(args-&gt;flags &amp; I915_GEM_VM_BIND_UNB=
IND)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svm_obj =3D kmalloc=
(sizeof(*svm_obj), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!svm_obj) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto put_obj;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svm_obj-&gt;handle =
=3D args-&gt;handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svm_obj-&gt;offset =
=3D args-&gt;start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;vm-&gt;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(args-&gt;flags &amp; I915_GEM_VM_BIND_UNB=
IND)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;svm_o=
bj-&gt;link, &amp;vm-&gt;svm_list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm-&gt;svm_count++;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME: Need to h=
andle case where object is migrated/closed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * without unbindin=
g first.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry=
_safe(svm_obj, tmp, &amp;vm-&gt;svm_list, link) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (svm_obj-&gt;handle !=3D args-&gt;handle)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0list_del_init(&amp;svm_obj-&gt;link);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vm-&gt;svm_count--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(svm_obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;vm-&gt;mutex);<br>
+put_obj:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i915_gem_object_put(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_svm.h b/drivers/gpu/drm/i915=
/gem/i915_gem_svm.h<br>
new file mode 100644<br>
index 000000000000..d60b35c7d21a<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_svm.h<br>
@@ -0,0 +1,22 @@<br>
+/* SPDX-License-Identifier: MIT */<br>
+/*<br>
+ * Copyright =C2=A9 2019 Intel Corporation<br>
+ */<br>
+<br>
+#ifndef __I915_GEM_SVM_H<br>
+#define __I915_GEM_SVM_H<br>
+<br>
+#include &quot;i915_drv.h&quot;<br>
+<br>
+#if defined(CONFIG_DRM_I915_SVM)<br>
+int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_gem_vm_bind *args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file);<br>
+#else<br>
+static inline int i915_gem_vm_bind_svm_obj(struct i915_address_space *vm,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct drm_i915_gem_vm_bind *args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct drm_file *file)<br>
+{ return -ENOTSUPP; }<br>
+#endif<br>
+<br>
+#endif /* __I915_GEM_SVM_H */<br>
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_dr=
v.c<br>
index 2a11f60c4fd2..d452ea8e40b3 100644<br>
--- a/drivers/gpu/drm/i915/i915_drv.c<br>
+++ b/drivers/gpu/drm/i915/i915_drv.c<br>
@@ -2680,6 +2680,26 @@ i915_gem_reject_pin_ioctl(struct drm_device *dev, vo=
id *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
=C2=A0}<br>
<br>
+static int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem_vm_bind *args =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_address_space *vm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vm =3D i915_gem_address_space_lookup(file-&gt;d=
river_priv, args-&gt;vm_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!vm))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (args-&gt;type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case I915_GEM_VM_BIND_SVM_OBJ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i915_gem_vm=
_bind_svm_obj(vm, args, file);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i915_vm_put(vm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
=C2=A0static const struct drm_ioctl_desc i915_ioctls[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(I915_INIT, drm_noop, DRM_AUTH=
|DRM_MASTER|DRM_ROOT_ONLY),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(I915_FLUSH, drm_noop, DRM_AUT=
H),<br>
@@ -2739,6 +2759,7 @@ static const struct drm_ioctl_desc i915_ioctls[] =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl,=
 DRM_RENDER_ALLOW),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_=
vm_create_ioctl, DRM_RENDER_ALLOW),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem=
_vm_destroy_ioctl, DRM_RENDER_ALLOW),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm=
_bind_ioctl, DRM_RENDER_ALLOW),<br>
=C2=A0};<br>
<br>
=C2=A0static struct drm_driver driver =3D {<br>
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_dr=
v.h<br>
index ce130e1f1e47..2d0a7cd2dc44 100644<br>
--- a/drivers/gpu/drm/i915/i915_drv.h<br>
+++ b/drivers/gpu/drm/i915/i915_drv.h<br>
@@ -1909,6 +1909,28 @@ i915_gem_context_lookup(struct drm_i915_file_private=
 *file_priv, u32 id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctx;<br>
=C2=A0}<br>
<br>
+static inline struct i915_address_space *<br>
+__i915_gem_address_space_lookup_rcu(struct drm_i915_file_private *file_pri=
v,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 id)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return idr_find(&amp;file_priv-&gt;vm_idr, id);=
<br>
+}<br>
+<br>
+static inline struct i915_address_space *<br>
+i915_gem_address_space_lookup(struct drm_i915_file_private *file_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 id)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i915_address_space *vm;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vm =3D __i915_gem_address_space_lookup_rcu(file=
_priv, id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vm)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm =3D i915_vm_get(=
vm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return vm;<br>
+}<br>
+<br>
=C2=A0/* i915_gem_evict.c */<br>
=C2=A0int __must_check i915_gem_evict_something(struct i915_address_space *=
vm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
64 min_size, u64 alignment,<br>
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i91=
5_gem_gtt.c<br>
index be36719e7987..7d4f5fa84b02 100644<br>
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c<br>
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c<br>
@@ -586,6 +586,7 @@ static void i915_address_space_init(struct i915_address=
_space *vm, int subclass)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stash_init(&amp;vm-&gt;free_pages);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_LIST_HEAD(&amp;vm-&gt;bound_list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;svm_list);<br>
=C2=A0}<br>
<br>
=C2=A0static int __setup_page_dma(struct i915_address_space *vm,<br>
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i91=
5_gem_gtt.h<br>
index 31a4a96ddd0d..7c1b54c9677d 100644<br>
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h<br>
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h<br>
@@ -285,6 +285,13 @@ struct pagestash {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pagevec pvec;<br>
=C2=A0};<br>
<br>
+struct i915_svm_obj {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** This obj&#39;s place in the SVM object list=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head link;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
+};<br>
+<br>
=C2=A0struct i915_address_space {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kref ref;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rcu_work rcu;<br>
@@ -329,6 +336,12 @@ struct i915_address_space {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct list_head bound_list;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * List of SVM bind objects.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head svm_list;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int svm_count;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pagestash free_pages;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Global GTT */<br>
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h<br>
index 20314eea632a..e10d7bf2cf9f 100644<br>
--- a/include/uapi/drm/i915_drm.h<br>
+++ b/include/uapi/drm/i915_drm.h<br>
@@ -360,6 +360,7 @@ typedef struct _drm_i915_sarea {<br>
=C2=A0#define DRM_I915_GEM_VM_CREATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3a<=
br>
=C2=A0#define DRM_I915_GEM_VM_DESTROY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x3b<br>
=C2=A0#define DRM_I915_GEM_OBJECT_SETPARAM=C2=A0 =C2=A0DRM_I915_GEM_CONTEXT=
_SETPARAM<br>
+#define DRM_I915_GEM_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3c<=
br>
=C2=A0/* Must be kept compact -- no holes */<br>
<br>
=C2=A0#define DRM_IOCTL_I915_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)<br>
@@ -424,6 +425,7 @@ typedef struct _drm_i915_sarea {<br>
=C2=A0#define DRM_IOCTL_I915_GEM_VM_CREATE=C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND=
_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)<br>
=C2=A0#define DRM_IOCTL_I915_GEM_VM_DESTROY=C2=A0 DRM_IOW (DRM_COMMAND_BASE=
 + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)<br>
=C2=A0#define DRM_IOCTL_I915_GEM_OBJECT_SETPARAM=C2=A0 =C2=A0 =C2=A0DRM_IOW=
R(DRM_COMMAND_BASE + DRM_I915_GEM_OBJECT_SETPARAM, struct drm_i915_gem_obje=
ct_param)<br>
+#define DRM_IOCTL_I915_GEM_VM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915=
_gem_vm_bind)<br>
<br>
=C2=A0/* Allow drivers to submit batchbuffers directly to hardware, relying=
<br>
=C2=A0 * on the security mechanisms provided by hardware.<br>
@@ -2300,6 +2302,31 @@ struct drm_i915_query_perf_config {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u8 data[];<br>
=C2=A0};<br>
<br>
+/**<br>
+ * struct drm_i915_gem_vm_bind<br>
+ *<br>
+ * Bind an object in a vm&#39;s page table.<br></blockquote><div><br></div=
><div>First off, this is something I&#39;ve wanted for a while for Vulkan, =
it&#39;s just never made its way high enough up the priority list.=C2=A0 Ho=
wever, it&#39;s going to have to come one way or another soon.=C2=A0 I&#39;=
m glad to see kernel API for this being proposed.</div><div><br></div><div>=
I do, however, have a few high-level comments/questions about the API:</div=
><div><br></div><div>=C2=A01. In order to be useful for sparse memory suppo=
rt, the API has to go the other way around so that it binds a VA range to a=
 range within the BO.=C2=A0 It also needs to be able to handle overlapping =
where two different VA ranges may map to the same underlying bytes in the B=
O.=C2=A0 This likely means that unbind needs to also take a VA range and on=
ly unbind that range.</div><div><br></div><div>=C2=A02. If this is going to=
 be useful for managing GL&#39;s address space where we have lots of BOs, w=
e probably want it to take a list of ranges so we aren&#39;t making one ioc=
tl for each thing we want to bind.<br></div><div><br></div><div>=C2=A03. Wh=
y are there no ways to synchronize this with anything?=C2=A0 For binding, t=
his probably isn&#39;t really needed as long as the VA range you&#39;re bin=
ding is empty.=C2=A0 However, if you want to move bindings around or unbind=
 something, the only option is to block in userspace and then call bind/unb=
ind.=C2=A0 This can be done but it means even more threads in the UMD which=
 is unpleasant.=C2=A0 One could argue that that&#39;s more or less what the=
 kernel is going to have to do so we may as well do it in userspace.=C2=A0 =
However, I&#39;m not 100% convinced that&#39;s true.</div><div><br></div><d=
iv>--Jason</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+ */<br>
+struct drm_i915_gem_vm_bind {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** VA start to bind **/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Type of memory to [un]bind **/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 type;<br>
+#define I915_GEM_VM_BIND_SVM_OBJ=C2=A0 =C2=A0 =C2=A0 0<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Object handle to [un]bind for I915_GEM_VM_B=
IND_SVM_OBJ type **/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** vm to [un]bind **/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Flags **/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+#define I915_GEM_VM_BIND_UNBIND=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
+#define I915_GEM_VM_BIND_READONLY=C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
+};<br>
+<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.21.0.rc0.32.g243a4c7e27<br>
<br>
_______________________________________________<br>
Intel-gfx mailing list<br>
<a href=3D"mailto:Intel-gfx@lists.freedesktop.org" target=3D"_blank">Intel-=
gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/intel-gfx" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/intel-gfx</a><br>
</blockquote></div></div>

--0000000000004ba94405999dced8--

--===============1797878423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1797878423==--
