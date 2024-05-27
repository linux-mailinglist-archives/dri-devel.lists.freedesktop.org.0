Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCD8D0199
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8F010E342;
	Mon, 27 May 2024 13:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA310E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 13:34:53 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VnxTR2TBLz4x98L
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:34:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c993:5573:f894:7353])
 by andre.telenet-ops.be with bizsmtp
 id UDaq2C0082nC7mg01Daqa2; Mon, 27 May 2024 15:34:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sBaU4-00CmN2-Ez;
 Mon, 27 May 2024 15:34:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sBaV0-003xdp-3y;
 Mon, 27 May 2024 15:34:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: shmobile: Add drm_panic support
Date: Mon, 27 May 2024 15:34:48 +0200
Message-Id: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a message on
the screen when a kernel panic occurs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Armadillo-800-EVA.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 07ad17d24294d5e6..9d166ab2af8bd231 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
 	.atomic_disable = shmob_drm_plane_atomic_disable,
 };
 
+static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
+	.atomic_check = shmob_drm_plane_atomic_check,
+	.atomic_update = shmob_drm_plane_atomic_update,
+	.atomic_disable = shmob_drm_plane_atomic_disable,
+	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
+};
+
 static const struct drm_plane_funcs shmob_drm_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 
 	splane->index = index;
 
-	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&splane->base,
+				     &shmob_drm_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(&splane->base,
+				     &shmob_drm_plane_helper_funcs);
 
 	return &splane->base;
 }
-- 
2.34.1

