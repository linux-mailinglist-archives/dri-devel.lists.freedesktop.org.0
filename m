Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92D3D7D8C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF736EC75;
	Tue, 27 Jul 2021 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75D76EB35;
 Tue, 27 Jul 2021 18:27:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 430ED22238;
 Tue, 27 Jul 2021 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mQOCbOV52pRbUkfuvMipsrJoBTjpbf/hTeFLBcfUcs=;
 b=rgzy3kKkO/HZMWuFh+nzaWVo7ItC4u82JQl56z0qAxYN3Lb2imiJJFBYIwTGX/wedl9D1z
 CRFH3a+IgbLzYdrrCC+qNMmiFXYhLl3L8GGRFKWz5mGcOcn4YdC6yCNW4bWmLd20CUkjN/
 qJ19Nyiz8ibS0NPyrl1OpcoiJNSF5xE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mQOCbOV52pRbUkfuvMipsrJoBTjpbf/hTeFLBcfUcs=;
 b=+D0JJ8X3djIZMbjSGIcsbmDjUpxT/mnGOnkfhG4mZv7Y4JoQgF4LUlvRTgDSBFm3B2SQ7h
 Mi6BpkMjOh+rH7DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B53A413E9D;
 Tue, 27 Jul 2021 18:27:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yJo6Kw1QAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 05/14] drm/gma500: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:12 +0200
Message-Id: <20210727182721.17981-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
References: <20210727182721.17981-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it. DRM IRQ callbacks are now being called
directly or inlined.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/power.c   |  1 +
 drivers/gpu/drm/gma500/psb_drv.c |  8 ++------
 drivers/gpu/drm/gma500/psb_drv.h |  5 -----
 drivers/gpu/drm/gma500/psb_irq.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/gma500/psb_irq.h |  4 ++--
 5 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index f07641dfa5a4..20ace6010f9f 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -32,6 +32,7 @@
 #include "psb_drv.h"
 #include "psb_reg.h"
 #include "psb_intel_reg.h"
+#include "psb_irq.h"
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 3850842d58f3..58bce1a60a4d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_pciids.h>
 #include <drm/drm_vblank.h>
 
@@ -33,6 +32,7 @@
 #include "power.h"
 #include "psb_drv.h"
 #include "psb_intel_reg.h"
+#include "psb_irq.h"
 #include "psb_reg.h"
 
 static const struct drm_driver driver;
@@ -380,7 +380,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 
-	drm_irq_install(dev, pdev->irq);
+	psb_irq_install(dev, pdev->irq);
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
 
@@ -515,10 +515,6 @@ static const struct drm_driver driver = {
 	.lastclose = drm_fb_helper_lastclose,
 
 	.num_ioctls = ARRAY_SIZE(psb_ioctls),
-	.irq_preinstall = psb_irq_preinstall,
-	.irq_postinstall = psb_irq_postinstall,
-	.irq_uninstall = psb_irq_uninstall,
-	.irq_handler = psb_irq_handler,
 
 	.dumb_create = psb_gem_dumb_create,
 	.ioctls = psb_ioctls,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index d6e7c2c2c947..f2bae270ca7b 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -624,11 +624,6 @@ static inline struct drm_psb_private *psb_priv(struct drm_device *dev)
 }
 
 /* psb_irq.c */
-extern irqreturn_t psb_irq_handler(int irq, void *arg);
-extern void psb_irq_preinstall(struct drm_device *dev);
-extern int psb_irq_postinstall(struct drm_device *dev);
-extern void psb_irq_uninstall(struct drm_device *dev);
-
 extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
 extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
 extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 104009e78487..deb1fbc1f748 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -8,6 +8,7 @@
  *
  **************************************************************************/
 
+#include <drm/drm_drv.h>
 #include <drm/drm_vblank.h>
 
 #include "power.h"
@@ -222,7 +223,7 @@ static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
 	PSB_RSGX32(PSB_CR_EVENT_HOST_CLEAR2);
 }
 
-irqreturn_t psb_irq_handler(int irq, void *arg)
+static irqreturn_t psb_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
 	struct drm_psb_private *dev_priv = dev->dev_private;
@@ -304,7 +305,7 @@ void psb_irq_preinstall(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 }
 
-int psb_irq_postinstall(struct drm_device *dev)
+void psb_irq_postinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
@@ -332,12 +333,31 @@ int psb_irq_postinstall(struct drm_device *dev)
 		dev_priv->ops->hotplug_enable(dev, true);
 
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
+}
+
+int psb_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	psb_irq_preinstall(dev);
+
+	/* PCI devices require shared interrupts. */
+	ret = request_irq(irq, psb_irq_handler, IRQF_SHARED, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	psb_irq_postinstall(dev);
+
 	return 0;
 }
 
 void psb_irq_uninstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -366,6 +386,8 @@ void psb_irq_uninstall(struct drm_device *dev)
 	/* This register is safe even if display island is off */
 	PSB_WVDC32(PSB_RVDC32(PSB_INT_IDENTITY_R), PSB_INT_IDENTITY_R);
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
+
+	free_irq(pdev->irq, dev);
 }
 
 /*
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index 17c9b0b62471..a97cb49393d8 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -19,9 +19,9 @@ bool sysirq_init(struct drm_device *dev);
 void sysirq_uninit(struct drm_device *dev);
 
 void psb_irq_preinstall(struct drm_device *dev);
-int  psb_irq_postinstall(struct drm_device *dev);
+void psb_irq_postinstall(struct drm_device *dev);
+int  psb_irq_install(struct drm_device *dev, unsigned int irq);
 void psb_irq_uninstall(struct drm_device *dev);
-irqreturn_t psb_irq_handler(int irq, void *arg);
 
 int  psb_enable_vblank(struct drm_crtc *crtc);
 void psb_disable_vblank(struct drm_crtc *crtc);
-- 
2.32.0

