Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639B3C6730
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB289F8E;
	Mon, 12 Jul 2021 23:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D189F77
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0936608FE;
 Mon, 12 Jul 2021 23:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133830;
 bh=AsLjiUwW3y64lwMMGA6UPnrXTONtF1TCwCjGUxtlHDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+CxPOab6QGxcGnPDz9D6X3R1llEuYg2PIwoOsi6PmzGgiUhBnzwzWIipJK3Wfo/D
 ocXvqomrH2uRLlM6wPCU3h6vKhIRXeflGocC16q0vBC4nX497zkJf2zRAmRWwVb27/
 rpiRTJL+q7B4XazQ10Z6w0bfFOwnwE8fR9sX9UOLf7wNUpq9+VVDrLTv5gI0Fe58bN
 8GqYypTO0nUqtlh4OE5RZU4J4tsNWSmdlbCDvKyAnL4bfcravo9Y5rCdI7iltJFq5Y
 et7FDCy5pAyqwEhyjCyaUheDB+/spy4EVQnjR3Ri4l0Bk3gf+nIT84dE6syJdm5sgf
 HdBDsH1oUS9bw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/4] drm/mediatek: Add cmdq_handle in mtk_crtc
Date: Tue, 13 Jul 2021 07:50:14 +0800
Message-Id: <20210712235014.42673-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712235014.42673-1-chunkuang.hu@kernel.org>
References: <20210712235014.42673-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One mtk_crtc need just one cmdq_handle, so add one cmdq_handle
in mtk_crtc to prevent frequently allocation and free of
cmdq_handle.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5dd61eacce6c..4c25e33638a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -54,6 +54,7 @@ struct mtk_drm_crtc {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
+	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 #endif
@@ -225,19 +226,16 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	return NULL;
 }
 
-static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t size)
+static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
+				    size_t size)
 {
-	struct cmdq_pkt *pkt;
 	struct device *dev;
 	dma_addr_t dma_addr;
 
-	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
-	if (!pkt)
-		return ERR_PTR(-ENOMEM);
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
 	if (!pkt->va_base) {
 		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 	pkt->buf_size = size;
 
@@ -248,12 +246,12 @@ static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t s
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
 		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pkt->pa_base = dma_addr;
 
-	return pkt;
+	return 0;
 }
 
 static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
@@ -477,7 +475,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle;
+	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -517,7 +515,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_chan) {
 		mbox_flush(mtk_crtc->cmdq_chan, 2000);
-		cmdq_handle = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
+		cmdq_handle->cmd_buf_size = 0;
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
@@ -915,6 +913,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				drm_crtc_index(&mtk_crtc->base));
 			mbox_free_channel(mtk_crtc->cmdq_chan);
 			mtk_crtc->cmdq_chan = NULL;
+		} else {
+			ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
+						       &mtk_crtc->cmdq_handle,
+						       PAGE_SIZE);
+			if (ret) {
+				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+					drm_crtc_index(&mtk_crtc->base));
+				mbox_free_channel(mtk_crtc->cmdq_chan);
+				mtk_crtc->cmdq_chan = NULL;
+			}
 		}
 	}
 #endif
-- 
2.25.1

