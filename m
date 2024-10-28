Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCE9B3697
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480AC10E502;
	Mon, 28 Oct 2024 16:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BFlP1loa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9510E373
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:35:03 +0000 (UTC)
Message-ID: <05117bb4-bf3b-477e-b21e-2160af64ab6a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730133301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znXkDjY1xS3DilYPhkg5uzcU1hSWEQ2y8y3HfKsuMXg=;
 b=BFlP1loa0NpZW7BiEqx0ledkPQ83h8Vq73costvrarxHC3ojj4rHto382UbZOTyWdy81KD
 zTay6x58D5lpfgxLLYEI3IJ5N2k2TPd8xvT9u69q9wFTL/JPkA5btwHL+f7EwzocIS5QJ0
 4uMdalQpCATnO/khn3Hov/nEzVGuq2U=
Date: Tue, 29 Oct 2024 00:34:51 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/etnaviv: Fix misunderstanding about the
 scatterlist structure
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241028160555.1006559-1-sui.jingfeng@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20241028160555.1006559-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi, Dear reviewers

On 2024/10/29 00:05, Sui Jingfeng wrote:
> The 'offset' data member of the 'struct scatterlist' denotes the offset
> into a SG entry in bytes. The sg_dma_len() macro could be used to get
> lengths of SG entries, those lengths are expected to be CPU page size
> aligned. Since, at least for now, we call drm_prime_pages_to_sg() to
> convert our various page array into an SG list. We pass the number of
> CPU page as the third argoument, to tell the size of the backing memory
> of GEM buffer object.
>
> drm_prime_pages_to_sg() call sg_alloc_table_from_pages_segment() do the
> work, sg_alloc_table_from_pages_segment() always hardcode the Offset to
> ZERO. The sizes of *all* SG enties will be a multiple of CPU page size,
> that is multiple of PAGE_SIZE.
>
> If the GPU want to map/unmap a bigger page partially, we should use
> 'sg_dma_address(sg) + sg->offset' to calculate the destination DMA
> address, and the size to be map/unmap is 'sg_dma_len(sg) - sg->offset'.
>
> While the current implement is wrong, but since the 'sg->offset' is
> alway equal to 0, drm/etnaviv works in practice by good luck. Fix this,
> to make it looks right at least from the perspective of concept.
>
> while at it, always fix the absue types:


'absue' -> 'abuse'


By the way, sorry I'm just receive your message from my Thunderbird client.


I sent those two patch first, then I run my Thunderbird client.

Not seeing that you have already merged part of my patch, then there will be
merge conflict I guess.

I think I could wait the next round and respin my patch.


> - sg_dma_address returns DMA address, the type is dma_addr_t, not
>    the phys_addr_t, for VRAM there may have another translation between
>    the bus address and the final physical address of VRAM or carved out
>    RAM.
>
> - The type of sg_dma_len(sg) return is unsigned int, not the size_t.
>    Avoid hint the compiler to do unnecessary integer promotion.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index 1661d589bf3e..4ee9ed96b1d8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -80,10 +80,10 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>   		return -EINVAL;
>   
>   	for_each_sgtable_dma_sg(sgt, sg, i) {
> -		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
> -		size_t bytes = sg_dma_len(sg) + sg->offset;
> +		dma_addr_t pa = sg_dma_address(sg) + sg->offset;
> +		unsigned int bytes = sg_dma_len(sg) - sg->offset;
>   
> -		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
> +		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
>   
>   		ret = etnaviv_context_map(context, da, pa, bytes, prot);
>   		if (ret)
> @@ -109,11 +109,11 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
>   	int i;
>   
>   	for_each_sgtable_dma_sg(sgt, sg, i) {
> -		size_t bytes = sg_dma_len(sg) + sg->offset;
> +		unsigned int bytes = sg_dma_len(sg) - sg->offset;
>   
>   		etnaviv_context_unmap(context, da, bytes);
>   
> -		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
> +		VERB("unmap[%d]: %08x(%x)", i, iova, bytes);
>   
>   		BUG_ON(!PAGE_ALIGNED(bytes));
>   

-- 
Best regards,
Sui

