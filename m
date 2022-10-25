Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DB60C9CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78E10E31B;
	Tue, 25 Oct 2022 10:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6110E318
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 10:17:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 489E62203C;
 Tue, 25 Oct 2022 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666693061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApJlR9ZUU7e+/0aJnwD0DxiVTnccSc1E8T9hj/78pJE=;
 b=oExGnmCuIMRuTiMdn/V5CBF0FFthVYSOu51VJjdBuW3cYwfc0OevyDyP0wAWiYD1UIcO1Z
 lS/GP72NU/4tbWUUmHvsDM+xiUCdcCW0cWZSghbBwi+gA9znYFPY3NIGZCCzlGvC1utyh+
 vh0v/KXxQhYAiNTlNIcf4vi0sqOQXFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666693061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApJlR9ZUU7e+/0aJnwD0DxiVTnccSc1E8T9hj/78pJE=;
 b=bbZxs/RkfEIyXecOsmKOEvK35ZqIfQGfHXwvq++IBviZK4vOkL8YTuT7xTBDtVEPntkzDA
 /tHzzGnV2t4UHFCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E97913A64;
 Tue, 25 Oct 2022 10:17:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gA12BsW3V2PkVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 10:17:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com
Subject: [PATCH v2 2/2] drm/gem: Implement shadow-plane {begin,
 end}_fb_access with vmap
Date: Tue, 25 Oct 2022 12:17:37 +0200
Message-Id: <20221025101737.8874-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221025101737.8874-1-tzimmermann@suse.de>
References: <20221025101737.8874-1-tzimmermann@suse.de>
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

Move the vmap code for shadow-plane helpers from prepare_fb to
begin_fb_access helpers. Vunmap is now performed at the end of
the current pageflip, instead of the end of the following pageflip.

Reduces the duration of the mapping from while the framebuffer is
being displayed to just the atomic commit. This is safe as outside
of the pageflip, nothing should access the mapped buffer memory.
Unmapping the framebuffer BO memory early allows reduces address-space
consumption and possibly allows for evicting the memory pages.

The change is effectively a rename of prepare_fb and cleanup_fb
implementations, plus updates to the shadow-plane init macro. As
there's no longer a prepare_fb helper for shadow planes, atomic
helpers will call drm_gem_plane_helper_prepare_fb() automatically.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 47 +++++++++++--------------
 include/drm/drm_gem_atomic_helper.h     | 20 +++++------
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 1de0a08afd86e..e42800718f515 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -360,48 +360,43 @@ void drm_gem_reset_shadow_plane(struct drm_plane *plane)
 EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
 
 /**
- * drm_gem_prepare_shadow_fb - prepares shadow framebuffers
+ * drm_gem_begin_shadow_fb_access - prepares shadow framebuffers for CPU access
  * @plane: the plane
  * @plane_state: the plane state of type struct drm_shadow_plane_state
  *
- * This function implements struct &drm_plane_helper_funcs.prepare_fb. It
+ * This function implements struct &drm_plane_helper_funcs.begin_fb_access. It
  * maps all buffer objects of the plane's framebuffer into kernel address
- * space and stores them in &struct drm_shadow_plane_state.map. The
- * framebuffer will be synchronized as part of the atomic commit.
+ * space and stores them in struct &drm_shadow_plane_state.map. The first data
+ * bytes are available in struct &drm_shadow_plane_state.data.
  *
- * See drm_gem_cleanup_shadow_fb() for cleanup.
+ * See drm_gem_end_shadow_fb_access() for cleanup.
  *
  * Returns:
  * 0 on success, or a negative errno code otherwise.
  */
-int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	int ret;
 
 	if (!fb)
 		return 0;
 
-	ret = drm_gem_plane_helper_prepare_fb(plane, plane_state);
-	if (ret)
-		return ret;
-
 	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
 }
-EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
+EXPORT_SYMBOL(drm_gem_begin_shadow_fb_access);
 
 /**
- * drm_gem_cleanup_shadow_fb - releases shadow framebuffers
+ * drm_gem_end_shadow_fb_access - releases shadow framebuffers from CPU access
  * @plane: the plane
  * @plane_state: the plane state of type struct drm_shadow_plane_state
  *
- * This function implements struct &drm_plane_helper_funcs.cleanup_fb.
- * This function unmaps all buffer objects of the plane's framebuffer.
+ * This function implements struct &drm_plane_helper_funcs.end_fb_access. It
+ * undoes all effects of drm_gem_begin_shadow_fb_access() in reverse order.
  *
- * See drm_gem_prepare_shadow_fb() for more information.
+ * See drm_gem_begin_shadow_fb_access() for more information.
  */
-void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+void drm_gem_end_shadow_fb_access(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
@@ -411,7 +406,7 @@ void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *
 
 	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
 }
-EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
+EXPORT_SYMBOL(drm_gem_end_shadow_fb_access);
 
 /**
  * drm_gem_simple_kms_begin_shadow_fb_access - prepares shadow framebuffers for CPU access
@@ -426,12 +421,12 @@ EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
  * Returns:
  * 0 on success, or a negative errno code otherwise.
  */
-int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
-					 struct drm_plane_state *plane_state)
+int drm_gem_simple_kms_begin_shadow_fb_access(struct drm_simple_display_pipe *pipe,
+					      struct drm_plane_state *plane_state)
 {
-	return drm_gem_prepare_shadow_fb(&pipe->plane, plane_state);
+	return drm_gem_begin_shadow_fb_access(&pipe->plane, plane_state);
 }
-EXPORT_SYMBOL(drm_gem_simple_kms_prepare_shadow_fb);
+EXPORT_SYMBOL(drm_gem_simple_kms_begin_shadow_fb_access);
 
 /**
  * drm_gem_simple_kms_end_shadow_fb_access - releases shadow framebuffers from CPU access
@@ -444,12 +439,12 @@ EXPORT_SYMBOL(drm_gem_simple_kms_prepare_shadow_fb);
  *
  * See drm_gem_simple_kms_begin_shadow_fb_access().
  */
-void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
-					  struct drm_plane_state *plane_state)
+void drm_gem_simple_kms_end_shadow_fb_access(struct drm_simple_display_pipe *pipe,
+					     struct drm_plane_state *plane_state)
 {
-	drm_gem_cleanup_shadow_fb(&pipe->plane, plane_state);
+	drm_gem_end_shadow_fb_access(&pipe->plane, plane_state);
 }
-EXPORT_SYMBOL(drm_gem_simple_kms_cleanup_shadow_fb);
+EXPORT_SYMBOL(drm_gem_simple_kms_end_shadow_fb_access);
 
 /**
  * drm_gem_simple_kms_reset_shadow_plane - resets a shadow-buffered plane
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 6e3319e9001a7..6970ccb787e23 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -103,8 +103,8 @@ void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
 	.atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state, \
 	.atomic_destroy_state = drm_gem_destroy_shadow_plane_state
 
-int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
-void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
+int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_state *plane_state);
+void drm_gem_end_shadow_fb_access(struct drm_plane *plane, struct drm_plane_state *plane_state);
 
 /**
  * DRM_GEM_SHADOW_PLANE_HELPER_FUNCS -
@@ -115,13 +115,13 @@ void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *
  * functions.
  */
 #define DRM_GEM_SHADOW_PLANE_HELPER_FUNCS \
-	.prepare_fb = drm_gem_prepare_shadow_fb, \
-	.cleanup_fb = drm_gem_cleanup_shadow_fb
+	.begin_fb_access = drm_gem_begin_shadow_fb_access, \
+	.end_fb_access = drm_gem_end_shadow_fb_access
 
-int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
-					 struct drm_plane_state *plane_state);
-void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
-					  struct drm_plane_state *plane_state);
+int drm_gem_simple_kms_begin_shadow_fb_access(struct drm_simple_display_pipe *pipe,
+					      struct drm_plane_state *plane_state);
+void drm_gem_simple_kms_end_shadow_fb_access(struct drm_simple_display_pipe *pipe,
+					     struct drm_plane_state *plane_state);
 void drm_gem_simple_kms_reset_shadow_plane(struct drm_simple_display_pipe *pipe);
 struct drm_plane_state *
 drm_gem_simple_kms_duplicate_shadow_plane_state(struct drm_simple_display_pipe *pipe);
@@ -137,8 +137,8 @@ void drm_gem_simple_kms_destroy_shadow_plane_state(struct drm_simple_display_pip
  * functions.
  */
 #define DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS \
-	.prepare_fb = drm_gem_simple_kms_prepare_shadow_fb, \
-	.cleanup_fb = drm_gem_simple_kms_cleanup_shadow_fb, \
+	.begin_fb_access = drm_gem_simple_kms_begin_shadow_fb_access, \
+	.end_fb_access = drm_gem_simple_kms_end_shadow_fb_access, \
 	.reset_plane = drm_gem_simple_kms_reset_shadow_plane, \
 	.duplicate_plane_state = drm_gem_simple_kms_duplicate_shadow_plane_state, \
 	.destroy_plane_state = drm_gem_simple_kms_destroy_shadow_plane_state
-- 
2.38.0

