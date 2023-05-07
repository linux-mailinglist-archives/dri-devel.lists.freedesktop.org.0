Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06DF6F9B85
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5C010E2F3;
	Sun,  7 May 2023 20:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACF310E07C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:28:45 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2acb6571922so16631471fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683491324; x=1686083324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iw5OqdBgV1gZd3UHf9b4z1BnLaMvQuzo/hiNdUluOl4=;
 b=TblJSnnB0N+pbTX1u17K2PsBdMG1u3yBg4WJmIRIb+8zMmuZTQ3SZRecQB+QHrrPrB
 cTuaYsmWRNn2hI4lwPaWCPcFhITRo1xBWufmEKfzUKc8iei5703qa3mP4HuCH02Ww9f7
 fJcBVaB3JzVogHQ0cCXLHqSnC7YVk5Cmh4JyenXO7FZiXRx5311bDE2QaWpmpxbB9qNq
 ZagJRmhBT/SDAZfouHhY6VFYYrzC8Ml8ey+elREixP6LSvLtXNoHvv6cBIZzmtmUrzfl
 mRSTsEB2+mOKvkCxN65we6/T3U0UCso9sYhp3sssdzRt7BbTbZ1ezKKy5WZDz/7MGQd4
 sxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683491324; x=1686083324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iw5OqdBgV1gZd3UHf9b4z1BnLaMvQuzo/hiNdUluOl4=;
 b=XpsGZBgj2I5iSWP6f1E/rLQsjKIwdPRoNCWabJ8TCudhwWKwr5biAn6DjoGxSawh6A
 ohop572HsFCsdB5aeiArE3OXmhGj+zbji2lihAhgm1KG7KPzT1V00Mfaq8HiGiTlEWJo
 R88phD5LVdRW9FU9w7/Se0zCIdFHmIY8yQ3t1CG1Rx89p9JwT1sYlDdDiJ5YQQh/R2Hx
 ekkULPHETPQ6N7dtdR7PcF5IoxU2w8KQuPPbaPZg5xGXI/cfCDgKA1nfG25W/lXwqhhq
 YSI8mIRqpFomoOqfth8uuTlFMrNxOoLbYhNBljAcMjDznpgwwz7Hgyu1oc03zM8cqTO6
 8kJQ==
X-Gm-Message-State: AC+VfDyloJQmgoPbUi4mInB7sPf9uxjssnWByvqCamfIipYfG5qN4rft
 Sy/S91M1av4HfuJfc/8frKNXqBi+Wg4JBsTEQHM=
X-Google-Smtp-Source: ACHHUZ5KHZkBjtSyBjvyRB/s718z2JbPPAC4qeySR5OGDYqiT/uhDzn0xn3tK4/H9MkWkHAYQmgcaw==
X-Received: by 2002:a2e:b2d4:0:b0:2ac:7480:aeb3 with SMTP id
 20-20020a2eb2d4000000b002ac7480aeb3mr2040260ljz.28.1683491323418; 
 Sun, 07 May 2023 13:28:43 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:28:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v1 1/3] drm/msm/hdmi: add msm8974 PLL support
Date: Sun,  7 May 2023 23:28:39 +0300
Message-Id: <20230507202841.2339127-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brian Masney <masneyb@onstation.org>

Add msm8974 Phase-Locked Loop (PLL) support to the MSM HDMI so that an
external display can be used on this SoC.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile             |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h          |   6 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c | 689 +++++++++++++++++++++++
 4 files changed, 699 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed..5032794ce4a5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -29,6 +29,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
+	hdmi/hdmi_pll_8974.o \
 
 msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e8dbee50637f..1b4937c6fe94 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -183,6 +183,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
 
 #ifdef CONFIG_COMMON_CLK
 int msm_hdmi_pll_8960_init(struct platform_device *pdev);
+int msm_hdmi_pll_8974_init(struct platform_device *pdev);
 int msm_hdmi_pll_8996_init(struct platform_device *pdev);
 #else
 static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
@@ -190,6 +191,11 @@ static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 	return -ENODEV;
 }
 
+static inline int msm_hdmi_pll_8974_init(struct platform_device *pdev)
+{
+	return -ENODEV;
+}
+
 static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 {
 	return -ENODEV;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 9780107e1cc9..92c24d40e84c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -114,6 +114,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
 	case MSM_HDMI_PHY_8960:
 		ret = msm_hdmi_pll_8960_init(pdev);
 		break;
+	case MSM_HDMI_PHY_8x74:
+		ret = msm_hdmi_pll_8974_init(pdev);
+		break;
 	case MSM_HDMI_PHY_8996:
 		ret = msm_hdmi_pll_8996_init(pdev);
 		break;
@@ -121,7 +124,6 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
 	 * we don't have PLL support for these, don't report an error for now
 	 */
 	case MSM_HDMI_PHY_8x60:
-	case MSM_HDMI_PHY_8x74:
 	default:
 		ret = 0;
 		break;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c
new file mode 100644
index 000000000000..4556dbf5ca77
--- /dev/null
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c
@@ -0,0 +1,689 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019 Brian Masney <masneyb@onstation.org>
+ *
+ * Based on clock-mdss-8974.c in downstream MSM sources.
+ * Copyright (c) 2012-2013 The Linux Foundation. All rights reserved.
+ *
+ * Based on hdmi_pll_8960.c
+ * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2016 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+
+#include "hdmi.h"
+
+/* hdmi phy registers */
+#define HDMI_PHY_ANA_CFG0		0x0000
+#define HDMI_PHY_ANA_CFG1		0x0004
+#define HDMI_PHY_ANA_CFG2		0x0008
+#define HDMI_PHY_ANA_CFG3		0x000c
+#define HDMI_PHY_PD_CTRL0		0x0010
+#define HDMI_PHY_PD_CTRL1		0x0014
+#define HDMI_PHY_GLB_CFG		0x0018
+#define HDMI_PHY_DCC_CFG0		0x001c
+#define HDMI_PHY_DCC_CFG1		0x0020
+#define HDMI_PHY_TXCAL_CFG0		0x0024
+#define HDMI_PHY_TXCAL_CFG1		0x0028
+#define HDMI_PHY_TXCAL_CFG2		0x002c
+#define HDMI_PHY_TXCAL_CFG3		0x0030
+#define HDMI_PHY_BIST_CFG0		0x0034
+#define HDMI_PHY_BIST_CFG1		0x0038
+#define HDMI_PHY_BIST_PATN0		0x003c
+#define HDMI_PHY_BIST_PATN1		0x0040
+#define HDMI_PHY_BIST_PATN2		0x0044
+#define HDMI_PHY_BIST_PATN3		0x0048
+#define HDMI_PHY_STATUS			0x005c
+
+/* hdmi phy unified pll registers */
+#define HDMI_UNI_PLL_REFCLK_CFG		0x0000
+#define HDMI_UNI_PLL_POSTDIV1_CFG	0x0004
+#define HDMI_UNI_PLL_CHFPUMP_CFG	0x0008
+#define HDMI_UNI_PLL_VCOLPF_CFG		0x000c
+#define HDMI_UNI_PLL_VREG_CFG		0x0010
+#define HDMI_UNI_PLL_PWRGEN_CFG		0x0014
+#define HDMI_UNI_PLL_GLB_CFG		0x0020
+#define HDMI_UNI_PLL_POSTDIV2_CFG	0x0024
+#define HDMI_UNI_PLL_POSTDIV3_CFG	0x0028
+#define HDMI_UNI_PLL_LPFR_CFG		0x002c
+#define HDMI_UNI_PLL_LPFC1_CFG		0x0030
+#define HDMI_UNI_PLL_LPFC2_CFG		0x0034
+#define HDMI_UNI_PLL_SDM_CFG0		0x0038
+#define HDMI_UNI_PLL_SDM_CFG1		0x003c
+#define HDMI_UNI_PLL_SDM_CFG2		0x0040
+#define HDMI_UNI_PLL_SDM_CFG3		0x0044
+#define HDMI_UNI_PLL_SDM_CFG4		0x0048
+#define HDMI_UNI_PLL_SSC_CFG0		0x004c
+#define HDMI_UNI_PLL_SSC_CFG1		0x0050
+#define HDMI_UNI_PLL_SSC_CFG2		0x0054
+#define HDMI_UNI_PLL_SSC_CFG3		0x0058
+#define HDMI_UNI_PLL_LKDET_CFG0		0x005c
+#define HDMI_UNI_PLL_LKDET_CFG1		0x0060
+#define HDMI_UNI_PLL_LKDET_CFG2		0x0064
+#define HDMI_UNI_PLL_CAL_CFG0		0x006c
+#define HDMI_UNI_PLL_CAL_CFG1		0x0070
+#define HDMI_UNI_PLL_CAL_CFG2		0x0074
+#define HDMI_UNI_PLL_CAL_CFG3		0x0078
+#define HDMI_UNI_PLL_CAL_CFG4		0x007c
+#define HDMI_UNI_PLL_CAL_CFG5		0x0080
+#define HDMI_UNI_PLL_CAL_CFG6		0x0084
+#define HDMI_UNI_PLL_CAL_CFG7		0x0088
+#define HDMI_UNI_PLL_CAL_CFG8		0x008c
+#define HDMI_UNI_PLL_CAL_CFG9		0x0090
+#define HDMI_UNI_PLL_CAL_CFG10		0x0094
+#define HDMI_UNI_PLL_CAL_CFG11		0x0098
+#define HDMI_UNI_PLL_STATUS		0x00c0
+
+struct msm8974_hdmi {
+	struct platform_device *pdev;
+	struct clk_hw clk_hw;
+	void __iomem *mmio;
+	unsigned long pixclk;
+};
+
+#define hw_clk_to_msm8974_hdmi(x) container_of(x, struct msm8974_hdmi, clk_hw)
+
+struct msm8974_hdmi_reg {
+	void (*write)(struct msm8974_hdmi *hdmi, u32 reg, u32 data);
+	u32 val;
+	u32 reg;
+};
+
+#define MSM8974_HDMI_NUM_REGS 38
+
+struct msm8974_hdmi_rate {
+	unsigned long rate;
+	struct msm8974_hdmi_reg regs[MSM8974_HDMI_NUM_REGS];
+};
+
+static u32 msm8974_hdmi_pll_read(struct msm8974_hdmi *hdmi, u32 reg)
+{
+	return msm_readl(hdmi->mmio + reg);
+}
+
+static void msm8974_hdmi_pll_write(struct msm8974_hdmi *hdmi, u32 reg, u32 data)
+{
+	msm_writel(data, hdmi->mmio + reg);
+}
+
+static u32 msm8974_hdmi_phy_read(struct msm8974_hdmi *hdmi, u32 reg)
+{
+	struct hdmi_phy *phy = platform_get_drvdata(hdmi->pdev);
+
+	return hdmi_phy_read(phy, reg);
+}
+
+static void msm8974_hdmi_phy_write(struct msm8974_hdmi *hdmi, u32 reg, u32 data)
+{
+	struct hdmi_phy *phy = platform_get_drvdata(hdmi->pdev);
+
+	hdmi_phy_write(phy, reg, data);
+}
+
+/* NOTE: keep sorted highest to lowest frequencies */
+static const struct msm8974_hdmi_rate msm8974_hdmi_freqtbl[] = {
+	{ 297000000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x65, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0xac, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0xcd, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x06, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x03, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	{ 268500000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x36, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x61, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0xf6, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0x3e, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x11, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	{ 148500000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x52, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x56, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0xe6, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x02, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	{ 108000000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x5B, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0x38, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	/* 720p60/720p50/1080i60/1080i50, 1080p24/1080p30/1080p25 case */
+	{ 74250000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x52, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x56, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0xe6, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x02, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	{ 65000000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x4f, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x55, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0xed, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0x8A, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x02, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	/* 480p60/480i60 case */
+	{ 27030000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x54, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x66, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x1d, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x03, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0x2a, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x03, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	/* 576p50/576i50 case */
+	{ 27000000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x54, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x18, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x03, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0x2a, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x03, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	},
+
+	/* 640x480p60 */
+	{ 25200000, {
+		{ msm8974_hdmi_phy_write, 0x81, HDMI_PHY_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_REFCLK_CFG },
+		{ msm8974_hdmi_pll_write, 0x19, HDMI_UNI_PLL_VCOLPF_CFG },
+		{ msm8974_hdmi_pll_write, 0x0e, HDMI_UNI_PLL_LPFR_CFG },
+		{ msm8974_hdmi_pll_write, 0x20, HDMI_UNI_PLL_LPFC1_CFG },
+		{ msm8974_hdmi_pll_write, 0x0d, HDMI_UNI_PLL_LPFC2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x52, HDMI_UNI_PLL_SDM_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG2 },
+		{ msm8974_hdmi_pll_write, 0xb0, HDMI_UNI_PLL_SDM_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_SDM_CFG4 },
+		{ msm8974_hdmi_pll_write, 0x10, HDMI_UNI_PLL_LKDET_CFG0 },
+		{ msm8974_hdmi_pll_write, 0x1a, HDMI_UNI_PLL_LKDET_CFG1 },
+		{ msm8974_hdmi_pll_write, 0x05, HDMI_UNI_PLL_LKDET_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x03, HDMI_UNI_PLL_POSTDIV1_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV2_CFG },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_POSTDIV3_CFG },
+		{ msm8974_hdmi_pll_write, 0x01, HDMI_UNI_PLL_CAL_CFG2 },
+		{ msm8974_hdmi_pll_write, 0x60, HDMI_UNI_PLL_CAL_CFG8 },
+		{ msm8974_hdmi_pll_write, 0x00, HDMI_UNI_PLL_CAL_CFG9 },
+		{ msm8974_hdmi_pll_write, 0xf4, HDMI_UNI_PLL_CAL_CFG10 },
+		{ msm8974_hdmi_pll_write, 0x02, HDMI_UNI_PLL_CAL_CFG11 },
+		{ msm8974_hdmi_phy_write, 0x1f, HDMI_PHY_PD_CTRL0 },
+		{ msm8974_hdmi_pll_write, 0x0f, HDMI_UNI_PLL_GLB_CFG },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_PD_CTRL1 },
+		{ msm8974_hdmi_phy_write, 0x10, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0xdb, HDMI_PHY_ANA_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x43, HDMI_PHY_ANA_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_ANA_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_ANA_CFG3 },
+		{ msm8974_hdmi_pll_write, 0x04, HDMI_UNI_PLL_VREG_CFG },
+		{ msm8974_hdmi_phy_write, 0xd0, HDMI_PHY_DCC_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x1a, HDMI_PHY_DCC_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG0 },
+		{ msm8974_hdmi_phy_write, 0x00, HDMI_PHY_TXCAL_CFG1 },
+		{ msm8974_hdmi_phy_write, 0x02, HDMI_PHY_TXCAL_CFG2 },
+		{ msm8974_hdmi_phy_write, 0x05, HDMI_PHY_TXCAL_CFG3 }
+			}
+	}
+};
+
+static void msm8974_hdmi_disable(struct clk_hw *hw)
+{
+	struct msm8974_hdmi *hdmi = hw_clk_to_msm8974_hdmi(hw);
+
+	msm8974_hdmi_pll_write(hdmi, HDMI_UNI_PLL_GLB_CFG, 0);
+	udelay(5);
+	msm8974_hdmi_phy_write(hdmi, HDMI_PHY_GLB_CFG, 0);
+}
+
+static int msm8974_hdmi_wait_for_ready(struct msm8974_hdmi *hdmi,
+				       u32 (*read)(struct msm8974_hdmi *hdmi,
+						   u32 reg),
+				       u32 reg)
+{
+	int retry;
+	u32 val;
+
+	for (retry = 20; retry > 0; retry--) {
+		val = read(hdmi, reg);
+		if (val & BIT(0))
+			return 0;
+
+		udelay(100);
+	}
+
+	return -EINVAL;
+}
+
+static int msm8974_hdmi_enable(struct clk_hw *hw)
+{
+	struct msm8974_hdmi *hdmi = hw_clk_to_msm8974_hdmi(hw);
+	int ret;
+
+	/* Global enable */
+	msm8974_hdmi_phy_write(hdmi, HDMI_PHY_GLB_CFG, 0x81);
+
+	/* Power up power gen */
+	msm8974_hdmi_phy_write(hdmi, HDMI_PHY_PD_CTRL0, 0x00);
+	udelay(350);
+
+	/* PLL power up */
+	msm8974_hdmi_pll_write(hdmi, HDMI_UNI_PLL_GLB_CFG, 0x01);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	msm8974_hdmi_pll_write(hdmi, HDMI_UNI_PLL_GLB_CFG, 0x03);
+	udelay(350);
+
+	/* PLL power up */
+	msm8974_hdmi_pll_write(hdmi, HDMI_UNI_PLL_GLB_CFG, 0x0f);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = msm8974_hdmi_wait_for_ready(hdmi, msm8974_hdmi_pll_read,
+					  HDMI_UNI_PLL_STATUS);
+	if (ret)
+		goto error;
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = msm8974_hdmi_wait_for_ready(hdmi, msm8974_hdmi_phy_read,
+					  HDMI_PHY_STATUS);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	msm8974_hdmi_disable(hw);
+	return ret;
+}
+
+static const struct msm8974_hdmi_rate *msm8974_hdmi_find_rate(unsigned long rt)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(msm8974_hdmi_freqtbl); i++) {
+		if (rt > msm8974_hdmi_freqtbl[i].rate)
+			return &msm8974_hdmi_freqtbl[i - 1];
+	}
+
+	return &msm8974_hdmi_freqtbl[i - 1];
+}
+
+static unsigned long msm8974_hdmi_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	return hw_clk_to_msm8974_hdmi(hw)->pixclk;
+}
+
+static long msm8974_hdmi_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	return msm8974_hdmi_find_rate(rate)->rate;
+}
+
+static int msm8974_hdmi_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct msm8974_hdmi *hdmi = hw_clk_to_msm8974_hdmi(hw);
+	const struct msm8974_hdmi_rate *rateinfo = msm8974_hdmi_find_rate(rate);
+	int i;
+
+	for (i = 0; i < MSM8974_HDMI_NUM_REGS; i++) {
+		struct msm8974_hdmi_reg reginfo = rateinfo->regs[i];
+
+		reginfo.write(hdmi, reginfo.reg, reginfo.val);
+
+		if (reginfo.reg == HDMI_PHY_PD_CTRL0)
+			udelay(50);
+		else if (reginfo.reg == HDMI_PHY_TXCAL_CFG3)
+			udelay(200);
+	}
+
+	hdmi->pixclk = rate;
+
+	return 0;
+}
+
+static const struct clk_ops msm8974_hdmi_ops = {
+	.enable = msm8974_hdmi_enable,
+	.disable = msm8974_hdmi_disable,
+	.recalc_rate = msm8974_hdmi_recalc_rate,
+	.round_rate = msm8974_hdmi_round_rate,
+	.set_rate = msm8974_hdmi_set_rate,
+};
+
+static const char * const msm8974_hdmi_pll_parents[] = {
+	"pxo",
+};
+
+static struct clk_init_data msm8974_hdmi_pll_init = {
+	.name = "hdmi_pll",
+	.ops = &msm8974_hdmi_ops,
+	.parent_names = msm8974_hdmi_pll_parents,
+	.num_parents = ARRAY_SIZE(msm8974_hdmi_pll_parents),
+	.flags = CLK_IGNORE_UNUSED,
+};
+
+int msm_hdmi_pll_8974_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct msm8974_hdmi *hdmi;
+	int i, ret;
+
+	/* sanity check */
+	for (i = 0; i < (ARRAY_SIZE(msm8974_hdmi_freqtbl) - 1); i++) {
+		if (WARN_ON(msm8974_hdmi_freqtbl[i].rate <
+			    msm8974_hdmi_freqtbl[i + 1].rate))
+			return -EINVAL;
+	}
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->mmio = msm_ioremap(pdev, "hdmi_pll");
+	if (IS_ERR(hdmi->mmio)) {
+		DRM_DEV_ERROR(dev, "failed to map pll base\n");
+		return -ENOMEM;
+	}
+
+	hdmi->pdev = pdev;
+	hdmi->clk_hw.init = &msm8974_hdmi_pll_init;
+
+	ret = devm_clk_hw_register(dev, &hdmi->clk_hw);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &hdmi->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.39.2

