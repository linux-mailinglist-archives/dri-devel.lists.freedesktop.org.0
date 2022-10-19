Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E2605410
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 01:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4A010E1A2;
	Wed, 19 Oct 2022 23:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C6210E162;
 Wed, 19 Oct 2022 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666222646; x=1697758646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYeakL9upHvNamrH5JXZSE3iuPu11x12qPcS0Fa8Fww=;
 b=TQKCAhbZVqMdVm9Ta2zrcWnsVSeI1maJsHl7o9aR65VFRgfRIBfC6kSw
 q0AtKAubB+YuIpDG9okocb56CgL+VeS8YnNWsmjWbPoXLR7PZQ/VRt+O3
 kCwCMW6DzyjyOlxCDgXR1XfWLKwT9hOiEhaSOFJURRt6gX/xdBetrTM+j
 PN4z0qebO4v9x9jVdg3yu2LLMcpJJp49sI3jLrZLrtxPmGWY71E7Fd2Xu
 H3SNd8Frmdf29uBikHoRrZWSyHZ4JkSKnUCgzCW3j57nmU5d2iO0qwh6f
 MvoZNevm0CIA6Y8v9+U7qKapoj14eeTssvO9Te+H+cjUHCL1qxVqhd0w7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392860767"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392860767"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718723316"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718723316"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
Date: Wed, 19 Oct 2022 16:37:17 -0700
Message-Id: <20221019233721.3270601-2-ashutosh.dixit@intel.com>
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

Instead of masks/shifts settle on REG_FIELD_GET as the standard way to
extract reg fields. This allows future patches touching this code to also
consistently use REG_FIELD_GET and friends.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
index fc23c562d9b2a..5bd6671554a6e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2074,16 +2074,15 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
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

