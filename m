Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC1F3D2123
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557036EB31;
	Thu, 22 Jul 2021 09:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315E16EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:45:59 +0000 (UTC)
X-UUID: 7bab8e60e9234a85a23cc04f86453c72-20210722
X-UUID: 7bab8e60e9234a85a23cc04f86453c72-20210722
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1978138510; Thu, 22 Jul 2021 17:45:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:55 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 13/14] drm/mediatek: add ETHDR support for MT8195
Date: Thu, 22 Jul 2021 17:45:50 +0800
Message-ID: <20210722094551.15255-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ETHDR module files:
ETHDR is designed for HDR video and graphics conversion in the external
display path. It handles multiple HDR input types and performs tone
mapping, color space/color format conversion, and then combines
different layers, output the required HDR or SDR signal to the
subsequent display path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 413 ++++++++++++++++++++++++
 5 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 31613564f499..b4b305d58b0f 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -15,7 +15,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_disp_pseudo_ovl.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_ethdr.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 3e27ce7fef57..464db52131db 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -105,4 +105,20 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+int mtk_ethdr_clk_enable(struct device *dev);
+void mtk_ethdr_clk_disable(struct device *dev);
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data);
+void mtk_ethdr_disable_vblank(struct device *dev);
+void mtk_ethdr_start(struct device *dev);
+void mtk_ethdr_stop(struct device *dev);
+unsigned int mtk_ethdr_layer_nr(struct device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 11c25daf05d8..58f9f9f06e94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8195-disp-ethdr",
+	  .data = (void *)MTK_DISP_PSEUDO_OVL },
 	{ }
 };
 
@@ -676,6 +678,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
+	&mtk_ethdr_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c4d802a43531..c87ebb5309d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -55,5 +55,6 @@ extern struct platform_driver mtk_disp_dsc_driver;
 extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_ethdr_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
new file mode 100644
index 000000000000..26e079323de0
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -0,0 +1,413 @@
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
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_pseudo_ovl.h"
+
+#define MIX_INTEN		0x4
+	#define MIX_FME_CPL_INTEN	BIT(1)
+#define MIX_INTSTA		0x8
+#define MIX_EN			0xc
+#define MIX_RST			0x14
+#define MIX_ROI_SIZE		0x18
+#define MIX_DATAPATH_CON	0x1c
+	#define OUTPUT_NO_RND	BIT(3)
+	#define SOURCE_RGB_SEL	BIT(7)
+	#define BACKGROUND_RELAY	(4 << 9)
+#define MIX_ROI_BGCLR		0x20
+	#define BGCLR_BLACK	0xff000000
+#define MIX_SRC_CON		0x24
+	#define MIX_SRC_L0_EN	BIT(0)
+#define MIX_L_SRC_CON(n)	(0x28 + 0x18 * (n))
+	#define NON_PREMULTI_SOURCE (2 << 12)
+#define MIX_L_SRC_SIZE(n)	(0x30 + 0x18 * (n))
+#define MIX_L_SRC_OFFSET(n)	(0x34 + 0x18 * (n))
+#define MIX_FUNC_DCM0		0x120
+#define MIX_FUNC_DCM1		0x124
+	#define MIX_FUNC_DCM_ENABLE 0xffffffff
+
+#define HDR_VDO_FE_0804_HDR_DM_FE	0x804
+	#define HDR_VDO_FE_0804_BYPASS_ALL	0xfd
+#define HDR_GFX_FE_0204_GFX_HDR_FE	0x204
+	#define HDR_GFX_FE_0204_BYPASS_ALL	0xfd
+#define HDR_VDO_BE_0204_VDO_DM_BE	0x204
+	#define HDR_VDO_BE_0204_BYPASS_ALL	0x7e
+
+#define DEFAULT_9BIT_ALPHA	0x100
+#define	MIXER_ALPHA_AEN		BIT(8)
+#define	MIXER_ALPHA		0xff
+#define ETHDR_CLK_NUM		13
+
+enum mtk_ethdr_comp_id {
+	ETHDR_MIXER,
+	ETHDR_VDO_FE0,
+	ETHDR_VDO_FE1,
+	ETHDR_GFX_FE0,
+	ETHDR_GFX_FE1,
+	ETHDR_VDO_BE,
+	ETHDR_ADL_DS,
+	ETHDR_ID_MAX
+};
+
+struct mtk_ethdr_comp {
+	struct device *dev;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_base;
+};
+
+struct mtk_ethdr {
+	struct mtk_ethdr_comp ethdr_comp[ETHDR_ID_MAX];
+	struct clk_bulk_data ethdr_clk[ETHDR_CLK_NUM];
+	struct device *pseudo_ovl_dev;
+	struct device *mmsys_dev;
+	void (*vblank_cb)(void *data);
+	void *vblank_cb_data;
+	int irq;
+};
+
+static const char * const ethdr_comp_str[] = {
+	"ETHDR_MIXER",
+	"ETHDR_VDO_FE0",
+	"ETHDR_VDO_FE1",
+	"ETHDR_GFX_FE0",
+	"ETHDR_GFX_FE1",
+	"ETHDR_VDO_BE",
+	"ETHDR_ADL_DS",
+	"ETHDR_ID_MAX"
+};
+
+static const char * const ethdr_clk_str[] = {
+	"ethdr_top",
+	"mixer",
+	"vdo_fe0",
+	"vdo_fe1",
+	"gfx_fe0",
+	"gfx_fe1",
+	"vdo_be",
+	"adl_ds",
+	"vdo_fe0_async",
+	"vdo_fe1_async",
+	"gfx_fe0_async",
+	"gfx_fe1_async",
+	"vdo_be_async",
+};
+
+void mtk_ethdr_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+
+	writel(MIX_FME_CPL_INTEN, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+void mtk_ethdr_disable_vblank(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_ethdr *priv = dev_id;
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
+
+	if (!priv->vblank_cb)
+		return IRQ_NONE;
+
+	priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+	struct mtk_plane_pending_state *pending = &state->pending;
+	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int offset = (pending->y << 16) | pending->x;
+	unsigned int alpha_con = 0;
+	unsigned int fmt = 0;
+
+	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
+
+	if (idx >= 4)
+		return;
+
+	mtk_pseudo_ovl_layer_config(priv->pseudo_ovl_dev, idx, state, cmdq_pkt);
+
+	if (!pending->enable) {
+		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+		return;
+	}
+
+	if (state->base.fb && state->base.fb->format->has_alpha) {
+		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 0, cmdq_pkt);
+	} else {
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 1, cmdq_pkt);
+	}
+
+	mtk_ddp_write(cmdq_pkt, src_size, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+	mtk_ddp_write(cmdq_pkt, offset, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_OFFSET(idx));
+	mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx),
+			   0x1ff);
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->regs, MIX_SRC_CON,
+			   BIT(idx));
+}
+
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *vdo_fe0 = &priv->ethdr_comp[ETHDR_VDO_FE0];
+	struct mtk_ethdr_comp *vdo_fe1 = &priv->ethdr_comp[ETHDR_VDO_FE1];
+	struct mtk_ethdr_comp *gfx_fe0 = &priv->ethdr_comp[ETHDR_GFX_FE0];
+	struct mtk_ethdr_comp *gfx_fe1 = &priv->ethdr_comp[ETHDR_GFX_FE1];
+	struct mtk_ethdr_comp *vdo_be = &priv->ethdr_comp[ETHDR_VDO_BE];
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+	int i;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	mtk_pseudo_ovl_config(priv->pseudo_ovl_dev, w, h, vrefresh, bpc, cmdq_pkt);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe0->cmdq_base,
+		      vdo_fe0->regs, HDR_VDO_FE_0804_HDR_DM_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe1->cmdq_base,
+		      vdo_fe1->regs, HDR_VDO_FE_0804_HDR_DM_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe0->cmdq_base,
+		      gfx_fe0->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe1->cmdq_base,
+		      gfx_fe1->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_BE_0204_BYPASS_ALL, &vdo_be->cmdq_base,
+		      vdo_be->regs, HDR_VDO_BE_0204_VDO_DM_BE);
+
+	mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM0);
+	mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM1);
+	mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base, mixer->regs, MIX_ROI_SIZE);
+	mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer->cmdq_base, mixer->regs, MIX_ROI_BGCLR);
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(0));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(1));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(2));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(3));
+	mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(0));
+	mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND | SOURCE_RGB_SEL | BACKGROUND_RELAY,
+		      &mixer->cmdq_base, mixer->regs, MIX_DATAPATH_CON);
+	mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN, &mixer->cmdq_base, mixer->regs,
+			   MIX_SRC_CON, MIX_SRC_L0_EN);
+
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
+			     (w / 2), cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
+			     h, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, 0, cmdq_pkt);
+
+	for (i = 1; i <= 4; i++) {
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, i,
+				     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, i,
+				     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+	}
+}
+
+void mtk_ethdr_start(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_pseudo_ovl_start(priv->pseudo_ovl_dev);
+
+	mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_EN);
+}
+
+void mtk_ethdr_stop(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_pseudo_ovl_stop(priv->pseudo_ovl_dev);
+
+	mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_EN);
+	mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_RST);
+	reset_control_reset(devm_reset_control_array_get(dev, true, true));
+	mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_RST);
+}
+
+int mtk_ethdr_clk_enable(struct device *dev)
+{
+	int i, ret;
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_pseudo_ovl_clk_enable(priv->pseudo_ovl_dev);
+
+	ret = clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		dev_err(dev,
+			"ethdr_clk prepare enable failed\n");
+	return ret;
+}
+
+void mtk_ethdr_clk_disable(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	int i;
+
+	mtk_pseudo_ovl_clk_disable(priv->pseudo_ovl_dev);
+
+	clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
+}
+
+unsigned int mtk_ethdr_layer_nr(struct device *dev)
+{
+	return 4;
+}
+
+static int mtk_ethdr_bind(struct device *dev, struct device *master,
+			  void *data)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct platform_device *pseudo_ovl;
+	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *drm_private = drm_dev->dev_private;
+
+	priv->mmsys_dev = drm_private->mmsys_dev;
+
+	/* Bring up pseudo ovl rdma and merge */
+	pseudo_ovl = platform_device_register_data(dev, "mediatek-disp-pseudo-ovl",
+						   PLATFORM_DEVID_AUTO, (void *)priv->mmsys_dev,
+						   sizeof(*priv->mmsys_dev));
+	if (IS_ERR(pseudo_ovl))
+		return PTR_ERR(pseudo_ovl);
+
+	priv->pseudo_ovl_dev = &pseudo_ovl->dev;
+
+	return 0;
+}
+
+static void mtk_ethdr_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_ethdr_component_ops = {
+	.bind	= mtk_ethdr_bind,
+	.unbind = mtk_ethdr_unbind,
+};
+
+static int mtk_ethdr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_ethdr *priv;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	for (i = 0; i < ETHDR_ID_MAX; i++) {
+		priv->ethdr_comp[i].dev = dev;
+		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		ret = cmdq_dev_get_client_reg(dev,
+					      &priv->ethdr_comp[i].cmdq_base, i);
+		if (ret)
+			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+		dev_info(dev, "[DRM]regs:0x%x, node:%s\n",
+			 priv->ethdr_comp[i].regs, ethdr_comp_str[i]);
+	}
+
+	for (i = 0; i < ETHDR_CLK_NUM; i++)
+		priv->ethdr_clk[i].id = ethdr_clk_str[i];
+	ret = devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		priv->irq = 0;
+
+	if (priv->irq) {
+		ret = devm_request_irq(dev, priv->irq, mtk_ethdr_irq_handler,
+				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+			return ret;
+		}
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_ethdr_component_ops);
+	if (ret)
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+	dev_info(dev, "%s-\n", __func__);
+	pm_runtime_enable(dev);
+
+	return ret;
+}
+
+static int mtk_ethdr_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_ethdr_component_ops);
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id mtk_ethdr_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-ethdr"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
+
+struct platform_driver mtk_ethdr_driver = {
+	.probe = mtk_ethdr_probe,
+	.remove = mtk_ethdr_remove,
+	.driver = {
+			.name = "mediatek-disp-ethdr",
+			.owner = THIS_MODULE,
+			.of_match_table = mtk_ethdr_driver_dt_match,
+		},
+};
-- 
2.18.0

