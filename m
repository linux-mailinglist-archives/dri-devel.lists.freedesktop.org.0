Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B78AA103
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 19:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F3113E4C;
	Thu, 18 Apr 2024 17:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGBYxHVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4406113E4A;
 Thu, 18 Apr 2024 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713461099; x=1744997099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IVt3PMw1GHXRFNhTvveLPgWJE3WLBtp4TbWIOKXm5EQ=;
 b=PGBYxHVZW2vx+U08tzTmPUO1p0UvAFMpMlHX/N1WsK2An9m4sYxPi7fj
 PnhRw9R8ExZ5jkBbxDGyE3deWDzL+7Tt9xs2GXnWUKJxHDVBmK8bURSoR
 giE1RhnyrymoKr0qFAAqCZgz69OQEZqqnceQRy6Y/SmDroHjVsmK0KkjF
 fGb/7d2XaKqEi1KWICmDLGw1bFGynbee4BlgOj3EOo56UlHYYp9xUJT2Q
 MrlcRCa07ph2S/gxgF2Lz1+QAfGStLxR4vk9k0WOBf9rtn6b8JwnSzHU1
 Hz8hWHk9e0JOnQyuJjgZRnnj8/UuC84TugKTtFv8sUHxw51pBYtBPtltV A==;
X-CSE-ConnectionGUID: EWW/Ub+gQXiwir68erHy4g==
X-CSE-MsgGUID: 9dclE1o3S+CnQLiuZTq7Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34424187"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="34424187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:24:58 -0700
X-CSE-ConnectionGUID: 8VJbQQm6RXSIKmQeyUempw==
X-CSE-MsgGUID: 6HFtN6qST/OInAACMH8gjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27881196"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:24:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/3] drm/i915 Rename intel_engine_reset to
 intel_gt_engine_recover
Date: Thu, 18 Apr 2024 19:10:54 +0200
Message-ID: <20240418171055.31371-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240418171055.31371-1-nirmoy.das@intel.com>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel_engine_reset() not only reset a engine but also
tries to recover it so give it a proper name without
any functional changes.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++--
 drivers/gpu/drm/i915/gt/intel_reset.h         |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 20 +++++++++----------
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 +++---
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 89d4dc8b60c6..4f4cde55f621 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1171,7 +1171,7 @@ __sseu_finish(const char *name,
 	int ret = 0;
 
 	if (flags & TEST_RESET) {
-		ret = intel_engine_reset(ce->engine, "sseu");
+		ret = intel_gt_engine_recover(ce->engine, "sseu");
 		if (ret)
 			goto out;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 21829439e686..9485a622a704 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2404,7 +2404,7 @@ static void execlists_reset(struct intel_engine_cs *engine, const char *msg)
 
 	ring_set_paused(engine, 1); /* Freeze the current request in place */
 	execlists_capture(engine);
-	intel_engine_reset(engine, msg);
+	intel_gt_engine_recover(engine, msg);
 
 	tasklet_enable(&engine->sched_engine->tasklet);
 	clear_and_wake_up_bit(bit, lock);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index b825daace58e..6504e8ba9c58 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1348,7 +1348,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
 }
 
 /**
- * intel_engine_reset - reset GPU engine to recover from a hang
+ * intel_gt_engine_recover - reset GPU engine to recover from a hang
  * @engine: engine to reset
  * @msg: reason for GPU reset; or NULL for no drm_notice()
  *
@@ -1360,7 +1360,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
  *  - reset engine (which will force the engine to idle)
  *  - re-init/configure engine
  */
-int intel_engine_reset(struct intel_engine_cs *engine, const char *msg)
+int intel_gt_engine_recover(struct intel_engine_cs *engine, const char *msg)
 {
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index c00de353075c..be984357bf27 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -31,8 +31,8 @@ void intel_gt_handle_error(struct intel_gt *gt,
 void intel_gt_reset(struct intel_gt *gt,
 		    intel_engine_mask_t stalled_mask,
 		    const char *reason);
-int intel_engine_reset(struct intel_engine_cs *engine,
-		       const char *reason);
+int intel_gt_engine_recover(struct intel_engine_cs *engine,
+			    const char *reason);
 int __intel_engine_reset_bh(struct intel_engine_cs *engine,
 			    const char *reason);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 9ce8ff1c04fe..9bfda3f2bd24 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -495,9 +495,9 @@ static int igt_reset_nop_engine(void *arg)
 
 				i915_request_add(rq);
 			}
-			err = intel_engine_reset(engine, NULL);
+			err = intel_gt_engine_recover(engine, NULL);
 			if (err) {
-				pr_err("intel_engine_reset(%s) failed, err:%d\n",
+				pr_err("intel_gt_engine_recover(%s) failed, err:%d\n",
 				       engine->name, err);
 				break;
 			}
@@ -574,7 +574,7 @@ static int igt_reset_fail_engine(void *arg)
 					    &gt->reset.flags));
 
 		force_reset_timeout(engine);
-		err = intel_engine_reset(engine, NULL);
+		err = intel_gt_engine_recover(engine, NULL);
 		cancel_reset_timeout(engine);
 		if (err == 0) /* timeouts only generated on gen8+ */
 			goto skip;
@@ -623,9 +623,9 @@ static int igt_reset_fail_engine(void *arg)
 			}
 
 			if (count & 1) {
-				err = intel_engine_reset(engine, NULL);
+				err = intel_gt_engine_recover(engine, NULL);
 				if (err) {
-					GEM_TRACE_ERR("intel_engine_reset(%s) failed, err:%d\n",
+					GEM_TRACE_ERR("intel_gt_engine_recover(%s) failed, err:%d\n",
 						      engine->name, err);
 					GEM_TRACE_DUMP();
 					i915_request_put(last);
@@ -633,10 +633,10 @@ static int igt_reset_fail_engine(void *arg)
 				}
 			} else {
 				force_reset_timeout(engine);
-				err = intel_engine_reset(engine, NULL);
+				err = intel_gt_engine_recover(engine, NULL);
 				cancel_reset_timeout(engine);
 				if (err != -ETIMEDOUT) {
-					pr_err("intel_engine_reset(%s) did not fail, err:%d\n",
+					pr_err("intel_gt_engine_recover(%s) did not fail, err:%d\n",
 					       engine->name, err);
 					i915_request_put(last);
 					break;
@@ -765,9 +765,9 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 			}
 
 			if (!using_guc) {
-				err = intel_engine_reset(engine, NULL);
+				err = intel_gt_engine_recover(engine, NULL);
 				if (err) {
-					pr_err("intel_engine_reset(%s) failed, err:%d\n",
+					pr_err("intel_gt_engine_recover(%s) failed, err:%d\n",
 					       engine->name, err);
 					goto skip;
 				}
@@ -1085,7 +1085,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			}
 
 			if (!using_guc) {
-				err = intel_engine_reset(engine, NULL);
+				err = intel_gt_engine_recover(engine, NULL);
 				if (err) {
 					pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
 					       engine->name, test_name, err);
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index d73e438fb85f..b7b15dd3163f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -336,7 +336,7 @@ static int active_engine_reset(struct intel_context *ce,
 
 	err = request_add_spin(rq, &spin);
 	if (err == 0 && !using_guc)
-		err = intel_engine_reset(ce->engine, reason);
+		err = intel_gt_engine_recover(ce->engine, reason);
 
 	/* Ensure the reset happens and kills the engine */
 	if (err == 0)
@@ -356,7 +356,7 @@ static int __live_mocs_reset(struct live_mocs *mocs,
 
 	if (intel_has_reset_engine(gt)) {
 		if (!using_guc) {
-			err = intel_engine_reset(ce->engine, "mocs");
+			err = intel_gt_engine_recover(ce->engine, "mocs");
 			if (err)
 				return err;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..9eaa1aed9f58 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -115,7 +115,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	} else {
 		for_each_engine(engine, gt, id) {
 			if (mask & engine->mask)
-				intel_engine_reset(engine, NULL);
+				intel_gt_engine_recover(engine, NULL);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 14a8b25b6204..eb7516c7cb56 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -256,7 +256,7 @@ static int do_device_reset(struct intel_engine_cs *engine)
 
 static int do_engine_reset(struct intel_engine_cs *engine)
 {
-	return intel_engine_reset(engine, "live_workarounds");
+	return intel_gt_engine_recover(engine, "live_workarounds");
 }
 
 static int do_guc_reset(struct intel_engine_cs *engine)
@@ -1282,7 +1282,7 @@ live_engine_reset_workarounds(void *arg)
 				goto err;
 			}
 
-			ret = intel_engine_reset(engine, "live_workarounds:idle");
+			ret = intel_gt_engine_recover(engine, "live_workarounds:idle");
 			if (ret) {
 				pr_err("%s: Reset failed while idle\n", engine->name);
 				goto err;
@@ -1320,7 +1320,7 @@ live_engine_reset_workarounds(void *arg)
 		}
 
 		if (!using_guc) {
-			ret = intel_engine_reset(engine, "live_workarounds:active");
+			ret = intel_gt_engine_recover(engine, "live_workarounds:active");
 			if (ret) {
 				pr_err("%s: Reset failed on an active spinner\n",
 				       engine->name);
-- 
2.42.0

