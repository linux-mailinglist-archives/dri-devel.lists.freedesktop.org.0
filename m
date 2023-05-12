Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0470007B
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFC610E63A;
	Fri, 12 May 2023 06:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715E10E633;
 Fri, 12 May 2023 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872953; x=1715408953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQiYR0lCfBA08Tkcrf64QcYdZ47eSZKnBvR+3JR/0bc=;
 b=RHW0Nv/M2C/CB1UJwWxwCCK4NiILrNteGjqnZGUQk7WDxg3IE8sP9DSW
 mqN/JSlL47+VHV5iKZ45C0fpx1NQFlDhBrk8t/IzNUQtCaPtp04uOxd19
 k72ldPDo0mewPsFqoDDWiowL/O7/sCuRkNMtTHnZCKsZGL/jEVtremv0/
 N7MCzXhphf4cs53o2DKuwwDNZ4/H1kZc9+CGmm2BOOQTKMw/WkYVzLmTe
 Fd5s5en7n8S7IhtEEbwjNA8hISjHSS+PpUJJTUP9X3xm3Bz9RcyBtVb9q
 775AoQerA8C4jBz0YNy6mHJNsEtoVn+0uJy5dgvy/+kRyoVd8sNHv2bFd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741975"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741975"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941308"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941308"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] drm/i915/dp: Avoid left shift of DSC output bpp by 4
Date: Fri, 12 May 2023 11:54:14 +0530
Message-Id: <20230512062417.2584427-11-ankit.k.nautiyal@intel.com>
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

To make way for fractional bpp support, avoid left shifting the
output_bpp by 4 in helper intel_dp_dsc_get_output_bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 12 ++++--------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 83fb198fcdae..c5f1bc7620e2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -793,11 +793,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-	/*
-	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
-	 * fractional part is 0
-	 */
-	return bits_per_pixel << 4;
+	return bits_per_pixel;
 }
 
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
@@ -1187,7 +1183,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    output_format,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1744,7 +1740,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 				dsc_max_compressed_bpp = min_t(u16,
 							       dsc_max_compressed_bpp,
-							       31 << 4);
+							       31);
 
 			if (!dsc_max_compressed_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
@@ -1774,7 +1770,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							     pipe_config->pipe_bpp);
 
 			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_compressed_bpp >> 4,
+								dsc_max_compressed_bpp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 636e3e8e57e8..daae3c9402a9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -982,7 +982,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    INTEL_OUTPUT_FORMAT_RGB,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
-- 
2.25.1

