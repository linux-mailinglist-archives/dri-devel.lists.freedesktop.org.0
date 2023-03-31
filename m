Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A26D230D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35010F285;
	Fri, 31 Mar 2023 14:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C75310F281
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:52:41 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id f2se2900R1C8whw062sej5; Fri, 31 Mar 2023 16:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG2N-00FUgh-5E;
 Fri, 31 Mar 2023 16:48:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG36-008fIa-J5;
 Fri, 31 Mar 2023 16:48:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/5] drm: shmobile: Switch to drm_crtc_init_with_planes()
Date: Fri, 31 Mar 2023 16:48:09 +0200
Message-Id: <df4099d79c985c73bdc890eb0e026494b7fa5c96.1680273039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>
References: <cover.1680273039.git.geert+renesas@glider.be>
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

The SH-Mobile DRM driver uses the legacy drm_crtc_init(), which
advertizes only the formats in safe_modeset_formats[] (XR24 and AR24) as
being supported.

Switch to drm_crtc_init_with_planes(), and advertize all supported
(A)RGB modes, so we can use RGB565 as the default mode for the console.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 30 +++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 08dc1428aa16caf0..11dd2bc803e7cb62 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -478,16 +479,41 @@ static const struct drm_crtc_funcs crtc_funcs = {
 	.disable_vblank = shmob_drm_disable_vblank,
 };
 
+static const uint32_t modeset_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_plane_funcs primary_plane_funcs = {
+	DRM_PLANE_NON_ATOMIC_FUNCS,
+};
+
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 {
 	struct drm_crtc *crtc = &sdev->crtc.crtc;
+	struct drm_plane *primary;
 	int ret;
 
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
-	ret = drm_crtc_init(sdev->ddev, crtc, &crtc_funcs);
-	if (ret < 0)
+	primary = __drm_universal_plane_alloc(sdev->ddev, sizeof(*primary), 0,
+					      0, &primary_plane_funcs,
+					      modeset_formats,
+					      ARRAY_SIZE(modeset_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY,
+					      NULL);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
+
+	ret = drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL,
+					&crtc_funcs, NULL);
+	if (ret < 0) {
+		drm_plane_cleanup(primary);
+		kfree(primary);
 		return ret;
+	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
-- 
2.34.1

