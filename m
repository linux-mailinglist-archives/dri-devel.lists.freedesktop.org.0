Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1BBAB7C2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8910E4DE;
	Tue, 30 Sep 2025 05:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="uIhd4Y1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086B710E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:11 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035631epoutp03920d16cdc5af1ed15bfd073c5ca9d183~p80FkB-l93111931119epoutp03v
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035631epoutp03920d16cdc5af1ed15bfd073c5ca9d183~p80FkB-l93111931119epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204591;
 bh=dzCqB0n5Pyt67l3/FHPMhMXuVfK/h58LiWvHMQHMPxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uIhd4Y1ouatmJdv9z/5Wq2DJcx391Ndsi8pkEkKLjZrfezwTcsQaQgzjsIpDL4WOr
 4Lt3yvb7ZiD7fT1QWXd97eP386j7IZUHpws2kVt6aJC/FEYUCWrIERPF3PebtbEl3X
 0kRdtGCuV2iC1upbyqW8SKqqNfiXbYdk47rSE6jg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035630epcas5p333bf64141bc0c1cdd792ede3949e1f24~p80EUp_UW1975619756epcas5p3H;
 Tue, 30 Sep 2025 03:56:30 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPPT1x3Dz6B9m5; Tue, 30 Sep
 2025 03:56:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035628epcas5p1c0ebecf84b6b9c17aa291b097e411df0~p80C30F7r1549615496epcas5p19;
 Tue, 30 Sep 2025 03:56:28 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035624epsmtip123f0067485e425f10327d74fd0fafa55~p8z_wGbqR2885328853epsmtip1a;
 Tue, 30 Sep 2025 03:56:24 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 16/29] =?UTF-8?q?media:=20mfc:=20Enhance=20HW=E2=80=91lock?=
 =?UTF-8?q?=20handling,=20scheduling=20and=20error=20recovery?=
Date: Tue, 30 Sep 2025 09:33:35 +0530
Message-Id: <20250930040348.3702923-17-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035628epcas5p1c0ebecf84b6b9c17aa291b097e411df0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035628epcas5p1c0ebecf84b6b9c17aa291b097e411df0
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035628epcas5p1c0ebecf84b6b9c17aa291b097e411df0@epcas5p1.samsung.com>
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

- Enable HW‑lock migration across cores and centralize lock
  acquisition for better load‑balancing and dynamic resolution.
- Refactor decoder run‑path helpers to streamline init,
  per‑frame, and final‑frame processing with dynamic DPB management.
- Add IRQ‑level lock handler that deals with pre‑empted contexts,
  waiting queues, QoS updates and work scheduling,
  reducing race conditions.
- Expand QoS tracking and black‑bar detection with detailed debug output.
- Consolidate error handling into a dedicated ISR‑invoked path,
  improving recovery reliability and logging.
- Update headers/comments and add missing declarations for new helpers.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/mfc_core_hwlock.c      |  364 +++++
 .../samsung/exynos-mfc/mfc_core_hwlock.h      |    8 +
 .../samsung/exynos-mfc/mfc_core_isr.c         | 1353 ++++++++++++++++-
 .../samsung/exynos-mfc/mfc_core_isr.h         |    3 +
 .../samsung/exynos-mfc/mfc_core_run.c         |  145 ++
 .../samsung/exynos-mfc/mfc_core_run.h         |    4 +
 .../platform/samsung/exynos-mfc/mfc_rm.c      |    1 +
 7 files changed, 1877 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
index 4de836543e82..0b594429fd59 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
@@ -19,8 +19,10 @@
 #include "mfc_core_cmd.h"
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_queue.h"
 #include "base/mfc_utils.h"
 #include "base/mfc_sched.h"
+#include "base/mfc_qos.h"
 
 static inline void __mfc_print_hwlock(struct mfc_core *core)
 {
@@ -291,6 +293,221 @@ void mfc_core_release_hwlock_ctx(struct mfc_core_ctx *core_ctx)
 	spin_unlock_irqrestore(&core->hwlock.lock, flags);
 }
 
+void mfc_core_move_hwlock_ctx(struct mfc_core *to_core, struct mfc_core *from_core,
+			      struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_listable_wq *listable_wq;
+	bool is_move = false;
+
+	if (from_core->hwlock.bits & (1UL << core_ctx->num))
+		is_move = true;
+
+	list_for_each_entry(listable_wq, &from_core->hwlock.waiting_list, list) {
+		if (!listable_wq->core_ctx)
+			continue;
+
+		if (listable_wq->core_ctx->num == core_ctx->num)
+			is_move = true;
+	}
+
+	if (is_move) {
+		mfc_debug(2, "There is a waiting module to moving core%d\n",
+			  from_core->id);
+		MFC_TRACE_RM("[c:%d] hwlock wait in moving core%d\n",
+			     ctx->num, from_core->id);
+		/* remove waiting list from from_core->hwlock */
+		core_ctx->core = from_core;
+		__mfc_remove_listable_wq_ctx(core_ctx);
+
+		/* add waiting list to to_core->hwlock */
+		core_ctx->core = to_core;
+		list_add_tail(&core_ctx->hwlock_wq.list, &to_core->hwlock.waiting_list);
+		to_core->hwlock.wl_count++;
+		to_core->hwlock.owned_by_irq = 1;
+		mfc_info("hwlock waiting module moved MFC%d -> MFC%d\n",
+			 from_core->id, to_core->id);
+		MFC_TRACE_RM("[c:%d] hwlock module move %d -> %d\n",
+			     ctx->num, from_core->id, to_core->id);
+	}
+}
+
+static inline void __mfc_yield_hwlock(struct mfc_core *core,
+				      struct mfc_core_ctx *core_ctx)
+{
+	mfc_core_release_hwlock_ctx(core_ctx);
+
+	/* Trigger again if other instance's work is waiting */
+	if (core->sched->is_work(core))
+		core->sched->queue_work(core);
+}
+
+/*
+ * Should be called with hwlock.lock
+ */
+static inline void __mfc_transfer_hwlock_ctx_protected(struct mfc_core *core,
+						       int ctx_index)
+{
+	core->hwlock.dev = 0;
+	core->hwlock.bits = 0;
+	set_bit(ctx_index, &core->hwlock.bits);
+}
+
+/*
+ * Should be called with hwlock.lock
+ *
+ * Return value description
+ *   >=0: succeeded to get hwlock_bit for the context, index of new context
+ *   -1, -EINVAL: failed to get hwlock_bit for a context
+ */
+static int __mfc_try_to_get_new_ctx_protected(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+	int ret = 0;
+	int index;
+	struct mfc_ctx *new_ctx;
+
+	if (core->shutdown) {
+		mfc_core_info("Couldn't lock HW. Shutdown was called\n");
+		return -EINVAL;
+	}
+
+	if (core->sleep) {
+		mfc_core_info("Couldn't lock HW. Sleep was called\n");
+		return -EINVAL;
+	}
+
+	/* Check whether hardware is not running */
+	if (core->hwlock.bits != 0 || core->hwlock.dev != 0) {
+		/* This is perfectly ok, the scheduled ctx should wait */
+		mfc_core_debug(2, "Couldn't lock HW\n");
+		return -1;
+	}
+
+	/* Choose the context to run */
+	index = core->sched->pick_next_work(core);
+	if (index < 0) {
+		/* This is perfectly ok, the scheduled ctx should wait
+		 * No contexts to run
+		 */
+		mfc_core_debug(2, "No ctx is scheduled to be run\n");
+		ret = -1;
+		return ret;
+	}
+
+	new_ctx = dev->ctx[index];
+	if (!new_ctx) {
+		mfc_core_err("no mfc context to run\n");
+		ret = -1;
+		return ret;
+	}
+
+	set_bit(new_ctx->num, &core->hwlock.bits);
+	ret = index;
+
+	return ret;
+}
+
+/*
+ * Should be called without hwlock holding
+ *
+ * Try to run an operation on hardware
+ */
+void mfc_core_try_run(struct mfc_core *core)
+{
+	int new_ctx_index;
+	int ret;
+	unsigned long flags;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_info("[MSR] Couldn't run HW. It's Error state\n");
+		return;
+	}
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	new_ctx_index = __mfc_try_to_get_new_ctx_protected(core);
+	if (new_ctx_index < 0) {
+		mfc_core_debug(2, "Failed to get new context to run\n");
+		__mfc_print_hwlock(core);
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+		return;
+	}
+
+	core->hwlock.owned_by_irq = 1;
+
+	__mfc_print_hwlock(core);
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+	ret = mfc_core_just_run(core, new_ctx_index);
+	if (ret)
+		__mfc_yield_hwlock(core, core->core_ctx[new_ctx_index]);
+}
+
+static int __mfc_just_run_dec(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+
+	switch (core_ctx->state) {
+	case MFCINST_FINISHING:
+		ret = mfc_core_run_dec_last_frames(core, ctx);
+		break;
+	case MFCINST_RUNNING:
+		ret = mfc_core_run_dec_frame(core, ctx);
+		break;
+	case MFCINST_INIT:
+		mfc_core_cmd_open_inst(core, ctx);
+		break;
+	case MFCINST_RETURN_INST:
+		ret = mfc_core_cmd_close_inst(core, ctx);
+		break;
+	case MFCINST_GOT_INST:
+		ret = mfc_core_run_dec_init(core, ctx);
+		break;
+	case MFCINST_HEAD_PARSED:
+		if (core_ctx->codec_buffer_allocated == 0) {
+			ctx->clear_work_bit = 1;
+			mfc_err("codec buffer is not allocated\n");
+			ret = -EAGAIN;
+			break;
+		}
+		if (ctx->wait_state != WAIT_NONE) {
+			mfc_err("wait_state(%d) is not ready\n", ctx->wait_state);
+			ret = -EAGAIN;
+			break;
+		}
+		ret = mfc_core_cmd_dec_init_buffers(core, ctx);
+		break;
+	case MFCINST_RES_CHANGE_INIT:
+		ret = mfc_core_run_dec_last_frames(core, ctx);
+		break;
+	case MFCINST_RES_CHANGE_FLUSH:
+		ret = mfc_core_run_dec_last_frames(core, ctx);
+		break;
+	case MFCINST_RES_CHANGE_END:
+		mfc_debug(2, "[DRC] Finished remaining frames after resolution change\n");
+		ctx->capture_state = QUEUE_FREE;
+		mfc_debug(2, "[DRC] Will re-init the codec\n");
+		ret = mfc_core_run_dec_init(core, ctx);
+		break;
+	case MFCINST_DPB_FLUSHING:
+		mfc_core_cmd_dpb_flush(core, ctx);
+		break;
+	case MFCINST_MOVE_INST:
+		mfc_core_cmd_move_inst(core, ctx);
+		break;
+	default:
+		mfc_info("can't try command(decoder just_run), state : %d\n",
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
@@ -321,6 +538,12 @@ int mfc_core_just_run(struct mfc_core *core, int new_ctx_index)
 		core->next_ctx_idx = -1;
 	}
 
+	/* Got context to run in ctx */
+	mfc_debug(2, "src: %d(ready: %d), dst: %d, state: %d, dpb_count = %d\n",
+		  mfc_get_queue_count(&ctx->buf_queue_lock, &core_ctx->src_buf_queue),
+		  mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue),
+		  mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue),
+		  core_ctx->state, ctx->dpb_count);
 	mfc_debug(2, "core_ctx->state = %d\n", core_ctx->state);
 	/* Last frame has already been sent to MFC
 	 * Now obtaining frames from MFC buffer
@@ -332,5 +555,146 @@ int mfc_core_just_run(struct mfc_core *core, int new_ctx_index)
 	else
 		core->continue_clock_on = false;
 
+	if (ctx->type == MFCINST_DECODER) {
+		ret = __mfc_just_run_dec(core, ctx);
+	} else {
+		mfc_err("invalid context type: %d\n", ctx->type);
+		ret = -EAGAIN;
+	}
+
+	if (ret) {
+		/*
+		 * Clear any reserved F/W cache flush for next ctx,
+		 * as this will be newly decided in Prediction code.
+		 */
+		core->cache_flush_flag = 0;
+		core->last_cmd_has_cache_flush = 0;
+
+		/*
+		 * Check again the ctx condition and clear work bits
+		 * if ctx is not available.
+		 */
+		if (core->sched->dequeue_work(core, core_ctx) == 0)
+			ctx->clear_work_bit = 0;
+		if (ctx->clear_work_bit) {
+			core->sched->clear_work(core, core_ctx);
+			ctx->clear_work_bit = 0;
+		}
+
+		mfc_core_pm_clock_off(core, 1);
+	}
+
 	return ret;
 }
+
+void mfc_core_hwlock_handler_irq(struct mfc_core *core,
+				 struct mfc_ctx *ctx,
+				 unsigned int reason,
+				 unsigned int err)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int new_ctx_index;
+	unsigned long flags;
+	int ret, need_butler = 0;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_info("[MSR] Couldn't lock HW. It's Error state\n");
+		return;
+	}
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	/* For handling DRC, when state is RES_CHANGE_INIT or RES_CHANGE_FLUSH,
+	 * we need to make need_butler = 1. Then, rm_request_work will be called.
+	 */
+	if ((IS_MULTI_MODE(ctx) &&
+	     (core_ctx->state == MFCINST_RUNNING ||
+	      core_ctx->state == MFCINST_RES_CHANGE_INIT)) ||
+	     (ctx->handle_drc_multi_mode &&
+	      (core_ctx->state == MFCINST_RES_CHANGE_FLUSH ||
+	       core_ctx->state == MFCINST_RES_CHANGE_FLUSH_FINISHED)))
+		need_butler = 1;
+
+	if (core->hwlock.owned_by_irq) {
+		if (core->preempt_core_ctx > MFC_NO_INSTANCE_SET) {
+			mfc_debug(2, "There is a preempt_core_ctx\n");
+			core->continue_clock_on = true;
+			mfc_wake_up_core_ctx(core_ctx, reason, err);
+			new_ctx_index = core->preempt_core_ctx;
+			mfc_debug(2, "preempt_core_ctx is : %d\n", new_ctx_index);
+			__mfc_transfer_hwlock_ctx_protected(core, new_ctx_index);
+			spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+			ret = mfc_core_just_run(core, new_ctx_index);
+			if (ret) {
+				core->continue_clock_on = false;
+				__mfc_yield_hwlock(core, core->core_ctx[new_ctx_index]);
+			}
+		} else if (!list_empty(&core->hwlock.waiting_list)) {
+			mfc_debug(2, "There is a waiting module for hwlock\n");
+			core->continue_clock_on = false;
+
+			spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+			mfc_core_pm_clock_off(core, 1);
+			mfc_wake_up_core_ctx(core_ctx, reason, err);
+			mfc_core_release_hwlock_ctx(core_ctx);
+			core->sched->queue_work(core);
+		} else {
+			mfc_debug(2, "No preempt_ctx and no waiting module\n");
+			new_ctx_index = core->sched->pick_next_work(core);
+			if (new_ctx_index < 0) {
+				mfc_debug(2, "No ctx to run\n");
+				/* No contexts to run */
+				core->continue_clock_on = false;
+
+				spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+				mfc_core_pm_clock_off(core, 1);
+				mfc_wake_up_core_ctx(core_ctx, reason, err);
+				mfc_core_release_hwlock_ctx(core_ctx);
+				core->sched->queue_work(core);
+			} else {
+				mfc_debug(2, "There is a ctx to run\n");
+				core->continue_clock_on = true;
+				mfc_wake_up_core_ctx(core_ctx, reason, err);
+
+				/* If cache flush command is needed or there is OTF handle,
+				 *  handler should stop
+				 */
+				if (!need_butler) {
+					mfc_debug(2, "Work to do successively (next ctx: %d)\n",
+						  new_ctx_index);
+					__mfc_transfer_hwlock_ctx_protected(core, new_ctx_index);
+
+					spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+					ret = mfc_core_just_run(core, new_ctx_index);
+					if (ret) {
+						core->continue_clock_on = false;
+						__mfc_yield_hwlock(core,
+								   core->core_ctx[new_ctx_index]);
+					}
+				} else {
+					spin_unlock_irqrestore(&core->hwlock.lock, flags);
+					mfc_core_release_hwlock_ctx(core_ctx);
+				}
+			}
+		}
+	} else {
+		mfc_debug(2, "hwlock is NOT owned by irq\n");
+		core->continue_clock_on = false;
+
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+		mfc_core_pm_clock_off(core, 1);
+		mfc_wake_up_core_ctx(core_ctx, reason, err);
+		core->sched->queue_work(core);
+	}
+
+	if (need_butler)
+		queue_work(core->dev->butler_wq, &core->dev->butler_work);
+
+	__mfc_print_hwlock(core);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
index 35f34f306d7d..156809eafede 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
@@ -68,5 +68,13 @@ int mfc_core_get_hwlock_ctx(struct mfc_core_ctx *core_ctx);
 
 void mfc_core_release_hwlock_dev(struct mfc_core *core);
 void mfc_core_release_hwlock_ctx(struct mfc_core_ctx *core_ctx);
+
+void mfc_core_move_hwlock_ctx(struct mfc_core *to_core, struct mfc_core *from_core,
+			      struct mfc_core_ctx *core_ctx);
+
+void mfc_core_try_run(struct mfc_core *core);
 int mfc_core_just_run(struct mfc_core *core, int new_ctx_index);
+void mfc_core_hwlock_handler_irq(struct mfc_core *core, struct mfc_ctx *ctx,
+				 unsigned int reason, unsigned int err);
+
 #endif /* __MFC_CORE_HWLOCK_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
index 4c6f531ffc02..94cc3c4dfdc5 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
@@ -18,7 +18,38 @@
 #include "mfc_core_hw_reg_api.h"
 #include "mfc_core_reg_api.h"
 
+#include "base/mfc_rate_calculate.h"
+#include "base/mfc_qos.h"
+
+#include "base/mfc_queue.h"
 #include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+
+static inline enum vb2_buffer_state __mfc_get_buf_state(unsigned int err)
+{
+	switch (err) {
+	case MFC_REG_ERR_NO_KEY_FRAME:
+	case MFC_REG_ERR_NO_VALID_SEQ_HDR:
+	case MFC_REG_ERR_NO_VALID_PIC_HDR:
+	case MFC_REG_ERR_NO_VALID_REF_FOR_SKIP:
+	case MFC_REG_ERR_UNSUPPORTED_FEATURE:
+	case MFC_REG_ERR_UNSUPPORTED_RESOLUTION:
+	case MFC_REG_ERR_HEADER_NOT_FOUND:
+	case MFC_REG_ERR_INVALID_NAL_TYPE:
+	case MFC_REG_ERR_SEQUENCE_HEADER_ERROR:
+	case MFC_REG_ERR_PICTURE_HEADER_ERROR:
+	case MFC_REG_ERR_SLICE_HEADER_ERROR:
+	case MFC_REG_ERR_MISSING_FIRST_FIELD:
+	case MFC_REG_ERR_SLICE_COUNT_IS_OVER_ASO:
+	case MFC_REG_ERR_TILE_HEADER_ERROR:
+	case MFC_REG_ERR_MAX_VIEW_NUM_OVER:
+	case MFC_REG_ERR_MFC_TIMEOUT:
+		return VB2_BUF_STATE_ERROR;
+	default:
+		return VB2_BUF_STATE_DONE;
+	}
+}
 
 static inline int __mfc_core_is_err_condition(unsigned int err)
 {
@@ -35,10 +66,1216 @@ static inline int __mfc_core_is_err_condition(unsigned int err)
 	}
 }
 
+static inline void mfc_handle_force_change_status(struct mfc_core_ctx *core_ctx)
+{
+	if (core_ctx->state != MFCINST_ABORT &&
+	    core_ctx->state != MFCINST_HEAD_PARSED &&
+	    core_ctx->state != MFCINST_RES_CHANGE_FLUSH &&
+	    core_ctx->state != MFCINST_RES_CHANGE_FLUSH_FINISHED)
+		mfc_change_state(core_ctx, MFCINST_RUNNING);
+}
+
+static void __mfc_handle_black_bar_info(struct mfc_core *core,
+					struct mfc_ctx *ctx)
+{
+	struct v4l2_rect new_black_bar;
+	int black_bar_info;
+	struct mfc_dec *dec = ctx->dec_priv;
+
+	black_bar_info = mfc_core_get_black_bar_detection();
+	mfc_ctx_debug(3, "[BLACKBAR] type: %#x\n", black_bar_info);
+
+	if (black_bar_info == MFC_REG_DISP_STATUS_BLACK_BAR) {
+		new_black_bar.left = mfc_core_get_black_bar_pos_x();
+		new_black_bar.top = mfc_core_get_black_bar_pos_y();
+		new_black_bar.width = mfc_core_get_black_bar_image_w();
+		new_black_bar.height = mfc_core_get_black_bar_image_h();
+	} else if (black_bar_info == MFC_REG_DISP_STATUS_BLACK_SCREEN) {
+		new_black_bar.left = -1;
+		new_black_bar.top = -1;
+		new_black_bar.width = ctx->img_width;
+		new_black_bar.height = ctx->img_height;
+	} else if (black_bar_info == MFC_REG_DISP_STATUS_NOT_DETECTED) {
+		new_black_bar.left = 0;
+		new_black_bar.top = 0;
+		new_black_bar.width = ctx->img_width;
+		new_black_bar.height = ctx->img_height;
+	} else {
+		mfc_ctx_err("[BLACKBAR] Not supported type: %#x\n", black_bar_info);
+		dec->black_bar_updated = 0;
+		return;
+	}
+
+	if (new_black_bar.left == dec->black_bar.left &&
+	    new_black_bar.top == dec->black_bar.top &&
+	    new_black_bar.width == dec->black_bar.width &&
+	    new_black_bar.height == dec->black_bar.height) {
+		mfc_ctx_debug(4, "[BLACKBAR] information was not changed\n");
+		dec->black_bar_updated = 0;
+		return;
+	}
+
+	dec->black_bar = new_black_bar;
+	dec->black_bar_updated = 1;
+}
+
+static unsigned int __mfc_handle_frame_field(struct mfc_core *core,
+					     struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int interlace_type = 0, is_interlace = 0;
+	unsigned int field;
+
+	if (IS_H264_DEC(ctx)) {
+		dec->is_mbaff = mfc_core_is_mbaff_picture();
+		is_interlace = mfc_core_is_interlace_picture();
+	}
+
+	if (is_interlace) {
+		interlace_type = mfc_core_get_interlace_type();
+		if (interlace_type)
+			field = V4L2_FIELD_INTERLACED_TB;
+		else
+			field = V4L2_FIELD_INTERLACED_BT;
+	} else if (dec->is_mbaff) {
+		field = V4L2_FIELD_INTERLACED_TB;
+	} else {
+		field = V4L2_FIELD_NONE;
+	}
+
+	if (is_interlace || dec->is_mbaff)
+		mfc_ctx_debug(2, "[INTERLACE] is_interlace: %d (type : %d), is_mbaff: %d, field: %#x\n",
+			      is_interlace, interlace_type, dec->is_mbaff, field);
+
+	return field;
+}
+
+static struct mfc_buf *__mfc_handle_last_frame(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *dst_mb;
+	int index, i;
+
+	mfc_ctx_debug(2, "DQ empty DPB with stored tag\n");
+
+	dst_mb = mfc_get_del_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (!dst_mb) {
+		mfc_ctx_err("there is no dst buffer for EOS tag\n");
+		return NULL;
+	}
+
+	mfc_ctx_debug(2, "Cleaning up buffer: [%d][%d]\n",
+		      dst_mb->vb.vb2_buf.index, dst_mb->dpb_index);
+
+	index = dst_mb->vb.vb2_buf.index;
+
+	for (i = 0; i < ctx->dst_fmt->mem_planes; i++)
+		vb2_set_plane_payload(&dst_mb->vb.vb2_buf, i, 0);
+
+	dst_mb->vb.sequence = (++ctx->sequence);
+	dst_mb->vb.field = __mfc_handle_frame_field(core, ctx);
+	mfc_clear_mb_flag(dst_mb);
+
+	if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+		mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+	call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+		 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, ctx->stored_tag);
+
+	mutex_lock(&dec->dpb_mutex);
+
+	index = dst_mb->dpb_index;
+	dec->dpb[index].queued = 0;
+	clear_bit(index, &dec->queued_dpb);
+	dec->display_index = dst_mb->dpb_index;
+
+	mutex_unlock(&dec->dpb_mutex);
+	mfc_ctx_debug(2, "[DPB] Cleand up index [%d][%d], used_flag = %#lx, queued = %#lx\n",
+		      dst_mb->vb.vb2_buf.index, dst_mb->dpb_index,
+		      dec->dynamic_used, dec->queued_dpb);
+
+	return dst_mb;
+}
+
+static void __mfc_handle_frame_unused_output(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *mfc_buf = NULL;
+	unsigned int index;
+
+	while (1) {
+		mfc_buf = mfc_get_del_buf(ctx, &ctx->err_buf_queue, MFC_BUF_NO_TOUCH_USED);
+		if (!mfc_buf)
+			break;
+
+		index = mfc_buf->vb.vb2_buf.index;
+
+		mfc_clear_mb_flag(mfc_buf);
+		mfc_buf->vb.flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+				       V4L2_BUF_FLAG_PFRAME |
+				       V4L2_BUF_FLAG_BFRAME |
+				       V4L2_BUF_FLAG_ERROR);
+
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+			mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+		call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+			 V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS,
+			 MFC_REG_DEC_STATUS_DECODING_ONLY);
+
+		call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+			 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, UNUSED_TAG);
+
+		dec->ref_buf[dec->refcnt].fd[0] = mfc_buf->vb.vb2_buf.planes[0].m.fd;
+		dec->refcnt++;
+
+		vb2_buffer_done(&mfc_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		mfc_ctx_debug(2, "[DPB] dst index [%d][%d] fd: %d is buffer done (not used)\n",
+			      mfc_buf->vb.vb2_buf.index, mfc_buf->dpb_index,
+			      mfc_buf->vb.vb2_buf.planes[0].m.fd);
+	}
+}
+
+static void __mfc_handle_ref_info(struct mfc_ctx *ctx, struct mfc_buf *mfc_buf, unsigned int err)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct dec_dpb_ref_info *ref_info = NULL;
+	int i;
+
+	if (!mfc_buf) {
+		for (i = 0; i < dec->refcnt; i++)
+			mfc_ctx_debug(2, "[REFINFO] Released FD = %d will update with display buffer\n",
+				      dec->ref_buf[i].fd[0]);
+		return;
+	}
+
+	ref_info = &dec->ref_info[mfc_buf->vb.vb2_buf.index];
+	for (i = 0; i < dec->refcnt; i++)
+		ref_info->dpb[i].fd[0] = dec->ref_buf[i].fd[0];
+	if (dec->refcnt != MFC_MAX_BUFFERS)
+		ref_info->dpb[i].fd[0] = MFC_INFO_INIT_FD;
+	dec->refcnt = 0;
+
+	mfc_ctx_debug(2, "[DPB] dst index [%d][%d] fd: %d is buffer done\n",
+		      mfc_buf->vb.vb2_buf.index, mfc_buf->dpb_index,
+		      mfc_buf->vb.vb2_buf.planes[0].m.fd);
+	vb2_buffer_done(&mfc_buf->vb.vb2_buf, mfc_get_warn(err) ?
+			VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+}
+
+static void __mfc_handle_frame_all_extracted(struct mfc_core *core,
+					     struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_buf *dst_mb;
+	int index, i, is_first = 1;
+
+	mfc_debug(2, "Decided to finish\n");
+	ctx->sequence++;
+
+	if (core_ctx->state == MFCINST_RES_CHANGE_FLUSH)
+		is_first = 0;
+
+	while (1) {
+		dst_mb = mfc_get_del_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+		if (!dst_mb)
+			break;
+
+		mfc_debug(2, "Cleaning up buffer: [%d][%d]\n",
+			  dst_mb->vb.vb2_buf.index, dst_mb->dpb_index);
+
+		index = dst_mb->vb.vb2_buf.index;
+
+		for (i = 0; i < ctx->dst_fmt->mem_planes; i++)
+			vb2_set_plane_payload(&dst_mb->vb.vb2_buf, i, 0);
+
+		dst_mb->vb.sequence = (ctx->sequence++);
+		dst_mb->vb.field = __mfc_handle_frame_field(core, ctx);
+		mfc_clear_mb_flag(dst_mb);
+
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+			mfc_err("failed in core_get_buf_ctrls\n");
+
+		if (is_first) {
+			call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+				 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, ctx->stored_tag);
+			is_first = 0;
+		} else {
+			call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+				 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, DEFAULT_TAG);
+			call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+				 V4L2_CID_MPEG_VIDEO_H264_SEI_FP_AVAIL, 0);
+		}
+
+		mutex_lock(&dec->dpb_mutex);
+
+		index = dst_mb->dpb_index;
+		dec->dpb[index].queued = 0;
+		clear_bit(index, &dec->queued_dpb);
+
+		mutex_unlock(&dec->dpb_mutex);
+
+		vb2_buffer_done(&dst_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		mfc_debug(2, "[DPB] Cleand up index = %d, used_flag = %#lx, queued = %#lx\n",
+			  index, dec->dynamic_used, dec->queued_dpb);
+	}
+
+	/* dequeue unused DPB */
+	__mfc_handle_frame_unused_output(core, ctx);
+
+	mfc_handle_force_change_status(core_ctx);
+	mfc_debug(2, "After cleanup\n");
+
+	mfc_cleanup_iovmm_except_used(ctx);
+	mfc_print_dpb_table(ctx);
+}
+
+static void __mfc_handle_frame_copy_timestamp(struct mfc_core_ctx *core_ctx,
+					      dma_addr_t dec_y_addr)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_buf *dst_mb, *src_mb;
+
+	/* Get the source buffer */
+	src_mb = mfc_get_buf(ctx, &core_ctx->src_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (!src_mb) {
+		mfc_err("[TS] no src buffers\n");
+		return;
+	}
+
+	dst_mb = mfc_find_buf(ctx, &ctx->dst_buf_queue, dec_y_addr);
+	if (dst_mb)
+		dst_mb->vb.vb2_buf.timestamp = src_mb->vb.vb2_buf.timestamp;
+}
+
+static struct mfc_buf *__mfc_handle_frame_output_del(struct mfc_core *core,
+						     struct mfc_ctx *ctx,
+						     unsigned int err)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_raw_info *raw = &ctx->raw_buf;
+	struct mfc_buf *dst_mb = NULL;
+	dma_addr_t dspl_y_addr;
+	unsigned int frame_type;
+	unsigned int dst_frame_status;
+	unsigned int is_video_signal_type = 0, is_colour_description = 0;
+	unsigned int is_content_light = 0, is_display_colour = 0;
+	unsigned int i, idr_flag, is_last_display;
+	int index;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->color_aspect_dec)) {
+		is_video_signal_type = mfc_core_get_video_signal_type();
+		is_colour_description = mfc_core_get_colour_description();
+	}
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->static_info_dec)) {
+		is_content_light = mfc_core_get_sei_avail_content_light();
+		is_display_colour = mfc_core_get_sei_avail_mastering_display();
+	}
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->black_bar) &&
+	    (dec->detect_black_bar ||
+	     core->dev->debugfs.feature_option & MFC_OPTION_BLACK_BAR_ENABLE))
+		__mfc_handle_black_bar_info(core, ctx);
+	else
+		dec->black_bar_updated = 0;
+
+	if (dec->immediate_display == 1) {
+		dspl_y_addr = mfc_core_get_dec_y_addr();
+		frame_type = mfc_core_get_dec_frame_type();
+		idr_flag = mfc_core_get_dec_idr_flag();
+	} else {
+		dspl_y_addr = mfc_core_get_disp_y_addr();
+		frame_type = mfc_core_get_disp_frame_type();
+		idr_flag = mfc_core_get_disp_idr_flag();
+	}
+
+	is_last_display = mfc_core_get_last_display();
+
+	/* If multi_view_enable(MV-HEVC), buffer must not be delete at the irq of main_view.
+	 * Because, buffer will be reused for sub_view.
+	 */
+	if (!ctx->multi_view_enable || ctx->select_view_irq == MFC_VIEW_ID_SUB) {
+		dst_mb = mfc_find_del_buf(ctx, &ctx->dst_buf_queue, dspl_y_addr);
+	} else {
+		dst_mb = mfc_find_buf(ctx, &ctx->dst_buf_queue, dspl_y_addr);
+		mfc_ctx_debug(2, "not delete dst_mb to reuse for VIEW_1\n");
+	}
+
+	if (dst_mb) {
+		index = dst_mb->vb.vb2_buf.index;
+		/* Check if this is the buffer we're looking for */
+		mfc_ctx_debug(2, "[BUFINFO][DPB] ctx[%d] get dst index: [%d][%d], addr[0]: 0x%08llx\n",
+			      ctx->num, index, dst_mb->dpb_index,
+			      dst_mb->addr[0][0]);
+
+		if (dec->crc_enable && dec->crc &&
+		    (ctx->dev->debugfs.sfr_dump & MFC_DUMP_DEC_CRC)) {
+			if (dec->crc_idx < SZ_1K) {
+				dec->crc[dec->crc_idx++] = mfc_core_get_crc_luma();
+				dec->crc[dec->crc_idx++] = mfc_core_get_crc_chroma();
+			} else {
+				mfc_ctx_debug(2, "[CRC] couldn't store CRC dump (idx: %d)\n",
+					      dec->crc_idx);
+			}
+		}
+
+		dst_mb->vb.sequence = ctx->sequence;
+		dst_mb->vb.field = __mfc_handle_frame_field(core, ctx);
+
+		/* Set flag bits in order to inform SEI information */
+		if (ctx->select_view_irq == MFC_VIEW_ID_MAIN) {
+			mfc_clear_mb_flag(dst_mb);
+
+			dst_mb->vb.flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+					      V4L2_BUF_FLAG_PFRAME |
+					      V4L2_BUF_FLAG_BFRAME |
+					      V4L2_BUF_FLAG_ERROR);
+
+			switch (frame_type) {
+			case MFC_REG_DISPLAY_FRAME_I:
+				dst_mb->vb.flags |= V4L2_BUF_FLAG_KEYFRAME;
+				if (!(CODEC_HAS_IDR(ctx) && !idr_flag)) {
+					mfc_set_mb_flag(dst_mb, MFC_FLAG_SYNC_FRAME);
+					mfc_ctx_debug(2, "[FRAME] syncframe IDR\n");
+				}
+				break;
+			case MFC_REG_DISPLAY_FRAME_P:
+				dst_mb->vb.flags |= V4L2_BUF_FLAG_PFRAME;
+				break;
+			case MFC_REG_DISPLAY_FRAME_B:
+				dst_mb->vb.flags |= V4L2_BUF_FLAG_BFRAME;
+				break;
+			default:
+				break;
+			}
+		}
+
+		if ((ctx->multi_view_enable || ctx->ready_to_be_multi_view_enable) &&
+		    mfc_core_get_mvc_right_view_id() == MFC_VIEW_ID_MAIN) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_RIGHT_IS_MAIN_VIEW);
+			mfc_ctx_debug(2, "[MV-HEVC] Right veiw is the main view.\n");
+		}
+
+		if (is_content_light) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_HDR_CONTENT_LIGHT);
+			mfc_ctx_debug(2, "[HDR] content light level parsed\n");
+		}
+
+		if (is_display_colour) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_HDR_DISPLAY_COLOUR);
+			mfc_ctx_debug(2, "[HDR] mastering display colour parsed\n");
+		}
+
+		if (is_video_signal_type) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_HDR_VIDEO_SIGNAL_TYPE);
+			mfc_ctx_debug(2, "[HDR] video signal type parsed\n");
+			if (is_colour_description) {
+				mfc_set_mb_flag(dst_mb,
+						MFC_FLAG_HDR_MAXTIX_COEFF);
+				mfc_ctx_debug(2, "[HDR] matrix coefficients parsed\n");
+				mfc_set_mb_flag(dst_mb,
+						MFC_FLAG_HDR_COLOUR_DESC);
+				mfc_ctx_debug(2, "[HDR] colour description parsed\n");
+			}
+		}
+
+		if (dec->black_bar_updated) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_BLACKBAR_DETECT);
+			mfc_ctx_debug(3, "[BLACKBAR] black bar detected\n");
+		}
+
+		if (ctx->update_framerate) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_FRAMERATE_CH);
+			ctx->update_framerate = false;
+			mfc_ctx_debug(2, "[QoS] framerate changed\n");
+		}
+
+		if (is_last_display) {
+			mfc_set_mb_flag(dst_mb, MFC_FLAG_LAST_FRAME);
+			mfc_ctx_debug(2, "[FRAME] Last display frame\n");
+		}
+
+		if (ctx->dst_fmt->mem_planes == 1) {
+			vb2_set_plane_payload(&dst_mb->vb.vb2_buf, 0,
+					      raw->total_plane_size);
+			mfc_ctx_debug(5, "single plane payload: %d\n",
+				      raw->total_plane_size);
+		} else {
+			for (i = 0; i < ctx->dst_fmt->mem_planes; i++) {
+				vb2_set_plane_payload(&dst_mb->vb.vb2_buf,
+						      i,
+						      raw->plane_size[i]);
+			}
+		}
+
+		if (mfc_get_warn(err)) {
+			mfc_ctx_info("Warning for displayed frame: %d\n", mfc_get_warn(err));
+			dst_mb->vb.flags |= V4L2_BUF_FLAG_ERROR;
+		}
+
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[index]) < 0)
+			mfc_ctx_err("failed in core_get_buf_ctrls\n");
+
+		if (dec->immediate_display == 1) {
+			dst_frame_status = mfc_core_get_dec_status();
+
+			call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+				 V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS,
+				 dst_frame_status);
+
+			call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[index],
+				 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, ctx->stored_tag);
+
+			dec->immediate_display = 0;
+		}
+
+		mfc_rate_update_last_framerate(ctx, dst_mb->vb.vb2_buf.timestamp);
+
+		mutex_lock(&dec->dpb_mutex);
+
+		dec->dpb[dst_mb->dpb_index].queued = 0;
+		clear_bit(dst_mb->dpb_index, &dec->queued_dpb);
+		dec->display_index = dst_mb->dpb_index;
+
+		mutex_unlock(&dec->dpb_mutex);
+	} else {
+		mfc_print_dpb_queue_with_lock(core->core_ctx[ctx->num], dec);
+	}
+
+	/*
+	 * When main-view of MV-HEVC, should return NULL.
+	 * Because, if address of dst_mb returned by this function is not NULL,
+	 * the address will be used by other functions.
+	 * It could cause kernel panic.
+	 */
+	if (ctx->multi_view_enable && ctx->select_view_irq == MFC_VIEW_ID_MAIN)
+		dst_mb = NULL;
+
+	return dst_mb;
+}
+
+static void __mfc_handle_released_buf(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned long prev_flag, new_released_flag, released_flag = 0;
+	unsigned long flag;
+	unsigned int released_flag_sub, released_flag_main;
+	int i, main_i, sub_i;
+
+	mutex_lock(&dec->dpb_mutex);
+
+	prev_flag = dec->dynamic_used;
+	dec->dynamic_used = mfc_core_get_dec_used_flag();
+	released_flag = prev_flag & (~dec->dynamic_used);
+	mfc_ctx_debug(2, "[DPB] Used flag: old = %#lx, new = %#lx, released = %#lx, queued = %#lx\n",
+		      prev_flag, dec->dynamic_used, released_flag, dec->queued_dpb);
+
+	/* In the case of multi_view_enable(MV-HEVC), both main_view and sub_view must be released
+	 * together. This is because the driver assigns dpb_index with only the lower half bit
+	 * and maps both main_view and sub_view together.
+	 *
+	 * 1) The driver splits the original released_flag into released_flag_sub,
+	 *    released_flag_main.
+	 * 2) Using the 'and' operation, it calculates the bits that can be released together
+	 *    and creates new_released_flag with the result
+	 * 3) If there are bits that can be released alone (either main or sub),
+	 *    it uses the 'xor' operation to set dynamic_used back to 1.
+	 */
+	if (ctx->multi_view_enable) {
+		released_flag_sub = released_flag >> (MFC_MAX_DPBS / 2);
+		released_flag_main = (unsigned int)released_flag;
+		released_flag_sub &= released_flag_main;
+		new_released_flag = ((unsigned long)released_flag_sub <<
+					(MFC_MAX_DPBS / 2)) | released_flag_sub;
+		dec->dynamic_used |= (new_released_flag ^ released_flag);
+		released_flag = new_released_flag;
+	}
+
+	flag = dec->dynamic_used | released_flag;
+	for (i = __ffs(flag); i < MFC_MAX_DPBS;) {
+		if (dec->dynamic_used & (1UL << i)) {
+			dec->dpb[i].ref = 1;
+			if (dec->dpb[i].mapcnt == 0)
+				mfc_ctx_err("[DPB] %d index is no dpb table\n", i);
+		}
+		if (released_flag & (1UL << i)) {
+			dec->dpb[i].ref = 0;
+
+			if (ctx->multi_view_enable && i >= MFC_MAX_DPBS / 2)
+				main_i = i - MFC_MAX_DPBS / 2;
+			else
+				main_i = i;
+
+			if (dec->dpb[main_i].queued && (dec->dpb[i].new_fd != -1)) {
+				dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[i].fd[0];
+				dec->refcnt++;
+				mfc_ctx_debug(3, "[REFINFO] Queued DPB[%d] released fd: %d\n",
+					      i, dec->dpb[i].fd[0]);
+				dec->dpb[i].fd[0] = dec->dpb[i].new_fd;
+				dec->dpb[i].new_fd = -1;
+				mfc_ctx_debug(3, "[REFINFO] Queued DPB[%d] reuse fd: %d\n",
+					      i, dec->dpb[i].fd[0]);
+			} else if (!dec->dpb[main_i].queued) {
+				dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[i].fd[0];
+				dec->refcnt++;
+				mfc_ctx_debug(3, "[REFINFO] Dqueued DPB[%d] released fd: %d\n",
+					      i, dec->dpb[i].fd[0]);
+
+				if (dec->dpb[i].new_fd != -1) {
+					dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[i].new_fd;
+					dec->refcnt++;
+					mfc_ctx_debug(3, "[REFINFO] Dqueued DPB[%d] released fd: %d\n",
+						      i, dec->dpb[i].new_fd);
+					dec->dpb[i].new_fd = -1;
+				}
+
+				/*
+				 * Except queued buffer,
+				 * the released DPB is deleted from dpb_table
+				 */
+				dec->dpb_table_used &= ~(1UL << i);
+				mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, i);
+			} else {
+				mfc_ctx_debug(3, "[REFINFO] Queued DPB[%d] reuse fd: %d\n",
+					      i, dec->dpb[i].fd[0]);
+			}
+		}
+		flag &= ~(1UL << i);
+		if (flag == 0)
+			break;
+		i = __ffs(flag);
+	}
+
+	/* The displayed and not referenced buffer must be freed from dpb_table */
+	if (dec->display_index >= 0) {
+		i = dec->display_index;
+
+		if (!ctx->multi_view_enable) {
+			if (!(dec->dynamic_used & (1UL << i)) &&
+			    dec->dpb[i].mapcnt &&
+			    !dec->dpb[i].queued) {
+				dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[i].fd[0];
+				dec->refcnt++;
+				mfc_ctx_debug(3, "[REFINFO] display DPB[%d] released fd: %d\n",
+					      i, dec->dpb[i].fd[0]);
+				dec->dpb_table_used &= ~(1UL << i);
+				mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, i);
+			}
+		} else {
+			/* display_index is dpb_index of main view (view0) */
+			main_i = i;
+			sub_i = i + MFC_MAX_DPBS / 2;
+
+			/* Both main_view and sub_view must always be released together. */
+			if (!(dec->dynamic_used & (1UL << main_i)) && dec->dpb[main_i].mapcnt &&
+			    !dec->dpb[main_i].queued && !(dec->dynamic_used & (1UL << sub_i)) &&
+			    dec->dpb[sub_i].mapcnt && !dec->dpb[sub_i].queued) {
+				dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[main_i].fd[0];
+				dec->refcnt++;
+				mfc_ctx_debug(3, "[REFINFO] display DPB[%d] released fd: %d\n",
+					      main_i, dec->dpb[main_i].fd[0]);
+				dec->dpb_table_used &= ~(1UL << main_i);
+				mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, main_i);
+
+				dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[sub_i].fd[0];
+				dec->refcnt++;
+				mfc_ctx_debug(3, "[REFINFO] display DPB[%d] released fd: %d\n",
+					      sub_i, dec->dpb[sub_i].fd[0]);
+				dec->dpb_table_used &= ~(1UL << sub_i);
+				mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, sub_i);
+			} else if (dec->dpb[main_i].mapcnt) {
+				if (ctx->select_view_irq == MFC_VIEW_ID_MAIN)
+					dec->dynamic_used |= (1UL << main_i);
+				else
+					dec->dynamic_used |= (1UL << sub_i);
+			}
+		}
+
+		dec->display_index = -1;
+	}
+
+	mfc_print_dpb_table(ctx);
+
+	mutex_unlock(&dec->dpb_mutex);
+}
+
+static struct mfc_buf *__mfc_handle_frame_output(struct mfc_core *core,
+						 struct mfc_ctx *ctx,
+						 unsigned int err)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int frame_type;
+
+	frame_type = mfc_core_get_disp_frame_type();
+
+	if (!ctx->multi_view_enable || ctx->select_view_irq == MFC_VIEW_ID_SUB)
+		ctx->sequence++;
+
+	if (dec->immediate_display == 1)
+		frame_type = mfc_core_get_dec_frame_type();
+
+	mfc_ctx_debug(2, "[FRAME] frame type: %d\n", frame_type);
+
+	/* If frame is same as previous then skip and do not dequeue */
+	if (frame_type == MFC_REG_DISPLAY_FRAME_NOT_CODED)
+		return NULL;
+
+	/* Dequeued display buffer for user */
+	return __mfc_handle_frame_output_del(core, ctx, err);
+}
+
+static void __mfc_handle_error_state(struct mfc_ctx *ctx, struct mfc_core_ctx *core_ctx)
+{
+	mfc_err("[MSR] It's Error state: cleanup queue\n");
+	MFC_TRACE_CORE_CTX("*** ERROR state\n");
+
+	mfc_change_state(core_ctx, MFCINST_ERROR);
+
+	/* Mark all dst buffers as having an error */
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->dst_buf_queue);
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->err_buf_queue);
+	/* Mark all src buffers as having an error */
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue);
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &core_ctx->src_buf_queue);
+}
+
+void mfc_core_handle_error(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+	struct mfc_core_ctx *core_ctx;
+	int i;
+
+	mfc_core_err("[MSR] >>>>>>>> MFC CORE is Error state <<<<<<<<\n");
+	mfc_core_change_state(core, MFCCORE_ERROR);
+
+	mutex_lock(&dev->mfc_mutex);
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		if (!core->core_ctx[i])
+			continue;
+		/* TODO: need to check two core mode */
+		core_ctx = core->core_ctx[i];
+		__mfc_handle_error_state(core_ctx->ctx, core_ctx);
+	}
+	mutex_unlock(&dev->mfc_mutex);
+}
+
+/* Error handling for interrupt */
+static inline void __mfc_handle_error(struct mfc_core *core,
+				      struct mfc_ctx *ctx,
+				      unsigned int reason,
+				      unsigned int error_code)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_buf *src_mb;
+	unsigned int err, warn;
+
+	err = mfc_get_err(error_code);
+	warn = mfc_get_err(error_code);
+
+	if ((err >= MFC_REG_ERR_FRAME_CONCEAL && err <= MFC_REG_ERR_WARNINGS_END) ||
+	    (warn >= MFC_REG_ERR_FRAME_CONCEAL && warn <= MFC_REG_ERR_WARNINGS_END))
+		mfc_info("Interrupt Warn: display: %d, decoded: %d\n", warn, err);
+	else
+		mfc_err("Interrupt Error: display: %d, decoded: %d\n", warn, err);
+
+	/* Error recovery is dependent on the state of context */
+	switch (core_ctx->state) {
+	case MFCINST_RES_CHANGE_END:
+	case MFCINST_GOT_INST:
+		/* This error had to happen while parsing the header */
+		src_mb = mfc_get_del_buf(ctx, &core_ctx->src_buf_queue,
+					 MFC_BUF_NO_TOUCH_USED);
+		if (src_mb) {
+			unsigned char *stream_vir = NULL;
+			unsigned int strm_size = 0;
+
+			stream_vir = src_mb->vir_addr[0];
+			strm_size = src_mb->vb.vb2_buf.planes[0].bytesused;
+			if (strm_size > 640)
+				strm_size = 640;
+
+			if (stream_vir && strm_size)
+				print_hex_dump(KERN_ERR, "No header: ",
+					       DUMP_PREFIX_OFFSET, 32, 4,
+					       stream_vir, strm_size, false);
+
+			mfc_clear_mb_flag(src_mb);
+			mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+			vb2_buffer_done(&src_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		}
+		break;
+	case MFCINST_INIT:
+		/* This error had to happen while acquireing instance */
+	case MFCINST_RETURN_INST:
+		/* This error had to happen while releasing instance */
+	case MFCINST_DPB_FLUSHING:
+		/* This error had to happen while flushing DPB */
+		break;
+	case MFCINST_HEAD_PARSED:
+		/* This error had to happen while setting dst buffers */
+	case MFCINST_RES_CHANGE_INIT:
+	case MFCINST_RES_CHANGE_FLUSH:
+		/* This error has to happen while resolution change */
+	case MFCINST_ABORT_INST:
+		/* This error has to happen while buffer full handling */
+	case MFCINST_FINISHING:
+		/* It is higly probable that an error occurred
+		 * while decoding a frame
+		 */
+		__mfc_handle_error_state(ctx, core_ctx);
+		break;
+	default:
+		mfc_err("Encountered an error interrupt which had not been handled\n");
+		mfc_err("core_ctx->state = %d, core_ctx->inst_no = %d\n",
+			core_ctx->state, core_ctx->inst_no);
+		break;
+	}
+
+	mfc_wake_up_core(core, reason, error_code);
+}
+
+static void __mfc_handle_frame_error(struct mfc_core *core,
+				     struct mfc_ctx *ctx,
+				     unsigned int reason,
+				     unsigned int err)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec;
+	struct mfc_buf *src_mb = NULL;
+	unsigned int index;
+	enum vb2_buffer_state vb2_state;
+
+	dec = ctx->dec_priv;
+	if (!dec) {
+		mfc_err("no mfc decoder to run\n");
+		return;
+	}
+
+	mfc_err("Interrupt Error: %d\n", err);
+
+	if (mfc_get_err(err) == MFC_REG_ERR_MISSING_NON_BASE_VIEW_DETECTED)
+		mfc_err("[MV-HEVC] %s, Reuse current main-view, skipping previous one.\n",
+			"MFC_REG_ERR_MISSING_NON_BASE_VIEW_DETECTED");
+	else
+		/* Get the source buffer */
+		src_mb = mfc_get_del_buf(ctx, &core_ctx->src_buf_queue,
+					 MFC_BUF_NO_TOUCH_USED);
+
+	if (!src_mb) {
+		mfc_err("no src buffers\n");
+	} else {
+		index = src_mb->vb.vb2_buf.index;
+		if (call_bop(ctx, core_recover_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+			mfc_err("failed in core_recover_buf_ctrls\n");
+
+		mfc_ctx_debug(2, "MFC needs next buffer\n");
+		dec->consumed = 0;
+		mfc_clear_mb_flag(src_mb);
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+
+		if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+			mfc_err("failed in core_get_buf_ctrls\n");
+
+		vb2_state = __mfc_get_buf_state(mfc_get_err(err));
+		mfc_debug(2, "[STREAM] consumed only by error (state: %d)\n", vb2_state);
+		vb2_buffer_done(&src_mb->vb.vb2_buf, vb2_state);
+	}
+
+	if (mfc_get_err(err) == MFC_REG_ERR_UNDEFINED_EXCEPTION)
+		mfc_core_handle_error(core);
+
+	mfc_debug(2, "Assesing whether this context should be run again\n");
+}
+
+static void __mfc_handle_frame_input(struct mfc_core *core,
+				     struct mfc_ctx *ctx,
+				     unsigned int err)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *src_mb;
+	unsigned int index;
+	int deleted = 0;
+	unsigned int consumed;
+
+	if (mfc_get_err(err) == MFC_REG_ERR_NON_PAIRED_FIELD) {
+		/*
+		 * For non-paired field, the same buffer need to be
+		 * resubmitted and the consumed stream will be 0
+		 */
+		mfc_debug(2, "Not paired field. Running again the same buffer\n");
+		return;
+	}
+
+	/* Get the source buffer */
+	consumed = mfc_core_get_consumed_stream();
+	src_mb = mfc_get_del_if_consumed(ctx,
+					 &core_ctx->src_buf_queue,
+					 consumed,
+					 STUFF_BYTE,
+					 err,
+					 &deleted);
+	if (!src_mb) {
+		mfc_err("no src buffers\n");
+		return;
+	}
+
+	index = src_mb->vb.vb2_buf.index;
+	mfc_debug(2, "[BUFINFO] ctx[%d] get src index: %d(%d), addr: 0x%08llx\n",
+		  ctx->num, index, src_mb->src_index, src_mb->addr[0][0]);
+
+	if (!deleted) {
+		/* Run MFC again on the same buffer */
+		mfc_debug(2, "[MULTIFRAME] Running again the same buffer\n");
+
+		dec->consumed += consumed;
+		dec->has_multiframe = 1;
+
+		MFC_TRACE_CORE_CTX("** consumed:%d, remained:%d\n",
+				   dec->consumed, mfc_dec_get_strm_size(ctx, src_mb));
+		/* Do not move src buffer to done_list */
+		return;
+	}
+
+	if (call_bop(ctx, core_recover_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+		mfc_err("failed in core_recover_buf_ctrls\n");
+
+	mfc_clear_mb_flag(src_mb);
+
+	if (mfc_core_get_disp_status() == MFC_REG_DEC_STATUS_DECODING_ONLY &&
+	    mfc_core_get_dec_y_addr() == 0) {
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+		mfc_debug(2, "[STREAM] decoding only but there is no address\n");
+	}
+
+	if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+		mfc_err("failed in core_get_buf_ctrls\n");
+
+	dec->consumed = 0;
+
+	if (ctx->multi_view_enable && ctx->select_view == 0)
+		mfc_set_mb_flag(src_mb, MFC_FLAG_CONSUMED_ONLY);
+
+	vb2_buffer_done(&src_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	mfc_debug(2, "[STREAM] src index: %d(%d), addr: 0x%08llx is buffer done\n",
+		  index, src_mb->src_index, src_mb->addr[0][0]);
+}
+
+/* Handle frame decoding interrupt */
+static void __mfc_handle_frame(struct mfc_core *core,
+			       struct mfc_ctx *ctx,
+			       unsigned int reason,
+			       unsigned int err)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *subcore;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	unsigned int dst_frame_status, sei_avail_frame_pack;
+	unsigned int res_change, need_dpb_change, need_scratch_change;
+	struct mfc_buf *mfc_buf = NULL;
+	bool qos_update = false;
+	int index;
+
+	dst_frame_status = mfc_core_get_disp_status();
+	res_change = mfc_core_get_res_change();
+	need_dpb_change = mfc_core_get_dpb_change();
+	need_scratch_change = mfc_core_get_scratch_change();
+	sei_avail_frame_pack = mfc_core_get_sei_avail_frame_pack();
+
+	if (dec->immediate_display == 1)
+		dst_frame_status = mfc_core_get_dec_status();
+
+	mfc_debug(2, "[FRAME] frame status: %d\n", dst_frame_status);
+	mfc_debug(2, "[FRAME] display status: %d, type: %d, yaddr: %#llx\n",
+		  mfc_core_get_disp_status(),
+		  mfc_core_get_disp_frame_type(),
+		  mfc_core_get_disp_y_addr());
+	mfc_debug(2, "[FRAME] decoded status: %d, type: %d, yaddr: %#llx\n",
+		  mfc_core_get_dec_status(),
+		  mfc_core_get_dec_frame_type(),
+		  mfc_core_get_dec_y_addr());
+
+	mfc_debug(4, "[HDR] SEI available status: 0x%08x\n",
+		  mfc_core_get_sei_avail());
+	mfc_debug(4, "[HDR] SEI content light: 0x%08x\n",
+		  mfc_core_get_sei_content_light());
+	mfc_debug(4, "[HDR] SEI luminance: 0x%08x, 0x%08x white point: 0x%08x\n",
+		  mfc_core_get_sei_mastering0(),
+		  mfc_core_get_sei_mastering1(),
+		  mfc_core_get_sei_mastering2());
+	mfc_debug(4, "[HDR] SEI display primaries: 0x%08x, 0x%08x, 0x%08x\n",
+		  mfc_core_get_sei_mastering3(),
+		  mfc_core_get_sei_mastering4(),
+		  mfc_core_get_sei_mastering5());
+
+	mfc_qos_get_disp_ratio(ctx,
+			       mfc_core_get_decoded_frame_cnt(),
+			       mfc_core_get_display_frame_cnt());
+	qos_update = mfc_qos_mb_calculate(core,
+					  core_ctx, mfc_core_get_processing_cycle(),
+					  mfc_core_get_dec_frame_type());
+
+	if (core_ctx->state == MFCINST_RES_CHANGE_INIT)
+		mfc_change_state(core_ctx, MFCINST_RES_CHANGE_FLUSH);
+
+	if (res_change) {
+		mfc_info("[DRC] Resolution change set to %d\n", res_change);
+		mutex_lock(&ctx->drc_wait_mutex);
+		mfc_change_state(core_ctx, MFCINST_RES_CHANGE_INIT);
+		if (!IS_SINGLE_MODE(ctx)) {
+			ctx->handle_drc_multi_mode = 1;
+			if (!ctx->wait_state) {
+				/* The core that detects DRC must be switched to single */
+				ctx->op_core_type = (core->id == MFC_OP_CORE_FIXED_0) ?
+					MFC_OP_CORE_FIXED_0 : MFC_OP_CORE_FIXED_1;
+				ctx->wait_state = WAIT_G_FMT | WAIT_STOP;
+				mfc_debug(2, "[2CORE][DRC] MFC-%d op_core_type: %d\n",
+					  core->id, ctx->op_core_type);
+			}
+			mfc_debug(2, "[2CORE][DRC] wait_state: %d\n", ctx->wait_state);
+		} else {
+			ctx->handle_drc_multi_mode = 0;
+			ctx->wait_state = WAIT_G_FMT | WAIT_STOP;
+		}
+		mfc_debug(2, "[DRC] Decoding waiting! : %d\n", ctx->wait_state);
+		mutex_unlock(&ctx->drc_wait_mutex);
+		mfc_buf = mfc_get_buf(ctx, &core_ctx->src_buf_queue, MFC_BUF_NO_TOUCH_USED);
+		if (mfc_buf) {
+			index = mfc_buf->vb.vb2_buf.index;
+			call_bop(ctx, core_restore_buf_ctrls, ctx, &ctx->src_ctrls[index]);
+		}
+		return;
+	}
+
+	if (need_dpb_change || need_scratch_change) {
+		mfc_info("[DRC] Interframe resolution changed\n");
+		mutex_lock(&ctx->drc_wait_mutex);
+		ctx->wait_state = WAIT_G_FMT | WAIT_STOP;
+		mfc_core_get_img_size(core, ctx, MFC_GET_RESOL_DPB_SIZE);
+		dec->inter_res_change = 1;
+		mutex_unlock(&ctx->drc_wait_mutex);
+		__mfc_handle_frame_all_extracted(core, ctx);
+		return;
+	}
+
+	if (mfc_is_queue_count_same(&ctx->buf_queue_lock, &core_ctx->src_buf_queue, 0) &&
+	    mfc_is_queue_count_same(&ctx->buf_queue_lock, &ctx->dst_buf_queue, 0)) {
+		mfc_err("Queue count is zero for src and dst\n");
+		goto leave_handle_frame;
+	}
+
+	if (IS_H264_DEC(ctx) && sei_avail_frame_pack &&
+	    dst_frame_status == MFC_REG_DEC_STATUS_DECODING_ONLY) {
+		mfc_debug(2, "Frame packing SEI exists for a frame\n");
+		mfc_debug(2, "Reallocate DPBs and issue init_buffer\n");
+		mutex_lock(&ctx->drc_wait_mutex);
+		ctx->is_dpb_realloc = 1;
+		mfc_change_state(core_ctx, MFCINST_HEAD_PARSED);
+		ctx->capture_state = QUEUE_FREE;
+		ctx->wait_state = WAIT_STOP;
+		mutex_unlock(&ctx->drc_wait_mutex);
+		__mfc_handle_frame_all_extracted(core, ctx);
+		goto leave_handle_frame;
+	}
+
+	/* All frames remaining in the buffer have been extracted  */
+	if (dst_frame_status == MFC_REG_DEC_STATUS_DECODING_EMPTY) {
+		if (core_ctx->state == MFCINST_RES_CHANGE_FLUSH) {
+			mfc_debug(2, "[DRC] Last frame received after resolution change\n");
+			__mfc_handle_frame_all_extracted(core, ctx);
+
+			/* In the case of 2core DRC, state must be changed at subcore deinit. */
+			if (ctx->handle_drc_multi_mode)
+				mfc_change_state(core_ctx, MFCINST_RES_CHANGE_FLUSH_FINISHED);
+			else
+				mfc_change_state(core_ctx, MFCINST_RES_CHANGE_END);
+
+			if (IS_MULTI_CORE_DEVICE(dev))
+				mfc_rm_load_balancing(ctx, MFC_RM_LOAD_DELETE);
+
+			mfc_rate_reset_ts_list(&ctx->src_ts);
+			mfc_rate_reset_last_framerate(ctx);
+			mfc_rate_reset_bufq_framerate(ctx);
+			mfc_rate_set_framerate(ctx, DEC_DEFAULT_FPS);
+			mfc_qos_on(core, ctx);
+
+			goto leave_handle_frame;
+		} else {
+			mfc_buf = __mfc_handle_last_frame(core, ctx);
+		}
+	}
+
+	/* Detection for QoS weight */
+	if (!dec->num_of_tile_over_4 &&
+	    mfc_core_get_num_of_tile() >= 4) {
+		dec->num_of_tile_over_4 = 1;
+		qos_update = true;
+	}
+
+	if (qos_update) {
+		mfc_qos_on(core, ctx);
+		if (IS_TWO_MODE1(ctx)) {
+			subcore = mfc_get_sub_core(dev, ctx);
+			if (subcore) {
+				subcore->core_ctx[ctx->num]->dynamic_weight_level =
+					core_ctx->dynamic_weight_level;
+				mfc_qos_on(subcore, ctx);
+			}
+		}
+	}
+
+	/* copy decoded timestamp */
+	if (mfc_dec_status_decoding(dst_frame_status))
+		__mfc_handle_frame_copy_timestamp(core_ctx, mfc_core_get_dec_y_addr());
+
+	/* Mark source buffer as complete */
+	if (dst_frame_status != MFC_REG_DEC_STATUS_DISPLAY_ONLY)
+		__mfc_handle_frame_input(core, ctx, err);
+
+	/* A frame has been decoded and is in the buffer  */
+	if (mfc_dec_status_display(dst_frame_status)) {
+		ctx->select_view_irq = mfc_core_get_mvc_view_id_disp_order() % MFC_NUM_MULTI_VIEW;
+		mfc_buf = __mfc_handle_frame_output(core, ctx, err);
+	} else {
+		ctx->select_view_irq = mfc_core_get_mvc_view_id_dec_order() % MFC_NUM_MULTI_VIEW;
+	}
+
+	/* arrangement of assigned dpb table */
+	__mfc_handle_released_buf(core, ctx);
+
+	/* dequeue unused DPB */
+	__mfc_handle_frame_unused_output(core, ctx);
+
+	/* There is display buffer for user, update reference information */
+	__mfc_handle_ref_info(ctx, mfc_buf, err);
+
+	mfc_rate_update_bufq_framerate(ctx, MFC_TS_DST_DQ);
+
+	if (dst_frame_status == MFC_REG_DEC_STATUS_DECODING_EMPTY) {
+		mfc_handle_force_change_status(core->core_ctx[ctx->num]);
+		mfc_debug(2, "It can be continue decoding again\n");
+	}
+
+	/* The first frame is only for decoding,
+	 * so the select_view should only be increased at display interrupt.
+	 */
+	if (ctx->multi_view_enable && mfc_core_get_dec_y_addr())
+		ctx->select_view = (ctx->select_view + 1) % MFC_NUM_MULTI_VIEW;
+
+leave_handle_frame:
+	mfc_debug(2, "Assesing whether this context should be run again\n");
+}
+
+static inline void __mfc_handle_done_frame(struct mfc_core *core,
+					   struct mfc_ctx *ctx,
+					   unsigned int reason,
+					   unsigned int err)
+{
+	__mfc_handle_frame(core, ctx, reason, err);
+}
+
+/* Handle header decoder interrupt */
+static int __mfc_handle_seq_dec(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *src_mb;
+	int i, is_interlace;
+	unsigned int strm_size, consumed;
+
+	if (ctx->src_fmt->fourcc != V4L2_PIX_FMT_FIMV1) {
+		ctx->img_width = mfc_core_get_img_width();
+		ctx->img_height = mfc_core_get_img_height();
+		ctx->crop_width = ctx->img_width;
+		ctx->crop_height = ctx->img_height;
+		mfc_info("[STREAM] resolution w: %d, h: %d\n", ctx->img_width, ctx->img_height);
+	}
+
+	ctx->dpb_count = mfc_core_get_dpb_count();
+	mfc_ctx_debug(2, "dpb_count: %d\n", ctx->dpb_count);
+
+	ctx->scratch_buf_size = mfc_core_get_scratch_size();
+
+	mfc_core_dec_get_crop_info(core, ctx);
+	dec->mv_count = mfc_core_get_mv_count();
+
+	if (ctx->img_width == 0 || ctx->img_height == 0) {
+		mfc_err("[STREAM] wrong resolution w: %d, h: %d\n",
+			ctx->img_width, ctx->img_height);
+	} else {
+		is_interlace = mfc_core_is_interlace_picture();
+		dec->is_mbaff = mfc_core_is_mbaff_picture();
+		if (is_interlace || dec->is_mbaff)
+			dec->is_interlaced = 1;
+		mfc_debug(2, "[INTERLACE] interlace: %d, mbaff: %d\n",
+			  is_interlace, dec->is_mbaff);
+	}
+
+	for (i = 0; i < ctx->dst_fmt->num_planes; i++) {
+		ctx->min_dpb_size[i] = mfc_core_get_min_dpb_size(i);
+		mfc_debug(2, "[FRAME] min_dpb_size[%d]: %d, min_dpb_size_2bits[%d]: %d\n",
+			  i, ctx->min_dpb_size[i], i, ctx->min_dpb_size_2bits[i]);
+	}
+
+	if (IS_MULTI_CORE_DEVICE(dev) && mfc_core_get_two_core_mode()) {
+		if (dev->debugfs.feature_option & MFC_OPTION_MULTI_CORE_DISABLE) {
+			mfc_info("[2CORE] op_mode: %d stream, but multi core disable\n",
+				 mfc_core_get_two_core_mode());
+		} else {
+			if (dev->num_inst > 1)
+				mfc_debug(2, "[2CORE] multi core bits: %#lx, num inst: %d\n",
+					  dev->multi_core_inst_bits, dev->num_inst);
+			ctx->stream_op_mode = mfc_core_get_two_core_mode();
+			mfc_info("[2CORE] This stream need to multi core stream_op_mode(%d)\n",
+				 ctx->stream_op_mode);
+		}
+	}
+
+	src_mb = mfc_get_buf
+		(ctx, &core_ctx->src_buf_queue,	MFC_BUF_NO_TOUCH_USED);
+	if (src_mb) {
+		consumed = mfc_core_get_consumed_stream();
+		strm_size = mfc_dec_get_strm_size(ctx, src_mb);
+		mfc_debug(2, "[STREAM] header size, %d, %#x, consumed, %d, %#x\n",
+			  strm_size, strm_size, consumed, consumed);
+		if ((IS_H264_DEC(ctx)) &&
+		    (consumed > 0 && strm_size > consumed)) {
+			dec->consumed += consumed;
+			mfc_debug(2, "[STREAM] there is remained bytes(%d) after header parsing\n",
+				  (strm_size - consumed));
+		} else {
+			dec->consumed = 0;
+		}
+	}
+
+	dec->frame_display_delay = mfc_core_get_display_delay();
+	mfc_debug(2, "[FRAME] display delay for first frame %d\n",
+		  dec->frame_display_delay);
+
+	mfc_change_state(core_ctx, MFCINST_HEAD_PARSED);
+
+	return 0;
+}
+
+static inline void __mfc_handle_nal_abort(struct mfc_core *core,
+					  struct mfc_ctx *ctx,
+					  unsigned int reason)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	mfc_change_state(core_ctx, MFCINST_ABORT);
+}
+
 irqreturn_t mfc_core_top_half_irq(int irq, void *priv)
 {
 	struct mfc_core *core = priv;
 	struct mfc_core_ctx *core_ctx;
+	struct mfc_ctx *ctx;
 	unsigned int err;
 	unsigned int reason;
 
@@ -48,12 +1285,21 @@ irqreturn_t mfc_core_top_half_irq(int irq, void *priv)
 		return IRQ_WAKE_THREAD;
 	}
 
+	ctx = core_ctx->ctx;
 	reason = mfc_core_get_int_reason();
 	err = mfc_core_get_int_err();
 
 	core->last_int = reason;
 	core->last_int_time = ktime_to_timespec64(ktime_get());
 
+	if (reason == MFC_REG_R2H_CMD_SEQ_DONE_RET ||
+	    reason == MFC_REG_R2H_CMD_INIT_BUFFERS_RET ||
+	    reason == MFC_REG_R2H_CMD_FRAME_DONE_RET) {
+		ctx->frame_cnt++;
+		/* counting QoS table portion */
+		mfc_qos_set_portion(core, ctx);
+	}
+
 	mfc_debug(2, "[c:%d] Int reason: %d (err: %d, warn: %d)\n",
 		  core->curr_core_ctx, reason, mfc_get_err(err), mfc_get_warn(err));
 	MFC_TRACE_CORE_CTX("<< INT(top): %d\n", reason);
@@ -78,6 +1324,83 @@ static int __mfc_irq_dev(struct mfc_core *core, unsigned int reason, unsigned in
 	return 1;
 }
 
+static int __mfc_irq_ctx(struct mfc_core *core,
+			 struct mfc_ctx *ctx,
+			 unsigned int reason,
+			 unsigned int err)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	if ((core->dev->debugfs.feature_option & MFC_OPTION_MSR_ENABLE) &&
+	    ctx->frame_cnt == 20) {
+		reason = 0;
+		mfc_debug(2, "[MSR] Forced entry into MSR mode, it will be recovery\n");
+		core->dev->debugfs.feature_option &= ~MFC_OPTION_MSR_ENABLE;
+	}
+
+	switch (reason) {
+	case MFC_REG_R2H_CMD_ERR_RET:
+		/* An error has occurred */
+		if (core_ctx->state == MFCINST_RUNNING || core_ctx->state == MFCINST_ABORT) {
+			if (mfc_get_err(err) >= MFC_REG_ERR_FRAME_CONCEAL &&
+			    mfc_get_err(err) <= MFC_REG_ERR_WARNINGS_END)
+				__mfc_handle_frame(core, ctx, reason, err);
+			else
+				__mfc_handle_frame_error(core, ctx, reason, err);
+		} else {
+			__mfc_handle_error(core, ctx, reason, err);
+		}
+		break;
+	case MFC_REG_R2H_CMD_SLICE_DONE_RET:
+	case MFC_REG_R2H_CMD_FIELD_DONE_RET:
+	case MFC_REG_R2H_CMD_FRAME_DONE_RET:
+	case MFC_REG_R2H_CMD_COMPLETE_SEQ_RET:
+			__mfc_handle_done_frame(core, ctx, reason, err);
+		break;
+	case MFC_REG_R2H_CMD_SEQ_DONE_RET:
+		if (ctx->type == MFCINST_DECODER)
+			__mfc_handle_seq_dec(core, ctx);
+		break;
+	case MFC_REG_R2H_CMD_OPEN_INSTANCE_RET:
+		core_ctx->inst_no = mfc_core_get_inst_no();
+		mfc_change_state(core_ctx, MFCINST_GOT_INST);
+		break;
+	case MFC_REG_R2H_CMD_CLOSE_INSTANCE_RET:
+		mfc_change_state(core_ctx, MFCINST_FREE);
+		break;
+	case MFC_REG_R2H_CMD_NAL_ABORT_RET:
+		__mfc_handle_nal_abort(core, ctx, reason);
+		break;
+	case MFC_REG_R2H_CMD_DPB_FLUSH_RET:
+		ctx->select_view = MFC_VIEW_ID_MAIN;
+		mfc_change_state(core_ctx, MFCINST_ABORT);
+		break;
+	case MFC_REG_R2H_CMD_INIT_BUFFERS_RET:
+		if (err != 0) {
+			mfc_err("INIT_BUFFERS_RET error: %d\n", err);
+			break;
+		}
+
+		if (IS_MULTI_MODE(ctx))
+			mfc_change_state(core_ctx, MFCINST_BUF_INIT_BUT_MULTI_MODE_NOT_CHECKED_YET);
+		else
+			mfc_change_state(core_ctx, MFCINST_RUNNING);
+
+		if (ctx->type == MFCINST_DECODER) {
+			if (ctx->is_dpb_realloc)
+				ctx->is_dpb_realloc = 0;
+		}
+		break;
+	case MFC_REG_R2H_CMD_MOVE_INSTANCE_RET:
+		break;
+	default:
+		mfc_err("Unknown int reason: %d(%#x)\n", reason, reason);
+		mfc_core_handle_error(core);
+	}
+
+	return 1;
+}
+
 /* Interrupt processing */
 irqreturn_t mfc_core_irq(int irq, void *priv)
 {
@@ -116,7 +1439,35 @@ irqreturn_t mfc_core_irq(int irq, void *priv)
 	ret = __mfc_irq_dev(core, reason, err);
 	if (!ret)
 		goto irq_end;
-	mfc_ctx_info("not implemented context irq ctx");
+
+	core_ctx = core->core_ctx[core->curr_core_ctx];
+	if (!core_ctx) {
+		mfc_core_err("no mfc context to run\n");
+		mfc_core_clear_int();
+		mfc_core_pm_clock_off(core, 1);
+		goto irq_end;
+	}
+	ctx = core_ctx->ctx;
+
+	ret = mfc_get_core_intlock(core_ctx);
+	if (ret) {
+		mfc_core_clear_int_only();
+		goto irq_end;
+	}
+
+	ret = __mfc_irq_ctx(core, ctx, reason, err);
+	if (!ret)
+		goto irq_end;
+
+	/* clean-up interrupt */
+	mfc_core_clear_int();
+
+	mfc_release_core_intlock(core_ctx);
+
+	if (!(core_ctx->state == MFCINST_RES_CHANGE_INIT && IS_SINGLE_MODE(ctx)))
+		core->sched->dequeue_work(core, core_ctx);
+
+	mfc_core_hwlock_handler_irq(core, ctx, reason, err);
 
 irq_end:
 	mfc_core_debug_leave();
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
index 046b20e6d4c2..16902b1537c6 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
@@ -19,4 +19,7 @@
 
 irqreturn_t mfc_core_top_half_irq(int irq, void *priv);
 irqreturn_t mfc_core_irq(int irq, void *priv);
+
+void mfc_core_handle_error(struct mfc_core *core);
+
 #endif /* __MFC_CORE_ISR_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
index fd7ebe95e715..118108f910e2 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
@@ -17,8 +17,10 @@
 #include "mfc_core_cmd.h"
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_queue.h"
 #include "base/mfc_utils.h"
 #include "base/mfc_mem.h"
+#include "base/mfc_qos.h"
 
 void mfc_core_run_cache_flush(struct mfc_core *core,
 			      enum mfc_do_cache_flush do_cache_flush,
@@ -263,3 +265,146 @@ int mfc_core_run_wakeup(struct mfc_core *core)
 
 	return ret;
 }
+
+int mfc_core_run_dec_init(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *src_mb;
+	unsigned int strm_size;
+
+	/* Initializing decoding - parsing header */
+
+	/* Get the next source buffer */
+	src_mb = mfc_get_buf(ctx, &core_ctx->src_buf_queue, MFC_BUF_SET_USED);
+	if (!src_mb) {
+		mfc_err("no src buffers\n");
+		return -EAGAIN;
+	}
+
+	strm_size = mfc_dec_get_strm_size(ctx, src_mb);
+	mfc_debug(2, "Preparing to init decoding\n");
+	mfc_debug(2, "[STREAM] Header size: %d, (offset: %u, consumed: %u)\n",
+		  strm_size,
+		  src_mb->vb.vb2_buf.planes[0].data_offset,
+		  dec->consumed);
+
+	mfc_core_set_dec_stream_buffer(core, ctx, src_mb,
+				       mfc_dec_get_strm_offset(ctx, src_mb), strm_size);
+
+	mfc_debug(2, "[BUFINFO] Header addr: 0x%08llx\n", src_mb->addr[0][0]);
+	mfc_clean_core_ctx_int_flags(core->core_ctx[ctx->num]);
+	mfc_core_cmd_dec_seq_header(core, ctx);
+
+	return 0;
+}
+
+static int __mfc_check_last_frame(struct mfc_core_ctx *core_ctx,
+				  struct mfc_buf *mfc_buf)
+{
+	if (mfc_check_mb_flag(mfc_buf, MFC_FLAG_LAST_FRAME)) {
+		mfc_debug(2, "Setting core_ctx->state to FINISHING\n");
+		mfc_change_state(core_ctx, MFCINST_FINISHING);
+		return 1;
+	}
+
+	return 0;
+}
+
+int mfc_core_run_dec_frame(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_buf *src_mb, *dst_mb;
+	int last_frame = 0;
+	unsigned int index, src_index;
+	int ret;
+
+	/* Get the next source buffer */
+	if (IS_TWO_MODE2(ctx)) {
+		src_mb = mfc_get_buf_no_used(ctx, &core_ctx->src_buf_queue,
+					     MFC_BUF_SET_USED);
+		if (!src_mb) {
+			mfc_debug(2, "no src buffers\n");
+			return -EAGAIN;
+		}
+	} else {
+		src_mb = mfc_get_buf(ctx, &core_ctx->src_buf_queue,
+				     MFC_BUF_SET_USED);
+		if (!src_mb) {
+			mfc_debug(2, "no src buffers\n");
+			return -EAGAIN;
+		}
+	}
+
+	/* Try to use the non-referenced DPB on dst-queue */
+	if (dec->is_dynamic_dpb) {
+		dst_mb = mfc_search_for_dpb(core_ctx);
+		if (!dst_mb) {
+			src_mb->used = MFC_BUF_RESET_USED;
+			mfc_debug(2, "[DPB] couldn't find dst buffers\n");
+			return -EAGAIN;
+		}
+	}
+
+	index = src_mb->vb.vb2_buf.index;
+	src_index = src_mb->src_index;
+
+	if (mfc_check_mb_flag(src_mb, MFC_FLAG_EMPTY_DATA))
+		src_mb->vb.vb2_buf.planes[0].bytesused = 0;
+
+	mfc_core_set_dec_stream_buffer(core, ctx, src_mb,
+				       mfc_dec_get_strm_offset(ctx, src_mb),
+				       mfc_dec_get_strm_size(ctx, src_mb));
+
+	if (call_bop(ctx, core_set_buf_ctrls, core, ctx, &ctx->src_ctrls[index]) < 0)
+		mfc_err("failed in core_set_buf_ctrls\n");
+	mfc_core_update_tag(core, ctx, ctx->stored_tag);
+
+	if (dec->is_dynamic_dpb)
+		mfc_core_set_dynamic_dpb(core, ctx, dst_mb);
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+
+	last_frame = __mfc_check_last_frame(core_ctx, src_mb);
+	ret = mfc_core_cmd_dec_one_frame(core, ctx, last_frame, src_index);
+
+	return ret;
+}
+
+int mfc_core_run_dec_last_frames(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *dst_mb;
+	unsigned int src_index;
+
+	if (mfc_is_queue_count_same(&ctx->buf_queue_lock, &ctx->dst_buf_queue, 0)) {
+		mfc_debug(2, "no dst buffer\n");
+		return -EAGAIN;
+	}
+
+	/* Try to use the non-referenced DPB on dst-queue */
+	if (dec->is_dynamic_dpb) {
+		dst_mb = mfc_search_for_dpb(core_ctx);
+		if (!dst_mb) {
+			mfc_debug(2, "[DPB] couldn't find dst buffers\n");
+			return -EAGAIN;
+		}
+	}
+
+	/* Get the next source buffer */
+	mfc_get_buf(ctx, &core_ctx->src_buf_queue, MFC_BUF_SET_USED);
+
+	/* Frames are being decoded */
+	mfc_core_set_dec_stream_buffer(core, ctx, 0, 0, 0);
+	src_index = ctx->curr_src_index + 1;
+
+	if (dec->is_dynamic_dpb)
+		mfc_core_set_dynamic_dpb(core, ctx, dst_mb);
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	mfc_core_cmd_dec_one_frame(core, ctx, 1, src_index);
+
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
index 3d243dc18e15..6b9c9ef91e47 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
@@ -23,4 +23,8 @@ void mfc_core_run_deinit_hw(struct mfc_core *core);
 
 int mfc_core_run_sleep(struct mfc_core *core);
 int mfc_core_run_wakeup(struct mfc_core *core);
+
+int mfc_core_run_dec_init(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_run_dec_frame(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_run_dec_last_frames(struct mfc_core *core, struct mfc_ctx *ctx);
 #endif /* __MFC_CORE_RUN_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
index 0a805464fbc9..a7db47e58589 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
@@ -332,6 +332,7 @@ static int __mfc_rm_move_core_running(struct mfc_ctx *ctx, int to_core_num, int
 	from_core->core_ctx[core_ctx->num] = 0;
 	mfc_core_pm_clock_off(to_core, 0);
 
+	mfc_core_move_hwlock_ctx(to_core, from_core, core_ctx);
 	mfc_core_release_hwlock_dev(subcore);
 	mfc_core_release_hwlock_dev(maincore);
 
-- 
2.34.1

