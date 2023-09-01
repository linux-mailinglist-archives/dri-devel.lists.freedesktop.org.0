Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC98790414
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A010E7D9;
	Fri,  1 Sep 2023 23:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDDD10E7D9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:40:59 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1c11d53221cso1626009fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611658; x=1694216458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1eWAYznHaK0aWczuNWbSMuURPigxfjsQS0xy+Sev48=;
 b=RTHeQ2VKl+UYMlEd8padi15t6ORIaw0D+3q7l505DUwBrS5RF21A63GiqRpNksZRE2
 ER2dn2ZImntoSxyTCNXd7PWC0mwG1aVXbQczSGTs5/fCMFCUW4tOwe7gg1SqisSIXMt9
 tyg1W/bnZVR5rKWer/IpgCyVpz09x142J8hxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611658; x=1694216458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1eWAYznHaK0aWczuNWbSMuURPigxfjsQS0xy+Sev48=;
 b=O9nf8S3tVvtfcj1uDxPv8A4RlX2+9xQ6uH3FV1ktv/fe03Ed1oRttzGoHRelGyOAKR
 Sf7zh/2WMOZQ4+5oDY1DmF5NjpJ7DXzTO/7dUWxp2mN+wRany0OIn4reuwTgiGjXraLS
 vWuMVnyULHMcGo0JpQD+NmBsqYeBPB/JJK8lTDdVYfsfaV03ktzMbJJOSI+yQAxluMre
 yB52E43Hw/iubyXuII60FtZA+RyvZ9Fmu0RQgwl4rio2bhhPvhxtvyrp+dqHyq4zaRYq
 T2VGXKNhz4OFBILbnOtFs7raI0Yh4uU0SVBRfQDLvHfMi5H+41CMY/MMyCHr3tTpXidB
 tDIA==
X-Gm-Message-State: AOJu0Yz7ahpvqvCe4pXTAXw++aPVLeIdqmx+MypyGCDozWK56cXWa7ri
 wnJrSmR8dTakd+z5BQCjl0pJFDbWUm7ntl2h+IsVn38B
X-Google-Smtp-Source: AGHT+IHWh0EZjB4sRwdO+sv2azBowUIC3rylFr9w/wT3XrqIi1O/kU8t1TW+RVuuA1jXai1FluM7wA==
X-Received: by 2002:a05:6870:e2d4:b0:1d0:f067:bf23 with SMTP id
 w20-20020a056870e2d400b001d0f067bf23mr4176763oad.25.1693611658361; 
 Fri, 01 Sep 2023 16:40:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 5/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown/remove time for misc drivers
Date: Fri,  1 Sep 2023 16:39:56 -0700
Message-ID: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
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
Cc: linux-aspeed@lists.ozlabs.org, tomi.valkeinen@ideasonboard.com,
 alexandre.torgue@foss.st.com, Douglas Anderson <dianders@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com, emma@anholt.net, joel@jms.id.au,
 airlied@redhat.com, tzimmermann@suse.de, raphael.gallais-pou@foss.st.com,
 hdegoede@redhat.com, linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 andrew@aj.id.au, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, jyri.sarha@iki.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code these drivers appear to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time
and at driver remove (or unbind) time. Among other things, this means
that if a panel is in use that it won't be cleanly powered off at
system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart and at driver remove (or unbind) time comes
straight out of the kernel doc "driver instance overview" in
drm_drv.c.

A few notes about these fixes:
- I confirmed that these drivers were all DRIVER_MODESET type drivers,
  which I believe makes this relevant.
- I confirmed that these drivers were all DRIVER_ATOMIC.
- When adding drm_atomic_helper_shutdown() to the remove/unbind path,
  I added it after drm_kms_helper_poll_fini() when the driver had
  it. This seemed to be what other drivers did. If
  drm_kms_helper_poll_fini() wasn't there I added it straight after
  drm_dev_unregister().
- This patch deals with drivers using the component model in similar
  ways as the patch ("drm: Call drm_atomic_helper_shutdown() at
  shutdown time for misc drivers")
- These fixes rely on the patch ("drm/atomic-helper:
  drm_atomic_helper_shutdown(NULL) should be a noop") to simplify
  shutdown.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  7 +++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  8 ++++++++
 drivers/gpu/drm/pl111/pl111_drv.c       |  7 +++++++
 drivers/gpu/drm/stm/drv.c               |  7 +++++++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 ++++++++++-
 drivers/gpu/drm/tve200/tve200_drv.c     |  7 +++++++
 drivers/gpu/drm/vboxvideo/vbox_drv.c    | 10 ++++++++++
 7 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d207b03f8357..78122b35a0cb 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -358,11 +358,18 @@ static void aspeed_gfx_remove(struct platform_device *pdev)
 	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void aspeed_gfx_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
 }
 
 static struct platform_driver aspeed_gfx_platform_driver = {
 	.probe		= aspeed_gfx_probe,
 	.remove_new	= aspeed_gfx_remove,
+	.shutdown	= aspeed_gfx_shutdown,
 	.driver = {
 		.name = "aspeed_gfx",
 		.of_match_table = aspeed_gfx_match,
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index abddf37f0ea1..2fb18b782b05 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_file.h>
@@ -278,6 +279,12 @@ static void mgag200_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
+	drm_atomic_helper_shutdown(dev);
+}
+
+static void mgag200_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
 }
 
 static struct pci_driver mgag200_pci_driver = {
@@ -285,6 +292,7 @@ static struct pci_driver mgag200_pci_driver = {
 	.id_table = mgag200_pciidlist,
 	.probe = mgag200_pci_probe,
 	.remove = mgag200_pci_remove,
+	.shutdown = mgag200_pci_shutdown,
 };
 
 drm_module_pci_driver_if_modeset(mgag200_pci_driver, mgag200_modeset);
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ba3b5b5f0cdf..02e6b74d5016 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -323,12 +323,18 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
 	of_reserved_mem_device_release(dev);
 }
 
+static void pl111_amba_shutdown(struct amba_device *amba_dev)
+{
+	drm_atomic_helper_shutdown(amba_get_drvdata(amba_dev));
+}
+
 /*
  * This early variant lacks the 565 and 444 pixel formats.
  */
@@ -431,6 +437,7 @@ static struct amba_driver pl111_amba_driver __maybe_unused = {
 	},
 	.probe = pl111_amba_probe,
 	.remove = pl111_amba_remove,
+	.shutdown = pl111_amba_shutdown,
 	.id_table = pl111_id_table,
 };
 
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index c68c831136c9..e8523abef27a 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -114,6 +114,7 @@ static void drv_unload(struct drm_device *ddev)
 	DRM_DEBUG("%s\n", __func__);
 
 	drm_kms_helper_poll_fini(ddev);
+	drm_atomic_helper_shutdown(ddev);
 	ltdc_unload(ddev);
 }
 
@@ -225,6 +226,11 @@ static void stm_drm_platform_remove(struct platform_device *pdev)
 	drm_dev_put(ddev);
 }
 
+static void stm_drm_platform_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id drv_dt_ids[] = {
 	{ .compatible = "st,stm32-ltdc"},
 	{ /* end node */ },
@@ -234,6 +240,7 @@ MODULE_DEVICE_TABLE(of, drv_dt_ids);
 static struct platform_driver stm_drm_platform_driver = {
 	.probe = stm_drm_platform_probe,
 	.remove_new = stm_drm_platform_remove,
+	.shutdown = stm_drm_platform_shutdown,
 	.driver = {
 		.name = "stm32-display",
 		.of_match_table = drv_dt_ids,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index fe56beea3e93..8ebd7134ee21 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -175,6 +175,7 @@ static void tilcdc_fini(struct drm_device *dev)
 		drm_dev_unregister(dev);
 
 	drm_kms_helper_poll_fini(dev);
+	drm_atomic_helper_shutdown(dev);
 	tilcdc_irq_uninstall(dev);
 	drm_mode_config_cleanup(dev);
 
@@ -389,6 +390,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 init_failed:
 	tilcdc_fini(ddev);
+	platform_set_drvdata(pdev, NULL);
 
 	return ret;
 }
@@ -537,7 +539,8 @@ static void tilcdc_unbind(struct device *dev)
 	if (!ddev->dev_private)
 		return;
 
-	tilcdc_fini(dev_get_drvdata(dev));
+	tilcdc_fini(ddev);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops tilcdc_comp_ops = {
@@ -582,6 +585,11 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void tilcdc_pdev_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id tilcdc_of_match[] = {
 		{ .compatible = "ti,am33xx-tilcdc", },
 		{ .compatible = "ti,da850-tilcdc", },
@@ -592,6 +600,7 @@ MODULE_DEVICE_TABLE(of, tilcdc_of_match);
 static struct platform_driver tilcdc_platform_driver = {
 	.probe      = tilcdc_pdev_probe,
 	.remove     = tilcdc_pdev_remove,
+	.shutdown   = tilcdc_pdev_shutdown,
 	.driver     = {
 		.name   = "tilcdc",
 		.pm     = pm_sleep_ptr(&tilcdc_pm_ops),
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 0bb56d063536..acce210e2554 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -242,6 +242,7 @@ static void tve200_remove(struct platform_device *pdev)
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_mode_config_cleanup(drm);
@@ -249,6 +250,11 @@ static void tve200_remove(struct platform_device *pdev)
 	drm_dev_put(drm);
 }
 
+static void tve200_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id tve200_of_match[] = {
 	{
 		.compatible = "faraday,tve200",
@@ -263,6 +269,7 @@ static struct platform_driver tve200_driver = {
 	},
 	.probe = tve200_probe,
 	.remove_new = tve200_remove,
+	.shutdown = tve200_shutdown,
 };
 drm_module_platform_driver(tve200_driver);
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 4fee15c97c34..047b95812334 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -12,6 +12,7 @@
 #include <linux/vt_kern.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_file.h>
@@ -97,11 +98,19 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 	struct vbox_private *vbox = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(&vbox->ddev);
+	drm_atomic_helper_shutdown(&vbox->ddev);
 	vbox_irq_fini(vbox);
 	vbox_mode_fini(vbox);
 	vbox_hw_fini(vbox);
 }
 
+static void vbox_pci_shutdown(struct pci_dev *pdev)
+{
+	struct vbox_private *vbox = pci_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&vbox->ddev);
+}
+
 static int vbox_pm_suspend(struct device *dev)
 {
 	struct vbox_private *vbox = dev_get_drvdata(dev);
@@ -165,6 +174,7 @@ static struct pci_driver vbox_pci_driver = {
 	.id_table = pciidlist,
 	.probe = vbox_pci_probe,
 	.remove = vbox_pci_remove,
+	.shutdown = vbox_pci_shutdown,
 	.driver.pm = pm_sleep_ptr(&vbox_pm_ops),
 };
 
-- 
2.42.0.283.g2d96d420d3-goog

