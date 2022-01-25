Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6993C49B95A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24610E25E;
	Tue, 25 Jan 2022 16:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7D10E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:56:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m4so31886032ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YIRO2b/tcH2c3mnAHVruAguGHeE7fP1pICNguAt53rI=;
 b=Sq3EMCeLFxAFZgddz1IN8lUA4KA1AH86AVklpVstszUkrGklUV3vHLpnBUbOvbs7Rw
 WxQSbSN4LY1uCGWM1hwME3x4g+dt5FRugqF6JsJwx8ATqMX/nwe2byx96RygcZzx4WWD
 SA/pvYkOKw8pyYRchaeQACIjvYLJ6EqDMEzPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YIRO2b/tcH2c3mnAHVruAguGHeE7fP1pICNguAt53rI=;
 b=kd27VZe62fR7eKZbcwDHJYufo4sVeeUPlQxYec+8e+KL9pIZE2vtkmJaH0vCiWFOUO
 HtToHDscOTro5/HK4AcFlJW1zfLu3nRUpJdOCJOsPrhvTty2cL/uoeyEiq8NhoDnBCd1
 ZfocuM+2I16uzboebO7yRXXe+4eA290O6tXczn8dmCRO13avJ+UmJc9BhRc5uIlC765U
 6XLdbuluwPWcXHsdUQ2yvhtXC2B+HQ3aDNxlcso4NKtXLS4jH9N6ul29x9KwP70i14xf
 vmMGdWNYFXyu3qGKFSWl5Z4PCsUTtUbHRfIIAwVXoGXMUpv/tS1dP90HWVnWng7P03ql
 Xk3Q==
X-Gm-Message-State: AOAM5331vNoDyKM7CZXJXa3TlX5zuAQXUuOyTxCqeywpec0CgGowNerb
 1oYWZEOHlgMHrGoOHukkJAv/eXFU7p+ETw==
X-Google-Smtp-Source: ABdhPJzOzudTlZFUwK3QCIi+HOR0+/w4R3mIjY1h+Raf9SNWw2cjP+CD5gYgWDqShwi/46OptCT+eA==
X-Received: by 2002:a17:906:c142:: with SMTP id
 dp2mr16932360ejc.753.1643129779214; 
 Tue, 25 Jan 2022 08:56:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n11sm8555358edv.52.2022.01.25.08.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:56:18 -0800 (PST)
Date: Tue, 25 Jan 2022 17:56:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 06/12] drm/ttm: add resource iterator
Message-ID: <YfArsFQxeGK11SEy@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122514.1832-7-christian.koenig@amd.com>
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

On Mon, Jan 24, 2022 at 01:25:08PM +0100, Christian König wrote:
> Instead of duplicating that at different places add an iterator over all
> the resources in a resource manager.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 41 +++++++++++----------------
>  drivers/gpu/drm/ttm/ttm_device.c   | 26 ++++++++---------
>  drivers/gpu/drm/ttm/ttm_resource.c | 45 ++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++
>  4 files changed, 95 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cb0fa932d495..599be3dda8a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -579,38 +579,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  			struct ww_acquire_ctx *ticket)
>  {
>  	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +	struct ttm_resource_cursor cursor;
>  	struct ttm_resource *res;
>  	bool locked = false;
> -	unsigned i;
>  	int ret;
>  
>  	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(res, &man->lru[i], lru) {
> -			bool busy;
> -
> -			bo = res->bo;
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> -							    &locked, &busy)) {
> -				if (busy && !busy_bo && ticket !=
> -				    dma_resv_locking_ctx(bo->base.resv))
> -					busy_bo = bo;
> -				continue;
> -			}
> -
> -			if (!ttm_bo_get_unless_zero(bo)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
> -			break;
> +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +		bool busy;
> +
> +		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> +						    &locked, &busy)) {
> +			if (busy && !busy_bo && ticket !=
> +			    dma_resv_locking_ctx(bo->base.resv))
> +				busy_bo = res->bo;
> +			continue;
>  		}
>  
> -		/* If the inner loop terminated early, we have our candidate */
> -		if (&res->lru != &man->lru[i])
> -			break;
> -
> -		bo = NULL;
> +		if (!ttm_bo_get_unless_zero(res->bo)) {
> +			if (locked)
> +				dma_resv_unlock(res->bo->base.resv);
> +			continue;
> +		}
> +		bo = res->bo;
>  	}
>  
>  	if (!bo) {
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ba35887147ba..a0562ab386f5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -142,10 +142,10 @@ EXPORT_SYMBOL(ttm_global_swapout);
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags)
>  {
> +	struct ttm_resource_cursor cursor;
>  	struct ttm_resource_manager *man;
> -	struct ttm_buffer_object *bo;
>  	struct ttm_resource *res;
> -	unsigned i, j;
> +	unsigned i;
>  	int ret;
>  
>  	spin_lock(&bdev->lru_lock);
> @@ -154,20 +154,16 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		if (!man || !man->use_tt)
>  			continue;
>  
> -		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> -			list_for_each_entry(res, &man->lru[j], lru) {
> -				uint32_t num_pages;
> -
> -				bo = res->bo;
> -				num_pages = PFN_UP(bo->base.size);
> +		ttm_resource_manager_for_each_res(man, &cursor, res) {
> +			struct ttm_buffer_object *bo = res->bo;
> +			uint32_t num_pages = PFN_UP(bo->base.size);
>  
> -				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -				/* ttm_bo_swapout has dropped the lru_lock */
> -				if (!ret)
> -					return num_pages;
> -				if (ret != -EBUSY)
> -					return ret;
> -			}
> +			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> +			/* ttm_bo_swapout has dropped the lru_lock */
> +			if (!ret)
> +				return num_pages;
> +			if (ret != -EBUSY)
> +				return ret;
>  		}
>  	}
>  	spin_unlock(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 450e665c357b..9e68d36a1546 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -354,6 +354,51 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
> +/**
> + * ttm_resource_manager_first
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the first resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_resource *res;

assert_lockdep_held for the lru spinlock here and in the _next() one pls,
just to be on the safe side.

> +
> +	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> +	     ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_resource_manager_next
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the next resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res)
> +{
> +	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> +		return res;
> +
> +	for (; cursor->priority < TTM_MAX_BO_PRIORITY; ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
>  static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
>  					  struct dma_buf_map *dmap,
>  					  pgoff_t i)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index a54d52517a30..13da5e337350 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -183,6 +183,17 @@ struct ttm_resource {
>  	struct list_head lru;
>  };
>  
> +/**
> + * struct ttm_resource_cursor
> + *
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	unsigned int priority;
> +};
> +
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -339,6 +350,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  				struct drm_printer *p);
>  
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor);
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res);
> +

Kerneldoc for this one would be nice too.

> +#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> +	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +	     res = ttm_resource_manager_next(man, cursor, res))
> +
>  struct ttm_kmap_iter *
>  ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
>  			 struct io_mapping *iomap,

I really like this, looks neat and tidy. With the two nits addressed.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
