Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86F91C40D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7E10ECA8;
	Fri, 28 Jun 2024 16:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODyzdZpn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1B10ECA8;
 Fri, 28 Jun 2024 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593093; x=1751129093;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iR92WMC15p9CzJR7IB/GrkBW852vrI3aTmHr0ywZ4Zk=;
 b=ODyzdZpnlhmzBmpeNs7t9qCm8s/bVgYxBw9PfHIGp3PQJ2gaibgElHUQ
 IM87GKfVanaFyOtzHa9hxeDvqxivGOULV9rJK//obf+TorgpYZgz4WMS6
 VmnNDc5IidgyBKt5gBEzL/RT1rr6BtEQu7fDZRRJZ065KepV8oHHz10yV
 Y7u7OA+e6Jzx/bziznjnjDncIpSHQlq6oGQXytA++RzAso5a52b8LmoVH
 DcqlE1ZWwOqGaCk+9V3GZXMeDLWUoZr590p9eCpWzkiwkBZ6pPUczwKwO
 JCq+1wG6qowjmvYeAet7IVQHpv1vLB89af+IqKTJDRkf3Rd7+cgX0JhIj w==;
X-CSE-ConnectionGUID: nlO8877vQxq+saYx974QGQ==
X-CSE-MsgGUID: F8yPmelMRt6CfoW3EB8VPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620076"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:53 -0700
X-CSE-ConnectionGUID: b1cS93MdQD6Dw3Xo3+850g==
X-CSE-MsgGUID: NEGsyewIRCGpIOAwrZX2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519923"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:52 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
Date: Fri, 28 Jun 2024 19:44:47 +0300
Message-ID: <20240628164451.1177612-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

Replace the to_bpp_frac() helper defined by the driver with the
equivalent fxp_q4_to_frac() helper defined by DRM core.

v2: Rebase on the s/drm_x16/fxp_q4 change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 7 +------
 drivers/gpu/drm/i915/display/intel_dp.c            | 4 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d11b0ca6944be..e8b42ceed9529 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2178,13 +2178,8 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
-static inline int to_bpp_frac(int bpp_x16)
-{
-	return bpp_x16 & 0xf;
-}
-
 #define BPP_X16_FMT		"%d.%04d"
-#define BPP_X16_ARGS(bpp_x16)	fxp_q4_to_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
+#define BPP_X16_ARGS(bpp_x16)	fxp_q4_to_int(bpp_x16), (fxp_q4_to_frac(bpp_x16) * 625)
 
 /*
  * Conversion functions/macros from various pointer types to struct
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2852d89b0957c..4c078ff664005 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1971,7 +1971,7 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 	     compressed_bppx16 >= dsc_min_bpp;
 	     compressed_bppx16 -= bppx16_step) {
 		if (intel_dp->force_dsc_fractional_bpp_en &&
-		    !to_bpp_frac(compressed_bppx16))
+		    !fxp_q4_to_frac(compressed_bppx16))
 			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
@@ -1981,7 +1981,7 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
 			if (intel_dp->force_dsc_fractional_bpp_en &&
-			    to_bpp_frac(compressed_bppx16))
+			    fxp_q4_to_frac(compressed_bppx16))
 				drm_dbg_kms(&i915->drm, "Forcing DSC fractional bpp\n");
 
 			return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 99902fbfeec47..ff717dc1a2ce5 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -185,7 +185,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		}
 	} else {
 		/* fractional bpp part * 10000 (for precision up to 4 decimal places) */
-		int fractional_bits = to_bpp_frac(vdsc_cfg->bits_per_pixel);
+		int fractional_bits = fxp_q4_to_frac(vdsc_cfg->bits_per_pixel);
 
 		static const s8 ofs_und6[] = {
 			0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-- 
2.43.3

