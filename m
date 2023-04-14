Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5496E2C75
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 00:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961ED10E244;
	Fri, 14 Apr 2023 22:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71F710E218;
 Fri, 14 Apr 2023 22:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681511489; x=1713047489;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IFmmuuY3cc3MdrloIAvpy+2y01ZA2k0IGERLwPB2HP4=;
 b=B0nW+r16hG3PaP25JrlMi7gJ02seA86bmQFSftM++mPYscuNJy9T7dRU
 98M9eq/wnRUcqGK7GkdiMkH0BKOikHYXmJq7ru/Dt7KCW1bKb9cAfSJbO
 hbkMoe1FemOYItsV7e6HV4sI6ZRK1KKwPlewsqYulgYU4htXSAzzVFt6Q
 4YmsmQsvSqNn47S2DT8/yYPTul5eFVBGxcDVePAZ/7uWdQCWvb54PUiFo
 EDll1i/5AeCkEHNeBOVSRJsd3Tn7/p2Fd6XB9tMt4DT7JYRmnJV0aALhi
 io5hWRhWPVCPkwl13forn0Ajd8X1efA3P5960LxT+agJjEtcdeJxOV/kM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324934047"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="324934047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 15:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="683483607"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="683483607"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2023 15:31:28 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/guc/slpc: Provide sysfs for efficient freq
Date: Fri, 14 Apr 2023 15:34:15 -0700
Message-Id: <20230414223415.3077055-1-vinay.belgaumkar@intel.com>
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

v3: Fix compile error

Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 35 +++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 43 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  1 +
 4 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 28f27091cd3b..7496de5be580 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -451,6 +451,33 @@ static ssize_t punit_req_freq_mhz_show(struct kobject *kobj,
 	return sysfs_emit(buff, "%u\n", preq);
 }
 
+static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     char *buff)
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
+	uint32_t val;
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 026d73855f36..5668f00f02e6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -277,6 +277,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	slpc->max_freq_softlimit = 0;
 	slpc->min_freq_softlimit = 0;
+	slpc->ignore_eff_freq = false;
 	slpc->min_is_rpmax = false;
 
 	slpc->boost_freq = 0;
@@ -457,6 +458,34 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
 	return ret;
 }
 
+int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	/* Need a lock now since waitboost can be modifying min as well */
+	mutex_lock(&slpc->lock);
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	/* Ignore efficient freq if lower min freq is requested */
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
+
+out:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	mutex_unlock(&slpc->lock);
+	return ret;
+}
+
 /**
  * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
@@ -482,16 +511,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
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
@@ -499,7 +518,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	if (!ret)
 		slpc->min_freq_softlimit = val;
 
-out:
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 	mutex_unlock(&slpc->lock);
 
@@ -752,6 +770,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
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

