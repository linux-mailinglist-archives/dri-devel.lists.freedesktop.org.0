Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9303C29AF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5A6EA71;
	Fri,  9 Jul 2021 19:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C776EA73
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so6948106wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/CQ3Y84vBWk9hYr6q0rTSMwSq3Rh7cgxgqd+VyRI3+4=;
 b=YS2BBhSmD313F0I0iD/BtkPXhLY6+a/gV0ow9O7DtzVvFqIaVorXMJR9PPLa2lCxEb
 +uT+nYLk0WQNh8maP2iNWq+JZdwD5q6o7DZaZ2HE9dFn3djhmsj+gf3NrvwCNzw4gGHW
 LMXWkSMyAyYfmDFDi/H0MxSxFhhgmC+D2tMplG8C/0JAG4bjRD9wrDOTvvvwAtiV/e3r
 SKZOoIJLiPvT1tfBb0iet/gnZCqBiZ4wNxHMjjn0hMrGgqX2jA/j3Q0Ak12ZwxZZC0ER
 jAOctMKrv8Bb8R277E5WImtxuZfbroxMnX7b28OZpm918yOggSfe6dzb/Dc3K05U3qMV
 /Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/CQ3Y84vBWk9hYr6q0rTSMwSq3Rh7cgxgqd+VyRI3+4=;
 b=WL93BJoHuKw2aysxsu3iq0tQxH0LzcH9jBFx9bDQP7wh6IZh3O0enkozm6YhVN9+o4
 fT3xJlyZhfIUlxUBmiqwpuOIXoEJ8ohChbnqeJaNCSroy+vNv4uH49UiynhiBgDHE0f3
 /7QOpZakYxoJ/XiFfHhQ+W5GCKxlL+3WacZU0fn77ZH5HeVPqVXJOb3zyhdUKxzCQd4I
 YL+iEJoO9fM/fFabQNNxE57FIWrhLuSZJ4lHf8gY9iRkTrzBwFpMZJkBoflMQaLut5pa
 kvmjehyxU65fc8gaEAjIx1gIHx8KY4/iuBfmI2m/TF78YPe/UNQliaLnWVd/ZTRaJqyo
 H5vw==
X-Gm-Message-State: AOAM533cQVfiW1w09EDMnKILEbl+7GyZc7j07pZNTUmTHwM75U7Vlm0e
 m2NFjQB4Q1L4EaESGK6jeEM=
X-Google-Smtp-Source: ABdhPJxo+oHvmnVb+UZNxIKX77Qko1gpIjRPJPpojlQ8TKVkm+QavhlCLVxQ7XsCjjv+g8lkg3RLmA==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr521669wmp.79.1625858981115; 
 Fri, 09 Jul 2021 12:29:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id s13sm2032391wrm.13.2021.07.09.12.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 12/14] drm/tegra: Implement job submission part of new UAPI
Date: Fri,  9 Jul 2021 21:31:44 +0200
Message-Id: <20210709193146.2859516-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement the job submission IOCTL with a minimum feature set.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- rebased on top of latest UABI changes

 drivers/gpu/drm/tegra/Makefile    |   2 +
 drivers/gpu/drm/tegra/drm.c       |   4 +-
 drivers/gpu/drm/tegra/gather_bo.c |  81 +++++
 drivers/gpu/drm/tegra/gather_bo.h |  22 ++
 drivers/gpu/drm/tegra/submit.c    | 521 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h    |  17 +
 6 files changed, 646 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 783475ffd943..ab4289d1c991 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 tegra-drm-y := \
 	drm.o \
 	uapi.o \
+	submit.o \
+	gather_bo.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 082d520bdffc..ae9dafc32c2b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -728,6 +728,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_ALLOCATE, tegra_drm_ioctl_syncpoint_allocate,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
@@ -852,7 +854,7 @@ static void tegra_debugfs_init(struct drm_minor *minor)
 
 static const struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM |
-			   DRIVER_ATOMIC | DRIVER_RENDER,
+			   DRIVER_ATOMIC | DRIVER_RENDER | DRIVER_SYNCOBJ,
 	.open = tegra_drm_open,
 	.postclose = tegra_drm_postclose,
 	.lastclose = drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/tegra/gather_bo.c b/drivers/gpu/drm/tegra/gather_bo.c
new file mode 100644
index 000000000000..755c2da62361
--- /dev/null
+++ b/drivers/gpu/drm/tegra/gather_bo.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+
+#include "gather_bo.h"
+
+static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	kref_get(&bo->ref);
+
+	return host_bo;
+}
+
+static void gather_bo_release(struct kref *ref)
+{
+	struct gather_bo *bo = container_of(ref, struct gather_bo, ref);
+
+	kfree(bo->gather_data);
+	kfree(bo);
+}
+
+void gather_bo_put(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	kref_put(&bo->ref, gather_bo_release);
+}
+
+static struct sg_table *
+gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t *phys)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+	struct sg_table *sgt;
+	int err;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	err = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (err) {
+		kfree(sgt);
+		return ERR_PTR(err);
+	}
+
+	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
+
+	return sgt;
+}
+
+static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
+{
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
+}
+
+static void *gather_bo_mmap(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	return bo->gather_data;
+}
+
+static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
+{
+}
+
+const struct host1x_bo_ops gather_bo_ops = {
+	.get = gather_bo_get,
+	.put = gather_bo_put,
+	.pin = gather_bo_pin,
+	.unpin = gather_bo_unpin,
+	.mmap = gather_bo_mmap,
+	.munmap = gather_bo_munmap,
+};
diff --git a/drivers/gpu/drm/tegra/gather_bo.h b/drivers/gpu/drm/tegra/gather_bo.h
new file mode 100644
index 000000000000..6b4c9d83ac91
--- /dev/null
+++ b/drivers/gpu/drm/tegra/gather_bo.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
+#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
+
+#include <linux/host1x.h>
+#include <linux/kref.h>
+
+struct gather_bo {
+	struct host1x_bo base;
+
+	struct kref ref;
+
+	u32 *gather_data;
+	size_t gather_data_words;
+};
+
+extern const struct host1x_bo_ops gather_bo_ops;
+void gather_bo_put(struct host1x_bo *host_bo);
+
+#endif
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
new file mode 100644
index 000000000000..0225706e3163
--- /dev/null
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -0,0 +1,521 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/dma-fence-array.h>
+#include <linux/file.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/nospec.h>
+#include <linux/pm_runtime.h>
+#include <linux/sync_file.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_syncobj.h>
+
+#include "drm.h"
+#include "gather_bo.h"
+#include "gem.h"
+#include "submit.h"
+#include "uapi.h"
+
+#define SUBMIT_ERR(context, fmt, ...) \
+	dev_err_ratelimited(context->client->base.dev, \
+		"%s: job submission failed: " fmt "\n", \
+		current->comm __VA_OPT__(,) __VA_ARGS__)
+
+static struct tegra_drm_mapping *
+tegra_drm_mapping_get(struct tegra_drm_context *context, u32 id)
+{
+	struct tegra_drm_mapping *mapping;
+
+	xa_lock(&context->mappings);
+	mapping = xa_load(&context->mappings, id);
+	if (mapping)
+		kref_get(&mapping->ref);
+	xa_unlock(&context->mappings);
+
+	return mapping;
+}
+
+static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
+{
+	size_t copy_len;
+	void *data;
+
+	if (check_mul_overflow(count, size, &copy_len))
+		return ERR_PTR(-EINVAL);
+
+	if (copy_len > 0x4000)
+		return ERR_PTR(-E2BIG);
+
+	data = kvmalloc(copy_len, GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(data, from, copy_len)) {
+		kvfree(data);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return data;
+}
+
+static int submit_copy_gather_data(struct gather_bo **pbo, struct tegra_drm_context *context,
+				   struct drm_tegra_channel_submit *args)
+{
+	struct gather_bo *bo;
+	size_t copy_len;
+
+	if (args->gather_data_words == 0) {
+		SUBMIT_ERR(context, "gather_data_words cannot be zero");
+		return -EINVAL;
+	}
+
+	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &copy_len)) {
+		SUBMIT_ERR(context, "gather_data_words is too large");
+		return -EINVAL;
+	}
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo) {
+		SUBMIT_ERR(context, "failed to allocate memory for bo info");
+		return -ENOMEM;
+	}
+
+	kref_init(&bo->ref);
+	host1x_bo_init(&bo->base, &gather_bo_ops);
+
+	bo->gather_data = kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
+	if (!bo->gather_data) {
+		SUBMIT_ERR(context, "failed to allocate memory for gather data");
+		kfree(bo);
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(bo->gather_data, u64_to_user_ptr(args->gather_data_ptr), copy_len)) {
+		SUBMIT_ERR(context, "failed to copy gather data from userspace");
+		kfree(bo->gather_data);
+		kfree(bo);
+		return -EFAULT;
+	}
+
+	bo->gather_data_words = args->gather_data_words;
+
+	*pbo = bo;
+
+	return 0;
+}
+
+static int submit_write_reloc(struct tegra_drm_context *context, struct gather_bo *bo,
+			      struct drm_tegra_submit_buf *buf, struct tegra_drm_mapping *mapping)
+{
+	/* TODO check that target_offset is within bounds */
+	dma_addr_t iova = mapping->iova + buf->reloc.target_offset;
+	u32 written_ptr;
+
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	if (buf->flags & DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT)
+		iova |= BIT_ULL(39);
+#endif
+
+	written_ptr = iova >> buf->reloc.shift;
+
+	if (buf->reloc.gather_offset_words >= bo->gather_data_words) {
+		SUBMIT_ERR(context, "relocation has too large gather offset (%u vs gather length %zu)",
+			   buf->reloc.gather_offset_words, bo->gather_data_words);
+		return -EINVAL;
+	}
+
+	buf->reloc.gather_offset_words = array_index_nospec(buf->reloc.gather_offset_words,
+							    bo->gather_data_words);
+
+	bo->gather_data[buf->reloc.gather_offset_words] = written_ptr;
+
+	return 0;
+}
+
+static int submit_process_bufs(struct tegra_drm_context *context, struct gather_bo *bo,
+			       struct drm_tegra_channel_submit *args,
+			       struct tegra_drm_submit_data *job_data)
+{
+	struct tegra_drm_used_mapping *mappings;
+	struct drm_tegra_submit_buf *bufs;
+	int err;
+	u32 i;
+
+	bufs = alloc_copy_user_array(u64_to_user_ptr(args->bufs_ptr), args->num_bufs,
+				     sizeof(*bufs));
+	if (IS_ERR(bufs)) {
+		SUBMIT_ERR(context, "failed to copy bufs array from userspace");
+		return PTR_ERR(bufs);
+	}
+
+	mappings = kcalloc(args->num_bufs, sizeof(*mappings), GFP_KERNEL);
+	if (!mappings) {
+		SUBMIT_ERR(context, "failed to allocate memory for mapping info");
+		err = -ENOMEM;
+		goto done;
+	}
+
+	for (i = 0; i < args->num_bufs; i++) {
+		struct drm_tegra_submit_buf *buf = &bufs[i];
+		struct tegra_drm_mapping *mapping;
+
+		if (buf->flags & ~DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT) {
+			SUBMIT_ERR(context, "invalid flag specified for buf");
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		mapping = tegra_drm_mapping_get(context, buf->mapping);
+		if (!mapping) {
+			SUBMIT_ERR(context, "invalid mapping ID '%u' for buffer", buf->mapping);
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		err = submit_write_reloc(context, bo, buf, mapping);
+		if (err) {
+			tegra_drm_mapping_put(mapping);
+			goto drop_refs;
+		}
+
+		mappings[i].mapping = mapping;
+		mappings[i].flags = buf->flags;
+	}
+
+	job_data->used_mappings = mappings;
+	job_data->num_used_mappings = i;
+
+	err = 0;
+
+	goto done;
+
+drop_refs:
+	while (i--)
+		tegra_drm_mapping_put(mappings[i].mapping);
+
+	kfree(mappings);
+	job_data->used_mappings = NULL;
+
+done:
+	kvfree(bufs);
+
+	return err;
+}
+
+static int submit_get_syncpt(struct tegra_drm_context *context, struct host1x_job *job,
+			     struct xarray *syncpoints, struct drm_tegra_channel_submit *args)
+{
+	struct host1x_syncpt *sp;
+
+	if (args->syncpt.flags) {
+		SUBMIT_ERR(context, "invalid flag specified for syncpt");
+		return -EINVAL;
+	}
+
+	/* Syncpt ref will be dropped on job release */
+	sp = xa_load(syncpoints, args->syncpt.id);
+	if (!sp) {
+		SUBMIT_ERR(context, "syncpoint specified in syncpt was not allocated");
+		return -EINVAL;
+	}
+
+	job->syncpt = host1x_syncpt_get(sp);
+	job->syncpt_incrs = args->syncpt.increments;
+
+	return 0;
+}
+
+static int submit_job_add_gather(struct host1x_job *job, struct tegra_drm_context *context,
+				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
+				 struct gather_bo *bo, u32 *offset,
+				 struct tegra_drm_submit_data *job_data)
+{
+	u32 next_offset;
+
+	if (cmd->reserved[0] || cmd->reserved[1] || cmd->reserved[2]) {
+		SUBMIT_ERR(context, "non-zero reserved field in GATHER_UPTR command");
+		return -EINVAL;
+	}
+
+	/* Check for maximum gather size */
+	if (cmd->words > 16383) {
+		SUBMIT_ERR(context, "too many words in GATHER_UPTR command");
+		return -EINVAL;
+	}
+
+	if (check_add_overflow(*offset, cmd->words, &next_offset)) {
+		SUBMIT_ERR(context, "too many total words in job");
+		return -EINVAL;
+	}
+
+	if (next_offset > bo->gather_data_words) {
+		SUBMIT_ERR(context, "GATHER_UPTR command overflows gather data");
+		return -EINVAL;
+	}
+
+	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
+
+	*offset = next_offset;
+
+	return 0;
+}
+
+static struct host1x_job *
+submit_create_job(struct tegra_drm_context *context, struct gather_bo *bo,
+		  struct drm_tegra_channel_submit *args, struct tegra_drm_submit_data *job_data,
+		  struct xarray *syncpoints)
+{
+	struct drm_tegra_submit_cmd *cmds;
+	u32 i, gather_offset = 0, class;
+	struct host1x_job *job;
+	int err;
+
+	/* Set initial class for firewall. */
+	class = context->client->base.class;
+
+	cmds = alloc_copy_user_array(u64_to_user_ptr(args->cmds_ptr), args->num_cmds,
+				     sizeof(*cmds));
+	if (IS_ERR(cmds)) {
+		SUBMIT_ERR(context, "failed to copy cmds array from userspace");
+		return ERR_CAST(cmds);
+	}
+
+	job = host1x_job_alloc(context->channel, args->num_cmds, 0);
+	if (!job) {
+		SUBMIT_ERR(context, "failed to allocate memory for job");
+		job = ERR_PTR(-ENOMEM);
+		goto done;
+	}
+
+	err = submit_get_syncpt(context, job, syncpoints, args);
+	if (err < 0)
+		goto free_job;
+
+	job->client = &context->client->base;
+	job->class = context->client->base.class;
+	job->serialize = true;
+
+	for (i = 0; i < args->num_cmds; i++) {
+		struct drm_tegra_submit_cmd *cmd = &cmds[i];
+
+		if (cmd->flags) {
+			SUBMIT_ERR(context, "unknown flags given for cmd");
+			err = -EINVAL;
+			goto free_job;
+		}
+
+		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
+			err = submit_job_add_gather(job, context, &cmd->gather_uptr, bo,
+						    &gather_offset, job_data);
+			if (err)
+				goto free_job;
+		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
+			if (cmd->wait_syncpt.reserved[0] || cmd->wait_syncpt.reserved[1]) {
+				SUBMIT_ERR(context, "non-zero reserved value");
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			host1x_job_add_wait(job, cmd->wait_syncpt.id, cmd->wait_syncpt.value,
+					    false, class);
+		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE) {
+			if (cmd->wait_syncpt.reserved[0] || cmd->wait_syncpt.reserved[1]) {
+				SUBMIT_ERR(context, "non-zero reserved value");
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			if (cmd->wait_syncpt.id != args->syncpt.id) {
+				SUBMIT_ERR(context, "syncpoint ID in CMD_WAIT_SYNCPT_RELATIVE is not used by the job");
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			host1x_job_add_wait(job, cmd->wait_syncpt.id, cmd->wait_syncpt.value,
+					    true, class);
+		} else {
+			SUBMIT_ERR(context, "unknown cmd type");
+			err = -EINVAL;
+			goto free_job;
+		}
+	}
+
+	if (gather_offset == 0) {
+		SUBMIT_ERR(context, "job must have at least one gather");
+		err = -EINVAL;
+		goto free_job;
+	}
+
+	goto done;
+
+free_job:
+	host1x_job_put(job);
+	job = ERR_PTR(err);
+
+done:
+	kvfree(cmds);
+
+	return job;
+}
+
+static void release_job(struct host1x_job *job)
+{
+	struct tegra_drm_client *client = container_of(job->client, struct tegra_drm_client, base);
+	struct tegra_drm_submit_data *job_data = job->user_data;
+	u32 i;
+
+	for (i = 0; i < job_data->num_used_mappings; i++)
+		tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+
+	kfree(job_data->used_mappings);
+	kfree(job_data);
+
+	if (pm_runtime_enabled(client->base.dev))
+		pm_runtime_put_autosuspend(client->base.dev);
+}
+
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_submit *args = data;
+	struct tegra_drm_submit_data *job_data;
+	struct drm_syncobj *syncobj = NULL;
+	struct tegra_drm_context *context;
+	struct host1x_job *job;
+	struct gather_bo *bo;
+	u32 i;
+	int err;
+
+	mutex_lock(&fpriv->lock);
+
+	context = xa_load(&fpriv->contexts, args->context);
+	if (!context) {
+		mutex_unlock(&fpriv->lock);
+		pr_err_ratelimited("%s: %s: invalid channel context '%#x'", __func__,
+				   current->comm, args->context);
+		return -EINVAL;
+	}
+
+	if (args->syncobj_in) {
+		struct dma_fence *fence;
+
+		err = drm_syncobj_find_fence(file, args->syncobj_in, 0, 0, &fence);
+		if (err) {
+			SUBMIT_ERR(context, "invalid syncobj_in '%#x'", args->syncobj_in);
+			goto unlock;
+		}
+
+		err = dma_fence_wait_timeout(fence, true, msecs_to_jiffies(10000));
+		dma_fence_put(fence);
+		if (err) {
+			SUBMIT_ERR(context, "wait for syncobj_in timed out");
+			goto unlock;
+		}
+	}
+
+	if (args->syncobj_out) {
+		syncobj = drm_syncobj_find(file, args->syncobj_out);
+		if (!syncobj) {
+			SUBMIT_ERR(context, "invalid syncobj_out '%#x'", args->syncobj_out);
+			err = -ENOENT;
+			goto unlock;
+		}
+	}
+
+	/* Allocate gather BO and copy gather words in. */
+	err = submit_copy_gather_data(&bo, context, args);
+	if (err)
+		goto unlock;
+
+	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
+	if (!job_data) {
+		SUBMIT_ERR(context, "failed to allocate memory for job data");
+		err = -ENOMEM;
+		goto put_bo;
+	}
+
+	/* Get data buffer mappings and do relocation patching. */
+	err = submit_process_bufs(context, bo, args, job_data);
+	if (err)
+		goto free_job_data;
+
+	/* Allocate host1x_job and add gathers and waits to it. */
+	job = submit_create_job(context, bo, args, job_data, &fpriv->syncpoints);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto free_job_data;
+	}
+
+	/* Map gather data for Host1x. */
+	err = host1x_job_pin(job, context->client->base.dev);
+	if (err)
+		goto put_job;
+
+	/* Boot engine. */
+	if (pm_runtime_enabled(context->client->base.dev)) {
+		err = pm_runtime_resume_and_get(context->client->base.dev);
+		if (err < 0) {
+			SUBMIT_ERR(context, "could not power up engine: %d", err);
+			goto unpin_job;
+		}
+	}
+
+	job->user_data = job_data;
+	job->release = release_job;
+	job->timeout = 10000;
+
+	/*
+	 * job_data is now part of job reference counting, so don't release
+	 * it from here.
+	 */
+	job_data = NULL;
+
+	/* Submit job to hardware. */
+	err = host1x_job_submit(job);
+	if (err) {
+		SUBMIT_ERR(context, "host1x job submission failed: %d", err);
+		goto unpin_job;
+	}
+
+	/* Return postfences to userspace and add fences to DMA reservations. */
+	args->syncpt.value = job->syncpt_end;
+
+	if (syncobj) {
+		struct dma_fence *fence = host1x_fence_create(job->syncpt, job->syncpt_end);
+		if (IS_ERR(fence))
+			err = PTR_ERR(fence);
+
+		drm_syncobj_replace_fence(syncobj, fence);
+	}
+
+	goto put_job;
+
+unpin_job:
+	host1x_job_unpin(job);
+put_job:
+	host1x_job_put(job);
+free_job_data:
+	if (job_data && job_data->used_mappings) {
+		for (i = 0; i < job_data->num_used_mappings; i++)
+			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+
+		kfree(job_data->used_mappings);
+	}
+
+	if (job_data)
+		kfree(job_data);
+put_bo:
+	gather_bo_put(&bo->base);
+unlock:
+	if (syncobj)
+		drm_syncobj_put(syncobj);
+
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
diff --git a/drivers/gpu/drm/tegra/submit.h b/drivers/gpu/drm/tegra/submit.h
new file mode 100644
index 000000000000..0a165e9e4bda
--- /dev/null
+++ b/drivers/gpu/drm/tegra/submit.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_UAPI_SUBMIT_H
+#define _TEGRA_DRM_UAPI_SUBMIT_H
+
+struct tegra_drm_used_mapping {
+	struct tegra_drm_mapping *mapping;
+	u32 flags;
+};
+
+struct tegra_drm_submit_data {
+	struct tegra_drm_used_mapping *used_mappings;
+	u32 num_used_mappings;
+};
+
+#endif
-- 
2.32.0

