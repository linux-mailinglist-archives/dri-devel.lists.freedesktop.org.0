Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB656631EB1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE02F10E29E;
	Mon, 21 Nov 2022 10:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6615710E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:45:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0EC4A220CD;
 Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669027537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuwrYevt8yXyo+dih2f9NT5RuHp9rTx2AU0s5Vp5PzE=;
 b=ej7LQBt2Fd5BuaAEr4je+8+XFHS+EswUxQ7tmhI6ny+BHON8YHEDCZ9snUmkrVS93IouTq
 Xpaj0mXjSyB8qHN4cXa6RtFfIFkZwcv716hDxdFEwQMzSi3YX3egdhEcp3s9CFao91VV5K
 O4Iuzfce1c/EE3L46HCNBGqMihdFuv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669027537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuwrYevt8yXyo+dih2f9NT5RuHp9rTx2AU0s5Vp5PzE=;
 b=qCjREsUUAZ5vxicNaULUZpPSJ1fk+Oe5g1dA/7TLr9gVciBGjQH2U4CWk8mSa1ol1CoyYb
 DjoRoZZkYv2H72Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0CED1376E;
 Mon, 21 Nov 2022 10:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qBAyLtBWe2NaGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 10:45:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH 6/8] drm/mipi-dbi: Support shadow-plane state
Date: Mon, 21 Nov 2022 11:45:30 +0100
Message-Id: <20221121104532.8301-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
References: <20221121104532.8301-1-tzimmermann@suse.de>
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

Introduce struct drm_mipi_dbi_plane_state that contains state related to
MIPI DBI. It currently only inherits from struct drm_shadow_plane_state,
so that MIPI DBI drivers can use the vmap'ed GEM-buffer memory. Implement
state helpers, the {begin,end}_fb_access helpers and wire up everything.

With this commit, MIPI DBI drivers can access the GEM object's memory
that is provided by shadow-plane state. The actual changes to drivers
are implemented separately. The new struct drm_mipi_dbi_plane was added
to avoid exposing struct drm_shadow_plane_state directly. The latter is
a detail of the actual implementation and having it in the MIPI driver
interface seems unintuitive.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 113 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/ili9225.c |   5 ++
 drivers/gpu/drm/tiny/st7586.c  |   5 ++
 include/drm/drm_mipi_dbi.h     |  30 ++++++++-
 4 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 40e59a3a6481e..3030344d25b48 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -436,6 +436,119 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_disable);
 
+/**
+ * mipi_dbi_pipe_begin_fb_access - MIPI DBI pipe begin-access helper
+ * @pipe: Display pipe
+ * @plane_state: Plane state
+ *
+ * This function implements struct &drm_simple_display_funcs.begin_fb_access.
+ *
+ * See drm_gem_begin_shadow_fb_access() for details and mipi_dbi_pipe_cleanup_fb()
+ * for cleanup.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
+				  struct drm_plane_state *plane_state)
+{
+	return drm_gem_begin_shadow_fb_access(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(mipi_dbi_pipe_begin_fb_access);
+
+/**
+ * mipi_dbi_pipe_end_fb_access - MIPI DBI pipe end-access helper
+ * @pipe: Display pipe
+ * @plane_state: Plane state
+ *
+ * This function implements struct &drm_simple_display_funcs.end_fb_access.
+ *
+ * See mipi_dbi_pipe_begin_fb_access().
+ */
+void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
+				 struct drm_plane_state *plane_state)
+{
+	drm_gem_end_shadow_fb_access(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(mipi_dbi_pipe_end_fb_access);
+
+/**
+ * mipi_dbi_pipe_reset_plane - MIPI DBI plane-reset helper
+ * @pipe: Display pipe
+ *
+ * This function implements struct &drm_simple_display_funcs.reset_plane
+ * for MIPI DBI planes.
+ */
+void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe)
+{
+	struct drm_plane *plane = &pipe->plane;
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state;
+
+	if (plane->state) {
+		mipi_dbi_pipe_destroy_plane_state(pipe, plane->state);
+		plane->state = NULL; /* must be set to NULL here */
+	}
+
+	mipi_dbi_plane_state = kzalloc(sizeof(*mipi_dbi_plane_state), GFP_KERNEL);
+	if (!mipi_dbi_plane_state)
+		return;
+	__drm_gem_reset_shadow_plane(plane, &mipi_dbi_plane_state->shadow_plane_state);
+}
+EXPORT_SYMBOL(mipi_dbi_pipe_reset_plane);
+
+/**
+ * mipi_dbi_pipe_duplicate_plane_state - duplicates MIPI DBI plane state
+ * @pipe: Display pipe
+ *
+ * This function implements struct &drm_simple_display_funcs.duplicate_plane_state
+ * for MIPI DBI planes.
+ *
+ * See drm_gem_duplicate_shadow_plane_state() for additional details.
+ *
+ * Returns:
+ * A pointer to a new plane state on success, or NULL otherwise.
+ */
+struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe)
+{
+	struct drm_plane *plane = &pipe->plane;
+	struct drm_plane_state *plane_state = plane->state;
+	struct mipi_dbi_plane_state *new_mipi_dbi_plane_state;
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+
+	if (!plane_state)
+		return NULL;
+
+	new_mipi_dbi_plane_state = kzalloc(sizeof(*new_mipi_dbi_plane_state), GFP_KERNEL);
+	if (!new_mipi_dbi_plane_state)
+		return NULL;
+	new_shadow_plane_state = &new_mipi_dbi_plane_state->shadow_plane_state;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
+}
+EXPORT_SYMBOL(mipi_dbi_pipe_duplicate_plane_state);
+
+/**
+ * mipi_dbi_pipe_destroy_plane_state - cleans up MIPI DBI plane state
+ * @pipe: Display pipe
+ * @plane_state: Plane state
+ *
+ * This function implements struct drm_simple_display_funcs.destroy_plane_state
+ * for MIPI DBI planes.
+ *
+ * See drm_gem_destroy_shadow_plane_state() for additional details.
+ */
+void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
+				       struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state = to_mipi_dbi_plane_state(plane_state);
+
+	__drm_gem_destroy_shadow_plane_state(&mipi_dbi_plane_state->shadow_plane_state);
+	kfree(mipi_dbi_plane_state);
+}
+EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
+
 static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 0115c4090f9e7..9e55ce28b4552 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -349,6 +349,11 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
 	.enable		= ili9225_pipe_enable,
 	.disable	= ili9225_pipe_disable,
 	.update		= ili9225_pipe_update,
+	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
+	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
+	.reset_plane	= mipi_dbi_pipe_reset_plane,
+	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
+	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
 };
 
 static const struct drm_display_mode ili9225_mode = {
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index e773b1f2fd5f3..76b13cefc904f 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -277,6 +277,11 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
 	.enable		= st7586_pipe_enable,
 	.disable	= st7586_pipe_disable,
 	.update		= st7586_pipe_update,
+	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
+	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
+	.reset_plane	= mipi_dbi_pipe_reset_plane,
+	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
+	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
 };
 
 static const struct drm_display_mode st7586_mode = {
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 36ac8495566b0..0213d4aae0326 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -10,6 +10,7 @@
 
 #include <linux/mutex.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 struct drm_rect;
@@ -18,6 +19,19 @@ struct iosys_map;
 struct regulator;
 struct spi_device;
 
+/**
+ * struct mipi_dbi_plane_state - MIPI DBI plane state
+ */
+struct mipi_dbi_plane_state {
+	struct drm_shadow_plane_state shadow_plane_state;
+};
+
+static inline struct mipi_dbi_plane_state *
+to_mipi_dbi_plane_state(struct drm_plane_state *plane_state)
+{
+	return container_of(plane_state, struct mipi_dbi_plane_state, shadow_plane_state.base);
+}
+
 /**
  * struct mipi_dbi - MIPI DBI interface
  */
@@ -164,6 +178,15 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 			   struct drm_crtc_state *crtc_state,
 			   struct drm_plane_state *plan_state);
 void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe);
+int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
+				  struct drm_plane_state *plane_state);
+void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
+				 struct drm_plane_state *plane_state);
+void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe);
+struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe);
+void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
+				       struct drm_plane_state *plane_state);
+
 void mipi_dbi_hw_reset(struct mipi_dbi *dbi);
 bool mipi_dbi_display_is_on(struct mipi_dbi *dbi);
 int mipi_dbi_poweron_reset(struct mipi_dbi_dev *dbidev);
@@ -223,6 +246,11 @@ static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
 	.mode_valid = mipi_dbi_pipe_mode_valid, \
 	.enable = (enable_), \
 	.disable = mipi_dbi_pipe_disable, \
-	.update = mipi_dbi_pipe_update
+	.update = mipi_dbi_pipe_update, \
+	.begin_fb_access = mipi_dbi_pipe_begin_fb_access, \
+	.end_fb_access = mipi_dbi_pipe_end_fb_access, \
+	.reset_plane = mipi_dbi_pipe_reset_plane, \
+	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state, \
+	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state
 
 #endif /* __LINUX_MIPI_DBI_H */
-- 
2.38.1

