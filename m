Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CE9A5FCF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278310E452;
	Mon, 21 Oct 2024 09:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iRiLxaJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FCD10E452
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729502282;
 bh=llXWt9EDhIYDizPZ/i9tAy/u1WhV07tHJvNbQJI8fKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iRiLxaJYj2gJ8NB+toquY4hFDZlDvXrtQOIjIVyInTjcCyWgo6y4me+DUzJnRZidj
 ogODuuGnQq0CyLvAdQEXXhZZ+AdBGGRxcTlrd3mcpqxUoU+RAY7S88Fuw6tIs1a/G4
 zJN2w8MSlv5JxDHrpY4sjuNnPXeLLan0ntA2goGvPWmb4xHrGrUnqXOWENnMwDgOaS
 JrUNzCt+/F8IafMZUs0pUBt162K6Ktoc6w6FF10QOa/yaKPcfo7xBWsBfeyL0Ym6OF
 LN0nARUNuYt4s6qnYwuS0Nv3jrizRGPxIijnxl5c8OVC+ZYLREK8jUpkY1zLLLYufv
 C17ckxOyMHBZw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 35E0F17E05BD;
 Mon, 21 Oct 2024 11:18:02 +0200 (CEST)
Date: Mon, 21 Oct 2024 11:17:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, Liviu Dudau
 <liviu.dudau@arm.com>, patches@lists.linux.dev, Steven Price
 <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241021111758.561c81ca@collabora.com>
In-Reply-To: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 18 Oct 2024 14:19:26 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> 
> All other drivers will unmap the large IOPTE and return it's length.  For
> example if a 2M IOPTE is present and the first 4K is requested to be
> unmapped then unmap will remove the whole 2M and report 2M as the result.
> 
> arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> the 4K and returns 4k. This is actually an illegal/non-hitless operation
> on at least SMMUv3 because of the BBM level 0 rules.
> 
> Long ago VFIO could trigger a path like this, today I know of no user of
> this functionality.
> 
> Given it doesn't work fully correctly on SMMUv3 and would create
> portability problems if any user depends on it, remove the unique support
> in arm_lpae and align with the expected iommu interface.
> 
> Outside the iommu users, this will potentially effect io_pgtable users of
> ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> ARM_MALI_LPAE formats.
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
>  1 file changed, 6 insertions(+), 66 deletions(-)
> 
> I don't know anything in the iommu space that needs this, and this is the only
> page table implementation in iommu that does it.
> 
> I'm not sure about DRM, I looked for awhile and only Panthor was unclear.

I theory, Panthor can do partial unmaps (unmapping a subregion of a
physically contiguous 2M section). In practice, it's not something we
rely on yet, so I don't think it's a blocker. If we ever want to support
that, we can always do it in two steps (unmap the 2M region and remap
the borders). At some point it'd be good to have some kind of atomic
page table updates, so we don't have this short period of time during
which nothing is mapped (between the unmap and the remap), but that's a
different story.

> 
> If DRM does use this, I'd respin this to make it into a quirk and iommu won't
> set it.
> 
> Thanks,
> Jason
> 
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d98..a51fae9c909111 100644
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
> @@ -678,12 +618,12 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>  
>  		return i * size;
>  	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		/*
> -		 * Insert a table at the next level to map the old region,
> -		 * minus the part we want to unmap
> -		 */
> -		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
> -						lvl + 1, ptep, pgcount);
> +		/* Unmap the entire large IOPTE and return its size */
> +		size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +		__arm_lpae_clear_pte(ptep, &iop->cfg, 1);
> +		if (gather && !iommu_iotlb_gather_queued(gather))
> +			io_pgtable_tlb_add_page(iop, gather, iova, size);
> +		return size;
>  	}
>  
>  	/* Keep on walkin' */
> 
> base-commit: 27ab08d646a1b53330229a97100200c9567d28b5

