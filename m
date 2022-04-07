Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469654F7BA2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070C310E5C7;
	Thu,  7 Apr 2022 09:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963BB10E5C7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:29:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncOS8-0004Bg-EB; Thu, 07 Apr 2022 11:29:20 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncOS8-001aLn-C1; Thu, 07 Apr 2022 11:29:18 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ncOS5-00041P-Ki; Thu, 07 Apr 2022 11:29:17 +0200
Message-ID: <f410271385fc8901d7c1dac0187122eb96e96aaf.camel@pengutronix.de>
Subject: Re: [PATCH v0 07/10] phy: freescale: add Samsung HDMI PHY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team
 <linux-imx@nxp.com>
Date: Thu, 07 Apr 2022 11:29:17 +0200
In-Reply-To: <20220406160123.1272911-8-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-8-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-phy@lists.infradead.org, patchwork-lst@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mi, 2022-04-06 at 18:01 +0200, Lucas Stach wrote:
> This adds the driver for the Samsung HDMI PHY found on the
> i.MX8MP SoC.
>=20
> Heavily based on the PHY implementation in the downstream kernel
> written by Sandor Yu <Sandor.yu@nxp.com>, but also cleaned up
> quite a bit and extended to support runtime PM.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> FIXME: The PHY configuration could be cleaned up further, it
> currently has a lot of register writes that are same across
> all supported modes.

Agreed.

[...]
> ---
> =C2=A0drivers/phy/freescale/Kconfig                |    7 +
> =C2=A0drivers/phy/freescale/Makefile               |    1 +
> =C2=A0drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 1145 +++++++++++++++=
+++
> =C2=A03 files changed, 1153 insertions(+)
> =C2=A0create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
>=20
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfi=
g
> index f9c54cd02036..f80c92eb7c55 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -26,6 +26,13 @@ config PHY_FSL_IMX8M_PCIE
> =C2=A0	  Enable this to add support for the PCIE PHY as found on
> =C2=A0	  i.MX8M family of SOCs.
> =C2=A0
> +config PHY_FSL_SAMSUNG_HDMI_PHY
> +	tristate "Samsung HDMI PHY support"
> +	depends on OF && HAS_IOMEM
> +	select GENERIC_PHY

Why select GENERIC_PHY when all the driver does is register a clock?

[...]
> +struct fsl_samsung_hdmi_phy {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct clk *apbclk;
> +	struct clk *refclk;

refclk isn't really used beyond phy_clk_register, it doesn't have to be
stored in struct fsl_samsung_hdmi_phy.

> +
> +	/* clk provider */
> +	struct clk_hw hw;
> +	const struct phy_config *cur_cfg;
> +};
> +
> +static inline struct fsl_samsung_hdmi_phy *
> +to_fsl_samsung_hdmi_phy(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct fsl_samsung_hdmi_phy, hw);
> +}
> +
> +static void fsl_samsung_hdmi_phy_configure(struct fsl_samsung_hdmi_phy *=
phy,
> +					  const struct phy_config *cfg)
> +{
> +	int i;
> +
> +	/* HDMI PHY init */
> +	writeb(REG33_FIX_DA, phy->regs + PHY_REG_33);
> +
> +	for (i =3D 0; i < PHY_PLL_REGS_NUM; i++)
> +		writeb(cfg->regs[i], phy->regs + i * 4);
> +
> +	writeb(REG33_FIX_DA | REG33_MODE_SET_DONE , phy->regs + PHY_REG_33);
> +}
> +
> +static int phy_clk_prepare(struct clk_hw *hw)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> +	int ret =3D 0;
> +	u8 val;
> +
> +	return 0;

I'd say remove this line or pyh_clk_prepare().

> +	ret =3D readb_poll_timeout(phy->regs + PHY_REG_34, val,
> +				 val & REG34_PLL_LOCK,
> +				 20, 20000);
> +	if (ret)
> +		dev_err(phy->dev, "PLL failed to lock\n");
> +
> +	return ret;
> +}
> +
> +static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> +
> +	if (!phy->cur_cfg)
> +		return 0;
> +
> +	return phy->cur_cfg->clk_rate;
> +}
> +
> +static long phy_clk_round_rate(struct clk_hw *hw,
> +			       unsigned long rate, unsigned long *parent_rate)
> +{
> +	const struct phy_config *phy_cfg =3D phy_pll_cfg;
> +
> +	for (; phy_cfg->clk_rate !=3D 0; phy_cfg++)
> +		if (phy_cfg->clk_rate =3D=3D rate)

 * @round_rate: Given a target rate as input, returns the closest rate actu=
ally
 *              supported by the clock. The parent rate is an input/output
 *              parameter.

This should round, not -EINVAL on unsupported rates.

> +			break;
> +
> +	if (phy_cfg->clk_rate =3D=3D 0)
> +		return -EINVAL;
> +
> +	return phy_cfg->clk_rate;
> +}
> +
> +static int phy_clk_set_rate(struct clk_hw *hw,
> +			    unsigned long rate, unsigned long parent_rate)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> +	const struct phy_config *phy_cfg =3D phy_pll_cfg;
> +	int ret =3D 0;

Unnecessary initialization.

> +	u8 val;
> +
> +	for (; phy_cfg->clk_rate !=3D 0; phy_cfg++)
> +		if (phy_cfg->clk_rate =3D=3D rate)
> +			break;
> +
> +	if (phy_cfg->clk_rate =3D=3D 0)
> +		return -EINVAL;
> +
> +	phy->cur_cfg =3D phy_cfg;
> +
> +	fsl_samsung_hdmi_phy_configure(phy, phy_cfg);
> +
> +	ret =3D readb_poll_timeout(phy->regs + PHY_REG_34, val,
> +				 val & REG34_PLL_LOCK,
> +				 50, 20000);
> +	if (ret)
> +		dev_err(phy->dev, "PLL failed to lock\n");
> +
> +	return ret;
> +}
> +
> +static const struct clk_ops phy_clk_ops =3D {
> +	.prepare =3D phy_clk_prepare,
> +	.recalc_rate =3D phy_clk_recalc_rate,
> +	.round_rate =3D phy_clk_round_rate,
> +	.set_rate =3D phy_clk_set_rate,
> +};
> +
> +static int phy_clk_register(struct fsl_samsung_hdmi_phy *phy)
> +{
> +	struct device *dev =3D phy->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct clk_init_data init;
> +	const char *parent_name;
> +	struct clk *phyclk;
> +	int ret;
> +
> +	parent_name =3D __clk_get_name(phy->refclk);
> +
> +	init.parent_names =3D &parent_name;
> +	init.num_parents =3D 1;
> +	init.flags =3D 0;
> +	init.name =3D "hdmi_pclk";
> +	init.ops =3D &phy_clk_ops;
> +
> +	phy->hw.init =3D &init;
> +
> +	phyclk =3D devm_clk_register(dev, &phy->hw);
> +	if (IS_ERR(phyclk))
> +		return dev_err_probe(dev, PTR_ERR(phyclk),
> +				     "failed to register clock\n");
> +
> +	ret =3D of_clk_add_provider(np, of_clk_src_simple_get, phyclk);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register clock provider\n");
> +
> +	return 0;
> +}
> +
> +static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct fsl_samsung_hdmi_phy *phy;
> +	int ret;
> +
> +	phy =3D devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, phy);
> +	phy->dev =3D &pdev->dev;
> +
> +	phy->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->regs))
> +		return PTR_ERR(phy->regs);
> +
> +	phy->apbclk =3D devm_clk_get(phy->dev, "apb");
> +	if (IS_ERR(phy->apbclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->apbclk),
> +				     "failed to get apb clk\n");
> +
> +	phy->refclk =3D devm_clk_get(phy->dev, "ref");
> +	if (IS_ERR(phy->refclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
> +				     "failed to get ref clk\n");
> +
> +	ret =3D clk_prepare_enable(phy->apbclk);
> +	if (ret) {
> +		dev_err(phy->dev, "failed to enable apbclk\n");
> +		return ret;
> +	}
> +
> +	pm_runtime_get_noresume(phy->dev);
> +	pm_runtime_set_active(phy->dev);
> +	pm_runtime_enable(phy->dev);
> +
> +	ret =3D phy_clk_register(phy);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register clk failed\n");
> +		goto register_clk_failed;
> +	}
> +
> +	pm_runtime_put(phy->dev);
> +
> +	return 0;
> +
> +register_clk_failed:
> +	clk_disable_unprepare(phy->apbclk);
> +
> +	return ret;
> +}
> +
> +static int fsl_samsung_hdmi_phy_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int fsl_samsung_hdmi_phy_suspend(struct device *dev)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(phy->apbclk);
> +
> +	return 0;
> +}
> +
> +static int fsl_samsung_hdmi_phy_resume(struct device *dev)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(phy->apbclk);
> +	if (ret) {
> +		dev_err(phy->dev, "failed to enable apbclk\n");
> +		return ret;
> +	}
> +
> +	if (phy->cur_cfg)
> +		fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);

Not checking PLL lock during resume?


regards
Philipp
