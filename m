Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0997662D9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9854B10E640;
	Fri, 28 Jul 2023 04:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0D10E634;
 Fri, 28 Jul 2023 04:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517728; x=1722053728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05mZfvDfdESJ1FctS1zOndWuOZnJUrQz9bb6DlJD3gQ=;
 b=fNTDbKWIOynGFUxrKZy5hlNUojBlJ8Dl6ewW999cbFTktDxaqCu0ZhAh
 IaBbj6lTd5U5EE120kFBF6ojgenkuwSAMqj7H5kw+wMWhii8KXIfLfWik
 HflM7oc/hUZ0Vq6+S0JiPcPvBFsl3dBmBLn4z5oiVZ5ScfovStQitC2IQ
 J13rTF263HhGqrA3aDBFLDpfpMKDT2zBH+G0OHCJ+dZNgmWWdhNqxyf09
 Z6AJCH/1JXsDu6RShoOAfG4w5a/QGb0Yd1/cRC8jBu8SaQKqaxSMO1mb1
 8TEAWxSRSh1m34wnXTmGI5mDHnwVSLI7jeq1bLJNLWme7wB0VLyy+G0jd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104152"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104152"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276281"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276281"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/20] drm/i915/dp_mst: Use output_format to get the final
 link bpp
Date: Fri, 28 Jul 2023 09:41:33 +0530
Message-Id: <20230728041150.2524032-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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

The final link bpp used to calculate the m_n values depend on the
output_format. Though the output_format is set to RGB for MST case and
the link bpp will be same as the pipe bpp, for the sake of semantics,
lets calculate the m_n values with the link bpp, instead of pipe_bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.h     | 1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 ++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d1db457fb17c..eb158efdb414 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -965,7 +965,7 @@ int intel_dp_min_bpp(enum intel_output_format output_format)
 		return 8 * 3;
 }
 
-static int intel_dp_output_bpp(enum intel_output_format output_format, int bpp)
+int intel_dp_output_bpp(enum intel_output_format output_format, int bpp)
 {
 	/*
 	 * bpp value was assumed to RGB format. And YCbCr 4:2:0 output
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index bb4f976af296..7dd015385054 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -144,5 +144,6 @@ void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 void intel_dp_phy_test(struct intel_encoder *encoder);
 
 void intel_dp_wait_source_oui(struct intel_dp *intel_dp);
+int intel_dp_output_bpp(enum intel_output_format output_format, int bpp);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index aa8d9d570626..ef5375eb923e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -155,6 +155,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int slots = -EINVAL;
+	int link_bpp;
 
 	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, limits->max_bpp,
 						     limits->min_bpp, limits,
@@ -163,7 +164,9 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	if (slots < 0)
 		return slots;
 
-	intel_link_compute_m_n(crtc_state->pipe_bpp,
+	link_bpp = intel_dp_output_bpp(crtc_state->output_format, crtc_state->pipe_bpp);
+
+	intel_link_compute_m_n(link_bpp,
 			       crtc_state->lane_count,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
-- 
2.40.1

