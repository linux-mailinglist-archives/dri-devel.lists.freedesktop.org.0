Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34D7DEEF3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6D10E83B;
	Thu,  2 Nov 2023 09:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334EA10E837;
 Thu,  2 Nov 2023 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917578; x=1730453578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hH4BiIqtHgaOHdwWa31pBbOqXQ9rIeMRI87yRcpqYys=;
 b=O0Q3MXDuKvw9gLG4Mes7k8zcw25PEs1ms5HNXSGKJa8eAld0JGMt15O6
 gBw9cxxrdToWDLve4MYUguVg4B7anGgNC7WOzdh8HtJ+GhSYEqqX+LQ4Z
 /hbuE55Ah5BbOqeF7Hs5n66ByKG5UJKPlMuZrJo/smhGwZ9WxYtUYz+Y0
 CBwTMWm8jWxQuSxlA7J907mCglykZm2WDYXwhRdGBFSmqA+mwnRPgrI76
 dws+uRZe3jHqDW9OohK1jVWDqzP+tc/MN570ToSj82YyyMZ9HRQu9Uld7
 LeY+xLcqel4wecjyvCHuRq1mKL54L0JKry0uZb4dg/50GPVno1hi9EEps g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="385848231"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="385848231"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="754727067"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="754727067"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:32:56 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Move for_each_engine* out of i915_drv.h
Date: Thu,  2 Nov 2023 09:32:48 +0000
Message-Id: <20231102093248.362659-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102093248.362659-1-tvrtko.ursulin@linux.intel.com>
References: <20231102093248.362659-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Iterators operate on struct intel_gt so lets move it to intel_gt.h in
order to make i915_drv.h less of a dumping ground for stuff.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.h                 | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                    | 14 --------------
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |  2 ++
 5 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index d68675925b79..1d97c435a015 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -10,6 +10,7 @@
 #include "i915_request.h"
 #include "intel_engine_types.h"
 #include "intel_wakeref.h"
+#include "intel_gt.h"
 #include "intel_gt_pm.h"
 
 static inline bool
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 9ffdb05e231e..b0e453e27ea8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -171,6 +171,20 @@ void intel_gt_release_all(struct drm_i915_private *i915);
 	     (id__)++) \
 		for_each_if(((gt__) = (i915__)->gt[(id__)]))
 
+/* Simple iterator over all initialised engines */
+#define for_each_engine(engine__, gt__, id__) \
+	for ((id__) = 0; \
+	     (id__) < I915_NUM_ENGINES; \
+	     (id__)++) \
+		for_each_if ((engine__) = (gt__)->engine[(id__)])
+
+/* Iterator over subset of engines selected by mask */
+#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
+	for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
+	     (tmp__) ? \
+	     ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
+	     0;)
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
index 8f9b874fdc9c..3aa1d014c14d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
@@ -6,8 +6,8 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_drv.h" /* for_each_engine! */
 #include "intel_engine.h"
+#include "intel_gt.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_engines_debugfs.h"
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bf6ed434bb6b..f3be9033a93f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -396,20 +396,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
 	return i915->gt[0];
 }
 
-/* Simple iterator over all initialised engines */
-#define for_each_engine(engine__, gt__, id__) \
-	for ((id__) = 0; \
-	     (id__) < I915_NUM_ENGINES; \
-	     (id__)++) \
-		for_each_if ((engine__) = (gt__)->engine[(id__)])
-
-/* Iterator over subset of engines selected by mask */
-#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
-	for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
-	     (tmp__) ? \
-	     ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
-	     0;)
-
 #define rb_to_uabi_engine(rb) \
 	rb_entry_safe(rb, struct intel_engine_cs, uabi_node)
 
diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
index 03ea75cd84dd..4f98aa8a861e 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -24,6 +24,8 @@
 
 #include "../i915_selftest.h"
 
+#include "gt/intel_gt.h"
+
 static int intel_fw_table_check(const struct intel_forcewake_range *ranges,
 				unsigned int num_ranges,
 				bool is_watertight)
-- 
2.39.2

