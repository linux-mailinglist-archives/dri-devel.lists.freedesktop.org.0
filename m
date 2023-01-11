Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E46665C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07010E826;
	Wed, 11 Jan 2023 21:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245A10E0E3;
 Wed, 11 Jan 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673473350; x=1705009350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8rP+hq5gDMmfXXDo6g29kdkS4ycmqqjJL0BHT/3j7k=;
 b=ZX7vUH4EQFj0LIMs4OpOzjnjg37KFS9B6qfpwK2KByevWmGFLK75Dsve
 i+20vZjbJW2YPKTwI0IKFhxCkTlIZq/KghNHf1psayw6yeGj3t5zAHrOI
 5vcD/SULirxfdyGOa5PGiJqqX1QinsRKb6RoqumMxpamsRSG16198Hr0e
 RP1Y5Aq6bxduEtielfoWv/Oce/pZVcdMdE+u0tr0RU5hf/xG6PSNC9M2Z
 4rrPWC5nLOwW91IXeZAqe6U3ruGEAxORgIEl80jPy718tCTXQtXGR0jXR
 rX2KZ1iLMruA6tjlUv0+cFtwFaEK663JvzCWO1bDlizCMwBVyTQ9DPjxP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322244748"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="322244748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 13:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607530429"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="607530429"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 13:42:29 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Date: Wed, 11 Jan 2023 13:42:21 -0800
Message-Id: <20230111214226.907536-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions into (new) common heci-packet-submission files
to handle generating the MTL GSC-CS Memory-Header and emitting of
the Heci-Cmd-Packet instructions that gets submitted to the engine.

NOTE1: This common functions for heci-packet-submission will be used by
different i915 callers:
     1- GSC-SW-Proxy: This is pending upstream publication awaiting
        a few remaining opens
     2- MTL-HDCP: An equivalent patch has also been published at:
        https://patchwork.freedesktop.org/series/111876/. (Patch 1)
     3- PXP: This series.

NOTE2: A difference in this patch vs what is appearing is in bullet 2
above is that HDCP (and SW-Proxy) will be using priveleged submission
(GGTT and common gsc-uc-context) while PXP will be using non-priveleged
PPGTT, context and batch buffer. Therefore this patch will only slightly
overlap with the MTL-HDCP patches despite have very similar function
names (emit_foo vs emit_nonpriv_foo). This is because HECI_CMD_PKT
instructions require very different flows and hw-specific code when done
via PPGTT based submission (not different from other engines). MTL-HDCP
contains the same intel_gsc_mtl_header_t structures as this but the
helpers there are different. Both add the same new file names.

NOTE3: Additional clarity about the heci-cmd-pkt layout and where the
       common helpers come in:
     - When an internal subsystem needs to send a command request
       to the security firmware on MTL onwards, it will send that
       via the GSC-engine-command-streamer.
     - However those commands, (lets call them "gsc_specific_fw_api"
       calls), are not understood by the GSC command streamer hw.
     - The command streamer DOES understand GSC_HECI_CMD_PKT but
       requires an additional header before the "gsc_specific_fw_api"
       is sent by the hw engine to the firmware (with additional
       metadata).
     - Thus, the structural layout of the request submitted would
       need to look like the diagram below (for non-priv PXP).
     - In the diagram, the common helper for HDCP, (GSC-Sw-Proxy) and
       PXP (i.e. new function intel_gsc_uc_heci_cmd_emit_mtl_header)
       will populate blob (C) while additional helpers different for
       GGTT (not in this series) vs PPGTT (this patch) will populate
       blobs (A) and (B) below.
      ___________________________________________________________
 (A)  |  MI_BATCH_BUFFER_START (ppgtt, batchbuff-addr, ...)     |
      |     |                                                   |
      |    _|________________________________________________   |
      | (B)| GSC_HECI_CMD_PKT (pkt-addr-in, pkt-size-in,    |   |
      |    |                   pkt-addr-out, pkt-size-out)  |--------
      |    | MI_BATCH_BUFFER_END                            |   |   |
      |    |________________________________________________|   |   |
      |                                                         |   |
      |_________________________________________________________|   |
                                                                    |
            ---------------------------------------------------------
            |
           \|/
      ______V___________________________________________
      |   _________________________________________    |
      |(C)|                                       |    |
      |   | struct intel_gsc_mtl_header {         |    |
      |   |   validity marker                     |    |
      |   |   heci_clent_id                       |    |
      |   |   ...                                 |    |
      |   |  }                                    |    |
      |   |_______________________________________|    |
      |(D)|                                       |    |
      |   | struct gsc_fw_specific_api_foobar {   |    |
      |   |     ...                               |    |
      |   |     For an example, see               |    |
      |   |     'struct pxp43_create_arb_in' at   |    |
      |   |     intel_pxp_cmd_interface_43.h      |    |
      |   |                                       |    |
      |   | }                                     |    |
      |   |  Struture depends on command type     |    |
      |   | struct gsc_fw_specific_api_foobar {   |    |
      |   |_______________________________________|    |
      |________________________________________________|

That said, this patch provides basic helpers but leaves the
PXP subsystem (i.e. the caller) to handle everything else from
input/output packet size verification to handling the
responses from security firmware (such as requiring a retry).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 107 ++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  69 +++++++++++
 4 files changed, 179 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index eae4325310e8..7dc18554da10 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -194,6 +194,7 @@ i915-y += \
 i915-y += \
 	  gt/uc/intel_gsc_fw.o \
 	  gt/uc/intel_gsc_uc.o \
+	  gt/uc/intel_gsc_uc_heci_cmd_submit.o \
 	  gt/uc/intel_guc.o \
 	  gt/uc/intel_guc_ads.o \
 	  gt/uc/intel_guc_capture.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 2af1ae3831df..454179884801 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -439,6 +439,8 @@
 #define GSC_FW_LOAD GSC_INSTR(1, 0, 2)
 #define   HECI1_FW_LIMIT_VALID (1 << 31)
 
+#define GSC_HECI_CMD_PKT GSC_INSTR(0, 0, 6)
+
 /*
  * Used to convert any address to canonical form.
  * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
new file mode 100644
index 000000000000..01bb7e587b1b
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include "i915_drv.h"
+#include "i915_vma.h"
+
+#include "gt/intel_gpu_commands.h"
+#include "gt/intel_context.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_ring.h"
+
+#include "intel_gsc_fw.h"
+#include "intel_gsc_uc.h"
+#include "intel_gsc_uc_heci_cmd_submit.h"
+
+void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
+					   u8 heci_client_id, u32 message_size,
+					   u64 host_session_id)
+{
+	host_session_id &= ~GSC_HECI_HOST_SESSION_USAGE_MASK;
+	if (heci_client_id == GSC_HECI_MEADDRESS_PXP)
+		host_session_id |= GSC_HECI_SESSION_PXP_SINGLE;
+
+	header->validity_marker = GSC_HECI_VALIDITY_MARKER;
+	header->heci_client_id = heci_client_id;
+	header->host_session_handle = host_session_id;
+	header->header_version = MTL_GSC_HECI_HEADER_VERSION;
+	header->message_size = message_size;
+}
+
+static void
+emit_gsc_heci_pkt_nonpriv(u32 *cs, struct intel_gsc_heci_non_priv_pkt *pkt)
+{
+	*cs++ = GSC_HECI_CMD_PKT;
+	*cs++ = lower_32_bits(pkt->addr_in);
+	*cs++ = upper_32_bits(pkt->addr_in);
+	*cs++ = pkt->size_in;
+	*cs++ = lower_32_bits(pkt->addr_out);
+	*cs++ = upper_32_bits(pkt->addr_out);
+	*cs++ = pkt->size_out;
+	*cs++ = 0;
+	*cs++ = MI_BATCH_BUFFER_END;
+}
+
+int
+intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
+				     struct intel_context *ce,
+				     struct intel_gsc_heci_non_priv_pkt *pkt,
+				     u32 *cs, int timeout_ms)
+{
+	struct intel_engine_cs *eng;
+	struct i915_request *rq;
+	int err;
+
+	rq = intel_context_create_request(ce);
+	if (IS_ERR(rq))
+		return PTR_ERR(rq);
+
+	emit_gsc_heci_pkt_nonpriv(cs, pkt);
+
+	i915_vma_lock(pkt->bb_vma);
+	err = i915_vma_move_to_active(pkt->bb_vma, rq, EXEC_OBJECT_WRITE);
+	i915_vma_unlock(pkt->bb_vma);
+
+	if (!err) {
+		i915_vma_lock(pkt->heci_pkt_vma);
+		err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
+		i915_vma_unlock(pkt->heci_pkt_vma);
+	}
+
+	eng = rq->context->engine;
+	if (!err && eng->emit_init_breadcrumb)
+		err = eng->emit_init_breadcrumb(rq);
+
+	if (!err)
+		err = eng->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
+
+	if (err) {
+		i915_request_add(rq);
+		return err;
+	}
+
+	i915_request_get(rq);
+
+	i915_request_add(rq);
+	if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
+			      msecs_to_jiffies(timeout_ms)) < 0) {
+		i915_request_put(rq);
+		return -ETIME;
+	}
+
+	i915_request_put(rq);
+
+	err = ce->engine->emit_flush(rq, 0);
+	if (err)
+		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
+			"Failed emit-flush for gsc-heci-non-priv-pkterr=%d\n", err);
+
+	if (unlikely(err))
+		i915_request_set_error_once(rq, err);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
new file mode 100644
index 000000000000..23155bed3fee
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _INTEL_GSC_UC_HECI_CMD_H_
+#define _INTEL_GSC_UC_HECI_CMD_H_
+
+#include <linux/types.h>
+
+struct i915_vma;
+struct intel_context;
+struct intel_gsc_uc;
+
+struct intel_gsc_mtl_header {
+	u32 validity_marker;
+#define GSC_HECI_VALIDITY_MARKER 0xA578875A
+
+	u8 heci_client_id;
+#define GSC_HECI_MEADDRESS_PXP 17
+#define GSC_HECI_MEADDRESS_HDCP 18
+
+	u8 reserved1;
+
+	u16 header_version;
+#define MTL_GSC_HECI_HEADER_VERSION 1
+
+	u64 host_session_handle;
+#define GSC_HECI_HOST_SESSION_USAGE_MASK REG_GENMASK64(63, 60)
+#define GSC_HECI_SESSION_PXP_SINGLE BIT_ULL(60)
+
+	u64 gsc_message_handle;
+
+	u32 message_size; /* lower 20 bits only, upper 12 are reserved */
+
+	/*
+	 * Flags mask:
+	 * Bit 0: Pending
+	 * Bit 1: Session Cleanup;
+	 * Bits 2-15: Flags
+	 * Bits 16-31: Extension Size
+	 */
+	u32 flags;
+#define GSC_HECI_FLAG_MSG_PENDING	BIT(0)
+#define GSC_HECI_FLAG_MSG_CLEANUP	BIT(1)
+
+	u32 status;
+} __packed;
+
+struct intel_gsc_heci_non_priv_pkt {
+	u64 addr_in;
+	u32 size_in;
+	u64 addr_out;
+	u32 size_out;
+	struct i915_vma *heci_pkt_vma;
+	struct i915_vma *bb_vma;
+};
+
+void
+intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
+				      u8 heci_client_id, u32 msg_size,
+				      u64 host_session_id);
+
+int
+intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
+				     struct intel_context *ce,
+				     struct intel_gsc_heci_non_priv_pkt *pkt,
+				     u32 *cs, int timeout_ms);
+#endif
-- 
2.39.0

