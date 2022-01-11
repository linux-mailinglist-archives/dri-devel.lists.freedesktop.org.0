Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E491A48B254
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 17:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E635710E54A;
	Tue, 11 Jan 2022 16:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140910E493;
 Tue, 11 Jan 2022 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641919037; x=1673455037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UqOiHDLP56nD/P5m6Thf/FxNrZhsnkb+fpb2TWLDnck=;
 b=FgnEjkfakp5tSRZunj2BdVnUwEzCXdbstNm85s6uCL5azTBzHMImsVCU
 izNXN0jaGE2OhA8wNYtXVlewPjJDr7qPxpHsn2r95DyUOsYGBVLBTOohO
 Me04tZmkFg+JMdPsMiGTwGSdzSsKEBgO5T0uJhZsYgYL1qbC+Z681HNrf
 tiX7eEI3lnAZscjtS3dsqErqC6Lf1SgfW/Z9WHxoTo9CUdM/9za7aKLWu
 w8Ff7KqD03CQO156N4luZtSRO2makpHHx17B7CKKQy4iepJ3WXptcUIAO
 RJlns6jagrkeBH32jc4PM/+4WRijkiyq6BNbZCRsGj2fH2hvJSpXtdUAx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243327031"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243327031"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 08:36:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="515149678"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 08:36:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Flip guc_id allocation partition
Date: Tue, 11 Jan 2022 08:30:19 -0800
Message-Id: <20220111163019.13694-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the multi-lrc guc_id from the lower allocation partition (0 to
number of multi-lrc guc_ids) to upper allocation partition (number of
single-lrc to max guc_ids).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9989d121127df..1bacc9621cea8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
  */
 #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
 	((guc)->submission_state.num_guc_ids / 16)
+#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
+	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))
 
 /*
  * Below is a set of functions which control the GuC scheduling state which
@@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
 
-	guc->submission_state.guc_ids_bitmap =
-		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
-	if (!guc->submission_state.guc_ids_bitmap)
-		return -ENOMEM;
-
 	spin_lock_init(&guc->timestamp.lock);
 	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
 	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
@@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	guc_flush_destroyed_contexts(guc);
 	guc_lrc_desc_pool_destroy(guc);
 	i915_sched_engine_put(guc->sched_engine);
-	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	if (guc->submission_state.guc_ids_bitmap)
+		bitmap_free(guc->submission_state.guc_ids_bitmap);
 }
 
 static inline void queue_request(struct i915_sched_engine *sched_engine,
@@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
+{
+	int ret;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
+
+	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
+				       NUMBER_MULTI_LRC_GUC_ID(guc),
+				       order_base_2(ce->parallel.number_children
+						    + 1));
+	if (likely(!(ret < 0)))
+		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);
+
+	return ret;
+}
+
+static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
+{
+	GEM_BUG_ON(intel_context_is_parent(ce));
+
+	return ida_simple_get(&guc->submission_state.guc_ids,
+			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),
+			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+			      __GFP_NOWARN);
+}
+
 static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	int ret;
@@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	GEM_BUG_ON(intel_context_is_child(ce));
 
 	if (intel_context_is_parent(ce))
-		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
-					      NUMBER_MULTI_LRC_GUC_ID(guc),
-					      order_base_2(ce->parallel.number_children
-							   + 1));
+		ret = new_mlrc_guc_id(guc, ce);
 	else
-		ret = ida_simple_get(&guc->submission_state.guc_ids,
-				     NUMBER_MULTI_LRC_GUC_ID(guc),
-				     guc->submission_state.num_guc_ids,
-				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
-				     __GFP_NOWARN);
+		ret = new_slrc_guc_id(guc, ce);
+
 	if (unlikely(ret < 0))
 		return ret;
 
@@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 
 	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
 
+	if (unlikely(intel_context_is_parent(ce) &&
+		     !guc->submission_state.guc_ids_bitmap)) {
+		guc->submission_state.guc_ids_bitmap =
+			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
+		if (!guc->submission_state.guc_ids_bitmap)
+			return -ENOMEM;
+	}
+
 try_again:
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
 
-- 
2.34.1

