Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87AA3B95A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85EC10E7D6;
	Wed, 19 Feb 2025 09:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfEjdtux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AA610E7D1;
 Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739957527; x=1771493527;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=NTkaFdqOXt49ggVpaXj+gVSCa/GyDDoh3XBDpGhpmt0=;
 b=YfEjdtuxenWLVnKMHFMUWTGDsmQGfAm2AMKFbZDBTzAjQq3phiH4Hu5x
 0wGxoOIrcdfWx8AMrQtx7W0LvpPPf9EjCMT7bWezZJZyN5ZNKq5l0QPoA
 ieotD0aHboKNwtyodDHdZSpCKydgrRpbKDapaYkDjayToQpmlNHv+6DEp
 DMdXreygOuX2WbBPtm0QqfvLyXPhE2ysV47/FGNXbS19FiTWv3dHqEObB
 dPduo4BrlL3lKXQvVYb1ysFwF0TSqAdBSQaqhwBK3NcWa/U4k7V0t/c/h
 pxKe0uMWxXW5jXPMmvxLi/70aQd+gjsBk2AO3Kb/ayfIm/hsCWykHkZoK Q==;
X-CSE-ConnectionGUID: g21WQ89pThyqOvdLsudECQ==
X-CSE-MsgGUID: Xym6QfZBTGmnSfTEKT5/bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40551488"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40551488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 01:32:07 -0800
X-CSE-ConnectionGUID: KDm2tZ/dRhCpsqFlI6TXDQ==
X-CSE-MsgGUID: eWKPaJ+CQaCNIrUKVSmk7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137910344"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 01:32:05 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 19 Feb 2025 14:47:25 +0530
Subject: [PATCH v6 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-asyn-v6-3-b959e6becb3c@intel.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
In-Reply-To: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Arun R Murthy <arun.r.murthy@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
X-Mailer: b4 0.15-dev
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

Hook up the newly added plane function pointer
format_mod_supported_async to populate the modifiers/formats supported
by asynchronous flips.

v5: Correct the if condition for modifier support check (Chaitanya)
v6: Replace uint32_t/uint64_t with u32/u64 (Jani)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index cd9762947f1de227a3abbcd61b7c7b0c9848e439..f8baeb012f5e2423204f3f5ad7ce466666e04def 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -509,6 +509,33 @@ skl_plane_max_stride(struct intel_plane *plane,
 				modifier, rotation,
 				max_pixels, max_bytes);
 }
+static bool intel_plane_async_formats(struct intel_plane *plane, u32 format)
+{
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
+						   u32 format,
+						   u64 modifier)
+{
+	if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))
+		return false;
+
+	return intel_plane_async_formats(to_intel_plane(plane), format);
+}
 
 static bool tgl_plane_can_async_flip(u64 modifier)
 {
@@ -2616,30 +2643,29 @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
 	}
 }
 
+#define INTEL_PLANE_FUNCS \
+	.update_plane = drm_atomic_helper_update_plane, \
+	.disable_plane = drm_atomic_helper_disable_plane, \
+	.destroy = intel_plane_destroy, \
+	.atomic_duplicate_state = intel_plane_duplicate_state, \
+	.atomic_destroy_state = intel_plane_destroy_state, \
+	.format_mod_supported_async = intel_plane_format_mod_supported_async
+
 static const struct drm_plane_funcs skl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = skl_plane_format_mod_supported,
 };
 
 static const struct drm_plane_funcs icl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = icl_plane_format_mod_supported,
 };
 
 static const struct drm_plane_funcs tgl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = tgl_plane_format_mod_supported,
 };
 

-- 
2.25.1

