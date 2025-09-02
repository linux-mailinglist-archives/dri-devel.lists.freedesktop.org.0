Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36604B3F6F0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D34A10E5C7;
	Tue,  2 Sep 2025 07:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h518x410";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6C10E5C7;
 Tue,  2 Sep 2025 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756799275; x=1788335275;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=o68v916sPAiuOhaNozX1VyweCY+o1fn91JZbl3pkZ2I=;
 b=h518x410k57/g3sYagjRzNj1KYUfKNSek7we+6RdlusZDytB5jpGcq/V
 7cjMN4cIpuY0ZfW2mU/5ivWG0l123jbZhJgi+nBe7mWcYFbTQ9DXNf7as
 EXn9R2z7u1V3EOg+W/YX+K7zOKQtSz4LU8uYlyS8jIxezg9nZDEc/KDzY
 v3ZbKqTOyWZIOAheIaYjmwZ03L0PVEp0+68Ewseeijw2IRSJYc6H8PLbN
 GMvJerSbv6CjFTfCQ+aDaMMAc/a4Lq0w9jW158+zYxnqm79IGg1BCxon2
 J3+RK70nBotLCiBxycLVVFVXQoLSY6VlkunjrVs+3hwmKy2duQqwn1gX+ w==;
X-CSE-ConnectionGUID: qqWynVs5Q1eaJB/G0PglEA==
X-CSE-MsgGUID: nKEgYJSQS5eo82eTLDIfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81641737"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81641737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:47:55 -0700
X-CSE-ConnectionGUID: VyzGpOQxQT6V3AIxixVbrQ==
X-CSE-MsgGUID: WlS2Xg+UTeykqhAqimAZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="194850769"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 00:47:50 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Sep 2025 13:17:55 +0530
Subject: [PATCH v4 4/4] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-atomic-v4-4-a97b4bed969b@intel.com>
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
In-Reply-To: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
 drivers/gpu/drm/i915/display/intel_display.c | 31 +++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..41b054764fdec37e4d9410fa7fbe62dbcbd3a11f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5935,6 +5935,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 	struct intel_plane_state *new_plane_state;
 	struct intel_plane *plane;
 	int i;
+	char *err_string;
 
 	if (!new_crtc_state->uapi.async_flip)
 		return 0;
@@ -5947,9 +5948,13 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		err_string = "requires full modeset";
+		drm_dbg_kms(display->drm, "[CRTC:%d:%s] %s\n",
+			    crtc->base.base.id, crtc->base.name,
+			    err_string);
+		drm_mode_atomic_add_error_msg(state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      err_string);
 		return -EINVAL;
 	}
 
@@ -6001,6 +6006,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 	const struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
 	int i;
+	char *err_string;
 
 	old_crtc_state = intel_atomic_get_old_crtc_state(state, crtc);
 	new_crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
@@ -6016,9 +6022,13 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		err_string = "requires full modeset";
+		drm_dbg_kms(display->drm, "[CRTC:%d:%s] %s\n",
+			    crtc->base.base.id, crtc->base.name,
+			    err_string);
+		drm_mode_atomic_add_error_msg(state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      err_string);
 		return -EINVAL;
 	}
 
@@ -6056,11 +6066,16 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 
 		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
 						new_plane_state->hw.fb->modifier)) {
+			err_string = "modifier does not support async flip";
 			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] pixel format %p4cc / modifier 0x%llx does not support async flip\n",
+				    "[PLANE:%d:%s] pixel format %p4cc / 0x%llx %s\n",
 				    plane->base.base.id, plane->base.name,
 				    &new_plane_state->hw.fb->format->format,
-				    new_plane_state->hw.fb->modifier);
+				    new_plane_state->hw.fb->modifier,
+				    err_string);
+			drm_mode_atomic_add_error_msg(state->base.error_code,
+						      DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
+						      err_string);
 			return -EINVAL;
 		}
 

-- 
2.25.1

