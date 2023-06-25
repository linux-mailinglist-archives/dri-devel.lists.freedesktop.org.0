Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5C73D08A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F88510E173;
	Sun, 25 Jun 2023 11:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BAB10E093
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b44d77e56bso40338941fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693348; x=1690285348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IDKvkLUt6w0xi4QhVDhq8WjiXJw9g5g1gbOAvslxnw=;
 b=UVf7sPSzkleJtCHZJ8Uny33lbL451jxqy2XrtXD9V+5kFABHrXTGgItGxN17jBjbGw
 NEOGg9biBcgzQOvjGZNrE06Z/GlkzdLXsVzN+AWmxWNfL/xOC0Pj85HndjK26bfYmMlO
 ynyqUBGmAGe+H9RPVdGUP3qGFiIC3Z/wAodzca1OIYfYtB2Osa6WqZ3McB9eyqt+k75Q
 LyExKPvtGO6iQM5PKZtd1tXpGbyn08cP+XgoSkfIYiyU9NnXIULKknvDGAZyV0qDemex
 G+eFVc5jg4ucYEXa7n2c9yqFM4qhbfDbbKyFGCIYeibrblKN9YIGmy2Y7l7eWQgGIobh
 qEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693348; x=1690285348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4IDKvkLUt6w0xi4QhVDhq8WjiXJw9g5g1gbOAvslxnw=;
 b=PfV3M9Cif3QIBR4H6Zr5YCRB+CvSLaILBGA9X/DSf0ic25wa47afhIvZSlgAVsVpWU
 721CGWp1KyqmOmA+HEKL/7++ghBNL3S8VYVT4AH7fXpU0rhNYy6k04dIbeq/04obzBvk
 zuOLZ1qkt+ATXN3nQocRKbuwzvN/a8dZeGzHV1F1U4WlKXG2C/rCm/ZN3OD5YI3aQjwc
 boi5oIU4F07uQ95esx+Tbr++yrfq9nfRS9ebWvwHGMN/kLjJp5BY7I8+4e6pCV4Hyibf
 5mkbQIGoZVQpLX+6nkkCoghSx/jLCqFioDuiszQNpBfmA1i6gzc9Pfj5ympANzgrjti9
 +1SA==
X-Gm-Message-State: AC+VfDz/dkEd2U2HmfK6bsjO6C6MyiPXU0x7YSFis2T3pVA1g0PljSpX
 yuqJX87tQRVe3NHWfWfikEvEUQ==
X-Google-Smtp-Source: ACHHUZ5p5N7WQBMkq/DuVdfnDmM7PcnWqfOI6YUYBTtvok8n6xoId9cW/94okdhjMx14CDDNs1zgPA==
X-Received: by 2002:a05:6512:3e0c:b0:4f8:66db:eb0b with SMTP id
 i12-20020a0565123e0c00b004f866dbeb0bmr7426130lfv.1.1687693347822; 
 Sun, 25 Jun 2023 04:42:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 05/15] phy: qualcomm: add legacy HDMI PHY driver
Date: Sun, 25 Jun 2023 14:42:12 +0300
Message-Id: <20230625114222.96689-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

Add the driver for pre-QMP Qualcomm HDMI PHYs. Currently it suppports
Qualcomm MSM8960 / APQ8064 platforms, other platforms will come later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                |  14 +
 drivers/phy/qualcomm/Makefile               |   6 +
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c  | 439 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c | 206 +++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h |  79 ++++
 5 files changed, 744 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 4521fc9b9ced..460ad8298f86 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -42,6 +42,20 @@ config PHY_QCOM_IPQ806X_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_HDMI
+	tristate "Qualcomm MSM8x60/MSM8960/MSM8974 HDMI PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	default DRM_MSM_HDMI && ARCH_QCOM && ARM
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm HDMI PHY presend on 32-bit platforms:
+	  MSM8260, MSM8660, MSM8960, APQ8060 and APQ8064.
+
+	  Note, this driver is not used on MSM899x platforms, which use
+	  PHY_QCOM_QMP_HDMI instead.
+
 config PHY_QCOM_PCIE2
 	tristate "Qualcomm PCIe Gen2 PHY Driver"
 	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 32e27ffb7af6..4c06498c709d 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -4,6 +4,12 @@ obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
+obj-$(CONFIG_PHY_QCOM_HDMI)		+= phy-qcom-hdmi.o
+
+phy-qcom-hdmi-y := \
+	phy-qcom-hdmi-preqmp.o \
+	phy-qcom-hdmi-28lpm.o \
+
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
new file mode 100644
index 000000000000..64e043f3f0e2
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
@@ -0,0 +1,439 @@
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
+
+#define REG_HDMI_8960_PHY_REG0					0x00000000
+
+#define REG_HDMI_8960_PHY_REG1					0x00000004
+
+#define REG_HDMI_8960_PHY_REG2					0x00000008
+
+#define REG_HDMI_8960_PHY_REG3					0x0000000c
+
+#define REG_HDMI_8960_PHY_REG4					0x00000010
+
+#define REG_HDMI_8960_PHY_REG5					0x00000014
+
+#define REG_HDMI_8960_PHY_REG6					0x00000018
+
+#define REG_HDMI_8960_PHY_REG7					0x0000001c
+
+#define REG_HDMI_8960_PHY_REG8					0x00000020
+
+#define REG_HDMI_8960_PHY_REG9					0x00000024
+
+#define REG_HDMI_8960_PHY_REG10					0x00000028
+
+#define REG_HDMI_8960_PHY_REG11					0x0000002c
+
+#define REG_HDMI_8960_PHY_REG12					0x00000030
+#define HDMI_8960_PHY_REG12_SW_RESET				0x00000020
+#define HDMI_8960_PHY_REG12_PWRDN_B				0x00000080
+
+#define REG_HDMI_8960_PHY_REG_BIST_CFG				0x00000034
+
+#define REG_HDMI_8960_PHY_DEBUG_BUS_SEL				0x00000038
+
+#define REG_HDMI_8960_PHY_REG_MISC0				0x0000003c
+
+#define REG_HDMI_8960_PHY_REG13					0x00000040
+
+#define REG_HDMI_8960_PHY_REG14					0x00000044
+
+#define REG_HDMI_8960_PHY_REG15					0x00000048
+
+#define REG_HDMI_8960_PHY_PLL_REFCLK_CFG			0x00000000
+
+#define REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG			0x00000004
+
+#define REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0			0x00000008
+
+#define REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1			0x0000000c
+
+#define REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG			0x00000010
+
+#define REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG			0x00000014
+
+#define REG_HDMI_8960_PHY_PLL_PWRDN_B				0x00000018
+#define HDMI_8960_PHY_PLL_PWRDN_B_PD_PLL			0x00000002
+#define HDMI_8960_PHY_PLL_PWRDN_B_PLL_PWRDN_B			0x00000008
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG0				0x0000001c
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG1				0x00000020
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG2				0x00000024
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG3				0x00000028
+
+#define REG_HDMI_8960_PHY_PLL_SDM_CFG4				0x0000002c
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG0				0x00000030
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG1				0x00000034
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG2				0x00000038
+
+#define REG_HDMI_8960_PHY_PLL_SSC_CFG3				0x0000003c
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0			0x00000040
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1			0x00000044
+
+#define REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2			0x00000048
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0			0x0000004c
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1			0x00000050
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2			0x00000054
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3			0x00000058
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4			0x0000005c
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5			0x00000060
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6			0x00000064
+
+#define REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7			0x00000068
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_SEL				0x0000006c
+
+#define REG_HDMI_8960_PHY_PLL_MISC0				0x00000070
+
+#define REG_HDMI_8960_PHY_PLL_MISC1				0x00000074
+
+#define REG_HDMI_8960_PHY_PLL_MISC2				0x00000078
+
+#define REG_HDMI_8960_PHY_PLL_MISC3				0x0000007c
+
+#define REG_HDMI_8960_PHY_PLL_MISC4				0x00000080
+
+#define REG_HDMI_8960_PHY_PLL_MISC5				0x00000084
+
+#define REG_HDMI_8960_PHY_PLL_MISC6				0x00000088
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS0			0x0000008c
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS1			0x00000090
+
+#define REG_HDMI_8960_PHY_PLL_DEBUG_BUS2			0x00000094
+
+#define REG_HDMI_8960_PHY_PLL_STATUS0				0x00000098
+#define HDMI_8960_PHY_PLL_STATUS0_PLL_LOCK			0x00000001
+
+#define REG_HDMI_8960_PHY_PLL_STATUS1				0x0000009c
+
+#define HDMI_8974_VCO_MAX_FREQ 1125000000UL
+#define HDMI_8974_VCO_MIN_FREQ 540000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static unsigned long qcom_28lpm_recalc(struct qcom_hdmi_preqmp_phy *hdmi_phy, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & BIT(1))
+		parent_rate /= 2;
+	if (refclk_cfg & BIT(3))
+		parent_rate *= 2;
+
+	val = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG0);
+	if (val & 0x40) {
+		dc_offset = val & 0x3f;
+		fraq_n = 0;
+	} else {
+		dc_offset = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG1) & 0x3f;
+		fraq_n = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2) |
+			(hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3) << 8);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	return rate;
+}
+
+static int qcom_28lpm_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy, unsigned long parent_rate,
+			       unsigned long vco_freq, u32 div_idx)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
+        unsigned int int_ref_freq;
+	unsigned int div;
+	unsigned int dc_offset;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	bool sdm_mode = false;
+        u32 refclk_cfg;
+        u32 lf_cfg0;
+        u32 lf_cfg1;
+
+	dev_dbg(hdmi_phy->dev, "rate=%u, div = %d, vco = %lu", pixclk, div, vco_freq);
+
+	if (vco_freq % (parent_rate / 2) == 0) {
+                refclk_cfg = 0x2;
+                int_ref_freq = parent_rate / 2;
+        } else {
+                refclk_cfg = 0x8;
+                int_ref_freq = parent_rate * 2;
+                sdm_mode = true;
+        }
+
+	dc_offset = vco_freq / int_ref_freq - 1;
+	sdm_freq_seed = vco_freq - (dc_offset + 1) * int_ref_freq;
+	sdm_freq_seed = mult_frac(sdm_freq_seed, 0x10000, int_ref_freq);
+
+	val = (div_idx << 4) | refclk_cfg;
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG, val);
+
+	lf_cfg0 = dc_offset >= 30 ? 0 : (dc_offset >= 16 ? 0x10 : 0x20);
+	lf_cfg0 += sdm_mode ? 0 : 1;
+
+	/* XXX: 0xc3 instead of 0x33 for qcs404 */
+	lf_cfg1 = dc_offset >= 30 ? 0x33 : (dc_offset >= 16 ? 0xbb : 0xf9);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0, lf_cfg0);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1, lf_cfg1);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG0,
+		       (sdm_mode ? 0 : 0x40) | dc_offset);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG1,
+		       0x40 | dc_offset);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2,
+		       sdm_freq_seed & 0xff);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3,
+		       (sdm_freq_seed >> 8) & 0xff);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG4,
+		       sdm_freq_seed >> 16);
+
+	vco_freq /= 1000;
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0, vco_freq & 0xff);
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1, vco_freq >> 8);
+
+	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2, 0x3b);
+
+	return 0;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8960_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, REG_HDMI_8960_PHY_PLL_REFCLK_CFG);
+	unsigned long rate = qcom_28lpm_recalc(hdmi_phy, parent_rate);
+
+	return rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx >> 4];
+}
+
+static long qcom_hdmi_8960_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return clamp(rate,
+		     HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
+		     HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
+}
+
+static const struct clk_ops qcom_hdmi_8960_pll_ops = {
+	.recalc_rate = qcom_hdmi_8960_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8960_pll_round_rate,
+};
+
+static int qcom_hdmi_msm8960_phy_pll_enable(struct qcom_hdmi_preqmp_phy *phy)
+{
+	int pll_lock_retry = 10;
+	unsigned int val;
+	int ret;
+
+	/* Assert PLL S/W reset */
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0, 0x10);
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1, 0x1a);
+
+	/* Wait for a short time before de-asserting
+	 * to allow the hardware to complete its job.
+	 * This much of delay should be fine for hardware
+	 * to assert and de-assert.
+	 */
+	udelay(10);
+
+	/* De-assert PLL S/W reset */
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val |= HDMI_8960_PHY_REG12_SW_RESET;
+	/* Assert PHY S/W reset */
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	val &= ~HDMI_8960_PHY_REG12_SW_RESET;
+	/*
+	 * Wait for a short time before de-asserting to allow the hardware to
+	 * complete its job. This much of delay should be fine for hardware to
+	 * assert and de-assert.
+	 */
+	udelay(10);
+	/* De-assert PHY S/W reset */
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2,  0x3f);
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val |= HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+	/* Wait 10 us for enabling global power for PHY */
+	mb();
+	udelay(10);
+
+	val = hdmi_pll_read(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B);
+	val |= HDMI_8960_PHY_PLL_PWRDN_B_PLL_PWRDN_B;
+	val &= ~HDMI_8960_PHY_PLL_PWRDN_B_PD_PLL;
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG2, 0x80);
+
+	while (--pll_lock_retry > 0) {
+		ret = readl_poll_timeout(phy->pll_reg + REG_HDMI_8960_PHY_PLL_STATUS0,
+					 val, val & HDMI_8960_PHY_PLL_STATUS0_PLL_LOCK,
+					 1, 1000);
+		if (!ret)
+			break;
+
+		/*
+		 * PLL has still not locked.
+		 * Do a software reset and try again
+		 * Assert PLL S/W reset first
+		 */
+		hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x8d);
+		udelay(10);
+		hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2, 0x0d);
+
+		/*
+		 * Wait for a short duration for the PLL calibration
+		 * before checking if the PLL gets locked
+		 */
+		udelay(350);
+	}
+
+	return ret;
+}
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
+static int qcom_hdmi_msm8960_phy_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
+	/* XXX: 19.2 for qcs404 */
+	unsigned long parent_rate = 27000;
+	unsigned long vco_freq;
+	int div_idx;
+	u32 div;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_freq = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	return qcom_28lpm_set_rate(hdmi_phy, parent_rate, vco_freq, div_idx);
+}
+
+static void qcom_hdmi_msm8960_phy_pll_disable(struct qcom_hdmi_preqmp_phy *phy)
+{
+	unsigned int val;
+
+	val = hdmi_phy_read(phy, REG_HDMI_8960_PHY_REG12);
+	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_phy_write(phy, REG_HDMI_8960_PHY_REG12, val);
+
+	val = hdmi_pll_read(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B);
+	val |= HDMI_8960_PHY_REG12_SW_RESET;
+	val &= ~HDMI_8960_PHY_REG12_PWRDN_B;
+	hdmi_pll_write(phy, REG_HDMI_8960_PHY_PLL_PWRDN_B, val);
+	/* Make sure HDMI PHY/PLL are powered down */
+	mb();
+}
+
+static int qcom_hdmi_msm8960_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+
+	ret = qcom_hdmi_msm8960_phy_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8960_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG2, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG0, 0x1b);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG1, 0xf2);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG4, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG5, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG6, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG7, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG8, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG9, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG10, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG11, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG3, 0x20);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8960_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG2, 0x7f);
+
+	qcom_hdmi_msm8960_phy_pll_disable(hdmi_phy);
+
+	return 0;
+}
+
+const struct clk_parent_data msm8960_hdmi_pll_parent = {
+	.fw_name = "pxo", .name = "pxo_board",
+};
+
+const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg = {
+	.clk_names = { "slave_iface" },
+	.num_clks = 1,
+
+	.reg_names = { "core-vdda" },
+	.num_regs = 1,
+
+	.power_on = qcom_hdmi_msm8960_phy_power_on,
+	.power_off = qcom_hdmi_msm8960_phy_power_off,
+
+	.pll_ops = &qcom_hdmi_8960_pll_ops,
+	.pll_parent = &msm8960_hdmi_pll_parent,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
new file mode 100644
index 000000000000..6885f587d7b4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+static int qcom_hdmi_preqmp_phy_init(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+static int qcom_hdmi_preqmp_phy_exit(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int qcom_hdmi_preqmp_phy_power_on(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return hdmi_phy->power_on(hdmi_phy);
+};
+
+static int qcom_hdmi_preqmp_phy_power_off(struct phy *phy)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return hdmi_phy->power_off(hdmi_phy);
+};
+
+static int qcom_hdmi_preqmp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_preqmp_runtime_resume(struct device *dev)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(hdmi_phy->num_regs, hdmi_phy->regs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(hdmi_phy->num_clks, hdmi_phy->clks);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_bulk_disable(hdmi_phy->num_regs, hdmi_phy->regs);
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_preqmp_runtime_suspend(struct device *dev)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(hdmi_phy->num_clks, hdmi_phy->clks);
+	regulator_bulk_disable(hdmi_phy->num_regs, hdmi_phy->regs);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_hdmi_preqmp_phy_ops = {
+	.init		= qcom_hdmi_preqmp_phy_init,
+	.configure	= qcom_hdmi_preqmp_phy_configure,
+	.power_on	= qcom_hdmi_preqmp_phy_power_on,
+	.power_off	= qcom_hdmi_preqmp_phy_power_off,
+	.exit		= qcom_hdmi_preqmp_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_hdmi_preqmp_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_hdmi_preqmp_phy *hdmi_phy;
+	const struct qcom_hdmi_preqmp_cfg *cfg;
+	int i, ret;
+
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
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
+	hdmi_phy->num_clks = cfg->num_clks;
+	for (i = 0; i < cfg->num_clks; i++)
+		hdmi_phy->clks[i].id = cfg->clk_names[i];
+	ret = devm_clk_bulk_get(dev, hdmi_phy->num_clks, hdmi_phy->clks);
+	if (ret)
+		return ret;
+
+	hdmi_phy->num_regs = cfg->num_regs;
+	for (i = 0; i < cfg->num_regs; i++) {
+		hdmi_phy->regs[i].supply = cfg->reg_names[i];
+		hdmi_phy->regs[i].init_load_uA = cfg->reg_init_load[i];
+	}
+	ret = devm_regulator_bulk_get(dev, hdmi_phy->num_regs, hdmi_phy->regs);
+	if (ret)
+		return ret;
+
+	hdmi_phy->power_on = cfg->power_on;
+	hdmi_phy->power_off = cfg->power_off;
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
+	init.name = "hdmipll";
+	init.ops = cfg->pll_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	init.parent_data = cfg->pll_parent;
+	init.num_parents = 1;
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
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_preqmp_phy_ops);
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
+static const struct of_device_id qcom_hdmi_preqmp_of_match_table[] = {
+	{ .compatible = "qcom,hdmi-phy-8960", .data = &msm8960_hdmi_phy_cfg, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_hdmi_preqmp_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qcom_hdmi_preqmp_pm_ops,
+			  qcom_hdmi_preqmp_runtime_suspend,
+			  qcom_hdmi_preqmp_runtime_resume,
+			  NULL);
+
+static struct platform_driver qcom_hdmi_preqmp_driver = {
+	.probe		= qcom_hdmi_preqmp_probe,
+	.driver = {
+		.name	= "qcom-preqmp-hdmi-phy",
+		.of_match_table = qcom_hdmi_preqmp_of_match_table,
+		.pm     = &qcom_hdmi_preqmp_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_hdmi_preqmp_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm MSMpreqmp HDMI PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
new file mode 100644
index 000000000000..dca9be78d8fc
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#ifndef PHY_QCOM_HDMI_PREQMP_H
+#define PHY_QCOM_HDMI_PREQMP_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/phy/phy-hdmi.h>
+#include <linux/regulator/consumer.h>
+
+#define MAX_CLKS 2
+#define MAX_SUPPLIES 2
+
+struct qcom_hdmi_preqmp_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *pll_reg;
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk_hw pll_hw;
+	struct clk_bulk_data clks[MAX_CLKS];
+	int num_clks;
+
+	struct regulator_bulk_data regs[MAX_SUPPLIES];
+	int num_regs;
+
+	int (*power_on)(struct qcom_hdmi_preqmp_phy *phy);
+	int (*power_off)(struct qcom_hdmi_preqmp_phy *phy);
+};
+
+#define hw_clk_to_phy(x) container_of(x, struct qcom_hdmi_preqmp_phy, pll_hw)
+
+struct qcom_hdmi_preqmp_cfg {
+	const char * const clk_names[MAX_CLKS];
+	int num_clks;
+
+	const char * const reg_names[MAX_SUPPLIES];
+	int reg_init_load[MAX_SUPPLIES];
+	int num_regs;
+
+	int (*power_on)(struct qcom_hdmi_preqmp_phy *phy);
+	int (*power_off)(struct qcom_hdmi_preqmp_phy *phy);
+
+	const struct clk_ops *pll_ops;
+	const struct clk_parent_data *pll_parent;
+};
+
+static inline void hdmi_phy_write(struct qcom_hdmi_preqmp_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static inline void hdmi_pll_write(struct qcom_hdmi_preqmp_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->pll_reg + offset);
+}
+
+static inline u32 hdmi_pll_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
+{
+	return readl(phy->pll_reg + offset);
+}
+
+extern const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg;
+
+#endif
-- 
2.39.2

