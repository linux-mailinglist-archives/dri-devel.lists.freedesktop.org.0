Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39A4EDDB4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24910F3F0;
	Thu, 31 Mar 2022 15:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9310F3F6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:49 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id l129so146670pga.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fz5Ympz/RfsgfAZDBSdU8815ep6xTkidtcgqlrWxd/A=;
 b=RrSWXZT4XRELFzCxSCqzOPKgjWjAtuoYW+xmFvY2zv6mduFby3SbFqgKPNRysUzS9b
 mxl70JRtkXj+EFIh1RDAOKm0jIOKnRKT/ROmnu1OP4hyq6rPBSjQF9Pa2penosMODd0J
 /96XtFVFenOYLPXw+6vcVo7RuY1HfCjnj4Ep0z8D9pMi2wDhrnD1M/c4HUDitLJ8ZvU1
 468hRISV5lQbh+ETz8kF+8ZclIRQ8Zz4qM4kPGTp+Mq7Ta2JGWatooyRzH8uk6JhxYU+
 9ghVPTHond73yyB8IPRK1BYxi+goye+uJvwXLzUDhRI5wnjCuaAbbmPn+P5NFnIM7frN
 seDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fz5Ympz/RfsgfAZDBSdU8815ep6xTkidtcgqlrWxd/A=;
 b=h19OnBx/WLQOldY1i9PTTnLsPxFaaaQabrxD/CAHWCGIxP1TmjvE3dm2jP/Um/qElZ
 LGoexHZS3Am/m/1esuMtae7+8H48rsoAd3u6kv3tLtxlLIVUk6GZwdxQXbDkgHt/E4Gb
 Al32wfP2RRqzdFyPTuiCfGNHE5zhq1p2sVBZeGO8HJlPnM3toDA0u2Fkh1/B/n5fInPn
 21HW5DSM31W+uvv1T78B5/DdSlPD/0LRv06hPOyyFx7CCVYx8jJM1c7gPi4u5WW/mtkK
 LHOWxE74PVQjJ2aHQklMWXiIJMeKg6NzsKR+M54MFQNp/Tm83O8jZb1kYNASf1AGSR/o
 V04A==
X-Gm-Message-State: AOAM532gWp+TRxMHdndYHIN3HwkpOeBTa+Qt5Wdl5819Kw8qmqTmhmS7
 5KTqOZvfApsS06aiAHDhBfippuOBBZKv0IFhyWFzpQ==
X-Google-Smtp-Source: ABdhPJyS3KJAgxihsu7K12IeePWnIDoH5J7a/e4aQ7npTPVAUmyNPfg/1F+wZVNjd5AgXLQTKkayI+R1WvoNmeITYMI=
X-Received: by 2002:a63:574d:0:b0:386:c67:b383 with SMTP id
 h13-20020a63574d000000b003860c67b383mr11248309pgm.324.1648741549189; Thu, 31
 Mar 2022 08:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220331153923.14314-1-marex@denx.de>
 <CAG3jFyu=_Ep3GjrBJeZ0f1ii_PG=ZdeXC-RBCvama9XxnQ5L+A@mail.gmail.com>
In-Reply-To: <CAG3jFyu=_Ep3GjrBJeZ0f1ii_PG=ZdeXC-RBCvama9XxnQ5L+A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:45:38 +0200
Message-ID: <CAG3jFyveDwJFSRgQjm1Vqns-hv4ogjBK2ZVqEWnfOpDYScJ4og@mail.gmail.com>
Subject: Re: [RESEND][PATCH 1/2] drm/bridge: lt9611: Switch to atomic
 operations
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:43, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Thu, 31 Mar 2022 at 17:39, Marek Vasut <marex@denx.de> wrote:
> >
> > Use the atomic version of the enable/disable operations to continue the
> > transition to the atomic API. This will be needed to access the mode
> > from the atomic state.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index 63df2e8a8abc..9b3ac3794a2c 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -700,7 +700,9 @@ lt9611_connector_mode_valid(struct drm_connector *connector,
> >  }
> >
> >  /* bridge funcs */
> > -static void lt9611_bridge_enable(struct drm_bridge *bridge)
> > +static void
> > +lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                           struct drm_bridge_state *old_bridge_state)
> >  {
> >         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> >
> > @@ -721,7 +723,9 @@ static void lt9611_bridge_enable(struct drm_bridge *bridge)
> >         regmap_write(lt9611->regmap, 0x8130, 0xea);
> >  }
> >
> > -static void lt9611_bridge_disable(struct drm_bridge *bridge)
> > +static void
> > +lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                            struct drm_bridge_state *old_bridge_state)
> >  {
> >         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> >         int ret;
> > @@ -856,7 +860,9 @@ static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> >         lt9611->sleep = false;
> >  }
> >
> > -static void lt9611_bridge_post_disable(struct drm_bridge *bridge)
> > +static void
> > +lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > +                                 struct drm_bridge_state *old_bridge_state)
> >  {
> >         struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> >
> > @@ -919,13 +925,17 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
> >  static const struct drm_bridge_funcs lt9611_bridge_funcs = {
> >         .attach = lt9611_bridge_attach,
> >         .mode_valid = lt9611_bridge_mode_valid,
> > -       .enable = lt9611_bridge_enable,
> > -       .disable = lt9611_bridge_disable,
> > -       .post_disable = lt9611_bridge_post_disable,
> >         .mode_set = lt9611_bridge_mode_set,
> >         .detect = lt9611_bridge_detect,
> >         .get_edid = lt9611_bridge_get_edid,
> >         .hpd_enable = lt9611_bridge_hpd_enable,
> > +
> > +       .atomic_enable = lt9611_bridge_atomic_enable,
> > +       .atomic_disable = lt9611_bridge_atomic_disable,
> > +       .atomic_post_disable = lt9611_bridge_atomic_post_disable,
> > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> >  };
> >
> >  static int lt9611_parse_dt(struct device *dev,
> > --
> > 2.35.1
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>


Applied to drm-misc-next.
