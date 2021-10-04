Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265B4205D4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 08:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDC86E911;
	Mon,  4 Oct 2021 06:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124336E90E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 06:21:50 +0000 (UTC)
X-UUID: f79659205045463e9f1f2ab067025b2d-20211004
X-UUID: f79659205045463e9f1f2ab067025b2d-20211004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 84532914; Mon, 04 Oct 2021 14:21:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 4 Oct 2021 14:21:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Oct 2021 14:21:44 +0800
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
Subject: [PATCH v6 14/16] drm/mediatek: add ovl_adaptor support for MT8195
Date: Mon, 4 Oct 2021 14:21:38 +0800
Message-ID: <20211004062140.29803-15-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211004062140.29803-1-nancy.lin@mediatek.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
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
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 498 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 4 files changed, 516 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index fb158a1e7f06..3abd27d7c91d 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -6,6 +6,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
 		  mtk_drm_ddp_comp.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2446ad0a4977..6a4f4c42aedb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -113,6 +113,22 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+int mtk_ovl_adaptor_clk_enable(struct device *dev);
+void mtk_ovl_adaptor_clk_disable(struct device *dev);
+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
+			    unsigned int h, unsigned int vrefresh,
+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt);
+void mtk_ovl_adaptor_enable_vblank(struct device *dev,
+				   void (*vblank_cb)(void *),
+				   void *vblank_cb_data);
+void mtk_ovl_adaptor_disable_vblank(struct device *dev);
+void mtk_ovl_adaptor_start(struct device *dev);
+void mtk_ovl_adaptor_stop(struct device *dev);
+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
+
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
 void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
new file mode 100644
index 000000000000..bfb5a9d29c26
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -0,0 +1,498 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_of.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_disp_drv.h"
+#include "mtk_ethdr.h"
+
+#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
+#define MTK_OVL_ADAPTOR_LAYER_NUM 4
+
+enum mtk_ovl_adaptor_comp_type {
+	OVL_ADAPTOR_TYPE_RDMA = 0,
+	OVL_ADAPTOR_TYPE_MERGE,
+	OVL_ADAPTOR_TYPE_ETHDR,
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
+	OVL_ADAPTOR_ETHDR0,
+	OVL_ADAPTOR_ID_MAX
+};
+
+struct ovl_adaptor_comp_match {
+	enum mtk_ovl_adaptor_comp_type type;
+	int alias_id;
+};
+
+struct mtk_disp_ovl_adaptor {
+	struct device *ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
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
+	"OVL_ADAPTOR_ETHDR",
+	"OVL_ADAPTOR_ID_MAX"
+};
+
+static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_RDMA] = "vdo1_rdma",
+	[OVL_ADAPTOR_TYPE_MERGE] = "merge",
+	[OVL_ADAPTOR_TYPE_ETHDR] = "ethdr",
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
+	[OVL_ADAPTOR_ETHDR0] =	{ OVL_ADAPTOR_TYPE_ETHDR, 0 },
+};
+
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	struct mtk_mdp_rdma_cfg rdma_config = {0};
+	struct device *rdma_l;
+	struct device *rdma_r;
+	struct device *merge;
+	struct device *ethdr;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	bool use_dual_pipe = false;
+	unsigned int l_w = 0;
+	unsigned int r_w = 0;
+
+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
+		pending->enable, pending->format);
+	dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
+		pending->addr, (pending->pitch / fmt_info->cpp[0]),
+		pending->x, pending->y, pending->width, pending->height);
+
+	rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
+	rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
+	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
+	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
+
+	if (!pending->enable) {
+		mtk_merge_disable(merge, cmdq_pkt);
+		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
+		mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
+		return;
+	}
+
+	/* ETHDR is in 1T2P domain, width needs to be 2 pixels align */
+	pending->width = ALIGN_DOWN(pending->width, 2);
+
+	if (pending->width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
+		use_dual_pipe = true;
+
+	if (use_dual_pipe) {
+		l_w = (pending->width / 2) + ((pending->width / 2) % 2);
+		r_w = pending->width - l_w;
+	} else {
+		l_w = pending->width;
+	}
+	mtk_merge_advance_config(merge, l_w, r_w, pending->height, 0, 0, cmdq_pkt);
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
+			     idx, pending->width / 2, cmdq_pkt);
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
+			     idx, pending->height, cmdq_pkt);
+
+	rdma_config.width = l_w;
+	rdma_config.height = pending->height;
+	rdma_config.addr0 = pending->addr;
+	rdma_config.pitch = pending->pitch;
+	rdma_config.fmt = pending->format;
+	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
+
+	if (use_dual_pipe) {
+		rdma_config.x_left = l_w;
+		rdma_config.width = r_w;
+		mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
+	}
+
+	mtk_merge_enable(merge, cmdq_pkt);
+	mtk_merge_unmute(merge, cmdq_pkt);
+
+	mtk_mdp_rdma_start(rdma_l, cmdq_pkt);
+	if (use_dual_pipe)
+		mtk_mdp_rdma_start(rdma_r, cmdq_pkt);
+	else
+		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
+
+	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
+}
+
+void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
+			    unsigned int h, unsigned int vrefresh,
+			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_config(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0], w, h,
+			 vrefresh, bpc, cmdq_pkt);
+}
+
+void mtk_ovl_adaptor_start(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+void mtk_ovl_adaptor_stop(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct device *rdma_l;
+	struct device *rdma_r;
+	struct device *merge;
+	u32 i;
+
+	for (i = 0; i < MTK_OVL_ADAPTOR_LAYER_NUM; i++) {
+		rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i];
+		rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i + 1];
+		merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + i];
+
+		mtk_mdp_rdma_stop(rdma_l, NULL);
+		mtk_mdp_rdma_stop(rdma_r, NULL);
+		mtk_merge_stop(merge);
+	}
+
+	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+int mtk_ovl_adaptor_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct device *comp;
+	int ret;
+	int i;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = ovl_adaptor->ovl_adaptor_comp[i];
+
+		if (i < OVL_ADAPTOR_MERGE0)
+			ret = mtk_mdp_rdma_clk_enable(comp);
+		else if (i < OVL_ADAPTOR_ETHDR0)
+			ret = mtk_merge_clk_enable(comp);
+		else
+			ret = mtk_ethdr_clk_enable(comp);
+		if (ret) {
+			dev_err(dev,
+				"Failed to enable clock %d, err %d-%s\n",
+				i, ret, ovl_adaptor_comp_str[i]);
+			goto clk_err;
+		}
+	}
+
+	return ret;
+
+clk_err:
+	while (--i >= 0) {
+		comp = ovl_adaptor->ovl_adaptor_comp[i];
+		if (i < OVL_ADAPTOR_MERGE0)
+			mtk_mdp_rdma_clk_disable(comp);
+		else if (i < OVL_ADAPTOR_ETHDR0)
+			mtk_merge_clk_disable(comp);
+		else
+			mtk_ethdr_clk_disable(comp);
+	}
+	return ret;
+}
+
+void mtk_ovl_adaptor_clk_disable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct device *comp;
+	int i;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = ovl_adaptor->ovl_adaptor_comp[i];
+
+		if (i < OVL_ADAPTOR_MERGE0)
+			mtk_mdp_rdma_clk_disable(comp);
+		else if (i < OVL_ADAPTOR_ETHDR0)
+			mtk_merge_clk_disable(comp);
+		else
+			mtk_ethdr_clk_disable(comp);
+	}
+}
+
+unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
+{
+	return MTK_OVL_ADAPTOR_LAYER_NUM;
+}
+
+void mtk_ovl_adaptor_enable_vblank(struct device *dev, void (*vblank_cb)(void *),
+				   void *vblank_cb_data)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_enable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
+				vblank_cb, vblank_cb_data);
+}
+
+void mtk_ovl_adaptor_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
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
+static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-vdo1-rdma",
+		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-disp-merge",
+		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
+	}, {
+		.compatible = "mediatek,mt8195-disp-ethdr",
+		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
+	},
+	{},
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
+{
+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
+	struct device_node *node, *parent;
+	struct platform_device *comp_pdev;
+	int i, ret;
+
+	parent = dev->parent->parent->of_node->parent;
+
+	for_each_child_of_node(parent, node) {
+		const struct of_device_id *of_id;
+		enum mtk_ovl_adaptor_comp_type type;
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
+		comp_pdev = of_find_device_by_node(node);
+		if (!comp_pdev) {
+			dev_warn(dev, "can't find platform device of node:%s\n",
+				 node->name);
+			return -ENODEV;
+		}
+		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
+
+		drm_of_component_match_add(dev, match, compare_of, node);
+		dev_info(dev, "Adding component match for %pOF\n", node);
+	}
+
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_comp_bind(struct device *dev, struct device *master,
+					  void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_ovl_adaptor_comp_unbind(struct device *dev, struct device *master,
+					     void *data)
+{
+}
+
+static const struct component_ops mtk_disp_ovl_adaptor_comp_ops = {
+	.bind	= mtk_disp_ovl_adaptor_comp_bind,
+	.unbind = mtk_disp_ovl_adaptor_comp_unbind,
+};
+
+static int mtk_disp_ovl_adaptor_master_bind(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
+
+	dev_info(dev, "%s-%d", __func__, __LINE__);
+
+	component_bind_all(dev, priv->mmsys_dev);
+	return 0;
+}
+
+static void mtk_disp_ovl_adaptor_master_unbind(struct device *dev)
+{
+}
+
+static const struct component_master_ops mtk_disp_ovl_adaptor_master_ops = {
+	.bind		= mtk_disp_ovl_adaptor_master_bind,
+	.unbind		= mtk_disp_ovl_adaptor_master_unbind,
+};
+
+static int mtk_disp_ovl_adaptor_check_comp(struct device *dev)
+{
+	struct device_node *node;
+
+	for_each_child_of_node(dev->parent->parent->of_node->parent, node) {
+		const struct of_device_id *of_id;
+		struct platform_device *comp_pdev;
+		enum mtk_ovl_adaptor_comp_type type;
+		int id;
+
+		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
+		if (!of_id)
+			continue;
+
+		if (!of_device_is_available(node))
+			continue;
+
+		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
+
+		id = ovl_adaptor_comp_get_id(dev, node, type);
+		if (id < 0)
+			continue;
+
+		comp_pdev = of_find_device_by_node(node);
+		if (!comp_pdev)
+			return -EPROBE_DEFER;
+
+		if (!platform_get_drvdata(comp_pdev))
+			return -EPROBE_DEFER;
+	}
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
+{
+	struct mtk_disp_ovl_adaptor *priv;
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	int ret;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	ret = mtk_disp_ovl_adaptor_check_comp(dev);
+	if (ret < 0)
+		return ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->mmsys_dev = pdev->dev.platform_data;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = ovl_adaptor_comp_init(dev, &match);
+	if (ret) {
+		dev_notice(dev, "ovl_adaptor comp init fail\n");
+		return ret;
+	}
+	component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);
+
+	pm_runtime_enable(dev);
+
+	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
+	if (ret != 0) {
+		pm_runtime_disable(dev);
+		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
+
+	dev_info(dev, "%s-\n", __func__);
+	return ret;
+}
+
+static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_ovl_adaptor_comp_ops);
+	pm_runtime_disable(&pdev->dev);
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
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index a58cebd01d35..1ad9f7edfcc7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_merge_driver;
+extern struct platform_driver mtk_disp_ovl_adaptor_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
2.18.0

