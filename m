Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EF6DF444
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C35B10E7A1;
	Wed, 12 Apr 2023 11:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC5310E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:52:58 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C01186603239;
 Wed, 12 Apr 2023 12:52:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681300377;
 bh=4FBue3qHRI25FXn0MBkODyzRRRK4GfsWagmvjRhDO5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eCDzv+FOppqjQwIZrSpLGamwEACPh8hraG9vIjR0E0AgYoBxv+sPdCf2/Luumn17G
 qhi0/SDnLZ8wgejRJhNmWA/61b3g3TWrK2Gjh3OzYuQHWCv1ct7H4xSOkYRVJoLEV9
 hjBzIAhAXCLMxutGeXBMLU/pUQRXWYhe3aN4oI3QXqR9ei3BsRXd8AhOYtQ+kgQa6M
 Te6guvGzaM3roCpgBvuqeE+cDk84GztJ07AfRfVrmLHdX2764kUJJEyKkjaft311KB
 fFuBafK5G7ZYGZwHgUiRYt1da5+UwiqbfzeOTm1GNY3fMjCOG6YfFJcrCiXsG5G9rQ
 yVRV+Rem0Elkw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
Date: Wed, 12 Apr 2023 13:52:49 +0200
Message-Id: <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
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

Function drm_of_find_panel_or_bridge() is marked as deprecated: since
the usage of that in this driver exactly corresponds to the new function
devm_drm_of_get_bridge(), switch to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6be65ea21f8f..9025111013d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq <= 0)
 		return -EINVAL;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  NULL, &dpi->next_bridge);
-	if (ret)
-		return ret;
+	dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dpi->next_bridge))
+		return PTR_ERR(dpi->next_bridge);
 
 	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
-- 
2.40.0

