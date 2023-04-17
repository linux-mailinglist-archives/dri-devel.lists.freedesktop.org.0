Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6CB6E42DA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 10:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C301E10E179;
	Mon, 17 Apr 2023 08:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323210E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:43:30 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1poKSO-000303-Km; Mon, 17 Apr 2023 10:43:28 +0200
Message-ID: <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Mon, 17 Apr 2023 10:43:25 +0200
In-Reply-To: <20230415104104.5537-1-aford173@gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> If there is more than one lane, the HFP, HBP, and HSA is calculated in
> bytes/pixel, then they are divided amongst the different lanes with some
> additional overhead. This is necessary to achieve higher resolutions whil=
e
> keeping the pixel clocks lower as the number of lanes increase.
>=20

In the testing I did to come up with my patch "drm: bridge: samsung-
dsim: fix blanking packet size calculation" the number of lanes didn't
make any difference. My testing might be flawed, as I could only
measure the blanking after translation from MIPI DSI to DPI, so I'm
interested to know what others did here. How did you validate the
blanking with your patch? Would you have a chance to test my patch and
see if it works or breaks in your setup?

Regards,
Lucas

> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 40 +++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index e0a402a85787..1ccbad4ea577 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -215,6 +215,7 @@
>  #define DSI_RX_FIFO_SIZE		256
>  #define DSI_XFER_TIMEOUT_MS		100
>  #define DSI_RX_FIFO_EMPTY		0x30800002
> +#define DSI_HSYNC_PKT_OVERHEAD	6
> =20
>  #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
> =20
> @@ -879,13 +880,40 @@ static void samsung_dsim_set_display_mode(struct sa=
msung_dsim *dsi)
>  			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
>  		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
> =20
> -		reg =3D DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> -			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> -		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> +		/*
> +		 * If there is more than one lane, the HFP, HBP, and HSA
> +		 * is calculated in bytes/pixel, then they are divided
> +		 * amongst the different lanes with some additional
> +		 * overhead correction
> +		 */
> +		if (dsi->lanes > 1) {
> +			u32 hfp, hbp, hsa;
> +			int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format) / 8;
> +
> +			hfp =3D ((m->hsync_start - m->hdisplay) * bpp) / dsi->lanes;
> +			hfp -=3D (hfp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
> +
> +			hbp =3D ((m->htotal - m->hsync_end) * bpp) / dsi->lanes;
> +			hbp -=3D (hbp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
> =20
> -		reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> -			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
> -		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> +			hsa =3D ((m->hsync_end - m->hsync_start) * bpp) / dsi->lanes;
> +			hsa -=3D (hsa > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
> +
> +			reg =3D DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
> +			samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> +
> +			reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> +				| DSIM_MAIN_HSA(hsa);
> +			samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> +		} else {
> +			reg =3D DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> +				| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> +			samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
> +
> +			reg =3D DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> +				| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
> +			samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
> +		}
>  	}
>  	reg =3D  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
>  		DSIM_MAIN_VRESOL(m->vdisplay, num_bits_resol);

