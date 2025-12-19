Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD155CCEBCE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F055010EE62;
	Fri, 19 Dec 2025 07:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRcp4K5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6520610EE5D;
 Fri, 19 Dec 2025 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128382; x=1797664382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arRNzYy81EO85ZcL0mIB2Dtw3f62zMBcEJhRtRmdd8w=;
 b=WRcp4K5CZW3q5Yy3RuK8yWgxynnmoMcYZp1TJZusNphmdDO0MA5/kgB0
 iPMMlDd/csz0FIdftcN6SM8+YahWQTLAHvbW9SO37gytX34btNDcs45No
 84IJ1Ri5t2kmoKn1QvN1r6RZx8a+77uqFLKY9vs2VDotDx62r5UkcBTSO
 IWBHLEEd1wfAG5U7eBySBTg/LRHAjwfS9MegS4VPopr3Lj+QwAnIWTiDh
 kb3Fjx3vnH99zvGhDVKNlGAGCI2BLYk46CCh7cHDKgD0WXsfx9RQhrsZQ
 Uv4hFVAz/wMK+47tAsckFlg43h11sWpo+cy+mDZGu90r6V7u6PWaz/bOl w==;
X-CSE-ConnectionGUID: AX5slUj6T5yZ0AW1czbcuw==
X-CSE-MsgGUID: qtnUHAN2RqCD6uSkZOd4mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562276"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:02 -0800
X-CSE-ConnectionGUID: lN1fB/jJQRuujEYwfYMT3A==
X-CSE-MsgGUID: QJUT/IlhRT+fjSDVkLSntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209422"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:12:58 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane color
 pipeline
Date: Fri, 19 Dec 2025 12:26:02 +0530
Message-Id: <20251219065614.190834-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Commit 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
introduced the 3D LUT block before the CSC stage. This ordering is
incorrect.

Move the 3D LUT block to its correct position in the plane color
pipeline:

  [Pre-CSC] -> [CSC] -> [3DLUT] -> [Post-CSC]

Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 942d9b9c93ce..684641c8323b 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -39,6 +39,15 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	/* TODO: handle failures and clean up */
 	prev_op = &colorop->base;
 
+	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, &colorop->base);
+	prev_op = &colorop->base;
+
 	if (DISPLAY_VER(display) >= 35 &&
 	    intel_color_crtc_has_3dlut(display, pipe) &&
 	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -55,15 +64,6 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 		prev_op = &colorop->base;
 	}
 
-	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
-	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
-					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
-	if (ret)
-		return ret;
-
-	drm_colorop_set_next_property(prev_op, &colorop->base);
-	prev_op = &colorop->base;
-
 	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
 	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
 						  PLANE_GAMMA_SIZE,
-- 
2.25.1

