Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1B23CA0F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF06E0BE;
	Wed,  5 Aug 2020 10:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AAA89FCE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:54:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 121A0B696;
 Wed,  5 Aug 2020 10:54:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v1 3/4] drm/ast: Add commit-tail function
Date: Wed,  5 Aug 2020 12:54:27 +0200
Message-Id: <20200805105428.2590-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805105428.2590-1-tzimmermann@suse.de>
References: <20200805105428.2590-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicates drm_atomic_helper_commit_tail(), so that planes can be
disabled on full mode-setting changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
Cc: <stable@vger.kernel.org> # v5.6+
---
 drivers/gpu/drm/ast/ast_mode.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 0ea8a68ac2d9..ae5cb0a333f7 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1043,6 +1043,31 @@ static int ast_connector_init(struct drm_device *dev)
  * Mode config
  */
 
+static void
+ast_mode_config_helper_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = old_state->dev;
+
+	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+
+	drm_atomic_helper_commit_planes(dev, old_state, 0);
+
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	drm_atomic_helper_fake_vblank(old_state);
+
+	drm_atomic_helper_commit_hw_done(old_state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+
+	drm_atomic_helper_cleanup_planes(dev, old_state);
+}
+
+static const struct drm_mode_config_helper_funcs
+ast_mode_config_helper_funcs = {
+	.atomic_commit_tail = ast_mode_config_helper_commit_tail,
+};
+
 static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.mode_valid = drm_vram_helper_mode_valid,
@@ -1082,6 +1107,8 @@ int ast_mode_config_init(struct ast_private *ast)
 		dev->mode_config.max_height = 1200;
 	}
 
+	dev->mode_config.helper_private = &ast_mode_config_helper_funcs;
+
 	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
 	ret = drm_universal_plane_init(dev, &ast->primary_plane, 0x01,
 				       &ast_primary_plane_funcs,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
