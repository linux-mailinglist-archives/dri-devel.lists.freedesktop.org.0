Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DBD18277
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254510E4A1;
	Tue, 13 Jan 2026 10:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQMIeAyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8910E49F;
 Tue, 13 Jan 2026 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301314; x=1799837314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X54EmWCLnUvfF3np7HSj3dFltlC2dEJiUB/2EsvAzws=;
 b=IQMIeAyzdS9Cf0PF3ZnpjARn4sSYV5WX6aewjA/8CpAMNiBLGcNJL8th
 89mO475BSZLyKslD2kP7frX6+h8wVoN3SpCQ1kpcaO3UqjIV3Y1uoI+Z/
 2Qy9RHPW6pPRiDRLig7f+UYx70duhJBmC8hrlUqZ3DoRhSkqn5sbJA5m4
 soN1dIraCaI/S4f9kl27Aqd12cItm/0zv/ODsGewy+vz+ogWS7mMiC8hh
 8Ql3VULOVQCrZW31JImu2rwriiqAkKHnBYyA1+yTh15VFV7JdSd+Fiff5
 YbeFfcj/2XXTDwOadGtetg8l1Qd6aD9F+o4/pldSrQjkTXHMAX2MTyD+s g==;
X-CSE-ConnectionGUID: ZHB2jOLMRb+mrHCseupYVQ==
X-CSE-MsgGUID: Xtr+14/OQoySNaTnWu1GKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165168"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:34 -0800
X-CSE-ConnectionGUID: /LfIB9ClQEWUXh3FTf7/aA==
X-CSE-MsgGUID: MZYIs0baSL++LMnGdsCsJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554579"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:30 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 01/13] drm/i915/color: Place 3D LUT after CSC in plane
 color pipeline
Date: Tue, 13 Jan 2026 15:52:51 +0530
Message-Id: <20260113102303.724205-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
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

Move the 3D LUT block to its correct position in the plane
color pipeline:

  [Pre-CSC] -> [CSC] -> [3DLUT] -> [Post-CSC]

Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
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

