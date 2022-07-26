Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6B5817B7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2992A49;
	Tue, 26 Jul 2022 16:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D736C930CE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198140"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id DCAB340083D5;
 Wed, 27 Jul 2022 01:42:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/10] drm: rcar-du: Move rcar_du_gem_prime_import_sg_table()
Date: Tue, 26 Jul 2022 17:42:07 +0100
Message-Id: <20220726164208.1048444-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
References: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_gem_prime_import_sg_table() to RCar DU KMS lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 45 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  4 --
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 45 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  4 ++
 4 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index c05a1925755f..ea2b7d5f1c23 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -37,51 +37,6 @@
  * Frame buffer
  */
 
-static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
-	.free = drm_gem_cma_object_free,
-	.print_info = drm_gem_cma_object_print_info,
-	.get_sg_table = drm_gem_cma_object_get_sg_table,
-	.vmap = drm_gem_cma_object_vmap,
-	.mmap = drm_gem_cma_object_mmap,
-	.vm_ops = &drm_gem_cma_vm_ops,
-};
-
-struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
-				struct dma_buf_attachment *attach,
-				struct sg_table *sgt)
-{
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	struct drm_gem_cma_object *cma_obj;
-	struct drm_gem_object *gem_obj;
-	int ret;
-
-	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
-		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
-
-	/* Create a CMA GEM buffer. */
-	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
-	if (!cma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	gem_obj = &cma_obj->base;
-	gem_obj->funcs = &rcar_du_gem_funcs;
-
-	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
-	cma_obj->map_noncoherent = false;
-
-	ret = drm_gem_create_mmap_offset(gem_obj);
-	if (ret) {
-		drm_gem_object_release(gem_obj);
-		kfree(cma_obj);
-		return ERR_PTR(ret);
-	}
-
-	cma_obj->paddr = 0;
-	cma_obj->sgt = sgt;
-
-	return gem_obj;
-}
-
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index e335a47ec72f..9bf7d94615ff 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -14,8 +14,4 @@
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
-struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
-				struct dma_buf_attachment *attach,
-				struct sg_table *sgt);
-
 #endif /* __RCAR_DU_KMS_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index cc86524a826a..6461b99e08dc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -327,6 +327,51 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
  * Frame buffer
  */
 
+static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
+	.free = drm_gem_cma_object_free,
+	.print_info = drm_gem_cma_object_print_info,
+	.get_sg_table = drm_gem_cma_object_get_sg_table,
+	.vmap = drm_gem_cma_object_vmap,
+	.mmap = drm_gem_cma_object_mmap,
+	.vm_ops = &drm_gem_cma_vm_ops,
+};
+
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	struct drm_gem_cma_object *cma_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
+		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
+
+	/* Create a CMA GEM buffer. */
+	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
+	if (!cma_obj)
+		return ERR_PTR(-ENOMEM);
+
+	gem_obj = &cma_obj->base;
+	gem_obj->funcs = &rcar_du_gem_funcs;
+
+	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
+	cma_obj->map_noncoherent = false;
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret) {
+		drm_gem_object_release(gem_obj);
+		kfree(cma_obj);
+		return ERR_PTR(ret);
+	}
+
+	cma_obj->paddr = 0;
+	cma_obj->sgt = sgt;
+
+	return gem_obj;
+}
+
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 15505b51c849..5f45a369bb88 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -35,4 +35,8 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

