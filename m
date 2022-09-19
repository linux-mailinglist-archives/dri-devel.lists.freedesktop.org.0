Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D365BD21D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04B910E031;
	Mon, 19 Sep 2022 16:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0541510E031;
 Mon, 19 Sep 2022 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663604647; x=1695140647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=spmkaAwl04vaB/FEWDTRXAIqt26TTcL5SSa7rFPnrZw=;
 b=Xcu+DAmvpXFJ64QW1cygZm2Lg9ZA2vt3wUEbdO4MmyyuHKiAZv5B1QyE
 vDtQhXWgX6Z/Jbj5fyczhgMlPoLhFziViP3JTTWkq7czLEDKn9dRtMZsd
 TtgBh2cDGD1RkV1Paygdhe434cpmSCnufTXCbwDjYTocpFPXcZ4/AxAxX
 op6XcwYYVXNZhF7jOrE29I4OBkkQdkIFajA4QnJE8fDAS/kZXs18oT48J
 y6DbOlnZE/gfmaDYRHr+p+1V0D3Vwd1+Lyw9W63GeEoMc0H11UAsPhlXo
 4wETmoca3CjCv3OkUF7sx2PP78pzoWk5PfaYxvPOGtOi58ko+8DzwbRAM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282472923"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282472923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 09:24:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="687038059"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 09:24:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Perf_limit_reasons are only available for Gen11+
Date: Mon, 19 Sep 2022 09:24:01 -0700
Message-Id: <20220919162401.2077713-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tilak Tangudu <tilak.tangudu@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register GT0_PERF_LIMIT_REASONS (0x1381a8) is available only for
Gen11+. Therefore ensure perf_limit_reasons sysfs/debugfs files are created
only for Gen11+. Otherwise on Gen < 5 accessing these files results in the
following oops:

<1> [88.829420] BUG: unable to handle page fault for address: ffffc90000bb81a8
<1> [88.829438] #PF: supervisor read access in kernel mode
<1> [88.829447] #PF: error_code(0x0000) - not-present page

Bspec: 20008
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6863
Fixes: fe5979665f64 ("drm/i915/debugfs: Add perf_limit_reasons in debugfs")
Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  4 ++++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 10 +++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 15 +++++++++++----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5ddae95d4886..b367cfff48d5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -233,6 +233,10 @@ static void gen6_clear_engine_error_register(struct intel_engine_cs *engine)
 
 i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt)
 {
+	/* GT0_PERF_LIMIT_REASONS is available only for Gen11+ */
+	if (GRAPHICS_VER(gt->i915) < 11)
+		return INVALID_MMIO_REG;
+
 	return gt->type == GT_MEDIA ?
 		MTL_MEDIA_PERF_LIMIT_REASONS : GT0_PERF_LIMIT_REASONS;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 68310881a793..10f680dbd7b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -682,6 +682,14 @@ static int perf_limit_reasons_clear(void *data, u64 val)
 
 	return 0;
 }
+
+static bool perf_limit_reasons_eval(void *data)
+{
+	struct intel_gt *gt = data;
+
+	return i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt));
+}
+
 DEFINE_SIMPLE_ATTRIBUTE(perf_limit_reasons_fops, perf_limit_reasons_get,
 			perf_limit_reasons_clear, "%llu\n");
 
@@ -694,7 +702,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
 		{ "forcewake_user", &forcewake_user_fops, NULL},
 		{ "llc", &llc_fops, llc_eval },
 		{ "rps_boost", &rps_boost_fops, rps_eval },
-		{ "perf_limit_reasons", &perf_limit_reasons_fops, NULL },
+		{ "perf_limit_reasons", &perf_limit_reasons_fops, perf_limit_reasons_eval },
 	};
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 54deae45d81f..904160952369 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -545,8 +545,7 @@ static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
 static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
 static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
 
-static const struct attribute *freq_attrs[] = {
-	&dev_attr_punit_req_freq_mhz.attr,
+static const struct attribute *throttle_reason_attrs[] = {
 	&attr_throttle_reason_status.attr,
 	&attr_throttle_reason_pl1.attr,
 	&attr_throttle_reason_pl2.attr,
@@ -791,12 +790,20 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 	if (!is_object_gt(kobj))
 		return;
 
-	ret = sysfs_create_files(kobj, freq_attrs);
+	ret = sysfs_create_file(kobj, &dev_attr_punit_req_freq_mhz.attr);
 	if (ret)
 		drm_warn(&gt->i915->drm,
-			 "failed to create gt%u throttle sysfs files (%pe)",
+			 "failed to create gt%u punit_req_freq_mhz sysfs (%pe)",
 			 gt->info.id, ERR_PTR(ret));
 
+	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
+		ret = sysfs_create_files(kobj, throttle_reason_attrs);
+		if (ret)
+			drm_warn(&gt->i915->drm,
+				 "failed to create gt%u throttle sysfs files (%pe)",
+				 gt->info.id, ERR_PTR(ret));
+	}
+
 	if (HAS_MEDIA_RATIO_MODE(gt->i915) && intel_uc_uses_guc_slpc(&gt->uc)) {
 		ret = sysfs_create_files(kobj, media_perf_power_attrs);
 		if (ret)
-- 
2.34.1

