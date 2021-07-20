Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADCD3CFAF6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46F289DA3;
	Tue, 20 Jul 2021 13:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0989DAB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:44:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i94so26070721wri.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Be4HZXEp40HUXvq7QmzTRqYXQphz7ay/OwQix79gbbA=;
 b=izhhlKN6HpBuFS+OJ0XVF3bPGkfIu1LANouXgWkEWOhcTzORgKEwnUEEZGt79Ni/bh
 0aSKd4v4ZNCHu+iAfw+APT+oU+VMB4tRKGuW/vGdbJVxs/cv2JlTU2xonEfODF9tKamh
 ifr/J8tMQL90Hna0ZrYvb2X2bVE8usHH073MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Be4HZXEp40HUXvq7QmzTRqYXQphz7ay/OwQix79gbbA=;
 b=DpknQXYvE62P3tyV6odgRBD54sFtmBj3qgnRDench3JbzBYamuKk86K4hUnDkWTOLN
 Gk90kapcBrpYpFwJtwHNoGeoCUlVowU01z/yDlhtYoQzuJOkp4Czq85fKH7PvP/C5v+B
 ndfLmasbr4Mnw/efYb0Cv8nl0wdz0qxRwK15J+S+MhXpcd2SAXn4eCL8kLHmyA8iuZOW
 FPgoCqm61YeEkHhTIYIKeA5wH20PU9Nfv7wHL/U3D7vZqXt6e9abTSOlTnVX4YnyUs0t
 t60AiFeC7f7Ljkj1JC07wgBk1q0+HpgNvXgE6h1A23LDGjhKJrEwX+B5YJD7iZW1KBSR
 nQ4w==
X-Gm-Message-State: AOAM530GxTFMyogfhfHej6gW0ca+rp24scduRiyWBF5HAyRNG1hBsCSD
 /mMQUyr0VUveZVT3sUDe1Qq1yw==
X-Google-Smtp-Source: ABdhPJz73QdlbsoKOLRzeUOJVVMHCbFPUwoAnf+Y5YRWRGf4t1PlZRgsgJRcHXbZN3/yYVbsTA4Nvw==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr37428582wrs.97.1626788691601; 
 Tue, 20 Jul 2021 06:44:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v2sm23989555wro.48.2021.07.20.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:44:50 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:44:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/4] drm: Introduce drm_modeset_lock_ctx_retry()
Message-ID: <YPbTUf9KfiZ5GnFz@phenom.ffwll.local>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
 <20210715184954.7794-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210715184954.7794-2-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 09:49:51PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Quite a few places are hand rolling the modeset lock backoff dance.
> Let's suck that into a helper macro that is easier to use without
> forgetting some steps.
> 
> The main downside is probably that the implementation of
> drm_with_modeset_lock_ctx() is a bit harder to read than a hand
> rolled version on account of being split across three functions,
> but the actual code using it ends up being much simpler.
> 
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 44 ++++++++++++++++++++++++++++++
>  include/drm/drm_modeset_lock.h     | 20 ++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index fcfe1a03c4a1..083df96632e8 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -425,3 +425,47 @@ int drm_modeset_lock_all_ctx(struct drm_device *dev,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_modeset_lock_all_ctx);
> +
> +void _drm_modeset_lock_begin(struct drm_modeset_acquire_ctx *ctx,
> +			     struct drm_atomic_state *state,
> +			     unsigned int flags, int *ret)
> +{
> +	drm_modeset_acquire_init(ctx, flags);
> +
> +	if (state)
> +		state->acquire_ctx = ctx;
> +
> +	*ret = -EDEADLK;
> +}
> +EXPORT_SYMBOL(_drm_modeset_lock_begin);
> +
> +bool _drm_modeset_lock_loop(int *ret)
> +{
> +	if (*ret == -EDEADLK) {
> +		*ret = 0;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(_drm_modeset_lock_loop);
> +
> +void _drm_modeset_lock_end(struct drm_modeset_acquire_ctx *ctx,
> +			   struct drm_atomic_state *state,
> +			   int *ret)
> +{
> +	if (*ret == -EDEADLK) {
> +		if (state)
> +			drm_atomic_state_clear(state);
> +
> +		*ret = drm_modeset_backoff(ctx);
> +		if (*ret == 0) {
> +			*ret = -EDEADLK;
> +			return;
> +		}
> +	}
> +
> +	drm_modeset_drop_locks(ctx);
> +	drm_modeset_acquire_fini(ctx);
> +}
> +EXPORT_SYMBOL(_drm_modeset_lock_end);
> diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
> index aafd07388eb7..5eaad2533de5 100644
> --- a/include/drm/drm_modeset_lock.h
> +++ b/include/drm/drm_modeset_lock.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/ww_mutex.h>
>  
> +struct drm_atomic_state;
>  struct drm_modeset_lock;
>  
>  /**
> @@ -203,4 +204,23 @@ modeset_lock_fail:							\
>  	if (!drm_drv_uses_atomic_modeset(dev))				\
>  		mutex_unlock(&dev->mode_config.mutex);
>  
> +void _drm_modeset_lock_begin(struct drm_modeset_acquire_ctx *ctx,
> +			     struct drm_atomic_state *state,
> +			     unsigned int flags,
> +			     int *ret);
> +bool _drm_modeset_lock_loop(int *ret);
> +void _drm_modeset_lock_end(struct drm_modeset_acquire_ctx *ctx,
> +			   struct drm_atomic_state *state,
> +			   int *ret);
> +
> +/*
> + * Note that one must always use "continue" rather than
> + * "break" or "return" to handle errors within the
> + * drm_modeset_lock_ctx_retry() block.

I'm not sold on loop macros with these kind of restrictions, C just isn't
a great language for these. That's why e.g. drm_connector_iter doesn't
give you a macro, but only the begin/next/end function calls explicitly.

Yes the macro we have is also not nice, but at least it's a screaming
macro since it's all uppercase, so options are all a bit sucky. Which
leads me to think we have a bit a https://xkcd.com/927/ situation going
on.

I think minimally we should have one way to do this.
-Daniel

> + */
> +#define drm_modeset_lock_ctx_retry(ctx, state, flags, ret) \
> +	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
> +	     _drm_modeset_lock_loop(&(ret)); \
> +	     _drm_modeset_lock_end((ctx), (state), &(ret)))
> +
>  #endif /* DRM_MODESET_LOCK_H_ */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
