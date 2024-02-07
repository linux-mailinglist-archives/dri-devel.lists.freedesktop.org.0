Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB3684CD50
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1A2113290;
	Wed,  7 Feb 2024 14:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VroG5qhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028A0113282
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707317600;
 bh=FRESMp3mK4eodAj8xjfDcef8szgxRgcVu5YmFtftXyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VroG5qhjK5El2FkUj+KywtRKuBWVctYI+DdkC+kdw1yTTUFtRP3BMBoNoUI2uJGVg
 TwazTRF6twnzxDyOjVznkqW8lEOmPZwqjfCPAJU0fUbIhOMiJfyK2ASmarHPElURcc
 LhI1AKR1h4tRNiflQpQprGZ1BLY8VQ6f8JQfxAUS4ZHMMBHE5ZOR5fDkFbDyf/M1EB
 1YulZ23GS14fQplL/L4f3gLUdaddrhYC0ItPEAWKe6YAQPuuU3TS12PHHb3c5pAiXW
 epvCD6kNFPb+0ijwkRPmIVfMEVou3oZ+jgCn4+r0azEdQeaJ7lIZxnoVw/fAtRjeQA
 /ayr828V0Pmkw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 034A03782059;
 Wed,  7 Feb 2024 14:53:19 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 6/9] drm/mediatek: dsi: Register DSI host after acquiring
 clocks and PHY
Date: Wed,  7 Feb 2024 15:53:04 +0100
Message-ID: <20240207145307.1626009-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
References: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
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

Registering the dsi host with its ops before getting dsi->regs is
simply wrong: even though there's nothing (for now) asynchronously
calling those ops before the end of the probe function, installing
ops that are using iospace(s) and clocks before even initializing
those is too fragile.

Register the DSI host after getting clocks, iospace and PHY.
This wil also allow to simplify the error paths in a later commit.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 52758cab0abf..b3dd6251d611 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1114,14 +1114,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	dsi->host.ops = &mtk_dsi_ops;
-	dsi->host.dev = dev;
-	ret = mipi_dsi_host_register(&dsi->host);
-	if (ret < 0) {
-		dev_err(dev, "failed to register DSI host: %d\n", ret);
-		return ret;
-	}
-
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
@@ -1130,7 +1122,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->digital_clk = devm_clk_get(dev, "digital");
@@ -1139,14 +1131,14 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get digital clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->hs_clk = devm_clk_get(dev, "hs");
 	if (IS_ERR(dsi->hs_clk)) {
 		ret = PTR_ERR(dsi->hs_clk);
 		dev_err(dev, "Failed to get hs clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1154,20 +1146,28 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
 		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dphy");
 	if (IS_ERR(dsi->phy)) {
 		ret = PTR_ERR(dsi->phy);
 		dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0) {
 		ret = irq_num;
-		goto err_unregister_host;
+		return ret;
+	}
+
+	dsi->host.ops = &mtk_dsi_ops;
+	dsi->host.dev = dev;
+	ret = mipi_dsi_host_register(&dsi->host);
+	if (ret < 0) {
+		dev_err(dev, "failed to register DSI host: %d\n", ret);
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-- 
2.43.0

