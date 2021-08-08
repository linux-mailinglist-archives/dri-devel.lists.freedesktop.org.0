Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D558F3E3D37
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 01:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704F5898D9;
	Sun,  8 Aug 2021 23:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8401E898CC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 23:47:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD6CC60E53;
 Sun,  8 Aug 2021 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628466472;
 bh=xmyb+69TZrKaCU1pp1cXsTuGGJovIt+pixp1i4wic7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDVzD/Pcsv2dmdMtCE5HS0QjztT/vqE2n0KBD6oSPMut6B5EDQLdphtlaihR1hG7r
 WZLHRmzKXzwp30Gc4gSbCjsWx47SZciHBRz8faLdfWbqR+E1AWv+rNLcU812fy3iCA
 fRIEHhkNmmouv6LEWt9yGVCGcMy2yse78l7ugmXl1Ku/zEiriqOc1xzjlNcAUcV6mS
 qCLhHxludV7vyolyD2I0QAIk4bFUyOpdTxv4Dz5OO702sZLAC7hZQlx9Rn84j1VlWr
 NWJGPLHy/duXTKsij/06L7OIWKgnME1jKs7lP1KC9imcbD9mWAQV25WeuP/Mi241sp
 PmkJig+HPQ3mQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 2/4] drm/mediatek: Remove struct cmdq_client
Date: Mon,  9 Aug 2021 07:47:31 +0800
Message-Id: <20210808234733.14782-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808234733.14782-1-chunkuang.hu@kernel.org>
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
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

In mailbox rx_callback, it pass struct mbox_client to callback
function, but it could not map back to mtk_drm_crtc instance
because struct cmdq_client use a pointer to struct mbox_client:

struct cmdq_client {
	struct mbox_client client;
	struct mbox_chan *chan;
};

struct mtk_drm_crtc {
	/* client instance data */
	struct cmdq_client *cmdq_client;
};

so remove struct cmdq_client and let mtk_drm_crtc instance define
mbox_client as:

struct mtk_drm_crtc {
	/* client instance data */
	struct mbox_client cl;
};

and in rx_callback function, use struct mbox_client to get
struct mtk_drm_crtc.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 80 +++++++++++++++++++------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index cac8fe219c95..da92a3fedd0a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,7 +52,8 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_client		*cmdq_client;
+	struct mbox_client		cmdq_cl;
+	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
 #endif
 
@@ -224,11 +225,51 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t size)
+{
+	struct cmdq_pkt *pkt;
+	struct device *dev;
+	dma_addr_t dma_addr;
+
+	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
+	if (!pkt)
+		return ERR_PTR(-ENOMEM);
+	pkt->va_base = kzalloc(size, GFP_KERNEL);
+	if (!pkt->va_base) {
+		kfree(pkt);
+		return ERR_PTR(-ENOMEM);
+	}
+	pkt->buf_size = size;
+
+	dev = chan->mbox->dev;
+	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
+				  DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
+		kfree(pkt->va_base);
+		kfree(pkt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	pkt->pa_base = dma_addr;
+
+	return pkt;
+}
+
+static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
+{
+	dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+			 DMA_TO_DEVICE);
+	kfree(pkt->va_base);
+	kfree(pkt);
+}
+
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
+	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
-	cmdq_pkt_destroy(data->pkt);
+	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
 
@@ -472,19 +513,19 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_client) {
-		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
-		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
+	if (mtk_crtc->cmdq_chan) {
+		mbox_flush(mtk_crtc->cmdq_chan, 2000);
+		cmdq_handle = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+		dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
-		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -498,7 +539,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
 #else
 	if (!priv->data->shadow_register)
 #endif
@@ -841,17 +882,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	mutex_init(&mtk_crtc->hw_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_crtc->cmdq_client =
-			cmdq_mbox_create(mtk_crtc->mmsys_dev,
-					 drm_crtc_index(&mtk_crtc->base));
-	if (IS_ERR(mtk_crtc->cmdq_client)) {
+	mtk_crtc->cmdq_cl.dev = mtk_crtc->mmsys_dev;
+	mtk_crtc->cmdq_cl.tx_block = false;
+	mtk_crtc->cmdq_cl.knows_txdone = true;
+	mtk_crtc->cmdq_cl.rx_callback = ddp_cmdq_cb;
+	mtk_crtc->cmdq_chan =
+			mbox_request_channel(&mtk_crtc->cmdq_cl,
+					      drm_crtc_index(&mtk_crtc->base));
+	if (IS_ERR(mtk_crtc->cmdq_chan)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_client = NULL;
+		mtk_crtc->cmdq_chan = NULL;
 	}
 
-	if (mtk_crtc->cmdq_client) {
-		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
+	if (mtk_crtc->cmdq_chan) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
@@ -859,8 +903,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
-			mtk_crtc->cmdq_client = NULL;
+			mbox_free_channel(mtk_crtc->cmdq_chan);
+			mtk_crtc->cmdq_chan = NULL;
 		}
 	}
 #endif
-- 
2.25.1

