Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913BBAB792
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7788D10E4CE;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="AS7/ffSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9210E276
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:14 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250930035706epoutp04b6c7d3daa9563f96c61e325fcb6680e2~p80l7EW0k2088620886epoutp04T
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:57:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250930035706epoutp04b6c7d3daa9563f96c61e325fcb6680e2~p80l7EW0k2088620886epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204626;
 bh=LLGsAYmAe+l/wKy2rCHRpwWnMBTKXt8cNThh2lgaqXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AS7/ffSUWhU2LeRxs3sei1l4lqcA4uGwajT0jObdLvBREKUKIbuTc1ri3SxblKSPI
 zFt6odoEGDpR3UdGfLzYPykRG7gXTl6MUyMNUj7LFIuRSpuve+oX2DVrvisvIHAObM
 6tbb/ejXeTPcvAUUxErJ1rtf6y8Vx8w6jUN081lY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035705epcas5p3e3023bc3fa1c082cbecb3f8100c17a85~p80lVIcvU1975219752epcas5p3z;
 Tue, 30 Sep 2025 03:57:05 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPQ84Lvgz6B9mG; Tue, 30 Sep
 2025 03:57:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035703epcas5p18e09c3e9e07401f4b268ea77bc831987~p80joTAXP1549615496epcas5p12;
 Tue, 30 Sep 2025 03:57:03 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035701epsmtip1ba6a8cafc8ebd7db9415a278f8543985~p80g-n4TH2942629426epsmtip1O;
 Tue, 30 Sep 2025 03:57:00 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 26/29] media: mfc: Add full encoder support
Date: Tue, 30 Sep 2025 09:33:45 +0530
Message-Id: <20250930040348.3702923-27-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035703epcas5p18e09c3e9e07401f4b268ea77bc831987
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035703epcas5p18e09c3e9e07401f4b268ea77bc831987
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035703epcas5p18e09c3e9e07401f4b268ea77bc831987@epcas5p1.samsung.com>
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

- Integrate encoder command API into core flow.
- Extend hardware‑lock handling for encoder state.
- Manage encoder resources on instance open/close.
- Add APIs for buffers, codec parameters, and status.
- Update core ops, macros, headers, and error handling.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/mfc_core_cmd.c         | 119 ++++++++++++
 .../samsung/exynos-mfc/mfc_core_cmd.h         |   6 +
 .../samsung/exynos-mfc/mfc_core_hwlock.c      |  61 +++++++
 .../samsung/exynos-mfc/mfc_core_ops.c         | 154 ++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_reg_api.c     | 169 ++++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_reg_api.h     |  55 ++++++
 .../samsung/exynos-mfc/mfc_core_run.c         | 127 +++++++++++++
 .../samsung/exynos-mfc/mfc_core_run.h         |   5 +
 8 files changed, 696 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
index aaf216741575..a1de7920786b 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
@@ -12,6 +12,7 @@
 #include "mfc_core_cmd.h"
 #include "mfc_core_intlock.h"
 
+#include "mfc_core_enc_param.h"
 #include "mfc_core_hw_reg_api.h"
 
 #include "base/mfc_utils.h"
@@ -286,6 +287,28 @@ void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx)
 	mfc_debug_leave();
 }
 
+int mfc_core_cmd_enc_seq_header(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret;
+
+	mfc_debug_enter();
+
+	ret = mfc_core_set_enc_params(core, ctx);
+	if (ret) {
+		mfc_debug(2, "fail to set enc params\n");
+		return ret;
+	}
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_SEQ_HEADER);
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
 int mfc_core_cmd_dec_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx)
 {
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
@@ -326,6 +349,58 @@ int mfc_core_cmd_dec_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx)
 	return ret;
 }
 
+int mfc_core_cmd_enc_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	unsigned int reg = 0;
+	int ret;
+
+	/*
+	 * Header was generated now starting processing
+	 * First set the reference frame buffers
+	 */
+	if (!core_ctx->codec_buffer_allocated) {
+		mfc_info("there isn't codec buffer, re-alloc!\n");
+		ret = mfc_alloc_codec_buffers(core_ctx);
+		if (ret) {
+			mfc_err("Failed to allocate encoding buffers\n");
+			mfc_change_state(core_ctx, MFCINST_ERROR);
+			return ret;
+		}
+	}
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	ret = mfc_core_set_enc_codec_buffers(core_ctx);
+	if (ret) {
+		mfc_info("isn't enough codec buffer size, re-alloc!\n");
+
+		mfc_release_codec_buffers(core_ctx);
+		ret = mfc_alloc_codec_buffers(core_ctx);
+		if (ret) {
+			mfc_err("Failed to allocate encoding buffers\n");
+			return ret;
+		}
+		ret = mfc_core_set_enc_codec_buffers(core_ctx);
+		if (ret) {
+			mfc_err("Failed to set enc codec buffers\n");
+			return ret;
+		}
+	}
+
+	if (IS_MULTI_MODE(ctx)) {
+		reg |= ((ctx->subcore_inst_no & MFC_REG_RET_INSTANCE_ID_OF_MFC1_MASK)
+			<< MFC_REG_RET_INSTANCE_ID_OF_MFC1_SHIFT);
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
 static int __mfc_set_scratch_dpb_buffer(struct mfc_core *core, struct mfc_ctx *ctx)
 {
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
@@ -455,3 +530,47 @@ int mfc_core_cmd_dec_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
 	mfc_debug(2, "Decoding a usual frame\n");
 	return 0;
 }
+
+/* Encode a single frame */
+void mfc_core_cmd_enc_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
+				int last_frame)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	u32 timeout_value = MFC_TIMEOUT_VALUE;
+	unsigned int reg = 0;
+
+	mfc_debug_enter();
+
+	if (core->dev->pdata->support_enc_mode1) {
+		reg = MFC_CORE_READL(MFC_REG_E_HEVC_NAL_CONTROL);
+		mfc_clear_set_bits(reg, 0x1, 11, IS_MULTI_MODE(ctx));
+		MFC_CORE_WRITEL(reg, MFC_REG_E_HEVC_NAL_CONTROL);
+	}
+
+	reg = MFC_CORE_READL(MFC_REG_E_HEVC_NAL_CONTROL);
+	mfc_clear_set_bits(reg, 0x3, 12, ctx->select_view ? 0x3 : 0x0);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_HEVC_NAL_CONTROL);
+
+	if (core->last_mfc_freq)
+		timeout_value = (core->last_mfc_freq * MFC_TIMEOUT_VALUE_IN_MSEC);
+	mfc_debug(2, "Last MFC Freq: %d, Timeout Value: %d\n",
+		  core->last_mfc_freq, timeout_value);
+
+	MFC_CORE_WRITEL(timeout_value, MFC_REG_TIMEOUT_VALUE);
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
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
+	mfc_debug_leave();
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
index 216d07c564ae..91da9eeff904 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
@@ -28,8 +28,14 @@ void mfc_core_cmd_dpb_flush(struct mfc_core *core, struct mfc_ctx *ctx);
 void mfc_core_cmd_cache_flush(struct mfc_core *core);
 
 void mfc_core_cmd_dec_seq_header(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_cmd_enc_seq_header(struct mfc_core *core, struct mfc_ctx *ctx);
 
 int mfc_core_cmd_dec_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_cmd_enc_init_buffers(struct mfc_core *core, struct mfc_ctx *ctx);
+
 int mfc_core_cmd_dec_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
 			       int last_frame, int src_index);
+void mfc_core_cmd_enc_one_frame(struct mfc_core *core, struct mfc_ctx *ctx,
+				int last_frame);
+
 #endif /* __MFC_CORE_CMD_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
index 0b594429fd59..5456368f5410 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
@@ -508,6 +508,65 @@ static int __mfc_just_run_dec(struct mfc_core *core, struct mfc_ctx *ctx)
 	return ret;
 }
 
+static int __mfc_just_run_enc(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_core *subcore;
+	struct mfc_core_ctx *subcore_ctx;
+	int ret = 0;
+
+	switch (core_ctx->state) {
+	case MFCINST_FINISHING:
+		ret = mfc_core_run_enc_last_frames(core, ctx);
+		break;
+	case MFCINST_RUNNING:
+		ret = mfc_core_run_enc_frame(core, ctx);
+		break;
+	case MFCINST_INIT:
+		mfc_core_cmd_open_inst(core, ctx);
+		break;
+	case MFCINST_RETURN_INST:
+		ret = mfc_core_cmd_close_inst(core, ctx);
+		break;
+	case MFCINST_GOT_INST:
+		ret = mfc_core_run_enc_init(core, ctx);
+		break;
+	case MFCINST_HEAD_PARSED:
+		if (ctx->stream_op_mode == MFC_OP_TWO_MODE1) {
+			if (core->id == MFC_CORE_SUB) {
+				mfc_ctx_err("init buffer should be called to main core, so try again\n");
+				return -EAGAIN;
+			}
+
+			subcore = mfc_get_sub_core(ctx->dev, ctx);
+			if (!subcore) {
+				mfc_ctx_err("Failed to get subcore before calling INIT_BUF\n");
+				return -EAGAIN;
+			}
+			subcore_ctx = subcore->core_ctx[ctx->num];
+			if (mfc_wait_for_done_core_ctx(subcore_ctx,
+						       MFC_REG_R2H_CMD_SEQ_DONE_RET)) {
+				mfc_ctx_err("sub core header parsing should be done before init buffer\n");
+				return -EAGAIN;
+			}
+		}
+		ret = mfc_core_cmd_enc_init_buffers(core, ctx);
+		break;
+	case MFCINST_ABORT_INST:
+		mfc_core_cmd_abort_inst(core, ctx);
+		break;
+	case MFCINST_MOVE_INST:
+		mfc_core_cmd_move_inst(core, ctx);
+		break;
+	default:
+		mfc_info("can't try command(encoder just_run), state : %d\n",
+			 core_ctx->state);
+		ret = -EAGAIN;
+	}
+
+	return ret;
+}
+
 /* Run an operation on hardware */
 int mfc_core_just_run(struct mfc_core *core, int new_ctx_index)
 {
@@ -557,6 +616,8 @@ int mfc_core_just_run(struct mfc_core *core, int new_ctx_index)
 
 	if (ctx->type == MFCINST_DECODER) {
 		ret = __mfc_just_run_dec(core, ctx);
+	} else if (ctx->type == MFCINST_ENCODER) {
+		ret = __mfc_just_run_enc(core, ctx);
 	} else {
 		mfc_err("invalid context type: %d\n", ctx->type);
 		ret = -EAGAIN;
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
index f8a27548b218..fc90650c228c 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
@@ -322,6 +322,9 @@ static int mfc_core_instance_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 	mfc_core_release_hwlock_ctx(core_ctx);
 	mfc_core_destroy_listable_wq_ctx(core_ctx);
 
+	if (ctx->type == MFCINST_ENCODER)
+		mfc_release_enc_roi_buffer(core_ctx);
+
 	mfc_delete_queue(&core_ctx->src_buf_queue);
 
 	core->core_ctx[core_ctx->num] = 0;
@@ -361,6 +364,32 @@ static int __mfc_core_instance_open_dec(struct mfc_ctx *ctx,
 	return 0;
 }
 
+static int __mfc_core_instance_open_enc(struct mfc_ctx *ctx,
+					struct mfc_core_ctx *core_ctx)
+{
+	int ret = 0;
+
+	ret = mfc_alloc_instance_context(core_ctx);
+	if (ret) {
+		mfc_err("Failed to allocate enc instance[%d] buffers\n",
+			core_ctx->num);
+		mfc_core_release_hwlock_ctx(core_ctx);
+		return -ENOMEM;
+	}
+
+	ctx->capture_state = QUEUE_FREE;
+
+	ret = mfc_alloc_enc_roi_buffer(core_ctx);
+	if (ret) {
+		mfc_err("[ROI] Failed to allocate ROI buffers\n");
+		mfc_release_instance_context(core_ctx);
+		mfc_core_release_hwlock_ctx(core_ctx);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int mfc_core_instance_open(struct mfc_core *core, struct mfc_ctx *ctx)
 {
 	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
@@ -380,6 +409,9 @@ static int mfc_core_instance_open(struct mfc_core *core, struct mfc_ctx *ctx)
 	if (ctx->type == MFCINST_DECODER) {
 		if (__mfc_core_instance_open_dec(ctx, core_ctx))
 			return -EAGAIN;
+	} else if (ctx->type == MFCINST_ENCODER) {
+		if (__mfc_core_instance_open_enc(ctx, core_ctx))
+			return -EAGAIN;
 	} else {
 		mfc_err("invalid codec type: %d\n", ctx->type);
 		return -EINVAL;
@@ -414,6 +446,8 @@ static int mfc_core_instance_open(struct mfc_core *core, struct mfc_ctx *ctx)
 	mfc_core_release_hwlock_ctx(core_ctx);
 	core->sched->yield_work(core, core_ctx);
 	mfc_release_instance_context(core_ctx);
+	if (ctx->type == MFCINST_ENCODER)
+		mfc_release_enc_roi_buffer(core_ctx);
 
 	return ret;
 }
@@ -619,6 +653,124 @@ static int mfc_core_instance_init_buf(struct mfc_core *core, struct mfc_ctx *ctx
 	return 0;
 }
 
+static void mfc_core_instance_q_flush(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int index = 0;
+	int ret = 0;
+
+	/* If a H/W operation is in progress, wait for it complete */
+	if (NEED_TO_WAIT_NAL_ABORT(core_ctx)) {
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_NAL_ABORT_RET)) {
+			mfc_err("time out during nal abort\n");
+			core->sched->yield_work(core, core_ctx);
+		}
+	}
+
+	ret = mfc_core_get_hwlock_ctx(core_ctx);
+	if (ret < 0) {
+		mfc_err("Failed to get hwlock\n");
+		MFC_TRACE_CTX_LT("[ERR][Release] failed to get hwlock (shutdown: %d)\n",
+				 core->shutdown);
+		return;
+	}
+
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->dst_buf_queue);
+
+	while (index < MFC_MAX_BUFFERS) {
+		index = find_next_bit(ctx->dst_ctrls_avail, MFC_MAX_BUFFERS, index);
+		if (index < MFC_MAX_BUFFERS)
+			call_cop(ctx, reset_buf_ctrls, &ctx->dst_ctrls[index]);
+		index++;
+	}
+
+	if (core_ctx->state == MFCINST_FINISHING)
+		mfc_change_state(core_ctx, MFCINST_FINISHED);
+
+	mfc_debug(2, "encoder destination stop sequence done\n");
+
+	core->sched->clear_work(core, core_ctx);
+	mfc_core_release_hwlock_ctx(core_ctx);
+
+	core->sched->enqueue_work(core, core_ctx);
+	if (core->sched->is_work(core))
+		core->sched->queue_work(core);
+}
+
+static void mfc_core_instance_finishing(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int index = 0;
+	int ret = 0;
+
+	/* If a H/W operation is in progress, wait for it complete */
+	if (NEED_TO_WAIT_NAL_ABORT(core_ctx)) {
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_NAL_ABORT_RET)) {
+			mfc_err("time out during nal abort\n");
+			core->sched->yield_work(core, core_ctx);
+		}
+	}
+
+	ret = mfc_core_get_hwlock_ctx(core_ctx);
+	if (ret < 0) {
+		mfc_err("Failed to get hwlock\n");
+		MFC_TRACE_CTX_LT("[ERR][Release] failed to get hwlock (shutdown: %d)\n",
+				 core->shutdown);
+		return;
+	}
+
+	if (core_ctx->state == MFCINST_RUNNING || core_ctx->state == MFCINST_FINISHING ||
+	    (IS_SWITCH_SINGLE_MODE(ctx) && core->id == ctx->op_core_num[MFC_CORE_SUB])) {
+		mfc_change_state(core_ctx, MFCINST_FINISHING);
+		core->sched->set_work(core, core_ctx);
+
+		while (core_ctx->state != MFCINST_FINISHED) {
+			ret = mfc_core_just_run(core, ctx->num);
+			if (ret) {
+				mfc_err("Failed to run MFC\n");
+				break;
+			}
+			if (mfc_wait_for_done_core_ctx(core_ctx,
+						       MFC_REG_R2H_CMD_FRAME_DONE_RET)) {
+				mfc_err("Waiting for LAST_SEQ timed out\n");
+				break;
+			}
+		}
+	}
+
+	ctx->serial_src_index = 0;
+	mfc_move_buf_all(ctx, &core_ctx->src_buf_queue,
+			 &ctx->ref_buf_queue, MFC_QUEUE_ADD_BOTTOM);
+	mfc_move_buf_all(ctx, &core_ctx->src_buf_queue,
+			 &ctx->src_buf_ready_queue, MFC_QUEUE_ADD_BOTTOM);
+	mfc_cleanup_enc_src_queue(core_ctx);
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->err_buf_queue);
+
+	while (index < MFC_MAX_BUFFERS) {
+		index = find_next_bit(ctx->src_ctrls_avail, MFC_MAX_BUFFERS, index);
+		if (index < MFC_MAX_BUFFERS)
+			call_cop(ctx, reset_buf_ctrls, &ctx->src_ctrls[index]);
+		index++;
+	}
+
+	if (core_ctx->state == MFCINST_FINISHING ||
+	    core_ctx->state == MFCINST_GOT_INST ||
+	    core_ctx->state == MFCINST_HEAD_PARSED) {
+		mfc_debug(2, "%d status can continue encoding without CLOSE_INSTANCE\n",
+			  core_ctx->state);
+		mfc_change_state(core_ctx, MFCINST_FINISHED);
+	}
+
+	mfc_debug(2, "encoder source stop sequence done\n");
+
+	core->sched->clear_work(core, core_ctx);
+	mfc_core_release_hwlock_ctx(core_ctx);
+
+	core->sched->enqueue_work(core, core_ctx);
+	if (core->sched->is_work(core))
+		core->sched->queue_work(core);
+}
+
 static int mfc_core_request_work(struct mfc_core *core,
 				 enum mfc_request_work work,
 				 struct mfc_ctx *ctx)
@@ -650,6 +802,8 @@ static const struct mfc_core_ops mfc_core_ops = {
 	.instance_move_from = mfc_core_instance_move_from,
 	.instance_dpb_flush = mfc_core_instance_dpb_flush,
 	.instance_init_buf = mfc_core_instance_init_buf,
+	.instance_q_flush = mfc_core_instance_q_flush,
+	.instance_finishing = mfc_core_instance_finishing,
 	.request_work = mfc_core_request_work,
 };
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
index 0cc5d1d9433e..d4e9cb4e4e79 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
@@ -225,6 +225,63 @@ int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx)
 	return 0;
 }
 
+/* Set encoding ref & codec buffer */
+int mfc_core_set_enc_codec_buffers(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_enc *enc = ctx->enc_priv;
+	dma_addr_t buf_addr;
+	int buf_size;
+	int i;
+
+	mfc_debug_enter();
+
+	buf_addr = core_ctx->codec_buf.daddr;
+	buf_size = core_ctx->codec_buf.size;
+
+	mfc_debug(2, "[MEMINFO] codec buf 0x%llx, size: %d\n", buf_addr, buf_size);
+	mfc_debug(2, "DPB COUNT: %d\n", ctx->dpb_count);
+
+	MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_SCRATCH_BUFFER_ADDR);
+	MFC_CORE_WRITEL(ctx->scratch_buf_size, MFC_REG_E_SCRATCH_BUFFER_SIZE);
+	buf_addr += ctx->scratch_buf_size;
+	buf_size -= ctx->scratch_buf_size;
+
+	/* start address of per buffer is aligned */
+	for (i = 0; i < ctx->dpb_count; i++) {
+		MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_LUMA_DPB + (4 * i));
+		buf_addr += enc->luma_dpb_size;
+		buf_size -= enc->luma_dpb_size;
+	}
+	for (i = 0; i < ctx->dpb_count; i++) {
+		MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_CHROMA_DPB + (4 * i));
+		buf_addr += enc->chroma_dpb_size;
+		buf_size -= enc->chroma_dpb_size;
+	}
+	for (i = 0; i < ctx->dpb_count; i++) {
+		MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_ME_BUFFER + (4 * i));
+		buf_addr += enc->me_buffer_size;
+		buf_size -= enc->me_buffer_size;
+	}
+
+	MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_TMV_BUFFER0);
+	buf_addr += enc->tmv_buffer_size >> 1;
+	MFC_CORE_DMA_WRITEL(buf_addr, MFC_REG_E_TMV_BUFFER1);
+	buf_addr += enc->tmv_buffer_size >> 1;
+	buf_size -= enc->tmv_buffer_size;
+
+	mfc_debug(2, "[MEMINFO] codec buf 0x%llx, remained size: %d\n", buf_addr, buf_size);
+	if (buf_size < 0) {
+		mfc_debug(2, "[MEMINFO] Not enough memory has been allocated\n");
+		return -ENOMEM;
+	}
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
 /* Set registers for decoding stream buffer */
 int mfc_core_set_dec_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
 				   struct mfc_buf *mfc_buf, unsigned int start_num_byte,
@@ -273,6 +330,118 @@ int mfc_core_set_dec_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
 	return 0;
 }
 
+void mfc_core_set_enc_frame_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf, int num_planes)
+{
+	dma_addr_t addr[3] = { 0, 0, 0 };
+	int index, i;
+	int index_view;
+
+	if (!mfc_buf) {
+		mfc_ctx_debug(3, "enc zero buffer set\n");
+		goto buffer_set;
+	}
+
+	index = mfc_buf->vb.vb2_buf.index;
+	if (mfc_buf->num_valid_bufs > 0) {
+		for (i = 0; i < num_planes; i++) {
+			addr[i] = mfc_buf->addr[mfc_buf->next_index][i];
+			mfc_ctx_debug(2, "[BUFCON][BUFINFO] set src index: %d, batch[%d], addr[%d]: 0x%08llx\n",
+				      index, mfc_buf->next_index, i, addr[i]);
+		}
+		mfc_buf->next_index++;
+	} else {
+		index_view = ctx->select_view == MFC_VIEW_ID_MAIN ? MFC_MV_BUF_IDX_VIEW0
+								  : MFC_MV_BUF_IDX_VIEW1;
+		for (i = 0; i < num_planes; i++) {
+			addr[i] = mfc_buf->addr[index_view][i];
+			mfc_ctx_debug(2, "[BUFINFO] set src index: %d(%d), addr[%d]: 0x%08llx\n",
+				      index, mfc_buf->src_index, i, addr[i]);
+		}
+	}
+
+buffer_set:
+	for (i = 0; i < num_planes; i++)
+		MFC_CORE_DMA_WRITEL(addr[i], MFC_REG_E_SOURCE_FIRST_ADDR + (i * 4));
+}
+
+/* Set registers for encoding stream buffer */
+int mfc_core_set_enc_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf)
+{
+	dma_addr_t addr = 0;
+	unsigned int size = 0, offset = 0, index = -1;
+
+	if (mfc_buf) {
+		index = mfc_buf->vb.vb2_buf.index;
+		addr = mfc_buf->addr[0][0];
+		offset = mfc_buf->vb.vb2_buf.planes[0].data_offset;
+		size = (unsigned int)vb2_plane_size(&mfc_buf->vb.vb2_buf, 0);
+		size = ALIGN(size, STREAM_BUF_ALIGN);
+	} else {
+		/*
+		 * When LAST_SEQ of B frame encoding
+		 * if there is no output buffer, set addr and size with 0xffffffff
+		 * and then FW returns COMPLETE_SEQ.
+		 */
+		addr = 0xffffffff;
+		size = 0xffffffff;
+	}
+
+	MFC_CORE_DMA_WRITEL(addr, MFC_REG_E_STREAM_BUFFER_ADDR); /* 16B align */
+	MFC_CORE_WRITEL(size, MFC_REG_E_STREAM_BUFFER_SIZE);
+	MFC_CORE_WRITEL(offset, MFC_REG_E_STREAM_BUFFER_OFFSET);
+
+	if (IS_MULTI_MODE(ctx) &&
+	    !(ctx->dev->debugfs.feature_option & MFC_OPTION_STREAM_COPY_DISABLE)) {
+		dma_addr_t tile1_addr = 0;
+		unsigned int tile0_size = 0;
+		unsigned int tile1_size = 0;
+
+		tile0_size = ALIGN(size / 2, 16);
+		tile1_addr = addr + tile0_size;
+		tile1_size = (size > tile0_size) ? size - tile0_size : 0;
+
+		MFC_CORE_DMA_WRITEL(tile1_addr, MFC_REG_E_TILE1_STREAM_BUFFER_ADDR); /* 16B align */
+		MFC_CORE_WRITEL(tile1_size, MFC_REG_E_TILE1_STREAM_BUFFER_SIZE);
+	}
+
+	mfc_ctx_debug(2, "[BUFINFO] set dst index: %d, addr: 0x%08llx\n", index, addr);
+	mfc_ctx_debug(2, "[STREAM] buf_size: %u, offset: %d\n", size, offset);
+
+	return 0;
+}
+
+void mfc_core_get_enc_frame_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   dma_addr_t addr[], int num_planes)
+{
+	dma_addr_t enc_recon_y_addr, enc_recon_c_addr;
+	int i, addr_offset;
+
+	addr_offset = MFC_REG_E_ENCODED_SOURCE_FIRST_ADDR;
+
+	for (i = 0; i < num_planes; i++)
+		addr[i] = MFC_CORE_DMA_READL(addr_offset + (i * 4));
+
+	enc_recon_y_addr = MFC_CORE_DMA_READL(MFC_REG_E_RECON_LUMA_DPB_ADDR);
+	enc_recon_c_addr = MFC_CORE_DMA_READL(MFC_REG_E_RECON_CHROMA_DPB_ADDR);
+
+	mfc_ctx_debug(2, "[MEMINFO] recon y: %#llx c: %#llx\n",
+		      enc_recon_y_addr, enc_recon_c_addr);
+}
+
+void mfc_core_set_enc_stride(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->raw_buf.num_planes; i++) {
+		MFC_CORE_WRITEL(ctx->raw_buf.stride[i],
+				MFC_REG_E_SOURCE_FIRST_STRIDE + (i * 4));
+		mfc_ctx_debug(2, "[FRAME] enc src plane[%d] stride: %d\n",
+			      i, ctx->raw_buf.stride[i]);
+	}
+}
+
 void mfc_core_set_dynamic_dpb(struct mfc_core *core, struct mfc_ctx *ctx,
 			      struct mfc_buf *dst_mb)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
index 08f74bd56f3f..6042f3a8a6ba 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
@@ -116,6 +116,14 @@
 	MFC_CORE_READL(MFC_REG_D_FIRST_PLANE_2BIT_DPB_STRIDE_SIZE + ((x) * 4))
 #define mfc_core_get_mv_count()			MFC_CORE_READL(MFC_REG_D_MIN_NUM_MV)
 #define mfc_core_get_inst_no()			MFC_CORE_READL(MFC_REG_RET_INSTANCE_ID)
+#define mfc_core_get_enc_dpb_count()		MFC_CORE_READL(MFC_REG_E_NUM_DPB)
+#define mfc_core_get_enc_scratch_size()		MFC_CORE_READL(MFC_REG_E_MIN_SCRATCH_BUFFER_SIZE)
+#define mfc_core_get_enc_luma_size()		MFC_CORE_READL(MFC_REG_E_MIN_LUMA_DPB_SIZE)
+#define mfc_core_get_enc_chroma_size()		MFC_CORE_READL(MFC_REG_E_MIN_CHROMA_DPB_SIZE)
+#define mfc_core_get_enc_strm_size()		MFC_CORE_READL(MFC_REG_E_STREAM_SIZE)
+#define mfc_core_get_enc_slice_type()		(MFC_CORE_READL(MFC_REG_E_SLICE_TYPE)		\
+						& MFC_REG_E_SLICE_TYPE_MASK)
+#define mfc_core_get_enc_pic_count()		MFC_CORE_READL(MFC_REG_E_PICTURE_COUNT)
 #define mfc_core_get_sei_avail()		MFC_CORE_READL(MFC_REG_D_SEI_AVAIL)
 #define mfc_core_get_sei_content_light()	\
 	MFC_CORE_READL(MFC_REG_D_CONTENT_LIGHT_LEVEL_INFO_SEI)
@@ -209,6 +217,14 @@
 #define mfc_core_get_dec_used_flag()		(((unsigned long)(MFC_CORE_READL		\
 						(MFC_REG_D_USED_DPB_FLAG_UPPER)) << 32) |	\
 						MFC_CORE_READL(MFC_REG_D_USED_DPB_FLAG_LOWER))
+#define mfc_core_get_enc_idr_flag()				\
+	((MFC_CORE_READL(MFC_REG_E_NAL_DONE_INFO)		\
+	>> MFC_REG_E_NAL_DONE_INFO_IDR_SHIFT)			\
+	& MFC_REG_E_NAL_DONE_INFO_IDR_MASK)
+#define mfc_core_get_enc_comp_err()					\
+	((MFC_CORE_READL(MFC_REG_E_NAL_DONE_INFO)		\
+	>> MFC_REG_E_NAL_DONE_INFO_COMP_ERR_SHIFT)			\
+	& MFC_REG_E_NAL_DONE_INFO_COMP_ERR_MASK)
 #define mfc_core_get_chroma_format()		(MFC_CORE_READL(MFC_REG_D_CHROMA_FORMAT)	\
 						& MFC_REG_D_CHROMA_FORMAT_MASK)
 #define mfc_core_get_color_range()		((MFC_CORE_READL(MFC_REG_D_CHROMA_FORMAT)	\
@@ -257,6 +273,15 @@ static inline void mfc_core_dec_get_crop_info(struct mfc_core *core,
 	dec->cr_bot = bottom;
 }
 
+static inline void mfc_core_clear_enc_res_change(struct mfc_core *core)
+{
+	unsigned int reg = 0;
+
+	reg = MFC_CORE_READL(MFC_REG_E_PARAM_CHANGE);
+	reg &= ~(0x7 << 6);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_PARAM_CHANGE);
+}
+
 static inline void mfc_core_clear_roi_enable(struct mfc_core *core)
 {
 	unsigned int reg = 0;
@@ -276,6 +301,25 @@ static inline void mfc_core_update_tag(struct mfc_core *core, struct mfc_ctx *ct
 	}
 }
 
+static inline void mfc_core_set_enc_src_votf(struct mfc_core *core, int onoff)
+{
+	unsigned int reg = 0;
+
+	reg = MFC_CORE_READL(MFC_REG_E_PARAM_CHANGE);
+	reg &= ~(0x3 << 18);
+	reg |= (onoff << 18);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_PARAM_CHANGE);
+}
+
+static inline void mfc_core_clear_enc_src_votf(struct mfc_core *core)
+{
+	unsigned int reg = 0;
+
+	reg = MFC_CORE_READL(MFC_REG_E_PARAM_CHANGE);
+	reg &= ~(0x3 << 18);
+	MFC_CORE_WRITEL(reg, MFC_REG_E_PARAM_CHANGE);
+}
+
 static inline void mfc_core_set_migration_addr(struct mfc_core *core, struct mfc_ctx *ctx,
 					       dma_addr_t fw_addr, dma_addr_t common_ctx_addr)
 {
@@ -311,10 +355,21 @@ unsigned int mfc_get_frame_error_type(struct mfc_ctx *ctx, unsigned int err);
 
 void mfc_core_set_dec_dpb_and_scratch(struct mfc_core_ctx *core_ctx, dma_addr_t scratch_addr);
 int mfc_core_set_dec_codec_buffers(struct mfc_core_ctx *core_ctx);
+int mfc_core_set_enc_codec_buffers(struct mfc_core_ctx *core_ctx);
+
 int mfc_core_set_dec_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
 				   struct mfc_buf *mfc_buf, unsigned int start_num_byte,
 				   unsigned int buf_size);
 
+void mfc_core_set_enc_frame_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf, int num_planes);
+int mfc_core_set_enc_stream_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   struct mfc_buf *mfc_buf);
+
+void mfc_core_get_enc_frame_buffer(struct mfc_core *core, struct mfc_ctx *ctx,
+				   dma_addr_t addr[], int num_planes);
+void mfc_core_set_enc_stride(struct mfc_core *core, struct mfc_ctx *ctx);
+
 void mfc_core_set_dynamic_dpb(struct mfc_core *core, struct mfc_ctx *ctx,
 			      struct mfc_buf *dst_vb);
 
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
index 127d19c4d1cb..6270d22d3806 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
@@ -16,6 +16,7 @@
 
 #include "mfc_core_cmd.h"
 #include "mfc_core_hw_reg_api.h"
+#include "mfc_core_enc_param.h"
 
 #include "base/mfc_queue.h"
 #include "base/mfc_utils.h"
@@ -412,3 +413,129 @@ int mfc_core_run_dec_last_frames(struct mfc_core *core, struct mfc_ctx *ctx)
 
 	return 0;
 }
+
+int mfc_core_run_enc_init(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_buf *dst_mb;
+	int ret;
+
+	if (!(ctx->stream_op_mode == MFC_OP_TWO_MODE1 && core->id == MFC_CORE_SUB)) {
+		dst_mb = mfc_get_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_SET_USED);
+		if (!dst_mb) {
+			mfc_ctx_debug(2, "no dst buffers\n");
+			return -EAGAIN;
+		}
+
+		mfc_core_set_enc_stream_buffer(core, ctx, dst_mb);
+		mfc_ctx_debug(2, "[BUFINFO] Header addr: 0x%08llx\n", dst_mb->addr[0][0]);
+	}
+
+	mfc_core_set_enc_stride(core, ctx);
+
+	mfc_clean_core_ctx_int_flags(core->core_ctx[ctx->num]);
+
+	ret = mfc_core_cmd_enc_seq_header(core, ctx);
+	return ret;
+}
+
+int mfc_core_run_enc_frame(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_buf *dst_mb;
+	struct mfc_buf *src_mb;
+	struct mfc_raw_info *raw;
+	unsigned int index;
+	int last_frame = 0;
+
+	raw = &ctx->raw_buf;
+
+	/* Get the next source buffer */
+	src_mb = mfc_get_buf(ctx, &core_ctx->src_buf_queue, MFC_BUF_SET_USED);
+	if (!src_mb) {
+		mfc_debug(2, "no src buffers\n");
+		return -EAGAIN;
+	}
+
+	if (src_mb->num_valid_bufs > 0) {
+		/* last image in a buffer container */
+		if (src_mb->next_index == (src_mb->num_valid_bufs - 1)) {
+			mfc_debug(4, "[BUFCON] last image in a container\n");
+			last_frame = __mfc_check_last_frame(core_ctx, src_mb);
+		}
+	} else {
+		last_frame = __mfc_check_last_frame(core_ctx, src_mb);
+	}
+
+	if (mfc_check_mb_flag(src_mb, MFC_FLAG_ENC_SRC_FAKE)) {
+		enc->fake_src = 1;
+		mfc_debug(2, "src is fake\n");
+	}
+
+	index = src_mb->vb.vb2_buf.index;
+	if (mfc_check_mb_flag(src_mb, MFC_FLAG_EMPTY_DATA)) {
+		enc->empty_data = 1;
+		mfc_debug(2, "[FRAME] src is empty data\n");
+		mfc_core_set_enc_frame_buffer(core, ctx, 0, raw->num_planes);
+	} else {
+		mfc_core_set_enc_frame_buffer(core, ctx, src_mb, raw->num_planes);
+	}
+
+	dst_mb = mfc_get_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_SET_USED);
+	if (!dst_mb) {
+		mfc_debug(2, "no dst buffers\n");
+		return -EAGAIN;
+	}
+
+	mfc_debug(2, "nal start : src index from src_buf_queue:%d\n",
+		  src_mb->vb.vb2_buf.index);
+	mfc_debug(2, "nal start : dst index from dst_buf_queue:%d\n",
+		  dst_mb->vb.vb2_buf.index);
+
+	mfc_core_set_enc_stream_buffer(core, ctx, dst_mb);
+
+	if (call_bop(ctx, core_set_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+		mfc_err("failed in core_set_buf_ctrls\n");
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+
+	if (IS_H264_ENC(ctx))
+		mfc_core_set_aso_slice_order_h264(core, ctx);
+
+	mfc_core_set_slice_mode(core, ctx);
+	mfc_core_set_enc_config_qp(core, ctx);
+	mfc_core_set_enc_ts_delta(core, ctx);
+
+	mfc_core_cmd_enc_one_frame(core, ctx, last_frame);
+
+	return 0;
+}
+
+int mfc_core_run_enc_last_frames(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_buf *dst_mb = NULL;
+	struct mfc_raw_info *raw;
+
+	raw = &ctx->raw_buf;
+
+	if (IS_SWITCH_SINGLE_MODE(ctx) && core->id == ctx->op_core_num[MFC_CORE_SUB]) {
+		mfc_ctx_info("last-frame of subcore doesn't have dst buffer\n");
+	} else {
+		dst_mb = mfc_get_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_SET_USED);
+		if (!dst_mb) {
+			mfc_ctx_debug(2, "no dst buffers set to zero\n");
+
+			if (mfc_is_enc_bframe(ctx))
+				mfc_ctx_info("B frame encoding doesn't have dst buffer\n");
+		}
+	}
+
+	mfc_ctx_debug(2, "Set address zero for all planes\n");
+	mfc_core_set_enc_frame_buffer(core, ctx, 0, raw->num_planes);
+	mfc_core_set_enc_stream_buffer(core, ctx, dst_mb);
+
+	mfc_clean_core_ctx_int_flags(core->core_ctx[ctx->num]);
+	mfc_core_cmd_enc_one_frame(core, ctx, 1);
+
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
index 6b9c9ef91e47..410c2aadcf5d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
@@ -27,4 +27,9 @@ int mfc_core_run_wakeup(struct mfc_core *core);
 int mfc_core_run_dec_init(struct mfc_core *core, struct mfc_ctx *ctx);
 int mfc_core_run_dec_frame(struct mfc_core *core, struct mfc_ctx *ctx);
 int mfc_core_run_dec_last_frames(struct mfc_core *core, struct mfc_ctx *ctx);
+
+int mfc_core_run_enc_init(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_run_enc_frame(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_run_enc_last_frames(struct mfc_core *core, struct mfc_ctx *ctx);
+
 #endif /* __MFC_CORE_RUN_H */
-- 
2.34.1

