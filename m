Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F06D7DA5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352FA10E94D;
	Wed,  5 Apr 2023 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F6F10E94D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:23:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso49971a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680701036; x=1683293036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uUtn3SjQI5nSiP07wrdGSQDdxhSdmFRXdcXaUGuqfA4=;
 b=RMnD8oI7uuaTzDV97kJRv1vLB8jH29p3mkiMmcpdHolLr6bYGQhk6cJFnxRU9TPJKm
 zME7ia1R1NQ0EYvEfBep8Mu6B6ok6nwFxvzEXLRQLXj9QngyUoFcWN/8Wuk/1hW3BbWE
 xEdfbjbzXILLmWOG3tgQky/dlyOIIpREznuu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680701036; x=1683293036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUtn3SjQI5nSiP07wrdGSQDdxhSdmFRXdcXaUGuqfA4=;
 b=h8RpQDFDYBeuwilZ0TByD8+OeZYj7PEsyKoEdOWiwy+FTpRRwyucqnhyNb3oF4GbYq
 HlFODSWa47EeYZhZeB4hqGRuJ919G6f8EeYRnnVLVWVnOdZZ6/8J7fFHBo2zDuKXeyk0
 9t86cxg06sZyotAsxaoXMCFDDLRl0PiSd6ySlh5QJvhY4Yg1XblimG6PhQcB/xUDDgw2
 8OLLbXsEkhvY8IgBHBaltHlpQQUhJUth1oN3fngxC+msng+RP/Y8LtcnzwlkPoiDjFZB
 8YxD5/Y7u1o6W1D1Hx/ui1NLusEv8zXIvwGa0CnApdUNfmUMVfeLykAcgFN7TzIlVcAx
 Zrfw==
X-Gm-Message-State: AAQBX9cYCIuhBc64+Pw69vzph29WgCOkVTvR5GHqBjsj/u+lWXH0cJ6I
 aeGr4bmOJfMWjq0ALR3T3GvYkg==
X-Google-Smtp-Source: AKy350Ymhhjau05nOq4CPllcGZMpBnzABWc6DhryfXIg/k1QQDRgPSCq6HmbmNjGImNdsRCxJpqfCw==
X-Received: by 2002:a05:6402:d0e:b0:502:e50:3358 with SMTP id
 eb14-20020a0564020d0e00b005020e503358mr1929808edb.3.1680701035988; 
 Wed, 05 Apr 2023 06:23:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05640251c600b004fd219242a5sm7232241edd.7.2023.04.05.06.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:23:55 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:23:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/3] drm/fb-helper: fix input validation gaps in check_var
Message-ID: <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
 <20230404194038.472803-3-daniel.vetter@ffwll.ch>
 <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:52:12PM +0200, Javier Martinez Canillas wrote:
> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
> 
> > Apparently drivers need to check all this stuff themselves, which for
> > most things makes sense I guess. And for everything else we luck out,
> > because modern distros stopped supporting any other fbdev drivers than
> > drm ones and I really don't want to argue anymore about who needs to
> > check stuff. Therefore fixing all this just for drm fbdev emulation is
> > good enough.
> >
> 
> Agreed.
> 
> > Note that var->active is not set or validated. This is just control
> > flow for fbmem.c and needs to be validated in there as needed.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> 
> [...]
> 
> >  
> > +static void __fill_var(struct fb_var_screeninfo *var,
> > +		       struct drm_framebuffer *fb)
> > +{
> > +	int i;
> > +
> > +	var->xres_virtual = fb->width;
> > +	var->yres_virtual = fb->height;
> > +	var->accel_flags = FB_ACCELF_TEXT;
> > +	var->bits_per_pixel = drm_format_info_bpp(fb->format, 0);
> > +
> > +	var->height = var->width = 0;
> > +	var->left_margin = var->right_margin = 0;
> > +	var->upper_margin = var->lower_margin = 0;
> > +	var->hsync_len = var->vsync_len = 0;
> > +	var->sync = var->vmode = 0;
> > +	var->rotate = 0;
> > +	var->colorspace = 0;
> > +	for (i = 0; i < 4; i++)
> > +		var->reserved[i] = 0;
> > +}
> > +
> >  /**
> >   * drm_fb_helper_check_var - implementation for &fb_ops.fb_check_var
> >   * @var: screeninfo to check
> > @@ -1595,8 +1616,22 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >  		return -EINVAL;
> >  	}
> >  
> > -	var->xres_virtual = fb->width;
> > -	var->yres_virtual = fb->height;
> > +	__fill_var(var, fb);
> > +
> 
> [...]
> 
> There is the following here (in latest drm-misc/drm-misc-next at least):
> 
> 	/*
> 	 * Changes struct fb_var_screeninfo are currently not pushed back
> 	 * to KMS, hence fail if different settings are requested.
> 	 */
> 	bpp = drm_format_info_bpp(format, 0);
> 	if (var->bits_per_pixel > bpp ||
> 	    var->xres > fb->width || var->yres > fb->height ||
> 	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
> 		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current fb "
> 			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
> 			  var->xres, var->yres, var->bits_per_pixel,
> 			  var->xres_virtual, var->yres_virtual,
> 			  fb->width, fb->height, bpp);
> 		return -EINVAL;
> 	}
> 
> but only the 'var->xres > fb->width || var->yres > fb->height' from the
> conditions checked could be false after your __fill_var() call above.
> 
> You should drop the 'var->bits_per_pixel > bpp', 'var->xres_virtual >
> fb->width' and 'var->yres_virtual > fb->height' checks I believe since
> those will always be true.

The __fill_var is after this. I'm honestly not sure what the exact
semantics are supposed to be, but essentially if userspace asks for too
big virtual size, we reject it. And for anything else we then tell it
(with __fill_var) how big the actually available space is.

What I'm wondering now is whether too small x/yres won't lead to problems
of some sorts ... For multi-screen we set the virtual size to be big
enough for all crtc, and then just set x/yres to be the smallest output.
That way fbcon knows to only draw as much as is visible on all screens.
But if you then pan that too much, the bigger screens might not have a big
enough buffer anymore and things fail (but shouldn't).

Not sure how to fix that tbh.
-Daniel

> 
> > +	/*
> > +	 * fb_pan_display() validates this, but fb_set_par() doesn't and just
> > +	 * falls over. Note that __fill_var above adjusts y/res_virtual.
> > +	 */
> > +	if (var->yoffset > var->yres_virtual - var->yres ||
> > +	    var->xoffset > var->xres_virtual - var->xres)
> > +		return -EINVAL;
> > +
> > +	/* We neither support grayscale nor FOURCC (also stored in here). */
> > +	if (var->grayscale > 0)
> > +		return -EINVAL;
> > +
> > +	if (var->nonstd)
> > +		return -EINVAL;
> >  
> >  	/*
> >  	 * Workaround for SDL 1.2, which is known to be setting all pixel format
> > @@ -1612,11 +1647,6 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >  		drm_fb_helper_fill_pixel_fmt(var, format);
> >  	}
> >  
> 
> Other than what I mentioned, the patch makes sense to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
