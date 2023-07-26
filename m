Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F0762FAB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333D110E446;
	Wed, 26 Jul 2023 08:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62010E193
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:22:59 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 328296607123;
 Wed, 26 Jul 2023 09:22:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690359777;
 bh=fnTCmYsrDDNtkDG9EQwHh0fbSiert+Ttme90qPGoI74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixo/92B0b4iuNTniChsi9dxG+BxLjIWQ8FWpvz4PiRgpa7+PwlE2/dc+DpgLjk92D
 S4p20SuBmmRAvyYtQni89CnMSvPlZQKNVam4y4hyG9keJITRDBdBTMnPgRNmcq347b
 fiIVHXdFqpbT1pjcXh7Go9ZVt37NQRZBpDKJB30nRObUvf1PuP3xhVAK9Zc2CTtgQf
 KOmB5stsbGzewlJDMVtoLE3HAezbYmbPj/NBGpzMrJUVfWYuQ6mPmZoz3K917ja/v+
 bCh9QU9WDRlmO3AW31KqPiJ1ECJ+lJXp/Jm3rjP3JpvkSKV0VzSvBvlGZE70qQYwwk
 u8EJ5JvOtLexA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new() void
 callback
Date: Wed, 26 Jul 2023 10:22:43 +0200
Message-ID: <20230726082245.550929-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
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

The .remove() callback cannot fail: switch to .remove_new() and
change mtk_dpi_remove() to void.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 08822fe88c93..2c95de5539fd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1086,11 +1086,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_dpi_remove(struct platform_device *pdev)
+static void mtk_dpi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
-
-	return 0;
 }
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
@@ -1121,7 +1119,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
-- 
2.41.0

