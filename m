Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C13F99B0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11786E956;
	Fri, 27 Aug 2021 13:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF686E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:24:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g18so2869177wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3kCGUDFoZyN6SnbYt3qQWcFpGlY4Y9NYp4wS5JC9xw=;
 b=KuzGMvLim7UDg8/PwPM1aaALQnNQmDCZ0kNxcSxZAmUvnyBbrszz4QschJCsZMODSF
 5vq2tz2zSQdWyfBJKmXfRjK3NWOMmQtoWPfoe68Qt3F7q6ZmU8DDKUkNfAkg+nfZ+flh
 /4Pxb5f7+YC4RO9Ux9/cMFLGe9QyXKDD2jCefeYI//y8Qk0bO5swvXo4wAwv2C/ScqI+
 BiiksyKjQxDguvWIEA8hVknMU6HCYKEAQXxRjf4uU9jYmYeiAiA8SIeaJE1D+WfP7pyf
 B5zFVIMZUr5l5lT3KR4HomrL11/8HwlUl/nOg/9ozY0lI/KOBBoi5aTXI5cYYYX/oOFw
 sPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3kCGUDFoZyN6SnbYt3qQWcFpGlY4Y9NYp4wS5JC9xw=;
 b=pAkBOxmqcp8zuA9P+3BpHikjispTRxb0ui+OndPpPz9K0x+kct/Ow/SwXfmfEL0h8F
 Dn1kGpUOiX3Mcyn0vFdkNJ3lC0h8V2CjildqWeqVORcYloi/mfm3qn2yVz1pfzAOvgpo
 W/lmsGwgjHqmMIFlCXL7qcyeZKP0ztk0YvqXtGg0OmI01Q+haqpC3rNP0bzF+NIRsftN
 cBZC2vAbnD+lk0lXj9O8hQ4bPyW4igwIY2RuFY0gBwl442iZ4WxKjzFlCVFYdOKJxNiD
 d0dgNOCPNpJCn/K7XHqWZhP5NVaBz3RkglY35IyupMeBvYAHHl9ha+slOCAwHhaAeAi2
 jIBw==
X-Gm-Message-State: AOAM531iYav7w6d9/L6zlw0ARceTHL8isuXoImNziuihmZ49ZtqzneEw
 sryZ/fjOa80kaxcgseFRTQW5JBKwbvk=
X-Google-Smtp-Source: ABdhPJzxEx6GuPKCTFtqQjfqqpUCMCFQKGNNxdgqa1LRO6eOIYkEcAwH9KfzoiNb34Ja6jkubI1VVg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr10597420wrr.382.1630070647935; 
 Fri, 27 Aug 2021 06:24:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id u8sm11724541wmq.45.2021.08.27.06.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 25/25] tests: tegra: Add VIC flip test
Date: Fri, 27 Aug 2021 15:23:05 +0200
Message-Id: <20210827132305.3572077-26-thierry.reding@gmail.com>
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

This test will attempt to use the VIC to blit one surface to another
and perform a vertical flip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 ++
 tests/tegra/vic-flip.c  | 333 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 tests/tegra/vic-flip.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index a9ca09e12f3e..d24053265c2f 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -100,3 +100,12 @@ vic_blit = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_flip = executable(
+  'tegra-vic-flip',
+  files('vic-flip.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-flip.c b/tests/tegra/vic-flip.c
new file mode 100644
index 000000000000..2e32d6eb4324
--- /dev/null
+++ b/tests/tegra/vic-flip.c
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
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
+                         output->height - 1, 0, 0, 1023, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed ot fill surface: %s\n", strerror(-err));
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
+/* flip image vertically */
+static int flip(struct vic *vic, struct drm_tegra_channel *channel,
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
+    err = vic->ops->flip(vic, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip: %s\n", strerror(-err));
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
+    err = flip(vic, channel, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip image: %s\n", strerror(-err));
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

