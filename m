Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A28747D1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D358112233;
	Thu,  7 Mar 2024 06:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCqbYcjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E8610FCAD;
 Thu,  7 Mar 2024 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709791224; x=1741327224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=63uDJblUzRqlJpEmAszeZB7sRpZVgIhgC1cZ578VUiE=;
 b=iCqbYcjMo6lHLtP39LpN5rhsqkGCnjFafLM5rDfqEDdFcAl/4KF4UH6u
 xMh9TquZnomq4aJ/oaiFQyWUrFflVjtd5/7yVJbZUzeU9u22bJLfR5QbU
 +fd5cWNZIDxKdxvLL7ThYqzYto3BQeRXQrJ4jV4HVqY5a8y9N8ipEdJct
 xsKJJqIP0+foiYMicKFb8YwwqV52qAyvdCpHPfH5oqK1Yhe4E+k7I13XW
 AuIwSQSsXqtXkEsLZrwE21OCClIrtyizmAt2rXz3puqH7k8a0WY3qcEiB
 oZRQgCWMyaw+O0ogWiodx/Ms3DuziwPmhP/fnhAohUxQ6z/2ITjkkykll g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4313115"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4313115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 22:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10087098"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2024 22:00:22 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v16 6/9] drm/i915/display: Compute AS SDP parameters
Date: Thu,  7 Mar 2024 11:23:26 +0530
Message-Id: <20240307055329.3238634-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add necessary function definitions to compute AS SDP data.
The new intel_dp_compute_as_sdp function computes AS SDP
values based on the display configuration, ensuring proper
handling of Variable Refresh Rate (VRR).

--v2:
- Added DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx(). [Ankit]
- Separated patch for intel_read/write_dp_sdp. [Ankit]
- _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward. [Ankit]
- Fixed indentation issues. [Ankit]

--v3:
- Added VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.

--v4:
- Added HAS_VRR check before writing AS SDP.

--v5:
Added missed HAS_VRR check before reading AS SDP.

--v6:
- Used Adaptive Sync sink status as a check for read/write SDP. (Ankit)

--v7:
- Remove as_sdp_enable from crtc_state.
- Add a comment mentioning current support of
  DP_AS_SDP_AVT_FIXED_VTOTAL.
- Add state checker for AS_SDP infoframe enable.

--v8:
- Drop conn_state from intel_dp_compute_as_sdp, as not used.
- Remove fullstop in subject line.

--v9:
- Add vrr.enable instead of is_in_vrr_range.

--v10:
- remove vrefresh and connector, as they are no  longer required.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a02100c58ae3..cf89e69d2e7a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2620,6 +2620,29 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
+static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state)
+{
+	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+
+	if (!crtc_state->vrr.enable ||
+	    !intel_dp_as_sdp_supported(intel_dp))
+		return;
+
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
+
+	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
+	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
+	as_sdp->length = 0x9;
+	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
+	as_sdp->vtotal = adjusted_mode->vtotal;
+	as_sdp->target_rr = 0;
+	as_sdp->duration_incr_ms = 0;
+	as_sdp->duration_incr_ms = 0;
+}
+
 static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 				     struct intel_crtc_state *crtc_state,
 				     const struct drm_connector_state *conn_state)
@@ -2980,6 +3003,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		g4x_dp_set_clock(encoder, pipe_config);
 
 	intel_vrr_compute_config(pipe_config, conn_state);
+	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
-- 
2.25.1

