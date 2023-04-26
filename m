Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2A6EF1DE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEE610E0D1;
	Wed, 26 Apr 2023 10:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C4BB10E0D1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:25:26 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:58796.1837125814
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id AF5AB1002A7;
 Wed, 26 Apr 2023 18:25:22 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id
 44cd4de9876f483fa7b516e653635508 for tzimmermann@suse.de; 
 Wed, 26 Apr 2023 18:25:24 CST
X-Transaction-ID: 44cd4de9876f483fa7b516e653635508
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <1f342c95-319b-f14f-f9aa-ed60976e214c@189.cn>
Date: Wed, 26 Apr 2023 18:25:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [5/6] fbdev: Move CFB read and write code into helper functions
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-6-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/4/25 22:28, Thomas Zimmermann wrote:
> Move the existing CFB read and write code for I/O memory into
> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> default fp_ops. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/core/Makefile      |   2 +-
>   drivers/video/fbdev/core/fb_cfb_fops.c | 126 +++++++++++++++++++++++++
>   drivers/video/fbdev/core/fbmem.c       | 113 +---------------------
>   include/linux/fb.h                     |  10 ++
>   4 files changed, 139 insertions(+), 112 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
>
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 08fabce76b74..cb7534a80305 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,7 +2,7 @@
>   obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>   obj-$(CONFIG_FB)                  += fb.o
>   fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> -                                     modedb.o fbcvt.o fb_cmdline.o
> +                                     modedb.o fbcvt.o fb_cmdline.o fb_cfb_fops.o
>   fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
>   
>   ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
> diff --git a/drivers/video/fbdev/core/fb_cfb_fops.c b/drivers/video/fbdev/core/fb_cfb_fops.c
> new file mode 100644
> index 000000000000..f6000166eda4
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_cfb_fops.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/fb.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *dst;
> +	u8 __iomem *src;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size;
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
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	src = (u8 __iomem *)(info->screen_base + p);
> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		dst = buffer;
> +		fb_memcpy_fromfb(dst, src, c);
> +		dst += c;
> +		src += c;
> +
> +		if (copy_to_user(buf, buffer, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
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
> +EXPORT_SYMBOL(fb_cfb_read);
> +
> +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *src;
> +	u8 __iomem *dst;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size;
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
> +	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	dst = (u8 __iomem *)(info->screen_base + p);
> +
> +	if (info->fbops->fb_sync)
> +		info->fbops->fb_sync(info);
> +
> +	while (count) {
> +		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +		src = buffer;
> +
> +		if (copy_from_user(src, buf, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		fb_memcpy_tofb(dst, src, c);
> +		dst += c;
> +		src += c;
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
> +EXPORT_SYMBOL(fb_cfb_write);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index b993bb97058f..be6c75f3dfd0 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -761,12 +761,7 @@ static struct fb_info *file_fb_info(struct file *file)
>   static ssize_t
>   fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   {
> -	unsigned long p = *ppos;
>   	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *dst;
> -	u8 __iomem *src;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size;
>   
>   	if (!info)
>   		return -ENODEV;
> @@ -777,64 +772,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_read)
>   		return info->fbops->fb_read(info, buf, count, ppos);
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
> -		if (copy_to_user(buf, buffer, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		*ppos += c;
> -		buf += c;
> -		cnt += c;
> -		count -= c;
> -	}
> -
> -	kfree(buffer);
> -
> -	return cnt ? cnt : err;
> +	return fb_cfb_read(info, buf, count, ppos);
>   }
>   
>   static ssize_t
>   fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   {
> -	unsigned long p = *ppos;
>   	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *src;
> -	u8 __iomem *dst;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size;
>   
>   	if (!info)
>   		return -ENODEV;
> @@ -845,60 +789,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_write)
>   		return info->fbops->fb_write(info, buf, count, ppos);
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
> -		if (copy_from_user(src, buf, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
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
> +	return fb_cfb_write(info, buf, count, ppos);
>   }
>   
>   int
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 08cb47da71f8..3b1644c79973 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -576,9 +576,19 @@ struct fb_info {
>   extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
>   extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
>   extern int fb_blank(struct fb_info *info, int blank);
> +
> +/*
> + * Drawing operations where framebuffer is in video RAM
> + */
> +
>   extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>   extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>   extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> +extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
> +			   loff_t *ppos);
> +extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> +			    size_t count, loff_t *ppos);
> +
>   /*
>    * Drawing operations where framebuffer is in system RAM
>    */
