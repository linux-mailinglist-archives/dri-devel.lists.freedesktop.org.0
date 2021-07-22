Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB73D3079
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AF76F5CD;
	Thu, 22 Jul 2021 23:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E926D6F5BC;
 Thu, 22 Jul 2021 23:36:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="199037593"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="199037593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="470860960"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/33] drm/i915/selftest: Fix MOCS selftest for GuC submission
Date: Thu, 22 Jul 2021 16:54:21 -0700
Message-Id: <20210722235426.31831-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210722235426.31831-1-matthew.brost@intel.com>
References: <20210722235426.31831-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rahul Kumar Singh <rahul.kumar.singh@intel.com>

When GuC submission is enabled, the GuC controls engine resets. Rather
than explicitly triggering a reset, the driver must submit a hanging
context to GuC and wait for the reset to occur.

Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_mocs.c | 49 ++++++++++++++++++-------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index 8763bbeca0f7..b7314739ee40 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -10,6 +10,7 @@
 #include "gem/selftests/mock_context.h"
 #include "selftests/igt_reset.h"
 #include "selftests/igt_spinner.h"
+#include "selftests/intel_scheduler_helpers.h"
 
 struct live_mocs {
 	struct drm_i915_mocs_table table;
@@ -318,7 +319,8 @@ static int live_mocs_clean(void *arg)
 }
 
 static int active_engine_reset(struct intel_context *ce,
-			       const char *reason)
+			       const char *reason,
+			       bool using_guc)
 {
 	struct igt_spinner spin;
 	struct i915_request *rq;
@@ -335,9 +337,13 @@ static int active_engine_reset(struct intel_context *ce,
 	}
 
 	err = request_add_spin(rq, &spin);
-	if (err == 0)
+	if (err == 0 && !using_guc)
 		err = intel_engine_reset(ce->engine, reason);
 
+	/* Ensure the reset happens and kills the engine */
+	if (err == 0)
+		err = intel_selftest_wait_for_rq(rq);
+
 	igt_spinner_end(&spin);
 	igt_spinner_fini(&spin);
 
@@ -345,21 +351,23 @@ static int active_engine_reset(struct intel_context *ce,
 }
 
 static int __live_mocs_reset(struct live_mocs *mocs,
-			     struct intel_context *ce)
+			     struct intel_context *ce, bool using_guc)
 {
 	struct intel_gt *gt = ce->engine->gt;
 	int err;
 
 	if (intel_has_reset_engine(gt)) {
-		err = intel_engine_reset(ce->engine, "mocs");
-		if (err)
-			return err;
-
-		err = check_mocs_engine(mocs, ce);
-		if (err)
-			return err;
+		if (!using_guc) {
+			err = intel_engine_reset(ce->engine, "mocs");
+			if (err)
+				return err;
+
+			err = check_mocs_engine(mocs, ce);
+			if (err)
+				return err;
+		}
 
-		err = active_engine_reset(ce, "mocs");
+		err = active_engine_reset(ce, "mocs", using_guc);
 		if (err)
 			return err;
 
@@ -395,19 +403,32 @@ static int live_mocs_reset(void *arg)
 
 	igt_global_reset_lock(gt);
 	for_each_engine(engine, gt, id) {
+		bool using_guc = intel_engine_uses_guc(engine);
+		struct intel_selftest_saved_policy saved;
 		struct intel_context *ce;
+		int err2;
+
+		err = intel_selftest_modify_policy(engine, &saved);
+		if (err)
+			break;
 
 		ce = mocs_context_create(engine);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
-			break;
+			goto restore;
 		}
 
 		intel_engine_pm_get(engine);
-		err = __live_mocs_reset(&mocs, ce);
-		intel_engine_pm_put(engine);
 
+		err = __live_mocs_reset(&mocs, ce, using_guc);
+
+		intel_engine_pm_put(engine);
 		intel_context_put(ce);
+
+restore:
+		err2 = intel_selftest_restore_policy(engine, &saved);
+		if (err == 0)
+			err = err2;
 		if (err)
 			break;
 	}
-- 
2.28.0

