Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0B259E91
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 20:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ACB6E8CE;
	Tue,  1 Sep 2020 18:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C68CB6E8CE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 18:55:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3121FB;
 Tue,  1 Sep 2020 11:55:00 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168583F71F;
 Tue,  1 Sep 2020 11:54:56 -0700 (PDT)
Subject: Re: [PATCH v9 11/32] drm: mediatek: use common helper for extracting
 pages array
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063534eucas1p2647f5e9679f79f568e184b092f743f8b@eucas1p2.samsung.com>
 <20200826063316.23486-12-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <30f20ad6-783b-89c3-17b5-30c6a2587d23@arm.com>
Date: Tue, 1 Sep 2020 19:54:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-12-m.szyprowski@samsung.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-26 07:32, Marek Szyprowski wrote:
> Use common helper for converting a sg_table object into struct
> page pointer array.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Side note: is mtk_drm_gem_prime_vmap() missing a call to 
sg_free_table(sgt) before its kfree(sgt)?

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 3654ec732029..0583e557ad37 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   {
>   	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
>   	struct sg_table *sgt;
> -	struct sg_page_iter iter;
>   	unsigned int npages;
> -	unsigned int i = 0;
>   
>   	if (mtk_gem->kvaddr)
>   		return mtk_gem->kvaddr;
> @@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   	if (!mtk_gem->pages)
>   		goto out;
>   
> -	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
> -		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
> -		if (i > npages)
> -			break;
> -	}
> +	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
> +
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
