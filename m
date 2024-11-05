Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527709BCA96
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5717F10E56B;
	Tue,  5 Nov 2024 10:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmFSLnPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997EC10E564;
 Tue,  5 Nov 2024 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802956; x=1762338956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCgS8k7/uxaQcuWl5W5YeVYEW2EcGG8QYH537cMXFq4=;
 b=dmFSLnPpSfbhdBSbBTvSA+ctC9gmnHTXeefkKliiCcYg0dxqeAjjLUI4
 Q47hnjvHpgWrKU/35rTkFgKi/T9YCLk2BfHis6KfpPc151+rvZoxdD/uP
 0uyZFyvfX2O45Sot+ebR+A98MPLYgbsghu1fR5IYFNBBIchiob0qiLbKh
 HUEnyb1yeRHu0NMTKA80q8ceBwF7eTkBKT+gkciERO7053+al9or4y3GO
 tnRaJafQTvF00evkL/CuA6cNU04xZRqGIcZOiJeh1IfEP8qG8lrqmDRqW
 hpCyyrlCFQ+TfFYfODOjODBhRcFOcBhi43klxWYt4/d/wVg2cH2XMTzKD A==;
X-CSE-ConnectionGUID: +VrqQ7SHSPy9VAiZ0jWbdg==
X-CSE-MsgGUID: qANx2wkBSOa/Yl2UngiU7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34230856"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34230856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:35:56 -0800
X-CSE-ConnectionGUID: 4kqE3FhDTUy9SdPcbFaklA==
X-CSE-MsgGUID: 5TF/mbYOR8GzE+pllpstVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83485581"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:35:54 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 4/4] drm/i915/display: Add async supported formats/modifiers
Date: Tue,  5 Nov 2024 15:56:08 +0530
Message-Id: <20241105102608.3912133-5-arun.r.murthy@intel.com>
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

Add the formats/modifiers supported by asynchronous flips by the
platform based on the plane capabilities.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 54cf2c9374cb..bead0c01af10 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -27,6 +27,18 @@
 #include "skl_watermark.h"
 #include "pxp/intel_pxp.h"
 
+static u32 skl_async_plane_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_XRGB16161616F,
+	DRM_FORMAT_XBGR16161616F,
+};
+
 static const u32 skl_plane_formats[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_RGB565,
@@ -2660,6 +2672,9 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 		formats = skl_get_plane_formats(dev_priv, pipe,
 						plane_id, &num_formats);
 
+	plane->base.async_format_count = ARRAY_SIZE(skl_async_plane_formats);
+	plane->base.async_format_types = skl_async_plane_formats;
+
 	if (DISPLAY_VER(dev_priv) >= 12)
 		plane_funcs = &tgl_plane_funcs;
 	else if (DISPLAY_VER(dev_priv) == 11)
@@ -2672,6 +2687,13 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	else
 		plane_type = DRM_PLANE_TYPE_OVERLAY;
 
+	plane->base.async_modifier_count = intel_fb_plane_get_modifiers_count(dev_priv,
+									      skl_get_plane_caps(dev_priv, pipe, plane_id),
+									      true);
+	plane->base.async_modifiers = intel_fb_plane_get_modifiers(dev_priv,
+								   skl_get_plane_caps(dev_priv, pipe, plane_id),
+								   true);
+
 	modifiers = intel_fb_plane_get_modifiers(dev_priv,
 						 skl_get_plane_caps(dev_priv, pipe, plane_id),
 						 false);
-- 
2.25.1

