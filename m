Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59C43DEB4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 12:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F456E94C;
	Thu, 28 Oct 2021 10:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE8E6E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:19:21 +0000 (UTC)
X-UUID: 2bbf31aae53842f08a51c2fa90dd74ec-20211028
X-UUID: 2bbf31aae53842f08a51c2fa90dd74ec-20211028
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1825830981; Thu, 28 Oct 2021 18:19:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 18:19:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 28 Oct 2021 18:19:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jassi
 Brar <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [PATCH v6 4/6] drm/mediatek: Add cmdq_handle in mtk_crtc
Date: Thu, 28 Oct 2021 18:19:10 +0800
Message-ID: <20211028101912.4624-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
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

One mtk_crtc need just one cmdq_handle, so add one cmdq_handle
in mtk_crtc to prevent frequently allocation and free of
cmdq_handle.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 62 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a368cbc18923..56ff09a26dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -53,6 +53,7 @@ struct mtk_drm_crtc {
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_client		cmdq_client;
+	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 #endif
@@ -107,12 +108,55 @@ static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
+				   size_t size)
+{
+	struct device *dev;
+	dma_addr_t dma_addr;
+
+	pkt->va_base = kzalloc(size, GFP_KERNEL);
+	if (!pkt->va_base) {
+		kfree(pkt);
+		return -ENOMEM;
+	}
+	pkt->buf_size = size;
+	pkt->cl = (void *)client;
+
+	dev = client->chan->mbox->dev;
+	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
+				  DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
+		kfree(pkt->va_base);
+		kfree(pkt);
+		return -ENOMEM;
+	}
+
+	pkt->pa_base = dma_addr;
+
+	return 0;
+}
+
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
+
+	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+			 DMA_TO_DEVICE);
+	kfree(pkt->va_base);
+	kfree(pkt);
+}
+#endif
+
 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 
 	mtk_mutex_put(mtk_crtc->mutex);
-
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+#endif
 	drm_crtc_cleanup(crtc);
 }
 
@@ -227,12 +271,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	struct cmdq_cb_data *data = mssg;
 	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
 	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -438,7 +480,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle;
+	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -478,7 +520,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
-		cmdq_handle = cmdq_pkt_create(&mtk_crtc->cmdq_client, PAGE_SIZE);
+		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
@@ -877,6 +919,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				drm_crtc_index(&mtk_crtc->base));
 			mbox_free_channel(mtk_crtc->cmdq_client.chan);
 			mtk_crtc->cmdq_client.chan = NULL;
+		} else {
+			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+						      &mtk_crtc->cmdq_handle,
+						      PAGE_SIZE);
+			if (ret) {
+				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+					drm_crtc_index(&mtk_crtc->base));
+				mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				mtk_crtc->cmdq_client.chan = NULL;
+			}
 		}
 	}
 #endif
-- 
2.18.0

