Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922FA7D3BD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 07:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CA410E202;
	Mon,  7 Apr 2025 05:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pu6/bs7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5D10E1F4;
 Mon,  7 Apr 2025 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744005506; x=1775541506;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yJjtKDeONj9dPb3Lx/dOMRIczBvtQaFPXBWeHytZrmY=;
 b=Pu6/bs7VoCzz92oYP/rqKpUhVfAvaT77PVBw2zqDJY6V7NXNyEZZRdoL
 Ek/pwFTsNrnP/b2x8ov81Va+iS11vDyczB8md55axIVQO1M6GU3gYBVqP
 f7KIc5hIVOVyb/IFZ0eKLawuTofe+UsqSL3qKz+aCzHMKgi1o7J1wZo6H
 1T2L5idJb18GVZckThANp1/nuJHtHSb4dmbHt68o+uq7NqpxyAjytYIlV
 1UumnnaeVdTG8/a8ue86pjhudEPq7hbF19tlaTjIeZ++zWFWQovOk4MDM
 Qt3GtI2cL4ri9GbXVlQ0q9Fhyt1HBCym6CUYUgKieLhGWn0emVlaPyRpX A==;
X-CSE-ConnectionGUID: PcHdPW31TkyDsJxvQrMVXg==
X-CSE-MsgGUID: thxtuKsQRTGgk7nB27a/aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45391833"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45391833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:58:26 -0700
X-CSE-ConnectionGUID: MQUhpLUHQC+QGWr5Fl3yMA==
X-CSE-MsgGUID: BIjOoS16QeuLuZZa2HcEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128373983"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 22:58:24 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 07 Apr 2025 11:13:47 +0530
Subject: [PATCH RESEND v13 3/5] drm/i915/display: Acomodate format check in
 intel_plane_can_async_flip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-asyn-v13-3-b93ef83076c5@intel.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
In-Reply-To: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
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

The function intel_plane_can_async_flip() checks for async supported
modifier, add format support check also in the same function.

Note: on ADL the surface base addr is required to be 16k aligned and if
not might generate DMAR and GGTT faults leading to glitches. This patch
changes the 16k alignment to 4k for planar formats.

v11: Move filtering Indexed 8bit to a separate patch (Ville)
v12: correct the commit msg and remove unwanted debug print (Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  4 ++--
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  6 +++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 ++++----------
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 5e8344fdfc28a311dc0632bb848a0e08f9e6c6d2..20c47de6d8bfd1d8ddafae02ed68370df799e22b 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -828,7 +828,7 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return 256 * 1024;
 
 	/* FIXME undocumented so not sure what's actually needed */
@@ -852,7 +852,7 @@ static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
 {
 	struct intel_display *display = to_intel_display(plane);
 
-	if (intel_plane_can_async_flip(plane, fb->modifier))
+	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return 256 * 1024;
 
 	if (intel_scanout_needs_vtd_wa(display))
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 7276179df878658b7053fe6d8dc37b69f19625e3..1ec730047759cb22b3e0fabfd2eaddbc1bc865af 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -174,8 +174,12 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
 		DISPLAY_INFO(display)->cursor_needs_physical;
 }
 
-bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier)
+bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+				u64 modifier)
 {
+	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier))
+		return false;
+
 	return plane->can_async_flip && plane->can_async_flip(modifier);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index 6efac923dcbc757e6f68564cbef2919c920f13cb..772a12aa9c6997d77b9393f964e91f3e8747d149 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -21,7 +21,8 @@ enum plane_id;
 
 struct intel_plane *
 intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id);
-bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier);
+bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
+				u64 modifier);
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 103173836abf9ea3a9094d2726d3dfbc94023ea6..ac12c13331b6a6bfb49ef6eebf50b42a83470a82 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5998,22 +5998,16 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		if (!plane->async_flip)
 			continue;
 
-		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->modifier)) {
+		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
+						new_plane_state->hw.fb->modifier)) {
 			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] Modifier 0x%llx does not support async flip\n",
+				    "[PLANE:%d:%s] pixel format %p4cc / modifier 0x%llx does not support async flip\n",
 				    plane->base.base.id, plane->base.name,
+				    &new_plane_state->hw.fb->format->format,
 				    new_plane_state->hw.fb->modifier);
 			return -EINVAL;
 		}
 
-		if (intel_format_info_is_yuv_semiplanar(new_plane_state->hw.fb->format,
-							new_plane_state->hw.fb->modifier)) {
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] Planar formats do not support async flips\n",
-				    plane->base.base.id, plane->base.name);
-			return -EINVAL;
-		}
-
 		/*
 		 * We turn the first async flip request into a sync flip
 		 * so that we can reconfigure the plane (eg. change modifier).
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 8739195aba696d13b30e1b978c8b2bb5e188119b..8f6170a5c108a000582f3415f78bad279254d8cf 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	 * Figure out what's going on here...
 	 */
 	if (display->platform.alderlake_p &&
-	    intel_plane_can_async_flip(plane, fb->modifier))
+	    intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
 		return mult * 16 * 1024;
 
 	switch (fb->modifier) {

-- 
2.25.1

