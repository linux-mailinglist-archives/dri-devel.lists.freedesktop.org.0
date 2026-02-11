Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNkFAyfPjGnbtQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 19:49:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E8126EE6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 19:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632C10E0D5;
	Wed, 11 Feb 2026 18:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US4L/zx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F65410E0C9;
 Wed, 11 Feb 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770835745; x=1802371745;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hFshcYkNCHxpufuYeM+ud+IbQpawpUKjn7KCAT+zV3Q=;
 b=US4L/zx4T71UkbR9MWJZUJFfLXx4MAPnG/xJ3hDeOiFTgnv213a/V0TY
 Qnxztwt0KNk/JRxAeT8Yrz44AXl+CFXexYjSf2aWOMHukLd3vCeOaqt5n
 9kPLHV+GE8DJGdwiWXEcFpbvdFQb4GV5jnzDruSNDpocHMEYHKXVTEOAm
 HyXon7wcg7qvzmH7QwHQhQDyeJRmKrlp7V5L+63x4Hi7rtEy2AI38liTq
 mpteBUDfl+m5XQ0rdjLes0MrQMdTwQS03Gs+H2sZrT5tyvFXe+ntc8QXA
 1hTwPHFrQBuxaxxiWbxF8VAqtw0e9bIn25mpfUe0rql/uPPPgZYoaG/Cf A==;
X-CSE-ConnectionGUID: 7rma/rmxQk22KDo+w/jy8Q==
X-CSE-MsgGUID: BHn/n7e8THaTbh577q0oKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83361203"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83361203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 10:49:04 -0800
X-CSE-ConnectionGUID: KF/CiSnURSSHpcJIO8zPXw==
X-CSE-MsgGUID: cXHvMARkQdarF7p00KG4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211438270"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.235])
 ([10.245.244.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 10:49:03 -0800
Message-ID: <1215d2ec94ecf13944d01bd4de29bf29bd4f8bf7.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/pagemap: Use dma-map IOVA alloc, link, and
 sync API for DRM pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com, 
 himal.prasad.ghimiray@intel.com
Date: Wed, 11 Feb 2026 19:48:59 +0100
In-Reply-To: <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-5-matthew.brost@intel.com>
 <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
 <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 414E8126EE6
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 07:37 -0800, Matthew Brost wrote:
> On Wed, Feb 11, 2026 at 12:34:12PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > > The dma-map IOVA alloc, link, and sync APIs perform significantly
> > > better
> > > than dma-map / dma-unmap, as they avoid costly IOMMU
> > > synchronizations.
> > > This difference is especially noticeable when mapping a 2MB
> > > region in
> > > 4KB pages.
> > >=20
> > > Use the IOVA alloc, link, and sync APIs for DRM pagemap, which
> > > create
> > > DMA
> > > mappings between the CPU and GPU for copying data.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > v4:
> > > =C2=A0- Pack IOVA and drop dummy page (Jason)
> > >=20
> > > =C2=A0drivers/gpu/drm/drm_pagemap.c | 84
> > > +++++++++++++++++++++++++++++----
> > > --
> > > =C2=A01 file changed, 70 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > index 29677b19bb69..52a196bc8459 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -280,6 +280,20 @@ drm_pagemap_migrate_map_device_pages(struct
> > > device *dev,
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * struct drm_pagemap_iova_state - DRM pagemap IOVA state
> > > + *
> >=20
> > No newline=20
> >=20
>=20
> +1
>=20
> > > + * @dma_state: DMA IOVA state.
> > > + * @offset: Current offset in IOVA.
> > > + *
> > > + * This structure acts as an iterator for packing all IOVA
> > > addresses
> > > within a
> > > + * contiguous range.
> > > + */
> > > +struct drm_pagemap_iova_state {
> > > +	struct dma_iova_state dma_state;
> > > +	unsigned long offset;
> > > +};
> > > +
> > > =C2=A0/**
> > > =C2=A0 * drm_pagemap_migrate_map_system_pages() - Map system migratio=
n
> > > pages for GPU SVM migration
> > > =C2=A0 * @dev: The device performing the migration.
> > > @@ -287,6 +301,7 @@ drm_pagemap_migrate_map_device_pages(struct
> > > device *dev,
> > > =C2=A0 * @migrate_pfn: Array of page frame numbers of system pages or
> > > peer
> > > pages to map.
> > > =C2=A0 * @npages: Number of system pages or peer pages to map.
> > > =C2=A0 * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + * @state: DMA IOVA state for mapping.
> > > =C2=A0 *
> > > =C2=A0 * This function maps pages of memory for migration usage in GP=
U
> > > SVM. It
> > > =C2=A0 * iterates over each page frame number provided in
> > > @migrate_pfn,
> > > maps the
> > > @@ -300,9 +315,11 @@ drm_pagemap_migrate_map_system_pages(struct
> > > device *dev,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr
> > > *pagemap_addr,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *migrate_pfn,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_data_direction
> > > dir)
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_data_direction
> > > dir,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > drm_pagemap_iova_state
> > > *state)
> > > =C2=A0{
> > > =C2=A0	unsigned long i;
> > > +	bool try_alloc =3D false;
> > > =C2=A0
> > > =C2=A0	for (i =3D 0; i < npages;) {
> > > =C2=A0		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > @@ -317,9 +334,31 @@ drm_pagemap_migrate_map_system_pages(struct
> > > device *dev,
> > > =C2=A0		folio =3D page_folio(page);
> > > =C2=A0		order =3D folio_order(folio);
> > > =C2=A0
> > > -		dma_addr =3D dma_map_page(dev, page, 0,
> > > page_size(page), dir);
> > > -		if (dma_mapping_error(dev, dma_addr))
> > > -			return -EFAULT;
> > > +		if (!try_alloc) {
> > > +			dma_iova_try_alloc(dev, &state-
> > > >dma_state,
> > > +					=C2=A0=C2=A0 npages * PAGE_SIZE >=3D
> > > +					=C2=A0=C2=A0 HPAGE_PMD_SIZE ?
> > > +					=C2=A0=C2=A0 HPAGE_PMD_SIZE : 0,
> > > +					=C2=A0=C2=A0 npages * PAGE_SIZE);
> > > +			try_alloc =3D true;
> > > +		}
> >=20
> > What happens if dma_iova_try_alloc() fails for all i < some value x
> > and
> > then suddenly succeeds for i =3D=3D x? While the below code looks
> > correct,
>=20
> We only try to alloc on the first valid page - 'i' may be any value
> based on the first page found=C2=A0 or we may never alloc if the number o=
f
> pages found =3D=3D 0 (possible, hence why it is inside the loop). This
> step
> is done at most once. If the allocation fails, we use the map_page
> path
> for the remaining loop iterations.
>=20
> > I figure we'd allocate a too large IOVA region and possibly get the
> > alignment wrong?
>=20
> The first and only IOVA allocation attempts an aligned allocation.
> What
> can happen is only a subset of the IOVA is used for the copy but we
> pack
> in the pages starting at IOVA[0] and end at IOVA[number valid pages -
> 1].
>=20
> Matt

So to be a little nicer on the IOVA allocator we could use the below?

		dma_iova_try_alloc(dev, &state->dma_state,
					   (npages - i) * PAGE_SIZE >=3D
					   HPAGE_PMD_SIZE ?
					   HPAGE_PMD_SIZE : 0,
					   (npages - i) * PAGE_SIZE);

Thanks,
Thomas

>=20
> >=20
> > Otherwise LGTM.
> >=20
> >=20
> > > +
> > > +		if (dma_use_iova(&state->dma_state)) {
> > > +			int err =3D dma_iova_link(dev, &state-
> > > > dma_state,
> > > +						page_to_phys(pag
> > > e),
> > > +						state->offset,
> > > page_size(page),
> > > +						dir, 0);
> > > +			if (err)
> > > +				return err;
> > > +
> > > +			dma_addr =3D state->dma_state.addr +
> > > state-
> > > > offset;
> > > +			state->offset +=3D page_size(page);
> > > +		} else {
> > > +			dma_addr =3D dma_map_page(dev, page, 0,
> > > page_size(page),
> > > +						dir);
> > > +			if (dma_mapping_error(dev, dma_addr))
> > > +				return -EFAULT;
> > > +		}
> > > =C2=A0
> > > =C2=A0		pagemap_addr[i] =3D
> > > =C2=A0			drm_pagemap_addr_encode(dma_addr,
> > > @@ -330,6 +369,9 @@ drm_pagemap_migrate_map_system_pages(struct
> > > device *dev,
> > > =C2=A0		i +=3D NR_PAGES(order);
> > > =C2=A0	}
> > > =C2=A0
> > > +	if (dma_use_iova(&state->dma_state))
> > > +		return dma_iova_sync(dev, &state->dma_state, 0,
> > > state->offset);
> > > +
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > @@ -341,6 +383,7 @@ drm_pagemap_migrate_map_system_pages(struct
> > > device *dev,
> > > =C2=A0 * @pagemap_addr: Array of DMA information corresponding to
> > > mapped
> > > pages
> > > =C2=A0 * @npages: Number of pages to unmap
> > > =C2=A0 * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + * @state: DMA IOVA state for mapping.
> > > =C2=A0 *
> > > =C2=A0 * This function unmaps previously mapped pages of memory for
> > > GPU
> > > Shared Virtual
> > > =C2=A0 * Memory (SVM). It iterates over each DMA address provided in
> > > @dma_addr, checks
> > > @@ -350,10 +393,17 @@ static void
> > > drm_pagemap_migrate_unmap_pages(struct device *dev,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0 struct
> > > drm_pagemap_addr
> > > *pagemap_addr,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0 unsigned long
> > > *migrate_pfn,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0 unsigned long
> > > npages,
> > > -					=C2=A0=C2=A0=C2=A0 enum
> > > dma_data_direction
> > > dir)
> > > +					=C2=A0=C2=A0=C2=A0 enum
> > > dma_data_direction
> > > dir,
> > > +					=C2=A0=C2=A0=C2=A0 struct
> > > drm_pagemap_iova_state *state)
> > > =C2=A0{
> > > =C2=A0	unsigned long i;
> > > =C2=A0
> > > +	if (state && dma_use_iova(&state->dma_state)) {
> > > +		dma_iova_unlink(dev, &state->dma_state, 0,
> > > state-
> > > > offset, dir, 0);
> > > +		dma_iova_free(dev, &state->dma_state);
> > > +		return;
> > > +	}
> > > +
> > > =C2=A0	for (i =3D 0; i < npages;) {
> > > =C2=A0		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > =C2=A0
> > > @@ -406,7 +456,7 @@ drm_pagemap_migrate_remote_to_local(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devmem->pre_migrate_fen=
ce);
> > > =C2=A0out:
> > > =C2=A0	drm_pagemap_migrate_unmap_pages(remote_device,
> > > pagemap_addr,
> > > local_pfns,
> > > -					npages,
> > > DMA_FROM_DEVICE);
> > > +					npages, DMA_FROM_DEVICE,
> > > NULL);
> > > =C2=A0	return err;
> > > =C2=A0}
> > > =C2=A0
> > > @@ -416,11 +466,13 @@ drm_pagemap_migrate_sys_to_dev(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *local_page=
s[],
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr
> > > pagemap_addr[],
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_devmem_ops
> > > *ops)
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_devmem_ops
> > > *ops,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_iova_stat=
e
> > > *state)
> > > =C2=A0{
> > > =C2=A0	int err =3D drm_pagemap_migrate_map_system_pages(devmem-
> > > >dev,
> > > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > pagemap_addr,
> > > sys_pfns,
> > > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 npages,
> > > DMA_TO_DEVICE);
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 npages,
> > > DMA_TO_DEVICE,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state);
> > > =C2=A0
> > > =C2=A0	if (err)
> > > =C2=A0		goto out;
> > > @@ -429,7 +481,7 @@ drm_pagemap_migrate_sys_to_dev(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0				=C2=A0 devmem->pre_migrate_fence);
> > > =C2=A0out:
> > > =C2=A0	drm_pagemap_migrate_unmap_pages(devmem->dev,
> > > pagemap_addr,
> > > sys_pfns, npages,
> > > -					DMA_TO_DEVICE);
> > > +					DMA_TO_DEVICE, state);
> > > =C2=A0	return err;
> > > =C2=A0}
> > > =C2=A0
> > > @@ -457,6 +509,7 @@ static int drm_pagemap_migrate_range(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > migrate_range_loc
> > > *cur,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_migrate_details *mdetails)
> > > =C2=A0{
> > > +	struct drm_pagemap_iova_state state =3D {};
> > > =C2=A0	int ret =3D 0;
> > > =C2=A0
> > > =C2=A0	if (cur->start =3D=3D 0)
> > > @@ -484,7 +537,7 @@ static int drm_pagemap_migrate_range(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0
> > > &pages[last-
> > > > start],
> > > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0
> > > &pagemap_addr[last->start],
> > > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 cur->start
> > > -
> > > last->start,
> > > -						=C2=A0=C2=A0=C2=A0=C2=A0 last->ops);
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0 last->ops,
> > > &state);
> > > =C2=A0
> > > =C2=A0out:
> > > =C2=A0	*last =3D *cur;
> > > @@ -1001,6 +1054,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
> > > =C2=A0int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > > *devmem_allocation)
> > > =C2=A0{
> > > =C2=A0	const struct drm_pagemap_devmem_ops *ops =3D
> > > devmem_allocation->ops;
> > > +	struct drm_pagemap_iova_state state =3D {};
> > > =C2=A0	unsigned long npages, mpages =3D 0;
> > > =C2=A0	struct page **pages;
> > > =C2=A0	unsigned long *src, *dst;
> > > @@ -1042,7 +1096,7 @@ int drm_pagemap_evict_to_ram(struct
> > > drm_pagemap_devmem *devmem_allocation)
> > > =C2=A0	err =3D
> > > drm_pagemap_migrate_map_system_pages(devmem_allocation->dev,
> > > =C2=A0						=C2=A0=C2=A0 pagemap_addr,
> > > =C2=A0						=C2=A0=C2=A0 dst, npages,
> > > -						=C2=A0=C2=A0
> > > DMA_FROM_DEVICE);
> > > +						=C2=A0=C2=A0
> > > DMA_FROM_DEVICE,
> > > &state);
> > > =C2=A0	if (err)
> > > =C2=A0		goto err_finalize;
> > > =C2=A0
> > > @@ -1059,7 +1113,7 @@ int drm_pagemap_evict_to_ram(struct
> > > drm_pagemap_devmem *devmem_allocation)
> > > =C2=A0	migrate_device_pages(src, dst, npages);
> > > =C2=A0	migrate_device_finalize(src, dst, npages);
> > > =C2=A0	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > > pagemap_addr, dst, npages,
> > > -					DMA_FROM_DEVICE);
> > > +					DMA_FROM_DEVICE,
> > > &state);
> > > =C2=A0
> > > =C2=A0err_free:
> > > =C2=A0	kvfree(buf);
> > > @@ -1103,6 +1157,7 @@ static int
> > > __drm_pagemap_migrate_to_ram(struct
> > > vm_area_struct *vas,
> > > =C2=A0		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > > =C2=A0		.fault_page	=3D page,
> > > =C2=A0	};
> > > +	struct drm_pagemap_iova_state state =3D {};
> > > =C2=A0	struct drm_pagemap_zdd *zdd;
> > > =C2=A0	const struct drm_pagemap_devmem_ops *ops;
> > > =C2=A0	struct device *dev =3D NULL;
> > > @@ -1162,7 +1217,7 @@ static int
> > > __drm_pagemap_migrate_to_ram(struct
> > > vm_area_struct *vas,
> > > =C2=A0
> > > =C2=A0	err =3D drm_pagemap_migrate_map_system_pages(dev,
> > > pagemap_addr,
> > > =C2=A0						=C2=A0=C2=A0 migrate.dst,
> > > npages,
> > > -						=C2=A0=C2=A0
> > > DMA_FROM_DEVICE);
> > > +						=C2=A0=C2=A0
> > > DMA_FROM_DEVICE,
> > > &state);
> > > =C2=A0	if (err)
> > > =C2=A0		goto err_finalize;
> > > =C2=A0
> > > @@ -1180,7 +1235,8 @@ static int
> > > __drm_pagemap_migrate_to_ram(struct
> > > vm_area_struct *vas,
> > > =C2=A0	migrate_vma_finalize(&migrate);
> > > =C2=A0	if (dev)
> > > =C2=A0		drm_pagemap_migrate_unmap_pages(dev,
> > > pagemap_addr,
> > > migrate.dst,
> > > -						npages,
> > > DMA_FROM_DEVICE);
> > > +						npages,
> > > DMA_FROM_DEVICE,
> > > +						&state);
> > > =C2=A0err_free:
> > > =C2=A0	kvfree(buf);
> > > =C2=A0err_out:
