Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADB23C872
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7A689C68;
	Wed,  5 Aug 2020 09:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E89389C68
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:00:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so29370554wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mfSN1/Xiwx2OjXWKJfZXYTZc8lhKBnlMxdT3U440fjA=;
 b=PBzn3vjBrJlmCs0qLQKEttNqgKHomD6PPW1dZw1QK/0egGZBIYNCDtWeVptGlnyktH
 e9o86yARylXWqwgUjg+UZZ/+nFdjZPoMZqvLjqPEto4BCjSFeQNNV554l9Ak12Lwo1sx
 Tp7UFcgpxOBrQcgyTGjqhgWJGME1lmJlJZnEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mfSN1/Xiwx2OjXWKJfZXYTZc8lhKBnlMxdT3U440fjA=;
 b=S+/rRIbXB1Ofnjl/JGMj+Xv1s5pYkEDko/8xNbRPGZ5JBpSs1S3umE4TjKMfkGVlsO
 p6deOzrcaOOyk92ZliwCgFd2xJf9BhnfYybyD6SefCx4b3Q4W60yHmkjpDd0Dd4xa/Y1
 AWZx5oyqS689K38nWIiTp98RLKrorLzevFXxVwdcXgd14nBAau1oPfKrTC9N/IHzsxRk
 NpP4ZZZ5j9Gl/0fwceUEzsgaQPYexq5cdGn9zsOWzSmINMJ+xGP/vKsLAPafZZdnYMiZ
 593AK/NxTr9g0419WGizsyAvlaYrvJQrbcNqkllENUNGmspj5GvB1IBCqmVzZIf4Va/Z
 8TWw==
X-Gm-Message-State: AOAM5338BKBOdZfXMMB3zTLg4UVzfQWu94Gjxe1bUPTR+mK+q5xKAXRY
 L9d8aG5PuXNZAFk3vVFdjV4z4A==
X-Google-Smtp-Source: ABdhPJyp1ixClMBwmeTdVPDAgrNZS9F4gxw5qx1nLrcS/w52l4/exodckvjrrT0kZD0wbTX3E7MptQ==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr1818948wrs.165.1596618017824; 
 Wed, 05 Aug 2020 02:00:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z127sm1873187wme.44.2020.08.05.02.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:00:16 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:00:15 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 21/59] drm/vmwgfx/ttm: switch gmrid allocator to new init
 paths.
Message-ID: <20200805090015.GY6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-22-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-22-airlied@gmail.com>
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

On Tue, Aug 04, 2020 at 12:55:54PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 17 ++++-----------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 21 ++++++++++++-------
>  3 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 5a889df2de03..364d5f3ff9a8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -896,14 +896,10 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  	 *  slots as well as the bo size.
>  	 */
>  	dev_priv->has_gmr = true;
> -	dev_priv->bdev.man[VMW_PL_GMR].func = &vmw_gmrid_manager_func;
> -	dev_priv->bdev.man[VMW_PL_GMR].available_caching = TTM_PL_FLAG_CACHED;
> -	dev_priv->bdev.man[VMW_PL_GMR].default_caching = TTM_PL_FLAG_CACHED;
>  	/* TODO: This is most likely not correct */
> -	dev_priv->bdev.man[VMW_PL_GMR].use_tt = true;
>  	if (((dev_priv->capabilities & (SVGA_CAP_GMR | SVGA_CAP_GMR2)) == 0) ||
> -	    refuse_dma || ttm_bo_init_mm(&dev_priv->bdev, VMW_PL_GMR,
> -					 VMW_PL_GMR) != 0) {
> +	    refuse_dma ||
> +	    vmw_gmrid_man_init(dev_priv, VMW_PL_GMR) != 0) {
>  		DRM_INFO("No GMR memory available. "
>  			 "Graphics memory resources are very limited.\n");
>  		dev_priv->has_gmr = false;
> @@ -911,13 +907,8 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  
>  	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS && !refuse_dma) {
>  		dev_priv->has_mob = true;
> -		dev_priv->bdev.man[VMW_PL_MOB].func = &vmw_gmrid_manager_func;
> -		dev_priv->bdev.man[VMW_PL_MOB].available_caching = TTM_PL_FLAG_CACHED;
> -		dev_priv->bdev.man[VMW_PL_MOB].default_caching = TTM_PL_FLAG_CACHED;
> -		/* TODO: This is most likely not correct */
> -		dev_priv->bdev.man[VMW_PL_MOB].use_tt = true;
> -		if (ttm_bo_init_mm(&dev_priv->bdev, VMW_PL_MOB,
> -				   VMW_PL_MOB) != 0) {
> +
> +		if (vmw_gmrid_man_init(dev_priv, VMW_PL_MOB) != 0) {
>  			DRM_INFO("No MOB memory available. "
>  				 "3D will be disabled.\n");
>  			dev_priv->has_mob = false;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 10b681725a53..8f319dd6cdb4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1221,7 +1221,7 @@ int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
>   * GMR Id manager
>   */
>  
> -extern const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
> +int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
>  
>  /**
>   * Prime - vmwgfx_prime.c
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index fb1bf4dd91d1..141fb14e3583 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -94,22 +94,28 @@ static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
>  	}
>  }
>  
> -static int vmw_gmrid_man_init(struct ttm_mem_type_manager *man,
> -			      unsigned long p_size)
> +static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
> +
> +int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  {
> -	struct vmw_private *dev_priv =
> -		container_of(man->bdev, struct vmw_private, bdev);
> +	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
>  	struct vmwgfx_gmrid_man *gman =
>  		kzalloc(sizeof(*gman), GFP_KERNEL);
>  
>  	if (unlikely(!gman))
>  		return -ENOMEM;
>  
> +	man->func = &vmw_gmrid_manager_func;
> +	man->available_caching = TTM_PL_FLAG_CACHED;
> +	man->default_caching = TTM_PL_FLAG_CACHED;
> +	/* TODO: This is most likely not correct */
> +	man->use_tt = true;
> +	ttm_mem_type_manager_init(&dev_priv->bdev, man, 0);
>  	spin_lock_init(&gman->lock);
>  	gman->used_gmr_pages = 0;
>  	ida_init(&gman->gmr_ida);
>  
> -	switch (p_size) {
> +	switch (type) {
>  	case VMW_PL_GMR:
>  		gman->max_gmr_ids = dev_priv->max_gmr_ids;
>  		gman->max_gmr_pages = dev_priv->max_gmr_pages;
> @@ -122,6 +128,8 @@ static int vmw_gmrid_man_init(struct ttm_mem_type_manager *man,
>  		BUG();
>  	}
>  	man->priv = (void *) gman;
> +
> +	ttm_mem_type_manager_set_used(man, true);
>  	return 0;
>  }
>  
> @@ -137,8 +145,7 @@ static int vmw_gmrid_man_takedown(struct ttm_mem_type_manager *man)
>  	return 0;
>  }
>  
> -const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
> -	.init = vmw_gmrid_man_init,
> +static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
>  	.takedown = vmw_gmrid_man_takedown,
>  	.get_node = vmw_gmrid_man_get_node,
>  	.put_node = vmw_gmrid_man_put_node,


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
