Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48C6E35EE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 09:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A2010E25B;
	Sun, 16 Apr 2023 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2C210E25B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 07:57:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-505050c7217so516304a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681631845; x=1684223845;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gtJHYf34q5XHBLZrbkb45GctzVWx9rTGSzHrSby/QgY=;
 b=Ti9/MRxSRdzPWqW0RYwRLTtNr74qABkqHXVTl+On0YMEBP+42siv/ZnKkkrENKGSwr
 vzhbWHZYnWESgrIJLj6xjfyOiIuCYIy+zqBjQrJ2lckebH3UCf3YXhfDjpW1rVsbivBB
 t2dqKZCasMmqKxv9Z+LnZY1IwZ8Dur3VBSu2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681631845; x=1684223845;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gtJHYf34q5XHBLZrbkb45GctzVWx9rTGSzHrSby/QgY=;
 b=HGdCYHOR38YQzSKiCU8nrAMkaVv2iIz3/7iGoPcTwnf+/ugHDRlI03JY2fTafk97S7
 qw3AGEzrIAiBlj8eqc2PXdybO5kqAFsjov//wf8VAtc+18vAOUcyQmN5emip37AIN2Pw
 qYq5rR9GuEBZKwJYu2L2SD0LcixQI+ltMJOpfOW2Mny2yeZgI7RvanMuclqqYAZg5fbb
 sXaUVjoZaVZ+/aPEsCpLl8oHOAYDonEhglrLqikLFPhilqhwHq9bbQqwtrlAr9DYLojK
 kalWOK93V0Hq5/W3L8HAe6RcG00Zl9LFzAdd79st8zjJXKGt177Tc15CZd3K3yTA0ppm
 IEdg==
X-Gm-Message-State: AAQBX9fZiXfu5DuHumNuUekRbY2wjoXJXhYNo9CqMyjn/33BP87hkgst
 6kYrHKGr4zsBpqWW+B9Bb7m5+g==
X-Google-Smtp-Source: AKy350ZEKF6pSHQAwX7U9jd1moWbzHCDav4v2WA5MqDlgkv5gaS3i7iF4huJqisz1hlqngRkHoTvVA==
X-Received: by 2002:a17:906:7a4e:b0:94e:d5d7:67eb with SMTP id
 i14-20020a1709067a4e00b0094ed5d767ebmr5972142ejo.5.1681631844811; 
 Sun, 16 Apr 2023 00:57:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b0094f05fee9d3sm2298246ejk.211.2023.04.16.00.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 00:57:24 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:57:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Message-ID: <ZDuqYp0RW9SngQ2H@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
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

On Fri, Apr 14, 2023 at 06:58:53PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/4/14 03:16, Thomas Zimmermann wrote:
> > Hi,
> > 
> > thanks for the patch. This is effectively a revert of commit
> > 8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of GEM
> > buffer"). Please add a Fixes tag.
> > 
> > Am 13.04.23 um 20:06 schrieb Sui Jingfeng:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > > The crazy fbdev test of IGT may write after EOF, which lead to
> > > out-of-bound
> > 
> > Please drop 'crazy'. :)
> 
> This is OK.
> 
> By using the world 'crazy',
> 
> I meant that the test is very good and maybe it is written by professional 
> peoples
> 
> with the guidance by  experienced  engineer. So that even the corner get
> tested.

'thoroughly' would be better word to describe that I think.

I think for the other discussions I've covered it all already in the other
thread.
-Daniel


> 
> 
> > 
> > > access for the drm drivers using fbdev-generic. For example, run
> > > fbdev test
> > > on a x86-64+ast2400 platform with 1680x1050 resolution will cause
> > > the linux
> > > kernel hang with following call trace:
> > > 
> > >    Oops: 0000 [#1] PREEMPT SMP PTI
> > >    [IGT] fbdev: starting subtest eof
> > >    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> > >    [IGT] fbdev: starting subtest nullptr
> > > 
> > >    RIP: 0010:memcpy_erms+0xa/0x20
> > >    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
> > >    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
> > >    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
> > >    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
> > >    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
> > >    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
> > >    FS:  0000000000000000(0000) GS:ffff895257380000(0000)
> > > knlGS:0000000000000000
> > >    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
> > >    Call Trace:
> > >     <TASK>
> > >     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
> > >     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
> > >     process_one_work+0x21f/0x430
> > >     worker_thread+0x4e/0x3c0
> > >     ? __pfx_worker_thread+0x10/0x10
> > >     kthread+0xf4/0x120
> > >     ? __pfx_kthread+0x10/0x10
> > >     ret_from_fork+0x2c/0x50
> > >     </TASK>
> > >    CR2: ffffa17d40e0b000
> > >    ---[ end trace 0000000000000000 ]---
> > > 
> > > The indirect reason is drm_fb_helper_memory_range_to_clip() generate
> > > damage
> > > rectangles which partially or completely go out of the active
> > > display area.
> > > The second of argument 'off' is passing from the user-space, this
> > > will lead
> > > to the out-of-bound if it is large than (fb_height + 1) *
> > > fb_pitches; while
> > > DIV_ROUND_UP() may also controbute to error by 1.
> > > 
> > > This patch will add code to restrict the damage rect computed go
> > > beyond of
> > > the last line of the framebuffer.
> > > 
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > ---
> > >   drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
> > >   drivers/gpu/drm/drm_fbdev_generic.c |  2 +-
> > >   2 files changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > > b/drivers/gpu/drm/drm_fb_helper.c
> > > index 64458982be40..6bb1b8b27d7a 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -641,19 +641,27 @@ static void drm_fb_helper_damage(struct
> > > drm_fb_helper *helper, u32 x, u32 y,
> > >   static void drm_fb_helper_memory_range_to_clip(struct fb_info
> > > *info, off_t off, size_t len,
> > >                              struct drm_rect *clip)
> > >   {
> > > +    u32 line_length = info->fix.line_length;
> > > +    u32 fb_height = info->var.yres;
> > >       off_t end = off + len;
> > >       u32 x1 = 0;
> > > -    u32 y1 = off / info->fix.line_length;
> > > +    u32 y1 = off / line_length;
> > >       u32 x2 = info->var.xres;
> > > -    u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> > > +    u32 y2 = DIV_ROUND_UP(end, line_length);
> > > +
> > > +    /* Don't allow any of them beyond the bottom bound of display
> > > area */
> > > +    if (y1 > fb_height)
> > > +        y1 = fb_height;
> > > +    if (y2 > fb_height)
> > > +        y2 = fb_height;
> > >         if ((y2 - y1) == 1) {
> > >           /*
> > >            * We've only written to a single scanline. Try to reduce
> > >            * the number of horizontal pixels that need an update.
> > >            */
> > > -        off_t bit_off = (off % info->fix.line_length) * 8;
> > > -        off_t bit_end = (end % info->fix.line_length) * 8;
> > > +        off_t bit_off = (off % line_length) * 8;
> > > +        off_t bit_end = (end % line_length) * 8;
> > 
> > Please scratch all these changes. The current code should work as
> > intended. Only the generic fbdev emulation uses this code and it should
> > really be moved there at some point.
> 
> 
> Are you meant  that we should remove all these changes in
> drivers/gpu/drm/drm_fb_helper.c ?
> 
> 
> But this changes are helps to prevent the damage box computed go out of
> bound,
> 
> the bound of the displayable shadow buffer on multiple display case.
> 
> It is the minimum width x height which could be fit in for all
> display/minotor.
> 
> 
> For example, one is 1920x1080 monitor, another is 1280x800 monitor.
> 
> connected to the motherboard simultaneously.
> 
> 
> Then, 1920x1080x4 (suppose we are using the XRGB) scanout buffer will be
> 
> allocate by the  GEM backend. But the the actual display area is 1280x800.
> 
> This is true at least for my driver on my platform, In this case,
> 
> ```
> 
>    info->var.xres ==1280;
> 
>    info->var.yres == 800;
> 
> ```
> 
> If don't restrict this, the damage box computed out of the bound of  (0, 0)
> ~ (1280, 800) rectangle.
> 
> a 1920x1080 damage box will came out.
> 
> 
> When running fbdev test of IGT, the smaller screen display will be OK.
> 
> but the larger screen, the area outsize of 1280x800 will also be written.
> 
> The background color became completely white from completely black before
> carry out the test,
> 
> luckily, linux kernel do not hung, this time.
> 
> 
> On multi-screen case, we still need to restrict the damage box computed,
> 
> Do not go out of 1280x800,  right?
> 
> 
> > 
> > >             x1 = bit_off / info->var.bits_per_pixel;
> > >           x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
> > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c
> > > b/drivers/gpu/drm/drm_fbdev_generic.c
> > > index 8e5148bf40bb..b057cfbba938 100644
> > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
> > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> > > @@ -94,7 +94,7 @@ static int
> > > drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
> > >       fb_helper->buffer = buffer;
> > >       fb_helper->fb = buffer->fb;
> > >   -    screen_size = buffer->gem->size;
> > > +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
> > 
> > I guess we simply go back to this line. I'd R-b a patch that does
> > exactly this.
> > 
> > But some explanation is in order. Maybe you can add this as a comment to
> > the computation, as it's not obvious:
> > 
> > The value of screen_size should actually be the size of the gem buffer.
> > In a physical framebuffer (i.e., video memory), the size would be a
> > multiple of the page size, but not necessarily a multiple of the screen
> > resolution. There are also pan fbdev's operations, and we could possibly
> > use DRM buffers that are not multiples of the screen width. But the
> > update code requires the use of drm_framebuffer_funcs.dirty, which takes
> > a clipping rectangle and therefore doesn't work well with these odd
> > values for screen_size.
> > 
> > Best regards
> > Thomas
> > 
> > >       screen_buffer = vzalloc(screen_size);
> > >       if (!screen_buffer) {
> > >           ret = -ENOMEM;
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
