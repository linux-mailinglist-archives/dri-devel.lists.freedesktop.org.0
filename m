Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6B79DFB7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC3A10E304;
	Wed, 13 Sep 2023 06:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F9C10E26D;
 Wed, 13 Sep 2023 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585514; x=1726121514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jxf7t5mslR/v5lVMPq/X0EfuUxA2xRH2DP0nq9usbQc=;
 b=LRntQvj8mN/QVRxXDJYVCPAgV4ltV6p5ozxEweZgCITB7ndrrSz3qSJg
 NvUAi2mSPoifjk/Iy5fVl/psOhd9fqFozx8EEh3tqS3A6jZsLg2cRKKs8
 vONGDqqNe4jYS3YJPPgU+G0TXav4WYHe+6rc+MXeSmLO20rqpEXo2BDhS
 rWDv9yqk7Cw+yjTQfm/49e2cu0S68ZPf+f+N9JK3nF/VwaVu15bfed2zc
 VYWZq8Ew19LAlZ+LvKUdrBXaxN5uGbMGbpGpyKQ3JZsc4/2U84FKMCSfC
 G1p9zotNb6nzQITzFuozm/edwbaGZzTGOb9zZIBDbh3DWpWlfdYMW96eY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377482561"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377482561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693741705"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693741705"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 23:11:35 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915/display: Consider fractional vdsc bpp while
 computing m_n values
Date: Wed, 13 Sep 2023 11:36:01 +0530
Message-Id: <20230913060606.1105349-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

MTL+ supports fractional compressed bits_per_pixel, with precision of
1/16. This compressed bpp is stored in U6.4 format.
Accommodate this precision while computing m_n values.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++++-
 drivers/gpu/drm/i915/display/intel_display.h | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c      | 5 +++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 6 ++++--
 drivers/gpu/drm/i915/display/intel_fdi.c     | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index afcbdd4f105a..b37aeac961f4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2380,10 +2380,14 @@ void
 intel_link_compute_m_n(u16 bits_per_pixel, int nlanes,
 		       int pixel_clock, int link_clock,
 		       struct intel_link_m_n *m_n,
-		       bool fec_enable)
+		       bool fec_enable,
+		       bool is_dsc_fractional_bpp)
 {
 	u32 data_clock = bits_per_pixel * pixel_clock;
 
+	if (is_dsc_fractional_bpp)
+		data_clock = DIV_ROUND_UP(bits_per_pixel * pixel_clock, 16);
+
 	if (fec_enable)
 		data_clock = intel_dp_mode_to_fec_clock(data_clock);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 49ac8473b988..a4c4ca3cad65 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -398,7 +398,7 @@ u8 intel_calc_active_pipes(struct intel_atomic_state *state,
 void intel_link_compute_m_n(u16 bpp, int nlanes,
 			    int pixel_clock, int link_clock,
 			    struct intel_link_m_n *m_n,
-			    bool fec_enable);
+			    bool fec_enable, bool is_dsc_fractional_bpp);
 u32 intel_plane_fb_max_stride(struct drm_i915_private *dev_priv,
 			      u32 pixel_format, u64 modifier);
 enum drm_mode_status
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cb647bb38b12..6e09e21909a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2562,7 +2562,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 
 	intel_link_compute_m_n(link_bpp, pipe_config->lane_count, pixel_clock,
 			       pipe_config->port_clock, &pipe_config->dp_m2_n2,
-			       pipe_config->fec_enable);
+			       pipe_config->fec_enable, false);
 
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
@@ -2741,7 +2741,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       pipe_config->port_clock,
 			       &pipe_config->dp_m_n,
-			       pipe_config->fec_enable);
+			       pipe_config->fec_enable,
+			       pipe_config->dsc.compression_enable);
 
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7bf0b6e4ac0b..8f6bd54532cb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -172,7 +172,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
 			       &crtc_state->dp_m_n,
-			       crtc_state->fec_enable);
+			       crtc_state->fec_enable,
+			       false);
 	crtc_state->dp_m_n.tu = slots;
 
 	return 0;
@@ -269,7 +270,8 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
 			       &crtc_state->dp_m_n,
-			       crtc_state->fec_enable);
+			       crtc_state->fec_enable,
+			       crtc_state->dsc.compression_enable);
 	crtc_state->dp_m_n.tu = slots;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index e12b46a84fa1..15fddabf7c2e 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -259,7 +259,7 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
 	pipe_config->fdi_lanes = lane;
 
 	intel_link_compute_m_n(pipe_config->pipe_bpp, lane, fdi_dotclock,
-			       link_bw, &pipe_config->fdi_m_n, false);
+			       link_bw, &pipe_config->fdi_m_n, false, false);
 
 	ret = ilk_check_fdi_lanes(dev, crtc->pipe, pipe_config);
 	if (ret == -EDEADLK)
-- 
2.25.1

