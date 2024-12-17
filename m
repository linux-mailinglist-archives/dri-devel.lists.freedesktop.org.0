Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF79F3FA1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 02:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9620210E1FC;
	Tue, 17 Dec 2024 01:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cb2Umqpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5A10E1FC;
 Tue, 17 Dec 2024 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734397233; x=1765933233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FgdYF7KbtHGegK9Z4X4K0Pg7DCY93imnGRXyhX359Gc=;
 b=cb2UmqpuRtQqu6AnO/zdSrIsdXodz1OID2KxS5d4X+Vvafj5yUr6TP0U
 Tq7SWOiwLqZwakRW5ZVTnBh2hF7FCkgfVv8YdDIj4jH0JoCJQMXqnFus+
 MrBRcbIINAdSebuZNDdFUVxRsNRL/SDf0LWkJwv15gUrWkheuFPlNE2zj
 BxEMmZs8tNvOelWWt/r3H74suAV7BJZjObT6Sq/nTIzHzx7fAuVjlSOlo
 PBFUC3sOY0AzS/Ky2NtRGdEd4aIb3wsmIB0iyN6ozjW+XSL3yrI0mWM/0
 pjdnGCX2HtUbb9B8sAmA9Oc6hXU9NJt2mqTJWwGL+cU0Lazu54ITlJsgh w==;
X-CSE-ConnectionGUID: Bi7/l1bMQSiH4BQKYAqf5g==
X-CSE-MsgGUID: XuE0Rke1QVm8OuBOSgff/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34939030"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="34939030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 17:00:32 -0800
X-CSE-ConnectionGUID: fdOnLTmlRWuHIdc98l6XlA==
X-CSE-MsgGUID: 8bL3jGbJT1S7xZq+94AdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134704766"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 17:00:32 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915/slpc: Add sysfs for SLPC power profiles
Date: Mon, 16 Dec 2024 16:57:04 -0800
Message-Id: <20241217005704.3101181-1-vinay.belgaumkar@intel.com>
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

Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 35 +++++++++++++++++++
 .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 33 +++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  2 ++
 5 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index d7784650e4d9..52a5ff94a0e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -464,6 +464,33 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
 	return err ?: count;
 }
 
+static ssize_t slpc_power_profile_show(struct kobject *kobj,
+				       struct kobj_attribute *attr,
+				       char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
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
+	int err;
+	u32 val;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	err = intel_guc_slpc_set_power_profile(slpc, val);
+	return err ?: count;
+}
+
 struct intel_gt_bool_throttle_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
@@ -668,6 +695,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
 INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
 
 INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
+INTEL_GT_ATTR_RW(slpc_power_profile);
 
 static const struct attribute *media_perf_power_attrs[] = {
 	&attr_media_freq_factor.attr,
@@ -864,6 +892,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
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
index 706fffca698b..0ee88ee347ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -265,6 +265,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 	slpc->num_boosts = 0;
 	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
 
+	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
+
 	mutex_init(&slpc->lock);
 	INIT_WORK(&slpc->boost_work, slpc_boost_work);
 
@@ -567,6 +569,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
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
@@ -728,6 +758,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Enable SLPC Optimized Strategy for compute */
 	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
+	/* Set cached value of power_profile */
+	intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
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
index a88651331497..2351a1693aa1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -33,6 +33,8 @@ struct intel_guc_slpc {
 	u32 max_freq_softlimit;
 	bool ignore_eff_freq;
 
+	u32 power_profile;
+
 	/* cached media ratio mode */
 	u32 media_ratio_mode;
 
-- 
2.38.1

