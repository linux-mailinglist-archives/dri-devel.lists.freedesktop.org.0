Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07160627DC9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BDA10E13A;
	Mon, 14 Nov 2022 12:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284810E1B3;
 Mon, 14 Nov 2022 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429012; x=1699965012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7d0MFdXVpnE+P1Nz7bniJp4/2T+/rBYMeA7SP1i0v/A=;
 b=LLfG2z+dyYsj9Z9yaPOuSzbHYI9SES2xRmF1mIYfJLuAyn6XQSlIdOeZ
 LvWleCwhDP6/6wCvBuqRVN8p05/qBN8DP1SZH58ISoutDXYO96ljn7v4+
 3Js/KlG7N19/oF2709ryXl4rb9jIx8qwcOa4DFUGavVlSF1ZKlHh3mKIA
 2vxbvJJUcWXkh5WoIhW2Xf9+9Kzr+NPicqE/O0hb1iFBW8kpnkeBQaVWr
 2O9F59AvJePBePkZ3J3IlcNc93o5y1A7lWg3kDxbRflNRfsq3gBBnrMG0
 ewg3P/xN3CmluMctjpkHpMvV1esLWURI+OaRxX8Ee2ohPN8Cg5Ji7DSgA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960588"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509097"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509097"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:09 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/gt: Use RC6 residency types as arguments to
 residency functions
Date: Mon, 14 Nov 2022 18:03:47 +0530
Message-Id: <20221114123348.3474216-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114123348.3474216-1-badal.nilawar@intel.com>
References: <20221114123348.3474216-1-badal.nilawar@intel.com>
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
Cc: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

Previously RC6 residency functions directly accepted RC6 residency register
MMIO offsets (there are four RC6 residency registers). This worked but
required an assumption on the residency register layout so was not future
proof.

Therefore change RC6 residency functions to accept RC6 residency types
instead of register MMIO offsets. The knowledge of register offsets as well
as ID to offset mapping is now maintained solely in intel_rc6 and can be
tailored for different platforms and different register layouts as need
arises.

v2: Address review comments by Jani N
    - Change residency functions to accept RC6 residency types instead of
      register ID's
    - s/intel_rc6_print_rc5_res/intel_rc6_print_residency/
    - Remove "const enum" in function arguments
    - Naming: intel_rc6_* for enum
    - Use INTEL_RC6_RES_MAX and other minor changes
v3: Don't include intel_rc6_types.h in intel_rc6.h (Jani)

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 27 +++------
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 ++--
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 55 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_rc6.h           | 11 ++--
 drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 ++++-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  6 +-
 7 files changed, 72 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 979e60294654..5d6b34683139 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -83,19 +83,6 @@ static int fw_domains_show(struct seq_file *m, void *data)
 }
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
 
-static void print_rc6_res(struct seq_file *m,
-			  const char *title,
-			  const i915_reg_t reg)
-{
-	struct intel_gt *gt = m->private;
-	intel_wakeref_t wakeref;
-
-	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		seq_printf(m, "%s %u (%llu us)\n", title,
-			   intel_uncore_read(gt->uncore, reg),
-			   intel_rc6_residency_us(&gt->rc6, reg));
-}
-
 static int vlv_drpc(struct seq_file *m)
 {
 	struct intel_gt *gt = m->private;
@@ -115,8 +102,8 @@ static int vlv_drpc(struct seq_file *m)
 	seq_printf(m, "Media Power Well: %s\n",
 		   (pw_status & VLV_GTLC_PW_MEDIA_STATUS_MASK) ? "Up" : "Down");
 
-	print_rc6_res(m, "Render RC6 residency since boot:", GEN6_GT_GFX_RC6);
-	print_rc6_res(m, "Media RC6 residency since boot:", VLV_GT_MEDIA_RC6);
+	intel_rc6_print_residency(m, "Render RC6 residency since boot:", INTEL_RC6_RES_RC6);
+	intel_rc6_print_residency(m, "Media RC6 residency since boot:", INTEL_RC6_RES_VLV_MEDIA);
 
 	return fw_domains_show(m, NULL);
 }
@@ -192,11 +179,11 @@ static int gen6_drpc(struct seq_file *m)
 	}
 
 	/* Not exactly sure what this is */
-	print_rc6_res(m, "RC6 \"Locked to RPn\" residency since boot:",
-		      GEN6_GT_GFX_RC6_LOCKED);
-	print_rc6_res(m, "RC6 residency since boot:", GEN6_GT_GFX_RC6);
-	print_rc6_res(m, "RC6+ residency since boot:", GEN6_GT_GFX_RC6p);
-	print_rc6_res(m, "RC6++ residency since boot:", GEN6_GT_GFX_RC6pp);
+	intel_rc6_print_residency(m, "RC6 \"Locked to RPn\" residency since boot:",
+				  INTEL_RC6_RES_RC6_LOCKED);
+	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
+	intel_rc6_print_residency(m, "RC6+ residency since boot:", INTEL_RC6_RES_RC6p);
+	intel_rc6_print_residency(m, "RC6++ residency since boot:", INTEL_RC6_RES_RC6pp);
 
 	if (GRAPHICS_VER(i915) <= 7) {
 		seq_printf(m, "RC6   voltage: %dmV\n",
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 2b5f05b31187..cf71305ad586 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -165,13 +165,13 @@ sysfs_gt_attribute_r_func(struct kobject *kobj, struct attribute *attr,
 	INTEL_GT_ATTR_RO(_name)
 
 #ifdef CONFIG_PM
-static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
+static u32 get_residency(struct intel_gt *gt, enum intel_rc6_res_type id)
 {
 	intel_wakeref_t wakeref;
 	u64 res = 0;
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		res = intel_rc6_residency_us(&gt->rc6, reg);
+		res = intel_rc6_residency_us(&gt->rc6, id);
 
 	return DIV_ROUND_CLOSEST_ULL(res, 1000);
 }
@@ -210,22 +210,22 @@ static ssize_t rc6_enable_dev_show(struct device *dev,
 
 static u32 __rc6_residency_ms_show(struct intel_gt *gt)
 {
-	return get_residency(gt, GEN6_GT_GFX_RC6);
+	return get_residency(gt, INTEL_RC6_RES_RC6);
 }
 
 static u32 __rc6p_residency_ms_show(struct intel_gt *gt)
 {
-	return get_residency(gt, GEN6_GT_GFX_RC6p);
+	return get_residency(gt, INTEL_RC6_RES_RC6p);
 }
 
 static u32 __rc6pp_residency_ms_show(struct intel_gt *gt)
 {
-	return get_residency(gt, GEN6_GT_GFX_RC6pp);
+	return get_residency(gt, INTEL_RC6_RES_RC6pp);
 }
 
 static u32 __media_rc6_residency_ms_show(struct intel_gt *gt)
 {
-	return get_residency(gt, VLV_GT_MEDIA_RC6);
+	return get_residency(gt, INTEL_RC6_RES_VLV_MEDIA);
 }
 
 INTEL_GT_SYSFS_SHOW_MIN(rc6_residency_ms);
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index f8d0523f4c18..6db4e60d5fba 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -551,6 +551,14 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
 }
 
+static void rc6_res_reg_init(struct intel_rc6 *rc6)
+{
+	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
+	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
+	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
+	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
+}
+
 void intel_rc6_init(struct intel_rc6 *rc6)
 {
 	struct drm_i915_private *i915 = rc6_to_i915(rc6);
@@ -562,6 +570,8 @@ void intel_rc6_init(struct intel_rc6 *rc6)
 	if (!rc6_supported(rc6))
 		return;
 
+	rc6_res_reg_init(rc6);
+
 	if (IS_CHERRYVIEW(i915))
 		err = chv_rc6_init(rc6);
 	else if (IS_VALLEYVIEW(i915))
@@ -736,31 +746,19 @@ static u64 vlv_residency_raw(struct intel_uncore *uncore, const i915_reg_t reg)
 	return lower | (u64)upper << 8;
 }
 
-u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
+u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, enum intel_rc6_res_type id)
 {
 	struct drm_i915_private *i915 = rc6_to_i915(rc6);
 	struct intel_uncore *uncore = rc6_to_uncore(rc6);
 	u64 time_hw, prev_hw, overflow_hw;
+	i915_reg_t reg = rc6->res_reg[id];
 	unsigned int fw_domains;
 	unsigned long flags;
-	unsigned int i;
 	u32 mul, div;
 
 	if (!rc6->supported)
 		return 0;
 
-	/*
-	 * Store previous hw counter values for counter wrap-around handling.
-	 *
-	 * There are only four interesting registers and they live next to each
-	 * other so we can use the relative address, compared to the smallest
-	 * one as the index into driver storage.
-	 */
-	i = (i915_mmio_reg_offset(reg) -
-	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
-	if (drm_WARN_ON_ONCE(&i915->drm, i >= ARRAY_SIZE(rc6->cur_residency)))
-		return 0;
-
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
 
 	spin_lock_irqsave(&uncore->lock, flags);
@@ -789,11 +787,11 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 	/*
 	 * Counter wrap handling.
 	 *
-	 * But relying on a sufficient frequency of queries otherwise counters
-	 * can still wrap.
+	 * Store previous hw counter values for counter wrap-around handling. But
+	 * relying on a sufficient frequency of queries otherwise counters can still wrap.
 	 */
-	prev_hw = rc6->prev_hw_residency[i];
-	rc6->prev_hw_residency[i] = time_hw;
+	prev_hw = rc6->prev_hw_residency[id];
+	rc6->prev_hw_residency[id] = time_hw;
 
 	/* RC6 delta from last sample. */
 	if (time_hw >= prev_hw)
@@ -802,8 +800,8 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 		time_hw += overflow_hw - prev_hw;
 
 	/* Add delta to RC6 extended raw driver copy. */
-	time_hw += rc6->cur_residency[i];
-	rc6->cur_residency[i] = time_hw;
+	time_hw += rc6->cur_residency[id];
+	rc6->cur_residency[id] = time_hw;
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irqrestore(&uncore->lock, flags);
@@ -811,9 +809,22 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 	return mul_u64_u32_div(time_hw, mul, div);
 }
 
-u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg)
+u64 intel_rc6_residency_us(struct intel_rc6 *rc6, enum intel_rc6_res_type id)
+{
+	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, id), 1000);
+}
+
+void intel_rc6_print_residency(struct seq_file *m, const char *title,
+			       enum intel_rc6_res_type id)
 {
-	return DIV_ROUND_UP_ULL(intel_rc6_residency_ns(rc6, reg), 1000);
+	struct intel_gt *gt = m->private;
+	i915_reg_t reg = gt->rc6.res_reg[id];
+	intel_wakeref_t wakeref;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		seq_printf(m, "%s %u (%llu us)\n", title,
+			   intel_uncore_read(gt->uncore, reg),
+			   intel_rc6_residency_us(&gt->rc6, id));
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.h b/drivers/gpu/drm/i915/gt/intel_rc6.h
index b6fea71afc22..456fa668a276 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.h
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.h
@@ -6,10 +6,11 @@
 #ifndef INTEL_RC6_H
 #define INTEL_RC6_H
 
-#include "i915_reg_defs.h"
+#include <linux/types.h>
 
-struct intel_engine_cs;
+enum intel_rc6_res_type;
 struct intel_rc6;
+struct seq_file;
 
 void intel_rc6_init(struct intel_rc6 *rc6);
 void intel_rc6_fini(struct intel_rc6 *rc6);
@@ -21,7 +22,9 @@ void intel_rc6_sanitize(struct intel_rc6 *rc6);
 void intel_rc6_enable(struct intel_rc6 *rc6);
 void intel_rc6_disable(struct intel_rc6 *rc6);
 
-u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, i915_reg_t reg);
-u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg);
+u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
+u64 intel_rc6_residency_us(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
+void intel_rc6_print_residency(struct seq_file *m, const char *title,
+			       enum intel_rc6_res_type id);
 
 #endif /* INTEL_RC6_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6_types.h b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
index e747492b2f46..fa23c4dce00b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_rc6_types.h
@@ -13,9 +13,20 @@
 
 struct drm_i915_gem_object;
 
+/* RC6 residency types */
+enum intel_rc6_res_type {
+	INTEL_RC6_RES_RC6_LOCKED,
+	INTEL_RC6_RES_RC6,
+	INTEL_RC6_RES_RC6p,
+	INTEL_RC6_RES_RC6pp,
+	INTEL_RC6_RES_MAX,
+	INTEL_RC6_RES_VLV_MEDIA = INTEL_RC6_RES_RC6p,
+};
+
 struct intel_rc6 {
-	u64 prev_hw_residency[4];
-	u64 cur_residency[4];
+	i915_reg_t res_reg[INTEL_RC6_RES_MAX];
+	u64 prev_hw_residency[INTEL_RC6_RES_MAX];
+	u64 cur_residency[INTEL_RC6_RES_MAX];
 
 	u32 ctl_enable;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
index 8c70b7e12074..2ceeadecc639 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
@@ -19,11 +19,11 @@ static u64 rc6_residency(struct intel_rc6 *rc6)
 
 	/* XXX VLV_GT_MEDIA_RC6? */
 
-	result = intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6);
+	result = intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6);
 	if (HAS_RC6p(rc6_to_i915(rc6)))
-		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6p);
+		result += intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6p);
 	if (HAS_RC6pp(rc6_to_i915(rc6)))
-		result += intel_rc6_residency_ns(rc6, GEN6_GT_GFX_RC6pp);
+		result += intel_rc6_residency_ns(rc6, INTEL_RC6_RES_RC6pp);
 
 	return result;
 }
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 67140a87182f..52531ab28c5f 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -148,13 +148,13 @@ static u64 __get_rc6(struct intel_gt *gt)
 	struct drm_i915_private *i915 = gt->i915;
 	u64 val;
 
-	val = intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6);
+	val = intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6);
 
 	if (HAS_RC6p(i915))
-		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6p);
+		val += intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6p);
 
 	if (HAS_RC6pp(i915))
-		val += intel_rc6_residency_ns(&gt->rc6, GEN6_GT_GFX_RC6pp);
+		val += intel_rc6_residency_ns(&gt->rc6, INTEL_RC6_RES_RC6pp);
 
 	return val;
 }
-- 
2.25.1

