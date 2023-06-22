Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB134739CB9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA910E529;
	Thu, 22 Jun 2023 09:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535AF10E507
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by andre.telenet-ops.be with bizsmtp
 id C9Nj2A00a1yfRTD019NjNp; Thu, 22 Jun 2023 11:22:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWX-000BwF-Nh;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003Vwo-Ak;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 16/39] drm: renesas: shmobile: Convert to use
 devm_request_irq()
Date: Thu, 22 Jun 2023 11:21:28 +0200
Message-Id: <c8d14f4a5e455d523c5c7ff89bd815196df7e4f9.1687423204.git.geert+renesas@glider.be>
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

Convert to managed IRQ handling, to simplify cleanup.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 50fca18282c5cb5e..ece9aedde9b662d4 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -169,7 +169,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 
 	return 0;
@@ -252,8 +251,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		goto err_modeset_cleanup;
 	sdev->irq = ret;
 
-	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
-			  ddev);
+	ret = devm_request_irq(&pdev->dev, sdev->irq, shmob_drm_irq, 0,
+			       ddev->driver->name, ddev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to install IRQ handler\n");
 		goto err_modeset_cleanup;
@@ -265,14 +264,12 @@ static int shmob_drm_probe(struct platform_device *pdev)
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

