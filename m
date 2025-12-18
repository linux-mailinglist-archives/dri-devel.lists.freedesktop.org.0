Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D8CCC37E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0510E994;
	Thu, 18 Dec 2025 14:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kzm712JN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904010E3A8;
 Thu, 18 Dec 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766067338; x=1797603338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aslAvdVFIqU5Ykh2SN7femuU1MX2ahu4DPXMcQgi4hc=;
 b=Kzm712JNQAe1mF3sUYUSPL+OVlO+f0+/SwvdxdddwjTn8MRHqIKkiJuw
 +IZZujaGs2j/lJIHcYUUitx4NNoI0IiGXZsQvjCRkbyQsjxn8eOZUls1K
 WCaFHtoEW0CZQ981BF7supPqAmZn6t7fjEJ66llEukDFiFjedO/R3hR5x
 1lwRArNXTs+XBHuYAzDW+UPqTAW1ketNwfH148jz5RIlB9Sri80pyJQFB
 kW/rVhIpxg4x4yRlqsrQvpCyd9duRE0FLAwvPeYA+2Zx4O1hXycWrXPia
 e//5uE08JYxQ+k/sdSqf3H3pUKRYTOh345tJjs1U7xpmMNixsQ/C4Fu1B Q==;
X-CSE-ConnectionGUID: NfikZo33RW+kElu+tRVyAw==
X-CSE-MsgGUID: pz1KvLN7Sleq4mcH7GXQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71880373"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="71880373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:15:38 -0800
X-CSE-ConnectionGUID: vgD7mB2dRpy0zFtoOgNWQQ==
X-CSE-MsgGUID: FpF83SKiQVit/QAYe6l1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="222000312"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:15:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
Subject: [PATCH] drm/atomic: convert drm_atomic_get_{old,
 new}_colorop_state() into proper functions
Date: Thu, 18 Dec 2025 16:15:27 +0200
Message-ID: <20251218141527.405328-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There is no real reason to include drm_colorop.h from drm_atomic.h, as
drm_atomic_get_{old,new}_colorop_state() have no real reason to be
static inline.

Convert the static inlines to proper functions, and drop the include to
reduce the include dependencies and improve data hiding.

Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
Cc: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Including the massive Cc list because I don't want to keep doing this
afterwards. This stuff needs to be blocked and fixed during review. Just
stop including headers from headers. It's a PITA to clean up.
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 ++
 drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 include/drm/drm_atomic.h                      | 39 ++++---------------
 5 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1dcc79b35225..20a76d81d532 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -23,6 +23,9 @@
  * Authors: AMD
  *
  */
+
+#include <drm/drm_colorop.h>
+
 #include "amdgpu.h"
 #include "amdgpu_mode.h"
 #include "amdgpu_dm.h"
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6d3ea8056b60..52738b80ddbe 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -641,6 +641,38 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_colorop_state);
 
+/**
+ * drm_atomic_get_old_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the old colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+struct drm_colorop_state *
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+				 struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].old_state;
+}
+EXPORT_SYMBOL(drm_atomic_get_old_colorop_state);
+
+/**
+ * drm_atomic_get_new_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the new colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+struct drm_colorop_state *
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+				 struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].new_state;
+}
+EXPORT_SYMBOL(drm_atomic_get_new_colorop_state);
+
 static bool
 plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 		     const struct drm_plane_state *new_plane_state)
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 10adac9397cf..5840e9cc6f66 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -34,6 +34,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_colorop.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6ff53cd58052..eb2e3f1e83c9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -34,6 +34,7 @@
 #include <drm/display/drm_dp_tunnel.h>
 #include <drm/display/drm_dsc.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_colorop.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 74ce26fa8838..178f8f62c80f 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -30,7 +30,6 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_util.h>
-#include <drm/drm_colorop.h>
 
 /**
  * struct drm_crtc_commit - track modeset commits on a CRTC
@@ -712,6 +711,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 struct drm_colorop_state *
 drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 			     struct drm_colorop *colorop);
+
+struct drm_colorop_state *
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+				 struct drm_colorop *colorop);
+struct drm_colorop_state *
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+				 struct drm_colorop *colorop);
+
 struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
@@ -808,36 +815,6 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
-/**
- * drm_atomic_get_old_colorop_state - get colorop state, if it exists
- * @state: global atomic state object
- * @colorop: colorop to grab
- *
- * This function returns the old colorop state for the given colorop, or
- * NULL if the colorop is not part of the global atomic state.
- */
-static inline struct drm_colorop_state *
-drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
-				 struct drm_colorop *colorop)
-{
-	return state->colorops[drm_colorop_index(colorop)].old_state;
-}
-
-/**
- * drm_atomic_get_new_colorop_state - get colorop state, if it exists
- * @state: global atomic state object
- * @colorop: colorop to grab
- *
- * This function returns the new colorop state for the given colorop, or
- * NULL if the colorop is not part of the global atomic state.
- */
-static inline struct drm_colorop_state *
-drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
-				 struct drm_colorop *colorop)
-{
-	return state->colorops[drm_colorop_index(colorop)].new_state;
-}
-
 /**
  * drm_atomic_get_old_connector_state - get connector state, if it exists
  * @state: global atomic state object
-- 
2.47.3

