Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9D9084AF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23AB10EC55;
	Fri, 14 Jun 2024 07:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="VY14y+lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001910E258
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:22:30 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266936; bh=PDAauWyW5B1v1wiCHgxrM4dxRc4dzF+E5ENWrVlEtOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VY14y+ltTmVmzXQ3aHJUSdTekRF3KU4H2glNzyqug9wpvRJvgYdJIV5ueurTlFnmZ
 wKg0rCJq/67k3Vk/Cfzp198WdEffcS9HKmdmnapA63KB/Emn1DRTJIhM5PiCkwVm3a
 86ktsLmPIPD2Aapvtu1+4+a9wP8/7dLlNC1l5nBX59/QE/vGms1QmzHO5VXxCbTUhP
 hJsXeOLgbFDhzx4LonUCOugDa5mMxVMv/Ht0LvCeRwMHIFvTgkhJ7IJkZfSkRNIPpk
 QwmQ7ZOpcvekfBh4dUyGqzRT/3P9xxRQtY2Ot8n1QBwxVDmAQBWo7bt5dsEpgKfxKc
 vdcwrgHex4PRA==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8ha1440009; Thu, 13 Jun 2024 11:22:08 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 05/15] net: hbl_cn: memory trace events
Date: Thu, 13 Jun 2024 11:21:58 +0300
Message-Id: <20240613082208.1439968-6-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

Add trace events for hbl_cn to track memory allocations.

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.c |  28 ++++-
 .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |   3 +
 .../intel/hbl_cn/common/hbl_cn_memory.c       |   9 ++
 include/trace/events/habanalabs_cn.h          | 116 ++++++++++++++++++
 4 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/habanalabs_cn.h

diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
index 946b11bfa61b..4e910b2cb8ac 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
@@ -12,6 +12,8 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
+#include <trace/events/habanalabs_cn.h>
+
 #define NIC_MIN_WQS_PER_PORT		2
 
 #define NIC_SEQ_RESETS_TIMEOUT_MS	15000 /* 15 seconds */
@@ -5892,8 +5894,15 @@ void *__hbl_cn_dma_alloc_coherent(struct hbl_cn_device *hdev, size_t size, dma_a
 				  gfp_t flag, const char *caller)
 {
 	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	void *ptr;
+
+	ptr = asic_funcs->dma_alloc_coherent(hdev, size, dma_handle, flag);
 
-	return asic_funcs->dma_alloc_coherent(hdev, size, dma_handle, flag);
+	if (trace_habanalabs_cn_dma_alloc_coherent_enabled())
+		trace_habanalabs_cn_dma_alloc_coherent(hdev->dev, (u64)(uintptr_t)ptr, *dma_handle,
+						       size, caller);
+
+	return ptr;
 }
 
 void __hbl_cn_dma_free_coherent(struct hbl_cn_device *hdev, size_t size, void *cpu_addr,
@@ -5902,14 +5911,25 @@ void __hbl_cn_dma_free_coherent(struct hbl_cn_device *hdev, size_t size, void *c
 	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
 
 	asic_funcs->dma_free_coherent(hdev, size, cpu_addr, dma_addr);
+
+	if (trace_habanalabs_cn_dma_free_coherent_enabled())
+		trace_habanalabs_cn_dma_free_coherent(hdev->dev, (u64)(uintptr_t)cpu_addr, dma_addr,
+						      size, caller);
 }
 
 void *__hbl_cn_dma_pool_zalloc(struct hbl_cn_device *hdev, size_t size, gfp_t mem_flags,
 			       dma_addr_t *dma_handle, const char *caller)
 {
 	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	void *ptr;
 
-	return asic_funcs->dma_pool_zalloc(hdev, size, mem_flags, dma_handle);
+	ptr = asic_funcs->dma_pool_zalloc(hdev, size, mem_flags, dma_handle);
+
+	if (trace_habanalabs_cn_dma_pool_zalloc_enabled())
+		trace_habanalabs_cn_dma_pool_zalloc(hdev->dev, (u64)(uintptr_t)ptr, *dma_handle,
+						    size, caller);
+
+	return ptr;
 }
 
 void __hbl_cn_dma_pool_free(struct hbl_cn_device *hdev, void *vaddr, dma_addr_t dma_addr,
@@ -5918,6 +5938,10 @@ void __hbl_cn_dma_pool_free(struct hbl_cn_device *hdev, void *vaddr, dma_addr_t
 	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
 
 	asic_funcs->dma_pool_free(hdev, vaddr, dma_addr);
+
+	if (trace_habanalabs_cn_dma_pool_free_enabled())
+		trace_habanalabs_cn_dma_pool_free(hdev->dev, (u64)(uintptr_t)vaddr, dma_addr, 0,
+						  caller);
 }
 
 int hbl_cn_get_reg_pcie_addr(struct hbl_cn_device *hdev, u8 bar_id, u32 reg, u64 *pci_addr)
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
index 47eedd27f36e..5ea690509592 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
@@ -12,6 +12,9 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/sched/clock.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/habanalabs_cn.h>
+
 #define HBL_DRIVER_AUTHOR	"HabanaLabs Kernel Driver Team"
 
 #define HBL_DRIVER_DESC		"HabanaLabs AI accelerators Core Network driver"
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
index 878ecba66aa3..305b5b85acbe 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
@@ -6,6 +6,7 @@
 
 #include <linux/vmalloc.h>
 #include "hbl_cn.h"
+#include <trace/events/habanalabs_cn.h>
 
 static int hbl_cn_map_vmalloc_range(struct hbl_cn_ctx *ctx, u64 vmalloc_va, u64 device_va,
 				    u64 size)
@@ -201,12 +202,16 @@ static struct hbl_cn_mem_buf *cn_mem_buf_alloc(struct hbl_cn_ctx *ctx, gfp_t gfp
 
 static int cn_mem_alloc(struct hbl_cn_ctx *ctx, struct hbl_cn_mem_data *mem_data)
 {
+	struct hbl_cn_device *hdev = ctx->hdev;
 	struct hbl_cn_mem_buf *buf;
 
 	buf = cn_mem_buf_alloc(ctx, GFP_KERNEL, mem_data);
 	if (!buf)
 		return -ENOMEM;
 
+	trace_habanalabs_cn_mem_alloc(hdev->dev, buf->mem_id, buf->handle, (u64)buf->kernel_address,
+				      buf->bus_address, buf->device_va, buf->mappable_size);
+
 	mem_data->handle = buf->handle;
 
 	if (mem_data->mem_id == HBL_CN_DRV_MEM_HOST_DMA_COHERENT)
@@ -242,6 +247,10 @@ int hbl_cn_mem_alloc(struct hbl_cn_ctx *ctx, struct hbl_cn_mem_data *mem_data)
 
 static void cn_mem_buf_destroy(struct hbl_cn_mem_buf *buf)
 {
+	trace_habanalabs_cn_mem_destroy(buf->ctx->hdev->dev, buf->mem_id, buf->handle,
+					(u64)buf->kernel_address, buf->bus_address, buf->device_va,
+					buf->mappable_size);
+
 	if (buf->device_va)
 		hbl_cn_unmap_vmalloc_range(buf->ctx, buf->device_va, buf->mappable_size);
 
diff --git a/include/trace/events/habanalabs_cn.h b/include/trace/events/habanalabs_cn.h
new file mode 100644
index 000000000000..aca962cf3130
--- /dev/null
+++ b/include/trace/events/habanalabs_cn.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2023 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM habanalabs_cn
+
+#if !defined(_TRACE_HABANALABS_CN_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HABANALABS_CN_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(habanalabs_cn_mem_template,
+	TP_PROTO(struct device *dev, u32 mem_id, u64 handle, u64 kernel_addr, u64 bus_addr,
+		 u64 device_va, size_t size),
+
+	TP_ARGS(dev, mem_id, handle, kernel_addr, bus_addr, device_va, size),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__field(u32, mem_id)
+		__field(u64, handle)
+		__field(u64, kernel_addr)
+		__field(u64, bus_addr)
+		__field(u64, device_va)
+		__field(u32, size)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__entry->mem_id = mem_id;
+		__entry->handle = handle;
+		__entry->kernel_addr = kernel_addr;
+		__entry->bus_addr = bus_addr;
+		__entry->device_va = device_va;
+		__entry->size = size;
+	),
+
+	TP_printk("%s: mem_id: %#x, handle: %#llx, kernel_addr: %#llx, bus_addr: %#llx, device_va: %#llx, size: %#x",
+		  __get_str(dname),
+		  __entry->mem_id,
+		  __entry->handle,
+		  __entry->kernel_addr,
+		  __entry->bus_addr,
+		  __entry->device_va,
+		  __entry->size)
+);
+
+DEFINE_EVENT(habanalabs_cn_mem_template, habanalabs_cn_mem_alloc,
+	TP_PROTO(struct device *dev, u32 mem_id, u64 handle, u64 kernel_addr, u64 bus_addr,
+		 u64 device_va, size_t size),
+	TP_ARGS(dev, mem_id, handle, kernel_addr, bus_addr, device_va, size));
+
+DEFINE_EVENT(habanalabs_cn_mem_template, habanalabs_cn_mem_destroy,
+	TP_PROTO(struct device *dev, u32 mem_id, u64 handle, u64 kernel_addr, u64 bus_addr,
+		 u64 device_va, size_t size),
+	TP_ARGS(dev, mem_id, handle, kernel_addr, bus_addr, device_va, size));
+
+DECLARE_EVENT_CLASS(habanalabs_cn_dma_alloc_template,
+	TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size, const char *caller),
+
+	TP_ARGS(dev, cpu_addr, dma_addr, size, caller),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__field(u64, cpu_addr)
+		__field(u64, dma_addr)
+		__field(u32, size)
+		__field(const char *, caller)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname);
+		__entry->cpu_addr = cpu_addr;
+		__entry->dma_addr = dma_addr;
+		__entry->size = size;
+		__entry->caller = caller;
+	),
+
+	TP_printk("%s: cpu_addr: %#llx, dma_addr: %#llx, size: %#x, caller: %s",
+		  __get_str(dname),
+		  __entry->cpu_addr,
+		  __entry->dma_addr,
+		  __entry->size,
+		  __entry->caller
+	)
+);
+
+DEFINE_EVENT(habanalabs_cn_dma_alloc_template, habanalabs_cn_dma_alloc_coherent,
+	     TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size,
+		      const char *caller),
+	     TP_ARGS(dev, cpu_addr, dma_addr, size, caller));
+
+DEFINE_EVENT(habanalabs_cn_dma_alloc_template, habanalabs_cn_dma_free_coherent,
+	     TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size,
+		      const char *caller),
+	     TP_ARGS(dev, cpu_addr, dma_addr, size, caller));
+
+DEFINE_EVENT(habanalabs_cn_dma_alloc_template, habanalabs_cn_dma_pool_zalloc,
+	     TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size,
+		      const char *caller),
+	     TP_ARGS(dev, cpu_addr, dma_addr, size, caller));
+
+DEFINE_EVENT(habanalabs_cn_dma_alloc_template, habanalabs_cn_dma_pool_free,
+	     TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size,
+		      const char *caller),
+	     TP_ARGS(dev, cpu_addr, dma_addr, size, caller));
+
+#endif /* if !defined(_TRACE_HABANALABS_CN_H) || defined(TRACE_HEADER_MULTI_READ) */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

