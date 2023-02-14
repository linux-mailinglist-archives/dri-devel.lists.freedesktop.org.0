Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D2695891
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 06:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F1010E7E1;
	Tue, 14 Feb 2023 05:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26210E09E;
 Tue, 14 Feb 2023 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676352827; x=1707888827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJ/xMsE8oYbVrFStu5170dGaUb4//n7xTmCg6/+dk7U=;
 b=UGJLDlXA7oEkJTVPlfBKdgrHl8f+G+xo1Hnoqx+Pfdxbhv/hXSPadpko
 sBFOE1uSfsSoq6QS6g3b9QPHiJ32GCb6n2Re6rB5ztb9012krpaFBcujK
 fkI7gp6yeQaVi4GUYRj6cxMuQNkCyWPpJHcXEhqOKfrHUkG0fvcsP62Nz
 FOk021J9dP0homk2Id9mjCzrCHQC8WPHd9ZNNvw9DFq/dNnr6IauYSW/I
 KtNihqz6L99StHsM2FcadXrYoFEe5REATCa4q4VYpHXkllURG+VlwVLFl
 fewRpv5T9XqaDazdhkampVu8x+fJNRVlwHKMn3CoI59Pisf5o9gJ/IDPc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491794"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="358491794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047078"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="669047078"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/hwmon: Replace hwm_field_scale_and_write with
 hwm_power_max_write
Date: Mon, 13 Feb 2023 21:33:40 -0800
Message-Id: <20230214053342.1952226-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hwm_field_scale_and_write has a single caller hwm_power_write and is
specific to hwm_power_write but makes it appear that it is a general
function which can have multiple callers. Replace the function with
hwm_power_max_write which is specific to hwm_power_write and use that in
future patches where the function needs to be extended.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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

