Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4813B9503
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5156EB65;
	Thu,  1 Jul 2021 16:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879F6EB63;
 Thu,  1 Jul 2021 16:58:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208525585"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208525585"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 09:58:01 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644504681"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 09:58:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/i915/guc: Add stall timer to non blocking CTB send
 function
Date: Thu,  1 Jul 2021 10:15:48 -0700
Message-Id: <20210701171550.49353-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210701171550.49353-1-matthew.brost@intel.com>
References: <20210701171550.49353-1-matthew.brost@intel.com>
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

Implement a stall timer which fails H2G CTBs once a period of time
with no forward progress is reached to prevent deadlock.

v2:
 (Michal)
  - Improve error message in ct_deadlock()
  - Set broken when ct_deadlock() returns true
  - Return -EPIPE on ct_deadlock()
v3:
 (Michal)
  - Add ms to stall timer comment
 (Matthew)
  - Move broken check to intel_guc_ct_send()

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 62 ++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  4 ++
 2 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index fb825cc1d090..a9cb7b608520 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/circ_buf.h>
+#include <linux/ktime.h>
+#include <linux/time64.h>
+#include <linux/timekeeping.h>
 
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
@@ -316,6 +319,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 		goto err_deregister;
 
 	ct->enabled = true;
+	ct->stall_time = KTIME_MAX;
 
 	return 0;
 
@@ -388,9 +392,6 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
-	if (unlikely(ctb->broken))
-		return -EPIPE;
-
 	if (unlikely(desc->status))
 		goto corrupted;
 
@@ -506,6 +507,25 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	return err;
 }
 
+#define GUC_CTB_TIMEOUT_MS	1500
+static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+{
+	long timeout = GUC_CTB_TIMEOUT_MS;
+	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
+
+	if (unlikely(ret)) {
+		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
+		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
+
+		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+			 ktime_ms_delta(ktime_get(), ct->stall_time),
+			 send->status, recv->status);
+		ct->ctbs.send.broken = true;
+	}
+
+	return ret;
+}
+
 static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 {
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -517,6 +537,26 @@ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 	return space >= len_dw;
 }
 
+static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
+{
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+
+	lockdep_assert_held(&ct->ctbs.send.lock);
+
+	if (unlikely(!h2g_has_room(ctb, len_dw))) {
+		if (ct->stall_time == KTIME_MAX)
+			ct->stall_time = ktime_get();
+
+		if (unlikely(ct_deadlocked(ct)))
+			return -EPIPE;
+		else
+			return -EBUSY;
+	}
+
+	ct->stall_time = KTIME_MAX;
+	return 0;
+}
+
 static int ct_send_nb(struct intel_guc_ct *ct,
 		      const u32 *action,
 		      u32 len,
@@ -529,11 +569,9 @@ static int ct_send_nb(struct intel_guc_ct *ct,
 
 	spin_lock_irqsave(&ctb->lock, spin_flags);
 
-	ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
-	if (unlikely(!ret)) {
-		ret = -EBUSY;
+	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN);
+	if (unlikely(ret))
 		goto out;
-	}
 
 	fence = ct_get_next_fence(ct);
 	ret = ct_write(ct, action, len, fence, flags);
@@ -576,8 +614,13 @@ static int ct_send(struct intel_guc_ct *ct,
 retry:
 	spin_lock_irqsave(&ctb->lock, flags);
 	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
+		if (ct->stall_time == KTIME_MAX)
+			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ctb->lock, flags);
 
+		if (unlikely(ct_deadlocked(ct)))
+			return -EPIPE;
+
 		if (msleep_interruptible(sleep_period_ms))
 			return -EINTR;
 		sleep_period_ms = sleep_period_ms << 1;
@@ -585,6 +628,8 @@ static int ct_send(struct intel_guc_ct *ct,
 		goto retry;
 	}
 
+	ct->stall_time = KTIME_MAX;
+
 	fence = ct_get_next_fence(ct);
 	request.fence = fence;
 	request.status = 0;
@@ -647,6 +692,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
+	if (unlikely(ct->ctbs.send.broken))
+		return -EPIPE;
+
 	if (flags & INTEL_GUC_CT_SEND_NB)
 		return ct_send_nb(ct, action, len, flags);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 5bb8bef024c8..bee03794c1eb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
+#include <linux/ktime.h>
 
 #include "intel_guc_fwif.h"
 
@@ -68,6 +69,9 @@ struct intel_guc_ct {
 		struct list_head incoming; /* incoming requests */
 		struct work_struct worker; /* handler for incoming requests */
 	} requests;
+
+	/** @stall_time: time of first time a CTB submission is stalled */
+	ktime_t stall_time;
 };
 
 void intel_guc_ct_init_early(struct intel_guc_ct *ct);
-- 
2.28.0

