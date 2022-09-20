Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF95BE7CA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315910E542;
	Tue, 20 Sep 2022 13:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2762810E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2D981F895;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hQCvtIRDtyIgNW+YdK4tHt/YeLfRWaXD1rM3xsToxA=;
 b=aYSBHOacaBSy6r8HPpvRk2K8Z25+iNN+UvsOYeq9owTAxpW6Eq30iOMYCjljjZiHTyPksW
 Dwwit09sirqtfc0ADVruv2Am4mT51a6g6CPKRsIN0FkwA06Cvr8zpYi/7HXtCRGnmjW1c0
 +fBWHTxZidlzB3DOygMqGDqKZCtqYas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hQCvtIRDtyIgNW+YdK4tHt/YeLfRWaXD1rM3xsToxA=;
 b=LzHHqYcnVtiPDAG2PWJQrsyhGsAWITeLzMOasJakOWTzPMVql3KgskUAyJKCJ1QdeOwjMK
 Dmhhm+DKrkwhwnDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8716F1346B;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kFonIIXGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 2/5] drm/damage-helper: Decouple partial plane updates from
 damage clipping
Date: Tue, 20 Sep 2022 15:56:16 +0200
Message-Id: <20220920135619.9209-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920135619.9209-1-tzimmermann@suse.de>
References: <20220920135619.9209-1-tzimmermann@suse.de>
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

Introduce a distinct flag fb_damage_partial_update in plane state to
signal the option for a partial plane update. Replaces the semantics
of having no damaged areas to trigger a full update. Decoupling the
existence of damage clipping from partial plane updates will allow to
sometimes avoid plane updates at all.

By default the new flag is cleared, which triggers a full update. We
also keep doing a full update on modesetting operations or if the
framebuffer has been moved within the plane. Installing damage clipping
areas on a plane state sets the new flag and triggers a partial update
of the given areas.

Userspace that does not support damage clipping continues to work as
before.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_damage_helper.c       | 68 ++++++++++++++++-------
 include/drm/drm_plane.h                   |  9 +++
 3 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bf31b9d92094..85b13c221bd8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -338,6 +338,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
+	state->fb_damage_partial_update = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 4b1f26ef119f..16f0d5a97ee3 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -55,30 +55,48 @@ static void convert_clip_rect_to_rect(const struct drm_clip_rect *src,
  * @state: The driver state object.
  * @new_plane_state: Plane state for which to verify damage.
  *
- * This helper function makes sure that damage from plane state is discarded
- * for full modeset. If there are more reasons a driver would want to do a full
- * plane update rather than processing individual damage regions, then those
- * cases should be taken care of here.
+ * This helper function makes sure that damage from plane state is set up
+ * for full plane updates if necessary. This happens for full modesets on the
+ * plane's CRTC, and for pageflips without damage. If there are more reasons
+ * a driver would want to do a full plane update rather than processing
+ * individual damage regions, then those cases should be taken care of here.
  *
- * Note that &drm_plane_state.fb_damage_clips == NULL in plane state means that
- * full plane update should happen. It also ensure helper iterator will return
- * &drm_plane_state.src as damage.
+ * Note that &drm_plane_state.fb_damage_partial_update == false in plane state
+ * means that a full plane update should happen. It also ensures the helper
+ * iterator will return &drm_plane_state.src as damage.
  */
 void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 					  struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	bool partial_update = false;
 
-	if (new_plane_state->crtc) {
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	if (new_crtc) {
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
 
 		if (WARN_ON(!new_crtc_state))
-			return;
+			goto out;
 
-		if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
-			drm_property_blob_put(new_plane_state->fb_damage_clips);
-			new_plane_state->fb_damage_clips = NULL;
-		}
+		/*
+		 * The plane's CRTC does a modeset; always do full update.
+		 */
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
+			goto out;
+	}
+
+	/*
+	 * Damage clips are a good indicator for partial updates.
+	 */
+	if (new_plane_state->fb_damage_clips)
+		partial_update = true;
+
+out:
+	new_plane_state->fb_damage_partial_update = partial_update;
+
+	if (!new_plane_state->fb_damage_partial_update) {
+		drm_property_blob_put(new_plane_state->fb_damage_clips);
+		new_plane_state->fb_damage_clips = NULL;
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_plane_damage);
@@ -224,13 +242,24 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 				   const struct drm_plane_state *state)
 {
 	struct drm_rect src;
+	bool partial_update;
+
 	memset(iter, 0, sizeof(*iter));
 
 	if (!state || !state->crtc || !state->fb || !state->visible)
 		return;
 
-	iter->clips = (struct drm_rect *)drm_plane_get_damage_clips(state);
-	iter->num_clips = drm_plane_get_damage_clips_count(state);
+	partial_update = state->fb_damage_partial_update;
+
+	/*
+	 * Only allow a partial update if the framebuffer did not move
+	 * within the plane. Otherwise do a full update. We have to test
+	 * this here, instead of drm_atomic_helper_check_plane_damage(),
+	 * as the plane's atomic_check helper could meanwhile have changed
+	 * the source coordinates.
+	 */
+	if (partial_update)
+		partial_update = drm_rect_equals(&state->src, &old_state->src);
 
 	/* Round down for x1/y1 and round up for x2/y2 to catch all pixels */
 	src = drm_plane_state_src(state);
@@ -240,9 +269,10 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
 	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
 
-	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
-		iter->clips = NULL;
-		iter->num_clips = 0;
+	if (partial_update) {
+		iter->clips = (struct drm_rect *)drm_plane_get_damage_clips(state);
+		iter->num_clips = drm_plane_get_damage_clips_count(state);
+	} else {
 		iter->full_update = true;
 	}
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 89ea54652e87..3ba91349d799 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -190,6 +190,15 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *fb_damage_clips;
 
+	/**
+	 * @fb_damage_partial_update:
+	 *
+	 * Marks the plane for a partial update. The value of this field
+	 * depends on the supplied atomic state and the operation that
+	 * initiated the update.
+	 */
+	bool fb_damage_partial_update;
+
 	/**
 	 * @src:
 	 *
-- 
2.37.3

