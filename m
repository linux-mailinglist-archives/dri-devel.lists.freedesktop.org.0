Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0492AA0BCE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE4510E43F;
	Tue, 29 Apr 2025 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2C10E433;
 Tue, 29 Apr 2025 12:38:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFAA1515;
 Tue, 29 Apr 2025 05:38:47 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D213F66E;
 Tue, 29 Apr 2025 05:38:52 -0700 (PDT)
Message-ID: <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
Date: Tue, 29 Apr 2025 13:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250428205619.227835-4-robdclark@gmail.com>
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

On 28/04/2025 9:54 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping squence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
>   include/linux/io-pgtable.h     |  8 ++++++++
>   2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f27965caf6a1..99523505dac5 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>   		cptep = iopte_deref(pte, data);
>   	} else if (pte) {
>   		/* We require an unmap first */
> -		WARN_ON(!selftest_running);
> +		WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));

If we are going to have this as a general mechanism then the selftests 
should use it as well.

Thanks,
Robin.

>   		return -EEXIST;
>   	}
>   
> @@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>   	ptep += unmap_idx_start;
>   	pte = READ_ONCE(*ptep);
> -	if (WARN_ON(!pte))
> -		return 0;
> +	if (!pte) {
> +		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
> +		return -ENOENT;
> +	}
>   
>   	/* If the size matches this level, we're in the right place */
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> @@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		/* Find and handle non-leaf entries */
>   		for (i = 0; i < num_entries; i++) {
>   			pte = READ_ONCE(ptep[i]);
> -			if (WARN_ON(!pte))
> +			if (!pte) {
> +				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   				break;
> +			}
>   
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> @@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>   			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> -			    IO_PGTABLE_QUIRK_ARM_HD))
> +			    IO_PGTABLE_QUIRK_ARM_HD |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   	struct arm_lpae_io_pgtable *data;
>   	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
>   
> -	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index bba2a51c87d2..639b8f4fb87d 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>   	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> +	 *
> +	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> +	 *	mappings, but silently return -EEXISTS.  Normally an attempt
> +	 *	to map over an existing mapping would indicate some sort of
> +	 *	kernel bug, which would justify the WARN_ON().  But for GPU
> +	 *	drivers, this could be under control of userspace.  Which
> +	 *	deserves an error return, but not to spam dmesg.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>   	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
>   	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
> +	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;
