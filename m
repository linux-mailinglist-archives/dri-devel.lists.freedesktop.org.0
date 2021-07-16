Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F03CB166
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 06:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221D46E8FE;
	Fri, 16 Jul 2021 04:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770856E8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 04:12:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271783395"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271783395"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495788647"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:20 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/15] drm/i915/pxp: Add plane decryption support
Date: Thu, 15 Jul 2021 21:10:32 -0700
Message-Id: <20210716041034.382-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Huang Sean Z <sean.z.huang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Gaurav Kumar <kumar.gaurav@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anshuman Gupta <anshuman.gupta@intel.com>

Add support to enable/disable PLANE_SURF Decryption Request bit.
It requires only to enable plane decryption support when following
condition met.
1. PXP session is enabled.
2. Buffer object is protected.

v2:
- Used gen fb obj user_flags instead gem_object_metadata. [Krishna]

v3:
- intel_pxp_gem_object_status() API changes.

v4: use intel_pxp_is_active (Daniele)

v5: rebase and use the new protected object status checker (Daniele)

v6: used plane state for plane_decryption to handle async flip
    as suggested by Ville.

v7: check pxp session while plane decrypt state computation. [Ville]
    removed pointless code. [Ville]

v8 (Daniele): update PXP check

Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Huang Sean Z <sean.z.huang@intel.com>
Cc: Gaurav Kumar <kumar.gaurav@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c     |  4 ++++
 .../gpu/drm/i915/display/intel_display_types.h   |  3 +++
 .../gpu/drm/i915/display/skl_universal_plane.c   | 15 ++++++++++++---
 drivers/gpu/drm/i915/i915_reg.h                  |  1 +
 5 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 47234d898549..3f605a666ea8 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -41,6 +41,7 @@
 #include "intel_display_types.h"
 #include "intel_pm.h"
 #include "intel_sprite.h"
+#include "pxp/intel_pxp.h"
 
 static void intel_plane_state_reset(struct intel_plane_state *plane_state,
 				    struct intel_plane *plane)
@@ -383,6 +384,14 @@ intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id)
 	return NULL;
 }
 
+static int bo_has_valid_encryption(const struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
+	return i915_gem_object_has_valid_protection(obj) &&
+	       intel_pxp_is_active(&i915->gt.pxp);
+}
+
 int intel_plane_atomic_check(struct intel_atomic_state *state,
 			     struct intel_plane *plane)
 {
@@ -397,6 +406,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct drm_framebuffer *fb;
 
 	if (new_crtc_state && new_crtc_state->bigjoiner_slave) {
 		struct intel_plane *master_plane =
@@ -413,6 +423,12 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
 					  new_master_plane_state,
 					  crtc);
 
+	fb = new_plane_state->hw.fb;
+	if (fb)
+		new_plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
+	else
+		new_plane_state->decrypt = old_plane_state->decrypt;
+
 	new_plane_state->uapi.visible = false;
 	if (!new_crtc_state)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 65ddb6ca16e6..c10026bc01fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9815,6 +9815,10 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
 			drm_dbg_kms(&i915->drm, "Color range cannot be changed in async flip\n");
 			return -EINVAL;
 		}
+
+		/* plane decryption is allow to change only in synchronous flips */
+		if (old_plane_state->decrypt != new_plane_state->decrypt)
+			return -EINVAL;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d94f361b548b..beb271a5c8bc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -625,6 +625,9 @@ struct intel_plane_state {
 
 	struct intel_fb_view view;
 
+	/* Plane pxp decryption state */
+	bool decrypt;
+
 	/* plane control register */
 	u32 ctl;
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 628b678d9a71..454b699bd177 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -18,6 +18,7 @@
 #include "intel_sprite.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
+#include "pxp/intel_pxp.h"
 
 static const u32 skl_plane_formats[] = {
 	DRM_FORMAT_C8,
@@ -1024,7 +1025,7 @@ skl_program_plane(struct intel_plane *plane,
 	u8 alpha = plane_state->hw.alpha >> 8;
 	u32 plane_color_ctl = 0, aux_dist = 0;
 	unsigned long irqflags;
-	u32 keymsk, keymax;
+	u32 keymsk, keymax, plane_surf;
 	u32 plane_ctl = plane_state->ctl;
 
 	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
@@ -1113,8 +1114,16 @@ skl_program_plane(struct intel_plane *plane,
 	 * the control register just before the surface register.
 	 */
 	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
-	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
-			  intel_plane_ggtt_offset(plane_state) + surf_addr);
+	plane_surf = intel_plane_ggtt_offset(plane_state) + surf_addr;
+
+	/*
+	 * FIXME: pxp session invalidation can hit any time even at time of commit
+	 * or after the commit, display content will be garbage.
+	 */
+	if (plane_state->decrypt)
+		plane_surf |= PLANE_SURF_DECRYPT;
+
+	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), plane_surf);
 
 	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2c583f2d410d..5d89556f8b0c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7310,6 +7310,7 @@ enum {
 #define _PLANE_SURF_3(pipe)	_PIPE(pipe, _PLANE_SURF_3_A, _PLANE_SURF_3_B)
 #define PLANE_SURF(pipe, plane)	\
 	_MMIO_PLANE(plane, _PLANE_SURF_1(pipe), _PLANE_SURF_2(pipe))
+#define   PLANE_SURF_DECRYPT			REG_BIT(2)
 
 #define _PLANE_OFFSET_1_B			0x711a4
 #define _PLANE_OFFSET_2_B			0x712a4
-- 
2.32.0

