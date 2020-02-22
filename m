Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C508168C13
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048356F5C0;
	Sat, 22 Feb 2020 02:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C1C6F5BF;
 Sat, 22 Feb 2020 02:43:26 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y1so1663881plp.7;
 Fri, 21 Feb 2020 18:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3u2kcKfGrQWFWcvu77bOrRz/04l5BrVjo4/eFlU4ALc=;
 b=mdd9wFHDP5f+qYBnOTP8piiZZdTrZu/ef6TsFWKz3WoLsbLmumSqGEQEVlMuYYWDQT
 +QTnkGoQilI0zEnpX3R7z8n7gE3lVUzGhWHcsjW6p3qXEnc+wUAPX2SU7pDbx+TI7xYc
 sve2d/oOV+Y8dHVPjoFOx4ta61UKDMEi6Cb2U0VE3kzOVi59Cmsw9saJlVefszH15Ix8
 JCLkkWIAqJitADjb96vzyOSWne+SNIC3L7WyTKeIZGMAmQl2spZe+gzZfoomRkkuW3NJ
 gRLjpfKwO3U8xcM3ccrwxKq/6ksR8R2O+bAqxy1+s80H5DGVqrpIppw0MNGe1WqJHeY1
 dwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3u2kcKfGrQWFWcvu77bOrRz/04l5BrVjo4/eFlU4ALc=;
 b=H6va9btJgmyss/0c6Ywt6V30f7jZ/oC3glGCCtODKa5Ouy90Q+2ANBgAnyelzFnNzb
 cXcrKiKdJdLxRz9/OscxOtx8+pjVrvKN3wP7iU0KxuBAgc7GU6KRPgbm9X76ehW7WLAY
 ylrXhR/pOImX9GbtJTkyAzilTdBClynYxj1TOYUwOQ8loIudXTnorHiQtNBE+MIoz5M2
 OJH++Jnlx0TXpD9XwIQftImyytOLfzdxzrvcBTgWCAtYEWEUKZ9pfoMFr3mvfFT6E8ky
 lhEwD5EXeKoiE9bey4DXI75nMzTR/b5Y2wGJkWdYnHiky0/Mi9L71GLymxXYtilUqEEO
 cDDw==
X-Gm-Message-State: APjAAAUGu+gqxnUAFzjK0meJNTCVsAHTSSMHM1Z3sIlkWW/UG8/5DxgA
 Wld9BybTd00UuaapzRMzvCzJ9JNryhzNTw==
X-Google-Smtp-Source: APXvYqzUNKaRc56QuEN1cr2a/IeISFYTT2uGkLmL76T+aWB8ckEAJPiPV+FZongUy3NUskWe+5OoZA==
X-Received: by 2002:a17:902:9a42:: with SMTP id
 x2mr41368359plv.194.1582339405423; 
 Fri, 21 Feb 2020 18:43:25 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:24 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/lima: save task info dump when task fail
Date: Sat, 22 Feb 2020 10:42:08 +0800
Message-Id: <20200222024210.18697-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
References: <20200222024210.18697-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Save all information to start a task which can be exported to user
for debug usage. Dump file data format is specified in lima_dump.h

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c |  13 +++
 drivers/gpu/drm/lima/lima_device.h |   8 ++
 drivers/gpu/drm/lima/lima_dump.h   |  77 +++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.c  | 128 +++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.h  |   7 ++
 5 files changed, 233 insertions(+)
 create mode 100644 drivers/gpu/drm/lima/lima_dump.h

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 19829b543024..42a00171fea5 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -344,6 +344,12 @@ int lima_device_init(struct lima_device *ldev)
 	if (err)
 		goto err_out5;
 
+	ldev->dump.magic = LIMA_DUMP_MAGIC;
+	ldev->dump.version_major = LIMA_DUMP_MAJOR;
+	ldev->dump.version_minor = LIMA_DUMP_MINOR;
+	INIT_LIST_HEAD(&ldev->error_task_list);
+	mutex_init(&ldev->error_task_list_lock);
+
 	dev_info(ldev->dev, "bus rate = %lu\n", clk_get_rate(ldev->clk_bus));
 	dev_info(ldev->dev, "mod rate = %lu", clk_get_rate(ldev->clk_gpu));
 
@@ -370,6 +376,13 @@ int lima_device_init(struct lima_device *ldev)
 void lima_device_fini(struct lima_device *ldev)
 {
 	int i;
+	struct lima_sched_error_task *et, *tmp;
+
+	list_for_each_entry_safe(et, tmp, &ldev->error_task_list, list) {
+		list_del(&et->list);
+		kvfree(et);
+	}
+	mutex_destroy(&ldev->error_task_list_lock);
 
 	lima_fini_pp_pipe(ldev);
 	lima_fini_gp_pipe(ldev);
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 31158d86271c..f17173f47f26 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -6,8 +6,11 @@
 
 #include <drm/drm_device.h>
 #include <linux/delay.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 
 #include "lima_sched.h"
+#include "lima_dump.h"
 
 enum lima_gpu_id {
 	lima_gpu_mali400 = 0,
@@ -94,6 +97,11 @@ struct lima_device {
 
 	u32 *dlbu_cpu;
 	dma_addr_t dlbu_dma;
+
+	/* debug info */
+	struct lima_dump_head dump;
+	struct list_head error_task_list;
+	struct mutex error_task_list_lock;
 };
 
 static inline struct lima_device *
diff --git a/drivers/gpu/drm/lima/lima_dump.h b/drivers/gpu/drm/lima/lima_dump.h
new file mode 100644
index 000000000000..ca243d99c51b
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_dump.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
+
+#ifndef __LIMA_DUMP_H__
+#define __LIMA_DUMP_H__
+
+#include <linux/types.h>
+
+/**
+ * dump file format for all the information to start a lima task
+ *
+ * top level format
+ * | magic code "LIMA" | format version | num tasks | data size |
+ * | reserved | reserved | reserved | reserved |
+ * | task 1 ID | task 1 size | num chunks | reserved | task 1 data |
+ * | task 2 ID | task 2 size | num chunks | reserved | task 2 data |
+ * ...
+ *
+ * task data format
+ * | chunk 1 ID | chunk 1 size | reserved | reserved | chunk 1 data |
+ * | chunk 2 ID | chunk 2 size | reserved | reserved | chunk 2 data |
+ * ...
+ *
+ */
+
+#define LIMA_DUMP_MAJOR 1
+#define LIMA_DUMP_MINOR 0
+
+#define LIMA_DUMP_MAGIC 0x414d494c
+
+struct lima_dump_head {
+	__u32 magic;
+	__u16 version_major;
+	__u16 version_minor;
+	__u32 num_tasks;
+	__u32 size;
+	__u32 reserved[4];
+};
+
+#define LIMA_DUMP_TASK_GP   0
+#define LIMA_DUMP_TASK_PP   1
+#define LIMA_DUMP_TASK_NUM  2
+
+struct lima_dump_task {
+	__u32 id;
+	__u32 size;
+	__u32 num_chunks;
+	__u32 reserved;
+};
+
+#define LIMA_DUMP_CHUNK_FRAME         0
+#define LIMA_DUMP_CHUNK_BUFFER        1
+#define LIMA_DUMP_CHUNK_PROCESS_NAME  2
+#define LIMA_DUMP_CHUNK_PROCESS_ID    3
+#define LIMA_DUMP_CHUNK_NUM           4
+
+struct lima_dump_chunk {
+	__u32 id;
+	__u32 size;
+	__u32 reserved[2];
+};
+
+struct lima_dump_chunk_buffer {
+	__u32 id;
+	__u32 size;
+	__u32 va;
+	__u32 reserved;
+};
+
+struct lima_dump_chunk_pid {
+	__u32 id;
+	__u32 size;
+	__u32 pid;
+	__u32 reserved;
+};
+
+#endif
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 3886999b4533..cd1bf3ad9bb5 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -256,6 +256,132 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	return task->fence;
 }
 
+static void lima_sched_build_error_task_list(struct lima_sched_task *task)
+{
+	struct lima_sched_error_task *et;
+	struct lima_sched_pipe *pipe = to_lima_pipe(task->base.sched);
+	struct lima_ip *ip = pipe->processor[0];
+	int pipe_id = ip->id == lima_ip_gp ? lima_pipe_gp : lima_pipe_pp;
+	struct lima_device *dev = ip->dev;
+	struct lima_sched_context *sched_ctx =
+		container_of(task->base.entity, struct lima_sched_context, base);
+	struct lima_ctx *ctx =
+		container_of(sched_ctx, struct lima_ctx, context[pipe_id]);
+	struct lima_dump_task *dt;
+	struct lima_dump_chunk *chunk;
+	struct lima_dump_chunk_pid *pid_chunk;
+	struct lima_dump_chunk_buffer *buffer_chunk;
+	uint32_t size, task_size, mem_size;
+	int i;
+
+	mutex_lock(&dev->error_task_list_lock);
+
+	if (dev->dump.num_tasks >= lima_max_error_tasks) {
+		dev_info(dev->dev, "fail to save task state: error task list is full\n");
+		goto out;
+	}
+
+	/* frame chunk */
+	size = sizeof(struct lima_dump_chunk) + pipe->frame_size;
+	/* process name chunk */
+	size += sizeof(struct lima_dump_chunk) + sizeof(ctx->pname);
+	/* pid chunk */
+	size += sizeof(struct lima_dump_chunk);
+	/* buffer chunks */
+	for (i = 0; i < task->num_bos; i++) {
+		struct lima_bo *bo = task->bos[i];
+
+		size += sizeof(struct lima_dump_chunk);
+		size += bo->heap_size ? bo->heap_size : lima_bo_size(bo);
+	}
+
+	task_size = size + sizeof(struct lima_dump_task);
+	mem_size = task_size + sizeof(*et);
+	et = kvmalloc(mem_size, GFP_KERNEL);
+	if (!et) {
+		dev_err(dev->dev, "fail to alloc task dump buffer of size %x\n",
+			mem_size);
+		goto out;
+	}
+
+	et->data = et + 1;
+	et->size = task_size;
+
+	dt = et->data;
+	memset(dt, 0, sizeof(*dt));
+	dt->id = pipe_id;
+	dt->size = size;
+
+	chunk = (struct lima_dump_chunk *)(dt + 1);
+	memset(chunk, 0, sizeof(*chunk));
+	chunk->id = LIMA_DUMP_CHUNK_FRAME;
+	chunk->size = pipe->frame_size;
+	memcpy(chunk + 1, task->frame, pipe->frame_size);
+	dt->num_chunks++;
+
+	chunk = (void *)(chunk + 1) + chunk->size;
+	memset(chunk, 0, sizeof(*chunk));
+	chunk->id = LIMA_DUMP_CHUNK_PROCESS_NAME;
+	chunk->size = sizeof(ctx->pname);
+	memcpy(chunk + 1, ctx->pname, sizeof(ctx->pname));
+	dt->num_chunks++;
+
+	pid_chunk = (void *)(chunk + 1) + chunk->size;
+	memset(pid_chunk, 0, sizeof(*pid_chunk));
+	pid_chunk->id = LIMA_DUMP_CHUNK_PROCESS_ID;
+	pid_chunk->pid = ctx->pid;
+	dt->num_chunks++;
+
+	buffer_chunk = (void *)(pid_chunk + 1) + pid_chunk->size;
+	for (i = 0; i < task->num_bos; i++) {
+		struct lima_bo *bo = task->bos[i];
+		void *data;
+
+		memset(buffer_chunk, 0, sizeof(*buffer_chunk));
+	        buffer_chunk->id = LIMA_DUMP_CHUNK_BUFFER;
+		buffer_chunk->va = lima_vm_get_va(task->vm, bo);
+
+		if (bo->heap_size) {
+			buffer_chunk->size = bo->heap_size;
+
+			data = vmap(bo->base.pages, bo->heap_size >> PAGE_SHIFT,
+				    VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+			if (!data) {
+				kvfree(et);
+				goto out;
+			}
+
+			memcpy(buffer_chunk + 1, data, buffer_chunk->size);
+
+			vunmap(data);
+		} else {
+			buffer_chunk->size = lima_bo_size(bo);
+
+			data = drm_gem_shmem_vmap(&bo->base.base);
+			if (IS_ERR_OR_NULL(data)) {
+				kvfree(et);
+				goto out;
+			}
+
+			memcpy(buffer_chunk + 1, data, buffer_chunk->size);
+
+			drm_gem_shmem_vunmap(&bo->base.base, data);
+		}
+
+		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
+		dt->num_chunks++;
+	}
+
+	list_add(&et->list, &dev->error_task_list);
+	dev->dump.size += et->size;
+	dev->dump.num_tasks++;
+
+	dev_info(dev->dev, "save error task state success\n");
+
+out:
+	mutex_unlock(&dev->error_task_list_lock);
+}
+
 static void lima_sched_timedout_job(struct drm_sched_job *job)
 {
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
@@ -268,6 +394,8 @@ static void lima_sched_timedout_job(struct drm_sched_job *job)
 
 	drm_sched_increase_karma(&task->base);
 
+	lima_sched_build_error_task_list(task);
+
 	pipe->task_error(pipe);
 
 	if (pipe->bcast_mmu)
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index d64393fb50a9..e29f5e3b675b 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -5,9 +5,16 @@
 #define __LIMA_SCHED_H__
 
 #include <drm/gpu_scheduler.h>
+#include <linux/list.h>
 
 struct lima_vm;
 
+struct lima_sched_error_task {
+	struct list_head list;
+	void *data;
+	uint32_t size;
+};
+
 struct lima_sched_task {
 	struct drm_sched_job base;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
