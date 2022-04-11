Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88424FC5FD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5979F10E7AA;
	Mon, 11 Apr 2022 20:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC56C10E239
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:47:47 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id a11so17578883qtb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YuCvuq0V5kuiESu3pW3vKm+aEO7OAX2wsl5sySVDF/o=;
 b=BYSb8rvjGEcY3s5kQ7c03K0UkNblpk6UvMqUXrMOBANPPR131+JsAYh2bo6wWiFUtO
 ZaPnuh7f+c39AwsTR5pLt0Vcm2ymxib7UDTRP5TyThoHSFNGxoA60oB9Sg7j0zW7t5xk
 /Q6mEiRSAzWuKID8HLHqh7wdlGVIFsDfWGZRC6EeJPmdz3Yid4Pi++sRGwY2757ejvaU
 3k0Nc3z69goPnKlK+J0ei7EA4Nv1SD7u19T9QUScrRffzRKRaIsI9zNZor7CskJM+YT7
 O1MmHHPnyoZbAjJvTcIf2m9fskF+BBS9bjWuerIaMq/MROfns9FywiaFQFWaZfv5J4gt
 kJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YuCvuq0V5kuiESu3pW3vKm+aEO7OAX2wsl5sySVDF/o=;
 b=yMR2XMa3phQ/QzoASAaSUsMaTzJbsGIrvTlhkpHKmCGC0EHiR832i067ZXokxMT7/5
 sflHTzM/1JI8h+81idPXrpZCqcsWcJemfEsRPGNPlwg8R8XKEVeicX2IvLN9ckFPBm7y
 AlrlEkENA7ePGcvksyNWGlK9Z/aV6MqhBd92FvrBsHI2a+e5Fkw3hKEmwhEaq9mtagq3
 B61s14JhDvoAX942zrohmB1Gpm9trXKOfCArRd6F7KHcPeUYngucmggz0wve/uLX/6rT
 sIoGm2MBypSfNjIUM5as0SIUDoqnQj0mkVkCn8u0pE9hqnsMiZSe6ooAPXOitUktX592
 RviQ==
X-Gm-Message-State: AOAM532sabQruAF17PKucscUyWjH7ycGpvFcNbDx3SFUJKZ9BeGi9x/C
 3ay5qrFzqqNdUXCEJVSCMRwcEzmIAkQnuA==
X-Google-Smtp-Source: ABdhPJwUI7JezRmYdD1UpS7FJaoG8kYARH8UXDaBP6goC2oGZcg+SoEFVLXytMqsli1yQgm/tfr8YQ==
X-Received: by 2002:ac8:7f4a:0:b0:2eb:9704:ea6d with SMTP id
 g10-20020ac87f4a000000b002eb9704ea6dmr977195qtk.336.1649710066796; 
 Mon, 11 Apr 2022 13:47:46 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 2-20020a05620a070200b0069c231ab4a9sm2369929qkc.16.2022.04.11.13.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:47:46 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: [PATCH v5 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Date: Mon, 11 Apr 2022 20:47:30 +0000
Message-Id: <20220411204741.1074308-2-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
References: <20220411204741.1074308-1-sean@poorly.run>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch moves the hdcp atomic check from i915 to drm_hdcp so other
drivers can use it. No functional changes, just cleaned up some of the
code when moving it over.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-2-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
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
index 40da7910f845..b301a4d1017e 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -32,6 +32,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_hdcp.h>
 #include <drm/drm_plane_helper.h>
 
 #include "i915_drv.h"
@@ -40,7 +41,6 @@
 #include "intel_cdclk.h"
 #include "intel_display_types.h"
 #include "intel_global_state.h"
-#include "intel_hdcp.h"
 #include "intel_psr.h"
 #include "skl_universal_plane.h"
 
@@ -124,7 +124,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	intel_hdcp_atomic_check(conn, old_state, new_state);
+	drm_hdcp_atomic_check(conn, state);
 
 	if (!new_state->crtc)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 4de4c174a987..861c550b5bd6 100644
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

