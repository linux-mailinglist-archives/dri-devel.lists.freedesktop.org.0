Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E448343F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18AA89D7B;
	Mon,  3 Jan 2022 15:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55369899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:31:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8249F1F4254C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223862;
 bh=sEDq2d+5/abLrttz8U18JMOJJuSHWVdlfX/N3MRUvHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fQ1z/nL8jFTbNjKYRB+PMQyIzYsFu8sg0pylMTuCTroCVbNbcK8gxDvbw3InCv3Eo
 APnlC7ub0pkwb6wX2AeUIbRQ62kF+tJ5KgGt7vk7Iy3736YtYuXAx77SH5Qz7sLyS3
 kTQpo+2Z1D9+0f1IHN7S8bsHtGS8CVEMlQqUpTi6ol54LYyMraQbMLQbuqFvs3XlWz
 h2w8qP3AuUSe5CCDPg5SMKKfpgftvNQIximMZiuS7EKyHe49z6RCSGDrSg01FwDG0q
 9n9ZLhC31266uN1touKYVJfUA2OUlxFOJtMMIJg4eujsjfVs2bpChzdaFlbgbT/MKG
 kzSzetjsZVD3g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 3/4] phy: mediatek: phy-mtk-hdmi: Reorder and stop implicit
 header inclusion
Date: Mon,  3 Jan 2022 16:30:54 +0100
Message-Id: <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
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

All the headers for phy-mtk-{hdmi,hdmi-mt2701,hdmi-mt8183}.c were
included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
increase readability and sensibly reduce build times, the inclusions
should be done per-file, also avoiding to include unused headers and
should not be implicit.

For this reason, move the inclusions to each file and remove unused ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c |  5 +++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c |  5 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c        |  8 ++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h        | 10 +---------
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index 09e0dd7499d8..270c5f538483 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -4,6 +4,11 @@
  * Author: Chunhui Dai <chunhui.dai@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 #include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0	0x00
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index e317bf4a9db9..87ba9a3687b7 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -4,6 +4,11 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 #include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0		0x00
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b4193cb4e4e3..e037fa89696c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -4,6 +4,14 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-hdmi.h"
 
 inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index a0571271d730..ef81e44a235d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -6,17 +6,9 @@
 
 #ifndef _MTK_HDMI_PHY_H
 #define _MTK_HDMI_PHY_H
-#include <linux/clk.h>
+
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/mfd/syscon.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/phy/phy.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/types.h>
 
 struct mtk_hdmi_phy;
 
-- 
2.33.1

