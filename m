Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068CA27A46E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 01:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA976E0FC;
	Sun, 27 Sep 2020 23:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6798996E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:04:38 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC30A2389F;
 Sun, 27 Sep 2020 23:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601247878;
 bh=z1Q+yh68Ms7Tp7uTcp5jY4dsLtkLGXbaO4UiIbVOTLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P8BOw53U3cabl7r7Z9iYIjj0wQVo4Xh1FFyPzsNT1Wwd4rhXEmC0DdIU+nGQ9hk1y
 qqS0dx9QL4jqP24cDaolnC7nEjjKLiZ91jUj4za6Daz+0h7HYNKMuwmy/090LFD6/1
 thoJXnMS7yKPJrAlZhT4iU2jTorQV3n2T7NG1ZCw=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/4] mailbox / soc / drm: mediatek: Remove struct cmdq_client
Date: Mon, 28 Sep 2020 07:04:21 +0800
Message-Id: <20200927230422.11610-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927230422.11610-1-chunkuang.hu@kernel.org>
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In mailbox rx_callback, it pass struct mbox_client to callback
function, but it could not map back to client instance because
struct cmdq_client use a pointer to struct mbox_client:

struct cmdq_client {
	struct mbox_client client;
	struct mbox_chan *chan;
};

struct client_instance {
	/* client instance data */
	struct cmdq_client *cmdq_client;
};

so remove struct cmdq_client and let client instance define
mbox_client as:

struct client_instance {
	/* client instance data */
	struct mbox_client cl;
};

and in rx_callback function, use struct mbox_client to get
struct client_instance.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 35 ++++++++--------
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 52 ++++--------------------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 -
 include/linux/soc/mediatek/mtk-cmdq.h    | 30 +++-----------
 4 files changed, 32 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5df2d431418d..f99c9d2032b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -49,7 +49,8 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_client		*cmdq_client;
+	struct mbox_client		cmdq_cl;
+	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
 #endif
 
@@ -240,9 +241,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
+	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
-	cmdq_pkt_destroy(data->pkt);
+	cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
 
@@ -481,18 +483,18 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 		mtk_disp_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_client) {
-		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
-		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
+	if (mtk_crtc->cmdq_chan) {
+		mbox_flush(mtk_crtc->cmdq_chan, 2000);
+		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+		dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
-		cmdq_pkt_flush_async(cmdq_handle);
+		cmdq_pkt_flush_async(mtk_crtc->cmdq_chan, cmdq_handle);
 	}
 #endif
 	mutex_unlock(&mtk_crtc->hw_lock);
@@ -671,7 +673,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
 #else
 	if (!priv->data->shadow_register)
 #endif
@@ -830,14 +832,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
+	mtk_crtc->cmdq_chan = mbox_request_channel(&mtk_crtc->cmdq_cl,
+						   drm_crtc_index(&mtk_crtc->base));
+	if (IS_ERR(mtk_crtc->cmdq_chan)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
-		mtk_crtc->cmdq_client = NULL;
+		mtk_crtc->cmdq_chan = NULL;
 	}
+
 	ret = of_property_read_u32_index(priv->mutex_node,
 					 "mediatek,gce-events",
 					 drm_crtc_index(&mtk_crtc->base),
@@ -845,9 +851,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (ret)
 		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 			drm_crtc_index(&mtk_crtc->base));
-
-	if (mtk_crtc->cmdq_client)
-		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 #endif
 	return 0;
 }
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b6ee1b525084..f5822adb79a8 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -65,41 +65,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
 }
 EXPORT_SYMBOL(cmdq_dev_get_client_reg);
 
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index)
-{
-	struct cmdq_client *client;
-
-	client = kzalloc(sizeof(*client), GFP_KERNEL);
-	if (!client)
-		return (struct cmdq_client *)-ENOMEM;
-
-	client->client.dev = dev;
-	client->client.tx_block = false;
-	client->client.knows_txdone = true;
-	client->chan = mbox_request_channel(&client->client, index);
-
-	if (IS_ERR(client->chan)) {
-		long err;
-
-		dev_err(dev, "failed to request channel\n");
-		err = PTR_ERR(client->chan);
-		kfree(client);
-
-		return ERR_PTR(err);
-	}
-
-	return client;
-}
-EXPORT_SYMBOL(cmdq_mbox_create);
-
-void cmdq_mbox_destroy(struct cmdq_client *client)
-{
-	mbox_free_channel(client->chan);
-	kfree(client);
-}
-EXPORT_SYMBOL(cmdq_mbox_destroy);
-
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
+struct cmdq_pkt *cmdq_pkt_create(struct mbox_chan *chan, size_t size)
 {
 	struct cmdq_pkt *pkt;
 	struct device *dev;
@@ -114,9 +80,8 @@ struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
 		return ERR_PTR(-ENOMEM);
 	}
 	pkt->buf_size = size;
-	pkt->cl = (void *)client;
 
-	dev = client->chan->mbox->dev;
+	dev = chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
 				  DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, dma_addr)) {
@@ -132,11 +97,9 @@ struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
 }
 EXPORT_SYMBOL(cmdq_pkt_create);
 
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+void cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
 {
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+	dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
 	kfree(pkt);
@@ -318,16 +281,15 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
+int cmdq_pkt_flush_async(struct mbox_chan *chan, struct cmdq_pkt *pkt)
 {
 	int err;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	err = mbox_send_message(client->chan, pkt);
+	err = mbox_send_message(chan, pkt);
 	if (err < 0)
 		return err;
 	/* We can send next packet immediately, so just call txdone. */
-	mbox_client_txdone(client->chan, 0);
+	mbox_client_txdone(chan, 0);
 
 	return 0;
 }
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 2cec4dbaa214..ce2eaf7eaf34 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -68,7 +68,6 @@ struct cmdq_pkt {
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
-	void			*cl;
 };
 
 struct cmdq_cb_data {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a09b3f39b861..fb35da22e00c 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -19,11 +19,6 @@ struct cmdq_client_reg {
 	u16 size;
 };
 
-struct cmdq_client {
-	struct mbox_client client;
-	struct mbox_chan *chan;
-};
-
 /**
  * cmdq_dev_get_client_reg() - parse cmdq client reg from the device
  *			       node of CMDQ client
@@ -39,35 +34,21 @@ struct cmdq_client {
 int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx);
 
-/**
- * cmdq_mbox_create() - create CMDQ mailbox client and channel
- * @dev:	device of CMDQ mailbox client
- * @index:	index of CMDQ mailbox channel
- *
- * Return: CMDQ mailbox client pointer
- */
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
-
-/**
- * cmdq_mbox_destroy() - destroy CMDQ mailbox client and channel
- * @client:	the CMDQ mailbox client
- */
-void cmdq_mbox_destroy(struct cmdq_client *client);
-
 /**
  * cmdq_pkt_create() - create a CMDQ packet
- * @client:	the CMDQ mailbox client
+ * @chan:	the mailbox channel
  * @size:	required CMDQ buffer size
  *
  * Return: CMDQ packet pointer
  */
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size);
+struct cmdq_pkt *cmdq_pkt_create(struct mbox_chan *chan, size_t size);
 
 /**
  * cmdq_pkt_destroy() - destroy the CMDQ packet
+ * @chan:	the mailbox channel
  * @pkt:	the CMDQ packet
  */
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt);
+void cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt);
 
 /**
  * cmdq_pkt_write() - append write command to the CMDQ packet
@@ -177,6 +158,7 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
+ * @chan:	the mailbox channel
  * @pkt:	the CMDQ packet
  *
  * Return: 0 for success; else the error code is returned
@@ -185,6 +167,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  * at the end of done packet. Note that this is an ASYNC function. When the
  * function returned, it may or may not be finished.
  */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
+int cmdq_pkt_flush_async(struct mbox_chan *chan, struct cmdq_pkt *pkt);
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
