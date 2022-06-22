Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5E554045
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4368B10EF63;
	Wed, 22 Jun 2022 01:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5995D10EF63
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 01:54:31 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D43D466016D7;
 Wed, 22 Jun 2022 02:54:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655862870;
 bh=OspTBAUoWublh2FCxQ/c/sKsyftb/Btlypprl2ufK70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T5jT5/esJuRwVEv9YtD7p2hKsfv5Q5LqE8ioG/ekBoK4iadQWWdSQ/FcVKsJNXdwK
 T69keZgRr5FsPOWMWcViKQOAowV9UU6uss9QL77Ke4ukYF8D4GfgNhUlxR2UAufu2A
 x6lU4utJO8VMjA5ascSS64OMg/JrmLPdEGcOJWmlrITlWh8Tj40Iq29T63p2kI9FEh
 PSGjNQD89FClgulVz/TC15RAL3wYVvtkXE6WJLffIwoDpvRzoQpNeIbPBEfzuotVzq
 N9hglJA4z83+PJb0M4ElYj0P0qW1lgqE2YL11PtjF84m3/Xz+dzqigr76Er+4arAcz
 xpEJOIoe39tFA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/panfrost: Add support for devcoredump
Date: Wed, 22 Jun 2022 02:54:20 +0100
Message-Id: <20220622015420.1130814-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
References: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
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
 drivers/gpu/drm/panfrost/panfrost_dump.c | 243 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  39 ++--
 include/uapi/drm/panfrost_drm.h          |  47 +++++
 7 files changed, 329 insertions(+), 19 deletions(-)
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
index 000000000000..43d3da45735c
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -0,0 +1,243 @@
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
+	SHADER_READY_LO,
+	SHADER_READY_HI,
+	TILER_READY_LO,
+	TILER_READY_HI,
+	L2_READY_LO,
+	L2_READY_HI,
+	JOB_INT_MASK,
+	JOB_INT_STAT,
+	JS_HEAD_LO(0),
+	JS_HEAD_HI(0),
+	JS_TAIL_LO(0),
+	JS_TAIL_HI(0),
+	JS_AFFINITY_LO(0),
+	JS_AFFINITY_HI(0),
+	JS_CONFIG(0),
+	JS_STATUS(0),
+	JS_HEAD_NEXT_LO(0),
+	JS_HEAD_NEXT_HI(0),
+	JS_AFFINITY_NEXT_LO(0),
+	JS_AFFINITY_NEXT_HI(0),
+	JS_CONFIG_NEXT(0),
+	MMU_INT_MASK,
+	MMU_INT_STAT,
+	AS_TRANSTAB_LO(0),
+	AS_TRANSTAB_HI(0),
+	AS_MEMATTR_LO(0),
+	AS_MEMATTR_HI(0),
+	AS_FAULTSTATUS(0),
+	AS_FAULTADDRESS_LO(0),
+	AS_FAULTADDRESS_HI(0),
+	AS_STATUS(0),
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
+			     struct panfrost_device *pfdev,
+			     u32 as_nr, int slot)
+{
+	struct panfrost_dump_registers *dumpreg = iter->data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(panfrost_dump_registers); i++, dumpreg++) {
+		unsigned int js_as_offset = 0;
+		unsigned int reg;
+
+		if (panfrost_dump_registers[i] >= JS_HEAD_LO(0) &&
+		    panfrost_dump_registers[i] <= JS_CONFIG_NEXT(0))
+			js_as_offset = slot * 0x80;
+		else if (panfrost_dump_registers[i] >= AS_TRANSTAB_LO(0) &&
+			 panfrost_dump_registers[i] <= AS_STATUS(0))
+			js_as_offset = (as_nr << MMU_AS_SHIFT);
+
+		reg = panfrost_dump_registers[i] + js_as_offset;
+
+		dumpreg->reg = cpu_to_le32(reg);
+		dumpreg->value = cpu_to_le32(gpu_read(pfdev, reg));
+	}
+
+	panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, dumpreg);
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
+	u32 as_nr;
+	int slot;
+	int ret, i;
+
+	as_nr = job->mmu->as;
+	slot = panfrost_job_get_slot(job);
+	slot = slot ? slot : 0;
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
+		/*
+		 * Even though the CPU could be configured to use 16K or 64K pages, this
+		 * is a very unusual situation for most kernel setups on SoCs that have
+		 * a Panfrost device. Also many places across the driver make the somewhat
+		 * arbitrary assumption that Panfrost's MMU page size is the same as the CPU's,
+		 * so let's have a sanity check to ensure that's always the case
+		 */
+		WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));
+
+		dbo = job->bos[i];
+		file_size += dbo->size;
+		n_bomap_pages += dbo->size >> PAGE_SHIFT;
+		n_obj++;
+	}
+
+	/* If we have any buffer objects, add a bomap object */
+	if (n_bomap_pages) {
+		file_size += n_bomap_pages * sizeof(*bomap);
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
+	iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
+	iter.hdr->reghdr.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
+	iter.hdr->reghdr.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
+	iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
+	iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
+
+	panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
+
+	/* Reserve space for the bomap */
+	if (job->bo_count) {
+		bomap_start = bomap = iter.data;
+		memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
+		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
+					  bomap + n_bomap_pages);
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
+			iter.hdr->bomap.valid = 0;
+			goto dump_header;
+		}
+
+		ret = drm_gem_shmem_vmap(&bo->base, &map);
+		if (ret) {
+			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
+			iter.hdr->bomap.valid = 0;
+			goto dump_header;
+		}
+
+		WARN_ON(!mapping->active);
+
+		iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
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
+		iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
+
+		vaddr = map.vaddr;
+		memcpy(iter.data, vaddr, bo->base.base.size);
+
+		drm_gem_shmem_vunmap(&bo->base, &map);
+
+		iter.hdr->bomap.valid = cpu_to_le64(1);
+
+dump_header:	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
+					  bo->base.base.size);
+	}
+	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_TRAILER, iter.data);
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
index 7c4208476fbd..dbc597ab46fb 100644
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
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index accb4fa3adb8..1ddc6c4c5e1c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -225,24 +225,26 @@
 #define JOB_INT_MASK_ERR(j)		BIT((j) + 16)
 #define JOB_INT_MASK_DONE(j)		BIT(j)
 
+#define JS_SLOT_STRIDE			0x80
+
 #define JS_BASE				0x1800
-#define JS_HEAD_LO(n)			(JS_BASE + ((n) * 0x80) + 0x00)
-#define JS_HEAD_HI(n)			(JS_BASE + ((n) * 0x80) + 0x04)
-#define JS_TAIL_LO(n)			(JS_BASE + ((n) * 0x80) + 0x08)
-#define JS_TAIL_HI(n)			(JS_BASE + ((n) * 0x80) + 0x0c)
-#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * 0x80) + 0x10)
-#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * 0x80) + 0x14)
-#define JS_CONFIG(n)			(JS_BASE + ((n) * 0x80) + 0x18)
-#define JS_XAFFINITY(n)			(JS_BASE + ((n) * 0x80) + 0x1c)
-#define JS_COMMAND(n)			(JS_BASE + ((n) * 0x80) + 0x20)
-#define JS_STATUS(n)			(JS_BASE + ((n) * 0x80) + 0x24)
-#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x40)
-#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x44)
-#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x50)
-#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x54)
-#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x58)
-#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x60)
-#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x70)
+#define JS_HEAD_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
+#define JS_HEAD_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x04)
+#define JS_TAIL_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x08)
+#define JS_TAIL_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x0c)
+#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x10)
+#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x14)
+#define JS_CONFIG(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x18)
+#define JS_XAFFINITY(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x1c)
+#define JS_COMMAND(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x20)
+#define JS_STATUS(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x24)
+#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x40)
+#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x44)
+#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x50)
+#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x54)
+#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x58)
+#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x60)
+#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
 
 /* Possible values of JS_CONFIG and JS_CONFIG_NEXT registers */
 #define JS_CONFIG_START_FLUSH_CLEAN		BIT(8)
@@ -281,7 +283,8 @@
 #define AS_COMMAND_FLUSH_MEM		0x05	/* Wait for memory accesses to complete, flush all the L1s cache then
 						   flush all L2 caches then issue a flush region command to all MMUs */
 
-#define MMU_AS(as)			(0x2400 + ((as) << 6))
+#define MMU_AS_SHIFT			0x06
+#define MMU_AS(as)			(0x2400 + ((as) << MMU_AS_SHIFT))
 
 #define AS_TRANSTAB_LO(as)		(MMU_AS(as) + 0x00) /* (RW) Translation Table Base Address for address space n, low word */
 #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 9e40277d8185..eac87310b348 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -224,6 +224,53 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* Definitions for coredump decoding in user space */
+#define PANFROSTDUMP_MAJOR 1
+#define PANFROSTDUMP_MINOR 0
+
+#define PANFROSTDUMP_MAGIC 0x464E4150 /* PANF */
+
+#define PANFROSTDUMP_BUF_REG 0
+#define PANFROSTDUMP_BUF_BOMAP (PANFROSTDUMP_BUF_REG + 1)
+#define PANFROSTDUMP_BUF_BO (PANFROSTDUMP_BUF_BOMAP + 1)
+#define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
+
+struct panfrost_dump_object_header {
+	__le32 magic;
+	__le32 type;
+	__le32 file_size;
+	__le32 file_offset;
+
+	union {
+		struct pan_reg_hdr {
+			__le64 jc;
+			__le32 gpu_id;
+			__le32 major;
+			__le32 minor;
+			__le64 nbos;
+		} reghdr;
+
+		struct pan_bomap_hdr {
+			__le32 valid;
+			__le64 iova;
+			__le32 data[2];
+		} bomap;
+
+		/*
+		 * Force same size in case we want to expand the header
+		 * with new fields and also keep it 512-byte aligned
+		 */
+
+		__le32 sizer[496];
+	};
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
2.36.1

