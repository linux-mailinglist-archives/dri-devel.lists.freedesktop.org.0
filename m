Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07142627DC6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2278810E0B7;
	Mon, 14 Nov 2022 12:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327DA10E095;
 Mon, 14 Nov 2022 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429006; x=1699965006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54RdLD1bBdigsLuIgBxZL78157iFL76z3O7W5JAc6Xs=;
 b=jZmAOOTBFn/WpmzmIOSoGRDnvinVWUQQbV/+8JHZPpK+f1jXsNVj6x8f
 pXI7yAOmW4sZk7+Ez0G8Q7DtV9hOW+O7BBBRlL9Hh97NiMoS6E/MW+Lj6
 OGCUU1uPyKbZOWWbe9EjZeEOvDbDbnr8HPUh+givyBgWkDW5RJuo6kGIO
 lGv84fiVelQJHRXBOKOns8W0lZ87ERai4yFcxQkqSHi3EAwkE2LIWWkky
 nQYhiRgoRoLp2IM7KKMJ8opIWxcg8uKNux+zYR2CV/sL5/DRyYFiOampY
 1gCmSW+RvL50m3AHh+b8xyIce+YyKdNuFu/Msj/dPmwrC4a+D+7V+n9yR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960554"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960554"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509021"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509021"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:04 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
Date: Mon, 14 Nov 2022 18:03:44 +0530
Message-Id: <20221114123348.3474216-2-badal.nilawar@intel.com>
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

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
index 40d0a3be42ac..979e60294654 100644
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
index accf22ec57a2..4041a385baa8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -800,12 +800,9 @@
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
@@ -1377,8 +1374,7 @@
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
index effe60ac22cd..8a505e10f4c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2080,16 +2080,15 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
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
2.25.1

