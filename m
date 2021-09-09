Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB998405029
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5C6E887;
	Thu,  9 Sep 2021 12:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55916E879;
 Thu,  9 Sep 2021 12:32:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208005421"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208005421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="470057748"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	"Huang, Sean Z" <sean.z.huang@intel.com>, Huang@freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 08/17] drm/i915/pxp: Implement arb session teardown
Date: Thu,  9 Sep 2021 05:29:06 -0700
Message-Id: <20210909122915.971652-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Huang, Sean Z" <sean.z.huang@intel.com>

Teardown is triggered when the display topology changes and no
long meets the secure playback requirement, and hardware trashes
all the encryption keys for display. Additionally, we want to emit a
teardown operation to make sure we're clean on boot and resume

v2: emit in the ring, use high prio request (Chris)
v3: better defines, stalling flush, cleaned up and renamed submission
    funcs (Chris)

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/Makefile                |   1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  22 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c         |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c     | 141 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h     |  15 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  29 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h |   1 +
 7 files changed, 212 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 405e04f4dd59..4fb663de344d 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -284,6 +284,7 @@ i915-y += i915_perf.o
 # Protected execution platform (PXP) support
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp.o \
+	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_session.o \
 	pxp/intel_pxp_tee.o
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 1c3af0fc0456..ec2a0a566c40 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -28,10 +28,13 @@
 #define INSTR_26_TO_24_MASK	0x7000000
 #define   INSTR_26_TO_24_SHIFT	24
 
+#define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
+
 /*
  * Memory interface instructions used by the kernel
  */
-#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
+#define MI_INSTR(opcode, flags) \
+	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
 /* Many MI commands use bit 22 of the header dword for GGTT vs PPGTT */
 #define  MI_GLOBAL_GTT    (1<<22)
 
@@ -57,6 +60,7 @@
 #define MI_SUSPEND_FLUSH	MI_INSTR(0x0b, 0)
 #define   MI_SUSPEND_FLUSH_EN	(1<<0)
 #define MI_SET_APPID		MI_INSTR(0x0e, 0)
+#define   MI_SET_APPID_SESSION_ID(x)	((x) << 0)
 #define MI_OVERLAY_FLIP		MI_INSTR(0x11, 0)
 #define   MI_OVERLAY_CONTINUE	(0x0<<21)
 #define   MI_OVERLAY_ON		(0x1<<21)
@@ -146,6 +150,7 @@
 #define MI_STORE_REGISTER_MEM_GEN8   MI_INSTR(0x24, 2)
 #define   MI_SRM_LRM_GLOBAL_GTT		(1<<22)
 #define MI_FLUSH_DW		MI_INSTR(0x26, 1) /* for GEN6 */
+#define   MI_FLUSH_DW_PROTECTED_MEM_EN	(1<<22)
 #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
 #define   MI_INVALIDATE_TLB		(1<<18)
 #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
@@ -272,6 +277,19 @@
 #define   MI_MATH_REG_ZF		0x32
 #define   MI_MATH_REG_CF		0x33
 
+/*
+ * Media instructions used by the kernel
+ */
+#define MEDIA_INSTR(pipe, op, sub_op, flags) \
+	(__INSTR(INSTR_RC_CLIENT) | (pipe) << INSTR_SUBCLIENT_SHIFT | \
+	(op) << INSTR_26_TO_24_SHIFT | (sub_op) << 16 | (flags))
+
+#define MFX_WAIT				MEDIA_INSTR(1, 0, 0, 0)
+#define  MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG	REG_BIT(8)
+#define  MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG	REG_BIT(9)
+
+#define CRYPTO_KEY_EXCHANGE			MEDIA_INSTR(2, 6, 9, 0)
+
 /*
  * Commands used only by the command parser
  */
@@ -328,8 +346,6 @@
 #define GFX_OP_3DSTATE_BINDING_TABLE_EDIT_PS \
 	((0x3<<29)|(0x3<<27)|(0x0<<24)|(0x47<<16))
 
-#define MFX_WAIT  ((0x3<<29)|(0x1<<27)|(0x0<<16))
-
 #define COLOR_BLT     ((0x2<<29)|(0x40<<22))
 #define SRC_COPY_BLT  ((0x2<<29)|(0x43<<22))
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index e1370f323126..26176d43a02d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -98,9 +98,14 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 
 void intel_pxp_init_hw(struct intel_pxp *pxp)
 {
+	int ret;
+
 	kcr_pxp_enable(pxp_to_gt(pxp));
 
-	intel_pxp_create_arb_session(pxp);
+	/* always emit a full termination to clean the state */
+	ret = intel_pxp_terminate_arb_session_and_global(pxp);
+	if (!ret)
+		intel_pxp_create_arb_session(pxp);
 }
 
 void intel_pxp_fini_hw(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
new file mode 100644
index 000000000000..80678dafde15
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#include "intel_pxp.h"
+#include "intel_pxp_cmd.h"
+#include "intel_pxp_session.h"
+#include "gt/intel_context.h"
+#include "gt/intel_engine_pm.h"
+#include "gt/intel_gpu_commands.h"
+#include "gt/intel_ring.h"
+
+#include "i915_trace.h"
+
+/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
+#define MFX_WAIT_PXP (MFX_WAIT | \
+		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
+		      MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
+
+static u32 *pxp_emit_session_selection(u32 *cs, u32 idx)
+{
+	*cs++ = MFX_WAIT_PXP;
+
+	/* pxp off */
+	*cs++ = MI_FLUSH_DW;
+	*cs++ = 0;
+	*cs++ = 0;
+
+	/* select session */
+	*cs++ = MI_SET_APPID | MI_SET_APPID_SESSION_ID(idx);
+
+	*cs++ = MFX_WAIT_PXP;
+
+	/* pxp on */
+	*cs++ = MI_FLUSH_DW | MI_FLUSH_DW_PROTECTED_MEM_EN |
+		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_DW_STORE_INDEX;
+	*cs++ = I915_GEM_HWS_PXP_ADDR | MI_FLUSH_DW_USE_GTT;
+	*cs++ = 0;
+
+	*cs++ = MFX_WAIT_PXP;
+
+	return cs;
+}
+
+static u32 *pxp_emit_inline_termination(u32 *cs)
+{
+	/* session inline termination */
+	*cs++ = CRYPTO_KEY_EXCHANGE;
+	*cs++ = 0;
+
+	return cs;
+}
+
+static u32 *pxp_emit_session_termination(u32 *cs, u32 idx)
+{
+	cs = pxp_emit_session_selection(cs, idx);
+	cs = pxp_emit_inline_termination(cs);
+
+	return cs;
+}
+
+static u32 *pxp_emit_wait(u32 *cs)
+{
+	/* wait for cmds to go through */
+	*cs++ = MFX_WAIT_PXP;
+	*cs++ = 0;
+
+	return cs;
+}
+
+/*
+ * if we ever need to terminate more than one session, we can submit multiple
+ * selections and terminations back-to-back with a single wait at the end
+ */
+#define SELECTION_LEN 10
+#define TERMINATION_LEN 2
+#define SESSION_TERMINATION_LEN(x) ((SELECTION_LEN + TERMINATION_LEN) * (x))
+#define WAIT_LEN 2
+
+static void pxp_request_commit(struct i915_request *rq)
+{
+	struct i915_sched_attr attr = { .priority = I915_PRIORITY_MAX };
+	struct intel_timeline * const tl = i915_request_timeline(rq);
+
+	lockdep_unpin_lock(&tl->mutex, rq->cookie);
+
+	trace_i915_request_add(rq);
+	__i915_request_commit(rq);
+	__i915_request_queue(rq, &attr);
+
+	mutex_unlock(&tl->mutex);
+}
+
+int intel_pxp_terminate_session(struct intel_pxp *pxp, u32 id)
+{
+	struct i915_request *rq;
+	struct intel_context *ce = pxp->ce;
+	u32 *cs;
+	int err;
+
+	if (!intel_pxp_is_enabled(pxp))
+		return 0;
+
+	rq = i915_request_create(ce);
+	if (IS_ERR(rq))
+		return PTR_ERR(rq);
+
+	if (ce->engine->emit_init_breadcrumb) {
+		err = ce->engine->emit_init_breadcrumb(rq);
+		if (err)
+			goto out_rq;
+	}
+
+	cs = intel_ring_begin(rq, SESSION_TERMINATION_LEN(1) + WAIT_LEN);
+	if (IS_ERR(cs)) {
+		err = PTR_ERR(cs);
+		goto out_rq;
+	}
+
+	cs = pxp_emit_session_termination(cs, id);
+	cs = pxp_emit_wait(cs);
+
+	intel_ring_advance(rq, cs);
+
+out_rq:
+	i915_request_get(rq);
+
+	if (unlikely(err))
+		i915_request_set_error_once(rq, err);
+
+	pxp_request_commit(rq);
+
+	if (!err && i915_request_wait(rq, 0, HZ / 5) < 0)
+		err = -ETIME;
+
+	i915_request_put(rq);
+
+	return err;
+}
+
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
new file mode 100644
index 000000000000..6d6299543578
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_CMD_H__
+#define __INTEL_PXP_CMD_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+int intel_pxp_terminate_session(struct intel_pxp *pxp, u32 idx);
+
+#endif /* __INTEL_PXP_CMD_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 3331868f354c..b8e24adeb1f3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -7,6 +7,7 @@
 #include "i915_drv.h"
 
 #include "intel_pxp.h"
+#include "intel_pxp_cmd.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
@@ -15,6 +16,9 @@
 
 #define GEN12_KCR_SIP _MMIO(0x32260) /* KCR hwdrm session in play 0-31 */
 
+/* PXP global terminate register for session termination */
+#define PXP_GLOBAL_TERMINATE _MMIO(0x320f8)
+
 static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
@@ -72,3 +76,28 @@ int intel_pxp_create_arb_session(struct intel_pxp *pxp)
 
 	return 0;
 }
+
+int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
+{
+	int ret;
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	pxp->arb_is_valid = false;
+
+	/* terminate the hw sessions */
+	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
+	if (ret) {
+		drm_err(&gt->i915->drm, "Failed to submit session termination\n");
+		return ret;
+	}
+
+	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
+	if (ret) {
+		drm_err(&gt->i915->drm, "Session state did not clear\n");
+		return ret;
+	}
+
+	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
index 316c3bebed9c..7354314b1cc4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
@@ -11,5 +11,6 @@
 struct intel_pxp;
 
 int intel_pxp_create_arb_session(struct intel_pxp *pxp);
+int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp);
 
 #endif /* __INTEL_PXP_SESSION_H__ */
-- 
2.25.1

