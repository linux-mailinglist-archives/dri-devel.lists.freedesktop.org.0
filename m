Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD677DF1D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654810E339;
	Wed, 16 Aug 2023 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF1B10E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:42 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by xavier.telenet-ops.be with bizsmtp
 id aAkf2A00f45ualL01AkfwM; Wed, 16 Aug 2023 12:44:40 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0v-000or8-88;
 Wed, 16 Aug 2023 12:44:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAx-006774-4L;
 Wed, 16 Aug 2023 11:50:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 37/41] drm: renesas: shmobile: Atomic conversion part 2
Date: Wed, 16 Aug 2023 11:50:44 +0200
Message-Id: <6386b4805a880f907e963b9045dc3ba34936c97e.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement atomic mode setting for the CRTC, using the existing dpms
callback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This works, but I had expected that crtc_helper_funcs.atomic_check
should point to drm_crtc_helper_atomic_check() instead, as the primary
plane cannot be disabled.  However in doing so, when
drm_atomic_helper_check_crtc_primary_plane() fails:

    [drm:drm_atomic_helper_check_crtc_primary_plane] [CRTC:41:crtc-0] primary plane missing

the display fails to restore after running "modetest -s", until I run
modetest without -s.

Letting shmob_drm_plane_atomic_check() return -EINVAL if
!new_plane_state->crtc && is_primary would fix that, but causes an ugly
warning:

    WARNING: CPU: 0 PID: 21 at drivers/gpu/drm/drm_framebuffer.c:1130 drm_framebuffer_remove+0x374/0x4b0
    atomic remove_fb failed with -22

v3:
  - No changes,

v2:
  - No changes.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 41 +++++++------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index c277f93668825e1c..5c0575eed3ab6833 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -11,6 +11,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
@@ -319,27 +320,6 @@ static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 	scrtc->dpms = mode;
 }
 
-static void shmob_drm_crtc_mode_prepare(struct drm_crtc *crtc)
-{
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
-}
-
-static void shmob_drm_crtc_mode_commit(struct drm_crtc *crtc)
-{
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
-}
-
-static int shmob_drm_crtc_atomic_check(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
-{
-	return 0;
-}
-
-static void shmob_drm_crtc_atomic_begin(struct drm_crtc *crtc,
-					struct drm_atomic_state *state)
-{
-}
-
 static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -356,13 +336,22 @@ static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
+static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
+{
+	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+}
+
+static void shmob_drm_crtc_atomic_disable(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+}
+
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
-	.dpms = shmob_drm_crtc_dpms,
-	.prepare = shmob_drm_crtc_mode_prepare,
-	.commit = shmob_drm_crtc_mode_commit,
-	.atomic_check = shmob_drm_crtc_atomic_check,
-	.atomic_begin = shmob_drm_crtc_atomic_begin,
 	.atomic_flush = shmob_drm_crtc_atomic_flush,
+	.atomic_enable = shmob_drm_crtc_atomic_enable,
+	.atomic_disable = shmob_drm_crtc_atomic_disable,
 };
 
 static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
-- 
2.34.1

