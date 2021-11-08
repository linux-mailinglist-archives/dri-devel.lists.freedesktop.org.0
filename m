Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA9449D7C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B876E8C8;
	Mon,  8 Nov 2021 21:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975AC6E8C8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 21:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKeFXAV+WjakbyqOjhDvQAu/6xFF+rgo1c/NR+k78Gg=; b=NzEzShv6UZFAhtlssu6JOCX/Gz
 qjYHpRQhawCDC2N1+AnyOcTbK15uBJl1Uiqh5qN+fxcsRaoLmO2q7gbeyj+VHiZIA9kAH5c+su/S2
 MmrExq3NRtRJ0faBBvD1XIp7gL736+Q8MCt5PcuG+89aU8C3H2fDxaW0F55nuIouz90DBgSEIVg9/
 FGqs3TY9RcLLAFKPb2yE+YxKPWbt+xFVB4k7228jnz/0rj82Qb6oqhMgsFIl1w5Bdw7Ht55DisrNQ
 gi3G1Gw5CwCX9p63JYzfTgZKgz4vptVnFsrqftDeVRbKbxrzP7htzM4lWzJcmJs33nehFiW+XdYHh
 KW/V+cVQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55154
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mkBmB-0002wM-HN; Mon, 08 Nov 2021 22:01:59 +0100
Subject: Re: [PATCH v2 8/9] drm/simpledrm: Support virtual screen sizes
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-9-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <597cc1b8-30c1-bdf0-68ad-3ad0fd53fb5f@tronnes.org>
Date: Mon, 8 Nov 2021 22:01:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211101141532.26655-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.11.2021 15.15, skrev Thomas Zimmermann:
> Add constants for the maximum size of the shadow-plane surface
> size. Useful for shadow planes with virtual screen sizes. The
> current sizes are 4096 scanlines with 4096 pixels each. This
> seems reasonable for current hardware, but can be increased as
> necessary.
> 
> In simpledrm, set the maximum framebuffer size from the constants
> for shadow planes. Implements support for virtual screen sizes and
> page flipping on the fbdev console.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c    |  9 +++++++--
>  include/drm/drm_gem_atomic_helper.h | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index e872121e9fb0..e42ae1c6ebcd 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/of_clk.h>
> +#include <linux/minmax.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> @@ -776,6 +777,7 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
>  	struct drm_display_mode *mode = &sdev->mode;
>  	struct drm_connector *connector = &sdev->connector;
>  	struct drm_simple_display_pipe *pipe = &sdev->pipe;
> +	unsigned long max_width, max_height;
>  	const uint32_t *formats;
>  	size_t nformats;
>  	int ret;
> @@ -784,10 +786,13 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
>  	if (ret)
>  		return ret;
>  
> +	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +
>  	dev->mode_config.min_width = mode->hdisplay;
> -	dev->mode_config.max_width = mode->hdisplay;
> +	dev->mode_config.max_width = max_width;
>  	dev->mode_config.min_height = mode->vdisplay;
> -	dev->mode_config.max_height = mode->vdisplay;
> +	dev->mode_config.max_height = max_height;
>  	dev->mode_config.prefer_shadow_fbdev = true;
>  	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
>  	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
> index 48222a107873..54983ecf641a 100644
> --- a/include/drm/drm_gem_atomic_helper.h
> +++ b/include/drm/drm_gem_atomic_helper.h
> @@ -22,6 +22,24 @@ int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
>   * Helpers for planes with shadow buffers
>   */
>  
> +/**
> + * DRM_SHADOW_PLANE_MAX_WIDTH - Maximum width of a plane's shadow buffer in pixels
> + *
> + * For drivers with shadow planes, the maximum width of the framebuffer is
> + * usually independent from hardware limitations. Drivers can initialize struct
> + * drm_mode_config.max_width from DRM_SHADOW_PLANE_MAX_WIDTH.

Why would a driver do that instead of using a value of its own? Is it
some kind of standardization?

> + */
> +#define DRM_SHADOW_PLANE_MAX_WIDTH	(1ul << 12)

Please use a decimal number, I'm so slow at doing this in my head that I
use bash to calculate it for me, which really slows down parsing the code.

Noralf.

> +
> +/**
> + * DRM_SHADOW_PLANE_MAX_HEIGHT - Maximum height of a plane's shadow buffer in scanlines
> + *
> + * For drivers with shadow planes, the maximum height of the framebuffer is
> + * usually independent from hardware limitations. Drivers can initialize struct
> + * drm_mode_config.max_height from DRM_SHADOW_PLANE_MAX_HEIGHT.
> + */
> +#define DRM_SHADOW_PLANE_MAX_HEIGHT	(1ul << 12)
> +
>  /**
>   * struct drm_shadow_plane_state - plane state for planes with shadow buffers
>   *
> 
