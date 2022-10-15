Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DC5FF83A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 05:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6610E339;
	Sat, 15 Oct 2022 03:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FCC10E334;
 Sat, 15 Oct 2022 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665804385; x=1697340385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5czxsX7fpHUBMhTPlWEmOoW+ZHtyBiuocTKQOL1c+54=;
 b=WNtAw42HknCwqnuWnzj1RRFw+foUjvUobLR2Mry/USjv6LWVXmaZYEP2
 wk6HYg5bNGaq+RwRbUj2PA9uUpmd7SXekW0mvXuQZCtUSqa4CMQ+pGnsh
 HQwr4L+qXhlPhsKDek5WMPVVcucXM34rGubUlVlbrQzXft1DlYZWhJTL0
 rs5UqefjFDEohkyqjIxqQTmfjQduVgaLROHiZCjZDji4zZAIKKWgreXJr
 8HHdQZT63M80TqajjYgMhmkfdi3HMqRcc3G5pKp7lHf3KCfZ3+X0S6eFV
 c2pDljf8Tu9dbyDJpbx8ltv1fODnqj9pLbMING3w95J26yMkzQJmJy4pH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="332035141"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="332035141"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660937799"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="660937799"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/mtl: Modify CAGF functions for MTL
Date: Fri, 14 Oct 2022 20:26:17 -0700
Message-Id: <20221015032618.2458429-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
References: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
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
Cc: Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

Update CAGF functions for MTL to get actual resolved frequency of 3D and
SAMedia.

v2: Update MTL_MIRROR_TARGET_WP1 position/formatting (MattR)
    Move MTL branches in cagf functions to top (MattR)
    Fix commit message (Andi)

Bspec: 66300

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 4 ++++
 drivers/gpu/drm/i915/gt/intel_rps.c     | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7f79bbf978284..66867747f643e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -8,6 +8,10 @@
 
 #include "i915_reg_defs.h"
 
+/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
+#define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
+#define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
 #define   GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fc23c562d9b2a..59ca7e80e4c6f 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2073,7 +2073,9 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		cagf = rpstat & MTL_CAGF_MASK;
+	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = (rpstat >> 8) & 0xff;
 	else if (GRAPHICS_VER(i915) >= 9)
 		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
@@ -2094,7 +2096,9 @@ static u32 read_cagf(struct intel_rps *rps)
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	u32 freq;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
+		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);
+	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
-- 
2.38.0

