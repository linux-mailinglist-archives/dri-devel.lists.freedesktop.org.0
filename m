Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA435E7490
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7278610E409;
	Fri, 23 Sep 2022 07:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858210E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 18:25:38 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id i3so6811513qkl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=K4OPOib/FkASiK/pdKTjBzsh7u9haeVOPdT7s9UKa4k=;
 b=kudpyKopOM+lx64Fs9DDeQtUUpFpvZAhDMFmvkkXisFSyTXh5A5AZO5MvtgiAdFTtk
 SbZhj1gB4BhLFzi8/sjnXKLnBAvfBmZjtj0sNtQfHhBvK3spl3OXsMeL8V4vKF/sbalP
 r9rG97mvVfEr4rnocMcKHGmA5yfSyMpcvRYfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=K4OPOib/FkASiK/pdKTjBzsh7u9haeVOPdT7s9UKa4k=;
 b=kcptWuc8ODk8EwvNtZvj/tIVDbbR8dtvrLJtzMYezi7Qc3YkwdgSWLn1aAiVnLRAg5
 aa5oHrVEfByR8gWptt7n97yvDXYJqo/SRkSppMFyNpju6BokldGtS6BRWZ/uA2H9sEKr
 jAxxdh3cBHm2TjrQXdxC6D/x42oyB3gmN7XyHLVfuUhAv11oAU07trlHhIlsaoXEqIvW
 9e2XVLOgwfa1EEj9gMiiIakOSGyjmfrNfofa4ync+8+0HsmZ01IcenOycRsKTQwVItrZ
 mhKXRz8/Xb52AFyJLxvxoE0I7XpL/0IwwIOKCddNbfy1xW2EzRWQr3RxJgHO38IG0yTa
 3Ksg==
X-Gm-Message-State: ACrzQf175p7cpIijLrj+6zasIUnZ9blCla/FjWGs0RqERAm7Av7hmyLI
 QIuYlAy8bGi0sKwnjDAmOJM6Edz6Qzf1Fw==
X-Google-Smtp-Source: AMsMyM4XbZn52+6iwkBC7TxmgJtY/sULfkonkRxNCqV/NFAMC1y/0+xTORCQYhcFuCA/yw/YMWdDAg==
X-Received: by 2002:a05:620a:c50:b0:6be:9b62:6e9d with SMTP id
 u16-20020a05620a0c5000b006be9b626e9dmr3101290qki.67.1663871137604; 
 Thu, 22 Sep 2022 11:25:37 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:9ad4:598b:bfd:47de])
 by smtp.gmail.com with ESMTPSA id
 bn41-20020a05620a2ae900b006bb9e4b96e6sm4228431qkb.24.2022.09.22.11.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 11:25:37 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Add AFBC support to Mediatek DRM driver
Date: Thu, 22 Sep 2022 14:25:32 -0400
Message-Id: <20220922182532.1911982-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 07:09:53 +0000
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
 jason-jh.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add AFBC support to Mediatek DRM driver and enable on MT8195.

Tested on MT8195 and confirmed both correct video output and improved DRAM
bandwidth performance.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 106 ++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |  37 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |   8 ++
 3 files changed, 138 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 002b0f6cae1a..7425c88964d0 100644
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
@@ -172,7 +180,20 @@ void mtk_ovl_stop(struct device *dev)
 		reg = reg & ~OVL_LAYER_SMI_ID_EN;
 		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	}
+}
+
+void mtk_ovl_set_afbc(struct device *dev, struct cmdq_pkt *cmdq_pkt, int idx, bool enabled)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
 
+	reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	if (enabled)
+		reg = reg | OVL_LAYER_AFBC_EN(idx);
+	else
+		reg = reg & ~OVL_LAYER_AFBC_EN(idx);
+
+	mtk_ddp_write_relaxed(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_DATAPATH_CON);
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
@@ -208,6 +229,8 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 {
 	struct drm_plane_state *state = &mtk_state->base;
 	unsigned int rotation = 0;
+	unsigned long long modifier;
+	unsigned int fourcc;
 
 	rotation = drm_rotation_simplify(state->rotation,
 					 DRM_MODE_ROTATE_0 |
@@ -226,6 +249,30 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && rotation != 0)
 		return -EINVAL;
 
+	if (state->fb->modifier) {
+		struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+		if (!ovl->data->supports_afbc)
+			return -EINVAL;
+
+		modifier = state->fb->modifier;
+
+		if (modifier != DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+							AFBC_FORMAT_MOD_SPLIT |
+							AFBC_FORMAT_MOD_SPARSE))
+			return -EINVAL;
+
+		fourcc = state->fb->format->format;
+		if (fourcc != DRM_FORMAT_BGRA8888 &&
+		    fourcc != DRM_FORMAT_ABGR8888 &&
+		    fourcc != DRM_FORMAT_ARGB8888 &&
+		    fourcc != DRM_FORMAT_XRGB8888 &&
+		    fourcc != DRM_FORMAT_XBGR8888 &&
+		    fourcc != DRM_FORMAT_RGB888 &&
+		    fourcc != DRM_FORMAT_BGR888)
+			return -EINVAL;
+	}
+
 	state->rotation = rotation;
 
 	return 0;
@@ -310,11 +357,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
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
+	bool is_afbc = pending->modifier;
 
 	if (!pending->enable) {
 		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
@@ -335,16 +385,39 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
-	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_PITCH(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_SRC_SIZE(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_ADDR(ovl, idx));
+	mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);
+	if (!is_afbc) {
+		mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_CON(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, pitch & 0xFFFF, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_PITCH(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_SRC_SIZE(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_OFFSET(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_ADDR(ovl, idx));
+	} else {
+		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_ADDR(ovl, idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_HDR_ADDR(ovl, idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_SRC_SIZE(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt,
+				      OVL_PITCH_MSB_2ND_SUBBUF | ((pitch >> 16) & 0xFFFF),
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, pitch & 0xFFFF, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_PITCH(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_CON(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_OFFSET(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_CLIP(idx));
+	}
 
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
@@ -492,6 +565,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
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
@@ -505,6 +587,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
 	  .data = &mt8192_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-ovl",
+	  .data = &mt8195_ovl_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 5c0d9ce69931..734d2554b2b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <linux/align.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -52,6 +53,7 @@ static void mtk_plane_reset(struct drm_plane *plane)
 
 	state->base.plane = plane;
 	state->pending.format = DRM_FORMAT_RGB565;
+	state->pending.modifier = 0;
 }
 
 static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane)
@@ -120,21 +122,52 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	struct drm_gem_object *gem;
 	struct mtk_drm_gem_obj *mtk_gem;
 	unsigned int pitch, format;
+	unsigned long long modifier;
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
+	if (!modifier) {
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
+		// The data plane is offset by 1 additional block.
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
2.37.3.998.g577e59143f-goog

