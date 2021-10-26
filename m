Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3043ABB5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 07:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2AF6E2C8;
	Tue, 26 Oct 2021 05:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED66E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 05:29:25 +0000 (UTC)
X-UUID: ffe51e90b3c44204881439ddd3dc45fe-20211026
X-UUID: ffe51e90b3c44204881439ddd3dc45fe-20211026
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 682685702; Tue, 26 Oct 2021 13:29:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 13:29:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 13:29:17 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v4 2/5] drm/mediatek: Remove the pointer of struct cmdq_client
Date: Tue, 26 Oct 2021 13:29:13 +0800
Message-ID: <20211026052916.8222-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
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

From: Chun-Kuang Hu <chunkuang.hu@kernel.org>

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

so remove the pointer of struct cmdq_client and let mtk_drm_crtc
instance define cmdq_client as:

struct mtk_drm_crtc {
	/* client instance data */
	struct cmdq_client cmdq_client;
};

and in rx_callback function, use struct mbox_client to get
struct mtk_drm_crtc.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 37 +++++++++++++------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 369d3e68c0b6..e23e3224ac67 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,7 +52,7 @@ struct mtk_drm_crtc {
 	bool				pending_async_planes;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_client		*cmdq_client;
+	struct cmdq_client		cmdq_client;
 	u32				cmdq_event;
 #endif
 
@@ -472,19 +472,19 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_client) {
-		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
-		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
+	if (mtk_crtc->cmdq_client.chan) {
+		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
+		cmdq_handle = cmdq_pkt_create(&mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
-		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
+		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -498,7 +498,7 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 #else
 	if (!priv->data->shadow_register)
 #endif
@@ -838,17 +838,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	mutex_init(&mtk_crtc->hw_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_crtc->cmdq_client =
-			cmdq_mbox_create(mtk_crtc->mmsys_dev,
-					 drm_crtc_index(&mtk_crtc->base));
-	if (IS_ERR(mtk_crtc->cmdq_client)) {
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
-		mtk_crtc->cmdq_client = NULL;
+		mtk_crtc->cmdq_client.chan = NULL;
 	}
 
-	if (mtk_crtc->cmdq_client) {
-		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
+	if (mtk_crtc->cmdq_client.chan) {
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
@@ -856,8 +859,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
-			mtk_crtc->cmdq_client = NULL;
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
 		}
 	}
 #endif
-- 
2.18.0

