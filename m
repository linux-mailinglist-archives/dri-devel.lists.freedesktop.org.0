Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB3739CE7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB47210E502;
	Thu, 22 Jun 2023 09:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035510E51D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:27:25 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by michel.telenet-ops.be with bizsmtp
 id C9TQ2A0061yfRTD069TQyK; Thu, 22 Jun 2023 11:27:24 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGb4-000Byu-D6;
 Thu, 22 Jun 2023 11:27:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGb5-003W49-Ug;
 Thu, 22 Jun 2023 11:27:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/udl: Convert to drm_crtc_helper_atomic_check()
Date: Thu, 22 Jun 2023 11:27:22 +0200
Message-Id: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_crtc_helper_atomic_check() helper instead of open-coding the
same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/gpu/drm/udl/udl_modeset.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index aa02fd2789c3f885..40876bcdd79a47ac 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
@@ -310,16 +311,6 @@ static const struct drm_plane_funcs udl_primary_plane_funcs = {
  * CRTC
  */
 
-static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
-{
-	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-
-	if (!new_crtc_state->enable)
-		return 0;
-
-	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-}
-
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
@@ -381,7 +372,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 }
 
 static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
-	.atomic_check = udl_crtc_helper_atomic_check,
+	.atomic_check = drm_crtc_helper_atomic_check,
 	.atomic_enable = udl_crtc_helper_atomic_enable,
 	.atomic_disable = udl_crtc_helper_atomic_disable,
 };
-- 
2.34.1

