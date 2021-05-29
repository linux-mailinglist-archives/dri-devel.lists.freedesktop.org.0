Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B4394997
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F80D6F646;
	Sat, 29 May 2021 00:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349806F646
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r5so7753885lfr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YeMcsBxtqjRiplyRvTKGK3l7q2JJY3PPMyHozMB7ck=;
 b=OO5dRPsTzBxSutXS3y1p89+ayxtHkobbjNguAMNRJkjh440wxHRYJf/JotoEeq8Y4G
 YHOFXzoL0FhX93FJRuuvhL7x8dRXy2xzobrGV3ABEiMye/ApQEcyv/E1S5aRu6dtIDh5
 LQKE45FS/TIUxSYh5jRBce4NGeDM7v2o2POHb6207qCcP00YsGHj/knTy4ip5klM1Dkj
 apXCJbKvN2SvuYQQnSbuxsZSqCKfhUQqQo9WugJxlO+cxhTc9Cm7oPuQ6occkAxHcmS3
 6Ax+8K3enbPafwsYtzf7k5ONE0n1ZCAzgF1g3qHctzJS5TH8Kg9RnKiriFNjEBziDlaQ
 dTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YeMcsBxtqjRiplyRvTKGK3l7q2JJY3PPMyHozMB7ck=;
 b=sa9zxPX6xx4wWASZln+c+OajWfWbN2K3HYaLAqSAlf9/RkfDdZcjsIg6s/lobpeDyQ
 ZO/mQ3Cb9rBvRRIAv6k3gvBg9NikzLCoBZ57lEHvyeXtEjHgG0GKr47DkqifJBEHUB9Z
 1j7fhA/7nRJBASy4jAARHlKTYKRP8G8w+PFy71aaADdPlDJ1oMMoBW2ckPvMpolW9U7q
 3xEXPXnw0V3wfCloHnyZIZb1ZsvVIWkKMcnwNTqCIDWUfX+eacWH72rI8NlngX185e2G
 7DpI4+nZqjcpX5qIE2Zm5veLC1xVPfkJEsu/851UbGE/z7gAVronSOLY38XfzHahjHh7
 D61Q==
X-Gm-Message-State: AOAM530GFe+u9fUdBQ2kwoeAkyD3RhfdzWUqR6BE7aIdzA/c3hQose8K
 7qaeA+fzmH5iXEnNXaOaxcepczFOojzJkQ==
X-Google-Smtp-Source: ABdhPJxzz0X0mAMQfIq3W0uvBtVXywe9rr0v5qv1YqFtY9Kg6mqxmZYpVXuUno5GWL0AK5nlgy4ISQ==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr7214785lfn.558.1622247922965; 
 Fri, 28 May 2021 17:25:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 8/8] drm/msm: split DSI PHY driver to generic phy subsystem
Date: Sat, 29 May 2021 03:25:08 +0300
Message-Id: <20210529002508.3839467-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM PHY driver has become a complex beast on its own. Move it to the
generic PHY subsystem in order to have clear boundary between MSM DSI
code and Qualcomm DSI PHY driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |    8 -
 drivers/gpu/drm/msm/dsi/dsi.c                 |   51 +-
 drivers/gpu/drm/msm/dsi/dsi.h                 |   49 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             | 1689 -----------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   12 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |   30 +-
 drivers/phy/qualcomm/Kconfig                  |    6 +
 drivers/phy/qualcomm/Makefile                 |    5 +
 drivers/phy/qualcomm/dsi_phy_10nm.xml.h       |  227 +++
 drivers/phy/qualcomm/dsi_phy_14nm.xml.h       |  309 +++
 drivers/phy/qualcomm/dsi_phy_20nm.xml.h       |  237 +++
 drivers/phy/qualcomm/dsi_phy_28nm.xml.h       |  384 ++++
 drivers/phy/qualcomm/dsi_phy_28nm_8960.xml.h  |  286 +++
 drivers/phy/qualcomm/dsi_phy_7nm.xml.h        |  481 +++++
 .../qualcomm/phy-qcom-dsi-10nm.c}             |   27 +-
 .../qualcomm/phy-qcom-dsi-14nm.c}             |   23 +-
 .../qualcomm/phy-qcom-dsi-20nm.c}             |   14 +-
 .../qualcomm/phy-qcom-dsi-28nm.c}             |   32 +-
 .../qualcomm/phy-qcom-dsi-28nm_8960.c}        |   22 +-
 .../qualcomm/phy-qcom-dsi-7nm.c}              |   25 +-
 .../qualcomm/phy-qcom-dsi-core.c}             |  426 +++--
 .../dsi_phy.h => phy/qualcomm/phy-qcom-dsi.h} |   57 +-
 include/linux/phy/phy-qcom-dsi.h              |   38 +
 include/linux/phy/phy.h                       |    3 +
 24 files changed, 2377 insertions(+), 2064 deletions(-)
 create mode 100644 drivers/phy/qualcomm/dsi_phy_10nm.xml.h
 create mode 100644 drivers/phy/qualcomm/dsi_phy_14nm.xml.h
 create mode 100644 drivers/phy/qualcomm/dsi_phy_20nm.xml.h
 create mode 100644 drivers/phy/qualcomm/dsi_phy_28nm.xml.h
 create mode 100644 drivers/phy/qualcomm/dsi_phy_28nm_8960.xml.h
 create mode 100644 drivers/phy/qualcomm/dsi_phy_7nm.xml.h
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_10nm.c => phy/qualcomm/phy-qcom-dsi-10nm.c} (97%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_14nm.c => phy/qualcomm/phy-qcom-dsi-14nm.c} (98%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_20nm.c => phy/qualcomm/phy-qcom-dsi-20nm.c} (93%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_28nm.c => phy/qualcomm/phy-qcom-dsi-28nm.c} (97%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c => phy/qualcomm/phy-qcom-dsi-28nm_8960.c} (97%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy_7nm.c => phy/qualcomm/phy-qcom-dsi-7nm.c} (97%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy.c => phy/qualcomm/phy-qcom-dsi-core.c} (78%)
 rename drivers/{gpu/drm/msm/dsi/phy/dsi_phy.h => phy/qualcomm/phy-qcom-dsi.h} (69%)
 create mode 100644 include/linux/phy/phy-qcom-dsi.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 65d86cecb571..f4e3e5f323d9 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -128,14 +128,6 @@ msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
-			dsi/phy/dsi_phy.o \
 			disp/mdp5/mdp5_cmd_encoder.o
 
-msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
-msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
-msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
-msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
-msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
-msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
-
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index ce76edfa681a..63e4a642cb60 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/phy/phy.h>
+
 #include "dsi.h"
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
@@ -13,34 +15,6 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 	return msm_dsi->encoder;
 }
 
-static int dsi_get_phy(struct msm_dsi *msm_dsi)
-{
-	struct platform_device *pdev = msm_dsi->pdev;
-	struct platform_device *phy_pdev;
-	struct device_node *phy_node;
-
-	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
-	if (!phy_node) {
-		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
-		return -ENXIO;
-	}
-
-	phy_pdev = of_find_device_by_node(phy_node);
-	if (phy_pdev)
-		msm_dsi->phy = platform_get_drvdata(phy_pdev);
-
-	of_node_put(phy_node);
-
-	if (!phy_pdev || !msm_dsi->phy) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
-		return -EPROBE_DEFER;
-	}
-
-	msm_dsi->phy_dev = get_device(&phy_pdev->dev);
-
-	return 0;
-}
-
 static void dsi_destroy(struct msm_dsi *msm_dsi)
 {
 	if (!msm_dsi)
@@ -48,11 +22,7 @@ static void dsi_destroy(struct msm_dsi *msm_dsi)
 
 	msm_dsi_manager_unregister(msm_dsi);
 
-	if (msm_dsi->phy_dev) {
-		put_device(msm_dsi->phy_dev);
-		msm_dsi->phy = NULL;
-		msm_dsi->phy_dev = NULL;
-	}
+	phy_exit(msm_dsi->phy);
 
 	if (msm_dsi->host) {
 		msm_dsi_host_destroy(msm_dsi->host);
@@ -85,8 +55,17 @@ static struct msm_dsi *dsi_init(struct platform_device *pdev)
 		goto destroy_dsi;
 
 	/* GET dsi PHY */
-	ret = dsi_get_phy(msm_dsi);
-	if (ret)
+	msm_dsi->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, "dsi");
+	if (IS_ERR(msm_dsi->phy)) {
+		ret = PTR_ERR(msm_dsi->phy);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready: %d\n", __func__, ret);
+		msm_dsi->phy = NULL;
+		goto destroy_dsi;
+	}
+
+	ret = phy_init(msm_dsi->phy);
+	if (ret < 0)
 		goto destroy_dsi;
 
 	/* Register to dsi manager */
@@ -178,14 +157,12 @@ static struct platform_driver dsi_driver = {
 void __init msm_dsi_register(void)
 {
 	DBG("");
-	msm_dsi_phy_driver_register();
 	platform_driver_register(&dsi_driver);
 }
 
 void __exit msm_dsi_unregister(void)
 {
 	DBG("");
-	msm_dsi_phy_driver_unregister();
 	platform_driver_unregister(&dsi_driver);
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9ccdf1563cf2..a46fbcfb3964 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -7,6 +7,7 @@
 #define __DSI_CONNECTOR_H__
 
 #include <linux/of_platform.h>
+#include <linux/phy/phy-qcom-dsi.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_bridge.h>
@@ -21,30 +22,9 @@
 #define DSI_1	1
 #define DSI_MAX	2
 
-struct msm_dsi_phy_shared_timings;
-struct msm_dsi_phy_clk_request;
-
-enum msm_dsi_phy_usecase {
-	MSM_DSI_PHY_STANDALONE,
-	MSM_DSI_PHY_MASTER,
-	MSM_DSI_PHY_SLAVE,
-};
-
 #define DSI_DEV_REGULATOR_MAX	8
 #define DSI_BUS_CLK_MAX		4
 
-/* Regulators for DSI devices */
-struct dsi_reg_entry {
-	char name[32];
-	int enable_load;
-	int disable_load;
-};
-
-struct dsi_reg_config {
-	int num;
-	struct dsi_reg_entry regs[DSI_DEV_REGULATOR_MAX];
-};
-
 struct msm_dsi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
@@ -55,7 +35,7 @@ struct msm_dsi {
 	struct drm_bridge *bridge;
 
 	struct mipi_dsi_host *host;
-	struct msm_dsi_phy *phy;
+	struct phy *phy;
 
 	/*
 	 * panel/external_bridge connected to dsi bridge output, only one of the
@@ -64,7 +44,6 @@ struct msm_dsi {
 	struct drm_panel *panel;
 	struct drm_bridge *external_bridge;
 
-	struct device *phy_dev;
 	bool phy_enabled;
 
 	/* the encoder we are hooked to (outside of dsi block) */
@@ -118,8 +97,6 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-			struct msm_dsi_phy *src_phy);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
 void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	struct msm_dsi_phy_clk_request *clk_req,
@@ -148,28 +125,6 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 void msm_dsi_host_snapshot(struct dump_state *disp_state, struct mipi_dsi_host *host);
-/* dsi phy */
-struct msm_dsi_phy;
-struct msm_dsi_phy_shared_timings {
-	u32 clk_post;
-	u32 clk_pre;
-	bool clk_pre_inc_by_2;
-};
-
-struct msm_dsi_phy_clk_request {
-	unsigned long bitclk_rate;
-	unsigned long escclk_rate;
-};
-
-void msm_dsi_phy_driver_register(void);
-void msm_dsi_phy_driver_unregister(void);
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_clk_request *clk_req,
-			struct msm_dsi_phy_shared_timings *shared_timings);
-void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
-void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
-			     enum msm_dsi_phy_usecase uc);
-void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 50eb4d1b8fdd..11f2cfc7411f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -621,1693 +621,4 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
 	return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
 }
 
-#define REG_DSI_PHY_PLL_CTRL_0					0x00000200
-#define DSI_PHY_PLL_CTRL_0_ENABLE				0x00000001
-
-#define REG_DSI_PHY_PLL_CTRL_1					0x00000204
-
-#define REG_DSI_PHY_PLL_CTRL_2					0x00000208
-
-#define REG_DSI_PHY_PLL_CTRL_3					0x0000020c
-
-#define REG_DSI_PHY_PLL_CTRL_4					0x00000210
-
-#define REG_DSI_PHY_PLL_CTRL_5					0x00000214
-
-#define REG_DSI_PHY_PLL_CTRL_6					0x00000218
-
-#define REG_DSI_PHY_PLL_CTRL_7					0x0000021c
-
-#define REG_DSI_PHY_PLL_CTRL_8					0x00000220
-
-#define REG_DSI_PHY_PLL_CTRL_9					0x00000224
-
-#define REG_DSI_PHY_PLL_CTRL_10					0x00000228
-
-#define REG_DSI_PHY_PLL_CTRL_11					0x0000022c
-
-#define REG_DSI_PHY_PLL_CTRL_12					0x00000230
-
-#define REG_DSI_PHY_PLL_CTRL_13					0x00000234
-
-#define REG_DSI_PHY_PLL_CTRL_14					0x00000238
-
-#define REG_DSI_PHY_PLL_CTRL_15					0x0000023c
-
-#define REG_DSI_PHY_PLL_CTRL_16					0x00000240
-
-#define REG_DSI_PHY_PLL_CTRL_17					0x00000244
-
-#define REG_DSI_PHY_PLL_CTRL_18					0x00000248
-
-#define REG_DSI_PHY_PLL_CTRL_19					0x0000024c
-
-#define REG_DSI_PHY_PLL_CTRL_20					0x00000250
-
-#define REG_DSI_PHY_PLL_STATUS					0x00000280
-#define DSI_PHY_PLL_STATUS_PLL_BUSY				0x00000001
-
-#define REG_DSI_8x60_PHY_TPA_CTRL_1				0x00000258
-
-#define REG_DSI_8x60_PHY_TPA_CTRL_2				0x0000025c
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_0				0x00000260
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_1				0x00000264
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_2				0x00000268
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_3				0x0000026c
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_4				0x00000270
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_5				0x00000274
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_6				0x00000278
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_7				0x0000027c
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_8				0x00000280
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_9				0x00000284
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_10				0x00000288
-
-#define REG_DSI_8x60_PHY_TIMING_CTRL_11				0x0000028c
-
-#define REG_DSI_8x60_PHY_CTRL_0					0x00000290
-
-#define REG_DSI_8x60_PHY_CTRL_1					0x00000294
-
-#define REG_DSI_8x60_PHY_CTRL_2					0x00000298
-
-#define REG_DSI_8x60_PHY_CTRL_3					0x0000029c
-
-#define REG_DSI_8x60_PHY_STRENGTH_0				0x000002a0
-
-#define REG_DSI_8x60_PHY_STRENGTH_1				0x000002a4
-
-#define REG_DSI_8x60_PHY_STRENGTH_2				0x000002a8
-
-#define REG_DSI_8x60_PHY_STRENGTH_3				0x000002ac
-
-#define REG_DSI_8x60_PHY_REGULATOR_CTRL_0			0x000002cc
-
-#define REG_DSI_8x60_PHY_REGULATOR_CTRL_1			0x000002d0
-
-#define REG_DSI_8x60_PHY_REGULATOR_CTRL_2			0x000002d4
-
-#define REG_DSI_8x60_PHY_REGULATOR_CTRL_3			0x000002d8
-
-#define REG_DSI_8x60_PHY_REGULATOR_CTRL_4			0x000002dc
-
-#define REG_DSI_8x60_PHY_CAL_HW_TRIGGER				0x000000f0
-
-#define REG_DSI_8x60_PHY_CAL_CTRL				0x000000f4
-
-#define REG_DSI_8x60_PHY_CAL_STATUS				0x000000fc
-#define DSI_8x60_PHY_CAL_STATUS_CAL_BUSY			0x10000000
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x0000000c + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x00000014 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000018 + 0x40*i0; }
-
-#define REG_DSI_28nm_8960_PHY_LNCK_CFG_0			0x00000100
-
-#define REG_DSI_28nm_8960_PHY_LNCK_CFG_1			0x00000104
-
-#define REG_DSI_28nm_8960_PHY_LNCK_CFG_2			0x00000108
-
-#define REG_DSI_28nm_8960_PHY_LNCK_TEST_DATAPATH		0x0000010c
-
-#define REG_DSI_28nm_8960_PHY_LNCK_TEST_STR0			0x00000114
-
-#define REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1			0x00000118
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_0			0x00000140
-#define DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_1			0x00000144
-#define DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT	0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_2			0x00000148
-#define DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK	0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT	0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_3			0x0000014c
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_4			0x00000150
-#define DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_5			0x00000154
-#define DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_6			0x00000158
-#define DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__MASK	0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT	0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_7			0x0000015c
-#define DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_8			0x00000160
-#define DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_9			0x00000164
-#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__MASK		0x00000007
-#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__MASK;
-}
-#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
-#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_10			0x00000168
-#define DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
-#define DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_11			0x0000016c
-#define DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK	0x000000ff
-#define DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT	0
-static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
-{
-	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
-}
-
-#define REG_DSI_28nm_8960_PHY_CTRL_0				0x00000170
-
-#define REG_DSI_28nm_8960_PHY_CTRL_1				0x00000174
-
-#define REG_DSI_28nm_8960_PHY_CTRL_2				0x00000178
-
-#define REG_DSI_28nm_8960_PHY_CTRL_3				0x0000017c
-
-#define REG_DSI_28nm_8960_PHY_STRENGTH_0			0x00000180
-
-#define REG_DSI_28nm_8960_PHY_STRENGTH_1			0x00000184
-
-#define REG_DSI_28nm_8960_PHY_STRENGTH_2			0x00000188
-
-#define REG_DSI_28nm_8960_PHY_BIST_CTRL_0			0x0000018c
-
-#define REG_DSI_28nm_8960_PHY_BIST_CTRL_1			0x00000190
-
-#define REG_DSI_28nm_8960_PHY_BIST_CTRL_2			0x00000194
-
-#define REG_DSI_28nm_8960_PHY_BIST_CTRL_3			0x00000198
-
-#define REG_DSI_28nm_8960_PHY_BIST_CTRL_4			0x0000019c
-
-#define REG_DSI_28nm_8960_PHY_LDO_CTRL				0x000001b0
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0		0x00000000
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1		0x00000004
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2		0x00000008
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3		0x0000000c
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4		0x00000010
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_5		0x00000014
-
-#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CAL_PWR_CFG	0x00000018
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER		0x00000028
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_0			0x0000002c
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_1			0x00000030
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_2			0x00000034
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_0			0x00000038
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_1			0x0000003c
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_2			0x00000040
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_3			0x00000044
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_4			0x00000048
-
-#define REG_DSI_28nm_8960_PHY_MISC_CAL_STATUS			0x00000050
-#define DSI_28nm_8960_PHY_MISC_CAL_STATUS_CAL_BUSY		0x00000010
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_0			0x00000000
-#define DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE			0x00000001
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_1			0x00000004
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_2			0x00000008
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_3			0x0000000c
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_4			0x00000010
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_5			0x00000014
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_6			0x00000018
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_7			0x0000001c
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_8			0x00000020
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_9			0x00000024
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_10			0x00000028
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_11			0x0000002c
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_12			0x00000030
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_13			0x00000034
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_14			0x00000038
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_15			0x0000003c
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_16			0x00000040
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_17			0x00000044
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_18			0x00000048
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_19			0x0000004c
-
-#define REG_DSI_28nm_8960_PHY_PLL_CTRL_20			0x00000050
-
-#define REG_DSI_28nm_8960_PHY_PLL_RDY				0x00000080
-#define DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY			0x00000001
-
-static inline uint32_t REG_DSI_28nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_3(uint32_t i0) { return 0x0000000c + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_4(uint32_t i0) { return 0x00000010 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000014 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_DEBUG_SEL(uint32_t i0) { return 0x00000018 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x0000001c + 0x40*i0; }
-
-static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000020 + 0x40*i0; }
-
-#define REG_DSI_28nm_PHY_LNCK_CFG_0				0x00000100
-
-#define REG_DSI_28nm_PHY_LNCK_CFG_1				0x00000104
-
-#define REG_DSI_28nm_PHY_LNCK_CFG_2				0x00000108
-
-#define REG_DSI_28nm_PHY_LNCK_CFG_3				0x0000010c
-
-#define REG_DSI_28nm_PHY_LNCK_CFG_4				0x00000110
-
-#define REG_DSI_28nm_PHY_LNCK_TEST_DATAPATH			0x00000114
-
-#define REG_DSI_28nm_PHY_LNCK_DEBUG_SEL				0x00000118
-
-#define REG_DSI_28nm_PHY_LNCK_TEST_STR0				0x0000011c
-
-#define REG_DSI_28nm_PHY_LNCK_TEST_STR1				0x00000120
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_0				0x00000140
-#define DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_1				0x00000144
-#define DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_2				0x00000148
-#define DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_3				0x0000014c
-#define DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8			0x00000001
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_4				0x00000150
-#define DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_5				0x00000154
-#define DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_6				0x00000158
-#define DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_7				0x0000015c
-#define DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_8				0x00000160
-#define DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_9				0x00000164
-#define DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__MASK			0x00000007
-#define DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT			0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__MASK;
-}
-#define DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
-#define DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_10				0x00000168
-#define DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
-#define DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__MASK;
-}
-
-#define REG_DSI_28nm_PHY_TIMING_CTRL_11				0x0000016c
-#define DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
-#define DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
-}
-
-#define REG_DSI_28nm_PHY_CTRL_0					0x00000170
-
-#define REG_DSI_28nm_PHY_CTRL_1					0x00000174
-
-#define REG_DSI_28nm_PHY_CTRL_2					0x00000178
-
-#define REG_DSI_28nm_PHY_CTRL_3					0x0000017c
-
-#define REG_DSI_28nm_PHY_CTRL_4					0x00000180
-
-#define REG_DSI_28nm_PHY_STRENGTH_0				0x00000184
-
-#define REG_DSI_28nm_PHY_STRENGTH_1				0x00000188
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_0				0x000001b4
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_1				0x000001b8
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_2				0x000001bc
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_3				0x000001c0
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_4				0x000001c4
-
-#define REG_DSI_28nm_PHY_BIST_CTRL_5				0x000001c8
-
-#define REG_DSI_28nm_PHY_GLBL_TEST_CTRL				0x000001d4
-#define DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000001
-
-#define REG_DSI_28nm_PHY_LDO_CNTRL				0x000001dc
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_0			0x00000000
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_1			0x00000004
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_2			0x00000008
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_3			0x0000000c
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_4			0x00000010
-
-#define REG_DSI_28nm_PHY_REGULATOR_CTRL_5			0x00000014
-
-#define REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG			0x00000018
-
-#define REG_DSI_28nm_PHY_PLL_REFCLK_CFG				0x00000000
-#define DSI_28nm_PHY_PLL_REFCLK_CFG_DBLR			0x00000001
-
-#define REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG			0x00000004
-
-#define REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG			0x00000008
-
-#define REG_DSI_28nm_PHY_PLL_VCOLPF_CFG				0x0000000c
-
-#define REG_DSI_28nm_PHY_PLL_VREG_CFG				0x00000010
-#define DSI_28nm_PHY_PLL_VREG_CFG_POSTDIV1_BYPASS_B		0x00000002
-
-#define REG_DSI_28nm_PHY_PLL_PWRGEN_CFG				0x00000014
-
-#define REG_DSI_28nm_PHY_PLL_DMUX_CFG				0x00000018
-
-#define REG_DSI_28nm_PHY_PLL_AMUX_CFG				0x0000001c
-
-#define REG_DSI_28nm_PHY_PLL_GLB_CFG				0x00000020
-#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B			0x00000001
-#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B		0x00000002
-#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B		0x00000004
-#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE			0x00000008
-
-#define REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG			0x00000024
-
-#define REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG			0x00000028
-
-#define REG_DSI_28nm_PHY_PLL_LPFR_CFG				0x0000002c
-
-#define REG_DSI_28nm_PHY_PLL_LPFC1_CFG				0x00000030
-
-#define REG_DSI_28nm_PHY_PLL_LPFC2_CFG				0x00000034
-
-#define REG_DSI_28nm_PHY_PLL_SDM_CFG0				0x00000038
-#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__MASK			0x0000003f
-#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__MASK;
-}
-#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP				0x00000040
-
-#define REG_DSI_28nm_PHY_PLL_SDM_CFG1				0x0000003c
-#define DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK		0x0000003f
-#define DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK;
-}
-#define DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__MASK		0x00000040
-#define DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__SHIFT		6
-static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__MASK;
-}
-
-#define REG_DSI_28nm_PHY_PLL_SDM_CFG2				0x00000040
-#define DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__MASK		0x000000ff
-#define DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__MASK;
-}
-
-#define REG_DSI_28nm_PHY_PLL_SDM_CFG3				0x00000044
-#define DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__MASK		0x000000ff
-#define DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__SHIFT		0
-static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(uint32_t val)
-{
-	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__MASK;
-}
-
-#define REG_DSI_28nm_PHY_PLL_SDM_CFG4				0x00000048
-
-#define REG_DSI_28nm_PHY_PLL_SSC_CFG0				0x0000004c
-
-#define REG_DSI_28nm_PHY_PLL_SSC_CFG1				0x00000050
-
-#define REG_DSI_28nm_PHY_PLL_SSC_CFG2				0x00000054
-
-#define REG_DSI_28nm_PHY_PLL_SSC_CFG3				0x00000058
-
-#define REG_DSI_28nm_PHY_PLL_LKDET_CFG0				0x0000005c
-
-#define REG_DSI_28nm_PHY_PLL_LKDET_CFG1				0x00000060
-
-#define REG_DSI_28nm_PHY_PLL_LKDET_CFG2				0x00000064
-
-#define REG_DSI_28nm_PHY_PLL_TEST_CFG				0x00000068
-#define DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET			0x00000001
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG0				0x0000006c
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG1				0x00000070
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG2				0x00000074
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG3				0x00000078
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG4				0x0000007c
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG5				0x00000080
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG6				0x00000084
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG7				0x00000088
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG8				0x0000008c
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG9				0x00000090
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG10				0x00000094
-
-#define REG_DSI_28nm_PHY_PLL_CAL_CFG11				0x00000098
-
-#define REG_DSI_28nm_PHY_PLL_EFUSE_CFG				0x0000009c
-
-#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS_SEL			0x000000a0
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_42				0x000000a4
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_43				0x000000a8
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_44				0x000000ac
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_45				0x000000b0
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_46				0x000000b4
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_47				0x000000b8
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_48				0x000000bc
-
-#define REG_DSI_28nm_PHY_PLL_STATUS				0x000000c0
-#define DSI_28nm_PHY_PLL_STATUS_PLL_RDY				0x00000001
-
-#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS0				0x000000c4
-
-#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS1				0x000000c8
-
-#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS2				0x000000cc
-
-#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS3				0x000000d0
-
-#define REG_DSI_28nm_PHY_PLL_CTRL_54				0x000000d4
-
-static inline uint32_t REG_DSI_20nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_3(uint32_t i0) { return 0x0000000c + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_4(uint32_t i0) { return 0x00000010 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000014 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_DEBUG_SEL(uint32_t i0) { return 0x00000018 + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x0000001c + 0x40*i0; }
-
-static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000020 + 0x40*i0; }
-
-#define REG_DSI_20nm_PHY_LNCK_CFG_0				0x00000100
-
-#define REG_DSI_20nm_PHY_LNCK_CFG_1				0x00000104
-
-#define REG_DSI_20nm_PHY_LNCK_CFG_2				0x00000108
-
-#define REG_DSI_20nm_PHY_LNCK_CFG_3				0x0000010c
-
-#define REG_DSI_20nm_PHY_LNCK_CFG_4				0x00000110
-
-#define REG_DSI_20nm_PHY_LNCK_TEST_DATAPATH			0x00000114
-
-#define REG_DSI_20nm_PHY_LNCK_DEBUG_SEL				0x00000118
-
-#define REG_DSI_20nm_PHY_LNCK_TEST_STR0				0x0000011c
-
-#define REG_DSI_20nm_PHY_LNCK_TEST_STR1				0x00000120
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_0				0x00000140
-#define DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_1				0x00000144
-#define DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_2				0x00000148
-#define DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_3				0x0000014c
-#define DSI_20nm_PHY_TIMING_CTRL_3_CLK_ZERO_8			0x00000001
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_4				0x00000150
-#define DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_5				0x00000154
-#define DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_6				0x00000158
-#define DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_7				0x0000015c
-#define DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_8				0x00000160
-#define DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_9				0x00000164
-#define DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__MASK			0x00000007
-#define DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT			0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__MASK;
-}
-#define DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
-#define DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_10				0x00000168
-#define DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
-#define DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__MASK;
-}
-
-#define REG_DSI_20nm_PHY_TIMING_CTRL_11				0x0000016c
-#define DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
-#define DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
-static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
-{
-	return ((val) << DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
-}
-
-#define REG_DSI_20nm_PHY_CTRL_0					0x00000170
-
-#define REG_DSI_20nm_PHY_CTRL_1					0x00000174
-
-#define REG_DSI_20nm_PHY_CTRL_2					0x00000178
-
-#define REG_DSI_20nm_PHY_CTRL_3					0x0000017c
-
-#define REG_DSI_20nm_PHY_CTRL_4					0x00000180
-
-#define REG_DSI_20nm_PHY_STRENGTH_0				0x00000184
-
-#define REG_DSI_20nm_PHY_STRENGTH_1				0x00000188
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_0				0x000001b4
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_1				0x000001b8
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_2				0x000001bc
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_3				0x000001c0
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_4				0x000001c4
-
-#define REG_DSI_20nm_PHY_BIST_CTRL_5				0x000001c8
-
-#define REG_DSI_20nm_PHY_GLBL_TEST_CTRL				0x000001d4
-#define DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000001
-
-#define REG_DSI_20nm_PHY_LDO_CNTRL				0x000001dc
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_0			0x00000000
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_1			0x00000004
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_2			0x00000008
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_3			0x0000000c
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_4			0x00000010
-
-#define REG_DSI_20nm_PHY_REGULATOR_CTRL_5			0x00000014
-
-#define REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG			0x00000018
-
-#define REG_DSI_14nm_PHY_CMN_REVISION_ID0			0x00000000
-
-#define REG_DSI_14nm_PHY_CMN_REVISION_ID1			0x00000004
-
-#define REG_DSI_14nm_PHY_CMN_REVISION_ID2			0x00000008
-
-#define REG_DSI_14nm_PHY_CMN_REVISION_ID3			0x0000000c
-
-#define REG_DSI_14nm_PHY_CMN_CLK_CFG0				0x00000010
-#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK		0x000000f0
-#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__SHIFT		4
-static inline uint32_t DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__SHIFT) & DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK;
-}
-#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK		0x000000f0
-#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT		4
-static inline uint32_t DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT) & DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK;
-}
-
-#define REG_DSI_14nm_PHY_CMN_CLK_CFG1				0x00000014
-#define DSI_14nm_PHY_CMN_CLK_CFG1_DSICLK_SEL			0x00000001
-
-#define REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL			0x00000018
-#define DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000004
-
-#define REG_DSI_14nm_PHY_CMN_CTRL_0				0x0000001c
-
-#define REG_DSI_14nm_PHY_CMN_CTRL_1				0x00000020
-
-#define REG_DSI_14nm_PHY_CMN_HW_TRIGGER				0x00000024
-
-#define REG_DSI_14nm_PHY_CMN_SW_CFG0				0x00000028
-
-#define REG_DSI_14nm_PHY_CMN_SW_CFG1				0x0000002c
-
-#define REG_DSI_14nm_PHY_CMN_SW_CFG2				0x00000030
-
-#define REG_DSI_14nm_PHY_CMN_HW_CFG0				0x00000034
-
-#define REG_DSI_14nm_PHY_CMN_HW_CFG1				0x00000038
-
-#define REG_DSI_14nm_PHY_CMN_HW_CFG2				0x0000003c
-
-#define REG_DSI_14nm_PHY_CMN_HW_CFG3				0x00000040
-
-#define REG_DSI_14nm_PHY_CMN_HW_CFG4				0x00000044
-
-#define REG_DSI_14nm_PHY_CMN_PLL_CNTRL				0x00000048
-#define DSI_14nm_PHY_CMN_PLL_CNTRL_PLL_START			0x00000001
-
-#define REG_DSI_14nm_PHY_CMN_LDO_CNTRL				0x0000004c
-#define DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__MASK		0x0000003f
-#define DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__SHIFT) & DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__MASK			0x000000c0
-#define DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__SHIFT			6
-static inline uint32_t DSI_14nm_PHY_LN_CFG0_PREPARE_DLY(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__SHIFT) & DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_CFG1_HALFBYTECLK_EN			0x00000001
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_CFG3(uint32_t i0) { return 0x0000000c + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000010 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TEST_STR(uint32_t i0) { return 0x00000014 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_4(uint32_t i0) { return 0x00000018 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_5(uint32_t i0) { return 0x0000001c + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_6(uint32_t i0) { return 0x00000020 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_7(uint32_t i0) { return 0x00000024 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_8(uint32_t i0) { return 0x00000028 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_9(uint32_t i0) { return 0x0000002c + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__MASK		0x00000007
-#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__MASK;
-}
-#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
-#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__SHIFT		4
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_10(uint32_t i0) { return 0x00000030 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__MASK		0x00000007
-#define DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_11(uint32_t i0) { return 0x00000034 + 0x80*i0; }
-#define DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
-#define DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
-static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
-{
-	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__MASK;
-}
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_0(uint32_t i0) { return 0x00000038 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_1(uint32_t i0) { return 0x0000003c + 0x80*i0; }
-
-static inline uint32_t REG_DSI_14nm_PHY_LN_VREG_CNTRL(uint32_t i0) { return 0x00000064 + 0x80*i0; }
-
-#define REG_DSI_14nm_PHY_PLL_IE_TRIM				0x00000000
-
-#define REG_DSI_14nm_PHY_PLL_IP_TRIM				0x00000004
-
-#define REG_DSI_14nm_PHY_PLL_IPTAT_TRIM				0x00000010
-
-#define REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN			0x0000001c
-
-#define REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET			0x00000028
-
-#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL			0x0000002c
-
-#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2			0x00000030
-
-#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL3			0x00000034
-
-#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL4			0x00000038
-
-#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5			0x0000003c
-
-#define REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1			0x00000040
-
-#define REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2			0x00000044
-
-#define REG_DSI_14nm_PHY_PLL_KVCO_COUNT1			0x00000048
-
-#define REG_DSI_14nm_PHY_PLL_KVCO_COUNT2			0x0000004c
-
-#define REG_DSI_14nm_PHY_PLL_VREF_CFG1				0x0000005c
-
-#define REG_DSI_14nm_PHY_PLL_KVCO_CODE				0x00000058
-
-#define REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1			0x0000006c
-
-#define REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2			0x00000070
-
-#define REG_DSI_14nm_PHY_PLL_VCO_COUNT1				0x00000074
-
-#define REG_DSI_14nm_PHY_PLL_VCO_COUNT2				0x00000078
-
-#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1			0x0000007c
-
-#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2			0x00000080
-
-#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3			0x00000084
-
-#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN			0x00000088
-
-#define REG_DSI_14nm_PHY_PLL_PLL_VCO_TUNE			0x0000008c
-
-#define REG_DSI_14nm_PHY_PLL_DEC_START				0x00000090
-
-#define REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER			0x00000094
-
-#define REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1			0x00000098
-
-#define REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2			0x0000009c
-
-#define REG_DSI_14nm_PHY_PLL_SSC_PER1				0x000000a0
-
-#define REG_DSI_14nm_PHY_PLL_SSC_PER2				0x000000a4
-
-#define REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1			0x000000a8
-
-#define REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2			0x000000ac
-
-#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1			0x000000b4
-
-#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2			0x000000b8
-
-#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3			0x000000bc
-
-#define REG_DSI_14nm_PHY_PLL_TXCLK_EN				0x000000c0
-
-#define REG_DSI_14nm_PHY_PLL_PLL_CRCTRL				0x000000c4
-
-#define REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS		0x000000cc
-
-#define REG_DSI_14nm_PHY_PLL_PLL_MISC1				0x000000e8
-
-#define REG_DSI_14nm_PHY_PLL_CP_SET_CUR				0x000000f0
-
-#define REG_DSI_14nm_PHY_PLL_PLL_ICPMSET			0x000000f4
-
-#define REG_DSI_14nm_PHY_PLL_PLL_ICPCSET			0x000000f8
-
-#define REG_DSI_14nm_PHY_PLL_PLL_ICP_SET			0x000000fc
-
-#define REG_DSI_14nm_PHY_PLL_PLL_LPF1				0x00000100
-
-#define REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV			0x00000104
-
-#define REG_DSI_14nm_PHY_PLL_PLL_BANDGAP			0x00000108
-
-#define REG_DSI_10nm_PHY_CMN_REVISION_ID0			0x00000000
-
-#define REG_DSI_10nm_PHY_CMN_REVISION_ID1			0x00000004
-
-#define REG_DSI_10nm_PHY_CMN_REVISION_ID2			0x00000008
-
-#define REG_DSI_10nm_PHY_CMN_REVISION_ID3			0x0000000c
-
-#define REG_DSI_10nm_PHY_CMN_CLK_CFG0				0x00000010
-
-#define REG_DSI_10nm_PHY_CMN_CLK_CFG1				0x00000014
-
-#define REG_DSI_10nm_PHY_CMN_GLBL_CTRL				0x00000018
-
-#define REG_DSI_10nm_PHY_CMN_RBUF_CTRL				0x0000001c
-
-#define REG_DSI_10nm_PHY_CMN_VREG_CTRL				0x00000020
-
-#define REG_DSI_10nm_PHY_CMN_CTRL_0				0x00000024
-
-#define REG_DSI_10nm_PHY_CMN_CTRL_1				0x00000028
-
-#define REG_DSI_10nm_PHY_CMN_CTRL_2				0x0000002c
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CFG0				0x00000030
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CFG1				0x00000034
-
-#define REG_DSI_10nm_PHY_CMN_PLL_CNTRL				0x00000038
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CTRL0				0x00000098
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CTRL1				0x0000009c
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CTRL2				0x000000a0
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CTRL3				0x000000a4
-
-#define REG_DSI_10nm_PHY_CMN_LANE_CTRL4				0x000000a8
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_0			0x000000ac
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_1			0x000000b0
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_2			0x000000b4
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_3			0x000000b8
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_4			0x000000bc
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_5			0x000000c0
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_6			0x000000c4
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_7			0x000000c8
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_8			0x000000cc
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_9			0x000000d0
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_10			0x000000d4
-
-#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_11			0x000000d8
-
-#define REG_DSI_10nm_PHY_CMN_PHY_STATUS				0x000000ec
-
-#define REG_DSI_10nm_PHY_CMN_LANE_STATUS0			0x000000f4
-
-#define REG_DSI_10nm_PHY_CMN_LANE_STATUS1			0x000000f8
-
-static inline uint32_t REG_DSI_10nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_CFG3(uint32_t i0) { return 0x0000000c + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000010 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_PIN_SWAP(uint32_t i0) { return 0x00000014 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_HSTX_STR_CTRL(uint32_t i0) { return 0x00000018 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(uint32_t i0) { return 0x0000001c + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(uint32_t i0) { return 0x00000020 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(uint32_t i0) { return 0x00000024 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_LPRX_CTRL(uint32_t i0) { return 0x00000028 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_10nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x0000002c + 0x80*i0; }
-
-#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE		0x00000000
-
-#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO		0x00000004
-
-#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE		0x00000010
-
-#define REG_DSI_10nm_PHY_PLL_DSM_DIVIDER			0x0000001c
-
-#define REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER			0x00000020
-
-#define REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES			0x00000024
-
-#define REG_DSI_10nm_PHY_PLL_CMODE				0x0000002c
-
-#define REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS		0x00000030
-
-#define REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE	0x00000054
-
-#define REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE		0x00000064
-
-#define REG_DSI_10nm_PHY_PLL_PFILT				0x0000007c
-
-#define REG_DSI_10nm_PHY_PLL_IFILT				0x00000080
-
-#define REG_DSI_10nm_PHY_PLL_OUTDIV				0x00000094
-
-#define REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE			0x000000a4
-
-#define REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE		0x000000a8
-
-#define REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO		0x000000b4
-
-#define REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1		0x000000cc
-
-#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1		0x000000d0
-
-#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1		0x000000d4
-
-#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1		0x000000d8
-
-#define REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1			0x0000010c
-
-#define REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1		0x00000110
-
-#define REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1			0x00000114
-
-#define REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1			0x00000118
-
-#define REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1		0x0000011c
-
-#define REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1		0x00000120
-
-#define REG_DSI_10nm_PHY_PLL_SSC_CONTROL			0x0000013c
-
-#define REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE			0x00000140
-
-#define REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1			0x00000144
-
-#define REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1		0x0000014c
-
-#define REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1		0x00000154
-
-#define REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1		0x0000015c
-
-#define REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1	0x00000164
-
-#define REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE			0x00000180
-
-#define REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY			0x00000184
-
-#define REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS			0x0000018c
-
-#define REG_DSI_10nm_PHY_PLL_COMMON_STATUS_ONE			0x000001a0
-
-#define REG_DSI_7nm_PHY_CMN_REVISION_ID0			0x00000000
-
-#define REG_DSI_7nm_PHY_CMN_REVISION_ID1			0x00000004
-
-#define REG_DSI_7nm_PHY_CMN_REVISION_ID2			0x00000008
-
-#define REG_DSI_7nm_PHY_CMN_REVISION_ID3			0x0000000c
-
-#define REG_DSI_7nm_PHY_CMN_CLK_CFG0				0x00000010
-
-#define REG_DSI_7nm_PHY_CMN_CLK_CFG1				0x00000014
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_CTRL				0x00000018
-
-#define REG_DSI_7nm_PHY_CMN_RBUF_CTRL				0x0000001c
-
-#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_0				0x00000020
-
-#define REG_DSI_7nm_PHY_CMN_CTRL_0				0x00000024
-
-#define REG_DSI_7nm_PHY_CMN_CTRL_1				0x00000028
-
-#define REG_DSI_7nm_PHY_CMN_CTRL_2				0x0000002c
-
-#define REG_DSI_7nm_PHY_CMN_CTRL_3				0x00000030
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CFG0				0x00000034
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CFG1				0x00000038
-
-#define REG_DSI_7nm_PHY_CMN_PLL_CNTRL				0x0000003c
-
-#define REG_DSI_7nm_PHY_CMN_DPHY_SOT				0x00000040
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CTRL0				0x000000a0
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CTRL1				0x000000a4
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CTRL2				0x000000a8
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CTRL3				0x000000ac
-
-#define REG_DSI_7nm_PHY_CMN_LANE_CTRL4				0x000000b0
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0			0x000000b4
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1			0x000000b8
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2			0x000000bc
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3			0x000000c0
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4			0x000000c4
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5			0x000000c8
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6			0x000000cc
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7			0x000000d0
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8			0x000000d4
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9			0x000000d8
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10			0x000000dc
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11			0x000000e0
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12			0x000000e4
-
-#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13			0x000000e8
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0		0x000000ec
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_1		0x000000f0
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL	0x000000f4
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL	0x000000f8
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_MID_CTRL	0x000000fc
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL			0x00000100
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0			0x00000104
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1			0x00000108
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL		0x0000010c
-
-#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_1				0x00000110
-
-#define REG_DSI_7nm_PHY_CMN_CTRL_4				0x00000114
-
-#define REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4			0x00000128
-
-#define REG_DSI_7nm_PHY_CMN_PHY_STATUS				0x00000140
-
-#define REG_DSI_7nm_PHY_CMN_LANE_STATUS0			0x00000148
-
-#define REG_DSI_7nm_PHY_CMN_LANE_STATUS1			0x0000014c
-
-static inline uint32_t REG_DSI_7nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x0000000c + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_PIN_SWAP(uint32_t i0) { return 0x00000010 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_LPRX_CTRL(uint32_t i0) { return 0x00000014 + 0x80*i0; }
-
-static inline uint32_t REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000018 + 0x80*i0; }
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_ONE			0x00000000
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO			0x00000004
-
-#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS			0x00000008
-
-#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS_TWO		0x0000000c
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE		0x00000010
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FOUR		0x00000014
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE		0x00000018
-
-#define REG_DSI_7nm_PHY_PLL_INT_LOOP_CONTROLS			0x0000001c
-
-#define REG_DSI_7nm_PHY_PLL_DSM_DIVIDER				0x00000020
-
-#define REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER			0x00000024
-
-#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES			0x00000028
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_UPDATE_CONTROL_OVERRIDES	0x0000002c
-
-#define REG_DSI_7nm_PHY_PLL_CMODE				0x00000030
-
-#define REG_DSI_7nm_PHY_PLL_PSM_CTRL				0x00000034
-
-#define REG_DSI_7nm_PHY_PLL_RSM_CTRL				0x00000038
-
-#define REG_DSI_7nm_PHY_PLL_VCO_TUNE_MAP			0x0000003c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_CNTRL				0x00000040
-
-#define REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS		0x00000044
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_LOW		0x00000048
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_HIGH		0x0000004c
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS		0x00000050
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MIN			0x00000054
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MAX			0x00000058
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_PFILT			0x0000005c
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_IFILT			0x00000060
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_TWO		0x00000064
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE		0x00000068
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_FOUR		0x0000006c
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_HIGH			0x00000070
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_LOW			0x00000074
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE		0x00000078
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_THRESH			0x0000007c
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_HIGH		0x00000080
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_LOW			0x00000084
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_HIGH		0x00000088
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_LOW			0x0000008c
-
-#define REG_DSI_7nm_PHY_PLL_PFILT				0x00000090
-
-#define REG_DSI_7nm_PHY_PLL_IFILT				0x00000094
-
-#define REG_DSI_7nm_PHY_PLL_PLL_GAIN				0x00000098
-
-#define REG_DSI_7nm_PHY_PLL_ICODE_LOW				0x0000009c
-
-#define REG_DSI_7nm_PHY_PLL_ICODE_HIGH				0x000000a0
-
-#define REG_DSI_7nm_PHY_PLL_LOCKDET				0x000000a4
-
-#define REG_DSI_7nm_PHY_PLL_OUTDIV				0x000000a8
-
-#define REG_DSI_7nm_PHY_PLL_FASTLOCK_CONTROL			0x000000ac
-
-#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_ONE		0x000000b0
-
-#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_TWO		0x000000b4
-
-#define REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE			0x000000b8
-
-#define REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE			0x000000bc
-
-#define REG_DSI_7nm_PHY_PLL_RATE_CHANGE				0x000000c0
-
-#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS			0x000000c4
-
-#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO		0x000000c8
-
-#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START			0x000000cc
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW			0x000000d0
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID			0x000000d4
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH			0x000000d8
-
-#define REG_DSI_7nm_PHY_PLL_DEC_FRAC_MUXES			0x000000dc
-
-#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1			0x000000e0
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1		0x000000e4
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1		0x000000e8
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1		0x000000ec
-
-#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_2			0x000000f0
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_2		0x000000f4
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_2		0x000000f8
-
-#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_2		0x000000fc
-
-#define REG_DSI_7nm_PHY_PLL_MASH_CONTROL			0x00000100
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW			0x00000104
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH			0x00000108
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW			0x0000010c
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH			0x00000110
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW			0x00000114
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH			0x00000118
-
-#define REG_DSI_7nm_PHY_PLL_SSC_MUX_CONTROL			0x0000011c
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1			0x00000120
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1			0x00000124
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1			0x00000128
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1			0x0000012c
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1			0x00000130
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1			0x00000134
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_2			0x00000138
-
-#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_2			0x0000013c
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_2			0x00000140
-
-#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_2			0x00000144
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_2			0x00000148
-
-#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_2			0x0000014c
-
-#define REG_DSI_7nm_PHY_PLL_SSC_CONTROL				0x00000150
-
-#define REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE			0x00000154
-
-#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1			0x00000158
-
-#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_2			0x0000015c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1		0x00000160
-
-#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_2		0x00000164
-
-#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1			0x00000168
-
-#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_2			0x0000016c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1		0x00000170
-
-#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_2		0x00000174
-
-#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1	0x00000178
-
-#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_2	0x0000017c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_FASTLOCK_EN_BAND		0x00000180
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MID		0x00000184
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_HIGH		0x00000188
-
-#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MUX		0x0000018c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE			0x00000190
-
-#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY			0x00000194
-
-#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_MIN_DELAY			0x00000198
-
-#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS			0x0000019c
-
-#define REG_DSI_7nm_PHY_PLL_SPARE_AND_JPC_OVERRIDES		0x000001a0
-
-#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_1			0x000001a4
-
-#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_2			0x000001a8
-
-#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_CTRL_1		0x000001ac
-
-#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE			0x000001b0
-
-#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_TWO			0x000001b4
-
-#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL			0x000001b8
-
-#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_LOW		0x000001bc
-
-#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_HIGH		0x000001c0
-
-#define REG_DSI_7nm_PHY_PLL_FD_OUT_LOW				0x000001c4
-
-#define REG_DSI_7nm_PHY_PLL_FD_OUT_HIGH				0x000001c8
-
-#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_STATUS_1		0x000001cc
-
-#define REG_DSI_7nm_PHY_PLL_PLL_MISC_CONFIG			0x000001d0
-
-#define REG_DSI_7nm_PHY_PLL_FLL_CONFIG				0x000001d4
-
-#define REG_DSI_7nm_PHY_PLL_FLL_FREQ_ACQ_TIME			0x000001d8
-
-#define REG_DSI_7nm_PHY_PLL_FLL_CODE0				0x000001dc
-
-#define REG_DSI_7nm_PHY_PLL_FLL_CODE1				0x000001e0
-
-#define REG_DSI_7nm_PHY_PLL_FLL_GAIN0				0x000001e4
-
-#define REG_DSI_7nm_PHY_PLL_FLL_GAIN1				0x000001e8
-
-#define REG_DSI_7nm_PHY_PLL_SW_RESET				0x000001ec
-
-#define REG_DSI_7nm_PHY_PLL_FAST_PWRUP				0x000001f0
-
-#define REG_DSI_7nm_PHY_PLL_LOCKTIME0				0x000001f4
-
-#define REG_DSI_7nm_PHY_PLL_LOCKTIME1				0x000001f8
-
-#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS_SEL			0x000001fc
-
-#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS0				0x00000200
-
-#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS1				0x00000204
-
-#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS2				0x00000208
-
-#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS3				0x0000020c
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_FLL_CONTROL_OVERRIDES	0x00000210
-
-#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG				0x00000214
-
-#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE0_STATUS		0x00000218
-
-#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE1_STATUS		0x0000021c
-
-#define REG_DSI_7nm_PHY_PLL_RESET_SM_STATUS			0x00000220
-
-#define REG_DSI_7nm_PHY_PLL_TDC_OFFSET				0x00000224
-
-#define REG_DSI_7nm_PHY_PLL_PS3_PWRDOWN_CONTROLS		0x00000228
-
-#define REG_DSI_7nm_PHY_PLL_PS4_PWRDOWN_CONTROLS		0x0000022c
-
-#define REG_DSI_7nm_PHY_PLL_PLL_RST_CONTROLS			0x00000230
-
-#define REG_DSI_7nm_PHY_PLL_GEAR_BAND_SELECT_CONTROLS		0x00000234
-
-#define REG_DSI_7nm_PHY_PLL_PSM_CLK_CONTROLS			0x00000238
-
-#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES_2			0x0000023c
-
-#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1			0x00000240
-
-#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_2			0x00000244
-
-#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1			0x00000248
-
-#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_2			0x0000024c
-
-#define REG_DSI_7nm_PHY_PLL_CMODE_1				0x00000250
-
-#define REG_DSI_7nm_PHY_PLL_CMODE_2				0x00000254
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1		0x00000258
-
-#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_2		0x0000025c
-
-#define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
-
 #endif /* DSI_XML */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index ade9b609c7d9..29eddb228222 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -29,6 +29,18 @@
 
 #define DSI_6G_REG_SHIFT	4
 
+/* Regulators for DSI devices */
+struct dsi_reg_entry {
+	char name[32];
+	int enable_load;
+	int disable_load;
+};
+
+struct dsi_reg_config {
+	int num;
+	struct dsi_reg_entry regs[DSI_DEV_REGULATOR_MAX];
+};
+
 struct msm_dsi_config {
 	u32 io_offset;
 	struct dsi_reg_config reg_cfg;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index de1c41dc5c15..f99fb0dd5621 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/phy/phy.h>
+
 #include "msm_kms.h"
 #include "dsi.h"
 
@@ -77,7 +79,7 @@ static int dsi_mgr_setup_components(int id)
 		if (ret)
 			return ret;
 
-		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
+		phy_set_mode_ext(msm_dsi->phy, PHY_MODE_MIPI_DPHY, MSM_DSI_PHY_STANDALONE);
 	} else if (!other_dsi) {
 		ret = 0;
 	} else {
@@ -100,10 +102,8 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		/* PLL0 is to drive both 2 DSI link clocks in Dual DSI mode. */
-		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
-					MSM_DSI_PHY_MASTER);
-		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
-					MSM_DSI_PHY_SLAVE);
+		phy_set_mode_ext(clk_master_dsi->phy, PHY_MODE_MIPI_DPHY, MSM_DSI_PHY_MASTER);
+		phy_set_mode_ext(clk_slave_dsi->phy, PHY_MODE_MIPI_DPHY, MSM_DSI_PHY_SLAVE);
 	}
 
 	return ret;
@@ -112,15 +112,19 @@ static int dsi_mgr_setup_components(int id)
 static int enable_phy(struct msm_dsi *msm_dsi,
 		      struct msm_dsi_phy_shared_timings *shared_timings)
 {
-	struct msm_dsi_phy_clk_request clk_req;
+	union phy_configure_opts opts;
 	int ret;
 	bool is_dual_dsi = IS_DUAL_DSI();
 
-	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
+	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &opts.qcom_dsi.clk_req, is_dual_dsi);
+
+	ret = phy_configure(msm_dsi->phy, &opts);
+	if (ret)
+		return ret;
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
+	memcpy(shared_timings, &opts.qcom_dsi.shared_timings, sizeof(*shared_timings));
 
-	return ret;
+	return phy_power_on(msm_dsi->phy);
 }
 
 static int
@@ -149,7 +153,7 @@ dsi_mgr_phy_enable(int id,
 			ret = enable_phy(sdsi,
 					 &shared_timings[DSI_CLOCK_SLAVE]);
 			if (ret) {
-				msm_dsi_phy_disable(mdsi->phy);
+				phy_power_off(mdsi->phy);
 				return ret;
 			}
 		}
@@ -178,11 +182,11 @@ static void dsi_mgr_phy_disable(int id)
 	msm_dsi->phy_enabled = false;
 	if (IS_DUAL_DSI() && mdsi && sdsi) {
 		if (!mdsi->phy_enabled && !sdsi->phy_enabled) {
-			msm_dsi_phy_disable(sdsi->phy);
-			msm_dsi_phy_disable(mdsi->phy);
+			phy_power_off(sdsi->phy);
+			phy_power_off(mdsi->phy);
 		}
 	} else {
-		msm_dsi_phy_disable(msm_dsi->phy);
+		phy_power_off(msm_dsi->phy);
 	}
 }
 
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 7f6fcb8ec5ba..80ba3f9b1dc4 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -18,6 +18,12 @@ config PHY_QCOM_APQ8064_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_DSI
+	tristate "Qualcomm DSI PHY driver"
+	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
+	depends on DRM_MSM
+	select GENERIC_PHY
+
 config PHY_QCOM_IPQ4019_USB
 	tristate "Qualcomm IPQ4019 USB PHY driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 47acbd7daa3a..d1452f0a4f80 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_ATH79_USB)		+= phy-ath79-usb.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
+obj-$(CONFIG_PHY_QCOM_DSI)		+= phy-qcom-dsi.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
@@ -12,3 +13,7 @@ obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
 obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)		+= phy-qcom-ipq806x-usb.o
+
+phy-qcom-dsi-objs := phy-qcom-dsi-core.o phy-qcom-dsi-10nm.o \
+	phy-qcom-dsi-14nm.o phy-qcom-dsi-20nm.o phy-qcom-dsi-28nm.o \
+	phy-qcom-dsi-28nm_8960.o phy-qcom-dsi-7nm.o
diff --git a/drivers/phy/qualcomm/dsi_phy_10nm.xml.h b/drivers/phy/qualcomm/dsi_phy_10nm.xml.h
new file mode 100644
index 000000000000..0c3f16b2372b
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_10nm.xml.h
@@ -0,0 +1,227 @@
+#ifndef DSI_PHY_10NM_XML
+#define DSI_PHY_10NM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+#define REG_DSI_10nm_PHY_CMN_REVISION_ID0			0x00000000
+
+#define REG_DSI_10nm_PHY_CMN_REVISION_ID1			0x00000004
+
+#define REG_DSI_10nm_PHY_CMN_REVISION_ID2			0x00000008
+
+#define REG_DSI_10nm_PHY_CMN_REVISION_ID3			0x0000000c
+
+#define REG_DSI_10nm_PHY_CMN_CLK_CFG0				0x00000010
+
+#define REG_DSI_10nm_PHY_CMN_CLK_CFG1				0x00000014
+
+#define REG_DSI_10nm_PHY_CMN_GLBL_CTRL				0x00000018
+
+#define REG_DSI_10nm_PHY_CMN_RBUF_CTRL				0x0000001c
+
+#define REG_DSI_10nm_PHY_CMN_VREG_CTRL				0x00000020
+
+#define REG_DSI_10nm_PHY_CMN_CTRL_0				0x00000024
+
+#define REG_DSI_10nm_PHY_CMN_CTRL_1				0x00000028
+
+#define REG_DSI_10nm_PHY_CMN_CTRL_2				0x0000002c
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CFG0				0x00000030
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CFG1				0x00000034
+
+#define REG_DSI_10nm_PHY_CMN_PLL_CNTRL				0x00000038
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CTRL0				0x00000098
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CTRL1				0x0000009c
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CTRL2				0x000000a0
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CTRL3				0x000000a4
+
+#define REG_DSI_10nm_PHY_CMN_LANE_CTRL4				0x000000a8
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_0			0x000000ac
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_1			0x000000b0
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_2			0x000000b4
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_3			0x000000b8
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_4			0x000000bc
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_5			0x000000c0
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_6			0x000000c4
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_7			0x000000c8
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_8			0x000000cc
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_9			0x000000d0
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_10			0x000000d4
+
+#define REG_DSI_10nm_PHY_CMN_TIMING_CTRL_11			0x000000d8
+
+#define REG_DSI_10nm_PHY_CMN_PHY_STATUS				0x000000ec
+
+#define REG_DSI_10nm_PHY_CMN_LANE_STATUS0			0x000000f4
+
+#define REG_DSI_10nm_PHY_CMN_LANE_STATUS1			0x000000f8
+
+static inline uint32_t REG_DSI_10nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_CFG3(uint32_t i0) { return 0x0000000c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000010 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_PIN_SWAP(uint32_t i0) { return 0x00000014 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_HSTX_STR_CTRL(uint32_t i0) { return 0x00000018 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(uint32_t i0) { return 0x0000001c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(uint32_t i0) { return 0x00000020 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(uint32_t i0) { return 0x00000024 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_LPRX_CTRL(uint32_t i0) { return 0x00000028 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_10nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x0000002c + 0x80*i0; }
+
+#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE		0x00000000
+
+#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO		0x00000004
+
+#define REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE		0x00000010
+
+#define REG_DSI_10nm_PHY_PLL_DSM_DIVIDER			0x0000001c
+
+#define REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER			0x00000020
+
+#define REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES			0x00000024
+
+#define REG_DSI_10nm_PHY_PLL_CMODE				0x0000002c
+
+#define REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS		0x00000030
+
+#define REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE	0x00000054
+
+#define REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE		0x00000064
+
+#define REG_DSI_10nm_PHY_PLL_PFILT				0x0000007c
+
+#define REG_DSI_10nm_PHY_PLL_IFILT				0x00000080
+
+#define REG_DSI_10nm_PHY_PLL_OUTDIV				0x00000094
+
+#define REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE			0x000000a4
+
+#define REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE		0x000000a8
+
+#define REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO		0x000000b4
+
+#define REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1		0x000000cc
+
+#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1		0x000000d0
+
+#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1		0x000000d4
+
+#define REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1		0x000000d8
+
+#define REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1			0x0000010c
+
+#define REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1		0x00000110
+
+#define REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1			0x00000114
+
+#define REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1			0x00000118
+
+#define REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1		0x0000011c
+
+#define REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1		0x00000120
+
+#define REG_DSI_10nm_PHY_PLL_SSC_CONTROL			0x0000013c
+
+#define REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE			0x00000140
+
+#define REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1			0x00000144
+
+#define REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1		0x0000014c
+
+#define REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1		0x00000154
+
+#define REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1		0x0000015c
+
+#define REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1	0x00000164
+
+#define REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE			0x00000180
+
+#define REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY			0x00000184
+
+#define REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS			0x0000018c
+
+#define REG_DSI_10nm_PHY_PLL_COMMON_STATUS_ONE			0x000001a0
+
+
+#endif /* DSI_PHY_10NM_XML */
diff --git a/drivers/phy/qualcomm/dsi_phy_14nm.xml.h b/drivers/phy/qualcomm/dsi_phy_14nm.xml.h
new file mode 100644
index 000000000000..02f66f795483
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_14nm.xml.h
@@ -0,0 +1,309 @@
+#ifndef DSI_PHY_14NM_XML
+#define DSI_PHY_14NM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+#define REG_DSI_14nm_PHY_CMN_REVISION_ID0			0x00000000
+
+#define REG_DSI_14nm_PHY_CMN_REVISION_ID1			0x00000004
+
+#define REG_DSI_14nm_PHY_CMN_REVISION_ID2			0x00000008
+
+#define REG_DSI_14nm_PHY_CMN_REVISION_ID3			0x0000000c
+
+#define REG_DSI_14nm_PHY_CMN_CLK_CFG0				0x00000010
+#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK		0x000000f0
+#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__SHIFT		4
+static inline uint32_t DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__SHIFT) & DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK;
+}
+#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK		0x000000f0
+#define DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT		4
+static inline uint32_t DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT) & DSI_14nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK;
+}
+
+#define REG_DSI_14nm_PHY_CMN_CLK_CFG1				0x00000014
+#define DSI_14nm_PHY_CMN_CLK_CFG1_DSICLK_SEL			0x00000001
+
+#define REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL			0x00000018
+#define DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000004
+
+#define REG_DSI_14nm_PHY_CMN_CTRL_0				0x0000001c
+
+#define REG_DSI_14nm_PHY_CMN_CTRL_1				0x00000020
+
+#define REG_DSI_14nm_PHY_CMN_HW_TRIGGER				0x00000024
+
+#define REG_DSI_14nm_PHY_CMN_SW_CFG0				0x00000028
+
+#define REG_DSI_14nm_PHY_CMN_SW_CFG1				0x0000002c
+
+#define REG_DSI_14nm_PHY_CMN_SW_CFG2				0x00000030
+
+#define REG_DSI_14nm_PHY_CMN_HW_CFG0				0x00000034
+
+#define REG_DSI_14nm_PHY_CMN_HW_CFG1				0x00000038
+
+#define REG_DSI_14nm_PHY_CMN_HW_CFG2				0x0000003c
+
+#define REG_DSI_14nm_PHY_CMN_HW_CFG3				0x00000040
+
+#define REG_DSI_14nm_PHY_CMN_HW_CFG4				0x00000044
+
+#define REG_DSI_14nm_PHY_CMN_PLL_CNTRL				0x00000048
+#define DSI_14nm_PHY_CMN_PLL_CNTRL_PLL_START			0x00000001
+
+#define REG_DSI_14nm_PHY_CMN_LDO_CNTRL				0x0000004c
+#define DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__MASK		0x0000003f
+#define DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__SHIFT) & DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__MASK			0x000000c0
+#define DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__SHIFT			6
+static inline uint32_t DSI_14nm_PHY_LN_CFG0_PREPARE_DLY(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__SHIFT) & DSI_14nm_PHY_LN_CFG0_PREPARE_DLY__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_CFG1_HALFBYTECLK_EN			0x00000001
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_CFG3(uint32_t i0) { return 0x0000000c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000010 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TEST_STR(uint32_t i0) { return 0x00000014 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_4(uint32_t i0) { return 0x00000018 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_5(uint32_t i0) { return 0x0000001c + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_6(uint32_t i0) { return 0x00000020 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_7(uint32_t i0) { return 0x00000024 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_8(uint32_t i0) { return 0x00000028 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_9(uint32_t i0) { return 0x0000002c + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__MASK		0x00000007
+#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO__MASK;
+}
+#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
+#define DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__SHIFT		4
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_10(uint32_t i0) { return 0x00000030 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__MASK		0x00000007
+#define DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_TIMING_CTRL_11(uint32_t i0) { return 0x00000034 + 0x80*i0; }
+#define DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
+#define DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
+static inline uint32_t DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
+{
+	return ((val) << DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD__MASK;
+}
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_0(uint32_t i0) { return 0x00000038 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_1(uint32_t i0) { return 0x0000003c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_14nm_PHY_LN_VREG_CNTRL(uint32_t i0) { return 0x00000064 + 0x80*i0; }
+
+#define REG_DSI_14nm_PHY_PLL_IE_TRIM				0x00000000
+
+#define REG_DSI_14nm_PHY_PLL_IP_TRIM				0x00000004
+
+#define REG_DSI_14nm_PHY_PLL_IPTAT_TRIM				0x00000010
+
+#define REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN			0x0000001c
+
+#define REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET			0x00000028
+
+#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL			0x0000002c
+
+#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2			0x00000030
+
+#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL3			0x00000034
+
+#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL4			0x00000038
+
+#define REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5			0x0000003c
+
+#define REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1			0x00000040
+
+#define REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2			0x00000044
+
+#define REG_DSI_14nm_PHY_PLL_KVCO_COUNT1			0x00000048
+
+#define REG_DSI_14nm_PHY_PLL_KVCO_COUNT2			0x0000004c
+
+#define REG_DSI_14nm_PHY_PLL_VREF_CFG1				0x0000005c
+
+#define REG_DSI_14nm_PHY_PLL_KVCO_CODE				0x00000058
+
+#define REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1			0x0000006c
+
+#define REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2			0x00000070
+
+#define REG_DSI_14nm_PHY_PLL_VCO_COUNT1				0x00000074
+
+#define REG_DSI_14nm_PHY_PLL_VCO_COUNT2				0x00000078
+
+#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1			0x0000007c
+
+#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2			0x00000080
+
+#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3			0x00000084
+
+#define REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN			0x00000088
+
+#define REG_DSI_14nm_PHY_PLL_PLL_VCO_TUNE			0x0000008c
+
+#define REG_DSI_14nm_PHY_PLL_DEC_START				0x00000090
+
+#define REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER			0x00000094
+
+#define REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1			0x00000098
+
+#define REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2			0x0000009c
+
+#define REG_DSI_14nm_PHY_PLL_SSC_PER1				0x000000a0
+
+#define REG_DSI_14nm_PHY_PLL_SSC_PER2				0x000000a4
+
+#define REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1			0x000000a8
+
+#define REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2			0x000000ac
+
+#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1			0x000000b4
+
+#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2			0x000000b8
+
+#define REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3			0x000000bc
+
+#define REG_DSI_14nm_PHY_PLL_TXCLK_EN				0x000000c0
+
+#define REG_DSI_14nm_PHY_PLL_PLL_CRCTRL				0x000000c4
+
+#define REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS		0x000000cc
+
+#define REG_DSI_14nm_PHY_PLL_PLL_MISC1				0x000000e8
+
+#define REG_DSI_14nm_PHY_PLL_CP_SET_CUR				0x000000f0
+
+#define REG_DSI_14nm_PHY_PLL_PLL_ICPMSET			0x000000f4
+
+#define REG_DSI_14nm_PHY_PLL_PLL_ICPCSET			0x000000f8
+
+#define REG_DSI_14nm_PHY_PLL_PLL_ICP_SET			0x000000fc
+
+#define REG_DSI_14nm_PHY_PLL_PLL_LPF1				0x00000100
+
+#define REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV			0x00000104
+
+#define REG_DSI_14nm_PHY_PLL_PLL_BANDGAP			0x00000108
+
+
+#endif /* DSI_PHY_14NM_XML */
diff --git a/drivers/phy/qualcomm/dsi_phy_20nm.xml.h b/drivers/phy/qualcomm/dsi_phy_20nm.xml.h
new file mode 100644
index 000000000000..8a0a97877df2
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_20nm.xml.h
@@ -0,0 +1,237 @@
+#ifndef DSI_PHY_20NM_XML
+#define DSI_PHY_20NM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+static inline uint32_t REG_DSI_20nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_3(uint32_t i0) { return 0x0000000c + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_CFG_4(uint32_t i0) { return 0x00000010 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000014 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_DEBUG_SEL(uint32_t i0) { return 0x00000018 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x0000001c + 0x40*i0; }
+
+static inline uint32_t REG_DSI_20nm_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000020 + 0x40*i0; }
+
+#define REG_DSI_20nm_PHY_LNCK_CFG_0				0x00000100
+
+#define REG_DSI_20nm_PHY_LNCK_CFG_1				0x00000104
+
+#define REG_DSI_20nm_PHY_LNCK_CFG_2				0x00000108
+
+#define REG_DSI_20nm_PHY_LNCK_CFG_3				0x0000010c
+
+#define REG_DSI_20nm_PHY_LNCK_CFG_4				0x00000110
+
+#define REG_DSI_20nm_PHY_LNCK_TEST_DATAPATH			0x00000114
+
+#define REG_DSI_20nm_PHY_LNCK_DEBUG_SEL				0x00000118
+
+#define REG_DSI_20nm_PHY_LNCK_TEST_STR0				0x0000011c
+
+#define REG_DSI_20nm_PHY_LNCK_TEST_STR1				0x00000120
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_0				0x00000140
+#define DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_1				0x00000144
+#define DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_2				0x00000148
+#define DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_3				0x0000014c
+#define DSI_20nm_PHY_TIMING_CTRL_3_CLK_ZERO_8			0x00000001
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_4				0x00000150
+#define DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_5				0x00000154
+#define DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_6				0x00000158
+#define DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_7				0x0000015c
+#define DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_8				0x00000160
+#define DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_9				0x00000164
+#define DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__MASK			0x00000007
+#define DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT			0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_9_TA_GO__MASK;
+}
+#define DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
+#define DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_10				0x00000168
+#define DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
+#define DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_10_TA_GET__MASK;
+}
+
+#define REG_DSI_20nm_PHY_TIMING_CTRL_11				0x0000016c
+#define DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
+#define DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
+static inline uint32_t DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
+{
+	return ((val) << DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
+}
+
+#define REG_DSI_20nm_PHY_CTRL_0					0x00000170
+
+#define REG_DSI_20nm_PHY_CTRL_1					0x00000174
+
+#define REG_DSI_20nm_PHY_CTRL_2					0x00000178
+
+#define REG_DSI_20nm_PHY_CTRL_3					0x0000017c
+
+#define REG_DSI_20nm_PHY_CTRL_4					0x00000180
+
+#define REG_DSI_20nm_PHY_STRENGTH_0				0x00000184
+
+#define REG_DSI_20nm_PHY_STRENGTH_1				0x00000188
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_0				0x000001b4
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_1				0x000001b8
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_2				0x000001bc
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_3				0x000001c0
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_4				0x000001c4
+
+#define REG_DSI_20nm_PHY_BIST_CTRL_5				0x000001c8
+
+#define REG_DSI_20nm_PHY_GLBL_TEST_CTRL				0x000001d4
+#define DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000001
+
+#define REG_DSI_20nm_PHY_LDO_CNTRL				0x000001dc
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_0			0x00000000
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_1			0x00000004
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_2			0x00000008
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_3			0x0000000c
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_4			0x00000010
+
+#define REG_DSI_20nm_PHY_REGULATOR_CTRL_5			0x00000014
+
+#define REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG			0x00000018
+
+
+#endif /* DSI_PHY_20NM_XML */
diff --git a/drivers/phy/qualcomm/dsi_phy_28nm.xml.h b/drivers/phy/qualcomm/dsi_phy_28nm.xml.h
new file mode 100644
index 000000000000..653f816c7317
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_28nm.xml.h
@@ -0,0 +1,384 @@
+#ifndef DSI_PHY_28NM_XML
+#define DSI_PHY_28NM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+static inline uint32_t REG_DSI_28nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_3(uint32_t i0) { return 0x0000000c + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_CFG_4(uint32_t i0) { return 0x00000010 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x00000014 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_DEBUG_SEL(uint32_t i0) { return 0x00000018 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x0000001c + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000020 + 0x40*i0; }
+
+#define REG_DSI_28nm_PHY_LNCK_CFG_0				0x00000100
+
+#define REG_DSI_28nm_PHY_LNCK_CFG_1				0x00000104
+
+#define REG_DSI_28nm_PHY_LNCK_CFG_2				0x00000108
+
+#define REG_DSI_28nm_PHY_LNCK_CFG_3				0x0000010c
+
+#define REG_DSI_28nm_PHY_LNCK_CFG_4				0x00000110
+
+#define REG_DSI_28nm_PHY_LNCK_TEST_DATAPATH			0x00000114
+
+#define REG_DSI_28nm_PHY_LNCK_DEBUG_SEL				0x00000118
+
+#define REG_DSI_28nm_PHY_LNCK_TEST_STR0				0x0000011c
+
+#define REG_DSI_28nm_PHY_LNCK_TEST_STR1				0x00000120
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_0				0x00000140
+#define DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_1				0x00000144
+#define DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_2				0x00000148
+#define DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_3				0x0000014c
+#define DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8			0x00000001
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_4				0x00000150
+#define DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_5				0x00000154
+#define DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_6				0x00000158
+#define DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_7				0x0000015c
+#define DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_8				0x00000160
+#define DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_9				0x00000164
+#define DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__MASK			0x00000007
+#define DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT			0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_9_TA_GO__MASK;
+}
+#define DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
+#define DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_10				0x00000168
+#define DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
+#define DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_10_TA_GET__MASK;
+}
+
+#define REG_DSI_28nm_PHY_TIMING_CTRL_11				0x0000016c
+#define DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK		0x000000ff
+#define DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
+}
+
+#define REG_DSI_28nm_PHY_CTRL_0					0x00000170
+
+#define REG_DSI_28nm_PHY_CTRL_1					0x00000174
+
+#define REG_DSI_28nm_PHY_CTRL_2					0x00000178
+
+#define REG_DSI_28nm_PHY_CTRL_3					0x0000017c
+
+#define REG_DSI_28nm_PHY_CTRL_4					0x00000180
+
+#define REG_DSI_28nm_PHY_STRENGTH_0				0x00000184
+
+#define REG_DSI_28nm_PHY_STRENGTH_1				0x00000188
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_0				0x000001b4
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_1				0x000001b8
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_2				0x000001bc
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_3				0x000001c0
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_4				0x000001c4
+
+#define REG_DSI_28nm_PHY_BIST_CTRL_5				0x000001c8
+
+#define REG_DSI_28nm_PHY_GLBL_TEST_CTRL				0x000001d4
+#define DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL		0x00000001
+
+#define REG_DSI_28nm_PHY_LDO_CNTRL				0x000001dc
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_0			0x00000000
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_1			0x00000004
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_2			0x00000008
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_3			0x0000000c
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_4			0x00000010
+
+#define REG_DSI_28nm_PHY_REGULATOR_CTRL_5			0x00000014
+
+#define REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG			0x00000018
+
+#define REG_DSI_28nm_PHY_PLL_REFCLK_CFG				0x00000000
+#define DSI_28nm_PHY_PLL_REFCLK_CFG_DBLR			0x00000001
+
+#define REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG			0x00000004
+
+#define REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG			0x00000008
+
+#define REG_DSI_28nm_PHY_PLL_VCOLPF_CFG				0x0000000c
+
+#define REG_DSI_28nm_PHY_PLL_VREG_CFG				0x00000010
+#define DSI_28nm_PHY_PLL_VREG_CFG_POSTDIV1_BYPASS_B		0x00000002
+
+#define REG_DSI_28nm_PHY_PLL_PWRGEN_CFG				0x00000014
+
+#define REG_DSI_28nm_PHY_PLL_DMUX_CFG				0x00000018
+
+#define REG_DSI_28nm_PHY_PLL_AMUX_CFG				0x0000001c
+
+#define REG_DSI_28nm_PHY_PLL_GLB_CFG				0x00000020
+#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B			0x00000001
+#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B		0x00000002
+#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B		0x00000004
+#define DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE			0x00000008
+
+#define REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG			0x00000024
+
+#define REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG			0x00000028
+
+#define REG_DSI_28nm_PHY_PLL_LPFR_CFG				0x0000002c
+
+#define REG_DSI_28nm_PHY_PLL_LPFC1_CFG				0x00000030
+
+#define REG_DSI_28nm_PHY_PLL_LPFC2_CFG				0x00000034
+
+#define REG_DSI_28nm_PHY_PLL_SDM_CFG0				0x00000038
+#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__MASK			0x0000003f
+#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV__MASK;
+}
+#define DSI_28nm_PHY_PLL_SDM_CFG0_BYP				0x00000040
+
+#define REG_DSI_28nm_PHY_PLL_SDM_CFG1				0x0000003c
+#define DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK		0x0000003f
+#define DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK;
+}
+#define DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__MASK		0x00000040
+#define DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__SHIFT		6
+static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG1_DITHER_EN__MASK;
+}
+
+#define REG_DSI_28nm_PHY_PLL_SDM_CFG2				0x00000040
+#define DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__MASK		0x000000ff
+#define DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0__MASK;
+}
+
+#define REG_DSI_28nm_PHY_PLL_SDM_CFG3				0x00000044
+#define DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__MASK		0x000000ff
+#define DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__SHIFT		0
+static inline uint32_t DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(uint32_t val)
+{
+	return ((val) << DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__SHIFT) & DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8__MASK;
+}
+
+#define REG_DSI_28nm_PHY_PLL_SDM_CFG4				0x00000048
+
+#define REG_DSI_28nm_PHY_PLL_SSC_CFG0				0x0000004c
+
+#define REG_DSI_28nm_PHY_PLL_SSC_CFG1				0x00000050
+
+#define REG_DSI_28nm_PHY_PLL_SSC_CFG2				0x00000054
+
+#define REG_DSI_28nm_PHY_PLL_SSC_CFG3				0x00000058
+
+#define REG_DSI_28nm_PHY_PLL_LKDET_CFG0				0x0000005c
+
+#define REG_DSI_28nm_PHY_PLL_LKDET_CFG1				0x00000060
+
+#define REG_DSI_28nm_PHY_PLL_LKDET_CFG2				0x00000064
+
+#define REG_DSI_28nm_PHY_PLL_TEST_CFG				0x00000068
+#define DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET			0x00000001
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG0				0x0000006c
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG1				0x00000070
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG2				0x00000074
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG3				0x00000078
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG4				0x0000007c
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG5				0x00000080
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG6				0x00000084
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG7				0x00000088
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG8				0x0000008c
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG9				0x00000090
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG10				0x00000094
+
+#define REG_DSI_28nm_PHY_PLL_CAL_CFG11				0x00000098
+
+#define REG_DSI_28nm_PHY_PLL_EFUSE_CFG				0x0000009c
+
+#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS_SEL			0x000000a0
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_42				0x000000a4
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_43				0x000000a8
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_44				0x000000ac
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_45				0x000000b0
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_46				0x000000b4
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_47				0x000000b8
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_48				0x000000bc
+
+#define REG_DSI_28nm_PHY_PLL_STATUS				0x000000c0
+#define DSI_28nm_PHY_PLL_STATUS_PLL_RDY				0x00000001
+
+#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS0				0x000000c4
+
+#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS1				0x000000c8
+
+#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS2				0x000000cc
+
+#define REG_DSI_28nm_PHY_PLL_DEBUG_BUS3				0x000000d0
+
+#define REG_DSI_28nm_PHY_PLL_CTRL_54				0x000000d4
+
+
+#endif /* DSI_PHY_28NM_XML */
diff --git a/drivers/phy/qualcomm/dsi_phy_28nm_8960.xml.h b/drivers/phy/qualcomm/dsi_phy_28nm_8960.xml.h
new file mode 100644
index 000000000000..a19ccea68348
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_28nm_8960.xml.h
@@ -0,0 +1,286 @@
+#ifndef DSI_PHY_28NM_8960_XML
+#define DSI_PHY_28NM_8960_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_0(uint32_t i0) { return 0x00000000 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_1(uint32_t i0) { return 0x00000004 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_CFG_2(uint32_t i0) { return 0x00000008 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x0000000c + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_STR_0(uint32_t i0) { return 0x00000014 + 0x40*i0; }
+
+static inline uint32_t REG_DSI_28nm_8960_PHY_LN_TEST_STR_1(uint32_t i0) { return 0x00000018 + 0x40*i0; }
+
+#define REG_DSI_28nm_8960_PHY_LNCK_CFG_0			0x00000100
+
+#define REG_DSI_28nm_8960_PHY_LNCK_CFG_1			0x00000104
+
+#define REG_DSI_28nm_8960_PHY_LNCK_CFG_2			0x00000108
+
+#define REG_DSI_28nm_8960_PHY_LNCK_TEST_DATAPATH		0x0000010c
+
+#define REG_DSI_28nm_8960_PHY_LNCK_TEST_STR0			0x00000114
+
+#define REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1			0x00000118
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_0			0x00000140
+#define DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_1			0x00000144
+#define DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT	0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_2			0x00000148
+#define DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK	0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT	0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_3			0x0000014c
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_4			0x00000150
+#define DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_5			0x00000154
+#define DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_6			0x00000158
+#define DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__MASK	0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT	0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_7			0x0000015c
+#define DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_8			0x00000160
+#define DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__MASK		0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_9			0x00000164
+#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__MASK		0x00000007
+#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO__MASK;
+}
+#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__MASK		0x00000070
+#define DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__SHIFT		4
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_10			0x00000168
+#define DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__MASK		0x00000007
+#define DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__SHIFT		0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_TIMING_CTRL_11			0x0000016c
+#define DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK	0x000000ff
+#define DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT	0
+static inline uint32_t DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(uint32_t val)
+{
+	return ((val) << DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__SHIFT) & DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD__MASK;
+}
+
+#define REG_DSI_28nm_8960_PHY_CTRL_0				0x00000170
+
+#define REG_DSI_28nm_8960_PHY_CTRL_1				0x00000174
+
+#define REG_DSI_28nm_8960_PHY_CTRL_2				0x00000178
+
+#define REG_DSI_28nm_8960_PHY_CTRL_3				0x0000017c
+
+#define REG_DSI_28nm_8960_PHY_STRENGTH_0			0x00000180
+
+#define REG_DSI_28nm_8960_PHY_STRENGTH_1			0x00000184
+
+#define REG_DSI_28nm_8960_PHY_STRENGTH_2			0x00000188
+
+#define REG_DSI_28nm_8960_PHY_BIST_CTRL_0			0x0000018c
+
+#define REG_DSI_28nm_8960_PHY_BIST_CTRL_1			0x00000190
+
+#define REG_DSI_28nm_8960_PHY_BIST_CTRL_2			0x00000194
+
+#define REG_DSI_28nm_8960_PHY_BIST_CTRL_3			0x00000198
+
+#define REG_DSI_28nm_8960_PHY_BIST_CTRL_4			0x0000019c
+
+#define REG_DSI_28nm_8960_PHY_LDO_CTRL				0x000001b0
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0		0x00000000
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1		0x00000004
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2		0x00000008
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3		0x0000000c
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4		0x00000010
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_5		0x00000014
+
+#define REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CAL_PWR_CFG	0x00000018
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER		0x00000028
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_0			0x0000002c
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_1			0x00000030
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_2			0x00000034
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_0			0x00000038
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_1			0x0000003c
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_2			0x00000040
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_3			0x00000044
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_4			0x00000048
+
+#define REG_DSI_28nm_8960_PHY_MISC_CAL_STATUS			0x00000050
+#define DSI_28nm_8960_PHY_MISC_CAL_STATUS_CAL_BUSY		0x00000010
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_0			0x00000000
+#define DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE			0x00000001
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_1			0x00000004
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_2			0x00000008
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_3			0x0000000c
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_4			0x00000010
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_5			0x00000014
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_6			0x00000018
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_7			0x0000001c
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_8			0x00000020
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_9			0x00000024
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_10			0x00000028
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_11			0x0000002c
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_12			0x00000030
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_13			0x00000034
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_14			0x00000038
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_15			0x0000003c
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_16			0x00000040
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_17			0x00000044
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_18			0x00000048
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_19			0x0000004c
+
+#define REG_DSI_28nm_8960_PHY_PLL_CTRL_20			0x00000050
+
+#define REG_DSI_28nm_8960_PHY_PLL_RDY				0x00000080
+#define DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY			0x00000001
+
+
+#endif /* DSI_PHY_28NM_8960_XML */
diff --git a/drivers/phy/qualcomm/dsi_phy_7nm.xml.h b/drivers/phy/qualcomm/dsi_phy_7nm.xml.h
new file mode 100644
index 000000000000..9e67fcf433bc
--- /dev/null
+++ b/drivers/phy/qualcomm/dsi_phy_7nm.xml.h
@@ -0,0 +1,481 @@
+#ifndef DSI_PHY_7NM_XML
+#define DSI_PHY_7NM_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- ./msm.xml                   (    945 bytes, from 2021-05-28 20:42:10)
+- ./freedreno_copyright.xml   (   1572 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp4.xml              (  20912 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp_common.xml        (   2849 bytes, from 2021-05-15 15:25:11)
+- ./mdp/mdp5.xml              (  37461 bytes, from 2021-05-15 15:25:11)
+- ./dsi/dsi.xml               (  15242 bytes, from 2021-05-28 21:16:13)
+- ./dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_7nm.xml       (  10953 bytes, from 2021-05-28 20:40:18)
+- ./dsi/dsi_phy_5nm.xml       (  10900 bytes, from 2021-05-28 20:40:18)
+- ./dsi/sfpb.xml              (    602 bytes, from 2021-05-15 15:25:11)
+- ./dsi/mmss_cc.xml           (   1686 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/qfprom.xml           (    600 bytes, from 2021-05-15 15:25:11)
+- ./hdmi/hdmi.xml             (  41874 bytes, from 2021-05-15 15:25:11)
+- ./edp/edp.xml               (  10416 bytes, from 2021-05-15 15:25:11)
+
+Copyright (C) 2013-2021 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID0			0x00000000
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID1			0x00000004
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID2			0x00000008
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID3			0x0000000c
+
+#define REG_DSI_7nm_PHY_CMN_CLK_CFG0				0x00000010
+
+#define REG_DSI_7nm_PHY_CMN_CLK_CFG1				0x00000014
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_CTRL				0x00000018
+
+#define REG_DSI_7nm_PHY_CMN_RBUF_CTRL				0x0000001c
+
+#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_0				0x00000020
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_0				0x00000024
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_1				0x00000028
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_2				0x0000002c
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_3				0x00000030
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CFG0				0x00000034
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CFG1				0x00000038
+
+#define REG_DSI_7nm_PHY_CMN_PLL_CNTRL				0x0000003c
+
+#define REG_DSI_7nm_PHY_CMN_DPHY_SOT				0x00000040
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL0				0x000000a0
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL1				0x000000a4
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL2				0x000000a8
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL3				0x000000ac
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL4				0x000000b0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0			0x000000b4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1			0x000000b8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2			0x000000bc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3			0x000000c0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4			0x000000c4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5			0x000000c8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6			0x000000cc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7			0x000000d0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8			0x000000d4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9			0x000000d8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10			0x000000dc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11			0x000000e0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12			0x000000e4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13			0x000000e8
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0		0x000000ec
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_1		0x000000f0
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL	0x000000f4
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL	0x000000f8
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_MID_CTRL	0x000000fc
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL			0x00000100
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0			0x00000104
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1			0x00000108
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL		0x0000010c
+
+#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_1				0x00000110
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_4				0x00000114
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4			0x00000128
+
+#define REG_DSI_7nm_PHY_CMN_PHY_STATUS				0x00000140
+
+#define REG_DSI_7nm_PHY_CMN_LANE_STATUS0			0x00000148
+
+#define REG_DSI_7nm_PHY_CMN_LANE_STATUS1			0x0000014c
+
+static inline uint32_t REG_DSI_7nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x0000000c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_PIN_SWAP(uint32_t i0) { return 0x00000010 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_LPRX_CTRL(uint32_t i0) { return 0x00000014 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000018 + 0x80*i0; }
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_ONE			0x00000000
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO			0x00000004
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS			0x00000008
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS_TWO		0x0000000c
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE		0x00000010
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FOUR		0x00000014
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE		0x00000018
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_CONTROLS			0x0000001c
+
+#define REG_DSI_7nm_PHY_PLL_DSM_DIVIDER				0x00000020
+
+#define REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER			0x00000024
+
+#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES			0x00000028
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_UPDATE_CONTROL_OVERRIDES	0x0000002c
+
+#define REG_DSI_7nm_PHY_PLL_CMODE				0x00000030
+
+#define REG_DSI_7nm_PHY_PLL_PSM_CTRL				0x00000034
+
+#define REG_DSI_7nm_PHY_PLL_RSM_CTRL				0x00000038
+
+#define REG_DSI_7nm_PHY_PLL_VCO_TUNE_MAP			0x0000003c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_CNTRL				0x00000040
+
+#define REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS		0x00000044
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_LOW		0x00000048
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_HIGH		0x0000004c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS		0x00000050
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MIN			0x00000054
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MAX			0x00000058
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_PFILT			0x0000005c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_IFILT			0x00000060
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_TWO		0x00000064
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE		0x00000068
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_FOUR		0x0000006c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_HIGH			0x00000070
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_LOW			0x00000074
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE		0x00000078
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_THRESH			0x0000007c
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_HIGH		0x00000080
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_LOW			0x00000084
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_HIGH		0x00000088
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_LOW			0x0000008c
+
+#define REG_DSI_7nm_PHY_PLL_PFILT				0x00000090
+
+#define REG_DSI_7nm_PHY_PLL_IFILT				0x00000094
+
+#define REG_DSI_7nm_PHY_PLL_PLL_GAIN				0x00000098
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_LOW				0x0000009c
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_HIGH				0x000000a0
+
+#define REG_DSI_7nm_PHY_PLL_LOCKDET				0x000000a4
+
+#define REG_DSI_7nm_PHY_PLL_OUTDIV				0x000000a8
+
+#define REG_DSI_7nm_PHY_PLL_FASTLOCK_CONTROL			0x000000ac
+
+#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_ONE		0x000000b0
+
+#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_TWO		0x000000b4
+
+#define REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE			0x000000b8
+
+#define REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE			0x000000bc
+
+#define REG_DSI_7nm_PHY_PLL_RATE_CHANGE				0x000000c0
+
+#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS			0x000000c4
+
+#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO		0x000000c8
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START			0x000000cc
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW			0x000000d0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID			0x000000d4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH			0x000000d8
+
+#define REG_DSI_7nm_PHY_PLL_DEC_FRAC_MUXES			0x000000dc
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1			0x000000e0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1		0x000000e4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1		0x000000e8
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1		0x000000ec
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_2			0x000000f0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_2		0x000000f4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_2		0x000000f8
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_2		0x000000fc
+
+#define REG_DSI_7nm_PHY_PLL_MASH_CONTROL			0x00000100
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW			0x00000104
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH			0x00000108
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW			0x0000010c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH			0x00000110
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW			0x00000114
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH			0x00000118
+
+#define REG_DSI_7nm_PHY_PLL_SSC_MUX_CONTROL			0x0000011c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1			0x00000120
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1			0x00000124
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1			0x00000128
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1			0x0000012c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1			0x00000130
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1			0x00000134
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_2			0x00000138
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_2			0x0000013c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_2			0x00000140
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_2			0x00000144
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_2			0x00000148
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_2			0x0000014c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_CONTROL				0x00000150
+
+#define REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE			0x00000154
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1			0x00000158
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_2			0x0000015c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1		0x00000160
+
+#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_2		0x00000164
+
+#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1			0x00000168
+
+#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_2			0x0000016c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1		0x00000170
+
+#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_2		0x00000174
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1	0x00000178
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_2	0x0000017c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FASTLOCK_EN_BAND		0x00000180
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MID		0x00000184
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_HIGH		0x00000188
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MUX		0x0000018c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE			0x00000190
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY			0x00000194
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_MIN_DELAY			0x00000198
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS			0x0000019c
+
+#define REG_DSI_7nm_PHY_PLL_SPARE_AND_JPC_OVERRIDES		0x000001a0
+
+#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_1			0x000001a4
+
+#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_2			0x000001a8
+
+#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_CTRL_1		0x000001ac
+
+#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE			0x000001b0
+
+#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_TWO			0x000001b4
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL			0x000001b8
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_LOW		0x000001bc
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_HIGH		0x000001c0
+
+#define REG_DSI_7nm_PHY_PLL_FD_OUT_LOW				0x000001c4
+
+#define REG_DSI_7nm_PHY_PLL_FD_OUT_HIGH				0x000001c8
+
+#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_STATUS_1		0x000001cc
+
+#define REG_DSI_7nm_PHY_PLL_PLL_MISC_CONFIG			0x000001d0
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CONFIG				0x000001d4
+
+#define REG_DSI_7nm_PHY_PLL_FLL_FREQ_ACQ_TIME			0x000001d8
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CODE0				0x000001dc
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CODE1				0x000001e0
+
+#define REG_DSI_7nm_PHY_PLL_FLL_GAIN0				0x000001e4
+
+#define REG_DSI_7nm_PHY_PLL_FLL_GAIN1				0x000001e8
+
+#define REG_DSI_7nm_PHY_PLL_SW_RESET				0x000001ec
+
+#define REG_DSI_7nm_PHY_PLL_FAST_PWRUP				0x000001f0
+
+#define REG_DSI_7nm_PHY_PLL_LOCKTIME0				0x000001f4
+
+#define REG_DSI_7nm_PHY_PLL_LOCKTIME1				0x000001f8
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS_SEL			0x000001fc
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS0				0x00000200
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS1				0x00000204
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS2				0x00000208
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS3				0x0000020c
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_FLL_CONTROL_OVERRIDES	0x00000210
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG				0x00000214
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE0_STATUS		0x00000218
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE1_STATUS		0x0000021c
+
+#define REG_DSI_7nm_PHY_PLL_RESET_SM_STATUS			0x00000220
+
+#define REG_DSI_7nm_PHY_PLL_TDC_OFFSET				0x00000224
+
+#define REG_DSI_7nm_PHY_PLL_PS3_PWRDOWN_CONTROLS		0x00000228
+
+#define REG_DSI_7nm_PHY_PLL_PS4_PWRDOWN_CONTROLS		0x0000022c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_RST_CONTROLS			0x00000230
+
+#define REG_DSI_7nm_PHY_PLL_GEAR_BAND_SELECT_CONTROLS		0x00000234
+
+#define REG_DSI_7nm_PHY_PLL_PSM_CLK_CONTROLS			0x00000238
+
+#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES_2			0x0000023c
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1			0x00000240
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_2			0x00000244
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1			0x00000248
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_2			0x0000024c
+
+#define REG_DSI_7nm_PHY_PLL_CMODE_1				0x00000250
+
+#define REG_DSI_7nm_PHY_PLL_CMODE_2				0x00000254
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1		0x00000258
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_2		0x0000025c
+
+#define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
+
+
+#endif /* DSI_PHY_7NM_XML */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/phy/qualcomm/phy-qcom-dsi-10nm.c
similarity index 97%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-10nm.c
index 229e98a496f7..db9eb2fba2df 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-10nm.c
@@ -7,8 +7,8 @@
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
 
-#include "dsi_phy.h"
-#include "dsi.xml.h"
+#include "phy-qcom-dsi.h"
+#include "dsi_phy_10nm.xml.h"
 
 /*
  * DSI PLL 10nm - clock diagram (eg: DSI0):
@@ -281,7 +281,7 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 				       delay_us,
 				       timeout_us);
 	if (rc)
-		DRM_DEV_ERROR(dev, "DSI PLL(%d) lock failed, status=0x%08x\n",
+		dev_err(dev, "DSI PLL(%d) lock failed, status=0x%08x\n",
 			      pll->phy->id, status);
 
 	return rc;
@@ -337,7 +337,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 	rc = dsi_pll_10nm_vco_set_rate(hw,pll_10nm->vco_current_rate, 0);
 	if (rc) {
-		DRM_DEV_ERROR(dev, "vco_set_rate failed, rc=%d\n", rc);
+		dev_err(dev, "vco_set_rate failed, rc=%d\n", rc);
 		return rc;
 	}
 
@@ -354,7 +354,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_10nm_lock_status(pll_10nm);
 	if (rc) {
-		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->phy->id);
+		dev_err(dev, "PLL(%d) lock failed\n", pll_10nm->phy->id);
 		goto error;
 	}
 
@@ -512,7 +512,7 @@ static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 			pll_10nm->vco_current_rate,
 			VCO_REF_CLK_RATE);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_10nm->phy->pdev->dev,
+		dev_err(&pll_10nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -700,7 +700,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
 	}
 
@@ -785,8 +785,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
-			       struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	int ret;
 	u32 status;
@@ -798,12 +797,6 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc_v3(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	if (dsi_phy_hw_v3_0_is_pll_on(phy))
 		pr_warn("PLL turned on before configuring PHY\n");
 
@@ -878,7 +871,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 
 	ret = dsi_10nm_set_usecase(phy);
 	if (ret) {
-		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
+		dev_err(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
 		return ret;
 	}
@@ -926,6 +919,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
@@ -947,6 +941,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/phy/qualcomm/phy-qcom-dsi-14nm.c
similarity index 98%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-14nm.c
index 65d68eb9e3cb..c85619d47772 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-14nm.c
@@ -7,8 +7,8 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
-#include "dsi_phy.h"
-#include "dsi.xml.h"
+#include "phy-qcom-dsi.h"
+#include "dsi_phy_14nm.xml.h"
 
 #define PHY_14NM_CKLN_IDX	4
 
@@ -547,7 +547,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 					 POLL_TIMEOUT_US);
 
 	if (unlikely(!locked)) {
-		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev, "DSI PLL lock failed\n");
+		dev_err(&pll_14nm->phy->pdev->dev, "DSI PLL lock failed\n");
 		return -EINVAL;
 	}
 
@@ -711,7 +711,7 @@ static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_14nm_vco_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev,
+		dev_err(&pll_14nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -892,7 +892,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
 	}
 
@@ -938,8 +938,7 @@ static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
 		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
 }
 
-static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
-			       struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	u32 data;
@@ -949,12 +948,6 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	void __iomem *lane_base = phy->lane_base;
 	u32 glbl_test_ctrl;
 
-	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	data = 0x1c;
 	if (phy->usecase != MSM_DSI_PHY_STANDALONE)
 		data |= DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(32);
@@ -1003,7 +996,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, glbl_test_ctrl);
 	ret = dsi_14nm_set_usecase(phy);
 	if (ret) {
-		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
+		dev_err(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
 		return ret;
 	}
@@ -1032,6 +1025,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
@@ -1053,6 +1047,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/phy/qualcomm/phy-qcom-dsi-20nm.c
similarity index 93%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-20nm.c
index e96d789aea18..22fc463942ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-20nm.c
@@ -3,8 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
-#include "dsi_phy.h"
-#include "dsi.xml.h"
+#include "phy-qcom-dsi.h"
+#include "dsi_phy_20nm.xml.h"
 
 static void dsi_20nm_dphy_set_timing(struct msm_dsi_phy *phy,
 		struct msm_dsi_dphy_timing *timing)
@@ -63,8 +63,7 @@ static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
 }
 
-static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
@@ -74,12 +73,6 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_20nm_phy_regulator_ctrl(phy, true);
 
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
@@ -138,6 +131,7 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_20nm_phy_enable,
 		.disable = dsi_20nm_phy_disable,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/phy/qualcomm/phy-qcom-dsi-28nm.c
similarity index 97%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-28nm.c
index 3304acda2165..8e3ad3e1b66d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-28nm.c
@@ -6,8 +6,8 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 
-#include "dsi_phy.h"
-#include "dsi.xml.h"
+#include "phy-qcom-dsi.h"
+#include "dsi_phy_28nm.xml.h"
 
 /*
  * DSI PLL 28nm - clock diagram (eg: DSI0):
@@ -37,6 +37,8 @@
 /* v2.0.0 28nm LP implementation */
 #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
 
+#define FIELD(val, name) (((val) & name ## __MASK) >> name ## __SHIFT)
+
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
 	unsigned long vco_rate;
@@ -123,7 +125,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 rem;
 	int i;
 
-	VERB("rate=%lu, parent's=%lu", rate, parent_rate);
+	DBG("rate=%lu, parent's=%lu", rate, parent_rate);
 
 	/* Force postdiv2 to be div-4 */
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG, 3);
@@ -133,7 +135,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		if (rate <= lpfr_lut[i].vco_rate)
 			break;
 	if (i == LPFR_LUT_SIZE) {
-		DRM_DEV_ERROR(dev, "unable to get loop filter resistance. vco=%lu\n",
+		dev_err(dev, "unable to get loop filter resistance. vco=%lu\n",
 				rate);
 		return -EINVAL;
 	}
@@ -245,7 +247,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	u32 ref_clk = VCO_REF_CLK_RATE;
 	unsigned long vco_rate;
 
-	VERB("parent_rate=%lu", parent_rate);
+	DBG("parent_rate=%lu", parent_rate);
 
 	/* Check to see if the ref clk doubler is enabled */
 	doubler = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG) &
@@ -350,7 +352,7 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 	}
 
 	if (unlikely(!locked))
-		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+		dev_err(dev, "DSI PLL lock failed\n");
 	else
 		DBG("DSI PLL Lock success");
 
@@ -415,7 +417,7 @@ static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
 	if (unlikely(!locked)) {
-		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+		dev_err(dev, "DSI PLL lock failed\n");
 		return -EINVAL;
 	}
 
@@ -501,7 +503,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
+		dev_err(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -609,7 +611,7 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
 	}
 
@@ -698,8 +700,7 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 		dsi_28nm_phy_regulator_enable_dcdc(phy);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
@@ -708,12 +709,6 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_phy_write(base + REG_DSI_28nm_PHY_STRENGTH_0, 0xff);
 
 	dsi_28nm_phy_regulator_ctrl(phy, true);
@@ -775,6 +770,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
@@ -796,6 +792,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
@@ -817,6 +814,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/phy/qualcomm/phy-qcom-dsi-28nm_8960.c
similarity index 97%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-28nm_8960.c
index 86e40a0d41a3..7ffec48fdf24 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-28nm_8960.c
@@ -6,8 +6,8 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
-#include "dsi_phy.h"
-#include "dsi.xml.h"
+#include "phy-qcom-dsi.h"
+#include "dsi_phy_28nm_8960.xml.h"
 
 /*
  * DSI PLL 28nm (8960/A family) - clock diagram (eg: DSI1):
@@ -146,7 +146,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	unsigned long vco_rate;
 	u32 status, fb_divider, temp, ref_divider;
 
-	VERB("parent_rate=%lu", parent_rate);
+	DBG("parent_rate=%lu", parent_rate);
 
 	status = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
 
@@ -210,7 +210,7 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
 	if (unlikely(!locked)) {
-		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+		dev_err(dev, "DSI PLL lock failed\n");
 		return -EINVAL;
 	}
 
@@ -365,7 +365,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
+		dev_err(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -471,7 +471,7 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
 	}
 
@@ -589,20 +589,13 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
-				struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	void __iomem *base = phy->base;
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	dsi_28nm_phy_regulator_init(phy);
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LDO_CTRL, 0x04);
@@ -654,6 +647,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_8960_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/phy/qualcomm/phy-qcom-dsi-7nm.c
similarity index 97%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-7nm.c
index 752a78c9dfcc..7422469b0d10 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-7nm.c
@@ -7,7 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
 
-#include "dsi_phy.h"
+#include "phy-qcom-dsi.h"
 #include "dsi.xml.h"
 
 /*
@@ -540,7 +540,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 			pll_7nm->vco_current_rate,
 			VCO_REF_CLK_RATE);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_7nm->phy->pdev->dev,
+		dev_err(&pll_7nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -728,7 +728,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		dev_err(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
 	}
 
@@ -798,8 +798,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
-			      struct msm_dsi_phy_clk_request *clk_req)
+static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy)
 {
 	int ret;
 	u32 status;
@@ -814,12 +813,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	DBG("");
 
-	if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
-		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
-		return -EINVAL;
-	}
-
 	if (dsi_phy_hw_v4_0_is_pll_on(phy))
 		pr_warn("PLL turned on before configuring PHY\n");
 
@@ -835,7 +828,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* TODO: CPHY enable path (this is for DPHY only) */
 
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
-	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
+	less_than_1500_mhz = (timing->bitclk_rate <= 1500000000);
 
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
@@ -896,7 +889,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	ret = dsi_7nm_set_usecase(phy);
 	if (ret) {
-		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
+		dev_err(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
 		return ret;
 	}
@@ -915,9 +908,9 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
-		      timing->shared_timings.clk_pre);
+		      timing->clk_pre);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
-		      timing->shared_timings.clk_post);
+		      timing->clk_post);
 
 	/* DSI lane settings */
 	dsi_phy_hw_v4_0_lane_settings(phy);
@@ -962,6 +955,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
@@ -984,6 +978,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		},
 	},
 	.ops = {
+		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/phy/qualcomm/phy-qcom-dsi-core.c
similarity index 78%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
rename to drivers/phy/qualcomm/phy-qcom-dsi-core.c
index 10ac875d89ac..76810df91c17 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/phy/qualcomm/phy-qcom-dsi-core.c
@@ -3,10 +3,15 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/dump_state.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
-#include "dsi_phy.h"
+#include "phy-qcom-dsi.h"
 
 #define S_DIV_ROUND_UP(n, d)	\
 	(((n) >= 0) ? (((n) + (d) - 1) / (d)) : (((n) - (d) + 1) / (d)))
@@ -47,6 +52,7 @@ static void dsi_dphy_timing_calc_clk_zero(struct msm_dsi_dphy_timing *timing,
 }
 
 int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
+			     struct msm_dsi_phy_shared_timings *shared_timings,
 			     struct msm_dsi_phy_clk_request *clk_req)
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
@@ -110,7 +116,7 @@ int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
 	temp = ((timing->hs_exit >> 1) + 1) * 2 * ui;
 	temp = 60 * coeff + 52 * ui - 24 * ui - temp;
 	tmin = S_DIV_ROUND_UP(temp, 8 * ui) - 1;
-	timing->shared_timings.clk_post = linear_inter(tmax, tmin, pcnt2, 0,
+	shared_timings->clk_post = linear_inter(tmax, tmin, pcnt2, 0,
 						       false);
 	tmax = 63;
 	temp = ((timing->clk_prepare >> 1) + 1) * 2 * ui;
@@ -119,12 +125,12 @@ int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
 	tmin = S_DIV_ROUND_UP(temp, 8 * ui) - 1;
 	if (tmin > tmax) {
 		temp = linear_inter(2 * tmax, tmin, pcnt2, 0, false);
-		timing->shared_timings.clk_pre = temp >> 1;
-		timing->shared_timings.clk_pre_inc_by_2 = true;
+		shared_timings->clk_pre = temp >> 1;
+		shared_timings->clk_pre_inc_by_2 = true;
 	} else {
-		timing->shared_timings.clk_pre =
+		shared_timings->clk_pre =
 				linear_inter(tmax, tmin, pcnt2, 0, false);
-		timing->shared_timings.clk_pre_inc_by_2 = false;
+		shared_timings->clk_pre_inc_by_2 = false;
 	}
 
 	timing->ta_go = 3;
@@ -132,8 +138,8 @@ int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
 	timing->ta_get = 4;
 
 	DBG("PHY timings: %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
-		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
-		timing->shared_timings.clk_pre_inc_by_2, timing->clk_zero,
+		shared_timings->clk_pre, shared_timings->clk_post,
+		shared_timings->clk_pre_inc_by_2, timing->clk_zero,
 		timing->clk_trail, timing->clk_prepare, timing->hs_exit,
 		timing->hs_zero, timing->hs_prepare, timing->hs_trail,
 		timing->hs_rqst);
@@ -142,6 +148,7 @@ int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
 }
 
 int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
+				struct msm_dsi_phy_shared_timings *shared_timings,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
@@ -222,7 +229,7 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 	temp = 60 * coeff + 52 * ui - 43 * ui;
 	tmin = DIV_ROUND_UP(temp, ui_x8) - 1;
 	tmax = 63;
-	timing->shared_timings.clk_post =
+	shared_timings->clk_post =
 				linear_inter(tmax, tmin, pcnt2, 0, false);
 
 	temp = 8 * ui + ((timing->clk_prepare << 3) + val_ckln) * ui;
@@ -233,12 +240,12 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 	tmax = 63;
 	if (tmin > tmax) {
 		temp = linear_inter(tmax << 1, tmin, pcnt2, 0, false);
-		timing->shared_timings.clk_pre = temp >> 1;
-		timing->shared_timings.clk_pre_inc_by_2 = 1;
+		shared_timings->clk_pre = temp >> 1;
+		shared_timings->clk_pre_inc_by_2 = 1;
 	} else {
-		timing->shared_timings.clk_pre =
+		shared_timings->clk_pre =
 				linear_inter(tmax, tmin, pcnt2, 0, false);
-		timing->shared_timings.clk_pre_inc_by_2 = 0;
+		shared_timings->clk_pre_inc_by_2 = 0;
 	}
 
 	timing->ta_go = 3;
@@ -246,8 +253,8 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 	timing->ta_get = 4;
 
 	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
-	    timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
-	    timing->shared_timings.clk_pre_inc_by_2, timing->clk_zero,
+	    shared_timings->clk_pre, shared_timings->clk_post,
+	    shared_timings->clk_pre_inc_by_2, timing->clk_zero,
 	    timing->clk_trail, timing->clk_prepare, timing->hs_exit,
 	    timing->hs_zero, timing->hs_prepare, timing->hs_trail,
 	    timing->hs_rqst, timing->hs_rqst_ckln, timing->hs_halfbyte_en,
@@ -258,7 +265,8 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 }
 
 int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
-	struct msm_dsi_phy_clk_request *clk_req)
+				struct msm_dsi_phy_shared_timings *shared_timings,
+				struct msm_dsi_phy_clk_request *clk_req)
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
 	const unsigned long esc_rate = clk_req->escclk_rate;
@@ -330,7 +338,7 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 	temp = 60 * coeff + 52 * ui - 43 * ui;
 	tmin = DIV_ROUND_UP(temp, ui_x8) - 1;
 	tmax = 63;
-	timing->shared_timings.clk_post =
+	shared_timings->clk_post =
 		linear_inter(tmax, tmin, pcnt2, 0, false);
 
 	temp = 8 * ui + (timing->clk_prepare << 3) * ui;
@@ -341,12 +349,12 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 	tmax = 63;
 	if (tmin > tmax) {
 		temp = linear_inter(tmax << 1, tmin, pcnt2, 0, false);
-		timing->shared_timings.clk_pre = temp >> 1;
-		timing->shared_timings.clk_pre_inc_by_2 = 1;
+		shared_timings->clk_pre = temp >> 1;
+		shared_timings->clk_pre_inc_by_2 = 1;
 	} else {
-		timing->shared_timings.clk_pre =
+		shared_timings->clk_pre =
 			linear_inter(tmax, tmin, pcnt2, 0, false);
-			timing->shared_timings.clk_pre_inc_by_2 = 0;
+			shared_timings->clk_pre_inc_by_2 = 0;
 	}
 
 	timing->ta_go = 3;
@@ -354,8 +362,8 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 	timing->ta_get = 4;
 
 	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
-		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
-		timing->shared_timings.clk_pre_inc_by_2, timing->clk_zero,
+		shared_timings->clk_pre, shared_timings->clk_post,
+		shared_timings->clk_pre_inc_by_2, timing->clk_zero,
 		timing->clk_trail, timing->clk_prepare, timing->hs_exit,
 		timing->hs_zero, timing->hs_prepare, timing->hs_trail,
 		timing->hs_rqst, timing->hs_rqst_ckln, timing->hs_halfbyte_en,
@@ -366,7 +374,8 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 }
 
 int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
-	struct msm_dsi_phy_clk_request *clk_req)
+				struct msm_dsi_phy_shared_timings *shared_timings,
+				struct msm_dsi_phy_clk_request *clk_req)
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
 	const unsigned long esc_rate = clk_req->escclk_rate;
@@ -441,7 +450,7 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	temp = 60 * coeff + 52 * ui + + (timing->hs_trail + 1) * ui_x8;
 	tmin = DIV_ROUND_UP(temp, 16 * ui) - 1;
 	tmax = 255;
-	timing->shared_timings.clk_post = linear_inter(tmax, tmin, 5, 0, false);
+	shared_timings->clk_post = linear_inter(tmax, tmin, 5, 0, false);
 
 	/* recommended min
 	 * val1 = (tlpx_ns + clk_prepare_ns + clk_zero_ns + hs_rqst_ns)
@@ -451,10 +460,14 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	temp = 52 * coeff + (timing->clk_prepare + timing->clk_zero + 1) * ui_x8 + 54 * coeff;
 	tmin = DIV_ROUND_UP(temp, 16 * ui) - 1;
 	tmax = 255;
-	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
+	shared_timings->clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
+
+	timing->bitclk_rate = bit_rate;
+	timing->clk_pre = shared_timings->clk_pre;
+	timing->clk_post = shared_timings->clk_post;
 
 	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
-		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
+		shared_timings->clk_pre, shared_timings->clk_post,
 		timing->clk_zero, timing->clk_trail, timing->clk_prepare, timing->hs_exit,
 		timing->hs_zero, timing->hs_prepare, timing->hs_trail, timing->hs_rqst);
 
@@ -475,7 +488,7 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 	ret = devm_regulator_bulk_get(dev, num, s);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER) {
-			DRM_DEV_ERROR(dev,
+			dev_err(dev,
 				      "%s: failed to init regulator, ret=%d\n",
 				      __func__, ret);
 		}
@@ -515,7 +528,7 @@ static int dsi_phy_regulator_enable(struct msm_dsi_phy *phy)
 			ret = regulator_set_load(s[i].consumer,
 							regs[i].enable_load);
 			if (ret < 0) {
-				DRM_DEV_ERROR(dev,
+				dev_err(dev,
 					"regulator %d set op mode failed, %d\n",
 					i, ret);
 				goto fail;
@@ -525,7 +538,7 @@ static int dsi_phy_regulator_enable(struct msm_dsi_phy *phy)
 
 	ret = regulator_bulk_enable(num, s);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "regulator enable failed, %d\n", ret);
+		dev_err(dev, "regulator enable failed, %d\n", ret);
 		goto fail;
 	}
 
@@ -546,7 +559,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 
 	ret = clk_prepare_enable(phy->ahb_clk);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
+		dev_err(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
 		pm_runtime_put_sync(dev);
 	}
 
@@ -582,43 +595,189 @@ static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
 	return 0;
 }
 
+static int msm_dsi_phy_configure(struct phy *generic_phy, union phy_configure_opts *opts)
+{
+	struct msm_dsi_phy *phy = phy_get_drvdata(generic_phy);
+
+	if (!phy->cfg->ops.dphy_timing_calc ||
+	    phy->cfg->ops.dphy_timing_calc(&phy->timing, &opts->qcom_dsi.shared_timings, &opts->qcom_dsi.clk_req)) {
+		dev_err(&phy->pdev->dev,
+			"%s: D-PHY timing calculation failed\n", __func__);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int msm_dsi_phy_enable(struct phy *generic_phy)
+{
+	struct msm_dsi_phy *phy = phy_get_drvdata(generic_phy);
+	struct device *dev = &phy->pdev->dev;
+	int ret;
+
+	if (!phy || !phy->cfg->ops.enable)
+		return -EINVAL;
+
+	ret = dsi_phy_enable_resource(phy);
+	if (ret) {
+		dev_err(dev, "%s: resource enable failed, %d\n",
+			__func__, ret);
+		goto res_en_fail;
+	}
+
+	ret = dsi_phy_regulator_enable(phy);
+	if (ret) {
+		dev_err(dev, "%s: regulator enable failed, %d\n",
+			__func__, ret);
+		goto reg_en_fail;
+	}
+
+	ret = phy->cfg->ops.enable(phy);
+	if (ret) {
+		dev_err(dev, "%s: phy enable failed, %d\n", __func__, ret);
+		goto phy_en_fail;
+	}
+
+	/*
+	 * Resetting DSI PHY silently changes its PLL registers to reset status,
+	 * which will confuse clock driver and result in wrong output rate of
+	 * link clocks. Restore PLL status if its PLL is being used as clock
+	 * source.
+	 */
+	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
+		ret = msm_dsi_phy_pll_restore_state(phy);
+		if (ret) {
+			dev_err(dev, "%s: failed to restore phy state, %d\n",
+				__func__, ret);
+			goto pll_restor_fail;
+		}
+	}
+
+	return 0;
+
+pll_restor_fail:
+	if (phy->cfg->ops.disable)
+		phy->cfg->ops.disable(phy);
+phy_en_fail:
+	dsi_phy_regulator_disable(phy);
+reg_en_fail:
+	dsi_phy_disable_resource(phy);
+res_en_fail:
+	return ret;
+}
+
+int msm_dsi_phy_disable(struct phy *generic_phy)
+{
+	struct msm_dsi_phy *phy = phy_get_drvdata(generic_phy);
+
+	/* Save PHY status if it is a clock source */
+	if (phy->usecase != MSM_DSI_PHY_SLAVE)
+		msm_dsi_phy_pll_save_state(phy);
+
+	if (!phy || !phy->cfg->ops.disable)
+		return 0;
+
+	phy->cfg->ops.disable(phy);
+
+	dsi_phy_regulator_disable(phy);
+	dsi_phy_disable_resource(phy);
+
+	return 0;
+}
+
+static int msm_dsi_phy_set_mode(struct phy *generic_phy, enum phy_mode mode, int submode)
+{
+	struct msm_dsi_phy *phy = phy_get_drvdata(generic_phy);
+
+	if (mode != PHY_MODE_MIPI_DPHY)
+		return -EINVAL;
+
+	if (submode != MSM_DSI_PHY_STANDALONE ||
+	    submode != MSM_DSI_PHY_MASTER ||
+	    submode != MSM_DSI_PHY_SLAVE)
+		return -EINVAL;
+
+	phy->usecase = submode;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_dsi_phy_ops = {
+	.set_mode = msm_dsi_phy_set_mode,
+	.configure = msm_dsi_phy_configure,
+	.power_on = msm_dsi_phy_enable,
+	.power_off = msm_dsi_phy_disable,
+
+	.owner = THIS_MODULE,
+};
+
+static void msm_dsi_phy_snapshot_block(struct dump_state *disp_state, u32 len,
+		void __iomem *base_addr, const char *fmt, int id)
+{
+	struct dump_state_block *new_blk;
+	int i;
+
+	new_blk = dump_state_allocate_block(base_addr, ALIGN(len, 4), GFP_KERNEL, fmt, id);
+	if (IS_ERR(new_blk))
+		return;
+
+	for (i = 0; i < len / 4; i++)
+		((u32 *)new_blk->state)[i] = readl_relaxed(base_addr + i * 4);
+
+	dump_state_add_block(disp_state, new_blk);
+}
+
+void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct phy *generic_phy)
+{
+	struct msm_dsi_phy *phy = phy_get_drvdata(generic_phy);
+
+	msm_dsi_phy_snapshot_block(disp_state,
+			phy->base_size, phy->base,
+			"dsi%d_phy", phy->id);
+
+	/* Do not try accessing PLL registers if it is switched off */
+	if (phy->pll_on)
+		msm_dsi_phy_snapshot_block(disp_state,
+			phy->pll_size, phy->pll_base,
+			"dsi%d_pll", phy->id);
+
+	if (phy->lane_base)
+		msm_dsi_phy_snapshot_block(disp_state,
+			phy->lane_size, phy->lane_base,
+			"dsi%d_lane", phy->id);
+
+	if (phy->reg_base)
+		msm_dsi_phy_snapshot_block(disp_state,
+			phy->reg_size, phy->reg_base,
+			"dsi%d_reg", phy->id);
+}
+
 static const struct of_device_id dsi_phy_dt_match[] = {
-#ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
 	  .data = &dsi_phy_28nm_hpm_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-hpm-fam-b",
 	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-lp",
 	  .data = &dsi_phy_28nm_lp_cfgs },
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
 	{ .compatible = "qcom,dsi-phy-20nm",
 	  .data = &dsi_phy_20nm_cfgs },
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_28NM_8960_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-8960",
 	  .data = &dsi_phy_28nm_8960_cfgs },
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
 	{ .compatible = "qcom,dsi-phy-14nm",
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
 	  .data = &dsi_phy_10nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-10nm-8998",
 	  .data = &dsi_phy_10nm_8998_cfgs },
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
 	{ .compatible = "qcom,dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
-#endif
-	{}
+	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
 
 /*
  * Currently, we only support one SoC for each PHY type. When we have multiple
@@ -644,10 +803,32 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
 	return -EINVAL;
 }
 
+static void __iomem *dsi_phy_remap(struct platform_device *pdev, const char *name, size_t *psize)
+{
+	struct resource *res;
+	void __iomem *ptr;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		return ERR_PTR(-EINVAL);
+	}
+
+	ptr = devm_ioremap_resource(&pdev->dev, res);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	if (psize)
+		*psize = resource_size(res);
+
+	return ptr;
+}
+
 static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
 	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
 	int ret;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
@@ -671,7 +852,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	phy->id = dsi_phy_get_id(phy);
 	if (phy->id < 0) {
 		ret = phy->id;
-		DRM_DEV_ERROR(dev, "%s: couldn't identify PHY index, %d\n",
+		dev_err(dev, "%s: couldn't identify PHY index, %d\n",
 			__func__, ret);
 		goto fail;
 	}
@@ -679,33 +860,33 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
 				"qcom,dsi-phy-regulator-ldo-mode");
 
-	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", &phy->base_size);
+	phy->base = dsi_phy_remap(pdev, "dsi_phy", &phy->base_size);
 	if (IS_ERR(phy->base)) {
-		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
+		dev_err(dev, "%s: failed to map phy base\n", __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", &phy->pll_size);
+	phy->pll_base = dsi_phy_remap(pdev, "dsi_pll", &phy->pll_size);
 	if (IS_ERR(phy->pll_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
+		dev_err(&pdev->dev, "%s: failed to map pll base\n", __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
 	if (phy->cfg->has_phy_lane) {
-		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane", "DSI_PHY_LANE", &phy->lane_size);
+		phy->lane_base = dsi_phy_remap(pdev, "dsi_phy_lane", &phy->lane_size);
 		if (IS_ERR(phy->lane_base)) {
-			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
+			dev_err(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
 			ret = -ENOMEM;
 			goto fail;
 		}
 	}
 
 	if (phy->cfg->has_phy_regulator) {
-		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator", "DSI_PHY_REG", &phy->reg_size);
+		phy->reg_base = dsi_phy_remap(pdev, "dsi_phy_regulator", &phy->reg_size);
 		if (IS_ERR(phy->reg_base)) {
-			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
+			dev_err(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
 			ret = -ENOMEM;
 			goto fail;
 		}
@@ -715,13 +896,21 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	phy->ahb_clk = msm_clk_get(pdev, "iface");
+	phy->ahb_clk = devm_clk_get(&pdev->dev, "iface");
 	if (IS_ERR(phy->ahb_clk)) {
-		DRM_DEV_ERROR(dev, "%s: Unable to get ahb clk\n", __func__);
+		dev_err(dev, "%s: Unable to get ahb clk\n", __func__);
 		ret = PTR_ERR(phy->ahb_clk);
 		goto fail;
 	}
 
+	generic_phy = devm_phy_create(dev, NULL, &qcom_dsi_phy_ops);
+	if (IS_ERR(generic_phy)) {
+		dev_err(dev, "%s: failed to create phy\n", __func__);
+		return PTR_ERR(generic_phy);
+	}
+
+	phy_set_drvdata(generic_phy, phy);
+
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */
@@ -732,7 +921,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (phy->cfg->ops.pll_init) {
 		ret = phy->cfg->ops.pll_init(phy);
 		if (ret) {
-			DRM_DEV_INFO(dev,
+			dev_info(dev,
 				"%s: pll init failed: %d, need separate pll clk driver\n",
 				__func__, ret);
 			goto fail;
@@ -742,7 +931,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		dev_err(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
 		goto fail;
 	}
 
@@ -764,7 +953,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 
 	dsi_phy_disable_resource(phy);
 
-	platform_set_drvdata(pdev, phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "%s: failed to register phy\n", __func__);
+		goto fail;
+	}
 
 	return 0;
 
@@ -780,117 +973,6 @@ static struct platform_driver dsi_phy_platform_driver = {
 	},
 };
 
-void __init msm_dsi_phy_driver_register(void)
-{
-	platform_driver_register(&dsi_phy_platform_driver);
-}
-
-void __exit msm_dsi_phy_driver_unregister(void)
-{
-	platform_driver_unregister(&dsi_phy_platform_driver);
-}
-
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
-			struct msm_dsi_phy_clk_request *clk_req,
-			struct msm_dsi_phy_shared_timings *shared_timings)
-{
-	struct device *dev = &phy->pdev->dev;
-	int ret;
-
-	if (!phy || !phy->cfg->ops.enable)
-		return -EINVAL;
-
-	ret = dsi_phy_enable_resource(phy);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
-			__func__, ret);
-		goto res_en_fail;
-	}
-
-	ret = dsi_phy_regulator_enable(phy);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: regulator enable failed, %d\n",
-			__func__, ret);
-		goto reg_en_fail;
-	}
-
-	ret = phy->cfg->ops.enable(phy, clk_req);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
-		goto phy_en_fail;
-	}
-
-	memcpy(shared_timings, &phy->timing.shared_timings,
-	       sizeof(*shared_timings));
-
-	/*
-	 * Resetting DSI PHY silently changes its PLL registers to reset status,
-	 * which will confuse clock driver and result in wrong output rate of
-	 * link clocks. Restore PLL status if its PLL is being used as clock
-	 * source.
-	 */
-	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
-		ret = msm_dsi_phy_pll_restore_state(phy);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "%s: failed to restore phy state, %d\n",
-				__func__, ret);
-			goto pll_restor_fail;
-		}
-	}
-
-	return 0;
-
-pll_restor_fail:
-	if (phy->cfg->ops.disable)
-		phy->cfg->ops.disable(phy);
-phy_en_fail:
-	dsi_phy_regulator_disable(phy);
-reg_en_fail:
-	dsi_phy_disable_resource(phy);
-res_en_fail:
-	return ret;
-}
-
-void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
-{
-	/* Save PHY status if it is a clock source */
-	if (phy->usecase != MSM_DSI_PHY_SLAVE)
-		msm_dsi_phy_pll_save_state(phy);
-
-	if (!phy || !phy->cfg->ops.disable)
-		return;
-
-	phy->cfg->ops.disable(phy);
-
-	dsi_phy_regulator_disable(phy);
-	dsi_phy_disable_resource(phy);
-}
-
-void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
-			     enum msm_dsi_phy_usecase uc)
-{
-	if (phy)
-		phy->usecase = uc;
-}
-void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct msm_dsi_phy *phy)
-{
-	msm_disp_snapshot_add_block(disp_state,
-			phy->base_size, phy->base,
-			"dsi%d_phy", phy->id);
-
-	/* Do not try accessing PLL registers if it is switched off */
-	if (phy->pll_on)
-		msm_disp_snapshot_add_block(disp_state,
-			phy->pll_size, phy->pll_base,
-			"dsi%d_pll", phy->id);
-
-	if (phy->lane_base)
-		msm_disp_snapshot_add_block(disp_state,
-			phy->lane_size, phy->lane_base,
-			"dsi%d_lane", phy->id);
-
-	if (phy->reg_base)
-		msm_disp_snapshot_add_block(disp_state,
-			phy->reg_size, phy->reg_base,
-			"dsi%d_reg", phy->id);
-}
+module_platform_driver(dsi_phy_platform_driver);
+MODULE_DESCRIPTION("Qualcomm DSI PHY Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/phy/qualcomm/phy-qcom-dsi.h
similarity index 69%
rename from drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
rename to drivers/phy/qualcomm/phy-qcom-dsi.h
index 5b0feef87127..e5a725db4d71 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/phy/qualcomm/phy-qcom-dsi.h
@@ -8,24 +8,48 @@
 
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
-#include "dsi.h"
+#include <linux/phy/phy-qcom-dsi.h>
 
-#define dsi_phy_read(offset) msm_readl((offset))
-#define dsi_phy_write(offset, data) msm_writel((data), (offset))
-#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
-#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
+struct msm_dsi_phy;
+
+#define dsi_phy_read(offset) readl((offset))
+#define dsi_phy_write(offset, data) writel((data), (offset))
+#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
+#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
+
+struct msm_dsi_dphy_timing;
 
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
-	int (*enable)(struct msm_dsi_phy *phy,
+	int (*dphy_timing_calc)(struct msm_dsi_dphy_timing *timing,
+			struct msm_dsi_phy_shared_timings *shared_timings,
 			struct msm_dsi_phy_clk_request *clk_req);
+	int (*enable)(struct msm_dsi_phy *phy);
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
 };
 
+struct dsi_reg_entry {
+	char name[32];
+	int enable_load;
+	int disable_load;
+};
+
+#define DSI_DEV_REGULATOR_MAX	8
+
+#define DSI_0	0
+#define DSI_1	1
+#define DSI_MAX	2
+
+struct dsi_reg_config {
+	int num;
+	struct dsi_reg_entry regs[DSI_DEV_REGULATOR_MAX];
+};
+
 struct msm_dsi_phy_cfg {
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
@@ -65,14 +89,17 @@ struct msm_dsi_dphy_timing {
 	u32 ta_sure;
 	u32 ta_get;
 
-	struct msm_dsi_phy_shared_timings shared_timings;
-
 	/* For PHY v2 only */
 	u32 hs_rqst_ckln;
 	u32 hs_prep_dly;
 	u32 hs_prep_dly_ckln;
 	u8 hs_halfbyte_en;
 	u8 hs_halfbyte_en_ckln;
+
+	/* For PHY v4 only */
+	unsigned long bitclk_rate;
+	u32 clk_post;
+	u32 clk_pre;
 };
 
 #define DSI_BYTE_PLL_CLK		0
@@ -85,10 +112,10 @@ struct msm_dsi_phy {
 	void __iomem *pll_base;
 	void __iomem *reg_base;
 	void __iomem *lane_base;
-	phys_addr_t base_size;
-	phys_addr_t pll_size;
-	phys_addr_t reg_size;
-	phys_addr_t lane_size;
+	size_t base_size;
+	size_t pll_size;
+	size_t reg_size;
+	size_t lane_size;
 	int id;
 
 	struct clk *ahb_clk;
@@ -112,12 +139,18 @@ struct msm_dsi_phy {
  * PHY internal functions
  */
 int msm_dsi_dphy_timing_calc(struct msm_dsi_dphy_timing *timing,
+			     struct msm_dsi_phy_shared_timings *shared_timings,
 			     struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
+				struct msm_dsi_phy_shared_timings *shared_timings,
 				struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
+				struct msm_dsi_phy_shared_timings *shared_timings,
 				struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
+				struct msm_dsi_phy_shared_timings *shared_timings,
 				struct msm_dsi_phy_clk_request *clk_req);
 
+#define DBG(fmt, ...) pr_debug(fmt"\n", ##__VA_ARGS__)
+
 #endif /* __DSI_PHY_H__ */
diff --git a/include/linux/phy/phy-qcom-dsi.h b/include/linux/phy/phy-qcom-dsi.h
new file mode 100644
index 000000000000..93cb16d61dc6
--- /dev/null
+++ b/include/linux/phy/phy-qcom-dsi.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, Linaro Ltd
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __PHY_QCOM_DSI_H__
+#define __PHY_QCOM_DSI_H__
+
+struct msm_dsi_phy_shared_timings {
+	u32 clk_post;
+	u32 clk_pre;
+	bool clk_pre_inc_by_2;
+};
+
+struct msm_dsi_phy_clk_request {
+	unsigned long bitclk_rate;
+	unsigned long escclk_rate;
+};
+
+struct phy_configure_opts_qcom_dsi {
+	/* in */
+	struct msm_dsi_phy_clk_request clk_req;
+	/* out */
+	struct msm_dsi_phy_shared_timings shared_timings;
+};
+
+enum msm_dsi_phy_usecase {
+	MSM_DSI_PHY_STANDALONE,
+	MSM_DSI_PHY_MASTER,
+	MSM_DSI_PHY_SLAVE,
+};
+
+struct dump_state;
+struct phy;
+void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct phy *phy);
+
+#endif
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 0ed434d02196..c44630268c09 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -18,6 +18,7 @@
 
 #include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-qcom-dsi.h>
 
 struct phy;
 
@@ -57,10 +58,12 @@ enum phy_media {
  *		the MIPI_DPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
+ * @qcom_dsi:   Configuration set applicable for Qualcomm DSI PHYs.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_qcom_dsi	qcom_dsi;
 };
 
 /**
-- 
2.30.2

