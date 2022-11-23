Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03825636724
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251010E5D6;
	Wed, 23 Nov 2022 17:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAEF010E5DD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:29:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="140988293"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 502CF40ADCCF;
 Thu, 24 Nov 2022 02:29:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 13/19] drm: rcar-du: Add rcar_du_lib_fb_create()
Date: Wed, 23 Nov 2022 17:29:00 +0000
Message-Id: <20221123172906.2919734-14-biju.das.jz@bp.renesas.com>
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

Move the common code from rcar_du_fb_create->rcar_du_lib_fb_create,
so that rzg2l_du_fb_create() can reuse the common code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated rcar_du_fb_create() for the pixel fmt error.
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 64 +--------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 69 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  4 ++
 3 files changed, 74 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index ae969f640bb6..74845d8bad9d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -38,69 +38,7 @@ static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	const struct rcar_du_format_info *format;
-	unsigned int chroma_pitch;
-	unsigned int max_pitch;
-	unsigned int align;
-	unsigned int i;
-
-	format = rcar_du_format_info(mode_cmd->pixel_format);
-	if (format == NULL) {
-		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
-			&mode_cmd->pixel_format);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (rcdu->info->gen < 3) {
-		/*
-		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
-		 * buffers to be aligned to a 16 pixels boundary (or 128 bytes
-		 * on some platforms).
-		 */
-		unsigned int bpp = format->planes == 1 ? format->bpp / 8 : 1;
-
-		max_pitch = 4095 * bpp;
-
-		if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
-			align = 128;
-		else
-			align = 16 * bpp;
-	} else {
-		/*
-		 * On Gen3 the memory interface is handled by the VSP that
-		 * limits the pitch to 65535 bytes and has no alignment
-		 * constraint.
-		 */
-		max_pitch = 65535;
-		align = 1;
-	}
-
-	if (mode_cmd->pitches[0] & (align - 1) ||
-	    mode_cmd->pitches[0] > max_pitch) {
-		dev_dbg(dev->dev, "invalid pitch value %u\n",
-			mode_cmd->pitches[0]);
-		return ERR_PTR(-EINVAL);
-	}
-
-	/*
-	 * Calculate the chroma plane(s) pitch using the horizontal subsampling
-	 * factor. For semi-planar formats, the U and V planes are combined, the
-	 * pitch must thus be doubled.
-	 */
-	chroma_pitch = mode_cmd->pitches[0] / format->hsub;
-	if (format->planes == 2)
-		chroma_pitch *= 2;
-
-	for (i = 1; i < format->planes; ++i) {
-		if (mode_cmd->pitches[i] != chroma_pitch) {
-			dev_dbg(dev->dev,
-				"luma and chroma pitches are not compatible\n");
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return rcar_du_lib_fb_create(dev, file_priv, mode_cmd);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index ed5e2b78c351..25548e727db9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -378,3 +378,72 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
+
+struct drm_framebuffer *
+rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	const struct rcar_du_format_info *format;
+	unsigned int chroma_pitch;
+	unsigned int max_pitch;
+	unsigned int align;
+	unsigned int i;
+
+	format = rcar_du_format_info(mode_cmd->pixel_format);
+	if (format == NULL) {
+		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
+			&mode_cmd->pixel_format);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (rcdu->info->gen < 3) {
+		/*
+		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
+		 * buffers to be aligned to a 16 pixels boundary (or 128 bytes
+		 * on some platforms).
+		 */
+		unsigned int bpp = format->planes == 1 ? format->bpp / 8 : 1;
+
+		max_pitch = 4095 * bpp;
+
+		if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
+			align = 128;
+		else
+			align = 16 * bpp;
+	} else {
+		/*
+		 * On Gen3 the memory interface is handled by the VSP that
+		 * limits the pitch to 65535 bytes and has no alignment
+		 * constraint.
+		 */
+		max_pitch = 65535;
+		align = 1;
+	}
+
+	if (mode_cmd->pitches[0] & (align - 1) ||
+	    mode_cmd->pitches[0] > max_pitch) {
+		dev_dbg(dev->dev, "invalid pitch value %u\n",
+			mode_cmd->pitches[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * Calculate the chroma plane(s) pitch using the horizontal subsampling
+	 * factor. For semi-planar formats, the U and V planes are combined, the
+	 * pitch must thus be doubled.
+	 */
+	chroma_pitch = mode_cmd->pitches[0] / format->hsub;
+	if (format->planes == 2)
+		chroma_pitch *= 2;
+
+	for (i = 1; i < format->planes; ++i) {
+		if (mode_cmd->pitches[i] != chroma_pitch) {
+			dev_dbg(dev->dev,
+				"luma and chroma pitches are not compatible\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 4941c32bc9ce..b621a7e2e439 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -39,4 +39,8 @@ rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
 				  struct sg_table *sgt);
 
+struct drm_framebuffer *
+rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_mode_fb_cmd2 *mode_cmd);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

