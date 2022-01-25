Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64349B9EA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E530610E3AE;
	Tue, 25 Jan 2022 17:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9F710E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 17:16:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s9so5338540wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ip9QY7zbgHoBedWEAtkhEeNBkMTXi2kA2zwUG0XrD4U=;
 b=VhFziBpQS+BgyYcxeR6FO/RIPOaymjWeADraw8L6SSHCfMgOAO+8NWtCsi3wFPY5pK
 vOMNY3mpzXoMn/b0TIqBbNJ0QgdiZ2kRn+eKoZiE6CcX5GPVJVpwHmpDb50w1qkEN0OY
 nNnV8slAGRY69FiVD0w2TXMmyRnlqhAKWbf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ip9QY7zbgHoBedWEAtkhEeNBkMTXi2kA2zwUG0XrD4U=;
 b=etMKLXb1WlhqDG9I3I78dEcK3nyJeBT3kbLuBWNkJGzzl3G46GyaqK+2HlLpyXmyTJ
 9/scOgu1QVR/wPHW2GlEhLlVA2e7MckB9vG1qNxXxOjWkTgsqo0mqHHduZpmlAMAp5le
 9rdvRzjoh2q1mX/PvAV7BEuNisfJmNe2QoPOg/CaVM1RTjey9SCRGYFRlddA3dXoEP9p
 w/0i/Y/gxaaqMNggru+mDp2MzzwEmLVwyUTwS4AXENJrf4fZklck8sGAZNuHqJ4cesNH
 WR2SjDiQ6igqvEpgL9u/wC8/sgnJAXeiUW4HtUKn6clPM7MQC17WzPzvH7qII1nLD9gl
 FSOA==
X-Gm-Message-State: AOAM530cgnKh8NMiaMEzxczp8vJaICbUjbPDwnqWP6biBAAyXdWVrEmU
 l4sHODjfAoqg0zfSuS4eT0zLwg==
X-Google-Smtp-Source: ABdhPJzUpOgzL4pbsqej+W4bDqk/EslVkG4YtU63nFe7rBistUT2gF4PMEa4pqetDw5HoiAPwzuyyQ==
X-Received: by 2002:adf:c843:: with SMTP id e3mr19581440wrh.38.1643131007268; 
 Tue, 25 Jan 2022 09:16:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a6sm9673448wrx.101.2022.01.25.09.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:16:46 -0800 (PST)
Date: Tue, 25 Jan 2022 18:16:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 11/12] drm/ttm: allow bulk moves for all domains
Message-ID: <YfAwffdiRfcjrOUE@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-12-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122514.1832-12-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 01:25:13PM +0100, Christian König wrote:
> Not just TT and VRAM.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 49 +++++++++---------------------
>  include/drm/ttm/ttm_device.h       |  2 --
>  include/drm/ttm/ttm_resource.h     |  4 +--
>  3 files changed, 16 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 9e68d36a1546..2ea8fb83377e 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -51,36 +51,23 @@ EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>   */
>  void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  {
> -	unsigned i;
> -
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
> -		struct ttm_resource_manager *man;
> +	unsigned i, j;
>  
> -		if (!pos->first)
> -			continue;
> +	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
> +		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> +			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
> +			struct ttm_resource_manager *man;
>  
> -		dma_resv_assert_held(pos->first->bo->base.resv);
> -		dma_resv_assert_held(pos->last->bo->base.resv);
> +			if (!pos->first)
> +				continue;
>  
> -		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
> -		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> -				    &pos->last->lru);
> -	}
> -
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
> -		struct ttm_resource_manager *man;
> +			dma_resv_assert_held(pos->first->bo->base.resv);
> +			dma_resv_assert_held(pos->last->bo->base.resv);
>  
> -		if (!pos->first)
> -			continue;
> -
> -		dma_resv_assert_held(pos->first->bo->base.resv);
> -		dma_resv_assert_held(pos->last->bo->base.resv);
> -
> -		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
> -		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
> -				    &pos->last->lru);
> +			man = ttm_manager_type(pos->first->bo->bdev, i);
> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
> +					    &pos->last->lru);
> +		}
>  	}
>  }
>  EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
> @@ -118,15 +105,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>  	if (!bulk)
>  		return;
>  
> -	switch (res->mem_type) {
> -	case TTM_PL_TT:
> -		ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
> -		break;
> -
> -	case TTM_PL_VRAM:
> -		ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
> -		break;
> -	}
> +	ttm_lru_bulk_move_set_pos(&bulk->pos[res->mem_type][bo->priority], res);
>  }
>  
>  void ttm_resource_init(struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 0a4ddec78d8f..425150f35fbe 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -30,8 +30,6 @@
>  #include <drm/ttm/ttm_resource.h>
>  #include <drm/ttm/ttm_pool.h>
>  
> -#define TTM_NUM_MEM_TYPES 8
> -
>  struct ttm_device;
>  struct ttm_placement;
>  struct ttm_buffer_object;
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 13da5e337350..1556d1f62251 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -37,6 +37,7 @@
>  #include <drm/ttm/ttm_kmap_iter.h>
>  
>  #define TTM_MAX_BO_PRIORITY	4U
> +#define TTM_NUM_MEM_TYPES 8
>  
>  struct ttm_device;
>  struct ttm_resource_manager;
> @@ -216,8 +217,7 @@ struct ttm_lru_bulk_move_pos {
>   * Helper structure for bulk moves on the LRU list.
>   */
>  struct ttm_lru_bulk_move {
> -	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> -	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> +	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];

256 bytes per client vm for embedding this seems acceptable. And we can
make this smarter if there's ever a need. I didn't fully check your code
movement (dinner is calling!) but lgtm.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
