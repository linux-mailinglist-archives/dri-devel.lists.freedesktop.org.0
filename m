Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE877920D1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F86010E446;
	Tue,  5 Sep 2023 07:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AF10E446;
 Tue,  5 Sep 2023 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693900022; x=1725436022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CvtCiT8gJUbupzLRRueJOqmVEwchgqmahGkRF1X5tw=;
 b=j1AuRJGcbzX2JYvN2bK1MiHs0qzl8rMoxUrBcskJJtZd7rLq3uQi4+N/
 nRqKTwDTKSku9u/HZ8+U5rXuu23jVQOm4HS4dcekuLvF9e3JGylzUvSEY
 oLfEBRFnzYakOxzcDTrGX+e722VHGmrIJ+Ogc7Ybs9J29ZfcysnnUf2hg
 m8y9k3Jw5kAXs/rEO+Yj56bxzjZIzv5Ta8nf1q6gXMkTajUuB5rETZ3ae
 eDdGBSS9cB1KuH2YzWyX7qvivb/ex8cDmdFxQvw4nxglTvXlY6CNuCMdK
 BfEelh0+k9an6L+pA9T7Ar9Oq+3dWHjsj8T7XRgDPkBX+wQZSX0Fi/iLQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443133637"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="443133637"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 00:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="855878467"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="855878467"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 00:46:59 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/6] drm/i915/psr: Move psr specific dpcd init into own
 function
Date: Tue,  5 Sep 2023 13:05:47 +0530
Message-Id: <20230905073551.958368-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230905073551.958368-1-animesh.manna@intel.com>
References: <20230905073551.958368-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jouni Högander <jouni.hogander@intel.com>

This patch is preparing adding panel replay specific dpcd init.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 39 +++++++++++++-----------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b9e38acc5132..24eed99e8811 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -473,27 +473,22 @@ static void intel_dp_get_su_granularity(struct intel_dp *intel_dp)
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
@@ -502,7 +497,7 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 	intel_dp->psr.sink_sync_latency =
 		intel_dp_get_sink_sync_latency(intel_dp);
 
-	if (DISPLAY_VER(dev_priv) >= 9 &&
+	if (DISPLAY_VER(i915) >= 9 &&
 	    (intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_IS_SUPPORTED)) {
 		bool y_req = intel_dp->psr_dpcd[1] &
 			     DP_PSR2_SU_Y_COORDINATE_REQUIRED;
@@ -520,14 +515,24 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
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

