Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE425DA2E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1986E29E;
	Fri,  4 Sep 2020 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C256E151
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:42:56 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id v16so5865769otp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCjhFigRCnxuR+n/x42/B7BmTnslOFqpAi74/rceJjU=;
 b=N/iFzTCfxZsmpLptZRvTvYDbSSOkE57O8xGBA5IxeEtaOV/VTKg+N1rk3mU68vKu2S
 irFtQ8XW+y25YgfP17RgoBVlKiim0p8fbJbAIc5yC1pzHEtVFl3MrBv18nS2Jh0/UwAA
 wYjTYzcRqq8txj8zFs91yyYSCewV6aCdzX7TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCjhFigRCnxuR+n/x42/B7BmTnslOFqpAi74/rceJjU=;
 b=JO8EM8pu05vvCrILrDct9/prttBX9vYdmWZTBJ1Miy/SUjkQEibuqPsQ7DvEwSDLql
 4WMclQfQBfersEhVRFfzhQmPKoi0vITMEcM7DE9DvpfeNJKIOPLB4FOoqGpjbiVJiDFZ
 ltsGcTFMHiFOkxd+DLgwvgueQR1iK9+KF2H+Ls1610nGB4LX09HSb8ArAKrpsw4tOUU5
 xUKHNzcOdGBuaqdhKv411rCl5PU8LkxTfW8vHTanq0+c5fDWz25tZERQswasTBRqQbIq
 DsLpIeIDdJQi87T7c2uPxv7JpF1trIWkjWuS9LO5jt/qIdsgQZxvufEEMEUpDX5pwj1G
 XiDA==
X-Gm-Message-State: AOAM5321kaUaJgPlBf/T04Gh0tJd7zT1amRQca+H8OwE1j0vrIGtP8HQ
 lUHdpe0EyNrXLdupuSMT442tWXxnJv2nF3ZIKx8x4g==
X-Google-Smtp-Source: ABdhPJz4AYLB9qLfFgbnbP6K9rXahHrgbv4wnKxqLFilnKxCQUuStOeetrn1PBik1eVM/WaQCCX9X604j9cuANASCjU=
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr5746866otm.281.1599226975701; 
 Fri, 04 Sep 2020 06:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-41-daniel.vetter@ffwll.ch>
 <20200424164626.GD3822@ravnborg.org>
In-Reply-To: <20200424164626.GD3822@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 4 Sep 2020 15:42:44 +0200
Message-ID: <CAKMK7uGcNnFqcwAQMSOuvCeX==vbtbRNe88cgr-yeuWiFJaUcQ@mail.gmail.com>
Subject: Re: [PATCH 40/59] drm/arcpgu: Stop using drm_device->dev_private
To: Sam Ravnborg <sam@ravnborg.org>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 6:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> On Wed, Apr 15, 2020 at 09:40:15AM +0200, Daniel Vetter wrote:
> > Upcasting using a container_of macro is more typesafe, faster and
> > easier for the compiler to optimize.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
>
> Subject: drm/arc: arcpgu: Stop using drm_device->dev_private
>
> And another bikeshedding below.
> With this considered:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> > ---
> >  drivers/gpu/drm/arc/arcpgu.h      | 2 ++
> >  drivers/gpu/drm/arc/arcpgu_crtc.c | 4 ++--
> >  drivers/gpu/drm/arc/arcpgu_drv.c  | 4 +---
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> > index cd9e932f501e..87821c91a00c 100644
> > --- a/drivers/gpu/drm/arc/arcpgu.h
> > +++ b/drivers/gpu/drm/arc/arcpgu.h
> > @@ -17,6 +17,8 @@ struct arcpgu_drm_private {
> >       struct drm_plane        *plane;
> >  };
> >
> > +#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
> > +
> Preferred name is to_arcgpu(). There is no device in the name of struct
> arcpgu_drm_private. And the general consensus it to use to_<driver> for
> the top-level struct.

[Sorry just realized I never replied on-list for this here]

drm_device very much has a dev_  and there's some other drivders with
this pattern too. Plus I think it's more consistent with the other
macros in here. For simple drivers where there's only 1 structure I
agree though, so if you insist I can follow up with a patch. Fixing
this in-series is imo too much trouble for the benefit, every single
patch would need to be redone ...

Cheers, Daniel

>
> >  #define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
> >
> >  static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
> > diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > index be7c29cec318..ba796a216244 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > @@ -178,7 +178,7 @@ static const struct drm_plane_funcs arc_pgu_plane_funcs = {
> >
> >  static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
> >  {
> > -     struct arcpgu_drm_private *arcpgu = drm->dev_private;
> > +     struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> >       struct drm_plane *plane = NULL;
> >       int ret;
> >
> > @@ -202,7 +202,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
> >
> >  int arc_pgu_setup_crtc(struct drm_device *drm)
> >  {
> > -     struct arcpgu_drm_private *arcpgu = drm->dev_private;
> > +     struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> >       struct drm_plane *primary;
> >       int ret;
> >
> > diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> > index bbd7acb150f3..81b8d7ae6623 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> > @@ -50,8 +50,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
> >       struct resource *res;
> >       int ret;
> >
> > -     drm->dev_private = arcpgu;
> > -
> >       arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
> >       if (IS_ERR(arcpgu->clk))
> >               return PTR_ERR(arcpgu->clk);
> > @@ -120,7 +118,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
> >  {
> >       struct drm_info_node *node = (struct drm_info_node *)m->private;
> >       struct drm_device *drm = node->minor->dev;
> > -     struct arcpgu_drm_private *arcpgu = drm->dev_private;
> > +     struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> >       unsigned long clkrate = clk_get_rate(arcpgu->clk);
> >       unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
