Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A1BAB777
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1D10E283;
	Tue, 30 Sep 2025 05:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Q4w8qIys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Tue, 30 Sep 2025 04:03:03 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B910E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:03 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035549epoutp0162ad38314e170859b1150e3060e48e2f~p8zek7tyd3089430894epoutp01z
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035549epoutp0162ad38314e170859b1150e3060e48e2f~p8zek7tyd3089430894epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204549;
 bh=bpej8MLmB7L59W41wU3Kn4I7jm3vAl8REcpYHgaZwlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q4w8qIysQII7bGxHMSKxu3kYUJ1GUz760JFxTAnIHEYHAPBWWW1GCIp/t7/vkaKW5
 m9JDlWAb1zrC3KXn0OnizmR6jyulfSsKtcNc/LousdQJGANDQVbuZNgEk2EJ0m/f6r
 BmC1du3BIQS75I7V0GmRNtkrDeSzWmssO30dSsHE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035548epcas5p46dfa08c01a201a23c2633d63bc46e30b~p8zdg597R2781827818epcas5p4g;
 Tue, 30 Sep 2025 03:55:48 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cbPNg4gsQz3hhT3; Tue, 30 Sep
 2025 03:55:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035547epcas5p11f579ca8f8a83767cbb2b632fa9cd6f7~p8zcEEX2V2443624436epcas5p1o;
 Tue, 30 Sep 2025 03:55:47 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035540epsmtip1f725bce14fa9813bc4427b5983b76b6e~p8zWFMOT52908429084epsmtip1o;
 Tue, 30 Sep 2025 03:55:40 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 07/29] media: mfc: Add MFC core command, hwlock, ISR and run
 functionalities
Date: Tue, 30 Sep 2025 09:33:26 +0530
Message-Id: <20250930040348.3702923-8-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035547epcas5p11f579ca8f8a83767cbb2b632fa9cd6f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035547epcas5p11f579ca8f8a83767cbb2b632fa9cd6f7
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035547epcas5p11f579ca8f8a83767cbb2b632fa9cd6f7@epcas5p1.samsung.com>
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

Introduce functions that define the core command interface, hardware‑lock
management, interrupt handling, and run‑time control for the MFC driver.

mfc_core_cmd.h
API for core initialization, power management,
instance lifecycle (open/close/abort) and cache flushing.

mfc_core_hwlock.h
APIs for initializing, acquiring and releasing hardware locks
for both device and context structures.

mfc_core_isr.h
ISR prototypes for top‑half and threaded interrupt handling.

mfc_core_run.h
Functions for cache flush, hardware initialization,
de‑initialization, and power state transitions (sleep/wakeup).

All files reference the common core structures via base/mfc_common.h.
This patch prepares the interface layer for upcoming implementation
changes in the MFC driver.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/mfc_core_cmd.c         | 158 ++++++++
 .../samsung/exynos-mfc/mfc_core_cmd.h         |  26 ++
 .../samsung/exynos-mfc/mfc_core_hwlock.c      | 336 ++++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_hwlock.h      |  72 ++++
 .../samsung/exynos-mfc/mfc_core_intlock.c     |  98 +++++
 .../samsung/exynos-mfc/mfc_core_intlock.h     |  20 ++
 .../samsung/exynos-mfc/mfc_core_isr.c         | 124 +++++++
 .../samsung/exynos-mfc/mfc_core_isr.h         |  22 ++
 .../samsung/exynos-mfc/mfc_core_run.c         | 265 ++++++++++++++
 .../samsung/exynos-mfc/mfc_core_run.h         |  26 ++
 10 files changed, 1147 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
new file mode 100644
index 000000000000..5be9fd086a93
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_cmd.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_cmd.h"
+#include "mfc_core_intlock.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+
+void mfc_core_cmd_sys_init(struct mfc_core *core,
+			   enum mfc_buf_usage_type buf_type)
+{
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx_buf_size *buf_size;
+	struct mfc_special_buf *ctx_buf;
+
+	mfc_core_debug_enter();
+
+	mfc_core_clean_dev_int_flags(core);
+
+	buf_size = dev->variant->buf_size->ctx_buf;
+	ctx_buf = &core->common_ctx_buf;
+	MFC_CORE_WRITEL(ctx_buf->daddr, MFC_REG_CONTEXT_MEM_ADDR);
+	MFC_CORE_WRITEL(buf_size->dev_ctx, MFC_REG_CONTEXT_MEM_SIZE);
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_SYS_INIT);
+
+	mfc_core_debug_leave();
+}
+
+void mfc_core_cmd_sleep(struct mfc_core *core)
+{
+	mfc_core_debug_enter();
+
+	mfc_core_clean_dev_int_flags(core);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_SLEEP);
+
+	mfc_core_debug_leave();
+}
+
+void mfc_core_cmd_wakeup(struct mfc_core *core)
+{
+	mfc_core_debug_enter();
+
+	mfc_core_clean_dev_int_flags(core);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_WAKEUP);
+
+	mfc_core_debug_leave();
+}
+
+/* Open a new instance and get its number */
+void mfc_core_cmd_open_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	unsigned int reg;
+
+	mfc_debug_enter();
+
+	/* Preparing decoding - getting instance number */
+	mfc_debug(2, "Getting instance number\n");
+	mfc_clean_core_ctx_int_flags(core_ctx);
+
+	reg = MFC_CORE_READL(MFC_REG_CODEC_CONTROL);
+	/* Clear OTF_CONTROL[2:1] & OTF_DEBUG[3] */
+	reg &= ~(0x7 << 1);
+
+	MFC_CORE_WRITEL(reg, MFC_REG_CODEC_CONTROL);
+
+	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
+	reg = ctx->codec_mode & MFC_REG_CODEC_TYPE_MASK;
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->mem_clear)) {
+		reg |= BIT(MFC_REG_CLEAR_CTX_MEM_SHIFT);
+		mfc_debug(2, "Enable to clear context memory: %#x\n", reg);
+	}
+	MFC_CORE_WRITEL(reg, MFC_REG_CODEC_TYPE);
+
+	MFC_CORE_WRITEL(core_ctx->instance_ctx_buf.daddr, MFC_REG_CONTEXT_MEM_ADDR);
+	MFC_CORE_WRITEL(core_ctx->instance_ctx_buf.size, MFC_REG_CONTEXT_MEM_SIZE);
+
+	if (dev->debugfs.feature_option & MFC_OPTION_SET_MULTI_CORE_FORCE) {
+		reg = MFC_CORE_READL(MFC_REG_DBG_INFO_ENABLE);
+		reg |= BIT(MFC_REG_DBG_INFO_TWO_MFC_FORCING_SHIFT);
+		MFC_CORE_WRITEL(reg, MFC_REG_DBG_INFO_ENABLE);
+		mfc_info("[2CORE] Forcely enable multi core mode %#x\n",
+			 MFC_CORE_READL(MFC_REG_DBG_INFO_ENABLE));
+	}
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_OPEN_INSTANCE);
+
+	mfc_debug_leave();
+}
+
+/* Close instance */
+int mfc_core_cmd_close_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	mfc_debug_enter();
+
+	/* Closing decoding instance  */
+	mfc_debug(2, "Returning instance number\n");
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	if (core_ctx->state == MFCINST_FREE) {
+		mfc_err("ctx already free status\n");
+		return -EINVAL;
+	}
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_CLOSE_INSTANCE);
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
+void mfc_core_cmd_abort_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+
+	MFC_CORE_WRITEL(core_ctx->inst_no, MFC_REG_INSTANCE_ID);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_NAL_ABORT);
+}
+
+void mfc_core_cmd_cache_flush(struct mfc_core *core)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[core->curr_core_ctx];
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	u32 reg = 0;
+
+	mutex_lock(&ctx->op_mode_mutex);
+
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
+	mfc_core_clean_dev_int_flags(core);
+	mfc_core_cmd_host2risc(core, MFC_REG_H2R_CMD_CACHE_FLUSH);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
new file mode 100644
index 000000000000..86b82d63f3b5
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_cmd.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_CMD_H
+#define __MFC_CORE_CMD_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_core_cmd_sys_init(struct mfc_core *core,
+			   enum mfc_buf_usage_type buf_type);
+void mfc_core_cmd_sleep(struct mfc_core *core);
+void mfc_core_cmd_wakeup(struct mfc_core *core);
+
+void mfc_core_cmd_open_inst(struct mfc_core *core, struct mfc_ctx *ctx);
+int mfc_core_cmd_close_inst(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_core_cmd_abort_inst(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_core_cmd_cache_flush(struct mfc_core *core);
+#endif /* __MFC_CORE_CMD_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
new file mode 100644
index 000000000000..4de836543e82
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ *  mfc_core_hwlock.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_rm.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_run.h"
+#include "mfc_core_pm.h"
+#include "mfc_core_sync.h"
+
+#include "mfc_core_cmd.h"
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_utils.h"
+#include "base/mfc_sched.h"
+
+static inline void __mfc_print_hwlock(struct mfc_core *core)
+{
+	mfc_core_debug(3, "%s%lx, %sx%lx, %s %d, %s %d, %s %d\n",
+		       "hwlock.dev = 0x", core->hwlock.dev,
+		       "bits = 0x", core->hwlock.bits,
+		       "owned_by_irq =", core->hwlock.owned_by_irq,
+		       "wl_count =", core->hwlock.wl_count,
+		       "transfer_owner =", core->hwlock.transfer_owner);
+}
+
+void mfc_core_init_hwlock(struct mfc_core *core)
+{
+	unsigned long flags;
+
+	spin_lock_init(&core->hwlock.lock);
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+
+	INIT_LIST_HEAD(&core->hwlock.waiting_list);
+	core->hwlock.wl_count = 0;
+	core->hwlock.bits = 0;
+	core->hwlock.dev = 0;
+	core->hwlock.owned_by_irq = 0;
+	core->hwlock.transfer_owner = 0;
+
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+}
+
+static void __mfc_remove_listable_wq_core(struct mfc_core *core)
+{
+	struct mfc_listable_wq *listable_wq;
+	unsigned long flags;
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	list_for_each_entry(listable_wq, &core->hwlock.waiting_list, list) {
+		if (!listable_wq->core)
+			continue;
+
+		mfc_core_debug(2, "Found dev and will delete it!\n");
+
+		list_del(&listable_wq->list);
+		core->hwlock.wl_count--;
+
+		break;
+	}
+
+	__mfc_print_hwlock(core);
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+}
+
+static void __mfc_remove_listable_wq_ctx(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_listable_wq *listable_wq;
+	unsigned long flags;
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	list_for_each_entry(listable_wq, &core->hwlock.waiting_list, list) {
+		if (!listable_wq->core_ctx)
+			continue;
+
+		if (listable_wq->core_ctx->num == core_ctx->num) {
+			mfc_debug(2, "Found ctx and will delete it (%d)!\n", core_ctx->num);
+
+			list_del(&listable_wq->list);
+			core->hwlock.wl_count--;
+			break;
+		}
+	}
+
+	__mfc_print_hwlock(core);
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+}
+
+/*
+ * Return value description
+ *    0: succeeded to get hwlock
+ * -EIO: failed to get hwlock (time out)
+ */
+int mfc_core_get_hwlock_dev(struct mfc_core *core)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_info("[MSR] Couldn't lock HW. It's Error state\n");
+		return 0;
+	}
+
+	if (core->shutdown) {
+		mfc_core_info("Couldn't lock HW. Shutdown was called\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&core->hwlock_wq.wait_mutex);
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	if (core->hwlock.bits != 0 || core->hwlock.dev != 0) {
+		list_add_tail(&core->hwlock_wq.list, &core->hwlock.waiting_list);
+		core->hwlock.wl_count++;
+
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+		mfc_core_debug(2, "Waiting for hwlock to be released\n");
+
+		ret = wait_event_timeout
+			(core->hwlock_wq.wait_queue,
+			 (core->hwlock.transfer_owner == 1 &&
+			  (core->hwlock.dev == 1)),
+			 msecs_to_jiffies(MFC_HWLOCK_TIMEOUT));
+
+		core->hwlock.transfer_owner = 0;
+		__mfc_remove_listable_wq_core(core);
+		if (!ret) {
+			mfc_core_err("Woken up but timed out\n");
+			__mfc_print_hwlock(core);
+			mutex_unlock(&core->hwlock_wq.wait_mutex);
+			return -EIO;
+		}
+		mfc_core_debug(2, "Woken up and got hwlock\n");
+		__mfc_print_hwlock(core);
+		mutex_unlock(&core->hwlock_wq.wait_mutex);
+	} else {
+		core->hwlock.bits = 0;
+		core->hwlock.dev = 1;
+		core->hwlock.owned_by_irq = 0;
+
+		__mfc_print_hwlock(core);
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+		mutex_unlock(&core->hwlock_wq.wait_mutex);
+	}
+
+	return 0;
+}
+
+/*
+ * Return value description
+ *    0: succeeded to get hwlock
+ * -EIO: failed to get hwlock (time out)
+ */
+int mfc_core_get_hwlock_ctx(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	int ret = 0;
+	unsigned long flags;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_info("[MSR] Couldn't lock HW. It's Error state\n");
+		return 0;
+	}
+
+	if (core->shutdown) {
+		mfc_info("Couldn't lock HW. Shutdown was called\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&core_ctx->hwlock_wq.wait_mutex);
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	if (core->hwlock.bits != 0 || core->hwlock.dev != 0) {
+		list_add_tail(&core_ctx->hwlock_wq.list, &core->hwlock.waiting_list);
+		core->hwlock.wl_count++;
+
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+
+		mfc_debug(2, "core_ctx[%d] Waiting for hwlock to be released\n",
+			  core_ctx->num);
+
+		ret = wait_event_timeout
+			(core_ctx->hwlock_wq.wait_queue,
+			 (core->hwlock.transfer_owner == 1 &&
+			  test_bit(core_ctx->num, &core->hwlock.bits)),
+			 msecs_to_jiffies(MFC_HWLOCK_TIMEOUT));
+
+		core->hwlock.transfer_owner = 0;
+		__mfc_remove_listable_wq_ctx(core_ctx);
+		if (!ret) {
+			mfc_err("Woken up but timed out\n");
+			__mfc_print_hwlock(core);
+			mutex_unlock(&core_ctx->hwlock_wq.wait_mutex);
+			return -EIO;
+		}
+		mfc_debug(2, "Woken up and got hwlock\n");
+		__mfc_print_hwlock(core);
+		mutex_unlock(&core_ctx->hwlock_wq.wait_mutex);
+	} else {
+		core->hwlock.bits = 0;
+		core->hwlock.dev = 0;
+		set_bit(core_ctx->num, &core->hwlock.bits);
+		core->hwlock.owned_by_irq = 0;
+
+		__mfc_print_hwlock(core);
+		spin_unlock_irqrestore(&core->hwlock.lock, flags);
+		mutex_unlock(&core_ctx->hwlock_wq.wait_mutex);
+	}
+	return 0;
+}
+
+static void __mfc_release_hwlock(struct mfc_core *core)
+{
+	struct mfc_listable_wq *listable_wq;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_debug(2, "[MSR] Couldn't wakeup module. It's Error state\n");
+	} else if (core->shutdown) {
+		mfc_core_debug(2, "Couldn't wakeup module. Shutdown was called\n");
+	} else if (list_empty(&core->hwlock.waiting_list)) {
+		mfc_core_debug(2, "No waiting module\n");
+	} else {
+		mfc_core_debug(2, "There is a waiting module\n");
+		listable_wq = list_entry(core->hwlock.waiting_list.next,
+					 struct mfc_listable_wq, list);
+		list_del(&listable_wq->list);
+		core->hwlock.wl_count--;
+
+		if (listable_wq->core) {
+			mfc_core_debug(2, "Waking up core\n");
+			core->hwlock.dev = 1;
+		} else {
+			mfc_core_debug(2, "Waking up another ctx\n");
+			set_bit(listable_wq->core_ctx->num, &core->hwlock.bits);
+		}
+
+		core->hwlock.transfer_owner = 1;
+
+		wake_up(&listable_wq->wait_queue);
+	}
+
+	__mfc_print_hwlock(core);
+}
+
+void mfc_core_release_hwlock_dev(struct mfc_core *core)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	core->hwlock.dev = 0;
+	core->hwlock.owned_by_irq = 0;
+
+	__mfc_release_hwlock(core);
+
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+}
+
+void mfc_core_release_hwlock_ctx(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	unsigned long flags;
+
+	spin_lock_irqsave(&core->hwlock.lock, flags);
+	__mfc_print_hwlock(core);
+
+	clear_bit(core_ctx->num, &core->hwlock.bits);
+	core->hwlock.owned_by_irq = 0;
+
+	__mfc_release_hwlock(core);
+
+	spin_unlock_irqrestore(&core->hwlock.lock, flags);
+}
+
+/* Run an operation on hardware */
+int mfc_core_just_run(struct mfc_core *core, int new_ctx_index)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[new_ctx_index];
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+	unsigned int ret = 0;
+	int prio;
+
+	mfc_core_idle_update_hw_run(core, ctx);
+
+	if (core->state == MFCCORE_ERROR || core_ctx->state == MFCINST_ERROR) {
+		mfc_info("[MSR] Couldn't run HW. It's Error state\n");
+		return 0;
+	}
+
+	if (core_ctx->state == MFCINST_RUNNING)
+		mfc_clean_core_ctx_int_flags(core_ctx);
+
+	mfc_debug(2, "New context: %d\n", new_ctx_index);
+	core->curr_core_ctx = core_ctx->num;
+	if (core->sched_type == MFC_SCHED_PRIO) {
+		spin_lock_irqsave(&core->prio_work_lock, flags);
+		prio = mfc_get_prio(core, ctx->rt, ctx->prio);
+		spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+		core->last_core_ctx[prio] = core_ctx->num;
+		core->next_ctx_idx = -1;
+	}
+
+	mfc_debug(2, "core_ctx->state = %d\n", core_ctx->state);
+	/* Last frame has already been sent to MFC
+	 * Now obtaining frames from MFC buffer
+	 */
+
+	mfc_debug(2, "continue_clock_on = %d\n", core->continue_clock_on);
+	if (!core->continue_clock_on)
+		mfc_core_pm_clock_on(core, 1);
+	else
+		core->continue_clock_on = false;
+
+	return ret;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
new file mode 100644
index 000000000000..35f34f306d7d
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_hwlock.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_HWLOCK_H
+#define __MFC_CORE_HWLOCK_H __FILE__
+
+#include "base/mfc_common.h"
+
+static inline void mfc_core_init_listable_wq_dev(struct mfc_core *core)
+{
+	if (!core) {
+		mfc_pr_err("no mfc core device to run\n");
+		return;
+	}
+
+	INIT_LIST_HEAD(&core->hwlock_wq.list);
+	init_waitqueue_head(&core->hwlock_wq.wait_queue);
+	mutex_init(&core->hwlock_wq.wait_mutex);
+	core->hwlock_wq.core_ctx = NULL;
+	core->hwlock_wq.core = core;
+}
+
+static inline void mfc_core_init_listable_wq_ctx(struct mfc_core_ctx *core_ctx)
+{
+	if (!core_ctx) {
+		mfc_pr_err("no mfc core context to run\n");
+		return;
+	}
+
+	INIT_LIST_HEAD(&core_ctx->hwlock_wq.list);
+	init_waitqueue_head(&core_ctx->hwlock_wq.wait_queue);
+	mutex_init(&core_ctx->hwlock_wq.wait_mutex);
+	core_ctx->hwlock_wq.core_ctx = core_ctx;
+	core_ctx->hwlock_wq.core = NULL;
+}
+
+static inline void mfc_core_destroy_listable_wq_core(struct mfc_core *core)
+{
+	if (!core) {
+		mfc_pr_err("no mfc core device to run\n");
+		return;
+	}
+
+	mutex_destroy(&core->hwlock_wq.wait_mutex);
+}
+
+static inline void mfc_core_destroy_listable_wq_ctx(struct mfc_core_ctx *core_ctx)
+{
+	if (!core_ctx) {
+		mfc_pr_err("no mfc core context to run\n");
+		return;
+	}
+
+	mutex_destroy(&core_ctx->hwlock_wq.wait_mutex);
+}
+
+void mfc_core_init_hwlock(struct mfc_core *core);
+
+int mfc_core_get_hwlock_dev(struct mfc_core *core);
+int mfc_core_get_hwlock_ctx(struct mfc_core_ctx *core_ctx);
+
+void mfc_core_release_hwlock_dev(struct mfc_core *core);
+void mfc_core_release_hwlock_ctx(struct mfc_core_ctx *core_ctx);
+int mfc_core_just_run(struct mfc_core *core, int new_ctx_index);
+#endif /* __MFC_CORE_HWLOCK_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.c
new file mode 100644
index 000000000000..facb7255c400
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_intlock.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_intlock.h"
+#include "mfc_core_isr.h"
+
+void mfc_clear_core_intlock(struct mfc_ctx *ctx)
+{
+	mutex_lock(&ctx->intlock.core_mutex);
+
+	ctx->intlock.bits = 0;
+
+	mutex_unlock(&ctx->intlock.core_mutex);
+}
+
+int mfc_get_core_intlock(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+
+	if (!(IS_TWO_MODE2(ctx) && core_ctx->state == MFCINST_RUNNING))
+		return 0;
+
+	mutex_lock(&ctx->intlock.core_mutex);
+
+	if (ctx->intlock.lock) {
+		mfc_debug(2, "[2CORE] previous interrupt isn't handled yet\n");
+		set_bit(core->id, &ctx->intlock.pending);
+		mutex_unlock(&ctx->intlock.core_mutex);
+		return -1;
+	}
+
+	/*
+	 * 1) First interrupt case, should be core0.
+	 * 2) Previous interrupt number should be different with current core.
+	 */
+	if ((!ctx->intlock.bits && core->id != 0) ||
+	    ctx->intlock.bits & BIT(core->id)) {
+		mfc_debug(2, "[2CORE] interrupt reverse, MFC-%d isr should be delayed handled\n",
+			  core->id);
+		MFC_TRACE_RM("[c:%d] MFC-%d ISR reverse\n", ctx->num, core->id);
+		set_bit(core->id, &ctx->intlock.pending);
+		mutex_unlock(&ctx->intlock.core_mutex);
+		return -1;
+	}
+
+	ctx->intlock.lock = 1;
+	ctx->intlock.bits = 0;
+	set_bit(core->id, &ctx->intlock.bits);
+	mfc_debug(3, "[2CORE] get core int lock: %#08lx\n", ctx->intlock.bits);
+
+	mutex_unlock(&ctx->intlock.core_mutex);
+
+	return 0;
+}
+
+void mfc_release_core_intlock(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_core *pending_core = NULL;
+	int i;
+
+	mutex_lock(&ctx->intlock.core_mutex);
+
+	if (!ctx->intlock.lock) {
+		mfc_debug(4, "[2CORE] have been didn't get intlock\n");
+		mutex_unlock(&ctx->intlock.core_mutex);
+		return;
+	}
+
+	ctx->intlock.lock = 0;
+	mfc_debug(3, "[2CORE] release core int lock\n");
+
+	for (i = 0; i < dev->num_core; i++) {
+		if (ctx->intlock.pending & BIT(i)) {
+			pending_core = dev->core[i];
+			clear_bit(i, &ctx->intlock.pending);
+			mfc_debug(2, "[2CORE] interrupt pending clear\n");
+			MFC_TRACE_RM("[c:%d] MFC-%d ISR delayed handle\n", ctx->num, core->id);
+		}
+	}
+
+	mutex_unlock(&ctx->intlock.core_mutex);
+
+	if (pending_core)
+		mfc_core_irq(pending_core->irq, pending_core);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.h
new file mode 100644
index 000000000000..e1e2e9bdaabb
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_intlock.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_INTLOCK_H
+#define __MFC_CORE_INTLOCK_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_clear_core_intlock(struct mfc_ctx *ctx);
+int mfc_get_core_intlock(struct mfc_core_ctx *core_ctx);
+void mfc_release_core_intlock(struct mfc_core_ctx *core_ctx);
+
+#endif /* __MFC_CORE_INTLOCK_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
new file mode 100644
index 000000000000..4c6f531ffc02
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_isr.h"
+
+#include "mfc_core_hwlock.h"
+#include "mfc_core_intlock.h"
+#include "mfc_core_pm.h"
+
+#include "mfc_core_hw_reg_api.h"
+#include "mfc_core_reg_api.h"
+
+#include "base/mfc_utils.h"
+
+static inline int __mfc_core_is_err_condition(unsigned int err)
+{
+	switch (err) {
+	case MFC_REG_ERR_NO_AVAILABLE_DPB:
+	case MFC_REG_ERR_INSUFFICIENT_DPB_SIZE:
+	case MFC_REG_ERR_INSUFFICIENT_NUM_DPB:
+	case MFC_REG_ERR_INSUFFICIENT_MV_BUF_SIZE:
+	case MFC_REG_ERR_INSUFFICIENT_SCRATCH_BUF_SIZE:
+	case MFC_REG_ERR_UNDEFINED_EXCEPTION:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+irqreturn_t mfc_core_top_half_irq(int irq, void *priv)
+{
+	struct mfc_core *core = priv;
+	struct mfc_core_ctx *core_ctx;
+	unsigned int err;
+	unsigned int reason;
+
+	core_ctx = core->core_ctx[core->curr_core_ctx];
+	if (!core_ctx) {
+		mfc_core_err("no mfc context to run\n");
+		return IRQ_WAKE_THREAD;
+	}
+
+	reason = mfc_core_get_int_reason();
+	err = mfc_core_get_int_err();
+
+	core->last_int = reason;
+	core->last_int_time = ktime_to_timespec64(ktime_get());
+
+	mfc_debug(2, "[c:%d] Int reason: %d (err: %d, warn: %d)\n",
+		  core->curr_core_ctx, reason, mfc_get_err(err), mfc_get_warn(err));
+	MFC_TRACE_CORE_CTX("<< INT(top): %d\n", reason);
+	MFC_TRACE_LOG_CORE("I%d", reason);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int __mfc_irq_dev(struct mfc_core *core, unsigned int reason, unsigned int err)
+{
+	switch (reason) {
+	case MFC_REG_R2H_CMD_CACHE_FLUSH_RET:
+	case MFC_REG_R2H_CMD_SYS_INIT_RET:
+	case MFC_REG_R2H_CMD_FW_STATUS_RET:
+	case MFC_REG_R2H_CMD_SLEEP_RET:
+	case MFC_REG_R2H_CMD_WAKEUP_RET:
+		mfc_core_clear_int();
+		mfc_wake_up_core(core, reason, err);
+		return 0;
+	}
+
+	return 1;
+}
+
+/* Interrupt processing */
+irqreturn_t mfc_core_irq(int irq, void *priv)
+{
+	struct mfc_core *core = priv;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_ctx *ctx;
+	unsigned int reason;
+	unsigned int err;
+	int ret = -1;
+
+	mfc_core_debug_enter();
+
+	if (mfc_core_get_pwr_ref_cnt(core) == 0) {
+		mfc_core_err("no mfc power on\n");
+		goto irq_end;
+	}
+
+	/* Get the reason of interrupt and the error code */
+	reason = mfc_core_get_int_reason();
+	err = mfc_core_get_int_err();
+	mfc_core_debug(1, "[c:%d] Int reason: %d (err: %d, warn: %d)\n",
+		       core->curr_core_ctx, reason,
+		       mfc_get_err(err), mfc_get_warn(err));
+	MFC_TRACE_CORE("<< INT: %d (err: %d)\n", reason, err);
+
+	core->preempt_core_ctx = MFC_NO_INSTANCE_SET;
+
+	if (core->dev->debugfs.dbg_enable && reason != MFC_REG_R2H_CMD_QUEUE_DONE_RET)
+		mfc_core_dbg_disable(core);
+
+	if (__mfc_core_is_err_condition(err)) {
+		mfc_err("Interrupt Error Value %d", err);
+		WARN_ON(1);
+	}
+
+	ret = __mfc_irq_dev(core, reason, err);
+	if (!ret)
+		goto irq_end;
+	mfc_ctx_info("not implemented context irq ctx");
+
+irq_end:
+	mfc_core_debug_leave();
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
new file mode 100644
index 000000000000..046b20e6d4c2
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_isr.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_ISR_H
+#define __MFC_CORE_ISR_H __FILE__
+
+#include <linux/interrupt.h>
+
+#include "mfc_rm.h"
+
+#include "base/mfc_utils.h"
+
+irqreturn_t mfc_core_top_half_irq(int irq, void *priv);
+irqreturn_t mfc_core_irq(int irq, void *priv);
+#endif /* __MFC_CORE_ISR_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
new file mode 100644
index 000000000000..fd7ebe95e715
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_run.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_run.h"
+
+#include "mfc_core_pm.h"
+#include "mfc_core_sync.h"
+
+#include "mfc_core_cmd.h"
+#include "mfc_core_hw_reg_api.h"
+
+#include "base/mfc_utils.h"
+#include "base/mfc_mem.h"
+
+void mfc_core_run_cache_flush(struct mfc_core *core,
+			      enum mfc_do_cache_flush do_cache_flush,
+			      int reg_clear)
+{
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_info("[MSR] Couldn't lock HW. It's Error state\n");
+		return;
+	}
+
+	if (do_cache_flush == MFC_CACHEFLUSH) {
+		mfc_core_cmd_cache_flush(core);
+		if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_CACHE_FLUSH_RET)) {
+			mfc_core_err("Failed to CACHE_FLUSH\n");
+			core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_CACHE_FLUSH);
+		}
+	} else if (do_cache_flush == MFC_NO_CACHEFLUSH) {
+		mfc_core_debug(2, "F/W has already done cache flush with prediction\n");
+	}
+
+	/* When init_hw(), reg_clear is required between cache flush and (un)protection */
+	if (reg_clear) {
+		mfc_core_reg_clear(core);
+		mfc_core_debug(2, "Done register clear\n");
+	}
+}
+
+/* Initialize hardware */
+int mfc_core_run_init_hw(struct mfc_core *core)
+{
+	enum mfc_buf_usage_type buf_type;
+	int fw_ver;
+	int ret = 0;
+
+	mfc_core_debug(2, "F/W initialize start\n");
+
+	/* 0. MFC reset */
+	ret = mfc_core_pm_clock_on(core, 0);
+	if (ret) {
+		mfc_core_err("Failed to enable clock before reset(%d)\n", ret);
+		return ret;
+	}
+
+	mfc_core_pm_clock_get(core);
+
+	mfc_core_run_cache_flush(core, MFC_NO_CACHEFLUSH, 1);
+
+	mfc_core_reset_mfc(core);
+	mfc_core_debug(2, "Done MFC reset\n");
+
+	/* 1. Set DRAM base Addr */
+	mfc_core_set_risc_base_addr(core);
+
+	/* 2. Release reset signal to the RISC */
+	mfc_core_risc_on(core);
+
+	mfc_core_debug(2, "Will now wait for completion of firmware transfer\n");
+	if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_FW_STATUS_RET)) {
+		mfc_core_err("Failed to RISC_ON\n");
+		mfc_core_clean_dev_int_flags(core);
+		ret = -EIO;
+		goto err_init_hw;
+	}
+
+	/* 3. Initialize firmware */
+	mfc_core_cmd_sys_init(core, buf_type);
+
+	mfc_core_debug(2, "Ok, now will write a command to init the system\n");
+	if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_SYS_INIT_RET)) {
+		mfc_core_err("Failed to SYS_INIT\n");
+		mfc_core_clean_dev_int_flags(core);
+		ret = -EIO;
+		goto err_init_hw;
+	}
+
+	core->int_condition = 0;
+	if (core->int_err != 0 || core->int_reason != MFC_REG_R2H_CMD_SYS_INIT_RET) {
+		/* Failure. */
+		mfc_core_err("Failed to init firmware - error: %d, int: %d\n",
+			     core->int_err, core->int_reason);
+		ret = -EIO;
+		goto err_init_hw;
+	}
+
+	core->fw.fimv_info = mfc_core_get_fimv_info();
+	if (core->fw.fimv_info != 'D' && core->fw.fimv_info != 'E')
+		core->fw.fimv_info = 'N';
+
+	mfc_core_info("[F/W] MFC v%x, %02xyy %02xmm %02xdd (%c)\n",
+		      core->core_pdata->ip_ver,
+		      mfc_core_get_fw_ver_year(),
+		      mfc_core_get_fw_ver_month(),
+		      mfc_core_get_fw_ver_date(),
+		      core->fw.fimv_info);
+
+	core->fw.date = mfc_core_get_fw_ver_all();
+	/* Check MFC version and F/W version */
+	fw_ver = mfc_core_get_mfc_version();
+	if ((fw_ver & MFC_REG_MFC_VER_MAJOR_MASK) != core->core_pdata->ip_ver) {
+		mfc_core_err("Invalid F/W version(0x%x) for MFC H/W(0x%x)\n",
+			     fw_ver, core->core_pdata->ip_ver);
+		ret = -EIO;
+		goto err_init_hw;
+	}
+	core->dev->fw_changed_info = (fw_ver & MFC_REG_MFC_VER_MINOR_MASK);
+
+	mfc_core_change_fw_state(core, MFC_FW_INITIALIZED, 1);
+
+err_init_hw:
+	mfc_core_pm_clock_off(core, 0);
+	mfc_core_debug_leave();
+
+	return ret;
+}
+
+/* Deinitialize hardware */
+void mfc_core_run_deinit_hw(struct mfc_core *core)
+{
+	int ret;
+
+	mfc_core_debug(2, "mfc deinit start\n");
+
+	ret = mfc_core_pm_clock_on(core, 0);
+	if (ret) {
+		mfc_core_err("Failed to enable clock before reset(%d)\n", ret);
+		return;
+	}
+
+	mfc_core_mfc_off(core);
+
+	mfc_core_pm_clock_off(core, 0);
+
+	mfc_core_debug(2, "mfc deinit completed\n");
+}
+
+int mfc_core_run_sleep(struct mfc_core *core)
+{
+	struct mfc_core_ctx *core_ctx;
+	int i;
+
+	mfc_core_debug_enter();
+
+	core_ctx = core->core_ctx[core->curr_core_ctx];
+	if (!core_ctx) {
+		for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+			if (core->core_ctx[i]) {
+				core_ctx = core->core_ctx[i];
+				break;
+			}
+		}
+
+		if (!core_ctx) {
+			mfc_core_err("no mfc context to run\n");
+			return -EINVAL;
+		}
+		mfc_info("ctx is changed %d -> %d\n",
+			 core->curr_core_ctx, core_ctx->num);
+
+		core->curr_core_ctx = core_ctx->num;
+	}
+
+	mfc_core_pm_clock_on(core, 0);
+	mfc_core_cmd_sleep(core);
+
+	if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_SLEEP_RET)) {
+		mfc_err("Failed to SLEEP\n");
+		core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_SLEEP);
+		return -EBUSY;
+	}
+
+	core->int_condition = 0;
+	if (core->int_err != 0 || core->int_reason != MFC_REG_R2H_CMD_SLEEP_RET) {
+		/* Failure. */
+		mfc_err("Failed to sleep - error: %d, int: %d\n",
+			core->int_err, core->int_reason);
+		return -EBUSY;
+	}
+
+	core->sleep = 1;
+
+	mfc_core_mfc_always_off(core);
+	mfc_core_pm_clock_off(core, 0);
+
+	mfc_core_debug_leave();
+
+	return 0;
+}
+
+int mfc_core_run_wakeup(struct mfc_core *core)
+{
+	int ret = 0;
+
+	mfc_core_debug_enter();
+
+	/* 0. MFC reset */
+	ret = mfc_core_pm_clock_on(core, 0);
+	if (ret) {
+		mfc_core_err("Failed to enable clock before reset(%d)\n", ret);
+		return ret;
+	}
+	mfc_core_reg_clear(core);
+	mfc_core_debug(2, "Done register clear\n");
+
+	mfc_core_reset_mfc(core);
+	mfc_core_debug(2, "Done MFC reset\n");
+
+	/* 1. Set DRAM base Addr */
+	mfc_core_set_risc_base_addr(core);
+
+	/* 2. Release reset signal to the RISC */
+	mfc_core_risc_on(core);
+
+	mfc_core_debug(2, "Will now wait for completion of firmware transfer\n");
+	if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_FW_STATUS_RET)) {
+		mfc_core_err("Failed to RISC_ON\n");
+		core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_RISC_ON);
+		return -EBUSY;
+	}
+
+	mfc_core_debug(2, "Ok, now will write a command to wakeup the system\n");
+	mfc_core_cmd_wakeup(core);
+
+	mfc_core_debug(2, "Will now wait for completion of firmware wake up\n");
+	if (mfc_wait_for_done_core(core, MFC_REG_R2H_CMD_WAKEUP_RET)) {
+		mfc_core_err("Failed to WAKEUP\n");
+		core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_WAKEUP);
+		return -EBUSY;
+	}
+
+	core->int_condition = 0;
+	if (core->int_err != 0 || core->int_reason != MFC_REG_R2H_CMD_WAKEUP_RET) {
+		/* Failure. */
+		mfc_core_err("Failed to wakeup - error: %d, int: %d\n",
+			     core->int_err, core->int_reason);
+	}
+
+	core->sleep = 0;
+
+	mfc_core_pm_clock_off(core, 0);
+
+	mfc_core_debug_leave();
+
+	return ret;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
new file mode 100644
index 000000000000..3d243dc18e15
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_run.h
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_RUN_H
+#define __MFC_CORE_RUN_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_core_run_cache_flush(struct mfc_core *core,
+			      enum mfc_do_cache_flush do_cache_flush,
+			      int reg_clear);
+
+int mfc_core_run_init_hw(struct mfc_core *core);
+void mfc_core_run_deinit_hw(struct mfc_core *core);
+
+int mfc_core_run_sleep(struct mfc_core *core);
+int mfc_core_run_wakeup(struct mfc_core *core);
+#endif /* __MFC_CORE_RUN_H */
-- 
2.34.1

