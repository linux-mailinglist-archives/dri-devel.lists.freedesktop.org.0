Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B35D674AFA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB81C10EA2A;
	Fri, 20 Jan 2023 04:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638E10EA21;
 Fri, 20 Jan 2023 04:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189726; x=1705725726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HDFtevxhWaovUOEZfnTOfoXK+JRgA1YfaK8d0tMGBA=;
 b=SD/1osBceeQCV/XJngmUHgHzh8eK1vOv/XjLAdTirUrVTG1GsTrju3T/
 mr3veoq6cWf2FoomKZoYxsvPPHRAAZNRvf4Pe18m3eK7EokdIel/lJy7E
 XaxZ6oyZLb9yvFsAjpEs7kiHE6OObQrwPG8/PRwYGBTQN/ir3YcWR7xki
 UlVhg2kAU938x701azwVbiNp6DATFRcyzhJVKsesEpLAYhnNPNWbI2Vzh
 oa563g347FqerOQ3UCrTUXeWshRIqU9ASpKCVhKf9/Z9uSO959c/7sLDo
 2xs5hXDbh8OCY3M5DS1CnSICJeCldXH3UMwba2uMTqz2Ho3CVeorxcJMp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195514"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195514"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734939"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734939"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:04 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/16] drm/i915/dp: Avoid left shift of DSC output bpp by 4
Date: Fri, 20 Jan 2023 10:08:33 +0530
Message-Id: <20230120043844.3761895-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make way for fractional bpp support, avoid left shifting the
output_bpp by 4 in helper intel_dp_dsc_get_output_bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 10 +++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 354dbd1d3164..c52e9979f0a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -749,11 +749,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-	/*
-	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
-	 * fractional part is 0
-	 */
-	return bits_per_pixel << 4;
+	return bits_per_pixel;
 }
 
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
@@ -1050,7 +1046,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp, 64) >> 4;
+							    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1585,7 +1581,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		 */
 		if (compute_pipe_bpp) {
 			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_output_bpp >> 4,
+								dsc_max_output_bpp,
 								pipe_config->pipe_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 9be04c60cced..5b65e4c2c78f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -921,7 +921,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 							    target_clock,
 							    mode->hdisplay,
 							    bigjoiner,
-							    pipe_bpp, 64) >> 4;
+							    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
-- 
2.25.1

