Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84F627DC8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FC410E123;
	Mon, 14 Nov 2022 12:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900DB10E0A0;
 Mon, 14 Nov 2022 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429009; x=1699965009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u6E6OY2rrM7lySomgnOH7CfEhxsVb9CwYINznpcLMVM=;
 b=Gqv8TAahxmc8BIqP7ZONY8vVtaD3jXg5usjQ9Y1KVEW4Riw1d5PnXfX9
 I8qhvW1r5Fw2Yv3ktBG729LHFvSXXdDWLb3Kj5gqyD4o5TEX0isAYzOmx
 cl5kJZHng2M6t6oAScm19cIQF8TSOS2CgFkDZzdnt+hBS7YdnYQZtdixk
 rDrKNLLc/iGVsxRtm/mLRFw8Ut8ET0B/jKPq2GYqpKSxR6VvWOBHgJoZe
 tc47VUtb/6hU+7o5vmaGcthG/tf4ylBj2ATw/Ro4db9XQwgiAx7LXLE8x
 /6yLN+LKm94S87w+KkmyReV/insalThmZQ/kuuCVYG8yUch0ja1eUdEoV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960578"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509069"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509069"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:07 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/mtl: Modify CAGF functions for MTL
Date: Mon, 14 Nov 2022 18:03:46 +0530
Message-Id: <20221114123348.3474216-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114123348.3474216-1-badal.nilawar@intel.com>
References: <20221114123348.3474216-1-badal.nilawar@intel.com>
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
Cc: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update CAGF functions for MTL to get actual resolved frequency of 3D and
SAMedia.

v2: Update MTL_MIRROR_TARGET_WP1 position/formatting (MattR)
    Move MTL branches in cagf functions to top (MattR)
    Fix commit message (Andi)
v3: Added comment about registers not needing forcewake for Gen12+ and
    returning 0 freq in RC6
v4: Use REG_FIELD_GET and uncore (Rodrigo)

Bspec: 66300

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  4 ++++
 drivers/gpu/drm/i915/gt/intel_rps.c     | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index d24fd292af71..a4da7de78420 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -22,6 +22,10 @@
  */
 #define PERF_REG(offset)			_MMIO(offset)
 
+/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
+#define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
+#define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
 #define   GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 9909d1f0db63..9ad3bc7201cb 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2099,7 +2099,9 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
 
-	if (GRAPHICS_VER(i915) >= 12)
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		cagf = REG_FIELD_GET(MTL_CAGF_MASK, rpstat);
+	else if (GRAPHICS_VER(i915) >= 12)
 		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
 	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
@@ -2121,7 +2123,13 @@ static u32 read_cagf(struct intel_rps *rps)
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	u32 freq;
 
-	if (GRAPHICS_VER(i915) >= 12) {
+	/*
+	 * For Gen12+ reading freq from HW does not need a forcewake and
+	 * registers will return 0 freq when GT is in RC6
+	 */
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
+		freq = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
+	} else if (GRAPHICS_VER(i915) >= 12) {
 		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
 	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
-- 
2.25.1

