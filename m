Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3A6C346E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969C110E231;
	Tue, 21 Mar 2023 14:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CED10E229;
 Tue, 21 Mar 2023 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409498; x=1710945498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2CKFL4+f+nejrR6x7wefKGi1jukmF7XziJ+1ND/SVg=;
 b=X7534Xx8JnwQQObL5azZehC2RnKPSvaEAetfETgWNw8zY3zbxWye+8Xu
 ouUFhW2S3TxNcf8iSkqt1zaAE2ZSVWTEgPTc3x4WGnaPmr2RfuX+TepLR
 mU8iIXKaMnFTdZkSVo8TOwEi4S8s3ctKCT2tNwDAnjHeCuELXzTstp3yE
 C+NM2NcCUOf2PUcKqd0iDjtCFU/h/dQ/6O/gv2tbBoUr7S+VwT0TfgVDp
 E4R6vCVWHPCzP3P6rdTPQV2HRs6QUocc4iAdzOz3VSvTN+rkqVS3hXZLo
 n9L1H4Q7iauc6aKlXQO3cvjT60icTwWcb8sy1TUHHASZKn3vzaLScDTMi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403832795"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403832795"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674851703"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674851703"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 21 Mar 2023 07:36:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Mar 2023 16:36:51 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v2 2/3] drm/i915: Adjust cursor_size_ok() func calling
 convention
Date: Tue, 21 Mar 2023 16:36:42 +0200
Message-Id: <20230321143643.26676-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
References: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Tweak the parameters we pass to the cursor size_ok() functions
in preparation for using them to populate the SIZE_HINT property.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 63 +++++++++++----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 31bef0427377..edeeb5f9f795 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -65,12 +65,10 @@ static u32 intel_cursor_position(const struct intel_plane_state *plane_state)
 	return pos;
 }
 
-static bool intel_cursor_size_ok(const struct intel_plane_state *plane_state)
+static bool intel_cursor_size_ok(struct drm_i915_private *i915,
+				 int width, int height)
 {
-	const struct drm_mode_config *config =
-		&plane_state->uapi.plane->dev->mode_config;
-	int width = drm_rect_width(&plane_state->uapi.dst);
-	int height = drm_rect_height(&plane_state->uapi.dst);
+	const struct drm_mode_config *config = &i915->drm.mode_config;
 
 	return width > 0 && width <= config->cursor_width &&
 		height > 0 && height <= config->cursor_height;
@@ -198,23 +196,25 @@ static u32 i845_cursor_ctl(const struct intel_crtc_state *crtc_state,
 		CURSOR_STRIDE(plane_state->view.color_plane[0].mapping_stride);
 }
 
-static bool i845_cursor_size_ok(const struct intel_plane_state *plane_state)
+static bool i845_cursor_size_ok(struct drm_plane *plane,
+				int width, int height)
 {
-	int width = drm_rect_width(&plane_state->uapi.dst);
+	struct drm_i915_private *i915 = to_i915(plane->dev);
 
 	/*
 	 * 845g/865g are only limited by the width of their cursors,
 	 * the height is arbitrary up to the precision of the register.
 	 */
-	return intel_cursor_size_ok(plane_state) && IS_ALIGNED(width, 64);
+	return intel_cursor_size_ok(i915, width, height) && IS_ALIGNED(width, 64);
 }
 
 static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state)
 {
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
-	int ret;
+	int ret, width, height;
 
 	ret = intel_check_cursor(crtc_state, plane_state);
 	if (ret)
@@ -224,12 +224,14 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 	if (!fb)
 		return 0;
 
+	width = drm_rect_width(&plane_state->uapi.dst);
+	height = drm_rect_height(&plane_state->uapi.dst);
+
 	/* Check for which cursor types we support */
-	if (!i845_cursor_size_ok(plane_state)) {
+	if (!i845_cursor_size_ok(&plane->base, width, height)) {
 		drm_dbg_kms(&i915->drm,
 			    "Cursor dimension %dx%d not supported\n",
-			    drm_rect_width(&plane_state->uapi.dst),
-			    drm_rect_height(&plane_state->uapi.dst));
+			    width, height);
 		return -EINVAL;
 	}
 
@@ -386,14 +388,13 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 	return cntl;
 }
 
-static bool i9xx_cursor_size_ok(const struct intel_plane_state *plane_state)
+static bool i9xx_cursor_size_ok(struct drm_plane *plane,
+				int width, int height,
+				unsigned int rotation)
 {
-	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
-	int width = drm_rect_width(&plane_state->uapi.dst);
-	int height = drm_rect_height(&plane_state->uapi.dst);
+	struct drm_i915_private *i915 = to_i915(plane->dev);
 
-	if (!intel_cursor_size_ok(plane_state))
+	if (!intel_cursor_size_ok(i915, width, height))
 		return false;
 
 	/* Cursor width is limited to a few power-of-two sizes */
@@ -412,8 +413,7 @@ static bool i9xx_cursor_size_ok(const struct intel_plane_state *plane_state)
 	 * cursor is not rotated. Everything else requires square
 	 * cursors.
 	 */
-	if (HAS_CUR_FBC(dev_priv) &&
-	    plane_state->hw.rotation & DRM_MODE_ROTATE_0) {
+	if (HAS_CUR_FBC(i915) && rotation & DRM_MODE_ROTATE_0) {
 		if (height < 8 || height > width)
 			return false;
 	} else {
@@ -431,7 +431,7 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
-	int ret;
+	int ret, width, height;
 
 	ret = intel_check_cursor(crtc_state, plane_state);
 	if (ret)
@@ -441,24 +441,25 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 	if (!fb)
 		return 0;
 
+	width = drm_rect_width(&plane_state->uapi.dst);
+	height = drm_rect_height(&plane_state->uapi.dst);
+
 	/* Check for which cursor types we support */
-	if (!i9xx_cursor_size_ok(plane_state)) {
-		drm_dbg(&dev_priv->drm,
-			"Cursor dimension %dx%d not supported\n",
-			drm_rect_width(&plane_state->uapi.dst),
-			drm_rect_height(&plane_state->uapi.dst));
+	if (!i9xx_cursor_size_ok(&plane->base, width, height,
+				 plane_state->hw.rotation)) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "Cursor dimension %dx%d not supported\n",
+			    width, height);
 		return -EINVAL;
 	}
 
 	drm_WARN_ON(&dev_priv->drm, plane_state->uapi.visible &&
 		    plane_state->view.color_plane[0].mapping_stride != fb->pitches[0]);
 
-	if (fb->pitches[0] !=
-	    drm_rect_width(&plane_state->uapi.dst) * fb->format->cpp[0]) {
+	if (fb->pitches[0] != width * fb->format->cpp[0]) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Invalid cursor stride (%u) (cursor width %d)\n",
-			    fb->pitches[0],
-			    drm_rect_width(&plane_state->uapi.dst));
+			    fb->pitches[0], width);
 		return -EINVAL;
 	}
 
-- 
2.39.2

