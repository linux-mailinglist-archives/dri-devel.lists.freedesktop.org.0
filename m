Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C376DBA2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 01:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1910E586;
	Wed,  2 Aug 2023 23:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FE10E586;
 Wed,  2 Aug 2023 23:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019304; x=1722555304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xYyG6KUJst2lvyCaZcp1CQFnBeOQgqR/NNb3dixdZpc=;
 b=aSrPB+SaQhunFo3gYRxjhdSM2acSYXuTP3iauXey3F6ZhSd74p9fiW22
 1bs8QmzuKywA8S00WB6bJ4Xezqu/lmylP41HE54p2SWQoC6rO4mXgrJzA
 eWBO/kBX7fwpTBkXbAubNvNHxLsaCqzte00gLhlgJbGqBUPMBcgecGSjN
 CF5l4uIKa4BX8b8YzeV33c+958ziCPdoNm36K2wZzqyM26Wfb/G/NL8EZ
 GXOPyidNEYSZVC50bkIBMVC/MPpWDFu/XpdwGjwBNDh9lXuBufe0t90xX
 o1+nd/mCx/fC5p4s0izyjHemw19y6TaABLql6mih4mDRrQc1PGFVV3b6k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367185055"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="367185055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853030283"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="853030283"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 16:35:03 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Date: Wed,  2 Aug 2023 16:34:59 -0700
Message-Id: <20230802233501.17074-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Suspend is not like reset, it can unroll, so we have to properly
flush pending context-guc-id deregistrations to complete before
we return from suspend calls.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c             | 6 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h             | 1 +
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 5a942af0a14e..3162d859ed68 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -289,8 +289,10 @@ int intel_gt_resume(struct intel_gt *gt)
 
 static void wait_for_suspend(struct intel_gt *gt)
 {
-	if (!intel_gt_pm_is_awake(gt))
+	if (!intel_gt_pm_is_awake(gt)) {
+		intel_uc_suspend_prepare(&gt->uc);
 		return;
+	}
 
 	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
 		/*
@@ -299,6 +301,8 @@ static void wait_for_suspend(struct intel_gt *gt)
 		 */
 		intel_gt_set_wedged(gt);
 		intel_gt_retire_requests(gt);
+	} else {
+		intel_uc_suspend_prepare(&gt->uc);
 	}
 
 	intel_gt_pm_wait_for_idle(gt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..dc7735a19a5a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1578,6 +1578,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+void intel_guc_submission_suspend_prepare(struct intel_guc *guc)
+{
+	flush_work(&guc->submission_state.destroyed_worker);
+}
+
 static void guc_flush_destroyed_contexts(struct intel_guc *guc);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c57b29cdb1a6..7f0705ece74b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -38,6 +38,8 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 				   bool interruptible,
 				   long timeout);
 
+void intel_guc_submission_suspend_prepare(struct intel_guc *guc);
+
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
 	return guc->submission_supported;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 18250fb64bd8..468d7b397927 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -679,6 +679,13 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 	guc_disable_communication(guc);
 }
 
+void intel_uc_suspend_prepare(struct intel_uc *uc)
+{
+	struct intel_guc *guc = &uc->guc;
+
+	intel_guc_submission_suspend_prepare(guc);
+}
+
 void intel_uc_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 014bb7d83689..036877a07261 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -49,6 +49,7 @@ void intel_uc_reset_prepare(struct intel_uc *uc);
 void intel_uc_reset(struct intel_uc *uc, intel_engine_mask_t stalled);
 void intel_uc_reset_finish(struct intel_uc *uc);
 void intel_uc_cancel_requests(struct intel_uc *uc);
+void intel_uc_suspend_prepare(struct intel_uc *uc);
 void intel_uc_suspend(struct intel_uc *uc);
 void intel_uc_runtime_suspend(struct intel_uc *uc);
 int intel_uc_resume(struct intel_uc *uc);
-- 
2.39.0

