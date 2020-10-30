Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EDC2A0086
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4126E04A;
	Fri, 30 Oct 2020 08:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1CD6E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:56:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w1so5568843wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xv94TD+Wz+qFlHRj1eF6lW3RTboLo+eylNXU68uehyM=;
 b=YsJmlG/HFMVq7R+lbK2IEWG3q96YKjKj/hLgzUTHgVwiPqzEVm90HLnCSN9G23yaR4
 ssaGW10qUoi1TuNNKkb/p1t3yVky44QhgQDcx7rDfMVPDAO+rdUe91NegZgg0HEiFUEf
 KnIRfBQjWh+OBO9Je3lj2PFU+KpSok7zUai88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xv94TD+Wz+qFlHRj1eF6lW3RTboLo+eylNXU68uehyM=;
 b=SoSc7s1B09mcQCyZsLKaE5PecfpO+vX/89jTcJ5HXqykczZ4/Cuo3gqeeunHrnc97c
 rNQkL3jelXxUYC8rjZ7f2YjlRCeyp1Z/wgiWXzNrR9qHuQErvceyHS8o6/DYj7yprV1d
 xp6jcEEMLw3Jp/EnBuP66V7tjHvbWTsmD5eSc6ExK+hAjaFLzrWVb0YgpRaEDuPHSP11
 KQlZm+kMAPWqrem+CJOh3tx3N7T4fRnV0KlwWvQ8c+lUCEgdvUCKtQsHiNW2/48p6MaS
 HTbr0MBOVXJveZiR09rqfvKKPeq9pPSUdsBDCU6PaAQEdSTD3IuoJPAU43Wv3fJN1+X1
 Nhgw==
X-Gm-Message-State: AOAM533kjZWsfL/9kf5mEb/gkRMXBg2GDjTt4ictfx43F6L1x5j3FXqV
 fCeYqFpzZ3lh9uGWO56B9MU8MsSf1CUwgk5T
X-Google-Smtp-Source: ABdhPJxNn1cigfBNCeYCIIS95vkvY6bnlYXekZsr+B50SeqCxD/aT9YV0a6DdLhYLYSBVvpBQpyGrA==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr1791976wrn.188.1604048199645; 
 Fri, 30 Oct 2020 01:56:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u3sm12640314wme.0.2020.10.30.01.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 01:56:38 -0700 (PDT)
Date: Fri, 30 Oct 2020 09:56:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/6] drm/vc4: bo: Add a managed action to cleanup the cache
Message-ID: <20201030085636.GE401619@phenom.ffwll.local>
References: <20201029190104.2181730-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029190104.2181730-1-maxime@cerno.tech>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 08:00:59PM +0100, Maxime Ripard wrote:
> The BO cache needs to be cleaned up using vc4_bo_cache_destroy, but it's
> not used consistently (vc4_drv's bind calls it in its error path, but
> doesn't in unbind), and we can make that automatic through a managed
> action. Let's remove the requirement to call vc4_bo_cache_destroy.
> 
> Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_bo.c  | 5 +++--
>  drivers/gpu/drm/vc4/vc4_drv.c | 1 -
>  drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index f432278173cd..730d5775ab42 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -1024,6 +1024,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> +static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
>  int vc4_bo_cache_init(struct drm_device *dev)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -1052,10 +1053,10 @@ int vc4_bo_cache_init(struct drm_device *dev)
>  	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
>  	timer_setup(&vc4->bo_cache.time_timer, vc4_bo_cache_time_timer, 0);
>  
> -	return 0;
> +	return drmm_add_action(dev, vc4_bo_cache_destroy, NULL);

I think you want drmm_add_action_or_reset here, same in the other patches.

Otherwise if drmm_add_action fails, you leak the thing you just set up.
-Daniel

>  }
>  
> -void vc4_bo_cache_destroy(struct drm_device *dev)
> +static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
>  	int i;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 8f10f609e4f8..eb3fcd8232b5 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -303,7 +303,6 @@ static int vc4_drm_bind(struct device *dev)
>  gem_destroy:
>  	vc4_gem_destroy(drm);
>  	drm_mode_config_cleanup(drm);
> -	vc4_bo_cache_destroy(drm);
>  dev_put:
>  	drm_dev_put(drm);
>  	return ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 836fdca5e643..3a989e8b39a2 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -14,6 +14,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mm.h>
>  #include <drm/drm_modeset_lock.h>
>  
> @@ -808,7 +809,6 @@ struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
>  						 struct sg_table *sgt);
>  void *vc4_prime_vmap(struct drm_gem_object *obj);
>  int vc4_bo_cache_init(struct drm_device *dev);
> -void vc4_bo_cache_destroy(struct drm_device *dev);
>  int vc4_bo_inc_usecnt(struct vc4_bo *bo);
>  void vc4_bo_dec_usecnt(struct vc4_bo *bo);
>  void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo);
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
