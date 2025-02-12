Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11657A32BAB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB2610E916;
	Wed, 12 Feb 2025 16:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3ZeadJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8045710E911;
 Wed, 12 Feb 2025 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377998; x=1770913998;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bPb4HGtPc1jw3HZ2PILjHq8rNQ6CKsUqMy94wB2IVAE=;
 b=a3ZeadJYMUMVlBJ40WLLhgrcIyM2+DkAZXxYGm31XTvPuMGzHvZfGSni
 CLcgmUSoi6sYCDkHke5Q5fghTJIVlmWVFa8fI0oSkhmyLAYs3slitl1Xq
 6RhHfo4EFXxGQZL+efxo19NZXXLqG6Pw7IC8HbG6dA8wYTcHiGqNHcA04
 Cq74ftWam5Dv3qtk9iAxxOmqGI4LsOuTgFjj82gg6j7IQfMi7gk716mju
 tPQVizxIX5Tu/Ey7kZETMymgPfewS0gihrmTGXixObU139OaamSWpRQ5Q
 pYS9KzTqDrBry1oH0mZmphXj6XgWZvkwrwTMifQpNnxv2+x8zBJMhNVM5 g==;
X-CSE-ConnectionGUID: czN1DSufQdGibDpforgghA==
X-CSE-MsgGUID: XK9jlCjQTRuVlG6lv8MLgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969133"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39969133"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:33:18 -0800
X-CSE-ConnectionGUID: 4H8SIfHcR8qpEHO4OETAsQ==
X-CSE-MsgGUID: QzFEoXf5QFSIc8uGMqRkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116989312"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2025 08:33:16 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 12 Feb 2025 21:48:24 +0530
Subject: [PATCH v5 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-asyn-v5-3-dc182281dca3@intel.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-0-dc182281dca3@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5db553c374259f8f3246c1408b55d32c8794e5..2743b031d1092ccc74b4144bd06dba8790f722e7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -511,6 +511,33 @@ skl_plane_max_stride(struct intel_plane *plane,
 				modifier, rotation,
 				max_pixels, max_bytes);
 }
+static bool intel_plane_async_formats(struct intel_plane *plane, uint32_t format)
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
+						   uint32_t format,
+						   uint64_t modifier)
+{
+	if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))
+		return false;
+
+	return intel_plane_async_formats(to_intel_plane(plane), format);
+}
 
 static bool tgl_plane_can_async_flip(u64 modifier)
 {
@@ -2559,30 +2586,29 @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
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

