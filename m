Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBD2F12CF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C56C6E0D2;
	Mon, 11 Jan 2021 13:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84389FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L45XZ99aceTiZ5N23F5GN7F8EsWaF1zdk8FGgDcHtSE=; b=ZImufSLsMtG6wFxvMCAae4zp1D
 +CLNcS8oK/+uzAlMdp8atiPDagapm+YMU7/WfWTw05Jf1LbryvE0XRjGQfOwAe7hhdWsepXZQgRdH
 URM/LaBSIxygfVENB57D0ktdKovp7M2GaPXq7GjW6oreFJMPpMAl7loqHpuL3mxwtWKPMiZIyuzwT
 9fvF7K97hcaYlKTrGHOlF2q8dmR7oLxGqnVZojclBxy6xdl65874DQVnr2ErxnLQW8Yj4S7vR9d4X
 hfEhkAingQ53moKvW0MU3D22xkjByBSC8MPdN/I88L6GqW89R8b4eCfpWnOfmE+YNEz9CE/GTGfWW
 +V4HYSyA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo7-0002tl-PT; Mon, 11 Jan 2021 15:00:27 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 20/21] drm/tegra: Implement job submission part of new UAPI
Date: Mon, 11 Jan 2021 15:00:18 +0200
Message-Id: <20210111130019.3515669-21-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the job submission IOCTL with a minimum feature set.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Add 16K size limit to copies from userspace.
* Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
  to prevent oversized shift on 32-bit platforms.
v4:
* Remove all features that are not strictly necessary.
* Split into two patches.
v3:
* Remove WRITE_RELOC. Relocations are now patched implicitly
  when patching is needed.
* Directly call PM runtime APIs on devices instead of using
  power_on/power_off callbacks.
* Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
* Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
* Accommodate for removal of timeout field and inlining of
  syncpt_incrs array.
* Copy entire user arrays at a time instead of going through
  elements one-by-one.
* Implement waiting of DMA reservations.
* Split out gather_bo implementation into a separate file.
* Fix length parameter passed to sg_init_one in gather_bo
* Cosmetic cleanup.
---
 drivers/gpu/drm/tegra/Makefile         |   2 +
 drivers/gpu/drm/tegra/drm.c            |   2 +
 drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
 drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
 drivers/gpu/drm/tegra/uapi/submit.c    | 428 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
 6 files changed, 557 insertions(+)
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 0abdb21b38b9..059322e88943 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 tegra-drm-y := \
 	drm.o \
 	uapi/uapi.o \
+	uapi/submit.o \
+	uapi/gather_bo.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6a51035ce33f..60eab403ae9b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -737,6 +737,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
+			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm/tegra/uapi/gather_bo.c
new file mode 100644
index 000000000000..b487a0d44648
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
@@ -0,0 +1,86 @@
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
+	if (phys) {
+		*phys = virt_to_phys(bo->gather_data);
+		return NULL;
+	}
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
diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm/tegra/uapi/gather_bo.h
new file mode 100644
index 000000000000..6b4c9d83ac91
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
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
diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/uapi/submit.c
new file mode 100644
index 000000000000..398be3065e21
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/submit.c
@@ -0,0 +1,428 @@
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
+
+#include "../uapi.h"
+#include "../drm.h"
+#include "../gem.h"
+
+#include "gather_bo.h"
+#include "submit.h"
+
+static struct tegra_drm_mapping *
+tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
+{
+	struct tegra_drm_mapping *mapping;
+
+	xa_lock(&ctx->mappings);
+	mapping = xa_load(&ctx->mappings, id);
+	if (mapping)
+		kref_get(&mapping->ref);
+	xa_unlock(&ctx->mappings);
+
+	return mapping;
+}
+
+static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
+{
+	unsigned long copy_err;
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
+	copy_err = copy_from_user(data, from, copy_len);
+	if (copy_err) {
+		kvfree(data);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return data;
+}
+
+static int submit_copy_gather_data(struct drm_device *drm,
+				   struct gather_bo **pbo,
+				   struct drm_tegra_channel_submit *args)
+{
+	unsigned long copy_err;
+	struct gather_bo *bo;
+	size_t copy_len;
+
+	if (args->gather_data_words == 0) {
+		drm_info(drm, "gather_data_words can't be 0");
+		return -EINVAL;
+	}
+
+	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &copy_len))
+		return -EINVAL;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return -ENOMEM;
+
+	kref_init(&bo->ref);
+	host1x_bo_init(&bo->base, &gather_bo_ops);
+
+	bo->gather_data = kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
+	if (!bo->gather_data) {
+		kfree(bo);
+		return -ENOMEM;
+	}
+
+	copy_err = copy_from_user(bo->gather_data,
+				  u64_to_user_ptr(args->gather_data_ptr),
+				  copy_len);
+	if (copy_err) {
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
+static int submit_write_reloc(struct gather_bo *bo,
+			      struct drm_tegra_submit_buf *buf,
+			      struct tegra_drm_mapping *mapping)
+{
+	/* TODO check that target_offset is within bounds */
+	dma_addr_t iova = mapping->iova + buf->reloc.target_offset;
+	u32 written_ptr = (u32)(iova >> buf->reloc.shift);
+
+#ifdef CONFIG_ARM64
+	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
+		written_ptr |= BIT(39);
+#endif
+
+	if (buf->reloc.gather_offset_words >= bo->gather_data_words)
+		return -EINVAL;
+
+	buf->reloc.gather_offset_words = array_index_nospec(
+		buf->reloc.gather_offset_words, bo->gather_data_words);
+
+	bo->gather_data[buf->reloc.gather_offset_words] = written_ptr;
+
+	return 0;
+}
+
+static int submit_process_bufs(struct drm_device *drm, struct gather_bo *bo,
+			       struct tegra_drm_submit_data *job_data,
+			       struct tegra_drm_channel_ctx *ctx,
+			       struct drm_tegra_channel_submit *args)
+{
+	struct tegra_drm_used_mapping *mappings;
+	struct drm_tegra_submit_buf *bufs;
+	int err;
+	u32 i;
+
+	bufs = alloc_copy_user_array(u64_to_user_ptr(args->bufs_ptr),
+				     args->num_bufs, sizeof(*bufs));
+	if (IS_ERR(bufs))
+		return PTR_ERR(bufs);
+
+	mappings = kcalloc(args->num_bufs, sizeof(*mappings), GFP_KERNEL);
+	if (!mappings) {
+		err = -ENOMEM;
+		goto done;
+	}
+
+	for (i = 0; i < args->num_bufs; i++) {
+		struct drm_tegra_submit_buf *buf = &bufs[i];
+		struct tegra_drm_mapping *mapping;
+
+		if (buf->flags & ~DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR) {
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		mapping = tegra_drm_mapping_get(ctx, buf->mapping_id);
+		if (!mapping) {
+			drm_info(drm, "invalid mapping_id for buf: %u",
+				 buf->mapping_id);
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		err = submit_write_reloc(bo, buf, mapping);
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
+	for (;;) {
+		if (i-- == 0)
+			break;
+
+		tegra_drm_mapping_put(mappings[i].mapping);
+	}
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
+static int submit_get_syncpt(struct drm_device *drm, struct host1x_job *job,
+			     struct drm_tegra_channel_submit *args)
+{
+	struct host1x_syncpt *sp;
+
+	if (args->syncpt_incr.flags)
+		return -EINVAL;
+
+	/* Syncpt ref will be dropped on job release */
+	sp = host1x_syncpt_fd_get(args->syncpt_incr.syncpt_fd);
+	if (IS_ERR(sp))
+		return PTR_ERR(sp);
+
+	job->syncpt = sp;
+	job->syncpt_incrs = args->syncpt_incr.num_incrs;
+
+	return 0;
+}
+
+static int submit_job_add_gather(struct host1x_job *job,
+				 struct tegra_drm_channel_ctx *ctx,
+				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
+				 struct gather_bo *bo, u32 *offset,
+				 struct tegra_drm_submit_data *job_data)
+{
+	u32 next_offset;
+
+	if (cmd->reserved[0] || cmd->reserved[1] || cmd->reserved[2])
+		return -EINVAL;
+
+	/* Check for maximum gather size */
+	if (cmd->words > 16383)
+		return -EINVAL;
+
+	if (check_add_overflow(*offset, cmd->words, &next_offset))
+		return -EINVAL;
+
+	if (next_offset > bo->gather_data_words)
+		return -EINVAL;
+
+	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
+
+	*offset = next_offset;
+
+	return 0;
+}
+
+static int submit_create_job(struct drm_device *drm, struct host1x_job **pjob,
+			     struct gather_bo *bo,
+			     struct tegra_drm_channel_ctx *ctx,
+			     struct drm_tegra_channel_submit *args,
+			     struct tegra_drm_submit_data *job_data)
+{
+	struct drm_tegra_submit_cmd *cmds;
+	u32 i, gather_offset = 0;
+	struct host1x_job *job;
+	int err;
+
+	cmds = alloc_copy_user_array(u64_to_user_ptr(args->cmds_ptr),
+				     args->num_cmds, sizeof(*cmds));
+	if (IS_ERR(cmds))
+		return PTR_ERR(cmds);
+
+	job = host1x_job_alloc(ctx->channel, args->num_cmds, 0);
+	if (!job) {
+		err = -ENOMEM;
+		goto done;
+	}
+
+	err = submit_get_syncpt(drm, job, args);
+	if (err < 0)
+		goto free_job;
+
+	job->client = &ctx->client->base;
+	job->class = ctx->client->base.class;
+	job->serialize = true;
+
+	for (i = 0; i < args->num_cmds; i++) {
+		struct drm_tegra_submit_cmd *cmd = &cmds[i];
+
+		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
+			err = submit_job_add_gather(job, ctx, &cmd->gather_uptr,
+						    bo, &gather_offset,
+						    job_data);
+			if (err)
+				goto free_job;
+		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
+			if (cmd->wait_syncpt.reserved[0] ||
+			    cmd->wait_syncpt.reserved[1]) {
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			host1x_job_add_wait(job, cmd->wait_syncpt.id,
+					    cmd->wait_syncpt.threshold);
+		} else {
+			err = -EINVAL;
+			goto free_job;
+		}
+	}
+
+	if (gather_offset == 0) {
+		drm_info(drm, "Job must have at least one gather");
+		err = -EINVAL;
+		goto free_job;
+	}
+
+	*pjob = job;
+
+	err = 0;
+	goto done;
+
+free_job:
+	host1x_job_put(job);
+
+done:
+	kvfree(cmds);
+
+	return err;
+}
+
+static void release_job(struct host1x_job *job)
+{
+	struct tegra_drm_client *client =
+		container_of(job->client, struct tegra_drm_client, base);
+	struct tegra_drm_submit_data *job_data = job->user_data;
+	u32 i;
+
+	for (i = 0; i < job_data->num_used_mappings; i++)
+		tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+
+	kfree(job_data->used_mappings);
+	kfree(job_data);
+
+	pm_runtime_put_autosuspend(client->base.dev);
+}
+
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_submit *args = data;
+	struct tegra_drm_submit_data *job_data;
+	struct tegra_drm_channel_ctx *ctx;
+	struct host1x_job *job;
+	struct gather_bo *bo;
+	u32 i;
+	int err;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	/* Allocate gather BO and copy gather words in. */
+	err = submit_copy_gather_data(drm, &bo, args);
+	if (err)
+		goto unlock;
+
+	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
+	if (!job_data) {
+		err = -ENOMEM;
+		goto put_bo;
+	}
+
+	/* Get data buffer mappings and do relocation patching. */
+	err = submit_process_bufs(drm, bo, job_data, ctx, args);
+	if (err)
+		goto free_job_data;
+
+	/* Allocate host1x_job and add gathers and waits to it. */
+	err = submit_create_job(drm, &job, bo, ctx, args,
+				job_data);
+	if (err)
+		goto free_job_data;
+
+	/* Map gather data for Host1x. */
+	err = host1x_job_pin(job, ctx->client->base.dev);
+	if (err)
+		goto put_job;
+
+	/* Boot engine. */
+	err = pm_runtime_get_sync(ctx->client->base.dev);
+	if (err < 0)
+		goto put_pm_runtime;
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
+	if (err)
+		goto put_job;
+
+	/* Return postfences to userspace and add fences to DMA reservations. */
+	args->syncpt_incr.fence_value = job->syncpt_end;
+
+	goto put_job;
+
+put_pm_runtime:
+	if (!job->release)
+		pm_runtime_put(ctx->client->base.dev);
+	host1x_job_unpin(job);
+put_job:
+	host1x_job_put(job);
+free_job_data:
+	if (job_data && job_data->used_mappings) {
+		for (i = 0; i < job_data->num_used_mappings; i++)
+			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+		kfree(job_data->used_mappings);
+	}
+	if (job_data)
+		kfree(job_data);
+put_bo:
+	gather_bo_put(&bo->base);
+unlock:
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
diff --git a/drivers/gpu/drm/tegra/uapi/submit.h b/drivers/gpu/drm/tegra/uapi/submit.h
new file mode 100644
index 000000000000..0a165e9e4bda
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/submit.h
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
