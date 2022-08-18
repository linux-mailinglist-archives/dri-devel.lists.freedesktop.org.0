Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D455259915B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA3210E9A1;
	Thu, 18 Aug 2022 23:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDCD10E034;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866151; x=1692402151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtFCra1ufjdEZ1lMUAXUIcmSQvC0TpBT4UG0KjhcJi0=;
 b=eN+m23ccKziclRExfUKmxwO4HJPTGpZTBnxOpPnpYewE4IsYgyg0yiUk
 J6jHThxpoLbLl6CGldAwWBlN2jU1eOVyqbhvZmuoeTSC9AY8SB6n3mLIM
 gEhzxtWzI8HGcajPEA/UU/lJyVzDzf7QwyQwMBGj+tShkfPtAV/tGPD8V
 zdlSxiMEqMR6agv0RPlUDOdniMifgjTWKx6kYUz0K7ut+46k8hKJsG7wy
 Ur+0PIQFninqsWc2r+9PZl0Hjmh48FFitbw1yfKRm+eR4cUI6aOqS5We4
 wtvyZebDvymAUnnBT7Ezp57FOFBg+IHSzoEMlf0CSneMUwHUOQwRvjlKY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938521"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938521"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953298"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/21] drm/i915: Extract wm latency adjustment to its own
 function
Date: Thu, 18 Aug 2022 16:41:54 -0700
Message-Id: <20220818234202.451742-14-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Watermark latency is adjusted in cases when latency is 0us for level
greater than 1, the subsequent levels are disabled. Extract this logic
into its own function.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 88 ++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index ef7553b494ea..898e56d2eaf7 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2861,15 +2861,59 @@ static void ilk_compute_wm_level(const struct drm_i915_private *dev_priv,
 	result->enable = true;
 }
 
+static void
+adjust_wm_latency(u16 wm[], int max_level, int read_latency,
+		  bool wm_lv_0_adjust_needed)
+{
+	int i, level;
+
+	/*
+	 * If a level n (n > 1) has a 0us latency, all levels m (m >= n)
+	 * need to be disabled. We make sure to sanitize the values out
+	 * of the punit to satisfy this requirement.
+	 */
+	for (level = 1; level <= max_level; level++) {
+		if (wm[level] == 0) {
+			for (i = level + 1; i <= max_level; i++)
+				wm[i] = 0;
+
+			max_level = level - 1;
+			break;
+		}
+	}
+
+	/*
+	 * WaWmMemoryReadLatency
+	 *
+	 * punit doesn't take into account the read latency so we need
+	 * to add proper adjustement to each valid level we retrieve
+	 * from the punit when level 0 response data is 0us.
+	 */
+	if (wm[0] == 0) {
+		for (level = 0; level <= max_level; level++)
+			wm[level] += read_latency;
+	}
+
+	/*
+	 * WA Level-0 adjustment for 16GB DIMMs: SKL+
+	 * If we could not get dimm info enable this WA to prevent from
+	 * any underrun. If not able to get Dimm info assume 16GB dimm
+	 * to avoid any underrun.
+	 */
+	if (wm_lv_0_adjust_needed)
+		wm[0] += 1;
+}
+
 static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 				  u16 wm[])
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
 	if (DISPLAY_VER(dev_priv) >= 9) {
+		int read_latency = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
 		u32 val;
-		int ret, i;
-		int level, max_level = ilk_wm_max_level(dev_priv);
+		int ret;
+		int max_level = ilk_wm_max_level(dev_priv);
 		int mult = IS_DG2(dev_priv) ? 2 : 1;
 
 		/* read the first set of memory latencies[0:3] */
@@ -2909,44 +2953,8 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 		wm[7] = ((val >> GEN9_MEM_LATENCY_LEVEL_3_7_SHIFT) &
 				GEN9_MEM_LATENCY_LEVEL_MASK) * mult;
 
-		/*
-		 * If a level n (n > 1) has a 0us latency, all levels m (m >= n)
-		 * need to be disabled. We make sure to sanitize the values out
-		 * of the punit to satisfy this requirement.
-		 */
-		for (level = 1; level <= max_level; level++) {
-			if (wm[level] == 0) {
-				for (i = level + 1; i <= max_level; i++)
-					wm[i] = 0;
-
-				max_level = level - 1;
-
-				break;
-			}
-		}
-
-		/*
-		 * WaWmMemoryReadLatency
-		 *
-		 * punit doesn't take into account the read latency so we need
-		 * to add proper adjustement to each valid level we retrieve
-		 * from the punit when level 0 response data is 0us.
-		 */
-		if (wm[0] == 0) {
-			u8 adjust = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
-
-			for (level = 0; level <= max_level; level++)
-				wm[level] += adjust;
-		}
-
-		/*
-		 * WA Level-0 adjustment for 16GB DIMMs: SKL+
-		 * If we could not get dimm info enable this WA to prevent from
-		 * any underrun. If not able to get Dimm info assume 16GB dimm
-		 * to avoid any underrun.
-		 */
-		if (dev_priv->dram_info.wm_lv_0_adjust_needed)
-			wm[0] += 1;
+		adjust_wm_latency(wm, max_level, read_latency,
+				  dev_priv->dram_info.wm_lv_0_adjust_needed);
 	} else if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
 		u64 sskpd = intel_uncore_read64(uncore, MCH_SSKPD);
 
-- 
2.25.1

