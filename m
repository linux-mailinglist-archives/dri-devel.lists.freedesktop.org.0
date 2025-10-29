Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9294C1B6F9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AB810E7E4;
	Wed, 29 Oct 2025 14:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMiGzK8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1BA10E7E4;
 Wed, 29 Oct 2025 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749699; x=1793285699;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5GnjiuVaWW/4M5uLogmOMSTobgRFzz6DCgOfxgbuXjg=;
 b=WMiGzK8ncmxji1GGvaOZaecTGoKDR6WjulFjJu6oaijny0uzjK3faLfn
 s0aBnfjP7FJImmmYGaklyPbZsneyJwBANV0exTqk/GOtXTti3cgO+urqV
 Nm1enQzTIB85kbBc5FCMfnd/QOCY8TPIImuwvAYB/zPUCCfcuastTwWxE
 K2JwSQcL8nAVVcU5UiGTlYa9zKwz1csz4ePCjCSJRx1gyt5/1gSaiDDqs
 nF3HMLCbYXYDlHCAcDrJk7N3ZQF/0Ql6T3iwQ+p22P9VU249ZFWgEmOAJ
 5dZojyqzec2HCpvBGryLxLwJn1/pq5mrl5XTZSllaCXeH862V65F0ri2n w==;
X-CSE-ConnectionGUID: n83hYU65QPyFV/UmKPrgjg==
X-CSE-MsgGUID: +tQa2vXSRJCcUOGh9qc1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63757182"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63757182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:54:59 -0700
X-CSE-ConnectionGUID: pb/OY/7kSmG/P28L6+8z3g==
X-CSE-MsgGUID: CKgVE0B7QOeTFvSTVQ6W/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185768088"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:54:56 -0700
Message-ID: <d8133bc3d85a1284f73f97f535b729872c998a23.camel@linux.intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Support pcie p2p dma as a fast interconnect
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 29 Oct 2025 15:54:54 +0100
In-Reply-To: <aQF5RkxXtW+6GIy7@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
 <aQF5RkxXtW+6GIy7@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-10-28 at 19:17 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:04:10PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Mimic the dma-buf method using dma_[map|unmap]_resource to map
> > for pcie-p2p dma.
> >=20
> > There's an ongoing area of work upstream to sort out how this best
> > should be done. One method proposed is to add an additional
> > pci_p2p_dma_pagemap aliasing the device_private pagemap and use
> > the corresponding pci_p2p_dma_pagemap page as input for
> > dma_map_page(). However, that would incur double the amount of
> > memory and latency to set up the drm_pagemap and given the huge
> > amount of memory present on modern GPUs, that would really not
> > work.
> > Hence the simple approach used in this patch.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c | 44
> > ++++++++++++++++++++++++++++++++++---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 1 +
> > =C2=A02 files changed, 42 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 9dd96dad2cca..9814f95cb212 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -3,6 +3,8 @@
> > =C2=A0 * Copyright =C2=A9 2024 Intel Corporation
> > =C2=A0 */
> > =C2=A0
> > +#include <linux/pci-p2pdma.h>
> > +
> > =C2=A0#include <drm/drm_drv.h>
> > =C2=A0#include <drm/drm_managed.h>
> > =C2=A0#include <drm/drm_pagemap.h>
> > @@ -442,6 +444,24 @@ static u64 xe_page_to_dpa(struct page *page)
> > =C2=A0	return dpa;
> > =C2=A0}
> > =C2=A0
> > +static u64 xe_page_to_pcie(struct page *page)
> > +{
>=20
> This function looks almost exactly the same as xe_page_to_dpa, maybe
> extract out the common parts?=20

OK, I'll take a look at that.

/Thomas


>=20
> Everything else LGTM.
>=20
> Matt
>=20
> > +	struct xe_pagemap *xpagemap =3D xe_page_to_pagemap(page);
> > +	struct xe_vram_region *vr =3D xe_pagemap_to_vr(xpagemap);
> > +	u64 hpa_base =3D xpagemap->hpa_base;
> > +	u64 ioaddr;
> > +	u64 pfn =3D page_to_pfn(page);
> > +	u64 offset;
> > +
> > +	xe_assert(vr->xe, is_device_private_page(page));
> > +	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >=3D hpa_base);
> > +
> > +	offset =3D (pfn << PAGE_SHIFT) - hpa_base;
> > +	ioaddr =3D vr->io_start + offset;
> > +
> > +	return ioaddr;
> > +}
> > +
> > =C2=A0enum xe_svm_copy_dir {
> > =C2=A0	XE_SVM_COPY_TO_VRAM,
> > =C2=A0	XE_SVM_COPY_TO_SRAM,
> > @@ -793,7 +813,10 @@ static bool xe_has_interconnect(struct
> > drm_pagemap_peer *peer1,
> > =C2=A0	struct device *dev1 =3D xe_peer_to_dev(peer1);
> > =C2=A0	struct device *dev2 =3D xe_peer_to_dev(peer2);
> > =C2=A0
> > -	return dev1 =3D=3D dev2;
> > +	if (dev1 =3D=3D dev2)
> > +		return true;
> > +
> > +	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true)
> > >=3D 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> > @@ -1530,13 +1553,27 @@ xe_drm_pagemap_device_map(struct
> > drm_pagemap *dpagemap,
> > =C2=A0		addr =3D xe_page_to_dpa(page);
> > =C2=A0		prot =3D XE_INTERCONNECT_VRAM;
> > =C2=A0	} else {
> > -		addr =3D DMA_MAPPING_ERROR;
> > -		prot =3D 0;
> > +		addr =3D dma_map_resource(dev,
> > +					xe_page_to_pcie(page),
> > +					PAGE_SIZE << order, dir,
> > +					DMA_ATTR_SKIP_CPU_SYNC);
> > +		prot =3D XE_INTERCONNECT_P2P;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return drm_pagemap_addr_encode(addr, prot, order, dir);
> > =C2=A0}
> > =C2=A0
> > +static void xe_drm_pagemap_device_unmap(struct drm_pagemap
> > *dpagemap,
> > +					struct device *dev,
> > +					struct drm_pagemap_addr
> > addr)
> > +{
> > +	if (addr.proto !=3D XE_INTERCONNECT_P2P)
> > +		return;
> > +
> > +	dma_unmap_resource(dev, addr.addr, PAGE_SIZE <<
> > addr.order,
> > +			=C2=A0=C2=A0 addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +}
> > +
> > =C2=A0static void xe_pagemap_destroy_work(struct work_struct *work)
> > =C2=A0{
> > =C2=A0	struct xe_pagemap *xpagemap =3D container_of(work,
> > typeof(*xpagemap), destroy_work);
> > @@ -1573,6 +1610,7 @@ static void xe_pagemap_destroy(struct
> > drm_pagemap *dpagemap, bool from_atomic_or
> > =C2=A0
> > =C2=A0static const struct drm_pagemap_ops xe_drm_pagemap_ops =3D {
> > =C2=A0	.device_map =3D xe_drm_pagemap_device_map,
> > +	.device_unmap =3D xe_drm_pagemap_device_unmap,
> > =C2=A0	.populate_mm =3D xe_drm_pagemap_populate_mm,
> > =C2=A0	.destroy =3D xe_pagemap_destroy,
> > =C2=A0};
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 7cd7932f56c8..f5ed48993b6d 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -13,6 +13,7 @@
> > =C2=A0#include <drm/drm_pagemap_util.h>
> > =C2=A0
> > =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> > +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
> > =C2=A0
> > =C2=A0struct drm_device;
> > =C2=A0struct drm_file;
> > --=20
> > 2.51.0
> >=20

