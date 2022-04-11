Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A34FC602
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1DD10F5C1;
	Mon, 11 Apr 2022 20:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F5110F5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:47:51 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id kl29so14601041qvb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0aPvwEpyp43dTVSovcbJrmorvoWgrN9G9qC9ejG6ok=;
 b=MUft4flcgTTMx57ljwQBlWWrQyihYTTig6+ybfgIbFNv7xGz6tX5bHrA/xtCT4ntZi
 hUyCz5VdzrY6McGabx2KEnj/+Id9697JqmuO4Gobha9dSZWhtuHA07qLteNG8hk2MzL/
 hVFsRaMSpGCZEFflRIZq72DF+SVEN+CnXa2Jyc250ZOjFVcv/zEYwBlla2iXnZAkDWHY
 /92B/n0R2tucgo8ShZI1Tp4DGLaCe/NZG+7TQFvAMmmUYIj4/8CrjIEMPzom1AAQVii5
 YUzkdtTv2vK8Y+we+vqZXCzYPl61N3m65/L5GtICIbXNZVkhkpldCjaAShPxG5gVZcVI
 5MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0aPvwEpyp43dTVSovcbJrmorvoWgrN9G9qC9ejG6ok=;
 b=4/BZLAP3RlBh94AUBS5FRp6kuL1PWJH4IuYmtXqKXdDK4UkK0ZCkuXVZAev63XWE2h
 Us6rS8/8xiwBPzaUg+UE0BancyXgQpyzEKXnO0J7C0DCqg0NIG+YWYwi8LVs/xm1PDgM
 bsh4rF48cRxcxMn0gOkOy0luixhf4RwtdAxm2qH4KpLGkHLGNk4llKjkNWI43/hhb9Pk
 3BqzMFMwOL6rgRlqcL7BywxXlnyuDdRo5RXzQT9/VR8F6Qh2WUfjwm5/ET7LtSMWO3eK
 kdq5kxel+Wa9YHiBE/DOLX12XyprjW/DjG1icjolZDYQIYEvvXmAmdNozxxJDMnnI7cJ
 8Zcw==
X-Gm-Message-State: AOAM531P7l7KH9gPj1rfd5f6KJHtVxVsotTFPfA9c3XOHTPmg8DUe+Lv
 iBYvwx5Tg15ud3sNTPHqE8/Ufod/rJB09w==
X-Google-Smtp-Source: ABdhPJyvFj/mBNyf09G4qhRnvlMCxbGie5rAEd+OSHJm9CmeAJKQ5N4QNuEUOoLPjtzZ49s9gFnjAg==
X-Received: by 2002:a05:6214:625:b0:441:4934:3c8d with SMTP id
 a5-20020a056214062500b0044149343c8dmr982198qvx.40.1649710070679; 
 Mon, 11 Apr 2022 13:47:50 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac86b46000000b002e02be9c0easm24119440qts.69.2022.04.11.13.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:47:50 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: [PATCH v5 02/10] drm/hdcp: Avoid changing crtc state in hdcp atomic
 check
Date: Mon, 11 Apr 2022 20:47:31 +0000
Message-Id: <20220411204741.1074308-3-sean@poorly.run>
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

Instead of forcing a modeset in the hdcp atomic check, simply return
true if the content protection value is changing and let the driver
decide whether a modeset is required or not.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-3-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-3-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-3-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-3-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
---
 drivers/gpu/drm/drm_hdcp.c                  | 33 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_atomic.c |  5 ++--
 include/drm/drm_hdcp.h                      |  2 +-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 522326b03e66..dd8fa91c51d6 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -430,11 +430,14 @@ EXPORT_SYMBOL(drm_hdcp_update_content_protection);
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
+bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state)
 {
 	struct drm_connector_state *new_conn_state, *old_conn_state;
@@ -452,10 +455,12 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
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
 
 	new_crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -467,9 +472,19 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 	*/
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
+	 * Coming back from disable or changing CRTC with DESIRED state requires
+	 * that the driver try CP enable.
+	 */
+	if (new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	    new_conn_state->crtc != old_conn_state->crtc)
+		return true;
 
 	/*
 	 * Nothing to do if content type is unchanged and one of:
@@ -484,9 +499,9 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
 		if (old_conn_state->hdcp_content_type ==
 				new_conn_state->hdcp_content_type)
-			return;
+			return false;
 	}
 
-	new_crtc_state->mode_changed = true;
+	return true;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b301a4d1017e..6d24b3450399 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -124,8 +124,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	drm_hdcp_atomic_check(conn, state);
-
 	if (!new_state->crtc)
 		return 0;
 
@@ -142,7 +140,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
 	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
+	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state) ||
+	    drm_hdcp_atomic_check(conn, state))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index d49977a042e1..e6e3d16bc7d3 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -301,7 +301,7 @@ int drm_connector_attach_content_protection_property(
 		struct drm_connector *connector, bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector,
 					u64 val);
-void drm_hdcp_atomic_check(struct drm_connector *connector,
+bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state);
 
 /* Content Type classification for HDCP2.2 vs others */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

