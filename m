Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F979D022AB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF2910E32A;
	Thu,  8 Jan 2026 10:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rr6q2B9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CE010E32A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767868958;
 bh=wCN038+eXQ5ZDN8ecKZkVcFefgGodotWbERj2Y/afso=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rr6q2B9YP9v1VCukMY+F/WkTlMDOMnvnZdyYTZn+ingJLUIMRqwGSghYSxTwA7ffC
 QqJE9hh8UkKj0wsDbJJWx5A/e/z7jhJq/JJC/cJ3YXc/uKZPXQ1YDmKAlgOj24uLkG
 SbzVDuNy5fU2tB1pdmEJ9Ib97XUo7NFRZcjpQ5VtpWkQgLncTl6xCcZDqM/Hl8d1RQ
 cZo3Gld7CYFrWFHqIv1ANvnS0YLgEVUSSWjCsXefcUqW/YI+cMdDi1zHHnxNRdQ6+Z
 mgKbe7TBogZtKMLB4F1PSjAjiC9mnWYjI4qlU9R3HA4LFA5SadLeFWKcTTdgqtOGrt
 h74iJ6mG3/ESA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8466D17E1330;
 Thu,  8 Jan 2026 11:42:38 +0100 (CET)
Date: Thu, 8 Jan 2026 11:42:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Rob
 Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
Message-ID: <20260108114232.4ff04040@fedora>
In-Reply-To: <bca803d3-692c-4939-a342-e3e018b25823@arm.com>
References: <20260108101025.933843-1-boris.brezillon@collabora.com>
 <bca803d3-692c-4939-a342-e3e018b25823@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 8 Jan 2026 10:28:00 +0000
Steven Price <steven.price@arm.com> wrote:

> Hi Boris,
>=20
> Happy new year!
>=20
> On 08/01/2026 10:10, Boris Brezillon wrote:
> > drm_gem_put_pages(), which we rely on for returning BO pages to shmem,
> > assume per-folio refcounting and not per-page. If we call
> > shmem_read_mapping_page() per-page, we break this assumption and leak
> > pages every time we get a huge page allocated.
> >=20
> > Cc: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> > Fixes: c12e9fcb5a5a ("drm/panfrost: Introduce huge tmpfs mountpoint opt=
ion")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c | 37 +++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/=
panfrost/panfrost_mmu.c
> > index 8f3b7a7b6ad0..9b61ad98a77e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -595,6 +595,7 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
> >  	pgoff_t page_offset;
> >  	struct sg_table *sgt;
> >  	struct page **pages;
> > +	u32 nr_pages;
> > =20
> >  	bomapping =3D addr_to_mapping(pfdev, as, addr);
> >  	if (!bomapping)
> > @@ -613,6 +614,7 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
> >  	addr &=3D ~((u64)SZ_2M - 1);
> >  	page_offset =3D addr >> PAGE_SHIFT;
> >  	page_offset -=3D bomapping->mmnode.start;
> > +	nr_pages =3D bo->base.base.size >> PAGE_SHIFT;
> > =20
> >  	obj =3D &bo->base.base;
> > =20
> > @@ -626,8 +628,7 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
> >  			goto err_unlock;
> >  		}
> > =20
> > -		pages =3D kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
> > -				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
> > +		pages =3D kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL=
 | __GFP_ZERO);
> >  		if (!pages) {
> >  			kvfree(bo->sgts);
> >  			bo->sgts =3D NULL;
> > @@ -650,6 +651,8 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
> >  	mapping_set_unevictable(mapping);
> > =20
> >  	for (i =3D page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> > +		struct folio *folio;
> > +
> >  		/* Can happen if the last fault only partially filled this
> >  		 * section of the pages array before failing. In that case
> >  		 * we skip already filled pages.
> > @@ -657,12 +660,34 @@ static int panfrost_mmu_map_fault_addr(struct pan=
frost_device *pfdev, int as,
> >  		if (pages[i])
> >  			continue;
> > =20
> > -		pages[i] =3D shmem_read_mapping_page(mapping, i);
> > -		if (IS_ERR(pages[i])) {
> > -			ret =3D PTR_ERR(pages[i]);
> > -			pages[i] =3D NULL;
> > +		folio =3D shmem_read_folio(mapping, i);
> > +		if (IS_ERR(folio)) {
> > +			ret =3D PTR_ERR(folio);
> >  			goto err_unlock;
> >  		}
> > +
> > +		/* We always fill the page array at a folio granularity so
> > +		 * there's no reason for a missing page to not be the first
> > +		 * in the folio. We want to ensure that's the case to avoid
> > +		 * unbalanced folio_{get,put}() leading to leaks, because
> > +		 * drm_gem_put_pages() assumes per-folio refcounting not
> > +		 * per-page.
> > +		 */ =20
>=20
> I'm a little uneasy about this reasoning. Above we do mask the address
> to be a multiple of 2MB, but the folio could (in theory at least) be
> bigger than 2MB. So I don't see what stops a GPU job faulting in the
> middle of a buffer and triggering this warning.
>=20
> Can we not walk backwards to the beginning of the folio if the address
> isn't aligned and check that?

Yep, I assumed the heap buffer would be faulted from bottom to top
(which I think is a valid assumption for the tiler, but I might be
wrong). I can certainly revisit the logic to map on both side if we're
in the middle of a folio and drop this WARN_ON().

>=20
> > +		if (WARN_ON(folio_file_page(folio, i) !=3D folio_page(folio, 0))) {
> > +			folio_put(folio);
> > +			ret =3D -EINVAL;
> > +			goto err_unlock;
> > +		}
> > +
> > +		/* Fill a folio worth of pages, even if it goes beyond
> > +		 * NUM_FAULT_PAGES, otherwise we'll end up with unbalanced
> > +		 * refcounting next time we hit an unmapped section crossing
> > +		 * this folio.
> > +		 */
> > +		for (u32 j =3D 0; j < folio_nr_pages(folio) && i < nr_pages; j++) =20
>=20
> This "i < nr_pages" check is wrong - presumably it should be "i + j <
> nr_pages".

Oops, yep. It comes from a version where I was doing

			pages[i++] =3D folio_pages(folio, j);

>=20
> > +			pages[i + j] =3D folio_page(folio, j);
> > +
> > +		i +=3D folio_nr_pages(folio) - 1; =20
>=20
> I feel like the outer for() loop needs reworking into a different form.
> It makes complete sense to walk in terms of folios, but we've got this
> weird mix of pages and folios going on, leading to odd things like this
> "- 1" fix up here.

Yep, I agree. I was initially trying to keep the diff as small as
possible, but it's a bit messy as it is.
