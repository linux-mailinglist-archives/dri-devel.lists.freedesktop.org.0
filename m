Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC3726A0A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C41D10E1E7;
	Wed,  7 Jun 2023 19:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3A10E53D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 19:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oc0cfEt39md7Aocfs8+vtbuVQU+K7/gQFRFzLEMBHlU=;
 b=iu/FZimZIB0a11OViKGtQ6/zUw/NWaJe7CfV+nktbrliyc+LPJdJcrdXff/M1gwmE0OOQvL36TgJz
 Wr7U2VO3o4TPjMLX8b99wv1iwgUmzzzqAW8Bs8HMEhTgd20CFeMDvUi27q1lFcbEFZFXc2mAsqr7wG
 8zyYbpaLuj338sD/XewPRRhtO1sL3c7GhYU4he2h8uk6vyWEEUnsDn4TrCGwAF4Ja8ZgvAqLHSH95k
 FfpE3Cc6o8Uo729gV6VdxfOgO+EJmzFPc6QesDGmOvvho0UtbSXIx7tRP1ge/zwMCSwbJUSotICV2x
 Bbq3y2VfI4CXG6wGWhMeCT8Kzq/1s8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oc0cfEt39md7Aocfs8+vtbuVQU+K7/gQFRFzLEMBHlU=;
 b=hWY7LRNXo+k2vy50nSyKVfZANQmsG2gVYlsj5013SMubSDjdxtjdw4c2zNrH82ZjUvXvnQx8weHNx
 KoGrkVjCw==
X-HalOne-ID: e53760db-056b-11ee-8b12-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id e53760db-056b-11ee-8b12-6f01c1d0a443;
 Wed, 07 Jun 2023 19:45:49 +0000 (UTC)
Date: Wed, 7 Jun 2023 21:45:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 26/30] fbdev/core: Add fb_device_{create,destroy}()
Message-ID: <20230607194547.GC670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-27-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-27-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jun 05, 2023 at 04:48:08PM +0200, Thomas Zimmermann wrote:
> Move the logic to create and destroy fbdev devices into the new
> helpers fb_device_create() and fb_device_destroy().
> 
> There was a call to fb_cleanup_device() in do_unregister_framebuffer()
> that was too late. The device had already been removed at this point.
> Move the call into fb_device_destroy().
> 
> Declare the helpers in the new internal header file  fb_internal.h, as
s/  / /
> they are only used within the fbdev core module.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fb_internal.h | 12 ++++++++
>  drivers/video/fbdev/core/fbmem.c       | 21 +++-----------
>  drivers/video/fbdev/core/fbsysfs.c     | 38 ++++++++++++++++++++++++--
>  include/linux/fb.h                     |  3 --
>  4 files changed, 52 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_internal.h
> 
> diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
> new file mode 100644
> index 000000000000..0b9640ae7a3d
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_internal.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _FB_INTERNAL_H
> +#define _FB_INTERNAL_H
> +
> +struct fb_info;
> +
> +/* fbsysfs.c */
> +int fb_device_create(struct fb_info *fb_info);
> +void fb_device_destroy(struct fb_info *fb_info);
> +
> +#endif
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index f91ae7d4c94d..66532774d351 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -40,6 +40,8 @@
>  #include <video/nomodeset.h>
>  #include <video/vga.h>
>  
> +#include "fb_internal.h"
> +
>      /*
>       *  Frame buffer device initialization and setup routines
>       */
> @@ -1447,14 +1449,7 @@ static int do_register_framebuffer(struct fb_info *fb_info)
>  	mutex_init(&fb_info->lock);
>  	mutex_init(&fb_info->mm_lock);
>  
> -	fb_info->dev = device_create(fb_class, fb_info->device,
> -				     MKDEV(FB_MAJOR, i), NULL, "fb%d", i);
> -	if (IS_ERR(fb_info->dev)) {
> -		/* Not fatal */
> -		printk(KERN_WARNING "Unable to create device for framebuffer %d; errno = %ld\n", i, PTR_ERR(fb_info->dev));
> -		fb_info->dev = NULL;
> -	} else
> -		fb_init_device(fb_info);
> +	fb_device_create(fb_info);
The return result is ignored here.
If we do not need it in later patches then drop the return result.

>  
>  	if (fb_info->pixmap.addr == NULL) {
>  		fb_info->pixmap.addr = kmalloc(FBPIXMAPSIZE, GFP_KERNEL);
> @@ -1515,16 +1510,9 @@ static void unlink_framebuffer(struct fb_info *fb_info)
>  	if (WARN_ON(i < 0 || i >= FB_MAX || registered_fb[i] != fb_info))
>  		return;
>  
> -	if (!fb_info->dev)
> -		return;
> -
> -	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
> -
> +	fb_device_destroy(fb_info);
>  	pm_vt_switch_unregister(fb_info->device);
> -
>  	unbind_console(fb_info);
> -
> -	fb_info->dev = NULL;
>  }
>  
>  static void do_unregister_framebuffer(struct fb_info *fb_info)
> @@ -1539,7 +1527,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
>  	fb_destroy_modelist(&fb_info->modelist);
>  	registered_fb[fb_info->node] = NULL;
>  	num_registered_fb--;
> -	fb_cleanup_device(fb_info);
>  #ifdef CONFIG_GUMSTIX_AM200EPD
>  	{
>  		struct fb_event event;
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
> index 849073f1ca06..fafe574398b0 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -8,6 +8,9 @@
>  #include <linux/console.h>
>  #include <linux/fb.h>
>  #include <linux/fbcon.h>
> +#include <linux/major.h>
> +
> +#include "fb_internal.h"
>  
>  #define FB_SYSFS_FLAG_ATTR 1
>  
> @@ -435,7 +438,7 @@ static struct device_attribute device_attrs[] = {
>  #endif
>  };
>  
> -int fb_init_device(struct fb_info *fb_info)
> +static int fb_init_device(struct fb_info *fb_info)
>  {
>  	int i, error = 0;
>  
> @@ -459,7 +462,7 @@ int fb_init_device(struct fb_info *fb_info)
>  	return 0;
>  }
>  
> -void fb_cleanup_device(struct fb_info *fb_info)
> +static void fb_cleanup_device(struct fb_info *fb_info)
>  {
>  	unsigned int i;
>  
> @@ -470,3 +473,34 @@ void fb_cleanup_device(struct fb_info *fb_info)
>  		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
>  	}
>  }
> +
> +int fb_device_create(struct fb_info *fb_info)
> +{
> +	int node = fb_info->node;
> +	dev_t devt = MKDEV(FB_MAJOR, node);
> +	int ret;
> +
> +	fb_info->dev = device_create(fb_class, fb_info->device, devt, NULL, "fb%d", node);
> +	if (IS_ERR(fb_info->dev)) {
> +		/* Not fatal */
> +		ret = PTR_ERR(fb_info->dev);
This error code is lost as we always return 0.
> +		pr_warn("Unable to create device for framebuffer %d; error %d\n", node, ret);
> +		fb_info->dev = NULL;
> +	} else {
> +		fb_init_device(fb_info);
> +	}
> +
> +	return 0;
> +}
> +
> +void fb_device_destroy(struct fb_info *fb_info)
> +{
> +	dev_t devt = MKDEV(FB_MAJOR, fb_info->node);
> +
> +	if (!fb_info->dev)
> +		return;
> +
> +	fb_cleanup_device(fb_info);
> +	device_destroy(fb_class, devt);
> +	fb_info->dev = NULL;
> +}
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index ce6823e157e6..1988d11f78bc 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -735,11 +735,8 @@ static inline bool fb_be_math(struct fb_info *info)
>  #endif /* CONFIG_FB_FOREIGN_ENDIAN */
>  }
>  
> -/* drivers/video/fbsysfs.c */
>  extern struct fb_info *framebuffer_alloc(size_t size, struct device *dev);
>  extern void framebuffer_release(struct fb_info *info);
> -extern int fb_init_device(struct fb_info *fb_info);
> -extern void fb_cleanup_device(struct fb_info *head);
>  extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max);
>  
>  /* drivers/video/fbmon.c */
> -- 
> 2.40.1
