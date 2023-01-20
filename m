Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30922674AF2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B4610EA21;
	Fri, 20 Jan 2023 04:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A01D10EA1D;
 Fri, 20 Jan 2023 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189722; x=1705725722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvbSwOsNO17/uA1/fk68386H5jFLajS89+qQqzO9S8E=;
 b=m8JaEC1bMaef9AUfcJKV5F4838cDJjwzdw1mWifgKC6iE7Ut/zLenqrp
 tNzWzksF7glbg9CugbPD/OY0GUheaw+mP++ok3dgpiWCdRGYVYpypdwRF
 MEKIoT0azqqe0P4jLKkX6CMO+H+Bn3mUI2efwVS5Fb5C7u/VV6i04AMoU
 Nf8qkQtDvE98s3fjaMx5wWWg08srTy/bab1CdB2T/bab0h7kz0I64W17r
 67g33VM71C8nbFrAC3H7KOdHzfQasghmRKMQqxn9pN4ir0C/4z8NGzudC
 x/P305pIYTPGSibzsTMYp0bVdcQqMPWuczoMiJXrltB1RZiVqyqF1SuHd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195472"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734922"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734922"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:58 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/16] drm/i915/dp: Do not check for min DSC BPC for MST case
Date: Fri, 20 Jan 2023 10:08:31 +0530
Message-Id: <20230120043844.3761895-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DSC the min BPC is 8 for ICL+ and so the min pipe_bpp is 24.
Check this condition for cases only where pipe_bpp is to be computed.
For MST case the pipe_bpp is already computed (hardcoded to be 24),
and this check is not required.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 46 ++++++++++++++++---------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3d828ea0894d..d061fc3fa402 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1480,6 +1480,13 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	return drm_dsc_compute_rc_parameters(vdsc_cfg);
 }
 
+static
+bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
+{
+	/* Min Input BPC for ICL+ is 8 */
+	return (pipe_bpp < 8 * 3);
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1491,7 +1498,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
-	int pipe_bpp;
 	int ret;
 
 	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
@@ -1501,27 +1507,35 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		return -EINVAL;
 
 	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
-	} else if (compute_pipe_bpp) {
-		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	} else {
-		pipe_bpp = pipe_config->pipe_bpp;
-	}
+		int forced_bpc = intel_dp->force_dsc_bpc;
+		int forced_bpp = forced_bpc * 3;
 
-	/* Min Input BPC for ICL+ is 8 */
-	if (pipe_bpp < 8 * 3) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "No DSC support for less than 8bpc\n");
-		return -EINVAL;
+		/* Min Input BPC for ICL+ is 8 */
+		if (forced_bpc < 8) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "Cannot force dsc bpc:%d, due to dsc bpc limits\n",
+				    intel_dp->force_dsc_bpc);
+			return -EINVAL;
+		}
+		pipe_config->pipe_bpp = forced_bpp;
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n",
+			    pipe_config->pipe_bpp);
+	} else if (compute_pipe_bpp) {
+		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
+							conn_state->max_requested_bpc);
+		if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "No DSC support for less than 8bpc\n");
+			return -EINVAL;
+		}
+		pipe_config->pipe_bpp = pipe_bpp;
 	}
 
 	/*
-	 * For now enable DSC for max bpp, max link rate, max lane count.
+	 * For now enable DSC for max link rate, max lane count.
 	 * Optimize this later for the minimum possible link rate/lane count
 	 * with DSC enabled for the requested mode.
 	 */
-	pipe_config->pipe_bpp = pipe_bpp;
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
 
@@ -1544,7 +1558,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							    adjusted_mode->crtc_clock,
 							    adjusted_mode->crtc_hdisplay,
 							    pipe_config->bigjoiner_pipes,
-							    pipe_bpp,
+							    pipe_config->pipe_bpp,
 							    timeslots);
 			if (!dsc_max_output_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
-- 
2.25.1

