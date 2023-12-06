Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23F806C83
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AE910E0D0;
	Wed,  6 Dec 2023 10:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929D910E0D0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:46:23 +0000 (UTC)
Message-ID: <62a94860-d6e1-4b21-a153-af53e58c79b2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701859581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6qfPIyC18/+7X5Qr2P3f39KRFkFwhbXQFxG9oeJaso=;
 b=nSqf2mpIY/se96659j8699IET9kzVCBV+1qS52mSEDxGgThXMYjVJNpwVRGjmQlE6mnQCM
 YHLOq5F0bos4xcY6Z2D+JMAiNUSbNVohhqgxn9DYHy73fHH/PMQLjK5suovaYhwvl5cuU8
 C6lKNB5RxJB6SOUB8CClHRp0QIys5tI=
Date: Wed, 6 Dec 2023 18:46:14 +0800
MIME-Version: 1.0
Subject: Re: [v2, 1/4] fbdev/efifb: Replace references to global screen_info by
 local pointer
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 deller@gmx.de, pjones@redhat.com
References: <20231204092812.2612-2-tzimmermann@suse.de>
 <2f6909a7-21a2-4ffc-84bf-962132a9f9b4@linux.dev>
 <9dcf5b34-cf0a-445f-81f0-91d3a92a907f@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <9dcf5b34-cf0a-445f-81f0-91d3a92a907f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On 2023/12/6 17:45, Thomas Zimmermann wrote:
> Hi
>
> Am 04.12.23 um 20:53 schrieb Sui Jingfeng:
>> Hi,
>>
>>
>> On 2023/12/4 17:27, Thomas Zimmermann wrote:
>>> Get the global screen_info's address once and access the data via
>>> this pointer. Limits the use of global state.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>>
>> I have applied the whole series and do a simple test with efifb:
>> Yeah, still works!
>
> Can I take this as Tested-by: for the efifb patches ?
>
No problem, with the warning reported by testing robot fixed, please!
I have tested this on a non primary arch, compiled with a normal default config.
Not noticed the line "static inline void efifb_show_boot_graphics(struct fb_info *info) {}".


> Best regards
> Thomas
>
>>
>> $ dmesg | grep efifb
>>
>> [    0.373800] efifb: probing for efifb
>> [    0.373816] efifb: framebuffer at 0xe0030000000, using 5120k, 
>> total 5120k
>> [    0.373818] efifb: mode is 1280x1024x32, linelength=5120, pages=1
>> [    0.373820] efifb: scrolling: redraw
>> [    0.373821] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>>
>>
>>> ---
>>>   drivers/video/fbdev/efifb.c | 113 
>>> ++++++++++++++++++------------------
>>>   1 file changed, 58 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
>>> index f9b4ddd592ce4..6cbb65bbe1110 100644
>>> --- a/drivers/video/fbdev/efifb.c
>>> +++ b/drivers/video/fbdev/efifb.c
>>> @@ -147,10 +147,9 @@ static bool efifb_bgrt_sanity_check(struct 
>>> screen_info *si, u32 bmp_width)
>>>   }
>>>   #endif
>>> -static void efifb_show_boot_graphics(struct fb_info *info)
>>> +static void efifb_show_boot_graphics(struct fb_info *info, struct 
>>> screen_info *si)
>>
>> I think, we probably can add a const modifier for the function
>> which doesn't modify our local the screen_info instance in the future.
>>
>> static void efifb_show_boot_graphics(struct fb_info *info, const 
>> struct screen_info *si)
>>
>> Since screen_info is mostly used to provide information.
>>
>>
>>>   {
>>>       u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
>>> -    struct screen_info *si = &screen_info;
>>>       struct bmp_file_header *file_header;
>>>       struct bmp_dib_header *dib_header;
>>>       void *bgrt_image = NULL;
>>> @@ -282,7 +281,7 @@ static const struct fb_ops efifb_ops = {
>>>       .fb_setcolreg    = efifb_setcolreg,
>>>   };
>>> -static int efifb_setup(char *options)
>>> +static int efifb_setup(struct screen_info *si, char *options)
>>>   {
>>>       char *this_opt;
>>> @@ -290,16 +289,16 @@ static int efifb_setup(char *options)
>>>           while ((this_opt = strsep(&options, ",")) != NULL) {
>>>               if (!*this_opt) continue;
>>> -            efifb_setup_from_dmi(&screen_info, this_opt);
>>> +            efifb_setup_from_dmi(si, this_opt);
>>>               if (!strncmp(this_opt, "base:", 5))
>>> -                screen_info.lfb_base = simple_strtoul(this_opt+5, 
>>> NULL, 0);
>>> +                si->lfb_base = simple_strtoul(this_opt+5, NULL, 0);
>>>               else if (!strncmp(this_opt, "stride:", 7))
>>> -                screen_info.lfb_linelength = 
>>> simple_strtoul(this_opt+7, NULL, 0) * 4;
>>> +                si->lfb_linelength = simple_strtoul(this_opt+7, 
>>> NULL, 0) * 4;
>>>               else if (!strncmp(this_opt, "height:", 7))
>>> -                screen_info.lfb_height = simple_strtoul(this_opt+7, 
>>> NULL, 0);
>>> +                si->lfb_height = simple_strtoul(this_opt+7, NULL, 0);
>>>               else if (!strncmp(this_opt, "width:", 6))
>>> -                screen_info.lfb_width = simple_strtoul(this_opt+6, 
>>> NULL, 0);
>>> +                si->lfb_width = simple_strtoul(this_opt+6, NULL, 0);
>>>               else if (!strcmp(this_opt, "nowc"))
>>>                   mem_flags &= ~EFI_MEMORY_WC;
>>>               else if (!strcmp(this_opt, "nobgrt"))
>>> @@ -310,15 +309,15 @@ static int efifb_setup(char *options)
>>>       return 0;
>>>   }
>>> -static inline bool fb_base_is_valid(void)
>>> +static inline bool fb_base_is_valid(struct screen_info *si)
>>>   {
>>> -    if (screen_info.lfb_base)
>>> +    if (si->lfb_base)
>>>           return true;
>>> -    if (!(screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE))
>>> +    if (!(si->capabilities & VIDEO_CAPABILITY_64BIT_BASE))
>>>           return false;
>>> -    if (screen_info.ext_lfb_base)
>>> +    if (si->ext_lfb_base)
>>>           return true;
>>>       return false;
>>> @@ -329,7 +328,10 @@ static ssize_t name##_show(struct device 
>>> *dev,                \
>>>                  struct device_attribute *attr,        \
>>>                  char *buf)                    \
>>>   {                                    \
>>> -    return sprintf(buf, fmt "\n", (screen_info.lfb_##name));    \
>>> +    struct screen_info *si = dev_get_platdata(dev);            \
>>> +    if (!si)                            \
>>> +        return -ENODEV;                        \
>>> +    return sprintf(buf, fmt "\n", (si->lfb_##name));        \
>>>   }                                    \
>>>   static DEVICE_ATTR_RO(name)
>>> @@ -356,6 +358,7 @@ static u64 bar_offset;
>>>   static int efifb_probe(struct platform_device *dev)
>>>   {
>>> +    struct screen_info *si = &screen_info;
>>>       struct fb_info *info;
>>>       struct efifb_par *par;
>>>       int err, orientation;
>>> @@ -365,48 +368,48 @@ static int efifb_probe(struct platform_device 
>>> *dev)
>>>       char *option = NULL;
>>>       efi_memory_desc_t md;
>>> -    if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || 
>>> pci_dev_disabled)
>>> +    if (si->orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
>>>           return -ENODEV;
>>>       if (fb_get_options("efifb", &option))
>>>           return -ENODEV;
>>> -    efifb_setup(option);
>>> +    efifb_setup(si, option);
>>>       /* We don't get linelength from UGA Draw Protocol, only from
>>>        * EFI Graphics Protocol.  So if it's not in DMI, and it's not
>>>        * passed in from the user, we really can't use the framebuffer.
>>>        */
>>> -    if (!screen_info.lfb_linelength)
>>> +    if (!si->lfb_linelength)
>>>           return -ENODEV;
>>> -    if (!screen_info.lfb_depth)
>>> -        screen_info.lfb_depth = 32;
>>> -    if (!screen_info.pages)
>>> -        screen_info.pages = 1;
>>> -    if (!fb_base_is_valid()) {
>>> +    if (!si->lfb_depth)
>>> +        si->lfb_depth = 32;
>>> +    if (!si->pages)
>>> +        si->pages = 1;
>>> +    if (!fb_base_is_valid(si)) {
>>>           printk(KERN_DEBUG "efifb: invalid framebuffer address\n");
>>>           return -ENODEV;
>>>       }
>>>       printk(KERN_INFO "efifb: probing for efifb\n");
>>>       /* just assume they're all unset if any are */
>>> -    if (!screen_info.blue_size) {
>>> -        screen_info.blue_size = 8;
>>> -        screen_info.blue_pos = 0;
>>> -        screen_info.green_size = 8;
>>> -        screen_info.green_pos = 8;
>>> -        screen_info.red_size = 8;
>>> -        screen_info.red_pos = 16;
>>> -        screen_info.rsvd_size = 8;
>>> -        screen_info.rsvd_pos = 24;
>>> +    if (!si->blue_size) {
>>> +        si->blue_size = 8;
>>> +        si->blue_pos = 0;
>>> +        si->green_size = 8;
>>> +        si->green_pos = 8;
>>> +        si->red_size = 8;
>>> +        si->red_pos = 16;
>>> +        si->rsvd_size = 8;
>>> +        si->rsvd_pos = 24;
>>>       }
>>
>>
>> Yeah, Here the efifb modified our local screen_info instance, but 
>> this is not relevant to your patch.
>>
>>
>>> -    efifb_fix.smem_start = screen_info.lfb_base;
>>> +    efifb_fix.smem_start = si->lfb_base;
>>> -    if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
>>> +    if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
>>>           u64 ext_lfb_base;
>>> -        ext_lfb_base = (u64)(unsigned long)screen_info.ext_lfb_base 
>>> << 32;
>>> +        ext_lfb_base = (u64)(unsigned long)si->ext_lfb_base << 32;
>>>           efifb_fix.smem_start |= ext_lfb_base;
>>>       }
>>> @@ -417,10 +420,10 @@ static int efifb_probe(struct platform_device 
>>> *dev)
>>>           efifb_fix.smem_start = bar_resource->start + bar_offset;
>>>       }
>>> -    efifb_defined.bits_per_pixel = screen_info.lfb_depth;
>>> -    efifb_defined.xres = screen_info.lfb_width;
>>> -    efifb_defined.yres = screen_info.lfb_height;
>>> -    efifb_fix.line_length = screen_info.lfb_linelength;
>>> +    efifb_defined.bits_per_pixel = si->lfb_depth;
>>> +    efifb_defined.xres = si->lfb_width;
>>> +    efifb_defined.yres = si->lfb_height;
>>> +    efifb_fix.line_length = si->lfb_linelength;
>>>       /*   size_vmode -- that is the amount of memory needed for the
>>>        *                 used video mode, i.e. the minimum amount of
>>> @@ -430,7 +433,7 @@ static int efifb_probe(struct platform_device *dev)
>>>       /*   size_total -- all video memory we have. Used for
>>>        *                 entries, ressource allocation and bounds
>>>        *                 checking. */
>>> -    size_total = screen_info.lfb_size;
>>> +    size_total = si->lfb_size;
>>>       if (size_total < size_vmode)
>>>           size_total = size_vmode;
>>> @@ -512,7 +515,7 @@ static int efifb_probe(struct platform_device *dev)
>>>       pr_info("efifb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
>>>              efifb_defined.xres, efifb_defined.yres,
>>>              efifb_defined.bits_per_pixel, efifb_fix.line_length,
>>> -           screen_info.pages);
>>> +           si->pages);
>>>       efifb_defined.xres_virtual = efifb_defined.xres;
>>>       efifb_defined.yres_virtual = efifb_fix.smem_len /
>>> @@ -526,26 +529,26 @@ static int efifb_probe(struct platform_device 
>>> *dev)
>>>       efifb_defined.left_margin  = (efifb_defined.xres / 8) & 0xf8;
>>>       efifb_defined.hsync_len    = (efifb_defined.xres / 8) & 0xf8;
>>> -    efifb_defined.red.offset    = screen_info.red_pos;
>>> -    efifb_defined.red.length    = screen_info.red_size;
>>> -    efifb_defined.green.offset  = screen_info.green_pos;
>>> -    efifb_defined.green.length  = screen_info.green_size;
>>> -    efifb_defined.blue.offset   = screen_info.blue_pos;
>>> -    efifb_defined.blue.length   = screen_info.blue_size;
>>> -    efifb_defined.transp.offset = screen_info.rsvd_pos;
>>> -    efifb_defined.transp.length = screen_info.rsvd_size;
>>> +    efifb_defined.red.offset    = si->red_pos;
>>> +    efifb_defined.red.length    = si->red_size;
>>> +    efifb_defined.green.offset  = si->green_pos;
>>> +    efifb_defined.green.length  = si->green_size;
>>> +    efifb_defined.blue.offset   = si->blue_pos;
>>> +    efifb_defined.blue.length   = si->blue_size;
>>> +    efifb_defined.transp.offset = si->rsvd_pos;
>>> +    efifb_defined.transp.length = si->rsvd_size;
>>>       pr_info("efifb: %s: "
>>>              "size=%d:%d:%d:%d, shift=%d:%d:%d:%d\n",
>>>              "Truecolor",
>>> -           screen_info.rsvd_size,
>>> -           screen_info.red_size,
>>> -           screen_info.green_size,
>>> -           screen_info.blue_size,
>>> -           screen_info.rsvd_pos,
>>> -           screen_info.red_pos,
>>> -           screen_info.green_pos,
>>> -           screen_info.blue_pos);
>>> +           si->rsvd_size,
>>> +           si->red_size,
>>> +           si->green_size,
>>> +           si->blue_size,
>>> +           si->rsvd_pos,
>>> +           si->red_pos,
>>> +           si->green_pos,
>>> +           si->blue_pos);
>>>       efifb_fix.ypanstep  = 0;
>>>       efifb_fix.ywrapstep = 0;
>
