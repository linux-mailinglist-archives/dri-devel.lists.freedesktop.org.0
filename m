Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644B485D5F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525610E572;
	Thu,  6 Jan 2022 00:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA85010E571
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:43:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s4so1530362ljd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5Z+gcbvN3MifAySbAmHGKesHWm88vdVv0kKuuvvJo4=;
 b=hUIM/ysUsRIluMHZCB1kW9Pcd89T8RSMm+4VvDO4C/v4uwVUDBsCAM7HWmdfx56+GC
 sfEUy0f38/qL9DXJMgb2ddbPOc0AWP3vqUDRQUFMtXcQsQaH7/sLIkGLdKBOkMsQbNCR
 qrVRCLiup9IIu3cRcw4pYOq609PBHHUAx37C77qBSBLfVPYnES116UJaObZFnrYJWhZX
 o7NGUHXrqHDIqO3tXTWjFj1EQ+lm6Vfct4aLf9kKsajxhV5myHLDrP4c7b9QR9pBefLc
 E8JO8eaZKjykchOCvwC76Z2rpy8eud7wajb3cZ+pSBJkklcqkORm29fVBKYsc0xvDies
 /SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5Z+gcbvN3MifAySbAmHGKesHWm88vdVv0kKuuvvJo4=;
 b=XDB8s4oEcTtX1W38djSWkngXsEt7wIxsW1fVLlmFR5TPB8ZIkekbdBlpTJC4nSimoR
 INkU90QmHYzpqQswRdvJIRSOsWDYX+XI3UYoYJBVZrkZPWs2rwD/DBdO04VPauHP1cXP
 4RZ5nFxMUCK+cHLZqNKJf2rzqMJlOzFVSNzLXINbi8dBY81TqHyBsy4B4KvkhU/+WDhp
 bLaR+vPL0ixSFQch7cnXK6St5mQdZtgYySQca8ixjJnUhfueQWjsGwOUwkRFhOgtiwrr
 zSHJe9DJvaHNEGomQZaqFudCyo4t/14difjr9HpmlrMBR04g6pVlCnBWikUlCPOr9tCE
 r27w==
X-Gm-Message-State: AOAM532imL94k4fQ/PzlkJzVEbrsFn2+SSSkDFVeeDk1SHZGQKLVRSKU
 GxzOMzh7N9caQ6NEtOZZDRPj2g==
X-Google-Smtp-Source: ABdhPJxhsJZ1WmaJpfFVSu3c5byBLBJQj0fw3A/MOFntxDRzClE0Z7PzQ7TKTjDsmo4lmTzouUTzCw==
X-Received: by 2002:a2e:9211:: with SMTP id k17mr39473591ljg.400.1641429783209; 
 Wed, 05 Jan 2022 16:43:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 16:43:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Subject: [PATCH 1/4] drm/msm: unify MDSS drivers
Date: Thu,  6 Jan 2022 03:42:54 +0300
Message-Id: <20220106004257.451572-2-dmitry.baryshkov@linaro.org>
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

MDP5 and DPU1 both provide the driver handling the MDSS region, which
handles the irq domain and (incase of DPU1) adds some init for the UBWC
controller. Unify those two pieces of code into a common driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------------
 drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   3 +-
 .../msm/{disp/dpu1/dpu_mdss.c => msm_mdss.c}  | 162 ++++++-----
 5 files changed, 99 insertions(+), 325 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_mdss.c => msm_mdss.c} (57%)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index a44abf0a7660..5ad831834dd1 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -42,7 +42,6 @@ msm-y := \
 	disp/mdp5/mdp5_crtc.o \
 	disp/mdp5/mdp5_encoder.o \
 	disp/mdp5/mdp5_irq.o \
-	disp/mdp5/mdp5_mdss.o \
 	disp/mdp5/mdp5_kms.o \
 	disp/mdp5/mdp5_pipe.o \
 	disp/mdp5/mdp5_mixer.o \
@@ -67,7 +66,6 @@ msm-y := \
 	disp/dpu1/dpu_hw_util.o \
 	disp/dpu1/dpu_hw_vbif.o \
 	disp/dpu1/dpu_kms.o \
-	disp/dpu1/dpu_mdss.o \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
@@ -87,6 +85,7 @@ msm-y := \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
 	msm_iommu.o \
+	msm_mdss.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
deleted file mode 100644
index b3f79c2277e9..000000000000
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ /dev/null
@@ -1,252 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/irqdomain.h>
-#include <linux/irq.h>
-
-#include "msm_drv.h"
-#include "mdp5_kms.h"
-
-#define to_mdp5_mdss(x) container_of(x, struct mdp5_mdss, base)
-
-struct mdp5_mdss {
-	struct msm_mdss base;
-
-	void __iomem *mmio, *vbif;
-
-	struct clk *ahb_clk;
-	struct clk *axi_clk;
-	struct clk *vsync_clk;
-
-	struct {
-		volatile unsigned long enabled_mask;
-		struct irq_domain *domain;
-	} irqcontroller;
-};
-
-static inline void mdss_write(struct mdp5_mdss *mdp5_mdss, u32 reg, u32 data)
-{
-	msm_writel(data, mdp5_mdss->mmio + reg);
-}
-
-static inline u32 mdss_read(struct mdp5_mdss *mdp5_mdss, u32 reg)
-{
-	return msm_readl(mdp5_mdss->mmio + reg);
-}
-
-static irqreturn_t mdss_irq(int irq, void *arg)
-{
-	struct mdp5_mdss *mdp5_mdss = arg;
-	u32 intr;
-
-	intr = mdss_read(mdp5_mdss, REG_MDSS_HW_INTR_STATUS);
-
-	VERB("intr=%08x", intr);
-
-	while (intr) {
-		irq_hw_number_t hwirq = fls(intr) - 1;
-
-		generic_handle_domain_irq(mdp5_mdss->irqcontroller.domain, hwirq);
-		intr &= ~(1 << hwirq);
-	}
-
-	return IRQ_HANDLED;
-}
-
-/*
- * interrupt-controller implementation, so sub-blocks (MDP/HDMI/eDP/DSI/etc)
- * can register to get their irq's delivered
- */
-
-#define VALID_IRQS  (MDSS_HW_INTR_STATUS_INTR_MDP | \
-		MDSS_HW_INTR_STATUS_INTR_DSI0 | \
-		MDSS_HW_INTR_STATUS_INTR_DSI1 | \
-		MDSS_HW_INTR_STATUS_INTR_HDMI | \
-		MDSS_HW_INTR_STATUS_INTR_EDP)
-
-static void mdss_hw_mask_irq(struct irq_data *irqd)
-{
-	struct mdp5_mdss *mdp5_mdss = irq_data_get_irq_chip_data(irqd);
-
-	smp_mb__before_atomic();
-	clear_bit(irqd->hwirq, &mdp5_mdss->irqcontroller.enabled_mask);
-	smp_mb__after_atomic();
-}
-
-static void mdss_hw_unmask_irq(struct irq_data *irqd)
-{
-	struct mdp5_mdss *mdp5_mdss = irq_data_get_irq_chip_data(irqd);
-
-	smp_mb__before_atomic();
-	set_bit(irqd->hwirq, &mdp5_mdss->irqcontroller.enabled_mask);
-	smp_mb__after_atomic();
-}
-
-static struct irq_chip mdss_hw_irq_chip = {
-	.name		= "mdss",
-	.irq_mask	= mdss_hw_mask_irq,
-	.irq_unmask	= mdss_hw_unmask_irq,
-};
-
-static int mdss_hw_irqdomain_map(struct irq_domain *d, unsigned int irq,
-				 irq_hw_number_t hwirq)
-{
-	struct mdp5_mdss *mdp5_mdss = d->host_data;
-
-	if (!(VALID_IRQS & (1 << hwirq)))
-		return -EPERM;
-
-	irq_set_chip_and_handler(irq, &mdss_hw_irq_chip, handle_level_irq);
-	irq_set_chip_data(irq, mdp5_mdss);
-
-	return 0;
-}
-
-static const struct irq_domain_ops mdss_hw_irqdomain_ops = {
-	.map = mdss_hw_irqdomain_map,
-	.xlate = irq_domain_xlate_onecell,
-};
-
-
-static int mdss_irq_domain_init(struct mdp5_mdss *mdp5_mdss)
-{
-	struct device *dev = mdp5_mdss->base.dev;
-	struct irq_domain *d;
-
-	d = irq_domain_add_linear(dev->of_node, 32, &mdss_hw_irqdomain_ops,
-				  mdp5_mdss);
-	if (!d) {
-		DRM_DEV_ERROR(dev, "mdss irq domain add failed\n");
-		return -ENXIO;
-	}
-
-	mdp5_mdss->irqcontroller.enabled_mask = 0;
-	mdp5_mdss->irqcontroller.domain = d;
-
-	return 0;
-}
-
-static int mdp5_mdss_enable(struct msm_mdss *mdss)
-{
-	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
-	DBG("");
-
-	clk_prepare_enable(mdp5_mdss->ahb_clk);
-	clk_prepare_enable(mdp5_mdss->axi_clk);
-	clk_prepare_enable(mdp5_mdss->vsync_clk);
-
-	return 0;
-}
-
-static int mdp5_mdss_disable(struct msm_mdss *mdss)
-{
-	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
-	DBG("");
-
-	clk_disable_unprepare(mdp5_mdss->vsync_clk);
-	clk_disable_unprepare(mdp5_mdss->axi_clk);
-	clk_disable_unprepare(mdp5_mdss->ahb_clk);
-
-	return 0;
-}
-
-static int msm_mdss_get_clocks(struct mdp5_mdss *mdp5_mdss)
-{
-	struct platform_device *pdev =
-			to_platform_device(mdp5_mdss->base.dev);
-
-	mdp5_mdss->ahb_clk = msm_clk_get(pdev, "iface");
-	if (IS_ERR(mdp5_mdss->ahb_clk))
-		mdp5_mdss->ahb_clk = NULL;
-
-	mdp5_mdss->axi_clk = msm_clk_get(pdev, "bus");
-	if (IS_ERR(mdp5_mdss->axi_clk))
-		mdp5_mdss->axi_clk = NULL;
-
-	mdp5_mdss->vsync_clk = msm_clk_get(pdev, "vsync");
-	if (IS_ERR(mdp5_mdss->vsync_clk))
-		mdp5_mdss->vsync_clk = NULL;
-
-	return 0;
-}
-
-static void mdp5_mdss_destroy(struct msm_mdss *mdss)
-{
-	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
-
-	if (!mdp5_mdss)
-		return;
-
-	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
-	mdp5_mdss->irqcontroller.domain = NULL;
-
-	pm_runtime_disable(mdss->dev);
-}
-
-static const struct msm_mdss_funcs mdss_funcs = {
-	.enable	= mdp5_mdss_enable,
-	.disable = mdp5_mdss_disable,
-	.destroy = mdp5_mdss_destroy,
-};
-
-int mdp5_mdss_init(struct platform_device *pdev)
-{
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct mdp5_mdss *mdp5_mdss;
-	int ret;
-
-	DBG("");
-
-	if (!of_device_is_compatible(pdev->dev.of_node, "qcom,mdss"))
-		return 0;
-
-	mdp5_mdss = devm_kzalloc(&pdev->dev, sizeof(*mdp5_mdss), GFP_KERNEL);
-	if (!mdp5_mdss) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	mdp5_mdss->base.dev = &pdev->dev;
-
-	mdp5_mdss->mmio = msm_ioremap(pdev, "mdss_phys", "MDSS");
-	if (IS_ERR(mdp5_mdss->mmio)) {
-		ret = PTR_ERR(mdp5_mdss->mmio);
-		goto fail;
-	}
-
-	mdp5_mdss->vbif = msm_ioremap(pdev, "vbif_phys", "VBIF");
-	if (IS_ERR(mdp5_mdss->vbif)) {
-		ret = PTR_ERR(mdp5_mdss->vbif);
-		goto fail;
-	}
-
-	ret = msm_mdss_get_clocks(mdp5_mdss);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get clocks: %d\n", ret);
-		goto fail;
-	}
-
-	ret = devm_request_irq(&pdev->dev, platform_get_irq(pdev, 0),
-			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to init irq: %d\n", ret);
-		goto fail;
-	}
-
-	ret = mdss_irq_domain_init(mdp5_mdss);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to init sub-block irqs: %d\n", ret);
-		goto fail;
-	}
-
-	mdp5_mdss->base.funcs = &mdss_funcs;
-	priv->mdss = &mdp5_mdss->base;
-
-	pm_runtime_enable(&pdev->dev);
-
-	return 0;
-fail:
-	return ret;
-}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1ba3f29a874e..f2a0dc46b1f4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1413,10 +1413,10 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	switch (get_mdp_ver(pdev)) {
 	case KMS_MDP5:
-		ret = mdp5_mdss_init(pdev);
+		ret = msm_mdss_init(pdev, true);
 		break;
 	case KMS_DPU:
-		ret = dpu_mdss_init(pdev);
+		ret = msm_mdss_init(pdev, false);
 		break;
 	default:
 		ret = 0;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2a4f0526cb98..2459ba479caf 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -212,8 +212,7 @@ struct msm_mdss {
 	const struct msm_mdss_funcs *funcs;
 };
 
-int mdp5_mdss_init(struct platform_device *dev);
-int dpu_mdss_init(struct platform_device *dev);
+int msm_mdss_init(struct platform_device *pdev, bool mdp5);
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
similarity index 57%
rename from drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
rename to drivers/gpu/drm/msm/msm_mdss.c
index 31d898ef1866..e8e7db49b7b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -7,7 +7,12 @@
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
-#include "dpu_kms.h"
+
+#include "msm_drv.h"
+#include "msm_kms.h"
+
+/* for DPU_HW_* defines */
+#include "disp/dpu1/dpu_hw_catalog.h"
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
 
@@ -18,23 +23,18 @@
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
 
-/* Max BW defined in KBps */
-#define MAX_BW				6800000
-
-struct dpu_irq_controller {
-	unsigned long enabled_mask;
-	struct irq_domain *domain;
-};
-
 struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	int num_clocks;
-	struct dpu_irq_controller irq_controller;
+	struct {
+		unsigned long enabled_mask;
+		struct irq_domain *domain;
+	} irq_controller;
 };
 
-static void dpu_mdss_irq(struct irq_desc *desc)
+static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -62,7 +62,7 @@ static void dpu_mdss_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void dpu_mdss_irq_mask(struct irq_data *irqd)
+static void msm_mdss_irq_mask(struct irq_data *irqd)
 {
 	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
 
@@ -73,7 +73,7 @@ static void dpu_mdss_irq_mask(struct irq_data *irqd)
 	smp_mb__after_atomic();
 }
 
-static void dpu_mdss_irq_unmask(struct irq_data *irqd)
+static void msm_mdss_irq_unmask(struct irq_data *irqd)
 {
 	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
 
@@ -84,30 +84,31 @@ static void dpu_mdss_irq_unmask(struct irq_data *irqd)
 	smp_mb__after_atomic();
 }
 
-static struct irq_chip dpu_mdss_irq_chip = {
+static struct irq_chip msm_mdss_irq_chip = {
 	.name = "dpu_mdss",
-	.irq_mask = dpu_mdss_irq_mask,
-	.irq_unmask = dpu_mdss_irq_unmask,
+	.irq_mask = msm_mdss_irq_mask,
+	.irq_unmask = msm_mdss_irq_unmask,
 };
 
-static struct lock_class_key dpu_mdss_lock_key, dpu_mdss_request_key;
+static struct lock_class_key msm_mdss_lock_key, msm_mdss_request_key;
 
-static int dpu_mdss_irqdomain_map(struct irq_domain *domain,
+static int msm_mdss_irqdomain_map(struct irq_domain *domain,
 		unsigned int irq, irq_hw_number_t hwirq)
 {
 	struct dpu_mdss *dpu_mdss = domain->host_data;
 
-	irq_set_lockdep_class(irq, &dpu_mdss_lock_key, &dpu_mdss_request_key);
-	irq_set_chip_and_handler(irq, &dpu_mdss_irq_chip, handle_level_irq);
+	irq_set_lockdep_class(irq, &msm_mdss_lock_key, &msm_mdss_request_key);
+	irq_set_chip_and_handler(irq, &msm_mdss_irq_chip, handle_level_irq);
+
 	return irq_set_chip_data(irq, dpu_mdss);
 }
 
-static const struct irq_domain_ops dpu_mdss_irqdomain_ops = {
-	.map = dpu_mdss_irqdomain_map,
+static const struct irq_domain_ops msm_mdss_irqdomain_ops = {
+	.map = msm_mdss_irqdomain_map,
 	.xlate = irq_domain_xlate_onecell,
 };
 
-static int _dpu_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
+static int _msm_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
 {
 	struct device *dev;
 	struct irq_domain *domain;
@@ -115,9 +116,9 @@ static int _dpu_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
 	dev = dpu_mdss->base.dev;
 
 	domain = irq_domain_add_linear(dev->of_node, 32,
-			&dpu_mdss_irqdomain_ops, dpu_mdss);
+			&msm_mdss_irqdomain_ops, dpu_mdss);
 	if (!domain) {
-		DPU_ERROR("failed to add irq_domain\n");
+		DRM_ERROR("failed to add irq_domain\n");
 		return -EINVAL;
 	}
 
@@ -127,21 +128,14 @@ static int _dpu_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
 	return 0;
 }
 
-static void _dpu_mdss_irq_domain_fini(struct dpu_mdss *dpu_mdss)
-{
-	if (dpu_mdss->irq_controller.domain) {
-		irq_domain_remove(dpu_mdss->irq_controller.domain);
-		dpu_mdss->irq_controller.domain = NULL;
-	}
-}
-static int dpu_mdss_enable(struct msm_mdss *mdss)
+static int msm_mdss_enable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	int ret;
 
 	ret = clk_bulk_prepare_enable(dpu_mdss->num_clocks, dpu_mdss->clocks);
 	if (ret) {
-		DPU_ERROR("clock enable failed, ret:%d\n", ret);
+		DRM_ERROR("clock enable failed, ret:%d\n", ret);
 		return ret;
 	}
 
@@ -171,7 +165,7 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 	return ret;
 }
 
-static int dpu_mdss_disable(struct msm_mdss *mdss)
+static int msm_mdss_disable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 
@@ -180,7 +174,7 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
 	return 0;
 }
 
-static void dpu_mdss_destroy(struct msm_mdss *mdss)
+static void msm_mdss_destroy(struct msm_mdss *mdss)
 {
 	struct platform_device *pdev = to_platform_device(mdss->dev);
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
@@ -188,22 +182,64 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
 
 	pm_runtime_suspend(mdss->dev);
 	pm_runtime_disable(mdss->dev);
-	_dpu_mdss_irq_domain_fini(dpu_mdss);
+	irq_domain_remove(dpu_mdss->irq_controller.domain);
+	dpu_mdss->irq_controller.domain = NULL;
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
-
-	if (dpu_mdss->mmio)
-		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
-	dpu_mdss->mmio = NULL;
 }
 
 static const struct msm_mdss_funcs mdss_funcs = {
-	.enable	= dpu_mdss_enable,
-	.disable = dpu_mdss_disable,
-	.destroy = dpu_mdss_destroy,
+	.enable	= msm_mdss_enable,
+	.disable = msm_mdss_disable,
+	.destroy = msm_mdss_destroy,
 };
 
-int dpu_mdss_init(struct platform_device *pdev)
+/*
+ * MDP5 MDSS uses at most three specified clocks.
+ */
+#define MDP5_MDSS_NUM_CLOCKS 3
+int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
+{
+	struct clk_bulk_data *bulk;
+	struct clk *clk;
+	int num_clocks = 0;
+
+	if (!pdev)
+		return -EINVAL;
+
+	bulk = devm_kcalloc(&pdev->dev, MDP5_MDSS_NUM_CLOCKS, sizeof(struct clk_bulk_data), GFP_KERNEL);
+	if (!bulk)
+		return -ENOMEM;
+
+	/* We ignore all the errors except deferral: typically they mean that the clock is not provided in the dts. */
+	clk = msm_clk_get(pdev, "iface");
+	if (!IS_ERR(clk)) {
+		bulk[num_clocks].id = "iface";
+		bulk[num_clocks].clk = clk;
+		num_clocks++;
+	} else if (clk == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	clk = msm_clk_get(pdev, "bus");
+	if (!IS_ERR(clk)) {
+		bulk[num_clocks].id = "bus";
+		bulk[num_clocks].clk = clk;
+		num_clocks++;
+	} else if (clk == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	clk = msm_clk_get(pdev, "vsync");
+	if (!IS_ERR(clk)) {
+		bulk[num_clocks].id = "vsync";
+		bulk[num_clocks].clk = clk;
+		num_clocks++;
+	} else if (clk == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	return num_clocks;
+}
+
+int msm_mdss_init(struct platform_device *pdev, bool mdp5)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_mdss *dpu_mdss;
@@ -214,33 +250,34 @@ int dpu_mdss_init(struct platform_device *pdev)
 	if (!dpu_mdss)
 		return -ENOMEM;
 
-	dpu_mdss->mmio = msm_ioremap(pdev, "mdss", "mdss");
+	dpu_mdss->mmio = msm_ioremap(pdev, mdp5 ? "mdss_phys" : "mdss", "mdss");
 	if (IS_ERR(dpu_mdss->mmio))
 		return PTR_ERR(dpu_mdss->mmio);
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
+	if (mdp5)
+		ret = mdp5_mdss_parse_clock(pdev, &dpu_mdss->clocks);
+	else
+		ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
 	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		goto clk_parse_err;
+		DRM_ERROR("failed to parse clocks, ret=%d\n", ret);
+		return ret;
 	}
 	dpu_mdss->num_clocks = ret;
 
 	dpu_mdss->base.dev = &pdev->dev;
 	dpu_mdss->base.funcs = &mdss_funcs;
 
-	ret = _dpu_mdss_irq_domain_add(dpu_mdss);
-	if (ret)
-		goto irq_domain_error;
-
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto irq_error;
-	}
+	if (irq < 0)
+		return irq;
 
-	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
+	ret = _msm_mdss_irq_domain_add(dpu_mdss);
+	if (ret)
+		return ret;
+
+	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
 					 dpu_mdss);
 
 	priv->mdss = &dpu_mdss->base;
@@ -248,13 +285,4 @@ int dpu_mdss_init(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-
-irq_error:
-	_dpu_mdss_irq_domain_fini(dpu_mdss);
-irq_domain_error:
-clk_parse_err:
-	if (dpu_mdss->mmio)
-		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
-	dpu_mdss->mmio = NULL;
-	return ret;
 }
-- 
2.34.1

