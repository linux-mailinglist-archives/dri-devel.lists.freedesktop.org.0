Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0393B279E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5A36EA08;
	Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5C76E848;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: 5jPB1Yh7Lx+0tQe4u0OhMde4cbjCc40n9pR4xky/mF25dMor+pICNZXmw1qfW2xH5zwFTC4lKn
 wJ5g99+jkq+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346744"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346744"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: ab12i3mL+dp82DS4E90pjqfhy9hXNl19PU3RM0hW5PDeubOwTbLCUTt1NcbuIrb3a0R44CIHZq
 OicQiu3fnB9w==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390878"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/47] drm/i915/guc: Add stall timer to non blocking CTB send
 function
Date: Thu, 24 Jun 2021 00:04:34 -0700
Message-Id: <20210624070516.21893-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a stall timer which fails H2G CTBs once a period of time
with no forward progress is reached to prevent deadlock.

Also update to ct_write to return -EIO rather than -EPIPE on a
corrupted descriptor.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 47 +++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  4 ++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index c9a65d05911f..27ec30b5ef47 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -319,6 +319,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 		goto err_deregister;
 
 	ct->enabled = true;
+	ct->stall_time = KTIME_MAX;
 
 	return 0;
 
@@ -392,7 +393,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	unsigned int i;
 
 	if (unlikely(ctb->broken))
-		return -EPIPE;
+		return -EIO;
 
 	if (unlikely(desc->status))
 		goto corrupted;
@@ -464,7 +465,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
-	return -EPIPE;
+	return -EIO;
 }
 
 /**
@@ -507,6 +508,18 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	return err;
 }
 
+#define GUC_CTB_TIMEOUT_MS	1500
+static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+{
+	long timeout = GUC_CTB_TIMEOUT_MS;
+	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
+
+	if (unlikely(ret))
+		CT_ERROR(ct, "CT deadlocked\n");
+
+	return ret;
+}
+
 static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 {
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -518,6 +531,26 @@ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
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
+			return -EIO;
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
@@ -530,7 +563,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
 
 	spin_lock_irqsave(&ctb->lock, spin_flags);
 
-	ret = h2g_has_room(ctb, len + 1);
+	ret = has_room_nb(ct, len + 1);
 	if (unlikely(ret))
 		goto out;
 
@@ -574,11 +607,19 @@ static int ct_send(struct intel_guc_ct *ct,
 retry:
 	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
 	if (unlikely(!h2g_has_room(ctb, len + 1))) {
+		if (ct->stall_time == KTIME_MAX)
+			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+
+		if (unlikely(ct_deadlocked(ct)))
+			return -EIO;
+
 		cond_resched();
 		goto retry;
 	}
 
+	ct->stall_time = KTIME_MAX;
+
 	fence = ct_get_next_fence(ct);
 	request.fence = fence;
 	request.status = 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index eb69263324ba..55ef7c52472f 100644
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

