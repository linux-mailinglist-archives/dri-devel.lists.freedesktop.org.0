Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8492685B4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949826E3F2;
	Mon, 14 Sep 2020 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675B6E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:22:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88637B195;
 Mon, 14 Sep 2020 07:22:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v3 2/4] drm/ast: Disable planes while switching display modes
Date: Mon, 14 Sep 2020 09:22:34 +0200
Message-Id: <20200914072236.19398-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914072236.19398-1-tzimmermann@suse.de>
References: <20200914072236.19398-1-tzimmermann@suse.de>
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

The ast HW cursor requires the primary plane and CRTC to display at
a valid mode and format. This is not the case while switching
display modes, which can lead to the screen turing permanently dark.

As a workaround, the ast driver now disables active planes while the
mode or format switch takes place. It also synchronizes with the vertical
refresh to give CRTC and planes some time to catch up on each other.
The active planes planes (primary or cursor) will be re-enabled by
each plane's atomic_update() function.

v3:
	* move the logic into the CRTC's atomic_disable function
v2:
	* move the logic into the commit-tail function

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 ++
 drivers/gpu/drm/ast/ast_mode.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

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
index 2323fe0b71bd..5b45b57c3d17 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -514,6 +514,16 @@ static void ast_set_start_address_crt1(struct ast_private *ast,
 
 }
 
+static void ast_wait_for_vretrace(struct ast_private *ast)
+{
+	unsigned long timeout = jiffies + HZ;
+	u8 vgair1;
+
+	do {
+		vgair1 = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
+	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) && time_before(jiffies, timeout));
+}
+
 /*
  * Primary plane
  */
@@ -809,7 +819,28 @@ static void
 ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 			       struct drm_crtc_state *old_crtc_state)
 {
+	struct drm_device *dev = crtc->dev;
+	struct ast_private *ast = to_ast_private(dev);
+
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+
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
+	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
+
+	/*
+	 * Ensure that no scanout takes place before reprogramming mode
+	 * and format registers.
+	 */
+	ast_wait_for_vretrace(ast);
 }
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
