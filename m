Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E66C4189
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 05:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A474D10E04A;
	Wed, 22 Mar 2023 04:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E00010E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 04:24:23 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:34520.196893139
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id CADCF100211;
 Wed, 22 Mar 2023 12:24:14 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 4e4ee05fbbf6484186fe86279e32ae8b for tzimmermann@suse.de; 
 Wed, 22 Mar 2023 12:24:20 CST
X-Transaction-ID: 4e4ee05fbbf6484186fe86279e32ae8b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <1311ab5b-2af6-c6e9-83c9-c11e825fe313@189.cn>
Date: Wed, 22 Mar 2023 12:24:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,1/8] drm/fbdev-generic: Always use shadow buffering
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-2-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230320150751.20399-2-tzimmermann@suse.de>
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
> Remove all codepaths that implement fbdev output directly on GEM
> buffers. Always allocate a shadow buffer in system memory and set
> up deferred I/O for mmap.
>
> The fbdev code that operated directly on GEM buffers was used by
> drivers based on GEM DMA helpers. Those drivers have been migrated
> to use fbdev-dma, a dedicated fbdev emulation for DMA memory. All
> remaining users of fbdev-generic require shadow buffering.
>
> Memory management of the remaining callers uses TTM, GEM SHMEM
> helpers or a variant of GEM DMA helpers that is incompatible with
> fbdev-dma. Therefore remove the unused codepaths from fbdev-generic
> and simplify the code.
>
> Using a shadow buffer with deferred I/O is probably the best case
> for most remaining callers. Some of the TTM-based drivers might
> benefit from a dedicated fbdev emulation that operates directly on
> the driver's video memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fbdev_generic.c | 184 +++++-----------------------
>   1 file changed, 30 insertions(+), 154 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 4d6325e91565..e48a8e82378d 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -11,16 +11,6 @@
>   
>   #include <drm/drm_fbdev_generic.h>
>   
> -static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
> -{
> -	struct drm_device *dev = fb_helper->dev;
> -	struct drm_framebuffer *fb = fb_helper->fb;
> -
> -	return dev->mode_config.prefer_shadow_fbdev ||
> -	       dev->mode_config.prefer_shadow ||
> -	       fb->funcs->dirty;
> -}
> -
>   /* @user: 1=userspace, 0=fbcon */
>   static int drm_fbdev_fb_open(struct fb_info *info, int user)
>   {
> @@ -46,115 +36,33 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> -	void *shadow = NULL;
> +	void *shadow = info->screen_buffer;
>   
>   	if (!fb_helper->dev)
>   		return;
>   
> -	if (info->fbdefio)
> -		fb_deferred_io_cleanup(info);
> -	if (drm_fbdev_use_shadow_fb(fb_helper))
> -		shadow = info->screen_buffer;
> -
> +	fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(fb_helper);
> -
> -	if (shadow)
> -		vfree(shadow);
> -	else if (fb_helper->buffer)
> -		drm_client_buffer_vunmap(fb_helper->buffer);
> -
> +	vfree(shadow);
>   	drm_client_framebuffer_delete(fb_helper->buffer);
> -	drm_client_release(&fb_helper->client);
>   
> +	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
>   	kfree(fb_helper);
>   }
>   
> -static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> -{
> -	struct drm_fb_helper *fb_helper = info->par;
> -
> -	if (drm_fbdev_use_shadow_fb(fb_helper))
> -		return fb_deferred_io_mmap(info, vma);
> -	else if (fb_helper->dev->driver->gem_prime_mmap)
> -		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
> -	else
> -		return -ENODEV;
> -}
> -
> -static bool drm_fbdev_use_iomem(struct fb_info *info)
> -{
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct drm_client_buffer *buffer = fb_helper->buffer;
> -
> -	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
> -}
> -
> -static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> -				 size_t count, loff_t *ppos)
> -{
> -	ssize_t ret;
> -
> -	if (drm_fbdev_use_iomem(info))
> -		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
> -	else
> -		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
> -
> -	return ret;
> -}
> -
> -static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> -				  size_t count, loff_t *ppos)
> -{
> -	ssize_t ret;
> -
> -	if (drm_fbdev_use_iomem(info))
> -		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
> -	else
> -		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
> -
> -	return ret;
> -}
> -
> -static void drm_fbdev_fb_fillrect(struct fb_info *info,
> -				  const struct fb_fillrect *rect)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_fillrect(info, rect);
> -	else
> -		drm_fb_helper_sys_fillrect(info, rect);
> -}
> -
> -static void drm_fbdev_fb_copyarea(struct fb_info *info,
> -				  const struct fb_copyarea *area)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_copyarea(info, area);
> -	else
> -		drm_fb_helper_sys_copyarea(info, area);
> -}
> -
> -static void drm_fbdev_fb_imageblit(struct fb_info *info,
> -				   const struct fb_image *image)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_imageblit(info, image);
> -	else
> -		drm_fb_helper_sys_imageblit(info, image);
> -}
> -
>   static const struct fb_ops drm_fbdev_fb_ops = {
>   	.owner		= THIS_MODULE,
> -	DRM_FB_HELPER_DEFAULT_OPS,
>   	.fb_open	= drm_fbdev_fb_open,
>   	.fb_release	= drm_fbdev_fb_release,
> +	.fb_read	= drm_fb_helper_sys_read,
> +	.fb_write	= drm_fb_helper_sys_write,
> +	DRM_FB_HELPER_DEFAULT_OPS,
> +	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> +	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> +	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_mmap	= fb_deferred_io_mmap,
>   	.fb_destroy	= drm_fbdev_fb_destroy,
> -	.fb_mmap	= drm_fbdev_fb_mmap,
> -	.fb_read	= drm_fbdev_fb_read,
> -	.fb_write	= drm_fbdev_fb_write,
> -	.fb_fillrect	= drm_fbdev_fb_fillrect,
> -	.fb_copyarea	= drm_fbdev_fb_copyarea,
> -	.fb_imageblit	= drm_fbdev_fb_imageblit,
>   };
>   
>   /*
> @@ -169,7 +77,6 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   	struct drm_framebuffer *fb;
>   	struct fb_info *info;
>   	u32 format;
> -	struct iosys_map map;
>   	int ret;
>   
>   	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> @@ -197,44 +104,21 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   
>   	drm_fb_helper_fill_info(info, fb_helper, sizes);
>   
> -	if (drm_fbdev_use_shadow_fb(fb_helper)) {
> -		info->screen_buffer = vzalloc(info->screen_size);
> -		if (!info->screen_buffer)
> -			return -ENOMEM;
> -		info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
> +	info->screen_buffer = vzalloc(info->screen_size);
> +	if (!info->screen_buffer)
> +		return -ENOMEM;
> +	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>   
> -		/* Set a default deferred I/O handler */
> -		fb_helper->fbdefio.delay = HZ / 20;
> -		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
>   
> -		info->fbdefio = &fb_helper->fbdefio;
> -		ret = fb_deferred_io_init(info);
> -		if (ret)
> -			return ret;
> -	} else {
> -		/* buffer is mapped for HW framebuffer */
> -		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
> -		if (ret)
> -			return ret;
> -		if (map.is_iomem) {
> -			info->screen_base = map.vaddr_iomem;
> -		} else {
> -			info->screen_buffer = map.vaddr;
> -			info->flags |= FBINFO_VIRTFB;
> -		}
> -
> -		/*
> -		 * Shamelessly leak the physical address to user-space. As
> -		 * page_to_phys() is undefined for I/O memory, warn in this
> -		 * case.
> -		 */
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -		if (fb_helper->hint_leak_smem_start && info->fix.smem_start == 0 &&
> -		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
> -			info->fix.smem_start =
> -				page_to_phys(virt_to_page(info->screen_buffer));
> -#endif
> -	}
> +	/* Set a default deferred I/O handler */
> +	fb_helper->fbdefio.delay = HZ / 20;
> +	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +
> +	info->fbdefio = &fb_helper->fbdefio;
> +	ret = fb_deferred_io_init(info);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
> @@ -318,18 +202,13 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
>   	struct drm_device *dev = helper->dev;
>   	int ret;
>   
> -	if (!drm_fbdev_use_shadow_fb(helper))
> -		return 0;
> -
>   	/* Call damage handlers only if necessary */
>   	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>   		return 0;
>   
> -	if (helper->buffer) {
> -		ret = drm_fbdev_damage_blit(helper, clip);
> -		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
> -			return ret;
> -	}
> +	ret = drm_fbdev_damage_blit(helper, clip);
> +	if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
> +		return ret;
>   
>   	if (helper->fb->funcs->dirty) {
>   		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> @@ -415,12 +294,9 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>    * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
>    * Simple drivers might use drm_mode_config_helper_suspend().
>    *
> - * Drivers that set the dirty callback on their framebuffer will get a shadow
> - * fbdev buffer that is blitted onto the real buffer. This is done in order to
> - * make deferred I/O work with all kinds of buffers. A shadow buffer can be
> - * requested explicitly by setting struct drm_mode_config.prefer_shadow or
> - * struct drm_mode_config.prefer_shadow_fbdev to true beforehand. This is
> - * required to use generic fbdev emulation with SHMEM helpers.
> + * In order to provide fixed mmap-able memory ranges, generic fbdev emulation
> + * uses a shadow buffer in system memory. The implementation blits the shadow
> + * fbdev buffer onto the real buffer in regular intervals.
>    *
>    * This function is safe to call even when there are no connectors present.
>    * Setup will be retried on the next hotplug event.
