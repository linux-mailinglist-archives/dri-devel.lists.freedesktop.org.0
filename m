Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08306A44309
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA7610E6F8;
	Tue, 25 Feb 2025 14:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VYxLhWeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624010E6EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740494371;
 bh=rpxxA6Yp4ev+eJOt8GflBMQ5MWpoeZqXMu5jx+nfPSI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VYxLhWeGs7vboQ/UdPFONGMYVJY8Asc/3yVSZB+lCTT4Xy0KCBOKu19RbbTK96J0v
 znieq7gfA+NCeb+KP9xxpiqTqIkGCVF42jr1PFcJmxst2ccY5epea96pyHeHwGF6sY
 8RsVVuhlOyWi6vCGqTwbhcVBOAx6MFpK4xn6ACWhtOEZeVybP5Sc7Ngo93FAW4PLbX
 QGIeml/b7hPkLy9mBJXbJTB+fnHVMeLZw8cd9B8Vq7oiimavdkgKOroM7IpsGAmYyF
 PfrObZpKHqBAvk+Oy6DoCYppeBNjKOPYL6OENCj2zwHd5W68P/FSWpqWH3p21f1Yhy
 CnZicZaHNFbdA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 169AB17E0DB7;
 Tue, 25 Feb 2025 15:39:31 +0100 (CET)
Date: Tue, 25 Feb 2025 15:39:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven
 Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com
Subject: Re: [RFC PATCH 5/7] drm/shmem: Implement sparse allocation of pages
 for shmem objects
Message-ID: <20250225153925.10443056@collabora.com>
In-Reply-To: <20250218232552.3450939-6-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
 <20250218232552.3450939-6-adrian.larumbe@collabora.com>
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

On Tue, 18 Feb 2025 23:25:35 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a new function that lets drivers allocate pages for a subset of the s=
hmem
> object's virtual address range. Expand the shmem object's definition to i=
nclude
> an RSS field, since it's different from the base GEM object's virtual siz=
e.
>=20
> Add also new function for putting the pages of a sparse page array. There=
 is
> refactorisation potential with drm_gem_put_pages, but it is yet to be dec=
ided
> what this should look like.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c              |  32 +++++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 123 ++++++++++++++++++++++++-
>  include/drm/drm_gem.h                  |   3 +
>  include/drm/drm_gem_shmem_helper.h     |  12 +++
>  4 files changed, 165 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee811764c3df..930c5219e1e9 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -679,6 +679,38 @@ void drm_gem_put_pages(struct drm_gem_object *obj, s=
truct page **pages,
>  }
>  EXPORT_SYMBOL(drm_gem_put_pages);
> =20
> +void drm_gem_put_sparse_xarray(struct xarray *pa, unsigned long idx,
> +				unsigned int npages, bool dirty, bool accessed)

How about renaming that one drm_gem_put_xarray_page_range()? The sparse
property is something decided by the caller IMHO, and this aspect
doesn't necessarily have to leak through the drm_gem API.

> +{
> +	struct folio_batch fbatch;
> +	struct page *page;
> +
> +	folio_batch_init(&fbatch);
> +
> +	xa_for_each(pa, idx, page) {
> +		struct folio *folio =3D page_folio(page);
> +
> +		if (dirty)
> +			folio_mark_dirty(folio);
> +		if (accessed)
> +			folio_mark_accessed(folio);
> +
> +		/* Undo the reference we took when populating the table */
> +		if (!folio_batch_add(&fbatch, folio))
> +			drm_gem_check_release_batch(&fbatch);
> +
> +		xa_erase(pa, idx);
> +
> +		idx +=3D folio_nr_pages(folio) - 1;
> +	}
> +
> +	if (folio_batch_count(&fbatch))
> +		drm_gem_check_release_batch(&fbatch);
> +
> +	WARN_ON((idx+1) !=3D npages);
> +}
> +EXPORT_SYMBOL(drm_gem_put_sparse_xarray);

Since you already expose a helper to return pages in an xarray range,
why not add a helper to allocate/get pages? That's basically
drm_gem_shmem_get_sparse_pages_locked() but without the sgt logic, and
with the xarray passed as an argument (plus a gfp_t argument to specific
allocation constraints).

> +
>  static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>  			  struct drm_gem_object **objs)
>  {
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index d63e42be2d72..40f7f6812195 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -10,7 +10,6 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> -#include <linux/xarray.h>
> =20
>  #ifdef CONFIG_X86
>  #include <asm/set_memory.h>
> @@ -161,6 +160,18 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_wi=
th_mnt(struct drm_device *de
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
> =20
> +static void drm_gem_shmem_put_pages_sparse(struct drm_gem_shmem_object *=
shmem)
> +{
> +	unsigned int n_pages =3D shmem->rss_size / PAGE_SIZE;
> +
> +	drm_WARN_ON(shmem->base.dev, (shmem->rss_size & (PAGE_SIZE - 1)) !=3D 0=
);
> +	drm_WARN_ON(shmem->base.dev, !shmem->sparse);
> +
> +	drm_gem_put_sparse_xarray(&shmem->xapages, 0, n_pages,
> +				   shmem->pages_mark_dirty_on_put,
> +				   shmem->pages_mark_accessed_on_put);
> +}
> +
>  /**
>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>   * @shmem: shmem GEM object to free
> @@ -264,10 +275,15 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_o=
bject *shmem)
>  		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
>  #endif
> =20
> -	drm_gem_put_pages(obj, shmem->pages,
> -			  shmem->pages_mark_dirty_on_put,
> -			  shmem->pages_mark_accessed_on_put);
> -	shmem->pages =3D NULL;
> +	if (!shmem->sparse) {
> +		drm_gem_put_pages(obj, shmem->pages,
> +				  shmem->pages_mark_dirty_on_put,
> +				  shmem->pages_mark_accessed_on_put);
> +		shmem->pages =3D NULL;
> +	} else {
> +		drm_gem_shmem_put_pages_sparse(shmem);
> +		xa_destroy(&shmem->xapages);
> +	}
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_put_pages);
> =20
> @@ -765,6 +781,81 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_=
locked(struct drm_gem_shmem_
>  	return ERR_PTR(ret);
>  }
> =20
> +static struct sg_table *drm_gem_shmem_get_sparse_pages_locked(struct drm=
_gem_shmem_object *shmem,
> +							       unsigned int n_pages,
> +							       pgoff_t page_offset)

Can we keep the page allocation and sgt creation distinct, with a
drm_gem_shmem_sparse_populate_locked() returning an int, and
drm_gem_shmem_sparse_get_sgt_for_range() returning an sgt for a
previously populated range.

> +{
> +	struct drm_gem_object *obj =3D &shmem->base;
> +	gfp_t mask =3D GFP_KERNEL | GFP_NOWAIT;

You shouldn't mix GFP_KERNEL and GFP_NOWAIT, as GFP_KERNEL implies
GFP_RECLAIM.

> +	size_t size =3D n_pages * PAGE_SIZE;
> +	struct address_space *mapping;
> +	struct sg_table *sgt;
> +	struct page *page;
> +	bool first_alloc;
> +	int ret, i;
> +
> +	if (!shmem->sparse)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* If the mapping exists, then bail out immediately */
> +	if (xa_load(&shmem->xapages, page_offset) !=3D NULL)
> +		return ERR_PTR(-EEXIST);

You're only checking the first page here. Maybe we should just
ignore the case where some pages are already populated, and populate
the missing ones. This implies leaving already allocated pages in place
if an error occurs in the middle instead of trying to revert what we've
allocated, but that's probably okay.

> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	first_alloc =3D xa_empty(&shmem->xapages);
> +
> +	mapping =3D shmem->base.filp->f_mapping;
> +	mapping_set_unevictable(mapping);
> +
> +	for (i =3D 0; i < n_pages; i++) {
> +		page =3D shmem_read_mapping_page_nonblocking(mapping, page_offset + i);

Looks like we're mixing the sparse and non-blocking aspects. I'd rather
make the non-blocking property by passing gfp_t flags to this function.

> +		if (IS_ERR(page)) {
> +			ret =3D PTR_ERR(page);
> +			goto err_free_pages;
> +		}
> +
> +		/* Add the page into the xarray */
> +		ret =3D xa_err(xa_store(&shmem->xapages, page_offset + i, page, mask));
> +		if (ret) {
> +			put_page(page);
> +			goto err_free_pages;
> +		}
> +	}
> +
> +	sgt =3D kzalloc(sizeof(*sgt), mask);
> +	if (!sgt) {
> +		ret =3D -ENOMEM;
> +		goto err_free_pages;
> +	}
> +
> +	ret =3D sg_alloc_table_from_page_xarray(sgt, &shmem->xapages, page_offs=
et, n_pages, 0, size, mask);
> +	if (ret)
> +		goto err_free_sgtable;
> +
> +	ret =3D dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> +	if (ret)
> +		goto err_free_sgtable;
> +
> +	if (first_alloc)
> +		shmem->pages_use_count =3D 1;
> +
> +	shmem->rss_size +=3D size;
> +
> +	return sgt;
> +
> +err_free_sgtable:
> +	kfree(sgt);
> +err_free_pages:
> +	while (--i) {
> +		page =3D xa_erase(&shmem->xapages, page_offset + i);
> +		if (drm_WARN_ON(obj->dev, !page))
> +			continue;
> +		put_page(page);
> +	}

Why not call drm_gem_put_sparse_xarray() here?

> +	return ERR_PTR(ret);
> +}
> +
>  /**
>   * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
>   *				 scatter/gather table for a shmem GEM object.
> @@ -796,6 +887,28 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct =
drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
> =20
> +struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem=
_object *shmem,
> +						     unsigned int n_pages, pgoff_t page_offset)
> +{
> +	struct drm_gem_object *obj =3D &shmem->base;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	if (drm_WARN_ON(obj->dev, !shmem->sparse))
> +		return ERR_PTR(-EINVAL);
> +
> +	ret =3D dma_resv_lock(shmem->base.resv, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	sgt =3D drm_gem_shmem_get_sparse_pages_locked(shmem, n_pages, page_offs=
et);

Let's make the page allocation explicit (force the caller to call
drm_gem_shmem_sparse_populate_locked() before this function), and return
an error if pages are not populated in the requested range.

> +
> +	dma_resv_unlock(shmem->base.resv);
> +
> +	return sgt;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sparse_pages_sgt);
> +
>  /**
>   * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
>   *                 another driver's scatter/gather table of pinned pages
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index fdae947682cd..4fd45169a3af 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -38,6 +38,7 @@
>  #include <linux/dma-resv.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/xarray.h>
> =20
>  #include <drm/drm_vma_manager.h>
> =20
> @@ -532,6 +533,8 @@ int drm_gem_create_mmap_offset_size(struct drm_gem_ob=
ject *obj, size_t size);
>  struct page **drm_gem_get_pages(struct drm_gem_object *obj);
>  void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
>  		bool dirty, bool accessed);
> +void drm_gem_put_sparse_xarray(struct xarray *pa, unsigned long idx,
> +				unsigned int npages, bool dirty, bool accessed);
> =20
>  void drm_gem_lock(struct drm_gem_object *obj);
>  void drm_gem_unlock(struct drm_gem_object *obj);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index 902039cfc4ce..fcd84c8cf8e7 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -44,6 +44,14 @@ struct drm_gem_shmem_object {
>  	 */
>  	unsigned int pages_use_count;
> =20
> +	/**
> +	 * @rss_size:
> +	 *
> +	 * Size of the object RSS, in bytes.
> +	 * lifetime.
> +	 */
> +	size_t rss_size;

Let's do that in a separate patch series dealing with memory
accounting for sparse GEMs, if you don't mind. This can probably stay
driver specific until the rest of the changes have been accepted.

> +
>  	/**
>  	 * @madv: State for madvise
>  	 *
> @@ -107,6 +115,7 @@ struct drm_gem_shmem_object {
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
> @@ -138,6 +147,9 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object =
*shmem);
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object =
*shmem);
>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object=
 *shmem);
> =20
> +struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem=
_object *shmem,
> +						     unsigned int n_pages, pgoff_t page_offset);
> +
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);
> =20

