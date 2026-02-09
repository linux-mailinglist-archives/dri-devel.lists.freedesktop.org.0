Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QICAI1AOimlrGAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:41:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05491129A7
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9DD10E434;
	Mon,  9 Feb 2026 16:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtBgFwGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C1510E366;
 Mon,  9 Feb 2026 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770655307; x=1802191307;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1iptkNUVa/5D5Dr+7NU+mpE5e14csE4Uy/e5AmBpeNU=;
 b=UtBgFwGxf9/frdLg/+0Y0ANgqTGKfyDOl07aFew1i4uLbelpNvR0pb5j
 cJKfgwMw9At/xk5RJct7YZJl6+jqczKFz6JAfwT/bgR3qUUzVcwRVUsR9
 HyxjVRqiwtTsIoyw92dvDCkeGbrh4vh0dAUcxfrFz6Bwy9h6sfJEV/MX/
 3D53oL/kfRL08yYwn9xhEVJIQ/11laRwcD1XieVmwlZZyAWavx83cbpry
 NslIB7Y3oHu+KQ2Dc3YZtv09Z5HtBmmn4Otc7y3T7ONWasWhsOHbw6gTQ
 +fAzJ1dH8meLhloMMfA1N3XBUzh4x6/Eu/bJzZbKXCGhBbVcHhSrTqLi2 g==;
X-CSE-ConnectionGUID: 3W9TYk9oRJOiTmaSG+QHhg==
X-CSE-MsgGUID: pEoDsDwLQXSSWmxp9BItmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71662323"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71662323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:41:46 -0800
X-CSE-ConnectionGUID: AoT+3x4VR0Ktposa6fikaA==
X-CSE-MsgGUID: TqxxgdJvQVi+zwDLezvVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211695325"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.179])
 ([10.245.245.179])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:41:45 -0800
Message-ID: <57618dec45f8e666bb452773da196cae5b199726.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/4] drm/gpusvm: Use dma-map IOVA alloc, link, and
 sync API in GPU SVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com, 
 himal.prasad.ghimiray@intel.com
Date: Mon, 09 Feb 2026 17:41:42 +0100
In-Reply-To: <aYoHp5s393jWqqNb@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-3-matthew.brost@intel.com>
 <a49090041ce136443dc75d7f9dcd7e2fddbe90bc.camel@linux.intel.com>
 <aYoHp5s393jWqqNb@lstrano-desk.jf.intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid];
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
X-Rspamd-Queue-Id: A05491129A7
X-Rspamd-Action: no action

On Mon, 2026-02-09 at 08:13 -0800, Matthew Brost wrote:
> On Mon, Feb 09, 2026 at 10:44:43AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > > The dma-map IOVA alloc, link, and sync APIs perform significantly
> > > better
> > > than dma-map / dma-unmap, as they avoid costly IOMMU
> > > synchronizations.
> > > This difference is especially noticeable when mapping a 2MB
> > > region in
> > > 4KB pages.
> > >=20
> > > Use the IOVA alloc, link, and sync APIs for GPU SVM, which create
> > > DMA
> > > mappings between the CPU and GPU.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > v3:
> > > =C2=A0- Always link IOVA in mixed mappings
> > > =C2=A0- Sync IOVA
> > > v4:
> > > =C2=A0- Initialize IOVA state in get_pages
> > > =C2=A0- Use pack IOVA linking (Jason)
> > > =C2=A0- s/page_to_phys/hmm_pfn_to_phys (Leon)
> > >=20
> > > =C2=A0drivers/gpu/drm/drm_gpusvm.c | 55
> > > ++++++++++++++++++++++++++++++----
> > > --
> > > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
> > > =C2=A02 files changed, 52 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index 4b8130a4ce95..800caaf0a783 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -1139,11 +1139,19 @@ static void
> > > __drm_gpusvm_unmap_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0		struct drm_gpusvm_pages_flags flags =3D {
> > > =C2=A0			.__flags =3D svm_pages->flags.__flags,
> > > =C2=A0		};
> > > +		bool use_iova =3D dma_use_iova(&svm_pages->state);
> > > +
> > > +		if (use_iova) {
> > > +			dma_iova_unlink(dev, &svm_pages->state,
> > > 0,
> > > +					svm_pages->state_offset,
> > > +					svm_pages-
> > > >dma_addr[0].dir,
> > > 0);
> > > +			dma_iova_free(dev, &svm_pages->state);
> > > +		}
> > > =C2=A0
> > > =C2=A0		for (i =3D 0, j =3D 0; i < npages; j++) {
> > > =C2=A0			struct drm_pagemap_addr *addr =3D
> > > &svm_pages-
> > > > dma_addr[j];
> > > =C2=A0
> > > -			if (addr->proto =3D=3D
> > > DRM_INTERCONNECT_SYSTEM)
> > > +			if (!use_iova && addr->proto =3D=3D
> > > DRM_INTERCONNECT_SYSTEM)
> > > =C2=A0				dma_unmap_page(dev,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->addr,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > > addr-
> > > > order,
> > > @@ -1408,6 +1416,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0	struct drm_gpusvm_pages_flags flags;
> > > =C2=A0	enum dma_data_direction dma_dir =3D ctx->read_only ?
> > > DMA_TO_DEVICE :
> > > =C2=A0							=C2=A0=C2=A0
> > > DMA_BIDIRECTIONAL;
> > > +	struct dma_iova_state *state =3D &svm_pages->state;
> > > =C2=A0
> > > =C2=A0retry:
> > > =C2=A0	if (time_after(jiffies, timeout))
> > > @@ -1446,6 +1455,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0	if (err)
> > > =C2=A0		goto err_free;
> > > =C2=A0
> > > +	*state =3D (struct dma_iova_state){};
> > > +	svm_pages->state_offset =3D 0;
> > > +
> > > =C2=A0map_pages:
> > > =C2=A0	/*
> > > =C2=A0	 * Perform all dma mappings under the notifier lock to
> > > not
> > > @@ -1539,13 +1551,33 @@ int drm_gpusvm_get_pages(struct
> > > drm_gpusvm
> > > *gpusvm,
> > > =C2=A0				goto err_unmap;
> > > =C2=A0			}
> > > =C2=A0
> > > -			addr =3D dma_map_page(gpusvm->drm->dev,
> > > -					=C2=A0=C2=A0=C2=A0 page, 0,
> > > -					=C2=A0=C2=A0=C2=A0 PAGE_SIZE << order,
> > > -					=C2=A0=C2=A0=C2=A0 dma_dir);
> > > -			if (dma_mapping_error(gpusvm->drm->dev,
> > > addr)) {
> > > -				err =3D -EFAULT;
> > > -				goto err_unmap;
> > > +			if (!i)
> > > +				dma_iova_try_alloc(gpusvm->drm-
> > > >dev,
> > > state,
> > > +						=C2=A0=C2=A0 npages *
> > > PAGE_SIZE >=3D
> > > +						=C2=A0=C2=A0
> > > HPAGE_PMD_SIZE ?
> > > +						=C2=A0=C2=A0
> > > HPAGE_PMD_SIZE :
> > > 0,
> >=20
> > Doc says "callers that always do PAGE_SIZE aligned transfers can
> > always
> > pass 0 here", so can be simplified?
> >=20
>=20
> =C2=A0* Note: @phys is only used to calculate the IOVA alignment. Callers
> that always
> =C2=A0* do PAGE_SIZE aligned transfers can safely pass 0 here.
>=20
> So 0 would be safe but possibly suboptimal. For mapping greater than
> or
> equal to 2M, we'd like 2M MB alignment so large GPU pages can used
> too.
> I think passing in '0' could result in odd alignment.
>=20
> I am assuming other vendors have 2M GPU pages here too but that seems
> like somewhat safe assumption...

Ah, I interpreted that as beyond PAGE_SIZE the function would behave
the same.

Agree that if we can get 2M alignment that's much better.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> Matt
>=20
> >=20
> > > +						=C2=A0=C2=A0 npages *
> > > PAGE_SIZE);
> > > +
> > > +			if (dma_use_iova(state)) {
> > > +				err =3D dma_iova_link(gpusvm->drm-
> > > > dev, state,
> > > +						=C2=A0=C2=A0=C2=A0
> > > hmm_pfn_to_phys(pfns[i]),
> > > +						=C2=A0=C2=A0=C2=A0 svm_pages-
> > > > state_offset,
> > > +						=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > > order,
> > > +						=C2=A0=C2=A0=C2=A0 dma_dir, 0);
> > > +				if (err)
> > > +					goto err_unmap;
> > > +
> > > +				addr =3D state->addr + svm_pages-
> > > > state_offset;
> > > +				svm_pages->state_offset +=3D
> > > PAGE_SIZE
> > > << order;
> > > +			} else {
> > > +				addr =3D dma_map_page(gpusvm->drm-
> > > > dev,
> > > +						=C2=A0=C2=A0=C2=A0 page, 0,
> > > +						=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > > order,
> > > +						=C2=A0=C2=A0=C2=A0 dma_dir);
> > > +				if (dma_mapping_error(gpusvm-
> > > >drm-
> > > > dev, addr)) {
> > > +					err =3D -EFAULT;
> > > +					goto err_unmap;
> > > +				}
> > > =C2=A0			}
> > > =C2=A0
> > > =C2=A0			svm_pages->dma_addr[j] =3D
> > > drm_pagemap_addr_encode
> > > @@ -1557,6 +1589,13 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0		flags.has_dma_mapping =3D true;
> > > =C2=A0	}
> > > =C2=A0
> > > +	if (dma_use_iova(state)) {
> > > +		err =3D dma_iova_sync(gpusvm->drm->dev, state, 0,
> > > +				=C2=A0=C2=A0=C2=A0 svm_pages->state_offset);
> > > +		if (err)
> > > +			goto err_unmap;
> > > +	}
> > > +
> > > =C2=A0	if (pagemap) {
> > > =C2=A0		flags.has_devmem_pages =3D true;
> > > =C2=A0		drm_pagemap_get(dpagemap);
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 2578ac92a8d4..cd94bb2ee6ee 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -6,6 +6,7 @@
> > > =C2=A0#ifndef __DRM_GPUSVM_H__
> > > =C2=A0#define __DRM_GPUSVM_H__
> > > =C2=A0
> > > +#include <linux/dma-mapping.h>
> > > =C2=A0#include <linux/kref.h>
> > > =C2=A0#include <linux/interval_tree.h>
> > > =C2=A0#include <linux/mmu_notifier.h>
> > > @@ -136,6 +137,8 @@ struct drm_gpusvm_pages_flags {
> > > =C2=A0 * @dma_addr: Device address array
> > > =C2=A0 * @dpagemap: The struct drm_pagemap of the device pages we're
> > > dma-
> > > mapping.
> > > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Note this is assuming only one drm_pagemap per
> > > range
> > > is allowed.
> > > + * @state: DMA IOVA state for mapping.
> > > + * @state_offset: DMA IOVA offset for mapping.
> > > =C2=A0 * @notifier_seq: Notifier sequence number of the range's pages
> > > =C2=A0 * @flags: Flags for range
> > > =C2=A0 * @flags.migrate_devmem: Flag indicating whether the range can
> > > be
> > > migrated to device memory
> > > @@ -147,6 +150,8 @@ struct drm_gpusvm_pages_flags {
> > > =C2=A0struct drm_gpusvm_pages {
> > > =C2=A0	struct drm_pagemap_addr *dma_addr;
> > > =C2=A0	struct drm_pagemap *dpagemap;
> > > +	struct dma_iova_state state;
> > > +	unsigned long state_offset;
> > > =C2=A0	unsigned long notifier_seq;
> > > =C2=A0	struct drm_gpusvm_pages_flags flags;
> > > =C2=A0};
> >=20
> > Otherwise LGTM.=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
