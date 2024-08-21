Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99A95A01F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC13E10E642;
	Wed, 21 Aug 2024 14:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="i9VwrDu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573210E641
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:39:13 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724251149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k6XKED2uvVlrVH1lCqx4sNd2ZeJ4hkttFcPr+jDtsQ8qu4E86EavQ8iQUmgXSa8bn3dNG3u0ofP8QRPl4+iT3LzBBh9Rqj46aIYCfJLnwzAiKoHp6UuoA5BK00sVxncN37v8+qYUT6MQvaAhihlJZIDCD5B6g+NO+zgxGTx3Yik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724251149;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Hxzm49gmsbSKbs0TbF5K6vGCIKx5EAMcbDENEu5LKHU=; 
 b=kH2f+iMYkLUUSkyH4X27JwdbEsioqereqB6p16OnIm41y55IQ37UXtzijgNnK2S36/QIHIh08WPEb7APYXN/xC+qPrO1TKsYwat4zSmhbrYO9o4aqYp4dzqIIP+EXWW0HeXhr9xsj18/jHlw31wrjkD8xJoGYr3awhuh5iPt+7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724251149; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Hxzm49gmsbSKbs0TbF5K6vGCIKx5EAMcbDENEu5LKHU=;
 b=i9VwrDu4zcMR2t2don2UMJGJ1HFJZ4FDSjXU+8KHNbGjZ9B2ntjiSJ7GGoT5618t
 +3+bOEIxrkFk1k2WVR6Ft3Ec6Rwqw/togf4BE6MIl8el8qY8cJvUlCKDWSX1tN2CLV0
 jdG+5B+MHXV+3abPKVq0ULTh9jrhXm+jN0Qgymh8=
Received: by mx.zohomail.com with SMTPS id 1724251147169108.74051738693981;
 Wed, 21 Aug 2024 07:39:07 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org,
 faith.ekstrand@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND 2/5] drm: panthor: add devcoredump support
Date: Wed, 21 Aug 2024 11:37:28 -0300
Message-ID: <20240821143826.3720-3-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821143826.3720-1-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Dump the GPU state using devcoredump. This is useful for debugging
purposes.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/panthor/Kconfig         |   1 +
 drivers/gpu/drm/panthor/Makefile        |   1 +
 drivers/gpu/drm/panthor/panthor_dump.c  | 376 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_dump.h  |  21 ++
 drivers/gpu/drm/panthor/panthor_mmu.c   |  22 ++
 drivers/gpu/drm/panthor/panthor_mmu.h   |   6 +
 drivers/gpu/drm/panthor/panthor_sched.c |  51 +++-
 drivers/gpu/drm/panthor/panthor_sched.h |  10 +
 include/uapi/drm/panthor_drm.h          | 124 ++++++++
 9 files changed, 611 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_dump.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_dump.h

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b..eeb80d8e8064 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -14,6 +14,7 @@ config DRM_PANTHOR
 	select IOMMU_IO_PGTABLE_LPAE
 	select IOMMU_SUPPORT
 	select PM_DEVFREQ
+	select WANT_DEVCOREDUMP
 	help
 	  DRM driver for ARM Mali CSF-based GPUs.
 
diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..19be24ddf577 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -4,6 +4,7 @@ panthor-y := \
 	panthor_devfreq.o \
 	panthor_device.o \
 	panthor_drv.o \
+	panthor_dump.o \
 	panthor_fw.o \
 	panthor_gem.o \
 	panthor_gpu.o \
diff --git a/drivers/gpu/drm/panthor/panthor_dump.c b/drivers/gpu/drm/panthor/panthor_dump.c
new file mode 100644
index 000000000000..7ec0e21dc7e9
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_dump.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* SPDX-FileCopyrightText: Copyright Collabora 2024 */
+
+#include <drm/drm_gem.h>
+#include <linux/iosys-map.h>
+#include <linux/devcoredump.h>
+#include <linux/err.h>
+#include <linux/vmalloc.h>
+#include <linux/types.h>
+#include <uapi/drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_dump.h"
+#include "panthor_mmu.h"
+#include "panthor_sched.h"
+
+/* A magic value used when starting a new section in the dump */
+#define PANT_DUMP_MAGIC 0x544e4150 /* PANT */
+#define PANT_DUMP_MAJOR 1
+#define PANT_DUMP_MINOR 0
+
+/* keep track of where we are in the underlying buffer */
+struct dump_allocator {
+	u8 *start;
+	u8 *curr;
+	size_t pos;
+	size_t capacity;
+};
+
+struct vm_dump_count {
+	u64 size;
+	u32 vas;
+};
+
+struct queue_count {
+	u32 queues;
+};
+
+struct dump_group_args {
+	struct panthor_device *ptdev;
+	struct dump_allocator *alloc;
+	struct panthor_group *group;
+};
+
+struct dump_va_args {
+	struct panthor_device *ptdev;
+	struct dump_allocator *alloc;
+};
+
+static void *alloc_bytes(struct dump_allocator *alloc, size_t size)
+{
+	void *ret;
+
+	if (alloc->pos + size > alloc->capacity)
+		return ERR_PTR(-ENOMEM);
+
+	ret = alloc->curr;
+	alloc->curr += size;
+	alloc->pos += size;
+	return ret;
+}
+
+static struct drm_panthor_dump_header *
+alloc_header(struct dump_allocator *alloc, u32 type, size_t size)
+{
+	struct drm_panthor_dump_header *hdr;
+	int header_size = sizeof(*hdr);
+
+	hdr = alloc_bytes(alloc, header_size);
+	if (IS_ERR(hdr))
+		return hdr;
+
+	hdr->magic = PANT_DUMP_MAGIC;
+	hdr->header_type = type;
+	hdr->header_size = header_size;
+	hdr->data_size = size;
+	return hdr;
+}
+
+static int dump_bo(struct panthor_device *ptdev, u8 *dst,
+		   struct drm_gem_object *obj, int offset, int size)
+{
+	struct iosys_map map = {};
+	int ret;
+
+	ret = drm_gem_vmap_unlocked(obj, &map);
+	if (ret)
+		return ret;
+
+	drm_dbg(&ptdev->base, "dumping bo %p, offset %d, size %d\n", obj,
+		offset, size);
+
+	memcpy(dst, map.vaddr + offset, size);
+	drm_gem_vunmap_unlocked(obj, &map);
+	return ret;
+}
+
+static int dump_va(struct dump_va_args *dump_va_args,
+		   const struct drm_gpuva *va, int type)
+{
+	struct drm_gem_object *obj = va->gem.obj;
+	const int hdr_size =
+		sizeof(struct drm_panthor_dump_gpuva) + va->va.range;
+	struct drm_panthor_dump_gpuva *dump_va;
+	struct drm_panthor_dump_header *dump_hdr;
+	u8 *bo_data;
+
+	dump_hdr = alloc_header(dump_va_args->alloc, type, hdr_size);
+	if (IS_ERR(dump_hdr))
+		return PTR_ERR(dump_hdr);
+
+	dump_va = alloc_bytes(dump_va_args->alloc, sizeof(*dump_va));
+	if (IS_ERR(dump_va))
+		return PTR_ERR(dump_va);
+
+	bo_data = alloc_bytes(dump_va_args->alloc, va->va.range);
+	if (IS_ERR(bo_data))
+		return PTR_ERR(bo_data);
+
+	dump_va->addr = va->va.addr;
+	dump_va->range = va->va.range;
+
+	return dump_bo(dump_va_args->ptdev, bo_data, obj, va->gem.offset,
+		       va->va.range);
+}
+
+static int dump_va_cb(void *priv, const struct drm_gpuva *va)
+{
+	struct dump_va_args *dump_va_args = priv;
+	int ret;
+
+	ret = dump_va(dump_va_args, va, DRM_PANTHOR_DUMP_HEADER_TYPE_VM);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int count_va_cb(void *priv, const struct drm_gpuva *va)
+{
+	struct vm_dump_count *count = priv;
+
+	count->vas++;
+	count->size += va->va.range;
+	return 0;
+}
+
+static void count_queues(struct queue_count *count,
+			 struct drm_panthor_dump_group_info *info)
+{
+	count->queues += info->queue_count;
+}
+
+static int compute_dump_size(struct vm_dump_count *va_count,
+			     struct queue_count *group_and_q_cnt)
+{
+	int size = 0;
+	int i;
+
+	size += sizeof(struct drm_panthor_dump_header);
+	size += sizeof(struct drm_panthor_dump_version);
+
+	size += sizeof(struct drm_panthor_dump_header);
+	size += sizeof(struct drm_panthor_gpu_info);
+
+	size += sizeof(struct drm_panthor_dump_header);
+	size += sizeof(struct drm_panthor_csif_info);
+
+	size += sizeof(struct drm_panthor_dump_header);
+	size += sizeof(struct drm_panthor_fw_info);
+
+	for (i = 0; i < va_count->vas; i++) {
+		size += sizeof(struct drm_panthor_dump_header);
+		size += sizeof(struct drm_panthor_dump_gpuva);
+	}
+
+	size += va_count->size;
+
+	size += sizeof(struct drm_panthor_dump_header);
+	size += sizeof(struct drm_panthor_dump_group_info);
+
+	for (i = 0; i < group_and_q_cnt->queues; i++) {
+		size += sizeof(struct drm_panthor_dump_header);
+		size += sizeof(struct drm_panthor_dump_queue_info);
+	}
+
+	return size;
+}
+
+static int dump_queue_info(struct dump_group_args *dump_group_args,
+			   struct drm_panthor_dump_queue_info *info)
+{
+	struct drm_panthor_dump_header *hdr;
+	struct drm_panthor_dump_queue_info *queue_info;
+
+	drm_dbg(&dump_group_args->ptdev->base,
+		"dumping queue info for cs_id %d, gpuva: %llx, insert: %llx, extract: %llx\n",
+		info->cs_id, info->ringbuf_gpuva, info->ringbuf_insert,
+		info->ringbuf_extract);
+
+	hdr = alloc_header(dump_group_args->alloc,
+			   DRM_PANTHOR_DUMP_HEADER_TYPE_QUEUE_INFO,
+			   sizeof(*info));
+	if (IS_ERR(hdr))
+		return PTR_ERR(hdr);
+
+	queue_info = alloc_bytes(dump_group_args->alloc, sizeof(*queue_info));
+	if (IS_ERR(queue_info))
+		return PTR_ERR(queue_info);
+
+	*queue_info = *info;
+	return 0;
+}
+
+static int dump_group_info(struct dump_group_args *dump_group_args,
+			   struct drm_panthor_dump_group_info *info)
+{
+	struct drm_panthor_dump_header *hdr;
+	struct drm_panthor_dump_group_info *group_info;
+	int ret = 0;
+
+	drm_dbg(&dump_group_args->ptdev->base,
+		"dumping group info for num_queues: %d, faulty bitmask: %d\n",
+		info->queue_count, info->faulty_bitmask);
+
+	hdr = alloc_header(dump_group_args->alloc,
+			   DRM_PANTHOR_DUMP_HEADER_TYPE_GROUP_INFO,
+			   sizeof(*info));
+	if (IS_ERR(hdr))
+		return PTR_ERR(hdr);
+
+	group_info = alloc_bytes(dump_group_args->alloc, sizeof(*group_info));
+	if (IS_ERR(group_info))
+		return PTR_ERR(group_info);
+
+	*group_info = *info;
+
+	for (int i = 0; i < info->queue_count; i++) {
+		struct drm_panthor_dump_queue_info qinfo;
+
+		ret = panthor_sched_get_queueinfo(dump_group_args->group, i,
+						  &qinfo);
+		if (ret)
+			break;
+		ret = dump_queue_info(dump_group_args, &qinfo);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+int panthor_core_dump(struct panthor_core_dump_args *args)
+{
+	u8 *mem;
+	int dump_size;
+	int ret = 0;
+	struct dump_allocator alloc = {};
+	struct vm_dump_count va_count = {};
+	struct drm_panthor_dump_header *hdr;
+	struct drm_panthor_dump_version *version;
+	struct drm_panthor_gpu_info *gpu_info;
+	struct drm_panthor_csif_info *csif_info;
+	struct drm_panthor_fw_info *fw_info;
+	struct queue_count group_and_q_cnt = {};
+	struct dump_va_args dump_va_args = {};
+	struct drm_panthor_dump_group_info group_info;
+	struct dump_group_args dump_group_args;
+
+	panthor_vm_foreach_va(args->group_vm, count_va_cb, &va_count);
+
+	panthor_sched_get_groupinfo(args->group, &group_info);
+
+	count_queues(&group_and_q_cnt, &group_info);
+
+	dump_size = compute_dump_size(&va_count, &group_and_q_cnt);
+
+	mem = vzalloc(dump_size);
+	if (!mem)
+		return ret;
+
+	alloc = (struct dump_allocator){
+		.start = mem,
+		.curr = mem,
+		.pos = 0,
+		.capacity = dump_size,
+	};
+
+	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_VERSION,
+			   sizeof(struct drm_panthor_dump_version));
+	if (IS_ERR(hdr)) {
+		ret = PTR_ERR(hdr);
+		goto free_valloc;
+	}
+
+	version = alloc_bytes(&alloc, sizeof(*version));
+	if (IS_ERR(version)) {
+		ret = PTR_ERR(version);
+		goto free_valloc;
+	}
+
+	*version = (struct drm_panthor_dump_version){
+		.major = PANT_DUMP_MAJOR,
+		.minor = PANT_DUMP_MINOR,
+	};
+
+	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO,
+			   sizeof(args->ptdev->gpu_info));
+	if (IS_ERR(hdr)) {
+		ret = PTR_ERR(hdr);
+		goto free_valloc;
+	}
+
+	gpu_info = alloc_bytes(&alloc, sizeof(*gpu_info));
+	if (IS_ERR(gpu_info)) {
+		ret = PTR_ERR(gpu_info);
+		goto free_valloc;
+	}
+
+	*gpu_info = args->ptdev->gpu_info;
+
+	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO,
+			   sizeof(args->ptdev->csif_info));
+	if (IS_ERR(hdr)) {
+		ret = PTR_ERR(hdr);
+		goto free_valloc;
+	}
+
+	csif_info = alloc_bytes(&alloc, sizeof(*csif_info));
+	if (IS_ERR(csif_info)) {
+		ret = PTR_ERR(csif_info);
+		goto free_valloc;
+	}
+
+	*csif_info = args->ptdev->csif_info;
+
+	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO,
+			   sizeof(args->ptdev->fw_info));
+	if (IS_ERR(hdr)) {
+		ret = PTR_ERR(hdr);
+		goto free_valloc;
+	}
+
+	fw_info = alloc_bytes(&alloc, sizeof(*fw_info));
+	if (IS_ERR(fw_info)) {
+		ret = PTR_ERR(fw_info);
+		goto free_valloc;
+	}
+
+	*fw_info = args->ptdev->fw_info;
+
+	dump_va_args.ptdev = args->ptdev;
+	dump_va_args.alloc = &alloc;
+	ret = panthor_vm_foreach_va(args->group_vm, dump_va_cb, &dump_va_args);
+	if (ret)
+		goto free_valloc;
+
+	dump_group_args =
+		(struct dump_group_args){ args->ptdev, &alloc, args->group };
+	panthor_sched_get_groupinfo(args->group, &group_info);
+	dump_group_info(&dump_group_args, &group_info);
+
+	if (alloc.pos < dump_size)
+		drm_warn(&args->ptdev->base,
+			 "dump size mismatch: expected %d, got %zu\n",
+			 dump_size, alloc.pos);
+
+	dev_coredumpv(args->ptdev->base.dev, alloc.start, alloc.pos,
+		      GFP_KERNEL);
+
+	return ret;
+
+free_valloc:
+	vfree(mem);
+	return ret;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_dump.h b/drivers/gpu/drm/panthor/panthor_dump.h
new file mode 100644
index 000000000000..2a02943a2dbd
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_dump.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* SPDX-FileCopyrightText: Copyright Collabora 2024 */
+
+#ifndef __PANTHOR_DUMP_H__
+#define __PANTHOR_DUMP_H__
+
+#include <drm/drm_gpuvm.h>
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_gem.h"
+
+struct panthor_core_dump_args {
+	struct panthor_device *ptdev;
+	struct panthor_vm *group_vm;
+	struct panthor_group *group;
+};
+
+int panthor_core_dump(struct panthor_core_dump_args *args);
+
+#endif /* __PANTHOR_DUMP_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 412e95fcfb92..61d61157ace0 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2632,6 +2632,28 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
 }
 
+/**
+ * panthor_vm_foreachva() - Execute a callback for each VA in a VM
+ *
+ */
+int panthor_vm_foreach_va(struct panthor_vm *vm,
+			  int (*cb)(void *priv, const struct drm_gpuva *va),
+			  void *priv)
+{
+	struct drm_gpuva *va;
+	int ret = 0;
+
+	mutex_lock(&vm->op_lock);
+	drm_gpuvm_for_each_va(va, &vm->base) {
+		ret = cb(priv, va);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&vm->op_lock);
+
+	return ret;
+}
+
 /**
  * panthor_mmu_unplug() - Unplug the MMU logic
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 6788771071e3..05a5d68b23ae 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -8,6 +8,7 @@
 #include <linux/dma-resv.h>
 
 struct drm_exec;
+struct drm_gpuva;
 struct drm_sched_job;
 struct panthor_gem_object;
 struct panthor_heap_pool;
@@ -52,6 +53,11 @@ void panthor_vm_add_job_fence_to_bos_resvs(struct panthor_vm *vm,
 					   struct drm_sched_job *job);
 
 struct dma_resv *panthor_vm_resv(struct panthor_vm *vm);
+
+int panthor_vm_foreach_va(struct panthor_vm *vm,
+			  int (*cb)(void *priv, const struct drm_gpuva *va),
+			  void *priv);
+
 struct drm_gem_object *panthor_vm_root_gem(struct panthor_vm *vm);
 
 void panthor_vm_pool_destroy(struct panthor_file *pfile);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e0ecc8bcfaae..59c30b311ee9 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -24,6 +24,7 @@
 
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
+#include "panthor_dump.h"
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
@@ -2805,6 +2806,45 @@ static void group_sync_upd_work(struct work_struct *work)
 	group_put(group);
 }
 
+/**
+ * panthor_sched_get_groupinfo() - Build a group info structure for the group
+ *
+ * @group: the group to build a group info structure for
+ * @info: the group info structure to fill
+ */
+void panthor_sched_get_groupinfo(struct panthor_group *group,
+				 struct drm_panthor_dump_group_info *info)
+{
+	info->queue_count = group->queue_count;
+	info->faulty_bitmask = group->fatal_queues;
+}
+
+/** panthor_sched_get_queueinfo() - Build a queue info structure for a queue
+ * given its group and its cs_id
+ *
+ * @group: the group the queue belongs to
+ * @cs_id: the command stream ID of the queue
+ * @info: the queue info structure to fill
+ */
+int panthor_sched_get_queueinfo(struct panthor_group *group, u32 cs_id,
+				struct drm_panthor_dump_queue_info *info)
+{
+	struct panthor_queue *queue;
+
+	if (cs_id >= group->queue_count)
+		return -EINVAL;
+
+	queue = group->queues[cs_id];
+
+	info->cs_id = cs_id;
+	info->ringbuf_insert = queue->iface.input->insert;
+	info->ringbuf_extract = queue->iface.output->extract;
+	info->ringbuf_gpuva = panthor_kernel_bo_gpuva(queue->ringbuf);
+	info->ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
+
+	return 0;
+}
+
 static struct dma_fence *
 queue_run_job(struct drm_sched_job *sched_job)
 {
@@ -2946,7 +2986,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	struct panthor_device *ptdev = group->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_queue *queue = group->queues[job->queue_idx];
-
+	struct panthor_core_dump_args core_dump_args;
 	drm_warn(&ptdev->base, "job timeout\n");
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
@@ -2955,6 +2995,15 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 
 	mutex_lock(&sched->lock);
 	group->timedout = true;
+
+	core_dump_args = (struct panthor_core_dump_args) {
+		.ptdev = ptdev,
+		.group_vm = job->group->vm,
+		.group = job->group,
+	};
+
+	panthor_core_dump(&core_dump_args);
+
 	if (group->csg_id >= 0) {
 		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
 	} else {
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 3a30d2328b30..9a5b53498dcc 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -17,6 +17,9 @@ struct panthor_device;
 struct panthor_file;
 struct panthor_group_pool;
 struct panthor_job;
+struct panthor_group;
+struct drm_panthor_dump_group_info;
+struct drm_panthor_dump_queue_info;
 
 int panthor_group_create(struct panthor_file *pfile,
 			 const struct drm_panthor_group_create *group_args,
@@ -41,6 +44,13 @@ int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
 void panthor_sched_pre_reset(struct panthor_device *ptdev);
 void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed);
+
+void panthor_sched_get_groupinfo(struct panthor_group *group,
+				 struct drm_panthor_dump_group_info *info);
+
+int panthor_sched_get_queueinfo(struct panthor_group *group, u32 cs_id,
+				struct drm_panthor_dump_queue_info *info);
+
 void panthor_sched_suspend(struct panthor_device *ptdev);
 void panthor_sched_resume(struct panthor_device *ptdev);
 
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e235cf452460..82ec0f20c49e 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -969,6 +969,130 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * enum drm_panthor_dump_header_type - Identifies the type of data that follows
+ * in a panthor core dump.
+ */
+enum drm_panthor_dump_header_type {
+	DRM_PANTHOR_DUMP_HEADER_TYPE_VERSION = 0,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO: Gpu information.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO = 1,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO: Command stream interface information.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO = 2,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO: Information about the firmware.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO = 3,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_VM: A dump of the VM for the context.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_VM = 4,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_GROUP_INFO: Describes a group. A dump can
+	 * contain either the faulty group, or all groups for the DRM FD.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_GROUP_INFO = 5,
+	/**
+	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_QUEUE_INFO: Describes a faulty queue. This
+	 * will immediately follow a group info.
+	 */
+	DRM_PANTHOR_DUMP_HEADER_TYPE_QUEUE_INFO = 6,
+};
+
+/**
+ * struct drm_panthor_dump_header - A header that describes a section of a panthor core dump.
+ */
+struct drm_panthor_dump_header {
+	/** @magic: Always set to PANT (0x544e4150). */
+	__u32 magic;
+
+	/** @header_type: Identifies the type of data in the following section of the
+	 * core dump file
+	 */
+	enum drm_panthor_dump_header_type header_type;
+
+	/** @header_size: The size of the header.
+	 *
+	 * This is for backward-compatibility purposes in case this structure is
+	 * augmented in the future. It allows userspace to skip over the header and
+	 * access the actual data it describes.
+	 */
+	__u32 header_size;
+
+	/** @data_size: The size of the following section */
+	__u32 data_size;
+};
+
+/**
+ * struct drm_panthor_dump_version - Version information for a Panthor GPU dump.
+ *
+ * This structure is used to hold version information when performing a dump of
+ * the state of a Panthor GPU.
+ */
+struct drm_panthor_dump_version {
+	/** @major: Versioning information for backwards compatibility */
+	__u32 major;
+	/** @minor: Versioning information for backwards compatibility */
+	__u32 minor;
+};
+
+/**
+ * struct drm_panthor_dump_group_info - Group information for a Panthor GPU
+ * dump.
+ *
+ * This structure is used to hold information about a group when performing a
+ * dump of the state of a Panthor GPU.
+ */
+struct drm_panthor_dump_group_info {
+	/** @queue_count: The number of queues in the group. */
+	__u32 queue_count;
+	/** @faulty_queues: A bitmask denoting the faulty queues */
+	__u32 faulty_bitmask;
+};
+
+#define DRM_PANTHOR_DUMP_QUEUE_INFO_FLAGS_FAULTY	(1 << 0)
+
+/**
+ * struct drm_panthor_dump_queue_info - Queue information for a Panthor GPU
+ * dump.
+ *
+ * This structure is used to hold information about a queue when performing a
+ * dump of the state of a Panthor GPU.
+ */
+struct drm_panthor_dump_queue_info {
+	/** See DRM_PANTHOR_DUMP_QUEUE_INFO_FLAGS_XXX */
+	u32 flags;
+	/** @cs_id: The ID of the command stream. */
+	__s32 cs_id;
+	/** @faulty: Whether this queue has faulted */
+	/** @ringbuf_gpuva: The GPU virtual address of the ring buffer. */
+	__u64 ringbuf_gpuva;
+	/** @ringbuf_insert: The insert point (i.e.: offset) in the ring buffer. This
+	 * is where a instruction would be inserted next by the CPU.
+	 */
+	__u64 ringbuf_insert;
+	/** @ringbuf_extract: The extract point (i.e.: offset) in the ring buffer.
+	 * This is where the GPU would read the next instruction.
+	 */
+	__u64 ringbuf_extract;
+	/** @ringbuf_size: The size of the ring buffer */
+	__u64 ringbuf_size;
+};
+
+/**
+ * struct drm_panthor_dump_gpuva - Describes a GPU VA range in the dump.
+ */
+struct drm_panthor_dump_gpuva {
+	/** @addr: The start address for the mapping */
+	__u64 addr;
+	/** @range: The range covered by the VA mapping */
+	__u64 range;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.45.2

