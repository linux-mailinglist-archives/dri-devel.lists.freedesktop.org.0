Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A918C4BA99E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C9D10E6B4;
	Thu, 17 Feb 2022 19:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F3910E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:20:20 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qk11so9652927ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SIia1rBwiVNCAd5Q1ZX/xY0Vg0f6A5WzajpeysDIC+8=;
 b=JBP3m0VFnEUA7sR7ESOOgYr2lB01XKYBb7rETqBPvnr0e60jIpKv7jJEqWQtjbK8RF
 SYbTc0G3H7O4Zrv/Rmtl41olYqYUsWSVc1ZT12tJd9z02VgG7f+zX9xgVAOvJ18wGdEW
 f2PJgQdG1mN8AxSRdku/FiAuPg+bN+f9ggw9USLn+zw6fk8DPWm5gXAc9IYcxiyKXdZ0
 DyK5l/E6q0l1r9WGnUBDdv5TCbGSrxgwJd6SSvi1aFzjUURxPMqLezOKe/bCzgGtte8d
 tXAWd4MvWPKXqnZvMKMXV2mAQnqB2c0gkUAb2gIXNzAPhGlCH507U7UAUC0laJPlJuNk
 MjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SIia1rBwiVNCAd5Q1ZX/xY0Vg0f6A5WzajpeysDIC+8=;
 b=Q/dIu1V0ZM9DMRxCuep3h12JT9LzTCziuSiVmSkZ7vAqD4pYD/aRl7FTxIBdhMvv7F
 L72CTWhpB8et5yP0tmrR+/ScGrMIsq5r73GNGZH+KzD8psrA4dz9aSBNjDhNLITflijU
 oL1YvtBwOygf9TG8UvSIx0QkHDilj2yjmNN9lleGvGWYevGbwISkvCtpXuok+B+NQ1hM
 INqwG+8qhIlkLaH0gQHDYY30Q1zqx0Zay0YiMLbqQC8gqBa67kdr2bFMbZnohyX0Mpea
 lcmIzs95cnqrbdMT7ZjoCtvtzP9S4pjRQe/RaE0nOjs6qsF36yqd5Rm12an+ceqmD0bT
 rg2Q==
X-Gm-Message-State: AOAM53126flrXNj4BCabaou3XMQ6eaXSdY0SfIQo933sj0ZuB2nkGh/o
 cgw4/vZ9ihIRQ9dek55ES3E=
X-Google-Smtp-Source: ABdhPJyZkyFy3bjcIN7OJAeYyzcznjscer6S6yR5hI/rQd6rbfbn9KYCNOVZi8ll3bQx/UglYqAbeg==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id
 g2-20020a17090670c200b006cfe1cc4d8cmr3654245ejk.696.1645125619337; 
 Thu, 17 Feb 2022 11:20:19 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id u4sm1472541ejn.216.2022.02.17.11.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:20:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 12/25] tegra: Add job and push buffer APIs
Date: Thu, 17 Feb 2022 20:19:18 +0100
Message-Id: <20220217191931.2534836-7-thierry.reding@gmail.com>
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
index 34900c896f15..7698acec9ad0 100644
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
2.35.1

