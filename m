Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCCF40CE24
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0844F6EA33;
	Wed, 15 Sep 2021 20:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BC06EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:38:46 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id w78so5009834qkb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L2n2v2WT0jKdzQoBIBQPTMah26sbTTiefgydTVaSEP4=;
 b=d+6OI8hD0xcc0Lcl7aP9MmZ0NNUzERtcj7iAdDMQqeOKFKV+VetnxuodZJdnx40Zok
 O1rCApVW6k7bnGkuCuWr/CDrcpOHT7a/3bYGAGE+TPLQnhAcPMBss5OcIvOLe5b0gPzW
 sSIbKhSc+2liBUqNu0qncYbwh/qU4rqWI4/5/kO4t2fsARMBMrwbVWtwYRtUiaakPrSH
 uN0hNH3HtW+aSy2MgkjOBtMiNWV/29Uh5jndcCVjZzHpvzNGIQy+YMBbIxlQbfSwrrGJ
 MhqifMnbC01UddKQ2cuCUjkUejM6mJW1XPI8khuuUMU86vh5DdyFmXwgPKlut4o1Uoio
 2Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L2n2v2WT0jKdzQoBIBQPTMah26sbTTiefgydTVaSEP4=;
 b=CeM3U2KOf5w12PPBTYj+nCazrJJ8yqaMYVqEH1nkJf+BSdgKjOgYmsrPMv7WhfcyOI
 8v+PtHdrAz0el3Xob8cW7oEVvdAQJQmZfM71eTS2Vge/BkHHaJ5Enaz/lWIYBW9+A5l2
 TtQNYo2tfq9/jx1/Tk7Ex113DoRh8DqCZhZAifttSjw+QvW3QSsgnrkTUT7WSitaFnCD
 hrYOX/OxMNWskzaFFnhnb7CL9oV863jsUTBHAn3LqFe8PicdlhPL8HVy3c/LR/HA5qIV
 Diu9f9pjUg6Qgw5YXeQcrtWKlpHKA9R0+QuDc9Tyv5gZIskcIIxgYWVxCTHVh0ZWZezS
 bJEA==
X-Gm-Message-State: AOAM5319JSoUH5f4u6W+6DRFdWZqE8jLrPxKm35etyHMh/adAsXORzkZ
 U7FuiYjB6hUoQTr7J5w52XZxluc5oeS0dw==
X-Google-Smtp-Source: ABdhPJxLKpjVrzXpGOgkT1ElU6tJqB+eCIPZ0ZSGZCgexJxFuLA/0uMBs/DAW6S6XqsuLI1SWgXKiQ==
X-Received: by 2002:a37:a554:: with SMTP id o81mr1848431qke.231.1631738325415; 
 Wed, 15 Sep 2021 13:38:45 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id g12sm670948qtq.92.2021.09.15.13.38.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:38:45 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 01/13] drm/hdcp: Add drm_hdcp_atomic_check()
Date: Wed, 15 Sep 2021 16:38:20 -0400
Message-Id: <20210915203834.1439-2-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
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

From: Sean Paul <seanpaul@chromium.org>

This patch moves the hdcp atomic check from i915 to drm_hdcp so other
drivers can use it. No functional changes, just cleaned up some of the
code when moving it over.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/drm_hdcp.c                  | 71 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 --------------
 drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
 include/drm/drm_hdcp.h                      |  3 +
 5 files changed, 75 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index ca9b8f697202..522326b03e66 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -13,13 +13,14 @@
 #include <linux/slab.h>
 #include <linux/firmware.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_hdcp.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_print.h>
 #include <drm/drm_device.h>
 #include <drm/drm_property.h>
 #include <drm/drm_mode_object.h>
-#include <drm/drm_connector.h>
 
 #include "drm_internal.h"
 
@@ -421,3 +422,71 @@ void drm_hdcp_update_content_protection(struct drm_connector *connector,
 				 dev->mode_config.content_protection_property);
 }
 EXPORT_SYMBOL(drm_hdcp_update_content_protection);
+
+/**
+ * drm_hdcp_atomic_check - Helper for drivers to call during connector->atomic_check
+ *
+ * @state: pointer to the atomic state being checked
+ * @connector: drm_connector on which content protection state needs an update
+ *
+ * This function can be used by display drivers to perform an atomic check on the
+ * hdcp state elements. If hdcp state has changed, this function will set
+ * mode_changed on the crtc driving the connector so it can update its hardware
+ * to match the hdcp state.
+ */
+void drm_hdcp_atomic_check(struct drm_connector *connector,
+			   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *new_conn_state, *old_conn_state;
+	struct drm_crtc_state *new_crtc_state;
+	u64 old_hdcp, new_hdcp;
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
+	old_hdcp = old_conn_state->content_protection;
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
+	new_hdcp = new_conn_state->content_protection;
+
+	if (!new_conn_state->crtc) {
+		/*
+		 * If the connector is being disabled with CP enabled, mark it
+		 * desired so it's re-enabled when the connector is brought back
+		 */
+		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+			new_conn_state->content_protection =
+				DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return;
+	}
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state,
+						       new_conn_state->crtc);
+	/*
+	* Fix the HDCP uapi content protection state in case of modeset.
+	* FIXME: As per HDCP content protection property uapi doc, an uevent()
+	* need to be sent if there is transition from ENABLED->DESIRED.
+	*/
+	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
+	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
+	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+
+	/*
+	 * Nothing to do if content type is unchanged and one of:
+	 *  - state didn't change
+	 *  - HDCP was activated since the last commit
+	 *  - attempting to set to desired while already enabled
+	 */
+	if (old_hdcp == new_hdcp ||
+	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
+	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
+	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
+		if (old_conn_state->hdcp_content_type ==
+				new_conn_state->hdcp_content_type)
+			return;
+	}
+
+	new_crtc_state->mode_changed = true;
+}
+EXPORT_SYMBOL(drm_hdcp_atomic_check);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b4e7ac51aa31..1e306e8427ec 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -32,13 +32,13 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_hdcp.h>
 #include <drm/drm_plane_helper.h>
 
 #include "intel_atomic.h"
 #include "intel_cdclk.h"
 #include "intel_display_types.h"
 #include "intel_global_state.h"
-#include "intel_hdcp.h"
 #include "intel_psr.h"
 #include "skl_universal_plane.h"
 
@@ -122,7 +122,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	intel_hdcp_atomic_check(conn, old_state, new_state);
+	drm_hdcp_atomic_check(conn, state);
 
 	if (!new_state->crtc)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 9b9fd9d13043..feebafead046 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2501,53 +2501,6 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	mutex_unlock(&hdcp->mutex);
 }
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
-			     struct drm_connector_state *old_state,
-			     struct drm_connector_state *new_state)
-{
-	u64 old_cp = old_state->content_protection;
-	u64 new_cp = new_state->content_protection;
-	struct drm_crtc_state *crtc_state;
-
-	if (!new_state->crtc) {
-		/*
-		 * If the connector is being disabled with CP enabled, mark it
-		 * desired so it's re-enabled when the connector is brought back
-		 */
-		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
-			new_state->content_protection =
-				DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return;
-	}
-
-	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
-						   new_state->crtc);
-	/*
-	 * Fix the HDCP uapi content protection state in case of modeset.
-	 * FIXME: As per HDCP content protection property uapi doc, an uevent()
-	 * need to be sent if there is transition from ENABLED->DESIRED.
-	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
-	    (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
-	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
-		new_state->content_protection =
-			DRM_MODE_CONTENT_PROTECTION_DESIRED;
-
-	/*
-	 * Nothing to do if the state didn't change, or HDCP was activated since
-	 * the last commit. And also no change in hdcp content type.
-	 */
-	if (old_cp == new_cp ||
-	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
-	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
-		if (old_state->hdcp_content_type ==
-				new_state->hdcp_content_type)
-			return;
-	}
-
-	crtc_state->mode_changed = true;
-}
-
 /* Handles the CP_IRQ raised from the DP HDCP sink */
 void intel_hdcp_handle_cp_irq(struct intel_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 8f53b0c7fe5c..7c5fd84a7b65 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -22,9 +22,6 @@ struct intel_digital_port;
 enum port;
 enum transcoder;
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
-			     struct drm_connector_state *old_state,
-			     struct drm_connector_state *new_state);
 int intel_hdcp_init(struct intel_connector *connector,
 		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *hdcp_shim);
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index 0b1111e3228e..d49977a042e1 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -291,6 +291,7 @@ struct hdcp_srm_header {
 	u8 srm_gen_no;
 } __packed;
 
+struct drm_atomic_state;
 struct drm_device;
 struct drm_connector;
 
@@ -300,6 +301,8 @@ int drm_connector_attach_content_protection_property(
 		struct drm_connector *connector, bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector,
 					u64 val);
+void drm_hdcp_atomic_check(struct drm_connector *connector,
+			   struct drm_atomic_state *state);
 
 /* Content Type classification for HDCP2.2 vs others */
 #define DRM_MODE_HDCP_CONTENT_TYPE0		0
-- 
Sean Paul, Software Engineer, Google / Chromium OS

