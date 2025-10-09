Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EABC853A
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8E310E9B8;
	Thu,  9 Oct 2025 09:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUeXx6Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDC410E9B7;
 Thu,  9 Oct 2025 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760002375; x=1791538375;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=70aqtrpWW+OJJnKEiX19aH7tMRkTBMJ66XZ0FnFUdDE=;
 b=IUeXx6BmE2yPJEMraAzebNtT61C0ca85X0Dol4rjoI0qjSq6Tzf7ZVn4
 H80PhmwDuBFvi0pAkLp9plCdk+Jfbus6BwkRT08GT87jCzV498/SUzRii
 IIsDVWGncvur7akyP51MoK5oUcpNvGGTjCX4FTN2ILWMdGcUYy3rkvJhX
 ZXNjSxxgTZ/RJnpCPwxCWcfRW3ooup0AyYPjQ2fa3msWJUfrTr+ZgNw0k
 FpLl0wodi8/slXIa0+qvlxf1iOnH2Jl5RlqM2wGtNsz+qn+rt55bqk8oH
 AjFlFgD51EETJLdE3FH8L6pWSKFD30aP9DBqIMcEYZ0aX409DxTvcYl/Q g==;
X-CSE-ConnectionGUID: 2SbpGqSXTWadAEbubVUvuA==
X-CSE-MsgGUID: ShFguISWRF2+pNgIxZYS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66060897"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="66060897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:32:55 -0700
X-CSE-ConnectionGUID: RoSHHP76Tw2u6KyqLjC3MA==
X-CSE-MsgGUID: oI7rC+AORAOLxShOd4TGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="185789631"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 02:32:50 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 09 Oct 2025 15:02:53 +0530
Subject: [PATCH v6 5/5] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-atomic-v6-5-d209709cc3ba@intel.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com
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
index b57efd8707743eb1b5a2b377fba8d6955af89825..6639f9168cf775c220fb653d69f8e27c5a4e6b88 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5911,9 +5911,10 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
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
 
@@ -5980,9 +5981,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
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
 
@@ -6020,11 +6022,12 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 
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

