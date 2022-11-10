Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21962443E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 15:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72EE10E7E8;
	Thu, 10 Nov 2022 14:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEFF10E7E8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 14:28:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l11so3348676edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5QOE4GlqAJYzBEwpYIY2b0DW7VXMg67p6gkrgc1rB5s=;
 b=Anu01obHuFLCEScbRhpNmrkLurOum8nrEAakCl/bDYQ8f6Z77tmqkyx+SivqFJh1ID
 Z2DUJvFXMmhN6LkmyU1T3Q2nxSFUKYRrric1giRXdpRpXvG+q9IZVNWxf/zlJwkv3ozc
 zYaHBYiTAF23eENJgSvF0MDK1lHamJiKQBFfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QOE4GlqAJYzBEwpYIY2b0DW7VXMg67p6gkrgc1rB5s=;
 b=EvXx/4Lqr1aRrw1gaEt8P0MvdS4TRm/Hs+ZRh6BmTGwkO33GNLKdQOxYWBrmhJel0G
 deqfKabiUdIqNwTNUieszKu+DN8y1YX+w+OX7DNlb32Vc5UXK6Q+xlLpb7J9pzAW6xcE
 mOIfKqyHBhCa+uBK64VfrM6CFNccFuoxwkwYf7zbeHE6Af/0GR0JrpWNmJnjXjcwZJlc
 lxk40gVf38y3xHgghUbHYvacc8vJyV3x3lxGjBA44U0O3ha7SgUrmkC0xiEsIobvESs6
 XIhQMUv4Yenb18UGOVI73V/ceW7PozJTso6e/zEtc75MO+JY/dmA/Wh+CWXofBQD7C6p
 1haQ==
X-Gm-Message-State: ANoB5pnix2t9T1fTsLmsUMERs9tThNXiDZEUKKWN/54kU5Jti0qN5d56
 nnW85gqLPdIf2v/wKo+vNyomoQ==
X-Google-Smtp-Source: AA0mqf5bDYz+rlcwnz4Qe1Vg71O2zlGTA7vFEoY+b4SDO+glJeAaPxRrbIlpWMdfV+xxzkJcMWOTjg==
X-Received: by 2002:aa7:d1d3:0:b0:466:539:4654 with SMTP id
 g19-20020aa7d1d3000000b0046605394654mr26784314edp.309.1668090491267; 
 Thu, 10 Nov 2022 06:28:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 gg3-20020a170906e28300b0077d6f628e14sm7243037ejb.83.2022.11.10.06.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:28:10 -0800 (PST)
Date: Thu, 10 Nov 2022 15:28:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Message-ID: <Y20Kd27U+pbWay8M@phenom.ffwll.local>
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

Naming bikeshed, _flush usually means to run the worker and synchronously
block (i.e. flush out all pending things), which is not what's going on.
_schedule() or _queue() I think would be much better and more in line with
what linux wq and related subsystems use.
-Daniel

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
