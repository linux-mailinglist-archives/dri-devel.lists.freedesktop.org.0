Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C4758F92
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4EB10E40E;
	Wed, 19 Jul 2023 07:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4641C10E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:51:10 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 658B36607073;
 Wed, 19 Jul 2023 08:51:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689753069;
 bh=P2asjJa8ZKRcMIUubSWXLd+81XU6yi5cTxDjeHRxCpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DncmQ/aNBVXHlmrzBpAM82GdzdA2DMrDqjYopTIBEmYgyARJlFGvTn/Ime0aVDrCS
 52fCG9RqqsAVUBD3ywVmGD7sW/FGzV3czEIuitOcXv26U7SzoKFCai/0u6jBxmqfPn
 druIeZpB2G5UHbaDrrwGd5ATTEsxWNL4Cik4OJkTjGHAE0b0YGZ9MSmqemTvSpeg6X
 E/wZf10fti0KN7uyVA5IYq5VgFSlcDBy+dqiZLtm0/qCx4kQddgc8tkdBlLvcdN/PD
 F/ZHy9JdaBKmzu2xQ/qQw0K94SpcW2KZIroHUd6ZgUGEMFugc1eQ45s2M8t/KE0RR8
 kvCmRYPjBPBcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 3/6] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Date: Wed, 19 Jul 2023 09:50:53 +0200
Message-Id: <20230719075056.72178-4-angelogioacchino.delregno@collabora.com>
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

Function drm_of_find_panel_or_bridge() is marked as deprecated: since
the usage of that in this driver exactly corresponds to the new function
devm_drm_of_get_bridge(), switch to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 03a2b900bb50..e9c5a0f44537 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1063,10 +1063,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq <= 0)
 		return -EINVAL;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  NULL, &dpi->next_bridge);
-	if (ret)
-		return ret;
+	dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dpi->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(dpi->next_bridge),
+				     "Failed to get bridge\n");
 
 	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
@@ -1089,8 +1089,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 static int mtk_dpi_remove(struct platform_device *pdev)
 {
-	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
 
 	return 0;
-- 
2.40.1

