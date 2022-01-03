Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9364833C8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 15:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFC889ECB;
	Mon,  3 Jan 2022 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BCE896E5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 14:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C51C1F402EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641221610;
 bh=NGTXfOIL5zOU/+5DW6dMjFB25yKQDzqC4jgJ9S1Zrro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdtqLXtIeiz2bblKBoQ2E3SyvVMP2twvL2qA8A3O1dZyzLo8/0iUqofS09YbCdsMe
 aE6qDkSseeN+o07exRW5nAfhZTX/72uLHrWJ5oByd5ifqU/uq2n6lnjuw9FKDXD/Rz
 fNwQ70z0/adq6au3joh05MTFsQttIYXai6o0jkgeyyNwQ7E439eEHwBA5jIV1t9lrf
 FEazEDt3ycMSbu30c/YCDseMiaq2keF5Vk/VVuLuDGI0ZhP/2q8LeVTXM8/Tv0wz7c
 woyePZG+o7U7ZnMml8VcwET6zpLA4a3DxHG/8VgiEwmo5yiaxagFBV/R/0YSp3tXrT
 +xYdAUpstdLHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 2/3] phy: mediatek: phy-mtk-mipi-dsi: Reorder and stop
 implicit header inclusion
Date: Mon,  3 Jan 2022 15:53:23 +0100
Message-Id: <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the headers for phy-mtk-mipi-{dsi,dsi-mt8173,dsi-mt8183}.c were
included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
increase readability and sensibly reduce build times, the inclusions
should be done per-file, also avoiding to include unused headers and
should not be implicit.

For this reason, move the inclusions to each file and remove unused ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c |  4 ++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c |  4 ++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c        |  7 +++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h        | 10 ++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 95a0d9a3cca7..59f028da9d3e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -4,7 +4,11 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_DSI_CON		0x00
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 01b59527669e..6c6b192485ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -4,7 +4,11 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_LANE_CON		0x000c
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 51b1b1d4ad38..6f7425b0bf5b 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -3,7 +3,14 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 8d32e9027a15..4eb5fc91e083 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -7,16 +7,10 @@
 #ifndef _MTK_MIPI_TX_H
 #define _MTK_MIPI_TX_H
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/regmap.h>
 #include <linux/phy/phy.h>
-#include <linux/slab.h>
 
 struct mtk_mipitx_data {
 	const u32 mppll_preserve;
-- 
2.33.1

