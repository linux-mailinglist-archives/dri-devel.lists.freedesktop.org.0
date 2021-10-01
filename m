Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E9341EADA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F186EDDF;
	Fri,  1 Oct 2021 10:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C246EDDF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 10:15:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7783761A58;
 Fri,  1 Oct 2021 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633083348;
 bh=6OkkKuTDUFtCw7hZz6Ya2A+Pf+Ffnv6bXxcoXhBVx/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uA+EnGjksX2NTCPvzWxG3Nq9Wf91dXcfx0HH5lgMLckItBRNUQByy6kj4IrNrsxxk
 ombeJzFporun6CQD5B3HZ8OwP5xrp2gTcVhLdDvZFvcGe4bMPuyD+uXDRTvbbxHcB6
 1ZtOlviC/xXFRzGsgtSV3pBSD5PqRqlUwngGdsjlKXEqgW0JwA6tTIeVW3ufx5+j3Z
 on4gVNUmRhOUVgdysrpKh+W902C2R7mbXMh9+m9GhUyx+QNymso9x2oLnW1XcmDas0
 dJEHvsj8FcQ3c2412zAyz0QORWMvtqGEfnuS23203P5aTJa3JhH4x4qDlG62mimGN1
 7KQ+DUhGIKRzg==
Date: Fri, 1 Oct 2021 15:45:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <YVbfzxQ2sbGFDuKK@matsya>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-2-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907083723.7725-2-granquet@baylibre.com>
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

On 07-09-21, 10:37, Guillaume Ranquet wrote:
> Add basic support for the mediatek hdmi phy on MT8195 SoC
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/phy/mediatek/Makefile              |   1 +
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 777 +++++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 179 +++++
>  3 files changed, 957 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>  create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
> 
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index ace660fbed3a..8024961160ad 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
>  phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
>  phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
> +phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
>  obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
>  
>  phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> new file mode 100644
> index 000000000000..0cb46ab29257
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -0,0 +1,777 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

2021 

> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/nvmem-consumer.h>
> +
> +#include "phy-mtk-hdmi-mt8195.h"
> +#include "phy-mtk-hdmi.h"
> +
> +static inline bool mtk_hdmi_phy_readbit(struct mtk_hdmi_phy *hdmi_phy,
> +					unsigned short reg, unsigned int offset)
> +{
> +	return (readl(hdmi_phy->regs + reg) & offset);
> +}
> +
> +/*********Analog API export to HDMI Digital start*****/
> +static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
> +{
> +	/*make data fifo writable for hdmi2.0*/

pls run checkpatch --strict to check for code style issues

> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_ANA_CTL, reg_ana_hdmi20_fifo_en,
> +			  reg_ana_hdmi20_fifo_en);
> +}
> +
> +void mtk_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy *hdmi_phy, bool enable)
> +{
> +	mtk_hdmi_ana_fifo_en(hdmi_phy);
> +
> +	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
> +	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
> +	 */

        /*
         * I prefer this generic
         * kernel style, pls use this!
         */

> +	if (enable)
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG,
> +				  (0x2 << reg_txc_div_SHIFT), reg_txc_div);
> +	else
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG, 0, reg_txc_div);
> +}
> +
> +/*********Analog API export to HDMI Digital end*******/
> +
> +static int mtk_hdmi_pll_select_source(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +			0x0 << REG_HDMITX_REF_XTAL_SEL_SHIFT,
> +			REG_HDMITX_REF_XTAL_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +			0x0 << REG_HDMITX_REF_RESPLL_SEL_SHIFT,
> +			REG_HDMITX_REF_RESPLL_SEL);

Have you looked into helpers in bitfield.h, they help in avoiding using
these shift defines

> +
> +	/*DA_HDMITX21_REF_CK for TXPLL input source*/
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITXPLL_REF_CK_SEL_SHIFT,
> +			  RG_HDMITXPLL_REF_CK_SEL);
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_pll_performance_setting(struct clk_hw *hw)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	/* no matter pll input source is HDMIRX_REF_CK, xTal26M or TVD PLL,
> +	 * the performance configuration is the same.
> +	 * RG_HDMITXPLL_BP2 always 1'b1 = 0x1
> +	 * RG_HDMITXPLL_BC[1:0] always 2'b11 = 0x3
> +	 * RG_HDMITXPLL_IC[4:0] always 5'b00001 = 0x1
> +	 * RG_HDMITXPLL_BR[2:0] stage treatment:
> +	 *      24bit or 48bit->3'b001 = 0x1
> +	 *      30bit or 36bit->3'b011 = 0x3
> +	 * RG_HDMITXPLL_IR[4:0] stage treatment:
> +	 *      24bit,30bit,48bit ->5'b00010 = 0x2
> +	 *      36bit ->5'b00011 = 0x3
> +	 * RG_HDMITXPLL_BP[3:0] always 4'b1111 = 0xf
> +	 * RG_HDMITXPLL_IBAND_FIX_EN, RG_HDMITXPLL_RESERVE[14] always 2'b00 = 0x0
> +	 * RG_HDMITXPLL_HIKVCO always 1'b1 = 0x1
> +	 */
> +
> +	/* BP2 */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_BP2_SHIFT, RG_HDMITXPLL_BP2);
> +
> +	/* BC */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x3 << RG_HDMITXPLL_BC_SHIFT, RG_HDMITXPLL_BC);
> +
> +	/* IC */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_IC_SHIFT, RG_HDMITXPLL_IC);
> +
> +	/* BR */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			0x2 << RG_HDMITXPLL_BR_SHIFT,
> +			RG_HDMITXPLL_BR);
> +
> +	/* IR */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			0x2 << RG_HDMITXPLL_IR_SHIFT,
> +			RG_HDMITXPLL_IR);
> +
> +	/* BP */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0xf << RG_HDMITXPLL_BP_SHIFT, RG_HDMITXPLL_BP);
> +
> +	/* IBAND_FIX_EN, RESERVE[14] */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x0 << RG_HDMITXPLL_IBAND_FIX_EN_SHIFT,
> +			  RG_HDMITXPLL_IBAND_FIX_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT14);
> +
> +	/* HIKVCO */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x0 << RG_HDMITXPLL_HIKVCO_SHIFT,
> +			  RG_HDMITXPLL_HIKVCO);
> +
> +	/* HREN */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_HREN_SHIFT, RG_HDMITXPLL_HREN);
> +
> +	/* LVR_SEL */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_LVR_SEL_SHIFT,
> +			  RG_HDMITXPLL_LVR_SEL);
> +
> +	/* RG_HDMITXPLL_RESERVE[12:11] */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x3 << RG_HDMITXPLL_RESERVE_BIT12_11_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT12_11);
> +
> +	/* TCL_EN */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
> +			  0x1 << RG_HDMITXPLL_TCL_EN_SHIFT,
> +			  RG_HDMITXPLL_TCL_EN);
> +
> +	/* disable read calibration impedance from efuse */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_1,
> +			0x1f << RG_INTR_IMP_RG_MODE_SHIFT,
> +			RG_INTR_IMP_RG_MODE);
> +
> +	return 0;
> +}
> +
> +static int
> +mtk_hdmi_pll_set_hw(struct clk_hw *hw,
> +		      unsigned char prediv,
> +		      unsigned char fbkdiv_high, unsigned long fbkdiv_low,
> +		      unsigned char fbkdiv_hs3, unsigned char posdiv1,
> +		      unsigned char posdiv2, unsigned char txprediv,
> +		      unsigned char txposdiv, unsigned char digital_div)
> +{
> +	unsigned char txposdiv_value = 0;
> +	unsigned char div3_ctrl_value = 0;
> +	unsigned char posdiv_vallue = 0;
> +	unsigned char div_ctrl_value = 0;
> +	unsigned char reserve_3_2_value = 0;
> +	unsigned char prediv_value = 0;
> +	unsigned char reserve13_value = 0;
> +
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_pll_select_source(hw);
> +
> +	mtk_hdmi_pll_performance_setting(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x2 << RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_BG_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_9,
> +			  0x2 << RG_HDMITX21_SLDO_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_SLDO_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_VREF_SELB);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x1 << RG_HDMITX21_SLDOLPF_EN_SHIFT,
> +			  RG_HDMITX21_SLDOLPF_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x11 << RG_HDMITX21_INTR_CAL_SHIFT,
> +			  RG_HDMITX21_INTR_CAL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_PWD_SHIFT, RG_HDMITXPLL_PWD);
> +
> +	/* TXPOSDIV */
> +	if (txposdiv == 1)
> +		txposdiv_value = 0x0;
> +	else if (txposdiv == 2)
> +		txposdiv_value = 0x1;
> +	else if (txposdiv == 4)
> +		txposdiv_value = 0x2;
> +	else if (txposdiv == 8)
> +		txposdiv_value = 0x3;
> +	else
> +		return -EINVAL;

switch seems apt for this!

> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  txposdiv_value << RG_HDMITX21_TX_POSDIV_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV);
> +
> +	/* /5, tmds_clk_frequency = tmds_data_frequency / 5 */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_EN_SHIFT, RG_HDMITX21_FRL_EN);
> +
> +	/* TXPREDIV */
> +	if (txprediv == 2) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 4) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x1;
> +	} else if (txprediv == 6) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 12) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x1;
> +	} else
> +		return -EINVAL;

here too

> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  div3_ctrl_value
> +				  << RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT,
> +			  RG_HDMITXPLL_POSDIV_DIV3_CTRL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  posdiv_vallue << RG_HDMITXPLL_POSDIV_SHIFT,
> +			  RG_HDMITXPLL_POSDIV);
> +
> +	/* POSDIV1 */
> +	if (posdiv1 == 5)
> +		div_ctrl_value = 0x0;
> +	else if (posdiv1 == 10)
> +		div_ctrl_value = 0x1;
> +	else if (posdiv1 == (125 / 10))
> +		div_ctrl_value = 0x2;
> +	else if (posdiv1 == 15)
> +		div_ctrl_value = 0x3;
> +	else
> +		div_ctrl_value = 0x1;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  div_ctrl_value << RG_HDMITXPLL_DIV_CTRL_SHIFT,
> +			  RG_HDMITXPLL_DIV_CTRL);
> +
> +	/* DE add new setting */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT14);
> +
> +	/* POSDIV2 */
> +	if (posdiv2 == 1)
> +		reserve_3_2_value = 0x0;
> +	else if (posdiv2 == 2)
> +		reserve_3_2_value = 0x1;
> +	else if (posdiv2 == 4)
> +		reserve_3_2_value = 0x2;
> +	else if (posdiv2 == 6)
> +		reserve_3_2_value = 0x3;
> +	else
> +		reserve_3_2_value = 0x1;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  reserve_3_2_value
> +				  << RG_HDMITXPLL_RESERVE_BIT3_2_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT3_2);
> +
> +	/* DE add new setting */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  0x2 << RG_HDMITXPLL_RESERVE_BIT1_0_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT1_0);
> +
> +	/* PREDIV */
> +	if (prediv == 1)
> +		prediv_value = 0x0;
> +	else if (prediv == 2)
> +		prediv_value = 0x1;
> +	else if (prediv == 4)
> +		prediv_value = 0x2;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  prediv_value << RG_HDMITXPLL_PREDIV_SHIFT,
> +			  RG_HDMITXPLL_PREDIV);
> +
> +	/* FBKDIV_HS3 */
> +	if (fbkdiv_hs3 == 1)
> +		reserve13_value = 0x0;
> +	else if (fbkdiv_hs3 == 2)
> +		reserve13_value = 0x1;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
> +			  reserve13_value << RG_HDMITXPLL_RESERVE_BIT13_SHIFT,
> +			  RG_HDMITXPLL_RESERVE_BIT13);
> +
> +	/* FBDIV */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  fbkdiv_high << RG_HDMITXPLL_FBKDIV_high_SHIFT,
> +			  RG_HDMITXPLL_FBKDIV_high);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_3,
> +			  fbkdiv_low << RG_HDMITXPLL_FBKDIV_low_SHIFT,
> +			  RG_HDMITXPLL_FBKDIV_low);
> +
> +	/* Digital DIVIDER */
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +			0x0 << REG_PIXEL_CLOCK_SEL_SHIFT,
> +			REG_PIXEL_CLOCK_SEL);
> +
> +	if (digital_div == 1)
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  0x0 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
> +				  REG_HDMITX_PIXEL_CLOCK);
> +	else {
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  0x1 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
> +				  REG_HDMITX_PIXEL_CLOCK);
> +		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
> +				  (digital_div - 1) << REG_HDMITXPLL_DIV_SHIFT,
> +				  REG_HDMITXPLL_DIV);
> +	}
> +
> +	return 0;
> +}
> +
> +#define PCW_DECIMAL_WIDTH 24
> +
> +static int mtk_hdmi_pll_calculate_params(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	int ret;
> +	unsigned long long tmds_clk = 0;
> +	unsigned long long pixel_clk = 0;
> +	//ref clock from hdmi Rx

:(

-- 
~Vinod
