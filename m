Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D83D7D96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0816EC71;
	Tue, 27 Jul 2021 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED96EA98;
 Tue, 27 Jul 2021 18:27:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6B9020173;
 Tue, 27 Jul 2021 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPu3oBJ4tIyHmLkIL77SV15tUaWbOHok/CzO8aWhemY=;
 b=ppi1JLoJUarFuLT7Fd+ZqtUrGoUqNPAQhNr9ZoS899rk9mxbp+6eB5kj7WY0f+a5Mzpoa4
 RfD+uqmhHNcDwQrY2qZZmztsaI3BBGP3MHWlUf3tgUC2+UYuPXzB7kueVusLMYsX2BZg0P
 vMFd1+hfBemxgvPP37xHgyURsoVZi90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPu3oBJ4tIyHmLkIL77SV15tUaWbOHok/CzO8aWhemY=;
 b=nQqI2l27jxQZzDhdyilaw9r+t2OPhxtSj8LwaXECJ+R9HzC7AKEZkUwIiIM2q1+HWtKdwC
 uOgrniRFsEcqcFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48E0D13B86;
 Tue, 27 Jul 2021 18:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJvYEA5QAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 06/14] drm/kmb: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:13 +0200
Message-Id: <20210727182721.17981-7-tzimmermann@suse.de>
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
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 96ea1a2c11dd..be192f6da9f1 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -17,7 +17,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -399,14 +398,29 @@ static void kmb_irq_reset(struct drm_device *drm)
 	kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
 }
 
+static int kmb_irq_install(struct drm_device *drm, unsigned int irq)
+{
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	kmb_irq_reset(drm);
+
+	return request_irq(irq, kmb_isr, 0, drm->driver->name, drm);
+}
+
+static void kmb_irq_uninstall(struct drm_device *drm)
+{
+	struct kmb_drm_private *kmb = to_kmb(drm);
+
+	kmb_irq_reset(drm);
+	free_irq(kmb->irq_lcd, drm);
+}
+
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver kmb_driver = {
 	.driver_features = DRIVER_GEM |
 	    DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler = kmb_isr,
-	.irq_preinstall = kmb_irq_reset,
-	.irq_uninstall = kmb_irq_reset,
 	/* GEM Operations */
 	.fops = &fops,
 	DRM_GEM_CMA_DRIVER_OPS_VMAP,
@@ -428,7 +442,7 @@ static int kmb_remove(struct platform_device *pdev)
 	of_node_put(kmb->crtc.port);
 	kmb->crtc.port = NULL;
 	pm_runtime_get_sync(drm->dev);
-	drm_irq_uninstall(drm);
+	kmb_irq_uninstall(drm);
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
@@ -518,7 +532,7 @@ static int kmb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
-	ret = drm_irq_install(&kmb->drm, kmb->irq_lcd);
+	ret = kmb_irq_install(&kmb->drm, kmb->irq_lcd);
 	if (ret < 0) {
 		drm_err(&kmb->drm, "failed to install IRQ handler\n");
 		goto err_irq;
-- 
2.32.0

