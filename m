Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F79A2EC7C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 13:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F810E500;
	Mon, 10 Feb 2025 12:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zSnP4GIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC87810E500
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 12:31:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C801A412BC;
 Mon, 10 Feb 2025 12:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF608C4CED1;
 Mon, 10 Feb 2025 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739190667;
 bh=pWRLjocutdCFxXvJFQEsMLSPARjs8b4om3edNKnxS1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zSnP4GINNaV6lNBT3WlBj3SHZhTpfp37dSy4K6R+XLFpnNifv1mjj/h0Pfr2rtTlv
 G6EU/KoI5GL4KhgMP3ZU00V5mS1RKVvrySK+Ktlr8OPGX9Gfvl88VhxY5tKeHrP0Fb
 cXndboc6J4BU3gWIkeZuwjQ+Z+B0rl42EwfmRXUg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 8/9] drm/vgem/vgem_drv convert to use faux_device
Date: Mon, 10 Feb 2025 13:30:32 +0100
Message-ID: <2025021028-brigade-create-37de@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
MIME-Version: 1.0
Lines: 108
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=pWRLjocutdCFxXvJFQEsMLSPARjs8b4om3edNKnxS1E=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDOkrP6bsFpE7+LnzzakdWn95NRNu6BzSTOuu2fOv+USIm
 fiW6pXvO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiG2QY5mc7+HPe9tGRYrLS
 aj+trF8W+eXrf4YFV5f53NFha9x6a3fa1eiuf72hj+r6AQ==
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

The vgem driver does not need to create a platform device, as there is
no real platform resources associated it,  it only did so because it was
simple to do that in order to get a device to use for resource
management of drm resources.  Change the driver to use the faux device
instead as this is NOT a real platform device.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v4: - api tweaked due to parent pointer added to faux_device create
      function.
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/gpu/drm/vgem/vgem_drv.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 2752ab4f1c97..260c64733972 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -32,7 +32,7 @@
 
 #include <linux/dma-buf.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/shmem_fs.h>
 #include <linux/vmalloc.h>
 
@@ -52,7 +52,7 @@
 
 static struct vgem_device {
 	struct drm_device drm;
-	struct platform_device *platform;
+	struct faux_device *faux_dev;
 } *vgem_device;
 
 static int vgem_open(struct drm_device *dev, struct drm_file *file)
@@ -127,27 +127,27 @@ static const struct drm_driver vgem_driver = {
 static int __init vgem_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
-	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	fdev = faux_device_create("vgem", NULL, NULL);
+	if (!fdev)
+		return -ENODEV;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&pdev->dev,
+	dma_coerce_mask_and_coherent(&fdev->dev,
 				     DMA_BIT_MASK(64));
 
-	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
+	vgem_device = devm_drm_dev_alloc(&fdev->dev, &vgem_driver,
 					 struct vgem_device, drm);
 	if (IS_ERR(vgem_device)) {
 		ret = PTR_ERR(vgem_device);
 		goto out_devres;
 	}
-	vgem_device->platform = pdev;
+	vgem_device->faux_dev = fdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
@@ -157,19 +157,19 @@ static int __init vgem_init(void)
 	return 0;
 
 out_devres:
-	devres_release_group(&pdev->dev, NULL);
+	devres_release_group(&fdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 	return ret;
 }
 
 static void __exit vgem_exit(void)
 {
-	struct platform_device *pdev = vgem_device->platform;
+	struct faux_device *fdev = vgem_device->faux_dev;
 
 	drm_dev_unregister(&vgem_device->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	devres_release_group(&fdev->dev, NULL);
+	faux_device_destroy(fdev);
 }
 
 module_init(vgem_init);
-- 
2.48.1

