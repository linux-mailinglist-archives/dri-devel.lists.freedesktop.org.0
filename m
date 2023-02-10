Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4596915C4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 01:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D2910EC2B;
	Fri, 10 Feb 2023 00:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172C710EC17;
 Fri, 10 Feb 2023 00:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675989733; x=1707525733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pe1OQsYVdubuBFzBCr7K8P4kl2yRdPmn9WywJP5mzIQ=;
 b=Lb/CvPexcrRJw2hkeBKR3O3049syyceZqVkfgpsFQClqu915GpMWkn31
 vX8lQxtUCR8HZHwsFEtXuoR7Vmu5f+eQPlgNL2SuoTvTzuEhGg+YF0pqn
 e3FbeTqDdle4dfWKExpBcgRbKXPcxyz1au4WSx8VBAKCFe7IyFJMnZUC7
 H6VqZ3KnETCMlEK0BLJGyUXE93xuq3zRwUOTXM7Jz1caJFHJFKC/BZG02
 TGOHdbi6Egc/2DVMk5KuoTKA0WRgNluxpkZ6lA8mmXALwZ+HBlykye0ko
 Ku8OrN1uco0AhOM8HZIxWek/g5D3WfPRIXdM7g5F/JeALpG5H5uQa+cr2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327990100"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="327990100"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 16:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913342493"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="913342493"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 16:42:11 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Date: Thu,  9 Feb 2023 16:42:05 -0800
Message-Id: <20230210004209.1877143-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
References: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 223 +++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   7 +
 3 files changed, 232 insertions(+), 2 deletions(-)

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
index 13693e78b57e..51b9959f7813 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -6,19 +6,210 @@
 #include "gem/i915_gem_internal.h"
 
 #include "gt/intel_context.h"
+#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
 
 #include "i915_drv.h"
 #include "intel_pxp_cmd_interface_43.h"
 #include "intel_pxp_gsccs.h"
 #include "intel_pxp_types.h"
 
+static int gsccs_send_message(struct intel_pxp *pxp,
+			      void *msg_in, size_t msg_in_size,
+			      void *msg_out, size_t msg_out_size_max,
+			      size_t *msg_out_len,
+			      u64 *gsc_msg_handle_retry)
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
+	/* check if this is a host-session-handle cleanup call */
+	if (!msg_in && !msg_out)
+		header->flags |= GSC_HECI_FLAG_MSG_CLEANUP;
+
+	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
+	header->gsc_message_handle = *gsc_msg_handle_retry;
+
+	/* NOTE: zero size packets are used for session-cleanups */
+	if (msg_in && msg_in_size)
+		memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
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
+		/*
+		 * When the GSC firmware replies with pending bit, it means that the requested
+		 * operation has begun but the completion is pending and the caller needs
+		 * to re-request with the gsc_message_handle that was returned by the firmware.
+		 * until the pending bit is turned off.
+		 */
+		*gsc_msg_handle_retry = header->gsc_message_handle;
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
+	if (msg_out)
+		memcpy(msg_out, exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE + sizeof(*header),
+		       reply_size);
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
+static void
+gsccs_cleanup_fw_host_session_handle(struct intel_pxp *pxp)
+{
+	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
+	u64 gsc_session_retry = 0;
+	int ret, tries = 0;
+
+	/*
+	 * Keep sending request if GSC firmware was busy.
+	 * Based on specs, we can expects a worst case pending-bit
+	 * delay of 2000 milisecs.
+	 */
+	do {
+		ret = gsccs_send_message(pxp, NULL, 0, NULL, 0, NULL, &gsc_session_retry);
+		/* Only try again if gsc says so */
+		if (ret != -EAGAIN)
+			break;
+
+		msleep(20);
+	} while (++tries < 100);
+
+	if (ret)
+		drm_dbg(&i915->drm, "Failed to send gsccs msg host-session-cleanup: ret=[%d]\n",
+			ret);
+}
+
 static void
 gsccs_destroy_execution_resource(struct intel_pxp *pxp)
 {
 	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
 
+	if (strm_res->host_session_handle)
+		gsccs_cleanup_fw_host_session_handle(pxp);
 	if (strm_res->ce)
 		intel_context_put(strm_res->ce);
+	if (strm_res->bb_vma)
+		i915_vma_unpin_and_release(&strm_res->bb_vma, I915_VMA_RELEASE_MAP);
+	if (strm_res->pkt_vma)
+		i915_vma_unpin_and_release(&strm_res->pkt_vma, I915_VMA_RELEASE_MAP);
 
 	memset(strm_res, 0, sizeof(*strm_res));
 }
@@ -30,6 +221,7 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
 	struct intel_engine_cs *engine = gt->engine[GSC0];
 	struct intel_context *ce;
+	int err = 0;
 
 	/*
 	 * First, ensure the GSC engine is present.
@@ -38,16 +230,43 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 	if (!engine)
 		return -ENODEV;
 
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
-
 	strm_res->ce = ce;
 
+	/* initialize host-session-handle (for all i915-to-gsc-firmware PXP cmds) */
+	get_random_bytes(&strm_res->host_session_handle, sizeof(strm_res->host_session_handle));
+
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
index d3819ec81a0c..329d58adddd8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -37,6 +37,13 @@ struct intel_pxp {
 	 */
 	struct gsccs_session_resources {
 		struct intel_context *ce; /* context for gsc command submission */
+		u64 host_session_handle; /* used by firmware to tie commands to processes */
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

