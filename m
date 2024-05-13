Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476448C469C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 20:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802410E8FA;
	Mon, 13 May 2024 18:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B31WMkek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEF410E8EC;
 Mon, 13 May 2024 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623200; x=1747159200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtEtoU6Vg/SwPVJv6kDZ0MXhKL//j96KPInYjD3sSnM=;
 b=B31WMkekg2LQORg/k4LQzCJmgvckG3tEJ8LazepN7FS5rYRjXL8V9kFI
 6QP8X5RAyuUxexlHtvx3LYyP8LbtKAPBu7SzTXjya6ggTHNUyt0NoGkrM
 v9G45zKTpf6TdYQyAVSeYIt3gYi+WGxuytyRpwJl/i2BUcFP+BRwyinqY
 CVmRsR7woYCBgMLchd+Bh6q2frJBNDvNq0EKGeeqwIWN6w3+E/BThlsIj
 bk2J1yqON2iIZgyYst8bgKd0HLga6UJ8AG6OYWqjYM/AL+sxQyp1shS+q
 /7h933kgZkK1s26YMGO8stfp9ljRIUSB77nnSzBVqXl7v/tvON6TxnnOt A==;
X-CSE-ConnectionGUID: tKq5YdwRTdCma7+3TBK3Tg==
X-CSE-MsgGUID: YoyLvN/ZTnanAuAwWoHFCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517965"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:59:59 -0700
X-CSE-ConnectionGUID: CTlteFVhRN6dcYpGr1urJQ==
X-CSE-MsgGUID: cCUB5XY8Rhm9pmX5uu/mQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395189"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 10:59:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 20:59:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/i915: Split cursor alignment to per-platform vfuncs
Date: Mon, 13 May 2024 20:59:38 +0300
Message-ID: <20240513175942.12910-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Split intel_cursor_alignment() into per-platform variants.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 40 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_fb.c     | 16 ---------
 drivers/gpu/drm/i915/display/intel_fb.h     |  3 --
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 026975f569a7..737d53c50901 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -193,6 +193,13 @@ i845_cursor_max_stride(struct intel_plane *plane,
 	return 2048;
 }
 
+static unsigned int i845_cursor_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	return 32;
+}
+
 static u32 i845_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	u32 cntl = 0;
@@ -343,6 +350,28 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
 	return plane->base.dev->mode_config.cursor_width * 4;
 }
 
+static unsigned int i830_cursor_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	/* "AlmadorM Errata – Requires 32-bpp cursor data to be 16KB aligned." */
+	return 16 * 1024; /* physical */
+}
+
+static unsigned int i85x_cursor_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	return 256; /* physical */
+}
+
+static unsigned int i9xx_cursor_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	return 4 * 1024; /* physical for i915/i945 */
+}
+
 static u32 i9xx_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -884,20 +913,27 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 
 	if (IS_I845G(dev_priv) || IS_I865G(dev_priv)) {
 		cursor->max_stride = i845_cursor_max_stride;
+		cursor->min_alignment = i845_cursor_min_alignment;
 		cursor->update_arm = i845_cursor_update_arm;
 		cursor->disable_arm = i845_cursor_disable_arm;
 		cursor->get_hw_state = i845_cursor_get_hw_state;
 		cursor->check_plane = i845_check_cursor;
 	} else {
 		cursor->max_stride = i9xx_cursor_max_stride;
+
+		if (IS_I830(dev_priv))
+			cursor->min_alignment = i830_cursor_min_alignment;
+		else if (IS_I85X(dev_priv))
+			cursor->min_alignment = i85x_cursor_min_alignment;
+		else
+			cursor->min_alignment = i9xx_cursor_min_alignment;
+
 		cursor->update_arm = i9xx_cursor_update_arm;
 		cursor->disable_arm = i9xx_cursor_disable_arm;
 		cursor->get_hw_state = i9xx_cursor_get_hw_state;
 		cursor->check_plane = i9xx_check_cursor;
 	}
 
-	cursor->min_alignment = intel_cursor_alignment;
-
 	cursor->cursor.base = ~0;
 	cursor->cursor.cntl = ~0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index c5bae05cbbc3..c84ecae3a57c 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -776,22 +776,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
 		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
 }
 
-unsigned int intel_cursor_alignment(struct intel_plane *plane,
-				    const struct drm_framebuffer *fb,
-				    int color_plane)
-{
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
-
-	if (IS_I830(i915))
-		return 16 * 1024;
-	else if (IS_I85X(i915))
-		return 256;
-	else if (IS_I845G(i915) || IS_I865G(i915))
-		return 32;
-	else
-		return 4 * 1024;
-}
-
 static unsigned int intel_linear_alignment(const struct drm_i915_private *dev_priv)
 {
 	if (DISPLAY_VER(dev_priv) >= 9)
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 86c01a3ce81e..16ebb573643f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -60,9 +60,6 @@ unsigned int intel_tile_height(const struct drm_framebuffer *fb, int color_plane
 unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int color_plane);
 unsigned int intel_fb_align_height(const struct drm_framebuffer *fb,
 				   int color_plane, unsigned int height);
-unsigned int intel_cursor_alignment(struct intel_plane *plane,
-				    const struct drm_framebuffer *fb,
-				    int color_plane);
 unsigned int intel_surf_alignment(struct intel_plane *plane,
 				  const struct drm_framebuffer *fb,
 				  int color_plane);
-- 
2.43.2

