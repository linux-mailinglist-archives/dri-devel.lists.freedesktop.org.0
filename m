Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B459C7443AB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BC010E506;
	Fri, 30 Jun 2023 20:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A24A10E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:33 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so3693875e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158532; x=1690750532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zeu9jQeRF0qj8YRcXrjNoCVqqZfwfIovMhOa/sJAl4=;
 b=Ph3A+3Qqrfv7TfpPMfVrWYZtPeedF2FdpwWP9NVMLlSkTcHo+Bh2U87EvHYLwFN9bX
 Ah9jrHP2O/5D0I6VFIKup4i4ITaphP1eLWptiEvScWbzvGrYSE++HgljmzLg3GpwZhQe
 F19eAvcvQ6YegsyP3Ba97VSI1v4PuFIX9/soj7izilL+f+NB7/So4/Cg4CD+guwRtoXj
 8y4EiCg2HOhjOKRNPHkWeti7mZLLs1XbrJGl5bXJ7hHVWhRDB0dZl94WBDkwi+3uP4rh
 bH9myYt//ggb5Pj0pghBaQ/rllXsOgWV3OFWOLTh4b4eALqp3v8o/LMNJDXGErlTXzbk
 ovhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158532; x=1690750532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zeu9jQeRF0qj8YRcXrjNoCVqqZfwfIovMhOa/sJAl4=;
 b=LZw649BQL6NXEaPT2yxQ/EIeC6EAduKLEew4SeZad+LcVSGwkv8tKoYF/POIGU+oVv
 xg1AfCjYKYmi2jUHoWsX+ETlJPkElB7+aNn1Ox+I4Z6js90XQ0fSIJxeZB5PSco6h6Zb
 bi18d+5mohn9E7ckf5sI3WZ0v1bRMDMF57WA81HZXSyc8HEQrbPCjWj3IxQu2CTwLmPm
 sI0fyxgGJYGQpx7vzNke9rAaxrxLKsk8+ziEoSisYNIoY2SLxpsUNpKi4FdoaE0GS6qO
 KFCRkVBhYFR/opvALSBfWYKflfUs8e9fJm5yVEbQNn3VStXb2DKR1xeCRpnCPXzcsRTZ
 EA/A==
X-Gm-Message-State: ABy/qLa7sttdnIfnE9EV5bA5An6i4JZibej8wo0AigRaAeDGaoyjsmoL
 MpizWtfjqTuLdQnnip5LGTz5/Q==
X-Google-Smtp-Source: APBJJlFf0bucXXkSYLSpYR3Q/SNZ98DvBAmjsDvw0eo7WbStupM4EqOMUbqcTyPX7eNhaRoRLP3tMQ==
X-Received: by 2002:ac2:4f14:0:b0:4f8:442c:de25 with SMTP id
 k20-20020ac24f14000000b004f8442cde25mr3558794lfr.5.1688158531832; 
 Fri, 30 Jun 2023 13:55:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 10/15] drm/msm/hdmi: implement proper runtime PM handling
Date: Fri, 30 Jun 2023 23:55:18 +0300
Message-Id: <20230630205523.76823-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is completely not obvious, but the so-called 'hpd' clocks and
regulators are required for the HDMI host to function properly. Merge
pwr and hpd regulators. Use regulators, clocks and pinctrl to implement
proper runtime PM callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 62 +++++++++++++++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  7 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 -----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 42 +----------------
 4 files changed, 48 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 78226e6c6e90..9aba6a67816a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -7,6 +7,7 @@
 
 #include <linux/of_irq.h>
 #include <linux/of_gpio.h>
+#include <linux/pinctrl/consumer.h>
 
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
@@ -239,11 +240,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *hpd_reg_names_8960[] = {"core-vdda"};
+static const char *pwr_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(hpd_reg, 8960),
+		HDMI_CFG(pwr_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
@@ -444,20 +445,6 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->irq < 0)
 		return hdmi->irq;
 
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
-
 	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
 				      config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
@@ -537,6 +524,48 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int msm_hdmi_runtime_suspend(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
+
+	return 0;
+}
+
+static int msm_hdmi_runtime_resume(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+	int ret;
+
+	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto fail;
+
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
+
 static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
@@ -553,6 +582,7 @@ static struct platform_driver msm_hdmi_driver = {
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
+		.pm = &msm_hdmi_pm_ops,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 48052466f856..896f4b3d5978 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,7 +48,6 @@ struct hdmi {
 	void __iomem *qfprom_mmio;
 	phys_addr_t mmio_phy_addr;
 
-	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
@@ -86,11 +85,7 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	/* regulators that need to be on for hpd: */
-	const char **hpd_reg_names;
-	int hpd_reg_cnt;
-
-	/* regulators that need to be on for screen pwr: */
+	/* regulators that need to be on: */
 	const char **pwr_reg_names;
 	int pwr_reg_cnt;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4aa11eabbf2a..d6d57768f3dd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -24,15 +24,10 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
 	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
-	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
-
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
 		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
@@ -47,11 +42,8 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
-	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
@@ -61,10 +53,6 @@ static void power_off(struct drm_bridge *bridge)
 	if (hdmi->extp_clk)
 		clk_disable_unprepare(hdmi->extp_clk);
 
-	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
-
 	pm_runtime_put(&hdmi->pdev->dev);
 }
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7de538046a52..4167ba5a3b03 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -64,36 +64,17 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	uint32_t hpd_ctrl;
 	int ret;
 	unsigned long flags;
 
-	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
-		goto fail;
-	}
-
-	ret = pinctrl_pm_select_default_state(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "pinctrl state chg failed: %d\n", ret);
-		goto fail;
-	}
-
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
-		goto fail;
-	}
-
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
-		goto fail;
+		return ret;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -119,33 +100,19 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
 {
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
-	int ret;
 
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
-
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
-
-	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
 }
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
@@ -180,7 +147,6 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	uint32_t hpd_int_status = 0;
 	int ret;
 
@@ -188,14 +154,8 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	if (ret)
 		goto out;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
-	if (ret)
-		goto out;
-
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
-
 out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
-- 
2.39.2

