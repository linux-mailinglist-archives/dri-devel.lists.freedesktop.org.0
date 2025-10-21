Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF97BF84C3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543B10E339;
	Tue, 21 Oct 2025 19:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUPOEk/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725E410E331;
 Tue, 21 Oct 2025 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075925; x=1792611925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjUO5w86AATJPjEibOUgH44X33AjDPwEzR8Yc00uMP8=;
 b=iUPOEk/dmKPTZGe5ini4Zaupodef0hkf7ncpu52k5PHbZFb632K3Ie6p
 DPNjvyC2REmYkHTx4f/hglgyNVvQe1CBjWCagtRXhT8p4uSE6WHTYtD4x
 GukxFWcv+yhht85/aJw/gbsMtv/fjFmFp4nNxOJAA7tvGOyUSwf62npBw
 KM2xpkIGFVyWtnouFT59MZZxhZTp9R4zyhQxy8qkPw7ntKP7iAOIY4U4R
 UObhyt3lIjySlc22MFtE+e7gofQxIB/VrcX+6IYZ2tLfFGwX6YTCXGxMI
 bqkXoaeLw+IAXB1nkMPYecUxZVVcNQ/X6151vVQ24LiLntkW1nGBGaF5F Q==;
X-CSE-ConnectionGUID: PP9Ju1FTQuyUiUhJTRb/NA==
X-CSE-MsgGUID: z81V45r6RBi4OKHlNHMYsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62244804"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="62244804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:25 -0700
X-CSE-ConnectionGUID: pmHmoRyvRcuSQh/gsNdURg==
X-CSE-MsgGUID: ZVAbu5LcR0uoIATzf017Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182838048"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:24 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 5/5] drm/i915/dumb: Handle DRM_MODE_DUMB_CURSOR
Date: Tue, 21 Oct 2025 22:44:55 +0300
Message-ID: <20251021194455.24297-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
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

Allocate the dumb buffer based on the cursor hardware capabilities
when userspace has asked for it via the DRM_MODE_DUMB_CURSOR flag.

Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c  | 38 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.h  |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c |  5 ++-
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index c47c84935871..fffb25c91146 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -998,6 +998,44 @@ static void intel_cursor_add_size_hints_property(struct intel_plane *plane)
 	drm_plane_add_size_hints_property(&plane->base, hints, num_hints);
 }
 
+int intel_cursor_dumb_create(struct intel_display *display,
+			     struct drm_mode_create_dumb *args)
+{
+	const struct drm_mode_config *mode_config = &display->drm->mode_config;
+	int cpp = DIV_ROUND_UP(args->bpp, 8);
+
+	if (cpp != 4)
+		return -EINVAL;
+
+	if (args->width > mode_config->cursor_width)
+		return -EINVAL;
+
+	if (args->height > mode_config->cursor_height)
+		return -EINVAL;
+
+	if (display->platform.i845g || display->platform.i865g) {
+		if (!IS_ALIGNED(args->width, 64))
+			return -EINVAL;
+
+		args->pitch = roundup_pow_of_two(args->width) * 4;
+	} else {
+		switch (args->width) {
+		case 64:
+		case 128:
+		case 256:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		args->pitch = args->width * 4;
+	}
+
+	args->size = mul_u32_u32(args->pitch, args->height);
+
+	return 0;
+}
+
 struct intel_plane *
 intel_cursor_plane_create(struct intel_display *display,
 			  enum pipe pipe)
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.h b/drivers/gpu/drm/i915/display/intel_cursor.h
index 65a9e7eb88c2..cd3ae2d6042e 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.h
+++ b/drivers/gpu/drm/i915/display/intel_cursor.h
@@ -7,6 +7,7 @@
 #define _INTEL_CURSOR_H_
 
 enum pipe;
+struct drm_mode_create_dumb;
 struct intel_display;
 struct intel_plane;
 struct kthread_work;
@@ -16,5 +17,7 @@ intel_cursor_plane_create(struct intel_display *display,
 			  enum pipe pipe);
 
 void intel_cursor_unpin_work(struct kthread_work *base);
+int intel_cursor_dumb_create(struct intel_display *display,
+			     struct drm_mode_create_dumb *args);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bd4317291ba5..6772d4dd94c7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -574,7 +574,10 @@ int intel_display_dumb_create(struct drm_device *drm,
 {
 	struct intel_display *display = to_intel_display(drm);
 
-	return intel_plane_dumb_create(display, args);
+	if (args->flags & DRM_MODE_DUMB_CURSOR)
+		return intel_cursor_dumb_create(display, args);
+	else
+		return intel_plane_dumb_create(display, args);
 }
 
 void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
-- 
2.49.1

