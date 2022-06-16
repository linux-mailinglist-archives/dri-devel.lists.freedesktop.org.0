Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97BD54DC5D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578E112097;
	Thu, 16 Jun 2022 07:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8983B10FBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:59:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s6so980879lfo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgOSkrPIYoBDMzG4cyHJtHcGXpejPm8w4QHyK13FbtQ=;
 b=WPe6RPswOW14YrtL1U3vVnSC+zHIG5r+J2UR1qowO27HCJdwWuhq4DjhBI11yRst1M
 yDQBlTo/ZLny38L0WWCdLoLux9+AKAoPxyLMWIzssfPQA3ALGiEkXfiTFdcki0F+M70u
 /CqYq408bf7LO96hnv9/S5HrwnVEwvFWjp2W4WkcnNfzkI/CogW6hKKjBjdKc+5NygZ+
 MTtTfC6ODGjuygVLz/V4n1ik1VYk8hoNwIytNQO7qJW2An4WWYcTI0e77Sus2aT0uByd
 YG3XDxxj3gBCjE6yhn8gPK8fPa21uwkq3t9/6Ivt8TDxgfxCID0p9vQhE39/vjv1VTby
 Jd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgOSkrPIYoBDMzG4cyHJtHcGXpejPm8w4QHyK13FbtQ=;
 b=2BYqQ2eMFfwEhHfLWuOI/mziRstvbTNk7RKhED+vTaQAoZejqzzCp83ceW1vvRZcdc
 WoPyJPgLlQUqU5XZaXqVQ6Vy6FSeaqGg57bZFotrwFGXUskanrlkqo2pWd10RSsXh48F
 f4U4HUe+bs9cnh8sPRpzITI442D/U+dloV2s2sJs/QXJKoXxEIhfxbhtwwo2OxENXnCr
 Ced2I/Yu4WJ5oiDNSy8Gix/XhqBEDF8A+4au8TvU3+lbw9Py7nXUNk2xqy8VqCFBz+rD
 uN8A6KgamGsqrQUDQ9jUm2T3q6y6v9B/GO39vvb32eyFODqOhLE6ZLC4XliEKF+u2Qzg
 scNA==
X-Gm-Message-State: AJIora92gk0ynZ8jG/yQ0TJ/fmmAwkyoxWdNiTWEHXUg/ZLmPlVLNUGk
 obdMgUPd3OEuP2Sm5crG48UeFw==
X-Google-Smtp-Source: AGRyM1sZE1SfufdgKsER1eU478+kAIuJBYttRIcZqRStKfunQgSFah8AKupF0Pi2U3MWwdRJdFvwEA==
X-Received: by 2002:a05:6512:3a8e:b0:479:d8f:1a0c with SMTP id
 q14-20020a0565123a8e00b004790d8f1a0cmr1897721lfu.227.1655366391862; 
 Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm/hdmi: move resource allocation to probe function
Date: Thu, 16 Jun 2022 10:59:47 +0300
Message-Id: <20220616075947.347888-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than having all resource allocation happen in the _bind function
(resulting in possible EPROBE_DEFER returns and component bind/unbind
cycles) allocate and check all resources in _probe function. While we
are at it, use platform_get_irq() to get the IRQ rather than going
through the irq_of_parse_and_map().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 295 +++++++++++++++-----------------
 1 file changed, 134 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8dfe5690366b..429abd622c81 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -75,8 +75,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 
 	if (hdmi->i2c)
 		msm_hdmi_i2c_destroy(hdmi->i2c);
-
-	platform_set_drvdata(hdmi->pdev, NULL);
 }
 
 static int msm_hdmi_get_phy(struct hdmi *hdmi)
@@ -116,138 +114,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
  * we are to EPROBE_DEFER we want to do it here, rather than later
  * at modeset_init() time
  */
-static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
+static int msm_hdmi_init(struct hdmi *hdmi)
 {
-	struct hdmi_platform_config *config = pdev->dev.platform_data;
-	struct hdmi *hdmi = NULL;
-	struct resource *res;
-	int i, ret;
-
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	hdmi->pdev = pdev;
-	hdmi->config = config;
-	spin_lock_init(&hdmi->reg_lock);
-
-	hdmi->mmio = msm_ioremap(pdev, "core_physical");
-	if (IS_ERR(hdmi->mmio)) {
-		ret = PTR_ERR(hdmi->mmio);
-		goto fail;
-	}
-
-	/* HDCP needs physical address of hdmi register */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		"core_physical");
-	if (!res) {
-		ret = -EINVAL;
-		goto fail;
-	}
-	hdmi->mmio_phy_addr = res->start;
-
-	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
-	if (IS_ERR(hdmi->qfprom_mmio)) {
-		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
-		hdmi->qfprom_mmio = NULL;
-	}
-
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %d\n", ret);
-		goto fail;
-	}
-
-	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
-				      config->pwr_reg_cnt,
-				      sizeof(hdmi->pwr_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_regs) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	for (i = 0; i < config->pwr_reg_cnt; i++)
-		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
-		goto fail;
-	}
-
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_clks) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			goto fail;
-		}
-
-		hdmi->hpd_clks[i] = clk;
-	}
-
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
-				      sizeof(hdmi->pwr_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_clks) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s (%d)\n",
-					config->pwr_clk_names[i], ret);
-			goto fail;
-		}
-
-		hdmi->pwr_clks[i] = clk;
-	}
-
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod)) {
-		ret = PTR_ERR(hdmi->hpd_gpiod);
-		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);
-		goto fail;
-	}
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
-
-	devm_pm_runtime_enable(&pdev->dev);
+	struct platform_device *pdev = hdmi->pdev;
+	int ret;
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
@@ -271,13 +141,13 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		hdmi->hdcp_ctrl = NULL;
 	}
 
-	return hdmi;
+	return 0;
 
 fail:
 	if (hdmi)
 		msm_hdmi_destroy(hdmi);
 
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /* Second part of initialization, the drm/kms level modeset_init,
@@ -318,13 +188,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
 	drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
 
-	hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!hdmi->irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
 	ret = devm_request_irq(&pdev->dev, hdmi->irq,
 			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
 			"hdmi_isr", hdmi);
@@ -344,8 +207,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 
-	platform_set_drvdata(pdev, hdmi);
-
 	return 0;
 
 fail:
@@ -373,7 +234,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
-static struct hdmi_platform_config hdmi_tx_8960_config = {
+const static struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
@@ -383,7 +244,7 @@ static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
-static struct hdmi_platform_config hdmi_tx_8974_config = {
+const static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
@@ -498,23 +359,12 @@ static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
-	struct hdmi_platform_config *hdmi_cfg;
-	struct hdmi *hdmi;
-	struct device_node *of_node = dev->of_node;
+	struct hdmi *hdmi = dev_get_drvdata(dev);
 	int err;
 
-	hdmi_cfg = (struct hdmi_platform_config *)
-			of_device_get_match_data(dev);
-	if (!hdmi_cfg) {
-		DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
-		return -ENXIO;
-	}
-
-	dev->platform_data = hdmi_cfg;
-
-	hdmi = msm_hdmi_init(to_platform_device(dev));
-	if (IS_ERR(hdmi))
-		return PTR_ERR(hdmi);
+	err = msm_hdmi_init(hdmi);
+	if (err)
+		return err;
 	priv->hdmi = hdmi;
 
 	err = msm_hdmi_register_audio_driver(hdmi, dev);
@@ -547,6 +397,129 @@ static const struct component_ops msm_hdmi_ops = {
 
 static int msm_hdmi_dev_probe(struct platform_device *pdev)
 {
+	const struct hdmi_platform_config *config;
+	struct device *dev = &pdev->dev;
+	struct hdmi *hdmi;
+	struct resource *res;
+	int i, ret;
+
+	config = of_device_get_match_data(dev);
+	if (!config)
+		return -EINVAL;
+
+	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->pdev = pdev;
+	hdmi->config = config;
+	spin_lock_init(&hdmi->reg_lock);
+
+	hdmi->mmio = msm_ioremap(pdev, "core_physical");
+	if (IS_ERR(hdmi->mmio))
+		return PTR_ERR(hdmi->mmio);
+
+	/* HDCP needs physical address of hdmi register */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+		"core_physical");
+	if (!res)
+		return -EINVAL;
+	hdmi->mmio_phy_addr = res->start;
+
+	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
+	if (IS_ERR(hdmi->qfprom_mmio)) {
+		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
+		hdmi->qfprom_mmio = NULL;
+	}
+
+	hdmi->irq = platform_get_irq(pdev, 0);
+	if (hdmi->irq < 0)
+		return hdmi->irq;
+
+	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
+				      config->hpd_reg_cnt,
+				      sizeof(hdmi->hpd_regs[0]),
+				      GFP_KERNEL);
+	if (!hdmi->hpd_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < config->hpd_reg_cnt; i++)
+		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
+
+	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
+
+	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
+				      config->pwr_reg_cnt,
+				      sizeof(hdmi->pwr_regs[0]),
+				      GFP_KERNEL);
+	if (!hdmi->pwr_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < config->pwr_reg_cnt; i++)
+		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
+
+	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
+
+	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
+				      config->hpd_clk_cnt,
+				      sizeof(hdmi->hpd_clks[0]),
+				      GFP_KERNEL);
+	if (!hdmi->hpd_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < config->hpd_clk_cnt; i++) {
+		struct clk *clk;
+
+		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get hpd clk: %s\n",
+					     config->hpd_clk_names[i]);
+
+		hdmi->hpd_clks[i] = clk;
+	}
+
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
+				      GFP_KERNEL);
+	if (!hdmi->pwr_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < config->pwr_clk_cnt; i++) {
+		struct clk *clk;
+
+		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get pwr clk: %s\n",
+					     config->pwr_clk_names[i]);
+
+		hdmi->pwr_clks[i] = clk;
+	}
+
+	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
+	/* This will catch e.g. -EPROBE_DEFER */
+	if (IS_ERR(hdmi->hpd_gpiod))
+		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
+				     "failed to get hpd gpio\n");
+
+	if (!hdmi->hpd_gpiod)
+		DBG("failed to get HPD gpio");
+
+	if (hdmi->hpd_gpiod)
+		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
 	return component_add(&pdev->dev, &msm_hdmi_ops);
 }
 
-- 
2.35.1

