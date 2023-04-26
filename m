Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55E6EF166
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 11:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0910E8A0;
	Wed, 26 Apr 2023 09:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 731D510E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 09:48:02 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38762.2023710090
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 26301100295;
 Wed, 26 Apr 2023 17:47:57 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-fm8l8 with ESMTP id
 0a935bf104c846ef8f3df231bf76989a for tzimmermann@suse.de; 
 Wed, 26 Apr 2023 17:48:00 CST
X-Transaction-ID: 0a935bf104c846ef8f3df231bf76989a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <543eca5e-bb10-c723-e0ea-d79c9603f454@189.cn>
Date: Wed, 26 Apr 2023 17:47:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [2/6] fbdev: Use screen_buffer in fb_sys_{read,write}()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
References: <20230425142846.730-3-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-3-tzimmermann@suse.de>
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
> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/core/fb_sys_fops.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
> index cefb77b9546d..6589123f4127 100644
> --- a/drivers/video/fbdev/core/fb_sys_fops.c
> +++ b/drivers/video/fbdev/core/fb_sys_fops.c
> @@ -39,7 +39,7 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
>   	if (count + p > total_size)
>   		count = total_size - p;
>   
> -	src = (void __force *)(info->screen_base + p);
> +	src = info->screen_buffer + p;
>   
>   	if (info->fbops->fb_sync)
>   		info->fbops->fb_sync(info);
> @@ -87,7 +87,7 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   		count = total_size - p;
>   	}
>   
> -	dst = (void __force *) (info->screen_base + p);
> +	dst = info->screen_buffer + p;
>   
>   	if (info->fbops->fb_sync)
>   		info->fbops->fb_sync(info);
