Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D966C85C4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6648F10EC54;
	Fri, 24 Mar 2023 19:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D448E10EC54
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:21:05 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id p203so3479949ybb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679685665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vTqxTXLPay23j0ePHLyR7drXIbXk2NLKq/09G6CL6w=;
 b=I5cmsujBVFn8vOJIgrFjqDA9Wksoqy6HQJOuKBimCoqtO6mKu49dabHsmj+C4UsHtJ
 Vwx8loPyp2yYX3KZozfcpM8p8UhXI4xMR00nAR0a9gNs80yvPIIfK7a+BvIpQ3rGqbBn
 crXPlaDBQuDx2DfXQKj9GI2UUBJH5XER0Nbdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679685665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vTqxTXLPay23j0ePHLyR7drXIbXk2NLKq/09G6CL6w=;
 b=0ZyUcsQlX/I7hF4oh9oZcVDxqiXUrzuqz61Ol0oRApGQeRWDzcQSHVijsu80KoqXMl
 RB7dQ17fqKKgpE9Td3zzf4z4WdSVBAHEiaouQk2JFCyAz/Fd1mZ8nxO0pyQLeBfWDRv3
 SDCrbgDztwec+jJfQuneAdwx3r2D0i3PmpkPGd81Xq8Vj7zKau/XvOi3eoxj+jE6fk6u
 /OgDaqjt+Xfcb24jZ0GtdKZEza6jXhfJNuwN31z5zgsFkrCeJQodE02XH6Ldb5orMS6G
 45+CRi+ljrkC5Qei1BQOPesuNkHHnQUbZtFt93GY34nE7ZE5OSJk4lnvxSyUehXuP63x
 /HfQ==
X-Gm-Message-State: AAQBX9cbD1v0SqpWZ8tbhqdjeqEZqp4brv9MW+h2rbLSOQJ2QUhXi9J0
 zxLvXltv/pR6qaKM2SvEUI7Duw==
X-Google-Smtp-Source: AKy350bQrTrTI8PbDpx3GhTH3KJ5wY09udmHAh9QTgGtBWFZZrIHc4Axs9uggyZb3+sznmpuM0iWRA==
X-Received: by 2002:a05:6902:1248:b0:b3e:5dfe:56d6 with SMTP id
 t8-20020a056902124800b00b3e5dfe56d6mr4135556ybu.20.1679685664928; 
 Fri, 24 Mar 2023 12:21:04 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 83-20020a811456000000b00545a081847esm570852ywu.14.2023.03.24.12.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:21:04 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v7 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Date: Fri, 24 Mar 2023 15:20:48 -0400
Message-Id: <20230324192058.3916571-2-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324192058.3916571-1-markyacoub@google.com>
References: <20230324192058.3916571-1-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Move the hdcp atomic check from i915 to drm_hdcp so other
drivers can use it. No functional changes, just cleaned up some of the
code when moving it over.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebase: move helper from drm_hdcp.c to drm_hdcp_helper.c
Changes in v7:
-Removed links to patch from commit msg (Dmitry Baryshkov)

 drivers/gpu/drm/display/drm_hdcp_helper.c   | 64 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 ---------------
 drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
 include/drm/display/drm_hdcp_helper.h       |  3 +
 5 files changed, 69 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index e78999c72bd77..7ca390b3ea106 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm_property.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_atomic.h>
 
 static inline void drm_hdcp_print_ksv(const u8 *ksv)
 {
@@ -419,3 +420,66 @@ void drm_hdcp_update_content_protection(struct drm_connector *connector,
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
+	new_crtc_state =
+		drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
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
+		    new_conn_state->hdcp_content_type)
+			return;
+	}
+
+	new_crtc_state->mode_changed = true;
+}
+EXPORT_SYMBOL(drm_hdcp_atomic_check);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 6621aa245caf4..934ca9dcecc54 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -32,6 +32,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -39,7 +40,6 @@
 #include "intel_cdclk.h"
 #include "intel_display_types.h"
 #include "intel_global_state.h"
-#include "intel_hdcp.h"
 #include "intel_psr.h"
 #include "skl_universal_plane.h"
 
@@ -123,7 +123,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	intel_hdcp_atomic_check(conn, old_state, new_state);
+	drm_hdcp_atomic_check(conn, state);
 
 	if (!new_state->crtc)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6406fd487ee52..396d2cef000aa 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2524,53 +2524,6 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
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
index 8f53b0c7fe5cf..7c5fd84a7b65a 100644
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
diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
index 8aaf87bf27351..dd02b2e72a502 100644
--- a/include/drm/display/drm_hdcp_helper.h
+++ b/include/drm/display/drm_hdcp_helper.h
@@ -11,6 +11,7 @@
 
 #include <drm/display/drm_hdcp.h>
 
+struct drm_atomic_state;
 struct drm_device;
 struct drm_connector;
 
@@ -18,5 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count)
 int drm_connector_attach_content_protection_property(struct drm_connector *connector,
 						     bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
+void drm_hdcp_atomic_check(struct drm_connector *connector,
+			   struct drm_atomic_state *state);
 
 #endif
-- 
2.40.0.348.gf938b09366-goog

