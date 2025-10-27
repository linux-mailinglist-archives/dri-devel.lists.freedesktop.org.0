Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD2C0D2B4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A84410E041;
	Mon, 27 Oct 2025 11:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Duqz18ML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9864010E041
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:38:24 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-7815092cd0bso55450167b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761565103; x=1762169903;
 darn=lists.freedesktop.org; 
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kM2IZ9cwj+UJLgsANeLqvUwZb/NBB1zAaY/ie/RunGc=;
 b=Duqz18MLDQZJ5msE4BD7EeIzzQ2Xmde92iK0GAj5kgHkZyyFNrovHIAzeY8+raDWw5
 MPKrCcm/Xu0NYTNVOiIukagtn10pYJlEuBLvbGiMW5szOuYkCwwAzXs983+jVVTYmg8w
 DPQ2Zj6qx55YuIOidEOF8+DkYJ2mzVVb7ony/S8L9z5ncjjUWeJKf4ridFv0kZgdg7/F
 HS5hOH5DMjckyTM4ZvhEyXqJ8PSM05y0Eid7sed+Eac+5PyxAwgvej63fohyWLDbk4tc
 EGD8jhnuaboV5KPT6ShdJNz12NL40KQx+6VT/2N0McWXYS/Z1tI/yktSQQJZZAbsQHUa
 XysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761565103; x=1762169903;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kM2IZ9cwj+UJLgsANeLqvUwZb/NBB1zAaY/ie/RunGc=;
 b=Lcxh1eriNLp4cwQiiQgHyi+3ZFUcKX3T2u2bheZQxAKv8CadMrCQv63YBU57sjwRTw
 Qzy3ucfN+Csa7Ef68rprCphLI9GbpKVn/xifylLE4T9EjfBByj7+0vcTIDjPBn7V9uF+
 3LHUJ+N9p7vVIjiHWnmhJ/fJ0jiLth+mZ8g401MnLLUaIzq/COQzLNK+LPhE6gD7XFiO
 +AYrd2svaAALq+UsD9MzdFBCXB6dwzqpg8V9mAXxcmYYhmBiibmC5C3h7ALfpjaX3Z7E
 tgx6hWvnwi1NP0WBpt5RJUNiFDY9bXPUbCOR5myOJoSmzBNVjNJB88FOUTJNduQQ9h9L
 2LUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeioVcj6lDqL6wT+yx6z/3zkdTnGty3OwrRNO1o01MxoeKQTdbHDD4ZZ3iteE3+8z+cLmo27BeGjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5uC4yz1Mwxr6Sw6plTnjHY6q2c7OOgsdiNg0zh1cfgwhFFdSb
 UCopc7pknGX8nXuuZWCRgIRCaTD4BwbLG5vEeWq5LYnZu2Dy2Gc+V6qgH99HtbGgPg==
X-Gm-Gg: ASbGncte96YsNIijCnHH+/krTzCHIvizc5+5H7MS/5yInBSURKc6Q1FdDeWK6RkjLQT
 tBx2xo2f7RRc+vEQfDDCFmVYMVmv51zag6HV3sYZYbnvISA3bggvYYiGu2HtKi7gkRn8t2tdHAk
 n9QoOO/+HFijx4taRXp/QTO89vMYj2mT9CBVm6jY06hpYyVFbOUGM+heYW5doeJaGSpQK3YB7Jf
 AAMBH7Yr5swpoSTa7TqxQ/1dD2AMEaF7cQBFC38tdk4fjF0DJs87rGRyYs9zIXrbIMWZChRC0Uk
 C0ucISrdWHd+uztgaCt3Rg1crUepPsYNv4LKkmEW+5gqGVyatS8fQGZDAySUtUif3mGJ1X9kYbE
 DExVyuBFbId3HecMiU2gm1IJY+Bpfp6qzeIZPG2QJaH/4orA14rKZKWlqgSq1Cesi4W5tZVNV06
 CTXOxRbh8kBU3VRHnI1Vsx3QyV/3q185OwkxVHT3NtCcpzlmVF+7XO8+FGB4na
X-Google-Smtp-Source: AGHT+IE4Ub7ALPlx8peQtM84EXgIvuQeQhQB62WRPzDKnIKsnig9v60A6eNZIkmhT0CWSJohULobMg==
X-Received: by 2002:a05:690c:4806:b0:784:8c2c:320e with SMTP id
 00721157ae682-7848c2c3fe4mr478987887b3.34.1761565102322; 
 Mon, 27 Oct 2025 04:38:22 -0700 (PDT)
Received: from darker.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-63f4c4724b9sm2225325d50.27.2025.10.27.04.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:38:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 04:38:18 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>, 
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, 
 =?UTF-8?Q?Miko=C5=82aj_Wasiak?= <mikolaj.wasiak@intel.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Nitin Gote <nitin.r.gote@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Christopher Healy <healych@amazon.com>, 
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, 
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v5 04/12] drm/gem: Introduce drm_gem_get_unmapped_area()
 fop
In-Reply-To: <20251021113049.17242-5-loic.molinari@collabora.com>
Message-ID: <f34bd4ef-5779-b364-0df6-e52f8377b461@google.com>
References: <20251021113049.17242-1-loic.molinari@collabora.com>
 <20251021113049.17242-5-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770367-2004846092-1761565101=:3513"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-2004846092-1761565101=:3513
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 21 Oct 2025, Lo=C3=AFc Molinari wrote:

> mmap() calls on the DRM file pointer currently always end up using
> mm_get_unmapped_area() to get a free mapping region. On builds with
> CONFIG_TRANSPARENT_HUGEPAGE enabled, this isn't ideal for GEM objects
> backed by shmem buffers on mountpoints setting the 'huge=3D' option
> because it can't correctly figure out the potentially huge address
> alignment required.
>=20
> This commit introduces the drm_gem_get_unmapped_area() function which
> is meant to be used as a get_unmapped_area file operation on the DRM
> file pointer to lookup GEM objects based on their fake offsets and get
> a properly aligned region by calling shmem_get_unmapped_area() with
> the right file pointer. If a GEM object isn't available at the given
> offset or if the caller isn't granted access to it, the function falls
> back to mm_get_unmapped_area().
>=20
> This also makes drm_gem_get_unmapped_area() part of the default GEM
> file operations so that all the DRM drivers can benefit from more
> efficient mappings thanks to the huge page fault handler introduced in
> previous commit 'drm/shmem-helper: Add huge page fault handler'.
>=20
> The shmem_get_unmapped_area() function needs to be exported so that
> it can be used from the DRM subsystem.
>=20
> v3:
> - add missing include: 'linux/sched/mm.h'
> - forward to shmem layer in builds with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Seems reasonable, but a couple of minor remarks below.

> ---
>  drivers/gpu/drm/drm_gem.c | 107 ++++++++++++++++++++++++++++++--------
>  include/drm/drm_gem.h     |   4 ++
>  mm/shmem.c                |   1 +
>  3 files changed, 90 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a1a9c828938b..a98d5744cc6c 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -36,6 +36,7 @@
>  #include <linux/module.h>
>  #include <linux/pagemap.h>
>  #include <linux/pagevec.h>
> +#include <linux/sched/mm.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  #include <linux/string_helpers.h>
> @@ -1187,36 +1188,27 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, =
unsigned long obj_size,
>  }
>  EXPORT_SYMBOL(drm_gem_mmap_obj);
> =20
> -/**
> - * drm_gem_mmap - memory map routine for GEM objects
> - * @filp: DRM file pointer
> - * @vma: VMA for the area to be mapped
> - *
> - * If a driver supports GEM object mapping, mmap calls on the DRM file
> - * descriptor will end up here.
> - *
> - * Look up the GEM object based on the offset passed in (vma->vm_pgoff w=
ill
> - * contain the fake offset we created when the GTT map ioctl was called =
on
> - * the object) and map it with a call to drm_gem_mmap_obj().
> - *
> - * If the caller is not granted access to the buffer object, the mmap wi=
ll fail
> - * with EACCES. Please see the vma manager for more information.
> +/*
> + * Look up a GEM object in offset space based on the exact start address=
=2E The
> + * caller must be granted access to the object. Returns a GEM object on =
success
> + * or a negative error code on failure. The returned GEM object needs to=
 be
> + * released with drm_gem_object_put().
>   */
> -int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +static struct drm_gem_object *
> +drm_gem_object_lookup_from_offset(struct file *filp, unsigned long start=
,
> +=09=09=09=09  unsigned long pages)
>  {
>  =09struct drm_file *priv =3D filp->private_data;
>  =09struct drm_device *dev =3D priv->minor->dev;
>  =09struct drm_gem_object *obj =3D NULL;
>  =09struct drm_vma_offset_node *node;
> -=09int ret;
> =20
>  =09if (drm_dev_is_unplugged(dev))
> -=09=09return -ENODEV;
> +=09=09return ERR_PTR(-ENODEV);
> =20
>  =09drm_vma_offset_lock_lookup(dev->vma_offset_manager);
>  =09node =3D drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
> -=09=09=09=09=09=09  vma->vm_pgoff,
> -=09=09=09=09=09=09  vma_pages(vma));
> +=09=09=09=09=09=09  start, pages);
>  =09if (likely(node)) {
>  =09=09obj =3D container_of(node, struct drm_gem_object, vma_node);
>  =09=09/*
> @@ -1235,14 +1227,85 @@ int drm_gem_mmap(struct file *filp, struct vm_are=
a_struct *vma)
>  =09drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
> =20
>  =09if (!obj)
> -=09=09return -EINVAL;
> +=09=09return ERR_PTR(-EINVAL);
> =20
>  =09if (!drm_vma_node_is_allowed(node, priv)) {
>  =09=09drm_gem_object_put(obj);
> -=09=09return -EACCES;
> +=09=09return ERR_PTR(-EACCES);
>  =09}
> =20
> -=09ret =3D drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
> +=09return obj;
> +}
> +
> +/**
> + * drm_gem_get_unmapped_area - get memory mapping region routine for GEM=
 objects
> + * @filp: DRM file pointer
> + * @uaddr: User address hint
> + * @len: Mapping length
> + * @pgoff: Offset (in pages)
> + * @flags: Mapping flags
> + *
> + * If a driver supports GEM object mapping, before ending up in drm_gem_=
mmap(),
> + * mmap calls on the DRM file descriptor will first try to find a free l=
inear
> + * address space large enough for a mapping. Since GEM objects are backe=
d by
> + * shmem buffers, this should preferably be handled by the shmem virtual=
 memory
> + * filesystem which can appropriately align addresses to huge page sizes=
 when
> + * needed.
> + *
> + * Look up the GEM object based on the offset passed in (vma->vm_pgoff w=
ill
> + * contain the fake offset we created) and call shmem_get_unmapped_area(=
) with
> + * the right file pointer.
> + *
> + * If a GEM object is not available at the given offset or if the caller=
 is not
> + * granted access to it, fall back to mm_get_unmapped_area().
> + */
> +unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long=
 uaddr,
> +=09=09=09=09=09unsigned long len, unsigned long pgoff,
> +=09=09=09=09=09unsigned long flags)
> +{
> +=09struct drm_gem_object *obj;
> +=09unsigned long ret;
> +
> +=09obj =3D drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SH=
IFT);
> +=09if (IS_ERR(obj))
> +=09=09return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
> +=09=09=09=09=09    flags);
> +
> +=09ret =3D shmem_get_unmapped_area(obj->filp, uaddr, len, 0, flags);
> +
> +=09drm_gem_object_put(obj);
> +
> +=09return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_get_unmapped_area);

Not something I'll make an issue of, but this does look rather like
a drm EXPORT_SYMBOL() of a shmem EXPORT_SYMBOL_GPL().

Not your intention, I think, and a quick look around suggests some
inconsistency as to whether symbols here are exported _GPL() or not.

Maybe there's good (historical?) reason for which is which, or
maybe it's something maintainers would like to clean up one day.

Please make this one EXPORT_SYMBOL_GPL() if you can.

> +
> +/**
> + * drm_gem_mmap - memory map routine for GEM objects
> + * @filp: DRM file pointer
> + * @vma: VMA for the area to be mapped
> + *
> + * If a driver supports GEM object mapping, mmap calls on the DRM file
> + * descriptor will end up here.
> + *
> + * Look up the GEM object based on the offset passed in (vma->vm_pgoff w=
ill
> + * contain the fake offset we created) and map it with a call to
> + * drm_gem_mmap_obj().
> + *
> + * If the caller is not granted access to the buffer object, the mmap wi=
ll fail
> + * with EACCES. Please see the vma manager for more information.
> + */
> +int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +=09struct drm_gem_object *obj;
> +=09int ret;
> +
> +=09obj =3D drm_gem_object_lookup_from_offset(filp, vma->vm_pgoff,
> +=09=09=09=09=09=09vma_pages(vma));
> +=09if (IS_ERR(obj))
> +=09=09return PTR_ERR(obj);
> +
> +=09ret =3D drm_gem_mmap_obj(obj,
> +=09=09=09       drm_vma_node_size(&obj->vma_node) << PAGE_SHIFT,
>  =09=09=09       vma);
> =20
>  =09drm_gem_object_put(obj);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 8d48d2af2649..7c8bd67d087c 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -469,6 +469,7 @@ struct drm_gem_object {
>  =09.poll=09=09=3D drm_poll,\
>  =09.read=09=09=3D drm_read,\
>  =09.llseek=09=09=3D noop_llseek,\
> +=09.get_unmapped_area=09=3D drm_gem_get_unmapped_area,\
>  =09.mmap=09=09=3D drm_gem_mmap, \
>  =09.fop_flags=09=3D FOP_UNSIGNED_OFFSET
> =20
> @@ -506,6 +507,9 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
>  int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  =09=09     struct vm_area_struct *vma);
>  int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> +unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long=
 uaddr,
> +=09=09=09=09=09unsigned long len, unsigned long pgoff,
> +=09=09=09=09=09unsigned long flags);
> =20
>  /**
>   * drm_gem_object_get - acquire a GEM buffer object reference
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b9081b817d28..612218fc95cb 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2851,6 +2851,7 @@ unsigned long shmem_get_unmapped_area(struct file *=
file,
>  =09=09return addr;
>  =09return inflated_addr;
>  }
> +EXPORT_SYMBOL_GPL(shmem_get_unmapped_area);

As you have it, that export comes under #ifdef CONFIG_SHMEM.

I know parts of drm do "select SHMEM" these days, but you might not
be covered by those: maybe you need a "select SHMEM" in the relevant
Kconfig, or maybe you prefer to duplicate that export line after the
later !CONFIG_SHMEM definitiion of shmem_get_unmapped_area().

Or better, make no export here at all, but drm_gem_get_unmapped_area()
use obj->filp->f_op->get_unmapped_area()?

> =20
>  #ifdef CONFIG_NUMA
>  static int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy=
 *mpol)
> --=20
> 2.47.3
---1463770367-2004846092-1761565101=:3513--
