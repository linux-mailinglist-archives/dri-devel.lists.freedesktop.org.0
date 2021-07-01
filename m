Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4693B977C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3F76EC15;
	Thu,  1 Jul 2021 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015FA6EC07;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436162"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564481"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 22/53] drm/i915/xehpsdv: factor out function to read
 RP_STATE_CAP
Date: Thu,  1 Jul 2021 13:23:56 -0700
Message-Id: <20210701202427.1547543-23-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

Instead of maintaining the same if ladder in 3 different places, add a
function to read RP_STATE_CAP.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c |  8 +++-----
 drivers/gpu/drm/i915/gt/intel_rps.c     | 17 ++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_rps.h     |  1 +
 drivers/gpu/drm/i915/i915_debugfs.c     |  8 +++-----
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
index 4270b5a34a83..1061a62bdfce 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
@@ -309,13 +309,11 @@ static int frequency_show(struct seq_file *m, void *unused)
 		int max_freq;
 
 		rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
-		if (IS_GEN9_LP(i915)) {
-			rp_state_cap = intel_uncore_read(uncore, BXT_RP_STATE_CAP);
+		rp_state_cap = intel_rps_read_state_cap(rps);
+		if (IS_GEN9_LP(i915))
 			gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
-		} else {
-			rp_state_cap = intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
+		else
 			gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
-		}
 
 		/* RPSTAT1 is in the GT power well */
 		intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 06e9a8ed4e03..490bc1513480 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -975,20 +975,16 @@ int intel_rps_set(struct intel_rps *rps, u8 val)
 static void gen6_rps_init(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
-	struct intel_uncore *uncore = rps_to_uncore(rps);
+	u32 rp_state_cap = intel_rps_read_state_cap(rps);
 
 	/* All of these values are in units of 50MHz */
 
 	/* static values from HW: RP0 > RP1 > RPn (min_freq) */
 	if (IS_GEN9_LP(i915)) {
-		u32 rp_state_cap = intel_uncore_read(uncore, BXT_RP_STATE_CAP);
-
 		rps->rp0_freq = (rp_state_cap >> 16) & 0xff;
 		rps->rp1_freq = (rp_state_cap >>  8) & 0xff;
 		rps->min_freq = (rp_state_cap >>  0) & 0xff;
 	} else {
-		u32 rp_state_cap = intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
-
 		rps->rp0_freq = (rp_state_cap >>  0) & 0xff;
 		rps->rp1_freq = (rp_state_cap >>  8) & 0xff;
 		rps->min_freq = (rp_state_cap >> 16) & 0xff;
@@ -1936,6 +1932,17 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 	return freq;
 }
 
+u32 intel_rps_read_state_cap(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	struct intel_uncore *uncore = rps_to_uncore(rps);
+
+	if (IS_GEN9_LP(i915))
+		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
+	else
+		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
+}
+
 /* External interface for intel_ips.ko */
 
 static struct drm_i915_private __rcu *ips_mchdev;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 1d2cfc98b510..6e06dd61f818 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -31,6 +31,7 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
 u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
+u32 intel_rps_read_state_cap(struct intel_rps *rps);
 
 void gen5_rps_irq_handler(struct intel_rps *rps);
 void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index cc745751ac53..6c83da3956b9 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -420,13 +420,11 @@ static int i915_frequency_info(struct seq_file *m, void *unused)
 		int max_freq;
 
 		rp_state_limits = intel_uncore_read(&dev_priv->uncore, GEN6_RP_STATE_LIMITS);
-		if (IS_GEN9_LP(dev_priv)) {
-			rp_state_cap = intel_uncore_read(&dev_priv->uncore, BXT_RP_STATE_CAP);
+		rp_state_cap = intel_rps_read_state_cap(rps);
+		if (IS_GEN9_LP(dev_priv))
 			gt_perf_status = intel_uncore_read(&dev_priv->uncore, BXT_GT_PERF_STATUS);
-		} else {
-			rp_state_cap = intel_uncore_read(&dev_priv->uncore, GEN6_RP_STATE_CAP);
+		else
 			gt_perf_status = intel_uncore_read(&dev_priv->uncore, GEN6_GT_PERF_STATUS);
-		}
 
 		/* RPSTAT1 is in the GT power well */
 		intel_uncore_forcewake_get(&dev_priv->uncore, FORCEWAKE_ALL);
-- 
2.25.4

