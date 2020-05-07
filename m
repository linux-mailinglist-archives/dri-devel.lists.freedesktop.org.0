Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DC1C854F
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330C06E959;
	Thu,  7 May 2020 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BDF6E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1F40ADD5;
 Thu,  7 May 2020 09:03:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 2/6] drm/mgag200: Remove several references to struct
 mga_device.dev
Date: Thu,  7 May 2020 11:03:11 +0200
Message-Id: <20200507090315.21274-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200507090315.21274-1-tzimmermann@suse.de>
References: <20200507090315.21274-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Done in preparation of embedding the DRM device in struct mga_device.
This patch makes the patch for embedding more readable.

v2:
	* improved commit message (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_main.c | 23 ++++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++++++++--------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index b705b7776d2fc..51919b5c1d97f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -66,25 +66,26 @@ static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
 /* Map the framebuffer from the card and configure the core */
 static int mga_vram_init(struct mga_device *mdev)
 {
+	struct drm_device *dev = mdev->dev;
 	void __iomem *mem;
 
 	/* BAR 0 is VRAM */
-	mdev->mc.vram_base = pci_resource_start(mdev->dev->pdev, 0);
-	mdev->mc.vram_window = pci_resource_len(mdev->dev->pdev, 0);
+	mdev->mc.vram_base = pci_resource_start(dev->pdev, 0);
+	mdev->mc.vram_window = pci_resource_len(dev->pdev, 0);
 
-	if (!devm_request_mem_region(mdev->dev->dev, mdev->mc.vram_base, mdev->mc.vram_window,
-				"mgadrmfb_vram")) {
+	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
+				     mdev->mc.vram_window, "mgadrmfb_vram")) {
 		DRM_ERROR("can't reserve VRAM\n");
 		return -ENXIO;
 	}
 
-	mem = pci_iomap(mdev->dev->pdev, 0, 0);
+	mem = pci_iomap(dev->pdev, 0, 0);
 	if (!mem)
 		return -ENOMEM;
 
 	mdev->mc.vram_size = mga_probe_vram(mdev, mem);
 
-	pci_iounmap(mdev->dev->pdev, mem);
+	pci_iounmap(dev->pdev, mem);
 
 	return 0;
 }
@@ -105,12 +106,12 @@ static int mgag200_device_init(struct drm_device *dev,
 	mdev->has_sdram = !(option & (1 << 14));
 
 	/* BAR 0 is the framebuffer, BAR 1 contains registers */
-	mdev->rmmio_base = pci_resource_start(mdev->dev->pdev, 1);
-	mdev->rmmio_size = pci_resource_len(mdev->dev->pdev, 1);
+	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
+	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
 
-	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev->rmmio_size,
-				"mgadrmfb_mmio")) {
-		DRM_ERROR("can't reserve mmio registers\n");
+	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
+				     mdev->rmmio_size, "mgadrmfb_mmio")) {
+		drm_err(dev, "can't reserve mmio registers\n");
 		return -ENOMEM;
 	}
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fa91869c0db52..aaa73b29b04f0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1433,6 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
 /* CRTC setup */
 static void mga_crtc_init(struct mga_device *mdev)
 {
+	struct drm_device *dev = mdev->dev;
 	struct mga_crtc *mga_crtc;
 
 	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
@@ -1442,7 +1443,7 @@ static void mga_crtc_init(struct mga_device *mdev)
 	if (mga_crtc == NULL)
 		return;
 
-	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
+	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
 	mdev->mode_info.crtc = mga_crtc;
@@ -1617,30 +1618,30 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
 
 int mgag200_modeset_init(struct mga_device *mdev)
 {
+	struct drm_device *dev = mdev->dev;
 	struct drm_encoder *encoder = &mdev->encoder;
 	struct drm_connector *connector;
 	int ret;
 
 	mdev->mode_info.mode_config_initialized = true;
 
-	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
-	mdev->dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
+	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
+	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
 
-	mdev->dev->mode_config.fb_base = mdev->mc.vram_base;
+	dev->mode_config.fb_base = mdev->mc.vram_base;
 
 	mga_crtc_init(mdev);
 
-	ret = drm_simple_encoder_init(mdev->dev, encoder,
-				      DRM_MODE_ENCODER_DAC);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
 	if (ret) {
-		drm_err(mdev->dev,
+		drm_err(dev,
 			"drm_simple_encoder_init() failed, error %d\n",
 			ret);
 		return ret;
 	}
 	encoder->possible_crtcs = 0x1;
 
-	connector = mga_vga_init(mdev->dev);
+	connector = mga_vga_init(dev);
 	if (!connector) {
 		DRM_ERROR("mga_vga_init failed\n");
 		return -1;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
