Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC3710B7D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3E10E0A3;
	Thu, 25 May 2023 11:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1375010E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:53:06 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 08ECC6605843;
 Thu, 25 May 2023 12:53:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685015584;
 bh=ibbIncxSMJ9OQRBCjzpd8XZcUis5nE1o0tS/1VouNis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hgEY88Cq9TMuHGJnoSIwneEqOlWQXeuUFHyfjBwGMLShM4ZxMaEipCQYdnpX19Kcj
 atkrdl1BZULCVCGBKYmRpBvr5osFZ4kGKrfi36Ntzkn693I+4ewyBu+Bwz8VVbWyy6
 OF2Z+O2Ux8N4aLdCk9dUPno9fyPtxy+KTRM8oktjrvMYJGRip8fl4lACWkRAXvNvdq
 hwqG4jwL0hDJ3W7kjZBMXy6miQqOmTSFTNh0cWKsS+0nwgxiQiFLVWBjH4hNmG6CrY
 cVnzdaqfPcjE/eEdRRD3wNgFxyGgezAmaXKswLGERw3bGBF0Q+HHDw+/7hMFRfx0DP
 JlpGK+Cp3n0Aw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 1/3] phy: mediatek: mipi-dsi: Convert to register clk_hw
Date: Thu, 25 May 2023 13:52:56 +0200
Message-Id: <20230525115258.90091-2-angelogioacchino.delregno@collabora.com>
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

Instead of registering a struct clk, directly register clk_hw: this
allows us to cleanup a pointer to struct clk from struct mtk_mipi_tx.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 13 ++++++-------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 526c05a4af5e..362145198ff5 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -36,7 +36,7 @@ static int mtk_mipi_tx_power_on(struct phy *phy)
 	int ret;
 
 	/* Power up core and enable PLL */
-	ret = clk_prepare_enable(mipi_tx->pll);
+	ret = clk_prepare_enable(mipi_tx->pll_hw.clk);
 	if (ret < 0)
 		return ret;
 
@@ -53,7 +53,7 @@ static int mtk_mipi_tx_power_off(struct phy *phy)
 	mipi_tx->driver_data->mipi_tx_disable_signal(phy);
 
 	/* Disable PLL and power down core */
-	clk_disable_unprepare(mipi_tx->pll);
+	clk_disable_unprepare(mipi_tx->pll_hw.clk);
 
 	return 0;
 }
@@ -158,9 +158,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
 
 	mipi_tx->pll_hw.init = &clk_init;
-	mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
-	if (IS_ERR(mipi_tx->pll))
-		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll), "Failed to register PLL\n");
+	ret = devm_clk_hw_register(dev, &mipi_tx->pll_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register PLL\n");
 
 	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
 	if (IS_ERR(phy))
@@ -176,8 +176,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mtk_mipi_tx_get_calibration_datal(mipi_tx);
 
-	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
-				   mipi_tx->pll);
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, &mipi_tx->pll_hw);
 }
 
 static void mtk_mipi_tx_remove(struct platform_device *pdev)
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 47b60b1a7226..0250c4a454e7 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -32,7 +32,6 @@ struct mtk_mipi_tx {
 	u32 rt_code[5];
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
-	struct clk *pll;
 };
 
 struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw);
-- 
2.40.1

