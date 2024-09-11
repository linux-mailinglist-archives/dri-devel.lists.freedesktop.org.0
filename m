Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13C974EB7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 11:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFA910E986;
	Wed, 11 Sep 2024 09:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Y27qBEEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C4510E980
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 09:37:17 +0000 (UTC)
Message-ID: <b0c651c1-acd6-4ca0-8791-f6bc16821a1e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1726047434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHDHiEMHosYpLAW4Qgb4jQgwOUHe1qbO/5lSaaVcNzU=;
 b=Y27qBEEQSl6iBpTk/r6wFrosW192/nqtNwOuLxYqVJwqsmocFAiKxc11h3vImROIjhsvrS
 eqWpR0tkwQMYwACTqamCVPxWCtGjq31v3nJ2ivHX3S2eTCIu1HTVLQMFqvWwBfrVMShk+W
 SNGtY4kz80KGfzUgiFglN3MjczOj3nw=
Date: Wed, 11 Sep 2024 17:37:02 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
To: Xiaolei Wang <xiaolei.wang@windriver.com>, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
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

Humble ping ?

On 9/3/24 10:08, Xiaolei Wang wrote:
> Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
> and since all vivante GPUs in the system will share the same
> DMA constraints, move the check of whether to get a page from
> DMA32 to etnaviv_bind().
> 
> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
> Suggested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> 
> change log
> 
> v1:
>    https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/
> 
> v2:
>    Modify the issue of not retaining GFP_USER in v1 and update the commit log.
> 
> v3:
>    Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
> instead of
>    "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
> and move the check of whether to get a page from DMA32 to etnaviv_bind().
> 
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..8cb2c3ec8e5d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
>   	mutex_init(&priv->gem_lock);
>   	INIT_LIST_HEAD(&priv->gem_list);
>   	priv->num_gpus = 0;
> -	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +	priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +
> +	/*
> +	 * If the GPU is part of a system with DMA addressing limitations,
> +	 * request pages for our SHM backend buffers from the DMA32 zone to
> +	 * hopefully avoid performance killing SWIOTLB bounce buffering.
> +	 */
> +	if (dma_addressing_limited(dev))
> +		priv->shm_gfp_mask |= GFP_DMA32;
>   
>   	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
>   	if (IS_ERR(priv->cmdbuf_suballoc)) {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..5e753dd42f72 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>   	if (ret)
>   		goto fail;
>   
> -	/*
> -	 * If the GPU is part of a system with DMA addressing limitations,
> -	 * request pages for our SHM backend buffers from the DMA32 zone to
> -	 * hopefully avoid performance killing SWIOTLB bounce buffering.
> -	 */
> -	if (dma_addressing_limited(gpu->dev))
> -		priv->shm_gfp_mask |= GFP_DMA32;
> -
>   	/* Create buffer: */
>   	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>   				  PAGE_SIZE);

-- 
Best regards
Sui

