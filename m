Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B0726E25
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A690310E012;
	Wed,  7 Jun 2023 20:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32C10E012
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=X6b9aQHg42E6c9hox9QQJBpDR0hHLA0nBepyUDUTO2U=;
 b=IgxNUUoHVP8d6JbX+PoEGnmBOfuoE0p07zULXkBE/BlwNDA0KhSQGmnUrkO2zF1Zt6v4Wu6iW1t/d
 WMIrTWSVnG2Pu5xymng+bzPH8zd7yhPkeUW4RCt6+cbgoQ+CyD3FcqK9YSekURuNXWqg0asfmT96rq
 jWG0823hTrRJlpSXoTbWCP+nVNTVM1BBZaV41lwMfqXnGOIz1fx3i5mtb6cc40hvh8grKrRK+iIW3Z
 lLTdp26O+BgXyIhxKwr001sPXB4MqemZp8nD0D8IspR5yqfWBe+YAancOaZmVWia7T8gEbyJ3YDpi2
 3uLPUit+yOgvl9h+UxGp/vVvJdpq9hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=X6b9aQHg42E6c9hox9QQJBpDR0hHLA0nBepyUDUTO2U=;
 b=izuDTRPk2yXnXhVRScHyDr5E8dQF8UEtiz5yt88soiAicGL4zLBAY8ULSGWqTJPZYbsBXmx4HeVDD
 GSuhcbxDg==
X-HalOne-ID: 9eeb8f36-0574-11ee-8397-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 9eeb8f36-0574-11ee-8397-99461c6a3fe8;
 Wed, 07 Jun 2023 20:48:14 +0000 (UTC)
Date: Wed, 7 Jun 2023 22:48:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
Message-ID: <20230607204813.GE670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-29-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-29-tzimmermann@suse.de>
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

On Mon, Jun 05, 2023 at 04:48:10PM +0200, Thomas Zimmermann wrote:
> Move fbdev's file-I/O code into a separate file and contain it in
> init and cleanup helpers. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Consider moving the two helps as noted below.
With or without this move:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/video/fbdev/core/Makefile      |   1 +
>  drivers/video/fbdev/core/fb_devfs.c    | 484 +++++++++++++++++++++++++
>  drivers/video/fbdev/core/fb_internal.h |   6 +
>  drivers/video/fbdev/core/fbmem.c       | 478 +-----------------------
>  4 files changed, 497 insertions(+), 472 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_devfs.c
> 
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 665320160f70..125d24f50c36 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB)                  += fb.o
>  fb-y                              := fb_backlight.o \
> +                                     fb_devfs.o \
>                                       fb_info.o \
>                                       fb_procfs.o \
>                                       fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> diff --git a/drivers/video/fbdev/core/fb_devfs.c b/drivers/video/fbdev/core/fb_devfs.c
> new file mode 100644
> index 000000000000..5ab16cb24524
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_devfs.c
devfs gives me another understanding of what this file is used for.
fb_ioctl.c?

> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/console.h>
> +#include <linux/fb.h>
> +#include <linux/fbcon.h>
> +#include <linux/major.h>
> +
> +#include "fb_internal.h"
> +
> +/*
> + * We hold a reference to the fb_info in file->private_data,
> + * but if the current registered fb has changed, we don't
> + * actually want to use it.
> + *
> + * So look up the fb_info using the inode minor number,
> + * and just verify it against the reference we have.
> + */
> +static struct fb_info *file_fb_info(struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +	int fbidx = iminor(inode);
> +	struct fb_info *info = registered_fb[fbidx];
> +
> +	if (info != file->private_data)
> +		info = NULL;
> +	return info;
> +}
> +
> +static ssize_t fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +
> +	if (!info)
> +		return -ENODEV;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	if (info->fbops->fb_read)
> +		return info->fbops->fb_read(info, buf, count, ppos);
> +
> +	return fb_io_read(info, buf, count, ppos);
> +}
> +
> +static ssize_t fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +
> +	if (!info)
> +		return -ENODEV;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	if (info->fbops->fb_write)
> +		return info->fbops->fb_write(info, buf, count, ppos);
> +
> +	return fb_io_write(info, buf, count, ppos);
> +}
> +
> +static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> +			unsigned long arg)
> +{
> +	const struct fb_ops *fb;
> +	struct fb_var_screeninfo var;
> +	struct fb_fix_screeninfo fix;
> +	struct fb_cmap cmap_from;
> +	struct fb_cmap_user cmap;
> +	void __user *argp = (void __user *)arg;
> +	long ret = 0;
> +
> +	switch (cmd) {
> +	case FBIOGET_VSCREENINFO:
> +		lock_fb_info(info);
> +		var = info->var;
> +		unlock_fb_info(info);
> +
> +		ret = copy_to_user(argp, &var, sizeof(var)) ? -EFAULT : 0;
> +		break;
> +	case FBIOPUT_VSCREENINFO:
> +		if (copy_from_user(&var, argp, sizeof(var)))
> +			return -EFAULT;
> +		/* only for kernel-internal use */
> +		var.activate &= ~FB_ACTIVATE_KD_TEXT;
> +		console_lock();
> +		lock_fb_info(info);
> +		ret = fbcon_modechange_possible(info, &var);
> +		if (!ret)
> +			ret = fb_set_var(info, &var);
> +		if (!ret)
> +			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> +		unlock_fb_info(info);
> +		console_unlock();
> +		if (!ret && copy_to_user(argp, &var, sizeof(var)))
> +			ret = -EFAULT;
> +		break;
> +	case FBIOGET_FSCREENINFO:
> +		lock_fb_info(info);
> +		memcpy(&fix, &info->fix, sizeof(fix));
> +		if (info->flags & FBINFO_HIDE_SMEM_START)
> +			fix.smem_start = 0;
> +		unlock_fb_info(info);
> +
> +		ret = copy_to_user(argp, &fix, sizeof(fix)) ? -EFAULT : 0;
> +		break;
> +	case FBIOPUTCMAP:
> +		if (copy_from_user(&cmap, argp, sizeof(cmap)))
> +			return -EFAULT;
> +		ret = fb_set_user_cmap(&cmap, info);
> +		break;
> +	case FBIOGETCMAP:
> +		if (copy_from_user(&cmap, argp, sizeof(cmap)))
> +			return -EFAULT;
> +		lock_fb_info(info);
> +		cmap_from = info->cmap;
> +		unlock_fb_info(info);
> +		ret = fb_cmap_to_user(&cmap_from, &cmap);
> +		break;
> +	case FBIOPAN_DISPLAY:
> +		if (copy_from_user(&var, argp, sizeof(var)))
> +			return -EFAULT;
> +		console_lock();
> +		lock_fb_info(info);
> +		ret = fb_pan_display(info, &var);
> +		unlock_fb_info(info);
> +		console_unlock();
> +		if (ret == 0 && copy_to_user(argp, &var, sizeof(var)))
> +			return -EFAULT;
> +		break;
> +	case FBIO_CURSOR:
> +		ret = -EINVAL;
> +		break;
> +	case FBIOGET_CON2FBMAP:
> +		ret = fbcon_get_con2fb_map_ioctl(argp);
> +		break;
> +	case FBIOPUT_CON2FBMAP:
> +		ret = fbcon_set_con2fb_map_ioctl(argp);
> +		break;
> +	case FBIOBLANK:
> +		if (arg > FB_BLANK_POWERDOWN)
> +			return -EINVAL;
> +		console_lock();
> +		lock_fb_info(info);
> +		ret = fb_blank(info, arg);
> +		/* might again call into fb_blank */
> +		fbcon_fb_blanked(info, arg);
> +		unlock_fb_info(info);
> +		console_unlock();
> +		break;
> +	default:
> +		lock_fb_info(info);
> +		fb = info->fbops;
> +		if (fb->fb_ioctl)
> +			ret = fb->fb_ioctl(info, cmd, arg);
> +		else
> +			ret = -ENOTTY;
> +		unlock_fb_info(info);
> +	}
> +	return ret;
> +}
> +
> +static long fb_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +
> +	if (!info)
> +		return -ENODEV;
> +	return do_fb_ioctl(info, cmd, arg);
> +}
> +
> +#ifdef CONFIG_COMPAT
> +struct fb_fix_screeninfo32 {
> +	char			id[16];
> +	compat_caddr_t		smem_start;
> +	u32			smem_len;
> +	u32			type;
> +	u32			type_aux;
> +	u32			visual;
> +	u16			xpanstep;
> +	u16			ypanstep;
> +	u16			ywrapstep;
> +	u32			line_length;
> +	compat_caddr_t		mmio_start;
> +	u32			mmio_len;
> +	u32			accel;
> +	u16			reserved[3];
> +};
> +
> +struct fb_cmap32 {
> +	u32			start;
> +	u32			len;
> +	compat_caddr_t	red;
> +	compat_caddr_t	green;
> +	compat_caddr_t	blue;
> +	compat_caddr_t	transp;
> +};
> +
> +static int fb_getput_cmap(struct fb_info *info, unsigned int cmd,
> +			  unsigned long arg)
> +{
> +	struct fb_cmap32 cmap32;
> +	struct fb_cmap cmap_from;
> +	struct fb_cmap_user cmap;
> +
> +	if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
> +		return -EFAULT;
> +
> +	cmap = (struct fb_cmap_user) {
> +		.start	= cmap32.start,
> +		.len	= cmap32.len,
> +		.red	= compat_ptr(cmap32.red),
> +		.green	= compat_ptr(cmap32.green),
> +		.blue	= compat_ptr(cmap32.blue),
> +		.transp	= compat_ptr(cmap32.transp),
> +	};
> +
> +	if (cmd == FBIOPUTCMAP)
> +		return fb_set_user_cmap(&cmap, info);
> +
> +	lock_fb_info(info);
> +	cmap_from = info->cmap;
> +	unlock_fb_info(info);
> +
> +	return fb_cmap_to_user(&cmap_from, &cmap);
> +}
> +
> +static int do_fscreeninfo_to_user(struct fb_fix_screeninfo *fix,
> +				  struct fb_fix_screeninfo32 __user *fix32)
> +{
> +	__u32 data;
> +	int err;
> +
> +	err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));
> +
> +	data = (__u32) (unsigned long) fix->smem_start;
> +	err |= put_user(data, &fix32->smem_start);
> +
> +	err |= put_user(fix->smem_len, &fix32->smem_len);
> +	err |= put_user(fix->type, &fix32->type);
> +	err |= put_user(fix->type_aux, &fix32->type_aux);
> +	err |= put_user(fix->visual, &fix32->visual);
> +	err |= put_user(fix->xpanstep, &fix32->xpanstep);
> +	err |= put_user(fix->ypanstep, &fix32->ypanstep);
> +	err |= put_user(fix->ywrapstep, &fix32->ywrapstep);
> +	err |= put_user(fix->line_length, &fix32->line_length);
> +
> +	data = (__u32) (unsigned long) fix->mmio_start;
> +	err |= put_user(data, &fix32->mmio_start);
> +
> +	err |= put_user(fix->mmio_len, &fix32->mmio_len);
> +	err |= put_user(fix->accel, &fix32->accel);
> +	err |= copy_to_user(fix32->reserved, fix->reserved,
> +			    sizeof(fix->reserved));
> +
> +	if (err)
> +		return -EFAULT;
> +	return 0;
> +}
> +
> +static int fb_get_fscreeninfo(struct fb_info *info, unsigned int cmd,
> +			      unsigned long arg)
> +{
> +	struct fb_fix_screeninfo fix;
> +
> +	lock_fb_info(info);
> +	fix = info->fix;
> +	if (info->flags & FBINFO_HIDE_SMEM_START)
> +		fix.smem_start = 0;
> +	unlock_fb_info(info);
> +	return do_fscreeninfo_to_user(&fix, compat_ptr(arg));
> +}
> +
> +static long fb_compat_ioctl(struct file *file, unsigned int cmd,
> +			    unsigned long arg)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +	const struct fb_ops *fb;
> +	long ret = -ENOIOCTLCMD;
> +
> +	if (!info)
> +		return -ENODEV;
> +	fb = info->fbops;
> +	switch (cmd) {
> +	case FBIOGET_VSCREENINFO:
> +	case FBIOPUT_VSCREENINFO:
> +	case FBIOPAN_DISPLAY:
> +	case FBIOGET_CON2FBMAP:
> +	case FBIOPUT_CON2FBMAP:
> +		arg = (unsigned long) compat_ptr(arg);
> +		fallthrough;
> +	case FBIOBLANK:
> +		ret = do_fb_ioctl(info, cmd, arg);
> +		break;
> +
> +	case FBIOGET_FSCREENINFO:
> +		ret = fb_get_fscreeninfo(info, cmd, arg);
> +		break;
> +
> +	case FBIOGETCMAP:
> +	case FBIOPUTCMAP:
> +		ret = fb_getput_cmap(info, cmd, arg);
> +		break;
> +
> +	default:
> +		if (fb->fb_compat_ioctl)
> +			ret = fb->fb_compat_ioctl(info, cmd, arg);
> +		break;
> +	}
> +	return ret;
> +}
> +#endif
> +
> +static int fb_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +	unsigned long mmio_pgoff;
> +	unsigned long start;
> +	u32 len;
> +
> +	if (!info)
> +		return -ENODEV;
> +	mutex_lock(&info->mm_lock);
> +
> +	if (info->fbops->fb_mmap) {
> +		int res;
> +
> +		/*
> +		 * The framebuffer needs to be accessed decrypted, be sure
> +		 * SME protection is removed ahead of the call
> +		 */
> +		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +		res = info->fbops->fb_mmap(info, vma);
> +		mutex_unlock(&info->mm_lock);
> +		return res;
> +#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> +	} else if (info->fbdefio) {
> +		/*
> +		 * FB deferred I/O wants you to handle mmap in your drivers. At a
> +		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
> +		 */
> +		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
> +		mutex_unlock(&info->mm_lock);
> +		return -ENODEV;
> +#endif
> +	}
> +
> +	/*
> +	 * Ugh. This can be either the frame buffer mapping, or
> +	 * if pgoff points past it, the mmio mapping.
> +	 */
> +	start = info->fix.smem_start;
> +	len = info->fix.smem_len;
> +	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
> +	if (vma->vm_pgoff >= mmio_pgoff) {
> +		if (info->var.accel_flags) {
> +			mutex_unlock(&info->mm_lock);
> +			return -EINVAL;
> +		}
> +
> +		vma->vm_pgoff -= mmio_pgoff;
> +		start = info->fix.mmio_start;
> +		len = info->fix.mmio_len;
> +	}
> +	mutex_unlock(&info->mm_lock);
> +
> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +	fb_pgprotect(file, vma, start);
> +
> +	return vm_iomap_memory(vma, start, len);
> +}
> +
> +static int fb_open(struct inode *inode, struct file *file)
> +__acquires(&info->lock)
> +__releases(&info->lock)
> +{
> +	int fbidx = iminor(inode);
> +	struct fb_info *info;
> +	int res = 0;
> +
> +	info = get_fb_info(fbidx);
> +	if (!info) {
> +		request_module("fb%d", fbidx);
> +		info = get_fb_info(fbidx);
> +		if (!info)
> +			return -ENODEV;
> +	}
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
> +	lock_fb_info(info);
> +	if (!try_module_get(info->fbops->owner)) {
> +		res = -ENODEV;
> +		goto out;
> +	}
> +	file->private_data = info;
> +	if (info->fbops->fb_open) {
> +		res = info->fbops->fb_open(info, 1);
> +		if (res)
> +			module_put(info->fbops->owner);
> +	}
> +#ifdef CONFIG_FB_DEFERRED_IO
> +	if (info->fbdefio)
> +		fb_deferred_io_open(info, inode, file);
> +#endif
> +out:
> +	unlock_fb_info(info);
> +	if (res)
> +		put_fb_info(info);
> +	return res;
> +}
> +
> +static int fb_release(struct inode *inode, struct file *file)
> +__acquires(&info->lock)
> +__releases(&info->lock)
> +{
> +	struct fb_info * const info = file->private_data;
> +
> +	lock_fb_info(info);
> +#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> +	if (info->fbdefio)
> +		fb_deferred_io_release(info);
> +#endif
> +	if (info->fbops->fb_release)
> +		info->fbops->fb_release(info, 1);
> +	module_put(info->fbops->owner);
> +	unlock_fb_info(info);
> +	put_fb_info(info);
> +	return 0;
> +}
> +
> +#if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFIG_MMU)
> +static unsigned long get_fb_unmapped_area(struct file *filp,
> +				   unsigned long addr, unsigned long len,
> +				   unsigned long pgoff, unsigned long flags)
> +{
> +	struct fb_info * const info = filp->private_data;
> +	unsigned long fb_size = PAGE_ALIGN(info->fix.smem_len);
> +
> +	if (pgoff > fb_size || len > fb_size - pgoff)
> +		return -EINVAL;
> +
> +	return (unsigned long)info->screen_base + pgoff;
> +}
> +#endif
> +
> +static const struct file_operations fb_fops = {
> +	.owner = THIS_MODULE,
> +	.read = fb_read,
> +	.write = fb_write,
> +	.unlocked_ioctl = fb_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = fb_compat_ioctl,
> +#endif
> +	.mmap = fb_mmap,
> +	.open = fb_open,
> +	.release = fb_release,
> +#if defined(HAVE_ARCH_FB_UNMAPPED_AREA) || \
> +	(defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && \
> +	 !defined(CONFIG_MMU))
> +	.get_unmapped_area = get_fb_unmapped_area,
> +#endif
> +#ifdef CONFIG_FB_DEFERRED_IO
> +	.fsync = fb_deferred_io_fsync,
> +#endif
> +	.llseek = default_llseek,
> +};
> +
> +int fb_register_chrdev(void)
> +{
> +	int ret;
> +
> +	ret = register_chrdev(FB_MAJOR, "fb", &fb_fops);
> +	if (ret) {
> +		pr_err("Unable to get major %d for fb devs\n", FB_MAJOR);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +void fb_unregister_chrdev(void)
> +{
> +	unregister_chrdev(FB_MAJOR, "fb");
> +}
> diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
> index 51f7c9f04e45..abe06c9da36e 100644
> --- a/drivers/video/fbdev/core/fb_internal.h
> +++ b/drivers/video/fbdev/core/fb_internal.h
> @@ -6,10 +6,16 @@
>  #include <linux/fb.h>
>  #include <linux/mutex.h>
>  
> +/* fb_devfs.c */
> +int fb_register_chrdev(void);
> +void fb_unregister_chrdev(void);
> +
>  /* fbmem.c */
>  extern struct mutex registration_lock;
>  extern struct fb_info *registered_fb[FB_MAX];
>  extern int num_registered_fb;
> +struct fb_info *get_fb_info(unsigned int idx);
> +void put_fb_info(struct fb_info *fb_info);
The only users of get_fb_info() and put_fb_info() are now in fb_devfs.
So consider moving these two helpers too.

>  
>  /* fb_procfs.c */
>  int fb_init_procfs(void);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index de1e45240161..2d26ac46337b 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -17,7 +17,6 @@
>  #include <linux/types.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
> -#include <linux/major.h>
>  #include <linux/slab.h>
>  #include <linux/mm.h>
>  #include <linux/mman.h>
> @@ -54,7 +53,7 @@ bool fb_center_logo __read_mostly;
>  
>  int fb_logo_count __read_mostly = -1;
>  
> -static struct fb_info *get_fb_info(unsigned int idx)
> +struct fb_info *get_fb_info(unsigned int idx)
>  {
>  	struct fb_info *fb_info;
>  
> @@ -70,7 +69,7 @@ static struct fb_info *get_fb_info(unsigned int idx)
>  	return fb_info;
>  }
>  
> -static void put_fb_info(struct fb_info *fb_info)
> +void put_fb_info(struct fb_info *fb_info)
>  {
>  	if (!refcount_dec_and_test(&fb_info->count))
>  		return;
> @@ -699,59 +698,6 @@ int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
>  EXPORT_SYMBOL(fb_prepare_logo);
>  EXPORT_SYMBOL(fb_show_logo);

Reminds me - consider moving logo stuff to a fb_logo file.
This would reduce fbmem with a lot of lines, and it is separate.
But it is outside the goal of this patchset.

>  
> -/*
> - * We hold a reference to the fb_info in file->private_data,
> - * but if the current registered fb has changed, we don't
> - * actually want to use it.
> - *
> - * So look up the fb_info using the inode minor number,
> - * and just verify it against the reference we have.
> - */
> -static struct fb_info *file_fb_info(struct file *file)
> -{
> -	struct inode *inode = file_inode(file);
> -	int fbidx = iminor(inode);
> -	struct fb_info *info = registered_fb[fbidx];
> -
> -	if (info != file->private_data)
> -		info = NULL;
> -	return info;
> -}
> -
> -static ssize_t
> -fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> -{
> -	struct fb_info *info = file_fb_info(file);
> -
> -	if (!info)
> -		return -ENODEV;
> -
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
> -	if (info->fbops->fb_read)
> -		return info->fbops->fb_read(info, buf, count, ppos);
> -
> -	return fb_io_read(info, buf, count, ppos);
> -}
> -
> -static ssize_t
> -fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> -{
> -	struct fb_info *info = file_fb_info(file);
> -
> -	if (!info)
> -		return -ENODEV;
> -
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
> -	if (info->fbops->fb_write)
> -		return info->fbops->fb_write(info, buf, count, ppos);
> -
> -	return fb_io_write(info, buf, count, ppos);
> -}
> -
>  int
>  fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
>  {
> @@ -951,416 +897,6 @@ fb_blank(struct fb_info *info, int blank)
>  }
>  EXPORT_SYMBOL(fb_blank);
>  
> -static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> -			unsigned long arg)
> -{
> -	const struct fb_ops *fb;
> -	struct fb_var_screeninfo var;
> -	struct fb_fix_screeninfo fix;
> -	struct fb_cmap cmap_from;
> -	struct fb_cmap_user cmap;
> -	void __user *argp = (void __user *)arg;
> -	long ret = 0;
> -
> -	switch (cmd) {
> -	case FBIOGET_VSCREENINFO:
> -		lock_fb_info(info);
> -		var = info->var;
> -		unlock_fb_info(info);
> -
> -		ret = copy_to_user(argp, &var, sizeof(var)) ? -EFAULT : 0;
> -		break;
> -	case FBIOPUT_VSCREENINFO:
> -		if (copy_from_user(&var, argp, sizeof(var)))
> -			return -EFAULT;
> -		/* only for kernel-internal use */
> -		var.activate &= ~FB_ACTIVATE_KD_TEXT;
> -		console_lock();
> -		lock_fb_info(info);
> -		ret = fbcon_modechange_possible(info, &var);
> -		if (!ret)
> -			ret = fb_set_var(info, &var);
> -		if (!ret)
> -			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> -		unlock_fb_info(info);
> -		console_unlock();
> -		if (!ret && copy_to_user(argp, &var, sizeof(var)))
> -			ret = -EFAULT;
> -		break;
> -	case FBIOGET_FSCREENINFO:
> -		lock_fb_info(info);
> -		memcpy(&fix, &info->fix, sizeof(fix));
> -		if (info->flags & FBINFO_HIDE_SMEM_START)
> -			fix.smem_start = 0;
> -		unlock_fb_info(info);
> -
> -		ret = copy_to_user(argp, &fix, sizeof(fix)) ? -EFAULT : 0;
> -		break;
> -	case FBIOPUTCMAP:
> -		if (copy_from_user(&cmap, argp, sizeof(cmap)))
> -			return -EFAULT;
> -		ret = fb_set_user_cmap(&cmap, info);
> -		break;
> -	case FBIOGETCMAP:
> -		if (copy_from_user(&cmap, argp, sizeof(cmap)))
> -			return -EFAULT;
> -		lock_fb_info(info);
> -		cmap_from = info->cmap;
> -		unlock_fb_info(info);
> -		ret = fb_cmap_to_user(&cmap_from, &cmap);
> -		break;
> -	case FBIOPAN_DISPLAY:
> -		if (copy_from_user(&var, argp, sizeof(var)))
> -			return -EFAULT;
> -		console_lock();
> -		lock_fb_info(info);
> -		ret = fb_pan_display(info, &var);
> -		unlock_fb_info(info);
> -		console_unlock();
> -		if (ret == 0 && copy_to_user(argp, &var, sizeof(var)))
> -			return -EFAULT;
> -		break;
> -	case FBIO_CURSOR:
> -		ret = -EINVAL;
> -		break;
> -	case FBIOGET_CON2FBMAP:
> -		ret = fbcon_get_con2fb_map_ioctl(argp);
> -		break;
> -	case FBIOPUT_CON2FBMAP:
> -		ret = fbcon_set_con2fb_map_ioctl(argp);
> -		break;
> -	case FBIOBLANK:
> -		if (arg > FB_BLANK_POWERDOWN)
> -			return -EINVAL;
> -		console_lock();
> -		lock_fb_info(info);
> -		ret = fb_blank(info, arg);
> -		/* might again call into fb_blank */
> -		fbcon_fb_blanked(info, arg);
> -		unlock_fb_info(info);
> -		console_unlock();
> -		break;
> -	default:
> -		lock_fb_info(info);
> -		fb = info->fbops;
> -		if (fb->fb_ioctl)
> -			ret = fb->fb_ioctl(info, cmd, arg);
> -		else
> -			ret = -ENOTTY;
> -		unlock_fb_info(info);
> -	}
> -	return ret;
> -}
> -
> -static long fb_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> -{
> -	struct fb_info *info = file_fb_info(file);
> -
> -	if (!info)
> -		return -ENODEV;
> -	return do_fb_ioctl(info, cmd, arg);
> -}
> -
> -#ifdef CONFIG_COMPAT
> -struct fb_fix_screeninfo32 {
> -	char			id[16];
> -	compat_caddr_t		smem_start;
> -	u32			smem_len;
> -	u32			type;
> -	u32			type_aux;
> -	u32			visual;
> -	u16			xpanstep;
> -	u16			ypanstep;
> -	u16			ywrapstep;
> -	u32			line_length;
> -	compat_caddr_t		mmio_start;
> -	u32			mmio_len;
> -	u32			accel;
> -	u16			reserved[3];
> -};
> -
> -struct fb_cmap32 {
> -	u32			start;
> -	u32			len;
> -	compat_caddr_t	red;
> -	compat_caddr_t	green;
> -	compat_caddr_t	blue;
> -	compat_caddr_t	transp;
> -};
> -
> -static int fb_getput_cmap(struct fb_info *info, unsigned int cmd,
> -			  unsigned long arg)
> -{
> -	struct fb_cmap32 cmap32;
> -	struct fb_cmap cmap_from;
> -	struct fb_cmap_user cmap;
> -
> -	if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
> -		return -EFAULT;
> -
> -	cmap = (struct fb_cmap_user) {
> -		.start	= cmap32.start,
> -		.len	= cmap32.len,
> -		.red	= compat_ptr(cmap32.red),
> -		.green	= compat_ptr(cmap32.green),
> -		.blue	= compat_ptr(cmap32.blue),
> -		.transp	= compat_ptr(cmap32.transp),
> -	};
> -
> -	if (cmd == FBIOPUTCMAP)
> -		return fb_set_user_cmap(&cmap, info);
> -
> -	lock_fb_info(info);
> -	cmap_from = info->cmap;
> -	unlock_fb_info(info);
> -
> -	return fb_cmap_to_user(&cmap_from, &cmap);
> -}
> -
> -static int do_fscreeninfo_to_user(struct fb_fix_screeninfo *fix,
> -				  struct fb_fix_screeninfo32 __user *fix32)
> -{
> -	__u32 data;
> -	int err;
> -
> -	err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));
> -
> -	data = (__u32) (unsigned long) fix->smem_start;
> -	err |= put_user(data, &fix32->smem_start);
> -
> -	err |= put_user(fix->smem_len, &fix32->smem_len);
> -	err |= put_user(fix->type, &fix32->type);
> -	err |= put_user(fix->type_aux, &fix32->type_aux);
> -	err |= put_user(fix->visual, &fix32->visual);
> -	err |= put_user(fix->xpanstep, &fix32->xpanstep);
> -	err |= put_user(fix->ypanstep, &fix32->ypanstep);
> -	err |= put_user(fix->ywrapstep, &fix32->ywrapstep);
> -	err |= put_user(fix->line_length, &fix32->line_length);
> -
> -	data = (__u32) (unsigned long) fix->mmio_start;
> -	err |= put_user(data, &fix32->mmio_start);
> -
> -	err |= put_user(fix->mmio_len, &fix32->mmio_len);
> -	err |= put_user(fix->accel, &fix32->accel);
> -	err |= copy_to_user(fix32->reserved, fix->reserved,
> -			    sizeof(fix->reserved));
> -
> -	if (err)
> -		return -EFAULT;
> -	return 0;
> -}
> -
> -static int fb_get_fscreeninfo(struct fb_info *info, unsigned int cmd,
> -			      unsigned long arg)
> -{
> -	struct fb_fix_screeninfo fix;
> -
> -	lock_fb_info(info);
> -	fix = info->fix;
> -	if (info->flags & FBINFO_HIDE_SMEM_START)
> -		fix.smem_start = 0;
> -	unlock_fb_info(info);
> -	return do_fscreeninfo_to_user(&fix, compat_ptr(arg));
> -}
> -
> -static long fb_compat_ioctl(struct file *file, unsigned int cmd,
> -			    unsigned long arg)
> -{
> -	struct fb_info *info = file_fb_info(file);
> -	const struct fb_ops *fb;
> -	long ret = -ENOIOCTLCMD;
> -
> -	if (!info)
> -		return -ENODEV;
> -	fb = info->fbops;
> -	switch(cmd) {
> -	case FBIOGET_VSCREENINFO:
> -	case FBIOPUT_VSCREENINFO:
> -	case FBIOPAN_DISPLAY:
> -	case FBIOGET_CON2FBMAP:
> -	case FBIOPUT_CON2FBMAP:
> -		arg = (unsigned long) compat_ptr(arg);
> -		fallthrough;
> -	case FBIOBLANK:
> -		ret = do_fb_ioctl(info, cmd, arg);
> -		break;
> -
> -	case FBIOGET_FSCREENINFO:
> -		ret = fb_get_fscreeninfo(info, cmd, arg);
> -		break;
> -
> -	case FBIOGETCMAP:
> -	case FBIOPUTCMAP:
> -		ret = fb_getput_cmap(info, cmd, arg);
> -		break;
> -
> -	default:
> -		if (fb->fb_compat_ioctl)
> -			ret = fb->fb_compat_ioctl(info, cmd, arg);
> -		break;
> -	}
> -	return ret;
> -}
> -#endif
> -
> -static int
> -fb_mmap(struct file *file, struct vm_area_struct * vma)
> -{
> -	struct fb_info *info = file_fb_info(file);
> -	unsigned long mmio_pgoff;
> -	unsigned long start;
> -	u32 len;
> -
> -	if (!info)
> -		return -ENODEV;
> -	mutex_lock(&info->mm_lock);
> -
> -	if (info->fbops->fb_mmap) {
> -		int res;
> -
> -		/*
> -		 * The framebuffer needs to be accessed decrypted, be sure
> -		 * SME protection is removed ahead of the call
> -		 */
> -		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> -		res = info->fbops->fb_mmap(info, vma);
> -		mutex_unlock(&info->mm_lock);
> -		return res;
> -#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> -	} else if (info->fbdefio) {
> -		/*
> -		 * FB deferred I/O wants you to handle mmap in your drivers. At a
> -		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
> -		 */
> -		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
> -		mutex_unlock(&info->mm_lock);
> -		return -ENODEV;
> -#endif
> -	}
> -
> -	/*
> -	 * Ugh. This can be either the frame buffer mapping, or
> -	 * if pgoff points past it, the mmio mapping.
> -	 */
> -	start = info->fix.smem_start;
> -	len = info->fix.smem_len;
> -	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
> -	if (vma->vm_pgoff >= mmio_pgoff) {
> -		if (info->var.accel_flags) {
> -			mutex_unlock(&info->mm_lock);
> -			return -EINVAL;
> -		}
> -
> -		vma->vm_pgoff -= mmio_pgoff;
> -		start = info->fix.mmio_start;
> -		len = info->fix.mmio_len;
> -	}
> -	mutex_unlock(&info->mm_lock);
> -
> -	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	fb_pgprotect(file, vma, start);
> -
> -	return vm_iomap_memory(vma, start, len);
> -}
> -
> -static int
> -fb_open(struct inode *inode, struct file *file)
> -__acquires(&info->lock)
> -__releases(&info->lock)
> -{
> -	int fbidx = iminor(inode);
> -	struct fb_info *info;
> -	int res = 0;
> -
> -	info = get_fb_info(fbidx);
> -	if (!info) {
> -		request_module("fb%d", fbidx);
> -		info = get_fb_info(fbidx);
> -		if (!info)
> -			return -ENODEV;
> -	}
> -	if (IS_ERR(info))
> -		return PTR_ERR(info);
> -
> -	lock_fb_info(info);
> -	if (!try_module_get(info->fbops->owner)) {
> -		res = -ENODEV;
> -		goto out;
> -	}
> -	file->private_data = info;
> -	if (info->fbops->fb_open) {
> -		res = info->fbops->fb_open(info,1);
> -		if (res)
> -			module_put(info->fbops->owner);
> -	}
> -#ifdef CONFIG_FB_DEFERRED_IO
> -	if (info->fbdefio)
> -		fb_deferred_io_open(info, inode, file);
> -#endif
> -out:
> -	unlock_fb_info(info);
> -	if (res)
> -		put_fb_info(info);
> -	return res;
> -}
> -
> -static int
> -fb_release(struct inode *inode, struct file *file)
> -__acquires(&info->lock)
> -__releases(&info->lock)
> -{
> -	struct fb_info * const info = file->private_data;
> -
> -	lock_fb_info(info);
> -#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> -	if (info->fbdefio)
> -		fb_deferred_io_release(info);
> -#endif
> -	if (info->fbops->fb_release)
> -		info->fbops->fb_release(info,1);
> -	module_put(info->fbops->owner);
> -	unlock_fb_info(info);
> -	put_fb_info(info);
> -	return 0;
> -}
> -
> -#if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFIG_MMU)
> -static unsigned long get_fb_unmapped_area(struct file *filp,
> -				   unsigned long addr, unsigned long len,
> -				   unsigned long pgoff, unsigned long flags)
> -{
> -	struct fb_info * const info = filp->private_data;
> -	unsigned long fb_size = PAGE_ALIGN(info->fix.smem_len);
> -
> -	if (pgoff > fb_size || len > fb_size - pgoff)
> -		return -EINVAL;
> -
> -	return (unsigned long)info->screen_base + pgoff;
> -}
> -#endif
> -
> -static const struct file_operations fb_fops = {
> -	.owner =	THIS_MODULE,
> -	.read =		fb_read,
> -	.write =	fb_write,
> -	.unlocked_ioctl = fb_ioctl,
> -#ifdef CONFIG_COMPAT
> -	.compat_ioctl = fb_compat_ioctl,
> -#endif
> -	.mmap =		fb_mmap,
> -	.open =		fb_open,
> -	.release =	fb_release,
> -#if defined(HAVE_ARCH_FB_UNMAPPED_AREA) || \
> -	(defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && \
> -	 !defined(CONFIG_MMU))
> -	.get_unmapped_area = get_fb_unmapped_area,
> -#endif
> -#ifdef CONFIG_FB_DEFERRED_IO
> -	.fsync =	fb_deferred_io_fsync,
> -#endif
> -	.llseek =	default_llseek,
> -};
> -
>  struct class *fb_class;
>  EXPORT_SYMBOL(fb_class);
>  
> @@ -1588,11 +1124,9 @@ fbmem_init(void)
>  	if (ret)
>  		return ret;
>  
> -	ret = register_chrdev(FB_MAJOR, "fb", &fb_fops);
> -	if (ret) {
> -		printk("unable to get major %d for fb devs\n", FB_MAJOR);
> +	ret = fb_register_chrdev();
> +	if (ret)
>  		goto err_chrdev;
> -	}
>  
>  	fb_class = class_create("graphics");
>  	if (IS_ERR(fb_class)) {
> @@ -1607,7 +1141,7 @@ fbmem_init(void)
>  	return 0;
>  
>  err_class:
> -	unregister_chrdev(FB_MAJOR, "fb");
> +	fb_unregister_chrdev();
>  err_chrdev:
>  	fb_cleanup_procfs();
>  	return ret;
> @@ -1622,7 +1156,7 @@ fbmem_exit(void)
>  
>  	fb_cleanup_procfs();
>  	class_destroy(fb_class);
> -	unregister_chrdev(FB_MAJOR, "fb");
> +	fb_unregister_chrdev();
>  }
>  
>  module_exit(fbmem_exit);
> -- 
> 2.40.1
