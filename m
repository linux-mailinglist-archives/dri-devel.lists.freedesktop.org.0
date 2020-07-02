Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8B21229C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB846EADC;
	Thu,  2 Jul 2020 11:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EDC6EAD6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A8B3BD79;
 Thu,  2 Jul 2020 11:50:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 11/14] drm/ast: Init cursors before creating modesetting
 structures
Date: Thu,  2 Jul 2020 13:50:26 +0200
Message-Id: <20200702115029.5281-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
References: <20200702115029.5281-1-tzimmermann@suse.de>
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

The cursor helpers reserve buffer objects in VRAM and update their
content. So although tied to modesetting, cursor helpers are more
of a memory manager. The modesetting's cursor plane requires this
functionality, so initialize cursors before modesetting.

While at it, also add an error check for ast_cursor_init().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 4724a38c001a..89d9ee0a9e81 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1073,6 +1073,10 @@ int ast_mode_init(struct drm_device *dev)
 	struct ast_private *ast = to_ast_private(dev);
 	int ret;
 
+	ret = ast_cursor_init(ast);
+	if (ret)
+		return ret;
+
 	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
 	ret = drm_universal_plane_init(dev, &ast->primary_plane, 0x01,
 				       &ast_primary_plane_funcs,
@@ -1098,7 +1102,6 @@ int ast_mode_init(struct drm_device *dev)
 	drm_plane_helper_add(&ast->cursor_plane,
 			     &ast_cursor_plane_helper_funcs);
 
-	ast_cursor_init(ast);
 	ast_crtc_init(dev);
 	ast_encoder_init(dev);
 	ast_connector_init(dev);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
