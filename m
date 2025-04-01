Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57124A777DC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884E410E09F;
	Tue,  1 Apr 2025 09:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q/AJLcEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3310E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743500200;
 bh=rMOFWXn3jfg3Zdxsjl6gpVa58m3wu65vUuJ+VLQESNI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q/AJLcEruqR2yd7kbAr9jBM0WjyxKhQteGycE5G7On4GNPJpSgEYd4VugkvnlnbGE
 asNxZ85m1ABq4TUGpU760CN1hP4DD89eatBXRfz2Soxx+2+hdDzsKwtbVvpGPqDZaK
 q5zEwOGNYuXoiv+p5yQhezfQDpPWfUSkLZFgKWsqTrLollyeIBcIB4Zo1Wv/F2C4+W
 25sqEerwzmYtXahfTniqX1K4ZuAX12f4JXZ1Iu45C6kEm1AXyKaSt39gjY8tXCDEEM
 yYOjcegCROdua84z9xJT/Uz6qdN7rgTt3dmh9/bIC5ey1601uLJNcSc47QRyheKXEU
 1yg8RazPCcUdA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C750B17E0CD1;
 Tue,  1 Apr 2025 11:36:39 +0200 (CEST)
Date: Tue, 1 Apr 2025 11:36:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 3/6] drm/shmem: Implement sparse allocation of
 pages for shmem objects
Message-ID: <20250401113636.0bd1de87@collabora.com>
In-Reply-To: <20250326021433.772196-4-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
 <20250326021433.772196-4-adrian.larumbe@collabora.com>
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

On Wed, 26 Mar 2025 02:14:23 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a new function that lets drivers allocate pages for a subset of the
> shmem object's virtual address range, and another function for obtaining
> an SG table from those pages, so that memory can be mapped onto an MMU.
>=20
> Add also a new function for putting the pages of a sparse page array.
>=20
> The sparse allocation function allowed a gfp argument to allow
> allocations other than GFP_KERNEL, in cases where memory allocation can
> race with the shrinker's memory reclaim path
>=20
> There is factorization potential with drm_gem_put_pages and
> drm_get_pages_, but it is yet to be decided what this should look like.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c              | 117 ++++++++++++++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 182 ++++++++++++++++++++++++-
>  include/drm/drm_gem.h                  |   6 +
>  include/drm/drm_gem_shmem_helper.h     |   4 +

Let's split this in two commits: one adding the drm_gem helpers, and
the other one adding support for sparse shmem objects.

>  4 files changed, 303 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..fa9b3f01f9ac 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -679,6 +679,123 @@ void drm_gem_put_pages(struct drm_gem_object *obj, =
struct page **pages,
>  }
>  EXPORT_SYMBOL(drm_gem_put_pages);
> =20
> +/**
> + * drm_get_pages_xarray - helper to allocate backing pages for a GEM obj=
ect
> + * from shmem, and store them in an xarray.
> + * @obj: obj in question
> + * @pa: xarray that holds the backing pages
> + * @page_offset: shmem index of the very first page to allocate
> + * @npages: number of consecutive shmem pages to allocate
> + * @gfp: additional allocation flags
> + *
> + * This reads the page-array of the shmem-backing storage of the given g=
em
> + * object. The input xarray is where the pages are stored. If a page is =
not
> + * allocated or swapped-out, this will allocate/swap-in the required pag=
es.
> + * Only the requested range is covered with physical pages.
> + *
> + * Use drm_gem_put_xarray_page_range() to release the same xarray subset=
 of pages.
> + *
> + * This uses the GFP-mask set on the shmem-mapping (see mapping_set_gfp_=
mask()),
> + * and any further mask bits set in the gfp input parameter.
> + *
> + * This function is only valid on objects initialized with
> + * drm_gem_object_init(), but not for those initialized with
> + * drm_gem_private_object_init() only.
> + */
> +int drm_get_pages_xarray(struct drm_gem_object *obj, struct xarray *pa,
> +			 pgoff_t page_offset, unsigned int npages, gfp_t gfp)

Can we make the names consistent, like drm_gem_{get,put}_page_range().
Same for the arguments we pass to these helpers (same name, same order
for common arguments).

> +{
> +	struct address_space *mapping;
> +	struct page *page;
> +	int ret =3D 0;
> +	int i;
> +
> +	if (WARN_ON(!obj->filp))
> +		return -EINVAL;
> +
> +	/* This is the shared memory object that backs the GEM resource */
> +	mapping =3D obj->filp->f_mapping;
> +
> +	/* We already BUG_ON() for non-page-aligned sizes in
> +	 * drm_gem_object_init(), so we should never hit this unless
> +	 * driver author is doing something really wrong:
> +	 */
> +	WARN_ON((obj->size & (PAGE_SIZE - 1)) !=3D 0);
> +
> +	mapping =3D obj->filp->f_mapping;
> +	mapping_set_unevictable(mapping);
> +
> +	for (i =3D 0; i < npages; i++) {
> +		page  =3D shmem_read_mapping_page_gfp(mapping, page_offset + i,
> +						    mapping_gfp_mask(mapping) | gfp);

I don't think that works. For instance we need something like:

		gfp_t page_gfp =3D mapping_gfp_constraint(mapping, ~__GFP_RECLAIM);
		page_gfp |=3D __GFP_NORETRY | __GFP_WARN;

for non-blocking allocation. But I'm not even sure we should
let the user wants to modify the mapping flags. How about
we just get a gfp_t page_flag from the caller.

> +		if (IS_ERR(page)) {
> +			ret =3D PTR_ERR(page);
> +			goto err_free_pages;
> +		}
> +
> +		/* Add the page into the xarray */
> +		ret =3D xa_err(xa_store(pa, page_offset + i, page, gfp));

We probably don't want the same flags for other allocations,
so I'd recommend take a gfp_t other_gfp argument for anything
that's not a shmem page allocation.

> +		if (ret) {
> +			put_page(page);
> +			goto err_free_pages;
> +		}
> +	}
> +
> +	return ret;
> +
> +err_free_pages:
> +	while (--i) {
> +		page =3D xa_erase(pa, page_offset + i);
> +		if (drm_WARN_ON(obj->dev, !page))
> +			continue;
> +		put_page(page);

I'd rather use shmem_read_folio_gfp() with a folio_batch to
release the folios that were acquired in the main loop, like we
do in drm_gem_get_pages(). Actually, I'm not sure we want to
release those pages when we populate a GEM range, because
suddenly you have to check if the page was already present, and
only release it if it's been added in this call. Or you have
to reject requests to populate regions that overlap with already
populated regions.

It's simpler if we define a slightly different semantics for
drm_gem_get_page_range(): in case of failure, the pages already
populated are kept, and the user should call drm_gem_put_page_range()
to release those.

> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_get_pages_xarray);
> +
> +/**
> + * drm_gem_put_xarray_page_range - helper to free some backing pages for=
 a
> + * sparse GEM object
> + * @pa: xarray that holds the backing pages
> + * @idx: xarray index of the first page tof ree
> + * @npages: number of consecutive pages in the xarray to free
> + * @dirty: if true, pages will be marked as dirty
> + * @accessed: if true, the pages will be marked as accessed
> + */
> +void drm_gem_put_xarray_page_range(struct xarray *pa, unsigned long idx,
> +				   unsigned int npages, bool dirty, bool accessed)

void drm_gem_put_page_range(struct drm_gem_object *obj, struct xarray *pa,
			    pgoff_t page_offset, unsigned int npages)

To be consistent with the getter.


> +{
> +	struct folio_batch fbatch;
> +	struct page *page;
> +
> +	folio_batch_init(&fbatch);
> +

You need to call mapping_clear_unevictable() if you want the folios
you return to be evictable again. This becomes problematic because
evictability is per-GEM, so, you can only flag the mapping as
evictable if no page range remains active.

Luckily, the xarray construct has a concept of marker which we can
use to flag an entry as used, and only when the xarray as a whole
has this marker cleared (!xa_marked(pa, PAGE_USED)), we consider the
mapping as evictable again.

The other option is to consider that all pages are always returned
in one go, but that means we can't do partial reclaim of sparse BOs.
Not sure how much we care about this case though.

> +	xa_for_each(pa, idx, page) {

If you only want to drop the pages in the idx:idx+npages, you need
to use xa_for_each_range(), and if you want to drop all pages, you
need to change the function name and drop the idx and pages arguments.

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

You're leaving pages behind if the folio contains more than one page. Not
a big deal if the intent is to destroy the array, but given it's
not something this function controls, I'd be tempted to not take that
chance.

> +
> +		idx +=3D folio_nr_pages(folio) - 1;
> +	}
> +
> +	if (folio_batch_count(&fbatch))
> +		drm_gem_check_release_batch(&fbatch);
> +
> +	WARN_ON((idx+1) !=3D npages);

How about we allow unmapping a sparsely populate range instead of
complaining here? This would allow one to call
drm_gem_put_page_range(0, UINT_MAX) to mean "drop all pages".

> +}
> +EXPORT_SYMBOL(drm_gem_put_xarray_page_range);
> +
>  static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>  			  struct drm_gem_object **objs)
>  {
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 5f75eb1230f6..1bf33e5a1c4c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -174,6 +174,34 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_wi=
th_mnt(struct drm_device *de
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
> =20
> +static void drm_gem_shmem_put_pages_sparse(struct drm_gem_shmem_object *=
shmem)
> +{
> +	struct page *page;
> +	unsigned long idx;
> +
> +	if (drm_WARN_ON(shmem->base.dev, !shmem->sparse))
> +		return;
> +
> +	idx =3D 0;
> +	xa_for_each(&shmem->xapages, idx, page) {
> +		unsigned long consecutive =3D 1;
> +
> +		if (!page)
> +			continue;
> +
> +		while (xa_load(&shmem->xapages, idx + consecutive))
> +			consecutive++;
> +
> +		drm_gem_put_xarray_page_range(&shmem->xapages, idx, consecutive,
> +					      shmem->pages_mark_dirty_on_put,
> +					      shmem->pages_mark_accessed_on_put);

It really feels like something the drm_gem helper should deal with, instead
of having the shmem helper iterate over the page array to figure out holes
to skip.

> +
> +		idx +=3D consecutive;
> +	}
> +
> +	drm_WARN_ON(shmem->base.dev, !xa_empty(&shmem->xapages));
> +}
> +
>  /**
>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>   * @shmem: shmem GEM object to free
> @@ -266,8 +294,8 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_obj=
ect *shmem)
>  		if (!shmem->pages)
>  			return;
>  	} else {
> -		/* Not implemented yet */
> -		return;
> +		if (xa_empty(&shmem->xapages))
> +			return;
>  	}
> =20
>  	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
> @@ -281,10 +309,15 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_o=
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
> @@ -797,6 +830,103 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt=
_locked(struct drm_gem_shmem_
>  	return ERR_PTR(ret);
>  }
> =20
> +static int
> +drm_gem_shmem_sparse_populate_locked(struct drm_gem_shmem_object *shmem,
> +				     unsigned int n_pages, pgoff_t page_offset,
> +				     gfp_t gfp)
> +{
> +	bool first_alloc;
> +	int ret;
> +
> +	if (!shmem->sparse)
> +		return -EINVAL;
> +
> +	dma_resv_assert_held(shmem->base.resv);

One of the use-case of sparse GEM is to allow alloc-on-fault, where we're
not allowed to block on allocation, but also not allowed to take locks
under which blocking allocations might happen. The GEM resv lock is one
falls in that case, meaning locking around sparse gem population is
something that should be left to the driver, not enforced here.

> +
> +	/* If the mapping exists, then bail out immediately */
> +	if (xa_load(&shmem->xapages, page_offset) !=3D NULL)
> +		return -EEXIST;
> +
> +	first_alloc =3D xa_empty(&shmem->xapages);
> +
> +	ret =3D drm_get_pages_xarray(&shmem->base, &shmem->xapages,
> +				   page_offset, n_pages, gfp);
> +	if (ret)
> +		return ret;
> +
> +	if (first_alloc)
> +		shmem->pages_use_count =3D 1;

I highly recommend that the sparse_backing objects have their own
refcounting, because of the lock issue I mentioned above, and also
because if we decide that sparse GEMs can be used at regular GEMs,
the sparse GEM use/pin_count won't encode the same thing:

- regular GEM count: number of users of a fully mapped sparse GEM
- sparse GEM count: number of users of the sparse GEM, plus one if
  the GEM is also used as a regular GEM, because the regular GEM logic
  is also considered a user of the sparse GEM resources

> +
> +	return 0;
> +}
> +
> +static struct sg_table *
> +drm_gem_shmem_sparse_get_sgt_range(struct drm_gem_shmem_object *shmem,
> +				   unsigned int n_pages, pgoff_t page_offset,
> +				   gfp_t gfp)
> +{
> +	struct drm_gem_object *obj =3D &shmem->base;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	if (drm_WARN_ON(obj->dev, !shmem->sparse))
> +		return ERR_PTR(-EINVAL);
> +
> +	/* If the page range wasn't allocated, then bail out immediately */
> +	if (xa_load(&shmem->xapages, page_offset) =3D=3D NULL)
> +		return ERR_PTR(-EINVAL);
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_NOWAIT);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D sg_alloc_table_from_xarray(sgt, &shmem->xapages, page_offset,
> +					 n_pages, 0, n_pages * PAGE_SIZE, gfp);
> +	if (ret)
> +		goto err_free_sgtable;
> +
> +	ret =3D dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> +	if (ret)
> +		goto err_free_sgtable;
> +
> +	return sgt;
> +
> +err_free_sgtable:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static struct sg_table *
> +drm_gem_shmem_get_sparse_pages_locked(struct drm_gem_shmem_object *shmem,
> +				      unsigned int n_pages, pgoff_t page_offset,
> +				      gfp_t gfp)
> +{
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	if (!shmem->sparse)
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_assert_held(shmem->base.resv);

Same problem I mentioned for pages exist here, because the
sparse sgt will be needed in a path where we not allowed
to take that lock.

> +
> +	ret =3D drm_gem_shmem_sparse_populate_locked(shmem, n_pages, page_offse=
t, gfp);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	sgt =3D drm_gem_shmem_sparse_get_sgt_range(shmem, n_pages, page_offset,=
 gfp);
> +	if (IS_ERR(sgt)) {
> +		ret =3D PTR_ERR(sgt);
> +		goto err_free_pages;
> +	}
> +
> +	return sgt;
> +
> +err_free_pages:
> +	drm_gem_put_xarray_page_range(&shmem->xapages, page_offset,
> +				      n_pages, false, false);
> +	return ERR_PTR(ret);
> +}

I'd be in favor of managing the sgts at the drm_gem_shmem_sparse_backing
level too, because AFAICT, all potential sparse GEM users (panfrost,
panthor and lima) need those, and that's probably good if we can
standardize that too.=20

> +
>  /**
>   * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
>   *				 scatter/gather table for a shmem GEM object.
> @@ -828,6 +958,46 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct =
drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
> =20
> +/**
> + * drm_gem_shmem_get_sparse_pages_sgt - Pin pages, dma map them, and ret=
urn a
> + *				 scatter/gather table for a sparse shmem GEM object.
> + * @shmem: shmem GEM object
> + * @n_pages: number of pages to pin and map
> + * @page_offset: shmem file index of the first page to allocate and map
> + * @gfp: Further allocation flags
> + *
> + * This function conceptually does the same thing as drm_gem_shmem_get_p=
ages_sgt,
> + * but only for a contiguous subset of pages from the underlying shmem f=
ile.
> + * The allocation flags allows users to allocate pages with a mask other=
 than
> + * GFP_KERNEL, in cases where it can race with shmem shrinkers.
> + *
> + * Returns:
> + * A pointer to the scatter/gather table of pinned pages or errno on fai=
lure.
> + */
> +struct sg_table *
> +drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem_object *shmem,
> +				   unsigned int n_pages, pgoff_t page_offset,
> +				   gfp_t gfp)
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
et, gfp);
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
> index 2bf893eabb4b..d8288a119bc3 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -39,6 +39,7 @@
>  #include <linux/dma-resv.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/xarray.h>
> =20
>  #include <drm/drm_vma_manager.h>
> =20
> @@ -534,6 +535,11 @@ struct page **drm_gem_get_pages(struct drm_gem_objec=
t *obj);
>  void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
>  		bool dirty, bool accessed);
> =20
> +int drm_get_pages_xarray(struct drm_gem_object *obj, struct xarray *pa,
> +			 pgoff_t page_offset, unsigned int npages, gfp_t gfp);
> +void drm_gem_put_xarray_page_range(struct xarray *pa, unsigned long idx,
> +				   unsigned int npages, bool dirty, bool accessed);
> +
>  void drm_gem_lock(struct drm_gem_object *obj);
>  void drm_gem_unlock(struct drm_gem_object *obj);
> =20
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index 00e47512b30f..cbe4548e3ff6 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -138,6 +138,10 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object=
 *shmem);
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object =
*shmem);
>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object=
 *shmem);
> =20
> +struct sg_table *drm_gem_shmem_get_sparse_pages_sgt(struct drm_gem_shmem=
_object *shmem,
> +						     unsigned int n_pages, pgoff_t page_offset,
> +						     gfp_t gfp);
> +
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);
> =20

