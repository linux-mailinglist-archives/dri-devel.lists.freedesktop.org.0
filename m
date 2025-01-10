Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F0AA09EAF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 00:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFDB10E531;
	Fri, 10 Jan 2025 23:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsvghP2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848E910E530;
 Fri, 10 Jan 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736551531; x=1768087531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=73DVhYqjPsQoMXCCh5DgWO8asUbHf82s0fpMqXUrSIk=;
 b=RsvghP2vnNVfLSWFmZT0rnjC6a/piiwnyO5RrsfcjoPQ8H3AyQLfiX5E
 UERN6g5UPXQgGXQ9U9kax+fa9FH8k+3iHQWFhnuv1d0sDjrtg8/nvgo8t
 BWD2Ngw9XIqBYtKBaYI7vX0s+ZJDDYdzaDD4OGKewPur62m6412u2/K7N
 unoD3hA2qmIDq55xIIjWLG4Wipfa6LEltwcISvgQxSQ83AWyEc+S6sDxu
 sLnx0DOhj2Zczrcd0L1NA7fdgboRkiqZjmiFmP4OJyt5bIKvMbtx5hIru
 YrKpdoa7VcQFmFkWTkXotZerBC0snNTL4JW7GPvH2bignSZzDL0/aE6hq A==;
X-CSE-ConnectionGUID: e3KAznQhTQ6dzB1LqTDOTQ==
X-CSE-MsgGUID: 1BgrelLQQ0C1xGcCMY8dUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="39673254"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="39673254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 15:25:30 -0800
X-CSE-ConnectionGUID: M/dUFxsQRBaZPUZLbXD6xw==
X-CSE-MsgGUID: uUtejYDZRMSXyNp5OhmHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="108875849"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 15:25:31 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
Date: Fri, 10 Jan 2025 15:21:51 -0800
Message-Id: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
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

Default SLPC power profile is Base(0). Power Saving mode(1)
has conservative up/down thresholds and is suitable for use with
apps that typically need to be power efficient.

Selected power profile will be displayed in this format-

$ cat slpc_power_profile

  [base]    power_saving

$ echo power_saving > slpc_power_profile
$ cat slpc_power_profile

  base    [power_saving]

v2: Disable waitboost in power saving profile and updated sysfs
format and add some kernel doc for SLPC (Rodrigo)

Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
 .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
 6 files changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index d7784650e4d9..83a7cc7dfbc8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
 	return err ?: count;
 }
 
+static ssize_t slpc_power_profile_show(struct kobject *kobj,
+				       struct kobj_attribute *attr,
+				       char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+
+	switch (slpc->power_profile) {
+	case SLPC_POWER_PROFILES_BASE:
+		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
+	case SLPC_POWER_PROFILES_POWER_SAVING:
+		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
+	}
+
+	return sysfs_emit(buff, "%u\n", slpc->power_profile);
+}
+
+static ssize_t slpc_power_profile_store(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					const char *buff, size_t count)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	char power_saving[] = "power_saving";
+	char base[] = "base";
+	int err;
+	u32 val;
+
+	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
+		val = SLPC_POWER_PROFILES_POWER_SAVING;
+	else if (!strncmp(buff, base, sizeof(base) - 1))
+		val = SLPC_POWER_PROFILES_BASE;
+	else
+		return -EINVAL;
+
+	err = intel_guc_slpc_set_power_profile(slpc, val);
+	return err ?: count;
+}
+
 struct intel_gt_bool_throttle_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
@@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
 INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
 
 INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
+INTEL_GT_ATTR_RW(slpc_power_profile);
 
 static const struct attribute *media_perf_power_attrs[] = {
 	&attr_media_freq_factor.attr,
@@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
 	}
 
+	if (intel_uc_uses_guc_slpc(&gt->uc)) {
+		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
+		if (ret)
+			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
+				    ERR_PTR(ret));
+	}
+
 	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
 		ret = sysfs_create_files(kobj, throttle_reason_attrs);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fa304ea088e4..2cfaedb04876 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
 		if (rps_uses_slpc(rps)) {
 			slpc = rps_to_slpc(rps);
 
+			/* Waitboost should not be done with power saving profile */
+			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
+				return;
+
 			if (slpc->min_freq_softlimit >= slpc->boost_freq)
 				return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
index c34674e797c6..6de87ae5669e 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
@@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
 
 #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
 
+enum slpc_power_profiles {
+	SLPC_POWER_PROFILES_BASE = 0x0,
+	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
+};
+
 /**
  * DOC: SLPC H2G MESSAGE FORMAT
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 706fffca698b..bee78467d4a3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -15,6 +15,29 @@
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_rps.h"
 
+/**
+ * DOC: SLPC - Dynamic Frequency management
+ *
+ * Single Loop Power Control is a GuC based algorithm which manages
+ * GT frequency based on how KMD initializes its parameters. SLPC is
+ * almost completely in control after initialization except for the
+ * waitboost scenario.
+ *
+ * KMD uses concept of waitboost to ramp frequency up to RP0 when
+ * there are pending submissions. The addition of power profiles adds
+ * another level of control to these mechanisms. When we choose the power
+ * saving profile, SLPC will use conservative thresholds to ramp frequency,
+ * thus saving power. KMD will disable waitboosts when this happens to aid
+ * further power savings. The user has some level of control through sysfs
+ * where min/max frequencies can be altered and the use of efficient freq
+ * can be modified as well.
+ *
+ * Another form of frequency control happens through per context hints.
+ * A context can be marked as low latency during creation. That will ensure
+ * that SLPC uses an aggressive frequency ramp when that context is active.
+ *
+ */
+
 static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
 {
 	return container_of(slpc, struct intel_guc, slpc);
@@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 	slpc->num_boosts = 0;
 	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
 
+	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
+
 	mutex_init(&slpc->lock);
 	INIT_WORK(&slpc->boost_work, slpc_boost_work);
 
@@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
 	return ret;
 }
 
+int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
+		return -EINVAL;
+
+	mutex_lock(&slpc->lock);
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	ret = slpc_set_param(slpc,
+			     SLPC_PARAM_POWER_PROFILE,
+			     val);
+	if (ret)
+		guc_err(slpc_to_guc(slpc),
+			"Failed to set power profile to %d: %pe\n",
+			 val, ERR_PTR(ret));
+	else
+		slpc->power_profile = val;
+
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	mutex_unlock(&slpc->lock);
+
+	return ret;
+}
+
 void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
 {
 	u32 pm_intrmsk_mbz = 0;
@@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Enable SLPC Optimized Strategy for compute */
 	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
+	/* Set cached value of power_profile */
+	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
+	if (unlikely(ret)) {
+		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 1cb5fd44f05c..fc9f761b4372 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
 int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
+int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index a88651331497..83673b10ac4e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -33,6 +33,9 @@ struct intel_guc_slpc {
 	u32 max_freq_softlimit;
 	bool ignore_eff_freq;
 
+	/* Base or power saving */
+	u32 power_profile;
+
 	/* cached media ratio mode */
 	u32 media_ratio_mode;
 
-- 
2.38.1

