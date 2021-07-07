Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498B3BEFDD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 20:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3666E1B3;
	Wed,  7 Jul 2021 18:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706F6E1B1;
 Wed,  7 Jul 2021 18:52:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209326270"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209326270"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:52:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="428042573"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:52:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/56] drm/i915/guc: Optimize CTB writes and reads
Date: Wed,  7 Jul 2021 12:09:54 -0700
Message-Id: <20210707190954.165563-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210706222010.101522-1-matthew.brost@intel.com>
References: <20210706222010.101522-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CTB writes are now in the path of command submission and should be
optimized for performance. Rather than reading CTB descriptor values
(e.g. head, tail) which could result in accesses across the PCIe bus,
store shadow local copies and only read/write the descriptor values when
absolutely necessary. Also store the current space in the each channel
locally.

v2:
 (Michal)
  - Add additional sanity checks for head / tail pointers
  - Use GUC_CTB_HDR_LEN rather than magic 1
v3:
 (Michal / John H)
  - Drop redundant check of head value
v4:
 (John H)
  - Drop redundant checks of tail / head values

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 87 ++++++++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 ++
 2 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index db3e85b89573..37fe9f3bbce3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -130,6 +130,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
 static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
 {
 	ctb->broken = false;
+	ctb->tail = 0;
+	ctb->head = 0;
+	ctb->space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size);
+
 	guc_ct_buffer_desc_init(ctb->desc);
 }
 
@@ -383,10 +387,8 @@ static int ct_write(struct intel_guc_ct *ct,
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
 	u32 type;
@@ -396,25 +398,22 @@ static int ct_write(struct intel_guc_ct *ct,
 	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely((tail | head) >= size)) {
-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 head, tail, size);
+	GEM_BUG_ON(tail > size);
+
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
+	if (unlikely(tail != READ_ONCE(desc->tail))) {
+		CT_ERROR(ct, "Tail was modified %u != %u\n",
+			 desc->tail, ctb->tail);
+		desc->status |= GUC_CTB_STATUS_MISMATCH;
+		goto corrupted;
+	}
+	if (unlikely(desc->head >= size)) {
+		CT_ERROR(ct, "Invalid offsets head=%u (size=%u)\n",
+			 desc->head, size);
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
-	/* make sure there is a space including extra dw for the header */
-	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
-		return -ENOSPC;
+#endif
 
 	/*
 	 * dw0: CT header (including fence)
@@ -453,7 +452,9 @@ static int ct_write(struct intel_guc_ct *ct,
 	write_barrier(ct);
 
 	/* now update descriptor */
+	ctb->tail = tail;
 	WRITE_ONCE(desc->tail, tail);
+	ctb->space -= len + GUC_CTB_HDR_LEN;
 
 	return 0;
 
@@ -469,7 +470,7 @@ static int ct_write(struct intel_guc_ct *ct,
  * @req:	pointer to pending request
  * @status:	placeholder for status
  *
- * For each sent request, Guc shall send bac CT response message.
+ * For each sent request, GuC shall send back CT response message.
  * Our message handler will update status of tracked request once
  * response message with given fence is received. Wait here and
  * check for valid response status value.
@@ -525,24 +526,35 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 	return ret;
 }
 
-static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
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
+			 ctb->desc->head, ctb->desc->tail, ctb->size);
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
 
-	if (unlikely(!h2g_has_room(ctb, len_dw))) {
+	if (unlikely(!h2g_has_room(ct, len_dw))) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 
@@ -612,7 +624,7 @@ static int ct_send(struct intel_guc_ct *ct,
 	 */
 retry:
 	spin_lock_irqsave(&ctb->lock, flags);
-	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
+	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ctb->lock, flags);
@@ -732,7 +744,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
-	u32 head = desc->head;
+	u32 head = ctb->head;
 	u32 tail = desc->tail;
 	u32 size = ctb->size;
 	u32 *cmds = ctb->cmds;
@@ -747,9 +759,19 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely((tail | head) >= size)) {
-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 head, tail, size);
+	GEM_BUG_ON(head > size);
+
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
+	if (unlikely(head != READ_ONCE(desc->head))) {
+		CT_ERROR(ct, "Head was modified %u != %u\n",
+			 desc->head, ctb->head);
+		desc->status |= GUC_CTB_STATUS_MISMATCH;
+		goto corrupted;
+	}
+#endif
+	if (unlikely(tail >= size)) {
+		CT_ERROR(ct, "Invalid offsets tail=%u (size=%u)\n",
+			 tail, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
@@ -802,6 +824,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	}
 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
+	ctb->head = head;
 	/* now update descriptor */
 	WRITE_ONCE(desc->head, head);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index bee03794c1eb..edd1bba0445d 100644
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

