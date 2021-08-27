Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CF3F99B3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BC26E95B;
	Fri, 27 Aug 2021 13:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F966E951
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:24:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso7391747wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oz+wOwBuEl0p3TboVYoVjX59ANwCVhs4qYVyO4fgJ58=;
 b=iJr/s6GuJfab1UBYyJhk9akDqzal8yI7uv8+cg1RUJpTszg6jlTxnxPhdZg44zwa2L
 LIljMNNEvITUfSGCVeu5dO6NDNxNOe1LpmW5pWExvemOou8/bU7O4P5qz59vf51WFoCg
 zQ/s/MTs8ZQqLjlY4nS1r0ofMML5ByMfRc7l9ZO9djiwCqEjBT2GgIc1zIpKuBcq4vci
 hdunpSnv6vJl5FiUOG4WY0wKJdJPTLG6KG6DUWy6c0SU3K3asAheyuQcUpjVOZ0Hu5Ep
 Z/Y1lz/EdnFInlAL1VPWt0XZ7V0XX6lvqlFf+L0xSBiv7FxgbRSh+fHsLhUIpdAP1F2n
 2ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oz+wOwBuEl0p3TboVYoVjX59ANwCVhs4qYVyO4fgJ58=;
 b=tVqygS4SxyYCRCCLgZZft71ngqcXV8UX1IW28fImN2IoYJqQWWD4zQxWXLn5ApucVx
 W4edVQpUoEW8hC9aZVeEmqWDiLbV+5cPpe4a+NOqVpXZQcQfEnV9LlYEZbvc7OB+IY8d
 /4z1c19zfetAFSaY/BKorsUm7v4ZfuJbSBeQDse8dNXpY99W5BKDo6EOEVyT7dxdxyyb
 NPiLNkOuCDop21iAnrn3KwEoKzJYcglYdwcsNunaw0djYZDl4AZVmc0/010qKhZkwenT
 rg83r2mi4eVFyjcjsHiDX20fnY+DNKaDhyYpH6882OtFaAiX2uwhdriu4M2tAQy9W95p
 SQiA==
X-Gm-Message-State: AOAM533Zxt71sJZP1E2e8e5SXwtmNUnmwFud3n2KQa5MZ7Cqu3OXgW3I
 byYrxVR9rB8oTSGdYoIugQQ=
X-Google-Smtp-Source: ABdhPJy7VMBU7VkIBlEIyBc1a4RoeeX/QpMa5oPXi8RC4sRl1BEEkMGkxmH4OfAYVmklq6//PWXmpQ==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr19565991wmi.74.1630070641613; 
 Fri, 27 Aug 2021 06:24:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l124sm6953971wml.8.2021.08.27.06.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 22/25] tests: tegra: Add VIC 4.2 support
Date: Fri, 27 Aug 2021 15:23:02 +0200
Message-Id: <20210827132305.3572077-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The Video Image Composer (VIC) 4.2 can be found on NVIDIA Tegra194 SoCs.
It uses a different class (C5B6) that is slightly incompatible with the
class found on earlier generations, although it is backwards compatible
with the class implemented on Tegra186 (B1B6).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       |   7 +
 tests/tegra/vic42.c     | 423 ++++++++++++++++++++++++++++
 tests/tegra/vic42.h     | 597 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1029 insertions(+)
 create mode 100644 tests/tegra/vic42.c
 create mode 100644 tests/tegra/vic42.h

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index ad5d38bcd8dc..d71d3d564efe 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -40,6 +40,8 @@ libdrm_test_tegra = static_library(
     'vic40.h',
     'vic41.c',
     'vic41.h',
+    'vic42.c',
+    'vic42.h',
   ), config_file ],
   include_directories : [inc_root, inc_drm, inc_tegra],
   link_with : libdrm,
diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
index 9403a46a7050..8e65eb96c316 100644
--- a/tests/tegra/vic.c
+++ b/tests/tegra/vic.c
@@ -142,6 +142,10 @@ int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
 int vic41_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
               struct vic **vicp);
 
+/* from vic42.c */
+int vic42_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp);
+
 int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
             struct vic **vicp)
 {
@@ -158,6 +162,9 @@ int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
 
     case 0x18:
         return vic41_new(drm, channel, vicp);
+
+    case 0x19:
+        return vic42_new(drm, channel, vicp);
     }
 
     return -ENOTSUP;
diff --git a/tests/tegra/vic42.c b/tests/tegra/vic42.c
new file mode 100644
index 000000000000..fec22ceb42a0
--- /dev/null
+++ b/tests/tegra/vic42.c
@@ -0,0 +1,423 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <errno.h>
+#include <string.h>
+
+#include "private.h"
+#include "tegra.h"
+#include "vic.h"
+#include "vic42.h"
+
+struct vic42 {
+    struct vic base;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } config;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } filter;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } hist;
+};
+
+static int vic42_clear(struct vic *v, struct vic_image *output,
+                       unsigned int alpha, unsigned int red,
+                       unsigned int green, unsigned int blue)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = 0;
+    c->outputConfig.TargetRectLeft = 0;
+    c->outputConfig.TargetRectRight = output->width - 1;
+    c->outputConfig.TargetRectBottom = output->height - 1;
+    c->outputConfig.BackgroundAlpha = alpha;
+    c->outputConfig.BackgroundR = red;
+    c->outputConfig.BackgroundG = green;
+    c->outputConfig.BackgroundB = blue;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    printf("OutLumaWidth: %u\n", c->outputSurfaceConfig.OutLumaWidth);
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    if (1) {
+        FILE *fp = fopen("/tmp/configstruct.bin", "wb");
+        fwrite(c, sizeof(*c), 1, fp);
+        fclose(fp);
+    }
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic42_fill(struct vic *v, struct vic_image *output,
+                      unsigned int left, unsigned int top,
+                      unsigned int right, unsigned int bottom,
+                      unsigned int alpha, unsigned int red,
+                      unsigned int green, unsigned int blue)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = top;
+    c->outputConfig.TargetRectLeft = left;
+    c->outputConfig.TargetRectRight = right;
+    c->outputConfig.TargetRectBottom = bottom;
+    c->outputConfig.BackgroundAlpha = alpha;
+    c->outputConfig.BackgroundR = red;
+    c->outputConfig.BackgroundG = green;
+    c->outputConfig.BackgroundB = blue;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic42_blit(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+    SlotSurfaceConfig *surface;
+    SlotConfig *slot;
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = 0;
+    c->outputConfig.TargetRectLeft = 0;
+    c->outputConfig.TargetRectRight = output->width - 1;
+    c->outputConfig.TargetRectBottom = output->height - 1;
+    c->outputConfig.BackgroundAlpha = 255;
+    c->outputConfig.BackgroundR = 1023;
+    c->outputConfig.BackgroundG = 1023;
+    c->outputConfig.BackgroundB = 1023;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    slot = &c->slotStruct[0].slotConfig;
+    slot->SlotEnable = 1;
+    slot->CurrentFieldEnable = 1;
+    slot->PlanarAlpha = 255;
+    slot->ConstantAlpha = 1;
+    slot->SourceRectLeft = 0 << 16;
+    slot->SourceRectRight = (input->width - 1) << 16;
+    slot->SourceRectTop = 0 << 16;
+    slot->SourceRectBottom = (input->height - 1) << 16;
+    slot->DestRectLeft = 0;
+    slot->DestRectRight = output->width - 1;
+    slot->DestRectTop = 0;
+    slot->DestRectBottom = output->height - 1;
+    slot->SoftClampHigh = 1023;
+
+    surface = &c->slotStruct[0].slotSurfaceConfig;
+    surface->SlotPixelFormat = input->format;
+    surface->SlotBlkKind = input->kind;
+    surface->SlotBlkHeight = 0; /* XXX */
+    surface->SlotCacheWidth = VIC_CACHE_WIDTH_64Bx4; /* XXX */
+    surface->SlotSurfaceWidth = input->width - 1;
+    surface->SlotSurfaceHeight = input->height - 1;
+    surface->SlotLumaWidth = input->stride - 1;
+    surface->SlotLumaHeight = input->height - 1;
+    surface->SlotChromaWidth = 16383;
+    surface->SlotChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic42_flip(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+    SlotSurfaceConfig *surface;
+    SlotConfig *slot;
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = 0;
+    c->outputConfig.TargetRectLeft = 0;
+    c->outputConfig.TargetRectRight = output->width - 1;
+    c->outputConfig.TargetRectBottom = output->height - 1;
+    c->outputConfig.BackgroundAlpha = 255;
+    c->outputConfig.BackgroundR = 1023;
+    c->outputConfig.BackgroundG = 1023;
+    c->outputConfig.BackgroundB = 1023;
+    c->outputConfig.OutputFlipY = 1;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    slot = &c->slotStruct[0].slotConfig;
+    slot->SlotEnable = 1;
+    slot->CurrentFieldEnable = 1;
+    slot->PlanarAlpha = 255;
+    slot->ConstantAlpha = 1;
+    slot->SourceRectLeft = 0 << 16;
+    slot->SourceRectRight = (input->width - 1) << 16;
+    slot->SourceRectTop = 0 << 16;
+    slot->SourceRectBottom = (input->height - 1) << 16;
+    slot->DestRectLeft = 0;
+    slot->DestRectRight = output->width - 1;
+    slot->DestRectTop = 0;
+    slot->DestRectBottom = output->height - 1;
+    slot->SoftClampHigh = 1023;
+
+    surface = &c->slotStruct[0].slotSurfaceConfig;
+    surface->SlotPixelFormat = input->format;
+    surface->SlotBlkKind = input->kind;
+    surface->SlotBlkHeight = 0; /* XXX */
+    surface->SlotCacheWidth = VIC_CACHE_WIDTH_64Bx4; /* XXX */
+    surface->SlotSurfaceWidth = input->width - 1;
+    surface->SlotSurfaceHeight = input->height - 1;
+    surface->SlotLumaWidth = input->stride - 1;
+    surface->SlotLumaHeight = input->height - 1;
+    surface->SlotChromaWidth = 16383;
+    surface->SlotChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic42_execute(struct vic *v, struct drm_tegra_pushbuf *pushbuf,
+                         uint32_t **ptrp, struct vic_image *output,
+                         struct vic_image **inputs, unsigned int num_inputs)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+    unsigned int i;
+
+    if (num_inputs > 1)
+        return -EINVAL;
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID, 1);
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS, (sizeof(ConfigStruct) / 16) << 16);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET, vic->config.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_SET_FILTER_STRUCT_OFFSET, vic->filter.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET, output->map, 0, 0);
+
+    for (i = 0; i < num_inputs; i++) {
+        uint32_t method = NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE0_LUMA_OFFSET(0) + (i * 3) * 4;
+
+        VIC_PUSH_BUFFER(pushbuf, ptrp, method, inputs[i]->map, 0, 0);
+    }
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVC5B6_VIDEO_COMPOSITOR_EXECUTE, 1 << 8);
+
+    return 0;
+}
+
+static void vic42_free(struct vic *v)
+{
+    struct vic42 *vic = container_of(v, struct vic42, base);
+
+    drm_tegra_channel_unmap(vic->hist.map);
+    drm_tegra_bo_unref(vic->hist.bo);
+
+    drm_tegra_channel_unmap(vic->filter.map);
+    drm_tegra_bo_unref(vic->filter.bo);
+
+    drm_tegra_channel_unmap(vic->config.map);
+    drm_tegra_bo_unref(vic->config.bo);
+
+    drm_tegra_syncpoint_free(v->syncpt);
+
+    free(vic);
+}
+
+static const struct vic_ops vic42_ops = {
+    .clear = vic42_clear,
+    .fill = vic42_fill,
+    .blit = vic42_blit,
+    .flip = vic42_flip,
+    .execute = vic42_execute,
+    .free = vic42_free,
+};
+
+int vic42_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp)
+{
+    struct vic42 *vic;
+    void *ptr;
+    int err;
+
+    vic = calloc(1, sizeof(*vic));
+    if (!vic)
+        return -ENOMEM;
+
+    vic->base.drm = drm;
+    vic->base.channel = channel;
+    vic->base.ops = &vic42_ops;
+    vic->base.version = 0x19;
+
+    err = drm_tegra_syncpoint_new(drm, &vic->base.syncpt);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 16384, &vic->config.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate configuration structurer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_channel_map(channel, vic->config.bo, DRM_TEGRA_CHANNEL_MAP_READ,
+                                &vic->config.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 16384, &vic->filter.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate filter buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_map(vic->filter.bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map filter buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    memset(ptr, 0, 16384);
+    drm_tegra_bo_unmap(vic->filter.bo);
+
+    err = drm_tegra_channel_map(channel, vic->filter.bo, DRM_TEGRA_CHANNEL_MAP_READ,
+                                &vic->filter.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map filter buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 4096, &vic->hist.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate history buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_map(vic->hist.bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map history buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    memset(ptr, 0, 4096);
+    drm_tegra_bo_unmap(vic->hist.bo);
+
+    err = drm_tegra_channel_map(channel, vic->hist.bo, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                                &vic->hist.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map histogram buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    if (vicp)
+        *vicp = &vic->base;
+
+    return 0;
+}
diff --git a/tests/tegra/vic42.h b/tests/tegra/vic42.h
new file mode 100644
index 000000000000..3ed5cdbd3b6c
--- /dev/null
+++ b/tests/tegra/vic42.h
@@ -0,0 +1,597 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef VIC42_H
+#define VIC42_H
+
+#include <stdint.h>
+
+#define NVC5B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID 0x00000200
+#define NVC5B6_VIDEO_COMPOSITOR_EXECUTE 0x00000300
+#define NVC5B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS 0x00000704
+#define NVC5B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET 0x00000708
+#define NVC5B6_VIDEO_COMPOSITOR_SET_FILTER_STRUCT_OFFSET 0x0000070c
+#define NVC5B6_VIDEO_COMPOSITOR_SET_HIST_OFFSET 0x00000714
+#define NVC5B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET 0x00000720
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE0_LUMA_OFFSET(slot) (0x00001200 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE0_CHROMA_U_OFFSET(slot) (0x00001204 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE0_CHROMA_V_OFFSET(slot) (0x00001208 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE1_LUMA_OFFSET(slot) (0x0000120c + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE1_CHROMA_U_OFFSET(slot) (0x00001210 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE1_CHROMA_V_OFFSET(slot) (0x00001214 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE2_LUMA_OFFSET(slot) (0x00001218 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE2_CHROMA_U_OFFSET(slot) (0x0000121c + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE2_CHROMA_V_OFFSET(slot) (0x00001220 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE3_LUMA_OFFSET(slot) (0x00001224 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE3_CHROMA_U_OFFSET(slot) (0x00001228 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE3_CHROMA_V_OFFSET(slot) (0x0000122c + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE4_LUMA_OFFSET(slot) (0x00001230 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE4_CHROMA_U_OFFSET(slot) (0x00001234 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE4_CHROMA_V_OFFSET(slot) (0x00001238 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE5_LUMA_OFFSET(slot) (0x0000123c + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE5_CHROMA_U_OFFSET(slot) (0x00001240 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE5_CHROMA_V_OFFSET(slot) (0x00001244 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE6_LUMA_OFFSET(slot) (0x00001248 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE6_CHROMA_U_OFFSET(slot) (0x0000124c + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE6_CHROMA_V_OFFSET(slot) (0x00001250 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE7_LUMA_OFFSET(slot) (0x00001254 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE7_CHROMA_U_OFFSET(slot) (0x00001258 + (slot) * 0x00000060)
+#define NVC5B6_VIDEO_COMPOSITOR_SET_SURFACE7_CHROMA_V_OFFSET(slot) (0x0000125c + (slot) * 0x00000060)
+
+typedef struct {
+    uint64_t SlotEnable : 1; /* 0 */
+    uint64_t DeNoise : 1; /* 1 */
+    uint64_t AdvancedDenoise : 1; /* 2 */
+    uint64_t CadenceDetect : 1; /* 3 */
+    uint64_t MotionMap : 1; /* 4 */
+    uint64_t MMapCombine : 1; /* 5 */
+    uint64_t IsEven : 1; /* 6 */
+    uint64_t ChromaEven : 1; /* 7 */
+    uint64_t CurrentFieldEnable : 1; /* 8 */
+    uint64_t PrevFieldEnable : 1; /* 9 */
+    uint64_t NextFieldEnable : 1; /* 10 */
+    uint64_t NextNrFieldEnable : 1; /* 11 */
+    uint64_t CurMotionFieldEnable : 1; /* 12 */
+    uint64_t PrevMotionFieldEnable : 1; /* 13 */
+    uint64_t PpMotionFieldEnable : 1; /* 14 */
+    uint64_t CombMotionFieldEnable : 1; /* 15 */
+    uint64_t FrameFormat : 4; /* 19..16 */
+    uint64_t FilterLengthY : 2; /* 21..20 */
+    uint64_t FilterLengthX : 2; /* 23..22 */
+    uint64_t Panoramic : 12; /* 35..24 */
+    uint64_t ChromaUpLengthY : 2; /* 37..36 */
+    uint64_t ChromaUpLengthX : 2; /* 39..38 */
+    uint64_t reserved1 : 18; /* 57..40 */
+    uint64_t DetailFltClamp : 6; /* 63..58 */
+    uint64_t FilterNoise : 10; /* 73..64 */
+    uint64_t FilterDetail : 10; /* 83..74 */
+    uint64_t ChromaNoise : 10; /* 93..84 */
+    uint64_t ChromaDetail : 10; /* 103..94 */
+    uint64_t DeinterlaceMode : 4; /* 107..104 */
+    uint64_t MotionAccumWeight : 3; /* 110..108 */
+    uint64_t NoiseIir : 11; /* 121..111 */
+    uint64_t LightLevel : 4; /* 125..122 */
+    uint64_t reserved4 : 2; /* 127..126 */
+    /* 128 */
+    uint64_t SoftClampLow : 10; /* 9..0 */
+    uint64_t SoftClampHigh : 10; /* 19..10 */
+    uint64_t reserved5 : 12; /* 31..20 */
+    uint64_t reserved6 : 2; /* 33..32 */
+    uint64_t PlanarAlpha : 8; /* 41..34 */
+    uint64_t ConstantAlpha : 1; /* 42 */
+    uint64_t StereoInterleave : 3; /* 45..43 */
+    uint64_t ClipEnabled : 1; /* 46 */
+    uint64_t ClearRectMask : 8; /* 54..47 */
+    uint64_t DegammaMode : 2; /* 56..55 */
+    uint64_t reserved7 : 1; /* 57 */
+    uint64_t DecompressEnable : 1; /* 58 */
+    uint64_t DecompressKind : 4; /* 62..59 */
+    uint64_t reserved9 : 1; /* 63 */
+    uint64_t DecompressCtbCount : 8; /* 71..64 */
+    uint64_t DecompressZbcColor : 32; /* 103..72 */
+    uint64_t reserved12 : 24; /* 127..104 */
+    /* 256 */
+    uint64_t SourceRectLeft : 30; /* 29..0 */
+    uint64_t reserved14 : 2; /* 31..30 */
+    uint64_t SourceRectRight : 30; /* 61..32 */
+    uint64_t reserved15 : 2; /* 63..62 */
+    uint64_t SourceRectTop : 30; /* 93..64 */
+    uint64_t reserved16 : 2; /* 95..94 */
+    uint64_t SourceRectBottom : 30; /* 125..96 */
+    uint64_t reserved17 : 2; /* 127..126 */
+    /* 384 */
+    uint64_t DestRectLeft : 14; /* 13..0 */
+    uint64_t reserved18 : 2; /* 15..14 */
+    uint64_t DestRectRight : 14; /* 29..16 */
+    uint64_t reserved19 : 2; /* 31..30 */
+    uint64_t DestRectTop : 14; /* 45..32 */
+    uint64_t reserved20 : 2; /* 47..46 */
+    uint64_t DestRectBottom : 14; /* 61..48 */
+    uint64_t reserved21 : 2; /* 63..62 */
+    uint64_t B16ScalerEnable : 1; /* 64 */
+    uint64_t reserved22 : 31; /* 95..65 */
+    uint64_t reserved23 : 32; /* 127..96 */
+} SlotConfig;
+
+typedef struct {
+    uint64_t SlotPixelFormat : 7; /* 6..0 */
+    uint64_t SlotChromaLocHORIZ : 2; /* 8..7 */
+    uint64_t SlotChromaLocVert : 2; /* 10..9 */
+    uint64_t SlotBlkKind : 4; /* 14..11 */
+    uint64_t SlotBlkHeight : 4; /* 18..15 */
+    uint64_t SlotCacheWidth : 3; /* 21..19 */
+    uint64_t reserved0 : 10; /* 31..22 */
+    uint64_t SlotSurfaceWidth : 14; /* 45..32 */
+    uint64_t SlotSurfaceHeight : 14; /* 59..46 */
+    uint64_t reserved1 : 4; /* 63..60 */
+    uint64_t SlotLumaWidth : 14; /* 77..64 */
+    uint64_t SlotLumaHeight : 14; /* 91..78 */
+    uint64_t reserved2 : 4; /* 95..92 */
+    uint64_t SlotChromaWidth : 14; /* 109..96 */
+    uint64_t SlotChromaHeight : 14; /* 123..110 */
+    uint64_t reserved3 : 4; /* 127..124 */
+} SlotSurfaceConfig;
+
+typedef struct {
+    uint64_t luma_coeff0 : 20; /* 19..0 */
+    uint64_t luma_coeff1 : 20; /* 39..20 */
+    uint64_t luma_coeff2 : 20; /* 59..40 */
+    uint64_t luma_r_shift : 4; /* 63..60 */
+    uint64_t luma_coeff3 : 20; /* 83..64 */
+    uint64_t LumaKeyLower : 10; /* 93..84 */
+    uint64_t LumaKeyUpper : 10; /* 103..94 */
+    uint64_t LumaKeyEnabled : 1; /* 104 */
+    uint64_t reserved0 : 2; /* 106..105 */
+    uint64_t reserved1 : 21; /* 127..107 */
+} LumaKeyStruct;
+
+typedef struct {
+    uint64_t matrix_coeff00 : 20; /* 19..0 */
+    uint64_t matrix_coeff10 : 20; /* 39..20 */
+    uint64_t matrix_coeff20 : 20; /* 59..40 */
+    uint64_t matrix_r_shift : 4; /* 63..60 */
+    uint64_t matrix_coeff01 : 20; /* 83..64 */
+    uint64_t matrix_coeff11 : 20; /* 103..84 */
+    uint64_t matrix_coeff21 : 20; /* 123..104 */
+    uint64_t reserved0 : 3; /* 126..124 */
+    uint64_t matrix_enable : 1; /* 127 */
+    /* 128 */
+    uint64_t matrix_coeff02 : 20; /* 19..0 */
+    uint64_t matrix_coeff12 : 20; /* 39..20 */
+    uint64_t matrix_coeff22 : 20; /* 59..40 */
+    uint64_t reserved1 : 4; /* 63..60 */
+    uint64_t matrix_coeff03 : 20; /* 83..64 */
+    uint64_t matrix_coeff13 : 20; /* 103..84 */
+    uint64_t matrix_coeff23 : 20; /* 123..104 */
+    uint64_t reserved2 : 4; /* 127..124 */
+} MatrixStruct;
+
+typedef struct {
+    uint64_t ClearRect0Left : 14; /* 13..0 */
+    uint64_t reserved0 : 2; /* 15..14 */
+    uint64_t ClearRect0Right : 14; /* 29..16 */
+    uint64_t reserved1 : 2; /* 31..30 */
+    uint64_t ClearRect0Top : 14; /* 45..32 */
+    uint64_t reserved2 : 2; /* 47..46 */
+    uint64_t ClearRect0Bottom : 14; /* 61..48 */
+    uint64_t reserved3 : 2; /* 63..62 */
+    uint64_t ClearRect1Left : 14; /* 77..64 */
+    uint64_t reserved4 : 2; /* 79..78 */
+    uint64_t ClearRect1Right : 14; /* 93..80 */
+    uint64_t reserved5 : 2; /* 95..94 */
+    uint64_t ClearRect1Top : 14; /* 109..96 */
+    uint64_t reserved6 : 2; /* 111..110 */
+    uint64_t ClearRect1Bottom : 14; /* 125..112 */
+    uint64_t reserved7 : 2; /* 127..126 */
+} ClearRectStruct;
+
+typedef struct {
+    uint64_t reserved0 : 2; /* 1..0 */
+    uint64_t AlphaK1 : 8; /* 9..2 */
+    uint64_t reserved1 : 6; /* 17..10 */
+    uint64_t AlphaK2 : 8; /* 25..18 */
+    uint64_t reserved2 : 6; /* 31..26 */
+    uint64_t SrcFactCMatchSelect : 3; /* 34..32 */
+    uint64_t reserved3 : 1; /* 35 */
+    uint64_t DstFactCMatchSelect : 3; /* 38..36 */
+    uint64_t reserved4 : 1; /* 39 */
+    uint64_t SrcFactAMatchSelect : 3; /* 42..40 */
+    uint64_t reserved5 : 1; /* 43 */
+    uint64_t DstFactAMatchSelect : 3; /* 46..44 */
+    uint64_t reserved6 : 1; /* 47 */
+    uint64_t reserved7 : 4; /* 51..48 */
+    uint64_t reserved8 : 4; /* 55..52 */
+    uint64_t reserved9 : 4; /* 59..56 */
+    uint64_t reserved10 : 4; /* 63..60 */
+    uint64_t reserved11 : 2; /* 65..64 */
+    uint64_t OverrideR : 10; /* 75..66 */
+    uint64_t OverrideG : 10; /* 85..76 */
+    uint64_t OverrideB : 10; /* 95..86 */
+    uint64_t reserved12 : 2; /* 97..96 */
+    uint64_t OverrideA : 8; /* 105..98 */
+    uint64_t reserved13 : 2; /* 107..106 */
+    uint64_t UseOverrideR : 1; /* 108 */
+    uint64_t UseOverrideG : 1; /* 109 */
+    uint64_t UseOverrideB : 1; /* 110 */
+    uint64_t UseOverrideA : 1; /* 111 */
+    uint64_t MaskR : 1; /* 112 */
+    uint64_t MaskG : 1; /* 113 */
+    uint64_t MaskB : 1; /* 114 */
+    uint64_t MaskA : 1; /* 115 */
+    uint64_t reserved14 : 12; /* 127..116 */
+} BlendingSlotStruct;
+
+typedef struct {
+    uint64_t AlphaFillMode : 3; /* 2..0 */
+    uint64_t AlphaFillSlot : 3; /* 5..3 */
+    uint64_t reserved0 : 2; /* 6..5 */
+    uint64_t BackgroundAlpha : 8; /* 15..7 */
+    uint64_t BackgroundR : 10; /* 25..16 */
+    uint64_t BackgroundG : 10; /* 35..26 */
+    uint64_t BackgroundB : 10; /* 45..36 */
+    uint64_t RegammaMode : 2; /* 47..46 */
+    uint64_t OutputFlipX : 1; /* 48 */
+    uint64_t OutputFlipY : 1; /* 49 */
+    uint64_t OutputTranspose : 1; /* 50 */
+    uint64_t reserved1 : 1; /* 51 */
+    uint64_t reserved2 : 12; /* 63..52 */
+    uint64_t TargetRectLeft : 14; /* 77..64 */
+    uint64_t reserved3 : 2; /* 79..78 */
+    uint64_t TargetRectRight : 14; /* 93..80 */
+    uint64_t reserved4 : 2; /* 95..94 */
+    uint64_t TargetRectTop : 14; /* 109..96 */
+    uint64_t reserved5 : 2; /* 111..110 */
+    uint64_t TargetRectBottom : 14; /* 125..112 */
+    uint64_t reserved6 : 2; /* 127..126 */
+} OutputConfig;
+
+typedef struct {
+    uint64_t OutPixelFormat : 7; /* 6..0 */
+    uint64_t OutChromaLocHoriz : 2; /* 8..7 */
+    uint64_t OutChromaLocVert : 2; /* 10..9 */
+    uint64_t OutBlkKind : 4; /* 14..11 */
+    uint64_t OutBlkHeight : 4; /* 18..15 */
+    uint64_t reserved0 : 3; /* 21..19 */
+    uint64_t reserved1 : 10; /* 31..22 */
+    uint64_t OutSurfaceWidth : 14; /* 45..32 */
+    uint64_t OutSurfaceHeight : 14; /* 59..46 */
+    uint64_t reserved2 : 4; /* 63..60 */
+    uint64_t OutLumaWidth : 14; /* 77..64 */
+    uint64_t OutLumaHeight : 14; /* 91..78 */
+    uint64_t reserved3 : 4; /* 95..92 */
+    uint64_t OutChromaWidth : 14; /* 109..96 */
+    uint64_t OutChromaHeight : 14; /* 123..110 */
+    uint64_t reserved4 : 4; /* 127..124 */
+} OutputSurfaceConfig;
+
+typedef struct {
+    uint64_t f00 : 10; /* 9..0 */
+    uint64_t f10 : 10; /* 19..10 */
+    uint64_t f20 : 10; /* 29..20 */
+    uint64_t reserved0 : 2; /* 31..30 */
+    uint64_t f01 : 10; /* 41..32 */
+    uint64_t f11 : 10; /* 51..42 */
+    uint64_t f21 : 10; /* 61..52 */
+    uint64_t reserved1 : 2; /* 63..62 */
+    uint64_t f02 : 10; /* 73..64 */
+    uint64_t f12 : 10; /* 83..74 */
+    uint64_t f22 : 10; /* 93..84 */
+    uint64_t reserved2 : 2; /* 95..94 */
+    uint64_t f03 : 10; /* 105..96 */
+    uint64_t f13 : 10; /* 115..106 */
+    uint64_t f23 : 10; /* 125..116 */
+    uint64_t reserved3 : 2; /* 127..126 */
+} FilterCoeffStruct;
+
+typedef struct {
+    uint64_t DownsampleHoriz : 11; /* 10..0 */
+    uint64_t reserved0 : 5; /* 15..11 */
+    uint64_t DownsampleVert : 11; /* 26..16 */
+    uint64_t reserved1 : 5; /* 31..27 */
+    uint64_t reserved2 : 32; /* 63..32 */
+    uint64_t reserved3 : 32; /* 95..64 */
+    uint64_t reserved4 : 32; /* 127..96 */
+} PipeConfig;
+
+typedef struct {
+    uint64_t OldCadence : 32; /* 31..0 */
+    uint64_t OldDiff : 32; /* 63..32 */
+    uint64_t OldWeave : 32; /* 95..64 */
+    uint64_t OlderWeave : 32; /* 127..96 */
+} SlotHistoryBuffer;
+
+typedef struct {
+    uint64_t crc0 : 32; /* 31..0 */
+    uint64_t crc1 : 32; /* 63..32 */
+    uint64_t crc2 : 32; /* 95..64 */
+    uint64_t crc3 : 32; /* 127..96 */
+} PartitionCrcStruct;
+
+typedef struct {
+    uint64_t crc0 : 32; /* 31..0 */
+    uint64_t crc1 : 32; /* 63..32 */
+} SlotCrcStruct;
+
+typedef struct {
+    uint64_t ErrorStatus : 32; /* 31..0 */
+    uint64_t CycleCount : 32; /* 63..32 */
+    uint64_t reserved0 : 32; /* 95..64 */
+    uint64_t reserved1 : 32; /* 127..96 */
+} StatusStruct;
+
+typedef struct {
+    uint64_t coeff_0 : 10; /* 9..0 */
+    uint64_t reserved0 : 6; /* 15..10 */
+    uint64_t coeff_1 : 10; /* 25..16 */
+    uint64_t reserved1 : 6; /* 31..26 */
+    uint64_t coeff_2 : 10; /* 41..32 */
+    uint64_t reserved2 : 6; /* 47..42 */
+    uint64_t coeff_3 : 10; /* 57..48 */
+    uint64_t reserved3 : 6; /* 63..58 */
+} CoeffPhaseParamStruct;
+
+typedef struct {
+    uint64_t GeoTranEn : 1; /* 0 */
+    uint64_t GeoTranMode : 2; /* 2..1 */
+    uint64_t IPTMode : 1; /* 3 */
+    uint64_t PixelFilterType : 2; /* 5..4 */
+    uint64_t PixelFormat : 7; /* 12..6 */
+    uint64_t CacheWidth : 3; /* 15..13 */
+    uint64_t SrcBlkKind : 4; /* 19..16 */
+    uint64_t SrcBlkHeight : 4; /* 23..20 */
+    uint64_t DestBlkKind : 4; /* 27..24 */
+    uint64_t DestBlkHeight : 4; /* 31..28 */
+    uint64_t MskBitMapEn : 1; /* 32 */
+    uint64_t MaskedPixelFillMode : 1; /* 33 */
+    uint64_t XSobelMode : 2; /* 35..34 */
+    uint64_t SubFrameEn : 1; /* 36 */
+    uint64_t reserved0 : 3; /* 39..37 */
+    uint64_t XSobelBlkKind : 4; /* 43..40 */
+    uint64_t XSobelBlkHeight : 4; /* 47..44 */
+    uint64_t XSobelDSBlkKind : 4; /* 51..48 */
+    uint64_t XSobelDSBlkHeight : 4; /* 55..52 */
+    uint64_t reserved1 : 8; /* 63..56 */
+    uint64_t NonFixedPatchEn : 1; /* 64 */
+    uint64_t HorRegionNum : 2; /* 66..65 */
+    uint64_t VerRegionNum : 2; /* 68..67 */
+    uint64_t reserved2 : 3; /* 71..69 */
+    uint64_t log2HorSpace_0 : 3; /* 74..72 */
+    uint64_t log2VerSpace_0 : 3; /* 77..75 */
+    uint64_t log2HorSpace_1 : 3; /* 80..78 */
+    uint64_t log2VerSpace_1 : 3; /* 83..81 */
+    uint64_t log2HorSpace_2 : 3; /* 86..84 */
+    uint64_t log2VerSpace_2 : 3; /* 89..87 */
+    uint64_t log2HorSpace_3 : 3; /* 92..90 */
+    uint64_t log2VerSpace_3 : 3; /* 95..93 */
+    uint64_t horRegionWidth_0 : 14; /* 109..96 */
+    uint64_t reserved3 : 2; /* 111..110 */
+    uint64_t horRegionWidth_1 : 14; /* 125..112 */
+    uint64_t reserved4 : 2; /* 127..126 */
+    uint64_t horRegionWidth_2 : 14; /* 141..128 */
+    uint64_t reserved5 : 2; /* 143..142 */
+    uint64_t horRegionWidth_3 : 14; /* 157..144 */
+    uint64_t reserved6 : 2; /* 159..158 */
+    uint64_t verRegionHeight_0 : 14; /* 173..160 */
+    uint64_t reserved7 : 2; /* 175..174 */
+    uint64_t verRegionHeight_1 : 14; /* 189..176 */
+    uint64_t reserved8 : 2; /* 191..190 */
+    uint64_t verRegionHeight_2 : 14; /* 205..192 */
+    uint64_t reserved9 : 2; /* 207..206 */
+    uint64_t verRegionHeight_3 : 14; /* 221..208 */
+    uint64_t reserved10 : 2; /* 223..222 */
+    uint64_t IPT_M11 : 32; /* 255..224 */
+    uint64_t IPT_M12 : 32; /* 287..256 */
+    uint64_t IPT_M13 : 32; /* 319..288 */
+    uint64_t IPT_M21 : 32; /* 351..320 */
+    uint64_t IPT_M22 : 32; /* 383..352 */
+    uint64_t IPT_M23 : 32; /* 415..384 */
+    uint64_t IPT_M31 : 32; /* 447..416 */
+    uint64_t IPT_M32 : 32; /* 479..448 */
+    uint64_t IPT_M33 : 32; /* 511..480 */
+    uint64_t SourceRectLeft : 14; /* 525..512 */
+    uint64_t reserved11 : 2; /* 527..526 */
+    uint64_t SourceRectRight : 14; /* 541..528 */
+    uint64_t reserved12 : 2; /* 543..542 */
+    uint64_t SourceRectTop : 14; /* 557..544 */
+    uint64_t reserved13 : 2; /* 559..558 */
+    uint64_t SourceRectBottom : 14; /* 573..560 */
+    uint64_t reserved14; /* 575..574 */
+    uint64_t SrcImgWidth : 14; /* 589..576 */
+    uint64_t reserved15 : 2; /* 591..590 */
+    uint64_t SrcImgHeight : 14; /* 605..592 */
+    uint64_t reserved16 : 2; /* 607..606 */
+    uint64_t SrcSfcLumaWidth : 14; /* 621..608 */
+    uint64_t reserved17 : 2; /* 623..622 */
+    uint64_t SrcSfcLumaHeight : 14; /* 637..624 */
+    uint64_t reserved18 : 2; /* 639..638 */
+    uint64_t SrcSfcChromaWidth : 14; /* 653..640 */
+    uint64_t reserved19 : 2; /* 655..654 */
+    uint64_t SrcSfcChromaHeight : 14; /* 669..656 */
+    uint64_t reserved20 : 2; /* 671..670 */
+    uint64_t DestRectLeft : 14; /* 685..672 */
+    uint64_t reserved21 : 2; /* 687..686 */
+    uint64_t DestRectRight : 14; /* 701..688 */
+    uint64_t reserved22 : 2; /* 703..702 */
+    uint64_t DestRectTop : 14; /* 717..704 */
+    uint64_t reserved23 : 2; /* 719..718 */
+    uint64_t DestRectBottom : 14; /* 733..720 */
+    uint64_t reserved24 : 2; /* 735..734 */
+    uint64_t SubFrameRectTop : 14; /* 749..736 */
+    uint64_t reserved25 : 2; /* 751..750 */
+    uint64_t SubFrameRectBottom : 14; /* 765..752 */
+    uint64_t reserved26 : 2; /* 767..766 */
+    uint64_t DestSfcLumaWidth : 14; /* 781..768 */
+    uint64_t reserved27 : 2; /* 783..782 */
+    uint64_t DestSfcLumaHeight : 14; /* 797..784 */
+    uint64_t reserved28 : 2; /* 799..798 */
+    uint64_t DestSfcChromaWidth : 14; /* 813..800 */
+    uint64_t reserved29 : 2; /* 815..814 */
+    uint64_t DestSfcChromaHeight : 14; /* 829..816 */
+    uint64_t reserved30 : 2; /* 831..830 */
+    uint64_t SparseWarpMapWidth : 14; /* 845..832 */
+    uint64_t reserved31 : 2; /* 847..846 */
+    uint64_t SparseWarpMapHeight : 14; /* 861..848 */
+    uint64_t reserved32 : 2; /* 863..862 */
+    uint64_t SparseWarpMapStride : 14; /* 877..864 */
+    uint64_t reserved33 : 2; /* 879..878 */
+    uint64_t MaskBitMapWidth : 14; /* 893..880 */
+    uint64_t reserved34 : 2; /* 895..894 */
+    uint64_t MaskBitMapHeight : 14; /* 909..896 */
+    uint64_t reserved35 : 2; /* 911..910 */
+    uint64_t MaskBitMapStride : 14; /* 925..912 */
+    uint64_t reserved36 : 2; /* 927..926 */
+    uint64_t XSobelWidth : 14; /* 941..928 */
+    uint64_t reserved37 : 2; /* 943..942 */
+    uint64_t XSobelHeight : 14; /* 957..944 */
+    uint64_t reserved38 : 2; /* 959..958 */
+    uint64_t XSobelStride : 14; /* 973..960 */
+    uint64_t reserved39 : 2; /* 975..974 */
+    uint64_t DSStride : 14; /* 989..976 */
+    uint64_t reserved40 : 2; /* 991..990 */
+    uint64_t XSobelTopOffset : 32; /* 1023..992 */
+    uint64_t reserved41 : 32; /* 1055..1024 */
+    uint64_t maskY : 16; /* 1071..1056 */
+    uint64_t maskU : 16; /* 1087..1072 */
+    uint64_t maskV : 16; /* 1103..1088 */
+    uint64_t reserved42 : 16; /* 1119..1104 */
+} GeoTranConfigParamStruct;
+
+typedef struct {
+    uint64_t TNR3En : 1; /* 0 */
+    uint64_t BetaBlendingEn : 1; /* 1 */
+    uint64_t AlphaBlendingEn : 1; /* 2 */
+    uint64_t AlphaSmoothEn : 1; /* 3 */
+    uint64_t TempAlphaRestrictEn : 1; /* 4 */
+    uint64_t AlphaClipEn : 1; /* 5 */
+    uint64_t BFRangeEn : 1; /* 6 */
+    uint64_t BFDomainEn : 1; /* 7 */
+    uint64_t BFRangeLumaShift : 4; /* 11..8 */
+    uint64_t BFRangeChromaShift : 4; /* 15..12 */
+    uint64_t SADMultiplier : 6; /* 21..16 */
+    uint64_t reserved1 : 2; /* 23..22 */
+    uint64_t SADWeightLuma : 6; /* 29..24 */
+    uint64_t reserved2 : 2; /* 31..30 */
+    uint64_t TempAlphaRestrictIncCap : 11; /* 42..32 */
+    uint64_t reserved3 : 5; /* 47..43 */
+    uint64_t AlphaScaleIIR : 11; /* 58..48 */
+    uint64_t reserved4 : 5; /* 63..59 */
+    uint64_t AlphaClipMaxLuma : 11; /* 74..64 */
+    uint64_t reserved5 : 5; /* 79..75 */
+    uint64_t AlphaClipMinLuma : 11; /* 90..80 */
+    uint64_t reserved6 : 5; /* 95..91 */
+    uint64_t AlphaClipMaxChroma : 11; /* 106..96 */
+    uint64_t reserved7 : 5; /* 111..107 */
+    uint64_t AlphaClipMinChroma : 11; /* 122..112 */
+    uint64_t reserved8 : 5; /* 127..123 */
+    uint64_t BetaCalcMaxBeta : 11; /* 138..128 */
+    uint64_t reserved9 : 5; /* 143..139 */
+    uint64_t BetaCalcMinBeta : 11; /* 154..144 */
+    uint64_t reserved10 : 5; /* 159..155 */
+    uint64_t BetaCalcBetaX1 : 11; /* 170..160 */
+    uint64_t reserved11 : 5; /* 175..171 */
+    uint64_t BetaCalcBetaX2 : 11; /* 186..176 */
+    uint64_t reserved12 : 5; /* 191..187 */
+    uint64_t BetaCalcStepBeta : 11; /* 202..192 */
+    uint64_t reserved13 : 5; /* 207..203 */
+    uint64_t reserved14 : 16; /* 223..208 */
+    uint64_t BFDomainLumaCoeffC00 : 7; /* 230..224 */
+    uint64_t reserved15 : 1; /* 231 */
+    uint64_t BFDomainLumaCoeffC01 : 7; /* 238..232 */
+    uint64_t reserved16 : 1; /* 239 */
+    uint64_t BFDomainLumaCoeffC02 : 7; /* 246..240 */
+    uint64_t reserved17 : 1; /* 247 */
+    uint64_t BFDomainLumaCoeffC11 : 7; /* 254..248 */
+    uint64_t reserved18 : 1; /* 255 */
+    uint64_t BFDomainLumaCoeffC12 : 7; /* 262..256 */
+    uint64_t reserved19 : 1; /* 263 */
+    uint64_t BFDomainLumaCoeffC22 : 7; /* 270..264 */
+    uint64_t reserved20 : 1; /* 271 */
+    uint64_t reserved21 : 16; /* 287..272 */
+    uint64_t BFDomainChromaCoeffC00 : 7; /* 294..288 */
+    uint64_t reserved22 : 1; /* 295 */
+    uint64_t BFDomainChromaCoeffC01 : 7; /* 302..296 */
+    uint64_t reserved23 : 1; /* 303 */
+    uint64_t BFDomainChromaCoeffC02 : 7; /* 310..304 */
+    uint64_t reserved24 : 1; /* 311 */
+    uint64_t BFDomainChromaCoeffC11 : 7; /* 318..312 */
+    uint64_t reserved25 : 1; /* 319 */
+    uint64_t BFDomainChromaCoeffC12 : 7; /* 326..320 */
+    uint64_t reserved26 : 1; /* 327 */
+    uint64_t BFDomainChromaCoeffC22 : 7; /* 334..328 */
+    uint64_t reserved27 : 1; /* 335 */
+    uint64_t reserved28 : 16; /* 351..336 */
+    uint64_t LeftBufSize : 32; /* 383..352 */
+    uint64_t TopBufSize : 32; /* 415..384 */
+    uint64_t AlphaSufStride : 14; /* 429..416 */
+    uint64_t reserved29 : 18; /* 447..430 */
+} TNR3ConfigParamStruct;
+
+typedef struct {
+    uint64_t item0 : 7; /* 6..0 */
+    uint64_t reserved0 : 9; /* 15..7 */
+    uint64_t item1 : 7; /* 22..16 */
+    uint64_t reserved1 : 9; /* 31..23 */
+    uint64_t item2 : 7; /* 38..32 */
+    uint64_t reserved2 : 9; /* 47..39 */
+    uint64_t item3 : 7; /* 54..48 */
+    uint64_t reserved3 : 9; /* 63..55 */
+} BFRangeTableItems;
+
+typedef struct {
+    SlotConfig slotConfig;
+    SlotSurfaceConfig slotSurfaceConfig;
+    LumaKeyStruct lumaKeyStruct;
+    MatrixStruct colorMatrixStruct;
+    MatrixStruct gamutMatrixStruct;
+    BlendingSlotStruct blendingSlotStruct;
+} SlotStruct;
+
+typedef struct {
+    FilterCoeffStruct filterCoeffStruct[520];
+} FilterStruct;
+
+typedef struct {
+    PipeConfig pipeConfig;
+    OutputConfig outputConfig;
+    OutputSurfaceConfig outputSurfaceConfig;
+    MatrixStruct outColorMatrixStruct;
+    ClearRectStruct clearRectStruct[4];
+    SlotStruct slotStruct[16];
+} ConfigStruct;
+
+typedef struct {
+    PartitionCrcStruct partitionCrcStruct[2];
+} InterfaceCrcStruct;
+
+typedef struct {
+    SlotCrcStruct slotCrcStruct[16];
+} InputCrcStruct;
+
+typedef struct {
+    GeoTranConfigParamStruct paramConfig;
+    CoeffPhaseParamStruct FilterCoeff[17];
+    TNR3ConfigParamStruct tnr3Config;
+    BFRangeTableItems BFRangeTableLuma[16];
+    BFRangeTableItems BFRangeTableChroma[16];
+} GeoTranConfigStruct;
+
+#endif
-- 
2.32.0

