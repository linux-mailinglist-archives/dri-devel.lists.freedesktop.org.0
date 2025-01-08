Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94604A052E4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F5510EB8C;
	Wed,  8 Jan 2025 05:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGmFY4LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36A10EB88;
 Wed,  8 Jan 2025 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736315628; x=1767851628;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ZMDrsQyhi1FM9uO2P0kDVttJ6sdjL8ZEXRkqEbtLnc8=;
 b=DGmFY4LNBd+N9cIXGcrg/2Lqlgb70Wzh8wPjfBYpMy3yn6sxHYibpFSw
 yqlsPbT4Ax/EYU+bRz2vhU9QBMYrJxT3dIfvJmMyDtjWKEO5QkKpkRlzo
 5NtAzx45xda4hizsX+kMbzJQKULWMGShHATd1TuAFAcCThB0Ysg43pk3/
 nkUl7P2ey7RhNh3xNpR/eRl+2vJ5f6hO99pESZI9E4kGrdl386kZ8ClQK
 GJzLChCStAsiLL8bd2bSSqVvGVcfF2NB4U2lx2nFUHdUIM8oPipRwNavm
 k53LuabWRT2isMBvohqwy5q0vmukbonjI/YekyaU/ELxLFO7e1ZDFX7iA g==;
X-CSE-ConnectionGUID: Dp1bqQ/ZQMmtll1UoeC/Jw==
X-CSE-MsgGUID: Z0DeYlg+TQO8M8yNILXHAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61903910"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="61903910"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:53:48 -0800
X-CSE-ConnectionGUID: NssyhRxVScmowdVGYgzp2g==
X-CSE-MsgGUID: rYB53hDsQA+k3pmxE8v1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107024172"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 21:53:46 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 08 Jan 2025 11:09:03 +0530
Subject: [PATCH v3 5/5] drm/i915/display: Add function for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-asyn-v3-5-f4399635eec9@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
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

Add driver specific function definition for the plane->funcs
format_mod_supported_async to check if the provided format/modifier is
supported for asynchronous flip.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 62 ++++++++++++++++------
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index e5e47f2219dae62e76cbde2efb40266b047ab2b2..00aa254a3b4e992268c9159bc15687e54718dc43 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2526,30 +2526,62 @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
 	}
 }
 
+static bool intel_plane_format_mod_supported_async(struct drm_plane *_plane,
+						   u32 format, u64 modifier)
+{
+	struct intel_plane *plane = to_intel_plane(_plane);
+	struct intel_display *display = to_intel_display(plane);
+	int i, found = false;
+	u64 *async_modifiers;
+
+	if (plane->id != 1)
+		return false;
+
+	if (DISPLAY_VER(display) >= 12)
+		async_modifiers = tgl_asyn_modifiers;
+	else if (DISPLAY_VER(display) == 11)
+		async_modifiers = icl_async_modifiers;
+	else
+		async_modifiers = skl_async_modifiers;
+
+	for (i = 0; i < sizeof(async_modifiers); i++) {
+		if (modifier == async_modifiers[i])
+			found = true;
+	}
+	if (!found)
+		return false;
+
+	/* Async flip supported only on RGB formats */
+	for (i = 0; i < sizeof(intel_async_formats); i++) {
+		if (format == intel_async_formats[i])
+			return true;
+	}
+	return false;
+}
+
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

