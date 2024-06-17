Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AB90B39F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A75B10E420;
	Mon, 17 Jun 2024 15:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAB0410E420;
 Mon, 17 Jun 2024 15:13:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D46EDA7;
 Mon, 17 Jun 2024 08:14:09 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D132E3F6A8;
 Mon, 17 Jun 2024 08:13:42 -0700 (PDT)
Message-ID: <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>
Date: Mon, 17 Jun 2024 16:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240523175227.117984-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/05/2024 6:52 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.

Have to say I'm a little torn here - with my iommu-dma hat on I'm not 
super enthusiastic about adding any more overhead to iova_to_phys, but 
in terms of maintaining io-pgtable I do like the overall shape of the 
implementation...

Will, how much would you hate a compromise of inlining iova_to_phys as 
the default walk behaviour if cb is NULL? :)

That said, looking at the unmap figures for dma_map_benchmark on a 
Neoverse N1, any difference I think I see is still well within the 
noise, so maybe a handful of extra indirect calls isn't really enough to 
worry about?

Cheers,
Robin.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
>   include/linux/io-pgtable.h     |  4 +++
>   2 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f7828a7aad41..f47a0e64bb35 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>   				data->start_level, ptep);
>   }
>   
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +			int (*cb)(void *cb_data, void *pte, int level),
> +			void *cb_data)
>   {
>   	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>   	arm_lpae_iopte pte, *ptep = data->pgd;
>   	int lvl = data->start_level;
> +	int ret;
>   
>   	do {
>   		/* Valid IOPTE pointer? */
>   		if (!ptep)
> -			return 0;
> +			return -EFAULT;
>   
>   		/* Grab the IOPTE we're interested in */
>   		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>   
>   		/* Valid entry? */
>   		if (!pte)
> -			return 0;
> +			return -EFAULT;
> +
> +		ret = cb(cb_data, &pte, lvl);
> +		if (ret)
> +			return ret;
>   
> -		/* Leaf entry? */
> +		/* Leaf entry?  If so, we've found the translation */
>   		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> +			return 0;
>   
>   		/* Take it to the next level */
>   		ptep = iopte_deref(pte, data);
>   	} while (++lvl < ARM_LPAE_MAX_LEVELS);
>   
>   	/* Ran out of page tables to walk */
> +	return -EFAULT;
> +}
> +
> +struct iova_to_phys_walk_data {
> +	arm_lpae_iopte pte;
> +	int level;
> +};
> +
> +static int iova_to_phys_walk_cb(void *cb_data, void *pte, int level)
> +{
> +	struct iova_to_phys_walk_data *d = cb_data;
> +
> +	d->pte = *(arm_lpae_iopte *)pte;
> +	d->level = level;
> +
>   	return 0;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct iova_to_phys_walk_data d;
> +	int ret;
> +
> +	ret = arm_lpae_pgtable_walk(ops, iova, iova_to_phys_walk_cb, &d);
> +	if (ret)
> +		return 0;
>   
> -found_translation:
> -	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> +	iova &= (ARM_LPAE_BLOCK_SIZE(d.level, data) - 1);
> +	return iopte_to_paddr(d.pte, data) | iova;
>   }
>   
>   static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> @@ -807,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>   		.map_pages	= arm_lpae_map_pages,
>   		.unmap_pages	= arm_lpae_unmap_pages,
>   		.iova_to_phys	= arm_lpae_iova_to_phys,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>   	};
>   
>   	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86cf1f7ae389..261b48af068a 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -177,6 +177,7 @@ struct io_pgtable_cfg {
>    * @map_pages:    Map a physically contiguous range of pages of the same size.
>    * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>    * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.
>    *
>    * These functions map directly onto the iommu_ops member functions with
>    * the same names.
> @@ -190,6 +191,9 @@ struct io_pgtable_ops {
>   			      struct iommu_iotlb_gather *gather);
>   	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>   				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
> +			    int (*cb)(void *cb_data, void *pte, int level),
> +			    void *cb_data);
>   	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>   				    unsigned long iova, size_t size,
>   				    unsigned long flags,
