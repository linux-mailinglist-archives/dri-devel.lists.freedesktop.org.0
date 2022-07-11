Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7C56D6DB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BCD10F421;
	Mon, 11 Jul 2022 07:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E3910F421
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:31:32 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id i21so5091394qtw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/7sLUT5xG/gk839oUa0EEDIiTWXp5BX3JAGYljElZfg=;
 b=uXGyRAuv2KAbOv0g4YRopN6v2Vg+zgg/0rtizfGZdXZQ9nkwTGdonA2tsG4G24P6zC
 A8VZynVvJCD3wT5Y5s8HF/zCqXwve7PssBs8Jx8S1j1021eeve00nxNWv1X40erQHr0z
 QeQBDBj8RMCr9iMV3lfqEVue8TLWRaZFoE0uLaUrfpGMUgkIaqJtLaVgn2ogXRUhGwgq
 jN78Fv07/KO3K8z50PJvXAkxyerqtP/L1jWg4OnHIr2OopNC3GIIiB7NFKHWdoytghUl
 sn9d8id+6gV+X1IvD23Ud+ybZntvuadZ/jFE8ZiZzm65rid3s1IVKGXhY+4ypWs3EBEe
 NY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/7sLUT5xG/gk839oUa0EEDIiTWXp5BX3JAGYljElZfg=;
 b=GmzC0EwJif38R9U/a0JdJQKTyFHOmDcnmsQvHJw/XLglxbseUQgzlJKAX+s7WviJwG
 31cbnqghB2whfTUy7hjdG4LNzE72qClqHw6CoMcDVUpk2G1fIadSrghHmTNrz8OPgajd
 4/z7ale0Rr6ejEzxRBD322GWJJ3lAGTOwZ7/fjr9r1WaGyKwHRqbRHB4vu/vh6HpsNjt
 JuTRz5gw0YoiCvsrxUJiH+vOj/8tAyKCj555D5gPUy7uJit/4x9bJ7pp1YaM2A+dSrVu
 6t6V4sT3HyiQo6q712Y3nkB9RXUQlFpmrJDgHzebps0DGE4rXnduVDDvnv6TldAI44E/
 nCQQ==
X-Gm-Message-State: AJIora96FfccIac5PzNwbr1dHv9IlKd5KgWKMnzvEKAgm6D2xoV/3Aje
 rJyMCZsed2sqCZvEn/S9HsTp2r0EYH+pN4VzpkisEA==
X-Google-Smtp-Source: AGRyM1v4yopWgDJUivdQtj6Q2uqWUtOVQrX2vVikIwEPyJGIulLhl5A6m1ds9Go6J6iadfWUrWzJd53qFX6mmUUJau4=
X-Received: by 2002:ac8:4e56:0:b0:31d:38c0:b749 with SMTP id
 e22-20020ac84e56000000b0031d38c0b749mr12415313qtw.682.1657524691329; Mon, 11
 Jul 2022 00:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
 <YsskUiGP8HCQeUUR@ravnborg.org>
In-Reply-To: <YsskUiGP8HCQeUUR@ravnborg.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Jul 2022 10:31:20 +0300
Message-ID: <CAA8EJpobTKkyMkFd2zgFVzR21BgqA+Rdrgszc2JYFZqU9Zvp9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 at 22:11, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sun, Jul 10, 2022 at 09:45:35PM +0300, Dmitry Baryshkov wrote:
> > Rather than reading the pdata->connector directly, fetch the connector
> > using drm_atomic_state. This allows us to make pdata->connector optional
> > (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 01171547f638..df08207d6223 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> >       regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> >  }
> >
> > -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> > +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
> >  {
> > -     if (pdata->connector->display_info.bpc <= 6)
> > +     if (connector->display_info.bpc <= 6)
> >               return 18;
> >       else
> >               return 24;
> > @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
> >       0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
> >  };
> >
> > -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> > +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
> >  {
> >       unsigned int bit_rate_khz, dp_rate_mhz;
> >       unsigned int i;
> > @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> >               &pdata->bridge.encoder->crtc->state->adjusted_mode;
> >
> >       /* Calculate minimum bit rate based on our pixel clock. */
> > -     bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> > +     bit_rate_khz = mode->clock * bpp;
> >
> >       /* Calculate minimum DP data rate, taking 80% as per DP spec */
> >       dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> > @@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >                                      struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +     struct drm_connector *connector;
> >       const char *last_err_str = "No supported DP rate";
> >       unsigned int valid_rates;
> >       int dp_rate_idx;
> >       unsigned int val;
> >       int ret = -EINVAL;
> >       int max_dp_lanes;
> > +     unsigned int bpp;
> > +
> > +     connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> > +                                                          bridge->encoder);
> > +     if (!connector)
> > +             return;
> It would be prudent with a dev_err() logging here as we do not expect to
> fail.
> I looked into something similar, but with a less elegant solution, and
> could not convince myself that the display driver would create the
> connector before ti_sn_bridge_atomic_enable() was called.

If I understand your concern, the connectors (as does the rest of
CRTC/encoder/etc objects) are not dynamic, so they must be created
before being able to use the DRM device or any part of thereof is
being actually used (enable/disable/modeset).

>
> This is another reason why a dev_err would be nice - so tester could see
> if this fails or not.

Will fix this in v2.

>
> With the dev_err added:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> >
> >       max_dp_lanes = ti_sn_get_max_lanes(pdata);
> >       pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> > @@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >       drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
> >                          DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
> >
> > +     bpp = ti_sn_bridge_get_bpp(connector);
> >       /* Set the DP output format (18 bpp or 24 bpp) */
> > -     val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> > +     val = (bpp == 18) ? BPP_18_RGB : 0;
> >       regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
> >
> >       /* DP lane config */
> > @@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >       valid_rates = ti_sn_bridge_read_valid_rates(pdata);
> >
> >       /* Train until we run out of rates */
> > -     for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> > +     for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
> >            dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> >            dp_rate_idx++) {
> >               if (!(valid_rates & BIT(dp_rate_idx)))
> > --
> > 2.35.1



-- 
With best wishes
Dmitry
