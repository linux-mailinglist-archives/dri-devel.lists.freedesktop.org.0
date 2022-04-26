Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8450F0AD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2902710F363;
	Tue, 26 Apr 2022 06:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1010F363
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 06:09:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650953355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0iorJ4qphsf0HBI7DEYWfywF8Cg04xpszfRAmgF/Y2E=;
 b=Tom+q31yDU9UB8aL7NJ2T/FXKeTV1+zkIzFaLdppDpYg0gxwHxEeZGvkr5D4ubaZDb2YH4
 yZvPwq/H++Kh0Z9+UZnroA+Kt52FDmPdr0D/Jy76iNNdQXNEFIgFoOm+95X4vsm4QIVqos
 /XjZzXvHhh59H5iNcHUwlNubcFbU/RU=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH v2 2/4] drm/nvdla: Add driver support for NVDLA
Date: Tue, 26 Apr 2022 14:07:59 +0800
Message-Id: <20220426060808.78225-3-cai.huoqing@linux.dev>
In-Reply-To: <20220426060808.78225-1-cai.huoqing@linux.dev>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
which is integrated into NVIDIA Jetson AGX Xavier,
so add driver support for this accelerator.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
v1->v2:
*Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
 move it to uapi.
 comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
*Remove the  onexistent filename  in Makefile
 comments link: https://lore.kernel.org/lkml/202204201512.pp20MXT5-lkp@intel.com/
*Sort file names alphabetically in Makefile.
*Rearrange the error messages, and use drm_err/_dbg() instead of pr_err/_dbg().
*Replace  "dla_" prefix with "nvdla_"
*Check the iosys_map by iosys_map_is_null(), and check "ret" directly.
*Using iosys_map_memcpy_to/_from() for iosys_map instead of memcpy()
*Fix parameter error "dma_buf_vunmap(buf, ptr)", use "&map" instead of "ptr"
*Use iosys_map instead of kvaddr and use "iosys_map_set_vaddr()" to initialize iosys_map
*Using "vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node)" to update vm_pgoff is cleaner
*Remove the unused nvdla_drm_gem_mmap, register drm_gem_mmap to file_operations directly.
*Use DEFINE_DRM_GEM_FOPS() to define nvdla_drm_fops.
*Remove the unused nvdla_drm_gem_mmap_buf, register drm_gem_prime_mmap to drm_driver directly.
 comments link: https://lore.kernel.org/lkml/7fa19996-5830-af3d-ab24-08c76e1d5604@suse.de/
*Fix typo and some code style
*Remove unused function nvdla_get_time_us()
 comments link: https://lore.kernel.org/lkml/0fa9ab41-c18e-a569-e6fe-a0e9d965905e@stargateuniverse.net/

 drivers/gpu/drm/Kconfig                 |    2 +
 drivers/gpu/drm/Makefile                |    1 +
 drivers/gpu/drm/nvdla/Kconfig           |    8 +
 drivers/gpu/drm/nvdla/Makefile          |   17 +
 drivers/gpu/drm/nvdla/nvdla_bdma.c      |  198 +++++
 drivers/gpu/drm/nvdla/nvdla_cache.c     |  202 +++++
 drivers/gpu/drm/nvdla/nvdla_cdp.c       |  299 +++++++
 drivers/gpu/drm/nvdla/nvdla_common.c    |  293 +++++++
 drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_conv.c      |  684 +++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_drv.c       |  694 ++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_drv.h       |  129 +++
 drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 ++++++
 drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 ++++++
 drivers/gpu/drm/nvdla/nvdla_gem.c       |  358 ++++++++
 drivers/gpu/drm/nvdla/nvdla_pdp.c       |  448 ++++++++++
 drivers/gpu/drm/nvdla/nvdla_rubik.c     |  214 +++++
 drivers/gpu/drm/nvdla/nvdla_sched.h     |   37 +
 drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1012 +++++++++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_sdp.c       |  723 ++++++++++++++++
 20 files changed, 6659 insertions(+)
 create mode 100644 drivers/gpu/drm/nvdla/Kconfig
 create mode 100644 drivers/gpu/drm/nvdla/Makefile
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5133c3f028ab..a55cff374abd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -409,6 +409,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/nvdla/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c2ef5f9fce54..8fa3537f308a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -134,3 +134,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_NVDLA) += nvdla/
diff --git a/drivers/gpu/drm/nvdla/Kconfig b/drivers/gpu/drm/nvdla/Kconfig
new file mode 100644
index 000000000000..11c04f5da877
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_NVDLA
+	tristate "NVDLA DRM"
+	depends on DRM
+	select DRM_GEM_CMA_HELPER
+	help
+	  Choose this option for open-source NVIDIA DLA support.
+	  If M is selected the module will be called nvdla-drm.
diff --git a/drivers/gpu/drm/nvdla/Makefile b/drivers/gpu/drm/nvdla/Makefile
new file mode 100644
index 000000000000..0eae453558a8
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/Makefile
@@ -0,0 +1,17 @@
+
+# SPDX-License-Identifier: GPL-2.0
+nvdla-drm-y := \
+	nvdla_bdma.o \
+	nvdla_cache.o \
+	nvdla_cdp.o \
+	nvdla_common.o \
+	nvdla_conv.o \
+	nvdla_drv.o \
+	nvdla_engine.o \
+	nvdla_gem.o \
+	nvdla_pdp.o \
+	nvdla_rubik.o \
+	nvdla_scheduler.o \
+	nvdla_sdp.o \
+
+obj-$(CONFIG_DRM_NVDLA) += nvdla-drm.o
diff --git a/drivers/gpu/drm/nvdla/nvdla_bdma.c b/drivers/gpu/drm/nvdla/nvdla_bdma.c
new file mode 100644
index 000000000000..c9624d356090
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_bdma.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_mem[] = {
+	FIELD_ENUM(BDMA_CFG_CMD_0, SRC_RAM_TYPE, MC),
+	FIELD_ENUM(BDMA_CFG_CMD_0, SRC_RAM_TYPE, CVSRAM),
+};
+
+void
+nvdla_bdma_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	/**
+	 * There is no producer bit for BDMA operation,
+	 * interrupt pointer decides which outstanding request
+	 * to use for this BDMA operation
+	 */
+}
+
+int
+nvdla_bdma_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	if (group->surface_desc->bdma_surface.num_transfers == (uint16_t)0) {
+		group->events |= ((uint8_t)1 << NVDLA_EVENT_OP_COMPLETED);
+		goto exit;
+	}
+
+	/* Launch BDMA transfer */
+	if (group->id == 0)
+		bdma_reg_write(engine, CFG_LAUNCH0, FIELD_ENUM(BDMA_CFG_LAUNCH0_0,
+							GRP0_LAUNCH, YES));
+	else
+		bdma_reg_write(engine, CFG_LAUNCH1, FIELD_ENUM(BDMA_CFG_LAUNCH1_0,
+							GRP1_LAUNCH, YES));
+
+exit:
+	return 0;
+}
+
+void
+nvdla_bdma_rdma_check(struct nvdla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+/**
+ * Program BDMA slot for transfer
+ */
+static int32_t
+processor_bdma_program_slot(struct nvdla_engine *engine,
+							struct nvdla_bdma_surface_desc *bdma_surface,
+							struct nvdla_bdma_transfer_desc *transfer)
+{
+	int32_t ret = 0;
+	uint64_t source_addr = 0;
+	uint64_t destination_addr = 0;
+	uint32_t high, low, reg;
+	uint8_t  bdma_free_slots = 0;
+
+	/* make sure there're enough free slots */
+	do {
+		reg = bdma_reg_read(engine, STATUS);
+		reg = (reg & MASK(BDMA_STATUS_0, FREE_SLOT)) >>
+				SHIFT(BDMA_STATUS_0, FREE_SLOT);
+	} while (reg == 0);
+	bdma_free_slots = (uint8_t)reg;
+
+	nvdla_get_dma_address(engine->driver_context, engine->task->task_data,
+						transfer->source_address,
+						(void *)&source_addr,
+						DESTINATION_DMA);
+	nvdla_get_dma_address(engine->driver_context, engine->task->task_data,
+						transfer->destination_address,
+						(void *)&destination_addr,
+						DESTINATION_DMA);
+
+	ASSERT_GOTO((transfer->line_repeat <= 8192),
+				ret, -EINVAL, exit);
+	ASSERT_GOTO((transfer->surface_repeat <= 8192),
+				ret, -EINVAL, exit);
+	ASSERT_GOTO((transfer->line_size % 32) == 0,
+				ret, -EINVAL, exit);
+	ASSERT_GOTO(transfer->source_line >= transfer->line_size,
+				ret, -EINVAL, exit);
+	ASSERT_GOTO(transfer->destination_line >= transfer->line_size,
+				ret, -EINVAL, exit);
+	ASSERT_GOTO(transfer->source_surface >=
+			(transfer->source_line * transfer->line_repeat),
+				ret, -EINVAL, exit);
+	ASSERT_GOTO(transfer->destination_surface >=
+			(transfer->destination_line * transfer->line_repeat),
+				ret, -EINVAL, exit);
+
+	/* config registers */
+	high = upper_32_bits(source_addr);
+	low = lower_32_bits(source_addr);
+	bdma_reg_write(engine, CFG_SRC_ADDR_LOW, low);
+	bdma_reg_write(engine, CFG_SRC_ADDR_HIGH, high);
+	high = upper_32_bits(destination_addr);
+	low = lower_32_bits(destination_addr);
+	bdma_reg_write(engine, CFG_DST_ADDR_LOW, low);
+	bdma_reg_write(engine, CFG_DST_ADDR_HIGH, high);
+	bdma_reg_write(engine, CFG_LINE, (transfer->line_size >> 5) - 1);
+	reg = (map_mem[bdma_surface->source_type] <<
+				SHIFT(BDMA_CFG_CMD_0, SRC_RAM_TYPE)) |
+		(map_mem[bdma_surface->destination_type] <<
+				SHIFT(BDMA_CFG_CMD_0, DST_RAM_TYPE));
+	bdma_reg_write(engine, CFG_CMD, reg);
+	bdma_reg_write(engine, CFG_LINE_REPEAT, transfer->line_repeat - 1);
+	bdma_reg_write(engine, CFG_SRC_LINE, transfer->source_line);
+	bdma_reg_write(engine, CFG_DST_LINE, transfer->destination_line);
+	bdma_reg_write(engine, CFG_SURF_REPEAT, transfer->surface_repeat - 1);
+	bdma_reg_write(engine, CFG_SRC_SURF, transfer->source_surface);
+	bdma_reg_write(engine, CFG_DST_SURF, transfer->destination_surface);
+	bdma_reg_write(engine, CFG_OP, FIELD_ENUM(BDMA_CFG_OP_0, EN, ENABLE));
+
+exit:
+	return ret;
+}
+
+int
+nvdla_bdma_is_ready(struct nvdla_processor *processor,
+				  struct nvdla_processor_group *group)
+{
+	struct nvdla_processor_group *next_group;
+
+	next_group = &processor->groups[!group->id];
+
+	/**
+	 * If another group is already programmed but not active then
+	 * do not program this operation as BDMA does not really
+	 * have shadow copies for groups. It will end programming
+	 * same group. Wait for another group to get enabled.
+	 */
+	if ((processor->group_status & (1 << next_group->id)) &&
+		!next_group->active)
+		return 0;
+
+	return 1;
+}
+
+void
+nvdla_bdma_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_bdma_op_desc *bdma_op;
+	struct nvdla_bdma_surface_desc *bdma_surface;
+
+	bdma_surface = &group->surface_desc->bdma_surface;
+	bdma_op = &group->operation_desc->bdma_op;
+}
+
+int
+nvdla_bdma_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t i;
+	int32_t ret = 0;
+	struct nvdla_bdma_surface_desc *bdma_surface;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (!engine->config_data->bdma_enable) {
+		drm_err(nvdla_dev->drm, "BDMA is not supported for this configuration\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	bdma_surface = &group->surface_desc->bdma_surface;
+
+	drm_dbg(nvdla_dev->drm, "Num of transfers %u\n", bdma_surface->num_transfers);
+	if (bdma_surface->num_transfers == (uint16_t)0)
+		goto exit;
+
+	if (bdma_surface->num_transfers > NUM_MAX_BDMA_OPS) {
+		drm_err(nvdla_dev->drm, "Invalid number of transfers\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	for (i = 0; i < bdma_surface->num_transfers; i++) {
+		ret = processor_bdma_program_slot(engine, bdma_surface,
+					&bdma_surface->transfers[i]);
+		if (ret)
+			goto exit;
+	}
+
+	nvdla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, BDMA_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, BDMA_DONE_MASK0));
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_cache.c b/drivers/gpu/drm/nvdla/nvdla_cache.c
new file mode 100644
index 000000000000..3c93c0150727
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_cache.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+#define NVDLA_OP_CACHE_SIZE (NVDLA_NUM_GROUPS * ((NVDLA_OP_NUM + 2) * 2))
+
+static struct nvdla_common_op_desc desc_cache[NVDLA_OP_NUM][NVDLA_OP_CACHE_SIZE];
+static int32_t desc_refcount[NVDLA_OP_NUM][NVDLA_OP_CACHE_SIZE];
+
+void
+nvdla_get_refcount(struct nvdla_common_op_desc *op_desc)
+{
+	int32_t i;
+	struct nvdla_common_op_desc *desc = NULL;
+
+	if (op_desc == NULL)
+		return;
+
+	if (op_desc->index == -1)
+		return;
+
+	desc = &desc_cache[op_desc->op_type][0];
+
+	for (i = 0; i < NVDLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == op_desc->index &&
+			desc->roi_index == op_desc->roi_index) {
+			desc_refcount[op_desc->op_type][i]++;
+			return;
+		}
+	}
+}
+
+struct nvdla_common_op_desc *
+nvdla_get_op_desc(struct nvdla_engine *engine,
+				struct nvdla_task_desc *task, int16_t index,
+				uint8_t op_type, uint8_t roi_index)
+{
+	int32_t i;
+	int32_t ret;
+	uint64_t op_base;
+	uint64_t dep_graph_addr;
+	struct nvdla_common_op_desc *desc = NULL;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (index == -1) {
+		drm_dbg(nvdla_dev->drm, "no desc get due to index==-1\n");
+		goto exit;
+	}
+
+	dep_graph_addr = (sizeof(struct nvdla_common_op_desc) *
+				engine->network->num_operations * roi_index);
+
+	desc = &desc_cache[op_type][0];
+
+	for (i = 0; i < NVDLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == index && desc->roi_index == roi_index) {
+			if (desc->op_type != op_type) {
+				drm_err(nvdla_dev->drm,
+						"op_cache[op=%u] contains incorrect entry of op[%u]\n",
+						op_type, desc->op_type);
+				continue;
+			}
+			desc_refcount[op_type][i]++;
+			goto exit;
+		}
+	}
+
+	desc = &desc_cache[op_type][0];
+
+	for (i = 0; i < NVDLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == -1) {
+			op_base = dep_graph_addr +
+					(sizeof(struct nvdla_common_op_desc) *
+					(uint64_t)index);
+			ret = nvdla_data_read(engine->driver_context,
+					task->task_data,
+					task->dependency_graph_addr,
+					(void *)(desc),
+					sizeof(struct nvdla_common_op_desc),
+					op_base);
+			if (ret) {
+				desc = NULL;
+				goto exit;
+			}
+
+			if (op_type != desc->op_type) {
+				/*
+				 * op_type of entry read from DRAM should not
+				 * mismatch with given op_type. If they
+				 * mismatches, then wrong entry is fetched, so
+				 * report this issue by throwing error.
+				 */
+				drm_err(nvdla_dev->drm,
+						"Fetched [op_type=%u] from DRAM doesn't match with op_type[%u]\n",
+						desc->op_type, op_type);
+				desc->op_type = op_type;
+				desc->index = -1;
+				desc->roi_index = -1;
+				desc = NULL;
+				goto exit;
+			}
+
+			desc->index = index;
+			desc->roi_index = roi_index;
+
+			desc_refcount[op_type][i]++;
+			goto exit;
+		}
+	}
+
+exit:
+	return desc;
+}
+
+static void
+nvdla_free_op_desc(struct nvdla_engine *engine, struct nvdla_common_op_desc *op_desc)
+{
+	uint64_t op_base;
+	uint64_t dep_graph_addr;
+	struct nvdla_task_desc *task;
+
+	task = engine->task;
+	dep_graph_addr = (sizeof(struct nvdla_common_op_desc) *
+				engine->network->num_operations *
+				op_desc->roi_index);
+
+	/**
+	 * TODO: keeping the depth value hardcoded as 0 for now,
+	 * need to replace it once corresponding implementation is done.
+	 */
+	op_base = (dep_graph_addr +
+			(sizeof(struct nvdla_common_op_desc) *
+			(uint64_t)op_desc->index));
+
+	/* Flush descriptor to DRAM */
+	nvdla_data_write(engine->driver_context,
+			task->task_data,
+			(void *)op_desc,
+			task->dependency_graph_addr,
+			sizeof(struct nvdla_common_op_desc),
+			op_base);
+
+	/* Release it */
+	op_desc->index = -1;
+	op_desc->roi_index = -1;
+}
+
+void
+nvdla_put_op_desc(struct nvdla_engine *engine, struct nvdla_common_op_desc *op_desc)
+{
+	int32_t i;
+	struct nvdla_common_op_desc *desc;
+
+	if (op_desc == NULL)
+		return;
+
+	if (op_desc->index == -1)
+		return;
+
+	desc = &desc_cache[op_desc->op_type][0];
+
+	for (i = 0; i < NVDLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == op_desc->index &&
+				desc->roi_index == op_desc->roi_index) {
+
+			desc_refcount[op_desc->op_type][i]--;
+
+			/* Free desc if refcount is 0 */
+			if (desc_refcount[op_desc->op_type][i] == 0)
+				nvdla_free_op_desc(engine, op_desc);
+
+			return;
+		}
+	}
+}
+
+void
+nvdla_init_op_cache(struct nvdla_engine *engine)
+{
+	int32_t i, j;
+	struct nvdla_common_op_desc *desc = &desc_cache[0][0];
+
+	memset((uint8_t *)&desc_cache[0][0], 0, sizeof(desc_cache));
+	memset((uint8_t *)&desc_refcount[0][0], 0, sizeof(desc_refcount));
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		for (j = 0; j < NVDLA_OP_CACHE_SIZE; j++) {
+			desc->index = -1;
+			desc->roi_index = -1;
+			desc->op_type = (uint8_t)i;
+			desc++;
+		}
+	}
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_cdp.c b/drivers/gpu/drm/nvdla/nvdla_cdp.c
new file mode 100644
index 000000000000..41a6cace48a1
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_cdp.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_ram[] = {
+	FIELD_ENUM(CDP_RDMA_D_SRC_DMA_CFG_0, SRC_RAM_TYPE, MC),
+	FIELD_ENUM(CDP_RDMA_D_SRC_DMA_CFG_0, SRC_RAM_TYPE, CV),
+};
+
+static const uint8_t map_precision[] = {
+	FIELD_ENUM(CDP_RDMA_D_DATA_FORMAT_0, INPUT_DATA, INT8),
+	FIELD_ENUM(CDP_RDMA_D_DATA_FORMAT_0, INPUT_DATA, INT16),
+	FIELD_ENUM(CDP_RDMA_D_DATA_FORMAT_0, INPUT_DATA, FP16),
+};
+
+static const uint8_t map_perf_dma[] = {
+	FIELD_ENUM(CDP_D_PERF_ENABLE_0, DMA_EN, DISABLE),
+	FIELD_ENUM(CDP_D_PERF_ENABLE_0, DMA_EN, ENABLE),
+};
+
+static const uint8_t map_perf_lut[] = {
+	FIELD_ENUM(CDP_D_PERF_ENABLE_0, LUT_EN, DISABLE),
+	FIELD_ENUM(CDP_D_PERF_ENABLE_0, LUT_EN, ENABLE),
+};
+
+
+static uint32_t
+map_local_size(uint8_t local_size)
+{
+	return ((local_size-1)/2)-1;
+}
+
+void
+nvdla_cdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+
+	/**
+	 * set producer pointer for all sub-modules
+	 */
+	reg = group_id << SHIFT(CDP_S_POINTER_0, PRODUCER);
+	cdp_reg_write(engine, S_POINTER, reg);
+	reg = group_id << SHIFT(CDP_RDMA_S_POINTER_0, PRODUCER);
+	cdp_rdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+nvdla_cdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	uint32_t reg;
+
+	reg = FIELD_ENUM(CDP_RDMA_D_OP_ENABLE_0, OP_EN, ENABLE);
+	cdp_rdma_reg_write(engine, D_OP_ENABLE, reg);
+	reg = FIELD_ENUM(CDP_D_OP_ENABLE_0, OP_EN, ENABLE);
+	cdp_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+nvdla_cdp_rdma_check(struct nvdla_processor_group *group)
+{
+	group->is_rdma_needed = 1;
+}
+
+static int32_t
+processor_cdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct nvdla_lut_param lut;
+	struct nvdla_cdp_op_desc *cdp_op;
+	struct nvdla_cdp_surface_desc *cdp_surface;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	cdp_op = &group->operation_desc->cdp_op;
+	cdp_surface = &group->surface_desc->cdp_surface;
+
+	/* Argument check */
+	if (cdp_surface->src_data.type == NVDLA_MEM_HW) {
+		drm_err(nvdla_dev->drm, "Invalid source memory type\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+	if (cdp_surface->dst_data.type == NVDLA_MEM_HW) {
+		drm_err(nvdla_dev->drm, "Invalid destination memory type\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cdp_op->in_precision != cdp_op->out_precision) {
+		drm_err(nvdla_dev->drm, "CDP does not support precision conversion\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* get the addresses from task descriptor */
+	ret = nvdla_read_input_address(engine, &cdp_surface->src_data,
+								   &input_address,
+								   group->op_desc->index,
+								   group->roi_index, 1);
+	if (ret)
+		goto exit;
+
+	nvdla_get_dma_cube_address(engine->driver_context,
+							   engine->task->task_data,
+							   cdp_surface->dst_data.address,
+							   cdp_surface->dst_data.offset,
+							   (void *)&output_address,
+							   DESTINATION_DMA);
+	if (cdp_op->lut_index >= 0) {
+		group->lut_index = cdp_op->lut_index;
+		nvdla_read_lut(engine, cdp_op->lut_index, (void *)&lut);
+	}
+
+	/* config CDP RDMA registers */
+	reg = ((cdp_surface->src_data.width - 1)
+		<< SHIFT(CDP_RDMA_D_DATA_CUBE_WIDTH_0, WIDTH));
+	cdp_rdma_reg_write(engine, D_DATA_CUBE_WIDTH, reg);
+
+	reg = ((cdp_surface->src_data.height - 1)
+		<< SHIFT(CDP_RDMA_D_DATA_CUBE_HEIGHT_0, HEIGHT));
+	cdp_rdma_reg_write(engine, D_DATA_CUBE_HEIGHT, reg);
+
+	reg = ((cdp_surface->src_data.channel - 1)
+		<< SHIFT(CDP_RDMA_D_DATA_CUBE_CHANNEL_0, CHANNEL));
+	cdp_rdma_reg_write(engine, D_DATA_CUBE_CHANNEL, reg);
+
+	high = upper_32_bits(input_address);
+	low = lower_32_bits(input_address);
+	cdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_LOW, low);
+	cdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_HIGH, high);
+
+	cdp_rdma_reg_write(engine, D_SRC_LINE_STRIDE,
+			cdp_surface->src_data.line_stride);
+	cdp_rdma_reg_write(engine, D_SRC_SURFACE_STRIDE,
+			cdp_surface->src_data.surf_stride);
+
+	reg = (map_ram[cdp_surface->src_data.type]
+		<< SHIFT(CDP_RDMA_D_SRC_DMA_CFG_0, SRC_RAM_TYPE));
+	cdp_rdma_reg_write(engine, D_SRC_DMA_CFG, reg);
+
+	reg = (map_precision[cdp_op->in_precision]
+		<< SHIFT(CDP_RDMA_D_DATA_FORMAT_0, INPUT_DATA));
+	cdp_rdma_reg_write(engine, D_DATA_FORMAT, reg);
+
+	/* config CDP */
+	if (cdp_op->lut_index >= 0)
+		update_lut(engine, CDP_S_LUT_ACCESS_CFG_0, &lut, cdp_op->in_precision);
+
+	high = upper_32_bits(output_address);
+	low = lower_32_bits(output_address);
+	cdp_reg_write(engine, D_DST_BASE_ADDR_LOW, low);
+	cdp_reg_write(engine, D_DST_BASE_ADDR_HIGH, high);
+
+	cdp_reg_write(engine, D_DST_LINE_STRIDE, cdp_surface->dst_data.line_stride);
+	cdp_reg_write(engine, D_DST_SURFACE_STRIDE, cdp_surface->dst_data.surf_stride);
+
+	reg = (map_ram[cdp_surface->dst_data.type]
+		<< SHIFT(CDP_D_DST_DMA_CFG_0, DST_RAM_TYPE));
+	cdp_reg_write(engine, D_DST_DMA_CFG, reg);
+
+	reg = (map_precision[cdp_op->in_precision]
+		<< SHIFT(CDP_D_DATA_FORMAT_0, INPUT_DATA_TYPE));
+	cdp_reg_write(engine, D_DATA_FORMAT, reg);
+
+	reg = (map_local_size(cdp_op->local_size)
+		<< SHIFT(CDP_D_LRN_CFG_0, NORMALZ_LEN));
+	cdp_reg_write(engine, D_LRN_CFG, reg);
+
+	reg = (cdp_op->in_cvt.offset
+		<< SHIFT(CDP_D_DATIN_OFFSET_0, DATIN_OFFSET));
+	cdp_reg_write(engine, D_DATIN_OFFSET, reg);
+
+	reg = (cdp_op->in_cvt.scale
+		<< SHIFT(CDP_D_DATIN_SCALE_0, DATIN_SCALE));
+	cdp_reg_write(engine, D_DATIN_SCALE, reg);
+
+	reg = (cdp_op->in_cvt.truncate
+		<< SHIFT(CDP_D_DATIN_SHIFTER_0, DATIN_SHIFTER));
+	cdp_reg_write(engine, D_DATIN_SHIFTER, reg);
+
+	reg = (cdp_op->out_cvt.offset
+		<< SHIFT(CDP_D_DATOUT_OFFSET_0, DATOUT_OFFSET));
+	cdp_reg_write(engine, D_DATOUT_OFFSET, reg);
+
+	reg = (cdp_op->out_cvt.scale
+		<< SHIFT(CDP_D_DATOUT_SCALE_0, DATOUT_SCALE));
+	cdp_reg_write(engine, D_DATOUT_SCALE, reg);
+
+	reg = (cdp_op->out_cvt.truncate
+		<< SHIFT(CDP_D_DATOUT_SHIFTER_0, DATOUT_SHIFTER));
+	cdp_reg_write(engine, D_DATOUT_SHIFTER, reg);
+
+	reg = ((cdp_op->bypass_sqsum ?
+		FIELD_ENUM(CDP_D_FUNC_BYPASS_0, SQSUM_BYPASS, ENABLE) :
+		FIELD_ENUM(CDP_D_FUNC_BYPASS_0, SQSUM_BYPASS, DISABLE)) <<
+		SHIFT(CDP_D_FUNC_BYPASS_0, SQSUM_BYPASS)) |
+		((cdp_op->bypass_out_mul ?
+		FIELD_ENUM(CDP_D_FUNC_BYPASS_0, MUL_BYPASS, ENABLE) :
+		FIELD_ENUM(CDP_D_FUNC_BYPASS_0, MUL_BYPASS, DISABLE)) <<
+		SHIFT(CDP_D_FUNC_BYPASS_0, MUL_BYPASS));
+	cdp_reg_write(engine, D_FUNC_BYPASS, reg);
+
+exit:
+	return ret;
+}
+
+int
+nvdla_cdp_is_ready(struct nvdla_processor *processor,
+				 struct nvdla_processor_group *group)
+{
+	struct nvdla_processor_group *next_group;
+	struct nvdla_cdp_op_desc *cdp_op;
+
+	cdp_op = &group->operation_desc->cdp_op;
+	next_group = &processor->groups[!group->id];
+
+	/**
+	 * Single LUT is shared between two CDP groups, need to make
+	 * sure that usage does not conflict. Also, LUT write
+	 * access is locked when CDP sub-engine is active, so delay
+	 * writing LUT when another group is active.
+	 */
+
+	/**
+	 * if no LUT required for current group then it can be programmed
+	 * without further checks
+	 */
+	if (cdp_op->lut_index == -1)
+		return 1;
+
+	/**
+	 * if same LUT is used for both groups then it can be programmed
+	 * without more checks. Even if another group is active and LUT
+	 * is locked, it would have been programmed by another group.
+	 */
+	if (next_group->lut_index == cdp_op->lut_index)
+		return 1;
+
+	/**
+	 * if LUT index of another group is not -1 means some LUT is programmed,
+	 * then do not program current LUT as we already know current LUT is not
+	 * -1 and neither same as another group.
+	 */
+	if (next_group->lut_index != -1)
+		return 0;
+
+	/**
+	 * if current group needs LUT different than another group and that
+	 * group is not active then program it.
+	 */
+	if (!next_group->active)
+		return 1;
+
+	/**
+	 * if control is here it means current group is using LUT different than
+	 * another group and that group is active. Wait for another group to
+	 * become idle.
+	 */
+
+	return 0;
+}
+
+void
+nvdla_cdp_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_cdp_op_desc *cdp_op;
+	struct nvdla_cdp_surface_desc *cdp_surface;
+
+	cdp_surface = &group->surface_desc->cdp_surface;
+	cdp_op = &group->operation_desc->cdp_op;
+}
+
+int
+nvdla_cdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret;
+
+	nvdla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, CDP_DONE_MASK1) |
+					MASK(GLB_S_INTR_MASK_0, CDP_DONE_MASK0));
+
+	ret = processor_cdp_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_common.c b/drivers/gpu/drm/nvdla/nvdla_common.c
new file mode 100644
index 000000000000..7606f9f33b6f
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_common.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_reg.h"
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_lut_method[] = {
+	FIELD_ENUM(CDP_S_LUT_CFG_0, LUT_LE_FUNCTION, EXPONENT),
+	FIELD_ENUM(CDP_S_LUT_CFG_0, LUT_LE_FUNCTION, LINEAR)
+};
+static const uint8_t map_lut_out[] = {
+	FIELD_ENUM(CDP_S_LUT_CFG_0, LUT_UFLOW_PRIORITY, LE),
+	FIELD_ENUM(CDP_S_LUT_CFG_0, LUT_UFLOW_PRIORITY, LO)
+};
+
+static const uint16_t access_data_offset[] = {
+	CDP_S_LUT_ACCESS_DATA_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_ACCESS_DATA_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lut_cfg_offset[] = {
+	CDP_S_LUT_CFG_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_CFG_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lut_info_offset[] = {
+	CDP_S_LUT_INFO_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_INFO_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t le_start_offset[] = {
+	CDP_S_LUT_LE_START_LOW_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LE_START_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t le_end_offset[] = {
+	CDP_S_LUT_LE_END_LOW_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LE_END_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lo_start_offset[] = {
+	CDP_S_LUT_LO_START_LOW_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LO_START_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lo_end_offset[] = {
+	CDP_S_LUT_LO_END_LOW_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LO_END_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t le_slope_scale_offset[] = {
+	CDP_S_LUT_LE_SLOPE_SCALE_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LE_SLOPE_SCALE_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t le_slope_shift_offset[] = {
+	CDP_S_LUT_LE_SLOPE_SHIFT_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LE_SLOPE_SHIFT_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lo_slope_scale_offset[] = {
+	CDP_S_LUT_LO_SLOPE_SCALE_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LO_SLOPE_SCALE_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+static const uint16_t lo_slope_shift_offset[] = {
+	CDP_S_LUT_LO_SLOPE_SHIFT_0 - CDP_S_LUT_ACCESS_CFG_0,
+	SDP_S_LUT_LO_SLOPE_SHIFT_0 - SDP_S_LUT_ACCESS_CFG_0,
+};
+
+void update_lut(struct nvdla_engine *engine, uint32_t reg_base,
+				struct nvdla_lut_param *lut, uint8_t precision)
+{
+	int32_t i;
+	uint32_t reg;
+	uint32_t high, low;
+	int32_t is_sdp = reg_base == SDP_S_LUT_ACCESS_CFG_0;
+
+	/* program raw table */
+	reg = (FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID, LE)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID)) |
+		(FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE, WRITE)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE));
+	reg_write(engine, reg_base, reg);
+
+	for (i = 0; i < (1<<LUT_LINEAR_EXP_TABLE_ENTRY_LOG2)+1; i++) {
+		nvdla_reg_write(engine->driver_context,
+				reg_base + access_data_offset[is_sdp],
+				lut->linear_exp_table[i]);
+	}
+
+	/* program density table */
+	reg = (FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID, LO)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID)) |
+		(FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE, WRITE)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE));
+	nvdla_reg_write(engine->driver_context, reg_base, reg);
+
+	for (i = 0; i < (1<<LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2)+1; i++) {
+		nvdla_reg_write(engine->driver_context,
+				reg_base + access_data_offset[is_sdp],
+				lut->linear_only_table[i]);
+	}
+
+	/* program other configurations */
+	reg = (map_lut_method[lut->method] <<
+		SHIFT(CDP_S_LUT_CFG_0, LUT_LE_FUNCTION)) |
+		(map_lut_out[lut->hybrid_priority] <<
+		SHIFT(CDP_S_LUT_CFG_0, LUT_HYBRID_PRIORITY)) |
+		(map_lut_out[lut->underflow_priority] <<
+		SHIFT(CDP_S_LUT_CFG_0, LUT_UFLOW_PRIORITY)) |
+		(map_lut_out[lut->overflow_priority] <<
+		SHIFT(CDP_S_LUT_CFG_0, LUT_OFLOW_PRIORITY));
+	nvdla_reg_write(engine->driver_context,
+			reg_base + lut_cfg_offset[is_sdp], reg);
+
+	if (lut->method == FIELD_ENUM(CDP_S_LUT_CFG_0,
+					LUT_LE_FUNCTION, EXPONENT)) {
+		reg = ((((uint32_t)lut->linear_exp_offset.exp_offset) <<
+			SHIFT(CDP_S_LUT_INFO_0, LUT_LE_INDEX_OFFSET))&
+		MASK(CDP_S_LUT_INFO_0, LUT_LE_INDEX_OFFSET)) |
+			((((uint32_t)lut->linear_only_offset.frac_bits) <<
+			SHIFT(CDP_S_LUT_INFO_0, LUT_LO_INDEX_SELECT))&
+		MASK(CDP_S_LUT_INFO_0, LUT_LO_INDEX_SELECT));
+	} else {
+		reg = ((((uint32_t)lut->linear_exp_offset.frac_bits) <<
+			SHIFT(CDP_S_LUT_INFO_0, LUT_LE_INDEX_SELECT))&
+		MASK(CDP_S_LUT_INFO_0, LUT_LE_INDEX_SELECT)) |
+			((((uint32_t)lut->linear_only_offset.frac_bits) <<
+			SHIFT(CDP_S_LUT_INFO_0, LUT_LO_INDEX_SELECT))&
+		MASK(CDP_S_LUT_INFO_0, LUT_LO_INDEX_SELECT));
+	}
+	nvdla_reg_write(engine->driver_context,
+			reg_base + lut_info_offset[is_sdp], reg);
+	high = upper_32_bits(lut->linear_exp_start);
+	low = lower_32_bits(lut->linear_exp_start);
+	nvdla_reg_write(engine->driver_context,
+			reg_base + le_start_offset[is_sdp], low);
+	if (!is_sdp)
+		nvdla_reg_write(engine->driver_context,
+				reg_base + le_start_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_exp_end);
+	low = lower_32_bits(lut->linear_exp_end);
+	nvdla_reg_write(engine->driver_context,
+				reg_base + le_end_offset[is_sdp], low);
+	if (!is_sdp)
+		nvdla_reg_write(engine->driver_context,
+				reg_base + le_end_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_only_start);
+	low = lower_32_bits(lut->linear_only_start);
+	nvdla_reg_write(engine->driver_context,
+				reg_base + lo_start_offset[is_sdp], low);
+	if (!is_sdp)
+		nvdla_reg_write(engine->driver_context,
+				reg_base + lo_start_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_only_end);
+	low = lower_32_bits(lut->linear_only_end);
+	nvdla_reg_write(engine->driver_context,
+				reg_base + lo_end_offset[is_sdp], low);
+	if (!is_sdp)
+		nvdla_reg_write(engine->driver_context,
+				reg_base + lo_end_offset[is_sdp] + 4, high);
+
+	if (precision == PRECISION_FP16) {
+		reg = (lut->linear_exp_underflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_UFLOW_SCALE)) |
+			(lut->linear_exp_overflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_OFLOW_SCALE));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + le_slope_scale_offset[is_sdp], reg);
+
+		reg = (lut->linear_only_underflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_UFLOW_SCALE)) |
+			(lut->linear_only_overflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_OFLOW_SCALE));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + lo_slope_scale_offset[is_sdp], reg);
+	} else {
+		union nvdla_slope *oslope;
+		union nvdla_slope *uslope;
+
+		uslope = &lut->linear_exp_underflow_slope;
+		oslope = &lut->linear_exp_overflow_slope;
+		reg = ((((uint32_t)uslope->data_i.scale)
+			<< SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_UFLOW_SCALE))&
+			MASK(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_UFLOW_SCALE)) |
+			((((uint32_t)oslope->data_i.scale)
+			<< SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_OFLOW_SCALE))&
+			MASK(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_OFLOW_SCALE));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + le_slope_scale_offset[is_sdp], reg);
+
+		reg = ((((uint32_t)uslope->data_i.shifter) <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SHIFT_0,
+					LUT_LE_SLOPE_UFLOW_SHIFT))&
+			MASK(CDP_S_LUT_LE_SLOPE_SHIFT_0,
+					LUT_LE_SLOPE_UFLOW_SHIFT)) |
+			((((uint32_t)oslope->data_i.shifter) <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SHIFT_0,
+					LUT_LE_SLOPE_OFLOW_SHIFT))&
+			MASK(CDP_S_LUT_LE_SLOPE_SHIFT_0,
+					LUT_LE_SLOPE_OFLOW_SHIFT));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + le_slope_shift_offset[is_sdp], reg);
+
+		uslope = &lut->linear_only_underflow_slope;
+		oslope = &lut->linear_only_overflow_slope;
+		reg = ((((uint32_t)uslope->data_i.scale) <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_UFLOW_SCALE))&
+			MASK(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_UFLOW_SCALE)) |
+			((((uint32_t)oslope->data_i.scale) <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_OFLOW_SCALE))&
+			MASK(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_OFLOW_SCALE));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + lo_slope_scale_offset[is_sdp], reg);
+		reg = ((((uint32_t)uslope->data_i.shifter) <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SHIFT_0,
+					LUT_LO_SLOPE_UFLOW_SHIFT))&
+			MASK(CDP_S_LUT_LO_SLOPE_SHIFT_0,
+					LUT_LO_SLOPE_UFLOW_SHIFT)) |
+			((((uint32_t)oslope->data_i.shifter) <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SHIFT_0,
+					LUT_LO_SLOPE_OFLOW_SHIFT))&
+			MASK(CDP_S_LUT_LO_SLOPE_SHIFT_0,
+					LUT_LO_SLOPE_OFLOW_SHIFT));
+		nvdla_reg_write(engine->driver_context,
+				reg_base + lo_slope_shift_offset[is_sdp], reg);
+	}
+}
+
+int
+validate_data_cube(struct nvdla_data_cube src_data_cube,
+				   struct nvdla_data_cube dst_data_cube,
+				   uint8_t mem_type)
+{
+	int32_t ret = 0;
+
+	if ((src_data_cube.width > DCUBE_MAX_WIDTH) ||
+	    (src_data_cube.height > DCUBE_MAX_HEIGHT) ||
+	    (src_data_cube.channel > DCUBE_MAX_CHANNEL)) {
+		pr_err("Invalid SrcInput Cude[W: %u, H: %u, C: %u]",
+			   src_data_cube.width, src_data_cube.height, src_data_cube.channel);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if ((dst_data_cube.width > DCUBE_MAX_WIDTH) ||
+	    (dst_data_cube.height > DCUBE_MAX_HEIGHT) ||
+	    (dst_data_cube.channel > DCUBE_MAX_CHANNEL)) {
+		pr_err("Invalid DstInput Cude[W: %u, H: %u, C: %u]",
+			   dst_data_cube.width, dst_data_cube.height, dst_data_cube.channel);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (src_data_cube.type > mem_type) {
+		pr_err("Invalid src_data.mem_type: %u\n", src_data_cube.type);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (dst_data_cube.type > mem_type) {
+		pr_err("Invalid dst_data.mem_type: %u\n", dst_data_cube.type);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+exit:
+	return ret;
+}
+
+int
+validate_precision(uint8_t precision, uint8_t map_precision)
+{
+	int32_t ret = 0;
+
+	if (precision >= map_precision) {
+		pr_err("Invalid precision: %u\n", precision);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_common.h b/drivers/gpu/drm/nvdla/nvdla_common.h
new file mode 100644
index 000000000000..e036c69e2981
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_common.h
@@ -0,0 +1,835 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_COMMON_H_
+#define __NVDLA_COMMON_H_
+
+#include <linux/types.h>
+
+#define DCUBE_MAX_WIDTH		8192
+#define DCUBE_MAX_HEIGHT	8192
+#define DCUBE_MAX_CHANNEL	8192
+
+/**
+ * @ingroup Processors
+ * @name DLA Processors
+ * Processor modules in DLA engine. Each processor has it's
+ * own operation a.k.a. HW layer. Network is formed using
+ * graph of these operations
+ * @{
+ */
+#define NVDLA_OP_BDMA		0
+#define NVDLA_OP_CONV		1
+#define NVDLA_OP_SDP		2
+#define NVDLA_OP_PDP		3
+#define NVDLA_OP_CDP		4
+#define NVDLA_OP_RUBIK	5
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Maximum number of processors
+ * @brief DLA ash 6 processors
+ * @{
+ */
+#define NVDLA_OP_NUM		6
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Number of groups
+ * @brief Each processor has 2 groups of registers
+ * @{
+ */
+#define NVDLA_NUM_GROUPS		2
+/** @} */
+
+/**
+ * Network descriptor
+ *
+ * Contains all information to execute a network
+ *
+ * @op_head: Index of first operation of each type in operations list
+ * @num_rois: Number of ROIs
+ * @num_operations: Number of operations in one list
+ * @num_luts: Number of LUTs
+ */
+struct nvdla_network_desc {
+	int16_t operation_desc_index;
+	int16_t surface_desc_index;
+
+	int16_t dependency_graph_index;
+	int16_t lut_data_index;
+
+	int16_t roi_array_index;
+	int16_t surface_index;
+
+	int16_t stat_list_index;
+	int16_t reserved1;
+
+	int16_t op_head[NVDLA_OP_NUM];
+
+	uint16_t num_rois;
+	uint16_t num_operations;
+
+	uint16_t num_luts;
+	uint16_t num_addresses;
+
+	int16_t input_layer;
+	uint8_t dynamic_roi;
+	uint8_t reserved0;
+} __packed __aligned(4);
+
+/**
+ * @name Memory types
+ * @brief DLA engnine can read/write to/from 3 memory types
+ * @{
+ */
+#define NVDLA_MEM_MC			0 /* External DRAM */
+#define NVDLA_MEM_CV			1 /* CV-SRAM */
+#define NVDLA_MEM_HW			2 /* DLA sub-module */
+/** @} */
+
+/**
+ * @ingroup Events
+ * @name Operation events
+ * @brief Different events triggered by an operations
+ * @{
+ */
+#define NVDLA_EVENT_OP_COMPLETED		1
+#define NVDLA_EVENT_OP_PROGRAMMED		2
+#define NVDLA_EVENT_OP_ENABLED			3
+#define NVDLA_EVENT_CDMA_WT_DONE		4
+#define NVDLA_EVENT_CDMA_DT_DONE		5
+/** @} */
+
+struct nvdla_consumer {
+	int16_t index; /* the index of nvdla_common_op_desc in dep_graph_addr */
+	uint8_t event;
+	uint8_t res;
+} __packed __aligned(4);
+
+struct nvdla_common_op_desc {
+	int16_t index; /* set by ucode */
+	int8_t roi_index;
+	uint8_t op_type;
+
+	uint8_t dependency_count;
+	uint8_t reserved0[3];
+
+	struct nvdla_consumer consumers[NVDLA_OP_NUM];
+	struct nvdla_consumer fused_parent;
+} __packed __aligned(4);
+
+struct nvdla_roi_array_desc {
+	uint32_t array_length;
+
+	uint32_t array_reserved;
+} __packed __aligned(4);
+
+struct nvdla_roi_desc {
+	uint32_t left;
+
+	uint32_t top;
+
+	uint32_t right;
+
+	uint32_t bottom;
+} __packed __aligned(4);
+
+/**
+ * @ingroup BDMA
+ * @name Maximum BDMA transfers
+ * @brief BDMA supports multiple transfers in operation. This indicates
+ *        maximum number of transfers possible in one operation.
+ * @{
+ */
+#define NUM_MAX_BDMA_OPS	20
+/** @} */
+
+struct nvdla_bdma_transfer_desc {
+	int16_t source_address;
+	int16_t destination_address;
+
+	uint32_t line_size;
+
+	uint32_t line_repeat;
+
+	uint32_t source_line;
+
+	uint32_t destination_line;
+
+	uint32_t surface_repeat;
+
+	uint32_t source_surface;
+
+	uint32_t destination_surface;
+} __packed __aligned(4);
+
+struct nvdla_bdma_surface_desc {
+	uint8_t source_type;
+	uint8_t destination_type;
+	uint16_t num_transfers;
+
+	struct nvdla_bdma_transfer_desc transfers[NUM_MAX_BDMA_OPS];
+} __packed __aligned(4);
+
+struct nvdla_bdma_op_desc {
+	uint16_t num_transfers;
+	uint16_t reserved0;
+} __packed __aligned(4);
+
+struct nvdla_bdma_stat_desc {
+	uint32_t read_stall;
+	uint32_t write_stall;
+} __packed __aligned(4);
+
+/**
+ * @ingroup Convolution
+ * @name Convolution mode
+ * @brief Convolution modes support by DLA
+ * @{
+ */
+#define CONV_MODE_DIRECT	0
+#define CONV_MODE_WINOGRAD	1
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Precision BPE mapping
+ * @brief Precision formats and Bit Per Elements mapping
+ * @{
+ */
+#define BPE_PRECISION_INT8		1
+#define BPE_PRECISION_INT16		2
+#define BPE_PRECISION_FP16		2
+/** @} */
+
+
+/**
+ * @ingroup Processors
+ * @name Precision types
+ * @brief Precision formats supported by DLA engine
+ * @{
+ */
+#define PRECISION_INT8		0
+#define PRECISION_INT16		1
+#define PRECISION_FP16		2
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Data formats
+ * @brief Data formats supported by DLA engine
+ * @{
+ */
+#define FORMAT_T_R8			0
+#define FORMAT_T_R10			1
+#define FORMAT_T_R12			2
+#define FORMAT_T_R16			3
+#define FORMAT_T_R16_I			4
+#define FORMAT_T_R16_F			5
+#define FORMAT_T_A16B16G16R16		6
+#define FORMAT_T_X16B16G16R16		7
+#define FORMAT_T_A16B16G16R16_F		8
+#define FORMAT_T_A16Y16U16V16		9
+#define FORMAT_T_V16U16Y16A16		10
+#define FORMAT_T_A16Y16U16V16_F		11
+#define FORMAT_T_A8B8G8R8		12
+#define FORMAT_T_A8R8G8B8		13
+#define FORMAT_T_B8G8R8A8		14
+#define FORMAT_T_R8G8B8A8		15
+#define FORMAT_T_X8B8G8R8		16
+#define FORMAT_T_X8R8G8B8		17
+#define FORMAT_T_B8G8R8X8		18
+#define FORMAT_T_R8G8B8X8		19
+#define FORMAT_T_A2B10G10R10		20
+#define FORMAT_T_A2R10G10B10		21
+#define FORMAT_T_B10G10R10A2		22
+#define FORMAT_T_R10G10B10A2		23
+#define FORMAT_T_A2Y10U10V10		24
+#define FORMAT_T_V10U10Y10A2		25
+#define FORMAT_T_A8Y8U8V8			26
+#define FORMAT_T_V8U8Y8A8			27
+#define FORMAT_T_Y8___U8V8_N444		28
+#define FORMAT_T_Y8___V8U8_N444		29
+#define FORMAT_T_Y10___U10V10_N444	30
+#define FORMAT_T_Y10___V10U10_N444	31
+#define FORMAT_T_Y12___U12V12_N444	32
+#define FORMAT_T_Y12___V12U12_N444	33
+#define FORMAT_T_Y16___U16V16_N444	34
+#define FORMAT_T_Y16___V16U16_N444	35
+#define FORMAT_FEATURE			36
+/** @} */
+
+/**
+ * @ingroup Convolution
+ * @name Pixel mapping
+ * @brief Pixel mapping formats supported for image input in Convolution
+ * @{
+ */
+#define MAP_PITCH_LINEAR		0
+/** @} */
+
+/**
+ * @ingroup Convolution
+ * @name Weight formats
+ * @brief Weight data formats supported in Convolution
+ * @{
+ */
+#define WEIGHT_FORMAT_UNCOMPRESSED	0
+#define WEIGHT_FORMAT_COMPRESSED	1
+/** @} */
+
+/**
+ * @ingroup Convolution
+ * @name Mean data format
+ * @brief Mean data formats supported in Convolution
+ * @{
+ */
+#define MEAN_FORMAT_DISABLE     0
+#define MEAN_FORMAT_ENABLE      1
+/** @} */
+
+struct nvdla_cvt_param {
+	int16_t  scale;
+	uint8_t  truncate;
+	uint8_t  enable;
+
+	int32_t  offset;
+} __packed __aligned(4);
+
+struct nvdla_data_cube {
+	uint16_t type; /* nvdla_mem_type */
+	int16_t address; /* offset to the actual IOVA in task.address_list */
+
+	uint32_t offset; /* offset within address */
+	uint32_t size;
+
+	/* cube dimensions */
+	uint16_t width;
+	uint16_t height;
+
+	uint16_t channel;
+	uint16_t reserved0;
+
+	/* stride information */
+	uint32_t line_stride;
+	uint32_t surf_stride;
+
+	/* For Rubik only */
+	uint32_t plane_stride;
+} __packed __aligned(4);
+
+#define PIXEL_OVERRIDE_UINT 0
+#define PIXEL_OVERRIDE_INT  1
+
+struct nvdla_conv_surface_desc {
+	/* Data cube */
+	struct nvdla_data_cube weight_data;
+	struct nvdla_data_cube wmb_data;
+	struct nvdla_data_cube wgs_data;
+	struct nvdla_data_cube src_data;
+	struct nvdla_data_cube dst_data;
+
+	/**
+	 * u_addr = input_data.source_addr + offset_u
+	 * this field should be set when YUV is not interleave format
+	 *
+	 */
+	int64_t offset_u;
+
+	/* line stride for 2nd plane, must be 32bytes aligned */
+	uint32_t in_line_uv_stride;
+} __packed __aligned(4);
+
+struct nvdla_conv_op_desc {
+	/* Performance parameters */
+
+	/* nvdla_conv_mode */
+	uint8_t conv_mode;
+	uint8_t data_reuse;
+	uint8_t weight_reuse;
+	uint8_t skip_data_rls;
+
+	uint8_t skip_weight_rls;
+	uint8_t reserved0;
+	uint16_t entry_per_slice;
+
+	/* nvdla_data_format */
+	uint8_t data_format;
+	/* nvdla_pixel_mapping */
+	uint8_t pixel_mapping;
+	/* number of free slices before fetch */
+	uint16_t fetch_grain;
+
+	uint8_t reserved_b[8];
+
+	/* batch_num */
+	uint8_t batch;
+	/* nvdla_weight_format */
+	uint8_t weight_format;
+	uint8_t data_bank;
+	uint8_t weight_bank;
+
+	/* the offset in bytes of each data cube in a batch */
+	uint32_t batch_stride;
+
+	uint8_t post_extension;
+	uint8_t pixel_override;
+	/* number of slices need to be released */
+	uint16_t release;
+
+	 /* The input cube dimension for CSC */
+	uint16_t input_width_csc;
+	uint16_t input_height_csc;
+
+	uint16_t input_channel_csc;
+	uint16_t kernel_width_csc;
+
+	uint16_t kernel_height_csc;
+	uint16_t kernel_channel_csc;
+
+	/* The input cube dimension for CMAC */
+	uint16_t input_width_cmac;
+	uint16_t input_height_cmac;
+
+	/* actual size in bytes */
+	uint32_t bytes_per_kernel;
+
+	/* Algorithm parameters */
+
+	int16_t mean_ry; /* mean value for red in RGB or Y in YUV */
+	int16_t mean_gu; /* mean value for green in RGB or U in YUV */
+
+	int16_t mean_bv; /* mean value for blue in RGB or V in YUV */
+	int16_t mean_ax;
+
+	uint8_t mean_format; /* nvdla_mean_format */
+	uint8_t conv_stride_x;
+	uint8_t conv_stride_y;
+	uint8_t pad_x_left;
+
+	uint8_t pad_x_right;
+	uint8_t pad_y_top;
+	uint8_t pad_y_bottom;
+	uint8_t dilation_x;
+
+	uint8_t dilation_y;
+	uint8_t reserved2[2];
+
+	/* Precision parameters */
+	uint8_t pra_truncate;
+
+	uint8_t in_precision;
+	/* The output precision from CONV, it's the MAC processing precision */
+	uint8_t out_precision;
+	int16_t pad_val;
+
+	/* input converter parameters */
+	struct nvdla_cvt_param in_cvt;
+	/* output converter parameters, support truncate only */
+	struct nvdla_cvt_param out_cvt;
+
+} __packed __aligned(4);
+
+struct nvdla_conv_stat_desc {
+	uint32_t data_read_stall;
+	uint32_t weight_read_stall;
+	uint32_t data_read_latency;
+	uint32_t weight_read_latency;
+	uint32_t saturation_count;
+	uint32_t nan_data_num;
+	uint32_t nan_weight_num;
+	uint32_t inf_data_num;
+	uint32_t inf_weight_num;
+} __packed __aligned(4);
+
+/**
+ * @ingroup SDP
+ * @name Activation functions
+ * @brief Activation functions supported in SDP
+ * @{
+ */
+#define ACTIVATION_NONE		0
+#define ACTIVATION_RELU		1
+#define ACTIVATION_LUT		2
+#define ACTIVATION_PRELU	3
+/** @} */
+
+/**
+ * @ingroup LUT
+ * @name LUT size
+ * @brief LUT sizes for linear and exponentila LUT
+ * @{
+ */
+#define LUT_LINEAR_EXP_TABLE_ENTRY_LOG2		6
+#define LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2	8
+/** @} */
+
+/**
+ * @ingroup LUT
+ * @name LUT types
+ * @brief DLA supports two types of LUT, linear and exonential
+ * @{
+ */
+#define LUT_LINEAR_EXP_TABLE		0
+#define LUT_LINEAR_ONLY_TABLE		1
+/** @} */
+
+/**
+ * @ingroup LUT
+ * @name LUT methods
+ * @brief DLA supports two types of LUT, linear and exonential
+ * @{
+ */
+#define LUT_METHOD_EXPONENTIAL		0
+#define LUT_METHOD_LINEAR		1
+/** @} */
+
+/**
+ * @ingroup LUT
+ * @name LUT
+ * @brief DLA supports two types of LUT, linear and exonential
+ * @{
+ */
+#define LUT_PRI_LINEAR_EXP		0
+#define LUT_PRI_LINEAR_ONLY		1
+/** @} */
+
+union nvdla_lut_offset {
+	/**
+	 * Number should be subtracted on log domain before look up
+	 * exponential table it has the same definition as hardware
+	 * thus input scaling should also take into account when
+	 * set this field.
+	 */
+	int8_t exp_offset;
+	/**
+	 * Number of bits should be right shift before looking
+	 * up linear table
+	 */
+	int8_t frac_bits;
+	uint16_t reserved0;
+};
+
+/**
+ * This struct is used to represent floating point values by INT
+ * suppose we have a float point number fp_x, it will be represented
+ * as:
+ *
+ * fp_x = scale_int_x>>(shifter_x)
+ *
+ * This is very useful for INT pipeline;
+ */
+struct nvdla_float_data {
+	int16_t scale;
+	int8_t shifter;
+	uint8_t reserved0;
+} __packed __aligned(4);
+
+/**
+ * For INT pipeline, we use the struct above to represent a floating number;
+ * For FP16 pipeline, we should store the FP16 encoded value into a uint16_t
+ * container
+ */
+union nvdla_slope {
+	struct nvdla_float_data data_i;
+
+	uint16_t data_f;
+};
+
+struct nvdla_lut_param {
+	/**
+	 * value of expression ((1<<LUT_LINEAR_EXP_TABLE_ENTRY_LOG2)+1) is 65,
+	 * ((1<<LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2)+1) is 257, and int16_t is of
+	 * 2Byte. And below two statement's combined memory size is 644 Byte.
+	 *
+	 * NOTE: below two declaration combined size should always be multiple
+	 * of 4.
+	 */
+	int16_t linear_exp_table[(1<<LUT_LINEAR_EXP_TABLE_ENTRY_LOG2)+1];
+	int16_t linear_only_table[(1<<LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2)+1];
+
+	union nvdla_lut_offset linear_exp_offset;
+	union nvdla_lut_offset linear_only_offset;
+
+	/**
+	 * The start and end point of raw table,
+	 * valid when raw_method=LINEAR only
+	 */
+	uint64_t linear_exp_start;
+	uint64_t linear_exp_end;
+	uint64_t linear_only_start;
+	uint64_t linear_only_end;
+
+	union nvdla_slope linear_exp_underflow_slope;
+	union nvdla_slope linear_exp_overflow_slope;
+	union nvdla_slope linear_only_underflow_slope;
+	union nvdla_slope linear_only_overflow_slope;
+
+	/**
+	 * nvdla_lut_priority, when both lut are hit(or one overflow,
+	 * the other underflow), which one should be selected as output
+	 */
+	uint8_t hybrid_priority;
+	uint8_t underflow_priority;
+	uint8_t overflow_priority;
+	uint8_t method; /* nvdla_lut_method */
+} __packed __aligned(4);
+
+struct nvdla_sdp_surface_desc {
+	/* Data cube */
+	/* source input cube, available when SDP working on offline mode */
+	struct nvdla_data_cube src_data;
+
+	/* X1 input cube */
+	struct nvdla_data_cube x1_data;
+
+	/* X2 input cube */
+	struct nvdla_data_cube x2_data;
+
+	/* Y input cube */
+	struct nvdla_data_cube y_data;
+
+	/* Output cube */
+	struct nvdla_data_cube dst_data;
+} __packed __aligned(4);
+
+#define SDP_OP_NONE		0
+#define SDP_OP_MUL		1
+#define SDP_OP_ADD		2
+#define SDP_OP_BOTH		3
+
+#define SDP_ALU_OP_MAX		0
+#define SDP_ALU_OP_MIN		1
+#define SDP_ALU_OP_SUM		2
+#define SDP_ALU_OP_EQL		3
+
+#define SDP_OP_PER_LAYER	0
+#define SDP_OP_PER_KERNEL	1
+#define SDP_OP_PER_POINT	2
+
+struct nvdla_sdp_cvt {
+	struct nvdla_cvt_param alu_cvt;
+	struct nvdla_cvt_param mul_cvt;
+} __packed __aligned(4);
+
+struct nvdla_sdp_op {
+	uint8_t enable;
+	uint8_t alu_type; /* nvdla_sdp_alu_op_type */
+	uint8_t type; /* nvdla_sdp_op_type */
+	uint8_t mode; /* nvdla_sdp_op_mode */
+
+	uint8_t act; /* nvdla_act_type */
+	uint8_t shift_value; /* left shift */
+	uint8_t truncate;
+	uint8_t precision;
+
+	int32_t alu_operand;
+	int32_t mul_operand;
+
+	struct nvdla_sdp_cvt  cvt;
+} __packed __aligned(4);
+
+struct nvdla_sdp_op_desc {
+	/* Precision parameters */
+	/* nvdla_precision */
+	uint8_t src_precision;
+	uint8_t dst_precision;
+	int16_t lut_index;
+
+	struct nvdla_cvt_param out_cvt;
+
+	/* Performance parameters */
+	/* nvdla_conv_mode */
+	uint8_t conv_mode;
+	uint8_t batch_num;
+	uint16_t reserved0;
+
+	uint32_t batch_stride;	/* will be used when batch_num > 1 */
+
+	/* Algorithm parameters */
+	struct nvdla_sdp_op x1_op;
+	struct nvdla_sdp_op x2_op;
+	struct nvdla_sdp_op y_op;
+} __packed __aligned(4);
+
+#define POOL_MODE_AVG		0
+#define POOL_MODE_MAX		1
+#define POOL_MODE_MIN		2
+
+#define POOL_SIZE_1		0
+#define POOL_SIZE_2		1
+#define POOL_SIZE_3		2
+#define POOL_SIZE_4		3
+#define POOL_SIZE_5		4
+#define POOL_SIZE_6		5
+#define POOL_SIZE_7		6
+#define POOL_SIZE_8		7
+
+#define PDP_PAD_VAL_NUM	7
+
+struct nvdla_pdp_surface_desc {
+	/* Data cube */
+	struct nvdla_data_cube src_data;
+
+	struct nvdla_data_cube dst_data;
+} __packed __aligned(4);
+
+struct nvdla_pdp_op_desc {
+	/* Performance parameters */
+	uint16_t  partial_in_width_first;
+	uint16_t  partial_in_width_mid;
+
+	uint16_t  partial_in_width_last;
+	uint16_t  partial_width_first;
+
+	uint16_t  partial_width_mid;
+	uint16_t  partial_width_last;
+
+	uint8_t   split_num;
+
+	/* Algorithm parameters */
+	uint8_t  pool_mode; /* nvdla_pool_mode */
+	uint8_t  pool_width; /* nvdla_pool_width */
+	uint8_t  pool_height; /* nvdla_pool_height */
+
+	uint8_t  stride_x;
+	uint8_t  stride_y;
+
+	/**
+	 * The left/right padding size,
+	 * pad_right might be less than pad_left
+	 */
+	uint8_t  pad_left;
+	uint8_t  pad_right;
+
+	/* The top/bottom padding size */
+	uint8_t  pad_top;
+	uint8_t  pad_bottom;
+
+	/* Precision parameters */
+	uint8_t  precision; /* nvdla_precision */
+	uint8_t  reserved0;
+	/**
+	 * if input has non-zero "offset", this value should be set
+	 * There'll be 7 different paddding values, the relationship between
+	 * those versions are:
+	 * padding_value[0] = -offset*scaling;
+	 * padding_value[1] = 2*padding_value[0]
+	 * padding_value[2] = 3*padding_value[0]
+	 * ...
+	 * The purpose is to avoid ucode implement FP16
+	 * multiplier(for FP16 mode)
+	 */
+	int32_t  padding_value[PDP_PAD_VAL_NUM];
+} __packed __aligned(4);
+
+struct nvdla_pdp_stat_desc {
+	uint32_t inf_input_num;
+	uint32_t nan_input_num;
+	uint32_t nan_output_num;
+	uint32_t write_stall;
+	uint32_t runtime;
+} __packed __aligned(4);
+
+struct nvdla_cdp_surface_desc {
+	/* Data cube */
+	struct nvdla_data_cube src_data;
+
+	struct nvdla_data_cube dst_data;
+} __packed __aligned(4);
+
+struct nvdla_cdp_op_desc {
+	/* Precision parameters */
+
+	/* nvdla_precision */
+	uint8_t  in_precision;
+	uint8_t  out_precision;
+	int16_t  lut_index;
+
+	struct nvdla_cvt_param in_cvt;
+	struct nvdla_cvt_param out_cvt;
+
+	/* Performance parameters */
+
+	/* Algorithm parameters */
+	uint8_t  local_size;
+	uint8_t  bypass_sqsum;
+	uint8_t  bypass_out_mul;
+	uint8_t  reserved0;
+} __packed __aligned(4);
+
+struct nvdla_cdp_stat_desc {
+	uint32_t nan_input_num;
+	uint32_t inf_input_num;
+	uint32_t nan_output_num;
+	uint32_t write_stall;
+	uint32_t lut_uflow;
+	uint32_t lut_oflow;
+	uint32_t lut_hybrid;
+	uint32_t lut_le_hit;
+	uint32_t lut_lo_hit;
+	uint32_t saturation_count;
+	uint32_t runtime;
+} __packed __aligned(4);
+
+struct nvdla_rubik_surface_desc {
+	/* Data cube */
+	struct nvdla_data_cube src_data;
+
+	struct nvdla_data_cube dst_data;
+} __packed __aligned(4);
+
+/* rubik mode */
+#define RUBIK_MODE_CONTRACT	0
+#define RUBIK_MODE_SPLIT	1
+#define RUBIK_MODE_MERGE	2
+
+struct nvdla_rubik_op_desc {
+	/* Precision parameters */
+	uint8_t mode;
+	uint8_t precision;
+	uint8_t stride_x;
+	uint8_t stride_y;
+} __packed __aligned(4);
+
+struct nvdla_rubik_stat_desc {
+	uint32_t read_stall;
+	uint32_t write_stall;
+	uint32_t runtime;
+} __packed __aligned(4);
+
+union nvdla_surface_container {
+	struct nvdla_bdma_surface_desc bdma_surface;
+	struct nvdla_conv_surface_desc conv_surface;
+	struct nvdla_sdp_surface_desc sdp_surface;
+	struct nvdla_pdp_surface_desc pdp_surface;
+	struct nvdla_cdp_surface_desc cdp_surface;
+	struct nvdla_rubik_surface_desc rubik_surface;
+};
+
+union nvdla_operation_container {
+	struct nvdla_bdma_op_desc bdma_op;
+	struct nvdla_conv_op_desc conv_op;
+	struct nvdla_sdp_op_desc sdp_op;
+	struct nvdla_pdp_op_desc pdp_op;
+	struct nvdla_cdp_op_desc cdp_op;
+	struct nvdla_rubik_op_desc rubik_op;
+};
+
+struct nvdla_engine;
+void update_lut(struct nvdla_engine *engine, uint32_t reg_base,
+		struct nvdla_lut_param *lut,
+		uint8_t precision);
+int32_t validate_data_cube(struct nvdla_data_cube src_data_cube,
+			struct nvdla_data_cube dst_data_cube,
+			uint8_t mem_type);
+int32_t validate_precision(uint8_t precision,
+			uint8_t map_precision);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_conv.c b/drivers/gpu/drm/nvdla/nvdla_conv.c
new file mode 100644
index 000000000000..3740b2ab2915
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_conv.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_common.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_precision[] = {
+	FIELD_ENUM(CDMA_D_MISC_CFG_0, IN_PRECISION, INT8),
+	FIELD_ENUM(CDMA_D_MISC_CFG_0, IN_PRECISION, INT16),
+	FIELD_ENUM(CDMA_D_MISC_CFG_0, IN_PRECISION, FP16),
+};
+
+static const uint8_t map_conv[] = {
+	FIELD_ENUM(CACC_D_MISC_CFG_0, CONV_MODE, DIRECT),
+	FIELD_ENUM(CACC_D_MISC_CFG_0, CONV_MODE, WINOGRAD),
+};
+
+static const uint8_t map_weight_fmt[] = {
+	FIELD_ENUM(CSC_D_WEIGHT_FORMAT_0, WEIGHT_FORMAT, UNCOMPRESSED),
+	FIELD_ENUM(CSC_D_WEIGHT_FORMAT_0, WEIGHT_FORMAT, COMPRESSED),
+};
+
+static const uint8_t map_img_fmt[][2] = {
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R8), 1},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R10), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R12), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R16), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R16_I), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R16_F), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A16B16G16R16), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_X16B16G16R16), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A16B16G16R16_F), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A16Y16U16V16), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_V16U16Y16A16), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A16Y16U16V16_F), 8},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A8B8G8R8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A8R8G8B8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_B8G8R8A8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R8G8B8A8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_X8B8G8R8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_X8R8G8B8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_B8G8R8X8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R8G8B8X8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A2B10G10R10), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A2R10G10B10), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_B10G10R10A2), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_R10G10B10A2), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A2Y10U10V10), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_V10U10Y10A2), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_A8Y8U8V8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_V8U8Y8A8), 4},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y8___U8V8_N444), 1},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y8___V8U8_N444), 1},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y10___U10V10_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y10___V10U10_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y12___U12V12_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y12___V12U12_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y16___U16V16_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			PIXEL_FORMAT, T_Y16___V16U16_N444), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			DATAIN_FORMAT, FEATURE), 2},
+	{FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+			DATAIN_FORMAT, PIXEL), 1},
+};
+
+static const uint8_t map_pixel[] = {
+	FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0, PIXEL_MAPPING, PITCH_LINEAR),
+};
+
+static const uint8_t map_ram[] = {
+	FIELD_ENUM(CDMA_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE, MCIF),
+	FIELD_ENUM(CDMA_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE, CVIF),
+};
+
+static const uint8_t map_mean[] = {
+	FIELD_ENUM(CDMA_D_MEAN_FORMAT_0, MEAN_FORMAT, DISABLE),
+	FIELD_ENUM(CDMA_D_MEAN_FORMAT_0, MEAN_FORMAT, ENABLE),
+};
+
+static uint32_t
+get_in_format(uint8_t format)
+{
+	uint32_t in_format = 0;
+
+	if (format >= FORMAT_T_R8 && format < FORMAT_FEATURE) {
+		in_format = FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+						DATAIN_FORMAT, PIXEL);
+	} else if (format == FORMAT_FEATURE) {
+		in_format = FIELD_ENUM(CDMA_D_DATAIN_FORMAT_0,
+						DATAIN_FORMAT, FEATURE);
+	}
+
+	return in_format;
+}
+
+void
+nvdla_conv_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+
+	/* set producer pointer for all sub-modules */
+	reg = group_id << SHIFT(CACC_S_POINTER_0, PRODUCER);
+	cacc_reg_write(engine, S_POINTER, reg);
+	cmac_a_reg_write(engine, S_POINTER, reg);
+	cmac_b_reg_write(engine, S_POINTER, reg);
+	csc_reg_write(engine, S_POINTER, reg);
+	cdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+nvdla_conv_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	uint32_t reg;
+
+	do {
+		reg = cdma_reg_read(engine, S_CBUF_FLUSH_STATUS);
+	} while (!(reg & MASK(CDMA_S_CBUF_FLUSH_STATUS_0, FLUSH_DONE)));
+
+	/* enable all sub-modules */
+	reg = FIELD_ENUM(CACC_D_OP_ENABLE_0, OP_EN, ENABLE);
+	cacc_reg_write(engine, D_OP_ENABLE, reg);
+	cmac_a_reg_write(engine, D_OP_ENABLE, reg);
+	cmac_b_reg_write(engine, D_OP_ENABLE, reg);
+	csc_reg_write(engine, D_OP_ENABLE, reg);
+	cdma_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+nvdla_conv_rdma_check(struct nvdla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+static int32_t
+processor_conv_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low, shift, mask;
+	uint32_t stride_x, stride_y, pad_x, pad_y;
+	uint64_t weight_address = 0;
+	uint64_t wmb_address = 0;
+	uint64_t wgs_address = 0;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	uint32_t atom_size = 0;
+	bool weight_compress_support = false;
+	struct nvdla_conv_op_desc *conv_op;
+	struct nvdla_conv_surface_desc *conv_surface;
+
+	weight_compress_support = engine->config_data->weight_compress_support;
+	atom_size = engine->config_data->atom_size;
+	conv_op = &group->operation_desc->conv_op;
+	conv_surface = &group->surface_desc->conv_surface;
+
+	if (conv_op->weight_format == WEIGHT_FORMAT_COMPRESSED) {
+		ASSERT_GOTO((weight_compress_support), ret, -EINVAL, exit);
+		ASSERT_GOTO((conv_surface->wmb_data.address != -1),
+			ret, -EINVAL, exit);
+		nvdla_get_dma_cube_address(engine->driver_context,
+								   engine->task->task_data,
+								   conv_surface->wmb_data.address,
+								   conv_surface->wmb_data.offset,
+								   (void *)&wmb_address,
+								   DESTINATION_DMA);
+
+		ASSERT_GOTO((conv_surface->wgs_data.address != -1),
+			ret, -EINVAL, exit);
+		nvdla_get_dma_cube_address(engine->driver_context,
+								   engine->task->task_data,
+								   conv_surface->wgs_data.address,
+								   conv_surface->wgs_data.offset,
+								   (void *)&wgs_address,
+								   DESTINATION_DMA);
+	}
+
+	if (conv_surface->weight_data.address != -1) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+								   engine->task->task_data,
+								   conv_surface->weight_data.address,
+								   conv_surface->weight_data.offset,
+								   (void *)&weight_address,
+								   DESTINATION_DMA);
+	}
+
+	if (conv_surface->dst_data.address != -1) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+								   engine->task->task_data,
+								   conv_surface->dst_data.address,
+								   conv_surface->dst_data.offset,
+								   (void *)&output_address,
+								   DESTINATION_DMA);
+	}
+
+	ret = nvdla_read_input_address(engine, &conv_surface->src_data,
+								   &input_address,
+								   group->op_desc->index,
+								   group->roi_index,
+								   map_img_fmt[conv_op->data_format][1]);
+	if (ret)
+		goto exit;
+
+	ASSERT_GOTO((conv_op->out_cvt.scale  == 1), ret, -EINVAL, exit);
+	ASSERT_GOTO((conv_op->out_cvt.offset == 0), ret, -EINVAL, exit);
+
+	/* check if the register group is idle */
+	reg = cacc_reg_read(engine, S_STATUS);
+	mask = group->id ? MASK(CACC_S_STATUS_0, STATUS_1) :
+		MASK(CACC_S_STATUS_0, STATUS_0);
+	shift = group->id ? SHIFT(CACC_S_STATUS_0, STATUS_1) :
+		SHIFT(CACC_S_STATUS_0, STATUS_0);
+	reg = (reg & mask) >> shift;
+	ASSERT_GOTO((reg == FIELD_ENUM(CACC_S_STATUS_0, STATUS_0, IDLE)),
+				ret, -EINVAL, exit);
+
+	reg = cmac_a_reg_read(engine, S_STATUS);
+	mask = group->id ? MASK(CMAC_A_S_STATUS_0, STATUS_1) :
+		MASK(CMAC_A_S_STATUS_0, STATUS_0);
+	shift = group->id ? SHIFT(CMAC_A_S_STATUS_0, STATUS_1) :
+		SHIFT(CMAC_A_S_STATUS_0, STATUS_0);
+	reg = (reg & mask) >> shift;
+	ASSERT_GOTO((reg == FIELD_ENUM(CMAC_A_S_STATUS_0, STATUS_0, IDLE)),
+				ret, -EINVAL, exit);
+
+	reg = cmac_b_reg_read(engine, S_STATUS);
+	mask = group->id ? MASK(CMAC_B_S_STATUS_0, STATUS_1) :
+		MASK(CMAC_B_S_STATUS_0, STATUS_0);
+	shift = group->id ? SHIFT(CMAC_B_S_STATUS_0, STATUS_1) :
+		SHIFT(CMAC_B_S_STATUS_0, STATUS_0);
+	reg = (reg & mask) >> shift;
+	ASSERT_GOTO((reg == FIELD_ENUM(CMAC_B_S_STATUS_0, STATUS_0, IDLE)),
+				ret, -EINVAL, exit);
+
+	reg = csc_reg_read(engine, S_STATUS);
+	mask = group->id ? MASK(CSC_S_STATUS_0, STATUS_1) :
+		MASK(CSC_S_STATUS_0, STATUS_0);
+	shift = group->id ? SHIFT(CSC_S_STATUS_0, STATUS_1) :
+		SHIFT(CSC_S_STATUS_0, STATUS_0);
+	reg = (reg & mask) >> shift;
+	ASSERT_GOTO((reg == FIELD_ENUM(CSC_S_STATUS_0, STATUS_0, IDLE)),
+				ret, -EINVAL, exit);
+
+	reg = cdma_reg_read(engine, S_STATUS);
+	mask = group->id ? MASK(CDMA_S_STATUS_0, STATUS_1) :
+		MASK(CDMA_S_STATUS_0, STATUS_0);
+	shift = group->id ? SHIFT(CDMA_S_STATUS_0, STATUS_1) :
+		SHIFT(CDMA_S_STATUS_0, STATUS_0);
+	reg = (reg & mask) >> shift;
+	ASSERT_GOTO((reg == FIELD_ENUM(CDMA_S_STATUS_0, STATUS_0, IDLE)),
+		ret, -EINVAL, exit);
+
+	/* reverse config each sub-module in CC */
+
+	/* CACC */
+	reg = (map_conv[conv_op->conv_mode]
+		<< SHIFT(CACC_D_MISC_CFG_0, CONV_MODE)) |
+		(map_precision[conv_op->out_precision]
+		<< SHIFT(CACC_D_MISC_CFG_0, PROC_PRECISION));
+	cacc_reg_write(engine, D_MISC_CFG, reg);
+
+	reg = ((conv_surface->dst_data.width - 1)
+		<< SHIFT(CACC_D_DATAOUT_SIZE_0_0, DATAOUT_WIDTH)) |
+		((conv_surface->dst_data.height - 1)
+		<< SHIFT(CACC_D_DATAOUT_SIZE_0_0, DATAOUT_HEIGHT));
+	cacc_reg_write(engine, D_DATAOUT_SIZE_0, reg);
+
+	reg = ((conv_surface->dst_data.channel - 1)
+		<< SHIFT(CACC_D_DATAOUT_SIZE_1_0, DATAOUT_CHANNEL));
+	cacc_reg_write(engine, D_DATAOUT_SIZE_1, reg);
+
+	low = lower_32_bits(output_address);
+	cacc_reg_write(engine, D_DATAOUT_ADDR, low);
+	cacc_reg_write(engine, D_BATCH_NUMBER, conv_op->batch - 1);
+	cacc_reg_write(engine, D_LINE_STRIDE, conv_surface->dst_data.line_stride);
+	cacc_reg_write(engine, D_SURF_STRIDE, conv_surface->dst_data.surf_stride);
+
+	if (conv_surface->dst_data.width == 1 &&
+				conv_surface->dst_data.height == 1) {
+		ASSERT_GOTO((((uint32_t)conv_surface->dst_data.line_stride ==
+			(uint32_t)(conv_surface->dst_data.width * atom_size))),
+			ret, -EINVAL, exit);
+		reg = (CACC_D_DATAOUT_MAP_0_LINE_PACKED_TRUE <<
+				SHIFT(CACC_D_DATAOUT_MAP_0, LINE_PACKED));
+		reg |= (CACC_D_DATAOUT_MAP_0_SURF_PACKED_TRUE <<
+				SHIFT(CACC_D_DATAOUT_MAP_0, SURF_PACKED));
+	} else {
+		reg = (FIELD_ENUM(CACC_D_DATAOUT_MAP_0, LINE_PACKED, FALSE) <<
+				SHIFT(CACC_D_DATAOUT_MAP_0, LINE_PACKED));
+		reg |= (FIELD_ENUM(CACC_D_DATAOUT_MAP_0, SURF_PACKED, FALSE) <<
+				SHIFT(CACC_D_DATAOUT_MAP_0, SURF_PACKED));
+	}
+	cacc_reg_write(engine, D_DATAOUT_MAP, reg);
+
+	cacc_reg_write(engine, D_CLIP_CFG, conv_op->out_cvt.truncate);
+
+	/* CMAC */
+	reg = (map_conv[conv_op->conv_mode]
+		<< SHIFT(CMAC_A_D_MISC_CFG_0, CONV_MODE)) |
+		(map_precision[conv_op->out_precision]
+		<< SHIFT(CMAC_A_D_MISC_CFG_0, PROC_PRECISION));
+	cmac_a_reg_write(engine, D_MISC_CFG, reg);
+	cmac_b_reg_write(engine, D_MISC_CFG, reg);
+
+	/* CSC */
+	reg = (map_conv[conv_op->conv_mode]
+		<< SHIFT(CSC_D_MISC_CFG_0, CONV_MODE)) |
+		(map_precision[conv_op->out_precision]
+		<< SHIFT(CSC_D_MISC_CFG_0, IN_PRECISION)) |
+		(map_precision[conv_op->out_precision]
+		<< SHIFT(CSC_D_MISC_CFG_0, PROC_PRECISION)) |
+		(conv_op->data_reuse
+		<< SHIFT(CSC_D_MISC_CFG_0, DATA_REUSE)) |
+		(conv_op->weight_reuse
+		<< SHIFT(CSC_D_MISC_CFG_0, WEIGHT_REUSE)) |
+		(conv_op->skip_data_rls
+		<< SHIFT(CSC_D_MISC_CFG_0, SKIP_DATA_RLS)) |
+		(conv_op->skip_weight_rls
+		<< SHIFT(CSC_D_MISC_CFG_0, SKIP_WEIGHT_RLS));
+	csc_reg_write(engine, D_MISC_CFG, reg);
+
+	reg = (get_in_format(conv_op->data_format) <<
+		SHIFT(CSC_D_DATAIN_FORMAT_0, DATAIN_FORMAT));
+	csc_reg_write(engine, D_DATAIN_FORMAT, reg);
+
+	reg = ((conv_op->input_width_csc - 1)
+		<< SHIFT(CSC_D_DATAIN_SIZE_EXT_0_0, DATAIN_WIDTH_EXT)) |
+		((conv_op->input_height_csc - 1)
+		<< SHIFT(CSC_D_DATAIN_SIZE_EXT_0_0, DATAIN_HEIGHT_EXT));
+	csc_reg_write(engine, D_DATAIN_SIZE_EXT_0, reg);
+
+	reg = ((conv_op->input_channel_csc - 1)
+		<< SHIFT(CSC_D_DATAIN_SIZE_EXT_1_0, DATAIN_CHANNEL_EXT));
+	csc_reg_write(engine, D_DATAIN_SIZE_EXT_1, reg);
+
+	reg = ((conv_op->batch - 1)
+		<< SHIFT(CSC_D_BATCH_NUMBER_0, BATCHES));
+	csc_reg_write(engine, D_BATCH_NUMBER, reg);
+	reg = ((conv_op->post_extension)
+		<< SHIFT(CSC_D_POST_Y_EXTENSION_0, Y_EXTENSION));
+	csc_reg_write(engine, D_POST_Y_EXTENSION, reg);
+
+	reg = ((conv_op->entry_per_slice - 1)
+		<< SHIFT(CSC_D_ENTRY_PER_SLICE_0, ENTRIES));
+	csc_reg_write(engine, D_ENTRY_PER_SLICE, reg);
+
+	reg = (map_weight_fmt[conv_op->weight_format]
+		<< SHIFT(CSC_D_WEIGHT_FORMAT_0, WEIGHT_FORMAT));
+	csc_reg_write(engine, D_WEIGHT_FORMAT, reg);
+
+	reg = ((conv_op->kernel_width_csc - 1)
+		<< SHIFT(CSC_D_WEIGHT_SIZE_EXT_0_0, WEIGHT_WIDTH_EXT)) |
+		((conv_op->kernel_height_csc - 1)
+		<< SHIFT(CSC_D_WEIGHT_SIZE_EXT_0_0, WEIGHT_HEIGHT_EXT));
+	csc_reg_write(engine, D_WEIGHT_SIZE_EXT_0, reg);
+
+	reg = ((conv_op->kernel_channel_csc - 1)
+		<< SHIFT(CSC_D_WEIGHT_SIZE_EXT_1_0, WEIGHT_CHANNEL_EXT)) |
+		((conv_surface->dst_data.channel - 1)
+		<< SHIFT(CSC_D_WEIGHT_SIZE_EXT_1_0, WEIGHT_KERNEL));
+	csc_reg_write(engine, D_WEIGHT_SIZE_EXT_1, reg);
+
+	csc_reg_write(engine, D_WEIGHT_BYTES, conv_surface->weight_data.size);
+	csc_reg_write(engine, D_WMB_BYTES, conv_surface->wmb_data.size);
+
+	reg = ((conv_op->input_width_cmac - 1)
+		<< SHIFT(CSC_D_DATAOUT_SIZE_0_0, DATAOUT_WIDTH)) |
+		((conv_op->input_height_cmac - 1)
+		<< SHIFT(CSC_D_DATAOUT_SIZE_0_0, DATAOUT_HEIGHT));
+	csc_reg_write(engine, D_DATAOUT_SIZE_0, reg);
+
+	reg = ((conv_surface->dst_data.channel - 1)
+		<< SHIFT(CSC_D_DATAOUT_SIZE_1_0, DATAOUT_CHANNEL));
+	csc_reg_write(engine, D_DATAOUT_SIZE_1, reg);
+
+	reg = ((conv_surface->dst_data.width *
+				conv_surface->dst_data.height - 1)
+		<< SHIFT(CSC_D_ATOMICS_0, ATOMICS));
+	csc_reg_write(engine, D_ATOMICS, reg);
+	reg = ((conv_op->release - 1)
+		<< SHIFT(CSC_D_RELEASE_0, RLS_SLICES));
+	csc_reg_write(engine, D_RELEASE, reg);
+
+	if (conv_op->conv_mode == CONV_MODE_DIRECT) {
+		stride_x = conv_op->conv_stride_x - 1;
+		stride_y = conv_op->conv_stride_y - 1;
+		pad_x = conv_op->pad_x_left;
+		pad_y = conv_op->pad_y_top;
+	} else {
+		stride_x = 0;
+		stride_y = 0;
+		pad_x = 0;
+		pad_y = 0;
+	}
+
+	reg = (stride_x
+		<< SHIFT(CSC_D_CONV_STRIDE_EXT_0, CONV_X_STRIDE_EXT)) |
+		(stride_y
+		<< SHIFT(CSC_D_CONV_STRIDE_EXT_0, CONV_Y_STRIDE_EXT));
+	csc_reg_write(engine, D_CONV_STRIDE_EXT, reg);
+
+	reg = ((conv_op->dilation_x - 1)
+		<< SHIFT(CSC_D_DILATION_EXT_0, X_DILATION_EXT)) |
+		((conv_op->dilation_y - 1)
+		<< SHIFT(CSC_D_DILATION_EXT_0, Y_DILATION_EXT));
+	csc_reg_write(engine, D_DILATION_EXT, reg);
+
+	reg = (pad_x
+		<< SHIFT(CSC_D_ZERO_PADDING_0, PAD_LEFT)) |
+		(pad_y
+		<< SHIFT(CSC_D_ZERO_PADDING_0, PAD_TOP));
+	csc_reg_write(engine, D_ZERO_PADDING, reg);
+
+	reg = (conv_op->pad_val
+		<< SHIFT(CSC_D_ZERO_PADDING_VALUE_0, PAD_VALUE)) &
+		MASK(CSC_D_ZERO_PADDING_VALUE_0, PAD_VALUE);
+	csc_reg_write(engine, D_ZERO_PADDING_VALUE, reg);
+
+	reg = ((conv_op->data_bank - 1)
+		<< SHIFT(CSC_D_BANK_0, DATA_BANK)) |
+		((conv_op->weight_bank - 1)
+		<< SHIFT(CSC_D_BANK_0, WEIGHT_BANK));
+	csc_reg_write(engine, D_BANK, reg);
+	csc_reg_write(engine, D_PRA_CFG, conv_op->pra_truncate);
+
+	/* CBUF */
+	/* there's no CBUF register */
+
+	/* CDMA */
+	reg = (map_conv[conv_op->conv_mode]
+		<< SHIFT(CDMA_D_MISC_CFG_0, CONV_MODE)) |
+		(map_precision[conv_op->in_precision]
+		<< SHIFT(CDMA_D_MISC_CFG_0, IN_PRECISION)) |
+		(map_precision[conv_op->out_precision]
+		<< SHIFT(CDMA_D_MISC_CFG_0, PROC_PRECISION)) |
+		(conv_op->data_reuse
+		<< SHIFT(CDMA_D_MISC_CFG_0, DATA_REUSE)) |
+		(conv_op->weight_reuse
+		<< SHIFT(CDMA_D_MISC_CFG_0, WEIGHT_REUSE)) |
+		(conv_op->skip_data_rls
+		<< SHIFT(CDMA_D_MISC_CFG_0, SKIP_DATA_RLS)) |
+		(conv_op->skip_weight_rls
+		<< SHIFT(CDMA_D_MISC_CFG_0, SKIP_WEIGHT_RLS));
+	cdma_reg_write(engine, D_MISC_CFG, reg);
+
+	reg = (get_in_format(conv_op->data_format) <<
+		SHIFT(CDMA_D_DATAIN_FORMAT_0, DATAIN_FORMAT)) |
+		(map_img_fmt[conv_op->data_format][0]
+		<< SHIFT(CDMA_D_DATAIN_FORMAT_0, PIXEL_FORMAT)) |
+		(map_pixel[conv_op->pixel_mapping]
+		<< SHIFT(CDMA_D_DATAIN_FORMAT_0, PIXEL_MAPPING)) |
+		(conv_op->pixel_override
+		<< SHIFT(CDMA_D_DATAIN_FORMAT_0, PIXEL_SIGN_OVERRIDE));
+	cdma_reg_write(engine, D_DATAIN_FORMAT, reg);
+
+	reg = ((conv_surface->src_data.width - 1)
+		<< SHIFT(CDMA_D_DATAIN_SIZE_0_0, DATAIN_WIDTH)) |
+		((conv_surface->src_data.height - 1)
+		<< SHIFT(CDMA_D_DATAIN_SIZE_0_0, DATAIN_HEIGHT));
+	cdma_reg_write(engine, D_DATAIN_SIZE_0, reg);
+
+	reg = ((conv_surface->src_data.channel - 1)
+		<< SHIFT(CDMA_D_DATAIN_SIZE_1_0, DATAIN_CHANNEL));
+	cdma_reg_write(engine, D_DATAIN_SIZE_1, reg);
+
+	reg = ((conv_op->input_width_csc - 1)
+		<< SHIFT(CDMA_D_DATAIN_SIZE_EXT_0_0, DATAIN_WIDTH_EXT)) |
+		((conv_op->input_height_csc - 1)
+		<< SHIFT(CDMA_D_DATAIN_SIZE_EXT_0_0, DATAIN_HEIGHT_EXT));
+	cdma_reg_write(engine, D_DATAIN_SIZE_EXT_0, reg);
+
+	reg = (map_ram[conv_surface->src_data.type]
+		<< SHIFT(CDMA_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE));
+	cdma_reg_write(engine, D_DAIN_RAM_TYPE, reg);
+
+	high = upper_32_bits(input_address);
+	low = lower_32_bits(input_address);
+	cdma_reg_write(engine, D_DAIN_ADDR_HIGH_0, high);
+	cdma_reg_write(engine, D_DAIN_ADDR_LOW_0, low);
+
+	high = upper_32_bits((input_address + conv_surface->offset_u));
+	low = lower_32_bits(input_address + conv_surface->offset_u);
+	cdma_reg_write(engine, D_DAIN_ADDR_HIGH_1, high);
+	cdma_reg_write(engine, D_DAIN_ADDR_LOW_1, low);
+
+	cdma_reg_write(engine, D_LINE_STRIDE, conv_surface->src_data.line_stride);
+	cdma_reg_write(engine, D_SURF_STRIDE, conv_surface->src_data.surf_stride);
+	cdma_reg_write(engine, D_LINE_UV_STRIDE, conv_surface->in_line_uv_stride);
+
+	reg = ((conv_surface->src_data.line_stride ==
+			((uint32_t)conv_surface->src_data.width * atom_size))
+		<< SHIFT(CDMA_D_DAIN_MAP_0, LINE_PACKED));
+	reg |= ((conv_surface->src_data.surf_stride ==
+			((uint32_t)(conv_surface->src_data.width *
+			conv_surface->src_data.height) * atom_size))
+		<< SHIFT(CDMA_D_DAIN_MAP_0, SURF_PACKED));
+	cdma_reg_write(engine, D_DAIN_MAP, reg);
+
+	reg = ((conv_op->batch - 1)
+		<< SHIFT(CDMA_D_BATCH_NUMBER_0, BATCHES));
+	cdma_reg_write(engine, D_BATCH_NUMBER, reg);
+
+	cdma_reg_write(engine, D_BATCH_STRIDE, conv_op->batch_stride);
+
+	reg = ((conv_op->entry_per_slice - 1)
+		<< SHIFT(CDMA_D_ENTRY_PER_SLICE_0, ENTRIES));
+	cdma_reg_write(engine, D_ENTRY_PER_SLICE, reg);
+
+	reg = ((conv_op->fetch_grain - 1)
+		<< SHIFT(CDMA_D_FETCH_GRAIN_0, GRAINS));
+	cdma_reg_write(engine, D_FETCH_GRAIN, reg);
+
+	reg = (map_weight_fmt[conv_op->weight_format]
+		<< SHIFT(CDMA_D_WEIGHT_FORMAT_0, WEIGHT_FORMAT));
+	cdma_reg_write(engine, D_WEIGHT_FORMAT, reg);
+
+	reg = ((conv_op->bytes_per_kernel - 1)
+		<< SHIFT(CDMA_D_WEIGHT_SIZE_0_0, BYTE_PER_KERNEL));
+	cdma_reg_write(engine, D_WEIGHT_SIZE_0, reg);
+
+	reg = ((conv_surface->dst_data.channel - 1)
+		<< SHIFT(CDMA_D_WEIGHT_SIZE_1_0, WEIGHT_KERNEL));
+	cdma_reg_write(engine, D_WEIGHT_SIZE_1, reg);
+
+	reg = (map_ram[conv_surface->weight_data.type]
+		<< SHIFT(CDMA_D_WEIGHT_RAM_TYPE_0, WEIGHT_RAM_TYPE));
+	cdma_reg_write(engine, D_WEIGHT_RAM_TYPE, reg);
+
+	high = upper_32_bits(weight_address);
+	low = lower_32_bits(weight_address);
+	cdma_reg_write(engine, D_WEIGHT_ADDR_HIGH, high);
+	cdma_reg_write(engine, D_WEIGHT_ADDR_LOW, low);
+	cdma_reg_write(engine, D_WEIGHT_BYTES, conv_surface->weight_data.size);
+
+	if (conv_op->weight_format == WEIGHT_FORMAT_COMPRESSED) {
+		high = upper_32_bits(wgs_address);
+		low = lower_32_bits(wgs_address);
+		cdma_reg_write(engine, D_WGS_ADDR_HIGH, high);
+		cdma_reg_write(engine, D_WGS_ADDR_LOW, low);
+
+		high = upper_32_bits(wmb_address);
+		low = lower_32_bits(wmb_address);
+		cdma_reg_write(engine, D_WMB_ADDR_HIGH, high);
+		cdma_reg_write(engine, D_WMB_ADDR_LOW, low);
+		cdma_reg_write(engine, D_WMB_BYTES, conv_surface->wmb_data.size);
+	}
+
+	reg = (map_mean[conv_op->mean_format]
+		<< SHIFT(CDMA_D_MEAN_FORMAT_0, MEAN_FORMAT));
+	cdma_reg_write(engine, D_MEAN_FORMAT, reg);
+
+	if (conv_op->mean_format == MEAN_FORMAT_ENABLE) {
+		reg = ((conv_op->mean_ry
+			<< SHIFT(CDMA_D_MEAN_GLOBAL_0_0, MEAN_RY)) &
+			MASK(CDMA_D_MEAN_GLOBAL_0_0, MEAN_RY)) |
+			((conv_op->mean_gu
+			<< SHIFT(CDMA_D_MEAN_GLOBAL_0_0, MEAN_GU)) &
+			MASK(CDMA_D_MEAN_GLOBAL_0_0, MEAN_GU));
+		cdma_reg_write(engine, D_MEAN_GLOBAL_0, reg);
+
+		reg = ((conv_op->mean_bv
+			<< SHIFT(CDMA_D_MEAN_GLOBAL_1_0, MEAN_BV))&
+			MASK(CDMA_D_MEAN_GLOBAL_1_0, MEAN_BV)) |
+			((conv_op->mean_ax
+			<< SHIFT(CDMA_D_MEAN_GLOBAL_1_0, MEAN_AX))&
+			MASK(CDMA_D_MEAN_GLOBAL_1_0, MEAN_AX));
+		cdma_reg_write(engine, D_MEAN_GLOBAL_1, reg);
+	}
+
+	if (conv_op->in_cvt.enable) {
+		reg = ((FIELD_ENUM(CDMA_D_CVT_CFG_0, CVT_EN, ENABLE))
+			<< SHIFT(CDMA_D_CVT_CFG_0, CVT_EN)) |
+			(conv_op->in_cvt.truncate
+			<< SHIFT(CDMA_D_CVT_CFG_0, CVT_TRUNCATE));
+		cdma_reg_write(engine, D_CVT_CFG, reg);
+		cdma_reg_write(engine, D_CVT_OFFSET, conv_op->in_cvt.offset);
+		cdma_reg_write(engine, D_CVT_SCALE, conv_op->in_cvt.scale);
+	} else {
+		reg = ((FIELD_ENUM(CDMA_D_CVT_CFG_0, CVT_EN, DISABLE))
+			<< SHIFT(CDMA_D_CVT_CFG_0, CVT_EN));
+		cdma_reg_write(engine, D_CVT_CFG, reg);
+	}
+
+	reg = ((conv_op->conv_stride_x - 1)
+		<< SHIFT(CDMA_D_CONV_STRIDE_0, CONV_X_STRIDE)) |
+		((conv_op->conv_stride_y - 1)
+		<< SHIFT(CDMA_D_CONV_STRIDE_0, CONV_Y_STRIDE));
+	cdma_reg_write(engine, D_CONV_STRIDE, reg);
+
+	reg = (conv_op->pad_x_left <<
+		SHIFT(CDMA_D_ZERO_PADDING_0, PAD_LEFT)) |
+		(conv_op->pad_x_right
+		<< SHIFT(CDMA_D_ZERO_PADDING_0, PAD_RIGHT)) |
+		(conv_op->pad_y_top
+		<< SHIFT(CDMA_D_ZERO_PADDING_0, PAD_TOP)) |
+		(conv_op->pad_y_bottom
+		<< SHIFT(CDMA_D_ZERO_PADDING_0, PAD_BOTTOM));
+	cdma_reg_write(engine, D_ZERO_PADDING,   reg);
+
+	reg = conv_op->pad_val <<
+		SHIFT(CDMA_D_ZERO_PADDING_VALUE_0, PAD_VALUE) &
+		MASK(CDMA_D_ZERO_PADDING_VALUE_0, PAD_VALUE);
+	cdma_reg_write(engine, D_ZERO_PADDING_VALUE, reg);
+	reg = ((conv_op->weight_bank - 1)
+		<< SHIFT(CDMA_D_BANK_0, WEIGHT_BANK)) |
+		((conv_op->data_bank - 1)
+		<< SHIFT(CDMA_D_BANK_0, DATA_BANK));
+	cdma_reg_write(engine, D_BANK, reg);
+
+exit:
+	return ret;
+}
+
+int
+nvdla_conv_is_ready(struct nvdla_processor *processor,
+				  struct nvdla_processor_group *group)
+{
+	return 1;
+}
+
+void
+nvdla_conv_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_conv_op_desc *conv_op;
+	struct nvdla_conv_surface_desc *conv_surface;
+
+	conv_surface = &group->surface_desc->conv_surface;
+	conv_op = &group->operation_desc->conv_op;
+}
+
+int
+nvdla_conv_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret;
+
+	ret = processor_conv_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_drv.c b/drivers/gpu/drm/nvdla/nvdla_drv.c
new file mode 100644
index 000000000000..495ce5fc2e4e
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_drv.c
@@ -0,0 +1,694 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/time.h>
+#include <linux/uaccess.h>
+#include <linux/types.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+#include <drm/nvdla_drm.h>
+
+#include "nvdla_drv.h"
+#include "nvdla_engine.h"
+
+static struct nvdla_config nvdla_config_os_initial = {
+	.atom_size = 32,
+	.bdma_enable = true,
+	.rubik_enable = true,
+	.weight_compress_support = true,
+};
+
+static struct nvdla_config nvdla_config_small = {
+	//.atom_size = 8,
+	.atom_size = 32,  // nv_large config
+	.bdma_enable = false,
+	.rubik_enable = false,
+	.weight_compress_support = false,
+};
+
+void nvdla_reg_write(void *driver_context, uint32_t addr, uint32_t reg)
+{
+	struct nvdla_device *nvdla_dev =
+			(struct nvdla_device *)driver_context;
+
+	if (!nvdla_dev)
+		return;
+
+	writel(reg, nvdla_dev->base + addr);
+}
+
+uint32_t nvdla_reg_read(void *driver_context, uint32_t addr)
+{
+	struct nvdla_device *nvdla_dev =
+			(struct nvdla_device *)driver_context;
+
+	if (!nvdla_dev)
+		return 0;
+
+	return readl(nvdla_dev->base + addr);
+}
+
+static irqreturn_t nvdla_engine_isr(int32_t irq, void *data)
+{
+	unsigned long flags;
+	uint32_t mask;
+	uint32_t reg;
+	struct nvdla_processor *processor = NULL;
+	struct nvdla_processor_group *group;
+	struct nvdla_engine *engine;
+	struct nvdla_device *nvdla_dev = (struct nvdla_device *)data;
+
+	if (!nvdla_dev)
+		return IRQ_NONE;
+
+	engine = nvdla_dev->engine_context;
+	spin_lock_irqsave(&nvdla_dev->nvdla_lock, flags);
+
+	mask = glb_reg_read(engine, S_INTR_MASK);
+	reg = glb_reg_read(engine, S_INTR_STATUS);
+
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_SDP];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_SDP];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_CDP];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_CDP];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_RUBIK];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_RUBIK];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_PDP];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_PDP];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_BDMA];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_BDMA];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_CDMA_DT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_CDMA_DT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS0)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << NVDLA_EVENT_CDMA_WT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS1)) {
+		processor = &engine->processors[NVDLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << NVDLA_EVENT_CDMA_WT_DONE);
+	}
+
+	glb_reg_write(engine, S_INTR_STATUS, reg);
+	mask = glb_reg_read(engine, S_INTR_MASK);
+	reg = glb_reg_read(engine, S_INTR_STATUS);
+
+	complete(&nvdla_dev->event_notifier);
+	spin_unlock_irqrestore(&nvdla_dev->nvdla_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static int32_t nvdla_read_dma_address(void *driver_context, void *task_data,
+						int16_t index, void *dst)
+{
+	int32_t ret = 0;
+	struct nvdla_mem_handle *handles;
+	dma_addr_t *phys_addr = (dma_addr_t *)(dst);
+	struct nvdla_device *nvdla_dev =
+			(struct nvdla_device *)driver_context;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+
+	if (index == -1 || index > task->num_addresses)
+		return -EINVAL;
+
+	handles = (struct nvdla_mem_handle *)task->address_list;
+	ret = nvdla_gem_dma_addr(nvdla_dev->drm, task->file,
+					handles[index].handle,
+					phys_addr);
+
+	/* Add offset to IOVA address */
+	*phys_addr = *phys_addr + handles[index].offset;
+
+	return ret;
+}
+
+static int32_t nvdla_read_cpu_address(void *driver_context, void *task_data,
+						int16_t index, void *dst)
+{
+	uint64_t *temp = (uint64_t *)dst;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+
+	if (index == -1 || index > task->num_addresses)
+		return -EINVAL;
+
+	*temp = (uint64_t)index;
+	return 0;
+}
+
+int32_t nvdla_get_dma_address(void *driver_context, void *task_data,
+					int16_t index, void *dst_ptr,
+					uint32_t destination)
+{
+	int32_t ret = 0;
+
+	if (destination == DESTINATION_PROCESSOR) {
+		ret = nvdla_read_cpu_address(driver_context, task_data,
+									 index, dst_ptr);
+	} else if (destination == DESTINATION_DMA) {
+		ret = nvdla_read_dma_address(driver_context, task_data,
+									 index, dst_ptr);
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+int32_t nvdla_data_write(void *driver_context, void *task_data,
+						 void *src, uint64_t dst,
+						 uint32_t size, uint64_t offset)
+{
+	int32_t ret;
+	struct dma_buf *buf;
+	struct iosys_map map;
+	struct nvdla_mem_handle *handles;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+	struct nvdla_device *nvdla_dev = (struct nvdla_device *)driver_context;
+
+	handles = task->address_list;
+	buf = dma_buf_get(handles[dst].handle);
+	if (IS_ERR(buf)) {
+		drm_err(nvdla_dev->drm, "Failed get dma_buf for handle=%d\n",
+				handles[dst].handle);
+		return -EFAULT;
+	}
+
+	ret = dma_buf_begin_cpu_access(buf, DMA_BIDIRECTIONAL);
+	if (ret)
+		goto put_dma_buf;
+
+	ret = dma_buf_vmap(buf, &map);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to vmap dma_buf for handle=%d err %d\n",
+				handles[dst].handle, ret);
+		goto end_cpu_access;
+	}
+	if (iosys_map_is_null(&map)) {
+		ret = -ENOMEM;
+		goto end_cpu_access;
+	}
+
+	iosys_map_memcpy_to(&map, offset, src, size);
+
+	dma_buf_vunmap(buf, &map);
+
+end_cpu_access:
+	dma_buf_end_cpu_access(buf, DMA_BIDIRECTIONAL);
+
+put_dma_buf:
+	dma_buf_put(buf);
+
+	return ret;
+}
+
+int32_t nvdla_data_read(void *driver_context, void *task_data,
+				uint64_t src, void *dst,
+				uint32_t size, uint64_t offset)
+{
+	int32_t ret;
+	struct dma_buf *buf;
+	struct iosys_map map;
+	struct nvdla_mem_handle *handles;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+	struct nvdla_device *nvdla_dev = (struct nvdla_device *)driver_context;
+
+	handles = task->address_list;
+
+	buf = dma_buf_get(handles[src].handle);
+	if (IS_ERR(buf)) {
+		drm_err(nvdla_dev->drm, "Failed get dma_buf for handle=%d\n",
+				handles[src].handle);
+		return -EFAULT;
+	}
+
+	ret = dma_buf_begin_cpu_access(buf, DMA_BIDIRECTIONAL);
+	if (ret)
+		goto put_dma_buf;
+	ret = dma_buf_vmap(buf, &map);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to vmap dma_buf for handle=%d red %d\n",
+				handles[src].handle, ret);
+		goto end_cpu_access;
+	}
+	if (iosys_map_is_null(&map)) {
+		ret = -ENOMEM;
+		goto end_cpu_access;
+	}
+
+	iosys_map_memcpy_from(dst, &map, offset, size);
+
+	dma_buf_vunmap(buf, &map);
+
+end_cpu_access:
+	dma_buf_end_cpu_access(buf, DMA_BIDIRECTIONAL);
+
+put_dma_buf:
+	dma_buf_put(buf);
+
+	return ret;
+}
+
+int32_t nvdla_task_submit(struct nvdla_device *nvdla_dev, struct nvdla_task *task)
+{
+	int32_t err = 0;
+	uint32_t task_complete = 0;
+
+	//trace_printk("__nvdla_task_submit_entry\n");
+	nvdla_dev->task = task;
+
+	err = nvdla_execute_task(nvdla_dev->engine_context, (void *)task, nvdla_dev->config_data);
+	if (err) {
+		drm_err(nvdla_dev->drm, "Task execution failed\n");
+		return err;
+	}
+
+	drm_dbg(nvdla_dev->drm, "Wait for task complete\n");
+
+	while (1) {
+		unsigned long flags;
+
+		wait_for_completion(&nvdla_dev->event_notifier);
+
+		spin_lock_irqsave(&nvdla_dev->nvdla_lock, flags);
+
+		err = nvdla_process_events(nvdla_dev->engine_context, &task_complete);
+
+		spin_unlock_irqrestore(&nvdla_dev->nvdla_lock, flags);
+
+		if (err || task_complete)
+			break;
+	}
+
+	drm_dbg(nvdla_dev->drm, "Task complete\n");
+	nvdla_clear_task(nvdla_dev->engine_context);
+	//trace_printk("__nvdla_task_submit_exit\n");
+
+	return err;
+}
+
+static union nvdla_operation_container operation_desc[NVDLA_OP_NUM][NVDLA_NUM_GROUPS];
+static union nvdla_surface_container surface_desc[NVDLA_OP_NUM][NVDLA_NUM_GROUPS];
+
+static struct nvdla_task_desc global_task;
+
+static struct nvdla_engine engine = {
+	.processors[NVDLA_OP_BDMA] = {
+		.name = "BDMA",
+		.op_type = NVDLA_OP_BDMA,
+		.program = nvdla_bdma_program,
+		.enable = nvdla_bdma_enable,
+		.set_producer = nvdla_bdma_set_producer,
+		.is_ready = nvdla_bdma_is_ready,
+		.dump_config = nvdla_bdma_dump_config,
+		.rdma_check = nvdla_bdma_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_BDMA][0],
+			.surface_desc = &surface_desc[NVDLA_OP_BDMA][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_BDMA][1],
+			.surface_desc = &surface_desc[NVDLA_OP_BDMA][1],
+		},
+	},
+	.processors[NVDLA_OP_CONV] = {
+		.name = "Convolution",
+		.op_type = NVDLA_OP_CONV,
+		.program = nvdla_conv_program,
+		.enable = nvdla_conv_enable,
+		.set_producer = nvdla_conv_set_producer,
+		.is_ready = nvdla_conv_is_ready,
+		.dump_config = nvdla_conv_dump_config,
+		.rdma_check = nvdla_conv_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_CONV][0],
+			.surface_desc = &surface_desc[NVDLA_OP_CONV][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_CONV][1],
+			.surface_desc = &surface_desc[NVDLA_OP_CONV][1],
+		},
+	},
+	.processors[NVDLA_OP_SDP] = {
+		.name = "SDP",
+		.op_type = NVDLA_OP_SDP,
+		.program = nvdla_sdp_program,
+		.enable = nvdla_sdp_enable,
+		.set_producer = nvdla_sdp_set_producer,
+		.is_ready = nvdla_sdp_is_ready,
+		.dump_config = nvdla_sdp_dump_config,
+		.rdma_check = nvdla_sdp_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_SDP][0],
+			.surface_desc = &surface_desc[NVDLA_OP_SDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_SDP][1],
+			.surface_desc = &surface_desc[NVDLA_OP_SDP][1],
+		},
+	},
+	.processors[NVDLA_OP_PDP] = {
+		.name = "PDP",
+		.op_type = NVDLA_OP_PDP,
+		.program = nvdla_pdp_program,
+		.enable = nvdla_pdp_enable,
+		.set_producer = nvdla_pdp_set_producer,
+		.is_ready = nvdla_pdp_is_ready,
+		.dump_config = nvdla_pdp_dump_config,
+		.rdma_check = nvdla_pdp_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_PDP][0],
+			.surface_desc = &surface_desc[NVDLA_OP_PDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_PDP][1],
+			.surface_desc = &surface_desc[NVDLA_OP_PDP][1],
+		},
+	},
+	.processors[NVDLA_OP_CDP] = {
+		.name = "CDP",
+		.op_type = NVDLA_OP_CDP,
+		.program = nvdla_cdp_program,
+		.enable = nvdla_cdp_enable,
+		.set_producer = nvdla_cdp_set_producer,
+		.is_ready = nvdla_cdp_is_ready,
+		.dump_config = nvdla_cdp_dump_config,
+		.rdma_check = nvdla_cdp_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_CDP][0],
+			.surface_desc = &surface_desc[NVDLA_OP_CDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_CDP][1],
+			.surface_desc = &surface_desc[NVDLA_OP_CDP][1],
+		},
+	},
+
+	.processors[NVDLA_OP_RUBIK] = {
+		.name = "RUBIK",
+		.op_type = NVDLA_OP_RUBIK,
+		.program = nvdla_rubik_program,
+		.enable = nvdla_rubik_enable,
+		.set_producer = nvdla_rubik_set_producer,
+		.is_ready = nvdla_rubik_is_ready,
+		.dump_config = nvdla_rubik_dump_config,
+		.rdma_check = nvdla_rubik_rdma_check,
+		.consumer_ptr = 0,
+		.roi_index = 0,
+		.group_status = 0,
+		.rdma_status = 0,
+		.last_group = 1,
+		.groups[0] = {
+			.id = 0,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_RUBIK][0],
+			.surface_desc = &surface_desc[NVDLA_OP_RUBIK][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[NVDLA_OP_RUBIK][1],
+			.surface_desc = &surface_desc[NVDLA_OP_RUBIK][1],
+		},
+	},
+
+};
+
+/* driver probe and init */
+static const struct of_device_id nvdla_of_match[] = {
+	{
+		.compatible = "nvidia,nvdla_os_initial",
+		.data = &nvdla_config_os_initial,
+	},
+	{
+		.compatible = "nvidia,nvdla_2",
+		.data = &nvdla_config_small,
+	},
+	{ },
+};
+
+static int32_t nvdla_probe(struct platform_device *pdev)
+{
+	int32_t err = 0;
+	struct resource *res;
+	struct nvdla_device *nvdla_dev;
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
+
+	if (!pdev->dev.of_node)
+		return -EINVAL;
+
+	match = of_match_device(nvdla_of_match, &pdev->dev);
+	if (!match) {
+		pr_err("Missing DT entry!\n");
+		return -EINVAL;
+	}
+
+	nvdla_dev = devm_kzalloc(dev, sizeof(*nvdla_dev), GFP_KERNEL);
+	if (!nvdla_dev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, nvdla_dev);
+	nvdla_dev->pdev = pdev;
+	nvdla_dev->config_data = (struct nvdla_config *)match->data;
+
+	init_completion(&nvdla_dev->event_notifier);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nvdla_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nvdla_dev->base))
+		return PTR_ERR(nvdla_dev->base);
+
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "no irq resource\n");
+		return -EINVAL;
+	}
+	nvdla_dev->irq = res->start;
+
+	err = devm_request_irq(&pdev->dev, nvdla_dev->irq,
+				nvdla_engine_isr, 0,
+				dev_name(&pdev->dev), nvdla_dev);
+	if (err)
+		return err;
+
+	nvdla_dev->engine_context = &engine;
+	engine.task = &global_task;
+	engine.driver_context = (void *)nvdla_dev;
+	engine.task->task_data = NULL;
+
+	nvdla_init_op_cache(&engine);
+	nvdla_clear_task(nvdla_dev->engine_context);
+
+	err = nvdla_drm_probe(nvdla_dev);
+	if (err)
+		dev_err(&pdev->dev, "failed to register drm device\n");
+
+	return err;
+}
+
+static int32_t __exit nvdla_remove(struct platform_device *pdev)
+{
+	struct nvdla_device *nvdla_dev = dev_get_drvdata(&pdev->dev);
+
+	nvdla_drm_remove(nvdla_dev);
+
+	return 0;
+}
+
+static struct platform_driver nvdla_driver = {
+	.probe = nvdla_probe,
+	.remove = __exit_p(nvdla_remove),
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "NVDLA",
+		.of_match_table = of_match_ptr(nvdla_of_match),
+	},
+};
+module_platform_driver(nvdla_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Nvidia Deep Learning Accelerator driver");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/gpu/drm/nvdla/nvdla_drv.h b/drivers/gpu/drm/nvdla/nvdla_drv.h
new file mode 100644
index 000000000000..718d2c37ee94
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_drv.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_DRV_H_
+#define __NVDLA_DRV_H_
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+#include "nvdla_engine.h"
+
+#define ASSERT_GOTO(_condition, _ret, _err_value, _goto)	   \
+do {														   \
+	if (!(_condition)) {									   \
+		_ret = _err_value;									   \
+		pr_err("%s:%d failed %d\n", __func__, __LINE__, _ret); \
+		goto _goto;											   \
+	} else {												   \
+		_ret = 0;											   \
+	}														   \
+} while (0)
+
+/**
+ * @brief			Task information submitted from user space
+ *
+ * ref				Reference count for task
+ * num_addresses		Number of addresses in address list
+ * nvdla_dev			Pointer to NVDLA device
+ * address_list			Address list
+ * file				DRM file instance
+ */
+struct nvdla_task {
+	struct kref ref;
+	uint32_t num_addresses;
+	struct nvdla_device *nvdla_dev;
+	struct nvdla_mem_handle *address_list;
+	struct drm_file *file;
+};
+
+/**
+ * @brief			Configuration parameters supported by the engine
+ *
+ * atom_size			Memory smallest access size
+ * bdma_enable			Defines whether bdma is supported
+ * rubik_enable			Defines whether rubik is supported
+ * weight_compress_support	Defines whether weight data compression is supported
+ */
+struct nvdla_config {
+	uint32_t atom_size;
+	bool bdma_enable;
+	bool rubik_enable;
+	bool weight_compress_support;
+};
+
+/**
+ * @brief			NVDLA device
+ *
+ * irq				Interrupt number associated with this device
+ * ref				Reference count for device
+ * base				IO mapped base address for device
+ * nvdla_lock			Spinlock used for synchronization
+ * drm				DRM device instance
+ * task				Pointer to task in execution
+ * config_data			Pointer to the configuration data
+ * pdev				Pointer to NVDLA platform device
+ * event_notifier		Completion object used to wait for events from HW
+ * engine_context		Private data passed from engine in nvdla_engine_init
+ */
+struct nvdla_device {
+	int32_t irq;
+	struct kref ref;
+	void __iomem *base;
+	spinlock_t nvdla_lock;
+	struct drm_device *drm;
+	struct nvdla_task *task;
+	struct nvdla_config *config_data;
+	struct platform_device *pdev;
+	struct completion event_notifier;
+
+	struct nvdla_engine *engine_context;
+};
+
+int32_t nvdla_task_submit(struct nvdla_device *nvdla_dev, struct nvdla_task *task);
+
+int32_t nvdla_gem_dma_addr(struct drm_device *dev, struct drm_file *file,
+					uint32_t fd, dma_addr_t *addr);
+
+int32_t nvdla_drm_probe(struct nvdla_device *nvdla_dev);
+
+void nvdla_drm_remove(struct nvdla_device *nvdla_dev);
+
+int32_t nvdla_process_events(struct nvdla_engine *engine_context, uint32_t *task_complete);
+
+void nvdla_clear_task(struct nvdla_engine *engine_context);
+
+int32_t nvdla_execute_task(struct nvdla_engine *engine_context, void *task_data, void *config_data);
+
+uint32_t nvdla_reg_read(void *driver_context, uint32_t addr);
+
+void nvdla_reg_write(void *driver_context, uint32_t addr, uint32_t reg);
+
+int32_t nvdla_data_read(void *driver_context, void *task_data,
+				uint64_t src, void *dst,
+				uint32_t size, uint64_t offset);
+
+int32_t nvdla_data_write(void *driver_context, void *task_data,
+				void *src, uint64_t dst,
+				uint32_t size, uint64_t offset);
+
+/* Destination for DMA buffer */
+#define DESTINATION_PROCESSOR	0
+#define DESTINATION_DMA		1
+
+int32_t nvdla_get_dma_address(void *driver_context, void *task_data,
+					int16_t index, void *dst_ptr,
+					uint32_t destination);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_engine.c b/drivers/gpu/drm/nvdla/nvdla_engine.c
new file mode 100644
index 000000000000..0b6553bc83c4
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_engine.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+static const uint32_t map_rdma_ptr_addr[] = {
+	0xFFFFFFFF,
+	0xFFFFFFFF,
+	SDP_REG(RDMA_S_POINTER),
+	PDP_REG(RDMA_S_POINTER),
+	CDP_REG(RDMA_S_POINTER),
+	0xFFFFFFFF,
+};
+
+static const uint32_t map_sts_addr[] = {
+	BDMA_REG(STATUS),
+	CACC_REG(S_STATUS),
+	SDP_REG(S_STATUS),
+	PDP_REG(S_STATUS),
+	CDP_REG(S_STATUS),
+	RBK_REG(S_STATUS),
+};
+
+static const uint32_t map_ptr_addr[] = {
+	BDMA_REG(STATUS),
+	CACC_REG(S_POINTER),
+	SDP_REG(S_POINTER),
+	PDP_REG(S_POINTER),
+	CDP_REG(S_POINTER),
+	RBK_REG(S_POINTER),
+};
+
+uint32_t reg_read(struct nvdla_engine *engine, uint32_t addr)
+{
+	return nvdla_reg_read(engine->driver_context, addr);
+}
+
+void reg_write(struct nvdla_engine *engine, uint32_t addr, uint32_t reg)
+{
+	nvdla_reg_write(engine->driver_context, addr, reg);
+}
+
+int32_t nvdla_enable_intr(struct nvdla_engine *engine, uint32_t mask)
+{
+	uint32_t reg = glb_reg_read(engine, S_INTR_MASK);
+
+	reg = reg & (~mask);
+	glb_reg_write(engine, S_INTR_MASK, reg);
+
+	return 0;
+}
+
+uint8_t bdma_grp_sts[2] = {
+	FIELD_ENUM(BDMA_STATUS_0, IDLE, YES),
+	FIELD_ENUM(BDMA_STATUS_0, IDLE, YES)
+};
+
+struct nvdla_roi_desc roi_desc;
+
+/**
+ * Get DMA data cube address
+ */
+int32_t
+nvdla_get_dma_cube_address(void *driver_context, void *task_data,
+						 int16_t index, uint32_t offset, void *dst_ptr,
+						 uint32_t destination)
+{
+	int32_t ret = 0;
+	uint64_t *pdst = (uint64_t *)dst_ptr;
+       ret = nvdla_get_dma_address(driver_context, task_data, index,
+								dst_ptr, destination);
+	if (ret)
+		goto exit;
+
+	pdst[0] += offset;
+
+exit:
+	return ret;
+}
+
+/**
+ * Read input buffer address
+ *
+ * For input layer, in case of static ROI this address is read
+ * from address list and index is specified in data cube. In case
+ * dynamic ROI, it has to be read depending on ROI information
+ * and using surface address
+ *
+ * For all other layers, this address is read from address list
+ * using index specified in data cube
+ */
+int
+nvdla_read_input_address(struct nvdla_engine *engine, struct nvdla_data_cube *data,
+					   uint64_t *address, int16_t op_index,
+					   uint8_t roi_index, uint8_t bpp)
+{
+	uint64_t roi_desc_addr;
+	int32_t ret = -EINVAL;
+
+	/**
+	 * If memory type is HW then no address required
+	 */
+	if (data->type == NVDLA_MEM_HW) {
+		ret = 0;
+		goto exit;
+	}
+
+	/**
+	 * If address list index is not -1 means this address has to
+	 * be read from address list
+	 */
+	if (data->address != -1) {
+
+		/**
+		 * But if other parameters indicate that this is input layer
+		 * for dynamic ROI then it is an error
+		 */
+		if (engine->network->dynamic_roi &&
+			engine->network->input_layer == op_index)
+			goto exit;
+		ret = nvdla_get_dma_cube_address(engine->driver_context,
+						engine->task->task_data,
+						data->address,
+						data->offset,
+						(void *)address,
+						DESTINATION_DMA);
+		goto exit;
+	}
+
+	/**
+	 * Check if it is dynamic ROI and this is input layer
+	 */
+	if (engine->network->dynamic_roi && engine->network->input_layer == op_index) {
+		if (!engine->task->surface_addr)
+			goto exit;
+
+		/* Calculate address of ROI descriptor in array */
+		roi_desc_addr = engine->task->roi_array_addr;
+
+		/* Read ROI descriptor */
+		ret = nvdla_data_read(engine->driver_context,
+				engine->task->task_data,
+				roi_desc_addr,
+				(void *)&roi_desc,
+				sizeof(roi_desc),
+				sizeof(struct nvdla_roi_array_desc) +
+				roi_index * sizeof(struct nvdla_roi_desc));
+		if (ret)
+			goto exit;
+
+		/* Calculate ROI address */
+		*address = engine->task->surface_addr;
+		*address += (roi_desc.top * data->line_stride) +
+						(bpp * roi_desc.left);
+	}
+
+exit:
+	return ret;
+}
+
+int
+utils_get_free_group(struct nvdla_engine *engine, struct nvdla_processor *processor,
+					 uint8_t *group_id, uint8_t *rdma_id)
+{
+	int32_t ret = 0;
+	uint32_t pointer;
+	uint32_t hw_consumer_ptr;
+	uint32_t hw_rdma_ptr;
+
+	hw_rdma_ptr = 0;
+
+	if (processor->op_type == NVDLA_OP_BDMA) {
+		pointer = reg_read(engine, map_ptr_addr[processor->op_type]);
+		hw_consumer_ptr = ((pointer & MASK(BDMA_STATUS_0, GRP0_BUSY)) >>
+				SHIFT(BDMA_STATUS_0, GRP0_BUSY)) ==
+				FIELD_ENUM(BDMA_STATUS_0, GRP0_BUSY, YES) ?
+				1 : 0;
+	} else {
+		pointer = reg_read(engine, map_ptr_addr[processor->op_type]);
+		hw_consumer_ptr = (pointer & MASK(CDP_S_POINTER_0, CONSUMER)) >>
+				SHIFT(CDP_S_POINTER_0, CONSUMER);
+
+		/**
+		 * Read current consumer pointer for RDMA only if processor
+		 * has RDMA module
+		 */
+		if (map_rdma_ptr_addr[processor->op_type] != 0xFFFFFFFF) {
+			pointer =
+			reg_read(engine, map_rdma_ptr_addr[processor->op_type]);
+			hw_rdma_ptr = (pointer &
+					MASK(CDP_S_POINTER_0, CONSUMER)) >>
+					SHIFT(CDP_S_POINTER_0, CONSUMER);
+		}
+	}
+
+	/**
+	 * If both processors are programmed then exit
+	 */
+	if (processor->group_status == 0x3) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	if (!processor->group_status)
+		/**
+		 * If both groups are idle then use consumer pointer
+		 */
+		*group_id = hw_consumer_ptr;
+	else
+		/**
+		 * Here it is assumed that only one group is idle or busy
+		 * and hence right shift will work to get correct
+		 * group id
+		 */
+		*group_id = !(processor->group_status >> 1);
+
+	/**
+	 * If both groups are idle then read group id from pointer
+	 */
+	if (!processor->rdma_status)
+		*rdma_id = hw_rdma_ptr;
+	else
+		*rdma_id = !(processor->rdma_status >> 1);
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_engine.h b/drivers/gpu/drm/nvdla/nvdla_engine.h
new file mode 100644
index 000000000000..57b85679de79
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_engine.h
@@ -0,0 +1,272 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_ENGINE_H_
+#define __NVDLA_ENGINE_H_
+
+#include "nvdla_common.h"
+#include "nvdla_sched.h"
+#include "nvdla_engine.h"
+#include "nvdla_reg.h"
+
+/*********************************************************/
+/******************** Utilities **************************/
+/*********************************************************/
+#define MASK(reg, field)		(reg##_##field##_FIELD)
+#define FIELD_ENUM(r, f, e)		(r##_##f##_##e)
+#define SHIFT(reg, field)		(reg##_##field##_SHIFT)
+
+#define GLB_REG(name)                GLB_##name##_0
+#define MCIF_REG(name)               MCIF_##name##_0
+#define CVIF_REG(name)               CVIF_##name##_0
+#define BDMA_REG(name)               BDMA_##name##_0
+#define CDMA_REG(name)               CDMA_##name##_0
+#define CSC_REG(name)                CSC_##name##_0
+#define CMAC_A_REG(name)             CMAC_A_##name##_0
+#define CMAC_B_REG(name)             CMAC_B_##name##_0
+#define CACC_REG(name)               CACC_##name##_0
+#define SDP_RDMA_REG(name)           SDP_RDMA_##name##_0
+#define SDP_REG(name)                SDP_##name##_0
+#define PDP_RDMA_REG(name)           PDP_RDMA_##name##_0
+#define PDP_REG(name)                PDP_##name##_0
+#define CDP_RDMA_REG(name)           CDP_RDMA_##name##_0
+#define CDP_REG(name)                CDP_##name##_0
+#define RBK_REG(name)                RBK_##name##_0
+
+/* alias for register read for each sub-module */
+#define glb_reg_read(engine, reg)           reg_read(engine, GLB_REG(reg))
+#define bdma_reg_read(engine, reg)          reg_read(engine, BDMA_REG(reg))
+#define cdma_reg_read(engine, reg)          reg_read(engine, CDMA_REG(reg))
+#define csc_reg_read(engine, reg)           reg_read(engine, CSC_REG(reg))
+#define cmac_a_reg_read(engine, reg)        reg_read(engine, CMAC_A_REG(reg))
+#define cmac_b_reg_read(engine, reg)        reg_read(engine, CMAC_B_REG(reg))
+#define cacc_reg_read(engine, reg)          reg_read(engine, CACC_REG(reg))
+#define sdp_rdma_reg_read(engine, reg)      reg_read(engine, SDP_RDMA_REG(reg))
+#define sdp_reg_read(engine, reg)           reg_read(engine, SDP_REG(reg))
+#define pdp_rdma_reg_read(engine, reg)      reg_read(engine, PDP_RDMA_REG(reg))
+#define pdp_reg_read(engine, reg)           reg_read(engine, PDP_REG(reg))
+#define cdp_rdma_reg_read(engine, reg)      reg_read(engine, CDP_RDMA_REG(reg))
+#define cdp_reg_read(engine, reg)           reg_read(engine, CDP_REG(reg))
+#define rubik_reg_read(engine, reg)         reg_read(engine, RBK_REG(reg))
+
+/* alias for register write for each sub-module */
+#define glb_reg_write(engine, reg, val)      reg_write(engine, GLB_REG(reg), val)
+#define bdma_reg_write(engine, reg, val)     reg_write(engine, BDMA_REG(reg), val)
+#define cdma_reg_write(engine, reg, val)     reg_write(engine, CDMA_REG(reg), val)
+#define csc_reg_write(engine, reg, val)      reg_write(engine, CSC_REG(reg), val)
+#define cmac_a_reg_write(engine, reg, val)   reg_write(engine, CMAC_A_REG(reg), val)
+#define cmac_b_reg_write(engine, reg, val)   reg_write(engine, CMAC_B_REG(reg), val)
+#define cacc_reg_write(engine, reg, val)     reg_write(engine, CACC_REG(reg), val)
+#define sdp_rdma_reg_write(engine, reg, val) reg_write(engine, SDP_RDMA_REG(reg), val)
+#define sdp_reg_write(engine, reg, val)      reg_write(engine, SDP_REG(reg), val)
+#define pdp_rdma_reg_write(engine, reg, val) reg_write(engine, PDP_RDMA_REG(reg), val)
+#define pdp_reg_write(engine, reg, val)      reg_write(engine, PDP_REG(reg), val)
+#define cdp_rdma_reg_write(engine, reg, val) reg_write(engine, CDP_RDMA_REG(reg), val)
+#define cdp_reg_write(engine, reg, val)      reg_write(engine, CDP_REG(reg), val)
+#define rubik_reg_write(engine, reg, val)    reg_write(engine, RBK_REG(reg), val)
+
+struct nvdla_processor_group {
+	uint8_t id;
+	uint8_t rdma_id;
+	uint8_t active;
+	uint8_t events;
+	uint8_t roi_index;
+	uint8_t is_rdma_needed;
+	uint8_t pending;
+	int32_t lut_index;
+	uint8_t programming;
+
+	struct nvdla_common_op_desc *op_desc;
+	struct nvdla_common_op_desc *consumers[NVDLA_OP_NUM];
+	struct nvdla_common_op_desc *fused_parent;
+	union nvdla_operation_container *operation_desc;
+	union nvdla_surface_container *surface_desc;
+};
+
+struct nvdla_processor {
+	const char *name;
+	uint8_t op_type;
+	uint8_t consumer_ptr;
+	uint8_t roi_index;
+	uint8_t group_status;
+	uint8_t rdma_status;
+	uint8_t last_group;
+
+	struct nvdla_common_op_desc *tail_op;
+	struct nvdla_processor_group groups[NVDLA_NUM_GROUPS];
+	struct nvdla_engine *engine;
+
+	int (*is_ready)(struct nvdla_processor *processor,
+				  struct nvdla_processor_group *group);
+	int (*enable)(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+	int (*program)(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+	void (*set_producer)(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_id);
+	void (*dump_config)(struct nvdla_processor_group *group);
+	void (*rdma_check)(struct nvdla_processor_group *group);
+};
+
+struct nvdla_engine {
+	struct nvdla_task_desc *task;
+	struct nvdla_config *config_data;
+	struct nvdla_network_desc *network;
+	struct nvdla_processor processors[NVDLA_OP_NUM];
+
+	uint16_t num_proc_hwl;
+	int32_t status;
+
+	void *driver_context;
+};
+
+void reg_write(struct nvdla_engine *engine, uint32_t addr, uint32_t reg);
+uint32_t reg_read(struct nvdla_engine *engine, uint32_t addr);
+
+/**
+ * Operation descriptor cache functions
+ */
+void
+nvdla_put_op_desc(struct nvdla_engine *engine, struct nvdla_common_op_desc *op_desc);
+struct nvdla_common_op_desc
+*nvdla_get_op_desc(struct nvdla_engine *engine, struct nvdla_task_desc *task,
+			   int16_t index,
+			   uint8_t op_type,
+			   uint8_t roi_index);
+void
+nvdla_get_refcount(struct nvdla_common_op_desc *op_desc);
+void
+nvdla_init_op_cache(struct nvdla_engine *engine);
+
+/**
+ * Operation completion handler
+ */
+int
+nvdla_op_completion(struct nvdla_engine *engine, struct nvdla_processor *processor,
+		      struct nvdla_processor_group *group);
+
+int32_t
+nvdla_read_lut(struct nvdla_engine *engine, int16_t index, void *dst);
+int
+nvdla_enable_intr(struct nvdla_engine *engine, uint32_t mask);
+int
+utils_get_free_group(struct nvdla_engine *engine, struct nvdla_processor *processor,
+			uint8_t *group_id,
+			uint8_t *rdma_id);
+int32_t
+nvdla_get_dma_cube_address(void *driver_context,
+						void *task_data,
+						int16_t index,
+						uint32_t offset,
+						void *dst_ptr,
+						uint32_t destination);
+int
+nvdla_read_input_address(struct nvdla_engine *engine, struct nvdla_data_cube *data,
+		       uint64_t *address,
+		       int16_t op_index,
+		       uint8_t roi_index,
+		       uint8_t bpp);
+
+/**
+ * BDMA operations
+ */
+void
+nvdla_bdma_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_bdma_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_bdma_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_bdma_is_ready(struct nvdla_processor *processor,
+			    struct nvdla_processor_group *group);
+void
+nvdla_bdma_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_bdma_rdma_check(struct nvdla_processor_group *group);
+
+/**
+ * Convolution operations
+ */
+void
+nvdla_conv_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_conv_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_conv_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_conv_is_ready(struct nvdla_processor *processor,
+			    struct nvdla_processor_group *group);
+void
+nvdla_conv_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_conv_rdma_check(struct nvdla_processor_group *group);
+
+/**
+ * SDP operations
+ */
+void
+nvdla_sdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_sdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_sdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_sdp_is_ready(struct nvdla_processor *processor,
+			   struct nvdla_processor_group *group);
+void
+nvdla_sdp_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_sdp_rdma_check(struct nvdla_processor_group *group);
+
+/**
+ * PDP operations
+ */
+void
+nvdla_pdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_pdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_pdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_pdp_is_ready(struct nvdla_processor *processor,
+			   struct nvdla_processor_group *group);
+void
+nvdla_pdp_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_pdp_rdma_check(struct nvdla_processor_group *group);
+
+/**
+ * CDP operations
+ */
+void
+nvdla_cdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_cdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_cdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_cdp_is_ready(struct nvdla_processor *processor,
+			   struct nvdla_processor_group *group);
+void
+nvdla_cdp_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_cdp_rdma_check(struct nvdla_processor_group *group);
+
+/**
+ * RUBIK operations
+ */
+void
+nvdla_rubik_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+nvdla_rubik_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_rubik_program(struct nvdla_engine *engine, struct nvdla_processor_group *group);
+int
+nvdla_rubik_is_ready(struct nvdla_processor *processor,
+			     struct nvdla_processor_group *group);
+void
+nvdla_rubik_dump_config(struct nvdla_processor_group *group);
+void
+nvdla_rubik_rdma_check(struct nvdla_processor_group *group);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_gem.c b/drivers/gpu/drm/nvdla/nvdla_gem.c
new file mode 100644
index 000000000000..1e75eed9b7b4
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_gem.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include <linux/dma-buf.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/nvdla_drm.h>
+
+#include "nvdla_drv.h"
+
+#define to_nvdla_obj(x) container_of(x, struct nvdla_gem_object, object)
+
+struct nvdla_gem_object {
+	struct drm_gem_object object;
+
+	struct iosys_map map;
+
+	dma_addr_t dma_addr;
+	unsigned long dma_attrs;
+};
+
+static int32_t nvdla_fill_task_desc(struct nvdla_ioctl_submit_task *local_task,
+				struct nvdla_task *task)
+{
+	struct nvdla_mem_handle *handles;
+
+	/* update task desc fields */
+	task->num_addresses = local_task->num_addresses;
+
+	handles = kzalloc(local_task->num_addresses * sizeof(struct nvdla_mem_handle),
+					  GFP_KERNEL);
+	if (handles == NULL)
+		return -EFAULT;
+
+	/* get user addresses list */
+	if (copy_from_user(handles,
+		(void __user *)local_task->address_list,
+		(task->num_addresses *
+			sizeof(struct nvdla_mem_handle)))) {
+		pr_err("failed to copy address list from user ptr\n");
+		kfree(handles);
+		return -EFAULT;
+	}
+
+	task->address_list = handles;
+
+	return 0;
+}
+
+static int32_t nvdla_submit(struct drm_device *drm, void *arg,
+					struct drm_file *file)
+{
+	int32_t err = 0;
+	struct nvdla_task *task;
+	struct nvdla_ioctl_submit_task local_task;
+	struct nvdla_ioctl_submit_task __user *user_task;
+	struct nvdla_device *nvdla_dev = dev_get_drvdata(drm->dev);
+	struct nvdla_submit_args *args =
+			(struct nvdla_submit_args *)arg;
+
+	user_task = (struct nvdla_ioctl_submit_task __user *)
+			(uintptr_t)args->tasks;
+	if (!user_task)
+		return -EINVAL;
+
+	/* IOCTL copy descriptors */
+	if (copy_from_user(&local_task, (void __user *)user_task,
+			(sizeof(*user_task))))
+		return -EFAULT;
+
+	task = kzalloc(sizeof(*task), GFP_KERNEL);
+	if (task == NULL)
+		return -EFAULT;
+
+	nvdla_dev->task = task;
+	kref_init(&task->ref);
+	task->nvdla_dev = nvdla_dev;
+	task->file = file;
+
+	/* update task desc fields */
+	err = nvdla_fill_task_desc(&local_task, task);
+	if (err)
+		goto free_task_desc;
+
+	err = nvdla_task_submit(nvdla_dev, task);
+
+	kfree(task->address_list);
+
+free_task_desc:
+	kfree(task);
+	return err;
+}
+
+static int32_t nvdla_gem_alloc(struct nvdla_gem_object *nobj)
+{
+	struct drm_gem_object *dobj = &nobj->object;
+	struct drm_device *drm = dobj->dev;
+	void *kvaddr;
+
+	nobj->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+	kvaddr = dma_alloc_attrs(drm->dev, dobj->size, &nobj->dma_addr,
+							 GFP_KERNEL, nobj->dma_attrs);
+	if (!kvaddr)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr(&nobj->map, kvaddr);
+
+	return 0;
+}
+
+static void nvdla_gem_free(struct nvdla_gem_object *nobj)
+{
+	struct drm_gem_object *dobj = &nobj->object;
+	struct drm_device *drm = dobj->dev;
+
+	dma_free_attrs(drm->dev, dobj->size, nobj->map.vaddr, nobj->dma_addr,
+				   nobj->dma_attrs);
+}
+
+static void nvdla_gem_free_object(struct drm_gem_object *dobj)
+{
+	struct nvdla_gem_object *nobj;
+
+	drm_gem_free_mmap_offset(dobj);
+
+	nobj = to_nvdla_obj(dobj);
+
+	nvdla_gem_free(nobj);
+
+	kfree(nobj);
+}
+
+static struct nvdla_gem_object *
+nvdla_gem_create_object(struct drm_device *drm, uint32_t size)
+{
+	int32_t ret;
+	struct drm_gem_object *dobj;
+	struct nvdla_gem_object *nobj;
+
+	size = round_up(size, PAGE_SIZE);
+
+	nobj = kzalloc(sizeof(*nobj), GFP_KERNEL);
+	if (!nobj)
+		return ERR_PTR(-ENOMEM);
+
+	dobj = &nobj->object;
+
+	drm_gem_private_object_init(drm, dobj, size);
+
+	ret = nvdla_gem_alloc(nobj);
+	if (ret)
+		goto free_nvdla_obj;
+
+	return nobj;
+
+free_nvdla_obj:
+	kfree(nobj);
+	return ERR_PTR(ret);
+}
+
+static struct sg_table*
+nvdla_drm_gem_prime_get_sg_table(struct drm_gem_object *dobj)
+{
+	int32_t ret;
+	struct sg_table *sgt;
+	struct drm_device *drm = dobj->dev;
+	struct nvdla_gem_object *nobj = to_nvdla_obj(dobj);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = dma_get_sgtable_attrs(drm->dev, sgt, nobj->map.vaddr,
+				    nobj->dma_addr, dobj->size,
+				    nobj->dma_attrs);
+	if (ret) {
+		DRM_ERROR("failed to allocate sgt, %d\n", ret);
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	return sgt;
+}
+
+static int nvdla_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct nvdla_gem_object *nobj = to_nvdla_obj(obj);
+
+	*map = nobj->map;
+
+	return 0;
+}
+
+static void nvdla_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	/* Nothing to do */
+}
+
+static int32_t nvdla_drm_gem_object_mmap(struct drm_gem_object *dobj,
+					struct vm_area_struct *vma)
+{
+	int32_t ret;
+	struct nvdla_gem_object *nobj = to_nvdla_obj(dobj);
+	struct drm_device *drm = dobj->dev;
+
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_pgoff -= drm_vma_node_start(&dobj->vma_node);
+
+	ret = dma_mmap_attrs(drm->dev, vma, nobj->map.vaddr, nobj->dma_addr,
+			     dobj->size, nobj->dma_attrs);
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+static const struct drm_gem_object_funcs nvdla_gem_object_funcs = {
+	.free = nvdla_gem_free_object,
+	.get_sg_table = nvdla_drm_gem_prime_get_sg_table,
+	.vmap = nvdla_drm_gem_prime_vmap,
+	.vunmap = nvdla_drm_gem_prime_vunmap,
+	.mmap = nvdla_drm_gem_object_mmap,
+};
+
+static struct nvdla_gem_object*
+nvdla_gem_create_with_handle(struct drm_file *file_priv,
+							 struct drm_device *drm, uint32_t size,
+							 uint32_t *handle)
+{
+	int32_t ret;
+	struct drm_gem_object *dobj;
+	struct nvdla_gem_object *nobj;
+
+	nobj = nvdla_gem_create_object(drm, size);
+	if (IS_ERR(nobj))
+		return ERR_CAST(nobj);
+
+	dobj = &nobj->object;
+	dobj->funcs = &nvdla_gem_object_funcs;
+	ret = drm_gem_handle_create(file_priv, dobj, handle);
+	if (ret)
+		goto free_drm_object;
+
+	drm_gem_object_put(dobj);
+
+	return nobj;
+
+free_drm_object:
+	nvdla_gem_free_object(dobj);
+
+	return ERR_PTR(ret);
+}
+
+static int32_t nvdla_gem_create(struct drm_device *drm, void *data,
+								struct drm_file *file)
+{
+	struct nvdla_gem_object *nobj;
+	struct nvdla_gem_create_args *args = data;
+
+	nobj = nvdla_gem_create_with_handle(file, drm, args->size,
+					 &args->handle);
+	if (IS_ERR(nobj))
+		return PTR_ERR(nobj);
+
+	return 0;
+}
+
+int32_t nvdla_gem_dma_addr(struct drm_device *dev, struct drm_file *file,
+						   uint32_t fd, dma_addr_t *addr)
+{
+	int32_t ret;
+	uint32_t handle;
+	struct nvdla_gem_object *nobj;
+	struct drm_gem_object *dobj;
+
+	ret = drm_gem_prime_fd_to_handle(dev, file, fd, &handle);
+	if (ret)
+		return ret;
+
+	dobj = drm_gem_object_lookup(file, handle);
+	if (!dobj)
+		return -EINVAL;
+
+	nobj = to_nvdla_obj(dobj);
+
+	*addr = nobj->dma_addr;
+
+	drm_gem_object_put(dobj);
+
+	return 0;
+}
+
+static int32_t nvdla_gem_map_offset(struct drm_device *drm, void *data,
+									struct drm_file *file)
+{
+	struct nvdla_gem_map_offset_args *args = data;
+
+	return drm_gem_dumb_map_offset(file, drm, args->handle,
+								   &args->offset);
+}
+
+DEFINE_DRM_GEM_FOPS(nvdla_drm_fops);
+
+static const struct drm_ioctl_desc nvdla_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(NVDLA_SUBMIT, nvdla_submit, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NVDLA_GEM_CREATE, nvdla_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NVDLA_GEM_MMAP, nvdla_gem_map_offset, DRM_RENDER_ALLOW),
+	/* use DRM_IOCTL_MODE_DESTROY_DUMB to destroy */
+};
+
+static struct drm_driver nvdla_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+
+	.ioctls = nvdla_drm_ioctls,
+	.num_ioctls = ARRAY_SIZE(nvdla_drm_ioctls),
+	.fops = &nvdla_drm_fops,
+	.gem_prime_mmap = drm_gem_prime_mmap,
+
+	.name = "nvdla",
+	.desc = "NVDLA driver",
+	.date = "20171017",
+	.major = 0,
+	.minor = 0,
+	.patchlevel = 0,
+};
+
+int32_t nvdla_drm_probe(struct nvdla_device *nvdla_dev)
+{
+	int32_t err;
+	struct drm_device *drm;
+	struct drm_driver *driver = &nvdla_drm_driver;
+
+	drm = drm_dev_alloc(driver, &nvdla_dev->pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	nvdla_dev->drm = drm;
+
+	err = drm_dev_register(drm, 0);
+	if (err < 0)
+		goto unref;
+
+	return 0;
+
+unref:
+	drm_dev_put(drm);
+	return err;
+}
+
+void nvdla_drm_remove(struct nvdla_device *nvdla_dev)
+{
+	drm_dev_unregister(nvdla_dev->drm);
+	drm_dev_put(nvdla_dev->drm);
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_pdp.c b/drivers/gpu/drm/nvdla/nvdla_pdp.c
new file mode 100644
index 000000000000..a006c8d6fd57
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_pdp.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_common.h"
+#include "nvdla_engine.h"
+
+#define MAX_SPLIT_NUM	64
+//#define ARRAY_SIZE(a)	(sizeof(a) / sizeof((a[0])))
+
+static const uint8_t map_ram[] = {
+	FIELD_ENUM(PDP_RDMA_D_SRC_RAM_CFG_0, SRC_RAM_TYPE, MC),
+	FIELD_ENUM(PDP_RDMA_D_SRC_RAM_CFG_0, SRC_RAM_TYPE, CV),
+};
+
+static const uint8_t map_pool[] = {
+	FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+			POOLING_METHOD, POOLING_METHOD_AVERAGE),
+	FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+			POOLING_METHOD, POOLING_METHOD_MAX),
+	FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+			POOLING_METHOD, POOLING_METHOD_MIN),
+};
+
+static const uint8_t map_precision[] = {
+	FIELD_ENUM(PDP_D_DATA_FORMAT_0, INPUT_DATA, INT8),
+	FIELD_ENUM(PDP_D_DATA_FORMAT_0, INPUT_DATA, INT16),
+	FIELD_ENUM(PDP_D_DATA_FORMAT_0, INPUT_DATA, FP16),
+};
+
+static const uint8_t map_pool_kernel[] = {
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_1),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_2),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_3),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_4),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_5),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_6),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_7),
+	FIELD_ENUM(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH, KERNEL_WIDTH_8),
+};
+
+/* The reciprocal of kernel width: 1/1, 1/2, 1/3, ... */
+static const uint32_t recip_kernel_size[2][8] = {
+	/*
+	 * INT8/16
+	 * 1      1/2     1/3     1/4     1/5     1/6     1/7     1/8
+	 */
+	{0x10000, 0x8000, 0x5555, 0x4000, 0x3333, 0x2aaa, 0x2492, 0x2000},
+	{0x7c00, 0x7800, 0x7555,  0x7400, 0x7266, 0x7155, 0x7092, 0x7000},
+};
+
+static uint32_t
+get_fly_mode(uint8_t type)
+{
+	uint32_t val;
+
+	val = type == NVDLA_MEM_HW ?
+			FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+						FLYING_MODE, ON_FLYING) :
+			FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+						FLYING_MODE, OFF_FLYING);
+
+	return val;
+}
+
+void
+nvdla_pdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	drm_dbg(nvdla_dev->drm, "group id %d rdma id %d\n", group_id, rdma_group_id);
+
+	reg = group_id << SHIFT(PDP_S_POINTER_0, PRODUCER);
+	pdp_reg_write(engine, S_POINTER, reg);
+
+	reg = rdma_group_id << SHIFT(PDP_RDMA_S_POINTER_0, PRODUCER);
+	pdp_rdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+nvdla_pdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (!group) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	drm_dbg(nvdla_dev->drm, "rdma needed %u\n", group->is_rdma_needed);
+
+	/* enable all sub-modules */
+	if (group->is_rdma_needed) {
+		reg = FIELD_ENUM(PDP_RDMA_D_OP_ENABLE_0, OP_EN, ENABLE);
+		pdp_rdma_reg_write(engine, D_OP_ENABLE, reg);
+	}
+	reg = FIELD_ENUM(PDP_D_OP_ENABLE_0, OP_EN, ENABLE);
+	pdp_reg_write(engine, D_OP_ENABLE, reg);
+
+exit:
+	return ret;
+}
+
+void
+nvdla_pdp_rdma_check(struct nvdla_processor_group *group)
+{
+	struct nvdla_pdp_surface_desc *pdp_surface;
+
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	group->is_rdma_needed = 0;
+
+	if (pdp_surface->src_data.type != NVDLA_MEM_HW)
+		group->is_rdma_needed = 1;
+}
+
+static int
+validate_strides(uint8_t stride_x, uint8_t stride_y)
+{
+	int32_t ret = 0;
+
+	if (stride_x < 1 || stride_y < 1 || stride_x > 8 || stride_y > 8) {
+		pr_err("Invalid Stride (x[%d], y[%d])\n", stride_x, stride_y);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+vaildate_pdp_configs(struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	struct nvdla_pdp_op_desc *pdp_op;
+	struct nvdla_pdp_surface_desc *pdp_surface;
+
+	pdp_op = &group->operation_desc->pdp_op;
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	if (pdp_surface->dst_data.type == NVDLA_MEM_HW) {
+		pr_err("Destination buffer for PDP has to be either MC or CV");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = validate_data_cube(pdp_surface->src_data, pdp_surface->dst_data,
+								NVDLA_MEM_HW);
+	if (ret)
+		goto exit;
+
+	ret = validate_precision(pdp_op->precision, ARRAY_SIZE(map_precision));
+	if (ret)
+		goto exit;
+
+	ret = validate_strides(pdp_op->stride_x, pdp_op->stride_y);
+	if (ret)
+		goto exit;
+
+	if (pdp_op->split_num > MAX_SPLIT_NUM) {
+		pr_err("Invalid split_num: %u\n", pdp_op->split_num);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (pdp_op->pool_width >= ARRAY_SIZE(map_pool_kernel)) {
+		pr_err("Invalid pool_width: %u\n", pdp_op->pool_width);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (pdp_op->pool_height >= ARRAY_SIZE(map_pool_kernel)) {
+		pr_err("Invalid pool_height: %u\n", pdp_op->pool_height);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (pdp_op->pool_mode >= ARRAY_SIZE(map_pool)) {
+		pr_err("Invalid pool_mode: %u\n", pdp_op->pool_mode);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+exit:
+	return ret;
+}
+
+static int
+processor_pdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct nvdla_pdp_op_desc *pdp_op;
+	struct nvdla_pdp_surface_desc *pdp_surface;
+
+	pdp_op = &group->operation_desc->pdp_op;
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	ret = vaildate_pdp_configs(group);
+	if (ret)
+		goto exit;
+
+	ret = nvdla_read_input_address(engine, &pdp_surface->src_data,
+					&input_address,
+					group->op_desc->index,
+					group->roi_index,
+					1);
+	if (ret)
+		goto exit;
+
+	if (pdp_surface->dst_data.address != -1)
+		nvdla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					pdp_surface->dst_data.address,
+					pdp_surface->dst_data.offset,
+					(void *)&output_address,
+					DESTINATION_DMA);
+
+	if (pdp_surface->src_data.type != NVDLA_MEM_HW) {
+		/* PDP RDMA */
+		pdp_rdma_reg_write(engine, D_DATA_CUBE_IN_WIDTH,
+				pdp_surface->src_data.width - 1);
+		pdp_rdma_reg_write(engine, D_DATA_CUBE_IN_HEIGHT,
+				pdp_surface->src_data.height - 1);
+		pdp_rdma_reg_write(engine, D_DATA_CUBE_IN_CHANNEL,
+				pdp_surface->src_data.channel - 1);
+
+		high = upper_32_bits(input_address);
+		low  = lower_32_bits(input_address);
+		pdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_HIGH, high);
+		pdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_LOW, low);
+		pdp_rdma_reg_write(engine, D_SRC_LINE_STRIDE,
+				pdp_surface->src_data.line_stride);
+		pdp_rdma_reg_write(engine, D_SRC_SURFACE_STRIDE,
+				pdp_surface->src_data.surf_stride);
+
+		reg = (map_precision[pdp_op->precision]
+			<< SHIFT(PDP_RDMA_D_DATA_FORMAT_0, INPUT_DATA));
+		pdp_rdma_reg_write(engine, D_DATA_FORMAT, reg);
+
+		reg = map_ram[pdp_surface->src_data.type]
+			<< SHIFT(PDP_RDMA_D_SRC_RAM_CFG_0, SRC_RAM_TYPE);
+		pdp_rdma_reg_write(engine, D_SRC_RAM_CFG, reg);
+
+		reg = ((pdp_op->split_num - 1)
+			 << SHIFT(PDP_RDMA_D_OPERATION_MODE_CFG_0, SPLIT_NUM));
+		pdp_rdma_reg_write(engine, D_OPERATION_MODE_CFG, reg);
+
+		reg = (map_pool_kernel[pdp_op->pool_width]
+			<< SHIFT(PDP_RDMA_D_POOLING_KERNEL_CFG_0,
+							KERNEL_WIDTH)) |
+			((pdp_op->stride_x - 1)
+			<< SHIFT(PDP_RDMA_D_POOLING_KERNEL_CFG_0,
+							KERNEL_STRIDE_WIDTH));
+		pdp_rdma_reg_write(engine, D_POOLING_KERNEL_CFG, reg);
+
+		reg = (pdp_op->pad_left
+			<< SHIFT(PDP_RDMA_D_POOLING_PADDING_CFG_0, PAD_WIDTH));
+		pdp_rdma_reg_write(engine, D_POOLING_PADDING_CFG, reg);
+
+		reg = ((pdp_op->partial_in_width_first == 0 ? 0 :
+				pdp_op->partial_in_width_first - 1)
+			<< SHIFT(PDP_RDMA_D_PARTIAL_WIDTH_IN_0,
+				PARTIAL_WIDTH_IN_FIRST)) |
+			((pdp_op->partial_in_width_mid == 0 ? 0 :
+				pdp_op->partial_in_width_mid - 1)
+			<< SHIFT(PDP_RDMA_D_PARTIAL_WIDTH_IN_0,
+				PARTIAL_WIDTH_IN_MID)) |
+			((pdp_op->partial_in_width_last == 0 ? 0 :
+				pdp_op->partial_in_width_last - 1)
+			<< SHIFT(PDP_RDMA_D_PARTIAL_WIDTH_IN_0,
+				PARTIAL_WIDTH_IN_LAST));
+		pdp_rdma_reg_write(engine, D_PARTIAL_WIDTH_IN, reg);
+	} else {
+		ASSERT_GOTO(pdp_op->split_num == 1, ret,
+					-EINVAL, exit);
+	}
+
+	reg = ((pdp_surface->src_data.width - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_IN_WIDTH_0, CUBE_IN_WIDTH));
+	pdp_reg_write(engine, D_DATA_CUBE_IN_WIDTH, reg);
+
+	reg = ((pdp_surface->src_data.height - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_IN_HEIGHT_0, CUBE_IN_HEIGHT));
+	pdp_reg_write(engine, D_DATA_CUBE_IN_HEIGHT, reg);
+
+	reg = ((pdp_surface->src_data.channel - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_IN_CHANNEL_0, CUBE_IN_CHANNEL));
+	pdp_reg_write(engine, D_DATA_CUBE_IN_CHANNEL, reg);
+
+	reg = ((pdp_surface->dst_data.width - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_OUT_WIDTH_0, CUBE_OUT_WIDTH));
+	pdp_reg_write(engine, D_DATA_CUBE_OUT_WIDTH, reg);
+
+	reg = ((pdp_surface->dst_data.height - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_OUT_HEIGHT_0, CUBE_OUT_HEIGHT));
+	pdp_reg_write(engine, D_DATA_CUBE_OUT_HEIGHT, reg);
+
+	reg = ((pdp_surface->dst_data.channel - 1)
+		<< SHIFT(PDP_D_DATA_CUBE_OUT_CHANNEL_0, CUBE_OUT_CHANNEL));
+	pdp_reg_write(engine, D_DATA_CUBE_OUT_CHANNEL, reg);
+
+	reg = (map_pool[pdp_op->pool_mode]
+		<< SHIFT(PDP_D_OPERATION_MODE_CFG_0, POOLING_METHOD)) |
+		(get_fly_mode(pdp_surface->src_data.type)
+		<< SHIFT(PDP_D_OPERATION_MODE_CFG_0, FLYING_MODE)) |
+		((pdp_op->split_num - 1)
+		<< SHIFT(PDP_D_OPERATION_MODE_CFG_0, SPLIT_NUM));
+	pdp_reg_write(engine, D_OPERATION_MODE_CFG, reg);
+
+	reg = ((pdp_op->partial_in_width_first == 0 ? 0 :
+			pdp_op->partial_in_width_first-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_IN_0, PARTIAL_WIDTH_IN_FIRST)) |
+		((pdp_op->partial_in_width_mid == 0 ? 0 :
+			pdp_op->partial_in_width_mid-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_IN_0, PARTIAL_WIDTH_IN_MID)) |
+		((pdp_op->partial_in_width_last == 0 ? 0 :
+			pdp_op->partial_in_width_last-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_IN_0, PARTIAL_WIDTH_IN_LAST));
+	pdp_reg_write(engine, D_PARTIAL_WIDTH_IN, reg);
+
+	reg = ((pdp_op->partial_width_first == 0 ? 0 :
+			pdp_op->partial_width_first-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_OUT_0, PARTIAL_WIDTH_OUT_FIRST)) |
+		((pdp_op->partial_width_mid == 0 ? 0 :
+			pdp_op->partial_width_mid-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_OUT_0, PARTIAL_WIDTH_OUT_MID))   |
+		((pdp_op->partial_width_last == 0 ? 0 :
+			pdp_op->partial_width_last-1)
+		<< SHIFT(PDP_D_PARTIAL_WIDTH_OUT_0, PARTIAL_WIDTH_OUT_LAST));
+	pdp_reg_write(engine, D_PARTIAL_WIDTH_OUT, reg);
+
+	reg = (map_pool_kernel[pdp_op->pool_width]
+		<< SHIFT(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_WIDTH)) |
+		(map_pool_kernel[pdp_op->pool_height]
+		<< SHIFT(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_HEIGHT))|
+		((pdp_op->stride_x - 1)
+		<< SHIFT(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_STRIDE_WIDTH)) |
+		((pdp_op->stride_y - 1)
+		<< SHIFT(PDP_D_POOLING_KERNEL_CFG_0, KERNEL_STRIDE_HEIGHT));
+	pdp_reg_write(engine, D_POOLING_KERNEL_CFG, reg);
+
+	pdp_reg_write(engine, D_RECIP_KERNEL_WIDTH,
+			recip_kernel_size[pdp_op->precision ==
+					PRECISION_FP16][pdp_op->pool_width]);
+	pdp_reg_write(engine, D_RECIP_KERNEL_HEIGHT,
+			recip_kernel_size[pdp_op->precision ==
+					PRECISION_FP16][pdp_op->pool_height]);
+
+	reg = (pdp_op->pad_left
+		<< SHIFT(PDP_D_POOLING_PADDING_CFG_0, PAD_LEFT)) |
+		(pdp_op->pad_right
+		<< SHIFT(PDP_D_POOLING_PADDING_CFG_0, PAD_RIGHT)) |
+		(pdp_op->pad_top
+		<< SHIFT(PDP_D_POOLING_PADDING_CFG_0, PAD_TOP)) |
+		(pdp_op->pad_bottom
+		<< SHIFT(PDP_D_POOLING_PADDING_CFG_0, PAD_BOTTOM));
+	if (pdp_op->precision == PRECISION_FP16) {
+		int32_t i;
+
+		for (i = 0; i < 7; i++)
+			ASSERT_GOTO(pdp_op->padding_value[i] == 0, ret,
+						-EINVAL, exit);
+	}
+
+	pdp_reg_write(engine, D_POOLING_PADDING_CFG, reg);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_1_CFG, pdp_op->padding_value[0]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_2_CFG, pdp_op->padding_value[1]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_3_CFG, pdp_op->padding_value[2]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_4_CFG, pdp_op->padding_value[3]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_5_CFG, pdp_op->padding_value[4]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_6_CFG, pdp_op->padding_value[5]);
+	pdp_reg_write(engine, D_POOLING_PADDING_VALUE_7_CFG, pdp_op->padding_value[6]);
+
+	if (pdp_surface->src_data.type != NVDLA_MEM_HW) {
+		pdp_reg_write(engine, D_SRC_LINE_STRIDE,
+				pdp_surface->src_data.line_stride);
+		pdp_reg_write(engine, D_SRC_SURFACE_STRIDE,
+				pdp_surface->src_data.surf_stride);
+	}
+
+	high = upper_32_bits(output_address);
+	low = lower_32_bits(output_address);
+	pdp_reg_write(engine, D_DST_BASE_ADDR_LOW, low);
+	pdp_reg_write(engine, D_DST_BASE_ADDR_HIGH, high);
+
+	pdp_reg_write(engine, D_DST_LINE_STRIDE, pdp_surface->dst_data.line_stride);
+	pdp_reg_write(engine, D_DST_SURFACE_STRIDE, pdp_surface->dst_data.surf_stride);
+
+	reg = (map_ram[pdp_surface->dst_data.type]
+		<< SHIFT(PDP_D_DST_RAM_CFG_0, DST_RAM_TYPE));
+	pdp_reg_write(engine, D_DST_RAM_CFG, reg);
+
+	reg = (map_precision[pdp_op->precision]
+		<< SHIFT(PDP_D_DATA_FORMAT_0, INPUT_DATA));
+	pdp_reg_write(engine, D_DATA_FORMAT, reg);
+
+exit:
+	return ret;
+}
+
+int
+nvdla_pdp_is_ready(struct nvdla_processor *processor,
+			   struct nvdla_processor_group *group)
+{
+	return 1;
+}
+
+void
+nvdla_pdp_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_pdp_op_desc *pdp_op;
+	struct nvdla_pdp_surface_desc *pdp_surface;
+
+	pdp_surface = &group->surface_desc->pdp_surface;
+	pdp_op = &group->operation_desc->pdp_op;
+}
+
+int
+nvdla_pdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret;
+
+	if (!group) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	nvdla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, PDP_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, PDP_DONE_MASK0));
+
+	ret = processor_pdp_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_rubik.c b/drivers/gpu/drm/nvdla/nvdla_rubik.c
new file mode 100644
index 000000000000..ccf6108c3531
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_rubik.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+static uint8_t map_rubik_mode[] = {
+	FIELD_ENUM(RBK_D_MISC_CFG_0, RUBIK_MODE, CONTRACT),
+	FIELD_ENUM(RBK_D_MISC_CFG_0, RUBIK_MODE, SPLIT),
+	FIELD_ENUM(RBK_D_MISC_CFG_0, RUBIK_MODE, MERGE),
+};
+
+static uint8_t  map_ram_type[] = {
+	FIELD_ENUM(RBK_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE, MCIF),
+	FIELD_ENUM(RBK_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE, CVIF),
+};
+
+static uint8_t  map_precision[] = {
+	FIELD_ENUM(RBK_D_MISC_CFG_0, IN_PRECISION, INT8),
+	FIELD_ENUM(RBK_D_MISC_CFG_0, IN_PRECISION, INT16),
+	FIELD_ENUM(RBK_D_MISC_CFG_0, IN_PRECISION, FP16),
+};
+
+static uint8_t map_bpe[] = {
+	BPE_PRECISION_INT8,
+	BPE_PRECISION_INT16,
+	BPE_PRECISION_FP16,
+};
+
+void
+nvdla_rubik_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t __unused)
+{
+	uint32_t reg;
+
+	/* set producer pointer for all sub-modules */
+	reg = group_id << SHIFT(RBK_S_POINTER_0, PRODUCER);
+	rubik_reg_write(engine, S_POINTER, reg);
+}
+
+int
+nvdla_rubik_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	uint32_t reg;
+
+	reg = FIELD_ENUM(RBK_D_OP_ENABLE_0, OP_EN, ENABLE);
+	rubik_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+nvdla_rubik_rdma_check(struct nvdla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+static int32_t
+processor_rubik_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct nvdla_rubik_op_desc *rubik_op;
+	struct nvdla_rubik_surface_desc *rubik_surface;
+
+	rubik_op = &group->operation_desc->rubik_op;
+	rubik_surface = &group->surface_desc->rubik_surface;
+
+	/* Argument check */
+	ASSERT_GOTO((rubik_surface->src_data.type != NVDLA_MEM_HW),
+		ret, -EINVAL, exit);
+	ASSERT_GOTO((rubik_surface->dst_data.type != NVDLA_MEM_HW),
+		ret, -EINVAL, exit);
+
+	/* get the addresses from task descriptor */
+	ret = nvdla_read_input_address(engine, &rubik_surface->src_data,
+						&input_address,
+						group->op_desc->index,
+						group->roi_index,
+						1);
+	if (ret)
+		goto exit;
+
+	nvdla_get_dma_cube_address(engine->driver_context,
+				engine->task->task_data,
+				rubik_surface->dst_data.address,
+				rubik_surface->dst_data.offset,
+				(void *)&output_address,
+				DESTINATION_DMA);
+
+	/* config rubik */
+	reg = (((uint32_t)map_rubik_mode[rubik_op->mode]) <<
+			SHIFT(RBK_D_MISC_CFG_0, RUBIK_MODE)) |
+			(((uint32_t)map_precision[rubik_op->precision]) <<
+			SHIFT(RBK_D_MISC_CFG_0, IN_PRECISION));
+	rubik_reg_write(engine, D_MISC_CFG, reg);
+	reg = (((uint32_t)map_ram_type[rubik_surface->src_data.type]) <<
+			SHIFT(RBK_D_DAIN_RAM_TYPE_0, DATAIN_RAM_TYPE));
+	rubik_reg_write(engine, D_DAIN_RAM_TYPE, reg);
+	reg =  ((rubik_surface->src_data.width-1) <<
+			SHIFT(RBK_D_DATAIN_SIZE_0_0, DATAIN_WIDTH)) |
+			((rubik_surface->src_data.height-1) <<
+			SHIFT(RBK_D_DATAIN_SIZE_0_0, DATAIN_HEIGHT));
+	rubik_reg_write(engine, D_DATAIN_SIZE_0, reg);
+	reg =  ((rubik_surface->src_data.channel-1) <<
+			SHIFT(RBK_D_DATAIN_SIZE_1_0, DATAIN_CHANNEL));
+	rubik_reg_write(engine, D_DATAIN_SIZE_1, reg);
+
+	high = upper_32_bits(input_address);
+	low = lower_32_bits(input_address);
+	rubik_reg_write(engine, D_DAIN_ADDR_LOW, low);
+	rubik_reg_write(engine, D_DAIN_ADDR_HIGH, high);
+	if (rubik_op->mode == RUBIK_MODE_MERGE) {
+		ASSERT_GOTO((rubik_surface->src_data.plane_stride != 0),
+			ret, -EINVAL, exit);
+		ASSERT_GOTO(((rubik_surface->src_data.plane_stride&0x1F) == 0),
+			ret, -EINVAL, exit);
+		rubik_reg_write(engine, D_DAIN_PLANAR_STRIDE,
+			rubik_surface->src_data.plane_stride);
+	} else {
+		rubik_reg_write(engine, D_DAIN_SURF_STRIDE,
+			rubik_surface->src_data.surf_stride);
+	}
+	rubik_reg_write(engine, D_DAIN_LINE_STRIDE,
+				rubik_surface->src_data.line_stride);
+
+	reg = (((uint32_t)map_ram_type[rubik_surface->dst_data.type]) <<
+			SHIFT(RBK_D_DAOUT_RAM_TYPE_0, DATAOUT_RAM_TYPE));
+	rubik_reg_write(engine, D_DAOUT_RAM_TYPE, reg);
+	reg =  ((rubik_surface->dst_data.channel-1) <<
+			SHIFT(RBK_D_DATAOUT_SIZE_1_0, DATAOUT_CHANNEL));
+	rubik_reg_write(engine, D_DATAOUT_SIZE_1, reg);
+
+	high = upper_32_bits(output_address);
+	low = lower_32_bits(output_address);
+	rubik_reg_write(engine, D_DAOUT_ADDR_LOW, low);
+	rubik_reg_write(engine, D_DAOUT_ADDR_HIGH, high);
+
+	rubik_reg_write(engine, D_DAOUT_LINE_STRIDE,
+			rubik_surface->dst_data.line_stride);
+	if (rubik_op->mode != RUBIK_MODE_SPLIT) {
+		rubik_reg_write(engine, D_DAOUT_SURF_STRIDE,
+				rubik_surface->dst_data.surf_stride);
+		if (rubik_op->mode == RUBIK_MODE_CONTRACT) {
+			reg = ((rubik_surface->dst_data.channel *
+				map_bpe[rubik_op->precision] + 31) >> 5) *
+				rubik_surface->src_data.surf_stride;
+			rubik_reg_write(engine, D_CONTRACT_STRIDE_0, reg);
+
+			reg = rubik_op->stride_y *
+				rubik_surface->dst_data.line_stride;
+			rubik_reg_write(engine, D_CONTRACT_STRIDE_1, reg);
+
+			reg = (((uint32_t)(rubik_op->stride_x-1)) <<
+			SHIFT(RBK_D_DECONV_STRIDE_0, DECONV_X_STRIDE)) |
+				(((uint32_t)(rubik_op->stride_y-1)) <<
+			SHIFT(RBK_D_DECONV_STRIDE_0, DECONV_Y_STRIDE));
+			rubik_reg_write(engine, D_DECONV_STRIDE, reg);
+		}
+	} else {
+		rubik_reg_write(engine, D_DAOUT_PLANAR_STRIDE,
+				rubik_surface->dst_data.plane_stride);
+	}
+
+exit:
+	return ret;
+}
+
+int
+nvdla_rubik_is_ready(struct nvdla_processor *processor,
+			     struct nvdla_processor_group *group)
+{
+	return 1;
+}
+
+void
+nvdla_rubik_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_rubik_op_desc *rubik_op;
+	struct nvdla_rubik_surface_desc *rubik_surface;
+
+	rubik_surface = &group->surface_desc->rubik_surface;
+	rubik_op = &group->operation_desc->rubik_op;
+}
+
+int
+nvdla_rubik_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (!engine->config_data->rubik_enable) {
+		drm_err(nvdla_dev->drm, "RUBIK is not supported for this configuration\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	nvdla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, RUBIK_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, RUBIK_DONE_MASK0));
+
+	ret = processor_rubik_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_sched.h b/drivers/gpu/drm/nvdla/nvdla_sched.h
new file mode 100644
index 000000000000..b676b3fb6222
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_sched.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_SCHED_H_
+#define __NVDLA_SCHED_H_
+
+struct nvdla_task_desc {
+	/* platform specific data to communicate with portability layer */
+	void *task_data;
+	/* task state */
+	uint32_t state;
+	/* Task base address */
+	uint64_t base;
+	/* start address of a list of nvdla_operation_container */
+	uint64_t operation_desc_addr;
+	/* start address of a list of nvdla_surface_container */
+	uint64_t surface_desc_addr;
+	/* start address of a list of nvdla_common_op_desc */
+	uint64_t dependency_graph_addr;
+	/* start address of a list of nvdla_lut_param */
+	uint64_t lut_data_addr;
+	/*
+	 * start address of a list of nvdla_roi_desc,
+	 * the first one is nvdla_roi_array_desc
+	 * valid when network.dynamic_roi is true
+	 */
+	uint64_t roi_array_addr;
+	/* start address of a list of nvdla_surface_container */
+	uint64_t surface_addr;
+	/* start address of a list of nvdla_stat_container */
+	uint64_t stat_data_addr;
+} __packed __aligned(256);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_scheduler.c b/drivers/gpu/drm/nvdla/nvdla_scheduler.c
new file mode 100644
index 000000000000..efe1e1fe5c8f
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_scheduler.c
@@ -0,0 +1,1012 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+#define MAX_NUM_ADDRESSES	256
+
+static uint64_t roi_array_length __aligned(8);
+static struct nvdla_network_desc network;
+
+static int
+nvdla_update_consumers(struct nvdla_engine *engine,
+					 struct nvdla_processor_group *group,
+					 struct nvdla_common_op_desc *op, uint8_t event);
+
+static int32_t
+nvdla_read_address_list(struct nvdla_engine *engine)
+{
+	return 0;
+}
+
+int32_t
+nvdla_read_lut(struct nvdla_engine *engine, int16_t index, void *dst)
+{
+	int32_t ret = 0;
+	uint64_t src_addr;
+
+	if (index == -1) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	src_addr = engine->task->lut_data_addr;
+
+	ret = nvdla_data_read(engine->driver_context,
+			engine->task->task_data,
+			src_addr, (void *)dst,
+			sizeof(struct nvdla_lut_param),
+			(sizeof(struct nvdla_lut_param) * (uint64_t)index));
+
+exit:
+	return ret;
+}
+
+static int
+nvdla_op_enabled(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret;
+	struct nvdla_common_op_desc *op_desc;
+
+	op_desc = group->op_desc;
+
+	group->active = 1;
+
+	/* update dependency graph for this task */
+	ret = nvdla_update_consumers(engine, group, op_desc, NVDLA_EVENT_OP_ENABLED);
+
+	return ret;
+}
+
+static int
+nvdla_op_programmed(struct nvdla_engine *engine, struct nvdla_processor *processor,
+		  struct nvdla_processor_group *group,
+		  uint8_t rdma_id)
+{
+	int32_t ret;
+	struct nvdla_common_op_desc *op_desc;
+
+	op_desc = group->op_desc;
+
+	group->pending = 0;
+
+	/* update dependency graph for this task */
+	ret = nvdla_update_consumers(engine, group, op_desc, NVDLA_EVENT_OP_PROGRAMMED);
+
+	return ret;
+}
+
+static int32_t
+nvdla_read_config(struct nvdla_engine *engine, struct nvdla_task_desc *task,
+				  struct nvdla_processor *processor,
+				  struct nvdla_processor_group *group)
+{
+	int32_t ret;
+	uint64_t base;
+	int16_t index;
+	uint8_t roi_index;
+
+	roi_index = group->roi_index;
+	index = group->op_desc->index;
+
+	base = (sizeof(union nvdla_operation_container) *
+			(uint64_t)engine->network->num_operations *
+			(uint64_t)roi_index);
+	base = base + (sizeof(union nvdla_operation_container) *
+			(uint64_t)index);
+
+	ret = nvdla_data_read(engine->driver_context, task->task_data,
+				task->operation_desc_addr,
+				(void *)group->operation_desc,
+				sizeof(union nvdla_operation_container),
+				base);
+	if (ret)
+		goto exit;
+
+	base = (sizeof(union nvdla_surface_container) *
+			(uint64_t)engine->network->num_operations *
+			(uint64_t)roi_index);
+
+	base = base + (sizeof(union nvdla_surface_container) *
+			(uint64_t)index);
+
+	ret = nvdla_data_read(engine->driver_context, task->task_data,
+				task->surface_desc_addr,
+				(void *)group->surface_desc,
+				sizeof(union nvdla_surface_container), base);
+	if (ret)
+		goto exit;
+
+	processor->dump_config(group);
+
+exit:
+	return ret;
+}
+
+static void
+nvdla_reset_group(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t i;
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		nvdla_put_op_desc(engine, group->consumers[i]);
+		group->consumers[i] = NULL;
+	}
+
+	nvdla_put_op_desc(engine, group->fused_parent);
+	group->fused_parent = NULL;
+
+	nvdla_put_op_desc(engine, group->op_desc);
+	group->op_desc = NULL;
+}
+
+static int
+nvdla_prepare_operation(struct nvdla_engine *engine,
+						struct nvdla_processor *processor,
+						struct nvdla_common_op_desc *op_desc,
+						uint8_t roi_index, uint32_t *group_number)
+{
+	int32_t ret = 0;
+	uint8_t group_id;
+	uint8_t rdma_id;
+	struct nvdla_processor_group *group;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	/*
+	 * If not already programmed then find out if
+	 * processor is free and which group is free
+	 */
+	ret = utils_get_free_group(engine, processor, &group_id, &rdma_id);
+	if (ret) {
+		drm_dbg(nvdla_dev->drm, "processor:%s register groups are busy\n",
+				processor->name);
+		goto exit;
+	} else {
+		drm_info(nvdla_dev->drm,
+				 "processor:%s group:%d, rdma_group:%d available\n",
+				 processor->name, group_id, rdma_id);
+	}
+	*group_number = group_id;
+	group = &processor->groups[group_id];
+
+	/*
+	 * update operation descriptor
+	 */
+	group->op_desc = op_desc;
+	nvdla_get_refcount(op_desc);
+	group->id = group_id;
+	group->roi_index = roi_index;
+	group->rdma_id = rdma_id;
+
+	ret = nvdla_read_config(engine, engine->task, processor, group);
+	if (ret)
+		goto exit;
+
+	group->pending = 1;
+
+	processor->group_status |= (1 << group->id);
+
+	processor->rdma_check(group);
+	if (group->is_rdma_needed) {
+		group->rdma_id = rdma_id;
+		processor->rdma_status |= (1 << rdma_id);
+	}
+
+	processor->tail_op = op_desc;
+exit:
+	return ret;
+}
+
+static int
+nvdla_program_operation(struct nvdla_engine *engine,
+					  struct nvdla_processor *processor,
+					  struct nvdla_processor_group *group)
+{
+	int32_t i;
+	int32_t ret = 0;
+	struct nvdla_common_op_desc *op_desc;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	drm_info(nvdla_dev->drm, "Program %s operation index %d ROI %d Group[%d]\n",
+			 processor->name, group->op_desc->index, group->roi_index, group->id);
+
+	group->programming = 1;
+
+	op_desc = group->op_desc;
+
+	processor->set_producer(engine, group->id, group->rdma_id);
+
+	ret = processor->program(engine, group);
+	if (ret)
+		goto exit;
+
+	/* Pre-fetch consumers */
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		group->consumers[i] = nvdla_get_op_desc(engine, engine->task,
+					op_desc->consumers[i].index, i,
+					group->roi_index);
+	}
+
+	group->fused_parent = nvdla_get_op_desc(engine, engine->task,
+					op_desc->fused_parent.index,
+					op_desc->op_type - 1,
+					group->roi_index);
+
+	if (group->fused_parent != NULL) {
+		if (group->fused_parent->op_type != (op_desc->op_type - 1)) {
+			ret = -EINVAL;
+			goto exit;
+		}
+	}
+
+	ret = nvdla_op_programmed(engine, processor, group, group->rdma_id);
+	if (!ret)
+		goto exit;
+
+exit:
+	group->programming = 0;
+	return ret;
+}
+
+static int
+nvdla_enable_operation(struct nvdla_engine *engine,
+					 struct nvdla_processor *processor,
+					 struct nvdla_common_op_desc *op_desc)
+{
+	int32_t ret = 0;
+	int32_t group_id;
+	struct nvdla_processor_group *group;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	/**
+	 * If some operation has reported error then skip
+	 * enabling next operations
+	 */
+	if (engine->status)
+		goto exit;
+
+	/**
+	 * Find out if operation is already programmed
+	 */
+	group_id = 0;
+	group = &processor->groups[group_id];
+	if ((processor->group_status & (1 << group_id)) &&
+			group->op_desc->index == op_desc->index &&
+			group->roi_index == op_desc->roi_index &&
+			!group->pending)
+		goto enable_op;
+
+	group_id = 1;
+	group = &processor->groups[group_id];
+	if ((processor->group_status & (1 << group_id)) &&
+			group->op_desc->index == op_desc->index &&
+			group->roi_index == op_desc->roi_index &&
+			!group->pending)
+		goto enable_op;
+
+	/**
+	 * Operation is not programmed yet, ignore
+	 */
+	drm_dbg(nvdla_dev->drm,
+			"exit without actual enable due to processor hasn't been programmed\n");
+	goto exit;
+
+enable_op:
+	/**
+	 * If this event is triggered as part of programming same
+	 * group then skip enable, it will get enabled after programming
+	 * is complete
+	 */
+	if (group->programming)
+		goto exit;
+
+	if (group->active) {
+		drm_dbg(nvdla_dev->drm,
+				"Processor:%s already enabled on group:%d\n",
+				processor->name, group_id);
+		goto exit;
+	}
+
+	drm_info(nvdla_dev->drm, "Enable %s operation index %d ROI %d\n",
+			 processor->name, group->op_desc->index, group->roi_index);
+
+	processor->set_producer(engine, group->id, group->rdma_id);
+
+	ret = processor->enable(engine, group);
+	if (ret)
+		goto exit;
+
+	ret = nvdla_op_enabled(engine, group);
+exit:
+	return ret;
+}
+
+static int
+nvdla_submit_operation(struct nvdla_engine *engine,
+					 struct nvdla_processor *processor,
+					 struct nvdla_common_op_desc *op_desc,
+					 uint8_t roi_index)
+{
+	int32_t err;
+	uint32_t group_id = 0;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	drm_info(nvdla_dev->drm, "Prepare %s operation index %d ROI %d dep_count %d\n",
+			 processor->name, op_desc->index, roi_index,
+			 op_desc->dependency_count);
+	err = nvdla_prepare_operation(engine, processor, op_desc, roi_index, &group_id);
+	if (err)
+		goto exit;
+
+	if (!processor->is_ready(processor, &processor->groups[group_id]))
+		goto exit;
+
+	err = nvdla_program_operation(engine, processor, &processor->groups[group_id]);
+	if (err)
+		goto exit;
+
+	if (op_desc->dependency_count == 0)
+		err = nvdla_enable_operation(engine, processor, op_desc);
+
+exit:
+	return err;
+}
+
+/**
+ * Dequeue next operation of same type from list of operations
+ */
+static int32_t
+nvdla_dequeue_operation(struct nvdla_engine *engine,
+					  struct nvdla_processor *processor)
+{
+	int32_t ret = 0;
+	int16_t index;
+	struct nvdla_common_op_desc *consumer;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (engine->status) {
+		drm_dbg(nvdla_dev->drm, "Skip dequeue op as engine has reported error\n");
+		goto exit;
+	}
+
+	/**
+	 * If we are done processing all ROIs for current op then
+	 * load next op of same type otherwise reload same op for
+	 * next ROI.
+	 */
+	if (processor->roi_index == (engine->network->num_rois - 1)) {
+		index = processor->tail_op->consumers[processor->op_type].index;
+		if (-1 == index) {
+			/**
+			 * It means we are done processing
+			 * all ops of this type
+			 */
+			drm_dbg(nvdla_dev->drm, "exit %s as there's no further operation\n",
+					processor->name);
+			goto exit;
+		}
+		processor->roi_index = 0;
+	} else {
+		processor->roi_index++;
+		index = processor->tail_op->index;
+	}
+
+	drm_dbg(nvdla_dev->drm, "Dequeue op from %s processor, index=%d ROI=%d\n",
+			processor->name, index, processor->roi_index);
+
+	/**
+	 * Get operation descriptor
+	 */
+	consumer = nvdla_get_op_desc(engine, engine->task, index,
+				processor->op_type, processor->roi_index);
+	if (consumer == NULL) {
+		ret = -ENOMEM;
+		drm_err(nvdla_dev->drm, "Failed to allocate op_desc");
+		goto exit;
+	}
+
+	ret = nvdla_submit_operation(engine, processor, consumer, processor->roi_index);
+	nvdla_put_op_desc(engine, consumer);
+
+exit:
+	return ret;
+}
+
+static int
+nvdla_update_dependency(struct nvdla_engine *engine,
+					  struct nvdla_consumer *consumer,
+					  struct nvdla_common_op_desc *op_desc,
+					  uint8_t event, uint8_t roi_index)
+{
+	int32_t ret = 0;
+	struct nvdla_processor *processor;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (consumer->index == -1)
+		goto exit;
+
+	/* Update dependency only if event matches */
+	if (event != consumer->event)
+		goto exit;
+
+	/**
+	 * If consumer index is valid but op desc is NULL means
+	 * op desc for consumer was not pre-fetched
+	 */
+	if (op_desc == NULL) {
+		ret = -EINVAL;
+		drm_err(nvdla_dev->drm, "Operation descriptor is NULL, consumer index %d",
+				consumer->index);
+		goto exit;
+	}
+
+	drm_dbg(nvdla_dev->drm, "Update dependency operation index %d ROI %d DEP_COUNT=%d\n",
+			op_desc->index, op_desc->roi_index, op_desc->dependency_count);
+	op_desc->dependency_count--;
+
+	if (op_desc->dependency_count == 0) {
+		processor = &engine->processors[op_desc->op_type];
+		drm_dbg(nvdla_dev->drm, "enable %s as dependency are resolved\n",
+				processor->name);
+
+		ret = nvdla_enable_operation(engine, processor, op_desc);
+		if (ret)
+			goto exit;
+	}
+exit:
+	return ret;
+}
+
+static int
+nvdla_update_consumers(struct nvdla_engine *engine,
+					 struct nvdla_processor_group *group,
+					 struct nvdla_common_op_desc *op,
+					 uint8_t event)
+{
+	int32_t i;
+	int32_t ret = 0;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	if (engine->status) {
+		drm_dbg(nvdla_dev->drm, "Skip update as engine has reported error\n");
+		goto exit;
+	}
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		ret = nvdla_update_dependency(engine, &op->consumers[i],
+						group->consumers[i],
+						event, group->roi_index);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to update dependency for consumer %d, ROI %d",
+					i, group->roi_index);
+			goto exit;
+		}
+	}
+
+	ret = nvdla_update_dependency(engine, &op->fused_parent,
+					group->fused_parent,
+					event, group->roi_index);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to update dependency for "
+				"fused parent, ROI %d", group->roi_index);
+		goto exit;
+	}
+
+exit:
+	return ret;
+}
+
+/**
+ * Handle operation completion notification
+ */
+int
+nvdla_op_completion(struct nvdla_engine *engine,
+				  struct nvdla_processor *processor,
+				  struct nvdla_processor_group *group)
+{
+	int32_t ret;
+	struct nvdla_task_desc *task;
+	struct nvdla_common_op_desc *op_desc;
+	struct nvdla_processor_group *next_group;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	drm_info(nvdla_dev->drm, "Completed %s operation index %d ROI %d\n",
+			 processor->name, group->op_desc->index, group->roi_index);
+
+	task = engine->task;
+
+	/**
+	 * Mark OP as done only when all ROIs are done for that
+	 * operation
+	 */
+	if (group->roi_index == (engine->network->num_rois - 1))
+		engine->num_proc_hwl++;
+
+	op_desc = group->op_desc;
+
+	/**
+	 * Get an extra reference count to keep op descriptor
+	 * in cache until this operation completes
+	 */
+	nvdla_get_refcount(op_desc);
+
+	processor->group_status &= ~(1 << group->id);
+	if (group->is_rdma_needed) {
+		group->is_rdma_needed = 0;
+		processor->rdma_status &= ~(1 << group->rdma_id);
+		group->rdma_id = 0;
+	}
+	group->active = 0;
+	group->lut_index = -1;
+	processor->last_group = group->id;
+
+	/**
+	 * Switch consumer pointer to next group
+	 */
+	processor->consumer_ptr = !group->id;
+
+	/**
+	 * update dependency graph for this task
+	 * TODO: Add proper error handling
+	 */
+	ret = nvdla_update_consumers(engine, group, op_desc, NVDLA_EVENT_OP_COMPLETED);
+	if (ret)
+		goto exit;
+
+	drm_info(nvdla_dev->drm, "%d HWLs done, totally %d layers\n",
+			 engine->num_proc_hwl, engine->network->num_operations);
+
+	/* free operation descriptor from cache */
+	nvdla_reset_group(engine, group);
+
+	/* if not hwl pending, means network completed */
+	if (engine->network->num_operations == engine->num_proc_hwl) {
+		nvdla_put_op_desc(engine, op_desc);
+		goto exit;
+	}
+
+	next_group = &processor->groups[!group->id];
+	if (next_group->pending && !engine->status) {
+		/**
+		 * Next group must be ready here for programming,
+		 * if not means it is an error
+		 */
+		if (!processor->is_ready(processor, next_group))
+			goto dequeue_op;
+
+		ret = nvdla_program_operation(engine, processor, next_group);
+		if (ret)
+			goto exit;
+
+		if (next_group->op_desc->dependency_count != 0)
+			goto dequeue_op;
+
+		ret = nvdla_enable_operation(engine, processor,
+					   next_group->op_desc);
+		if (ret)
+			goto exit;
+	}
+
+dequeue_op:
+	/* dequeue operation from this processor */
+	ret = nvdla_dequeue_operation(engine, processor);
+
+exit:
+	nvdla_put_op_desc(engine, op_desc);
+	drm_dbg(nvdla_dev->drm, "Exit:%s processor %s group%u status=%d\n",
+			__func__, processor->name, group->id, ret);
+
+	return ret;
+}
+
+/**
+ * Read network configuration from DRAM, network descriptor address
+ * is always first in the address list. Network configuration contains
+ * offset in address list for addresses of other lists used to
+ * execute network
+ *
+ * @engine: Engine instance
+ * @return: 0 for success
+ */
+static int
+nvdla_read_network_config(struct nvdla_engine *engine)
+{
+	int32_t ret;
+	uint64_t network_addr;
+	struct nvdla_task_desc *task = engine->task;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	/**
+	 * Read address list from DRAM to DMEM
+	 */
+	ret = nvdla_read_address_list(engine);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to read address list");
+		goto exit;
+	}
+
+	/**
+	 * Read network descriptor address from address list. It is always
+	 * at index 0.
+	 */
+	ret = nvdla_get_dma_address(engine->driver_context, task->task_data,
+							  0, (void *)&network_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to read network desc address");
+		goto exit;
+	}
+
+	/**
+	 * Read network descriptor, it has information for a network
+	 * such as all address indexes.
+	 */
+	ret = nvdla_data_read(engine->driver_context, task->task_data,
+						  network_addr, (void *)&network,
+						  sizeof(struct nvdla_network_desc), 0);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to read network descriptor\n");
+		goto exit;
+	}
+
+	if (network.num_operations == 0)
+		goto exit;
+
+	/**
+	 * Read operation descriptor list address from address list
+	 */
+	ret = nvdla_get_dma_address(engine->driver_context, task->task_data,
+							  network.operation_desc_index,
+							  (void *)&task->operation_desc_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to read operation desc list address\n");
+		goto exit;
+	}
+
+	/**
+	 * Read surface descriptor list address from address list
+	 */
+	ret = nvdla_get_dma_address(engine->driver_context, task->task_data,
+							  network.surface_desc_index,
+							  (void *)&task->surface_desc_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to read surface desc list address\n");
+		goto exit;
+	}
+
+	/**
+	 * Read dependency graph address from address list
+	 */
+	ret = nvdla_get_dma_address(engine->driver_context, task->task_data,
+							  network.dependency_graph_index,
+							  (void *)&task->dependency_graph_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		drm_err(nvdla_dev->drm, "Failed to ready dependency graph address\n");
+		goto exit;
+	}
+
+	/**
+	 * Read LUT data list address from address list
+	 */
+	if (network.num_luts) {
+		ret = nvdla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.lut_data_index,
+								  (void *)&task->lut_data_addr,
+								  DESTINATION_PROCESSOR);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to read LUT list address\n");
+			goto exit;
+		}
+	}
+
+	/**
+	 * Read address for ROI information
+	 */
+	if (network.dynamic_roi) {
+		/**
+		 * Read ROI array address from address list
+		 */
+		ret = nvdla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.roi_array_index,
+								  (void *)&task->roi_array_addr,
+								  DESTINATION_PROCESSOR);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to read ROI array address\n");
+			goto exit;
+		}
+
+		ret = nvdla_data_read(engine->driver_context, task->task_data,
+							task->roi_array_addr,
+							(void *)&roi_array_length,
+							sizeof(uint64_t), 0);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to read ROI array length\n");
+			goto exit;
+		}
+
+		/**
+		 * Number of ROIs detected can't be greater than maximum number
+		 * ROIs this network can process
+		 */
+		if (roi_array_length > network.num_rois) {
+			drm_err(nvdla_dev->drm, "Invalid number of ROIs detected\n");
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		network.num_rois = roi_array_length;
+
+		/**
+		 * Read surface address from address list
+		 */
+		ret = nvdla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.surface_index,
+								  (void *)&task->surface_addr,
+								  DESTINATION_DMA);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to read surface address");
+			goto exit;
+		}
+	}
+
+exit:
+	return ret;
+}
+
+static int
+nvdla_initiate_processors(struct nvdla_engine *engine)
+{
+	int32_t i;
+	int32_t ret = 0;
+	int16_t index;
+	struct nvdla_processor *processor;
+	struct nvdla_common_op_desc *consumer;
+	struct nvdla_network_desc *nw;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	nw = engine->network;
+
+	/* Validate operation heads before initiating processors */
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		if (nw->op_head[i] >= nw->num_operations) {
+			ret = -EINVAL;
+			drm_err(nvdla_dev->drm, "Invalid op_head %d for op %d",
+					nw->op_head[i], i);
+			goto exit;
+		}
+	}
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		index = nw->op_head[i];
+
+		/* If there is no op for this type then continue */
+		if (-1 == index)
+			continue;
+
+		consumer = nvdla_get_op_desc(engine, engine->task, index, i, 0);
+		/*
+		 * if consumer is NULL, it means either data copy error
+		 * or cache insufficient - we should fix it
+		 **/
+		if (consumer == NULL) {
+			drm_err(nvdla_dev->drm,
+					"Failed to allocate memory for op_head[%d]=%d",
+					i, index);
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		processor = &engine->processors[consumer->op_type];
+
+		ret = nvdla_submit_operation(engine, processor, consumer, 0);
+		nvdla_put_op_desc(engine, consumer);
+		if (ret && ret != -EBUSY) {
+			drm_err(nvdla_dev->drm, "Failed to submit %s op from index %u\n",
+					processor->name, index);
+			goto exit;
+		}
+
+		ret = nvdla_dequeue_operation(engine, processor);
+		if (ret) {
+			drm_err(nvdla_dev->drm, "Failed to dequeue op for %s processor",
+					processor->name);
+			goto exit;
+		}
+	}
+exit:
+	return ret;
+}
+
+static int
+nvdla_handle_events(struct nvdla_engine *engine, struct nvdla_processor *processor)
+{
+	int32_t j;
+	int32_t ret = 0;
+	uint8_t group_id;
+	struct nvdla_processor_group *group;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	group_id = !processor->last_group;
+
+	for (j = 0; j < NVDLA_NUM_GROUPS; j++) {
+		group = &processor->groups[group_id];
+
+		if ((1 << NVDLA_EVENT_CDMA_WT_DONE) & group->events) {
+			drm_info(nvdla_dev->drm,
+					 "Handle cdma weight done event, processor %s group %u\n",
+					 processor->name, group->id);
+
+			ret = nvdla_update_consumers(engine, group, group->op_desc,
+										NVDLA_EVENT_CDMA_WT_DONE);
+			if (ret)
+				goto exit;
+		}
+
+		if ((1 << NVDLA_EVENT_CDMA_DT_DONE) & group->events) {
+			drm_info(nvdla_dev->drm,
+					 "Handle cdma data done event, processor %s group %u\n",
+					 processor->name, group->id);
+
+			ret = nvdla_update_consumers(engine, group,
+										group->op_desc,
+										NVDLA_EVENT_CDMA_DT_DONE);
+			if (ret)
+				goto exit;
+		}
+
+		/**
+		 * Handle complete after all other events
+		 */
+		if ((1 << NVDLA_EVENT_OP_COMPLETED) & group->events) {
+			drm_info(nvdla_dev->drm,
+					 "Handle op complete event, processor %s group %u\n",
+					 processor->name, group->id);
+
+			ret = nvdla_op_completion(engine, processor, group);
+			if (ret)
+				goto exit;
+		}
+
+		/**
+		 * Clear all events
+		 */
+		group->events = 0;
+		group_id = !group_id;
+	}
+exit:
+	return ret;
+}
+
+int
+nvdla_process_events(struct nvdla_engine *engine, uint32_t *task_complete)
+{
+	int32_t i;
+	int32_t ret = 0;
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		struct nvdla_processor *processor;
+
+		processor = &engine->processors[i];
+		ret = nvdla_handle_events(engine, processor);
+		/**
+		 * Incase engine status is non-zero, then don't
+		 * update the engine status. We should keep its
+		 * status for later cleaning of engine.
+		 */
+		if (!engine->status)
+			engine->status = ret;
+	}
+
+	if (engine->network->num_operations == engine->num_proc_hwl)
+		*task_complete = 1;
+
+	return ret;
+}
+
+/**
+ * Execute task selected by task scheduler
+ *
+ * 1. Read network configuration for the task
+ * 2. Initiate processors with head of list for same op
+ * 3. Start processing events received
+ */
+int
+nvdla_execute_task(struct nvdla_engine *engine, void *task_data, void *config_data)
+{
+	int32_t ret;
+
+	if (engine == NULL) {
+		ret = -EINVAL;
+		goto complete;
+	}
+
+	if (engine->task == NULL) {
+		ret = -EINVAL;
+		goto complete;
+	}
+
+	if (engine->task->task_data != NULL) {
+		/* We have on the fly tasks running */
+		ret = -EBUSY;
+		goto complete;
+	}
+
+	engine->task->task_data = task_data;
+	engine->config_data = config_data;
+	engine->network = &network;
+	engine->num_proc_hwl = 0;
+
+	ret = nvdla_read_network_config(engine);
+	if (ret)
+		goto complete;
+
+	/* If no operations in a task means nothing to do, NULL task */
+	if (engine->network->num_operations == 0)
+		goto complete;
+
+	ret = nvdla_initiate_processors(engine);
+	engine->status = ret;
+
+complete:
+	return ret;
+}
+
+void
+nvdla_clear_task(struct nvdla_engine *engine)
+{
+	int32_t i, j;
+	struct nvdla_device *nvdla_dev =
+		(struct nvdla_device *)engine->driver_context;
+
+	for (i = 0; i < NVDLA_OP_NUM; i++) {
+		struct nvdla_processor *processor = &engine->processors[i];
+
+		processor->roi_index = 0;
+		processor->group_status = 0;
+		processor->rdma_status = 0;
+
+		processor->tail_op = NULL;
+
+		for (j = 0; j < NVDLA_NUM_GROUPS; j++) {
+			struct nvdla_processor_group *group =
+						&processor->groups[j];
+
+			group->rdma_id = group->id;
+			group->active = 0;
+			group->events = 0;
+			group->roi_index = 0;
+			group->is_rdma_needed = 0;
+			group->lut_index = -1;
+		}
+	}
+
+	engine->task->task_data = NULL;
+	engine->network = NULL;
+	engine->num_proc_hwl = 0;
+	engine->status = 0;
+
+	drm_info(nvdla_dev->drm, "reset engine done\n");
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_sdp.c b/drivers/gpu/drm/nvdla/nvdla_sdp.c
new file mode 100644
index 000000000000..a7cd67d2e977
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_sdp.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_drv.h"
+#include "nvdla_reg.h"
+#include "nvdla_common.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_ena[] = {
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DISABLE, YES),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DISABLE, NO),
+};
+
+static const uint8_t map_prelu[] = {
+	FIELD_ENUM(SDP_D_DP_BS_CFG_0, BS_MUL_PRELU, NO),
+	FIELD_ENUM(SDP_D_DP_BS_CFG_0, BS_MUL_PRELU, YES),
+};
+
+static const uint8_t map_bypass[] = {
+	FIELD_ENUM(SDP_D_DP_BS_CFG_0, BS_BYPASS, YES),
+	FIELD_ENUM(SDP_D_DP_BS_CFG_0, BS_BYPASS, NO),
+};
+
+static const uint8_t map_alu_op[] = {
+	FIELD_ENUM(SDP_D_DP_EW_CFG_0, EW_ALU_ALGO, MAX),
+	FIELD_ENUM(SDP_D_DP_EW_CFG_0, EW_ALU_ALGO, MIN),
+	FIELD_ENUM(SDP_D_DP_EW_CFG_0, EW_ALU_ALGO, SUM),
+	FIELD_ENUM(SDP_D_DP_EW_CFG_0, EW_ALU_ALGO, EQL),
+};
+
+static const uint8_t map_alu_src[] = {
+	FIELD_ENUM(SDP_D_DP_BS_ALU_CFG_0, BS_ALU_SRC, MEM),
+	FIELD_ENUM(SDP_D_DP_BS_ALU_CFG_0, BS_ALU_SRC, REG),
+};
+
+static const uint8_t map_fly[] = {
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, FLYING_MODE, OFF),
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, FLYING_MODE, ON),
+};
+
+static const uint8_t map_dst[] = {
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, OUTPUT_DST, MEM),
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, OUTPUT_DST, PDP),
+};
+
+
+static const uint8_t map_wg[] = {
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, WINOGRAD, OFF),
+	FIELD_ENUM(SDP_D_FEATURE_MODE_CFG_0, WINOGRAD, ON),
+};
+
+static const uint8_t map_precision[] = {
+	FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT8),
+	FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT16),
+	FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, FP16),
+};
+
+static const uint32_t map_proc_precision[3][3] = {
+	{
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT8),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT8),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, FP16),
+	},
+	{
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT8),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT16),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, FP16),
+	},
+	{
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT8),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, INT16),
+		FIELD_ENUM(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION, FP16),
+	},
+};
+
+static const uint8_t map_op_type[] = {
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_USE, MUL),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_USE, MUL),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_USE, ALU),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_USE, BOTH),
+};
+
+static const uint8_t map_element_size[] = {
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_SIZE, ONE_BYTE),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_SIZE, TWO_BYTE),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_SIZE, TWO_BYTE),
+};
+
+static const uint8_t map_op_mode[] = {
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_MODE, PER_ELEMENT),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_MODE, PER_KERNEL),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DATA_MODE, PER_ELEMENT),
+};
+
+static const uint8_t map_ram_type[] = {
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_RAM_TYPE, MC),
+	FIELD_ENUM(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_RAM_TYPE, CV),
+};
+
+static const uint8_t map_perf_dma[] = {
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_DMA_EN, NO),
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_DMA_EN, YES),
+};
+
+static const uint8_t map_perf_lut[] = {
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_LUT_EN, NO),
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_LUT_EN, YES),
+};
+
+static const uint8_t map_perf_sat[] = {
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_SAT_EN, NO),
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_SAT_EN, YES),
+};
+
+static const uint8_t map_perf_nan_inf[] = {
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_NAN_INF_COUNT_EN, NO),
+	FIELD_ENUM(SDP_D_PERF_ENABLE_0, PERF_NAN_INF_COUNT_EN, YES),
+};
+
+void
+nvdla_sdp_set_producer(struct nvdla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+
+	reg = group_id << SHIFT(SDP_S_POINTER_0, PRODUCER);
+	sdp_reg_write(engine, S_POINTER, reg);
+	reg = rdma_group_id << SHIFT(SDP_RDMA_S_POINTER_0, PRODUCER);
+	sdp_rdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+nvdla_sdp_enable(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	uint32_t reg;
+
+	/* enable all sub-modules */
+	if (group->is_rdma_needed) {
+		reg = FIELD_ENUM(SDP_RDMA_D_OP_ENABLE_0, OP_EN, ENABLE);
+		sdp_rdma_reg_write(engine, D_OP_ENABLE, reg);
+	}
+	reg = FIELD_ENUM(SDP_D_OP_ENABLE_0, OP_EN, ENABLE);
+	sdp_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+nvdla_sdp_rdma_check(struct nvdla_processor_group *group)
+{
+	uint8_t x1_rdma_ena;
+	uint8_t x2_rdma_ena;
+	uint8_t y_rdma_ena;
+	uint8_t fly;
+	struct nvdla_sdp_op_desc *sdp_op;
+	struct nvdla_sdp_surface_desc *sdp_surface;
+
+	sdp_op = &group->operation_desc->sdp_op;
+	sdp_surface = &group->surface_desc->sdp_surface;
+
+	x1_rdma_ena = sdp_op->x1_op.enable;
+	x2_rdma_ena = sdp_op->x2_op.enable;
+	y_rdma_ena  = sdp_op->y_op.enable;
+
+	x1_rdma_ena &= (sdp_op->x1_op.mode != SDP_OP_PER_LAYER);
+	x2_rdma_ena &= (sdp_op->x2_op.mode != SDP_OP_PER_LAYER);
+	y_rdma_ena &= (sdp_op->y_op.mode != SDP_OP_PER_LAYER);
+
+	fly = sdp_surface->src_data.type == NVDLA_MEM_HW;
+
+	group->is_rdma_needed = (!fly) || (x1_rdma_ena ||
+					x2_rdma_ena || y_rdma_ena);
+}
+
+static int32_t
+processor_sdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint64_t src_addr = -1, x1_addr = -1, x2_addr = -1;
+	uint64_t  y_addr = -1, dst_addr = -1;
+	uint32_t reg, high, low;
+	uint8_t fly;
+	uint32_t atom_size;
+	struct nvdla_sdp_op *x1_op;
+	struct nvdla_sdp_op *x2_op;
+	struct nvdla_sdp_op *y_op;
+	uint8_t x1_rdma_ena;
+	uint8_t x2_rdma_ena;
+	uint8_t y_rdma_ena;
+	uint8_t out_dma_ena;
+	struct nvdla_lut_param lut;
+	struct nvdla_sdp_op_desc *sdp_op;
+	struct nvdla_sdp_surface_desc *sdp_surface;
+
+	atom_size = engine->config_data->atom_size;
+
+	sdp_op = &group->operation_desc->sdp_op;
+	sdp_surface = &group->surface_desc->sdp_surface;
+
+	fly = sdp_surface->src_data.type == NVDLA_MEM_HW;
+	out_dma_ena = sdp_surface->dst_data.type != NVDLA_MEM_HW;
+	x1_op = &sdp_op->x1_op;
+	x2_op = &sdp_op->x2_op;
+	y_op = &sdp_op->y_op;
+	x1_rdma_ena = x1_op->enable && x1_op->type != SDP_OP_NONE;
+	x2_rdma_ena = x2_op->enable && x2_op->type != SDP_OP_NONE;
+	y_rdma_ena  = y_op->enable && y_op->type != SDP_OP_NONE;
+
+	/* load address */
+	if (!fly) {
+		ret = nvdla_read_input_address(engine, &sdp_surface->src_data,
+						&src_addr,
+						group->op_desc->index,
+						group->roi_index,
+					    1);
+		if (ret)
+			goto exit;
+	}
+
+	if (out_dma_ena) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->dst_data.address,
+					sdp_surface->dst_data.offset,
+					(void *)&dst_addr,
+					DESTINATION_DMA);
+	}
+
+	if (sdp_op->lut_index >= 0) {
+		group->lut_index = sdp_op->lut_index;
+		nvdla_read_lut(engine, sdp_op->lut_index, (void *)&lut);
+	}
+
+
+	x1_rdma_ena &= (x1_op->mode != SDP_OP_PER_LAYER);
+	x2_rdma_ena &= (x2_op->mode != SDP_OP_PER_LAYER);
+	y_rdma_ena &= (y_op->mode != SDP_OP_PER_LAYER);
+
+	if (x1_rdma_ena) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->x1_data.address,
+					sdp_surface->x1_data.offset,
+					(void *)&x1_addr,
+					DESTINATION_DMA);
+	}
+	if (x2_rdma_ena) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->x2_data.address,
+					sdp_surface->x2_data.offset,
+					(void *)&x2_addr,
+					DESTINATION_DMA);
+	}
+	if (y_rdma_ena) {
+		nvdla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->y_data.address,
+					sdp_surface->y_data.offset,
+					(void *)&y_addr,
+					DESTINATION_DMA);
+	}
+
+	reg = (map_fly[0] << SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, FLYING_MODE));
+	sdp_rdma_reg_write(engine, D_FEATURE_MODE_CFG, reg);
+
+	reg = (map_ena[1] << SHIFT(SDP_RDMA_D_BRDMA_CFG_0, BRDMA_DISABLE));
+	sdp_rdma_reg_write(engine, D_BRDMA_CFG, reg);
+	reg = (map_ena[1] << SHIFT(SDP_RDMA_D_NRDMA_CFG_0, NRDMA_DISABLE));
+	sdp_rdma_reg_write(engine, D_NRDMA_CFG, reg);
+	reg = (map_ena[1] << SHIFT(SDP_RDMA_D_ERDMA_CFG_0, ERDMA_DISABLE));
+	sdp_rdma_reg_write(engine, D_ERDMA_CFG, reg);
+
+	reg = (map_fly[fly] <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, FLYING_MODE)) |
+	(map_wg[sdp_op->conv_mode == CONV_MODE_WINOGRAD] <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, WINOGRAD)) |
+	(map_precision[sdp_op->src_precision] <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, IN_PRECISION)) |
+	(map_precision[sdp_op->dst_precision] <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, OUT_PRECISION)) |
+	(map_proc_precision[sdp_op->dst_precision][sdp_op->src_precision] <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, PROC_PRECISION)) |
+	((sdp_op->batch_num-1) <<
+			SHIFT(SDP_RDMA_D_FEATURE_MODE_CFG_0, BATCH_NUMBER));
+	sdp_rdma_reg_write(engine, D_FEATURE_MODE_CFG, reg);
+
+	if (group->is_rdma_needed) {
+
+		sdp_rdma_reg_write(engine, D_DATA_CUBE_WIDTH,
+					sdp_surface->src_data.width - 1);
+		sdp_rdma_reg_write(engine, D_DATA_CUBE_HEIGHT,
+					sdp_surface->src_data.height - 1);
+		sdp_rdma_reg_write(engine, D_DATA_CUBE_CHANNEL,
+					sdp_surface->src_data.channel - 1);
+
+		/* config SDP source info */
+		if (!fly) {
+			/**
+			 * if not on-the-fly, we have to config
+			 * the source cube info
+			 */
+			high = upper_32_bits(src_addr);
+			low = lower_32_bits(src_addr);
+			sdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_LOW, low);
+			sdp_rdma_reg_write(engine, D_SRC_BASE_ADDR_HIGH, high);
+			sdp_rdma_reg_write(engine, D_SRC_LINE_STRIDE,
+					sdp_surface->src_data.line_stride);
+			sdp_rdma_reg_write(engine, D_SRC_SURFACE_STRIDE,
+					sdp_surface->src_data.surf_stride);
+			sdp_rdma_reg_write(engine, D_SRC_DMA_CFG,
+				map_ram_type[sdp_surface->src_data.type]);
+		}
+
+		/* config x1 source info */
+		reg = (map_ena[x1_rdma_ena] <<
+				SHIFT(SDP_RDMA_D_BRDMA_CFG_0,
+				BRDMA_DISABLE)) |
+			(map_op_type[x1_op->type] <<
+				SHIFT(SDP_RDMA_D_BRDMA_CFG_0,
+				BRDMA_DATA_USE)) |
+			(map_element_size[x1_op->precision] <<
+				SHIFT(SDP_RDMA_D_BRDMA_CFG_0,
+				BRDMA_DATA_SIZE)) |
+			(map_op_mode[x1_op->mode] <<
+				SHIFT(SDP_RDMA_D_BRDMA_CFG_0,
+				BRDMA_DATA_MODE)) |
+			(map_ram_type[sdp_surface->x1_data.type] <<
+				SHIFT(SDP_RDMA_D_BRDMA_CFG_0,
+				BRDMA_RAM_TYPE));
+		sdp_rdma_reg_write(engine, D_BRDMA_CFG, reg);
+
+		if (x1_rdma_ena) {
+			high = upper_32_bits(x1_addr);
+			low = lower_32_bits(x1_addr);
+			sdp_rdma_reg_write(engine, D_BS_BASE_ADDR_LOW,
+					low);
+			sdp_rdma_reg_write(engine, D_BS_BASE_ADDR_HIGH,
+					high);
+			sdp_rdma_reg_write(engine, D_BS_LINE_STRIDE,
+					sdp_surface->x1_data.line_stride);
+			sdp_rdma_reg_write(engine, D_BS_SURFACE_STRIDE,
+					sdp_surface->x1_data.surf_stride);
+		}
+
+		/* config x2 source info */
+		reg = (map_ena[x2_rdma_ena] <<
+					SHIFT(SDP_RDMA_D_NRDMA_CFG_0,
+					NRDMA_DISABLE)) |
+			(map_op_type[x2_op->type] <<
+					SHIFT(SDP_RDMA_D_NRDMA_CFG_0,
+					NRDMA_DATA_USE)) |
+			(map_element_size[x2_op->precision] <<
+					SHIFT(SDP_RDMA_D_NRDMA_CFG_0,
+					NRDMA_DATA_SIZE)) |
+			(map_op_mode[x2_op->mode] <<
+					SHIFT(SDP_RDMA_D_NRDMA_CFG_0,
+					NRDMA_DATA_MODE)) |
+			(map_ram_type[sdp_surface->x2_data.type] <<
+					SHIFT(SDP_RDMA_D_NRDMA_CFG_0,
+					NRDMA_RAM_TYPE));
+
+		sdp_rdma_reg_write(engine, D_NRDMA_CFG, reg);
+
+		if (x2_rdma_ena) {
+			high = upper_32_bits(x2_addr);
+			low = lower_32_bits(x2_addr);
+			sdp_rdma_reg_write(engine, D_BN_BASE_ADDR_LOW,
+					low);
+			sdp_rdma_reg_write(engine, D_BN_BASE_ADDR_HIGH,
+					high);
+			sdp_rdma_reg_write(engine, D_BN_LINE_STRIDE,
+					sdp_surface->x2_data.line_stride);
+			sdp_rdma_reg_write(engine, D_BN_SURFACE_STRIDE,
+					sdp_surface->x2_data.surf_stride);
+		}
+
+		/* config y source info */
+		reg = (map_ena[y_rdma_ena] <<
+				SHIFT(SDP_RDMA_D_ERDMA_CFG_0,
+				ERDMA_DISABLE)) |
+			(map_op_type[y_op->type] <<
+				SHIFT(SDP_RDMA_D_ERDMA_CFG_0,
+				ERDMA_DATA_USE)) |
+			(map_element_size[y_op->precision] <<
+				SHIFT(SDP_RDMA_D_ERDMA_CFG_0,
+				ERDMA_DATA_SIZE)) |
+			(map_op_mode[y_op->mode] <<
+				SHIFT(SDP_RDMA_D_ERDMA_CFG_0,
+				ERDMA_DATA_MODE)) |
+			(map_ram_type[sdp_surface->y_data.type] <<
+				SHIFT(SDP_RDMA_D_ERDMA_CFG_0,
+				ERDMA_RAM_TYPE));
+
+		sdp_rdma_reg_write(engine, D_ERDMA_CFG, reg);
+		if (y_rdma_ena) {
+			high = upper_32_bits(y_addr);
+			low = lower_32_bits(y_addr);
+			sdp_rdma_reg_write(engine, D_EW_BASE_ADDR_LOW,
+					low);
+			sdp_rdma_reg_write(engine, D_EW_BASE_ADDR_HIGH,
+					high);
+			sdp_rdma_reg_write(engine, D_EW_LINE_STRIDE,
+					sdp_surface->y_data.line_stride);
+			sdp_rdma_reg_write(engine, D_EW_SURFACE_STRIDE,
+					sdp_surface->y_data.surf_stride);
+		}
+	}
+
+	if (sdp_op->lut_index >= 0)
+		update_lut(engine, SDP_S_LUT_ACCESS_CFG_0, &lut,
+					sdp_op->src_precision);
+
+	sdp_reg_write(engine, D_DATA_CUBE_WIDTH, sdp_surface->src_data.width - 1);
+	sdp_reg_write(engine, D_DATA_CUBE_HEIGHT, sdp_surface->src_data.height - 1);
+	sdp_reg_write(engine, D_DATA_CUBE_CHANNEL, sdp_surface->src_data.channel - 1);
+
+	if (out_dma_ena) {
+		high = upper_32_bits(dst_addr);
+		low = lower_32_bits(dst_addr);
+		sdp_reg_write(engine, D_DST_BASE_ADDR_HIGH,
+				high);
+		sdp_reg_write(engine, D_DST_BASE_ADDR_LOW,
+				low);
+		sdp_reg_write(engine, D_DST_LINE_STRIDE,
+				sdp_surface->dst_data.line_stride);
+		sdp_reg_write(engine, D_DST_SURFACE_STRIDE,
+				sdp_surface->dst_data.surf_stride);
+	}
+
+	/* Config BS module */
+	reg = (map_bypass[x1_op->enable] <<
+			SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_BYPASS)) |
+		(map_bypass[x1_op->type != SDP_OP_MUL &&
+				x1_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_ALU_BYPASS)) |
+		(map_alu_op[x1_op->alu_type] <<
+			SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_ALU_ALGO)) |
+		(map_bypass[x1_op->type != SDP_OP_ADD &&
+			x1_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_MUL_BYPASS)) |
+		(map_prelu[x1_op->act == ACTIVATION_PRELU]
+			<< SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_MUL_PRELU)) |
+		(map_bypass[x1_op->act == ACTIVATION_RELU] <<
+			SHIFT(SDP_D_DP_BS_CFG_0,
+			BS_RELU_BYPASS));
+	sdp_reg_write(engine, D_DP_BS_CFG, reg);
+
+	if (x1_op->enable) {
+		if (x1_op->type == SDP_OP_ADD ||
+				x1_op->type == SDP_OP_BOTH) {
+			reg = (map_alu_src[x1_op->mode == SDP_OP_PER_LAYER] <<
+					SHIFT(SDP_D_DP_BS_ALU_CFG_0,
+					BS_ALU_SRC)) |
+				(x1_op->shift_value <<
+					SHIFT(SDP_D_DP_BS_ALU_CFG_0,
+					BS_ALU_SHIFT_VALUE));
+			sdp_reg_write(engine, D_DP_BS_ALU_CFG, reg);
+		}
+
+		if (x1_op->mode == SDP_OP_PER_LAYER) {
+			sdp_reg_write(engine, D_DP_BS_ALU_SRC_VALUE,
+					x1_op->alu_operand);
+			sdp_reg_write(engine, D_DP_BS_MUL_SRC_VALUE,
+					x1_op->mul_operand);
+		}
+
+		/**
+		 * MUL truncate will take effect no matter
+		 * MUL is bypassed or not
+		 */
+		reg = (map_alu_src[x1_op->mode == SDP_OP_PER_LAYER] <<
+			SHIFT(SDP_D_DP_BS_MUL_CFG_0,
+			BS_MUL_SRC)) |
+		(x1_op->truncate <<
+			SHIFT(SDP_D_DP_BS_MUL_CFG_0,
+			BS_MUL_SHIFT_VALUE));
+		sdp_reg_write(engine, D_DP_BS_MUL_CFG, reg);
+	}
+
+	/* Config BN module */
+	reg = (map_bypass[x2_op->enable] <<
+			SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_BYPASS)) |
+		(map_bypass[x2_op->type != SDP_OP_MUL &&
+			x2_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_ALU_BYPASS)) |
+		(map_alu_op[x2_op->alu_type] <<
+			SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_ALU_ALGO)) |
+		(map_bypass[x2_op->type != SDP_OP_ADD &&
+			x2_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_MUL_BYPASS)) |
+		(map_prelu[x2_op->act == ACTIVATION_PRELU]
+			<< SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_MUL_PRELU)) |
+		(map_bypass[x2_op->act == ACTIVATION_RELU]
+			<< SHIFT(SDP_D_DP_BN_CFG_0,
+			BN_RELU_BYPASS));
+	sdp_reg_write(engine, D_DP_BN_CFG, reg);
+
+	if (x2_op->enable) {
+		if (x2_op->type == SDP_OP_ADD ||
+			x2_op->type == SDP_OP_BOTH) {
+			reg = (map_alu_src[x2_op->mode == SDP_OP_PER_LAYER] <<
+					SHIFT(SDP_D_DP_BN_ALU_CFG_0,
+					BN_ALU_SRC)) |
+				(x2_op->shift_value <<
+					SHIFT(SDP_D_DP_BN_ALU_CFG_0,
+					BN_ALU_SHIFT_VALUE));
+			sdp_reg_write(engine, D_DP_BN_ALU_CFG, reg);
+		}
+
+		if (x2_op->mode == SDP_OP_PER_LAYER) {
+			sdp_reg_write(engine, D_DP_BN_ALU_SRC_VALUE,
+					x2_op->alu_operand);
+			sdp_reg_write(engine, D_DP_BN_MUL_SRC_VALUE,
+					x2_op->mul_operand);
+		}
+
+		reg = (map_alu_src[x2_op->mode == SDP_OP_PER_LAYER] <<
+				SHIFT(SDP_D_DP_BN_MUL_CFG_0,
+				BN_MUL_SRC)) |
+			(x2_op->truncate <<
+				SHIFT(SDP_D_DP_BN_MUL_CFG_0,
+				BN_MUL_SHIFT_VALUE));
+		sdp_reg_write(engine, D_DP_BN_MUL_CFG, reg);
+	}
+
+	/* Config EW module */
+	reg = (map_bypass[y_op->enable] <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_BYPASS)) |
+		(map_bypass[y_op->type != SDP_OP_MUL &&
+			y_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_ALU_BYPASS)) |
+		(map_alu_op[y_op->alu_type] <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_ALU_ALGO)) |
+		(map_bypass[y_op->type != SDP_OP_ADD &&
+			y_op->type != SDP_OP_NONE] <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_MUL_BYPASS)) |
+		((map_prelu[y_op->act == ACTIVATION_PRELU]) <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_MUL_PRELU)) |
+		(map_bypass[y_op->act == ACTIVATION_LUT] <<
+			SHIFT(SDP_D_DP_EW_CFG_0,
+			EW_LUT_BYPASS));
+	sdp_reg_write(engine, D_DP_EW_CFG, reg);
+
+	if (y_op->enable) {
+		if (y_op->type == SDP_OP_ADD || y_op->type == SDP_OP_BOTH) {
+			reg = (map_alu_src[y_op->mode == SDP_OP_PER_LAYER] <<
+					SHIFT(SDP_D_DP_EW_ALU_CFG_0,
+					EW_ALU_SRC)) |
+				(map_bypass[y_op->cvt.alu_cvt.enable] <<
+					SHIFT(SDP_D_DP_EW_ALU_CFG_0,
+					EW_ALU_CVT_BYPASS));
+			sdp_reg_write(engine, D_DP_EW_ALU_CFG, reg);
+
+			if (y_op->mode == SDP_OP_PER_LAYER) {
+				sdp_reg_write(engine, D_DP_EW_ALU_SRC_VALUE,
+						y_op->alu_operand);
+			} else {
+				sdp_reg_write(engine, D_DP_EW_ALU_CVT_OFFSET_VALUE,
+						y_op->cvt.alu_cvt.offset);
+				sdp_reg_write(engine, D_DP_EW_ALU_CVT_SCALE_VALUE,
+						y_op->cvt.alu_cvt.scale);
+				sdp_reg_write(engine, D_DP_EW_ALU_CVT_TRUNCATE_VALUE,
+						y_op->cvt.alu_cvt.truncate);
+			}
+		}
+
+		if (y_op->type == SDP_OP_MUL || y_op->type == SDP_OP_BOTH) {
+			reg = (map_alu_src[y_op->mode == SDP_OP_PER_LAYER] <<
+					SHIFT(SDP_D_DP_EW_MUL_CFG_0,
+					EW_MUL_SRC)) |
+				(map_bypass[y_op->cvt.mul_cvt.enable] <<
+					SHIFT(SDP_D_DP_EW_MUL_CFG_0,
+					EW_MUL_CVT_BYPASS));
+			sdp_reg_write(engine, D_DP_EW_MUL_CFG, reg);
+
+			if (y_op->mode == SDP_OP_PER_LAYER) {
+				sdp_reg_write(engine, D_DP_EW_MUL_SRC_VALUE,
+						y_op->mul_operand);
+			} else {
+				sdp_reg_write(engine, D_DP_EW_MUL_CVT_OFFSET_VALUE,
+						y_op->cvt.mul_cvt.offset);
+				sdp_reg_write(engine, D_DP_EW_MUL_CVT_SCALE_VALUE,
+						y_op->cvt.mul_cvt.scale);
+				sdp_reg_write(engine, D_DP_EW_MUL_CVT_TRUNCATE_VALUE,
+						y_op->cvt.mul_cvt.truncate);
+			}
+		}
+
+		sdp_reg_write(engine, D_DP_EW_TRUNCATE_VALUE, y_op->truncate);
+	}
+
+	reg = (map_fly[sdp_surface->src_data.type == NVDLA_MEM_HW] <<
+			SHIFT(SDP_D_FEATURE_MODE_CFG_0,
+			FLYING_MODE)) |
+		(map_dst[sdp_surface->dst_data.type == NVDLA_MEM_HW] <<
+			SHIFT(SDP_D_FEATURE_MODE_CFG_0,
+			OUTPUT_DST)) |
+		(map_wg[sdp_op->conv_mode == CONV_MODE_WINOGRAD] <<
+			SHIFT(SDP_D_FEATURE_MODE_CFG_0,
+			WINOGRAD)) |
+		((sdp_op->batch_num - 1) <<
+			SHIFT(SDP_D_FEATURE_MODE_CFG_0,
+			BATCH_NUMBER));
+	sdp_reg_write(engine, D_FEATURE_MODE_CFG, reg);
+	sdp_reg_write(engine, D_DST_DMA_CFG,
+			map_ram_type[sdp_surface->dst_data.type]);
+	if (sdp_op->batch_num > 1)
+		sdp_reg_write(engine, D_DST_BATCH_STRIDE, sdp_op->batch_stride);
+
+	reg =
+	(map_proc_precision[sdp_op->dst_precision][sdp_op->src_precision] <<
+			SHIFT(SDP_D_DATA_FORMAT_0,
+			PROC_PRECISION)) |
+		(map_precision[sdp_op->dst_precision] <<
+			SHIFT(SDP_D_DATA_FORMAT_0,
+			OUT_PRECISION));
+	sdp_reg_write(engine, D_DATA_FORMAT, reg);
+	sdp_reg_write(engine, D_CVT_OFFSET, sdp_op->out_cvt.offset);
+	sdp_reg_write(engine, D_CVT_SCALE, sdp_op->out_cvt.scale);
+	sdp_reg_write(engine, D_CVT_SHIFT, sdp_op->out_cvt.truncate);
+
+exit:
+	return ret;
+}
+
+int
+nvdla_sdp_is_ready(struct nvdla_processor *processor,
+			   struct nvdla_processor_group *group)
+{
+	struct nvdla_processor_group *next_group;
+	struct nvdla_sdp_op_desc *sdp_op;
+
+	sdp_op = &group->operation_desc->sdp_op;
+	next_group = &processor->groups[!group->id];
+
+	/**
+	 * Single LUT is shared between two SDP groups, need to make
+	 * sure that usage does not conflict. Also, LUT write
+	 * access is locked when SDP sub-engine is active, so delay
+	 * writing LUT when another group is active.
+	 */
+
+	/**
+	 * if no LUT required for current group then it can be programmed
+	 * without further checks
+	 */
+	if (sdp_op->lut_index == -1)
+		return 1;
+
+	/**
+	 * if same LUT is used for both groups then it can be programmed
+	 * without more checks. Even if another group is active and LUT
+	 * is locked, it would have been programmed by another group.
+	 */
+	if (next_group->lut_index == sdp_op->lut_index)
+		return 1;
+
+	/**
+	 * if LUT index of another group is not -1 means some LUT is programmed,
+	 * then do not program current LUT as we already know current LUT is not
+	 * -1 and neither same as another group.
+	 */
+	if (next_group->lut_index != -1)
+		return 0;
+
+	/**
+	 * if current group needs LUT different than another group and that
+	 * group is not active then program it.
+	 */
+	if (!next_group->active)
+		return 1;
+
+	/**
+	 * if control is here it means current group is using LUT different than
+	 * another group and that group is active. Wait for another group to
+	 * become idle.
+	 */
+	return 0;
+}
+
+void
+nvdla_sdp_dump_config(struct nvdla_processor_group *group)
+{
+	struct nvdla_sdp_op_desc *sdp_op;
+	struct nvdla_sdp_surface_desc *sdp_surface;
+
+	sdp_surface = &group->surface_desc->sdp_surface;
+	sdp_op = &group->operation_desc->sdp_op;
+}
+
+int
+nvdla_sdp_program(struct nvdla_engine *engine, struct nvdla_processor_group *group)
+{
+	int32_t ret;
+
+	nvdla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, SDP_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, SDP_DONE_MASK0));
+
+	ret = processor_sdp_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
-- 
2.25.1

