Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC00A748139
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073A010E346;
	Wed,  5 Jul 2023 09:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A5710E34D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:42:41 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CDC7C6606FAB;
 Wed,  5 Jul 2023 10:42:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688550160;
 bh=ZopR5/5CLUfvAhpPxuKmPKApbf1MTb19aawmhBiLFHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZH5n++9W3j3zpR8sfHX/MjVEdcJh4+Pb1nBoYxm9U4Bq8wg9uG8cddBAheoylCEMm
 u2ndu0bRBjEj+8gtW4HOjnKuuT5QSHiLhyw5A6i2gXQjjp1mje0cs5nZrHAwr8B0A6
 1nIGz2N41dwuFslCtfLClFtUYS7Hl8qwQMoDpqt1uuR+NDBh4XdNvUgesYH1myHAB4
 wlVgu5U/DReKzlIqHgEuF8+SD7e1kpi8HIVqlo6XJzxJ0nAqag1SBHWTk71yF5i5ML
 nQUhg+KpmeDPHwvOssRz10UuBubhS71Gl8+vhjM5mE7KCxLruNCGvi0swwbN6HQykb
 Ex5f/NfINHiYg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 1/3] drm/mediatek: Use devm_platform_ioremap_resource()
Date: Wed,  5 Jul 2023 11:42:30 +0200
Message-Id: <20230705094232.75904-2-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of open coding calls to platform_get_resource() followed by
devm_ioremap_resource(), perform a single call to the helper
devm_platform_ioremap_resource().

Also, in order to drop the now useless struct resource pointer in
all of the probe functions, it was also necessary to remove a
dev_dbg() in mtk_hdmi_ddc.c that was printing the iospace start/end.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c        | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 3 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 4 +---
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 4 +---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 6 +-----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 4 +---
 13 files changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..c3b89a5c138a 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -195,8 +195,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cec);
 	spin_lock_init(&cec->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cec->regs = devm_ioremap_resource(dev, res);
+	cec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cec->regs)) {
 		ret = PTR_ERR(cec->regs);
 		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 8ddf7a97e583..bd1d67a5baff 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -104,7 +104,6 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_aal *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -117,8 +116,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap aal\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 1773379b2439..5cee84cce0be 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -159,7 +159,6 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ccorr *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -172,8 +171,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap ccorr\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index cac9206079e7..e3816730ab51 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -97,7 +97,6 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_color *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -110,8 +109,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap color\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bd530e603264..6ab67e6392c7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -263,7 +263,6 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_gamma *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -276,8 +275,7 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap gamma\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 6428b6203ffe..ec4673448ad2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -242,7 +242,6 @@ static const struct component_ops mtk_disp_merge_component_ops = {
 static int mtk_disp_merge_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct mtk_disp_merge *priv;
 	int ret;
 
@@ -250,8 +249,7 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap merge\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8f52cc1f3fba..b61ddfcd880c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -511,7 +511,6 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -529,8 +528,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index d4df17ad600a..dc8194734512 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -314,7 +314,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -332,8 +331,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 45535dc7970f..07d8a9d4b008 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1007,7 +1007,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_dpi *dpi;
-	struct resource *mem;
 	int ret;
 
 	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
@@ -1038,7 +1037,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 			dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
 		}
 	}
-	dpi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	dpi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpi->regs))
 		return dev_err_probe(dev, PTR_ERR(dpi->regs),
 				     "Failed to ioremap mem resource\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 19e2b042c9d5..50a816a092bd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1070,7 +1070,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct resource *regs;
 	int irq_num;
 	int ret;
 
@@ -1113,8 +1112,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(dev, regs);
+	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
 		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..77f55d2b5dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1428,7 +1428,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1474,8 +1473,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 4d39ea0a05ca..e24154255960 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -271,7 +271,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_hdmi_ddc *ddc;
-	struct resource *mem;
 	int ret;
 
 	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
@@ -284,8 +283,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 		return PTR_ERR(ddc->clk);
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ddc->regs = devm_ioremap_resource(&pdev->dev, mem);
+	ddc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ddc->regs))
 		return PTR_ERR(ddc->regs);
 
@@ -314,8 +312,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "ddc->adap: %p\n", &ddc->adap);
 	dev_dbg(dev, "ddc->clk: %p\n", ddc->clk);
-	dev_dbg(dev, "physical adr: %pa, end: %pa\n", &mem->start,
-		&mem->end);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index e06db6e56b5f..0ededf7194b2 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -277,7 +277,6 @@ static const struct component_ops mtk_mdp_rdma_component_ops = {
 static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct mtk_mdp_rdma *priv;
 	int ret = 0;
 
@@ -285,8 +284,7 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
-- 
2.40.1

