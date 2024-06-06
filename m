Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE48FE270
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11D510E886;
	Thu,  6 Jun 2024 09:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EFerXMHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4AE10E886
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:21:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C51C461CE2;
 Thu,  6 Jun 2024 09:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67703C2BD10;
 Thu,  6 Jun 2024 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717665693;
 bh=C8sulEDJMrxWYwdcSw3tGuQJg30NjDlZJQNANrn1vsA=;
 h=From:To:Cc:Subject:Date:From;
 b=EFerXMHJ/BuFTp3gArt56JMANEARiwmx+3u3439NienSDrWW2U1at+iMb7h06wKYo
 FdA4GUWvOobJietEPmp/1VRYQv+nRH7GV5Li0/7m6VrX3cu/gTxU59KNTe24avtB5a
 3joAkd0XcXmYTl2SeMjjx5iWexZR+CqzwNBEl+s/cm/yMPz1bSeIOOJxuqA5Bkzs0M
 q4U37ml6qELvOwjX69MMw1O/kESa4cRAs/8MeTv74E+0N6wqyN6zY85wOUR7t7tWeV
 PVClUNTc5f7kyB9mhUNcOxnS3mjOfwowjgYjbtg6qsd4LpMaZODCzDCV0Dt66HImGa
 r6XZ0RyABTz4g==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Stu Hsieh <stu.hsieh@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH RESEND v5] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Date: Thu,  6 Jun 2024 11:21:22 +0200
Message-Id: <20240606092122.2026313-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_find_possible_crtcs() assumes that the main path will always have
the CRTC with id 0, the ext id 1 and the third id 2. This is only true
if the paths are all available. But paths are optional (see also
comment in mtk_drm_kms_init()), e.g. the main path might not be enabled
or available at all. Then the CRTC IDs will shift one up, e.g. ext will
be 0 and the third path will be 1.

To fix that, dynamically calculate the IDs by the presence of the paths.

While at it, make the return code a signed one and return -ENODEV if no
path is found and handle the error in the callers.

Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
You can find v4 at [1]. Unfortunately, it was never applied and in the
meantime there was a change in mtk_find_possible_crtcs(). So I've
dropped Nícolas Reviewed and Tested-by tags and Angelos Reviewed-by
tag.

[1] https://lore.kernel.org/r/20230905084922.3908121-2-mwalle@kernel.org/
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 105 ++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c      |   5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c      |   5 +-
 4 files changed, 78 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 17b036411292..9a8c1cace8a0 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -514,29 +514,42 @@ static bool mtk_ddp_comp_find(struct device *dev,
 	return false;
 }
 
-static unsigned int mtk_ddp_comp_find_in_route(struct device *dev,
-					       const struct mtk_drm_route *routes,
-					       unsigned int num_routes,
-					       struct mtk_ddp_comp *ddp_comp)
+static int mtk_ddp_comp_find_in_route(struct device *dev,
+				      const struct mtk_drm_route *routes,
+				      unsigned int num_routes,
+				      struct mtk_ddp_comp *ddp_comp)
 {
-	int ret;
 	unsigned int i;
 
-	if (!routes) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (!routes)
+		return -EINVAL;
 
 	for (i = 0; i < num_routes; i++)
 		if (dev == ddp_comp[routes[i].route_ddp].dev)
 			return BIT(routes[i].crtc_id);
 
-	ret = -ENODEV;
-err:
+	return -ENODEV;
+}
 
-	DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
+static bool mtk_ddp_path_available(const unsigned int *path,
+				   unsigned int path_len,
+				   struct device_node **comp_node)
+{
+	unsigned int i;
 
-	return 0;
+	if (!path || !path_len)
+		return false;
+
+	for (i = 0U; i < path_len; i++) {
+		/* OVL_ADAPTOR doesn't have a device node */
+		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
+			continue;
+
+		if (!comp_node[path[i]])
+			return false;
+	}
+
+	return true;
 }
 
 int mtk_ddp_comp_get_id(struct device_node *node,
@@ -554,32 +567,52 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
-unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
+int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
-
-	if (mtk_ddp_comp_find(dev,
-			      private->data->main_path,
-			      private->data->main_len,
-			      private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_ddp_comp_find(dev,
-				   private->data->ext_path,
-				   private->data->ext_len,
-				   private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_ddp_comp_find(dev,
-				   private->data->third_path,
-				   private->data->third_len,
-				   private->ddp_comp))
-		ret = BIT(2);
-	else
-		ret = mtk_ddp_comp_find_in_route(dev,
-						 private->data->conn_routes,
-						 private->data->num_conn_routes,
-						 private->ddp_comp);
+	const struct mtk_mmsys_driver_data *data;
+	struct mtk_drm_private *priv_n;
+	int i = 0, j;
+	int ret;
 
+	for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		priv_n = private->all_drm_private[j];
+		data = priv_n->data;
+
+		if (mtk_ddp_path_available(data->main_path, data->main_len,
+					   priv_n->comp_node)) {
+			if (mtk_ddp_comp_find(dev, data->main_path,
+					      data->main_len,
+					      priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
+					   priv_n->comp_node)) {
+			if (mtk_ddp_comp_find(dev, data->ext_path,
+					      data->ext_len,
+					      priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->third_path, data->third_len,
+					   priv_n->comp_node)) {
+			if (mtk_ddp_comp_find(dev, data->third_path,
+					      data->third_len,
+					      priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+	}
+
+	ret = mtk_ddp_comp_find_in_route(dev,
+					 private->data->conn_routes,
+					 private->data->num_conn_routes,
+					 private->ddp_comp);
+
+	DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 26236691ce4c..e2ea19d5ddcb 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -326,7 +326,7 @@ static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
 
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
-unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
+int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 5c86aa0b75b2..b894be9f1f53 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -814,7 +814,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dpi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm_dev, dpi->dev);
+	ret = mtk_find_possible_crtcs(drm_dev, dpi->dev);
+	if (ret < 0)
+		goto err_cleanup;
+	dpi->encoder.possible_crtcs = ret;
 
 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 2b0ac859a653..b450b7223aa2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -861,7 +861,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		return ret;
 	}
 
-	dsi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm, dsi->host.dev);
+	ret = mtk_find_possible_crtcs(drm, dsi->host.dev);
+	if (ret < 0)
+		goto err_cleanup_encoder;
+	dsi->encoder.possible_crtcs = ret;
 
 	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-- 
2.39.2

