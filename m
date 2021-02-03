Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246C30DAA7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5395C6EAB0;
	Wed,  3 Feb 2021 13:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE476EAA3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:10:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32B04AFD2;
 Wed,  3 Feb 2021 13:10:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 1/6] drm/simple-kms: Add plane-state helpers
Date: Wed,  3 Feb 2021 14:10:41 +0100
Message-Id: <20210203131046.22371-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203131046.22371-1-tzimmermann@suse.de>
References: <20210203131046.22371-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just like regular plane-state helpers, drivers can use these new
callbacks to create and destroy private plane state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 40 +++++++++++++++++++++++--
 include/drm/drm_simple_kms_helper.h     | 28 +++++++++++++++++
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 6ce8f5cd1eb5..0c5bb0f98fa0 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -253,13 +253,47 @@ static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.atomic_update = drm_simple_kms_plane_atomic_update,
 };
 
+static void drm_simple_kms_plane_reset(struct drm_plane *plane)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->reset_plane)
+		return drm_atomic_helper_plane_reset(plane);
+
+	return pipe->funcs->reset_plane(pipe);
+}
+
+static struct drm_plane_state *drm_simple_kms_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->duplicate_plane_state)
+		return drm_atomic_helper_plane_duplicate_state(plane);
+
+	return pipe->funcs->duplicate_plane_state(pipe, plane->state);
+}
+
+static void drm_simple_kms_plane_destroy_state(struct drm_plane *plane,
+					       struct drm_plane_state *state)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->destroy_plane_state)
+		drm_atomic_helper_plane_destroy_state(plane, state);
+	else
+		pipe->funcs->destroy_plane_state(pipe, state);
+}
+
 static const struct drm_plane_funcs drm_simple_kms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.reset			= drm_simple_kms_plane_reset,
+	.atomic_duplicate_state	= drm_simple_kms_plane_duplicate_state,
+	.atomic_destroy_state	= drm_simple_kms_plane_destroy_state,
 	.format_mod_supported   = drm_simple_kms_format_mod_supported,
 };
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index e6dbf3161c2f..0c1a2e07caf2 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -149,6 +149,34 @@ struct drm_simple_display_pipe_funcs {
 	 * more details.
 	 */
 	void (*disable_vblank)(struct drm_simple_display_pipe *pipe);
+
+	/**
+	 * @reset_plane:
+	 *
+	 * Optional, called by &drm_plane_funcs.reset. Please read the
+	 * documentation for the &drm_plane_funcs.reset hook for more details.
+	 */
+	void (*reset_plane)(struct drm_simple_display_pipe *pipe);
+
+	/**
+	 * @duplicate_plane_state:
+	 *
+	 * Optional, called by &drm_plane_funcs.atomic_duplicate_state.  Please
+	 * read the documentation for the &drm_plane_funcs.atomic_duplicate_state
+	 * hook for more details.
+	 */
+	struct drm_plane_state * (*duplicate_plane_state)(struct drm_simple_display_pipe *pipe,
+							  struct drm_plane_state *plane_state);
+
+	/**
+	 * @destroy_plane_state:
+	 *
+	 * Optional, called by &drm_plane_funcs.atomic_destroy_state.  Please
+	 * read the documentation for the &drm_plane_funcs.atomic_destroy_state
+	 * hook for more details.
+	 */
+	void (*destroy_plane_state)(struct drm_simple_display_pipe *pipe,
+				    struct drm_plane_state *plane_state);
 };
 
 /**
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
