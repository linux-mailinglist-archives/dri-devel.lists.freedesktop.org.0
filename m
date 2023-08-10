Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8F777925
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0EF10E52C;
	Thu, 10 Aug 2023 13:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A210E527;
 Thu, 10 Aug 2023 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672893; x=1723208893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/JHxGTMOkfoWs/3sDluPscy7r1Tfl4zDaRsbT3Fsm3c=;
 b=Vi6ahlhlqg3vItsaVEP2mp+KKaDayTVrfph5GtXlIF3GV3PnA+R0YXVf
 hjlb6AAK9tYum+kRb4Pv/TcQJfXOZAF5o030uDuewDwoJrLYEhcudCBUC
 UVdDTg4mwusjY1PUqcZIDjWnEzunwakPIqXAuYDD9MReO25hJEFSGkkV3
 9T95m/dtCvTthmpDHlX34l97Es8HUBgQZJLasjhqnhO7QWTqSLdTd737A
 3Eb6l1q9KzWCFYajMi6KfiooF3NiYjde6hlMn2F0QOqy2hEi6/kr2pIqs
 2f9SqpPYggToJajLovSKs+Q9iotFOvdtksVEtJIKprLJOQ/am3gaRtK9y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358586"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358586"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143253"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143253"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src input bpc
 with DSC
Date: Thu, 10 Aug 2023 18:33:09 +0530
Message-Id: <20230810130319.3708392-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Separate out functions for getting maximum and minimum input BPC based
on platforms, when DSC is used.

v2: Use HAS_DSC macro instead of platform check while getting min input
bpc. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 35 +++++++++++++++++++------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c13efd0b7c98..b414d09b5e80 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1535,6 +1535,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
+static
+u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
+{
+	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+	if (DISPLAY_VER(i915) >= 12)
+		return 12;
+	if (DISPLAY_VER(i915) == 11)
+		return 10;
+
+	return 0;
+}
+
 int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -1542,11 +1554,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 	u8 dsc_bpc[3] = {0};
 	u8 dsc_max_bpc;
 
-	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
-	if (DISPLAY_VER(i915) >= 12)
-		dsc_max_bpc = min_t(u8, 12, max_req_bpc);
-	else
-		dsc_max_bpc = min_t(u8, 10, max_req_bpc);
+	dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(i915);
+
+	if (!dsc_max_bpc)
+		return dsc_max_bpc;
+
+	dsc_max_bpc = min_t(u8, dsc_max_bpc, max_req_bpc);
 
 	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
 						       dsc_bpc);
@@ -1674,6 +1687,13 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
 	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
 }
 
+static
+u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
+{
+	/* Min DSC Input BPC for ICL+ is 8 */
+	return HAS_DSC(i915) ? 8 : 0;
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1707,10 +1727,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		pipe_bpp = pipe_config->pipe_bpp;
 	}
 
-	/* Min Input BPC for ICL+ is 8 */
-	if (pipe_bpp < 8 * 3) {
+	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
 		drm_dbg_kms(&dev_priv->drm,
-			    "No DSC support for less than 8bpc\n");
+			    "Computed BPC less than min supported by source for DSC\n");
 		return -EINVAL;
 	}
 
-- 
2.40.1

