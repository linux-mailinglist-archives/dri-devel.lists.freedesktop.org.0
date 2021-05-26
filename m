Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB223910B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 08:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F786EC11;
	Wed, 26 May 2021 06:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4D66EBB5;
 Wed, 26 May 2021 06:24:51 +0000 (UTC)
IronPort-SDR: 2KMq9T9Ifwak0V+tIxl8J7ug8XHWZxku9Kj35mcLqC46dBLD1APCzWmyom2tezD8jZEaDXi63Z
 Ql4CSN/U1loA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033750"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182033750"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:50 -0700
IronPort-SDR: TudJ9tju/dVP6cABrwJOcHdcmrIHhIjVNF9OpwiX+2TJoDUXamWAKWOexnEeV8aPKKreF5Rg8D
 dbArtAYlfOcQ==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="633376843"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/18] drm/i915/guc: Don't receive all G2H messages in irq
 handler
Date: Tue, 25 May 2021 23:42:36 -0700
Message-Id: <20210526064237.77853-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210526064237.77853-1-matthew.brost@intel.com>
References: <20210526064237.77853-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

In irq handler try to receive just single G2H message, let other
messages to be received from tasklet.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 67 ++++++++++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  3 +
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index b183c70cdd5c..6bc293dbe213 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -81,6 +81,7 @@ enum { CTB_SEND = 0, CTB_RECV = 1 };
 
 enum { CTB_OWNER_HOST = 0 };
 
+static void ct_receive_tasklet_func(struct tasklet_struct *t);
 static void ct_incoming_request_worker_func(struct work_struct *w);
 
 /**
@@ -95,6 +96,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	INIT_LIST_HEAD(&ct->requests.pending);
 	INIT_LIST_HEAD(&ct->requests.incoming);
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
+	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
 }
 
 static inline const char *guc_ct_buffer_type_to_str(u32 type)
@@ -244,6 +246,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
 {
 	GEM_BUG_ON(ct->enabled);
 
+	tasklet_kill(&ct->receive_tasklet);
 	i915_vma_unpin_and_release(&ct->vma, I915_VMA_RELEASE_MAP);
 	memset(ct, 0, sizeof(*ct));
 }
@@ -644,7 +647,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
 	CT_DEBUG(ct, "received %*ph\n", 4 * len, data);
 
 	desc->head = head * 4;
-	return 0;
+	return available - len;
 
 corrupted:
 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
@@ -680,10 +683,10 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
 	u32 status;
 	u32 datalen;
 	struct ct_request *req;
+	unsigned long flags;
 	bool found = false;
 
 	GEM_BUG_ON(!ct_header_is_response(header));
-	GEM_BUG_ON(!in_irq());
 
 	/* Response payload shall at least include fence and status */
 	if (unlikely(len < 2)) {
@@ -703,7 +706,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
 
 	CT_DEBUG(ct, "response fence %u status %#x\n", fence, status);
 
-	spin_lock(&ct->requests.lock);
+	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_for_each_entry(req, &ct->requests.pending, link) {
 		if (unlikely(fence != req->fence)) {
 			CT_DEBUG(ct, "request %u awaits response\n",
@@ -722,7 +725,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
 		found = true;
 		break;
 	}
-	spin_unlock(&ct->requests.lock);
+	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
 	if (!found)
 		CT_ERROR(ct, "Unsolicited response %*ph\n", msgsize, msg);
@@ -836,31 +839,55 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
 	return 0;
 }
 
+static int ct_receive(struct intel_guc_ct *ct)
+{
+	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ct->ctbs.recv.lock, flags);
+	ret = ct_read(ct, msg);
+	spin_unlock_irqrestore(&ct->ctbs.recv.lock, flags);
+	if (ret < 0)
+		return ret;
+
+	if (ct_header_is_response(msg[0]))
+		ct_handle_response(ct, msg);
+	else
+		ct_handle_request(ct, msg);
+
+	return ret;
+}
+
+static void ct_try_receive_message(struct intel_guc_ct *ct)
+{
+	int ret;
+
+	if (GEM_WARN_ON(!ct->enabled))
+		return;
+
+	ret = ct_receive(ct);
+	if (ret > 0)
+		tasklet_hi_schedule(&ct->receive_tasklet);
+}
+
+static void ct_receive_tasklet_func(struct tasklet_struct *t)
+{
+	struct intel_guc_ct *ct = from_tasklet(ct, t, receive_tasklet);
+
+	ct_try_receive_message(ct);
+}
+
 /*
  * When we're communicating with the GuC over CT, GuC uses events
  * to notify us about new messages being posted on the RECV buffer.
  */
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 {
-	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
-	unsigned long flags;
-	int err = 0;
-
 	if (unlikely(!ct->enabled)) {
 		WARN(1, "Unexpected GuC event received while CT disabled!\n");
 		return;
 	}
 
-	do {
-		spin_lock_irqsave(&ct->ctbs.recv.lock, flags);
-		err = ct_read(ct, msg);
-		spin_unlock_irqrestore(&ct->ctbs.recv.lock, flags);
-		if (err)
-			break;
-
-		if (ct_header_is_response(msg[0]))
-			err = ct_handle_response(ct, msg);
-		else
-			err = ct_handle_request(ct, msg);
-	} while (!err);
+	ct_try_receive_message(ct);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index bc52dc479a14..cb222f202301 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -6,6 +6,7 @@
 #ifndef _INTEL_GUC_CT_H_
 #define _INTEL_GUC_CT_H_
 
+#include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
@@ -55,6 +56,8 @@ struct intel_guc_ct {
 		struct intel_guc_ct_buffer recv;
 	} ctbs;
 
+	struct tasklet_struct receive_tasklet;
+
 	struct {
 		u32 last_fence; /* last fence used to send request */
 
-- 
2.28.0

