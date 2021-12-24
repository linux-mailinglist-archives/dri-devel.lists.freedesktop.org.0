Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA347EEE4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 13:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51110E42C;
	Fri, 24 Dec 2021 12:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFD3E10E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 12:57:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E93E51FB;
 Fri, 24 Dec 2021 04:57:03 -0800 (PST)
Received: from [192.168.1.107] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCA9E3F718;
 Fri, 24 Dec 2021 04:57:02 -0800 (PST)
Message-ID: <3e52c550-5227-091d-5fd8-35eeb3411848@arm.com>
Date: Fri, 24 Dec 2021 12:56:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/panfrost: mmu: improved memory attributes
Content-Language: en-GB
To: asheplyakov@basealt.ru, dri-devel@lists.freedesktop.org
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-2-asheplyakov@basealt.ru>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211223110616.2589851-2-asheplyakov@basealt.ru>
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
Cc: "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-23 11:06, asheplyakov@basealt.ru wrote:
> From: Alexey Sheplyakov <asheplyakov@basealt.ru>
> 
> T62x/T60x GPUs are known to not work with panfrost as of now.
> One of the reasons is wrong/incomplete memory attributes which
> the panfrost driver sets in the page tables:
> 
> - MEMATTR_IMP_DEF should be 0x48ULL, not 0x88ULL.
>    0x88ULL is MEMATTR_OUTER_IMP_DEF

I guess the macro could be renamed if anyone's particularly bothered, 
but using the outer-cacheable attribute is deliberate because it is 
necessary for I/O-coherent GPUs to work properly (and should be 
irrelevant for non-coherent integrations). I'm away from my Juno board 
for the next couple of weeks but I'm fairly confident that this change 
as-is will break cache snooping.

> - MEMATTR_FORCE_CACHE_ALL and MEMATTR_OUTER_WA are missing.

They're "missing" because they're not used, and there's currently no 
mechanism by which they *could* be used. Also note that the indices in 
MEMATTR have to line up with the euqivalent LPAE indices for the closest 
match to what the IOMMU API's IOMMU_{CACHE,MMIO} flags represent, so 
moving those around is yet more subtle breakage.

> T72x and newer GPUs work just fine with such incomplete/wrong memory
> attributes. However T62x are quite picky and quickly lock up.
> 
> To avoid the problem set the same memory attributes (in LPAE page
> tables) as mali_kbase.
> 
> The patch has been tested (for regressions) with T860 GPU (rk3399 SoC).
> At the first glance (using GNOME desktop, running glmark) it does
> not cause any changes for this GPU.
> 
> Note: this patch is necessary, but *not* enough to get panfrost
> working with T62x

I'd note that panfrost has been working OK - to the extent that Mesa 
supports its older ISA - on the T624 (single core group) in Arm's Juno 
SoC for over a year now since commit 268af50f38b1.

If you have to force outer non-cacheable to avoid getting translation 
faults and other errors that look like the GPU is inexplicably seeing 
the wrong data, I'd check whether you have the same thing where your 
integration is actually I/O-coherent and you're missing the 
"dma-coherent" property in your DT.

Thanks,
Robin.

> Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
> Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c |  3 ---
>   drivers/iommu/io-pgtable-arm.c          | 16 ++++++++++++----
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 39562f2d11a4..2f4f8a17bc82 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -133,9 +133,6 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
>   	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
>   	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>   
> -	/* Need to revisit mem attrs.
> -	 * NC is the default, Mali driver is inner WT.
> -	 */
>   	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>   	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>   
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dd9e47189d0d..15b39c337e20 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -122,13 +122,17 @@
>   #define ARM_LPAE_MAIR_ATTR_IDX_CACHE	1
>   #define ARM_LPAE_MAIR_ATTR_IDX_DEV	2
>   #define ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE	3
> +#define ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA 4
>   
>   #define ARM_MALI_LPAE_TTBR_ADRMODE_TABLE (3u << 0)
>   #define ARM_MALI_LPAE_TTBR_READ_INNER	BIT(2)
>   #define ARM_MALI_LPAE_TTBR_SHARE_OUTER	BIT(4)
>   
> -#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x88ULL
> -#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
> +#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x48ULL
> +#define ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL 0x4FULL
> +#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x4DULL
> +#define ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF 0x88ULL
> +#define ARM_MALI_LPAE_MEMATTR_OUTER_WA 0x8DULL
>   
>   #define APPLE_DART_PTE_PROT_NO_WRITE (1<<7)
>   #define APPLE_DART_PTE_PROT_NO_READ (1<<8)
> @@ -1080,10 +1084,14 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   	cfg->arm_mali_lpae_cfg.memattr =
>   		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
>   		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_NC)) |
> +		(ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL
> +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
>   		(ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC
>   		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
> -		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
> -		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
> +		(ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF
> +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
> +		(ARM_MALI_LPAE_MEMATTR_OUTER_WA
> +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA));
>   
>   	data->pgd = __arm_lpae_alloc_pages(ARM_LPAE_PGD_SIZE(data), GFP_KERNEL,
>   					   cfg);
