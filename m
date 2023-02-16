Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6F699A91
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EDF10EE1E;
	Thu, 16 Feb 2023 16:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4F10EE13;
 Thu, 16 Feb 2023 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676566376; x=1708102376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExsM7GldvYDB1PI7GY7sD00fjxSKkGkWXoAwtGWPBgY=;
 b=ZnGzzuODe3AdCXw2OkaIo0cEWQvWXEPVYZaTb91XKpUf1asnJpGx9jAr
 qZYR30wmdOCcUuDAoucOVT59D2FRMdsPvZzvu+pUkZWI5cOQG5inG/alq
 dk2GXszUUYOjcM/UNI8PLlFHGk9ibR9f5tAVlUHvq6PmMJ3eWplaY1+XW
 LPsGVdQ2skLkCETEqlZ5ZvzI89G1/HyjtOuLasMVpvE/dx0RZ14EywPVD
 5AJdq1LV+yWaozJA67dvOR9Q1drTv1RT4vkujuyBpDLDFcpNkoG5+sLwN
 f6Vpq8gD7jxNwG9sEsA1UbgtqfW5RPWoIdvcnGvpbZyVCfTO8KdhPfB0q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333961933"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333961933"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915738622"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915738622"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:48 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/hwmon: Replace hwm_field_scale_and_write with
 hwm_power_max_write
Date: Thu, 16 Feb 2023 08:49:43 -0800
Message-Id: <20230216164944.2366150-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
References: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hwm_field_scale_and_write has a single caller hwm_power_write and is
specific to hwm_power_write but makes it appear that it is a general
function which can have multiple callers. Replace the function with
hwm_power_max_write which is specific to hwm_power_write and use that in
future patches where the function needs to be extended.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 36 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 1225bc432f0d5..85195d61f89c7 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -99,20 +99,6 @@ hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
 }
 
-static void
-hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
-			  int nshift, unsigned int scale_factor, long lval)
-{
-	u32 nval;
-
-	/* Computation in 64-bits to avoid overflow. Round to nearest. */
-	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
-
-	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
-					    PKG_PWR_LIM_1,
-					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
-}
-
 /*
  * hwm_energy - Obtain energy value
  *
@@ -391,6 +377,21 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
 	return 0;
 }
 
+static int
+hwm_power_max_write(struct hwm_drvdata *ddat, long val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 nval;
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
+
+	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
+					    PKG_PWR_LIM_1,
+					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
+	return 0;
+}
+
 static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
@@ -425,16 +426,11 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 static int
 hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 {
-	struct i915_hwmon *hwmon = ddat->hwmon;
 	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
-		hwm_field_scale_and_write(ddat,
-					  hwmon->rg.pkg_rapl_limit,
-					  hwmon->scl_shift_power,
-					  SF_POWER, val);
-		return 0;
+		return hwm_power_max_write(ddat, val);
 	case hwmon_power_crit:
 		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
 		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
-- 
2.38.0

