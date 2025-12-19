Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67793CCEC04
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9014A10EEA2;
	Fri, 19 Dec 2025 07:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT2DtZT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B34410EE97;
 Fri, 19 Dec 2025 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128410; x=1797664410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ic1chuT3WVwd0SJ1oBj49iIPJ3EEV8NBSjBMBLbyJAw=;
 b=IT2DtZT2qxpEFCf0uCFgYXFpzKXeR+3RcyfGiJiZkKm9k5Z+GHZ0JsSB
 azfzYKJMqgk1NLn2FEkbhu2QUz9h2rNV2x1UP1egI1aVmgavQU+oxGFds
 viyJ97yNX5hYp48+qkcXQ5O2SBkgZgxlmdSKGMlS5LzvftfrCFI0pbKUM
 pOeLajrQcCp83Pm/HgG/Yfpv1Z4GZ5jImK1ctrXKfNNo0T3YAhVfm4naZ
 R5ItD/OtYPYZhOZvAJw3zfh7P3k7bq1LFwJlnWjnVLdKICDX8gbvTcDBu
 cwm8xNPzerOu675SGtD116ZWUxwx234Xd17UD6I5vL9W7rgY4VO7tWNDP w==;
X-CSE-ConnectionGUID: VdLY4GBcT3qWWfr4Fx77kw==
X-CSE-MsgGUID: NX3jdbC1T0u1PDXR/wHyjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562343"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:29 -0800
X-CSE-ConnectionGUID: bV3y06GjS4u2jiQlqgjRqA==
X-CSE-MsgGUID: FAUfIo57QweVIBTUoDPQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209502"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:25 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 07/13] drm/amd/display: Hook up colorop destroy helper for
 plane pipelines
Date: Fri, 19 Dec 2025 12:26:08 +0530
Message-Id: <20251219065614.190834-8-chaitanya.kumar.borah@intel.com>
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

Provide a drm_colorop_funcs instance for amdgpu_dm color pipeline
objects and hook up the common drm_colorop_destroy() helper as the
destroy callback.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index dfdb4fb4219f..5130962193d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -55,6 +55,10 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define LUT3D_SIZE		17
 
+static const struct drm_colorop_funcs dm_colorop_funcs = {
+	.destroy = drm_colorop_destroy,
+};
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -72,7 +76,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 					      amdgpu_dm_supported_degam_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
@@ -89,7 +93,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, &dm_colorop_funcs,
+					  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
 
@@ -104,7 +109,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
+					     &dm_colorop_funcs,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
@@ -121,7 +127,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 						amdgpu_dm_supported_shaper_tfs,
 						DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		if (ret)
@@ -138,7 +144,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
+							&dm_colorop_funcs,
 							MAX_COLOR_LUT_ENTRIES,
 							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 							DRM_COLOROP_FLAG_ALLOW_BYPASS);
@@ -156,7 +163,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 			goto cleanup;
 		}
 
-		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, LUT3D_SIZE,
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane,
+					&dm_colorop_funcs, LUT3D_SIZE,
 					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 					DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		if (ret)
@@ -174,7 +182,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
 					      amdgpu_dm_supported_blnd_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
@@ -191,7 +199,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL, MAX_COLOR_LUT_ENTRIES,
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, &dm_colorop_funcs,
+						  MAX_COLOR_LUT_ENTRIES,
 						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
-- 
2.25.1

