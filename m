Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C979C54CF2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 00:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9853010E7C2;
	Wed, 12 Nov 2025 23:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9T19Ff3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D810E7C2;
 Wed, 12 Nov 2025 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762990248; x=1794526248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTk2y8zq+FUe4ZlYmEjzjd+Nc3dYdrDpp0E6KWnsXs0=;
 b=h9T19Ff3meTOhFfVwAE5+DxFqN60w1Dktes4vouBUDlNwzBxHJavMLb6
 vkpIKmNEcxU3tDVE0RYoYihCFy2F6W3TbbJ4gdTLKQE6CO8lmbaONvWyf
 HGznwotDvJUIi0nOx1Cf6y1/ygShlbiCCuudx7u++Np0IcDErm+agD3gh
 PlR+4N+sWEzTWSCINoonCFhURT4dhvcRNzCvIQvbd9iEPNRFiGwZyLF2d
 MAPCvrkucQf1I9GZvb3duRJ0nNdVlHgczGGp9QyDq+80LP973EvOpKz7I
 hNsF4/jQCZD2Pj7AhtTzqsgGFcurcCgAWBupB1UpzYoblG0RG2WX+lYRh Q==;
X-CSE-ConnectionGUID: Bpi2jIL1TaaN68Sg148KLQ==
X-CSE-MsgGUID: 5P8IiiY9TriFkcm+6PqQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82697822"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="82697822"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:48 -0800
X-CSE-ConnectionGUID: xq9TKwtpQXGsAXwyRGfj4Q==
X-CSE-MsgGUID: Eaqpfu3kQ2OOEt102hFXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="194330589"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Eliminate one more frequent drm_format_info()
Date: Thu, 13 Nov 2025 01:30:30 +0200
Message-ID: <20251112233030.24117-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
References: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Another (somewhat expensive) drm_format_info() call has
appeared in intel_plane_can_async_flip(). That one may get
called several times per commit so we need to get rid of
it.

Fortunately most callers already have the framebuffer at
hand, so we can just grab the format info from there.
The one exception is intel_plane_format_mod_supported_async()
where we have to do the lookup. But that only gets called
(a bunch of times) during driver init to build the
IN_FORMATS_ASYNC blob, and afterwards there is no runtime
cost.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c    | 22 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_plane.h    |  4 +++-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 5 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 51ccc6bd5f21..b93c86197b4a 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -819,7 +819,7 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
 		return 256 * 1024;
 
 	/* FIXME undocumented so not sure what's actually needed */
@@ -843,7 +843,7 @@ static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format, fb->modifier))
 		return 256 * 1024;
 
 	if (intel_scanout_needs_vtd_wa(display))
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 069967114bd9..71bd8484885b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6122,7 +6122,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		if (!plane->async_flip)
 			continue;
 
-		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
+		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format,
 						new_plane_state->hw.fb->modifier)) {
 			drm_dbg_kms(display->drm,
 				    "[PLANE:%d:%s] pixel format %p4cc / modifier 0x%llx does not support async flip\n",
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 5105e3278bc4..ee9cda94a7c9 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -178,25 +178,29 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
 		DISPLAY_INFO(display)->cursor_needs_physical;
 }
 
-bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+bool intel_plane_can_async_flip(struct intel_plane *plane,
+				const struct drm_format_info *info,
 				u64 modifier)
 {
-	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier) ||
-	    format == DRM_FORMAT_C8)
+	if (intel_format_info_is_yuv_semiplanar(info, modifier) ||
+	    info->format == DRM_FORMAT_C8)
 		return false;
 
 	return plane->can_async_flip && plane->can_async_flip(modifier);
 }
 
-bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
-					    u32 format,
-					    u64 modifier)
+bool intel_plane_format_mod_supported_async(struct drm_plane *_plane,
+					    u32 format, u64 modifier)
 {
-	if (!plane->funcs->format_mod_supported(plane, format, modifier))
+	struct intel_plane *plane = to_intel_plane(_plane);
+	const struct drm_format_info *info;
+
+	if (!plane->base.funcs->format_mod_supported(&plane->base, format, modifier))
 		return false;
 
-	return intel_plane_can_async_flip(to_intel_plane(plane),
-					format, modifier);
+	info = drm_get_format_info(plane->base.dev, format, modifier);
+
+	return intel_plane_can_async_flip(plane, info, modifier);
 }
 
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm/i915/display/intel_plane.h
index 4e99df9de3e8..5a8f2f3baab5 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_plane.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct drm_format_info;
 struct drm_plane;
 struct drm_property;
 struct drm_rect;
@@ -21,7 +22,8 @@ enum plane_id;
 
 struct intel_plane *
 intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id);
-bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+bool intel_plane_can_async_flip(struct intel_plane *plane,
+				const struct drm_format_info *info,
 				u64 modifier);
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 89c8003ccfe7..921b2f73d27a 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -595,7 +595,7 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	 * Figure out what's going on here...
 	 */
 	if (display->platform.alderlake_p &&
-	    intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
+	    intel_plane_can_async_flip(plane, fb->format, fb->modifier))
 		return mult * 16 * 1024;
 
 	switch (fb->modifier) {
-- 
2.49.1

