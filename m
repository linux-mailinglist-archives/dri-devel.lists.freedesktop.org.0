Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3746D743C22
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D710E17C;
	Fri, 30 Jun 2023 12:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE910E161;
 Fri, 30 Jun 2023 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129447; x=1719665447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LP/6l0ua/BrstcCewgKLEAp4i7s0qFOZd/HpMMokWrE=;
 b=LZ8lIpYIAQe3P9N/ndXbYaIgvn8Hz9L0bb4ZMKw8d4qmdG+Tt+SyqG6I
 PvUn0wKw8zSxYfGJOXdTm+oqN1Y2xAtOkLVBIHmPn3Dl+Zf3ntuuLJSRo
 t4o24ba9Kd6AECcf8YSs3WNDrIeqmkar/qQnRH2cWL2Zq3ShBUUak745Z
 0djPkOQIwpDaKAVC9Dafr/G7QCC2YKFskAvQn0HJXEH7N094MYb/2ewUH
 925E2N+rXFuKk5BkE7dsrU/2dbMQrfpt5y1ilWT/iaTmwzcsLkjEpzXoO
 GvPE26rel8DJCxy0ZWX0prajIA8d+FzgC01WccLaL3rLUvlFAw2X2QK5N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232120"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232120"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219009"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219009"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:45 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/19] drm/i915/dp: Consider output_format while computing dsc
 bpp
Date: Fri, 30 Jun 2023 18:16:33 +0530
Message-Id: <20230630124652.4140932-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While using DSC the compressed bpp is computed assuming RGB output
format. Consider the output_format and compute the compressed bpp
during mode valid and compute config steps.

For DP-MST we currently use RGB output format only, so continue
using RGB while computing compressed bpp for MST case.

v2: Use output_bpp instead for pipe_bpp to clamp compressed_bpp. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 19 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9f40da20e88d..f6061aa1cd42 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -735,6 +735,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 				u32 link_clock, u32 lane_count,
 				u32 mode_clock, u32 mode_hdisplay,
 				bool bigjoiner,
+				enum intel_output_format output_format,
 				u32 pipe_bpp,
 				u32 timeslots)
 {
@@ -759,6 +760,10 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	bits_per_pixel = ((link_clock * lane_count) * timeslots) /
 			 (intel_dp_mode_to_fec_clock(mode_clock) * 8);
 
+	/* Bandwidth required for 420 is half, that of 444 format */
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		bits_per_pixel *= 2;
+
 	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
 				"total bw %u pixel clock %u\n",
 				bits_per_pixel, timeslots,
@@ -1152,11 +1157,16 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 
 	if (HAS_DSC(dev_priv) &&
 	    drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)) {
+		enum intel_output_format sink_format, output_format;
+		int pipe_bpp;
+
+		sink_format = intel_dp_sink_format(connector, mode);
+		output_format = intel_dp_output_format(connector, sink_format);
 		/*
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
 
 		/*
 		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
@@ -1176,6 +1186,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
+							    output_format,
 							    pipe_bpp, 64) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
@@ -1715,6 +1726,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							    adjusted_mode->crtc_clock,
 							    adjusted_mode->crtc_hdisplay,
 							    pipe_config->bigjoiner_pipes,
+							    pipe_config->output_format,
 							    pipe_bpp,
 							    timeslots);
 			/*
@@ -1750,9 +1762,12 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		 * calculation procedure is bit different for MST case.
 		 */
 		if (compute_pipe_bpp) {
+			u16 output_bpp = intel_dp_output_bpp(pipe_config->output_format,
+							     pipe_config->pipe_bpp);
+
 			pipe_config->dsc.compressed_bpp = min_t(u16,
 								dsc_max_output_bpp >> 4,
-								pipe_config->pipe_bpp);
+								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
 		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 22099de3ca45..bb4f976af296 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -111,6 +111,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 				u32 link_clock, u32 lane_count,
 				u32 mode_clock, u32 mode_hdisplay,
 				bool bigjoiner,
+				enum intel_output_format output_format,
 				u32 pipe_bpp,
 				u32 timeslots);
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e3f176a093d2..aa8d9d570626 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -973,6 +973,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
+							    INTEL_OUTPUT_FORMAT_RGB,
 							    pipe_bpp, 64) >> 4;
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
-- 
2.40.1

