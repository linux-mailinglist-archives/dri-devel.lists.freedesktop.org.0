Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3F72B2E0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 18:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3533110E08B;
	Sun, 11 Jun 2023 16:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AB010E08B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=1Ohyt1AlJn0Mp2/mDQGGAD9NP5MHu4FOQ0UuwC+3UBc=;
 b=G4V10oNnxckq/1jCAnMQxEb1BT7kvT96mb2s+7CaklcxIPHDMinZ/r2iqrxz3PS6R5bwI1cNikOG+
 mb8FtOBvf+jRqKHFb+woLX/JR/UUo/F0V9ciYJXFt964a7n0m6nqxnPK8rnr7Gvg9fB9IETo4kzG3h
 azHld3l+pAS4Y3ghpv9upOLcGzZvfke4pwYmBWwM7xQIsBufgwRE7ClZ8l3NMU+Bxs7sw2wWK6mpcB
 540+DM5eE/kP5qaNsHp24GF8cEQIyZRPjoRG5R3TY2isM2LWWC1LkEOStAoVk/lxpTexz7aXNkLkp/
 0utpzxZTpjzh/tiLoPzKOXCFRo1Oydg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=1Ohyt1AlJn0Mp2/mDQGGAD9NP5MHu4FOQ0UuwC+3UBc=;
 b=qugGThFyRP8Sfv/kfH5cK/XAmQSBcp5TWEMF/jte+aGQCWEZp35/a86b+uQB7GR8S2Ir0jT5FNPwv
 vDxRIuaAQ==
X-HalOne-ID: 39927900-0876-11ee-827c-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 39927900-0876-11ee-827c-b90637070a9d;
 Sun, 11 Jun 2023 16:37:17 +0000 (UTC)
Date: Sun, 11 Jun 2023 18:37:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Message-ID: <20230611163716.GA1139759@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>
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

On Mon, Jun 05, 2023 at 04:48:12PM +0200, Thomas Zimmermann wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create a files in devfs or sysfs.
s/ a//
> 
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
> 
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It
> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.
> 
> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
Should that be a TODO in gpu/todo.rst?
Otherwise the amount of people knowing about this
is very close to 1.
As an alternative add a TODO to each Kconfig file.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/staging/fbtft/Kconfig            |  1 +
>  drivers/video/fbdev/Kconfig              | 12 +++++++++
>  drivers/video/fbdev/core/Makefile        |  7 +++---
>  drivers/video/fbdev/core/fb_internal.h   | 32 ++++++++++++++++++++++++
>  drivers/video/fbdev/omap2/omapfb/Kconfig |  2 +-
>  include/linux/fb.h                       |  2 ++
>  6 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index 4d29e8c1014e..5dda3c65a38e 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,6 +2,7 @@
>  menuconfig FB_TFT
>  	tristate "Support for small TFT LCD display modules"
>  	depends on FB && SPI
> +	depends on FB_DEVICE
>  	depends on GPIOLIB || COMPILE_TEST
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 6df9bd09454a..48d9a14f889c 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>  	  combination with certain motherboards and monitors are known to
>  	  suffer from this problem.
>  
> +config FB_DEVICE
> +        bool "Provide legacy /dev/fb* device"
> +        depends on FB
> +        help
> +	  Say Y here if you want the legacy /dev/fb* device file. It's
> +	  only required if you have userspace programs that depend on
> +	  fbdev for graphics output. This does not effect the framebuffer
> +	  console.
tabs to spaces to indent the above correct.

> +
>  config FB_DDC
>  	tristate
>  	depends on FB
> @@ -1545,6 +1554,7 @@ config FB_3DFX_I2C
>  config FB_VOODOO1
>  	tristate "3Dfx Voodoo Graphics (sst1) support"
>  	depends on FB && PCI
> +	depends on FB_DEVICE
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> @@ -1862,6 +1872,7 @@ config FB_SH_MOBILE_LCDC
>  	tristate "SuperH Mobile LCDC framebuffer support"
>  	depends on FB && HAVE_CLK && HAS_IOMEM
>  	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +	depends on FB_DEVICE
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
>  	select FB_SYS_IMAGEBLIT
> @@ -1930,6 +1941,7 @@ config FB_SMSCUFX
>  config FB_UDL
>  	tristate "Displaylink USB Framebuffer support"
>  	depends on FB && USB
> +	depends on FB_DEVICE
>  	select FB_MODE_HELPERS
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 125d24f50c36..d5e8772620f8 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,12 +2,13 @@
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB)                  += fb.o
>  fb-y                              := fb_backlight.o \
> -                                     fb_devfs.o \
>                                       fb_info.o \
> -                                     fb_procfs.o \
> -                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> +                                     fbmem.o fbmon.o fbcmap.o \
>                                       modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
>  fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
> +fb-$(CONFIG_FB_DEVICE)            += fb_devfs.o \
> +                                     fb_procfs.o \
> +                                     fbsysfs.o
Maybe change this to one line to avoid '\'?

>  
>  ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
>  fb-y				  += fbcon.o bitblit.o softcursor.o
> diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
> index 0b43c0cd5096..b8a28466db79 100644
> --- a/drivers/video/fbdev/core/fb_internal.h
> +++ b/drivers/video/fbdev/core/fb_internal.h
> @@ -3,12 +3,22 @@
>  #ifndef _FB_INTERNAL_H
>  #define _FB_INTERNAL_H
>  
> +#include <linux/device.h>
>  #include <linux/fb.h>
>  #include <linux/mutex.h>
>  
>  /* fb_devfs.c */
> +#if defined(CONFIG_FB_DEVICE)
>  int fb_register_chrdev(void);
>  void fb_unregister_chrdev(void);
> +#else
> +static inline int fb_register_chrdev(void)
> +{
> +	return 0;
> +}
> +static inline void fb_unregister_chrdev(void)
> +{ }
> +#endif
>  
>  /* fbmem.c */
>  extern struct class *fb_class;
> @@ -19,11 +29,33 @@ struct fb_info *get_fb_info(unsigned int idx);
>  void put_fb_info(struct fb_info *fb_info);
>  
>  /* fb_procfs.c */
> +#if defined(CONFIG_FB_DEVICE)
>  int fb_init_procfs(void);
>  void fb_cleanup_procfs(void);
> +#else
> +static inline int fb_init_procfs(void)
> +{
> +	return 0;
> +}
> +static inline void fb_cleanup_procfs(void)
> +{ }
> +#endif
>  
>  /* fbsysfs.c */
> +#if defined(CONFIG_FB_DEVICE)
>  int fb_device_create(struct fb_info *fb_info);
>  void fb_device_destroy(struct fb_info *fb_info);
> +#else
> +static inline int fb_device_create(struct fb_info *fb_info)
> +{
> +	get_device(fb_info->device); // as in device_add()
> +
> +	return 0;
> +}
> +static inline void fb_device_destroy(struct fb_info *fb_info)
> +{
> +	put_device(fb_info->device); // as in device_del()
> +}
> +#endif
I do not see why fb_device_{create,destroy} needs to call
{get,put}_device - and it is not explained.
A short explanation in the commit maybe?

With my comments addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Note: I do not engage in the thread about the best Kconfig
solution - I trust the involved people will find a good solution.

	Sam

>  
>  #endif
> diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
> index 69f9cb03507e..21069fdb7cc2 100644
> --- a/drivers/video/fbdev/omap2/omapfb/Kconfig
> +++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
> @@ -5,9 +5,9 @@ config OMAP2_VRFB
>  menuconfig FB_OMAP2
>  	tristate "OMAP2+ frame buffer support"
>  	depends on FB
> +	depends on FB_DEVICE
>  	depends on DRM_OMAP = n
>  	depends on GPIOLIB
> -
>  	select FB_OMAP2_DSS
>  	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
>  	select FB_CFB_FILLRECT
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 541a0e3ce21f..40ed1028160c 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -481,7 +481,9 @@ struct fb_info {
>  
>  	const struct fb_ops *fbops;
>  	struct device *device;		/* This is the parent */
> +#if defined(CONFIG_FB_DEVICE)
>  	struct device *dev;		/* This is this fb device */
> +#endif
>  	int class_flag;                    /* private sysfs flags */
>  #ifdef CONFIG_FB_TILEBLITTING
>  	struct fb_tile_ops *tileops;    /* Tile Blitting */
> -- 
> 2.40.1
