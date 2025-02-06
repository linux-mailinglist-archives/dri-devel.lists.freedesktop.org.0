Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA1A2AF12
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA9810E260;
	Thu,  6 Feb 2025 17:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JDerHCeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4EC10E260
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:39:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EBACC5C6890;
 Thu,  6 Feb 2025 17:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A2BC4CEDD;
 Thu,  6 Feb 2025 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738863544;
 bh=7OpNXCXkwCfC6x41rTgeEBlnwcyHWRj1BM3KYMm7Mww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDerHCeJ4W03keHRez6h+GjSIGY4GFdkGQSWSfJbXc1zLSdsvlWwIrbN5ERjW1Wcz
 kqfeOeTLRF9qyd93qBLPcvlUgRKacjTxXgmUucP6JYg1fqrePA/m6vo7K2zGnuc+Dc
 NjBq4sePSC9dzHv7iyzOVb9vCYwhvkt7i3vcr5Rs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/8] drm/vkms: convert to use faux_device
Date: Thu,  6 Feb 2025 18:38:22 +0100
Message-ID: <2025020625-unlaced-vagueness-ae34@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
MIME-Version: 1.0
Lines: 128
X-Developer-Signature: v=1; a=openpgp-sha256; l=4188;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=7OpNXCXkwCfC6x41rTgeEBlnwcyHWRj1BM3KYMm7Mww=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPk86ZX7leq6P+Z6s3rAzi0rVHWbv6LM3iPa1u7Cu9
 fZBr/95HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjAR3TcM82NMFEIi9n44OfWv
 /RvTxqmefRvWPWSYZyOxdtputdAzU2fWfDljLSHUnFWSCQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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

The vkms driver does not need to create a platform device, as there is
no real platform resources associated it,  it only did so because it was
simple to do that in order to get a device to use for resource
management of drm resources.  Change the driver to use the faux device
instead as this is NOT a real platform device.

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h |  4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba9349..b1269f984886 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -177,25 +177,25 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 static int vkms_create(struct vkms_config *config)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 	struct vkms_device *vkms_device;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	fdev = faux_device_create(DRIVER_NAME, NULL);
+	if (!fdev)
+		return -ENODEV;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_unregister;
 	}
 
-	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
+	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
 		goto out_devres;
 	}
-	vkms_device->platform = pdev;
+	vkms_device->faux_dev = fdev;
 	vkms_device->config = config;
 	config->dev = vkms_device;
 
@@ -229,9 +229,9 @@ static int vkms_create(struct vkms_config *config)
 	return 0;
 
 out_devres:
-	devres_release_group(&pdev->dev, NULL);
+	devres_release_group(&fdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 	return ret;
 }
 
@@ -259,19 +259,19 @@ static int __init vkms_init(void)
 
 static void vkms_destroy(struct vkms_config *config)
 {
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
 	if (!config->dev) {
 		DRM_INFO("vkms_device is NULL.\n");
 		return;
 	}
 
-	pdev = config->dev->platform;
+	fdev = config->dev->faux_dev;
 
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	devres_release_group(&fdev->dev, NULL);
+	faux_device_destroy(fdev);
 
 	config->dev = NULL;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 00541eff3d1b..4668b0e29a84 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -209,13 +209,13 @@ struct vkms_config {
  * struct vkms_device - Description of a VKMS device
  *
  * @drm - Base device in DRM
- * @platform - Associated platform device
+ * @faux_dev- Associated faux device
  * @output - Configuration and sub-components of the VKMS device
  * @config: Configuration used in this VKMS device
  */
 struct vkms_device {
 	struct drm_device drm;
-	struct platform_device *platform;
+	struct faux_device *faux_dev;
 	struct vkms_output output;
 	const struct vkms_config *config;
 };
-- 
2.48.1

