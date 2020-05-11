Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD441CDF92
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519376E2BD;
	Mon, 11 May 2020 15:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3401A6E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:51:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9ED230E;
 Mon, 11 May 2020 08:51:24 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19DA63F305;
 Mon, 11 May 2020 08:51:22 -0700 (PDT)
Subject: Re: [PATCH v3 10/25] drm: panfrost: fix common struct sg_table
 related issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084629eucas1p23d2d6a53451e67e2b0a3544eb696008b@eucas1p2.samsung.com>
 <20200505084614.30424-10-m.szyprowski@samsung.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <eaaeae03-3fd4-fdd7-ec21-3218a5f74a28@arm.com>
Date: Mon, 11 May 2020 16:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505084614.30424-10-m.szyprowski@samsung.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2020 09:45, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the
> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of the entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. A common mistake was to ignore a result
> of the dma_map_sg function and don't use the sg_table->orig_nents at all.
> 
> To avoid such issues, lets use common dma-mapping wrappers operating
> directly on the struct sg_table objects and adjust references to the
> nents and orig_nents respectively.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

The change looks good to me:

Reviewed-by: Steven Price <steven.price@arm.com>

Although I would have appreciated the commit message being modified to 
match the specifics of Panfrost - the return of dma_mpa_sg() wasn't 
being ignored, but the use of orig_nents/nents was indeed wrong.

Steve

> ---
> For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
> ---
>   drivers/gpu/drm/panfrost/panfrost_gem.c | 4 ++--
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 17b654e..95d7e80 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -41,8 +41,8 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
>   
>   		for (i = 0; i < n_sgt; i++) {
>   			if (bo->sgts[i].sgl) {
> -				dma_unmap_sg(pfdev->dev, bo->sgts[i].sgl,
> -					     bo->sgts[i].nents, DMA_BIDIRECTIONAL);
> +				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
> +						  DMA_BIDIRECTIONAL);
>   				sg_free_table(&bo->sgts[i]);
>   			}
>   		}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index ed28aeb..9926111 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -517,10 +517,9 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>   	if (ret)
>   		goto err_pages;
>   
> -	if (!dma_map_sg(pfdev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL)) {
> -		ret = -EINVAL;
> +	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL);
> +	if (ret)
>   		goto err_map;
> -	}
>   
>   	mmu_map_sg(pfdev, bomapping->mmu, addr,
>   		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
