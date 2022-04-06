Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9D4F5A26
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E110F196;
	Wed,  6 Apr 2022 09:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B1F10F196;
 Wed,  6 Apr 2022 09:40:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57E5BB821FA;
 Wed,  6 Apr 2022 09:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EB0C385A3;
 Wed,  6 Apr 2022 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649238054;
 bh=+JSQWrZgoNDTdpxFry4cx+igL6dZyybhhXp9e7NXYp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWhv4oGFMttPm3MUV/e0KlhBEZBSXzg1mnc10XJSHZ4NpUPxx8XTUK9VAjTMpgkjr
 6g9Z92si/TPsv/wwGkmYHkdoIZISkM3mE6m0DJN5xFnq/ceVgxEYU9qD4U6gJ+AdyP
 oCtLYgBVphG7uknj3q4OgMt7peRwp7WpltZQx0smepm4Pz86pJBrINZ3v833m2GMHt
 NYT4rDIQRSXFKAJCffJwwq389pnJoPFZeNrz7vPVJ7S3nhQUJOA3WBLMMt8HjTDJg0
 YKLMZqIB5uCGA6PH/xsM8qX+pISfQ9fUSeQHmQNUCgQj9zKtShxW4cztIOXYpkOGkK
 GRbalKA3pa9SQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v7 03/14] drm/msm/disp/dpu1: Add support for DSC
Date: Wed,  6 Apr 2022 15:10:20 +0530
Message-Id: <20220406094031.1027376-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406094031.1027376-1-vkoul@kernel.org>
References: <20220406094031.1027376-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
support by adding hw blocks for DSC

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 215 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  80 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 ++
 5 files changed, 322 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index e9cc7d8ac301..f551ecc0fefa 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -56,6 +56,7 @@ msm-y := \
 	disp/dpu1/dpu_formats.o \
 	disp/dpu1/dpu_hw_catalog.o \
 	disp/dpu1/dpu_hw_ctl.o \
+	disp/dpu1/dpu_hw_dsc.o \
 	disp/dpu1/dpu_hw_interrupts.o \
 	disp/dpu1/dpu_hw_intf.o \
 	disp/dpu1/dpu_hw_lm.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b85b24bd3f53..f05c4cdcb7f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -561,6 +561,16 @@ struct dpu_merge_3d_cfg  {
 	const struct dpu_merge_3d_sub_blks *sblk;
 };
 
+/**
+ * struct dpu_dsc_cfg - information of DSC blocks
+ * @id                 enum identifying this block
+ * @base               register offset of this block
+ * @features           bit mask identifying sub-blocks/features
+ */
+struct dpu_dsc_cfg {
+	DPU_HW_BLK_INFO;
+};
+
 /**
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
@@ -757,6 +767,9 @@ struct dpu_mdss_cfg {
 	u32 merge_3d_count;
 	const struct dpu_merge_3d_cfg *merge_3d;
 
+	u32 dsc_count;
+	struct dpu_dsc_cfg *dsc;
+
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
new file mode 100644
index 000000000000..426224e34900
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2022, Linaro Limited
+ */
+
+#include "dpu_kms.h"
+#include "dpu_hw_catalog.h"
+#include "dpu_hwio.h"
+#include "dpu_hw_mdss.h"
+#include "dpu_hw_dsc.h"
+
+#define DSC_COMMON_MODE	                0x000
+#define DSC_ENC                         0X004
+#define DSC_PICTURE                     0x008
+#define DSC_SLICE                       0x00C
+#define DSC_CHUNK_SIZE                  0x010
+#define DSC_DELAY                       0x014
+#define DSC_SCALE_INITIAL               0x018
+#define DSC_SCALE_DEC_INTERVAL          0x01C
+#define DSC_SCALE_INC_INTERVAL          0x020
+#define DSC_FIRST_LINE_BPG_OFFSET       0x024
+#define DSC_BPG_OFFSET                  0x028
+#define DSC_DSC_OFFSET                  0x02C
+#define DSC_FLATNESS                    0x030
+#define DSC_RC_MODEL_SIZE               0x034
+#define DSC_RC                          0x038
+#define DSC_RC_BUF_THRESH               0x03C
+#define DSC_RANGE_MIN_QP                0x074
+#define DSC_RANGE_MAX_QP                0x0B0
+#define DSC_RANGE_BPG_OFFSET            0x0EC
+
+static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
+{
+	struct dpu_hw_blk_reg_map *c = &dsc->hw;
+
+	DPU_REG_WRITE(c, DSC_COMMON_MODE, 0);
+}
+
+static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
+			      struct msm_display_dsc_config *dsc,
+			      u32 mode,
+			      u32 initial_lines)
+{
+	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
+	u32 data, lsb, bpp;
+	u32 slice_last_group_size;
+	u32 det_thresh_flatness;
+	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
+
+	DPU_REG_WRITE(c, DSC_COMMON_MODE, mode);
+
+	if (is_cmd_mode)
+		initial_lines += 1;
+
+	slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
+	data = (initial_lines << 20);
+	data |= ((slice_last_group_size - 1) << 18);
+	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
+	data |= dsc->drm->bits_per_pixel << 12;
+	lsb = dsc->drm->bits_per_pixel % 4;
+	bpp = dsc->drm->bits_per_pixel / 4;
+	bpp *= 4;
+	bpp <<= 4;
+	bpp |= lsb;
+
+	data |= bpp << 8;
+	data |= (dsc->drm->block_pred_enable << 7);
+	data |= (dsc->drm->line_buf_depth << 3);
+	data |= (dsc->drm->simple_422 << 2);
+	data |= (dsc->drm->convert_rgb << 1);
+	data |= dsc->drm->bits_per_component;
+
+	DPU_REG_WRITE(c, DSC_ENC, data);
+
+	data = dsc->drm->pic_width << 16;
+	data |= dsc->drm->pic_height;
+	DPU_REG_WRITE(c, DSC_PICTURE, data);
+
+	data = dsc->drm->slice_width << 16;
+	data |= dsc->drm->slice_height;
+	DPU_REG_WRITE(c, DSC_SLICE, data);
+
+	data = dsc->drm->slice_chunk_size << 16;
+	DPU_REG_WRITE(c, DSC_CHUNK_SIZE, data);
+
+	data = dsc->drm->initial_dec_delay << 16;
+	data |= dsc->drm->initial_xmit_delay;
+	DPU_REG_WRITE(c, DSC_DELAY, data);
+
+	data = dsc->drm->initial_scale_value;
+	DPU_REG_WRITE(c, DSC_SCALE_INITIAL, data);
+
+	data = dsc->drm->scale_decrement_interval;
+	DPU_REG_WRITE(c, DSC_SCALE_DEC_INTERVAL, data);
+
+	data = dsc->drm->scale_increment_interval;
+	DPU_REG_WRITE(c, DSC_SCALE_INC_INTERVAL, data);
+
+	data = dsc->drm->first_line_bpg_offset;
+	DPU_REG_WRITE(c, DSC_FIRST_LINE_BPG_OFFSET, data);
+
+	data = dsc->drm->nfl_bpg_offset << 16;
+	data |= dsc->drm->slice_bpg_offset;
+	DPU_REG_WRITE(c, DSC_BPG_OFFSET, data);
+
+	data = dsc->drm->initial_offset << 16;
+	data |= dsc->drm->final_offset;
+	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
+
+	det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
+	data = det_thresh_flatness << 10;
+	data |= dsc->drm->flatness_max_qp << 5;
+	data |= dsc->drm->flatness_min_qp;
+	DPU_REG_WRITE(c, DSC_FLATNESS, data);
+
+	data = dsc->drm->rc_model_size;
+	DPU_REG_WRITE(c, DSC_RC_MODEL_SIZE, data);
+
+	data = dsc->drm->rc_tgt_offset_low << 18;
+	data |= dsc->drm->rc_tgt_offset_high << 14;
+	data |= dsc->drm->rc_quant_incr_limit1 << 9;
+	data |= dsc->drm->rc_quant_incr_limit0 << 4;
+	data |= dsc->drm->rc_edge_factor;
+	DPU_REG_WRITE(c, DSC_RC, data);
+}
+
+static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
+				     struct msm_display_dsc_config *dsc)
+{
+	struct drm_dsc_rc_range_parameters *rc = dsc->drm->rc_range_params;
+	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
+	u32 off;
+	int i;
+
+	off = DSC_RC_BUF_THRESH;
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++) {
+		DPU_REG_WRITE(c, off, dsc->drm->rc_buf_thresh[i]);
+		off += 4;
+	}
+
+	off = DSC_RANGE_MIN_QP;
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		DPU_REG_WRITE(c, off, rc[i].range_min_qp);
+		off += 4;
+	}
+
+	off = DSC_RANGE_MAX_QP;
+	for (i = 0; i < 15; i++) {
+		DPU_REG_WRITE(c, off, rc[i].range_max_qp);
+		off += 4;
+	}
+
+	off = DSC_RANGE_BPG_OFFSET;
+	for (i = 0; i < 15; i++) {
+		DPU_REG_WRITE(c, off, rc[i].range_bpg_offset);
+		off += 4;
+	}
+}
+
+static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
+				       struct dpu_mdss_cfg *m,
+				       void __iomem *addr,
+				       struct dpu_hw_blk_reg_map *b)
+{
+	int i;
+
+	for (i = 0; i < m->dsc_count; i++) {
+		if (dsc == m->dsc[i].id) {
+			b->base_off = addr;
+			b->blk_off = m->dsc[i].base;
+			b->length = m->dsc[i].len;
+			b->hwversion = m->hwversion;
+			b->log_mask = DPU_DBG_MASK_DSC;
+			return &m->dsc[i];
+		}
+	}
+
+	return NULL;
+}
+
+static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
+			   unsigned long cap)
+{
+	ops->dsc_disable = dpu_hw_dsc_disable;
+	ops->dsc_config = dpu_hw_dsc_config;
+	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
+};
+
+struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
+				   struct dpu_mdss_cfg *m)
+{
+	struct dpu_hw_dsc *c;
+	struct dpu_dsc_cfg *cfg;
+
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	cfg = _dsc_offset(idx, m, addr, &c->hw);
+	if (IS_ERR_OR_NULL(cfg)) {
+		kfree(c);
+		return ERR_PTR(-EINVAL);
+	}
+
+	c->idx = idx;
+	c->caps = cfg;
+	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	return c;
+}
+
+void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc)
+{
+	kfree(dsc);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
new file mode 100644
index 000000000000..164e5f5b1002
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020-2022, Linaro Limited */
+
+#ifndef _DPU_HW_DSC_H
+#define _DPU_HW_DSC_H
+
+#include <drm/drm_dsc.h>
+
+#define DSC_MODE_SPLIT_PANEL            BIT(0)
+#define DSC_MODE_MULTIPLEX              BIT(1)
+#define DSC_MODE_VIDEO                  BIT(2)
+
+struct dpu_hw_dsc;
+
+/**
+ * struct dpu_hw_dsc_ops - interface to the dsc hardware driver functions
+ * Assumption is these functions will be called after clocks are enabled
+ */
+struct dpu_hw_dsc_ops {
+	/**
+	 * dsc_disable - disable dsc
+	 * @hw_dsc: Pointer to dsc context
+	 */
+	void (*dsc_disable)(struct dpu_hw_dsc *hw_dsc);
+
+	/**
+	 * dsc_config - configures dsc encoder
+	 * @hw_dsc: Pointer to dsc context
+	 * @dsc: panel dsc parameters
+	 * @mode: dsc topology mode to be set
+	 * @initial_lines: amount of initial lines to be used
+	 */
+	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
+			   struct msm_display_dsc_config *dsc,
+			   u32 mode,
+			   u32 initial_lines);
+
+	/**
+	 * dsc_config_thresh - programs panel thresholds
+	 * @hw_dsc: Pointer to dsc context
+	 * @dsc: panel dsc parameters
+	 */
+	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
+				  struct msm_display_dsc_config *dsc);
+};
+
+struct dpu_hw_dsc {
+	struct dpu_hw_blk base;
+	struct dpu_hw_blk_reg_map hw;
+
+	/* dsc */
+	enum dpu_dsc idx;
+	const struct dpu_dsc_cfg *caps;
+
+	/* ops */
+	struct dpu_hw_dsc_ops ops;
+};
+
+/**
+ * dpu_hw_dsc_init - initializes the dsc block for the passed dsc idx.
+ * @idx:  DSC index for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * @m:    Pointer to mdss catalog data
+ * Returns: Error code or allocated dpu_hw_dsc context
+ */
+struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
+				   struct dpu_mdss_cfg *m);
+
+/**
+ * dpu_hw_dsc_destroy - destroys dsc driver context
+ * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
+ */
+void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
+
+static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_dsc, base);
+}
+
+#endif /* _DPU_HW_DSC_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..b0ce8cb97d22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -97,6 +97,7 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_WB,
 	DPU_HW_BLK_DSPP,
 	DPU_HW_BLK_MERGE_3D,
+	DPU_HW_BLK_DSC,
 	DPU_HW_BLK_MAX,
 };
 
@@ -176,6 +177,17 @@ enum dpu_ctl {
 	CTL_MAX
 };
 
+enum dpu_dsc {
+	DSC_NONE = 0,
+	DSC_0,
+	DSC_1,
+	DSC_2,
+	DSC_3,
+	DSC_4,
+	DSC_5,
+	DSC_MAX
+};
+
 enum dpu_pingpong {
 	PINGPONG_0 = 1,
 	PINGPONG_1,
@@ -437,5 +449,6 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_VBIF     (1 << 8)
 #define DPU_DBG_MASK_ROT      (1 << 9)
 #define DPU_DBG_MASK_DSPP     (1 << 10)
+#define DPU_DBG_MASK_DSC      (1 << 11)
 
 #endif  /* _DPU_HW_MDSS_H */
-- 
2.34.1

