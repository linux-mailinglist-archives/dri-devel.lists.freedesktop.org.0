Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1759E726E88
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1299710E548;
	Wed,  7 Jun 2023 20:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995EE10E548
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QP5DggRAkMsWzHr2Ezj3giodZW+XWKbFWz/uitrZ/GM=;
 b=CFJCPMV8DkYl0NfKiDYsXDM4+h0ssRKM63b//X1CKGSmCZ5wCxZgY86itJdIZDdylDYIMwLYSf6Z9
 5j7b04bP1D11uq3PnKnZ5LkRA8P+P7wu9rTZYcFbM483JX/tx+MDlzMmpqRYslo0new66RxjV6KB3x
 wL2kL9rtFLI+gr0aw5qUyWXKUgj77uOEKpTlydPH58G6NTFlQyIFzOHpUMxHp97XFh+5EQ6dB4HiFy
 EX4QHtZmvaGkFoosOKS3jeniI6asUsEhR9Uacyvu6k5/h8fN7d6kn4pd+SE0nhB2CA5Y5xgmbLB8oe
 1ShgWjb8t6X7kZi72Gm0icQpB8QX9nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QP5DggRAkMsWzHr2Ezj3giodZW+XWKbFWz/uitrZ/GM=;
 b=TtlDT3wuRSZ4OzGHBiWlvspLkENTW3F6U1FtKpLI/Ob1sE71L0vVMxI9FbGHRln3IA7VGu4w1tP1B
 5p+5ow/CA==
X-HalOne-ID: 05e381b2-0575-11ee-b726-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 05e381b2-0575-11ee-b726-13111ccb208d;
 Wed, 07 Jun 2023 20:51:09 +0000 (UTC)
Date: Wed, 7 Jun 2023 22:51:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 29/30] fbdev/core: Rework fb init code
Message-ID: <20230607205107.GF670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-30-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-30-tzimmermann@suse.de>
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

Hi Thomas.

On Mon, Jun 05, 2023 at 04:48:11PM +0200, Thomas Zimmermann wrote:
> Init the class "graphics" before the rest of fbdev. Later steps, such
> as the sysfs code, depend on the class. Also arrange the module's exit
> code in reverse order.
> 
> Unexport the global variable fb_class, which is only shared internally
> within the fbdev core module.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/core/fb_internal.h |  1 +
>  drivers/video/fbdev/core/fbcon.c       |  1 +
>  drivers/video/fbdev/core/fbmem.c       | 52 ++++++++++----------------
>  include/linux/fb.h                     |  1 -
>  4 files changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
> index abe06c9da36e..0b43c0cd5096 100644
> --- a/drivers/video/fbdev/core/fb_internal.h
> +++ b/drivers/video/fbdev/core/fb_internal.h
> @@ -11,6 +11,7 @@ int fb_register_chrdev(void);
>  void fb_unregister_chrdev(void);
>  
>  /* fbmem.c */
> +extern struct class *fb_class;
>  extern struct mutex registration_lock;
>  extern struct fb_info *registered_fb[FB_MAX];
>  extern int num_registered_fb;
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c6c9d040bdec..8e76bc246b38 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -78,6 +78,7 @@
>  #include <asm/irq.h>
>  
>  #include "fbcon.h"
> +#include "fb_internal.h"
>  
>  /*
>   * FIXME: Locking
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 2d26ac46337b..b21b66017c01 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -45,6 +45,8 @@
>  
>  #define FBPIXMAPSIZE	(1024 * 8)
>  
> +struct class *fb_class;
> +
>  DEFINE_MUTEX(registration_lock);
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
>  int num_registered_fb __read_mostly;
> @@ -897,9 +899,6 @@ fb_blank(struct fb_info *info, int blank)
>  }
>  EXPORT_SYMBOL(fb_blank);
>  
> -struct class *fb_class;
> -EXPORT_SYMBOL(fb_class);
> -
>  static int fb_check_foreignness(struct fb_info *fi)
>  {
>  	const bool foreign_endian = fi->flags & FBINFO_FOREIGN_ENDIAN;
> @@ -1106,59 +1105,48 @@ void fb_set_suspend(struct fb_info *info, int state)
>  }
>  EXPORT_SYMBOL(fb_set_suspend);
>  
> -/**
> - *	fbmem_init - init frame buffer subsystem
> - *
> - *	Initialize the frame buffer subsystem.
> - *
> - *	NOTE: This function is _only_ to be called by drivers/char/mem.c.
> - *
> - */
> -
> -static int __init
> -fbmem_init(void)
> +static int __init fbmem_init(void)
>  {
>  	int ret;
>  
> +	fb_class = class_create("graphics");
> +	if (IS_ERR(fb_class)) {
> +		ret = PTR_ERR(fb_class);
> +		pr_err("Unable to create fb class; errno = %d\n", ret);
> +		goto err_fb_class;
> +	}
> +
>  	ret = fb_init_procfs();
>  	if (ret)
> -		return ret;
> +		goto err_class_destroy;
>  
>  	ret = fb_register_chrdev();
>  	if (ret)
> -		goto err_chrdev;
> -
> -	fb_class = class_create("graphics");
> -	if (IS_ERR(fb_class)) {
> -		ret = PTR_ERR(fb_class);
> -		pr_warn("Unable to create fb class; errno = %d\n", ret);
> -		fb_class = NULL;
> -		goto err_class;
> -	}
> +		goto err_fb_cleanup_procfs;
>  
>  	fb_console_init();
>  
>  	return 0;
>  
> -err_class:
> -	fb_unregister_chrdev();
> -err_chrdev:
> +err_fb_cleanup_procfs:
>  	fb_cleanup_procfs();
> +err_class_destroy:
> +	class_destroy(fb_class);
> +err_fb_class:
> +	fb_class = NULL;
>  	return ret;
>  }
>  
>  #ifdef MODULE
> -module_init(fbmem_init);
> -static void __exit
> -fbmem_exit(void)
> +static void __exit fbmem_exit(void)
>  {
>  	fb_console_exit();
> -
> +	fb_unregister_chrdev();
>  	fb_cleanup_procfs();
>  	class_destroy(fb_class);
> -	fb_unregister_chrdev();
>  }
>  
> +module_init(fbmem_init);
>  module_exit(fbmem_exit);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Framebuffer base");
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 1988d11f78bc..541a0e3ce21f 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -609,7 +609,6 @@ extern int fb_new_modelist(struct fb_info *info);
>  
>  extern bool fb_center_logo;
>  extern int fb_logo_count;
> -extern struct class *fb_class;
>  
>  static inline void lock_fb_info(struct fb_info *info)
>  {
> -- 
> 2.40.1
