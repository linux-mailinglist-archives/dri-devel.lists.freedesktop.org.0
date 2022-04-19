Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511185075B0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204C010EEA5;
	Tue, 19 Apr 2022 16:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Tue, 19 Apr 2022 14:08:48 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AAB10EF6F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:08:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650376818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5Wvlvmle3kAEhd+ojl34QrMg46Tjf7j2xlUSKh9vcM=;
 b=S8d8eQmdOHnnCLSfElo4+JkEtMfdNdh6T6AV/VZjY434RtjnFHhEK531BUY4IoXwOusSlI
 hQFmdmKFr7vhD4Y8dTR5E5zIX4uPqf6RZraCctXdZ8ibp46uYJJU3CqXOU3YrvkXV7cyvC
 MyDKXC6xk4OpRn+VDH63i1j0QgOhPTY=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Date: Tue, 19 Apr 2022 21:59:00 +0800
Message-Id: <20220419135908.39606-3-cai.huoqing@linux.dev>
In-Reply-To: <20220419135908.39606-1-cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Mailman-Approved-At: Tue, 19 Apr 2022 16:58:45 +0000
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
 drivers/gpu/drm/Kconfig                 |    2 +
 drivers/gpu/drm/Makefile                |    1 +
 drivers/gpu/drm/nvdla/Kconfig           |    8 +
 drivers/gpu/drm/nvdla/Makefile          |   19 +
 drivers/gpu/drm/nvdla/nvdla_bdma.c      |  200 +
 drivers/gpu/drm/nvdla/nvdla_cache.c     |  215 +
 drivers/gpu/drm/nvdla/nvdla_cdp.c       |  300 ++
 drivers/gpu/drm/nvdla/nvdla_common.c    |  295 ++
 drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
 drivers/gpu/drm/nvdla/nvdla_conv.c      |  683 +++
 drivers/gpu/drm/nvdla/nvdla_drm.c       |  695 +++
 drivers/gpu/drm/nvdla/nvdla_drm.h       |  127 +
 drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
 drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
 drivers/gpu/drm/nvdla/nvdla_gem.c       |  393 ++
 drivers/gpu/drm/nvdla/nvdla_ioctl.h     |   99 +
 drivers/gpu/drm/nvdla/nvdla_pdp.c       |  446 ++
 drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_rubik.c     |  217 +
 drivers/gpu/drm/nvdla/nvdla_sched.h     |   52 +
 drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1005 ++++
 drivers/gpu/drm/nvdla/nvdla_sdp.c       |  728 +++
 22 files changed, 13236 insertions(+)
 create mode 100644 drivers/gpu/drm/nvdla/Kconfig
 create mode 100644 drivers/gpu/drm/nvdla/Makefile
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_ioctl.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
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
index 000000000000..74f37d258f8d
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/Makefile
@@ -0,0 +1,19 @@
+
+# SPDX-License-Identifier: GPL-2.0
+nvdla-drm-y := \
+	nvdla_drm.o \
+	nvdla_gem.o \
+	nvdla_scheduler.o \
+	nvdla_engine.o \
+	nvdla_bdma.o \
+	nvdla_conv.o \
+	nvdla_sdp.o \
+	nvdla_cdp.o \
+	nvdla_pdp.o \
+	nvdla_rubik.o \
+	nvdla_cache.o \
+	nvdla_common.o \
+	nvdla_engine_data.o \
+	nvdla_engine_debug.o \
+
+obj-$(CONFIG_DRM_NVDLA) += nvdla-drm.o
diff --git a/drivers/gpu/drm/nvdla/nvdla_bdma.c b/drivers/gpu/drm/nvdla/nvdla_bdma.c
new file mode 100644
index 000000000000..225613f27acf
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_bdma.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+static const uint8_t map_mem[] = {
+	FIELD_ENUM(BDMA_CFG_CMD_0, SRC_RAM_TYPE, MC),
+	FIELD_ENUM(BDMA_CFG_CMD_0, SRC_RAM_TYPE, CVSRAM),
+};
+
+void
+dla_bdma_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	/**
+	 * There is no producer bit for BDMA operation,
+	 * interrupt pointer decides which outstanding request
+	 * to use for this BDMA operation
+	 */
+}
+
+int
+dla_bdma_enable(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	if (group->surface_desc->bdma_surface.num_transfers == (uint16_t)0) {
+		group->events |= ((uint8_t)1 << DLA_EVENT_OP_COMPLETED);
+		goto exit;
+	}
+
+	/**
+	 * Launch BDMA transfer
+	 */
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
+dla_bdma_rdma_check(struct dla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+/**
+ * Program BDMA slot for transfer
+ */
+static int32_t
+processor_bdma_program_slot(struct dla_engine *engine,
+							struct dla_bdma_surface_desc *bdma_surface,
+							struct dla_bdma_transfer_desc *transfer)
+{
+	int32_t ret = 0;
+	uint64_t source_addr = 0;
+	uint64_t destination_addr = 0;
+	uint32_t high, low, reg;
+	uint8_t  bdma_free_slots = 0;
+
+	/* make sure there're enough free slots */
+	if (bdma_free_slots <= 0) {
+		do {
+			reg = bdma_reg_read(engine, STATUS);
+			reg = (reg & MASK(BDMA_STATUS_0, FREE_SLOT)) >>
+					SHIFT(BDMA_STATUS_0, FREE_SLOT);
+		} while (reg == 0);
+		bdma_free_slots = (uint8_t)reg;
+	}
+
+	dla_get_dma_address(engine->driver_context, engine->task->task_data,
+						transfer->source_address,
+						(void *)&source_addr,
+						DESTINATION_DMA);
+	dla_get_dma_address(engine->driver_context, engine->task->task_data,
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
+dla_bdma_is_ready(struct dla_processor *processor,
+				  struct dla_processor_group *group)
+{
+	struct dla_processor_group *next_group;
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
+						!next_group->active)
+		return 0;
+
+	return 1;
+}
+
+void
+dla_bdma_dump_config(struct dla_processor_group *group)
+{
+	struct dla_bdma_op_desc *bdma_op;
+	struct dla_bdma_surface_desc *bdma_surface;
+
+	bdma_surface = &group->surface_desc->bdma_surface;
+	bdma_op = &group->operation_desc->bdma_op;
+}
+
+int
+dla_bdma_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t i;
+	int32_t ret = 0;
+	struct dla_bdma_surface_desc *bdma_surface;
+
+	if (!engine->config_data->bdma_enable) {
+		pr_err("BDMA is not supported for this configuration\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	bdma_surface = &group->surface_desc->bdma_surface;
+
+	pr_debug("Num of transfers %u\n", bdma_surface->num_transfers);
+	if (bdma_surface->num_transfers == (uint16_t)0)
+		goto exit;
+
+	if (bdma_surface->num_transfers > NUM_MAX_BDMA_OPS) {
+		pr_err("Invalid number of transfers\n");
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
+	dla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, BDMA_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, BDMA_DONE_MASK0));
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_cache.c b/drivers/gpu/drm/nvdla/nvdla_cache.c
new file mode 100644
index 000000000000..f8bd7b514aab
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_cache.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+#define DLA_OP_CACHE_SIZE (DLA_NUM_GROUPS * ((DLA_OP_NUM + 2) * 2))
+
+static struct dla_common_op_desc desc_cache[DLA_OP_NUM][DLA_OP_CACHE_SIZE];
+static int32_t desc_refcount[DLA_OP_NUM][DLA_OP_CACHE_SIZE];
+
+void
+dla_get_refcount(struct dla_common_op_desc *op_desc)
+{
+	int32_t i;
+	struct dla_common_op_desc *desc = NULL;
+
+	if (op_desc == NULL)
+		return;
+
+	if (op_desc->index == -1)
+		return;
+
+	desc = &desc_cache[op_desc->op_type][0];
+
+	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == op_desc->index &&
+				desc->roi_index == op_desc->roi_index) {
+			desc_refcount[op_desc->op_type][i]++;
+			return;
+		}
+	}
+}
+
+struct dla_common_op_desc *
+dla_get_op_desc(struct dla_engine *engine,
+				struct dla_task *task, int16_t index,
+				uint8_t op_type, uint8_t roi_index)
+{
+	int32_t i;
+	int32_t ret;
+	uint64_t op_base;
+	uint64_t dep_graph_addr;
+	struct dla_common_op_desc *desc = NULL;
+
+	if (index == -1) {
+		pr_debug("no desc get due to index==-1\n");
+		goto exit;
+	}
+
+	dep_graph_addr = (sizeof(struct dla_common_op_desc) *
+				engine->network->num_operations * roi_index);
+
+	desc = &desc_cache[op_type][0];
+
+	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == index && desc->roi_index == roi_index) {
+			if (desc->op_type != op_type) {
+				pr_err("op_cache[op=%u] contains incorrect entry of op[%u]\n",
+					   op_type, desc->op_type);
+				continue;
+			}
+			desc_refcount[op_type][i]++;
+			goto exit;
+		}
+	}
+
+	desc = &desc_cache[op_type][0];
+
+	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == -1) {
+			op_base = dep_graph_addr +
+					(sizeof(struct dla_common_op_desc) *
+					(uint64_t)index);
+			ret = dla_data_read(engine->driver_context,
+					task->task_data,
+					task->dependency_graph_addr,
+					(void *)(desc),
+					sizeof(struct dla_common_op_desc),
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
+				pr_err("Fetched [op_type=%u] from DRAM doesn't match with op_type[%u]\n",
+					   desc->op_type, op_type);
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
+dla_free_op_desc(struct dla_engine *engine, struct dla_common_op_desc *op_desc)
+{
+	uint64_t op_base;
+	uint64_t dep_graph_addr;
+	struct dla_task *task;
+
+	pr_debug("Enter: %s op desc index %u ROI %d\n", __func__,
+				op_desc->index, op_desc->roi_index);
+
+	task = engine->task;
+	dep_graph_addr = (sizeof(struct dla_common_op_desc) *
+				engine->network->num_operations *
+				op_desc->roi_index);
+
+	if (op_desc->index == -1)
+		goto exit;
+
+	if (op_desc == NULL)
+		goto exit;
+
+	/**
+	 * TODO: keeping the depth value hardcoded as 0 for now,
+	 * need to replace it once corresponding implementation is done.
+	 */
+	op_base = (dep_graph_addr +
+			(sizeof(struct dla_common_op_desc) *
+			(uint64_t)op_desc->index));
+
+	/**
+	 * Flush descriptor to DRAM
+	 */
+	dla_data_write(engine->driver_context,
+			task->task_data,
+			(void *)op_desc,
+			task->dependency_graph_addr,
+			sizeof(struct dla_common_op_desc),
+			op_base);
+
+	/**
+	 * Release it
+	 */
+	op_desc->index = -1;
+	op_desc->roi_index = -1;
+exit:
+	return;
+}
+
+void
+dla_put_op_desc(struct dla_engine *engine, struct dla_common_op_desc *op_desc)
+{
+	int32_t i;
+	struct dla_common_op_desc *desc;
+
+	if (op_desc == NULL)
+		return;
+
+	if (op_desc->index == -1)
+		return;
+
+	desc = &desc_cache[op_desc->op_type][0];
+
+	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
+		if (desc->index == op_desc->index &&
+				desc->roi_index == op_desc->roi_index) {
+
+			desc_refcount[op_desc->op_type][i]--;
+
+			/**
+			 * Free desc if refcount is 0
+			 */
+			if (desc_refcount[op_desc->op_type][i] == 0)
+				dla_free_op_desc(engine, op_desc);
+
+			return;
+		}
+	}
+}
+
+void
+dla_init_op_cache(struct dla_engine *engine)
+{
+	int32_t i, j;
+	struct dla_common_op_desc *desc = &desc_cache[0][0];
+
+	memset((uint8_t *)&desc_cache[0][0], 0, sizeof(desc_cache));
+	memset((uint8_t *)&desc_refcount[0][0], 0, sizeof(desc_refcount));
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		for (j = 0; j < DLA_OP_CACHE_SIZE; j++) {
+			desc->index = -1;
+			desc->roi_index = -1;
+			desc->op_type = (uint8_t)i;
+			desc++;
+		}
+	}
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_cdp.c b/drivers/gpu/drm/nvdla/nvdla_cdp.c
new file mode 100644
index 000000000000..793161e50b1c
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_cdp.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
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
+dla_cdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id)
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
+dla_cdp_enable(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	uint32_t reg;
+
+	/**
+	 * enable all sub-modules
+	 */
+	reg = FIELD_ENUM(CDP_RDMA_D_OP_ENABLE_0, OP_EN, ENABLE);
+	cdp_rdma_reg_write(engine, D_OP_ENABLE, reg);
+	reg = FIELD_ENUM(CDP_D_OP_ENABLE_0, OP_EN, ENABLE);
+	cdp_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+dla_cdp_rdma_check(struct dla_processor_group *group)
+{
+	group->is_rdma_needed = 1;
+}
+
+static int32_t
+processor_cdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct dla_lut_param lut;
+	struct dla_cdp_op_desc *cdp_op;
+	struct dla_cdp_surface_desc *cdp_surface;
+
+	cdp_op = &group->operation_desc->cdp_op;
+	cdp_surface = &group->surface_desc->cdp_surface;
+
+	/* Argument check */
+	if (cdp_surface->src_data.type == DLA_MEM_HW) {
+		pr_err("Invalid source memory type\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+	if (cdp_surface->dst_data.type == DLA_MEM_HW) {
+		pr_err("Invalid destination memory type\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cdp_op->in_precision != cdp_op->out_precision) {
+		pr_err("CDP does not support precision conversion\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* get the addresses from task descriptor */
+	ret = dla_read_input_address(engine, &cdp_surface->src_data,
+								 &input_address,
+								 group->op_desc->index,
+								 group->roi_index, 1);
+	if (ret)
+		goto exit;
+
+	dla_get_dma_cube_address(engine->driver_context,
+							 engine->task->task_data,
+							 cdp_surface->dst_data.address,
+							 cdp_surface->dst_data.offset,
+							 (void *)&output_address,
+							 DESTINATION_DMA);
+	if (cdp_op->lut_index >= 0) {
+		group->lut_index = cdp_op->lut_index;
+		dla_read_lut(engine, cdp_op->lut_index, (void *)&lut);
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
+dla_cdp_is_ready(struct dla_processor *processor,
+				 struct dla_processor_group *group)
+{
+	struct dla_processor_group *next_group;
+	struct dla_cdp_op_desc *cdp_op;
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
+dla_cdp_dump_config(struct dla_processor_group *group)
+{
+	struct dla_cdp_op_desc *cdp_op;
+	struct dla_cdp_surface_desc *cdp_surface;
+
+	cdp_surface = &group->surface_desc->cdp_surface;
+	cdp_op = &group->operation_desc->cdp_op;
+}
+
+int
+dla_cdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret;
+
+	dla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, CDP_DONE_MASK1) |
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
index 000000000000..3abc863d9fce
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_common.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_reg.h"
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
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
+void update_lut(struct dla_engine *engine, uint32_t reg_base,
+				struct dla_lut_param *lut, uint8_t precision)
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
+		dla_reg_write(engine->driver_context,
+				reg_base + access_data_offset[is_sdp],
+				lut->linear_exp_table[i]);
+	}
+
+	/* program density table */
+	reg = (FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID, LO)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_TABLE_ID)) |
+		(FIELD_ENUM(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE, WRITE)
+		<< SHIFT(CDP_S_LUT_ACCESS_CFG_0, LUT_ACCESS_TYPE));
+	dla_reg_write(engine->driver_context, reg_base, reg);
+
+	for (i = 0; i < (1<<LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2)+1; i++) {
+		dla_reg_write(engine->driver_context,
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
+	dla_reg_write(engine->driver_context,
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
+	dla_reg_write(engine->driver_context,
+			reg_base + lut_info_offset[is_sdp], reg);
+	high = upper_32_bits(lut->linear_exp_start);
+	low = lower_32_bits(lut->linear_exp_start);
+	dla_reg_write(engine->driver_context,
+			reg_base + le_start_offset[is_sdp], low);
+	if (!is_sdp)
+		dla_reg_write(engine->driver_context,
+				reg_base + le_start_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_exp_end);
+	low = lower_32_bits(lut->linear_exp_end);
+	dla_reg_write(engine->driver_context,
+				reg_base + le_end_offset[is_sdp], low);
+	if (!is_sdp)
+		dla_reg_write(engine->driver_context,
+				reg_base + le_end_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_only_start);
+	low = lower_32_bits(lut->linear_only_start);
+	dla_reg_write(engine->driver_context,
+				reg_base + lo_start_offset[is_sdp], low);
+	if (!is_sdp)
+		dla_reg_write(engine->driver_context,
+				reg_base + lo_start_offset[is_sdp] + 4, high);
+
+	high = upper_32_bits(lut->linear_only_end);
+	low = lower_32_bits(lut->linear_only_end);
+	dla_reg_write(engine->driver_context,
+				reg_base + lo_end_offset[is_sdp], low);
+	if (!is_sdp)
+		dla_reg_write(engine->driver_context,
+				reg_base + lo_end_offset[is_sdp] + 4, high);
+
+	if (precision == PRECISION_FP16) {
+		reg = (lut->linear_exp_underflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_UFLOW_SCALE)) |
+			(lut->linear_exp_overflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LE_SLOPE_SCALE_0,
+					LUT_LE_SLOPE_OFLOW_SCALE));
+		dla_reg_write(engine->driver_context,
+				reg_base + le_slope_scale_offset[is_sdp], reg);
+
+		reg = (lut->linear_only_underflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_UFLOW_SCALE)) |
+			(lut->linear_only_overflow_slope.data_f <<
+			SHIFT(CDP_S_LUT_LO_SLOPE_SCALE_0,
+					LUT_LO_SLOPE_OFLOW_SCALE));
+		dla_reg_write(engine->driver_context,
+				reg_base + lo_slope_scale_offset[is_sdp], reg);
+	} else {
+		union dla_slope *oslope;
+		union dla_slope *uslope;
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
+		dla_reg_write(engine->driver_context,
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
+		dla_reg_write(engine->driver_context,
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
+		dla_reg_write(engine->driver_context,
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
+		dla_reg_write(engine->driver_context,
+				reg_base + lo_slope_shift_offset[is_sdp], reg);
+	}
+}
+
+int
+validate_data_cube(struct dla_data_cube src_data_cube,
+				   struct dla_data_cube dst_data_cube,
+				   uint8_t mem_type)
+{
+	int32_t ret = 0;
+
+	if ((src_data_cube.width > DCUBE_MAX_WIDTH) ||
+	    (src_data_cube.height > DCUBE_MAX_HEIGHT) ||
+	    (src_data_cube.channel > DCUBE_MAX_CHANNEL)) {
+		pr_err("Invalid SrcInput Cude[W: %u, H: %u, C: %u]",
+				src_data_cube.width, src_data_cube.height,
+				src_data_cube.channel);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if ((dst_data_cube.width > DCUBE_MAX_WIDTH) ||
+	    (dst_data_cube.height > DCUBE_MAX_HEIGHT) ||
+	    (dst_data_cube.channel > DCUBE_MAX_CHANNEL)) {
+		pr_err("Invalid DstInput Cude[W: %u, H: %u, C: %u]",
+				dst_data_cube.width, dst_data_cube.height,
+				dst_data_cube.channel);
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
index 000000000000..38cf43246890
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
+#define DLA_OP_BDMA		0
+#define DLA_OP_CONV		1
+#define DLA_OP_SDP		2
+#define DLA_OP_PDP		3
+#define DLA_OP_CDP		4
+#define DLA_OP_RUBIK	5
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Maximum number of processors
+ * @brief DLA ash 6 processors
+ * @{
+ */
+#define DLA_OP_NUM		6
+/** @} */
+
+/**
+ * @ingroup Processors
+ * @name Number of groups
+ * @brief Each processor has 2 groups of registers
+ * @{
+ */
+#define DLA_NUM_GROUPS		2
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
+struct dla_network_desc {
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
+	int16_t op_head[DLA_OP_NUM];
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
+#define DLA_MEM_MC			0 /* External DRAM */
+#define DLA_MEM_CV			1 /* CV-SRAM */
+#define DLA_MEM_HW			2 /* DLA sub-module */
+/** @} */
+
+/**
+ * @ingroup Events
+ * @name Operation events
+ * @brief Different events triggered by an operations
+ * @{
+ */
+#define DLA_EVENT_OP_COMPLETED		1
+#define DLA_EVENT_OP_PROGRAMMED		2
+#define DLA_EVENT_OP_ENABLED		3
+#define DLA_EVENT_CDMA_WT_DONE		4
+#define DLA_EVENT_CDMA_DT_DONE		5
+/** @} */
+
+struct dla_consumer {
+	int16_t index; /* the index of dla_common_op_desc in dep_graph_addr */
+	uint8_t event;
+	uint8_t res;
+} __packed __aligned(4);
+
+struct dla_common_op_desc {
+	int16_t index; /* set by ucode */
+	int8_t roi_index;
+	uint8_t op_type;
+
+	uint8_t dependency_count;
+	uint8_t reserved0[3];
+
+	struct dla_consumer consumers[DLA_OP_NUM];
+	struct dla_consumer fused_parent;
+} __packed __aligned(4);
+
+struct dla_roi_array_desc {
+	uint32_t array_length;
+
+	uint32_t array_reserved;
+} __packed __aligned(4);
+
+struct dla_roi_desc {
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
+struct dla_bdma_transfer_desc {
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
+struct dla_bdma_surface_desc {
+	uint8_t source_type;
+	uint8_t destination_type;
+	uint16_t num_transfers;
+
+	struct dla_bdma_transfer_desc transfers[NUM_MAX_BDMA_OPS];
+} __packed __aligned(4);
+
+struct dla_bdma_op_desc {
+	uint16_t num_transfers;
+	uint16_t reserved0;
+} __packed __aligned(4);
+
+struct dla_bdma_stat_desc {
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
+struct dla_cvt_param {
+	int16_t  scale;
+	uint8_t  truncate;
+	uint8_t  enable;
+
+	int32_t  offset;
+} __packed __aligned(4);
+
+struct dla_data_cube {
+	uint16_t type; /* dla_mem_type */
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
+struct dla_conv_surface_desc {
+	/* Data cube */
+	struct dla_data_cube weight_data;
+	struct dla_data_cube wmb_data;
+	struct dla_data_cube wgs_data;
+	struct dla_data_cube src_data;
+	struct dla_data_cube dst_data;
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
+struct dla_conv_op_desc {
+	/* Performance parameters */
+
+	/* dla_conv_mode */
+	uint8_t conv_mode;
+	uint8_t data_reuse;
+	uint8_t weight_reuse;
+	uint8_t skip_data_rls;
+
+	uint8_t skip_weight_rls;
+	uint8_t reserved0;
+	uint16_t entry_per_slice;
+
+	/* dla_data_format */
+	uint8_t data_format;
+	/* dla_pixel_mapping */
+	uint8_t pixel_mapping;
+	/* number of free slices before fetch */
+	uint16_t fetch_grain;
+
+	uint8_t reserved_b[8];
+
+	/* batch_num */
+	uint8_t batch;
+	/* dla_weight_format */
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
+	uint8_t mean_format; /* dla_mean_format */
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
+	/* The output precision from CONV, it's the MAC processing precison */
+	uint8_t out_precision;
+	int16_t pad_val;
+
+	/* input converter parameters */
+	struct dla_cvt_param in_cvt;
+	/* output converter parameters, support truncate only */
+	struct dla_cvt_param out_cvt;
+
+} __packed __aligned(4);
+
+struct dla_conv_stat_desc {
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
+union dla_lut_offset {
+	/**
+	 * Number should be substracted on log domain before look up
+	 * exponetial table it has the same definition as hardware
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
+struct dla_float_data {
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
+union dla_slope {
+	struct dla_float_data data_i;
+
+	uint16_t data_f;
+};
+
+struct dla_lut_param {
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
+	union dla_lut_offset linear_exp_offset;
+	union dla_lut_offset linear_only_offset;
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
+	union dla_slope linear_exp_underflow_slope;
+	union dla_slope linear_exp_overflow_slope;
+	union dla_slope linear_only_underflow_slope;
+	union dla_slope linear_only_overflow_slope;
+
+	/**
+	 * dla_lut_priority, when both lut are hit(or one overflow,
+	 * the other underflow), which one should be selected as output
+	 */
+	uint8_t hybrid_priority;
+	uint8_t underflow_priority;
+	uint8_t overflow_priority;
+	uint8_t method; /* dla_lut_method */
+} __packed __aligned(4);
+
+struct dla_sdp_surface_desc {
+	/* Data cube */
+	/* source input cube, available when SDP working on offline mode */
+	struct dla_data_cube src_data;
+
+	/* X1 input cube */
+	struct dla_data_cube x1_data;
+
+	/* X2 input cube */
+	struct dla_data_cube x2_data;
+
+	/* Y input cube */
+	struct dla_data_cube y_data;
+
+	/* Output cube */
+	struct dla_data_cube dst_data;
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
+struct dla_sdp_cvt {
+	struct dla_cvt_param alu_cvt;
+	struct dla_cvt_param mul_cvt;
+} __packed __aligned(4);
+
+struct dla_sdp_op {
+	uint8_t enable;
+	uint8_t alu_type; /* dla_sdp_alu_op_type */
+	uint8_t type; /* dla_sdp_op_type */
+	uint8_t mode; /* dla_sdp_op_mode */
+
+	uint8_t act; /* dla_act_type */
+	uint8_t shift_value; /* left shift */
+	uint8_t truncate;
+	uint8_t precision;
+
+	int32_t alu_operand;
+	int32_t mul_operand;
+
+	struct dla_sdp_cvt  cvt;
+} __packed __aligned(4);
+
+struct dla_sdp_op_desc {
+	/* Precision parameters */
+	/* dla_precision */
+	uint8_t src_precision;
+	uint8_t dst_precision;
+	int16_t lut_index;
+
+	struct dla_cvt_param out_cvt;
+
+	/* Performance parameters */
+	/* dla_conv_mode */
+	uint8_t conv_mode;
+	uint8_t batch_num;
+	uint16_t reserved0;
+
+	uint32_t batch_stride;	/* will be used when batch_num > 1 */
+
+	/* Algorithm parameters */
+	struct dla_sdp_op x1_op;
+	struct dla_sdp_op x2_op;
+	struct dla_sdp_op y_op;
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
+struct dla_pdp_surface_desc {
+	/* Data cube */
+	struct dla_data_cube src_data;
+
+	struct dla_data_cube dst_data;
+} __packed __aligned(4);
+
+struct dla_pdp_op_desc {
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
+	uint8_t  pool_mode; /* dla_pool_mode */
+	uint8_t  pool_width; /* dla_pool_width */
+	uint8_t  pool_height; /* dla_pool_height */
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
+	uint8_t  precision; /* dla_precision */
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
+struct dla_pdp_stat_desc {
+	uint32_t inf_input_num;
+	uint32_t nan_input_num;
+	uint32_t nan_output_num;
+	uint32_t write_stall;
+	uint32_t runtime;
+} __packed __aligned(4);
+
+struct dla_cdp_surface_desc {
+	/* Data cube */
+	struct dla_data_cube src_data;
+
+	struct dla_data_cube dst_data;
+} __packed __aligned(4);
+
+struct dla_cdp_op_desc {
+	/* Precision parameters */
+
+	/* dla_precision */
+	uint8_t  in_precision;
+	uint8_t  out_precision;
+	int16_t  lut_index;
+
+	struct dla_cvt_param in_cvt;
+	struct dla_cvt_param out_cvt;
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
+struct dla_cdp_stat_desc {
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
+struct dla_rubik_surface_desc {
+	/* Data cube */
+	struct dla_data_cube src_data;
+
+	struct dla_data_cube dst_data;
+} __packed __aligned(4);
+
+/* rubik mode */
+#define RUBIK_MODE_CONTRACT	0
+#define RUBIK_MODE_SPLIT	1
+#define RUBIK_MODE_MERGE	2
+
+struct dla_rubik_op_desc {
+	/* Precision parameters */
+	uint8_t mode;
+	uint8_t precision;
+	uint8_t stride_x;
+	uint8_t stride_y;
+} __packed __aligned(4);
+
+struct dla_rubik_stat_desc {
+	uint32_t read_stall;
+	uint32_t write_stall;
+	uint32_t runtime;
+} __packed __aligned(4);
+
+union dla_surface_container {
+	struct dla_bdma_surface_desc bdma_surface;
+	struct dla_conv_surface_desc conv_surface;
+	struct dla_sdp_surface_desc sdp_surface;
+	struct dla_pdp_surface_desc pdp_surface;
+	struct dla_cdp_surface_desc cdp_surface;
+	struct dla_rubik_surface_desc rubik_surface;
+};
+
+union dla_operation_container {
+	struct dla_bdma_op_desc bdma_op;
+	struct dla_conv_op_desc conv_op;
+	struct dla_sdp_op_desc sdp_op;
+	struct dla_pdp_op_desc pdp_op;
+	struct dla_cdp_op_desc cdp_op;
+	struct dla_rubik_op_desc rubik_op;
+};
+
+struct dla_engine;
+void update_lut(struct dla_engine *engine, uint32_t reg_base,
+		struct dla_lut_param *lut,
+		uint8_t precision);
+int32_t validate_data_cube(struct dla_data_cube src_data_cube,
+			struct dla_data_cube dst_data_cube,
+			uint8_t mem_type);
+int32_t validate_precision(uint8_t precision,
+			uint8_t map_precision);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_conv.c b/drivers/gpu/drm/nvdla/nvdla_conv.c
new file mode 100644
index 000000000000..bb24909e1afa
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_conv.c
@@ -0,0 +1,683 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
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
+dla_conv_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id)
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
+dla_conv_enable(struct dla_engine *engine, struct dla_processor_group *group)
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
+dla_conv_rdma_check(struct dla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+static int32_t
+processor_conv_program(struct dla_engine *engine, struct dla_processor_group *group)
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
+	struct dla_conv_op_desc *conv_op;
+	struct dla_conv_surface_desc *conv_surface;
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
+		dla_get_dma_cube_address(engine->driver_context,
+								 engine->task->task_data,
+								 conv_surface->wmb_data.address,
+								 conv_surface->wmb_data.offset,
+								 (void *)&wmb_address,
+								 DESTINATION_DMA);
+
+		ASSERT_GOTO((conv_surface->wgs_data.address != -1),
+			ret, -EINVAL, exit);
+		dla_get_dma_cube_address(engine->driver_context,
+								 engine->task->task_data,
+								 conv_surface->wgs_data.address,
+								 conv_surface->wgs_data.offset,
+								 (void *)&wgs_address,
+								 DESTINATION_DMA);
+	}
+
+	if (conv_surface->weight_data.address != -1) {
+		dla_get_dma_cube_address(engine->driver_context,
+								 engine->task->task_data,
+								 conv_surface->weight_data.address,
+								 conv_surface->weight_data.offset,
+								 (void *)&weight_address,
+								 DESTINATION_DMA);
+	}
+
+	if (conv_surface->dst_data.address != -1) {
+		dla_get_dma_cube_address(engine->driver_context,
+								 engine->task->task_data,
+								 conv_surface->dst_data.address,
+								 conv_surface->dst_data.offset,
+								 (void *)&output_address,
+								 DESTINATION_DMA);
+	}
+
+	ret = dla_read_input_address(engine, &conv_surface->src_data, &input_address,
+								 group->op_desc->index,
+								 group->roi_index,
+								 map_img_fmt[conv_op->data_format][1]);
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
+dla_conv_is_ready(struct dla_processor *processor,
+				  struct dla_processor_group *group)
+{
+	return 1;
+}
+
+void
+dla_conv_dump_config(struct dla_processor_group *group)
+{
+	struct dla_conv_op_desc *conv_op;
+	struct dla_conv_surface_desc *conv_surface;
+
+	conv_surface = &group->surface_desc->conv_surface;
+	conv_op = &group->operation_desc->conv_op;
+}
+
+int
+dla_conv_program(struct dla_engine *engine, struct dla_processor_group *group)
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
diff --git a/drivers/gpu/drm/nvdla/nvdla_drm.c b/drivers/gpu/drm/nvdla/nvdla_drm.c
new file mode 100644
index 000000000000..9217eee1de3b
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_drm.c
@@ -0,0 +1,695 @@
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
+
+#include "nvdla_drm.h"
+#include "nvdla_ioctl.h"
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
+int64_t dla_get_time_us(void)
+{
+	return ktime_get_ns() / NSEC_PER_USEC;
+}
+
+void dla_reg_write(void *driver_context, uint32_t addr, uint32_t reg)
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
+uint32_t dla_reg_read(void *driver_context, uint32_t addr)
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
+	struct dla_processor *processor = NULL;
+	struct dla_processor_group *group;
+	struct dla_engine *engine;
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
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_SDP];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_SDP];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_CDP];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_CDP];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_RUBIK];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_RUBIK];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_PDP];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_PDP];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_BDMA];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_BDMA];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS0)) {
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[0];
+		group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
+	}
+	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS1)) {
+		processor = &engine->processors[DLA_OP_CONV];
+		group = &processor->groups[1];
+		group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
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
+static int32_t dla_read_dma_address(void *driver_context, void *task_data,
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
+static int32_t dla_read_cpu_address(void *driver_context, void *task_data,
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
+int32_t dla_get_dma_address(void *driver_context, void *task_data,
+					int16_t index, void *dst_ptr,
+					uint32_t destination)
+{
+	int32_t ret = 0;
+
+	if (destination == DESTINATION_PROCESSOR) {
+		ret = dla_read_cpu_address(driver_context, task_data,
+						index, dst_ptr);
+	} else if (destination == DESTINATION_DMA) {
+		ret = dla_read_dma_address(driver_context, task_data,
+						index, dst_ptr);
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+int32_t dla_data_write(void *driver_context, void *task_data,
+				void *src, uint64_t dst,
+				uint32_t size, uint64_t offset)
+{
+	int32_t ret;
+	void *ptr = NULL;
+	struct dma_buf *buf;
+	struct iosys_map map;
+	struct nvdla_mem_handle *handles;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+
+	handles = task->address_list;
+	buf = dma_buf_get(handles[dst].handle);
+	if (IS_ERR(buf)) {
+		pr_err("%s: Failed get dma_buf for handle=%d\n", __func__,
+						handles[dst].handle);
+		return -EFAULT;
+	}
+
+	ret = dma_buf_begin_cpu_access(buf, DMA_BIDIRECTIONAL);
+	if (ret)
+		goto put_dma_buf;
+
+	ret = dma_buf_vmap(buf, &map);
+	ptr = ret ? NULL : map.vaddr;
+	if (!ptr) {
+		pr_err("%s: Failed to vmap dma_buf for handle=%d\n", __func__,
+						handles[dst].handle);
+		ret = -ENOMEM;
+		goto end_cpu_access;
+	}
+
+
+	memcpy((void *)((uint8_t *)ptr + offset), src, size);
+
+	dma_buf_vunmap(buf, ptr);
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
+int32_t dla_data_read(void *driver_context, void *task_data,
+				uint64_t src, void *dst,
+				uint32_t size, uint64_t offset)
+{
+	int32_t ret;
+	void *ptr = NULL;
+	struct dma_buf *buf;
+	struct iosys_map map;
+	struct nvdla_mem_handle *handles;
+	struct nvdla_task *task = (struct nvdla_task *)task_data;
+
+	handles = task->address_list;
+
+	buf = dma_buf_get(handles[src].handle);
+	if (IS_ERR(buf)) {
+		pr_err("%s: Failed get dma_buf for handle=%d\n", __func__,
+						handles[src].handle);
+		return -EFAULT;
+	}
+
+	ret = dma_buf_begin_cpu_access(buf, DMA_BIDIRECTIONAL);
+	if (ret)
+		goto put_dma_buf;
+
+	ret = dma_buf_vmap(buf, &map);
+	ptr = ret ? NULL : map.vaddr;
+	if (!ptr) {
+		pr_err("%s: Failed to vmap dma_buf for handle=%d\n", __func__,
+						handles[src].handle);
+		ret = -ENOMEM;
+		goto end_cpu_access;
+	}
+
+	memcpy(dst, (void *)(((uint8_t *)ptr) + offset), size);
+
+	dma_buf_vunmap(buf, ptr);
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
+	err = dla_execute_task(nvdla_dev->engine_context, (void *)task, nvdla_dev->config_data);
+	if (err) {
+		pr_err("Task execution failed\n");
+		return err;
+	}
+
+	pr_debug("Wait for task complete\n");
+
+	while (1) {
+		unsigned long flags;
+
+		wait_for_completion(&nvdla_dev->event_notifier);
+
+		spin_lock_irqsave(&nvdla_dev->nvdla_lock, flags);
+
+		err = dla_process_events(nvdla_dev->engine_context, &task_complete);
+
+		spin_unlock_irqrestore(&nvdla_dev->nvdla_lock, flags);
+
+		if (err || task_complete)
+			break;
+	}
+
+	pr_debug("Task complete\n");
+	dla_clear_task(nvdla_dev->engine_context);
+	//trace_printk("__nvdla_task_submit_exit\n");
+
+	return err;
+}
+
+static union dla_operation_container operation_desc[DLA_OP_NUM][DLA_NUM_GROUPS];
+static union dla_surface_container surface_desc[DLA_OP_NUM][DLA_NUM_GROUPS];
+
+static struct dla_task global_task;
+
+static struct dla_engine engine = {
+	.processors[DLA_OP_BDMA] = {
+		.name = "BDMA",
+		.op_type = DLA_OP_BDMA,
+		.program = dla_bdma_program,
+		.enable = dla_bdma_enable,
+		.set_producer = dla_bdma_set_producer,
+		.is_ready = dla_bdma_is_ready,
+		.dump_config = dla_bdma_dump_config,
+		.rdma_check = dla_bdma_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_BDMA][0],
+			.surface_desc = &surface_desc[DLA_OP_BDMA][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_BDMA][1],
+			.surface_desc = &surface_desc[DLA_OP_BDMA][1],
+		},
+	},
+	.processors[DLA_OP_CONV] = {
+		.name = "Convolution",
+		.op_type = DLA_OP_CONV,
+		.program = dla_conv_program,
+		.enable = dla_conv_enable,
+		.set_producer = dla_conv_set_producer,
+		.is_ready = dla_conv_is_ready,
+		.dump_config = dla_conv_dump_config,
+		.rdma_check = dla_conv_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_CONV][0],
+			.surface_desc = &surface_desc[DLA_OP_CONV][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_CONV][1],
+			.surface_desc = &surface_desc[DLA_OP_CONV][1],
+		},
+	},
+	.processors[DLA_OP_SDP] = {
+		.name = "SDP",
+		.op_type = DLA_OP_SDP,
+		.program = dla_sdp_program,
+		.enable = dla_sdp_enable,
+		.set_producer = dla_sdp_set_producer,
+		.is_ready = dla_sdp_is_ready,
+		.dump_config = dla_sdp_dump_config,
+		.rdma_check = dla_sdp_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_SDP][0],
+			.surface_desc = &surface_desc[DLA_OP_SDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_SDP][1],
+			.surface_desc = &surface_desc[DLA_OP_SDP][1],
+		},
+	},
+	.processors[DLA_OP_PDP] = {
+		.name = "PDP",
+		.op_type = DLA_OP_PDP,
+		.program = dla_pdp_program,
+		.enable = dla_pdp_enable,
+		.set_producer = dla_pdp_set_producer,
+		.is_ready = dla_pdp_is_ready,
+		.dump_config = dla_pdp_dump_config,
+		.rdma_check = dla_pdp_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_PDP][0],
+			.surface_desc = &surface_desc[DLA_OP_PDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_PDP][1],
+			.surface_desc = &surface_desc[DLA_OP_PDP][1],
+		},
+	},
+	.processors[DLA_OP_CDP] = {
+		.name = "CDP",
+		.op_type = DLA_OP_CDP,
+		.program = dla_cdp_program,
+		.enable = dla_cdp_enable,
+		.set_producer = dla_cdp_set_producer,
+		.is_ready = dla_cdp_is_ready,
+		.dump_config = dla_cdp_dump_config,
+		.rdma_check = dla_cdp_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_CDP][0],
+			.surface_desc = &surface_desc[DLA_OP_CDP][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_CDP][1],
+			.surface_desc = &surface_desc[DLA_OP_CDP][1],
+		},
+	},
+
+	.processors[DLA_OP_RUBIK] = {
+		.name = "RUBIK",
+		.op_type = DLA_OP_RUBIK,
+		.program = dla_rubik_program,
+		.enable = dla_rubik_enable,
+		.set_producer = dla_rubik_set_producer,
+		.is_ready = dla_rubik_is_ready,
+		.dump_config = dla_rubik_dump_config,
+		.rdma_check = dla_rubik_rdma_check,
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
+			.operation_desc = &operation_desc[DLA_OP_RUBIK][0],
+			.surface_desc = &surface_desc[DLA_OP_RUBIK][0],
+		},
+		.groups[1] = {
+			.id = 1,
+			.rdma_id = 0,
+			.active = 0,
+			.events = 0,
+			.roi_index = 0,
+			.is_rdma_needed = 0,
+			.lut_index = -1,
+			.operation_desc = &operation_desc[DLA_OP_RUBIK][1],
+			.surface_desc = &surface_desc[DLA_OP_RUBIK][1],
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
+	dla_init_op_cache(&engine);
+	dla_clear_task(nvdla_dev->engine_context);
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
diff --git a/drivers/gpu/drm/nvdla/nvdla_drm.h b/drivers/gpu/drm/nvdla/nvdla_drm.h
new file mode 100644
index 000000000000..356fc399accb
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_drm.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_DRM_H_
+#define __NVDLA_DRM_H_
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/types.h>
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
+ * engine_context		Private data passed from engine in dla_engine_init
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
+	struct dla_engine *engine_context;
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
+int32_t dla_process_events(struct dla_engine *engine_context, uint32_t *task_complete);
+
+void dla_clear_task(struct dla_engine *engine_context);
+
+int32_t dla_execute_task(struct dla_engine *engine_context, void *task_data, void *config_data);
+
+uint32_t dla_reg_read(void *driver_context, uint32_t addr);
+
+void dla_reg_write(void *driver_context, uint32_t addr, uint32_t reg);
+
+int32_t dla_data_read(void *driver_context, void *task_data,
+				uint64_t src, void *dst,
+				uint32_t size, uint64_t offset);
+
+int32_t dla_data_write(void *driver_context, void *task_data,
+				void *src, uint64_t dst,
+				uint32_t size, uint64_t offset);
+
+/* Destination for DMA buffer */
+#define DESTINATION_PROCESSOR	0
+#define DESTINATION_DMA		1
+
+int32_t dla_get_dma_address(void *driver_context, void *task_data,
+					int16_t index, void *dst_ptr,
+					uint32_t destination);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_engine.c b/drivers/gpu/drm/nvdla/nvdla_engine.c
new file mode 100644
index 000000000000..26ebd6c362b0
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
+#include "nvdla_drm.h"
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
+uint32_t reg_read(struct dla_engine *engine, uint32_t addr)
+{
+	return dla_reg_read(engine->driver_context, addr);
+}
+
+void reg_write(struct dla_engine *engine, uint32_t addr, uint32_t reg)
+{
+	dla_reg_write(engine->driver_context, addr, reg);
+}
+
+int32_t dla_enable_intr(struct dla_engine *engine, uint32_t mask)
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
+struct dla_roi_desc roi_desc;
+
+/**
+ * Get DMA data cube address
+ */
+int32_t
+dla_get_dma_cube_address(void *driver_context, void *task_data,
+						 int16_t index, uint32_t offset, void *dst_ptr,
+						 uint32_t destination)
+{
+	int32_t ret = 0;
+	uint64_t *pdst = (uint64_t *)dst_ptr;
+       ret = dla_get_dma_address(driver_context, task_data, index,
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
+dla_read_input_address(struct dla_engine *engine, struct dla_data_cube *data,
+					   uint64_t *address, int16_t op_index,
+					   uint8_t roi_index, uint8_t bpp)
+{
+	uint64_t roi_desc_addr;
+	int32_t ret = -EINVAL;
+
+	/**
+	 * If memory type is HW then no address required
+	 */
+	if (data->type == DLA_MEM_HW) {
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
+		ret = dla_get_dma_cube_address(engine->driver_context,
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
+		ret = dla_data_read(engine->driver_context,
+				engine->task->task_data,
+				roi_desc_addr,
+				(void *)&roi_desc,
+				sizeof(roi_desc),
+				sizeof(struct dla_roi_array_desc) +
+				roi_index * sizeof(struct dla_roi_desc));
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
+utils_get_free_group(struct dla_engine *engine, struct dla_processor *processor,
+					 uint8_t *group_id, uint8_t *rdma_id)
+{
+	int32_t ret = 0;
+	uint32_t pointer;
+	uint32_t hw_consumer_ptr;
+	uint32_t hw_rdma_ptr;
+
+	hw_rdma_ptr = 0;
+
+	if (processor->op_type == DLA_OP_BDMA) {
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
index 000000000000..1976f5919543
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
+struct dla_processor_group {
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
+	struct dla_common_op_desc *op_desc;
+	struct dla_common_op_desc *consumers[DLA_OP_NUM];
+	struct dla_common_op_desc *fused_parent;
+	union dla_operation_container *operation_desc;
+	union dla_surface_container *surface_desc;
+};
+
+struct dla_processor {
+	const char *name;
+	uint8_t op_type;
+	uint8_t consumer_ptr;
+	uint8_t roi_index;
+	uint8_t group_status;
+	uint8_t rdma_status;
+	uint8_t last_group;
+
+	struct dla_common_op_desc *tail_op;
+	struct dla_processor_group groups[DLA_NUM_GROUPS];
+	struct dla_engine *engine;
+
+	int (*is_ready)(struct dla_processor *processor,
+				  struct dla_processor_group *group);
+	int (*enable)(struct dla_engine *engine, struct dla_processor_group *group);
+	int (*program)(struct dla_engine *engine, struct dla_processor_group *group);
+	void (*set_producer)(struct dla_engine *engine, int32_t group_id, int32_t rdma_id);
+	void (*dump_config)(struct dla_processor_group *group);
+	void (*rdma_check)(struct dla_processor_group *group);
+};
+
+struct dla_engine {
+	struct dla_task *task;
+	struct dla_config *config_data;
+	struct dla_network_desc *network;
+	struct dla_processor processors[DLA_OP_NUM];
+
+	uint16_t num_proc_hwl;
+	int32_t status;
+
+	void *driver_context;
+};
+
+void reg_write(struct dla_engine *engine, uint32_t addr, uint32_t reg);
+uint32_t reg_read(struct dla_engine *engine, uint32_t addr);
+
+/**
+ * Operation descriptor cache functions
+ */
+void
+dla_put_op_desc(struct dla_engine *engine, struct dla_common_op_desc *op_desc);
+struct dla_common_op_desc
+*dla_get_op_desc(struct dla_engine *engine, struct dla_task *task,
+			   int16_t index,
+			   uint8_t op_type,
+			   uint8_t roi_index);
+void
+dla_get_refcount(struct dla_common_op_desc *op_desc);
+void
+dla_init_op_cache(struct dla_engine *engine);
+
+/**
+ * Operation completion handler
+ */
+int
+dla_op_completion(struct dla_engine *engine, struct dla_processor *processor,
+		      struct dla_processor_group *group);
+
+int32_t
+dla_read_lut(struct dla_engine *engine, int16_t index, void *dst);
+int
+dla_enable_intr(struct dla_engine *engine, uint32_t mask);
+int
+utils_get_free_group(struct dla_engine *engine, struct dla_processor *processor,
+			uint8_t *group_id,
+			uint8_t *rdma_id);
+int32_t
+dla_get_dma_cube_address(void *driver_context,
+						void *task_data,
+						int16_t index,
+						uint32_t offset,
+						void *dst_ptr,
+						uint32_t destination);
+int
+dla_read_input_address(struct dla_engine *engine, struct dla_data_cube *data,
+		       uint64_t *address,
+		       int16_t op_index,
+		       uint8_t roi_index,
+		       uint8_t bpp);
+
+/**
+ * BDMA operations
+ */
+void
+dla_bdma_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_bdma_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_bdma_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_bdma_is_ready(struct dla_processor *processor,
+			    struct dla_processor_group *group);
+void
+dla_bdma_dump_config(struct dla_processor_group *group);
+void
+dla_bdma_rdma_check(struct dla_processor_group *group);
+
+/**
+ * Convolution operations
+ */
+void
+dla_conv_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_conv_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_conv_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_conv_is_ready(struct dla_processor *processor,
+			    struct dla_processor_group *group);
+void
+dla_conv_dump_config(struct dla_processor_group *group);
+void
+dla_conv_rdma_check(struct dla_processor_group *group);
+
+/**
+ * SDP operations
+ */
+void
+dla_sdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_sdp_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_sdp_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_sdp_is_ready(struct dla_processor *processor,
+			   struct dla_processor_group *group);
+void
+dla_sdp_dump_config(struct dla_processor_group *group);
+void
+dla_sdp_rdma_check(struct dla_processor_group *group);
+
+/**
+ * PDP operations
+ */
+void
+dla_pdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_pdp_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_pdp_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_pdp_is_ready(struct dla_processor *processor,
+			   struct dla_processor_group *group);
+void
+dla_pdp_dump_config(struct dla_processor_group *group);
+void
+dla_pdp_rdma_check(struct dla_processor_group *group);
+
+/**
+ * CDP operations
+ */
+void
+dla_cdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_cdp_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_cdp_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_cdp_is_ready(struct dla_processor *processor,
+			   struct dla_processor_group *group);
+void
+dla_cdp_dump_config(struct dla_processor_group *group);
+void
+dla_cdp_rdma_check(struct dla_processor_group *group);
+
+/**
+ * RUBIK operations
+ */
+void
+dla_rubik_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id);
+int
+dla_rubik_enable(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_rubik_program(struct dla_engine *engine, struct dla_processor_group *group);
+int
+dla_rubik_is_ready(struct dla_processor *processor,
+			     struct dla_processor_group *group);
+void
+dla_rubik_dump_config(struct dla_processor_group *group);
+void
+dla_rubik_rdma_check(struct dla_processor_group *group);
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_gem.c b/drivers/gpu/drm/nvdla/nvdla_gem.c
new file mode 100644
index 000000000000..cccf6d01a564
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_gem.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include <linux/dma-buf.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+
+#include "nvdla_drm.h"
+#include "nvdla_ioctl.h"
+
+#define to_nvdla_obj(x) container_of(x, struct nvdla_gem_object, object)
+
+struct nvdla_gem_object {
+	struct drm_gem_object object;
+
+	void *kvaddr;
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
+
+	nobj->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+	nobj->kvaddr = dma_alloc_attrs(drm->dev, dobj->size, &nobj->dma_addr,
+						GFP_KERNEL, nobj->dma_attrs);
+
+	if (!nobj->kvaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void nvdla_gem_free(struct nvdla_gem_object *nobj)
+{
+	struct drm_gem_object *dobj = &nobj->object;
+	struct drm_device *drm = dobj->dev;
+
+	dma_free_attrs(drm->dev, dobj->size, nobj->kvaddr, nobj->dma_addr,
+				nobj->dma_attrs);
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
+	ret = dma_get_sgtable_attrs(drm->dev, sgt, nobj->kvaddr,
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
+	map->vaddr = nobj->kvaddr;
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
+	vma->vm_pgoff = 0;
+
+	ret = dma_mmap_attrs(drm->dev, vma, nobj->kvaddr, nobj->dma_addr,
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
+static int32_t nvdla_drm_gem_mmap_buf(struct drm_gem_object *obj,
+									  struct vm_area_struct *vma)
+{
+	int32_t ret;
+
+	ret = drm_gem_mmap_obj(obj, obj->size, vma);
+	if (ret)
+		return ret;
+
+	return nvdla_drm_gem_object_mmap(obj, vma);
+}
+
+static int32_t nvdla_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	int32_t ret;
+	struct drm_gem_object *obj;
+
+	ret = drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	obj = vma->vm_private_data;
+
+	return nvdla_drm_gem_object_mmap(obj, vma);
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
+static const struct file_operations nvdla_drm_fops = {
+	.owner = THIS_MODULE,
+	.open = drm_open,
+	.release = drm_release,
+	.unlocked_ioctl = drm_ioctl,
+	.mmap = nvdla_drm_gem_mmap,
+	.poll = drm_poll,
+	.read = drm_read,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = drm_compat_ioctl,
+#endif
+	.llseek = noop_llseek,
+};
+
+static const struct drm_ioctl_desc nvdla_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(NVDLA_SUBMIT, nvdla_submit, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NVDLA_GEM_CREATE, nvdla_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NVDLA_GEM_MMAP, nvdla_gem_map_offset, DRM_RENDER_ALLOW),
+	/* use DRM_IOCTL_MODE_DESTROY_DUMB to destory */
+};
+
+static struct drm_driver nvdla_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+
+	.ioctls = nvdla_drm_ioctls,
+	.num_ioctls = ARRAY_SIZE(nvdla_drm_ioctls),
+	.fops = &nvdla_drm_fops,
+	.gem_prime_mmap		= nvdla_drm_gem_mmap_buf,
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
diff --git a/drivers/gpu/drm/nvdla/nvdla_ioctl.h b/drivers/gpu/drm/nvdla/nvdla_ioctl.h
new file mode 100644
index 000000000000..e21d4007b7f4
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_ioctl.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __LINUX_NVDLA_IOCTL_H
+#define __LINUX_NVDLA_IOCTL_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#if !defined(__KERNEL__)
+#define __user
+#endif
+
+/**
+ * struct nvdla_mem_handle structure for memory handles
+ *
+ * @handle		handle to DMA buffer allocated in userspace
+ * @reserved		Reserved for padding
+ * @offset		offset in bytes from start address of buffer
+ *
+ */
+struct nvdla_mem_handle {
+	__u32 handle;
+	__u32 reserved;
+	__u64 offset;
+};
+
+/**
+ * struct nvdla_ioctl_submit_task structure for single task information
+ *
+ * @num_addresses		total number of entries in address_list
+ * @reserved			Reserved for padding
+ * @address_list		pointer to array of struct nvdla_mem_handle
+ *
+ */
+struct nvdla_ioctl_submit_task {
+#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
+	__u32 num_addresses;
+#define NVDLA_NO_TIMEOUT    (0xffffffff)
+	__u32 timeout;
+	__u64 address_list;
+};
+
+/**
+ * struct nvdla_submit_args structure for task submit
+ *
+ * @tasks		pointer to array of struct nvdla_ioctl_submit_task
+ * @num_tasks		number of entries in tasks
+ * @flags		flags for task submit, no flags defined yet
+ * @version		version of task structure
+ *
+ */
+struct nvdla_submit_args {
+	__u64 tasks;
+	__u16 num_tasks;
+#define NVDLA_MAX_TASKS_PER_SUBMIT	24
+#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)
+	__u16 flags;
+	__u32 version;
+};
+
+/**
+ * struct nvdla_gem_create_args for allocating DMA buffer through GEM
+ *
+ * @handle		handle updated by kernel after allocation
+ * @flags		implementation specific flags
+ * @size		size of buffer to allocate
+ */
+struct nvdla_gem_create_args {
+	__u32 handle;
+	__u32 flags;
+	__u64 size;
+};
+
+/**
+ * struct nvdla_gem_map_offset_args for mapping DMA buffer
+ *
+ * @handle		handle of the buffer
+ * @reserved		reserved for padding
+ * @offset		offset updated by kernel after mapping
+ */
+struct nvdla_gem_map_offset_args {
+	__u32 handle;
+	__u32 reserved;
+	__u64 offset;
+};
+
+#define DRM_NVDLA_SUBMIT		0x00
+#define DRM_NVDLA_GEM_CREATE		0x01
+#define DRM_NVDLA_GEM_MMAP		0x02
+
+#define DRM_IOCTL_NVDLA_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_SUBMIT, struct nvdla_submit_args)
+#define DRM_IOCTL_NVDLA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_CREATE, struct nvdla_gem_create_args)
+#define DRM_IOCTL_NVDLA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_MMAP, struct nvdla_gem_map_offset_args)
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_pdp.c b/drivers/gpu/drm/nvdla/nvdla_pdp.c
new file mode 100644
index 000000000000..2ed0ac0f021a
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_pdp.c
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_drm.h"
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
+	val = type == DLA_MEM_HW ?
+			FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+						FLYING_MODE, ON_FLYING) :
+			FIELD_ENUM(PDP_D_OPERATION_MODE_CFG_0,
+						FLYING_MODE, OFF_FLYING);
+
+	return val;
+}
+
+void
+dla_pdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+
+	pr_debug("group id %d rdma id %d\n", group_id, rdma_group_id);
+
+	reg = group_id << SHIFT(PDP_S_POINTER_0, PRODUCER);
+	pdp_reg_write(engine, S_POINTER, reg);
+
+	reg = rdma_group_id << SHIFT(PDP_RDMA_S_POINTER_0, PRODUCER);
+	pdp_rdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+dla_pdp_enable(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg;
+
+	if (!group) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	pr_debug("rdma needed %u\n", group->is_rdma_needed);
+
+	/**
+	 * enable all sub-modules
+	 */
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
+dla_pdp_rdma_check(struct dla_processor_group *group)
+{
+	struct dla_pdp_surface_desc *pdp_surface;
+
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	group->is_rdma_needed = 0;
+
+	if (pdp_surface->src_data.type != DLA_MEM_HW)
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
+vaildate_pdp_configs(struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	struct dla_pdp_op_desc *pdp_op;
+	struct dla_pdp_surface_desc *pdp_surface;
+
+	pdp_op = &group->operation_desc->pdp_op;
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	if (pdp_surface->dst_data.type == DLA_MEM_HW) {
+		pr_err("Destination buffer for PDP has to be either MC or CV");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = validate_data_cube(pdp_surface->src_data, pdp_surface->dst_data,
+								DLA_MEM_HW);
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
+processor_pdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct dla_pdp_op_desc *pdp_op;
+	struct dla_pdp_surface_desc *pdp_surface;
+
+	pdp_op = &group->operation_desc->pdp_op;
+	pdp_surface = &group->surface_desc->pdp_surface;
+
+	ret = vaildate_pdp_configs(group);
+	if (ret)
+		goto exit;
+
+	ret = dla_read_input_address(engine, &pdp_surface->src_data,
+					&input_address,
+					group->op_desc->index,
+					group->roi_index,
+					1);
+	if (ret)
+		goto exit;
+
+	if (pdp_surface->dst_data.address != -1)
+		dla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					pdp_surface->dst_data.address,
+					pdp_surface->dst_data.offset,
+					(void *)&output_address,
+					DESTINATION_DMA);
+
+	if (pdp_surface->src_data.type != DLA_MEM_HW) {
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
+	if (pdp_surface->src_data.type != DLA_MEM_HW) {
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
+dla_pdp_is_ready(struct dla_processor *processor,
+			   struct dla_processor_group *group)
+{
+	return 1;
+}
+
+void
+dla_pdp_dump_config(struct dla_processor_group *group)
+{
+	struct dla_pdp_op_desc *pdp_op;
+	struct dla_pdp_surface_desc *pdp_surface;
+
+	pdp_surface = &group->surface_desc->pdp_surface;
+	pdp_op = &group->operation_desc->pdp_op;
+}
+
+int
+dla_pdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret;
+
+	if (!group) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	dla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, PDP_DONE_MASK1) |
+			MASK(GLB_S_INTR_MASK_0, PDP_DONE_MASK0));
+
+	ret = processor_pdp_program(engine, group);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_reg.h b/drivers/gpu/drm/nvdla/nvdla_reg.h
new file mode 100644
index 000000000000..5ca2897405bc
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_reg.h
@@ -0,0 +1,6411 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_REG_H_
+#define __NVDLA_REG_H_
+
+// Register NVDLA_CFGROM_CFGROM_HW_VERSION_0
+#define NVDLA_CFGROM_CFGROM_HW_VERSION_0			_MK_ADDR_CONST(0x0)
+#define NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_GLB_DESC_0
+#define NVDLA_CFGROM_CFGROM_GLB_DESC_0			_MK_ADDR_CONST(0x4)
+#define NVDLA_CFGROM_CFGROM_GLB_DESC_0_GLB_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_GLB_DESC_0_GLB_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_GLB_DESC_0_GLB_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_DESC_0
+#define NVDLA_CFGROM_CFGROM_CIF_DESC_0			_MK_ADDR_CONST(0x8)
+#define NVDLA_CFGROM_CFGROM_CIF_DESC_0_CIF_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CIF_DESC_0_CIF_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CIF_DESC_0_CIF_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0			_MK_ADDR_CONST(0xc)
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0_CIF_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0_CIF_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0_CIF_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0			_MK_ADDR_CONST(0x10)
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0_CIF_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0_CIF_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0_CIF_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0			_MK_ADDR_CONST(0x14)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0_CIF_BASE_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0_CIF_BASE_WIDTH_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0_CIF_BASE_WIDTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0			_MK_ADDR_CONST(0x18)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0_CIF_BASE_LATENCY_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0_CIF_BASE_LATENCY_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0_CIF_BASE_LATENCY_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0			_MK_ADDR_CONST(0x1c)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0_BASE_BURST_LENGTH_MAX_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0_BASE_BURST_LENGTH_MAX_FIELD			_MK_FIELD_CONST(0x7ffffff, NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0_BASE_BURST_LENGTH_MAX_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0			_MK_ADDR_CONST(0x20)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0_CIF_BASE_MEM_ADDR_WIDTH_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0_CIF_BASE_MEM_ADDR_WIDTH_FIELD			_MK_FIELD_CONST(0x7ffffff, NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0_CIF_BASE_MEM_ADDR_WIDTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_DESC_0
+#define NVDLA_CFGROM_CFGROM_CDMA_DESC_0			_MK_ADDR_CONST(0x24)
+#define NVDLA_CFGROM_CFGROM_CDMA_DESC_0_CDMA_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_DESC_0_CDMA_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_DESC_0_CDMA_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x28)
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0_CDMA_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0_CDMA_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0_CDMA_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0			_MK_ADDR_CONST(0x2c)
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0_CDMA_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0_CDMA_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0_CDMA_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0x30)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0_CDMA_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0_CDMA_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0_CDMA_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0x34)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0_CDMA_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0_CDMA_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0_CDMA_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0			_MK_ADDR_CONST(0x38)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0_CDMA_BASE_ATOMIC_C_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0_CDMA_BASE_ATOMIC_C_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0_CDMA_BASE_ATOMIC_C_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0			_MK_ADDR_CONST(0x3c)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0_CDMA_BASE_ATOMIC_K_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0_CDMA_BASE_ATOMIC_K_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0_CDMA_BASE_ATOMIC_K_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0			_MK_ADDR_CONST(0x40)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0_CDMA_BASE_ATOMIC_M_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0_CDMA_BASE_ATOMIC_M_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0_CDMA_BASE_ATOMIC_M_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0			_MK_ADDR_CONST(0x44)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0_CDMA_BASE_CBUF_BANK_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0_CDMA_BASE_CBUF_BANK_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0_CDMA_BASE_CBUF_BANK_NUM_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0			_MK_ADDR_CONST(0x48)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0_CDMA_BASE_CBUF_BANK_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0_CDMA_BASE_CBUF_BANK_WIDTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0_CDMA_BASE_CBUF_BANK_WIDTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0			_MK_ADDR_CONST(0x4c)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0_CDMA_BASE_CBUF_BANK_DEPTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0_CDMA_BASE_CBUF_BANK_DEPTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0_CDMA_BASE_CBUF_BANK_DEPTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0
+#define NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0			_MK_ADDR_CONST(0x50)
+#define NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0_CDMA_MULTI_BATCH_MAX_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0_CDMA_MULTI_BATCH_MAX_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0_CDMA_MULTI_BATCH_MAX_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0			_MK_ADDR_CONST(0x54)
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0_CDMA_IMAGE_IN_FORMATS_PACKED_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0_CDMA_IMAGE_IN_FORMATS_PACKED_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0_CDMA_IMAGE_IN_FORMATS_PACKED_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0			_MK_ADDR_CONST(0x58)
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0_CDMA_IMAGE_IN_FORMATS_SEMI_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0_CDMA_IMAGE_IN_FORMATS_SEMI_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0_CDMA_IMAGE_IN_FORMATS_SEMI_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_DESC_0
+#define NVDLA_CFGROM_CFGROM_CBUF_DESC_0			_MK_ADDR_CONST(0x5c)
+#define NVDLA_CFGROM_CFGROM_CBUF_DESC_0_CBUF_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_DESC_0_CBUF_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_DESC_0_CBUF_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x60)
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0_CBUF_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0_CBUF_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0_CBUF_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0			_MK_ADDR_CONST(0x64)
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0_CBUF_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0_CBUF_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0_CBUF_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0			_MK_ADDR_CONST(0x68)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0_CBUF_BASE_CBUF_BANK_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0_CBUF_BASE_CBUF_BANK_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0_CBUF_BASE_CBUF_BANK_NUM_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0			_MK_ADDR_CONST(0x6c)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0_CBUF_BASE_CBUF_BANK_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0_CBUF_BASE_CBUF_BANK_WIDTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0_CBUF_BASE_CBUF_BANK_WIDTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0			_MK_ADDR_CONST(0x70)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0_CBUF_BASE_CBUF_BANK_DEPTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0_CBUF_BASE_CBUF_BANK_DEPTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0_CBUF_BASE_CBUF_BANK_DEPTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0			_MK_ADDR_CONST(0x74)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0_CBUF_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0_CBUF_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0_CBUF_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_DESC_0
+#define NVDLA_CFGROM_CFGROM_CSC_DESC_0			_MK_ADDR_CONST(0x78)
+#define NVDLA_CFGROM_CFGROM_CSC_DESC_0_CSC_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_DESC_0_CSC_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_DESC_0_CSC_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x7c)
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0_CSC_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0_CSC_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0_CSC_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0			_MK_ADDR_CONST(0x80)
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0_CSC_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0_CSC_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0_CSC_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0x84)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0_CSC_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0_CSC_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0_CSC_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0x88)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0_CSC_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0_CSC_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0_CSC_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0			_MK_ADDR_CONST(0x8c)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0_CSC_BASE_ATOMIC_C_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0_CSC_BASE_ATOMIC_C_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0_CSC_BASE_ATOMIC_C_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0			_MK_ADDR_CONST(0x90)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0_CSC_BASE_ATOMIC_K_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0_CSC_BASE_ATOMIC_K_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0_CSC_BASE_ATOMIC_K_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0			_MK_ADDR_CONST(0x94)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0_CSC_BASE_ATOMIC_M_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0_CSC_BASE_ATOMIC_M_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0_CSC_BASE_ATOMIC_M_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0			_MK_ADDR_CONST(0x98)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0_CSC_BASE_CBUF_BANK_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0_CSC_BASE_CBUF_BANK_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0_CSC_BASE_CBUF_BANK_NUM_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0			_MK_ADDR_CONST(0x9c)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0_CSC_BASE_CBUF_BANK_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0_CSC_BASE_CBUF_BANK_WIDTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0_CSC_BASE_CBUF_BANK_WIDTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0			_MK_ADDR_CONST(0xa0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0_CSC_BASE_CBUF_BANK_DEPTH_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0_CSC_BASE_CBUF_BANK_DEPTH_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0_CSC_BASE_CBUF_BANK_DEPTH_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0			_MK_ADDR_CONST(0xa4)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0_CSC_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0_CSC_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0_CSC_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0
+#define NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0			_MK_ADDR_CONST(0xa8)
+#define NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0_CSC_MULTI_BATCH_MAX_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0_CSC_MULTI_BATCH_MAX_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0_CSC_MULTI_BATCH_MAX_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0			_MK_ADDR_CONST(0xac)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0_CMAC_A_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0_CMAC_A_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0_CMAC_A_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0			_MK_ADDR_CONST(0xb0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0_CMAC_A_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0_CMAC_A_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0_CMAC_A_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0			_MK_ADDR_CONST(0xb4)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0_CMAC_A_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0_CMAC_A_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0_CMAC_A_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0xb8)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0_CMAC_A_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0_CMAC_A_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0_CMAC_A_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0xbc)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0_CMAC_A_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0_CMAC_A_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0_CMAC_A_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0			_MK_ADDR_CONST(0xc0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0_CMAC_A_BASE_ATOMIC_C_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0_CMAC_A_BASE_ATOMIC_C_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0_CMAC_A_BASE_ATOMIC_C_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0			_MK_ADDR_CONST(0xc4)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0_CMAC_A_BASE_ATOMIC_K_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0_CMAC_A_BASE_ATOMIC_K_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0_CMAC_A_BASE_ATOMIC_K_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0			_MK_ADDR_CONST(0xc8)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0_CMAC_A_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0_CMAC_A_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0_CMAC_A_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0			_MK_ADDR_CONST(0xcc)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0_CMAC_B_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0_CMAC_B_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0_CMAC_B_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0			_MK_ADDR_CONST(0xd0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0_CMAC_B_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0_CMAC_B_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0_CMAC_B_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0			_MK_ADDR_CONST(0xd4)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0_CMAC_B_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0_CMAC_B_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0_CMAC_B_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0xd8)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0_CMAC_B_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0_CMAC_B_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0_CMAC_B_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0xdc)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0_CMAC_B_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0_CMAC_B_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0_CMAC_B_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0			_MK_ADDR_CONST(0xe0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0_CMAC_B_BASE_ATOMIC_C_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0_CMAC_B_BASE_ATOMIC_C_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0_CMAC_B_BASE_ATOMIC_C_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0			_MK_ADDR_CONST(0xe4)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0_CMAC_B_BASE_ATOMIC_K_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0_CMAC_B_BASE_ATOMIC_K_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0_CMAC_B_BASE_ATOMIC_K_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0			_MK_ADDR_CONST(0xe8)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0_CMAC_B_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0_CMAC_B_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0_CMAC_B_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_DESC_0
+#define NVDLA_CFGROM_CFGROM_CACC_DESC_0			_MK_ADDR_CONST(0xec)
+#define NVDLA_CFGROM_CFGROM_CACC_DESC_0_CACC_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_DESC_0_CACC_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_DESC_0_CACC_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0			_MK_ADDR_CONST(0xf0)
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0_CACC_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0_CACC_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0_CACC_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0			_MK_ADDR_CONST(0xf4)
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0_CACC_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0_CACC_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0_CACC_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0xf8)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0_CACC_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0_CACC_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0_CACC_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0xfc)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0_CACC_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0_CACC_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0_CACC_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0			_MK_ADDR_CONST(0x100)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0_CACC_BASE_ATOMIC_C_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0_CACC_BASE_ATOMIC_C_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0_CACC_BASE_ATOMIC_C_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0			_MK_ADDR_CONST(0x104)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0_CACC_BASE_ATOMIC_K_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0_CACC_BASE_ATOMIC_K_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0_CACC_BASE_ATOMIC_K_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0			_MK_ADDR_CONST(0x108)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0_CACC_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0_CACC_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0_CACC_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0
+#define NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0			_MK_ADDR_CONST(0x10c)
+#define NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0_CACC_MULTI_BATCH_MAX_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0_CACC_MULTI_BATCH_MAX_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0_CACC_MULTI_BATCH_MAX_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0			_MK_ADDR_CONST(0x110)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0_SDP_RDMA_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0_SDP_RDMA_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0_SDP_RDMA_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x114)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0_SDP_RDMA_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0_SDP_RDMA_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0_SDP_RDMA_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0			_MK_ADDR_CONST(0x118)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0_SDP_RDMA_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0_SDP_RDMA_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0_SDP_RDMA_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0			_MK_ADDR_CONST(0x11c)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0_SDP_RDMA_BASE_ATOMIC_M_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0_SDP_RDMA_BASE_ATOMIC_M_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0_SDP_RDMA_BASE_ATOMIC_M_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0			_MK_ADDR_CONST(0x120)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0_SDP_RDMA_BASE_SDP_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0_SDP_RDMA_BASE_SDP_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0_SDP_RDMA_BASE_SDP_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_DESC_0
+#define NVDLA_CFGROM_CFGROM_SDP_DESC_0			_MK_ADDR_CONST(0x124)
+#define NVDLA_CFGROM_CFGROM_SDP_DESC_0_SDP_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_DESC_0_SDP_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_DESC_0_SDP_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x128)
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0_SDP_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0_SDP_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0_SDP_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0			_MK_ADDR_CONST(0x12c)
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0_SDP_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0_SDP_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0_SDP_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0x130)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0_SDP_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0_SDP_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0_SDP_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0			_MK_ADDR_CONST(0x134)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0_SDP_BASE_WEIGHT_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0_SDP_BASE_WEIGHT_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0_SDP_BASE_WEIGHT_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0			_MK_ADDR_CONST(0x138)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0_SDP_BASE_CDMA_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0_SDP_BASE_CDMA_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0_SDP_BASE_CDMA_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0
+#define NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0			_MK_ADDR_CONST(0x13c)
+#define NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0_SDP_MULTI_BATCH_MAX_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0_SDP_MULTI_BATCH_MAX_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0_SDP_MULTI_BATCH_MAX_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0
+#define NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0			_MK_ADDR_CONST(0x140)
+#define NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0_SDP_BS_THROUGHPUT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0_SDP_BS_THROUGHPUT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0_SDP_BS_THROUGHPUT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0
+#define NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0			_MK_ADDR_CONST(0x144)
+#define NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0_SDP_BN_THROUGHPUT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0_SDP_BN_THROUGHPUT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0_SDP_BN_THROUGHPUT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0
+#define NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0			_MK_ADDR_CONST(0x148)
+#define NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0_SDP_EW_THROUGHPUT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0_SDP_EW_THROUGHPUT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0_SDP_EW_THROUGHPUT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0			_MK_ADDR_CONST(0x14c)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0_PDP_RDMA_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0_PDP_RDMA_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0_PDP_RDMA_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x150)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0_PDP_RDMA_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0_PDP_RDMA_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0_PDP_RDMA_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0			_MK_ADDR_CONST(0x154)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0_PDP_RDMA_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0_PDP_RDMA_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0_PDP_RDMA_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0			_MK_ADDR_CONST(0x158)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0_PDP_RDMA_BASE_ATOMIC_M_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0_PDP_RDMA_BASE_ATOMIC_M_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0_PDP_RDMA_BASE_ATOMIC_M_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0			_MK_ADDR_CONST(0x15c)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0_PDP_RDMA_BASE_PDP_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0_PDP_RDMA_BASE_PDP_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0_PDP_RDMA_BASE_PDP_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_DESC_0
+#define NVDLA_CFGROM_CFGROM_PDP_DESC_0			_MK_ADDR_CONST(0x160)
+#define NVDLA_CFGROM_CFGROM_PDP_DESC_0_PDP_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_DESC_0_PDP_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_DESC_0_PDP_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x164)
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0_PDP_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0_PDP_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0_PDP_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0			_MK_ADDR_CONST(0x168)
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0_PDP_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0_PDP_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0_PDP_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0x16c)
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0_PDP_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0_PDP_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0_PDP_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0			_MK_ADDR_CONST(0x170)
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0_PDP_BASE_THROUGHPUT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0_PDP_BASE_THROUGHPUT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0_PDP_BASE_THROUGHPUT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0			_MK_ADDR_CONST(0x174)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0_CDP_RDMA_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0_CDP_RDMA_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0_CDP_RDMA_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x178)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0_CDP_RDMA_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0_CDP_RDMA_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0_CDP_RDMA_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0			_MK_ADDR_CONST(0x17c)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0_CDP_RDMA_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0_CDP_RDMA_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0_CDP_RDMA_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0			_MK_ADDR_CONST(0x180)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0_CDP_RDMA_BASE_ATOMIC_M_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0_CDP_RDMA_BASE_ATOMIC_M_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0_CDP_RDMA_BASE_ATOMIC_M_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0			_MK_ADDR_CONST(0x184)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0_CDP_RDMA_BASE_CDP_ID_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0_CDP_RDMA_BASE_CDP_ID_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0_CDP_RDMA_BASE_CDP_ID_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_DESC_0
+#define NVDLA_CFGROM_CFGROM_CDP_DESC_0			_MK_ADDR_CONST(0x188)
+#define NVDLA_CFGROM_CFGROM_CDP_DESC_0_CDP_DESC_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_DESC_0_CDP_DESC_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_DESC_0_CDP_DESC_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0			_MK_ADDR_CONST(0x18c)
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0_CDP_CAP_INCOMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0_CDP_CAP_INCOMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0_CDP_CAP_INCOMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0			_MK_ADDR_CONST(0x190)
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0_CDP_CAP_COMPAT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0_CDP_CAP_COMPAT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0_CDP_CAP_COMPAT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0			_MK_ADDR_CONST(0x194)
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0_CDP_BASE_FEATURE_TYPES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0_CDP_BASE_FEATURE_TYPES_FIELD			_MK_FIELD_CONST(0xfff, NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0_CDP_BASE_FEATURE_TYPES_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0			_MK_ADDR_CONST(0x198)
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0_CDP_BASE_THROUGHPUT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0_CDP_BASE_THROUGHPUT_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0_CDP_BASE_THROUGHPUT_SHIFT)
+
+
+// Register NVDLA_CFGROM_CFGROM_END_OF_LIST_0
+#define NVDLA_CFGROM_CFGROM_END_OF_LIST_0			_MK_ADDR_CONST(0x19c)
+#define NVDLA_CFGROM_CFGROM_END_OF_LIST_0_END_OF_LIST_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CFGROM_CFGROM_END_OF_LIST_0_END_OF_LIST_FIELD			_MK_FIELD_CONST(0xffffffff, NVDLA_CFGROM_CFGROM_END_OF_LIST_0_END_OF_LIST_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register GLB_S_NVDLA_HW_VERSION_0
+#define GLB_S_NVDLA_HW_VERSION_0			_MK_ADDR_CONST(0x1000)
+#define GLB_S_NVDLA_HW_VERSION_0_MAJOR_SHIFT			_MK_SHIFT_CONST(0)
+#define GLB_S_NVDLA_HW_VERSION_0_MAJOR_FIELD			_MK_FIELD_CONST(0xff, GLB_S_NVDLA_HW_VERSION_0_MAJOR_SHIFT)
+#define GLB_S_NVDLA_HW_VERSION_0_MINOR_SHIFT			_MK_SHIFT_CONST(8)
+#define GLB_S_NVDLA_HW_VERSION_0_MINOR_FIELD			_MK_FIELD_CONST(0xffff, GLB_S_NVDLA_HW_VERSION_0_MINOR_SHIFT)
+
+
+// Register GLB_S_INTR_MASK_0
+#define GLB_S_INTR_MASK_0			_MK_ADDR_CONST(0x1004)
+#define GLB_S_INTR_MASK_0_SDP_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(0)
+#define GLB_S_INTR_MASK_0_SDP_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_SDP_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_SDP_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(1)
+#define GLB_S_INTR_MASK_0_SDP_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_SDP_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_CDP_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(2)
+#define GLB_S_INTR_MASK_0_CDP_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDP_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_CDP_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(3)
+#define GLB_S_INTR_MASK_0_CDP_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDP_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_PDP_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(4)
+#define GLB_S_INTR_MASK_0_PDP_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_PDP_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_PDP_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(5)
+#define GLB_S_INTR_MASK_0_PDP_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_PDP_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_BDMA_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(6)
+#define GLB_S_INTR_MASK_0_BDMA_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_BDMA_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_BDMA_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(7)
+#define GLB_S_INTR_MASK_0_BDMA_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_BDMA_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_RUBIK_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(8)
+#define GLB_S_INTR_MASK_0_RUBIK_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_RUBIK_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_RUBIK_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(9)
+#define GLB_S_INTR_MASK_0_RUBIK_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_RUBIK_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(16)
+#define GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(17)
+#define GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDMA_DAT_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(18)
+#define GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(19)
+#define GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CDMA_WT_DONE_MASK1_SHIFT)
+#define GLB_S_INTR_MASK_0_CACC_DONE_MASK0_SHIFT			_MK_SHIFT_CONST(20)
+#define GLB_S_INTR_MASK_0_CACC_DONE_MASK0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CACC_DONE_MASK0_SHIFT)
+#define GLB_S_INTR_MASK_0_CACC_DONE_MASK1_SHIFT			_MK_SHIFT_CONST(21)
+#define GLB_S_INTR_MASK_0_CACC_DONE_MASK1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_MASK_0_CACC_DONE_MASK1_SHIFT)
+
+
+// Register GLB_S_INTR_SET_0
+#define GLB_S_INTR_SET_0			_MK_ADDR_CONST(0x1008)
+#define GLB_S_INTR_SET_0_SDP_DONE_SET0_SHIFT			_MK_SHIFT_CONST(0)
+#define GLB_S_INTR_SET_0_SDP_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_SDP_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_SDP_DONE_SET1_SHIFT			_MK_SHIFT_CONST(1)
+#define GLB_S_INTR_SET_0_SDP_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_SDP_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_CDP_DONE_SET0_SHIFT			_MK_SHIFT_CONST(2)
+#define GLB_S_INTR_SET_0_CDP_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDP_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_CDP_DONE_SET1_SHIFT			_MK_SHIFT_CONST(3)
+#define GLB_S_INTR_SET_0_CDP_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDP_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_PDP_DONE_SET0_SHIFT			_MK_SHIFT_CONST(4)
+#define GLB_S_INTR_SET_0_PDP_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_PDP_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_PDP_DONE_SET1_SHIFT			_MK_SHIFT_CONST(5)
+#define GLB_S_INTR_SET_0_PDP_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_PDP_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_BDMA_DONE_SET0_SHIFT			_MK_SHIFT_CONST(6)
+#define GLB_S_INTR_SET_0_BDMA_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_BDMA_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_BDMA_DONE_SET1_SHIFT			_MK_SHIFT_CONST(7)
+#define GLB_S_INTR_SET_0_BDMA_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_BDMA_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_RUBIK_DONE_SET0_SHIFT			_MK_SHIFT_CONST(8)
+#define GLB_S_INTR_SET_0_RUBIK_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_RUBIK_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_RUBIK_DONE_SET1_SHIFT			_MK_SHIFT_CONST(9)
+#define GLB_S_INTR_SET_0_RUBIK_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_RUBIK_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET0_SHIFT			_MK_SHIFT_CONST(16)
+#define GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET1_SHIFT			_MK_SHIFT_CONST(17)
+#define GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDMA_DAT_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_CDMA_WT_DONE_SET0_SHIFT			_MK_SHIFT_CONST(18)
+#define GLB_S_INTR_SET_0_CDMA_WT_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDMA_WT_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_CDMA_WT_DONE_SET1_SHIFT			_MK_SHIFT_CONST(19)
+#define GLB_S_INTR_SET_0_CDMA_WT_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CDMA_WT_DONE_SET1_SHIFT)
+#define GLB_S_INTR_SET_0_CACC_DONE_SET0_SHIFT			_MK_SHIFT_CONST(20)
+#define GLB_S_INTR_SET_0_CACC_DONE_SET0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CACC_DONE_SET0_SHIFT)
+#define GLB_S_INTR_SET_0_CACC_DONE_SET1_SHIFT			_MK_SHIFT_CONST(21)
+#define GLB_S_INTR_SET_0_CACC_DONE_SET1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_SET_0_CACC_DONE_SET1_SHIFT)
+
+
+// Register GLB_S_INTR_STATUS_0
+#define GLB_S_INTR_STATUS_0			_MK_ADDR_CONST(0x100c)
+#define GLB_S_INTR_STATUS_0_SDP_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(0)
+#define GLB_S_INTR_STATUS_0_SDP_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_SDP_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_SDP_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(1)
+#define GLB_S_INTR_STATUS_0_SDP_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_SDP_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDP_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(2)
+#define GLB_S_INTR_STATUS_0_CDP_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDP_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDP_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(3)
+#define GLB_S_INTR_STATUS_0_CDP_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDP_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_PDP_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(4)
+#define GLB_S_INTR_STATUS_0_PDP_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_PDP_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_PDP_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(5)
+#define GLB_S_INTR_STATUS_0_PDP_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_PDP_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(6)
+#define GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(7)
+#define GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_BDMA_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(8)
+#define GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(9)
+#define GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_RUBIK_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(16)
+#define GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(17)
+#define GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDMA_DAT_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(18)
+#define GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(19)
+#define GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CDMA_WT_DONE_STATUS1_SHIFT)
+#define GLB_S_INTR_STATUS_0_CACC_DONE_STATUS0_SHIFT			_MK_SHIFT_CONST(20)
+#define GLB_S_INTR_STATUS_0_CACC_DONE_STATUS0_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CACC_DONE_STATUS0_SHIFT)
+#define GLB_S_INTR_STATUS_0_CACC_DONE_STATUS1_SHIFT			_MK_SHIFT_CONST(21)
+#define GLB_S_INTR_STATUS_0_CACC_DONE_STATUS1_FIELD			_MK_FIELD_CONST(0x1, GLB_S_INTR_STATUS_0_CACC_DONE_STATUS1_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register NVDLA_MCIF_CFG_RD_WEIGHT_0_0
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0			_MK_ADDR_CONST(0x2000)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_SHIFT)
+
+
+// Register NVDLA_MCIF_CFG_RD_WEIGHT_1_0
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0			_MK_ADDR_CONST(0x2004)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_SHIFT)
+
+
+// Register NVDLA_MCIF_CFG_RD_WEIGHT_2_0
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0			_MK_ADDR_CONST(0x2008)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_SHIFT)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_SHIFT)
+
+
+// Register NVDLA_MCIF_CFG_WR_WEIGHT_0_0
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0			_MK_ADDR_CONST(0x200c)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_SHIFT)
+
+
+// Register NVDLA_MCIF_CFG_WR_WEIGHT_1_0
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0			_MK_ADDR_CONST(0x2010)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_SHIFT)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_SHIFT)
+
+
+// Register NVDLA_MCIF_CFG_OUTSTANDING_CNT_0
+#define NVDLA_MCIF_CFG_OUTSTANDING_CNT_0			_MK_ADDR_CONST(0x2014)
+#define NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_SHIFT)
+#define NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_MCIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_SHIFT)
+
+
+// Register NVDLA_MCIF_STATUS_0
+#define NVDLA_MCIF_STATUS_0			_MK_ADDR_CONST(0x2018)
+#define NVDLA_MCIF_STATUS_0_IDLE_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_MCIF_STATUS_0_IDLE_FIELD			_MK_FIELD_CONST(0x1, NVDLA_MCIF_STATUS_0_IDLE_SHIFT)
+#define NVDLA_MCIF_STATUS_0_IDLE_NO			_MK_ENUM_CONST(0x0)
+#define NVDLA_MCIF_STATUS_0_IDLE_YES			_MK_ENUM_CONST(0x1)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CDMA_S_STATUS_0
+#define CDMA_S_STATUS_0			_MK_ADDR_CONST(0x3000)
+#define CDMA_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CDMA_S_STATUS_0_STATUS_0_SHIFT)
+#define CDMA_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CDMA_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDMA_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CDMA_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CDMA_S_STATUS_0_STATUS_1_SHIFT)
+#define CDMA_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CDMA_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDMA_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CDMA_S_POINTER_0
+#define CDMA_S_POINTER_0			_MK_ADDR_CONST(0x3004)
+#define CDMA_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CDMA_S_POINTER_0_PRODUCER_SHIFT)
+#define CDMA_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDMA_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CDMA_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CDMA_S_POINTER_0_CONSUMER_SHIFT)
+#define CDMA_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDMA_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_S_ARBITER_0
+#define CDMA_S_ARBITER_0			_MK_ADDR_CONST(0x3008)
+#define CDMA_S_ARBITER_0_ARB_WEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_S_ARBITER_0_ARB_WEIGHT_FIELD			_MK_FIELD_CONST(0xf, CDMA_S_ARBITER_0_ARB_WEIGHT_SHIFT)
+#define CDMA_S_ARBITER_0_ARB_WMB_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_S_ARBITER_0_ARB_WMB_FIELD			_MK_FIELD_CONST(0xf, CDMA_S_ARBITER_0_ARB_WMB_SHIFT)
+
+
+// Register CDMA_S_CBUF_FLUSH_STATUS_0
+#define CDMA_S_CBUF_FLUSH_STATUS_0			_MK_ADDR_CONST(0x300c)
+#define CDMA_S_CBUF_FLUSH_STATUS_0_FLUSH_DONE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_S_CBUF_FLUSH_STATUS_0_FLUSH_DONE_FIELD			_MK_FIELD_CONST(0x1, CDMA_S_CBUF_FLUSH_STATUS_0_FLUSH_DONE_SHIFT)
+
+
+// Register CDMA_D_OP_ENABLE_0
+#define CDMA_D_OP_ENABLE_0			_MK_ADDR_CONST(0x3010)
+#define CDMA_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CDMA_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_MISC_CFG_0
+#define CDMA_D_MISC_CFG_0			_MK_ADDR_CONST(0x3014)
+#define CDMA_D_MISC_CFG_0_CONV_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_MISC_CFG_0_CONV_MODE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MISC_CFG_0_CONV_MODE_SHIFT)
+#define CDMA_D_MISC_CFG_0_CONV_MODE_DIRECT			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_CONV_MODE_WINOGRAD			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_IN_PRECISION_SHIFT			_MK_SHIFT_CONST(8)
+#define CDMA_D_MISC_CFG_0_IN_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CDMA_D_MISC_CFG_0_IN_PRECISION_SHIFT)
+#define CDMA_D_MISC_CFG_0_IN_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_IN_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_IN_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define CDMA_D_MISC_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(12)
+#define CDMA_D_MISC_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CDMA_D_MISC_CFG_0_PROC_PRECISION_SHIFT)
+#define CDMA_D_MISC_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define CDMA_D_MISC_CFG_0_DATA_REUSE_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_MISC_CFG_0_DATA_REUSE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MISC_CFG_0_DATA_REUSE_SHIFT)
+#define CDMA_D_MISC_CFG_0_DATA_REUSE_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_DATA_REUSE_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_WEIGHT_REUSE_SHIFT			_MK_SHIFT_CONST(20)
+#define CDMA_D_MISC_CFG_0_WEIGHT_REUSE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MISC_CFG_0_WEIGHT_REUSE_SHIFT)
+#define CDMA_D_MISC_CFG_0_WEIGHT_REUSE_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_WEIGHT_REUSE_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_SKIP_DATA_RLS_SHIFT			_MK_SHIFT_CONST(24)
+#define CDMA_D_MISC_CFG_0_SKIP_DATA_RLS_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MISC_CFG_0_SKIP_DATA_RLS_SHIFT)
+#define CDMA_D_MISC_CFG_0_SKIP_DATA_RLS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_SKIP_DATA_RLS_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDMA_D_MISC_CFG_0_SKIP_WEIGHT_RLS_SHIFT			_MK_SHIFT_CONST(28)
+#define CDMA_D_MISC_CFG_0_SKIP_WEIGHT_RLS_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MISC_CFG_0_SKIP_WEIGHT_RLS_SHIFT)
+#define CDMA_D_MISC_CFG_0_SKIP_WEIGHT_RLS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MISC_CFG_0_SKIP_WEIGHT_RLS_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_DATAIN_FORMAT_0
+#define CDMA_D_DATAIN_FORMAT_0			_MK_ADDR_CONST(0x3018)
+#define CDMA_D_DATAIN_FORMAT_0_DATAIN_FORMAT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DATAIN_FORMAT_0_DATAIN_FORMAT_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DATAIN_FORMAT_0_DATAIN_FORMAT_SHIFT)
+#define CDMA_D_DATAIN_FORMAT_0_DATAIN_FORMAT_FEATURE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DATAIN_FORMAT_0_DATAIN_FORMAT_PIXEL			_MK_ENUM_CONST(0x1)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_SHIFT			_MK_SHIFT_CONST(8)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_FIELD			_MK_FIELD_CONST(0x3f, CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_SHIFT)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R8			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R10			_MK_ENUM_CONST(0x1)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R12			_MK_ENUM_CONST(0x2)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R16			_MK_ENUM_CONST(0x3)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R16_I			_MK_ENUM_CONST(0x4)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R16_F			_MK_ENUM_CONST(0x5)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A16B16G16R16			_MK_ENUM_CONST(0x6)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_X16B16G16R16			_MK_ENUM_CONST(0x7)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A16B16G16R16_F			_MK_ENUM_CONST(0x8)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A16Y16U16V16			_MK_ENUM_CONST(0x9)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_V16U16Y16A16			_MK_ENUM_CONST(0xa)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A16Y16U16V16_F			_MK_ENUM_CONST(0xb)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A8B8G8R8			_MK_ENUM_CONST(0xc)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A8R8G8B8			_MK_ENUM_CONST(0xd)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_B8G8R8A8			_MK_ENUM_CONST(0xe)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R8G8B8A8			_MK_ENUM_CONST(0xf)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_X8B8G8R8			_MK_ENUM_CONST(0x10)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_X8R8G8B8			_MK_ENUM_CONST(0x11)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_B8G8R8X8			_MK_ENUM_CONST(0x12)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R8G8B8X8			_MK_ENUM_CONST(0x13)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A2B10G10R10			_MK_ENUM_CONST(0x14)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A2R10G10B10			_MK_ENUM_CONST(0x15)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_B10G10R10A2			_MK_ENUM_CONST(0x16)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_R10G10B10A2			_MK_ENUM_CONST(0x17)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A2Y10U10V10			_MK_ENUM_CONST(0x18)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_V10U10Y10A2			_MK_ENUM_CONST(0x19)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_A8Y8U8V8			_MK_ENUM_CONST(0x1a)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_V8U8Y8A8			_MK_ENUM_CONST(0x1b)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y8___U8V8_N444			_MK_ENUM_CONST(0x1c)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y8___V8U8_N444			_MK_ENUM_CONST(0x1d)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y10___U10V10_N444			_MK_ENUM_CONST(0x1e)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y10___V10U10_N444			_MK_ENUM_CONST(0x1f)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y12___U12V12_N444			_MK_ENUM_CONST(0x20)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y12___V12U12_N444			_MK_ENUM_CONST(0x21)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y16___U16V16_N444			_MK_ENUM_CONST(0x22)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_FORMAT_T_Y16___V16U16_N444			_MK_ENUM_CONST(0x23)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_MAPPING_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_MAPPING_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DATAIN_FORMAT_0_PIXEL_MAPPING_SHIFT)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_MAPPING_PITCH_LINEAR			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_MAPPING_RESERVED_LINEAR			_MK_ENUM_CONST(0x1)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_SIGN_OVERRIDE_SHIFT			_MK_SHIFT_CONST(20)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_SIGN_OVERRIDE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DATAIN_FORMAT_0_PIXEL_SIGN_OVERRIDE_SHIFT)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_SIGN_OVERRIDE_UNSIGNED_INT			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DATAIN_FORMAT_0_PIXEL_SIGN_OVERRIDE_SIGNED_INT			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_DATAIN_SIZE_0_0
+#define CDMA_D_DATAIN_SIZE_0_0			_MK_ADDR_CONST(0x301c)
+#define CDMA_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_SHIFT)
+#define CDMA_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_SHIFT)
+
+
+// Register CDMA_D_DATAIN_SIZE_1_0
+#define CDMA_D_DATAIN_SIZE_1_0			_MK_ADDR_CONST(0x3020)
+#define CDMA_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_SHIFT)
+
+
+// Register CDMA_D_DATAIN_SIZE_EXT_0_0
+#define CDMA_D_DATAIN_SIZE_EXT_0_0			_MK_ADDR_CONST(0x3024)
+#define CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_SHIFT)
+#define CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_SHIFT)
+
+
+// Register CDMA_D_PIXEL_OFFSET_0
+#define CDMA_D_PIXEL_OFFSET_0			_MK_ADDR_CONST(0x3028)
+#define CDMA_D_PIXEL_OFFSET_0_PIXEL_X_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PIXEL_OFFSET_0_PIXEL_X_OFFSET_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_PIXEL_OFFSET_0_PIXEL_X_OFFSET_SHIFT)
+#define CDMA_D_PIXEL_OFFSET_0_PIXEL_Y_OFFSET_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_PIXEL_OFFSET_0_PIXEL_Y_OFFSET_FIELD			_MK_FIELD_CONST(0x7, CDMA_D_PIXEL_OFFSET_0_PIXEL_Y_OFFSET_SHIFT)
+
+
+// Register CDMA_D_DAIN_RAM_TYPE_0
+#define CDMA_D_DAIN_RAM_TYPE_0			_MK_ADDR_CONST(0x302c)
+#define CDMA_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_SHIFT)
+#define CDMA_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_CVIF			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_MCIF			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_DAIN_ADDR_HIGH_0_0
+#define CDMA_D_DAIN_ADDR_HIGH_0_0			_MK_ADDR_CONST(0x3030)
+#define CDMA_D_DAIN_ADDR_HIGH_0_0_DATAIN_ADDR_HIGH_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_ADDR_HIGH_0_0_DATAIN_ADDR_HIGH_0_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_DAIN_ADDR_HIGH_0_0_DATAIN_ADDR_HIGH_0_SHIFT)
+
+
+// Register CDMA_D_DAIN_ADDR_LOW_0_0
+#define CDMA_D_DAIN_ADDR_LOW_0_0			_MK_ADDR_CONST(0x3034)
+#define CDMA_D_DAIN_ADDR_LOW_0_0_DATAIN_ADDR_LOW_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_ADDR_LOW_0_0_DATAIN_ADDR_LOW_0_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_DAIN_ADDR_LOW_0_0_DATAIN_ADDR_LOW_0_SHIFT)
+
+
+// Register CDMA_D_DAIN_ADDR_HIGH_1_0
+#define CDMA_D_DAIN_ADDR_HIGH_1_0			_MK_ADDR_CONST(0x3038)
+#define CDMA_D_DAIN_ADDR_HIGH_1_0_DATAIN_ADDR_HIGH_1_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_ADDR_HIGH_1_0_DATAIN_ADDR_HIGH_1_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_DAIN_ADDR_HIGH_1_0_DATAIN_ADDR_HIGH_1_SHIFT)
+
+
+// Register CDMA_D_DAIN_ADDR_LOW_1_0
+#define CDMA_D_DAIN_ADDR_LOW_1_0			_MK_ADDR_CONST(0x303c)
+#define CDMA_D_DAIN_ADDR_LOW_1_0_DATAIN_ADDR_LOW_1_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_ADDR_LOW_1_0_DATAIN_ADDR_LOW_1_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_DAIN_ADDR_LOW_1_0_DATAIN_ADDR_LOW_1_SHIFT)
+
+
+// Register CDMA_D_LINE_STRIDE_0
+#define CDMA_D_LINE_STRIDE_0			_MK_ADDR_CONST(0x3040)
+#define CDMA_D_LINE_STRIDE_0_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_LINE_STRIDE_0_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_LINE_STRIDE_0_LINE_STRIDE_SHIFT)
+
+
+// Register CDMA_D_LINE_UV_STRIDE_0
+#define CDMA_D_LINE_UV_STRIDE_0			_MK_ADDR_CONST(0x3044)
+#define CDMA_D_LINE_UV_STRIDE_0_UV_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_LINE_UV_STRIDE_0_UV_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_LINE_UV_STRIDE_0_UV_LINE_STRIDE_SHIFT)
+
+
+// Register CDMA_D_SURF_STRIDE_0
+#define CDMA_D_SURF_STRIDE_0			_MK_ADDR_CONST(0x3048)
+#define CDMA_D_SURF_STRIDE_0_SURF_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_SURF_STRIDE_0_SURF_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_SURF_STRIDE_0_SURF_STRIDE_SHIFT)
+
+
+// Register CDMA_D_DAIN_MAP_0
+#define CDMA_D_DAIN_MAP_0			_MK_ADDR_CONST(0x304c)
+#define CDMA_D_DAIN_MAP_0_LINE_PACKED_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_DAIN_MAP_0_LINE_PACKED_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DAIN_MAP_0_LINE_PACKED_SHIFT)
+#define CDMA_D_DAIN_MAP_0_LINE_PACKED_FALSE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DAIN_MAP_0_LINE_PACKED_TRUE			_MK_ENUM_CONST(0x1)
+#define CDMA_D_DAIN_MAP_0_SURF_PACKED_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_DAIN_MAP_0_SURF_PACKED_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_DAIN_MAP_0_SURF_PACKED_SHIFT)
+#define CDMA_D_DAIN_MAP_0_SURF_PACKED_FALSE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_DAIN_MAP_0_SURF_PACKED_TRUE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_RESERVED_X_CFG_0
+#define CDMA_D_RESERVED_X_CFG_0			_MK_ADDR_CONST(0x3050)
+#define CDMA_D_RESERVED_X_CFG_0_RSV_PER_LINE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_RESERVED_X_CFG_0_RSV_PER_LINE_FIELD			_MK_FIELD_CONST(0x3ff, CDMA_D_RESERVED_X_CFG_0_RSV_PER_LINE_SHIFT)
+#define CDMA_D_RESERVED_X_CFG_0_RSV_PER_UV_LINE_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_RESERVED_X_CFG_0_RSV_PER_UV_LINE_FIELD			_MK_FIELD_CONST(0x3ff, CDMA_D_RESERVED_X_CFG_0_RSV_PER_UV_LINE_SHIFT)
+
+
+// Register CDMA_D_RESERVED_Y_CFG_0
+#define CDMA_D_RESERVED_Y_CFG_0			_MK_ADDR_CONST(0x3054)
+#define CDMA_D_RESERVED_Y_CFG_0_RSV_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_RESERVED_Y_CFG_0_RSV_HEIGHT_FIELD			_MK_FIELD_CONST(0x7, CDMA_D_RESERVED_Y_CFG_0_RSV_HEIGHT_SHIFT)
+#define CDMA_D_RESERVED_Y_CFG_0_RSV_Y_INDEX_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_RESERVED_Y_CFG_0_RSV_Y_INDEX_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_RESERVED_Y_CFG_0_RSV_Y_INDEX_SHIFT)
+
+
+// Register CDMA_D_BATCH_NUMBER_0
+#define CDMA_D_BATCH_NUMBER_0			_MK_ADDR_CONST(0x3058)
+#define CDMA_D_BATCH_NUMBER_0_BATCHES_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_BATCH_NUMBER_0_BATCHES_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_BATCH_NUMBER_0_BATCHES_SHIFT)
+
+
+// Register CDMA_D_BATCH_STRIDE_0
+#define CDMA_D_BATCH_STRIDE_0			_MK_ADDR_CONST(0x305c)
+#define CDMA_D_BATCH_STRIDE_0_BATCH_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_BATCH_STRIDE_0_BATCH_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_BATCH_STRIDE_0_BATCH_STRIDE_SHIFT)
+
+
+// Register CDMA_D_ENTRY_PER_SLICE_0
+#define CDMA_D_ENTRY_PER_SLICE_0			_MK_ADDR_CONST(0x3060)
+#define CDMA_D_ENTRY_PER_SLICE_0_ENTRIES_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_ENTRY_PER_SLICE_0_ENTRIES_FIELD			_MK_FIELD_CONST(0x3fff, CDMA_D_ENTRY_PER_SLICE_0_ENTRIES_SHIFT)
+
+
+// Register CDMA_D_FETCH_GRAIN_0
+#define CDMA_D_FETCH_GRAIN_0			_MK_ADDR_CONST(0x3064)
+#define CDMA_D_FETCH_GRAIN_0_GRAINS_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_FETCH_GRAIN_0_GRAINS_FIELD			_MK_FIELD_CONST(0xfff, CDMA_D_FETCH_GRAIN_0_GRAINS_SHIFT)
+
+
+// Register CDMA_D_WEIGHT_FORMAT_0
+#define CDMA_D_WEIGHT_FORMAT_0			_MK_ADDR_CONST(0x3068)
+#define CDMA_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_SHIFT)
+#define CDMA_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_UNCOMPRESSED			_MK_ENUM_CONST(0x0)
+#define CDMA_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_COMPRESSED			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_WEIGHT_SIZE_0_0
+#define CDMA_D_WEIGHT_SIZE_0_0			_MK_ADDR_CONST(0x306c)
+#define CDMA_D_WEIGHT_SIZE_0_0_BYTE_PER_KERNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_SIZE_0_0_BYTE_PER_KERNEL_FIELD			_MK_FIELD_CONST(0x3ffff, CDMA_D_WEIGHT_SIZE_0_0_BYTE_PER_KERNEL_SHIFT)
+
+
+// Register CDMA_D_WEIGHT_SIZE_1_0
+#define CDMA_D_WEIGHT_SIZE_1_0			_MK_ADDR_CONST(0x3070)
+#define CDMA_D_WEIGHT_SIZE_1_0_WEIGHT_KERNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_SIZE_1_0_WEIGHT_KERNEL_FIELD			_MK_FIELD_CONST(0x1fff, CDMA_D_WEIGHT_SIZE_1_0_WEIGHT_KERNEL_SHIFT)
+
+
+// Register CDMA_D_WEIGHT_RAM_TYPE_0
+#define CDMA_D_WEIGHT_RAM_TYPE_0			_MK_ADDR_CONST(0x3074)
+#define CDMA_D_WEIGHT_RAM_TYPE_0_WEIGHT_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_RAM_TYPE_0_WEIGHT_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_WEIGHT_RAM_TYPE_0_WEIGHT_RAM_TYPE_SHIFT)
+#define CDMA_D_WEIGHT_RAM_TYPE_0_WEIGHT_RAM_TYPE_CVIF			_MK_ENUM_CONST(0x0)
+#define CDMA_D_WEIGHT_RAM_TYPE_0_WEIGHT_RAM_TYPE_MCIF			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_WEIGHT_ADDR_HIGH_0
+#define CDMA_D_WEIGHT_ADDR_HIGH_0			_MK_ADDR_CONST(0x3078)
+#define CDMA_D_WEIGHT_ADDR_HIGH_0_WEIGHT_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_ADDR_HIGH_0_WEIGHT_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WEIGHT_ADDR_HIGH_0_WEIGHT_ADDR_HIGH_SHIFT)
+
+
+// Register CDMA_D_WEIGHT_ADDR_LOW_0
+#define CDMA_D_WEIGHT_ADDR_LOW_0			_MK_ADDR_CONST(0x307c)
+#define CDMA_D_WEIGHT_ADDR_LOW_0_WEIGHT_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_ADDR_LOW_0_WEIGHT_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WEIGHT_ADDR_LOW_0_WEIGHT_ADDR_LOW_SHIFT)
+
+
+// Register CDMA_D_WEIGHT_BYTES_0
+#define CDMA_D_WEIGHT_BYTES_0			_MK_ADDR_CONST(0x3080)
+#define CDMA_D_WEIGHT_BYTES_0_WEIGHT_BYTES_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WEIGHT_BYTES_0_WEIGHT_BYTES_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WEIGHT_BYTES_0_WEIGHT_BYTES_SHIFT)
+
+
+// Register CDMA_D_WGS_ADDR_HIGH_0
+#define CDMA_D_WGS_ADDR_HIGH_0			_MK_ADDR_CONST(0x3084)
+#define CDMA_D_WGS_ADDR_HIGH_0_WGS_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WGS_ADDR_HIGH_0_WGS_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WGS_ADDR_HIGH_0_WGS_ADDR_HIGH_SHIFT)
+
+
+// Register CDMA_D_WGS_ADDR_LOW_0
+#define CDMA_D_WGS_ADDR_LOW_0			_MK_ADDR_CONST(0x3088)
+#define CDMA_D_WGS_ADDR_LOW_0_WGS_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WGS_ADDR_LOW_0_WGS_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WGS_ADDR_LOW_0_WGS_ADDR_LOW_SHIFT)
+
+
+// Register CDMA_D_WMB_ADDR_HIGH_0
+#define CDMA_D_WMB_ADDR_HIGH_0			_MK_ADDR_CONST(0x308c)
+#define CDMA_D_WMB_ADDR_HIGH_0_WMB_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WMB_ADDR_HIGH_0_WMB_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WMB_ADDR_HIGH_0_WMB_ADDR_HIGH_SHIFT)
+
+
+// Register CDMA_D_WMB_ADDR_LOW_0
+#define CDMA_D_WMB_ADDR_LOW_0			_MK_ADDR_CONST(0x3090)
+#define CDMA_D_WMB_ADDR_LOW_0_WMB_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WMB_ADDR_LOW_0_WMB_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_WMB_ADDR_LOW_0_WMB_ADDR_LOW_SHIFT)
+
+
+// Register CDMA_D_WMB_BYTES_0
+#define CDMA_D_WMB_BYTES_0			_MK_ADDR_CONST(0x3094)
+#define CDMA_D_WMB_BYTES_0_WMB_BYTES_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_WMB_BYTES_0_WMB_BYTES_FIELD			_MK_FIELD_CONST(0xfffffff, CDMA_D_WMB_BYTES_0_WMB_BYTES_SHIFT)
+
+
+// Register CDMA_D_MEAN_FORMAT_0
+#define CDMA_D_MEAN_FORMAT_0			_MK_ADDR_CONST(0x3098)
+#define CDMA_D_MEAN_FORMAT_0_MEAN_FORMAT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_MEAN_FORMAT_0_MEAN_FORMAT_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_MEAN_FORMAT_0_MEAN_FORMAT_SHIFT)
+#define CDMA_D_MEAN_FORMAT_0_MEAN_FORMAT_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_MEAN_FORMAT_0_MEAN_FORMAT_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_MEAN_GLOBAL_0_0
+#define CDMA_D_MEAN_GLOBAL_0_0			_MK_ADDR_CONST(0x309c)
+#define CDMA_D_MEAN_GLOBAL_0_0_MEAN_RY_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_MEAN_GLOBAL_0_0_MEAN_RY_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_MEAN_GLOBAL_0_0_MEAN_RY_SHIFT)
+#define CDMA_D_MEAN_GLOBAL_0_0_MEAN_GU_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_MEAN_GLOBAL_0_0_MEAN_GU_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_MEAN_GLOBAL_0_0_MEAN_GU_SHIFT)
+
+
+// Register CDMA_D_MEAN_GLOBAL_1_0
+#define CDMA_D_MEAN_GLOBAL_1_0			_MK_ADDR_CONST(0x30a0)
+#define CDMA_D_MEAN_GLOBAL_1_0_MEAN_BV_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_MEAN_GLOBAL_1_0_MEAN_BV_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_MEAN_GLOBAL_1_0_MEAN_BV_SHIFT)
+#define CDMA_D_MEAN_GLOBAL_1_0_MEAN_AX_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_MEAN_GLOBAL_1_0_MEAN_AX_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_MEAN_GLOBAL_1_0_MEAN_AX_SHIFT)
+
+
+// Register CDMA_D_CVT_CFG_0
+#define CDMA_D_CVT_CFG_0			_MK_ADDR_CONST(0x30a4)
+#define CDMA_D_CVT_CFG_0_CVT_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_CVT_CFG_0_CVT_EN_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_CVT_CFG_0_CVT_EN_SHIFT)
+#define CDMA_D_CVT_CFG_0_CVT_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_CVT_CFG_0_CVT_EN_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDMA_D_CVT_CFG_0_CVT_TRUNCATE_SHIFT			_MK_SHIFT_CONST(4)
+#define CDMA_D_CVT_CFG_0_CVT_TRUNCATE_FIELD			_MK_FIELD_CONST(0x3f, CDMA_D_CVT_CFG_0_CVT_TRUNCATE_SHIFT)
+
+
+// Register CDMA_D_CVT_OFFSET_0
+#define CDMA_D_CVT_OFFSET_0			_MK_ADDR_CONST(0x30a8)
+#define CDMA_D_CVT_OFFSET_0_CVT_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_CVT_OFFSET_0_CVT_OFFSET_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_CVT_OFFSET_0_CVT_OFFSET_SHIFT)
+
+
+// Register CDMA_D_CVT_SCALE_0
+#define CDMA_D_CVT_SCALE_0			_MK_ADDR_CONST(0x30ac)
+#define CDMA_D_CVT_SCALE_0_CVT_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_CVT_SCALE_0_CVT_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_CVT_SCALE_0_CVT_SCALE_SHIFT)
+
+
+// Register CDMA_D_CONV_STRIDE_0
+#define CDMA_D_CONV_STRIDE_0			_MK_ADDR_CONST(0x30b0)
+#define CDMA_D_CONV_STRIDE_0_CONV_X_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_CONV_STRIDE_0_CONV_X_STRIDE_FIELD			_MK_FIELD_CONST(0x7, CDMA_D_CONV_STRIDE_0_CONV_X_STRIDE_SHIFT)
+#define CDMA_D_CONV_STRIDE_0_CONV_Y_STRIDE_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_CONV_STRIDE_0_CONV_Y_STRIDE_FIELD			_MK_FIELD_CONST(0x7, CDMA_D_CONV_STRIDE_0_CONV_Y_STRIDE_SHIFT)
+
+
+// Register CDMA_D_ZERO_PADDING_0
+#define CDMA_D_ZERO_PADDING_0			_MK_ADDR_CONST(0x30b4)
+#define CDMA_D_ZERO_PADDING_0_PAD_LEFT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_ZERO_PADDING_0_PAD_LEFT_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_ZERO_PADDING_0_PAD_LEFT_SHIFT)
+#define CDMA_D_ZERO_PADDING_0_PAD_RIGHT_SHIFT			_MK_SHIFT_CONST(8)
+#define CDMA_D_ZERO_PADDING_0_PAD_RIGHT_FIELD			_MK_FIELD_CONST(0x3f, CDMA_D_ZERO_PADDING_0_PAD_RIGHT_SHIFT)
+#define CDMA_D_ZERO_PADDING_0_PAD_TOP_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_ZERO_PADDING_0_PAD_TOP_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_ZERO_PADDING_0_PAD_TOP_SHIFT)
+#define CDMA_D_ZERO_PADDING_0_PAD_BOTTOM_SHIFT			_MK_SHIFT_CONST(24)
+#define CDMA_D_ZERO_PADDING_0_PAD_BOTTOM_FIELD			_MK_FIELD_CONST(0x3f, CDMA_D_ZERO_PADDING_0_PAD_BOTTOM_SHIFT)
+
+
+// Register CDMA_D_ZERO_PADDING_VALUE_0
+#define CDMA_D_ZERO_PADDING_VALUE_0			_MK_ADDR_CONST(0x30b8)
+#define CDMA_D_ZERO_PADDING_VALUE_0_PAD_VALUE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_ZERO_PADDING_VALUE_0_PAD_VALUE_FIELD			_MK_FIELD_CONST(0xffff, CDMA_D_ZERO_PADDING_VALUE_0_PAD_VALUE_SHIFT)
+
+
+// Register CDMA_D_BANK_0
+#define CDMA_D_BANK_0			_MK_ADDR_CONST(0x30bc)
+#define CDMA_D_BANK_0_DATA_BANK_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_BANK_0_DATA_BANK_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_BANK_0_DATA_BANK_SHIFT)
+#define CDMA_D_BANK_0_WEIGHT_BANK_SHIFT			_MK_SHIFT_CONST(16)
+#define CDMA_D_BANK_0_WEIGHT_BANK_FIELD			_MK_FIELD_CONST(0x1f, CDMA_D_BANK_0_WEIGHT_BANK_SHIFT)
+
+
+// Register CDMA_D_NAN_FLUSH_TO_ZERO_0
+#define CDMA_D_NAN_FLUSH_TO_ZERO_0			_MK_ADDR_CONST(0x30c0)
+#define CDMA_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT)
+#define CDMA_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDMA_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDMA_D_NAN_INPUT_DATA_NUM_0
+#define CDMA_D_NAN_INPUT_DATA_NUM_0			_MK_ADDR_CONST(0x30c4)
+#define CDMA_D_NAN_INPUT_DATA_NUM_0_NAN_DATA_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_NAN_INPUT_DATA_NUM_0_NAN_DATA_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_NAN_INPUT_DATA_NUM_0_NAN_DATA_NUM_SHIFT)
+
+
+// Register CDMA_D_NAN_INPUT_WEIGHT_NUM_0
+#define CDMA_D_NAN_INPUT_WEIGHT_NUM_0			_MK_ADDR_CONST(0x30c8)
+#define CDMA_D_NAN_INPUT_WEIGHT_NUM_0_NAN_WEIGHT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_NAN_INPUT_WEIGHT_NUM_0_NAN_WEIGHT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_NAN_INPUT_WEIGHT_NUM_0_NAN_WEIGHT_NUM_SHIFT)
+
+
+// Register CDMA_D_INF_INPUT_DATA_NUM_0
+#define CDMA_D_INF_INPUT_DATA_NUM_0			_MK_ADDR_CONST(0x30cc)
+#define CDMA_D_INF_INPUT_DATA_NUM_0_INF_DATA_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_INF_INPUT_DATA_NUM_0_INF_DATA_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_INF_INPUT_DATA_NUM_0_INF_DATA_NUM_SHIFT)
+
+
+// Register CDMA_D_INF_INPUT_WEIGHT_NUM_0
+#define CDMA_D_INF_INPUT_WEIGHT_NUM_0			_MK_ADDR_CONST(0x30d0)
+#define CDMA_D_INF_INPUT_WEIGHT_NUM_0_INF_WEIGHT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_INF_INPUT_WEIGHT_NUM_0_INF_WEIGHT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_INF_INPUT_WEIGHT_NUM_0_INF_WEIGHT_NUM_SHIFT)
+
+
+// Register CDMA_D_PERF_ENABLE_0
+#define CDMA_D_PERF_ENABLE_0			_MK_ADDR_CONST(0x30d4)
+#define CDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PERF_ENABLE_0_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, CDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT)
+
+
+// Register CDMA_D_PERF_DAT_READ_STALL_0
+#define CDMA_D_PERF_DAT_READ_STALL_0			_MK_ADDR_CONST(0x30d8)
+#define CDMA_D_PERF_DAT_READ_STALL_0_DAT_RD_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PERF_DAT_READ_STALL_0_DAT_RD_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_PERF_DAT_READ_STALL_0_DAT_RD_STALL_SHIFT)
+
+
+// Register CDMA_D_PERF_WT_READ_STALL_0
+#define CDMA_D_PERF_WT_READ_STALL_0			_MK_ADDR_CONST(0x30dc)
+#define CDMA_D_PERF_WT_READ_STALL_0_WT_RD_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PERF_WT_READ_STALL_0_WT_RD_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_PERF_WT_READ_STALL_0_WT_RD_STALL_SHIFT)
+
+
+// Register CDMA_D_PERF_DAT_READ_LATENCY_0
+#define CDMA_D_PERF_DAT_READ_LATENCY_0			_MK_ADDR_CONST(0x30e0)
+#define CDMA_D_PERF_DAT_READ_LATENCY_0_DAT_RD_LATENCY_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PERF_DAT_READ_LATENCY_0_DAT_RD_LATENCY_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_PERF_DAT_READ_LATENCY_0_DAT_RD_LATENCY_SHIFT)
+
+
+// Register CDMA_D_PERF_WT_READ_LATENCY_0
+#define CDMA_D_PERF_WT_READ_LATENCY_0			_MK_ADDR_CONST(0x30e4)
+#define CDMA_D_PERF_WT_READ_LATENCY_0_WT_RD_LATENCY_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_PERF_WT_READ_LATENCY_0_WT_RD_LATENCY_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_PERF_WT_READ_LATENCY_0_WT_RD_LATENCY_SHIFT)
+
+
+// Register CDMA_D_CYA_0
+#define CDMA_D_CYA_0			_MK_ADDR_CONST(0x30e8)
+#define CDMA_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define CDMA_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, CDMA_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CSC_S_STATUS_0
+#define CSC_S_STATUS_0			_MK_ADDR_CONST(0x4000)
+#define CSC_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CSC_S_STATUS_0_STATUS_0_SHIFT)
+#define CSC_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CSC_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CSC_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CSC_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CSC_S_STATUS_0_STATUS_1_SHIFT)
+#define CSC_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CSC_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CSC_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CSC_S_POINTER_0
+#define CSC_S_POINTER_0			_MK_ADDR_CONST(0x4004)
+#define CSC_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CSC_S_POINTER_0_PRODUCER_SHIFT)
+#define CSC_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CSC_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CSC_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CSC_S_POINTER_0_CONSUMER_SHIFT)
+#define CSC_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CSC_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CSC_D_OP_ENABLE_0
+#define CSC_D_OP_ENABLE_0			_MK_ADDR_CONST(0x4008)
+#define CSC_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CSC_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CSC_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CSC_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CSC_D_MISC_CFG_0
+#define CSC_D_MISC_CFG_0			_MK_ADDR_CONST(0x400c)
+#define CSC_D_MISC_CFG_0_CONV_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_MISC_CFG_0_CONV_MODE_FIELD			_MK_FIELD_CONST(0x1, CSC_D_MISC_CFG_0_CONV_MODE_SHIFT)
+#define CSC_D_MISC_CFG_0_CONV_MODE_DIRECT			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_CONV_MODE_WINOGRAD			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_IN_PRECISION_SHIFT			_MK_SHIFT_CONST(8)
+#define CSC_D_MISC_CFG_0_IN_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CSC_D_MISC_CFG_0_IN_PRECISION_SHIFT)
+#define CSC_D_MISC_CFG_0_IN_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_IN_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_IN_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define CSC_D_MISC_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(12)
+#define CSC_D_MISC_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CSC_D_MISC_CFG_0_PROC_PRECISION_SHIFT)
+#define CSC_D_MISC_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define CSC_D_MISC_CFG_0_DATA_REUSE_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_MISC_CFG_0_DATA_REUSE_FIELD			_MK_FIELD_CONST(0x1, CSC_D_MISC_CFG_0_DATA_REUSE_SHIFT)
+#define CSC_D_MISC_CFG_0_DATA_REUSE_DISABLE			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_DATA_REUSE_ENABLE			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_WEIGHT_REUSE_SHIFT			_MK_SHIFT_CONST(20)
+#define CSC_D_MISC_CFG_0_WEIGHT_REUSE_FIELD			_MK_FIELD_CONST(0x1, CSC_D_MISC_CFG_0_WEIGHT_REUSE_SHIFT)
+#define CSC_D_MISC_CFG_0_WEIGHT_REUSE_DISABLE			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_WEIGHT_REUSE_ENABLE			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_SKIP_DATA_RLS_SHIFT			_MK_SHIFT_CONST(24)
+#define CSC_D_MISC_CFG_0_SKIP_DATA_RLS_FIELD			_MK_FIELD_CONST(0x1, CSC_D_MISC_CFG_0_SKIP_DATA_RLS_SHIFT)
+#define CSC_D_MISC_CFG_0_SKIP_DATA_RLS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_SKIP_DATA_RLS_ENABLE			_MK_ENUM_CONST(0x1)
+#define CSC_D_MISC_CFG_0_SKIP_WEIGHT_RLS_SHIFT			_MK_SHIFT_CONST(28)
+#define CSC_D_MISC_CFG_0_SKIP_WEIGHT_RLS_FIELD			_MK_FIELD_CONST(0x1, CSC_D_MISC_CFG_0_SKIP_WEIGHT_RLS_SHIFT)
+#define CSC_D_MISC_CFG_0_SKIP_WEIGHT_RLS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CSC_D_MISC_CFG_0_SKIP_WEIGHT_RLS_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CSC_D_DATAIN_FORMAT_0
+#define CSC_D_DATAIN_FORMAT_0			_MK_ADDR_CONST(0x4010)
+#define CSC_D_DATAIN_FORMAT_0_DATAIN_FORMAT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DATAIN_FORMAT_0_DATAIN_FORMAT_FIELD			_MK_FIELD_CONST(0x1, CSC_D_DATAIN_FORMAT_0_DATAIN_FORMAT_SHIFT)
+#define CSC_D_DATAIN_FORMAT_0_DATAIN_FORMAT_FEATURE			_MK_ENUM_CONST(0x0)
+#define CSC_D_DATAIN_FORMAT_0_DATAIN_FORMAT_PIXEL			_MK_ENUM_CONST(0x1)
+
+
+// Register CSC_D_DATAIN_SIZE_EXT_0_0
+#define CSC_D_DATAIN_SIZE_EXT_0_0			_MK_ADDR_CONST(0x4014)
+#define CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_WIDTH_EXT_SHIFT)
+#define CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAIN_SIZE_EXT_0_0_DATAIN_HEIGHT_EXT_SHIFT)
+
+
+// Register CSC_D_DATAIN_SIZE_EXT_1_0
+#define CSC_D_DATAIN_SIZE_EXT_1_0			_MK_ADDR_CONST(0x4018)
+#define CSC_D_DATAIN_SIZE_EXT_1_0_DATAIN_CHANNEL_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DATAIN_SIZE_EXT_1_0_DATAIN_CHANNEL_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAIN_SIZE_EXT_1_0_DATAIN_CHANNEL_EXT_SHIFT)
+
+
+// Register CSC_D_BATCH_NUMBER_0
+#define CSC_D_BATCH_NUMBER_0			_MK_ADDR_CONST(0x401c)
+#define CSC_D_BATCH_NUMBER_0_BATCHES_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_BATCH_NUMBER_0_BATCHES_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_BATCH_NUMBER_0_BATCHES_SHIFT)
+
+
+// Register CSC_D_POST_Y_EXTENSION_0
+#define CSC_D_POST_Y_EXTENSION_0			_MK_ADDR_CONST(0x4020)
+#define CSC_D_POST_Y_EXTENSION_0_Y_EXTENSION_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_POST_Y_EXTENSION_0_Y_EXTENSION_FIELD			_MK_FIELD_CONST(0x3, CSC_D_POST_Y_EXTENSION_0_Y_EXTENSION_SHIFT)
+
+
+// Register CSC_D_ENTRY_PER_SLICE_0
+#define CSC_D_ENTRY_PER_SLICE_0			_MK_ADDR_CONST(0x4024)
+#define CSC_D_ENTRY_PER_SLICE_0_ENTRIES_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_ENTRY_PER_SLICE_0_ENTRIES_FIELD			_MK_FIELD_CONST(0x3fff, CSC_D_ENTRY_PER_SLICE_0_ENTRIES_SHIFT)
+
+
+// Register CSC_D_WEIGHT_FORMAT_0
+#define CSC_D_WEIGHT_FORMAT_0			_MK_ADDR_CONST(0x4028)
+#define CSC_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_FIELD			_MK_FIELD_CONST(0x1, CSC_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_SHIFT)
+#define CSC_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_UNCOMPRESSED			_MK_ENUM_CONST(0x0)
+#define CSC_D_WEIGHT_FORMAT_0_WEIGHT_FORMAT_COMPRESSED			_MK_ENUM_CONST(0x1)
+
+
+// Register CSC_D_WEIGHT_SIZE_EXT_0_0
+#define CSC_D_WEIGHT_SIZE_EXT_0_0			_MK_ADDR_CONST(0x402c)
+#define CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_WIDTH_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_WIDTH_EXT_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_WIDTH_EXT_SHIFT)
+#define CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_HEIGHT_EXT_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_HEIGHT_EXT_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_WEIGHT_SIZE_EXT_0_0_WEIGHT_HEIGHT_EXT_SHIFT)
+
+
+// Register CSC_D_WEIGHT_SIZE_EXT_1_0
+#define CSC_D_WEIGHT_SIZE_EXT_1_0			_MK_ADDR_CONST(0x4030)
+#define CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_CHANNEL_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_CHANNEL_EXT_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_CHANNEL_EXT_SHIFT)
+#define CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_KERNEL_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_KERNEL_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_WEIGHT_SIZE_EXT_1_0_WEIGHT_KERNEL_SHIFT)
+
+
+// Register CSC_D_WEIGHT_BYTES_0
+#define CSC_D_WEIGHT_BYTES_0			_MK_ADDR_CONST(0x4034)
+#define CSC_D_WEIGHT_BYTES_0_WEIGHT_BYTES_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_WEIGHT_BYTES_0_WEIGHT_BYTES_FIELD			_MK_FIELD_CONST(0xffffffff, CSC_D_WEIGHT_BYTES_0_WEIGHT_BYTES_SHIFT)
+
+
+// Register CSC_D_WMB_BYTES_0
+#define CSC_D_WMB_BYTES_0			_MK_ADDR_CONST(0x4038)
+#define CSC_D_WMB_BYTES_0_WMB_BYTES_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_WMB_BYTES_0_WMB_BYTES_FIELD			_MK_FIELD_CONST(0xfffffff, CSC_D_WMB_BYTES_0_WMB_BYTES_SHIFT)
+
+
+// Register CSC_D_DATAOUT_SIZE_0_0
+#define CSC_D_DATAOUT_SIZE_0_0			_MK_ADDR_CONST(0x403c)
+#define CSC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_SHIFT)
+#define CSC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_SHIFT)
+
+
+// Register CSC_D_DATAOUT_SIZE_1_0
+#define CSC_D_DATAOUT_SIZE_1_0			_MK_ADDR_CONST(0x4040)
+#define CSC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, CSC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT)
+
+
+// Register CSC_D_ATOMICS_0
+#define CSC_D_ATOMICS_0			_MK_ADDR_CONST(0x4044)
+#define CSC_D_ATOMICS_0_ATOMICS_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_ATOMICS_0_ATOMICS_FIELD			_MK_FIELD_CONST(0x1fffff, CSC_D_ATOMICS_0_ATOMICS_SHIFT)
+
+
+// Register CSC_D_RELEASE_0
+#define CSC_D_RELEASE_0			_MK_ADDR_CONST(0x4048)
+#define CSC_D_RELEASE_0_RLS_SLICES_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_RELEASE_0_RLS_SLICES_FIELD			_MK_FIELD_CONST(0xfff, CSC_D_RELEASE_0_RLS_SLICES_SHIFT)
+
+
+// Register CSC_D_CONV_STRIDE_EXT_0
+#define CSC_D_CONV_STRIDE_EXT_0			_MK_ADDR_CONST(0x404c)
+#define CSC_D_CONV_STRIDE_EXT_0_CONV_X_STRIDE_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_CONV_STRIDE_EXT_0_CONV_X_STRIDE_EXT_FIELD			_MK_FIELD_CONST(0x7, CSC_D_CONV_STRIDE_EXT_0_CONV_X_STRIDE_EXT_SHIFT)
+#define CSC_D_CONV_STRIDE_EXT_0_CONV_Y_STRIDE_EXT_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_CONV_STRIDE_EXT_0_CONV_Y_STRIDE_EXT_FIELD			_MK_FIELD_CONST(0x7, CSC_D_CONV_STRIDE_EXT_0_CONV_Y_STRIDE_EXT_SHIFT)
+
+
+// Register CSC_D_DILATION_EXT_0
+#define CSC_D_DILATION_EXT_0			_MK_ADDR_CONST(0x4050)
+#define CSC_D_DILATION_EXT_0_X_DILATION_EXT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_DILATION_EXT_0_X_DILATION_EXT_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_DILATION_EXT_0_X_DILATION_EXT_SHIFT)
+#define CSC_D_DILATION_EXT_0_Y_DILATION_EXT_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_DILATION_EXT_0_Y_DILATION_EXT_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_DILATION_EXT_0_Y_DILATION_EXT_SHIFT)
+
+
+// Register CSC_D_ZERO_PADDING_0
+#define CSC_D_ZERO_PADDING_0			_MK_ADDR_CONST(0x4054)
+#define CSC_D_ZERO_PADDING_0_PAD_LEFT_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_ZERO_PADDING_0_PAD_LEFT_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_ZERO_PADDING_0_PAD_LEFT_SHIFT)
+#define CSC_D_ZERO_PADDING_0_PAD_TOP_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_ZERO_PADDING_0_PAD_TOP_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_ZERO_PADDING_0_PAD_TOP_SHIFT)
+
+
+// Register CSC_D_ZERO_PADDING_VALUE_0
+#define CSC_D_ZERO_PADDING_VALUE_0			_MK_ADDR_CONST(0x4058)
+#define CSC_D_ZERO_PADDING_VALUE_0_PAD_VALUE_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_ZERO_PADDING_VALUE_0_PAD_VALUE_FIELD			_MK_FIELD_CONST(0xffff, CSC_D_ZERO_PADDING_VALUE_0_PAD_VALUE_SHIFT)
+
+
+// Register CSC_D_BANK_0
+#define CSC_D_BANK_0			_MK_ADDR_CONST(0x405c)
+#define CSC_D_BANK_0_DATA_BANK_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_BANK_0_DATA_BANK_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_BANK_0_DATA_BANK_SHIFT)
+#define CSC_D_BANK_0_WEIGHT_BANK_SHIFT			_MK_SHIFT_CONST(16)
+#define CSC_D_BANK_0_WEIGHT_BANK_FIELD			_MK_FIELD_CONST(0x1f, CSC_D_BANK_0_WEIGHT_BANK_SHIFT)
+
+
+// Register CSC_D_PRA_CFG_0
+#define CSC_D_PRA_CFG_0			_MK_ADDR_CONST(0x4060)
+#define CSC_D_PRA_CFG_0_PRA_TRUNCATE_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_PRA_CFG_0_PRA_TRUNCATE_FIELD			_MK_FIELD_CONST(0x3, CSC_D_PRA_CFG_0_PRA_TRUNCATE_SHIFT)
+
+
+// Register CSC_D_CYA_0
+#define CSC_D_CYA_0			_MK_ADDR_CONST(0x4064)
+#define CSC_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define CSC_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, CSC_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CMAC_A_S_STATUS_0
+#define CMAC_A_S_STATUS_0			_MK_ADDR_CONST(0x5000)
+#define CMAC_A_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_A_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CMAC_A_S_STATUS_0_STATUS_0_SHIFT)
+#define CMAC_A_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CMAC_A_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CMAC_A_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CMAC_A_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CMAC_A_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CMAC_A_S_STATUS_0_STATUS_1_SHIFT)
+#define CMAC_A_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CMAC_A_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CMAC_A_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CMAC_A_S_POINTER_0
+#define CMAC_A_S_POINTER_0			_MK_ADDR_CONST(0x5004)
+#define CMAC_A_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_A_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CMAC_A_S_POINTER_0_PRODUCER_SHIFT)
+#define CMAC_A_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CMAC_A_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CMAC_A_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CMAC_A_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CMAC_A_S_POINTER_0_CONSUMER_SHIFT)
+#define CMAC_A_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CMAC_A_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CMAC_A_D_OP_ENABLE_0
+#define CMAC_A_D_OP_ENABLE_0			_MK_ADDR_CONST(0x5008)
+#define CMAC_A_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_A_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CMAC_A_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CMAC_A_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CMAC_A_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CMAC_A_D_MISC_CFG_0
+#define CMAC_A_D_MISC_CFG_0			_MK_ADDR_CONST(0x500c)
+#define CMAC_A_D_MISC_CFG_0_CONV_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_A_D_MISC_CFG_0_CONV_MODE_FIELD			_MK_FIELD_CONST(0x1, CMAC_A_D_MISC_CFG_0_CONV_MODE_SHIFT)
+#define CMAC_A_D_MISC_CFG_0_CONV_MODE_DIRECT			_MK_ENUM_CONST(0x0)
+#define CMAC_A_D_MISC_CFG_0_CONV_MODE_WINOGRAD			_MK_ENUM_CONST(0x1)
+#define CMAC_A_D_MISC_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(12)
+#define CMAC_A_D_MISC_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CMAC_A_D_MISC_CFG_0_PROC_PRECISION_SHIFT)
+#define CMAC_A_D_MISC_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CMAC_A_D_MISC_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CMAC_A_D_MISC_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CMAC_B_S_STATUS_0
+#define CMAC_B_S_STATUS_0			_MK_ADDR_CONST(0x6000)
+#define CMAC_B_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_B_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CMAC_B_S_STATUS_0_STATUS_0_SHIFT)
+#define CMAC_B_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CMAC_B_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CMAC_B_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CMAC_B_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CMAC_B_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CMAC_B_S_STATUS_0_STATUS_1_SHIFT)
+#define CMAC_B_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CMAC_B_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CMAC_B_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CMAC_B_S_POINTER_0
+#define CMAC_B_S_POINTER_0			_MK_ADDR_CONST(0x6004)
+#define CMAC_B_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_B_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CMAC_B_S_POINTER_0_PRODUCER_SHIFT)
+#define CMAC_B_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CMAC_B_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CMAC_B_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CMAC_B_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CMAC_B_S_POINTER_0_CONSUMER_SHIFT)
+#define CMAC_B_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CMAC_B_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CMAC_B_D_OP_ENABLE_0
+#define CMAC_B_D_OP_ENABLE_0			_MK_ADDR_CONST(0x6008)
+#define CMAC_B_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_B_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CMAC_B_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CMAC_B_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CMAC_B_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CMAC_B_D_MISC_CFG_0
+#define CMAC_B_D_MISC_CFG_0			_MK_ADDR_CONST(0x600c)
+#define CMAC_B_D_MISC_CFG_0_CONV_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CMAC_B_D_MISC_CFG_0_CONV_MODE_FIELD			_MK_FIELD_CONST(0x1, CMAC_B_D_MISC_CFG_0_CONV_MODE_SHIFT)
+#define CMAC_B_D_MISC_CFG_0_CONV_MODE_DIRECT			_MK_ENUM_CONST(0x0)
+#define CMAC_B_D_MISC_CFG_0_CONV_MODE_WINOGRAD			_MK_ENUM_CONST(0x1)
+#define CMAC_B_D_MISC_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(12)
+#define CMAC_B_D_MISC_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CMAC_B_D_MISC_CFG_0_PROC_PRECISION_SHIFT)
+#define CMAC_B_D_MISC_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CMAC_B_D_MISC_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CMAC_B_D_MISC_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CACC_S_STATUS_0
+#define CACC_S_STATUS_0			_MK_ADDR_CONST(0x7000)
+#define CACC_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CACC_S_STATUS_0_STATUS_0_SHIFT)
+#define CACC_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CACC_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CACC_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CACC_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CACC_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CACC_S_STATUS_0_STATUS_1_SHIFT)
+#define CACC_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CACC_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CACC_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CACC_S_POINTER_0
+#define CACC_S_POINTER_0			_MK_ADDR_CONST(0x7004)
+#define CACC_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CACC_S_POINTER_0_PRODUCER_SHIFT)
+#define CACC_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CACC_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CACC_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CACC_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CACC_S_POINTER_0_CONSUMER_SHIFT)
+#define CACC_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CACC_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CACC_D_OP_ENABLE_0
+#define CACC_D_OP_ENABLE_0			_MK_ADDR_CONST(0x7008)
+#define CACC_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CACC_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CACC_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CACC_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CACC_D_MISC_CFG_0
+#define CACC_D_MISC_CFG_0			_MK_ADDR_CONST(0x700c)
+#define CACC_D_MISC_CFG_0_CONV_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_MISC_CFG_0_CONV_MODE_FIELD			_MK_FIELD_CONST(0x1, CACC_D_MISC_CFG_0_CONV_MODE_SHIFT)
+#define CACC_D_MISC_CFG_0_CONV_MODE_DIRECT			_MK_ENUM_CONST(0x0)
+#define CACC_D_MISC_CFG_0_CONV_MODE_WINOGRAD			_MK_ENUM_CONST(0x1)
+#define CACC_D_MISC_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(12)
+#define CACC_D_MISC_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, CACC_D_MISC_CFG_0_PROC_PRECISION_SHIFT)
+#define CACC_D_MISC_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define CACC_D_MISC_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define CACC_D_MISC_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register CACC_D_DATAOUT_SIZE_0_0
+#define CACC_D_DATAOUT_SIZE_0_0			_MK_ADDR_CONST(0x7010)
+#define CACC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, CACC_D_DATAOUT_SIZE_0_0_DATAOUT_WIDTH_SHIFT)
+#define CACC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_SHIFT			_MK_SHIFT_CONST(16)
+#define CACC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, CACC_D_DATAOUT_SIZE_0_0_DATAOUT_HEIGHT_SHIFT)
+
+
+// Register CACC_D_DATAOUT_SIZE_1_0
+#define CACC_D_DATAOUT_SIZE_1_0			_MK_ADDR_CONST(0x7014)
+#define CACC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, CACC_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT)
+
+
+// Register CACC_D_DATAOUT_ADDR_0
+#define CACC_D_DATAOUT_ADDR_0			_MK_ADDR_CONST(0x7018)
+#define CACC_D_DATAOUT_ADDR_0_DATAOUT_ADDR_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_DATAOUT_ADDR_0_DATAOUT_ADDR_FIELD			_MK_FIELD_CONST(0xffffffff, CACC_D_DATAOUT_ADDR_0_DATAOUT_ADDR_SHIFT)
+
+
+// Register CACC_D_BATCH_NUMBER_0
+#define CACC_D_BATCH_NUMBER_0			_MK_ADDR_CONST(0x701c)
+#define CACC_D_BATCH_NUMBER_0_BATCHES_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_BATCH_NUMBER_0_BATCHES_FIELD			_MK_FIELD_CONST(0x1f, CACC_D_BATCH_NUMBER_0_BATCHES_SHIFT)
+
+
+// Register CACC_D_LINE_STRIDE_0
+#define CACC_D_LINE_STRIDE_0			_MK_ADDR_CONST(0x7020)
+#define CACC_D_LINE_STRIDE_0_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_LINE_STRIDE_0_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffff, CACC_D_LINE_STRIDE_0_LINE_STRIDE_SHIFT)
+
+
+// Register CACC_D_SURF_STRIDE_0
+#define CACC_D_SURF_STRIDE_0			_MK_ADDR_CONST(0x7024)
+#define CACC_D_SURF_STRIDE_0_SURF_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_SURF_STRIDE_0_SURF_STRIDE_FIELD			_MK_FIELD_CONST(0xffffff, CACC_D_SURF_STRIDE_0_SURF_STRIDE_SHIFT)
+
+
+// Register CACC_D_DATAOUT_MAP_0
+#define CACC_D_DATAOUT_MAP_0			_MK_ADDR_CONST(0x7028)
+#define CACC_D_DATAOUT_MAP_0_LINE_PACKED_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_DATAOUT_MAP_0_LINE_PACKED_FIELD			_MK_FIELD_CONST(0x1, CACC_D_DATAOUT_MAP_0_LINE_PACKED_SHIFT)
+#define CACC_D_DATAOUT_MAP_0_LINE_PACKED_FALSE			_MK_ENUM_CONST(0x0)
+#define CACC_D_DATAOUT_MAP_0_LINE_PACKED_TRUE			_MK_ENUM_CONST(0x1)
+#define CACC_D_DATAOUT_MAP_0_SURF_PACKED_SHIFT			_MK_SHIFT_CONST(16)
+#define CACC_D_DATAOUT_MAP_0_SURF_PACKED_FIELD			_MK_FIELD_CONST(0x1, CACC_D_DATAOUT_MAP_0_SURF_PACKED_SHIFT)
+#define CACC_D_DATAOUT_MAP_0_SURF_PACKED_FALSE			_MK_ENUM_CONST(0x0)
+#define CACC_D_DATAOUT_MAP_0_SURF_PACKED_TRUE			_MK_ENUM_CONST(0x1)
+
+
+// Register CACC_D_CLIP_CFG_0
+#define CACC_D_CLIP_CFG_0			_MK_ADDR_CONST(0x702c)
+#define CACC_D_CLIP_CFG_0_CLIP_TRUNCATE_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_CLIP_CFG_0_CLIP_TRUNCATE_FIELD			_MK_FIELD_CONST(0x1f, CACC_D_CLIP_CFG_0_CLIP_TRUNCATE_SHIFT)
+
+
+// Register CACC_D_OUT_SATURATION_0
+#define CACC_D_OUT_SATURATION_0			_MK_ADDR_CONST(0x7030)
+#define CACC_D_OUT_SATURATION_0_SAT_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_OUT_SATURATION_0_SAT_COUNT_FIELD			_MK_FIELD_CONST(0xffffffff, CACC_D_OUT_SATURATION_0_SAT_COUNT_SHIFT)
+
+
+// Register CACC_D_CYA_0
+#define CACC_D_CYA_0			_MK_ADDR_CONST(0x7034)
+#define CACC_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define CACC_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, CACC_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register SDP_RDMA_S_STATUS_0
+#define SDP_RDMA_S_STATUS_0			_MK_ADDR_CONST(0x8000)
+#define SDP_RDMA_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_S_STATUS_0_STATUS_0_SHIFT)
+#define SDP_RDMA_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_RDMA_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_S_STATUS_0_STATUS_1_SHIFT)
+#define SDP_RDMA_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register SDP_RDMA_S_POINTER_0
+#define SDP_RDMA_S_POINTER_0			_MK_ADDR_CONST(0x8004)
+#define SDP_RDMA_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_S_POINTER_0_PRODUCER_SHIFT)
+#define SDP_RDMA_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_RDMA_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_S_POINTER_0_CONSUMER_SHIFT)
+#define SDP_RDMA_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_OP_ENABLE_0
+#define SDP_RDMA_D_OP_ENABLE_0			_MK_ADDR_CONST(0x8008)
+#define SDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define SDP_RDMA_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_DATA_CUBE_WIDTH_0
+#define SDP_RDMA_D_DATA_CUBE_WIDTH_0			_MK_ADDR_CONST(0x800c)
+#define SDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, SDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT)
+
+
+// Register SDP_RDMA_D_DATA_CUBE_HEIGHT_0
+#define SDP_RDMA_D_DATA_CUBE_HEIGHT_0			_MK_ADDR_CONST(0x8010)
+#define SDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, SDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT)
+
+
+// Register SDP_RDMA_D_DATA_CUBE_CHANNEL_0
+#define SDP_RDMA_D_DATA_CUBE_CHANNEL_0			_MK_ADDR_CONST(0x8014)
+#define SDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, SDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT)
+
+
+// Register SDP_RDMA_D_SRC_BASE_ADDR_LOW_0
+#define SDP_RDMA_D_SRC_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0x8018)
+#define SDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT)
+
+
+// Register SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
+#define SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0x801c)
+#define SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register SDP_RDMA_D_SRC_LINE_STRIDE_0
+#define SDP_RDMA_D_SRC_LINE_STRIDE_0			_MK_ADDR_CONST(0x8020)
+#define SDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_SRC_SURFACE_STRIDE_0
+#define SDP_RDMA_D_SRC_SURFACE_STRIDE_0			_MK_ADDR_CONST(0x8024)
+#define SDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_BRDMA_CFG_0
+#define SDP_RDMA_D_BRDMA_CFG_0			_MK_ADDR_CONST(0x8028)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DISABLE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DISABLE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DISABLE_SHIFT)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DISABLE_NO			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DISABLE_YES			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_SHIFT)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_MUL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_ALU			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_USE_BOTH			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_SIZE_SHIFT			_MK_SHIFT_CONST(3)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_SIZE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_SIZE_SHIFT)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_SIZE_ONE_BYTE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_SIZE_TWO_BYTE			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_MODE_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_MODE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_MODE_SHIFT)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_MODE_PER_KERNEL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_DATA_MODE_PER_ELEMENT			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_BRDMA_CFG_0_BRDMA_RAM_TYPE_SHIFT)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_BRDMA_CFG_0_BRDMA_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_BS_BASE_ADDR_LOW_0
+#define SDP_RDMA_D_BS_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0x802c)
+#define SDP_RDMA_D_BS_BASE_ADDR_LOW_0_BS_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BS_BASE_ADDR_LOW_0_BS_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BS_BASE_ADDR_LOW_0_BS_BASE_ADDR_LOW_SHIFT)
+
+
+// Register SDP_RDMA_D_BS_BASE_ADDR_HIGH_0
+#define SDP_RDMA_D_BS_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0x8030)
+#define SDP_RDMA_D_BS_BASE_ADDR_HIGH_0_BS_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BS_BASE_ADDR_HIGH_0_BS_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BS_BASE_ADDR_HIGH_0_BS_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register SDP_RDMA_D_BS_LINE_STRIDE_0
+#define SDP_RDMA_D_BS_LINE_STRIDE_0			_MK_ADDR_CONST(0x8034)
+#define SDP_RDMA_D_BS_LINE_STRIDE_0_BS_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BS_LINE_STRIDE_0_BS_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BS_LINE_STRIDE_0_BS_LINE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_BS_SURFACE_STRIDE_0
+#define SDP_RDMA_D_BS_SURFACE_STRIDE_0			_MK_ADDR_CONST(0x8038)
+#define SDP_RDMA_D_BS_SURFACE_STRIDE_0_BS_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BS_SURFACE_STRIDE_0_BS_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BS_SURFACE_STRIDE_0_BS_SURFACE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_BS_BATCH_STRIDE_0
+#define SDP_RDMA_D_BS_BATCH_STRIDE_0			_MK_ADDR_CONST(0x803c)
+#define SDP_RDMA_D_BS_BATCH_STRIDE_0_BS_BATCH_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BS_BATCH_STRIDE_0_BS_BATCH_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BS_BATCH_STRIDE_0_BS_BATCH_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_NRDMA_CFG_0
+#define SDP_RDMA_D_NRDMA_CFG_0			_MK_ADDR_CONST(0x8040)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DISABLE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DISABLE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DISABLE_SHIFT)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DISABLE_NO			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DISABLE_YES			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_SHIFT)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_MUL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_ALU			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_USE_BOTH			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_SIZE_SHIFT			_MK_SHIFT_CONST(3)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_SIZE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_SIZE_SHIFT)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_SIZE_ONE_BYTE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_SIZE_TWO_BYTE			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_MODE_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_MODE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_MODE_SHIFT)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_MODE_PER_KERNEL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_DATA_MODE_PER_ELEMENT			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_NRDMA_CFG_0_NRDMA_RAM_TYPE_SHIFT)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_NRDMA_CFG_0_NRDMA_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_BN_BASE_ADDR_LOW_0
+#define SDP_RDMA_D_BN_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0x8044)
+#define SDP_RDMA_D_BN_BASE_ADDR_LOW_0_BN_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BN_BASE_ADDR_LOW_0_BN_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BN_BASE_ADDR_LOW_0_BN_BASE_ADDR_LOW_SHIFT)
+
+
+// Register SDP_RDMA_D_BN_BASE_ADDR_HIGH_0
+#define SDP_RDMA_D_BN_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0x8048)
+#define SDP_RDMA_D_BN_BASE_ADDR_HIGH_0_BN_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BN_BASE_ADDR_HIGH_0_BN_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BN_BASE_ADDR_HIGH_0_BN_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register SDP_RDMA_D_BN_LINE_STRIDE_0
+#define SDP_RDMA_D_BN_LINE_STRIDE_0			_MK_ADDR_CONST(0x804c)
+#define SDP_RDMA_D_BN_LINE_STRIDE_0_BN_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BN_LINE_STRIDE_0_BN_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BN_LINE_STRIDE_0_BN_LINE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_BN_SURFACE_STRIDE_0
+#define SDP_RDMA_D_BN_SURFACE_STRIDE_0			_MK_ADDR_CONST(0x8050)
+#define SDP_RDMA_D_BN_SURFACE_STRIDE_0_BN_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BN_SURFACE_STRIDE_0_BN_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BN_SURFACE_STRIDE_0_BN_SURFACE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_BN_BATCH_STRIDE_0
+#define SDP_RDMA_D_BN_BATCH_STRIDE_0			_MK_ADDR_CONST(0x8054)
+#define SDP_RDMA_D_BN_BATCH_STRIDE_0_BN_BATCH_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_BN_BATCH_STRIDE_0_BN_BATCH_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_BN_BATCH_STRIDE_0_BN_BATCH_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_ERDMA_CFG_0
+#define SDP_RDMA_D_ERDMA_CFG_0			_MK_ADDR_CONST(0x8058)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DISABLE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DISABLE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DISABLE_SHIFT)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DISABLE_NO			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DISABLE_YES			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_SHIFT)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_MUL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_ALU			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_USE_BOTH			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_SIZE_SHIFT			_MK_SHIFT_CONST(3)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_SIZE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_SIZE_SHIFT)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_SIZE_ONE_BYTE			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_SIZE_TWO_BYTE			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_MODE_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_MODE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_MODE_SHIFT)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_MODE_PER_KERNEL			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_DATA_MODE_PER_ELEMENT			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_ERDMA_CFG_0_ERDMA_RAM_TYPE_SHIFT)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_ERDMA_CFG_0_ERDMA_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_EW_BASE_ADDR_LOW_0
+#define SDP_RDMA_D_EW_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0x805c)
+#define SDP_RDMA_D_EW_BASE_ADDR_LOW_0_EW_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_EW_BASE_ADDR_LOW_0_EW_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_EW_BASE_ADDR_LOW_0_EW_BASE_ADDR_LOW_SHIFT)
+
+
+// Register SDP_RDMA_D_EW_BASE_ADDR_HIGH_0
+#define SDP_RDMA_D_EW_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0x8060)
+#define SDP_RDMA_D_EW_BASE_ADDR_HIGH_0_EW_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_EW_BASE_ADDR_HIGH_0_EW_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_EW_BASE_ADDR_HIGH_0_EW_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register SDP_RDMA_D_EW_LINE_STRIDE_0
+#define SDP_RDMA_D_EW_LINE_STRIDE_0			_MK_ADDR_CONST(0x8064)
+#define SDP_RDMA_D_EW_LINE_STRIDE_0_EW_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_EW_LINE_STRIDE_0_EW_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_EW_LINE_STRIDE_0_EW_LINE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_EW_SURFACE_STRIDE_0
+#define SDP_RDMA_D_EW_SURFACE_STRIDE_0			_MK_ADDR_CONST(0x8068)
+#define SDP_RDMA_D_EW_SURFACE_STRIDE_0_EW_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_EW_SURFACE_STRIDE_0_EW_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_EW_SURFACE_STRIDE_0_EW_SURFACE_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_EW_BATCH_STRIDE_0
+#define SDP_RDMA_D_EW_BATCH_STRIDE_0			_MK_ADDR_CONST(0x806c)
+#define SDP_RDMA_D_EW_BATCH_STRIDE_0_EW_BATCH_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_EW_BATCH_STRIDE_0_EW_BATCH_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_EW_BATCH_STRIDE_0_EW_BATCH_STRIDE_SHIFT)
+
+
+// Register SDP_RDMA_D_FEATURE_MODE_CFG_0
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0			_MK_ADDR_CONST(0x8070)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_FLYING_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_FLYING_MODE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_FEATURE_MODE_CFG_0_FLYING_MODE_SHIFT)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_FLYING_MODE_OFF			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_FLYING_MODE_ON			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_WINOGRAD_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_WINOGRAD_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_FEATURE_MODE_CFG_0_WINOGRAD_SHIFT)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_WINOGRAD_OFF			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_WINOGRAD_ON			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_SHIFT)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_IN_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_SHIFT)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_SHIFT			_MK_SHIFT_CONST(6)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_FIELD			_MK_FIELD_CONST(0x3, SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_SHIFT)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_OUT_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_RDMA_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_FIELD			_MK_FIELD_CONST(0x1f, SDP_RDMA_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_SHIFT)
+
+
+// Register SDP_RDMA_D_SRC_DMA_CFG_0
+#define SDP_RDMA_D_SRC_DMA_CFG_0			_MK_ADDR_CONST(0x8074)
+#define SDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_SHIFT)
+#define SDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0
+#define SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0			_MK_ADDR_CONST(0x8078)
+#define SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_SHIFT)
+
+
+// Register SDP_RDMA_D_STATUS_INF_INPUT_NUM_0
+#define SDP_RDMA_D_STATUS_INF_INPUT_NUM_0			_MK_ADDR_CONST(0x807c)
+#define SDP_RDMA_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_SHIFT)
+
+
+// Register SDP_RDMA_D_PERF_ENABLE_0
+#define SDP_RDMA_D_PERF_ENABLE_0			_MK_ADDR_CONST(0x8080)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_PERF_ENABLE_0_PERF_DMA_EN_SHIFT)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_DMA_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_DMA_EN_YES			_MK_ENUM_CONST(0x1)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_RDMA_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_SHIFT)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_RDMA_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_RDMA_D_PERF_MRDMA_READ_STALL_0
+#define SDP_RDMA_D_PERF_MRDMA_READ_STALL_0			_MK_ADDR_CONST(0x8084)
+#define SDP_RDMA_D_PERF_MRDMA_READ_STALL_0_MRDMA_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_PERF_MRDMA_READ_STALL_0_MRDMA_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_PERF_MRDMA_READ_STALL_0_MRDMA_STALL_SHIFT)
+
+
+// Register SDP_RDMA_D_PERF_BRDMA_READ_STALL_0
+#define SDP_RDMA_D_PERF_BRDMA_READ_STALL_0			_MK_ADDR_CONST(0x8088)
+#define SDP_RDMA_D_PERF_BRDMA_READ_STALL_0_BRDMA_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_PERF_BRDMA_READ_STALL_0_BRDMA_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_PERF_BRDMA_READ_STALL_0_BRDMA_STALL_SHIFT)
+
+
+// Register SDP_RDMA_D_PERF_NRDMA_READ_STALL_0
+#define SDP_RDMA_D_PERF_NRDMA_READ_STALL_0			_MK_ADDR_CONST(0x808c)
+#define SDP_RDMA_D_PERF_NRDMA_READ_STALL_0_NRDMA_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_PERF_NRDMA_READ_STALL_0_NRDMA_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_PERF_NRDMA_READ_STALL_0_NRDMA_STALL_SHIFT)
+
+
+// Register SDP_RDMA_D_PERF_ERDMA_READ_STALL_0
+#define SDP_RDMA_D_PERF_ERDMA_READ_STALL_0			_MK_ADDR_CONST(0x8090)
+#define SDP_RDMA_D_PERF_ERDMA_READ_STALL_0_ERDMA_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_RDMA_D_PERF_ERDMA_READ_STALL_0_ERDMA_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_RDMA_D_PERF_ERDMA_READ_STALL_0_ERDMA_STALL_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register SDP_S_STATUS_0
+#define SDP_S_STATUS_0			_MK_ADDR_CONST(0x9000)
+#define SDP_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, SDP_S_STATUS_0_STATUS_0_SHIFT)
+#define SDP_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define SDP_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define SDP_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define SDP_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, SDP_S_STATUS_0_STATUS_1_SHIFT)
+#define SDP_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define SDP_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define SDP_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register SDP_S_POINTER_0
+#define SDP_S_POINTER_0			_MK_ADDR_CONST(0x9004)
+#define SDP_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, SDP_S_POINTER_0_PRODUCER_SHIFT)
+#define SDP_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define SDP_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define SDP_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, SDP_S_POINTER_0_CONSUMER_SHIFT)
+#define SDP_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define SDP_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_S_LUT_ACCESS_CFG_0
+#define SDP_S_LUT_ACCESS_CFG_0			_MK_ADDR_CONST(0x9008)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_FIELD			_MK_FIELD_CONST(0x3ff, SDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_SHIFT)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_SHIFT)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_LE			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_LO			_MK_ENUM_CONST(0x1)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_SHIFT			_MK_SHIFT_CONST(17)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_SHIFT)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_READ			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_WRITE			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_S_LUT_ACCESS_DATA_0
+#define SDP_S_LUT_ACCESS_DATA_0			_MK_ADDR_CONST(0x900c)
+#define SDP_S_LUT_ACCESS_DATA_0_LUT_DATA_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_ACCESS_DATA_0_LUT_DATA_FIELD			_MK_FIELD_CONST(0xffff, SDP_S_LUT_ACCESS_DATA_0_LUT_DATA_SHIFT)
+
+
+// Register SDP_S_LUT_CFG_0
+#define SDP_S_LUT_CFG_0			_MK_ADDR_CONST(0x9010)
+#define SDP_S_LUT_CFG_0_LUT_LE_FUNCTION_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_CFG_0_LUT_LE_FUNCTION_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_CFG_0_LUT_LE_FUNCTION_SHIFT)
+#define SDP_S_LUT_CFG_0_LUT_LE_FUNCTION_EXPONENT			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_CFG_0_LUT_LE_FUNCTION_LINEAR			_MK_ENUM_CONST(0x1)
+#define SDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_SHIFT)
+#define SDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+#define SDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_SHIFT)
+#define SDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+#define SDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_SHIFT			_MK_SHIFT_CONST(6)
+#define SDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, SDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_SHIFT)
+#define SDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define SDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_S_LUT_INFO_0
+#define SDP_S_LUT_INFO_0			_MK_ADDR_CONST(0x9014)
+#define SDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_FIELD			_MK_FIELD_CONST(0xff, SDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_SHIFT)
+#define SDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_FIELD			_MK_FIELD_CONST(0xff, SDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_SHIFT)
+#define SDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_FIELD			_MK_FIELD_CONST(0xff, SDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_SHIFT)
+
+
+// Register SDP_S_LUT_LE_START_0
+#define SDP_S_LUT_LE_START_0			_MK_ADDR_CONST(0x9018)
+#define SDP_S_LUT_LE_START_0_LUT_LE_START_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LE_START_0_LUT_LE_START_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_S_LUT_LE_START_0_LUT_LE_START_SHIFT)
+
+
+// Register SDP_S_LUT_LE_END_0
+#define SDP_S_LUT_LE_END_0			_MK_ADDR_CONST(0x901c)
+#define SDP_S_LUT_LE_END_0_LUT_LE_END_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LE_END_0_LUT_LE_END_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_S_LUT_LE_END_0_LUT_LE_END_SHIFT)
+
+
+// Register SDP_S_LUT_LO_START_0
+#define SDP_S_LUT_LO_START_0			_MK_ADDR_CONST(0x9020)
+#define SDP_S_LUT_LO_START_0_LUT_LO_START_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LO_START_0_LUT_LO_START_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_S_LUT_LO_START_0_LUT_LO_START_SHIFT)
+
+
+// Register SDP_S_LUT_LO_END_0
+#define SDP_S_LUT_LO_END_0			_MK_ADDR_CONST(0x9024)
+#define SDP_S_LUT_LO_END_0_LUT_LO_END_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LO_END_0_LUT_LO_END_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_S_LUT_LO_END_0_LUT_LO_END_SHIFT)
+
+
+// Register SDP_S_LUT_LE_SLOPE_SCALE_0
+#define SDP_S_LUT_LE_SLOPE_SCALE_0			_MK_ADDR_CONST(0x9028)
+#define SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_SHIFT)
+#define SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_SHIFT)
+
+
+// Register SDP_S_LUT_LE_SLOPE_SHIFT_0
+#define SDP_S_LUT_LE_SLOPE_SHIFT_0			_MK_ADDR_CONST(0x902c)
+#define SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_SHIFT)
+#define SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, SDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_SHIFT)
+
+
+// Register SDP_S_LUT_LO_SLOPE_SCALE_0
+#define SDP_S_LUT_LO_SLOPE_SCALE_0			_MK_ADDR_CONST(0x9030)
+#define SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_SHIFT)
+#define SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(16)
+#define SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_SHIFT)
+
+
+// Register SDP_S_LUT_LO_SLOPE_SHIFT_0
+#define SDP_S_LUT_LO_SLOPE_SHIFT_0			_MK_ADDR_CONST(0x9034)
+#define SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_SHIFT)
+#define SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, SDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_SHIFT)
+
+
+// Register SDP_D_OP_ENABLE_0
+#define SDP_D_OP_ENABLE_0			_MK_ADDR_CONST(0x9038)
+#define SDP_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define SDP_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define SDP_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DATA_CUBE_WIDTH_0
+#define SDP_D_DATA_CUBE_WIDTH_0			_MK_ADDR_CONST(0x903c)
+#define SDP_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DATA_CUBE_WIDTH_0_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, SDP_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT)
+
+
+// Register SDP_D_DATA_CUBE_HEIGHT_0
+#define SDP_D_DATA_CUBE_HEIGHT_0			_MK_ADDR_CONST(0x9040)
+#define SDP_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DATA_CUBE_HEIGHT_0_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, SDP_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT)
+
+
+// Register SDP_D_DATA_CUBE_CHANNEL_0
+#define SDP_D_DATA_CUBE_CHANNEL_0			_MK_ADDR_CONST(0x9044)
+#define SDP_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DATA_CUBE_CHANNEL_0_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, SDP_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT)
+
+
+// Register SDP_D_DST_BASE_ADDR_LOW_0
+#define SDP_D_DST_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0x9048)
+#define SDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT)
+
+
+// Register SDP_D_DST_BASE_ADDR_HIGH_0
+#define SDP_D_DST_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0x904c)
+#define SDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register SDP_D_DST_LINE_STRIDE_0
+#define SDP_D_DST_LINE_STRIDE_0			_MK_ADDR_CONST(0x9050)
+#define SDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT)
+
+
+// Register SDP_D_DST_SURFACE_STRIDE_0
+#define SDP_D_DST_SURFACE_STRIDE_0			_MK_ADDR_CONST(0x9054)
+#define SDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT)
+
+
+// Register SDP_D_DP_BS_CFG_0
+#define SDP_D_DP_BS_CFG_0			_MK_ADDR_CONST(0x9058)
+#define SDP_D_DP_BS_CFG_0_BS_BYPASS_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BS_CFG_0_BS_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_CFG_0_BS_BYPASS_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_CFG_0_BS_ALU_BYPASS_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_FIELD			_MK_FIELD_CONST(0x3, SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_MAX			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_MIN			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_CFG_0_BS_ALU_ALGO_SUM			_MK_ENUM_CONST(0x2)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_BYPASS_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_CFG_0_BS_MUL_BYPASS_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_PRELU_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_PRELU_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_CFG_0_BS_MUL_PRELU_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_PRELU_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_MUL_PRELU_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_CFG_0_BS_RELU_BYPASS_SHIFT			_MK_SHIFT_CONST(6)
+#define SDP_D_DP_BS_CFG_0_BS_RELU_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_CFG_0_BS_RELU_BYPASS_SHIFT)
+#define SDP_D_DP_BS_CFG_0_BS_RELU_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_CFG_0_BS_RELU_BYPASS_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DP_BS_ALU_CFG_0
+#define SDP_D_DP_BS_ALU_CFG_0			_MK_ADDR_CONST(0x905c)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SRC_SHIFT)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SHIFT_VALUE_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SHIFT_VALUE_FIELD			_MK_FIELD_CONST(0x3f, SDP_D_DP_BS_ALU_CFG_0_BS_ALU_SHIFT_VALUE_SHIFT)
+
+
+// Register SDP_D_DP_BS_ALU_SRC_VALUE_0
+#define SDP_D_DP_BS_ALU_SRC_VALUE_0			_MK_ADDR_CONST(0x9060)
+#define SDP_D_DP_BS_ALU_SRC_VALUE_0_BS_ALU_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BS_ALU_SRC_VALUE_0_BS_ALU_OPERAND_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_BS_ALU_SRC_VALUE_0_BS_ALU_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_BS_MUL_CFG_0
+#define SDP_D_DP_BS_MUL_CFG_0			_MK_ADDR_CONST(0x9064)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SRC_SHIFT)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SHIFT_VALUE_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SHIFT_VALUE_FIELD			_MK_FIELD_CONST(0xff, SDP_D_DP_BS_MUL_CFG_0_BS_MUL_SHIFT_VALUE_SHIFT)
+
+
+// Register SDP_D_DP_BS_MUL_SRC_VALUE_0
+#define SDP_D_DP_BS_MUL_SRC_VALUE_0			_MK_ADDR_CONST(0x9068)
+#define SDP_D_DP_BS_MUL_SRC_VALUE_0_BS_MUL_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BS_MUL_SRC_VALUE_0_BS_MUL_OPERAND_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_BS_MUL_SRC_VALUE_0_BS_MUL_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_BN_CFG_0
+#define SDP_D_DP_BN_CFG_0			_MK_ADDR_CONST(0x906c)
+#define SDP_D_DP_BN_CFG_0_BN_BYPASS_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BN_CFG_0_BN_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_CFG_0_BN_BYPASS_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_CFG_0_BN_ALU_BYPASS_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_FIELD			_MK_FIELD_CONST(0x3, SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_MAX			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_MIN			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_CFG_0_BN_ALU_ALGO_SUM			_MK_ENUM_CONST(0x2)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_BYPASS_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_CFG_0_BN_MUL_BYPASS_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_PRELU_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_PRELU_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_CFG_0_BN_MUL_PRELU_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_PRELU_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_MUL_PRELU_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_CFG_0_BN_RELU_BYPASS_SHIFT			_MK_SHIFT_CONST(6)
+#define SDP_D_DP_BN_CFG_0_BN_RELU_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_CFG_0_BN_RELU_BYPASS_SHIFT)
+#define SDP_D_DP_BN_CFG_0_BN_RELU_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_CFG_0_BN_RELU_BYPASS_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DP_BN_ALU_CFG_0
+#define SDP_D_DP_BN_ALU_CFG_0			_MK_ADDR_CONST(0x9070)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SRC_SHIFT)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SHIFT_VALUE_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SHIFT_VALUE_FIELD			_MK_FIELD_CONST(0x3f, SDP_D_DP_BN_ALU_CFG_0_BN_ALU_SHIFT_VALUE_SHIFT)
+
+
+// Register SDP_D_DP_BN_ALU_SRC_VALUE_0
+#define SDP_D_DP_BN_ALU_SRC_VALUE_0			_MK_ADDR_CONST(0x9074)
+#define SDP_D_DP_BN_ALU_SRC_VALUE_0_BN_ALU_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BN_ALU_SRC_VALUE_0_BN_ALU_OPERAND_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_BN_ALU_SRC_VALUE_0_BN_ALU_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_BN_MUL_CFG_0
+#define SDP_D_DP_BN_MUL_CFG_0			_MK_ADDR_CONST(0x9078)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SRC_SHIFT)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SHIFT_VALUE_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SHIFT_VALUE_FIELD			_MK_FIELD_CONST(0xff, SDP_D_DP_BN_MUL_CFG_0_BN_MUL_SHIFT_VALUE_SHIFT)
+
+
+// Register SDP_D_DP_BN_MUL_SRC_VALUE_0
+#define SDP_D_DP_BN_MUL_SRC_VALUE_0			_MK_ADDR_CONST(0x907c)
+#define SDP_D_DP_BN_MUL_SRC_VALUE_0_BN_MUL_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_BN_MUL_SRC_VALUE_0_BN_MUL_OPERAND_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_BN_MUL_SRC_VALUE_0_BN_MUL_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_EW_CFG_0
+#define SDP_D_DP_EW_CFG_0			_MK_ADDR_CONST(0x9080)
+#define SDP_D_DP_EW_CFG_0_EW_BYPASS_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_CFG_0_EW_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_CFG_0_EW_BYPASS_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_CFG_0_EW_ALU_BYPASS_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_FIELD			_MK_FIELD_CONST(0x3, SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_MAX			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_MIN			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_SUM			_MK_ENUM_CONST(0x2)
+#define SDP_D_DP_EW_CFG_0_EW_ALU_ALGO_EQL			_MK_ENUM_CONST(0x3)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_BYPASS_SHIFT			_MK_SHIFT_CONST(4)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_CFG_0_EW_MUL_BYPASS_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_BYPASS_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_PRELU_SHIFT			_MK_SHIFT_CONST(5)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_PRELU_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_CFG_0_EW_MUL_PRELU_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_PRELU_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_MUL_PRELU_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_CFG_0_EW_LUT_BYPASS_SHIFT			_MK_SHIFT_CONST(6)
+#define SDP_D_DP_EW_CFG_0_EW_LUT_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_CFG_0_EW_LUT_BYPASS_SHIFT)
+#define SDP_D_DP_EW_CFG_0_EW_LUT_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_CFG_0_EW_LUT_BYPASS_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DP_EW_ALU_CFG_0
+#define SDP_D_DP_EW_ALU_CFG_0			_MK_ADDR_CONST(0x9084)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_ALU_CFG_0_EW_ALU_SRC_SHIFT)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_CVT_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_CVT_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_ALU_CFG_0_EW_ALU_CVT_BYPASS_SHIFT)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_CVT_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_ALU_CFG_0_EW_ALU_CVT_BYPASS_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DP_EW_ALU_SRC_VALUE_0
+#define SDP_D_DP_EW_ALU_SRC_VALUE_0			_MK_ADDR_CONST(0x9088)
+#define SDP_D_DP_EW_ALU_SRC_VALUE_0_EW_ALU_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_ALU_SRC_VALUE_0_EW_ALU_OPERAND_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DP_EW_ALU_SRC_VALUE_0_EW_ALU_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0
+#define SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0			_MK_ADDR_CONST(0x908c)
+#define SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0_EW_ALU_CVT_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0_EW_ALU_CVT_OFFSET_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0_EW_ALU_CVT_OFFSET_SHIFT)
+
+
+// Register SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0
+#define SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0			_MK_ADDR_CONST(0x9090)
+#define SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0_EW_ALU_CVT_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0_EW_ALU_CVT_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0_EW_ALU_CVT_SCALE_SHIFT)
+
+
+// Register SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0
+#define SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0			_MK_ADDR_CONST(0x9094)
+#define SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0_EW_ALU_CVT_TRUNCATE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0_EW_ALU_CVT_TRUNCATE_FIELD			_MK_FIELD_CONST(0x3f, SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0_EW_ALU_CVT_TRUNCATE_SHIFT)
+
+
+// Register SDP_D_DP_EW_MUL_CFG_0
+#define SDP_D_DP_EW_MUL_CFG_0			_MK_ADDR_CONST(0x9098)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_SRC_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_SRC_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_MUL_CFG_0_EW_MUL_SRC_SHIFT)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_SRC_REG			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_SRC_MEM			_MK_ENUM_CONST(0x1)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_CVT_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_CVT_BYPASS_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DP_EW_MUL_CFG_0_EW_MUL_CVT_BYPASS_SHIFT)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_CVT_BYPASS_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_DP_EW_MUL_CFG_0_EW_MUL_CVT_BYPASS_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DP_EW_MUL_SRC_VALUE_0
+#define SDP_D_DP_EW_MUL_SRC_VALUE_0			_MK_ADDR_CONST(0x909c)
+#define SDP_D_DP_EW_MUL_SRC_VALUE_0_EW_MUL_OPERAND_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_MUL_SRC_VALUE_0_EW_MUL_OPERAND_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DP_EW_MUL_SRC_VALUE_0_EW_MUL_OPERAND_SHIFT)
+
+
+// Register SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0
+#define SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0			_MK_ADDR_CONST(0x90a0)
+#define SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0_EW_MUL_CVT_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0_EW_MUL_CVT_OFFSET_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0_EW_MUL_CVT_OFFSET_SHIFT)
+
+
+// Register SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0
+#define SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0			_MK_ADDR_CONST(0x90a4)
+#define SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0_EW_MUL_CVT_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0_EW_MUL_CVT_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0_EW_MUL_CVT_SCALE_SHIFT)
+
+
+// Register SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0
+#define SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0			_MK_ADDR_CONST(0x90a8)
+#define SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0_EW_MUL_CVT_TRUNCATE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0_EW_MUL_CVT_TRUNCATE_FIELD			_MK_FIELD_CONST(0x3f, SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0_EW_MUL_CVT_TRUNCATE_SHIFT)
+
+
+// Register SDP_D_DP_EW_TRUNCATE_VALUE_0
+#define SDP_D_DP_EW_TRUNCATE_VALUE_0			_MK_ADDR_CONST(0x90ac)
+#define SDP_D_DP_EW_TRUNCATE_VALUE_0_EW_TRUNCATE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DP_EW_TRUNCATE_VALUE_0_EW_TRUNCATE_FIELD			_MK_FIELD_CONST(0x3ff, SDP_D_DP_EW_TRUNCATE_VALUE_0_EW_TRUNCATE_SHIFT)
+
+
+// Register SDP_D_FEATURE_MODE_CFG_0
+#define SDP_D_FEATURE_MODE_CFG_0			_MK_ADDR_CONST(0x90b0)
+#define SDP_D_FEATURE_MODE_CFG_0_FLYING_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_FEATURE_MODE_CFG_0_FLYING_MODE_FIELD			_MK_FIELD_CONST(0x1, SDP_D_FEATURE_MODE_CFG_0_FLYING_MODE_SHIFT)
+#define SDP_D_FEATURE_MODE_CFG_0_FLYING_MODE_OFF			_MK_ENUM_CONST(0x0)
+#define SDP_D_FEATURE_MODE_CFG_0_FLYING_MODE_ON			_MK_ENUM_CONST(0x1)
+#define SDP_D_FEATURE_MODE_CFG_0_OUTPUT_DST_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_FEATURE_MODE_CFG_0_OUTPUT_DST_FIELD			_MK_FIELD_CONST(0x1, SDP_D_FEATURE_MODE_CFG_0_OUTPUT_DST_SHIFT)
+#define SDP_D_FEATURE_MODE_CFG_0_OUTPUT_DST_MEM			_MK_ENUM_CONST(0x0)
+#define SDP_D_FEATURE_MODE_CFG_0_OUTPUT_DST_PDP			_MK_ENUM_CONST(0x1)
+#define SDP_D_FEATURE_MODE_CFG_0_WINOGRAD_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_FEATURE_MODE_CFG_0_WINOGRAD_FIELD			_MK_FIELD_CONST(0x1, SDP_D_FEATURE_MODE_CFG_0_WINOGRAD_SHIFT)
+#define SDP_D_FEATURE_MODE_CFG_0_WINOGRAD_OFF			_MK_ENUM_CONST(0x0)
+#define SDP_D_FEATURE_MODE_CFG_0_WINOGRAD_ON			_MK_ENUM_CONST(0x1)
+#define SDP_D_FEATURE_MODE_CFG_0_NAN_TO_ZERO_SHIFT			_MK_SHIFT_CONST(3)
+#define SDP_D_FEATURE_MODE_CFG_0_NAN_TO_ZERO_FIELD			_MK_FIELD_CONST(0x1, SDP_D_FEATURE_MODE_CFG_0_NAN_TO_ZERO_SHIFT)
+#define SDP_D_FEATURE_MODE_CFG_0_NAN_TO_ZERO_DISABLE			_MK_ENUM_CONST(0x0)
+#define SDP_D_FEATURE_MODE_CFG_0_NAN_TO_ZERO_ENABLE			_MK_ENUM_CONST(0x1)
+#define SDP_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_SHIFT			_MK_SHIFT_CONST(8)
+#define SDP_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_FIELD			_MK_FIELD_CONST(0x1f, SDP_D_FEATURE_MODE_CFG_0_BATCH_NUMBER_SHIFT)
+
+
+// Register SDP_D_DST_DMA_CFG_0
+#define SDP_D_DST_DMA_CFG_0			_MK_ADDR_CONST(0x90b4)
+#define SDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, SDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_SHIFT)
+#define SDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define SDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_DST_BATCH_STRIDE_0
+#define SDP_D_DST_BATCH_STRIDE_0			_MK_ADDR_CONST(0x90b8)
+#define SDP_D_DST_BATCH_STRIDE_0_DST_BATCH_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DST_BATCH_STRIDE_0_DST_BATCH_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_DST_BATCH_STRIDE_0_DST_BATCH_STRIDE_SHIFT)
+
+
+// Register SDP_D_DATA_FORMAT_0
+#define SDP_D_DATA_FORMAT_0			_MK_ADDR_CONST(0x90bc)
+#define SDP_D_DATA_FORMAT_0_PROC_PRECISION_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_DATA_FORMAT_0_PROC_PRECISION_FIELD			_MK_FIELD_CONST(0x3, SDP_D_DATA_FORMAT_0_PROC_PRECISION_SHIFT)
+#define SDP_D_DATA_FORMAT_0_PROC_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define SDP_D_DATA_FORMAT_0_PROC_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define SDP_D_DATA_FORMAT_0_PROC_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+#define SDP_D_DATA_FORMAT_0_OUT_PRECISION_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_DATA_FORMAT_0_OUT_PRECISION_FIELD			_MK_FIELD_CONST(0x3, SDP_D_DATA_FORMAT_0_OUT_PRECISION_SHIFT)
+#define SDP_D_DATA_FORMAT_0_OUT_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define SDP_D_DATA_FORMAT_0_OUT_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define SDP_D_DATA_FORMAT_0_OUT_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register SDP_D_CVT_OFFSET_0
+#define SDP_D_CVT_OFFSET_0			_MK_ADDR_CONST(0x90c0)
+#define SDP_D_CVT_OFFSET_0_CVT_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_CVT_OFFSET_0_CVT_OFFSET_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_CVT_OFFSET_0_CVT_OFFSET_SHIFT)
+
+
+// Register SDP_D_CVT_SCALE_0
+#define SDP_D_CVT_SCALE_0			_MK_ADDR_CONST(0x90c4)
+#define SDP_D_CVT_SCALE_0_CVT_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_CVT_SCALE_0_CVT_SCALE_FIELD			_MK_FIELD_CONST(0xffff, SDP_D_CVT_SCALE_0_CVT_SCALE_SHIFT)
+
+
+// Register SDP_D_CVT_SHIFT_0
+#define SDP_D_CVT_SHIFT_0			_MK_ADDR_CONST(0x90c8)
+#define SDP_D_CVT_SHIFT_0_CVT_SHIFT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_CVT_SHIFT_0_CVT_SHIFT_FIELD			_MK_FIELD_CONST(0x3f, SDP_D_CVT_SHIFT_0_CVT_SHIFT_SHIFT)
+
+
+// Register SDP_D_STATUS_0
+#define SDP_D_STATUS_0			_MK_ADDR_CONST(0x90cc)
+#define SDP_D_STATUS_0_STATUS_UNEQUAL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_STATUS_0_STATUS_UNEQUAL_FIELD			_MK_FIELD_CONST(0x1, SDP_D_STATUS_0_STATUS_UNEQUAL_SHIFT)
+
+
+// Register SDP_D_STATUS_NAN_INPUT_NUM_0
+#define SDP_D_STATUS_NAN_INPUT_NUM_0			_MK_ADDR_CONST(0x90d0)
+#define SDP_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_STATUS_NAN_INPUT_NUM_0_STATUS_NAN_INPUT_NUM_SHIFT)
+
+
+// Register SDP_D_STATUS_INF_INPUT_NUM_0
+#define SDP_D_STATUS_INF_INPUT_NUM_0			_MK_ADDR_CONST(0x90d4)
+#define SDP_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_STATUS_INF_INPUT_NUM_0_STATUS_INF_INPUT_NUM_SHIFT)
+
+
+// Register SDP_D_STATUS_NAN_OUTPUT_NUM_0
+#define SDP_D_STATUS_NAN_OUTPUT_NUM_0			_MK_ADDR_CONST(0x90d8)
+#define SDP_D_STATUS_NAN_OUTPUT_NUM_0_STATUS_NAN_OUTPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_STATUS_NAN_OUTPUT_NUM_0_STATUS_NAN_OUTPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_STATUS_NAN_OUTPUT_NUM_0_STATUS_NAN_OUTPUT_NUM_SHIFT)
+
+
+// Register SDP_D_PERF_ENABLE_0
+#define SDP_D_PERF_ENABLE_0			_MK_ADDR_CONST(0x90dc)
+#define SDP_D_PERF_ENABLE_0_PERF_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_ENABLE_0_PERF_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_D_PERF_ENABLE_0_PERF_DMA_EN_SHIFT)
+#define SDP_D_PERF_ENABLE_0_PERF_DMA_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_PERF_ENABLE_0_PERF_DMA_EN_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_PERF_ENABLE_0_PERF_LUT_EN_SHIFT			_MK_SHIFT_CONST(1)
+#define SDP_D_PERF_ENABLE_0_PERF_LUT_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_D_PERF_ENABLE_0_PERF_LUT_EN_SHIFT)
+#define SDP_D_PERF_ENABLE_0_PERF_LUT_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_PERF_ENABLE_0_PERF_LUT_EN_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_PERF_ENABLE_0_PERF_SAT_EN_SHIFT			_MK_SHIFT_CONST(2)
+#define SDP_D_PERF_ENABLE_0_PERF_SAT_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_D_PERF_ENABLE_0_PERF_SAT_EN_SHIFT)
+#define SDP_D_PERF_ENABLE_0_PERF_SAT_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_PERF_ENABLE_0_PERF_SAT_EN_YES			_MK_ENUM_CONST(0x1)
+#define SDP_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_SHIFT			_MK_SHIFT_CONST(3)
+#define SDP_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_FIELD			_MK_FIELD_CONST(0x1, SDP_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_SHIFT)
+#define SDP_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_NO			_MK_ENUM_CONST(0x0)
+#define SDP_D_PERF_ENABLE_0_PERF_NAN_INF_COUNT_EN_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register SDP_D_PERF_WDMA_WRITE_STALL_0
+#define SDP_D_PERF_WDMA_WRITE_STALL_0			_MK_ADDR_CONST(0x90e0)
+#define SDP_D_PERF_WDMA_WRITE_STALL_0_WDMA_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_WDMA_WRITE_STALL_0_WDMA_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_WDMA_WRITE_STALL_0_WDMA_STALL_SHIFT)
+
+
+// Register SDP_D_PERF_LUT_UFLOW_0
+#define SDP_D_PERF_LUT_UFLOW_0			_MK_ADDR_CONST(0x90e4)
+#define SDP_D_PERF_LUT_UFLOW_0_LUT_UFLOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_LUT_UFLOW_0_LUT_UFLOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_LUT_UFLOW_0_LUT_UFLOW_SHIFT)
+
+
+// Register SDP_D_PERF_LUT_OFLOW_0
+#define SDP_D_PERF_LUT_OFLOW_0			_MK_ADDR_CONST(0x90e8)
+#define SDP_D_PERF_LUT_OFLOW_0_LUT_OFLOW_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_LUT_OFLOW_0_LUT_OFLOW_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_LUT_OFLOW_0_LUT_OFLOW_SHIFT)
+
+
+// Register SDP_D_PERF_OUT_SATURATION_0
+#define SDP_D_PERF_OUT_SATURATION_0			_MK_ADDR_CONST(0x90ec)
+#define SDP_D_PERF_OUT_SATURATION_0_OUT_SATURATION_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_OUT_SATURATION_0_OUT_SATURATION_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_OUT_SATURATION_0_OUT_SATURATION_SHIFT)
+
+
+// Register SDP_D_PERF_LUT_HYBRID_0
+#define SDP_D_PERF_LUT_HYBRID_0			_MK_ADDR_CONST(0x90f0)
+#define SDP_D_PERF_LUT_HYBRID_0_LUT_HYBRID_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_LUT_HYBRID_0_LUT_HYBRID_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_LUT_HYBRID_0_LUT_HYBRID_SHIFT)
+
+
+// Register SDP_D_PERF_LUT_LE_HIT_0
+#define SDP_D_PERF_LUT_LE_HIT_0			_MK_ADDR_CONST(0x90f4)
+#define SDP_D_PERF_LUT_LE_HIT_0_LUT_LE_HIT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_LUT_LE_HIT_0_LUT_LE_HIT_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_LUT_LE_HIT_0_LUT_LE_HIT_SHIFT)
+
+
+// Register SDP_D_PERF_LUT_LO_HIT_0
+#define SDP_D_PERF_LUT_LO_HIT_0			_MK_ADDR_CONST(0x90f8)
+#define SDP_D_PERF_LUT_LO_HIT_0_LUT_LO_HIT_SHIFT			_MK_SHIFT_CONST(0)
+#define SDP_D_PERF_LUT_LO_HIT_0_LUT_LO_HIT_FIELD			_MK_FIELD_CONST(0xffffffff, SDP_D_PERF_LUT_LO_HIT_0_LUT_LO_HIT_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register PDP_RDMA_S_STATUS_0
+#define PDP_RDMA_S_STATUS_0			_MK_ADDR_CONST(0xa000)
+#define PDP_RDMA_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, PDP_RDMA_S_STATUS_0_STATUS_0_SHIFT)
+#define PDP_RDMA_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define PDP_RDMA_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define PDP_RDMA_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define PDP_RDMA_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, PDP_RDMA_S_STATUS_0_STATUS_1_SHIFT)
+#define PDP_RDMA_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define PDP_RDMA_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register PDP_RDMA_S_POINTER_0
+#define PDP_RDMA_S_POINTER_0			_MK_ADDR_CONST(0xa004)
+#define PDP_RDMA_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_S_POINTER_0_PRODUCER_SHIFT)
+#define PDP_RDMA_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define PDP_RDMA_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define PDP_RDMA_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_S_POINTER_0_CONSUMER_SHIFT)
+#define PDP_RDMA_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_RDMA_D_OP_ENABLE_0
+#define PDP_RDMA_D_OP_ENABLE_0			_MK_ADDR_CONST(0xa008)
+#define PDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define PDP_RDMA_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0
+#define PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0			_MK_ADDR_CONST(0xa00c)
+#define PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_SHIFT)
+
+
+// Register PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0
+#define PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0			_MK_ADDR_CONST(0xa010)
+#define PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_SHIFT)
+
+
+// Register PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0
+#define PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0			_MK_ADDR_CONST(0xa014)
+#define PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_SHIFT)
+
+
+// Register PDP_RDMA_D_FLYING_MODE_0
+#define PDP_RDMA_D_FLYING_MODE_0			_MK_ADDR_CONST(0xa018)
+#define PDP_RDMA_D_FLYING_MODE_0_FLYING_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_FLYING_MODE_0_FLYING_MODE_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_D_FLYING_MODE_0_FLYING_MODE_SHIFT)
+#define PDP_RDMA_D_FLYING_MODE_0_FLYING_MODE_ON_FLYING			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_FLYING_MODE_0_FLYING_MODE_OFF_FLYING			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_RDMA_D_SRC_BASE_ADDR_LOW_0
+#define PDP_RDMA_D_SRC_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0xa01c)
+#define PDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT)
+
+
+// Register PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
+#define PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0xa020)
+#define PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register PDP_RDMA_D_SRC_LINE_STRIDE_0
+#define PDP_RDMA_D_SRC_LINE_STRIDE_0			_MK_ADDR_CONST(0xa024)
+#define PDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT)
+
+
+// Register PDP_RDMA_D_SRC_SURFACE_STRIDE_0
+#define PDP_RDMA_D_SRC_SURFACE_STRIDE_0			_MK_ADDR_CONST(0xa028)
+#define PDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT)
+
+
+// Register PDP_RDMA_D_SRC_RAM_CFG_0
+#define PDP_RDMA_D_SRC_RAM_CFG_0			_MK_ADDR_CONST(0xa02c)
+#define PDP_RDMA_D_SRC_RAM_CFG_0_SRC_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_SRC_RAM_CFG_0_SRC_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_D_SRC_RAM_CFG_0_SRC_RAM_TYPE_SHIFT)
+#define PDP_RDMA_D_SRC_RAM_CFG_0_SRC_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_SRC_RAM_CFG_0_SRC_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_RDMA_D_DATA_FORMAT_0
+#define PDP_RDMA_D_DATA_FORMAT_0			_MK_ADDR_CONST(0xa030)
+#define PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_FIELD			_MK_FIELD_CONST(0x3, PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_SHIFT)
+#define PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_INT8			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_INT16			_MK_ENUM_CONST(0x1)
+#define PDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register PDP_RDMA_D_OPERATION_MODE_CFG_0
+#define PDP_RDMA_D_OPERATION_MODE_CFG_0			_MK_ADDR_CONST(0xa034)
+#define PDP_RDMA_D_OPERATION_MODE_CFG_0_SPLIT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_OPERATION_MODE_CFG_0_SPLIT_NUM_FIELD			_MK_FIELD_CONST(0xff, PDP_RDMA_D_OPERATION_MODE_CFG_0_SPLIT_NUM_SHIFT)
+
+
+// Register PDP_RDMA_D_POOLING_KERNEL_CFG_0
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0			_MK_ADDR_CONST(0xa038)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_FIELD			_MK_FIELD_CONST(0xf, PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_SHIFT)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_1			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_2			_MK_ENUM_CONST(0x1)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_3			_MK_ENUM_CONST(0x2)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_4			_MK_ENUM_CONST(0x3)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_5			_MK_ENUM_CONST(0x4)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_6			_MK_ENUM_CONST(0x5)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_7			_MK_ENUM_CONST(0x6)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_8			_MK_ENUM_CONST(0x7)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_SHIFT			_MK_SHIFT_CONST(4)
+#define PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_FIELD			_MK_FIELD_CONST(0xf, PDP_RDMA_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_SHIFT)
+
+
+// Register PDP_RDMA_D_POOLING_PADDING_CFG_0
+#define PDP_RDMA_D_POOLING_PADDING_CFG_0			_MK_ADDR_CONST(0xa03c)
+#define PDP_RDMA_D_POOLING_PADDING_CFG_0_PAD_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_POOLING_PADDING_CFG_0_PAD_WIDTH_FIELD			_MK_FIELD_CONST(0xf, PDP_RDMA_D_POOLING_PADDING_CFG_0_PAD_WIDTH_SHIFT)
+
+
+// Register PDP_RDMA_D_PARTIAL_WIDTH_IN_0
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0			_MK_ADDR_CONST(0xa040)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_SHIFT)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_SHIFT			_MK_SHIFT_CONST(10)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_SHIFT)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_SHIFT			_MK_SHIFT_CONST(20)
+#define PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_FIELD			_MK_FIELD_CONST(0x3ff, PDP_RDMA_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_SHIFT)
+
+
+// Register PDP_RDMA_D_PERF_ENABLE_0
+#define PDP_RDMA_D_PERF_ENABLE_0			_MK_ADDR_CONST(0xa044)
+#define PDP_RDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_PERF_ENABLE_0_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, PDP_RDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT)
+#define PDP_RDMA_D_PERF_ENABLE_0_DMA_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define PDP_RDMA_D_PERF_ENABLE_0_DMA_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_RDMA_D_PERF_READ_STALL_0
+#define PDP_RDMA_D_PERF_READ_STALL_0			_MK_ADDR_CONST(0xa048)
+#define PDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_SHIFT)
+
+
+// Register PDP_RDMA_D_CYA_0
+#define PDP_RDMA_D_CYA_0			_MK_ADDR_CONST(0xa04c)
+#define PDP_RDMA_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_RDMA_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_RDMA_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register PDP_S_STATUS_0
+#define PDP_S_STATUS_0			_MK_ADDR_CONST(0xb000)
+#define PDP_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, PDP_S_STATUS_0_STATUS_0_SHIFT)
+#define PDP_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define PDP_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define PDP_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define PDP_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define PDP_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, PDP_S_STATUS_0_STATUS_1_SHIFT)
+#define PDP_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define PDP_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define PDP_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register PDP_S_POINTER_0
+#define PDP_S_POINTER_0			_MK_ADDR_CONST(0xb004)
+#define PDP_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, PDP_S_POINTER_0_PRODUCER_SHIFT)
+#define PDP_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define PDP_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define PDP_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define PDP_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, PDP_S_POINTER_0_CONSUMER_SHIFT)
+#define PDP_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define PDP_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_D_OP_ENABLE_0
+#define PDP_D_OP_ENABLE_0			_MK_ADDR_CONST(0xb008)
+#define PDP_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, PDP_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define PDP_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define PDP_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_D_DATA_CUBE_IN_WIDTH_0
+#define PDP_D_DATA_CUBE_IN_WIDTH_0			_MK_ADDR_CONST(0xb00c)
+#define PDP_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_IN_WIDTH_0_CUBE_IN_WIDTH_SHIFT)
+
+
+// Register PDP_D_DATA_CUBE_IN_HEIGHT_0
+#define PDP_D_DATA_CUBE_IN_HEIGHT_0			_MK_ADDR_CONST(0xb010)
+#define PDP_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_IN_HEIGHT_0_CUBE_IN_HEIGHT_SHIFT)
+
+
+// Register PDP_D_DATA_CUBE_IN_CHANNEL_0
+#define PDP_D_DATA_CUBE_IN_CHANNEL_0			_MK_ADDR_CONST(0xb014)
+#define PDP_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_IN_CHANNEL_0_CUBE_IN_CHANNEL_SHIFT)
+
+
+// Register PDP_D_DATA_CUBE_OUT_WIDTH_0
+#define PDP_D_DATA_CUBE_OUT_WIDTH_0			_MK_ADDR_CONST(0xb018)
+#define PDP_D_DATA_CUBE_OUT_WIDTH_0_CUBE_OUT_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_OUT_WIDTH_0_CUBE_OUT_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_OUT_WIDTH_0_CUBE_OUT_WIDTH_SHIFT)
+
+
+// Register PDP_D_DATA_CUBE_OUT_HEIGHT_0
+#define PDP_D_DATA_CUBE_OUT_HEIGHT_0			_MK_ADDR_CONST(0xb01c)
+#define PDP_D_DATA_CUBE_OUT_HEIGHT_0_CUBE_OUT_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_OUT_HEIGHT_0_CUBE_OUT_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_OUT_HEIGHT_0_CUBE_OUT_HEIGHT_SHIFT)
+
+
+// Register PDP_D_DATA_CUBE_OUT_CHANNEL_0
+#define PDP_D_DATA_CUBE_OUT_CHANNEL_0			_MK_ADDR_CONST(0xb020)
+#define PDP_D_DATA_CUBE_OUT_CHANNEL_0_CUBE_OUT_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_CUBE_OUT_CHANNEL_0_CUBE_OUT_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, PDP_D_DATA_CUBE_OUT_CHANNEL_0_CUBE_OUT_CHANNEL_SHIFT)
+
+
+// Register PDP_D_OPERATION_MODE_CFG_0
+#define PDP_D_OPERATION_MODE_CFG_0			_MK_ADDR_CONST(0xb024)
+#define PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_FIELD			_MK_FIELD_CONST(0x3, PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_SHIFT)
+#define PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_POOLING_METHOD_AVERAGE			_MK_ENUM_CONST(0x0)
+#define PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_POOLING_METHOD_MAX			_MK_ENUM_CONST(0x1)
+#define PDP_D_OPERATION_MODE_CFG_0_POOLING_METHOD_POOLING_METHOD_MIN			_MK_ENUM_CONST(0x2)
+#define PDP_D_OPERATION_MODE_CFG_0_FLYING_MODE_SHIFT			_MK_SHIFT_CONST(4)
+#define PDP_D_OPERATION_MODE_CFG_0_FLYING_MODE_FIELD			_MK_FIELD_CONST(0x1, PDP_D_OPERATION_MODE_CFG_0_FLYING_MODE_SHIFT)
+#define PDP_D_OPERATION_MODE_CFG_0_FLYING_MODE_ON_FLYING			_MK_ENUM_CONST(0x0)
+#define PDP_D_OPERATION_MODE_CFG_0_FLYING_MODE_OFF_FLYING			_MK_ENUM_CONST(0x1)
+#define PDP_D_OPERATION_MODE_CFG_0_SPLIT_NUM_SHIFT			_MK_SHIFT_CONST(8)
+#define PDP_D_OPERATION_MODE_CFG_0_SPLIT_NUM_FIELD			_MK_FIELD_CONST(0xff, PDP_D_OPERATION_MODE_CFG_0_SPLIT_NUM_SHIFT)
+
+
+// Register PDP_D_NAN_FLUSH_TO_ZERO_0
+#define PDP_D_NAN_FLUSH_TO_ZERO_0			_MK_ADDR_CONST(0xb028)
+#define PDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_FIELD			_MK_FIELD_CONST(0x1, PDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT)
+#define PDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_DISABLE			_MK_ENUM_CONST(0x0)
+#define PDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_D_PARTIAL_WIDTH_IN_0
+#define PDP_D_PARTIAL_WIDTH_IN_0			_MK_ADDR_CONST(0xb02c)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_FIRST_SHIFT)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_SHIFT			_MK_SHIFT_CONST(10)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_LAST_SHIFT)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_SHIFT			_MK_SHIFT_CONST(20)
+#define PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_IN_0_PARTIAL_WIDTH_IN_MID_SHIFT)
+
+
+// Register PDP_D_PARTIAL_WIDTH_OUT_0
+#define PDP_D_PARTIAL_WIDTH_OUT_0			_MK_ADDR_CONST(0xb030)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_FIRST_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_FIRST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_FIRST_SHIFT)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_LAST_SHIFT			_MK_SHIFT_CONST(10)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_LAST_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_LAST_SHIFT)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_MID_SHIFT			_MK_SHIFT_CONST(20)
+#define PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_MID_FIELD			_MK_FIELD_CONST(0x3ff, PDP_D_PARTIAL_WIDTH_OUT_0_PARTIAL_WIDTH_OUT_MID_SHIFT)
+
+
+// Register PDP_D_POOLING_KERNEL_CFG_0
+#define PDP_D_POOLING_KERNEL_CFG_0			_MK_ADDR_CONST(0xb034)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_FIELD			_MK_FIELD_CONST(0xf, PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_SHIFT)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_1			_MK_ENUM_CONST(0x0)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_2			_MK_ENUM_CONST(0x1)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_3			_MK_ENUM_CONST(0x2)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_4			_MK_ENUM_CONST(0x3)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_5			_MK_ENUM_CONST(0x4)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_6			_MK_ENUM_CONST(0x5)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_7			_MK_ENUM_CONST(0x6)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_WIDTH_KERNEL_WIDTH_8			_MK_ENUM_CONST(0x7)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_SHIFT			_MK_SHIFT_CONST(8)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_FIELD			_MK_FIELD_CONST(0xf, PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_SHIFT)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_1			_MK_ENUM_CONST(0x0)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_2			_MK_ENUM_CONST(0x1)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_3			_MK_ENUM_CONST(0x2)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_4			_MK_ENUM_CONST(0x3)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_5			_MK_ENUM_CONST(0x4)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_6			_MK_ENUM_CONST(0x5)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_7			_MK_ENUM_CONST(0x6)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_HEIGHT_KERNEL_HEIGHT_8			_MK_ENUM_CONST(0x7)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_SHIFT			_MK_SHIFT_CONST(16)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_FIELD			_MK_FIELD_CONST(0xf, PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_WIDTH_SHIFT)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_HEIGHT_SHIFT			_MK_SHIFT_CONST(20)
+#define PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_HEIGHT_FIELD			_MK_FIELD_CONST(0xf, PDP_D_POOLING_KERNEL_CFG_0_KERNEL_STRIDE_HEIGHT_SHIFT)
+
+
+// Register PDP_D_RECIP_KERNEL_WIDTH_0
+#define PDP_D_RECIP_KERNEL_WIDTH_0			_MK_ADDR_CONST(0xb038)
+#define PDP_D_RECIP_KERNEL_WIDTH_0_RECIP_KERNEL_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_RECIP_KERNEL_WIDTH_0_RECIP_KERNEL_WIDTH_FIELD			_MK_FIELD_CONST(0x1ffff, PDP_D_RECIP_KERNEL_WIDTH_0_RECIP_KERNEL_WIDTH_SHIFT)
+
+
+// Register PDP_D_RECIP_KERNEL_HEIGHT_0
+#define PDP_D_RECIP_KERNEL_HEIGHT_0			_MK_ADDR_CONST(0xb03c)
+#define PDP_D_RECIP_KERNEL_HEIGHT_0_RECIP_KERNEL_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_RECIP_KERNEL_HEIGHT_0_RECIP_KERNEL_HEIGHT_FIELD			_MK_FIELD_CONST(0x1ffff, PDP_D_RECIP_KERNEL_HEIGHT_0_RECIP_KERNEL_HEIGHT_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_CFG_0
+#define PDP_D_POOLING_PADDING_CFG_0			_MK_ADDR_CONST(0xb040)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_LEFT_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_LEFT_FIELD			_MK_FIELD_CONST(0x7, PDP_D_POOLING_PADDING_CFG_0_PAD_LEFT_SHIFT)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_TOP_SHIFT			_MK_SHIFT_CONST(4)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_TOP_FIELD			_MK_FIELD_CONST(0x7, PDP_D_POOLING_PADDING_CFG_0_PAD_TOP_SHIFT)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_RIGHT_SHIFT			_MK_SHIFT_CONST(8)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_RIGHT_FIELD			_MK_FIELD_CONST(0x7, PDP_D_POOLING_PADDING_CFG_0_PAD_RIGHT_SHIFT)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_BOTTOM_SHIFT			_MK_SHIFT_CONST(12)
+#define PDP_D_POOLING_PADDING_CFG_0_PAD_BOTTOM_FIELD			_MK_FIELD_CONST(0x7, PDP_D_POOLING_PADDING_CFG_0_PAD_BOTTOM_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_1_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_1_CFG_0			_MK_ADDR_CONST(0xb044)
+#define PDP_D_POOLING_PADDING_VALUE_1_CFG_0_PAD_VALUE_1X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_1_CFG_0_PAD_VALUE_1X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_1_CFG_0_PAD_VALUE_1X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_2_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_2_CFG_0			_MK_ADDR_CONST(0xb048)
+#define PDP_D_POOLING_PADDING_VALUE_2_CFG_0_PAD_VALUE_2X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_2_CFG_0_PAD_VALUE_2X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_2_CFG_0_PAD_VALUE_2X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_3_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_3_CFG_0			_MK_ADDR_CONST(0xb04c)
+#define PDP_D_POOLING_PADDING_VALUE_3_CFG_0_PAD_VALUE_3X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_3_CFG_0_PAD_VALUE_3X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_3_CFG_0_PAD_VALUE_3X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_4_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_4_CFG_0			_MK_ADDR_CONST(0xb050)
+#define PDP_D_POOLING_PADDING_VALUE_4_CFG_0_PAD_VALUE_4X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_4_CFG_0_PAD_VALUE_4X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_4_CFG_0_PAD_VALUE_4X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_5_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_5_CFG_0			_MK_ADDR_CONST(0xb054)
+#define PDP_D_POOLING_PADDING_VALUE_5_CFG_0_PAD_VALUE_5X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_5_CFG_0_PAD_VALUE_5X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_5_CFG_0_PAD_VALUE_5X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_6_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_6_CFG_0			_MK_ADDR_CONST(0xb058)
+#define PDP_D_POOLING_PADDING_VALUE_6_CFG_0_PAD_VALUE_6X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_6_CFG_0_PAD_VALUE_6X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_6_CFG_0_PAD_VALUE_6X_SHIFT)
+
+
+// Register PDP_D_POOLING_PADDING_VALUE_7_CFG_0
+#define PDP_D_POOLING_PADDING_VALUE_7_CFG_0			_MK_ADDR_CONST(0xb05c)
+#define PDP_D_POOLING_PADDING_VALUE_7_CFG_0_PAD_VALUE_7X_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_POOLING_PADDING_VALUE_7_CFG_0_PAD_VALUE_7X_FIELD			_MK_FIELD_CONST(0x7ffff, PDP_D_POOLING_PADDING_VALUE_7_CFG_0_PAD_VALUE_7X_SHIFT)
+
+
+// Register PDP_D_SRC_BASE_ADDR_LOW_0
+#define PDP_D_SRC_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0xb060)
+#define PDP_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT)
+
+
+// Register PDP_D_SRC_BASE_ADDR_HIGH_0
+#define PDP_D_SRC_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0xb064)
+#define PDP_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register PDP_D_SRC_LINE_STRIDE_0
+#define PDP_D_SRC_LINE_STRIDE_0			_MK_ADDR_CONST(0xb068)
+#define PDP_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT)
+
+
+// Register PDP_D_SRC_SURFACE_STRIDE_0
+#define PDP_D_SRC_SURFACE_STRIDE_0			_MK_ADDR_CONST(0xb06c)
+#define PDP_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT)
+
+
+// Register PDP_D_DST_BASE_ADDR_LOW_0
+#define PDP_D_DST_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0xb070)
+#define PDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT)
+
+
+// Register PDP_D_DST_BASE_ADDR_HIGH_0
+#define PDP_D_DST_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0xb074)
+#define PDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register PDP_D_DST_LINE_STRIDE_0
+#define PDP_D_DST_LINE_STRIDE_0			_MK_ADDR_CONST(0xb078)
+#define PDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT)
+
+
+// Register PDP_D_DST_SURFACE_STRIDE_0
+#define PDP_D_DST_SURFACE_STRIDE_0			_MK_ADDR_CONST(0xb07c)
+#define PDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT)
+
+
+// Register PDP_D_DST_RAM_CFG_0
+#define PDP_D_DST_RAM_CFG_0			_MK_ADDR_CONST(0xb080)
+#define PDP_D_DST_RAM_CFG_0_DST_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DST_RAM_CFG_0_DST_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, PDP_D_DST_RAM_CFG_0_DST_RAM_TYPE_SHIFT)
+#define PDP_D_DST_RAM_CFG_0_DST_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define PDP_D_DST_RAM_CFG_0_DST_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_D_DATA_FORMAT_0
+#define PDP_D_DATA_FORMAT_0			_MK_ADDR_CONST(0xb084)
+#define PDP_D_DATA_FORMAT_0_INPUT_DATA_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_DATA_FORMAT_0_INPUT_DATA_FIELD			_MK_FIELD_CONST(0x3, PDP_D_DATA_FORMAT_0_INPUT_DATA_SHIFT)
+#define PDP_D_DATA_FORMAT_0_INPUT_DATA_INT8			_MK_ENUM_CONST(0x0)
+#define PDP_D_DATA_FORMAT_0_INPUT_DATA_INT16			_MK_ENUM_CONST(0x1)
+#define PDP_D_DATA_FORMAT_0_INPUT_DATA_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register PDP_D_INF_INPUT_NUM_0
+#define PDP_D_INF_INPUT_NUM_0			_MK_ADDR_CONST(0xb088)
+#define PDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_SHIFT)
+
+
+// Register PDP_D_NAN_INPUT_NUM_0
+#define PDP_D_NAN_INPUT_NUM_0			_MK_ADDR_CONST(0xb08c)
+#define PDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_SHIFT)
+
+
+// Register PDP_D_NAN_OUTPUT_NUM_0
+#define PDP_D_NAN_OUTPUT_NUM_0			_MK_ADDR_CONST(0xb090)
+#define PDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_SHIFT)
+
+
+// Register PDP_D_PERF_ENABLE_0
+#define PDP_D_PERF_ENABLE_0			_MK_ADDR_CONST(0xb094)
+#define PDP_D_PERF_ENABLE_0_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_PERF_ENABLE_0_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, PDP_D_PERF_ENABLE_0_DMA_EN_SHIFT)
+#define PDP_D_PERF_ENABLE_0_DMA_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define PDP_D_PERF_ENABLE_0_DMA_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register PDP_D_PERF_WRITE_STALL_0
+#define PDP_D_PERF_WRITE_STALL_0			_MK_ADDR_CONST(0xb098)
+#define PDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_SHIFT)
+
+
+// Register PDP_D_CYA_0
+#define PDP_D_CYA_0			_MK_ADDR_CONST(0xb09c)
+#define PDP_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define PDP_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, PDP_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CDP_RDMA_S_STATUS_0
+#define CDP_RDMA_S_STATUS_0			_MK_ADDR_CONST(0xc000)
+#define CDP_RDMA_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CDP_RDMA_S_STATUS_0_STATUS_0_SHIFT)
+#define CDP_RDMA_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDP_RDMA_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CDP_RDMA_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_RDMA_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CDP_RDMA_S_STATUS_0_STATUS_1_SHIFT)
+#define CDP_RDMA_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDP_RDMA_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CDP_RDMA_S_POINTER_0
+#define CDP_RDMA_S_POINTER_0			_MK_ADDR_CONST(0xc004)
+#define CDP_RDMA_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_S_POINTER_0_PRODUCER_SHIFT)
+#define CDP_RDMA_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CDP_RDMA_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_RDMA_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_S_POINTER_0_CONSUMER_SHIFT)
+#define CDP_RDMA_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_RDMA_D_OP_ENABLE_0
+#define CDP_RDMA_D_OP_ENABLE_0			_MK_ADDR_CONST(0xc008)
+#define CDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CDP_RDMA_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_RDMA_D_DATA_CUBE_WIDTH_0
+#define CDP_RDMA_D_DATA_CUBE_WIDTH_0			_MK_ADDR_CONST(0xc00c)
+#define CDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, CDP_RDMA_D_DATA_CUBE_WIDTH_0_WIDTH_SHIFT)
+
+
+// Register CDP_RDMA_D_DATA_CUBE_HEIGHT_0
+#define CDP_RDMA_D_DATA_CUBE_HEIGHT_0			_MK_ADDR_CONST(0xc010)
+#define CDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, CDP_RDMA_D_DATA_CUBE_HEIGHT_0_HEIGHT_SHIFT)
+
+
+// Register CDP_RDMA_D_DATA_CUBE_CHANNEL_0
+#define CDP_RDMA_D_DATA_CUBE_CHANNEL_0			_MK_ADDR_CONST(0xc014)
+#define CDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, CDP_RDMA_D_DATA_CUBE_CHANNEL_0_CHANNEL_SHIFT)
+
+
+// Register CDP_RDMA_D_SRC_BASE_ADDR_LOW_0
+#define CDP_RDMA_D_SRC_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0xc018)
+#define CDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_SRC_BASE_ADDR_LOW_0_SRC_BASE_ADDR_LOW_SHIFT)
+
+
+// Register CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
+#define CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0xc01c)
+#define CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0_SRC_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register CDP_RDMA_D_SRC_LINE_STRIDE_0
+#define CDP_RDMA_D_SRC_LINE_STRIDE_0			_MK_ADDR_CONST(0xc020)
+#define CDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_SRC_LINE_STRIDE_0_SRC_LINE_STRIDE_SHIFT)
+
+
+// Register CDP_RDMA_D_SRC_SURFACE_STRIDE_0
+#define CDP_RDMA_D_SRC_SURFACE_STRIDE_0			_MK_ADDR_CONST(0xc024)
+#define CDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_SRC_SURFACE_STRIDE_0_SRC_SURFACE_STRIDE_SHIFT)
+
+
+// Register CDP_RDMA_D_SRC_DMA_CFG_0
+#define CDP_RDMA_D_SRC_DMA_CFG_0			_MK_ADDR_CONST(0xc028)
+#define CDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_SHIFT)
+#define CDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_SRC_DMA_CFG_0_SRC_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_RDMA_D_SRC_COMPRESSION_EN_0
+#define CDP_RDMA_D_SRC_COMPRESSION_EN_0			_MK_ADDR_CONST(0xc02c)
+#define CDP_RDMA_D_SRC_COMPRESSION_EN_0_SRC_COMPRESSION_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_SRC_COMPRESSION_EN_0_SRC_COMPRESSION_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_D_SRC_COMPRESSION_EN_0_SRC_COMPRESSION_EN_SHIFT)
+#define CDP_RDMA_D_SRC_COMPRESSION_EN_0_SRC_COMPRESSION_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_SRC_COMPRESSION_EN_0_SRC_COMPRESSION_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_RDMA_D_OPERATION_MODE_0
+#define CDP_RDMA_D_OPERATION_MODE_0			_MK_ADDR_CONST(0xc030)
+#define CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_FIELD			_MK_FIELD_CONST(0x3, CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_SHIFT)
+#define CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_READPHILE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_WRITEPHILE			_MK_ENUM_CONST(0x1)
+#define CDP_RDMA_D_OPERATION_MODE_0_OPERATION_MODE_ORDINARY			_MK_ENUM_CONST(0x2)
+
+
+// Register CDP_RDMA_D_DATA_FORMAT_0
+#define CDP_RDMA_D_DATA_FORMAT_0			_MK_ADDR_CONST(0xc034)
+#define CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_FIELD			_MK_FIELD_CONST(0x3, CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_SHIFT)
+#define CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_INT8			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_INT16			_MK_ENUM_CONST(0x1)
+#define CDP_RDMA_D_DATA_FORMAT_0_INPUT_DATA_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register CDP_RDMA_D_PERF_ENABLE_0
+#define CDP_RDMA_D_PERF_ENABLE_0			_MK_ADDR_CONST(0xc038)
+#define CDP_RDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_PERF_ENABLE_0_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_RDMA_D_PERF_ENABLE_0_DMA_EN_SHIFT)
+#define CDP_RDMA_D_PERF_ENABLE_0_DMA_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_RDMA_D_PERF_ENABLE_0_DMA_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_RDMA_D_PERF_READ_STALL_0
+#define CDP_RDMA_D_PERF_READ_STALL_0			_MK_ADDR_CONST(0xc03c)
+#define CDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_PERF_READ_STALL_0_PERF_READ_STALL_SHIFT)
+
+
+// Register CDP_RDMA_D_CYA_0
+#define CDP_RDMA_D_CYA_0			_MK_ADDR_CONST(0xc040)
+#define CDP_RDMA_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_RDMA_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_RDMA_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register CDP_S_STATUS_0
+#define CDP_S_STATUS_0			_MK_ADDR_CONST(0xd000)
+#define CDP_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, CDP_S_STATUS_0_STATUS_0_SHIFT)
+#define CDP_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define CDP_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDP_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define CDP_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, CDP_S_STATUS_0_STATUS_1_SHIFT)
+#define CDP_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define CDP_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define CDP_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register CDP_S_POINTER_0
+#define CDP_S_POINTER_0			_MK_ADDR_CONST(0xd004)
+#define CDP_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, CDP_S_POINTER_0_PRODUCER_SHIFT)
+#define CDP_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDP_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define CDP_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, CDP_S_POINTER_0_CONSUMER_SHIFT)
+#define CDP_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define CDP_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_S_LUT_ACCESS_CFG_0
+#define CDP_S_LUT_ACCESS_CFG_0			_MK_ADDR_CONST(0xd008)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_FIELD			_MK_FIELD_CONST(0x3ff, CDP_S_LUT_ACCESS_CFG_0_LUT_ADDR_SHIFT)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_SHIFT)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_LE			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_TABLE_ID_LO			_MK_ENUM_CONST(0x1)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_SHIFT			_MK_SHIFT_CONST(17)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_SHIFT)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_READ			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_ACCESS_CFG_0_LUT_ACCESS_TYPE_WRITE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_S_LUT_ACCESS_DATA_0
+#define CDP_S_LUT_ACCESS_DATA_0			_MK_ADDR_CONST(0xd00c)
+#define CDP_S_LUT_ACCESS_DATA_0_LUT_DATA_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_ACCESS_DATA_0_LUT_DATA_FIELD			_MK_FIELD_CONST(0xffff, CDP_S_LUT_ACCESS_DATA_0_LUT_DATA_SHIFT)
+
+
+// Register CDP_S_LUT_CFG_0
+#define CDP_S_LUT_CFG_0			_MK_ADDR_CONST(0xd010)
+#define CDP_S_LUT_CFG_0_LUT_LE_FUNCTION_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_CFG_0_LUT_LE_FUNCTION_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_CFG_0_LUT_LE_FUNCTION_SHIFT)
+#define CDP_S_LUT_CFG_0_LUT_LE_FUNCTION_EXPONENT			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_CFG_0_LUT_LE_FUNCTION_LINEAR			_MK_ENUM_CONST(0x1)
+#define CDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_SHIFT			_MK_SHIFT_CONST(4)
+#define CDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_SHIFT)
+#define CDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_CFG_0_LUT_UFLOW_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+#define CDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_SHIFT			_MK_SHIFT_CONST(5)
+#define CDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_SHIFT)
+#define CDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_CFG_0_LUT_OFLOW_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+#define CDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_SHIFT			_MK_SHIFT_CONST(6)
+#define CDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_FIELD			_MK_FIELD_CONST(0x1, CDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_SHIFT)
+#define CDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_LE			_MK_ENUM_CONST(0x0)
+#define CDP_S_LUT_CFG_0_LUT_HYBRID_PRIORITY_LO			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_S_LUT_INFO_0
+#define CDP_S_LUT_INFO_0			_MK_ADDR_CONST(0xd014)
+#define CDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_FIELD			_MK_FIELD_CONST(0xff, CDP_S_LUT_INFO_0_LUT_LE_INDEX_OFFSET_SHIFT)
+#define CDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_SHIFT			_MK_SHIFT_CONST(8)
+#define CDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_FIELD			_MK_FIELD_CONST(0xff, CDP_S_LUT_INFO_0_LUT_LE_INDEX_SELECT_SHIFT)
+#define CDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_FIELD			_MK_FIELD_CONST(0xff, CDP_S_LUT_INFO_0_LUT_LO_INDEX_SELECT_SHIFT)
+
+
+// Register CDP_S_LUT_LE_START_LOW_0
+#define CDP_S_LUT_LE_START_LOW_0			_MK_ADDR_CONST(0xd018)
+#define CDP_S_LUT_LE_START_LOW_0_LUT_LE_START_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_START_LOW_0_LUT_LE_START_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_S_LUT_LE_START_LOW_0_LUT_LE_START_LOW_SHIFT)
+
+
+// Register CDP_S_LUT_LE_START_HIGH_0
+#define CDP_S_LUT_LE_START_HIGH_0			_MK_ADDR_CONST(0xd01c)
+#define CDP_S_LUT_LE_START_HIGH_0_LUT_LE_START_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_START_HIGH_0_LUT_LE_START_HIGH_FIELD			_MK_FIELD_CONST(0x3f, CDP_S_LUT_LE_START_HIGH_0_LUT_LE_START_HIGH_SHIFT)
+
+
+// Register CDP_S_LUT_LE_END_LOW_0
+#define CDP_S_LUT_LE_END_LOW_0			_MK_ADDR_CONST(0xd020)
+#define CDP_S_LUT_LE_END_LOW_0_LUT_LE_END_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_END_LOW_0_LUT_LE_END_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_S_LUT_LE_END_LOW_0_LUT_LE_END_LOW_SHIFT)
+
+
+// Register CDP_S_LUT_LE_END_HIGH_0
+#define CDP_S_LUT_LE_END_HIGH_0			_MK_ADDR_CONST(0xd024)
+#define CDP_S_LUT_LE_END_HIGH_0_LUT_LE_END_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_END_HIGH_0_LUT_LE_END_HIGH_FIELD			_MK_FIELD_CONST(0x3f, CDP_S_LUT_LE_END_HIGH_0_LUT_LE_END_HIGH_SHIFT)
+
+
+// Register CDP_S_LUT_LO_START_LOW_0
+#define CDP_S_LUT_LO_START_LOW_0			_MK_ADDR_CONST(0xd028)
+#define CDP_S_LUT_LO_START_LOW_0_LUT_LO_START_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_START_LOW_0_LUT_LO_START_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_S_LUT_LO_START_LOW_0_LUT_LO_START_LOW_SHIFT)
+
+
+// Register CDP_S_LUT_LO_START_HIGH_0
+#define CDP_S_LUT_LO_START_HIGH_0			_MK_ADDR_CONST(0xd02c)
+#define CDP_S_LUT_LO_START_HIGH_0_LUT_LO_START_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_START_HIGH_0_LUT_LO_START_HIGH_FIELD			_MK_FIELD_CONST(0x3f, CDP_S_LUT_LO_START_HIGH_0_LUT_LO_START_HIGH_SHIFT)
+
+
+// Register CDP_S_LUT_LO_END_LOW_0
+#define CDP_S_LUT_LO_END_LOW_0			_MK_ADDR_CONST(0xd030)
+#define CDP_S_LUT_LO_END_LOW_0_LUT_LO_END_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_END_LOW_0_LUT_LO_END_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_S_LUT_LO_END_LOW_0_LUT_LO_END_LOW_SHIFT)
+
+
+// Register CDP_S_LUT_LO_END_HIGH_0
+#define CDP_S_LUT_LO_END_HIGH_0			_MK_ADDR_CONST(0xd034)
+#define CDP_S_LUT_LO_END_HIGH_0_LUT_LO_END_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_END_HIGH_0_LUT_LO_END_HIGH_FIELD			_MK_FIELD_CONST(0x3f, CDP_S_LUT_LO_END_HIGH_0_LUT_LO_END_HIGH_SHIFT)
+
+
+// Register CDP_S_LUT_LE_SLOPE_SCALE_0
+#define CDP_S_LUT_LE_SLOPE_SCALE_0			_MK_ADDR_CONST(0xd038)
+#define CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_UFLOW_SCALE_SHIFT)
+#define CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_S_LUT_LE_SLOPE_SCALE_0_LUT_LE_SLOPE_OFLOW_SCALE_SHIFT)
+
+
+// Register CDP_S_LUT_LE_SLOPE_SHIFT_0
+#define CDP_S_LUT_LE_SLOPE_SHIFT_0			_MK_ADDR_CONST(0xd03c)
+#define CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_UFLOW_SHIFT_SHIFT)
+#define CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(5)
+#define CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, CDP_S_LUT_LE_SLOPE_SHIFT_0_LUT_LE_SLOPE_OFLOW_SHIFT_SHIFT)
+
+
+// Register CDP_S_LUT_LO_SLOPE_SCALE_0
+#define CDP_S_LUT_LO_SLOPE_SCALE_0			_MK_ADDR_CONST(0xd040)
+#define CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_UFLOW_SCALE_SHIFT)
+#define CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_SHIFT			_MK_SHIFT_CONST(16)
+#define CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_S_LUT_LO_SLOPE_SCALE_0_LUT_LO_SLOPE_OFLOW_SCALE_SHIFT)
+
+
+// Register CDP_S_LUT_LO_SLOPE_SHIFT_0
+#define CDP_S_LUT_LO_SLOPE_SHIFT_0			_MK_ADDR_CONST(0xd044)
+#define CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_UFLOW_SHIFT_SHIFT)
+#define CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_SHIFT			_MK_SHIFT_CONST(5)
+#define CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_FIELD			_MK_FIELD_CONST(0x1f, CDP_S_LUT_LO_SLOPE_SHIFT_0_LUT_LO_SLOPE_OFLOW_SHIFT_SHIFT)
+
+
+// Register CDP_D_OP_ENABLE_0
+#define CDP_D_OP_ENABLE_0			_MK_ADDR_CONST(0xd048)
+#define CDP_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define CDP_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_FUNC_BYPASS_0
+#define CDP_D_FUNC_BYPASS_0			_MK_ADDR_CONST(0xd04c)
+#define CDP_D_FUNC_BYPASS_0_SQSUM_BYPASS_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_FUNC_BYPASS_0_SQSUM_BYPASS_FIELD			_MK_FIELD_CONST(0x1, CDP_D_FUNC_BYPASS_0_SQSUM_BYPASS_SHIFT)
+#define CDP_D_FUNC_BYPASS_0_SQSUM_BYPASS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_FUNC_BYPASS_0_SQSUM_BYPASS_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDP_D_FUNC_BYPASS_0_MUL_BYPASS_SHIFT			_MK_SHIFT_CONST(1)
+#define CDP_D_FUNC_BYPASS_0_MUL_BYPASS_FIELD			_MK_FIELD_CONST(0x1, CDP_D_FUNC_BYPASS_0_MUL_BYPASS_SHIFT)
+#define CDP_D_FUNC_BYPASS_0_MUL_BYPASS_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_FUNC_BYPASS_0_MUL_BYPASS_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_DST_BASE_ADDR_LOW_0
+#define CDP_D_DST_BASE_ADDR_LOW_0			_MK_ADDR_CONST(0xd050)
+#define CDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_DST_BASE_ADDR_LOW_0_DST_BASE_ADDR_LOW_SHIFT)
+
+
+// Register CDP_D_DST_BASE_ADDR_HIGH_0
+#define CDP_D_DST_BASE_ADDR_HIGH_0			_MK_ADDR_CONST(0xd054)
+#define CDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_DST_BASE_ADDR_HIGH_0_DST_BASE_ADDR_HIGH_SHIFT)
+
+
+// Register CDP_D_DST_LINE_STRIDE_0
+#define CDP_D_DST_LINE_STRIDE_0			_MK_ADDR_CONST(0xd058)
+#define CDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_DST_LINE_STRIDE_0_DST_LINE_STRIDE_SHIFT)
+
+
+// Register CDP_D_DST_SURFACE_STRIDE_0
+#define CDP_D_DST_SURFACE_STRIDE_0			_MK_ADDR_CONST(0xd05c)
+#define CDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_DST_SURFACE_STRIDE_0_DST_SURFACE_STRIDE_SHIFT)
+
+
+// Register CDP_D_DST_DMA_CFG_0
+#define CDP_D_DST_DMA_CFG_0			_MK_ADDR_CONST(0xd060)
+#define CDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, CDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_SHIFT)
+#define CDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_CV			_MK_ENUM_CONST(0x0)
+#define CDP_D_DST_DMA_CFG_0_DST_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_DST_COMPRESSION_EN_0
+#define CDP_D_DST_COMPRESSION_EN_0			_MK_ADDR_CONST(0xd064)
+#define CDP_D_DST_COMPRESSION_EN_0_DST_COMPRESSION_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DST_COMPRESSION_EN_0_DST_COMPRESSION_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_D_DST_COMPRESSION_EN_0_DST_COMPRESSION_EN_SHIFT)
+#define CDP_D_DST_COMPRESSION_EN_0_DST_COMPRESSION_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_DST_COMPRESSION_EN_0_DST_COMPRESSION_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_DATA_FORMAT_0
+#define CDP_D_DATA_FORMAT_0			_MK_ADDR_CONST(0xd068)
+#define CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_FIELD			_MK_FIELD_CONST(0x3, CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_SHIFT)
+#define CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_INT8			_MK_ENUM_CONST(0x0)
+#define CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_INT16			_MK_ENUM_CONST(0x1)
+#define CDP_D_DATA_FORMAT_0_INPUT_DATA_TYPE_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register CDP_D_NAN_FLUSH_TO_ZERO_0
+#define CDP_D_NAN_FLUSH_TO_ZERO_0			_MK_ADDR_CONST(0xd06c)
+#define CDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_FIELD			_MK_FIELD_CONST(0x1, CDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_SHIFT)
+#define CDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_NAN_FLUSH_TO_ZERO_0_NAN_TO_ZERO_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_LRN_CFG_0
+#define CDP_D_LRN_CFG_0			_MK_ADDR_CONST(0xd070)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_FIELD			_MK_FIELD_CONST(0x3, CDP_D_LRN_CFG_0_NORMALZ_LEN_SHIFT)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_LEN3			_MK_ENUM_CONST(0x0)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_LEN5			_MK_ENUM_CONST(0x1)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_LEN7			_MK_ENUM_CONST(0x2)
+#define CDP_D_LRN_CFG_0_NORMALZ_LEN_LEN9			_MK_ENUM_CONST(0x3)
+
+
+// Register CDP_D_DATIN_OFFSET_0
+#define CDP_D_DATIN_OFFSET_0			_MK_ADDR_CONST(0xd074)
+#define CDP_D_DATIN_OFFSET_0_DATIN_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATIN_OFFSET_0_DATIN_OFFSET_FIELD			_MK_FIELD_CONST(0xffff, CDP_D_DATIN_OFFSET_0_DATIN_OFFSET_SHIFT)
+
+
+// Register CDP_D_DATIN_SCALE_0
+#define CDP_D_DATIN_SCALE_0			_MK_ADDR_CONST(0xd078)
+#define CDP_D_DATIN_SCALE_0_DATIN_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATIN_SCALE_0_DATIN_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_D_DATIN_SCALE_0_DATIN_SCALE_SHIFT)
+
+
+// Register CDP_D_DATIN_SHIFTER_0
+#define CDP_D_DATIN_SHIFTER_0			_MK_ADDR_CONST(0xd07c)
+#define CDP_D_DATIN_SHIFTER_0_DATIN_SHIFTER_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATIN_SHIFTER_0_DATIN_SHIFTER_FIELD			_MK_FIELD_CONST(0x1f, CDP_D_DATIN_SHIFTER_0_DATIN_SHIFTER_SHIFT)
+
+
+// Register CDP_D_DATOUT_OFFSET_0
+#define CDP_D_DATOUT_OFFSET_0			_MK_ADDR_CONST(0xd080)
+#define CDP_D_DATOUT_OFFSET_0_DATOUT_OFFSET_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATOUT_OFFSET_0_DATOUT_OFFSET_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_DATOUT_OFFSET_0_DATOUT_OFFSET_SHIFT)
+
+
+// Register CDP_D_DATOUT_SCALE_0
+#define CDP_D_DATOUT_SCALE_0			_MK_ADDR_CONST(0xd084)
+#define CDP_D_DATOUT_SCALE_0_DATOUT_SCALE_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATOUT_SCALE_0_DATOUT_SCALE_FIELD			_MK_FIELD_CONST(0xffff, CDP_D_DATOUT_SCALE_0_DATOUT_SCALE_SHIFT)
+
+
+// Register CDP_D_DATOUT_SHIFTER_0
+#define CDP_D_DATOUT_SHIFTER_0			_MK_ADDR_CONST(0xd088)
+#define CDP_D_DATOUT_SHIFTER_0_DATOUT_SHIFTER_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_DATOUT_SHIFTER_0_DATOUT_SHIFTER_FIELD			_MK_FIELD_CONST(0x3f, CDP_D_DATOUT_SHIFTER_0_DATOUT_SHIFTER_SHIFT)
+
+
+// Register CDP_D_NAN_INPUT_NUM_0
+#define CDP_D_NAN_INPUT_NUM_0			_MK_ADDR_CONST(0xd08c)
+#define CDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_NAN_INPUT_NUM_0_NAN_INPUT_NUM_SHIFT)
+
+
+// Register CDP_D_INF_INPUT_NUM_0
+#define CDP_D_INF_INPUT_NUM_0			_MK_ADDR_CONST(0xd090)
+#define CDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_INF_INPUT_NUM_0_INF_INPUT_NUM_SHIFT)
+
+
+// Register CDP_D_NAN_OUTPUT_NUM_0
+#define CDP_D_NAN_OUTPUT_NUM_0			_MK_ADDR_CONST(0xd094)
+#define CDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_NAN_OUTPUT_NUM_0_NAN_OUTPUT_NUM_SHIFT)
+
+
+// Register CDP_D_OUT_SATURATION_0
+#define CDP_D_OUT_SATURATION_0			_MK_ADDR_CONST(0xd098)
+#define CDP_D_OUT_SATURATION_0_OUT_SATURATION_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_OUT_SATURATION_0_OUT_SATURATION_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_OUT_SATURATION_0_OUT_SATURATION_SHIFT)
+
+
+// Register CDP_D_PERF_ENABLE_0
+#define CDP_D_PERF_ENABLE_0			_MK_ADDR_CONST(0xd09c)
+#define CDP_D_PERF_ENABLE_0_DMA_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_ENABLE_0_DMA_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_D_PERF_ENABLE_0_DMA_EN_SHIFT)
+#define CDP_D_PERF_ENABLE_0_DMA_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_PERF_ENABLE_0_DMA_EN_ENABLE			_MK_ENUM_CONST(0x1)
+#define CDP_D_PERF_ENABLE_0_LUT_EN_SHIFT			_MK_SHIFT_CONST(1)
+#define CDP_D_PERF_ENABLE_0_LUT_EN_FIELD			_MK_FIELD_CONST(0x1, CDP_D_PERF_ENABLE_0_LUT_EN_SHIFT)
+#define CDP_D_PERF_ENABLE_0_LUT_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define CDP_D_PERF_ENABLE_0_LUT_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register CDP_D_PERF_WRITE_STALL_0
+#define CDP_D_PERF_WRITE_STALL_0			_MK_ADDR_CONST(0xd0a0)
+#define CDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_WRITE_STALL_0_PERF_WRITE_STALL_SHIFT)
+
+
+// Register CDP_D_PERF_LUT_UFLOW_0
+#define CDP_D_PERF_LUT_UFLOW_0			_MK_ADDR_CONST(0xd0a4)
+#define CDP_D_PERF_LUT_UFLOW_0_PERF_LUT_UFLOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_LUT_UFLOW_0_PERF_LUT_UFLOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_LUT_UFLOW_0_PERF_LUT_UFLOW_SHIFT)
+
+
+// Register CDP_D_PERF_LUT_OFLOW_0
+#define CDP_D_PERF_LUT_OFLOW_0			_MK_ADDR_CONST(0xd0a8)
+#define CDP_D_PERF_LUT_OFLOW_0_PERF_LUT_OFLOW_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_LUT_OFLOW_0_PERF_LUT_OFLOW_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_LUT_OFLOW_0_PERF_LUT_OFLOW_SHIFT)
+
+
+// Register CDP_D_PERF_LUT_HYBRID_0
+#define CDP_D_PERF_LUT_HYBRID_0			_MK_ADDR_CONST(0xd0ac)
+#define CDP_D_PERF_LUT_HYBRID_0_PERF_LUT_HYBRID_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_LUT_HYBRID_0_PERF_LUT_HYBRID_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_LUT_HYBRID_0_PERF_LUT_HYBRID_SHIFT)
+
+
+// Register CDP_D_PERF_LUT_LE_HIT_0
+#define CDP_D_PERF_LUT_LE_HIT_0			_MK_ADDR_CONST(0xd0b0)
+#define CDP_D_PERF_LUT_LE_HIT_0_PERF_LUT_LE_HIT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_LUT_LE_HIT_0_PERF_LUT_LE_HIT_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_LUT_LE_HIT_0_PERF_LUT_LE_HIT_SHIFT)
+
+
+// Register CDP_D_PERF_LUT_LO_HIT_0
+#define CDP_D_PERF_LUT_LO_HIT_0			_MK_ADDR_CONST(0xd0b4)
+#define CDP_D_PERF_LUT_LO_HIT_0_PERF_LUT_LO_HIT_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_PERF_LUT_LO_HIT_0_PERF_LUT_LO_HIT_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_PERF_LUT_LO_HIT_0_PERF_LUT_LO_HIT_SHIFT)
+
+
+// Register CDP_D_CYA_0
+#define CDP_D_CYA_0			_MK_ADDR_CONST(0xd0b8)
+#define CDP_D_CYA_0_CYA_SHIFT			_MK_SHIFT_CONST(0)
+#define CDP_D_CYA_0_CYA_FIELD			_MK_FIELD_CONST(0xffffffff, CDP_D_CYA_0_CYA_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register NVDLA_GEC_FEATURE_0
+#define NVDLA_GEC_FEATURE_0			_MK_ADDR_CONST(0xe000)
+#define NVDLA_GEC_FEATURE_0_NUM_ERR_SLICES_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_FEATURE_0_NUM_ERR_SLICES_FIELD			_MK_FIELD_CONST(0x3f, NVDLA_GEC_FEATURE_0_NUM_ERR_SLICES_SHIFT)
+#define NVDLA_GEC_FEATURE_0_NUM_ERR_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_FEATURE_0_NUM_ERR_FIELD			_MK_FIELD_CONST(0xffff, NVDLA_GEC_FEATURE_0_NUM_ERR_SHIFT)
+
+
+// Register NVDLA_GEC_SWRESET_0
+#define NVDLA_GEC_SWRESET_0			_MK_ADDR_CONST(0xe004)
+#define NVDLA_GEC_SWRESET_0_SWRST_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_SWRESET_0_SWRST_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_SWRESET_0_SWRST_SHIFT)
+
+
+// Register NVDLA_GEC_MISSIONERR_TYPE_0
+#define NVDLA_GEC_MISSIONERR_TYPE_0			_MK_ADDR_CONST(0xe008)
+#define NVDLA_GEC_MISSIONERR_TYPE_0_CODE_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_MISSIONERR_TYPE_0_CODE_FIELD			_MK_FIELD_CONST(0x3f, NVDLA_GEC_MISSIONERR_TYPE_0_CODE_SHIFT)
+
+
+// Register NVDLA_GEC_CURRENT_COUNTER_VALUE_0
+#define NVDLA_GEC_CURRENT_COUNTER_VALUE_0			_MK_ADDR_CONST(0xe00c)
+#define NVDLA_GEC_CURRENT_COUNTER_VALUE_0_VALUE_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_CURRENT_COUNTER_VALUE_0_VALUE_FIELD			_MK_FIELD_CONST(0x1ff, NVDLA_GEC_CURRENT_COUNTER_VALUE_0_VALUE_SHIFT)
+
+
+// Register NVDLA_GEC_MISSIONERR_INDEX_0
+#define NVDLA_GEC_MISSIONERR_INDEX_0			_MK_ADDR_CONST(0xe014)
+#define NVDLA_GEC_MISSIONERR_INDEX_0_IDX_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_MISSIONERR_INDEX_0_IDX_FIELD			_MK_FIELD_CONST(0x7f, NVDLA_GEC_MISSIONERR_INDEX_0_IDX_SHIFT)
+
+
+// Register NVDLA_GEC_CORRECTABLE_THRESHOLD_0
+#define NVDLA_GEC_CORRECTABLE_THRESHOLD_0			_MK_ADDR_CONST(0xe018)
+#define NVDLA_GEC_CORRECTABLE_THRESHOLD_0_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_CORRECTABLE_THRESHOLD_0_COUNT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_GEC_CORRECTABLE_THRESHOLD_0_COUNT_SHIFT)
+
+
+// Register NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0
+#define NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0			_MK_ADDR_CONST(0xe01c)
+#define NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0_VALUE_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0_VALUE_FIELD			_MK_FIELD_CONST(0xff, NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0_VALUE_SHIFT)
+#define NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0_VALUE_LOCK			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_MISSIONERR_INJECT_UNLOCK_0_VALUE_UNLOCK			_MK_ENUM_CONST(0xe1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0			_MK_ADDR_CONST(0xe030)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR0_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR0_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR1_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR1_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR2_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR2_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR3_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR3_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR4_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR4_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR5_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR5_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR6_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR6_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR7_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR7_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR8_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR8_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR9_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR9_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR10_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR10_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR11_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR11_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR12_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR12_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR13_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR13_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR14_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR14_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR15_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR15_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR16_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR16_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR17_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR17_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR18_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR18_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR19_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR19_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR20_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR20_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR21_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR21_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR22_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR22_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR23_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR23_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR24_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR24_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR25_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR25_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR26_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR26_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR27_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR27_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR28_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR28_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR29_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR29_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR30_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR30_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR31_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_ENABLE_0_ERR31_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0			_MK_ADDR_CONST(0xe034)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR0_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR0_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR1_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR1_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR2_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR2_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR3_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR3_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR4_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR4_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR5_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR5_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR6_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR6_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR7_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR7_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR8_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR8_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR9_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR9_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR10_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR10_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR11_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR11_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR12_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR12_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR13_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR13_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR14_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR14_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR15_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR15_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR16_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR16_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR17_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR17_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR18_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR18_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR19_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR19_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR20_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR20_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR21_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR21_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR22_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR22_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR23_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR23_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR24_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR24_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR25_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR25_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR26_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR26_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR27_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR27_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR28_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR28_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR29_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR29_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR30_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR30_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR31_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_FORCE_0_ERR31_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0			_MK_ADDR_CONST(0xe038)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_STATUS_0_ERR31_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0			_MK_ADDR_CONST(0xe03c)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR0_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR0_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR1_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR1_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR2_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR2_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR3_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR3_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR4_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR4_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR5_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR5_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR6_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR6_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR7_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR7_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR8_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR8_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR15_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR15_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR16_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR16_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR17_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR17_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR18_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR18_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR19_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR19_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR20_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR20_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR21_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR21_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR22_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR22_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR23_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR23_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR24_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR24_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR25_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR25_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR26_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR26_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR27_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR27_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR28_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR28_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR29_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR29_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR30_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR30_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR31_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_MISSIONERR_INJECT_0_ERR31_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0			_MK_ADDR_CONST(0xe040)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR0_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR0_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR1_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR1_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR2_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR2_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR3_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR3_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR4_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR4_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR5_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR5_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR6_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR6_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR7_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR7_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR8_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR8_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR9_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR9_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR10_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR10_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR11_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR11_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR12_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR12_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR13_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR13_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR14_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR14_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR15_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR15_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR16_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR16_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR17_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR17_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR18_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR18_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR19_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR19_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR20_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR20_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR21_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR21_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR22_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR22_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR23_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR23_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR24_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR24_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR25_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR25_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR26_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR26_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR27_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR27_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR28_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR28_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR29_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR29_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR30_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR30_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR31_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_ENABLE_0_ERR31_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0			_MK_ADDR_CONST(0xe044)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR0_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR0_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR1_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR1_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR2_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR2_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR3_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR3_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR4_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR4_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR5_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR5_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR6_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR6_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR7_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR7_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR8_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR8_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR9_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR9_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR10_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR10_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR11_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR11_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR12_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR12_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR13_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR13_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR14_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR14_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR15_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR15_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR16_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR16_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR17_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR17_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR18_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR18_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR19_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR19_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR20_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR20_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR21_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR21_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR22_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR22_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR23_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR23_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR24_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR24_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR25_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR25_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR26_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR26_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR27_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR27_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR28_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR28_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR29_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR29_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR30_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR30_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR31_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_FORCE_0_ERR31_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0			_MK_ADDR_CONST(0xe048)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_LATENTERR_STATUS_0_ERR31_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0			_MK_ADDR_CONST(0xe050)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR0_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR0_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR0_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR0_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR0_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR1_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR1_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR1_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR1_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR1_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR2_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR2_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR2_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR2_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR2_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR3_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR3_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR3_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR3_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR3_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR4_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR4_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR4_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR4_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR4_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR5_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR5_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR5_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR5_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR5_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR6_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR6_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR6_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR6_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR6_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR7_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR7_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR7_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR7_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR7_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR8_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR8_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR8_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR8_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR8_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR9_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR9_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR9_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR9_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR9_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR10_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR10_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR10_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR10_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR10_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR11_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR11_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR11_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR11_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR11_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR12_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR12_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR12_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR12_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR12_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR13_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR13_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR13_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR13_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR13_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR14_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR14_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR14_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR14_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR14_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR15_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR15_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR15_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR15_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR15_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR16_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR16_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR16_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR16_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR16_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR17_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR17_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR17_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR17_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR17_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR18_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR18_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR18_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR18_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR18_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR19_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR19_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR19_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR19_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR19_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR20_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR20_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR20_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR20_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR20_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR21_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR21_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR21_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR21_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR21_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR22_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR22_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR22_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR22_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR22_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR23_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR23_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR23_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR23_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR23_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR24_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR24_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR24_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR24_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR24_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR25_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR25_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR25_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR25_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR25_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR26_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR26_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR26_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR26_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR26_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR27_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR27_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR27_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR27_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR27_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR28_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR28_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR28_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR28_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR28_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR29_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR29_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR29_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR29_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR29_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR30_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR30_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR30_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR30_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR30_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR31_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR31_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR31_SHIFT)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR31_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE0_COUNTER_RELOAD_0_ERR31_RELOAD			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0			_MK_ADDR_CONST(0xe060)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR32_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR32_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR33_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR33_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR34_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR34_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR35_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR35_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR36_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR36_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR37_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR37_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR38_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR38_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR39_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR39_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR40_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR40_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR41_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR41_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR42_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR42_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR43_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR43_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR44_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR44_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR45_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR45_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR46_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR46_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR47_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR47_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR48_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR48_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR49_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR49_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR50_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR50_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR51_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR51_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR52_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR52_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR53_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR53_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR54_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR54_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR55_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR55_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR56_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR56_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR57_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR57_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR58_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR58_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR59_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR59_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR60_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR60_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR61_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR61_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR62_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR62_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR63_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ENABLE_0_ERR63_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0			_MK_ADDR_CONST(0xe064)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR32_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR32_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR33_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR33_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR34_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR34_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR35_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR35_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR36_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR36_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR37_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR37_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR38_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR38_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR39_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR39_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR40_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR40_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR41_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR41_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR42_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR42_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR43_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR43_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR44_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR44_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR45_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR45_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR46_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR46_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR47_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR47_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR48_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR48_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR49_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR49_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR50_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR50_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR51_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR51_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR52_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR52_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR53_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR53_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR54_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR54_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR55_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR55_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR56_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR56_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR57_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR57_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR58_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR58_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR59_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR59_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR60_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR60_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR61_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR61_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR62_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR62_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR63_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_FORCE_0_ERR63_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0			_MK_ADDR_CONST(0xe068)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_STATUS_0_ERR63_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0			_MK_ADDR_CONST(0xe06c)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR32_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR32_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR33_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR33_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR34_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR34_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR35_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR35_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR36_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR36_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR37_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR37_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR38_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR38_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR39_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR39_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR40_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR40_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR41_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR41_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR42_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR42_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR43_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR43_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR44_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR44_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR45_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR45_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR46_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR46_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR47_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR47_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR48_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR48_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR49_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR49_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR50_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR50_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR51_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR51_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR52_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR52_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR53_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR53_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR54_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR54_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR55_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR55_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR56_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR56_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR57_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR57_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR58_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR58_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR59_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR59_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR60_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR60_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR61_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR61_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR62_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR62_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR63_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_INJECT_0_ERR63_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0			_MK_ADDR_CONST(0xe070)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR32_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR32_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR33_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR33_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR34_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR34_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR35_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR35_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR36_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR36_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR37_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR37_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR38_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR38_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR39_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR39_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR40_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR40_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR41_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR41_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR42_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR42_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR43_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR43_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR44_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR44_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR45_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR45_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR46_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR46_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR47_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR47_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR48_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR48_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR49_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR49_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR50_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR50_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR51_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR51_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR52_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR52_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR53_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR53_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR54_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR54_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR55_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR55_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR56_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR56_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR57_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR57_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR58_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR58_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR59_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR59_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR60_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR60_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR61_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR61_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR62_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR62_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR63_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_ENABLE_0_ERR63_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0			_MK_ADDR_CONST(0xe074)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR32_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR32_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR33_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR33_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR34_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR34_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR35_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR35_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR36_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR36_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR37_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR37_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR38_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR38_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR39_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR39_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR40_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR40_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR41_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR41_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR42_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR42_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR43_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR43_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR44_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR44_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR45_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR45_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR46_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR46_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR47_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR47_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR48_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR48_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR49_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR49_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR50_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR50_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR51_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR51_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR52_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR52_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR53_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR53_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR54_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR54_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR55_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR55_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR56_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR56_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR57_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR57_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR58_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR58_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR59_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR59_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR60_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR60_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR61_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR61_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR62_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR62_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR63_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_FORCE_0_ERR63_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0			_MK_ADDR_CONST(0xe078)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_LATENTERR_STATUS_0_ERR63_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0			_MK_ADDR_CONST(0xe080)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR32_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR32_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR32_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR32_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR32_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR33_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR33_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR33_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR33_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR33_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR34_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR34_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR34_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR34_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR34_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR35_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR35_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR35_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR35_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR35_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR36_SHIFT			_MK_SHIFT_CONST(4)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR36_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR36_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR36_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR36_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR37_SHIFT			_MK_SHIFT_CONST(5)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR37_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR37_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR37_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR37_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR38_SHIFT			_MK_SHIFT_CONST(6)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR38_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR38_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR38_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR38_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR39_SHIFT			_MK_SHIFT_CONST(7)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR39_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR39_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR39_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR39_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR40_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR40_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR40_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR40_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR40_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR41_SHIFT			_MK_SHIFT_CONST(9)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR41_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR41_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR41_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR41_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR42_SHIFT			_MK_SHIFT_CONST(10)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR42_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR42_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR42_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR42_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR43_SHIFT			_MK_SHIFT_CONST(11)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR43_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR43_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR43_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR43_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR44_SHIFT			_MK_SHIFT_CONST(12)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR44_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR44_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR44_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR44_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR45_SHIFT			_MK_SHIFT_CONST(13)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR45_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR45_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR45_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR45_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR46_SHIFT			_MK_SHIFT_CONST(14)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR46_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR46_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR46_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR46_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR47_SHIFT			_MK_SHIFT_CONST(15)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR47_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR47_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR47_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR47_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR48_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR48_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR48_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR48_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR48_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR49_SHIFT			_MK_SHIFT_CONST(17)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR49_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR49_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR49_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR49_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR50_SHIFT			_MK_SHIFT_CONST(18)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR50_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR50_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR50_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR50_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR51_SHIFT			_MK_SHIFT_CONST(19)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR51_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR51_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR51_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR51_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR52_SHIFT			_MK_SHIFT_CONST(20)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR52_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR52_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR52_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR52_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR53_SHIFT			_MK_SHIFT_CONST(21)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR53_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR53_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR53_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR53_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR54_SHIFT			_MK_SHIFT_CONST(22)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR54_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR54_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR54_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR54_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR55_SHIFT			_MK_SHIFT_CONST(23)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR55_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR55_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR55_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR55_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR56_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR56_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR56_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR56_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR56_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR57_SHIFT			_MK_SHIFT_CONST(25)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR57_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR57_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR57_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR57_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR58_SHIFT			_MK_SHIFT_CONST(26)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR58_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR58_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR58_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR58_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR59_SHIFT			_MK_SHIFT_CONST(27)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR59_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR59_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR59_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR59_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR60_SHIFT			_MK_SHIFT_CONST(28)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR60_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR60_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR60_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR60_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR61_SHIFT			_MK_SHIFT_CONST(29)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR61_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR61_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR61_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR61_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR62_SHIFT			_MK_SHIFT_CONST(30)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR62_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR62_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR62_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR62_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR63_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_COUNTER_RELOAD_0_ERR63_RELOAD			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0			_MK_ADDR_CONST(0xe084)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0_ERR63_SHIFT			_MK_SHIFT_CONST(31)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0_ERR63_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0_ERR63_SHIFT)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0_ERR63_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE1_MISSIONERR_ECC_CORRECTION_DIS_0_ERR63_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0			_MK_ADDR_CONST(0xe090)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR64_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR64_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR65_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR65_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR66_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR66_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR67_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR67_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_ENABLE_0_ERR67_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0			_MK_ADDR_CONST(0xe094)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR64_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR64_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR65_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR65_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR66_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR66_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR67_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR67_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_FORCE_0_ERR67_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0			_MK_ADDR_CONST(0xe098)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_STATUS_0_ERR67_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0			_MK_ADDR_CONST(0xe09c)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR64_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR64_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR65_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_MISSIONERR_INJECT_0_ERR65_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0			_MK_ADDR_CONST(0xe0a0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR64_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR64_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR65_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR65_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR66_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR66_ENABLE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR67_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR67_DISABLE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_ENABLE_0_ERR67_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0			_MK_ADDR_CONST(0xe0a4)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR64_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR64_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR65_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR65_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR66_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR66_FORCE			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR67_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR67_NOFORCE			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_FORCE_0_ERR67_FORCE			_MK_ENUM_CONST(0x1)
+
+
+// Register NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0			_MK_ADDR_CONST(0xe0a8)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_LATENTERR_STATUS_0_ERR67_SHIFT)
+
+
+// Register NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0			_MK_ADDR_CONST(0xe0b0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR64_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR64_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR64_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR64_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR64_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR65_SHIFT			_MK_SHIFT_CONST(1)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR65_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR65_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR65_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR65_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR66_SHIFT			_MK_SHIFT_CONST(2)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR66_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR66_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR66_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR66_RELOAD			_MK_ENUM_CONST(0x1)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR67_SHIFT			_MK_SHIFT_CONST(3)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR67_FIELD			_MK_FIELD_CONST(0x1, NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR67_SHIFT)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR67_NORELOAD			_MK_ENUM_CONST(0x0)
+#define NVDLA_GEC_ERRSLICE2_COUNTER_RELOAD_0_ERR67_RELOAD			_MK_ENUM_CONST(0x1)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register NVDLA_CVIF_CFG_RD_WEIGHT_0_0
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0			_MK_ADDR_CONST(0xf000)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_BDMA_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_SDP_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_PDP_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_0_0_RD_WEIGHT_CDP_SHIFT)
+
+
+// Register NVDLA_CVIF_CFG_RD_WEIGHT_1_0
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0			_MK_ADDR_CONST(0xf004)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_B_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_N_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_SDP_E_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_1_0_RD_WEIGHT_CDMA_DAT_SHIFT)
+
+
+// Register NVDLA_CVIF_CFG_RD_WEIGHT_2_0
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0			_MK_ADDR_CONST(0xf008)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_CDMA_WT_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RBK_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_1_SHIFT)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_RD_WEIGHT_2_0_RD_WEIGHT_RSV_0_SHIFT)
+
+
+// Register NVDLA_CVIF_CFG_WR_WEIGHT_0_0
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0			_MK_ADDR_CONST(0xf00c)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_BDMA_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_SDP_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_PDP_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_0_0_WR_WEIGHT_CDP_SHIFT)
+
+
+// Register NVDLA_CVIF_CFG_WR_WEIGHT_1_0
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0			_MK_ADDR_CONST(0xf010)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RBK_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_2_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_SHIFT			_MK_SHIFT_CONST(16)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_1_SHIFT)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_SHIFT			_MK_SHIFT_CONST(24)
+#define NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_WR_WEIGHT_1_0_WR_WEIGHT_RSV_0_SHIFT)
+
+
+// Register NVDLA_CVIF_CFG_OUTSTANDING_CNT_0
+#define NVDLA_CVIF_CFG_OUTSTANDING_CNT_0			_MK_ADDR_CONST(0xf014)
+#define NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_SHIFT			_MK_SHIFT_CONST(0)
+#define NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_RD_OS_CNT_SHIFT)
+#define NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_FIELD			_MK_FIELD_CONST(0xff, NVDLA_CVIF_CFG_OUTSTANDING_CNT_0_WR_OS_CNT_SHIFT)
+
+
+// Register NVDLA_CVIF_STATUS_0
+#define NVDLA_CVIF_STATUS_0			_MK_ADDR_CONST(0xf018)
+#define NVDLA_CVIF_STATUS_0_IDLE_SHIFT			_MK_SHIFT_CONST(8)
+#define NVDLA_CVIF_STATUS_0_IDLE_FIELD			_MK_FIELD_CONST(0x1, NVDLA_CVIF_STATUS_0_IDLE_SHIFT)
+#define NVDLA_CVIF_STATUS_0_IDLE_NO			_MK_ENUM_CONST(0x0)
+#define NVDLA_CVIF_STATUS_0_IDLE_YES			_MK_ENUM_CONST(0x1)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register BDMA_CFG_SRC_ADDR_LOW_0
+#define BDMA_CFG_SRC_ADDR_LOW_0			_MK_ADDR_CONST(0x10000)
+#define BDMA_CFG_SRC_ADDR_LOW_0_V32_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_SRC_ADDR_LOW_0_V32_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_SRC_ADDR_LOW_0_V32_SHIFT)
+
+
+// Register BDMA_CFG_SRC_ADDR_HIGH_0
+#define BDMA_CFG_SRC_ADDR_HIGH_0			_MK_ADDR_CONST(0x10004)
+#define BDMA_CFG_SRC_ADDR_HIGH_0_V8_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_SRC_ADDR_HIGH_0_V8_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_CFG_SRC_ADDR_HIGH_0_V8_SHIFT)
+
+
+// Register BDMA_CFG_DST_ADDR_LOW_0
+#define BDMA_CFG_DST_ADDR_LOW_0			_MK_ADDR_CONST(0x10008)
+#define BDMA_CFG_DST_ADDR_LOW_0_V32_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_DST_ADDR_LOW_0_V32_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_DST_ADDR_LOW_0_V32_SHIFT)
+
+
+// Register BDMA_CFG_DST_ADDR_HIGH_0
+#define BDMA_CFG_DST_ADDR_HIGH_0			_MK_ADDR_CONST(0x1000c)
+#define BDMA_CFG_DST_ADDR_HIGH_0_V8_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_DST_ADDR_HIGH_0_V8_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_CFG_DST_ADDR_HIGH_0_V8_SHIFT)
+
+
+// Register BDMA_CFG_LINE_0
+#define BDMA_CFG_LINE_0			_MK_ADDR_CONST(0x10010)
+#define BDMA_CFG_LINE_0_SIZE_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_LINE_0_SIZE_FIELD			_MK_FIELD_CONST(0x1fff, BDMA_CFG_LINE_0_SIZE_SHIFT)
+
+
+// Register BDMA_CFG_CMD_0
+#define BDMA_CFG_CMD_0			_MK_ADDR_CONST(0x10014)
+#define BDMA_CFG_CMD_0_SRC_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_CMD_0_SRC_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_CMD_0_SRC_RAM_TYPE_SHIFT)
+#define BDMA_CFG_CMD_0_SRC_RAM_TYPE_CVSRAM			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_CMD_0_SRC_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+#define BDMA_CFG_CMD_0_DST_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(1)
+#define BDMA_CFG_CMD_0_DST_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_CMD_0_DST_RAM_TYPE_SHIFT)
+#define BDMA_CFG_CMD_0_DST_RAM_TYPE_CVSRAM			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_CMD_0_DST_RAM_TYPE_MC			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_CFG_LINE_REPEAT_0
+#define BDMA_CFG_LINE_REPEAT_0			_MK_ADDR_CONST(0x10018)
+#define BDMA_CFG_LINE_REPEAT_0_NUMBER_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_LINE_REPEAT_0_NUMBER_FIELD			_MK_FIELD_CONST(0xffffff, BDMA_CFG_LINE_REPEAT_0_NUMBER_SHIFT)
+
+
+// Register BDMA_CFG_SRC_LINE_0
+#define BDMA_CFG_SRC_LINE_0			_MK_ADDR_CONST(0x1001c)
+#define BDMA_CFG_SRC_LINE_0_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_SRC_LINE_0_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_SRC_LINE_0_STRIDE_SHIFT)
+
+
+// Register BDMA_CFG_DST_LINE_0
+#define BDMA_CFG_DST_LINE_0			_MK_ADDR_CONST(0x10020)
+#define BDMA_CFG_DST_LINE_0_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_DST_LINE_0_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_DST_LINE_0_STRIDE_SHIFT)
+
+
+// Register BDMA_CFG_SURF_REPEAT_0
+#define BDMA_CFG_SURF_REPEAT_0			_MK_ADDR_CONST(0x10024)
+#define BDMA_CFG_SURF_REPEAT_0_NUMBER_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_SURF_REPEAT_0_NUMBER_FIELD			_MK_FIELD_CONST(0xffffff, BDMA_CFG_SURF_REPEAT_0_NUMBER_SHIFT)
+
+
+// Register BDMA_CFG_SRC_SURF_0
+#define BDMA_CFG_SRC_SURF_0			_MK_ADDR_CONST(0x10028)
+#define BDMA_CFG_SRC_SURF_0_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_SRC_SURF_0_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_SRC_SURF_0_STRIDE_SHIFT)
+
+
+// Register BDMA_CFG_DST_SURF_0
+#define BDMA_CFG_DST_SURF_0			_MK_ADDR_CONST(0x1002c)
+#define BDMA_CFG_DST_SURF_0_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define BDMA_CFG_DST_SURF_0_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, BDMA_CFG_DST_SURF_0_STRIDE_SHIFT)
+
+
+// Register BDMA_CFG_OP_0
+#define BDMA_CFG_OP_0			_MK_ADDR_CONST(0x10030)
+#define BDMA_CFG_OP_0_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_OP_0_EN_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_OP_0_EN_SHIFT)
+#define BDMA_CFG_OP_0_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_OP_0_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_CFG_LAUNCH0_0
+#define BDMA_CFG_LAUNCH0_0			_MK_ADDR_CONST(0x10034)
+#define BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_SHIFT)
+#define BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_CFG_LAUNCH1_0
+#define BDMA_CFG_LAUNCH1_0			_MK_ADDR_CONST(0x10038)
+#define BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_SHIFT)
+#define BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_CFG_STATUS_0
+#define BDMA_CFG_STATUS_0			_MK_ADDR_CONST(0x1003c)
+#define BDMA_CFG_STATUS_0_STALL_COUNT_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_CFG_STATUS_0_STALL_COUNT_EN_FIELD			_MK_FIELD_CONST(0x1, BDMA_CFG_STATUS_0_STALL_COUNT_EN_SHIFT)
+#define BDMA_CFG_STATUS_0_STALL_COUNT_EN_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_CFG_STATUS_0_STALL_COUNT_EN_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_STATUS_0
+#define BDMA_STATUS_0			_MK_ADDR_CONST(0x10040)
+#define BDMA_STATUS_0_FREE_SLOT_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_STATUS_0_FREE_SLOT_FIELD			_MK_FIELD_CONST(0xff, BDMA_STATUS_0_FREE_SLOT_SHIFT)
+#define BDMA_STATUS_0_IDLE_SHIFT			_MK_SHIFT_CONST(8)
+#define BDMA_STATUS_0_IDLE_FIELD			_MK_FIELD_CONST(0x1, BDMA_STATUS_0_IDLE_SHIFT)
+#define BDMA_STATUS_0_IDLE_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_STATUS_0_IDLE_YES			_MK_ENUM_CONST(0x1)
+#define BDMA_STATUS_0_GRP0_BUSY_SHIFT			_MK_SHIFT_CONST(9)
+#define BDMA_STATUS_0_GRP0_BUSY_FIELD			_MK_FIELD_CONST(0x1, BDMA_STATUS_0_GRP0_BUSY_SHIFT)
+#define BDMA_STATUS_0_GRP0_BUSY_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_STATUS_0_GRP0_BUSY_YES			_MK_ENUM_CONST(0x1)
+#define BDMA_STATUS_0_GRP1_BUSY_SHIFT			_MK_SHIFT_CONST(10)
+#define BDMA_STATUS_0_GRP1_BUSY_FIELD			_MK_FIELD_CONST(0x1, BDMA_STATUS_0_GRP1_BUSY_SHIFT)
+#define BDMA_STATUS_0_GRP1_BUSY_NO			_MK_ENUM_CONST(0x0)
+#define BDMA_STATUS_0_GRP1_BUSY_YES			_MK_ENUM_CONST(0x1)
+
+
+// Register BDMA_STATUS_GRP0_READ_STALL_0
+#define BDMA_STATUS_GRP0_READ_STALL_0			_MK_ADDR_CONST(0x10044)
+#define BDMA_STATUS_GRP0_READ_STALL_0_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_STATUS_GRP0_READ_STALL_0_COUNT_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_STATUS_GRP0_READ_STALL_0_COUNT_SHIFT)
+
+
+// Register BDMA_STATUS_GRP0_WRITE_STALL_0
+#define BDMA_STATUS_GRP0_WRITE_STALL_0			_MK_ADDR_CONST(0x10048)
+#define BDMA_STATUS_GRP0_WRITE_STALL_0_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_STATUS_GRP0_WRITE_STALL_0_COUNT_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_STATUS_GRP0_WRITE_STALL_0_COUNT_SHIFT)
+
+
+// Register BDMA_STATUS_GRP1_READ_STALL_0
+#define BDMA_STATUS_GRP1_READ_STALL_0			_MK_ADDR_CONST(0x1004c)
+#define BDMA_STATUS_GRP1_READ_STALL_0_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_STATUS_GRP1_READ_STALL_0_COUNT_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_STATUS_GRP1_READ_STALL_0_COUNT_SHIFT)
+
+
+// Register BDMA_STATUS_GRP1_WRITE_STALL_0
+#define BDMA_STATUS_GRP1_WRITE_STALL_0			_MK_ADDR_CONST(0x10050)
+#define BDMA_STATUS_GRP1_WRITE_STALL_0_COUNT_SHIFT			_MK_SHIFT_CONST(0)
+#define BDMA_STATUS_GRP1_WRITE_STALL_0_COUNT_FIELD			_MK_FIELD_CONST(0xffffffff, BDMA_STATUS_GRP1_WRITE_STALL_0_COUNT_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+// Register RBK_S_STATUS_0
+#define RBK_S_STATUS_0			_MK_ADDR_CONST(0x11000)
+#define RBK_S_STATUS_0_STATUS_0_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_S_STATUS_0_STATUS_0_FIELD			_MK_FIELD_CONST(0x3, RBK_S_STATUS_0_STATUS_0_SHIFT)
+#define RBK_S_STATUS_0_STATUS_0_IDLE			_MK_ENUM_CONST(0x0)
+#define RBK_S_STATUS_0_STATUS_0_RUNNING			_MK_ENUM_CONST(0x1)
+#define RBK_S_STATUS_0_STATUS_0_PENDING			_MK_ENUM_CONST(0x2)
+#define RBK_S_STATUS_0_STATUS_1_SHIFT			_MK_SHIFT_CONST(16)
+#define RBK_S_STATUS_0_STATUS_1_FIELD			_MK_FIELD_CONST(0x3, RBK_S_STATUS_0_STATUS_1_SHIFT)
+#define RBK_S_STATUS_0_STATUS_1_IDLE			_MK_ENUM_CONST(0x0)
+#define RBK_S_STATUS_0_STATUS_1_RUNNING			_MK_ENUM_CONST(0x1)
+#define RBK_S_STATUS_0_STATUS_1_PENDING			_MK_ENUM_CONST(0x2)
+
+
+// Register RBK_S_POINTER_0
+#define RBK_S_POINTER_0			_MK_ADDR_CONST(0x11004)
+#define RBK_S_POINTER_0_PRODUCER_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_S_POINTER_0_PRODUCER_FIELD			_MK_FIELD_CONST(0x1, RBK_S_POINTER_0_PRODUCER_SHIFT)
+#define RBK_S_POINTER_0_PRODUCER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define RBK_S_POINTER_0_PRODUCER_GROUP_1			_MK_ENUM_CONST(0x1)
+#define RBK_S_POINTER_0_CONSUMER_SHIFT			_MK_SHIFT_CONST(16)
+#define RBK_S_POINTER_0_CONSUMER_FIELD			_MK_FIELD_CONST(0x1, RBK_S_POINTER_0_CONSUMER_SHIFT)
+#define RBK_S_POINTER_0_CONSUMER_GROUP_0			_MK_ENUM_CONST(0x0)
+#define RBK_S_POINTER_0_CONSUMER_GROUP_1			_MK_ENUM_CONST(0x1)
+
+
+// Register RBK_D_OP_ENABLE_0
+#define RBK_D_OP_ENABLE_0			_MK_ADDR_CONST(0x11008)
+#define RBK_D_OP_ENABLE_0_OP_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_OP_ENABLE_0_OP_EN_FIELD			_MK_FIELD_CONST(0x1, RBK_D_OP_ENABLE_0_OP_EN_SHIFT)
+#define RBK_D_OP_ENABLE_0_OP_EN_DISABLE			_MK_ENUM_CONST(0x0)
+#define RBK_D_OP_ENABLE_0_OP_EN_ENABLE			_MK_ENUM_CONST(0x1)
+
+
+// Register RBK_D_MISC_CFG_0
+#define RBK_D_MISC_CFG_0			_MK_ADDR_CONST(0x1100c)
+#define RBK_D_MISC_CFG_0_RUBIK_MODE_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_MISC_CFG_0_RUBIK_MODE_FIELD			_MK_FIELD_CONST(0x3, RBK_D_MISC_CFG_0_RUBIK_MODE_SHIFT)
+#define RBK_D_MISC_CFG_0_RUBIK_MODE_CONTRACT			_MK_ENUM_CONST(0x0)
+#define RBK_D_MISC_CFG_0_RUBIK_MODE_SPLIT			_MK_ENUM_CONST(0x1)
+#define RBK_D_MISC_CFG_0_RUBIK_MODE_MERGE			_MK_ENUM_CONST(0x2)
+#define RBK_D_MISC_CFG_0_IN_PRECISION_SHIFT			_MK_SHIFT_CONST(8)
+#define RBK_D_MISC_CFG_0_IN_PRECISION_FIELD			_MK_FIELD_CONST(0x3, RBK_D_MISC_CFG_0_IN_PRECISION_SHIFT)
+#define RBK_D_MISC_CFG_0_IN_PRECISION_INT8			_MK_ENUM_CONST(0x0)
+#define RBK_D_MISC_CFG_0_IN_PRECISION_INT16			_MK_ENUM_CONST(0x1)
+#define RBK_D_MISC_CFG_0_IN_PRECISION_FP16			_MK_ENUM_CONST(0x2)
+
+
+// Register RBK_D_DAIN_RAM_TYPE_0
+#define RBK_D_DAIN_RAM_TYPE_0			_MK_ADDR_CONST(0x11010)
+#define RBK_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, RBK_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_SHIFT)
+#define RBK_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_CVIF			_MK_ENUM_CONST(0x0)
+#define RBK_D_DAIN_RAM_TYPE_0_DATAIN_RAM_TYPE_MCIF			_MK_ENUM_CONST(0x1)
+
+
+// Register RBK_D_DATAIN_SIZE_0_0
+#define RBK_D_DATAIN_SIZE_0_0			_MK_ADDR_CONST(0x11014)
+#define RBK_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_FIELD			_MK_FIELD_CONST(0x1fff, RBK_D_DATAIN_SIZE_0_0_DATAIN_WIDTH_SHIFT)
+#define RBK_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_SHIFT			_MK_SHIFT_CONST(16)
+#define RBK_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_FIELD			_MK_FIELD_CONST(0x1fff, RBK_D_DATAIN_SIZE_0_0_DATAIN_HEIGHT_SHIFT)
+
+
+// Register RBK_D_DATAIN_SIZE_1_0
+#define RBK_D_DATAIN_SIZE_1_0			_MK_ADDR_CONST(0x11018)
+#define RBK_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, RBK_D_DATAIN_SIZE_1_0_DATAIN_CHANNEL_SHIFT)
+
+
+// Register RBK_D_DAIN_ADDR_HIGH_0
+#define RBK_D_DAIN_ADDR_HIGH_0			_MK_ADDR_CONST(0x1101c)
+#define RBK_D_DAIN_ADDR_HIGH_0_DAIN_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DAIN_ADDR_HIGH_0_DAIN_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, RBK_D_DAIN_ADDR_HIGH_0_DAIN_ADDR_HIGH_SHIFT)
+
+
+// Register RBK_D_DAIN_ADDR_LOW_0
+#define RBK_D_DAIN_ADDR_LOW_0			_MK_ADDR_CONST(0x11020)
+#define RBK_D_DAIN_ADDR_LOW_0_DAIN_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAIN_ADDR_LOW_0_DAIN_ADDR_LOW_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAIN_ADDR_LOW_0_DAIN_ADDR_LOW_SHIFT)
+
+
+// Register RBK_D_DAIN_LINE_STRIDE_0
+#define RBK_D_DAIN_LINE_STRIDE_0			_MK_ADDR_CONST(0x11024)
+#define RBK_D_DAIN_LINE_STRIDE_0_DAIN_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAIN_LINE_STRIDE_0_DAIN_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAIN_LINE_STRIDE_0_DAIN_LINE_STRIDE_SHIFT)
+
+
+// Register RBK_D_DAIN_SURF_STRIDE_0
+#define RBK_D_DAIN_SURF_STRIDE_0			_MK_ADDR_CONST(0x11028)
+#define RBK_D_DAIN_SURF_STRIDE_0_DAIN_SURF_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAIN_SURF_STRIDE_0_DAIN_SURF_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAIN_SURF_STRIDE_0_DAIN_SURF_STRIDE_SHIFT)
+
+
+// Register RBK_D_DAIN_PLANAR_STRIDE_0
+#define RBK_D_DAIN_PLANAR_STRIDE_0			_MK_ADDR_CONST(0x1102c)
+#define RBK_D_DAIN_PLANAR_STRIDE_0_DAIN_PLANAR_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAIN_PLANAR_STRIDE_0_DAIN_PLANAR_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAIN_PLANAR_STRIDE_0_DAIN_PLANAR_STRIDE_SHIFT)
+
+
+// Register RBK_D_DAOUT_RAM_TYPE_0
+#define RBK_D_DAOUT_RAM_TYPE_0			_MK_ADDR_CONST(0x11030)
+#define RBK_D_DAOUT_RAM_TYPE_0_DATAOUT_RAM_TYPE_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DAOUT_RAM_TYPE_0_DATAOUT_RAM_TYPE_FIELD			_MK_FIELD_CONST(0x1, RBK_D_DAOUT_RAM_TYPE_0_DATAOUT_RAM_TYPE_SHIFT)
+#define RBK_D_DAOUT_RAM_TYPE_0_DATAOUT_RAM_TYPE_CVIF			_MK_ENUM_CONST(0x0)
+#define RBK_D_DAOUT_RAM_TYPE_0_DATAOUT_RAM_TYPE_MCIF			_MK_ENUM_CONST(0x1)
+
+
+// Register RBK_D_DATAOUT_SIZE_1_0
+#define RBK_D_DATAOUT_SIZE_1_0			_MK_ADDR_CONST(0x11034)
+#define RBK_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_FIELD			_MK_FIELD_CONST(0x1fff, RBK_D_DATAOUT_SIZE_1_0_DATAOUT_CHANNEL_SHIFT)
+
+
+// Register RBK_D_DAOUT_ADDR_HIGH_0
+#define RBK_D_DAOUT_ADDR_HIGH_0			_MK_ADDR_CONST(0x11038)
+#define RBK_D_DAOUT_ADDR_HIGH_0_DAOUT_ADDR_HIGH_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DAOUT_ADDR_HIGH_0_DAOUT_ADDR_HIGH_FIELD			_MK_FIELD_CONST(0xffffffff, RBK_D_DAOUT_ADDR_HIGH_0_DAOUT_ADDR_HIGH_SHIFT)
+
+
+// Register RBK_D_DAOUT_ADDR_LOW_0
+#define RBK_D_DAOUT_ADDR_LOW_0			_MK_ADDR_CONST(0x1103c)
+#define RBK_D_DAOUT_ADDR_LOW_0_DAOUT_ADDR_LOW_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAOUT_ADDR_LOW_0_DAOUT_ADDR_LOW_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAOUT_ADDR_LOW_0_DAOUT_ADDR_LOW_SHIFT)
+
+
+// Register RBK_D_DAOUT_LINE_STRIDE_0
+#define RBK_D_DAOUT_LINE_STRIDE_0			_MK_ADDR_CONST(0x11040)
+#define RBK_D_DAOUT_LINE_STRIDE_0_DAOUT_LINE_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAOUT_LINE_STRIDE_0_DAOUT_LINE_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAOUT_LINE_STRIDE_0_DAOUT_LINE_STRIDE_SHIFT)
+
+
+// Register RBK_D_CONTRACT_STRIDE_0_0
+#define RBK_D_CONTRACT_STRIDE_0_0			_MK_ADDR_CONST(0x11044)
+#define RBK_D_CONTRACT_STRIDE_0_0_CONTRACT_STRIDE_0_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_CONTRACT_STRIDE_0_0_CONTRACT_STRIDE_0_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_CONTRACT_STRIDE_0_0_CONTRACT_STRIDE_0_SHIFT)
+
+
+// Register RBK_D_CONTRACT_STRIDE_1_0
+#define RBK_D_CONTRACT_STRIDE_1_0			_MK_ADDR_CONST(0x11048)
+#define RBK_D_CONTRACT_STRIDE_1_0_CONTRACT_STRIDE_1_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_CONTRACT_STRIDE_1_0_CONTRACT_STRIDE_1_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_CONTRACT_STRIDE_1_0_CONTRACT_STRIDE_1_SHIFT)
+
+
+// Register RBK_D_DAOUT_SURF_STRIDE_0
+#define RBK_D_DAOUT_SURF_STRIDE_0			_MK_ADDR_CONST(0x1104c)
+#define RBK_D_DAOUT_SURF_STRIDE_0_DAOUT_SURF_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAOUT_SURF_STRIDE_0_DAOUT_SURF_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAOUT_SURF_STRIDE_0_DAOUT_SURF_STRIDE_SHIFT)
+
+
+// Register RBK_D_DAOUT_PLANAR_STRIDE_0
+#define RBK_D_DAOUT_PLANAR_STRIDE_0			_MK_ADDR_CONST(0x11050)
+#define RBK_D_DAOUT_PLANAR_STRIDE_0_DAOUT_PLANAR_STRIDE_SHIFT			_MK_SHIFT_CONST(5)
+#define RBK_D_DAOUT_PLANAR_STRIDE_0_DAOUT_PLANAR_STRIDE_FIELD			_MK_FIELD_CONST(0x7ffffff, RBK_D_DAOUT_PLANAR_STRIDE_0_DAOUT_PLANAR_STRIDE_SHIFT)
+
+
+// Register RBK_D_DECONV_STRIDE_0
+#define RBK_D_DECONV_STRIDE_0			_MK_ADDR_CONST(0x11054)
+#define RBK_D_DECONV_STRIDE_0_DECONV_X_STRIDE_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_DECONV_STRIDE_0_DECONV_X_STRIDE_FIELD			_MK_FIELD_CONST(0x1f, RBK_D_DECONV_STRIDE_0_DECONV_X_STRIDE_SHIFT)
+#define RBK_D_DECONV_STRIDE_0_DECONV_Y_STRIDE_SHIFT			_MK_SHIFT_CONST(16)
+#define RBK_D_DECONV_STRIDE_0_DECONV_Y_STRIDE_FIELD			_MK_FIELD_CONST(0x1f, RBK_D_DECONV_STRIDE_0_DECONV_Y_STRIDE_SHIFT)
+
+
+// Register RBK_D_PERF_ENABLE_0
+#define RBK_D_PERF_ENABLE_0			_MK_ADDR_CONST(0x11058)
+#define RBK_D_PERF_ENABLE_0_PERF_EN_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_PERF_ENABLE_0_PERF_EN_FIELD			_MK_FIELD_CONST(0x1, RBK_D_PERF_ENABLE_0_PERF_EN_SHIFT)
+
+
+// Register RBK_D_PERF_READ_STALL_0
+#define RBK_D_PERF_READ_STALL_0			_MK_ADDR_CONST(0x1105c)
+#define RBK_D_PERF_READ_STALL_0_RD_STALL_CNT_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_PERF_READ_STALL_0_RD_STALL_CNT_FIELD			_MK_FIELD_CONST(0xffffffff, RBK_D_PERF_READ_STALL_0_RD_STALL_CNT_SHIFT)
+
+
+// Register RBK_D_PERF_WRITE_STALL_0
+#define RBK_D_PERF_WRITE_STALL_0			_MK_ADDR_CONST(0x11060)
+#define RBK_D_PERF_WRITE_STALL_0_WR_STALL_CNT_SHIFT			_MK_SHIFT_CONST(0)
+#define RBK_D_PERF_WRITE_STALL_0_WR_STALL_CNT_FIELD			_MK_FIELD_CONST(0xffffffff, RBK_D_PERF_WRITE_STALL_0_WR_STALL_CNT_SHIFT)
+
+
+
+// To satisfy various compilers and platforms,
+// we let users control the types and syntax of certain constants, using macros.
+#ifndef _MK_SHIFT_CONST
+  #define _MK_SHIFT_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_MASK_CONST
+  #define _MK_MASK_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_ENUM_CONST
+  #define _MK_ENUM_CONST(_constant_) (_constant_ ## UL)
+#endif
+#ifndef _MK_ADDR_CONST
+  #define _MK_ADDR_CONST(_constant_) _constant_
+#endif
+#ifndef _MK_FIELD_CONST
+  #define _MK_FIELD_CONST(_mask_, _shift_) (_MK_MASK_CONST(_mask_) << _MK_SHIFT_CONST(_shift_))
+#endif
+
+
+
+//
+// ADDRESS SPACES
+//
+
+#define BASE_ADDRESS_NVDLA_CFGROM	0x0
+#define BASE_ADDRESS_NVDLA_GLB	0x1000
+#define BASE_ADDRESS_NVDLA_MCIF	0x2000
+#define BASE_ADDRESS_NVDLA_CDMA	0x3000
+#define BASE_ADDRESS_NVDLA_CSC	0x4000
+#define BASE_ADDRESS_NVDLA_CMAC_A	0x5000
+#define BASE_ADDRESS_NVDLA_CMAC_B	0x6000
+#define BASE_ADDRESS_NVDLA_CACC	0x7000
+#define BASE_ADDRESS_NVDLA_SDP_RDMA	0x8000
+#define BASE_ADDRESS_NVDLA_SDP	0x9000
+#define BASE_ADDRESS_NVDLA_PDP_RDMA	0xa000
+#define BASE_ADDRESS_NVDLA_PDP	0xb000
+#define BASE_ADDRESS_NVDLA_CDP_RDMA	0xc000
+#define BASE_ADDRESS_NVDLA_CDP	0xd000
+#define BASE_ADDRESS_NVDLA_GEC	0xe000
+#define BASE_ADDRESS_NVDLA_CVIF	0xf000
+#define BASE_ADDRESS_NVDLA_BDMA	0x10000
+#define BASE_ADDRESS_NVDLA_RBK	0x11000
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_rubik.c b/drivers/gpu/drm/nvdla/nvdla_rubik.c
new file mode 100644
index 000000000000..3bfb3b0cb786
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_rubik.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
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
+dla_rubik_set_producer(struct dla_engine *engine, int32_t group_id, int32_t __unused)
+{
+	uint32_t reg;
+
+	/**
+	 * set producer pointer for all sub-modules
+	 */
+	reg = group_id << SHIFT(RBK_S_POINTER_0, PRODUCER);
+	rubik_reg_write(engine, S_POINTER, reg);
+}
+
+int
+dla_rubik_enable(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	uint32_t reg;
+
+	/**
+	 * enable all sub-modules
+	 */
+	reg = FIELD_ENUM(RBK_D_OP_ENABLE_0, OP_EN, ENABLE);
+	rubik_reg_write(engine, D_OP_ENABLE, reg);
+
+	return 0;
+}
+
+void
+dla_rubik_rdma_check(struct dla_processor_group *group)
+{
+	group->is_rdma_needed = 0;
+}
+
+static int32_t
+processor_rubik_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint32_t reg, high, low;
+	uint64_t input_address = 0;
+	uint64_t output_address = 0;
+	struct dla_rubik_op_desc *rubik_op;
+	struct dla_rubik_surface_desc *rubik_surface;
+
+	rubik_op = &group->operation_desc->rubik_op;
+	rubik_surface = &group->surface_desc->rubik_surface;
+
+	/* Argument check */
+	ASSERT_GOTO((rubik_surface->src_data.type != DLA_MEM_HW),
+		ret, -EINVAL, exit);
+	ASSERT_GOTO((rubik_surface->dst_data.type != DLA_MEM_HW),
+		ret, -EINVAL, exit);
+
+	/* get the addresses from task descriptor */
+	ret = dla_read_input_address(engine, &rubik_surface->src_data,
+						&input_address,
+						group->op_desc->index,
+						group->roi_index,
+						1);
+	if (ret)
+		goto exit;
+
+	dla_get_dma_cube_address(engine->driver_context,
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
+dla_rubik_is_ready(struct dla_processor *processor,
+			     struct dla_processor_group *group)
+{
+	return 1;
+}
+
+void
+dla_rubik_dump_config(struct dla_processor_group *group)
+{
+	struct dla_rubik_op_desc *rubik_op;
+	struct dla_rubik_surface_desc *rubik_surface;
+
+	rubik_surface = &group->surface_desc->rubik_surface;
+	rubik_op = &group->operation_desc->rubik_op;
+}
+
+int
+dla_rubik_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+
+	if (!engine->config_data->rubik_enable) {
+		pr_err("RUBIK is not supported for this configuration\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	dla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, RUBIK_DONE_MASK1) |
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
index 000000000000..d3a198127006
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_sched.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION.
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#ifndef __NVDLA_SCHED_H_
+#define __NVDLA_SCHED_H_
+
+struct dla_task {
+	/* platform specific data to communicate with portability layer */
+	void *task_data;
+	/* task state */
+	uint32_t state;
+	/* Task base address */
+	uint64_t base;
+	/* start address of a list of dla_operation_container */
+	uint64_t operation_desc_addr;
+	/* start address of a list of dla_surface_container */
+	uint64_t surface_desc_addr;
+	/* start address of a list of dla_common_op_desc */
+	uint64_t dependency_graph_addr;
+	/* start address of a list of dla_lut_param */
+	uint64_t lut_data_addr;
+	/*
+	 * start address of a list of dla_roi_desc,
+	 * the first one is dla_roi_array_desc
+	 * valid when network.dynamic_roi is true
+	 */
+	uint64_t roi_array_addr;
+	/* start address of a list of dla_surface_container */
+	uint64_t surface_addr;
+	/* start address of a list of dla_stat_container */
+	uint64_t stat_data_addr;
+} __packed __aligned(256);
+
+/**
+ * @brief			Configuration parameters supported by the engine
+ *
+ * atom_size			Memory smallest access size
+ * bdma_enable			Defines whether bdma is supported
+ * rubik_enable			Defines whether rubik is supported
+ * weight_compress_support	Defines whether weight data compression is supported
+ */
+struct dla_config {
+	uint32_t atom_size;
+	bool bdma_enable;
+	bool rubik_enable;
+	bool weight_compress_support;
+};
+
+#endif
diff --git a/drivers/gpu/drm/nvdla/nvdla_scheduler.c b/drivers/gpu/drm/nvdla/nvdla_scheduler.c
new file mode 100644
index 000000000000..b814077478c6
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_scheduler.c
@@ -0,0 +1,1005 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_common.h"
+#include "nvdla_drm.h"
+#include "nvdla_reg.h"
+#include "nvdla_engine.h"
+
+#define MAX_NUM_ADDRESSES	256
+
+static uint64_t roi_array_length __aligned(8);
+static struct dla_network_desc network;
+
+static int
+dla_update_consumers(struct dla_engine *engine,
+					 struct dla_processor_group *group,
+					 struct dla_common_op_desc *op, uint8_t event);
+
+static int32_t
+dla_read_address_list(struct dla_engine *engine)
+{
+	return 0;
+}
+
+int32_t
+dla_read_lut(struct dla_engine *engine, int16_t index, void *dst)
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
+	ret = dla_data_read(engine->driver_context,
+			engine->task->task_data,
+			src_addr, (void *)dst,
+			sizeof(struct dla_lut_param),
+			(sizeof(struct dla_lut_param) * (uint64_t)index));
+
+exit:
+	return ret;
+}
+
+static int
+dla_op_enabled(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret;
+	struct dla_common_op_desc *op_desc;
+
+	op_desc = group->op_desc;
+
+	group->active = 1;
+
+	/* update dependency graph for this task */
+	ret = dla_update_consumers(engine, group, op_desc, DLA_EVENT_OP_ENABLED);
+
+	return ret;
+}
+
+static int
+dla_op_programmed(struct dla_engine *engine, struct dla_processor *processor,
+		  struct dla_processor_group *group,
+		  uint8_t rdma_id)
+{
+	int32_t ret;
+	struct dla_common_op_desc *op_desc;
+
+	op_desc = group->op_desc;
+
+	group->pending = 0;
+
+	/* update dependency graph for this task */
+	ret = dla_update_consumers(engine, group, op_desc, DLA_EVENT_OP_PROGRAMMED);
+
+	return ret;
+}
+
+static int32_t
+dla_read_config(struct dla_engine *engine, struct dla_task *task,
+				struct dla_processor *processor,
+				struct dla_processor_group *group)
+{
+	int32_t ret;
+	uint64_t base;
+	int16_t index;
+	uint8_t roi_index;
+
+	roi_index = group->roi_index;
+	index = group->op_desc->index;
+
+	base = (sizeof(union dla_operation_container) *
+			(uint64_t)engine->network->num_operations *
+			(uint64_t)roi_index);
+	base = base + (sizeof(union dla_operation_container) *
+			(uint64_t)index);
+
+	ret = dla_data_read(engine->driver_context, task->task_data,
+				task->operation_desc_addr,
+				(void *)group->operation_desc,
+				sizeof(union dla_operation_container),
+				base);
+	if (ret)
+		goto exit;
+
+	base = (sizeof(union dla_surface_container) *
+			(uint64_t)engine->network->num_operations *
+			(uint64_t)roi_index);
+
+	base = base + (sizeof(union dla_surface_container) *
+			(uint64_t)index);
+
+	ret = dla_data_read(engine->driver_context, task->task_data,
+				task->surface_desc_addr,
+				(void *)group->surface_desc,
+				sizeof(union dla_surface_container), base);
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
+dla_reset_group(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t i;
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		dla_put_op_desc(engine, group->consumers[i]);
+		group->consumers[i] = NULL;
+	}
+
+	dla_put_op_desc(engine, group->fused_parent);
+	group->fused_parent = NULL;
+
+	dla_put_op_desc(engine, group->op_desc);
+	group->op_desc = NULL;
+}
+
+static int
+dla_prepare_operation(struct dla_engine *engine,
+					  struct dla_processor *processor,
+					  struct dla_common_op_desc *op_desc,
+					  uint8_t roi_index, uint32_t *group_number)
+{
+	int32_t ret = 0;
+	uint8_t group_id;
+	uint8_t rdma_id;
+	struct dla_processor_group *group;
+
+	/*
+	 * If not already programmed then find out if
+	 * processor is free and which group is free
+	 */
+	ret = utils_get_free_group(engine, processor, &group_id, &rdma_id);
+	if (ret) {
+		pr_debug("processor:%s register groups are busy\n",
+			processor->name);
+		goto exit;
+	} else {
+		pr_info("processor:%s group:%d, rdma_group:%d available\n",
+				processor->name, group_id, rdma_id);
+	}
+	*group_number = group_id;
+	group = &processor->groups[group_id];
+
+	/*
+	 * update operation descriptor
+	 */
+	group->op_desc = op_desc;
+	dla_get_refcount(op_desc);
+	group->id = group_id;
+	group->roi_index = roi_index;
+	group->rdma_id = rdma_id;
+
+	ret = dla_read_config(engine, engine->task, processor, group);
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
+dla_program_operation(struct dla_engine *engine,
+					  struct dla_processor *processor,
+					  struct dla_processor_group *group)
+{
+	int32_t i;
+	int32_t ret = 0;
+	struct dla_common_op_desc *op_desc;
+
+	pr_info("Program %s operation index %d ROI %d Group[%d]\n",
+					processor->name,
+					group->op_desc->index,
+					group->roi_index,
+					group->id);
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
+	/**
+	 * Pre-fetch consumers
+	 */
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		group->consumers[i] = dla_get_op_desc(engine, engine->task,
+					op_desc->consumers[i].index, i,
+					group->roi_index);
+	}
+
+	group->fused_parent = dla_get_op_desc(engine, engine->task,
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
+	ret = dla_op_programmed(engine, processor, group, group->rdma_id);
+	if (!ret)
+		goto exit;
+
+exit:
+	group->programming = 0;
+	return ret;
+}
+
+static int
+dla_enable_operation(struct dla_engine *engine,
+					 struct dla_processor *processor,
+					 struct dla_common_op_desc *op_desc)
+{
+	int32_t ret = 0;
+	int32_t group_id;
+	struct dla_processor_group *group;
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
+	pr_debug("exit %s without actual enable due to processor "
+				"hasn't been programmed\n", __func__);
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
+		pr_debug("Processor:%s already enabled on group:%d\n",
+			processor->name, group_id);
+		goto exit;
+	}
+
+	pr_info("Enable %s operation index %d ROI %d\n",
+					processor->name,
+					group->op_desc->index,
+					group->roi_index);
+
+	processor->set_producer(engine, group->id, group->rdma_id);
+
+	ret = processor->enable(engine, group);
+	if (ret)
+		goto exit;
+
+	ret = dla_op_enabled(engine, group);
+exit:
+	return ret;
+}
+
+static int
+dla_submit_operation(struct dla_engine *engine,
+					 struct dla_processor *processor,
+					 struct dla_common_op_desc *op_desc,
+					 uint8_t roi_index)
+{
+	int32_t err;
+	uint32_t group_id = 0;
+
+	pr_info("Prepare %s operation index %d ROI %d dep_count %d\n",
+			processor->name, op_desc->index, roi_index,
+			op_desc->dependency_count);
+	err = dla_prepare_operation(engine, processor, op_desc, roi_index, &group_id);
+	if (err)
+		goto exit;
+
+	if (!processor->is_ready(processor, &processor->groups[group_id]))
+		goto exit;
+
+	err = dla_program_operation(engine, processor, &processor->groups[group_id]);
+	if (err)
+		goto exit;
+
+	if (op_desc->dependency_count == 0)
+		err = dla_enable_operation(engine, processor, op_desc);
+
+exit:
+	return err;
+}
+
+/**
+ * Dequeue next operation of same type from list of operations
+ */
+static int32_t
+dla_dequeue_operation(struct dla_engine *engine,
+					  struct dla_processor *processor)
+{
+	int32_t ret = 0;
+	int16_t index;
+	struct dla_common_op_desc *consumer;
+
+	if (engine->status) {
+		pr_debug("Skip dequeue op as engine has reported error\n");
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
+			pr_debug("exit %s as there's no further operation\n",
+				processor->name);
+			goto exit;
+		}
+		processor->roi_index = 0;
+	} else {
+		processor->roi_index++;
+		index = processor->tail_op->index;
+	}
+
+	pr_debug("Dequeue op from %s processor, index=%d ROI=%d\n",
+			processor->name, index, processor->roi_index);
+
+	/**
+	 * Get operation descriptor
+	 */
+	consumer = dla_get_op_desc(engine, engine->task, index,
+				processor->op_type, processor->roi_index);
+	if (consumer == NULL) {
+		ret = -ENOMEM;
+		pr_err("Failed to allocate op_desc");
+		goto exit;
+	}
+
+	ret = dla_submit_operation(engine, processor, consumer, processor->roi_index);
+	dla_put_op_desc(engine, consumer);
+
+exit:
+	return ret;
+}
+
+static int
+dla_update_dependency(struct dla_engine *engine,
+					  struct dla_consumer *consumer,
+					  struct dla_common_op_desc *op_desc,
+					  uint8_t event, uint8_t roi_index)
+{
+	int32_t ret = 0;
+	struct dla_processor *processor;
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
+		pr_err("Operation descriptor is NULL, consumer index %d",
+				consumer->index);
+		goto exit;
+	}
+
+	pr_debug("Update dependency operation index %d ROI %d DEP_COUNT=%d\n",
+					op_desc->index, op_desc->roi_index,
+					op_desc->dependency_count);
+	op_desc->dependency_count--;
+
+	if (op_desc->dependency_count == 0) {
+		processor = &engine->processors[op_desc->op_type];
+		pr_debug("enable %s in %s as depdency are resolved\n",
+			processor->name, __func__);
+
+		ret = dla_enable_operation(engine, processor, op_desc);
+		if (ret)
+			goto exit;
+	}
+exit:
+	return ret;
+}
+
+static int
+dla_update_consumers(struct dla_engine *engine,
+					 struct dla_processor_group *group,
+					 struct dla_common_op_desc *op,
+					 uint8_t event)
+{
+	int32_t i;
+	int32_t ret = 0;
+
+	if (engine->status) {
+		pr_debug("Skip update as engine has reported error\n");
+		goto exit;
+	}
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		ret = dla_update_dependency(engine, &op->consumers[i],
+						group->consumers[i],
+						event, group->roi_index);
+		if (ret) {
+			pr_err("Failed to update dependency for consumer %d, ROI %d",
+				   i, group->roi_index);
+			goto exit;
+		}
+	}
+
+	ret = dla_update_dependency(engine, &op->fused_parent,
+					group->fused_parent,
+					event, group->roi_index);
+	if (ret) {
+		pr_err("Failed to update dependency for "
+			"fused parent, ROI %d", group->roi_index);
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
+dla_op_completion(struct dla_engine *engine,
+				  struct dla_processor *processor,
+				  struct dla_processor_group *group)
+{
+	int32_t ret;
+	struct dla_task *task;
+	struct dla_common_op_desc *op_desc;
+	struct dla_processor_group *next_group;
+
+	pr_info("Completed %s operation index %d ROI %d\n",
+			processor->name, group->op_desc->index,
+			group->roi_index);
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
+	dla_get_refcount(op_desc);
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
+	ret = dla_update_consumers(engine, group, op_desc, DLA_EVENT_OP_COMPLETED);
+	if (ret)
+		goto exit;
+
+	pr_info("%d HWLs done, totally %d layers\n",
+				engine->num_proc_hwl,
+				engine->network->num_operations);
+
+	/* free operation descriptor from cache */
+	dla_reset_group(engine, group);
+
+	/* if not hwl pending, means network completed */
+	if (engine->network->num_operations == engine->num_proc_hwl) {
+		dla_put_op_desc(engine, op_desc);
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
+		ret = dla_program_operation(engine, processor, next_group);
+		if (ret)
+			goto exit;
+
+		if (next_group->op_desc->dependency_count != 0)
+			goto dequeue_op;
+
+		ret = dla_enable_operation(engine, processor,
+					   next_group->op_desc);
+		if (ret)
+			goto exit;
+	}
+
+dequeue_op:
+	/* dequeue operation from this processor */
+	ret = dla_dequeue_operation(engine, processor);
+
+exit:
+	dla_put_op_desc(engine, op_desc);
+	pr_debug("Exit:%s processor %s group%u status=%d\n",
+				__func__, processor->name,
+				group->id, ret);
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
+dla_read_network_config(struct dla_engine *engine)
+{
+	int32_t ret;
+	uint64_t network_addr;
+	struct dla_task *task = engine->task;
+
+	/**
+	 * Read address list from DRAM to DMEM
+	 */
+	ret = dla_read_address_list(engine);
+	if (ret) {
+		pr_err("Failed to read address list");
+		goto exit;
+	}
+
+	/**
+	 * Read network descriptor address from address list. It is always
+	 * at index 0.
+	 */
+	ret = dla_get_dma_address(engine->driver_context, task->task_data,
+							  0, (void *)&network_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		pr_err("Failed to read network desc address");
+		goto exit;
+	}
+
+	/**
+	 * Read network descriptor, it has information for a network
+	 * such as all address indexes.
+	 */
+	ret = dla_data_read(engine->driver_context, task->task_data,
+						network_addr, (void *)&network,
+						sizeof(struct dla_network_desc), 0);
+	if (ret) {
+		pr_err("Failed to read network descriptor");
+		goto exit;
+	}
+
+	if (network.num_operations == 0)
+		goto exit;
+
+	/**
+	 * Read operation descriptor list address from address list
+	 */
+	ret = dla_get_dma_address(engine->driver_context, task->task_data,
+							  network.operation_desc_index,
+							  (void *)&task->operation_desc_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		pr_err("Failed to read operation desc list address");
+		goto exit;
+	}
+
+	/**
+	 * Read surface descriptor list address from address list
+	 */
+	ret = dla_get_dma_address(engine->driver_context, task->task_data,
+							  network.surface_desc_index,
+							  (void *)&task->surface_desc_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		pr_err("Failed to read surface desc list address");
+		goto exit;
+	}
+
+	/**
+	 * Read dependency graph address from address list
+	 */
+	ret = dla_get_dma_address(engine->driver_context, task->task_data,
+							  network.dependency_graph_index,
+							  (void *)&task->dependency_graph_addr,
+							  DESTINATION_PROCESSOR);
+	if (ret) {
+		pr_err("Failed to ready dependency graph address");
+		goto exit;
+	}
+
+	/**
+	 * Read LUT data list address from address list
+	 */
+	if (network.num_luts) {
+		ret = dla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.lut_data_index,
+								  (void *)&task->lut_data_addr,
+								  DESTINATION_PROCESSOR);
+		if (ret) {
+			pr_err("Failed to read LUT list address");
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
+		ret = dla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.roi_array_index,
+								  (void *)&task->roi_array_addr,
+								  DESTINATION_PROCESSOR);
+		if (ret) {
+			pr_err("Failed to read ROI array address");
+			goto exit;
+		}
+
+		ret = dla_data_read(engine->driver_context, task->task_data,
+							task->roi_array_addr,
+							(void *)&roi_array_length,
+							sizeof(uint64_t), 0);
+		if (ret) {
+			pr_err("Failed to read ROI array length");
+			goto exit;
+		}
+
+		/**
+		 * Number of ROIs detected can't be greater than maximum number
+		 * ROIs this network can process
+		 */
+		if (roi_array_length > network.num_rois) {
+			pr_err("Invalid number of ROIs detected");
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		network.num_rois = roi_array_length;
+
+		/**
+		 * Read surface address from address list
+		 */
+		ret = dla_get_dma_address(engine->driver_context,
+								  task->task_data,
+								  network.surface_index,
+								  (void *)&task->surface_addr,
+								  DESTINATION_DMA);
+		if (ret) {
+			pr_err("Failed to read surface address");
+			goto exit;
+		}
+	}
+
+exit:
+	return ret;
+}
+
+static int
+dla_initiate_processors(struct dla_engine *engine)
+{
+	int32_t i;
+	int32_t ret = 0;
+	int16_t index;
+	struct dla_processor *processor;
+	struct dla_common_op_desc *consumer;
+	struct dla_network_desc *nw;
+
+	if (!engine) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	nw = engine->network;
+
+	/* Validate operation heads before initiating processors */
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		if (nw->op_head[i] >= nw->num_operations) {
+			ret = -EINVAL;
+			pr_err("Invalid op_head %d for op %d",
+						nw->op_head[i], i);
+			goto exit;
+		}
+	}
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		index = nw->op_head[i];
+
+		/* If there is no op for this type then continue */
+		if (-1 == index)
+			continue;
+
+		consumer = dla_get_op_desc(engine, engine->task, index, i, 0);
+		/*
+		 * if consumer is NULL, it means either data copy error
+		 * or cache insufficient - we should fix it
+		 **/
+		if (consumer == NULL) {
+			pr_err("Failed to allocate memory for op_head[%d]=%d",
+							i, index);
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		processor = &engine->processors[consumer->op_type];
+
+		ret = dla_submit_operation(engine, processor, consumer, 0);
+		dla_put_op_desc(engine, consumer);
+		if (ret && ret != -EBUSY) {
+			pr_err("Failed to submit %s op from index %u\n",
+						processor->name, index);
+			goto exit;
+		}
+
+		ret = dla_dequeue_operation(engine, processor);
+		if (ret) {
+			pr_err("Failed to dequeue op for %s processor",
+							processor->name);
+			goto exit;
+		}
+	}
+exit:
+	return ret;
+}
+
+static int
+dla_handle_events(struct dla_engine *engine, struct dla_processor *processor)
+{
+	int32_t j;
+	int32_t ret = 0;
+	uint8_t group_id;
+	struct dla_processor_group *group;
+
+	pr_debug("Enter:%s, processor:%s\n", __func__, processor->name);
+
+	group_id = !processor->last_group;
+
+	for (j = 0; j < DLA_NUM_GROUPS; j++) {
+		group = &processor->groups[group_id];
+
+		if ((1 << DLA_EVENT_CDMA_WT_DONE) & group->events) {
+			pr_info("Handle cdma weight done event, processor %s group %u\n",
+					processor->name, group->id);
+
+			ret = dla_update_consumers(engine, group, group->op_desc,
+									   DLA_EVENT_CDMA_WT_DONE);
+			if (ret)
+				goto exit;
+		}
+
+		if ((1 << DLA_EVENT_CDMA_DT_DONE) & group->events) {
+			pr_info("Handle cdma data done event, processor %s group %u\n",
+					processor->name, group->id);
+
+			ret = dla_update_consumers(engine, group,
+									   group->op_desc,
+									   DLA_EVENT_CDMA_DT_DONE);
+			if (ret)
+				goto exit;
+		}
+
+		/**
+		 * Handle complete after all other events
+		 */
+		if ((1 << DLA_EVENT_OP_COMPLETED) & group->events) {
+			pr_info("Handle op complete event, processor %s group %u\n",
+					processor->name, group->id);
+
+			ret = dla_op_completion(engine, processor, group);
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
+dla_process_events(struct dla_engine *engine, uint32_t *task_complete)
+{
+	int32_t i;
+	int32_t ret = 0;
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		struct dla_processor *processor;
+
+		processor = &engine->processors[i];
+		ret = dla_handle_events(engine, processor);
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
+dla_execute_task(struct dla_engine *engine_context, void *task_data, void *config_data)
+{
+	int32_t ret;
+	struct dla_engine *engine = engine_context;
+
+	if (engine == NULL) {
+		pr_err("engine is NULL\n");
+		ret = -EINVAL;
+		goto complete;
+	}
+
+	if (engine->task == NULL) {
+		pr_err("task is NULL\n");
+		ret = -EINVAL;
+		goto complete;
+	}
+
+	if (engine->task->task_data != NULL) {
+		/* We have on the fly tasks running */
+		pr_warn("Already some task in progress");
+		ret = -EBUSY;
+		goto complete;
+	}
+
+	engine->task->task_data = task_data;
+	engine->config_data = config_data;
+	engine->network = &network;
+	engine->num_proc_hwl = 0;
+
+	ret = dla_read_network_config(engine);
+	if (ret)
+		goto complete;
+
+	/* If no operations in a task means nothing to do, NULL task */
+	if (engine->network->num_operations == 0)
+		goto complete;
+
+	ret = dla_initiate_processors(engine);
+	engine->status = ret;
+
+complete:
+	return ret;
+}
+
+void
+dla_clear_task(struct dla_engine *engine_context)
+{
+	int32_t i, j;
+	struct dla_engine *engine = engine_context;
+
+	for (i = 0; i < DLA_OP_NUM; i++) {
+		struct dla_processor *processor = &engine->processors[i];
+
+		processor->roi_index = 0;
+		processor->group_status = 0;
+		processor->rdma_status = 0;
+
+		processor->tail_op = NULL;
+
+		for (j = 0; j < DLA_NUM_GROUPS; j++) {
+			struct dla_processor_group *group =
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
+	pr_info("reset engine done\n");
+}
diff --git a/drivers/gpu/drm/nvdla/nvdla_sdp.c b/drivers/gpu/drm/nvdla/nvdla_sdp.c
new file mode 100644
index 000000000000..655ec7195ee9
--- /dev/null
+++ b/drivers/gpu/drm/nvdla/nvdla_sdp.c
@@ -0,0 +1,728 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Copyright (C) 2017-2018 NVIDIA CORPORATION
+ * Copyright (C) 2022 Cai Huoqing
+ */
+
+#include "nvdla_drm.h"
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
+dla_sdp_set_producer(struct dla_engine *engine, int32_t group_id, int32_t rdma_group_id)
+{
+	uint32_t reg;
+
+	/**
+	 * set producer pointer for all sub-modules
+	 */
+	reg = group_id << SHIFT(SDP_S_POINTER_0, PRODUCER);
+	sdp_reg_write(engine, S_POINTER, reg);
+	reg = rdma_group_id << SHIFT(SDP_RDMA_S_POINTER_0, PRODUCER);
+	sdp_rdma_reg_write(engine, S_POINTER, reg);
+}
+
+int
+dla_sdp_enable(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	uint32_t reg;
+
+	/**
+	 * enable all sub-modules
+	 */
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
+dla_sdp_rdma_check(struct dla_processor_group *group)
+{
+	uint8_t x1_rdma_ena;
+	uint8_t x2_rdma_ena;
+	uint8_t y_rdma_ena;
+	uint8_t fly;
+	struct dla_sdp_op_desc *sdp_op;
+	struct dla_sdp_surface_desc *sdp_surface;
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
+	fly = sdp_surface->src_data.type == DLA_MEM_HW;
+
+	group->is_rdma_needed = (!fly) || (x1_rdma_ena ||
+					x2_rdma_ena || y_rdma_ena);
+}
+
+static int32_t
+processor_sdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret = 0;
+	uint64_t src_addr = -1, x1_addr = -1, x2_addr = -1;
+	uint64_t  y_addr = -1, dst_addr = -1;
+	uint32_t reg, high, low;
+	uint8_t fly;
+	uint32_t atom_size;
+	struct dla_sdp_op *x1_op;
+	struct dla_sdp_op *x2_op;
+	struct dla_sdp_op *y_op;
+	uint8_t x1_rdma_ena;
+	uint8_t x2_rdma_ena;
+	uint8_t y_rdma_ena;
+	uint8_t out_dma_ena;
+	struct dla_lut_param lut;
+	struct dla_sdp_op_desc *sdp_op;
+	struct dla_sdp_surface_desc *sdp_surface;
+
+	atom_size = engine->config_data->atom_size;
+
+	sdp_op = &group->operation_desc->sdp_op;
+	sdp_surface = &group->surface_desc->sdp_surface;
+
+	fly = sdp_surface->src_data.type == DLA_MEM_HW;
+	out_dma_ena = sdp_surface->dst_data.type != DLA_MEM_HW;
+	x1_op = &sdp_op->x1_op;
+	x2_op = &sdp_op->x2_op;
+	y_op = &sdp_op->y_op;
+	x1_rdma_ena = x1_op->enable && x1_op->type != SDP_OP_NONE;
+	x2_rdma_ena = x2_op->enable && x2_op->type != SDP_OP_NONE;
+	y_rdma_ena  = y_op->enable && y_op->type != SDP_OP_NONE;
+
+	/* load address */
+	if (!fly) {
+		ret = dla_read_input_address(engine, &sdp_surface->src_data,
+						&src_addr,
+						group->op_desc->index,
+						group->roi_index,
+					    1);
+		if (ret)
+			goto exit;
+	}
+
+	if (out_dma_ena) {
+		dla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->dst_data.address,
+					sdp_surface->dst_data.offset,
+					(void *)&dst_addr,
+					DESTINATION_DMA);
+	}
+
+	if (sdp_op->lut_index >= 0) {
+		group->lut_index = sdp_op->lut_index;
+		dla_read_lut(engine, sdp_op->lut_index, (void *)&lut);
+	}
+
+
+	x1_rdma_ena &= (x1_op->mode != SDP_OP_PER_LAYER);
+	x2_rdma_ena &= (x2_op->mode != SDP_OP_PER_LAYER);
+	y_rdma_ena &= (y_op->mode != SDP_OP_PER_LAYER);
+
+	if (x1_rdma_ena) {
+		dla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->x1_data.address,
+					sdp_surface->x1_data.offset,
+					(void *)&x1_addr,
+					DESTINATION_DMA);
+	}
+	if (x2_rdma_ena) {
+		dla_get_dma_cube_address(engine->driver_context,
+					engine->task->task_data,
+					sdp_surface->x2_data.address,
+					sdp_surface->x2_data.offset,
+					(void *)&x2_addr,
+					DESTINATION_DMA);
+	}
+	if (y_rdma_ena) {
+		dla_get_dma_cube_address(engine->driver_context,
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
+	reg = (map_fly[sdp_surface->src_data.type == DLA_MEM_HW] <<
+			SHIFT(SDP_D_FEATURE_MODE_CFG_0,
+			FLYING_MODE)) |
+		(map_dst[sdp_surface->dst_data.type == DLA_MEM_HW] <<
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
+dla_sdp_is_ready(struct dla_processor *processor,
+			   struct dla_processor_group *group)
+{
+	struct dla_processor_group *next_group;
+	struct dla_sdp_op_desc *sdp_op;
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
+dla_sdp_dump_config(struct dla_processor_group *group)
+{
+	struct dla_sdp_op_desc *sdp_op;
+	struct dla_sdp_surface_desc *sdp_surface;
+
+	sdp_surface = &group->surface_desc->sdp_surface;
+	sdp_op = &group->operation_desc->sdp_op;
+}
+
+int
+dla_sdp_program(struct dla_engine *engine, struct dla_processor_group *group)
+{
+	int32_t ret;
+
+	dla_enable_intr(engine, MASK(GLB_S_INTR_MASK_0, SDP_DONE_MASK1) |
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

