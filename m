Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6187068BE
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 14:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B053C10E411;
	Wed, 17 May 2023 12:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09C510E411
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:56:58 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pzGi5-0001Dc-5f; Wed, 17 May 2023 14:56:53 +0200
Message-ID: <1c8997c7c72143d130ebbc9ba438cebddc9d35e0.camel@pengutronix.de>
Subject: Re: [PATCH V6 3/6] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Wed, 17 May 2023 14:56:47 +0200
In-Reply-To: <20230515235713.232939-4-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-4-aford173@gmail.com>
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

Hi Adam,

Am Montag, dem 15.05.2023 um 18:57 -0500 schrieb Adam Ford:
> Make the pll-clock-frequency optional.  If it's present, use it
> to maintain backwards compatibility with existing hardware.  If it
> is absent, read clock rate of "sclk_mipi" to determine the rate.
> Since it can be optional, change the message from an error to
> dev_info.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index bf4b33d2de76..08266303c261 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1712,11 +1712,11 @@ static const struct mipi_dsi_host_ops samsung_dsi=
m_ops =3D {
>  };
> =20
>  static int samsung_dsim_of_read_u32(const struct device_node *np,
> -				    const char *propname, u32 *out_value)
> +				    const char *propname, u32 *out_value, bool optional)
>  {
>  	int ret =3D of_property_read_u32(np, propname, out_value);
> =20
> -	if (ret < 0)
> +	if (ret < 0 && !optional)
>  		pr_err("%pOF: failed to get '%s' property\n", np, propname);
> =20
>  	return ret;
> @@ -1726,20 +1726,29 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim *dsi)
>  {
>  	struct device *dev =3D dsi->dev;
>  	struct device_node *node =3D dev->of_node;
> +	struct clk *pll_clk;
>  	int ret;
> =20
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
> -				       &dsi->pll_clk_rate);
> -	if (ret < 0)
> -		return ret;
> +				       &dsi->pll_clk_rate, 1);
> +
> +	/* If it doesn't exist, read it from the clock instead of failing */
> +	if (ret < 0) {
> +		dev_info(dev, "Using sclk_mipi for pll clock frequency\n");

While this is certainly helpful while debugging the driver, I don't
think it warrants a info print. Remove or downgrade to dev_dbg?

On the other hand the changed driver behavior should be documented in
the devicetree binding by moving "samsung,pll-clock-frequency" into the
optional properties and spelling out which clock rate is used when the
property is absent.

Regards,
Lucas

> +		pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> +		if (!IS_ERR(pll_clk))
> +			dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> +		else
> +			return PTR_ERR(pll_clk);
> +	}
> =20
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
> -				       &dsi->burst_clk_rate);
> +				       &dsi->burst_clk_rate, 0);
>  	if (ret < 0)
>  		return ret;
> =20
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
> -				       &dsi->esc_clk_rate);
> +				       &dsi->esc_clk_rate, 0);
>  	if (ret < 0)
>  		return ret;
> =20

