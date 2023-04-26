Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347C6EF1DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C63B10E8E8;
	Wed, 26 Apr 2023 10:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 550FD10E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:24:27 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:37870.1815100725
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 4B10110294D;
 Wed, 26 Apr 2023 18:24:22 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-fm8l8 with ESMTP id
 12881e265f4046a2be96e9252cf8a552 for tzimmermann@suse.de; 
 Wed, 26 Apr 2023 18:24:25 CST
X-Transaction-ID: 12881e265f4046a2be96e9252cf8a552
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <5eb43d83-7dd2-ed2b-a9fd-7efeb4b03354@189.cn>
Date: Wed, 26 Apr 2023 18:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [4/6] fbdev: Validate info->screen_{base, buffer} in fb_ops
 implementations
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-5-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-5-tzimmermann@suse.de>
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
> Push the test for info->screen_base from fb_read() and fb_write() into
> the implementations of struct fb_ops.{fb_read,fb_write}. In cases where
> the driver operates on info->screen_buffer, test this field instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/cobalt_lcdfb.c     |  6 ++++++
>   drivers/video/fbdev/core/fb_sys_fops.c |  6 ++++++
>   drivers/video/fbdev/core/fbmem.c       | 10 ++++++++--
>   drivers/video/fbdev/sm712fb.c          |  4 ++--
>   4 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
> index 5f8b6324d2e8..26dbd1c78195 100644
> --- a/drivers/video/fbdev/cobalt_lcdfb.c
> +++ b/drivers/video/fbdev/cobalt_lcdfb.c
> @@ -129,6 +129,9 @@ static ssize_t cobalt_lcdfb_read(struct fb_info *info, char __user *buf,
>   	unsigned long pos;
>   	int len, retval = 0;
>   
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
>   	pos = *ppos;
>   	if (pos >= LCD_CHARS_MAX || count == 0)
>   		return 0;
> @@ -175,6 +178,9 @@ static ssize_t cobalt_lcdfb_write(struct fb_info *info, const char __user *buf,
>   	unsigned long pos;
>   	int len, retval = 0;
>   
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
>   	pos = *ppos;
>   	if (pos >= LCD_CHARS_MAX || count == 0)
>   		return 0;
> diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
> index 7dee5d3c7fb1..0cb0989abda6 100644
> --- a/drivers/video/fbdev/core/fb_sys_fops.c
> +++ b/drivers/video/fbdev/core/fb_sys_fops.c
> @@ -22,6 +22,9 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
>   	unsigned long total_size, c;
>   	ssize_t ret;
>   
> +	if (!info->screen_buffer)
> +		return -ENODEV;
> +
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> @@ -61,6 +64,9 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   	unsigned long total_size, c;
>   	size_t ret;
>   
> +	if (!info->screen_buffer)
> +		return -ENODEV;
> +
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index abc92d79a295..b993bb97058f 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -768,7 +768,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   	int c, cnt = 0, err = 0;
>   	unsigned long total_size;
>   
> -	if (!info || ! info->screen_base)
> +	if (!info)
>   		return -ENODEV;
>   
>   	if (info->state != FBINFO_STATE_RUNNING)
> @@ -777,6 +777,9 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_read)
>   		return info->fbops->fb_read(info, buf, count, ppos);
>   
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> @@ -833,7 +836,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   	int c, cnt = 0, err = 0;
>   	unsigned long total_size;
>   
> -	if (!info || !info->screen_base)
> +	if (!info)
>   		return -ENODEV;
>   
>   	if (info->state != FBINFO_STATE_RUNNING)
> @@ -842,6 +845,9 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>   	if (info->fbops->fb_write)
>   		return info->fbops->fb_write(info, buf, count, ppos);
>   
> +	if (!info->screen_base)
> +		return -ENODEV;
> +
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
> index 6f852cd756c5..b7ad3c644e13 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1028,7 +1028,7 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
>   	int c, i, cnt = 0, err = 0;
>   	unsigned long total_size;
>   
> -	if (!info || !info->screen_base)
> +	if (!info->screen_base)
>   		return -ENODEV;
>   
>   	total_size = info->screen_size;
> @@ -1091,7 +1091,7 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
>   	int c, i, cnt = 0, err = 0;
>   	unsigned long total_size;
>   
> -	if (!info || !info->screen_base)
> +	if (!info->screen_base)
>   		return -ENODEV;
>   
>   	total_size = info->screen_size;
