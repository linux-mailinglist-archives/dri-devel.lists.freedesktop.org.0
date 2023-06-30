Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8026743C3A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503F910E476;
	Fri, 30 Jun 2023 12:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3210E46F;
 Fri, 30 Jun 2023 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129470; x=1719665470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XXgH3zF7rXTDNxNcbTcPb+aD5mSZGVo6/zNzhyXuT0=;
 b=anWdzwvobN8g0Sx0DhJthVR/8JInK53FWytIEDpbm+yZa2gSM3QPhq8K
 1e3IiBMzGd1DbiHu05OumOnk/RY/jnK9ffq2I+AJzyIMUNWhxfqKyZF0z
 Y7bWzzuDIvFhkZa/AtZ40ehaTCbl/2xmp+We7cjCQeeGFGSpVdvAEI2/G
 qb0Tj8VS2Xzoc6yo7ao4WbIbLzB0H8UhP0aRUGBFMPHVP8xJZaSlnZ9oZ
 z2X5hUwZLBs6VOyP/+tBBuwTNGKS/p+OaJS/FgYRvjFHusrQKiu7ZEMSo
 csfuGc/qwzYSOfW9WsK04hKW9XOYywhVyufuhjEtvPRYZcM60X9AVblhF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232213"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232213"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219084"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219084"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/19] drm/i915/dp: Add functions to get min/max src input bpc
 with DSC
Date: Fri, 30 Jun 2023 18:16:43 +0530
Message-Id: <20230630124652.4140932-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
index df262a623811..1abcdf42e408 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1524,6 +1524,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
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
@@ -1531,11 +1543,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
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
@@ -1663,6 +1676,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
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
@@ -1695,10 +1718,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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

