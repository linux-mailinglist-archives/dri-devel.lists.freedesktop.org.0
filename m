Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA223CA11
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4668F89FCE;
	Wed,  5 Aug 2020 10:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028856E0BE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:54:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33F38B697;
 Wed,  5 Aug 2020 10:54:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v1 4/4] drm/ast: Disable planes while switching display modes
Date: Wed,  5 Aug 2020 12:54:28 +0200
Message-Id: <20200805105428.2590-5-tzimmermann@suse.de>
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

The ast HW cursor requires the primary plane and CRTC to display at
a valid mode and format. This is not the case while switching
display modes, which can lead to the screen turing permanently dark.

As a workaround, the ast driver now disables active planes while the
mode or format switch takes place. It also synchronizes with the vertical
refresh to give CRTC and planes some time to catch up on each other.
The active planes planes (primary or cursor) will be re-enabled by
each plane's atomic_update() function.

v2:
	* move the logic into the commit-tail function

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
 drivers/gpu/drm/ast/ast_drv.h  |  2 +
 drivers/gpu/drm/ast/ast_mode.c | 68 ++++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c1af6b725933..467049ca8430 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -177,6 +177,8 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 
 #define AST_IO_MM_OFFSET		(0x380)
 
+#define AST_IO_VGAIR1_VREFRESH		BIT(3)
+
 #define __ast_read(x) \
 static inline u##x ast_read##x(struct ast_private *ast, u32 reg) { \
 u##x val = 0;\
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ae5cb0a333f7..a379d51f3543 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -514,6 +514,17 @@ static void ast_set_start_address_crt1(struct ast_private *ast,
 
 }
 
+static void ast_wait_for_vretrace(struct ast_private *ast)
+{
+	unsigned long timeout = jiffies + HZ;
+	u8 vgair1;
+
+	do {
+		vgair1 = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
+	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) &&
+		 time_before(jiffies, timeout));
+}
+
 /*
  * Primary plane
  */
@@ -1043,23 +1054,72 @@ static int ast_connector_init(struct drm_device *dev)
  * Mode config
  */
 
+static bool
+ast_crtc_needs_planes_disabled(struct drm_crtc_state *old_crtc_state,
+			       struct drm_crtc_state *new_crtc_state)
+{
+	struct ast_crtc_state *old_ast_crtc_state, *new_ast_crtc_state;
+
+	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
+		return true;
+
+	old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
+	new_ast_crtc_state = to_ast_crtc_state(new_crtc_state);
+
+	if (old_ast_crtc_state->format != new_ast_crtc_state->format)
+		return true;
+
+	return false;
+}
+
 static void
 ast_mode_config_helper_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	struct ast_private *ast = to_ast_private(dev);
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+	bool wait_for_vretrace = false;
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
+	/*
+	 * HW cursors require the underlying primary plane and CRTC to
+	 * display a valid mode and image. This is not the case during
+	 * full modeset operations. So we temporarily disable any active
+	 * plane, including the HW cursor. Each plane's atomic_update()
+	 * helper will re-enable it if necessary.
+	 *
+	 * We only do this during *full* modesets. It does not affect
+	 * simple pageflips on the planes.
+	 */
+	for_each_oldnew_crtc_in_state(old_state, crtc,
+				      old_crtc_state,
+				      new_crtc_state, i) {
+		if (!ast_crtc_needs_planes_disabled(old_crtc_state,
+						    new_crtc_state))
+			continue;
+		drm_atomic_helper_disable_planes_on_crtc(old_crtc_state,
+							 false);
+		wait_for_vretrace = true;
+	}
+
+	/*
+	 * Ensure that no scanout takes place before reprogramming mode
+	 * and format registers.
+	 */
+	if (wait_for_vretrace)
+		ast_wait_for_vretrace(ast);
+
+	drm_atomic_helper_commit_planes(dev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_fake_vblank(old_state);
-
 	drm_atomic_helper_commit_hw_done(old_state);
-
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
-
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
