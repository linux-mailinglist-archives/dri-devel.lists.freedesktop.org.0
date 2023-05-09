Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C676FC866
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DED010E288;
	Tue,  9 May 2023 14:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1E610E288
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:01:23 +0000 (UTC)
X-UUID: f7c9f4feee7111edb20a276fd37b9834-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zBdVrrerhzocclh/EisRXxvD1O+iNkS0Xjzaf6Nm7N8=; 
 b=GqDKlT/O9ObKp9UzePJu4Y12xKsaO/PJbesA1BuAhfYVKT3oluYpKzXrgyweAfZO1Yc+a9J6yBAK54PEF9rFLGOXi3MDJQNiRyvMFZnhcUMmpt5UbeLUTZ7UsdwhO2mXfGi4hqNxHNPLQCSYjvzUQIVbtDo2ciso8bMheDC/GrI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:b3944c24-46e4-425e-a5e2-90f839a711af, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:178d4d4, CLOUDID:536748c0-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: f7c9f4feee7111edb20a276fd37b9834-20230509
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 612777576; Tue, 09 May 2023 22:01:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:01:16 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH 1/2] drm/mediatek: Add ability to support dynamic connector
 selection
Date: Tue, 9 May 2023 22:01:13 +0800
Message-ID: <20230509140114.6956-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230509140114.6956-1-jason-jh.lin@mediatek.com>
References: <20230509140114.6956-1-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Move output drm connector from each ddp_path array to connector array.
2. Add dynamic select available connector flow in crtc create and enable.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 111 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  27 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  44 ++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 ++
 8 files changed, 202 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..72c57442f965 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -44,6 +44,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
+int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..765fc976e41f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -782,6 +782,15 @@ void mtk_dpi_stop(struct device *dev)
 	mtk_dpi_power_off(dpi);
 }
 
+int mtk_dpi_encoder_index(struct device *dev)
+{
+	struct mtk_dpi *dpi = dev_get_drvdata(dev);
+	int encoder_index = drm_encoder_index(&dpi->encoder);
+
+	dev_dbg(dev, "encoder index:%d", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..54d48932b833 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -60,8 +60,12 @@ struct mtk_drm_crtc {
 	struct device			*mmsys_dev;
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
+	unsigned int			ddp_comp_nr_ori;
+	unsigned int			max_ddp_comp_nr;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	unsigned int			conn_route_nr;
+	const struct mtk_drm_route	*conn_routes;
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
@@ -649,6 +653,84 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
+static unsigned int mtk_drm_crtc_max_num_route_comp(struct mtk_drm_crtc *mtk_crtc)
+{
+	unsigned int max_num = 0;
+	unsigned int i;
+
+	if (!mtk_crtc->conn_route_nr)
+		return 0;
+
+	for (i = 0; i < mtk_crtc->conn_route_nr; i++)
+		max_num = max(mtk_crtc->conn_routes[i].route_len, max_num);
+
+	return max_num;
+}
+
+static int mtk_drm_crtc_update_output(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	const struct mtk_drm_route *conn_routes;
+	int crtc_index = drm_crtc_index(crtc);
+	int i;
+	struct device *dev;
+	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	unsigned int comp_id;
+	unsigned int encoder_mask = crtc_state->encoder_mask;
+	unsigned int route_len = 0, route_index = 0;
+
+	if (!mtk_crtc->conn_route_nr)
+		return 0;
+
+	priv = priv->all_drm_private[crtc_index];
+	dev = priv->dev;
+
+	dev_dbg(dev, "connector change:%d, encoder mask0x%x for crtc%d",
+		crtc_state->connectors_changed, encoder_mask, crtc_index);
+
+	if (!crtc_state->connectors_changed)
+		return 0;
+
+	conn_routes = mtk_crtc->conn_routes;
+
+	for (i = 0; i < mtk_crtc->conn_route_nr; i++) {
+		route_len = conn_routes[i].route_len;
+		if (route_len > 0) {
+			comp_id = conn_routes[i].route_ddp[route_len - 1];
+			if (priv->comp_node[comp_id]) {
+				if ((1 << priv->ddp_comp[comp_id].encoder_index) == encoder_mask) {
+					route_index = i;
+					break;
+				}
+			}
+		}
+	}
+
+	for (i = 0; i < route_len; i++) {
+		struct mtk_ddp_comp *comp;
+		struct device_node *node;
+
+		comp_id = conn_routes[route_index].route_ddp[i];
+		node = priv->comp_node[comp_id];
+		comp = &priv->ddp_comp[comp_id];
+		if (!comp) {
+			dev_err(dev, "Component %pOF not initialized\n", node);
+			return -ENODEV;
+		}
+
+		mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr_ori + i] = comp;
+		dev_dbg(dev, "Add comp_id: %d at path index %d\n",
+			comp->id, mtk_crtc->ddp_comp_nr_ori + i);
+	}
+
+	mtk_crtc->ddp_comp_nr = mtk_crtc->ddp_comp_nr_ori + route_len;
+	dev_dbg(dev, "Update total comp num:%d", mtk_crtc->ddp_comp_nr);
+
+	return 0;
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -681,6 +763,12 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
+	ret = mtk_drm_crtc_update_output(crtc, state);
+	if (ret < 0) {
+		DRM_DEV_ERROR(comp->dev, "Failed to update crtc output: %d\n", ret);
+		return;
+	}
+
 	ret = pm_runtime_resume_and_get(comp->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
@@ -886,7 +974,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path, unsigned int path_len,
-			int priv_data_index)
+			int priv_data_index, const struct mtk_drm_route *conn_routes,
+			unsigned int conn_routes_num)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
@@ -898,6 +987,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	uint gamma_lut_size = 0;
 	struct drm_crtc *tmp;
 	int crtc_i = 0;
+	unsigned int route_len = 0, max_route_comp_num = 0;
 
 	if (!path)
 		return 0;
@@ -937,7 +1027,24 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
+	mtk_crtc->ddp_comp_nr_ori = path_len;
+	if (conn_routes) {
+		unsigned int comp_id;
+
+		for (i = 0; i < conn_routes_num; i++) {
+			route_len = conn_routes[i].route_len;
+			if (route_len > 0) {
+				comp_id = conn_routes[i].route_ddp[route_len - 1];
+				mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
+			}
+		}
+
+		mtk_crtc->conn_route_nr = conn_routes_num;
+		mtk_crtc->conn_routes = conn_routes;
+	}
+	max_route_comp_num = mtk_drm_crtc_max_num_route_comp(mtk_crtc);
+	mtk_crtc->max_ddp_comp_nr  = mtk_crtc->ddp_comp_nr + max_route_comp_num;
+	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->max_ddp_comp_nr,
 						sizeof(*mtk_crtc->ddp_comp),
 						GFP_KERNEL);
 	if (!mtk_crtc->ddp_comp)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..672b9c7afee6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_crtc.h>
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 
 #define MTK_LUT_SIZE	512
@@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path,
 			unsigned int path_len,
-			int priv_data_index);
+			int priv_data_index,
+			const struct mtk_drm_route *conn_routes,
+			unsigned int conn_routes_num);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index f114da4d36a9..fe20ce26b19f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -304,6 +304,7 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
 static const struct mtk_ddp_comp_funcs ddp_dpi = {
 	.start = mtk_dpi_start,
 	.stop = mtk_dpi_stop,
+	.encoder_index = mtk_dpi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dsc = {
@@ -507,6 +508,26 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
+					      const struct mtk_drm_route *routes,
+					      unsigned int routes_num,
+					      struct mtk_ddp_comp *ddp_comp)
+{
+	unsigned int i;
+
+	if (!routes)
+		return 0;
+
+	for (i = 0; i < routes_num; i++)
+		if (mtk_drm_find_comp_in_ddp(dev, routes[i].route_ddp,
+					     routes[i].route_len, ddp_comp))
+			return BIT(routes[i].crtc_id);
+
+	DRM_INFO("Failed to find comp in ddp connector table\n");
+
+	return 0;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -538,6 +559,12 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 					  private->data->third_len, private->ddp_comp))
 		ret = BIT(2);
 	else
+		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
+							 private->data->conn_routes,
+							 private->data->conn_routes_num,
+							 private->ddp_comp);
+
+	if (ret == 0)
 		DRM_INFO("Failed to find comp in ddp table\n");
 
 	return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..1c1d670cfe41 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
+	int (*encoder_index)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
@@ -87,6 +88,7 @@ struct mtk_ddp_comp {
 	int irq;
 	unsigned int id;
 	const struct mtk_ddp_comp_funcs *funcs;
+	int encoder_index;
 };
 
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
@@ -275,6 +277,12 @@ static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct dev
 	return false;
 }
 
+static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->encoder_index)
+		comp->encoder_index = comp->funcs->encoder_index(comp->dev);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6dcb4ba2466c..d8c49614a107 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -185,7 +185,14 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 	DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_DITHER0,
-	DDP_COMPONENT_DP_INTF0,
+};
+
+static const unsigned int mt8188_mtk_ddp_main_routes_0[] = {
+	DDP_COMPONENT_DP_INTF0
+};
+
+static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
+	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_0), mt8188_mtk_ddp_main_routes_0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
@@ -287,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.main_path = mt8188_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.conn_routes = mt8188_mtk_ddp_main_routes,
+	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -350,6 +360,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
 	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct device_node *node;
@@ -372,9 +383,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (!drm_dev || !dev_get_drvdata(drm_dev))
 			continue;
 
-		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
-		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
-			cnt++;
+		temp_drm_priv = dev_get_drvdata(drm_dev);
+		if (temp_drm_priv) {
+			if (temp_drm_priv->mtk_drm_bound)
+				cnt++;
+
+			if (temp_drm_priv->data->main_len)
+				all_drm_priv[0] = temp_drm_priv;
+			else if (temp_drm_priv->data->ext_len)
+				all_drm_priv[1] = temp_drm_priv;
+			else if (temp_drm_priv->data->third_len)
+				all_drm_priv[2] = temp_drm_priv;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
@@ -391,7 +411,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id)
 {
 	const struct mtk_mmsys_driver_data *drv_data = private->data;
-	int i;
+	int i, j;
 
 	if (drv_data->main_path)
 		for (i = 0; i < drv_data->main_len; i++)
@@ -408,6 +428,12 @@ static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id
 			if (drv_data->third_path[i] == comp_id)
 				return true;
 
+	if (drv_data->conn_routes_num)
+		for (i = 0; i < drv_data->conn_routes_num; i++)
+			for (j = 0; j < drv_data->conn_routes[i].route_len; j++)
+				if (drv_data->conn_routes[i].route_ddp[j] == comp_id)
+					return true;
+
 	return false;
 }
 
@@ -466,21 +492,23 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 			if (i == 0 && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
-							  priv_n->data->main_len, j);
+							  priv_n->data->main_len, j,
+							  priv_n->data->conn_routes,
+							  priv_n->data->conn_routes_num);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == 1 && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
-							  priv_n->data->ext_len, j);
+							  priv_n->data->ext_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == 2 && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
-							  priv_n->data->third_len, j);
+							  priv_n->data->third_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index eb2fd45941f0..8dca68ea1b94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -22,6 +22,12 @@ struct drm_fb_helper;
 struct drm_property;
 struct regmap;
 
+struct mtk_drm_route {
+	const unsigned int crtc_id;
+	const unsigned int route_len;
+	const unsigned int *route_ddp;
+};
+
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
@@ -29,6 +35,8 @@ struct mtk_mmsys_driver_data {
 	unsigned int ext_len;
 	const unsigned int *third_path;
 	unsigned int third_len;
+	const struct mtk_drm_route *conn_routes;
+	unsigned int conn_routes_num;
 
 	bool shadow_register;
 	unsigned int mmsys_id;
-- 
2.18.0

