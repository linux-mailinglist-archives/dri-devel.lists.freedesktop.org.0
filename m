Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4D53AE67
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 23:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEED310F9AE;
	Wed,  1 Jun 2022 21:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079A410FAE4;
 Wed,  1 Jun 2022 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654117616; x=1685653616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQyAbyhAynfSPTjH+Jh8KgZIu2UKu5AEYyGe+F2vhd8=;
 b=W7ozNFZvKxPgi7+fNr9CqfxaHVH9EtJlEXnucsjqnqHXspYBhadHBgr0
 zzpucOqor74CN6+2OsV9inFV+Mk8Ni34GXe5kGBJk+aVATG0NLJl8QHn1
 fNSVs3s5r/XRowWScMHaw+a9K6m4ldsLHWCOBuQRgMxwnEETYan671BbT
 pPkibmYtgo87wnwX286M08aNesi47f3MGn4RAkGNephaA7B3vgXP3Kd7d
 aTMBSBDiE6awnRqipbQkpozvZr9+sXAC8eGl1EBoXo2zxqRS8R1/Rp7dr
 Kfvo/m8RkqKeauS7AyF2KH51NLw4u6QprZYAIjsmtPqcfDSwk5IsoU+lF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273298779"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="273298779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 14:06:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="577145346"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 14:06:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add extra registers to GPU error dump
Date: Wed,  1 Jun 2022 14:06:46 -0700
Message-Id: <20220601210646.615946-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Our internal teams have identified a few additional engine registers
that are worth inspecting in error state dumps during development &
debug.  Let's capture and print them as part of our error dump.

For simplicity we'll just dump these registers on gen11 and beyond.
Most of these registers have existed since earlier platforms (e.g., gen6
or gen7) but were initially introduced only for a subset of the
platforms' engines; gen11 seems to be where they became available on all
engines.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  5 +++++
 drivers/gpu/drm/i915/i915_gpu_error.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h       |  7 +++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
index 44de10cf7837..889f0df3940b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
@@ -8,6 +8,7 @@
 
 #include "i915_reg_defs.h"
 
+#define RING_EXCC(base)				_MMIO((base) + 0x28)
 #define RING_TAIL(base)				_MMIO((base) + 0x30)
 #define   TAIL_ADDR				0x001FFFF8
 #define RING_HEAD(base)				_MMIO((base) + 0x34)
@@ -133,6 +134,8 @@
 		(REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, (dst) << 1) | \
 		 REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, (src) << 1))
 
+#define RING_CSCMDOP(base)			_MMIO((base) + 0x20c)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
@@ -149,6 +152,7 @@
 		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
 
 #define RING_PREDICATE_RESULT(base)		_MMIO((base) + 0x3b8) /* gen12+ */
+
 #define MI_PREDICATE_RESULT_2(base)		_MMIO((base) + 0x3bc)
 #define   LOWER_SLICE_ENABLED			(1 << 0)
 #define   LOWER_SLICE_DISABLED			(0 << 0)
@@ -172,6 +176,7 @@
 #define	  CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT	REG_BIT(2)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE	REG_BIT(8)
+#define RING_CTX_SR_CTL(base)			_MMIO((base) + 0x244)
 #define RING_SEMA_WAIT_POLL(base)		_MMIO((base) + 0x24c)
 #define GEN8_RING_PDP_UDW(base, n)		_MMIO((base) + 0x270 + (n) * 8 + 4)
 #define GEN8_RING_PDP_LDW(base, n)		_MMIO((base) + 0x270 + (n) * 8)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 0512c66fa4f3..bff8a111424a 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -581,6 +581,15 @@ static void error_print_engine(struct drm_i915_error_state_buf *m,
 		err_printf(m, "  RC PSMI: 0x%08x\n", ee->rc_psmi);
 		err_printf(m, "  FAULT_REG: 0x%08x\n", ee->fault_reg);
 	}
+	if (GRAPHICS_VER(m->i915) >= 11) {
+		err_printf(m, "  NOPID: 0x%08x\n", ee->nopid);
+		err_printf(m, "  EXCC: 0x%08x\n", ee->excc);
+		err_printf(m, "  CMD_CCTL: 0x%08x\n", ee->cmd_cctl);
+		err_printf(m, "  CSCMDOP: 0x%08x\n", ee->cscmdop);
+		err_printf(m, "  CTX_SR_CTL: 0x%08x\n", ee->ctx_sr_ctl);
+		err_printf(m, "  DMA_FADDR_HI: 0x%08x\n", ee->dma_faddr_hi);
+		err_printf(m, "  DMA_FADDR_LO: 0x%08x\n", ee->dma_faddr_lo);
+	}
 	if (HAS_PPGTT(m->i915)) {
 		err_printf(m, "  GFX_MODE: 0x%08x\n", ee->vm_info.gfx_mode);
 
@@ -1224,6 +1233,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
 		ee->ipehr = ENGINE_READ(engine, IPEHR);
 	}
 
+	if (GRAPHICS_VER(i915) >= 11) {
+		ee->cmd_cctl = ENGINE_READ(engine, RING_CMD_CCTL);
+		ee->cscmdop = ENGINE_READ(engine, RING_CSCMDOP);
+		ee->ctx_sr_ctl = ENGINE_READ(engine, RING_CTX_SR_CTL);
+		ee->dma_faddr_hi = ENGINE_READ(engine, RING_DMA_FADD_UDW);
+		ee->dma_faddr_lo = ENGINE_READ(engine, RING_DMA_FADD);
+		ee->nopid = ENGINE_READ(engine, RING_NOPID);
+		ee->excc = ENGINE_READ(engine, RING_EXCC);
+	}
+
 	intel_engine_get_instdone(engine, &ee->instdone);
 
 	ee->instpm = ENGINE_READ(engine, RING_INSTPM);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index a611abacd9c2..55a143b92d10 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -84,6 +84,13 @@ struct intel_engine_coredump {
 	u32 fault_reg;
 	u64 faddr;
 	u32 rc_psmi; /* sleep state */
+	u32 nopid;
+	u32 excc;
+	u32 cmd_cctl;
+	u32 cscmdop;
+	u32 ctx_sr_ctl;
+	u32 dma_faddr_hi;
+	u32 dma_faddr_lo;
 	struct intel_instdone instdone;
 
 	/* GuC matched capture-lists info */
-- 
2.35.3

