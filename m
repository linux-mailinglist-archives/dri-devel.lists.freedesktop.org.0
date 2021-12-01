Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464C464E6C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E766FC26;
	Wed,  1 Dec 2021 13:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC96FC26
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:03:00 +0000 (UTC)
Date: Wed, 01 Dec 2021 13:02:45 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
In-Reply-To: <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mar., nov. 30 2021 at 22:26:37 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> A specialisation of the generic Synopsys HDMI driver is employed for
> JZ4780 HDMI support. This requires a new driver, plus device tree and
> configuration modifications.
>=20
> Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>  drivers/gpu/drm/ingenic/Makefile          |   1 +
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 138=20
> ++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>=20
> diff --git a/drivers/gpu/drm/ingenic/Kconfig=20
> b/drivers/gpu/drm/ingenic/Kconfig
> index 3b57f8be007c4..4efc709d77b0a 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
>=20
>  	  The Image Processing Unit (IPU) will appear as a second primary=20
> plane.
>=20
> +config DRM_INGENIC_DW_HDMI
> +	tristate "Ingenic specific support for Synopsys DW HDMI"
> +	depends on MACH_JZ4780
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this option to enable Synopsys DesignWare HDMI based=20
> driver.
> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
> +	  select this option..
> +
>  endif
> diff --git a/drivers/gpu/drm/ingenic/Makefile=20
> b/drivers/gpu/drm/ingenic/Makefile
> index d313326bdddbb..f10cc1c5a5f22 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>  ingenic-drm-y =3D ingenic-drm-drv.o
>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
> +obj-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c=20
> b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> new file mode 100644
> index 0000000000000..199e39c227d29
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + *
> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
> + * Probe and remove operations derived from rcar_dw_hdmi.c.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] =3D {
> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2,=20
> 0x0000 } } },
> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142,=20
> 0x0005 } } },
> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2,=20
> 0x000a } } },
> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002,=20
> 0x000f } } },
> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000,=20
> 0x0000 } } }
> +};
> +
> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] =3D {
> +	/*pixelclk     bpp8    bpp10   bpp12 */
> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
> +};
> +
> +/*
> + * Resistance term 133Ohm Cfg
> + * PREEMP config 0.00
> + * TX/CK level 10
> + */
> +static const struct dw_hdmi_phy_config ingenic_phy_config[] =3D {
> +	/*pixelclk   symbol   term   vlev */
> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
> +};
> +
> +static enum drm_mode_status
> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +	/* FIXME: Hardware is capable of 270MHz, but setup data is missing.=20
> */
> +	if (mode->clock > 216000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data =3D {
> +	.mpll_cfg   =3D ingenic_mpll_cfg,
> +	.cur_ctr    =3D ingenic_cur_ctr,
> +	.phy_config =3D ingenic_phy_config,
> +	.mode_valid =3D ingenic_dw_hdmi_mode_valid,
> +	.output_port	=3D 1,
> +};
> +
> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] =3D {
> +	{ .compatible =3D "ingenic,jz4780-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
> +
> +static void ingenic_dw_hdmi_cleanup(void *data)
> +{
> +	struct dw_hdmi *hdmi =3D (struct dw_hdmi *)data;
> +
> +	dw_hdmi_remove(hdmi);
> +}
> +
> +static void ingenic_dw_hdmi_disable_regulator(void *data)
> +{
> +	struct regulator *regulator =3D (struct regulator *)data;
> +
> +	regulator_disable(regulator);
> +}
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi;
> +	struct regulator *regulator;
> +	int ret;
> +
> +	hdmi =3D dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, ingenic_dw_hdmi_cleanup,=20
> hdmi);
> +	if (ret)
> +		return ret;
> +
> +	regulator =3D devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
> +	if (IS_ERR(regulator)) {
> +		ret =3D PTR_ERR(regulator);
> +
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s (%d)\n",
> +			      "hdmi-5v", ret);
> +
> +		return ret;
> +	}
> +
> +	if (!regulator)
> +		return 0;

Blank line here.

But I can add it myself when applying. I'll just wait for Rob's ack=20
first.

-Paul

> +	ret =3D regulator_enable(regulator);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Failed to enable hpd regulator: %d\n",
> +			      ret);
> +
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(&pdev->dev,=20
> ingenic_dw_hdmi_disable_regulator,
> +				       regulator);
> +}
> +
> +static struct platform_driver ingenic_dw_hdmi_driver =3D {
> +	.probe  =3D ingenic_dw_hdmi_probe,
> +	.driver =3D {
> +		.name =3D "dw-hdmi-ingenic",
> +		.of_match_table =3D ingenic_dw_hdmi_dt_ids,
> +	},
> +};
> +module_platform_driver(ingenic_dw_hdmi_driver);
> +
> +MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:dwhdmi-ingenic");
> --
> 2.33.0
>=20


