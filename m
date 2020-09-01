Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B241259E38
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 20:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5626E8D1;
	Tue,  1 Sep 2020 18:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A7216E8C9;
 Tue,  1 Sep 2020 18:39:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662D11FB;
 Tue,  1 Sep 2020 11:39:38 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9C8F3F71F;
 Tue,  1 Sep 2020 11:39:34 -0700 (PDT)
Subject: Re: [PATCH v9 05/32] drm: etnaviv: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063530eucas1p16acb847d7da0ea734bef507688a76c5a@eucas1p1.samsung.com>
 <20200826063316.23486-6-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <57a23432-87f3-c6b3-0623-1ddd3c569e90@arm.com>
Date: Tue, 1 Sep 2020 19:39:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-6-m.szyprowski@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-26 07:32, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
> 
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
> 
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 +++++-------
>   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 13 +++----------
>   2 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index f06e19e7be04..eaf1949bc2e4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -27,7 +27,7 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
>   	 * because display controller, GPU, etc. are not coherent.
>   	 */
>   	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
> -		dma_map_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
> +		dma_map_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>   }
>   
>   static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
> @@ -51,7 +51,7 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
>   	 * discard those writes.
>   	 */
>   	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
> -		dma_unmap_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
> +		dma_unmap_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>   }
>   
>   /* called with etnaviv_obj->lock held */
> @@ -404,9 +404,8 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
>   	}
>   
>   	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
> -		dma_sync_sg_for_cpu(dev->dev, etnaviv_obj->sgt->sgl,
> -				    etnaviv_obj->sgt->nents,
> -				    etnaviv_op_to_dma_dir(op));
> +		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
> +					 etnaviv_op_to_dma_dir(op));
>   		etnaviv_obj->last_cpu_prep_op = op;
>   	}
>   
> @@ -421,8 +420,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
>   	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>   		/* fini without a prep is almost certainly a userspace error */
>   		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
> -		dma_sync_sg_for_device(dev->dev, etnaviv_obj->sgt->sgl,
> -			etnaviv_obj->sgt->nents,
> +		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
>   			etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
>   		etnaviv_obj->last_cpu_prep_op = 0;
>   	}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index 3607d348c298..13b100553a0b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -79,7 +79,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>   	if (!context || !sgt)
>   		return -EINVAL;
>   
> -	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
>   		u32 pa = sg_dma_address(sg) - sg->offset;
>   		size_t bytes = sg_dma_len(sg) + sg->offset;
>   
> @@ -95,14 +95,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>   	return 0;
>   
>   fail:
> -	da = iova;
> -
> -	for_each_sg(sgt->sgl, sg, i, j) {
> -		size_t bytes = sg_dma_len(sg) + sg->offset;
> -
> -		etnaviv_context_unmap(context, da, bytes);
> -		da += bytes;
> -	}
> +	etnaviv_context_unmap(context, iova, da - iova);

I had to take a closer look to figure this out, but AFAICS it does 
indeed work out as a simpler way of achieving the exact same result, and 
in fact neatly mirrors how etnaviv_context_map() itself cleans up.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

>   	return ret;
>   }
>   
> @@ -113,7 +106,7 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
>   	unsigned int da = iova;
>   	int i;
>   
> -	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
>   		size_t bytes = sg_dma_len(sg) + sg->offset;
>   
>   		etnaviv_context_unmap(context, da, bytes);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
