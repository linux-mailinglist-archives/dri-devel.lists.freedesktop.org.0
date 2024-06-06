Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA138FE2AB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E58B10E8A6;
	Thu,  6 Jun 2024 09:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uqL0xRlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396A10E894
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:26:48 +0000 (UTC)
X-UUID: e0a2895c23e611efa54bbfbb386b949c-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i6SffNcQ8a7ESFIG0XfYMQtC09JDIF02sbbH76a1ez0=; 
 b=uqL0xRlfoy/lPGdWMF4Nbd/oUgGc4OXcKMs5fzscx2ZVbckMndNlnHslW8CPTcwCoxuYZ5qWZgsIVYKKbd68l7TIe++YPKxLo72eOQZpBY89UIvxUAcT9kVZ4g14+ntRUqXo21LYRbq/Y9OceFnrgFHWwbBxghE6aoNtVZWg+Cg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:59c26be6-cc73-4ce7-93aa-c1e6e0494b11, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:5d3b4744-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e0a2895c23e611efa54bbfbb386b949c-20240606
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1769797931; Thu, 06 Jun 2024 17:26:38 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:26:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:26:38 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, Fei Shao
 <fshao@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.com>
Subject: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Date: Thu, 6 Jun 2024 17:26:33 +0800
Message-ID: <20240606092635.27981-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606092635.27981-1-shawn.sung@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Register CRC related function pointers to support
CRC retrieval.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c     | 280 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h     |  38 ++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   5 +
 3 files changed, 323 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..be7cf61b9f9b 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_work.h>

 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
@@ -69,6 +70,9 @@ struct mtk_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+
+	struct mtk_ddp_comp		*crc_provider;
+	struct drm_vblank_work		crc_work;
 };

 struct mtk_crtc_state {
@@ -703,6 +707,88 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	}
 }

+static void mtk_crtc_crc_work(struct kthread_work *base)
+{
+	struct drm_vblank_work *work = to_drm_vblank_work(base);
+	struct mtk_crtc *mtk_crtc =
+		container_of(work, typeof(*mtk_crtc), crc_work);
+	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
+
+	if (!comp) {
+		DRM_WARN("%s(crtc-%d): no crc provider\n",
+			 __func__, drm_crtc_index(&mtk_crtc->base));
+		return;
+	}
+
+	if (mtk_crtc->base.crc.opened) {
+		u64 vblank = drm_crtc_vblank_count(&mtk_crtc->base);
+
+		comp->funcs->crc_read(comp->dev);
+
+		/* could take more than 50ms to finish */
+		drm_crtc_add_crc_entry(&mtk_crtc->base, true, vblank,
+				       comp->funcs->crc_entry(comp->dev));
+
+		drm_vblank_work_schedule(&mtk_crtc->crc_work, vblank + 1, true);
+	} else {
+		comp->funcs->crc_stop(comp->dev);
+	}
+}
+
+static int mtk_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
+
+	if (!comp) {
+		DRM_ERROR("%s(crtc-%d): no crc provider\n",
+			  __func__, drm_crtc_index(crtc));
+		return -ENOENT;
+	}
+
+	if (!src)
+		return -EINVAL;
+
+	if (strcmp(src, "auto") != 0) {
+		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
+			  __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+
+	comp->funcs->crc_start(comp->dev);
+
+	/*
+	 * skip the first crc because the first frame (vblank + 1) is configured
+	 * by mtk_crtc_ddp_hw_init() when atomic enable
+	 */
+	drm_vblank_work_schedule(&mtk_crtc->crc_work,
+				 drm_crtc_vblank_count(crtc) + 2, false);
+	return 0;
+}
+
+static int mtk_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src,
+				      size_t *cnt)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
+
+	if (!comp) {
+		DRM_ERROR("%s(crtc-%d): no crc provider\n",
+			  __func__, drm_crtc_index(crtc));
+		return -ENOENT;
+	}
+
+	if (src && strcmp(src, "auto") != 0) {
+		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
+			  __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+
+	*cnt = comp->funcs->crc_cnt(comp->dev);
+
+	return 0;
+}
+
 int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			 struct mtk_plane_state *state)
 {
@@ -751,6 +837,8 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,

 	drm_crtc_vblank_on(crtc);
 	mtk_crtc->enabled = true;
+
+	drm_vblank_work_init(&mtk_crtc->crc_work, crtc, mtk_crtc_crc_work);
 }

 static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -840,6 +928,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.atomic_destroy_state	= mtk_crtc_destroy_state,
 	.enable_vblank		= mtk_crtc_enable_vblank,
 	.disable_vblank		= mtk_crtc_disable_vblank,
+	.set_crc_source		= mtk_crtc_set_crc_source,
+	.verify_crc_source	= mtk_crtc_verify_crc_source,
 };

 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
@@ -1033,6 +1123,13 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,

 			if (comp->funcs->ctm_set)
 				has_ctm = true;
+
+			if (comp->funcs->crc_cnt   &&
+			    comp->funcs->crc_entry &&
+			    comp->funcs->crc_read  &&
+			    comp->funcs->crc_start &&
+			    comp->funcs->crc_stop)
+				mtk_crtc->crc_provider = comp;
 		}

 		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
@@ -1136,3 +1233,186 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,

 	return 0;
 }
+
+void mtk_crtc_init_crc(struct mtk_crtc_crc *crc, const u32 *crc_offset_table,
+		       size_t crc_count, u32 reset_offset, u32 reset_mask)
+{
+	crc->ofs = crc_offset_table;
+	crc->cnt = crc_count;
+	crc->rst_ofs = reset_offset;
+	crc->rst_msk = reset_mask;
+	crc->va = kcalloc(crc->cnt, sizeof(*crc->va), GFP_KERNEL);
+	if (!crc->va) {
+		DRM_ERROR("failed to allocate memory for crc\n");
+		crc->cnt = 0;
+	}
+}
+
+void mtk_crtc_read_crc(struct mtk_crtc_crc *crc, void __iomem *reg)
+{
+	if (!crc->cnt || !crc->ofs || !crc->va)
+		return;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* sync to see the most up-to-date copy of the DMA buffer */
+	dma_sync_single_for_cpu(crc->cmdq_client.chan->mbox->dev,
+				crc->pa, crc->cnt * sizeof(*crc->va),
+				DMA_FROM_DEVICE);
+#endif
+}
+
+void mtk_crtc_destroy_crc(struct mtk_crtc_crc *crc)
+{
+	if (!crc->cnt)
+		return;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (crc->pa) {
+		dma_unmap_single(crc->cmdq_client.chan->mbox->dev,
+				 crc->pa, crc->cnt * sizeof(*crc->va),
+				 DMA_TO_DEVICE);
+		crc->pa = 0;
+	}
+	if (crc->cmdq_client.chan) {
+		mtk_drm_cmdq_pkt_destroy(&crc->cmdq_handle);
+		mbox_free_channel(crc->cmdq_client.chan);
+		crc->cmdq_client.chan = NULL;
+	}
+#endif
+	kfree(crc->va);
+	crc->va = NULL;
+	crc->cnt = 0;
+}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+/**
+ * mtk_crtc_create_crc_cmdq - Create a CMDQ thread for syncing the CRCs
+ * @dev: Kernel device node of the CRC provider
+ * @crc: Pointer of the CRC to init
+ *
+ * This function will create a looping thread on GCE (Global Command Engine) to
+ * keep the CRC up to date by monitoring the assigned event (usually the frame
+ * done event) of the CRC provider, and read the CRCs from the registers to a
+ * shared memory for the workqueue to read. To start/stop the looping thread,
+ * please call `mtk_crtc_start_crc_cmdq()` and `mtk_crtc_stop_crc_cmdq()`
+ * defined blow.
+ *
+ * The reason why we don't update the CRCs with CPU is that the front porch of
+ * 4K60 timing in CEA-861 is less than 60us, and register read/write speed is
+ * relatively unreliable comparing to GCE due to the bus design.
+ *
+ * We must create a new thread instead of using the original one for plane
+ * update is because:
+ * 1. We cannot add another wait-for-event command at the end of cmdq packet, or
+ *    the cmdq callback will delay for too long
+ * 2. Will get the CRC of the previous frame if using the existed wait-for-event
+ *    command which is at the beginning of the packet
+ */
+void mtk_crtc_create_crc_cmdq(struct device *dev, struct mtk_crtc_crc *crc)
+{
+	int i;
+
+	if (!crc->cnt) {
+		dev_warn(dev, "%s: not support\n", __func__);
+		goto cleanup;
+	}
+
+	if (!crc->ofs) {
+		dev_warn(dev, "%s: not defined\n", __func__);
+		goto cleanup;
+	}
+
+	crc->cmdq_client.client.dev = dev;
+	crc->cmdq_client.client.tx_block = false;
+	crc->cmdq_client.client.knows_txdone = true;
+	crc->cmdq_client.client.rx_callback = NULL;
+	crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
+	if (IS_ERR(crc->cmdq_client.chan)) {
+		dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
+		crc->cmdq_client.chan = NULL;
+		goto cleanup;
+	}
+
+	if (mtk_drm_cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
+		dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
+		goto cleanup;
+	}
+
+	if (!crc->va) {
+		dev_warn(dev, "%s: no memory\n", __func__);
+		goto cleanup;
+	}
+
+	/* map the entry to get a dma address for cmdq to store the crc */
+	crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
+				 crc->va, crc->cnt * sizeof(*crc->va),
+				 DMA_FROM_DEVICE);
+
+	if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
+		dev_err(dev, "%s: failed to map dma\n", __func__);
+		goto cleanup;
+	}
+
+	if (crc->cmdq_event)
+		cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
+
+	for (i = 0; i < crc->cnt; i++) {
+		/* put crc to spr1 register */
+		cmdq_pkt_read_s(&crc->cmdq_handle, crc->cmdq_reg->subsys,
+				crc->cmdq_reg->offset + crc->ofs[i],
+				CMDQ_THR_SPR_IDX1);
+
+		/* copy spr1 register to physical address of the crc */
+		cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
+				CMDQ_ADDR_HIGH(crc->pa + i * sizeof(*crc->va)));
+		cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
+				 CMDQ_ADDR_LOW(crc->pa + i * sizeof(*crc->va)),
+				 CMDQ_THR_SPR_IDX1);
+	}
+	/* reset crc */
+	mtk_ddp_write_mask(&crc->cmdq_handle, ~0, crc->cmdq_reg, 0,
+			   crc->rst_ofs, crc->rst_msk);
+
+	/* clear reset bit */
+	mtk_ddp_write_mask(&crc->cmdq_handle, 0, crc->cmdq_reg, 0,
+			   crc->rst_ofs, crc->rst_msk);
+
+	/* jump to head of the cmdq packet */
+	cmdq_pkt_jump_abs(&crc->cmdq_handle, crc->cmdq_handle.pa_base,
+			  cmdq_get_shift_pa(crc->cmdq_client.chan));
+
+	return;
+cleanup:
+	mtk_crtc_destroy_crc(crc);
+}
+
+/**
+ * mtk_crtc_start_crc_cmdq - Start the GCE looping thread for CRC update
+ * @crc: Pointer of the CRC information
+ */
+void mtk_crtc_start_crc_cmdq(struct mtk_crtc_crc *crc)
+{
+	if (!crc->cmdq_client.chan)
+		return;
+
+	dma_sync_single_for_device(crc->cmdq_client.chan->mbox->dev,
+				   crc->cmdq_handle.pa_base,
+				   crc->cmdq_handle.cmd_buf_size,
+				   DMA_TO_DEVICE);
+	mbox_send_message(crc->cmdq_client.chan, &crc->cmdq_handle);
+	mbox_client_txdone(crc->cmdq_client.chan, 0);
+}
+
+/**
+ * mtk_crtc_stop_crc_cmdq - Stop the GCE looping thread for CRC update
+ * @crc: Pointer of the CRC information
+ */
+void mtk_crtc_stop_crc_cmdq(struct mtk_crtc_crc *crc)
+{
+	if (!crc->cmdq_client.chan)
+		return;
+
+	/* remove all the commands from the cmdq packet */
+	mbox_flush(crc->cmdq_client.chan, 2000);
+}
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 388e900b6f4d..a79c4611754e 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -14,6 +14,34 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3

+/**
+ * struct mtk_crtc_crc - crc related information
+ * @ofs: register offset of crc
+ * @rst_ofs: register offset of crc reset
+ * @rst_msk: register mask of crc reset
+ * @cnt: count of crc
+ * @va: pointer to the start of crc array
+ * @pa: physical address of the crc for gce to access
+ * @cmdq_event: the event to trigger the cmdq
+ * @cmdq_reg: address of the register that cmdq is going to access
+ * @cmdq_client: handler to control cmdq (mbox channel, thread ...etc.)
+ * @cmdq_handle: cmdq packet to store the commands
+ */
+struct mtk_crtc_crc {
+	const u32 *ofs;
+	u32 rst_ofs;
+	u32 rst_msk;
+	size_t cnt;
+	u32 *va;
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	dma_addr_t pa;
+	u32 cmdq_event;
+	struct cmdq_client_reg *cmdq_reg;
+	struct cmdq_client cmdq_client;
+	struct cmdq_pkt cmdq_handle;
+#endif
+};
+
 void mtk_crtc_commit(struct drm_crtc *crtc);
 int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		    unsigned int path_len, int priv_data_index,
@@ -25,4 +53,14 @@ void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 			   struct drm_atomic_state *plane_state);
 struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc);

+void mtk_crtc_init_crc(struct mtk_crtc_crc *crc, const u32 *crc_offset_table,
+		       size_t crc_count, u32 reset_offset, u32 reset_mask);
+void mtk_crtc_read_crc(struct mtk_crtc_crc *crc, void __iomem *reg);
+void mtk_crtc_destroy_crc(struct mtk_crtc_crc *crc);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+void mtk_crtc_create_crc_cmdq(struct device *dev, struct mtk_crtc_crc *crc);
+void mtk_crtc_start_crc_cmdq(struct mtk_crtc_crc *crc);
+void mtk_crtc_stop_crc_cmdq(struct mtk_crtc_crc *crc);
+#endif
+
 #endif /* MTK_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index f7fe2e08dc8e..b220a672d182 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -88,6 +88,11 @@ struct mtk_ddp_comp_funcs {
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
 	unsigned int (*encoder_index)(struct device *dev);
 	enum drm_mode_status (*mode_valid)(struct device *dev, const struct drm_display_mode *mode);
+	size_t (*crc_cnt)(struct device *dev);
+	u32 *(*crc_entry)(struct device *dev);
+	void (*crc_read)(struct device *dev);
+	void (*crc_start)(struct device *dev);
+	void (*crc_stop)(struct device *dev);
 };

 struct mtk_ddp_comp {
--
2.18.0

