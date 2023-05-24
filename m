Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8170FFFD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF7510E586;
	Wed, 24 May 2023 21:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 264B910E585;
 Wed, 24 May 2023 21:25:49 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:60750.2065150534
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 0DB1A1001E9;
 Thu, 25 May 2023 05:25:44 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 2a16eb5e949146d3b81ea9ab1574803f for tzimmermann@suse.de; 
 Thu, 25 May 2023 05:25:46 CST
X-Transaction-ID: 2a16eb5e949146d3b81ea9ab1574803f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <9a7e0db2-6dc1-5e48-6344-b941726df5ba@189.cn>
Date: Thu, 25 May 2023 05:25:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v4,13/13] drm/i915: Implement dedicated fbdev I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 javierm@redhat.com, sam@ravnborg.org
References: <20230524092150.11776-14-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230524092150.11776-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


I have just tested this patch on my i3-8100@3.6Ghz cpu + h110 
motherboard with fbtest:


Benchmarking... 10x10 squares: 26.44 Mpixels/s
Benchmarking... 20x20 squares: 52.54 Mpixels/s
Benchmarking... 50x50 squares: 128.13 Mpixels/s
Benchmarking... 100x100 squares: 252.21 Mpixels/s
Benchmarking... 200x200 squares: 489.48 Mpixels/s
Benchmarking... 500x500 squares: 1073.42 Mpixels/s
Benchmarking... 1000x1000 squares: 1823.72 Mpixels/s
Benchmarking... R5 circles: 18.73 Mpixels/s
Benchmarking... R10 circles: 39.05 Mpixels/s
Benchmarking... R25 circles: 98.60 Mpixels/s
Benchmarking... R50 circles: 196.31 Mpixels/s
Benchmarking... R100 circles: 382.81 Mpixels/s
Benchmarking... R250 circles: 872.09 Mpixels/s
Benchmarking... R500 circles: 1511.50 Mpixels/s


Then I mount ast2400 card on the same motherboard:


Benchmarking... 10x10 squares: 261.75 Mpixels/s
Benchmarking... 20x20 squares: 539.37 Mpixels/s
Benchmarking... 50x50 squares: 1161.53 Mpixels/s
Benchmarking... 100x100 squares: 1624.30 Mpixels/s
Benchmarking... 200x200 squares: 2089.74 Mpixels/s
Benchmarking... 500x500 squares: 2779.27 Mpixels/s
Benchmarking... 1000x1000 squares: 2382.28 Mpixels/s
Benchmarking... R5 circles: 151.03 Mpixels/s
Benchmarking... R10 circles: 311.34 Mpixels/s
Benchmarking... R25 circles: 698.63 Mpixels/s
Benchmarking... R50 circles: 1184.14 Mpixels/s
Benchmarking... R100 circles: 1791.60 Mpixels/s
Benchmarking... R250 circles: 2641.76 Mpixels/s
Benchmarking... R500 circles: 2669.38 Mpixels/s


The logs of fbtest and fbdev of IGT say passed.


On 2023/5/24 17:21, Thomas Zimmermann wrote:
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Use an fbdev generator macro for
> deferred I/O to create the fbdev callbacks. i915 was the only
> caller of the DRM helpers, so remove them from the helper module.
>
> i915's fbdev emulation is still incomplete as it doesn't implement
> deferred I/O and damage handling for mmaped pages.
>
> v4:
> 	* generate deferred-I/O helpers
> 	* use initializer macros for fb_ops
> v2:
> 	* use FB_IO_HELPERS options
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/Kconfig                    |   3 -
>   drivers/gpu/drm/drm_fb_helper.c            | 107 ---------------------
>   drivers/gpu/drm/i915/Kconfig               |   1 +
>   drivers/gpu/drm/i915/display/intel_fbdev.c |  14 +--
>   include/drm/drm_fb_helper.h                |  39 --------
>   5 files changed, 9 insertions(+), 155 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 92a782827b7b..bb2e48cc6cd6 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -133,9 +133,6 @@ config DRM_FBDEV_EMULATION
>   	bool "Enable legacy fbdev support for your modesetting driver"
>   	depends on DRM_KMS_HELPER
>   	depends on FB=y || FB=DRM_KMS_HELPER
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>   	select FRAMEBUFFER_CONSOLE if !EXPERT
>   	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>   	default y
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index bab6b252f02a..9978147bbc8a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   }
>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>   
> -/**
> - * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to read from framebuffer memory
> - * @count: number of bytes to read from framebuffer memory
> - * @ppos: read offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes read on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos)
> -{
> -	return fb_io_read(info, buf, count, ppos);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_cfb_read);
> -
> -/**
> - * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to write to framebuffer memory
> - * @count: number of bytes to write to framebuffer memory
> - * @ppos: write offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes written on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -	loff_t pos = *ppos;
> -	ssize_t ret;
> -	struct drm_rect damage_area;
> -
> -	ret = fb_io_write(info, buf, count, ppos);
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
> -EXPORT_SYMBOL(drm_fb_helper_cfb_write);
> -
> -/**
> - * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
> - * @info: fbdev registered by the helper
> - * @rect: info about rectangle to fill
> - *
> - * A wrapper around cfb_fillrect implemented by fbdev core
> - */
> -void drm_fb_helper_cfb_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	cfb_fillrect(info, rect);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
> -
> -/**
> - * drm_fb_helper_cfb_copyarea - wrapper around cfb_copyarea
> - * @info: fbdev registered by the helper
> - * @area: info about area to copy
> - *
> - * A wrapper around cfb_copyarea implemented by fbdev core
> - */
> -void drm_fb_helper_cfb_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	cfb_copyarea(info, area);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
> -
> -/**
> - * drm_fb_helper_cfb_imageblit - wrapper around cfb_imageblit
> - * @info: fbdev registered by the helper
> - * @image: info about image to blit
> - *
> - * A wrapper around cfb_imageblit implemented by fbdev core
> - */
> -void drm_fb_helper_cfb_imageblit(struct fb_info *info,
> -				 const struct fb_image *image)
> -{
> -	struct drm_fb_helper *helper = info->par;
> -
> -	cfb_imageblit(info, image);
> -
> -	if (helper->funcs->fb_dirty)
> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
> -
>   /**
>    * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
>    * @fb_helper: driver-allocated fbdev helper, can be NULL
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index e4f4d2e3fdfe..01b5a8272a27 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -17,6 +17,7 @@ config DRM_I915
>   	select DRM_KMS_HELPER
>   	select DRM_PANEL
>   	select DRM_MIPI_DSI
> +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
>   	select RELAY
>   	select I2C
>   	select I2C_ALGOBIT
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index aab1ae74a8f7..eccaceaf8b9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -28,6 +28,7 @@
>   #include <linux/console.h>
>   #include <linux/delay.h>
>   #include <linux/errno.h>
> +#include <linux/fb.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/mm.h>
> @@ -84,6 +85,10 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
>   	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
>   }
>   
> +FB_GEN_DEFAULT_DEFERRED_IO_OPS(intel_fbdev,
> +			       drm_fb_helper_damage_range,
> +			       drm_fb_helper_damage_area)
> +
>   static int intel_fbdev_set_par(struct fb_info *info)
>   {
>   	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
> @@ -132,15 +137,12 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>   
>   static const struct fb_ops intelfb_ops = {
>   	.owner = THIS_MODULE,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(intel_fbdev),
>   	DRM_FB_HELPER_DEFAULT_OPS,
>   	.fb_set_par = intel_fbdev_set_par,
> -	.fb_read = drm_fb_helper_cfb_read,
> -	.fb_write = drm_fb_helper_cfb_write,
> -	.fb_fillrect = drm_fb_helper_cfb_fillrect,
> -	.fb_copyarea = drm_fb_helper_cfb_copyarea,
> -	.fb_imageblit = drm_fb_helper_cfb_imageblit,
> -	.fb_pan_display = intel_fbdev_pan_display,
>   	.fb_blank = intel_fbdev_blank,
> +	.fb_pan_display = intel_fbdev_pan_display,
This override the default implements(drm_fb_helper_blank, 
drm_fb_helper_pan_display and drm_fb_helper_set_par) defined in

DRM_FB_HELPER_DEFAULT_OPS, but I think this intended.

> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
>   	.fb_mmap = intel_fbdev_mmap,
>   };
>   
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index b50fd0c0b713..4863b0f8299e 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
>   
>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>   
> -ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> -			       size_t count, loff_t *ppos);
> -ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> -				size_t count, loff_t *ppos);
> -
> -void drm_fb_helper_cfb_fillrect(struct fb_info *info,
> -				const struct fb_fillrect *rect);
> -void drm_fb_helper_cfb_copyarea(struct fb_info *info,
> -				const struct fb_copyarea *area);
> -void drm_fb_helper_cfb_imageblit(struct fb_info *info,
> -				 const struct fb_image *image);
> -
>   void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
>   void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
>   					bool suspend);
> @@ -385,33 +373,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>   	return -ENODEV;
>   }
>   
> -static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> -					     size_t count, loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> -					      size_t count, loff_t *ppos)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
> -					      const struct fb_fillrect *rect)
> -{
> -}
> -
> -static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
> -					      const struct fb_copyarea *area)
> -{
> -}
> -
> -static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
> -					       const struct fb_image *image)
> -{
> -}
> -
>   static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>   					     bool suspend)
>   {
