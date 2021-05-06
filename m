Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7C375AF7
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FFB6EDEF;
	Thu,  6 May 2021 18:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7B56ED0B;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: ekEJtKvkbgk84rooP8Y5wW4msUj+nn7mq1jhDc0gDBxS4xmNWlAdLwNwL3mt8o0YrQeRvUds2h
 GaaBSzSTf+Og==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195445"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: nCCSCNtGamKfBG8SCymS4JJQnM3mpMWeI092IytNCrzytPUqKg0PCpHNdwQR//0WGlULEzRc4y
 +DegopQvE4RQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583472"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 37/97] drm/i915/guc: Add stall timer to non blocking CTB
 send function
Date: Thu,  6 May 2021 12:13:51 -0700
Message-Id: <20210506191451.77768-38-matthew.brost@intel.com>
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

Implement a stall timer which fails H2G CTBs once a period of time
with no forward progress is reached to prevent deadlock.

Also update to ct_write to return -EDEADLK rather than -EPIPE on a
corrupted descriptor.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 48 +++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index af7314d45a78..4eab319d61be 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -69,6 +69,8 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
 #define CTB_G2H_BUFFER_SIZE	(SZ_4K)
 
+#define MAX_US_STALL_CTB	1000000
+
 struct ct_request {
 	struct list_head link;
 	u32 fence;
@@ -315,6 +317,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 
 	ct->requests.last_fence = 1;
 	ct->enabled = true;
+	ct->stall_time = KTIME_MAX;
 
 	return 0;
 
@@ -378,7 +381,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	unsigned int i;
 
 	if (unlikely(ctb->broken))
-		return -EPIPE;
+		return -EDEADLK;
 
 	if (unlikely(desc->status))
 		goto corrupted;
@@ -449,7 +452,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
-	return -EPIPE;
+	return -EDEADLK;
 }
 
 /**
@@ -494,6 +497,17 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	return err;
 }
 
+static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+{
+	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
+		MAX_US_STALL_CTB;
+
+	if (unlikely(ret))
+		CT_ERROR(ct, "CT deadlocked\n");
+
+	return ret;
+}
+
 static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 {
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -505,6 +519,26 @@ static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 	return space >= len_dw;
 }
 
+static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
+{
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+
+	lockdep_assert_held(&ct->ctbs.send.lock);
+
+	if (unlikely(!ctb_has_room(ctb, len_dw))) {
+		if (ct->stall_time == KTIME_MAX)
+			ct->stall_time = ktime_get();
+
+		if (unlikely(ct_deadlocked(ct)))
+			return -EDEADLK;
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
@@ -517,7 +551,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
 
 	spin_lock_irqsave(&ctb->lock, spin_flags);
 
-	ret = ctb_has_room(ctb, len + 1);
+	ret = has_room_nb(ct, len + 1);
 	if (unlikely(ret))
 		goto out;
 
@@ -561,11 +595,19 @@ static int ct_send(struct intel_guc_ct *ct,
 retry:
 	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
 	if (unlikely(!ctb_has_room(ctb, len + 1))) {
+		if (ct->stall_time == KTIME_MAX)
+			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+
+		if (unlikely(ct_deadlocked(ct)))
+			return -EDEADLK;
+
 		cond_resched();
 		goto retry;
 	}
 
+	ct->stall_time = KTIME_MAX;
+
 	fence = ct_get_next_fence(ct);
 	request.fence = fence;
 	request.status = 0;
-- 
2.28.0

