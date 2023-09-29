Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FC37B2DA1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FFE10E6CE;
	Fri, 29 Sep 2023 08:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F031910E6D4;
 Fri, 29 Sep 2023 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975467; x=1727511467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxqDRuPTu3BbyzAGpP4S5Bg08ocBHOsFzU9RRoAgKgw=;
 b=Z6nBRB0pRpVX2JKOp8ZrXdnCdHokRXxGWcdI1hoPQX+jsbtjDrcNpDqw
 5IOht0T1Uyw6pi2zNygB/C+0tbmKZrh0OZEE0MucSsgBxf4bs4yRV3qYF
 pJIYa+BLipFNFQvHXl1L1DIJe85jS45B4uE1FfSZtrkPmCTjKoKiytefC
 3K6Gwq2JpFZjD6tZg8NSdr5FChbamITZoOLbFU8FrYvk947YhLgJ/+pP2
 3bSlzrhqP0F+jQH83Ba5hgTL7iBFxVr67g6nf958Vm3TtkXkFGdIW7Y3g
 xlyXiAHyRk9tLMVW+foqr1SfeTpFmkrem6zpPhPqZoFz77m0KTeCVl4RZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379520274"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="379520274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815517413"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="815517413"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 00:19:13 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915/display: Consider fractional vdsc bpp while
 computing m_n values
Date: Fri, 29 Sep 2023 12:43:17 +0530
Message-Id: <20230929071322.945521-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, swati2.sharma@intel.com,
 mripard@kernel.org, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

MTL+ supports fractional compressed bits_per_pixel, with precision of
1/16. This compressed bpp is stored in U6.4 format.
Accommodate this precision while computing m_n values.

v1:
Replace the computation of 'data_clock' with 'data_clock =
DIV_ROUND_UP(data_clock, 16).' (Sui Jingfeng).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++++-
 drivers/gpu/drm/i915/display/intel_display.h | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c      | 5 +++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 6 ++++--
 drivers/gpu/drm/i915/display/intel_fdi.c     | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 01cc22e97460..44aea5a6a9c4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2398,10 +2398,14 @@ void
 intel_link_compute_m_n(u16 bits_per_pixel, int nlanes,
 		       int pixel_clock, int link_clock,
 		       struct intel_link_m_n *m_n,
-		       bool fec_enable)
+		       bool fec_enable,
+		       bool is_dsc_fractional_bpp)
 {
 	u32 data_clock = bits_per_pixel * pixel_clock;
 
+	if (is_dsc_fractional_bpp)
+		data_clock = DIV_ROUND_UP(data_clock, 16);
+
 	if (fec_enable)
 		data_clock = intel_dp_mode_to_fec_clock(data_clock);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 0e5dffe8f018..08ecb07485fd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -396,7 +396,7 @@ u8 intel_calc_active_pipes(struct intel_atomic_state *state,
 void intel_link_compute_m_n(u16 bpp, int nlanes,
 			    int pixel_clock, int link_clock,
 			    struct intel_link_m_n *m_n,
-			    bool fec_enable);
+			    bool fec_enable, bool is_dsc_fractional_bpp);
 u32 intel_plane_fb_max_stride(struct drm_i915_private *dev_priv,
 			      u32 pixel_format, u64 modifier);
 enum drm_mode_status
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 15de7940a433..c4cb2b763161 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2656,7 +2656,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 
 	intel_link_compute_m_n(link_bpp, pipe_config->lane_count, pixel_clock,
 			       pipe_config->port_clock, &pipe_config->dp_m2_n2,
-			       pipe_config->fec_enable);
+			       pipe_config->fec_enable, false);
 
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
@@ -2838,7 +2838,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       pipe_config->port_clock,
 			       &pipe_config->dp_m_n,
-			       pipe_config->fec_enable);
+			       pipe_config->fec_enable,
+			       pipe_config->dsc.compression_enable);
 
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index cb189b930b5b..fc39f5681aa3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -178,7 +178,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
 			       &crtc_state->dp_m_n,
-			       crtc_state->fec_enable);
+			       crtc_state->fec_enable,
+			       false);
 	crtc_state->dp_m_n.tu = slots;
 
 	return 0;
@@ -278,7 +279,8 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
 			       &crtc_state->dp_m_n,
-			       crtc_state->fec_enable);
+			       crtc_state->fec_enable,
+			       crtc_state->dsc.compression_enable);
 	crtc_state->dp_m_n.tu = slots;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index e6429dfebe15..f9de59e8b638 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -339,7 +339,7 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
 	pipe_config->fdi_lanes = lane;
 
 	intel_link_compute_m_n(pipe_config->pipe_bpp, lane, fdi_dotclock,
-			       link_bw, &pipe_config->fdi_m_n, false);
+			       link_bw, &pipe_config->fdi_m_n, false, false);
 
 	return 0;
 }
-- 
2.25.1

