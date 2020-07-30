Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247823336C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6A96E8F0;
	Thu, 30 Jul 2020 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D426E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 965F8B127;
 Thu, 30 Jul 2020 13:52:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 4/9] drm/ast: Replace struct_drm_device.dev_private with
 to_ast_private()
Date: Thu, 30 Jul 2020 15:52:01 +0200
Message-Id: <20200730135206.30239-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730135206.30239-1-tzimmermann@suse.de>
References: <20200730135206.30239-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ast code still references dev_private in several place when looking
up the ast device structure. Convert the remaining locations to use
to_ast_private().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_cursor.c | 2 +-
 drivers/gpu/drm/ast/ast_mode.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index acf0d23514e8..8d693c8b346f 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -47,7 +47,7 @@ static void ast_cursor_fini(struct ast_private *ast)
 
 static void ast_cursor_release(struct drm_device *dev, void *ptr)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	ast_cursor_fini(ast);
 }
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 78f28a4e6ed8..cdbdf3489dee 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -663,7 +663,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	struct ast_private *ast = plane->dev->dev_private;
+	struct ast_private *ast = to_ast_private(plane->dev);
 	unsigned int offset_x, offset_y;
 
 	offset_x = AST_MAX_HWC_WIDTH - fb->width;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
