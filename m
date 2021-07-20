Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCD3CF5BC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4269C6E2E1;
	Tue, 20 Jul 2021 08:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF06E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 08:09:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78FAE1FDBF;
 Tue, 20 Jul 2021 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626768583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3kdiMdwRscKTrzH2GORNXaEjN/2zUcLUcup9pUEKft4=;
 b=X04bwiaV/ocd9/n1jkcBS0yxZOgODJ4olip8Uku1bbCT7P1/vaGVEaw1sEmvRafUzDEcWn
 glDiElqW5ecruUIeTuN+aUpdtH2rdq9shN5b0GerFwa9oiJAVm8D7Nm4soyGhDnmzOTAK7
 qg3Ut8P+2CQl7d02vsOJsmKl0veaShY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626768583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3kdiMdwRscKTrzH2GORNXaEjN/2zUcLUcup9pUEKft4=;
 b=dbUEA839VSXv6tSDde3Owm6SFiP8PVmeVs0jtMkasdSxsoP8bmfS8iranKAPSbsCS12sIV
 z+kUc+KC2abPHiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3795013D65;
 Tue, 20 Jul 2021 08:09:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X6SfDMeE9mDVDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jul 2021 08:09:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, geert@linux-m68k.org,
 sergei.shtylyov@gmail.com
Subject: [PATCH v3] drm/shmobile: Convert to Linux IRQ interfaces
Date: Tue, 20 Jul 2021 10:09:41 +0200
Message-Id: <20210720080941.23646-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

v3:
	* return error if (ret < 0) (Geert)
	* remove duplicate error message (Geert)
v2:
	* handle errors in platform_get_irq() (Geert, Sergei)
	* store IRQ number in struct shmob_drm_device (Laurent)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 14 +++++++++-----
 drivers/gpu/drm/shmobile/shmob_drm_drv.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 0a02b7092c04..7db01904d18d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -18,7 +18,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -130,7 +129,6 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
 
 static const struct drm_driver shmob_drm_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
-	.irq_handler		= shmob_drm_irq,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops			= &shmob_drm_fops,
 	.name			= "shmob-drm",
@@ -183,7 +181,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	drm_irq_uninstall(ddev);
+	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 
 	return 0;
@@ -258,7 +256,13 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		goto err_modeset_cleanup;
 	}
 
-	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_modeset_cleanup;
+	sdev->irq = ret;
+
+	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
+			  ddev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to install IRQ handler\n");
 		goto err_modeset_cleanup;
@@ -275,7 +279,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	return 0;
 
 err_irq_uninstall:
-	drm_irq_uninstall(ddev);
+	free_irq(sdev->irq, ddev);
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
 err_free_drm_dev:
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
index 80dc4b1020aa..4964ddd5ab74 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
@@ -29,6 +29,7 @@ struct shmob_drm_device {
 	u32 lddckr;
 	u32 ldmt1r;
 
+	unsigned int irq;
 	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
 
 	struct drm_device *ddev;
-- 
2.32.0

