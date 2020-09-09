Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382F262E74
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7486EB62;
	Wed,  9 Sep 2020 12:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 005CD6EB62
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:23:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC786101E;
 Wed,  9 Sep 2020 05:23:30 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22013F68F;
 Wed,  9 Sep 2020 05:23:29 -0700 (PDT)
Subject: Re: [PATCH 1/5] iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable
 shareability on ARM LPAE
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-2-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f8ec460a-d61f-852d-2620-a49306bb1de4@arm.com>
Date: Wed, 9 Sep 2020 13:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-2-narmstrong@baylibre.com>
Content-Language: en-GB
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject: s/BROKEN_NS/BROKEN_SH/

Steve

On 08/09/2020 16:18, Neil Armstrong wrote:
> The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
> is broken and leads to constant and random faults from the IOMMU.
> 
> Disabling shareability completely fixes the issue.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 7 ++++---
>   include/linux/io-pgtable.h     | 4 ++++
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dc7bcf858b6d..d2d48dc86556 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -440,7 +440,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>   				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>   	}
>   
> -	if (prot & IOMMU_CACHE)
> +	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_BROKEN_SH)
> +		pte |= ARM_LPAE_PTE_SH_NS;
> +	else if (prot & IOMMU_CACHE)
>   		pte |= ARM_LPAE_PTE_SH_IS;
>   	else
>   		pte |= ARM_LPAE_PTE_SH_OS;
> @@ -1005,8 +1007,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   {
>   	struct arm_lpae_io_pgtable *data;
>   
> -	/* No quirks for Mali (hopefully) */
> -	if (cfg->quirks)
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_BROKEN_SH))
>   		return NULL;
>   
>   	if (cfg->ias > 48 || cfg->oas > 40)
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 23285ba645db..efb9c8f20909 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>   	 *	for use in the upper half of a split address space.
> +	 *
> +	 * IO_PGTABLE_QUIRK_ARM_BROKEN_SH: (ARM LPAE format) Disables shareability
> +	 *	when coherency integration is broken.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
> @@ -93,6 +96,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
>   	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
>   	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
> +	#define IO_PGTABLE_QUIRK_ARM_BROKEN_SH	BIT(6)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
