Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F36F4635
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1210E588;
	Tue,  2 May 2023 14:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FCC10E588;
 Tue,  2 May 2023 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038366; x=1714574366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uuyG4MekkC+E2hkOKaAYlq86ytV9648iCg3HkGxJWcU=;
 b=TEyRrIr8sYQFMX4bXYVWXWcrh8oW0wlc4A4iwVpKQGg92b4BlIpo4KOr
 dGEPizFMpK8UmPNgIyOqWOqYTMZHtfloXjEPNY+XZjOWwhc7kJqKHF5IF
 ksNAiMScq7qlOspQ3RXFZDwBfBUgYY1MMb+m++br1aZwMVAMMhjbFDMDw
 hdfvSOwb8+Ytvp2OyBg9JXL8l7SOYlxYnQSGK7BCpBNSuSGP+Xst0Ax0Y
 9PlgMYFm+bU3R6C61QrSbeAGbrdWZ26fzWELfv5emGAqy9U/2aN/mSVo7
 Uc2yGZprqgdjrthqPXjHWbcK+/GcLK1Ry8VOwd9EUs9+GY8aPGRF6tBXa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396889"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396889"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991766"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991766"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] drm/i915: Check lane count when determining FEC support
Date: Tue,  2 May 2023 17:39:00 +0300
Message-Id: <20230502143906.2401-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

ICL doesn't support FEC with a x1 DP link. Make sure
we don't try to enable FEC in such cases.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b27b4fb71ed7..9ac199444155 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1218,7 +1218,8 @@ static bool intel_dp_source_supports_fec(struct intel_dp *intel_dp,
 	if (DISPLAY_VER(dev_priv) >= 12)
 		return true;
 
-	if (DISPLAY_VER(dev_priv) == 11 && encoder->port != PORT_A)
+	if (DISPLAY_VER(dev_priv) == 11 &&
+	    encoder->port != PORT_A && pipe_config->lane_count != 1)
 		return true;
 
 	return false;
@@ -1234,7 +1235,7 @@ static bool intel_dp_supports_fec(struct intel_dp *intel_dp,
 static bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
 				  const struct intel_crtc_state *crtc_state)
 {
-	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP) && !crtc_state->fec_enable)
+	if (!intel_dp_is_edp(intel_dp) && !crtc_state->fec_enable)
 		return false;
 
 	return intel_dsc_source_support(crtc_state) &&
@@ -1580,15 +1581,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	int pipe_bpp;
 	int ret;
 
-	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
-		intel_dp_supports_fec(intel_dp, pipe_config);
-
-	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
-		return -EINVAL;
-
-	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
-		return -EINVAL;
-
 	if (compute_pipe_bpp)
 		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
 	else
@@ -1615,6 +1607,15 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
 
+	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
+		intel_dp_supports_fec(intel_dp, pipe_config);
+
+	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
+		return -EINVAL;
+
+	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
+		return -EINVAL;
+
 	if (intel_dp_is_edp(intel_dp)) {
 		pipe_config->dsc.compressed_bpp =
 			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-- 
2.39.2

