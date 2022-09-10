Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E65B4351
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 02:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7008D10E1DA;
	Sat, 10 Sep 2022 00:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6910E1D3;
 Sat, 10 Sep 2022 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662768726; x=1694304726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztMEq+w2Jh7VdjXNBHJ2ux5oObyIv93Oz3TDcAYRdAM=;
 b=TWpNIE/Opd5xViPTAOEvIYnyogYDll5BzlBXFUFMbj9ONOx9ENucNGfy
 /N+NvMyiUD2kUmwduFA+mDjSW9WE+GzhbCC2JH8EL7rA+oAI3H0q0rzhZ
 94g5XMiy9/MQ5nKwwXExsymxEpnEbRiklw6E7ylBciyahoK+IF150sSoT
 VSDbPxeTTZlg6wLbiMmWhOBdd56DmkAnoKV0EWs7gmiI/PqNHq3z2TPoL
 qXgTw9iDj2RfrYZSTzq7d2mYMGNsHulxcFTwtUEaO503SFlqLq97HgL3Q
 6Gs4fFgtGCEj+6VM54hHYuA6kKudxLKFzNpYiToylit5XU/8bQ7BYg4o9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298931859"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="298931859"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645737287"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/mtl: PERF_LIMIT_REASONS changes for MTL
Date: Fri,  9 Sep 2022 17:12:01 -0700
Message-Id: <20220910001202.1733349-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
References: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
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
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PERF_LIMIT_REASONS register for MTL media gt is different now.

v2: Avoid static inline for intel_gt_perf_limit_reasons_reg() (Jani)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            | 6 ++++++
 drivers/gpu/drm/i915/gt/intel_gt.h            | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 6 +++---
 drivers/gpu/drm/i915/i915_reg.h               | 1 +
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index b59fb03ed274..46929afa18c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -229,6 +229,12 @@ static void gen6_clear_engine_error_register(struct intel_engine_cs *engine)
 	GEN6_RING_FAULT_REG_POSTING_READ(engine);
 }
 
+i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt)
+{
+	return gt->type == GT_MEDIA ?
+		MTL_MEDIA_PERF_LIMIT_REASONS : GT0_PERF_LIMIT_REASONS;
+}
+
 void
 intel_gt_clear_error_registers(struct intel_gt *gt,
 			       intel_engine_mask_t engine_mask)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 2ee582e287c8..e0365d556248 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -60,6 +60,7 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
 int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
 
 void intel_gt_check_and_clear_faults(struct intel_gt *gt);
+i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt);
 void intel_gt_clear_error_registers(struct intel_gt *gt,
 				    intel_engine_mask_t engine_mask);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index a009cf69103a..68310881a793 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -661,7 +661,7 @@ static int perf_limit_reasons_get(void *data, u64 *val)
 	intel_wakeref_t wakeref;
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		*val = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
+		*val = intel_uncore_read(gt->uncore, intel_gt_perf_limit_reasons_reg(gt));
 
 	return 0;
 }
@@ -677,7 +677,7 @@ static int perf_limit_reasons_clear(void *data, u64 val)
 	 * "status" bits except that the "log" bits remain set until cleared.
 	 */
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		intel_uncore_rmw(gt->uncore, GT0_PERF_LIMIT_REASONS,
+		intel_uncore_rmw(gt->uncore, intel_gt_perf_limit_reasons_reg(gt),
 				 GT0_PERF_LIMIT_REASONS_LOG_MASK, 0);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index e066cc33d9f2..54deae45d81f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -510,7 +510,7 @@ struct intel_gt_bool_throttle_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
 			char *buf);
-	i915_reg_t reg32;
+	i915_reg_t (*reg32)(struct intel_gt *gt);
 	u32 mask;
 };
 
@@ -521,7 +521,7 @@ static ssize_t throttle_reason_bool_show(struct device *dev,
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
 	struct intel_gt_bool_throttle_attr *t_attr =
 				(struct intel_gt_bool_throttle_attr *) attr;
-	bool val = rps_read_mask_mmio(&gt->rps, t_attr->reg32, t_attr->mask);
+	bool val = rps_read_mask_mmio(&gt->rps, t_attr->reg32(gt), t_attr->mask);
 
 	return sysfs_emit(buff, "%u\n", val);
 }
@@ -530,7 +530,7 @@ static ssize_t throttle_reason_bool_show(struct device *dev,
 struct intel_gt_bool_throttle_attr attr_##sysfs_func__ = { \
 	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
 	.show = throttle_reason_bool_show, \
-	.reg32 = GT0_PERF_LIMIT_REASONS, \
+	.reg32 = intel_gt_perf_limit_reasons_reg, \
 	.mask = mask__, \
 }
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 58b0ed9dddd5..38e895ad4b59 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1803,6 +1803,7 @@
 #define   POWER_LIMIT_1_MASK		REG_BIT(10)
 #define   POWER_LIMIT_2_MASK		REG_BIT(11)
 #define   GT0_PERF_LIMIT_REASONS_LOG_MASK REG_GENMASK(31, 16)
+#define MTL_MEDIA_PERF_LIMIT_REASONS	_MMIO(0x138030)
 
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
-- 
2.34.1

