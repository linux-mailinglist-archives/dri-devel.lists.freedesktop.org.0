Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435A662EEE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A710E009;
	Mon,  9 Jan 2023 18:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9412010E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:26:24 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so8575864pjf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mcw6TST58e8Q0uX2FzOQBem/d4q8P5QHY7UX1B18UwA=;
 b=PDpK/5o6LQb6tGxUuuzLarQFE5Avm1G7pdkXRnv3WVdrNO1mzU77JBhHe7FlekMFI0
 apXnVpw+Zj+dHNUJYshbu1yOPI69RWkCzhziRmdlofm9Z58V/s6eWEPGo/8Xtn2zvNiC
 twJgrjHQGqiEeSXlAKae6YJlZ+195u8CU1h+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mcw6TST58e8Q0uX2FzOQBem/d4q8P5QHY7UX1B18UwA=;
 b=paAiv7rGCyYKF3oUODZ2jteJBlvlMgPusgFVaTD5v2S7oSoWOI5DNeuXl0cUGXd7fy
 W0wByNU8FiuARnDm+Ax7ZBRDntU+alxLmW0L5OMwhG6b2GW6UHXNCH6OHmL4N1UOkUNE
 xKYssT5tQp4BAwF/AvZ2ZJv+0etnbh5BaipII1WPmPZ/oUGrJ36qJ4UExQO9/goG1p+J
 yGoO8sxOKKoxsyZMWVi0T1B0cKR4Lb4nPrkqwx4f0xSkzuVREHZgSvYFLKVRvwBfaitF
 iefySzVAFnVSaRbs4kv1hPmO31Sv+NnuuveNrjyLAuwCKcYUr0k+tti/EzpioibZ6Ikx
 x2CQ==
X-Gm-Message-State: AFqh2kodauP/plde4XZfQOb2VAPpG69+4cw3BcUhqVQHMdYo7Q4swFyD
 3KIaQlW0RAUZPargfrjpk0VRCjlFVIrQF6BbjtkNcA==
X-Google-Smtp-Source: AMrXdXs+felrXn71fDQFUAwQfKnX/2KTbDbWSMzFuSrTO/C5+epcXgDL/JBzogwsfdEgh1GHupmnDQ0/7vM2CglPvro=
X-Received: by 2002:a17:902:cf0f:b0:193:373e:513e with SMTP id
 i15-20020a170902cf0f00b00193373e513emr247496plg.23.1673288784142; Mon, 09 Jan
 2023 10:26:24 -0800 (PST)
MIME-Version: 1.0
From: Justin Green <greenjustin@chromium.org>
Date: Mon, 9 Jan 2023 13:26:13 -0500
Message-ID: <CAHC42ReC+pkKxkHdagfpQ5-hLWGAad5nWtdd4uZTDhuQz_bwMA@mail.gmail.com>
Subject: [RESEND PATCH] drm/mediatek: Add support for AR30 and BA30
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Justin Green <greenjustin@chromium.org>, airlied@linux.ie,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.

Tested using "modetest -P" on an MT8195.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 29 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 38 ++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +-
 4 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 002b0f6cae1a..be1dfc82aab2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -38,6 +38,7 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701               0x0040
+#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
 #define DISP_REG_OVL_ADDR_MT8173               0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20 * (n))

@@ -56,6 +57,10 @@
                                        0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
                                        OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
+#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
+#define OVL_CON_CLRFMT_8_BIT                   0x00
+#define OVL_CON_CLRFMT_10_BIT                  0x01
 #define        OVL_CON_AEN             BIT(8)
 #define        OVL_CON_ALPHA           0xff
 #define        OVL_CON_VIRT_FLIP       BIT(9)
@@ -175,6 +180,26 @@ void mtk_ovl_stop(struct device *dev)

 }

+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+                                 struct cmdq_pkt *cmdq_pkt)
+{
+       struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+       unsigned int reg;
+       unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+       reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
+       reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
+
+       if (format == DRM_FORMAT_RGBA1010102 ||
+           format == DRM_FORMAT_BGRA1010102 ||
+           format == DRM_FORMAT_ARGB2101010)
+               bit_depth = OVL_CON_CLRFMT_10_BIT;
+
+       reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
+
+       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs,
DISP_REG_OVL_CLRFMT_EXT);
+}
+
 void mtk_ovl_config(struct device *dev, unsigned int w,
                    unsigned int h, unsigned int vrefresh,
                    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -289,9 +314,11 @@ static unsigned int ovl_fmt_convert(struct
mtk_disp_ovl *ovl, unsigned int fmt)
                return OVL_CON_CLRFMT_ARGB8888;
        case DRM_FORMAT_BGRX8888:
        case DRM_FORMAT_BGRA8888:
+       case DRM_FORMAT_BGRA1010102:
                return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
        case DRM_FORMAT_XRGB8888:
        case DRM_FORMAT_ARGB8888:
+       case DRM_FORMAT_ARGB2101010:
                return OVL_CON_CLRFMT_RGBA8888;
        case DRM_FORMAT_XBGR8888:
        case DRM_FORMAT_ABGR8888:
@@ -346,6 +373,8 @@ void mtk_ovl_layer_config(struct device *dev,
unsigned int idx,
        mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
                              DISP_REG_OVL_ADDR(ovl, idx));

+       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
+
        mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 42cc7052b050..b2b944344c7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -843,6 +843,21 @@ enum drm_plane_type
mtk_drm_crtc_plane_type(unsigned int plane_idx,

 }

+static const char *ovls_with_10bit_cap[] = {
+       "mediatek,mt8195-disp-ovl",
+};
+
+static bool is_10bit_cap_device(void)
+{
+       for (int i = 0; i < ARRAY_SIZE(ovls_with_10bit_cap); i++) {
+               if (of_find_compatible_node(NULL, NULL,
+                                           ovls_with_10bit_cap[i]))
+                       return true;
+       }
+
+       return false;
+}
+
 static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
                                         struct mtk_drm_crtc *mtk_crtc,
                                         int comp_idx, int pipe)
@@ -850,6 +865,7 @@ static int mtk_drm_crtc_init_comp_planes(struct
drm_device *drm_dev,
        int num_planes = mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_idx);
        struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[comp_idx];
        int i, ret;
+       bool supports_10bit = is_10bit_cap_device();

        for (i = 0; i < num_planes; i++) {
                ret = mtk_plane_init(drm_dev,
@@ -857,7 +873,8 @@ static int mtk_drm_crtc_init_comp_planes(struct
drm_device *drm_dev,
                                BIT(pipe),
                                mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
                                                        num_planes),
-                               mtk_ddp_comp_supported_rotations(comp));
+                               mtk_ddp_comp_supported_rotations(comp),
+                               supports_10bit);
                if (ret)
                        return ret;

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 5c0d9ce69931..2726344b5696 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <linux/of.h>

 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -19,7 +20,7 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"

-static const u32 formats[] = {
+static const u32 default_formats[] = {
        DRM_FORMAT_XRGB8888,
        DRM_FORMAT_ARGB8888,
        DRM_FORMAT_BGRX8888,
@@ -33,6 +34,22 @@ static const u32 formats[] = {
        DRM_FORMAT_YUYV,
 };

+static const u32 formats_with_10bit_cap[] = {
+       DRM_FORMAT_XRGB8888,
+       DRM_FORMAT_ARGB8888,
+       DRM_FORMAT_ARGB2101010,
+       DRM_FORMAT_BGRX8888,
+       DRM_FORMAT_BGRA8888,
+       DRM_FORMAT_BGRA1010102,
+       DRM_FORMAT_ABGR8888,
+       DRM_FORMAT_XBGR8888,
+       DRM_FORMAT_RGB888,
+       DRM_FORMAT_BGR888,
+       DRM_FORMAT_RGB565,
+       DRM_FORMAT_UYVY,
+       DRM_FORMAT_YUYV,
+};
+
 static void mtk_plane_reset(struct drm_plane *plane)
 {
        struct mtk_plane_state *state;
@@ -248,13 +265,24 @@ static const struct drm_plane_helper_funcs
mtk_plane_helper_funcs = {

 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
                   unsigned long possible_crtcs, enum drm_plane_type type,
-                  unsigned int supported_rotations)
+                  unsigned int supported_rotations, bool supports_10bit)
 {
        int err;

-       err = drm_universal_plane_init(dev, plane, possible_crtcs,
-                                      &mtk_plane_funcs, formats,
-                                      ARRAY_SIZE(formats), NULL, type, NULL);
+       if (supports_10bit) {
+               err = drm_universal_plane_init(dev, plane, possible_crtcs,
+                                              &mtk_plane_funcs,
+                                              formats_with_10bit_cap,
+
ARRAY_SIZE(formats_with_10bit_cap),
+                                              NULL, type, NULL);
+       } else {
+               err = drm_universal_plane_init(dev, plane, possible_crtcs,
+                                              &mtk_plane_funcs,
+                                              default_formats,
+                                              ARRAY_SIZE(default_formats),
+                                              NULL, type, NULL);
+       }
+
        if (err) {
                DRM_ERROR("failed to initialize plane\n");
                return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 2d5ec66e3df1..49737153f0a6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -40,6 +40,6 @@ to_mtk_plane_state(struct drm_plane_state *state)

 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
                   unsigned long possible_crtcs, enum drm_plane_type type,
-                  unsigned int supported_rotations);
+                  unsigned int supported_rotations, bool supports_10bit);

 #endif
--
2.38.1.431.g37b22c650d-goog
