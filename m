Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A07662E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5D310E64E;
	Fri, 28 Jul 2023 04:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAA110E64A;
 Fri, 28 Jul 2023 04:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517749; x=1722053749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sHRyq0GLA3STbtBmqDBIwz9A3tlbiTFduRVlE5lav/0=;
 b=PXEkWDPpMCZeFn+AaKnVmkh+rwC8lzibRwy9l576BQ7YbnFpRA2EvfTn
 k53YVu1RgPKuTdH/mbyDCotjaSEoG2i/VPKkgp1DNkBJr/LHN47zMAcUo
 KwrYyGcCcS/FXElX+riKo0YTMf8QwdgwekJ8uGt+TtgZrMJHDIB42ky4A
 Toy7ADBFz0r6Jov0pm7BW/lIYKUT2z3o3IYD4EHgLvyrP0ai29y+WDTj9
 BNj7ikYzOUD+x7Gn64p2nhgmgh7Zn8tqY5Fh2w7VOxmx3AwLGVmJYVXh5
 5oKiVTDhq2MUVdN4qe0eL8dAqoo53Qc3RoYVcLzVNGZbz5jf/EY2VjEwU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104186"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104186"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276381"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276381"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:46 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/20] drm/i915/dp: Avoid left shift of DSC output bpp by 4
Date: Fri, 28 Jul 2023 09:41:42 +0530
Message-Id: <20230728041150.2524032-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 10 +++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 78ac8f4fd348..c1eb0d1e229e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -814,11 +814,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-	/*
-	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
-	 * fractional part is 0
-	 */
-	return bits_per_pixel << 4;
+	return bits_per_pixel;
 }
 
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
@@ -1208,7 +1204,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    output_format,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1814,7 +1810,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							     pipe_config->pipe_bpp);
 
 			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_compressed_bpp >> 4,
+								dsc_max_compressed_bpp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index dff4717edbd0..4895d6242915 100644
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
2.40.1

