Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618739392D
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4930D6F50D;
	Thu, 27 May 2021 23:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AF26F50D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:22:07 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 08/11] drm/ingenic: Support custom GEM object
Date: Fri, 28 May 2021 00:21:02 +0100
Message-Id: <20210527232104.152577-9-paul@crapouillou.net>
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

Add boilerplate code to support a custom "ingenic_gem_object". Empty for
now, but it will be useful later when subsequent patches will introduce
object-specific driver data.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ced2109e8f35..1cac369f6293 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -64,6 +64,10 @@ struct jz_soc_info {
 	unsigned int num_formats_f0, num_formats_f1;
 };
 
+struct ingenic_gem_object {
+	struct drm_gem_cma_object base;
+};
+
 struct ingenic_drm_private_state {
 	struct drm_private_state base;
 
@@ -179,6 +183,11 @@ static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
 	return container_of(nb, struct ingenic_drm, clock_nb);
 }
 
+static inline struct ingenic_gem_object *to_ingenic_gem_obj(struct drm_gem_object *gem_obj)
+{
+	return container_of(gem_obj, struct ingenic_gem_object, base.base);
+}
+
 static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool use_f1)
 {
 	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);
@@ -853,15 +862,15 @@ static struct drm_gem_object *
 ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
-	struct drm_gem_cma_object *obj;
+	struct ingenic_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
-	obj->map_noncoherent = priv->soc_info->map_noncoherent;
+	obj->base.map_noncoherent = priv->soc_info->map_noncoherent;
 
-	return &obj->base;
+	return &obj->base.base;
 }
 
 static struct drm_private_state *
-- 
2.30.2

