Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E866F036E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 11:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CDA10EB06;
	Thu, 27 Apr 2023 09:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F6710EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:34:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94a342f4c8eso241173266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682588061; x=1685180061;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yeIan/JSDyZwSjp844K7PXXJYLJPBH9WqpSlLW7EWXw=;
 b=d+foUqMtXryzKwaQEHwLbVfesxzZN5XUQk1OKzle14DYUHW1Kww29x3obq8TAnLRCc
 ndE7/WSqmz7QriOkBbsP2vEMPY9JT+cjbNM/TwM07p9qNsEg5u7vrlBlqSz4DjWoYZVr
 Lcdk9bDucIihtEQyjJg0g5T5zzscAzmuzH5S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588061; x=1685180061;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeIan/JSDyZwSjp844K7PXXJYLJPBH9WqpSlLW7EWXw=;
 b=iQs3vcX3dXmzB90WUB1piS5ZWR/6qunFpLKgqYHO9RVwaVPPOTna7r1qE6w4jyZwRD
 Pm9BTGryh+rLupbjAAY//nvGtb9pOPttZYsSk4H5Muv/gxTjtaKM2aMhEVwkSICR+3ho
 wYE9fUJQdN7Zjd1ixegiN3Qn/f0d1rZrrveA9wMotxMt7cd/yL1VdDC5GNs45xbXNaxz
 fu/r9isFQeOlLRU6WOzgP8qLlCE8sg62mWsyuE5V98+t4Bg36IhZw0R4L5QzMiFHwTJz
 ilKHtckB4k7at8OTG4Sw8+QgoxWDpdM3MyhXSV2xfMr/YrrtdYyfvu89XEKZu2kdBJZS
 o0vg==
X-Gm-Message-State: AC+VfDwNsO3kL91Z2aI3cyrW65CZ+7epJ8oTo5+aqonXzI5HJv7OO3ko
 C+xrJ0kt6UXSmFw2TCMYQV/zBg==
X-Google-Smtp-Source: ACHHUZ4CHRi0qIYkapsekPN1tVRhqZj/jpDaiEZx0z3X0UZCcWHaTxdWYtC5ZnkkwJ+eYa47FbEtQA==
X-Received: by 2002:a17:906:7a08:b0:953:2918:71e7 with SMTP id
 d8-20020a1709067a0800b00953291871e7mr1035224ejo.5.1682588060892; 
 Thu, 27 Apr 2023 02:34:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 sb10-20020a1709076d8a00b00958079b676asm6817586ejc.122.2023.04.27.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 02:34:20 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:34:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Message-ID: <ZEpBmkf8CWMwZ/gr@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <15330273260@189.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
References: <20230413180622.1014016-1-15330273260@189.cn>
 <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
 <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
 <fab85750-dcb7-0eeb-cabc-8fcfcc84b11c@suse.de>
 <95ef7589-9775-5ad4-f09c-43bcd696823a@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ef7589-9775-5ad4-f09c-43bcd696823a@189.cn>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 02:47:24AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/4/17 15:29, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 14.04.23 um 12:58 schrieb Sui Jingfeng:
> > > Hi,
> > > 
> > > On 2023/4/14 03:16, Thomas Zimmermann wrote:
> > > > Hi,
> > > > 
> > > > thanks for the patch. This is effectively a revert of commit
> > > > 8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of GEM
> > > > buffer"). Please add a Fixes tag.
> > > > 
> > > > Am 13.04.23 um 20:06 schrieb Sui Jingfeng:
> > > > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > 
> > > > > The crazy fbdev test of IGT may write after EOF, which lead
> > > > > to out-of-bound
> > > > 
> > > > Please drop 'crazy'. :)
> > > 
> > > This is OK.
> > > 
> > > By using the world 'crazy',
> > > 
> > > I meant that the test is very good and maybe it is written by
> > > professional  peoples
> > > 
> > > with the guidance by  experienced  engineer. So that even the corner
> > > get tested.
> > > 
> > > 
> > > > 
> > > > > access for the drm drivers using fbdev-generic. For example,
> > > > > run fbdev test
> > > > > on a x86-64+ast2400 platform with 1680x1050 resolution will
> > > > > cause the linux
> > > > > kernel hang with following call trace:
> > > > > 
> > > > >    Oops: 0000 [#1] PREEMPT SMP PTI
> > > > >    [IGT] fbdev: starting subtest eof
> > > > >    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> > > > >    [IGT] fbdev: starting subtest nullptr
> > > > > 
> > > > >    RIP: 0010:memcpy_erms+0xa/0x20
> > > > >    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
> > > > >    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
> > > > >    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
> > > > >    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
> > > > >    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
> > > > >    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
> > > > >    FS:  0000000000000000(0000) GS:ffff895257380000(0000)
> > > > > knlGS:0000000000000000
> > > > >    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > >    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
> > > > >    Call Trace:
> > > > >     <TASK>
> > > > >     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
> > > > >     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
> > > > >     process_one_work+0x21f/0x430
> > > > >     worker_thread+0x4e/0x3c0
> > > > >     ? __pfx_worker_thread+0x10/0x10
> > > > >     kthread+0xf4/0x120
> > > > >     ? __pfx_kthread+0x10/0x10
> > > > >     ret_from_fork+0x2c/0x50
> > > > >     </TASK>
> > > > >    CR2: ffffa17d40e0b000
> > > > >    ---[ end trace 0000000000000000 ]---
> > > > > 
> > > > > The indirect reason is drm_fb_helper_memory_range_to_clip()
> > > > > generate damage
> > > > > rectangles which partially or completely go out of the
> > > > > active display area.
> > > > > The second of argument 'off' is passing from the user-space,
> > > > > this will lead
> > > > > to the out-of-bound if it is large than (fb_height + 1) *
> > > > > fb_pitches; while
> > > > > DIV_ROUND_UP() may also controbute to error by 1.
> > > > > 
> > > > > This patch will add code to restrict the damage rect
> > > > > computed go beyond of
> > > > > the last line of the framebuffer.
> > > > > 
> > > > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > ---
> > > > >   drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
> > > > >   drivers/gpu/drm/drm_fbdev_generic.c |  2 +-
> > > > >   2 files changed, 13 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > > > > b/drivers/gpu/drm/drm_fb_helper.c
> > > > > index 64458982be40..6bb1b8b27d7a 100644
> > > > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > > > @@ -641,19 +641,27 @@ static void
> > > > > drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x,
> > > > > u32 y,
> > > > >   static void drm_fb_helper_memory_range_to_clip(struct
> > > > > fb_info *info, off_t off, size_t len,
> > > > >                              struct drm_rect *clip)
> > > > >   {
> > > > > +    u32 line_length = info->fix.line_length;
> > > > > +    u32 fb_height = info->var.yres;
> > > > >       off_t end = off + len;
> > > > >       u32 x1 = 0;
> > > > > -    u32 y1 = off / info->fix.line_length;
> > > > > +    u32 y1 = off / line_length;
> > > > >       u32 x2 = info->var.xres;
> > > > > -    u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> > > > > +    u32 y2 = DIV_ROUND_UP(end, line_length);
> > > > > +
> > > > > +    /* Don't allow any of them beyond the bottom bound of
> > > > > display area */
> > > > > +    if (y1 > fb_height)
> > > > > +        y1 = fb_height;
> > > > > +    if (y2 > fb_height)
> > > > > +        y2 = fb_height;
> > > > >         if ((y2 - y1) == 1) {
> > > > >           /*
> > > > >            * We've only written to a single scanline. Try to reduce
> > > > >            * the number of horizontal pixels that need an update.
> > > > >            */
> > > > > -        off_t bit_off = (off % info->fix.line_length) * 8;
> > > > > -        off_t bit_end = (end % info->fix.line_length) * 8;
> > > > > +        off_t bit_off = (off % line_length) * 8;
> > > > > +        off_t bit_end = (end % line_length) * 8;
> > > > 
> > > > Please scratch all these changes. The current code should work
> > > > as intended. Only the generic fbdev emulation uses this code and
> > > > it should really be moved there at some point.
> > > 
> > > 
> > > Are you meant  that we should remove all these changes in
> > > drivers/gpu/drm/drm_fb_helper.c ?
> > 
> > As Daniel mentioned, there's the discussion in the other thread. I don't
> > want to reopen it here. Just to summarize: I'm not convinced that this
> > should be DRM code because it can be shared with other fbdev drivers.
> > 
> > [...]
> > 
> > > > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > b/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > index 8e5148bf40bb..b057cfbba938 100644
> > > > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> > > > > @@ -94,7 +94,7 @@ static int
> > > > > drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper
> > > > > *fb_helper,
> > > > >       fb_helper->buffer = buffer;
> > > > >       fb_helper->fb = buffer->fb;
> > > > >   -    screen_size = buffer->gem->size;
> > > > > +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
> > 
> > This has been bothering me over the weekend. And I think it's because
> > what we want the screen_size to be heigth * pitch,  but the mmap'ed
> > memory is still at page granularity. Therefore...
> > 
> > [...]
> > > > 
> > > > >       screen_buffer = vzalloc(screen_size);
> > 
> > ... this line should explicitly allocate multiples of pages. Something
> > like
> > 
> >     /* allocate page-size multiples for mmap */
> >     vzalloc(PAGE_ALIGN(screen_size))
> > 
> I just thought about your instruction at here, thanks!
> 
> But it is already page size aligned if we don't tough it.
> 
> It is guaranteed by the GEM memory manger,
> 
> so a previous patch tested by me, is turn out to be a extremely correct?
> 
> We exposed a  page size aligned buffer(even though it is larger than needed)
> is actually for mmap ?

mmap() is always page aligned, because that's the smallest size the cpu
pagetables can map. So there's fundamentally always a bit of memory at the
end of the buffer which logically is not part of the framebuffer memory.
And somehow we need to handle that to make sure we don't overflow.
-Daniel

> 
> 
> > It has not been a bug so far because vzalloc() always returns full pages
> > IIRC. It's still worth fixing.
> > 
> 
> > Best regards
> > Thomas
> > 
> > 
> > > > >       if (!screen_buffer) {
> > > > >           ret = -ENOMEM;
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
