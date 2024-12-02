Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC029DFEAF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13910E1E7;
	Mon,  2 Dec 2024 10:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM5IzvS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764510E1E7;
 Mon,  2 Dec 2024 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733134798; x=1764670798;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U+W4UEy7Kun+G1WoLd7vhyjB9HFzqKlBIVdsLvFGIuA=;
 b=aM5IzvS8Rkpa7EweJUqnQRBmbg2huSkXNNcVQMQ4b5RP3rbNWghJf4Fl
 seCF9TFAOSwjNYhl8IjUy0zMRN41DJBzshcK/rJUFQl8QFsvr1GalwtSB
 kmLaH6NWXnnfJt+nixdEn3Y68YxrWw14Vii0V7WCJQW9HRzOsiRwjsLPc
 ef5XTL953p2acexMmpp1K8lRn/0t6q7CvCshNBPNylCaCEhBEirXWtW7k
 FnF+eWLPcBr1FY217rEcYZ04u9l8jt7B8T28WcHmQ+NNnBzn+92ph+Yez
 kLERZdCv/oYDDfvOU2M2B8Wo7tA4OBYP1jOa7E6QSQEwUiL+zwQXPV1oO w==;
X-CSE-ConnectionGUID: SYcdEbMrSkS9ejTJVZA3tg==
X-CSE-MsgGUID: 7QMBw9CURUmwyrb6Y61DdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33354023"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33354023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:19:58 -0800
X-CSE-ConnectionGUID: Wj6zrbY2SfGIpenuW9jFCA==
X-CSE-MsgGUID: cHJisaUcRQCBpVAwJsOPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92967766"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:19:55 -0800
Message-ID: <b514046f571f34289176b58710c98921b7e6eb88.camel@linux.intel.com>
Subject: Re: [PATCH v2 21/29] drm/xe: Add Xe SVM populate_devmem_pfn vfunc
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 11:19:52 +0100
In-Reply-To: <20241016032518.539495-22-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-22-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Get VRAM pfns from BO's buddy blocks.
>=20
> v2:
> =C2=A0- Use new drm_gpusvm_devmem_ops
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 40
> +++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 40 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 4f01941b2cc2..19fcb8f71791 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -9,6 +9,7 @@
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> +#include "xe_ttm_vram_mgr.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> @@ -413,8 +414,47 @@ static int xe_svm_copy_to_ram(struct page
> **pages, dma_addr_t *dma_addr,
> =C2=A0	return xe_svm_copy(pages, dma_addr, npages,
> XE_SVM_COPY_TO_SRAM);
> =C2=A0}
> =C2=A0
> +static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem
> *devmem_allocation)
> +{
> +	return container_of(devmem_allocation, struct xe_bo,
> devmem_allocation);
> +}
> +
> +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> +{
> +	return PHYS_PFN(offset + mr->hpa_base);
> +}
> +
> +static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram_mgr->mm;
> +}
> +
> +static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem
> *devmem_allocation,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages, unsigned
> long *pfn)
> +{
> +	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> +	struct ttm_resource *res =3D bo->ttm.resource;
> +	struct list_head *blocks =3D
> &to_xe_ttm_vram_mgr_resource(res)->blocks;
> +	struct drm_buddy_block *block;
> +	int j =3D0;
> +
> +	list_for_each_entry(block, blocks, link) {
> +		struct xe_mem_region *mr =3D block->private;
> +		struct xe_tile *tile =3D mr_to_tile(mr);
> +		struct drm_buddy *buddy =3D tile_to_buddy(tile);
> +		u64 block_pfn =3D block_offset_to_pfn(mr,
> drm_buddy_block_offset(block));
> +		int i;
> +
> +		for(i =3D 0; i < drm_buddy_block_size(buddy, block) >>
> PAGE_SHIFT; ++i)
> +			pfn[j++] =3D block_pfn + i;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0__maybe_unused
> =C2=A0static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> +	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> =C2=A0	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> =C2=A0	.copy_to_ram =3D xe_svm_copy_to_ram,
> =C2=A0};

