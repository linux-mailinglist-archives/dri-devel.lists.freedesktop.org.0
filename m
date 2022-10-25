Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D960C9C9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9E110E2F5;
	Tue, 25 Oct 2022 10:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758C810E316
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 10:17:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A10922030;
 Tue, 25 Oct 2022 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666693061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ5OpShyrdRIdVJsyOFMNwgE5F/dOya1srdAuMWL/II=;
 b=xacSLyP9NAdUvnbPnt0o7bzgTdPuTSLf+YPSvcr8aqCchpHXQaglW0EWPI+H1clXe2VGYQ
 86iEw7tl5aRe5pT/BoWGrZnpyGJeSkAdyQkBA718BEkOZBz8UoGlTXSMKbGUB1ZUAo4yHy
 ecJykXWJvIyuk7150mqNpM8Q9z7FUEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666693061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ5OpShyrdRIdVJsyOFMNwgE5F/dOya1srdAuMWL/II=;
 b=Q4AKjLSOlFueG9pIS5v1JMKHSqGWGqMIdujrYvMymMspHCq1vHw1rFR9jtZzAd/O15YaaY
 MsJOa0e0o8LkY9AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E48FD13A79;
 Tue, 25 Oct 2022 10:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SA/qNsS3V2PkVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 10:17:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com
Subject: [PATCH v2 1/2] drm/atomic-helper: Add {begin,
 end}_fb_access to plane helpers
Date: Tue, 25 Oct 2022 12:17:36 +0200
Message-Id: <20221025101737.8874-2-tzimmermann@suse.de>
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

Add {begin,end}_fb_access helpers to run at the beginning and end of
an atomic commit. The begin_fb_access helper aquires resources that
are necessary to perform the atomic commit. It it similar to prepare_fb,
except that the resources are to be released at the end of the commit.
Resources acquired by prepare_fb are held until after the next pageflip.

The end_fb_access helper performs the corresponding resource cleanup.
Atomic helpers call it with the new plane state. This is differnt from
cleanup_fb, which releases resources of the old plane state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 34 ++++++++++++++++++--
 drivers/gpu/drm/drm_gem_atomic_helper.c  | 19 ++++++-----
 drivers/gpu/drm/drm_simple_kms_helper.c  | 26 +++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 41 +++++++++++++++++++++++-
 include/drm/drm_simple_kms_helper.h      | 20 ++++++++++++
 5 files changed, 126 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 1a586b3c454b4..d579fd8f7cb83 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2536,7 +2536,7 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 		if (funcs->prepare_fb) {
 			ret = funcs->prepare_fb(plane, new_plane_state);
 			if (ret)
-				goto fail;
+				goto fail_prepare_fb;
 		} else {
 			WARN_ON_ONCE(funcs->cleanup_fb);
 
@@ -2545,13 +2545,34 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 
 			ret = drm_gem_plane_helper_prepare_fb(plane, new_plane_state);
 			if (ret)
-				goto fail;
+				goto fail_prepare_fb;
+		}
+	}
+
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->begin_fb_access) {
+			ret = funcs->begin_fb_access(plane, new_plane_state);
+			if (ret)
+				goto fail_begin_fb_access;
 		}
 	}
 
 	return 0;
 
-fail:
+fail_begin_fb_access:
+	for_each_new_plane_in_state(state, plane, new_plane_state, j) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (j >= i)
+			continue;
+
+		if (funcs->end_fb_access)
+			funcs->end_fb_access(plane, new_plane_state);
+	}
+	i = j; /* set i to upper limit to cleanup all planes */
+fail_prepare_fb:
 	for_each_new_plane_in_state(state, plane, new_plane_state, j) {
 		const struct drm_plane_helper_funcs *funcs;
 
@@ -2827,6 +2848,13 @@ void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	int i;
 
+	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->end_fb_access)
+			funcs->end_fb_access(plane, new_plane_state);
+	}
+
 	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
 		struct drm_plane_state *plane_state;
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index b6a0110eb64af..1de0a08afd86e 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -414,16 +414,14 @@ void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *
 EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
 
 /**
- * drm_gem_simple_kms_prepare_shadow_fb - prepares shadow framebuffers
+ * drm_gem_simple_kms_begin_shadow_fb_access - prepares shadow framebuffers for CPU access
  * @pipe: the simple display pipe
  * @plane_state: the plane state of type struct drm_shadow_plane_state
  *
- * This function implements struct drm_simple_display_funcs.prepare_fb. It
- * maps all buffer objects of the plane's framebuffer into kernel address
- * space and stores them in struct drm_shadow_plane_state.map. The
- * framebuffer will be synchronized as part of the atomic commit.
+ * This function implements struct drm_simple_display_funcs.begin_fb_access.
  *
- * See drm_gem_simple_kms_cleanup_shadow_fb() for cleanup.
+ * See drm_gem_begin_shadow_fb_access() for details and
+ * drm_gem_simple_kms_cleanup_shadow_fb() for cleanup.
  *
  * Returns:
  * 0 on success, or a negative errno code otherwise.
@@ -436,14 +434,15 @@ int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
 EXPORT_SYMBOL(drm_gem_simple_kms_prepare_shadow_fb);
 
 /**
- * drm_gem_simple_kms_cleanup_shadow_fb - releases shadow framebuffers
+ * drm_gem_simple_kms_end_shadow_fb_access - releases shadow framebuffers from CPU access
  * @pipe: the simple display pipe
  * @plane_state: the plane state of type struct drm_shadow_plane_state
  *
- * This function implements struct drm_simple_display_funcs.cleanup_fb.
- * This function unmaps all buffer objects of the plane's framebuffer.
+ * This function implements struct drm_simple_display_funcs.end_fb_access.
+ * It undoes all effects of drm_gem_simple_kms_begin_shadow_fb_access() in
+ * reverse order.
  *
- * See drm_gem_simple_kms_prepare_shadow_fb().
+ * See drm_gem_simple_kms_begin_shadow_fb_access().
  */
 void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
 					  struct drm_plane_state *plane_state)
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 31233c6ae3c42..3ef420ec4534a 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -285,6 +285,30 @@ static void drm_simple_kms_plane_cleanup_fb(struct drm_plane *plane,
 	pipe->funcs->cleanup_fb(pipe, state);
 }
 
+static int drm_simple_kms_plane_begin_fb_access(struct drm_plane *plane,
+						struct drm_plane_state *new_plane_state)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->begin_fb_access)
+		return 0;
+
+	return pipe->funcs->begin_fb_access(pipe, new_plane_state);
+}
+
+static void drm_simple_kms_plane_end_fb_access(struct drm_plane *plane,
+					       struct drm_plane_state *new_plane_state)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->end_fb_access)
+		return;
+
+	pipe->funcs->end_fb_access(pipe, new_plane_state);
+}
+
 static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
 						uint32_t format,
 						uint64_t modifier)
@@ -295,6 +319,8 @@ static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.prepare_fb = drm_simple_kms_plane_prepare_fb,
 	.cleanup_fb = drm_simple_kms_plane_cleanup_fb,
+	.begin_fb_access = drm_simple_kms_plane_begin_fb_access,
+	.end_fb_access = drm_simple_kms_plane_end_fb_access,
 	.atomic_check = drm_simple_kms_plane_atomic_check,
 	.atomic_update = drm_simple_kms_plane_atomic_update,
 };
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fafa70ac1337f..d9f2254a039aa 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1184,11 +1184,20 @@ struct drm_plane_helper_funcs {
 	 * can call drm_gem_plane_helper_prepare_fb() from their @prepare_fb
 	 * hook.
 	 *
+	 * The resources acquired in @prepare_fb persist after the end of
+	 * the atomic commit. Resources that can be release at the commit's end
+	 * should be acquired in @begin_fb_access and released in @end_fb_access.
+	 * For example, a GEM buffer's pin operation belongs into @prepare_fb to
+	 * keep the buffer pinned after the commit. But a vmap operation for
+	 * shadow-plane helpers belongs into @begin_fb_access, so that atomic
+	 * helpers remove the mapping at the end of the commit.
+	 *
 	 * The helpers will call @cleanup_fb with matching arguments for every
 	 * successful call to this hook.
 	 *
 	 * This callback is used by the atomic modeset helpers and by the
-	 * transitional plane helpers, but it is optional.
+	 * transitional plane helpers, but it is optional. See @begin_fb_access
+	 * for preparing per-commit resources.
 	 *
 	 * RETURNS:
 	 *
@@ -1211,6 +1220,36 @@ struct drm_plane_helper_funcs {
 	void (*cleanup_fb)(struct drm_plane *plane,
 			   struct drm_plane_state *old_state);
 
+	/**
+	 * @begin_fb_access:
+	 *
+	 * This hook prepares the plane for access during an atomic commit.
+	 * In contrast to @prepare_fb, resources acquired in @begin_fb_access,
+	 * are released at the end of the atomic commit in @end_fb_access.
+	 *
+	 * For example, with shadow-plane helpers, the GEM buffer's vmap
+	 * operation belongs into @begin_fb_access, so that the buffer's
+	 * memory will be unmapped at the end of the commit in @end_fb_access.
+	 * But a GEM buffer's pin operation belongs into @prepare_fb
+	 * to keep the buffer pinned after the commit.
+	 *
+	 * The callback is used by the atomic modeset helpers, but it is optional.
+	 * See @end_fb_cleanup for undoing the effects of @begin_fb_access and
+	 * @prepare_fb for acquiring resources until the next pageflip.
+	 *
+	 * Returns:
+	 * 0 on success, or a negative errno code otherwise.
+	 */
+	int (*begin_fb_access)(struct drm_plane *plane, struct drm_plane_state *new_plane_state);
+
+	/**
+	 * @end_fb_access:
+	 *
+	 * This hook cleans up resources allocated by @begin_fb_access. It it called
+	 * at the end of a commit for the new plane state.
+	 */
+	void (*end_fb_access)(struct drm_plane *plane, struct drm_plane_state *new_plane_state);
+
 	/**
 	 * @atomic_check:
 	 *
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 0b3647e614dd3..2298fe3af4cd7 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -135,6 +135,26 @@ struct drm_simple_display_pipe_funcs {
 	void (*cleanup_fb)(struct drm_simple_display_pipe *pipe,
 			   struct drm_plane_state *plane_state);
 
+	/**
+	 * @begin_fb_access:
+	 *
+	 * Optional, called by &drm_plane_helper_funcs.begin_fb_access. Please read
+	 * the documentation for the &drm_plane_helper_funcs.begin_fb_access hook for
+	 * more details.
+	 */
+	int (*begin_fb_access)(struct drm_simple_display_pipe *pipe,
+			       struct drm_plane_state *new_plane_state);
+
+	/**
+	 * @end_fb_access:
+	 *
+	 * Optional, called by &drm_plane_helper_funcs.end_fb_access. Please read
+	 * the documentation for the &drm_plane_helper_funcs.end_fb_access hook for
+	 * more details.
+	 */
+	void (*end_fb_access)(struct drm_simple_display_pipe *pipe,
+			      struct drm_plane_state *plane_state);
+
 	/**
 	 * @enable_vblank:
 	 *
-- 
2.38.0

