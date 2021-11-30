Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1602463639
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124C6E85D;
	Tue, 30 Nov 2021 14:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B86E84A;
 Tue, 30 Nov 2021 14:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 550931F45136
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638281459; bh=cPu187CxXOcTdY8f/L0FkSLNyaNon8PjHGIZEQR2rOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GCZJHND2HiY9AIare2zTUtuEZwuauenQ1klRveqPU2tzyrVjEJAGcdQOFFP68cvXJ
 sBllrNegxr5HpS6XFwZ4Oo3Jj2E5raUefU1JB1I2NyFeILdiUQ5NqDq+MsU0mODLfn
 90U3b4NQCxZjUbvrBHk4IbcRaBZXJhPNYi7W+SuX/eTqZSbuUzWDDpjXCKXMMCiRDI
 AAMS7YxfmaMGeh6HwFMAJWUWCkhkb9k0jc8ON1kRF1QwWQ7H8Z5f0Bf3t1gy51YddJ
 32S5bvpnLf0CaT1qbXNOZuxps2cFFRYQeyJNoE4NrGAhhSj5rLq4bmtAnURMJrgnq4
 KZ0s19XtblKMw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robdclark@gmail.com
Subject: [PATCH v2 2/2] drm/msm: Initialize MDSS irq domain at probe time
Date: Tue, 30 Nov 2021 15:10:48 +0100
Message-Id: <20211130141048.294246-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130141048.294246-1-angelogioacchino.delregno@collabora.com>
References: <20211130141048.294246-1-angelogioacchino.delregno@collabora.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com, sean@poorly.run,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
DSI host gets initialized earlier, but this caused unability to probe
the entire stack of components because they all depend on interrupts
coming from the main `mdss` node (mdp5, or dpu1).

To fix this issue, anticipate registering the irq domain from mdp5/dpu1
at msm_mdev_probe() time, as to make sure that the interrupt controller
is available before dsi and/or other components try to initialize,
finally satisfying the dependency.

Moreover, to balance this operation while avoiding to always check if
the irq domain is registered everytime we call bind() on msm_pdev, add
a new *remove function pointer to msm_mdss_funcs, used to remove the
irq domain only at msm_pdev_remove() time.

Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 50 ++++++++++++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 58 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_drv.c             | 22 ++++++++-
 drivers/gpu/drm/msm/msm_kms.h             |  3 ++
 4 files changed, 95 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b466784d9822..6c2569175633 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -106,13 +106,10 @@ static const struct irq_domain_ops dpu_mdss_irqdomain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
-static int _dpu_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
+static int _dpu_mdss_irq_domain_add(struct device *dev, struct dpu_mdss *dpu_mdss)
 {
-	struct device *dev;
 	struct irq_domain *domain;
 
-	dev = dpu_mdss->base.dev->dev;
-
 	domain = irq_domain_add_linear(dev->of_node, 32,
 			&dpu_mdss_irqdomain_ops, dpu_mdss);
 	if (!domain) {
@@ -194,7 +191,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 
 	pm_runtime_suspend(dev->dev);
 	pm_runtime_disable(dev->dev);
-	_dpu_mdss_irq_domain_fini(dpu_mdss);
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
@@ -203,15 +199,43 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
 	dpu_mdss->mmio = NULL;
-	priv->mdss = NULL;
+}
+
+static void dpu_mdss_remove(struct msm_mdss *mdss)
+{
+	_dpu_mdss_irq_domain_fini(to_dpu_mdss(mdss));
 }
 
 static const struct msm_mdss_funcs mdss_funcs = {
 	.enable	= dpu_mdss_enable,
 	.disable = dpu_mdss_disable,
 	.destroy = dpu_mdss_destroy,
+	.remove = dpu_mdss_remove,
 };
 
+int dpu_mdss_early_init(struct device *dev, struct msm_drm_private *priv)
+{
+	struct dpu_mdss *dpu_mdss;
+	int ret;
+
+	dpu_mdss = devm_kzalloc(dev, sizeof(*dpu_mdss), GFP_KERNEL);
+	if (!dpu_mdss)
+		return -ENOMEM;
+
+	ret = _dpu_mdss_irq_domain_add(dev, dpu_mdss);
+	if (ret)
+		return ret;
+
+	/*
+	 * Here we have no drm_device yet, but still do the assignment
+	 * so that we can retrieve our struct dpu_mdss from the main
+	 * init function, since we allocate it here.
+	 */
+	priv->mdss = &dpu_mdss->base;
+
+	return 0;
+}
+
 int dpu_mdss_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
@@ -221,9 +245,9 @@ int dpu_mdss_init(struct drm_device *dev)
 	int ret;
 	int irq;
 
-	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
+	dpu_mdss = to_dpu_mdss(priv->mdss);
 	if (!dpu_mdss)
-		return -ENOMEM;
+		return -ENODATA;
 
 	dpu_mdss->mmio = msm_ioremap(pdev, "mdss", "mdss");
 	if (IS_ERR(dpu_mdss->mmio))
@@ -241,10 +265,6 @@ int dpu_mdss_init(struct drm_device *dev)
 	dpu_mdss->base.dev = dev;
 	dpu_mdss->base.funcs = &mdss_funcs;
 
-	ret = _dpu_mdss_irq_domain_add(dpu_mdss);
-	if (ret)
-		goto irq_domain_error;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
@@ -253,16 +273,10 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
 					 dpu_mdss);
-
-	priv->mdss = &dpu_mdss->base;
-
 	pm_runtime_enable(dev->dev);
-
 	return 0;
 
 irq_error:
-	_dpu_mdss_irq_domain_fini(dpu_mdss);
-irq_domain_error:
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 clk_parse_err:
 	devm_kfree(&pdev->dev, mp->clk_config);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index 0ea53420bc40..a99538ae4182 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -112,9 +112,8 @@ static const struct irq_domain_ops mdss_hw_irqdomain_ops = {
 };
 
 
-static int mdss_irq_domain_init(struct mdp5_mdss *mdp5_mdss)
+static int mdss_irq_domain_init(struct device *dev, struct mdp5_mdss *mdp5_mdss)
 {
-	struct device *dev = mdp5_mdss->base.dev->dev;
 	struct irq_domain *d;
 
 	d = irq_domain_add_linear(dev->of_node, 32, &mdss_hw_irqdomain_ops,
@@ -182,20 +181,52 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
 	if (!mdp5_mdss)
 		return;
 
-	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
-	mdp5_mdss->irqcontroller.domain = NULL;
-
 	regulator_disable(mdp5_mdss->vdd);
 
 	pm_runtime_disable(dev->dev);
 }
 
+static void mdp5_mdss_remove(struct msm_mdss *mdss)
+{
+	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
+
+	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
+	mdp5_mdss->irqcontroller.domain = NULL;
+}
+
 static const struct msm_mdss_funcs mdss_funcs = {
 	.enable	= mdp5_mdss_enable,
 	.disable = mdp5_mdss_disable,
 	.destroy = mdp5_mdss_destroy,
+	.remove = mdp5_mdss_remove,
 };
 
+int mdp5_mdss_early_init(struct device *dev, struct msm_drm_private *priv)
+{
+	struct mdp5_mdss *mdp5_mdss;
+	int ret;
+
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdss"))
+		return 0;
+
+	mdp5_mdss = devm_kzalloc(dev, sizeof(*mdp5_mdss), GFP_KERNEL);
+	if (!mdp5_mdss)
+		return -ENOMEM;
+
+	ret = mdss_irq_domain_init(dev, mdp5_mdss);
+	if (ret)
+		return ret;
+
+	/*
+	 * Here we have no drm_device yet, but still do the assignment
+	 * so that we can retrieve our struct mdp5_mdss from the main
+	 * init function, since we allocate it here.
+	 */
+	priv->mdss = &mdp5_mdss->base;
+
+	return 0;
+}
+
 int mdp5_mdss_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
@@ -208,11 +239,9 @@ int mdp5_mdss_init(struct drm_device *dev)
 	if (!of_device_is_compatible(dev->dev->of_node, "qcom,mdss"))
 		return 0;
 
-	mdp5_mdss = devm_kzalloc(dev->dev, sizeof(*mdp5_mdss), GFP_KERNEL);
-	if (!mdp5_mdss) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_mdss = to_mdp5_mdss(priv->mdss);
+	if (!mdp5_mdss)
+		return -ENODATA;
 
 	mdp5_mdss->base.dev = dev;
 
@@ -255,17 +284,8 @@ int mdp5_mdss_init(struct drm_device *dev)
 		goto fail_irq;
 	}
 
-	ret = mdss_irq_domain_init(mdp5_mdss);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
-		goto fail_irq;
-	}
-
 	mdp5_mdss->base.funcs = &mdss_funcs;
-	priv->mdss = &mdp5_mdss->base;
-
 	pm_runtime_enable(dev->dev);
-
 	return 0;
 fail_irq:
 	regulator_disable(mdp5_mdss->vdd);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 601814b12daf..e61fc806148b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1390,6 +1390,20 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	switch (get_mdp_ver(pdev)) {
+	case KMS_MDP5:
+		ret = mdp5_mdss_early_init(&pdev->dev, priv);
+		break;
+	case KMS_DPU:
+		ret = dpu_mdss_early_init(&pdev->dev, priv);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, priv);
 
 	if (get_mdp_ver(pdev)) {
@@ -1422,6 +1436,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->mdss && priv->mdss->funcs)
+		priv->mdss->funcs->remove(priv->mdss);
+
+	priv->mdss = NULL;
 	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
@@ -1433,7 +1453,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
+	if (!priv || !priv->kms || !drm->mode_config.funcs)
 		return;
 
 	drm_atomic_helper_shutdown(drm);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 6a42b819abc4..2c539a228156 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -202,6 +202,7 @@ struct msm_mdss_funcs {
 	int (*enable)(struct msm_mdss *mdss);
 	int (*disable)(struct msm_mdss *mdss);
 	void (*destroy)(struct drm_device *dev);
+	void (*remove)(struct msm_mdss *mdss);
 };
 
 struct msm_mdss {
@@ -209,7 +210,9 @@ struct msm_mdss {
 	const struct msm_mdss_funcs *funcs;
 };
 
+int mdp5_mdss_early_init(struct device *dev, struct msm_drm_private *priv);
 int mdp5_mdss_init(struct drm_device *dev);
+int dpu_mdss_early_init(struct device *dev, struct msm_drm_private *priv);
 int dpu_mdss_init(struct drm_device *dev);
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
-- 
2.33.1

