Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929D6E35E7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 09:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829A610E1A4;
	Sun, 16 Apr 2023 07:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AF410E25E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 07:54:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso204983a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681631648; x=1684223648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ha9uwwafJwu0qiMWOb3f2JWbnEwBHyvfri1PsX/B3II=;
 b=aUwvWFTlaxXgDXcawvcY+NhPHy0noeXL5CnXl0jbUqOSvN/fIRaJ772fPCD0eLQJMW
 9XypAW0JjSnJGkgm5pa4LcxeDN2UJ7FMtFjRFNAguSF15R/G1eoTBCq9HTUewYaGp+sH
 L/CF4nDqQ0UkCoOuF1tQIlUJYcUdBL8akg5sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681631648; x=1684223648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ha9uwwafJwu0qiMWOb3f2JWbnEwBHyvfri1PsX/B3II=;
 b=MCQx5sih4UQDOzX3JK40nttBaBRuee3SQ/xt0e9sm9fzd6tGYuX0HKvxwMwjsLv0gU
 cZgHMGCMeoN9oa3aT1fShPwEqla3it3XjBLqIyNUjh23l14Px/oH9S/CSskVr8GVK9Az
 ee2iSMpotdDFsP8vn6jnu8IBb4d+yv/NiYeEujCIzqmARSJN8U0vuKZ19wNsavtfY+3Q
 +KkXMmHsYAG2PX3r85U7/8Lnt5Oa6iV2Az8XhbUo1sW95f8bzJ1Ri/Hq5qAJ//czJLHj
 lWB4NlyDHH0Wj+pdaDWg2fvqIfv4XBlAwMcggryu0b25RIXgy3svEB73lhnVxJepqOUv
 Bf9Q==
X-Gm-Message-State: AAQBX9cmVITBYf4bi7BRppqit5afQZnGQhBtnl7rwiOSVA5C4AJyvBr4
 o3/MGBoK9//PhnCdf/yiuJkCGQ==
X-Google-Smtp-Source: AKy350YPaFc1T3gjy+N63m54HnuoGFOgu1aKNm7+MKDUqXOKaOZX4LKw8s+FHxQzJB9DpsxutXhXcg==
X-Received: by 2002:a17:906:105c:b0:94f:3e05:c6ee with SMTP id
 j28-20020a170906105c00b0094f3e05c6eemr1586267ejj.7.1681631647938; 
 Sun, 16 Apr 2023 00:54:07 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ds12-20020a170907724c00b0094f556a941dsm448651ejc.49.2023.04.16.00.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 00:54:07 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:54:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Message-ID: <ZDupneqV/GXtkSml@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <15330273260@189.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 suijingfeng <suijingfeng@loongson.cn>
References: <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
 <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
 <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
 <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
 <e84b5123-0360-9ec5-489e-2c5fc6b650ba@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e84b5123-0360-9ec5-489e-2c5fc6b650ba@189.cn>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 07:30:53PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/4/14 15:56, Daniel Vetter wrote:
> > On Fri, 14 Apr 2023 at 09:34, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Hi
> > > 
> > > Am 14.04.23 um 07:36 schrieb Daniel Vetter:
> > > > On Fri, 14 Apr 2023 at 06:24, Sui Jingfeng <15330273260@189.cn> wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2023/4/14 04:01, Daniel Vetter wrote:
> > > > > > On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
> > > > > > > Hi
> > > > > > > 
> > > > > > > Am 13.04.23 um 20:56 schrieb Daniel Vetter:
> > > > > > > [...]
> > > > > > > > This should switch the existing code over to using drm_framebuffer instead
> > > > > > > > of fbdev:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > > > > > > index ef4eb8b12766..99ca69dd432f 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > > > > > > @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> > > > > > > >      static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
> > > > > > > >                                              struct drm_rect *clip)
> > > > > > > >      {
> > > > > > > > +   struct drm_fb_helper *helper = info->par;
> > > > > > > > +
> > > > > > > >       off_t end = off + len;
> > > > > > > >       u32 x1 = 0;
> > > > > > > >       u32 y1 = off / info->fix.line_length;
> > > > > > > > -   u32 x2 = info->var.xres;
> > > > > > > > -   u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> > > > > > > > +   u32 x2 = helper->fb->height;
> > > > > > > > +   unsigned stride = helper->fb->pitches[0];
> > > > > > > > +   u32 y2 = DIV_ROUND_UP(end, stride);
> > > > > > > > +   int bpp = drm_format_info_bpp(helper->fb->format, 0);
> > > > > > > Please DONT do that. The code here is fbdev code and shouldn't bother about
> > > > > > > DRM data structures. Actually, it shouldn't be here: a number of fbdev
> > > > > > > drivers with deferred I/O contain similar code and the fbdev module should
> > > > > > > provide us with a helper. (I think I even had some patches somewhere.)
> > > > > > Well my thinking is that it's a drm driver,
> > > > > Yes, I actually agree with this, and the code looks quite good. And I
> > > > > really want to adopt it.
> > > > > 
> > > > > Because here is DRM, we should emulate the fbdev in the DRM's way.
> > > > > 
> > > > > The DRM is really the big brother on the behind of emulated fbdev,
> > > > > 
> > > > > who provide the real displayable backing memory and scant out engine to
> > > > > display such a buffer.
> > > > > 
> > > > > 
> > > > > But currently, the fact is,  drm_fb_helper.c still initializes lots of
> > > > > data structure come from fbdev world.
> > > > > 
> > > > > For example, the drm_fb_helper_fill_fix() and drm_fb_helper_fill_var()
> > > > > in drm_fb_helper_fill_info() function.
> > > > > 
> > > > > This saying implicitly that the fbdev-generic is a glue layer which copy
> > > > > damage frame buffer data
> > > > > 
> > > > > from the front end(fbdev layer) to its drm backend.  It's not a 100%
> > > > > replacement its fbdev front end,
> > > > > 
> > > > > rather, it relay on it.
> > > > > 
> > > > > 
> > > > > > so if we have issue with limit
> > > > > > checks blowing up it makes more sense to check them against drm limits.
> > > > > > Plus a lot more people understand those than fbdev. They should all match
> > > > > > anyway, or if they dont, we have a bug.
> > > > > Yes, this is really what I'm worry about.
> > > > > 
> > > > > I see that  members of struct fb_var_screeninfo can be changed by
> > > > > user-space. For example, xoffset and yoffset.
> > > > > 
> > > > > There is no change about 'info->var.xres' and 'info->var.yres' from the
> > > > > userspace,
> > > > > 
> > > > > therefore, they should all match in practice.
> > > > > 
> > > > > 
> > > > > User-space can choose a use a smaller dispaly area than 'var.xres x
> > > > > var.yres',
> > > > > 
> > > > > but that is implemented with 'var.xoffset' and 'var.xoffset'.
> > > > > 
> > > > > But consider that the name 'var', which may stand for 'variation' or
> > > > > 'vary'. This is terrifying.
> > > > > 
> > > > > I imagine, with a shadow buffer, the front end can do any modeset on the
> > > > > runtime freely,
> > > > > 
> > > > > including change the format of frame buffer on the runtime.  Just do not
> > > > > out-of-bound.
> > > > > 
> > > > > The middle do the conversion on the fly.
> > > > > 
> > > > > 
> > > > > We might also create double shadow buffer size to allow the front end to
> > > > > pan?
> > > > Yeah so the front should be able to pan. And the front-end can
> > > > actually make xres/yres smalle than drm_fb->height/width, so we _have_
> > > > to use the fb side of things. Otherwise it's a bug I just realized.
> > > What are you talking about?  The GEM buffer is a full fbdev framebuffer,
> > > which is screen resolution multiplied by the overall factor.  The shadow
> > > buffer is exactly the same size. You can already easily pan within these
> > > buffers.
> > > 
> > > There's also no need/way to change video modes or formats in the shadow
> > > buffer. If we'd ever support that, it would be implemented in the DRM
> > > driver's modesetting.  The relationship between GEM buffer and shadow
> > > buffer remains unaffected by this.
> > Try it and be amazed :-) I've seen enough syzkaller bugs and screamed
> > at them that yes we do this. Also xres/yres is the wrong thing even if
> > you don't use fb ioctl to change things up in multi-monitor cases (we
> > allocate the drm_fb/fbdev virtual size to match the biggest
> > resolution, but then set fbinfo->var.x/yres to match the smallest to
> > make sure fbcon is fully visible everywhere).
> > 
> > I think you're confusion is the perfect case for why we really should
> > use fb->height/width/pitches[0] here.
> > -Daniel
> 
> Exactly,
> 
> This what I'm worry about, if someone add code with changing xres/yres from
> userspace
> 
> via fb ioctl implemented.  Then, xres/yres and fb->height/width/pitches[0]
> may not match.
> 
> so fetch data from fbinfo->var.x/yres still more safe.

Other way round, because what we stuff into the drm must be limited by
fb->height/width/pitches. If fbinfo->var.x/yres is wrong, then that's a
pontential problem.

> Yet, on our platform with drm/loongson driver with two screen,  I just
> tested,
> 
> fbinfo->var.x/yres do match the smallest of the display resolution.
> 
> V2 of this patch also have been respin, and sent, welcome to review.
> 
> 
> It also will be proved that it's more easy  to do the modeset on the
> emulated fbdev side.
> 
> It just adjust a few parameter, without the need of touch the real hardware.
> 
> The drm/GEM backend side do not need to do anything, just using their native
> display mode supported respectively.
> 
> Which allow the emulated fbdev side use the smaller display area freely and
> may support any resolution smaller
> 
> than the common display area.

This is already what's happening. Which is why looking at fbinfo->var is
risky (it can change and doesn't have a strict relationship to the reality
on the drm modeset side). Whereas drm_fb data is fixed, and is always
correct.

Note that it's not a problem when part of our damage clip is not visible,
the drm drivers take care of that. The only thing we must ensure is that
the damage rects are within the drm_framebuffer coodrinations.

The other thing I just realized is that we also allow changing
fbinfo->var.x/yoffset. Which means just checking against info->var.x/yres
is wrong when the buffer is panned. If we instead just check against
drm_framebuffer coordinations then we don't have that issue.

Also on this topic, there's als fb->offset[0]. If that's not zero, we
again have the issue that we limit the damage rect to the wrong area, but
luckily that's always zero. Would still be good to put a

	WARN_ON_ONCE(fb->offsets[0] != 0);

in the code to document that assumption.

Can you please respin v3 with all that?

Thanks, Daniel

> 
> > > Best regards
> > > Thomas
> > > 
> > > > The xres_virtual/yres_virtual should always match drm_fb sizes (but
> > > > we've had bugs in the past for that, only recently fixed all in
> > > > linux-next), because that's supposed to be the max size. And since we
> > > > never reallocate the fbdev emulation fb (at least with the current
> > > > code) this should never change.
> > > > 
> > > > But fundamentally you're bringing up a very good point, we've had
> > > > piles of bugs in the past with not properly validating the fbdev side
> > > > information in info->var, and a bunch of resulting bugs. So validating
> > > > against the drm side of things should be a bit more robust.
> > > > 
> > > > It's kinda the same we do for legacy kms ioctls: We translate that to
> > > > atomic kms as fast as possible, and then do the entire subsequent
> > > > validation with atomic kms data structures.
> > > > -Daniel
> > > > 
> > > > > > The thing is, if you change this
> > > > > > further to just pass the drm_framebuffer, then this 100% becomes a drm
> > > > > > function, which could be used by anything in drm really.
> > > > > I agree with you.
> > > > > 
> > > > > If I use fb_width/fb_height directly and bypassing 'info->var.xres" and
> > > > > "info->var.yres",
> > > > > 
> > > > > the code style diverged then. As far as I am understanding,  the clip
> > > > > happen on the front end,
> > > > > 
> > > > > the actual damage update happen at back end.
> > > > > 
> > > > > Using the data structure come with the front end is more reasonable for
> > > > > current implement.
> > > > > 
> > > > > > But also *shrug*.
> > > > > I can convert this single function to 100% drm with another patch.
> > > > > 
> > > > > But, maybe there also have other functions are not 100% drm
> > > > > 
> > > > > I would like do something to help achieve this in the future,
> > > > > 
> > > > > let me help to fix this bug first?
> > > > > 
> > > > > > -Daniel
> > > > 
> > > > 
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > > (HRB 36809, AG Nürnberg)
> > > Geschäftsführer: Ivo Totev
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
