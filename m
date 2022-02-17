Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC94BA9A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3610E6C8;
	Thu, 17 Feb 2022 19:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A9A10E6D0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:21:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cm8so1808521edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PLg06xcpVyzhs8BjM9iap5lP+80pqbLcIRSWclBZPRc=;
 b=Ck681jzrBJmR2dD4GzVgdXiAS5AuQf+bPid09+kGbjM2wFqqChg4rOBC9Yi5qzkS7H
 xef0kPqY6UoSmXx7jDlaA13Kv2Xsix6dF/0SM2HPzky0WKohl6yHEaFgm2QfTTpL4Xrc
 F3WiCwDJJjOzoBbGpfgZJXxsQuNj+G4u0Ul70td1GonWQaBdA1yxCBDsdCLWFMOqoJyw
 trzizWF0pqOvzyOYoB14/cComLerz2NJMTjk9KU+GRZh8T6ar7arFVkwQjTsvOqzB0Mc
 oBqPB1rRzjM+WVHROIRF594P1RlzPwC3CREtfSr7lPpRiK/126XCCFm3cCyRWs7ej6vJ
 r2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLg06xcpVyzhs8BjM9iap5lP+80pqbLcIRSWclBZPRc=;
 b=GMEo9UeMw2WtBg+Mk5ACtJELnW9BPgr+U4vXPBT3dVbCfdpzxzZMVc0lFlwd6YfABo
 M9EA1+AEwkhsqO6oxfUryMrRltdh1xllhAyM/d5b84ZymlA3KevFO5zydsmdoTZUs5nr
 u9MgZ+bVD+nTyvUR9xRUUNYa3zev8G5ZnWm5pw9hAQzIRI5N7977HA3jIoXNB5c/QWU2
 uiD6XLN0u1QeDW79PPhBsapBW6UGZTnK+hzGtejqaYaqgQUrr/AS8SxIhzgmSY/LScKz
 nrsiYaYcNFpKgvldXoSjDS+5wdLy857fzpxR11/62yD8pJKDczfqg3tRFa+V9a0VjfPv
 i1Yg==
X-Gm-Message-State: AOAM530VFRLjQ1WKJuA5iD+oRZ+nqm0U7K9Y7ynhAxQifk462EIDEwFZ
 XQLJqHZNGrT7vuqOCVZXYo+qynZEoJQ=
X-Google-Smtp-Source: ABdhPJydNsI+UNeR01fw/OxxSX3zzdN0Bza14KVpoY5R41pUQFuMxDgrx65T3BGd+iuApcxtbrl7DA==
X-Received: by 2002:a05:6402:50c7:b0:40a:276f:cc78 with SMTP id
 h7-20020a05640250c700b0040a276fcc78mr4226186edb.349.1645125677803; 
 Thu, 17 Feb 2022 11:21:17 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id i27sm1461924ejo.214.2022.02.17.11.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:21:17 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 17/25] tests: tegra: Add syncpoint timeout test
Date: Thu, 17 Feb 2022 20:19:23 +0100
Message-Id: <20220217191931.2534836-12-thierry.reding@gmail.com>
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

This test can be used to purposefully trigger a job timeout.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build      |   9 ++
 tests/tegra/syncpt-timeout.c | 163 +++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tests/tegra/syncpt-timeout.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 8602709e8694..983b91195ba3 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -63,3 +63,12 @@ syncpt_wait = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+syncpt_timeout = executable(
+  'tegra-syncpt-timeout',
+  files('syncpt-timeout.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : libdrm_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/syncpt-timeout.c b/tests/tegra/syncpt-timeout.c
new file mode 100644
index 000000000000..fea3665cb126
--- /dev/null
+++ b/tests/tegra/syncpt-timeout.c
@@ -0,0 +1,163 @@
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
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+static int channel_open(struct drm_tegra *drm,
+                        struct drm_tegra_channel **channel)
+{
+    static const struct {
+        enum drm_tegra_class class;
+        const char *name;
+    } classes[] = {
+        { DRM_TEGRA_VIC,  "VIC"  },
+        { DRM_TEGRA_GR2D, "GR2D" },
+    };
+    unsigned int i;
+    int err;
+
+    for (i = 0; i < ARRAY_SIZE(classes); i++) {
+        err = drm_tegra_channel_open(drm, classes[i].class, channel);
+        if (err < 0) {
+            fprintf(stderr, "failed to open channel to %s: %s\n",
+                    classes[i].name, strerror(-err));
+            continue;
+        }
+
+        break;
+    }
+
+    return err;
+}
+
+int main(int argc, char *argv[])
+{
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_syncpoint *syncpt;
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    struct drm_tegra *drm;
+    uint32_t *ptr;
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
+    err = drm_tegra_syncpoint_new(drm, &syncpt);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate syncpoint: %s\n", strerror(-err));
+        drm_tegra_close(drm);
+        close(fd);
+        return 1;
+    }
+
+    err = channel_open(drm, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel: %s\n", strerror(-err));
+        return 1;
+    }
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 8, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    /*
+     * Empty command streams will be rejected, so we use this as an easy way
+     * to add something to the command stream. But this could be any other,
+     * valid command stream.
+     */
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, syncpt,
+                                      DRM_TEGRA_SYNC_COND_IMMEDIATE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    /* pretend that the syncpoint was incremented a second time */
+    err = drm_tegra_pushbuf_sync(pushbuf, syncpt, 1);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
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
+    err = drm_tegra_job_wait(job, 250000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    drm_tegra_job_free(job);
+    drm_tegra_channel_close(channel);
+    drm_tegra_syncpoint_free(syncpt);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.35.1

