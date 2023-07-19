Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11F758F90
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78AE10E411;
	Wed, 19 Jul 2023 07:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19310E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:51:10 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F6A16607072;
 Wed, 19 Jul 2023 08:51:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689753069;
 bh=lw4Zkv3oS6GSkPKOSPEXOFTpN59kNOlACTF4/SJM4pY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PKZwt9Y3MCS4bZ3uTZssAD3AlKromVqKaRw/2gYboZ24CuR/b4gJ/3r995tND22qt
 yTbJS+cf5GkoR+y/b5VybefGocyes/d5UseDbgAG+6kmKpoEf1KKhH/ZjtfEnR9ZSJ
 mrRuZdYqTbYZZDqqXUdKIcMvPEiW09dwEBIaZAJJQgADK5CHD/p0MGvuz6Qlo+dwo0
 UpA6YaBcF/Duh5MhqIP1Mr8kPUad2ERTBeI7YxUJvbipGCMYbYEhz6tu7dpKzvlqxQ
 hLXw+WX6jKkcly65ZCXs53OurQ4wNDeNXSupqKxl+esmLd2W0aCsjIfD2nVdkPtNVm
 YitujLBf8wMGg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new() void
 callback
Date: Wed, 19 Jul 2023 09:50:54 +0200
Message-Id: <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
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

The .remove() callback cannot fail: switch to .remove_new() and
change mtk_dpi_remove() to void.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e9c5a0f44537..3a140498c98a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1087,11 +1087,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
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
@@ -1122,7 +1120,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
-- 
2.40.1

