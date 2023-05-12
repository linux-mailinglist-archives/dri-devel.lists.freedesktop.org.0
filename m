Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1770007F
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C897E10E63F;
	Fri, 12 May 2023 06:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A2E10E633;
 Fri, 12 May 2023 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872951; x=1715408951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OiQOhdrSBdqRIJxZBW57QOFE78MeAYDJXfr8AQctszg=;
 b=Gx25Ph+EqgbknfSxnMkFTB4D26CfrIYhrv9ZRQTBUwcmXrevPgcI/10I
 N7qrNJuEMrE58wqyJ9YXcyP8+ey1NiSNAyGQM20pS9LaEDDcC1Om+Qx1S
 o21XBHChUNJjF1p9eB1uBau+wZHcIF4B3drqKXhoQLBSYObuOTMfPlFjp
 2IXxN/qB7hH5+lkSWITx86JGULkK/DVGqYQsjBMO5SZxxQfTrLgxTcNom
 hC5HFUHOzvZmGUh155ptMYXCrokoIPfAwfLsJLXd9lhe7wsmZAzc64lHL
 jz7HD9ta3MrNzxIQgZLZ+Q3x2ZRzaE1WK91wERKRBW93Muksh1cOjBBpD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741971"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741971"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941305"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941305"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc
 also
Date: Fri, 12 May 2023 11:54:13 +0530
Message-Id: <20230512062417.2584427-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
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

For DSC the min BPC is 8 for ICL+ and so the min pipe_bpp is 24.
Check this condition for cases where bpc is forced by debugfs flag
dsc_force_bpc. If the check fails, then WARN and ignore the debugfs
flag.

For MST case the pipe_bpp is already computed (hardcoded to be 24),
and this check is not required.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 48 ++++++++++++++++---------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7ea4f27a4bf5..83fb198fcdae 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1646,6 +1646,13 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
 	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
 }
 
+static
+bool is_dsc_pipe_bpp_sufficient(int pipe_bpp)
+{
+	/* Min Input BPC for ICL+ is 8 */
+	return (pipe_bpp < 8 * 3);
+}
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -1657,7 +1664,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
-	int pipe_bpp;
 	int ret;
 
 	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
@@ -1669,28 +1675,36 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
-	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
-	} else if (compute_pipe_bpp) {
-		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	} else {
-		pipe_bpp = pipe_config->pipe_bpp;
-	}
+	if (compute_pipe_bpp) {
+		int pipe_bpp;
+		int forced_bpp = intel_dp->force_dsc_bpc * 3;
 
-	/* Min Input BPC for ICL+ is 8 */
-	if (pipe_bpp < 8 * 3) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "No DSC support for less than 8bpc\n");
-		return -EINVAL;
+		if (forced_bpp && is_dsc_pipe_bpp_sufficient(forced_bpp)) {
+			pipe_bpp = forced_bpp;
+			drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
+		} else {
+			drm_WARN(&dev_priv->drm,
+				 forced_bpp && !is_dsc_pipe_bpp_sufficient(forced_bpp),
+				 "Cannot force dsc bpc:%d, due to dsc bpc limits\n",
+				 intel_dp->force_dsc_bpc);
+
+			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
+							    conn_state->max_requested_bpc);
+
+			if (!is_dsc_pipe_bpp_sufficient(pipe_bpp)) {
+				drm_dbg_kms(&dev_priv->drm, "No DSC support for less than 8bpc\n");
+				return -EINVAL;
+			}
+		}
+
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
 
@@ -1719,7 +1733,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 								    adjusted_mode->crtc_hdisplay,
 								    pipe_config->bigjoiner_pipes,
 								    pipe_config->output_format,
-								    pipe_bpp,
+								    pipe_config->pipe_bpp,
 								    timeslots);
 			/*
 			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
-- 
2.25.1

