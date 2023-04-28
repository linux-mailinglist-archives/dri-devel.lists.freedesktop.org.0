Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCE6F12FA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563710E3A5;
	Fri, 28 Apr 2023 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5558A10E3A5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 08:09:01 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:56220.1166601949
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id D2D49100237;
 Fri, 28 Apr 2023 16:08:56 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id
 b7a89ae67736480d9bfae214343db7a0 for 15330273260@189.cn; 
 Fri, 28 Apr 2023 16:08:58 CST
X-Transaction-ID: b7a89ae67736480d9bfae214343db7a0
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <d788894c-0afa-d5cf-a2f8-cbf201200db6@189.cn>
Date: Fri, 28 Apr 2023 16:08:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Sui Jingfeng <15330273260@189.cn>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
References: <20230413180622.1014016-1-15330273260@189.cn>
 <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
 <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
 <fab85750-dcb7-0eeb-cabc-8fcfcc84b11c@suse.de>
 <95ef7589-9775-5ad4-f09c-43bcd696823a@189.cn>
 <ZEpBmkf8CWMwZ/gr@phenom.ffwll.local>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ZEpBmkf8CWMwZ/gr@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/27 17:34, Daniel Vetter wrote:
> On Thu, Apr 20, 2023 at 02:47:24AM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>> On 2023/4/17 15:29, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 14.04.23 um 12:58 schrieb Sui Jingfeng:
>>>> Hi,
>>>>
>>>> On 2023/4/14 03:16, Thomas Zimmermann wrote:
>>>>> Hi,
>>>>>
>>>>> thanks for the patch. This is effectively a revert of commit
>>>>> 8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of GEM
>>>>> buffer"). Please add a Fixes tag.
>>>>>
>>>>> Am 13.04.23 um 20:06 schrieb Sui Jingfeng:
>>>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>
>>>>>> The crazy fbdev test of IGT may write after EOF, which lead
>>>>>> to out-of-bound
>>>>> Please drop 'crazy'. :)
>>>> This is OK.
>>>>
>>>> By using the world 'crazy',
>>>>
>>>> I meant that the test is very good and maybe it is written by
>>>> professional  peoples
>>>>
>>>> with the guidance by  experienced  engineer. So that even the corner
>>>> get tested.
>>>>
>>>>
>>>>>> access for the drm drivers using fbdev-generic. For example,
>>>>>> run fbdev test
>>>>>> on a x86-64+ast2400 platform with 1680x1050 resolution will
>>>>>> cause the linux
>>>>>> kernel hang with following call trace:
>>>>>>
>>>>>>     Oops: 0000 [#1] PREEMPT SMP PTI
>>>>>>     [IGT] fbdev: starting subtest eof
>>>>>>     Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>>>>>>     [IGT] fbdev: starting subtest nullptr
>>>>>>
>>>>>>     RIP: 0010:memcpy_erms+0xa/0x20
>>>>>>     RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>>>>>>     RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>>>>>>     RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>>>>>>     RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>>>>>>     R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>>>>>>     R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>>>>>>     FS:  0000000000000000(0000) GS:ffff895257380000(0000)
>>>>>> knlGS:0000000000000000
>>>>>>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>     CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>>>>>>     Call Trace:
>>>>>>      <TASK>
>>>>>>      ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>>>>>>      drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>>>>>>      process_one_work+0x21f/0x430
>>>>>>      worker_thread+0x4e/0x3c0
>>>>>>      ? __pfx_worker_thread+0x10/0x10
>>>>>>      kthread+0xf4/0x120
>>>>>>      ? __pfx_kthread+0x10/0x10
>>>>>>      ret_from_fork+0x2c/0x50
>>>>>>      </TASK>
>>>>>>     CR2: ffffa17d40e0b000
>>>>>>     ---[ end trace 0000000000000000 ]---
>>>>>>
>>>>>> The indirect reason is drm_fb_helper_memory_range_to_clip()
>>>>>> generate damage
>>>>>> rectangles which partially or completely go out of the
>>>>>> active display area.
>>>>>> The second of argument 'off' is passing from the user-space,
>>>>>> this will lead
>>>>>> to the out-of-bound if it is large than (fb_height + 1) *
>>>>>> fb_pitches; while
>>>>>> DIV_ROUND_UP() may also controbute to error by 1.
>>>>>>
>>>>>> This patch will add code to restrict the damage rect
>>>>>> computed go beyond of
>>>>>> the last line of the framebuffer.
>>>>>>
>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> ---
>>>>>>    drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
>>>>>>    drivers/gpu/drm/drm_fbdev_generic.c |  2 +-
>>>>>>    2 files changed, 13 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c
>>>>>> b/drivers/gpu/drm/drm_fb_helper.c
>>>>>> index 64458982be40..6bb1b8b27d7a 100644
>>>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>>>> @@ -641,19 +641,27 @@ static void
>>>>>> drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x,
>>>>>> u32 y,
>>>>>>    static void drm_fb_helper_memory_range_to_clip(struct
>>>>>> fb_info *info, off_t off, size_t len,
>>>>>>                               struct drm_rect *clip)
>>>>>>    {
>>>>>> +    u32 line_length = info->fix.line_length;
>>>>>> +    u32 fb_height = info->var.yres;
>>>>>>        off_t end = off + len;
>>>>>>        u32 x1 = 0;
>>>>>> -    u32 y1 = off / info->fix.line_length;
>>>>>> +    u32 y1 = off / line_length;
>>>>>>        u32 x2 = info->var.xres;
>>>>>> -    u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
>>>>>> +    u32 y2 = DIV_ROUND_UP(end, line_length);
>>>>>> +
>>>>>> +    /* Don't allow any of them beyond the bottom bound of
>>>>>> display area */
>>>>>> +    if (y1 > fb_height)
>>>>>> +        y1 = fb_height;
>>>>>> +    if (y2 > fb_height)
>>>>>> +        y2 = fb_height;
>>>>>>          if ((y2 - y1) == 1) {
>>>>>>            /*
>>>>>>             * We've only written to a single scanline. Try to reduce
>>>>>>             * the number of horizontal pixels that need an update.
>>>>>>             */
>>>>>> -        off_t bit_off = (off % info->fix.line_length) * 8;
>>>>>> -        off_t bit_end = (end % info->fix.line_length) * 8;
>>>>>> +        off_t bit_off = (off % line_length) * 8;
>>>>>> +        off_t bit_end = (end % line_length) * 8;
>>>>> Please scratch all these changes. The current code should work
>>>>> as intended. Only the generic fbdev emulation uses this code and
>>>>> it should really be moved there at some point.
>>>>
>>>> Are you meant  that we should remove all these changes in
>>>> drivers/gpu/drm/drm_fb_helper.c ?
>>> As Daniel mentioned, there's the discussion in the other thread. I don't
>>> want to reopen it here. Just to summarize: I'm not convinced that this
>>> should be DRM code because it can be shared with other fbdev drivers.
>>>
>>> [...]
>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c
>>>>>> b/drivers/gpu/drm/drm_fbdev_generic.c
>>>>>> index 8e5148bf40bb..b057cfbba938 100644
>>>>>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>>>>>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>>>>>> @@ -94,7 +94,7 @@ static int
>>>>>> drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper
>>>>>> *fb_helper,
>>>>>>        fb_helper->buffer = buffer;
>>>>>>        fb_helper->fb = buffer->fb;
>>>>>>    -    screen_size = buffer->gem->size;
>>>>>> +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
>>> This has been bothering me over the weekend. And I think it's because
>>> what we want the screen_size to be heigth * pitch,  but the mmap'ed
>>> memory is still at page granularity. Therefore...
>>>
>>> [...]
>>>>>>        screen_buffer = vzalloc(screen_size);
>>> ... this line should explicitly allocate multiples of pages. Something
>>> like
>>>
>>>      /* allocate page-size multiples for mmap */
>>>      vzalloc(PAGE_ALIGN(screen_size))
>>>
>> I just thought about your instruction at here, thanks!
>>
>> But it is already page size aligned if we don't tough it.
>>
>> It is guaranteed by the GEM memory manger,
>>
>> so a previous patch tested by me, is turn out to be a extremely correct?
>>
>> We exposed a  page size aligned buffer(even though it is larger than needed)
>> is actually for mmap ?
> mmap() is always page aligned, because that's the smallest size the cpu
> pagetables can map. So there's fundamentally always a bit of memory at the
> end of the buffer which logically is not part of the framebuffer memory.
> And somehow we need to handle that to make sure we don't overflow.
> -Daniel

Yeah, buffer allocating should be page size aligned,

A single page share the same caching property.


fbdev test use the `smem_len` member of `fix_info` to know the true size 
of the shadow screen buffer.

Exposing a large one actually allow the test writing to somewhere beyond 
the logically visible area.


I need to learn more and testing more to verify if there are still 
risks, I'll take a look.

Thanks for sharing the knowledge.

>>
>>> It has not been a bug so far because vzalloc() always returns full pages
>>> IIRC. It's still worth fixing.
>>>
>>> Best regards
>>> Thomas
>>>
>>>
>>>>>>        if (!screen_buffer) {
>>>>>>            ret = -ENOMEM;
