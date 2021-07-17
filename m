Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF03CC4B9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 19:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0D06EA9A;
	Sat, 17 Jul 2021 17:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEAC6EA1C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:09:41 +0000 (UTC)
X-UUID: 02f8da5510d441e9a3d7491943d173a7-20210717
X-UUID: 02f8da5510d441e9a3d7491943d173a7-20210717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 206529926; Sat, 17 Jul 2021 17:04:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:36 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 10/10] drm/mediatek: add mediatek-drm of vdosys1 support
 for MT8195
Date: Sat, 17 Jul 2021 17:04:08 +0800
Message-ID: <20210717090408.28283-11-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 17:08:05 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver data of mt8195 vdosys1 to mediatek-drm and modify drm for
multi-mmsys support. The two mmsys (vdosys0 and vdosys1) will bring
up two drm drivers, only one drm driver register as the drm device.
Each drm driver binds its own component. The first bind drm driver
will allocate the drm device, and the last bind drm driver registers
the drm device to drm core. Each crtc path is created with the
corresponding drm driver data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 367 ++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  15 +-
 4 files changed, 332 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index f3addc200c97..c79f76097aa9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -746,21 +746,28 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 }
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
-			const enum mtk_ddp_comp_id *path, unsigned int path_len)
+			const enum mtk_ddp_comp_id *path, unsigned int path_len,
+			int priv_data_index)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
 	struct mtk_drm_crtc *mtk_crtc;
 	unsigned int num_comp_planes = 0;
-	int pipe = priv->num_pipes;
 	int ret;
 	int i;
 	bool has_ctm = false;
 	uint gamma_lut_size = 0;
+	struct drm_crtc *tmp;
+	int crtc_i = 0;
 
 	if (!path)
 		return 0;
 
+	priv = priv->all_drm_private[priv_data_index];
+
+	drm_for_each_crtc(tmp, drm_dev)
+		crtc_i++;
+
 	for (i = 0; i < path_len; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct device_node *node;
@@ -769,7 +776,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (!node) {
 			dev_info(dev,
 				 "Not creating crtc %d because component %d is disabled or missing\n",
-				 pipe, comp_id);
+				 crtc_i, comp_id);
 			return 0;
 		}
 	}
@@ -825,19 +832,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
-						    pipe);
+						    crtc_i);
 		if (ret)
 			return ret;
 	}
 
-	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
+	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
 	if (ret < 0)
 		return ret;
 
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
-	priv->num_pipes++;
 	mutex_init(&mtk_crtc->hw_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 66d1cf03dfe8..0646fafffd8b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -31,7 +31,8 @@
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path,
-			unsigned int path_len);
+			unsigned int path_len,
+			int priv_data_index);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ddc26160dea1..6ccfc2d82b64 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -160,12 +160,21 @@ static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
 	DDP_COMPONENT_DP_INTF0,
 };
 
+static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] = {
+	DDP_COMPONENT_PSEUDO_OVL,
+	DDP_COMPONENT_ETHDR,
+	DDP_COMPONENT_MERGE5,
+	DDP_COMPONENT_DP_INTF1,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
 	.ext_path = mt2701_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
 	.shadow_register = true,
+	.mmsys_id = 0,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
@@ -174,6 +183,8 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.ext_path = mt7623_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt7623_mtk_ddp_ext),
 	.shadow_register = true,
+	.mmsys_id = 0,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
@@ -183,6 +194,8 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
 	.third_path = mt2712_mtk_ddp_third,
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
+	.mmsys_id = 0,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
@@ -190,6 +203,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
 	.ext_path = mt8173_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
+	.mmsys_id = 0,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -197,32 +212,219 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
 	.ext_path = mt8183_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
+	.mmsys_id = 0,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+	.mmsys_id = 0,
+	.mmsys_dev_num = 2,
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.ext_path = mt8195_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
+	.mmsys_id = 1,
+	.mmsys_dev_num = 2,
+};
+
+static const struct of_device_id mtk_drm_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-mmsys",
+	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt7623-mmsys",
+	  .data = &mt7623_mmsys_driver_data},
+	{ .compatible = "mediatek,mt2712-mmsys",
+	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8173-mmsys",
+	  .data = &mt8173_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8183-mmsys",
+	  .data = &mt8183_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-vdosys0",
+	  .data = &mt8195_vdosys0_driver_data},
+	{ .compatible = "mediatek,mt8195-vdosys1",
+	  .data = &mt8195_vdosys1_driver_data},
+	{ }
 };
+MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
+
+static int mtk_drm_get_mmsys_priv(struct device *dev,
+				  struct mtk_drm_private **all_drm_priv,
+				  int num)
+{
+	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
+	struct device_node *node;
+	int cnt = 0;
+
+	for_each_child_of_node(phandle->parent, node) {
+		struct platform_device *pdev;
+		struct mtk_mmsys_private *mmsys_priv;
+
+		of_id = of_match_node(mtk_drm_of_ids, node);
+		if (!of_id)
+			continue;
+
+		pdev = of_find_device_by_node(node);
+		if (!pdev)
+			continue;
+
+		mmsys_priv = dev_get_drvdata(&pdev->dev);
+		if (!mmsys_priv || !mmsys_priv->drm_private)
+			continue;
+
+		all_drm_priv[cnt++] = mmsys_priv->drm_private;
+		if (cnt == num)
+			break;
+	}
+
+	return 0;
+}
+
+static bool mtk_drm_check_last_drm_bind(struct device *dev)
+{
+	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
+	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	int cnt = 0;
+	int i;
+
+	mtk_drm_get_mmsys_priv(dev, all_drm_priv, drm_priv->data->mmsys_dev_num);
+
+	for (i = 0; i < MAX_CRTC; i++)
+		if (all_drm_priv[i] && all_drm_priv[i]->mtk_drm_bound)
+			cnt++;
+
+	return (drm_priv->data->mmsys_dev_num == cnt);
+}
+
+static bool mtk_drm_find_drm_dev(struct device *dev, struct drm_device **drm)
+{
+	struct device_node *phandle = dev->parent->of_node;
+	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
+	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	int i;
+
+	if (!drm_priv->data->mmsys_dev_num)
+		return false;
+
+	mtk_drm_get_mmsys_priv(dev, all_drm_priv, drm_priv->data->mmsys_dev_num);
+
+	for (i = 0; i < MAX_CRTC; i++) {
+		if (all_drm_priv[i] && all_drm_priv[i]->mtk_drm_bound) {
+			*drm = all_drm_priv[i]->drm;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int mtk_drm_setup_all_drm_private(struct device *dev)
+{
+	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
+	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	int mmsys_dev_num = drm_priv->data->mmsys_dev_num;
+	int i;
+	int j;
+
+	mtk_drm_get_mmsys_priv(dev, all_drm_priv, mmsys_dev_num);
+
+	for (i = 0; i < mmsys_dev_num; i++)
+		for (j = 0; j < mmsys_dev_num; j++)
+			all_drm_priv[j]->all_drm_private[i] = all_drm_priv[i];
+
+	return 0;
+}
+
+static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id)
+{
+	const struct mtk_mmsys_driver_data *drv_data = private->data;
+	int ret = false;
+	int i;
+
+	if (drv_data->mmsys_dev_num == 1)
+		return true;
+
+	if (drv_data->main_path) {
+		for (i = 0; i < drv_data->main_len; i++)
+			if (drv_data->main_path[i] == comp_id)
+				ret |= true;
+
+		if (i == drv_data->main_len)
+			ret |= false;
+	}
+
+	if (drv_data->ext_path) {
+		for (i = 0; i < drv_data->ext_len; i++)
+			if (drv_data->ext_path[i] == comp_id)
+				ret |= true;
+
+		if (i == drv_data->ext_len)
+			ret |= false;
+	}
+
+	if (drv_data->third_path) {
+		for (i = 0; i < drv_data->third_len; i++)
+			if (drv_data->third_path[i] == comp_id)
+				ret |= true;
+
+		if (i == drv_data->third_len)
+			ret |= false;
+	}
+
+	return ret;
+}
+
+static int mtk_drm_check_mutex_dev(struct mtk_drm_private *private)
+{
+	struct platform_device *pdev;
+	struct mtk_drm_private *priv_i;
+	int ret;
+	int i;
+
+	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+		priv_i = private->all_drm_private[i];
+
+		pdev = of_find_device_by_node(priv_i->mutex_node);
+		if (!pdev) {
+			dev_err(priv_i->dev, "Waiting for disp-mutex device %pOF\n",
+				priv_i->mutex_node);
+			ret = -EPROBE_DEFER;
+			goto err_put_mutex;
+		}
+		priv_i->mutex_dev = &pdev->dev;
+	}
+
+	return 0;
+
+err_put_mutex:
+	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+		priv_i = private->all_drm_private[i];
+		of_node_put(priv_i->mutex_node);
+	}
+
+	return ret;
+}
 
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
+	struct mtk_drm_private *priv_n;
 	struct platform_device *pdev;
-	struct device_node *np;
+	struct device_node *np = NULL;
 	struct device *dma_dev;
 	int ret;
+	int i;
+	int j;
 
 	if (!iommu_present(&platform_bus_type))
 		return -EPROBE_DEFER;
 
-	pdev = of_find_device_by_node(private->mutex_node);
-	if (!pdev) {
-		dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
-			private->mutex_node);
-		of_node_put(private->mutex_node);
-		return -EPROBE_DEFER;
-	}
-	private->mutex_dev = &pdev->dev;
+	ret = mtk_drm_check_mutex_dev(private);
+	if (ret)
+		return ret;
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
@@ -241,33 +443,57 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
-	ret = component_bind_all(drm->dev, drm);
+	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+		drm->dev_private = private->all_drm_private[i];
+		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
 	if (ret)
 		goto put_mutex_dev;
+	}
 
 	/*
 	 * We currently support two fixed data streams, each optional,
 	 * and each statically assigned to a crtc:
 	 * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
 	 */
-	ret = mtk_drm_crtc_create(drm, private->data->main_path,
-				  private->data->main_len);
-	if (ret < 0)
-		goto err_component_unbind;
-	/* ... and OVL1 -> COLOR1 -> GAMMA -> RDMA1 -> DPI0. */
-	ret = mtk_drm_crtc_create(drm, private->data->ext_path,
-				  private->data->ext_len);
-	if (ret < 0)
-		goto err_component_unbind;
-
-	ret = mtk_drm_crtc_create(drm, private->data->third_path,
-				  private->data->third_len);
-	if (ret < 0)
-		goto err_component_unbind;
+	for (i = 0; i < MAX_CRTC; i++) {
+		for (j = 0; j < private->data->mmsys_dev_num; j++) {
+			priv_n = private->all_drm_private[j];
+
+			if (i == 0 && priv_n->data->main_len) {
+				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
+							  priv_n->data->main_len, j);
+				if (ret)
+					goto err_component_unbind;
+
+				if (!np)
+					np = priv_n->comp_node[priv_n->data->main_path[0]];
+
+				continue;
+			} else if (i == 1 && priv_n->data->ext_len) {
+				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
+							  priv_n->data->ext_len, j);
+				if (ret)
+					goto err_component_unbind;
+
+				if (!np)
+					np = priv_n->comp_node[priv_n->data->ext_path[0]];
+
+				continue;
+			} else if (i == 2 && priv_n->data->third_len) {
+				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
+							  priv_n->data->third_len, j);
+				if (ret)
+					goto err_component_unbind;
+
+				if (!np)
+					np = priv_n->comp_node[priv_n->data->third_path[0]];
+
+				continue;
+			}
+		}
+	}
 
 	/* Use OVL device for all DMA memory allocations */
-	np = private->comp_node[private->data->main_path[0]] ?:
-	     private->comp_node[private->data->ext_path[0]];
 	pdev = of_find_device_by_node(np);
 	if (!pdev) {
 		ret = -ENODEV;
@@ -276,13 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 
 	dma_dev = &pdev->dev;
-	private->dma_dev = dma_dev;
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		private->all_drm_private[i]->dma_dev = dma_dev;
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
 	 * when importing PRIME buffers.
 	 */
 	ret = dma_set_max_seg_size(dma_dev, UINT_MAX);
+
 	if (ret) {
 		dev_err(dma_dev, "Failed to set DMA segment size\n");
 		goto err_component_unbind;
@@ -304,9 +532,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	return 0;
 
 err_component_unbind:
-	component_unbind_all(drm->dev, drm);
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		component_unbind_all(private->all_drm_private[i]->dev, drm);
 put_mutex_dev:
-	put_device(private->mutex_dev);
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		put_device(private->all_drm_private[i]->mutex_dev);
+
 	return ret;
 }
 
@@ -371,12 +602,21 @@ static int mtk_drm_bind(struct device *dev)
 	struct drm_device *drm;
 	int ret;
 
-	drm = drm_dev_alloc(&mtk_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	if (!mtk_drm_find_drm_dev(dev, &drm)) {
+		drm = drm_dev_alloc(&mtk_drm_driver, dev);
+		if (IS_ERR(drm))
+			return PTR_ERR(drm);
+		drm->dev_private = private;
+	}
 
-	drm->dev_private = private;
+	private->dev = dev;
 	private->drm = drm;
+	private->mtk_drm_bound = true;
+
+	if (!mtk_drm_check_last_drm_bind(dev))
+		return 0;
+
+	mtk_drm_setup_all_drm_private(dev);
 
 	ret = mtk_drm_kms_init(drm);
 	if (ret < 0)
@@ -401,10 +641,13 @@ static void mtk_drm_unbind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 
-	drm_dev_unregister(private->drm);
-	mtk_drm_kms_deinit(private->drm);
-	drm_dev_put(private->drm);
-	private->num_pipes = 0;
+	/* for multi mmsys dev, unregister drm dev in mmsys master */
+	if (private->data->mmsys_id == 0) {
+		drm_dev_unregister(private->drm);
+		mtk_drm_kms_deinit(private->drm);
+		drm_dev_put(private->drm);
+	}
+	private->mtk_drm_bound = false;
 	private->drm = NULL;
 }
 
@@ -487,49 +730,42 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ }
 };
 
-static const struct of_device_id mtk_drm_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
-	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_driver_data},
-	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_driver_data},
-	{.compatible = "mediatek,mt8195-vdosys0",
-	  .data = &mt8195_vdosys0_driver_data},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
+	const struct mtk_mmsys_driver_data *drv_data;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
+	struct mtk_mmsys_private *mmsys_priv;
 	int ret;
 	int i;
 
+	of_id = of_match_node(mtk_drm_of_ids, phandle);
+	if (!of_id)
+		return -ENODEV;
+
+	drv_data = of_id->data;
 	private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
 	if (!private)
 		return -ENOMEM;
 
+	private->all_drm_private = devm_kmalloc_array(dev, drv_data->mmsys_dev_num,
+						      sizeof(*private->all_drm_private),
+						      GFP_KERNEL);
+	if (!private->all_drm_private)
+		return -ENOMEM;
+
+	private->data = drv_data;
 	private->mmsys_dev = dev->parent;
 	if (!private->mmsys_dev) {
 		dev_err(dev, "Failed to get MMSYS device\n");
 		return -ENODEV;
 	}
-
-	of_id = of_match_node(mtk_drm_of_ids, phandle);
-	if (!of_id)
-		return -ENODEV;
-
-	private->data = of_id->data;
+	mmsys_priv = dev_get_drvdata(private->mmsys_dev);
+	mmsys_priv->drm_private = private;
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
@@ -550,7 +786,13 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		comp_type = (enum mtk_ddp_comp_type)of_id->data;
 
 		if (comp_type == MTK_DISP_MUTEX) {
-			private->mutex_node = of_node_get(node);
+			int id;
+
+			id = of_alias_get_id(node, "mutex");
+			if (id < 0 || id == drv_data->mmsys_id) {
+				private->mutex_node = of_node_get(node);
+				dev_dbg(dev, "get mutex for mmsys %d", drv_data->mmsys_id);
+			}
 			continue;
 		}
 
@@ -561,6 +803,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		if (!mtk_drm_find_mmsys_comp(private, comp_id))
+			continue;
+
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index fc03cfda7601..241c134966a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -29,14 +29,15 @@ struct mtk_mmsys_driver_data {
 	unsigned int third_len;
 
 	bool shadow_register;
+	unsigned int mmsys_id;
+	unsigned int mmsys_dev_num;
 };
 
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
-
-	unsigned int num_pipes;
-
+	bool mtk_drm_bound;
+	struct device *dev;
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
 	struct device *mmsys_dev;
@@ -44,6 +45,14 @@ struct mtk_drm_private {
 	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
+	struct mtk_drm_private **all_drm_private;
+};
+
+/* duplicate with mmsys private data */
+struct mtk_mmsys_private {
+	void __iomem *regs_reserved;
+	void *data_reserved;
+	struct mtk_drm_private *drm_private;
 };
 
 extern struct platform_driver mtk_disp_ccorr_driver;
-- 
2.18.0

