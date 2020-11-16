Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BDB2B532C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32796EA8E;
	Mon, 16 Nov 2020 20:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A86EA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:48:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so586709wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iVwNE1zyEDxLHQr012XvddRjW9iQV68Pp9HAvinkYhA=;
 b=aiepV7tzu7ONdSvbg7o5vBS2Kva5Ln1bylRtwsCRs+NcaNqyDpGT797tiM/mxCv30g
 hKfMxKZGLZxc8FO3h41ZB3J/jr+n0I2t33a2RkUWcrcXY6aub+uMiuNgdPNFTwoHBkKC
 VLll4WBavw7DMS3GYlpvIQh/bXTZr6T+TuuaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVwNE1zyEDxLHQr012XvddRjW9iQV68Pp9HAvinkYhA=;
 b=GMfgpcM3TeZWh8RfRXLnSX+qRCmVEVaT0rS8lXwxcUCwacQKlGd2K9k6dVzDWFvj+F
 oXbqg54HQoS5umljMe6CxqvNPBWDi3/MGtYYOI0JZzDtL7mEvqr5M7B0bWN67128a9yl
 +XiH+/WePOCfzFkoHCncOL+ct33tVyolbPqECgdTqLChsjb5bTwnv4Ap1qJxci+sp4sS
 M12pGfN4yy7JItu5pCmq3qSq5SVafQ166DKDti6E2H02UVP+UD23olKPlcA0hGgkIthi
 TZTpMqbQc+zVxs0IsyavvuW/caIANYLk/I9A8yDNoRY8cGWIv/zrQDqjZj/ck7hLBRzU
 dBkw==
X-Gm-Message-State: AOAM532uBezWglgN5ssBXfVRRpbENreIYj33J9IYdA6UbQ2YfhnzkRSe
 1TVf589X1fv0txhWTYT1+Vwqwg==
X-Google-Smtp-Source: ABdhPJyV5orNKUyfcUSZ282SuxTqNocmYBBrJOa9u3cdwp1DGMtAHZNqvBT6BAqNGO6pfpywW9yd7A==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr731952wmj.77.1605559710659;
 Mon, 16 Nov 2020 12:48:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y63sm516373wmg.28.2020.11.16.12.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:48:29 -0800 (PST)
Date: Mon, 16 Nov 2020 21:48:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/10] drm/fb-helper: Acquire modeset lock around
 shadow-buffer flushing
Message-ID: <20201116204827.GG401619@phenom.ffwll.local>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116200437.17977-11-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 09:04:37PM +0100, Thomas Zimmermann wrote:
> Flushing the fbdev's shadow buffer requires vmap'ing the BO memory, which
> in turn requires pinning the BO. While being pinned, the BO cannot be moved
> into VRAM for scanout. Consequently, a concurrent modeset operation that
> involves the fbdev framebuffer would likely fail.
> 
> Resolve this problem be acquiring the modeset lock of the planes that use
> the fbdev framebuffer. On non-atomic drivers, also acquire the mode-config
> lock. This serializes the flushing of the framebuffer with concurrent
> modeset operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I think this is the wrong lock. What you want is the buffer lock, the
dma_resv lock of the underlying gem_bo underneath the fb we have. And hold
that from _vmap to the end of _vunmap.

Unfortuantely that's going to be one nasty refactoring adventure :-/

So I think for plan B we need something nasty like this, but this here has
disadvantage that fbdev activity in the background can seriously hurt the
native kms client (despite that you're trying to filter a bit, you're
creating a big lock across all planes and we've really worked hard to make
those stand-alone as much as possible).

I think we can do better here, since we're only worried about modesets
from fbdev itself. Nothing else needs to be able to pull the buffer from
system memory into vram while we have it pinned here.

Holding mutex_lock(fb_helper->lock) here instead, with a big comment
explaining why that's enough, and that the clean fix would be holding the
dma_resv_lock, should  do the trick.
-Daniel

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 43 +++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5a22c744378c..af485c71a42a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -394,20 +394,59 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
>  static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
>  				     struct drm_clip_rect *clip)
>  {
> +	struct drm_device *dev = fb_helper->dev;
> +	struct drm_framebuffer *fb = fb_helper->fb;
>  	struct drm_client_buffer *buffer = fb_helper->buffer;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_framebuffer *plane_fb;
> +	struct drm_plane *plane;
>  	struct dma_buf_map map, dst;
>  	int ret;
>  
> +	if (!drm_drv_uses_atomic_modeset(dev))
> +		mutex_lock(&dev->mode_config.mutex);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +retry:
> +	drm_for_each_plane(plane, dev) {
> +		ret = drm_modeset_lock(&plane->mutex, &ctx);
> +		if (ret == -EDEADLK) {
> +			ret = drm_modeset_backoff(&ctx);
> +			if (!ret)
> +				goto retry;
> +		} else if (ret) {
> +			goto out;
> +		}
> +
> +		if (drm_drv_uses_atomic_modeset(dev))
> +			plane_fb = plane->state->fb;
> +		else
> +			plane_fb = plane->fb;
> +
> +		if (plane_fb != fb) {
> +			drm_modeset_unlock(&plane->mutex);
> +			continue;
> +		}
> +	}
> +
>  	ret = drm_client_buffer_vmap(buffer, &map);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	dst = map;
>  	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
>  
>  	drm_client_buffer_vunmap(buffer);
>  
> -	return 0;
> +out:
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	if (!drm_drv_uses_atomic_modeset(dev))
> +		mutex_unlock(&dev->mode_config.mutex);
> +
> +	return ret;
>  }
>  
>  static void drm_fb_helper_damage_work(struct work_struct *work)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
