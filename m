Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843EF71545F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 06:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76710E336;
	Tue, 30 May 2023 04:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3021110E32A;
 Tue, 30 May 2023 04:02:11 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:35688.709279162
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 9E7651002F1;
 Tue, 30 May 2023 12:02:02 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 a8c92154d25549479df24175237368df for sam@ravnborg.org; 
 Tue, 30 May 2023 12:02:07 CST
X-Transaction-ID: a8c92154d25549479df24175237368df
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f2390274-8c51-f7f9-98b3-8ad3c3f7c2bc@189.cn>
Date: Tue, 30 May 2023 12:02:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
 <20230529193621.GD1370714@ravnborg.org>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230529193621.GD1370714@ravnborg.org>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/30 03:36, Sam Ravnborg wrote:
> Hi Thomas,
>
> On Wed, May 24, 2023 at 11:21:50AM +0200, Thomas Zimmermann wrote:
>> Implement dedicated fbdev helpers for framebuffer I/O instead
>> of using DRM's helpers. Use an fbdev generator macro for
>> deferred I/O to create the fbdev callbacks. i915 was the only
>> caller of the DRM helpers, so remove them from the helper module.
>>
>> i915's fbdev emulation is still incomplete as it doesn't implement
>> deferred I/O and damage handling for mmaped pages.
>>
>> v4:
>> 	* generate deferred-I/O helpers
>> 	* use initializer macros for fb_ops
>> v2:
>> 	* use FB_IO_HELPERS options
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/Kconfig                    |   3 -
>>   drivers/gpu/drm/drm_fb_helper.c            | 107 ---------------------
>>   drivers/gpu/drm/i915/Kconfig               |   1 +
>>   drivers/gpu/drm/i915/display/intel_fbdev.c |  14 +--
>>   include/drm/drm_fb_helper.h                |  39 --------
>>   5 files changed, 9 insertions(+), 155 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 92a782827b7b..bb2e48cc6cd6 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -133,9 +133,6 @@ config DRM_FBDEV_EMULATION
>>   	bool "Enable legacy fbdev support for your modesetting driver"
>>   	depends on DRM_KMS_HELPER
>>   	depends on FB=y || FB=DRM_KMS_HELPER
>> -	select FB_CFB_FILLRECT
>> -	select FB_CFB_COPYAREA
>> -	select FB_CFB_IMAGEBLIT
>>   	select FRAMEBUFFER_CONSOLE if !EXPERT
>>   	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>>   	default y
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index bab6b252f02a..9978147bbc8a 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>>   }
>>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>>   
>> -/**
>> - * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
>> - * @info: fb_info struct pointer
>> - * @buf: userspace buffer to read from framebuffer memory
>> - * @count: number of bytes to read from framebuffer memory
>> - * @ppos: read offset within framebuffer memory
>> - *
>> - * Returns:
>> - * The number of bytes read on success, or an error code otherwise.
>> - */
>> -ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>> -			       size_t count, loff_t *ppos)
>> -{
>> -	return fb_io_read(info, buf, count, ppos);
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_cfb_read);
>> -
>> -/**
>> - * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
>> - * @info: fb_info struct pointer
>> - * @buf: userspace buffer to write to framebuffer memory
>> - * @count: number of bytes to write to framebuffer memory
>> - * @ppos: write offset within framebuffer memory
>> - *
>> - * Returns:
>> - * The number of bytes written on success, or an error code otherwise.
>> - */
>> -ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
>> -				size_t count, loff_t *ppos)
>> -{
>> -	struct drm_fb_helper *helper = info->par;
>> -	loff_t pos = *ppos;
>> -	ssize_t ret;
>> -	struct drm_rect damage_area;
>> -
>> -	ret = fb_io_write(info, buf, count, ppos);
>> -	if (ret <= 0)
>> -		return ret;
>> -
>> -	if (helper->funcs->fb_dirty) {
>> -		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
>> -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
>> -				     drm_rect_width(&damage_area),
>> -				     drm_rect_height(&damage_area));
>> -	}
> The generated helpers do not have the if (helper->funcs->fb_dirty)
> check.

Nice catch!

If I understand this correctly, fb_io_write() will write directly to the 
ultimate

destination. There no need to check if (helper->funcs->fb_dirty) anymore.

code inside the curly brace of  `if (helper->funcs->fb_dirty) { }`  can 
be delete safely .


This could turn out to be an optimization. This is a benefit of 
untangled implement.

previously this is a generic (tangled) implement, which intended to be 
used by both

the UMA device driver and non-UMA device(with dedicate VRAM) driver.


drm_fbdev_generic always has a shadow screen buffer allocated in system RAM,

  it always has the fb_dirty hooked, so this could be an optimization 
for fbdev_generic

by eliminate if (helper->funcs->fb_dirty) check.


while dma helper based driver could switch to drm_fbdev_dma, they writing

to gem buffer directly, no shadow buffer is needed.


With those patch, device driver with dedicated video memory can also 
choose FB_CFB_*

to update (iomem)framebuffer directly, despite slower.


> Is this implemented somewhere else that I missed?
>
> 	Sam
>
drm_fb_helper_fb_dirty() function has a check:

```

     if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
         return;
```

Not sure if this is a little bit too late......

>> -
>> -	return ret;
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_cfb_write);
>> -
>> -/**
>> - * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
>> - * @info: fbdev registered by the helper
>> - * @rect: info about rectangle to fill
>> - *
>> - * A wrapper around cfb_fillrect implemented by fbdev core
>> - */
>> -void drm_fb_helper_cfb_fillrect(struct fb_info *info,
>> -				const struct fb_fillrect *rect)
>> -{
>> -	struct drm_fb_helper *helper = info->par;
>> -
>> -	cfb_fillrect(info, rect);
>> -
>> -	if (helper->funcs->fb_dirty)
>> -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
>> -
>> -/**
>> - * drm_fb_helper_cfb_copyarea - wrapper around cfb_copyarea
>> - * @info: fbdev registered by the helper
>> - * @area: info about area to copy
>> - *
>> - * A wrapper around cfb_copyarea implemented by fbdev core
>> - */
>> -void drm_fb_helper_cfb_copyarea(struct fb_info *info,
>> -				const struct fb_copyarea *area)
>> -{
>> -	struct drm_fb_helper *helper = info->par;
>> -
>> -	cfb_copyarea(info, area);
>> -
>> -	if (helper->funcs->fb_dirty)
>> -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
>> -
>> -/**
>> - * drm_fb_helper_cfb_imageblit - wrapper around cfb_imageblit
>> - * @info: fbdev registered by the helper
>> - * @image: info about image to blit
>> - *
>> - * A wrapper around cfb_imageblit implemented by fbdev core
>> - */
>> -void drm_fb_helper_cfb_imageblit(struct fb_info *info,
>> -				 const struct fb_image *image)
>> -{
>> -	struct drm_fb_helper *helper = info->par;
>> -
>> -	cfb_imageblit(info, image);
>> -
>> -	if (helper->funcs->fb_dirty)
>> -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
>> -
>>   /**
>>    * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
>>    * @fb_helper: driver-allocated fbdev helper, can be NULL
>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>> index e4f4d2e3fdfe..01b5a8272a27 100644
>> --- a/drivers/gpu/drm/i915/Kconfig
>> +++ b/drivers/gpu/drm/i915/Kconfig
>> @@ -17,6 +17,7 @@ config DRM_I915
>>   	select DRM_KMS_HELPER
>>   	select DRM_PANEL
>>   	select DRM_MIPI_DSI
>> +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
>>   	select RELAY
>>   	select I2C
>>   	select I2C_ALGOBIT
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index aab1ae74a8f7..eccaceaf8b9d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -28,6 +28,7 @@
>>   #include <linux/console.h>
>>   #include <linux/delay.h>
>>   #include <linux/errno.h>
>> +#include <linux/fb.h>
>>   #include <linux/init.h>
>>   #include <linux/kernel.h>
>>   #include <linux/mm.h>
>> @@ -84,6 +85,10 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
>>   	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
>>   }
>>   
>> +FB_GEN_DEFAULT_DEFERRED_IO_OPS(intel_fbdev,
>> +			       drm_fb_helper_damage_range,
>> +			       drm_fb_helper_damage_area)
>> +
>>   static int intel_fbdev_set_par(struct fb_info *info)
>>   {
>>   	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>> @@ -132,15 +137,12 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>>   
>>   static const struct fb_ops intelfb_ops = {
>>   	.owner = THIS_MODULE,
>> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(intel_fbdev),
>>   	DRM_FB_HELPER_DEFAULT_OPS,
>>   	.fb_set_par = intel_fbdev_set_par,
>> -	.fb_read = drm_fb_helper_cfb_read,
>> -	.fb_write = drm_fb_helper_cfb_write,
>> -	.fb_fillrect = drm_fb_helper_cfb_fillrect,
>> -	.fb_copyarea = drm_fb_helper_cfb_copyarea,
>> -	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>> -	.fb_pan_display = intel_fbdev_pan_display,
>>   	.fb_blank = intel_fbdev_blank,
>> +	.fb_pan_display = intel_fbdev_pan_display,
>> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
>>   	.fb_mmap = intel_fbdev_mmap,
>>   };
>>   
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>> index b50fd0c0b713..4863b0f8299e 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
>>   
>>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>>   
>> -ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>> -			       size_t count, loff_t *ppos);
>> -ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
>> -				size_t count, loff_t *ppos);
>> -
>> -void drm_fb_helper_cfb_fillrect(struct fb_info *info,
>> -				const struct fb_fillrect *rect);
>> -void drm_fb_helper_cfb_copyarea(struct fb_info *info,
>> -				const struct fb_copyarea *area);
>> -void drm_fb_helper_cfb_imageblit(struct fb_info *info,
>> -				 const struct fb_image *image);
>> -
>>   void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
>>   void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
>>   					bool suspend);
>> @@ -385,33 +373,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>>   	return -ENODEV;
>>   }
>>   
>> -static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>> -					     size_t count, loff_t *ppos)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
>> -					      size_t count, loff_t *ppos)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
>> -					      const struct fb_fillrect *rect)
>> -{
>> -}
>> -
>> -static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
>> -					      const struct fb_copyarea *area)
>> -{
>> -}
>> -
>> -static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
>> -					       const struct fb_image *image)
>> -{
>> -}
>> -
>>   static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>>   					     bool suspend)
>>   {
>> -- 
>> 2.40.1
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
