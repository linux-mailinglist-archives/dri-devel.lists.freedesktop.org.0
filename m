Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB23B55B8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 00:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617F6E155;
	Sun, 27 Jun 2021 22:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25946E0BF;
 Sun, 27 Jun 2021 22:56:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="206039731"
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; d="scan'208";a="206039731"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2021 15:56:48 -0700
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; d="scan'208";a="625049906"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2021 15:56:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/i915/guc: Add non blocking CTB send function
Date: Sun, 27 Jun 2021 16:14:36 -0700
Message-Id: <20210627231439.138612-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210627231439.138612-1-matthew.brost@intel.com>
References: <20210627231439.138612-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add non blocking CTB send function, intel_guc_send_nb. GuC submission
will send CTBs in the critical path and does not need to wait for these
CTBs to complete before moving on, hence the need for this new function.

The non-blocking CTB now must have a flow control mechanism to ensure
the buffer isn't overrun. A lazy spin wait is used as we believe the
flow control condition should be rare with a properly sized buffer.

The function, intel_guc_send_nb, is exported in this patch but unused.
Several patches later in the series make use of this function.

v2:
 (Michal)
  - Use define for H2G room calculations
  - Move INTEL_GUC_SEND_NB define
 (Daniel Vetter)
  - Use msleep_interruptible rather than cond_resched

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gt/uc/abi/guc_communication_ctb_abi.h     |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 11 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 90 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +-
 4 files changed, 94 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index e933ca02d0eb..99e1fad5ca20 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -79,7 +79,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  *  +---+-------+--------------------------------------------------------------+
  */
 
-#define GUC_CTB_MSG_MIN_LEN			1u
+#define GUC_CTB_HDR_LEN				1u
+#define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
 #define GUC_CTB_MSG_MAX_LEN			256u
 #define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
 #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 4abc59f6f3cd..efc690fc8fb1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -74,7 +74,14 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 static
 inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
 {
-	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0);
+	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
+}
+
+static
+inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
+{
+	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
+				 INTEL_GUC_SEND_NB);
 }
 
 static inline int
@@ -82,7 +89,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
 			   u32 *response_buf, u32 response_buf_size)
 {
 	return intel_guc_ct_send(&guc->ct, action, len,
-				 response_buf, response_buf_size);
+				 response_buf, response_buf_size, 0);
 }
 
 static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 43e03aa2dde8..90ee95a240e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -3,6 +3,11 @@
  * Copyright © 2016-2019 Intel Corporation
  */
 
+#include <linux/circ_buf.h>
+#include <linux/ktime.h>
+#include <linux/time64.h>
+#include <linux/timekeeping.h>
+
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
 #include "gt/intel_gt.h"
@@ -373,7 +378,7 @@ static void write_barrier(struct intel_guc_ct *ct)
 static int ct_write(struct intel_guc_ct *ct,
 		    const u32 *action,
 		    u32 len /* in dwords */,
-		    u32 fence)
+		    u32 fence, u32 flags)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -409,7 +414,7 @@ static int ct_write(struct intel_guc_ct *ct,
 		used = tail - head;
 
 	/* make sure there is a space including extra dw for the fence */
-	if (unlikely(used + len + 1 >= size))
+	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
 		return -ENOSPC;
 
 	/*
@@ -421,9 +426,13 @@ static int ct_write(struct intel_guc_ct *ct,
 		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
 		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
 
-	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
-			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
+	hxg = (flags & INTEL_GUC_SEND_NB) ?
+		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
+		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
+			    GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
+		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
+			    GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
 
 	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
 		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
@@ -500,6 +509,48 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	return err;
 }
 
+static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
+{
+	struct guc_ct_buffer_desc *desc = ctb->desc;
+	u32 head = READ_ONCE(desc->head);
+	u32 space;
+
+	space = CIRC_SPACE(desc->tail, head, ctb->size);
+
+	return space >= len_dw;
+}
+
+static int ct_send_nb(struct intel_guc_ct *ct,
+		      const u32 *action,
+		      u32 len,
+		      u32 flags)
+{
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+	unsigned long spin_flags;
+	u32 fence;
+	int ret;
+
+	spin_lock_irqsave(&ctb->lock, spin_flags);
+
+	ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
+	if (unlikely(!ret)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	fence = ct_get_next_fence(ct);
+	ret = ct_write(ct, action, len, fence, flags);
+	if (unlikely(ret))
+		goto out;
+
+	intel_guc_notify(ct_to_guc(ct));
+
+out:
+	spin_unlock_irqrestore(&ctb->lock, spin_flags);
+
+	return ret;
+}
+
 static int ct_send(struct intel_guc_ct *ct,
 		   const u32 *action,
 		   u32 len,
@@ -507,8 +558,10 @@ static int ct_send(struct intel_guc_ct *ct,
 		   u32 response_buf_size,
 		   u32 *status)
 {
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct ct_request request;
 	unsigned long flags;
+	unsigned int sleep_period_ms = 1;
 	u32 fence;
 	int err;
 
@@ -516,8 +569,24 @@ static int ct_send(struct intel_guc_ct *ct,
 	GEM_BUG_ON(!len);
 	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
 	GEM_BUG_ON(!response_buf && response_buf_size);
+	might_sleep();
+
+	/*
+	 * We use a lazy spin wait loop here as we believe that if the CT
+	 * buffers are sized correctly the flow control condition should be
+	 * rare.
+	 */
+retry:
+	spin_lock_irqsave(&ctb->lock, flags);
+	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
+		spin_unlock_irqrestore(&ctb->lock, flags);
 
-	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
+		if (msleep_interruptible(sleep_period_ms))
+			return -EINTR;
+		sleep_period_ms = sleep_period_ms << 1;
+
+		goto retry;
+	}
 
 	fence = ct_get_next_fence(ct);
 	request.fence = fence;
@@ -529,9 +598,9 @@ static int ct_send(struct intel_guc_ct *ct,
 	list_add_tail(&request.link, &ct->requests.pending);
 	spin_unlock(&ct->requests.lock);
 
-	err = ct_write(ct, action, len, fence);
+	err = ct_write(ct, action, len, fence, 0);
 
-	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+	spin_unlock_irqrestore(&ctb->lock, flags);
 
 	if (unlikely(err))
 		goto unlink;
@@ -571,7 +640,7 @@ static int ct_send(struct intel_guc_ct *ct,
  * Command Transport (CT) buffer based GuC send function.
  */
 int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
-		      u32 *response_buf, u32 response_buf_size)
+		      u32 *response_buf, u32 response_buf_size, u32 flags)
 {
 	u32 status = ~0; /* undefined */
 	int ret;
@@ -581,6 +650,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
+	if (flags & INTEL_GUC_SEND_NB)
+		return ct_send_nb(ct, action, len, flags);
+
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
 		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 1ae2dde6db93..f6a4d5b33467 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -42,7 +42,6 @@ struct intel_guc_ct_buffer {
 	bool broken;
 };
 
-
 /** Top-level structure for Command Transport related data
  *
  * Includes a pair of CT buffers for bi-directional communication and tracking
@@ -87,8 +86,9 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
 	return ct->enabled;
 }
 
+#define INTEL_GUC_SEND_NB		BIT(31)
 int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
-		      u32 *response_buf, u32 response_buf_size);
+		      u32 *response_buf, u32 response_buf_size, u32 flags);
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
 
 #endif /* _INTEL_GUC_CT_H_ */
-- 
2.28.0

