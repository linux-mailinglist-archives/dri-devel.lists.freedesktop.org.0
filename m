Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35656B2F3F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8710E2BE;
	Thu,  9 Mar 2023 21:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A7D10E2BE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:06:29 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r5so3610766qtp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678395989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
 b=ekWyusYFBpL12RMJ+xvCmW/23PN0mVoUwpkWDXSBy7uTYlczExZGwqhsw10ZVnQ8un
 PYn6kas62DojHAnFoBGAOkxcdlbOPOB5n0THClLiUdWo7X73bttjjc2jfk3s2H636rX+
 8iwrsmG/RynX1J0PDPXWwDBGQAERmZ5+0UwjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIaFfAz3P9BLs/IYvg/JH0rGRkNx7pnu6ZolwnmHv7w=;
 b=dG2ol6/9f0oAgMuAMgegmDgmX0iAlIUoXmbpuha7WSC3pbAiexWjM43bh/zU8euRxA
 oVtL4lxpiikY5nD59Gz3j+i5g//9lVgy0sGAJBVprMeflaNM3rFudt+l4iGRPknYzHOM
 TTsX2sGAbcdH3M6yUkTzx+Y1Rt/ldyoL/w7AIkg4My3l8iVSoEVKZ5rzsAj1SVwOj+hG
 /JJPkKKsKLbqrVRKFXwsSnKaKYhmqhn0ttNpq7voUdKLpyMgpTkEgIu+AO00c7LfuunW
 HnFCAFc8Nuueew0zPloie99ccja9rprKArDbDdDac7cUZIBY0ZW6U7O9420A0t+iPXtu
 YCZw==
X-Gm-Message-State: AO0yUKVlxkgJi2k2V0jCYpCcDgG2sOPEdwydnMwXe/385Ke9C00hh/eJ
 RHF8wi8VZsVxftmW73w8z+mr9w==
X-Google-Smtp-Source: AK7set9+cW2dY4lRlZ2wjs/dFqUlUz4X6cE4Ahn/kwSWdAA3QSe5aG9VDxtlu7wjRKI3PG1mzqCYSg==
X-Received: by 2002:a05:622a:1991:b0:3b9:bc8c:c20f with SMTP id
 u17-20020a05622a199100b003b9bc8cc20fmr49172335qtc.26.1678395988941; 
 Thu, 09 Mar 2023 13:06:28 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:a575:2520:a8e1:989d])
 by smtp.gmail.com with ESMTPSA id
 r7-20020ac85c87000000b003b9bc00c2f1sm14289316qta.94.2023.03.09.13.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 13:06:28 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
Date: Thu,  9 Mar 2023 16:06:23 -0500
Message-Id: <20230309210623.1167567-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the ability for the Mediatek DRM driver to control the bit depth register.
If the DTS indicates the device supports 10-bit overlays and the current format
has a fourcc of AR30, BA30, or RA30, we set the bit depth register to 10 bit.

The next patch in the series actually enables 10-bit overlays for MT8195
devices, but this current patch should be a no-op. This patch was tested by
simply running Chrome on an MT8195 and looking for regressions.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8743c8047dc9..a6255e847104 100644
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
@@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
 	bool supports_afbc;
 	const u32 *formats;
 	size_t num_formats;
+	bool supports_clrfmt_ext;
 };
 
 /*
@@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *cmdq_pkt
 			   DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(idx));
 }
 
+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
+	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+	if (!ovl->data->supports_clrfmt_ext)
+		return;
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
+	mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
+		      ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
+}
+
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
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
@@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 	}
 
+	mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
-- 
2.39.1.456.gfc5497dd1b-goog

