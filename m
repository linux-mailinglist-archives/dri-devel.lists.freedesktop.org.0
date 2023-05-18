Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476447081AC
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 14:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3411110E09B;
	Thu, 18 May 2023 12:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35BDE10E030;
 Thu, 18 May 2023 12:46:44 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:37340.1169356039
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id CD0D9100135;
 Thu, 18 May 2023 20:46:38 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-prw2v with ESMTP id
 0047ede249374502a0ae76a827e3ffab for tzimmermann@suse.de; 
 Thu, 18 May 2023 20:46:39 CST
X-Transaction-ID: 0047ede249374502a0ae76a827e3ffab
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f1688b87-0b8d-59b0-2fe8-88b2d40c513e@189.cn>
Date: Thu, 18 May 2023 20:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2,11/12] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 javierm@redhat.com, sam@ravnborg.org
References: <20230515094033.2133-12-tzimmermann@suse.de>
 <80b4b615-0a71-89e8-3a58-fbeb8a9a06e8@189.cn>
 <28d2e7d5-7dde-b1f9-3b5f-0ba51f8eaaeb@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <28d2e7d5-7dde-b1f9-3b5f-0ba51f8eaaeb@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/17 15:07, Thomas Zimmermann wrote:
> Hi
>
> Am 17.05.23 um 03:58 schrieb Sui Jingfeng:
>> Hi, Thomas
>>
>>
>> After apply your patch set, the kernel with 
>> arch/loongarch/configs/loongson3_defconfig
>>
>> can not finish compile anymore.  gcc complains:
>>
>>
>>    AR      drivers/gpu/built-in.a
>>    AR      drivers/built-in.a
>>    AR      built-in.a
>>    AR      vmlinux.a
>>    LD      vmlinux.o
>>    OBJCOPY modules.builtin.modinfo
>>    GEN     modules.builtin
>>    GEN     .vmlinux.objs
>>    MODPOST Module.symvers
>> ERROR: modpost: "fb_sys_write" [drivers/gpu/drm/drm_kms_helper.ko] 
>> undefined!
>> ERROR: modpost: "sys_imageblit" [drivers/gpu/drm/drm_kms_helper.ko] 
>> undefined!
>> ERROR: modpost: "sys_fillrect" [drivers/gpu/drm/drm_kms_helper.ko] 
>> undefined!
>> ERROR: modpost: "sys_copyarea" [drivers/gpu/drm/drm_kms_helper.ko] 
>> undefined!
>> ERROR: modpost: "fb_sys_read" [drivers/gpu/drm/drm_kms_helper.ko] 
>> undefined!
>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>
> Thanks for reporting this problem. I found that it's caused by a typo 
> in the very first patch 1/7, where these helpers are not selected 
> correctly. Will be fixed in the next round.
>
Yeah, this is just a typo.

Should replace 'FB_SYS_HELPER' with 'FB_SYS_HELPERS' on the first patch 
of this series.


> Best regards
> Thomas
>
>>
>>
>> On 2023/5/15 17:40, Thomas Zimmermann wrote:
>>> Implement dedicated fbdev helpers for framebuffer I/O instead
>>> of using DRM's helpers. Fbdev-generic was the only caller of the
>>> DRM helpers, so remove them from the helper module.
>>>
>>> v2:
>>>     * use FB_SYS_HELPERS_DEFERRED option
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/Kconfig             |   6 +-
>>>   drivers/gpu/drm/drm_fb_helper.c     | 107 
>>> ----------------------------
>>>   drivers/gpu/drm/drm_fbdev_generic.c |  47 ++++++++++--
>>>   include/drm/drm_fb_helper.h         |  41 -----------
>>>   4 files changed, 43 insertions(+), 158 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 77fb10ddd8a2..92a782827b7b 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -95,6 +95,7 @@ config DRM_KUNIT_TEST
>>>   config DRM_KMS_HELPER
>>>       tristate
>>>       depends on DRM
>>> +    select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>>
>> Here, select FB_SYS_HELPERS helps resolve the above issue mentioned.
>>
But select FB_SYS_HELPERS here is more better, I think.  Because it show 
the nature that

DRM_KMS_HELPER is depend on FB_SYS_HELPERS, I think you may want isolate

those dependency with DRM_FBDEV_EMULATION guard.

at least, you should guarantee that drm itself could built and run 
standalone.

Fbdev emulation is a client of drm, not reverse.


By the way, does Denial happy about this,

maybe, he want the fbdev emulation 100% made in drm?

>>>       help
>>>         CRTC helpers for KMS drivers.
>>> @@ -135,11 +136,6 @@ config DRM_FBDEV_EMULATION
>>>       select FB_CFB_FILLRECT
>>>       select FB_CFB_COPYAREA
>>>       select FB_CFB_IMAGEBLIT
>>> -    select FB_DEFERRED_IO
>>> -    select FB_SYS_FOPS
>>> -    select FB_SYS_FILLRECT
>>> -    select FB_SYS_COPYAREA
>>> -    select FB_SYS_IMAGEBLIT
>>>       select FRAMEBUFFER_CONSOLE if !EXPERT
>>>       select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>>>       default y
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>>> b/drivers/gpu/drm/drm_fb_helper.c
>>> index 8724e08c518b..ba0a808f14ee 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -729,113 +729,6 @@ void drm_fb_helper_deferred_io(struct fb_info 
>>> *info, struct list_head *pagerefli
>>>   }
>>>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>>> -/**
>>> - * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for 
>>> system memory
>>> - * @info: fb_info struct pointer
>>> - * @buf: userspace buffer to read from framebuffer memory
>>> - * @count: number of bytes to read from framebuffer memory
>>> - * @ppos: read offset within framebuffer memory
>>> - *
>>> - * Returns:
>>> - * The number of bytes read on success, or an error code otherwise.
>>> - */
>>> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
>>> -                   size_t count, loff_t *ppos)
>>> -{
>>> -    return fb_sys_read(info, buf, count, ppos);
>>> -}
>>> -EXPORT_SYMBOL(drm_fb_helper_sys_read);
>>> -
>>> -/**
>>> - * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for 
>>> system memory
>>> - * @info: fb_info struct pointer
>>> - * @buf: userspace buffer to write to framebuffer memory
>>> - * @count: number of bytes to write to framebuffer memory
>>> - * @ppos: write offset within framebuffer memory
>>> - *
>>> - * Returns:
>>> - * The number of bytes written on success, or an error code otherwise.
>>> - */
>>> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char 
>>> __user *buf,
>>> -                size_t count, loff_t *ppos)
>>> -{
>>> -    struct drm_fb_helper *helper = info->par;
>>> -    loff_t pos = *ppos;
>>> -    ssize_t ret;
>>> -    struct drm_rect damage_area;
>>> -
>>> -    ret = fb_sys_write(info, buf, count, ppos);
>>> -    if (ret <= 0)
>>> -        return ret;
>>> -
>>> -    if (helper->funcs->fb_dirty) {
>>> -        drm_fb_helper_memory_range_to_clip(info, pos, ret, 
>>> &damage_area);
>>> -        drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
>>> -                     drm_rect_width(&damage_area),
>>> -                     drm_rect_height(&damage_area));
>>> -    }
>>> -
>>> -    return ret;
>>> -}
>>> -EXPORT_SYMBOL(drm_fb_helper_sys_write);
>>> -
>>> -/**
>>> - * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
>>> - * @info: fbdev registered by the helper
>>> - * @rect: info about rectangle to fill
>>> - *
>>> - * A wrapper around sys_fillrect implemented by fbdev core
>>> - */
>>> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
>>> -                const struct fb_fillrect *rect)
>>> -{
>>> -    struct drm_fb_helper *helper = info->par;
>>> -
>>> -    sys_fillrect(info, rect);
>>> -
>>> -    if (helper->funcs->fb_dirty)
>>> -        drm_fb_helper_damage(helper, rect->dx, rect->dy, 
>>> rect->width, rect->height);
>>> -}
>>> -EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
>>> -
>>> -/**
>>> - * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
>>> - * @info: fbdev registered by the helper
>>> - * @area: info about area to copy
>>> - *
>>> - * A wrapper around sys_copyarea implemented by fbdev core
>>> - */
>>> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
>>> -                const struct fb_copyarea *area)
>>> -{
>>> -    struct drm_fb_helper *helper = info->par;
>>> -
>>> -    sys_copyarea(info, area);
>>> -
>>> -    if (helper->funcs->fb_dirty)
>>> -        drm_fb_helper_damage(helper, area->dx, area->dy, 
>>> area->width, area->height);
>>> -}
>>> -EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
>>> -
>>> -/**
>>> - * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
>>> - * @info: fbdev registered by the helper
>>> - * @image: info about image to blit
>>> - *
>>> - * A wrapper around sys_imageblit implemented by fbdev core
>>> - */
>>> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
>>> -                 const struct fb_image *image)
>>> -{
>>> -    struct drm_fb_helper *helper = info->par;
>>> -
>>> -    sys_imageblit(info, image);
>>> -
>>> -    if (helper->funcs->fb_dirty)
>>> -        drm_fb_helper_damage(helper, image->dx, image->dy, 
>>> image->width, image->height);
>>> -}
>>> -EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>>> -
>>>   /**
>>>    * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for 
>>> I/O memory
>>>    * @info: fb_info struct pointer
>>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c 
>>> b/drivers/gpu/drm/drm_fbdev_generic.c
>>> index 8e5148bf40bb..f53fc49e34a4 100644
>>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>>> @@ -34,6 +34,43 @@ static int drm_fbdev_generic_fb_release(struct 
>>> fb_info *info, int user)
>>>       return 0;
>>>   }
>>> +static ssize_t drm_fbdev_generic_fb_write(struct fb_info *info, 
>>> const char __user *buf,
>>> +                      size_t count, loff_t *ppos)
>>> +{
>>> +    struct drm_fb_helper *helper = info->par;
>>> +    loff_t pos = *ppos;
>>> +    ssize_t ret;
>>> +
>>> +    ret = fb_sys_write(info, buf, count, ppos);
>>> +    if (ret > 0)
>>> +        drm_fb_helper_damage_range(helper, pos, ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static void drm_fbdev_generic_fb_fillrect(struct fb_info *info, 
>>> const struct fb_fillrect *rect)
>>> +{
>>> +    struct drm_fb_helper *helper = info->par;
>>> +
>>> +    sys_fillrect(info, rect);
>>> +    drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, 
>>> rect->height);
>>> +}
>>> +
>>> +static void drm_fbdev_generic_fb_copyarea(struct fb_info *info, 
>>> const struct fb_copyarea *area)
>>> +{
>>> +    struct drm_fb_helper *helper = info->par;
>>> +
>>> +    sys_copyarea(info, area);
>>> +    drm_fb_helper_damage(helper, area->dx, area->dy, area->width, 
>>> area->height);
>>> +}
>>> +
>>> +static void drm_fbdev_generic_fb_imageblit(struct fb_info *info, 
>>> const struct fb_image *image)
>>> +{
>>> +    struct drm_fb_helper *helper = info->par;
>>> +
>>> +    sys_imageblit(info, image);
>>> +    drm_fb_helper_damage(helper, image->dx, image->dy, 
>>> image->width, image->height);
>>> +}
>>> +
>>>   static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>>>   {
>>>       struct drm_fb_helper *fb_helper = info->par;
>>> @@ -56,12 +93,12 @@ static const struct fb_ops 
>>> drm_fbdev_generic_fb_ops = {
>>>       .owner        = THIS_MODULE,
>>>       .fb_open    = drm_fbdev_generic_fb_open,
>>>       .fb_release    = drm_fbdev_generic_fb_release,
>>> -    .fb_read    = drm_fb_helper_sys_read,
>>> -    .fb_write    = drm_fb_helper_sys_write,
>>> +    .fb_read    = fb_sys_read,
>>> +    .fb_write    = drm_fbdev_generic_fb_write,
>>>       DRM_FB_HELPER_DEFAULT_OPS,
>>> -    .fb_fillrect    = drm_fb_helper_sys_fillrect,
>>> -    .fb_copyarea    = drm_fb_helper_sys_copyarea,
>>> -    .fb_imageblit    = drm_fb_helper_sys_imageblit,
>>> +    .fb_fillrect    = drm_fbdev_generic_fb_fillrect,
>>> +    .fb_copyarea    = drm_fbdev_generic_fb_copyarea,
>>> +    .fb_imageblit    = drm_fbdev_generic_fb_imageblit,
>>>       .fb_mmap    = fb_deferred_io_mmap,
>>>       .fb_destroy    = drm_fbdev_generic_fb_destroy,
>>>   };
>>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>>> index 80c402f4e379..e3240d749a43 100644
>>> --- a/include/drm/drm_fb_helper.h
>>> +++ b/include/drm/drm_fb_helper.h
>>> @@ -259,18 +259,6 @@ void drm_fb_helper_damage_range(struct 
>>> drm_fb_helper *helper, off_t off, size_t
>>>   void drm_fb_helper_deferred_io(struct fb_info *info, struct 
>>> list_head *pagereflist);
>>> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
>>> -                   size_t count, loff_t *ppos);
>>> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char 
>>> __user *buf,
>>> -                size_t count, loff_t *ppos);
>>> -
>>> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
>>> -                const struct fb_fillrect *rect);
>>> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
>>> -                const struct fb_copyarea *area);
>>> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
>>> -                 const struct fb_image *image);
>>> -
>>>   ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user 
>>> *buf,
>>>                      size_t count, loff_t *ppos);
>>>   ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char 
>>> __user *buf,
>>> @@ -398,35 +386,6 @@ static inline int 
>>> drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>>>       return -ENODEV;
>>>   }
>>> -static inline ssize_t drm_fb_helper_sys_read(struct fb_info *info,
>>> -                         char __user *buf, size_t count,
>>> -                         loff_t *ppos)
>>> -{
>>> -    return -ENODEV;
>>> -}
>>> -
>>> -static inline ssize_t drm_fb_helper_sys_write(struct fb_info *info,
>>> -                          const char __user *buf,
>>> -                          size_t count, loff_t *ppos)
>>> -{
>>> -    return -ENODEV;
>>> -}
>>> -
>>> -static inline void drm_fb_helper_sys_fillrect(struct fb_info *info,
>>> -                          const struct fb_fillrect *rect)
>>> -{
>>> -}
>>> -
>>> -static inline void drm_fb_helper_sys_copyarea(struct fb_info *info,
>>> -                          const struct fb_copyarea *area)
>>> -{
>>> -}
>>> -
>>> -static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
>>> -                           const struct fb_image *image)
>>> -{
>>> -}
>>> -
>>>   static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, 
>>> char __user *buf,
>>>                            size_t count, loff_t *ppos)
>>>   {
>
