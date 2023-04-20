Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F8F6E8EDC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BF10EBA9;
	Thu, 20 Apr 2023 10:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ECC610EBA9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 10:05:08 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:58704.127461854
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 8EEF5100248;
 Thu, 20 Apr 2023 18:04:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 a07a507ef7554813b62a31b8f0f84c39 for tzimmermann@suse.de; 
 Thu, 20 Apr 2023 18:05:05 CST
X-Transaction-ID: a07a507ef7554813b62a31b8f0f84c39
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
Date: Thu, 20 Apr 2023 18:04:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 2023/4/20 15:07, Thomas Zimmermann wrote:
> Hi
>
> Am 20.04.23 um 09:04 schrieb Thomas Zimmermann:
>> Hi,
>>
>> this patch looks to me good and I'd like to merge it, if no one objects.
>
> Rereading it, I might have been too eager. What happened to the 
> setting of screen_size = buffer->gem->size ?  It is not relevant?
>
Short answer is that it is not relevant.

As long as the computed damage rectangle is sane, it's OK to allocate a 
bit more than needed.

I think it's turn out to be *correct*, if not extremely.

Because it is page size aligned,  writing to invisible area for some 
case is not a serve issue.

It also guarantee that the size of shadow screen buffer is exactly the 
same size with its GEM counterpart.


Otherwise I have to answer the question

What will happen if the 'screen_size' is not page_size aligned and mmap 
will mapping in the granularity of pages ?


I see efifb also align the buffer going to be mapped with page size.


> Best regards
> Thomas
>
>>
>> In the near future, after i915 has switched to struct drm_client, I 
>> intend to move DRM's deferred-I/O helpers into fbdev-generic and 
>> i915. Those are the two users, but they are fairly different. They 
>> can then both have something tailored towards their needs.
>>
>> Best regards
>> Thomas
>>
>> Am 20.04.23 um 05:05 schrieb Sui Jingfeng:
>>> The fbdev test of IGT may write after EOF, which lead to out-of-bound
>>> access for drm drivers hire fbdev-generic. For example, run fbdev test
>>> on a x86+ast2400 platform, with 1680x1050 resolution, will cause the
>>> linux kernel hang with the following call trace:
>>>
>>>    Oops: 0000 [#1] PREEMPT SMP PTI
>>>    [IGT] fbdev: starting subtest eof
>>>    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>>>    [IGT] fbdev: starting subtest nullptr
>>>
>>>    RIP: 0010:memcpy_erms+0xa/0x20
>>>    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>>>    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>>>    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>>>    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>>>    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>>>    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>>>    FS:  0000000000000000(0000) GS:ffff895257380000(0000) 
>>> knlGS:0000000000000000
>>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>>>    Call Trace:
>>>     <TASK>
>>>     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>>>     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>>>     process_one_work+0x21f/0x430
>>>     worker_thread+0x4e/0x3c0
>>>     ? __pfx_worker_thread+0x10/0x10
>>>     kthread+0xf4/0x120
>>>     ? __pfx_kthread+0x10/0x10
>>>     ret_from_fork+0x2c/0x50
>>>     </TASK>
>>>    CR2: ffffa17d40e0b000
>>>    ---[ end trace 0000000000000000 ]---
>>>
>>> The is because damage rectangles computed by
>>> drm_fb_helper_memory_range_to_clip() function does not guaranteed to be
>>> bound in the screen's active display area. Possible reasons are:
>>>
>>> 1) Buffers are allocated in the granularity of page size, for mmap 
>>> system
>>>     call support. The shadow screen buffer consumed by fbdev 
>>> emulation may
>>>     also choosed be page size aligned.
>>>
>>> 2) The DIV_ROUND_UP() used in drm_fb_helper_memory_range_to_clip()
>>>     will introduce off-by-one error.
>>>
>>> For example, on a 16KB page size system, in order to store a 1920x1080
>>> XRGB framebuffer, we need allocate 507 pages. Unfortunately, the size
>>> 1920*1080*4 can not be divided exactly by 16KB.
>>>
>>>   1920 * 1080 * 4 = 8294400 bytes
>>>   506 * 16 * 1024 = 8290304 bytes
>>>   507 * 16 * 1024 = 8306688 bytes
>>>
>>>   line_length = 1920*4 = 7680 bytes
>>>
>>>   507 * 16 * 1024 / 7680 = 1081.6
>>>
>>>   off / line_length = 507 * 16 * 1024 / 7680 = 1081
>>>   DIV_ROUND_UP(507 * 16 * 1024, 7680) will yeild 1082
>>>
>>> memcpy_toio() typically issue the copy line by line, when copy the last
>>> line, out-of-bound access will be happen. Because:
>>>
>>>   1082 * line_length = 1082 * 7680 = 8309760, and 8309760 > 8306688
>>>
>>> Note that userspace may stil write to the invisiable area if a larger
>>> buffer than width x stride is exposed. But it is not a big issue as
>>> long as there still have memory resolve the access if not drafting so
>>> far.
>>>
>>>   - Also limit the y1 (Daniel)
>>>   - keep fix patch it to minimal (Daniel)
>>>   - screen_size is page size aligned because of it need mmap (Thomas)
>>>   - Adding fixes tag (Thomas)
>>>
>>> Fixes: aa15c677cc34 ("drm/fb-helper: Fix vertical damage clipping")
>>>
>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Link: 
>>> https://lore.kernel.org/dri-devel/ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn/
>>> ---
>>>   drivers/gpu/drm/drm_fb_helper.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>>> b/drivers/gpu/drm/drm_fb_helper.c
>>> index 64458982be40..6bb1b8b27d7a 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -641,19 +641,27 @@ static void drm_fb_helper_damage(struct 
>>> drm_fb_helper *helper, u32 x, u32 y,
>>>   static void drm_fb_helper_memory_range_to_clip(struct fb_info 
>>> *info, off_t off, size_t len,
>>>                              struct drm_rect *clip)
>>>   {
>>> +    u32 line_length = info->fix.line_length;
>>> +    u32 fb_height = info->var.yres;
>>>       off_t end = off + len;
>>>       u32 x1 = 0;
>>> -    u32 y1 = off / info->fix.line_length;
>>> +    u32 y1 = off / line_length;
>>>       u32 x2 = info->var.xres;
>>> -    u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
>>> +    u32 y2 = DIV_ROUND_UP(end, line_length);
>>> +
>>> +    /* Don't allow any of them beyond the bottom bound of display 
>>> area */
>>> +    if (y1 > fb_height)
>>> +        y1 = fb_height;
>>> +    if (y2 > fb_height)
>>> +        y2 = fb_height;
>>>       if ((y2 - y1) == 1) {
>>>           /*
>>>            * We've only written to a single scanline. Try to reduce
>>>            * the number of horizontal pixels that need an update.
>>>            */
>>> -        off_t bit_off = (off % info->fix.line_length) * 8;
>>> -        off_t bit_end = (end % info->fix.line_length) * 8;
>>> +        off_t bit_off = (off % line_length) * 8;
>>> +        off_t bit_end = (end % line_length) * 8;
>>>           x1 = bit_off / info->var.bits_per_pixel;
>>>           x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
>>
>
