Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFbaIS+ec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1E783C0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042B10EB57;
	Fri, 23 Jan 2026 16:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="w8WeRvCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB34D10EB4C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CF53EC20308;
 Fri, 23 Jan 2026 16:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 813166070A;
 Fri, 23 Jan 2026 16:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78A5D119A87E0; Fri, 23 Jan 2026 17:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ibZAathq4lMpPo05z4ZCvxH91vRfrI9NTGtwZ/tdnz8=;
 b=w8WeRvCMLit8vyNbmoaAFTBH25C9mWkyPMnN0Xpu0GymCOIDHznS3WHqY50Z/57pIEyQa8
 oFeyPohbvyX4tAusjBn1CYRrZolMdvuM++Gcaz4TOKDxtPgTTcy87cijTPIeS+LzunMgTK
 /e9eYAB9gsI1jO2Udb72NXOomtY0ctoDeltWZzinJQO81xo6csyynPyt1zQra9IylM3pVt
 daqPzS1zeTVI+PW4Mi31aghZC/L8DlnQkeMr462OiN9pUhS3BQiea+UA7iQNIfoYTYnORW
 HYOJjxmgQYMsfce/0DbSpuPLotZtXE9ZvmYmgjSL9FcFUiyDJ/Rv978nfOTDbA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:33 +0100
Subject: [PATCH v5 15/25] drm/tilcdc: Move tilcdc_init/fini closer to
 probe/remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-15-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	BLOCKLISTDE_FAIL(0.00)[212.83.136.155:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 3AD1E783C0
X-Rspamd-Action: no action

Move tilcdc_init/fini functions adjacent to the probe and remove functions
in preparation for cleanup and modernization. This improves readability
for subsequent commits that will refactor these functions.

No functional changes, only code reorganization.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 238 ++++++++++++++++++------------------
 1 file changed, 119 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 97380b623fca3..abe432b752dc0 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -140,6 +140,125 @@ static void tilcdc_irq_uninstall(struct drm_device *dev)
  * DRM operations:
  */
 
+#if defined(CONFIG_DEBUG_FS)
+static const struct {
+	const char *name;
+	uint8_t  rev;
+	uint8_t  save;
+	uint32_t reg;
+} registers[] =		{
+#define REG(rev, save, reg) { #reg, rev, save, reg }
+		/* exists in revision 1: */
+		REG(1, false, LCDC_PID_REG),
+		REG(1, true,  LCDC_CTRL_REG),
+		REG(1, false, LCDC_STAT_REG),
+		REG(1, true,  LCDC_RASTER_CTRL_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
+		REG(1, true,  LCDC_DMA_CTRL_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
+		/* new in revision 2: */
+		REG(2, false, LCDC_RAW_STAT_REG),
+		REG(2, false, LCDC_MASKED_STAT_REG),
+		REG(2, true, LCDC_INT_ENABLE_SET_REG),
+		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
+		REG(2, false, LCDC_END_OF_INT_IND_REG),
+		REG(2, true,  LCDC_CLK_ENABLE_REG),
+#undef REG
+};
+
+static int tilcdc_regs_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct tilcdc_drm_private *priv = dev->dev_private;
+	unsigned i;
+
+	pm_runtime_get_sync(dev->dev);
+
+	seq_printf(m, "revision: %d\n", priv->rev);
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++)
+		if (priv->rev >= registers[i].rev)
+			seq_printf(m, "%s:\t %08x\n", registers[i].name,
+					tilcdc_read(dev, registers[i].reg));
+
+	pm_runtime_put_sync(dev->dev);
+
+	return 0;
+}
+
+static int tilcdc_mm_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
+	return 0;
+}
+
+static struct drm_info_list tilcdc_debugfs_list[] = {
+		{ "regs", tilcdc_regs_show, 0, NULL },
+		{ "mm",   tilcdc_mm_show,   0, NULL },
+};
+
+static void tilcdc_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(tilcdc_debugfs_list,
+				 ARRAY_SIZE(tilcdc_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+#endif
+
+DEFINE_DRM_GEM_DMA_FOPS(fops);
+
+static const struct drm_driver tilcdc_driver = {
+	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = tilcdc_debugfs_init,
+#endif
+	.fops               = &fops,
+	.name               = "tilcdc",
+	.desc               = "TI LCD Controller DRM",
+	.major              = 1,
+	.minor              = 0,
+};
+
+/*
+ * Power management:
+ */
+
+static int tilcdc_pm_suspend(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = drm_mode_config_helper_suspend(ddev);
+
+	/* Select sleep pin state */
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+static int tilcdc_pm_resume(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+
+	/* Select default pin state */
+	pinctrl_pm_select_default_state(dev);
+	return  drm_mode_config_helper_resume(ddev);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
+				tilcdc_pm_suspend, tilcdc_pm_resume);
+
 static void tilcdc_fini(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = dev->dev_private;
@@ -375,125 +494,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	return ret;
 }
 
-#if defined(CONFIG_DEBUG_FS)
-static const struct {
-	const char *name;
-	uint8_t  rev;
-	uint8_t  save;
-	uint32_t reg;
-} registers[] =		{
-#define REG(rev, save, reg) { #reg, rev, save, reg }
-		/* exists in revision 1: */
-		REG(1, false, LCDC_PID_REG),
-		REG(1, true,  LCDC_CTRL_REG),
-		REG(1, false, LCDC_STAT_REG),
-		REG(1, true,  LCDC_RASTER_CTRL_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
-		REG(1, true,  LCDC_DMA_CTRL_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
-		/* new in revision 2: */
-		REG(2, false, LCDC_RAW_STAT_REG),
-		REG(2, false, LCDC_MASKED_STAT_REG),
-		REG(2, true, LCDC_INT_ENABLE_SET_REG),
-		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
-		REG(2, false, LCDC_END_OF_INT_IND_REG),
-		REG(2, true,  LCDC_CLK_ENABLE_REG),
-#undef REG
-};
-
-static int tilcdc_regs_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	unsigned i;
-
-	pm_runtime_get_sync(dev->dev);
-
-	seq_printf(m, "revision: %d\n", priv->rev);
-
-	for (i = 0; i < ARRAY_SIZE(registers); i++)
-		if (priv->rev >= registers[i].rev)
-			seq_printf(m, "%s:\t %08x\n", registers[i].name,
-					tilcdc_read(dev, registers[i].reg));
-
-	pm_runtime_put_sync(dev->dev);
-
-	return 0;
-}
-
-static int tilcdc_mm_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
-	return 0;
-}
-
-static struct drm_info_list tilcdc_debugfs_list[] = {
-		{ "regs", tilcdc_regs_show, 0, NULL },
-		{ "mm",   tilcdc_mm_show,   0, NULL },
-};
-
-static void tilcdc_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(tilcdc_debugfs_list,
-				 ARRAY_SIZE(tilcdc_debugfs_list),
-				 minor->debugfs_root, minor);
-}
-#endif
-
-DEFINE_DRM_GEM_DMA_FOPS(fops);
-
-static const struct drm_driver tilcdc_driver = {
-	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	DRM_GEM_DMA_DRIVER_OPS,
-	DRM_FBDEV_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init       = tilcdc_debugfs_init,
-#endif
-	.fops               = &fops,
-	.name               = "tilcdc",
-	.desc               = "TI LCD Controller DRM",
-	.major              = 1,
-	.minor              = 0,
-};
-
-/*
- * Power management:
- */
-
-static int tilcdc_pm_suspend(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	int ret = 0;
-
-	ret = drm_mode_config_helper_suspend(ddev);
-
-	/* Select sleep pin state */
-	pinctrl_pm_select_sleep_state(dev);
-
-	return ret;
-}
-
-static int tilcdc_pm_resume(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-
-	/* Select default pin state */
-	pinctrl_pm_select_default_state(dev);
-	return  drm_mode_config_helper_resume(ddev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
-				tilcdc_pm_suspend, tilcdc_pm_resume);
-
 static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
 	/* bail out early if no DT data: */

-- 
2.43.0

