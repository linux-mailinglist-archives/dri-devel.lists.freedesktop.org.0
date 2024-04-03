Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B299A896C4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C371E1129A8;
	Wed,  3 Apr 2024 10:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uqDYRv2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D46C1129A5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:27:11 +0000 (UTC)
X-UUID: b7496b94f1a411ee935d6952f98a51a9-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o4rXxV9viX0/gnnFJo6PdxSLy3tg+lENj5IhczV5Kwk=; 
 b=uqDYRv2rmiIj6VQ3KUMa9PPCPH8q2tJwHf5/brgX1XnxtUs2nSsuxelSSJREyzfzuPLkpZwpCv27rTsLv93FYBw91vCL3S2OHzCUGzSs9tEH0aVzV7VvhYs+QLR2MmBu7VG00U/+Mm5MZX1T6NI2wijdZ9oPxbbmp2x0/ICR1Hg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:3e8f5664-5ee4-4a5a-8ab9-971b6e898596, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:949d2c91-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b7496b94f1a411ee935d6952f98a51a9-20240403
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 144442713; Wed, 03 Apr 2024 18:27:04 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:03 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 8/9] drm/mediatek: Add secure flow support to mediatek-drm
Date: Wed, 3 Apr 2024 18:27:00 +0800
Message-ID: <20240403102701.369-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

To add secure flow support for mediatek-drm, each crtc have to
create a secure cmdq mailbox channel. Then cmdq packets with
display HW configuration will be sent to secure cmdq mailbox channel
and configured in the secure world.

Each crtc have to use secure cmdq interface to configure some secure
settings for display HW before sending cmdq packets to secure cmdq
mailbox channel.

If any of fb get from current drm_atomic_state is secure, then crtc
will switch to the secure flow to configure display HW.
If all fbs are not secure in current drm_atomic_state, then crtc will
switch to the normal flow.

TODO:
1. Remove get sec larb port interface in ddp_comp, ovl and ovl_adaptor.
2. Verify instruction for enabling/disabling dapc and larb port in TEE
   drop the sec_engine flags in normal world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c  | 273 ++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_plane.c |   7 +
 3 files changed, 271 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 29d00d11224b0..8a3c204d48d2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -57,6 +57,11 @@ struct mtk_crtc {
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
 	wait_queue_head_t		cb_blocking_queue;
+
+	struct cmdq_client		sec_cmdq_client;
+	struct cmdq_pkt			sec_cmdq_handle;
+	bool				sec_cmdq_working;
+	wait_queue_head_t		sec_cb_blocking_queue;
 #endif
 
 	struct device			*mmsys_dev;
@@ -73,6 +78,8 @@ struct mtk_crtc {
 
 	struct mtk_ddp_comp		*crc_provider;
 	struct drm_vblank_work		crc_work;
+
+	bool				sec_on;
 };
 
 struct mtk_crtc_state {
@@ -117,6 +124,156 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	}
 }
 
+void mtk_crtc_disable_secure_state(struct drm_crtc *crtc)
+{
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	enum cmdq_sec_scenario sec_scn = CMDQ_SEC_SCNR_MAX;
+	int i;
+	struct mtk_ddp_comp *ddp_first_comp;
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	u64 sec_engine = 0; /* for hw engine write output secure fb */
+	u64 sec_port = 0; /* for larb port read input secure fb */
+
+	mutex_lock(&mtk_crtc->hw_lock);
+
+	if (!mtk_crtc->sec_cmdq_client.chan) {
+		pr_err("crtc-%d secure mbox channel is NULL\n", drm_crtc_index(crtc));
+		goto err;
+	}
+
+	if (!mtk_crtc->sec_on) {
+		pr_debug("crtc-%d is already disabled!\n", drm_crtc_index(crtc));
+		goto err;
+	}
+
+	mbox_flush(mtk_crtc->sec_cmdq_client.chan, 0);
+	mtk_crtc->sec_cmdq_handle.cmd_buf_size = 0;
+
+	if (mtk_crtc->sec_cmdq_handle.sec_data) {
+		struct cmdq_sec_data *sec_data;
+
+		sec_data = mtk_crtc->sec_cmdq_handle.sec_data;
+		sec_data->addr_metadata_cnt = 0;
+		sec_data->addr_metadatas = (uintptr_t)NULL;
+	}
+
+	/*
+	 * Secure path only support DL mode, so we just wait
+	 * the first path frame done here
+	 */
+	cmdq_pkt_wfe(&mtk_crtc->sec_cmdq_handle, mtk_crtc->cmdq_event, false);
+
+	ddp_first_comp = mtk_crtc->ddp_comp[0];
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[i];
+
+		sec_port |= mtk_ddp_comp_layer_get_sec_port(ddp_first_comp, i);
+
+		/* make sure secure layer off before switching secure state */
+		if (!mtk_plane_fb_is_secure(plane->state->fb)) {
+			struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
+
+			plane_state->pending.enable = false;
+			mtk_ddp_comp_layer_config(ddp_first_comp, i, plane_state,
+						  &mtk_crtc->sec_cmdq_handle);
+		}
+	}
+
+	/* Disable secure path */
+	if (drm_crtc_index(crtc) == 0)
+		sec_scn = CMDQ_SEC_SCNR_PRIMARY_DISP_DISABLE;
+	else if (drm_crtc_index(crtc) == 1)
+		sec_scn = CMDQ_SEC_SCNR_SUB_DISP_DISABLE;
+
+	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_engine, sec_engine, sec_scn);
+
+	cmdq_pkt_finalize(&mtk_crtc->sec_cmdq_handle);
+	dma_sync_single_for_device(mtk_crtc->sec_cmdq_client.chan->mbox->dev,
+				   mtk_crtc->sec_cmdq_handle.pa_base,
+				   mtk_crtc->sec_cmdq_handle.cmd_buf_size,
+				   DMA_TO_DEVICE);
+
+	mtk_crtc->sec_cmdq_working = true;
+	mbox_send_message(mtk_crtc->sec_cmdq_client.chan, &mtk_crtc->sec_cmdq_handle);
+	mbox_client_txdone(mtk_crtc->sec_cmdq_client.chan, 0);
+
+	// Wait for sec state to be disabled by cmdq
+	wait_event_timeout(mtk_crtc->sec_cb_blocking_queue,
+			   !mtk_crtc->sec_cmdq_working,
+			   msecs_to_jiffies(500));
+
+	mtk_crtc->sec_on = false;
+	pr_debug("crtc-%d disable secure plane!\n", drm_crtc_index(crtc));
+
+err:
+	mutex_unlock(&mtk_crtc->hw_lock);
+#endif
+}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static void mtk_crtc_enable_secure_state(struct drm_crtc *crtc)
+{
+	enum cmdq_sec_scenario sec_scn = CMDQ_SEC_SCNR_MAX;
+	int i;
+	struct mtk_ddp_comp *ddp_first_comp;
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	u64 sec_engine = 0; /* for hw engine write output secure fb */
+	u64 sec_port = 0; /* for larb port read input secure fb */
+
+	cmdq_pkt_wfe(&mtk_crtc->sec_cmdq_handle, mtk_crtc->cmdq_event, false);
+
+	ddp_first_comp = mtk_crtc->ddp_comp[0];
+	for (i = 0; i < mtk_crtc->layer_nr; i++)
+		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
+			sec_port |= mtk_ddp_comp_layer_get_sec_port(ddp_first_comp, i);
+
+	if (drm_crtc_index(crtc) == 0)
+		sec_scn = CMDQ_SEC_SCNR_PRIMARY_DISP;
+	else if (drm_crtc_index(crtc) == 1)
+		sec_scn = CMDQ_SEC_SCNR_SUB_DISP;
+
+	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_engine, sec_port, sec_scn);
+
+	pr_debug("crtc-%d enable secure plane!\n", drm_crtc_index(crtc));
+}
+#endif
+
+static void mtk_crtc_plane_switch_sec_state(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	bool sec_on[MAX_CRTC] = {0};
+	int i;
+	struct drm_crtc_state *crtc_state;
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state;
+
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
+		if (!plane->state->crtc)
+			continue;
+
+		if (plane->state->fb &&
+		    mtk_plane_fb_is_secure(plane->state->fb) &&
+		    mtk_crtc->sec_cmdq_client.chan)
+			sec_on[drm_crtc_index(plane->state->crtc)] = true;
+	}
+
+	for_each_old_crtc_in_state(state, crtc, crtc_state, i) {
+		mtk_crtc = to_mtk_crtc(crtc);
+
+		if (!sec_on[i]) {
+			mtk_crtc_disable_secure_state(crtc);
+			continue;
+		}
+
+		mutex_lock(&mtk_crtc->hw_lock);
+		mtk_crtc->sec_on = true;
+		mutex_unlock(&mtk_crtc->hw_lock);
+	}
+#endif
+}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
 				   size_t size)
@@ -152,22 +309,33 @@ static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
+	kfree(pkt->sec_data);
 }
 #endif
 
 static void mtk_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	int i;
 
+	priv = priv->all_drm_private[drm_crtc_index(crtc)];
+
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->sec_cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
+
+	if (mtk_crtc->sec_cmdq_client.chan) {
+		device_link_remove(priv->dev, mtk_crtc->sec_cmdq_client.chan->mbox->dev);
+		mbox_free_channel(mtk_crtc->sec_cmdq_client.chan);
+		mtk_crtc->sec_cmdq_client.chan = NULL;
+	}
 #endif
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -316,6 +484,11 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	if (data->sta < 0)
 		return;
 
+	if (!data->pkt || !data->pkt->sec_data)
+		mtk_crtc = container_of(cmdq_cl, struct mtk_crtc, cmdq_client);
+	else
+		mtk_crtc = container_of(cmdq_cl, struct mtk_crtc, sec_cmdq_client);
+
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	state->pending_config = false;
@@ -344,6 +517,11 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 		mtk_crtc->pending_async_planes = false;
 	}
 
+	if (mtk_crtc->sec_cmdq_working) {
+		mtk_crtc->sec_cmdq_working = false;
+		wake_up(&mtk_crtc->sec_cb_blocking_queue);
+	}
+
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
@@ -567,7 +745,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
+	struct cmdq_client cmdq_client;
+	struct cmdq_pkt *cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
@@ -605,14 +784,36 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mtk_mutex_release(mtk_crtc->mutex);
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (mtk_crtc->cmdq_client.chan) {
+	if (mtk_crtc->sec_on) {
+		mbox_flush(mtk_crtc->sec_cmdq_client.chan, 0);
+		mtk_crtc->sec_cmdq_handle.cmd_buf_size = 0;
+
+		if (mtk_crtc->sec_cmdq_handle.sec_data) {
+			struct cmdq_sec_data *sec_data = mtk_crtc->sec_cmdq_handle.sec_data;
+
+			memset(sec_data->addr_metadatas, 0,
+			       sec_data->addr_metadata_cnt * sizeof(u64));
+			sec_data->addr_metadata_cnt = 0;
+		}
+
+		mtk_crtc_enable_secure_state(crtc);
+
+		cmdq_client = mtk_crtc->sec_cmdq_client;
+		cmdq_handle = &mtk_crtc->sec_cmdq_handle;
+	} else if (mtk_crtc->cmdq_client.chan) {
 		mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
-		cmdq_handle->cmd_buf_size = 0;
+		mtk_crtc->cmdq_handle.cmd_buf_size = 0;
+
+		cmdq_client =  mtk_crtc->cmdq_client;
+		cmdq_handle = &mtk_crtc->cmdq_handle;
+	}
+
+	if (cmdq_client.chan) {
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
+		dma_sync_single_for_device(cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
@@ -625,8 +826,8 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 3;
 
-		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
+		mbox_send_message(cmdq_client.chan, cmdq_handle);
+		mbox_client_txdone(cmdq_client.chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -835,6 +1036,8 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (!mtk_crtc->enabled)
 		return;
 
+	mtk_crtc_disable_secure_state(crtc);
+
 	/* Set all pending plane state to disabled */
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
@@ -873,6 +1076,8 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	unsigned long flags;
 
+	mtk_crtc_plane_switch_sec_state(crtc, state);
+
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
 		DRM_ERROR("new event while there is still a pending event\n");
 
@@ -1169,8 +1374,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_client.chan);
-			mtk_crtc->cmdq_client.chan = NULL;
+			goto cmdq_err;
 		} else {
 			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
 						      &mtk_crtc->cmdq_handle,
@@ -1178,14 +1382,63 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 			if (ret) {
 				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
 					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_client.chan);
-				mtk_crtc->cmdq_client.chan = NULL;
+				goto cmdq_err;
 			}
 		}
 
 		/* for sending blocking cmd in crtc disable */
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
+
+	mtk_crtc->sec_cmdq_client.client.dev = mtk_crtc->mmsys_dev;
+	mtk_crtc->sec_cmdq_client.client.tx_block = false;
+	mtk_crtc->sec_cmdq_client.client.knows_txdone = true;
+	mtk_crtc->sec_cmdq_client.client.rx_callback = ddp_cmdq_cb;
+	mtk_crtc->sec_cmdq_client.chan =
+			mbox_request_channel(&mtk_crtc->sec_cmdq_client.client, i + 1);
+	if (IS_ERR(mtk_crtc->sec_cmdq_client.chan)) {
+		dev_err(dev, "mtk_crtc %d failed to create sec mailbox client\n",
+			drm_crtc_index(&mtk_crtc->base));
+		mtk_crtc->sec_cmdq_client.chan = NULL;
+	}
+
+	if (mtk_crtc->sec_cmdq_client.chan) {
+		struct device_link *link;
+
+		/* add devlink to cmdq dev to make sure suspend/resume order is correct */
+		link = device_link_add(priv->dev, mtk_crtc->sec_cmdq_client.chan->mbox->dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(priv->dev, "Unable to link dev=%s\n",
+				dev_name(mtk_crtc->sec_cmdq_client.chan->mbox->dev));
+			ret = -ENODEV;
+			goto cmdq_err;
+		}
+
+		ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->sec_cmdq_client,
+					      &mtk_crtc->sec_cmdq_handle,
+					      PAGE_SIZE);
+		if (ret) {
+			dev_dbg(dev, "mtk_crtc %d failed to create cmdq secure packet\n",
+				drm_crtc_index(&mtk_crtc->base));
+			goto cmdq_err;
+		}
+
+		/* for sending blocking cmd in crtc disable */
+		init_waitqueue_head(&mtk_crtc->sec_cb_blocking_queue);
+	}
+
+cmdq_err:
+	if (ret) {
+		if (mtk_crtc->cmdq_client.chan) {
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
+		}
+		if (mtk_crtc->sec_cmdq_client.chan) {
+			mbox_free_channel(mtk_crtc->sec_cmdq_client.chan);
+			mtk_crtc->sec_cmdq_client.chan = NULL;
+		}
+	}
 #endif
 
 	if (conn_routes) {
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index a79c4611754e4..fc95209994a15 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -47,6 +47,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		    unsigned int path_len, int priv_data_index,
 		    const struct mtk_drm_route *conn_routes,
 		    unsigned int num_conn_routes);
+void mtk_crtc_disable_secure_state(struct drm_crtc *crtc);
 int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			 struct mtk_plane_state *state);
 void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 021148d4b5d4a..9762bba23273b 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -289,6 +289,13 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
 	mtk_plane_state->pending.dirty = true;
+
+	if (mtk_plane_state->pending.is_secure) {
+		struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+
+		if (old_state->crtc)
+			mtk_crtc_disable_secure_state(old_state->crtc);
+	}
 }
 
 static void mtk_plane_atomic_update(struct drm_plane *plane,
-- 
2.18.0

