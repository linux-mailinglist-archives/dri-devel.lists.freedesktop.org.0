Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF5A2C3A7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743310E372;
	Fri,  7 Feb 2025 13:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIY8w3YK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04310E325;
 Fri,  7 Feb 2025 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738935161; x=1770471161;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=woXi5v3wPsSI0NNn40/DAfq0+av+6HtvuuBkhQp4UAY=;
 b=oIY8w3YKna1x8UNSHWByxLfbalzykzMRbXArSO6j9YkSpsCe0CmUAdO1
 GJCODYy/2gGPfW6YZuEzI5xwYWN1RM8rF2q6jFyH8IhqSt0AzwmgljLAB
 R6ptuyOOa5md9UApb8mm//avwFKN+LITu9RiEjkAfTRdaJTqxThoRWKY4
 jCb47nqB6vbtSH0fzcW81R6xkXthNlHXKgbplvv4KOW5twu3LtSKSdt7J
 Zx5vaau6j2XxOKUBsW/li1inBd+ZKjdjNRnurG6ZEEYaSxjggvPxzSg8Q
 nvV//u6WhslwPLxokn4rROIo+BboSI2gI0/TIIOWasEsdcduqqnIEY1Di A==;
X-CSE-ConnectionGUID: Pu5Ln8oMQ1GviN5BVwJmKw==
X-CSE-MsgGUID: +Y5wVPLRRA6VwaqBacZHrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57111978"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="57111978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:32:41 -0800
X-CSE-ConnectionGUID: dd7pkm30REiGQZdLNI2e8Q==
X-CSE-MsgGUID: DoG1jhX9TECfy2yGvQnmow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116137606"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:32:38 -0800
Message-ID: <0c2f87592d624ae992846584885c189146936c22.camel@linux.intel.com>
Subject: Re: [PATCH v4 24/33] drm/xe: Add GPUSVM device memory copy vfunc
 functions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:32:35 +0100
In-Reply-To: <20250129195212.745731-25-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-25-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> Add GPUSVM device memory copy vfunc functions and connect to
> migration
> layer. Used for device memory migration.
>=20
> v2:
> =C2=A0- Allow NULL device pages in xe_svm_copy
> =C2=A0- Use new drm_gpusvm_devmem_ops
> v3:
> =C2=A0- Prefix defines with XE_ (Thomas)
> =C2=A0- Change copy chunk size to 8M
> =C2=A0- Add a bunch of comments to xe_svm_copy to clarify behavior
> (Thomas)
> =C2=A0- Better commit message (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 179
> ++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 179 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 869a155fc9f7..222d252521f8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -4,6 +4,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> +#include "xe_migrate.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_vm.h"
> @@ -282,6 +283,184 @@ static void
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
> +#define XE_VRAM_ADDR_INVALID	~0x0ull
> +	u64 vram_addr =3D XE_VRAM_ADDR_INVALID;
> +	int err =3D 0, pos =3D 0;
> +	bool sram =3D dir =3D=3D XE_SVM_COPY_TO_SRAM;
> +
> +	/*
> +	 * This flow is complex: it locates physically contiguous
> device pages,
> +	 * derives the starting physical address, and performs a
> single GPU copy
> +	 * to for every 8M chunk in a DMA address array. Both device
> pages and
> +	 * DMA addresses may be sparsely populated. If either is
> NULL, a copy is
> +	 * triggered based on the current search state. The last GPU
> copy is
> +	 * waited on to ensure all copies are complete.
> +	 */
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *spage =3D pages[i];
> +		struct dma_fence *__fence;
> +		u64 __vram_addr;
> +		bool match =3D false, chunk, last;
> +
> +#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
> +		chunk =3D (i - pos) =3D=3D (XE_MIGRATE_CHUNK_SIZE /
> PAGE_SIZE);
> +		last =3D (i + 1) =3D=3D npages;
> +
> +		/* No CPU page and no device pages queue'd to copy
> */
> +		if (!dma_addr[i] && vram_addr =3D=3D
> XE_VRAM_ADDR_INVALID)
> +			continue;
> +
> +		if (!mr && spage) {
> +			mr =3D page_to_mr(spage);
> +			tile =3D mr_to_tile(mr);
> +		}
> +		XE_WARN_ON(spage && page_to_mr(spage) !=3D mr);
> +
> +		/*
> +		 * CPU page and device page valid, capture physical
> address on
> +		 * first device page, check if physical contiguous
> on subsequent
> +		 * device pages.
> +		 */
> +		if (dma_addr[i] && spage) {
> +			__vram_addr =3D xe_mem_region_page_to_dpa(mr,
> spage);
> +			if (vram_addr =3D=3D XE_VRAM_ADDR_INVALID) {
> +				vram_addr =3D __vram_addr;
> +				pos =3D i;
> +			}
> +
> +			match =3D vram_addr + PAGE_SIZE * (i - pos) =3D=3D
> __vram_addr;
> +		}
> +
> +		/*
> +		 * Mismatched physical address, 8M copy chunk, or
> last page -
> +		 * trigger a copy.
> +		 */
> +		if (!match || chunk || last) {
> +			/*
> +			 * Extra page for first copy if last page
> and matching
> +			 * physical address.
> +			 */
> +			int incr =3D (match && last) ? 1 : 0;
> +
> +			if (vram_addr !=3D XE_VRAM_ADDR_INVALID) {
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
> +			/* Setup physical address of next device
> page */
> +			if (dma_addr[i] && spage) {
> +				vram_addr =3D __vram_addr;
> +				pos =3D i;
> +			} else {
> +				vram_addr =3D XE_VRAM_ADDR_INVALID;
> +			}
> +
> +			/* Extra mismatched device page, copy it */
> +			if (!match && last && vram_addr !=3D
> XE_VRAM_ADDR_INVALID) {
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
> +		}
> +	}
> +
> +err_out:
> +	/* Wait for all copies to complete */
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
> +
> +	return err;
> +#undef XE_MIGRATE_CHUNK_SIZE
> +#undef XE_VRAM_ADDR_INVALID
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
> +static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> +	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> +	.copy_to_ram =3D xe_svm_copy_to_ram,
> +};
> +
> =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> =C2=A0	.range_alloc =3D xe_svm_range_alloc,
> =C2=A0	.range_free =3D xe_svm_range_free,

