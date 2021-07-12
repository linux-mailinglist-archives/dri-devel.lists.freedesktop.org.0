Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E63C672A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D589F6E;
	Mon, 12 Jul 2021 23:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093F89F6E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:50:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C72B61166;
 Mon, 12 Jul 2021 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133823;
 bh=/wtDrP5iuggwVl9aJiLqEemxJKIrDTTzHICklU/8cNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmXjkn9yq14A9eZAjz7KlsaFQQRUZzzbXhWEsLhg/z6lHlqB9oxBVRuz2mAAroh7u
 n6WLrbqK2eZpM3LfRzjimGYo/z8n9y+r8Bhh8+iqSbadNCY1mPBkPtkqpxj+Xozd2r
 /+aaDyfXFj42b6fWx2lQgnio1jZseRwryBsrxq2/CK/XB1HGAUBilQd3aJdixrB0Ii
 O2qK6uKXKCPO7fqtCvquQmePb5vc02YR7TPrK4pGoiwAm5G/FBPuagaxSP7zn8N236
 axLNuzi23W44pr/NiI8rREAuXvVO45E+8tjCrZRvfHwieKKVr0evrD4xgygtxC12Q9
 f77nooBUjjk4w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb
Date: Tue, 13 Jul 2021 07:50:11 +0800
Message-Id: <20210712235014.42673-2-chunkuang.hu@kernel.org>
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

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..cac8fe219c95 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -222,9 +224,11 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static void ddp_cmdq_cb(struct cmdq_cb_data data)
+static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	cmdq_pkt_destroy(data.data);
+	struct cmdq_cb_data *data = mssg;
+
+	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -475,7 +479,12 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+					    cmdq_handle->pa_base,
+					    cmdq_handle->cmd_buf_size,
+					    DMA_TO_DEVICE);
+		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -842,6 +851,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client) {
+		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
-- 
2.25.1

