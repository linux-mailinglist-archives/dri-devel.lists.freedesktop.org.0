Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614027582DE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD5210E38F;
	Tue, 18 Jul 2023 16:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4110E39C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:55 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by michel.telenet-ops.be with bizsmtp
 id Ngus2A0031C8whw06gusXc; Tue, 18 Jul 2023 18:54:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nZv-PM;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000geA-QP;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 38/41] drm: renesas: shmobile: Use suspend/resume helpers
Date: Tue, 18 Jul 2023 18:54:43 +0200
Message-Id: <87d57df9eb40198a2530fa92a9a3f44f60829017.1689698048.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the custom suspend/resume handling by calls into
drm_mode_config_helper_{suspend,resume}().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 13 -------------
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  2 --
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 13 +++----------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 5c0575eed3ab6833..a176cd3e494ed2fd 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -287,19 +287,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	scrtc->started = false;
 }
 
-void shmob_drm_crtc_suspend(struct shmob_drm_crtc *scrtc)
-{
-	shmob_drm_crtc_stop(scrtc);
-}
-
-void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
-{
-	if (scrtc->dpms != DRM_MODE_DPMS_ON)
-		return;
-
-	shmob_drm_crtc_start(scrtc);
-}
-
 static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct shmob_drm_crtc, base);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index fe41e42d6cc55275..37380c815f1f5a08 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -40,8 +40,6 @@ struct shmob_drm_connector {
 
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev);
 void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc);
-void shmob_drm_crtc_suspend(struct shmob_drm_crtc *scrtc);
-void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc);
 
 int shmob_drm_encoder_create(struct shmob_drm_device *sdev);
 int shmob_drm_connector_create(struct shmob_drm_device *sdev,
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index e4e88e66de5c3d3b..b7643884b49f0bc8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -115,22 +116,14 @@ static int shmob_drm_pm_suspend(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
 
-	drm_kms_helper_poll_disable(&sdev->ddev);
-	shmob_drm_crtc_suspend(&sdev->crtc);
-
-	return 0;
+	return drm_mode_config_helper_suspend(&sdev->ddev);
 }
 
 static int shmob_drm_pm_resume(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
 
-	drm_modeset_lock_all(&sdev->ddev);
-	shmob_drm_crtc_resume(&sdev->crtc);
-	drm_modeset_unlock_all(&sdev->ddev);
-
-	drm_kms_helper_poll_enable(&sdev->ddev);
-	return 0;
+	return drm_mode_config_helper_resume(&sdev->ddev);
 }
 
 static int shmob_drm_pm_runtime_suspend(struct device *dev)
-- 
2.34.1

