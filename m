Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54806290A3A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C34D6EE33;
	Fri, 16 Oct 2020 17:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D356EE33
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:05:52 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 65so3021391otu.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O5f+3oj+TwUQPNJQsWWl411nUDhHVWBggLYhnTQhi1Q=;
 b=ioIx38hkSjIDSjpI9GwQackDMvJSh1tWQXU1CqueuEaaVDCj+9M0z6qhgr9Vqg28sO
 PdhccWFgXm1Oi0g9uQjo1l89XjvegZigbt/d1pf08TCfubrYpHcu8CPZ2ZROMG1+y7gi
 rbtVOwx0Vd/v5B8O7ZzNwlsCmMiIJQUv2iZ8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5f+3oj+TwUQPNJQsWWl411nUDhHVWBggLYhnTQhi1Q=;
 b=QW1TB6p1bnP2zmomrnl07/oFrPlvUsajsVHKIMhnak5VrDnAttFNcDXoHk0iZrlWU1
 ooSHpWOVq0Ggco8b5anLFhVexz/FF8IT1kkgxYmJL+JMKZJZvh5JruEhEVno/WqwGkNa
 gGhWZZTClZgMEfgocTaB/GB51ogMDHT1E96n/NRUKg9VGk82MytnjyJiBsaYB3fJJMe1
 wKzyCeqpYF1QROpE8Jmh506xYbdXrxycyfBpyKwGjkGhqKanhesRRSxKw0fB1vXf1hA6
 BUVZfY+t6Q6exC0iUdBNoVtl88UVBJ0ivZxxj2eo1Bo0ajd01M+7Clb8kFg7I4EFsMZx
 to1g==
X-Gm-Message-State: AOAM533jXD1I6UIuRifg9yDm3BZrLYRQAhuVGwxCVaHCTh24Fc0sbbrD
 yWOM+lRf4NAhnM9IWc3HiI1wRr1gY/Z0xSemAywpzg==
X-Google-Smtp-Source: ABdhPJzM7HPi0p7a0DZZ7J46yhLKwgiLs0EemwDAsTq1PhmR9gppnqDle6wa+WqA8NbWlRpxyE5y1ZzxcCMPyDw87nY=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr3503945ote.188.1602867951779; 
 Fri, 16 Oct 2020 10:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
 <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
 <20201016170203.53wjzysqh2p7rfry@smtp.gmail.com>
In-Reply-To: <20201016170203.53wjzysqh2p7rfry@smtp.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 16 Oct 2020 19:05:40 +0200
Message-ID: <CAKMK7uGm6tiQmn34PeJC=0r7NUmHpYtTbXVcOfDdQ=vwJiqMRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 7:02 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On 10/16, Daniel Vetter wrote:
> > On Fri, Oct 16, 2020 at 12:38 PM Simon Ser <contact@emersion.fr> wrote:
> > >
> > > > The only thing we support is xrgb8888.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > index 726801ab44d4..eb4007443706 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> > > >       dev->mode_config.max_height = YRES_MAX;
> > > >       dev->mode_config.cursor_width = 512;
> > > >       dev->mode_config.cursor_height = 512;
> > > > -     dev->mode_config.preferred_depth = 24;
> > > > +     dev->mode_config.preferred_depth = 32;
> > >
> > > Are you sure xrgb8888's depth is 32 and not 24? Looking at drmdb [1], *all*
> > > drivers set it to 24.
> >
> > Uh there's a problem I think. Depth should indeed stay at 24, the
> > problem is that fb helpers directly take that to be the bpp parameter,
> > which is a different thing. And if you look at how most drivers set up
> > that, they pick 32.
> >
> > I guess I need to revert this here, and unconfuse the fb helpers about
> > depth vs bpp.
>
> Hi guys,
>
> Perhaps it deserves to be pointed out: the documentation says
> "preferred_depth: preferred RBG(sic) pixel depth, used by fb helpers",
> and looking to fb helpers, preferred_depth is only used by
> generic_setup, as bits by pixel (if I didn't miss something there).
>
> In fact, the alpha channel is not used for final display (perhaps in the
> future); however, I saw another driver with a change similar to this
> here and, possibly like me, following the same misunderstanding.

Yeah the problem is that preferred_depth is depth, and that means 24
bit for XRGB8888. But bpp as used by fb helpers would be 32 bit for
XRGB8888.

I think the real fix here is to switch this entire mess over to using
drm_fourcc codes directly, at least for atomic drivers. Which nowadays
are most. Interim I'm not sure whether we should revert my patch (it
breaks fbdev) or switch preferred_depth to 0, which means we get the
default every, and that means both fbdev helpers and userspace will
pick XRGB8888.
-Daniel

> Melissa
> >
> > Maybe best would be to just switch over to preferred drm_fourcc format
> > code, or maybe just pick this up from the first format the primary
> > plane supports.
> >
> > This is all getting slightly tricky and a lot more work :-/
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
