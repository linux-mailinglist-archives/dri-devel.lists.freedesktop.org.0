Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A96DD9B9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 13:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C9310E3CD;
	Tue, 11 Apr 2023 11:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1610E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:43:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155597359"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 20:43:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 831FA4000A93;
 Tue, 11 Apr 2023 20:43:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 08/17] drm: rcar-du: Move
 rcar_du_gem_prime_import_sg_table()
Date: Tue, 11 Apr 2023 12:42:26 +0100
Message-Id: <20230411114235.366042-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_gem_prime_import_sg_table() to RCar DU KMS lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 47 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  8 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 46 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  7 ++++
 4 files changed, 53 insertions(+), 55 deletions(-)

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
index 5490c99947fd..02ba7c1c7a70 100644
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
index e88f753704cd..37809d06df89 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include <linux/videodev2.h>
 
@@ -341,6 +342,51 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
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
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt)
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
index 6e4cfe2ef867..2556966024f8 100644
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
@@ -31,4 +34,8 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

