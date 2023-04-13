Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09D6E117E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6A10EB71;
	Thu, 13 Apr 2023 15:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A0210EB72
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 15:56:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id p133so458858oih.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681401374; x=1683993374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xI05H8Uo8D59A90qnoGGHJXvZA5GYROlOh0UBkigVbY=;
 b=H/TRfT9+U6v/jjqn0HQ+OfFJF2KNBZwWA1Np6E+28z4T1ca1GjO8MEbjgZjtGvPfCM
 MrbwITRWqGZhfvOuoVPZDJSP6KBWff1C14DToHTcqh3PJ94x1JcVpfgTXkp9DkGPJUwF
 Ue9pjiIBzKCumlbof0G+h08guuIaES1utU9x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681401374; x=1683993374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xI05H8Uo8D59A90qnoGGHJXvZA5GYROlOh0UBkigVbY=;
 b=QPZDKCl+rEl45s6Km+9XCYSYkbu+U9KoE25EqKEUa4HK3B3SStY4TEwzh9J/A/f57D
 lV5RGifzYOGC3WnZUUmxUK9pJtqR/t+ghJpCaYppgMtTi3KCkUWQVyytzPbNwOs+NbPt
 8nK4mCWiR/lAjv4SP0gfw3WLe6A0ZShOfCZlTYJHO92tHr3/rTZ69VESeL/jAYc6l1tP
 KkfjmF80M/SPI3tK1WVp4fwQGUIRVurv+uBFE+RwYzQ9NLbwAAKoS0w4J31ZFP90PaXC
 EgQ1E6Ty97wuRCAROpK2QE+PxsB4ptNZxjTXXP3f/V6HWiJW/ETiuV4ap4gevPvc+TGb
 QI4w==
X-Gm-Message-State: AAQBX9dJI7xZF8eHahw01RUyRBFRsKAe1i8KWzz3cXURV4xmUomMuxGq
 HOr4earN8WPvTop2Nwmf9SKcp2wEHl+9vviIsI6LrA==
X-Google-Smtp-Source: AKy350bERUg030mIib51dPUCl4uXfYeU3Cf3w8uAl7aXlZyiGdAl+kQmCqt2EMVPl0fV3ktOLeWbRykSFSp6njS6UOk=
X-Received: by 2002:aca:1c0f:0:b0:38c:62c:ecec with SMTP id
 c15-20020aca1c0f000000b0038c062cececmr467879oic.8.1681401373662; Thu, 13 Apr
 2023 08:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
In-Reply-To: <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Apr 2023 17:56:02 +0200
Message-ID: <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023 at 17:35, Sui Jingfeng <15330273260@189.cn> wrote:
>
> Hi,
>
> On 2023/4/13 01:44, Daniel Vetter wrote:
> > On Thu, Apr 13, 2023 at 01:13:37AM +0800, Sui Jingfeng wrote:
> >> Hi,
> >>
> >> On 2023/4/11 22:53, Daniel Vetter wrote:
> >>> On Sun, Apr 09, 2023 at 09:21:10PM +0800, Sui Jingfeng wrote:
> >>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>>>
> >>>> We should setting the screen buffer size according to the screen's actual
> >>>> size, rather than the size of the GEM object backing the front framebuffer.
> >>>> The size of GEM buffer is page size aligned, while the size of active area
> >>>> of a specific screen is *NOT* necessarily page size aliged. For example,
> >>>> 1680x1050, 1600x900, 1440x900, 800x6000 etc. In those case, the damage rect
> >>>> computed by drm_fb_helper_memory_range_to_clip() goes out of bottom bounds
> >>>> of the display.
> >>>>
> >>>> Run fbdev test of IGT on a x86+ast2400 platform with 1680x1050 resolution
> >>>> will cause the system hang with the following call trace:
> >>>>
> >>>>     Oops: 0000 [#1] PREEMPT SMP PTI
> >>>>     [IGT] fbdev: starting subtest eof
> >>>>     Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> >>>>     [IGT] fbdev: starting subtest nullptr
> >>>>
> >>>>     RIP: 0010:memcpy_erms+0xa/0x20
> >>>>     RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
> >>>>     RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
> >>>>     RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
> >>>>     RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
> >>>>     R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
> >>>>     R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
> >>>>     FS:  0000000000000000(0000) GS:ffff895257380000(0000) knlGS:0000000000000000
> >>>>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>     CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
> >>>>     Call Trace:
> >>>>      <TASK>
> >>>>      ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
> >>>>      drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
> >>>>      process_one_work+0x21f/0x430
> >>>>      worker_thread+0x4e/0x3c0
> >>>>      ? __pfx_worker_thread+0x10/0x10
> >>>>      kthread+0xf4/0x120
> >>>>      ? __pfx_kthread+0x10/0x10
> >>>>      ret_from_fork+0x2c/0x50
> >>>>      </TASK>
> >>>>     CR2: ffffa17d40e0b000
> >>>>     ---[ end trace 0000000000000000 ]---
> >>>>
> >>>> We also add trival code in this patch to restrict the damage rect beyond
> >>>> the last line of the framebuffer.
> >>> Nice catch!
> >>   :)
> >>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >>>> ---
> >>>>    drivers/gpu/drm/drm_fb_helper.c     | 2 +-
> >>>>    drivers/gpu/drm/drm_fbdev_generic.c | 2 ++
> >>>>    2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >>>> index 64458982be40..a2b749372759 100644
> >>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>> @@ -645,7 +645,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
> >>>>            u32 x1 = 0;
> >>>>            u32 y1 = off / info->fix.line_length;
> >>>>            u32 x2 = info->var.xres;
> >>>> -  u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> >>>> +  u32 y2 = min_t(u32, DIV_ROUND_UP(end, info->fix.line_length), info->var.yres);
> >>> So for additional robustness I think it'd be good if we change the entire
> >>> computation here to use drm_framebuffer data and not fb_info data, because
> >>> fundamentally that's what the drm kms code consumes. It should all match
> >>> anyway, but I think it makes the code more obviously correct.
> >>>
> >>> So in the entire function instead of looking at fb_info->fix we should
> >>> probably look at
> >>>
> >>>     struct drm_fb_helper *helper = info->par;
> >>>
> >>> And then helper->fb->pitches[0] and helper->fb->height.
> >>>
> >>> If you agree would be great if you can please respin with that (and the
> >>> commit message augmented to explain why we do the change)?
> >> Yes, I'm agree.
> >>
> >> Thank you for guidance, I will refine this patch with `helper = info->par`.
> >>
> >> I will send a v2 when I finished.
> >>
> >>>>            if ((y2 - y1) == 1) {
> >>>>                    /*
> >>>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> >>>> index 8e5148bf40bb..a6daecb5f640 100644
> >>>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> >>>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> >>>> @@ -95,6 +95,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
> >>>>            fb_helper->fb = buffer->fb;
> >>>>            screen_size = buffer->gem->size;
> >>> I guess you forgot to remove this line here?
> >> Yes, this line should be removed in this patch. I overlooked this, sorry.
> >>
> >>> Also I'm not understanding
> >>> why this matters, I think you're fix only needs the above chunk, not this
> >>> one? If I got this right then please drop this part, there's drivers which
> >>> only use drm_fb_helper.c but not drm_fbdev_generic.c, and from what I can
> >>> tell they all still set the gem buffer size here.
> >>>
> >>> If otoh we need this too, then there's a few more places that need to be
> >>> fixed.
> >> I think we need this line, otherwise wrapped around will be happen.
> >>
> >> Because I found that the value of variable`y1` will be larger in number than
> >> the variable `y2` by 1,
> >>
> >> which are computed  in drm_fb_helper_memory_range_to_clip().
> >>
> >>
> >> This phenomenon will emerged on platforms with large page size or
> >>
> >> non page size divisiable display resolution case. Take the LoongArch and
> >> Mips as an example,
> >>
> >> the default page size is 16KB(to avoid cache alias).  Even with the most
> >> frequently used
> >>
> >> 1920x1080 screen, the screen_size can not be divided exactly.
> >>
> >> The total size of the shadow buffer is 1920x1080x4 bytes, 1920x1080x4 /
> >> 16384 = 506.25
> >>
> >> TTM manage the vram in the term of pages, so TTM will allocate 507 pages for
> >> us.
> >>
> >> 507x16384 = 8306688 bytes.
> >>
> >>
> >> drm_fb_helper_memory_range_to_clip() will be called when running fbdev eof
> >> test in the IGT.
> >>
> >> with 8306688 as its second parameter. while 8306688 / (1920x4) = 1081, this
> >> cause y1 out of bound.
> >>
> >> Simply restrict y2 with a min_t() function yeild 1080 in this case, but y2 -
> >> y1 cause *wrap around* here.
> >>
> >> because they are both unsigned number.
> >>
> >>
> >> drm_rect_init() function cast this unsigned int type to int type in end of
> >> drm_fb_helper_memory_range_to_clip(),
> >>
> >> but the last argument of drm_fb_helper_damage() function is a u32 type,
> >>
> >> it cast the return value of  drm_rect_height(&damage_area) back to unsigned
> >> type.
> >>
> >> Yet, another wrapped around with truncation happened in
> >> drm_fb_helper_add_damage_clip()
> >>
> >> called by subsequent drm_fb_helper_damage() function.
> >>
> >> I finally got reject by drm_fbdev_generic_helper_fb_dirty() with follow
> >> code:
> >>
> >> ```
> >>
> >>      /* Call damage handlers only if necessary */
> >>      if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
> >>          return 0;
> >>
> >> ```
> >>
> >> On x86-64 platform, because 1920x1080x4 dumb buffer is lucky, it be divided
> >> exactly by 4KB(page size).
> >>
> >> But other resolution will not as luck as this one. Right, fbdev test will be
> >> pasted, but wrap around
> >>
> >> happens many time.
> >>
> >> Therefore, as long as a larger buffer is allowed to exposed to the
> >> user-space.
> >>
> >> A chance is given to the user-space,  to go beyond of the bottom bound of
> >> the actual active display area.
> >>
> >> I not sure if this is intended, I feel it should not be allowable by
> >> intuition.
> > Ah yes, thanks for the in-depth explanation. But I think we need a
> > different fix, by also limiting y1. Otherwise for really big page sizes
> > (64k on arm64 iirc) and really small screens (there's i2c panels with just
> > a few lines) we might still run into the issue of y1 being too large.
> >
> > So we need to limit both y1 and y2. I think it's ok to let y1 == y2 slip
> > through, since as you point out that's filtered later on.
> >
> > The userspace api is that we should expose the full fbdev buffer and allow
> > writes into the entire thing. It's just that for the explicit upload with
> > damage rects we need to make sure we're staying within the real buffer.
> > -Daniel
> >
> Limiting y1 is easy, and this is necessary, because it is the crazy
> fbdev test of IGT writing after EOF intentionally.
>
> But there some difficulties for me to avoid using info->fix and info->var ,
>
> I found all other functions are surrounding the info->fix and info-var.
>
> There seems no good variable to replace info->var related data structure.
>
> Partially replacement may introduce confusion, this somewhat beyond my
> ability.
>
> I'm afraid of introducing out-of-bound in horizontal direction for
> multi-screen case.
>
> Using fb_info->fix is still more safe.
>
> Can I  respin my patch by still using fb_info->fix here?

Which one do you have an issue with finding the right drm variable? I
can help with that.
-Daniel

> >>>> +  screen_size = sizes->surface_height * buffer->fb->pitches[0];
> >>>> +
> >>>>            screen_buffer = vzalloc(screen_size);
> >>>>            if (!screen_buffer) {
> >>>>                    ret = -ENOMEM;
> >>> Cheers, Daniel
> >>>
> >>>> --
> >>>> 2.25.1
> >>>>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
