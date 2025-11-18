Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFBC69A19
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0187510E4BF;
	Tue, 18 Nov 2025 13:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KxaKJHRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921ED10E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:39:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7D2BB1A1B86;
 Tue, 18 Nov 2025 13:39:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4EF0E606FE;
 Tue, 18 Nov 2025 13:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A893710371DD3; Tue, 18 Nov 2025 14:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763473158; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=+5BtD6UXAzSoODFJ0HtV1TARfbnO74SaTKUs4pCZoxo=;
 b=KxaKJHRmfqTlJw6wcWE+4fak/MCoHFUHILBP8MP5Y6Nc9II/kbbhKwizdIIRW7VyjNevec
 VQEwr3rdp2KAsFTeTwaSQgWJvtFxgo14EC9T1j713YltOpk3jl/MMeQI9k0CFsM1nhHW3f
 0NuW0jI74cUZG+xpoXIpGsgdS9mCGBQFLjTLpxqDs/sWnUI4HV2aFEIgbEz2+LYZHmDVED
 A9t4EaSzmaGAK1819MkOTIsHCH+HQswyXF6YLzXBM9WhS3SdqWlo0532N+GOS7g7uherzo
 26qaJ+fZqDnWe14Di81L9madRnm5AfFKdRDDMN7VayWQO5nzueSya6A5svbC6g==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 stable@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3] drm/tilcdc: Fix removal actions in case of failed probe
Date: Tue, 18 Nov 2025 14:38:48 +0100
Message-ID: <20251118133850.125561-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
should only be called when the device has been successfully registered.
Currently, these functions are called unconditionally in tilcdc_fini(),
which causes warnings during probe deferral scenarios.

[    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_state_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
...
[    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_get_crtc_state+0x68/0x108
[    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0x1c8
[    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x90/0x144
[    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc]
[    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [tilcdc]

Fix this by rewriting the failed probe cleanup path using the standard
goto error handling pattern, which ensures that cleanup functions are
only called on successfully initialized resources. Additionally, remove
the now-unnecessary is_registered flag.

Cc: stable@vger.kernel.org
Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers")
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

I'm working on removing the usage of deprecated functions as well as
general improvements to this driver, but it will take some time so for
now this is a simple fix to a functional bug.

Change in v3:
- Rewrite the failed probe clean up path using goto
- Remove the is_registered flag

Change in v2:
- Add missing cc: stable tag
- Add Swamil reviewed-by
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 53 ++++++++++++++++++----------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 +-
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 5718d9d83a49f..52c95131af5af 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -586,7 +586,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 	drm_modeset_unlock(&crtc->mutex);
 }
 
-static void tilcdc_crtc_destroy(struct drm_crtc *crtc)
+void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 7caec4d38ddf0..2a88cce445b8f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -172,8 +172,7 @@ static void tilcdc_fini(struct drm_device *dev)
 	if (priv->crtc)
 		tilcdc_crtc_shutdown(priv->crtc);
 
-	if (priv->is_registered)
-		drm_dev_unregister(dev);
+	drm_dev_unregister(dev);
 
 	drm_kms_helper_poll_fini(dev);
 	drm_atomic_helper_shutdown(dev);
@@ -220,21 +219,21 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
 	if (!priv->wq) {
 		ret = -ENOMEM;
-		goto init_failed;
+		goto put_drm;
 	}
 
 	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->mmio)) {
 		dev_err(dev, "failed to request / ioremap\n");
 		ret = PTR_ERR(priv->mmio);
-		goto init_failed;
+		goto free_wq;
 	}
 
 	priv->clk = clk_get(dev, "fck");
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "failed to get functional clock\n");
 		ret = -ENODEV;
-		goto init_failed;
+		goto free_wq;
 	}
 
 	pm_runtime_enable(dev);
@@ -313,7 +312,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
 		dev_err(dev, "failed to create crtc\n");
-		goto init_failed;
+		goto disable_pm;
 	}
 	modeset_init(ddev);
 
@@ -324,46 +323,46 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (ret) {
 		dev_err(dev, "failed to register cpufreq notifier\n");
 		priv->freq_transition.notifier_call = NULL;
-		goto init_failed;
+		goto destroy_crtc;
 	}
 #endif
 
 	if (priv->is_componentized) {
 		ret = component_bind_all(dev, ddev);
 		if (ret < 0)
-			goto init_failed;
+			goto unregister_cpufreq_notif;
 
 		ret = tilcdc_add_component_encoder(ddev);
 		if (ret < 0)
-			goto init_failed;
+			goto unbind_component;
 	} else {
 		ret = tilcdc_attach_external_device(ddev);
 		if (ret)
-			goto init_failed;
+			goto unregister_cpufreq_notif;
 	}
 
 	if (!priv->external_connector &&
 	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
-		goto init_failed;
+		goto unbind_component;
 	}
 
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(dev, "failed to initialize vblank\n");
-		goto init_failed;
+		goto unbind_component;
 	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto init_failed;
+		goto unbind_component;
 	priv->irq = ret;
 
 	ret = tilcdc_irq_install(ddev, priv->irq);
 	if (ret < 0) {
 		dev_err(dev, "failed to install IRQ handler\n");
-		goto init_failed;
+		goto unbind_component;
 	}
 
 	drm_mode_config_reset(ddev);
@@ -372,16 +371,34 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto init_failed;
-	priv->is_registered = true;
+		goto stop_poll;
 
 	drm_client_setup_with_color_mode(ddev, bpp);
 
 	return 0;
 
-init_failed:
-	tilcdc_fini(ddev);
+stop_poll:
+	drm_kms_helper_poll_fini(ddev);
+	tilcdc_irq_uninstall(ddev);
+unbind_component:
+	if (priv->is_componentized)
+		component_unbind_all(dev, ddev);
+unregister_cpufreq_notif:
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&priv->freq_transition,
+				    CPUFREQ_TRANSITION_NOTIFIER);
+#endif
+destroy_crtc:
+	tilcdc_crtc_destroy(priv->crtc);
+disable_pm:
+	pm_runtime_disable(dev);
+	clk_put(priv->clk);
+free_wq:
+	destroy_workqueue(priv->wq);
+put_drm:
 	platform_set_drvdata(pdev, NULL);
+	ddev->dev_private = NULL;
+	drm_dev_put(ddev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index b818448c83f61..58b276f82a669 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -82,7 +82,6 @@ struct tilcdc_drm_private {
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 
-	bool is_registered;
 	bool is_componentized;
 	bool irq_enabled;
 };
@@ -164,6 +163,7 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
 					bool simulate_vesa_sync);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
+void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 		struct drm_framebuffer *fb,
 		struct drm_pending_vblank_event *event);
-- 
2.43.0

