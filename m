Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18270FF28
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 22:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5783810E68D;
	Wed, 24 May 2023 20:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 592A610E60B;
 Wed, 24 May 2023 20:23:17 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:58108.1468850436
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B33AC100180;
 Thu, 25 May 2023 04:23:11 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 2b835748eb104f6ba76bb66e8bd6e61b for tzimmermann@suse.de; 
 Thu, 25 May 2023 04:23:13 CST
X-Transaction-ID: 2b835748eb104f6ba76bb66e8bd6e61b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <9e7588e4-8d4e-99a9-e39f-7b94cc8e3ad4@189.cn>
Date: Thu, 25 May 2023 04:23:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v4,12/13] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 javierm@redhat.com, sam@ravnborg.org
References: <20230524092150.11776-13-tzimmermann@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230524092150.11776-13-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


This version works fine, I have tested it On LoongArch with 
drm/loongson(v14) as it is most handy for me.

Also because it using fbdev-generic. fbdev of IGT report no error. Then 
I run fbtest from geert[1],


Before apply your patch:


Benchmarking... 10x10 squares: 468.39 Mpixels/s
Benchmarking... 20x20 squares: 985.02 Mpixels/s
Benchmarking... 50x50 squares: 2247.22 Mpixels/s
Benchmarking... 100x100 squares: 2242.30 Mpixels/s
Benchmarking... 200x200 squares: 2883.18 Mpixels/s
Benchmarking... 500x500 squares: 3642.18 Mpixels/s
Benchmarking... 1000x1000 squares: 3992.77 Mpixels/s
Benchmarking... R5 circles: 261.90 Mpixels/s
Benchmarking... R10 circles: 596.27 Mpixels/s
Benchmarking... R25 circles: 1513.96 Mpixels/s
Benchmarking... R50 circles: 1965.07 Mpixels/s
Benchmarking... R100 circles: 2470.75 Mpixels/s
Benchmarking... R250 circles: 3288.00 Mpixels/s
Benchmarking... R500 circles: 3705.66 Mpixels/s


After apply your patch:


Benchmarking... 10x10 squares: 477.04 Mpixels/s
Benchmarking... 20x20 squares: 1021.07 Mpixels/s
Benchmarking... 50x50 squares: 2315.70 Mpixels/s
Benchmarking... 100x100 squares: 2267.69 Mpixels/s
Benchmarking... 200x200 squares: 3006.28 Mpixels/s
Benchmarking... 500x500 squares: 3761.44 Mpixels/s
Benchmarking... 1000x1000 squares: 4112.49 Mpixels/s
Benchmarking... R5 circles: 269.19 Mpixels/s
Benchmarking... R10 circles: 620.77 Mpixels/s
Benchmarking... R25 circles: 1559.02 Mpixels/s
Benchmarking... R50 circles: 2027.36 Mpixels/s
Benchmarking... R100 circles: 2574.42 Mpixels/s
Benchmarking... R250 circles: 3363.28 Mpixels/s
Benchmarking... R500 circles: 3815.51 Mpixels/s


It seems that this bring a little bit performance gain.

Directly operate on video RAM is slower than have a shadow in system RAM.

I also test this patch in intel i3-8100 @ 3.6Ghz, the results show that 
i915 is a bit slower.

Because it operate directly on device memory.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git


On 2023/5/24 17:21, Thomas Zimmermann wrote:
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Use an fbdev generator macro for
> deferred I/O to create the callbacks. Fbdev-generic was the
> only caller of the DRM helpers, so remove them from the helper
> module.
>
> v4:
> 	* generate deferred-I/O helpers
> 	* use initializer macros for fb_ops
> v2:
> 	* use FB_SYS_HELPERS_DEFERRED option
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig             |   6 +-
>   drivers/gpu/drm/drm_fb_helper.c     | 107 ----------------------------
>   drivers/gpu/drm/drm_fbdev_generic.c |  11 ++-
>   include/drm/drm_fb_helper.h         |  41 -----------
>   4 files changed, 6 insertions(+), 159 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 77fb10ddd8a2..92a782827b7b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -95,6 +95,7 @@ config DRM_KUNIT_TEST
>   config DRM_KMS_HELPER
>   	tristate
>   	depends on DRM
> +	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  CRTC helpers for KMS drivers.
>   
> @@ -135,11 +136,6 @@ config DRM_FBDEV_EMULATION
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> -	select FB_DEFERRED_IO
> -	select FB_SYS_FOPS
> -	select FB_SYS_FILLRECT
> -	select FB_SYS_COPYAREA
> -	select FB_SYS_IMAGEBLIT
>   	select FRAMEBUFFER_CONSOLE if !EXPERT
>   	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>   	default y
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index cb03099fd2e3..bab6b252f02a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   }
>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>   
> -/**
> - * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to read from framebuffer memory
> - * @count: number of bytes to read from framebuffer memory
> - * @ppos: read offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes read on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos)
> -{
> -	return fb_sys_read(info, buf, count, ppos);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_read);
> -
> -/**
> - * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to write to framebuffer memory
> - * @count: number of bytes to write to framebuffer memory
> - * @ppos: write offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes written on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -	loff_t pos = *ppos;
> -	ssize_t ret;
> -	struct drm_rect damage_area;
> -
> -	ret = fb_sys_write(info, buf, count, ppos);
> -	if (ret <= 0)
> -		return ret;
> -
> -	if (helper->funcs->fb_dirty) {
> -		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -				     drm_rect_width(&damage_area),
> -				     drm_rect_height(&damage_area));
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_write);
> -
> -/**
> - * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
> - * @info: fbdev registered by the helper
> - * @rect: info about rectangle to fill
> - *
> - * A wrapper around sys_fillrect implemented by fbdev core
> - */
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_fillrect(info, rect);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
> -
> -/**
> - * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
> - * @info: fbdev registered by the helper
> - * @area: info about area to copy
> - *
> - * A wrapper around sys_copyarea implemented by fbdev core
> - */
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_copyarea(info, area);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
> -
> -/**
> - * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
> - * @info: fbdev registered by the helper
> - * @image: info about image to blit
> - *
> - * A wrapper around sys_imageblit implemented by fbdev core
> - */
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -				 const struct fb_image *image)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	sys_imageblit(info, image);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> -
>   /**
>    * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
>    * @info: fb_info struct pointer
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 8e5148bf40bb..98ae703848a0 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -34,6 +34,10 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
>   	return 0;
>   }
>   
> +FB_GEN_DEFAULT_DEFERRED_SYS_OPS(drm_fbdev_generic,
> +				drm_fb_helper_damage_range,
> +				drm_fb_helper_damage_area);
> +
>   static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> @@ -56,13 +60,8 @@ static const struct fb_ops drm_fbdev_generic_fb_ops = {
>   	.owner		= THIS_MODULE,
>   	.fb_open	= drm_fbdev_generic_fb_open,
>   	.fb_release	= drm_fbdev_generic_fb_release,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> +	FB_DEFAULT_DEFERRED_OPS(drm_fbdev_generic),
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> -	.fb_mmap	= fb_deferred_io_mmap,
>   	.fb_destroy	= drm_fbdev_generic_fb_destroy,
>   };
>   
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 7d5804882be7..b50fd0c0b713 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
>   
>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>   
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos);
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos);
> -
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect);
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area);
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -				 const struct fb_image *image);
> -
>   ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>   			       size_t count, loff_t *ppos);
>   ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> @@ -397,35 +385,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>   	return -ENODEV;
>   }
>   
> -static inline ssize_t drm_fb_helper_sys_read(struct fb_info *info,
> -					     char __user *buf, size_t count,
> -					     loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline ssize_t drm_fb_helper_sys_write(struct fb_info *info,
> -					      const char __user *buf,
> -					      size_t count, loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -					      const struct fb_fillrect *rect)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -					      const struct fb_copyarea *area)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -					       const struct fb_image *image)
> -{
> -}
> -
>   static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>   					     size_t count, loff_t *ppos)
>   {
