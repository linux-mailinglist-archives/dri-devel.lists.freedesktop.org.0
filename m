Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D27777932
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BC510E538;
	Thu, 10 Aug 2023 13:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D6410E523;
 Thu, 10 Aug 2023 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672896; x=1723208896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5IimxeISuS18L4feYwMD9o75z/IIJ0FHgcIhSvyNAg=;
 b=FQb8PBaNOvDB395DY/vao5nwml+ieBsGiTbn9V6vEmZu5OqgwoABhjQF
 3g3hqm7pBISpmJGqsOYCATRHgdyV9n+aTGt7taKmgRHBvn7a5RvU/vuaK
 CVaOmTLkIKLYvpoDHOHEhW8ZM4o2uNEheQxdPhuypNarSFgsPeBJ67iea
 m43jUgvNI+/M95pjp63ckCa9QvYczzmYp6Ns02HgCBhXMHgBI4d2utGFa
 LaiQB9bmix0YyKN0uAnE619T3rxzFoUmzIw5a3qf2AgQV7eVbhSdqXlGx
 NHy7cI42fDiVt9y1jPB2W4Pg/GZ2I0cnuFgVbl7Tw/2LXNkWEza6n6j7u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358615"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358615"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143407"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143407"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/20] drm/i915/dp: Rename helper to get DSC max pipe_bpp
Date: Thu, 10 Aug 2023 18:33:12 +0530
Message-Id: <20230810130319.3708392-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

The helper intel_dp_dsc_compute_bpp gives the maximum
pipe bpp that is allowed with DSC.

Rename the this to reflect that it returns max pipe bpp supported
with DSC.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 40ba2069ca69..fd321b314f91 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1183,7 +1183,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
+		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, U8_MAX);
 
 		/*
 		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
@@ -1543,7 +1543,7 @@ u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
 	return 0;
 }
 
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
+int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i, num_bpc;
@@ -1731,8 +1731,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				 "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
 				 intel_dp->force_dsc_bpc);
 
-			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
-							    conn_state->max_requested_bpc);
+			pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
+								conn_state->max_requested_bpc);
 
 			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
 				drm_dbg_kms(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 6fd423463f5c..788a577ebe16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -106,7 +106,7 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		       struct intel_crtc_state *crtc_state,
 		       unsigned int type);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
-int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
+int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
 u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 link_clock, u32 lane_count,
 					u32 mode_clock, u32 mode_hdisplay,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4895d6242915..3eb085fbc7c8 100644
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
2.40.1

