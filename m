Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883489F8723
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0661C10EDE5;
	Thu, 19 Dec 2024 21:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+l1TII4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C24710EDE5;
 Thu, 19 Dec 2024 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644143; x=1766180143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EO3CxJJ1KzVtlMRxzHQs9hNiHRjvg26vi9kd2w1oPjM=;
 b=I+l1TII4A0/tikRF3MNvYrTjunFQGihU0L7Ed1rYetnO+TpgiYPcr16h
 YqCbGb/AKHPuzUy2828SL/zEqSKImnGxliPe8orQ8a8w3qrieFTHS2X80
 pyOfNNkV+92VDfdU4q4Idp88Kjgjyo71+GYznf5BEaHWI+KlsAyBNtyCm
 3VA3bWCeHVmvhPMmMTAKQWkNBLrMvp5a957dBsT5VXhiGrFd98c5toH4L
 cJFPXdtiAeqW5UAhs/u3uBNIzbq5n4x0W+z1q+NeY6RpKvvDVYCNkXmTF
 V0wv94zFytqSaCa7j46eZQZA5BoqA97zOllncVqxAlPA9Ue2G8++5Zim0 A==;
X-CSE-ConnectionGUID: MpwOxJeMQo+WzwkBZLarWA==
X-CSE-MsgGUID: T66SM9YnQYGkCkPL63XCcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590421"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:43 -0800
X-CSE-ConnectionGUID: ll1z3+ZATAG/snUFevjfKg==
X-CSE-MsgGUID: ZzeY7ti/RkKvIcieZnWP/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146356"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 16/16] drm/i915/dp: compute config for 128b/132b SST w/o DSC
Date: Thu, 19 Dec 2024 23:34:05 +0200
Message-Id: <b239079a989ce11d60e9467cb1125bc2033ae0bd.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Enable basic 128b/132b SST functionality without compression. Reuse
intel_dp_mtp_tu_compute_config() to figure out the TU after we've
determined we need to use an UHBR rate.

It's slightly complicated as the M/N computation is done in different
places in MST and SST paths, so we need to avoid trashing the values
later for UHBR.

If uncompressed UHBR fails, we drop to compressed non-UHBR, which is
quite likely to fail as well. We still lack 128b/132b SST+DSC.

We need mst_master_transcoder also for 128b/132b SST. Use cpu_transcoder
directly. Enhanced framing is "don't care" for 128b/132b link.

v2: mst_master_transcoder, enhanced framing (Imre)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fba3af338280..d14a42f02ba8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2525,8 +2525,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 	limits->min_rate = intel_dp_min_link_rate(intel_dp);
 	limits->max_rate = intel_dp_max_link_rate(intel_dp);
 
-	/* FIXME 128b/132b SST support missing */
-	if (!is_mst)
+	/* FIXME 128b/132b SST+DSC support missing */
+	if (!is_mst && dsc)
 		limits->max_rate = min(limits->max_rate, 810000);
 	limits->min_rate = min(limits->min_rate, limits->max_rate);
 
@@ -2640,6 +2640,13 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 		 */
 		ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config,
 							conn_state, &limits);
+		if (!ret && intel_dp_is_uhbr(pipe_config))
+			ret = intel_dp_mtp_tu_compute_config(intel_dp,
+							     pipe_config,
+							     pipe_config->pipe_bpp,
+							     pipe_config->pipe_bpp,
+							     conn_state,
+							     0, false);
 		if (ret)
 			dsc_needed = true;
 	}
@@ -3148,8 +3155,13 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	pipe_config->limited_color_range =
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
-	pipe_config->enhanced_framing =
-		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
+	if (intel_dp_is_uhbr(pipe_config)) {
+		/* 128b/132b SST also needs this */
+		pipe_config->mst_master_transcoder = pipe_config->cpu_transcoder;
+	} else {
+		pipe_config->enhanced_framing =
+			drm_dp_enhanced_frame_cap(intel_dp->dpcd);
+	}
 
 	if (pipe_config->dsc.compression_enable)
 		link_bpp_x16 = pipe_config->dsc.compressed_bpp_x16;
@@ -3180,12 +3192,14 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
 
-	intel_link_compute_m_n(link_bpp_x16,
-			       pipe_config->lane_count,
-			       adjusted_mode->crtc_clock,
-			       pipe_config->port_clock,
-			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
-			       &pipe_config->dp_m_n);
+	if (!intel_dp_is_uhbr(pipe_config)) {
+		intel_link_compute_m_n(link_bpp_x16,
+				       pipe_config->lane_count,
+				       adjusted_mode->crtc_clock,
+				       pipe_config->port_clock,
+				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
+				       &pipe_config->dp_m_n);
+	}
 
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
-- 
2.39.5

