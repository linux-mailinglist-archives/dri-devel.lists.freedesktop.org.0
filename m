Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CB23C919
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9216E094;
	Wed,  5 Aug 2020 09:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444426E094
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:24:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so5160412wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZqrcxEl7aRCM/b4yJRYtonynU3RKL3yCS/DlTEI0ZtA=;
 b=eHxgEfeEP0kMu1oY4alK606xzzANIm9PeI3NTLLuxQlcoMnuSVvZmJ8FcpBauDmmcG
 WIEZnsp5KWE0aDjAR9E0tQVTtkhTu3jief36MAOxjRH2L4i3N8Y3Cuz/4t2z81K23AaA
 bU0OuWV3rfRF33IRtH4UcajKruR2zda3awCQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZqrcxEl7aRCM/b4yJRYtonynU3RKL3yCS/DlTEI0ZtA=;
 b=URvi0vNp9PoxWs6q0W/cLl7pP3qershQ2zSaS6DJ3MJAKgfo5OCv3VjnO8GENFQXfX
 oSLnQx0hdky8IDTp0ys2aS3IX+ZoFLUe/6hhuYvEc9m98n9xZvlbspkED00aCFfikgoN
 QxPbU5HEFRRdCV+3iFE0prNhedMeNULaSGpoOC1lrxswdvYcoWW9NXravoD728J1o/Kp
 H7tyMSS8pibnl6fJ2YE/hjQ44dYSe92GDmlkLDuA9aWNFE/wfx5rnmEndUA+/eb33lwZ
 GutG0q7XzVzYwXPGhsOMpLrGijU5+9tcA6u/jpT9IeHfkMlEaeC7Eqtu4TclMSTsdCrB
 V+1A==
X-Gm-Message-State: AOAM531zjDlEdcx69cHuA+aZVE9ei6tf9BUNmK2MqiYWnOBNZXdI5+xu
 6z+OmaID0/7VnwH/E+IyaSghfA==
X-Google-Smtp-Source: ABdhPJxWxG6jrsi8GsUmdZ7JrtG+N/S0elsxI96uVJoqRlREbigmXRsqHpXRZTIAwC933omAZbDZTg==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2585031wmi.10.1596619488954; 
 Wed, 05 Aug 2020 02:24:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s19sm2157411wrb.54.2020.08.05.02.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:24:48 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:24:46 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 48/59] drm/vmwgfx/ttm: move thp to driver managed
Message-ID: <20200805092446.GD6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-49-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-49-airlied@gmail.com>
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

On Tue, Aug 04, 2020 at 12:56:21PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 32 +++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 720a24214c74..1cefd9c1e8ea 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -16,10 +16,16 @@
>   * @lock: Manager lock.
>   */
>  struct vmw_thp_manager {
> +	struct ttm_mem_type_manager manager;
>  	struct drm_mm mm;
>  	spinlock_t lock;
>  };
>  
> +static struct vmw_thp_manager *to_thp_manager(struct ttm_mem_type_manager *man)
> +{
> +	return container_of(man, struct vmw_thp_manager, manager);
> +}
> +
>  static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
>  				  unsigned long align_pages,
>  				  const struct ttm_place *place,
> @@ -43,7 +49,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
>  			    const struct ttm_place *place,
>  			    struct ttm_mem_reg *mem)
>  {
> -	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
> +	struct vmw_thp_manager *rman = to_thp_manager(man);
>  	struct drm_mm *mm = &rman->mm;
>  	struct drm_mm_node *node;
>  	unsigned long align_pages;
> @@ -103,7 +109,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
>  static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
>  			     struct ttm_mem_reg *mem)
>  {
> -	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
> +	struct vmw_thp_manager *rman = to_thp_manager(man);
>  
>  	if (mem->mm_node) {
>  		spin_lock(&rman->lock);
> @@ -117,20 +123,24 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
>  
>  int vmw_thp_init(struct vmw_private *dev_priv)
>  {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> +	struct ttm_mem_type_manager *man;
>  	struct vmw_thp_manager *rman;
> +
> +	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
> +	if (!rman)
> +		return -ENOMEM;
> +
> +	man = &rman->manager;
>  	man->available_caching = TTM_PL_FLAG_CACHED;
>  	man->default_caching = TTM_PL_FLAG_CACHED;
>  
>  	ttm_mem_type_manager_init(&dev_priv->bdev, man,
>  				  dev_priv->vram_size >> PAGE_SHIFT);
> -	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
> -	if (!rman)
> -		return -ENOMEM;
>  
>  	drm_mm_init(&rman->mm, 0, man->size);
>  	spin_lock_init(&rman->lock);
> -	man->priv = rman;
> +
> +	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
>  	ttm_mem_type_manager_set_used(man, true);
>  	return 0;
>  }
> @@ -138,7 +148,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>  void vmw_thp_fini(struct vmw_private *dev_priv)
>  {
>  	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> -	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
> +	struct vmw_thp_manager *rman = to_thp_manager(man);
>  	struct drm_mm *mm = &rman->mm;
>  	int ret;
>  
> @@ -151,15 +161,15 @@ void vmw_thp_fini(struct vmw_private *dev_priv)
>  	drm_mm_clean(mm);
>  	drm_mm_takedown(mm);
>  	spin_unlock(&rman->lock);
> -	kfree(rman);
> -	man->priv = NULL;
>  	ttm_mem_type_manager_cleanup(man);
> +	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, NULL);
> +	kfree(rman);
>  }
>  
>  static void vmw_thp_debug(struct ttm_mem_type_manager *man,
>  			  struct drm_printer *printer)
>  {
> -	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
> +	struct vmw_thp_manager *rman = to_thp_manager(man);
>  
>  	spin_lock(&rman->lock);
>  	drm_mm_print(&rman->mm, printer);
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
