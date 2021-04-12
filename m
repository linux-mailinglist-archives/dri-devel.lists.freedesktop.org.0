Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED735BF7E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2536E082;
	Mon, 12 Apr 2021 09:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD1C89E2A;
 Mon, 12 Apr 2021 09:09:21 +0000 (UTC)
IronPort-SDR: N9JaQ4mR04KPYdtFnD6TND5av/abItEso5OJbABc+DIW1qw4kpG5InFA9DFd5wPfElddH3wNzO
 LiUMXcw2gmUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709702"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:21 -0700
IronPort-SDR: FSJZBByyqQjUzo4TOYmUlJ7XZG+jsiuz4Aba2GRLbTOWpvr/8PyXl3aHDLA/VxawH4ui16M0Li
 dDbxcM1N0NNg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712590"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/19] drm/i915/selftests: Only query RAPL for integrated
 power measurements
Date: Mon, 12 Apr 2021 10:05:09 +0100
Message-Id: <20210412090526.30547-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

RAPL provides an on-package power measurements which does not encompass
discrete graphics, so let's avoid using the igfx masurements when testing
dgfx. Later we will abstract the simple librapl interface over hwmon so
that we can verify basic power consumption scenarios.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_rc6.c   | 32 +++++++++++++++---------
 drivers/gpu/drm/i915/gt/selftest_rps.c   |  2 +-
 drivers/gpu/drm/i915/selftests/librapl.c | 10 ++++++++
 drivers/gpu/drm/i915/selftests/librapl.h |  4 +++
 4 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
index f097e420ac45..710f825f6e5a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
@@ -34,6 +34,7 @@ int live_rc6_manual(void *arg)
 	struct intel_rc6 *rc6 = &gt->rc6;
 	u64 rc0_power, rc6_power;
 	intel_wakeref_t wakeref;
+	bool has_power;
 	ktime_t dt;
 	u64 res[2];
 	int err = 0;
@@ -50,6 +51,7 @@ int live_rc6_manual(void *arg)
 	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
 		return 0;
 
+	has_power = librapl_supported(gt->i915);
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
 	/* Force RC6 off for starters */
@@ -71,11 +73,14 @@ int live_rc6_manual(void *arg)
 		goto out_unlock;
 	}
 
-	rc0_power = div64_u64(NSEC_PER_SEC * rc0_power, ktime_to_ns(dt));
-	if (!rc0_power) {
-		pr_err("No power measured while in RC0\n");
-		err = -EINVAL;
-		goto out_unlock;
+	if (has_power) {
+		rc0_power = div64_u64(NSEC_PER_SEC * rc0_power,
+				      ktime_to_ns(dt));
+		if (!rc0_power) {
+			pr_err("No power measured while in RC0\n");
+			err = -EINVAL;
+			goto out_unlock;
+		}
 	}
 
 	/* Manually enter RC6 */
@@ -97,13 +102,16 @@ int live_rc6_manual(void *arg)
 		err = -EINVAL;
 	}
 
-	rc6_power = div64_u64(NSEC_PER_SEC * rc6_power, ktime_to_ns(dt));
-	pr_info("GPU consumed %llduW in RC0 and %llduW in RC6\n",
-		rc0_power, rc6_power);
-	if (2 * rc6_power > rc0_power) {
-		pr_err("GPU leaked energy while in RC6!\n");
-		err = -EINVAL;
-		goto out_unlock;
+	if (has_power) {
+		rc6_power = div64_u64(NSEC_PER_SEC * rc6_power,
+				      ktime_to_ns(dt));
+		pr_info("GPU consumed %llduW in RC0 and %llduW in RC6\n",
+			rc0_power, rc6_power);
+		if (2 * rc6_power > rc0_power) {
+			pr_err("GPU leaked energy while in RC6!\n");
+			err = -EINVAL;
+			goto out_unlock;
+		}
 	}
 
 	/* Restore what should have been the original state! */
diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index 967641fee42a..adf7fdbc00f7 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -1139,7 +1139,7 @@ int live_rps_power(void *arg)
 	if (!intel_rps_is_enabled(rps) || INTEL_GEN(gt->i915) < 6)
 		return 0;
 
-	if (!librapl_energy_uJ())
+	if (!librapl_supported(gt->i915))
 		return 0;
 
 	if (igt_spinner_init(&spin, gt))
diff --git a/drivers/gpu/drm/i915/selftests/librapl.c b/drivers/gpu/drm/i915/selftests/librapl.c
index 58710ac3f979..eb03b5b28bad 100644
--- a/drivers/gpu/drm/i915/selftests/librapl.c
+++ b/drivers/gpu/drm/i915/selftests/librapl.c
@@ -5,8 +5,18 @@
 
 #include <asm/msr.h>
 
+#include "i915_drv.h"
 #include "librapl.h"
 
+bool librapl_supported(const struct drm_i915_private *i915)
+{
+	/* Discrete cards require hwmon integration */
+	if (IS_DGFX(i915))
+		return false;
+
+	return librapl_energy_uJ();
+}
+
 u64 librapl_energy_uJ(void)
 {
 	unsigned long long power;
diff --git a/drivers/gpu/drm/i915/selftests/librapl.h b/drivers/gpu/drm/i915/selftests/librapl.h
index 887f3e91dd05..e3b24fad0a7a 100644
--- a/drivers/gpu/drm/i915/selftests/librapl.h
+++ b/drivers/gpu/drm/i915/selftests/librapl.h
@@ -8,6 +8,10 @@
 
 #include <linux/types.h>
 
+struct drm_i915_private;
+
+bool librapl_supported(const struct drm_i915_private *i915);
+
 u64 librapl_energy_uJ(void);
 
 #endif /* SELFTEST_LIBRAPL_H */
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
