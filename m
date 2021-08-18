Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD303F0041
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C9F6E4F3;
	Wed, 18 Aug 2021 09:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6B86E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:18:59 +0000 (UTC)
X-UUID: 47353ac13e6d4b6695f3a2c87779d7d0-20210818
X-UUID: 47353ac13e6d4b6695f3a2c87779d7d0-20210818
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 566864401; Wed, 18 Aug 2021 17:18:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 17:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 17:18:51 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 13/15] drm/mediatek: add ovl_adaptor support for MT8195
Date: Wed, 18 Aug 2021 17:18:45 +0800
Message-ID: <20210818091847.8060-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818091847.8060-1-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
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

Add ovl_adaptor driver for MT8195.
Ovl_adaptor is an encapsulated module and designed for simplified
DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
an ETHDR. Two RDMAs merge into one layer, so this module support 4
layers.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile             |   3 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528 ++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.h   |  19 +
 3 files changed, 549 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 38ec2354a894..f04ac86c9593 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -13,7 +13,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_disp_ovl_adaptor.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
new file mode 100644
index 000000000000..8222ec5ff799
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_disp_drv.h"
+#include "mtk_disp_ovl_adaptor.h"
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
+#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
+#define MTK_OVL_ADAPTOR_LAYER_NUM 4
+
+enum mtk_ovl_adaptor_comp_type {
+	OVL_ADAPTOR_TYPE_RDMA = 0,
+	OVL_ADAPTOR_TYPE_MERGE,
+	OVL_ADAPTOR_TYPE_NUM,
+};
+
+enum mtk_ovl_adaptor_comp_id {
+	OVL_ADAPTOR_MDP_RDMA0,
+	OVL_ADAPTOR_MDP_RDMA1,
+	OVL_ADAPTOR_MDP_RDMA2,
+	OVL_ADAPTOR_MDP_RDMA3,
+	OVL_ADAPTOR_MDP_RDMA4,
+	OVL_ADAPTOR_MDP_RDMA5,
+	OVL_ADAPTOR_MDP_RDMA6,
+	OVL_ADAPTOR_MDP_RDMA7,
+	OVL_ADAPTOR_MERGE0,
+	OVL_ADAPTOR_MERGE1,
+	OVL_ADAPTOR_MERGE2,
+	OVL_ADAPTOR_MERGE3,
+	OVL_ADAPTOR_ID_MAX
+};
+
+struct ovl_adaptor_comp_match {
+	enum mtk_ovl_adaptor_comp_type type;
+	int alias_id;
+};
+
+struct ovl_adaptor_merge_config {
+	unsigned int fmt;
+	unsigned int merge_mode;
+	unsigned int in_w[2];
+	unsigned int out_w[2];
+	unsigned int in_h;
+};
+
+struct mtk_ovl_adaptor_comp {
+	struct device *dev;
+	struct clk *clks[2];
+	struct cmdq_client_reg cmdq_base;
+	void __iomem *regs;
+};
+
+struct mtk_disp_ovl_adaptor {
+	struct mtk_ovl_adaptor_comp ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
+	struct device *mmsys_dev;
+};
+
+static const char * const ovl_adaptor_comp_str[] = {
+	"OVL_ADAPTOR_MDP_RDMA0",
+	"OVL_ADAPTOR_MDP_RDMA1",
+	"OVL_ADAPTOR_MDP_RDMA2",
+	"OVL_ADAPTOR_MDP_RDMA3",
+	"OVL_ADAPTOR_MDP_RDMA4",
+	"OVL_ADAPTOR_MDP_RDMA5",
+	"OVL_ADAPTOR_MDP_RDMA6",
+	"OVL_ADAPTOR_MDP_RDMA7",
+	"OVL_ADAPTOR_MERGE0",
+	"OVL_ADAPTOR_MERGE1",
+	"OVL_ADAPTOR_MERGE2",
+	"OVL_ADAPTOR_MERGE3",
+	"OVL_ADAPTOR_ID_MAX"
+};
+
+static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_RDMA] = "vdo1_rdma",
+	[OVL_ADAPTOR_TYPE_MERGE] = "merge",
+};
+
+static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
+	[OVL_ADAPTOR_MDP_RDMA0] =	{ OVL_ADAPTOR_TYPE_RDMA, 0 },
+	[OVL_ADAPTOR_MDP_RDMA1] =	{ OVL_ADAPTOR_TYPE_RDMA, 1 },
+	[OVL_ADAPTOR_MDP_RDMA2] =	{ OVL_ADAPTOR_TYPE_RDMA, 2 },
+	[OVL_ADAPTOR_MDP_RDMA3] =	{ OVL_ADAPTOR_TYPE_RDMA, 3 },
+	[OVL_ADAPTOR_MDP_RDMA4] =	{ OVL_ADAPTOR_TYPE_RDMA, 4 },
+	[OVL_ADAPTOR_MDP_RDMA5] =	{ OVL_ADAPTOR_TYPE_RDMA, 5 },
+	[OVL_ADAPTOR_MDP_RDMA6] =	{ OVL_ADAPTOR_TYPE_RDMA, 6 },
+	[OVL_ADAPTOR_MDP_RDMA7] =	{ OVL_ADAPTOR_TYPE_RDMA, 7 },
+	[OVL_ADAPTOR_MERGE0] =	{ OVL_ADAPTOR_TYPE_MERGE, 1 },
+	[OVL_ADAPTOR_MERGE1] =	{ OVL_ADAPTOR_TYPE_MERGE, 2 },
+	[OVL_ADAPTOR_MERGE2] =	{ OVL_ADAPTOR_TYPE_MERGE, 3 },
+	[OVL_ADAPTOR_MERGE3] =	{ OVL_ADAPTOR_TYPE_MERGE, 4 },
+};
+
+static void mtk_ovl_adaptor_merge_config(struct mtk_ovl_adaptor_comp *comp,
+					 struct ovl_adaptor_merge_config *merge_cfg,
+					 struct cmdq_pkt *cmdq_pkt)
+{
+	switch (merge_cfg->merge_mode) {
+	case 6:
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25);
+		break;
+	case 18:
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_1);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_26);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_27);
+		break;
+	default:
+		break;
+	}
+
+	mtk_ddp_write(cmdq_pkt, merge_cfg->merge_mode, &comp->cmdq_base,
+		      comp->regs, DISP_MERGE_CFG_12);
+	mtk_ddp_write(cmdq_pkt, CFG_10_NO_SWAP, &comp->cmdq_base,
+		      comp->regs, DISP_MERGE_CFG_10);
+	mtk_ddp_write_mask(cmdq_pkt, 1, &comp->cmdq_base, comp->regs,
+			   DISP_MERGE_ENABLE, MERGE_ENABLE);
+}
+
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	struct ovl_adaptor_merge_config merge_cfg = {0};
+	struct mtk_mdp_rdma_cfg rdma_config = {0};
+	struct mtk_ovl_adaptor_comp *rdma_l;
+	struct mtk_ovl_adaptor_comp *rdma_r;
+	struct mtk_ovl_adaptor_comp *merge;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	bool use_dual_pipe = false;
+
+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
+		pending->enable, pending->format);
+	dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
+		pending->addr, (pending->pitch / fmt_info->cpp[0]),
+		pending->x, pending->y, pending->width, pending->height);
+
+	rdma_l = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
+	rdma_r = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
+	merge = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
+
+	if (!pending->enable) {
+		mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+				   DISP_MERGE_ENABLE, MERGE_ENABLE);
+		mtk_mdp_rdma_stop(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+		return;
+	}
+
+	if (pending->width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
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
+	mtk_ovl_adaptor_merge_config(merge, &merge_cfg, cmdq_pkt);
+
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
+			     idx, pending->width / 2, cmdq_pkt);
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
+			     idx, pending->height, cmdq_pkt);
+
+	rdma_config.source_width = pending->pitch / fmt_info->cpp[0];
+	rdma_config.csc_enable = fmt_info->is_yuv ? true : false;
+	rdma_config.profile = RDMA_CSC_FULL709_TO_RGB;
+	rdma_config.width = merge_cfg.in_w[0];
+	rdma_config.height = pending->height;
+	rdma_config.addr0 = pending->addr;
+	rdma_config.pitch = pending->pitch;
+	rdma_config.fmt = pending->format;
+	mtk_mdp_rdma_config(rdma_l->regs, &rdma_config, cmdq_pkt, &rdma_l->cmdq_base);
+
+	rdma_config.x_left = merge_cfg.in_w[0];
+	rdma_config.width = merge_cfg.in_w[1];
+	mtk_mdp_rdma_config(rdma_r->regs, &rdma_config, cmdq_pkt, &rdma_r->cmdq_base);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0x1, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_ENABLE, MERGE_ENABLE);
+	mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_MUTE_0, 0x1);
+
+	mtk_mdp_rdma_start(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+	if (use_dual_pipe)
+		mtk_mdp_rdma_start(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+	else
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+}
+
+void mtk_ovl_adaptor_stop(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *rdma_l;
+	struct mtk_ovl_adaptor_comp *rdma_r;
+	struct mtk_ovl_adaptor_comp *merge;
+	unsigned int reg;
+	u32 i;
+
+	for (i = 0; i < MTK_OVL_ADAPTOR_LAYER_NUM; i++) {
+		rdma_l = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i];
+		rdma_r = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i + 1];
+		merge = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + i];
+
+		mtk_mdp_rdma_stop(rdma_l->regs, NULL, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, NULL, &rdma_r->cmdq_base);
+
+		reg = readl(merge->regs + DISP_MERGE_ENABLE);
+		reg = reg & ~MERGE_ENABLE;
+		writel_relaxed(reg, merge->regs + DISP_MERGE_ENABLE);
+
+		device_reset_optional(merge->dev);
+	}
+}
+
+int mtk_ovl_adaptor_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = &ovl_adaptor->ovl_adaptor_comp[i];
+		if (!comp->dev)
+			continue;
+
+		/* Need to power on for private rdma devices */
+		if (i < OVL_ADAPTOR_MERGE0) {
+			ret = pm_runtime_get_sync(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power on, err %d-%s\n",
+					ret, ovl_adaptor_comp_str[i]);
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
+					i, ret, ovl_adaptor_comp_str[i]);
+		}
+	}
+
+	return ret;
+}
+
+void mtk_ovl_adaptor_clk_disable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = &ovl_adaptor->ovl_adaptor_comp[i];
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
+		if (i < OVL_ADAPTOR_MERGE0) {
+			ret = pm_runtime_put(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power off, err-%s\n",
+					ret, ovl_adaptor_comp_str[i]);
+		}
+	}
+}
+
+static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
+				   enum mtk_ovl_adaptor_comp_type type)
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
+			     struct mtk_ovl_adaptor_comp *comp,
+			     enum mtk_ovl_adaptor_comp_id id)
+{
+	struct platform_device *comp_pdev;
+	int ret;
+	int i;
+
+	if (id < 0 || id >= OVL_ADAPTOR_ID_MAX) {
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
+	if (id < OVL_ADAPTOR_MERGE0)
+		pm_runtime_enable(comp->dev);
+
+	dev_info(dev, "[DRM]regs:0x%p, node:%s\n", comp->regs, ovl_adaptor_comp_str[id]);
+
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_comp_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_comp_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-vdo1-rdma",
+		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-vdo1-merge",
+		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
+	},
+	{},
+};
+
+static struct platform_driver mtk_disp_ovl_adaptor_comp_driver = {
+	.probe		= mtk_disp_ovl_adaptor_comp_probe,
+	.remove		= mtk_disp_ovl_adaptor_comp_remove,
+	.driver = {
+		.name	= "mediatek-disp-ovl-adaptor-comp",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_ovl_adaptor_comp_dt_ids,
+	},
+};
+module_platform_driver(mtk_disp_ovl_adaptor_comp_driver);
+
+static int ovl_adaptor_comp_init(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
+	struct device_node *node, *parent;
+	int i, ret;
+
+	parent = dev->parent->of_node->parent;
+
+	for_each_child_of_node(parent, node) {
+		const struct of_device_id *of_id;
+		enum mtk_ovl_adaptor_comp_type type;
+		struct mtk_ovl_adaptor_comp *comp;
+		int id;
+
+		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
+		if (!of_id)
+			continue;
+
+		if (!of_device_is_available(node)) {
+			dev_info(dev, "Skipping disabled component %pOF\n",
+				 node);
+			continue;
+		}
+
+		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
+		id = ovl_adaptor_comp_get_id(dev, node, type);
+		if (id < 0) {
+			dev_warn(dev, "Skipping unknown component %pOF\n",
+				 node);
+			continue;
+		}
+
+		ret = private_comp_init(dev, node, &priv->ovl_adaptor_comp[id], id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ovl_adaptor_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-ethdr"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_ovl_adaptor_driver_dt_match);
+
+static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
+{
+	struct mtk_disp_ovl_adaptor *priv;
+	struct device *dev = &pdev->dev;
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	of_id = of_match_node(ovl_adaptor_driver_dt_match, phandle);
+	if (!of_id)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->mmsys_dev = pdev->dev.platform_data;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = ovl_adaptor_comp_init(dev);
+	if (ret) {
+		dev_notice(dev, "ovl_adaptor comp init fail\n");
+		return ret;
+	}
+
+	dev_info(dev, "%s-\n", __func__);
+	return ret;
+}
+
+static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(&pdev->dev);
+	int i;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_MERGE0; i++)
+		pm_runtime_disable(ovl_adaptor->ovl_adaptor_comp[i].dev);
+
+	return 0;
+}
+
+struct platform_driver mtk_disp_ovl_adaptor_driver = {
+	.probe = mtk_disp_ovl_adaptor_probe,
+	.remove = mtk_disp_ovl_adaptor_remove,
+	.driver = {
+			.name = "mediatek-disp-ovl-adaptor",
+			.owner = THIS_MODULE,
+		},
+};
+module_platform_driver(mtk_disp_ovl_adaptor_driver);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
new file mode 100644
index 000000000000..7d757be1f491
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OVL_ADAPTOR_H__
+#define __MTK_DISP_OVL_ADAPTOR_H__
+
+#include <drm/mediatek_drm.h>
+
+void mtk_ovl_adaptor_stop(struct device *dev);
+int mtk_ovl_adaptor_clk_enable(struct device *dev);
+void mtk_ovl_adaptor_clk_disable(struct device *dev);
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt);
+
+#endif
+
-- 
2.18.0

