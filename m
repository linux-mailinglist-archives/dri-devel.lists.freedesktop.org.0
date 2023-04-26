Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1456EF1E4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97BE10E8BC;
	Wed, 26 Apr 2023 10:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87E7110E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:26:34 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:57640.1092053342
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 6F6111002AF;
 Wed, 26 Apr 2023 18:26:29 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-fm8l8 with ESMTP id
 6a875bd1575a4df4b6f9587e1219505b for tzimmermann@suse.de; 
 Wed, 26 Apr 2023 18:26:33 CST
X-Transaction-ID: 6a875bd1575a4df4b6f9587e1219505b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <3fc25fd9-69dc-51d2-bd87-402ed96eee6c@189.cn>
Date: Wed, 26 Apr 2023 18:26:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [6/6] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-7-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-7-tzimmermann@suse.de>
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
> Implement DRM fbdev helpers for reading and writing framebuffer
> memory with the respective fbdev functions. Removes duplicate
> code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 174 +-------------------------------
>   1 file changed, 4 insertions(+), 170 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6bb1b8b27d7a..e11858470fa7 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -714,95 +714,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   }
>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>   
> -typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
> -					     size_t count, loff_t pos);
> -
> -static ssize_t __drm_fb_helper_read(struct fb_info *info, char __user *buf, size_t count,
> -				    loff_t *ppos, drm_fb_helper_read_screen read_screen)
> -{
> -	loff_t pos = *ppos;
> -	size_t total_size;
> -	ssize_t ret;
> -
> -	if (info->screen_size)
> -		total_size = info->screen_size;
> -	else
> -		total_size = info->fix.smem_len;
> -
> -	if (pos >= total_size)
> -		return 0;
> -	if (count >= total_size)
> -		count = total_size;
> -	if (total_size - count < pos)
> -		count = total_size - pos;
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	ret = read_screen(info, buf, count, pos);
> -	if (ret > 0)
> -		*ppos += ret;
> -
> -	return ret;
> -}
> -
> -typedef ssize_t (*drm_fb_helper_write_screen)(struct fb_info *info, const char __user *buf,
> -					      size_t count, loff_t pos);
> -
> -static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> -				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> -{
> -	loff_t pos = *ppos;
> -	size_t total_size;
> -	ssize_t ret;
> -	int err = 0;
> -
> -	if (info->screen_size)
> -		total_size = info->screen_size;
> -	else
> -		total_size = info->fix.smem_len;
> -
> -	if (pos > total_size)
> -		return -EFBIG;
> -	if (count > total_size) {
> -		err = -EFBIG;
> -		count = total_size;
> -	}
> -	if (total_size - count < pos) {
> -		if (!err)
> -			err = -ENOSPC;
> -		count = total_size - pos;
> -	}
> -
> -	if (info->fbops->fb_sync)
> -		info->fbops->fb_sync(info);
> -
> -	/*
> -	 * Copy to framebuffer even if we already logged an error. Emulates
> -	 * the behavior of the original fbdev implementation.
> -	 */
> -	ret = write_screen(info, buf, count, pos);
> -	if (ret < 0)
> -		return ret; /* return last error, if any */
> -	else if (!ret)
> -		return err; /* return previous error, if any */
> -
> -	*ppos += ret;
> -
> -	return ret;
> -}
> -
> -static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __user *buf,
> -						size_t count, loff_t pos)
> -{
> -	const char *src = info->screen_buffer + pos;
> -
> -	if (copy_to_user(buf, src, count))
> -		return -EFAULT;
> -
> -	return count;
> -}
> -
>   /**
>    * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>    * @info: fb_info struct pointer
> @@ -816,21 +727,10 @@ static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __use
>   ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
>   			       size_t count, loff_t *ppos)
>   {
> -	return __drm_fb_helper_read(info, buf, count, ppos, drm_fb_helper_read_screen_buffer);
> +	return fb_sys_read(info, buf, count, ppos);
>   }
>   EXPORT_SYMBOL(drm_fb_helper_sys_read);
>   
> -static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const char __user *buf,
> -						 size_t count, loff_t pos)
> -{
> -	char *dst = info->screen_buffer + pos;
> -
> -	if (copy_from_user(dst, buf, count))
> -		return -EFAULT;
> -
> -	return count;
> -}
> -
>   /**
>    * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
>    * @info: fb_info struct pointer
> @@ -849,7 +749,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
>   	ssize_t ret;
>   	struct drm_rect damage_area;
>   
> -	ret = __drm_fb_helper_write(info, buf, count, ppos, drm_fb_helper_write_screen_buffer);
> +	ret = fb_sys_write(info, buf, count, ppos);
>   	if (ret <= 0)
>   		return ret;
>   
> @@ -921,39 +821,6 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
>   }
>   EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>   
> -static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> -				   loff_t pos)
> -{
> -	const char __iomem *src = info->screen_base + pos;
> -	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> -	ssize_t ret = 0;
> -	int err = 0;
> -	char *tmp;
> -
> -	tmp = kmalloc(alloc_size, GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	while (count) {
> -		size_t c = min_t(size_t, count, alloc_size);
> -
> -		memcpy_fromio(tmp, src, c);
> -		if (copy_to_user(buf, tmp, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -
> -		src += c;
> -		buf += c;
> -		ret += c;
> -		count -= c;
> -	}
> -
> -	kfree(tmp);
> -
> -	return ret ? ret : err;
> -}
> -
>   /**
>    * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
>    * @info: fb_info struct pointer
> @@ -967,43 +834,10 @@ static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_
>   ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>   			       size_t count, loff_t *ppos)
>   {
> -	return __drm_fb_helper_read(info, buf, count, ppos, fb_read_screen_base);
> +	return fb_cfb_read(info, buf, count, ppos);
>   }
>   EXPORT_SYMBOL(drm_fb_helper_cfb_read);
>   
> -static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> -				    loff_t pos)
> -{
> -	char __iomem *dst = info->screen_base + pos;
> -	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> -	ssize_t ret = 0;
> -	int err = 0;
> -	u8 *tmp;
> -
> -	tmp = kmalloc(alloc_size, GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	while (count) {
> -		size_t c = min_t(size_t, count, alloc_size);
> -
> -		if (copy_from_user(tmp, buf, c)) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		memcpy_toio(dst, tmp, c);
> -
> -		dst += c;
> -		buf += c;
> -		ret += c;
> -		count -= c;
> -	}
> -
> -	kfree(tmp);
> -
> -	return ret ? ret : err;
> -}
> -
>   /**
>    * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
>    * @info: fb_info struct pointer
> @@ -1022,7 +856,7 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
>   	ssize_t ret;
>   	struct drm_rect damage_area;
>   
> -	ret = __drm_fb_helper_write(info, buf, count, ppos, fb_write_screen_base);
> +	ret = fb_cfb_write(info, buf, count, ppos);
>   	if (ret <= 0)
>   		return ret;
>   
