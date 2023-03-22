Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617F6C440F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0C10E286;
	Wed, 22 Mar 2023 07:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E52910E286
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:28:26 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:33838.1413549615
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 7A28B1002B4;
 Wed, 22 Mar 2023 15:28:19 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 b750de76591444d8b0d8c626c43fda59 for tzimmermann@suse.de; 
 Wed, 22 Mar 2023 15:28:25 CST
X-Transaction-ID: b750de76591444d8b0d8c626c43fda59
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ae152404-8b7f-d8ee-310d-1679fd08d164@189.cn>
Date: Wed, 22 Mar 2023 15:28:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2, 5/8] drm/fbdev-generic: Set screen size to size of GEM buffer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-6-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230320150751.20399-6-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/3/20 23:07, Thomas Zimmermann wrote:
> The size of the screen memory should be equivalent to the size of
> the screen's GEM buffer. Don't recalculate the value.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/drm_fbdev_generic.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index e48a8e82378d..73834a3cc6b0 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem.h>
>   #include <drm/drm_print.h>
>   
>   #include <drm/drm_fbdev_generic.h>
> @@ -74,8 +75,8 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   	struct drm_client_dev *client = &fb_helper->client;
>   	struct drm_device *dev = fb_helper->dev;
>   	struct drm_client_buffer *buffer;
> -	struct drm_framebuffer *fb;
>   	struct fb_info *info;
> +	size_t screen_size;
>   	u32 format;
>   	int ret;
>   
> @@ -91,20 +92,20 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   
>   	fb_helper->buffer = buffer;
>   	fb_helper->fb = buffer->fb;
> -	fb = buffer->fb;
> +	screen_size = buffer->gem->size;
>   
>   	info = drm_fb_helper_alloc_info(fb_helper);
>   	if (IS_ERR(info))
>   		return PTR_ERR(info);
>   
>   	info->fbops = &drm_fbdev_fb_ops;
> -	info->screen_size = sizes->surface_height * fb->pitches[0];
> -	info->fix.smem_len = info->screen_size;
> +	info->screen_size = screen_size;
> +	info->fix.smem_len = screen_size;
>   	info->flags = FBINFO_DEFAULT;
>   
>   	drm_fb_helper_fill_info(info, fb_helper, sizes);
>   
> -	info->screen_buffer = vzalloc(info->screen_size);
> +	info->screen_buffer = vzalloc(screen_size);
>   	if (!info->screen_buffer)
>   		return -ENOMEM;
>   	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
