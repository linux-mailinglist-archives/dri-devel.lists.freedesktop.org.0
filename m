Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FE6E1B09
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 06:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82FE10EC5B;
	Fri, 14 Apr 2023 04:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id A289A10EC5B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 04:24:06 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:47332.126833385
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 67CB51002A7;
 Fri, 14 Apr 2023 12:23:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 eade526bd1e54428825c7cf8040504a1 for tzimmermann@suse.de; 
 Fri, 14 Apr 2023 12:24:02 CST
X-Transaction-ID: eade526bd1e54428825c7cf8040504a1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
Date: Fri, 14 Apr 2023 12:23:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ZDhfkq92hbGc630z@phenom.ffwll.local>
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

On 2023/4/14 04:01, Daniel Vetter wrote:
> On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 13.04.23 um 20:56 schrieb Daniel Vetter:
>> [...]
>>> This should switch the existing code over to using drm_framebuffer instead
>>> of fbdev:
>>>
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>>> index ef4eb8b12766..99ca69dd432f 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
>>>    static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
>>>    					       struct drm_rect *clip)
>>>    {
>>> +	struct drm_fb_helper *helper = info->par;
>>> +
>>>    	off_t end = off + len;
>>>    	u32 x1 = 0;
>>>    	u32 y1 = off / info->fix.line_length;
>>> -	u32 x2 = info->var.xres;
>>> -	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
>>> +	u32 x2 = helper->fb->height;
>>> +	unsigned stride = helper->fb->pitches[0];
>>> +	u32 y2 = DIV_ROUND_UP(end, stride);
>>> +	int bpp = drm_format_info_bpp(helper->fb->format, 0);
>> Please DONT do that. The code here is fbdev code and shouldn't bother about
>> DRM data structures. Actually, it shouldn't be here: a number of fbdev
>> drivers with deferred I/O contain similar code and the fbdev module should
>> provide us with a helper. (I think I even had some patches somewhere.)
> Well my thinking is that it's a drm driver,

Yes, I actually agree with this, and the code looks quite good. And I 
really want to adopt it.

Because here is DRM, we should emulate the fbdev in the DRM's way.

The DRM is really the big brother on the behind of emulated fbdev,

who provide the real displayable backing memory and scant out engine to 
display such a buffer.


But currently, the fact is,  drm_fb_helper.c still initializes lots of 
data structure come from fbdev world.

For example, the drm_fb_helper_fill_fix() and drm_fb_helper_fill_var()  
in drm_fb_helper_fill_info() function.

This saying implicitly that the fbdev-generic is a glue layer which copy 
damage frame buffer data

from the front end(fbdev layer) to its drm backend.  It's not a 100% 
replacement its fbdev front end,

rather, it relay on it.


> so if we have issue with limit
> checks blowing up it makes more sense to check them against drm limits.
> Plus a lot more people understand those than fbdev. They should all match
> anyway, or if they dont, we have a bug.

Yes, this is really what I'm worry about.

I see that  members of struct fb_var_screeninfo can be changed by 
user-space. For example, xoffset and yoffset.

There is no change about 'info->var.xres' and 'info->var.yres' from the 
userspace,

therefore, they should all match in practice.


User-space can choose a use a smaller dispaly area than 'var.xres x 
var.yres',

but that is implemented with 'var.xoffset' and 'var.xoffset'.

But consider that the name 'var', which may stand for 'variation' or 
'vary'. This is terrifying.

I imagine, with a shadow buffer, the front end can do any modeset on the 
runtime freely,

including change the format of frame buffer on the runtime.  Just do not 
out-of-bound.

The middle do the conversion on the fly.


We might also create double shadow buffer size to allow the front end to 
pan?

> The thing is, if you change this
> further to just pass the drm_framebuffer, then this 100% becomes a drm
> function, which could be used by anything in drm really.

I agree with you.

If I use fb_width/fb_height directly and bypassing 'info->var.xres" and 
"info->var.yres",

the code style diverged then. As far as I am understanding,  the clip 
happen on the front end,

the actual damage update happen at back end.

Using the data structure come with the front end is more reasonable for 
current implement.

> But also *shrug*.

I can convert this single function to 100% drm with another patch.

But, maybe there also have other functions are not 100% drm

I would like do something to help achieve this in the future,

let me help to fix this bug first?

> -Daniel
