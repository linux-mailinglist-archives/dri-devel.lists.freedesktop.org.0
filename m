Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F56DD9B8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 13:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3F10E2FE;
	Tue, 11 Apr 2023 11:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 929E110E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:43:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155597350"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 20:43:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 78145400564A;
 Tue, 11 Apr 2023 20:43:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 07/17] drm: rcar-du: Move rcar_du_dumb_create()
Date: Tue, 11 Apr 2023 12:42:25 +0100
Message-Id: <20230411114235.366042-8-biju.das.jz@bp.renesas.com>
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

Move rcar_du_dumb_create() to RCar DU KMS lib.

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
index d2d4f34fe557..5490c99947fd 100644
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
index 5921040586fc..e88f753704cd 100644
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
 
@@ -333,3 +336,28 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 
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
index d72069436cac..6e4cfe2ef867 100644
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

