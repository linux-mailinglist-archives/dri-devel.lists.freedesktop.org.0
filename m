Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13663673E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F3110E5E2;
	Wed, 23 Nov 2022 17:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9465710E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:29:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="140988279"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 37CA340ADCC6;
 Thu, 24 Nov 2022 02:29:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 08/19] drm: rcar-du: Move
 rcar_du_gem_prime_import_sg_table()
Date: Wed, 23 Nov 2022 17:28:55 +0000
Message-Id: <20221123172906.2919734-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_gem_prime_import_sg_table() to RCar DU KMS lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Fixed checkpatch warnings related to alignment.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 47 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  8 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 47 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  8 ++++
 4 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 4b5511a20313..ae969f640bb6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -11,8 +11,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_framebuffer.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -36,51 +34,6 @@
  * Frame buffer
  */
 
-static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
-	.free = drm_gem_dma_object_free,
-	.print_info = drm_gem_dma_object_print_info,
-	.get_sg_table = drm_gem_dma_object_get_sg_table,
-	.vmap = drm_gem_dma_object_vmap,
-	.mmap = drm_gem_dma_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
-};
-
-struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
-				struct dma_buf_attachment *attach,
-				struct sg_table *sgt)
-{
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	struct drm_gem_dma_object *dma_obj;
-	struct drm_gem_object *gem_obj;
-	int ret;
-
-	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
-		return drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
-
-	/* Create a DMA GEM buffer. */
-	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
-	if (!dma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	gem_obj = &dma_obj->base;
-	gem_obj->funcs = &rcar_du_gem_funcs;
-
-	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
-	dma_obj->map_noncoherent = false;
-
-	ret = drm_gem_create_mmap_offset(gem_obj);
-	if (ret) {
-		drm_gem_object_release(gem_obj);
-		kfree(dma_obj);
-		return ERR_PTR(ret);
-	}
-
-	dma_obj->dma_addr = 0;
-	dma_obj->sgt = sgt;
-
-	return gem_obj;
-}
-
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 821eac74077f..b47a9e464ef4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -12,16 +12,8 @@
 
 #include "rcar_du_kms_lib.h"
 
-struct dma_buf_attachment;
-struct drm_device;
-struct drm_gem_object;
 struct rcar_du_device;
-struct sg_table;
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
-struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
-				struct dma_buf_attachment *attach,
-				struct sg_table *sgt);
-
 #endif /* __RCAR_DU_KMS_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 0a2b1c6c1ea6..ed5e2b78c351 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include <linux/videodev2.h>
 
@@ -311,6 +312,52 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
  * Frame buffer
  */
 
+static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
+	.free = drm_gem_dma_object_free,
+	.print_info = drm_gem_dma_object_print_info,
+	.get_sg_table = drm_gem_dma_object_get_sg_table,
+	.vmap = drm_gem_dma_object_vmap,
+	.mmap = drm_gem_dma_object_mmap,
+	.vm_ops = &drm_gem_dma_vm_ops,
+};
+
+struct drm_gem_object *
+rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
+		return drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
+
+	/* Create a DMA GEM buffer. */
+	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
+	if (!dma_obj)
+		return ERR_PTR(-ENOMEM);
+
+	gem_obj = &dma_obj->base;
+	gem_obj->funcs = &rcar_du_gem_funcs;
+
+	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
+	dma_obj->map_noncoherent = false;
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret) {
+		drm_gem_object_release(gem_obj);
+		kfree(dma_obj);
+		return ERR_PTR(ret);
+	}
+
+	dma_obj->dma_addr = 0;
+	dma_obj->sgt = sgt;
+
+	return gem_obj;
+}
+
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 33f96e96f6a2..4941c32bc9ce 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -12,9 +12,12 @@
 
 #include <linux/types.h>
 
+struct dma_buf_attachment;
 struct drm_device;
 struct drm_file;
+struct drm_gem_object;
 struct drm_mode_create_dumb;
+struct sg_table;
 
 struct rcar_du_format_info {
 	u32 fourcc;
@@ -31,4 +34,9 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
+struct drm_gem_object *
+rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

