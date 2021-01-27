Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754E305AA7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA826E323;
	Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D85A6E039
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4991AE56;
 Wed, 27 Jan 2021 12:03:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 03/12] drm/ast: Initialize planes in helper functions
Date: Wed, 27 Jan 2021 13:02:53 +0100
Message-Id: <20210127120302.13532-4-tzimmermann@suse.de>
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

This change will help with inlining cursor functions into modesetting
code. The primary plane's field used to be cleared with memset(). This
has been dropped as the memory is always allocated with kzalloc().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 66 +++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 758c69aa7232..f86773a869f0 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -621,6 +621,26 @@ static const struct drm_plane_funcs ast_primary_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
+static int ast_primary_plane_init(struct ast_private *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_plane *primary_plane = &ast->primary_plane;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0x01,
+				       &ast_primary_plane_funcs,
+				       ast_primary_plane_formats,
+				       ARRAY_SIZE(ast_primary_plane_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &ast_primary_plane_helper_funcs);
+
+	return 0;
+}
+
 /*
  * Cursor plane
  */
@@ -725,6 +745,26 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
+static int ast_cursor_plane_init(struct ast_private *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_plane *cursor_plane = &ast->cursor_plane;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, cursor_plane, 0x01,
+				       &ast_cursor_plane_funcs,
+				       ast_cursor_plane_formats,
+				       ARRAY_SIZE(ast_cursor_plane_formats),
+				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
+
+	return 0;
+}
+
 /*
  * CRTC
  */
@@ -1138,30 +1178,14 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	dev->mode_config.helper_private = &ast_mode_config_helper_funcs;
 
-	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
-	ret = drm_universal_plane_init(dev, &ast->primary_plane, 0x01,
-				       &ast_primary_plane_funcs,
-				       ast_primary_plane_formats,
-				       ARRAY_SIZE(ast_primary_plane_formats),
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		drm_err(dev, "ast: drm_universal_plane_init() failed: %d\n", ret);
+
+	ret = ast_primary_plane_init(ast);
+	if (ret)
 		return ret;
-	}
-	drm_plane_helper_add(&ast->primary_plane,
-			     &ast_primary_plane_helper_funcs);
 
-	ret = drm_universal_plane_init(dev, &ast->cursor_plane, 0x01,
-				       &ast_cursor_plane_funcs,
-				       ast_cursor_plane_formats,
-				       ARRAY_SIZE(ast_cursor_plane_formats),
-				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
-	if (ret) {
-		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
+	ret = ast_cursor_plane_init(ast);
+	if (ret)
 		return ret;
-	}
-	drm_plane_helper_add(&ast->cursor_plane,
-			     &ast_cursor_plane_helper_funcs);
 
 	ast_crtc_init(dev);
 	ast_encoder_init(dev);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
