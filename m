Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21114597995
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48600998F8;
	Wed, 17 Aug 2022 22:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8D8A0704
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:20:10 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 718EA6601A13;
 Wed, 17 Aug 2022 23:20:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660774808;
 bh=GY783aKdj+LMZA7Y3XK9LwFF752m6OKXTMstsN33dZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bxFs3F7/bpMmZw8fmDg1QOD6U9oBlRbjmd3mSOfyVvm1kCJFuv1uYMttqqW80cmGE
 arFs9ZTrrhhQ05tUnQP/s3qawW8Wj3OgaKYBPmP87sUAlACBpZtg+3HJEGwYKNRcCT
 EWcV0gtSf6z4P/7EF/lclPEO/w+E4YapcW6I0gOT2ZllN6o3PXUfC62JreL5cALS3b
 ZvSuQk/l2Dhx6AwfIJU2J74eZ/Mz9aWJLH9ta5adNVr0rrMX7pnxqfqZFeh+MmoSbq
 JBumh9ammRgFfwl+bCKRz/E/1YjG4Pxj+bUfMOfKJWt5ZVyY/O1YaaYg00lrU9xvvV
 SQlI76IF3MOIQ==
Message-ID: <e9be29c0-e740-3f3b-db64-ead0baa866f3@collabora.com>
Date: Thu, 18 Aug 2022 01:20:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/ttm: prevent grabbing page references
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220815130848.33492-1-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220815130848.33492-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 16:08, Christian König wrote:
> TTM owns the pages it uses for backing buffer objects with system
> memory. Because of this it is absolutely illegal to mess around with
> the reference count of those pages.
> 
> So make sure that nobody ever tries to grab an extra reference on
> pages allocated through the page pool.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 1bba0a0ed3f9..cbca84dbd83f 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -93,8 +93,17 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  	if (!pool->use_dma_alloc) {
>  		p = alloc_pages(gfp_flags, order);
> -		if (p)
> +		if (p) {
>  			p->private = order;
> +
> +			/* The pages are fully owned by TTM and because of this
> +			 * it's illegal to grab extra references to it or
> +			 * otherwise we corrupt TTMs internal state. Make sure
> +			 * nobody tries to ever increase the reference count of
> +			 * those pages.
> +			 */
> +			set_page_count(p, 0);
> +		}
>  		return p;
>  	}
>  
> @@ -144,6 +153,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> +		/* See alloc why references to TTMs pages are illegal */
> +		WARN_ON(page_count(p));
> +		set_page_count(p, 1);
>  		__free_pages(p, order);
>  		return;
>  	}

Could you please explain why you're skipping the DMA pages?

-- 
Best regards,
Dmitry
