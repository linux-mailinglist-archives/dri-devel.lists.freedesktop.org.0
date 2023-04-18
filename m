Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFE6E5591
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 02:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5C10E650;
	Tue, 18 Apr 2023 00:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9396C10E643;
 Tue, 18 Apr 2023 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681776396; x=1713312396;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyogt9y6h0ZXjVVegBkDtUJ8sPdTb+4NbZSqJkwPgGU=;
 b=X6biUnL3YkNUs54t6RMmeoHXbZ2xNy6Dia9uC4iPtuADi/mzAWiZTiGy
 aEq50X/+avvSbR0IdN/rqcAw+94BD2ndltKyczI/mPPM37wQHLIJDJGgz
 W4X3TdHh3MndPWR/2CT3I0LkA9yGZm+3CNhRUSs1+Y4PPiOTlSfVbPaHv
 PL4zF3iiwJVB1YhFaTkYwVHiturPqvehLk7CLnrjvzG7tygy4sVD0F1dk
 8rYvtjYSJF/zKLtQouWtTU1qdqKUvz1jJxGWOiy12ignrzEEysfWHYcDg
 ZsrQ/MyAmEwyg1m3XrnG5yy3SHguKTmduOVuuWa/ENiEh/l0Rtw/WzII2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347785238"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="347785238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 17:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690881134"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="690881134"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 17 Apr 2023 17:06:34 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Provide sysfs for efficient freq
Date: Mon, 17 Apr 2023 17:09:15 -0700
Message-Id: <20230418000915.3489494-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

SLPC enables use of efficient freq at init by default. It is
possible for GuC to request frequencies that are higher than
the 'software' max if user has set it lower than the efficient
level.

Scenarios/tests that require strict fixing of freq below the efficient
level will need to disable it through this interface.

v2: Keep just one interface to toggle sysfs. With this, user will
be completely responsible for toggling efficient frequency if need
be. There will be no implicit disabling when user sets min < RP1 (Ashutosh)

v3: Remove unused label, review comments (Ashutosh)

v4: Toggle efficient freq usage in SLPC selftest and checkpatch fixes

Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 35 ++++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 13 +++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 40 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  1 +
 5 files changed, 72 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 28f27091cd3b..ee2b44f896a2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -451,6 +451,33 @@ static ssize_t punit_req_freq_mhz_show(struct kobject *kobj,
 	return sysfs_emit(buff, "%u\n", preq);
 }
 
+static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+
+	return sysfs_emit(buff, "%u\n", slpc->ignore_eff_freq);
+}
+
+static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buff, size_t count)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	int err;
+	u32 val;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	err = intel_guc_slpc_set_ignore_eff_freq(slpc, val);
+	return err ?: count;
+}
+
 struct intel_gt_bool_throttle_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
@@ -663,6 +690,8 @@ static struct kobj_attribute attr_media_freq_factor_scale =
 INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
 INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
 
+INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
+
 static const struct attribute *media_perf_power_attrs[] = {
 	&attr_media_freq_factor.attr,
 	&attr_media_freq_factor_scale.attr,
@@ -744,6 +773,12 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 	if (ret)
 		gt_warn(gt, "failed to create punit_req_freq_mhz sysfs (%pe)", ERR_PTR(ret));
 
+	if (intel_uc_uses_guc_slpc(&gt->uc)) {
+		ret = sysfs_create_file(kobj, &attr_slpc_ignore_eff_freq.attr);
+		if (ret)
+			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
+	}
+
 	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
 		ret = sysfs_create_files(kobj, throttle_reason_attrs);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index bd44ce73a504..0de44db34d27 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -267,13 +267,11 @@ static int run_test(struct intel_gt *gt, int test_type)
 	}
 
 	/*
-	 * Set min frequency to RPn so that we can test the whole
-	 * range of RPn-RP0. This also turns off efficient freq
-	 * usage and makes results more predictable.
+	 * Turn off efficient freq so RPn/RP0 ranges are obeyed
 	 */
-	err = slpc_set_min_freq(slpc, slpc->min_freq);
+	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
 	if (err) {
-		pr_err("Unable to update min freq!");
+		pr_err("Unable to turn off efficient freq!");
 		return err;
 	}
 
@@ -358,9 +356,10 @@ static int run_test(struct intel_gt *gt, int test_type)
 			break;
 	}
 
-	/* Restore min/max frequencies */
-	slpc_set_max_freq(slpc, slpc_max_freq);
+	/* Restore min/max frequencies and efficient flag */
 	slpc_set_min_freq(slpc, slpc_min_freq);
+	slpc_set_max_freq(slpc, slpc_max_freq);
+	intel_guc_slpc_set_ignore_eff_freq(slpc, false);
 
 	if (igt_flush_test(gt->i915))
 		err = -EIO;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 026d73855f36..b1b70ee3001b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -277,6 +277,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	slpc->max_freq_softlimit = 0;
 	slpc->min_freq_softlimit = 0;
+	slpc->ignore_eff_freq = false;
 	slpc->min_is_rpmax = false;
 
 	slpc->boost_freq = 0;
@@ -457,6 +458,31 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
 	return ret;
 }
 
+int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	mutex_lock(&slpc->lock);
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	ret = slpc_set_param(slpc,
+			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+			     val);
+	if (ret) {
+		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
+				val, ERR_PTR(ret));
+		goto out;
+	}
+
+	slpc->ignore_eff_freq = val;
+out:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	mutex_unlock(&slpc->lock);
+	return ret;
+}
+
 /**
  * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
@@ -482,16 +508,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	mutex_lock(&slpc->lock);
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-	/* Ignore efficient freq if lower min freq is requested */
-	ret = slpc_set_param(slpc,
-			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			     val < slpc->rp1_freq);
-	if (ret) {
-		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq: %pe\n",
-				ERR_PTR(ret));
-		goto out;
-	}
-
 	ret = slpc_set_param(slpc,
 			     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 			     val);
@@ -499,7 +515,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	if (!ret)
 		slpc->min_freq_softlimit = val;
 
-out:
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 	mutex_unlock(&slpc->lock);
 
@@ -752,6 +767,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set cached media freq ratio mode */
 	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
 
+	/* Set cached value of ignore efficient freq */
+	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 17ed515f6a85..597eb5413ddf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode);
+int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index a6ef53b04e04..a88651331497 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -31,6 +31,7 @@ struct intel_guc_slpc {
 	/* frequency softlimits */
 	u32 min_freq_softlimit;
 	u32 max_freq_softlimit;
+	bool ignore_eff_freq;
 
 	/* cached media ratio mode */
 	u32 media_ratio_mode;
-- 
2.38.1

