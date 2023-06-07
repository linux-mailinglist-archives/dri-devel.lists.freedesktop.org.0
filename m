Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF02726C77
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4FB10E541;
	Wed,  7 Jun 2023 20:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CEA10E541
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ncnGoiPqkg7aXXCnLm3f8qp+53kbkQEpzVt1NSpcJHU=;
 b=olBwmGZQPNol3RziKI2JYVqficg8GD4aBJXxxev0l0+F0TIsIq/xOuNEH+ON7RvC7oRtACcL+6aUf
 m7gnvbIWsx1i/Kn1HKWoYwTVNvDk5FfxKrg1iBMn+fWSqOC2lnL22KQ9kEcWTAVwJDJEIJgNH6qxbY
 mjieEAxF93ISxwdEM1fMkCqq8vz4Z8ZvayGRjS0leegNQokXUgymPixTORC3+qSb1Yh6V1PoP/097A
 3EWVjSxpfCBS1Uhxjaw2XP1JAXqi7rtArVQPJjrbT4XdvrAHZWeVFOY+eQsHwpBs3ra2iPl5+esXtE
 gEEbTR0ZgHQPtp4ywMqIxXQ7y7nB+tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ncnGoiPqkg7aXXCnLm3f8qp+53kbkQEpzVt1NSpcJHU=;
 b=vBW9762Q35LRhOnP7iqPanbyreWOBxciZsFsgYPYv8yk5HW2LLR3Yk/4eK1BHqDhwsOtIofr1rIKp
 jgA0VW2CA==
X-HalOne-ID: 93e8a00c-0572-11ee-b707-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 93e8a00c-0572-11ee-b707-13111ccb208d;
 Wed, 07 Jun 2023 20:33:38 +0000 (UTC)
Date: Wed, 7 Jun 2023 22:33:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 27/30] fbdev/core: Move procfs code to separate file
Message-ID: <20230607203337.GD670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-28-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-28-tzimmermann@suse.de>
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

On Mon, Jun 05, 2023 at 04:48:09PM +0200, Thomas Zimmermann wrote:
> Move fbdev's procfs code into a separate file and contain it in
> init and cleanup helpers. No functional changes.
Maybe add:
Delete the unused for_each_registered_fb while touching the code.

The change to use proc_remove is not really documented.
But code looks ok.

I am not fan that we have introduced a few globals again.
But it looks like the way to go for now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
With an improved changelog:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/core/Makefile      |  1 +
>  drivers/video/fbdev/core/fb_internal.h | 12 ++++-
>  drivers/video/fbdev/core/fb_procfs.c   | 62 ++++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c       | 51 +++------------------
>  4 files changed, 80 insertions(+), 46 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_procfs.c
> 
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index eee3295bc225..665320160f70 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB)                  += fb.o
>  fb-y                              := fb_backlight.o \
>                                       fb_info.o \
> +                                     fb_procfs.o \
>                                       fbmem.o fbmon.o fbcmap.o fbsysfs.o \
>                                       modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
>  fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
> diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
> index 0b9640ae7a3d..51f7c9f04e45 100644
> --- a/drivers/video/fbdev/core/fb_internal.h
> +++ b/drivers/video/fbdev/core/fb_internal.h
> @@ -3,7 +3,17 @@
>  #ifndef _FB_INTERNAL_H
>  #define _FB_INTERNAL_H
>  
> -struct fb_info;
> +#include <linux/fb.h>
> +#include <linux/mutex.h>
> +
> +/* fbmem.c */
> +extern struct mutex registration_lock;
> +extern struct fb_info *registered_fb[FB_MAX];
> +extern int num_registered_fb;
> +
> +/* fb_procfs.c */
> +int fb_init_procfs(void);
> +void fb_cleanup_procfs(void);
>  
>  /* fbsysfs.c */
>  int fb_device_create(struct fb_info *fb_info);
> diff --git a/drivers/video/fbdev/core/fb_procfs.c b/drivers/video/fbdev/core/fb_procfs.c
> new file mode 100644
> index 000000000000..59641142f8aa
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_procfs.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/proc_fs.h>
> +
> +#include "fb_internal.h"
> +
> +static struct proc_dir_entry *fb_proc_dir_entry;
> +
> +static void *fb_seq_start(struct seq_file *m, loff_t *pos)
> +{
> +	mutex_lock(&registration_lock);
> +
> +	return (*pos < FB_MAX) ? pos : NULL;
> +}
> +
> +static void fb_seq_stop(struct seq_file *m, void *v)
> +{
> +	mutex_unlock(&registration_lock);
> +}
> +
> +static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
> +{
> +	(*pos)++;
> +
> +	return (*pos < FB_MAX) ? pos : NULL;
> +}
> +
> +static int fb_seq_show(struct seq_file *m, void *v)
> +{
> +	int i = *(loff_t *)v;
> +	struct fb_info *fi = registered_fb[i];
> +
> +	if (fi)
> +		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
> +
> +	return 0;
> +}
> +
> +static const struct seq_operations __maybe_unused fb_proc_seq_ops = {
> +	.start	= fb_seq_start,
> +	.stop	= fb_seq_stop,
> +	.next	= fb_seq_next,
> +	.show	= fb_seq_show,
> +};
> +
> +int fb_init_procfs(void)
> +{
> +	struct proc_dir_entry *proc;
> +
> +	proc = proc_create_seq("fb", 0, NULL, &fb_proc_seq_ops);
> +	if (!proc)
> +		return -ENOMEM;
> +
> +	fb_proc_dir_entry = proc;
> +
> +	return 0;
> +}
> +
> +void fb_cleanup_procfs(void)
> +{
> +	proc_remove(fb_proc_dir_entry);
> +}
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 66532774d351..de1e45240161 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -24,9 +24,7 @@
>  #include <linux/vt.h>
>  #include <linux/init.h>
>  #include <linux/linux_logo.h>
> -#include <linux/proc_fs.h>
>  #include <linux/platform_device.h>
> -#include <linux/seq_file.h>
>  #include <linux/console.h>
>  #include <linux/kmod.h>
>  #include <linux/err.h>
> @@ -48,13 +46,9 @@
>  
>  #define FBPIXMAPSIZE	(1024 * 8)
>  
> -static DEFINE_MUTEX(registration_lock);
> -
> +DEFINE_MUTEX(registration_lock);
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
>  int num_registered_fb __read_mostly;
> -#define for_each_registered_fb(i)		\
> -	for (i = 0; i < FB_MAX; i++)		\
> -		if (!registered_fb[i]) {} else
>  
>  bool fb_center_logo __read_mostly;
>  
> @@ -705,40 +699,6 @@ int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
>  EXPORT_SYMBOL(fb_prepare_logo);
>  EXPORT_SYMBOL(fb_show_logo);
>  
> -static void *fb_seq_start(struct seq_file *m, loff_t *pos)
> -{
> -	mutex_lock(&registration_lock);
> -	return (*pos < FB_MAX) ? pos : NULL;
> -}
> -
> -static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
> -{
> -	(*pos)++;
> -	return (*pos < FB_MAX) ? pos : NULL;
> -}
> -
> -static void fb_seq_stop(struct seq_file *m, void *v)
> -{
> -	mutex_unlock(&registration_lock);
> -}
> -
> -static int fb_seq_show(struct seq_file *m, void *v)
> -{
> -	int i = *(loff_t *)v;
> -	struct fb_info *fi = registered_fb[i];
> -
> -	if (fi)
> -		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
> -	return 0;
> -}
> -
> -static const struct seq_operations __maybe_unused proc_fb_seq_ops = {
> -	.start	= fb_seq_start,
> -	.next	= fb_seq_next,
> -	.stop	= fb_seq_stop,
> -	.show	= fb_seq_show,
> -};
> -
>  /*
>   * We hold a reference to the fb_info in file->private_data,
>   * but if the current registered fb has changed, we don't
> @@ -1624,8 +1584,9 @@ fbmem_init(void)
>  {
>  	int ret;
>  
> -	if (!proc_create_seq("fb", 0, NULL, &proc_fb_seq_ops))
> -		return -ENOMEM;
> +	ret = fb_init_procfs();
> +	if (ret)
> +		return ret;
>  
>  	ret = register_chrdev(FB_MAJOR, "fb", &fb_fops);
>  	if (ret) {
> @@ -1648,7 +1609,7 @@ fbmem_init(void)
>  err_class:
>  	unregister_chrdev(FB_MAJOR, "fb");
>  err_chrdev:
> -	remove_proc_entry("fb", NULL);
> +	fb_cleanup_procfs();
>  	return ret;
>  }
>  
> @@ -1659,7 +1620,7 @@ fbmem_exit(void)
>  {
>  	fb_console_exit();
>  
> -	remove_proc_entry("fb", NULL);
> +	fb_cleanup_procfs();
>  	class_destroy(fb_class);
>  	unregister_chrdev(FB_MAJOR, "fb");
>  }
> -- 
> 2.40.1
