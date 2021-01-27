Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D888305AA3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5028D6E19B;
	Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8B6E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6778AD2B;
 Wed, 27 Jan 2021 12:03:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 09/12] drm/ast: Introduce dedicated cursor-plane state
Date: Wed, 27 Jan 2021 13:02:59 +0100
Message-Id: <20210127120302.13532-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127120302.13532-1-tzimmermann@suse.de>
References: <20210127120302.13532-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cursor-plane state struct ast_cursor_plane_state will store the
involved cursor source BO's mapping into kernel address space.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 40 ++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b9b9badcee00..199ad9f9c932 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -749,6 +749,16 @@ static void ast_set_cursor_enabled(struct ast_private *ast, bool enabled)
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, mask, vgacrcb);
 }
 
+struct ast_cursor_plane_state {
+	struct drm_plane_state base;
+};
+
+static inline struct ast_cursor_plane_state *
+to_ast_cursor_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct ast_cursor_plane_state, base);
+}
+
 static const uint32_t ast_cursor_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
@@ -913,13 +923,39 @@ static void ast_cursor_plane_destroy(struct drm_plane *plane)
 	drm_plane_cleanup(plane);
 }
 
+static struct drm_plane_state *
+ast_cursor_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct ast_cursor_plane_state *new_ast_state;
+	struct drm_device *dev = plane->dev;
+
+	if (drm_WARN_ON(dev, !plane->state))
+		return NULL;
+
+	new_ast_state = kmalloc(sizeof(*new_ast_state), GFP_KERNEL);
+	if (!new_ast_state)
+		return NULL;
+	__drm_atomic_helper_plane_duplicate_state(plane, &new_ast_state->base);
+
+	return &new_ast_state->base;
+}
+
+static void ast_cursor_plane_atomic_destroy_state(struct drm_plane *plane,
+						  struct drm_plane_state *state)
+{
+	struct ast_cursor_plane_state *ast_state = to_ast_cursor_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(&ast_state->base);
+	kfree(ast_state);
+}
+
 static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = ast_cursor_plane_destroy,
 	.reset = drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state = ast_cursor_plane_atomic_duplicate_state,
+	.atomic_destroy_state = ast_cursor_plane_atomic_destroy_state,
 };
 
 static int ast_cursor_plane_init(struct ast_private *ast)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
