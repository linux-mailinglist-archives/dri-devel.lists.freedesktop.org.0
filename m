Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591565683C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 09:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B0010E2EF;
	Tue, 27 Dec 2022 08:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABCD10E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 08:10:20 +0000 (UTC)
X-UUID: a628e4d601294850ba2f5ec9d73fa4a7-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wt4K2iY8n7/9K7sSpHib5XwkLENUUNJMQYxSXVYnGAI=; 
 b=D5ImPCcb6GuHbSP0XGUc6eXnF22c7foXp3fiQWrNSbJoHCQxKf16i6FubK5S0Fw15wQVllitCfBeM6mzSZN6iqaMFuAyX/eBkN2Cy0IojDdcpnuqyQcqcp3nXo3f8Y3cqXBfymO81apRO2vsx3X/WtgVGnwkFwVnlW/3uMMVxgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:a493712c-b767-4452-a1ba-f62f00619fb8, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:dcaaed0, CLOUDID:e8db838a-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a628e4d601294850ba2f5ec9d73fa4a7-20221227
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 495276351; Tue, 27 Dec 2022 16:10:14 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 16:10:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 16:10:13 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v29 5/7] drm/mediatek: modify mediatek-drm for mt8195 multi
 mmsys support
Date: Tue, 27 Dec 2022 16:10:09 +0800
Message-ID: <20221227081011.6426-6-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227081011.6426-1-nancy.lin@mediatek.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com, Nick
 Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
only one drm driver register as the drm device.
Each drm driver binds its own component. The last bind drm driver
allocates and registers the drm device to drm core.
Each crtc path is created with the corresponding drm driver data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 296 ++++++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
 4 files changed, 245 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 78e20f604158..30dcb65d8a5a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -874,21 +874,28 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
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
@@ -900,7 +907,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (!node) {
 			dev_info(dev,
 				 "Not creating crtc %d because component %d is disabled or missing\n",
-				 pipe, comp_id);
+				 crtc_i, comp_id);
 			return 0;
 		}
 
@@ -956,7 +963,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
-						    pipe);
+						    crtc_i);
 		if (ret)
 			return ret;
 	}
@@ -968,24 +975,23 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	 */
 	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
 
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
+	i = priv->mbox_index++;
 	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
 	mtk_crtc->cmdq_client.client.tx_block = false;
 	mtk_crtc->cmdq_client.client.knows_txdone = true;
 	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
 	mtk_crtc->cmdq_client.chan =
-			mbox_request_channel(&mtk_crtc->cmdq_client.client,
-					     drm_crtc_index(&mtk_crtc->base));
+			mbox_request_channel(&mtk_crtc->cmdq_client.client, i);
 	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
@@ -995,7 +1001,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (mtk_crtc->cmdq_client.chan) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
-						 drm_crtc_index(&mtk_crtc->base),
+						 i,
 						 &mtk_crtc->cmdq_event);
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index f5a6e80c5265..606f72f35924 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -17,7 +17,8 @@
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
index 83fd4f38d07b..4de5d0009a06 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -214,6 +214,7 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.ext_path = mt2701_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
 	.shadow_register = true,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
@@ -222,6 +223,7 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.ext_path = mt7623_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt7623_mtk_ddp_ext),
 	.shadow_register = true,
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
@@ -231,11 +233,13 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
 	.third_path = mt2712_mtk_ddp_third,
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.main_path = mt8167_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
@@ -243,6 +247,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
 	.ext_path = mt8173_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -250,6 +255,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
 	.ext_path = mt8183_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
@@ -257,6 +263,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
 	.ext_path = mt8186_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -264,36 +271,124 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
 	.ext_path = mt8192_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+	.mmsys_dev_num = 1,
 };
 
+static const struct of_device_id mtk_drm_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-mmsys",
+	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt7623-mmsys",
+	  .data = &mt7623_mmsys_driver_data},
+	{ .compatible = "mediatek,mt2712-mmsys",
+	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8167-mmsys",
+	  .data = &mt8167_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8173-mmsys",
+	  .data = &mt8173_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8183-mmsys",
+	  .data = &mt8183_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8186-mmsys",
+	  .data = &mt8186_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8192-mmsys",
+	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-mmsys",
+	  .data = &mt8195_vdosys0_driver_data},
+	{ .compatible = "mediatek,mt8195-vdosys0",
+	  .data = &mt8195_vdosys0_driver_data},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
+
+static int mtk_drm_match(struct device *dev, void *data)
+{
+	if (!strncmp(dev_name(dev), "mediatek-drm", sizeof("mediatek-drm") - 1))
+		return true;
+	return false;
+}
+
+static bool mtk_drm_get_all_drm_priv(struct device *dev)
+{
+	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
+	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
+	struct device_node *node;
+	struct device *drm_dev;
+	int cnt = 0;
+	int i, j;
+
+	for_each_child_of_node(phandle->parent, node) {
+		struct platform_device *pdev;
+
+		of_id = of_match_node(mtk_drm_of_ids, node);
+		if (!of_id)
+			continue;
+
+		pdev = of_find_device_by_node(node);
+		if (!pdev)
+			continue;
+
+		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
+		if (!drm_dev || !dev_get_drvdata(drm_dev))
+			continue;
+
+		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
+		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
+			cnt++;
+	}
+
+	if (drm_priv->data->mmsys_dev_num == cnt) {
+		for (i = 0; i < cnt; i++)
+			for (j = 0; j < cnt; j++)
+				all_drm_priv[j]->all_drm_private[i] = all_drm_priv[i];
+
+		return true;
+	}
+
+	return false;
+}
+
+static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id)
+{
+	const struct mtk_mmsys_driver_data *drv_data = private->data;
+	int i;
+
+	if (drv_data->main_path)
+		for (i = 0; i < drv_data->main_len; i++)
+			if (drv_data->main_path[i] == comp_id)
+				return true;
+
+	if (drv_data->ext_path)
+		for (i = 0; i < drv_data->ext_len; i++)
+			if (drv_data->ext_path[i] == comp_id)
+				return true;
+
+	if (drv_data->third_path)
+		for (i = 0; i < drv_data->third_len; i++)
+			if (drv_data->third_path[i] == comp_id)
+				return true;
+
+	return false;
+}
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
+	struct mtk_drm_private *priv_n;
 	struct platform_device *pdev;
-	struct device_node *np;
+	struct device_node *np = NULL;
 	struct device *dma_dev;
-	int ret;
+	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
 
-	if (!iommu_present(&platform_bus_type))
-		return -EPROBE_DEFER;
-
-	pdev = of_find_device_by_node(private->mutex_node);
-	if (!pdev) {
-		dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
-			private->mutex_node);
-		of_node_put(private->mutex_node);
-		return -EPROBE_DEFER;
-	}
-	private->mutex_dev = &pdev->dev;
-
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		goto put_mutex_dev;
@@ -311,9 +406,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
-	ret = component_bind_all(drm->dev, drm);
-	if (ret)
-		goto put_mutex_dev;
+	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+		drm->dev_private = private->all_drm_private[i];
+		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
+		if (ret)
+			goto put_mutex_dev;
+	}
 
 	/*
 	 * Ensure internal panels are at the top of the connector list before
@@ -322,28 +420,53 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm_helper_move_panel_connectors_to_head(drm);
 
 	/*
-	 * We currently support two fixed data streams, each optional,
-	 * and each statically assigned to a crtc:
-	 * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
+	 * 1. We currently support two fixed data streams, each optional,
+	 *    and each statically assigned to a crtc:
+	 *    OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
+	 * 2. For multi mmsys architecture, crtc path data are located in
+	 *    different drm private data structures. Loop through crtc index to
+	 *    create crtc from the main path and then ext_path and finally the
+	 *    third path.
+	 * 3. Use OVL device for all DMA memory allocations
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
 
-	/* Use OVL device for all DMA memory allocations */
-	np = private->comp_node[private->data->main_path[0]] ?:
-	     private->comp_node[private->data->ext_path[0]];
 	pdev = of_find_device_by_node(np);
 	if (!pdev) {
 		ret = -ENODEV;
@@ -352,7 +475,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 
 	dma_dev = &pdev->dev;
-	private->dma_dev = dma_dev;
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		private->all_drm_private[i]->dma_dev = dma_dev;
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
@@ -374,9 +498,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
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
 
@@ -424,15 +551,36 @@ static const struct drm_driver mtk_drm_driver = {
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
+	struct platform_device *pdev;
 	struct drm_device *drm;
-	int ret;
+	int ret, i;
+
+	if (!iommu_present(&platform_bus_type))
+		return -EPROBE_DEFER;
+
+	pdev = of_find_device_by_node(private->mutex_node);
+	if (!pdev) {
+		dev_err(dev, "Waiting for disp-mutex device %pOF\n",
+			private->mutex_node);
+		of_node_put(private->mutex_node);
+		return -EPROBE_DEFER;
+	}
+
+	private->mutex_dev = &pdev->dev;
+	private->mtk_drm_bound = true;
+	private->dev = dev;
+
+	if (!mtk_drm_get_all_drm_priv(dev))
+		return 0;
 
 	drm = drm_dev_alloc(&mtk_drm_driver, dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	private->drm_master = true;
 	drm->dev_private = private;
-	private->drm = drm;
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		private->all_drm_private[i]->drm = drm;
 
 	ret = mtk_drm_kms_init(drm);
 	if (ret < 0)
@@ -457,10 +605,14 @@ static void mtk_drm_unbind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 
-	drm_dev_unregister(private->drm);
-	mtk_drm_kms_deinit(private->drm);
-	drm_dev_put(private->drm);
-	private->num_pipes = 0;
+	/* for multi mmsys dev, unregister drm dev in mmsys master */
+	if (private->drm_master) {
+		drm_dev_unregister(private->drm);
+		mtk_drm_kms_deinit(private->drm);
+		drm_dev_put(private->drm);
+	}
+	private->mtk_drm_bound = false;
+	private->drm_master = false;
 	private->drm = NULL;
 }
 
@@ -585,31 +737,6 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ }
 };
 
-static const struct of_device_id mtk_drm_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
-	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_driver_data},
-	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8167-mmsys",
-	  .data = &mt8167_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8186-mmsys",
-	  .data = &mt8186_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8192-mmsys",
-	  .data = &mt8192_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8195-mmsys",
-	  .data = &mt8195_vdosys0_driver_data},
-	{ .compatible = "mediatek,mt8195-vdosys0",
-	  .data = &mt8195_vdosys0_driver_data},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -637,6 +764,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	private->data = of_id->data;
 
+	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
+						      sizeof(*private->all_drm_private),
+						      GFP_KERNEL);
+	if (!private->all_drm_private)
+		return -ENOMEM;
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
@@ -656,7 +789,13 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		comp_type = (enum mtk_ddp_comp_type)of_id->data;
 
 		if (comp_type == MTK_DISP_MUTEX) {
-			private->mutex_node = of_node_get(node);
+			int id;
+
+			id = of_alias_get_id(node, "mutex");
+			if (id < 0 || id == private->data->mmsys_id) {
+				private->mutex_node = of_node_get(node);
+				dev_dbg(dev, "get mutex for mmsys %d", private->data->mmsys_id);
+			}
 			continue;
 		}
 
@@ -667,6 +806,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		if (!mtk_drm_find_mmsys_comp(private, comp_id))
+			continue;
+
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
@@ -742,16 +884,20 @@ static int mtk_drm_sys_prepare(struct device *dev)
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
 
-	return drm_mode_config_helper_suspend(drm);
+	if (private->drm_master)
+		return drm_mode_config_helper_suspend(drm);
+	else
+		return 0;
 }
 
 static void mtk_drm_sys_complete(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
-	int ret;
+	int ret = 0;
 
-	ret = drm_mode_config_helper_resume(drm);
+	if (private->drm_master)
+		ret = drm_mode_config_helper_resume(drm);
 	if (ret)
 		dev_err(dev, "Failed to resume\n");
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index d27561e5e274..8d3ff32b5364 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -29,14 +29,16 @@ struct mtk_mmsys_driver_data {
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
+	bool drm_master;
+	struct device *dev;
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
 	struct device *mmsys_dev;
@@ -44,6 +46,8 @@ struct mtk_drm_private {
 	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
+	unsigned int mbox_index;
+	struct mtk_drm_private **all_drm_private;
 };
 
 extern struct platform_driver mtk_disp_aal_driver;
-- 
2.18.0

