Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE3933F34
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4026710E28D;
	Wed, 17 Jul 2024 15:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fV3qnvmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3817E10E297
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:04:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-427bc3877d0so2000425e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721228659; x=1721833459; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5pjr/7PlGU0bno59J3w/W6V2Jp6tDpULmroTCCRYAE=;
 b=fV3qnvmFOrcFMD2QqGO/OsIL7wz3QoKfaMcywxAPdFlz30OJR/yzUCkGXPmnBnamF/
 GmXeSXnSA5PnaTQFohkZh2lNhFRD2Nc/njbeLQhztpeEQY0kQ/U5RWTfEoVWfs9rcYdd
 O3pwQbIe5tjBJ6arHRFP/GJwln7AkSkrTDcN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228659; x=1721833459;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u5pjr/7PlGU0bno59J3w/W6V2Jp6tDpULmroTCCRYAE=;
 b=EHMMZBI1BIlzUtrwUs1m1YY6M0jzMJgc0BwIO6AL/ThYmiqrf6tnfgHtLCOq0/YRRl
 RHTELBFXah+vi19j+jTw0yT3kBd7/SP2xcm0UM+pggbZZ0qNBEW++gNFGm2ZV/mkE1+q
 +c14lgOnb8gj3HgUxVjmbK6ddHyIhT6+Qx6vqnnQiEXeddOoLlkAHrG+NPJtzVh+NmgV
 D6dz0MVIMDYy0DIuZdTB/eMkuguACnW6VRU0ixy/RfXEUkLypnmKnAj0a6ZbfekjqeaP
 1c2yY0L9gzAkFEyRBR2w5R+ODsAM/HvpXic/IrCGbzxPNf1dUQ7xfQYwInog2XGZNXR2
 cfRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzmp15WrKauZfwqhyNuxZXDvfmc5aeLdJY+Ri8kSf5Wfk4V+kyINuXQAUfV7e4NIDx557B5xzpdhAULCf1bJupXGI8nc81jfRqR4s8np2W
X-Gm-Message-State: AOJu0YxaA/q71u/z1r5OGmPNqZN/s8KRqf+eZeJLREdRGy7yosGV3F2U
 zKgfcHLf9uP0kbuychIf5RLYt/jyoHj5aeDgLS92HnxSqJUzo7Np0E3/4jS/Q/I=
X-Google-Smtp-Source: AGHT+IGnQq5qn3XFcUVytJqVgSB3xoYK5wfjBzWyxNvSmCk4IGCgYkb1mLjSP+9pJg5W/Sm0P9gk8w==
X-Received: by 2002:a05:600c:1c86:b0:424:ac9f:5c61 with SMTP id
 5b1f17b1804b1-427c2d0c8eemr8946465e9.3.1721228659021; 
 Wed, 17 Jul 2024 08:04:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c78076f7sm1074075e9.37.2024.07.17.08.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:04:18 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:04:16 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/3] fbcon: Add an option to disable fbcon in panic.
Message-ID: <ZpfdcC2Es9rweHW_@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717090102.968152-3-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 17, 2024 at 10:48:40AM +0200, Jocelyn Falempe wrote:
> This is required to avoid conflict between DRM_PANIC, and fbcon. If
> a drm device already handle panic with drm_panic, it should set
> the skip_panic field in fb_info, so that fbcon will stay quiet, and
> not overwrite the panic_screen.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c  | 2 ++
>  drivers/video/fbdev/core/fbcon.c | 7 ++++++-
>  include/linux/fb.h               | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e2e19f49342e..3662d664d8f9 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -524,6 +525,7 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>  	fb_helper->info = info;
>  	info->skip_vt_switch = true;
>  
> +	info->skip_panic = drm_panic_is_enabled(fb_helper->dev);
>  	return info;
>  
>  err_release:

Bit a bikeshed, but I'd split this patch out since it's for drm's fbdev
emulation, not the fbcon core code. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 3f7333dca508..498d9c07df80 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -270,12 +270,17 @@ static int fbcon_get_rotate(struct fb_info *info)
>  	return (ops) ? ops->rotate : 0;
>  }
>  
> +static bool fbcon_skip_panic(struct fb_info *info)
> +{
> +	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
> +}
> +
>  static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  
>  	return (info->state != FBINFO_STATE_RUNNING ||
> -		vc->vc_mode != KD_TEXT || ops->graphics);
> +		vc->vc_mode != KD_TEXT || ops->graphics || fbcon_skip_panic(info));
>  }
>  
>  static int get_color(struct vc_data *vc, struct fb_info *info,
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index db7d97b10964..865dad03e73e 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -510,6 +510,7 @@ struct fb_info {
>  	void *par;
>  
>  	bool skip_vt_switch; /* no VT switch on suspend/resume required */
> +	bool skip_panic; /* Do not write to the fb after a panic */
>  };
>  
>  /* This will go away
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
