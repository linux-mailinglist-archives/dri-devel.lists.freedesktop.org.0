Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BD690D32
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9B10E22D;
	Thu,  9 Feb 2023 15:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B25C10EAFA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D280537619;
 Thu,  9 Feb 2023 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSRNNYym5vWgJBhF+ORaf3vbIYdsa0JtA3sWDO07CSw=;
 b=MnjRkvIuMl7PTCIHG7/B11uILy7pYNcpgDJ0wCJJjxUDJtr88YWeQg/1Ts8GhXvvUXGOvL
 Rl1IW2qn7uq5MVfzQNZ9gBsSKNnRtJ9jbfAVuAuvsGII8A81ZvSqWS7YsAaDfBo9nRVrZ1
 Ww8wVdvJQ/qtl1SU5NJxoa7/wb5Fj2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSRNNYym5vWgJBhF+ORaf3vbIYdsa0JtA3sWDO07CSw=;
 b=7sclNOFjCXWhiX0yUrqPgurFJ4M7Bu3NxuhMlITIJI5MvfLwhQrlwEKndYdFEICQydgrVK
 XCvBFww8xEmGioAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5F9613915;
 Thu,  9 Feb 2023 15:41:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oGC+JxUU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 1/6] drm/atomic-helper: Add atomic_enable plane-helper callback
Date: Thu,  9 Feb 2023 16:41:02 +0100
Message-Id: <20230209154107.30680-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209154107.30680-1-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add atomic_enable to struct drm_plane_helper_funcs. It enables a
plane independently from updating the plane's content. As such, it is
the inverse of the atomic_disable plane helper. Useful for hardware
where plane enable state is independent from plane content.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 20 ++++++++++++----
 include/drm/drm_atomic_helper.h          | 26 +++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 29 +++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..8606876f7233 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2702,6 +2702,11 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 			funcs->atomic_disable(plane, old_state);
 		} else if (new_plane_state->crtc || disabling) {
 			funcs->atomic_update(plane, old_state);
+
+			if (!disabling && funcs->atomic_enable) {
+				if (drm_atomic_plane_enabling(old_plane_state, new_plane_state))
+					funcs->atomic_enable(plane, old_state);
+			}
 		}
 	}
 
@@ -2762,6 +2767,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 		struct drm_plane_state *new_plane_state =
 			drm_atomic_get_new_plane_state(old_state, plane);
 		const struct drm_plane_helper_funcs *plane_funcs;
+		bool disabling;
 
 		plane_funcs = plane->helper_private;
 
@@ -2771,12 +2777,18 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 		WARN_ON(new_plane_state->crtc &&
 			new_plane_state->crtc != crtc);
 
-		if (drm_atomic_plane_disabling(old_plane_state, new_plane_state) &&
-		    plane_funcs->atomic_disable)
+		disabling = drm_atomic_plane_disabling(old_plane_state, new_plane_state);
+
+		if (disabling && plane_funcs->atomic_disable) {
 			plane_funcs->atomic_disable(plane, old_state);
-		else if (new_plane_state->crtc ||
-			 drm_atomic_plane_disabling(old_plane_state, new_plane_state))
+		} else if (new_plane_state->crtc || disabling) {
 			plane_funcs->atomic_update(plane, old_state);
+
+			if (!disabling && plane_funcs->atomic_enable) {
+				if (drm_atomic_plane_enabling(old_plane_state, new_plane_state))
+					plane_funcs->atomic_enable(plane, old_state);
+			}
+		}
 	}
 
 	if (crtc_funcs && crtc_funcs->atomic_flush)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 33f982cd1a27..536a0b0091c3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -209,6 +209,32 @@ int drm_atomic_helper_page_flip_target(
 			      __drm_atomic_get_current_plane_state((crtc_state)->state, \
 								   plane)))
 
+/**
+ * drm_atomic_plane_enabling - check whether a plane is being enabled
+ * @old_plane_state: old atomic plane state
+ * @new_plane_state: new atomic plane state
+ *
+ * Checks the atomic state of a plane to determine whether it's being enabled
+ * or not. This also WARNs if it detects an invalid state (both CRTC and FB
+ * need to either both be NULL or both be non-NULL).
+ *
+ * RETURNS:
+ * True if the plane is being enabled, false otherwise.
+ */
+static inline bool drm_atomic_plane_enabling(struct drm_plane_state *old_plane_state,
+					     struct drm_plane_state *new_plane_state)
+{
+	/*
+	 * When enabling a plane, CRTC and FB should always be set together.
+	 * Anything else should be considered a bug in the atomic core, so we
+	 * gently warn about it.
+	 */
+	WARN_ON((!new_plane_state->crtc && new_plane_state->fb) ||
+		(new_plane_state->crtc && !new_plane_state->fb));
+
+	return !old_plane_state->crtc && new_plane_state->crtc;
+}
+
 /**
  * drm_atomic_plane_disabling - check whether a plane is being disabled
  * @old_plane_state: old atomic plane state
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 206f495bbf06..965faf082a6d 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1331,6 +1331,32 @@ struct drm_plane_helper_funcs {
 	 */
 	void (*atomic_update)(struct drm_plane *plane,
 			      struct drm_atomic_state *state);
+
+	/**
+	 * @atomic_enable:
+	 *
+	 * Drivers should use this function to unconditionally enable a plane.
+	 * This hook is called in-between the &drm_crtc_helper_funcs.atomic_begin
+	 * and drm_crtc_helper_funcs.atomic_flush callbacks. It is called after
+	 * @atomic_update, which will be called for all enabled planes. Drivers
+	 * that use @atomic_enable should set up a plane in @atomic_update and
+	 * afterwards enable the plane in @atomic_enable. If a plane needs to be
+	 * enabled before installing the scanout buffer, drivers can still do
+	 * so in @atomic_update.
+	 *
+	 * Note that the power state of the display pipe when this function is
+	 * called depends upon the exact helpers and calling sequence the driver
+	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
+	 * the tradeoffs and variants of plane commit helpers.
+	 *
+	 * This callback is used by the atomic modeset helpers, but it is
+	 * optional. If implemented, @atomic_enable should be the inverse of
+	 * @atomic_disable. Drivers that don't want to use either can still
+	 * implement the complete plane update in @atomic_update.
+	 */
+	void (*atomic_enable)(struct drm_plane *plane,
+			      struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_disable:
 	 *
@@ -1351,7 +1377,8 @@ struct drm_plane_helper_funcs {
 	 * the tradeoffs and variants of plane commit helpers.
 	 *
 	 * This callback is used by the atomic modeset helpers and by the
-	 * transitional plane helpers, but it is optional.
+	 * transitional plane helpers, but it is optional. It's intended to
+	 * reverse the effects of @atomic_enable.
 	 */
 	void (*atomic_disable)(struct drm_plane *plane,
 			       struct drm_atomic_state *state);
-- 
2.39.1

