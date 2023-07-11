Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AC74E7E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC110E325;
	Tue, 11 Jul 2023 07:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4310E322;
 Tue, 11 Jul 2023 07:23:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 702FD61353;
 Tue, 11 Jul 2023 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5387BC433C7;
 Tue, 11 Jul 2023 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689060230;
 bh=qbYz4YdnlVBC6ZlboMa+Y4t1L+EDVjf+K2hHxKyDeIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJm9vYPH+i6cTqoyiVXY602PAkAC2TRSs4UxCtOaDbFddCcYQQWQTXsnWeoCwehw8
 w9rJyMyf0rIWIRQj/HZKcke7wsNDlRZ+warix2eYyo2z2ycLP+G/UkrftS7Hw4UuPU
 8YVMnFOy+wzceRjI4CPcCS8oe/NZz0hnYApq+3V/nG1T/6gYkk63YYHwCQ36cNrI6D
 5Cd5sRzcMMBuJ+nq8r8yzSprjfpxkk2bsSMH2gxanAdjgHDeGRQsmC1qWQEEQV6gzP
 AvNhUBizZgecVardW/d3ZCwMIGpK+WRBWgnWQJuyUcGGoHwxpcTKD+F5kDrcZWcTZH
 YTEHn/X5OOgew==
Date: Tue, 11 Jul 2023 12:53:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 02/15] phy: qualcomm: add QMP HDMI PHY driver
Message-ID: <ZK0DgqRyTLE8OS/V@matsya>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
 <20230523121454.3460634-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523121454.3460634-3-dmitry.baryshkov@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-05-23, 15:14, Dmitry Baryshkov wrote:
> Port Qualcomm QMP HDMI PHY to the generic PHY framework. Split the
> generic part and the msm8996 part. When adding support for msm8992/4 and
> msm8998 (which also employ QMP for HDMI PHY), one will have to provide
> the PLL programming part only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/Kconfig                  |   7 +
>  drivers/phy/qualcomm/Makefile                 |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c | 184 ++++++++
>  .../phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c  | 441 ++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h      |  75 +++
>  5 files changed, 712 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 4850d48f31fa..94fb5679df4a 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -65,6 +65,13 @@ config PHY_QCOM_QMP_COMBO
>  	  Enable this to support the QMP Combo PHY transceiver that is used
>  	  with USB3 and DisplayPort controllers on Qualcomm chips.
>  
> +config PHY_QCOM_QMP_HDMI
> +	tristate "Qualcomm QMP HDMI PHY Driver"
> +	default PHY_QCOM_QMP && DRM_MSM_HDMI
> +	help
> +	  Enable this to support the QMP HDMI PHY transceiver that is used
> +	  with HDMI output on Qualcomm MSM8996 chips.
> +
>  config PHY_QCOM_QMP_PCIE
>  	tristate "Qualcomm QMP PCIe PHY Driver"
>  	depends on PCI || COMPILE_TEST
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index de3dc9ccf067..b877d86ea0b1 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,7 +6,12 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  
> +phy-qcom-qmp-hdmi-y := \
> +	phy-qcom-qmp-hdmi-base.o \
> +	phy-qcom-qmp-hdmi-msm8996.o \
> +
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o
> +obj-$(CONFIG_PHY_QCOM_QMP_HDMI)		+= phy-qcom-qmp-hdmi.o
>  obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
>  obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
>  obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
> new file mode 100644
> index 000000000000..08132b3f82af
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +#include "phy-qcom-qmp-hdmi.h"
> +
> +int qmp_hdmi_phy_init(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	return pm_runtime_resume_and_get(hdmi_phy->dev);
> +}
> +
> +int qmp_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +        const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);

wrong alignment

> +        int ret = 0;
> +
> +        memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
> +
> +        return ret;

drop ret, and return 0 here?

> +}
> +
> +int qmp_hdmi_phy_exit(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	pm_runtime_put_noidle(hdmi_phy->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qmp_hdmi_runtime_resume(struct device *dev)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	if (ret)
> +		goto out_disable_supplies;
> +
> +	return 0;
> +
> +out_disable_supplies:
> +	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused qmp_hdmi_runtime_suspend(struct device *dev)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +
> +	return 0;
> +}
> +
> +static int qmp_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct clk_init_data init = {
> +		.name = "hdmipll",
> +		.parent_data = (const struct clk_parent_data[]) {
> +			{ .fw_name = "xo", .name = "xo_board" },
> +		},
> +		.flags = CLK_GET_RATE_NOCACHE,
> +		.num_parents = 1,
> +	};
> +	const struct qmp_hdmi_cfg *cfg = of_device_get_match_data(&pdev->dev);
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct qmp_hdmi_phy *hdmi_phy;
> +	int ret, i;
> +
> +	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
> +	if (!hdmi_phy)
> +		return -ENOMEM;
> +
> +	hdmi_phy->dev = dev;
> +
> +	hdmi_phy->serdes = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(hdmi_phy->serdes))
> +		return PTR_ERR(hdmi_phy->serdes);
> +
> +	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +		hdmi_phy->tx[i] = devm_platform_ioremap_resource(pdev, 1 + i);
> +		if (IS_ERR(hdmi_phy->tx[i]))
> +			return PTR_ERR(hdmi_phy->tx[i]);
> +	}
> +
> +	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 5);
> +	if (IS_ERR(hdmi_phy->phy_reg))
> +		return PTR_ERR(hdmi_phy->phy_reg);
> +
> +	hdmi_phy->clks[0].id = "iface";
> +	hdmi_phy->clks[1].id = "ref";
> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	if (ret)
> +		return ret;
> +
> +	hdmi_phy->supplies[0].supply = "vddio";
> +	hdmi_phy->supplies[0].init_load_uA = 100000;
> +	hdmi_phy->supplies[1].supply = "vcca";
> +	hdmi_phy->supplies[1].init_load_uA = 10000;
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, hdmi_phy);
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	init.ops = cfg->pll_ops;
> +	hdmi_phy->pll_hw.init = &init;
> +	ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
> +	if (ret)
> +		goto err;
> +
> +	ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
> +	if (ret)
> +		goto err;
> +
> +	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, cfg->phy_ops);
> +	if (IS_ERR(hdmi_phy->phy)) {
> +		ret = PTR_ERR(hdmi_phy->phy);
> +		goto err;
> +	}
> +
> +	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +
> +err:
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id qmp_hdmi_of_match_table[] = {
> +	{
> +		.compatible = "qcom,hdmi-phy-8996", .data = &qmp_hdmi_8996_cfg,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qmp_hdmi_of_match_table);
> +
> +DEFINE_RUNTIME_DEV_PM_OPS(qmp_hdmi_pm_ops,
> +			  qmp_hdmi_runtime_suspend,
> +			  qmp_hdmi_runtime_resume,
> +			  NULL);
> +
> +static struct platform_driver qmp_hdmi_driver = {
> +	.probe		= qmp_hdmi_probe,
> +	.driver = {
> +		.name	= "qcom-qmp-hdmi-phy",
> +		.of_match_table = qmp_hdmi_of_match_table,
> +		.pm     = &qmp_hdmi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(qmp_hdmi_driver);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("Qualcomm QMP HDMI PHY driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
> new file mode 100644
> index 000000000000..27ffa70d0faa
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +
> +#include "phy-qcom-qmp-hdmi.h"
> +#include "phy-qcom-qmp-qserdes-com.h"
> +#include "phy-qcom-qmp-qserdes-txrx.h"
> +
> +#define HDMI_VCO_MAX_FREQ			12000000000UL
> +#define HDMI_VCO_MIN_FREQ			8000000000UL

I prefer using 12 * GIGA etc to define these

> +static int qmp_hdmi_8996_phy_set_rate(struct qmp_hdmi_phy *hdmi_phy)
> +{
> +	unsigned long parent_rate = HDMI_DEFAULT_REF_CLOCK;
> +	unsigned long rate = hdmi_phy->hdmi_opts.pixel_clk_rate * 1000;
> +	struct qmp_hdmi_8996_post_divider pd;
> +	bool gen_ssc = false;
> +	u64 bclk;
> +	u64 dec_start;
> +	u64 frac_start;
> +	u64 fdata;
> +	u32 pll_divisor;
> +	u32 rem;
> +	u32 integloop_gain;
> +	u32 pll_cmp;
> +	int i, ret;
> +
> +	bclk = ((u64)rate) * 10;
> +	ret = qmp_hdmi_8996_pll_get_post_div(&pd, bclk);
> +	if (ret) {
> +		dev_err(hdmi_phy->dev, "PLL calculation failed\n");
> +		return ret;
> +	}
> +
> +	dec_start = pd.vco_freq;
> +	pll_divisor = 4 * parent_rate;
> +	do_div(dec_start, pll_divisor);
> +
> +	frac_start = pd.vco_freq * (1 << 20);
> +
> +	rem = do_div(frac_start, pll_divisor);
> +	frac_start -= dec_start * (1 << 20);
> +	if (rem > (pll_divisor >> 1))
> +		frac_start++;
> +
> +	fdata = pd.vco_freq;
> +	do_div(fdata, pd.vco_ratio);
> +
> +	pll_cmp = qmp_hdmi_8996_pll_get_pll_cmp(fdata, parent_rate);
> +
> +	/* Initially shut down PHY */
> +	dev_dbg(hdmi_phy->dev, "Disabling PHY");
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x0);
> +	udelay(500);
> +
> +	/* Power up sequence */
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x04);
> +
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_RESETSM_CNTRL, 0x20);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0f);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0f);
> +
> +	hdmi_tx_chan_write(hdmi_phy, 0, QSERDES_TX_LANE_MODE, 0x43);
> +	hdmi_tx_chan_write(hdmi_phy, 2, QSERDES_TX_LANE_MODE, 0x43);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1e);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYS_CLK_CTRL, 0x02);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_ENABLE1, 0x0e);
> +
> +	if (frac_start != 0 || gen_ssc) {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x28);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0,
> +			       11000000 / (parent_rate/ 20));
> +		integloop_gain = (64 * parent_rate) / HDMI_DEFAULT_REF_CLOCK;
> +	} else {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x01);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x10);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0, 0x23);
> +		integloop_gain = (1022 * parent_rate) / (100 * 1000 * 1000);
> +	}
> +
> +	/* Bypass VCO calibration */
> +	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 1);
> +		integloop_gain <<= 1;
> +	} else {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 2);
> +		integloop_gain <<= 2;
> +	}
> +
> +	integloop_gain = min_t(u32, integloop_gain, 2046);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_TRIM, 0x0f);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_IVCO, 0x0f);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_VCO_TUNE_CTRL, 0);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x06);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_SELECT, 0x30);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_HSCLK_SEL, 0x20 | pd.hsclk_divsel);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP_EN, 0x0);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DEC_START_MODE0, dec_start);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START1_MODE0,
> +		       frac_start & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START2_MODE0,
> +		       (frac_start >> 8) & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START3_MODE0,
> +		       (frac_start >> 16) & 0xf);

FIELD_{PREP|GET} please

> +static int qmp_hdmi_8996_phy_power_on(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +	u32 status;
> +	int i, ret = 0;

superfluous init for ret
-- 
~Vinod
