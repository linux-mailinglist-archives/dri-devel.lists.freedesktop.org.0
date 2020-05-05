Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA81C523E
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 11:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA2F6E17A;
	Tue,  5 May 2020 09:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC2F6E14E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 09:56:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79363B033;
 Tue,  5 May 2020 09:56:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, cogarre@gmail.com
Subject: [PATCH 5/5] drm/mgag200: Embed DRM device instance in struct
 mga_device
Date: Tue,  5 May 2020 11:56:49 +0200
Message-Id: <20200505095649.25814-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200505095649.25814-1-tzimmermann@suse.de>
References: <20200505095649.25814-1-tzimmermann@suse.de>
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

As it is best practice now, the DRM device instance is now embedded in
struct mga_device. All references to dev_private have been removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c |  6 +++---
 drivers/gpu/drm/mgag200/mgag200_drv.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_main.c   | 16 ++++++----------
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |  4 ++--
 6 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index aebc9ce43d551..e3c717c0cffc0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -15,7 +15,7 @@ static bool warn_palette = true;
 static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
 				 unsigned int width, unsigned int height)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	unsigned int i, row, col;
 	uint32_t colour_set[16];
 	uint32_t *next_space = &colour_set[0];
@@ -119,7 +119,7 @@ static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
 static int mgag200_show_cursor(struct mga_device *mdev, void *src,
 			       unsigned int width, unsigned int height)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	struct drm_gem_vram_object *gbo;
 	void *dst;
 	s64 off;
@@ -196,7 +196,7 @@ static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
 
 int mgag200_cursor_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	size_t ncursors = ARRAY_SIZE(mdev->cursor.gbo);
 	size_t size;
 	int ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ad12c1b7c66cc..fc0775694c097 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -71,7 +71,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto err_pci_disable_device;
 
-	dev = mdev->dev;
+	dev = &mdev->base;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 1ce0386669ffa..fb2797d6ff690 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -96,7 +96,7 @@
 
 #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
-#define to_mga_device(x) ((struct mga_device *)(x)->dev_private)
+#define to_mga_device(x) container_of(x, struct mga_device, base)
 
 struct mga_crtc {
 	struct drm_crtc base;
@@ -153,7 +153,7 @@ enum mga_type {
 #define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
 
 struct mga_device {
-	struct drm_device		*dev;
+	struct drm_device		base;
 	unsigned long			flags;
 
 	resource_size_t			rmmio_base;
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 070ff1f433df2..ca3ed463c2d41 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -67,7 +67,7 @@ static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
 /* Map the framebuffer from the card and configure the core */
 static int mga_vram_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	void __iomem *mem;
 
 	/* BAR 0 is VRAM */
@@ -100,14 +100,12 @@ static int mga_vram_init(struct mga_device *mdev)
 int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
 			struct pci_dev *pdev, unsigned long flags)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	int ret, option;
 
-	dev = drm_dev_alloc(drv, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
-	dev->dev_private = (void *)mdev;
-	mdev->dev = dev;
+	ret = drm_dev_init(dev, drv, &pdev->dev);
+	if (ret)
+		return ret;
 
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
@@ -185,17 +183,15 @@ int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
 err_drm_dev_put:
 	drm_dev_put(dev);
 err_mm:
-	dev->dev_private = NULL;
 	return ret;
 }
 
 void mgag200_device_fini(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 
 	mgag200_modeset_fini(mdev);
 	drm_mode_config_cleanup(dev);
 	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
-	dev->dev_private = NULL;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index aaa73b29b04f0..eb58742026adf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1433,7 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
 /* CRTC setup */
 static void mga_crtc_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	struct mga_crtc *mga_crtc;
 
 	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
@@ -1618,7 +1618,7 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
 
 int mgag200_modeset_init(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 	struct drm_encoder *encoder = &mdev->encoder;
 	struct drm_connector *connector;
 	int ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index e89657630ea71..86a582490bb67 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -34,7 +34,7 @@ int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_vram_mm *vmm;
 	int ret;
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 
 	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
 				       mdev->mc.vram_size);
@@ -57,7 +57,7 @@ int mgag200_mm_init(struct mga_device *mdev)
 
 void mgag200_mm_fini(struct mga_device *mdev)
 {
-	struct drm_device *dev = mdev->dev;
+	struct drm_device *dev = &mdev->base;
 
 	mdev->vram_fb_available = 0;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
