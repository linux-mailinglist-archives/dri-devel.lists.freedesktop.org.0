Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A970DC20
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B047410E43C;
	Tue, 23 May 2023 12:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16710E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:01 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4bd608cf4so834052e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844099; x=1687436099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luYkfguOMuGP5SycDO6aZL2kqBCqNqXT6dUGNjFwDrI=;
 b=efRJLVptrDY8EDmyxpSSCSpG63wmsHbw6YIajCMRkug/5/4uEA96TwhlAvquawMH/q
 M1WGUQrzrKsvw5D1+M33kOHrmIz6fiak3rVwmK6cXd0E9DJfLUN/fd+JX/IUvvAc5ENZ
 lso42E+KfGlPYy0cRIqx6Fz1OyG1JXMqTtI0Cv01nAqCRbjRy9w6uq9aQWvAp4ElQop+
 +s3ZGXsaQIbWS0pwdxAaWq/1NDJsiqBqd6Sfk7lvw/VmJk7Ag0Be3T5IRNSTTuZBdWrD
 HGEHxlELKl0O2Go2boqo55z8AiSQ51Rb7Gdt6rB4Bh0nUqYWYVkGtg4V9+EHfWPlcK1L
 Yykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844099; x=1687436099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=luYkfguOMuGP5SycDO6aZL2kqBCqNqXT6dUGNjFwDrI=;
 b=cFJO9BNLRMYSA8KDhDgnrEh6Vtbi5ScKmqwb5F7TKNy5gLtPOrK/0wISQxWWh04RRS
 qt/ABofExNppGFxt1N303hj4UffDRBrdr4olXlYnbmlfXUeGVIB0mKctpnBtWCkQ2c7h
 9gMbArzT+2aqVpqzLywAapLQpJ6Gstw0hPz2ClflWzKbbZTywm9rLzLqHc5zYdbxPpYB
 222PWTAQq+fiDItANU1BBpg6YrHz/DZU19QVHs5+AQtGtVr5xFgXOv4Y4olO8Dwesdlq
 tjG4l1Efn05auiTk3q9EwnGex9HdfZWXImRoAFUWklUjSPwGnGTNeDW1cfpq21xNhD4d
 TM0A==
X-Gm-Message-State: AC+VfDyhp0cQg1CDVq6S94YlMyAg0P2bHI6ZLTb6nW5TrYnirvTDkphR
 gAj7vpHhNgy9X/NQa6YQbBxvww==
X-Google-Smtp-Source: ACHHUZ4LzcC2bCAAaHwEefgNRISItdKvzWc0Vo3TUg1ofzKxIGp0uPpONKilAkkXutxeDWTlOcOJ+Q==
X-Received: by 2002:ac2:539a:0:b0:4f3:8244:95e2 with SMTP id
 g26-20020ac2539a000000b004f3824495e2mr4225547lfh.50.1684844099145; 
 Tue, 23 May 2023 05:14:59 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:14:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 03/15] phy: qualcomm: add MSM8960 HDMI PHY driver
Date: Tue, 23 May 2023 15:14:42 +0300
Message-Id: <20230523121454.3460634-4-dmitry.baryshkov@linaro.org>
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

Port the HDMI PHY driver for Qualcomm MSM8960 / APQ8064 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                 |  11 +
 drivers/phy/qualcomm/Makefile                |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c | 744 +++++++++++++++++++
 3 files changed, 756 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 94fb5679df4a..838f93ad1168 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -42,6 +42,17 @@ config PHY_QCOM_IPQ806X_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_HDMI_MSM8960
+	tristate "Qualcomm MSM8960 HDMI PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	default DRM_MSM_HDMI && ARCH_MSM8960
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm HDMI PHY presend on MSM8960 and
+	  APQ8064 platforms.
+
 config PHY_QCOM_PCIE2
 	tristate "Qualcomm PCIe Gen2 PHY Driver"
 	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b877d86ea0b1..6d7d76c7fee0 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
+obj-$(CONFIG_PHY_QCOM_HDMI_MSM8960)	+= phy-qcom-hdmi-msm8960.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 phy-qcom-qmp-hdmi-y := \
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c
new file mode 100644
index 000000000000..338d132dc8c8
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c
@@ -0,0 +1,744 @@
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
+struct qcom_hdmi_8960_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *pll_reg;
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk_hw pll_hw;
+	struct clk *iface_clk;
+	struct regulator *vdda;
+};
+
+#define hw_clk_to_phy(x) container_of(x, struct qcom_hdmi_8960_phy, pll_hw)
+
+static inline void hdmi_phy_write(struct qcom_hdmi_8960_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qcom_hdmi_8960_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static inline void hdmi_pll_write(struct qcom_hdmi_8960_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->pll_reg + offset);
+}
+
+static inline u32 hdmi_pll_read(struct qcom_hdmi_8960_phy *phy, int offset)
+{
+	return readl(phy->pll_reg + offset);
+}
+
+struct pll_conf {
+	u32 val;
+	u32 reg;
+};
+
+struct pll_rate {
+	unsigned long rate;
+	size_t num_reg;
+	const struct pll_conf *conf;
+};
+
+static const struct pll_conf pll_conf_154M[] = {
+	{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x0d, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x4d, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x5e, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0x42, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+};
+
+static const struct pll_conf pll_conf_148M5[] = {
+	{ 0x02, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
+	{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
+	{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
+	{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+	{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
+	{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
+	{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
+	{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
+	{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
+};
+
+static const struct pll_conf pll_conf_108M[] = {
+	{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x21, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x1c, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+};
+
+static const struct pll_conf pll_conf_74M25[] = {
+	{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
+	{ 0x12, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+};
+
+static const struct pll_conf pll_conf_74M176[] = {
+	{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0xe5, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x0c, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x7d, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0xbc, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+};
+
+static const struct pll_conf pll_conf_65M[] = {
+	{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x8a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x0b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x4b, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0x09, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+};
+
+static const struct pll_conf pll_conf_27M03[] = {
+	{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
+	{ 0x38, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
+	{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0xff, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x4e, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0xd7, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0x03, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+	{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
+};
+
+static const struct pll_conf pll_conf_27M[] = {
+	{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
+	{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
+	{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
+	{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+	{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
+	{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
+	{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
+	{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
+	{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
+};
+
+static const struct pll_conf pll_conf_25M2[] = {
+	{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
+	{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
+	{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
+	{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
+	{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
+	{ 0x77, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
+	{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
+	{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
+	{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
+	{ 0x20, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
+	{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
+	{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
+	{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
+	{ 0xf4, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
+	{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
+	{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
+	{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
+	{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
+	{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
+};
+
+
+/* NOTE: keep sorted highest freq to lowest: */
+static const struct pll_rate freqtbl[] = {
+	{ 154000, ARRAY_SIZE(pll_conf_154M), pll_conf_154M },
+	/* 1080p60/1080p50 case */
+	{ 148500, ARRAY_SIZE(pll_conf_148M5), pll_conf_148M5 },
+	{ 108000, ARRAY_SIZE(pll_conf_108M), pll_conf_108M },
+	/* 720p60/720p50/1080i60/1080i50/1080p24/1080p30/1080p25 */
+	{ 74250, ARRAY_SIZE(pll_conf_74M25), pll_conf_74M25 },
+	{ 74176, ARRAY_SIZE(pll_conf_74M176), pll_conf_74M176 },
+	{ 65000, ARRAY_SIZE(pll_conf_65M), pll_conf_65M },
+	/* 480p60/480i60 */
+	{ 27030, ARRAY_SIZE(pll_conf_27M03), pll_conf_27M03 },
+	/* 576p50/576i50 */
+	{ 27000, ARRAY_SIZE(pll_conf_27M), pll_conf_27M },
+	/* 640x480p60 */
+	{ 25200, ARRAY_SIZE(pll_conf_25M2), pll_conf_25M2 },
+};
+
+static const struct pll_rate *find_rate(unsigned long rate)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(freqtbl); i++)
+		if (rate > freqtbl[i].rate)
+			return &freqtbl[i - 1];
+
+	return &freqtbl[i - 1];
+}
+
+static unsigned long qcom_hdmi_8960_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = hw_clk_to_phy(hw);
+
+	return hdmi_phy->hdmi_opts.pixel_clk_rate * 1000UL;
+}
+
+static long qcom_hdmi_8960_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	const struct pll_rate *pll_rate = find_rate(rate / 1000);
+
+	return pll_rate->rate * 1000UL;
+}
+
+static const struct clk_ops qcom_hdmi_8960_pll_ops = {
+	.recalc_rate = qcom_hdmi_8960_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8960_pll_round_rate,
+};
+
+static int qcom_hdmi_8960_phy_pll_enable(struct qcom_hdmi_8960_phy *phy)
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
+static int qcom_hdmi_8960_phy_set_rate(struct qcom_hdmi_8960_phy *phy)
+{
+	unsigned int pixclk = phy->hdmi_opts.pixel_clk_rate;
+	const struct pll_rate *pll_rate = find_rate(pixclk);
+	int i;
+
+	dev_dbg(phy->dev, "rate=%u", pixclk);
+
+	for (i = 0; i < pll_rate->num_reg; i++)
+		hdmi_pll_write(phy, pll_rate->conf[i].reg, pll_rate->conf[i].val);
+
+	return 0;
+}
+
+static void qcom_hdmi_8960_phy_pll_disable(struct qcom_hdmi_8960_phy *phy)
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
+static int qcom_hdmi_8960_phy_power_on(struct phy *phy)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_hdmi_8960_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_8960_phy_set_rate(hdmi_phy);
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
+static int qcom_hdmi_8960_phy_power_off(struct phy *phy)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8960_PHY_REG2, 0x7f);
+
+	qcom_hdmi_8960_phy_pll_disable(hdmi_phy);
+
+	return 0;
+}
+
+static int qcom_hdmi_8960_phy_init(struct phy *phy)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+static int qcom_hdmi_8960_phy_exit(struct phy *phy)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int qcom_hdmi_8960_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+        const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qcom_hdmi_8960_phy *hdmi_phy = phy_get_drvdata(phy);
+        int ret = 0;
+
+        memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+        return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8960_runtime_resume(struct device *dev)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(hdmi_phy->vdda);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(hdmi_phy->iface_clk);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_disable(hdmi_phy->vdda);
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8960_runtime_suspend(struct device *dev)
+{
+	struct qcom_hdmi_8960_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(hdmi_phy->iface_clk);
+	regulator_disable(hdmi_phy->vdda);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_hdmi_8960_phy_ops = {
+	.init		= qcom_hdmi_8960_phy_init,
+	.configure	= qcom_hdmi_8960_phy_configure,
+	.power_on	= qcom_hdmi_8960_phy_power_on,
+	.power_off	= qcom_hdmi_8960_phy_power_off,
+	.exit		= qcom_hdmi_8960_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_hdmi_8960_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init = {
+		.name = "hdmipll",
+		.ops = &qcom_hdmi_8960_pll_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .fw_name = "pxo", .name = "pxo_board" },
+		},
+		.flags = CLK_GET_RATE_NOCACHE,
+		.num_parents = 1,
+	};
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_hdmi_8960_phy *hdmi_phy;
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
+	hdmi_phy->iface_clk = devm_clk_get(dev, "slave_iface");
+	if (IS_ERR(hdmi_phy->iface_clk)) {
+		ret = PTR_ERR(hdmi_phy->iface_clk);
+		return ret;
+	}
+
+	hdmi_phy->vdda = devm_regulator_get(dev, "core-vdda");
+	if (IS_ERR(hdmi_phy->vdda)) {
+		ret = PTR_ERR(hdmi_phy->vdda);
+		return ret;
+	}
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
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_8960_phy_ops);
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
+static const struct of_device_id qcom_hdmi_8960_of_match_table[] = {
+	{
+		.compatible = "qcom,hdmi-phy-8960",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_hdmi_8960_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qcom_hdmi_8960_pm_ops,
+			  qcom_hdmi_8960_runtime_suspend,
+			  qcom_hdmi_8960_runtime_resume,
+			  NULL);
+
+static struct platform_driver qcom_hdmi_8960_driver = {
+	.probe		= qcom_hdmi_8960_probe,
+	.driver = {
+		.name	= "qcom-8960-hdmi-phy",
+		.of_match_table = qcom_hdmi_8960_of_match_table,
+		.pm     = &qcom_hdmi_8960_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_hdmi_8960_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm MSM8960 HDMI PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

