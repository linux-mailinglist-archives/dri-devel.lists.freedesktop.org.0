Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CFD67AB55
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907A10E746;
	Wed, 25 Jan 2023 08:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9472610E044;
 Wed, 25 Jan 2023 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674634015; x=1706170015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20ftOWcYuWn3+KhJjQ/B7rNmvceoq7OEAiHnyyuxjFs=;
 b=YM08PjJkRq+wwktqJRUZyW3r74i0/S1LwoF1pw1e57etjcHnEARc7fqp
 q7aOPtM+7TwMi5363/ptn49dneDXZDSc3QvB+sO1BqPyRWhtrBm4IAwim
 NUnwgx1tm6Z9GpMpFEj3vLBCAR4x/w2n1k9S425GpCYs/cMNUCqtNxS54
 ordWGXx8roNMUX+SBZ6+HiELifyK3VdwY64wegH5sxqiTxs1gxeer6SHG
 RQ5Gv6iCdNgBJdtK14usK61Sq8GIPnvTPyGJewotxu2UXKA6XDkpmnL7V
 4yRitNLFUcXL0TIaroc6+YwDCzugxPQMblJM5iC56H61DOrFSAyHlQO5o A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310079369"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310079369"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991180682"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="991180682"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 00:06:54 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Date: Wed, 25 Jan 2023 00:06:47 -0800
Message-Id: <20230125080651.100223-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add GSC engine based method for sending PXP firmware packets
to the GSC firmware for MTL (and future) products.

Use the newly added helpers to populate the GSC-CS memory
header and send the message packet to the FW by dispatching
the GSC_HECI_CMD_PKT instruction on the GSC engine.

We use non-priveleged batches for submission to GSC engine
and require two buffers for the request:
     - a buffer for the HECI packet that contains PXP FW commands
     - a batch-buffer that contains the engine instruction for
       sending the HECI packet to the GSC firmware.

Thus, add the allocation and freeing of these buffers in gsccs
init and fini.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |   4 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 174 +++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
 3 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index ad67e3f49c20..b2523d6918c7 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -12,6 +12,10 @@
 /* PXP-Cmd-Op definitions */
 #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
 
+/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
+#define PXP43_MAX_HECI_IN_SIZE (SZ_32K)
+#define PXP43_MAX_HECI_OUT_SIZE (SZ_32K)
+
 /* PXP-Input-Packet: HUC-Authentication */
 struct pxp43_start_huc_auth_in {
 	struct pxp_cmd_header header;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index b304864902c8..35b6bfa55dfc 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -6,12 +6,154 @@
 #include "gem/i915_gem_internal.h"
 
 #include "gt/intel_context.h"
+#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
 
 #include "i915_drv.h"
 #include "intel_pxp_cmd_interface_43.h"
 #include "intel_pxp_gsccs.h"
 #include "intel_pxp_types.h"
 
+__maybe_unused
+static int gsccs_send_message(struct intel_pxp *pxp,
+			      void *msg_in, size_t msg_in_size,
+			      void *msg_out, size_t msg_out_size_max,
+			      size_t *msg_out_len)
+{
+	struct intel_gt *gt = pxp->ctrl_gt;
+	struct drm_i915_private *i915 = gt->i915;
+	struct gsccs_session_resources *exec =  &pxp->gsccs_res;
+	struct intel_gsc_mtl_header *header = exec->pkt_vaddr;
+	struct intel_gsc_heci_non_priv_pkt pkt;
+	size_t max_msg_size;
+	u32 reply_size;
+	int ret;
+
+	if (!exec->ce)
+		return -ENODEV;
+
+	max_msg_size = PXP43_MAX_HECI_IN_SIZE - sizeof(*header);
+
+	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
+		return -ENOSPC;
+
+	mutex_lock(&pxp->tee_mutex);
+
+	if (!exec->pkt_vma || !exec->bb_vma)
+		return -ENOENT;
+
+	memset(header, 0, sizeof(*header));
+	intel_gsc_uc_heci_cmd_emit_mtl_header(header, GSC_HECI_MEADDRESS_PXP,
+					      msg_in_size + sizeof(*header),
+					      exec->host_session_handle);
+
+	memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
+
+	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
+	pkt.size_in = header->message_size;
+	pkt.addr_out = pkt.addr_in + PXP43_MAX_HECI_IN_SIZE;
+	pkt.size_out = msg_out_size_max + sizeof(*header);
+	pkt.heci_pkt_vma = exec->pkt_vma;
+	pkt.bb_vma = exec->bb_vma;
+
+	ret = intel_gsc_uc_heci_cmd_submit_nonpriv(&gt->uc.gsc,
+						   exec->ce, &pkt, exec->bb_vaddr, 500);
+	if (ret) {
+		drm_err(&i915->drm, "failed to send gsc PXP msg (%d)\n", ret);
+		goto unlock;
+	}
+
+	/* we keep separate location for reply, so get the response header loc first */
+	header = exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE;
+
+	/* Response validity marker, status and busyness */
+	if (header->validity_marker != GSC_HECI_VALIDITY_MARKER) {
+		drm_err(&i915->drm, "gsc PXP reply with invalid validity marker\n");
+		ret = -EINVAL;
+		goto unlock;
+	}
+	if (header->status != 0) {
+		drm_dbg(&i915->drm, "gsc PXP reply status has error = 0x%08x\n",
+			header->status);
+		ret = -EINVAL;
+		goto unlock;
+	}
+	if (header->flags & GSC_HECI_FLAG_MSG_PENDING) {
+		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
+		ret = -EAGAIN;
+		goto unlock;
+	}
+
+	reply_size = header->message_size - sizeof(*header);
+	if (reply_size > msg_out_size_max) {
+		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
+			 reply_size, msg_out_size_max);
+		reply_size = msg_out_size_max;
+	} else if (reply_size != msg_out_size_max) {
+		drm_dbg(&i915->drm, "caller unexpected PXP reply size %u (%ld)\n",
+			reply_size, msg_out_size_max);
+	}
+
+	memcpy(msg_out, exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE + sizeof(*header),
+	       reply_size);
+	if (msg_out_len)
+		*msg_out_len = reply_size;
+
+unlock:
+	mutex_unlock(&pxp->tee_mutex);
+	return ret;
+}
+
+static int
+gsccs_create_buffer(struct intel_gt *gt,
+		    const char *bufname, size_t size,
+		    struct i915_vma **vma, void **map)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct drm_i915_gem_object *obj;
+	int err = 0;
+
+	obj = i915_gem_object_create_internal(i915, size);
+	if (IS_ERR(obj)) {
+		drm_err(&i915->drm, "Failed to allocate gsccs backend %s.\n", bufname);
+		err = PTR_ERR(obj);
+		goto out_none;
+	}
+
+	*vma = i915_vma_instance(obj, gt->vm, NULL);
+	if (IS_ERR(*vma)) {
+		drm_err(&i915->drm, "Failed to vma-instance gsccs backend %s.\n", bufname);
+		err = PTR_ERR(*vma);
+		goto out_put;
+	}
+
+	/* return a virtual pointer */
+	*map = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(i915, obj, true));
+	if (IS_ERR(*map)) {
+		drm_err(&i915->drm, "Failed to map gsccs backend %s.\n", bufname);
+		err = PTR_ERR(*map);
+		goto out_put;
+	}
+
+	/* all PXP sessions commands are treated as non-priveleged */
+	err = i915_vma_pin(*vma, 0, 0, PIN_USER);
+	if (err) {
+		drm_err(&i915->drm, "Failed to vma-pin gsccs backend %s.\n", bufname);
+		goto out_unmap;
+	}
+
+	return 0;
+
+out_unmap:
+	i915_gem_object_unpin_map(obj);
+out_put:
+	i915_gem_object_put(obj);
+out_none:
+	*vma = NULL;
+	*map = NULL;
+
+	return err;
+}
+
 static void
 gsccs_destroy_execution_resource(struct intel_pxp *pxp)
 {
@@ -19,6 +161,10 @@ gsccs_destroy_execution_resource(struct intel_pxp *pxp)
 
 	if (strm_res->ce)
 		intel_context_put(strm_res->ce);
+	if (strm_res->bb_vma)
+		i915_vma_unpin_and_release(&strm_res->bb_vma, I915_VMA_RELEASE_MAP);
+	if (strm_res->pkt_vma)
+		i915_vma_unpin_and_release(&strm_res->pkt_vma, I915_VMA_RELEASE_MAP);
 
 	memset(strm_res, 0, sizeof(*strm_res));
 }
@@ -30,6 +176,7 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
 	struct intel_engine_cs *engine = gt->engine[GSC0];
 	struct intel_context *ce;
+	int err = 0;
 
 	/*
 	 * First, ensure the GSC engine is present.
@@ -40,11 +187,28 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 
 	mutex_init(&pxp->tee_mutex);
 
+	/*
+	 * Now, allocate, pin and map two objects, one for the heci message packet
+	 * and another for the batch buffer we submit into GSC engine (that includes the packet).
+	 * NOTE: GSC-CS backend is currently only supported on MTL, so we allocate shmem.
+	 */
+	err = gsccs_create_buffer(pxp->ctrl_gt, "Heci Packet",
+				  PXP43_MAX_HECI_IN_SIZE + PXP43_MAX_HECI_OUT_SIZE,
+				  &strm_res->pkt_vma, &strm_res->pkt_vaddr);
+	if (err)
+		return err;
+
+	err = gsccs_create_buffer(pxp->ctrl_gt, "Batch Buffer", PAGE_SIZE,
+				  &strm_res->bb_vma, &strm_res->bb_vaddr);
+	if (err)
+		goto free_pkt;
+
 	/* Finally, create an intel_context to be used during the submission */
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce)) {
 		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
-		return PTR_ERR(ce);
+		err = PTR_ERR(ce);
+		goto free_batch;
 	}
 	i915_vm_put(ce->vm);
 	ce->vm = i915_vm_get(pxp->ctrl_gt->vm);
@@ -52,6 +216,14 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 	strm_res->ce = ce;
 
 	return 0;
+
+free_pkt:
+	i915_vma_unpin_and_release(&strm_res->pkt_vma, I915_VMA_RELEASE_MAP);
+free_batch:
+	i915_vma_unpin_and_release(&strm_res->bb_vma, I915_VMA_RELEASE_MAP);
+	memset(strm_res, 0, sizeof(*strm_res));
+
+	return err;
 }
 
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index be51e43ac23d..87bfde0df561 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -38,6 +38,12 @@ struct intel_pxp {
 	struct gsccs_session_resources {
 		u64 host_session_handle; /* used by firmware to link commands to sessions */
 		struct intel_context *ce; /* context for gsc command submission */
+
+		struct i915_vma *pkt_vma; /* GSC FW cmd packet vma */
+		void *pkt_vaddr;  /* GSC FW cmd packet virt pointer */
+
+		struct i915_vma *bb_vma; /* HECI_PKT batch buffer vma */
+		void *bb_vaddr; /* HECI_PKT batch buffer virt pointer */
 	} gsccs_res;
 
 	/**
-- 
2.39.0

