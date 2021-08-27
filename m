Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B293F99BA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7608B6E951;
	Fri, 27 Aug 2021 13:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87C6E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso4378350wmr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nuVAyahVvCyom47ThnJ+Av1+jLLRN/P1sm9h6hub+I=;
 b=TlVyc6rRVLucCsRjBnlVCLrO6mThUMkMXedSmIRht69KokIvqlFEM/DkR37SsD7ju1
 mJ5AYgUTm+HBEj7PmrhXdAVYUFJxLNEGwuHRSYzju4PLzVEJ51T3QIhfwv4/zQsV7u37
 DqzAvGvPpKf0RdyNlvJIbHpakJDBqYQi1leLs91ryWTA4zA3Wx9N4rbiMEZMlc/b9wLk
 P297ry3hSaU6ZNQnQmpZ2HgYzC2Cj7OKPm4865twGoHWRB6sWHeHsJkBLGhmEKpsBuNf
 u4Jp042vaYwlhPlrmPD1HcZMSK/2YrDk/gMMqJc0s7eHlyc79Bc27me6mvHO4lpucbQ5
 Fh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nuVAyahVvCyom47ThnJ+Av1+jLLRN/P1sm9h6hub+I=;
 b=pyLQOJ/5mYNsy+bEzCN+MCBTMqtDXNVXzqh291KXmiYmSCxXoPar5d0drIopg2n6pA
 SgxHYUE0TNIl6dSeeqGWtj5ilIj0h2dTJ3Hil0XwfQ3EDBeFyXK4u0LGDCyKPG1SskcX
 fiHrU/5OkYA5VhIk0iLd7sHyuqjtQSa6UsvuswdjHOLuA/X9Ju/yBbxTX1vzrlhjHJYQ
 mK2ElxL6HlN47NxNdlCchJyjhed+kFX845uZuNOXbQcgcaQYSip/r4WvgzaaH2SlqjmH
 dF5QKy1pcW7UdwrZ/ZsBucmxyq7uJBOqvl47795TfA4b69H/gmZ4oujX4ix+Tu1wWdBc
 uAnA==
X-Gm-Message-State: AOAM5337V7KicNVJpdNSiogQX98QUZMK6e5AG48ciz4jkWbK5jdgZv7M
 catV3ILXq/QijOLrL8y/2Zg=
X-Google-Smtp-Source: ABdhPJyGfgPBu8TgClDh44C4F+INdtm/KHtI1IVKV6kStTzC+s5DFWxcXHUTAle7aSrMJM8BZ8PF5A==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr8831653wmb.83.1630070616879;
 Fri, 27 Aug 2021 06:23:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id u10sm6411753wrt.14.2021.08.27.06.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 13/25] tegra: Add syncpoint APIs
Date: Fri, 27 Aug 2021 15:22:53 +0200
Message-Id: <20210827132305.3572077-14-thierry.reding@gmail.com>
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

These new functions can be used to allocate and free syncpoints, as well
as wait for a syncpoint threshold to be reached. Jobs can also be waited
on if a syncpoint was attached to them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/job.c             |  23 +++++++++
 tegra/meson.build       |   2 +-
 tegra/private.h         |   5 ++
 tegra/pushbuf.c         |  48 +++++++++++++++++++
 tegra/syncpt.c          | 101 ++++++++++++++++++++++++++++++++++++++++
 tegra/tegra-symbols.txt |   7 +++
 tegra/tegra.h           |  16 +++++++
 7 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 tegra/syncpt.c

diff --git a/tegra/job.c b/tegra/job.c
index c8c94e131ef0..75a344f1dcc5 100644
--- a/tegra/job.c
+++ b/tegra/job.c
@@ -162,3 +162,26 @@ drm_tegra_job_submit(struct drm_tegra_job *job, struct drm_tegra_fence *fence)
 
     return 0;
 }
+
+drm_public int
+drm_tegra_job_wait(struct drm_tegra_job *job, unsigned long timeout)
+{
+    struct drm_tegra_channel *channel = job->channel;
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_syncpoint_wait args;
+    struct timespec ts;
+    int err;
+
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+
+    memset(&args, 0, sizeof(args));
+    args.timeout_ns = ts.tv_sec * 1000000000 + ts.tv_nsec + timeout;
+    args.id = job->syncpt.id;
+    args.threshold = job->syncpt.fence;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_WAIT, &args);
+    if (err < 0)
+        return -errno;
+
+    return 0;
+}
diff --git a/tegra/meson.build b/tegra/meson.build
index 38e43039837c..3059b2a57d56 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -22,7 +22,7 @@ libdrm_tegra = library(
   'drm_tegra',
   [
     files(
-      'channel.c', 'job.c', 'private.h', 'pushbuf.c', 'tegra.c'
+      'channel.c', 'job.c', 'private.h', 'pushbuf.c', 'syncpt.c', 'tegra.c'
     ),
     config_file
   ],
diff --git a/tegra/private.h b/tegra/private.h
index 970ee8ad66d4..f134f3ea2cea 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -104,4 +104,9 @@ struct drm_tegra_submit_cmd *
 drm_tegra_job_add_command(struct drm_tegra_job *job, uint32_t type,
                           uint32_t flags);
 
+struct drm_tegra_syncpoint {
+    struct drm_tegra *drm;
+    uint32_t id;
+};
+
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/pushbuf.c b/tegra/pushbuf.c
index 380a50abbbb0..0c0212e127a7 100644
--- a/tegra/pushbuf.c
+++ b/tegra/pushbuf.c
@@ -101,6 +101,25 @@ drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr)
     return 0;
 }
 
+drm_public int
+drm_tegra_pushbuf_wait(struct drm_tegra_pushbuf *pushbuf,
+                       struct drm_tegra_syncpoint *syncpt,
+                       uint32_t value)
+{
+    struct drm_tegra_submit_cmd *command;
+
+    command = drm_tegra_job_add_command(pushbuf->job,
+                                        DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT,
+                                        0);
+    if (!command)
+        return -ENOMEM;
+
+    command->wait_syncpt.id = syncpt->id;
+    command->wait_syncpt.value = value;
+
+    return 0;
+}
+
 drm_public int
 drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
                            struct drm_tegra_mapping *target,
@@ -134,3 +153,32 @@ drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
 
     return 0;
 }
+
+drm_public int
+drm_tegra_pushbuf_sync(struct drm_tegra_pushbuf *pushbuf,
+                       struct drm_tegra_syncpoint *syncpt,
+                       unsigned int count)
+{
+    struct drm_tegra_job *job = pushbuf->job;
+
+    job->syncpt.increments += count;
+    job->syncpt.id = syncpt->id;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_pushbuf_sync_cond(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
+                            struct drm_tegra_syncpoint *syncpt,
+                            enum drm_tegra_sync_cond cond)
+{
+    struct drm_tegra_channel *channel = pushbuf->job->channel;
+
+    if (cond >= DRM_TEGRA_SYNC_COND_MAX)
+        return -EINVAL;
+
+    *(*ptrp)++ = HOST1X_OPCODE_NONINCR(0x0, 0x1);
+    *(*ptrp)++ = cond << channel->cond_shift | syncpt->id;
+
+    return drm_tegra_pushbuf_sync(pushbuf, syncpt, 1);
+}
diff --git a/tegra/syncpt.c b/tegra/syncpt.c
new file mode 100644
index 000000000000..16014186fa30
--- /dev/null
+++ b/tegra/syncpt.c
@@ -0,0 +1,101 @@
+/*
+ * Copyright © 2021 NVIDIA Corporation
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
+#include <string.h>
+
+#include <sys/ioctl.h>
+
+#include "private.h"
+
+drm_public int
+drm_tegra_syncpoint_new(struct drm_tegra *drm,
+                        struct drm_tegra_syncpoint **syncptp)
+{
+    struct drm_tegra_syncpoint_allocate args;
+    struct drm_tegra_syncpoint *syncpt;
+    int err;
+
+    syncpt = calloc(1, sizeof(*syncpt));
+    if (!syncpt)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_ALLOCATE, &args);
+    if (err < 0) {
+        free(syncpt);
+        return -errno;
+    }
+
+    syncpt->drm = drm;
+    syncpt->id = args.id;
+
+    *syncptp = syncpt;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_syncpoint_free(struct drm_tegra_syncpoint *syncpt)
+{
+    struct drm_tegra_syncpoint_free args;
+    struct drm_tegra *drm = syncpt->drm;
+    int err;
+
+    if (!syncpt)
+        return -EINVAL;
+
+    memset(&args, 0, sizeof(args));
+    args.id = syncpt->id;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_FREE, &args);
+    if (err < 0)
+        return -errno;
+
+    free(syncpt);
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_fence_wait(struct drm_tegra_fence *fence, unsigned long timeout)
+{
+    struct drm_tegra_syncpoint_wait args;
+    struct drm_tegra *drm = fence->drm;
+    int err;
+
+    memset(&args, 0, sizeof(args));
+    args.timeout_ns = 0;
+    args.id = fence->syncpt;
+    args.threshold = fence->value;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_WAIT, &args);
+    if (err < 0)
+        return -errno;
+
+    return 0;
+}
diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index da3972cb99e1..1a75c3d27c83 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -15,11 +15,18 @@ drm_tegra_channel_map
 drm_tegra_channel_open
 drm_tegra_channel_unmap
 drm_tegra_close
+drm_tegra_fence_wait
 drm_tegra_job_free
 drm_tegra_job_get_pushbuf
 drm_tegra_job_new
 drm_tegra_job_submit
+drm_tegra_job_wait
 drm_tegra_new
 drm_tegra_pushbuf_begin
 drm_tegra_pushbuf_end
 drm_tegra_pushbuf_relocate
+drm_tegra_pushbuf_sync
+drm_tegra_pushbuf_sync_cond
+drm_tegra_pushbuf_wait
+drm_tegra_syncpoint_free
+drm_tegra_syncpoint_new
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 0213e3b11e04..8f3c0554f29b 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -65,6 +65,7 @@ struct drm_tegra_channel;
 struct drm_tegra_mapping;
 struct drm_tegra_pushbuf;
 struct drm_tegra_job;
+struct drm_tegra_syncpoint;
 
 enum drm_tegra_sync_cond {
     DRM_TEGRA_SYNC_COND_IMMEDIATE,
@@ -102,10 +103,25 @@ int drm_tegra_job_wait(struct drm_tegra_job *job, unsigned long timeout);
 int drm_tegra_pushbuf_begin(struct drm_tegra_pushbuf *pushbuf,
                             unsigned int words, uint32_t **ptrp);
 int drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr);
+int drm_tegra_pushbuf_wait(struct drm_tegra_pushbuf *pushbuf,
+                           struct drm_tegra_syncpoint *syncpt,
+                           uint32_t value);
 int drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf,
                                uint32_t **ptrp,
                                struct drm_tegra_mapping *target,
                                unsigned long offset, unsigned int shift,
                                uint32_t flags);
+int drm_tegra_pushbuf_sync(struct drm_tegra_pushbuf *pushbuf,
+                           struct drm_tegra_syncpoint *syncpt,
+                           unsigned int count);
+int drm_tegra_pushbuf_sync_cond(struct drm_tegra_pushbuf *pushbuf,
+                                uint32_t **ptrp,
+                                struct drm_tegra_syncpoint *syncpt,
+                                enum drm_tegra_sync_cond cond);
+
+int drm_tegra_syncpoint_new(struct drm_tegra *drm,
+                            struct drm_tegra_syncpoint **syncptp);
+int drm_tegra_syncpoint_free(struct drm_tegra_syncpoint *syncpt);
+int drm_tegra_fence_wait(struct drm_tegra_fence *fence, unsigned long timeout);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0

