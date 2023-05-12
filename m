Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF670007E
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9E10E63E;
	Fri, 12 May 2023 06:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B68510E635;
 Fri, 12 May 2023 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872956; x=1715408956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qMzKZUrKf/d/GEbQrM2hmNFqWk0yDb99Kq6wMVHvrvE=;
 b=ZVk2N0aycOJ648YTGHdTgLPtJKOqmO7mE5C6Ne2+6p12WP3Uuyh+vngL
 ScWzG9SB1t0AMoHQ5gwKhyVtg6xOOHEoSlxvqenV38vIm4v++/LQY5aet
 /+TC4z1HYzMu77FRxIZ1XjLT8Awzl3IWU03wQQFnmw5PyYoU0QtA23F16
 D2KZZ3tNkH1T67cWyiVhLJwzkN+D+OIfbJTOxURruVkDEbwR2SmJ2p351
 e9ArRgwAA+aw2QAoyBsr/VgLZU+Q5NgU02OblrY1jOM/InEvsecAna245
 CiJknRrHIcD0vNE6PjIx93SJjjQuRFXWW9XRhz7wsMnvPBSWeF1gAM4PQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741986"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741986"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941314"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941314"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:13 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/i915/dp: Rename helpers to get DSC max
 pipe_bpp/output_bpp
Date: Fri, 12 May 2023 11:54:15 +0530
Message-Id: <20230512062417.2584427-12-ankit.k.nautiyal@intel.com>
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

Currently the required dsc output bpp is set to be the largest
compressed bpp supported for max, lane, rate, and bpp.
The helper intel_dp_dsc_get_output_bpp gets the maximum supported
compressed bpp taking into account link configuration, input bpp,
bigjoiner considerations etc.

Similarly, the helper intel_dp_dsc_compute_bpp gives the maximum
pipe bpp that is allowed with DSC.

Rename the functions to reflect that these return max DSC input and
output bpps.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c5f1bc7620e2..39e2bf3d738d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1162,7 +1162,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, U8_MAX);
 
 		/*
 		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
@@ -1503,7 +1503,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
+int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i, num_bpc;
@@ -1684,8 +1684,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				 "Cannot force dsc bpc:%d, due to dsc bpc limits\n",
 				 intel_dp->force_dsc_bpc);
 
-			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
-							    conn_state->max_requested_bpc);
+			pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
+								conn_state->max_requested_bpc);
 
 			if (!is_dsc_pipe_bpp_sufficient(pipe_bpp)) {
 				drm_dbg_kms(&dev_priv->drm, "No DSC support for less than 8bpc\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 42b98546c140..295b967de3cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -102,7 +102,7 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		       struct intel_crtc_state *crtc_state,
 		       unsigned int type);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
+int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
 u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 link_clock, u32 lane_count,
 					u32 mode_clock, u32 mode_hdisplay,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index daae3c9402a9..f02ae68a9877 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -971,7 +971,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		int pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, U8_MAX);
 
 		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
 			dsc_max_compressed_bpp =
-- 
2.25.1

