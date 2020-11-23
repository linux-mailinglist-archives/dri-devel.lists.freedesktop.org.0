Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B292C0E59
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 16:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B5F6E038;
	Mon, 23 Nov 2020 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AFB6E038;
 Mon, 23 Nov 2020 15:06:23 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9C382067C;
 Mon, 23 Nov 2020 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606143983;
 bh=XD8rVd28+XoVE6Niy838CzRctkhXNnkgWMtq4ss4S6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkN7pEpWrgc47kAtsM1YZxYjF7U4zxCaCMvaBrYkdn38WMmxqNq1bL0QllxbQ2OiI
 HiVVgNoAN80zM6pFh8rptXYtwoSjorvo383HP4ZmKaNyKlLtUm4yYDEv7oHSU80qlV
 JUo17ZMRS4dOVbS5+lSI0dfzFlfBTgeAD/kNhuHU=
Date: Mon, 23 Nov 2020 15:06:17 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 1/8] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20201123150616.GB11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <699f30cd6b3d69cebbefd0e73850694b9852c5da.1605621785.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <699f30cd6b3d69cebbefd0e73850694b9852c5da.1605621785.git.saiprakash.ranjan@codeaurora.org>
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
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 08:00:40PM +0530, Sai Prakash Ranjan wrote:
> Add a quirk IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to override
> the attributes set in TCR for the page table walker when
> using system cache.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 10 ++++++++--
>  include/linux/io-pgtable.h     |  4 ++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..7c9ea9d7874a 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>  			    IO_PGTABLE_QUIRK_NON_STRICT |
> -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
> +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
> +			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
>  		return NULL;
>  
>  	data = arm_lpae_alloc_pgtable(cfg);
> @@ -773,10 +774,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  		tcr->sh = ARM_LPAE_TCR_SH_IS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
>  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> +		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
> +			goto out_free_data;
>  	} else {
>  		tcr->sh = ARM_LPAE_TCR_SH_OS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> -		tcr->orgn = ARM_LPAE_TCR_RGN_NC;
> +		if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
> +			tcr->orgn = ARM_LPAE_TCR_RGN_NC;
> +		else
> +			tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
>  	}
>  
>  	tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 4cde111e425b..a9a2c59fab37 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>  	 *
>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>  	 *	for use in the upper half of a split address space.
> +	 *
> +	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the attributes set in TCR for
> +	 *	the page table walker when using system cache.

Please can you reword this to say:

  "Override the outer-cacheability attributes set in the TCR for a non-coherent
   page-table walker."

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
