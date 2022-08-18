Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC809599162
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8A10E536;
	Thu, 18 Aug 2022 23:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F6210E361;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866152; x=1692402152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zR/nNCKpubf0cgXkGMS+TmgY4vesMO3h8ll5/xTE3kA=;
 b=BcdVtJGMxr6BnAgXmLdfjvJ3Ao234fH70AQSx0S9Xw8TvErxMrScNCoT
 XoApqkewV8vGSuCEDub5WI3j8J7AZG2QS5VhG6gQ3cCiVFLw1jCzOYBC6
 Ed+Z044O5d87U9a9EeLKaHOU5C7YlYRqhffQl0ugvy0D1wE5+UwOif4Xp
 48lBuiIHUHoXi0SfK50ycvc6IhKK3xBDXkuhq2LX/HLxXbLVNIi+/wzCt
 1We8cALsxEuElKAanzgjhsSZJxdsMSjGR4YvteDGN2UIhu99wqKCMJBzu
 vuY9WnikXctYNgbvZOrMky9xGjMjQ87xtVH2hg+eXhGshRatilpuILCas Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938524"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938524"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953299"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/21] drm/i915/mtl: memory latency data from
 LATENCY_LPX_LPY for WM
Date: Thu, 18 Aug 2022 16:41:55 -0700
Message-Id: <20220818234202.451742-15-radhakrishna.sripada@intel.com>
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

Since Xe LPD+, Memory latency data are in LATENCY_LPX_LPY registers
instead of GT driver mailbox.

v2: Use the extracted wm latency adjustment function(Matt)

Bspec: 64608

Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h |  7 +++++++
 drivers/gpu/drm/i915/intel_pm.c | 21 ++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 04a269fa8717..b2d5e1230c25 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8390,4 +8390,11 @@ enum skl_power_gate {
 #define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
 
 #define MTL_MEDIA_GSI_BASE		0x380000
+
+#define MTL_LATENCY_LP0_LP1		_MMIO(0x45780)
+#define MTL_LATENCY_LP2_LP3		_MMIO(0x45784)
+#define MTL_LATENCY_LP4_LP5		_MMIO(0x45788)
+#define  MTL_LATENCY_LEVEL0_2_4_MASK	REG_GENMASK(12, 0)
+#define  MTL_LATENCY_LEVEL1_3_5_MASK	REG_GENMASK(28, 16)
+
 #endif /* _I915_REG_H_ */
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 898e56d2eaf7..fac565d23d57 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2908,13 +2908,28 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 				  u16 wm[])
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
+	int max_level = ilk_wm_max_level(dev_priv);
 
-	if (DISPLAY_VER(dev_priv) >= 9) {
+	if (DISPLAY_VER(dev_priv) >= 14) {
+		u32 val;
+
+		val = intel_uncore_read(uncore, MTL_LATENCY_LP0_LP1);
+		wm[0] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
+		wm[1] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
+		val = intel_uncore_read(uncore, MTL_LATENCY_LP2_LP3);
+		wm[2] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
+		wm[3] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
+		val = intel_uncore_read(uncore, MTL_LATENCY_LP4_LP5);
+		wm[4] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
+		wm[5] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
+
+		adjust_wm_latency(wm, max_level, 6,
+				  dev_priv->dram_info.wm_lv_0_adjust_needed);
+	} else if (DISPLAY_VER(dev_priv) >= 9) {
 		int read_latency = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
+		int mult = IS_DG2(dev_priv) ? 2 : 1;
 		u32 val;
 		int ret;
-		int max_level = ilk_wm_max_level(dev_priv);
-		int mult = IS_DG2(dev_priv) ? 2 : 1;
 
 		/* read the first set of memory latencies[0:3] */
 		val = 0; /* data0 to be programmed to 0 for first set */
-- 
2.25.1

