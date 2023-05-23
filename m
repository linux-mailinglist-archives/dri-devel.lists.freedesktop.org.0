Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011A70DC17
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2510E42D;
	Tue, 23 May 2023 12:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2810E427
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:03 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3edc05aa5so3038238e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844103; x=1687436103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXESD2KrVm3U7h3EGxyXap+xEb/teM8AqZZ0TCrr8q0=;
 b=ZTjM6o2Jnhepsdd5nebQiT8er5eFmxzPk2xWWh+3yVBwfi4RHl58/7o4Yw023nF3Gy
 B0azNyzg31jDyD8Y8QnUl8HZ8ZYt4dT5ahle5ZXyM1NHpgySzKWFT9IWuttVd7qT7Y37
 +wyLW/mLO2P1u7nMnQgi14apSEjsBhE3KD9X91b/UOBDL52kjqmxEK5yyLS3EJBt9oo3
 K2zvNLiBNPk7tYP73e18jyzqaGs++cBHE1foMjDgRicagxtAY/GF5i4HCAfHzbeWx5tR
 fPoGfbxH1CgIlUxWp90KI35yLXmllZmhWWDdyIwuGzmHvcxgWVod5/H41NKcmXU2xCn/
 hqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844103; x=1687436103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXESD2KrVm3U7h3EGxyXap+xEb/teM8AqZZ0TCrr8q0=;
 b=SgnYY5NhVzZwVQRa33wtrVfB5SauMmZ90p+lwWB1S5frIpWkuWtOUmQsh6Gd+e1U+8
 gnvOKoKJe+5++sruKhi5XqQnQfPKUFmGiCYbDEAN1fhgYZN/pCxmp4fSAk/1yyjjAx+o
 UWHV6moIM+/MQEqJieXbglieoVDvzGtqdn6hspiADwvTyKLmiKlKuWhdBZEWtt1yMRKV
 0yU8NBbiZZdymRTRgwapaveuknp6Q6N4ZXQ55mduwkSWpvXaLlmkW2orIzLHgHhB7B/2
 JmwdWktiYyjSACHHe2CaGrZl1uGBXyQAQmheBVI+j/Mr7xsVXpa28E3060Fl/ZlYgmOD
 OwdA==
X-Gm-Message-State: AC+VfDzHUX1qT+fTHOU4ijYlZNz5bd/1CX1CuEqX05oqB5axuacUngK7
 M+57BUVZSI20iIUp6BvTNdaaOQ==
X-Google-Smtp-Source: ACHHUZ5LI9RATEt2bX+ORMcay3S+a3qMx9r9gOraB4eYwNbUwVzC/XeaBcCmBmoW4imGHiqgouWTiQ==
X-Received: by 2002:ac2:5dd0:0:b0:4f3:a9d3:4893 with SMTP id
 x16-20020ac25dd0000000b004f3a9d34893mr4618433lfq.35.1684844102952; 
 Tue, 23 May 2023 05:15:02 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 07/15] phy: qualcomm: add MSM8974 HDMI PHY driver
Date: Tue, 23 May 2023 15:14:46 +0300
Message-Id: <20230523121454.3460634-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Port the HDMI PHY driver for Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                 |  11 +
 drivers/phy/qualcomm/Makefile                |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c | 531 +++++++++++++++++++
 3 files changed, 543 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index a603d4777a02..812e54390ad8 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -64,6 +64,17 @@ config PHY_QCOM_HDMI_MSM8960
 	  Enable this to support the Qualcomm HDMI PHY presend on MSM8960 and
 	  APQ8064 platforms.
 
+config PHY_QCOM_HDMI_MSM8974
+	tristate "Qualcomm MSM8974 HDMI PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	default DRM_MSM_HDMI && ARCH_MSM8974
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm HDMI PHY presend on MSM8974 and
+	  APQ8074 platforms.
+
 config PHY_QCOM_PCIE2
 	tristate "Qualcomm PCIe Gen2 PHY Driver"
 	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index cbc730c074ad..6e73b1ff4692 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_HDMI_MSM8X60)	+= phy-qcom-hdmi-msm8x60.o
 obj-$(CONFIG_PHY_QCOM_HDMI_MSM8960)	+= phy-qcom-hdmi-msm8960.o
+obj-$(CONFIG_PHY_QCOM_HDMI_MSM8974)	+= phy-qcom-hdmi-msm8974.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 phy-qcom-qmp-hdmi-y := \
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c
new file mode 100644
index 000000000000..d61aaea9eae6
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include "phy-qcom-uniphy.h"
+
+#define REG_HDMI_8x74_ANA_CFG0					0x00000000
+#define REG_HDMI_8x74_ANA_CFG1					0x00000004
+#define REG_HDMI_8x74_ANA_CFG2					0x00000008
+#define REG_HDMI_8x74_ANA_CFG3					0x0000000c
+#define REG_HDMI_8x74_PD_CTRL0					0x00000010
+#define REG_HDMI_8x74_PD_CTRL1					0x00000014
+#define REG_HDMI_8x74_GLB_CFG					0x00000018
+#define REG_HDMI_8x74_DCC_CFG0					0x0000001c
+#define REG_HDMI_8x74_DCC_CFG1					0x00000020
+#define REG_HDMI_8x74_TXCAL_CFG0				0x00000024
+#define REG_HDMI_8x74_TXCAL_CFG1				0x00000028
+#define REG_HDMI_8x74_TXCAL_CFG2				0x0000002c
+#define REG_HDMI_8x74_TXCAL_CFG3				0x00000030
+#define REG_HDMI_8x74_BIST_CFG0					0x00000034
+#define REG_HDMI_8x74_BIST_PATN0				0x0000003c
+#define REG_HDMI_8x74_BIST_PATN1				0x00000040
+#define REG_HDMI_8x74_BIST_PATN2				0x00000044
+#define REG_HDMI_8x74_BIST_PATN3				0x00000048
+#define REG_HDMI_8x74_STATUS					0x0000005c
+
+#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
+#define HDMI_8974_VCO_MIN_FREQ  600000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+#define MAX_CLKS 2
+#define MAX_SUPPLIES 2
+
+struct qcom_hdmi_8974_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *pll_reg;
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk_hw pll_hw;
+	struct clk_bulk_data clks[MAX_CLKS];
+	struct regulator_bulk_data supplies[MAX_SUPPLIES];
+};
+
+#define hw_clk_to_phy(x) container_of(x, struct qcom_hdmi_8974_phy, pll_hw)
+
+static inline void hdmi_phy_write(struct qcom_hdmi_8974_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qcom_hdmi_8974_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static inline void hdmi_pll_write(struct qcom_hdmi_8974_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->pll_reg + offset);
+}
+
+static inline u32 hdmi_pll_read(struct qcom_hdmi_8974_phy *phy, int offset)
+{
+	return readl(phy->pll_reg + offset);
+}
+
+static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
+			      bool sdm_mode,
+			      bool ref_freq_mult_2,
+			      bool dither,
+			      unsigned int refclk_div,
+			      unsigned int vco_freq)
+{
+	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
+	unsigned int div_in_freq = vco_freq / refclk_div;
+	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	unsigned int remain = div_in_freq - (dc_offset + 1) * int_ref_freq;
+	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
+
+	val = (ref_freq_mult_2 ? BIT(0) : 0) |
+		((refclk_div - 1) << 2);
+	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
+
+	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
+
+	writel(dither ? 0x40 + dc_offset: 0, base + UNIPHY_PLL_SDM_CFG1);
+
+	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);
+
+	writel((sdm_freq_seed >> 8) & 0xff, base + UNIPHY_PLL_SDM_CFG3);
+
+	writel(sdm_freq_seed >> 16, base + UNIPHY_PLL_SDM_CFG4);
+
+	ref_freq = ref_freq * 5 / 1000;
+	writel(ref_freq & 0xff, base + UNIPHY_PLL_CAL_CFG8);
+
+	writel(ref_freq >> 8, base + UNIPHY_PLL_CAL_CFG9);
+
+	vco_freq /= 1000;
+	writel(vco_freq & 0xff, base + UNIPHY_PLL_CAL_CFG10);
+
+	writel(vco_freq >> 8, base + UNIPHY_PLL_CAL_CFG11);
+}
+
+static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & BIT(0))
+		parent_rate *= 2;
+
+	val = readl(base + UNIPHY_PLL_SDM_CFG0);
+	if (val & 0x40) {
+		dc_offset = val & 0x3f;
+		fraq_n = 0;
+	} else {
+		dc_offset = readl(base + UNIPHY_PLL_SDM_CFG1) & 0x3f;
+		fraq_n = readl(base + UNIPHY_PLL_SDM_CFG2) |
+			(readl(base + UNIPHY_PLL_SDM_CFG3) << 8);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	rate *= (refclk_cfg >> 2) * 0x3 + 1;
+
+	return rate;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
+
+	return qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate) / 5 / qcom_hdmi_8974_divs[div_idx & 0x3];
+}
+
+static long qcom_hdmi_8974_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return clamp(rate,
+		     HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
+		     HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
+}
+
+static const struct clk_ops qcom_hdmi_8974_pll_ops = {
+	.recalc_rate = qcom_hdmi_8974_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8974_pll_round_rate,
+};
+
+static int qcom_hdmi_8974_phy_find_div(unsigned int pixclk)
+{
+	int i;
+	unsigned int min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 1000;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1000)
+		return -E2BIG;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_8974_phy_pll_set_rate(struct qcom_hdmi_8974_phy *hdmi_phy)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_rate = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VCOLPF_CFG, 0x19);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFR_CFG, 0x0e);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC1_CFG, 0x20);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC2_CFG, 0x0d);
+
+	qcom_uniphy_setup(hdmi_phy->pll_reg, 19200, true, true, true, 1, vco_rate);
+	qcom_uniphy_recalc(hdmi_phy->pll_reg, 19200);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG0, 0x10);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG1, 0x1a);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG2, 0x05);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG, div_idx);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV2_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV3_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_CAL_CFG2, 0x01);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x1f);
+	udelay(50);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL1, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x10);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0, 0xdb);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1, 0x43);
+	if (pixclk == 297000) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x06);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x03);
+	} else if (pixclk == 268500) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x05);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x02);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	}
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VREG_CFG, 0x04);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG0, 0xd0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG1, 0x1a);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG0, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG1, 0x00);
+	if (pixclk == 268500) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x11);
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x02);
+	}
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG3, 0x05);
+	udelay(200);
+
+	return 0;
+}
+
+static int qcom_hdmi_8974_phy_pll_enable(struct qcom_hdmi_8974_phy *hdmi_phy)
+{
+	int ret;
+	unsigned long status;
+
+	/* Global enable */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	/* Power up power gen */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x00);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x03);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
+		goto err;
+	}
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8x74_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PHY not ready\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
+	return ret;
+}
+
+static int qcom_hdmi_8974_phy_power_on(struct phy *phy)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_hdmi_8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_8974_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_CFG0,  0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN0, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN1, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN2, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_PATN3, 0x0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL1,   0x20);
+
+	return 0;
+}
+
+static int qcom_hdmi_8974_phy_power_off(struct phy *phy)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
+	return 0;
+}
+
+static int qcom_hdmi_8974_phy_init(struct phy *phy)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+static int qcom_hdmi_8974_phy_exit(struct phy *phy)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int qcom_hdmi_8974_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+        const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qcom_hdmi_8974_phy *hdmi_phy = phy_get_drvdata(phy);
+        int ret = 0;
+
+        memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+        return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8974_runtime_resume(struct device *dev)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8974_runtime_suspend(struct device *dev)
+{
+	struct qcom_hdmi_8974_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_hdmi_8974_phy_ops = {
+	.init		= qcom_hdmi_8974_phy_init,
+	.configure	= qcom_hdmi_8974_phy_configure,
+	.power_on	= qcom_hdmi_8974_phy_power_on,
+	.power_off	= qcom_hdmi_8974_phy_power_off,
+	.exit		= qcom_hdmi_8974_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_hdmi_8974_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init = {
+		.name = "hdmipll",
+		.ops = &qcom_hdmi_8974_pll_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
+		.flags = CLK_GET_RATE_NOCACHE,
+		.num_parents = 1,
+	};
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_hdmi_8974_phy *hdmi_phy;
+	int ret;
+
+	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
+	if (!hdmi_phy)
+		return -ENOMEM;
+
+	hdmi_phy->dev = dev;
+
+	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi_phy->phy_reg))
+		return PTR_ERR(hdmi_phy->phy_reg);
+
+	hdmi_phy->pll_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(hdmi_phy->pll_reg))
+		return PTR_ERR(hdmi_phy->pll_reg);
+
+	hdmi_phy->clks[0].id = "iface";
+	hdmi_phy->clks[1].id = "alt_iface";
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
+	if (ret)
+		return ret;
+
+	hdmi_phy->supplies[0].supply = "vddio";
+	hdmi_phy->supplies[0].init_load_uA = 100000;
+	hdmi_phy->supplies[1].supply = "core-vdda";
+	hdmi_phy->supplies[1].init_load_uA = 10000;
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi_phy);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	hdmi_phy->pll_hw.init = &init;
+	ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
+	if (ret)
+		goto err;
+
+	ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
+	if (ret)
+		goto err;
+
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_8974_phy_ops);
+	if (IS_ERR(hdmi_phy->phy)) {
+		ret = PTR_ERR(hdmi_phy->phy);
+		goto err;
+	}
+
+	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	pm_runtime_put_noidle(&pdev->dev);
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err:
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static const struct of_device_id qcom_hdmi_8974_of_match_table[] = {
+	{
+		.compatible = "qcom,hdmi-phy-8974",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_hdmi_8974_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qcom_hdmi_8974_pm_ops,
+			  qcom_hdmi_8974_runtime_suspend,
+			  qcom_hdmi_8974_runtime_resume,
+			  NULL);
+
+static struct platform_driver qcom_hdmi_8974_driver = {
+	.probe		= qcom_hdmi_8974_probe,
+	.driver = {
+		.name	= "qcom-8974-hdmi-phy",
+		.of_match_table = qcom_hdmi_8974_of_match_table,
+		.pm     = &qcom_hdmi_8974_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_hdmi_8974_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm MSM8974 HDMI PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

