Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E280800AC7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 13:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E8C10E028;
	Fri,  1 Dec 2023 12:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBA010E028;
 Fri,  1 Dec 2023 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701433284; x=1732969284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BnxPjWLvey1gm7XDPC+pZ6i7cAtrs/FK+j3OUWvdNuI=;
 b=ilWVMtg8t4BB55ExiXzD1NLSQIKzAtvisF+UyhDpnrZ7m2xX1SnhcGmR
 E8Qs4PNWJeI/LTVM3seD5OLVFT8jPwrcMLrNj0zqKq+qp508vKnAkkuyw
 Zc5meIuFMMvMpF3TGEJcwUSoKzfuTA3Q495XRrl6dwSrsOCZY+0pdoQFj
 4hhQ2tHgZYB0ksG7EuLOnc8ES9o329GCn9Q/DT0pr1JgDlTRW0H85Ay2v
 jNgEfJiAfLBiHj9Tday8BwFhmRqjXeRba6/RIllf40dlmExAbzchrgZ0e
 RtYScYkfuVhaKSeCMWEIISaHYGRBbgf+Rb1zpRRQn/pqrkxgspRlgesah w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="15033462"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="15033462"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 04:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="835761550"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="835761550"
Received: from istokes-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.227.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 04:21:17 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/selftests: Fix engine reset count storage for
 multi-tile
Date: Fri,  1 Dec 2023 12:21:08 +0000
Message-Id: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Engine->id namespace is per-tile so struct igt_live_test->reset_engine[]
needs to be two-dimensional so engine reset counts from all tiles can be
stored with no aliasing. With aliasing, if we had a real multi-tile
platform, the reset counts would be incorrect for same engine instance on
different tiles.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 0c29efa23f5c ("drm/i915/selftests: Consider multi-gt instead of to_gt()")
Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/selftests/igt_live_test.c | 9 +++++----
 drivers/gpu/drm/i915/selftests/igt_live_test.h | 3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
index 4ddc6d902752..7d41874a49c5 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
@@ -37,8 +37,9 @@ int igt_live_test_begin(struct igt_live_test *t,
 		}
 
 		for_each_engine(engine, gt, id)
-			t->reset_engine[id] =
-			i915_reset_engine_count(&i915->gpu_error, engine);
+			t->reset_engine[i][id] =
+				i915_reset_engine_count(&i915->gpu_error,
+							engine);
 	}
 
 	t->reset_global = i915_reset_count(&i915->gpu_error);
@@ -66,14 +67,14 @@ int igt_live_test_end(struct igt_live_test *t)
 
 	for_each_gt(gt, i915, i) {
 		for_each_engine(engine, gt, id) {
-			if (t->reset_engine[id] ==
+			if (t->reset_engine[i][id] ==
 			    i915_reset_engine_count(&i915->gpu_error, engine))
 				continue;
 
 			gt_err(gt, "%s(%s): engine '%s' was reset %d times!\n",
 			       t->func, t->name, engine->name,
 			       i915_reset_engine_count(&i915->gpu_error, engine) -
-			       t->reset_engine[id]);
+			       t->reset_engine[i][id]);
 			return -EIO;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.h b/drivers/gpu/drm/i915/selftests/igt_live_test.h
index 36ed42736c52..83e3ad430922 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.h
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.h
@@ -7,6 +7,7 @@
 #ifndef IGT_LIVE_TEST_H
 #define IGT_LIVE_TEST_H
 
+#include "gt/intel_gt_defines.h" /* for I915_MAX_GT */
 #include "gt/intel_engine.h" /* for I915_NUM_ENGINES */
 
 struct drm_i915_private;
@@ -17,7 +18,7 @@ struct igt_live_test {
 	const char *name;
 
 	unsigned int reset_global;
-	unsigned int reset_engine[I915_NUM_ENGINES];
+	unsigned int reset_engine[I915_MAX_GT][I915_NUM_ENGINES];
 };
 
 /*
-- 
2.40.1

