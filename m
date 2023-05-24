Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529770F89A
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8310E678;
	Wed, 24 May 2023 14:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83F10E101;
 Wed, 24 May 2023 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938401; x=1716474401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8soFOijBfCwdqU8+XXQEoYKxsa3hkE/8CI/TAMaKsA=;
 b=ZHcqhlcxwW1hJxXVuLCjJ1G41jH195Ls/AT7lU9ltYqejiGLXgGtVmP/
 KSfs+xseAyu5rysf/WkEBALPkSdY5OVsqMTpE7GrojVlN9T2CLkQfA3ej
 NUM5mehe4bywlR082d/6JIgRHXifafysZj1YU/qfOZo8cmwnGjcpryAED
 pIiVPiv983BITo0kNGREKhLoHAmPRVbaxgW+MqGAYpNvZ6mk+H1YYxZcR
 MvTIY8sSgaDmGKW5/zV4lmxGcCA35udwjorDImb3yrIh18GPFP1rAbPes
 MjyRawKzfTfspsg2qEc1ZNtunR8M0gMBArYl99ogSSG/qbzQ69oD4E6Ak w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806315"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034555995"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034555995"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:34 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/i915/dp_mst: Use output_format to get the final
 link bpp
Date: Wed, 24 May 2023 19:51:58 +0530
Message-Id: <20230524142210.3779331-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
index db710b2a6246..2179e2d47d3a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -947,7 +947,7 @@ int intel_dp_min_bpp(enum intel_output_format output_format)
 		return 8 * 3;
 }
 
-static int intel_dp_output_bpp(enum intel_output_format output_format, int bpp)
+int intel_dp_output_bpp(enum intel_output_format output_format, int bpp)
 {
 	/*
 	 * bpp value was assumed to RGB format. And YCbCr 4:2:0 output
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1e1cde866cd8..1b28fe462e64 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -143,5 +143,6 @@ void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 void intel_dp_phy_test(struct intel_encoder *encoder);
 
 void intel_dp_wait_source_oui(struct intel_dp *intel_dp);
+int intel_dp_output_bpp(enum intel_output_format output_format, int bpp);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1db8c8e38672..32f723ae64d8 100644
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
2.25.1

