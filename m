Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B353BAB795
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5010E4D0;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="HKeTS5a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037610E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:11 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035656epoutp03aab0340e5582f1152876ca4fada97798~p80cwmIWc3045230452epoutp03i
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035656epoutp03aab0340e5582f1152876ca4fada97798~p80cwmIWc3045230452epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204616;
 bh=ETNz1qi8jzlIkhnJIGvK2dh55eK+c1AzYhvuRmECjc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HKeTS5a8LJLYe6PMFk2uh5NSYdYkEtZX42+XyrlKYo4xNRCVRNjhHhXZGi0zZbmWk
 fHXC5m49myfEoOHg9mFCWrtUmhCW7i1/jcHxQTqSluGfdcWXr+tfUhCUjNNu1qXwHu
 YtDMh25SwGm61fRSSZfQQbTDlfyBZCzsDhRtVUCA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035656epcas5p1e07ca6fe54967c2515c169f609a4e41d~p80cakZGG2306123061epcas5p18;
 Tue, 30 Sep 2025 03:56:56 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPPz0rxjz2SSKf; Tue, 30 Sep
 2025 03:56:55 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035654epcas5p1cbb6f3d0fe0dd25758085d041f020846~p80a4O6FG1575615756epcas5p1b;
 Tue, 30 Sep 2025 03:56:54 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035651epsmtip111276e49f91b36a99e9a1ea266ec2280~p80YQC8ka2938529385epsmtip1k;
 Tue, 30 Sep 2025 03:56:51 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 23/29] media: mfc: Add encoder parameters, ROI & QoS support
Date: Tue, 30 Sep 2025 09:33:42 +0530
Message-Id: <20250930040348.3702923-24-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035654epcas5p1cbb6f3d0fe0dd25758085d041f020846
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035654epcas5p1cbb6f3d0fe0dd25758085d041f020846
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035654epcas5p1cbb6f3d0fe0dd25758085d041f020846@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

- Introduce a generic encoder‑parameter framework
  (slice mode, ASO order, QP config, timestamp delta).
- Expose full V4L2 encoder controls (frame tag, RC limits,
  level/profile, ROI, weighted prediction, hierarchical coding).
- Implemente ROI handling by building ROI registers from
  per‑buffer data.
- Update encoder resource manager: fixed core integration,
  excluded from migration/load‑balancing, ensured proper
  finalization per buffer type, and add encoder‑specific
  QoS step table.
- Disable bitrate‑driven load‑balancing for encoders;
  framerate updates now apply only to non‑encoder contexts.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   2 +-
 .../samsung/exynos-mfc/mfc_core_enc_param.c   | 848 ++++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_enc_param.h   |  23 +
 .../samsung/exynos-mfc/mfc_ctx_ctrl.c         | 803 +++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_rm.c      |  89 +-
 .../platform/samsung/exynos-mfc/mfc_rm.h      |   2 +
 6 files changed, 1755 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index b6b312ae7f22..a257d5b0a576 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -13,7 +13,7 @@ exynos_mfc-y += mfc_core_hwlock.o mfc_core_intlock.o mfc_core_run.o
 exynos_mfc-y += mfc_core_pm.o
 exynos_mfc-y += mfc_core_sync.o mfc_core_sched_prio.o
 #Core HW access layer
-exynos_mfc-y += mfc_core_buf_ctrl.o mfc_core_cmd.o
+exynos_mfc-y += mfc_core_enc_param.o mfc_core_buf_ctrl.o mfc_core_cmd.o
 exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
 #Plugin interface layer
 #Plugin control layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
new file mode 100644
index 000000000000..9ff949df04ab
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
@@ -0,0 +1,848 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_enc_param.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_enc_param.h"
+
+#include "mfc_core_reg_api.h"
+
+/* Definition */
+#define VBR_BIT_SAVE			20
+#define CBR_FIX_MAX			10
+#define CBR_I_LIMIT_WFD			6
+#define CBR_I_LIMIT_MAX			5
+
+static int mfc_transfer_to_rgb_format_ctrl[][2] = {
+	{ MFC_TRANSFER_RESERVED,	1},
+	{ MFC_TRANSFER_BT709,		1},
+	{ MFC_TRANSFER_UNSPECIFIED,	1},
+	{ MFC_TRANSFER_RESERVED,	1},
+	{ MFC_TRANSFER_GAMMA_22,	1},
+	{ MFC_TRANSFER_GAMMA_28,	1},
+	{ MFC_TRANSFER_SMPTE_170M,	0},
+	{ MFC_TRANSFER_SMPTE_240M,	1},
+	{ MFC_TRANSFER_LINEAR,		1},
+	{ MFC_TRANSFER_LOGARITHMIC,	1},
+	{ MFC_TRANSFER_LOGARITHMIC_S,	1},
+	{ MFC_TRANSFER_XvYCC,		1},
+	{ MFC_TRANSFER_BT1361,		1},
+	{ MFC_TRANSFER_SRGB,		1},
+	{ MFC_TRANSFER_BT2020_1,	1},
+	{ MFC_TRANSFER_BT2020_2,	1},
+	{ MFC_TRANSFER_ST2084,		1},
+	{ MFC_TRANSFER_ST428,		1},
+	{ MFC_TRANSFER_HLG,		1},
+};
+
+void mfc_core_set_slice_mode(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+
+	/* multi-slice control */
+	if (enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES)
+		MFC_CORE_RAW_WRITEL((enc->slice_mode + 0x4), MFC_REG_E_MSLICE_MODE);
+	else if (enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB_ROW)
+		MFC_CORE_RAW_WRITEL((enc->slice_mode - 0x2), MFC_REG_E_MSLICE_MODE);
+	else if (enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_FIXED_BYTES)
+		MFC_CORE_RAW_WRITEL((enc->slice_mode + 0x3), MFC_REG_E_MSLICE_MODE);
+	else
+		MFC_CORE_RAW_WRITEL(enc->slice_mode, MFC_REG_E_MSLICE_MODE);
+
+	/* multi-slice MB number or bit size */
+	if (enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB ||
+	    enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB_ROW) {
+		MFC_CORE_RAW_WRITEL(enc->slice_size_mb, MFC_REG_E_MSLICE_SIZE_MB);
+	} else if (enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES ||
+		   enc->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_FIXED_BYTES) {
+		MFC_CORE_RAW_WRITEL(enc->slice_size_bits, MFC_REG_E_MSLICE_SIZE_BITS);
+	} else {
+		MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_MSLICE_SIZE_MB);
+		MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_MSLICE_SIZE_BITS);
+	}
+}
+
+void mfc_core_set_aso_slice_order_h264(struct mfc_core *core,
+				       struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_h264_enc_params *p_264 = &p->codec.h264;
+	int i;
+
+	if (p_264->aso_enable) {
+		for (i = 0; i < 8; i++)
+			MFC_CORE_RAW_WRITEL
+				(p_264->aso_slice_order[i],
+				 MFC_REG_E_H264_ASO_SLICE_ORDER_0 + i * 4);
+	}
+}
+
+void mfc_core_set_enc_config_qp(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0;
+
+	if (!p->rc_frame && !p->rc_mb && p->dynamic_qp) {
+		reg = MFC_CORE_READL(MFC_REG_E_FIXED_PICTURE_QP);
+		reg &= ~(0xFF000000);
+		reg |= (enc->config_qp & 0xFF) << 24;
+		MFC_CORE_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+	}
+}
+
+void mfc_core_set_enc_ts_delta(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0;
+	int ts_delta;
+
+	ts_delta = mfc_enc_get_ts_delta(ctx);
+
+	reg = MFC_CORE_READL(MFC_REG_E_TIME_STAMP_DELTA);
+	reg &= ~(0xFFFF);
+	reg |= (ts_delta & 0xFFFF);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_TIME_STAMP_DELTA);
+	if (ctx->src_ts.ts_last_interval)
+		mfc_ctx_debug(3, "[DFR] fps %d -> %ld, delta: %d, reg: %#x\n",
+			      p->rc_framerate, USEC_PER_SEC / ctx->src_ts.ts_last_interval,
+			      ts_delta, reg);
+	else
+		mfc_ctx_debug(3, "[DFR] fps %d -> 0, delta: %d, reg: %#x\n",
+			      p->rc_framerate, ts_delta, reg);
+}
+
+static void __mfc_set_gop_size(struct mfc_core *core,
+			       struct mfc_ctx *ctx,
+			       int ctrl_mode)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0;
+
+	if (ctrl_mode) {
+		p->i_frm_ctrl_mode = 1;
+		/*
+		 * gop_ctrl 1: gop_size means the I frame interval
+		 * gop_ctrl 0: gop_size means the number of P frames.
+		 */
+		if (p->gop_ctrl) {
+			p->i_frm_ctrl = p->gop_size;
+		} else {
+			p->i_frm_ctrl = p->gop_size * (p->num_b_frame + 1);
+			if (p->i_frm_ctrl >= 0x3FFFFFFF) {
+				mfc_ctx_info("I frame interval is bigger than max: %d\n",
+					     p->i_frm_ctrl);
+				p->i_frm_ctrl = 0x3FFFFFFF;
+			}
+		}
+	} else {
+		p->i_frm_ctrl_mode = 0;
+		p->i_frm_ctrl = p->gop_size;
+	}
+
+	mfc_ctx_debug(2, "I frame interval: %d, (P: %d, B: %d), ctrl mode: %d, gop ctrl: %d\n",
+		      p->i_frm_ctrl,
+		      p->gop_ctrl ? (p->gop_size / (p->num_b_frame + 1)) : p->gop_size,
+		      p->num_b_frame, p->i_frm_ctrl_mode, p->gop_ctrl);
+
+	/* pictype : IDR period, number of B */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_GOP_CONFIG);
+	mfc_clear_set_bits(reg, 0xFFFF, 0, p->i_frm_ctrl);
+	mfc_clear_set_bits(reg, 0x1, 19, p->i_frm_ctrl_mode);
+	/* if B frame is used, the performance falls by half */
+	mfc_clear_set_bits(reg, 0x3, 16, p->num_b_frame);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_GOP_CONFIG);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_GOP_CONFIG2);
+	mfc_clear_set_bits(reg, 0x3FFF, 0, (p->i_frm_ctrl >> 16));
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_GOP_CONFIG2);
+}
+
+static void __mfc_set_default_params(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	int i;
+
+	mfc_ctx_debug(2, "Set default param -  enc_param_num: %d\n",
+		      dev->pdata->enc_param_num);
+	for (i = 0; i < dev->pdata->enc_param_num; i++) {
+		if (i >= MFC_MAX_DEFAULT_PARAM) {
+			mfc_ctx_err("enc_param_num(%d) is over max number(%d)\n",
+				    dev->pdata->enc_param_num,
+				    MFC_MAX_DEFAULT_PARAM);
+			break;
+		}
+		MFC_CORE_RAW_WRITEL
+			(dev->pdata->enc_param_val[i], dev->pdata->enc_param_addr[i]);
+		mfc_ctx_debug(2, "Set default param[%d] - addr:0x%x, val:0x%x\n",
+			      i, dev->pdata->enc_param_addr[i],
+			      dev->pdata->enc_param_val[i]);
+	}
+}
+
+static void __mfc_init_regs(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	/* Register initialization */
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_FRAME_INSERTION);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_ROI_BUFFER_ADDR);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_PARAM_CHANGE);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_PICTURE_TAG);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_METADATA_BUFFER_ADDR);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_METADATA_BUFFER_SIZE);
+}
+
+static int __mfc_get_rgb_format_ctrl(struct mfc_ctx *ctx, struct mfc_enc_params *p)
+{
+	int ret = 0;
+
+	/*
+	 * User set color VUI information as below regardless of the standard.
+	 * ---------------------------------------------
+	 *	    VP9		 |	others
+	 * ----------------------|----------------------
+	 *   color space only	 | primaries, transfer
+	 * (primaries interface) |	,matrix
+	 * ---------------------------------------------
+	 * However, in case of RGB encoding, the F/W need to know
+	 * which to use RGB pixel format transform characteristic.
+	 * So, driver converts it based on the user's VUI information.
+	 * Return value
+	 *  0: ITU-R BT.601
+	 *  1: ITU-R BT.709
+	 * If Set to 3, use the coefficients of CSC formula determined by firmware
+	 * on COLOR_SPACE and COLOUR_PRIMARIES of E_VIDEO_SIGNAL_TYPE.
+	 *  3: Determined by firmware
+	 */
+
+	if (ctx->dev->pdata->enc_rgb_csc_by_fw) {
+		ret = 3;
+		mfc_ctx_debug(2, "[RGB] coefficients of CSC formula using VUI by F/W\n");
+	} else {
+		ret = mfc_transfer_to_rgb_format_ctrl[p->transfer_characteristics][1];
+		mfc_ctx_debug(2, "[RGB] transfer %d converts to RGB format ctrl %s\n",
+			      p->transfer_characteristics, ret ? "BT.709" : "BT.601");
+	}
+
+	return ret;
+}
+
+static void __mfc_set_video_signal_type(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0;
+
+	if ((ctx->src_fmt->type & MFC_FMT_RGB) && !dev->pdata->enc_rgb_csc_by_fw) {
+		/* VIDEO_SIGNAL_TYPE_FLAG */
+		mfc_set_bits(reg, 0x1, 31, 0x1);
+		/* COLOUR_DESCRIPTION_PRESENT_FLAG */
+		mfc_set_bits(reg, 0x1, 24, 0x1);
+	} else if (MFC_FEATURE_SUPPORT(dev, dev->pdata->color_aspect_enc) &&
+		   p->check_color_range) {
+		/* VIDEO_SIGNAL_TYPE_FLAG */
+		mfc_set_bits(reg, 0x1, 31, 0x1);
+		/* COLOR_RANGE */
+		if (!(ctx->src_fmt->type & MFC_FMT_RGB))
+			mfc_set_bits(reg, 0x1, 25, p->color_range);
+
+		if (p->colour_primaries &&
+		    p->transfer_characteristics &&
+		    p->matrix_coefficients != 3) {
+			/* COLOUR_DESCRIPTION_PRESENT_FLAG */
+			mfc_set_bits(reg, 0x1, 24, 0x1);
+			/* COLOUR_PRIMARIES */
+			mfc_set_bits(reg, 0xFF, 16, p->colour_primaries);
+			/* TRANSFER_CHARACTERISTICS */
+			mfc_set_bits(reg, 0xFF, 8, p->transfer_characteristics);
+			/* MATRIX_COEFFICIENTS */
+			mfc_set_bits(reg, 0xFF, 0, p->matrix_coefficients);
+		}
+		mfc_ctx_debug(2, "[HDR] %s ENC Color aspect: range(%s), pri(%d), trans(%d), mat(%d)\n",
+			      "H264",
+			      p->color_range ? "Full" : "Limited", p->colour_primaries,
+			      p->transfer_characteristics, p->matrix_coefficients);
+	}
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VIDEO_SIGNAL_TYPE);
+}
+
+static void __mfc_set_enc_params(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0;
+	unsigned int fps = ctx->operating_framerate / 1000;
+
+	mfc_ctx_debug_enter();
+
+	__mfc_init_regs(core, ctx);
+	__mfc_set_default_params(core, ctx);
+
+	/* width */
+	MFC_CORE_RAW_WRITEL(ctx->crop_width, MFC_REG_E_CROPPED_FRAME_WIDTH);
+	/* height */
+	MFC_CORE_RAW_WRITEL(ctx->crop_height, MFC_REG_E_CROPPED_FRAME_HEIGHT);
+	/* cropped offset */
+	mfc_set_bits(reg, MFC_REG_E_FRAME_CROP_OFFSET_MASK,
+		     MFC_REG_E_FRAME_CROP_OFFSET_LEFT, ctx->crop_left);
+	mfc_set_bits(reg, MFC_REG_E_FRAME_CROP_OFFSET_MASK,
+		     MFC_REG_E_FRAME_CROP_OFFSET_TOP, ctx->crop_top);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FRAME_CROP_OFFSET);
+
+	/* multi-slice control */
+	/* multi-slice MB number or bit size */
+	enc->slice_mode = p->slice_mode;
+
+	if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		enc->slice_size_mb = p->slice_mb;
+	} else if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES ||
+		   p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_FIXED_BYTES) {
+		enc->slice_size_bits = p->slice_bit;
+	} else if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB_ROW) {
+		enc->slice_size_mb = p->slice_mb_row * ((ctx->crop_width + 15) / 16);
+	} else {
+		enc->slice_size_mb = 0;
+		enc->slice_size_bits = 0;
+	}
+
+	mfc_core_set_slice_mode(core, ctx);
+
+	/* config qp */
+	enc->config_qp = p->config_qp;
+
+	/* cyclic intra refresh */
+	MFC_CORE_RAW_WRITEL(p->intra_refresh_mb, MFC_REG_E_IR_SIZE);
+
+	mfc_core_set_pixel_format(core, ctx, ctx->src_fmt->fourcc);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_ENC_OPTIONS);
+	/* frame skip mode */
+	mfc_clear_set_bits(reg, 0x3, 0, p->frame_skip_mode);
+	/* seq header ctrl */
+	mfc_clear_set_bits(reg, 0x1, 2, p->seq_hdr_mode);
+	/* cyclic intra refresh */
+	mfc_clear_bits(reg, 0x1, 4);
+	if (p->intra_refresh_mb)
+		mfc_set_bits(reg, 0x1, 4, 0x1);
+	/* disable seq header generation if OTF mode */
+	mfc_clear_bits(reg, 0x1, 6);
+
+	/* 'NON_REFERENCE_STORE_ENABLE' for debugging */
+	mfc_clear_bits(reg, 0x1, 9);
+
+	/* Predict motion search mode */
+	mfc_clear_set_bits(reg, 0x3, 22, p->mv_search_mode);
+
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_ENC_OPTIONS);
+
+	if (p->mv_hor_range) {
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_MV_HOR_RANGE);
+		mfc_clear_set_bits(reg, 0x3fff, 0, p->mv_hor_range);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_MV_HOR_RANGE);
+	}
+	if (p->mv_ver_range) {
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_MV_VER_RANGE);
+		mfc_clear_set_bits(reg, 0x3fff, 0, p->mv_ver_range);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_MV_VER_RANGE);
+	}
+
+	if (p->mv_search_mode == 2) {
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_MV_HOR_RANGE);
+		mfc_clear_set_bits(reg, 0xff, 16, p->mv_hor_pos_l0);
+		mfc_clear_set_bits(reg, 0xff, 24, p->mv_hor_pos_l1);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_MV_HOR_RANGE);
+
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_MV_VER_RANGE);
+		mfc_clear_set_bits(reg, 0xff, 16, p->mv_ver_pos_l0);
+		mfc_clear_set_bits(reg, 0xff, 24, p->mv_ver_pos_l1);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_MV_VER_RANGE);
+		mfc_ctx_debug(2, "MV search mode(%d), HOR (L0: %d, L1: %d), VER (L0: %d, L1: %d)\n",
+			      p->mv_search_mode,
+			      p->mv_hor_pos_l0, p->mv_hor_pos_l1,
+			      p->mv_ver_pos_l0, p->mv_ver_pos_l1);
+	}
+
+	if (ctx->src_fmt->type & MFC_FMT_RGB) {
+		reg = MFC_CORE_RAW_READL(MFC_REG_PIXEL_FORMAT);
+		mfc_clear_set_bits(reg, 0x1, 8, p->color_range);
+		mfc_clear_set_bits(reg, 0x3, 6, __mfc_get_rgb_format_ctrl(ctx, p));
+		mfc_ctx_debug(2, "[RGB] enc color_range %d, primaries %d, transfer %d\n",
+			      p->color_range, p->colour_primaries,
+			      p->transfer_characteristics);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_PIXEL_FORMAT);
+	}
+
+	/* padding control & value */
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_PADDING_CTRL);
+	if (p->pad) {
+		reg = 0;
+		/** enable */
+		mfc_set_bits(reg, 0x1, 31, 0x1);
+		/** cr value */
+		mfc_set_bits(reg, 0xFF, 16, p->pad_cr);
+		/** cb value */
+		mfc_set_bits(reg, 0xFF, 8, p->pad_cb);
+		/** y value */
+		mfc_set_bits(reg, 0xFF, 0, p->pad_luma);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PADDING_CTRL);
+	}
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/* macroblock level rate control */
+	mfc_clear_set_bits(reg, 0x1, 8, p->rc_mb);
+	/* frame-level rate control */
+	mfc_clear_set_bits(reg, 0x1, 9, p->rc_frame);
+	/* drop control */
+	mfc_clear_set_bits(reg, 0x1, 10, p->drop_control);
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->enc_ts_delta))
+		mfc_clear_set_bits(reg, 0x1, 20, 1);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/*
+	 * Delta value for framerate is timestamp(ms * 10) diff.
+	 * ex) 30fps: 333, 60fps: 166
+	 * Resolution unit is most sophisticated value
+	 * that can be determined within 16bit.
+	 * F/W calculates fps through resolution / delta.
+	 * ex) 10000 / 166 = 60fps
+	 */
+	p->rc_frame_delta = p->rc_framerate_res / p->rc_framerate;
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_FRAME_RATE);
+	mfc_clear_set_bits(reg, 0xFFFF, 16, p->rc_framerate_res);
+	mfc_clear_set_bits(reg, 0xFFFF, 0, p->rc_frame_delta);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_FRAME_RATE);
+
+	/* bit rate */
+	ctx->kbps = p->rc_bitrate / SZ_1K;
+	MFC_CORE_RAW_WRITEL(p->rc_bitrate, MFC_REG_E_RC_BIT_RATE);
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->max_i_frame_size)) {
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_OPTIONS);
+		mfc_clear_set_bits(reg, 0xFFFF, 0, p->max_i_frame_size);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_OPTIONS);
+	}
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_MODE);
+	mfc_clear_bits(reg, 0x7, 0);
+	mfc_clear_bits(reg, 0x3, 4);
+	mfc_clear_bits(reg, 0xFF, 8);
+	if (p->rc_frame) {
+		if (p->rc_reaction_coeff <= CBR_I_LIMIT_MAX) {
+			mfc_set_bits(reg, 0x7, 0, MFC_REG_E_RC_CBR_I_LIMIT_VT);
+			/*
+			 * Ratio of intra for max frame size
+			 * is controlled when only CBR_I_LIMIT_VT mode.
+			 * And CBR_I_LIMIT_VT mode is valid for H.264, HEVC codec
+			 */
+			if (p->ratio_intra)
+				mfc_set_bits(reg, 0xFF, 8, p->ratio_intra);
+		} else if (p->rc_reaction_coeff <= CBR_FIX_MAX) {
+			if (MFC_FEATURE_SUPPORT(dev, dev->pdata->wfd_rc_mode) &&
+			    p->rc_reaction_coeff <= CBR_I_LIMIT_WFD) {
+				mfc_set_bits(reg, 0x7, 0, MFC_REG_E_RC_CBR_I_LIMIT_WFD);
+			} else {
+				mfc_set_bits(reg, 0x7, 0, MFC_REG_E_RC_CBR_FIX);
+			}
+		} else {
+			if (MFC_FEATURE_SUPPORT(dev, dev->pdata->wfd_rc_mode) &&
+			    p->rc_reaction_coeff <= VBR_BIT_SAVE) {
+				mfc_set_bits(reg, 0x7, 0, MFC_REG_E_RC_VBR_BS);
+			} else {
+				mfc_set_bits(reg, 0x7, 0, MFC_REG_E_RC_VBR);
+			}
+		}
+
+		if (p->rc_mb)
+			mfc_set_bits(reg, 0x3, 4, p->rc_pvc);
+	}
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->min_quality_mode) && p->min_quality_mode) {
+		mfc_set_bits(reg, 0x1, 7, p->min_quality_mode);
+		mfc_ctx_debug(2, "MIN quality mode is enabled\n");
+	}
+
+	mfc_ctx_debug(3, "RC_MODE) rc coeff: %d, wfd_rc_mode: %d, rc_mode: %#x, max I size: %d\n",
+		      p->rc_reaction_coeff,
+		      MFC_FEATURE_SUPPORT(dev, dev->pdata->wfd_rc_mode),
+		      reg, p->max_i_frame_size);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_MODE);
+
+	/* high quality mode */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_HIGH_QUALITY_MODE);
+	if (p->wp_two_pass_enable) {
+		mfc_clear_set_bits(reg, 0x1, 0, p->wp_two_pass_enable);
+		mfc_ctx_debug(2, "WP two pass encoding is enabled\n");
+	}
+	if (p->adaptive_gop_enable) {
+		mfc_clear_set_bits(reg, 0x1, 4, p->adaptive_gop_enable);
+		mfc_ctx_debug(2, "Adaptive gop is enabled\n");
+	}
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_HIGH_QUALITY_MODE);
+
+	/* extended encoder ctrl */
+	/** vbv buffer size */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_VBV_BUFFER_SIZE);
+	mfc_clear_bits(reg, 0xFF, 0);
+	if (p->frame_skip_mode == V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)
+		mfc_set_bits(reg, 0xFF, 0, p->vbv_buf_size);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_VBV_BUFFER_SIZE);
+
+	/* Video signal type */
+	__mfc_set_video_signal_type(core, ctx);
+
+	/* Check performance decrease options */
+	if (!fps)
+		fps = p->rc_framerate;
+	if (IS_MFC_MAX_PERF(ctx, fps)) {
+		if (mfc_is_enc_bframe(ctx)) {
+			p->num_b_frame = 0;
+			if (IS_H264_ENC(ctx))
+				p->codec.h264.hier_qp_type =
+					V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P;
+			mfc_ctx_info("forcely can't be use B frame for 8K or 4K %d fps\n", fps);
+		}
+		if (p->num_refs_for_p > 1) {
+			p->num_refs_for_p = 1;
+			mfc_ctx_info("forcely use 1-ref frame for 8K or 4K %d fps\n", fps);
+		}
+	}
+
+	mfc_ctx_debug_leave();
+}
+
+static void __mfc_set_temporal_svc_h264(struct mfc_core *core,
+					struct mfc_ctx *ctx,
+					struct mfc_h264_enc_params *p_264)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	unsigned int reg = 0, reg2 = 0;
+	int i;
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_OPTIONS_2);
+	/* pic_order_cnt_type = 0 for backward compatibilities */
+	mfc_clear_bits(reg, 0x3, 0);
+	/* Enable LTR */
+	mfc_clear_bits(reg, 0x1, 2);
+	if ((p_264->enable_ltr & 0x1) || p_264->num_of_ltr > 0)
+		mfc_set_bits(reg, 0x1, 2, 0x1);
+	/* Number of LTR */
+	mfc_clear_bits(reg, 0x3, 7);
+	if (p_264->num_of_ltr > 2)
+		mfc_set_bits(reg, 0x3, 7, (p_264->num_of_ltr - 2));
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_OPTIONS_2);
+
+	/* Temporal SVC - qp type, layer number */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_NUM_T_LAYER);
+	mfc_clear_set_bits(reg, 0x1, 3, p_264->hier_qp_type);
+	mfc_clear_set_bits(reg, 0x7, 0, p_264->num_hier_layer);
+	mfc_clear_bits(reg, 0x7, 4);
+	if (p_264->hier_ref_type) {
+		mfc_set_bits(reg, 0x1, 7, 0x1);
+		mfc_set_bits(reg, 0x7, 4, p->num_hier_max_layer);
+	} else {
+		mfc_clear_bits(reg, 0x1, 7);
+		mfc_set_bits(reg, 0x7, 4, p_264->num_hier_layer);
+	}
+	mfc_clear_set_bits(reg, 0x1, 8, p->hier_bitrate_ctrl);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_NUM_T_LAYER);
+	mfc_ctx_debug(3, "[HIERARCHICAL] hier_qp_enable %d, enable_ltr %d",
+		      p_264->hier_qp_enable, p_264->enable_ltr);
+	mfc_ctx_debug(3, "num_hier_layer %d, max_layer %d, hier_ref_type %d, NUM_T_LAYER 0x%x\n",
+		      p_264->num_hier_layer, p->num_hier_max_layer, p_264->hier_ref_type, reg);
+
+	/* QP & Bitrate for each layer */
+	for (i = 0; i < 7; i++) {
+		MFC_CORE_RAW_WRITEL
+			(p_264->hier_qp_layer[i],
+			 MFC_REG_E_HIERARCHICAL_QP_LAYER0 + i * 4);
+		/* If hier_bitrate_ctrl is set to 1, this is meaningless */
+		MFC_CORE_RAW_WRITEL
+			(p_264->hier_bit_layer[i],
+			 MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0 + i * 4);
+		mfc_ctx_debug(3, "[HIERARCHICAL] layer[%d] QP: %#x, bitrate: %d(FW ctrl: %d)\n",
+			      i, p_264->hier_qp_layer[i],
+			      p_264->hier_bit_layer[i], p->hier_bitrate_ctrl);
+	}
+	if (p_264->set_priority) {
+		reg = 0;
+		reg2 = 0;
+		for (i = 0; i < (p_264->num_hier_layer & 0x7); i++) {
+			if (i <= 4)
+				mfc_set_bits(reg, 0x3F, (6 * i), (p_264->base_priority + i));
+			else
+				mfc_set_bits(reg2, 0x3F, (6 * (i - 5)), (p_264->base_priority + i));
+		}
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_HD_SVC_EXTENSION_0);
+		MFC_CORE_RAW_WRITEL(reg2, MFC_REG_E_H264_HD_SVC_EXTENSION_1);
+		mfc_ctx_debug(3, "[HIERARCHICAL] priority EXTENSION0: %#x, EXTENSION1: %#x\n",
+			      reg, reg2);
+	}
+}
+
+static void __mfc_set_fmo_slice_map_h264(struct mfc_core *core,
+					 struct mfc_ctx *ctx,
+					 struct mfc_h264_enc_params *p_264)
+{
+	int i;
+
+	if (p_264->fmo_enable) {
+		switch (p_264->fmo_slice_map_type) {
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES:
+			if (p_264->fmo_slice_num_grp > 4)
+				p_264->fmo_slice_num_grp = 4;
+			for (i = 0; i < (p_264->fmo_slice_num_grp & 0xF); i++)
+				MFC_CORE_RAW_WRITEL
+					(p_264->fmo_run_length[i] - 1,
+					 MFC_REG_E_H264_FMO_RUN_LENGTH_MINUS1_0 + i * 4);
+			break;
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES:
+			if (p_264->fmo_slice_num_grp > 4)
+				p_264->fmo_slice_num_grp = 4;
+			break;
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN:
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN:
+			if (p_264->fmo_slice_num_grp > 2)
+				p_264->fmo_slice_num_grp = 2;
+			MFC_CORE_RAW_WRITEL
+				(p_264->fmo_sg_dir & 0x1, MFC_REG_E_H264_FMO_SLICE_GRP_CHANGE_DIR);
+			/* the valid range is 0 ~ number of macroblocks -1 */
+			MFC_CORE_RAW_WRITEL(p_264->fmo_sg_rate,
+					    MFC_REG_E_H264_FMO_SLICE_GRP_CHANGE_RATE_MINUS1);
+			break;
+		default:
+			mfc_ctx_err("Unsupported map type for FMO: %d\n",
+				    p_264->fmo_slice_map_type);
+			p_264->fmo_slice_map_type = 0;
+			p_264->fmo_slice_num_grp = 1;
+			break;
+		}
+
+		MFC_CORE_RAW_WRITEL
+			(p_264->fmo_slice_map_type, MFC_REG_E_H264_FMO_SLICE_GRP_MAP_TYPE);
+		MFC_CORE_RAW_WRITEL
+			(p_264->fmo_slice_num_grp - 1, MFC_REG_E_H264_FMO_NUM_SLICE_GRP_MINUS1);
+	} else {
+		MFC_CORE_RAW_WRITEL(0, MFC_REG_E_H264_FMO_NUM_SLICE_GRP_MINUS1);
+	}
+}
+
+static void __mfc_set_enc_params_h264(struct mfc_core *core,
+				      struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_h264_enc_params *p_264 = &p->codec.h264;
+	unsigned int mb = 0;
+	unsigned int reg = 0;
+
+	mfc_ctx_debug_enter();
+
+	p->rc_framerate_res = FRAME_RATE_RESOLUTION;
+	__mfc_set_enc_params(core, ctx);
+
+	if (p_264->num_hier_layer & 0x7) {
+		/* set gop_size without i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 0);
+	} else {
+		/* set gop_size with i_frm_ctrl mode */
+		__mfc_set_gop_size(core, ctx, 1);
+	}
+
+	mb = WIDTH_MB((ctx)->crop_width) * HEIGHT_MB((ctx)->crop_height);
+	/* Level 6.0 case */
+	if (IS_LV60_MB(mb)) {
+		if (p_264->level < 60)
+			mfc_ctx_info("This resolution(mb: %d) recommends level6.0\n", mb);
+		/* In case of profile is baseline or constrained baseline */
+		if (p_264->profile == 0x0 || p_264->profile == 0x3)
+			mfc_ctx_info("This resolution(mb: %d) recommends high profile\n", mb);
+		if (!dev->pdata->support_8K_cavlc && p_264->entropy_mode != 0x1) {
+			mfc_ctx_info("Set Entropy mode CABAC\n");
+			p_264->entropy_mode = 1;
+		}
+	}
+
+	/* Level 5.1 case */
+	if (IS_LV51_MB(mb)) {
+		if (p_264->level < 51)
+			mfc_ctx_info("This resolution(mb: %d) recommends level5.1\n", mb);
+		/* In case of profile is baseline or constrained baseline */
+		if (p_264->profile == 0x0 || p_264->profile == 0x3)
+			mfc_ctx_info("This resolution(mb: %d) recommends high profile\n", mb);
+	}
+
+	/* profile & level */
+	reg = 0;
+	/** level */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_264->level);
+	/** profile - 0 ~ 3 */
+	mfc_clear_set_bits(reg, 0x3F, 0, p_264->profile);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_PICTURE_PROFILE);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_OPTIONS);
+	/* entropy coding mode */
+	mfc_clear_set_bits(reg, 0x1, 0, p_264->entropy_mode);
+	/* loop filter ctrl */
+	mfc_clear_set_bits(reg, 0x3, 1, p_264->loop_filter_mode);
+	/* interlace */
+	mfc_clear_set_bits(reg, 0x1, 3, p_264->interlace);
+	/* intra picture period for H.264 open GOP */
+	mfc_clear_set_bits(reg, 0x1, 4, p_264->open_gop);
+	/* extended encoder ctrl */
+	mfc_clear_set_bits(reg, 0x1, 5, p_264->ar_vui);
+	/* ASO enable */
+	mfc_clear_set_bits(reg, 0x1, 6, p_264->aso_enable);
+	/* if num_refs_for_p is 2, the performance falls by half */
+	mfc_clear_set_bits(reg, 0x1, 7, (p->num_refs_for_p - 1));
+	/* Temporal SVC - hier qp enable */
+	mfc_clear_set_bits(reg, 0x1, 8, p_264->hier_qp_enable);
+	/* Weighted Prediction enable */
+	mfc_clear_set_bits(reg, 0x3, 9, p->weighted_enable);
+	if (p->weighted_enable)
+		mfc_ctx_debug(2, "WP mode is %d\n", p->weighted_enable);
+	/* 8x8 transform enable [12]: INTER_8x8_TRANS_ENABLE */
+	mfc_clear_set_bits(reg, 0x1, 12, p_264->_8x8_transform);
+	/* 8x8 transform enable [13]: INTRA_8x8_TRANS_ENABLE */
+	mfc_clear_set_bits(reg, 0x1, 13, p_264->_8x8_transform);
+	/* 'CONSTRAINED_INTRA_PRED_ENABLE' is disable */
+	mfc_clear_bits(reg, 0x1, 14);
+	/* sps pps control */
+	mfc_clear_set_bits(reg, 0x1, 29, p_264->prepend_sps_pps_to_idr);
+	/* VUI parameter disable */
+	mfc_clear_set_bits(reg, 0x1, 30, p_264->vui_enable);
+	/* Timing info */
+	mfc_set_bits(reg, 0x1, 31, p->timing_info_enable);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_OPTIONS);
+
+	/* cropped height */
+	if (p_264->interlace)
+		MFC_CORE_RAW_WRITEL(ctx->crop_height >> 1, MFC_REG_E_CROPPED_FRAME_HEIGHT);
+
+	/* loopfilter alpha offset */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_LF_ALPHA_OFFSET);
+	mfc_clear_set_bits(reg, 0x1F, 0, p_264->loop_filter_alpha);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_LF_ALPHA_OFFSET);
+
+	/* loopfilter beta offset */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_LF_BETA_OFFSET);
+	mfc_clear_set_bits(reg, 0x1F, 0, p_264->loop_filter_beta);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_LF_BETA_OFFSET);
+
+	/* rate control config. */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG);
+	/** frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_264->rc_frame_qp);
+	mfc_clear_bits(reg, 0x1, 11);
+	if (!p->rc_frame && !p->rc_mb && p->dynamic_qp)
+		mfc_set_bits(reg, 0x1, 11, 0x1);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_CONFIG);
+
+	/* max & min value of QP for I frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND);
+	/** max I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_264->rc_max_qp);
+	/** min I frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_264->rc_min_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND);
+
+	/* max & min value of QP for P/B frame */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_RC_QP_BOUND_PB);
+	/** max B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 24, p_264->rc_max_qp_b);
+	/** min B frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 16, p_264->rc_min_qp_b);
+	/** max P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 8, p_264->rc_max_qp_p);
+	/** min P frame QP */
+	mfc_clear_set_bits(reg, 0xFF, 0, p_264->rc_min_qp_p);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_RC_QP_BOUND_PB);
+
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_FIXED_PICTURE_QP);
+	mfc_clear_set_bits(reg, 0xFF, 24, p->config_qp);
+	mfc_clear_set_bits(reg, 0xFF, 16, p_264->rc_b_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 8, p_264->rc_p_frame_qp);
+	mfc_clear_set_bits(reg, 0xFF, 0, p_264->rc_frame_qp);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_FIXED_PICTURE_QP);
+
+	/* chroma QP offset */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_CHROMA_QP_OFFSET);
+	mfc_clear_set_bits(reg, 0x1F, 5, p->chroma_qp_offset_cr);
+	mfc_clear_set_bits(reg, 0x1F, 0, p->chroma_qp_offset_cb);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_CHROMA_QP_OFFSET);
+
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_ASPECT_RATIO);
+	MFC_CORE_RAW_WRITEL(0x0, MFC_REG_E_EXTENDED_SAR);
+	if (p_264->ar_vui) {
+		/* aspect ration IDC */
+		reg = 0;
+		mfc_set_bits(reg, 0xFF, 0, p_264->ar_vui_idc);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_ASPECT_RATIO);
+		if (p_264->ar_vui_idc == 0xFF) {
+			/* sample  AR info. */
+			reg = 0;
+			mfc_set_bits(reg, 0xFFFF, 16, p_264->ext_sar_width);
+			mfc_set_bits(reg, 0xFFFF, 0, p_264->ext_sar_height);
+			MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_EXTENDED_SAR);
+		}
+	}
+	/* intra picture period for H.264 open GOP, value */
+	reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_REFRESH_PERIOD);
+	mfc_clear_bits(reg, 0xFFFF, 0);
+	if (p_264->open_gop)
+		mfc_set_bits(reg, 0xFFFF, 0, p_264->open_gop_size);
+	MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_REFRESH_PERIOD);
+
+	/* Temporal SVC */
+	__mfc_set_temporal_svc_h264(core, ctx, p_264);
+
+	/* set frame pack sei generation */
+	if (p_264->sei_gen_enable) {
+		/* frame packing enable */
+		reg = MFC_CORE_RAW_READL(MFC_REG_E_H264_OPTIONS);
+		mfc_set_bits(reg, 0x1, 25, 0x1);
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_OPTIONS);
+
+		/* set current frame0 flag & arrangement type */
+		reg = 0;
+		/** current frame0 flag */
+		mfc_set_bits(reg, 0x1, 2, p_264->sei_fp_curr_frame_0);
+		/** arrangement type */
+		mfc_set_bits(reg, 0x3, 0, (p_264->sei_fp_arrangement_type - 3));
+		MFC_CORE_RAW_WRITEL(reg, MFC_REG_E_H264_FRAME_PACKING_SEI_INFO);
+	}
+
+	__mfc_set_fmo_slice_map_h264(core, ctx, p_264);
+
+	mfc_ctx_debug_leave();
+}
+
+int mfc_core_set_enc_params(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	if (IS_H264_ENC(ctx)) {
+		__mfc_set_enc_params_h264(core, ctx);
+	} else {
+		mfc_ctx_err("Unknown codec for encoding (%x)\n", ctx->codec_mode);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug(5, "RC) Bitrate: %d / framerate: %#x / config %#x / mode %#x\n",
+		      MFC_CORE_RAW_READL(MFC_REG_E_RC_BIT_RATE),
+		      MFC_CORE_RAW_READL(MFC_REG_E_RC_FRAME_RATE),
+		      MFC_CORE_RAW_READL(MFC_REG_E_RC_CONFIG),
+		      MFC_CORE_RAW_READL(MFC_REG_E_RC_MODE));
+
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.h
new file mode 100644
index 000000000000..ce15ae29abba
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_enc_param.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_ENC_PARAM_H
+#define __MFC_ENC_PARAM_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_core_set_slice_mode(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_core_set_aso_slice_order_h264(struct mfc_core *core,
+				       struct mfc_ctx *ctx);
+void mfc_core_set_enc_config_qp(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_core_set_enc_ts_delta(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_set_enc_params(struct mfc_core *core, struct mfc_ctx *ctx);
+#endif /* __MFC_ENC_PARAM_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
index 8846230f1e20..4580aa3498cc 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
@@ -379,6 +379,768 @@ static struct mfc_ctrl_cfg mfc_dec_ctrl_list[] = {
 
 #define NUM_DEC_CTRL_CFGS ARRAY_SIZE(mfc_dec_ctrl_list)
 
+static struct mfc_ctrl_cfg mfc_enc_ctrl_list[] = {
+	{	/* set frame tag */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_PICTURE_TAG,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* get frame tag */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RET_PICTURE_TAG,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* encoded y physical addr */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_LUMA_ADDR,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_ENCODED_SOURCE_FIRST_ADDR,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* encoded c physical addr */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CHROMA_ADDR,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_ENCODED_SOURCE_SECOND_ADDR,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* I, not coded frame insertion */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_FRAME_INSERTION,
+		.mask = 0x3,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* I period change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_GOP_CONFIG,
+		.mask = 0xFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 0,
+	},
+	{	/* frame rate change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_FRAME_RATE,
+		.mask = 0x0000FFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 1,
+	},
+	{	/* bit rate change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_BIT_RATE_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_BIT_RATE,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 2,
+	},
+	{	/* frame status (in slice or not) */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_STATUS,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_NONE,
+		.addr = 0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* H.264 I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.263 I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H263_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.263 I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H263_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP8 I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP8 I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP9 I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP9 I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC I frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC I frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.263 P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H263_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.263 P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H263_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP8 P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP8 P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP9 P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* VP9 P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC P frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC P frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_P,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 B frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 B frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 B frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* MPEG4 B frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC B frame QP Max change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* HEVC B frame QP Min change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_B,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_QP_BOUND_PB,
+		.mask = 0xFF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 4,
+	},
+	{	/* H.264 Dynamic Temporal Layer & bitrate change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 10,
+	},
+	{	/* HEVC Dynamic Temporal Layer & bitrate change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 10,
+	},
+	{	/* VP8 Dynamic Temporal Layer change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 10,
+	},
+	{	/* VP9 Dynamic Temporal Layer change */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_HIERARCHICAL_BIT_RATE_LAYER0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 10,
+	},
+	{	/* set level */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_PICTURE_PROFILE,
+		.mask = 0x000000FF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 5,
+	},
+	{	/* set profile */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_PICTURE_PROFILE,
+		.mask = 0x0000000F,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 5,
+	},
+	{	/* set store LTR */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC_H264_MARK_LTR,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_H264_NAL_CONTROL,
+		.mask = 0x00000003,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* set use LTR */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC_H264_USE_LTR,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_H264_NAL_CONTROL,
+		.mask = 0x00000003,
+		.shft = 2,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* set base layer priority */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_H264_HD_SVC_EXTENSION_0,
+		.mask = 0x0000003F,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 12,
+	},
+	{	/* set QP per each frame */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC_CONFIG_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_FIXED_PICTURE_QP,
+		.mask = 0x000000FF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* Region-Of-Interest control */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_ROI_CONTROL,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_ROI_CTRL,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* set YSUM for weighted prediction */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_YSUM,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_WEIGHT_FOR_WEIGHTED_PREDICTION,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_shft = 0,
+	},
+	{	/* set base layer priority */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_RATIO_OF_INTRA,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_MODE,
+		.mask = 0x000000FF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 13,
+	},
+	{	/* sync the timestamp for drop control */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_DROP_CONTROL,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_FRAME_RATE,
+		.mask = 0x0000FFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* average QP of current frame */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_AVERAGE_QP,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_NAL_DONE_INFO,
+		.mask = 0x000000FF,
+		.shft = 12,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* HOR range position of current frame */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L0,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_MV_HOR_RANGE,
+		.mask = 0x000000FF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* HOR range position of current frame */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L1,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_MV_HOR_RANGE,
+		.mask = 0x000000FF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* VER range position of current frame */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L0,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_MV_VER_RANGE,
+		.mask = 0x000000FF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* VER range position of current frame */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L1,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_MV_VER_RANGE,
+		.mask = 0x000000FF,
+		.shft = 24,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* Max I frame size */
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_MAX_IFRAME_SIZE,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_RC_OPTIONS,
+		.mask = 0xFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_SFR,
+		.flag_addr = MFC_REG_E_PARAM_CHANGE,
+		.flag_shft = 20,
+	},
+	{	/* The number of skip MB */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SUM_SKIP_MB,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_SUM_SKIP_MB,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* The number of intra MB */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SUM_INTRA_MB,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_SUM_INTRA_MB,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* The number of intra MB */
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SUM_ZERO_MV_MB,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_E_SUM_ZERO_MV_MB,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* buffer additional information */
+		.type = MFC_CTRL_TYPE_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_NONE,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+	},
+	{	/* buffer additional information */
+		.type = MFC_CTRL_TYPE_DST,
+		.id = V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_NONE,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+	}
+};
+
+#define NUM_ENC_CTRL_CFGS ARRAY_SIZE(mfc_enc_ctrl_list)
+
 static void mfc_ctrl_cleanup_ctx(struct mfc_ctx *ctx)
 {
 	struct mfc_ctx_ctrl *ctx_ctrl;
@@ -426,6 +1188,8 @@ static int mfc_ctrl_init_ctx(struct mfc_ctx *ctx)
 {
 	if (ctx->type == MFCINST_DECODER)
 		return __mfc_ctrl_init_ctx(ctx, mfc_dec_ctrl_list, NUM_DEC_CTRL_CFGS);
+	else if (ctx->type == MFCINST_ENCODER)
+		return __mfc_ctrl_init_ctx(ctx, mfc_enc_ctrl_list, NUM_ENC_CTRL_CFGS);
 
 	mfc_ctx_err("[CTRLS] invalid type %d\n", ctx->type);
 	return -EINVAL;
@@ -560,11 +1324,47 @@ static int mfc_ctrl_init_buf(struct mfc_ctx *ctx, enum mfc_ctrl_type type, unsig
 {
 	if (ctx->type == MFCINST_DECODER)
 		return __mfc_ctrl_init_buf(ctx, mfc_dec_ctrl_list, type, index, NUM_DEC_CTRL_CFGS);
+	else if (ctx->type == MFCINST_ENCODER)
+		return __mfc_ctrl_init_buf(ctx, mfc_enc_ctrl_list, type, index, NUM_ENC_CTRL_CFGS);
 
 	mfc_ctx_err("[CTRLS] invalid type %d\n", ctx->type);
 	return -EINVAL;
 }
 
+static void __mfc_enc_set_roi(struct mfc_ctx *ctx, struct mfc_buf_ctrl *buf_ctrl)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	int index = 0;
+	unsigned int reg = 0;
+
+	index = enc->roi_index;
+	if (enc->roi_info[index].enable) {
+		enc->roi_index = (index + 1) % MFC_MAX_EXTRA_BUF;
+		reg |= enc->roi_info[index].enable;
+		reg &= ~(0xFF << 8);
+		reg |= (enc->roi_info[index].lower_qp << 8);
+		reg &= ~(0xFFFF << 16);
+		reg |= (enc->roi_info[index].upper_qp << 16);
+		/*
+		 * 2bit ROI
+		 * - All codec type: upper_qp and lower_qp is valid
+		 * 8bit ROI
+		 * - H.264/HEVC/MPEG4: upper_qp and lower_qp is invalid
+		 * - VP8/VP9: upper_qp and lower_qp is valid
+		 */
+		mfc_ctx_debug(3, "[ROI] buffer[%d] en %d QP lower %d upper %d reg %#x\n",
+			      index, enc->roi_info[index].enable,
+			      enc->roi_info[index].lower_qp,
+			      enc->roi_info[index].upper_qp,
+			      reg);
+	} else {
+		mfc_ctx_debug(3, "[ROI] buffer[%d] is not enabled\n", index);
+	}
+
+	buf_ctrl->val = reg;
+	buf_ctrl->old_val2 = index;
+}
+
 static void mfc_ctrl_to_buf(struct mfc_ctx *ctx, struct list_head *head)
 {
 	struct mfc_ctx_ctrl *ctx_ctrl;
@@ -588,6 +1388,9 @@ static void mfc_ctrl_to_buf(struct mfc_ctx *ctx, struct list_head *head)
 
 				ctx_ctrl->set.has_new = 0;
 
+				if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_ROI_CONTROL)
+					__mfc_enc_set_roi(ctx, buf_ctrl);
+
 				break;
 			}
 		}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
index a7db47e58589..4083d76640fd 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
@@ -685,12 +685,22 @@ static void __mfc_rm_migrate_all_to_one_core(struct mfc_dev *dev)
 			spin_unlock_irqrestore(&dev->ctx_list_lock, flags);
 			return;
 		}
-
-		if (tmp_ctx->op_core_type == MFC_OP_CORE_FIXED_0)
-			op_core_fixed0++;
-		else if (tmp_ctx->op_core_type == MFC_OP_CORE_FIXED_1)
-			op_core_fixed1++;
-
+		/* op core type */
+		if (tmp_ctx->type == MFCINST_ENCODER) {
+			/*
+			 * instance of encoder cannot be moved to another core.
+			 * So, treat main core as the fixed core.
+			 */
+			if (tmp_ctx->op_core_num[MFC_CORE_MAIN] == MFC_DEC_DEFAULT_CORE)
+				op_core_fixed0++;
+			else if (tmp_ctx->op_core_num[MFC_CORE_MAIN] == MFC_SURPLUS_CORE)
+				op_core_fixed1++;
+		} else {
+			if (tmp_ctx->op_core_type == MFC_OP_CORE_FIXED_0)
+				op_core_fixed0++;
+			else if (tmp_ctx->op_core_type == MFC_OP_CORE_FIXED_1)
+				op_core_fixed1++;
+		}
 		/* op main core */
 		if (tmp_ctx->op_core_num[MFC_CORE_MAIN] == MFC_DEC_DEFAULT_CORE)
 			op_core0++;
@@ -1344,6 +1354,14 @@ void mfc_rm_load_balancing(struct mfc_ctx *ctx, int load_add)
 			__mfc_rm_update_core_load(tmp_ctx, 0, 1);
 			continue;
 		}
+
+		if (tmp_ctx->type == MFCINST_ENCODER) {
+			mfc_ctx_debug(3, "[RMLB] encoder ctx[%d] can't be moved\n",
+				      tmp_ctx->num);
+			__mfc_rm_update_core_load(tmp_ctx, 0, IS_MULTI_MODE(tmp_ctx));
+			continue;
+		}
+
 		core_num = __mfc_rm_get_core_num_by_load(dev, tmp_ctx, MFC_DEC_DEFAULT_CORE);
 		if (IS_SWITCH_SINGLE_MODE(tmp_ctx) ||
 		    core_num == tmp_ctx->op_core_num[MFC_CORE_MAIN]) {
@@ -1440,8 +1458,10 @@ int mfc_rm_instance_init(struct mfc_dev *dev, struct mfc_ctx *ctx)
 	 * QoS portion data should be allocated
 	 * only once per instance after maincore is determined.
 	 */
-	num_qos_steps = core->core_pdata->num_default_qos_steps;
-
+	if (ctx->type == MFCINST_ENCODER)
+		num_qos_steps = core->core_pdata->num_encoder_qos_steps;
+	else
+		num_qos_steps = core->core_pdata->num_default_qos_steps;
 	ctx->mfc_qos_portion = vmalloc(sizeof(unsigned int) * num_qos_steps);
 	if (!ctx->mfc_qos_portion)
 		ret = -ENOMEM;
@@ -1916,6 +1936,46 @@ void mfc_rm_instance_dec_stop(struct mfc_dev *dev, struct mfc_ctx *ctx,
 	mfc_ctx_debug_leave();
 }
 
+void mfc_rm_instance_enc_stop(struct mfc_dev *dev, struct mfc_ctx *ctx,
+			      unsigned int type)
+{
+	struct mfc_core *core;
+	struct mfc_core *subcore;
+
+	mfc_ctx_debug_enter();
+
+	mfc_get_corelock_ctx(ctx);
+
+	core = mfc_get_main_core(dev, ctx);
+	if (!core) {
+		mfc_ctx_err("[RM] There is no main core\n");
+		mfc_release_corelock_ctx(ctx);
+		return;
+	}
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		core->core_ops->instance_q_flush(core, ctx);
+	} else if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (IS_SWITCH_SINGLE_MODE(ctx)) {
+			subcore = mfc_get_sub_core(dev, ctx);
+			if (!subcore) {
+				mfc_ctx_err("[RM] There is no sub core for switch single\n");
+				goto err_subcore_stop;
+			}
+
+			core->core_ops->instance_finishing(core, ctx);
+			subcore->core_ops->instance_finishing(subcore, ctx);
+		} else {
+			core->core_ops->instance_finishing(core, ctx);
+		}
+	}
+
+err_subcore_stop:
+	mfc_release_corelock_ctx(ctx);
+
+	mfc_ctx_debug_leave();
+}
+
 int mfc_rm_subcore_seq_start(struct mfc_dev *dev, struct mfc_ctx *ctx)
 {
 	struct mfc_core *core;
@@ -2284,6 +2344,8 @@ void mfc_rm_qos_control(struct mfc_ctx *ctx, enum mfc_qos_control qos_control)
 			mfc_rm_load_balancing(ctx, MFC_RM_LOAD_ADD);
 
 		ctx->update_bitrate = false;
+		if (ctx->type == MFCINST_ENCODER)
+			ctx->update_framerate = false;
 		break;
 	default:
 		mfc_ctx_err("[RM] not supported QoS control type: %#x\n",
@@ -2528,9 +2590,14 @@ void mfc_rm_update_real_time(struct mfc_ctx *ctx)
 		}
 	} else {
 		if (new_prio == 0) {
-			/* In case of google photo app, user sets priority 0 */
-			new_prio = 1;
-			new_rt = MFC_RT_LOW;
+			if (ctx->type == MFCINST_ENCODER &&
+			    ctx->enc_priv->params.rc_framerate) {
+				new_rt = MFC_RT;
+			} else {
+				/* In case of google photo app, user sets priority 0 */
+				new_prio = 1;
+				new_rt = MFC_RT_LOW;
+			}
 		} else if (new_prio >= 1) {
 			new_rt = MFC_NON_RT;
 		} else {
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h
index b73ef905718a..39ec63392db3 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.h
@@ -94,6 +94,8 @@ int mfc_rm_instance_deinit(struct mfc_dev *dev, struct mfc_ctx *ctx);
 int mfc_rm_instance_open(struct mfc_dev *dev, struct mfc_ctx *ctx);
 void mfc_rm_instance_dec_stop(struct mfc_dev *dev, struct mfc_ctx *ctx,
 			      unsigned int type);
+void mfc_rm_instance_enc_stop(struct mfc_dev *dev, struct mfc_ctx *ctx,
+			      unsigned int type);
 int mfc_rm_subcore_seq_start(struct mfc_dev *dev, struct mfc_ctx *ctx);
 int mfc_rm_instance_setup(struct mfc_dev *dev, struct mfc_ctx *ctx);
 void mfc_rm_request_work(struct mfc_dev *dev, enum mfc_request_work work,
-- 
2.34.1

