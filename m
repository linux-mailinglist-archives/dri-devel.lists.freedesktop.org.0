Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E07068E3
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107610E122;
	Wed, 17 May 2023 13:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBF110E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:06:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pzGrN-0002yE-Fg; Wed, 17 May 2023 15:06:29 +0200
Message-ID: <c747c38ecd4a52ad51021cc0cb5ce9854b7378d3.camel@pengutronix.de>
Subject: Re: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Wed, 17 May 2023 15:06:26 +0200
In-Reply-To: <20230515235713.232939-6-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-6-aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 15.05.2023 um 18:57 -0500 schrieb Adam Ford:
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  To facilitate this, we need to cache the hs_clock
> based on what is generated from the PLL.
>=20
> The phy_mipi_dphy_get_default_config_for_hsclk function
> configures the DPHY timings in pico-seconds, and a small macro
> converts those timings into clock cycles based on the hs_clk.
>=20
I'm not going apply a review tag to a patch where I contributed myself,
but FWIW this looks good to me.

> Signed-off-by: Adam Ford <aford173@gmail.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 57 +++++++++++++++++++++++----
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 51 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 08266303c261..3944b7cfbbdf 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -218,6 +218,8 @@
> =20
>  #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
> =20
> +#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 10000=
00000000ULL)
> +
>  static const char *const clk_names[5] =3D {
>  	"bus_clk",
>  	"sclk_mipi",
> @@ -651,6 +653,8 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>  		reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
>  	} while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
> =20
> +	dsi->hs_clock =3D fout;
> +
>  	return fout;
>  }
> =20
> @@ -698,13 +702,46 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>  	const struct samsung_dsim_driver_data *driver_data =3D dsi->driver_data=
;
>  	const unsigned int *reg_values =3D driver_data->reg_values;
>  	u32 reg;
> +	struct phy_configure_opts_mipi_dphy cfg;
> +	int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> +	int hs_exit, hs_prepare, hs_zero, hs_trail;
> +	unsigned long long byte_clock =3D dsi->hs_clock / 8;
> =20
>  	if (driver_data->has_freqband)
>  		return;
> =20
> +	phy_mipi_dphy_get_default_config_for_hsclk(dsi->hs_clock,
> +						   dsi->lanes, &cfg);
> +
> +	/*
> +	 * TODO:
> +	 * The tech reference manual for i.MX8M Mini/Nano/Plus
> +	 * doesn't state what the definition of the PHYTIMING
> +	 * bits are beyond their address and bit position.
> +	 * After reviewing NXP's downstream code, it appears
> +	 * that the various PHYTIMING registers take the number
> +	 * of cycles and use various dividers on them.  This
> +	 * calculation does not result in an exact match to the
> +	 * downstream code, but it is very close, and it appears
> +	 * to sync at a variety of resolutions. If someone
> +	 * can get a more accurate mathematical equation needed
> +	 * for these registers, this should be updated.
> +	 */
> +
> +	lpx =3D PS_TO_CYCLE(cfg.lpx, byte_clock);
> +	hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, byte_clock);
> +	clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, byte_clock);
> +	clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, byte_clock);
> +	clk_post =3D PS_TO_CYCLE(cfg.clk_post, byte_clock);
> +	clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, byte_clock);
> +	hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, byte_clock);
> +	hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, byte_clock);
> +	hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, byte_clock);
> +
>  	/* B D-PHY: D-PHY Master & Slave Analog Block control */
>  	reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
>  		reg_values[PHYCTRL_SLEW_UP];
> +
>  	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
> =20
>  	/*
> @@ -712,7 +749,9 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_=
dsim *dsi)
>  	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
>  	 *	burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> +
> +	reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
> =20
>  	/*
> @@ -728,10 +767,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>  	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
>  	 *	the last payload clock bit of a HS transmission burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> -		reg_values[PHYTIMING_CLK_ZERO] |
> -		reg_values[PHYTIMING_CLK_POST] |
> -		reg_values[PHYTIMING_CLK_TRAIL];
> +
> +	reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)	|
> +	      DSIM_PHYTIMING1_CLK_ZERO(clk_zero)	|
> +	      DSIM_PHYTIMING1_CLK_POST(clk_post)	|
> +	      DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> =20
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
> =20
> @@ -744,8 +784,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>  	 * T HS-TRAIL: Time that the transmitter drives the flipped differentia=
l
>  	 *	state after last payload data bit of a HS transmission burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO=
] |
> -		reg_values[PHYTIMING_HS_TRAIL];
> +
> +	reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> +	      DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> +	      DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
>  }
> =20
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index a1a5b2b89a7a..d9d431e3b65a 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -93,6 +93,7 @@ struct samsung_dsim {
> =20
>  	u32 pll_clk_rate;
>  	u32 burst_clk_rate;
> +	u32 hs_clock;
>  	u32 esc_clk_rate;
>  	u32 lanes;
>  	u32 mode_flags;

