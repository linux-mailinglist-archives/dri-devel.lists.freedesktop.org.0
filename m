Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB146F2A4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A8610E177;
	Thu,  9 Dec 2021 17:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6FB10E177
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 17:58:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t18so11043263wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FbKdKTlNvOZTPqWdf9KLrts7pIKJ4noiQI6tgMHVFus=;
 b=noKGFs8Q+4eWgQNiVZJvHBZN+0ht/EMnKMRGXMlDn/ZYX2TXOH2GV6p8kbd5G/Z1sv
 s4hCjaffDcFzyJKO7NjZTzFHPwWbc2m3Mv+udIqCCmX1Ai7m3Gb6kjwkw8fY+XROduYz
 RvUOR8NYgYo+w0C7beQZn4WWj0v3ec5AuqUFLZwRvDAh0ivBAc6kW0Zay0p7XO2BZYxg
 KiXgojz4xS9arowVEt+AzcGtq5LGQFjKS6AssS9LVgQ9b+4HqkPcmKvcf7JHLQZ9DH3r
 Vj+fHNwCrnKJRTKfp51WUuodFtHjhXi0zQG/NsZNN3XuKQB3ESoau59erkflA+C6SDa7
 +c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbKdKTlNvOZTPqWdf9KLrts7pIKJ4noiQI6tgMHVFus=;
 b=wWx+iZJuMsnEWKmQNCi/5XvedyBSD4wz5sTTaMxyzwPqstoZY9hzm9S2lO6C0punHf
 YJfoXqtWz9Al1+Q7CpwDYKXCAb2vnqSznFtvtEP8jumqTa507AdjsRHZ/G4GIwvfrNDN
 kwRbZ0WZJCKTj3Bug8Y6nPzG0Xa4DkZ080M6Mr/3ZVDhvHqjyOyogwcQSHSKXYp4n114
 gw2DcoifwDgZw42qFINotBHAy30w2eNwIJZqH4ayB+ntBkPmEQJPtNPdoIqP6OiosL6F
 D9Hh2kK2/2nG0WJSky+aUwiGEOYlfA1vmOC/cuwcgnwa8LyWaPGqojSESOxkHiHRMLID
 PDMg==
X-Gm-Message-State: AOAM533K/4l4IJl/tsZVSiuLF37OFT/YHH4naEZdlXLu1BIsjGw8ASaX
 HYWWvOZS988WhjoTA6aC7KeCkm1VxBgesXupjmibcg==
X-Google-Smtp-Source: ABdhPJwezHUaU5Kg2uskyPhHc+KeM2L83FIwIRh1S8wuCID9bQhQeGNKGeboVYybrze2WYAxg7m32YD4n1RekaYqg08=
X-Received: by 2002:a5d:4883:: with SMTP id g3mr8130890wrq.590.1639072704891; 
 Thu, 09 Dec 2021 09:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20211016145827.586870-1-michael@amarulasolutions.com>
 <CAOf5uw=DffhS=WAh-OFXOCO+4kd5ey=2Eqf0Zhyrgd_d5D8meA@mail.gmail.com>
In-Reply-To: <CAOf5uw=DffhS=WAh-OFXOCO+4kd5ey=2Eqf0Zhyrgd_d5D8meA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 9 Dec 2021 17:58:10 +0000
Message-ID: <CAPY8ntCvAnu9HS1WxWRkveXnQ_vD8EOdshX-ob8vGuGqOKp+RA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Avoid unbalance
 prepare/unprepare
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael

On Thu, 9 Dec 2021 at 16:58, Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi all
>
> On Sat, Oct 16, 2021 at 4:58 PM Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > All the panel driver check the fact that their prepare/unprepare
> > call was already called. It's not an ideal solution but fix
> > for now the problem on ili9881c
> >
> > [ 9862.283296] ------------[ cut here ]------------
> > [ 9862.288490] unbalanced disables for vcc3v3_lcd
> > [ 9862.293555] WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2851
> > _regulator_disable+0xd4/0x190
> >
> > from:
> >
> > [ 9862.038619]  drm_panel_unprepare+0x2c/0x4c
> > [ 9862.043212]  panel_bridge_post_disable+0x18/0x24
> > [ 9862.048390]  dw_mipi_dsi_bridge_post_disable+0x3c/0xf0
> > [ 9862.054153]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
> >
> > and:
> >
> > [ 9862.183103]  drm_panel_unprepare+0x2c/0x4c
> > [ 9862.187695]  panel_bridge_post_disable+0x18/0x24
> > [ 9862.192872]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
> > [ 9862.199117]  disable_outputs+0x120/0x31c

This is down to the dw-mipi-dsi driver calling the post_disable hook
explicitly at [1], but then also allowing the framework to call it.
The explicit call is down to limitations in the DSI support, so we
can't control the DSI host state to a fine enough degree (an ongoing
discussion [2] [3]). There shouldn't be a need to handle mismatched
calling in individual panel drivers.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L894
[2] https://lists.freedesktop.org/archives/dri-devel/2021-November/332060.html
[3] https://lists.freedesktop.org/archives/dri-devel/2021-December/334007.html


> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > index 103a16018975..f75eecb0e65c 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > @@ -52,6 +52,8 @@ struct ili9881c {
> >
> >         struct regulator        *power;
> >         struct gpio_desc        *reset;
> > +
> > +       bool                    prepared;
> >  };
> >
>
> I found that this can be a general problem. Should not mandatory to
> track panel status
>
> DRM_PANEL_PREPARED
> DRM_PANEL_ENABLED
>
> Michael
> >  #define ILI9881C_SWITCH_PAGE_INSTR(_page)      \
> > @@ -707,6 +709,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
> >         unsigned int i;
> >         int ret;
> >
> > +       /* Preparing when already prepared is a no-op */
> > +       if (ctx->prepared)
> > +               return 0;
> > +
> >         /* Power the panel */
> >         ret = regulator_enable(ctx->power);
> >         if (ret)
> > @@ -745,6 +751,8 @@ static int ili9881c_prepare(struct drm_panel *panel)
> >         if (ret)
> >                 return ret;
> >
> > +       ctx->prepared = true;
> > +
> >         return 0;
> >  }
> >
> > @@ -770,10 +778,16 @@ static int ili9881c_unprepare(struct drm_panel *panel)
> >  {
> >         struct ili9881c *ctx = panel_to_ili9881c(panel);
> >
> > +       /* Unpreparing when already unprepared is a no-op */
> > +       if (!ctx->prepared)
> > +               return 0;
> > +
> >         mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> >         regulator_disable(ctx->power);
> >         gpiod_set_value(ctx->reset, 1);
> >
> > +       ctx->prepared = false;
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.25.1
> >
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com
