Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015BC60540B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 01:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1510E194;
	Wed, 19 Oct 2022 23:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C026E10E170;
 Wed, 19 Oct 2022 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666222646; x=1697758646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLDDx/xz9Kk11gKjk5+uTdqdnF9ZP/xFJgfqpsW6r1g=;
 b=Ci9L5vPOYUqZzlBa0/JeJjotDAPqpjATnudFK9OAOee4Q9E9BnVZLYf6
 RyIaOgot9Dp9i7a2pNx0zT1jSKp8cDXShVwHclQoEiASwqqziDfAtrFK5
 xtICl9pBH7xUIHTzjCLbrihMw6whnAmFE/AeDaYdV6fVeLnDxEuvhZaeX
 im9RuSWo+jlHvBs2h6rh8ncHhmcbhsoxQdESueEOJtYm9qGWsUc6O/bz9
 HL4tR7gyoEhq1EnY03nW9meJUShulhXJYDMyhvx/pKOC4OvafcJJ99vd/
 DBGD+WhsndbPAHFI2rC54meFEDtBhCoXwXk4ETomStREkhbQaFAMrY1L+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392860768"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392860768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718723319"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718723319"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Use GEN12_RPSTAT register for GT freq
Date: Wed, 19 Oct 2022 16:37:18 -0700
Message-Id: <20221019233721.3270601-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Don Hiatt <don.hiatt@intel.com>

On GEN12+ use GEN12_RPSTAT register to get actual resolved GT
freq. GEN12_RPSTAT does not require a forcewake and will return 0 freq if
GT is in RC6.

v2:
  - Fixed review comments(Ashutosh)
  - Added function intel_rps_read_rpstat_fw to read RPSTAT without
    forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)
v3:
  - Updated commit title and message for more clarity (Ashutosh)
  - Replaced intel_rps_read_rpstat with direct read to GEN12_RPSTAT1 in
    read_cagf (Ashutosh)
v4: Remove GEN12_CAGF_SHIFT and use REG_FIELD_GET (Rodrigo)

Cc: Don Hiatt <donhiatt@gmail.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Don Hiatt <don.hiatt@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 drivers/gpu/drm/i915/gt/intel_rps.c     | 32 +++++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_rps.h     |  2 ++
 drivers/gpu/drm/i915/i915_pmu.c         |  3 +--
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 35c039573294c..f8c4f758ac0b1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1539,6 +1539,7 @@
 
 #define GEN12_RPSTAT1				_MMIO(0x1381b4)
 #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
 
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 5bd6671554a6e..da6b969f554b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2068,12 +2068,34 @@ void intel_rps_sanitize(struct intel_rps *rps)
 		rps_disable_interrupts(rps);
 }
 
+u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
+
+	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
+}
+
+u32 intel_rps_read_rpstat(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
+
+	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
+}
+
 u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+	if (GRAPHICS_VER(i915) >= 12)
+		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
+	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
 	else if (GRAPHICS_VER(i915) >= 9)
 		cagf = REG_FIELD_GET(GEN9_CAGF_MASK, rpstat);
@@ -2093,7 +2115,9 @@ static u32 read_cagf(struct intel_rps *rps)
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	u32 freq;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
+	if (GRAPHICS_VER(i915) >= 12) {
+		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
+	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
@@ -2259,7 +2283,7 @@ static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
 	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
 
-	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
+	rpstat = intel_rps_read_rpstat(rps);
 	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
 	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
 	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
@@ -2394,7 +2418,7 @@ static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
 	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
 		   rps->pm_intrmsk_mbz);
-	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
+	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_rps_read_rpstat(rps));
 	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
 	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
 		   intel_gpu_freq(rps, caps.min_freq));
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 110300dfd4383..9e1cad9ba0e9c 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -48,6 +48,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
 u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
 u32 intel_rps_read_punit_req(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
+u32 intel_rps_read_rpstat(struct intel_rps *rps);
+u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
 void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 958b37123bf12..67140a87182f8 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -371,7 +371,6 @@ static void
 frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 {
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_uncore *uncore = gt->uncore;
 	struct i915_pmu *pmu = &i915->pmu;
 	struct intel_rps *rps = &gt->rps;
 
@@ -394,7 +393,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * case we assume the system is running at the intended
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
-		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
+		val = intel_rps_read_rpstat_fw(rps);
 		if (val)
 			val = intel_rps_get_cagf(rps, val);
 		else
-- 
2.38.0

