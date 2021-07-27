Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057C3D7D94
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898996EC4B;
	Tue, 27 Jul 2021 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737746EA98;
 Tue, 27 Jul 2021 18:27:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECB0320174;
 Tue, 27 Jul 2021 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTDs6Q7T7xPbfvfH4CPrAxJflSyiOEr62IuHUEP3CnY=;
 b=EPchIdGK2wYHwLQ8tcVVDieEamTUyzEgno7kjr25Qzjet8ZWsBhZ8XbHStXVBMRMDqoCy3
 Z+KVHoHCKrnLRePh9294eP3Gp9YxzVWHneNBglQCX+UgAvk7lrnP9d10reX2r1tjqDF37P
 DGk/jmUZWhSxdx+0Dqcwq+hffdyN19s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTDs6Q7T7xPbfvfH4CPrAxJflSyiOEr62IuHUEP3CnY=;
 b=JyAIXFvs7OPVN0eLEaw0wCQH19m15JkVsnN0GcYkDluY6b4tQ4VI3P+gC2W44zEMHpPCVY
 3hnkLfmiOmqKNRBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6425013B86;
 Tue, 27 Jul 2021 18:27:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UGl/Fw9QAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 08/14] drm/mxsfb: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:15 +0200
Message-Id: <20210727182721.17981-9-tzimmermann@suse.de>
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

Calls to platform_get_irq() can fail with a negative errno code.
Abort initialization in this case. The DRM IRQ midlayer does not
handle this case correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 81 +++++++++++++++++++------------
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 +
 2 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6da93551e2e5..b5212f5bf04a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -24,7 +24,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -150,6 +149,49 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	return 0;
 }
 
+static irqreturn_t mxsfb_irq_handler(int irq, void *data)
+{
+	struct drm_device *drm = data;
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+	u32 reg;
+
+	reg = readl(mxsfb->base + LCDC_CTRL1);
+
+	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
+		drm_crtc_handle_vblank(&mxsfb->crtc);
+
+	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+
+	return IRQ_HANDLED;
+}
+
+static void mxsfb_irq_disable(struct drm_device *drm)
+{
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+
+	mxsfb_enable_axi_clk(mxsfb);
+	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
+	mxsfb_disable_axi_clk(mxsfb);
+}
+
+static int mxsfb_irq_install(struct drm_device *dev, int irq)
+{
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	mxsfb_irq_disable(dev);
+
+	return request_irq(irq, mxsfb_irq_handler, 0,  dev->driver->name, dev);
+}
+
+static void mxsfb_irq_uninstall(struct drm_device *dev)
+{
+	struct mxsfb_drm_private *mxsfb = dev->dev_private;
+
+	mxsfb_irq_disable(dev);
+	free_irq(mxsfb->irq, dev);
+}
+
 static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
@@ -223,8 +265,13 @@ static int mxsfb_load(struct drm_device *drm,
 
 	drm_mode_config_reset(drm);
 
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_vblank;
+	mxsfb->irq = ret;
+
 	pm_runtime_get_sync(drm->dev);
-	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
+	ret = mxsfb_irq_install(drm, mxsfb->irq);
 	pm_runtime_put_sync(drm->dev);
 
 	if (ret < 0) {
@@ -252,7 +299,7 @@ static void mxsfb_unload(struct drm_device *drm)
 	drm_mode_config_cleanup(drm);
 
 	pm_runtime_get_sync(drm->dev);
-	drm_irq_uninstall(drm);
+	mxsfb_irq_uninstall(drm);
 	pm_runtime_put_sync(drm->dev);
 
 	drm->dev_private = NULL;
@@ -260,38 +307,10 @@ static void mxsfb_unload(struct drm_device *drm)
 	pm_runtime_disable(drm->dev);
 }
 
-static void mxsfb_irq_disable(struct drm_device *drm)
-{
-	struct mxsfb_drm_private *mxsfb = drm->dev_private;
-
-	mxsfb_enable_axi_clk(mxsfb);
-	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
-	mxsfb_disable_axi_clk(mxsfb);
-}
-
-static irqreturn_t mxsfb_irq_handler(int irq, void *data)
-{
-	struct drm_device *drm = data;
-	struct mxsfb_drm_private *mxsfb = drm->dev_private;
-	u32 reg;
-
-	reg = readl(mxsfb->base + LCDC_CTRL1);
-
-	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
-		drm_crtc_handle_vblank(&mxsfb->crtc);
-
-	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-
-	return IRQ_HANDLED;
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver mxsfb_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler		= mxsfb_irq_handler,
-	.irq_preinstall		= mxsfb_irq_disable,
-	.irq_uninstall		= mxsfb_irq_disable,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops	= &fops,
 	.name	= "mxsfb-drm",
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 399d23e91ed1..75f426e89b10 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -32,6 +32,8 @@ struct mxsfb_drm_private {
 	struct clk			*clk_axi;
 	struct clk			*clk_disp_axi;
 
+	unsigned int			irq;
+
 	struct drm_device		*drm;
 	struct {
 		struct drm_plane	primary;
-- 
2.32.0

