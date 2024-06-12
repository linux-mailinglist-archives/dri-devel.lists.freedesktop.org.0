Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB794905D17
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05410E913;
	Wed, 12 Jun 2024 20:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+xe6k0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62810E908;
 Wed, 12 Jun 2024 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225254; x=1749761254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lp+7qWDzZMQlSq9ickuun52JpQh7Q7p7d641d4Tp958=;
 b=P+xe6k0WvldCinmeAdjIeJpx/pnPmpvdjedzSyYGatg0QZHRZDXdruQX
 /XaAQ5LEoIeiDPF9BzsL7a3JDpvdKIjzuO8HnQSxdmehBXAExJDkspvc1
 rfNnIEDobJFIKDwBjHiw3CoWuOV3UGZCodEDes1Lg33dJ7rZKIj6QplEF
 eXRF6qv+NmkpmjceF7yT/k7iaPq1sbro9afTV5sXrUVwhXo0Yx9nBMk2l
 sZkgY6EPLRsRjKAmZl1kBOMnz2av8QzJ9TrL7nj5ScxVyEERCu4vUkd7e
 hyFXNXE14Eh+oyPIjeMX3DSiPkzBzbtOnh7n6UqUWOSAvivVo3tdd9y9S w==;
X-CSE-ConnectionGUID: E3LbhvPjRZaA4IYBhubK2w==
X-CSE-MsgGUID: Ge/dhxfKSyGzrAIruzaU0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976592"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:31 -0700
X-CSE-ConnectionGUID: +hbMZBZxQ82CpbmnbdxbhA==
X-CSE-MsgGUID: lc2OjtS1STe1+mN/jeZktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863957"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:28 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 5/9] drm/i915: Split cursor alignment to per-platform vfuncs
Date: Wed, 12 Jun 2024 23:47:08 +0300
Message-ID: <20240612204712.31404-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 40 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_fb.c     | 16 ---------
 drivers/gpu/drm/i915/display/intel_fb.h     |  3 --
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 5f8c23296b61..8e95ed0beeb9 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -194,6 +194,13 @@ i845_cursor_max_stride(struct intel_plane *plane,
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
@@ -344,6 +351,28 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
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
@@ -942,20 +971,27 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 
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
index 0abb80972885..b5d31ccf013a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -777,22 +777,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
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
2.44.2

