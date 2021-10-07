Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FBB4260C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 01:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D96E856;
	Thu,  7 Oct 2021 23:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112A6E859
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 23:53:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE4A360F46;
 Thu,  7 Oct 2021 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650806;
 bh=zY4CHOcf904wGrBQIxRY3emDUZoEa9VuYr4ZkjX6geQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ohu/VgY0pgkqa/F631/k3noWQLk9VGF0KDNVP41JOic2ahGX3nNV7lL7ooeb114kP
 RIOaRgYG2rkLeFEj8JjMczdSALZPkh+XivrJmeShhEPENiHVz9vGKgnHdzzjEqTndO
 DhQRTDJlXeG4Ie5+fP1IYgC8IrmYTNzmxBRgXX/eMowLTQt0kxbBj6GY5YTR3Hgv3+
 V+cAIed/0S9UwfVbahJBXX/gEB2CrI9iAWsbyu6dqiv5sH62SUx+qPfu9QxwJwzPEz
 4rtT+s5Z5AEXRCdS2pnuW3s8fpN0OyhfLkbUOR3sF858WTX4FYxAZrH54MOs1ZwoPb
 biZ6TIMNwqNAw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 5/5] Revert "drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb"
Date: Fri,  8 Oct 2021 07:53:10 +0800
Message-Id: <20211007235310.14626-6-chunkuang.hu@kernel.org>
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

This reverts commit c1ec54b7b5af25c779192253f5a9f05e95cb43d7.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3f9802d21bf0..a4e80e499674 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,8 +4,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/dma-mapping.h>
-#include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -224,11 +222,9 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
+static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	struct cmdq_cb_data *data = mssg;
-
-	cmdq_pkt_destroy(data->pkt);
+	cmdq_pkt_destroy(data.data);
 }
 #endif
 
@@ -479,12 +475,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
-					    cmdq_handle->pa_base,
-					    cmdq_handle->cmd_buf_size,
-					    DMA_TO_DEVICE);
-		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -848,7 +839,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client) {
-		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
-- 
2.25.1

