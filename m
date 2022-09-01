Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F745A9415
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6A010E690;
	Thu,  1 Sep 2022 10:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38BD510E690
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:17:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE857D6E;
 Thu,  1 Sep 2022 03:17:14 -0700 (PDT)
Received: from [10.1.39.17] (e122027.cambridge.arm.com [10.1.39.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DCA23F7B4;
 Thu,  1 Sep 2022 03:17:07 -0700 (PDT)
Message-ID: <029ebcb2-1c5b-0215-a6db-d22692205bb4@arm.com>
Date: Thu, 1 Sep 2022 11:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
Content-Language: en-GB
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-kernel@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 23:01, Robin Murphy wrote:
> Convert to io-pgtable's bulk {map,unmap}_pages() APIs, to help the old
> single-page interfaces eventually go away. Unmapping heap BOs still
> wants to be done a page at a time, but everything else can get the full
> benefit of the more efficient interface.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Looks correct to me. Although the voodoo magic does take a little bit of
figuring out ;)

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b285a8001b1d..e246d914e7f6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -248,11 +248,15 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
>  	mmu_write(pfdev, MMU_INT_MASK, ~0);
>  }
>  
> -static size_t get_pgsize(u64 addr, size_t size)
> +static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>  {
> -	if (addr & (SZ_2M - 1) || size < SZ_2M)
> -		return SZ_4K;
> +	size_t blk_offset = -addr % SZ_2M;
>  
> +	if (blk_offset || size < SZ_2M) {
> +		*count = min_not_zero(blk_offset, size) / SZ_4K;
> +		return SZ_4K;
> +	}
> +	*count = size / SZ_2M;
>  	return SZ_2M;
>  }
>  
> @@ -287,12 +291,16 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
>  		dev_dbg(pfdev->dev, "map: as=%d, iova=%llx, paddr=%lx, len=%zx", mmu->as, iova, paddr, len);
>  
>  		while (len) {
> -			size_t pgsize = get_pgsize(iova | paddr, len);
> +			size_t pgcount, mapped = 0;
> +			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
>  
> -			ops->map(ops, iova, paddr, pgsize, prot, GFP_KERNEL);
> -			iova += pgsize;
> -			paddr += pgsize;
> -			len -= pgsize;
> +			ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
> +				       GFP_KERNEL, &mapped);
> +			/* Don't get stuck if things have gone wrong */
> +			mapped = max(mapped, pgsize);
> +			iova += mapped;
> +			paddr += mapped;
> +			len -= mapped;
>  		}
>  	}
>  
> @@ -344,15 +352,17 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
>  		mapping->mmu->as, iova, len);
>  
>  	while (unmapped_len < len) {
> -		size_t unmapped_page;
> -		size_t pgsize = get_pgsize(iova, len - unmapped_len);
> +		size_t unmapped_page, pgcount;
> +		size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
>  
> -		if (ops->iova_to_phys(ops, iova)) {
> -			unmapped_page = ops->unmap(ops, iova, pgsize, NULL);
> -			WARN_ON(unmapped_page != pgsize);
> +		if (bo->is_heap)
> +			pgcount = 1;
> +		if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
> +			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
> +			WARN_ON(unmapped_page != pgsize * pgcount);
>  		}
> -		iova += pgsize;
> -		unmapped_len += pgsize;
> +		iova += pgsize * pgcount;
> +		unmapped_len += pgsize * pgcount;
>  	}
>  
>  	panfrost_mmu_flush_range(pfdev, mapping->mmu,

