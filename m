Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701E27B064
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3E489D4B;
	Mon, 28 Sep 2020 14:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1487689D4B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 14:59:11 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A80C21974;
 Mon, 28 Sep 2020 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601305150;
 bh=5ymSvknDn6nUQNSDP3i0GXvhB11Sl5F2mvHL8TiNGAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTBK1StoSdAzLTkbX9Cbg2wlNIZTB/tA/FfgNDKflPWf7wT6VjOIhBjhNw2ZSd6Q6
 W5lOIasPWg6JKGHX3oU6h6mf+f3cmLN7xUjbUy+xTfncoWwgb8aVhuMFPP2n18zhnm
 vO0fOlie8+JkqEo8l6YX6+XX93iCzTrjUlBBDAu4=
Date: Mon, 28 Sep 2020 15:59:05 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Support coherency for Mali
 LPAE
Message-ID: <20200928145904.GA11610@willie-the-truck>
References: <cover.1600780574.git.robin.murphy@arm.com>
 <8df778355378127ea7eccc9521d6427e3e48d4f2.1600780574.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8df778355378127ea7eccc9521d6427e3e48d4f2.1600780574.git.robin.murphy@arm.com>
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
Cc: tomeu.vizoso@collabora.com, narmstrong@baylibre.com, khilman@baylibre.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 03:16:48PM +0100, Robin Murphy wrote:
> Midgard GPUs have ACE-Lite master interfaces which allows systems to
> integrate them in an I/O-coherent manner. It seems that from the GPU's
> viewpoint, the rest of the system is its outer shareable domain, and so
> even when snoop signals are wired up, they are only emitted for outer
> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> indeed get coherent pagetable walks working nicely for the coherent
> T620 in the Arm Juno SoC.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dc7bcf858b6d..b4072a18e45d 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -440,7 +440,13 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>  	}
>  
> -	if (prot & IOMMU_CACHE)
> +	/*
> +	 * Also Mali has its own notions of shareability wherein its Inner
> +	 * domain covers the cores within the GPU, and its Outer domain is
> +	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
> +	 * terms, depending on coherency).
> +	 */
> +	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
>  		pte |= ARM_LPAE_PTE_SH_IS;
>  	else
>  		pte |= ARM_LPAE_PTE_SH_OS;
> @@ -1049,6 +1055,9 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
>  					  ARM_MALI_LPAE_TTBR_READ_INNER |
>  					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
> +	if (cfg->coherent_walk)
> +		cfg->arm_mali_lpae_cfg.transtab |= ARM_MALI_LPAE_TTBR_SHARE_OUTER;
> +

Acked-by: Will Deacon <will@kernel.org>

I'm assuming I'm not the right person to merge this, and it needs to go
alongside the other patches in this series.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
