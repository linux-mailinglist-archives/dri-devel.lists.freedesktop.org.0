Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E47582E6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9E10E39A;
	Tue, 18 Jul 2023 16:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8FD10E383
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by baptiste.telenet-ops.be with bizsmtp
 id Ngur2A0121C8whw01gurDZ; Tue, 18 Jul 2023 18:54:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nZY-Lj;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gdk-Mx;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 33/41] drm: renesas: shmobile: Turn vblank on/off when
 enabling/disabling CRTC
Date: Tue, 18 Jul 2023 18:54:38 +0200
Message-Id: <86dadc27e76e1f1fe66d3cee1f50553e303f4063.1689698048.git.geert+renesas@glider.be>
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

The DRM core vblank handling mechanism requires drivers to forcefully
turn vblank reporting off when disabling the CRTC, and to restore the
vblank reporting status when enabling the CRTC.
Implement this using the drm_crtc_vblank_{on,off}() helpers.

Note that drm_crtc_vblank_off() must be called at startup to synchronize
the state of the vblank core code with the hardware, which is initially
disabled.  This is performed at CRTC creation time, requiring vertical
blank initialization to be moved before creating CRTCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 12 ++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 20adb9d2fa178250..ab42a4999a55c475 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -271,6 +271,9 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 
 	shmob_drm_crtc_start_stop(scrtc, true);
 
+	/* Turn vertical blank interrupt reporting back on. */
+	drm_crtc_vblank_on(crtc);
+
 	scrtc->started = true;
 }
 
@@ -283,10 +286,12 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 		return;
 
 	/*
-	 * Wait for page flip completion before stopping the CRTC as userspace
+	 * Disable vertical blank interrupt reporting.  We first need to wait
+	 * for page flip completion before stopping the CRTC as userspace
 	 * expects page flips to eventually complete.
 	 */
 	shmob_drm_crtc_wait_page_flip(scrtc);
+	drm_crtc_vblank_off(crtc);
 
 	/* Stop the LCDC. */
 	shmob_drm_crtc_start_stop(scrtc, false);
@@ -519,6 +524,9 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
+	/* Start with vertical blank interrupt reporting disabled. */
+	drm_crtc_vblank_off(crtc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 44f12bfcb3ce575d..78f9650e3a61365f 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -216,17 +216,17 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = shmob_drm_modeset_init(sdev);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to initialize mode setting\n");
-
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to initialize vblank\n");
-		goto err_modeset_cleanup;
+		return ret;
 	}
 
+	ret = shmob_drm_modeset_init(sdev);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to initialize mode setting\n");
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto err_modeset_cleanup;
-- 
2.34.1

