Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0B77DF89
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED72010E343;
	Wed, 16 Aug 2023 10:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDD410E32B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:43 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by michel.telenet-ops.be with bizsmtp
 id aAkh2A00F45ualL06Akh1o; Wed, 16 Aug 2023 12:44:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0w-000osO-UH;
 Wed, 16 Aug 2023 12:44:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAw-00675S-Mo;
 Wed, 16 Aug 2023 11:50:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 17/41] drm: renesas: shmobile: Convert to use
 devm_request_irq()
Date: Wed, 16 Aug 2023 11:50:24 +0200
Message-Id: <073cc8d262c6d9eaac0d00fca29cf7282c7acf10.1692178020.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to managed IRQ handling, to simplify cleanup.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 91daab80b0ede058..381e184abf552c4c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -196,7 +196,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 
 	return 0;
@@ -279,8 +278,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		goto err_modeset_cleanup;
 	sdev->irq = ret;
 
-	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
-			  ddev);
+	ret = devm_request_irq(&pdev->dev, sdev->irq, shmob_drm_irq, 0,
+			       ddev->driver->name, ddev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to install IRQ handler\n");
 		goto err_modeset_cleanup;
@@ -292,14 +291,12 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	 */
 	ret = drm_dev_register(ddev, 0);
 	if (ret < 0)
-		goto err_irq_uninstall;
+		goto err_modeset_cleanup;
 
 	drm_fbdev_generic_setup(ddev, 16);
 
 	return 0;
 
-err_irq_uninstall:
-	free_irq(sdev->irq, ddev);
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
 err_free_drm_dev:
-- 
2.34.1

