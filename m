Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E2739CA5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65110E501;
	Thu, 22 Jun 2023 09:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2222610E502
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by michel.telenet-ops.be with bizsmtp
 id C9Nj2A00X1yfRTD069NjDP; Thu, 22 Jun 2023 11:22:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWY-000Bx2-1N;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003Vxh-KT;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 27/39] drm: renesas: shmobile: Rename shmob_drm_plane.plane
Date: Thu, 22 Jun 2023 11:21:39 +0200
Message-Id: <ecd392c966c967ac6826e20f8888e10161c9cbf7.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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

Rename the "plane" member of the shmob_drm_plane subclass structure to
"base", to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 63886015baaebfc0..e300e5c0de70a9b1 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -20,7 +20,7 @@
 #include "shmob_drm_regs.h"
 
 struct shmob_drm_plane {
-	struct drm_plane plane;
+	struct drm_plane base;
 	unsigned int index;
 	unsigned int alpha;
 
@@ -37,7 +37,7 @@ struct shmob_drm_plane {
 
 static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
 {
-	return container_of(plane, struct shmob_drm_plane, plane);
+	return container_of(plane, struct shmob_drm_plane, base);
 }
 
 static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
@@ -64,7 +64,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 				    struct drm_framebuffer *fb)
 {
-	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
+	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
 	unsigned int ovl_idx = splane->index - 1;
 	u32 format;
 
@@ -221,7 +221,7 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 	}
 
 	splane = drmm_universal_plane_alloc(&sdev->ddev,
-					    struct shmob_drm_plane, plane, 1,
+					    struct shmob_drm_plane, base, 1,
 					    funcs, formats,
 					    ARRAY_SIZE(formats),  NULL, type,
 					    NULL);
@@ -231,5 +231,5 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 	splane->index = index;
 	splane->alpha = 255;
 
-	return &splane->plane;
+	return &splane->base;
 }
-- 
2.34.1

