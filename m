Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E917662EB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A36510E652;
	Fri, 28 Jul 2023 04:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD28710E648;
 Fri, 28 Jul 2023 04:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517744; x=1722053744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=smYLeSZChn7Wuza9j//Jk7cKtK5mdL/zX92hJg8q7NQ=;
 b=PHrBDmlvWNwb5ZzgJN1kYIRgjUqzLkMPaZMqkvf78y0G6xefNrkdPZg1
 PSfSEtT4is7jZUkC7UauBLm/dm0408BUCP2kQjkHOsREtQKEwmAVMSR4m
 KA4fzAs/C3O3aZrjaYTftkslB23pbQ4jLg6mSsTJ1yq4V9ZtTytYn87Br
 5hqTypgzNLnDRUKLVVXzDWP7Y0KgykAFFEegRrdB+ZBHfy8mK2axcS3/M
 5ZJH4cedBkitaGJRBCtXFzQPs9TzGLvUcWNW5sjGL98rSHfYDsoUdoYoH
 WMzrG9YJ76b84TzdNVgLgjrgNpgjRA58NKjPTLicPF0E3pxxNCGUcIRQu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104182"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104182"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276322"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276322"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:42 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src input bpc
 with DSC
Date: Fri, 28 Jul 2023 09:41:40 +0530
Message-Id: <20230728041150.2524032-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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
index 7ec8a478e000..f41de126a8d3 100644
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
@@ -1674,6 +1687,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
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
@@ -1707,10 +1730,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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

