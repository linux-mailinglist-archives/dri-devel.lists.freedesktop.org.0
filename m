Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8476EF15A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 11:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5E10E012;
	Wed, 26 Apr 2023 09:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40FFE10E012
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 09:44:05 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:35176.1168600400
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 41AF01002B2;
 Wed, 26 Apr 2023 17:43:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id
 88f4a772e8bf41fb8e056cbcaf3486a1 for tzimmermann@suse.de; 
 Wed, 26 Apr 2023 17:44:01 CST
X-Transaction-ID: 88f4a772e8bf41fb8e056cbcaf3486a1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <9f842e90-94f5-5d4b-36c4-25e157bed217@189.cn>
Date: Wed, 26 Apr 2023 17:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [1/6] fbdev: Return number of bytes read or written
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-2-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-2-tzimmermann@suse.de>
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

Hi,

The whole patch set is tested with fbdev of IGT, on LoongArch with 
drm/radeon and efifb driver. Test results say SUCCESS. Tested-by: Sui 
Jingfeng <suijingfeng@loongson.cn>

On 2023/4/25 22:28, Thomas Zimmermann wrote:
> Always return the number of bytes read or written within the
> framebuffer. Only return an errno code if framebuffer memory
> was not touched. This is the semantics required by POSIX and
> makes fb_read() and fb_write() compatible with IGT tests. [1]
>
> This bug has been fixed for fb_write() long ago by
> commit 6a2a88668e90 ("[PATCH] fbdev: Fix return error of
> fb_write"). The code in fb_read() and the corresponding fb_sys_()
> helpers was forgotten.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/fbdev.c # 1
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/core/fb_sys_fops.c | 24 ++++++++++++++----------
>   drivers/video/fbdev/core/fbmem.c       |  2 +-
>   2 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
> index ff275d7f3eaf..cefb77b9546d 100644
> --- a/drivers/video/fbdev/core/fb_sys_fops.c
> +++ b/drivers/video/fbdev/core/fb_sys_fops.c
> @@ -19,7 +19,8 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
>   	unsigned long p = *ppos;
>   	void *src;
>   	int err = 0;
> -	unsigned long total_size;
> +	unsigned long total_size, c;
> +	ssize_t ret;
>   
>   	if (info->state != FBINFO_STATE_RUNNING)
>   		return -EPERM;
> @@ -43,13 +44,14 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
>   	if (info->fbops->fb_sync)
>   		info->fbops->fb_sync(info);
>   
> -	if (copy_to_user(buf, src, count))
> +	c = copy_to_user(buf, src, count);
> +	if (c)
>   		err = -EFAULT;
> +	ret = count - c;
>   
> -	if  (!err)
> -		*ppos += count;
> +	*ppos += ret;
>   
> -	return (err) ? err : count;
> +	return ret ? ret : err;
>   }
>   EXPORT_SYMBOL_GPL(fb_sys_read);
>   
> @@ -59,7 +61,8 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   	unsigned long p = *ppos;
>   	void *dst;
>   	int err = 0;
> -	unsigned long total_size;
> +	unsigned long total_size, c;
> +	size_t ret;
>   
>   	if (info->state != FBINFO_STATE_RUNNING)
>   		return -EPERM;
> @@ -89,13 +92,14 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   	if (info->fbops->fb_sync)
>   		info->fbops->fb_sync(info);
>   
> -	if (copy_from_user(dst, buf, count))
> +	c = copy_from_user(dst, buf, count);
> +	if (c)
>   		err = -EFAULT;
> +	ret = count - c;
>   
> -	if  (!err)
> -		*ppos += count;
> +	*ppos += ret;
>   
> -	return (err) ? err : count;
> +	return ret ? ret : err;
>   }
>   EXPORT_SYMBOL_GPL(fb_sys_write);
>   
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 3fd95a79e4c3..abc92d79a295 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -820,7 +820,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   
>   	kfree(buffer);
>   
> -	return (err) ? err : cnt;
> +	return cnt ? cnt : err;
>   }
>   
>   static ssize_t
