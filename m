Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7B3DA964
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 18:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030A06EDF2;
	Thu, 29 Jul 2021 16:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210D6EDF3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 16:50:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 1c1c2356-f08d-11eb-8d1a-0050568cd888;
 Thu, 29 Jul 2021 16:50:41 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D1FF4194B1F;
 Thu, 29 Jul 2021 18:50:41 +0200 (CEST)
Date: Thu, 29 Jul 2021 18:50:17 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [RFC PATCH 05/17] drm/exynos: dsi: Get the mode from bridge
Message-ID: <YQLcSfTS2jiqtWED@ravnborg.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-6-jagan@amarulasolutions.com>
 <CAG3jFytHb=iOc6CHy47iGwvxuSg1UMqnpE7oFZL9tfcPUB22eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFytHb=iOc6CHy47iGwvxuSg1UMqnpE7oFZL9tfcPUB22eA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 03:20:17PM +0200, Robert Foss wrote:
> Hey Jagan,
> 
> On Sun, 4 Jul 2021 at 11:04, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Now the exynos dsi driver is fully aware of bridge
> > handling, so get the display mode from bridge, mode_set
> > API instead of legacy encoder crtc.
> >
> > This makes bridge usage more efficient instead of relying
> > on encoder stack.
> >
> > Add mode_set in drm_bridge_funcs.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index d828be07c325..99a1b8c22313 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -275,6 +275,7 @@ struct exynos_dsi {
> >         u32 format;
> >
> >         int state;
> > +       struct drm_display_mode mode;
> >         struct drm_property *brightness;
> >         struct completion completed;
> >
> > @@ -881,7 +882,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
> >
> >  static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
> >  {
> > -       struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
> > +       struct drm_display_mode *m = &dsi->mode;
> >         unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
> >         u32 reg;
> >
> > @@ -1411,6 +1412,15 @@ static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
> >         pm_runtime_put_sync(dsi->dev);
> >  }
> >
> > +static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
> > +                                      const struct drm_display_mode *mode,
> > +                                      const struct drm_display_mode *adjusted_mode)
> > +{
> > +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +       drm_mode_copy(&dsi->mode, adjusted_mode);
> > +}
> > +
> >  static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
> >                                       struct device_node *node)
> >  {
> > @@ -1451,6 +1461,7 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
> >  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> >         .enable = exynos_dsi_bridge_enable,
> >         .disable = exynos_dsi_bridge_disable,
> > +       .mode_set = exynos_dsi_bridge_mode_set,
> 
> As far as I understand it, .enable(), .disable() &.mode_set() are
> deprecated[1] and should be replaced by atomic_enable(),
> atomic_disable() & atomic_enable() respectively.
> 
> [1] https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.org/

Correct, we are slowly moving away from the deprecated bridge functions.
Need to find time to update my patchset that address some of this.

	Sam
