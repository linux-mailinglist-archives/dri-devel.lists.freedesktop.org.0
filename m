Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E121573B418
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C0510E0FB;
	Fri, 23 Jun 2023 09:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFCE10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:49:54 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6212A6607139;
 Fri, 23 Jun 2023 10:49:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687513793;
 bh=XfvTrdhefzvxACB2ZRzm/OIzNh2SK1K0ChTLnlUN3Ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3ss5Hr/bcLsC6lfeWJ35tAnT7oZ2O6oY+VrH/cZQ85fNtGplCDHa9RTOaLAZnVC8
 M7gvy+rqk3cLBQJJpVWBt11nSnMlzAhbjbLBoobFEyJlF6JrMed+W6cWAXakJmuFyQ
 2mzkiR21C1VGBLawDgglQNdH1UhOWBQWuySwhmz08Am62rnSi+chRLiIo2yjIldYhe
 nsJGGP1RWiVNwu2XoQ95nSgdQVciOzAQ6DJSkp6b1/QS5dZR4nbZgsYElXaApPvq0v
 z1GUmqCBfW53NjdO5L/EqRaGfVOk7mTo/B9Hn5FwQDrcrZCfiV+mwuOpBM0Qxj8jV6
 w8Xm46kjZB3Fw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 1/3] drm/mediatek: Dynamically allocate CMDQ and use helper
 functions
Date: Fri, 23 Jun 2023 11:49:29 +0200
Message-Id: <20230623094931.117918-2-angelogioacchino.delregno@collabora.com>
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

Instead of stack allocating the cmdq_client and cmdq_handle structures
switch them to pointers, allowing us to migrate this driver to use the
common functions provided by mtk-cmdq-helper.
In order to do this, it was also necessary to add a `priv` pointer to
struct cmdq_client, as that's used to pass (in this case) a mtk_crtc
handle to the ddp_cmdq_cb() mailbox RX callback function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 107 +++++++-----------------
 include/linux/soc/mediatek/mtk-cmdq.h   |   1 +
 2 files changed, 32 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0df62b076f49..b63289ab6787 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -50,8 +50,8 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_client		cmdq_client;
-	struct cmdq_pkt			cmdq_handle;
+	struct cmdq_client		*cmdq_client;
+	struct cmdq_pkt			*cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 	wait_queue_head_t		cb_blocking_queue;
@@ -108,47 +108,6 @@ static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
-				   size_t size)
-{
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base) {
-		kfree(pkt);
-		return -ENOMEM;
-	}
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		kfree(pkt);
-		return -ENOMEM;
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return 0;
-}
-
-static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	kfree(pkt);
-}
-#endif
-
 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -156,12 +115,9 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
-
-	if (mtk_crtc->cmdq_client.chan) {
-		mbox_free_channel(mtk_crtc->cmdq_client.chan);
-		mtk_crtc->cmdq_client.chan = NULL;
-	}
+	cmdq_pkt_destroy(mtk_crtc->cmdq_handle);
+	cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+	mtk_crtc->cmdq_client = NULL;
 #endif
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -288,7 +244,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
 	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
-	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
+	struct mtk_drm_crtc *mtk_crtc = (struct mtk_drm_crtc *)cmdq_cl->priv;
 	struct mtk_crtc_state *state;
 	unsigned int i;
 
@@ -546,7 +502,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
+	struct cmdq_pkt *cmdq_handle = mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -584,14 +540,14 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_client.chan) {
-		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
+	if (mtk_crtc->cmdq_client) {
+		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
+		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
@@ -604,8 +560,8 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 3;
 
-		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -619,7 +575,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
 		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
@@ -722,7 +678,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_drm_crtc_update_config(mtk_crtc, false);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	/* Wait for planes to be disabled by cmdq */
-	if (mtk_crtc->cmdq_client.chan)
+	if (mtk_crtc->cmdq_client)
 		wait_event_timeout(mtk_crtc->cb_blocking_queue,
 				   mtk_crtc->cmdq_vblank_cnt == 0,
 				   msecs_to_jiffies(500));
@@ -1002,19 +958,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	i = priv->mbox_index++;
-	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
-	mtk_crtc->cmdq_client.client.tx_block = false;
-	mtk_crtc->cmdq_client.client.knows_txdone = true;
-	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
-	mtk_crtc->cmdq_client.chan =
-			mbox_request_channel(&mtk_crtc->cmdq_client.client, i);
-	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
-		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
-			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_client.chan = NULL;
+
+	mtk_crtc->cmdq_client = cmdq_mbox_create(mtk_crtc->mmsys_dev, i);
+	if (IS_ERR(mtk_crtc->cmdq_client)) {
+		ret = PTR_ERR(mtk_crtc->cmdq_client);
+		dev_dbg(dev, "Failed to create CMDQ client: %d\n", ret);
+		mtk_crtc->cmdq_client = NULL;
+		return 0;
 	}
 
-	if (mtk_crtc->cmdq_client.chan) {
+	/* Setup the CMDQ handler callback */
+	mtk_crtc->cmdq_client->priv = mtk_crtc;
+	mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
+
+	if (mtk_crtc->cmdq_client) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 i,
@@ -1022,17 +979,15 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_client.chan);
-			mtk_crtc->cmdq_client.chan = NULL;
+			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+			mtk_crtc->cmdq_client = NULL;
 		} else {
-			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
-						      &mtk_crtc->cmdq_handle,
-						      PAGE_SIZE);
+			mtk_crtc->cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_client.chan);
-				mtk_crtc->cmdq_client.chan = NULL;
+				cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+				mtk_crtc->cmdq_client = NULL;
 			}
 		}
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 649955d2cf5c..2a1dc8b12db3 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -25,6 +25,7 @@ struct cmdq_client_reg {
 struct cmdq_client {
 	struct mbox_client client;
 	struct mbox_chan *chan;
+	void *priv;
 };
 
 #if IS_ENABLED(CONFIG_MTK_CMDQ)
-- 
2.40.1

