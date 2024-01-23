Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863A838BD7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2022C10EF3F;
	Tue, 23 Jan 2024 10:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D22C10EA7F;
 Tue, 23 Jan 2024 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005724; x=1737541724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RiBykxeZLL6+QW7mH8+ye4vpmFbVa12qTQcxTsBclE=;
 b=AgctgxPGyHq2kS2Ya0vKhoIzPV9iBoDVWwUzBEaLL69I7GjGRYbXkgAW
 LQ8A6GKAmU8jGT9hHJ1uNWPDzb2U1UdBz/LoKgE3vdF9rUfjKpkw1YNJV
 t6G8/6UD2HLz0NGV9fN6PfQgkZZqtiMrmaVpP8pUuy/wtaZOvEpGJBuKA
 7czwPvNo7pQctWPZHVTsK8/kHoPKu5O6a2//HJImCmtx9IlBNCSgyBd3I
 BTWl8MaiitStqhdkoHHagqOIpNVBhs0USXfjttL+H8Son0X8y5WGwReF+
 5Jdd/L6WRynmiop759b8tJaxDK0wgUxiBpPIgN6hjkUjNWzM1eRfMBPx0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134142"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134142"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283380"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283380"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:43 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/19] drm/i915/dp: Factor out intel_dp_config_required_rate()
Date: Tue, 23 Jan 2024 12:28:36 +0200
Message-Id: <20240123102850.390126-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out intel_dp_config_required_rate() used by a follow-up patch
enabling the DP tunnel BW allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++--------------
 drivers/gpu/drm/i915/display/intel_dp.h |  1 +
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c7b06a9b197cc..0a5c60428ffb7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2338,6 +2338,17 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
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
@@ -2405,31 +2416,15 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
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
index 46f79747f807d..37274e3c2902f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -102,6 +102,7 @@ void intel_dp_mst_suspend(struct drm_i915_private *dev_priv);
 void intel_dp_mst_resume(struct drm_i915_private *dev_priv);
 int intel_dp_max_link_rate(struct intel_dp *intel_dp);
 int intel_dp_max_lane_count(struct intel_dp *intel_dp);
+int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
-- 
2.39.2

