Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79EB758F8D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9759A10E40B;
	Wed, 19 Jul 2023 07:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09610E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:51:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D5D6A6607070;
 Wed, 19 Jul 2023 08:51:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689753067;
 bh=n4bzSjz/8ToatLkUrHwwNZNY341UFIC11J8xZSFamQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVm9nlsm7Q93D67X1+1cSOFc6xkeULgbJzUdCUPhr5LLjVwqs6hPTFnkancL7h/IH
 e38JSizfJc9RmGiUIb3+LsqCAwc/M0GhFCQZ9cM5oYhe4Zrl1vV2Dk2hdsiM8DEKd2
 lajRt6cmWVXGyLUc1jDVhFr8Ba8pw0XAxc1ZOdTQHCB81W8OW4MW9G2bvp+3DNrTNF
 Tw1hvo2MlLdOl89ZJj4gkdkfQVdAFx2QL7a/D+XpRz4nuDeqLO7R/xoK7KWQLgnzzX
 kGsW1hc7nLyQ1RGMbuOJ45HuSPW1+/6gmkcCVhmS3GvCrJy10ef+1fACwOzD3Rmy2P
 WIIP7xHk3LW+Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Date: Wed, 19 Jul 2023 09:50:51 +0200
Message-Id: <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
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

Change drm_bridge_add() to its devm variant to slightly simplify the
probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..74068aa70e0c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	dpi->bridge.of_node = dev->of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	drm_bridge_add(&dpi->bridge);
+	ret = devm_drm_bridge_add(dev, &dpi->bridge);
+	if (ret)
+		return ret;
 
 	ret = component_add(dev, &mtk_dpi_component_ops);
 	if (ret) {
-		drm_bridge_remove(&dpi->bridge);
 		dev_err(dev, "Failed to add component: %d\n", ret);
 		return ret;
 	}
@@ -1107,7 +1108,6 @@ static int mtk_dpi_remove(struct platform_device *pdev)
 	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
-	drm_bridge_remove(&dpi->bridge);
 
 	return 0;
 }
-- 
2.40.1

