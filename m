Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447519DFE7E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFE110E6A5;
	Mon,  2 Dec 2024 10:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebV9hk7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01B110E6A3;
 Mon,  2 Dec 2024 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733134441; x=1764670441;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PCh5CFahs17OyUo39cXmgx8SufDC79laiLIbFtOwY6E=;
 b=ebV9hk7sMRuBG232Q9zGquqKX7mkwvPKXTIzJGQRJv/vorPI2qnMXxlj
 OAbrKh9/ohRy0h2Nzy9KchFl433ygWx3aMbF9mSqcnjseYvbUNU8L6e1/
 bcaDY6cwcUmMn2S5FAULtbkngEnBJ7mE/3WGMi91WOuuwJ5SY1XTdMWPg
 tG54cb57GoBJfy+b0rAUy0PR42nYfPZ17u8iINCeUKjtWKn4AKSBkQarG
 kcOZezsgHltdXWp0xBkBqOLYNcYIKrmLj4LydKPugD/ebingIy+CqEoKe
 YkxV2Q5EiPvOsHg5bk1rPT/J5tysvOVlEFwtYZ9kArIX1RJyjH0kWOyPi g==;
X-CSE-ConnectionGUID: NGs/z7A3TE6qQkAlBrbDmg==
X-CSE-MsgGUID: r2DVv/3/QfiSNqxRaFjLMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37068856"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="37068856"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:14:00 -0800
X-CSE-ConnectionGUID: yYnKso3PR1uqN0YVjaexmg==
X-CSE-MsgGUID: RlF1LYakS66+Z1KqetYprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93238192"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:13:57 -0800
Message-ID: <f3726a7297943fb5316ab16c1943bc6fbe42be24.camel@linux.intel.com>
Subject: Re: [PATCH v2 19/29] drm/xe: Add GPUSVM devic memory copy vfunc
 functions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 11:13:55 +0100
In-Reply-To: <20241016032518.539495-20-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-20-matthew.brost@intel.com>
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
> Add GPUSVM devic memory copy vfunc functions and connect to migration

s/devic/device=20
>=20

> layer.
>=20
> v2:
> =C2=A0- Allow NULL device pages in xe_svm_copy
> =C2=A0- Use new drm_gpusvm_devmem_ops
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 150
> ++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 150 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 22e6341117bd..b33fd42d035b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -6,6 +6,7 @@
> =C2=A0#include "drm_gpusvm.h"
> =C2=A0
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> +#include "xe_migrate.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_vm.h"
> @@ -269,6 +270,155 @@ static void
> xe_svm_garbage_collector_work_func(struct work_struct *w)
> =C2=A0	up_write(&vm->lock);
> =C2=A0}
> =C2=A0
> +static struct xe_mem_region *page_to_mr(struct page *page)
> +{
> +	return container_of(page->pgmap, struct xe_mem_region,
> pagemap);
> +}
> +
> +static struct xe_tile *mr_to_tile(struct xe_mem_region *mr)
> +{
> +	return container_of(mr, struct xe_tile, mem.vram);
> +}
> +
> +static u64 xe_mem_region_page_to_dpa(struct xe_mem_region *mr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page)
> +{
> +	u64 dpa;
> +	struct xe_tile *tile =3D mr_to_tile(mr);
> +	u64 pfn =3D page_to_pfn(page);
> +	u64 offset;
> +
> +	xe_tile_assert(tile, is_device_private_page(page));
> +	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >=3D mr->hpa_base);
> +
> +	offset =3D (pfn << PAGE_SHIFT) - mr->hpa_base;
> +	dpa =3D mr->dpa_base + offset;
> +
> +	return dpa;
> +}
> +
> +enum xe_svm_copy_dir {
> +	XE_SVM_COPY_TO_VRAM,
> +	XE_SVM_COPY_TO_SRAM,
> +};
> +
> +static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages, const enum
> xe_svm_copy_dir dir)
> +{
> +	struct xe_mem_region *mr =3D NULL;
> +	struct xe_tile *tile;
> +	struct dma_fence *fence =3D NULL;
> +	unsigned long i;
> +#define VRAM_ADDR_INVALID	~0x0ull
> +	u64 vram_addr =3D VRAM_ADDR_INVALID;
> +	int err =3D 0, pos =3D 0;
> +	bool sram =3D dir =3D=3D XE_SVM_COPY_TO_SRAM;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *spage =3D pages[i];
> +		struct dma_fence *__fence;
> +		u64 __vram_addr;
> +		bool match =3D false, chunk, last;
> +
> +		chunk =3D (i - pos) =3D=3D (SZ_2M / PAGE_SIZE);
> +		last =3D (i + 1) =3D=3D npages;
> +
> +		if (!dma_addr[i] && vram_addr =3D=3D VRAM_ADDR_INVALID)
> +			continue;
> +
> +		if (!mr && spage) {
> +			mr =3D page_to_mr(spage);
> +			tile =3D mr_to_tile(mr);
> +		}
> +
> +		if (dma_addr[i] && spage) {
> +			__vram_addr =3D xe_mem_region_page_to_dpa(mr,
> spage);
> +			if (vram_addr =3D=3D VRAM_ADDR_INVALID) {
> +				vram_addr =3D __vram_addr;
> +				pos =3D i;
> +			}
> +
> +			match =3D vram_addr + PAGE_SIZE * (i - pos) =3D=3D
> __vram_addr;
> +		}
> +
> +		if (!match || chunk || last) {
> +			int incr =3D (match && last) ? 1 : 0;
> +
> +			if (vram_addr !=3D VRAM_ADDR_INVALID) {
> +				if (sram)
> +					__fence =3D
> xe_migrate_from_vram(tile->migrate,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 i - pos + incr,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 vram_addr,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 dma_addr + pos);
> +				else
> +					__fence =3D
> xe_migrate_to_vram(tile->migrate,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> i - pos + incr,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> dma_addr + pos,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> vram_addr);
> +				if (IS_ERR(__fence)) {
> +					err =3D PTR_ERR(__fence);
> +					goto err_out;
> +				}
> +
> +				dma_fence_put(fence);
> +				fence =3D __fence;
> +			}
> +
> +			if (dma_addr[i] && spage) {
> +				vram_addr =3D __vram_addr;
> +				pos =3D i;
> +			} else {
> +				vram_addr =3D VRAM_ADDR_INVALID;
> +			}
> +
> +			if (!match && last && dma_addr[i] && spage)
> {
> +				if (sram)
> +					__fence =3D
> xe_migrate_from_vram(tile->migrate, 1,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 vram_addr,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 dma_addr + pos);
> +				else
> +					__fence =3D
> xe_migrate_to_vram(tile->migrate, 1,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> dma_addr + pos,
> +								=C2=A0=C2=A0=C2=A0=C2=A0
> vram_addr);
> +				if (IS_ERR(__fence)) {
> +					err =3D PTR_ERR(__fence);
> +					goto err_out;
> +				}
> +
> +				dma_fence_put(fence);
> +				fence =3D __fence;
> +			}

I think the flow in this function is a bit hard to follow. Could it
perhaps be simplified? If not, perhaps add a comment to the function
what it expects from the input arguments and the possible corner cases
that complicates it?


> +		}
> +	}
> +
> +err_out:
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
> +
> +	return err;
> +#undef VRAM_ADDR_INVALID
> +}
> +
> +static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t
> *dma_addr,
> +				 unsigned long npages)
> +{
> +	return xe_svm_copy(pages, dma_addr, npages,
> XE_SVM_COPY_TO_VRAM);
> +}
> +
> +static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t
> *dma_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages)
> +{
> +	return xe_svm_copy(pages, dma_addr, npages,
> XE_SVM_COPY_TO_SRAM);
> +}
> +
> +__maybe_unused

Is this __maybe_unused to be removed in a follow-up patch? If so could
you add a comment stating that?

> +static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> +	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> +	.copy_to_ram =3D xe_svm_copy_to_ram,
> +};
> +
> =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> =C2=A0	.range_alloc =3D xe_svm_range_alloc,
> =C2=A0	.range_free =3D xe_svm_range_free,

Thanks,
Thomas


