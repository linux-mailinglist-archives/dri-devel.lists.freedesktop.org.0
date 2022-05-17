Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B852A980
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 19:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC811135DB;
	Tue, 17 May 2022 17:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BABE1135DA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 17:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alarumbe) with ESMTPSA id D16301F449BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652809347;
 bh=PC+tgi9hNx+3tSb8Epr+N5YHLify5TxYVtE12rbH5dU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ooO9I842WhiX4MEKBrgR6y25ly9AxO+WMFo8zPcbcCmsppE2LnaVJUfWFsT00ct5F
 9S69cwgix+y3Ougs3Wo6o5H5nMvy/VjnS74xsVDk83Th5kTjP6vi1OgwcUU0/BpqnV
 2ATV4tqV8UmqN74S69TE8JU33anmriEC61FwsihpgVuBCWwyXq952umy0iP246Wg0y
 2n8LXW4pAilxkhusaJBqzm5xJREnTl8XMIWiONjyanR7RT7hYIcHnWNyh8coH/ge8y
 2X1c3SVNMBtC+L4cv+KqVAKvv+j1YN6NJ5ZNrz7x4fWlXpOn5otzlGfMbFVcOVHdwB
 RlQk7XiGoG9mw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/panfrost: Add support for devcoredump
Date: Tue, 17 May 2022 18:42:16 +0100
Message-Id: <20220517174216.381287-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517174216.381287-1-adrian.larumbe@collabora.com>
References: <20220517174216.381287-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the event of a job timeout, debug dump information will be written into
/sys/class/devcoredump.

Inspired by etnaviv's similar feature.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 198 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 include/uapi/drm/panfrost_drm.h          |  32 ++++
 6 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index 86cdc0ce79e6..079600328be1 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -11,6 +11,7 @@ config DRM_PANFROST
 	select DRM_GEM_SHMEM_HELPER
 	select PM_DEVFREQ
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select WANT_DEV_COREDUMP
 	help
 	  DRM driver for ARM Mali Midgard (T6xx, T7xx, T8xx) and
 	  Bifrost (G3x, G5x, G7x) GPUs.
diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index b71935862417..7da2b3f02ed9 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -9,6 +9,7 @@ panfrost-y := \
 	panfrost_gpu.o \
 	panfrost_job.o \
 	panfrost_mmu.o \
-	panfrost_perfcnt.o
+	panfrost_perfcnt.o \
+	panfrost_dump.o
 
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
new file mode 100644
index 000000000000..a76dcf4acf6f
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021 Collabora ltd. */
+
+#include <linux/err.h>
+#include <linux/device.h>
+#include <linux/devcoredump.h>
+#include <linux/moduleparam.h>
+#include <linux/iosys-map.h>
+#include <drm/panfrost_drm.h>
+#include <drm/drm_device.h>
+
+#include "panfrost_job.h"
+#include "panfrost_gem.h"
+#include "panfrost_regs.h"
+#include "panfrost_dump.h"
+#include "panfrost_device.h"
+
+static bool panfrost_dump_core = true;
+module_param_named(dump_core, panfrost_dump_core, bool, 0600);
+
+struct panfrost_dump_iterator {
+	void *start;
+	struct panfrost_dump_object_header *hdr;
+	void *data;
+};
+
+static const unsigned short panfrost_dump_registers[] = {
+	GPU_ID,
+	GPU_L2_FEATURES,
+	GPU_CORE_FEATURES,
+	GPU_TILER_FEATURES,
+	GPU_MEM_FEATURES,
+	GPU_MMU_FEATURES,
+	GPU_AS_PRESENT,
+	GPU_JS_PRESENT,
+	GPU_INT_RAWSTAT,
+	GPU_INT_CLEAR,
+	GPU_INT_MASK,
+	GPU_INT_STAT,
+};
+
+static void panfrost_core_dump_header(struct panfrost_dump_iterator *iter,
+	u32 type, void *data_end)
+{
+	struct panfrost_dump_object_header *hdr = iter->hdr;
+
+	hdr->magic = cpu_to_le32(PANFROSTDUMP_MAGIC);
+	hdr->type = cpu_to_le32(type);
+	hdr->file_offset = cpu_to_le32(iter->data - iter->start);
+	hdr->file_size = cpu_to_le32(data_end - iter->data);
+
+	iter->hdr++;
+	iter->data += le32_to_cpu(hdr->file_size);
+}
+
+static void
+panfrost_core_dump_registers(struct panfrost_dump_iterator *iter,
+			     struct panfrost_device *pfdev)
+{
+	struct panfrost_dump_registers *reg = iter->data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(panfrost_dump_registers); i++, reg++) {
+		reg->reg = cpu_to_le32(panfrost_dump_registers[i]);
+		reg->value = cpu_to_le32(gpu_read(pfdev, panfrost_dump_registers[i]));
+	}
+
+	panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, reg);
+}
+
+void panfrost_core_dump(struct panfrost_job *job)
+{
+	struct panfrost_device *pfdev = job->pfdev;
+	struct panfrost_dump_iterator iter;
+	struct drm_gem_object *dbo;
+	unsigned int n_obj, n_bomap_pages;
+	__le64 *bomap, *bomap_start;
+	size_t file_size;
+	int ret, i;
+
+	/* Only catch the first event, or when manually re-armed */
+	if (!panfrost_dump_core)
+		return;
+	panfrost_dump_core = false;
+
+	/* At least, we dump registers and end marker */
+	n_obj = 2;
+	n_bomap_pages = 0;
+	file_size = ARRAY_SIZE(panfrost_dump_registers) *
+			sizeof(struct panfrost_dump_registers);
+
+	/* Add in the active buffer objects */
+	for (i = 0; i < job->bo_count; i++) {
+		dbo = job->bos[i];
+		file_size += dbo->size;
+		n_bomap_pages += dbo->size >> PAGE_SHIFT;
+		n_obj++;
+	}
+
+	/* If we have any buffer objects, add a bomap object */
+	if (n_bomap_pages) {
+		file_size += n_bomap_pages * sizeof(__le64);
+		n_obj++;
+	}
+
+	/* Add the size of the headers */
+	file_size += sizeof(*iter.hdr) * n_obj;
+
+	/* Allocate the file in vmalloc memory, it's likely to be big */
+	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
+			__GFP_NORETRY);
+	if (!iter.start) {
+		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
+		return;
+	}
+
+	/* Point the data member after the headers */
+	iter.hdr = iter.start;
+	iter.data = &iter.hdr[n_obj];
+
+	memset(iter.hdr, 0, iter.data - iter.start);
+
+	/*
+	 * For now, we write the job identifier in the register dump header,
+	 * so that we can decode the entire dump later with pandecode
+	 */
+	iter.hdr->jc = cpu_to_le64(job->jc);
+	iter.hdr->version = cpu_to_le32(PANFROSTDUMP_VERSION_1);
+	iter.hdr->gpu_id = cpu_to_le32(pfdev->features.id);
+	iter.hdr->nbos = cpu_to_le64(job->bo_count);
+
+	panfrost_core_dump_registers(&iter, pfdev);
+
+	/* Reserve space for the bomap */
+	if (n_bomap_pages) {
+		bomap_start = bomap = iter.data;
+		memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
+		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
+					  bomap + n_bomap_pages);
+	} else {
+		/* Silence warning */
+		bomap_start = bomap = NULL;
+	}
+
+	for (i = 0; i < job->bo_count; i++) {
+		struct iosys_map map;
+		struct panfrost_gem_mapping *mapping;
+		struct panfrost_gem_object *bo;
+		struct sg_page_iter page_iter;
+		void *vaddr;
+
+		bo = to_panfrost_bo(job->bos[i]);
+		mapping = job->mappings[i];
+
+		if (!bo->base.sgt) {
+			dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
+			iter.hdr->valid = 0;
+			continue;
+		}
+
+		ret = drm_gem_shmem_vmap(&bo->base, &map);
+		if (ret) {
+			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
+			iter.hdr->valid = 0;
+			continue;
+		}
+
+		WARN_ON(!mapping->active);
+
+		iter.hdr->data[0] = cpu_to_le32((bomap - bomap_start));
+
+		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
+			struct page *page = sg_page_iter_page(&page_iter);
+
+			if (!IS_ERR(page))
+				*bomap++ = cpu_to_le64(page_to_phys(page));
+			else {
+				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
+				*bomap++ = ~cpu_to_le64(0);
+			}
+		}
+
+		iter.hdr->iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
+
+		vaddr = map.vaddr;
+		memcpy(iter.data, vaddr, bo->base.base.size);
+
+		drm_gem_shmem_vunmap(&bo->base, &map);
+
+		iter.hdr->valid = cpu_to_le32(1);
+
+		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
+					  bo->base.base.size);
+	}
+	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_END, iter.data);
+
+	dev_coredumpv(pfdev->dev, iter.start, iter.data - iter.start, GFP_KERNEL);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.h b/drivers/gpu/drm/panfrost/panfrost_dump.h
new file mode 100644
index 000000000000..7d9bcefa5346
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2021 Collabora ltd.
+ */
+
+#ifndef PANFROST_DUMP_H
+#define PANFROST_DUMP_H
+
+struct panfrost_job;
+void panfrost_core_dump(struct panfrost_job *job);
+
+#endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index fda5871aebe3..f506d0ea067c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -20,6 +20,7 @@
 #include "panfrost_regs.h"
 #include "panfrost_gpu.h"
 #include "panfrost_mmu.h"
+#include "panfrost_dump.h"
 
 #define JOB_TIMEOUT_MS 500
 
@@ -727,6 +728,8 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 		job_read(pfdev, JS_TAIL_LO(js)),
 		sched_job);
 
+	panfrost_core_dump(job);
+
 	atomic_set(&pfdev->reset.pending, 1);
 	panfrost_reset(pfdev, sched_job);
 
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 9e40277d8185..a4e988be8478 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -224,6 +224,38 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* Definitions for coredump decoding in user space */
+enum {
+	PANFROSTDUMP_MAGIC = 0xCAFECAFE,
+	PANFROSTDUMP_BUF_REG = 0,
+	PANFROSTDUMP_BUF_BOMAP,
+	PANFROSTDUMP_BUF_BO,
+	PANFROSTDUMP_BUF_END,
+};
+
+#define PANFROSTDUMP_VERSION_1 1
+
+struct panfrost_dump_object_header {
+	__le32 magic;
+	__le32 type;
+	__le32 version;
+	__le32 bifrost;
+	__le64 nbos;
+	__le64 jc;
+	__le32 file_offset;
+	__le32 file_size;
+	__le64 iova;
+	__le32 gpu_id;
+	__le32 valid;
+	__le32 data[2];
+};
+
+/* Registers object, an array of these */
+struct panfrost_dump_registers {
+	__le32 reg;
+	__le32 value;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.35.1

