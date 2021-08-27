Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2563F99B4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146B46E955;
	Fri, 27 Aug 2021 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3B66E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q14so10418326wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FbHl5QIm0ekmHQj0lcPJ7xC2ZqCGqAfB2m1TTRBxbVU=;
 b=dnmbyX3ZU51WrINq41sXFZaiturfQF9jXmZO6FQxhwTcMbCDuN2HRvNnJvI6HRnj2h
 naBfSzAco51qBLc4HT8VxuRuIlphJTWEoin9EmL0hbK9+Dk3vkJpcMvISIa9XBOgIfgI
 vgS6xunKfEq9T0hqdPdqij1qUa6BvP+60ePQZrALoatgne1jFH5iCf8YEnbi27WcflNe
 Oc/uLn8lt7MbFQFlCo319v4pAvIvySSWAy05i1WOYlH2b87sK4oGpZmhKrmHO6/qmIDV
 fkh90FZ2Dj/3K+etPhbAmLUnW0ijXKUK9k5Gj2Ubv238J95eOUmWGat2HAGAuHpxnuVC
 bmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FbHl5QIm0ekmHQj0lcPJ7xC2ZqCGqAfB2m1TTRBxbVU=;
 b=aBcxyQC/xuUUMTsjBaI7pDuoABjV/b9/EE2NbAlPRy6Au24V+i40uiVjFjEyYnohYe
 PfXpZ45SZ7KWmS6wIekifIbq9ZwAN5tdFruvvZG1IUlTw+clhF3QBBsHK9+MsTu93HsB
 00xxQz0WgGNRYop+s4pm/4vzQ8kJp3eZRfzA6ZVgTVna+JpJ6gPJ/UTqKaUM6Z3bjZ++
 1g0omxDQj0yzTEU9Xjhp13UKjDY/KGJAybKfx6303/qsK4fPneqs7zpBpua9TLv4GyQ/
 cBHCdMd0zVLe+WZNa6vQx5TISQAkNy3Y6lvnrLDtFD2NLhEuDRiIikQfQ8vQZGPEqr2I
 cSiw==
X-Gm-Message-State: AOAM5313BUHUb/WAXm4jYtdVZ6AGnjLkdWtBLYmOjyABE0eSZIWGkHkc
 B4pWrKrQ75WLXcQwarC6LOq476cCWPg=
X-Google-Smtp-Source: ABdhPJx0ZitOA9hg8I69fW+18pwOE0sZkmymPEVo5ONvpmokL+QElVrZxa5c0QSI7DDmWD3tPdSfzg==
X-Received: by 2002:adf:82a9:: with SMTP id 38mr10349536wrc.82.1630070637004; 
 Fri, 27 Aug 2021 06:23:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z19sm6462376wrg.28.2021.08.27.06.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 20/25] tests: tegra: Add VIC 4.0 support
Date: Fri, 27 Aug 2021 15:23:00 +0200
Message-Id: <20210827132305.3572077-21-thierry.reding@gmail.com>
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

The Video Image Composer (VIC) 4.0 can be found on NVIDIA Tegra210 SoCs.
It uses a different class (B0B6) that is slightly incompatible with the
class found on earlier generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       |   7 +
 tests/tegra/vic40.c     | 412 ++++++++++++++++++++++++++++++++++++++++
 tests/tegra/vic40.h     | 285 +++++++++++++++++++++++++++
 4 files changed, 706 insertions(+)
 create mode 100644 tests/tegra/vic40.c
 create mode 100644 tests/tegra/vic40.h

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 934b728a48d9..e0f94891a76f 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -36,6 +36,8 @@ libdrm_test_tegra = static_library(
     'vic.h',
     'vic30.c',
     'vic30.h',
+    'vic40.c',
+    'vic40.h',
   ), config_file ],
   include_directories : [inc_root, inc_drm, inc_tegra],
   link_with : libdrm,
diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
index 6001a0cdb9d2..8acca30b6e6b 100644
--- a/tests/tegra/vic.c
+++ b/tests/tegra/vic.c
@@ -134,6 +134,10 @@ void vic_image_dump(struct vic_image *image, FILE *fp)
 int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
               struct vic **vicp);
 
+/* from vic40.c */
+int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp);
+
 int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
             struct vic **vicp)
 {
@@ -144,6 +148,9 @@ int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
     switch (version) {
     case 0x40:
         return vic30_new(drm, channel, vicp);
+
+    case 0x21:
+        return vic40_new(drm, channel, vicp);
     }
 
     return -ENOTSUP;
diff --git a/tests/tegra/vic40.c b/tests/tegra/vic40.c
new file mode 100644
index 000000000000..2809b9c7f5d0
--- /dev/null
+++ b/tests/tegra/vic40.c
@@ -0,0 +1,412 @@
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
+#include "vic40.h"
+
+struct vic40 {
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
+static int vic40_clear(struct vic *v, struct vic_image *output,
+                       unsigned int alpha, unsigned int red,
+                       unsigned int green, unsigned int blue)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
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
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic40_fill(struct vic *v, struct vic_image *output,
+                      unsigned int left, unsigned int top,
+                      unsigned int right, unsigned int bottom,
+                      unsigned int alpha, unsigned int red,
+                      unsigned int green, unsigned int blue)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
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
+static int vic40_blit(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
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
+    c->outputConfig.BackgroundAlpha = 1023;
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
+    slot->PlanarAlpha = 1023;
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
+static int vic40_flip(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
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
+    c->outputConfig.BackgroundAlpha = 1023;
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
+    slot->PlanarAlpha = 1023;
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
+static int vic40_execute(struct vic *v, struct drm_tegra_pushbuf *pushbuf,
+                         uint32_t **ptrp, struct vic_image *output,
+                         struct vic_image **inputs, unsigned int num_inputs)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
+    unsigned int i;
+
+    if (num_inputs > 1)
+        return -EINVAL;
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID, 1);
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS, (sizeof(ConfigStruct) / 16) << 16);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET, vic->config.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET, output->map, 0, 0);
+
+    for (i = 0; i < num_inputs; i++)
+        VIC_PUSH_BUFFER(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_LUMA_OFFSET, inputs[i]->map, 0, 0);
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB0B6_VIDEO_COMPOSITOR_EXECUTE, 1 << 8);
+
+    return 0;
+}
+
+static void vic40_free(struct vic *v)
+{
+    struct vic40 *vic = container_of(v, struct vic40, base);
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
+static const struct vic_ops vic40_ops = {
+    .clear = vic40_clear,
+    .fill = vic40_fill,
+    .blit = vic40_blit,
+    .flip = vic40_flip,
+    .execute = vic40_execute,
+    .free = vic40_free,
+};
+
+int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp)
+{
+    struct vic40 *vic;
+    void *ptr;
+    int err;
+
+    vic = calloc(1, sizeof(*vic));
+    if (!vic)
+        return -ENOMEM;
+
+    vic->base.drm = drm;
+    vic->base.channel = channel;
+    vic->base.ops = &vic40_ops;
+    vic->base.version = 0x21;
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
diff --git a/tests/tegra/vic40.h b/tests/tegra/vic40.h
new file mode 100644
index 000000000000..a62301a8a94c
--- /dev/null
+++ b/tests/tegra/vic40.h
@@ -0,0 +1,285 @@
+/*
+ * Copyright © 2016-2018 NVIDIA Corporation
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
+#ifndef VIC40_H
+#define VIC40_H
+
+#include <stdint.h>
+
+#define NVB0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID 0x00000200
+#define NVB0B6_VIDEO_COMPOSITOR_EXECUTE 0x00000300
+#define NVB0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_LUMA_OFFSET 0x00000400
+#define NVB0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_CHROMA_U_OFFSET 0x00000404
+#define NVB0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_CHROMA_V_OFFSET 0x00000408
+#define NVB0B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS 0x00000704
+#define NVB0B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET 0x00000708
+#define NVB0B6_VIDEO_COMPOSITOR_SET_HIST_OFFSET 0x00000714
+#define NVB0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET 0x00000720
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
+    uint64_t reserved1 : 22; /* 57..36 */
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
+    uint64_t reserved5 : 3; /* 22..20 */
+    uint64_t reserved6 : 9; /* 31..23 */
+    uint64_t PlanarAlpha : 10; /* 41..32 */
+    uint64_t ConstantAlpha : 1; /* 42 */
+    uint64_t StereoInterleave : 3; /* 45..43 */
+    uint64_t ClipEnabled : 1; /* 46 */
+    uint64_t ClearRectMask : 8; /* 54..47 */
+    uint64_t DegammaMode : 2; /* 56..55 */
+    uint64_t reserved7 : 1; /* 57 */
+    uint64_t DecompressEnable : 1; /* 58 */
+    uint64_t reserved9 : 5; /* 63..59 */
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
+    uint64_t reserved22 : 32; /* 95..64 */
+    uint64_t reserved23 : 32; /* 127..96 */
+} SlotConfig;
+
+typedef struct {
+    uint64_t SlotPixelFormat : 7; /* 6..0 */
+    uint64_t SlotChromaLocHoriz : 2; /* 8..7 */
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
+    uint64_t AlphaK1 : 10; /* 9..0 */
+    uint64_t reserved0 : 6; /* 15..10 */
+    uint64_t AlphaK2 : 10; /* 25..16 */
+    uint64_t reserved1 : 6; /* 31..26 */
+    uint64_t SrcFactCMatchSelect : 3; /* 34..32 */
+    uint64_t reserved2 : 1; /* 35 */
+    uint64_t DstFactCMatchSelect : 3; /* 38..36 */
+    uint64_t reserved3 : 1; /* 39 */
+    uint64_t SrcFactAMatchSelect : 3; /* 42..40 */
+    uint64_t reserved4 : 1; /* 43 */
+    uint64_t DstFactAMatchSelect : 3; /* 46..44 */
+    uint64_t reserved5 : 1; /* 47 */
+    uint64_t reserved6 : 4; /* 51..48 */
+    uint64_t reserved7 : 4; /* 55..52 */
+    uint64_t reserved8 : 4; /* 59..56 */
+    uint64_t reserved9 : 4; /* 63..60 */
+    uint64_t reserved10 : 2; /* 65..64 */
+    uint64_t OverrideR : 10; /* 75..66 */
+    uint64_t OverrideG : 10; /* 85..76 */
+    uint64_t OverrideB : 10; /* 95..86 */
+    uint64_t OverrideA : 10; /* 105..96 */
+    uint64_t reserved11 : 2; /* 107..106 */
+    uint64_t UseOverrideR : 1; /* 108 */
+    uint64_t UseOverrideG : 1; /* 109 */
+    uint64_t UseOverrideB : 1; /* 110 */
+    uint64_t UseOverrideA : 1; /* 111 */
+    uint64_t MaskR : 1; /* 112 */
+    uint64_t MaskG : 1; /* 113 */
+    uint64_t MaskB : 1; /* 114 */
+    uint64_t MaskA : 1; /* 115 */
+    uint64_t reserved12 : 12; /* 127..116 */
+} BlendingSlotStruct;
+
+typedef struct {
+    uint64_t AlphaFillMode : 3; /* 2..0 */
+    uint64_t AlphaFillSlot : 3; /* 5..3 */
+    uint64_t BackgroundAlpha : 10; /* 15..6 */
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
+    SlotConfig slotConfig;
+    SlotSurfaceConfig slotSurfaceConfig;
+    LumaKeyStruct lumaKeyStruct;
+    MatrixStruct colorMatrixStruct;
+    MatrixStruct gamutMatrixStruct;
+    BlendingSlotStruct blendingSlotStruct;
+} SlotStruct;
+
+typedef struct {
+    PipeConfig pipeConfig;
+    OutputConfig outputConfig;
+    OutputSurfaceConfig outputSurfaceConfig;
+    MatrixStruct outColorMatrixStruct;
+    ClearRectStruct clearRectStruct[4];
+    SlotStruct slotStruct[8];
+} ConfigStruct;
+
+#endif
-- 
2.32.0

