Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6ABAB7DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF910E4EC;
	Tue, 30 Sep 2025 05:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="THxEI3FB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B68110E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:13 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035619epoutp0327f8b4d8dbfdd242ab124c3e08ad9fa2~p8z51VJEw3077530775epoutp030
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035619epoutp0327f8b4d8dbfdd242ab124c3e08ad9fa2~p8z51VJEw3077530775epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204579;
 bh=nE3BdWnQEBzg3sZAV6SckBdnxY0P3OiY1Zx34roYU9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=THxEI3FBQ+6FNiyL8pEEFxYHGKkwqF8cOJxLB43VoDHwx6PVI11BZCCw5XuZjThYN
 K3+Lhxc5949NEDGfaKjZAacI2wzUfsN4MDv0/5HsEBedHpcyBHqgQItw852LVtXKkj
 xBvQSVg0XtqqrzqpkCbU4DGvVrZVli+kEg1CnYBU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035617epcas5p4447709c1f5d8128d495c242ec1a65e26~p8z41S5H30713607136epcas5p4I;
 Tue, 30 Sep 2025 03:56:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPPF0Hy5z6B9m7; Tue, 30 Sep
 2025 03:56:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035616epcas5p3696fbcd8fbe66221433651290859e198~p8z3RhJqp0522705227epcas5p3l;
 Tue, 30 Sep 2025 03:56:16 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035611epsmtip126d96a1a75eb2ff554f6d5785b5f0de8~p8zyXb4qG2908129081epsmtip1y;
 Tue, 30 Sep 2025 03:56:10 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 13/29] media: mfc: Add decoder core sync functions
Date: Tue, 30 Sep 2025 09:33:32 +0530
Message-Id: <20250930040348.3702923-14-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035616epcas5p3696fbcd8fbe66221433651290859e198
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035616epcas5p3696fbcd8fbe66221433651290859e198
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035616epcas5p3696fbcd8fbe66221433651290859e198@epcas5p3.samsung.com>
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

- Add core command extensions and decoder‑specific commands.
- Update core register APIs with helpers for processing‑cycle,
DPB, scratch size, SEI, black‑bar detection, MVC IDs, profile,
display delay, two‑core mode, and inline utilities for crop info,
tag updates, migration address, and multi‑core context flush.
- Refactor core synchronization: migration‑aware lock functions,
wait‑queues to prevent races, targeted wake‑ups, and ready‑bit
handling for header parsing, frame decoding, buffer setup,
resolution changes, and two‑core DRC paths.
- Add macros, helper functions, comments, and debug prints
to support the new decoder‑side core coordination and
upcoming multi‑core decoding.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/mfc_core_cmd.c         | 288 +++++++++++++++
 .../samsung/exynos-mfc/mfc_core_cmd.h         |   9 +
 .../samsung/exynos-mfc/mfc_core_reg_api.c     | 346 ++++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_reg_api.h     | 214 +++++++++++
 .../samsung/exynos-mfc/mfc_core_sync.c        | 187 +++++++++-
 .../samsung/exynos-mfc/mfc_core_sync.h        |   9 +
 6 files changed, 1049 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
index 5be9fd086a93..fe7946bb49e7 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
@@ -87,6 +87,8 @@ void mfc_core_cmd_open_inst(struct mfc_core *core, struct mfc_ctx *ctx)
 
 	MFC_CORE_WRITEL(core_ctx->instance_ctx_buf.daddr, MFC_REG_CONTEXT_MEM_ADDR);
 	MFC_CORE_WRITEL(core_ctx->instance_ctx_buf.size, MFC_REG_CONTEXT_MEM_SIZE);
+	if (ctx->type == MFCINST_DECODER)
+		MFC_CORE_WRITEL(ctx->dec_priv->crc_enable, MFC_REG_D_CRC_CTRL);
 
 	if (dev->debugfs.feature_option & MFC_OPTION_SET_MULTI_CORE_FORCE) {
 		reg = MFC_CORE_READL(MFC_REG_DBG_INFO_ENABLE);
@@ -135,6 +137,45 @@ void mfc_core_cmd_abort_inst(struct mfc_core *core, struct mfc_ctx *ctx)
 	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_NAL_ABORT);
 }
 
+void mfc_core_cmd_move_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_MOVE_INSTANCE);
+}
+
+void mfc_core_cmd_dpb_flush(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	u32 reg = 0;
+
+	if (ON_RES_CHANGE(core_ctx))
+		mfc_err("dpb flush on res change(state:%d)\n",
+			core_ctx->state);
+
+	mutex_lock(&ctx->op_mode_mutex);
+
+	/*
+	 * NAL_START_OPTIONS[4] should set when every NAL_START/DPB_FLUSH,
+	 * it will be cleared by F/W.
+	 */
+	reg = MFC_CORE_READL(MFC_REG_D_NAL_START_OPTIONS);
+	reg &= ~BIT(MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	if (IS_MULTI_MODE(ctx) || ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2)
+		reg |= BIT(MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	else
+		reg |= (0 << MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	MFC_CORE_WRITEL(reg, MFC_REG_D_NAL_START_OPTIONS);
+	mfc_debug(3, "NAL_START_OPTIONS: %#x, op_mode: %d\n", reg, ctx->op_mode);
+	mutex_unlock(&ctx->op_mode_mutex);
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_DPB_FLUSH);
+}
+
 void mfc_core_cmd_cache_flush(struct mfc_core *core)
 {
 	struct mfc_core_ctx *core_ctx = core->core_ctx[core->curr_core_ctx];
@@ -156,3 +197,250 @@ void mfc_core_cmd_cache_flush(struct mfc_core *core)
 	mfc_core_clean_dev_int_flags(core);
 	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_CACHE_FLUSH);
 }
+
+/* Initialize decoding */
+void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	unsigned int reg = 0;
+	int fmo_aso_ctrl = 0;
+
+	mfc_debug_enter();
+
+	mfc_debug(2, "inst_no: %d/%d\n", core_ctx->inst_no, MFC_REG_H2R_CMD_SEQ_HEADER);
+	mfc_debug(2, "BUFs: %llx\n", MFC_CORE_DMA_READL(MFC_REG_D_CPB_BUFFER_ADDR));
+
+	/*
+	 * When user sets desplay_delay to 0,
+	 * It works as "display_delay enable" and delay set to 0.
+	 * If user wants display_delay disable, It should be
+	 * set to negative value.
+	 */
+	if (dec->display_delay >= 0) {
+		reg |= BIT(MFC_REG_D_DEC_OPT_DISPLAY_DELAY_EN_SHIFT);
+		MFC_CORE_WRITEL(dec->display_delay, MFC_REG_D_DISPLAY_DELAY);
+	}
+
+	/* FMO_ASO_CTRL - 0: Enable, 1: Disable */
+	reg |= ((fmo_aso_ctrl & MFC_REG_D_DEC_OPT_FMO_ASO_CTRL_MASK)
+		<< MFC_REG_D_DEC_OPT_FMO_ASO_CTRL_SHIFT);
+
+	reg |= ((dec->idr_decoding & MFC_REG_D_DEC_OPT_IDR_DECODING_MASK)
+		<< MFC_REG_D_DEC_OPT_IDR_DECODING_SHIFT);
+
+	/* conceal control to specific color */
+	reg |= (0x4 << MFC_REG_D_DEC_OPT_CONCEAL_CONTROL_SHIFT);
+
+	/* Realloc buffer for resolution decrease case in NAL QUEUE mode */
+	reg |= BIT(MFC_REG_D_DEC_OPT_REALLOC_CONTROL_SHIFT);
+
+	/* Parsing all including PPS */
+	reg |= BIT(MFC_REG_D_DEC_OPT_SPECIAL_PARSING_SHIFT);
+
+	/* Enabe decoding order */
+	if (dec->decoding_order ||
+	    (dev->debugfs.feature_option & MFC_OPTION_DECODING_ORDER))
+		reg |= BIT(MFC_REG_D_DEC_OPT_DECODING_ORDER_ENABLE);
+
+	MFC_CORE_WRITEL(reg, MFC_REG_D_DEC_OPTIONS);
+
+	MFC_CORE_WRITEL(MFC_CONCEAL_COLOR, MFC_REG_D_FORCE_PIXEL_VAL);
+
+	mfc_core_set_pixel_format(core, ctx, ctx->dst_fmt->fourcc);
+
+	reg = 0;
+	/* Enable realloc interface if SEI is enabled */
+	if (dec->sei_parse)
+		reg |= BIT(MFC_REG_D_SEI_ENABLE_NEED_INIT_BUFFER_SHIFT);
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->static_info_dec)) {
+		reg |= BIT(MFC_REG_D_SEI_ENABLE_CONTENT_LIGHT_SHIFT);
+		reg |= BIT(MFC_REG_D_SEI_ENABLE_MASTERING_DISPLAY_SHIFT);
+	}
+	reg |= BIT(MFC_REG_D_SEI_ENABLE_RECOVERY_PARSING_SHIFT);
+
+	MFC_CORE_WRITEL(reg, MFC_REG_D_SEI_ENABLE);
+	mfc_debug(2, "SEI enable was set, 0x%x\n", MFC_CORE_READL(MFC_REG_D_SEI_ENABLE));
+
+	/* Enable metadata */
+	reg = 0;
+
+	MFC_CORE_WRITEL(reg, MFC_REG_METADATA_ENABLE);
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_SEQ_HEADER);
+
+	mfc_debug_leave();
+}
+
+int mfc_core_cmd_dec_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	unsigned int reg = 0;
+	int ret;
+
+	mfc_core_set_pixel_format(core, ctx, ctx->dst_fmt->fourcc);
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	ret = mfc_core_set_dec_codec_buffers(core_ctx);
+	if (ret) {
+		mfc_info("isn't enough codec buffer size, re-alloc!\n");
+
+		mfc_release_codec_buffers(core_ctx);
+		ret = mfc_alloc_codec_buffers(core_ctx);
+		if (ret) {
+			mfc_err("Failed to allocate decoding buffers\n");
+			return ret;
+		}
+		ret = mfc_core_set_dec_codec_buffers(core_ctx);
+		if (ret) {
+			mfc_err("Failed to alloc frame mem\n");
+			return ret;
+		}
+	}
+
+	if (IS_MULTI_MODE(ctx)) {
+		reg |= ((ctx->subcore_inst_no & MFC_REG_RET_INSTANCE_ID_OF_MFC1_MASK)
+				<< MFC_REG_RET_INSTANCE_ID_OF_MFC1_SHIFT);
+		reg |= (core_ctx->inst_no & MFC_REG_RET_INSTANCE_ID_MASK);
+		MFC_CORE_WRITEL(reg, MFC_REG_INSTANCE_ID);
+	} else {
+		MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+	}
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_INIT_BUFFERS);
+
+	return ret;
+}
+
+static int __mfc_set_scratch_dpb_buffer(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret;
+
+	ret = mfc_alloc_scratch_buffer(core_ctx);
+	if (ret) {
+		mfc_err("Failed to allocate scratch buffers\n");
+		return ret;
+	}
+
+	/* set decoder DPB size, stride, scratch buffer */
+	mfc_core_set_dec_dpb_and_scratch(core_ctx, core_ctx->scratch_buf.daddr);
+
+	return 0;
+}
+
+/* Decode a single frame */
+int mfc_core_cmd_dec_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
+			       int last_frame, int src_index)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec = ctx->dec_priv;
+	u32 reg = 0;
+	int ret = 0;
+	u32 timeout_value = MFC_TIMEOUT_VALUE;
+	unsigned long dynamic_set;
+
+	if (dec->is_dynamic_dpb)
+		dynamic_set = core_ctx->dynamic_set;
+	else
+		dynamic_set = dec->dynamic_set;
+
+	mfc_debug(2, "[MFC-%d][DPB] set dpb: %#lx, used: %#lx\n",
+		  core->id, dynamic_set, dec->dynamic_used);
+
+	reg = MFC_CORE_READL(MFC_REG_D_NAL_START_OPTIONS);
+	/* Black bar */
+	reg &= ~BIT(MFC_REG_D_NAL_START_OPT_BLACK_BAR_SHIFT);
+	reg |= ((dec->detect_black_bar & 0x1) << MFC_REG_D_NAL_START_OPT_BLACK_BAR_SHIFT);
+	if (core->dev->debugfs.feature_option & MFC_OPTION_BLACK_BAR_ENABLE)
+		reg |= BIT(MFC_REG_D_NAL_START_OPT_BLACK_BAR_SHIFT);
+	/* Scratch buf & DPB changes when interframe resolution change */
+	if (dec->inter_res_change) {
+		ret = __mfc_set_scratch_dpb_buffer(core, ctx);
+		if (ret)
+			return ret;
+		reg |= BIT(MFC_REG_D_NAL_START_OPT_NEW_SCRATCH_SHIFT);
+		reg |= BIT(MFC_REG_D_NAL_START_OPT_NEW_DPB_SHIFT);
+		dec->inter_res_change = 0;
+	} else {
+		reg &= ~BIT(MFC_REG_D_NAL_START_OPT_NEW_SCRATCH_SHIFT);
+		reg &= ~BIT(MFC_REG_D_NAL_START_OPT_NEW_DPB_SHIFT);
+	}
+
+	/* Operation core mode */
+	mutex_lock(&ctx->op_mode_mutex);
+
+	if ((ctx->stream_op_mode == MFC_OP_TWO_MODE1 ||
+	     ctx->stream_op_mode == MFC_OP_TWO_MODE2) &&
+	    ctx->op_mode != MFC_OP_SWITCH_BUT_MODE2) {
+		ctx->cmd_counter++;
+		mfc_debug(2, "[2CORE] cmd_counter : %d\n", ctx->cmd_counter);
+	}
+
+	reg &= ~BIT(MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	if (IS_MULTI_MODE(ctx) || ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2)
+		reg |= BIT(MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	else
+		reg |= (0 << MFC_REG_D_NAL_START_OPT_TWO_MFC_ENABLE_SHIFT);
+	if (ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2) {
+		mfc_debug(2, "[2CORE] operate once op_mode %d\n", ctx->op_mode);
+		mfc_change_op_mode(ctx, MFC_OP_SWITCH_TO_SINGLE);
+	} else if (ctx->op_mode == MFC_OP_SWITCHING) {
+		mfc_err("[2CORE] It is a mode that can not operate\n");
+	} else if (ctx->op_mode == MFC_OP_SWITCH_TO_SINGLE) {
+		ctx->last_op_core = core->id;
+		mfc_debug(2, "[2CORE] last_op_core of switch_to_single : %d\n",
+			  ctx->last_op_core);
+	}
+
+	/* If it is switched to single, interrupt lock is not needed. */
+	if (IS_SWITCH_SINGLE_MODE(ctx))
+		mfc_clear_core_intlock(ctx);
+	mutex_unlock(&ctx->op_mode_mutex);
+	MFC_CORE_WRITEL(reg, MFC_REG_D_NAL_START_OPTIONS);
+	mfc_debug(3, "NAL_START_OPTIONS: %#x, op_mode: %d\n", reg, ctx->op_mode);
+
+	if (core->last_mfc_freq)
+		timeout_value = (core->last_mfc_freq * MFC_TIMEOUT_VALUE_IN_MSEC);
+	mfc_debug(2, "Last MFC Freq: %d, Timeout Value: %d\n",
+		  core->last_mfc_freq, timeout_value);
+
+	MFC_CORE_WRITEL(mfc_get_lower(dynamic_set), MFC_REG_D_DYNAMIC_DPB_FLAG_LOWER);
+	MFC_CORE_WRITEL(mfc_get_upper(dynamic_set), MFC_REG_D_DYNAMIC_DPB_FLAG_UPPER);
+	MFC_CORE_WRITEL(mfc_get_lower(dynamic_set), MFC_REG_D_AVAILABLE_DPB_FLAG_LOWER);
+	MFC_CORE_WRITEL(mfc_get_upper(dynamic_set), MFC_REG_D_AVAILABLE_DPB_FLAG_UPPER);
+
+	MFC_CORE_WRITEL(dec->slice_enable, MFC_REG_D_SLICE_IF_ENABLE);
+	MFC_CORE_WRITEL(timeout_value, MFC_REG_TIMEOUT_VALUE);
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+
+	/* source index for 2core mode2 should set just before sent command */
+	if (IS_TWO_MODE2(ctx) || IS_SWITCH_SINGLE_MODE(ctx)) {
+		mutex_lock(&ctx->op_mode_mutex);
+		mfc_debug(2, "[MFC-%d][STREAM] set cpb: %d, curr index: %d\n",
+			  core->id, src_index, ctx->curr_src_index);
+		ctx->curr_src_index = src_index;
+	}
+
+	/*
+	 * Issue different commands to instance basing on whether it
+	 * is the last frame or not.
+	 */
+	switch (last_frame) {
+	case 0:
+		mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_NAL_START);
+		break;
+	case 1:
+		mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_LAST_FRAME);
+		break;
+	}
+
+	if (IS_TWO_MODE2(ctx) || IS_SWITCH_SINGLE_MODE(ctx))
+		mutex_unlock(&ctx->op_mode_mutex);
+
+	mfc_debug(2, "Decoding a usual frame\n");
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
index 86b82d63f3b5..216d07c564ae 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
@@ -22,5 +22,14 @@ void mfc_core_cmd_wakeup(struct mfc_core *core);
 void mfc_core_cmd_open_inst(struct mfc_core *core, struct mfc_ctx *ctx);
 int mfc_core_cmd_close_inst(struct mfc_core *core, struct mfc_ctx *ctx);
 void mfc_core_cmd_abort_inst(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_core_cmd_move_inst(struct mfc_core *core, struct mfc_ctx *ctx);
+
+void mfc_core_cmd_dpb_flush(struct mfc_core *core, struct mfc_ctx *ctx);
 void mfc_core_cmd_cache_flush(struct mfc_core *core);
+
+void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx);
+
+int mfc_core_cmd_dec_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_cmd_dec_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
+			       int last_frame, int src_index);
 #endif /* __MFC_CORE_CMD_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
index ec6699dbd451..6950b8451c3d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
@@ -42,3 +42,349 @@ void mfc_core_dbg_set_addr(struct mfc_core *core)
 	MFC_CORE_WRITEL(core->dbg_info_buf.daddr, MFC_REG_DBG_BUFFER_ADDR);
 	MFC_CORE_WRITEL(buf_size->dbg_info_buf, MFC_REG_DBG_BUFFER_SIZE);
 }
+
+unsigned int mfc_get_frame_error_type(struct mfc_ctx *ctx, unsigned int err)
+{
+	struct mfc_dev *dev = ctx->dev;
+
+	if (!err) {
+		mfc_ctx_debug(4, "[FRAME] there is no error frame\n");
+		return MFC_ERR_FRAME_NO_ERR;
+	}
+
+	if (mfc_get_warn(err) == MFC_REG_ERR_BROKEN_LINK) {
+		mfc_ctx_debug(2, "[FRAME] Broken frame error (%d)\n", mfc_get_warn(err));
+		return MFC_ERR_FRAME_BROKEN;
+	} else if (mfc_get_warn(err) == MFC_REG_ERR_SYNC_POINT_NOT_RECEIVED) {
+		mfc_ctx_debug(2, "[FRAME] Sync point frame error (%d), type %d\n",
+			      mfc_get_warn(err), dev->pdata->display_err_type);
+		return dev->pdata->display_err_type;
+	}
+
+	mfc_ctx_debug(2, "[FRAME] Concealment frame error (%d)\n", mfc_get_warn(err));
+	return MFC_ERR_FRAME_CONCEALMENT;
+}
+
+void mfc_core_set_dec_dpb_and_scratch(struct mfc_core_ctx *core_ctx, dma_addr_t scratch_addr)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_raw_info *raw;
+	int i;
+
+	raw = &ctx->raw_buf;
+
+	MFC_CORE_WRITEL(dec->total_dpb_count, MFC_REG_D_NUM_DPB);
+	for (i = 0; i < raw->num_planes; i++) {
+		mfc_debug(2, "[FRAME] buf[%d] size: %d, stride: %d\n",
+			  i, raw->plane_size[i], raw->stride[i]);
+		MFC_CORE_WRITEL(raw->plane_size[i], MFC_REG_D_FIRST_PLANE_DPB_SIZE + (i * 4));
+		MFC_CORE_WRITEL(raw->stride[i],
+				MFC_REG_D_FIRST_PLANE_DPB_STRIDE_SIZE + (i * 4));
+	}
+
+	/* set scratch buffer */
+	MFC_CORE_DMA_WRITEL(scratch_addr, MFC_REG_D_SCRATCH_BUFFER_ADDR);
+	MFC_CORE_WRITEL(ctx->scratch_buf_size, MFC_REG_D_SCRATCH_BUFFER_SIZE);
+	mfc_debug(2, "[FRAME] scratch buf addr: 0x%#llx size %ld\n",
+		  scratch_addr, ctx->scratch_buf_size);
+}
+
+/* Set decoding frame buffer */
+int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int i;
+	size_t frame_size_mv;
+	dma_addr_t buf_addr;
+	int buf_size;
+	int align_gap;
+	unsigned int reg = 0;
+
+	buf_addr = core_ctx->codec_buf.daddr;
+	buf_size = core_ctx->codec_buf.size;
+
+	mfc_debug(2, "[MEMINFO] codec buf 0x%llx size: %d\n", buf_addr, buf_size);
+	mfc_debug(2, "Total DPB COUNT: %d, display delay: %d\n",
+		  dec->total_dpb_count, dec->display_delay);
+
+	if (core_ctx->codec_buffer_allocated && buf_size &&
+	    buf_size > core_ctx->codec_buf.dma_buf->size) {
+		mfc_info("[MEMINFO] Not enough codec buf size %d alloc size %zu\n",
+			 buf_size, core_ctx->codec_buf.dma_buf->size);
+		return -ENOMEM;
+	}
+
+	/* set decoder DPB size, stride, scratch buffer */
+	mfc_core_set_dec_dpb_and_scratch(core_ctx, buf_addr);
+	buf_addr += ctx->scratch_buf_size;
+	buf_size -= ctx->scratch_buf_size;
+
+	if (IS_H264_DEC(ctx))
+		MFC_CORE_WRITEL(ctx->mv_size, MFC_REG_D_MV_BUFFER_SIZE);
+
+	reg |= (dec->is_dynamic_dpb << MFC_REG_D_INIT_BUF_OPT_DYNAMIC_DPB_SET_SHIFT);
+
+	/* 16byte align, It is valid only for VP9 */
+	reg &= ~BIT(MFC_REG_D_INIT_BUF_OPT_STRIDE_SIZE_ALIGN);
+
+	reg &= ~BIT(MFC_REG_D_INIT_BUF_OPT_TWO_MODE_ENABLE_SHIFT);
+	if (IS_MULTI_MODE(ctx)) {
+		reg |= BIT(MFC_REG_D_INIT_BUF_OPT_TWO_MODE_ENABLE_SHIFT);
+		mfc_debug(2, "[2CORE] two mode(op_mode: %d) enable, reg %#x\n",
+			  ctx->op_mode, reg);
+	}
+
+	if (dev->pdata->support_mv_hevc)
+		reg |= BIT(MFC_REG_D_INIT_BUF_OPT_ENABLE_DECODE_VIEW1);
+	else
+		reg &= ~BIT(MFC_REG_D_INIT_BUF_OPT_ENABLE_DECODE_VIEW1);
+	MFC_CORE_WRITEL(reg, MFC_REG_D_INIT_BUFFER_OPTIONS);
+
+	mfc_debug(2, "[MEMINFO] codec buf remained size: %d\n", buf_size);
+	if (buf_size < 0) {
+		mfc_debug(2, "[MEMINFO] Not enough memory has been allocated\n");
+		return -ENOMEM;
+	}
+
+	/* MV buffers */
+	buf_addr = ctx->mv_buf.daddr;
+	buf_size = ctx->mv_buf.size;
+	mfc_debug(2, "[MEMINFO] MV buf 0x%llx size: %d\n", buf_addr, buf_size);
+
+	frame_size_mv = ctx->mv_size;
+	MFC_CORE_WRITEL(dec->mv_count, MFC_REG_D_NUM_MV);
+	if (IS_H264_DEC(ctx)) {
+		if (ctx->mv_buffer_allocated && buf_size &&
+		    buf_size > ctx->mv_buf.dma_buf->size) {
+			mfc_info("[MEMINFO] Not enough MV buf size %d alloc size %zu\n",
+				 buf_size, ctx->mv_buf.dma_buf->size);
+			return -ENOMEM;
+		}
+
+		for (i = 0; i < dec->mv_count; i++) {
+			align_gap = buf_addr;
+			buf_addr = ALIGN(buf_addr, 16);
+			align_gap = buf_addr - align_gap;
+			buf_size -= align_gap;
+
+			MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_D_MV_BUFFER0 + i * 4);
+			buf_addr += frame_size_mv;
+			buf_size -= frame_size_mv;
+		}
+	}
+
+	mfc_debug(2, "[MEMINFO] MV buf remained size: %d\n", buf_size);
+	if (buf_size < 0) {
+		mfc_debug(2, "[MEMINFO] Not enough memory has been allocated\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Set registers for decoding stream buffer */
+int mfc_core_set_dec_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf, unsigned int start_num_byte,
+				   unsigned int strm_size)
+{
+	size_t need_cpb_buf_size = 0, buf_size = 0;
+	dma_addr_t addr = 0;
+	struct vb2_buffer *vb = NULL;
+
+	mfc_ctx_debug_enter();
+
+	if (mfc_buf) {
+		vb = &mfc_buf->vb.vb2_buf;
+		addr = mfc_buf->addr[0][0];
+
+		if (core->dev->pdata->stream_buf_limit) {
+			need_cpb_buf_size = ALIGN(strm_size + 511, STREAM_BUF_ALIGN);
+			buf_size = mfc_buf->sg_size;
+		} else {
+			need_cpb_buf_size = strm_size;
+			buf_size = vb->planes[0].dbuf->size;
+		}
+
+		if (buf_size < need_cpb_buf_size)
+			mfc_ctx_info("Decrease buffer size: %zu(need) -> %zu(alloc)\n",
+				     need_cpb_buf_size, buf_size);
+
+		mfc_ctx_debug(2, "[BUFINFO] set src index: %d(%d), addr: 0x%08llx\n",
+			      vb->index, mfc_buf->src_index, addr);
+	}
+
+	mfc_ctx_debug(2, "[STREAM] strm_size, %#x, %d, offset, %#x, %u, need_buf_size, %zu, buf_size, %zu\n",
+		      strm_size, strm_size, start_num_byte, start_num_byte,
+		      need_cpb_buf_size, buf_size);
+
+	if (strm_size == 0)
+		mfc_ctx_info("stream size is 0\n");
+
+	MFC_CORE_WRITEL(strm_size, MFC_REG_D_STREAM_DATA_SIZE);
+	MFC_CORE_DMA_WRITEL(addr, MFC_REG_D_CPB_BUFFER_ADDR);
+	MFC_CORE_WRITEL(buf_size, MFC_REG_D_CPB_BUFFER_SIZE);
+	MFC_CORE_WRITEL(start_num_byte, MFC_REG_D_CPB_BUFFER_OFFSET);
+	ctx->last_src_addr = addr;
+
+	mfc_ctx_debug_leave();
+	return 0;
+}
+
+void mfc_core_set_dynamic_dpb(struct mfc_core *core, struct mfc_ctx *ctx,
+			      struct mfc_buf *dst_mb)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_raw_info *raw = &ctx->raw_buf;
+	int index_view = ctx->select_view == MFC_VIEW_ID_MAIN ? MFC_MV_BUF_IDX_VIEW0
+							      : MFC_MV_BUF_IDX_VIEW1;
+	/* offset about fd */
+	int offset = ctx->view_buf_info[index_view].offset;
+	int dst_index;
+	int i;
+
+	if (ctx->select_view == MFC_VIEW_ID_MAIN)
+		dst_index = dst_mb->dpb_index;
+	else
+		dst_index = dst_mb->dpb_index + MFC_MAX_DPBS / 2;
+
+	/* for debugging about black bar detection */
+	if ((MFC_FEATURE_SUPPORT(dev, dev->pdata->black_bar) && dec->detect_black_bar) ||
+	    (dev->debugfs.feature_option & MFC_OPTION_BLACK_BAR_ENABLE)) {
+		for (i = 0; i < raw->num_planes; i++) {
+			dec->frame_vaddr[i][dec->frame_cnt] =
+				vb2_plane_vaddr(&dst_mb->vb.vb2_buf, i);
+			dec->frame_daddr[i][dec->frame_cnt] = dst_mb->addr[0][i];
+			dec->frame_size[i][dec->frame_cnt] = raw->plane_size[i];
+			dec->index[i][dec->frame_cnt] = dst_index;
+			dec->fd[i][dec->frame_cnt] = dst_mb->vb.vb2_buf.planes[0].m.fd;
+		}
+		dec->frame_cnt++;
+		if (dec->frame_cnt >= 30)
+			dec->frame_cnt = 0;
+	}
+
+	for (i = 0; i < raw->num_planes; i++) {
+		MFC_CORE_WRITEL(raw->plane_size[i],
+				MFC_REG_D_FIRST_PLANE_DPB_SIZE + i * 4);
+		MFC_CORE_DMA_WRITEL(dst_mb->addr[index_view][i],
+				    MFC_REG_D_FIRST_PLANE_DPB0 + (i * 0x100 + dst_index * 4));
+		ctx->last_dst_addr[i] = dst_mb->addr[index_view][i];
+		mfc_debug(2, "%s[%d][%d], addr[%d]: 0x%08llx, fd: %d, size: %d%s %d, offset: %d\n",
+			  "[BUFINFO][DPB] set dst index: ", dst_mb->vb.vb2_buf.index,
+			  dst_mb->dpb_index, i,
+			  dst_mb->addr[index_view][i], dst_mb->vb.vb2_buf.planes[offset + i].m.fd,
+			  raw->plane_size[i],
+			  ", index_view:", index_view,
+			  offset);
+	}
+
+	MFC_TRACE_CORE_CTX("Set dst[%d] fd: %d, %#llx / used %#lx\n",
+			   dst_index, dst_mb->vb.vb2_buf.planes[offset].m.fd,
+			   dst_mb->addr[index_view][0], dec->dynamic_used);
+}
+
+void mfc_core_get_img_size(struct mfc_core *core, struct mfc_ctx *ctx,
+			   enum mfc_get_img_size img_size)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int w, h;
+	int i;
+
+	w = ctx->img_width;
+	h = ctx->img_height;
+
+	ctx->img_width = mfc_core_get_img_width();
+	ctx->img_height = mfc_core_get_img_height();
+	ctx->crop_width = ctx->img_width;
+	ctx->crop_height = ctx->img_height;
+
+	for (i = 0; i < ctx->dst_fmt->num_planes; i++)
+		ctx->raw_buf.stride[i] = mfc_core_get_stride_size(i);
+
+	mfc_ctx_debug(2, "[FRAME][DRC] resolution changed, %dx%d => %dx%d (stride: %d)\n", w, h,
+		      ctx->img_width, ctx->img_height, ctx->raw_buf.stride[0]);
+
+	if (img_size == MFC_GET_RESOL_SIZE) {
+		dec->disp_drc.width[dec->disp_drc.push_idx] = ctx->img_width;
+		dec->disp_drc.height[dec->disp_drc.push_idx] = ctx->img_height;
+		dec->disp_drc.disp_res_change++;
+		mfc_ctx_debug(3, "[DRC] disp_res_change[%d] count %d\n",
+			      dec->disp_drc.push_idx, dec->disp_drc.disp_res_change);
+		dec->disp_drc.push_idx = (dec->disp_drc.push_idx + 1) % MFC_MAX_DRC_FRAME;
+	} else if (img_size == MFC_GET_RESOL_DPB_SIZE) {
+		ctx->scratch_buf_size = mfc_core_get_scratch_size();
+		for (i = 0; i < ctx->dst_fmt->num_planes; i++)
+			ctx->min_dpb_size[i] = mfc_core_get_min_dpb_size(i);
+
+		mfc_ctx_debug(2, "[FRAME][DRC] DPB count %d, %s %d(%#x) %s %d scratch %zu(%#zx)\n",
+			      ctx->dpb_count, "min_dpb_size", ctx->min_dpb_size[0],
+			      ctx->min_dpb_size[0], "min_dpb_size_2bits",
+			      ctx->min_dpb_size_2bits[0],
+			      ctx->scratch_buf_size, ctx->scratch_buf_size);
+	}
+}
+
+void mfc_core_set_pixel_format(struct mfc_core *core, struct mfc_ctx *ctx,
+			       unsigned int format)
+{
+	unsigned int reg = 0;
+	unsigned int pix_val;
+	unsigned int block_align = 0;
+
+	switch (format) {
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV12MT_16X16:
+	case V4L2_PIX_FMT_NV16M:
+		pix_val = 0;
+		break;
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61M:
+		pix_val = 1;
+		break;
+	case V4L2_PIX_FMT_YVU420M:
+		pix_val = 2;
+		break;
+	case V4L2_PIX_FMT_YUV420M:
+		pix_val = 3;
+		break;
+	case V4L2_PIX_FMT_ARGB32:
+		pix_val = 8;
+		break;
+	case V4L2_PIX_FMT_RGB24:
+		pix_val = 9;
+		break;
+	case V4L2_PIX_FMT_RGB565:
+		pix_val = 10;
+		break;
+	case V4L2_PIX_FMT_RGB32:
+		pix_val = 11;
+		break;
+	case V4L2_PIX_FMT_RGB32X:
+		pix_val = 12;
+		break;
+	case V4L2_PIX_FMT_BGR32:
+		pix_val = 13;
+		break;
+	default:
+		pix_val = 0;
+		break;
+	}
+	mfc_set_bits(reg, 0xf, 0, pix_val);
+
+	/* for YUV format */
+	if (pix_val < 4)
+		mfc_set_bits(reg, 0x3, 4, ctx->mem_type_10bit);
+
+	mfc_set_bits(reg, 0x3, 10, block_align);
+
+	MFC_CORE_WRITEL(reg, MFC_REG_PIXEL_FORMAT);
+	mfc_ctx_debug(2, "[FRAME] pix format: %d, mem_type_10bit: %d, (reg: %#x)\n",
+		      pix_val, ctx->mem_type_10bit, reg);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
index a23d25edce5d..e7c28b2f2b5d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
@@ -13,6 +13,7 @@
 #define __MFC_CORE_REG_API_H __FILE__
 
 #include "base/mfc_regs.h"
+
 #include "base/mfc_utils.h"
 
 /* version */
@@ -34,13 +35,226 @@
 #define mfc_core_get_mfc_version()	((MFC_CORE_READL(MFC_REG_MFC_VERSION)		\
 						>> MFC_REG_MFC_VER_SHFT)		\
 						& MFC_REG_MFC_VER_MASK)
+#define mfc_core_get_processing_cycle()	MFC_CORE_READL(MFC_REG_PROCESSING_CYCLE)
+
+/* decoding & display information */
+#define mfc_core_get_dec_status()	(MFC_CORE_READL(MFC_REG_D_DECODED_STATUS)		\
+						& MFC_REG_DEC_STATUS_DECODED_STATUS_MASK)
+#define mfc_core_get_disp_status()	(MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						& MFC_REG_DISP_STATUS_DISPLAY_STATUS_MASK)
+#define mfc_core_get_res_change()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						>> MFC_REG_DISP_STATUS_RES_CHANGE_SHIFT)	\
+						& MFC_REG_DISP_STATUS_RES_CHANGE_MASK)
+#define mfc_core_get_black_bar_detection()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)	\
+						>> MFC_REG_DISP_STATUS_BLACK_BAR_DETECT_SHIFT)	\
+						& MFC_REG_DISP_STATUS_BLACK_BAR_DETECT_MASK)
+#define mfc_core_get_decoded_frame_cnt()	MFC_CORE_READL(MFC_REG_D_DECODED_FRAME_COUNT)
+#define mfc_core_get_display_frame_cnt()	MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_COUNT)
+#define mfc_core_get_dpb_change()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						>> MFC_REG_DISP_STATUS_NEED_DPB_CHANGE_SHIFT)	\
+						& MFC_REG_DISP_STATUS_NEED_DPB_CHANGE_MASK)
+#define mfc_core_get_scratch_change()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+					>> MFC_REG_DISP_STATUS_NEED_SCRATCH_CHANGE_SHIFT)	\
+						& MFC_REG_DISP_STATUS_NEED_SCRATCH_CHANGE_MASK)
+#define mfc_core_get_uncomp()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						>> MFC_REG_DISP_STATUS_UNCOMP_SHIFT)	\
+						& MFC_REG_DISP_STATUS_UNCOMP_MASK)
+#define mfc_core_get_last_display()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						>> MFC_REG_DISP_STATUS_LAST_DISPLAY_FRAME_SHIFT) \
+						& MFC_REG_DISP_STATUS_LAST_DISPLAY_FRAME_MASK)
+
+#define mfc_core_get_disp_frame_type()	(MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_TYPE)	\
+						& MFC_REG_DISPLAY_FRAME_MASK)
+#define mfc_core_get_dec_frame_type()	(MFC_CORE_READL(MFC_REG_D_DECODED_FRAME_TYPE)	\
+						& MFC_REG_DECODED_FRAME_MASK)
+#define mfc_core_get_disp_idr_flag()				\
+	((MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_TYPE)	\
+	>> MFC_REG_DISPLAY_IDR_FLAG_SHIFT)		\
+	& MFC_REG_DISPLAY_IDR_FLAG_MASK)
+#define mfc_core_get_dec_idr_flag()				\
+	((MFC_CORE_READL(MFC_REG_D_DECODED_FRAME_TYPE)	\
+	>> MFC_REG_DECODED_IDR_FLAG_SHIFT)		\
+	& MFC_REG_DECODED_IDR_FLAG_MASK)
+#define mfc_core_get_dec_temporal_id()			\
+	((MFC_CORE_READL(MFC_REG_D_H264_INFO)		\
+	>> MFC_REG_D_H264_INFO_TEMPORAL_ID_SHIFT)	\
+	& MFC_REG_D_H264_INFO_TEMPORAL_ID_MASK)
+#define mfc_core_get_interlace_type()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_TYPE)	\
+						>> MFC_REG_DISPLAY_TEMP_INFO_SHIFT)	\
+						& MFC_REG_DISPLAY_TEMP_INFO_MASK)
+#define mfc_core_is_interlace_picture()	((MFC_CORE_READL(MFC_REG_D_DISPLAY_STATUS)		\
+						>> MFC_REG_DISP_STATUS_INTERLACE_SHIFT)\
+						& MFC_REG_DISP_STATUS_INTERLACE_MASK)
+#define mfc_core_is_mbaff_picture()	((MFC_CORE_READL(MFC_REG_D_H264_INFO)		\
+						>> MFC_REG_D_H264_INFO_MBAFF_FRAME_FLAG_SHIFT)\
+						& MFC_REG_D_H264_INFO_MBAFF_FRAME_FLAG_MASK)
+
+#define mfc_core_get_img_width()		MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_WIDTH)
+#define mfc_core_get_img_height()	MFC_CORE_READL(MFC_REG_D_DISPLAY_FRAME_HEIGHT)
+#define mfc_core_get_disp_y_addr()	MFC_CORE_DMA_READL(MFC_REG_D_DISPLAY_LUMA_ADDR)
+#define mfc_core_get_dec_y_addr()	MFC_CORE_DMA_READL(MFC_REG_D_DECODED_LUMA_ADDR)
+#define mfc_core_get_crc_luma()		MFC_CORE_READL(MFC_REG_D_DISPLAY_FIRST_PLANE_CRC)
+#define mfc_core_get_crc_chroma()	MFC_CORE_READL(MFC_REG_D_DISPLAY_SECOND_PLANE_CRC)
 
 /* kind of interrupt */
 #define mfc_core_get_int_err()		MFC_CORE_READL(MFC_REG_ERROR_CODE)
 
+/* additional information */
+#define mfc_core_get_consumed_stream()		MFC_CORE_READL(MFC_REG_D_DECODED_NAL_SIZE)
+#define mfc_core_get_dpb_count()		MFC_CORE_READL(MFC_REG_D_MIN_NUM_DPB)
+#define mfc_core_get_min_dpb_size(x)		\
+	MFC_CORE_READL(MFC_REG_D_MIN_FIRST_PLANE_DPB_SIZE + ((x) * 4))
+#define mfc_core_get_scratch_size()		MFC_CORE_READL(MFC_REG_D_MIN_SCRATCH_BUFFER_SIZE)
+#define mfc_core_get_stride_size(x)		\
+	MFC_CORE_READL(MFC_REG_D_FIRST_PLANE_DPB_STRIDE_SIZE + ((x) * 4))
+
+#define mfc_core_get_mv_count()			MFC_CORE_READL(MFC_REG_D_MIN_NUM_MV)
 #define mfc_core_get_inst_no()			MFC_CORE_READL(MFC_REG_RET_INSTANCE_ID)
+#define mfc_core_get_sei_avail()		MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)
+#define mfc_core_get_sei_content_light()	\
+	MFC_CORE_READL(MFC_REG_D_CONTENT_LIGHT_LEVEL_INFO_SEI)
+#define mfc_core_get_sei_mastering0()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_0)
+#define mfc_core_get_sei_mastering1()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_1)
+#define mfc_core_get_sei_mastering2()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_2)
+#define mfc_core_get_sei_mastering3()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_3)
+#define mfc_core_get_sei_mastering4()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_4)
+#define mfc_core_get_sei_mastering5()		\
+	MFC_CORE_READL(MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_5)
+#define mfc_core_get_sei_avail_frame_pack()	(MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)	\
+						& MFC_REG_D_SEI_AVAIL_FRAME_PACK_MASK)
+#define mfc_core_get_sei_avail_content_light()	((MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)	\
+						>> MFC_REG_D_SEI_AVAIL_CONTENT_LIGHT_SHIFT)	\
+						& MFC_REG_D_SEI_AVAIL_CONTENT_LIGHT_MASK)
+#define mfc_core_get_sei_avail_mastering_display()	((MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)	\
+						>> MFC_REG_D_SEI_AVAIL_MASTERING_DISPLAY_SHIFT)	\
+						& MFC_REG_D_SEI_AVAIL_MASTERING_DISPLAY_MASK)
+
+#define mfc_core_get_video_signal_type()	((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
+						>> MFC_REG_D_VIDEO_SIGNAL_TYPE_FLAG_SHIFT)	\
+						& MFC_REG_D_VIDEO_SIGNAL_TYPE_FLAG_MASK)
+#define mfc_core_get_colour_description()	((MFC_CORE_READL(MFC_REG_D_VIDEO_SIGNAL_TYPE)	\
+						>> MFC_REG_D_COLOUR_DESCRIPTION_FLAG_SHIFT)	\
+						& MFC_REG_D_COLOUR_DESCRIPTION_FLAG_MASK)
+
+#define mfc_core_get_black_bar_pos_x()		((MFC_CORE_READL(MFC_REG_D_BLACK_BAR_START_POS)	\
+						>> MFC_REG_D_BLACK_BAR_START_X_SHIFT)		\
+						& MFC_REG_D_BLACK_BAR_START_X_MASK)
+#define mfc_core_get_black_bar_pos_y()		((MFC_CORE_READL(MFC_REG_D_BLACK_BAR_START_POS)	\
+						>> MFC_REG_D_BLACK_BAR_START_Y_SHIFT)		\
+						& MFC_REG_D_BLACK_BAR_START_Y_MASK)
+#define mfc_core_get_black_bar_image_w()	((MFC_CORE_READL(MFC_REG_D_BLACK_BAR_IMAGE_SIZE)  \
+						>> MFC_REG_D_BLACK_BAR_IMAGE_W_SHIFT)	\
+						& MFC_REG_D_BLACK_BAR_IMAGE_W_MASK)
+#define mfc_core_get_black_bar_image_h()	((MFC_CORE_READL(MFC_REG_D_BLACK_BAR_IMAGE_SIZE)  \
+						>> MFC_REG_D_BLACK_BAR_IMAGE_H_SHIFT)	\
+						& MFC_REG_D_BLACK_BAR_IMAGE_H_MASK)
+#define mfc_core_get_mvc_disp_view_id()		(MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
+						& MFC_REG_D_MVC_VIEW_ID_DISP_MASK)
+#define mfc_core_get_mvc_view_id_dec_order()	((MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
+						>> MFC_REG_D_MVC_VIEW_ID_DEC_SHIFT)	\
+						& MFC_REG_D_MVC_VIEW_ID_DEC_MASK)
+#define mfc_core_get_mvc_view_id_disp_order()	(MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
+						& MFC_REG_D_MVC_VIEW_ID_DISP_MASK)
+#define mfc_core_get_mvc_right_view_id()	((MFC_CORE_READL(MFC_REG_D_MVC_VIEW_ID)		\
+						>> MFC_REG_D_MVC_RIGHT_VIEW_ID_SHIFT)	\
+						& MFC_REG_D_MVC_RIGHT_VIEW_ID_MASK)
+#define mfc_core_get_profile()		(MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+					& MFC_REG_D_DECODED_PIC_PROFILE_MASK)
+
+#define mfc_core_get_display_delay()				\
+	((MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+	>> MFC_REG_D_DISPLAY_DELAY_SHIFT)		\
+	& MFC_REG_D_DISPLAY_DELAY_MASK)
+#define mfc_core_get_two_core_mode()				\
+	((MFC_CORE_READL(MFC_REG_D_DECODED_PICTURE_PROFILE)	\
+	>> MFC_REG_D_TWO_MFC_MODE_SHIFT)		\
+	& MFC_REG_D_TWO_MFC_MODE_MASK)
+#define mfc_core_get_dec_used_flag()		(((unsigned long)(MFC_CORE_READL		\
+						(MFC_REG_D_USED_DPB_FLAG_UPPER)) << 32) |	\
+						MFC_CORE_READL(MFC_REG_D_USED_DPB_FLAG_LOWER))
+
+#define mfc_core_get_num_of_tile()		((MFC_CORE_READL(MFC_REG_D_DECODED_STATUS)	\
+						>> MFC_REG_DEC_STATUS_NUM_OF_TILE_SHIFT)	\
+						& MFC_REG_DEC_STATUS_NUM_OF_TILE_MASK)
+
+static inline void mfc_core_dec_get_crop_info(struct mfc_core *core,
+					      struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	u32 left, right, top, bottom;
+
+	left = MFC_CORE_READL(MFC_REG_D_DISPLAY_CROP_INFO1);
+	right = left >> MFC_REG_D_SHARED_CROP_RIGHT_SHIFT;
+	left = left & MFC_REG_D_SHARED_CROP_LEFT_MASK;
+	top = MFC_CORE_READL(MFC_REG_D_DISPLAY_CROP_INFO2);
+	bottom = top >> MFC_REG_D_SHARED_CROP_BOTTOM_SHIFT;
+	top = top & MFC_REG_D_SHARED_CROP_TOP_MASK;
+
+	dec->cr_left = left;
+	dec->cr_right = right;
+	dec->cr_top = top;
+	dec->cr_bot = bottom;
+}
+
+static inline void mfc_core_update_tag(struct mfc_core *core, struct mfc_ctx *ctx,
+				       int tag)
+{
+	if (MFC_CORE_READL(MFC_REG_D_PICTURE_TAG) != tag) {
+		mfc_ctx_debug(2, "reused src's tag is different so update to %d\n",
+			      tag);
+		MFC_CORE_WRITEL(tag, MFC_REG_D_PICTURE_TAG);
+	}
+}
+
+static inline void mfc_core_set_migration_addr(struct mfc_core *core, struct mfc_ctx *ctx,
+					       dma_addr_t fw_addr, dma_addr_t common_ctx_addr)
+{
+	struct mfc_special_buf *ctx_buf = NULL;
+
+	ctx_buf = &core->common_ctx_buf;
+
+	MFC_CORE_DMA_WRITEL(fw_addr, MFC0_REG_RISC_BASE_ADDR);
+	MFC_CORE_WRITEL(common_ctx_addr, MFC0_REG_COMMON_CONTEXT_MEM_ADDR);
+	MFC_CORE_WRITEL(ctx_buf->daddr, MFC1_REG_COMMON_CONTEXT_MEM_ADDR);
+	mfc_core_debug(2, "migration MFC0 FW base: %#llx, context: %#llx, MFC1 context: %#llx\n",
+		       fw_addr, common_ctx_addr, ctx_buf->daddr);
+}
+
+static inline void mfc_core_clear_main_core_context_flush_done(struct mfc_core *core)
+{
+	/*
+	 * When op_mode is changed from single to multi,
+	 * by calling NAL_START of both core simultaneously,
+	 * FW can get the invalid information of main core.
+	 * So, when switching op_mode to multi-core mode,
+	 * clear the status of main core about this.
+	 */
+	MFC_CORE_WRITEL(0, MFC0_REG_CONTEXT_FLUSH_DONE);
+	MFC_TRACE_CORE("Clear MAIN_CORE_CONTEXT_FLUSH_DONE\n");
+}
 
 void mfc_core_dbg_enable(struct mfc_core *core);
 void mfc_core_dbg_disable(struct mfc_core *core);
 void mfc_core_dbg_set_addr(struct mfc_core *core);
+
+unsigned int mfc_get_frame_error_type(struct mfc_ctx *ctx, unsigned int err);
+
+void mfc_core_set_dec_dpb_and_scratch(struct mfc_core_ctx *core_ctx, dma_addr_t scratch_addr);
+int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx);
+int mfc_core_set_dec_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf, unsigned int start_num_byte,
+				   unsigned int buf_size);
+
+void mfc_core_set_dynamic_dpb(struct mfc_core *core, struct mfc_ctx *ctx,
+			      struct mfc_buf *dst_vb);
+
+void mfc_core_get_img_size(struct mfc_core *core, struct mfc_ctx *ctx,
+			   enum mfc_get_img_size img_size);
+void mfc_core_set_pixel_format(struct mfc_core *core, struct mfc_ctx *ctx,
+			       unsigned int format);
 #endif /* __MFC_CORE_REG_API_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
index de13cdb9c99a..e4b839eda2da 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
@@ -13,6 +13,9 @@
 
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_qos.h"
+#include "base/mfc_queue.h"
+
 #define R2H_BIT(x)	({		\
 	typeof(x) _x = (x);		\
 	(_x > 0) ? BIT(_x - 1) : 0;	\
@@ -40,10 +43,26 @@ static inline unsigned int __mfc_r2h_bit_mask(int cmd)
 void mfc_get_corelock_ctx(struct mfc_ctx *ctx)
 {
 	unsigned long flags;
+	unsigned int timeout = MFC_INT_TIMEOUT * MFC_INT_TIMEOUT_CNT;
+	int ret;
 
 	spin_lock_irqsave(&ctx->corelock.lock, flags);
-	mfc_ctx_debug(3, "[CORELOCK] get_corelock: cnt %d\n",
-		      ctx->corelock.cnt);
+	mfc_ctx_debug(3, "[CORELOCK] get_corelock: cnt %d, migrate %d\n",
+		      ctx->corelock.cnt, ctx->corelock.migrate);
+
+	if (ctx->corelock.migrate) {
+		spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+		mfc_ctx_debug(2, "[CORELOCK] now migration... start waiting corelock\n");
+		ret = wait_event_timeout(ctx->corelock.migrate_wq,
+					 (ctx->corelock.migrate == 0),
+					 msecs_to_jiffies(timeout));
+		if (ret == 0)
+			mfc_ctx_err("[CORELOCK] waiting corelock for migration timed out\n");
+		else
+			mfc_ctx_debug(2, "[CORELOCK] finished waiting corelock for migration\n");
+
+		spin_lock_irqsave(&ctx->corelock.lock, flags);
+	}
 
 	ctx->corelock.cnt++;
 
@@ -62,8 +81,57 @@ void mfc_release_corelock_ctx(struct mfc_ctx *ctx)
 	else if (ctx->corelock.cnt < 0)
 		mfc_ctx_err("[CORELOCK] wrong corelock cnt %d\n", ctx->corelock.cnt);
 
-	mfc_ctx_debug(3, "[CORELOCK] release_corelock: cnt %d\n",
-		      ctx->corelock.cnt);
+	mfc_ctx_debug(3, "[CORELOCK] release_corelock: cnt %d, migrate %d\n",
+		      ctx->corelock.cnt, ctx->corelock.migrate);
+	spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+}
+
+int mfc_get_corelock_migrate(struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+	unsigned int timeout = MFC_INT_TIMEOUT * MFC_INT_TIMEOUT_CNT;
+	int ret;
+
+	spin_lock_irqsave(&ctx->corelock.lock, flags);
+	ctx->corelock.migrate = 1;
+	mfc_ctx_debug(2, "[CORELOCK] get_corelock_migrate: cnt %d, migrate %d\n",
+		      ctx->corelock.cnt, ctx->corelock.migrate);
+
+	if (ctx->corelock.cnt) {
+		spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+		mfc_ctx_debug(2, "[CORELOCK] start waiting corelock\n");
+		ret = wait_event_timeout(ctx->corelock.wq,
+					 (ctx->corelock.cnt == 0),
+					 msecs_to_jiffies(timeout));
+		if (ret == 0) {
+			spin_lock_irqsave(&ctx->corelock.lock, flags);
+			ctx->corelock.migrate = 0;
+			wake_up(&ctx->corelock.migrate_wq);
+			spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+			mfc_ctx_err("[CORELOCK] waiting corelock timed out (%d)\n",
+				    ctx->corelock.cnt);
+			return -EBUSY;
+		}
+
+		mfc_ctx_debug(2, "[CORELOCK] finished waiting corelock\n");
+		spin_lock_irqsave(&ctx->corelock.lock, flags);
+	}
+
+	spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+
+	return 0;
+}
+
+void mfc_release_corelock_migrate(struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->corelock.lock, flags);
+
+	ctx->corelock.migrate = 0;
+	mfc_ctx_debug(2, "[CORELOCK] wakeup migration wait\n");
+	wake_up(&ctx->corelock.migrate_wq);
+
 	spin_unlock_irqrestore(&ctx->corelock.lock, flags);
 }
 
@@ -188,3 +256,114 @@ void mfc_wake_up_core(struct mfc_core *core, unsigned int reason,
 	core->int_err = err;
 	wake_up(&core->cmd_wq);
 }
+
+/* Wake up context wait_queue */
+void mfc_wake_up_core_ctx(struct mfc_core_ctx *core_ctx, unsigned int reason,
+			  unsigned int err)
+{
+	core_ctx->int_condition = 1;
+	core_ctx->int_reason = reason;
+	core_ctx->int_err = err;
+	wake_up(&core_ctx->cmd_wq);
+}
+
+static int __mfc_dec_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	int is_ready = 0;
+	int src_buf_cnt, dst_buf_cnt;
+
+	src_buf_cnt = mfc_get_queue_count(&ctx->buf_queue_lock, &core_ctx->src_buf_queue);
+	dst_buf_cnt = mfc_get_available_dpb_count(core_ctx);
+
+	/* Context is to parse header */
+	if (core_ctx->state == MFCINST_GOT_INST && src_buf_cnt)
+		is_ready = 1;
+
+	/* Context is to decode a frame */
+	else if ((core_ctx->state == MFCINST_RUNNING) && (ctx->wait_state == WAIT_NONE)) {
+		if (src_buf_cnt && dst_buf_cnt)
+			is_ready = 1;
+	}
+
+	/* Context is to return last frame */
+	else if (core_ctx->state == MFCINST_FINISHING && dst_buf_cnt)
+		is_ready = 1;
+
+	/* Context is to set buffers */
+	else if (core_ctx->state == MFCINST_HEAD_PARSED &&
+		 (ctx->wait_state == WAIT_NONE && dst_buf_cnt))
+		is_ready = 1;
+
+	/* Resolution change
+	 * In the case of 2core DRC, state could be SWITCH_TO_SINGLE.
+	 * After subcore deinit, state will be changed to SINGLE.
+	 */
+	else if ((core_ctx->state == MFCINST_RES_CHANGE_INIT ||
+		  core_ctx->state == MFCINST_RES_CHANGE_FLUSH ||
+		 core_ctx->state == MFCINST_RES_CHANGE_FLUSH_FINISHED) && dst_buf_cnt &&
+		 (IS_SINGLE_MODE(ctx) || ctx->op_mode == MFC_OP_SWITCH_TO_SINGLE))
+		is_ready = 1;
+
+	else if (core_ctx->state == MFCINST_RES_CHANGE_END && src_buf_cnt)
+		is_ready = 1;
+
+	return is_ready;
+}
+
+int mfc_ctx_ready_set_bit_raw(struct mfc_core_ctx *core_ctx, unsigned long *bits, bool set)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	int is_ready = 0;
+
+	/* If shutdown is called, do not try any cmd */
+	if (core->shutdown)
+		return 0;
+
+	mfc_debug(1, "[MFC-%d][c:%d] src = %d(ready = %d), dst = %d, state = %d, capstat = %d, waitstat = %d\n",
+		  core->id, ctx->num,
+		  mfc_get_queue_count(&ctx->buf_queue_lock,
+				      &core_ctx->src_buf_queue),
+		  mfc_get_queue_count(&ctx->buf_queue_lock,
+				      &ctx->src_buf_ready_queue),
+		  mfc_get_queue_count(&ctx->buf_queue_lock,
+				      &ctx->dst_buf_queue),
+		  core_ctx->state, ctx->capture_state, ctx->wait_state);
+
+	is_ready = __mfc_dec_ctx_ready_set_bit(core_ctx);
+
+	if (is_ready && set) {
+		/* if the ctx is ready and request set_bit, set the work_bit */
+		__set_bit(ctx->num, bits);
+	} else if (!is_ready && !set) {
+		/* if the ctx is not ready and request clear_bit, clear the work_bit */
+		__clear_bit(ctx->num, bits);
+	} else {
+		if (set) {
+			/* If the ctx is not ready, this is not included to S/W driver margin */
+			mfc_debug(2, "ctx is not ready\n");
+		}
+	}
+
+	return is_ready;
+}
+
+static int __mfc_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx,
+				   struct mfc_bits *data, bool set)
+{
+	unsigned long flags;
+	int is_ready = 0;
+
+	/* The ready condition check and set work_bit should be synchronized */
+	spin_lock_irqsave(&data->lock, flags);
+	is_ready = mfc_ctx_ready_set_bit_raw(core_ctx, &data->bits, set);
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return is_ready;
+}
+
+int mfc_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx, struct mfc_bits *data)
+{
+	return __mfc_ctx_ready_set_bit(core_ctx, data, true);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
index 2c19819048de..94c1128b16cc 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
@@ -16,10 +16,19 @@
 
 void mfc_get_corelock_ctx(struct mfc_ctx *ctx);
 void mfc_release_corelock_ctx(struct mfc_ctx *ctx);
+int mfc_get_corelock_migrate(struct mfc_ctx *ctx);
+void mfc_release_corelock_migrate(struct mfc_ctx *ctx);
 
 int mfc_wait_for_done_core(struct mfc_core *core, int command);
 int mfc_wait_for_done_core_ctx(struct mfc_core_ctx *core_ctx, int command);
 void mfc_wake_up_core(struct mfc_core *core, unsigned int reason,
 		      unsigned int err);
+void mfc_wake_up_core_ctx(struct mfc_core_ctx *core_ctx, unsigned int reason,
+			  unsigned int err);
+
 int mfc_core_get_new_ctx(struct mfc_core *core);
+
+int mfc_ctx_ready_set_bit_raw(struct mfc_core_ctx *core_ctx, unsigned long *bits, bool set);
+int mfc_ctx_ready_set_bit(struct mfc_core_ctx *core_ctx, struct mfc_bits *data);
+
 #endif /* __MFC_CORE_SYNC_H */
-- 
2.34.1

