Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF5751F03
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8047110E689;
	Thu, 13 Jul 2023 10:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72510E687;
 Thu, 13 Jul 2023 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244683; x=1720780683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OWl1L2olCbxTBWDD7gAvupa/FqaGLrQfc9l7lN1r8dY=;
 b=aL4j1g6IPRBrXhtTl1wE+0ijFZEXreinZzoK5ok+xqPUavDKaTyjlKFZ
 UlmY79WIUJ2GT4y1kjVOl8PVblKH3yjrbWYg24rfzcCCjfuVAe1gRk86O
 YjJkX9kJeCm1mMnmA25PHY0/hkEj2K1cUvRnfcHwa3r2/vkC+idQ/s/y4
 fYQ/5kiNOaShcm/Mmb92xjEMkYtLLLPk3K0yI3YXvZ8WKIIgBlV4ovegR
 6QLDQjO6kvV3k9UJq/3ciPiYN2msjY0dqQpnMQ+at4PfL52Lu/NWd0pd6
 yBksorn7mSZL+QTn1q4D4Uqo2oM4tB0zipZVc6hCwT5LQTa3tW3jqYcpP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897641"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965415"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965415"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:38:00 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/19] drm/i915/dp: Add functions to get min/max src input bpc
 with DSC
Date: Thu, 13 Jul 2023 16:03:38 +0530
Message-Id: <20230713103346.1163315-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 11e54e6ee985..5cc62c51372d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1533,6 +1533,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
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
@@ -1540,11 +1552,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
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
@@ -1672,6 +1685,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
 	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
 }
 
+static
+u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
+{
+	/* Min DSC Input BPC for ICL+ is 8 */
+	if (DISPLAY_VER(i915) >= 11)
+		return 8;
+
+	return 0;
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1705,10 +1728,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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

