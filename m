Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F37B1A57
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF08110E614;
	Thu, 28 Sep 2023 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ACD10E609
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:38 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so21199038e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899797; x=1696504597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WaqYa1p7vqN61Nnmz1mMsVu16pc4A060DpWFBkQ5zwA=;
 b=m0+ySAzeNyyOZTtvJZxDj6geaskyAvDhPDB8pSRsSZdRA/GGo8+Lf7yRo8J+ul3j7T
 3BA6DK+feHNL/7SWyYOZBJCDMlmQ5fjsk11AUrvaSEVmhUa2BQX19r/mAnjk38QwNADo
 vNZQfdFn9aElSxsn42B1jlFlsYvWe2HOedqd41SxdFEOa0Z6YC7ma5/lXawVUnK9tECC
 WI/gSyjAw0EROtVRCuZb/dKXIFLaE6RBABNtGCIuj9LiYKz2qRMG0tYFCOdidiDxBGbL
 rml6E1gB09z3URD7TUEbvwz/ssQGMGnR51L+aqBNNj4uFpql1sdVNTWTL4S0tPowko74
 kvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899797; x=1696504597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WaqYa1p7vqN61Nnmz1mMsVu16pc4A060DpWFBkQ5zwA=;
 b=nN28Y7AHF48+KhSzoe5WjlfyBKrK0xgLTc6fn/y6epbyugMYoydZ6IVRuANoO9lqRI
 jmDfygyDLcNbpiZuP0cVtIDFDBzHhtjwbdqkwurG/3ik3ODmN5EiZ/HQ36WgIWfUY8Zi
 H8Db/KxjSMuQR8hWq0GPkfBVtmNzJ0qQidF7zA9MaveBKD6XTsirudZUUWWcY4oBgkx1
 N0Pi50LLiNWFjPBkaXg5WvSDjjnge1Owa1mJh978kqk0tJnMZUOmAa2CR+Uee1RXYyAk
 cYB54eHeZUinDyX6esoVFnb6oRKa6gtancgtejVryMQfL0zdJQOCgvCOB4ModL32ewvI
 SmGQ==
X-Gm-Message-State: AOJu0YwQ31uRXxeFUsBPab7qbjdZhz+aT1ZHw8IkaMoB0FYT9F7sgEns
 UxDTgF+OoLs18IM4UiSO0E4pwA==
X-Google-Smtp-Source: AGHT+IELwAXbwNWKBM1QMtP91xkOdmLsDx0Ktv/JYhcUeyUVfQBYJWS7Wq0baHGU6E4lXOEPSArOwg==
X-Received: by 2002:a05:6512:3c8b:b0:502:ab7b:e480 with SMTP id
 h11-20020a0565123c8b00b00502ab7be480mr1068705lfv.36.1695899796850; 
 Thu, 28 Sep 2023 04:16:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v3 07/15] phy: qualcomm: add MSM8x60 HDMI PHY support
Date: Thu, 28 Sep 2023 14:16:21 +0300
Message-Id: <20230928111630.1217419-8-dmitry.baryshkov@linaro.org>
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

Add support for HDMI PHY on Qualcomm MSM8x60 / APQ8060 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c   | 184 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c |  32 ++--
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h |   1 +
 4 files changed, 204 insertions(+), 14 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 082020af7fc1..79df2f1e9bc8 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -10,6 +10,7 @@ phy-qcom-hdmi-y := \
 	phy-qcom-hdmi-preqmp.o \
 	phy-qcom-hdmi-28hpm.o \
 	phy-qcom-hdmi-28lpm.o \
+	phy-qcom-hdmi-45nm.o \
 
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c
new file mode 100644
index 000000000000..31e1e9f2d037
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include "phy-qcom-hdmi-preqmp.h"
+
+#define REG_HDMI_8x60_PHY_REG0					0x00000000
+#define HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK			0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG1					0x00000004
+#define HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK			0x000000f0
+#define HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK		0x0000000f
+
+#define REG_HDMI_8x60_PHY_REG2					0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DESER				0x00000001
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_1				0x00000002
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_2				0x00000004
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_3				0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_4				0x00000010
+#define HDMI_8x60_PHY_REG2_PD_PLL				0x00000020
+#define HDMI_8x60_PHY_REG2_PD_PWRGEN				0x00000040
+#define HDMI_8x60_PHY_REG2_RCV_SENSE_EN				0x00000080
+
+#define REG_HDMI_8x60_PHY_REG3					0x0000000c
+#define HDMI_8x60_PHY_REG3_PLL_ENABLE				0x00000001
+
+#define REG_HDMI_8x60_PHY_REG4					0x00000010
+
+#define REG_HDMI_8x60_PHY_REG5					0x00000014
+
+#define REG_HDMI_8x60_PHY_REG6					0x00000018
+
+#define REG_HDMI_8x60_PHY_REG7					0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG8					0x00000020
+
+#define REG_HDMI_8x60_PHY_REG9					0x00000024
+
+#define REG_HDMI_8x60_PHY_REG10					0x00000028
+
+#define REG_HDMI_8x60_PHY_REG11					0x0000002c
+
+#define REG_HDMI_8x60_PHY_REG12					0x00000030
+#define HDMI_8x60_PHY_REG12_RETIMING_EN				0x00000001
+#define HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN			0x00000002
+#define HDMI_8x60_PHY_REG12_FORCE_LOCK				0x00000010
+
+static int qcom_hdmi_msm8x60_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long pixclock = hdmi_phy->hdmi_opts.pixel_clk_rate;
+
+	/* De-serializer delay D/C for non-lbk mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG0,
+		       FIELD_PREP(HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK, 3));
+
+	if (pixclock == 27000) {
+		/* video_format == HDMI_VFRMT_720x480p60_16_9 */
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 3));
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 4));
+	}
+
+	/* No matter what, start from the power down mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PowerGen on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PLL power on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Write to HIGH after PLL power down de-assert: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3,
+		       HDMI_8x60_PHY_REG3_PLL_ENABLE);
+
+	/* ASIC power on; PHY REG9 = 0 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+
+	/* Enable PLL lock detect, PLL lock det will go high after lock
+	 * Enable the re-time logic
+	 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN);
+
+	/* Drivers are on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* If the RX detector is needed: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG4, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG5, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG6, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG7, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG8, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG10, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG11, 0);
+
+	/* If we want to use lock enable based on counting: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN |
+		       HDMI_8x60_PHY_REG12_FORCE_LOCK);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8x60_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	/* Turn off Driver */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+	udelay(10);
+	/* Disable PLL */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3, 0);
+	/* Power down PHY, but keep RX-sense: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	return 0;
+}
+
+const struct qcom_hdmi_preqmp_cfg msm8x60_hdmi_phy_cfg = {
+	.clk_names = { "slave_iface" },
+	.num_clks = 1,
+
+	.reg_names = { "core-vdda" },
+	.num_regs = 1,
+
+	.power_on = qcom_hdmi_msm8x60_phy_power_on,
+	.power_off = qcom_hdmi_msm8x60_phy_power_off,
+
+	/* FIXME: no PLL support */
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
index e181a45df2dc..66aa199424b8 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
@@ -147,20 +147,23 @@ static int qcom_hdmi_preqmp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	init.name = "hdmipll";
-	init.ops = cfg->pll_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
-	init.parent_data = cfg->pll_parent;
-	init.num_parents = 1;
-
-	hdmi_phy->pll_hw.init = &init;
-	ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
-	if (ret)
-		goto err;
-
-	ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
-	if (ret)
-		goto err;
+	/* FIXME: msm8x60 doesn't yet have PLL ops */
+	if (cfg->pll_ops) {
+		init.name = "hdmipll";
+		init.ops = cfg->pll_ops;
+		init.flags = CLK_GET_RATE_NOCACHE;
+		init.parent_data = cfg->pll_parent;
+		init.num_parents = 1;
+
+		hdmi_phy->pll_hw.init = &init;
+		ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
+		if (ret)
+			goto err;
+
+		ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
+		if (ret)
+			goto err;
+	}
 
 	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_preqmp_phy_ops);
 	if (IS_ERR(hdmi_phy->phy)) {
@@ -180,6 +183,7 @@ static int qcom_hdmi_preqmp_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_hdmi_preqmp_of_match_table[] = {
+	{ .compatible = "qcom,hdmi-phy-8x60", .data = &msm8x60_hdmi_phy_cfg, },
 	{ .compatible = "qcom,hdmi-phy-8960", .data = &msm8960_hdmi_phy_cfg, },
 	{ .compatible = "qcom,hdmi-phy-8974", .data = &msm8974_hdmi_phy_cfg, },
 	{ },
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
index bc81d68463ec..66fb9235520a 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
@@ -74,6 +74,7 @@ static inline u32 hdmi_pll_read(struct qcom_hdmi_preqmp_phy *phy, int offset)
 	return readl(phy->pll_reg + offset);
 }
 
+extern const struct qcom_hdmi_preqmp_cfg msm8x60_hdmi_phy_cfg;
 extern const struct qcom_hdmi_preqmp_cfg msm8960_hdmi_phy_cfg;
 extern const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg;
 
-- 
2.39.2

