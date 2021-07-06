Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870D3BC781
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE3F89A5D;
	Tue,  6 Jul 2021 07:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17DF89A56
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:54:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6958A2267D;
 Tue,  6 Jul 2021 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625558067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gMPl6RP1KX2nSXExpVArGR7oTPJ+PMXBI7RHaL4ld+M=;
 b=tyopmgWLCX8BjgL55vI/xNlHWsPtFfiaBf2K1/wtztApXGKIGYqlKQQQTP7XnZhP+QKOHr
 U1pQCUDRXqJ3TuMzzySQ+W+cFwG4esfwJCtChlviPlgBLekaHMd0V/Y+ErqOv6yIGVxZqK
 Fv9StaIu0IczkKfXQFmILpoRZ+fG38Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625558067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gMPl6RP1KX2nSXExpVArGR7oTPJ+PMXBI7RHaL4ld+M=;
 b=m/egaQXyHNFcEzrrnqF+9yIzgR4Uwh5zZrOCBxPVSsMOmA31N6FNl8h50AJrDlmEqbu4Vq
 nSqDxgy6w1L2wGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F5B013A42;
 Tue,  6 Jul 2021 07:54:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KsuiBjMM5GD7bwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:54:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Subject: [PATCH] drm/hisilicon/hibmc: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:54:25 +0200
Message-Id: <20210706075425.9257-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index d2628956dca3..f73a8e0ea12e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -19,7 +19,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_vblank.h>
 
@@ -28,7 +27,7 @@
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
-static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
+static irqreturn_t hibmc_interrupt(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
@@ -63,7 +62,6 @@ static const struct drm_driver hibmc_driver = {
 	.dumb_create            = hibmc_dumb_create,
 	.dumb_map_offset        = drm_gem_ttm_dumb_map_offset,
 	.gem_prime_mmap		= drm_gem_prime_mmap,
-	.irq_handler		= hibmc_drm_interrupt,
 };
 
 static int __maybe_unused hibmc_pm_suspend(struct device *dev)
@@ -251,9 +249,12 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 
 static int hibmc_unload(struct drm_device *dev)
 {
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
 	drm_atomic_helper_shutdown(dev);
 
-	drm_irq_uninstall(dev);
+	free_irq(pdev->irq, dev);
 
 	pci_disable_msi(to_pci_dev(dev->dev));
 
@@ -290,7 +291,9 @@ static int hibmc_load(struct drm_device *dev)
 	if (ret) {
 		drm_warn(dev, "enabling MSI failed: %d\n", ret);
 	} else {
-		ret = drm_irq_install(dev, pdev->irq);
+		/* PCI devices require shared interrupts. */
+		ret = request_irq(pdev->irq, hibmc_interrupt, IRQF_SHARED,
+				  dev->driver->name, dev);
 		if (ret)
 			drm_warn(dev, "install irq failed: %d\n", ret);
 	}
-- 
2.32.0

