Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B07D7582EE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159C910E397;
	Tue, 18 Jul 2023 16:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C5610E390
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id Ngur2A00a1C8whw06gurSo; Tue, 18 Jul 2023 18:54:51 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nYe-Cr;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gcc-Dt;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 19/41] drm: renesas: shmobile: Use
 drmm_universal_plane_alloc()
Date: Tue, 18 Jul 2023 18:54:24 +0200
Message-Id: <ca245e28d56c5439ac82b0affad89f9ee66071d3.1689698048.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the comments for drm_universal_plane_init(), the plane
structure should not be allocated with devm_kzalloc().

Fix lifetime issues by using drmm_universal_plane_alloc() instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off removal of call to drm_plane_force_disable().
---
 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 3a5db319bad14218..1fb68b5fe915b8dc 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -179,7 +179,6 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
 static const struct drm_plane_funcs shmob_drm_plane_funcs = {
 	.update_plane = shmob_drm_plane_update,
 	.disable_plane = shmob_drm_plane_disable,
-	.destroy = drm_plane_cleanup,
 };
 
 static const uint32_t formats[] = {
@@ -198,19 +197,16 @@ static const uint32_t formats[] = {
 int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
 {
 	struct shmob_drm_plane *splane;
-	int ret;
 
-	splane = devm_kzalloc(sdev->dev, sizeof(*splane), GFP_KERNEL);
-	if (splane == NULL)
-		return -ENOMEM;
+	splane = drmm_universal_plane_alloc(sdev->ddev, struct shmob_drm_plane,
+					    plane, 1, &shmob_drm_plane_funcs,
+					    formats, ARRAY_SIZE(formats), NULL,
+					    DRM_PLANE_TYPE_OVERLAY, NULL);
+	if (IS_ERR(splane))
+		return PTR_ERR(splane);
 
 	splane->index = index;
 	splane->alpha = 255;
 
-	ret = drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
-				       &shmob_drm_plane_funcs,
-				       formats, ARRAY_SIZE(formats), NULL,
-				       DRM_PLANE_TYPE_OVERLAY, NULL);
-
-	return ret;
+	return 0;
 }
-- 
2.34.1

