Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CB6E7FC3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F6610EA0E;
	Wed, 19 Apr 2023 16:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC4810EA0E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:38:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a34c299d8so154749966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681922280; x=1684514280;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5zzUvtufJ3eigi8dDFUvHUQC/l/1L/lCMl3qMEDwpA=;
 b=K4oJI6Ff80Jpz9IgyXsis/Cz/4nGl18b3vCNG+r2UsSKG96Z5KDmga5aKo8UQO+LK4
 GEZqoyVEi+xqXMeapoXdf7DemfUZOpaXW5TIxDo0wjKyNkQao2CqJ9jCbPa49gVG8tOG
 /1t2iM/TYNJ7/Dt3IrK/GKDAb1oT53J45YaOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681922280; x=1684514280;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5zzUvtufJ3eigi8dDFUvHUQC/l/1L/lCMl3qMEDwpA=;
 b=XieCNCYQtj8v9CtrMYfsAKBTtaN2xNjG4AYWOa6PWrEdZW40DzhV7vAmT9B3P8WAld
 51kn91XUTWWqCsCLm3aam8b5qBy+3CwkngywIXCYActiitUYlwP3XizkbkaXbWrtS7uw
 nnjI4BCc74fDy0xzYuXwb3A6iuMRoDsJOLrpLCs0GSW3NjMCy5sdO5gri8XpyzMEQtM1
 Hl4NAgEJ3mMM8UsfCu0NggHFqmgIgc844Hvqn6bzrmCGYXsR5YSF/tgRHaBOUGStPKOu
 yYl/qamb5IFSKdySjAAs9hmz4+2BkbgXRQBmiSL2oR4IW3NvMIMUsSiejy2D/r5oNIR0
 l7nA==
X-Gm-Message-State: AAQBX9dnVYS7wV+BfKETWj0fKGCM4bpM/nNyhjTSPKgm7OpZlJ9SKAQm
 awx7/8ADgM6UPq4AQEdDEchzDA==
X-Google-Smtp-Source: AKy350ZHiD1Lzmm2D/49Uq4yaW7v0gvUX/Cw4RwJO2/o1VSbh2lDapTUCoSiRl/GpVhDglYCUzOGnQ==
X-Received: by 2002:a17:906:72dd:b0:92f:27c2:13c0 with SMTP id
 m29-20020a17090672dd00b0092f27c213c0mr17371020ejl.6.1681922280180; 
 Wed, 19 Apr 2023 09:38:00 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 t16-20020a170906269000b00932ba722482sm9759815ejc.149.2023.04.19.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:37:59 -0700 (PDT)
Date: Wed, 19 Apr 2023 18:37:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm/fb-helper: Fix height, width, and accel_flags in
 fb_var
Message-ID: <ZEAY5Sf/V10ipDZk@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 08:42:46PM +0200, Geert Uytterhoeven wrote:
> Fbtest contains some very simple validation of the fbdev userspace API
> contract.  When used with shmob-drm, it reports the following warnings
> and errors:
> 
>     height changed from 68 to 0
>     height was rounded down
>     width changed from 111 to 0
>     width was rounded down
>     accel_flags changed from 0 to 1
> 
> The first part happens because __fill_var() resets the physical
> dimensions of the first connector, as filled in by drm_setup_crtcs_fb().
> Fix this by retaining the original values.
> 
> The last part happens because __fill_var() forces the FB_ACCELF_TEXT
> flag on, while fbtest disables all acceleration on purpose, so it can
> draw safely to the frame buffer.  Fix this by setting accel_flags to
> zero, as DRM does not implement any text console acceleration.
> Note that this issue can also be seen in the output of fbset, which
> reports "accel true".
> 
> Fixes: ee4cce0a8f03a333 ("drm/fb-helper: fix input validation gaps in check_var")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 64458982be40c468..ed6ad787915f0b8f 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1537,17 +1537,19 @@ static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
>  	}
>  }
>  
> -static void __fill_var(struct fb_var_screeninfo *var,
> +static void __fill_var(struct fb_var_screeninfo *var, struct fb_info *info,
>  		       struct drm_framebuffer *fb)
>  {
>  	int i;
>  
>  	var->xres_virtual = fb->width;
>  	var->yres_virtual = fb->height;
> -	var->accel_flags = FB_ACCELF_TEXT;
> +	var->accel_flags = 0;
>  	var->bits_per_pixel = drm_format_info_bpp(fb->format, 0);
>  
> -	var->height = var->width = 0;
> +	var->height = info->var.height;
> +	var->width = info->var.width;
> +
>  	var->left_margin = var->right_margin = 0;
>  	var->upper_margin = var->lower_margin = 0;
>  	var->hsync_len = var->vsync_len = 0;
> @@ -1610,7 +1612,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  		return -EINVAL;
>  	}
>  
> -	__fill_var(var, fb);
> +	__fill_var(var, info, fb);
>  
>  	/*
>  	 * fb_pan_display() validates this, but fb_set_par() doesn't and just
> @@ -2066,7 +2068,7 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
>  	info->pseudo_palette = fb_helper->pseudo_palette;
>  	info->var.xoffset = 0;
>  	info->var.yoffset = 0;
> -	__fill_var(&info->var, fb);
> +	__fill_var(&info->var, info, fb);

Bit a bikeshed since it zeroed-allocated anyway, but I'd pass NULL here
for info and catch that in __fill_var and then keep the explicit = 0;

Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	info->var.activate = FB_ACTIVATE_NOW;
>  
>  	drm_fb_helper_fill_pixel_fmt(&info->var, format);
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
