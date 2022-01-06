Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715A485D62
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6E210E577;
	Thu,  6 Jan 2022 00:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFA810E574
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:43:05 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v15so1623028ljc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t9Ylz2TrxDXjGDgfriMEa9PbBr4loQlNxCq7HKkE+Rg=;
 b=NDqzPI35cZjzIdw4KkuMVxFZ2y9UcRoQnM2X1dzxXsa8LYDQrgBk/XKJ2N6juEd3WO
 a95+FH1zZIWu9s8ZDiLFqVLs3shJvp/xeJPZ712GjlYCM9/FIafJ1UzuwHnYHrvS1tZY
 pMoTkWic6trBO62EunLqr+QjDyRzSw1xLYqHoFkB97paF9wx91XQkiF28+ghvETVVsOF
 S+trdsi7KVyoSYu7yrWaoH55Ymb45UIWVyXgNGLyeO22qgcK4zTj0dx2qeojubg8fWWe
 /z2bJSutdgzDmsV61s32Rt06SNK4mFrN29lBgmaXNB4Y+b8+2NX5ussXL0bC3ZdbWqlJ
 u+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t9Ylz2TrxDXjGDgfriMEa9PbBr4loQlNxCq7HKkE+Rg=;
 b=pDs4BChCswR0DgpLaPpVVixVXRQQI1Q+rFAK1z07kOnKlCCBZPfvWaDOL8L8wbFWLt
 V/sOMgkjprJtvxct11BJEcGj9eV1623R1Xwqko/RPPgNyocy1tSBf3cjP43I4NsH3T+F
 fjJAp5CVuASJNGJ/JoFw2cCdRzTdqZyTZv24aO+DQDeq33n6aQF+DBV2Gf61PeRihUkm
 fsKSYP7k9QIxLc0dO0mSW9Olz91ExjPIjvPaB4rsZeLo2kbTJHuu8xyRkhSo+V9+Hp36
 unhPMfzKNZLFbqDWJsm8zUQegikVvWiwGCQ3fH0d+Yw723zGTAHJHkMCVBfVRYHx7tML
 gOWw==
X-Gm-Message-State: AOAM532aelJyz91wbd6m5mqXpLyoliWrgM1iZTmxU0hxE0VQ8buODsCL
 t1DP3W3cq8d/UYzscbMWlA7ejg==
X-Google-Smtp-Source: ABdhPJx5BsfSHXhGF3At6cp3ztZA587XZUD/bXMUCs7Rokn9X+GmF5RFXCOIOehkD4BS3YpW0VZYsw==
X-Received: by 2002:a2e:8854:: with SMTP id z20mr38313314ljj.202.1641429784154; 
 Wed, 05 Jan 2022 16:43:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 16:43:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Subject: [PATCH 2/4] drm/msm: remove extra indirection for msm_mdss
Date: Thu,  6 Jan 2022 03:42:55 +0300
Message-Id: <20220106004257.451572-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
References: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since now there is just one mdss subdriver, drop all the indirection,
make msm_mdss struct completely opaque (and defined inside msm_mdss.c)
and call mdss functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c  |  44 ++++++++----
 drivers/gpu/drm/msm/msm_kms.h  |  16 ++---
 drivers/gpu/drm/msm/msm_mdss.c | 125 ++++++++++++++-------------------
 3 files changed, 88 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f2a0dc46b1f4..e978c29dc61a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1153,8 +1153,8 @@ static int __maybe_unused msm_runtime_suspend(struct device *dev)
 
 	DBG("");
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->disable(mdss);
+	if (mdss)
+		return msm_mdss_disable(mdss);
 
 	return 0;
 }
@@ -1166,8 +1166,8 @@ static int __maybe_unused msm_runtime_resume(struct device *dev)
 
 	DBG("");
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->enable(mdss);
+	if (mdss)
+		return msm_mdss_enable(mdss);
 
 	return 0;
 }
@@ -1402,6 +1402,7 @@ static const struct component_master_ops msm_drm_ops = {
 static int msm_pdev_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct msm_mdss *mdss;
 	struct msm_drm_private *priv;
 	int ret;
 
@@ -1413,19 +1414,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	switch (get_mdp_ver(pdev)) {
 	case KMS_MDP5:
-		ret = msm_mdss_init(pdev, true);
+		mdss = msm_mdss_init(pdev, true);
+		if (IS_ERR(mdss)) {
+			ret = PTR_ERR(mdss);
+			platform_set_drvdata(pdev, NULL);
+
+			return ret;
+		} else {
+			priv->mdss = mdss;
+			pm_runtime_enable(&pdev->dev);
+		}
 		break;
 	case KMS_DPU:
-		ret = msm_mdss_init(pdev, false);
+		mdss = msm_mdss_init(pdev, false);
+		if (IS_ERR(mdss)) {
+			ret = PTR_ERR(mdss);
+			platform_set_drvdata(pdev, NULL);
+
+			return ret;
+		} else {
+			priv->mdss = mdss;
+			pm_runtime_enable(&pdev->dev);
+		}
 		break;
 	default:
-		ret = 0;
 		break;
 	}
-	if (ret) {
-		platform_set_drvdata(pdev, NULL);
-		return ret;
-	}
 
 	if (get_mdp_ver(pdev)) {
 		ret = add_display_components(pdev, &match);
@@ -1453,8 +1467,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
 fail:
 	of_platform_depopulate(&pdev->dev);
 
-	if (priv->mdss && priv->mdss->funcs)
-		priv->mdss->funcs->destroy(priv->mdss);
+	if (priv->mdss)
+		msm_mdss_destroy(priv->mdss);
 
 	return ret;
 }
@@ -1467,8 +1481,8 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
-	if (mdss && mdss->funcs)
-		mdss->funcs->destroy(mdss);
+	if (mdss)
+		msm_mdss_destroy(mdss);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2459ba479caf..0c341660941a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -201,18 +201,12 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev);
 extern const struct of_device_id dpu_dt_match[];
 extern const struct of_device_id mdp5_dt_match[];
 
-struct msm_mdss_funcs {
-	int (*enable)(struct msm_mdss *mdss);
-	int (*disable)(struct msm_mdss *mdss);
-	void (*destroy)(struct msm_mdss *mdss);
-};
-
-struct msm_mdss {
-	struct device *dev;
-	const struct msm_mdss_funcs *funcs;
-};
+struct msm_mdss;
 
-int msm_mdss_init(struct platform_device *pdev, bool mdp5);
+struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5);
+int msm_mdss_enable(struct msm_mdss *mdss);
+int msm_mdss_disable(struct msm_mdss *mdss);
+void msm_mdss_destroy(struct msm_mdss *mdss);
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e8e7db49b7b1..8766666cfffb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -14,8 +14,6 @@
 /* for DPU_HW_* defines */
 #include "disp/dpu1/dpu_hw_catalog.h"
 
-#define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
-
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
@@ -23,8 +21,9 @@
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
 
-struct dpu_mdss {
-	struct msm_mdss base;
+struct msm_mdss {
+	struct device *dev;
+
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	int num_clocks;
@@ -36,19 +35,19 @@ struct dpu_mdss {
 
 static void msm_mdss_irq(struct irq_desc *desc)
 {
-	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
+	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 interrupts;
 
 	chained_irq_enter(chip, desc);
 
-	interrupts = readl_relaxed(dpu_mdss->mmio + HW_INTR_STATUS);
+	interrupts = readl_relaxed(msm_mdss->mmio + HW_INTR_STATUS);
 
 	while (interrupts) {
 		irq_hw_number_t hwirq = fls(interrupts) - 1;
 		int rc;
 
-		rc = generic_handle_domain_irq(dpu_mdss->irq_controller.domain,
+		rc = generic_handle_domain_irq(msm_mdss->irq_controller.domain,
 					       hwirq);
 		if (rc < 0) {
 			DRM_ERROR("handle irq fail: irq=%lu rc=%d\n",
@@ -64,28 +63,28 @@ static void msm_mdss_irq(struct irq_desc *desc)
 
 static void msm_mdss_irq_mask(struct irq_data *irqd)
 {
-	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
+	struct msm_mdss *msm_mdss = irq_data_get_irq_chip_data(irqd);
 
 	/* memory barrier */
 	smp_mb__before_atomic();
-	clear_bit(irqd->hwirq, &dpu_mdss->irq_controller.enabled_mask);
+	clear_bit(irqd->hwirq, &msm_mdss->irq_controller.enabled_mask);
 	/* memory barrier */
 	smp_mb__after_atomic();
 }
 
 static void msm_mdss_irq_unmask(struct irq_data *irqd)
 {
-	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
+	struct msm_mdss *msm_mdss = irq_data_get_irq_chip_data(irqd);
 
 	/* memory barrier */
 	smp_mb__before_atomic();
-	set_bit(irqd->hwirq, &dpu_mdss->irq_controller.enabled_mask);
+	set_bit(irqd->hwirq, &msm_mdss->irq_controller.enabled_mask);
 	/* memory barrier */
 	smp_mb__after_atomic();
 }
 
 static struct irq_chip msm_mdss_irq_chip = {
-	.name = "dpu_mdss",
+	.name = "msm_mdss",
 	.irq_mask = msm_mdss_irq_mask,
 	.irq_unmask = msm_mdss_irq_unmask,
 };
@@ -95,12 +94,12 @@ static struct lock_class_key msm_mdss_lock_key, msm_mdss_request_key;
 static int msm_mdss_irqdomain_map(struct irq_domain *domain,
 		unsigned int irq, irq_hw_number_t hwirq)
 {
-	struct dpu_mdss *dpu_mdss = domain->host_data;
+	struct msm_mdss *msm_mdss = domain->host_data;
 
 	irq_set_lockdep_class(irq, &msm_mdss_lock_key, &msm_mdss_request_key);
 	irq_set_chip_and_handler(irq, &msm_mdss_irq_chip, handle_level_irq);
 
-	return irq_set_chip_data(irq, dpu_mdss);
+	return irq_set_chip_data(irq, msm_mdss);
 }
 
 static const struct irq_domain_ops msm_mdss_irqdomain_ops = {
@@ -108,32 +107,31 @@ static const struct irq_domain_ops msm_mdss_irqdomain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
-static int _msm_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
+static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 {
 	struct device *dev;
 	struct irq_domain *domain;
 
-	dev = dpu_mdss->base.dev;
+	dev = msm_mdss->dev;
 
 	domain = irq_domain_add_linear(dev->of_node, 32,
-			&msm_mdss_irqdomain_ops, dpu_mdss);
+			&msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		DRM_ERROR("failed to add irq_domain\n");
 		return -EINVAL;
 	}
 
-	dpu_mdss->irq_controller.enabled_mask = 0;
-	dpu_mdss->irq_controller.domain = domain;
+	msm_mdss->irq_controller.enabled_mask = 0;
+	msm_mdss->irq_controller.domain = domain;
 
 	return 0;
 }
 
-static int msm_mdss_enable(struct msm_mdss *mdss)
+int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(dpu_mdss->num_clocks, dpu_mdss->clocks);
+	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		DRM_ERROR("clock enable failed, ret:%d\n", ret);
 		return ret;
@@ -143,57 +141,48 @@ static int msm_mdss_enable(struct msm_mdss *mdss)
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
 	 */
-	switch (readl_relaxed(dpu_mdss->mmio + HW_REV)) {
+	switch (readl_relaxed(msm_mdss->mmio + HW_REV)) {
 	case DPU_HW_VER_500:
 	case DPU_HW_VER_501:
-		writel_relaxed(0x420, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	case DPU_HW_VER_600:
 		/* TODO: 0x102e for LP_DDR4 */
-		writel_relaxed(0x103e, dpu_mdss->mmio + UBWC_STATIC);
-		writel_relaxed(2, dpu_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, dpu_mdss->mmio + UBWC_PREDICTION_MODE);
+		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 		break;
 	case DPU_HW_VER_620:
-		writel_relaxed(0x1e, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x1e, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	case DPU_HW_VER_720:
-		writel_relaxed(0x101e, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	}
 
 	return ret;
 }
 
-static int msm_mdss_disable(struct msm_mdss *mdss)
+int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-
-	clk_bulk_disable_unprepare(dpu_mdss->num_clocks, dpu_mdss->clocks);
+	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
 
 	return 0;
 }
 
-static void msm_mdss_destroy(struct msm_mdss *mdss)
+void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 {
-	struct platform_device *pdev = to_platform_device(mdss->dev);
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
+	struct platform_device *pdev = to_platform_device(msm_mdss->dev);
 	int irq;
 
-	pm_runtime_suspend(mdss->dev);
-	pm_runtime_disable(mdss->dev);
-	irq_domain_remove(dpu_mdss->irq_controller.domain);
-	dpu_mdss->irq_controller.domain = NULL;
+	pm_runtime_suspend(msm_mdss->dev);
+	pm_runtime_disable(msm_mdss->dev);
+	irq_domain_remove(msm_mdss->irq_controller.domain);
+	msm_mdss->irq_controller.domain = NULL;
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 }
 
-static const struct msm_mdss_funcs mdss_funcs = {
-	.enable	= msm_mdss_enable,
-	.disable = msm_mdss_disable,
-	.destroy = msm_mdss_destroy,
-};
-
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
@@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
 	return num_clocks;
 }
 
-int msm_mdss_init(struct platform_device *pdev, bool mdp5)
+struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct dpu_mdss *dpu_mdss;
+	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
 
-	dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
-	if (!dpu_mdss)
-		return -ENOMEM;
+	msm_mdss = devm_kzalloc(&pdev->dev, sizeof(*msm_mdss), GFP_KERNEL);
+	if (!msm_mdss)
+		return ERR_PTR(-ENOMEM);
 
-	dpu_mdss->mmio = msm_ioremap(pdev, mdp5 ? "mdss_phys" : "mdss", "mdss");
-	if (IS_ERR(dpu_mdss->mmio))
-		return PTR_ERR(dpu_mdss->mmio);
+	msm_mdss->mmio = msm_ioremap(pdev, mdp5 ? "mdss_phys" : "mdss", "mdss");
+	if (IS_ERR(msm_mdss->mmio))
+		return ERR_CAST(msm_mdss->mmio);
 
-	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
+	DRM_DEBUG("mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	if (mdp5)
-		ret = mdp5_mdss_parse_clock(pdev, &dpu_mdss->clocks);
+		ret = mdp5_mdss_parse_clock(pdev, &msm_mdss->clocks);
 	else
-		ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
+		ret = msm_parse_clock(pdev, &msm_mdss->clocks);
 	if (ret < 0) {
 		DRM_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
+		return ERR_PTR(ret);
 	}
-	dpu_mdss->num_clocks = ret;
+	msm_mdss->num_clocks = ret;
 
-	dpu_mdss->base.dev = &pdev->dev;
-	dpu_mdss->base.funcs = &mdss_funcs;
+	msm_mdss->dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return ERR_PTR(irq);
 
-	ret = _msm_mdss_irq_domain_add(dpu_mdss);
+	ret = _msm_mdss_irq_domain_add(msm_mdss);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
-					 dpu_mdss);
+					 msm_mdss);
 
-	priv->mdss = &dpu_mdss->base;
-
-	pm_runtime_enable(&pdev->dev);
-
-	return 0;
+	return msm_mdss;
 }
-- 
2.34.1

