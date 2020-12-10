Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A68C2D54CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 08:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5C6E2C7;
	Thu, 10 Dec 2020 07:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FC66E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 07:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 32803FB03;
 Thu, 10 Dec 2020 08:42:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sItMKxhJ1u22; Thu, 10 Dec 2020 08:42:31 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 52B4543BC6; Thu, 10 Dec 2020 08:14:58 +0100 (CET)
Date: Thu, 10 Dec 2020 08:14:58 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 4/4] phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp
 LVDS PHY mode support
Message-ID: <20201210071458.GA4978@bogon.m.sigxcpu.org>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-5-git-send-email-victor.liu@nxp.com>
 <20201208092440.GD20575@bogon.m.sigxcpu.org>
 <971966552900653b0d1714eb7d0ba17682b83780.camel@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <971966552900653b0d1714eb7d0ba17682b83780.camel@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 airlied@linux.ie, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, martin.kepplinger@puri.sm,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com, linux-imx@nxp.com,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, jonas@kwiboo.se
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Dec 08, 2020 at 06:03:05PM +0800, Liu Ying wrote:
> On Tue, 2020-12-08 at 10:24 +0100, Guido G=FCnther wrote:
> > Hi Liu,
> > some minor comments inline:
> > =

> > On Fri, Dec 04, 2020 at 03:33:44PM +0800, Liu Ying wrote:
> > > i.MX8qxp SoC embeds a Mixel MIPI DPHY + LVDS PHY combo which supports
> > > either a MIPI DSI display or a LVDS display.  The PHY mode is control=
led
> > > by SCU firmware and the driver would call a SCU firmware function to
> > > configure the PHY mode.  The single LVDS PHY has 4 data lanes to supp=
ort
> > > a LVDS display.  Also, with a master LVDS PHY and a slave LVDS PHY, t=
hey
> > > may work together to support a LVDS display with 8 data lanes(usually=
, dual
> > > LVDS link display).  Note that this patch supports the LVDS PHY mode =
only
> > > for the i.MX8qxp Mixel combo PHY, i.e., the MIPI DPHY mode is yet to =
be
> > > supported, so for now error would be returned from ->set_mode() if MI=
PI
> > > DPHY mode is passed over to it for the combo PHY.
> > > =

> > > Cc: Guido G=FCnther <agx@sigxcpu.org>
> > > Cc: Robert Chiras <robert.chiras@nxp.com>
> > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c | 266 +++++++++++++++=
+++++++++-
> > >  1 file changed, 255 insertions(+), 11 deletions(-)
> > > =

> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers=
/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > > index a95572b..37084a9 100644
> > > --- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > > +++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > > @@ -4,17 +4,31 @@
> > >   * Copyright 2019 Purism SPC
> > >   */
> > >  =

> > > +#include <linux/bitfield.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/firmware/imx/ipc.h>
> > > +#include <linux/firmware/imx/svc/misc.h>
> > >  #include <linux/io.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/mfd/syscon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/phy/phy.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/regmap.h>
> > > +#include <dt-bindings/firmware/imx/rsrc.h>
> > > +
> > > +/* Control and Status Registers(CSR) */
> > > +#define PHY_CTRL			0x00
> > > +#define  CCM_MASK			GENMASK(7, 5)
> > > +#define  CCM(n)				FIELD_PREP(CCM_MASK, (n))
> > > +#define  CA_MASK			GENMASK(4, 2)
> > > +#define  CA(n)				FIELD_PREP(CA_MASK, (n))
> > > +#define  RFB				BIT(1)
> > > +#define  LVDS_EN			BIT(0)
> > >  =

> > >  /* DPHY registers */
> > >  #define DPHY_PD_DPHY			0x00
> > > @@ -55,8 +69,15 @@
> > >  #define PWR_ON	0
> > >  #define PWR_OFF	1
> > >  =

> > > +#define MIN_VCO_FREQ 640000000
> > > +#define MAX_VCO_FREQ 1500000000
> > > +
> > > +#define MIN_LVDS_REFCLK_FREQ 24000000
> > > +#define MAX_LVDS_REFCLK_FREQ 150000000
> > > +
> > >  enum mixel_dphy_devtype {
> > >  	MIXEL_IMX8MQ,
> > > +	MIXEL_IMX8QXP,
> > >  };
> > >  =

> > >  struct mixel_dphy_devdata {
> > > @@ -65,6 +86,7 @@ struct mixel_dphy_devdata {
> > >  	u8 reg_rxlprp;
> > >  	u8 reg_rxcdrp;
> > >  	u8 reg_rxhs_settle;
> > > +	bool is_combo;	/* MIPI DPHY and LVDS PHY combo */
> > >  };
> > >  =

> > >  static const struct mixel_dphy_devdata mixel_dphy_devdata[] =3D {
> > > @@ -74,6 +96,10 @@ static const struct mixel_dphy_devdata mixel_dphy_=
devdata[] =3D {
> > >  		.reg_rxlprp =3D 0x40,
> > >  		.reg_rxcdrp =3D 0x44,
> > >  		.reg_rxhs_settle =3D 0x48,
> > > +		.is_combo =3D false,
> > > +	},
> > > +	[MIXEL_IMX8QXP] =3D {
> > > +		.is_combo =3D true,
> > >  	},
> > >  };
> > >  =

> > > @@ -95,8 +121,12 @@ struct mixel_dphy_cfg {
> > >  struct mixel_dphy_priv {
> > >  	struct mixel_dphy_cfg cfg;
> > >  	struct regmap *regmap;
> > > +	struct regmap *lvds_regmap;
> > >  	struct clk *phy_ref_clk;
> > >  	const struct mixel_dphy_devdata *devdata;
> > > +	struct imx_sc_ipc *ipc_handle;
> > > +	bool is_slave;
> > > +	int id;
> > >  };
> > >  =

> > >  static const struct regmap_config mixel_dphy_regmap_config =3D {
> > > @@ -317,7 +347,8 @@ static int mixel_dphy_set_pll_params(struct phy *=
phy)
> > >  	return 0;
> > >  }
> > >  =

> > > -static int mixel_dphy_configure(struct phy *phy, union phy_configure=
_opts *opts)
> > > +static int
> > > +mixel_dphy_configure_mipi_dphy(struct phy *phy, union phy_configure_=
opts *opts)
> > >  {
> > >  	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > >  	struct mixel_dphy_cfg cfg =3D { 0 };
> > > @@ -345,15 +376,118 @@ static int mixel_dphy_configure(struct phy *ph=
y, union phy_configure_opts *opts)
> > >  	return 0;
> > >  }
> > >  =

> > > +static int
> > > +mixel_dphy_configure_lvds_phy(struct phy *phy, union phy_configure_o=
pts *opts)
> > > +{
> > > +	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > > +	struct phy_configure_opts_lvds *lvds_opts =3D &opts->lvds;
> > > +	unsigned long data_rate;
> > > +	unsigned long fvco;
> > > +	u32 rsc;
> > > +	u32 co;
> > > +	int ret;
> > > +
> > > +	priv->is_slave =3D lvds_opts->is_slave;
> > > +
> > > +	/* LVDS interface pins */
> > > +	regmap_write(priv->lvds_regmap, PHY_CTRL, CCM(0x5) | CA(0x4) | RFB);
> > > +
> > > +	/* enable MODE8 only for slave LVDS PHY */
> > > +	rsc =3D priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
> > > +	ret =3D imx_sc_misc_set_control(priv->ipc_handle, rsc, IMX_SC_C_DUA=
L_MODE,
> > > +				      lvds_opts->is_slave);
> > > +	if (ret) {
> > > +		dev_err(&phy->dev, "Failed to configure MODE8: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Choose an appropriate divider ratio to meet the requirement of
> > > +	 * PLL VCO frequency range.
> > > +	 *
> > > +	 *  -----  640MHz ~ 1500MHz   ------------      ---------------
> > > +	 * | VCO | ----------------> | CO divider | -> | LVDS data rate|
> > > +	 *  -----       FVCO          ------------      ---------------
> > > +	 *                            1/2/4/8 div     7 * differential_clk_=
rate
> > > +	 */
> > > +	data_rate =3D 7 * lvds_opts->differential_clk_rate;
> > > +	for (co =3D 1; co <=3D 8; co *=3D 2) {
> > > +		fvco =3D data_rate * co;
> > > +
> > > +		if (fvco >=3D MIN_VCO_FREQ)
> > > +			break;
> > > +	}
> > > +
> > > +	if (fvco < MIN_VCO_FREQ || fvco > MAX_VCO_FREQ) {
> > > +		dev_err(&phy->dev, "VCO frequency %lu is out of range\n", fvco);
> > > +		return -ERANGE;
> > > +	}
> > > +
> > > +	/*
> > > +	 * CO is configurable, while CN and CM are not,
> > > +	 * as fixed ratios 1 and 7 are applied respectively.
> > > +	 */
> > > +	phy_write(phy, __ffs(co), DPHY_CO);
> > > +
> > > +	/* set reference clock rate */
> > > +	clk_set_rate(priv->phy_ref_clk, lvds_opts->differential_clk_rate);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int mixel_dphy_configure(struct phy *phy, union phy_configure=
_opts *opts)
> > > +{
> > > +	if (phy->attrs.mode =3D=3D PHY_MODE_MIPI_DPHY)
> > > +		return mixel_dphy_configure_mipi_dphy(phy, opts);
> > > +	else if (phy->attrs.mode =3D=3D PHY_MODE_LVDS)
> > > +		return mixel_dphy_configure_lvds_phy(phy, opts);
> > > +
> > > +	dev_err(&phy->dev, "Failed to configure PHY with invalid PHY mode\n=
");
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int
> > > +mixel_dphy_validate_lvds_phy(struct phy *phy, union phy_configure_op=
ts *opts)
> > > +{
> > > +	struct phy_configure_opts_lvds *lvds_cfg =3D &opts->lvds;
> > > +
> > > +	if (lvds_cfg->bits_per_lane_and_dclk_cycle !=3D 7) {
> > > +		dev_err(&phy->dev, "Invalid bits per LVDS data lane: %u\n",
> > > +					lvds_cfg->bits_per_lane_and_dclk_cycle);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (lvds_cfg->lanes !=3D 4) {
> > > +		dev_err(&phy->dev, "Invalid LVDS data lanes: %u\n",
> > > +						lvds_cfg->lanes);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (lvds_cfg->differential_clk_rate < MIN_LVDS_REFCLK_FREQ ||
> > > +	    lvds_cfg->differential_clk_rate > MAX_LVDS_REFCLK_FREQ) {
> > > +		dev_err(&phy->dev,
> > > +			"Invalid LVDS differential clock rate: %lu\n",
> > > +					lvds_cfg->differential_clk_rate);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mixel_dphy_validate(struct phy *phy, enum phy_mode mode, =
int submode,
> > >  			       union phy_configure_opts *opts)
> > >  {
> > > -	struct mixel_dphy_cfg cfg =3D { 0 };
> > > +	if (mode =3D=3D PHY_MODE_MIPI_DPHY) {
> > > +		struct mixel_dphy_cfg mipi_dphy_cfg =3D { 0 };
> > >  =

> > > -	if (mode !=3D PHY_MODE_MIPI_DPHY)
> > > -		return -EINVAL;
> > > +		return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy,
> > > +							&mipi_dphy_cfg);
> > > +	} else if (mode =3D=3D PHY_MODE_LVDS) {
> > > +		return mixel_dphy_validate_lvds_phy(phy, opts);
> > > +	}
> > >  =

> > > -	return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
> > > +	dev_err(&phy->dev, "Failed to validate PHY with invalid PHY mode\n"=
);
> > =

> > Can you print the `mode` here so it becomes obvious from the error what
> > incorrect mode got passed in?
> =

> Will do in the next version.
> =

> > =

> > > +	return -EINVAL;
> > >  }
> > >  =

> > >  static int mixel_dphy_init(struct phy *phy)
> > > @@ -373,27 +507,74 @@ static int mixel_dphy_exit(struct phy *phy)
> > >  	return 0;
> > >  }
> > >  =

> > > -static int mixel_dphy_power_on(struct phy *phy)
> > > +static int mixel_dphy_power_on_mipi_dphy(struct phy *phy)
> > >  {
> > >  	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > >  	u32 locked;
> > >  	int ret;
> > >  =

> > > -	ret =3D clk_prepare_enable(priv->phy_ref_clk);
> > > -	if (ret < 0)
> > > -		return ret;
> > > -
> > >  	phy_write(phy, PWR_ON, DPHY_PD_PLL);
> > >  	ret =3D regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
> > >  				       locked, PLL_LOCK_SLEEP,
> > >  				       PLL_LOCK_TIMEOUT);
> > >  	if (ret < 0) {
> > >  		dev_err(&phy->dev, "Could not get DPHY lock (%d)!\n", ret);
> > > -		goto clock_disable;
> > > +		return ret;
> > >  	}
> > >  	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
> > >  =

> > >  	return 0;
> > > +}
> > > +
> > > +static int mixel_dphy_power_on_lvds_phy(struct phy *phy)
> > > +{
> > > +	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > > +	u32 locked;
> > > +	int ret;
> > > +
> > > +	regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, LVDS_EN);
> > > +
> > > +	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
> > > +	phy_write(phy, PWR_ON, DPHY_PD_PLL);
> > > +
> > > +	/* do not wait for slave LVDS PHY being locked */
> > > +	if (priv->is_slave)
> > > +		return 0;
> > > +
> > > +	ret =3D regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
> > > +				       locked, PLL_LOCK_SLEEP,
> > > +				       PLL_LOCK_TIMEOUT);
> > > +	if (ret < 0) {
> > > +		dev_err(&phy->dev, "Could not get LVDS PHY lock (%d)!\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mixel_dphy_power_on(struct phy *phy)
> > > +{
> > > +	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > > +	int ret;
> > > +
> > > +	ret =3D clk_prepare_enable(priv->phy_ref_clk);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (phy->attrs.mode =3D=3D PHY_MODE_MIPI_DPHY) {
> > > +		ret =3D mixel_dphy_power_on_mipi_dphy(phy);
> > > +	} else if (phy->attrs.mode =3D=3D PHY_MODE_LVDS) {
> > > +		ret =3D mixel_dphy_power_on_lvds_phy(phy);
> > > +	} else {
> > > +		dev_err(&phy->dev,
> > > +			"Failed to power on PHY with invalid PHY mode\n");
> > =

> > Can you print the `mode` here so it becomes obvious from the error what
> > incorrect mode got passed in?
> =

> Will do in the next version.
> =

> > =

> > > +		ret =3D -EINVAL;
> > > +	}
> > > +
> > > +	if (ret)
> > > +		goto clock_disable;
> > > +
> > > +	return 0;
> > >  clock_disable:
> > >  	clk_disable_unprepare(priv->phy_ref_clk);
> > >  	return ret;
> > > @@ -406,16 +587,52 @@ static int mixel_dphy_power_off(struct phy *phy)
> > >  	phy_write(phy, PWR_OFF, DPHY_PD_PLL);
> > >  	phy_write(phy, PWR_OFF, DPHY_PD_DPHY);
> > >  =

> > > +	if (phy->attrs.mode =3D=3D PHY_MODE_LVDS)
> > > +		regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, 0);
> > > +
> > >  	clk_disable_unprepare(priv->phy_ref_clk);
> > >  =

> > >  	return 0;
> > >  }
> > >  =

> > > +static int mixel_dphy_set_mode(struct phy *phy, enum phy_mode mode, =
int submode)
> > > +{
> > > +	struct mixel_dphy_priv *priv =3D phy_get_drvdata(phy);
> > > +	int ret;
> > > +
> > =

> > I'd reject all modes except PHY_MODE_MIPI_DPHY and PHY_MODE_MIPI_LVDS u=
pfront...
> =

> It seems that this overall rejection would cause _double_ check
> together with the snippet right below, which should be avoided.
> =

> > =

> > > +	/* Currently, MIPI DPHY mode only, if it's not a combo PHY. */
> > > +	if (!priv->devdata->is_combo && mode !=3D PHY_MODE_MIPI_DPHY) {
> > > +		dev_err(&phy->dev, "Failed to set PHY mode to MIPI DPHY\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (priv->devdata->is_combo && mode !=3D PHY_MODE_LVDS) {
> > > +		dev_err(&phy->dev, "Failed to set PHY mode for combo PHY\n");
> > > +		return -EINVAL;
> > > +	}
> > =

> > ...and then just reject on whetehr `is_combo` is set or not. This makes
> > it easier to add more later.
> =

> The above snippet is rejecting on whether 'is_combo' is set or not.
> So, in short, the current implementation looks ok to me.
> Or, things still can be improved here?

I agree, i think what tripped me up is that the double negative check
comes first comined with the comment so i'd just drop the comment and
start with the positive one:

	if (priv->devdata->is_combo && mode !=3D PHY_MODE_LVDS) {
		dev_err(&phy->dev, "Failed to set PHY mode for combo PHY\n");
		return -EINVAL;
	}

	if (!priv->devdata->is_combo && mode !=3D PHY_MODE_MIPI_DPHY) {
		dev_err(&phy->dev, "Failed to set PHY mode to MIPI DPHY\n");
		return -EINVAL;
	}

Cheers,
 -- Guido

> =

> Thanks,
> Liu Ying
> =

> > =

> > > +	if (priv->devdata->is_combo) {
> > > +		u32 rsc =3D priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
> > > +
> > > +		ret =3D imx_sc_misc_set_control(priv->ipc_handle,
> > > +					      rsc, IMX_SC_C_MODE,
> > > +					      mode =3D=3D PHY_MODE_LVDS);
> > > +		if (ret) {
> > > +			dev_err(&phy->dev,
> > > +				"Failed to set PHY mode via SCU ipc: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct phy_ops mixel_dphy_phy_ops =3D {
> > >  	.init =3D mixel_dphy_init,
> > >  	.exit =3D mixel_dphy_exit,
> > >  	.power_on =3D mixel_dphy_power_on,
> > >  	.power_off =3D mixel_dphy_power_off,
> > > +	.set_mode =3D mixel_dphy_set_mode,
> > >  	.configure =3D mixel_dphy_configure,
> > >  	.validate =3D mixel_dphy_validate,
> > >  	.owner =3D THIS_MODULE,
> > > @@ -424,6 +641,8 @@ static const struct phy_ops mixel_dphy_phy_ops =
=3D {
> > >  static const struct of_device_id mixel_dphy_of_match[] =3D {
> > >  	{ .compatible =3D "fsl,imx8mq-mipi-dphy",
> > >  	  .data =3D &mixel_dphy_devdata[MIXEL_IMX8MQ] },
> > > +	{ .compatible =3D "fsl,imx8qxp-mipi-dphy",
> > > +	  .data =3D &mixel_dphy_devdata[MIXEL_IMX8QXP] },
> > >  	{ /* sentinel */ },
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mixel_dphy_of_match);
> > > @@ -436,6 +655,7 @@ static int mixel_dphy_probe(struct platform_devic=
e *pdev)
> > >  	struct mixel_dphy_priv *priv;
> > >  	struct phy *phy;
> > >  	void __iomem *base;
> > > +	int ret;
> > >  =

> > >  	if (!np)
> > >  		return -ENODEV;
> > > @@ -467,6 +687,30 @@ static int mixel_dphy_probe(struct platform_devi=
ce *pdev)
> > >  	dev_dbg(dev, "phy_ref clock rate: %lu\n",
> > >  		clk_get_rate(priv->phy_ref_clk));
> > >  =

> > > +	if (priv->devdata->is_combo) {
> > > +		priv->lvds_regmap =3D
> > > +			syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
> > > +		if (IS_ERR(priv->lvds_regmap)) {
> > > +			ret =3D PTR_ERR(priv->lvds_regmap);
> > > +			dev_err_probe(dev, ret, "Failed to get LVDS regmap\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		priv->id =3D of_alias_get_id(np, "mipi_dphy");
> > > +		if (priv->id < 0) {
> > > +			dev_err(dev, "Failed to get phy node alias id: %d\n",
> > > +								 priv->id);
> > > +			return priv->id;
> > > +		}
> > > +
> > > +		ret =3D imx_scu_get_handle(&priv->ipc_handle);
> > > +		if (ret) {
> > > +			dev_err_probe(dev, ret,
> > > +				      "Failed to get SCU ipc handle\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >  	dev_set_drvdata(dev, priv);
> > >  =

> > >  	phy =3D devm_phy_create(dev, np, &mixel_dphy_phy_ops);
> > > -- =

> > > 2.7.4
> > > =

> > =

> > Cheers,
> >  -- Guido
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
