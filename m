Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C297582C7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C4E10E385;
	Tue, 18 Jul 2023 16:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE85B10E385
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by andre.telenet-ops.be with bizsmtp
 id Ngur2A00l0ucMBo01gurGl; Tue, 18 Jul 2023 18:54:54 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nZI-JL;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gdR-KR;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 29/41] drm: renesas: shmobile: Rename shmob_drm_plane.plane
Date: Tue, 18 Jul 2023 18:54:34 +0200
Message-Id: <ec258533561d8bf915610bca63d7ba396faf58f5.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the "plane" member of the shmob_drm_plane subclass structure to
"base", to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 3518f8900c0d1f9e..d0a9299784d4a7cc 100644
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
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
@@ -216,7 +216,7 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 		funcs = &shmob_drm_overlay_plane_funcs;
 
 	splane = drmm_universal_plane_alloc(&sdev->ddev,
-					    struct shmob_drm_plane, plane, 1,
+					    struct shmob_drm_plane, base, 1,
 					    funcs, formats,
 					    ARRAY_SIZE(formats),  NULL, type,
 					    NULL);
@@ -226,5 +226,5 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 	splane->index = index;
 	splane->alpha = 255;
 
-	return &splane->plane;
+	return &splane->base;
 }
-- 
2.34.1

