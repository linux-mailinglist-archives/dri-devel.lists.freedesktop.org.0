Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE83625689
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A310E7D4;
	Fri, 11 Nov 2022 09:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084B210E7D4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:23:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id t25so11228867ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v3I2AlGkmZml0NV5UXmufcehm7JYR+uex3T1EODDHbA=;
 b=kwPtbT0jXTIFd6h+6oLUPZAlkZGYkaCCnXiu1a+iWHdi15fF/wJHUeBwsX7aoggX3r
 EZoafmZ5w4nXGzo0utqAiWaLUzs/6lEdJsO5Y6b4L47pK/VHCjbzu/Mn6FBK76rxBgCO
 YHiMe3Sz4W+QJT537OFkl5+bqrn87uVNF3bFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3I2AlGkmZml0NV5UXmufcehm7JYR+uex3T1EODDHbA=;
 b=LI4kkTNUW/x3P9hnxms7Se6omsKVLmbDDvPJOi5aeN/ojn7tiSv304Tgf885/JSTm0
 wz4jWYXS80Q4v/6kPlSf2lyxfT9+SMrV7wN7F71ihivAv6aBBwrL2wWchPWJ3qE5TAGy
 uw97tffwxIhGCQ+I+Xab3FyHwq6lfjvcaKMXvbZIQp6tKY0EwLHBmgEVJSdd/dXDr5BX
 XHxF688+A5SJiH6lMkC0Z3JVLWtMzVFlCCZXUkEPuxgHY6/wj0hNkw2GgxR+WSeGorsr
 WCUKMVVz/n5snUT7wHhaGtj3SnDOddtPY31hKsNl2pmWDAS19MC0jlYrln3javV3f9yL
 jwkA==
X-Gm-Message-State: ANoB5plySCdDR9EZCzhAQ5yyuHY01ydsbwENgeiel+cAi6dd06YxW9Gy
 2TbX9P0+bP543Ty7h9I3l6S7Yg==
X-Google-Smtp-Source: AA0mqf4IS/qVRwyy0X5noffDv5x7QRt8v7iDewX8IoTy0jTx/NPqjDM0zHNwA2msmStphkYmRGZ8DA==
X-Received: by 2002:a17:906:a86:b0:78a:d0a4:176 with SMTP id
 y6-20020a1709060a8600b0078ad0a40176mr1131622ejf.720.1668158606329; 
 Fri, 11 Nov 2022 01:23:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g16-20020a1709065d1000b0073d7b876621sm646527ejt.205.2022.11.11.01.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:23:25 -0800 (PST)
Date: Fri, 11 Nov 2022 10:23:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/fb-helper: Perform damage handling in
 deferred-I/O helper
Message-ID: <Y24UixFlqjEFkTZ/@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110135519.30029-4-tzimmermann@suse.de>
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

On Thu, Nov 10, 2022 at 02:55:17PM +0100, Thomas Zimmermann wrote:
> Call fb_dirty directly from drm_fb_helper_deferred_io() to avoid the
> latency of running the damage worker.
> 
> The deferred-I/O helper drm_fb_helper_deferred_io() runs in a worker
> thread at regular intervals as part of writing to mmaped framebuffer
> memory. It used to schedule the fbdev damage worker to flush the
> framebuffer. Changing this to flushing the framebuffer directly avoids
> the latency introduced by the damage worker.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index be8ecb5e50b56..ebc44ed1bf4a2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -644,10 +644,14 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
>  void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
>  {
>  	struct drm_fb_helper *helper = info->par;
> +	struct drm_device *dev = helper->dev;
>  	unsigned long start, end, min_off, max_off;
>  	struct fb_deferred_io_pageref *pageref;
>  	struct drm_rect damage_area;
>  
> +	if (drm_WARN_ON(dev, !helper->funcs->fb_dirty))
> +		return;
> +
>  	min_off = ULONG_MAX;
>  	max_off = 0;
>  	list_for_each_entry(pageref, pagereflist, list) {
> @@ -656,22 +660,26 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>  		min_off = min(min_off, start);
>  		max_off = max(max_off, end);
>  	}
> -	if (min_off >= max_off)
> -		return;
>  
> -	if (helper->funcs->fb_dirty) {

The replacement of this if() with the drm_WARN_ON above looks like it's a
leftover from 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
overhead"), which hasn't pulled the ->fb_dirty check all the way out
fully. It confused me quite a bit until I stitched the story together.

I think splitting this out would be best, but minimally explain this in
the commit message. Either way

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -		/*
> -		 * As we can only track pages, we might reach beyond the end
> -		 * of the screen and account for non-existing scanlines. Hence,
> -		 * keep the covered memory area within the screen buffer.
> -		 */
> -		max_off = min(max_off, info->screen_size);
> +	/*
> +	 * As we can only track pages, we might reach beyond the end
> +	 * of the screen and account for non-existing scanlines. Hence,
> +	 * keep the covered memory area within the screen buffer.
> +	 */
> +	max_off = min(max_off, info->screen_size);
>  
> +	if (min_off < max_off) {
>  		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -				     drm_rect_width(&damage_area),
> -				     drm_rect_height(&damage_area));
> +		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
> +					      drm_rect_width(&damage_area),
> +					      drm_rect_height(&damage_area));
>  	}
> +
> +	/*
> +	 * Flushes all dirty pages from mmap's pageref list and the
> +	 * areas that have been written by struct fb_ops callbacks.
> +	 */
> +	drm_fb_helper_fb_dirty(helper);
>  }
>  EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>  
> -- 
> 2.38.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
