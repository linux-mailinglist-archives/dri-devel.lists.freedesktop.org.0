Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDF3BC70D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369E5898C2;
	Tue,  6 Jul 2021 07:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7202C898C2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:22:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B78322574;
 Tue,  6 Jul 2021 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625556176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RAjnpRa55tE962TYkToLxoEc65+JgH9HnLHLqWd9pcI=;
 b=MTLbPSeGn79K2mVB0Fxw956b4qjoufz1ohgatAk3vYNCL4Puo8rAetySTqEskCJUayxyRV
 4mVae7JVWoN3AXR1JTqjNHsYnqV/FaqhSHSGExMich4mC3nZ+RPXsKWX99pIrd9TBF2h93
 Vknowcuyk02KqJdSfPfEteiHxWTZNzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625556176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RAjnpRa55tE962TYkToLxoEc65+JgH9HnLHLqWd9pcI=;
 b=EiWLdMhmCjvZ91nZc4ffhnw2+jxvWcrf+TnWl2uMEA2PUq2peHgbQqabokk/b8haaLn6Mt
 J78+JW3pTcA++QAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED58813A42;
 Tue,  6 Jul 2021 07:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 28FDOM8E5GBKZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:22:53 +0200
Message-Id: <20210706072253.6844-1-tzimmermann@suse.de>
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

Vmwgfx already uses Linux IRQ functions. All that's left to replace
is the reference to struct drm_device.irq. Use irq value of struct
pci_dev instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 4b82f5995452..c5191de365ca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -25,6 +25,7 @@
  *
  **************************************************************************/

+#include <linux/pci.h>
 #include <linux/sched/signal.h>

 #include "vmwgfx_drv.h"
@@ -287,6 +288,7 @@ static void vmw_irq_preinstall(struct drm_device *dev)
 void vmw_irq_uninstall(struct drm_device *dev)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	uint32_t status;

 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
@@ -297,7 +299,7 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);

-	free_irq(dev->irq, dev);
+	free_irq(pdev->irq, dev);
 }

 /**
@@ -309,16 +311,8 @@ void vmw_irq_uninstall(struct drm_device *dev)
  */
 int vmw_irq_install(struct drm_device *dev, int irq)
 {
-	int ret;
-
 	vmw_irq_preinstall(dev);

-	ret = request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
-				   IRQF_SHARED, VMWGFX_DRIVER_NAME, dev);
-	if (ret < 0)
-		return ret;
-
-	dev->irq = irq;
-
-	return ret;
+	return request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
+				    IRQF_SHARED, VMWGFX_DRIVER_NAME, dev);
 }
--
2.32.0

