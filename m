Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887386EC693
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 08:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05F210E10B;
	Mon, 24 Apr 2023 06:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9F10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 06:53:21 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pqq4Z-0005EU-Cb; Mon, 24 Apr 2023 08:53:15 +0200
Message-ID: <59b186dc70934320e9af6b2b916b5253fdaff444.camel@pengutronix.de>
Subject: Re: [PATCH V2 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Mon, 24 Apr 2023 08:53:00 +0200
In-Reply-To: <20230423121232.1345909-3-aford173@gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-3-aford173@gmail.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, dem 23.04.2023 um 07:12 -0500 schrieb Adam Ford:
> According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> and max values for M and the frequency range for the VCO_out
> calculator were incorrect.  This information was contradicted in other
> parts of the mini, nano and plus manuals.  After reaching out to my
> NXP Rep, when confronting him about discrepencies in the Nano manual,
> he responded with:
>  "Yes it is definitely wrong, the one that is part
>   of the NOTE in MIPI_DPHY_M_PLLPMS register table against PMS_P,
>   PMS_M and PMS_S is not correct. I will report this to Doc team,
>   the one customer should be take into account is the Table 13-40
>   DPHY PLL Parameters and the Note above."
>=20
> These updated values also match what is used in the NXP downstream
> kernel.
>=20
> To fix this, make new variables to hold the min and max values of m
> and the minimum value of VCO_out, and update the PMS calculator to
> use these new variables instead of using hard-coded values to keep
> the backwards compatibility with other parts using this driver.
>=20
> Fixes: 4d562c70c4dc ("drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano sup=
port")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++--
>  include/drm/bridge/samsung-dsim.h     |  3 +++
>  2 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 2be3b58624c3..adb9c13c5f7f 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -405,6 +405,9 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>  	.num_bits_resol =3D 11,
>  	.pll_p_offset =3D 13,
>  	.reg_values =3D reg_values,
> +	.m_min =3D 41,
> +	.m_max =3D 125,
> +	.vco_min =3D 500,
>  };
> =20
>  static const struct samsung_dsim_driver_data exynos4_dsi_driver_data =3D=
 {
> @@ -418,6 +421,9 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>  	.num_bits_resol =3D 11,
>  	.pll_p_offset =3D 13,
>  	.reg_values =3D reg_values,
> +	.m_min =3D 41,
> +	.m_max =3D 125,
> +	.vco_min =3D 500,
>  };
> =20
>  static const struct samsung_dsim_driver_data exynos5_dsi_driver_data =3D=
 {
> @@ -429,6 +435,9 @@ static const struct samsung_dsim_driver_data exynos5_=
dsi_driver_data =3D {
>  	.num_bits_resol =3D 11,
>  	.pll_p_offset =3D 13,
>  	.reg_values =3D reg_values,
> +	.m_min =3D 41,
> +	.m_max =3D 125,
> +	.vco_min =3D 500,
>  };
> =20
>  static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data =
=3D {
> @@ -441,6 +450,9 @@ static const struct samsung_dsim_driver_data exynos54=
33_dsi_driver_data =3D {
>  	.num_bits_resol =3D 12,
>  	.pll_p_offset =3D 13,
>  	.reg_values =3D exynos5433_reg_values,
> +	.m_min =3D 41,
> +	.m_max =3D 125,
> +	.vco_min =3D 500,
>  };
> =20
>  static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data =
=3D {
> @@ -453,6 +465,9 @@ static const struct samsung_dsim_driver_data exynos54=
22_dsi_driver_data =3D {
>  	.num_bits_resol =3D 12,
>  	.pll_p_offset =3D 13,
>  	.reg_values =3D exynos5422_reg_values,
> +	.m_min =3D 41,
> +	.m_max =3D 125,
> +	.vco_min =3D 500,
>  };
> =20
>  static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data =3D =
{
> @@ -469,6 +484,9 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>  	 */
>  	.pll_p_offset =3D 14,
>  	.reg_values =3D imx8mm_dsim_reg_values,
> +	.m_min =3D 64,
> +	.m_max =3D 1023,
> +	.vco_min =3D 1050,
>  };
> =20
>  static const struct samsung_dsim_driver_data *
> @@ -547,12 +565,12 @@ static unsigned long samsung_dsim_pll_find_pms(stru=
ct samsung_dsim *dsi,
>  			tmp =3D (u64)fout * (_p << _s);
>  			do_div(tmp, fin);
>  			_m =3D tmp;
> -			if (_m < 41 || _m > 125)
> +			if (_m < driver_data->m_min || _m > driver_data->m_max)
>  				continue;
> =20
>  			tmp =3D (u64)_m * fin;
>  			do_div(tmp, _p);
> -			if (tmp < 500 * MHZ ||
> +			if (tmp < driver_data->vco_min  * MHZ ||
>  			    tmp > driver_data->max_freq * MHZ)
>  				continue;
> =20
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index ba5484de2b30..a088d84579bc 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -59,6 +59,9 @@ struct samsung_dsim_driver_data {
>  	unsigned int num_bits_resol;
>  	unsigned int pll_p_offset;
>  	const unsigned int *reg_values;
> +	u16 m_min;
> +	u16 m_max;
> +	u64 vco_min;
>  };
> =20
>  struct samsung_dsim_host_ops {

