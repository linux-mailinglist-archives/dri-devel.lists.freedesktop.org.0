Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A787D0DCC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B8610E5A6;
	Fri, 20 Oct 2023 10:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10E10E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798712; x=1729334712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXFh0Z0KPs1ldUrlEd3lkIlKS/PTqyvG30dyzpmGcuA=;
 b=T9Rk1kpuSOmRMlbIcOVVFt36Ojb3hpP1bwxYnEL4I+t5MULPQajzL8kZ
 yirgxoPs4zXHtQpVNo5YZe5zlH+EOfqZqg4wtcwtdmLKNZ7HWPaww5dim
 SmOx8iOYwhEiZG0z1hDhOR57RBFtR/l9P6a8gCMTt7EXy+dTka/iNo3kX
 L8rp4WlbElvdDfMyXT0dkjTolp+M/CD2G85E0HGe367XXp8q8d0CPj75P
 axlrRk/081WkQ9hpSBd8Q0mWoOQufHdFPcctIxxyfZdozST4RDameZF0t
 vZOXHPoeBeif5b73Qe8DLhn8WmWHuTSQg3OGhgAtQMyhbnnth9XdD2vv4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287507"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287507"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572538"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572538"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:10 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] accel/ivpu: Fix verbose version of REG_POLL macros
Date: Fri, 20 Oct 2023 12:44:57 +0200
Message-Id: <20231020104501.697763-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Remove two out of four _POLL macros. For two remained _POLL
macros add message about polling register start and finish.

Additionally avoid inconsequence when using REGV_WR/RD macros in
MMU code - passing raw register offset instead of register name.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_reg_io.h | 32 ++++++++++++--------
 drivers/accel/ivpu/ivpu_mmu.c       | 47 +++++++++++++++++------------
 2 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_reg_io.h b/drivers/accel/ivpu/ivpu_hw_reg_io.h
index 43c2c0c2d050..79b3f441eac4 100644
--- a/drivers/accel/ivpu/ivpu_hw_reg_io.h
+++ b/drivers/accel/ivpu/ivpu_hw_reg_io.h
@@ -47,22 +47,30 @@
 #define REG_TEST_FLD_NUM(REG, FLD, num, val) \
 	((num) == FIELD_GET(REG##_##FLD##_MASK, val))
 
-#define REGB_POLL(reg, var, cond, timeout_us) \
-	read_poll_timeout(REGB_RD32_SILENT, var, cond, REG_POLL_SLEEP_US, timeout_us, false, reg)
-
-#define REGV_POLL(reg, var, cond, timeout_us) \
-	read_poll_timeout(REGV_RD32_SILENT, var, cond, REG_POLL_SLEEP_US, timeout_us, false, reg)
-
 #define REGB_POLL_FLD(reg, fld, val, timeout_us) \
 ({ \
 	u32 var; \
-	REGB_POLL(reg, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)), timeout_us); \
+	int r; \
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) Polling field %s started (expected 0x%x)\n", \
+		 __func__, #reg, reg, #fld, val); \
+	r = read_poll_timeout(REGB_RD32_SILENT, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)),\
+			      REG_POLL_SLEEP_US, timeout_us, false, (reg)); \
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) Polling field %s %s (reg val 0x%08x)\n", \
+		 __func__, #reg, reg, #fld, r ? "ETIMEDOUT" : "OK", var); \
+	r; \
 })
 
 #define REGV_POLL_FLD(reg, fld, val, timeout_us) \
 ({ \
 	u32 var; \
-	REGV_POLL(reg, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)), timeout_us); \
+	int r; \
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) Polling field %s started (expected 0x%x)\n", \
+		 __func__, #reg, reg, #fld, val); \
+	r = read_poll_timeout(REGV_RD32_SILENT, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)),\
+			      REG_POLL_SLEEP_US, timeout_us, false, (reg)); \
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) Polling field %s %s (reg val 0x%08x)\n", \
+		 __func__, #reg, reg, #fld, r ? "ETIMEDOUT" : "OK", var); \
+	r; \
 })
 
 static inline u32
@@ -71,7 +79,7 @@ ivpu_hw_reg_rd32(struct ivpu_device *vdev, void __iomem *base, u32 reg,
 {
 	u32 val = readl(base + reg);
 
-	ivpu_dbg(vdev, REG, "%s RD: %s (0x%08x) => 0x%08x\n", func, name, reg, val);
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%08x\n", func, name, reg, val);
 	return val;
 }
 
@@ -81,7 +89,7 @@ ivpu_hw_reg_rd64(struct ivpu_device *vdev, void __iomem *base, u32 reg,
 {
 	u64 val = readq(base + reg);
 
-	ivpu_dbg(vdev, REG, "%s RD: %s (0x%08x) => 0x%016llx\n", func, name, reg, val);
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%016llx\n", func, name, reg, val);
 	return val;
 }
 
@@ -89,7 +97,7 @@ static inline void
 ivpu_hw_reg_wr32(struct ivpu_device *vdev, void __iomem *base, u32 reg, u32 val,
 		 const char *name, const char *func)
 {
-	ivpu_dbg(vdev, REG, "%s WR: %s (0x%08x) <= 0x%08x\n", func, name, reg, val);
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%08x\n", func, name, reg, val);
 	writel(val, base + reg);
 }
 
@@ -97,7 +105,7 @@ static inline void
 ivpu_hw_reg_wr64(struct ivpu_device *vdev, void __iomem *base, u32 reg, u64 val,
 		 const char *name, const char *func)
 {
-	ivpu_dbg(vdev, REG, "%s WR: %s (0x%08x) <= 0x%016llx\n", func, name, reg, val);
+	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%016llx\n", func, name, reg, val);
 	writeq(val, base + reg);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 473e1fc686a7..2538c78fbebe 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -18,10 +18,12 @@
 #define IVPU_MMU_REG_IDR5		      0x00200014u
 #define IVPU_MMU_REG_CR0		      0x00200020u
 #define IVPU_MMU_REG_CR0ACK		      0x00200024u
+#define IVPU_MMU_REG_CR0ACK_VAL_MASK	      GENMASK(31, 0)
 #define IVPU_MMU_REG_CR1		      0x00200028u
 #define IVPU_MMU_REG_CR2		      0x0020002cu
 #define IVPU_MMU_REG_IRQ_CTRL		      0x00200050u
 #define IVPU_MMU_REG_IRQ_CTRLACK	      0x00200054u
+#define IVPU_MMU_REG_IRQ_CTRLACK_VAL_MASK     GENMASK(31, 0)
 
 #define IVPU_MMU_REG_GERROR		      0x00200060u
 #define IVPU_MMU_REG_GERROR_CMDQ_MASK	      BIT_MASK(0)
@@ -39,12 +41,13 @@
 #define IVPU_MMU_REG_CMDQ_BASE		      0x00200090u
 #define IVPU_MMU_REG_CMDQ_PROD		      0x00200098u
 #define IVPU_MMU_REG_CMDQ_CONS		      0x0020009cu
+#define IVPU_MMU_REG_CMDQ_CONS_VAL_MASK	      GENMASK(23, 0)
+#define IVPU_MMU_REG_CMDQ_CONS_ERR_MASK	      GENMASK(30, 24)
 #define IVPU_MMU_REG_EVTQ_BASE		      0x002000a0u
 #define IVPU_MMU_REG_EVTQ_PROD		      0x002000a8u
 #define IVPU_MMU_REG_EVTQ_CONS		      0x002000acu
 #define IVPU_MMU_REG_EVTQ_PROD_SEC	      (0x002000a8u + SZ_64K)
 #define IVPU_MMU_REG_EVTQ_CONS_SEC	      (0x002000acu + SZ_64K)
-#define IVPU_MMU_REG_CMDQ_CONS_ERR_MASK	      GENMASK(30, 24)
 
 #define IVPU_MMU_IDR0_REF		0x080f3e0f
 #define IVPU_MMU_IDR0_REF_SIMICS	0x080f3e1f
@@ -409,19 +412,18 @@ static int ivpu_mmu_structs_alloc(struct ivpu_device *vdev)
 	return ret;
 }
 
-static int ivpu_mmu_reg_write(struct ivpu_device *vdev, u32 reg, u32 val)
+static int ivpu_mmu_reg_write_cr0(struct ivpu_device *vdev, u32 val)
 {
-	u32 reg_ack = reg + 4; /* ACK register is 4B after base register */
-	u32 val_ack;
-	int ret;
+	REGV_WR32(IVPU_MMU_REG_CR0, val);
 
-	REGV_WR32(reg, val);
+	return REGV_POLL_FLD(IVPU_MMU_REG_CR0ACK, VAL, val, IVPU_MMU_REG_TIMEOUT_US);
+}
 
-	ret = REGV_POLL(reg_ack, val_ack, (val == val_ack), IVPU_MMU_REG_TIMEOUT_US);
-	if (ret)
-		ivpu_err(vdev, "Failed to write register 0x%x\n", reg);
+static int ivpu_mmu_reg_write_irq_ctrl(struct ivpu_device *vdev, u32 val)
+{
+	REGV_WR32(IVPU_MMU_REG_IRQ_CTRL, val);
 
-	return ret;
+	return REGV_POLL_FLD(IVPU_MMU_REG_IRQ_CTRLACK, VAL, val, IVPU_MMU_REG_TIMEOUT_US);
 }
 
 static int ivpu_mmu_irqs_setup(struct ivpu_device *vdev)
@@ -429,19 +431,26 @@ static int ivpu_mmu_irqs_setup(struct ivpu_device *vdev)
 	u32 irq_ctrl = IVPU_MMU_IRQ_EVTQ_EN | IVPU_MMU_IRQ_GERROR_EN;
 	int ret;
 
-	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_IRQ_CTRL, 0);
+	ret = ivpu_mmu_reg_write_irq_ctrl(vdev, 0);
 	if (ret)
 		return ret;
 
-	return ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_IRQ_CTRL, irq_ctrl);
+	return ivpu_mmu_reg_write_irq_ctrl(vdev, irq_ctrl);
 }
 
 static int ivpu_mmu_cmdq_wait_for_cons(struct ivpu_device *vdev)
 {
 	struct ivpu_mmu_queue *cmdq = &vdev->mmu->cmdq;
+	int ret;
+
+	ret = REGV_POLL_FLD(IVPU_MMU_REG_CMDQ_CONS, VAL, cmdq->prod,
+			    IVPU_MMU_QUEUE_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	cmdq->cons = cmdq->prod;
 
-	return REGV_POLL(IVPU_MMU_REG_CMDQ_CONS, cmdq->cons, (cmdq->prod == cmdq->cons),
-			 IVPU_MMU_QUEUE_TIMEOUT_US);
+	return 0;
 }
 
 static int ivpu_mmu_cmdq_cmd_write(struct ivpu_device *vdev, const char *name, u64 data0, u64 data1)
@@ -528,7 +537,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	mmu->evtq.prod = 0;
 	mmu->evtq.cons = 0;
 
-	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, 0);
+	ret = ivpu_mmu_reg_write_cr0(vdev, 0);
 	if (ret)
 		return ret;
 
@@ -548,7 +557,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	REGV_WR32(IVPU_MMU_REG_CMDQ_CONS, 0);
 
 	val = IVPU_MMU_CR0_CMDQEN;
-	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
+	ret = ivpu_mmu_reg_write_cr0(vdev, val);
 	if (ret)
 		return ret;
 
@@ -569,12 +578,12 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, 0);
 
 	val |= IVPU_MMU_CR0_EVTQEN;
-	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
+	ret = ivpu_mmu_reg_write_cr0(vdev, val);
 	if (ret)
 		return ret;
 
 	val |= IVPU_MMU_CR0_ATSCHK;
-	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
+	ret = ivpu_mmu_reg_write_cr0(vdev, val);
 	if (ret)
 		return ret;
 
@@ -583,7 +592,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 		return ret;
 
 	val |= IVPU_MMU_CR0_SMMUEN;
-	return ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
+	return ivpu_mmu_reg_write_cr0(vdev, val);
 }
 
 static void ivpu_mmu_strtab_link_cd(struct ivpu_device *vdev, u32 sid)
-- 
2.25.1

