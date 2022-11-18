Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E262ED75
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 07:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52B10E6B8;
	Fri, 18 Nov 2022 06:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838810E6A8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:07:37 +0000 (UTC)
X-UUID: 94788235810d480c8e2a92849ab3b2af-20221118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=A1+E6zUcXM7KWUwrCuEohNuT19+u0ZqHVLOlME/NAkE=; 
 b=A5n7sY0eI6YdaZMljcZlASIWmFI80js4CSGHdf9q+iFuAQvzxuhH2m4fncpYjd/yGBfC3UbQxNIzDPNwTN6ba2QA70aIhk4K++XygraVnIxKQGNocV1b7f4nF7QOMc3rNv6PeP5Vp5QD/dGJ76lU5MdcUQgaq2KVtB/sHaVZZlo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.13, REQID:856b5215-0f28-4000-8ff6-35aaf9cf6516, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-INFO: VERSION:1.1.13, REQID:856b5215-0f28-4000-8ff6-35aaf9cf6516, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:100
X-CID-META: VersionHash:d12e911, CLOUDID:6071232f-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:221118140732UI5E2ZT3,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 94788235810d480c8e2a92849ab3b2af-20221118
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 23650525; Fri, 18 Nov 2022 14:07:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 18 Nov 2022 14:07:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Fri, 18 Nov 2022 14:07:28 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Subject: [PATCH v1] drm/mediatek: add dma buffer control for drm plane disable
Date: Fri, 18 Nov 2022 14:07:25 +0800
Message-ID: <20221118060725.13134-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

get dma buffer when drm plane disable
put dma buffer when overlay really disable

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 11 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 12 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..1b1341b57d62 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
@@ -283,6 +284,14 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static void mtk_drm_dma_buf_put(struct mtk_plane_state *plane_state)
+{
+	if (plane_state && plane_state->pending.dma_buf) {
+		dma_buf_put(plane_state->pending.dma_buf);
+		plane_state->pending.dma_buf = NULL;
+	}
+}
+
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
@@ -306,6 +315,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 			plane_state = to_mtk_plane_state(plane->state);
 
 			plane_state->pending.config = false;
+			mtk_drm_dma_buf_put(plane_state);
 		}
 		mtk_crtc->pending_planes = false;
 	}
@@ -318,6 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 			plane_state = to_mtk_plane_state(plane->state);
 
 			plane_state->pending.async_config = false;
+			mtk_drm_dma_buf_put(plane_state);
 		}
 		mtk_crtc->pending_async_planes = false;
 	}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 2f5e007dd380..b67fdf12e237 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -11,6 +11,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <linux/dma-buf.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -212,6 +213,17 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+
+	if (old_state && old_state->fb) {
+		struct drm_gem_object *gem = old_state->fb->obj[0];
+
+		if (gem && gem->dma_buf) {
+			get_dma_buf(gem->dma_buf);
+			mtk_plane_state->pending.dma_buf = gem->dma_buf;
+		}
+	}
 	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
 	mtk_plane_state->pending.dirty = true;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 2d5ec66e3df1..e0985b107c36 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -25,6 +25,7 @@ struct mtk_plane_pending_state {
 	bool				async_dirty;
 	bool				async_config;
 	enum drm_color_encoding		color_encoding;
+	struct dma_buf			*dma_buf;
 };
 
 struct mtk_plane_state {
-- 
2.25.1

