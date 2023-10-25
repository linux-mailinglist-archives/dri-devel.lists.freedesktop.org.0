Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AEB7D6EC5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665AB10E67D;
	Wed, 25 Oct 2023 14:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE1A10E679;
 Wed, 25 Oct 2023 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698244546; x=1729780546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sWAxcvoQ3A7mzq8nwePs76cw1LfXanBXhv/ZxHfN/MU=;
 b=fCA872Fx0AlZkuokiyRjKE6DNLAd6WZkMUXDsMMZvDkotOAVpkiKHQrY
 aCGgT2i4RS+0hILJzcQ+Ai8E6JbXtgTfmHk/OHaRGKKVf/2Dh9nN9+yVG
 nQ/ce0erI/f73dUIfnUV8N9ttTW1V0SzdQTmfGgHGNAaE6qZxgpOpkwgE
 zm1GhLpbbLWDeC9YmBgvyuZkrcTlgEPntCcyPQzYUm3xljjTKbeG3xM6q
 soUcNYNNAIenk9x/Iq0NArKuczy7WyqGMTjolfrqBCKuUxKXh3ncEZZni
 CyQSWoAatZ1HsSwgqfqbF1dqmwWjW1lzezQV123OkaHr8Kghb4cTA1cb9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418439904"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418439904"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762471122"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762471122"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 2/5] drm/i915/gt: Create the gt_to_guc() wrapper
Date: Wed, 25 Oct 2023 16:35:12 +0200
Message-ID: <20231025143515.254468-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025143515.254468-1-andi.shyti@linux.intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have guc_to_gt() and getting to guc from the GT it
requires some mental effort. Add the gt_to_guc().

Given the reference to the "gt", the gt_to_guc() will return the
pinter to the "guc".

Update all the files under the gt/ directory.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 9 +++------
 drivers/gpu/drm/i915/gt/intel_gt.h            | 5 +++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 6 +++---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 4 ++--
 drivers/gpu/drm/i915/gt/intel_rps.c           | 2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           | 2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 6 +++---
 10 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 4a11219e560e..ea9c331a38c1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -589,7 +589,7 @@ u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value)
 	 * NB: The GuC API only supports 32bit values. However, the limit is further
 	 * reduced due to internal calculations which would otherwise overflow.
 	 */
-	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
+	if (intel_guc_submission_is_wanted(gt_to_guc(engine->gt)))
 		value = min_t(u64, value, guc_policy_max_preempt_timeout_ms());
 
 	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
@@ -610,7 +610,7 @@ u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value)
 	 * NB: The GuC API only supports 32bit values. However, the limit is further
 	 * reduced due to internal calculations which would otherwise overflow.
 	 */
-	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
+	if (intel_guc_submission_is_wanted(gt_to_guc(engine->gt)))
 		value = min_t(u64, value, guc_policy_max_exec_quantum_ms());
 
 	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 1c93e84278a0..acd0912a1abd 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -211,11 +211,8 @@ static void guc_ggtt_ct_invalidate(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 	intel_wakeref_t wakeref;
 
-	with_intel_runtime_pm_if_active(uncore->rpm, wakeref) {
-		struct intel_guc *guc = &gt->uc.guc;
-
-		intel_guc_invalidate_tlb_guc(guc);
-	}
+	with_intel_runtime_pm_if_active(uncore->rpm, wakeref)
+		intel_guc_invalidate_tlb_guc(gt_to_guc(gt));
 }
 
 static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
@@ -226,7 +223,7 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
 	gen8_ggtt_invalidate(ggtt);
 
 	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
-		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc)) {
+		if (intel_guc_tlb_invalidation_is_available(gt_to_guc(gt))) {
 			guc_ggtt_ct_invalidate(gt);
 		} else if (GRAPHICS_VER(i915) >= 12) {
 			intel_uncore_write_fw(gt->uncore,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 12a638f05d63..228a26017851 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -119,6 +119,11 @@ static inline struct drm_i915_private *guc_to_i915(struct intel_guc *guc)
 	return guc_to_gt(guc)->i915;
 }
 
+static inline struct intel_guc *gt_to_guc(struct intel_gt *gt)
+{
+	return &gt->uc.guc;
+}
+
 void intel_gt_common_init_early(struct intel_gt *gt);
 int intel_root_gt_init_early(struct drm_i915_private *i915);
 int intel_gt_assign_ggtt(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 77fb57223465..ad4c51f18d3a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -68,9 +68,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 	struct intel_gt *media_gt = gt->i915->media_gt;
 
 	if (instance == OTHER_GUC_INSTANCE)
-		return guc_irq_handler(&gt->uc.guc, iir);
+		return guc_irq_handler(gt_to_guc(gt), iir);
 	if (instance == OTHER_MEDIA_GUC_INSTANCE && media_gt)
-		return guc_irq_handler(&media_gt->uc.guc, iir);
+		return guc_irq_handler(gt_to_guc(media_gt), iir);
 
 	if (instance == OTHER_GTPM_INSTANCE)
 		return gen11_rps_irq_handler(&gt->rps, iir);
@@ -442,7 +442,7 @@ void gen8_gt_irq_handler(struct intel_gt *gt, u32 master_ctl)
 		iir = raw_reg_read(regs, GEN8_GT_IIR(2));
 		if (likely(iir)) {
 			gen6_rps_irq_handler(&gt->rps, iir);
-			guc_irq_handler(&gt->uc.guc, iir >> 16);
+			guc_irq_handler(gt_to_guc(gt), iir >> 16);
 			raw_reg_write(regs, GEN8_GT_IIR(2), iir);
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index f900cc68d6d9..cc0805793bda 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -538,7 +538,7 @@ static bool rps_eval(void *data)
 {
 	struct intel_gt *gt = data;
 
-	if (intel_guc_slpc_is_used(&gt->uc.guc))
+	if (intel_guc_slpc_is_used(gt_to_guc(gt)))
 		return false;
 	else
 		return HAS_RPS(gt->i915);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index f0dea54880af..8b7813cac33e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -456,7 +456,7 @@ static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
 					 char *buff)
 {
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 
 	return sysfs_emit(buff, "%u\n", slpc->ignore_eff_freq);
 }
@@ -466,7 +466,7 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
 					  const char *buff, size_t count)
 {
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 	int err;
 	u32 val;
 
@@ -587,7 +587,7 @@ static ssize_t media_freq_factor_show(struct kobject *kobj,
 				      char *buff)
 {
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 	intel_wakeref_t wakeref;
 	u32 mode;
 
@@ -618,7 +618,7 @@ static ssize_t media_freq_factor_store(struct kobject *kobj,
 				       const char *buff, size_t count)
 {
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 	u32 factor, mode;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 8b67abd720be..fb58beaf4681 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -109,7 +109,7 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
 	 * thus allowing GuC to control RC6 entry/exit fully instead.
 	 * We will not set the HW ENABLE and EI bits
 	 */
-	if (!intel_guc_rc_enable(&gt->uc.guc))
+	if (!intel_guc_rc_enable(gt_to_guc(gt)))
 		rc6->ctl_enable = GEN6_RC_CTL_RC6_ENABLE;
 	else
 		rc6->ctl_enable =
@@ -569,7 +569,7 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 	struct intel_gt *gt = rc6_to_gt(rc6);
 
 	/* Take control of RC6 back from GuC */
-	intel_guc_rc_disable(&gt->uc.guc);
+	intel_guc_rc_disable(gt_to_guc(gt));
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 	if (GRAPHICS_VER(i915) >= 9)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4feef874e6d6..9c6812257ac2 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -52,7 +52,7 @@ static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 
-	return &gt->uc.guc.slpc;
+	return &gt_to_guc(gt)->slpc;
 }
 
 static bool rps_uses_slpc(struct intel_rps *rps)
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index 4bb13d1890e3..756e9ebbc725 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -132,7 +132,7 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 		return;
 
 	with_intel_gt_pm_if_awake(gt, wakeref) {
-		struct intel_guc *guc = &gt->uc.guc;
+		struct intel_guc *guc = gt_to_guc(gt);
 
 		mutex_lock(&gt->tlb.invalidate_lock);
 		if (tlb_seqno_passed(gt, seqno))
diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index 952c8d52d68a..6011a5c9f449 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -53,7 +53,7 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
 static int slpc_set_freq(struct intel_gt *gt, u32 freq)
 {
 	int err;
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 
 	err = slpc_set_max_freq(slpc, freq);
 	if (err) {
@@ -182,7 +182,7 @@ static int vary_min_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
 
 static int slpc_power(struct intel_gt *gt, struct intel_engine_cs *engine)
 {
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 	struct {
 		u64 power;
 		int freq;
@@ -262,7 +262,7 @@ static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
 
 static int run_test(struct intel_gt *gt, int test_type)
 {
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
 	struct intel_rps *rps = &gt->rps;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
-- 
2.42.0

