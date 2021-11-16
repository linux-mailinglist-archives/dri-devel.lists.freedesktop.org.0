Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFC452E59
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0E6E9D6;
	Tue, 16 Nov 2021 09:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719156E93F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:49:43 +0000 (UTC)
X-UUID: cb298c37100c4f9d9fe4e7b8fef3fb26-20211116
X-UUID: cb298c37100c4f9d9fe4e7b8fef3fb26-20211116
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jitao.shi@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 454372275; Tue, 16 Nov 2021 17:49:39 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 16 Nov 2021 17:49:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:49:36 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 16 Nov 2021 17:49:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] drm/mediatek: control panel's power before MIPI LP11
Date: Tue, 16 Nov 2021 17:49:30 +0800
Message-ID: <20211116094930.11470-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20211116094930.11470-1-jitao.shi@mediatek.com>
References: <20211116094930.11470-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, xinlei.li@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, liangxu.xu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"auo,kd101n80-45na" requires the panel's IOVDD take precedence over
MIPI DATA. Otherwise there is a risk of leakage.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Change-Id: I2da6179dea7e15bc5a53fe36db200b6c04f4d551
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 93b40c245f00..9fff0c483139 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -24,7 +24,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-
+#include <drm/panel_boe_tv101wum_nl6.h>
 #include "mtk_disp_drv.h"
 #include "mtk_drm_ddp_comp.h"
 
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
+	struct drm_panel *panel;
 	struct phy *phy;
 
 	void __iomem *regs;
@@ -619,10 +620,16 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
+	if (dsi->panel) {
+		if (panel_prepare_power(dsi->panel)) {
+			DRM_INFO("can't prepare power the panel\n");
+			goto err_refcount;
+		}
+	}
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set data rate: %d\n", ret);
-		goto err_refcount;
+		goto err_prepare_power;
 	}
 
 	phy_power_on(dsi->phy);
@@ -665,6 +672,11 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
 	phy_power_off(dsi->phy);
+err_prepare_power:
+	if (dsi->panel) {
+		if (panel_unprepare_power(dsi->panel))
+			DRM_INFO("Can't unprepare power the panel\n");
+	}
 err_refcount:
 	dsi->refcount--;
 	return ret;
@@ -698,6 +710,11 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	if (dsi->panel) {
+		if (panel_unprepare_power(dsi->panel))
+			DRM_INFO("Can't unprepare power the panel\n");
+	}
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
@@ -1001,7 +1018,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1019,12 +1035,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
+					  &dsi->panel, &dsi->next_bridge);
 	if (ret)
 		goto err_unregister_host;
 
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (dsi->panel) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dev, dsi->panel);
 		if (IS_ERR(dsi->next_bridge)) {
 			ret = PTR_ERR(dsi->next_bridge);
 			goto err_unregister_host;
-- 
2.12.5

