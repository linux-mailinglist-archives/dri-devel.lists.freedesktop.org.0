Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938453D7D97
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09986EC84;
	Tue, 27 Jul 2021 18:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3966EBFF;
 Tue, 27 Jul 2021 18:27:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6122922239;
 Tue, 27 Jul 2021 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rs6h546CLRMtcSyxepD7Mn/Nsf/jiBpO5HOQCWyBNTo=;
 b=SQ+MjwxOAssb5TOqh295ewENYw3tBiVO/plZKclOEum6hF2v8FluGZHRKLoNOqIzlhQjFY
 hO5DN1xxcpLRR9wMFFCSOK/ZrhA2EJGaBkHA2AG6TYSUKHncim3t2wRNFeNzQiSQa+nBLQ
 UkejJ3EzzPxT+ljfaVJXRBznvi8Csnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rs6h546CLRMtcSyxepD7Mn/Nsf/jiBpO5HOQCWyBNTo=;
 b=25rjT4MUF+m8mAVR7hu4Fzy0LZx6zVInCki6vojHl02HI6iTyKxEKx0W73AVZ56HWi0ofn
 CVv9sT6IOGnVqEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D38B813E9D;
 Tue, 27 Jul 2021 18:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aCNlMg5QAGGwGQAAMHmgww
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
Subject: [PATCH 07/14] drm/msm: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:14 +0200
Message-Id: <20210727182721.17981-8-tzimmermann@suse.de>
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
 drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++--------------
 drivers/gpu/drm/msm/msm_kms.h |   2 +-
 2 files changed, 69 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..6180cba5da32 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -14,7 +14,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
@@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 or)
 	msm_writel(val | or, addr);
 }
 
+static irqreturn_t msm_irq(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	return kms->funcs->irq(kms);
+}
+
+static void msm_irq_preinstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	kms->funcs->irq_preinstall(kms);
+}
+
+static int msm_irq_postinstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	if (kms->funcs->irq_postinstall)
+		return kms->funcs->irq_postinstall(kms);
+
+	return 0;
+}
+
+static int msm_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	msm_irq_preinstall(dev);
+
+	ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	ret = msm_irq_postinstall(dev);
+	if (ret) {
+		free_irq(irq, dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void msm_irq_uninstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	kms->funcs->irq_uninstall(kms);
+	free_irq(kms->irq, dev);
+}
+
 struct msm_vblank_work {
 	struct work_struct work;
 	int crtc_id;
@@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
 	}
 
 	/* We must cancel and cleanup any pending vblank enable/disable
-	 * work before drm_irq_uninstall() to avoid work re-enabling an
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
 	 */
 
@@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
 	drm_mode_config_cleanup(ddev);
 
 	pm_runtime_get_sync(dev);
-	drm_irq_uninstall(ddev);
+	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
 
 	if (kms && kms->funcs)
@@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	if (kms) {
 		pm_runtime_get_sync(dev);
-		ret = drm_irq_install(ddev, kms->irq);
+		ret = msm_irq_install(ddev, kms->irq);
 		pm_runtime_put_sync(dev);
 		if (ret < 0) {
 			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
@@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-static irqreturn_t msm_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	BUG_ON(!kms);
-	return kms->funcs->irq(kms);
-}
-
-static void msm_irq_preinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	BUG_ON(!kms);
-	kms->funcs->irq_preinstall(kms);
-}
-
-static int msm_irq_postinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	BUG_ON(!kms);
-
-	if (kms->funcs->irq_postinstall)
-		return kms->funcs->irq_postinstall(kms);
-
-	return 0;
-}
-
-static void msm_irq_uninstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	BUG_ON(!kms);
-	kms->funcs->irq_uninstall(kms);
-}
-
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1025,10 +1052,6 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose           = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
-	.irq_handler        = msm_irq,
-	.irq_preinstall     = msm_irq_preinstall,
-	.irq_postinstall    = msm_irq_postinstall,
-	.irq_uninstall      = msm_irq_uninstall,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9de7c42e1071 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -150,7 +150,7 @@ struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
 
-	/* irq number to be passed on to drm_irq_install */
+	/* irq number to be passed on to msm_irq_install */
 	int irq;
 
 	/* mapper-id used to request GEM buffer mapped for scanout: */
-- 
2.32.0

