Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6B9C31D8
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 12:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1531C10E09D;
	Sun, 10 Nov 2024 11:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="m7tltqoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811DF10E123
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2024 11:51:30 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1731239488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFWg6dEMIwmVhxI4eV4naQ1GzySZo5D4kZiKILIJHUQ=;
 b=m7tltqoVF6Qr9m9K4FbcnWQVc+LFfri838Al1SWaIsQpWt/xcLoqqa8+OIVHkIiNnDl2Cn
 WCrHB9O7bC4hTzvZZfsWZW1pYrPJh9teIYGh500nQbcFYraVBHc3DcBWDCw38JE1T8kQtG
 knvWIbUzJHau/F64C+WCanG+4aXbckvT+b7R/OvinvX0W0pbkqwx4mZo4HuT8TK6fi69ke
 gmMU39mofU55ouN5JhuLbYTdirP0u51cqSVQuH7Q0xL2Ad1tsWa/WoCr5MywV9VQIigdJI
 94PNDEykUcq4oWK5cqw4YI69KLP7qPE4DS9UCwintmmUzPaM3LYB5f/9fLxZow==
Content-Type: multipart/signed;
 boundary=b77664642ebb68f013543ef5d58ad1bd5386405f8ca54138a859155694b7;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sun, 10 Nov 2024 12:51:15 +0100
Message-Id: <D5IH6BLY7FH2.CFMD6AKWASJP@cknow.org>
Cc: <andy.yan@rock-chips.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH] drm/rockchip: dsi: convert to dev_err_probe in probe
 function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>, <dsimic@manjaro.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
References: <20241108144425.1009916-1-heiko@sntech.de>
In-Reply-To: <20241108144425.1009916-1-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
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

--b77664642ebb68f013543ef5d58ad1bd5386405f8ca54138a859155694b7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Heiko,

On Fri Nov 8, 2024 at 3:44 PM CET, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> DRM_DEV_ERROR is deprecated and using dev_err_probe saves quite a number
> of lines too, so convert the error prints for the dsi-driver.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 80 ++++++-------------
>  1 file changed, 26 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 58a44af0e9ad..3224ab749352 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -1356,17 +1356,15 @@ static int dw_mipi_dsi_rockchip_probe(struct plat=
form_device *pdev)
>  	struct resource *res;
>  	const struct rockchip_dw_dsi_chip_data *cdata =3D
>  				of_device_get_match_data(dev);
> -	int ret, i;
> +	int i;
> =20
>  	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi)
>  		return -ENOMEM;
> =20
>  	dsi->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (IS_ERR(dsi->base)) {
> -		DRM_DEV_ERROR(dev, "Unable to get dsi registers\n");
> -		return PTR_ERR(dsi->base);
> -	}
> +	if (IS_ERR(dsi->base))
> +		return dev_err_probe(dev, PTR_ERR(dsi->base), "Unable to get dsi regis=
ters\n");
> =20
>  	i =3D 0;
>  	while (cdata[i].reg) {
> @@ -1378,67 +1376,47 @@ static int dw_mipi_dsi_rockchip_probe(struct plat=
form_device *pdev)
>  		i++;
>  	}
> =20
> -	if (!dsi->cdata) {
> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> -		return -EINVAL;
> -	}
> +	if (!dsi->cdata)
> +		return dev_err_probe(dev, -EINVAL, "No dsi-config for %s node\n", np->=
name);
> =20
>  	/* try to get a possible external dphy */
>  	dsi->phy =3D devm_phy_optional_get(dev, "dphy");
> -	if (IS_ERR(dsi->phy)) {
> -		ret =3D PTR_ERR(dsi->phy);
> -		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(dsi->phy))
> +		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get mipi dphy\=
n");

One small remark/question: wouldn't the recently introduced [1]
dev_warn_probe be more appropriate here, given that "dphy" is optional?

But besides that, the 'conversion' to use dev_err_probe was done
consistently and in line with other dev_err_probe conversions and looks
much cleaner and thus better then the previous code. Thanks!
Feel free to add my

Reviewed-by: Diederik de Haas <didi.debian@cknow.org>

[1] https://lore.kernel.org/linux-rockchip/2be0a28538bb2a3d1bcc91e2ca1f2d0d=
c09146d9.1727601608.git.dsimic@manjaro.org/
> =20
>  	dsi->pclk =3D devm_clk_get(dev, "pclk");
> -	if (IS_ERR(dsi->pclk)) {
> -		ret =3D PTR_ERR(dsi->pclk);
> -		DRM_DEV_ERROR(dev, "Unable to get pclk: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(dsi->pclk))
> +		return dev_err_probe(dev, PTR_ERR(dsi->pclk), "Unable to get pclk\n");
> =20
>  	dsi->pllref_clk =3D devm_clk_get(dev, "ref");
>  	if (IS_ERR(dsi->pllref_clk)) {
> -		if (dsi->phy) {
> +		if (dsi->phy)
>  			/*
>  			 * if external phy is present, pll will be
>  			 * generated there.
>  			 */
>  			dsi->pllref_clk =3D NULL;
> -		} else {
> -			ret =3D PTR_ERR(dsi->pllref_clk);
> -			DRM_DEV_ERROR(dev,
> -				      "Unable to get pll reference clock: %d\n",
> -				      ret);
> -			return ret;
> -		}
> +		else
> +			return dev_err_probe(dev, PTR_ERR(dsi->pllref_clk),
> +					     "Unable to get pll reference clock\n");
>  	}
> =20
>  	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
>  		dsi->phy_cfg_clk =3D devm_clk_get(dev, "phy_cfg");
> -		if (IS_ERR(dsi->phy_cfg_clk)) {
> -			ret =3D PTR_ERR(dsi->phy_cfg_clk);
> -			DRM_DEV_ERROR(dev,
> -				      "Unable to get phy_cfg_clk: %d\n", ret);
> -			return ret;
> -		}
> +		if (IS_ERR(dsi->phy_cfg_clk))
> +			return dev_err_probe(dev, PTR_ERR(dsi->phy_cfg_clk),
> +					     "Unable to get phy_cfg_clk\n");
>  	}
> =20
>  	if (dsi->cdata->flags & DW_MIPI_NEEDS_GRF_CLK) {
>  		dsi->grf_clk =3D devm_clk_get(dev, "grf");
> -		if (IS_ERR(dsi->grf_clk)) {
> -			ret =3D PTR_ERR(dsi->grf_clk);
> -			DRM_DEV_ERROR(dev, "Unable to get grf_clk: %d\n", ret);
> -			return ret;
> -		}
> +		if (IS_ERR(dsi->grf_clk))
> +			return dev_err_probe(dev, PTR_ERR(dsi->grf_clk), "Unable to get grf_c=
lk\n");
>  	}
> =20
>  	dsi->grf_regmap =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf")=
;
> -	if (IS_ERR(dsi->grf_regmap)) {
> -		DRM_DEV_ERROR(dev, "Unable to get rockchip,grf\n");
> -		return PTR_ERR(dsi->grf_regmap);
> -	}
> +	if (IS_ERR(dsi->grf_regmap))
> +		return dev_err_probe(dev, PTR_ERR(dsi->grf_regmap), "Unable to get roc=
kchip,grf\n");
> =20
>  	dsi->dev =3D dev;
>  	dsi->pdata.base =3D dsi->base;
> @@ -1451,24 +1429,18 @@ static int dw_mipi_dsi_rockchip_probe(struct plat=
form_device *pdev)
>  	mutex_init(&dsi->usage_mutex);
> =20
>  	dsi->dphy =3D devm_phy_create(dev, NULL, &dw_mipi_dsi_dphy_ops);
> -	if (IS_ERR(dsi->dphy)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to create PHY\n");
> -		return PTR_ERR(dsi->dphy);
> -	}
> +	if (IS_ERR(dsi->dphy))
> +		return dev_err_probe(dev, PTR_ERR(dsi->dphy), "Failed to create PHY\n"=
);
> =20
>  	phy_set_drvdata(dsi->dphy, dsi);
>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
>  	if (IS_ERR(phy_provider))
> -		return PTR_ERR(phy_provider);
> +		return dev_err_probe(dev, PTR_ERR(phy_provider),
> +				     "Failed to register phy-provider\n");
> =20
>  	dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> -	if (IS_ERR(dsi->dmd)) {
> -		ret =3D PTR_ERR(dsi->dmd);
> -		if (ret !=3D -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev,
> -				      "Failed to probe dw_mipi_dsi: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(dsi->dmd))
> +		return dev_err_probe(dev, PTR_ERR(dsi->dmd), "Failed to probe dw_mipi_=
dsi\n");
> =20
>  	return 0;
>  }


--b77664642ebb68f013543ef5d58ad1bd5386405f8ca54138a859155694b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZzCeOAAKCRDXblvOeH7b
bgRfAQC8zL4y9iY4WuBhGNTyaaPDXZCL42MHqt2w5nWDHUIwAgEAmkJQfQFQVOeW
QbZkfWFNMdtaOLL8X1xwYeuI3RpXkQE=
=Gize
-----END PGP SIGNATURE-----

--b77664642ebb68f013543ef5d58ad1bd5386405f8ca54138a859155694b7--
