Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A339675E3A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1BF10E134;
	Fri, 20 Jan 2023 19:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1680610E134
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 19:42:25 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 3so6790135vsq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 11:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2smM+yAWTiv5fXgEcxXSH5+gacjV2/xa7Y1VVuSpHVc=;
 b=dnbrvAFHX7LrcoYnwpJ/yzadPtwbcD2GTtvYuQk3deWwHwbho5aK5Kw3a33NE7qF80
 woqxumQwC6rgQ11cWHKeAsQQwNdOAV3oHUMA0cDBumNvLnF9b0r/dK1eghXfGTFO7bhF
 NytFYxYSfaAVBcgHj3nTa1jcFQ0v6bwMl56OYWyESwTakEoK9EUOOpQJAk23/0msE7ov
 NxPGuWwiebeic1yh8fEHZhZYaLBjD88abMUznBmim5riu4Xoy331xl8zqE7ztjHWHM80
 GmYQ9ZeOACOil3SNTuRtds9EM1JVLhB7wNKKS/EA5tQcZIToaavDxcpRIH9qHUR/VC6B
 gEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2smM+yAWTiv5fXgEcxXSH5+gacjV2/xa7Y1VVuSpHVc=;
 b=Sc7RiMiKD5MBU/jorZic9Jy/yKku8XeLqtkW/1vTHGHMLo3W4mbSWWjVhxf2fMbkZr
 lZb2F3hGUnLe1GsXGI6VOplFMqtepcg5nDJM950YhzfMdb2a+RIUTScGgLB11LPyrKhK
 diQlEsXcTilMcLkVnygkN/Qyq9SsxUCGr9Vbw8IraV3fAaaDQsLBvRtZk5Z68K6bOGiW
 5BCvyUSYtXzPhjIMmnGp150l+v8GZtsqEy8SqxlHK1ulQ+5xomW+SMK2lE2uXoccJnXz
 53xLVlS7FRIrhXHoBQk3doayOdNfokDf5U6EUN04gIyhG4Nl9a8ivBFEnct06IJkLVpc
 9CKA==
X-Gm-Message-State: AFqh2kozwr3RFgeIuIVqiC/ET22qE3mBAFrr2l7vTfgc3rXkE5BYnvkQ
 xFSlzs+yuU26cDmEgG4j59cI/6pj8ximJ88L4IJBBw==
X-Google-Smtp-Source: AMrXdXuVv09inmDMzECR3rvJhE7sMfC0Zb6V5CzqpmUDPa/fQN1hNEg6zum3S7L+bKt2Zwp44qqTbZlREFFQPNIUTaQ=
X-Received: by 2002:a67:d312:0:b0:3d4:542:12ad with SMTP id
 a18-20020a67d312000000b003d4054212admr2192444vsj.84.1674243744070; Fri, 20
 Jan 2023 11:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com>
 <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
 <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
In-Reply-To: <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Jan 2023 19:42:07 +0000
Message-ID: <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain
 order
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

On Fri, 20 Jan 2023 at 19:10, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Sat, Jan 21, 2023 at 12:26 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan
> >
> > Responding due to Marek's comment on the "Add Samsung MIPI DSIM
> > bridge" series, although I know very little about the Exynos
> > specifics, and may well be missing context of what you're trying to
> > achieve.
> >
> > On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Restore the proper bridge chain by finding the previous bridge
> > > in the chain instead of passing NULL.
> > >
> > > This establishes a proper bridge chain while attaching downstream
> > > bridges.
> > >
> > > Reviewed-by: Marek Vasut <marex@denx.de>
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v11:
> > > - add bridge.pre_enable_prev_first
> > > Changes for v10:
> > > - collect Marek review tag
> > >
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > index ec673223d6b7..9d10a89d28f1 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
> > >  {
> > >         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > >
> > > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> > > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > > +                                flags);
> >
> > Agreed on this change.
> >
> > >  }
> > >
> > >  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > > @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > >
> > >         drm_bridge_add(&dsi->bridge);
> > >
> > > -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> > > +       drm_bridge_attach(encoder, &dsi->bridge,
> > > +                         list_first_entry_or_null(&encoder->bridge_chain,
> > > +                                                  struct drm_bridge,
> > > +                                                  chain_node), 0);
> >
> > What bridge are you expecting between the encoder and this bridge?
> > The encoder is the drm_simple_encoder_init encoder that you've created
> > in exynos_dsi_bind, so separating that from the bridge you're also
> > creating here seems weird.
> >
> > >
> > >         /*
> > >          * This is a temporary solution and should be made by more generic way.
> > > @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> > >         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> > >         dsi->bridge.of_node = dev->of_node;
> > >         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> > > +       dsi->bridge.pre_enable_prev_first = true;
> >
> > Setting dsi->bridge.pre_enable_prev_first on what is presumably the
> > DSI host controller seems a little odd.
> > Same question again - what bridge are you expecting to be upstream of
> > the DSI host that needs to be preenabled before it? Whilst it's
> > possible that there's another bridge, I'd have expected that to be the
> > first link from your encoder as they appear to both belong to the same
> > bit of driver.
>
> Let me answer all together here. I can explain a bit about one of the
> pipelines used in Exynos. Exynos DSI DRM drivers have some strict host
> initialization which is not the same as what we used in i.MX8M even
> though it uses the same DSIM IP.
>
> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>
> Here MIC is the bridge, Exynos DSI is the bridge and the requirement
> is to expect the upstream bridge to pre_enable first from DSI which
> means the MIC.

That makes sense for the pre_enable_prev_first flag.

The drm_bridge_attach(... list_first_entry_or_null) still seems a
little weird. I think you are making the assumption that there is only
ever going to be the zero or one bridge (the MIC) between encoder and
DSI bridge - the DSI bridge is linking itself to the first entry off
the encoder bridge_chain (or NULL to link to the encoder). Is that
reasonable? I've no idea!

I must confess to not having looked at the attaching sequence
recently, and I'm about to head home for the weekend.
I have no real knowledge of how Exynos is working, and am aware that
you're having to rejuggle stuff to try and support i.MX8M and Exynos,
so leave that one up to you.

Cheers
  Dave
