Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD1F9091D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E110EE0A;
	Fri, 14 Jun 2024 17:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOTSh3xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96910EE0A;
 Fri, 14 Jun 2024 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386751; x=1749922751;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OgCB7JEOgDflBJ97nFodcLudvPtsqBaBbrUqf8woibo=;
 b=fOTSh3xZs29NmcswM1CntE9kTZN6aGUqDvjxZ4qzafH4J8bBPd7sCplw
 fkrvOv8mdUVqIFZ8kdhpHgTBHY3CZLcbGOm9IuOOAI4rDhEdHbWi8ON+f
 vF4/jvsFrDowq3fCNqauzkhpGXZ+GjCnKm/FuGQU0F7zf7yGagxrv/Esr
 5QZ40cK2aidPfrV6LlgBvOfWGjQ1Q4U6IOj5HlLBAihzsS9rLXUgD+g4c
 UITaxp5qVQzv1K4NjFs1i8bUL7EvYE43VCkeEiR6e58HlmQkbiWEj6pOq
 WStoCjDyyX3CVxElpLZLD00XAKS3F3+3OFcD79bcyDj94qGw0c/7decEz g==;
X-CSE-ConnectionGUID: mfGWQyS+R3G9bJiIwDYlCw==
X-CSE-MsgGUID: aWwxAeYPT9W19jlOAJFaUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069340"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:11 -0700
X-CSE-ConnectionGUID: /6/AdCtES6Cs9IbMAdP38A==
X-CSE-MsgGUID: z/qwNljBRVOEB2BFTZipdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712459"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:09 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915: Replace to_bpp_frac() with drm_x16_to_frac()
Date: Fri, 14 Jun 2024 20:39:06 +0300
Message-ID: <20240614173911.3743172-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240614173911.3743172-1-imre.deak@intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
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

Replace to_bpp_frac() defined by the driver with the equivalent
drm_x16_to_frac() defined by DRM core.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 7 +------
 drivers/gpu/drm/i915/display/intel_dp.c            | 4 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 68f37029dbd88..128edecb69a20 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2168,13 +2168,8 @@ to_intel_frontbuffer(struct drm_framebuffer *fb)
 	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
 }
 
-static inline int to_bpp_frac(int bpp_x16)
-{
-	return bpp_x16 & 0xf;
-}
-
 #define BPP_X16_FMT		"%d.%04d"
-#define BPP_X16_ARGS(bpp_x16)	drm_x16_to_int(bpp_x16), (to_bpp_frac(bpp_x16) * 625)
+#define BPP_X16_ARGS(bpp_x16)	drm_x16_to_int(bpp_x16), (drm_x16_to_frac(bpp_x16) * 625)
 
 /*
  * Conversion functions/macros from various pointer types to struct
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 67d0348152878..168852e20f756 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1947,7 +1947,7 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 	     compressed_bppx16 >= dsc_min_bpp;
 	     compressed_bppx16 -= bppx16_step) {
 		if (intel_dp->force_dsc_fractional_bpp_en &&
-		    !to_bpp_frac(compressed_bppx16))
+		    !drm_x16_to_frac(compressed_bppx16))
 			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
@@ -1957,7 +1957,7 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
 			if (intel_dp->force_dsc_fractional_bpp_en &&
-			    to_bpp_frac(compressed_bppx16))
+			    drm_x16_to_frac(compressed_bppx16))
 				drm_dbg_kms(&i915->drm, "Forcing DSC fractional bpp\n");
 
 			return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 5c0acbed7d6a1..ffda11b417e24 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -185,7 +185,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		}
 	} else {
 		/* fractional bpp part * 10000 (for precision up to 4 decimal places) */
-		int fractional_bits = to_bpp_frac(vdsc_cfg->bits_per_pixel);
+		int fractional_bits = drm_x16_to_frac(vdsc_cfg->bits_per_pixel);
 
 		static const s8 ofs_und6[] = {
 			0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-- 
2.43.3

