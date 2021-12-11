Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D2471500
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0010E5F2;
	Sat, 11 Dec 2021 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454D310E5FF;
 Sat, 11 Dec 2021 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244475; x=1670780475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jaCS0XMFCrae8Su33E7J0Rx/nsJ2glq4igpMu1fVzX0=;
 b=eHDeXScZR7IQG/7tRhbsrRE2ORqnHHVl6MMxyzo/EN49GbyC8YH42opo
 F1ScB9Sb5UikSzfa1ho3Q5ksSXh3tfqZAn4c9QgoJk9SanzaP/1PqFyga
 XPlLcbFGukui2GulujrY+oTcep0AgEp5ihxS1izRwF10RrE9KQaqyuNR2
 rwt+ygqLVv1194F3ydwQui2zE2zDToxryCJvitC4QLcqTlDUP7/abGSt3
 CgtgX4ZAWklolMeuf3LO4I7AhmS+VkYLpkP5JVdyhmebp7XpbsBLLu0vI
 3MbH3nPHToiWMq2XvRZdgLu1lSCdx51TjT3DfiKiwIFXSVMBfJ011IoIK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238493215"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="238493215"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="602548114"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/i915/guc: Don't hog IRQs when destroying contexts
Date: Sat, 11 Dec 2021 09:35:42 -0800
Message-Id: <20211211173545.23536-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211173545.23536-1-matthew.brost@intel.com>
References: <20211211173545.23536-1-matthew.brost@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

While attempting to debug a CT deadlock issue in various CI failures
(most easily reproduced with gem_ctx_create/basic-files), I was seeing
CPU deadlock errors being reported. This were because the context
destroy loop was blocking waiting on H2G space from inside an IRQ
spinlock. There no was deadlock as such, it's just that the H2G queue
was full of context destroy commands and GuC was taking a long time to
process them. However, the kernel was seeing the large amount of time
spent inside the IRQ lock as a dead CPU. Various Bad Things(tm) would
then happen (heartbeat failures, CT deadlock errors, outstanding H2G
WARNs, etc.).

Re-working the loop to only acquire the spinlock around the list
management (which is all it is meant to protect) rather than the
entire destroy operation seems to fix all the above issues.

v2:
 (John Harrison)
  - Fix typo in comment message

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 ++++++++++++-------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 36c2965db49b..96fcf869e3ff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2644,7 +2644,6 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	unsigned long flags;
 	bool disabled;
 
-	lockdep_assert_held(&guc->submission_state.lock);
 	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
 	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
@@ -2660,7 +2659,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	}
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	if (unlikely(disabled)) {
-		__release_guc_id(guc, ce);
+		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
 		return;
 	}
@@ -2694,36 +2693,48 @@ static void __guc_context_destroy(struct intel_context *ce)
 
 static void guc_flush_destroyed_contexts(struct intel_guc *guc)
 {
-	struct intel_context *ce, *cn;
+	struct intel_context *ce;
 	unsigned long flags;
 
 	GEM_BUG_ON(!submission_disabled(guc) &&
 		   guc_submission_initialized(guc));
 
-	spin_lock_irqsave(&guc->submission_state.lock, flags);
-	list_for_each_entry_safe(ce, cn,
-				 &guc->submission_state.destroyed_contexts,
-				 destroyed_link) {
-		list_del_init(&ce->destroyed_link);
-		__release_guc_id(guc, ce);
+	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
+		spin_lock_irqsave(&guc->submission_state.lock, flags);
+		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
+					      struct intel_context,
+					      destroyed_link);
+		if (ce)
+			list_del_init(&ce->destroyed_link);
+		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+		if (!ce)
+			break;
+
+		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
 	}
-	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 }
 
 static void deregister_destroyed_contexts(struct intel_guc *guc)
 {
-	struct intel_context *ce, *cn;
+	struct intel_context *ce;
 	unsigned long flags;
 
-	spin_lock_irqsave(&guc->submission_state.lock, flags);
-	list_for_each_entry_safe(ce, cn,
-				 &guc->submission_state.destroyed_contexts,
-				 destroyed_link) {
-		list_del_init(&ce->destroyed_link);
+	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
+		spin_lock_irqsave(&guc->submission_state.lock, flags);
+		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
+					      struct intel_context,
+					      destroyed_link);
+		if (ce)
+			list_del_init(&ce->destroyed_link);
+		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+		if (!ce)
+			break;
+
 		guc_lrc_desc_unpin(ce);
 	}
-	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 }
 
 static void destroyed_worker_func(struct work_struct *w)
-- 
2.33.1

