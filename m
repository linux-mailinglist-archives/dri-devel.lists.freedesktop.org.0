Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4E4260C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 01:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058166E865;
	Thu,  7 Oct 2021 23:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266296E513
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 23:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9470D61073;
 Thu,  7 Oct 2021 23:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650801;
 bh=jksIvOFn2/rCWlNxNu5m9rT7B9CZ8nXVj1BG1YPjab0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aCxsApGdUtmhGm8cPOMtLzs60PMNG+lp+UeKb8U+Zf6h48CSfYaVXRTPuMEJCVndR
 lnTsLgXZaB32Uxxw5B88xLyDGbKtqx5gqU5cs4eFKCQy/y05S/gWOAwC6+2OnTLLj3
 pEnZem3pWDMBus0vQSzMkohX805Tv5XGar2qq3728lRfl2xT/go17ysQHf+Kr0nvRW
 9JAcyyk44rWwH9ENpljdMbDVsWbL+DYqmGFwE3Uv7kHZ8IIbu1nept7dNTM8pHMEG/
 0JQHxJ4cGqKdloj9ZE4NKTeNEB026+TUM3wYTzVBODzQUbIVQMVDTAFvGWeMRtPPhn
 cQcQipaKNP5Xg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 2/5] Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
Date: Fri,  8 Oct 2021 07:53:07 +0800
Message-Id: <20211007235310.14626-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
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

This reverts commit bc9241be73d9b2b3bcb7033598521fd669639848.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 28 +++++++++----------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 9840b8d035dc..697c4dec1890 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -54,7 +54,6 @@ struct mtk_drm_crtc {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
-	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 #endif
@@ -227,16 +226,19 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
-				    size_t size)
+static struct cmdq_pkt *mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, size_t size)
 {
+	struct cmdq_pkt *pkt;
 	struct device *dev;
 	dma_addr_t dma_addr;
 
+	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
+	if (!pkt)
+		return ERR_PTR(-ENOMEM);
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
 	if (!pkt->va_base) {
 		kfree(pkt);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 	pkt->buf_size = size;
 
@@ -247,12 +249,12 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_pkt *pkt,
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
 		kfree(pkt);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	pkt->pa_base = dma_addr;
 
-	return 0;
+	return pkt;
 }
 
 static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq_pkt *pkt)
@@ -475,7 +477,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
+	struct cmdq_pkt *cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -515,7 +517,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_chan) {
 		mbox_flush(mtk_crtc->cmdq_chan, 2000);
-		cmdq_handle->cmd_buf_size = 0;
+		cmdq_handle = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
@@ -910,16 +912,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				drm_crtc_index(&mtk_crtc->base));
 			mbox_free_channel(mtk_crtc->cmdq_chan);
 			mtk_crtc->cmdq_chan = NULL;
-		} else {
-			ret = mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_chan,
-						       &mtk_crtc->cmdq_handle,
-						       PAGE_SIZE);
-			if (ret) {
-				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
-					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_chan);
-				mtk_crtc->cmdq_chan = NULL;
-			}
 		}
 	}
 #endif
-- 
2.25.1

