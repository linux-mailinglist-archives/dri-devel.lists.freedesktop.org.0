Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CC7068CE
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F1188F94;
	Wed, 17 May 2023 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F088F94
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:01:37 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pzGmd-00020O-ER; Wed, 17 May 2023 15:01:35 +0200
Message-ID: <f67301f5870e78f65104618316d851feb25d9aa3.camel@pengutronix.de>
Subject: Re: [PATCH V6 6/6] drm: bridge: samsung-dsim: Support non-burst mode
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Wed, 17 May 2023 15:01:33 +0200
In-Reply-To: <20230515235713.232939-7-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-7-aford173@gmail.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 15.05.2023 um 18:57 -0500 schrieb Adam Ford:
> The high-speed clock is hard-coded to the burst-clock
> frequency specified in the device tree.  However, when
> using devices like certain bridge chips without burst mode
> and varying resolutions and refresh rates, it may be
> necessary to set the high-speed clock dynamically based
> on the desired pixel clock for the connected device.
>=20
> This also removes the need to set a clock speed from
> the device tree for non-burst mode operation, since the
> pixel clock rate is the rate requested from the attached
> device like a bridge chip.=C2=A0
>=20

Same as with the earlier patch, this needs to be documented in the DT
binding by moving "samsung,burst-clock-frequency" to be a optional
property.

Regards,
Lucas

>  This should have no impact
> for people using burst-mode and setting the burst clock
> rate is still required for those users.  If the burst
> clock is not present, change the error message to
> dev_info indicating the clock use the pixel clock.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 3944b7cfbbdf..03b21d13f067 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -655,16 +655,28 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
> =20
>  	dsi->hs_clock =3D fout;
> =20
> +	dsi->hs_clock =3D fout;
> +
>  	return fout;
>  }
> =20
>  static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
>  {
> -	unsigned long hs_clk, byte_clk, esc_clk;
> +	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
>  	unsigned long esc_div;
>  	u32 reg;
> +	struct drm_display_mode *m =3D &dsi->mode;
> +	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +	/* m->clock is in KHz */
> +	pix_clk =3D m->clock * 1000;
> +
> +	/* Use burst_clk_rate if available, otherwise use the pix_clk */
> +	if (dsi->burst_clk_rate)
> +		hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
> +	else
> +		hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->=
lanes));
> =20
> -	hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
>  	if (!hs_clk) {
>  		dev_err(dsi->dev, "failed to configure DSI PLL\n");
>  		return -EFAULT;
> @@ -935,7 +947,7 @@ static void samsung_dsim_set_display_mode(struct sams=
ung_dsim *dsi)
>  	u32 reg;
> =20
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -		int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> +		int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
>  		int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
>  		int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
>  		int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
> @@ -1785,10 +1797,13 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim *dsi)
>  			return PTR_ERR(pll_clk);
>  	}
> =20
> +	/* If it doesn't exist, use pixel clock instead of failing */
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
> -				       &dsi->burst_clk_rate, 0);
> -	if (ret < 0)
> -		return ret;
> +				       &dsi->burst_clk_rate, 1);
> +	if (ret < 0) {
> +		dev_info(dev, "Using pixel clock for HS clock frequency\n");
> +		dsi->burst_clk_rate =3D 0;
> +	}
> =20
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
>  				       &dsi->esc_clk_rate, 0);

