Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2F41D19C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 04:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802F16EB38;
	Thu, 30 Sep 2021 02:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34736E2DC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:47:10 +0000 (UTC)
X-UUID: d4da3c2b99de4599a9f95313f00b93d3-20210930
X-UUID: d4da3c2b99de4599a9f95313f00b93d3-20210930
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1260240225; Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Sep 2021 10:47:06 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias
 Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
Date: Thu, 30 Sep 2021 10:47:02 +0800
Message-ID: <20210930024704.6966-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
crash at using pkt->cl->chan in cmdq_pkt_finalize.

So add struct cmdq_client and let mtk_drm_crtc instance define
cmdq_client as:

struct mtk_drm_crtc {
	/* client instance data */
	struct cmdq_client cmdq_client;
};

and in rx_callback function can use pkt->cl to get
struct cmdq_client.

Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5f81489fc60c..411d99fcbb8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,8 +52,7 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct mbox_client		cmdq_cl;
-	struct mbox_chan		*cmdq_chan;
+	struct cmdq_client		cmdq_client;
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
@@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
-				    size_t size)
+static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
+				   size_t size)
 {
 	struct device *dev;
 	dma_addr_t dma_addr;
@@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
 		return -ENOMEM;
 	}
 	pkt->buf_size = size;
+	pkt->cl = (void *)client;
 
-	dev = chan->mbox->dev;
+	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
 				  DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, dma_addr)) {
@@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
 	return 0;
 }
 
-static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 {
-	dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
+
+	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
 	kfree(pkt);
@@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pk
 
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
+	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
+	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
 	struct mtk_crtc_state *state;
 	unsigned int i;
 
@@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
+	mtk_drm_cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_chan) {
-		mbox_flush(mtk_crtc->cmdq_chan, 2000);
+	if (mtk_crtc->cmdq_client.chan) {
+		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
 		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
-					    cmdq_handle->pa_base,
-					    cmdq_handle->cmd_buf_size,
-					    DMA_TO_DEVICE);
+		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
+					   cmdq_handle->pa_base,
+					   cmdq_handle->cmd_buf_size,
+					   DMA_TO_DEVICE);
 		/*
 		 * CMDQ command should execute in next vblank,
 		 * If it fail to execute in next 2 vblank, timeout happen.
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 2;
-		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
 		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
@@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	mutex_init(&mtk_crtc->hw_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_crtc->cmdq_cl.dev = mtk_crtc->mmsys_dev;
-	mtk_crtc->cmdq_cl.tx_block = false;
-	mtk_crtc->cmdq_cl.knows_txdone = true;
-	mtk_crtc->cmdq_cl.rx_callback = ddp_cmdq_cb;
-	mtk_crtc->cmdq_chan =
-			mbox_request_channel(&mtk_crtc->cmdq_cl,
-					      drm_crtc_index(&mtk_crtc->base));
-	if (IS_ERR(mtk_crtc->cmdq_chan)) {
+	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
+	mtk_crtc->cmdq_client.client.tx_block = false;
+	mtk_crtc->cmdq_client.client.knows_txdone = true;
+	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
+	mtk_crtc->cmdq_client.chan =
+			mbox_request_channel(&mtk_crtc->cmdq_client.client,
+					     drm_crtc_index(&mtk_crtc->base));
+	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_chan = NULL;
+		mtk_crtc->cmdq_client.chan = NULL;
 	}
 
-	if (mtk_crtc->cmdq_chan) {
+	if (mtk_crtc->cmdq_client.chan) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
@@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_chan);
-			mtk_crtc->cmdq_chan = NULL;
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
 		} else {
-			ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
-						       &mtk_crtc->cmdq_handle,
-						       PAGE_SIZE);
+			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+						      &mtk_crtc->cmdq_handle,
+						      PAGE_SIZE);
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_chan);
-				mtk_crtc->cmdq_chan = NULL;
+				mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				mtk_crtc->cmdq_client.chan = NULL;
 			}
 		}
 	}
-- 
2.18.0

