Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0817B090E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069110E555;
	Wed, 27 Sep 2023 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4E10E555
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:38:43 +0000 (UTC)
X-UUID: ebaae5c25d4b11ee8051498923ad61e6-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QLSTQpMYRpFCSX+KtQdLaYlWTqTXe8x979BjilnSNh0=; 
 b=amdAgfysWwQa4FUX9sp5QPbCLINJr1VUO6OyQbfsW8e0WqwdNVLJhH3DaoW06F9H5hRwIMiJaWIb9935x/4hbIDKp1WGMBxFu6unQHS+64yoBlc3WjF1tjX/nVzM3jnz8ll05u9sWvAirfWs//p9pW+lcHLixPEfSs6P8G6dp2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:ca02593c-cb39-41fb-b336-e46de0795987, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:19aa88c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ebaae5c25d4b11ee8051498923ad61e6-20230927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1289966055; Wed, 27 Sep 2023 23:38:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:38:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v10 5/9] drm/mediatek: Add connector dynamic selection
 capability
Date: Wed, 27 Sep 2023 23:38:29 +0800
Message-ID: <20230927153833.23583-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
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
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dynamic select available connector flow in mtk_drm_crtc_create()
and mtk_drm_crtc_atomic_enable().

In mtk_drm_crtc_create(), if there is a connector routes array in drm
driver data, all components definded in the connector routes array will
be checked and their encoder_index will be set.

In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
identify which componet in the connector routes array should append.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 78 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 ++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 13 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
 5 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index b6fa4ad2f94d..8eb4d2646a76 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -63,6 +63,8 @@ struct mtk_drm_crtc {
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	unsigned int			num_conn_routes;
+	const struct mtk_drm_route	*conn_routes;
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
@@ -647,6 +649,45 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
+static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	int crtc_index = drm_crtc_index(crtc);
+	int i;
+	struct device *dev;
+	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	unsigned int comp_id;
+	unsigned int encoder_mask = crtc_state->encoder_mask;
+
+	if (!crtc_state->connectors_changed)
+		return;
+
+	if (!mtk_crtc->num_conn_routes)
+		return;
+
+	priv = priv->all_drm_private[crtc_index];
+	dev = priv->dev;
+
+	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
+		crtc_state->connectors_changed, encoder_mask, crtc_index);
+
+	for (i = 0; i < mtk_crtc->num_conn_routes; i++) {
+		struct mtk_ddp_comp *comp;
+
+		comp_id = mtk_crtc->conn_routes[i].route_ddp;
+		comp = &priv->ddp_comp[comp_id];
+		if (comp->encoder_index >= 0 &&
+		    encoder_mask & BIT(comp->encoder_index)) {
+			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] = comp;
+			dev_dbg(dev, "Add comp_id: %d at path index %d\n",
+				comp->id, mtk_crtc->ddp_comp_nr - 1);
+			break;
+		}
+	}
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -679,6 +720,8 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
+	mtk_drm_crtc_update_output(crtc, state);
+
 	ret = pm_runtime_resume_and_get(comp->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
@@ -884,7 +927,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path, unsigned int path_len,
-			int priv_data_index)
+			int priv_data_index, const struct mtk_drm_route *conn_routes,
+			unsigned int num_conn_routes)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
@@ -935,7 +979,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
+	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
+						mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
 						sizeof(*mtk_crtc->ddp_comp),
 						GFP_KERNEL);
 	if (!mtk_crtc->ddp_comp)
@@ -1038,5 +1083,34 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
 #endif
+
+	if (conn_routes) {
+		struct device_node *node;
+		struct mtk_ddp_comp *comp;
+		unsigned int comp_id;
+
+		for (i = 0; i < num_conn_routes; i++) {
+			comp_id = conn_routes[i].route_ddp;
+			node = priv->comp_node[comp_id];
+			comp = &priv->ddp_comp[comp_id];
+
+			if (!comp->dev) {
+				dev_dbg(dev, "comp_id:%d, Component %pOF not initialized\n",
+					comp_id, node);
+				/* mark encoder_index to -1, if route comp device is not enabled */
+				comp->encoder_index = -1;
+				continue;
+			}
+
+			mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
+		}
+
+		mtk_crtc->num_conn_routes = num_conn_routes;
+		mtk_crtc->conn_routes = conn_routes;
+
+		/* increase ddp_comp_nr at the end of mtk_drm_crtc_create */
+		mtk_crtc->ddp_comp_nr++;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..3c224595fa71 100644
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
+			unsigned int num_conn_routes);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..4ddb5e561116 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -507,6 +507,23 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
+					      const struct mtk_drm_route *routes,
+					      unsigned int num_routes,
+					      struct mtk_ddp_comp *ddp_comp)
+{
+	unsigned int i;
+
+	if (!routes)
+		return -EINVAL;
+
+	for (i = 0; i < num_routes; i++)
+		if (dev == ddp_comp[routes[i].route_ddp].dev)
+			return BIT(routes[i].crtc_id);
+
+	return -ENODEV;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -538,7 +555,15 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 					  private->data->third_len, private->ddp_comp))
 		ret = BIT(2);
 	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
+							 private->data->conn_routes,
+							 private->data->num_conn_routes,
+							 private->ddp_comp);
+
+	if (ret <= 0) {
+		DRM_INFO("Failed to find comp in ddp table, ret =%d\n", ret);
+		ret = 0;
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bf4a04c1156b..5d2e191b4106 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -424,6 +424,11 @@ static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id
 			if (drv_data->third_path[i] == comp_id)
 				return true;
 
+	if (drv_data->num_conn_routes)
+		for (i = 0; i < drv_data->num_conn_routes; i++)
+			if (drv_data->conn_routes[i].route_ddp == comp_id)
+				return true;
+
 	return false;
 }
 
@@ -482,21 +487,23 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
-							  priv_n->data->main_len, j);
+							  priv_n->data->main_len, j,
+							  priv_n->data->conn_routes,
+							  priv_n->data->num_conn_routes);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
-							  priv_n->data->ext_len, j);
+							  priv_n->data->ext_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
-							  priv_n->data->third_len, j);
+							  priv_n->data->third_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index f4de8bb27685..6f98fff4f1a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -28,6 +28,11 @@ struct drm_fb_helper;
 struct drm_property;
 struct regmap;
 
+struct mtk_drm_route {
+	const unsigned int crtc_id;
+	const unsigned int route_ddp;
+};
+
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
@@ -35,6 +40,8 @@ struct mtk_mmsys_driver_data {
 	unsigned int ext_len;
 	const unsigned int *third_path;
 	unsigned int third_len;
+	const struct mtk_drm_route *conn_routes;
+	unsigned int num_conn_routes;
 
 	bool shadow_register;
 	unsigned int mmsys_id;
-- 
2.18.0

