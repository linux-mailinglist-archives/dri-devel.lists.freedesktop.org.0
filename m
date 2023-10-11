Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4927C51D2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223210E6ED;
	Wed, 11 Oct 2023 11:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1D10E6DD;
 Wed, 11 Oct 2023 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697023383; x=1728559383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+x6N/+SlYIICyWcGJ3/MzYSCBbudHAE71/TFBkuKmL8=;
 b=NCrpjrOUY5Em3z6lK3uuqUkU5r3RBDEj1yfxBAF0DaDkYs6/gEIBv+1l
 KLlmbOor29MJmP8+/ZEzVj38Jtnpc+hyFB6t1Tc4HerEyY4ZHSC7uLAy8
 YErRGMQCb07tIgpLnbPhBWQjVNP+ky8751hQIvtsemdqJgB7kWnxKQ9a/
 SwOA6S6S+0Te9XiNEjGjULGyDZUfio4h7M8cTsJ+S38Qs42cv9GwzzH+5
 Fa+haBNCpwcZ46XhxyBNTRsyIXfUgdq7DUDZFUDfTxnZmDjC1b40hQRtQ
 eAU9NdMjyb8g+DocWoYS4R5zkr7eZaYZR157NskWqGuueOX9K2hYxqv57 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387482633"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387482633"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877630907"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877630907"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga004.jf.intel.com with ESMTP; 11 Oct 2023 04:21:34 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 2/6] drm/i915/psr: Move psr specific dpcd init into own
 function
Date: Wed, 11 Oct 2023 16:39:32 +0530
Message-Id: <20231011110936.1851563-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231011110936.1851563-1-animesh.manna@intel.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
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
 Jani Nikula <jani.nikula@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org
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
index bb65881e87cc..0669ab7a9191 100644
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

