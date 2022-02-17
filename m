Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986444BA9A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434D10E6D1;
	Thu, 17 Feb 2022 19:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FA410E6D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:21:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m3so5480743eda.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Rh7LnINHw1c+8wY9HuAQANL94aawuM1cnMLp4lksUc=;
 b=aFKclIeDL5WCREVPdJLDjqXy0FgyIStLHLeajqZJmXyslcmU2C9PC7GnwUNzNYbV2E
 YxWLX809T3XGL4bdi8uyL9isOWoe72+h/lVJYsSdbouSYUlZvGeq0cij816rMqO3cDmr
 SHplQ1EQXGcbM9SVGOEnmFYlaipQRY/JZbojsRt/9ePILYSUu+eUoDoO1Dw0QZOGHCQT
 trxe43VnypWAynP+PH3rznrMJZYgG4mI+A3taL6VSyNpzpjSNZHvDbQ6jyGgQ6aq8D7u
 Dz/Gd/PA5gMoSwTbEZF8zKTvsCQPeFsfStguKOL/4d3KQg5V2xNxb63nhAY0MlATG3CH
 wwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Rh7LnINHw1c+8wY9HuAQANL94aawuM1cnMLp4lksUc=;
 b=0em6L36xcyKzqLWRBI4bQTtjfPAgReRQnrH1PsF6N+lFHFzjA5nRPhuZT2TIk1ZUL7
 qCB0Oo9tdJCdIhuPc2sZkzRXeX2UIA2Vn8Eh4mcLLwz3rgmxtMR0qvEjHPyXhIXGL+fU
 kpJ1Ok/EaIHP6fNI+vQuKcpEa26TOgpVWp1tYGMIiu7Pzd1l7Vcgo4d2EFiKdK9/NLi+
 bLubetr4udnB5Eeh4HKNVsMY/gcWJXVZ8uY2co1bJQr5/bJ/NmnFhKE8+yJ7yqi4pNaX
 A9+6SzfzM6KLuWmangJlGD1M2tE74gOgc+ztWOPmYtVR1tlTRmUkqz66YCRbRcMcZ0S0
 o1Bg==
X-Gm-Message-State: AOAM533fb0/4Mo6bn0S3HWraOP7h3Ci2U6x91cCrrNPuA41sR3wcJ1pG
 tWZ6CkXvcL0Cc/oqIvn+N/Ymv5Xh+yw=
X-Google-Smtp-Source: ABdhPJxqinfSLm4x03+LYfMIPJm2TJhd7xmTAs3giH+Z5xy4+bQ22wP1J/7ZZQ0owFEIbnr3VCgo7A==
X-Received: by 2002:a50:fb91:0:b0:408:5100:b4a7 with SMTP id
 e17-20020a50fb91000000b004085100b4a7mr4185572edq.311.1645125689476; 
 Thu, 17 Feb 2022 11:21:29 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id m12sm426232edl.74.2022.02.17.11.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:21:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 18/25] tests: tegra: Add VIC support
Date: Thu, 17 Feb 2022 20:19:24 +0100
Message-Id: <20220217191931.2534836-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Implement a small abstraction interface to allow different versions of
VIC to be used transparently. An implementation will be chosen based on
the VIC version number reported by the DRM_TEGRA_IOCTL_OPEN_CHANNEL
IOCTL.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/host1x.h    |  34 ++++++++
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       | 159 +++++++++++++++++++++++++++++++++++
 tests/tegra/vic.h       | 181 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 376 insertions(+)
 create mode 100644 tests/tegra/host1x.h
 create mode 100644 tests/tegra/vic.c
 create mode 100644 tests/tegra/vic.h

diff --git a/tests/tegra/host1x.h b/tests/tegra/host1x.h
new file mode 100644
index 000000000000..902b0c12ee6d
--- /dev/null
+++ b/tests/tegra/host1x.h
@@ -0,0 +1,34 @@
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
+#ifndef HOST1X_H
+#define HOST1X_H
+
+#define HOST1X_OPCODE_SETCL(offset, classid, mask) \
+    ((0x0 << 28) | (((offset) & 0xfff) << 16) | (((classid) & 0x3ff) << 6) | ((mask) & 0x3f))
+
+#define HOST1X_OPCODE_INCR(offset, count) \
+    ((0x1 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+
+#define HOST1X_CLASS_VIC 0x5d
+
+#endif
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 983b91195ba3..1f4721d059e1 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -32,6 +32,8 @@ libdrm_test_tegra = static_library(
   [files(
     'drm-test-tegra.c',
     'drm-test-tegra.h',
+    'vic.c',
+    'vic.h',
   ), config_file ],
   include_directories : [inc_root, inc_drm, inc_tegra],
   link_with : libdrm,
diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
new file mode 100644
index 000000000000..43630db883bb
--- /dev/null
+++ b/tests/tegra/vic.c
@@ -0,0 +1,159 @@
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
+#include <stdio.h> /* XXX remove */
+#include <stdlib.h>
+
+#include "util_math.h"
+
+#include "tegra.h"
+#include "host1x.h"
+#include "vic.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+const struct vic_format_info *vic_format_get_info(unsigned int format)
+{
+    static const struct vic_format_info formats[] = {
+        { .format = VIC_PIXEL_FORMAT_A8R8G8B8, .cpp = 4 },
+    };
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(formats); i++) {
+        if (formats[i].format == format)
+            return &formats[i];
+    }
+
+    return 0;
+}
+
+int vic_image_new(struct vic *vic, unsigned int width, unsigned int height,
+                  unsigned int format, unsigned int kind, uint32_t flags,
+                  struct vic_image **imagep)
+{
+    const struct vic_format_info *info = vic_format_get_info(format);
+    struct vic_image *image;
+    int err;
+
+    if (!info)
+        return -EINVAL;
+
+    image = calloc(1, sizeof(*image));
+    if (!image)
+        return -ENOMEM;
+
+    if (kind == VIC_BLK_KIND_PITCH)
+        image->align = 256;
+    else
+        image->align = 256; /* XXX */
+
+    image->width = width;
+    image->stride = ALIGN(width, image->align);
+    image->pitch = image->stride * info->cpp;
+    image->height = height;
+    image->format = format;
+    image->kind = kind;
+
+    image->size = image->pitch * image->height;
+
+    printf("image: %ux%u align: %zu stride: %u pitch: %u size: %zu\n",
+           image->width, image->height, image->align, image->stride,
+           image->pitch, image->size);
+
+    err = drm_tegra_bo_new(vic->drm, 0, image->size, &image->bo);
+    if (err < 0) {
+        free(image);
+        return err;
+    }
+
+    err = drm_tegra_channel_map(vic->channel, image->bo, flags, &image->map);
+    if (err < 0) {
+        drm_tegra_bo_unref(image->bo);
+        free(image);
+        return err;
+    }
+
+    *imagep = image;
+    return 0;
+}
+
+void vic_image_free(struct vic_image *image)
+{
+    if (image) {
+        drm_tegra_channel_unmap(image->map);
+        drm_tegra_bo_unref(image->bo);
+        free(image);
+    }
+}
+
+void vic_image_dump(struct vic_image *image, FILE *fp)
+{
+    unsigned int i, j;
+    void *ptr;
+    int err;
+
+    err = drm_tegra_bo_map(image->bo, &ptr);
+    if (err < 0)
+        return;
+
+    for (j = 0; j < image->height; j++) {
+        uint32_t *pixels = (uint32_t *)((unsigned long)ptr + j * image->pitch);
+
+        printf("   ");
+
+        for (i = 0; i < image->width; i++)
+            printf(" %08x", pixels[i]);
+
+        printf("\n");
+    }
+
+    drm_tegra_bo_unmap(image->bo);
+}
+
+int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+            struct vic **vicp)
+{
+    unsigned int version;
+
+    version = drm_tegra_channel_get_version(channel);
+
+    switch (version) {
+    default:
+        break;
+    }
+
+    return -ENOTSUP;
+}
+
+void vic_free(struct vic *vic)
+{
+    if (vic)
+        vic->ops->free(vic);
+}
+
+int vic_clear(struct vic *vic, struct vic_image *output, unsigned int alpha,
+              unsigned int red, unsigned int green, unsigned int blue)
+{
+    return vic->ops->fill(vic, output, 0, 0, output->width - 1,
+                          output->height - 1, alpha, red, green, blue);
+}
diff --git a/tests/tegra/vic.h b/tests/tegra/vic.h
new file mode 100644
index 000000000000..c2056669445e
--- /dev/null
+++ b/tests/tegra/vic.h
@@ -0,0 +1,181 @@
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
+#ifndef VIC_H
+#define VIC_H
+
+#include <stdio.h>
+
+#include "host1x.h"
+
+#define DXVAHD_FRAME_FORMAT_PROGRESSIVE 0
+#define DXVAHD_FRAME_FORMAT_INTERLACED_TOP_FIELD_FIRST 1
+#define DXVAHD_FRAME_FORMAT_INTERLACED_BOTTOM_FIELD_FIRST 2
+#define DXVAHD_FRAME_FORMAT_TOP_FIELD 3
+#define DXVAHD_FRAME_FORMAT_BOTTOM_FIELD 4
+#define DXVAHD_FRAME_FORMAT_SUBPIC_PROGRESSIVE 5
+#define DXVAHD_FRAME_FORMAT_SUBPIC_INTERLACED_TOP_FIELD_FIRST 6
+#define DXVAHD_FRAME_FORMAT_SUBPIC_INTERLACED_BOTTOM_FIELD_FIRST 7
+#define DXVAHD_FRAME_FORMAT_SUBPIC_TOP_FIELD 8
+#define DXVAHD_FRAME_FORMAT_SUBPIC_BOTTOM_FIELD 9
+#define DXVAHD_FRAME_FORMAT_TOP_FIELD_CHROMA_BOTTOM 10
+#define DXVAHD_FRAME_FORMAT_BOTTOM_FIELD_CHROMA_TOP 11
+#define DXVAHD_FRAME_FORMAT_SUBPIC_TOP_FIELD_CHROMA_BOTTOM 12
+#define DXVAHD_FRAME_FORMAT_SUBPIC_BOTTOM_FIELD_CHROMA_TOP 13
+
+#define DXVAHD_ALPHA_FILL_MODE_OPAQUE 0
+#define DXVAHD_ALPHA_FILL_MODE_BACKGROUND 1
+#define DXVAHD_ALPHA_FILL_MODE_DESTINATION 2
+#define DXVAHD_ALPHA_FILL_MODE_SOURCE_STREAM 3
+#define DXVAHD_ALPHA_FILL_MODE_COMPOSITED 4
+#define DXVAHD_ALPHA_FILL_MODE_SOURCE_ALPHA 5
+
+#define VIC_BLEND_SRCFACTC_K1 0
+#define VIC_BLEND_SRCFACTC_K1_TIMES_DST 1
+#define VIC_BLEND_SRCFACTC_NEG_K1_TIMES_DST 2
+#define VIC_BLEND_SRCFACTC_K1_TIMES_SRC 3
+#define VIC_BLEND_SRCFACTC_ZERO 4
+
+#define VIC_BLEND_DSTFACTC_K1 0
+#define VIC_BLEND_DSTFACTC_K2 1
+#define VIC_BLEND_DSTFACTC_K1_TIMES_DST 2
+#define VIC_BLEND_DSTFACTC_NEG_K1_TIMES_DST 3
+#define VIC_BLEND_DSTFACTC_NEG_K1_TIMES_SRC 4
+#define VIC_BLEND_DSTFACTC_ZERO 5
+#define VIC_BLEND_DSTFACTC_ONE 6
+
+#define VIC_BLEND_SRCFACTA_K1 0
+#define VIC_BLEND_SRCFACTA_K2 1
+#define VIC_BLEND_SRCFACTA_NEG_K1_TIMES_DST 2
+#define VIC_BLEND_SRCFACTA_ZERO 3
+
+#define VIC_BLEND_DSTFACTA_K2 0
+#define VIC_BLEND_DSTFACTA_NEG_K1_TIMES_SRC 1
+#define VIC_BLEND_DSTFACTA_ZERO 2
+#define VIC_BLEND_DSTFACTA_ONE 3
+
+#define VIC_BLK_KIND_PITCH 0
+#define VIC_BLK_KIND_GENERIC_16Bx2 1
+
+#define VIC_PIXEL_FORMAT_L8 1
+#define VIC_PIXEL_FORMAT_R8 4
+#define VIC_PIXEL_FORMAT_A8R8G8B8 32
+#define VIC_PIXEL_FORMAT_R8G8B8A8 34
+#define VIC_PIXEL_FORMAT_Y8_U8V8_N420 67
+#define VIC_PIXEL_FORMAT_Y8_V8U8_N420 68
+
+#define VIC_CACHE_WIDTH_16Bx16 0 /* BL16Bx2 */
+#define VIC_CACHE_WIDTH_32Bx8 1 /* BL16Bx2 */
+#define VIC_CACHE_WIDTH_64Bx4 2 /* BL16Bx2, PL */
+#define VIC_CACHE_WIDTH_128Bx2 3 /* BL16Bx2, PL */
+#define VIC_CACHE_WIDTH_256Bx1 4 /* PL */
+
+struct vic_format_info {
+    unsigned int format;
+    unsigned int cpp;
+};
+
+
+#define VIC_UCLASS_INCR_SYNCPT 0x00
+#define VIC_UCLASS_METHOD_OFFSET 0x10
+#define VIC_UCLASS_METHOD_DATA 0x11
+
+static inline void VIC_PUSH_METHOD(struct drm_tegra_pushbuf *pushbuf,
+                                   uint32_t **ptrp, uint32_t method,
+                                   uint32_t value)
+{
+    *(*ptrp)++ = HOST1X_OPCODE_INCR(VIC_UCLASS_METHOD_OFFSET, 2);
+    *(*ptrp)++ = method >> 2;
+    *(*ptrp)++ = value;
+}
+
+static inline void VIC_PUSH_BUFFER(struct drm_tegra_pushbuf *pushbuf,
+                                   uint32_t **ptrp, uint32_t method,
+                                   struct drm_tegra_mapping *map,
+                                   unsigned long offset, unsigned long flags)
+{
+    *(*ptrp)++ = HOST1X_OPCODE_INCR(VIC_UCLASS_METHOD_OFFSET, 2);
+    *(*ptrp)++ = method >> 2;
+
+    drm_tegra_pushbuf_relocate(pushbuf, ptrp, map, offset, 8, flags);
+}
+
+struct vic_image;
+struct vic;
+
+struct vic_ops {
+    int (*fill)(struct vic *vic, struct vic_image *output,
+                unsigned int left, unsigned int top,
+                unsigned int right, unsigned int bottom,
+                unsigned int alpha, unsigned red,
+                unsigned int green, unsigned int blue);
+    int (*blit)(struct vic *vic, struct vic_image *output,
+                struct vic_image *input);
+    int (*flip)(struct vic *vic, struct vic_image *output,
+                struct vic_image *input);
+    int (*execute)(struct vic *vic,
+                   struct drm_tegra_pushbuf *pushbuf,
+                   uint32_t **ptrp,
+                   struct vic_image *output,
+                   struct vic_image **inputs,
+                   unsigned int num_inputs);
+    void (*free)(struct vic *vic);
+};
+
+struct vic {
+    struct drm_tegra *drm;
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_syncpoint *syncpt;
+    const struct vic_ops *ops;
+    unsigned int version;
+};
+
+int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+            struct vic **vicp);
+void vic_free(struct vic *vic);
+
+int vic_clear(struct vic *vic, struct vic_image *output, unsigned int alpha,
+              unsigned int red, unsigned int green, unsigned int blue);
+
+struct vic_image {
+    struct drm_tegra_bo *bo;
+    struct drm_tegra_mapping *map;
+    unsigned int width;
+    unsigned int stride;
+    unsigned int pitch;
+    unsigned int height;
+    unsigned int format;
+    unsigned int kind;
+
+    size_t align;
+    size_t size;
+};
+
+const struct vic_format_info *vic_format_get_info(unsigned int format);
+
+int vic_image_new(struct vic *vic, unsigned int width, unsigned int height,
+                  unsigned int format, unsigned int kind, uint32_t flags,
+                  struct vic_image **imagep);
+void vic_image_free(struct vic_image *image);
+void vic_image_dump(struct vic_image *image, FILE *fp);
+
+#endif
-- 
2.35.1

