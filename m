Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302F70DC2B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5F10E448;
	Tue, 23 May 2023 12:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95110E43E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f380cd1019so8236505e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844109; x=1687436109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ViKI4t0SKXO4iiwXWVymsba+N4lBXVYHQrPxEsEaJls=;
 b=Hsl2Dv5K8URQJgGAlVolkrPOvDuRpqL62TFPVlDB53+F9WE9D/drEKfl2r+9GqNnGN
 ee1EtSbURM8gEiE/RN+3ewBCdGRj9ZA3Y1O1ksHKphi8etJTG7h25CFhqajrItm2oGsS
 XkMmgPfgEWB1tbPjUUdPQCHY42xnpuYymN1y3YgFLRCfsL55qiqoPmSw686bz+hSPsz1
 pWM4PB+EPqBtp4/bS5yEy+musakvDq3LFX7cItLOOVKYOzTBocKTu1meCTFUuArSsnXA
 +dF3Zs5Ug623PxyQ/w2ReDUSIFAHJE+QYV3gUjzrv6nYYBObTOVNspa09eUIz2Nqx/xV
 Ibog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844109; x=1687436109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ViKI4t0SKXO4iiwXWVymsba+N4lBXVYHQrPxEsEaJls=;
 b=FGDGRiIUm2Q9phNWd706LqBBNL7qTo6IH/LduIuTzXUL73hAK6xafWG4XM4c9tdeXe
 Lg23B+ocVbWTFnVbOjcb1o4vW+OMERWFHXxRjS7iGfi4zdsKO53zU+MPO73WkypCAJ64
 nmrX/L7X/v/Gfq+SirPdXSUzhoyDnBPuU35VeODFAfEUhouF+YFTT3XcRApJrvlMKB9D
 JgTXEo8H0AK3YAaH4b+Wm9Z8Oz0CEvNZr0jV/j9L+oUy2LuAVLSMTjNPCSwhe8JI5OlH
 Ju2G06/ZHXdumqybJQ+8m09blIGEaMac6PZV/Pyt6iy2jpEFa/nLHhKxWJJ8B30Zyk5b
 PG8w==
X-Gm-Message-State: AC+VfDz0e3i+6pX2M/ULypX06O/qOYiHS/hg3CTIBs5MHysnTK67TXYZ
 N5XiY4pZmHPGXJnLcBkWIW/LQg==
X-Google-Smtp-Source: ACHHUZ72bYMSRyQRFv584+HjvWOMYcMAfV250O04MsDehMJj5/+bBjE0hTMbWWYeWlTn2BUzHRDjDA==
X-Received: by 2002:ac2:4299:0:b0:4d8:75f8:6963 with SMTP id
 m25-20020ac24299000000b004d875f86963mr3607315lfh.38.1684844109428; 
 Tue, 23 May 2023 05:15:09 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 14/15] drm/msm/hdmi: switch to generic PHY subsystem
Date: Tue, 23 May 2023 15:14:53 +0300
Message-Id: <20230523121454.3460634-15-dmitry.baryshkov@linaro.org>
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

Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
drivers allows better code sharing with the rest of the PHY system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile           |  6 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 58 +++------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 72 +-------------------------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 58 +++++++++++++--------
 4 files changed, 45 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed..7be487002816 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -23,12 +23,6 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_bridge.o \
 	hdmi/hdmi_hpd.o \
 	hdmi/hdmi_i2c.o \
-	hdmi/hdmi_phy.o \
-	hdmi/hdmi_phy_8960.o \
-	hdmi/hdmi_phy_8996.o \
-	hdmi/hdmi_phy_8x60.o \
-	hdmi/hdmi_phy_8x74.o \
-	hdmi/hdmi_pll_8960.o \
 
 msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a2780aba6d3c..5c50ae57f107 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -7,6 +7,7 @@
 
 #include <linux/of_irq.h>
 #include <linux/of_gpio.h>
+#include <linux/phy/phy.h>
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
@@ -72,44 +73,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 		msm_hdmi_i2c_destroy(hdmi->i2c);
 }
 
-static void msm_hdmi_put_phy(struct hdmi *hdmi)
-{
-	if (hdmi->phy_dev) {
-		put_device(hdmi->phy_dev);
-		hdmi->phy = NULL;
-		hdmi->phy_dev = NULL;
-	}
-}
-
-static int msm_hdmi_get_phy(struct hdmi *hdmi)
-{
-	struct platform_device *pdev = hdmi->pdev;
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
-	of_node_put(phy_node);
-
-	if (!phy_pdev)
-		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
-
-	hdmi->phy = platform_get_drvdata(phy_pdev);
-	if (!hdmi->phy) {
-		put_device(&phy_pdev->dev);
-		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
-	}
-
-	hdmi->phy_dev = &phy_pdev->dev;
-
-	return 0;
-}
-
 /* construct hdmi at bind/probe time, grab all the resources.  If
  * we are to EPROBE_DEFER we want to do it here, rather than later
  * at modeset_init() time
@@ -510,37 +473,32 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	ret = msm_hdmi_get_phy(hdmi);
-	if (ret) {
+	hdmi->phy = devm_phy_get(&pdev->dev, NULL);
+	if (IS_ERR(hdmi->phy)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
-		return ret;
+		return PTR_ERR(hdmi->phy);
 	}
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
-		goto err_put_phy;
+		goto err;
 
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = component_add(&pdev->dev, &msm_hdmi_ops);
 	if (ret)
-		goto err_put_phy;
+		goto err;
 
 	return 0;
 
-err_put_phy:
-	msm_hdmi_put_phy(hdmi);
+err:
 	return ret;
 }
 
 static int msm_hdmi_dev_remove(struct platform_device *pdev)
 {
-	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
-
 	component_del(&pdev->dev, &msm_hdmi_ops);
 
-	msm_hdmi_put_phy(hdmi);
-
 	return 0;
 }
 
@@ -565,12 +523,10 @@ static struct platform_driver msm_hdmi_driver = {
 
 void __init msm_hdmi_register(void)
 {
-	msm_hdmi_phy_driver_register();
 	platform_driver_register(&msm_hdmi_driver);
 }
 
 void __exit msm_hdmi_unregister(void)
 {
 	platform_driver_unregister(&msm_hdmi_driver);
-	msm_hdmi_phy_driver_unregister();
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 46ae7ef9bc98..d68ac7aaf1f2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -19,7 +19,6 @@
 #include "msm_drv.h"
 #include "hdmi.xml.h"
 
-struct hdmi_phy;
 struct hdmi_platform_config;
 
 struct hdmi_audio {
@@ -56,8 +55,7 @@ struct hdmi {
 
 	struct gpio_desc *hpd_gpiod;
 
-	struct hdmi_phy *phy;
-	struct device *phy_dev;
+	struct phy *phy;
 
 	struct i2c_adapter *i2c;
 	struct drm_connector *connector;
@@ -125,74 +123,6 @@ static inline u32 hdmi_qfprom_read(struct hdmi *hdmi, u32 reg)
 	return msm_readl(hdmi->qfprom_mmio + reg);
 }
 
-/*
- * hdmi phy:
- */
-
-enum hdmi_phy_type {
-	MSM_HDMI_PHY_8x60,
-	MSM_HDMI_PHY_8960,
-	MSM_HDMI_PHY_8x74,
-	MSM_HDMI_PHY_8996,
-	MSM_HDMI_PHY_MAX,
-};
-
-struct hdmi_phy_cfg {
-	enum hdmi_phy_type type;
-	void (*powerup)(struct hdmi_phy *phy, unsigned long int pixclock);
-	void (*powerdown)(struct hdmi_phy *phy);
-	const char * const *reg_names;
-	int num_regs;
-	const char * const *clk_names;
-	int num_clks;
-};
-
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
-extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
-
-struct hdmi_phy {
-	struct platform_device *pdev;
-	void __iomem *mmio;
-	struct hdmi_phy_cfg *cfg;
-	const struct hdmi_phy_funcs *funcs;
-	struct regulator_bulk_data *regs;
-	struct clk **clks;
-};
-
-static inline void hdmi_phy_write(struct hdmi_phy *phy, u32 reg, u32 data)
-{
-	msm_writel(data, phy->mmio + reg);
-}
-
-static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
-{
-	return msm_readl(phy->mmio + reg);
-}
-
-int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
-void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy);
-void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long int pixclock);
-void msm_hdmi_phy_powerdown(struct hdmi_phy *phy);
-void __init msm_hdmi_phy_driver_register(void);
-void __exit msm_hdmi_phy_driver_unregister(void);
-
-#ifdef CONFIG_COMMON_CLK
-int msm_hdmi_pll_8960_init(struct platform_device *pdev);
-int msm_hdmi_pll_8996_init(struct platform_device *pdev);
-#else
-static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-
-static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-#endif
-
 /*
  * audio:
  */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1bbd76e595af..42aaaebbce00 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 
@@ -32,17 +33,6 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
-
-	if (hdmi->extp_clk) {
-		DBG("pixclock: %lu", hdmi->pixclock);
-		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
-		if (ret)
-			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
-
-		ret = clk_prepare_enable(hdmi->extp_clk);
-		if (ret)
-			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
-	}
 }
 
 static void power_off(struct drm_bridge *bridge)
@@ -58,9 +48,6 @@ static void power_off(struct drm_bridge *bridge)
 	 */
 	mdelay(16 + 4);
 
-	if (hdmi->extp_clk)
-		clk_disable_unprepare(hdmi->extp_clk);
-
 	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
@@ -131,14 +118,21 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_connector *connector;
+	union phy_configure_opts phy_opts;
+	int ret;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
 	if (!hdmi->power_on) {
-		msm_hdmi_phy_resource_enable(phy);
+		phy_init(hdmi->phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
@@ -149,9 +143,27 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	if (hdmi->phy_power_on)
-		msm_hdmi_phy_powerdown(phy);
+		phy_power_off(hdmi->phy);
+
+	phy_opts.hdmi.pixel_clk_rate = hdmi->pixclock / 1000;
+	phy_opts.hdmi.bpc = connector->display_info.bpc;
+	phy_opts.hdmi.color_space = HDMI_PHY_COLORSPACE_RGB;
+	phy_configure(hdmi->phy, &phy_opts);
+
+	ret = phy_power_on(hdmi->phy);
+	if (WARN_ON(ret))
+		return;
+
+	if (hdmi->extp_clk) {
+		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+		if (ret)
+			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
+
+		ret = clk_prepare_enable(hdmi->extp_clk);
+		if (ret)
+			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
+	}
 
-	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
 	hdmi->phy_power_on = true;
 
 	msm_hdmi_set_mode(hdmi, true);
@@ -165,7 +177,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	struct hdmi_phy *phy = hdmi->phy;
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
@@ -173,7 +184,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	DBG("power down");
 	msm_hdmi_set_mode(hdmi, false);
 
-	msm_hdmi_phy_powerdown(phy);
+	if (hdmi->phy_power_on) {
+		if (hdmi->extp_clk)
+			clk_disable_unprepare(hdmi->extp_clk);
+
+		phy_power_off(hdmi->phy);
+	}
 	hdmi->phy_power_on = false;
 
 	if (hdmi->power_on) {
@@ -181,7 +197,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		hdmi->power_on = false;
 		if (hdmi->hdmi_mode)
 			msm_hdmi_audio_update(hdmi);
-		msm_hdmi_phy_resource_disable(phy);
+		phy_exit(hdmi->phy);
 	}
 }
 
-- 
2.39.2

