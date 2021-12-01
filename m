Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7AF465703
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 21:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06626E09C;
	Wed,  1 Dec 2021 20:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEF06E09C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 20:20:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n12so66006458lfe.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 12:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9eziqWmH/0sYjYUZm8mEiRFfXUO2KooRO+C0X18Kx2U=;
 b=I7Gf5/r15x7wY0kT0QOOWrbv2R/uZogi3dHph5lJMgaJRQOgpfJYNfLnnjxlXwbgzD
 Aj+LZgzXzvtkOFQjiGwkWOfmtEU2brrceVyiUhq6ahDJ6xoPbxADUmRUQQeGNZhywTS4
 gY6bK5CqcSray10hbRSVBaknbt5F1Oeg3zKYlC2y6keLIgFPFWaFI3XxOsfSHlow4V9C
 gZdAVyT/zZZ9wotZjPgvEvc5dg7MyXGICRyEvTNNZ75z1r+iF/AyLLfdU4SjwmEO/HWO
 F9YDBtPRanOsu+nDZefmZbMsInXJMHTuC3Mkzpnc9H46gLicAmsUG954PIWzV/50cvQy
 0szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9eziqWmH/0sYjYUZm8mEiRFfXUO2KooRO+C0X18Kx2U=;
 b=BkG6co+9fUV1N7s4vwBx1HsBE07boU9MlB7/h8QQyzDcN3TUPP1fCcH+9gs/QmrgZH
 NMMmM6tBHMe7ONIHqQg6w/1JL6v7Io8IubOzsCBUekXPCxI5lX5x/WjkeHPkHSsojJ8i
 S+yUTkpAl/tJOliBwlEDa9G6yBbF8DEUNYDxNsZ/ReZqulVdZ1WOnJwPhbyUwRo5HgmG
 QpTOjZcnL4XKjRnJZDyBya7WpjqqUy4fs8NcheQKCQD2iaXJmg9D7hXU70mym3iHWw/u
 Rj88VBbd5dQJY5dL8NcCrH3K1EaOL/1bnB/GxeQuyQr7/jM6efYludsqh0DgICeFtLNM
 1GjA==
X-Gm-Message-State: AOAM530o7ZPZNcjbqTX8Ae/A9pM/GlW+YvZqrb/NlWtISJPIdDHCYp60
 Jx9M8gYoJvibwFWR51nEjfBbkw==
X-Google-Smtp-Source: ABdhPJzxilRqazp2oHgj/58Sq40QysSwe1300GaIqyK8Whzos1jiaplqsQ6SUxKNEnO7lUqiIQXQKQ==
X-Received: by 2002:a05:6512:3991:: with SMTP id
 j17mr7954368lfu.545.1638390025047; 
 Wed, 01 Dec 2021 12:20:25 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b4sm88538lfq.128.2021.12.01.12.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 12:20:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
Date: Wed,  1 Dec 2021 23:20:23 +0300
Message-Id: <20211201202023.2313971-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201105210.24970-3-angelogioacchino.delregno@collabora.com>
References: <20211201105210.24970-3-angelogioacchino.delregno@collabora.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
DSI host gets initialized earlier, but this caused unability to probe
the entire stack of components because they all depend on interrupts
coming from the main `mdss` node (mdp5, or dpu1).

To fix this issue, move mdss device initialization (which include irq
domain setup) to msm_mdev_probe() time, as to make sure that the
interrupt controller is available before dsi and/or other components try
to initialize, finally satisfying the dependency.

Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
Co-Developed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

When checking your patch, I noticed that IRQ domain is created before
respective MDSS clocks are enabled. This does not look like causing any
issues at this time, but it did not look good. So I started moving
clocks parsing to early_init() callbacks. And at some point it looked
like we can drop the init()/destroy() callbacks in favour of
early_init() and remove(). Which promted me to move init()/destroy() in
place of early_init()/remove() with few minor fixes here and there.

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 25 +++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 32 ++++++-------
 drivers/gpu/drm/msm/msm_drv.c             | 56 ++++++++++++-----------
 drivers/gpu/drm/msm/msm_kms.h             |  8 ++--
 4 files changed, 59 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b466784d9822..131c1f1a869c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -111,7 +111,7 @@ static int _dpu_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
 	struct device *dev;
 	struct irq_domain *domain;
 
-	dev = dpu_mdss->base.dev->dev;
+	dev = dpu_mdss->base.dev;
 
 	domain = irq_domain_add_linear(dev->of_node, 32,
 			&dpu_mdss_irqdomain_ops, dpu_mdss);
@@ -184,16 +184,15 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
 	return ret;
 }
 
-static void dpu_mdss_destroy(struct drm_device *dev)
+static void dpu_mdss_destroy(struct msm_mdss *mdss)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct msm_drm_private *priv = dev->dev_private;
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
+	struct platform_device *pdev = to_platform_device(mdss->dev);
+	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
 	int irq;
 
-	pm_runtime_suspend(dev->dev);
-	pm_runtime_disable(dev->dev);
+	pm_runtime_suspend(mdss->dev);
+	pm_runtime_disable(mdss->dev);
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
@@ -203,7 +202,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
 	dpu_mdss->mmio = NULL;
-	priv->mdss = NULL;
 }
 
 static const struct msm_mdss_funcs mdss_funcs = {
@@ -212,16 +210,15 @@ static const struct msm_mdss_funcs mdss_funcs = {
 	.destroy = dpu_mdss_destroy,
 };
 
-int dpu_mdss_init(struct drm_device *dev)
+int dpu_mdss_init(struct platform_device *pdev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_mdss *dpu_mdss;
 	struct dss_module_power *mp;
 	int ret;
 	int irq;
 
-	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
+	dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
 	if (!dpu_mdss)
 		return -ENOMEM;
 
@@ -238,7 +235,7 @@ int dpu_mdss_init(struct drm_device *dev)
 		goto clk_parse_err;
 	}
 
-	dpu_mdss->base.dev = dev;
+	dpu_mdss->base.dev = &pdev->dev;
 	dpu_mdss->base.funcs = &mdss_funcs;
 
 	ret = _dpu_mdss_irq_domain_add(dpu_mdss);
@@ -256,7 +253,7 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	priv->mdss = &dpu_mdss->base;
 
-	pm_runtime_enable(dev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index c34760d981b8..b3f79c2277e9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -112,7 +112,7 @@ static const struct irq_domain_ops mdss_hw_irqdomain_ops = {
 
 static int mdss_irq_domain_init(struct mdp5_mdss *mdp5_mdss)
 {
-	struct device *dev = mdp5_mdss->base.dev->dev;
+	struct device *dev = mdp5_mdss->base.dev;
 	struct irq_domain *d;
 
 	d = irq_domain_add_linear(dev->of_node, 32, &mdss_hw_irqdomain_ops,
@@ -155,7 +155,7 @@ static int mdp5_mdss_disable(struct msm_mdss *mdss)
 static int msm_mdss_get_clocks(struct mdp5_mdss *mdp5_mdss)
 {
 	struct platform_device *pdev =
-			to_platform_device(mdp5_mdss->base.dev->dev);
+			to_platform_device(mdp5_mdss->base.dev);
 
 	mdp5_mdss->ahb_clk = msm_clk_get(pdev, "iface");
 	if (IS_ERR(mdp5_mdss->ahb_clk))
@@ -172,10 +172,9 @@ static int msm_mdss_get_clocks(struct mdp5_mdss *mdp5_mdss)
 	return 0;
 }
 
-static void mdp5_mdss_destroy(struct drm_device *dev)
+static void mdp5_mdss_destroy(struct msm_mdss *mdss)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(priv->mdss);
+	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
 
 	if (!mdp5_mdss)
 		return;
@@ -183,7 +182,7 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
 	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
 	mdp5_mdss->irqcontroller.domain = NULL;
 
-	pm_runtime_disable(dev->dev);
+	pm_runtime_disable(mdss->dev);
 }
 
 static const struct msm_mdss_funcs mdss_funcs = {
@@ -192,25 +191,24 @@ static const struct msm_mdss_funcs mdss_funcs = {
 	.destroy = mdp5_mdss_destroy,
 };
 
-int mdp5_mdss_init(struct drm_device *dev)
+int mdp5_mdss_init(struct platform_device *pdev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct mdp5_mdss *mdp5_mdss;
 	int ret;
 
 	DBG("");
 
-	if (!of_device_is_compatible(dev->dev->of_node, "qcom,mdss"))
+	if (!of_device_is_compatible(pdev->dev.of_node, "qcom,mdss"))
 		return 0;
 
-	mdp5_mdss = devm_kzalloc(dev->dev, sizeof(*mdp5_mdss), GFP_KERNEL);
+	mdp5_mdss = devm_kzalloc(&pdev->dev, sizeof(*mdp5_mdss), GFP_KERNEL);
 	if (!mdp5_mdss) {
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	mdp5_mdss->base.dev = dev;
+	mdp5_mdss->base.dev = &pdev->dev;
 
 	mdp5_mdss->mmio = msm_ioremap(pdev, "mdss_phys", "MDSS");
 	if (IS_ERR(mdp5_mdss->mmio)) {
@@ -226,27 +224,27 @@ int mdp5_mdss_init(struct drm_device *dev)
 
 	ret = msm_mdss_get_clocks(mdp5_mdss);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to get clocks: %d\n", ret);
+		DRM_DEV_ERROR(&pdev->dev, "failed to get clocks: %d\n", ret);
 		goto fail;
 	}
 
-	ret = devm_request_irq(dev->dev, platform_get_irq(pdev, 0),
+	ret = devm_request_irq(&pdev->dev, platform_get_irq(pdev, 0),
 			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to init irq: %d\n", ret);
+		DRM_DEV_ERROR(&pdev->dev, "failed to init irq: %d\n", ret);
 		goto fail;
 	}
 
 	ret = mdss_irq_domain_init(mdp5_mdss);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
+		DRM_DEV_ERROR(&pdev->dev, "failed to init sub-block irqs: %d\n", ret);
 		goto fail;
 	}
 
 	mdp5_mdss->base.funcs = &mdss_funcs;
 	priv->mdss = &mdp5_mdss->base;
 
-	pm_runtime_enable(dev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 fail:
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f5596efd3819..ad35a5d94053 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -342,7 +342,6 @@ static int msm_drm_uninit(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	struct msm_mdss *mdss = priv->mdss;
 	int i;
 
 	/*
@@ -402,9 +401,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	component_unbind_all(dev, ddev);
 
-	if (mdss && mdss->funcs)
-		mdss->funcs->destroy(ddev);
-
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
@@ -525,20 +521,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-		ret = mdp5_mdss_init(ddev);
-		break;
-	case KMS_DPU:
-		ret = dpu_mdss_init(ddev);
-		break;
-	default:
-		ret = 0;
-		break;
-	}
-	if (ret)
-		goto err_put_drm_dev;
-
 	mdss = priv->mdss;
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
@@ -561,12 +543,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_destroy_mdss;
+		return ret;
 
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_destroy_mdss;
+		return ret;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -672,12 +654,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 err_msm_uninit:
 	msm_drm_uninit(dev);
 	return ret;
-err_destroy_mdss:
-	if (mdss && mdss->funcs)
-		mdss->funcs->destroy(ddev);
-err_put_drm_dev:
-	drm_dev_put(ddev);
-	return ret;
 }
 
 /*
@@ -1386,10 +1362,26 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	switch (get_mdp_ver(pdev)) {
+	case KMS_MDP5:
+		ret = mdp5_mdss_init(pdev);
+		break;
+	case KMS_DPU:
+		ret = dpu_mdss_init(pdev);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+	if (ret) {
+		platform_set_drvdata(pdev, NULL);
+		return ret;
+	}
+
 	if (get_mdp_ver(pdev)) {
 		ret = add_display_components(pdev, &match);
 		if (ret)
-			return ret;
+			goto fail;
 	}
 
 	ret = add_gpu_components(&pdev->dev, &match);
@@ -1411,14 +1403,24 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 fail:
 	of_platform_depopulate(&pdev->dev);
+
+	if (priv->mdss && priv->mdss->funcs)
+		priv->mdss->funcs->destroy(priv->mdss);
+
 	return ret;
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct msm_mdss *mdss = priv->mdss;
+
 	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
+	if (mdss && mdss->funcs)
+		mdss->funcs->destroy(mdss);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 8b132c8b1513..2a4f0526cb98 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -204,16 +204,16 @@ extern const struct of_device_id mdp5_dt_match[];
 struct msm_mdss_funcs {
 	int (*enable)(struct msm_mdss *mdss);
 	int (*disable)(struct msm_mdss *mdss);
-	void (*destroy)(struct drm_device *dev);
+	void (*destroy)(struct msm_mdss *mdss);
 };
 
 struct msm_mdss {
-	struct drm_device *dev;
+	struct device *dev;
 	const struct msm_mdss_funcs *funcs;
 };
 
-int mdp5_mdss_init(struct drm_device *dev);
-int dpu_mdss_init(struct drm_device *dev);
+int mdp5_mdss_init(struct platform_device *dev);
+int dpu_mdss_init(struct platform_device *dev);
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
-- 
2.33.0

