Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F053F259D8C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 19:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327CC6E3D2;
	Tue,  1 Sep 2020 17:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14AFD6E3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 17:46:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 679CC1FB;
 Tue,  1 Sep 2020 10:46:44 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A5AC3F71F;
 Tue,  1 Sep 2020 10:46:37 -0700 (PDT)
Subject: Re: [PATCH v9 03/32] drm: core: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063529eucas1p19d797cf74bf653bf68b0a0e860806dbf@eucas1p1.samsung.com>
 <20200826063316.23486-4-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a96aefea-936a-e54d-1604-93902443b360@arm.com>
Date: Tue, 1 Sep 2020 18:46:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-4-m.szyprowski@samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/gpu/drm/drm_cache.c            |  2 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++-----
>   drivers/gpu/drm/drm_prime.c            | 11 ++++++-----
>   3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 03e01b000f7a..0fe3c496002a 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -127,7 +127,7 @@ drm_clflush_sg(struct sg_table *st)
>   		struct sg_page_iter sg_iter;
>   
>   		mb(); /*CLFLUSH is ordered only by using memory barriers*/
> -		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
> +		for_each_sgtable_page(st, &sg_iter, 0)
>   			drm_clflush_page(sg_page_iter_page(&sg_iter));
>   		mb(); /*Make sure that all cache line entry is flushed*/
>   
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4b7cfbac4daa..47d8211221f2 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -126,8 +126,8 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
>   		drm_prime_gem_destroy(obj, shmem->sgt);
>   	} else {
>   		if (shmem->sgt) {
> -			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> -				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
> +			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
> +					  DMA_BIDIRECTIONAL, 0);
>   			sg_free_table(shmem->sgt);
>   			kfree(shmem->sgt);
>   		}
> @@ -424,8 +424,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
>   
>   	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
>   
> -	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> -		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
> +	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
>   	sg_free_table(shmem->sgt);
>   	kfree(shmem->sgt);
>   	shmem->sgt = NULL;
> @@ -697,12 +696,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
>   		goto err_put_pages;
>   	}
>   	/* Map the pages for use by the h/w. */
> -	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
> +	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> +	if (ret)
> +		goto err_free_sgt;
>   
>   	shmem->sgt = sgt;
>   
>   	return sgt;
>   
> +err_free_sgt:
> +	sg_free_table(sgt);
> +	kfree(sgt);

Should this be a separate patch to add the missing error handling to the 
existing code first?

Otherwise the rest of the mechanical conversion looks straightforward 
enough, and I'm not the separation-of-concerns police (for this 
subsystem, at least), so either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

>   err_put_pages:
>   	drm_gem_shmem_put_pages(shmem);
>   	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 5d181bf60a44..c45b0cc6e31d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -617,6 +617,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
>   {
>   	struct drm_gem_object *obj = attach->dmabuf->priv;
>   	struct sg_table *sgt;
> +	int ret;
>   
>   	if (WARN_ON(dir == DMA_NONE))
>   		return ERR_PTR(-EINVAL);
> @@ -626,11 +627,12 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
>   	else
>   		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
>   
> -	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
> +	ret = dma_map_sgtable(attach->dev, sgt, dir,
> +			      DMA_ATTR_SKIP_CPU_SYNC);
> +	if (ret) {
>   		sg_free_table(sgt);
>   		kfree(sgt);
> -		sgt = ERR_PTR(-ENOMEM);
> +		sgt = ERR_PTR(ret);
>   	}
>   
>   	return sgt;
> @@ -652,8 +654,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>   	if (!sgt)
>   		return;
>   
> -	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> -			   DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
>   	sg_free_table(sgt);
>   	kfree(sgt);
>   }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
