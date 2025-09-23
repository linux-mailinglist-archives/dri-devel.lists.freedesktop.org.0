Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C767B968FE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C8610E204;
	Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ma1flkly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E510010E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF2DA44521;
 Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDD6C113CF;
 Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758641172;
 bh=PsJAbGUFgpe5g/scTy+yXdnPAge1y+ZrMfeoR4lXF1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ma1flkly2f1uNKpKvOHlthl8/236GxH1+vA8DkFIHwHZLexNBGq/13eI7BbrDbRdI
 zqBh+mSWGWvPQGcpLc2IfjKRzI0MT/C4b6RvTyIxYh6X5ZL4dPb66bhz1wNSKrkKzf
 2+zhu1vcxxincXvOtKJImCbVAXGB8Rg6vYl36l7L0JluiBbx8pBPJWi09fsRO4l1h2
 XZaU5mGu9+SpQ3OM1hIshkwBJcTuAX/MDnVwmZTeU965zJptw8QSoopk1Rw+2swTcz
 f2p+NdEmTzxmMpGmmEi5NusSgPtXqRWZNlsEHhjNMAtfrPIkM71N5ySZiHW54Js25y
 A91X7vxSnxdrA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v14u6-000000004mo-3m3w;
 Tue, 23 Sep 2025 17:26:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 1/5] drm/mediatek: fix probe resource leaks
Date: Tue, 23 Sep 2025 17:23:36 +0200
Message-ID: <20250923152340.18234-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to unmap and release the component iomap and clock on probe
failure (e.g. probe deferral) and on driver unbind.

Note that unlike of_iomap(), devm_of_iomap() also checks whether the
region is already mapped.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Cc: stable@vger.kernel.org	# 4.7
Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 20 ++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  4 ++--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262..0264017806ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -621,15 +621,20 @@ int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 	return ret;
 }
 
-int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
+static void mtk_ddp_comp_clk_put(void *_clk)
+{
+	struct clk *clk = _clk;
+
+	clk_put(clk);
+}
+
+int mtk_ddp_comp_init(struct device *dev, struct device_node *node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id)
 {
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
 	struct mtk_ddp_comp_dev *priv;
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	int ret;
-#endif
 
 	if (comp_id >= DDP_COMPONENT_DRM_ID_MAX)
 		return -EINVAL;
@@ -670,11 +675,18 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (!priv)
 		return -ENOMEM;
 
-	priv->regs = of_iomap(node, 0);
+	priv->regs = devm_of_iomap(dev, node, 0, NULL);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
 	priv->clk = of_clk_get(node, 0);
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
+	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	if (ret)
+		return ret;
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 7289b3dcf22f..3f3d43f4330d 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -350,7 +350,7 @@ static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
-int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
+int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index eb5537f0ac90..384b0510272c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1133,7 +1133,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 							    (void *)private->mmsys_dev,
 							    sizeof(*private->mmsys_dev));
 		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
-		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
+		mtk_ddp_comp_init(dev, NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
 				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
 		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
 	}
@@ -1199,7 +1199,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 						   node);
 		}
 
-		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
+		ret = mtk_ddp_comp_init(dev, node, &private->ddp_comp[comp_id], comp_id);
 		if (ret) {
 			of_node_put(node);
 			goto err_node;
-- 
2.49.1

