Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A5259F8E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 22:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEAA6E8FB;
	Tue,  1 Sep 2020 20:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 618E46E8FB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 20:01:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75DA1FB;
 Tue,  1 Sep 2020 13:01:02 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CE313F66F;
 Tue,  1 Sep 2020 13:01:00 -0700 (PDT)
Subject: Re: [PATCH v9 17/32] drm: rockchip: fix common struct sg_table
 related issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362@eucas1p2.samsung.com>
 <20200826063316.23486-18-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d69bd263-c628-170d-3992-d717423196a2@arm.com>
Date: Tue, 1 Sep 2020 21:00:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-18-m.szyprowski@samsung.com>
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
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-26 07:33, Marek Szyprowski wrote:
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

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

(Until now I hadn't noticed the crimes against the API that 
rockchip_gem_get_pages() is committing, but it's not this patch's 
fault... I'll have to take a closer look at that)

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 23 +++++++++------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 2970e534e2bb..cb50f2ba2e46 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -36,8 +36,8 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
>   
>   	rk_obj->dma_addr = rk_obj->mm.start;
>   
> -	ret = iommu_map_sg(private->domain, rk_obj->dma_addr, rk_obj->sgt->sgl,
> -			   rk_obj->sgt->nents, prot);
> +	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
> +				prot);
>   	if (ret < rk_obj->base.size) {
>   		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
>   			  ret, rk_obj->base.size);
> @@ -98,11 +98,10 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>   	 * TODO: Replace this by drm_clflush_sg() once it can be implemented
>   	 * without relying on symbols that are not exported.
>   	 */
> -	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
> +	for_each_sgtable_sg(rk_obj->sgt, s, i)
>   		sg_dma_address(s) = sg_phys(s);
>   
> -	dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl, rk_obj->sgt->nents,
> -			       DMA_TO_DEVICE);
> +	dma_sync_sgtable_for_device(drm->dev, rk_obj->sgt, DMA_TO_DEVICE);
>   
>   	return 0;
>   
> @@ -350,8 +349,8 @@ void rockchip_gem_free_object(struct drm_gem_object *obj)
>   		if (private->domain) {
>   			rockchip_gem_iommu_unmap(rk_obj);
>   		} else {
> -			dma_unmap_sg(drm->dev, rk_obj->sgt->sgl,
> -				     rk_obj->sgt->nents, DMA_BIDIRECTIONAL);
> +			dma_unmap_sgtable(drm->dev, rk_obj->sgt,
> +					  DMA_BIDIRECTIONAL, 0);
>   		}
>   		drm_prime_gem_destroy(obj, rk_obj->sgt);
>   	} else {
> @@ -476,15 +475,13 @@ rockchip_gem_dma_map_sg(struct drm_device *drm,
>   			struct sg_table *sg,
>   			struct rockchip_gem_object *rk_obj)
>   {
> -	int count = dma_map_sg(drm->dev, sg->sgl, sg->nents,
> -			       DMA_BIDIRECTIONAL);
> -	if (!count)
> -		return -EINVAL;
> +	int err = dma_map_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL, 0);
> +	if (err)
> +		return err;
>   
>   	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
>   		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
> -		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
> -			     DMA_BIDIRECTIONAL);
> +		dma_unmap_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL, 0);
>   		return -EINVAL;
>   	}
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
