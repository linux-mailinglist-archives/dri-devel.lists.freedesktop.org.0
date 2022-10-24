Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C930B60BA01
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA7C10E7B3;
	Mon, 24 Oct 2022 20:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F332410E7AD;
 Mon, 24 Oct 2022 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666643067; x=1698179067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QO0XOcQhbLGAO/MZJvB8MMCtqSZQyvqZREO6JWWyo7U=;
 b=eiVtOqZF+6ZDrqtAnIhFKxdFRaRQpHWF60x2AACOlFaDfcWp1yWGM95X
 Kyq8eS5s57Ft0XUAkmgB9iKxJ5HhgJHnOmxHNht3cotm9MzDgfEIA3FTJ
 6pxWaQG8P0KKnaHyLjgHZ/afvO88VivZwTsAWttT4OZg0vxMkFsc3XjoS
 qh9dRvIbvXfPadCW4xwahCCCIRdA4A+VaIM46Iu7REltAiUVFOemudHEN
 nXno3a3PloVI49ciRDh61v8bAgQ/2CPRZcKw4EWpfxP8xaykZB00DD9Xu
 KIhDJbcadeancWdxkRPkNfyALZYh6QTEkOdRWjllLU1QGnXc+3ruPUNGc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="309201998"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="309201998"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:24:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806426158"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="806426158"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:24:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
Date: Mon, 24 Oct 2022 13:24:18 -0700
Message-Id: <20221024202422.3924298-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024202422.3924298-1-ashutosh.dixit@intel.com>
References: <20221024202422.3924298-1-ashutosh.dixit@intel.com>
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

Instead of masks/shifts settle on REG_FIELD_GET as the standard way to
extract reg fields. This allows future patches touching this code to also
consistently use REG_FIELD_GET and friends.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 12 ++++--------
 drivers/gpu/drm/i915/gt/intel_rps.c           | 11 +++++------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 40d0a3be42acf..979e602946549 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -307,7 +307,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
 		drm_printf(p, "Current VID: %d\n", (rgvstat & MEMSTAT_VID_MASK) >>
 			   MEMSTAT_VID_SHIFT);
 		drm_printf(p, "Current P-state: %d\n",
-			   (rgvstat & MEMSTAT_PSTATE_MASK) >> MEMSTAT_PSTATE_SHIFT);
+			   REG_FIELD_GET(MEMSTAT_PSTATE_MASK, rgvstat));
 	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		u32 rpmodectl, freq_sts;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 36d95b79022c0..35c039573294c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -794,12 +794,9 @@
 #define GEN6_RP_DOWN_TIMEOUT			_MMIO(0xa010)
 #define GEN6_RP_INTERRUPT_LIMITS		_MMIO(0xa014)
 #define GEN6_RPSTAT1				_MMIO(0xa01c)
-#define   GEN6_CAGF_SHIFT			8
-#define   HSW_CAGF_SHIFT			7
-#define   GEN9_CAGF_SHIFT			23
-#define   GEN6_CAGF_MASK			(0x7f << GEN6_CAGF_SHIFT)
-#define   HSW_CAGF_MASK				(0x7f << HSW_CAGF_SHIFT)
-#define   GEN9_CAGF_MASK			(0x1ff << GEN9_CAGF_SHIFT)
+#define   GEN6_CAGF_MASK			REG_GENMASK(14, 8)
+#define   HSW_CAGF_MASK				REG_GENMASK(13, 7)
+#define   GEN9_CAGF_MASK			REG_GENMASK(31, 23)
 #define GEN6_RP_CONTROL				_MMIO(0xa024)
 #define   GEN6_RP_MEDIA_TURBO			(1 << 11)
 #define   GEN6_RP_MEDIA_MODE_MASK		(3 << 9)
@@ -1370,8 +1367,7 @@
 #define MEMSTAT_ILK				_MMIO(0x111f8)
 #define   MEMSTAT_VID_MASK			0x7f00
 #define   MEMSTAT_VID_SHIFT			8
-#define   MEMSTAT_PSTATE_MASK			0x00f8
-#define   MEMSTAT_PSTATE_SHIFT			3
+#define   MEMSTAT_PSTATE_MASK			REG_GENMASK(7, 3)
 #define   MEMSTAT_MON_ACTV			(1 << 2)
 #define   MEMSTAT_SRC_CTL_MASK			0x0003
 #define   MEMSTAT_SRC_CTL_CORE			0
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 070005dd0da47..5061b5b3cece7 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2072,16 +2072,15 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	u32 cagf;
 
 	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
-		cagf = (rpstat >> 8) & 0xff;
+		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
 	else if (GRAPHICS_VER(i915) >= 9)
-		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
+		cagf = REG_FIELD_GET(GEN9_CAGF_MASK, rpstat);
 	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
-		cagf = (rpstat & HSW_CAGF_MASK) >> HSW_CAGF_SHIFT;
+		cagf = REG_FIELD_GET(HSW_CAGF_MASK, rpstat);
 	else if (GRAPHICS_VER(i915) >= 6)
-		cagf = (rpstat & GEN6_CAGF_MASK) >> GEN6_CAGF_SHIFT;
+		cagf = REG_FIELD_GET(GEN6_CAGF_MASK, rpstat);
 	else
-		cagf = gen5_invert_freq(rps, (rpstat & MEMSTAT_PSTATE_MASK) >>
-					MEMSTAT_PSTATE_SHIFT);
+		cagf = gen5_invert_freq(rps, REG_FIELD_GET(MEMSTAT_PSTATE_MASK, rpstat));
 
 	return cagf;
 }
-- 
2.38.0

