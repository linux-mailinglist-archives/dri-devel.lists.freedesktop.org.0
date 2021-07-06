Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2043BC77A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ED4899C4;
	Tue,  6 Jul 2021 07:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D9A899C4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:50:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 647B51FF1A;
 Tue,  6 Jul 2021 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625557813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/8ivxd2efJ9tiMYiiqE0ftslWwUDhvdsRsOIbqwH+aQ=;
 b=mIi9u7rVht7lnQd0RHNn04cEwOCVrM/GPIyvz7NsolaL+pY2OwkWNwTc6003dqaYuKXZ3i
 +CMxs28m2RMYvqIBJQfqaNrBBg4Z/XDrxi3QrV8jASxIPMjQxBdC7OeTGIMerSQZRYN0ow
 DfEpBXhXsvi66DxdTFFZcJ8oCBszNas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625557813;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/8ivxd2efJ9tiMYiiqE0ftslWwUDhvdsRsOIbqwH+aQ=;
 b=pHvC7RpqOHrqJp2n/zkSqatzUqMFqlBG6mwy6+bt3EXy8GjtMaBp2VvElGGrF+6xdb8CBa
 DuW97SAx3LNpzNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40D5513A42;
 Tue,  6 Jul 2021 07:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WyS/DjUL5GDLbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:50:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vbox: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:50:11 +0200
Message-Id: <20210706075011.9009-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/vboxvideo/vbox_drv.c |  1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.h |  1 -
 drivers/gpu/drm/vboxvideo/vbox_irq.c | 16 +++++++++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 879a2445cc44..2b81cb259d23 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -184,7 +184,6 @@ static const struct drm_driver driver = {
 	.lastclose = drm_fb_helper_lastclose,
 
 	.fops = &vbox_fops,
-	.irq_handler = vbox_irq_handler,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index ac7c2effc46f..4903b91d7fe4 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -145,7 +145,6 @@ void vbox_mm_fini(struct vbox_private *vbox);
 int vbox_irq_init(struct vbox_private *vbox);
 void vbox_irq_fini(struct vbox_private *vbox);
 void vbox_report_hotplug(struct vbox_private *vbox);
-irqreturn_t vbox_irq_handler(int irq, void *arg);
 
 /* vbox_hgsmi.c */
 void *hgsmi_buffer_alloc(struct gen_pool *guest_pool, size_t size,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
index b3ded68603ba..903a6c48ee8b 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
@@ -10,7 +10,8 @@
  */
 
 #include <linux/pci.h>
-#include <drm/drm_irq.h>
+
+#include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 
 #include "vbox_drv.h"
@@ -31,7 +32,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
 	schedule_work(&vbox->hotplug_work);
 }
 
-irqreturn_t vbox_irq_handler(int irq, void *arg)
+static irqreturn_t vbox_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	struct vbox_private *vbox = to_vbox_dev(dev);
@@ -170,16 +171,21 @@ static void vbox_hotplug_worker(struct work_struct *work)
 
 int vbox_irq_init(struct vbox_private *vbox)
 {
-	struct pci_dev *pdev = to_pci_dev(vbox->ddev.dev);
+	struct drm_device *dev = &vbox->ddev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
 	vbox_update_mode_hints(vbox);
 
-	return drm_irq_install(&vbox->ddev, pdev->irq);
+	/* PCI devices require shared interrupts. */
+	return request_irq(pdev->irq, vbox_irq_handler, IRQF_SHARED, dev->driver->name, dev);
 }
 
 void vbox_irq_fini(struct vbox_private *vbox)
 {
-	drm_irq_uninstall(&vbox->ddev);
+	struct drm_device *dev = &vbox->ddev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	free_irq(pdev->irq, dev);
 	flush_work(&vbox->hotplug_work);
 }
-- 
2.32.0

