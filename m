Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44C703ACC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 19:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9065810E249;
	Mon, 15 May 2023 17:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9486410E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kijHQtgxttKSzIe63Sc9ubU86PvOZObb1Y8eH8l4uL8=;
 b=PpeGelvP188K5le4qUEGfdhPvO3yuoJINwJQq7YwU35iPD2OZ2HP5inYrZlu1Ip4nK3uwMdCOcuRK
 HHF6eBV+up8OsVaWWfkceAGpRoUdWxtZZQLDkJOBSpPVGHOfUVs8Mq4yfGzFs3H+jtmAYdPDProQs6
 A8jTiSe+sXpvJvckRNGla1ooORRL1t0dObCWUx2b2AdurQZV0SNIfOXmx8MW7yNFgquGDm5wdGRf24
 UFCS7gc0c47vcS+QrXmqPjSphyVxTm4NnfSDMbOS+g037cjuKr57Vr1TYj2JrEDMwL7M6FrQt8vB8y
 SoqjjqyYr0XQYP5hAaqzUJGD1cB3oaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kijHQtgxttKSzIe63Sc9ubU86PvOZObb1Y8eH8l4uL8=;
 b=CEZapi9dJhYo7KuWSzbXL6YvLMoYg8ucSqleLN5Nl2lpxX058eR97ZyOBg1pcBWxDaD8vTJWBfFUb
 MgoQ75eAQ==
X-HalOne-ID: b606303c-f349-11ed-93aa-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id b606303c-f349-11ed-93aa-b90637070a9d;
 Mon, 15 May 2023 17:55:45 +0000 (UTC)
Date: Mon, 15 May 2023 19:55:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
Message-ID: <20230515175544.GB1745913@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515094033.2133-3-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, May 15, 2023 at 11:40:23AM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Armada does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v2:
> 	* use FB_IO_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/Kconfig        | 1 +
>  drivers/gpu/drm/armada/armada_fbdev.c | 9 ++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
> index f5c66d89ba99..5afade25e217 100644
> --- a/drivers/gpu/drm/armada/Kconfig
> +++ b/drivers/gpu/drm/armada/Kconfig
> @@ -3,6 +3,7 @@ config DRM_ARMADA
>  	tristate "DRM support for Marvell Armada SoCs"
>  	depends on DRM && HAVE_CLK && ARM && MMU
>  	select DRM_KMS_HELPER
> +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
>  	help
>  	  Support the "LCD" controllers found on the Marvell Armada 510
>  	  devices.  There are two controllers on the device, each controller
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index 0a5fd1aa86eb..6c3bbaf53569 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/errno.h>
> +#include <linux/fb.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  
> @@ -34,11 +35,9 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
>  static const struct fb_ops armada_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_read	= drm_fb_helper_cfb_read,
> -	.fb_write	= drm_fb_helper_cfb_write,
I had expected to see
.fb_read = fb_io_read,

But maybe this only used when using damage handling?

Likewise for drm_fb_helper_cfb_write.

??

> -	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
> -	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
> -	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
> +	.fb_fillrect	= cfb_fillrect,
> +	.fb_copyarea	= cfb_copyarea,
> +	.fb_imageblit	= cfb_imageblit,

This part is as expected.

	Sam

>  	.fb_destroy	= armada_fbdev_fb_destroy,
>  };
>  
> -- 
> 2.40.1
