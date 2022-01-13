Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67B48D104
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5337710EF6C;
	Thu, 13 Jan 2022 03:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57D10EF6C;
 Thu, 13 Jan 2022 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642045437; x=1673581437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GAvbYN8Rj2KTi9JGqnfgDHrvy3g5t2P2w3EM85MuXes=;
 b=BIEh+wJ1TGU1BBDarxKljn+VOOmRtZwbOODJB+SJ9Fcb7mSYzqZbbgAD
 vJiaH7//vYWFh9bhJZSjNDqSNXAIfRfet6wgic5XWKko/JLTkpRr4pHvr
 mcR93EN0RMfat7IflIIQCZX5YSeNPiBktx6TRjMRis8WM+DQvI3t8qkJV
 2+MkBJ+xjMENrMP5knGlkLGGc9W/GyhBllKA3ZfxlkaOdOjkrgD3Ubxgn
 k4WNU1WCruLj3j7oTAXl1fSULcyWsLJH0DI/v9gmgEwWTj+IemcZ60kBH
 eaOzM0/ltu/uvX3c4SekwsDQcOkzLdCgoZMcE0IgCJZ3bSHm1LuJ9bq/S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241482702"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="241482702"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 19:43:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="691649597"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 19:43:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Flip guc_id allocation partition
Date: Wed, 12 Jan 2022 19:38:03 -0800
Message-Id: <20220113033803.14967-1-matthew.brost@intel.com>
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
Cc: tvrtko.ursulin@intel.com, piotr.piorkowski@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the multi-lrc guc_id from the lower allocation partition (0 to
number of multi-lrc guc_ids) to upper allocation partition (number of
single-lrc to max guc_ids).

This will help when a native driver transitions to a PF after driver
load time. If the perma-pin guc_ids (kernel contexts) are in a low range
it is easy reduce total number of guc_ids as the allocated slrc are in a
valid range the mlrc range moves to an unused range. Assuming no mlrc
are allocated and few slrc are used the native to PF transition is
seamless for the guc_id resource.

v2:
 (Michal / Tvrtko)
  - Add an explaination to commit message of why this patch is needed
 (Michal / Piotr)
  - Replace marcos with functions
 (Michal)
  - Rework logic flow in new_mlrc_guc_id
  - Unconditionally call bitmap_free

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 88 +++++++++++++------
 1 file changed, 63 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23a40f10d376d..3ae92260f8224 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -138,17 +138,6 @@ guc_create_parallel(struct intel_engine_cs **engines,
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
-/*
- * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
- * per the GuC submission interface. A different allocation algorithm is used
- * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
- * partition the guc_id space. We believe the number of multi-lrc contexts in
- * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
- * multi-lrc.
- */
-#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
-	((guc)->submission_state.num_guc_ids / 16)
-
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock.
@@ -1777,11 +1766,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
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
@@ -1864,6 +1848,57 @@ static void guc_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+/*
+ * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
+ * per the GuC submission interface. A different allocation algorithm is used
+ * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
+ * partition the guc_id space. We believe the number of multi-lrc contexts in
+ * use should be low and 1/16 should be sufficient.
+ */
+#define MLRC_GUC_ID_RATIO	16
+
+static int number_mlrc_guc_id(struct intel_guc *guc)
+{
+	return guc->submission_state.num_guc_ids / MLRC_GUC_ID_RATIO;
+}
+
+static int number_slrc_guc_id(struct intel_guc *guc)
+{
+	return guc->submission_state.num_guc_ids - number_mlrc_guc_id(guc);
+}
+
+static int mlrc_guc_id_base(struct intel_guc *guc)
+{
+	return number_slrc_guc_id(guc);
+}
+
+static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
+{
+	int ret;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
+
+	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
+				       number_mlrc_guc_id(guc),
+				       order_base_2(ce->parallel.number_children
+						    + 1));
+	if (unlikely(ret < 0))
+		return ret;
+
+	return ret + mlrc_guc_id_base(guc);
+}
+
+static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
+{
+	GEM_BUG_ON(intel_context_is_parent(ce));
+
+	return ida_simple_get(&guc->submission_state.guc_ids,
+			      0, number_slrc_guc_id(guc),
+			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+			      __GFP_NOWARN);
+}
+
 static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	int ret;
@@ -1871,16 +1906,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
 
@@ -1990,6 +2019,15 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 
 	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
 
+	/* Outside spin lock so we can sleep on alloc */
+	if (unlikely(intel_context_is_parent(ce) &&
+		     !guc->submission_state.guc_ids_bitmap)) {
+		guc->submission_state.guc_ids_bitmap =
+			bitmap_zalloc(number_mlrc_guc_id(guc), GFP_KERNEL);
+		if (!guc->submission_state.guc_ids_bitmap)
+			return -ENOMEM;
+	}
+
 try_again:
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
 
-- 
2.34.1

