Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABB5AB742
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 19:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A610E8A9;
	Fri,  2 Sep 2022 17:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8BBA10E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 17:09:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; d="scan'208";a="131488020"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 03 Sep 2022 02:09:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id CFC6D40078DC;
 Sat,  3 Sep 2022 02:09:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 08/10] drm: rcar-du: Move rcar_du_dumb_create()
Date: Fri,  2 Sep 2022 18:08:24 +0100
Message-Id: <20220902170826.599262-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
References: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
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

Move rcar_du_dumb_create() to RCar DU KMS lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 21 -----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  5 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 28 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  7 ++++++
 4 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3141d447e979..4b5511a20313 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -81,27 +81,6 @@ struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 	return gem_obj;
 }
 
-int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
-			struct drm_mode_create_dumb *args)
-{
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	unsigned int align;
-
-	/*
-	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
-	 * but the R8A7790 DU seems to require a 128 bytes pitch alignment.
-	 */
-	if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
-		align = 128;
-	else
-		align = 16 * args->bpp / 8;
-
-	args->pitch = roundup(min_pitch, align);
-
-	return drm_gem_dma_dumb_create_internal(file, dev, args);
-}
-
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 2d4b8e608989..821eac74077f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -13,18 +13,13 @@
 #include "rcar_du_kms_lib.h"
 
 struct dma_buf_attachment;
-struct drm_file;
 struct drm_device;
 struct drm_gem_object;
-struct drm_mode_create_dumb;
 struct rcar_du_device;
 struct sg_table;
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
-int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
-
 struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 97c526dae521..0a2b1c6c1ea6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -7,10 +7,13 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
 
 #include <linux/videodev2.h>
 
+#include "rcar_du_drv.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_regs.h"
 
@@ -303,3 +306,28 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 
 	return NULL;
 }
+
+/* -----------------------------------------------------------------------------
+ * Frame buffer
+ */
+
+int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
+			struct drm_mode_create_dumb *args)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	unsigned int align;
+
+	/*
+	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
+	 * but the R8A7790 DU seems to require a 128 bytes pitch alignment.
+	 */
+	if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
+		align = 128;
+	else
+		align = 16 * args->bpp / 8;
+
+	args->pitch = roundup(min_pitch, align);
+
+	return drm_gem_dma_dumb_create_internal(file, dev, args);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 674a38d24917..33f96e96f6a2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -12,6 +12,10 @@
 
 #include <linux/types.h>
 
+struct drm_device;
+struct drm_file;
+struct drm_mode_create_dumb;
+
 struct rcar_du_format_info {
 	u32 fourcc;
 	u32 v4l2;
@@ -24,4 +28,7 @@ struct rcar_du_format_info {
 
 const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
 
+int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
+			struct drm_mode_create_dumb *args);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

