Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4AA6AE8C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A1710E6AB;
	Thu, 20 Mar 2025 19:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6Vyttum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5F10E6AB;
 Thu, 20 Mar 2025 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742499115; x=1774035115;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Hln00shNxHhLA08+tnnet/uvmgVD5D/nYRCk/MTL/ws=;
 b=C6VyttumBtD+Q4DDRfDWsvMBFtyQ8joG0rXXwztxWY2yTUhR9xePV1Iq
 pKZGokqimGENSqnbRsrQPLDrH5MoIkeM5s/PYzHvSZCGUeHib2UWTNBF8
 M/t0AcNa2bQAKpIOAeeZ6IINllxzPnEUWHsaTiBYG0lX7OGMbsNUwEjRZ
 acBigq8Dtv7gBsa3PG0N/cQFn25EhjJnqNlrqyG4Y+gZY6XO+PkctGPpZ
 kyFoZuG+uonEJbMmjJ8RFVUXeEbkcBkJi4IoOpNk2JAzo7yl1FK731jGD
 BzBEx6TJUfE50w0S1wozQBZmagPetMse7dK2oAEXfEslO/26EoANQA0df g==;
X-CSE-ConnectionGUID: yj9AIIXATj2so9UzC39OfQ==
X-CSE-MsgGUID: Fct17siJR+iHVDIRcJaSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43679206"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43679206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:31:55 -0700
X-CSE-ConnectionGUID: IdHOooRAQmO+bnF3KASESg==
X-CSE-MsgGUID: RDhIxsc9SF+xc4Wo9v+HcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128259161"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:31:53 -0700
Message-ID: <c2da8c4e2f4db850ad404fbcf80544e3937476b2.camel@linux.intel.com>
Subject: Re: [PATCH 2/7] drm/gpusvm: use more selective dma dir in get_pages()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 20 Mar 2025 20:31:50 +0100
In-Reply-To: <20250320172956.168358-11-matthew.auld@intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-11-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-03-20 at 17:29 +0000, Matthew Auld wrote:
> If we are only reading the memory then from the device pov the
> direction
> can be DMA_TO_DEVICE. This aligns with the xe-userptr code. Using the
> most restrictive data direction to represent the access is normally a
> good idea.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/drm_gpusvm.c | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpusvm.c
> b/drivers/gpu/drm/drm_gpusvm.c
> index 48993cef4a74..7f1cf5492bba 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1355,6 +1355,8 @@ int drm_gpusvm_range_get_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0	int err =3D 0;
> =C2=A0	struct dev_pagemap *pagemap;
> =C2=A0	struct drm_pagemap *dpagemap;
> +	enum dma_data_direction dma_dir =3D ctx->read_only ?
> DMA_TO_DEVICE :
> +							=C2=A0=C2=A0
> DMA_BIDIRECTIONAL;
> =C2=A0
> =C2=A0retry:
> =C2=A0	hmm_range.notifier_seq =3D mmu_interval_read_begin(notifier);
> @@ -1459,7 +1461,7 @@ int drm_gpusvm_range_get_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0				dpagemap->ops->device_map(dpagemap,
> =C2=A0							=C2=A0 gpusvm-
> >drm->dev,
> =C2=A0							=C2=A0 page,
> order,
> -							=C2=A0
> DMA_BIDIRECTIONAL);
> +							=C2=A0 dma_dir);
> =C2=A0			if (dma_mapping_error(gpusvm->drm->dev,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range-
> >dma_addr[j].addr)) {
> =C2=A0				err =3D -EFAULT;
> @@ -1478,7 +1480,7 @@ int drm_gpusvm_range_get_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0			addr =3D dma_map_page(gpusvm->drm->dev,
> =C2=A0					=C2=A0=C2=A0=C2=A0 page, 0,
> =C2=A0					=C2=A0=C2=A0=C2=A0 PAGE_SIZE << order,
> -					=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> +					=C2=A0=C2=A0=C2=A0 dma_dir);
> =C2=A0			if (dma_mapping_error(gpusvm->drm->dev,
> addr)) {
> =C2=A0				err =3D -EFAULT;
> =C2=A0				goto err_unmap;
> @@ -1486,7 +1488,7 @@ int drm_gpusvm_range_get_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0
> =C2=A0			range->dma_addr[j] =3D
> drm_pagemap_device_addr_encode
> =C2=A0				(addr, DRM_INTERCONNECT_SYSTEM,
> order,
> -				 DMA_BIDIRECTIONAL);
> +				 dma_dir);
> =C2=A0		}
> =C2=A0		i +=3D 1 << order;
> =C2=A0		num_dma_mapped =3D i;

