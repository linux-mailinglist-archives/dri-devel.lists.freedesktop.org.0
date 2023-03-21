Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A826C346D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA3E10E230;
	Tue, 21 Mar 2023 14:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C901010E229;
 Tue, 21 Mar 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409499; x=1710945499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1i9juQG1wIe8gITmEKAWeS9272iLCNnj0vEBZaPxs98=;
 b=AckCa5QhR7O/BSZkKVBeGXbkc0cf3UIQyX1/h0NioX76IyC5dRHuPRsD
 RcFeen6PHqHwiPz98iYL+5o/PjaPe/3P16nRLRHs2ZAIZScjK8Jzi7Fey
 9O5E4fRjdsZLlHb3dy2px6ti55+z/RO6wQyElkloqgJpBIWFyKAhoIK6E
 z+CoVeeL96vd4uIL36tYxo1rR4iGHhv+IHuzQ/Z9apE5xu14SAxGNvxW5
 PAo0MhLZoHw396LP0nqk1FYwEwCn/oppgS2CE+PLwjwIAEYDpiHNAmB7e
 mk4PpTHZAkjpRAs+Rgcf3E9FQQPOqQjQ2K231PKd6xpa1NFD43bysySYi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403832830"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403832830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674851705"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674851705"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 21 Mar 2023 07:36:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Mar 2023 16:36:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v2 3/3] drm/i915: Add SIZE_HINTS property for cursors
Date: Tue, 21 Mar 2023 16:36:43 +0200
Message-Id: <20230321143643.26676-4-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Advertize more suitable cursor sizes via the new SIZE_HINTS
plane property.

Here are some examples on various platforms:
ivb+:
            31 SIZE_HINTS:
                    flags: immutable blob
                    blobs:

                    value:
                            4000080000010001ff6f0200
                    size_hints blob decoded:
                            min: 64x8
                            max: 256x256
                            bitmap[0]: 0b100110111111111111
                                    64  128  256
                               8     *    *    *
                              16     *    *    *
                              32     *    *    *
                              64     *    *    *
                             128          *    *
                             256               *
i945+:
            31 SIZE_HINTS:
                    flags: immutable blob
                    blobs:

                    value:
                            400040000001000111010000
                    size_hints blob decoded:
                            min: 64x64
                            max: 256x256
                            bitmap[0]: 0b100010001
                                    64  128  256
                              64     *
                             128          *
                             256               *
i865:
            31 SIZE_HINTS:
                    flags: immutable blob
                    blobs:

                    value:
                            400001000002ff03ffffffffff0f0000
                    size_hints blob decoded:
                            min: 64x1
                            max: 512x1023
                            bitmap[0]: 0b11111111111111111111111111111111
                            bitmap[1]: 0b111111111111
                                    64  128  256  512
                               1     *    *    *    *
                               2     *    *    *    *
                               4     *    *    *    *
                               8     *    *    *    *
                              16     *    *    *    *
                              32     *    *    *    *
                              64     *    *    *    *
                             128     *    *    *    *
                             256     *    *    *    *
                             512     *    *    *    *
                            1023     *    *    *    *

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 43 ++++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index edeeb5f9f795..449860342aea 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -388,9 +388,9 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 	return cntl;
 }
 
-static bool i9xx_cursor_size_ok(struct drm_plane *plane,
-				int width, int height,
-				unsigned int rotation)
+static bool _i9xx_cursor_size_ok(struct drm_plane *plane,
+				 int width, int height,
+				 unsigned int rotation)
 {
 	struct drm_i915_private *i915 = to_i915(plane->dev);
 
@@ -424,6 +424,12 @@ static bool i9xx_cursor_size_ok(struct drm_plane *plane,
 	return true;
 }
 
+static bool i9xx_cursor_size_ok(struct drm_plane *plane,
+				int width, int height)
+{
+	return _i9xx_cursor_size_ok(plane, width, height, DRM_MODE_ROTATE_0);
+}
+
 static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state)
 {
@@ -445,8 +451,8 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 	height = drm_rect_height(&plane_state->uapi.dst);
 
 	/* Check for which cursor types we support */
-	if (!i9xx_cursor_size_ok(&plane->base, width, height,
-				 plane_state->hw.rotation)) {
+	if (!_i9xx_cursor_size_ok(&plane->base, width, height,
+				  plane_state->hw.rotation)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Cursor dimension %dx%d not supported\n",
 			    width, height);
@@ -757,6 +763,31 @@ static const struct drm_plane_funcs intel_cursor_plane_funcs = {
 	.format_mod_supported = intel_cursor_format_mod_supported,
 };
 
+static void intel_cursor_add_size_hints_property(struct intel_plane *plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	const struct drm_mode_config *config = &i915->drm.mode_config;
+
+	if (IS_I845G(i915) || IS_I865G(i915))
+		drm_plane_add_size_hints_property(&plane->base,
+						  64, 1,
+						  config->cursor_width,
+						  config->cursor_height,
+						  i845_cursor_size_ok);
+	else if (HAS_CUR_FBC(i915))
+		drm_plane_add_size_hints_property(&plane->base,
+						  64, 8,
+						  config->cursor_width,
+						  config->cursor_height,
+						  i9xx_cursor_size_ok);
+	else
+		drm_plane_add_size_hints_property(&plane->base,
+						  64, 64,
+						  config->cursor_width,
+						  config->cursor_height,
+						  i9xx_cursor_size_ok);
+}
+
 struct intel_plane *
 intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe)
@@ -815,6 +846,8 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 						   DRM_MODE_ROTATE_0 |
 						   DRM_MODE_ROTATE_180);
 
+	intel_cursor_add_size_hints_property(cursor);
+
 	zpos = RUNTIME_INFO(dev_priv)->num_sprites[pipe] + 1;
 	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
 
-- 
2.39.2

