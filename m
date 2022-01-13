Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9748DBDB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1BB10E43D;
	Thu, 13 Jan 2022 16:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD94210E11D;
 Thu, 13 Jan 2022 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642091621; x=1673627621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xYWjvymHgFVnPfT8FYqwGnGzVZI581j5O57ArIWzSPo=;
 b=jgHnPzy74E/DBBIvpqqE8sTYw6lzRMhrXnnBo9TRzVl4OobsqFu6Siu7
 BMXnA/oQFyxCc92BN1e6ZV3be702ASHG65iIDertnjYob95HUGJZprire
 yWHN4KSxH6hQKmSjHKiIWu7QazUkTZVFlg5DgfJMY198ZQPpcKcaGRIoL
 XsPiHFaWensKOkDha9rVXEzHDUhDOuPathgwKHIUcLm7nBfnpg3sRYOSs
 lq5Q1PgKdKZpQoHWfkAhWV0ZoyZkY19TAMadh/zLwuvEwJ2JESyFjN8BH
 OioI6N0VDAkci/B0mbKSgXmwbPwRlUIGCsuqWHRKT4GgB0vHLZ8yTPte3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243844467"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="243844467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 08:33:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="763311386"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 08:33:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Flip guc_id allocation partition
Date: Thu, 13 Jan 2022 08:27:47 -0800
Message-Id: <20220113162747.4017-1-matthew.brost@intel.com>
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
Cc: michal.wajdeczko@intel.com
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
v3:
 (Michal)
  - Move allocation of mlrc bitmap back submission init
 (CI)
  - Resend for CI

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 77 ++++++++++++++-----
 1 file changed, 56 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23a40f10d376d..fce58365b3ff8 100644
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
@@ -1746,6 +1735,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 }
 
 static void destroyed_worker_func(struct work_struct *w);
+static int number_mlrc_guc_id(struct intel_guc *guc);
 
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
@@ -1778,7 +1768,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
 		  destroyed_worker_func);
 
 	guc->submission_state.guc_ids_bitmap =
-		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
+		bitmap_zalloc(number_mlrc_guc_id(guc), GFP_KERNEL);
 	if (!guc->submission_state.guc_ids_bitmap)
 		return -ENOMEM;
 
@@ -1864,6 +1854,57 @@ static void guc_submit_request(struct i915_request *rq)
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
@@ -1871,16 +1912,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
 
-- 
2.34.1

