Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12F3F99A9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1D6E947;
	Fri, 27 Aug 2021 13:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2C26E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so7360808wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exYBuIlbf0YU23kw88s9U19Qkhm1RpzWGJvTzFUi8q4=;
 b=bk1HG0Lqu2DsMDAK6jlXNJwCA+Fli0Vih5MwwbJsAKxneIjfs25rXT56Z3DL7eWWdy
 Hf+24KHtJ8+1Kljq4JueLvoCbXkPt8eA4KOxwNXNYI2jL+tYF34EJ5GF9z76or/0vGYR
 BgK0ajlQhitrh7w1tiZcad1oJHzYbR4ChhzfeK1C98Q0VZL55ijYHdHsYl6jc0Ob4BZC
 fE4Ahf2OjujdbPlBO6i2Hz4aW8dWbrRlPsUVz8FYtPj2aNBbKd7taX7EYnbr68NOhNOq
 KA6k+D1pRvDWCGePH9AxA6tdeFEHpIJhSdgPUtaQQb5KbrBHHa+PS/7epTiZVSki2P5V
 Gmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exYBuIlbf0YU23kw88s9U19Qkhm1RpzWGJvTzFUi8q4=;
 b=lg4LA/TTdsOtIluFDVENw8VVMeNY1KrhYWVez1ipCmoPrWpYvGKVo33THyxpLS6Kff
 RYdcZHtmgpzzkxrk3yodm5FtLj/yvyXAXWOGCbZnxSNBVq6izk991wh4dp0hteXgpEV2
 eTIj55ZZW8Xb8RJPQKJnMuTge9XJTQjdNzgs1xtAei06vxy8k8sbKbCdjUW8faq2Ldbz
 peQz5S/gvNudgKDPmoSED036tXb9Td6W0PAoOpGq9GDf+fN83A2I1xS7JIdr7UR/EqCW
 nY1B78TlbWNez5VqzaoiomYnn7N0jns/AaCVdX+d2AGj1DvHsYiEXmBCAbCbLoNnCi5b
 2MwQ==
X-Gm-Message-State: AOAM533CiqFreYYF3oFh1n+Q+NTOibDdzABe0ul9/5jrfuWxpmHHxQUY
 jYic+zoiqfuaMWORgThTQ1Y=
X-Google-Smtp-Source: ABdhPJyeb5Gpsp4yeuuQj9soHjq6azryMyZZ3WYVcF2V6fNUx7FMnIE/dFXGh080LaXRQsNJdzh5jw==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr19700580wmg.162.1630070614853; 
 Fri, 27 Aug 2021 06:23:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v5sm6715923wru.37.2021.08.27.06.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 12/25] tegra: Add job and push buffer APIs
Date: Fri, 27 Aug 2021 15:22:52 +0200
Message-Id: <20210827132305.3572077-13-thierry.reding@gmail.com>
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

These new functions can be used to create a job on a given channel, add
commands to the job using its push buffer and submit the job.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/job.c             | 164 ++++++++++++++++++++++++++++++++++++++++
 tegra/meson.build       |   2 +-
 tegra/private.h         |  32 ++++++++
 tegra/pushbuf.c         | 136 +++++++++++++++++++++++++++++++++
 tegra/tegra-symbols.txt |   7 ++
 tegra/tegra.h           |  34 +++++++++
 6 files changed, 374 insertions(+), 1 deletion(-)
 create mode 100644 tegra/job.c
 create mode 100644 tegra/pushbuf.c

diff --git a/tegra/job.c b/tegra/job.c
new file mode 100644
index 000000000000..c8c94e131ef0
--- /dev/null
+++ b/tegra/job.c
@@ -0,0 +1,164 @@
+/*
+ * Copyright © 2012, 2013 Thierry Reding
+ * Copyright © 2013 Erik Faye-Lund
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
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+#include <sys/poll.h>
+
+#include "private.h"
+
+struct drm_tegra_submit_cmd *
+drm_tegra_job_add_command(struct drm_tegra_job *job, uint32_t type,
+                          uint32_t flags)
+{
+    struct drm_tegra_submit_cmd *commands, *command;
+    size_t size;
+
+    size = (job->num_commands + 1) * sizeof(*commands);
+
+    commands = realloc(job->commands, size);
+    if (!commands)
+        return NULL;
+
+    command = &commands[job->num_commands];
+    memset(command, 0, sizeof(*command));
+    command->type = type;
+    command->flags = flags;
+
+    job->commands = commands;
+    job->num_commands++;
+
+    return command;
+}
+
+drm_public int
+drm_tegra_job_new(struct drm_tegra_channel *channel,
+                  struct drm_tegra_job **jobp)
+{
+    struct drm_tegra_job *job;
+
+    job = calloc(1, sizeof(*job));
+    if (!job)
+        return -ENOMEM;
+
+    job->page_size = sysconf(_SC_PAGESIZE);
+    job->channel = channel;
+
+    *jobp = job;
+
+    return 0;
+}
+
+drm_public int drm_tegra_job_free(struct drm_tegra_job *job)
+{
+    if (!job)
+        return -EINVAL;
+
+    if (job->pushbuf)
+        drm_tegra_pushbuf_free(job->pushbuf);
+
+    if (job->commands)
+        free(job->commands);
+
+    if (job->buffers)
+        free(job->buffers);
+
+    free(job);
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_job_get_pushbuf(struct drm_tegra_job *job,
+                          struct drm_tegra_pushbuf **pushbufp)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+
+    if (!job->pushbuf) {
+        pushbuf = calloc(1, sizeof(*pushbuf));
+        if (!pushbuf)
+            return -ENOMEM;
+
+        pushbuf->job = job;
+
+        pushbuf->start = calloc(1, job->page_size);
+        if (!pushbuf->start) {
+            free(pushbuf);
+            return -ENOMEM;
+        }
+
+        pushbuf->end = pushbuf->start + job->page_size / 4;
+        pushbuf->ptr = pushbuf->start;
+
+        job->pushbuf = pushbuf;
+    }
+
+    *pushbufp = job->pushbuf;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_job_submit(struct drm_tegra_job *job, struct drm_tegra_fence *fence)
+{
+    struct drm_tegra_channel *channel = job->channel;
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_channel_submit args;
+    int err;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+    args.num_bufs = job->num_buffers;
+    args.num_cmds = job->num_commands;
+    args.gather_data_words = job->pushbuf->ptr - job->pushbuf->start;
+    args.syncpt.id = job->syncpt.id;
+    args.syncpt.increments = job->syncpt.increments;
+
+    args.bufs_ptr = (uintptr_t)job->buffers;
+    args.cmds_ptr = (uintptr_t)job->commands;
+    args.gather_data_ptr = (uintptr_t)job->pushbuf->start;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_SUBMIT, &args);
+    if (err < 0)
+        return -errno;
+
+    job->syncpt.fence = args.syncpt.value;
+
+    if (fence) {
+        fence->drm = drm;
+        fence->syncpt = job->syncpt.id;
+        fence->value = job->syncpt.fence;
+    }
+
+    return 0;
+}
diff --git a/tegra/meson.build b/tegra/meson.build
index e115966fc8ed..38e43039837c 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -22,7 +22,7 @@ libdrm_tegra = library(
   'drm_tegra',
   [
     files(
-      'channel.c', 'private.h', 'tegra.c'
+      'channel.c', 'job.c', 'private.h', 'pushbuf.c', 'tegra.c'
     ),
     config_file
   ],
diff --git a/tegra/private.h b/tegra/private.h
index 7c05276707bf..970ee8ad66d4 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -72,4 +72,36 @@ struct drm_tegra_mapping {
     uint32_t id;
 };
 
+struct drm_tegra_pushbuf {
+    struct drm_tegra_job *job;
+
+    uint32_t *start;
+    uint32_t *end;
+    uint32_t *ptr;
+};
+
+void drm_tegra_pushbuf_free(struct drm_tegra_pushbuf *pushbuf);
+
+struct drm_tegra_job {
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    size_t page_size;
+
+    struct drm_tegra_submit_cmd *commands;
+    unsigned int num_commands;
+
+    struct drm_tegra_submit_buf *buffers;
+    unsigned int num_buffers;
+
+    struct {
+        uint32_t id;
+        uint32_t increments;
+        uint32_t fence;
+    } syncpt;
+};
+
+struct drm_tegra_submit_cmd *
+drm_tegra_job_add_command(struct drm_tegra_job *job, uint32_t type,
+                          uint32_t flags);
+
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/pushbuf.c b/tegra/pushbuf.c
new file mode 100644
index 000000000000..380a50abbbb0
--- /dev/null
+++ b/tegra/pushbuf.c
@@ -0,0 +1,136 @@
+/*
+ * Copyright © 2012, 2013 Thierry Reding
+ * Copyright © 2013 Erik Faye-Lund
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
+#include <stdlib.h>
+#include <string.h>
+
+#include "util_math.h"
+#include "private.h"
+
+#define HOST1X_OPCODE_NONINCR(offset, count) \
+    ((0x2 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+
+static inline unsigned int
+drm_tegra_pushbuf_get_offset(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr)
+{
+    return ptr - pushbuf->start;
+}
+
+void drm_tegra_pushbuf_free(struct drm_tegra_pushbuf *pushbuf)
+{
+    if (pushbuf->start)
+        free(pushbuf->start);
+
+    free(pushbuf);
+}
+
+/**
+ * drm_tegra_pushbuf_begin() - prepare push buffer for a series of pushes
+ * @pushbuf: push buffer
+ * @words: maximum number of words in series of pushes to follow
+ */
+drm_public int
+drm_tegra_pushbuf_begin(struct drm_tegra_pushbuf *pushbuf,
+                        unsigned int words, uint32_t **ptrp)
+{
+    struct drm_tegra_job *job = pushbuf->job;
+    unsigned long offset;
+    size_t size;
+    void *ptr;
+
+    if (pushbuf->ptr + words >= pushbuf->end) {
+        words = pushbuf->end - pushbuf->start + words;
+        size = ALIGN(words * 4, job->page_size);
+        offset = pushbuf->ptr - pushbuf->start;
+
+        ptr = realloc(pushbuf->start, size);
+        if (!ptr)
+            return -ENOMEM;
+
+        pushbuf->start = ptr;
+        pushbuf->end = pushbuf->start + size / 4;
+        pushbuf->ptr = pushbuf->start + offset;
+    }
+
+    if (ptrp)
+        *ptrp = pushbuf->ptr;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr)
+{
+    struct drm_tegra_submit_cmd *command;
+
+    command = drm_tegra_job_add_command(pushbuf->job,
+                                        DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR,
+                                        0);
+    if (!command)
+        return -ENOMEM;
+
+    command->gather_uptr.words = ptr - pushbuf->start;
+    pushbuf->ptr = ptr;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
+                           struct drm_tegra_mapping *target,
+                           unsigned long offset, unsigned int shift,
+                           uint32_t flags)
+{
+    struct drm_tegra_submit_buf *buffers, *buffer;
+    struct drm_tegra_job *job = pushbuf->job;
+    size_t size;
+
+    size = (job->num_buffers + 1) * sizeof(*buffer);
+
+    buffers = realloc(job->buffers, size);
+    if (!buffers)
+        return -ENOMEM;
+
+    buffer = &buffers[job->num_buffers];
+
+    memset(buffer, 0, sizeof(*buffer));
+    buffer->mapping = target->id;
+    buffer->flags = flags;
+    buffer->reloc.target_offset = offset;
+    buffer->reloc.gather_offset_words = drm_tegra_pushbuf_get_offset(pushbuf,
+                                                                     *ptrp);
+    buffer->reloc.shift = shift;
+
+    *(*ptrp)++ = 0xdeadbeef;
+
+    job->buffers = buffers;
+    job->num_buffers++;
+
+    return 0;
+}
diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index c16a351171f1..da3972cb99e1 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -15,4 +15,11 @@ drm_tegra_channel_map
 drm_tegra_channel_open
 drm_tegra_channel_unmap
 drm_tegra_close
+drm_tegra_job_free
+drm_tegra_job_get_pushbuf
+drm_tegra_job_new
+drm_tegra_job_submit
 drm_tegra_new
+drm_tegra_pushbuf_begin
+drm_tegra_pushbuf_end
+drm_tegra_pushbuf_relocate
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 621fef6b7000..0213e3b11e04 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -63,6 +63,22 @@ int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
 
 struct drm_tegra_channel;
 struct drm_tegra_mapping;
+struct drm_tegra_pushbuf;
+struct drm_tegra_job;
+
+enum drm_tegra_sync_cond {
+    DRM_TEGRA_SYNC_COND_IMMEDIATE,
+    DRM_TEGRA_SYNC_COND_OP_DONE,
+    DRM_TEGRA_SYNC_COND_RD_DONE,
+    DRM_TEGRA_SYNC_COND_WR_SAFE,
+    DRM_TEGRA_SYNC_COND_MAX,
+  };
+
+struct drm_tegra_fence {
+    struct drm_tegra *drm;
+    uint32_t syncpt;
+    uint32_t value;
+};
 
 int drm_tegra_channel_open(struct drm_tegra *drm,
                            enum drm_tegra_class client,
@@ -74,4 +90,22 @@ int drm_tegra_channel_map(struct drm_tegra_channel *channel,
                           struct drm_tegra_mapping **mapp);
 int drm_tegra_channel_unmap(struct drm_tegra_mapping *map);
 
+int drm_tegra_job_new(struct drm_tegra_channel *channel,
+                      struct drm_tegra_job **jobp);
+int drm_tegra_job_free(struct drm_tegra_job *job);
+int drm_tegra_job_get_pushbuf(struct drm_tegra_job *job,
+                              struct drm_tegra_pushbuf **pushbufp);
+int drm_tegra_job_submit(struct drm_tegra_job *job,
+                         struct drm_tegra_fence *fence);
+int drm_tegra_job_wait(struct drm_tegra_job *job, unsigned long timeout);
+
+int drm_tegra_pushbuf_begin(struct drm_tegra_pushbuf *pushbuf,
+                            unsigned int words, uint32_t **ptrp);
+int drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr);
+int drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf,
+                               uint32_t **ptrp,
+                               struct drm_tegra_mapping *target,
+                               unsigned long offset, unsigned int shift,
+                               uint32_t flags);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0

