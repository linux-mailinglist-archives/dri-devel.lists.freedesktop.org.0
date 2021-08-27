Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2593F99A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA26E94B;
	Fri, 27 Aug 2021 13:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC06E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so4373717wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1c2Xoo0oBXLhGt1QHt++Z2aodDZUG1KkNynmAs+aCWQ=;
 b=gj/ZsvA9m+oxGR2NGhs4zaiGnrTrZRcTUIdkXXImU4Cv0KStXLRHlxryt1OOG666tz
 LDA6TLqEsaNSisLJksGCjUtzfikX/NOVo9FYxlVSDYNV5C7/jGGtmS7mhJSfhaMismWD
 X8vXAshC28K2cZnb1q3af0BoFs+BCGB8mwyuAt6ubNhvPEqEornKmsrHqDSOjmp/1ll5
 BxM55XeUl+HMtakCh5ALNjaAZvbTb84KaCfJWuSLMym9SoWs8wiZSxbsuE3y45SRglwY
 jDoGTVUrUvgC3eiplv0Mt2MBAPFc8lnfokACXSa93w/A0kUSXpDMjKHad03QS1E/aXk9
 KPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1c2Xoo0oBXLhGt1QHt++Z2aodDZUG1KkNynmAs+aCWQ=;
 b=lrIBsNx7bhm06/Cw8sX9pxXrLme54bvgje+9P5PKThXQ/gv9QfcdWvcfd4RvjgVokB
 93rVMIPrjHqZXArnatEZY6ayfYbiob50m8UOsD+HLUQgfqclK54CXoPfqUGv7zsdKH8E
 pZ6lRG6nnZBFddPk8KUQhbOO3wJ6si3FjCJpeCThigwk/+3B3QYg28I10htBnNInduZE
 +WZsJlrXkPStMPH64H2QHj3kEDUN1GJKhir3PH1jzFLy0y6TQnZ5d+kQRkTx9k3+bHTz
 0n7uyJWnwQs25F02mHOw+KEPEtzVAVCxhScE2kWABKA7okbO6IevxfKMqxwFPYQnGB46
 mW8A==
X-Gm-Message-State: AOAM53338g/iI1AEjZUZYCLmu1s/ouruJca9KuSBTte8R9KsDkXYTxp2
 KmXv2sohk4vgBxzpHNzPEa5pBDdlqzo=
X-Google-Smtp-Source: ABdhPJyx9M484kcgcruSstDyyh1s8koG+2qz2zucv/AbJuWBLJVDMU9z0y9eh5/IRRHfnkmBGw9Q4g==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr17249096wme.119.1630070621829; 
 Fri, 27 Aug 2021 06:23:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v28sm6283044wrv.93.2021.08.27.06.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 15/25] tests: tegra: Add gr2d-fill test
Date: Fri, 27 Aug 2021 15:22:55 +0200
Message-Id: <20210827132305.3572077-16-thierry.reding@gmail.com>
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

This test uses the IOCTLs for job submission and fences to fill a sub-
region of the screen to a specific color using gr2d.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/.gitignore       |   1 +
 tests/tegra/drm-test-tegra.c | 147 +++++++++++++++++++++++++++++++++++
 tests/tegra/drm-test-tegra.h |  55 +++++++++++++
 tests/tegra/gr2d-fill.c      | 146 ++++++++++++++++++++++++++++++++++
 tests/tegra/meson.build      |  19 +++++
 5 files changed, 368 insertions(+)
 create mode 100644 tests/tegra/drm-test-tegra.c
 create mode 100644 tests/tegra/drm-test-tegra.h
 create mode 100644 tests/tegra/gr2d-fill.c

diff --git a/tests/tegra/.gitignore b/tests/tegra/.gitignore
index 56cfb62b785f..0db9e5401302 100644
--- a/tests/tegra/.gitignore
+++ b/tests/tegra/.gitignore
@@ -1 +1,2 @@
+tegra-gr2d-fill
 tegra-openclose
diff --git a/tests/tegra/drm-test-tegra.c b/tests/tegra/drm-test-tegra.c
new file mode 100644
index 000000000000..1a9fa8961de9
--- /dev/null
+++ b/tests/tegra/drm-test-tegra.c
@@ -0,0 +1,147 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <stdio.h>
+
+#include "drm-test-tegra.h"
+#include "tegra.h"
+
+int drm_tegra_gr2d_open(struct drm_tegra *drm, struct drm_tegra_gr2d **gr2dp)
+{
+    struct drm_tegra_gr2d *gr2d;
+    int err;
+
+    gr2d = calloc(1, sizeof(*gr2d));
+    if (!gr2d)
+        return -ENOMEM;
+
+    gr2d->drm = drm;
+
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_GR2D, &gr2d->channel);
+    if (err < 0) {
+        free(gr2d);
+        return err;
+    }
+
+    *gr2dp = gr2d;
+
+    return 0;
+}
+
+int drm_tegra_gr2d_close(struct drm_tegra_gr2d *gr2d)
+{
+    if (!gr2d)
+        return -EINVAL;
+
+    drm_tegra_channel_close(gr2d->channel);
+    free(gr2d);
+
+    return 0;
+}
+
+int drm_tegra_gr2d_fill(struct drm_tegra_gr2d *gr2d, struct drm_framebuffer *fb,
+                        unsigned int x, unsigned int y, unsigned int width,
+                        unsigned int height, uint32_t color)
+{
+    struct drm_tegra_bo *fbo = fb->data;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_mapping *map;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
+
+    err = drm_tegra_job_new(gr2d->channel, &job);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_channel_map(gr2d->channel, fbo, 0, &map);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0)
+        return err;
+
+    *ptr++ = HOST1X_OPCODE_SETCL(0, HOST1X_CLASS_GR2D, 0);
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x9, 0x9);
+    *ptr++ = 0x0000003a;
+    *ptr++ = 0x00000000;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x1e, 0x7);
+    *ptr++ = 0x00000000;
+    *ptr++ = (2 << 16) | (1 << 6) | (1 << 2);
+    *ptr++ = 0x000000cc;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x2b, 0x9);
+
+    /* relocate destination buffer */
+    err = drm_tegra_pushbuf_relocate(pushbuf, &ptr, map, 0, 0, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to relocate buffer object: %d\n", err);
+        return err;
+    }
+
+    *ptr++ = fb->pitch;
+
+    *ptr++ = HOST1X_OPCODE_NONINCR(0x35, 1);
+    *ptr++ = color;
+
+    *ptr++ = HOST1X_OPCODE_NONINCR(0x46, 1);
+    *ptr++ = 0x00000000;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x38, 0x5);
+    *ptr++ = height << 16 | width;
+    *ptr++ = y << 16 | x;
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %d\n", -err);
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %d\n", err);
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for fence: %d\n", err);
+        return err;
+    }
+
+    drm_tegra_channel_unmap(map);
+    drm_tegra_job_free(job);
+
+    return 0;
+}
diff --git a/tests/tegra/drm-test-tegra.h b/tests/tegra/drm-test-tegra.h
new file mode 100644
index 000000000000..eefa954cd40b
--- /dev/null
+++ b/tests/tegra/drm-test-tegra.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifndef TEGRA_DRM_TEST_TEGRA_H
+#define TEGRA_DRM_TEST_TEGRA_H
+
+#include "drm-test.h"
+#include "tegra.h"
+
+#define HOST1X_OPCODE_SETCL(offset, classid, mask) \
+    ((0x0 << 28) | (((offset) & 0xfff) << 16) | (((classid) & 0x3ff) << 6) | ((mask) & 0x3f))
+#define HOST1X_OPCODE_INCR(offset, count) \
+    ((0x1 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+#define HOST1X_OPCODE_NONINCR(offset, count) \
+    ((0x2 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+#define HOST1X_OPCODE_MASK(offset, mask) \
+    ((0x3 << 28) | (((offset) & 0xfff) << 16) | ((mask) & 0xffff))
+#define HOST1X_OPCODE_IMM(offset, data) \
+    ((0x4 << 28) | (((offset) & 0xfff) << 16) | ((data) & 0xffff))
+#define HOST1X_OPCODE_EXTEND(subop, value) \
+    ((0xe << 28) | (((subop) & 0xf) << 24) | ((value) & 0xffffff))
+
+#define HOST1X_CLASS_GR2D 0x51
+
+struct drm_tegra_gr2d {
+    struct drm_tegra *drm;
+    struct drm_tegra_channel *channel;
+};
+
+int drm_tegra_gr2d_open(struct drm_tegra *drm, struct drm_tegra_gr2d **gr2dp);
+int drm_tegra_gr2d_close(struct drm_tegra_gr2d *gr2d);
+int drm_tegra_gr2d_fill(struct drm_tegra_gr2d *gr2d, struct drm_framebuffer *fb,
+                        unsigned int x, unsigned int y, unsigned int width,
+                        unsigned int height, uint32_t color);
+
+#endif
diff --git a/tests/tegra/gr2d-fill.c b/tests/tegra/gr2d-fill.c
new file mode 100644
index 000000000000..d138cc4c6f85
--- /dev/null
+++ b/tests/tegra/gr2d-fill.c
@@ -0,0 +1,146 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+
+#include "xf86drm.h"
+#include "xf86drmMode.h"
+#include "drm_fourcc.h"
+
+#include "drm-test-tegra.h"
+#include "tegra.h"
+
+int main(int argc, char *argv[])
+{
+    uint32_t format = DRM_FORMAT_XRGB8888;
+    struct drm_tegra_gr2d *gr2d;
+    struct drm_framebuffer *fb;
+    struct drm_screen *screen;
+    unsigned int pitch, size;
+    struct drm_tegra_bo *bo;
+    struct drm_tegra *drm;
+    uint32_t handle;
+    int fd, err;
+    void *ptr;
+
+    fd = drm_open(argv[1]);
+    if (fd < 0) {
+        fprintf(stderr, "failed to open DRM device %s: %s\n", argv[1],
+                strerror(errno));
+        return 1;
+    }
+
+    err = drm_screen_open(&screen, fd);
+    if (err < 0) {
+        fprintf(stderr, "failed to open screen: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to create Tegra DRM context: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_gr2d_open(drm, &gr2d);
+    if (err < 0) {
+        fprintf(stderr, "failed to open gr2d channel: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    pitch = screen->width * screen->bpp / 8;
+    size = pitch * screen->height;
+
+    err = drm_tegra_bo_new(drm, 0, size, &bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to create buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_bo_get_handle(bo, &handle);
+    if (err < 0) {
+        fprintf(stderr, "failed to get handle to buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_bo_map(bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    memset(ptr, 0xff, size);
+
+    err = drm_framebuffer_new(&fb, screen, handle, screen->width,
+                              screen->height, pitch, format, bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to create framebuffer: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_screen_set_framebuffer(screen, fb);
+    if (err < 0) {
+        fprintf(stderr, "failed to display framebuffer: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    sleep(1);
+
+    err = drm_tegra_gr2d_fill(gr2d, fb, fb->width / 4, fb->height / 4,
+                              fb->width / 2, fb->height / 2, 0x00000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill rectangle: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    sleep(1);
+
+    drm_framebuffer_free(fb);
+    drm_tegra_bo_unref(bo);
+    drm_tegra_gr2d_close(gr2d);
+    drm_tegra_close(drm);
+    drm_screen_close(screen);
+    drm_close(fd);
+
+    return 0;
+}
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 3ac9015fbed8..b4aea33f4298 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -27,6 +27,16 @@ libdrm_test = static_library(
   link_with : libdrm,
 )
 
+libdrm_test_tegra = static_library(
+  'drm-test-tegra',
+  [files(
+    'drm-test-tegra.c',
+    'drm-test-tegra.h',
+  ), config_file ],
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  link_with : libdrm,
+)
+
 openclose = executable(
   'tegra-openclose',
   files('openclose.c'),
@@ -35,3 +45,12 @@ openclose = executable(
   link_with : [libdrm, libdrm_tegra],
   install : with_install_tests,
 )
+
+gr2d_fill = executable(
+  'tegra-gr2d-fill',
+  files('gr2d-fill.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
-- 
2.32.0

