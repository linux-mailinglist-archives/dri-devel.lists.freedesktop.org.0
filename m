Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F20791626
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 13:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7FC10E32A;
	Mon,  4 Sep 2023 11:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB58210E332
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 11:17:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qd7Nu-0007D3-GP; Mon, 04 Sep 2023 13:04:46 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mtr@pengutronix.de>)
 id 1qd7Ns-003rVV-AK; Mon, 04 Sep 2023 13:04:44 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qd7Nr-00110g-Um; Mon, 04 Sep 2023 13:04:43 +0200
Date: Mon, 4 Sep 2023 13:04:43 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
Message-ID: <20230904110443.GB224131@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
 <CAAQKjZOuRVsF7vE6ghBG7KH_QkE-5_UXjXMY080ynzZLpDjs7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQKjZOuRVsF7vE6ghBG7KH_QkE-5_UXjXMY080ynzZLpDjs7w@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, kernel@pengutronix.de,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Sep 2023 13:38:33 +0900, Inki Dae wrote:
> 2023년 8월 29일 (화) 오전 12:59, Michael Tretter <m.tretter@pengutronix.de>님이 작성:
> 
> >
> > The PLL reference clock may change at runtime. Thus, reading the clock
> > rate during probe is not sufficient to correctly configure the PLL for
> > the expected hs clock.
> >
> > Read the actual rate of the reference clock before calculating the PLL
> > configuration parameters.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
> >  include/drm/bridge/samsung-dsim.h     |  1 +
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 6778f1751faa..da90c2038042 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
> >         u16 m;
> >         u32 reg;
> >
> > -       fin = dsi->pll_clk_rate;
> > +       if (dsi->pll_clk)
> > +               fin = clk_get_rate(dsi->pll_clk);
> > +       else
> > +               fin = dsi->pll_clk_rate;
> > +       dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> > +
> 
> Could you share us the actual use case that in runtime the pll
> reference clock can be changed?

On i.MX8M Nano, the VIDEO_PLL_CLK drives the DISPLAY_PIXEL_CLK_ROOT, which is
used as pixel clock by the LCDIF. Changes to the pixel clock propagate to the
VIDEO_PLL_CLK and may reconfigure the VIDEO_PLL_CLK. This is done to reduce
the error on the pixel clock.

As the ADV3575 as MIPI-DSI device reconstructs the pixel clock, it is
necessary to keep the pixel clock and MIDI-DSI reference clock in
sync. This can be done by using the VIDEO_PLL_CLK to drive the PLL reference
clock (MIPI_DSI_CORE_CLK_ROOT). Without this, a connected HDMI Monitor will
occasionally loose sync.

In this setup, a mode change that changes the pixel clock may change the
VIDEO_PLL, which will change the PLL reference clock.

> 
> This patch is trying to change clock binding behavior which is
> described in dt binding[1]
> [1] Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> 
> It says,
> "DISM oscillator clock frequency. If absent, the clock frequency of
> sclk_mipi will be used instead."
> 
> However, this patch makes the sclk_mipi to be used first.

No, the behavior, as described in the dt binding, is preserved by the hunk
below. dsi->pll_clk is only set, if the samsung,pll-clock-frequency property
is absent. If the dt property exists, dsi->pll_clk will be NULL and
dsi->pll_clk_rate will be used here.

Michael

> 
> Thanks,
> Inki Dae
> 
> >         fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
> >         if (!fout) {
> >                 dev_err(dsi->dev,
> > @@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
> >         u32 lane_polarities[5] = { 0 };
> >         struct device_node *endpoint;
> >         int i, nr_lanes, ret;
> > -       struct clk *pll_clk;
> >
> >         ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
> >                                        &dsi->pll_clk_rate, 1);
> >         /* If it doesn't exist, read it from the clock instead of failing */
> >         if (ret < 0) {
> >                 dev_dbg(dev, "Using sclk_mipi for pll clock frequency\n");
> > -               pll_clk = devm_clk_get(dev, "sclk_mipi");
> > -               if (!IS_ERR(pll_clk))
> > -                       dsi->pll_clk_rate = clk_get_rate(pll_clk);
> > -               else
> > -                       return PTR_ERR(pll_clk);
> > +               dsi->pll_clk = devm_clk_get(dev, "sclk_mipi");
> > +               if (IS_ERR(dsi->pll_clk))
> > +                       return PTR_ERR(dsi->pll_clk);
> >         }
> >
> >         /* If it doesn't exist, use pixel clock instead of failing */
> > diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> > index 05100e91ecb9..31ff88f152fb 100644
> > --- a/include/drm/bridge/samsung-dsim.h
> > +++ b/include/drm/bridge/samsung-dsim.h
> > @@ -87,6 +87,7 @@ struct samsung_dsim {
> >         void __iomem *reg_base;
> >         struct phy *phy;
> >         struct clk **clks;
> > +       struct clk *pll_clk;
> >         struct regulator_bulk_data supplies[2];
> >         int irq;
> >         struct gpio_desc *te_gpio;
> >
> > --
> > 2.39.2
> >
> 
