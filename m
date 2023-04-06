Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D26D9F16
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076A10EC8D;
	Thu,  6 Apr 2023 17:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498910E0F6;
 Thu,  6 Apr 2023 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803068; x=1712339068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84jXgxvaqPq179g2GqEGQm21EyHy2XDAZJ1dzptsTOY=;
 b=AFTzn9oWeqHSRZORsQlDW0OEM0YDjuqfgOGBR57bjU4n5T5AYCv73AYf
 82kkwoZXRSfs9tNa+amQfm+gJfx+Eowryj/Jd1SE0wx4VuP9PWoHInkvl
 eyHU89DIMoIt8mHoRbhI3xjXk8i4oKuj7ldhX4HGUGquqYQf+c0uUa50y
 XUP/h5BCxBDpRRP0N5Zc2s7P6J3lZ5fVWLeVKvUAHUXGS7qxgPKHJW8Ma
 krr3UayLvIimVJNiLmfiVl7l71Nrq384q8LzNF3bWZI2Zw7jKA1LAfXh3
 Noxkzw7nPStuePEiQrcst6UieRhFZplXW4LXcym3sosrR8uF42ghsk+7A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345432454"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345432454"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680757350"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680757350"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 10:44:27 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Date: Thu,  6 Apr 2023 10:44:14 -0700
Message-Id: <20230406174419.471256-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions into a new file for heci-packet-submission.
The helpers will handle generating the MTL GSC-CS Memory-Header
and submission of the Heci-Cmd-Packet instructions to the engine.

NOTE1: These common functions for heci-packet-submission will be used
by different i915 callers:
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
instructions require different flows and hw-specific code when done
via PPGTT based submission (not different from other engines). MTL-HDCP
contains the same intel_gsc_mtl_header_t structures as this but the
helpers there are different. Both add the same new file names.

NOTE3: Additional clarity about the heci-cmd-pkt layout and where the
       common helpers come in:
     - On MTL, when an i915 subsystem needs to send a command request
       to the security firmware, it will send that via the GSC-
       engine-command-streamer.
     - However those commands, (lets call them "gsc_specific_fw_api"
       calls), are not understood by the GSC command streamer hw.
     - The GSC CS only looks at the GSC_HECI_CMD_PKT instruction and
       passes it along to the GSC firmware.
     - The GSC FW on the other hand needs additional metadata to know
       which usage service is being called (PXP, HDCP, proxy, etc) along
       with session specific info. Thus an extra header called GSC-CS
       HECI Memory Header, (C) in below diagram is prepended before
       the FW specific API, (D).
     - Thus, the structural layout of the request submitted would
       need to look like the diagram below (for non-priv PXP).
     - In the diagram, the common helper for HDCP, (GSC-Sw-Proxy) and
       PXP (i.e. new function intel_gsc_uc_heci_cmd_emit_mtl_header)
       will populate blob (C) while additional helpers, different for
       PPGGTT (this patch) vs GGTT (HDCP series) will populate
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
PXP subsystem (i.e. the caller) to handle (D) and everything
else such as input/output size verification or handling the
responses from security firmware (for example, requiring a retry).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 102 ++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  25 ++++-
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index ea0da06e2f39..12c2a0e1dd1e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
@@ -107,3 +108,104 @@ void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
 	header->header_version = MTL_GSC_HEADER_VERSION;
 	header->message_size = message_size;
 }
+
+static void
+emit_gsc_heci_pkt_nonpriv(u32 *cmd, struct intel_gsc_heci_non_priv_pkt *pkt)
+{
+	*cmd++ = GSC_HECI_CMD_PKT;
+	*cmd++ = lower_32_bits(pkt->addr_in);
+	*cmd++ = upper_32_bits(pkt->addr_in);
+	*cmd++ = pkt->size_in;
+	*cmd++ = lower_32_bits(pkt->addr_out);
+	*cmd++ = upper_32_bits(pkt->addr_out);
+	*cmd++ = pkt->size_out;
+	*cmd++ = 0;
+	*cmd++ = MI_BATCH_BUFFER_END;
+}
+
+int
+intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
+				     struct intel_context *ce,
+				     struct intel_gsc_heci_non_priv_pkt *pkt,
+				     u32 *cmd, int timeout_ms)
+{
+	struct intel_engine_cs *eng;
+	struct i915_gem_ww_ctx ww;
+	struct i915_request *rq;
+	int err, trials = 0;
+
+	i915_gem_ww_ctx_init(&ww, false);
+retry:
+	err = i915_gem_object_lock(pkt->bb_vma->obj, &ww);
+	if (err)
+		goto out_ww;
+	err = i915_gem_object_lock(pkt->heci_pkt_vma->obj, &ww);
+	if (err)
+		goto out_ww;
+	err = intel_context_pin_ww(ce, &ww);
+	if (err)
+		goto out_ww;
+
+	rq = i915_request_create(ce);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_unpin_ce;
+	}
+
+	emit_gsc_heci_pkt_nonpriv(cmd, pkt);
+
+	err = i915_vma_move_to_active(pkt->bb_vma, rq, EXEC_OBJECT_WRITE);
+	if (err)
+		goto out_rq;
+	err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
+	if (err)
+		goto out_rq;
+
+	eng = rq->context->engine;
+	if (eng->emit_init_breadcrumb) {
+		err = eng->emit_init_breadcrumb(rq);
+		if (err)
+			goto out_rq;
+	}
+
+	err = eng->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
+	if (err)
+		goto out_rq;
+
+	err = ce->engine->emit_flush(rq, 0);
+	if (err)
+		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
+			"Failed emit-flush for gsc-heci-non-priv-pkterr=%d\n", err);
+
+out_rq:
+	i915_request_get(rq);
+
+	if (unlikely(err))
+		i915_request_set_error_once(rq, err);
+
+	i915_request_add(rq);
+
+	if (!err) {
+		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
+				      msecs_to_jiffies(timeout_ms)) < 0)
+			err = -ETIME;
+	}
+
+	i915_request_put(rq);
+
+out_unpin_ce:
+	intel_context_unpin(ce);
+out_ww:
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&ww);
+		if (!err) {
+			if (++trials < 10)
+				goto retry;
+			else
+				err = EAGAIN;
+		}
+	}
+	i915_gem_ww_ctx_fini(&ww);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
index 3d56ae501991..3addce861854 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -8,7 +8,10 @@
 
 #include <linux/types.h>
 
+struct i915_vma;
+struct intel_context;
 struct intel_gsc_uc;
+
 struct intel_gsc_mtl_header {
 	u32 validity_marker;
 #define GSC_HECI_VALIDITY_MARKER 0xA578875A
@@ -47,7 +50,7 @@ struct intel_gsc_mtl_header {
 	 * we distinguish the flags using OUTFLAG or INFLAG
 	 */
 	u32 flags;
-#define GSC_OUTFLAG_MSG_PENDING	1
+#define GSC_OUTFLAG_MSG_PENDING 1
 
 	u32 status;
 } __packed;
@@ -58,4 +61,24 @@ int intel_gsc_uc_heci_cmd_submit_packet(struct intel_gsc_uc *gsc,
 void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
 					   u8 heci_client_id, u32 message_size,
 					   u64 host_session_id);
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
 #endif
-- 
2.39.0

