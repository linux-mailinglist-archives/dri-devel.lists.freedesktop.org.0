Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E63A43FCF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8331310E68B;
	Tue, 25 Feb 2025 12:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aVy+O3U8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E7710E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740488283;
 bh=zS5Hw3UeuC8nHd8wjWL2hDRFevlh6zPXC72lTu2oi8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aVy+O3U88+psb2OoI2GAKYgl814O3k9dGKGvLi3IIp3n+uu9O4EXZnRIGY4Q5VY5P
 plAZyKKC1rTpYjPHFabexLf+AtnXevh7FmrtNB6cel/lzbhEesr7jiU5CJuJLlLaMu
 y0Pznmm/+Mzn8QEbmWlMtwAKtAqT45gn5q444gzy9GnI5y6sYtcHH/l8Q9cZ1yKWTH
 +pMKsssgDigAOS8kroodXb0PGa5dHzYIi0aWh/wwyxtvW6zWdAOeFnk9T2JT7wGeCp
 JKB3dCOil2uDENFZTxRKtGDb4uWP2pLTT5CIwq7OL6VD51k3GGoltbBwrrOvxVfTbC
 95TxfnpoQ9HtA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7363117E0DD7;
 Tue, 25 Feb 2025 13:58:03 +0100 (CET)
Date: Tue, 25 Feb 2025 13:57:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven
 Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, kernel@collabora.com
Subject: Re: [RFC PATCH 2/7] lib/scatterlist.c: Support constructing sgt
 from page xarray
Message-ID: <20250225135758.7b562f65@collabora.com>
In-Reply-To: <20250218232552.3450939-3-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
 <20250218232552.3450939-3-adrian.larumbe@collabora.com>
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

On Tue, 18 Feb 2025 23:25:32 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> In preparation for a future commit that will introduce sparse allocation =
of
> pages in DRM shmem, a scatterlist function that knows how to deal with an=
 xarray
> collection of memory pages had to be introduced.
>=20
> Because the new function is identical to the existing one that deals with=
 a page
> array, the page_array abstraction is also introduced, which hides the way=
 pages
> are retrieved from a collection.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/linux/scatterlist.h |  47 +++++++++++++
>  lib/scatterlist.c           | 128 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 175 insertions(+)
>=20
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index d836e7440ee8..0045df9c374f 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -48,6 +48,39 @@ struct sg_append_table {
>  	unsigned int total_nents;	/* Total entries in the table */
>  };
> =20
> +struct page_array {
> +	union {
> +		struct page **array;
> +		struct xarray *xarray;
> +	};
> +
> +	struct page *(*get_page)(struct page_array, unsigned int);
> +};
> +
> +static inline struct page *page_array_get_page(struct page_array a,
> +					       unsigned int index)
> +{
> +	return a.array[index];
> +}
> +
> +static inline struct page *page_xarray_get_page(struct page_array a,
> +						unsigned int index)
> +{
> +	return xa_load(a.xarray, index);
> +}
> +
> +#define PAGE_ARRAY(pages)				\
> +	((struct page_array) {				\
> +		.array =3D pages,				\
> +		.get_page =3D page_array_get_page,	\
> +	})
> +
> +#define PAGE_XARRAY(pages)				\
> +	((struct page_array) {				\
> +		.xarray =3D pages,			\
> +		.get_page =3D page_xarray_get_page,	\
> +	})
> +
>  /*
>   * Notes on SG table design.
>   *
> @@ -448,6 +481,20 @@ int sg_alloc_table_from_pages_segment(struct sg_tabl=
e *sgt, struct page **pages,
>  				      unsigned long size,
>  				      unsigned int max_segment, gfp_t gfp_mask);
> =20
> +int sg_alloc_table_from_page_array_segment(struct sg_table *sgt, struct =
page_array pages,
> +					   unsigned int idx, unsigned int n_pages, unsigned int offset,
> +					   unsigned long size, unsigned int max_segment, gfp_t gfp_mask);

The idea behind the page_array object was to avoid code duplication with
no extra-cost at runtime by letting the compiler see through the page
getter function and let it inline its content. If you make the
page_array struct public and pass such an object to
sg_alloc_table_from_page_array_segment() the compiler can no longer
determine that things are fixed, and you turn your direct call (which
is likely to be inlined if compiled with optimizations on) into an
indirect call, which we probably don't want. Besides, I suspect the
caller knows exactly what kind of array it's passing, so I'm not sure
generalizing things at this level is worth it. We're probably better of
adding
sg_alloc_table_from_page_xarray_segment()/sg_alloc_table_from_page_xarray()
helpers and have them defined in scatterlist.c.

> +
> +static inline int sg_alloc_table_from_page_xarray(struct sg_table *sgt, =
struct xarray *pages,
> +						  unsigned int idx, unsigned int n_pages, unsigned int offset,
> +						  unsigned long size, gfp_t gfp_mask)
> +{
> +	struct page_array parray =3D PAGE_XARRAY(pages);
> +
> +	return sg_alloc_table_from_page_array_segment(sgt, parray, idx, n_pages=
, offset,
> +						      size, UINT_MAX, gfp_mask);
> +}
> +
>  /**
>   * sg_alloc_table_from_pages - Allocate and initialize an sg table from
>   *			       an array of pages
> diff --git a/lib/scatterlist.c b/lib/scatterlist.c
> index 5bb6b8aff232..669ebd23e4ad 100644
> --- a/lib/scatterlist.c
> +++ b/lib/scatterlist.c
> @@ -553,6 +553,115 @@ int sg_alloc_append_table_from_pages(struct sg_appe=
nd_table *sgt_append,
>  }
>  EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
> =20
> +static inline int
> +sg_alloc_append_table_from_page_array(struct sg_append_table *sgt_append,
> +				      struct page_array pages,
> +				      unsigned int first_page,
> +				      unsigned int n_pages,
> +				      unsigned int offset, unsigned long size,
> +				      unsigned int max_segment,
> +				      unsigned int left_pages, gfp_t gfp_mask)

You've done that to avoid code duplication, but you're not using
the helper for plain arrays (AKA sg_alloc_append_table_from_pages()),
so the code is duplicated anyway. If de-duplication is the goal, you
should get rid of sg_alloc_append_table_from_pages(), and use
sg_alloc_append_table_from_page_array() instead.

> +{
> +	unsigned int chunks, seg_len, i, prv_len =3D 0;
> +	unsigned int added_nents =3D 0;
> +	struct scatterlist *s =3D sgt_append->prv;
> +	unsigned int cur_pg_index =3D first_page;
> +	unsigned int last_pg_index =3D first_page + n_pages - 1;
> +	struct page *last_pg;
> +
> +	/*
> +	 * The algorithm below requires max_segment to be aligned to PAGE_SIZE
> +	 * otherwise it can overshoot.
> +	 */
> +	max_segment =3D ALIGN_DOWN(max_segment, PAGE_SIZE);
> +	if (WARN_ON(max_segment < PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && sgt_append->prv)
> +		return -EOPNOTSUPP;
> +
> +	if (sgt_append->prv) {
> +		unsigned long next_pfn;
> +		struct page *page;
> +
> +		if (WARN_ON(offset))
> +			return -EINVAL;
> +
> +		/* Merge contiguous pages into the last SG */
> +		page =3D pages.get_page(pages, cur_pg_index);
> +		prv_len =3D sgt_append->prv->length;
> +		next_pfn =3D (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
> +		if (page_to_pfn(page) =3D=3D next_pfn) {
> +			last_pg =3D pfn_to_page(next_pfn - 1);
> +			while (cur_pg_index <=3D last_pg_index &&
> +			       pages_are_mergeable(page, last_pg)) {
> +				if (sgt_append->prv->length + PAGE_SIZE > max_segment)
> +					break;
> +				sgt_append->prv->length +=3D PAGE_SIZE;
> +				last_pg =3D page;
> +				cur_pg_index++;
> +			}
> +			if (cur_pg_index > last_pg_index)
> +				goto out;
> +		}
> +	}
> +
> +	/* compute number of contiguous chunks */
> +	chunks =3D 1;
> +	seg_len =3D 0;
> +	for (i =3D cur_pg_index + 1; i <=3D last_pg_index; i++) {
> +		seg_len +=3D PAGE_SIZE;
> +		if (seg_len >=3D max_segment ||
> +		    !pages_are_mergeable(pages.get_page(pages, i),
> +					 pages.get_page(pages, i - 1))) {
> +			chunks++;
> +			seg_len =3D 0;
> +		}
> +	}
> +
> +	/* merging chunks and putting them into the scatterlist */
> +	for (i =3D 0; i < chunks; i++) {
> +		unsigned int j, chunk_size;
> +
> +		/* look for the end of the current chunk */
> +		seg_len =3D 0;
> +		for (j =3D cur_pg_index + 1; j <=3D last_pg_index; j++) {
> +			seg_len +=3D PAGE_SIZE;
> +			if (seg_len >=3D max_segment ||
> +			    !pages_are_mergeable(pages.get_page(pages, j),
> +						 pages.get_page(pages, j - 1)))
> +				break;
> +		}
> +
> +		/* Pass how many chunks might be left */
> +		s =3D get_next_sg(sgt_append, s, chunks - i + left_pages,
> +				gfp_mask);
> +		if (IS_ERR(s)) {
> +			/*
> +			 * Adjust entry length to be as before function was
> +			 * called.
> +			 */
> +			if (sgt_append->prv)
> +				sgt_append->prv->length =3D prv_len;
> +			return PTR_ERR(s);
> +		}
> +		chunk_size =3D ((j - cur_pg_index) << PAGE_SHIFT) - offset;
> +		sg_set_page(s, pages.get_page(pages, cur_pg_index),
> +			    min_t(unsigned long, size, chunk_size), offset);
> +		added_nents++;
> +		size -=3D chunk_size;
> +		offset =3D 0;
> +		cur_pg_index =3D j;
> +	}
> +	sgt_append->sgt.nents +=3D added_nents;
> +	sgt_append->sgt.orig_nents =3D sgt_append->sgt.nents;
> +	sgt_append->prv =3D s;
> +out:
> +	if (!left_pages)
> +		sg_mark_end(s);
> +	return 0;
> +}
> +
>  /**
>   * sg_alloc_table_from_pages_segment - Allocate and initialize an sg tab=
le from
>   *                                     an array of pages and given maxim=
um
> @@ -596,6 +705,25 @@ int sg_alloc_table_from_pages_segment(struct sg_tabl=
e *sgt, struct page **pages,
>  }
>  EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
> =20
> +int sg_alloc_table_from_page_array_segment(struct sg_table *sgt, struct =
page_array pages,
> +					   unsigned int idx, unsigned int n_pages, unsigned int offset,
> +					   unsigned long size, unsigned int max_segment, gfp_t gfp_mask)
> +{
> +	struct sg_append_table append =3D {};
> +	int err;
> +
> +	err =3D sg_alloc_append_table_from_page_array(&append, pages, idx, n_pa=
ges, offset,
> +						    size, max_segment, 0, gfp_mask);
> +	if (err) {
> +		sg_free_append_table(&append);
> +		return err;
> +	}
> +	memcpy(sgt, &append.sgt, sizeof(*sgt));
> +	WARN_ON(append.total_nents !=3D sgt->orig_nents);
> +	return 0;
> +}
> +EXPORT_SYMBOL(sg_alloc_table_from_page_array_segment);
> +
>  #ifdef CONFIG_SGL_ALLOC
> =20
>  /**

