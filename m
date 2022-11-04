Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D138161A1EB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 21:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77A10E80B;
	Fri,  4 Nov 2022 20:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C810E80B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 20:11:25 +0000 (UTC)
Received: from [192.168.2.75] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E59A7660299E;
 Fri,  4 Nov 2022 20:11:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667592682;
 bh=K26ToBYpmKy0NrjP+qIPxtE3x8OgWYPbjNoDGDUZWl0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ACrwvNZP6zfxrDnYOCVujx6/y21QXOcrvSJHIwseLlhNbh9V8y4O+84VuNvXfVXf9
 EHUZiWK0y29EU0MVBWxY8krHQFJfd3yi36d1BX3EOOftuVdSmEWJ61i2jM9q052j+P
 8x+wK+U0gPylWyb1UwSM4KwCG90HSzXinsku0tfIw10aw/A/VqIATJ5e+1hrP+qcyp
 8bdPj6oTckVjn9SS/SVEUq63HM1cySSe0WXuI8H8FqrWJMOnp8bYVaBhHHIe5oKJbO
 DTBn54MStseYyVBI1rEWS7E1oCDQiUVhIVQ78N5/vhIGsqf7z6yjx5eSjyTqLfe7fI
 5EZnRZJvZ4cww==
Message-ID: <d2b1b693-7569-7f02-243f-570bf6790e4f@collabora.com>
Date: Fri, 4 Nov 2022 23:11:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/22 01:01, Robin Murphy wrote:
> Convert to io-pgtable's bulk {map,unmap}_pages() APIs, to help the old
> single-page interfaces eventually go away. Unmapping heap BOs still
> wants to be done a page at a time, but everything else can get the full
> benefit of the more efficient interface.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
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

This patch causes this WARN_ON to trigger. It doesn't happen all the
time, I see that the whole unmapped area is mapped. Initially, I thought
that this happens because it tries to unmap a partially mapped range,
but I checked that ops->iova_to_phys() returns address for all 4k chunks.

For example the pgsize * pgcount = 0x8000000, while returned
unmapped_page = 0x6000000.

I don't see this problem with this patch reverted. This is using today's
linux-next. Any ideas?

-- 
Best regards,
Dmitry

