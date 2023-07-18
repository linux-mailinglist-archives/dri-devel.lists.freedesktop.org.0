Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9267575AD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD22610E2E5;
	Tue, 18 Jul 2023 07:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6D10E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689666562; x=1721202562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35izBTlsDrsZg236Zf6prZGetXUm/PRQN5Sro/Cl3Dk=;
 b=lpJiyQDPbA3fSUmUssIHxT4SqnXdA/X7IFuWGg2S33R/sEMwAiSgPjtc
 rJ3M1wzHuTKZPVmCuAfH9lZOOIXsdxcLuRkc7qm4X0UouGy2l1+K82L5K
 vU6Y3Jop2O4nYxoYlAMZWu9N2zrCG5+S5VC4Bt6DE9DhrFqlMfHy3gBsH
 oLDYLBsbyrzOa/IUN/YRO+mFAhA6xq1xLYnfbeWzmOZw2CA/3oFw3OheZ
 clrPDi7mAtN2gY0d5IlsQ9ENdsvhYVRxVdONleeRWXQc6euoE3Jox5ozD
 yW0n79+Y4TG7wfVZHVHEjKMZauMu2Dy9W/pM6aqtfBOhorbDVWzZ1tbTM w==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684792800"; d="scan'208";a="31978873"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Jul 2023 09:49:20 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B9BF7280078;
 Tue, 18 Jul 2023 09:49:19 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Tue, 18 Jul 2023 09:49:19 +0200
Message-ID: <3174425.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230717061831.1826878-10-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, Liu Ying <victor.liu@nxp.com>,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for the patch.

Am Montag, 17. Juli 2023, 08:18:31 CEST schrieb Liu Ying:
> Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> controller and a Synopsys Designware MIPI DPHY.  Some configurations
> and extensions to them are controlled by i.MX93 media blk-ctrl.
>=20
> Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
>  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 934 ++++++++++++++++++++
>  3 files changed, 945 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> b/drivers/gpu/drm/bridge/imx/Kconfig index 9fae28db6aa7..5182298c7182
> 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -49,4 +49,14 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>  	  Choose this to enable pixel link to display pixel=20
interface(PXL2DPI)
>  	  found in Freescale i.MX8qxp processor.
>=20
> +config DRM_IMX93_MIPI_DSI
> +	tristate "Freescale i.MX93 specific extensions for Synopsys DW MIPI=20
DSI"
> +	depends on OF
> +	depends on COMMON_CLK
> +	select DRM_DW_MIPI_DSI
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  Choose this to enable MIPI DSI controller found in Freescale=20
i.MX93
> +	  processor.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> b/drivers/gpu/drm/bridge/imx/Makefile index 8e2ebf3399a1..2b0c2e44aa1b
> 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> +obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c new file mode 100644
> index 000000000000..77f59e3407a0
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

> [snip]

> +static int imx93_dsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct imx93_dsi *dsi;
> +	int ret;
> +
> +	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-
ctrl");
> +	if (IS_ERR(dsi->regmap)) {
> +		ret =3D PTR_ERR(dsi->regmap);
> +		DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:=20
%d\n", ret);

Could you use dev_err_probe here instead?

> +		return ret;
> +	}
> +
> +	dsi->clk_pixel =3D devm_clk_get(dev, "pix");
> +	if (IS_ERR(dsi->clk_pixel)) {
> +		ret =3D PTR_ERR(dsi->clk_pixel);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get pixel clock:=20
%d\n", ret);

Could you use dev_err_probe here instead?

> +		return ret;
> +	}
> +
> +	dsi->clk_cfg =3D devm_clk_get(dev, "phy_cfg");
> +	if (IS_ERR(dsi->clk_cfg)) {
> +		ret =3D PTR_ERR(dsi->clk_cfg);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get phy cfg clock:=20
%d\n", ret);
> +		return ret;
> +	}
> +
> +	dsi->clk_ref =3D devm_clk_get(dev, "phy_ref");
> +	if (IS_ERR(dsi->clk_ref)) {
> +		ret =3D PTR_ERR(dsi->clk_ref);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get phy ref clock:=20
%d\n", ret);

Could you use dev_err_probe here instead?

> +		return ret;
> +	}
> +
> +	dsi->ref_clk_rate =3D clk_get_rate(dsi->clk_ref);
> +	if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
> +	    dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
> +		DRM_DEV_ERROR(dev, "invalid phy ref clock rate %lu\n",
> +			      dsi->ref_clk_rate);
> +		return -EINVAL;
> +	}
> +	DRM_DEV_DEBUG_DRIVER(dev, "phy ref clock rate: %lu\n", dsi-
>ref_clk_rate);
> +
> +	dsi->dev =3D dev;
> +	dsi->pdata.max_data_lanes =3D 4;
> +	dsi->pdata.mode_valid =3D imx93_dsi_mode_valid;
> +	dsi->pdata.mode_fixup =3D imx93_dsi_mode_fixup;
> +	dsi->pdata.get_input_bus_fmts =3D imx93_dsi_get_input_bus_fmts;
> +	dsi->pdata.phy_ops =3D &imx93_dsi_phy_ops;
> +	dsi->pdata.host_ops =3D &imx93_dsi_host_ops;
> +	dsi->pdata.priv_data =3D dsi;
> +	platform_set_drvdata(pdev, dsi);
> +
> +	dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> +	if (IS_ERR(dsi->dmd)) {
> +		ret =3D PTR_ERR(dsi->dmd);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to probe dw_mipi_dsi:=20
%d\n", ret);

Could you use dev_err_probe here instead?

Best regards,
Alexander

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void imx93_dsi_remove(struct platform_device *pdev)
> +{
> +	struct imx93_dsi *dsi =3D platform_get_drvdata(pdev);
> +
> +	dw_mipi_dsi_remove(dsi->dmd);
> +}
> +
> +static const struct of_device_id imx93_dsi_dt_ids[] =3D {
> +	{ .compatible =3D "fsl,imx93-mipi-dsi", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
> +
> +static struct platform_driver imx93_dsi_driver =3D {
> +	.probe	=3D imx93_dsi_probe,
> +	.remove_new =3D imx93_dsi_remove,
> +	.driver	=3D {
> +		.of_match_table =3D imx93_dsi_dt_ids,
> +		.name =3D "imx93_mipi_dsi",
> +	},
> +};
> +module_platform_driver(imx93_dsi_driver);
> +
> +MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


