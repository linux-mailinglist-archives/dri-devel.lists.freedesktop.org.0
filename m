Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602503C672F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9659E89F77;
	Mon, 12 Jul 2021 23:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8889F73
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:50:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F57D6115A;
 Mon, 12 Jul 2021 23:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133828;
 bh=Sus9FRs0hTcX2hu0wT0zxdo8Pi7+Qzp7q7LUn+28Des=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vr4uMzt2pgDl6+7owZ5QWsCH14MsV/t9yhkIx4uAgRpUjH9ypREeycwro6rEhoqkv
 A2Ci1FBx6tOWlrW9BkkyCa8tMM+/8KTeywUsyKf/SfbyqgJF9o7p7ANd4ly4jRCde/
 BSBBW1m9PIgKSxXrjzOqdGGLbjzynT+6IecnvG4T/Rr+B9FPawhc3j0EdzWDrJX4Gi
 ei3m5zkFKb1sp1M+Zgo6OANMfJ8IRxi12Q6YsQyj5BlKi8bo8KczmRp2GX4tgVYrVN
 wN1oU0SIrddWCqHJET2+N3zhkYMJfCslcqk44rhuw3zpDjtfH3FojmWZujVBmfhzfq
 z3+VSED09nb+Q==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm/mediatek: Detect CMDQ execution timeout
Date: Tue, 13 Jul 2021 07:50:13 +0800
Message-Id: <20210712235014.42673-4-chunkuang.hu@kernel.org>
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

CMDQ is used to update display register in vblank period, so
it should be execute in next vblank. If it fail to execute
in next 2 vblank, tiemout happen.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index db8621df7d85..5dd61eacce6c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -55,6 +55,7 @@ struct mtk_drm_crtc {
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
+	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -269,6 +270,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
+	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
@@ -524,6 +526,11 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
+		/*
+		 * CMDQ command should execute in next vblank,
+		 * If it fail to execute in next 2 vblank, timeout happen.
+		 */
+		mtk_crtc->cmdq_vblank_cnt = 2;
 		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
 	}
@@ -540,11 +547,14 @@ static void mtk_crtc_ddp_irq(void *data)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+		mtk_crtc_ddp_config(crtc, NULL);
+	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
+		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
-#endif
 		mtk_crtc_ddp_config(crtc, NULL);
-
+#endif
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
-- 
2.25.1

