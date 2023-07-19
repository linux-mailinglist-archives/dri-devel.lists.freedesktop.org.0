Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D84758F97
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA510E412;
	Wed, 19 Jul 2023 07:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5977E10E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:51:09 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E2836607071;
 Wed, 19 Jul 2023 08:51:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689753068;
 bh=/guFaoIX4NI5OLZeiGkk3cUFsDGNGR4HcNgc6I/UWos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ljb+s1S6A8nO+QXVJGYqXNZhgvYVDxBP5cztZP78sAI6qJyRz19cr0+vozAQXFu5s
 vZXdUPEaK3xCVFUJrOZN0eBq1yxI3hJpqDHGTExl7i2YFMAqkAi3Ka0D59p6VbCHas
 Ye0UqOBfOAYNWJgGCPm9ZRwoFUEeT1aUgs0Oj7sgMbYvILT6GwN1+8v2S+0k0a297I
 S8YXqpUrkW++CJVmlRkb0m7ILU4AFrEAK/+QTLL8VGvbDd7HBhInzlB9zmRC0p5Uqm
 8lJ0AlnsibrBCL9mZgJjUqULuAxdPy7RuuWJCtIRzONnhyz4Uv7v25uJ4C8HvyyHVk
 aA8YxemF+Eo5A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 2/6] drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
Date: Wed, 19 Jul 2023 09:50:52 +0200
Message-Id: <20230719075056.72178-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
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
Cc: fshao@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dev_err_probe() across the entire probe function of this driver
to shrink the size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 44 ++++++++++--------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 74068aa70e0c..03a2b900bb50 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1040,38 +1040,24 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(dpi->regs)) {
-		ret = PTR_ERR(dpi->regs);
-		dev_err(dev, "Failed to ioremap mem resource: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dpi->regs))
+		return dev_err_probe(dev, PTR_ERR(dpi->regs),
+				     "Failed to ioremap mem resource\n");
 
 	dpi->engine_clk = devm_clk_get(dev, "engine");
-	if (IS_ERR(dpi->engine_clk)) {
-		ret = PTR_ERR(dpi->engine_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->engine_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->engine_clk),
+				     "Failed to get engine clock\n");
 
 	dpi->pixel_clk = devm_clk_get(dev, "pixel");
-	if (IS_ERR(dpi->pixel_clk)) {
-		ret = PTR_ERR(dpi->pixel_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get pixel clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->pixel_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->pixel_clk),
+				     "Failed to get pixel clock\n");
 
 	dpi->tvd_clk = devm_clk_get(dev, "pll");
-	if (IS_ERR(dpi->tvd_clk)) {
-		ret = PTR_ERR(dpi->tvd_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->tvd_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->tvd_clk),
+				     "Failed to get tvdpll clock\n");
 
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
@@ -1095,10 +1081,8 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = component_add(dev, &mtk_dpi_component_ops);
-	if (ret) {
-		dev_err(dev, "Failed to add component: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component.\n");
 
 	return 0;
 }
-- 
2.40.1

