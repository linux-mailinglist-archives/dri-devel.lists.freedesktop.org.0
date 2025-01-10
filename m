Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85EA09F00
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6210E547;
	Sat, 11 Jan 2025 00:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HmSbH/hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5B710F0B3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:54 +0000 (UTC)
X-UUID: d6e76cd8cf4f11efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u3ZU/5+OKlSIeLUKVYpINx2FFpRhxxt/rfi3LPDdpQs=; 
 b=HmSbH/hp5jln1SwGNl1AVQXS9UiM2A8+2KnzLpzWc118pjY2SZljf2QqBw0k1yBCA3hcDiPI/rex+Vw3QYeJIMTGrj3v6s/JsVYvP/9IK2okjnv/ve6VRiU7GRQD92e68PB/TcfXVVy4KAfoAs2HXi/NqdYMPFv7RzUZaoYrUvA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:8b1b2335-8fae-4262-90a9-e1ce895f7bea, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:60aa074, CLOUDID:1d3cb20e-078a-483b-8929-714244d25c49,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
 IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d6e76cd8cf4f11efbd192953cf12861f-20250110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 988440662; Fri, 10 Jan 2025 20:38:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:47 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 12/12] drm/mediatek: Add support for multiple mmsys in the one
 mediatek-drm driver
Date: Fri, 10 Jan 2025 20:34:08 +0800
Message-ID: <20250110123835.2719824-14-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 11 Jan 2025 00:10:20 +0000
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

From: "Nancy.Lin" <nancy.lin@mediatek.com>

To support multiple mmsys instances in the one mediatek-drm instance,
providing improved flexibility and scalability by the following changes:

1. Defined new DRM component IDs DDP_COMPONENT_DRM_OVLSYS_ADAPTOR*
  to support different mmsys composition.
2. Added new component types MTK_DISP_VIRTUAL to support the
  routing to virtual display components.
3. Added and adjusted the existed structure or interface to extend
  the support of multiple mmsys instances.
4. Modified the component matching and binding logic to support
  multiple mmsys instances.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c     | 350 +++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_crtc.h     |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 106 +++++--
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 223 ++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  16 +-
 6 files changed, 578 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index eb0e1233ad04..eca6941bfaa2 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -58,13 +58,17 @@ struct mtk_crtc {
 	wait_queue_head_t		cb_blocking_queue;
 #endif
 
-	struct device			*mmsys_dev;
+	struct device			*mmsys_dev[MAX_MMSYS];
 	struct device			*dma_dev;
-	struct mtk_mutex		*mutex;
+	struct device			*vdisp_ao_dev;
+	struct mtk_mutex		*mutex[MAX_MMSYS];
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	enum mtk_drm_mmsys		*ddp_comp_sys;
+	bool				exist[MAX_MMSYS];
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
+	enum mtk_drm_mmsys		conn_routes_sys;
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
@@ -82,6 +86,11 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
+struct mtk_crtc_comp_info {
+	enum mtk_drm_mmsys sys;
+	unsigned int comp_id;
+};
+
 static inline struct mtk_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
 	return container_of(c, struct mtk_crtc, base);
@@ -125,7 +134,9 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
 
-	mtk_mutex_put(mtk_crtc->mutex);
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->mutex[i])
+			mtk_mutex_put(mtk_crtc->mutex[i]);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client.chan) {
 		cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
@@ -223,7 +234,14 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		enum mtk_drm_mmsys mmsys;
+
 		ret = mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
+		if (mtk_ddp_comp_get_type(mtk_crtc->ddp_comp[i]->id) == MTK_DISP_VIRTUAL) {
+			mmsys = mtk_crtc->ddp_comp_sys[i];
+			ret = mtk_mmsys_ddp_clk_enable(mtk_crtc->mmsys_dev[mmsys],
+						       mtk_crtc->ddp_comp[i]->id);
+		}
 		if (ret) {
 			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
 			goto err;
@@ -232,17 +250,28 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 
 	return 0;
 err:
-	while (--i >= 0)
+	while (--i >= 0) {
 		mtk_ddp_comp_clk_disable(mtk_crtc->ddp_comp[i]);
+		if (mtk_ddp_comp_get_type(mtk_crtc->ddp_comp[i]->id) == MTK_DISP_VIRTUAL)
+			mtk_mmsys_ddp_clk_disable(mtk_crtc->mmsys_dev[mtk_crtc->ddp_comp_sys[i]],
+						  mtk_crtc->ddp_comp[i]->id);
+	}
 	return ret;
 }
 
 static void mtk_crtc_ddp_clk_disable(struct mtk_crtc *mtk_crtc)
 {
 	int i;
+	enum mtk_drm_mmsys mmsys;
 
-	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		mtk_ddp_comp_clk_disable(mtk_crtc->ddp_comp[i]);
+		if (mtk_ddp_comp_get_type(mtk_crtc->ddp_comp[i]->id) == MTK_DISP_VIRTUAL) {
+			mmsys = mtk_crtc->ddp_comp_sys[i];
+			mtk_mmsys_ddp_clk_disable(mtk_crtc->mmsys_dev[mmsys],
+						  mtk_crtc->ddp_comp[i]->id);
+		}
+	}
 }
 
 static
@@ -332,7 +361,8 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 	struct drm_connector_list_iter conn_iter;
 	unsigned int width, height, vrefresh, bpc = MTK_MAX_BPC;
 	int ret;
-	int i;
+	int i, j;
+	enum mtk_drm_mmsys mmsys;
 
 	if (WARN_ON(!crtc->state))
 		return -EINVAL;
@@ -362,10 +392,18 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 		return ret;
 	}
 
-	ret = mtk_mutex_prepare(mtk_crtc->mutex);
-	if (ret < 0) {
-		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
-		goto err_pm_runtime_put;
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			mtk_mmsys_top_clk_enable(mtk_crtc->mmsys_dev[i]);
+
+	for (i = 0; i < MAX_MMSYS; i++) {
+		if (!mtk_crtc->mutex[i] || !mtk_crtc->exist[i])
+			continue;
+		ret = mtk_mutex_prepare(mtk_crtc->mutex[i]);
+		if (ret < 0) {
+			DRM_ERROR("Failed to enable mmsys%d mutex clock: %d\n", i, ret);
+			goto err_pm_runtime_put;
+		}
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
@@ -374,19 +412,36 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 		goto err_mutex_unprepare;
 	}
 
+	if (mtk_crtc->vdisp_ao_dev)
+		mtk_mmsys_default_config(mtk_crtc->vdisp_ao_dev);
+
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			mtk_mmsys_default_config(mtk_crtc->mmsys_dev[i]);
+
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
-		if (!mtk_ddp_comp_connect(mtk_crtc->ddp_comp[i], mtk_crtc->mmsys_dev,
+		mmsys = mtk_crtc->ddp_comp_sys[i];
+		if (!mtk_ddp_comp_connect(mtk_crtc->ddp_comp[i], mtk_crtc->mmsys_dev[mmsys],
 					  mtk_crtc->ddp_comp[i + 1]->id))
-			mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
+			mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev[mmsys],
 					      mtk_crtc->ddp_comp[i]->id,
 					      mtk_crtc->ddp_comp[i + 1]->id);
-		if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
-			mtk_mutex_add_comp(mtk_crtc->mutex,
+		if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex[mmsys]))
+			mtk_mutex_add_comp(mtk_crtc->mutex[mmsys],
 					   mtk_crtc->ddp_comp[i]->id);
 	}
-	if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
-		mtk_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
-	mtk_mutex_enable(mtk_crtc->mutex);
+	mmsys = mtk_crtc->ddp_comp_sys[i];
+	if (!mtk_ddp_comp_add(mtk_crtc->ddp_comp[i], mtk_crtc->mutex[mmsys]))
+		mtk_mutex_add_comp(mtk_crtc->mutex[mmsys], mtk_crtc->ddp_comp[i]->id);
+
+	/* Need to set sof source for all mmsys mutexs in this crtc */
+	for (j = 0; j < MAX_MMSYS; j++)
+		if (mtk_crtc->exist[j] && mtk_crtc->mutex[j])
+			mtk_mutex_write_comp_sof(mtk_crtc->mutex[j], mtk_crtc->ddp_comp[i]->id);
+
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+			mtk_mutex_enable(mtk_crtc->mutex[i]);
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
@@ -394,7 +449,11 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 		if (i == 1)
 			mtk_ddp_comp_bgclr_in_on(comp);
 
-		mtk_ddp_comp_config(comp, width, height, vrefresh, bpc, NULL);
+		if (mtk_ddp_comp_get_type(comp->id) == MTK_DISP_VIRTUAL)
+			mtk_mmsys_ddp_config(mtk_crtc->mmsys_dev[mtk_crtc->ddp_comp_sys[i]],
+					     comp->id, width, height, NULL);
+		else
+			mtk_ddp_comp_config(comp, width, height, vrefresh, bpc, NULL);
 		mtk_ddp_comp_start(comp);
 	}
 
@@ -418,7 +477,10 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 	return 0;
 
 err_mutex_unprepare:
-	mtk_mutex_unprepare(mtk_crtc->mutex);
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+			mtk_mutex_unprepare(mtk_crtc->mutex[i]);
+
 err_pm_runtime_put:
 	pm_runtime_put(crtc->dev->dev);
 	return ret;
@@ -430,6 +492,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
 	int i;
+	enum mtk_drm_mmsys mmsys;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		mtk_ddp_comp_stop(mtk_crtc->ddp_comp[i]);
@@ -437,27 +500,46 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 			mtk_ddp_comp_bgclr_in_off(mtk_crtc->ddp_comp[i]);
 	}
 
-	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
-		if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
-			mtk_mutex_remove_comp(mtk_crtc->mutex,
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		mmsys = mtk_crtc->ddp_comp_sys[i];
+		if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex[mmsys]))
+			mtk_mutex_remove_comp(mtk_crtc->mutex[mtk_crtc->ddp_comp_sys[i]],
 					      mtk_crtc->ddp_comp[i]->id);
-	mtk_mutex_disable(mtk_crtc->mutex);
+	}
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+			mtk_mutex_disable(mtk_crtc->mutex[i]);
+
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
-		if (!mtk_ddp_comp_disconnect(mtk_crtc->ddp_comp[i], mtk_crtc->mmsys_dev,
-					     mtk_crtc->ddp_comp[i + 1]->id))
-			mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
-						 mtk_crtc->ddp_comp[i]->id,
-						 mtk_crtc->ddp_comp[i + 1]->id);
-		if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
-			mtk_mutex_remove_comp(mtk_crtc->mutex,
+		struct mtk_ddp_comp *comp;
+		unsigned int curr, next;
+
+		comp = mtk_crtc->ddp_comp[i];
+		curr = mtk_crtc->ddp_comp[i]->id;
+		next = mtk_crtc->ddp_comp[i + 1]->id;
+		mmsys = mtk_crtc->ddp_comp_sys[i];
+		if (!mtk_ddp_comp_disconnect(comp, mtk_crtc->mmsys_dev[mmsys], next))
+			mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev[mmsys], curr, next);
+		if (!mtk_ddp_comp_remove(comp, mtk_crtc->mutex[mmsys]))
+			mtk_mutex_remove_comp(mtk_crtc->mutex[mtk_crtc->ddp_comp_sys[i]],
 					      mtk_crtc->ddp_comp[i]->id);
 	}
-	if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex))
-		mtk_mutex_remove_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
+
+	mmsys = mtk_crtc->ddp_comp_sys[i];
+	if (!mtk_ddp_comp_remove(mtk_crtc->ddp_comp[i], mtk_crtc->mutex[mmsys]))
+		mtk_mutex_remove_comp(mtk_crtc->mutex[mmsys], mtk_crtc->ddp_comp[i]->id);
+
 	mtk_crtc_ddp_clk_disable(mtk_crtc);
-	mtk_mutex_unprepare(mtk_crtc->mutex);
 
-	pm_runtime_put(drm->dev);
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+			mtk_mutex_unprepare(mtk_crtc->mutex[i]);
+
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			mtk_mmsys_top_clk_disable(mtk_crtc->mmsys_dev[i]);
+
+	pm_runtime_put_sync(drm->dev);
 
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irqsave(&crtc->dev->event_lock, flags);
@@ -581,9 +663,15 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mtk_crtc->pending_async_planes = true;
 
 	if (priv->data->shadow_register) {
-		mtk_mutex_acquire(mtk_crtc->mutex);
+		for (i = 0; i < MAX_MMSYS; i++)
+			if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+				mtk_mutex_acquire(mtk_crtc->mutex[i]);
+
 		mtk_crtc_ddp_config(crtc, NULL);
-		mtk_mutex_release(mtk_crtc->mutex);
+
+		for (i = 0; i < MAX_MMSYS; i++)
+			if (mtk_crtc->exist[i] && mtk_crtc->mutex[i])
+				mtk_mutex_release(mtk_crtc->mutex[i]);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client.chan) {
@@ -659,6 +747,7 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 {
 	int crtc_index = drm_crtc_index(crtc);
 	int i;
+	unsigned int mmsys;
 	struct device *dev;
 	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -671,7 +760,8 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-	priv = ((struct mtk_drm_private *)crtc->dev->dev_private)->all_drm_private[crtc_index];
+	mmsys = mtk_crtc->conn_routes_sys;
+	priv = ((struct mtk_drm_private *)crtc->dev->dev_private)->all_drm_private[mmsys];
 	dev = priv->dev;
 
 	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
@@ -684,6 +774,8 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 		if (comp->encoder_index >= 0 &&
 		    (encoder_mask & BIT(comp->encoder_index))) {
 			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] = comp;
+			mtk_crtc->ddp_comp_sys[mtk_crtc->ddp_comp_nr - 1] = mmsys;
+			mtk_crtc->exist[mmsys] = true;
 			dev_dbg(dev, "Add comp_id: %d at path index %d\n",
 				comp->id, mtk_crtc->ddp_comp_nr - 1);
 			break;
@@ -720,13 +812,35 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	int ret;
+	int i, j;
+	int mmsys_cnt = 0;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
-	ret = mtk_ddp_comp_power_on(comp);
-	if (ret < 0) {
-		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
-		return;
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			mmsys_cnt++;
+
+	if (mmsys_cnt == 1) {
+		ret = pm_runtime_resume_and_get(comp->dev);
+		if (ret < 0) {
+			DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
+			return;
+		}
+	} else {
+		for (i = 0; i < MAX_MMSYS; i++) {
+			if (!mtk_crtc->exist[i])
+				continue;
+			ret = pm_runtime_resume_and_get(mtk_crtc->mmsys_dev[i]);
+			if (ret < 0) {
+				DRM_DEV_ERROR(mtk_crtc->mmsys_dev[i],
+					      "Failed to enable power domain: %d\n", ret);
+				for (j = i - 1; j >= 0; j--)
+					if (mtk_crtc->exist[i])
+						pm_runtime_put(comp->dev);
+				return;
+			}
+		}
 	}
 
 	mtk_crtc_update_output(crtc, state);
@@ -746,12 +860,17 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i;
+	int i, ret;
+	int mmsys_cnt = 0;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
 		return;
 
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			mmsys_cnt++;
+
 	/* Set all pending plane state to disabled */
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
@@ -776,7 +895,21 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
-	mtk_ddp_comp_power_off(comp);
+
+	if (mmsys_cnt > 1) {
+		for (i = 0; i < MAX_MMSYS; i++) {
+			if (mtk_crtc->exist[i]) {
+				ret = pm_runtime_put(mtk_crtc->mmsys_dev[i]);
+				if (ret < 0)
+					DRM_DEV_ERROR(mtk_crtc->mmsys_dev[i],
+						      "Failed to disable power domain: %d\n", ret);
+			}
+		}
+	} else {
+		ret = pm_runtime_put(comp->dev);
+		if (ret < 0)
+			DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n", ret);
+	}
 
 	mtk_crtc->enabled = false;
 }
@@ -937,49 +1070,108 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc)
 	return mtk_crtc->dma_dev;
 }
 
-int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
-		    unsigned int path_len, int priv_data_index,
-		    const struct mtk_drm_route *conn_routes,
-		    unsigned int num_conn_routes)
+int mtk_crtc_create(struct drm_device *drm_dev, enum mtk_crtc_path path_sel)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
 	struct mtk_crtc *mtk_crtc;
 	unsigned int num_comp_planes = 0;
 	int ret;
-	int i;
+	int i, j, k;
 	bool has_ctm = false;
 	uint gamma_lut_size = 0;
 	struct drm_crtc *tmp;
 	int crtc_i = 0;
-
-	if (!path)
-		return 0;
-
-	priv = priv->all_drm_private[priv_data_index];
+	struct mtk_drm_private *subsys_priv;
+	struct mtk_crtc_comp_info path[DDP_COMPONENT_ID_MAX];
+	unsigned int path_len = 0;
+	const struct mtk_drm_route *conn_routes = NULL;
+	unsigned int num_conn_routes = 0;
+	enum mtk_drm_mmsys conn_mmsys;
 
 	drm_for_each_crtc(tmp, drm_dev)
 		crtc_i++;
 
+	for (j = 0; j < priv->data->mmsys_dev_num; j++) {
+		for (k = 0; k < MAX_MMSYS; k++) {
+			const unsigned int *subsys_path;
+			unsigned int subsys_path_len;
+			unsigned int order = 0;
+
+			subsys_priv = priv->all_drm_private[k];
+			if (!subsys_priv)
+				continue;
+
+			if (path_sel == CRTC_MAIN) {
+				subsys_path = subsys_priv->data->main_path;
+				subsys_path_len = subsys_priv->data->main_len;
+				order = subsys_priv->data->main_order;
+			} else if (path_sel == CRTC_EXT) {
+				subsys_path = subsys_priv->data->ext_path;
+				subsys_path_len = subsys_priv->data->ext_len;
+				order = subsys_priv->data->ext_order;
+			} else if (path_sel == CRTC_THIRD) {
+				subsys_path = subsys_priv->data->third_path;
+				subsys_path_len = subsys_priv->data->third_len;
+				order = subsys_priv->data->third_order;
+			}
+
+			if (subsys_priv->data->num_conn_routes) {
+				conn_routes = subsys_priv->data->conn_routes;
+				num_conn_routes = subsys_priv->data->num_conn_routes;
+				conn_mmsys = subsys_priv->data->mmsys_id;
+			}
+
+			if (j != order)
+				continue;
+			if (!subsys_path_len)
+				continue;
+
+			for (i = 0; i < subsys_path_len; i++) {
+				path[path_len].sys = subsys_priv->data->mmsys_id;
+				path[path_len].comp_id = subsys_path[i];
+				path_len++;
+			}
+		}
+	}
+
+	if (!path_len)
+		return 0;
+
+	if (num_conn_routes) {
+		for (i = 0; i < num_conn_routes; i++)
+			if (conn_routes->crtc_id == crtc_i)
+				break;
+		if (i == num_conn_routes) {
+			num_conn_routes = 0;
+			conn_routes = NULL;
+		}
+	}
+
 	for (i = 0; i < path_len; i++) {
-		enum mtk_ddp_comp_id comp_id = path[i];
+		enum mtk_ddp_comp_id comp_id = path[i].comp_id;
 		struct device_node *node;
 		struct mtk_ddp_comp *comp;
 
+		priv = priv->all_drm_private[path[i].sys];
 		node = priv->comp_node[comp_id];
 		comp = &priv->ddp_comp[comp_id];
 
 		/* Not all drm components have a DTS device node, such as ovl_adaptor,
 		 * which is the drm bring up sub driver
 		 */
-		if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR) {
+		if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR &&
+		    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 &&
+		    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 &&
+		    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 &&
+		    mtk_ddp_comp_get_type(comp_id) != MTK_DISP_VIRTUAL) {
 			dev_info(dev,
 				"Not creating crtc %d because component %d is disabled or missing\n",
 				crtc_i, comp_id);
 			return 0;
 		}
 
-		if (!comp->dev) {
+		if (!comp->dev && mtk_ddp_comp_get_type(comp_id) != MTK_DISP_VIRTUAL) {
 			dev_err(dev, "Component %pOF not initialized\n", node);
 			return -ENODEV;
 		}
@@ -989,7 +1181,9 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 	if (!mtk_crtc)
 		return -ENOMEM;
 
-	mtk_crtc->mmsys_dev = priv->mmsys_dev;
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (priv->all_drm_private[i])
+			mtk_crtc->mmsys_dev[i] = priv->all_drm_private[i]->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
 	mtk_crtc->ddp_comp = devm_kcalloc(dev,
 					  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
@@ -998,19 +1192,36 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
-	if (IS_ERR(mtk_crtc->mutex)) {
-		ret = PTR_ERR(mtk_crtc->mutex);
-		dev_err(dev, "Failed to get mutex: %d\n", ret);
-		return ret;
+	mtk_crtc->ddp_comp_sys = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr +
+						    (conn_routes ? 1 : 0),
+						    sizeof(mtk_crtc->ddp_comp_sys), GFP_KERNEL);
+	if (!mtk_crtc->ddp_comp_sys)
+		return -ENOMEM;
+
+	for (i = 0; i < MAX_MMSYS; i++) {
+		if (!priv->all_drm_private[i])
+			continue;
+
+		priv = priv->all_drm_private[i];
+		mtk_crtc->mutex[i] = mtk_mutex_get(priv->mutex_dev);
+		if (IS_ERR(mtk_crtc->mutex[i])) {
+			ret = PTR_ERR(mtk_crtc->mutex[i]);
+			dev_err(dev, "Failed to get mutex: %d\n", ret);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
-		unsigned int comp_id = path[i];
+		unsigned int comp_id = path[i].comp_id;
 		struct mtk_ddp_comp *comp;
 
+		priv = priv->all_drm_private[path[i].sys];
 		comp = &priv->ddp_comp[comp_id];
+		if (mtk_ddp_comp_get_type(comp_id) == MTK_DISP_VIRTUAL)
+			comp->id = comp_id;
 		mtk_crtc->ddp_comp[i] = comp;
+		mtk_crtc->ddp_comp_sys[i] = path[i].sys;
+		mtk_crtc->exist[path[i].sys] = true;
 
 		if (comp->funcs) {
 			if (comp->funcs->gamma_set && comp->funcs->gamma_get_lut_size) {
@@ -1047,8 +1258,10 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 	 * In the case of ovl_adaptor sub driver, it needs to use the
 	 * dma_dev_get function to get representative dma dev.
 	 */
-	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
+	priv = priv->all_drm_private[path[0].sys];
+	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0].comp_id]);
 
+	mtk_crtc->vdisp_ao_dev = priv->vdisp_ao_dev;
 	ret = mtk_crtc_init(drm_dev, mtk_crtc, crtc_i);
 	if (ret < 0)
 		return ret;
@@ -1061,7 +1274,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	i = priv->mbox_index++;
-	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
+	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev[priv->data->mmsys_id];
 	mtk_crtc->cmdq_client.client.tx_block = false;
 	mtk_crtc->cmdq_client.client.knows_txdone = true;
 	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
@@ -1101,6 +1314,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 #endif
 
 	if (conn_routes) {
+		priv = priv->all_drm_private[conn_mmsys];
 		for (i = 0; i < num_conn_routes; i++) {
 			unsigned int comp_id = conn_routes[i].route_ddp;
 			struct device_node *node = priv->comp_node[comp_id];
@@ -1117,6 +1331,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 			mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
 		}
 
+		mtk_crtc->conn_routes_sys = conn_mmsys;
 		mtk_crtc->num_conn_routes = num_conn_routes;
 		mtk_crtc->conn_routes = conn_routes;
 
@@ -1124,5 +1339,10 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		mtk_crtc->ddp_comp_nr++;
 	}
 
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (mtk_crtc->exist[i])
+			device_link_add(mtk_crtc->base.dev->dev,
+					priv->all_drm_private[i]->mutex_dev, 0);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 388e900b6f4d..255f2823d17a 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -15,10 +15,8 @@
 #define MTK_MIN_BPC	3
 
 void mtk_crtc_commit(struct drm_crtc *crtc);
-int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
-		    unsigned int path_len, int priv_data_index,
-		    const struct mtk_drm_route *conn_routes,
-		    unsigned int num_conn_routes);
+int mtk_crtc_create(struct drm_device *drm_dev,
+		    enum mtk_crtc_path path_sel);
 int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			 struct mtk_plane_state *state);
 void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 492b8d965309..f841184d1e06 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -464,6 +464,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
 	[MTK_DISP_UFOE] = "ufoe",
+	[MTK_DISP_VIRTUAL] = "virtual",
 	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DP_INTF] = "dp-intf",
 	[MTK_DPI] = "dpi",
@@ -487,6 +488,15 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
 	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
 	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
+	[DDP_COMPONENT_DLI_ASYNC0]      = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLI_ASYNC1]      = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLI_ASYNC8]      = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLI_ASYNC21]     = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLI_ASYNC22]     = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLI_ASYNC23]     = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLO_ASYNC1]      = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLO_ASYNC2]      = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_DLO_ASYNC3]      = { MTK_DISP_VIRTUAL,           -1, NULL },
 	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
 	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
 	[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
@@ -494,6 +504,9 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
 	[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0] = { MTK_DISP_OVLSYS_ADAPTOR, 0, &ddp_ovlsys_adaptor},
 	[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1] = { MTK_DISP_OVLSYS_ADAPTOR, 1, &ddp_ovlsys_adaptor},
+	[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0] = { MTK_DISP_OVLSYS_ADAPTOR, 0, &ddp_ovlsys_adaptor},
+	[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1] = { MTK_DISP_OVLSYS_ADAPTOR, 1, &ddp_ovlsys_adaptor},
+	[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2] = { MTK_DISP_OVLSYS_ADAPTOR, 2, &ddp_ovlsys_adaptor},
 	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
 	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
 	[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
@@ -510,7 +523,10 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,		0, &ddp_od },
 	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,		1, &ddp_od },
 	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,		0, &ddp_ovl },
+	[DDP_COMPONENT_OVL0_DLO_ASYNC5] = { MTK_DISP_VIRTUAL,           -1, NULL },
+	[DDP_COMPONENT_OVL0_DLO_ASYNC6] = { MTK_DISP_VIRTUAL,           -1, NULL },
 	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,		1, &ddp_ovl },
+	[DDP_COMPONENT_OVL1_DLO_ASYNC5] = { MTK_DISP_VIRTUAL,           -1, NULL },
 	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,		0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,		1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,		2, &ddp_ovl },
@@ -567,12 +583,19 @@ static bool mtk_ddp_path_available(const unsigned int *path,
 {
 	unsigned int i;
 
+	if (!path_len)
+		return true;
+
 	if (!path || !path_len)
 		return false;
 
 	for (i = 0U; i < path_len; i++) {
 		/* OVL_ADAPTOR doesn't have a device node */
-		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
+		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR ||
+		    path[i] == DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 ||
+			path[i] == DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 ||
+			path[i] == DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 ||
+			mtk_ddp_comp_get_type(path[i]) == MTK_DISP_VIRTUAL)
 			continue;
 
 		if (!comp_node[path[i]])
@@ -597,44 +620,81 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
+enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id)
+{
+	return mtk_ddp_matches[comp_id].type;
+}
+
 int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	const struct mtk_mmsys_driver_data *data;
 	struct mtk_drm_private *priv_n;
-	int i = 0, j;
 	int ret;
+	int i = 0, j, count = 0;
+	bool found = false;
 
 	for (j = 0; j < private->data->mmsys_dev_num; j++) {
 		priv_n = private->all_drm_private[j];
 		data = priv_n->data;
 
 		if (mtk_ddp_path_available(data->main_path, data->main_len,
-					   priv_n->comp_node)) {
-			if (mtk_ddp_comp_find(dev, data->main_path,
-					      data->main_len,
-					      priv_n->ddp_comp))
-				return BIT(i);
-			i++;
-		}
+					   priv_n->comp_node))
+			count++;
+
+		if (mtk_ddp_comp_find(dev, data->main_path, data->main_len,
+				      priv_n->ddp_comp))
+			found = true;
+	}
+
+	if (count == private->data->mmsys_dev_num) {
+		if (found)
+			return BIT(i);
+		i++;
+	}
+
+	count = 0;
+	found = false;
+
+	for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		priv_n = private->all_drm_private[j];
+		data = priv_n->data;
 
 		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
-					   priv_n->comp_node)) {
-			if (mtk_ddp_comp_find(dev, data->ext_path,
-					      data->ext_len,
-					      priv_n->ddp_comp))
-				return BIT(i);
-			i++;
-		}
+					   priv_n->comp_node))
+			count++;
+
+		if (mtk_ddp_comp_find(dev, data->ext_path, data->ext_len,
+				      priv_n->ddp_comp))
+			found = true;
+	}
+
+	if (count == private->data->mmsys_dev_num) {
+		if (found)
+			return BIT(i);
+		i++;
+	}
+
+	count = 0;
+	found = false;
+
+	for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		priv_n = private->all_drm_private[j];
+		data = priv_n->data;
 
 		if (mtk_ddp_path_available(data->third_path, data->third_len,
-					   priv_n->comp_node)) {
-			if (mtk_ddp_comp_find(dev, data->third_path,
-					      data->third_len,
-					      priv_n->ddp_comp))
-				return BIT(i);
-			i++;
-		}
+					priv_n->comp_node))
+			count++;
+
+		if (mtk_ddp_comp_find(dev, data->third_path, data->third_len,
+				      priv_n->ddp_comp))
+			found = true;
+	}
+
+	if (count == private->data->mmsys_dev_num) {
+		if (found)
+			return BIT(i);
+		i++;
 	}
 
 	ret = mtk_ddp_comp_find_in_route(dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index ef64ce7a071f..badb42bd4f7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -40,6 +40,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
 	MTK_DISP_UFOE,
+	MTK_DISP_VIRTUAL,
 	MTK_DISP_WDMA,
 	MTK_DPI,
 	MTK_DP_INTF,
@@ -47,6 +48,7 @@ enum mtk_ddp_comp_type {
 	MTK_OVL_BLENDER,
 	MTK_OVL_EXDMA,
 	MTK_OVL_OUTPROC,
+	MTK_VDISP_AO,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7526bc38bcc7..0665a6feb546 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -193,6 +193,10 @@ static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, DDP_COMPONENT_DSI0},
 };
 
+static const struct mtk_drm_route mt8196_mtk_ddp_routes[] = {
+	{2, DDP_COMPONENT_DSI0},
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -231,6 +235,50 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0,
+	DDP_COMPONENT_OVL0_DLO_ASYNC5,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_main[] = {
+	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_DLO_ASYNC1,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_main[] = {
+	DDP_COMPONENT_DLI_ASYNC21,
+	DDP_COMPONENT_DVO0,
+};
+
+static const unsigned int mt8196_mtk_ddp_ovl0_ext[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1,
+	DDP_COMPONENT_OVL0_DLO_ASYNC6,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_ext[] = {
+	DDP_COMPONENT_DLI_ASYNC1,
+	DDP_COMPONENT_DLO_ASYNC2,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_ext[] = {
+	DDP_COMPONENT_DLI_ASYNC22,
+	DDP_COMPONENT_DP_INTF0,
+};
+
+static const unsigned int mt8196_mtk_ddp_ovl1_third[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2,
+	DDP_COMPONENT_OVL1_DLO_ASYNC5,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_third[] = {
+	DDP_COMPONENT_DLI_ASYNC8,
+	DDP_COMPONENT_DLO_ASYNC3,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_third[] = {
+	DDP_COMPONENT_DLI_ASYNC23,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -327,6 +375,67 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8196_dispsys0_driver_data = {
+	.main_path = mt8196_mtk_ddp_disp0_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_main),
+	.main_order = 1,
+	.ext_path = mt8196_mtk_ddp_disp0_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_ext),
+	.ext_order = 1,
+	.third_path = mt8196_mtk_ddp_disp0_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_third),
+	.third_order = 1,
+	.mmsys_id = DISPSYS0,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_dispsys1_driver_data = {
+	.main_path = mt8196_mtk_ddp_disp1_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_main),
+	.main_order = 2,
+	.ext_path = mt8196_mtk_ddp_disp1_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_ext),
+	.ext_order = 2,
+	.third_path = mt8196_mtk_ddp_disp1_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_third),
+	.conn_routes = mt8196_mtk_ddp_routes,
+	.num_conn_routes = ARRAY_SIZE(mt8196_mtk_ddp_routes),
+	.third_order = 2,
+	.mmsys_id = DISPSYS1,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys0_driver_data = {
+	.main_path = mt8196_mtk_ddp_ovl0_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl0_main),
+	.main_order = 0,
+	.ext_path = mt8196_mtk_ddp_ovl0_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl0_ext),
+	.ext_order = 0,
+	.mmsys_id = OVLSYS0,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys1_driver_data = {
+	.third_path = mt8196_mtk_ddp_ovl1_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl1_third),
+	.third_order = 0,
+	.mmsys_id = OVLSYS1,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -354,6 +463,14 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8196-dispsys0",
+	  .data = &mt8196_dispsys0_driver_data},
+	{ .compatible = "mediatek,mt8196-dispsys1",
+	  .data = &mt8196_dispsys1_driver_data},
+	{ .compatible = "mediatek,mt8196-ovlsys0",
+	  .data = &mt8196_ovlsys0_driver_data},
+	{ .compatible = "mediatek,mt8196-ovlsys1",
+	  .data = &mt8196_ovlsys1_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -368,7 +485,7 @@ static int mtk_drm_match(struct device *dev, const void *data)
 static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
-	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *all_drm_priv[MAX_MMSYS] = {NULL};
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
@@ -395,23 +512,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (!temp_drm_priv)
 			continue;
 
-		if (temp_drm_priv->data->main_len)
-			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
-		else if (temp_drm_priv->data->ext_len)
-			all_drm_priv[CRTC_EXT] = temp_drm_priv;
-		else if (temp_drm_priv->data->third_len)
-			all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+		all_drm_priv[temp_drm_priv->data->mmsys_id] = temp_drm_priv;
 
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC)
+		if (cnt == temp_drm_priv->data->mmsys_dev_num)
 			break;
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-		for (i = 0; i < cnt; i++)
-			for (j = 0; j < cnt; j++)
+		for (i = 0; i < MAX_MMSYS; i++)
+			for (j = 0; j < MAX_MMSYS; j++)
 				all_drm_priv[j]->all_drm_private[i] = all_drm_priv[i];
 
 		return true;
@@ -498,7 +610,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
-	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+	for (i = 0; i < MAX_MMSYS; i++) {
+		if (!private->all_drm_private[i])
+			continue;
+
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
 		if (ret)
@@ -521,8 +636,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	 *    third path.
 	 */
 	for (i = 0; i < MAX_CRTC; i++) {
-		for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		for (j = 0; j < MAX_MMSYS; j++) {
 			priv_n = private->all_drm_private[j];
+			if (!priv_n)
+				continue;
 
 			if (priv_n->data->max_width)
 				drm->mode_config.max_width = priv_n->data->max_width;
@@ -534,28 +651,23 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				drm->mode_config.min_height = priv_n->data->min_height;
 
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
-				ret = mtk_crtc_create(drm, priv_n->data->main_path,
-						      priv_n->data->main_len, j,
-						      priv_n->data->conn_routes,
-						      priv_n->data->num_conn_routes);
+				ret = mtk_crtc_create(drm, CRTC_MAIN);
 				if (ret)
 					goto err_component_unbind;
 
-				continue;
+				break;
 			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
-				ret = mtk_crtc_create(drm, priv_n->data->ext_path,
-						      priv_n->data->ext_len, j, NULL, 0);
+				ret = mtk_crtc_create(drm, CRTC_EXT);
 				if (ret)
 					goto err_component_unbind;
 
-				continue;
+				break;
 			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
-				ret = mtk_crtc_create(drm, priv_n->data->third_path,
-						      priv_n->data->third_len, j, NULL, 0);
+				ret = mtk_crtc_create(drm, CRTC_THIRD);
 				if (ret)
 					goto err_component_unbind;
 
-				continue;
+				break;
 			}
 		}
 	}
@@ -574,8 +686,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		goto err_component_unbind;
 	}
 
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		private->all_drm_private[i]->dma_dev = dma_dev;
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (private->all_drm_private[i])
+			private->all_drm_private[i]->dma_dev = dma_dev;
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
@@ -593,11 +706,13 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	return 0;
 
 err_component_unbind:
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		component_unbind_all(private->all_drm_private[i]->dev, drm);
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (private->all_drm_private[i])
+			component_unbind_all(private->all_drm_private[i]->dev, drm);
 put_mutex_dev:
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		put_device(private->all_drm_private[i]->mutex_dev);
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (private->all_drm_private[i])
+			put_device(private->all_drm_private[i]->mutex_dev);
 
 	return ret;
 }
@@ -661,6 +776,19 @@ static int mtk_drm_bind(struct device *dev)
 	}
 
 	private->mutex_dev = &pdev->dev;
+
+	if (private->vdisp_ao_node) {
+		pdev = of_find_device_by_node(private->vdisp_ao_node);
+		if (!pdev) {
+			dev_err(dev, "Waiting for vdisp_ao device %pOF\n",
+				private->vdisp_ao_node);
+			of_node_put(private->mutex_node);
+			of_node_put(private->vdisp_ao_node);
+			return -EPROBE_DEFER;
+		}
+		private->vdisp_ao_dev = &pdev->dev;
+	}
+
 	private->mtk_drm_bound = true;
 	private->dev = dev;
 
@@ -673,8 +801,9 @@ static int mtk_drm_bind(struct device *dev)
 
 	private->drm_master = true;
 	drm->dev_private = private;
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		private->all_drm_private[i]->drm = drm;
+	for (i = 0; i < MAX_MMSYS; i++)
+		if (private->all_drm_private[i])
+			private->all_drm_private[i]->drm = drm;
 
 	ret = mtk_drm_kms_init(drm);
 	if (ret < 0)
@@ -771,6 +900,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8196-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -837,6 +968,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8196-vdisp-ao",
+	  .data = (void *)MTK_VDISP_AO },
 	{ }
 };
 
@@ -1111,7 +1244,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->data = mtk_drm_data;
 	};
 
-	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
+	private->all_drm_private = devm_kmalloc_array(dev, MAX_MMSYS,
 						      sizeof(*private->all_drm_private),
 						      GFP_KERNEL);
 	if (!private->all_drm_private)
@@ -1163,6 +1296,22 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
 	}
 
+	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2)) {
+		struct mtk_drm_ovlsys_private ovlsys_priv;
+
+		ovlsys_priv.mmsys_dev = private->mmsys_dev;
+		ovlsys_priv.use_path =
+			mtk_drm_mmsys_comp_in_path(private, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);
+		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovlsys-adaptor",
+							    PLATFORM_DEVID_AUTO,
+							    (void *)&ovlsys_priv,
+							    sizeof(struct mtk_drm_ovlsys_private));
+		private->ddp_comp[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2].dev = &ovl_adaptor->dev;
+		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2],
+				  DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);
+		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+	}
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
 		enum mtk_ddp_comp_type comp_type;
@@ -1189,6 +1338,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		if (comp_type == MTK_VDISP_AO) {
+			private->vdisp_ao_node = of_node_get(node);
+			dev_dbg(dev, "get vdisp_ao node");
+			continue;
+		}
+
 		comp_id = mtk_ddp_comp_get_id(node, comp_type);
 		if (comp_id < 0) {
 			dev_warn(dev, "Skipping unknown component %pOF\n",
@@ -1241,6 +1396,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, private);
 
+	if (!match)
+		drm_of_component_match_add(dev, &match, component_compare_of, NULL);
+
 	ret = component_master_add_with_match(dev, &mtk_drm_ops, match);
 	if (ret)
 		goto err_pm;
@@ -1264,6 +1422,7 @@ static void mtk_drm_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &mtk_drm_ops);
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
+	of_node_put(private->vdisp_ao_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index aa17e743a1d0..36cfbfa30ff2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -13,7 +13,8 @@
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
 #define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
 #define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 + 1)
-#define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 + 1)
+#define DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 + 1)
+#define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 + 1)
 
 enum mtk_crtc_path {
 	CRTC_MAIN,
@@ -22,6 +23,14 @@ enum mtk_crtc_path {
 	MAX_CRTC,
 };
 
+enum mtk_drm_mmsys {
+	DISPSYS0,
+	DISPSYS1,
+	OVLSYS0,
+	OVLSYS1,
+	MAX_MMSYS,
+};
+
 struct device;
 struct device_node;
 struct drm_crtc;
@@ -38,10 +47,13 @@ struct mtk_drm_route {
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
+	unsigned int main_order;
 	const unsigned int *ext_path;
 	unsigned int ext_len;
+	unsigned int ext_order;
 	const unsigned int *third_path;
 	unsigned int third_len;
+	unsigned int third_order;
 	const struct mtk_drm_route *conn_routes;
 	unsigned int num_conn_routes;
 
@@ -63,6 +75,8 @@ struct mtk_drm_private {
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
 	struct device *mmsys_dev;
+	struct device_node *vdisp_ao_node;
+	struct device *vdisp_ao_dev;
 	struct device_node *comp_node[DDP_COMPONENT_DRM_ID_MAX];
 	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_DRM_ID_MAX];
 	struct mtk_mmsys_driver_data *data;
-- 
2.34.1

