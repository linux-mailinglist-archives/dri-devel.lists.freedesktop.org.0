Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178569BBD5E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 19:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D0B10E4AC;
	Mon,  4 Nov 2024 18:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A840410E4AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 18:39:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFC1F15BF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 10:39:29 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E95EE3F528
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 10:38:59 -0800 (PST)
Date: Mon, 4 Nov 2024 18:38:46 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Remove split on unmap
 behavior
Message-ID: <ZykUtvMaIrwWn_2l@e110455-lin.cambridge.arm.com>
References: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <1-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
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

On Mon, Nov 04, 2024 at 01:41:29PM -0400, Jason Gunthorpe wrote:
> A minority of page table implementations (arm_lpae, armv7) are unique in
> how they handle partial unmap of large IOPTEs.
> 
> Other implementations will unmap the large IOPTE and return it's
> length. For example if a 2M IOPTE is present and the first 4K is requested
> to be unmapped then unmap will remove the whole 2M and report 2M as the
> result.
> 
> arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> the 4K and returns 4k. This is actually an illegal/non-hitless operation
> on at least SMMUv3 because of the BBM level 0 rules.
> 
> Will says this was done to support VFIO, but upon deeper analysis this was
> never strictly necessary:
> 
>  https://lore.kernel.org/all/20241024134411.GA6956@nvidia.com/
> 
> In summary, historical VFIO supported the AMD behavior of unmapping the
> whole large IOPTE and returning the size, even if asked to unmap a
> portion. The driver would see this as a request to split a large IOPTE.
> Modern VFIO always unmaps entire large IOPTEs (except on AMD) and drivers
> don't see an IOPTE split.
> 
> Given it doesn't work fully correctly on SMMUv3 and relying on ARM unique
> behavior would create portability problems across IOMMU drivers, retire
> this functionality.
> 
> Outside the iommu users, this will potentially effect io_pgtable users of
> ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> ARM_MALI_LPAE formats.
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 68 +---------------------------------
>  1 file changed, 2 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d98..9a16815b3f3434 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -569,66 +569,6 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
>  	kfree(data);
>  }
>  
> -static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
> -				       struct iommu_iotlb_gather *gather,
> -				       unsigned long iova, size_t size,
> -				       arm_lpae_iopte blk_pte, int lvl,
> -				       arm_lpae_iopte *ptep, size_t pgcount)
> -{
> -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> -	arm_lpae_iopte pte, *tablep;
> -	phys_addr_t blk_paddr;
> -	size_t tablesz = ARM_LPAE_GRANULE(data);
> -	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
> -	int ptes_per_table = ARM_LPAE_PTES_PER_TABLE(data);
> -	int i, unmap_idx_start = -1, num_entries = 0, max_entries;
> -
> -	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
> -		return 0;
> -
> -	tablep = __arm_lpae_alloc_pages(tablesz, GFP_ATOMIC, cfg, data->iop.cookie);
> -	if (!tablep)
> -		return 0; /* Bytes unmapped */
> -
> -	if (size == split_sz) {
> -		unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		max_entries = ptes_per_table - unmap_idx_start;
> -		num_entries = min_t(int, pgcount, max_entries);
> -	}
> -
> -	blk_paddr = iopte_to_paddr(blk_pte, data);
> -	pte = iopte_prot(blk_pte);
> -
> -	for (i = 0; i < ptes_per_table; i++, blk_paddr += split_sz) {
> -		/* Unmap! */
> -		if (i >= unmap_idx_start && i < (unmap_idx_start + num_entries))
> -			continue;
> -
> -		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, 1, &tablep[i]);
> -	}
> -
> -	pte = arm_lpae_install_table(tablep, ptep, blk_pte, data);
> -	if (pte != blk_pte) {
> -		__arm_lpae_free_pages(tablep, tablesz, cfg, data->iop.cookie);
> -		/*
> -		 * We may race against someone unmapping another part of this
> -		 * block, but anything else is invalid. We can't misinterpret
> -		 * a page entry here since we're never at the last level.
> -		 */
> -		if (iopte_type(pte) != ARM_LPAE_PTE_TYPE_TABLE)
> -			return 0;
> -
> -		tablep = iopte_deref(pte, data);
> -	} else if (unmap_idx_start >= 0) {
> -		for (i = 0; i < num_entries; i++)
> -			io_pgtable_tlb_add_page(&data->iop, gather, iova + i * size, size);
> -
> -		return num_entries * size;
> -	}
> -
> -	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl, tablep);
> -}
> -
>  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>  			       struct iommu_iotlb_gather *gather,
>  			       unsigned long iova, size_t size, size_t pgcount,
> @@ -678,12 +618,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>  
>  		return i * size;
>  	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		/*
> -		 * Insert a table at the next level to map the old region,
> -		 * minus the part we want to unmap
> -		 */
> -		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
> -						lvl + 1, ptep, pgcount);
> +		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
> +		return 0;
>  	}
>  
>  	/* Keep on walkin' */
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
