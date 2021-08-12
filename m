Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAFA3EAAA5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD726E44C;
	Thu, 12 Aug 2021 19:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50516E44A;
 Thu, 12 Aug 2021 19:09:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q10so9775818wro.2;
 Thu, 12 Aug 2021 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ALF3spy01uCB2Y9+oMc38hneuTm1l+w0EonCm4bcZFk=;
 b=A/l3ImB7fASHRe4BkKBvDPFmj6KFPwHyEUg9Vs9meUTwtNtYHjM0Ogm2PFCPj9cLJg
 hf/9lqAz1bHdZ6Ycg4153fdAnv6s6xFEPhGfCSKCq/sV24FFfckwX1xJZIkF/DWHQmyX
 FgtUTeaU0YyEYb3vzMrvSYcHuAl77P+Hmv2kwHL3bDULA6Slz87GQ5kXWVDjESC4XAws
 UZRDC0iTP0GzF9kxDcK929Lj74pNBMmB7SlpOHrkbkgRh651y0HvX9Q60+LTT2n+Iref
 M+Jfwf+2N+eOn8d5e+kN795BvdGEoJjFMdAydJR0DA55dIblPvrDUL1zHiyNm65Ge3xi
 xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALF3spy01uCB2Y9+oMc38hneuTm1l+w0EonCm4bcZFk=;
 b=DZT79fFOeiYV/kQCQG3YAkztv1IPDzftQq7YldKDafeSMAdGzv05VpA2k2d0fjAl73
 A06ZQPlhYAO55SRXFtmjEaffIvGOAX8xqDnOB309IZ/evGqbOKtaf/RHi7DNgc3vow//
 j6ke8+Ek4kQx0WcbgripA+/mD4KycsIUQ51MJDgRLaaGLDzUTSbxOs1s2ZytEx2b86zB
 JZvnHDCv7kBLAv4hhyC4JC+O16iEbP/law+iECrR41a5ZhGwp7v5rLx/JBaD76u4jDMH
 wEajVSEb5lU3FEx5h0aRwhm2aPuEia55oiQi6R9xIV/4sUkXmdL6I5aYEWeyZeWTB5ss
 6mHA==
X-Gm-Message-State: AOAM532lgfiwjdTOF6+2PwHvAX/inOKsbD2P60KHTEHu0M8274tP0qFc
 w2CYXD6eChU8DxrecduepgOdObPG44diLbTbLdo=
X-Google-Smtp-Source: ABdhPJzVMAS60V6BHu0/bworS1aO8/6F5SqRyaXwBYmpnib7FDK0t2nY1lAbky+WX5C3LdqeOmTzbLhrJVeSg/7t2CE=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr5918171wrr.28.1628795364221; 
 Thu, 12 Aug 2021 12:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-4-robdclark@gmail.com>
 <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
In-Reply-To: <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Aug 2021 12:09:12 -0700
Message-ID: <CAF6AEGs8g2miQz=upd0LMPg109JR7gMeEGyd1u1jQ2WYR=oWtQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 12, 2021 at 11:44 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, Aug 11, 2021 at 04:52:49PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For the brave new world of bridges not creating their own connectors, we
> > need to implement the max clock limitation via bridge->mode_valid()
> > instead of connector->mode_valid().
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 5d3b30b2f547..38dcc49eccaf 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
> >       .id_table = ti_sn_aux_id_table,
> >  };
> >
> > +static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
> > +{
> > +     /* maximum supported resolution is 4K at 60 fps */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     return MODE_OK;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * DRM Connector Operations
> >   */
> > @@ -616,11 +625,7 @@ static enum drm_mode_status
> >  ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
> >                                 struct drm_display_mode *mode)
> >  {
> > -     /* maximum supported resolution is 4K at 60 fps */
> > -     if (mode->clock > 594000)
> > -             return MODE_CLOCK_HIGH;
> > -
> > -     return MODE_OK;
> > +     return check_mode(mode);
>
> Do we need to implement the connector .mode_valid() operation, given
> that the bridge is linked in the chain ?

My understanding is that we need to keep it for display drivers that
are not converted to NO_CONNECTOR..

But AFAIK snapdragon is the only upstream user of this bridge, so
after the drm/msm/dsi patch lands we could probably garbage collect
the connector support.

BR,
-R

> >  }
> >
> >  static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
> > @@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> >       drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
> >  }
> >
> > +static enum drm_mode_status
> > +ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> > +                     const struct drm_display_info *info,
> > +                     const struct drm_display_mode *mode)
> > +{
> > +     return check_mode(mode);
> > +}
> > +
> >  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > @@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> > +     .mode_valid = ti_sn_bridge_mode_valid,
> >       .pre_enable = ti_sn_bridge_pre_enable,
> >       .enable = ti_sn_bridge_enable,
> >       .disable = ti_sn_bridge_disable,
>
> --
> Regards,
>
> Laurent Pinchart
