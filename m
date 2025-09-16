Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DBB58EF4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6211610E6BC;
	Tue, 16 Sep 2025 07:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbfBMXQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582010E6B9;
 Tue, 16 Sep 2025 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758007110; x=1789543110;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CV3MXP5xcJTuaKnyZoyonp+FyZaiL2f8JaFNi50MBCE=;
 b=gbfBMXQcI11r+n9reGUmyM4DKloDKw1eDeyA3BHd9kEGp/6sj21o3n5v
 LT7tt2vnAbV/YuauW7jjx8fJulmr2eO0pM3KEF1+X6CxH4H/MuTkSgle6
 hM9y7jSaWAjfp4T9epVV8YX7Wsujh6MlJSgxaaBjUGDsfxRdJLjIBSqYa
 omqekVUYWA02zbDtVV8BJqXjuO6cQ1Kw4dn/wFg/hjkMA1fcMWSh92JnX
 2nByKy2WPfJkM+XiXgF6eu+DqelrD+m8wQ84iX1cKXXN5UewbZ60G3qp9
 8TB8WazfS6q/IIgAjXKkdn4p7o0YEgHID8mMpoaGqLVrUxhomx3OxAKAt w==;
X-CSE-ConnectionGUID: UiLPol0yRASaonLKW9m4Rw==
X-CSE-MsgGUID: FkZQCShRRhi+X7UZM4NPJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70526997"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70526997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:18:23 -0700
X-CSE-ConnectionGUID: 2gvb+kirRSWTIGa4M6Qj7g==
X-CSE-MsgGUID: opROGkJTQZ+PWheK2OZuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175650847"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 00:18:17 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 16 Sep 2025 12:48:15 +0530
Subject: [PATCH v5 5/5] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-atomic-v5-5-821525cfbf25@intel.com>
References: <20250916-atomic-v5-0-821525cfbf25@intel.com>
In-Reply-To: <20250916-atomic-v5-0-821525cfbf25@intel.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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

For failures in async flip atomic check/commit path return user readable
error codes in struct drm_atomic_state.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..b264e5dbedb52f5b3fdb24dc3459acc5dc52009f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5947,9 +5947,10 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		drm_mode_atomic_add_error_msg(&state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      "[CRTC:%d:%s] requires full modeset",
+					      crtc->base.base.id, crtc->base.name);
 		return -EINVAL;
 	}
 
@@ -6016,9 +6017,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		drm_mode_atomic_add_error_msg(&state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      "[CRTC:%d:%s] requires full modeset",
+					      crtc->base.base.id, crtc->base.name);
 		return -EINVAL;
 	}
 
@@ -6056,11 +6058,12 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 
 		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
 						new_plane_state->hw.fb->modifier)) {
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] pixel format %p4cc / modifier 0x%llx does not support async flip\n",
-				    plane->base.base.id, plane->base.name,
-				    &new_plane_state->hw.fb->format->format,
-				    new_plane_state->hw.fb->modifier);
+			drm_mode_atomic_add_error_msg(&state->base.error_code,
+						      DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
+						      "[PLANE:%d:%s] pixel format %p4cc / 0x%llx modifier does not support async flip",
+						      plane->base.base.id, plane->base.name,
+						      &new_plane_state->hw.fb->format->format,
+						      new_plane_state->hw.fb->modifier);
 			return -EINVAL;
 		}
 

-- 
2.25.1

