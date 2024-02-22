Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963F85F7EF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A173D10E8F0;
	Thu, 22 Feb 2024 12:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TO2OjmpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D26110E695;
 Thu, 22 Feb 2024 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708604364; x=1740140364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LPDisoAwyvd+xSpF3HXSgz6ak3MwS8ufI1bcH+yaW74=;
 b=TO2OjmpG9+MxDoK0Uhcp0OgT14YDMqDPMR6QdHr0EnzBJUfiBR/1S7UK
 6VHMnLI/RK6Z2ve//zHW61VpBsBes/KD2loPpCiWr8TEzSShsao632spt
 2ZgbbOgGIcEsd3wtg6KXplMZMbPflWqosJk05SmKjZI1QQlo0a9g7PG7E
 bzppmGi/OrX/QI2fjjtttiLFaATFZQNON+RB8IL2Zkwzg4Y7bJygC3+36
 mcToIJpIvq2eCRa04b0I790HhjtBOrQsegmDsOMLsDks2rgh4x/MEZ3qt
 Nm36b6xN+LkpxzaJQTd0mPRW+CWLh4iQ2gSRS2nkHMbRgRJMQ800xyefp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20257342"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="20257342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5682124"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2024 04:19:21 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 4/6] drm/i915/display: Compute AS SDP parameters.
Date: Thu, 22 Feb 2024 17:42:21 +0530
Message-Id: <20240222121223.2257958-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add necessary functions definitions to enable
and compute AS SDP data. The new `intel_dp_compute_as_sdp`
function computes AS SDP values based on the display
configuration, ensuring proper handling of Variable Refresh
Rate (VRR).

--v2:
- Add DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx().[Ankit]
- separate patch for intel_read/write_dp_sdp [Ankit].
- _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward [Ankit]
- To fix indentation [Ankit]

--v3:
- Add VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.

--v4:
- Add HAS_VRR check before write as sdp.

--v5:
- Add missed HAS_VRR check before read as sdp.

--v6:
Use Adaptive Sync sink status, which can be
used as a check for read/write sdp. (Ankit)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.c      |  4 ++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 2accfe41160d..93b4b7dff1d0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1415,6 +1415,7 @@ struct intel_crtc_state {
 		u8 pipeline_full;
 		u16 flipline, vmin, vmax, guardband;
 		u8 as_sdp_mode;
+		bool as_sdp_enable;
 	} vrr;
 
 	/* Stream Splitter for eDP MSO */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b370e1da4735..5c1e2301dd52 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2617,6 +2617,33 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
+static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    const struct drm_connector_state *conn_state)
+{
+	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int vrefresh = drm_mode_vrefresh(adjusted_mode);
+
+	if (!intel_vrr_is_in_range(connector, vrefresh) || !crtc_state->vrr.as_sdp_enable)
+		return;
+
+	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
+	as_sdp->length = 0x9;
+	as_sdp->mode = crtc_state->vrr.as_sdp_mode;
+	as_sdp->vtotal = adjusted_mode->vtotal;
+
+	if (as_sdp->mode == DP_AS_SDP_AVT_FIXED_VTOTAL) {
+		as_sdp->target_rr = 0;
+		as_sdp->duration_incr_ms = 0;
+		as_sdp->duration_incr_ms = 0;
+	}
+
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
+}
+
 static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 				     struct intel_crtc_state *crtc_state,
 				     const struct drm_connector_state *conn_state)
@@ -2942,6 +2969,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		g4x_dp_set_clock(encoder, pipe_config);
 
 	intel_vrr_compute_config(pipe_config, conn_state);
+	intel_dp_compute_as_sdp(intel_dp, pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d2ab7e571e62..08e3ba69bd30 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -167,9 +167,11 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 
-		if (drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd))
+		if (drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd)) {
+			crtc_state->vrr.as_sdp_enable = true;
 			crtc_state->vrr.as_sdp_mode =
 						DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
+		}
 	}
 }
 
-- 
2.25.1

