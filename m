Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35460540A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 01:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28D10E19E;
	Wed, 19 Oct 2022 23:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40A410E194;
 Wed, 19 Oct 2022 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666222646; x=1697758646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NEj9hCgH9amIjl5vEaEkvWCaCpM7/AhXPOdZeuT6x0E=;
 b=CoHA2QUhx1bK25gBzcb+ZFh0vHE98aa582M19p1fOvlXW7NiliNt01yK
 agE+RrzhNwUqVcuExbccgMmeQrYEdZOOO4k4YuBw5u8luM5kJexwJ8VUP
 VG2WzAMb+SgEP2RLStblHNggXrYELfkDN4L5RLCGwzyWu0w39L3f4fWJf
 iluQLgjAiNCe8ro2PTP84e8nchEtfkzNn67+Ibgk5qQOGFqrn7KKb6UhX
 DS/Pg1iPVqMTDVL1zUXm06NekTeiFpW6iAR4qrjZj+/3BI8S7eDb4Jgin
 lLoiZonBptJQsf3lqAAFEWYJlHFmUuXNl+GMcMp7fjvlqCfd4xhaFgHHZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392860769"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392860769"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718723322"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718723322"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/mtl: Modify CAGF functions for MTL
Date: Wed, 19 Oct 2022 16:37:19 -0700
Message-Id: <20221019233721.3270601-4-ashutosh.dixit@intel.com>
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

From: Badal Nilawar <badal.nilawar@intel.com>

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
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  4 ++++
 drivers/gpu/drm/i915/gt/intel_rps.c     | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index f8c4f758ac0b1..d8dbd0ac3b064 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -21,6 +21,10 @@
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
index da6b969f554b6..63cc7c538401e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2093,7 +2093,9 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
 
-	if (GRAPHICS_VER(i915) >= 12)
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		cagf = REG_FIELD_GET(MTL_CAGF_MASK, rpstat);
+	else if (GRAPHICS_VER(i915) >= 12)
 		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
 	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
@@ -2115,7 +2117,13 @@ static u32 read_cagf(struct intel_rps *rps)
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
2.38.0

