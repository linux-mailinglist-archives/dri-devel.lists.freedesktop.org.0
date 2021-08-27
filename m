Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC253F99B9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033F6E953;
	Fri, 27 Aug 2021 13:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9C6E950
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:24:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x6so2171141wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gReCx/RYqHeEw0OorNM5z7a0NQpUD6+EvQt/5ylr3mg=;
 b=pFQ4eAOWG8j4+4HM17sdmKctg+Qzt0K+WJ8L5bialTjOKNbxBqsh5xfUgRmec+7HyN
 aw2N2PoQnc0Bfub0RefTxubzL12vdlDL4H82WM4dxJa9AcixOL2ZWlrkgg+3USO+brHo
 HD1pjIIclUWFfgv7/1kafjdGU+3JMd1/dthIKGfj5eRjeaWWTdnXLSEd1NKUuBex+gEO
 YaWc9fPlSp6ntGM7ilInylEnN8gzsqpeoAA+wHy/7ILEM7ehe0qlJEqx7YQ7QV0ffHw1
 sg2XeAXFvTX4o/7znsRNKuPr/b1pgGKYRAKOmI0h/PoPmrvqWgOFAIh5IPJw2rK0nYGw
 tHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gReCx/RYqHeEw0OorNM5z7a0NQpUD6+EvQt/5ylr3mg=;
 b=uKylrq2wJAbJyik72h8PGK0l4x0wlKKiLnvT3JIg+uz8gK0+ghwzKM9TMByjbaz06U
 VJGmIQDkdBBlVqKjhpurfL4uPtwuGqRuPRiSbUi7cDeemWmE9xNKdc4ETVM7369Bzy4l
 H82qtngEVWiVyNuT1nWeuAC9DEKD3O2NLlGRY+6FT4ayh0oi7imS3l1OwkFwh5RhXrcn
 HcP99WNKqOoIC43F8LSWp9nK8UqwBkIlauGD+er89hyhqpAqx1g2xSnqHTKx0zzps9TK
 IFcPE2b6RpIdzHpEwBp7N2pL69pLHXM9pZpMiNb3nGVzcFaAuOaVYQmyYVjccKJM3Dv9
 NADg==
X-Gm-Message-State: AOAM531idl8KuLFV9IjZ2MU3ymxn9vVN9LCeuHxivzrZO/fRSKOB8v9R
 T0OmDT+gvOaW7fVbK7bhOEJEzbyWlKU=
X-Google-Smtp-Source: ABdhPJxzkCO8eIPpjOxZXNbtUwSr2q74f2paen8YhP062jiBDfwUqUVBBWM0ouweQONqA6QRcyAq9Q==
X-Received: by 2002:a05:6000:343:: with SMTP id
 e3mr2469187wre.96.1630070644067; 
 Fri, 27 Aug 2021 06:24:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id h11sm7661885wrx.9.2021.08.27.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 23/25] tests: tegra: Add VIC clear test
Date: Fri, 27 Aug 2021 15:23:03 +0200
Message-Id: <20210827132305.3572077-24-thierry.reding@gmail.com>
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

This test will attempt to use VIC to clear a surface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 +++
 tests/tegra/vic-clear.c | 173 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 tests/tegra/vic-clear.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index d71d3d564efe..e44bd3a4393d 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -82,3 +82,12 @@ syncpt_timeout = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_clear = executable(
+  'tegra-vic-clear',
+  files('vic-clear.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-clear.c b/tests/tegra/vic-clear.c
new file mode 100644
index 000000000000..f65a644d398c
--- /dev/null
+++ b/tests/tegra/vic-clear.c
@@ -0,0 +1,173 @@
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
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "util_math.h"
+
+#include "tegra.h"
+
+#include "host1x.h"
+#include "vic.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    struct vic_image *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
+    uint32_t *pb;
+    int fd, err;
+    void *ptr;
+
+    if (argc > 1)
+        device = argv[1];
+
+    fd = open(device, O_RDWR);
+    if (fd < 0) {
+        fprintf(stderr, "open() failed: %s\n", strerror(errno));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to open Tegra device: %s\n", strerror(-err));
+        close(fd);
+        return 1;
+    }
+
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_VIC, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel to VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    version = drm_tegra_channel_get_version(channel);
+    printf("version: %08x\n", version);
+
+    err = vic_new(drm, channel, &vic);
+    if (err < 0) {
+        fprintf(stderr, "failed to create VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic_image_new(vic, width, height, format, kind, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                        &output);
+    if (err < 0) {
+        fprintf(stderr, "failed to create output image: %d\n", err);
+        return 1;
+    }
+
+    printf("image: %zu bytes\n", output->size);
+
+    err = drm_tegra_bo_map(output->bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map output image: %d\n", err);
+        return 1;
+    }
+
+    memset(ptr, 0xff, output->size);
+    drm_tegra_bo_unmap(output->bo);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &pb);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic->ops->clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &pb, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &pb, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, pb);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    drm_tegra_job_free(job);
+    vic_image_free(output);
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.32.0

