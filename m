Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC79B1100E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2D710E99C;
	Thu, 24 Jul 2025 16:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="PmG8DnNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9F710E99C;
 Thu, 24 Jul 2025 16:58:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1753375955; x=1753980755; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=e7rOemkP0tEjy35RpgWmvOXIhrhtHHsVMmIIN4G9Pyg=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
 b=PmG8DnNSrPCVFtPmQgKGvS/SuA4rPgOUiaC9K40wCbKlvQpoYlLcjgamSf8UJW0M2tbX7aVE0nLU3aeDLkVNZOaS9TFmFmQ9T2KD79stK1TayWZDEkFPXuq4WN0BRjWU+hA/+0bLhb7ucemC7RYUz2X8z8oVkLaLG3PLYG5U5SeWILpWTrVW8ZF8Sas9u60gS3h6mKHjTuoO8Ewa90cJSLj/yOOxWNV73P5/Byyjn3F+Hf0bOtj29kFLslVhUmhnFyx4trJX2gXgif1bfVZQ3wcOLvIa/5Hha9KV5HxsM76VQkv1aE043V+AhREbfQbhHAneygDaVGrXwqkJNEE+Rw==
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202507241852340804; Thu, 24 Jul 2025 18:52:34 +0200
Received: from daenzer by kaveri with local (Exim 4.98.2)
 (envelope-from <michel@daenzer.net>) id 1uezBI-00000004zM5-2Zns;
 Thu, 24 Jul 2025 18:52:32 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Shankar@kaveri.local,
 Uma <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm: Add HW_DONE_DEADLINE immutable atomic CRTC property
Date: Thu, 24 Jul 2025 18:40:30 +0200
Message-ID: <20250724165220.1189129-4-michel@daenzer.net>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724165220.1189129-1-michel@daenzer.net>
References: <20250724165220.1189129-1-michel@daenzer.net>
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

From: Michel Dänzer <mdaenzer@redhat.com>

It lets user space know how long before start of scanout HW programming
of an atomic commit needs to finish.

This implements the default fallback deadline which corresponds to start
of vblank.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 15 +++++++++++++++
 drivers/gpu/drm/drm_crtc.c          | 30 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c   |  7 +++++++
 include/drm/drm_crtc.h              |  1 +
 include/drm/drm_mode_config.h       |  5 +++++
 5 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e55edc42a317..51213e9fba07 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2574,6 +2574,21 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 		/* backend must have consumed any event by now */
 		WARN_ON(new_crtc_state->event);
 		complete_all(&commit->hw_done);
+
+		if (new_crtc_state->active &&
+		    (!old_crtc_state->active ||
+		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
+			struct drm_display_mode *mode = &new_crtc_state->mode;
+			unsigned deadline_lines, deadline_us;
+
+			/* Reset HW done deadline to start of vblank */
+			deadline_lines = mode->crtc_vtotal - mode->crtc_vdisplay;
+			deadline_us = DIV_ROUND_UP(deadline_lines * mode->crtc_htotal * 1000u,
+						   mode->crtc_clock);
+			drm_crtc_set_hw_done_deadline_property(crtc, deadline_us);
+		} else if (old_crtc_state->active && !new_crtc_state->active) {
+			drm_crtc_set_hw_done_deadline_property(crtc, 0);
+		}
 	}
 
 	if (state->fake_commit) {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003d..3330fa30f295 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -229,6 +229,16 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
  * 		Driver's default scaling filter
  * 	Nearest Neighbor:
  * 		Nearest Neighbor scaling filter
+ * HW_DONE_DEADLINE:
+ * 	Immutable atomic property describing the deadline for programming an
+ * 	atomic commit to HW to finish, to guarantee that the commit takes
+ * 	effect for the next refresh cycle.
+ *
+ * 	With fixed refresh rate, the value is the number of microseconds before
+ * 	the end of vblank.
+ *
+ * 	With variable refresh rate (VRR), the value is the number of microseconds
+ * 	before the latest possible end of vblank.
  */
 
 __printf(6, 0)
@@ -303,6 +313,8 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 					   config->prop_out_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
+		drm_object_attach_property(&crtc->base,
+					   config->prop_hw_done_deadline, 0);
 	}
 
 	return 0;
@@ -940,6 +952,24 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
 
+/**
+ * drm_crtc_set_hw_done_deadline_property - sets the HW done deadline property for a CRTC
+ * @crtc: drm CRTC
+ * @capable: True if the connector is variable refresh rate capable
+ *
+ * If the actual deadline differs from start of vblank, the atomic driver can call this to
+ * update the deadline after a modeset.
+ */
+void drm_crtc_set_hw_done_deadline_property(struct drm_crtc *crtc, unsigned deadline)
+{
+	struct drm_device *dev = crtc->dev;
+
+	drm_object_property_set_value(&crtc->base,
+				      dev->mode_config.prop_hw_done_deadline,
+				      deadline);
+}
+EXPORT_SYMBOL(drm_crtc_set_hw_done_deadline_property);
+
 /**
  * drm_crtc_in_clone_mode - check if the given CRTC state is in clone mode
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index b4239fd04e9d..721896d291d3 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -339,6 +339,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_vrr_enabled = prop;
 
+	prop = drm_property_create_range(dev,
+					 DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_IMMUTABLE,
+					 "HW_DONE_DEADLINE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_hw_done_deadline = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"DEGAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2..c902040c0468 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1323,5 +1323,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+void drm_crtc_set_hw_done_deadline_property(struct drm_crtc *crtc, unsigned deadline);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
 #endif /* __DRM_CRTC_H__ */
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 9e524b51a001..11dce8be85a4 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -679,6 +679,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *prop_vrr_enabled;
 
+	/**
+	 * @prop_hw_done_deadline: Atomic CRTC HW_DONE_DEADLINE property.
+	 */
+	struct drm_property *prop_hw_done_deadline;
+
 	/**
 	 * @dvi_i_subconnector_property: Optional DVI-I property to
 	 * differentiate between analog or digital mode.
-- 
2.50.0

