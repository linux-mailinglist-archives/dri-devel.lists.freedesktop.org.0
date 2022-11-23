Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07C636A1B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6410E603;
	Wed, 23 Nov 2022 19:51:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F055710E605;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233091; x=1700769091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4GrIhUsYC397bFtso+iDVktNlXMRhf5xMS9CLLHurs=;
 b=RRWnh4qgJ5VQ+WkKH49sJvcd3q12eorI1nM5ThhQDzr4D+zUcsvLb9Le
 dqxDGgjyZ6zBJzj6T5IAZ7mHFdgUxHDJPET6aWe+UGEhCkPd7HVyl50Pp
 NdgSLlIvN8W5XRTuc3H+XEfqnoi5/PjFB6UO5YbWL9V6QtO91FK1+slO4
 6lqDnqh/efdL371zWEvqPvL9pAEjtignaxqZ5HYcqqRzYWYwjtCP9HOiq
 CueQB3HW91Ou/VhxrKzj9xNT8A8NmqTYvP6GE8S3pD5RyfH04ZIsjP3vB
 1kF6kX9OVp6Ip2TctC80HQu3nZ6U+9Kk63S0BAlLQQylO2LOmkH8uOwRo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="301709233"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="301709233"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597799"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597799"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:29 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 4/5] drm/i915/guc: Add GuC CT specific debug print wrappers
Date: Wed, 23 Nov 2022 11:51:22 -0800
Message-Id: <20221123195123.1525100-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
References: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Re-work the existing GuC CT printers and extend as required to match
the new wrapping scheme.

v2: Improve probe_error definition (review feedback from MichalW).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 218 +++++++++++-----------
 1 file changed, 109 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 2b22065e87bf9..8800fe3c96caf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -11,6 +11,7 @@
 
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
+#include "intel_guc_print.h"
 #include "gt/intel_gt.h"
 
 static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
@@ -18,31 +19,44 @@ static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
 	return container_of(ct, struct intel_guc, ct);
 }
 
-static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
-{
-	return guc_to_gt(ct_to_guc(ct));
-}
-
 static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
 {
-	return ct_to_gt(ct)->i915;
-}
+	struct intel_guc *guc = ct_to_guc(ct);
+	struct intel_gt *gt = guc_to_gt(guc);
 
-static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
-{
-	return &ct_to_i915(ct)->drm;
+	return gt->i915;
 }
 
-#define CT_ERROR(_ct, _fmt, ...) \
-	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+#define ct_err(_ct, _fmt, ...) \
+	guc_err(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
+
+#define ct_warn(_ct, _fmt, ...) \
+	guc_warn(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
+
+#define ct_notice(_ct, _fmt, ...) \
+	guc_notice(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
+
+#define ct_info(_ct, _fmt, ...) \
+	guc_info(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
+
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
-#define CT_DEBUG(_ct, _fmt, ...) \
-	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+#define ct_dbg(_ct, _fmt, ...) \
+	guc_dbg(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
 #else
-#define CT_DEBUG(...)	do { } while (0)
+#define ct_dbg(...)	do { } while (0)
 #endif
-#define CT_PROBE_ERROR(_ct, _fmt, ...) \
-	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
+
+#define ct_probe_error(_ct, _fmt, ...) \
+	guc_probe_error(ct_to_guc(_ct), "CT " _fmt, ##__VA_ARGS__)
+
+#define ct_WARN_ON(_ct, _condition) \
+	ct_WARN(_ct, _condition, "%s", "ct_WARN_ON(" __stringify(_condition) ")")
+
+#define ct_WARN(_ct, _condition, _fmt, ...) \
+	guc_WARN(ct_to_guc(_ct), _condition, "CT " _fmt, ##__VA_ARGS__)
+
+#define ct_WARN_ONCE(_ct, _condition, _fmt, ...) \
+	guc_WARN_ONCE(ct_to_guc(_ct), _condition, "CT " _fmt, ##__VA_ARGS__)
 
 /**
  * DOC: CTB Blob
@@ -170,7 +184,7 @@ static int ct_control_enable(struct intel_guc_ct *ct, bool enable)
 	err = guc_action_control_ctb(ct_to_guc(ct), enable ?
 				     GUC_CTB_CONTROL_ENABLE : GUC_CTB_CONTROL_DISABLE);
 	if (unlikely(err))
-		CT_PROBE_ERROR(ct, "Failed to control/%s CTB (%pe)\n",
+		ct_probe_error(ct, "Failed to control/%s CTB (%pe)\n",
 			       str_enable_disable(enable), ERR_PTR(err));
 
 	return err;
@@ -201,7 +215,7 @@ static int ct_register_buffer(struct intel_guc_ct *ct, bool send,
 				   size);
 	if (unlikely(err))
 failed:
-		CT_PROBE_ERROR(ct, "Failed to register %s buffer (%pe)\n",
+		ct_probe_error(ct, "Failed to register %s buffer (%pe)\n",
 			       send ? "SEND" : "RECV", ERR_PTR(err));
 
 	return err;
@@ -235,21 +249,21 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
 	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
 	if (unlikely(err)) {
-		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
+		ct_probe_error(ct, "Failed to allocate %u for CTB data (%pe)\n",
 			       blob_size, ERR_PTR(err));
 		return err;
 	}
 
-	CT_DEBUG(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc, ct->vma), blob_size);
+	ct_dbg(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc, ct->vma), blob_size);
 
 	/* store pointers to desc and cmds for send ctb */
 	desc = blob;
 	cmds = blob + 2 * CTB_DESC_SIZE;
 	cmds_size = CTB_H2G_BUFFER_SIZE;
 	resv_space = 0;
-	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "send",
-		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
-		 resv_space);
+	ct_dbg(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "send",
+	       ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
+	       resv_space);
 
 	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size, resv_space);
 
@@ -258,9 +272,9 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
 	cmds_size = CTB_G2H_BUFFER_SIZE;
 	resv_space = G2H_ROOM_BUFFER_SIZE;
-	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "recv",
-		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
-		 resv_space);
+	ct_dbg(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "recv",
+	       ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
+	       resv_space);
 
 	guc_ct_buffer_init(&ct->ctbs.recv, desc, cmds, cmds_size, resv_space);
 
@@ -338,7 +352,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 	return 0;
 
 err_out:
-	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
+	ct_probe_error(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -387,14 +401,12 @@ static int ct_write(struct intel_guc_ct *ct,
 
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(tail != READ_ONCE(desc->tail))) {
-		CT_ERROR(ct, "Tail was modified %u != %u\n",
-			 desc->tail, tail);
+		ct_err(ct, "Tail was modified %u != %u\n", desc->tail, tail);
 		desc->status |= GUC_CTB_STATUS_MISMATCH;
 		goto corrupted;
 	}
 	if (unlikely(READ_ONCE(desc->head) >= size)) {
-		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
-			 desc->head, size);
+		ct_err(ct, "Invalid head offset %u >= %u)\n", desc->head, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
@@ -415,8 +427,8 @@ static int ct_write(struct intel_guc_ct *ct,
 		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
 			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 
-	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
-		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
+	ct_dbg(ct, "writing (tail %u) %*ph %*ph %*ph\n",
+	       tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
 
 	cmds[tail] = header;
 	tail = (tail + 1) % size;
@@ -447,8 +459,8 @@ static int ct_write(struct intel_guc_ct *ct,
 	return 0;
 
 corrupted:
-	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
-		 desc->head, desc->tail, desc->status);
+	ct_err(ct, "Corrupted descriptor on write head=%u tail=%u status=%#x\n",
+	       desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
 }
@@ -507,17 +519,14 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
 		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
 
-		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
-			 ktime_ms_delta(ktime_get(), ct->stall_time),
-			 send->status, recv->status);
-		CT_ERROR(ct, "H2G Space: %u (Bytes)\n",
-			 atomic_read(&ct->ctbs.send.space) * 4);
-		CT_ERROR(ct, "Head: %u (Dwords)\n", ct->ctbs.send.desc->head);
-		CT_ERROR(ct, "Tail: %u (Dwords)\n", ct->ctbs.send.desc->tail);
-		CT_ERROR(ct, "G2H Space: %u (Bytes)\n",
-			 atomic_read(&ct->ctbs.recv.space) * 4);
-		CT_ERROR(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
-		CT_ERROR(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
+		ct_err(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+		       ktime_ms_delta(ktime_get(), ct->stall_time), send->status, recv->status);
+		ct_err(ct, "H2G Space: %u (Bytes)\n", atomic_read(&ct->ctbs.send.space) * 4);
+		ct_err(ct, "Head: %u (Dwords)\n", ct->ctbs.send.desc->head);
+		ct_err(ct, "Tail: %u (Dwords)\n", ct->ctbs.send.desc->tail);
+		ct_err(ct, "G2H Space: %u (Bytes)\n", atomic_read(&ct->ctbs.recv.space) * 4);
+		ct_err(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
+		ct_err(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
 
 		ct->ctbs.send.broken = true;
 	}
@@ -563,8 +572,7 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
 
 	head = READ_ONCE(desc->head);
 	if (unlikely(head > ctb->size)) {
-		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
-			 head, ctb->size);
+		ct_err(ct, "Invalid head offset %u >= %u)\n", head, ctb->size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		ctb->broken = true;
 		return false;
@@ -715,17 +723,17 @@ static int ct_send(struct intel_guc_ct *ct,
 			/* wait_for_ct_request_update returns -ENODEV on reset/suspend in progress.
 			 * In this case, output is debug rather than error info
 			 */
-			CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
-				 action[0], request.fence);
+			ct_dbg(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
+			       action[0], request.fence);
 		else
-			CT_ERROR(ct, "No response for request %#x (fence %u)\n",
-				 action[0], request.fence);
+			ct_err(ct, "No response for request %#x (fence %u)\n",
+			       action[0], request.fence);
 		goto unlink;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
-		CT_DEBUG(ct, "retrying request %#x (%u)\n", *action,
-			 FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, *status));
+		ct_dbg(ct, "retrying request %#x (%u)\n", *action,
+		       FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, *status));
 		send_again = true;
 		goto unlink;
 	}
@@ -737,12 +745,12 @@ static int ct_send(struct intel_guc_ct *ct,
 
 	if (response_buf) {
 		/* There shall be no data in the status */
-		WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
+		ct_WARN_ON(ct, FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
 		/* Return actual response len */
 		err = request.response_len;
 	} else {
 		/* There shall be no response payload */
-		WARN_ON(request.response_len);
+		ct_WARN_ON(ct, request.response_len);
 		/* Return data decoded from the status dword */
 		err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);
 	}
@@ -771,7 +779,7 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		struct intel_guc *guc = ct_to_guc(ct);
 		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
 
-		WARN(!uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
+		ct_WARN(ct, !uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
 		return -ENODEV;
 	}
 
@@ -784,11 +792,11 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
 		if (ret != -ENODEV)
-			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
-				 action[0], ERR_PTR(ret), status);
+			ct_err(ct, "sending action %#x failed (%pe) status=%#X\n",
+			       action[0], ERR_PTR(ret), status);
 	} else if (unlikely(ret)) {
-		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
-			 action[0], ret, ret);
+		ct_dbg(ct, "send action %#x returned %d (%#x)\n",
+		       action[0], ret, ret);
 	}
 
 	return ret;
@@ -838,7 +846,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 			 * contexts/engines being reset. But should never happen as
 			 * no contexts should be active when CLIENT_RESET is sent.
 			 */
-			CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
+			ct_err(ct, "Unexpected G2H after GuC has stopped!\n");
 			status &= ~GUC_CTB_STATUS_UNUSED;
 		}
 
@@ -850,15 +858,13 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(head != READ_ONCE(desc->head))) {
-		CT_ERROR(ct, "Head was modified %u != %u\n",
-			 desc->head, head);
+		ct_err(ct, "Head was modified %u != %u\n", desc->head, head);
 		desc->status |= GUC_CTB_STATUS_MISMATCH;
 		goto corrupted;
 	}
 #endif
 	if (unlikely(tail >= size)) {
-		CT_ERROR(ct, "Invalid tail offset %u >= %u)\n",
-			 tail, size);
+		ct_err(ct, "Invalid tail offset %u >= %u)\n", tail, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
@@ -873,7 +879,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	/* beware of buffer wrap case */
 	if (unlikely(available < 0))
 		available += size;
-	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
+	ct_dbg(ct, "read available %d (%u:%u:%u)\n", available, head, tail, size);
 	GEM_BUG_ON(available < 0);
 
 	header = cmds[head];
@@ -882,24 +888,24 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	/* message len with header */
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
 	if (unlikely(len > (u32)available)) {
-		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
-			 4, &header,
-			 4 * (head + available - 1 > size ?
-			      size - head : available - 1), &cmds[head],
-			 4 * (head + available - 1 > size ?
-			      available - 1 - size + head : 0), &cmds[0]);
+		ct_err(ct, "Incomplete message %*ph %*ph %*ph\n",
+		       4, &header,
+		       4 * (head + available - 1 > size ?
+			    size - head : available - 1), &cmds[head],
+		       4 * (head + available - 1 > size ?
+			    available - 1 - size + head : 0), &cmds[0]);
 		desc->status |= GUC_CTB_STATUS_UNDERFLOW;
 		goto corrupted;
 	}
 
 	*msg = ct_alloc_msg(len);
 	if (!*msg) {
-		CT_ERROR(ct, "No memory for message %*ph %*ph %*ph\n",
-			 4, &header,
-			 4 * (head + available - 1 > size ?
-			      size - head : available - 1), &cmds[head],
-			 4 * (head + available - 1 > size ?
-			      available - 1 - size + head : 0), &cmds[0]);
+		ct_err(ct, "No memory for message %*ph %*ph %*ph\n",
+		       4, &header,
+		       4 * (head + available - 1 > size ?
+			    size - head : available - 1), &cmds[head],
+		       4 * (head + available - 1 > size ?
+			    available - 1 - size + head : 0), &cmds[0]);
 		return available;
 	}
 
@@ -909,7 +915,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 		(*msg)->msg[i] = cmds[head];
 		head = (head + 1) % size;
 	}
-	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
+	ct_dbg(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
 	/* update local copies */
 	ctb->head = head;
@@ -920,8 +926,8 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	return available - len;
 
 corrupted:
-	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
-		 desc->head, desc->tail, desc->status);
+	ct_err(ct, "Corrupted descriptor on read head=%u tail=%u status=%#x\n",
+	       desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
 }
@@ -944,18 +950,17 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_NO_RESPONSE_RETRY &&
 		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_FAILURE);
 
-	CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
+	ct_dbg(ct, "response fence %u status %#x\n", fence, hxg[0]);
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_for_each_entry(req, &ct->requests.pending, link) {
 		if (unlikely(fence != req->fence)) {
-			CT_DEBUG(ct, "request %u awaits response\n",
-				 req->fence);
+			ct_dbg(ct, "request %u awaits response\n", req->fence);
 			continue;
 		}
 		if (unlikely(datalen > req->response_len)) {
-			CT_ERROR(ct, "Response %u too long (datalen %u > %u)\n",
-				 req->fence, datalen, req->response_len);
+			ct_err(ct, "response %u too long (datalen %u > %u)\n",
+			       req->fence, datalen, req->response_len);
 			datalen = min(datalen, req->response_len);
 			err = -EMSGSIZE;
 		}
@@ -967,12 +972,11 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		break;
 	}
 	if (!found) {
-		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
-		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
-			 ct->requests.last_fence);
+		ct_err(ct, "Unsolicited response (fence %u)\n", fence);
+		ct_err(ct, "Could not find fence=%u, last_fence=%u\n", fence,
+		       ct->requests.last_fence);
 		list_for_each_entry(req, &ct->requests.pending, link)
-			CT_ERROR(ct, "request %u awaits response\n",
-				 req->fence);
+			ct_err(ct, "request %u awaits response\n", req->fence);
 		err = -ENOKEY;
 	}
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
@@ -998,7 +1002,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
 	len = hxg_len - GUC_HXG_MSG_MIN_LEN;
 
-	CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
+	ct_dbg(ct, "request %x %*ph\n", action, 4 * len, payload);
 
 	switch (action) {
 	case INTEL_GUC_ACTION_DEFAULT:
@@ -1016,9 +1020,6 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		break;
 	case INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
 		ret = intel_guc_error_capture_process_msg(guc, payload, len);
-		if (unlikely(ret))
-			CT_ERROR(ct, "error capture notification failed %x %*ph\n",
-				 action, 4 * len, payload);
 		break;
 	case INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION:
 		ret = intel_guc_engine_failure_process_msg(guc, payload, len);
@@ -1028,11 +1029,11 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		ret = 0;
 		break;
 	case INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
-		CT_ERROR(ct, "Received GuC crash dump notification!\n");
+		guc_err(guc, "notification: Crash dump!\n");
 		ret = 0;
 		break;
 	case INTEL_GUC_ACTION_NOTIFY_EXCEPTION:
-		CT_ERROR(ct, "Received GuC exception notification!\n");
+		guc_err(guc, "notification: Exception!\n");
 		ret = 0;
 		break;
 	default:
@@ -1041,8 +1042,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	}
 
 	if (unlikely(ret)) {
-		CT_ERROR(ct, "Failed to process request %04x (%pe)\n",
-			 action, ERR_PTR(ret));
+		ct_err(ct, "Failed to process request %04x (%pe)\n", action, ERR_PTR(ret));
 		return ret;
 	}
 
@@ -1070,8 +1070,8 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 
 	err = ct_process_request(ct, request);
 	if (unlikely(err)) {
-		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
-			 ERR_PTR(err), 4 * request->size, request->msg);
+		ct_err(ct, "Failed to process message (%pe) %*ph\n",
+		       ERR_PTR(err), 4 * request->size, request->msg);
 		ct_free_msg(request);
 	}
 
@@ -1149,8 +1149,8 @@ static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 
 	if (unlikely(err)) {
 failed:
-		CT_ERROR(ct, "Failed to handle HXG message (%pe) %*ph\n",
-			 ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
+		ct_err(ct, "Failed to handle HXG message (%pe) %*ph\n",
+		       ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
 	}
 	return err;
 }
@@ -1166,8 +1166,8 @@ static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 		err = -EOPNOTSUPP;
 
 	if (unlikely(err)) {
-		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
-			 ERR_PTR(err), 4 * msg->size, msg->msg);
+		ct_err(ct, "Failed to handle message (%pe) %*ph\n",
+		       ERR_PTR(err), 4 * msg->size, msg->msg);
 		ct_free_msg(msg);
 	}
 }
@@ -1198,7 +1198,7 @@ static void ct_try_receive_message(struct intel_guc_ct *ct)
 {
 	int ret;
 
-	if (GEM_WARN_ON(!ct->enabled))
+	if (ct_WARN_ON(ct, !ct->enabled))
 		return;
 
 	ret = ct_receive(ct);
@@ -1220,7 +1220,7 @@ static void ct_receive_tasklet_func(struct tasklet_struct *t)
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 {
 	if (unlikely(!ct->enabled)) {
-		WARN(1, "Unexpected GuC event received while CT disabled!\n");
+		ct_warn(ct, "Unexpected event received while disabled!\n");
 		return;
 	}
 
-- 
2.37.3

