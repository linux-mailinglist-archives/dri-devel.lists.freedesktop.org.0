Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE023C740
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA089CF8;
	Wed,  5 Aug 2020 07:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4089CF8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 07:56:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so4931782wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KTW/vCUobXWqCiTExlcDT0Pf2kdIa51mEFh/jWHgmTE=;
 b=IGGqQklmRKdSCaqHtJBkOllKWm9YfArmgfxqjFTXCq7SIVC2j61nGmShY62eoa0As2
 WRR90vfai6xvVviM1VpiL7UnL2UK4Wh/qt6St/moj6CVfJLydOwisD4xs53it3DCnQkV
 MH9wcfByoej2ne7kGJYL9wZuf7qCdn6aIeRrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KTW/vCUobXWqCiTExlcDT0Pf2kdIa51mEFh/jWHgmTE=;
 b=IVuY1X4Labj4gG655D+ZsR/6LaUCstqVjlQwcC3cFE/+omveAr7ZY9gqBGhF0xKbxk
 9hu8gHt4qanHg/shY4c42pA9mbpU/MHjX0OWy/xA5P1WZASFdVT58Ww9djCM+zfJSTat
 fAP+TkTZPKOP/8yRJDrjZdfynGpMXt3no5fItVhlGiGSa8vueYBQp3sdMhxa31bGrCrG
 7Bnq2Uff2AV74TVPC7fefm7cIfXkQL1EpBAN3awtzrRrICVnu8zHTB5wwmlxcUdKA1xU
 voywfOKEe77jWUwwKkFcPJcAgjbJmYApk8raGSm0i/HGnjQYcmoy/bQAV7WXktOaY7+z
 OkTA==
X-Gm-Message-State: AOAM530/hozjhLN2dURyJ6x6ZdbpZVJSWbAF4TzI4oUvI4FzZ/lasj6K
 Rvx2pIz1V1HXea985/R7eSifmQ==
X-Google-Smtp-Source: ABdhPJxLblo6et2zv29LioKPzcBdEByprMoQAhR45Cr6lOl+Byok2kPwRuM/CTEP/hNJ+TQXD0X8Fw==
X-Received: by 2002:a1c:9ec6:: with SMTP id h189mr2076390wme.22.1596614203709; 
 Wed, 05 Aug 2020 00:56:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g16sm1557770wrs.88.2020.08.05.00.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 00:56:42 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:56:39 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 01/59] drm/vmwgfx: consolidate ttm object creation and
 populate
Message-ID: <20200805075639.GV6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-2-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-2-airlied@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:55:34PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> These two functions has the same code in them, create a common
> helper function instead.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        | 60 ++--------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 32 ++++++++++++
>  3 files changed, 39 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 3596f3923ea3..b7c763713b4c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1023,6 +1023,10 @@ extern int vmw_bo_map_dma(struct ttm_buffer_object *bo);
>  extern void vmw_bo_unmap_dma(struct ttm_buffer_object *bo);
>  extern const struct vmw_sg_table *
>  vmw_bo_sg_table(struct ttm_buffer_object *bo);
> +extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
> +				      unsigned long bo_size,
> +				      struct ttm_buffer_object **bo_p);
> +
>  extern void vmw_piter_start(struct vmw_piter *viter,
>  			    const struct vmw_sg_table *vsgt,
>  			    unsigned long p_offs);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index e8eb42933ca2..7f95ed6aa224 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -238,10 +238,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  	unsigned long offset;
>  	unsigned long bo_size;
>  	struct vmw_otable *otables = batch->otables;
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.no_wait_gpu = false
> -	};
>  	SVGAOTableType i;
>  	int ret;
>  
> @@ -255,24 +251,9 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  		bo_size += otables[i].size;
>  	}
>  
> -	ret = ttm_bo_create(&dev_priv->bdev, bo_size,
> -			    ttm_bo_type_device,
> -			    &vmw_sys_ne_placement,
> -			    0, false, &batch->otable_bo);
> -
> -	if (unlikely(ret != 0))
> -		goto out_no_bo;
> -
> -	ret = ttm_bo_reserve(batch->otable_bo, false, true, NULL);
> -	BUG_ON(ret != 0);
> -	ret = vmw_bo_driver.ttm_tt_populate(batch->otable_bo->ttm, &ctx);
> -	if (unlikely(ret != 0))
> -		goto out_unreserve;
> -	ret = vmw_bo_map_dma(batch->otable_bo);
> +	ret = vmw_bo_create_and_populate(dev_priv, bo_size, &batch->otable_bo);
>  	if (unlikely(ret != 0))
> -		goto out_unreserve;
> -
> -	ttm_bo_unreserve(batch->otable_bo);
> +		return ret;
>  
>  	offset = 0;
>  	for (i = 0; i < batch->num_otables; ++i) {
> @@ -289,8 +270,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  
>  	return 0;
>  
> -out_unreserve:
> -	ttm_bo_unreserve(batch->otable_bo);
>  out_no_setup:
>  	for (i = 0; i < batch->num_otables; ++i) {
>  		if (batch->otables[i].enabled)
> @@ -300,7 +279,6 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  
>  	ttm_bo_put(batch->otable_bo);
>  	batch->otable_bo = NULL;
> -out_no_bo:
>  	return ret;
>  }
>  
> @@ -432,41 +410,9 @@ struct vmw_mob *vmw_mob_create(unsigned long data_pages)
>  static int vmw_mob_pt_populate(struct vmw_private *dev_priv,
>  			       struct vmw_mob *mob)
>  {
> -	int ret;
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.no_wait_gpu = false
> -	};
> -
>  	BUG_ON(mob->pt_bo != NULL);
>  
> -	ret = ttm_bo_create(&dev_priv->bdev, mob->num_pages * PAGE_SIZE,
> -			    ttm_bo_type_device,
> -			    &vmw_sys_ne_placement,
> -			    0, false, &mob->pt_bo);
> -	if (unlikely(ret != 0))
> -		return ret;
> -
> -	ret = ttm_bo_reserve(mob->pt_bo, false, true, NULL);
> -
> -	BUG_ON(ret != 0);
> -	ret = vmw_bo_driver.ttm_tt_populate(mob->pt_bo->ttm, &ctx);
> -	if (unlikely(ret != 0))
> -		goto out_unreserve;
> -	ret = vmw_bo_map_dma(mob->pt_bo);
> -	if (unlikely(ret != 0))
> -		goto out_unreserve;
> -
> -	ttm_bo_unreserve(mob->pt_bo);
> -
> -	return 0;
> -
> -out_unreserve:
> -	ttm_bo_unreserve(mob->pt_bo);
> -	ttm_bo_put(mob->pt_bo);
> -	mob->pt_bo = NULL;
> -
> -	return ret;
> +	return vmw_bo_create_and_populate(dev_priv, mob->num_pages * PAGE_SIZE, &mob->pt_bo);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 2deaaed334e6..8e2a82ded900 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -817,3 +817,35 @@ struct ttm_bo_driver vmw_bo_driver = {
>  	.swap_notify = vmw_swap_notify,
>  	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
>  };
> +
> +int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
> +			       unsigned long bo_size,
> +			       struct ttm_buffer_object **bo_p)
> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false
> +	};
> +	struct ttm_buffer_object *bo;
> +	int ret;
> +
> +	ret = ttm_bo_create(&dev_priv->bdev, bo_size,
> +			    ttm_bo_type_device,
> +			    &vmw_sys_ne_placement,
> +			    0, false, &bo);
> +
> +	if (unlikely(ret != 0))
> +		return ret;
> +
> +	ret = ttm_bo_reserve(bo, false, true, NULL);
> +	BUG_ON(ret != 0);
> +	ret = vmw_bo_driver.ttm_tt_populate(bo->ttm, &ctx);
> +	if (likely(ret == 0))
> +		ret = vmw_bo_map_dma(bo);
> +
> +	ttm_bo_unreserve(bo);
> +
> +	if (likely(ret == 0))
> +		*bo_p = bo;
> +	return ret;
> +}

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
