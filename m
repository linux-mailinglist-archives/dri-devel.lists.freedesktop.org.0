Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512C73D0A2
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9155910E1C2;
	Sun, 25 Jun 2023 11:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656A010E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b45b6adffbso32559931fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693355; x=1690285355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=932oaPt6ojnBPy1wAaag4ZZtb2XDeptEQhNEoOdPrqw=;
 b=H+ELCcN6A7C+cu4Gz+vqMW9K7rBpvzmK5ul5JS7ht9DpmHK7C+mto5e8wqo5kJtOiQ
 GeGIZyDWj+btrMC88k67C6AegNdOjLXRDjq9SEjRTXwR960n2R8Z5FIZuo40uwsza4AE
 3RqsMwuZTTgmmXwACUn0x7H0/UOYIz+y8wcGcecg4HGnwLvgGSeH7tcacEhMUoPxlkAb
 8+ax9O2qk2TMTaJwXq8O3W3wcV/qtQLcwOvTzzo7rejGmd4QFErJW2zE/bc4toiHHsGc
 QwrkaGE6Fhev1cBcL/RMA8wjwEmSri2u/b4pNu5dLvQJPguAxfEMGTUPONE2Uk9mv4hu
 Xxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693355; x=1690285355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=932oaPt6ojnBPy1wAaag4ZZtb2XDeptEQhNEoOdPrqw=;
 b=YUhjKPxnvtQtlGZL8NsPSTQIIrGI8flgaMCYz1YWWHxkMALGYZpJzzNpr8XTu57uZD
 MuxV8c1xLgZNCa/sssbi2O6P4/hx3hNLi7sCl94SqDubbV48moCsMfxvmY5sBFZxFu1U
 AEbt8nbYEvt6W2i7dce26GtAQxLKB5dzJPxb9E1boYPu8BJQ3gEsKvB69DYDH63xAba8
 nONU5UvjmVxh71t+w7hmcH+EMDff2pPkXWpbeAA9+8gkqu5faaooWhZysuM4FSudB5zG
 by37EZGOXMgIQ3iufxYQVA0XANEveRJXJbvI4kaTjXi7esIL6InGYCNcI+8mUvblGNq1
 JDRA==
X-Gm-Message-State: AC+VfDz6eO/lpCEvMlX2jNyhVtQSVaek+mIUP9H/qfE+JtzbpAv0Pnas
 TGAUNocUhfgyLvJTU53sVpwCQw==
X-Google-Smtp-Source: ACHHUZ66VO3vu75MCGaSX6TG8BtoxYP+CJ4ISP2ve/ajONihYsP2NhV3L51wwDQmpF1JegHTbD084Q==
X-Received: by 2002:a05:6512:554:b0:4f8:66db:8235 with SMTP id
 h20-20020a056512055400b004f866db8235mr12421534lfl.39.1687693355445; 
 Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 14/15] drm/msm/hdmi: switch to generic PHY subsystem
Date: Sun, 25 Jun 2023 14:42:21 +0300
Message-Id: <20230625114222.96689-15-dmitry.baryshkov@linaro.org>
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
index 8d02d8c33069..908c79702864 100644
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

