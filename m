Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A1A3C2EB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5756310E821;
	Wed, 19 Feb 2025 15:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014BC10E349
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:02:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tkla9-0004IU-Do; Wed, 19 Feb 2025 16:01:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tkla6-001mdz-12;
 Wed, 19 Feb 2025 16:01:46 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tkla6-0009xm-0e;
 Wed, 19 Feb 2025 16:01:46 +0100
Message-ID: <ef2026c28b9e6d59a98f6f33eb14f3b762454423.camel@pengutronix.de>
Subject: Re: [PATCH v5 12/21] reset: thead: Add TH1520 reset controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org,  m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Date: Wed, 19 Feb 2025 16:01:46 +0100
In-Reply-To: <20250219140239.1378758-13-m.wilczynski@samsung.com>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140305eucas1p26317b54727c68cf069458d270e06d962@eucas1p2.samsung.com>
 <20250219140239.1378758-13-m.wilczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mi, 2025-02-19 at 15:02 +0100, Michal Wilczynski wrote:
> Add reset controller driver for the T-HEAD TH1520 SoC that manages
> hardware reset lines for various subsystems. The driver currently
> implements support for GPU reset control, with infrastructure in place
> to extend support for NPU and Watchdog Timer resets in future updates.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  10 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-th1520.c | 141 +++++++++++++++++++++++++++++++++++
>  4 files changed, 153 insertions(+)
>  create mode 100644 drivers/reset/reset-th1520.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 819686e98214..e4a0a83b4c11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20425,6 +20425,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5b3abb6db248..fa0943c3d1de 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -272,6 +272,16 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
> =20
> +config RESET_TH1520
> +	tristate "T-HEAD 1520 reset controller"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  This driver provides support for the T-HEAD TH1520 SoC reset controll=
er,
> +	  which manages hardware reset lines for SoC components such as the GPU=
.
> +	  Enable this option if you need to control hardware resets on TH1520-b=
ased
> +	  systems.
> +
>  config RESET_TI_SCI
>  	tristate "TI System Control Interface (TI-SCI) reset driver"
>  	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=3Dn)
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 677c4d1e2632..d6c2774407ae 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> +obj-$(CONFIG_RESET_TH1520) +=3D reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) +=3D reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) +=3D reset-ti-syscon.o
>  obj-$(CONFIG_RESET_TI_TPS380X) +=3D reset-tps380x.o
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> new file mode 100644
> index 000000000000..d6816c86ba95
> --- /dev/null
> +++ b/drivers/reset/reset-th1520.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/reset/thead,th1520-reset.h>
> +
> + /* register offset in VOSYS_REGMAP */
> +#define TH1520_GPU_RST_CFG		0x0
> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
> +
> +/* register values */
> +#define TH1520_GPU_SW_GPU_RST		BIT(0)
> +#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
> +
> +struct th1520_reset_priv {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +};
> +
> +struct th1520_reset_map {
> +	u32 bit;
> +	u32 reg;
> +};
> +
> +static const struct th1520_reset_map th1520_resets[] =3D {
> +	[TH1520_RESET_ID_GPU] =3D {
> +		.bit =3D TH1520_GPU_SW_GPU_RST,
> +		.reg =3D TH1520_GPU_RST_CFG,
> +	},
> +	[TH1520_RESET_ID_GPU_CLKGEN] =3D {
> +		.bit =3D TH1520_GPU_SW_CLKGEN_RST,
> +		.reg =3D TH1520_GPU_RST_CFG,
> +	}

I expect the NPU and WDT resets will be added to this list later?

> +};
> +
> +static inline struct th1520_reset_priv *
> +to_th1520_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
> +}
> +
> +static int th1520_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
> +	const struct th1520_reset_map *reset;
> +
> +	if (id >=3D ARRAY_SIZE(th1520_resets))
> +		return -EINVAL;

This check is not necessary. The core will have checked this in
of_reset_simple_xlate() before returning the reset control.

> +
> +	reset =3D &th1520_resets[id];
> +
> +	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
> +}
> +
> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
> +	const struct th1520_reset_map *reset;
> +
> +	if (id >=3D ARRAY_SIZE(th1520_resets))
> +		return -EINVAL;

This check is not necessary.

> +
> +	reset =3D &th1520_resets[id];
> +
> +	return regmap_update_bits(priv->map, reset->reg, reset->bit,
> +				  reset->bit);
> +}
> +
> +static const struct reset_control_ops th1520_reset_ops =3D {
> +	.assert	=3D th1520_reset_assert,
> +	.deassert =3D th1520_reset_deassert,
> +};
> +
> +static const struct regmap_config th1520_reset_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.fast_io =3D true,
> +};
> +
> +static int th1520_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct th1520_reset_priv *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map =3D devm_regmap_init_mmio(dev, base,
> +					  &th1520_reset_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	/* Initialize GPU resets to asserted state */
> +	ret =3D regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
> +				 TH1520_GPU_RST_CFG_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.nr_resets =3D 2;

Better use ARRAY_SIZE(th1520_resets) here, this will simplify adding
further resets in the future. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
