Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C184B470
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11726112B19;
	Tue,  6 Feb 2024 12:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jJ/IENCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F0112B18
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707221279;
 bh=vdKksTE0KMJx45MY9qZ2GtileIIp3RIq9EHUTXskHDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJ/IENCda0kWOSqR5sOuVwPK5hBAPmBj/MWKcQD2ZQ+N16lBYKRrhp1IPPdyWcViN
 mJ6sLpbCfXiQW8fTyzRhxO20NlIosNtx53MkJ35wIjP8OgkGAerifmaOAKHq/KG9fE
 uRAUKOnz5g8l/MXVozjwZSsoEU3Ku5iDlyoWq/CZkpqHD6FI4b5Op4kCrIPLxyH8pq
 fVUV51/+Fu7WEZpXW/9h5ZxrJeuqKGtvtySLonbsUOm0KrOxDyl0GPfc0pErU3b6se
 s1BB6wZfl5Kw/w/2PnXCer9Dg6hN1tGO1OC6yo+IgLntlyp+Og+5wNXqvWVWVW21Fc
 xExJU+CcVALHg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD41D378207E;
 Tue,  6 Feb 2024 12:07:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v4 7/9] drm/mediatek: dsi: Simplify with dev_err_probe and
 remove gotos
Date: Tue,  6 Feb 2024 13:07:46 +0100
Message-ID: <20240206120748.136610-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the functions that are called in the probe callback are
devm managed, or all but mipi_dsi_host_register(): simplify the probe
function's error paths with dev_err_probe() and remove the lonely
instance of `goto err_unregister_host` by just directly calling the
mipi_dsi_host_unregister() function in the devm_request_irq() error
path, allowing to also remove the same label.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 60 +++++++++---------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 6ee01626d55c..8d407d71e9db 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1117,64 +1117,44 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
-	if (IS_ERR(dsi->engine_clk)) {
-		ret = PTR_ERR(dsi->engine_clk);
+	if (IS_ERR(dsi->engine_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->engine_clk),
+				     "Failed to get engine clock\n");
 
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-		return ret;
-	}
 
 	dsi->digital_clk = devm_clk_get(dev, "digital");
-	if (IS_ERR(dsi->digital_clk)) {
-		ret = PTR_ERR(dsi->digital_clk);
-
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get digital clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->digital_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->digital_clk),
+				     "Failed to get digital clock\n");
 
 	dsi->hs_clk = devm_clk_get(dev, "hs");
-	if (IS_ERR(dsi->hs_clk)) {
-		ret = PTR_ERR(dsi->hs_clk);
-		dev_err(dev, "Failed to get hs clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->hs_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->hs_clk), "Failed to get hs clock\n");
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dsi->regs = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(dsi->regs)) {
-		ret = PTR_ERR(dsi->regs);
-		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->regs))
+		return dev_err_probe(dev, PTR_ERR(dsi->regs), "Failed to ioremap memory\n");
 
 	dsi->phy = devm_phy_get(dev, "dphy");
-	if (IS_ERR(dsi->phy)) {
-		ret = PTR_ERR(dsi->phy);
-		dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->phy))
+		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-DPHY\n");
 
 	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0) {
-		ret = irq_num;
-		return ret;
-	}
+	if (irq_num < 0)
+		return irq_num;
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
 	ret = mipi_dsi_host_register(&dsi->host);
-	if (ret < 0) {
-		dev_err(dev, "failed to register DSI host: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
 	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
 			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request mediatek dsi irq\n");
-		goto err_unregister_host;
+		mipi_dsi_host_unregister(&dsi->host);
+		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 	}
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
@@ -1186,10 +1166,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	return 0;
-
-err_unregister_host:
-	mipi_dsi_host_unregister(&dsi->host);
-	return ret;
 }
 
 static void mtk_dsi_remove(struct platform_device *pdev)
-- 
2.43.0

