Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85870F8B0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759B10E688;
	Wed, 24 May 2023 14:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74A410E02A;
 Wed, 24 May 2023 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938418; x=1716474418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGV8UmRbfrMJYych3wXk8cBRQZ5Bmc1x37E2OTQDVfE=;
 b=h7SaPskM7xPgjA1ghJEey5gwohwm+DmQEGF0IskeWBjAzABAfiWjdTpL
 9HoIpsjXOLGRBZtdv1Ukp9ogpmM9VMLXEXp38S6DTorND9Ugk2l9gSZWU
 DFVe8zG0jMX3JYZB02xUfBDK/gXyuL4xCQUSsSV9/j8thIH5y1qXVumuv
 waIr6q5wq3WK2uNcZQaWqpQxY/wvGvBt7tOrv/OE4LDAFJ1jfs6w676e4
 BQv37Z8Jankbn8LW70t/9OMEa7uVCiSbVwGIPMkTR1/vqu7B4AzVDQzi4
 G8JZx7jPqKEyQqBXGT5U2x9RU4YX4w/UpVqmvys2shZIq6bY/ZZdAgBAF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806484"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556054"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556054"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] drm/i915/dp: Avoid left shift of DSC output bpp by 4
Date: Wed, 24 May 2023 19:52:07 +0530
Message-Id: <20230524142210.3779331-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
index 9d5da49f1180..363cfecc1175 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -794,11 +794,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-	/*
-	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
-	 * fractional part is 0
-	 */
-	return bits_per_pixel << 4;
+	return bits_per_pixel;
 }
 
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
@@ -1188,7 +1184,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    output_format,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1745,7 +1741,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 				dsc_max_compressed_bpp = min_t(u16,
 							       dsc_max_compressed_bpp,
-							       31 << 4);
+							       31);
 
 			if (!dsc_max_compressed_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
@@ -1775,7 +1771,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							     pipe_config->pipe_bpp);
 
 			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_compressed_bpp >> 4,
+								dsc_max_compressed_bpp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d875fef97356..78821c50948d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -980,7 +980,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
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

