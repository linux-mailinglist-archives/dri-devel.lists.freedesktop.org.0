Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1A27B1A69
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8878F10E606;
	Thu, 28 Sep 2023 11:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC310E609
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so21199021e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899796; x=1696504596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKxj0arPUviJ2iyzbqVJuwkdIDz3zRmvjljfAcCpENE=;
 b=Yw9zTH6EsPGVIU/y9us2ofEOo5EOp6vIrDr0uMhwy3N164bR4rLVO4ZVXJ85Nis3MD
 UyaRJyJQ5OQVzQUpcwk8aDz98H6bxB/YlWzYCg4zcPG6K2KGroVk0Be08f7AcLiY2M4r
 krTS6jVrSkukXL4pdHntnuZPW1M560xIWVwhwd5tPAEQT8wCf30kUou7ZrzbGdD2iRSj
 3tQesOJck0bQvMrEKrTlh3NwXHuXstJ9rvhAu6ojvFeVluy0PnkYbameBS1Pbtovo2Ki
 XujhxGr26eK/r9am183xOygk3Il57Jg7wS3wIE5IOfuQRZuI1vSZXoGlbKoyXEyj9Oyo
 cc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899796; x=1696504596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKxj0arPUviJ2iyzbqVJuwkdIDz3zRmvjljfAcCpENE=;
 b=oxJSXhDzfVYsxvIqssvoM72kIif7uEwcIAWqLdOcguYdvsfBhq9ZROK0jiXRAUf+za
 umOxC0gFFj53akiqvwsxzTJ8meDwiTDAnfm8+WsUHiCCHI3V7Aglg2N+RIGnOuWstOX3
 XLpMZY2FQoOljy9NsrQDjN3RjuReBwS7AANh7svCbQSsO1JqE8XFB+Aoxjc6hwXwHqIG
 lAxbw6bSGOtUVld+VH0962/dSh3fOT1lqhc57DlDKZLrXKaHit91QFqP9csTuS8S5sr0
 Fy3vtRczKuX9mG3Fk5e6zkPcFiSWQXBOjqmJXovB03USdnaOeMBk8CNwk/mhrrep5vbo
 Sw6Q==
X-Gm-Message-State: AOJu0YwgeSVr+Q9isASjrYijVHCt291OJH1IE6YeQrkkuSJVxnWA6b6s
 848jJXsGgwPM09h6RDEeYpOt/w==
X-Google-Smtp-Source: AGHT+IEXTNyzRJ0604k8PtlLNmcr46WQuauQ/xCc4YbXLkw4RuVO/IL+vK7Vckfv2fOxrz+iaaX2dA==
X-Received: by 2002:a05:6512:1391:b0:500:9a45:63b with SMTP id
 fc17-20020a056512139100b005009a45063bmr1011434lfb.13.1695899796104; 
 Thu, 28 Sep 2023 04:16:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v3 06/15] phy: qualcomm: add MSM8974 HDMI PHY support
Date: Thu, 28 Sep 2023 14:16:20 +0300
Message-Id: <20230928111630.1217419-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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

Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c  | 327 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h |   1 +
 5 files changed, 331 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index f31b575a6832..36f78fd06b06 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -51,7 +51,7 @@ config PHY_QCOM_HDMI
 	select GENERIC_PHY
 	help
 	  Enable this to support the Qualcomm HDMI PHY presend on 32-bit platforms:
-	  MSM8260, MSM8660, MSM8960, APQ8060 and APQ8064.
+	  MSM8260, MSM8660, MSM8960, MSM8974, APQ8060, APQ8064, APQ8074 and APQ8084.
 
 	  Note, this driver is not used on MSM899x platforms, which use
 	  PHY_QCOM_QMP_HDMI instead.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index de9bbaf45c74..082020af7fc1 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PHY_QCOM_HDMI)		+= phy-qcom-hdmi.o
 
 phy-qcom-hdmi-y := \
 	phy-qcom-hdmi-preqmp.o \
+	phy-qcom-hdmi-28hpm.o \
 	phy-qcom-hdmi-28lpm.o \
 
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
new file mode 100644
index 000000000000..d3bf67e743aa
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
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
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
+	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
+
+	return  rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
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
+static int qcom_hdmi_msm8974_phy_find_div(unsigned int pixclk)
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
+static int qcom_hdmi_msm8974_phy_pll_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
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
+static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
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
+static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_enable(hdmi_phy);
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
+static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
+	return 0;
+}
+
+const struct clk_parent_data msm8974_hdmi_pll_parent = {
+	.fw_name = "xo", .name = "xo_board",
+};
+
+const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
+	.clk_names = { "iface", "alt_iface" },
+	.num_clks = 2,
+
+	.reg_names = { "vddio", "core-vdda" },
+	.reg_init_load = { 100000, 10000 },
+	.num_regs = 2,
+
+	.power_on = qcom_hdmi_msm8974_phy_power_on,
+	.power_off = qcom_hdmi_msm8974_phy_power_off,
+
+	.pll_ops = &qcom_hdmi_8974_pll_ops,
+	.pll_parent = &msm8974_hdmi_pll_parent,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
index 6885f587d7b4..e181a45df2dc 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
@@ -181,6 +181,7 @@ static int qcom_hdmi_preqmp_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_hdmi_preqmp_of_match_table[] = {
 	{ .compatible = "qcom,hdmi-phy-8960", .data = &msm8960_hdmi_phy_cfg, },
+	{ .compatible = "qcom,hdmi-phy-8974", .data = &msm8974_hdmi_phy_cfg, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_hdmi_preqmp_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
index dca9be78d8fc..bc81d68463ec 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
@@ -75,5 +75,6 @@ static inline u32 hdmi_pll_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
 }
 
 extern const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg;
+extern const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg;
 
 #endif
-- 
2.39.2

