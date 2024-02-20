Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96E85C80B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392F10E539;
	Tue, 20 Feb 2024 21:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgLPNnFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EA689E1A;
 Tue, 20 Feb 2024 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463911; x=1739999911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4YwtN4qm1tiiGbcUE87wvjktz7sueBQO3OWffWZUDQ=;
 b=LgLPNnFeo7RjsTc80YIYCSOPSBRsTU8PuFbiwbeJGZjKJOK6iQe6QA/i
 UjQ/Qu0W30rkQJyIngQ7XoaVzRzGOcKmMxiZ+B8GbTynjC1nGO4/BoLCR
 sbrL45n79yCt3nObOiKTiAoUOHDepeUxgQT4uPBFQKX+PQlOvkvIRh7q4
 vdBBLbVgVtNq+fhWzec4akfEDLAJF/IGhmYOwdozBBVfNhXVfO9M+jg2n
 eMX7+0p2E2smglZAvc3B8/TW/6NY33BniP3Og6tW721tJu2WPrDDIIWQK
 6tiAUQHs1WPJ/YFT+x1W6SUe1JEX4Y1oQzVu/5kL/3348zFEm3PCuWvo7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738655"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738655"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061590"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:29 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 06/21] drm/i915/dp: Factor out
 intel_dp_config_required_rate()
Date: Tue, 20 Feb 2024 23:18:26 +0200
Message-Id: <20240220211841.448846-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out intel_dp_config_required_rate() used by a follow-up patch
enabling the DP tunnel BW allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++--------------
 drivers/gpu/drm/i915/display/intel_dp.h |  1 +
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a2ee43392142..c7e3e4efc324e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2343,6 +2343,17 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 						       limits);
 }
 
+int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int bpp = crtc_state->dsc.compression_enable ?
+		to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
+		crtc_state->pipe_bpp;
+
+	return intel_dp_link_required(adjusted_mode->crtc_clock, bpp);
+}
+
 static int
 intel_dp_compute_link_config(struct intel_encoder *encoder,
 			     struct intel_crtc_state *pipe_config,
@@ -2410,31 +2421,15 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			return ret;
 	}
 
-	if (pipe_config->dsc.compression_enable) {
-		drm_dbg_kms(&i915->drm,
-			    "DP lane count %d clock %d Input bpp %d Compressed bpp " BPP_X16_FMT "\n",
-			    pipe_config->lane_count, pipe_config->port_clock,
-			    pipe_config->pipe_bpp,
-			    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16));
+	drm_dbg_kms(&i915->drm,
+		    "DP lane count %d clock %d bpp input %d compressed " BPP_X16_FMT " link rate required %d available %d\n",
+		    pipe_config->lane_count, pipe_config->port_clock,
+		    pipe_config->pipe_bpp,
+		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    intel_dp_config_required_rate(pipe_config),
+		    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
+					      pipe_config->lane_count));
 
-		drm_dbg_kms(&i915->drm,
-			    "DP link rate required %i available %i\n",
-			    intel_dp_link_required(adjusted_mode->crtc_clock,
-						   to_bpp_int_roundup(pipe_config->dsc.compressed_bpp_x16)),
-			    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
-						      pipe_config->lane_count));
-	} else {
-		drm_dbg_kms(&i915->drm, "DP lane count %d clock %d bpp %d\n",
-			    pipe_config->lane_count, pipe_config->port_clock,
-			    pipe_config->pipe_bpp);
-
-		drm_dbg_kms(&i915->drm,
-			    "DP link rate required %i available %i\n",
-			    intel_dp_link_required(adjusted_mode->crtc_clock,
-						   pipe_config->pipe_bpp),
-			    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
-						      pipe_config->lane_count));
-	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 20252984b3b04..4667870fed31a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -100,6 +100,7 @@ void intel_dp_mst_suspend(struct drm_i915_private *dev_priv);
 void intel_dp_mst_resume(struct drm_i915_private *dev_priv);
 int intel_dp_max_link_rate(struct intel_dp *intel_dp);
 int intel_dp_max_lane_count(struct intel_dp *intel_dp);
+int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
-- 
2.39.2

