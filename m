Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B428E710B80
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AB710E13F;
	Thu, 25 May 2023 11:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337E10E6B3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:53:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E43E966059A5;
 Thu, 25 May 2023 12:53:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685015585;
 bh=WbEXo3O6eq8DNbznstqMaJK9I2AdQzGF7reesP/HlpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ObeEAKew/EV4k/4CVn0x6SQOFrwwbDVAZ+FzbB0+wvCKGDBeg/9srQrx0mOXI+ckk
 5POE11Zgw03CbyOWK3pRg5RpWyU0uLBALigsVQ1Dr63r8pCbG24+5HACVAyjRiKwWa
 +6XxDcIxkgnIEvkLe3u4APBEPIjTaaF8CPTnFkEAyTOt1dbh0AWwOfFjGuWDwpDlNi
 8aKtkrokLq701yCDGSKAV79QoO9IlZcGaFEBUFZP1hqLz8ETJvLP7vV+NyJtVRryUX
 4J6axsXdvNOStwOzSEONcc3M9M6ulB/qPzNREHy4RS5DMc9BRehDp5DE674Q6skiHT
 UWM7nCvMnHhuQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 2/3] phy: mediatek: mipi-dsi: Use devm variant for
 of_clk_add_hw_provider()
Date: Thu, 25 May 2023 13:52:57 +0200
Message-Id: <20230525115258.90091-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
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
Cc: kishon@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to devm_of_clk_add_hw_provider() in the probe function: this
also allows to entirely remove the .remove_new() callback, as its
only task was to unregister the clock provider.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 362145198ff5..4e75c34c819b 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -176,12 +176,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mtk_mipi_tx_get_calibration_datal(mipi_tx);
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, &mipi_tx->pll_hw);
-}
-
-static void mtk_mipi_tx_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mipi_tx->pll_hw);
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
@@ -197,7 +192,6 @@ MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
 static struct platform_driver mtk_mipi_tx_driver = {
 	.probe = mtk_mipi_tx_probe,
-	.remove_new = mtk_mipi_tx_remove,
 	.driver = {
 		.name = "mediatek-mipi-tx",
 		.of_match_table = mtk_mipi_tx_match,
-- 
2.40.1

