Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDC3F99B2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19EB6E959;
	Fri, 27 Aug 2021 13:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6816E94D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z4so10393628wrr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrEg0fuinNyqSLvgtkkroOr4NhOFmjiH0C7HGuw+Hmc=;
 b=Jjic6kG9j4HUJHsMqzhFnvxAr1wYNMcItCQsnFiiBjX46Ee4YKnFUIpLBwIbqwT1le
 F2Q6uG5BC6E5qZygMYAlr90OhQDlF1W29TmlpEB21U5A/jfcAUQ/lCyBcR0h4F/f6hNB
 2RH7JLLrEHzqk6/aFslDM+jb2eT2jg9UxK6VgGejC0sE+Uu1YQ0jBp3LFXlIHPgpjqZc
 yMDGHy0J1uBhftYLwTkxV77SfH22o4ijE6hdZgY7mp/Feq84DmBlAyMxiexmyTPwfKRv
 tXTJq0VhjXQJPG3L7TQ05HSF3Lc0SD7ALreR5LmGwMte9zFwBwj7DN8P3IMauQTFSl4R
 o8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrEg0fuinNyqSLvgtkkroOr4NhOFmjiH0C7HGuw+Hmc=;
 b=nWlMIEJ3aKIlKBYkRR75wRZ+EBXqKa/9t9ZYsOg/H3ijqd9Tb3u07Diq0hZ8L0DAiD
 ndn61TNOVXlUIKh56tsPBqbTzmVL5PJF1/E5m9wttLWkOrh7r0OpXr0cvZMa+yNxwmK/
 rYjo5gk+aTqVc6GCHf1eulvRvtNo8E3wr3gvW/TpqRUmG74+1gnTWimPg3JSlmrOg3Zl
 /wZNHCUGKbQYeGAj0jkShFjDn2rb+9at+kTxWL4LeuHn2Hr6iVrW4yKACs7N40sU5b0P
 WDcWUqG/gVggB+1yNYIOCMwqftVi+Bv5sZ3w2HXFWxXl+IocUnJflWJluMgwAnUriMSw
 G4Yg==
X-Gm-Message-State: AOAM532pDgBpUJ6TG2VeIu/oFP8mYloEBtGBqNXsHI4tLx7Tqzvzd0mm
 shbbKljmxyO/47ZRwMmLIsE=
X-Google-Smtp-Source: ABdhPJwE4E0/FQPePNrSPWuLgseFi94o8/LzpiJpmIkUbwm95D+ZkQtHg5LD9ljbibwqgAgVP6eRlw==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr10276116wru.224.1630070633056; 
 Fri, 27 Aug 2021 06:23:53 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o21sm5381766wms.32.2021.08.27.06.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 19/25] tests: tegra: Add VIC 3.0 support
Date: Fri, 27 Aug 2021 15:22:59 +0200
Message-Id: <20210827132305.3572077-20-thierry.reding@gmail.com>
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

The Video Image Composer (VIC) 3.0 can be found on NVIDIA Tegra124 SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/private.h         |   6 +
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       |   8 +-
 tests/tegra/vic30.c     | 509 ++++++++++++++++++++++++++++++++++++++++
 tests/tegra/vic30.h     | 439 ++++++++++++++++++++++++++++++++++
 5 files changed, 962 insertions(+), 2 deletions(-)
 create mode 100644 tests/tegra/vic30.c
 create mode 100644 tests/tegra/vic30.h

diff --git a/tegra/private.h b/tegra/private.h
index f134f3ea2cea..821eb0e48fd0 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -26,6 +26,7 @@
 #define __DRM_TEGRA_PRIVATE_H__ 1
 
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdint.h>
 
 #include <libdrm_macros.h>
@@ -34,6 +35,11 @@
 #include "tegra_drm.h"
 #include "tegra.h"
 
+#define container_of(ptr, type, member) ({                  \
+        const typeof(((type *)0)->member) *__mptr = (ptr);  \
+        (type *)((char *)__mptr - offsetof(type, member));  \
+    })
+
 enum host1x_class {
     HOST1X_CLASS_HOST1X = 0x01,
     HOST1X_CLASS_GR2D = 0x51,
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 55c1c72808e3..934b728a48d9 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -34,6 +34,8 @@ libdrm_test_tegra = static_library(
     'drm-test-tegra.h',
     'vic.c',
     'vic.h',
+    'vic30.c',
+    'vic30.h',
   ), config_file ],
   include_directories : [inc_root, inc_drm, inc_tegra],
   link_with : libdrm,
diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
index 02ba4a25ae47..6001a0cdb9d2 100644
--- a/tests/tegra/vic.c
+++ b/tests/tegra/vic.c
@@ -130,6 +130,10 @@ void vic_image_dump(struct vic_image *image, FILE *fp)
     drm_tegra_bo_unmap(image->bo);
 }
 
+/* from vic30.c */
+int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp);
+
 int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
             struct vic **vicp)
 {
@@ -138,8 +142,8 @@ int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
     version = drm_tegra_channel_get_version(channel);
 
     switch (version) {
-    default:
-        break;
+    case 0x40:
+        return vic30_new(drm, channel, vicp);
     }
 
     return -ENOTSUP;
diff --git a/tests/tegra/vic30.c b/tests/tegra/vic30.c
new file mode 100644
index 000000000000..5db83e08e003
--- /dev/null
+++ b/tests/tegra/vic30.c
@@ -0,0 +1,509 @@
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
+#include "vic30.h"
+
+struct vic30 {
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
+static int vic30_clear(struct vic *v, struct vic_image *output,
+                       unsigned int alpha, unsigned int red,
+                       unsigned int green, unsigned int blue)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
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
+    c->surfaceList0Struct.TargetRectLeft = 0;
+    c->surfaceList0Struct.TargetRectTop = 0;
+    c->surfaceList0Struct.TargetRectRight = output->width - 1;
+    c->surfaceList0Struct.TargetRectBottom = output->height - 1;
+
+    c->blending0Struct.PixelFormat = output->format;
+    c->blending0Struct.BackgroundAlpha = alpha;
+    c->blending0Struct.BackgroundR = red;
+    c->blending0Struct.BackgroundG = green;
+    c->blending0Struct.BackgroundB = blue;
+    c->blending0Struct.LumaWidth = output->stride - 1;
+    c->blending0Struct.LumaHeight = output->height - 1;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.ChromaHeight = 16383;
+    c->blending0Struct.TargetRectLeft = 0;
+    c->blending0Struct.TargetRectTop = 0;
+    c->blending0Struct.TargetRectRight = output->width - 1;
+    c->blending0Struct.TargetRectBottom = output->height - 1;
+    c->blending0Struct.SurfaceWidth = output->width - 1;
+    c->blending0Struct.SurfaceHeight = output->height - 1;
+    c->blending0Struct.BlkKind = output->kind;
+    c->blending0Struct.BlkHeight = 0;
+
+    c->fetchControl0Struct.TargetRectLeft = 0;
+    c->fetchControl0Struct.TargetRectTop = 0;
+    c->fetchControl0Struct.TargetRectRight = output->width - 1;
+    c->fetchControl0Struct.TargetRectBottom = output->height - 1;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic30_fill(struct vic *v, struct vic_image *output,
+                      unsigned int left, unsigned int top,
+                      unsigned int right, unsigned int bottom,
+                      unsigned int alpha, unsigned int red,
+                      unsigned int green, unsigned int blue)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
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
+    c->surfaceList0Struct.TargetRectLeft = left;
+    c->surfaceList0Struct.TargetRectTop = top;
+    c->surfaceList0Struct.TargetRectRight = right;
+    c->surfaceList0Struct.TargetRectBottom = bottom;
+
+    c->blending0Struct.PixelFormat = output->format;
+    c->blending0Struct.BackgroundAlpha = alpha;
+    c->blending0Struct.BackgroundR = red;
+    c->blending0Struct.BackgroundG = green;
+    c->blending0Struct.BackgroundB = blue;
+    c->blending0Struct.LumaWidth = output->stride - 1;
+    c->blending0Struct.LumaHeight = output->height - 1;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.TargetRectLeft = left;
+    c->blending0Struct.TargetRectTop = top;
+    c->blending0Struct.TargetRectRight = right;
+    c->blending0Struct.TargetRectBottom = bottom;
+    c->blending0Struct.SurfaceWidth = output->width - 1;
+    c->blending0Struct.SurfaceHeight = output->height - 1;
+    c->blending0Struct.BlkKind = output->kind;
+    c->blending0Struct.BlkHeight = 0;
+
+    c->fetchControl0Struct.TargetRectLeft = left;
+    c->fetchControl0Struct.TargetRectTop = top;
+    c->fetchControl0Struct.TargetRectRight = right;
+    c->fetchControl0Struct.TargetRectBottom = bottom;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic30_blit(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
+    ColorConversionLumaAlphaStruct *ccla;
+    ColorConversionMatrixStruct *ccm;
+    ColorConversionClampStruct *ccc;
+    SurfaceListSurfaceStruct *s;
+    BlendingSurfaceStruct *b;
+    SurfaceCache0Struct *sc;
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
+    c->surfaceList0Struct.TargetRectLeft = 0;
+    c->surfaceList0Struct.TargetRectTop = 0;
+    c->surfaceList0Struct.TargetRectRight = output->width - 1;
+    c->surfaceList0Struct.TargetRectBottom = output->height - 1;
+
+    c->blending0Struct.PixelFormat = output->format;
+    c->blending0Struct.BackgroundAlpha = 0;
+    c->blending0Struct.BackgroundR = 0;
+    c->blending0Struct.BackgroundG = 0;
+    c->blending0Struct.BackgroundB = 0;
+    c->blending0Struct.LumaWidth = output->stride - 1;
+    c->blending0Struct.LumaHeight = output->height - 1;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.TargetRectLeft = 0;
+    c->blending0Struct.TargetRectTop = 0;
+    c->blending0Struct.TargetRectRight = output->width - 1;
+    c->blending0Struct.TargetRectBottom = output->height - 1;
+    c->blending0Struct.SurfaceWidth = output->width - 1;
+    c->blending0Struct.SurfaceHeight = output->height - 1;
+    c->blending0Struct.BlkKind = output->kind;
+    c->blending0Struct.BlkHeight = 0;
+
+    c->fetchControl0Struct.TargetRectLeft = 0;
+    c->fetchControl0Struct.TargetRectTop = 0;
+    c->fetchControl0Struct.TargetRectRight = output->width - 1;
+    c->fetchControl0Struct.TargetRectBottom = output->height - 1;
+
+    /* setup fetch parameters for slot 0 */
+    c->fetchControl0Struct.Enable0 = 0x1;
+    c->fetchControl0Struct.Iir0 = 0x300;
+
+    /* setup cache parameters for slot 0 */
+    sc = &c->surfaceCache0Struct;
+    sc->PixelFormat0 = input->format;
+
+    /* setup surface configuration for slot 0 */
+    s = &c->surfaceListSurfaceStruct[0];
+    s->Enable = 1;
+    s->FrameFormat = DXVAHD_FRAME_FORMAT_PROGRESSIVE;
+    s->PixelFormat = input->format;
+    s->SurfaceWidth = input->width - 1;
+    s->SurfaceHeight = input->height - 1;
+    s->LumaWidth = input->stride - 1;
+    s->LumaHeight = input->height - 1;
+    s->ChromaWidth = 16383;
+    s->ChromaHeight = 16383;
+    s->CacheWidth = VIC_CACHE_WIDTH_256Bx1; //VIC_CACHE_WIDTH_16Bx16;
+    s->BlkKind = input->kind;
+    s->BlkHeight = 0;
+    s->DestRectLeft = 0;
+    s->DestRectTop = 0;
+    s->DestRectRight = output->width - 1;
+    s->DestRectBottom = output->height - 1;
+    s->SourceRectLeft = 0 << 16;
+    s->SourceRectTop = 0 << 16;
+    s->SourceRectRight = (input->width - 1) << 16;
+    s->SourceRectBottom = (input->height - 1) << 16;
+
+    /* setup color conversion for slot 0 */
+    ccla = &c->colorConversionLumaAlphaStruct[0];
+    ccla->PlanarAlpha = 1023;
+    ccla->ConstantAlpha = 0;
+
+    ccm = &c->colorConversionMatrixStruct[0];
+    ccm->c00 = 1023;
+    ccm->c11 = 1023;
+    ccm->c22 = 1023;
+
+    ccc = &c->colorConversionClampStruct[0];
+    ccc->low = 0;
+    ccc->high = 1023;
+
+    /* setup blending for slot 0 */
+    b = &c->blendingSurfaceStruct[0];
+    b->AlphaK1 = 1023;
+    b->SrcFactCMatchSelect = VIC_BLEND_SRCFACTC_K1;
+    b->SrcFactAMatchSelect = VIC_BLEND_SRCFACTA_K1;
+    b->DstFactCMatchSelect = VIC_BLEND_DSTFACTC_NEG_K1_TIMES_SRC;
+    b->DstFactAMatchSelect = VIC_BLEND_DSTFACTA_NEG_K1_TIMES_SRC;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic30_flip(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
+    ColorConversionLumaAlphaStruct *ccla;
+    ColorConversionMatrixStruct *ccm;
+    ColorConversionClampStruct *ccc;
+    SurfaceListSurfaceStruct *s;
+    BlendingSurfaceStruct *b;
+    SurfaceCache0Struct *sc;
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
+    c->surfaceList0Struct.TargetRectLeft = 0;
+    c->surfaceList0Struct.TargetRectTop = 0;
+    c->surfaceList0Struct.TargetRectRight = output->width - 1;
+    c->surfaceList0Struct.TargetRectBottom = output->height - 1;
+
+    c->blending0Struct.PixelFormat = output->format;
+    c->blending0Struct.BackgroundAlpha = 0;
+    c->blending0Struct.BackgroundR = 0;
+    c->blending0Struct.BackgroundG = 0;
+    c->blending0Struct.BackgroundB = 0;
+    c->blending0Struct.LumaWidth = output->stride - 1;
+    c->blending0Struct.LumaHeight = output->height - 1;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.ChromaWidth = 16383;
+    c->blending0Struct.TargetRectLeft = 0;
+    c->blending0Struct.TargetRectTop = 0;
+    c->blending0Struct.TargetRectRight = output->width - 1;
+    c->blending0Struct.TargetRectBottom = output->height - 1;
+    c->blending0Struct.SurfaceWidth = output->width - 1;
+    c->blending0Struct.SurfaceHeight = output->height - 1;
+    c->blending0Struct.BlkKind = output->kind;
+    c->blending0Struct.BlkHeight = 0;
+    c->blending0Struct.OutputFlipY = 1;
+
+    c->fetchControl0Struct.TargetRectLeft = 0;
+    c->fetchControl0Struct.TargetRectTop = 0;
+    c->fetchControl0Struct.TargetRectRight = output->width - 1;
+    c->fetchControl0Struct.TargetRectBottom = output->height - 1;
+
+    /* setup fetch parameters for slot 0 */
+    c->fetchControl0Struct.Enable0 = 0x1;
+    c->fetchControl0Struct.Iir0 = 0x300;
+
+    /* setup cache parameters for slot 0 */
+    sc = &c->surfaceCache0Struct;
+    sc->PixelFormat0 = input->format;
+
+    /* setup surface configuration for slot 0 */
+    s = &c->surfaceListSurfaceStruct[0];
+    s->Enable = 1;
+    s->FrameFormat = DXVAHD_FRAME_FORMAT_PROGRESSIVE;
+    s->PixelFormat = input->format;
+    s->SurfaceWidth = input->width - 1;
+    s->SurfaceHeight = input->height - 1;
+    s->LumaWidth = input->stride - 1;
+    s->LumaHeight = input->height - 1;
+    s->ChromaWidth = 16383;
+    s->ChromaHeight = 16383;
+    s->CacheWidth = VIC_CACHE_WIDTH_256Bx1;
+    s->BlkKind = input->kind;
+    s->BlkHeight = 0;
+    s->DestRectLeft = 0;
+    s->DestRectTop = 0;
+    s->DestRectRight = output->width - 1;
+    s->DestRectBottom = output->height - 1;
+    s->SourceRectLeft = 0 << 16;
+    s->SourceRectTop = 0 << 16;
+    s->SourceRectRight = (input->width - 1) << 16;
+    s->SourceRectBottom = (input->height - 1) << 16;
+
+    /* setup color conversion for slot 0 */
+    ccla = &c->colorConversionLumaAlphaStruct[0];
+    ccla->PlanarAlpha = 1023;
+    ccla->ConstantAlpha = 0;
+
+    ccm = &c->colorConversionMatrixStruct[0];
+    ccm->c00 = 1023;
+    ccm->c11 = 1023;
+    ccm->c22 = 1023;
+
+    ccc = &c->colorConversionClampStruct[0];
+    ccc->low = 0;
+    ccc->high = 1023;
+
+    /* setup blending for slot 0 */
+    b = &c->blendingSurfaceStruct[0];
+    b->AlphaK1 = 1023;
+    b->SrcFactCMatchSelect = VIC_BLEND_SRCFACTC_K1;
+    b->SrcFactAMatchSelect = VIC_BLEND_SRCFACTA_K1;
+    b->DstFactCMatchSelect = VIC_BLEND_DSTFACTC_NEG_K1_TIMES_SRC;
+    b->DstFactAMatchSelect = VIC_BLEND_DSTFACTA_NEG_K1_TIMES_SRC;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic30_execute(struct vic *v, struct drm_tegra_pushbuf *pushbuf,
+                         uint32_t **ptrp, struct vic_image *output,
+                         struct vic_image **inputs, unsigned int num_inputs)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
+    unsigned int i;
+
+    if (num_inputs > 1)
+        return -EINVAL;
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID, 1);
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS, (sizeof(ConfigStruct) / 16) << 16);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET, vic->config.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_HIST_OFFSET, vic->hist.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET, output->map, 0, 0);
+
+    for (i = 0; i < num_inputs; i++)
+        VIC_PUSH_BUFFER(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_LUMA_OFFSET, inputs[i]->map, 0, 0);
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVA0B6_VIDEO_COMPOSITOR_EXECUTE, 1 << 8);
+
+    return 0;
+}
+
+static void vic30_free(struct vic *v)
+{
+    struct vic30 *vic = container_of(v, struct vic30, base);
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
+static const struct vic_ops vic30_ops = {
+    .clear = vic30_clear,
+    .fill = vic30_fill,
+    .blit = vic30_blit,
+    .flip = vic30_flip,
+    .execute = vic30_execute,
+    .free = vic30_free,
+};
+
+int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp)
+{
+    struct vic30 *vic;
+    void *ptr;
+    int err;
+
+    vic = calloc(1, sizeof(*vic));
+    if (!vic)
+        return -ENOMEM;
+
+    vic->base.drm = drm;
+    vic->base.channel = channel;
+    vic->base.ops = &vic30_ops;
+    vic->base.version = 0x40;
+
+    err = drm_tegra_syncpoint_new(drm, &vic->base.syncpt);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 16384, &vic->config.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate configuration structure: %s\n",
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
diff --git a/tests/tegra/vic30.h b/tests/tegra/vic30.h
new file mode 100644
index 000000000000..d095c0d229f2
--- /dev/null
+++ b/tests/tegra/vic30.h
@@ -0,0 +1,439 @@
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
+#ifndef VIC30_H
+#define VIC30_H
+
+#include <stdint.h>
+
+#define NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID 0x200
+#define NVA0B6_VIDEO_COMPOSITOR_EXECUTE 0x300
+#define NVA0B6_VIDEO_COMPOSITOR_EXECUTE_AWAKEN (1 << 8)
+#define NVA0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_LUMA_OFFSET 0x400
+#define NVA0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_CHROMA_U_OFFSET 0x404
+#define NVA0B6_VIDEO_COMPOSITOR_SET_SURFACE0_SLOT0_CHROMA_V_OFFSET 0x408
+#define NVA0B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS 0x700
+#define NVA0B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET 0x720
+#define NVA0B6_VIDEO_COMPOSITOR_SET_PALETTE_OFFSET 0x724
+#define NVA0B6_VIDEO_COMPOSITOR_SET_HIST_OFFSET 0x728
+#define NVA0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET 0x730
+#define NVA0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_CHROMA_U_OFFSET 0x734
+#define NVA0B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_CHROMA_V_OFFSET 0x738
+
+#define VIC_PIXEL_FORMAT_L8 1
+#define VIC_PIXEL_FORMAT_R8 4
+#define VIC_PIXEL_FORMAT_A8R8G8B8 32
+#define VIC_PIXEL_FORMAT_R8G8B8A8 34
+#define VIC_PIXEL_FORMAT_Y8_U8V8_N420 67
+#define VIC_PIXEL_FORMAT_Y8_V8U8_N420 68
+
+#define VIC_BLK_KIND_PITCH 0
+#define VIC_BLK_KIND_GENERIC_16Bx2 1
+
+typedef struct {
+    uint64_t DeNoise0 : 1; /* 0 */
+    uint64_t CadenceDetect0 : 1; /* 1 */
+    uint64_t MotionMap0 : 1; /* 2 */
+    uint64_t MedianFilter0 : 1; /* 3 */
+    uint64_t DeNoise1 : 1; /* 4 */
+    uint64_t CadenceDetect1 : 1; /* 5 */
+    uint64_t MotionMap1 : 1; /* 6 */
+    uint64_t MedianFilter1 : 1; /* 7 */
+    uint64_t DeNoise2 : 1; /* 8 */
+    uint64_t CadenceDetect2 : 1; /* 9 */
+    uint64_t MotionMap2 : 1; /* 10 */
+    uint64_t MedianFilter2 : 1; /* 11 */
+    uint64_t DeNoise3 : 1; /* 12 */
+    uint64_t CadenceDetect3 : 1; /* 13 */
+    uint64_t MotionMap3 : 1; /* 14 */
+    uint64_t MedianFilter3 : 1; /* 15 */
+    uint64_t DeNoise4 : 1; /* 16 */
+    uint64_t CadenceDetect4 : 1; /* 17 */
+    uint64_t MotionMap4 : 1; /* 18 */
+    uint64_t MedianFilter4 : 1; /* 19 */
+    uint64_t IsEven0 : 1; /* 20 */
+    uint64_t IsEven1 : 1; /* 21 */
+    uint64_t IsEven2 : 1; /* 22 */
+    uint64_t IsEven3 : 1; /* 23 */
+    uint64_t IsEven4 : 1; /* 24 */
+    uint64_t MMapCombine0 : 1; /* 25 */
+    uint64_t MMapCombine1 : 1; /* 26 */
+    uint64_t MMapCombine2 : 1; /* 27 */
+    uint64_t MMapCombine3 : 1; /* 28 */
+    uint64_t MMapCombine4 : 1; /* 29 */
+    uint64_t reserved0 : 2; /* 31..30 */
+    uint64_t PixelFormat0 : 7; /* 38..32 */
+    uint64_t reserved1 : 1; /* 39 */
+    uint64_t PixelFormat1 : 7; /* 46..40 */
+    uint64_t reserved2 : 1; /* 47 */
+    uint64_t PixelFormat2 : 7; /* 54..48 */
+    uint64_t reserved3 : 1; /* 55 */
+    uint64_t PixelFormat3 : 7; /* 62..56 */
+    uint64_t reserved4 : 1; /* 63 */
+    uint64_t PixelFormat4 : 7; /* 70..64 */
+    uint64_t reserved5 : 1; /* 71 */
+    uint64_t reserved6 : 24; /* 95..72 */
+    uint64_t PPMotion0 : 1; /* 96 */
+    uint64_t PPMotion1 : 1; /* 97 */
+    uint64_t PPMotion2 : 1; /* 98 */
+    uint64_t PPMotion3 : 1; /* 99 */
+    uint64_t PPMotion4 : 1; /* 100 */
+    uint64_t reserved7 : 3; /* 103..101 */
+    uint64_t ChromaEven0 : 1; /* 104 */
+    uint64_t ChromaEven1 : 1; /* 105 */
+    uint64_t ChromaEven2 : 1; /* 106 */
+    uint64_t ChromaEven3 : 1; /* 107 */
+    uint64_t ChromaEven4 : 1; /* 108 */
+    uint64_t reserved8 : 3; /* 111..109 */
+    uint64_t AdvancedDenoise0 : 1; /* 112 */
+    uint64_t AdvancedDenoise1 : 1; /* 113 */
+    uint64_t AdvancedDenoise2 : 1; /* 114 */
+    uint64_t AdvancedDenoise3 : 1; /* 115 */
+    uint64_t AdvancedDenoise4 : 1; /* 116 */
+    uint64_t reserved9 : 3; /* 119..117 */
+    uint64_t reserved10 : 8; /* 127..120 */
+} SurfaceCache0Struct;
+
+typedef struct {
+    uint64_t ClearRectMask0 : 8; /* 7..0 */
+    uint64_t ClearRectMask1 : 8; /* 15..8 */
+    uint64_t ClearRectMask2 : 8; /* 23..16 */
+    uint64_t ClearRectMask3 : 8; /* 31..24 */
+    uint64_t ClearRectMask4 : 8; /* 39..32 */
+    uint64_t reserved0 : 22; /* 61..40 */
+    uint64_t OutputFlipX : 1; /* 62 */
+    uint64_t OutputFlipY : 1; /* 63 */
+    uint64_t TargetRectLeft : 14; /* 77..64 */
+    uint64_t reserved1 : 2; /* 79..78 */
+    uint64_t TargetRectRight : 14; /* 93..80 */
+    uint64_t reserved2 : 2; /* 95..94 */
+    uint64_t TargetRectTop : 14; /* 109..96 */
+    uint64_t reserved3 : 2; /* 111..110 */
+    uint64_t TargetRectBottom : 14; /* 125..112 */
+    uint64_t reserved4 : 2; /* 127..126 */
+} SurfaceList0Struct;
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
+} SurfaceListClearRectStruct;
+
+typedef struct {
+    uint64_t Enable : 1; /* 0 */
+    uint64_t FrameFormat : 4; /* 4..1 */
+    uint64_t PixelFormat : 7; /* 11..5 */
+    uint64_t reserved0 : 2; /* 13..12 */
+    uint64_t ChromaLocHoriz : 2; /* 15..14 */
+    uint64_t ChromaLocVert : 2; /* 17..16 */
+    uint64_t Panoramic : 12; /* 29..18 */
+    uint64_t reserved1 : 4; /* 33..30 */
+    uint64_t SurfaceWidth : 14; /* 47..34 */
+    uint64_t reserved2 : 1; /* 48 */
+    uint64_t SurfaceHeight : 14; /* 62..49 */
+    uint64_t reserved3 : 1; /* 63 */
+    uint64_t LumaWidth : 14; /* 77..64 */
+    uint64_t reserved4 : 1; /* 78 */
+    uint64_t LumaHeight : 14; /* 92..79 */
+    uint64_t reserved5 : 1; /* 93 */
+    uint64_t ChromaWidth : 14; /* 107..94 */
+    uint64_t reserved6 : 1; /* 108 */
+    uint64_t ChromaHeight : 14; /* 122..109 */
+    uint64_t reserved7 : 1; /* 123 */
+    uint64_t CacheWidth : 3; /* 126..124 */
+    uint64_t reserved8 : 1; /* 127 */
+    /* 128 */
+    uint64_t FilterLengthY : 2; /* 1..0 */
+    uint64_t FilterLengthX : 2; /* 3..2 */
+    uint64_t DetailFltClamp : 6; /* 9..4 */
+    uint64_t reserved9 : 2; /* 11..10 */
+    uint64_t LightLevel : 4; /* 15..12 */
+    uint64_t reserved10 : 4; /* 19..16 */
+    uint64_t reserved11 : 8; /* 27..20 */
+    uint64_t reserved12 : 32; /* 59..28 */
+    uint64_t BlkKind : 4; /* 63..60 */
+    uint64_t DestRectLeft : 14; /* 77..64 */
+    uint64_t reserved13 : 1; /* 78 */
+    uint64_t DestRectRight : 14; /* 92..79 */
+    uint64_t reserved14 : 1; /* 93 */
+    uint64_t DestRectTop : 14; /* 107..94 */
+    uint64_t reserved15 : 1; /* 108 */
+    uint64_t DestRectBottom : 14; /* 122..109 */
+    uint64_t reserved16 : 1; /* 123 */
+    uint64_t BlkHeight : 4; /* 127..124 */
+    /* 256 */
+    uint64_t SourceRectLeft : 30; /* 29..0 */
+    uint64_t reserved17 : 2; /* 31..30 */
+    uint64_t SourceRectRight : 30; /* 61..32 */
+    uint64_t reserved18 : 2; /* 63..62 */
+    uint64_t SourceRectTop : 30; /* 93..64 */
+    uint64_t reserved19 : 2; /* 95..94 */
+    uint64_t SourceRectBottom : 30; /* 125..96 */
+    uint64_t reserved20 : 2; /* 127..126 */
+} SurfaceListSurfaceStruct;
+
+typedef struct {
+    uint64_t l0 : 20; /* 19..0 */
+    uint64_t l1 : 20; /* 39..20 */
+    uint64_t l2 : 20; /* 59..40 */
+    uint64_t r_shift : 4; /* 63..60 */
+    uint64_t l3 : 20; /* 83..64 */
+    uint64_t PlanarAlpha : 10; /* 93..84 */
+    uint64_t ConstantAlpha : 1; /* 94 */
+    uint64_t ClipEnabled : 1; /* 95 */
+    uint64_t LumaKeyLower : 10; /* 105..96 */
+    uint64_t reserved6 : 3; /* 108..106 */
+    uint64_t StereoInterleave : 3; /* 111..109 */
+    uint64_t LumaKeyUpper : 10; /* 121..112 */
+    uint64_t reserved7 : 2; /* 123..122 */
+    uint64_t reserved8 : 1; /* 124 */
+    uint64_t LumaKeyEnabled : 1; /* 125 */
+    uint64_t reserved9 : 2; /* 127..126 */
+} ColorConversionLumaAlphaStruct;
+
+typedef struct {
+    uint64_t c00 : 20; /* 19..0 */
+    uint64_t c10 : 20; /* 39..20 */
+    uint64_t c20 : 20; /* 59..40 */
+    uint64_t r_shift : 4; /* 63..60 */
+    uint64_t c01 : 20; /* 83..64 */
+    uint64_t c11 : 20; /* 103..84 */
+    uint64_t c21 : 20; /* 123..104 */
+    uint64_t reserved0 : 4; /* 127..124 */
+    /* 128 */
+    uint64_t c02 : 20; /* 19..0 */
+    uint64_t c12 : 20; /* 39..20 */
+    uint64_t c22 : 20; /* 59..40 */
+    uint64_t reserved1 : 4; /* 63..60 */
+    uint64_t c03 : 20; /* 83..64 */
+    uint64_t c13 : 20; /* 103..84 */
+    uint64_t c23 : 20; /* 123..104 */
+    uint64_t reserved2 : 4; /* 127..124 */
+} ColorConversionMatrixStruct;
+
+typedef struct {
+    uint64_t low : 10; /* 9..0 */
+    uint64_t reserved0 : 6; /* 15..10 */
+    uint64_t high : 10; /* 25..16 */
+    uint64_t reserved1 : 6; /* 31..26 */
+    uint64_t reserved2 : 32; /* 63..32 */
+    uint64_t reserved3 : 32; /* 95..64 */
+    uint64_t reserved4 : 32; /* 127..96 */
+} ColorConversionClampStruct;
+
+typedef struct {
+    uint64_t PixelFormat : 7; /* 6..0 */
+    uint64_t reserved0 : 1; /* 7 */
+    uint64_t AlphaFillMode : 3; /* 10..8 */
+    uint64_t AlphaFillSlot : 3; /* 13..11 */
+    uint64_t BackgroundAlpha : 10; /* 23..14 */
+    uint64_t BackgroundR : 10; /* 33..24 */
+    uint64_t BackgroundG : 10; /* 43..34 */
+    uint64_t BackgroundB : 10; /* 53..44 */
+    uint64_t ChromaLocHoriz : 2; /* 55..54 */
+    uint64_t ChromaLocVert : 2; /* 57..56 */
+    uint64_t reserved1 : 6; /* 63..58 */
+    uint64_t LumaWidth : 14; /* 77..64 */
+    uint64_t reserved2 : 2; /* 79..78 */
+    uint64_t LumaHeight : 14; /* 93..80 */
+    uint64_t reserved3 : 2; /* 95..94 */
+    uint64_t ChromaWidth : 14; /* 109..96 */
+    uint64_t reserved4 : 2; /* 111..110 */
+    uint64_t ChromaHeight : 14; /* 125..112 */
+    uint64_t reserved5 : 2; /* 127..126 */
+    /* 128 */
+    uint64_t TargetRectLeft : 14; /* 13..0 */
+    uint64_t reserved6 : 2; /* 15..14 */
+    uint64_t TargetRectRight : 14; /* 29..16 */
+    uint64_t reserved7 : 2; /* 31..30 */
+    uint64_t TargetRectTop : 14; /* 45..32 */
+    uint64_t reserved8 : 2; /* 47..46 */
+    uint64_t TargetRectBottom : 14; /* 61..48 */
+    uint64_t reserved9 : 2; /* 63..62 */
+    uint64_t SurfaceWidth : 14; /* 77..64 */
+    uint64_t reserved10 : 2; /* 79..78 */
+    uint64_t SurfaceHeight : 14; /* 93..80 */
+    uint64_t reserved11 : 2; /* 95..94 */
+    uint64_t BlkKind : 4; /* 99..96 */
+    uint64_t BlkHeight : 4; /* 103..100 */
+    uint64_t OutputFlipX : 1; /* 104 */
+    uint64_t OutputFlipY : 1; /* 105 */
+    uint64_t OutputTranspose : 1; /* 106 */
+    uint64_t reserved12 : 21; /* 127..107 */
+} Blending0Struct;
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
+} BlendingSurfaceStruct;
+
+typedef struct {
+    uint64_t TargetRectLeft : 14; /* 13..0 */
+    uint64_t reserved0 : 2; /* 15..14 */
+    uint64_t TargetRectRight : 14; /* 29..16 */
+    uint64_t reserved1 : 2; /* 31..30 */
+    uint64_t TargetRectTop : 14; /* 45..32 */
+    uint64_t reserved2 : 2; /* 47..46 */
+    uint64_t TargetRectBottom : 14; /* 61..48 */
+    uint64_t reserved3 : 2; /* 63..62 */
+    uint64_t Enable0 : 8; /* 71..64 */
+    uint64_t Enable1 : 8; /* 79..72 */
+    uint64_t Enable2 : 8; /* 87..80 */
+    uint64_t Enable3 : 8; /* 95..88 */
+    uint64_t Enable4 : 8; /* 103..96 */
+    uint64_t DownsampleHoriz : 11; /* 114..104 */
+    uint64_t reserved4 : 1; /* 115 */
+    uint64_t DownsampleVert : 11; /* 126..116 */
+    uint64_t reserved5 : 1; /* 127 */
+    /* 128 */
+    uint64_t FilterNoise0 : 10; /* 9..0 */
+    uint64_t FilterDetail0 : 10; /* 19..10 */
+    uint64_t FilterNoise1 : 10; /* 29..20 */
+    uint64_t reserved6 : 2; /* 31..30 */
+    uint64_t FilterDetail1 : 10; /* 41..32 */
+    uint64_t FilterNoise2 : 10; /* 51..42 */
+    uint64_t FilterDetail2 : 10; /* 61..52 */
+    uint64_t reserved7 : 2; /* 63..62 */
+    uint64_t FilterNoise3 : 10; /* 73..64 */
+    uint64_t FilterDetail3 : 10; /* 83..74 */
+    uint64_t FilterNoise4 : 10; /* 93..84 */
+    uint64_t reserved8 : 2; /* 95..94 */
+    uint64_t FilterDetail4 : 10; /* 105..96 */
+    uint64_t reserved9 : 22; /* 127..106 */
+    /* 256 */
+    uint64_t ChromaNoise0 : 10; /* 9..0 */
+    uint64_t ChromaDetail0 : 10; /* 19..10 */
+    uint64_t ChromaNoise1 : 10; /* 29..20 */
+    uint64_t reserved10 : 2; /* 31..30 */
+    uint64_t ChromaDetail1 : 10; /* 41..32 */
+    uint64_t ChromaNoise2 : 10; /* 51..42 */
+    uint64_t ChromaDetail2 : 10; /* 61..52 */
+    uint64_t reserved11 : 2; /* 63..62 */
+    uint64_t ChromaNoise3 : 10; /* 73..64 */
+    uint64_t ChromaDetail3 : 10; /* 83..74 */
+    uint64_t ChromaNoise4 : 10; /* 93..84 */
+    uint64_t reserved12 : 2; /* 95..94 */
+    uint64_t ChromaDetail4 : 10; /* 105..96 */
+    uint64_t reserved13 : 22; /* 127..106 */
+    /* 384 */
+    uint64_t Mode0 : 4; /* 3..0 */
+    uint64_t AccumWeight0 : 3; /* 6..4 */
+    uint64_t Iir0 : 11; /* 17..7 */
+    uint64_t reserved14 : 2; /* 19..18 */
+    uint64_t Mode1 : 4; /* 23..20 */
+    uint64_t AccumWeight1 : 3; /* 26..24 */
+    uint64_t Iir1 : 11; /* 37..27 */
+    uint64_t reserved15 : 2; /* 39..38 */
+    uint64_t Mode2 : 4; /* 43..40 */
+    uint64_t AccumWeight2 : 3; /* 46..44 */
+    uint64_t Iir2 : 11; /* 57..47 */
+    uint64_t reserved16 : 6; /* 63..58 */
+    uint64_t Mode3 : 4; /* 67..64 */
+    uint64_t AccumWeight3 : 3; /* 70..68 */
+    uint64_t Iir3 : 11; /* 81..71 */
+    uint64_t reserved17 : 2; /* 83..82 */
+    uint64_t Mode4 : 4; /* 87..84 */
+    uint64_t AccumWeight4 : 3; /* 90..88 */
+    uint64_t Iir4 : 11; /* 101..91 */
+    uint64_t reserved18 : 8; /* 109..102 */
+    uint64_t OutputFlipX : 1; /* 110 */
+    uint64_t OutputFlipY : 1; /* 111 */
+    uint64_t reserved19 : 10; /* 121..112 */
+    uint64_t reserved20 : 6; /* 127..122 */
+} FetchControl0Struct;
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
+} FetchControlCoeffStruct;
+
+typedef struct {
+    SurfaceCache0Struct surfaceCache0Struct;
+    SurfaceList0Struct surfaceList0Struct;
+    SurfaceListClearRectStruct surfaceListClearRectStruct[4];
+    SurfaceListSurfaceStruct surfaceListSurfaceStruct[5];
+    ColorConversionLumaAlphaStruct colorConversionLumaAlphaStruct[5];
+    ColorConversionMatrixStruct colorConversionMatrixStruct[5];
+    ColorConversionClampStruct colorConversionClampStruct[5];
+    Blending0Struct blending0Struct;
+    BlendingSurfaceStruct blendingSurfaceStruct[5];
+    FetchControl0Struct fetchControl0Struct;
+    FetchControlCoeffStruct fetchControlCoeffStruct[520];
+} ConfigStruct;
+
+#endif
-- 
2.32.0

