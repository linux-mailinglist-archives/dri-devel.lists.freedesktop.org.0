Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2831F6EC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 11:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95176E8B4;
	Fri, 19 Feb 2021 10:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF7EB6E8B4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 09:54:21 +0000 (UTC)
X-UUID: 6f5b02960cb84ea4be1ce4d10cba6458-20210219
X-UUID: 6f5b02960cb84ea4be1ce4d10cba6458-20210219
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1410267829; Fri, 19 Feb 2021 17:54:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 17:54:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Feb 2021 17:54:15 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1] drm/mediatek: move page flip handle into cmdq cb
Date: Fri, 19 Feb 2021 17:54:12 +0800
Message-ID: <1613728452-24871-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1613728452-24871-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1613728452-24871-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 19 Feb 2021 10:00:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

move page flip handle into cmdq cb
irq callback will before cmdq flush ddp register
into hardware, that will cause the display frame page
flip event before it realy display out time

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bdd37ea..bece327 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -72,6 +72,13 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+struct mtk_cmdq_cb_data {
+	struct cmdq_pkt			*cmdq_handle;
+	struct mtk_drm_crtc		*mtk_crtc;
+};
+#endif
+
 static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
 	return container_of(c, struct mtk_drm_crtc, base);
@@ -96,7 +103,6 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
-	drm_crtc_handle_vblank(&mtk_crtc->base);
 	if (mtk_crtc->pending_needs_vblank) {
 		mtk_drm_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
@@ -241,7 +247,19 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	cmdq_pkt_destroy(data.data);
+	struct mtk_cmdq_cb_data *cb_data = data.data;
+
+	if (cb_data) {
+		struct mtk_drm_crtc *mtk_crtc = cb_data->mtk_crtc;
+
+		if (mtk_crtc)
+			mtk_drm_finish_page_flip(mtk_crtc);
+
+		if (cb_data->cmdq_handle)
+			cmdq_pkt_destroy(cb_data->cmdq_handle);
+
+		kfree(cb_data);
+	}
 }
 #endif
 
@@ -481,13 +499,20 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client) {
+		struct mtk_cmdq_cb_data *cb_data;
+
 		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+
+		cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
+		cb_data->cmdq_handle = cmdq_handle;
+		cb_data->mtk_crtc = mtk_crtc;
+
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cb_data);
 	}
 #endif
 	mutex_unlock(&mtk_crtc->hw_lock);
@@ -674,7 +699,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 #endif
 		mtk_crtc_ddp_config(crtc, NULL);
 
-	mtk_drm_finish_page_flip(mtk_crtc);
+	drm_crtc_handle_vblank(&mtk_crtc->base);
 }
 
 static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
