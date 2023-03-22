Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E16C4404
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8CB10E338;
	Wed, 22 Mar 2023 07:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36BD210E34B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:26:11 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:59878.283553815
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 75255100304;
 Wed, 22 Mar 2023 15:26:02 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 cb723a17d8b849d0bc57df1c1d949d6e for tzimmermann@suse.de; 
 Wed, 22 Mar 2023 15:26:09 CST
X-Transaction-ID: cb723a17d8b849d0bc57df1c1d949d6e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <dd10f77b-b660-f785-3986-6c62059ba9ec@189.cn>
Date: Wed, 22 Mar 2023 15:26:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,6/8] drm/fbdev-generic: Clean up after failed probing
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-7-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230320150751.20399-7-tzimmermann@suse.de>
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
> Clean up fbdev and client state if the probe function fails. It
> used to leak allocated resources. Also reorder the individual steps
> to simplify cleanup.
>
> v2:
> 	* move screen_size update into separate patches
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fbdev_generic.c | 40 ++++++++++++++++++++---------
>   1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 73834a3cc6b0..e7eeba0c44b4 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -77,6 +77,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   	struct drm_client_buffer *buffer;
>   	struct fb_info *info;
>   	size_t screen_size;
> +	void *screen_buffer;
>   	u32 format;
>   	int ret;
>   
> @@ -92,36 +93,51 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   
>   	fb_helper->buffer = buffer;
>   	fb_helper->fb = buffer->fb;
> +
>   	screen_size = buffer->gem->size;
> +	screen_buffer = vzalloc(screen_size);
> +	if (!screen_buffer) {
> +		ret = -ENOMEM;
> +		goto err_drm_client_framebuffer_delete;
> +	}
>   
>   	info = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(info))
> -		return PTR_ERR(info);
> +	if (IS_ERR(info)) {
> +		ret = PTR_ERR(info);
> +		goto err_vfree;
> +	}
> +
> +	drm_fb_helper_fill_info(info, fb_helper, sizes);
>   
>   	info->fbops = &drm_fbdev_fb_ops;
> -	info->screen_size = screen_size;
> -	info->fix.smem_len = screen_size;
>   	info->flags = FBINFO_DEFAULT;
>   
> -	drm_fb_helper_fill_info(info, fb_helper, sizes);
> -
> -	info->screen_buffer = vzalloc(screen_size);
> -	if (!info->screen_buffer)
> -		return -ENOMEM;
> +	/* screen */
>   	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
> -
> +	info->screen_buffer = screen_buffer;
>   	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
> +	info->fix.smem_len = screen_size;
>   
> -	/* Set a default deferred I/O handler */
> +	/* deferred I/O */
>   	fb_helper->fbdefio.delay = HZ / 20;
>   	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
>   
>   	info->fbdefio = &fb_helper->fbdefio;
>   	ret = fb_deferred_io_init(info);
>   	if (ret)
> -		return ret;
> +		goto err_drm_fb_helper_release_info;
>   
>   	return 0;
> +
> +err_drm_fb_helper_release_info:
> +	drm_fb_helper_release_info(fb_helper);
> +err_vfree:
> +	vfree(screen_buffer);
> +err_drm_client_framebuffer_delete:
> +	fb_helper->fb = NULL;
> +	fb_helper->buffer = NULL;
> +	drm_client_framebuffer_delete(buffer);
> +	return ret;
>   }
>   
>   static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
