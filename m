Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0895FE2B7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 21:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B35310E94E;
	Thu, 13 Oct 2022 19:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD6710E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:31:55 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id j21so1110647qkk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XYPkZlfSfHKkUl61QM5BDBAEXzeDUwo2dVG8b3sKnjE=;
 b=f+6EWwfyvE5YOzHVpKENwO/ILPPRAE75ITleE5sFEs1jC9cLob4pBFFkTY/QRGrhFo
 eaMDp4yaGeBAdYDJEaRT3L58A2RssZMbfMQdPqpFEyg3XfFKvSV/m4egPmdNHTums2Xm
 StTDBY2+EyZVAPNj5jd+nhrFEpClSxzLB0q8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XYPkZlfSfHKkUl61QM5BDBAEXzeDUwo2dVG8b3sKnjE=;
 b=v4wTiuEFjeA/fX/vtqD07aSlKBIrbSD/ktLJRS2Vb12/K0M1Gx+2ny5gwFz24v9m0m
 zGGyOrxD6sn0mo8F0Hwt4LHbnYOg5FEDisBhO7AL195SCg1pSOMqvDeT8rD86rQHiBZt
 IqPP1Jhh2jZsbqfVRh3jZNrewRD86VC5mZvy3dazQGQlX3qCN98tw/oPFilihOeU9zyD
 w703hEENCToa0w+MY46qNNC1RhLBXJwQiD5FU1wdUyEHtWKJ0ows7YtMGor4dwsyKSsP
 WxHLGuR5tYQgTV+vb3sn96hoFnEwMTFSJj0vm2Q6/muQhC3MHiV1k+O9pC1SOljuKK2x
 iuWg==
X-Gm-Message-State: ACrzQf0oqOI5/83rvPxIOh1BDhgUTT9ZptOcdqh24YH6hBcyJRZrCkfA
 IeYibY6c7ntfhVaZm72ecJ0AhfO9NqRMIQ==
X-Google-Smtp-Source: AMsMyM67T881fLm858txBq020TTvGofW/JF14weYWsfIgFazvnUCMoKj2kd9werpBPEBGOEbuZ7lWQ==
X-Received: by 2002:a05:620a:2942:b0:6ce:6188:60d1 with SMTP id
 n2-20020a05620a294200b006ce618860d1mr1142205qkp.363.1665689514751; 
 Thu, 13 Oct 2022 12:31:54 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:7ab2:cec5:f4fd:7c96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020ac85b03000000b00394fce5fa64sm726737qtw.9.2022.10.13.12.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 12:31:54 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4] drm/mediatek: Add AFBC support to Mediatek DRM driver
Date: Thu, 13 Oct 2022 15:31:48 -0400
Message-Id: <20221013193148.2027842-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested on MT8195 and confirmed both correct video output and improved DRAM
bandwidth performance.

v4:
* Move modifier validation to format_mod_supported function.
* Add modifiers to drm_universal_plane_init() call.
* Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
  DRM_FORMAT_LINEAR being equal to 0.
* Gate AFBC control bit writes on device compatibility.

v3:
* Replaced pitch bitshift math with union based approach.
* Refactored overlay register writes to shared code between non-AFBC and
  AFBC.
* Minor code cleanups.

v2:
* Marked mtk_ovl_set_afbc as static.
* Reflowed some lines to fit column limit.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 67 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 74 +++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  8 +++
 3 files changed, 144 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 002b0f6cae1a..6d4c0e44a2f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -29,17 +29,24 @@
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
 #define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
+#define OVL_LAYER_AFBC_EN(n)				BIT(4+n)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
 #define DISP_REG_OVL_SRC_SIZE(n)		(0x0038 + 0x20 * (n))
 #define DISP_REG_OVL_OFFSET(n)			(0x003c + 0x20 * (n))
+#define DISP_REG_OVL_PITCH_MSB(n)		(0x0040 + 0x20 * (n))
+#define OVL_PITCH_MSB_2ND_SUBBUF			BIT(16)
+#define OVL_PITCH_MSB_YUV_TRANS			BIT(20)
 #define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * (n))
+#define DISP_REG_OVL_CLIP(n)			(0x004c + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
+#define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
+#define DISP_REG_OVL_HDR_PITCH(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x08)
 
 #define GMC_THRESHOLD_BITS	16
 #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
@@ -67,6 +74,7 @@ struct mtk_disp_ovl_data {
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
+	bool supports_afbc;
 };
 
 /*
@@ -172,7 +180,22 @@ void mtk_ovl_stop(struct device *dev)
 		reg = reg & ~OVL_LAYER_SMI_ID_EN;
 		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	}
+}
+
+static void mtk_ovl_set_afbc(struct device *dev, struct cmdq_pkt *cmdq_pkt,
+			     int idx, bool enabled)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
 
+	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	if (enabled)
+		reg = reg | OVL_LAYER_AFBC_EN(idx);
+	else
+		reg = reg & ~OVL_LAYER_AFBC_EN(idx);
+
+	mtk_ddp_write_relaxed(cmdq_pkt, reg, &ovl->cmdq_reg,
+			      ovl->regs, DISP_REG_OVL_DATAPATH_CON);
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
@@ -310,11 +333,23 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 	struct mtk_plane_pending_state *pending = &state->pending;
 	unsigned int addr = pending->addr;
-	unsigned int pitch = pending->pitch & 0xffff;
+	unsigned int hdr_addr = pending->hdr_addr;
+	unsigned int pitch = pending->pitch;
+	unsigned int hdr_pitch = pending->hdr_pitch;
 	unsigned int fmt = pending->format;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
 	unsigned int con;
+	bool is_afbc = pending->modifier != DRM_FORMAT_MOD_LINEAR;
+	union overlay_pitch {
+		struct split_pitch {
+			u16 lsb;
+			u16 msb;
+		} split_pitch;
+		u32 pitch;
+	} overlay_pitch;
+
+	overlay_pitch.pitch = pitch;
 
 	if (!pending->enable) {
 		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
@@ -335,9 +370,12 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
+	if (ovl->data->supports_afbc)
+		mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);
+
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
@@ -346,6 +384,20 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_ADDR(ovl, idx));
 
+	if (is_afbc) {
+		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_HDR_ADDR(ovl, idx));
+		mtk_ddp_write_relaxed(cmdq_pkt,
+				      OVL_PITCH_MSB_2ND_SUBBUF | overlay_pitch.split_pitch.msb,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
+	} else {
+		mtk_ddp_write_relaxed(cmdq_pkt,
+				      overlay_pitch.split_pitch.msb,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
+	}
+
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
@@ -492,6 +544,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.smi_id_en = true,
 };
 
+static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.supports_afbc = true,
+};
+
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
@@ -505,6 +566,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
 	  .data = &mt8192_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-ovl",
+	  .data = &mt8195_ovl_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 5c0d9ce69931..07092e27ff24 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <linux/align.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -33,6 +34,14 @@ static const u32 formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u64 modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE),
+	DRM_FORMAT_MOD_INVALID,
+};
+
 static void mtk_plane_reset(struct drm_plane *plane)
 {
 	struct mtk_plane_state *state;
@@ -52,6 +61,7 @@ static void mtk_plane_reset(struct drm_plane *plane)
 
 	state->base.plane = plane;
 	state->pending.format = DRM_FORMAT_RGB565;
+	state->pending.modifier = DRM_FORMAT_MOD_LINEAR;
 }
 
 static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane)
@@ -72,6 +82,32 @@ static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane
 	return &state->base;
 }
 
+static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
+					   uint32_t format,
+					   uint64_t modifier)
+{
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	if (modifier != DRM_FORMAT_MOD_ARM_AFBC(
+				AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE))
+		return false;
+
+	if (format != DRM_FORMAT_XRGB8888 &&
+	    format != DRM_FORMAT_ARGB8888 &&
+	    format != DRM_FORMAT_BGRX8888 &&
+	    format != DRM_FORMAT_BGRA8888 &&
+	    format != DRM_FORMAT_ABGR8888 &&
+	    format != DRM_FORMAT_XBGR8888 &&
+	    format != DRM_FORMAT_RGB888 &&
+	    format != DRM_FORMAT_BGR888)
+		return false;
+
+	return true;
+}
+
 static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
@@ -120,21 +156,52 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	struct drm_gem_object *gem;
 	struct mtk_drm_gem_obj *mtk_gem;
 	unsigned int pitch, format;
+	u64 modifier;
 	dma_addr_t addr;
+	dma_addr_t hdr_addr = 0;
+	unsigned int hdr_pitch = 0;
 
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
 	addr = mtk_gem->dma_addr;
 	pitch = fb->pitches[0];
 	format = fb->format->format;
+	modifier = fb->modifier;
 
-	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-	addr += (new_state->src.y1 >> 16) * pitch;
+	if (modifier == DRM_FORMAT_MOD_LINEAR) {
+		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
+		addr += (new_state->src.y1 >> 16) * pitch;
+	} else {
+		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
+				      / AFBC_DATA_BLOCK_WIDTH;
+		int height_in_blocks = ALIGN(fb->height, AFBC_DATA_BLOCK_HEIGHT)
+				       / AFBC_DATA_BLOCK_HEIGHT;
+		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
+		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
+		int hdr_size;
+
+		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
+		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
+			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
+
+		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
+
+		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
+			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
+		/* The data plane is offset by 1 additional block. */
+		addr = addr + hdr_size +
+		       pitch * y_offset_in_blocks +
+		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
+		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
+	}
 
 	mtk_plane_state->pending.enable = true;
 	mtk_plane_state->pending.pitch = pitch;
+	mtk_plane_state->pending.hdr_pitch = hdr_pitch;
 	mtk_plane_state->pending.format = format;
+	mtk_plane_state->pending.modifier = modifier;
 	mtk_plane_state->pending.addr = addr;
+	mtk_plane_state->pending.hdr_addr = hdr_addr;
 	mtk_plane_state->pending.x = new_state->dst.x1;
 	mtk_plane_state->pending.y = new_state->dst.y1;
 	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
@@ -173,6 +240,7 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
 	.reset = mtk_plane_reset,
 	.atomic_duplicate_state = mtk_plane_duplicate_state,
 	.atomic_destroy_state = mtk_drm_plane_destroy_state,
+	.format_mod_supported = mtk_plane_format_mod_supported,
 };
 
 static int mtk_plane_atomic_check(struct drm_plane *plane,
@@ -254,7 +322,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 
 	err = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), NULL, type, NULL);
+				       ARRAY_SIZE(formats), modifiers, type, NULL);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 2d5ec66e3df1..8f39011cdbfc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -10,12 +10,20 @@
 #include <drm/drm_crtc.h>
 #include <linux/types.h>
 
+#define AFBC_DATA_BLOCK_WIDTH 32
+#define AFBC_DATA_BLOCK_HEIGHT 8
+#define AFBC_HEADER_BLOCK_SIZE 16
+#define AFBC_HEADER_ALIGNMENT 1024
+
 struct mtk_plane_pending_state {
 	bool				config;
 	bool				enable;
 	dma_addr_t			addr;
+	dma_addr_t			hdr_addr;
 	unsigned int			pitch;
+	unsigned int			hdr_pitch;
 	unsigned int			format;
+	unsigned long long		modifier;
 	unsigned int			x;
 	unsigned int			y;
 	unsigned int			width;
-- 
2.38.0.413.g74048e4d9e-goog

