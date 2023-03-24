Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF3F6C864F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54B410EC8A;
	Fri, 24 Mar 2023 19:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BB210EC7C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:56:13 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-536af432ee5so53453147b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679687772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNBzGrrnfOy7Ma7KWOfRQrczV4+Fiavf1Bk9Kyfj4K8=;
 b=FODC2BywMkr5smKFOkEXdMUoruRpq6+PUIFkRFh9IZBohwu3VhrhkHLfzLgANPbfLs
 IMWi9buXKS+HusFhTHPsep7YCj/g3c+RGI7qmsspmPk//wvpacleDtlh6BTAAFcyygxf
 Qi0cNW6Mixu47ACwCa27TSVQVyvY8CSC3EqoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679687772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNBzGrrnfOy7Ma7KWOfRQrczV4+Fiavf1Bk9Kyfj4K8=;
 b=ML6y5Rf1gacxMv2qdvpL0U3fn+97LIuU/trOv3hPwgw6mm6m8r6mUFg7F2WqyGdccW
 IFpu4spULemjbmajHcgceHkpCiyibsgnNoAvAcC4kwK4SUATabitQ5wD//c3HRP4HwM7
 wJukQBIhfK49acUtOayTe3yGND6Sn1diQLSBYxoEE3W/hwImPyn7awyJ+eMu7zPnMxnH
 8a0KFiWnfmMmnJAwchCH9c+CI0L/2HJUR4+E7JH4AJ6VEW5B6CGUyFL5aMlJJ9IObeRw
 6vKM7ggZANK93hxxvy5Pxz3IcHgmV3QYWSZ/UQZp2dc4nkSNgMDAp/XPTGgs/2EJMhC6
 Kyiw==
X-Gm-Message-State: AAQBX9fFz9TeCK5nVT11smNVN1vc/ZVXnL1nX8vFY2MpMUPdiOJSIBPi
 85zA/6tV8YNQVX3EXE7A3+idNQ==
X-Google-Smtp-Source: AKy350b8goqDw4/BO9gU9LYPoUWI9KbIadOBc28PxhkejSwCjqKYhINN5sMiLprDmG1V2D0g3k1aeg==
X-Received: by 2002:a0d:fd07:0:b0:544:5816:b93 with SMTP id
 n7-20020a0dfd07000000b0054458160b93mr3539307ywf.10.1679687772669; 
 Fri, 24 Mar 2023 12:56:12 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 p67-20020a819846000000b00545a7720441sm462568ywg.45.2023.03.24.12.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:56:12 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v7 02/10] drm/hdcp: Avoid changing crtc state in hdcp atomic
 check
Date: Fri, 24 Mar 2023 15:55:46 -0400
Message-Id: <20230324195555.3921170-3-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Instead of forcing a modeset in the hdcp atomic check, rename to
drm_hdcp_has_changed and return true if the content protection value
is changing and let the driver decide whether a modeset is required or not.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
-Rebase: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
Changes in v7:
-Renamed the function from drm_hdcp_atomic_check to drm_hdcp_has_changed
(Dmitry Baryshkov)

 drivers/gpu/drm/display/drm_hdcp_helper.c   | 39 ++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_atomic.c |  6 ++--
 include/drm/display/drm_hdcp_helper.h       |  2 +-
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index 7ca390b3ea106..34baf2b97cd87 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -422,18 +422,21 @@ void drm_hdcp_update_content_protection(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_hdcp_update_content_protection);
 
 /**
- * drm_hdcp_atomic_check - Helper for drivers to call during connector->atomic_check
+ * drm_hdcp_has_changed - Helper for drivers to call during connector->atomic_check
  *
  * @state: pointer to the atomic state being checked
  * @connector: drm_connector on which content protection state needs an update
  *
  * This function can be used by display drivers to perform an atomic check on the
- * hdcp state elements. If hdcp state has changed, this function will set
- * mode_changed on the crtc driving the connector so it can update its hardware
- * to match the hdcp state.
+ * hdcp state elements. If hdcp state has changed in a manner which requires the
+ * driver to enable or disable content protection, this function will return
+ * true.
+ *
+ * Returns:
+ * true if the driver must enable/disable hdcp, false otherwise
  */
-void drm_hdcp_atomic_check(struct drm_connector *connector,
-			   struct drm_atomic_state *state)
+bool drm_hdcp_has_changed(struct drm_connector *connector,
+			  struct drm_atomic_state *state)
 {
 	struct drm_connector_state *new_conn_state, *old_conn_state;
 	struct drm_crtc_state *new_crtc_state;
@@ -450,19 +453,31 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 		 * If the connector is being disabled with CP enabled, mark it
 		 * desired so it's re-enabled when the connector is brought back
 		 */
-		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
 			new_conn_state->content_protection =
 				DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return;
+			return true;
+		}
+		return false;
 	}
 
 	new_crtc_state =
 		drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
-	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
+	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
 		new_conn_state->content_protection =
 			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Coming back from UNDESIRED state, CRTC change or re-enablement requires
+	 * the driver to try CP enable.
+	 */
+	if (new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	    new_conn_state->crtc != old_conn_state->crtc)
+		return true;
 
 	/*
 	 * Nothing to do if content type is unchanged and one of:
@@ -477,9 +492,9 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
 		if (old_conn_state->hdcp_content_type ==
 		    new_conn_state->hdcp_content_type)
-			return;
+			return false;
 	}
 
-	new_crtc_state->mode_changed = true;
+	return true;
 }
-EXPORT_SYMBOL(drm_hdcp_atomic_check);
+EXPORT_SYMBOL(drm_hdcp_has_changed);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 934ca9dcecc54..bce4aba752974 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -123,8 +123,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	drm_hdcp_atomic_check(conn, state);
-
 	if (!new_state->crtc)
 		return 0;
 
@@ -140,8 +138,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
-	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
+	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state) ||
+	    drm_hdcp_has_changed(conn, state))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
index dd02b2e72a502..703421fcdf96c 100644
--- a/include/drm/display/drm_hdcp_helper.h
+++ b/include/drm/display/drm_hdcp_helper.h
@@ -19,7 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count)
 int drm_connector_attach_content_protection_property(struct drm_connector *connector,
 						     bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
-void drm_hdcp_atomic_check(struct drm_connector *connector,
+bool drm_hdcp_has_changed(struct drm_connector *connector,
 			   struct drm_atomic_state *state);
 
 #endif
-- 
2.40.0.348.gf938b09366-goog

