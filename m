Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DD6F2A30
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 20:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5777010E07F;
	Sun, 30 Apr 2023 18:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AEF10E07F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3bP98+/T/VWavd6NhadLCYQfXGcQO58cktoQlTxuIwE=;
 b=Z95VCIHYyr8ZcDytHivp/WD56Hc/tKzKSiycR+y0a2hSgcRbCfVxSRs3F/5XYOW7lIyc/kE8h8TWx
 IgqQlBNvz6cgv4PgMo6c8zDiZV0bLpm8m6kGlXjZMnuf9ZIZaeX3ZeRQs0+3j0WccGdzf2PP2YIkfO
 5SLlt+e0fYOEi/9vsGfh4Mt0j0aufGztLDz47s7ffHlaGYTgB0uhQYqcAQC35GMLy3MhOmQ4+rf1OA
 GBBeZfBoPqoEVRwaMcmA0QB7xX/gNmV7IHtmxZ8RlXmxskd+3yeP5iGTWueh8P2vobdMCDkzU1dgv8
 8Wy6N16ro1sTBXRNrY9ECw3969ni65g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3bP98+/T/VWavd6NhadLCYQfXGcQO58cktoQlTxuIwE=;
 b=JM++HrY8l1cpYzxcbCuRaHjuiytW9QFGkbwaRGAuor2HBdhXN/6B6oK19ljsb65gnw+0TxtpyDuLm
 Ny5BGSzAw==
X-HalOne-ID: cf39b0a6-e782-11ed-ba40-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id cf39b0a6-e782-11ed-ba40-b90637070a9d;
 Sun, 30 Apr 2023 18:14:14 +0000 (UTC)
Date: Sun, 30 Apr 2023 20:14:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 18/19] fbdev: Move I/O read and write code into helper
 functions
Message-ID: <20230430181412.GA96757@ravnborg.org>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428122452.4856-19-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Apr 28, 2023 at 02:24:51PM +0200, Thomas Zimmermann wrote:
> Move the existing I/O read and write code for I/O memory into
> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
You may want to update the changelog to mention the new names.

A few comments below, but reading it once more I realize this are
all comments to the original code, so not something to fix in this
patch.


> default fp_ops. No functional changes.
> 
> In the near term, the new functions will be useful to the DRM
> subsystem, which currently provides it's own implementation. It
> can then use the shared code. In the longer term, it might make
> sense to revise the I/O helper's default status and make them
> opt-in by the driver. Systems that don't use them would not
> contain the code any longer.
> 
> v2:
> 	* add detailed commit message (Javier)
> 	* rename fb_cfb_() to fb_io_() (Geert)
> 	* add fixes that got lost while moving the code (Geert)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/core/Makefile     |   2 +-
>  drivers/video/fbdev/core/fb_io_fops.c | 133 ++++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c      | 118 +----------------------
>  include/linux/fb.h                    |  10 ++
>  4 files changed, 146 insertions(+), 117 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_io_fops.c
> 
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 08fabce76b74..8f0060160ffb 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,7 +2,7 @@
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB)                  += fb.o
>  fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> -                                     modedb.o fbcvt.o fb_cmdline.o
> +                                     modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
>  fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
>  
>  ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
> diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
> new file mode 100644
> index 000000000000..f5299d50f33b
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_io_fops.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/fb.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +ssize_t fb_io_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *dst;
> +	u8 __iomem *src;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size, trailing;
> +
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p >= total_size)
> +		return 0;
> +
> +	if (count >= total_size)
> +		count = total_size;
> +
> +	if (count + p > total_size)
> +		count = total_size - p;
> +
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> +			 GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	src = (u8 __iomem *) (info->screen_base + p);
screen_base is char __iomem *, so I think the cast can go away.
> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		dst = buffer;
> +		fb_memcpy_fromfb(dst, src, c);
> +		dst += c;
I see no reason to use dst here, as it is always equal to buffer when
used.
But this is copied from the original code, so it would be wrong to
change this in the current patch. I just noticed.

> +		src += c;
> +
> +		trailing = copy_to_user(buf, buffer, c);
> +		if (trailing == c) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		c -= trailing;
> +
> +		*ppos += c;
> +		buf += c;
> +		cnt += c;
> +		count -= c;
> +	}
> +
> +	kfree(buffer);
> +
> +	return cnt ? cnt : err;
> +}
> +EXPORT_SYMBOL(fb_io_read);
> +
> +ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *src;
> +	u8 __iomem *dst;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size, trailing;
> +
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p > total_size)
> +		return -EFBIG;
> +
> +	if (count > total_size) {
> +		err = -EFBIG;
> +		count = total_size;
> +	}
> +
> +	if (count + p > total_size) {
> +		if (!err)
> +			err = -ENOSPC;
> +
> +		count = total_size - p;
> +	}
> +
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> +			 GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	dst = (u8 __iomem *) (info->screen_base + p);
Cast can go away.

> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		src = buffer;
> +
> +		trailing = copy_from_user(src, buf, c);
> +		if (trailing == c) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		c -= trailing;
> +
> +		fb_memcpy_tofb(dst, src, c);
> +		dst += c;
> +		src += c;
src is incremented here, but the value are not used.
Again, from the original code so not something to change here.

> +		*ppos += c;
> +		buf += c;
> +		cnt += c;
> +		count -= c;
> +	}
> +
> +	kfree(buffer);
> +
> +	return (cnt) ? cnt : err;
> +}
> +EXPORT_SYMBOL(fb_io_write);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 3a80d13afd26..4035a57df116 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -761,12 +761,7 @@ static struct fb_info *file_fb_info(struct file *file)
>  static ssize_t
>  fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  {
> -	unsigned long p = *ppos;
>  	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *dst;
> -	u8 __iomem *src;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size, trailing;
>  
>  	if (!info)
>  		return -ENODEV;
> @@ -777,67 +772,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  	if (info->fbops->fb_read)
>  		return info->fbops->fb_read(info, buf, count, ppos);
>  
> -	if (!info->screen_base)
> -		return -ENODEV;
> -
> -	total_size = info->screen_size;
> -
> -	if (total_size == 0)
> -		total_size = info->fix.smem_len;
> -
> -	if (p >= total_size)
> -		return 0;
> -
> -	if (count >= total_size)
> -		count = total_size;
> -
> -	if (count + p > total_size)
> -		count = total_size - p;
> -
> -	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> -			 GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	src = (u8 __iomem *) (info->screen_base + p);
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	while (count) {
> -		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> -		dst = buffer;
> -		fb_memcpy_fromfb(dst, src, c);
> -		dst += c;
> -		src += c;
> -
> -		trailing = copy_to_user(buf, buffer, c);
> -		if (trailing == c) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		c -= trailing;
> -
> -		*ppos += c;
> -		buf += c;
> -		cnt += c;
> -		count -= c;
> -	}
> -
> -	kfree(buffer);
> -
> -	return cnt ? cnt : err;
> +	return fb_io_read(info, buf, count, ppos);
>  }
>  
>  static ssize_t
>  fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  {
> -	unsigned long p = *ppos;
>  	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *src;
> -	u8 __iomem *dst;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size, trailing;
>  
>  	if (!info)
>  		return -ENODEV;
> @@ -848,62 +789,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  	if (info->fbops->fb_write)
>  		return info->fbops->fb_write(info, buf, count, ppos);
>  
> -	if (!info->screen_base)
> -		return -ENODEV;
> -
> -	total_size = info->screen_size;
> -
> -	if (total_size == 0)
> -		total_size = info->fix.smem_len;
> -
> -	if (p > total_size)
> -		return -EFBIG;
> -
> -	if (count > total_size) {
> -		err = -EFBIG;
> -		count = total_size;
> -	}
> -
> -	if (count + p > total_size) {
> -		if (!err)
> -			err = -ENOSPC;
> -
> -		count = total_size - p;
> -	}
> -
> -	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
> -			 GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	dst = (u8 __iomem *) (info->screen_base + p);
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	while (count) {
> -		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> -		src = buffer;
> -
> -		trailing = copy_from_user(src, buf, c);
> -		if (trailing == c) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		c -= trailing;
> -
> -		fb_memcpy_tofb(dst, src, c);
> -		dst += c;
> -		src += c;
> -		*ppos += c;
> -		buf += c;
> -		cnt += c;
> -		count -= c;
> -	}
> -
> -	kfree(buffer);
> -
> -	return (cnt) ? cnt : err;
> +	return fb_io_write(info, buf, count, ppos);
>  }
>  
>  int
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 08cb47da71f8..ec978a4969a9 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -576,9 +576,19 @@ struct fb_info {
>  extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
>  extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
>  extern int fb_blank(struct fb_info *info, int blank);
> +
> +/*
> + * Drawing operations where framebuffer is in I/O memory
> + */
> +
>  extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>  extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>  extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> +extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
> +			  size_t count, loff_t *ppos);
> +extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
> +			   size_t count, loff_t *ppos);
> +
>  /*
>   * Drawing operations where framebuffer is in system RAM
>   */
> -- 
> 2.40.0
