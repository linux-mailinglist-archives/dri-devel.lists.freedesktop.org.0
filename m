Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CAB3F99AF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782CE6E94D;
	Fri, 27 Aug 2021 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA936E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so7361195wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tv1s1DoOrqUJqM4Qc/6Vftm5oyXsPN8pyd5/TCaFDNA=;
 b=VAYRLRM2SlgJXcCfTHzwE2gJFeFDePT11OnjNULr8945iQU+qz+5pIUec+RJolsuHe
 xQZ0Yz3fKaaXTaokgx8JgoMi/+N6f1KyzpMd5zX78a9FfJXlGyxLBu63Pv7C/co7HCch
 vvFq52Km2lumqD1Vz6RJdeckcQbrxZFYxzmnKyMKqU15fxGytm+k8XMchZzqgqi9u8Nr
 Gi7BoUxOcWC/hZ4Wc8/p6UBC9OcQWanJREm2S+vPFtv1IRNlNVq0VgiI1QyaFQyB8CPG
 LOzf9Zryyo9lssduzpQLHuZK8ROyQNguTHnV/QN48C0dCqZ5kNKmxRTKLl5gDduu0bAo
 4gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tv1s1DoOrqUJqM4Qc/6Vftm5oyXsPN8pyd5/TCaFDNA=;
 b=r6kdhCFvfEoPBDjostKyWgs7fStr0OF03CBqYcjPTXK48XaYpm5q1/OEA5P1BX/fHp
 n3B/y18aB95Gqzfbm1jY8DBw9gRuQ6Y6bmDfNjhGkxjV2xNcEGx5tqMw2RjJ6KC68f9v
 eEeV0ePbxkq8LIyY6GKGa3kiuSJfjbYFGRegZBGNveOv/tFuBzD+LoVrqZ0jeHmBB1mE
 1VGFUyKJ7RKfGUWtYc7b52Xmp0t51ABV4yR8t6pwHlm9f9uS1hA0sBizpUrNhb+/ncbM
 rPr07vvmUr0WDXURXtVddjkM+LsjZ/VAL4lavVmaaRf6PeslUUuBRra/lzrJdYMbUmQZ
 Y7qg==
X-Gm-Message-State: AOAM533nwXWxLjqMO/SkOA691G90lRyK9CDK09RJy6/iCq+8Q6rwQf5T
 2aXZ+9L4MQgGNTzHoH6RVQk=
X-Google-Smtp-Source: ABdhPJxbh4Y5jcw80QmuxIRmaJF24Brm74tewvIxUpNJgS3aJ/OOV5JsdgaaVxOoMPWxuHm59b3fHw==
X-Received: by 2002:a05:600c:c8:: with SMTP id u8mr8873536wmm.47.1630070629123; 
 Fri, 27 Aug 2021 06:23:49 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id q11sm11272321wmc.41.2021.08.27.06.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 18/25] tests: tegra: Add VIC support
Date: Fri, 27 Aug 2021 15:22:58 +0200
Message-Id: <20210827132305.3572077-19-thierry.reding@gmail.com>
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

Implement a small abstraction interface to allow different versions of
VIC to be used transparently. An implementation will be chosen based on
the VIC version number reported by the DRM_TEGRA_IOCTL_OPEN_CHANNEL
IOCTL.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/host1x.h    |  34 ++++++++
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       | 152 +++++++++++++++++++++++++++++++++
 tests/tegra/vic.h       | 181 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 369 insertions(+)
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
index 4b05569e0971..55c1c72808e3 100644
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
index 000000000000..02ba4a25ae47
--- /dev/null
+++ b/tests/tegra/vic.c
@@ -0,0 +1,152 @@
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
diff --git a/tests/tegra/vic.h b/tests/tegra/vic.h
new file mode 100644
index 000000000000..64860c84f397
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
+    int (*clear)(struct vic *vic, struct vic_image *output,
+                 unsigned int alpha, unsigned int red,
+                 unsigned int green, unsigned int blue);
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
2.32.0

