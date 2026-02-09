Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBUFBMUUimlrGAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:09:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63C112E1C
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0D010E437;
	Mon,  9 Feb 2026 17:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXSzOHgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6810E366;
 Mon,  9 Feb 2026 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770656960; x=1802192960;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Lgl4Dqk62UsZg3DNUpl6DHpof64z8KjjWoCP/mFlTCA=;
 b=SXSzOHgmTZ419wl56r2yO/sWagagm9V6Op0QZX0IKOOA+ri+CaykaGE2
 77mbyt0VJ5AXW03uqavTLZzfbKPAzPSAlUsG4x5AZ5j1FdKvthc+r5yBQ
 t3wlrVXdpwex8FpxxElRYcuseqUxmcTPK7e4xAIdFFpYKRVez1fGHHSZG
 5QApepu9faY3Nji7L0Uk3ohhyw3vSTfooChhVs3rl0lRkjn+amUbdLlGc
 mA5dmufmi1o7irUY+hb2UuMg/J4I9RjsYPTg3TvwDDnAk8efNrXIAt1Op
 74J6bn3aTxLaSUhD0pmiRdvUKp6vRSJxd1kw25y8bqdSEkkWltwUT7jDC g==;
X-CSE-ConnectionGUID: Xd7DxqoFRE2EKf4nMiNs1w==
X-CSE-MsgGUID: RT9Ts3NhRHCW9Y7nyDVw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71956826"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71956826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 09:09:20 -0800
X-CSE-ConnectionGUID: 5xZLBgTPTCCvPAKa/27P0Q==
X-CSE-MsgGUID: p6/iPQysS0yLV1qtd7KM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="249269414"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.179])
 ([10.245.245.179])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 09:09:18 -0800
Message-ID: <c4c2bcb54b6401db1bdcf30eeda56834f8838966.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/pagemap: Split drm_pagemap_migrate_map_pages
 into device / system
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com, 
 himal.prasad.ghimiray@intel.com
Date: Mon, 09 Feb 2026 18:09:15 +0100
In-Reply-To: <aYoSGL5EXaXSD1/6@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-4-matthew.brost@intel.com>
 <93d2a45fd5a8af50b23bd15cd45c21300f804768.camel@linux.intel.com>
 <aYoSGL5EXaXSD1/6@lstrano-desk.jf.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 2F63C112E1C
X-Rspamd-Action: no action

On Mon, 2026-02-09 at 08:58 -0800, Matthew Brost wrote:
> On Mon, Feb 09, 2026 at 04:49:03PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > > Split drm_pagemap_migrate_map_pages into device / system helpers
> > > clearly
> > > seperating these operations. Will help with upcoming changes to
> > > split
> > > IOVA allocation steps.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/drm_pagemap.c | 146 ++++++++++++++++++++++-----=
-
> > > ----
> > > --
> > > =C2=A01 file changed, 96 insertions(+), 50 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > index fbd69f383457..29677b19bb69 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -205,7 +205,7 @@ static void
> > > drm_pagemap_get_devmem_page(struct
> > > page *page,
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0/**
> > > - * drm_pagemap_migrate_map_pages() - Map migration pages for GPU
> > > SVM
> > > migration
> > > + * drm_pagemap_migrate_map_device_pages() - Map device migration
> > > pages for GPU SVM migration
> > > =C2=A0 * @dev: The device performing the migration.
> > > =C2=A0 * @local_dpagemap: The drm_pagemap local to the migrating
> > > device.
> > > =C2=A0 * @pagemap_addr: Array to store DMA information corresponding
> > > to
> > > mapped pages.
> > > @@ -221,19 +221,22 @@ static void
> > > drm_pagemap_get_devmem_page(struct
> > > page *page,
> > > =C2=A0 *
> > > =C2=A0 * Returns: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > =C2=A0 */
> > > -static int drm_pagemap_migrate_map_pages(struct device *dev,
> > > -					 struct drm_pagemap
> > > *local_dpagemap,
> > > -					 struct drm_pagemap_addr
> > > *pagemap_addr,
> > > -					 unsigned long
> > > *migrate_pfn,
> > > -					 unsigned long npages,
> > > -					 enum dma_data_direction
> > > dir,
> > > -					 const struct
> > > drm_pagemap_migrate_details *mdetails)
> > > +static int
> > > +drm_pagemap_migrate_map_device_pages(struct device *dev,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap
> > > *local_dpagemap,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr
> > > *pagemap_addr,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *migrate_pfn,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_data_direction
> > > dir,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_migrate_details *mdetails)
> >=20
> > We might want to call this device_private pages. Device coherent
> > pages
> > are treated like system pages here, but I figure those are known to
> > the
> > dma subsystem and can be handled by the map_system_pages callback.
> >=20
>=20
> Yes.
>=20
> Eventually we will have figure out we'd want to handle Device
> coherent
> pages with a high speed fabric though.
>=20
> > > =C2=A0{
> > > =C2=A0	unsigned long num_peer_pages =3D 0, num_local_pages =3D 0,
> > > i;
> > > =C2=A0
> > > =C2=A0	for (i =3D 0; i < npages;) {
> > > =C2=A0		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > -		dma_addr_t dma_addr;
> > > +		struct drm_pagemap_zdd *zdd;
> > > +		struct drm_pagemap *dpagemap;
> > > +		struct drm_pagemap_addr addr;
> > > =C2=A0		struct folio *folio;
> > > =C2=A0		unsigned int order =3D 0;
> > > =C2=A0
> > > @@ -243,36 +246,26 @@ static int
> > > drm_pagemap_migrate_map_pages(struct
> > > device *dev,
> > > =C2=A0		folio =3D page_folio(page);
> > > =C2=A0		order =3D folio_order(folio);
> > > =C2=A0
> > > -		if (is_device_private_page(page)) {
> > > -			struct drm_pagemap_zdd *zdd =3D
> > > drm_pagemap_page_zone_device_data(page);
> > > -			struct drm_pagemap *dpagemap =3D zdd-
> > > > dpagemap;
> > > -			struct drm_pagemap_addr addr;
> > > -
> > > -			if (dpagemap =3D=3D local_dpagemap) {
> > > -				if (!mdetails-
> > > > can_migrate_same_pagemap)
> > > -					goto next;
> > > +		WARN_ON_ONCE(!is_device_private_page(page));
> > > =C2=A0
> > > -				num_local_pages +=3D
> > > NR_PAGES(order);
> > > -			} else {
> > > -				num_peer_pages +=3D
> > > NR_PAGES(order);
> > > -			}
> > > +		zdd =3D drm_pagemap_page_zone_device_data(page);
> > > +		dpagemap =3D zdd->dpagemap;
> > > =C2=A0
> > > -			addr =3D dpagemap->ops-
> > > >device_map(dpagemap,
> > > dev, page, order, dir);
> > > -			if (dma_mapping_error(dev, addr.addr))
> > > -				return -EFAULT;
> > > +		if (dpagemap =3D=3D local_dpagemap) {
> > > +			if (!mdetails->can_migrate_same_pagemap)
> > > +				goto next;
> > > =C2=A0
> > > -			pagemap_addr[i] =3D addr;
> > > +			num_local_pages +=3D NR_PAGES(order);
> > > =C2=A0		} else {
> > > -			dma_addr =3D dma_map_page(dev, page, 0,
> > > page_size(page), dir);
> > > -			if (dma_mapping_error(dev, dma_addr))
> > > -				return -EFAULT;
> > > -
> > > -			pagemap_addr[i] =3D
> > > -
> > > 				drm_pagemap_addr_encode(dma_addr,
> > > -
> > > 							DRM_INTE
> > > RCONNECT_SYSTEM,
> > > -							order,
> > > dir);
> > > +			num_peer_pages +=3D NR_PAGES(order);
> > > =C2=A0		}
> > > =C2=A0
> > > +		addr =3D dpagemap->ops->device_map(dpagemap, dev,
> > > page, order, dir);
> > > +		if (dma_mapping_error(dev, addr.addr))
> > > +			return -EFAULT;
> > > +
> > > +		pagemap_addr[i] =3D addr;
> > > +
> > > =C2=A0next:
> > > =C2=A0		i +=3D NR_PAGES(order);
> > > =C2=A0	}
> > > @@ -287,6 +280,59 @@ static int
> > > drm_pagemap_migrate_map_pages(struct
> > > device *dev,
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * drm_pagemap_migrate_map_system_pages() - Map system migration
> > > pages for GPU SVM migration
> > > + * @dev: The device performing the migration.
> > > + * @pagemap_addr: Array to store DMA information corresponding
> > > to
> > > mapped pages.
> > > + * @migrate_pfn: Array of page frame numbers of system pages or
> > > peer
> > > pages to map.
> >=20
> > system pages or device coherent pages? "Peer" pages would typically
> > be
> > device-private pages with the same owner.
> >=20
> > > + * @npages: Number of system pages or peer pages to map.
> >=20
> > Same here.
>=20
> Yes, copy paste error.
>=20
> >=20
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function maps pages of memory for migration usage in GPU
> > > SVM. It
> > > + * iterates over each page frame number provided in
> > > @migrate_pfn,
> > > maps the
> > > + * corresponding page, and stores the DMA address in the
> > > provided
> > > @dma_addr
> > > + * array.
> > > + *
> > > + * Returns: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > + */
> > > +static int
> > > +drm_pagemap_migrate_map_system_pages(struct device *dev,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr
> > > *pagemap_addr,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *migrate_pfn,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages;) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > +		dma_addr_t dma_addr;
> > > +		struct folio *folio;
> > > +		unsigned int order =3D 0;
> > > +
> > > +		if (!page)
> > > +			goto next;
> > > +
> > > +		WARN_ON_ONCE(is_device_private_page(page));
> > > +		folio =3D page_folio(page);
> > > +		order =3D folio_order(folio);
> > > +
> > > +		dma_addr =3D dma_map_page(dev, page, 0,
> > > page_size(page), dir);
> > > +		if (dma_mapping_error(dev, dma_addr))
> > > +			return -EFAULT;
> > > +
> > > +		pagemap_addr[i] =3D
> > > +			drm_pagemap_addr_encode(dma_addr,
> > > +						DRM_INTERCONNECT
> > > _SYS
> > > TEM,
> > > +						order, dir);
> > > +
> > > +next:
> > > +		i +=3D NR_PAGES(order);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * drm_pagemap_migrate_unmap_pages() - Unmap pages previously
> > > mapped
> > > for GPU SVM migration
> > > =C2=A0 * @dev: The device for which the pages were mapped
> > > @@ -347,9 +393,11 @@ drm_pagemap_migrate_remote_to_local(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_migrate_details *mdetails)
> > > =C2=A0
> > > =C2=A0{
> > > -	int err =3D drm_pagemap_migrate_map_pages(remote_device,
> > > remote_dpagemap,
> > > -						pagemap_addr,
> > > local_pfns,
> > > -						npages,
> > > DMA_FROM_DEVICE, mdetails);
> > > +	int err =3D
> > > drm_pagemap_migrate_map_device_pages(remote_device,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > remote_dpagemap,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > pagemap_addr,
> > > local_pfns,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 npages,
> > > DMA_FROM_DEVICE,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > mdetails);
> > > =C2=A0
> > > =C2=A0	if (err)
> > > =C2=A0		goto out;
> > > @@ -368,12 +416,11 @@ drm_pagemap_migrate_sys_to_dev(struct
> > > drm_pagemap_devmem *devmem,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *local_page=
s[],
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr
> > > pagemap_addr[],
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_devmem_ops
> > > *ops,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_migrate_details *mdetails)
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_devmem_ops
> > > *ops)
> > > =C2=A0{
> > > -	int err =3D drm_pagemap_migrate_map_pages(devmem->dev,
> > > devmem-
> > > > dpagemap,
> > > -						pagemap_addr,
> > > sys_pfns, npages,
> > > -						DMA_TO_DEVICE,
> > > mdetails);
> > > +	int err =3D drm_pagemap_migrate_map_system_pages(devmem-
> > > >dev,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > pagemap_addr,
> > > sys_pfns,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 npages,
> > > DMA_TO_DEVICE);
> >=20
> >=20
> > Unfortunately it's a bit more complicated than this. If the
> > destination
> > gpu migrates, the range to migrate could be a mix of system pages,
> > device coherent pages and also device private pages, and previously
> > drm_pagemap_migrate_map_pages() took care of that and did the
> > correct
> > thing on a per-page basis.=20
> >=20
> > You can exercise this by setting mdetails::source_peer_migrates to
> > false on xe. That typically "works" but might generate some errors
> > in
> > the atomic multi-device tests AFAICT because reading from the BAR
> > does
> > not flush the L2 caches on BMG. But should be sufficient to
> > exercise
> > this path.
>=20
> Ah, yes I see I missed this - this patch isn't strickly required I
> just
> didn't want drm_pagemap_migrate_map_pages to have massive cascading
> if
> statements... I can remove for now if that is preferred or should be
> just remove source_peer_migrates and assume a value of '1'.
>=20
> I suggest the later because looking forward source_peer_migrates =3D=3D 0
> would bb difficult to support a high speed fabric, which requires a
> IOVA
> (think UAL with virtual NAs at the target device), plus multiple
> different devices being found in the migration pages. Also, with p2p,
> isn't source_peer_migrates =3D=3D '1' (write over p2p) faster than
> source_peer_migrates =3D=3D '0' (read over p2p)?

With source_peer_migrates =3D=3D 0 we have the drawbacks of missed cache
flushing, can't be used with CCS compression, high speed fabric and
also the speed over PCIe as you say, so I don't see xe using it in the
near-term.

So I agree. Let's just let's assume source_peer_migrates =3D=3D 1 for now.=
=20

Thanks,
Thomas=20

>=20
> Matt
>=20
> >=20
> > /Thomas
