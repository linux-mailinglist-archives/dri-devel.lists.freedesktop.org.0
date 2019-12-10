Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A790B117F53
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 06:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571436E7EA;
	Tue, 10 Dec 2019 05:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 468026E7DB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:05:33 +0000 (UTC)
X-UUID: 405eab06d9fa439c9c393a143611d3dc-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AdxFy+I7i2jJN+rN5zx7RX8ff9ZkwUeUYe2wFRnYZxg=; 
 b=ltyfZqajvcF/5KVrFhmpV1GQAmj7Im9w9LIDXZa1p3uJF4xMwCz8j4k7u4bGNfpEZS9E/1zwdUk8DALeXKlVAJQLXXtIdGabqiIh/bdh2ytrFTHOirjU9yyW5wZhEmtl+5CWyhPSQFe+pUnYJJVf2FbJQtcDppypHgvn+wR+G1c=;
X-UUID: 405eab06d9fa439c9c393a143611d3dc-20191210
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 148240179; Tue, 10 Dec 2019 13:05:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 13:04:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 13:05:22 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 7/7] drm/mediatek: apply CMDQ control flow
Date: Tue, 10 Dec 2019 13:05:26 +0800
Message-ID: <20191210050526.4437-8-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AEEBE7D522D0684789C27698D7E9A0893C29132C1A89D92F4F2366B10B5230492000:8
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike other SoCs, MT8183 does not have "shadow"
registers for performaing an atomic video mode
set or page flip at vblank/vsync.

The CMDQ (Commend Queue) in MT8183 is used to help
update all relevant display controller registers
with critical time limation.

Signed-off-by: YT Shen <yt.shen@mediatek.com>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 56 +++++++++++++++++++++----
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5b3e24a7ef6c..ca4fc4735f9a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -12,6 +12,8 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <linux/of_address.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_crtc.h"
@@ -43,6 +45,9 @@ struct mtk_drm_crtc {
 	bool				pending_planes;
 	bool				pending_async_planes;
 
+	struct cmdq_client		*cmdq_client;
+	u32				cmdq_event;
+
 	void __iomem			*config_regs;
 	const struct mtk_mmsys_reg_data *mmsys_reg_data;
 	struct mtk_disp_mutex		*mutex;
@@ -234,6 +239,13 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	return NULL;
 }
 
+#if IS_ENABLED(CONFIG_MTK_CMDQ)
+static void ddp_cmdq_cb(struct cmdq_cb_data data)
+{
+	cmdq_pkt_destroy(data.data);
+}
+#endif
+
 static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -375,7 +387,8 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
-static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
+static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
+				struct cmdq_pkt *cmdq_handle)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
@@ -391,7 +404,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	if (state->pending_config) {
 		mtk_ddp_comp_config(comp, state->pending_width,
 				    state->pending_height,
-				    state->pending_vrefresh, 0, NULL);
+				    state->pending_vrefresh, 0,
+				    cmdq_handle);
 
 		state->pending_config = false;
 	}
@@ -411,7 +425,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
-							  plane_state, NULL);
+							  plane_state,
+							  cmdq_handle);
 			plane_state->pending.config = false;
 		}
 		mtk_crtc->pending_planes = false;
@@ -432,7 +447,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
-							  plane_state, NULL);
+							  plane_state,
+							  cmdq_handle);
 			plane_state->pending.async_config = false;
 		}
 		mtk_crtc->pending_async_planes = false;
@@ -441,6 +457,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 {
+	struct cmdq_pkt *cmdq_handle;
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	unsigned int pending_planes = 0, pending_async_planes = 0;
@@ -469,9 +486,18 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 
 	if (priv->data->shadow_register) {
 		mtk_disp_mutex_acquire(mtk_crtc->mutex);
-		mtk_crtc_ddp_config(crtc);
+		mtk_crtc_ddp_config(crtc, NULL);
 		mtk_disp_mutex_release(mtk_crtc->mutex);
 	}
+#if IS_ENABLED(CONFIG_MTK_CMDQ)
+	if (mtk_crtc->cmdq_client) {
+		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
+		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
+		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
+		mtk_crtc_ddp_config(crtc, cmdq_handle);
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+	}
+#endif
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
@@ -640,8 +666,8 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
-	if (!priv->data->shadow_register)
-		mtk_crtc_ddp_config(crtc);
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+		mtk_crtc_ddp_config(crtc, NULL);
 
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
@@ -784,5 +810,21 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	priv->num_pipes++;
 	mutex_init(&mtk_crtc->hw_lock);
 
+#if IS_ENABLED(CONFIG_MTK_CMDQ)
+	mtk_crtc->cmdq_client =
+			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
+					 2000);
+	if (IS_ERR(mtk_crtc->cmdq_client)) {
+		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
+			drm_crtc_index(&mtk_crtc->base));
+		mtk_crtc->cmdq_client = NULL;
+	}
+	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
+					 drm_crtc_index(&mtk_crtc->base),
+					 &mtk_crtc->cmdq_event);
+	if (ret)
+		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
+			drm_crtc_index(&mtk_crtc->base));
+#endif
 	return 0;
 }
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
