Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BA664D9C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 21:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D5010E493;
	Tue, 10 Jan 2023 20:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC110E493
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 20:47:51 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h16so647657qtu.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNkmbPLxmBzQtQA4WlZ5lNA3PV6OlrWh8T5N9f26/rk=;
 b=Ar1kALT2vCLC0jsxBT02ALvFqTERzGmIASoyMWnRwl1PpFNHODjhfiKDKvTYFFlG6I
 4668NLR78C7XrvdGkuU/fIMOqC0EsQ1KkPADHZr9yJZqQyQWXYXmWoQqJ1LDED1XITDk
 gjtT+DOMCvtdELqCKGWO70pjLtuhNbcdCXOZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNkmbPLxmBzQtQA4WlZ5lNA3PV6OlrWh8T5N9f26/rk=;
 b=d/NEvcZlBcyZhqk44GjEKOx9RuJKHg8fqgA1XBV0bOOXuGGkpH48aXgRPH+pS6aKEJ
 eoYjICTz9en455ZxhLvm1+w/8bzI76c5tfWPS0MCE+tLiHgd0HP462FKV9iUlhA6warA
 SpRRaw+vfygT71pNfsnHGcawbKgXMQQwOXUSYNGLtN1onmKAe2zhnEkPnjUR9AC0dtyw
 R/jKWU6n1cfmSaEtKvefLXcdPv0tKmvwoQBOe6GlDKHTpSDhUAfHBzw2gpESpmBGqBtj
 TwPCDZAb8Kal1F/7tHXxFPg9hWcH77CWh5oMrf7sCuPK/S+AVFWtbu8nZqFesKvO/8gu
 SjoQ==
X-Gm-Message-State: AFqh2kqOVnMX90233nixSSy4gbjs4OoysUXgxDuhMaXkEogBsaGYw2n3
 3q6zTdfS1LGJYrExgfW2cJnRFg==
X-Google-Smtp-Source: AMrXdXvf+uqiaz+qFqTZQOauEc0cu2GgM8DN67lHXsZe0vyeWWNmfX9cLwaSV4btYGfwS7PtIPtvLA==
X-Received: by 2002:a05:622a:5d96:b0:3ad:8bb2:31f5 with SMTP id
 fu22-20020a05622a5d9600b003ad8bb231f5mr11095797qtb.64.1673383669903; 
 Tue, 10 Jan 2023 12:47:49 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:9e2b:736d:6c00:da04])
 by smtp.gmail.com with ESMTPSA id
 jr49-20020a05622a803100b003ad373d04b6sm3545204qtb.59.2023.01.10.12.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:47:49 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
Date: Tue, 10 Jan 2023 15:47:42 -0500
Message-Id: <20230110204742.1354797-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org, airlied@linux.ie,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.

Tested using "modetest -P" on an MT8195.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 28 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 39 +++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +-
 4 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..667ae57c8754 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -41,6 +41,7 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CLRFMT_EXT			0x02D0
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -61,6 +62,10 @@
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)	(0xFF << 4 * (ovl))
+#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)	(depth << 4 * (ovl))
+#define OVL_CON_CLRFMT_8_BIT			0x00
+#define OVL_CON_CLRFMT_10_BIT			0x01
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -188,6 +193,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *cmdq_pkt
 			   DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(idx));
 }
 
+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
+	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
+	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
+
+	if (format == DRM_FORMAT_RGBA1010102 ||
+	    format == DRM_FORMAT_BGRA1010102 ||
+	    format == DRM_FORMAT_ARGB2101010)
+		bit_depth = OVL_CON_CLRFMT_10_BIT;
+
+	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
+
+	mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
+}
+
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -302,9 +327,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
@@ -388,6 +415,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 	}
 
+	mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..d50379c97c4b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -842,6 +842,21 @@ enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
 
 }
 
+static const char *ovls_with_10bit_cap[] = {
+	"mediatek,mt8195-disp-ovl",
+};
+
+static bool is_10bit_cap_device(void)
+{
+	for (int i = 0; i < ARRAY_SIZE(ovls_with_10bit_cap); i++) {
+		if (of_find_compatible_node(NULL, NULL,
+					    ovls_with_10bit_cap[i]))
+			return true;
+	}
+
+	return false;
+}
+
 static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 					 struct mtk_drm_crtc *mtk_crtc,
 					 int comp_idx, int pipe)
@@ -849,6 +864,7 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 	int num_planes = mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_idx);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[comp_idx];
 	int i, ret;
+	bool supports_10bit = is_10bit_cap_device();
 
 	for (i = 0; i < num_planes; i++) {
 		ret = mtk_plane_init(drm_dev,
@@ -856,7 +872,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 				BIT(pipe),
 				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
 							num_planes),
-				mtk_ddp_comp_supported_rotations(comp));
+				mtk_ddp_comp_supported_rotations(comp),
+				supports_10bit);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index d54fbf34b000..7fe5c47b4d50 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -12,6 +12,8 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/align.h>
+#include <drm/drm_plane_helper.h>
+#include <linux/of.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -19,7 +21,7 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-static const u32 formats[] = {
+static const u32 default_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -41,6 +43,22 @@ static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_INVALID,
 };
 
+static const u32 formats_with_10bit_cap[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 static void mtk_plane_reset(struct drm_plane *plane)
 {
 	struct mtk_plane_state *state;
@@ -315,13 +333,24 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations)
+		   unsigned int supported_rotations, bool supports_10bit)
 {
 	int err;
 
-	err = drm_universal_plane_init(dev, plane, possible_crtcs,
-				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), modifiers, type, NULL);
+	if (supports_10bit) {
+		err = drm_universal_plane_init(dev, plane, possible_crtcs,
+					       &mtk_plane_funcs,
+					       formats_with_10bit_cap,
+					       ARRAY_SIZE(formats_with_10bit_cap),
+					       modifiers, type, NULL);
+	} else {
+		err = drm_universal_plane_init(dev, plane, possible_crtcs,
+					       &mtk_plane_funcs,
+					       default_formats,
+					       ARRAY_SIZE(default_formats),
+					       modifiers, type, NULL);
+	}
+
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 8f39011cdbfc..d3e6f29a1e25 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations);
+		   unsigned int supported_rotations, bool supports_10bit);
 
 #endif
-- 
2.39.0.314.g84b9a713c41-goog

