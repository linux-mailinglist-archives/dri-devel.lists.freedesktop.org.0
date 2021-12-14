Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D398474693
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFD710E566;
	Tue, 14 Dec 2021 15:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8CF10E552;
 Tue, 14 Dec 2021 15:37:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9744ACE18EA;
 Tue, 14 Dec 2021 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E90C34604;
 Tue, 14 Dec 2021 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639496248;
 bh=RsqIxw7l181YP8CsMrHMkGZWM3eQKUjSOlAiEt1c9Z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/ot4IoekuSM4yLL1UUyI+1dPtb3HVfplV1+ex5sYgFnpg32AlhbJlga1P+xLbvRB
 m68qNKuZ0AjmmhiJZT80bpwuuFy3AhoW2kYTAeLe+9/UFMSnWFIKMbxsZodICte8FW
 7XCRckyPKHOkLhvc4o88hxVaXQWuC59eCg/5EW6gD9HEvBkBWP/3dGn2y21pPtux5D
 A4C7V58JkeE1IwGQmIlg3uQfLyN622kMzdUasowwlnVUEJoD8i0b7vCvkakk3H+3FP
 lJXIM99ArskFYH4zq1+vL0RZHhT3rVdoZqInX8B0qR/1ISuFT+vbKfeDmLEHN1nZe+
 /0dSqFlT8MTSA==
Date: Tue, 14 Dec 2021 15:37:22 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Add way to debug pgtable walk
Message-ID: <20211214153722.GA15416@willie-the-truck>
References: <20211005151633.1738878-1-robdclark@gmail.com>
 <20211005151633.1738878-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005151633.1738878-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sven Peter <sven@svenpeter.dev>, freedreno@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Yong Wu <yong.wu@mediatek.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 08:16:25AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to retrieve the raw PTEs that would be
> traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 40 +++++++++++++++++++++++++++-------
>  include/linux/io-pgtable.h     |  9 ++++++++
>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dd9e47189d0d..c470fc0b3c2b 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -700,38 +700,61 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  	return arm_lpae_unmap_pages(ops, iova, size, 1, gather);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +				 void *_ptes, int *num_ptes)
>  {
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	arm_lpae_iopte pte, *ptep = data->pgd;
> +	arm_lpae_iopte *ptes = _ptes;
> +	int max_ptes = *num_ptes;
>  	int lvl = data->start_level;
>  
> +	*num_ptes = 0;
> +
>  	do {
> +		if (*num_ptes >= max_ptes)
> +			return -ENOSPC;
> +
>  		/* Valid IOPTE pointer? */
>  		if (!ptep)
> -			return 0;
> +			return -EFAULT;
>  
>  		/* Grab the IOPTE we're interested in */
>  		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
>  		pte = READ_ONCE(*ptep);
>  
> +		ptes[(*num_ptes)++] = pte;
> +
>  		/* Valid entry? */
>  		if (!pte)
> -			return 0;
> +			return -EFAULT;
>  
>  		/* Leaf entry? */
>  		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> +			return 0;
>  
>  		/* Take it to the next level */
>  		ptep = iopte_deref(pte, data);
>  	} while (++lvl < ARM_LPAE_MAX_LEVELS);
>  
> -	/* Ran out of page tables to walk */
> -	return 0;
> +	return -EFAULT;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	arm_lpae_iopte pte, ptes[ARM_LPAE_MAX_LEVELS];
> +	int lvl, num_ptes = ARM_LPAE_MAX_LEVELS;
> +	int ret;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, ptes, &num_ptes);
> +	if (ret)
> +		return 0;
> +
> +	pte = ptes[num_ptes - 1];
> +	lvl = num_ptes - 1 + data->start_level;
>  
> -found_translation:
>  	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
>  	return iopte_to_paddr(pte, data) | iova;
>  }
> @@ -816,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.unmap		= arm_lpae_unmap,
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86af6f0a00a2..501f362a929c 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -148,6 +148,13 @@ struct io_pgtable_cfg {
>   * @unmap:        Unmap a physically contiguous memory region.
>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>   * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: Return details of a page table walk for a given iova.
> + *                This returns the array of PTEs in a format that is
> + *                specific to the page table format.  The number of
> + *                PTEs can be format specific.  The num_ptes parameter
> + *                on input specifies the size of the ptes array, and
> + *                on output the number of PTEs filled in (which depends
> + *                on the number of PTEs walked to resolve the iova)

I think this would be a fair bit cleaner if the interface instead took a
callback function to invoke at each page-table level. It would be invoked
with the pte value and the level. Depending on its return value the walk
could be terminated early. That would also potentially scale to walking
ranges of iovas as well if we ever need it and it may be more readily
implementable by other formats too.

>   *
>   * These functions map directly onto the iommu_ops member functions with
>   * the same names.

This bit of the comment is no longer true with your change.

Will
