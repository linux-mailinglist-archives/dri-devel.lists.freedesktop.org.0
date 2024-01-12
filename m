Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1082C100
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A010E111;
	Fri, 12 Jan 2024 13:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA5E10E111
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:41:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-555d89bf8f4so1587888a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 05:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705066916; x=1705671716; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=svWc6RGF/60C/UQn6ObpTwfceTAG2Hopgd7PPEA8HRI=;
 b=Waql1haTk4yDtdlyLakbLV6F6VGddxSQNIcXGcPKJlWwd+dsZvLQaSOfEdjlxr2yvY
 mbnMMiKTaGo4FiXBKEe//aGHzSENt8EbXBvayft0pP4cLzUnTcY2HWcJm8Nj0zvWMYmU
 nHM+9MC2MG3i04kJMyeX8w1r10aR8I1PG4sAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705066916; x=1705671716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svWc6RGF/60C/UQn6ObpTwfceTAG2Hopgd7PPEA8HRI=;
 b=w6O2heqd5cqCJk3BQurWgAcgPo7UksbAn0aZvYmtiGIwagXYNk20GOsRbEF5Gnmwdm
 GFCLnbZzn80FwOOeJO75hGm8ucHenk6QJqqP7G0eWrghPa5CQ21bfD/Sc6E4x0W4hMig
 6igOy5uUgV+Oi6pkm5vKHKZM7de2KIepyhgqbeX/XsrWCfqvj/miQRwH6YEcPX9u7QjQ
 n+uPtJY5yJRhokfCcHjTWvkbIK+eyN6XOQmDm/lMdynqwuLq9lDBA7QO8bj2IH82zXkm
 mQmiEYdZOTlZ5iaNhStbKnqjAITWVt4r5KFSlCWIsDwBK49u+X3Eja/wOJwGlvYfjJMb
 qXUA==
X-Gm-Message-State: AOJu0YwvpgluBGeLbghg1mMPUWA7mwH1ZD8FNe8DlASE9WyFiMoeAQEp
 p9jhqphEsSKCL2OjsiXWhjWMMNFaRBo23w==
X-Google-Smtp-Source: AGHT+IGo6PZwuz/YwUSUYsp+W4offkdXEQhFdx8y53NMk0OMax+jlQ40XhDMhASctha22Qxp52LbLg==
X-Received: by 2002:a17:906:1641:b0:a27:b786:eb8b with SMTP id
 n1-20020a170906164100b00a27b786eb8bmr1550678ejd.5.1705066915671; 
 Fri, 12 Jan 2024 05:41:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a170906a39900b00a27a25afaf2sm1814988ejz.98.2024.01.12.05.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:41:55 -0800 (PST)
Date: Fri, 12 Jan 2024 14:41:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <ZaFBofhe217zCmWN@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-6-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 mripard@kernel.org, gpiccoli@igalia.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 05:00:49PM +0100, Jocelyn Falempe wrote:
> This was initialy done for imx6, but should work on most drivers
> using drm_fb_dma_helper.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_fb_dma_helper.c | 55 +++++++++++++++++++++++++++++
>  include/drm/drm_fb_dma_helper.h     |  4 +++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
> index 3b535ad1b07c..caed2935df4f 100644
> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_plane.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> @@ -148,3 +149,57 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>  	}
>  }
>  EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
> +
> +#if defined(CONFIG_DRM_PANIC)
> +/**
> + * @dev: DRM device
> + * @drm_scanout_buffer: scanout buffer for the panic handler
> + * Returns: 0 or negative error code
> + *
> + * Generic get_scanout_buffer() implementation, for drivers that uses the
> + * drm_fb_dma_helper.
> + */
> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	struct drm_plane *plane;
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +
> +	drm_for_each_primary_visible_plane(plane, dev) {

Ok that's not enough locking by far. You can't just hope that nothing
disappears while you're in a panic handler. We've been there and ended up
reliably oopsing in the panic handler itself. So you _have_ to follow the
full set of locking rules for all drm structures, or things will just get
worse at the worst possible moment.

But also, you're not allowed to do anything else than trylock, because a
panic handler might run from nmi context, and so you cannot even acquire
irq-safe spinlocks reliably.

Which means:

- You need to be safe against concurrent drm_dev_unregister. Using the
  atomic panic notifier directly for each device should take care of that
  (but maybe that stuff is still not nmi safe, not sure).

- You _have_ to use all the locks. Luckily iterating over the plane list
  doesn't need one, but you have to trylock the plane's modeset lock.
  Which means your nice iterator macro is already toast, because that
  already looks at state it's not allowed to look at without a lock. Or
  well, the plane->state pointer is no-go already.

Given the locking issues I'm not sure whether the
drm_for_each_primary_visible_plane iterator is going to work, you'd need
something like iter_init/next/end we have for walking the connector list.
Plus it would be very panic specific due to the trylock, so maybe

drm_for_each_visible_plane_in_panic_handler()

or something like that.

One thing I was wondering is whether we should lift this iteration over
all planes into the shared code, and move the ->get_scanout_buffer
function to the drm_plane_funcs structure instead?

> +		fb = plane->state->fb;
> +		/* Only support linear modifier */
> +		if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
> +			continue;
> +
> +		/* Check if color format is supported */
> +		if (!drm_panic_is_format_supported(fb->format->format))
> +			continue;
> +
> +		dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +		/* Buffer should be accessible from the CPU */
> +		if (dma_obj->base.import_attach)

This might be a bit too restrictive, since some drivers import dma-buf
including a vmap. So just checking for ->vaddr might be better. But can be
changed later on.

> +			continue;
> +
> +		/* Buffer should be already mapped to CPU */

I'd clarify this comment to state that vaddr is invariant over the
lifetime of the buffer and therefore needs no locking. Correct locking
that a) takes all the locks b) never ever stalls for one is absolutely
crucial for a panic handler that won't make the situation worse.

> +		if (!dma_obj->vaddr)


> +			continue;
> +
> +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> +		sb->format = fb->format;
> +		sb->height = fb->height;
> +		sb->width = fb->width;
> +		sb->pitch = fb->pitches[0];
> +		return 0;

Otherwise this lgtm.
-Sima

> +	}
> +	return -ENODEV;
> +}
> +#else
> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	return 0;
> +}
> +#endif
> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
> diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
> index d5e036c57801..2ae432865079 100644
> --- a/include/drm/drm_fb_dma_helper.h
> +++ b/include/drm/drm_fb_dma_helper.h
> @@ -7,6 +7,7 @@
>  struct drm_device;
>  struct drm_framebuffer;
>  struct drm_plane_state;
> +struct drm_scanout_buffer;
>  
>  struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
>  	unsigned int plane);
> @@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>  				  struct drm_plane_state *old_state,
>  				  struct drm_plane_state *state);
>  
> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> +				     struct drm_scanout_buffer *sb);
> +
>  #endif
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
