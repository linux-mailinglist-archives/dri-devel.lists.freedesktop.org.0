Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F556256D1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BB110E7D8;
	Fri, 11 Nov 2022 09:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D964D10E7D8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:28:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id f5so11303860ejc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jWWpGc1d1W9EauWP0DZa4AJFswxTRtE523haWiTtzfE=;
 b=SmUtHjrFMHfCj2CNDPSESD250ul3YkQrnED0hxs/ZCUt1MmvLuItpVrx2GrP1dYHBH
 3c8rtRzQyRMMtFMxxcQl/J+ihcEwKPMqNjcJ/LmShLhEggrBosW5W6W5BCIjX+FuFzcx
 bJD8nEQDtwWfDV9WZ1YV/zvi2Iz7jKAxBPPrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWWpGc1d1W9EauWP0DZa4AJFswxTRtE523haWiTtzfE=;
 b=wbx5hWRHOMU0nI63OxDjBdCEu1cdc3LNHvlOhCCry9FTIAVKIEXerGJAJ6L8sbMLT3
 nEgFSOf5FakgmQ9lA9djGgJQWxhJe3/fvyg5RRVN0hElBPcPGllWSbQ+pGtPDLYh2TBq
 9s86U09vxqpUPCrNRlilTrigoHJt/QW/DVEGLHZHlXlEiKkPhaCse23NR3OtoDqbzKHP
 cvMD3IJJ3WrGMXq/mIlPOwnvC88JBIjrBUclJ49loPaDH6kaxNuWlm3ygufZPkEVt/pI
 PcmwoLMevSQ27gOd+nn4dgy6vKR86PwVI0OqoU6BLbAZHOHWqwRjc/2kqTyvX7mcvjWd
 0+KA==
X-Gm-Message-State: ANoB5pnHAiUui5gXUTG1ovQmrD0stnKMqQxTU7bsmD6fgbElzt1g3CUa
 NoXvE2DhjQEgJ6jQpDxpYCNL+Q==
X-Google-Smtp-Source: AA0mqf7AOKoqN+8xh6IA4fKZPnXyKEJfPCB/e7qUCKL3Ffxq2quRNfOVeeYUoYPakY5qNYOcG4/LjA==
X-Received: by 2002:a17:906:e0d4:b0:7ad:d1ab:2431 with SMTP id
 gl20-20020a170906e0d400b007add1ab2431mr1130310ejb.213.1668158927359; 
 Fri, 11 Nov 2022 01:28:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056402164100b004616cce0a26sm869325edx.24.2022.11.11.01.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:28:46 -0800 (PST)
Date: Fri, 11 Nov 2022 10:28:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Message-ID: <Y24VzDRKrZBo5D31@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110135519.30029-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 02:55:18PM +0100, Thomas Zimmermann wrote:
> Schedule the deferred-I/O worker instead of the damage worker after
> writing to the fbdev framebuffer. The deferred-I/O worker then performs
> the dirty-fb update. The fbdev emulation will initialize deferred I/O
> for all drivers that require damage updates. It is therefore a valid
> assumption that the deferred-I/O worker is present.
> 
> It would be possible to perform the damage handling directly from within
> the write operation. But doing this could increase the overhead of the
> write or interfere with a concurrently scheduled deferred-I/O worker.
> Instead, scheduling the deferred-I/O worker with its regular delay of
> 50 ms removes load off the write operation and allows the deferred-I/O
> worker to handle multiple write operations that arrived during the delay
> time window.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c     | 81 ++++++++++++++++++++---------
>  drivers/video/fbdev/core/fb_defio.c | 16 ++++++
>  include/linux/fb.h                  |  1 +
>  3 files changed, 72 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ebc44ed1bf4a2..8cb644e4ecf90 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -596,14 +596,6 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
>  	spin_unlock_irqrestore(&helper->damage_lock, flags);
>  }
>  
> -static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> -				 u32 width, u32 height)
> -{
> -	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
> -
> -	schedule_work(&helper->damage_work);

I'm kinda not seeing the point in removing this, and ending up with 2
functions calls for every callsite. Replace the schedule_work with the
inlined drm_fb_helper_flush instead? That also avoids the naming bikeshed
in this case at least :-)


> -}
> -
>  /*
>   * Convert memory region into area of scanlines and pixels per
>   * scanline. The parameters off and len must not reach beyond
> @@ -683,6 +675,23 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>  }
>  EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>  
> +static void drm_fb_helper_flush(struct drm_fb_helper *helper)
> +{
> +	struct drm_device *dev = helper->dev;
> +	struct fb_info *info = helper->info;
> +
> +	/*
> +	 * For now, we assume that deferred I/O has been enabled as damage
> +	 * updates require deferred I/O for a working mmap. The current
> +	 * fbdev emulation does not flush buffers if no damage update is
> +	 * necessary. So it's safe to assume fbdefio to be set.
> +	 */
> +	if (drm_WARN_ON_ONCE(dev, !info->fbdefio))
> +		return;
> +
> +	fb_deferred_io_flush(info);
> +}
> +
>  typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
>  					     size_t count, loff_t pos);
>  
> @@ -824,9 +833,10 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
>  
>  	if (helper->funcs->fb_dirty) {
>  		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -				     drm_rect_width(&damage_area),
> -				     drm_rect_height(&damage_area));
> +		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
> +					      drm_rect_width(&damage_area),
> +					      drm_rect_height(&damage_area));
> +		drm_fb_helper_flush(helper);
>  	}
>  
>  	return ret;
> @@ -847,8 +857,11 @@ void drm_fb_helper_sys_fillrect(struct fb_info *info,
>  
>  	sys_fillrect(info, rect);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
> +					      rect->width, rect->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
>  
> @@ -866,8 +879,11 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
>  
>  	sys_copyarea(info, area);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
> +					      area->width, area->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
>  
> @@ -885,8 +901,11 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
>  
>  	sys_imageblit(info, image);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
> +					      image->width, image->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>  
> @@ -997,9 +1016,10 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
>  
>  	if (helper->funcs->fb_dirty) {
>  		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -				     drm_rect_width(&damage_area),
> -				     drm_rect_height(&damage_area));
> +		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
> +					      drm_rect_width(&damage_area),
> +					      drm_rect_height(&damage_area));
> +		drm_fb_helper_flush(helper);
>  	}
>  
>  	return ret;
> @@ -1020,8 +1040,11 @@ void drm_fb_helper_cfb_fillrect(struct fb_info *info,
>  
>  	cfb_fillrect(info, rect);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
> +					      rect->width, rect->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
>  
> @@ -1039,8 +1062,11 @@ void drm_fb_helper_cfb_copyarea(struct fb_info *info,
>  
>  	cfb_copyarea(info, area);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
> +					      area->width, area->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
>  
> @@ -1058,8 +1084,11 @@ void drm_fb_helper_cfb_imageblit(struct fb_info *info,
>  
>  	cfb_imageblit(info, image);
>  
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> +	if (helper->funcs->fb_dirty) {
> +		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
> +					      image->width, image->height);
> +		drm_fb_helper_flush(helper);
> +	}
>  }
>  EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
>  
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index c730253ab85ce..325d12c3a4d61 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -332,3 +332,19 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> +
> +void fb_deferred_io_flush(struct fb_info *info)
> +{
> +	struct fb_deferred_io *fbdefio = info->fbdefio;
> +
> +	if (WARN_ON_ONCE(!fbdefio))
> +		return; /* bug in driver logic */
> +
> +	/*
> +	 * There's no requirement to perform the flush immediately. So
> +	 * schedule the worker with a delay and let a few more writes
> +	 * pile up.
> +	 */

So this part is wrong, because the drm callers do rely on this not
flushing anything immediately, but instead on scheduling the worker. Or at
least that's the reason why we have the damage worker in the first place.

So this comment here needs to go, and the functions need to make it clear
in their names that that they queue/schedule the flush.

Also not sure whether you want to split out the fbdev part or not, imo
overkill.

With comments addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
> +}
> +EXPORT_SYMBOL_GPL(fb_deferred_io_flush);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index bcb8658f5b64d..54b3b3e13522f 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -663,6 +663,7 @@ extern void fb_deferred_io_open(struct fb_info *info,
>  				struct inode *inode,
>  				struct file *file);
>  extern void fb_deferred_io_cleanup(struct fb_info *info);
> +extern void fb_deferred_io_flush(struct fb_info *info);
>  extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>  				loff_t end, int datasync);
>  
> -- 
> 2.38.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
