Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FB3D9744
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6CC6E4B5;
	Wed, 28 Jul 2021 21:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167EE6E2B8;
 Wed, 28 Jul 2021 21:12:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212740390"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212740390"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 14:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="580995359"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2021 14:12:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/i915/guc/slpc: Gate Host RPS when SLPC is enabled
Date: Wed, 28 Jul 2021 14:11:32 -0700
Message-Id: <20210728211144.15322-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
References: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also ensure uc_init is called before we initialize RPS so that we
can check for SLPC support. We do not need to enable up/down
interrupts when SLPC is enabled. However, we still need the ARAT
interrupt, which will be enabled separately later.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index a64aa43f7cd9..04dd69bcf6cb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -41,8 +41,8 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 	intel_gt_init_timelines(gt);
 	intel_gt_pm_init_early(gt);
 
-	intel_rps_init_early(&gt->rps);
 	intel_uc_init_early(&gt->uc);
+	intel_rps_init_early(&gt->rps);
 }
 
 int intel_gt_probe_lmem(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 0c8e7f2b06f0..e858eeb2c59d 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
 	return rps_to_gt(rps)->uncore;
 }
 
+static bool rps_uses_slpc(struct intel_rps *rps)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+
+	return intel_uc_uses_guc_slpc(&gt->uc);
+}
+
 static u32 rps_pm_sanitize_mask(struct intel_rps *rps, u32 mask)
 {
 	return mask & ~rps->pm_intrmsk_mbz;
@@ -167,6 +174,8 @@ static void rps_enable_interrupts(struct intel_rps *rps)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 
+	GEM_BUG_ON(rps_uses_slpc(rps));
+
 	GT_TRACE(gt, "interrupts:on rps->pm_events: %x, rps_pm_mask:%x\n",
 		 rps->pm_events, rps_pm_mask(rps, rps->last_freq));
 
@@ -771,6 +780,8 @@ static int gen6_rps_set(struct intel_rps *rps, u8 val)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 swreq;
 
+	GEM_BUG_ON(rps_uses_slpc(rps));
+
 	if (GRAPHICS_VER(i915) >= 9)
 		swreq = GEN9_FREQUENCY(val);
 	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
@@ -861,6 +872,9 @@ void intel_rps_park(struct intel_rps *rps)
 {
 	int adj;
 
+	if (!intel_rps_is_enabled(rps))
+		return;
+
 	GEM_BUG_ON(atomic_read(&rps->num_waiters));
 
 	if (!intel_rps_clear_active(rps))
@@ -1829,6 +1843,9 @@ void intel_rps_init(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 
+	if (rps_uses_slpc(rps))
+		return;
+
 	if (IS_CHERRYVIEW(i915))
 		chv_rps_init(rps);
 	else if (IS_VALLEYVIEW(i915))
@@ -1885,6 +1902,9 @@ void intel_rps_init(struct intel_rps *rps)
 
 void intel_rps_sanitize(struct intel_rps *rps)
 {
+	if (rps_uses_slpc(rps))
+		return;
+
 	if (GRAPHICS_VER(rps_to_i915(rps)) >= 6)
 		rps_disable_interrupts(rps);
 }
-- 
2.25.0

