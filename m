Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C388375AB8
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFF6ECE2;
	Thu,  6 May 2021 18:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A206ED04;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: g2S4Pkob7CkIKaJK5GPVPUg2WdS+trTSrynnJ9mDbO18MlwWuXVz/tiaKzpq1btyyUQvDKRxND
 dulYiO/nFGfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531006"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531006"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: mCkfn/rCST/RZPoCvkGPgBrbuq14VKxEn3PvCvh135SV0T0GjiFI1x50EAXdxyAanyjs7kuKst
 82cdWRtSn93w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583475"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 38/97] drm/i915/guc: Optimize CTB writes and reads
Date: Thu,  6 May 2021 12:13:52 -0700
Message-Id: <20210506191451.77768-39-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CTB writes are now in the path of command submission and should be
optimized for performance. Rather than reading CTB descriptor values
(e.g. head, tail, size) which could result in accesses across the PCIe
bus, store shadow local copies and only read/write the descriptor
values when absolutely necessary.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 78 +++++++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 ++
 2 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 4eab319d61be..77dfbc94dcc3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -127,6 +127,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
 static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
 {
 	ctb->broken = false;
+	ctb->tail = 0;
+	ctb->head = 0;
+	ctb->space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size);
+
 	guc_ct_buffer_desc_init(ctb->desc);
 }
 
@@ -371,10 +375,8 @@ static int ct_write(struct intel_guc_ct *ct,
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
-	u32 head = desc->head;
-	u32 tail = desc->tail;
+	u32 tail = ctb->tail;
 	u32 size = ctb->size;
-	u32 used;
 	u32 header;
 	u32 hxg;
 	u32 *cmds = ctb->cmds;
@@ -386,25 +388,14 @@ static int ct_write(struct intel_guc_ct *ct,
 	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely((tail | head) >= size)) {
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
+	if (unlikely((desc->tail | desc->head) >= size)) {
 		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 head, tail, size);
+			 desc->head, desc->tail, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
-
-	/*
-	 * tail == head condition indicates empty. GuC FW does not support
-	 * using up the entire buffer to get tail == head meaning full.
-	 */
-	if (tail < head)
-		used = (size - head) + tail;
-	else
-		used = tail - head;
-
-	/* make sure there is a space including extra dw for the fence */
-	if (unlikely(used + len + 1 >= size))
-		return -ENOSPC;
+#endif
 
 	/*
 	 * dw0: CT header (including fence)
@@ -444,7 +435,9 @@ static int ct_write(struct intel_guc_ct *ct,
 	write_barrier(ct);
 
 	/* now update descriptor */
+	ctb->tail = tail;
 	WRITE_ONCE(desc->tail, tail);
+	ctb->space -= len + 1;
 
 	return 0;
 
@@ -460,7 +453,7 @@ static int ct_write(struct intel_guc_ct *ct,
  * @req:	pointer to pending request
  * @status:	placeholder for status
  *
- * For each sent request, Guc shall send bac CT response message.
+ * For each sent request, GuC shall send back CT response message.
  * Our message handler will update status of tracked request once
  * response message with given fence is received. Wait here and
  * check for valid response status value.
@@ -508,24 +501,35 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 	return ret;
 }
 
-static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
+static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
 {
-	struct guc_ct_buffer_desc *desc = ctb->desc;
-	u32 head = READ_ONCE(desc->head);
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+	u32 head;
 	u32 space;
 
-	space = CIRC_SPACE(desc->tail, head, ctb->size);
+	if (ctb->space >= len_dw)
+		return true;
+
+	head = READ_ONCE(ctb->desc->head);
+	if (unlikely(head > ctb->size)) {
+		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u size=%u\n",
+			  ctb->desc->head, ctb->desc->tail, ctb->size);
+		ctb->desc->status |= GUC_CTB_STATUS_OVERFLOW;
+		ctb->broken = true;
+		return false;
+	}
+
+	space = CIRC_SPACE(ctb->tail, head, ctb->size);
+	ctb->space = space;
 
 	return space >= len_dw;
 }
 
 static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
 {
-	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
-
 	lockdep_assert_held(&ct->ctbs.send.lock);
 
-	if (unlikely(!ctb_has_room(ctb, len_dw))) {
+	if (unlikely(!h2g_has_room(ct, len_dw))) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 
@@ -593,11 +597,11 @@ static int ct_send(struct intel_guc_ct *ct,
 	 * rare.
 	 */
 retry:
-	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
-	if (unlikely(!ctb_has_room(ctb, len + 1))) {
+	spin_lock_irqsave(&ctb->lock, flags);
+	if (unlikely(!h2g_has_room(ct, len + 1))) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
-		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+		spin_unlock_irqrestore(&ctb->lock, flags);
 
 		if (unlikely(ct_deadlocked(ct)))
 			return -EDEADLK;
@@ -620,7 +624,7 @@ static int ct_send(struct intel_guc_ct *ct,
 
 	err = ct_write(ct, action, len, fence, 0);
 
-	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+	spin_unlock_irqrestore(&ctb->lock, flags);
 
 	if (unlikely(err))
 		goto unlink;
@@ -708,7 +712,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
-	u32 head = desc->head;
+	u32 head = ctb->head;
 	u32 tail = desc->tail;
 	u32 size = ctb->size;
 	u32 *cmds = ctb->cmds;
@@ -723,12 +727,21 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely((tail | head) >= size)) {
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
+	if (unlikely((desc->tail | desc->head) >= size)) {
 		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
 			 head, tail, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
+#else
+	if (unlikely((tail | ctb->head) >= size)) {
+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
+			 head, tail, size);
+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
+		goto corrupted;
+	}
+#endif
 
 	/* tail == head condition indicates empty */
 	available = tail - head;
@@ -778,6 +791,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	}
 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
+	ctb->head = head;
 	/* now update descriptor */
 	WRITE_ONCE(desc->head, head);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 55ef7c52472f..9924335e2ee6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -33,6 +33,9 @@ struct intel_guc;
  * @desc: pointer to the buffer descriptor
  * @cmds: pointer to the commands buffer
  * @size: size of the commands buffer in dwords
+ * @head: local shadow copy of head in dwords
+ * @tail: local shadow copy of tail in dwords
+ * @space: local shadow copy of space in dwords
  * @broken: flag to indicate if descriptor data is broken
  */
 struct intel_guc_ct_buffer {
@@ -40,6 +43,9 @@ struct intel_guc_ct_buffer {
 	struct guc_ct_buffer_desc *desc;
 	u32 *cmds;
 	u32 size;
+	u32 tail;
+	u32 head;
+	u32 space;
 	bool broken;
 };
 
-- 
2.28.0

