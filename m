Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C20569B58A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 23:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5610E1F8;
	Fri, 17 Feb 2023 22:33:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C26C10E46F;
 Fri, 17 Feb 2023 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676673230; x=1708209230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zM8O8R67nZiRxPM8n1Fh3D857QGVC0L/ZJLCs+33Ofg=;
 b=diSbCUgVQRnxuckkF4kBaV8TRxynehHYwHeaGVYvMLHzAiLmb6UoPA2h
 WxAZXaQj8Vx28i56at5pkZe1ok8EVVLqpLMyFkJ6alo5udt6es14+inkF
 jItFNBiTjgVcBujqIXoB4MQ6U6b9VzcMEbrzkTc/M1prFSp0+cqOeUaA5
 8oC8PE75VaShS/ohoENfmnvNlp70wfTJwTGRF1wKXXGv0dWNp3GhMJJYk
 mH2jJrBYsymUZNKGSAFLAdPnQhaNPQDJPfpr4Rbub1++3siy36xfN05eH
 bEpfFfhRpd79ypiu555eYd2KW1TJwYcI7n0xbfJU9OpKFJOBUHCYWgW/4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320211571"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="320211571"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 14:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="664021159"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="664021159"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 14:33:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/2] drm/i915/guc: Improve clean up of busyness stats worker
Date: Fri, 17 Feb 2023 14:33:07 -0800
Message-Id: <20230217223308.3449737-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217223308.3449737-1-John.C.Harrison@Intel.com>
References: <20230217223308.3449737-1-John.C.Harrison@Intel.com>
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

The stats worker thread management was mis-matched between
enable/disable call sites. Fix those up. Also, abstract the
cancel/enable code into a helper function rather than replicating in
multiple places.

v2: Rename the helpers and wrap the enable as well as the cancel
(review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index be495e657d66b..a04d7049a2c2f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1352,6 +1352,16 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	return ns_to_ktime(total);
 }
 
+static void guc_enable_busyness_worker(struct intel_guc *guc)
+{
+	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
+}
+
+static void guc_cancel_busyness_worker(struct intel_guc *guc)
+{
+	cancel_delayed_work_sync(&guc->timestamp.work);
+}
+
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -1360,7 +1370,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
 	unsigned long flags;
 	ktime_t unused;
 
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	guc_cancel_busyness_worker(guc);
 
 	spin_lock_irqsave(&guc->timestamp.lock, flags);
 
@@ -1416,8 +1426,7 @@ static void guc_timestamp_ping(struct work_struct *wrk)
 
 	intel_gt_reset_unlock(gt, srcu);
 
-	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
-			 guc->timestamp.ping_delay);
+	guc_enable_busyness_worker(guc);
 }
 
 static int guc_action_enable_usage_stats(struct intel_guc *guc)
@@ -1436,16 +1445,15 @@ static void guc_init_engine_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
+	int ret;
 
-	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
-			 guc->timestamp.ping_delay);
-
-	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
-		int ret = guc_action_enable_usage_stats(guc);
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		ret = guc_action_enable_usage_stats(guc);
 
-		if (ret)
-			guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
-	}
+	if (ret)
+		guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
+	else
+		guc_enable_busyness_worker(guc);
 }
 
 void intel_guc_busyness_park(struct intel_gt *gt)
@@ -1460,7 +1468,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 	 * and causes an unclaimed register access warning. Cancel the worker
 	 * synchronously here.
 	 */
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	guc_cancel_busyness_worker(guc);
 
 	/*
 	 * Before parking, we should sample engine busyness stats if we need to.
@@ -1487,8 +1495,7 @@ void intel_guc_busyness_unpark(struct intel_gt *gt)
 	spin_lock_irqsave(&guc->timestamp.lock, flags);
 	guc_update_pm_timestamp(guc, &unused);
 	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
-	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
-			 guc->timestamp.ping_delay);
+	guc_enable_busyness_worker(guc);
 }
 
 static inline bool
@@ -4408,11 +4415,12 @@ void intel_guc_submission_enable(struct intel_guc *guc)
 	guc_init_global_schedule_policy(guc);
 }
 
+/* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	/* Note: By the time we're here, GuC may have already been reset */
+	guc_cancel_busyness_worker(guc);
 
 	/* Disable and route to host */
 	if (GRAPHICS_VER(gt->i915) >= 12)
-- 
2.39.1

