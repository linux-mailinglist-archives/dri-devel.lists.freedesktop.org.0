Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970755B4353
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 02:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2D10E1F8;
	Sat, 10 Sep 2022 00:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B36610E1D7;
 Sat, 10 Sep 2022 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662768726; x=1694304726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pU9THDl/2DNNNXvu0VAEOm1tXYUdQqN5S52KYa5Cv2Y=;
 b=Y2OktXPYgSnPaQ4WMjv51Z0O5OG5WTJjqehrHEN5SjGUAcHCQcxQ8Yuj
 fQhVxXuF3oLv0vst61PJvHFqNrGo2owpN7q5sjTaivrFIMlXTH5yoYowv
 SFE78OYdLGKn8wLeChHOaFbPbBYoYQGamILnC4OF5KkzAMqg03KynogqC
 qQeQZ1TzZY2LaK4Entyqj70OgqUhbCD9uEgLgl1Km6KXy6+VXgdqCwpOg
 KKFnCVkaV0B3Q0qxpM74LoMzhp3YstU2UYfbNy1znrvpkhyq1ZA0pjW69
 uw5Kn0og2P0n2UFYkfXOU5NFABalcpHg7HJKIGBBu2bQeIYuzov5EW2mp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298931861"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="298931861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645737290"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/rps: Freq caps for MTL
Date: Fri,  9 Sep 2022 17:12:02 -0700
Message-Id: <20220910001202.1733349-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
References: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
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
Cc: Tilak Tangudu <tilak.tangudu@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, when reading from HW, RP0, RP1 (actuall RPe) and RPn freq use an
entirely different set of registers with different fields, bitwidths and
units.

v2: Move MTL check into a separate function (Jani)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 46 +++++++++++++++++++++++------
 drivers/gpu/drm/i915/i915_reg.h     |  9 ++++++
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 6b86250c31ab..17b40b625e31 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1085,15 +1085,25 @@ static u32 intel_rps_read_state_cap(struct intel_rps *rps)
 		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
 }
 
-/**
- * gen6_rps_get_freq_caps - Get freq caps exposed by HW
- * @rps: the intel_rps structure
- * @caps: returned freq caps
- *
- * Returned "caps" frequencies should be converted to MHz using
- * intel_gpu_freq()
- */
-void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps)
+static void
+mtl_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps)
+{
+	struct intel_uncore *uncore = rps_to_uncore(rps);
+	u32 rp_state_cap = rps_to_gt(rps)->type == GT_MEDIA ?
+				intel_uncore_read(uncore, MTL_MEDIAP_STATE_CAP) :
+				intel_uncore_read(uncore, MTL_RP_STATE_CAP);
+	u32 rpe = rps_to_gt(rps)->type == GT_MEDIA ?
+			intel_uncore_read(uncore, MTL_MPE_FREQUENCY) :
+			intel_uncore_read(uncore, MTL_GT_RPE_FREQUENCY);
+
+	/* MTL values are in units of 16.67 MHz */
+	caps->rp0_freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, rp_state_cap);
+	caps->min_freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, rp_state_cap);
+	caps->rp1_freq = REG_FIELD_GET(MTL_RPE_MASK, rpe);
+}
+
+static void
+__gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 rp_state_cap;
@@ -1128,6 +1138,24 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
 	}
 }
 
+/**
+ * gen6_rps_get_freq_caps - Get freq caps exposed by HW
+ * @rps: the intel_rps structure
+ * @caps: returned freq caps
+ *
+ * Returned "caps" frequencies should be converted to MHz using
+ * intel_gpu_freq()
+ */
+void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+
+	if (IS_METEORLAKE(i915))
+		return mtl_get_freq_caps(rps, caps);
+	else
+		return __gen6_rps_get_freq_caps(rps, caps);
+}
+
 static void gen6_rps_init(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 38e895ad4b59..2101b6d6dae5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1792,6 +1792,15 @@
 #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
 #define PVC_RP_STATE_CAP	_MMIO(0x281014)
 
+#define MTL_RP_STATE_CAP	_MMIO(0x138000)
+#define MTL_MEDIAP_STATE_CAP	_MMIO(0x138020)
+#define   MTL_RP0_CAP_MASK	REG_GENMASK(8, 0)
+#define   MTL_RPN_CAP_MASK	REG_GENMASK(24, 16)
+
+#define MTL_GT_RPE_FREQUENCY	_MMIO(0x13800c)
+#define MTL_MPE_FREQUENCY	_MMIO(0x13802c)
+#define   MTL_RPE_MASK		REG_GENMASK(8, 0)
+
 #define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
 #define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
 #define   PROCHOT_MASK			REG_BIT(0)
-- 
2.34.1

