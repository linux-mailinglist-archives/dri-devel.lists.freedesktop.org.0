Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD643BF7E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 04:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F686E4FF;
	Wed, 27 Oct 2021 02:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3AD6E4F4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:19:06 +0000 (UTC)
X-UUID: 9c7cc6cc7a00415397195bcdc3d8e400-20211027
X-UUID: 9c7cc6cc7a00415397195bcdc3d8e400-20211027
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1223839338; Wed, 27 Oct 2021 10:19:01 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Oct 2021 10:19:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 10:19:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Oct 2021 10:19:00 +0800
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
Subject: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
Date: Wed, 27 Oct 2021 10:18:54 +0800
Message-ID: <20211027021857.20816-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
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

CMDQ is used to update display register in vblank period, so
it should be execute in next 2 vblank. One vblank interrupt
before send message (occasionally) and one vblank interrupt
after cmdq done. If it fail to execute in next 3 vblank,
tiemout happen.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index e23e3224ac67..dad1f85ee315 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -54,6 +54,7 @@ struct mtk_drm_crtc {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_client		cmdq_client;
 	u32				cmdq_event;
+	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
+	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
+	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
 
+	mtk_crtc->cmdq_vblank_cnt = 0;
 	cmdq_pkt_destroy(data->pkt);
 }
 #endif
@@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
+		/*
+		 * CMDQ command should execute in next 3 vblank.
+		 * One vblank interrupt before send message (occasionally)
+		 * and one vblank interrupt after cmdq done,
+		 * so it's timeout after 3 vblank interrupt.
+		 * If it fail to execute in next 3 vblank, timeout happen.
+		 */
+		mtk_crtc->cmdq_vblank_cnt = 3;
+
 		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
@@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
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
2.18.0

