Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772D3CC231
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26786EA37;
	Sat, 17 Jul 2021 09:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171A26EA1D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:04:37 +0000 (UTC)
X-UUID: ee0282ff790146f58e53066eac85f601-20210717
X-UUID: ee0282ff790146f58e53066eac85f601-20210717
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 679594627; Sat, 17 Jul 2021 17:04:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:30 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 07/10] drm/mediatek: add pseudo ovl support for MT8195
Date: Sat, 17 Jul 2021 17:04:05 +0800
Message-ID: <20210717090408.28283-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add pseudo ovl module files:
Pseudo ovl is an encapsulated module and designed for simplified
DRM control flow. This module is composed of 8 RDMAs and 4 MERGEs.
Two RDMAs merge into one layer, so this module support 4
layers. The four layers are blending at the EHTDR module next to it.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile             |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 655 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  50 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 +++
 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++
 10 files changed, 1453 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index fcce08710cef..70b53487ab0c 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -14,7 +14,9 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
-		  mtk_ethdr.o
+		  mtk_ethdr.o \
+		  mtk_disp_pseudo_ovl.o \
+		  mtk_mdp_rdma.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 7227ffbc3eae..f5d35007b84d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -105,6 +105,18 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+int mtk_pseudo_ovl_clk_enable(struct device *dev);
+void mtk_pseudo_ovl_clk_disable(struct device *dev);
+void mtk_pseudo_ovl_config(struct device *dev, unsigned int w,
+			   unsigned int h, unsigned int vrefresh,
+			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_pseudo_ovl_start(struct device *dev);
+void mtk_pseudo_ovl_stop(struct device *dev);
+void mtk_pseudo_ovl_layer_config(struct device *dev, unsigned int idx,
+				 struct mtk_plane_state *state,
+				 struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_pseudo_ovl_layer_nr(struct device *dev);
+
 int mtk_ethdr_clk_enable(struct device *dev);
 void mtk_ethdr_clk_disable(struct device *dev);
 void mtk_ethdr_config(struct device *dev, unsigned int w,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
new file mode 100644
index 000000000000..8ec80e1887e0
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
@@ -0,0 +1,655 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_mdp_rdma.h"
+#include "mtk_ethdr.h"
+
+#define DISP_MERGE_ENABLE	0x0
+	#define MERGE_ENABLE BIT(0)
+#define DISP_MERGE_CFG_0	0x10
+#define DISP_MERGE_CFG_1	0x14
+#define DISP_MERGE_CFG_4	0x20
+#define DISP_MERGE_CFG_5	0x24
+#define DISP_MERGE_CFG_10	0x38
+	#define CFG_10_NO_SWAP 0
+#define DISP_MERGE_CFG_12	0x40
+	#define CFG12_10_10_1PI_2PO_BUF_MODE 6
+	#define CFG12_11_10_1PI_2PO_MERGE 18
+#define DISP_MERGE_CFG_24	0x70
+#define DISP_MERGE_CFG_25	0x74
+#define DISP_MERGE_CFG_26	0x78
+#define DISP_MERGE_CFG_27	0x7c
+#define DISP_MERGE_MUTE_0	0xf00
+
+#define VDO1_CONFIG_SW0_RST_B 0x1d0
+#define VDO1_CONFIG_MERGE0_ASYNC_CFG_WD 0xe30
+#define VDO1_CONFIG_MERGE1_ASYNC_CFG_WD 0xe40
+#define VDO1_CONFIG_MERGE2_ASYNC_CFG_WD 0xe50
+#define VDO1_CONFIG_MERGE3_ASYNC_CFG_WD 0xe60
+
+#define MTK_PSEUDO_OVL_SINGLE_PIPE_MAX_WIDTH 1920
+
+enum mtk_pseudo_ovl_comp_type {
+	PSEUDO_OVL_TYPE_RDMA = 0,
+	PSEUDO_OVL_TYPE_MERGE,
+	PSEUDO_OVL_TYPE_NUM,
+};
+
+enum mtk_pseudo_ovl_comp_id {
+	PSEUDO_OVL_RDMA_BASE = 0,
+	PSEUDO_OVL_MDP_RDMA0 = PSEUDO_OVL_RDMA_BASE,
+	PSEUDO_OVL_MDP_RDMA1,
+	PSEUDO_OVL_MDP_RDMA2,
+	PSEUDO_OVL_MDP_RDMA3,
+	PSEUDO_OVL_MDP_RDMA4,
+	PSEUDO_OVL_MDP_RDMA5,
+	PSEUDO_OVL_MDP_RDMA6,
+	PSEUDO_OVL_MDP_RDMA7,
+	PSEUDO_OVL_MERGE_BASE,
+	PSEUDO_OVL_MERGE0 = PSEUDO_OVL_MERGE_BASE,
+	PSEUDO_OVL_MERGE1,
+	PSEUDO_OVL_MERGE2,
+	PSEUDO_OVL_MERGE3,
+	PSEUDO_OVL_ID_MAX
+};
+
+struct pseudo_ovl_data {
+	unsigned int layer_nr;
+	struct mtk_mdp_rdma_fifo fifo;
+};
+
+struct pseudo_ovl_comp_match {
+	enum mtk_pseudo_ovl_comp_type type;
+	int alias_id;
+};
+
+struct pseudo_ovl_merge_config {
+	unsigned int fmt;
+	unsigned int merge_mode;
+	unsigned int in_w[2];
+	unsigned int out_w[2];
+	unsigned int in_h;
+};
+
+struct mtk_pseudo_ovl_comp {
+	struct device *dev;
+	struct clk *clks[2];
+	struct cmdq_client_reg cmdq_base;
+	void __iomem *regs;
+};
+
+struct mtk_disp_pseudo_ovl {
+	struct mtk_pseudo_ovl_comp pseudo_ovl_comp[PSEUDO_OVL_ID_MAX];
+	struct cmdq_client_reg top_cmdq_base;
+	void __iomem *top_regs;
+	const struct pseudo_ovl_data *data;
+	struct device *next_dev;
+};
+
+static const char * const pseudo_ovl_comp_str[] = {
+	"PSEUDO_OVL_MDP_RDMA0",
+	"PSEUDO_OVL_MDP_RDMA1",
+	"PSEUDO_OVL_MDP_RDMA2",
+	"PSEUDO_OVL_MDP_RDMA3",
+	"PSEUDO_OVL_MDP_RDMA4",
+	"PSEUDO_OVL_MDP_RDMA5",
+	"PSEUDO_OVL_MDP_RDMA6",
+	"PSEUDO_OVL_MDP_RDMA7",
+	"PSEUDO_OVL_MERGE0",
+	"PSEUDO_OVL_MERGE1",
+	"PSEUDO_OVL_MERGE2",
+	"PSEUDO_OVL_MERGE3",
+	"PSEUDO_OVL_ID_MAX"
+};
+
+static const char * const private_comp_stem[PSEUDO_OVL_TYPE_NUM] = {
+	[PSEUDO_OVL_TYPE_RDMA] = "vdo1_rdma",
+	[PSEUDO_OVL_TYPE_MERGE] = "merge",
+};
+
+static const struct pseudo_ovl_comp_match comp_matches[PSEUDO_OVL_ID_MAX] = {
+	[PSEUDO_OVL_MDP_RDMA0] =	{ PSEUDO_OVL_TYPE_RDMA, 0 },
+	[PSEUDO_OVL_MDP_RDMA1] =	{ PSEUDO_OVL_TYPE_RDMA, 1 },
+	[PSEUDO_OVL_MDP_RDMA2] =	{ PSEUDO_OVL_TYPE_RDMA, 2 },
+	[PSEUDO_OVL_MDP_RDMA3] =	{ PSEUDO_OVL_TYPE_RDMA, 3 },
+	[PSEUDO_OVL_MDP_RDMA4] =	{ PSEUDO_OVL_TYPE_RDMA, 4 },
+	[PSEUDO_OVL_MDP_RDMA5] =	{ PSEUDO_OVL_TYPE_RDMA, 5 },
+	[PSEUDO_OVL_MDP_RDMA6] =	{ PSEUDO_OVL_TYPE_RDMA, 6 },
+	[PSEUDO_OVL_MDP_RDMA7] =	{ PSEUDO_OVL_TYPE_RDMA, 7 },
+	[PSEUDO_OVL_MERGE0] =	{ PSEUDO_OVL_TYPE_MERGE, 1 },
+	[PSEUDO_OVL_MERGE1] =	{ PSEUDO_OVL_TYPE_MERGE, 2 },
+	[PSEUDO_OVL_MERGE2] =	{ PSEUDO_OVL_TYPE_MERGE, 3 },
+	[PSEUDO_OVL_MERGE3] =	{ PSEUDO_OVL_TYPE_MERGE, 4 },
+};
+
+static const unsigned int merge_async_offset[] = {
+	VDO1_CONFIG_MERGE0_ASYNC_CFG_WD,
+	VDO1_CONFIG_MERGE1_ASYNC_CFG_WD,
+	VDO1_CONFIG_MERGE2_ASYNC_CFG_WD,
+	VDO1_CONFIG_MERGE3_ASYNC_CFG_WD,
+};
+
+static const unsigned int merge_async_reset_bit[] = {
+	BIT(25), BIT(26), BIT(27), BIT(28)};
+
+static int mtk_pseudo_ovl_fifo_setting(struct mtk_disp_pseudo_ovl *pseudo_ovl,
+				       struct cmdq_pkt *handle)
+{
+	struct mtk_pseudo_ovl_comp *rdma = NULL;
+	const struct pseudo_ovl_data *data = pseudo_ovl->data;
+	const struct mtk_mdp_rdma_fifo *fifo = &data->fifo;
+	int i;
+
+	for (i = PSEUDO_OVL_MDP_RDMA0; i <= PSEUDO_OVL_MDP_RDMA7; i++) {
+		rdma = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + i];
+		mtk_mdp_rdma_fifo_config(rdma->regs, handle, &rdma->cmdq_base, fifo);
+	}
+
+	return 0;
+}
+
+static void mtk_pseudo_ovl_merge_config(struct mtk_pseudo_ovl_comp *comp,
+					struct pseudo_ovl_merge_config *merge_cfg,
+					struct cmdq_pkt *cmdq_pkt)
+{
+	switch (merge_cfg->merge_mode) {
+	case 6:
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25, ~0);
+		break;
+	case 18:
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_1, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_26, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_27, ~0);
+		break;
+	default:
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_1, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[1]),
+				   &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_5, ~0);
+		break;
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt, merge_cfg->merge_mode, &comp->cmdq_base,
+			   comp->regs, DISP_MERGE_CFG_12, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, CFG_10_NO_SWAP, &comp->cmdq_base,
+			   comp->regs, DISP_MERGE_CFG_10, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 1, &comp->cmdq_base, comp->regs,
+			   DISP_MERGE_ENABLE, ~0);
+}
+
+unsigned int mtk_pseudo_ovl_layer_nr(struct device *dev)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+
+	return pseudo_ovl->data->layer_nr;
+}
+
+void mtk_pseudo_ovl_layer_config(struct device *dev, unsigned int idx,
+				 struct mtk_plane_state *state,
+				 struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	struct pseudo_ovl_merge_config merge_cfg = {0};
+	struct mtk_mdp_rdma_cfg rdma_config = {0};
+	struct mtk_pseudo_ovl_comp *rdma_l;
+	struct mtk_pseudo_ovl_comp *rdma_r;
+	struct mtk_pseudo_ovl_comp *merge;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	bool use_dual_pipe = false;
+
+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
+		pending->enable, pending->format);
+	dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
+		pending->addr, (pending->pitch / fmt_info->cpp[0]),
+		pending->x, pending->y, pending->width, pending->height);
+
+	rdma_l = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 * idx];
+	rdma_r = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 * idx + 1];
+	merge = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_MERGE_BASE + idx];
+
+	if (!pending->enable) {
+		mtk_ethdr_layer_off(pseudo_ovl->next_dev, idx, cmdq_pkt);
+		mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+				   DISP_MERGE_ENABLE, 0x1);
+		mtk_mdp_rdma_stop(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+		return;
+	}
+
+	if (pending->width > MTK_PSEUDO_OVL_SINGLE_PIPE_MAX_WIDTH)
+		use_dual_pipe = true;
+
+	merge_cfg.out_w[0] = pending->width;
+	merge_cfg.in_h = pending->height;
+	merge_cfg.fmt = pending->format;
+	if (use_dual_pipe) {
+		merge_cfg.merge_mode = CFG12_11_10_1PI_2PO_MERGE;
+		merge_cfg.in_w[0] = (pending->width / 2) + ((pending->width / 2) % 2);
+		merge_cfg.in_w[1] = (pending->width / 2) - ((pending->width / 2) % 2);
+	} else {
+		merge_cfg.merge_mode = CFG12_10_10_1PI_2PO_BUF_MODE;
+		merge_cfg.in_w[0] = pending->width;
+	}
+
+	mtk_pseudo_ovl_merge_config(merge, &merge_cfg, cmdq_pkt);
+	mtk_ddp_write_mask(cmdq_pkt, (pending->height << 16 | (pending->width / 2)),
+			   &pseudo_ovl->top_cmdq_base, pseudo_ovl->top_regs,
+			   merge_async_offset[idx], ~0);
+
+	rdma_config.source_width = pending->pitch / fmt_info->cpp[0];
+	rdma_config.csc_enable = fmt_info->is_yuv ? true : false;
+	rdma_config.profile = RDMA_CSC_FULL709_TO_RGB;
+	rdma_config.encode_type = RDMA_ENCODE_NONE;
+	rdma_config.block_size = RDMA_BLOCK_NONE;
+	rdma_config.width = merge_cfg.in_w[0];
+	rdma_config.height = pending->height;
+	rdma_config.addr0 = pending->addr;
+	rdma_config.fmt = pending->format;
+	mtk_mdp_rdma_config(rdma_l->regs, &rdma_config, cmdq_pkt, &rdma_l->cmdq_base);
+
+	rdma_config.x_left = merge_cfg.in_w[0];
+	rdma_config.width = merge_cfg.in_w[1];
+	mtk_mdp_rdma_config(rdma_r->regs, &rdma_config, cmdq_pkt, &rdma_r->cmdq_base);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0x1, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_ENABLE, 0x1);
+	mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_MUTE_0, 0x1);
+
+	mtk_mdp_rdma_start(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+	if (use_dual_pipe)
+		mtk_mdp_rdma_start(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+	else
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+
+	mtk_ethdr_layer_config(pseudo_ovl->next_dev, idx, state, cmdq_pkt);
+	mtk_ethdr_layer_on(pseudo_ovl->next_dev, idx, cmdq_pkt);
+}
+
+void mtk_pseudo_ovl_config(struct device *dev, unsigned int w, unsigned int h,
+			   unsigned int vrefresh, unsigned int bpc,
+			   struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+
+	dev_info(dev, "%s w:%d, h:%d\n", __func__, w, h);
+	mtk_pseudo_ovl_fifo_setting(pseudo_ovl, cmdq_pkt);
+}
+
+void mtk_pseudo_ovl_start(struct device *dev)
+{
+}
+
+void mtk_pseudo_ovl_stop(struct device *dev)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+	struct mtk_pseudo_ovl_comp *rdma_l;
+	struct mtk_pseudo_ovl_comp *rdma_r;
+	struct mtk_pseudo_ovl_comp *merge;
+	unsigned int reg;
+	u32 i;
+
+	for (i = 0; i < pseudo_ovl->data->layer_nr; i++) {
+		rdma_l = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 * i];
+		rdma_r = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 * i + 1];
+		merge = &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_MERGE_BASE + i];
+
+		mtk_mdp_rdma_stop(rdma_l->regs, NULL, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, NULL, &rdma_r->cmdq_base);
+
+		reg = readl(merge->regs + DISP_MERGE_ENABLE);
+		reg = reg & ~MERGE_ENABLE;
+		writel_relaxed(reg, merge->regs + DISP_MERGE_ENABLE);
+
+		mtk_ddp_write_mask(NULL, 0, &pseudo_ovl->top_cmdq_base,
+				   pseudo_ovl->top_regs, VDO1_CONFIG_SW0_RST_B,
+				   merge_async_reset_bit[i]);
+		mtk_ddp_write_mask(NULL, merge_async_reset_bit[i],
+				   &pseudo_ovl->top_cmdq_base,
+				   pseudo_ovl->top_regs, VDO1_CONFIG_SW0_RST_B,
+				   merge_async_reset_bit[i]);
+	}
+}
+
+int mtk_pseudo_ovl_clk_enable(struct device *dev)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+	struct mtk_pseudo_ovl_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_ID_MAX; i++) {
+		comp = &pseudo_ovl->pseudo_ovl_comp[i];
+		if (!comp->dev)
+			continue;
+
+		/* Need to power on for private rdma devices */
+		if (i < PSEUDO_OVL_MERGE_BASE) {
+			ret = pm_runtime_get_sync(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power on, err %d-%s\n",
+					ret, pseudo_ovl_comp_str[i]);
+		}
+
+		for (j = 0; j < ARRAY_SIZE(comp->clks); j++) {
+			if (IS_ERR(comp->clks[j]))
+				break;
+
+			ret = clk_prepare_enable(comp->clks[j]);
+			if (ret)
+				dev_err(dev,
+					"Failed to enable clock %d, err %d-%s\n",
+					i, ret, pseudo_ovl_comp_str[i]);
+		}
+	}
+
+	return ret;
+}
+
+void mtk_pseudo_ovl_clk_disable(struct device *dev)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+	struct mtk_pseudo_ovl_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_ID_MAX; i++) {
+		comp = &pseudo_ovl->pseudo_ovl_comp[i];
+		if (!comp->dev)
+			continue;
+
+		for (j = 0; i < ARRAY_SIZE(comp->clks); j++) {
+			if (IS_ERR(comp->clks[j]))
+				break;
+			clk_disable_unprepare(comp->clks[j]);
+		}
+
+		/* Need to power off for private rdma devices */
+		if (i < PSEUDO_OVL_MERGE_BASE) {
+			ret = pm_runtime_put(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power off, err-%s\n",
+					ret, pseudo_ovl_comp_str[i]);
+		}
+	}
+}
+
+static int mtk_disp_pseudo_ovl_bind(struct device *dev, struct device *master,
+				    void *data)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *drm_private = drm_dev->dev_private;
+	struct device *mmsys_dev = drm_private->mmsys_dev;
+
+	pseudo_ovl->next_dev = mtk_drm_find_next_comp(drm_dev, dev);
+
+	pseudo_ovl->top_regs = of_iomap(mmsys_dev->of_node, 0);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_dev_get_client_reg(mmsys_dev, &pseudo_ovl->top_cmdq_base, 0))
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	return 0;
+}
+
+static void mtk_disp_pseudo_ovl_unbind(struct device *dev, struct device *master,
+				       void *data)
+{
+}
+
+static const struct component_ops mtk_disp_pseudo_ovl_component_ops = {
+	.bind	= mtk_disp_pseudo_ovl_bind,
+	.unbind = mtk_disp_pseudo_ovl_unbind,
+};
+
+static int pseudo_ovl_comp_get_id(struct device *dev, struct device_node *node,
+				  enum mtk_pseudo_ovl_comp_type type)
+{
+	int alias_id = of_alias_get_id(node, private_comp_stem[type]);
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(comp_matches); i++)
+		if (comp_matches[i].type == type &&
+		    comp_matches[i].alias_id == alias_id)
+			return i;
+
+	dev_err(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
+	return -EINVAL;
+}
+
+static int private_comp_init(struct device *dev, struct device_node *node,
+			     struct mtk_pseudo_ovl_comp *comp,
+			     enum mtk_pseudo_ovl_comp_id id)
+{
+	struct platform_device *comp_pdev;
+	int ret;
+	int i;
+
+	if (id < 0 || id >= PSEUDO_OVL_ID_MAX) {
+		dev_err(dev, "Invalid component id %d\n", id);
+		return -EINVAL;
+	}
+
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		dev_warn(dev, "can't find platform device of node:%s\n",
+			 node->name);
+		return -ENODEV;
+	}
+	comp->dev = &comp_pdev->dev;
+	comp->regs = of_iomap(node, 0);
+
+	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
+		comp->clks[i] = of_clk_get(node, i);
+		if (IS_ERR(comp->clks[i]))
+			break;
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_base, 0);
+	if (ret)
+		dev_info(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	if (id < PSEUDO_OVL_MERGE_BASE)
+		pm_runtime_enable(comp->dev);
+
+	dev_info(dev, "[DRM]regs:0x%p, node:%s\n", comp->regs, pseudo_ovl_comp_str[id]);
+
+	return 0;
+}
+
+static int mtk_disp_pseudo_ovl_comp_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int mtk_disp_pseudo_ovl_comp_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id mtk_pseudo_ovl_comp_dt_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-vdo1-rdma",
+		.data = (void *)PSEUDO_OVL_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-vdo1-merge",
+		.data = (void *)PSEUDO_OVL_TYPE_MERGE,
+	},
+	{},
+};
+
+static struct platform_driver mtk_disp_pseudo_ovl_comp_driver = {
+	.probe		= mtk_disp_pseudo_ovl_comp_probe,
+	.remove		= mtk_disp_pseudo_ovl_comp_remove,
+	.driver = {
+		.name	= "mediatek-disp-pseudo-ovl-comp",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_pseudo_ovl_comp_dt_ids,
+	},
+};
+module_platform_driver(mtk_disp_pseudo_ovl_comp_driver);
+
+static int pseudo_ovl_comp_init(struct device *dev)
+{
+	struct mtk_disp_pseudo_ovl *priv = dev_get_drvdata(dev);
+	struct device_node *node, *parent;
+	int i, ret;
+
+	parent = dev->of_node->parent;
+
+	for_each_child_of_node(parent, node) {
+		const struct of_device_id *of_id;
+		enum mtk_pseudo_ovl_comp_type type;
+		struct mtk_pseudo_ovl_comp *comp;
+		int id;
+
+		of_id = of_match_node(mtk_pseudo_ovl_comp_dt_ids, node);
+		if (!of_id)
+			continue;
+
+		if (!of_device_is_available(node)) {
+			dev_info(dev, "Skipping disabled component %pOF\n",
+				 node);
+			continue;
+		}
+
+		type = (enum mtk_pseudo_ovl_comp_type)of_id->data;
+		id = pseudo_ovl_comp_get_id(dev, node, type);
+		if (id < 0) {
+			dev_warn(dev, "Skipping unknown component %pOF\n",
+				 node);
+			continue;
+		}
+
+		ret = private_comp_init(dev, node, &priv->pseudo_ovl_comp[id], id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_disp_pseudo_ovl_probe(struct platform_device *pdev)
+{
+	struct mtk_disp_pseudo_ovl *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->data = of_device_get_match_data(dev);
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = pseudo_ovl_comp_init(dev);
+	if (ret) {
+		dev_notice(dev, "pseudo_ovl comp init fail\n");
+		return ret;
+	}
+
+	ret = component_add(dev, &mtk_disp_pseudo_ovl_component_ops);
+	if (ret != 0) {
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+		for (i = PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_MERGE_BASE; i++)
+			pm_runtime_disable(priv->pseudo_ovl_comp[i].dev);
+	}
+	dev_info(dev, "%s-\n", __func__);
+	return ret;
+}
+
+static int mtk_disp_pseudo_ovl_remove(struct platform_device *pdev)
+{
+	struct mtk_disp_pseudo_ovl *pseudo_ovl = dev_get_drvdata(&pdev->dev);
+	int i;
+
+	component_del(&pdev->dev, &mtk_disp_pseudo_ovl_component_ops);
+
+	for (i = PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_MERGE_BASE; i++)
+		pm_runtime_disable(pseudo_ovl->pseudo_ovl_comp[i].dev);
+
+	return 0;
+}
+
+static const struct pseudo_ovl_data mt8195_pseudo_ovl_driver_data = {
+	.layer_nr = 4,
+	.fifo.read_request_type = 7,
+	.fifo.command_div = 1,
+	.fifo.ext_preutra_en = 1,
+	.fifo.ultra_en = 0,
+	.fifo.pre_ultra_en = 1,
+	.fifo.ext_ultra_en = 1,
+	.fifo.extrd_arb_max_0 = 3,
+	.fifo.buf_resv_size_0 = 0,
+	.fifo.issue_req_th_0 = 0,
+	.fifo.ultra_h_con_0 = 156,
+	.fifo.ultra_l_con_0 = 104,
+};
+
+static const struct of_device_id mtk_disp_pseudo_ovl_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-pseudo-ovl",
+	  .data = &mt8195_pseudo_ovl_driver_data},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_pseudo_ovl_driver_dt_match);
+
+struct platform_driver mtk_disp_pseudo_ovl_driver = {
+	.probe = mtk_disp_pseudo_ovl_probe,
+	.remove = mtk_disp_pseudo_ovl_remove,
+	.driver = {
+			.name = "mediatek-disp-pseudo-ovl",
+			.owner = THIS_MODULE,
+			.of_match_table = mtk_disp_pseudo_ovl_driver_dt_match,
+		},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 3fa86f12feb4..64cbb9e1cc83 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -355,6 +355,16 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.start = mtk_ufoe_start,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_pseudo_ovl = {
+	.clk_enable = mtk_pseudo_ovl_clk_enable,
+	.clk_disable = mtk_pseudo_ovl_clk_disable,
+	.config = mtk_pseudo_ovl_config,
+	.start = mtk_pseudo_ovl_start,
+	.stop = mtk_pseudo_ovl_stop,
+	.layer_nr = mtk_pseudo_ovl_layer_nr,
+	.layer_config = mtk_pseudo_ovl_layer_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_ethdr = {
 	.clk_enable = mtk_ethdr_clk_enable,
 	.clk_disable = mtk_ethdr_clk_disable,
@@ -377,6 +387,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_UFOE] = "ufoe",
 	[MTK_DSI] = "dsi",
 	[MTK_DPI] = "dpi",
+	[MTK_DISP_PSEUDO_OVL] = "pseudo_ovl",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
@@ -422,6 +433,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_PSEUDO_OVL] = { MTK_DISP_PSEUDO_OVL,	0, &ddp_pseudo_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
@@ -510,6 +522,43 @@ static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *c
 	return 0;
 }
 
+struct device *mtk_drm_find_next_comp(struct drm_device *drm, struct device *dev)
+{
+	struct mtk_drm_private *private = drm->dev_private;
+	const enum mtk_ddp_comp_id *path;
+	unsigned int path_len = 0;
+	int i;
+
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
+				     private->data->main_len,
+				     private->ddp_comp)) {
+		path_len = private->data->main_len;
+		path = private->data->main_path;
+	} else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
+					    private->data->ext_len,
+					    private->ddp_comp)) {
+		path_len = private->data->ext_len;
+		path = private->data->ext_path;
+	} else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
+					    private->data->third_len,
+					    private->ddp_comp)) {
+		path_len = private->data->third_len;
+		path = private->data->third_path;
+	}
+
+	if (!path_len)
+		return NULL;
+
+	for (i = 0U; i < path_len; i++)
+		if (dev == private->ddp_comp[path[i]].dev)
+			break;
+
+	if (i < (path_len - 1))
+		return private->ddp_comp[path[i + 1]].dev;
+	else
+		return NULL;
+}
+
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id)
 {
@@ -551,6 +600,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_PSEUDO_OVL ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index f55efba6e744..ec84dc258124 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -37,6 +37,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_DSC,
 	MTK_DISP_MERGE,
 	MTK_DISP_ETHDR,
+	MTK_DISP_PSEUDO_OVL,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
@@ -192,6 +193,8 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev);
+struct device *mtk_drm_find_next_comp(struct drm_device *drm,
+				      struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ace958a34bb5..ddc26160dea1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8195-disp-pseudo-ovl",
+	  .data = (void *)MTK_DISP_PSEUDO_OVL },
 	{ .compatible = "mediatek,mt8195-disp-ethdr",
 	  .data = (void *)MTK_DISP_ETHDR },
 	{ }
@@ -574,6 +576,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_PSEUDO_OVL ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DPI ||
 		    comp_type == MTK_DSI) {
@@ -679,6 +682,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
+	&mtk_disp_pseudo_ovl_driver,
 	&mtk_ethdr_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c87ebb5309d0..fc03cfda7601 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -55,6 +55,7 @@ extern struct platform_driver mtk_disp_dsc_driver;
 extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_disp_pseudo_ovl_driver;
 extern struct platform_driver mtk_ethdr_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
new file mode 100644
index 000000000000..81d3cc4872eb
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -0,0 +1,456 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include "mtk_drm_drv.h"
+#include "mtk_mdp_reg_rdma.h"
+#include "mtk_mdp_rdma.h"
+
+#define RDMA_INPUT_SWAP		BIT(14)
+#define RDMA_INPUT_10BIT	BIT(18)
+#define IRQ_INT_EN_ALL	\
+	(REG_FLD_MASK(FLD_UNDERRUN_INT_EN) |\
+	 REG_FLD_MASK(FLD_REG_UPDATE_INT_EN) |\
+	 REG_FLD_MASK(FLD_FRAME_COMPLETE_INT_EN))
+
+static unsigned int rdma_get_y_pitch(unsigned int fmt, unsigned int width)
+{
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		return 2 * width;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_BGR888:
+		return 3 * width;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return 4 * width;
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_YUYV:
+		return 2 * width;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 1 * width;
+	}
+}
+
+static unsigned int rdma_get_uv_pitch(unsigned int fmt, unsigned int width)
+{
+	switch (fmt) {
+	default:
+		return 0;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 4 * width;
+	}
+}
+
+static unsigned int rdma_get_block_h(unsigned int mode)
+{
+	switch (mode) {
+	default:
+		return 0;
+	case RDMA_BLOCK_8x8:
+	case RDMA_BLOCK_16x8:
+	case RDMA_BLOCK_32x8:
+		return 8;
+	case RDMA_BLOCK_8x16:
+	case RDMA_BLOCK_16x16:
+	case RDMA_BLOCK_32x16:
+		return 16;
+	case RDMA_BLOCK_8x32:
+	case RDMA_BLOCK_16x32:
+	case RDMA_BLOCK_32x32:
+		return 32;
+	}
+}
+
+static unsigned int rdma_get_horizontal_shift_uv(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+		return 0;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 1;
+	}
+}
+
+static unsigned int rdma_get_vertical_shift_uv(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+		return 0;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 1;
+	}
+}
+
+static unsigned int rdma_get_bits_per_pixel_y(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		return 16;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_BGR888:
+		return 24;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return 32;
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_YUYV:
+		return 16;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 8;
+	}
+}
+
+static unsigned int rdma_get_bits_per_pixel_uv(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+		return 0;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return 16;
+	}
+}
+
+static bool with_alpha(uint32_t format)
+{
+	const struct drm_format_info *fmt_info = drm_format_info(format);
+
+	return fmt_info->has_alpha;
+}
+
+static unsigned int rdma_fmt_convert(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+		return RDMA_INPUT_FORMAT_RGB565;
+	case DRM_FORMAT_BGR565:
+		return RDMA_INPUT_FORMAT_RGB565 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_RGB888:
+		return RDMA_INPUT_FORMAT_RGB888;
+	case DRM_FORMAT_BGR888:
+		return RDMA_INPUT_FORMAT_RGB888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+		return RDMA_INPUT_FORMAT_ARGB8888;
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		return RDMA_INPUT_FORMAT_RGBA8888;
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_ABGR2101010:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP |
+				RDMA_INPUT_10BIT;
+	case DRM_FORMAT_ARGB2101010:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_10BIT;
+	case DRM_FORMAT_RGBA1010102:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP |
+				RDMA_INPUT_10BIT;
+	case DRM_FORMAT_BGRA1010102:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_10BIT;
+	case DRM_FORMAT_UYVY:
+		return RDMA_INPUT_FORMAT_UYVY;
+	case DRM_FORMAT_YUYV:
+		return RDMA_INPUT_FORMAT_YUY2;
+	}
+}
+
+void mtk_mdp_rdma_start(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+			struct cmdq_client_reg *cmdq_base)
+{
+	unsigned int inten = IRQ_INT_EN_ALL;
+
+	mtk_ddp_write_mask(cmdq_pkt, inten, cmdq_base, base,
+			   MDP_RDMA_INTERRUPT_ENABLE, IRQ_INT_EN_ALL);
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 1), cmdq_base,
+			   base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE));
+}
+
+void mtk_mdp_rdma_stop(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+		       struct cmdq_client_reg *cmdq_base)
+{
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 0), cmdq_base,
+			   base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE));
+	mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base,
+			   MDP_RDMA_INTERRUPT_ENABLE, IRQ_INT_EN_ALL);
+	mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base,
+			   MDP_RDMA_INTERRUPT_STATUS, IRQ_INT_EN_ALL);
+	mtk_ddp_write_mask(cmdq_pkt, 1, cmdq_base, base, MDP_RDMA_RESET, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base, MDP_RDMA_RESET, ~0);
+}
+
+void mtk_mdp_rdma_fifo_config(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+			      struct cmdq_client_reg *cmdq_base,
+			      const struct mtk_mdp_rdma_fifo *fifo)
+{
+	int reg;
+	int reg_val;
+	int reg_mask;
+
+	reg = MDP_RDMA_GMCIF_CON;
+	reg_val = REG_FLD_VAL(FLD_RD_REQ_TYPE, fifo->read_request_type) |
+		  REG_FLD_VAL(FLD_COMMAND_DIV, fifo->command_div) |
+		  REG_FLD_VAL(FLD_EXT_PREULTRA_EN, fifo->ext_preutra_en) |
+		  REG_FLD_VAL(FLD_ULTRA_EN, fifo->ultra_en) |
+		  REG_FLD_VAL(PRE_ULTRA_EN, fifo->pre_ultra_en) |
+		  REG_FLD_VAL(FLD_EXT_ULTRA_EN, fifo->ext_ultra_en);
+	reg_mask = REG_FLD_MASK(FLD_RD_REQ_TYPE) |
+		   REG_FLD_MASK(FLD_COMMAND_DIV) |
+		   REG_FLD_MASK(FLD_EXT_PREULTRA_EN) |
+		   REG_FLD_MASK(FLD_ULTRA_EN) |
+		   REG_FLD_MASK(PRE_ULTRA_EN) |
+		   REG_FLD_MASK(FLD_EXT_ULTRA_EN);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_DMA_CON_0;
+	reg_val = REG_FLD_VAL(FLD_EXTRD_ARB_MAX, fifo->extrd_arb_max_0) |
+		  REG_FLD_VAL(FLD_BUF_RESV_SIZE, fifo->buf_resv_size_0) |
+		  REG_FLD_VAL(FLD_ISSUE_REQ_TH, fifo->issue_req_th_0);
+	reg_mask = REG_FLD_MASK(FLD_EXTRD_ARB_MAX) |
+		   REG_FLD_MASK(FLD_BUF_RESV_SIZE) |
+		   REG_FLD_MASK(FLD_ISSUE_REQ_TH);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_H_CON_0;
+	reg_val = REG_FLD_VAL(FLD_PREUTRA_H_OFS_0, fifo->ultra_h_con_0);
+	reg_mask = REG_FLD_MASK(FLD_PREUTRA_H_OFS_0);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_L_CON_0;
+	reg_val = REG_FLD_VAL(FLD_PREUTRA_L_OFS_0, fifo->ultra_l_con_0);
+	reg_mask = REG_FLD_MASK(FLD_PREUTRA_L_OFS_0);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_DMABUF_CON_1;
+	reg_val = REG_FLD_VAL(FLD_EXTRD_ARB_MAX_1, 0) |
+		  REG_FLD_VAL(FLD_BUF_RESV_SIZE_1, 0) |
+		  REG_FLD_VAL(FLD_ISSUE_REQ_TH_1, 0);
+	reg_mask = REG_FLD_MASK(FLD_EXTRD_ARB_MAX_1) |
+		   REG_FLD_MASK(FLD_BUF_RESV_SIZE_1) |
+		   REG_FLD_MASK(FLD_ISSUE_REQ_TH_1);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_ULTRA_TH_HIGH_CON_1;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_1, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_1);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_ULTRA_TH_LOW_CON_1;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_1, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_1);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_DMABUF_CON_2;
+	reg_val = REG_FLD_VAL(FLD_EXTRD_ARB_MAX_2, 0) |
+		  REG_FLD_VAL(FLD_BUF_RESV_SIZE_2, 0) |
+		  REG_FLD_VAL(FLD_ISSUE_REQ_TH_2, 0);
+	reg_mask = REG_FLD_MASK(FLD_EXTRD_ARB_MAX_2) |
+		   REG_FLD_MASK(FLD_BUF_RESV_SIZE_2) |
+		   REG_FLD_MASK(FLD_ISSUE_REQ_TH_2);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_H_CON_2;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_2, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_2);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_ULTRA_TH_LOW_CON_2;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_2, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_2);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_DMABUF_CON_3;
+	reg_val = REG_FLD_VAL(FLD_EXTRD_ARB_MAX_3, 0) |
+		  REG_FLD_VAL(FLD_BUF_RESV_SIZE_3, 0) |
+		  REG_FLD_VAL(FLD_ISSUE_REQ_TH_3, 0);
+	reg_mask = REG_FLD_MASK(FLD_EXTRD_ARB_MAX_3) |
+		   REG_FLD_MASK(FLD_BUF_RESV_SIZE_3) |
+		   REG_FLD_MASK(FLD_ISSUE_REQ_TH_3);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_H_CON_3;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_3, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_3);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_ULTRA_TH_LOW_CON_3;
+	reg_val = REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_3, 0);
+	reg_mask = REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_3);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+}
+
+void mtk_mdp_rdma_config(void __iomem *base, struct mtk_mdp_rdma_cfg *cfg,
+			 struct cmdq_pkt *cmdq_pkt,
+			 struct cmdq_client_reg *cmdq_base)
+{
+	unsigned int src_pitch_uv = rdma_get_uv_pitch(cfg->fmt, cfg->source_width);
+	unsigned int src_pitch_y = rdma_get_y_pitch(cfg->fmt, cfg->source_width);
+	unsigned int h_shift_uv = rdma_get_horizontal_shift_uv(cfg->fmt);
+	unsigned int v_shift_uv = rdma_get_vertical_shift_uv(cfg->fmt);
+	unsigned int bpp_uv = rdma_get_bits_per_pixel_uv(cfg->fmt);
+	unsigned int block_h = rdma_get_block_h(cfg->block_size);
+	unsigned int bpp_y = rdma_get_bits_per_pixel_y(cfg->fmt);
+	unsigned int y_start_line = 0;
+	unsigned int offset_y = 0;
+	unsigned int offset_u = 0;
+	unsigned int offset_v = 0;
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UNIFORM_CONFIG, 1),
+			   cmdq_base, base, MDP_RDMA_SRC_CON,
+			   REG_FLD_MASK(FLD_UNIFORM_CONFIG));
+	mtk_ddp_write_mask(cmdq_pkt, rdma_fmt_convert(cfg->fmt), cmdq_base,
+			   base, MDP_RDMA_SRC_CON, REG_FLD_MASK(FLD_SWAP) |
+			   REG_FLD_MASK(FLD_SRC_FORMAT) |
+			   REG_FLD_MASK(FLD_BIT_NUMBER));
+
+	if (!cfg->csc_enable && with_alpha(cfg->fmt))
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB, 1),
+				   cmdq_base, base, MDP_RDMA_SRC_CON,
+				   REG_FLD_MASK(FLD_OUTPUT_ARGB));
+	else
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB, 0),
+				   cmdq_base, base, MDP_RDMA_SRC_CON,
+				   REG_FLD_MASK(FLD_OUTPUT_ARGB));
+
+	mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, cmdq_base, base,
+			   MDP_RDMA_SRC_BASE_0, REG_FLD_MASK(FLD_SRC_BASE_0));
+	mtk_ddp_write_mask(cmdq_pkt, cfg->addr1, cmdq_base, base,
+			   MDP_RDMA_SRC_BASE_1, REG_FLD_MASK(FLD_SRC_BASE_1));
+	mtk_ddp_write_mask(cmdq_pkt, cfg->addr2, cmdq_base, base,
+			   MDP_RDMA_SRC_BASE_2, REG_FLD_MASK(FLD_SRC_BASE_2));
+
+	mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, cmdq_base, base,
+			   MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
+			   REG_FLD_MASK(FLD_MF_BKGD_WB));
+	mtk_ddp_write_mask(cmdq_pkt, src_pitch_uv, cmdq_base, base,
+			   MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
+			   REG_FLD_MASK(FLD_SF_BKGD_WB));
+
+	if (cfg->encode_type == RDMA_ENCODE_AFBC) {
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_BKGD_WP, cfg->source_width),
+				   cmdq_base, base, MDP_RDMA_MF_BKGD_SIZE_IN_PIXEL,
+				   REG_FLD_MASK(FLD_MF_BKGD_WP));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_BKGD_HP, cfg->height),
+				   cmdq_base, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PIXEL,
+				   REG_FLD_MASK(FLD_BKGD_HP));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_YUV_TRANSFORM, 1),
+				   cmdq_base, base, MDP_RDMA_COMP_CON,
+				   REG_FLD_MASK(FLD_AFBC_YUV_TRANSFORM));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UFBDC_EN, 1), cmdq_base,
+				   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_UFBDC_EN));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_EN, 1), cmdq_base,
+				   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_AFBC_EN));
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_YUV_TRANSFORM, 0),
+				   cmdq_base, base, MDP_RDMA_COMP_CON,
+				   REG_FLD_MASK(FLD_AFBC_YUV_TRANSFORM));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UFBDC_EN, 0), cmdq_base,
+				   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_UFBDC_EN));
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_EN, 0), cmdq_base,
+				   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_AFBC_EN));
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_10B, 1), cmdq_base,
+			   base, MDP_RDMA_CON, REG_FLD_MASK(FLD_OUTPUT_10B));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SIMPLE_MODE, 1), cmdq_base,
+			   base, MDP_RDMA_CON, REG_FLD_MASK(FLD_SIMPLE_MODE));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TRANS_EN, cfg->csc_enable),
+			   cmdq_base, base, MDP_RDMA_TRANSFORM_0,
+			   REG_FLD_MASK(FLD_TRANS_EN));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_INT_MATRIX_SEL, cfg->profile),
+			   cmdq_base, base, MDP_RDMA_TRANSFORM_0,
+			   REG_FLD_MASK(FLD_INT_MATRIX_SEL));
+
+	if (cfg->block_size == RDMA_BLOCK_NONE) {
+		y_start_line = cfg->y_top;
+
+		offset_y  = (cfg->x_left * bpp_y >> 3) + y_start_line * src_pitch_y;
+		offset_u  = ((cfg->x_left >> h_shift_uv) * bpp_uv >> 3) +
+			    (y_start_line >> v_shift_uv) * src_pitch_uv;
+		offset_v  = ((cfg->x_left >> h_shift_uv) * bpp_uv >> 3) +
+			    (y_start_line >> v_shift_uv) * src_pitch_uv;
+	} else {
+		offset_y = (cfg->x_left * block_h * bpp_y >> 3) +
+			   (cfg->y_top) * src_pitch_y;
+		offset_u = ((cfg->x_left >> h_shift_uv) * (block_h >> v_shift_uv) *
+			   bpp_uv >> 3) + (cfg->y_top) * src_pitch_uv;
+		offset_v = ((cfg->x_left >> h_shift_uv) * (block_h >> v_shift_uv) *
+			   bpp_uv >> 3) + (cfg->y_top) * src_pitch_uv;
+	}
+
+	if (cfg->encode_type == RDMA_ENCODE_AFBC) {
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_WP, cfg->x_left),
+				   cmdq_base, base, MDP_RDMA_SRC_OFFSET_WP,
+				   REG_FLD_MASK(FLD_SRC_OFFSET_WP));
+
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_HP, cfg->y_top),
+				   cmdq_base, base, MDP_RDMA_SRC_OFFSET_HP,
+				   REG_FLD_MASK(FLD_SRC_OFFSET_HP));
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_0, offset_y),
+			   cmdq_base, base, MDP_RDMA_SRC_OFFSET_0,
+			   REG_FLD_MASK(FLD_SRC_OFFSET_0));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_1, offset_u),
+			   cmdq_base, base, MDP_RDMA_SRC_OFFSET_1,
+			   REG_FLD_MASK(FLD_SRC_OFFSET_1));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_2, offset_v),
+			   cmdq_base, base, MDP_RDMA_SRC_OFFSET_2,
+			   REG_FLD_MASK(FLD_SRC_OFFSET_2));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_W, cfg->width),
+			   cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
+			   REG_FLD_MASK(FLD_MF_SRC_W));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_H, cfg->height),
+			   cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
+			   REG_FLD_MASK(FLD_MF_SRC_H));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_W, cfg->width),
+			   cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
+			   REG_FLD_MASK(FLD_MF_CLIP_W));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_H, cfg->height),
+			   cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
+			   REG_FLD_MASK(FLD_MF_CLIP_H));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_OFFSET_W_1, 0),
+			   cmdq_base, base, MDP_RDMA_MF_OFFSET_1,
+			   REG_FLD_MASK(FLD_MF_OFFSET_W_1));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_OFFSET_H_1, 0),
+			   cmdq_base, base, MDP_RDMA_MF_OFFSET_1,
+			   REG_FLD_MASK(FLD_MF_OFFSET_H_1));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_LINE_THRESHOLD, cfg->height),
+			   cmdq_base, base, MDP_RDMA_TARGET_LINE,
+			   REG_FLD_MASK(FLD_LINE_THRESHOLD));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TARGET_LINE_EN, 1),
+			   cmdq_base, base, MDP_RDMA_TARGET_LINE,
+			   REG_FLD_MASK(FLD_TARGET_LINE_EN));
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
new file mode 100644
index 000000000000..c16bfb716610
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_MDP_RDMA_H__
+#define __MTK_MDP_RDMA_H__
+
+enum rdma_format {
+	RDMA_INPUT_FORMAT_RGB565 = 0,
+	RDMA_INPUT_FORMAT_RGB888 = 1,
+	RDMA_INPUT_FORMAT_RGBA8888 = 2,
+	RDMA_INPUT_FORMAT_ARGB8888 = 3,
+	RDMA_INPUT_FORMAT_UYVY = 4,
+	RDMA_INPUT_FORMAT_YUY2 = 5,
+	RDMA_INPUT_FORMAT_Y8 = 7,
+	RDMA_INPUT_FORMAT_YV12 = 8,
+	RDMA_INPUT_FORMAT_UYVY_3PL = 9,
+	RDMA_INPUT_FORMAT_NV12 = 12,
+	RDMA_INPUT_FORMAT_UYVY_2PL = 13,
+	RDMA_INPUT_FORMAT_Y410 = 14
+};
+
+enum rdma_profile {
+	RDMA_CSC_RGB_TO_JPEG = 0,
+	RDMA_CSC_RGB_TO_FULL709 = 1,
+	RDMA_CSC_RGB_TO_BT601 = 2,
+	RDMA_CSC_RGB_TO_BT709 = 3,
+	RDMA_CSC_JPEG_TO_RGB = 4,
+	RDMA_CSC_FULL709_TO_RGB = 5,
+	RDMA_CSC_BT601_TO_RGB = 6,
+	RDMA_CSC_BT709_TO_RGB = 7,
+	RDMA_CSC_JPEG_TO_BT601 = 8,
+	RDMA_CSC_JPEG_TO_BT709 = 9,
+	RDMA_CSC_BT601_TO_JPEG = 10,
+	RDMA_CSC_BT709_TO_BT601 = 11,
+	RDMA_CSC_BT601_TO_BT709 = 12
+};
+
+enum rdma_encode {
+	RDMA_ENCODE_NONE = 0,
+	RDMA_ENCODE_AFBC = 1,
+	RDMA_ENCODE_HYFBC = 2,
+	RDMA_ENCODE_UFO_DCP = 3
+};
+
+enum rdma_block {
+	RDMA_BLOCK_NONE = 0,
+	RDMA_BLOCK_8x8 = 1,
+	RDMA_BLOCK_8x16 = 2,
+	RDMA_BLOCK_8x32 = 3,
+	RDMA_BLOCK_16x8 = 4,
+	RDMA_BLOCK_16x16 = 5,
+	RDMA_BLOCK_16x32 = 6,
+	RDMA_BLOCK_32x8 = 7,
+	RDMA_BLOCK_32x16 = 8,
+	RDMA_BLOCK_32x32 = 9
+};
+
+struct mtk_mdp_rdma_cfg {
+	enum rdma_encode encode_type;
+	enum rdma_block block_size;
+	enum rdma_profile profile;
+	unsigned int source_width;
+	unsigned int addr0;
+	unsigned int addr1;
+	unsigned int addr2;
+	unsigned int width;
+	unsigned int height;
+	unsigned int x_left;
+	unsigned int y_top;
+	bool csc_enable;
+	int fmt;
+};
+
+struct mtk_mdp_rdma_fifo {
+	int read_request_type;
+	int command_div;
+	int ext_preutra_en;
+	int ultra_en;
+	int pre_ultra_en;
+	int ext_ultra_en;
+	int extrd_arb_max_0;
+	int buf_resv_size_0;
+	int issue_req_th_0;
+	int ultra_h_con_0;
+	int ultra_l_con_0;
+};
+
+void mtk_mdp_rdma_start(void __iomem *base,
+			struct cmdq_pkt *cmdq_pkt,
+			struct cmdq_client_reg *cmdq_base);
+
+void mtk_mdp_rdma_stop(void __iomem *base,
+		       struct cmdq_pkt *cmdq_pkt,
+		       struct cmdq_client_reg *cmdq_base);
+
+void mtk_mdp_rdma_fifo_config(void __iomem *base,
+			      struct cmdq_pkt *cmdq_pkt,
+			      struct cmdq_client_reg *cmdq_base,
+			      const struct mtk_mdp_rdma_fifo *fifo);
+
+void mtk_mdp_rdma_config(void __iomem *base,
+			 struct mtk_mdp_rdma_cfg *cfg,
+			 struct cmdq_pkt *cmdq_pkt,
+			 struct cmdq_client_reg *cmdq_base);
+
+#endif // __MTK_MDP_RDMA_H__
+
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
new file mode 100644
index 000000000000..08abd9f39bd8
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MDP_RDMA_REGS_H__
+#define __MDP_RDMA_REGS_H__
+
+#define REG_FLD(width, shift) \
+	((unsigned int)((((width) & 0xff) << 16) | ((shift) & 0xff)))
+
+#define REG_FLD_WIDTH(field) ((unsigned int)(((field) >> 16) & 0xff))
+
+#define REG_FLD_SHIFT(field) ((unsigned int)((field) & 0xff))
+
+#define REG_FLD_MASK(field) \
+	((unsigned int)((1ULL << REG_FLD_WIDTH(field)) - 1) \
+	 << REG_FLD_SHIFT(field))
+
+#define REG_FLD_VAL(field, val) \
+	(((val) << REG_FLD_SHIFT(field)) & REG_FLD_MASK(field))
+
+#define MDP_RDMA_EN                                            0x000
+#define FLD_ROT_ENABLE                            REG_FLD(1, 0)
+
+#define MDP_RDMA_RESET                                         0x008
+
+#define MDP_RDMA_INTERRUPT_ENABLE                              0x010
+#define FLD_UNDERRUN_INT_EN                       REG_FLD(1, 2)
+#define FLD_REG_UPDATE_INT_EN                     REG_FLD(1, 1)
+#define FLD_FRAME_COMPLETE_INT_EN                 REG_FLD(1, 0)
+
+#define MDP_RDMA_INTERRUPT_STATUS                              0x018
+
+#define MDP_RDMA_CON                                           0x020
+#define FLD_OUTPUT_10B                            REG_FLD(1, 5)
+#define FLD_SIMPLE_MODE                           REG_FLD(1, 4)
+
+#define MDP_RDMA_GMCIF_CON                                     0x028
+#define FLD_EXT_ULTRA_EN                          REG_FLD(1, 18)
+#define PRE_ULTRA_EN                              REG_FLD(2, 16)
+#define FLD_ULTRA_EN                              REG_FLD(2, 12)
+#define FLD_RD_REQ_TYPE                           REG_FLD(4, 4)
+#define FLD_EXT_PREULTRA_EN                       REG_FLD(1, 3)
+#define FLD_COMMAND_DIV                           REG_FLD(1, 0)
+
+#define MDP_RDMA_SRC_CON                                       0x030
+#define FLD_OUTPUT_ARGB                           REG_FLD(1, 25)
+#define FLD_BIT_NUMBER                            REG_FLD(2, 18)
+#define FLD_UNIFORM_CONFIG                        REG_FLD(1, 17)
+#define FLD_SWAP                                  REG_FLD(1, 14)
+#define FLD_SRC_FORMAT                            REG_FLD(4, 0)
+
+#define MDP_RDMA_COMP_CON                                      0x038
+#define FLD_AFBC_EN                               REG_FLD(1, 22)
+#define FLD_AFBC_YUV_TRANSFORM                    REG_FLD(1, 21)
+#define FLD_UFBDC_EN                              REG_FLD(1, 12)
+
+#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE                          0x060
+#define FLD_MF_BKGD_WB                            REG_FLD(23, 0)
+
+#define MDP_RDMA_MF_BKGD_SIZE_IN_PIXEL                         0x068
+#define FLD_MF_BKGD_WP                            REG_FLD(23, 0)
+
+#define MDP_RDMA_MF_SRC_SIZE                                   0x070
+#define FLD_MF_SRC_H                              REG_FLD(15, 16)
+#define FLD_MF_SRC_W                              REG_FLD(15, 0)
+
+#define MDP_RDMA_MF_CLIP_SIZE                                  0x078
+#define FLD_MF_CLIP_H                             REG_FLD(15, 16)
+#define FLD_MF_CLIP_W                             REG_FLD(15, 0)
+
+#define MDP_RDMA_MF_OFFSET_1                                   0x080
+#define FLD_MF_OFFSET_H_1                         REG_FLD(6, 16)
+#define FLD_MF_OFFSET_W_1                         REG_FLD(5, 0)
+
+#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE                          0x090
+#define FLD_SF_BKGD_WB                            REG_FLD(23, 0)
+
+#define MDP_RDMA_MF_BKGD_H_SIZE_IN_PIXEL                       0x098
+#define FLD_BKGD_HP                               REG_FLD(23, 0)
+
+#define MDP_RDMA_TARGET_LINE                                   0x0a0
+#define FLD_LINE_THRESHOLD                        REG_FLD(15, 17)
+#define FLD_TARGET_LINE_EN                        REG_FLD(1, 16)
+
+#define MDP_RDMA_SRC_OFFSET_0                                  0x118
+#define FLD_SRC_OFFSET_0                          REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_OFFSET_1                                  0x120
+#define FLD_SRC_OFFSET_1                          REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_OFFSET_2                                  0x128
+#define FLD_SRC_OFFSET_2                          REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_OFFSET_WP                                 0x148
+#define FLD_SRC_OFFSET_WP                         REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_OFFSET_HP                                 0x150
+#define FLD_SRC_OFFSET_HP                         REG_FLD(32, 0)
+
+#define MDP_RDMA_TRANSFORM_0                                   0x200
+#define FLD_INT_MATRIX_SEL                        REG_FLD(5, 23)
+#define FLD_TRANS_EN                              REG_FLD(1, 16)
+
+#define MDP_RDMA_DMA_CON_0                                     0x240
+#define FLD_EXTRD_ARB_MAX                         REG_FLD(4, 24)
+#define FLD_BUF_RESV_SIZE                         REG_FLD(8, 16)
+#define FLD_ISSUE_REQ_TH                          REG_FLD(8, 0)
+
+#define MDP_RDMA_UTRA_H_CON_0                                  0x248
+#define FLD_PREUTRA_H_OFS_0                       REG_FLD(10, 10)
+
+#define MDP_RDMA_UTRA_L_CON_0                                  0x250
+#define FLD_PREUTRA_L_OFS_0                       REG_FLD(10, 10)
+
+#define MDP_RDMA_DMABUF_CON_1                                  0x258
+#define FLD_EXTRD_ARB_MAX_1                       REG_FLD(4, 24)
+#define FLD_BUF_RESV_SIZE_1                       REG_FLD(7, 16)
+#define FLD_ISSUE_REQ_TH_1                        REG_FLD(7, 0)
+
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_1                           0x260
+#define FLD_PRE_ULTRA_TH_HIGH_OFS_1               REG_FLD(10, 10)
+
+#define MDP_RDMA_ULTRA_TH_LOW_CON_1                            0x268
+#define FLD_PRE_ULTRA_TH_LOW_OFS_1                REG_FLD(10, 10)
+
+#define MDP_RDMA_DMABUF_CON_2                                  0x270
+#define FLD_EXTRD_ARB_MAX_2                       REG_FLD(4, 24)
+#define FLD_BUF_RESV_SIZE_2                       REG_FLD(6, 16)
+#define FLD_ISSUE_REQ_TH_2                        REG_FLD(6, 0)
+
+#define MDP_RDMA_UTRA_H_CON_2                                  0x278
+#define FLD_PRE_ULTRA_TH_HIGH_OFS_2               REG_FLD(10, 10)
+
+#define MDP_RDMA_ULTRA_TH_LOW_CON_2                            0x280
+#define FLD_PRE_ULTRA_TH_LOW_OFS_2                REG_FLD(10, 10)
+
+#define MDP_RDMA_DMABUF_CON_3                                  0x288
+#define FLD_EXTRD_ARB_MAX_3                       REG_FLD(4, 24)
+#define FLD_BUF_RESV_SIZE_3                       REG_FLD(6, 16)
+#define FLD_ISSUE_REQ_TH_3                        REG_FLD(6, 0)
+
+#define MDP_RDMA_UTRA_H_CON_3                                  0x290
+#define FLD_PRE_ULTRA_TH_HIGH_OFS_3               REG_FLD(10, 10)
+
+#define MDP_RDMA_ULTRA_TH_LOW_CON_3                            0x298
+#define FLD_PRE_ULTRA_TH_LOW_OFS_3                REG_FLD(10, 10)
+
+#define MDP_RDMA_SRC_BASE_0                                    0xf00
+#define FLD_SRC_BASE_0                            REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_BASE_1                                    0xf08
+#define FLD_SRC_BASE_1                            REG_FLD(32, 0)
+
+#define MDP_RDMA_SRC_BASE_2                                    0xf10
+#define FLD_SRC_BASE_2                            REG_FLD(32, 0)
+
+#endif /* __MDP_RDMA_REGS_H__ */
+
-- 
2.18.0

