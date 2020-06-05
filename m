Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38381EF9C9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0078A6E8F6;
	Fri,  5 Jun 2020 13:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DDB6E8F9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A081ADCA;
 Fri,  5 Jun 2020 13:58:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 13/14] drm/mgag200: Embed instance of struct drm_device in
 struct mga_device
Date: Fri,  5 Jun 2020 15:58:02 +0200
Message-Id: <20200605135803.19811-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following current best practice, the instance of struct drm_device is now
embedded in struct mga_device. The respective field has been renamed from
'dev' to 'base' to reflect the relationship. Conversion from DRM device is
done via upcast. Using dev_private is no longer possible.

The patch also open-codes drm_dev_alloc() and DRM device initialization
is now performed by a call to drm_device_init().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 47 ++++++++++----------------
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  4 +--
 drivers/gpu/drm/mgag200/mgag200_mm.c   |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 12 +++----
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 592e484f87ee7..6dfb7c5f79e3c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -45,7 +45,7 @@ static struct drm_driver mgag200_driver = {
 
 static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	int ret, option;
 
 	mdev->flags = mgag200_flags_from_driver_data(flags);
@@ -89,25 +89,24 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 }
 
 static struct mga_device *
-mgag200_driver_load(struct pci_dev *pdev, unsigned long flags)
+mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
 {
 	struct drm_device *dev;
 	struct mga_device *mdev;
 	int ret;
 
-	dev = drm_dev_alloc(&mgag200_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return ERR_CAST(dev);
+	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
+	if (!mdev)
+		return ERR_PTR(-ENOMEM);
+	dev = &mdev->base;
+
+	ret = drm_dev_init(dev, &mgag200_driver, &pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
 
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
-	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
-	if (mdev == NULL)
-		return ERR_PTR(-ENOMEM);
-	dev->dev_private = (void *)mdev;
-	mdev->dev = dev;
-
 	ret = mgag200_device_init(mdev, flags);
 	if (ret)
 		goto err_drm_dev_put;
@@ -116,19 +115,9 @@ mgag200_driver_load(struct pci_dev *pdev, unsigned long flags)
 
 err_drm_dev_put:
 	drm_dev_put(dev);
-	dev->dev_private = NULL;
 	return ERR_PTR(ret);
 }
 
-static void mgag200_driver_unload(struct drm_device *dev)
-{
-	struct mga_device *mdev = to_mga_device(dev);
-
-	if (mdev == NULL)
-		return;
-	dev->dev_private = NULL;
-}
-
 /*
  * PCI driver
  */
@@ -161,21 +150,22 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	mdev = mgag200_driver_load(pdev, ent->driver_data);
-	if (IS_ERR(mdev))
-		return PTR_ERR(mdev);
-	dev = mdev->dev;
+	mdev = mgag200_device_create(pdev, ent->driver_data);
+	if (IS_ERR(mdev)) {
+		ret = PTR_ERR(mdev);
+		goto err_drm_dev_put;
+	}
+	dev = &mdev->base;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_mgag200_driver_unload;
+		goto err_drm_dev_put;
 
 	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
-err_mgag200_driver_unload:
-	mgag200_driver_unload(dev);
+err_drm_dev_put:
 	drm_dev_put(dev);
 	return ret;
 }
@@ -185,7 +175,6 @@ static void mgag200_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
-	mgag200_driver_unload(dev);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index b38e5ce4ee20b..270c2f9a67666 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -142,7 +142,7 @@ enum mga_type {
 #define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
 
 struct mga_device {
-	struct drm_device		*dev;
+	struct drm_device		base;
 	unsigned long			flags;
 
 	resource_size_t			rmmio_base;
@@ -170,7 +170,7 @@ struct mga_device {
 
 static inline struct mga_device *to_mga_device(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct mga_device, base);
 }
 
 static inline enum mga_type
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index 1b1e5ec5d1ceb..7b69392bcb891 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -89,7 +89,7 @@ static void mgag200_mm_release(struct drm_device *dev, void *ptr)
 
 int mgag200_mm_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	resource_size_t start, len;
 	int ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0155d4eb5fa6b..f16bd278ab7e4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -854,7 +854,7 @@ static void mga_g200wb_commit(struct drm_crtc *crtc)
 static void mgag200_set_startadd(struct mga_device *mdev,
 				 unsigned long offset)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	u32 startadd;
 	u8 crtcc, crtcd, crtcext0;
 
@@ -882,7 +882,7 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 static void mgag200_set_pci_regs(struct mga_device *mdev)
 {
 	uint32_t option = 0, option2 = 0;
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 
 	switch (mdev->type) {
 	case G200_SE_A:
@@ -1153,7 +1153,7 @@ static void mgag200_set_offset(struct mga_device *mdev,
 static void mgag200_set_format_regs(struct mga_device *mdev,
 				    const struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	const struct drm_format_info *format = fb->format;
 	unsigned int bpp, bppshift, scale;
 	u8 crtcext3, xmulctrl;
@@ -1537,7 +1537,7 @@ static const struct drm_connector_funcs mga_vga_connector_funcs = {
 
 static int mgag200_vga_connector_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	struct mga_connector *mconnector = &mdev->connector;
 	struct drm_connector *connector = &mconnector->base;
 	struct mga_i2c_chan *i2c;
@@ -1579,7 +1579,7 @@ static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	void *vmap;
 
 	vmap = drm_gem_shmem_vmap(fb->obj[0]);
@@ -1718,7 +1718,7 @@ static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
 
 int mgag200_modeset_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	struct drm_connector *connector = &mdev->connector.base;
 	struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
 	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
