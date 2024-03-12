Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82367879941
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FE0112542;
	Tue, 12 Mar 2024 16:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BI8u+WSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A97112542
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 16:45:04 +0000 (UTC)
Message-ID: <5edd285f-5e23-411c-a39b-0e4f48e4ce17@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710261902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcrMjeJY0WuO8FrEuKlfWFlFMYMwWV6dn1LskNuRS8o=;
 b=BI8u+WSuQFvd1JOiiQSWjp5EdWXrhVIIKpXVrPO0fJhLovwmM/sC076b8rHNVp7tFnFIgB
 pNm0+bvsUHMNtCNbtALROvDnPxctpOk5AOQObdFPPUZSuHlAmCy+VeltJ47pXUkHaTAdh4
 rNRIriBR//SX4zRpnwVubPEcMsmzaf0=
Date: Wed, 13 Mar 2024 00:44:50 +0800
MIME-Version: 1.0
Subject: Re: [v9,5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-6-jfalempe@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240307091936.576689-6-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

I'm get attracted by your patch, so I want to comment.
Please correct or ignore me if I say something wrong.

On 2024/3/7 17:14, Jocelyn Falempe wrote:
> This was initialy done for imx6, but should work on most drivers
> using drm_fb_dma_helper.
>
> v8:
>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>     (Thomas Zimmermann)
>
> v9:
>   * go back to get_scanout_buffer()
>   * move get_scanout_buffer() to plane helper functions
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_fb_dma_helper.c | 47 +++++++++++++++++++++++++++++
>   include/drm/drm_fb_dma_helper.h     |  4 +++
>   2 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
> index 3b535ad1b07c..010327069ad4 100644
> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_dma_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/module.h>
> @@ -148,3 +149,49 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>   	}
>   }
>   EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
> +
> +#if defined(CONFIG_DRM_PANIC)
> +/**
> + * @plane: DRM primary plane
> + * @drm_scanout_buffer: scanout buffer for the panic handler
> + * Returns: 0 or negative error code
> + *
> + * Generic get_scanout_buffer() implementation, for drivers that uses the
> + * drm_fb_dma_helper.
> + */
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +
> +	fb = plane->state->fb;
> +	/* Only support linear modifier */
> +	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
> +		return -ENODEV;


I think, the framebuffer format check clause here should be moved to the core layer.
For example, move this check into thedrm_panic_is_format_supported() function. And update the 
drm_panic_is_format_supported() function  to make it take 'struct drm_framebuffer *fb'
as argument. Because this check is needed for all implement, not driver specific or
implement specific.

I know that some display controller support TILE format, but then you can try to trigger modeset
to let the display controller using linear format to display. Or, you can also convert local
linear buffer(with content pained) to the device specific TILED framebuffer, then feed TILED
framebuffer to the display controller to scanout. This is something like reverse the process of
resolve, but the convert program is running on the CPU.  As panic is not performance critical,
so it's possible. This maybe a bit more difficult, but the idea behind this is that the goal of
this drm_panic_gem_get_scanout_buffer() function is just to get a buffer scanout-able. Other
things beyond that (like format checking) can be moved to upper level(the caller of it). So you
don't need to modify(update) the specific implement if one day you have some fancy idea implemented.


> +	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	/* Buffer should be accessible from the CPU */
> +	if (dma_obj->base.import_attach)
> +		return -ENODEV;
> +
> +	/* Buffer should be already mapped to CPU */
> +	if (!dma_obj->vaddr)
> +		return -ENODEV;


How about to call drm_gem_vmap_unlocked(dma_obj, &sb->map); ?

    

> +	iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> +	sb->format = fb->format;
> +	sb->height = fb->height;
> +	sb->width = fb->width;
> +	sb->pitch = fb->pitches[0];
> +	return 0;
> +}
> +#else
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
> diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
> index d5e036c57801..61f24c2aba2f 100644
> --- a/include/drm/drm_fb_dma_helper.h
> +++ b/include/drm/drm_fb_dma_helper.h
> @@ -7,6 +7,7 @@
>   struct drm_device;
>   struct drm_framebuffer;
>   struct drm_plane_state;
> +struct drm_scanout_buffer;
>   
>   struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
>   	unsigned int plane);
> @@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>   				  struct drm_plane_state *old_state,
>   				  struct drm_plane_state *state);
>   
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb);
> +
>   #endif
>   
