Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C239B74813B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF2E10E347;
	Wed,  5 Jul 2023 09:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F2410E344
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:42:42 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A11F06606FAD;
 Wed,  5 Jul 2023 10:42:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688550161;
 bh=2CKJ19pHwidqUmOLzKhHpywJygNOPNiIaRUrct7Xigc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EgADnXK70QQ1h8mCVxfZY6Vu6r7W8sgwWROlGWazx5WFfdEECmc0QBP12PuDIa7EL
 kItZC3ivYX+xf/hpVpHoBAnC5d6nhAg4TOfzIXAm/6EJN5XCv9+KxUhufvjjh+9akg
 GPg1LIpoEfP/7jqjHqZMTeZ3qMcuUnPTU1zWQbF/xmT512VY/e3XNn5OXohEAxpJ7s
 fsz+xQPWLF20i3EW4sZiIQIBaeUB54weasEnAN1N+ma+eblRYdqyVBSajlLKW14K25
 47Yq744AiCcMQuJHnW9BKVWJhmNyYsi5I2m9rKKJFXXWZpel3bI6MEG09By/NgPYQs
 hklXMo+wnOzAA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 2/3] drm/mediatek: Use dev_err_probe() in probe functions
Date: Wed,  5 Jul 2023 11:42:31 +0200
Message-Id: <20230705094232.75904-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
References: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert all instances of dev_err() -> return to dev_err_probe() and
where it makes sense to, change instances of `return ret` at the end
of probe functions to `return 0`, as errors are returned earlier.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c            | 26 +++++------------
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       | 16 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 16 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_color.c     | 17 +++++------
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 16 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 25 +++++++---------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 23 ++++++---------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  6 ++--
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      | 29 +++++++------------
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 18 +++++-------
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 18 +++++-------
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 14 +++------
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       | 12 +++-----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 18 +++++-------
 14 files changed, 96 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index c3b89a5c138a..56b3917801d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -196,18 +196,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	spin_lock_init(&cec->lock);
 
 	cec->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(cec->regs)) {
-		ret = PTR_ERR(cec->regs);
-		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cec->regs))
+		return dev_err_probe(dev, PTR_ERR(cec->regs), "Failed to ioremap cec\n");
 
 	cec->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(cec->clk)) {
-		ret = PTR_ERR(cec->clk);
-		dev_err(dev, "Failed to get cec clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cec->clk))
+		return dev_err_probe(dev, PTR_ERR(cec->clk), "Failed to get cec clock\n");
 
 	cec->irq = platform_get_irq(pdev, 0);
 	if (cec->irq < 0)
@@ -217,16 +211,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
 					mtk_cec_htplg_isr_thread,
 					IRQF_SHARED | IRQF_TRIGGER_LOW |
 					IRQF_ONESHOT, "hdmi hpd", dev);
-	if (ret) {
-		dev_err(dev, "Failed to register cec irq: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register cec irq\n");
 
 	ret = clk_prepare_enable(cec->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable cec clock: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable cec clock\n");
 
 	mtk_cec_htplg_irq_init(cec);
 	mtk_cec_htplg_irq_enable(cec);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index bd1d67a5baff..c60aa244de67 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -111,16 +111,12 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get aal clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get aal clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap aal\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap aal\n");
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
@@ -133,9 +129,9 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &mtk_disp_aal_component_ops);
 	if (ret)
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_aal_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 5cee84cce0be..77bc8ae7c536 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -166,16 +166,12 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get ccorr clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get ccorr clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap ccorr\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap ccorr\n");
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
@@ -188,9 +184,9 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &mtk_disp_ccorr_component_ops);
 	if (ret)
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_ccorr_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index e3816730ab51..0f5dcefc2742 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -104,16 +104,13 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get color clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get color clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap color\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap color\n");
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
@@ -125,9 +122,9 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &mtk_disp_color_component_ops);
 	if (ret)
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_color_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6ab67e6392c7..b09b203c613c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -270,16 +270,12 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get gamma clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get gamma clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap gamma\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap gamma\n");
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
@@ -292,9 +288,9 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 
 	ret = component_add(dev, &mtk_disp_gamma_component_ops);
 	if (ret)
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_gamma_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index ec4673448ad2..7f825bb07749 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -250,22 +250,17 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap merge\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap merge\n");
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get merge clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get merge clock\n");
 
 	priv->async_clk = devm_clk_get_optional(dev, "merge_async");
-	if (IS_ERR(priv->async_clk)) {
-		dev_err(dev, "failed to get merge async clock\n");
-		return PTR_ERR(priv->async_clk);
-	}
+	if (IS_ERR(priv->async_clk))
+		return dev_err_probe(dev, PTR_ERR(priv->async_clk),
+				     "failed to get merge_async clock\n");
 
 	if (priv->async_clk) {
 		priv->reset_ctl = devm_reset_control_get_optional_exclusive(dev, NULL);
@@ -287,10 +282,10 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_disp_merge_component_ops);
-	if (ret != 0)
-		dev_err(dev, "Failed to add component: %d\n", ret);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_merge_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b61ddfcd880c..1310b4b9d08c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -523,16 +523,13 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get ovl clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get ovl clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap ovl\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap ovl\n");
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
@@ -544,20 +541,18 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
-	if (ret < 0) {
-		dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
 
 	pm_runtime_enable(dev);
 
 	ret = component_add(dev, &mtk_disp_ovl_component_ops);
 	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_ovl_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c0a38f5217ee..1993b688befa 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -522,12 +522,12 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
-	if (ret != 0) {
+	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index dc8194734512..cfbc037a0f6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -326,16 +326,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get rdma clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get rdma clk\n");
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap rdma\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap rdma\n");
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
@@ -346,10 +343,8 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(dev->of_node,
 					   "mediatek,rdma-fifo-size",
 					   &priv->fifo_size);
-		if (ret) {
-			dev_err(dev, "Failed to get rdma fifo size\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to get rdma fifo size\n");
 	}
 
 	/* Disable and clear pending interrupts */
@@ -358,10 +353,8 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
-	if (ret < 0) {
-		dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
 
 	priv->data = of_device_get_match_data(dev);
 
@@ -372,10 +365,10 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
 	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mtk_disp_rdma_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 50a816a092bd..33b2477858f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1080,10 +1080,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
 	ret = mipi_dsi_host_register(&dsi->host);
-	if (ret < 0) {
-		dev_err(dev, "failed to register DSI host: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register DSI host\n");
 
 	dsi->driver_data = of_device_get_match_data(dev);
 
@@ -1091,8 +1089,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->engine_clk)) {
 		ret = PTR_ERR(dsi->engine_clk);
 
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to get engine clock\n");
 		goto err_unregister_host;
 	}
 
@@ -1100,29 +1097,28 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->digital_clk)) {
 		ret = PTR_ERR(dsi->digital_clk);
 
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get digital clock: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to get digital clock\n");
 		goto err_unregister_host;
 	}
 
 	dsi->hs_clk = devm_clk_get(dev, "hs");
 	if (IS_ERR(dsi->hs_clk)) {
 		ret = PTR_ERR(dsi->hs_clk);
-		dev_err(dev, "Failed to get hs clock: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to get hs clock\n");
 		goto err_unregister_host;
 	}
 
 	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
-		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to ioremap memory\n");
 		goto err_unregister_host;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dphy");
 	if (IS_ERR(dsi->phy)) {
 		ret = PTR_ERR(dsi->phy);
-		dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to get MIPI-DPHY\n");
 		goto err_unregister_host;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 73dc4da3ba3b..4a5bd5bb9d6e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -325,25 +325,23 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	if (priv->irq) {
 		ret = devm_request_irq(dev, priv->irq, mtk_ethdr_irq_handler,
 				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
-		if (ret < 0) {
-			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to request irq %d\n",
+					     priv->irq);
 	}
 
 	priv->reset_ctl = devm_reset_control_array_get_optional_exclusive(dev);
-	if (IS_ERR(priv->reset_ctl)) {
-		dev_err_probe(dev, PTR_ERR(priv->reset_ctl), "cannot get ethdr reset control\n");
-		return PTR_ERR(priv->reset_ctl);
-	}
+	if (IS_ERR(priv->reset_ctl))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_ctl),
+				     "cannot get ethdr reset control\n");
 
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_ethdr_component_ops);
 	if (ret)
-		dev_notice(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static int mtk_ethdr_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 77f55d2b5dd1..960e44fd80c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1431,19 +1431,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index e24154255960..288f41bf33a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -278,20 +278,16 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ddc->clk = devm_clk_get(dev, "ddc-i2c");
-	if (IS_ERR(ddc->clk)) {
-		dev_err(dev, "get ddc_clk failed: %p ,\n", ddc->clk);
-		return PTR_ERR(ddc->clk);
-	}
+	if (IS_ERR(ddc->clk))
+		return dev_err_probe(dev, PTR_ERR(ddc->clk), "get ddc_clk failed\n");
 
 	ddc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ddc->regs))
 		return PTR_ERR(ddc->regs);
 
 	ret = clk_prepare_enable(ddc->clk);
-	if (ret) {
-		dev_err(dev, "enable ddc clk failed!\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "enable ddc clk failed!\n");
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 0ededf7194b2..ae05d9660592 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -285,16 +285,12 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap rdma\n");
-		return PTR_ERR(priv->regs);
-	}
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap rdma\n");
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get rdma clk\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get rdma clk\n");
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
@@ -306,11 +302,11 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = component_add(dev, &mtk_mdp_rdma_component_ops);
-	if (ret != 0) {
+	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "Failed to add component: %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to add component\n");
 	}
-	return ret;
+	return 0;
 }
 
 static int mtk_mdp_rdma_remove(struct platform_device *pdev)
-- 
2.40.1

