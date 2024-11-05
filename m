Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80ED9BCA91
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BFD10E565;
	Tue,  5 Nov 2024 10:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur0OB39N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B4610E560;
 Tue,  5 Nov 2024 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802952; x=1762338952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ESq4mYykNb0DeLm888sERR1Q/fQHBVC0gwPwZpznb4=;
 b=Ur0OB39NS6/UTqSJmpMyFsVQ0XCgCFNH1cKnmk5uMtltne7BztNJAUo5
 geaPtU9J/Krh6D7NkTPUhNjs7hVUU+8myrMt2lFu+Qel9n+HFcx00Gg13
 A9rg8dELhPUNFSXnEgRLyQ4anGIzYpJHDDFA6vNejrQt5PXqNfJaU1wGc
 nXSsXncwmKqpgCoKPVVptFsTXV/lBnFG77iNbgqvavSz5nH51nhOqTmL+
 Zyh7YmVcNkpmCsOAs2MAebAFP8VaiIJVZAi5+vxVk/ubtoRdkVmcf5EEY
 QZ6WUc/bcgupgF0Ya5Ga7evbUS/NSkQ2tTrWrx85nEdErBAFYHfho6kgd Q==;
X-CSE-ConnectionGUID: 0/lwCgfKRDSdQntskhI7cg==
X-CSE-MsgGUID: vYACH5N0RyOC5LSQ6c+rBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34230843"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34230843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:35:52 -0800
X-CSE-ConnectionGUID: jwK4J2SNReqs1bukIZN8BA==
X-CSE-MsgGUID: n/g9Km0CTUq8ixVAaNdvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83485556"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:35:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 2/4] drm/i915/fb: Add async field to the modifiers description
Date: Tue,  5 Nov 2024 15:56:06 +0530
Message-Id: <20241105102608.3912133-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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

Few of the modifiers are not supported with async flip. Add an element
async_flip to say if the modifier supports asynchronous flips.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 6a7060889f40..f05e0c444618 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -231,6 +231,7 @@ struct intel_modifier_desc {
 		u8 packed_aux_planes:4;
 		u8 planar_aux_planes:4;
 	} ccs;
+	bool async_flip;
 };
 
 #define INTEL_PLANE_CAP_CCS_MASK	(INTEL_PLANE_CAP_CCS_RC | \
@@ -247,10 +248,12 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.modifier = I915_FORMAT_MOD_4_TILED_LNL_CCS,
 		.display_ver = { 20, -1 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_BMG_CCS,
 		.display_ver = { 14, -1 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_NEED64K_PHYS,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_MTL_MC_CCS,
 		.display_ver = { 14, 14 },
@@ -268,6 +271,7 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.ccs.packed_aux_planes = BIT(1),
 
 		FORMAT_OVERRIDE(gen12_ccs_formats),
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC,
 		.display_ver = { 14, 14 },
@@ -293,10 +297,12 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
 		.display_ver = { 13, 13 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED,
 		.display_ver = { 13, -1 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
 		.display_ver = { 12, 13 },
@@ -314,6 +320,7 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.ccs.packed_aux_planes = BIT(1),
 
 		FORMAT_OVERRIDE(gen12_ccs_formats),
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
 		.display_ver = { 12, 13 },
@@ -331,6 +338,7 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.ccs.packed_aux_planes = BIT(1),
 
 		FORMAT_OVERRIDE(skl_ccs_formats),
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_Y_TILED_CCS,
 		.display_ver = { 9, 11 },
@@ -339,21 +347,26 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.ccs.packed_aux_planes = BIT(1),
 
 		FORMAT_OVERRIDE(skl_ccs_formats),
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_Yf_TILED,
 		.display_ver = { 9, 11 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_Yf,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_Y_TILED,
 		.display_ver = { 9, 13 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_Y,
+		.async_flip = true,
 	}, {
 		.modifier = I915_FORMAT_MOD_X_TILED,
 		.display_ver = { 0, 29 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_X,
+		.async_flip = true,
 	}, {
 		.modifier = DRM_FORMAT_MOD_LINEAR,
 		.display_ver = DISPLAY_VER_ALL,
+		.async_flip = true,
 	},
 };
 
-- 
2.25.1

