Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6B393930
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACC96F50F;
	Thu, 27 May 2021 23:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573B6F50F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:22:20 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 09/11] drm/ingenic: Add ingenic_drm_gem_fb_destroy() function
Date: Fri, 28 May 2021 00:21:03 +0100
Message-Id: <20210527232104.152577-10-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a ingenic_drm_gem_fb_destroy() function, which currently only calls
gem_fb_destroy(), but will be extended in a subsequent patch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 +++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 1cac369f6293..2761478b16e8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -846,16 +846,38 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, 0);
 }
 
+static void ingenic_drm_gem_fb_destroy(struct drm_framebuffer *fb)
+{
+	drm_gem_fb_destroy(fb);
+}
+
+static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs = {
+	.destroy	= ingenic_drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+};
+
+static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs_dirty = {
+	.destroy	= ingenic_drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty		= drm_atomic_helper_dirtyfb,
+};
+
 static struct drm_framebuffer *
 ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
+	const struct drm_framebuffer_funcs *fb_funcs;
+	struct drm_framebuffer *fb;
 
 	if (priv->soc_info->map_noncoherent)
-		return drm_gem_fb_create_with_dirty(drm, file, mode_cmd);
+		fb_funcs = &ingenic_drm_gem_fb_funcs_dirty;
+	else
+		fb_funcs = &ingenic_drm_gem_fb_funcs;
+
+	fb = drm_gem_fb_create_with_funcs(drm, file, mode_cmd, fb_funcs);
 
-	return drm_gem_fb_create(drm, file, mode_cmd);
+	return fb;
 }
 
 static struct drm_gem_object *
-- 
2.30.2

