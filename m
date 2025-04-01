Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A62A776B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF0210E50B;
	Tue,  1 Apr 2025 08:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZQA2uNqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA1010E50B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743497113;
 bh=YF4G+p+7QBPfKAf5dJnapBtmYSfKZnmkA92wagyKKt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZQA2uNqWK6plnEMJDJcdLzk/N5njojaG5enO8sfiUJAieBxdb7poSsUKgNp0qH0Aq
 VgB5wFNPS4lEZhnbLLrv7oK2urgfDMH796cxGLoWEzitu+cPlv+7szbDtIyaRVSnr8
 NnX0p49JAWNkZL8t6ULH9HL4+GDB18rIAuFHKmCaoo1uAX+HKjpDSDye5yAEM2YF3+
 sREp+5ciMpY4XbHtZmxV00sz/nA9EFAevhycJlLYh+a0zDR71RHRL7PH3Mj6Su79f0
 5b11tWEwJqf/T7aLr3hk06U1z9hebS1o7lgX6GqOeSKiFapefZAZOUnX9KQAvcWVTB
 ZjuTvF29q39cg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F07417E0FAF;
 Tue,  1 Apr 2025 10:45:13 +0200 (CEST)
Date: Tue, 1 Apr 2025 10:45:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 2/6] drm/shmem: Introduce the notion of sparse
 objects
Message-ID: <20250401104508.684dddaf@collabora.com>
In-Reply-To: <20250326021433.772196-3-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
 <20250326021433.772196-3-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Mar 2025 02:14:22 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Sparse DRM objects will store their backing pages in an xarray, to avoid
> the overhead of preallocating a huge struct page pointer array when only
> a very small range of indices might be assigned.
>=20
> For now, only the definition of a sparse object as a union alternative
> to a 'dense' object is provided, with functions that exploit it being
> part of later commits.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 68 +++++++++++++++++++++++++-
>  include/drm/drm_gem_shmem_helper.h     | 23 ++++++++-
>  2 files changed, 88 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index d99dee67353a..5f75eb1230f6 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -128,6 +128,31 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
> +/**
> + * drm_gem_shmem_create_sparse - Allocate a sparse object with the given=
 size
> + * @dev: DRM device
> + * @size: Size of the sparse object to allocate
> + *
> + * This function creates a sparse shmem GEM object.
> + *
> + * Returns:
> + * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded ne=
gative
> + * error code on failure.
> + */
> +struct drm_gem_shmem_object *drm_gem_shmem_create_sparse(struct drm_devi=
ce *dev, size_t size)
> +{
> +	struct drm_gem_shmem_object *shmem =3D
> +		__drm_gem_shmem_create(dev, size, false, NULL);
> +
> +	if (!IS_ERR(shmem)) {
> +		shmem->sparse =3D true;
> +		xa_init_flags(&shmem->xapages, XA_FLAGS_ALLOC);
> +	}
> +
> +	return shmem;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_create_sparse);
> +
>  /**
>   * drm_gem_shmem_create_with_mnt - Allocate an object with the given siz=
e in a
>   * given mountpoint
> @@ -173,8 +198,8 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *=
shmem)
>  			sg_free_table(shmem->sgt);
>  			kfree(shmem->sgt);
>  		}
> -		if (shmem->pages)
> -			drm_gem_shmem_put_pages(shmem);
> +
> +		drm_gem_shmem_put_pages(shmem);
> =20
>  		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> =20
> @@ -196,6 +221,12 @@ static int drm_gem_shmem_get_pages(struct drm_gem_sh=
mem_object *shmem)
>  	if (shmem->pages_use_count++ > 0)
>  		return 0;
> =20
> +	/* We only allow increasing the user count in the case of
> +	 * sparse shmem objects with some backed pages for now
> +	 */
> +	if (shmem->sparse && xa_empty(&shmem->xapages))
> +		return -EINVAL;
> +
>  	pages =3D drm_gem_get_pages(obj);
>  	if (IS_ERR(pages)) {
>  		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
> @@ -231,6 +262,14 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_ob=
ject *shmem)
> =20
>  	dma_resv_assert_held(shmem->base.resv);
> =20
> +	if (!shmem->sparse) {
> +		if (!shmem->pages)
> +			return;
> +	} else {
> +		/* Not implemented yet */
> +		return;
> +	}
> +
>  	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
>  		return;
> =20
> @@ -404,8 +443,15 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_objec=
t *shmem,
>  {
>  	struct drm_gem_object *obj =3D &shmem->base;
> =20
> +	if (shmem->sparse) {
> +		drm_err(obj->dev, "UM unmapping of sparse shmem objects not implemente=
d\n");
> +		return;
> +	}
> +
>  	if (drm_gem_is_imported(obj)) {
>  		dma_buf_vunmap(obj->dma_buf, map);
> +	} else if (obj->import_attach) {
> +		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>  	} else {
>  		dma_resv_assert_held(shmem->base.resv);
> =20
> @@ -541,6 +587,12 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_faul=
t *vmf)
>  	struct page *page;
>  	pgoff_t page_offset;
> =20
> +	/* TODO: Implement UM mapping of sparse shmem objects */
> +	if (drm_WARN_ON(obj->dev, shmem->sparse)) {
> +		drm_err(obj->dev, "UM mapping of sparse shmem objects not implemented\=
n");
> +		return VM_FAULT_SIGBUS;
> +	}
> +
>  	/* We don't use vmf->pgoff since that has the fake offset */
>  	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> =20
> @@ -566,8 +618,14 @@ static void drm_gem_shmem_vm_open(struct vm_area_str=
uct *vma)
>  	struct drm_gem_object *obj =3D vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	/* TODO: Implement UM mapping of sparse shmem objects */
> +	if (drm_WARN_ON(obj->dev, shmem->sparse))
> +		return;
> +
>  	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
> =20
> +	drm_WARN_ON(obj->dev, obj->import_attach);
> +
>  	dma_resv_lock(shmem->base.resv, NULL);
> =20
>  	/*
> @@ -690,6 +748,9 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct dr=
m_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj =3D &shmem->base;
> =20
> +	if (drm_WARN_ON(obj->dev, shmem->sparse))
> +		return ERR_PTR(-EINVAL);
> +
>  	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
> =20
>  	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_=
SHIFT);
> @@ -702,6 +763,9 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_l=
ocked(struct drm_gem_shmem_
>  	int ret;
>  	struct sg_table *sgt;
> =20
> +	if (drm_WARN_ON(obj->dev, shmem->sparse))
> +		return ERR_PTR(-EINVAL);
> +
>  	if (shmem->sgt)
>  		return shmem->sgt;
> =20
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index cef5a6b5a4d6..00e47512b30f 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -6,6 +6,7 @@
>  #include <linux/fs.h>
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
> +#include <linux/xarray.h>
> =20
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> @@ -29,7 +30,10 @@ struct drm_gem_shmem_object {
>  	/**
>  	 * @pages: Page table
>  	 */
> -	struct page **pages;
> +	union {
> +		struct page **pages;
> +		struct xarray xapages;
> +	};

I've played with this code, and I must admit I'm not a huge fan of this
union. It's just super easy to forget an

   if (is_xarray) do_this else do_that

in one of the path, and end up accessing the wrong type without even
noticing (or noticing late).

I'd rather go for an drm_gem_shmem_sparse_backing object, and have an
optional pointer to this sparse_backing object in drm_gem_shmem_object.
I actually tried this approach here [1], and it seems to work.

> =20
>  	/**
>  	 * @pages_use_count:
> @@ -91,12 +95,18 @@ struct drm_gem_shmem_object {
>  	 * @map_wc: map object write-combined (instead of using shmem defaults).
>  	 */
>  	bool map_wc : 1;
> +
> +	/**
> +	 * @sparse: the object is only partially backed by pages
> +	 */
> +	bool sparse : 1;
>  };
> =20
>  #define to_drm_gem_shmem_obj(obj) \
>  	container_of(obj, struct drm_gem_shmem_object, base)
> =20
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev=
, size_t size);
> +struct drm_gem_shmem_object *drm_gem_shmem_create_sparse(struct drm_devi=
ce *dev, size_t size);
>  struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_de=
vice *dev,
>  							   size_t size,
>  							   struct vfsmount *gemfs);
> @@ -210,6 +220,10 @@ static inline struct sg_table *drm_gem_shmem_object_=
get_sg_table(struct drm_gem_
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	/* Use the specific sparse shmem get_sg_table function instead */
> +	if (WARN_ON(shmem->sparse))
> +		return ERR_PTR(-EINVAL);
> +
>  	return drm_gem_shmem_get_sg_table(shmem);
>  }
> =20
> @@ -229,6 +243,10 @@ static inline int drm_gem_shmem_object_vmap(struct d=
rm_gem_object *obj,
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	/* TODO: Implement kernel mapping of sparse shmem objects */
> +	if (WARN_ON(shmem->sparse))
> +		return -EACCES;
> +

Okay, this is where things start to get messy. Sparse objects support a
subset of the features supported by regular shmem objects, which
not only makes the code error-prone, but makes it hard for people to
guess what a vmap/get_pages/sgt/... implementation should do. I think
we should define it right now, and IMO, the simpler is to just assume
that sparse objects, when operated as regular objects, provide the same
functionality. That is:

- vmap will populate all pages, pin them, and vmap them
- get_pages will populate all pages
- get_sgt will populate all pages and instantiate an sgt covering the
  whole GEM
- ...

Of course, this means that sparse objects are pointless when operated as
regular objects, but it makes them safe to use, and if we want to
discourage people to call vmap/get_pages/... on a sparse object, we can
always add a drm_warn() in those places.

>  	return drm_gem_shmem_vmap(shmem, map);
>  }
> =20
> @@ -263,6 +281,9 @@ static inline int drm_gem_shmem_object_mmap(struct dr=
m_gem_object *obj, struct v
>  {
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> =20
> +	if (shmem->sparse)
> +		return -EACCES;
> +
>  	return drm_gem_shmem_mmap(shmem, vma);
>  }
> =20

[1]https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/16/diffs?=
commit_id=3Dec08f6c7a728bc6bfc8031ab5fd67ffe92453726
