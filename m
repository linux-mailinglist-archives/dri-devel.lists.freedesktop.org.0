Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387073B41B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CA610E136;
	Fri, 23 Jun 2023 09:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1E10E136
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:49:55 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 48535660713A;
 Fri, 23 Jun 2023 10:49:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687513794;
 bh=k4XdsnX1AOsyqpdJBClLMJ/9rHOeGlvlyiKFJbOyaAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nMVfb1uWknpZymxUC/IT7fnNt3h2V7S6K2Ky4O2+V3bN4RW4h+pLdbMRJ2N83xSGA
 /UpBN6ur6lBFS4yKyiRsWfgHRV/7L/hQ8KDYQiQ28U602dmXC0W6Op2rOoFaM5IkDU
 GaBvJGp7FAL6/mbM8GKyqnnynl0TKG7SH9BG+aSkdFh/8rwbPRhM7p0eLyauCqb8m0
 WmHP0umbrWQTISrj0e73w94Uyrp7RITOJzjALZ2w9XJJ8PjIYTBMAHxxmls6A0TtTV
 5SciRCQj2WYmZwEIDwHOrJ/MGZVX7QFH7w0reIcocjVjpcMQGHk0POTLTXN3KFJIpO
 L88j8rZbi1ndg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 2/3] drm/mediatek: Remove all preprocessor ifs for
 CONFIG_MTK_CMDQ
Date: Fri, 23 Jun 2023 11:49:30 +0200
Message-Id: <20230623094931.117918-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this driver was migrated to use the MediaTek CMDQ helpers,
it's not anymore necessary to exclude CMDQ related code with
preprocessor if branches, as CMDQ is optional and the helpers
are providing the necessary inline functions to manage the case
in which CONFIG_MTK_CMDQ is not set.

Clean up all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)`
from all drivers in drm/mediatek.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  2 --
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 22 +++------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 12 -----------
 drivers/gpu/drm/mediatek/mtk_ethdr.c        |  6 ++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c     |  3 +--
 11 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 17a4d4a3b040..3faed081ea10 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -119,11 +119,9 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap aal\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 3f4bf7319f17..5a901ded8086 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -174,11 +174,9 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap ccorr\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index b188d3393f99..af866039bc38 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -112,11 +112,9 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap color\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 1bf709bac0cf..64ba5c5b631f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -278,11 +278,9 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap gamma\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 60e0b4e70978..69b6f7229339 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -269,11 +269,9 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->reset_ctl);
 	}
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->fifo_en = of_property_read_bool(dev->of_node,
 					      "mediatek,merge-fifo-en");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 4c00e42ef0a8..854c7545d67d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -531,11 +531,9 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap ovl\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 5e90b6d593f5..c9bce38986c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -334,11 +334,9 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap rdma\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	if (of_find_property(dev->of_node, "mediatek,rdma-fifo-size", &ret)) {
 		ret = of_property_read_u32(dev->of_node,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index b63289ab6787..88c63330a421 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -49,13 +49,11 @@ struct mtk_drm_crtc {
 	bool				pending_planes;
 	bool				pending_async_planes;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_client		*cmdq_client;
 	struct cmdq_pkt			*cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 	wait_queue_head_t		cb_blocking_queue;
-#endif
 
 	struct device			*mmsys_dev;
 	struct device			*dma_dev;
@@ -114,11 +112,9 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 	int i;
 
 	mtk_mutex_put(mtk_crtc->mutex);
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	cmdq_pkt_destroy(mtk_crtc->cmdq_handle);
 	cmdq_mbox_destroy(mtk_crtc->cmdq_client);
 	mtk_crtc->cmdq_client = NULL;
-#endif
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp;
@@ -239,7 +235,6 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	return NULL;
 }
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
@@ -282,7 +277,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
-#endif
 
 static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 {
@@ -501,9 +495,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_pkt *cmdq_handle = mtk_crtc->cmdq_handle;
-#endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	unsigned int pending_planes = 0, pending_async_planes = 0;
@@ -539,7 +531,6 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_crtc_ddp_config(crtc, NULL);
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client) {
 		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle->cmd_buf_size = 0;
@@ -563,7 +554,6 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
 	}
-#endif
 	mtk_crtc->config_updating = false;
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
@@ -574,16 +564,12 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
 		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
 			  drm_crtc_index(&mtk_crtc->base));
-#else
-	if (!priv->data->shadow_register)
-		mtk_crtc_ddp_config(crtc, NULL);
-#endif
+
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
@@ -676,13 +662,13 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->pending_planes = true;
 
 	mtk_drm_crtc_update_config(mtk_crtc, false);
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+
 	/* Wait for planes to be disabled by cmdq */
 	if (mtk_crtc->cmdq_client)
 		wait_event_timeout(mtk_crtc->cb_blocking_queue,
 				   mtk_crtc->cmdq_vblank_cnt == 0,
 				   msecs_to_jiffies(500));
-#endif
+
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
 
@@ -956,7 +942,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
 	mutex_init(&mtk_crtc->hw_lock);
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	i = priv->mbox_index++;
 
 	mtk_crtc->cmdq_client = cmdq_mbox_create(mtk_crtc->mmsys_dev, i);
@@ -994,6 +979,5 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		/* for sending blocking cmd in crtc disable */
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
-#endif
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c77af2e4000f..3fd6cc3670ab 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -70,12 +70,10 @@ void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset)
 {
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
 		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
 			       cmdq_reg->offset + offset, value);
 	else
-#endif
 		writel(value, regs + offset);
 }
 
@@ -83,12 +81,10 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			   unsigned int offset)
 {
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
 		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
 			       cmdq_reg->offset + offset, value);
 	else
-#endif
 		writel_relaxed(value, regs + offset);
 }
 
@@ -96,19 +92,15 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask)
 {
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
 		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
 				    cmdq_reg->offset + offset, value, mask);
 	} else {
-#endif
 		u32 tmp = readl(regs + offset);
 
 		tmp = (tmp & ~mask) | (value & mask);
 		writel(tmp, regs + offset);
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	}
-#endif
 }
 
 static int mtk_ddp_clk_enable(struct device *dev)
@@ -550,9 +542,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
 	struct mtk_ddp_comp_dev *priv;
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	int ret;
-#endif
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_DRM_ID_MAX)
 		return -EINVAL;
@@ -598,11 +588,9 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
 
 	platform_set_drvdata(comp_pdev, priv);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 4a5bd5bb9d6e..929479fa22f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -303,12 +303,10 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	for (i = 0; i < ETHDR_ID_MAX; i++) {
 		priv->ethdr_comp[i].dev = dev;
 		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-		ret = cmdq_dev_get_client_reg(dev,
-					      &priv->ethdr_comp[i].cmdq_base, i);
+		ret = cmdq_dev_get_client_reg(dev, &priv->ethdr_comp[i].cmdq_base, i);
 		if (ret)
 			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
+
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 93ef05ec9720..897e8e2a1d05 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -293,11 +293,10 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clk))
 		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get rdma clk\n");
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_pm_runtime_enable(dev);
-- 
2.40.1

