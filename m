Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183D2D6145
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D606EAAA;
	Thu, 10 Dec 2020 16:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2E6EAAC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:11:04 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/12] drm/mediatek: Separate getting larb device to a
 function
Date: Fri, 11 Dec 2020 00:10:41 +0800
Message-Id: <20201210161050.8460-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

To make the code cleaner, separate getting larb device to
a function.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 ++++++++++++---------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1730b3ddef70..a11b4f8bf959 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -465,19 +465,41 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
+static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
+				struct device *dev)
+{
+	struct device_node *larb_node;
+	struct platform_device *larb_pdev;
+
+	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
+	if (!larb_node) {
+		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
+		return -EINVAL;
+	}
+
+	larb_pdev = of_find_device_by_node(larb_node);
+	if (!larb_pdev) {
+		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
+		of_node_put(larb_node);
+		return -EPROBE_DEFER;
+	}
+	of_node_put(larb_node);
+	comp->larb_dev = &larb_pdev->dev;
+
+	return 0;
+}
+
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
 {
 	struct platform_device *comp_pdev;
 	struct device *dev;
 	enum mtk_ddp_comp_type type;
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct resource res;
 	struct cmdq_client_reg cmdq_reg;
-	int ret;
 #endif
+	int ret;
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
 		return -EINVAL;
@@ -529,30 +551,15 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 #endif
 
 	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (type != MTK_DISP_OVL &&
-	    type != MTK_DISP_OVL_2L &&
-	    type != MTK_DISP_RDMA &&
-	    type != MTK_DISP_WDMA)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
+	if (type == MTK_DISP_OVL ||
+	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DISP_WDMA) {
+		ret = mtk_ddp_get_larb_dev(node, comp, dev);
+		if (ret)
+			return ret;
 	}
 
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
