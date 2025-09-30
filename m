Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BBBAB7C5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4925710E4DF;
	Tue, 30 Sep 2025 05:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="izOP9FGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF9B10E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035542epoutp03476847eca271ddaf3d00b77ea54ac379~p8zX0D1jZ3111931119epoutp03W
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035542epoutp03476847eca271ddaf3d00b77ea54ac379~p8zX0D1jZ3111931119epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204542;
 bh=P8Qh4CW2BFkICzdjo78AipBn/sVMMTrhSgSCULYFzEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=izOP9FGUpthRH9snp8YjYK/KvuaN/T2sGCmimIhWaqjT9/Wl8dj4AHt4TBtCdRJSP
 vcNcINBrNFql0mvZwW4+drUojSjuoN4P5GCcUZtJBq3X21TayJsLerYXMGMnMZylXA
 b7fFqMOvuiU+Dyt83fSdxZo7KAZi24spSEdSu0jk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20250930035541epcas5p2d68d44fe2eb1a6c1a14de342d579566a~p8zXC0suL2331123311epcas5p2I;
 Tue, 30 Sep 2025 03:55:41 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPNX4hzGz2SSKh; Tue, 30 Sep
 2025 03:55:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035540epcas5p356f8403ee4d973701a74cf96f6e9c19b~p8zVfGh0E0048900489epcas5p3c;
 Tue, 30 Sep 2025 03:55:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035535epsmtip164bc5085be34f0b361946b2b18080022~p8zRuewU52882428824epsmtip1Q;
 Tue, 30 Sep 2025 03:55:35 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 06/29] media: mfc: Add MFC core hardware register and
 debugfs APIs
Date: Tue, 30 Sep 2025 09:33:25 +0530
Message-Id: <20250930040348.3702923-7-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035540epcas5p356f8403ee4d973701a74cf96f6e9c19b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035540epcas5p356f8403ee4d973701a74cf96f6e9c19b
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035540epcas5p356f8403ee4d973701a74cf96f6e9c19b@epcas5p3.samsung.com>
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

Introduce mfc_core_hw_reg_api.h with inline helpers for interrupt
handling, firmware status polling, pending checks, power control
(MFC on/off), and RISC start/stop.
Add mfc_debugfs.h exposing mfc_init_debugfs / mfc_deinit_debugfs
for kernel debugfs integration.
Provide mfc_core_reg_api.h containing version‑query macros and
interrupt‑status getters, plus debug‑control stubs.
Include necessary header dependencies.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/mfc_core_hw_reg_api.c  | 122 +++++++++++
 .../samsung/exynos-mfc/mfc_core_hw_reg_api.h  | 144 +++++++++++++
 .../platform/samsung/exynos-mfc/mfc_core_pm.c | 184 +++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_core_pm.h |  33 +++
 .../samsung/exynos-mfc/mfc_core_reg_api.c     |  44 ++++
 .../samsung/exynos-mfc/mfc_core_reg_api.h     |  46 +++++
 .../samsung/exynos-mfc/mfc_core_sync.c        | 190 ++++++++++++++++++
 .../samsung/exynos-mfc/mfc_core_sync.h        |  25 +++
 .../platform/samsung/exynos-mfc/mfc_debugfs.c | 189 +++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_debugfs.h |  20 ++
 10 files changed, 997 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.c
new file mode 100644
index 000000000000..b4401ea2b476
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_hw_reg_api.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_hw_reg_api.h"
+
+/* Reset the device */
+void mfc_core_reg_clear(struct mfc_core *core)
+{
+	int i;
+
+	/* Zero Initialization of MFC registers */
+	MFC_CORE_WRITEL(0, MFC_REG_RISC2HOST_CMD);
+	MFC_CORE_WRITEL(0, MFC_REG_HOST2RISC_CMD);
+	MFC_CORE_WRITEL(0, MFC_REG_FW_VERSION);
+
+	for (i = 0; i < MFC_REG_CLEAR_COUNT; i++)
+		MFC_CORE_WRITEL(0, MFC_REG_CLEAR_BEGIN + (i * 4));
+}
+
+void mfc_core_reset_mfc(struct mfc_core *core)
+{
+	mfc_core_debug_enter();
+
+	MFC_CORE_WRITEL(0x1FFF, MFC_REG_MFC_RESET);
+	MFC_CORE_WRITEL(0, MFC_REG_MFC_RESET);
+
+	mfc_core_debug_leave();
+}
+
+void mfc_core_set_risc_base_addr(struct mfc_core *core)
+{
+	struct mfc_special_buf *fw_buf;
+
+	fw_buf = &core->fw_buf;
+
+	MFC_CORE_DMA_WRITEL(fw_buf->daddr,
+			    MFC_REG_RISC_NONSECURE_BASE_ADDR);
+
+	mfc_core_debug(2, "[MEMINFO][F/W] Base Address : %#x\n",
+		       (u32)fw_buf->daddr);
+	MFC_TRACE_CORE("F/W Base Address : %#x\n",
+		       (u32)fw_buf->daddr);
+}
+
+void mfc_core_cmd_host2risc(struct mfc_core *core, int cmd)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[core->curr_core_ctx];
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	int ret = 0;
+
+	mfc_debug(1, "[c:%d] Issue the command: %d%s\n", core->curr_core_ctx,
+		  cmd, core->cache_flush_flag ? " with cache flush" : "");
+	MFC_TRACE_CORE_CTX("%s %d, (dev:0x%lx, bits:%lx, owned:%d, wl:%d, trans:%d, opmode: %d)\n",
+			   ">> CMD :", cmd,
+			   core->hwlock.dev, core->hwlock.bits,
+			   core->hwlock.owned_by_irq, core->hwlock.wl_count,
+			   core->hwlock.transfer_owner, ctx->op_mode);
+	MFC_TRACE_LOG_CORE("C%d", cmd);
+
+	if (core->cache_flush_flag) {
+		MFC_TRACE_CORE_CTX(">> CMD : 12 in FW\n");
+		MFC_TRACE_LOG_CORE("C12FW");
+	}
+
+	/* Reset RISC2HOST command except nal q stop command */
+	if (cmd != MFC_REG_H2R_CMD_STOP_QUEUE)
+		MFC_CORE_WRITEL(0x0, MFC_REG_RISC2HOST_CMD);
+
+	if (cmd != MFC_REG_H2R_CMD_NAL_QUEUE &&
+	    cmd != MFC_REG_H2R_CMD_NAL_LL &&
+	    cmd != MFC_REG_H2R_CMD_STOP_QUEUE) {
+		/* TODO: change to core */
+		if (cmd != MFC_REG_H2R_CMD_NAL_ABORT) {
+			/* Check the fw status */
+			ret = mfc_core_wait_fw_status(core);
+			if (ret != 0)
+				mfc_err("Failed to wait firmware status\n");
+		}
+	}
+
+	if (core->dev->debugfs.dbg_enable && core->dbg_info_buf.dma_buf) {
+		/* For FW debugging */
+		mfc_core_dbg_set_addr(core);
+		mfc_core_dbg_enable(core);
+	}
+
+	core->last_cmd = cmd;
+	core->last_cmd_time = ktime_to_timespec64(ktime_get());
+
+	/* Record if the command incurs cache flush */
+	core->last_cmd_has_cache_flush =
+		(cmd == MFC_REG_H2R_CMD_CACHE_FLUSH || core->cache_flush_flag) ? 1 : 0;
+
+	if (core->cache_flush_flag)
+		cmd |= BIT(MFC_REG_H2R_CACHE_FLUSH_FLAG);
+	core->cache_flush_flag = 0;
+
+	/* Issue the command */
+	MFC_CORE_WRITEL(cmd, MFC_REG_HOST2RISC_CMD);
+	MFC_CORE_WRITEL(0x1, MFC_REG_HOST2RISC_INT);
+}
+
+/* Check whether HW interrupt has occurred or not */
+int mfc_core_check_risc2host(struct mfc_core *core)
+{
+	if (mfc_core_get_pwr_ref_cnt(core) && mfc_core_get_clk_ref_cnt(core)) {
+		if (MFC_CORE_READL(MFC_REG_RISC2HOST_INT))
+			return MFC_CORE_READL(MFC_REG_RISC2HOST_CMD);
+		else
+			return 0;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.h
new file mode 100644
index 000000000000..5a7bba8f54c3
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_hw_reg_api.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_HW_REG_API_H
+#define __MFC_CORE_HW_REG_API_H __FILE__
+
+#include "mfc_core_reg_api.h"
+
+#define mfc_core_get_int_reason()	(MFC_CORE_READL(MFC_REG_RISC2HOST_CMD)		\
+						& MFC_REG_RISC2HOST_CMD_MASK)
+
+#define mfc_core_clear_int()						\
+		do {							\
+			MFC_CORE_WRITEL(0, MFC_REG_RISC2HOST_CMD);	\
+			MFC_CORE_WRITEL(0, MFC_REG_RISC2HOST_INT);	\
+		} while (0)
+
+#define mfc_core_clear_int_only()	MFC_CORE_WRITEL(0, MFC_REG_RISC2HOST_INT)
+
+static inline int mfc_core_wait_fw_status(struct mfc_core *core)
+{
+	struct mfc_dev *dev = core->dev;
+	unsigned int status;
+	unsigned long timeout;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->wait_fw_status)) {
+		status = MFC_CORE_READL(MFC_REG_FIRMWARE_STATUS_INFO);
+		if (status & 0x1)
+			return 0;
+
+		timeout = jiffies + msecs_to_jiffies(MFC_BW_TIMEOUT);
+		do {
+			if (time_after(jiffies, timeout)) {
+				mfc_core_err("Timeout while waiting MFC F/W done\n");
+				return -EIO;
+			}
+			status = MFC_CORE_READL(MFC_REG_FIRMWARE_STATUS_INFO);
+		} while ((status & 0x1) == 0);
+	}
+
+	return 0;
+}
+
+static inline int mfc_core_wait_pending(struct mfc_core *core)
+{
+	unsigned int status;
+	unsigned long timeout;
+
+	/* Check F/W wait status */
+	timeout = jiffies + msecs_to_jiffies(MFC_BW_TIMEOUT);
+	do {
+		if (time_after(jiffies, timeout)) {
+			mfc_core_err("Timeout while waiting MFC F/W done\n");
+			return -EIO;
+		}
+		status = MFC_CORE_READL(MFC_REG_FIRMWARE_STATUS_INFO);
+	} while ((status & 0x1) == 0);
+
+	/* Check H/W pending status */
+	timeout = jiffies + msecs_to_jiffies(MFC_BW_TIMEOUT);
+	do {
+		if (time_after(jiffies, timeout)) {
+			mfc_core_err("Timeout while pendng clear\n");
+			mfc_core_err("MFC access pending R: %#x, BUS: %#x\n",
+				     MFC_CORE_READL(MFC_REG_MFC_RPEND),
+				     MFC_CORE_READL(MFC_REG_MFC_BUS_STATUS));
+			return -EIO;
+		}
+		status = MFC_CORE_READL(MFC_REG_MFC_RPEND);
+	} while (status != 0);
+
+	MFC_TRACE_CORE("** pending wait done\n");
+
+	return 0;
+}
+
+static inline void mfc_core_mfc_off(struct mfc_core *core)
+{
+	if (core->dev->pdata->support_hwacg == MFC_HWACG_DRV_CTRL) {
+		mfc_core_debug(2, "MFC_OFF 1(off)\n");
+		MFC_TRACE_CORE(">> MFC OFF 1(off)\n");
+		MFC_CORE_WRITEL(0x1, MFC_REG_MFC_OFF);
+	}
+}
+
+static inline void mfc_core_mfc_always_off(struct mfc_core *core)
+{
+	mfc_core_debug(2, "MFC_OFF 1(off)\n");
+	MFC_TRACE_CORE(">> MFC OFF 1(off)\n");
+	MFC_CORE_WRITEL(0x1, MFC_REG_MFC_OFF);
+}
+
+static inline void mfc_core_mfc_on(struct mfc_core *core)
+{
+	MFC_CORE_WRITEL(0x0, MFC_REG_MFC_OFF);
+	mfc_core_debug(2, "MFC_OFF 0(on)\n");
+	MFC_TRACE_CORE(">> MFC OFF 0(on)\n");
+}
+
+static inline void mfc_core_risc_on(struct mfc_core *core)
+{
+	mfc_core_clean_dev_int_flags(core);
+	mfc_core_mfc_on(core);
+
+	MFC_CORE_WRITEL(0x1, MFC_REG_RISC_ON);
+	mfc_core_debug(1, "RISC_ON\n");
+	MFC_TRACE_CORE(">> RISC ON\n");
+}
+
+static inline void mfc_core_risc_off(struct mfc_core *core)
+{
+	unsigned int status;
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(MFC_BW_TIMEOUT);
+	/* Check pending status */
+	do {
+		if (time_after(jiffies, timeout)) {
+			mfc_core_err("Timeout while pendng clear\n");
+			mfc_core_err("MFC access pending state: %#x\n", status);
+			mfc_core_err("MFC access pending R: %#x, W: %#x\n",
+				     MFC_CORE_READL(MFC_REG_MFC_RPEND),
+				     MFC_CORE_READL(MFC_REG_MFC_WPEND));
+			break;
+		}
+		status = MFC_CORE_READL(MFC_REG_MFC_BUS_STATUS);
+	} while (status != 0);
+
+	MFC_CORE_WRITEL(0x0, MFC_REG_RISC_ON);
+}
+
+void mfc_core_reg_clear(struct mfc_core *core);
+void mfc_core_reset_mfc(struct mfc_core *core);
+void mfc_core_set_risc_base_addr(struct mfc_core *core);
+void mfc_core_cmd_host2risc(struct mfc_core *core, int cmd);
+int mfc_core_check_risc2host(struct mfc_core *core);
+#endif /* __MFC_CORE_HW_REG_API_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
new file mode 100644
index 000000000000..def7ac2a2007
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_pm.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/pm_runtime.h>
+
+#include "mfc_core_pm.h"
+#include "mfc_core_sync.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+void mfc_core_pm_init(struct mfc_core *core)
+{
+	spin_lock_init(&core->pm.clklock);
+	atomic_set(&core->pm.pwr_ref, 0);
+	atomic_set(&core->pm.protect_ref, 0);
+	atomic_set(&core->clk_ref, 0);
+
+	core->pm.device = core->device;
+	core->pm.clock_on_steps = 0;
+	core->pm.clock_off_steps = 0;
+	pm_runtime_enable(core->pm.device);
+}
+
+void mfc_core_pm_final(struct mfc_core *core)
+{
+	pm_runtime_disable(core->pm.device);
+}
+
+int mfc_core_pm_clock_on(struct mfc_core *core, bool qos_update)
+{
+	int ret = 0;
+	int state;
+
+	if (core->dev->pdata->support_hwacg == MFC_HWACG_HWFW_CTRL)
+		return ret;
+
+	core->pm.clock_on_steps = 1;
+	state = mfc_core_get_clk_ref_cnt(core);
+
+	core->pm.clock_on_steps |= BIT(1);
+	if (core->pm.base_type != MFCBUF_INVALID) {
+		/*
+		 * There is no place to set core->pm.base_type,
+		 * so it is always MFCBUF_INVALID now.
+		 * When necessary later, you can set the bse_type.
+		 */
+		core->pm.clock_on_steps |= BIT(2);
+		ret = mfc_core_wait_pending(core);
+		if (ret != 0) {
+			mfc_core_err("pending wait failed (%d)\n", ret);
+			return ret;
+		}
+		core->pm.clock_on_steps |= BIT(3);
+		mfc_core_set_risc_base_addr(core);
+	}
+
+	core->pm.clock_on_steps |= BIT(4);
+	if (!IS_ERR(core->pm.clock)) {
+		ret = clk_enable(core->pm.clock);
+		if (ret < 0)
+			mfc_core_err("clk_enable failed (%d)\n", ret);
+	}
+
+	core->pm.clock_on_steps |= BIT(5);
+	state = atomic_inc_return(&core->clk_ref);
+
+	if (!core->dev->multi_core_inst_bits)
+		mfc_core_mfc_on(core);
+
+	mfc_core_debug(2, "clk_ref = %d\n", state);
+	MFC_TRACE_LOG_CORE("clk_ref = %d", state);
+
+	return 0;
+}
+
+void mfc_core_pm_clock_off(struct mfc_core *core, bool qos_update)
+{
+	int state;
+
+	if (core->dev->pdata->support_hwacg == MFC_HWACG_HWFW_CTRL)
+		return;
+
+	core->pm.clock_off_steps = 1;
+	state = atomic_dec_return(&core->clk_ref);
+	if (state < 0) {
+		mfc_core_info("MFC clock is already disabled (%d)\n", state);
+		atomic_set(&core->clk_ref, 0);
+		core->pm.clock_off_steps |= BIT(2);
+		MFC_TRACE_CORE("** clock_off already: ref state(%d)\n",
+			       mfc_core_get_clk_ref_cnt(core));
+	} else {
+		core->pm.clock_off_steps |= BIT(3);
+		if (!IS_ERR(core->pm.clock)) {
+			clk_disable(core->pm.clock);
+			core->pm.clock_off_steps |= BIT(4);
+		}
+	}
+
+	state = mfc_core_get_clk_ref_cnt(core);
+
+	if (!core->dev->multi_core_inst_bits && !state)
+		mfc_core_mfc_off(core);
+
+	core->pm.clock_off_steps |= BIT(5);
+
+	mfc_core_debug(2, "clk_ref = %d\n", state);
+	MFC_TRACE_LOG_CORE("clk_ref = %d", state);
+}
+
+int mfc_core_pm_power_on(struct mfc_core *core)
+{
+	int ret;
+
+	MFC_TRACE_CORE("++ Power on\n");
+	ret = pm_runtime_get_sync(core->pm.device);
+	if (ret < 0) {
+		mfc_core_err("Failed to get power: ret(%d)\n", ret);
+		goto err_power_on;
+	}
+
+#if (IS_ENABLED(CONFIG_COMMON_CLK_SAMSUNG))
+	core->pm.clock = clk_get(core->device, "aclk_mfc");
+	if (IS_ERR(core->pm.clock)) {
+		mfc_core_err("failed to get parent clock: ret(%d)\n", ret);
+	} else {
+		ret = clk_prepare(core->pm.clock);
+		if (ret) {
+			mfc_core_err("clk_prepare() failed: ret(%d)\n", ret);
+			clk_put(core->pm.clock);
+		}
+	}
+#endif
+
+	atomic_inc(&core->pm.pwr_ref);
+
+	MFC_TRACE_CORE("-- Power on: ret(%d)\n", ret);
+	MFC_TRACE_LOG_CORE("p+%d", mfc_core_get_pwr_ref_cnt(core));
+
+	return 0;
+
+err_power_on:
+	return ret;
+}
+
+int mfc_core_pm_power_off(struct mfc_core *core)
+{
+	int state;
+	int ret;
+
+	MFC_TRACE_CORE("++ Power off\n");
+
+	state = mfc_core_get_clk_ref_cnt(core);
+	if (state > 0 && core->dev->pdata->support_hwacg != MFC_HWACG_HWFW_CTRL) {
+		mfc_core_info("MFC clock is still enabled (%d)\n", state);
+		mfc_core_pm_clock_off(core, 0);
+	}
+
+	if (!IS_ERR(core->pm.clock)) {
+		clk_unprepare(core->pm.clock);
+		clk_put(core->pm.clock);
+	}
+	mfc_core_mfc_always_off(core);
+
+	ret = pm_runtime_put_sync(core->pm.device);
+	if (ret < 0) {
+		mfc_core_err("Failed to put power: ret(%d)\n", ret);
+		return ret;
+	}
+
+	atomic_dec(&core->pm.pwr_ref);
+
+	MFC_TRACE_CORE("-- Power off: ret(%d)\n", ret);
+	MFC_TRACE_LOG_CORE("p-%d", mfc_core_get_pwr_ref_cnt(core));
+
+	return ret;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.h
new file mode 100644
index 000000000000..f0b6159ce91a
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_pm.h File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_PM_H
+#define __MFC_CORE_PM_H __FILE__
+
+#include <linux/clk.h>
+
+#include "base/mfc_common.h"
+
+static inline void mfc_core_pm_clock_get(struct mfc_core *core)
+{
+	/* This should be called after clock was enabled by mfc_core_pm_clock_on() */
+	if (core->continue_clock_on)
+		mfc_core_info("MFC frequency : %ld\n", clk_get_rate(core->pm.clock));
+}
+
+void mfc_core_pm_init(struct mfc_core *core);
+void mfc_core_pm_final(struct mfc_core *core);
+int mfc_core_pm_clock_on(struct mfc_core *core, bool qos_update);
+void mfc_core_pm_clock_off(struct mfc_core *core, bool qos_update);
+int mfc_core_pm_power_on(struct mfc_core *core);
+int mfc_core_pm_power_off(struct mfc_core *core);
+
+#endif /* __MFC_CORE_PM_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
new file mode 100644
index 000000000000..ec6699dbd451
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_reg_api.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/delay.h>
+
+#include "mfc_core_reg_api.h"
+
+void mfc_core_dbg_enable(struct mfc_core *core)
+{
+	unsigned int reg;
+
+	mfc_core_debug(2, "MFC debug info enable\n");
+	reg = MFC_CORE_READL(MFC_REG_DBG_INFO_ENABLE);
+	reg |= BIT(MFC_REG_DBG_INFO_ENABLE_SHIFT);
+	MFC_CORE_WRITEL(reg, MFC_REG_DBG_INFO_ENABLE);
+}
+
+void mfc_core_dbg_disable(struct mfc_core *core)
+{
+	unsigned int reg;
+
+	mfc_core_debug(2, "MFC debug info disable\n");
+	reg = MFC_CORE_READL(MFC_REG_DBG_INFO_ENABLE);
+	reg &= ~BIT(MFC_REG_DBG_INFO_ENABLE_SHIFT);
+	MFC_CORE_WRITEL(reg, MFC_REG_DBG_INFO_ENABLE);
+}
+
+void mfc_core_dbg_set_addr(struct mfc_core *core)
+{
+	struct mfc_ctx_buf_size *buf_size = core->dev->variant->buf_size->ctx_buf;
+
+	memset((void *)core->dbg_info_buf.vaddr, 0, buf_size->dbg_info_buf);
+
+	MFC_CORE_WRITEL(core->dbg_info_buf.daddr, MFC_REG_DBG_BUFFER_ADDR);
+	MFC_CORE_WRITEL(buf_size->dbg_info_buf, MFC_REG_DBG_BUFFER_SIZE);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
new file mode 100644
index 000000000000..a23d25edce5d
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_reg_api.h File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_REG_API_H
+#define __MFC_CORE_REG_API_H __FILE__
+
+#include "base/mfc_regs.h"
+#include "base/mfc_utils.h"
+
+/* version */
+#define mfc_core_get_fimv_info()		((MFC_CORE_READL(MFC_REG_FW_VERSION)		\
+						>> MFC_REG_FW_VER_INFO_SHFT)		\
+						& MFC_REG_FW_VER_INFO_MASK)
+#define mfc_core_get_fw_ver_year()	((MFC_CORE_READL(MFC_REG_FW_VERSION)		\
+						>> MFC_REG_FW_VER_YEAR_SHFT)		\
+						& MFC_REG_FW_VER_YEAR_MASK)
+#define mfc_core_get_fw_ver_month()	((MFC_CORE_READL(MFC_REG_FW_VERSION)		\
+						>> MFC_REG_FW_VER_MONTH_SHFT)		\
+						& MFC_REG_FW_VER_MONTH_MASK)
+#define mfc_core_get_fw_ver_date()	((MFC_CORE_READL(MFC_REG_FW_VERSION)		\
+						>> MFC_REG_FW_VER_DATE_SHFT)		\
+						& MFC_REG_FW_VER_DATE_MASK)
+#define mfc_core_get_fw_ver_all()	((MFC_CORE_READL(MFC_REG_FW_VERSION)		\
+						>> MFC_REG_FW_VER_ALL_SHFT)		\
+						& MFC_REG_FW_VER_ALL_MASK)
+#define mfc_core_get_mfc_version()	((MFC_CORE_READL(MFC_REG_MFC_VERSION)		\
+						>> MFC_REG_MFC_VER_SHFT)		\
+						& MFC_REG_MFC_VER_MASK)
+
+/* kind of interrupt */
+#define mfc_core_get_int_err()		MFC_CORE_READL(MFC_REG_ERROR_CODE)
+
+#define mfc_core_get_inst_no()			MFC_CORE_READL(MFC_REG_RET_INSTANCE_ID)
+
+void mfc_core_dbg_enable(struct mfc_core *core);
+void mfc_core_dbg_disable(struct mfc_core *core);
+void mfc_core_dbg_set_addr(struct mfc_core *core);
+#endif /* __MFC_CORE_REG_API_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
new file mode 100644
index 000000000000..de13cdb9c99a
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_sync.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_sync.h"
+
+#include "mfc_core_hw_reg_api.h"
+
+#define R2H_BIT(x)	({		\
+	typeof(x) _x = (x);		\
+	(_x > 0) ? BIT(_x - 1) : 0;	\
+})
+
+static inline unsigned int __mfc_r2h_bit_mask(int cmd)
+{
+	unsigned int mask = R2H_BIT(cmd);
+
+	if (cmd == MFC_REG_R2H_CMD_FRAME_DONE_RET)
+		mask |= (R2H_BIT(MFC_REG_R2H_CMD_FIELD_DONE_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_COMPLETE_SEQ_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_SLICE_DONE_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_INIT_BUFFERS_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_NAL_ABORT_RET));
+	/* FIXME: Temporal mask for S3D SEI processing */
+	else if (cmd == MFC_REG_R2H_CMD_INIT_BUFFERS_RET)
+		mask |= (R2H_BIT(MFC_REG_R2H_CMD_FIELD_DONE_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_SLICE_DONE_RET) |
+			 R2H_BIT(MFC_REG_R2H_CMD_FRAME_DONE_RET));
+
+	return (mask |= R2H_BIT(MFC_REG_R2H_CMD_ERR_RET));
+}
+
+void mfc_get_corelock_ctx(struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->corelock.lock, flags);
+	mfc_ctx_debug(3, "[CORELOCK] get_corelock: cnt %d\n",
+		      ctx->corelock.cnt);
+
+	ctx->corelock.cnt++;
+
+	spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+}
+
+void mfc_release_corelock_ctx(struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->corelock.lock, flags);
+
+	ctx->corelock.cnt--;
+	if (ctx->corelock.cnt == 0)
+		wake_up(&ctx->corelock.wq);
+	else if (ctx->corelock.cnt < 0)
+		mfc_ctx_err("[CORELOCK] wrong corelock cnt %d\n", ctx->corelock.cnt);
+
+	mfc_ctx_debug(3, "[CORELOCK] release_corelock: cnt %d\n",
+		      ctx->corelock.cnt);
+	spin_unlock_irqrestore(&ctx->corelock.lock, flags);
+}
+
+#define wait_condition(x, c)	({							\
+	typeof(x) __x = (x);								\
+	__x->int_condition && (R2H_BIT(__x->int_reason) & __mfc_r2h_bit_mask(c));	\
+})
+
+#define is_err_cond(x)		({							\
+	typeof(x) __x = (x);								\
+	 __x->int_condition && (__x->int_reason == MFC_REG_R2H_CMD_ERR_RET);		\
+})
+
+/*
+ * Return value description
+ * 0: waked up before timeout
+ * 1: failed to get the response for the command before timeout
+ */
+int mfc_wait_for_done_core(struct mfc_core *core, int command)
+{
+	int ret;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_info("[MSR] Couldn't run HW. It's Error state\n");
+		return 0;
+	}
+
+	ret = wait_event_timeout(core->cmd_wq,
+				 wait_condition(core, command),
+				 msecs_to_jiffies(MFC_INT_TIMEOUT));
+	if (ret == 0) {
+		mfc_core_err("Interrupt (core->int_reason:%d, command:%d) timed out\n",
+			     core->int_reason, command);
+		if (mfc_core_check_risc2host(core)) {
+			ret = wait_event_timeout(core->cmd_wq,
+						 wait_condition(core, command),
+						 msecs_to_jiffies(MFC_INT_TIMEOUT *
+								  MFC_INT_TIMEOUT_CNT));
+			if (ret == 0) {
+				mfc_core_err("Timeout: MFC driver waited for upward of %dmsec\n",
+					     3 * MFC_INT_TIMEOUT);
+			} else {
+				goto wait_done;
+			}
+		}
+		return 1;
+	}
+
+wait_done:
+	if (is_err_cond(core)) {
+		mfc_core_err("Finished (core->int_reason:%d, command: %d)\n",
+			     core->int_reason, command);
+		mfc_core_err("But error (core->int_err:%d)\n", core->int_err);
+		return -1;
+	}
+
+	mfc_core_debug(2, "Finished waiting (core->int_reason:%d, command: %d)\n",
+		       core->int_reason, command);
+	return 0;
+}
+
+/*
+ * Return value description
+ *  0: waked up before timeout
+ *  1: failed to get the response for the command before timeout
+ * -1: got the error response for the command before timeout
+ */
+int mfc_wait_for_done_core_ctx(struct mfc_core_ctx *core_ctx, int command)
+{
+	struct mfc_core *core = core_ctx->core;
+	int ret;
+	unsigned int timeout = MFC_INT_TIMEOUT;
+
+	if (core->state == MFCCORE_ERROR) {
+		mfc_info("[MSR] Couldn't run HW. It's Error state\n");
+		return 0;
+	}
+
+	if (command == MFC_REG_R2H_CMD_CLOSE_INSTANCE_RET)
+		timeout = MFC_INT_SHORT_TIMEOUT;
+
+	ret = wait_event_timeout(core_ctx->cmd_wq,
+				 wait_condition(core_ctx, command),
+				 msecs_to_jiffies(timeout));
+	if (ret == 0) {
+		mfc_err("Interrupt (core_ctx->int_reason:%d, command:%d) timed out\n",
+			core_ctx->int_reason, command);
+		if (mfc_core_check_risc2host(core)) {
+			ret = wait_event_timeout(core_ctx->cmd_wq,
+						 wait_condition(core_ctx, command),
+						 msecs_to_jiffies
+							(MFC_INT_TIMEOUT * MFC_INT_TIMEOUT_CNT));
+			if (ret == 0) {
+				mfc_err("Timeout: MFC driver waited for upward of %dmsec\n",
+					3 * MFC_INT_TIMEOUT);
+			} else {
+				goto wait_done;
+			}
+		}
+		return 1;
+	}
+
+wait_done:
+	if (is_err_cond(core_ctx)) {
+		mfc_err("Finished (core_ctx->int_reason:%d, command: %d)\n",
+			core_ctx->int_reason, command);
+		mfc_err("But error (core_ctx->int_err:%d)\n", core_ctx->int_err);
+		return -1;
+	}
+
+	mfc_debug(2, "Finished waiting (core_ctx->int_reason:%d, command: %d)\n",
+		  core_ctx->int_reason, command);
+	return 0;
+}
+
+/* Wake up device wait_queue */
+void mfc_wake_up_core(struct mfc_core *core, unsigned int reason,
+		      unsigned int err)
+{
+	core->int_condition = 1;
+	core->int_reason = reason;
+	core->int_err = err;
+	wake_up(&core->cmd_wq);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
new file mode 100644
index 000000000000..2c19819048de
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_core_sync.h File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_CORE_SYNC_H
+#define __MFC_CORE_SYNC_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_get_corelock_ctx(struct mfc_ctx *ctx);
+void mfc_release_corelock_ctx(struct mfc_ctx *ctx);
+
+int mfc_wait_for_done_core(struct mfc_core *core, int command);
+int mfc_wait_for_done_core_ctx(struct mfc_core_ctx *core_ctx, int command);
+void mfc_wake_up_core(struct mfc_core *core, unsigned int reason,
+		      unsigned int err);
+int mfc_core_get_new_ctx(struct mfc_core *core);
+#endif /* __MFC_CORE_SYNC_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
new file mode 100644
index 000000000000..5baa76a6b405
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_debugfs.c File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+
+#include "mfc_debugfs.h"
+
+static int __mfc_info_show(struct seq_file *s, void *unused)
+{
+	struct mfc_dev *dev = s->private;
+	struct mfc_core *core = NULL;
+	struct mfc_core_ctx *core_ctx = NULL;
+	int i, j;
+
+	seq_puts(s, ">>> MFC common device information\n");
+	seq_printf(s, " [DEBUG MODE] dt: %s sysfs: %s\n",
+		   dev->pdata->debug_mode ? "enabled" : "disabled",
+		   dev->debugfs.debug_mode_en ? "enabled" : "disabled");
+
+	seq_printf(s, " [LOWMEM] is_low_mem: %d\n", IS_LOW_MEM);
+
+	for (j = 0; j < dev->num_core; j++) {
+		core = dev->core[j];
+		if (!core) {
+			mfc_dev_debug(2, "There is no core[%d]\n", j);
+			continue;
+		}
+		seq_printf(s, ">>> MFC core-%d device information\n", j);
+		seq_printf(s, " [VERSION] H/W: v%x, F/W: %06x(%c, normal: %#x), DRV: %d\n",
+			   core->core_pdata->ip_ver, core->fw.date, core->fw.fimv_info,
+			   core->fw.status, MFC_DRIVER_INFO);
+		seq_printf(s, " [PM] power: %d, clock: %d, clk_get %s, QoS level: %d\n",
+			   mfc_core_get_pwr_ref_cnt(core),
+			   mfc_core_get_clk_ref_cnt(core),
+			   IS_ERR(core->pm.clock) ? "failed" : "succeeded",
+			   atomic_read(&core->qos_req_cur) - 1);
+		seq_printf(s, " [CTX] num_inst: %d,  curr_ctx: %d\n",
+			   core->num_inst,
+			   core->curr_core_ctx);
+		seq_printf(s, " [HWLOCK] bits: %#lx, dev: %#lx, owned_by_irq = %d, wl_count = %d\n",
+			   core->hwlock.bits, core->hwlock.dev,
+			   core->hwlock.owned_by_irq,
+			   core->hwlock.wl_count);
+		seq_printf(s, "  >>> MFC core-%d instance information\n", j);
+		for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+			core_ctx = core->core_ctx[i];
+			if (core_ctx) {
+				seq_printf(s, "    [CORECTX:%d] state: %d\n",
+					   i, core_ctx->state);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int __mfc_debug_info_show(struct seq_file *s, void *unused)
+{
+	seq_puts(s, ">> MFC debug information\n");
+
+	seq_puts(s, "-----SFR dump options (bit setting)\n");
+	seq_puts(s, "ex) echo 0xff > /d/mfc/sfr_dump (all dump mode)\n");
+	seq_puts(s, "1   BIT(0): dec SEQ_START\n");
+	seq_puts(s, "2   BIT(1): dec INIT_BUFS\n");
+	seq_puts(s, "4   BIT(2): dec first NAL_START\n");
+	seq_puts(s, "8   BIT(3): enc SEQ_START\n");
+	seq_puts(s, "16  BIT(4): enc INIT_BUFS\n");
+	seq_puts(s, "32  BIT(5): enc first NAL_START\n");
+	seq_puts(s, "64  BIT(6): ERR interrupt\n");
+	seq_puts(s, "128 BIT(7): WARN interrupt\n");
+	seq_puts(s, "256 BIT(8): dec NAL_START\n");
+	seq_puts(s, "512 BIT(9): dec FRAME_DONE\n");
+	seq_puts(s, "1024 BIT(10): enc NAL_START\n");
+	seq_puts(s, "2048 BIT(11): enc FRAME_DONE\n");
+	seq_puts(s, "0x1000 BIT(12): MOVE_INSTANCE_RET\n");
+	seq_puts(s, "0x2000 BIT(13): Unknown unterrupt\n");
+	seq_puts(s, "0x8000 BIT(15): dec SEQ_DONE\n");
+	seq_puts(s, "0x10000 BIT(16): dec INIT_BUF_DONE\n");
+	seq_puts(s, "0x20000 BIT(17): dec first FRAME_DONE\n");
+	seq_puts(s, "0x40000 BIT(18): enc SEQ_DONE\n");
+	seq_puts(s, "0x80000 BIT(19): enc INIT_BUF_DONE\n");
+	seq_puts(s, "0x100000 BIT(20): enc first FRAME_DONE\n");
+	seq_puts(s, "0x20000000 BIT(29): Dump decoder CRC\n");
+	seq_puts(s, "0x40000000 BIT(30): Dump firmware\n");
+	seq_puts(s, "0x80000000 BIT(31): Dump all info\n");
+
+	seq_puts(s, "-----Performance boost options (bit setting)\n");
+	seq_puts(s, "1   BIT(0): DVFS (INT/MFC/MIF)\n");
+	seq_puts(s, "2   BIT(1): MO value\n");
+	seq_puts(s, "4   BIT(2): CPU frequency\n");
+
+	seq_puts(s, "-----Feature options (bit setting)\n");
+	seq_puts(s, "ex) echo 1 > /d/mfc/feture_option\n");
+	seq_puts(s, "1   BIT(0): recon SBWC disable\n");
+	seq_puts(s, "2   BIT(1): decoding order\n");
+	seq_puts(s, "4   BIT(2): meerkat disable\n");
+	seq_puts(s, "8   BIT(3): OTF path test enable\n");
+	seq_puts(s, "16  BIT(4): multi core disable\n");
+	seq_puts(s, "32  BIT(5): force multi core enable\n");
+	seq_puts(s, "64  BIT(6): black bar enable\n");
+	seq_puts(s, "128 BIT(7): when dec and enc, SBWC enable\n");
+	seq_puts(s, "256 BIT(8): sync minlock with clock disable\n");
+	seq_puts(s, "512 BIT(9): dynamic weight disable (use fixed weight)\n");
+	seq_puts(s, "1024 BIT(10): when high fps, SBWC enable\n");
+	seq_puts(s, "2048 BIT(11): film grain disable\n");
+	seq_puts(s, "0x4000 BIT(14): enable MSR mode once\n");
+
+	seq_puts(s, "-----Logging options (bit setting)\n");
+	seq_puts(s, "ex) echo 7 > /d/mfc/logging_option (all logging option)\n");
+	seq_puts(s, "1   BIT(0): kernel printk\n");
+	seq_puts(s, "2   BIT(1): memlog printf\n");
+	seq_puts(s, "4   BIT(2): memlog sfr dump\n");
+
+	seq_puts(s, "-----Scheduler type\n");
+	seq_puts(s, "ex) echo 1 > /d/mfc/sched_type\n");
+	seq_puts(s, "1   BIT(0): Round-robin scheduler\n");
+	seq_puts(s, "2   BIT(1): PBS (Priority Based Scheduler)\n");
+
+	return 0;
+}
+
+static int __mfc_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, __mfc_info_show, inode->i_private);
+}
+
+static int __mfc_debug_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, __mfc_debug_info_show, inode->i_private);
+}
+
+static const struct file_operations mfc_info_fops = {
+	.open = __mfc_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static const struct file_operations debug_info_fops = {
+	.open = __mfc_debug_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+void mfc_init_debugfs(struct mfc_dev *dev)
+{
+	struct mfc_debugfs *debugfs = &dev->debugfs;
+
+	debugfs->root = debugfs_create_dir("mfc", NULL);
+	if (!debugfs->root) {
+		mfc_dev_err("debugfs: failed to create root directory\n");
+		return;
+	}
+
+	dev->debugfs.logging_option = MFC_DEFAULT_LOGGING_OPTION;
+
+	debugfs_create_file("mfc_info", 0444, debugfs->root, dev, &mfc_info_fops);
+	debugfs_create_file("debug_info", 0444, debugfs->root, dev, &debug_info_fops);
+
+	debugfs_create_u32("debug", 0644, debugfs->root, &dev->debugfs.debug_level);
+	debugfs_create_u32("debug_ts", 0644, debugfs->root, &dev->debugfs.debug_ts);
+	debugfs_create_u32("debug_mode_en", 0644, debugfs->root, &dev->debugfs.debug_mode_en);
+	debugfs_create_u32("dbg_enable", 0644, debugfs->root, &dev->debugfs.dbg_enable);
+
+	debugfs_create_u32("sfr_dump", 0644, debugfs->root, &dev->debugfs.sfr_dump);
+
+	debugfs_create_u32("feature_option", 0644, debugfs->root, &dev->debugfs.feature_option);
+	debugfs_create_u32("logging_option", 0644, debugfs->root, &dev->debugfs.logging_option);
+	debugfs_create_u32("sched_perf_disable", 0644,
+			   debugfs->root, &dev->debugfs.sched_perf_disable);
+	debugfs_create_u32("sched_type", 0644, debugfs->root, &dev->debugfs.sched_type);
+}
+
+void mfc_deinit_debugfs(struct mfc_dev *dev)
+{
+	struct mfc_debugfs *debugfs = &dev->debugfs;
+
+	debugfs_remove_recursive(debugfs->root);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.h b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.h
new file mode 100644
index 000000000000..bbefd046587b
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_debugfs.h File
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_DEBUGFS_H
+#define __MFC_DEBUGFS_H __FILE__
+
+#include "base/mfc_common.h"
+
+void mfc_init_debugfs(struct mfc_dev *dev);
+void mfc_deinit_debugfs(struct mfc_dev *dev);
+
+#endif /* __MFC_DEBUGFS_H */
-- 
2.34.1

