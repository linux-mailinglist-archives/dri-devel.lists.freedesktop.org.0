Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CE3F99B8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D56E95D;
	Fri, 27 Aug 2021 13:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572256E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:24:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id i3so3876447wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpuTsLw4X/8yyoVlGhv/CRTNrFjm7PqCZT162MCNOQg=;
 b=eY/RbRKRB0oTVhVLS2UhWg2XVSrcxjKmaM7i3K+O/eC6h2fvI8kQxUbnBIhkBc2wWn
 6TETWU08mJYSdHryD02/kVE94Lg6CjbyJYMyFsqANl1vJ51j6MJpsznAIdrZOL0rVk2e
 7PjK1oAJlNaaA+zHmM+UqWngcvCRUEbjeZbxFC222yunqybn7c5EFefBKyFeRdDoAztW
 Q0OP9LQsbrcGXCX7uGAOjED4jKo6O9TPLiifrtDiurkXfDL+5e4vHC3nfRsvf1gacJRZ
 MSoPzUfA2OhSuNsFRXXDgiq2ftohK1AOfcI3kaLJ2JQK6OIH7RcYBI8t2mjdehbz82Zi
 oCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpuTsLw4X/8yyoVlGhv/CRTNrFjm7PqCZT162MCNOQg=;
 b=ZDt6Y/hP6BYbe07nAhkk+4XlcxuM851wGs3y7E7crbtn/Nf4Zo1L3Ik7JBbLXaJMH9
 U/CvUFaij0m/mmyOP8nXkXAao5W57ssRXkv80/f7smX1dT2/RY6LaI3vJJGA+Vy4ZcMT
 YjXN6NLlopDfETMRb7p3NSl+qlQl/E9bVYOyHxj0/68VRnkaibPrxjfPvj4NLXTHRPFs
 dHGGt4Clmqh1Km/sVBU9IPnqkGm9fah8lw2fYtq5pIKTnHOWiJLhORow/lMW+AnMBkuq
 NtjPctAALtPX/EGPhlS0dhJNPaPPYpZ7XgD6/+BG9CYUHfNyy+Iy5TmS86WlFqZ+dLTK
 ZajA==
X-Gm-Message-State: AOAM531M9i8SETkV/Uqnm9HnK2nb7QozU9hIqHj4XraOfESyo70IYHBY
 tmq3kysOtUyoFYrSu+VoGq3UhS8gv5U=
X-Google-Smtp-Source: ABdhPJxyTWESCmd3pf+LGd9hduRMvJmxYP4fjs6vXu2H2qWHT+LuQBDz9EJ8Z3QbBzJdQ7DGIjQseA==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr11324077wmh.145.1630070645872; 
 Fri, 27 Aug 2021 06:24:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id c15sm3007626wmr.8.2021.08.27.06.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 24/25] tests: tegra: Add VIC blit test
Date: Fri, 27 Aug 2021 15:23:04 +0200
Message-Id: <20210827132305.3572077-25-thierry.reding@gmail.com>
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

This test will attempt to use the VIC to blit from one surface to
another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 ++
 tests/tegra/vic-blit.c  | 333 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 tests/tegra/vic-blit.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index e44bd3a4393d..a9ca09e12f3e 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -91,3 +91,12 @@ vic_clear = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_blit = executable(
+  'tegra-vic-blit',
+  files('vic-blit.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-blit.c b/tests/tegra/vic-blit.c
new file mode 100644
index 000000000000..1b4a3eff87d3
--- /dev/null
+++ b/tests/tegra/vic-blit.c
@@ -0,0 +1,333 @@
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
+#include "tegra.h"
+
+#include "host1x.h"
+#include "vic.h"
+
+/* clear output image to red */
+static int clear(struct vic *vic, struct drm_tegra_channel *channel,
+                 struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = vic->ops->clear(vic, output, 1023, 1023, 0, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* fill bottom half of image to blue */
+static int fill(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->fill(vic, output, 0, output->height / 2, output->width - 1,
+                         output->height -1, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* blit image */
+static int blit(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output, struct vic_image *input)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->blit(vic, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to blit surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, &input, 1);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct vic_image *input, *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
+    int fd, err;
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
+                        &input);
+    if (err < 0) {
+        fprintf(stderr, "failed to create input image: %d\n", err);
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
+    err = clear(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = fill(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill rectangle: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = blit(vic, channel, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to blit image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("input: %ux%u\n", input->width, input->height);
+    vic_image_dump(input, stdout);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    vic_image_free(output);
+    vic_image_free(input);
+
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.32.0

