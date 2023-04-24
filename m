Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781B6E99B5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE9C10E0DE;
	Thu, 20 Apr 2023 16:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528AF10E0DE;
 Thu, 20 Apr 2023 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682008849; x=1713544849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GR3ul24aJo0gSwIsKJq13YfS/fmCotar311LsjDTn6Y=;
 b=HxTG+tj3bpl5OuWxZrzCn0stKePkffkCofMZTk8FApf2lyCcM09SpSiJ
 0HgYEV+S2gEbZGwrS4ow0nd5YoFoUXL54GTFPPEuFAiHPCUGZjLkzEyE0
 F/+MomLdPvlk81BBPtkM7+PBqjuuaIPArwmDDKgwpE4X/lEK6dZnbmfb9
 Z/7nvHTxiMjJtJ5QCYUElqzzNwIF1gO+1mPLq1lPz82JEgP3nDZcAWxb2
 IoQyAM0UBTGxAk75+zYERnlhVERFNCjg2TWNV9lTX+TNohudzu7L3VUlR
 gESLr+5Xrt1aMfWmlHOaxLBwIkanqBPx51H/eFLIARqbOU3rgUO7lfCeI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344540945"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344540945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724479584"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="724479584"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:40:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/hwmon: Get mutex and rpm ref just once in
 hwm_power_max_write
Date: Thu, 20 Apr 2023 09:40:39 -0700
Message-Id: <20230420164041.1428455-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230420164041.1428455-1-ashutosh.dixit@intel.com>
References: <20230420164041.1428455-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for follow-on patches, refactor hwm_power_max_write to take
hwmon_lock and runtime pm wakeref at start of the function and release them
at the end, therefore acquiring these just once each.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 8e7dccc8d3a0e..7f44e809ca155 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -396,31 +396,33 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
 	intel_wakeref_t wakeref;
+	int ret = 0;
 	u32 nval;
 
+	mutex_lock(&hwmon->hwmon_lock);
+	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
+
 	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
 	if (val == PL1_DISABLE) {
-		mutex_lock(&hwmon->hwmon_lock);
-		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
-			intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
-					 PKG_PWR_LIM_1_EN, 0);
-			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
-		}
-		mutex_unlock(&hwmon->hwmon_lock);
+		intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
+				 PKG_PWR_LIM_1_EN, 0);
+		nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
 
 		if (nval & PKG_PWR_LIM_1_EN)
-			return -ENODEV;
-		return 0;
+			ret = -ENODEV;
+		goto exit;
 	}
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
 	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
 
-	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
-					    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
-					    nval);
-	return 0;
+	intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
+			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
+exit:
+	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
 }
 
 static int
-- 
2.38.0

