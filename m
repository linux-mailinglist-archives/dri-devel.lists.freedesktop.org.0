Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73207E0A9E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 22:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175BE10EACC;
	Fri,  3 Nov 2023 21:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2C10EACB;
 Fri,  3 Nov 2023 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699045978; x=1730581978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5WZW9XM1Pe9RKsTD1TKpLYhXERImPiDx+ZU6x9jAe20=;
 b=giKYQ0uPczxhkyn74sqdq4WROlylPg+IxMcuhtYBu2JtpXr8iSSAdZLV
 KLCW1v2ZJD0ytapIjm59KpmcAuqP227wwY3S8aF0fR5ss2Zq08DpgS5Nj
 u2usr7DjZlexW2dsHgWArDGakiwTiSYRj1nFQiN5JsOqoN4OQrB0pCMZn
 gO5K3lPaGiLrKL/BObpbs8iR0D1BPuiW7HkBO7K3mliIRhcCmtiYc9TBT
 NFGWb6k5DR8+5cubfXh9ivvjOzEk1kpJYyqJ5LJFWdoDN3krxFmYrYSz0
 6ypaluYyX7GdkaSwP6pDuxsejAdtIXDOqJGOQYIC83iVWb09pRKVNhV6c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379416730"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="379416730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790877346"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="790877346"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 14:12:56 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 2/6] drm/i915/psr: Move psr specific dpcd init into own
 function
Date: Sat,  4 Nov 2023 02:30:31 +0530
Message-Id: <20231103210035.3151502-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231103210035.3151502-1-animesh.manna@intel.com>
References: <20231103210035.3151502-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jouni Högander <jouni.hogander@intel.com>

This patch is preparing adding panel replay specific dpcd init.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 41 +++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index ecd24a0b86cb..48da60005ceb 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -474,27 +474,22 @@ static void intel_dp_get_su_granularity(struct intel_dp *intel_dp)
 	intel_dp->psr.su_y_granularity = y;
 }
 
-void intel_psr_init_dpcd(struct intel_dp *intel_dp)
+static void _psr_init_dpcd(struct intel_dp *intel_dp)
 {
-	struct drm_i915_private *dev_priv =
+	struct drm_i915_private *i915 =
 		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
 
-	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
-			 sizeof(intel_dp->psr_dpcd));
-
-	if (!intel_dp->psr_dpcd[0])
-		return;
-	drm_dbg_kms(&dev_priv->drm, "eDP panel supports PSR version %x\n",
+	drm_dbg_kms(&i915->drm, "eDP panel supports PSR version %x\n",
 		    intel_dp->psr_dpcd[0]);
 
 	if (drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_NO_PSR)) {
-		drm_dbg_kms(&dev_priv->drm,
+		drm_dbg_kms(&i915->drm,
 			    "PSR support not currently available for this panel\n");
 		return;
 	}
 
 	if (!(intel_dp->edp_dpcd[1] & DP_EDP_SET_POWER_CAP)) {
-		drm_dbg_kms(&dev_priv->drm,
+		drm_dbg_kms(&i915->drm,
 			    "Panel lacks power state control, PSR cannot be enabled\n");
 		return;
 	}
@@ -503,8 +498,8 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 	intel_dp->psr.sink_sync_latency =
 		intel_dp_get_sink_sync_latency(intel_dp);
 
-	if (DISPLAY_VER(dev_priv) >= 9 &&
-	    (intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_IS_SUPPORTED)) {
+	if (DISPLAY_VER(i915) >= 9 &&
+	    intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_IS_SUPPORTED) {
 		bool y_req = intel_dp->psr_dpcd[1] &
 			     DP_PSR2_SU_Y_COORDINATE_REQUIRED;
 		bool alpm = intel_dp_get_alpm_status(intel_dp);
@@ -521,14 +516,24 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 		 * GTC first.
 		 */
 		intel_dp->psr.sink_psr2_support = y_req && alpm;
-		drm_dbg_kms(&dev_priv->drm, "PSR2 %ssupported\n",
+		drm_dbg_kms(&i915->drm, "PSR2 %ssupported\n",
 			    intel_dp->psr.sink_psr2_support ? "" : "not ");
+	}
+}
 
-		if (intel_dp->psr.sink_psr2_support) {
-			intel_dp->psr.colorimetry_support =
-				intel_dp_get_colorimetry_status(intel_dp);
-			intel_dp_get_su_granularity(intel_dp);
-		}
+void intel_psr_init_dpcd(struct intel_dp *intel_dp)
+{
+	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
+			 sizeof(intel_dp->psr_dpcd));
+
+	if (intel_dp->psr_dpcd[0])
+		_psr_init_dpcd(intel_dp);
+	/* TODO: Add PR case here */
+
+	if (intel_dp->psr.sink_psr2_support) {
+		intel_dp->psr.colorimetry_support =
+			intel_dp_get_colorimetry_status(intel_dp);
+		intel_dp_get_su_granularity(intel_dp);
 	}
 }
 
-- 
2.29.0

