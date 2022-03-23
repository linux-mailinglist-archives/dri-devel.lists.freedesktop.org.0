Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C64E5076
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184D10E66D;
	Wed, 23 Mar 2022 10:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C8F10E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:37:41 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id r13so1939243ejd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fkmxKcLLxhgq3djrdhG6UMV2K9gNFmboANCVKCOVXtk=;
 b=I29seQt/XZsJq2WiNXQbO7fDEEieNv0QW3Mr4vk/5hzEXb3ri7bIi+sJgOz+euIfTp
 yrcgK4Am4GBAWmlSmljEHDfcksMTNndxjZDfTaY1gzAhe7Qouj5jRUWP1ebcR+zBt4r1
 +fWvpdiOyyR7zyFrDP6i+uLkmIJYdUwAg98TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fkmxKcLLxhgq3djrdhG6UMV2K9gNFmboANCVKCOVXtk=;
 b=fLYFvxWiQiR5/wqMTaNDsgsnWTAFUy7wq+TDZW4qsfGBTMEqodYM+dcaqbhud9wabQ
 MCOUIve/0Q3T/lll8J9cvKZgwIObB7ovVTj5j500EwGv0R/SYJ4cvjhHRGiOnX+T482j
 BQow/2R/o0oq7tnbmpZk4SeQAhRR1fmvcXPPqlEntIn2LNbnEvD8ccnqXGrAwYXbAkLT
 a3WYdayGtU2u+laDiwYtMYSvqLhNzBZXpQ5k0oCOSWazy+aoCNv0J0nwzWU7MGFxXPJV
 fl/Vj6cTsHBW7zC4dVk1aPXJFEl7bvfiF2hEWj3BTnSSabPITlkbtLXZY0j62ekBGAlu
 lrOw==
X-Gm-Message-State: AOAM533VkqPKpYFIrVxjyzUabUhq4MKDmcvvIyWXArfGe4lBhqhZHDSZ
 gj0X76+FzAgQMRs7roudGiSQIQ==
X-Google-Smtp-Source: ABdhPJxKojAbYSir2UryVBnhcG04zZAsVSHrYYzwGET5MtJEMASsOwgIyZEwetEU9I2x1CHCZuxNXQ==
X-Received: by 2002:a17:906:6158:b0:6ce:61d6:f243 with SMTP id
 p24-20020a170906615800b006ce61d6f243mr29632167ejl.268.1648031859746; 
 Wed, 23 Mar 2022 03:37:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hg11-20020a1709072ccb00b006cee4fb36c7sm9680117ejc.64.2022.03.23.03.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:37:39 -0700 (PDT)
Date: Wed, 23 Mar 2022 11:37:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/6] drm/ttm: de-inline ttm_bo_pin/unpin
Message-ID: <Yjr4cUdHvqJhOy7G@phenom.ffwll.local>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <20220321132601.2161-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321132601.2161-4-christian.koenig@amd.com>
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
Cc: felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:25:59PM +0100, Christian König wrote:
> Those functions are going to become more complex, don't inline them any
> more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo_api.h | 30 ++----------------------------
>  2 files changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index b119af33e7d7..502617ee9303 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -633,6 +633,37 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  	return ret;
>  }
>  
> +/**
> + * ttm_bo_pin - Pin the buffer object.
> + * @bo: The buffer object to pin
> + *
> + * Make sure the buffer is not evicted any more during memory pressure.

Maybe add kerneldoc cross links here while at it.

"@bo must be unpinned again by calling ttm_bo_unpin()."

or whatever you prefer.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
> +void ttm_bo_pin(struct ttm_buffer_object *bo)
> +{
> +	dma_resv_assert_held(bo->base.resv);
> +	WARN_ON_ONCE(!kref_read(&bo->kref));
> +	++bo->pin_count;
> +}
> +EXPORT_SYMBOL(ttm_bo_pin);
> +
> +/**
> + * ttm_bo_unpin - Unpin the buffer object.
> + * @bo: The buffer object to unpin
> + *
> + * Allows the buffer object to be evicted again during memory pressure.
> + */
> +void ttm_bo_unpin(struct ttm_buffer_object *bo)
> +{
> +	dma_resv_assert_held(bo->base.resv);
> +	WARN_ON_ONCE(!kref_read(&bo->kref));
> +	if (bo->pin_count)
> +		--bo->pin_count;
> +	else
> +		WARN_ON_ONCE(true);
> +}
> +EXPORT_SYMBOL(ttm_bo_unpin);
> +
>  /*
>   * Add the last move fence to the BO and reserve a new shared slot. We only use
>   * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 3da77fc54552..885b7698fd65 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -524,34 +524,8 @@ ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
>  int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  		   gfp_t gfp_flags);
>  
> -/**
> - * ttm_bo_pin - Pin the buffer object.
> - * @bo: The buffer object to pin
> - *
> - * Make sure the buffer is not evicted any more during memory pressure.
> - */
> -static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
> -{
> -	dma_resv_assert_held(bo->base.resv);
> -	WARN_ON_ONCE(!kref_read(&bo->kref));
> -	++bo->pin_count;
> -}
> -
> -/**
> - * ttm_bo_unpin - Unpin the buffer object.
> - * @bo: The buffer object to unpin
> - *
> - * Allows the buffer object to be evicted again during memory pressure.
> - */
> -static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
> -{
> -	dma_resv_assert_held(bo->base.resv);
> -	WARN_ON_ONCE(!kref_read(&bo->kref));
> -	if (bo->pin_count)
> -		--bo->pin_count;
> -	else
> -		WARN_ON_ONCE(true);
> -}
> +void ttm_bo_pin(struct ttm_buffer_object *bo);
> +void ttm_bo_unpin(struct ttm_buffer_object *bo);
>  
>  int ttm_mem_evict_first(struct ttm_device *bdev,
>  			struct ttm_resource_manager *man,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
