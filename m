Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FDD418AE4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 22:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3C96E558;
	Sun, 26 Sep 2021 20:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B376E558;
 Sun, 26 Sep 2021 20:10:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="285381150"
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="285381150"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 13:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,324,1624345200"; d="scan'208";a="705610353"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2021 13:10:20 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.154.207])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 18QKAJio000675; Sun, 26 Sep 2021 21:10:19 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, CQ Tang <cq.tang@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/i915: Use fixed offset for PTEs location
Date: Sun, 26 Sep 2021 22:10:05 +0200
Message-Id: <20210926201005.1450-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We assumed that for all modern GENs the PTEs and register space are
split in the GTTMMADR BAR, but while it is true, we should rather use
fixed offset as it is defined in the specification.

Bspec: 4409, 4457, 4604, 11181, 9027, 13246, 13321, 44980

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index ba7c7ed89fa8..f17383e76eb7 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -813,6 +813,21 @@ static unsigned int chv_get_total_gtt_size(u16 gmch_ctrl)
 	return 0;
 }
 
+static unsigned int gen6_gttmmadr_size(struct drm_i915_private *i915)
+{
+	/*
+	 * GEN6: GTTMMADR size is 4MB and GTTADR starts at 2MB offset
+	 * GEN8: GTTMMADR size is 16MB and GTTADR starts at 8MB offset
+	 */
+	GEM_BUG_ON(GRAPHICS_VER(i915) < 6);
+	return (GRAPHICS_VER(i915) < 8) ? SZ_4M : SZ_16M;
+}
+
+static unsigned int gen6_gttadr_offset(struct drm_i915_private *i915)
+{
+	return gen6_gttmmadr_size(i915) / 2;
+}
+
 static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 {
 	struct drm_i915_private *i915 = ggtt->vm.i915;
@@ -821,8 +836,8 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	u32 pte_flags;
 	int ret;
 
-	/* For Modern GENs the PTEs and register space are split in the BAR */
-	phys_addr = pci_resource_start(pdev, 0) + pci_resource_len(pdev, 0) / 2;
+	GEM_WARN_ON(pci_resource_len(pdev, 0) != gen6_gttmmadr_size(i915));
+	phys_addr = pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
 
 	/*
 	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
-- 
2.25.1

