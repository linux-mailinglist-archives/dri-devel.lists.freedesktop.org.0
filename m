Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076563F99AD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5422A6E948;
	Fri, 27 Aug 2021 13:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9A36E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q14so10417480wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbELmXWMHSKxwOrAgarH0W+SEsR9r8MnvJdNy39oRdg=;
 b=o9G0iOloJd+JvRzjTnGgsRAw9tI7iwnE06qhQJ13YkFcBlSYN6eD3LdpA4Ib/9+91V
 g4g4fc9Jwh6Z/+aukIAtiLkUWVNdPK+2p7CEJaENUdiEyK7X0K+ruq0L4yC7vYSfnOb7
 lgFQbCnnhcKXEjuvNmPlWjnVHs3xIb+jIsvqomyOc0jH1tmbmeLz9UjEXUlmcHKwr8EL
 Xec9YxNjWwVveZVcumEpvXvGpvIRAGZxhhXkCekttC8KRrST2v0fyGeTubmMycg1zCY4
 BYrUs3zfCoaZeycxi2f5KJ3qJWoKRy2bS77E48V8k53Cx2AbspQUzOfhjfs7XSpVyX8K
 mOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LbELmXWMHSKxwOrAgarH0W+SEsR9r8MnvJdNy39oRdg=;
 b=gZYU38IncxcOOikkN76fHbcPjH9z1E9YNh516E+iELlTgCpCoYvsmabNYeoMUye/We
 VsTF/681VYEeh+R8BgfW32umaMST8a9gSmkg9SDdNum8PTPJthDt8qobshs3/xVEvLlT
 5gc9veWIrJuWQ9dj5HY9I3RMZQFKxoOMjDmMp3weB+nxgGh5OQXAPpaTy8yGVtaluUl9
 BKrD4Loi68wBEVwP/FVSdUbovTt3/SQHcz191S8SgdWh8gBO/JglnbtIVx6/pSlDU8Oo
 ENvhw9hQgU2aOkiG29PwgtI951x9hoAnnHgjEN4mqcieAiOF8RjEsS4rQcABmFIgquB/
 prlA==
X-Gm-Message-State: AOAM533aQq7OMb/U71SCNPIBQBDGy1buqKUs1mbMjSnAE02IQOKJ2ICW
 FT2xJ/RdPiD5WwAYz8Doamc=
X-Google-Smtp-Source: ABdhPJzjdAShCedkgxVIO9rqBS+5OS3pdycCPXXtI9InTLp4lTJ4mkaJm/MTGCqb1IBCmKGvpuYNMw==
X-Received: by 2002:adf:e78d:: with SMTP id n13mr10249418wrm.55.1630070627089; 
 Fri, 27 Aug 2021 06:23:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d8sm6922081wrv.20.2021.08.27.06.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 17/25] tests: tegra: Add syncpoint timeout test
Date: Fri, 27 Aug 2021 15:22:57 +0200
Message-Id: <20210827132305.3572077-18-thierry.reding@gmail.com>
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

This test can be used to purposefully trigger a job timeout.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build      |   9 ++
 tests/tegra/syncpt-timeout.c | 163 +++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tests/tegra/syncpt-timeout.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 8b1b8bf58dd1..4b05569e0971 100644
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
+  c_args : warn_c_args,
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
2.32.0

