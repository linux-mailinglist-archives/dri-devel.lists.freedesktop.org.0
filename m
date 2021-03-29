Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AC34D64B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 19:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113D06E499;
	Mon, 29 Mar 2021 17:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422B6E499
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 17:51:11 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
Date: Mon, 29 Mar 2021 18:50:45 +0100
Message-Id: <20210329175046.214629-2-paul@crapouillou.net>
In-Reply-To: <20210329175046.214629-1-paul@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net>
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It should have been an OVERLAY from the beginning. The documentation
stipulates that there should be an unique PRIMARY plane per CRTC.

Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
Cc: <stable@vger.kernel.org> # 5.8+
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 +++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 29742ec5ab95..09225b770bb8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -419,7 +419,7 @@ static void ingenic_drm_plane_enable(struct ingenic_drm *priv,
 	unsigned int en_bit;
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (plane != &priv->f0)
 			en_bit = JZ_LCD_OSDC_F1EN;
 		else
 			en_bit = JZ_LCD_OSDC_F0EN;
@@ -434,7 +434,7 @@ void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane)
 	unsigned int en_bit;
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (plane != &priv->f0)
 			en_bit = JZ_LCD_OSDC_F1EN;
 		else
 			en_bit = JZ_LCD_OSDC_F0EN;
@@ -461,8 +461,7 @@ void ingenic_drm_plane_config(struct device *dev,
 
 	ingenic_drm_plane_enable(priv, plane);
 
-	if (priv->soc_info->has_osd &&
-	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+	if (priv->soc_info->has_osd && plane != &priv->f0) {
 		switch (fourcc) {
 		case DRM_FORMAT_XRGB1555:
 			ctrl |= JZ_LCD_OSDCTRL_RGB555;
@@ -510,7 +509,7 @@ void ingenic_drm_plane_config(struct device *dev,
 	}
 
 	if (priv->soc_info->has_osd) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		if (plane != &priv->f0) {
 			xy_reg = JZ_REG_LCD_XYP1;
 			size_reg = JZ_REG_LCD_SIZE1;
 		} else {
@@ -561,7 +560,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
 
-		if (!priv->soc_info->has_osd || plane->type == DRM_PLANE_TYPE_OVERLAY)
+		if (!priv->soc_info->has_osd || plane == &priv->f0)
 			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
 		else
 			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 5ae6adab8306..3b1091e7c0cd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -767,7 +767,7 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 
 	err = drm_universal_plane_init(drm, plane, 1, &ingenic_ipu_plane_funcs,
 				       soc_info->formats, soc_info->num_formats,
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+				       NULL, DRM_PLANE_TYPE_OVERLAY, NULL);
 	if (err) {
 		dev_err(dev, "Failed to init plane: %i\n", err);
 		return err;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
