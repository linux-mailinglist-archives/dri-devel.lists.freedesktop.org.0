Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE64498D1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A776E20B;
	Mon,  8 Nov 2021 16:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A186E20B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 16:00:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y196so13418206wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RfWyEQwza/OwACjecFkQjUgoXfm8j4XemNjlMTml08o=;
 b=JfaZvyEvStfyqgEP/9WUxufFOVOaULE0tDcZ0Ad/pSS5n/GOy04MYgIYT1Npr59nKz
 m2SHj6K/DVZ4hHMh0Au15BuvIwSo3iGcKLj7MtdW0CLiwgC+UXKN6cjb+8DxhIqxLR4o
 m3eG62kLIvLnqW79y2FGXeLokNKRwgbTSbcJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RfWyEQwza/OwACjecFkQjUgoXfm8j4XemNjlMTml08o=;
 b=V5wEvTdi3DNhyIm0hM7o8qmfsi20FyKLgDPOWijHy2UnZT/Vd3fydY0deYzvmzfw8p
 vjFW6ZyFzrfW8eXWUNfhzi2DjfGIIokjVp2JGGE2EW3uOKjLWBNC5F4z6RYnJOm7D2Xt
 pbJnYa0kB743EtdMeF7cWhWRBCPeGnI8G53fwi4Pe1cz6u1B80JmaCjgRqTt7DbxB8DK
 ivvgcVAzCaLXe0FK/CWYGSTsIeq1XmErenBDyunCyIZTKF8tBMI+YBkLtEHsYSmO1736
 g1UJUI3wvoQHjtWvbnaUqJY/1teTqTk8Su9QnNhARXimNE9hvhH+6EtQMX33+L65JnEg
 bcjg==
X-Gm-Message-State: AOAM532BmsQdoJeTV4foIDvAkomU/O5oDLbKP6dXcM6aP6pFGP74a73O
 IPdlhD6/TBIeuWuDNrt3eQAVJA==
X-Google-Smtp-Source: ABdhPJwh5fh6M1FZgSUx1+dw/CYXE2vsuPwXb0dO5810Y//fvEM44R6UgTiLYzXx87Z7ap2LR/UqgQ==
X-Received: by 2002:a05:600c:1906:: with SMTP id
 j6mr42358718wmq.141.1636387252833; 
 Mon, 08 Nov 2021 08:00:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d15sm14592998wri.50.2021.11.08.08.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:00:52 -0800 (PST)
Date: Mon, 8 Nov 2021 17:00:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event()
 when releasing drm master
Message-ID: <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
References: <20211108153453.51240-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108153453.51240-1-jfalempe@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: michel@daenzer.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 04:34:53PM +0100, Jocelyn Falempe wrote:
> When using Xorg/Logind and an external monitor connected with an MST dock.
> After disconnecting the external monitor, switching to VT may not work,
> the (internal) monitor sill display Xorg, and you can't see what you are
> typing in the VT.
> 
> This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
> checking into restore mode (v2)")
> 
> When switching to VT, with Xorg and logind, if there
> are pending hotplug event (like MST unplugged), the hotplug path
> may not be fulfilled, because logind may drop the master a bit later.
> It leads to the console not showing up on the monitor.
> 
> So when dropping the drm master, call the delayed hotplug function if
> needed.
> 
> v2: rewrote the patch by calling the hotplug function after dropping master
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Lastclose console restore is a very gross hack, and generally doesn't work
well.

The way this is supposed to work is:
- userspace drops drm master (because drm master always wins)
- userspace switches the console back to text mode (which will restore the
  console)

I guess we could also do this from dropmaster once more (like from
lastclose), but that really feels like papering over userspace bugs. And
given what a massive mess this entire area is already, I'm not eager to
add more hacks here.

So ... can't we fix userspace?

Ofc if it's a regression then that's different, but then I think we need a
bit clearer implementation. I'm not clear on why you clear the callback
(plus the locking looks busted).
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c      | 7 +++++++
>  drivers/gpu/drm/drm_fb_helper.c | 6 +++---
>  include/drm/drm_fb_helper.h     | 4 +++-
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 60a6b21474b1..73acf1994d49 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_lease.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_fb_helper.h>
>  
>  #include "drm_internal.h"
>  #include "drm_legacy.h"
> @@ -321,6 +322,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	drm_drop_master(dev, file_priv);
> +
> +	mutex_unlock(&dev->master_mutex);
> +	if (dev->fb_helper && dev->fb_helper->delayed_hotplug)
> +		dev->fb_helper->delayed_hotplug(dev->fb_helper);
> +	return ret;
> +
>  out_unlock:
>  	mutex_unlock(&dev->master_mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8e7a124d6c5a..e8d8cc3f47c3 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -252,9 +252,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>  		ret = drm_client_modeset_commit(&fb_helper->client);
>  	}
>  
> -	do_delayed = fb_helper->delayed_hotplug;
> +	do_delayed = (fb_helper->delayed_hotplug != NULL);
>  	if (do_delayed)
> -		fb_helper->delayed_hotplug = false;
> +		fb_helper->delayed_hotplug = NULL;
>  	mutex_unlock(&fb_helper->lock);
>  
>  	if (do_delayed)
> @@ -1966,7 +1966,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  	}
>  
>  	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
> -		fb_helper->delayed_hotplug = true;
> +		fb_helper->delayed_hotplug = drm_fb_helper_hotplug_event;
>  		mutex_unlock(&fb_helper->lock);
>  		return err;
>  	}
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 3af4624368d8..c2131d1a0e23 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -160,8 +160,10 @@ struct drm_fb_helper {
>  	 * A hotplug was received while fbdev wasn't in control of the DRM
>  	 * device, i.e. another KMS master was active. The output configuration
>  	 * needs to be reprobe when fbdev is in control again.
> +	 * NULL, or a pointer to the hotplug function, so it can be called
> +	 * by the drm drop function directly.
>  	 */
> -	bool delayed_hotplug;
> +	int (*delayed_hotplug)(struct drm_fb_helper *helper);
>  
>  	/**
>  	 * @deferred_setup:
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
