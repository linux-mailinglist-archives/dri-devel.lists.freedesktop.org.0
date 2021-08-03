Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42503DE971
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 11:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A8F6E81A;
	Tue,  3 Aug 2021 09:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCDF6E5CC;
 Tue,  3 Aug 2021 09:07:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35268220C5;
 Tue,  3 Aug 2021 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUIwxSXujnwmxMgqKoUrWAvRU6gA7ZEEXCE1bQ/pv5Q=;
 b=Blc18c82yjLuRP9Jfy3BjzQlunRl4/WvGdUKodFDCmKWLKXDdK10Qyc/heWWTODgfQGOPV
 GdasUuIriMPL/Xg3xZE9NFPdICmepuUX0FrL+JM3k0UUYHIp0M6MqK/A4dOfRrbnH/P9vc
 H1EmpJGj0kO7f2EVjXaJ8zsHbf/OyRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981635;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUIwxSXujnwmxMgqKoUrWAvRU6gA7ZEEXCE1bQ/pv5Q=;
 b=OjHdE/oXykgUi4OnHHNYKI+hXqYBuGsSnqaH8s42koDgor3iXniS7M0kZaFv5HfUIjrPK7
 aVQH1Om0khF8IdAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62B0F13CC4;
 Tue,  3 Aug 2021 09:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wHbaFkIHCWFVJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 Dan.Sneddon@microchip.com, tomi.valkeinen@ideasonboard.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/14] drm/tidss: Convert to Linux IRQ interfaces
Date: Tue,  3 Aug 2021 11:07:00 +0200
Message-Id: <20210803090704.32152-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 15 +++++----------
 drivers/gpu/drm/tidss/tidss_drv.h |  2 ++
 drivers/gpu/drm/tidss/tidss_irq.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/tidss/tidss_irq.h |  4 +---
 4 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 66e3c86eb5c7..d620f35688da 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -16,7 +16,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
@@ -118,11 +117,6 @@ static const struct drm_driver tidss_driver = {
 	.date			= "20180215",
 	.major			= 1,
 	.minor			= 0,
-
-	.irq_preinstall		= tidss_irq_preinstall,
-	.irq_postinstall	= tidss_irq_postinstall,
-	.irq_handler		= tidss_irq_handler,
-	.irq_uninstall		= tidss_irq_uninstall,
 };
 
 static int tidss_probe(struct platform_device *pdev)
@@ -172,10 +166,11 @@ static int tidss_probe(struct platform_device *pdev)
 		ret = irq;
 		goto err_runtime_suspend;
 	}
+	tidss->irq = irq;
 
-	ret = drm_irq_install(ddev, irq);
+	ret = tidss_irq_install(ddev, irq);
 	if (ret) {
-		dev_err(dev, "drm_irq_install failed: %d\n", ret);
+		dev_err(dev, "tidss_irq_install failed: %d\n", ret);
 		goto err_runtime_suspend;
 	}
 
@@ -196,7 +191,7 @@ static int tidss_probe(struct platform_device *pdev)
 	return 0;
 
 err_irq_uninstall:
-	drm_irq_uninstall(ddev);
+	tidss_irq_uninstall(ddev);
 
 err_runtime_suspend:
 #ifndef CONFIG_PM
@@ -219,7 +214,7 @@ static int tidss_remove(struct platform_device *pdev)
 
 	drm_atomic_helper_shutdown(ddev);
 
-	drm_irq_uninstall(ddev);
+	tidss_irq_uninstall(ddev);
 
 #ifndef CONFIG_PM
 	/* If we don't have PM, we need to call suspend manually */
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 7de4bba52e6f..d7f27b0b0315 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -27,6 +27,8 @@ struct tidss_device {
 	unsigned int num_planes;
 	struct drm_plane *planes[TIDSS_MAX_PLANES];
 
+	unsigned int irq;
+
 	spinlock_t wait_lock;	/* protects the irq masks */
 	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
 };
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 2ed3e3296776..0c681c7600bc 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -4,6 +4,9 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
+#include <linux/platform_device.h>
+
+#include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
 #include "tidss_crtc.h"
@@ -50,7 +53,7 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&tidss->wait_lock, flags);
 }
 
-irqreturn_t tidss_irq_handler(int irq, void *arg)
+static irqreturn_t tidss_irq_handler(int irq, void *arg)
 {
 	struct drm_device *ddev = (struct drm_device *)arg;
 	struct tidss_device *tidss = to_tidss(ddev);
@@ -90,7 +93,7 @@ void tidss_irq_resume(struct tidss_device *tidss)
 	spin_unlock_irqrestore(&tidss->wait_lock, flags);
 }
 
-void tidss_irq_preinstall(struct drm_device *ddev)
+static void tidss_irq_preinstall(struct drm_device *ddev)
 {
 	struct tidss_device *tidss = to_tidss(ddev);
 
@@ -104,7 +107,7 @@ void tidss_irq_preinstall(struct drm_device *ddev)
 	tidss_runtime_put(tidss);
 }
 
-int tidss_irq_postinstall(struct drm_device *ddev)
+static void tidss_irq_postinstall(struct drm_device *ddev)
 {
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
@@ -129,6 +132,22 @@ int tidss_irq_postinstall(struct drm_device *ddev)
 	spin_unlock_irqrestore(&tidss->wait_lock, flags);
 
 	tidss_runtime_put(tidss);
+}
+
+int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	tidss_irq_preinstall(ddev);
+
+	ret = request_irq(irq, tidss_irq_handler, 0, ddev->driver->name, ddev);
+	if (ret)
+		return ret;
+
+	tidss_irq_postinstall(ddev);
 
 	return 0;
 }
@@ -140,4 +159,6 @@ void tidss_irq_uninstall(struct drm_device *ddev)
 	tidss_runtime_get(tidss);
 	dispc_set_irqenable(tidss->dispc, 0);
 	tidss_runtime_put(tidss);
+
+	free_irq(tidss->irq, ddev);
 }
diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
index 4aaad5dfd7c2..b512614d5863 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.h
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -67,10 +67,8 @@ struct tidss_device;
 void tidss_irq_enable_vblank(struct drm_crtc *crtc);
 void tidss_irq_disable_vblank(struct drm_crtc *crtc);
 
-void tidss_irq_preinstall(struct drm_device *ddev);
-int tidss_irq_postinstall(struct drm_device *ddev);
+int tidss_irq_install(struct drm_device *ddev, unsigned int irq);
 void tidss_irq_uninstall(struct drm_device *ddev);
-irqreturn_t tidss_irq_handler(int irq, void *arg);
 
 void tidss_irq_resume(struct tidss_device *tidss);
 
-- 
2.32.0

