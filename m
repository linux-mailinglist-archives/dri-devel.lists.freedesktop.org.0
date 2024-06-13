Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A09084AB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEA410EC57;
	Fri, 14 Jun 2024 07:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="LQUmOdM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2B10E258
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:22:45 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266939; bh=M7wZn0UxKXEqx8ziArw59I3EDA6htSQBuO29cRdRXvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LQUmOdM07jjl2Tj43fN7a3LJrLnHW44CHjarwXyTBIeao+6AkD4RWZqesIUWslR6y
 VKFDJ+NJocbT+5sgayRDDxWqSy0Y22p4Rx9fhzfQfIVC9cPoWxtGl/5I4UgauWF7PT
 GRc2GjR6bXk3S+VibRb77UsHvhUQjqh8YzMW9UmoJqsZVWjcxkAePFdiq+w7JM0DHD
 uent7rEd88tDFZ6jtMrnZ+DBGvE/7wRIQajPjuQgWbPwPmI1Lxmbwj+rsdPLAckdxS
 ssxqKTUkg/ygwcHhZApaZo4KmTAJ/8XlGtJ5zJsLTw0zXX8l2qk8rhIgJjpuCdzIag
 peED5CpJY+FCg==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hi1440009; Thu, 13 Jun 2024 11:22:11 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 13/15] accel/habanalabs: network scaling support
Date: Thu, 13 Jun 2024 11:22:06 +0300
Message-Id: <20240613082208.1439968-14-oshpigelman@habana.ai>
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

Add common support for AI scaling over the network.
Initialize the hbl_cn driver via auxiliary bus and serve as its adapter
for accessing the device.

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
 drivers/accel/habanalabs/Kconfig              |   1 +
 drivers/accel/habanalabs/Makefile             |   3 +
 drivers/accel/habanalabs/cn/Makefile          |   2 +
 drivers/accel/habanalabs/cn/cn.c              | 815 ++++++++++++++++++
 drivers/accel/habanalabs/cn/cn.h              | 133 +++
 .../habanalabs/common/command_submission.c    |   2 +-
 drivers/accel/habanalabs/common/device.c      |  23 +
 drivers/accel/habanalabs/common/firmware_if.c |  20 +
 drivers/accel/habanalabs/common/habanalabs.h  |  43 +-
 .../accel/habanalabs/common/habanalabs_drv.c  |  37 +-
 .../habanalabs/common/habanalabs_ioctl.c      |   2 +
 drivers/accel/habanalabs/common/memory.c      | 123 +++
 drivers/accel/habanalabs/gaudi/gaudi.c        |  14 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |  14 +-
 .../accel/habanalabs/gaudi2/gaudi2_security.c |  16 +-
 drivers/accel/habanalabs/goya/goya.c          |   6 +
 .../include/hw_ip/nic/nic_general.h           |  15 +
 include/uapi/drm/habanalabs_accel.h           |  10 +-
 18 files changed, 1251 insertions(+), 28 deletions(-)
 create mode 100644 drivers/accel/habanalabs/cn/Makefile
 create mode 100644 drivers/accel/habanalabs/cn/cn.c
 create mode 100644 drivers/accel/habanalabs/cn/cn.h
 create mode 100644 drivers/accel/habanalabs/include/hw_ip/nic/nic_general.h

diff --git a/drivers/accel/habanalabs/Kconfig b/drivers/accel/habanalabs/Kconfig
index be85336107f9..dcc8d294b761 100644
--- a/drivers/accel/habanalabs/Kconfig
+++ b/drivers/accel/habanalabs/Kconfig
@@ -13,6 +13,7 @@ config DRM_ACCEL_HABANALABS
 	select DMA_SHARED_BUFFER
 	select CRC32
 	select FW_LOADER
+	select AUXILIARY_BUS
 	help
 	  Enables PCIe card driver for Habana's AI Processors (AIP) that are
 	  designed to accelerate Deep Learning inference and training workloads.
diff --git a/drivers/accel/habanalabs/Makefile b/drivers/accel/habanalabs/Makefile
index 98510cdd5066..37e216689d1a 100644
--- a/drivers/accel/habanalabs/Makefile
+++ b/drivers/accel/habanalabs/Makefile
@@ -8,6 +8,9 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS) := habanalabs.o
 include $(src)/common/Makefile
 habanalabs-y += $(HL_COMMON_FILES)
 
+include $(src)/cn/Makefile
+habanalabs-y += $(HL_CN_FILES)
+
 include $(src)/gaudi2/Makefile
 habanalabs-y += $(HL_GAUDI2_FILES)
 
diff --git a/drivers/accel/habanalabs/cn/Makefile b/drivers/accel/habanalabs/cn/Makefile
new file mode 100644
index 000000000000..b90d5a93a632
--- /dev/null
+++ b/drivers/accel/habanalabs/cn/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+HL_CN_FILES := cn/cn.o
diff --git a/drivers/accel/habanalabs/cn/cn.c b/drivers/accel/habanalabs/cn/cn.c
new file mode 100644
index 000000000000..29e4c2292391
--- /dev/null
+++ b/drivers/accel/habanalabs/cn/cn.c
@@ -0,0 +1,815 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "cn.h"
+
+#include "../common/habanalabs.h"
+#include <linux/file.h>
+
+static int hl_cn_send_empty_status(struct hl_device *hdev, int port)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct cpucp_nic_status status = {};
+	struct hl_cn_properties *cn_props;
+	struct cpucp_nic_status_packet *pkt;
+	size_t total_pkt_size, data_size;
+	u64 result;
+	int rc;
+
+	cn_props = &hdev->asic_prop.cn_props;
+	data_size = cn_props->status_packet_size;
+
+	total_pkt_size = sizeof(struct cpucp_nic_status_packet) + data_size;
+
+	/* data should be aligned to 8 bytes in order to CPU-CP to copy it */
+	total_pkt_size = (total_pkt_size + 0x7) & ~0x7;
+
+	/* total_pkt_size is casted to u16 later on */
+	if (total_pkt_size > USHRT_MAX) {
+		dev_err(hdev->dev, "NIC status data is too big\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	pkt = kzalloc(total_pkt_size, GFP_KERNEL);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	status.port = cpu_to_le32(port);
+	status.up = false;
+
+	pkt->length = cpu_to_le32(data_size / sizeof(u32));
+	memcpy(&pkt->data, &status, data_size);
+
+	pkt->cpucp_pkt.ctl = cpu_to_le32(CPUCP_PACKET_NIC_STATUS << CPUCP_PKT_CTL_OPCODE_SHIFT);
+
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) pkt, total_pkt_size, 0, &result);
+
+	if (rc)
+		dev_err(hdev->dev, "failed to send NIC status, port %d\n", port);
+
+	kfree(pkt);
+out:
+	cn_funcs->port_funcs->post_send_status(hdev, port);
+
+	return rc;
+}
+
+static bool hl_cn_device_operational(struct hbl_aux_dev *aux_dev)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hl_device_operational(hdev, NULL);
+}
+
+static void hl_cn_hw_access_lock(struct hbl_aux_dev *aux_dev)
+	__acquires(&hdev->cn.hw_access_lock)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	mutex_lock(&hdev->cn.hw_access_lock);
+}
+
+static void hl_cn_hw_access_unlock(struct hbl_aux_dev *aux_dev)
+	__releases(&hdev->cn.hw_access_lock)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	mutex_unlock(&hdev->cn.hw_access_lock);
+}
+
+static void hl_cn_device_reset(struct hbl_aux_dev *aux_dev)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	hl_device_reset(hdev, HL_DRV_RESET_HARD);
+}
+
+void *hl_cn_dma_alloc_coherent(struct hbl_aux_dev *aux_dev, size_t size,
+					dma_addr_t *dma_handle, gfp_t flag)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hl_asic_dma_alloc_coherent(hdev, size, dma_handle, flag);
+}
+
+void hl_cn_dma_free_coherent(struct hbl_aux_dev *aux_dev, size_t size, void *cpu_addr,
+					dma_addr_t dma_handle)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	hl_asic_dma_free_coherent(hdev, size, cpu_addr, dma_handle);
+}
+
+void *hl_cn_dma_pool_zalloc(struct hbl_aux_dev *aux_dev, size_t size, gfp_t mem_flags,
+					dma_addr_t *dma_handle)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hl_asic_dma_pool_zalloc(hdev, size, mem_flags, dma_handle);
+}
+
+void hl_cn_dma_pool_free(struct hbl_aux_dev *aux_dev, void *vaddr, dma_addr_t dma_addr)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	hl_asic_dma_pool_free(hdev, vaddr, dma_addr);
+}
+
+static int hl_cn_vm_dev_mmu_map(struct hbl_aux_dev *aux_dev, u64 vm_handle,
+				enum hbl_cn_mem_type mem_type, u64 addr, u64 dva, size_t size)
+
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+
+	return hl_map_vmalloc_range(cn->ctx, addr, dva, size);
+}
+
+static void hl_cn_vm_dev_mmu_unmap(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 dva, size_t size)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	int rc;
+
+	rc = hl_unmap_vmalloc_range(cn->ctx, dva);
+	if (rc)
+		dev_crit(hdev->dev, "Failed to unmap dva 0x%llx with size 0x%lx, err %d\n", dva,
+				size, rc);
+}
+
+static int hl_cn_vm_reserve_dva_block(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 size,
+					u64 *dva)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	u64 addr;
+
+	addr = hl_reserve_va_block(hdev, cn->ctx, HL_VA_RANGE_TYPE_HOST, size, PAGE_SIZE);
+	if (!addr)
+		return -ENOMEM;
+
+	*dva = addr;
+
+	return 0;
+}
+
+static void hl_cn_vm_unreserve_dva_block(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 dva,
+						u64 size)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	hl_unreserve_va_block(hdev, cn->ctx, dva, size);
+}
+
+void hl_cn_spmu_get_stats_info(struct hbl_aux_dev *aux_dev, u32 port, struct hbl_cn_stat **stats,
+				u32 *n_stats)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hl_cn_port_funcs *port_funcs = hdev->asic_funcs->cn_funcs->port_funcs;
+
+	port_funcs->spmu_get_stats_info(hdev, port, stats, n_stats);
+}
+
+int hl_cn_spmu_config(struct hbl_aux_dev *aux_dev, u32 port, u32 num_event_types, u32 event_types[],
+			bool enable)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hl_cn_port_funcs *port_funcs = hdev->asic_funcs->cn_funcs->port_funcs;
+
+	return port_funcs->spmu_config(hdev, port, num_event_types, event_types, enable);
+}
+
+int hl_cn_spmu_sample(struct hbl_aux_dev *aux_dev, u32 port, u32 num_out_data, u64 out_data[])
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hl_cn_port_funcs *port_funcs = hdev->asic_funcs->cn_funcs->port_funcs;
+
+	return port_funcs->spmu_sample(hdev, port, num_out_data, out_data);
+}
+
+int hl_cn_poll_reg(struct hbl_aux_dev *aux_dev, u32 reg, u64 timeout_us, hbl_cn_poll_cond_func func,
+			void *arg)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	u32 val;
+
+	return hl_poll_timeout(hdev, reg, val, func(val, arg), 1000, timeout_us);
+}
+
+int hl_cn_send_cpu_message(struct hbl_aux_dev *aux_dev, u32 *msg, u16 len, u32 timeout, u64 *result)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hdev->asic_funcs->send_cpu_message(hdev, msg, len, timeout, result);
+}
+
+void hl_cn_post_send_status(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hl_cn_port_funcs *port_funcs = hdev->asic_funcs->cn_funcs->port_funcs;
+
+	port_funcs->post_send_status(hdev, port);
+}
+
+static u32 hl_cn_dram_readl(struct hbl_aux_dev *aux_dev, u64 addr)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	u64 val = 0;
+	int rc;
+
+	rc = hdev->asic_funcs->access_dev_mem(hdev, PCI_REGION_DRAM, addr, &val, DEBUGFS_READ32);
+	if (rc)
+		dev_crit(hdev->dev, "Failed to readl from dev_mem addr 0x%llx\n", addr);
+
+	return val;
+}
+
+static void hl_cn_dram_writel(struct hbl_aux_dev *aux_dev, u32 val, u64 addr)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	u64 data = val;
+	int rc;
+
+	rc = hdev->asic_funcs->access_dev_mem(hdev, PCI_REGION_DRAM, addr, &data, DEBUGFS_WRITE32);
+	if (rc)
+		dev_crit(hdev->dev, "Failed to writel to dev_mem addr 0x%llx\n", addr);
+}
+
+static u32 hl_cn_rreg(struct hbl_aux_dev *aux_dev, u32 reg)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hdev->asic_funcs->rreg(hdev, reg);
+}
+
+static void hl_cn_wreg(struct hbl_aux_dev *aux_dev, u32 reg, u32 val)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hdev->asic_funcs->wreg(hdev, reg, val);
+}
+
+static int hl_cn_get_reg_pcie_addr(struct hbl_aux_dev *aux_dev, u32 reg, u64 *pci_addr)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+
+	return hdev->asic_funcs->get_reg_pcie_addr(hdev, reg, pci_addr);
+}
+
+static int hl_cn_register_cn_user_context(struct hbl_aux_dev *aux_dev, int user_fd,
+				const void *cn_ctx, u64 *comp_handle, u64 *vm_handle)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct drm_file *file_priv;
+	struct hl_fpriv *hpriv;
+	struct file *file;
+	int rc = 0;
+
+	if (atomic_cmpxchg(&cn->ctx_registered, 0, 1)) {
+		dev_dbg(hdev->dev, "user context is already registered\n");
+		return -EBUSY;
+	}
+
+	/* CN driver can independently manage its resources and context.
+	 * However, for HL devices, corresponding HW resources can also be managed by compute side.
+	 * To avoid contention (e.g. abrupt application close) between them, enforce orderly FD
+	 * closure. This facilitates that CN destroy runs first, followed by compute fini.
+	 */
+	file = fget(user_fd);
+	if (!file || !hl_check_fd(file)) {
+		rc = -EBADF;
+		goto file_err;
+	}
+
+	mutex_lock(&hdev->fpriv_list_lock);
+
+	if (list_empty(&hdev->fpriv_list)) {
+		dev_dbg(hdev->dev, "no open user context\n");
+		rc = -ESRCH;
+		goto open_ctx_err;
+	}
+
+	/* The list should contain a single element as currently only a single user context is
+	 * allowed. Therefore get the first entry.
+	 */
+	hpriv = list_first_entry(&hdev->fpriv_list, struct hl_fpriv, dev_node);
+
+	file_priv = file->private_data;
+	if (hpriv != file_priv->driver_priv) {
+		dev_dbg(hdev->dev, "user FD mismatch\n");
+		rc = -EINVAL;
+		goto fd_mismatch_err;
+	}
+
+	mutex_unlock(&hdev->fpriv_list_lock);
+
+	/* these must have different values to allow data transfer */
+	*comp_handle = 0;
+	*vm_handle = 1;
+
+	return 0;
+
+fd_mismatch_err:
+open_ctx_err:
+	mutex_unlock(&hdev->fpriv_list_lock);
+	fput(file);
+file_err:
+	atomic_set(&cn->ctx_registered, 0);
+
+	return rc;
+}
+
+static void hl_cn_deregister_cn_user_context(struct hbl_aux_dev *aux_dev, u64 vm_handle)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hl_fpriv *hpriv;
+	struct file *file;
+
+	mutex_lock(&hdev->fpriv_list_lock);
+	hpriv = list_first_entry(&hdev->fpriv_list, struct hl_fpriv, dev_node);
+	mutex_unlock(&hdev->fpriv_list_lock);
+
+	file = hpriv->file_priv->filp;
+
+	/* We can assert here that all CN resources which might have dependency on compute side are
+	 * already released. Hence, release reference to compute file.
+	 */
+	fput(file);
+
+	atomic_set(&cn->ctx_registered, 0);
+}
+
+static int hl_cn_vm_create(struct hbl_aux_dev *aux_dev, u64 comp_handle, u32 flags, u64 *vm_handle)
+{
+	*vm_handle = 0;
+
+	return 0;
+}
+
+static void hl_cn_vm_destroy(struct hbl_aux_dev *aux_dev, u64 vm_handle)
+{
+
+}
+
+static int hl_cn_get_vm_info(struct hbl_aux_dev *aux_dev, u64 vm_handle,
+				struct hbl_cn_vm_info *vm_info)
+{
+	vm_info->mmu_mode = HBL_CN_MMU_MODE_EXTERNAL;
+	vm_info->ext_mmu.work_id = 1;
+
+	return 0;
+}
+
+static void hl_cn_get_cpucp_info(struct hbl_aux_dev *aux_dev,
+					struct hbl_cn_cpucp_info *hl_cn_cpucp_info)
+{
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+	struct hl_device *hdev = container_of(cn, struct hl_device, cn);
+	struct hbl_cn_cpucp_info *cn_cpucp_info;
+
+	cn_cpucp_info = &hdev->asic_prop.cn_props.cpucp_info;
+
+	memcpy(hl_cn_cpucp_info, cn_cpucp_info, sizeof(*cn_cpucp_info));
+}
+
+static void hl_cn_cpucp_info_le_to_cpu(struct cpucp_nic_info *cpucp_nic_info,
+					struct hbl_cn_cpucp_info *hbl_cn_cpucp_info)
+{
+	int i;
+
+	for (i = 0 ; i < CPUCP_MAX_NICS ; i++) {
+		memcpy(&hbl_cn_cpucp_info->mac_addrs[i], &cpucp_nic_info->mac_addrs[i],
+			sizeof(cpucp_nic_info->mac_addrs[i]));
+		hbl_cn_cpucp_info->tx_swap_map[i] = le16_to_cpu(cpucp_nic_info->tx_swap_map[i]);
+	}
+
+	for (i = 0 ; i < CPUCP_NIC_MASK_ARR_LEN ; i++) {
+		hbl_cn_cpucp_info->link_mask[i] = le64_to_cpu(cpucp_nic_info->link_mask[i]);
+		hbl_cn_cpucp_info->link_ext_mask[i] = le64_to_cpu(cpucp_nic_info->link_ext_mask[i]);
+		hbl_cn_cpucp_info->auto_neg_mask[i] = le64_to_cpu(cpucp_nic_info->auto_neg_mask[i]);
+	}
+
+	for (i = 0 ; i < CPUCP_NIC_POLARITY_ARR_LEN ; i++) {
+		hbl_cn_cpucp_info->pol_tx_mask[i] = le64_to_cpu(cpucp_nic_info->pol_tx_mask[i]);
+		hbl_cn_cpucp_info->pol_rx_mask[i] = le64_to_cpu(cpucp_nic_info->pol_rx_mask[i]);
+	}
+
+	hbl_cn_cpucp_info->serdes_type = (enum cpucp_serdes_type)
+					le16_to_cpu(cpucp_nic_info->serdes_type);
+
+	memcpy(hbl_cn_cpucp_info->qsfp_eeprom, cpucp_nic_info->qsfp_eeprom,
+		sizeof(cpucp_nic_info->qsfp_eeprom));
+}
+
+static int hl_cn_get_asic_type(struct hl_device *hdev, enum hbl_cn_asic_type *asic_type)
+
+{
+	switch (hdev->asic_type) {
+	case ASIC_GAUDI2:
+	case ASIC_GAUDI2B:
+	case ASIC_GAUDI2C:
+		*asic_type = HBL_ASIC_GAUDI2;
+		break;
+	default:
+		dev_err(hdev->dev, "Unrecognized ASIC type %d\n", hdev->asic_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hl_cn_aux_data_init(struct hl_device *hdev)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct asic_fixed_properties *asic_props = &hdev->asic_prop;
+	struct hbl_cn_aux_data *aux_data;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+	u64 dram_kmd_size;
+	int rc;
+
+	aux_data = kzalloc(sizeof(*aux_data), GFP_KERNEL);
+	if (!aux_data)
+		return -ENOMEM;
+
+	aux_ops = kzalloc(sizeof(*aux_ops), GFP_KERNEL);
+	if (!aux_ops) {
+		rc = -ENOMEM;
+		goto free_aux_data;
+	}
+
+	aux_dev = &cn->cn_aux_dev;
+	aux_dev->aux_data = aux_data;
+	aux_dev->aux_ops = aux_ops;
+	aux_dev->type = HBL_AUX_DEV_CN;
+
+	aux_data->pdev = hdev->pdev;
+	aux_data->dev = hdev->dev;
+	aux_data->ports_mask = cn->ports_mask;
+	aux_data->ext_ports_mask = cn->eth_ports_mask;
+	aux_data->auto_neg_mask = cn->auto_neg_mask;
+	aux_data->fw_ver = asic_props->cpucp_info.cpucp_version;
+	aux_data->nic_drv_addr = asic_props->nic_drv_addr;
+	aux_data->nic_drv_size = asic_props->nic_drv_size;
+	aux_data->macro_cfg_size = asic_props->macro_cfg_size;
+	aux_data->pending_reset_long_timeout = hdev->pldm ? HL_PLDM_HARD_RESET_MAX_TIMEOUT :
+									HL_HARD_RESET_MAX_TIMEOUT;
+	aux_data->id = hdev->cdev_idx;
+	aux_data->pldm = hdev->pldm;
+	aux_data->skip_phy_init = hdev->cn.skip_phy_init;
+	aux_data->load_phy_fw = hdev->cn.load_fw;
+	aux_data->cpucp_fw = !!(hdev->fw_components & FW_TYPE_BOOT_CPU);
+	aux_data->supports_coresight = hdev->supports_coresight;
+	aux_data->use_fw_serdes_info = cn->use_fw_serdes_info;
+	aux_data->cache_line_size = asic_props->cache_line_size;
+	aux_data->clk = asic_props->clk;
+	aux_data->kernel_asid = HL_KERNEL_ASID_ID;
+	aux_data->card_location = cn->card_location;
+	aux_data->mmu_enable = true;
+	aux_data->lanes_per_port = cn->lanes_per_port;
+	aux_data->device_timeout = HL_DEVICE_TIMEOUT_USEC;
+	aux_data->fw_major_version = hdev->fw_inner_major_ver;
+	aux_data->fw_minor_version = hdev->fw_inner_minor_ver;
+	aux_data->fw_app_cpu_boot_dev_sts0 = asic_props->fw_app_cpu_boot_dev_sts0;
+	aux_data->fw_app_cpu_boot_dev_sts1 = asic_props->fw_app_cpu_boot_dev_sts1;
+	aux_data->cpucp_checkers_shift = NIC_CHECKERS_CHECK_SHIFT;
+
+	rc = hl_cn_get_asic_type(hdev, &aux_data->asic_type);
+	if (rc) {
+		dev_err(hdev->dev, "failed to set eth aux data asic type\n");
+		goto free_aux_ops;
+	}
+
+	dram_kmd_size = asic_props->dram_user_base_address - asic_props->dram_base_address;
+	aux_data->dram_size = (asic_props->dram_size < dram_kmd_size) ? 0 : dram_kmd_size;
+
+	/* set cn -> accel ops */
+	aux_ops->device_operational = hl_cn_device_operational;
+	aux_ops->hw_access_lock = hl_cn_hw_access_lock;
+	aux_ops->hw_access_unlock = hl_cn_hw_access_unlock;
+	aux_ops->device_reset = hl_cn_device_reset;
+	aux_ops->vm_dev_mmu_map = hl_cn_vm_dev_mmu_map;
+	aux_ops->vm_dev_mmu_unmap = hl_cn_vm_dev_mmu_unmap;
+	aux_ops->vm_reserve_dva_block = hl_cn_vm_reserve_dva_block;
+	aux_ops->vm_unreserve_dva_block = hl_cn_vm_unreserve_dva_block;
+	aux_ops->dram_readl = hl_cn_dram_readl;
+	aux_ops->dram_writel = hl_cn_dram_writel;
+	aux_ops->rreg = hl_cn_rreg;
+	aux_ops->wreg = hl_cn_wreg;
+	aux_ops->get_reg_pcie_addr = hl_cn_get_reg_pcie_addr;
+	aux_ops->register_cn_user_context = hl_cn_register_cn_user_context;
+	aux_ops->deregister_cn_user_context = hl_cn_deregister_cn_user_context;
+	aux_ops->vm_create = hl_cn_vm_create;
+	aux_ops->vm_destroy = hl_cn_vm_destroy;
+	aux_ops->get_vm_info = hl_cn_get_vm_info;
+	aux_ops->poll_reg = hl_cn_poll_reg;
+	aux_ops->get_cpucp_info = hl_cn_get_cpucp_info;
+
+	cn_funcs->set_cn_data(hdev);
+
+	return 0;
+
+free_aux_ops:
+	kfree(aux_ops);
+free_aux_data:
+	kfree(aux_data);
+
+	return rc;
+}
+
+static void hl_cn_aux_data_fini(struct hl_device *hdev)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->cn.cn_aux_dev;
+
+	kfree(aux_dev->aux_ops);
+	kfree(aux_dev->aux_data);
+}
+
+static void cn_adev_release(struct device *dev)
+{
+	struct hbl_aux_dev *aux_dev = container_of(dev, struct hbl_aux_dev, adev.dev);
+	struct hl_cn *cn = container_of(aux_dev, struct hl_cn, cn_aux_dev);
+
+	cn->is_cn_aux_dev_initialized = false;
+}
+
+static int hl_cn_aux_drv_init(struct hl_device *hdev)
+{
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev = &cn->cn_aux_dev;
+	struct auxiliary_device *adev;
+	int rc;
+
+	rc = hl_cn_aux_data_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "CN aux data init failed\n");
+		return rc;
+	}
+
+	adev = &aux_dev->adev;
+	adev->id = hdev->id;
+	adev->name = "cn";
+	adev->dev.parent = hdev->dev;
+	adev->dev.release = cn_adev_release;
+
+	rc = auxiliary_device_init(adev);
+	if (rc) {
+		dev_err(hdev->dev, "CN auxiliary_device_init failed\n");
+		goto aux_data_free;
+	}
+
+	rc = auxiliary_device_add(adev);
+	if (rc) {
+		dev_err(hdev->dev, "CN auxiliary_device_add failed\n");
+		goto uninit_adev;
+	}
+
+	cn->is_cn_aux_dev_initialized = true;
+
+	return 0;
+
+uninit_adev:
+	auxiliary_device_uninit(adev);
+aux_data_free:
+	hl_cn_aux_data_fini(hdev);
+
+	return rc;
+}
+
+static void hl_cn_aux_drv_fini(struct hl_device *hdev)
+{
+	struct hl_cn *cn = &hdev->cn;
+	struct auxiliary_device *adev;
+
+	if (!cn->is_cn_aux_dev_initialized)
+		return;
+
+	adev = &cn->cn_aux_dev.adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+
+	hl_cn_aux_data_fini(hdev);
+}
+
+int hl_cn_reopen(struct hl_device *hdev)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct hbl_aux_dev *aux_dev = &hdev->cn.cn_aux_dev;
+	struct hbl_cn_aux_ops *aux_ops = aux_dev->aux_ops;
+	int rc;
+
+	/* check if the NIC is enabled */
+	if (!hdev->cn.ports_mask)
+		return 0;
+
+	if (aux_ops->ports_reopen) {
+		rc = aux_ops->ports_reopen(aux_dev);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to reopen the eth ports, %d\n", rc);
+			return rc;
+		}
+	}
+
+	cn_funcs->set_hw_cap(hdev, true);
+
+	return 0;
+}
+
+int hl_cn_init(struct hl_device *hdev)
+{
+	struct hl_cn_properties *cn_props = &hdev->asic_prop.cn_props;
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct hl_cn *cn = &hdev->cn;
+	int rc;
+
+	/*
+	 * In init flow we initialize the NIC ports from scratch. In hard reset
+	 * flow, we get here after the NIC ports were halted, hence we only need to reopen them.
+	 */
+	if (hdev->reset_info.in_reset)
+		return hl_cn_reopen(hdev);
+
+	cn->ports_mask &= GENMASK(cn_props->max_num_of_ports - 1, 0);
+	cn->ports_ext_mask &= cn->ports_mask;
+	cn->auto_neg_mask &= cn->ports_mask;
+
+	/* check if the NIC is enabled */
+	if (!hdev->cn.ports_mask)
+		return 0;
+
+	rc = cn_funcs->pre_core_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to pre init the NIC, %d\n", rc);
+		return rc;
+	}
+
+	/* check if all ports are disabled by the FW */
+	if (!hdev->cn.ports_mask) {
+		dev_dbg(hdev->dev, "all NIC ports are disabled by the FW\n");
+		return 0;
+	}
+
+	cn->eth_ports_mask = hdev->cn.eth_on_internal ? hdev->cn.ports_mask :
+									hdev->cn.ports_ext_mask;
+
+	/* verify the kernel module name as the auxiliary drivers will bind according to it */
+	WARN_ONCE(strcmp(HL_NAME, KBUILD_MODNAME),
+			"habanalabs name not in sync with kernel module name");
+
+	rc = hl_cn_aux_drv_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init CN driver, %d\n", rc);
+		return rc;
+	}
+
+	cn_funcs->set_hw_cap(hdev, true);
+
+	cn->is_initialized = true;
+
+	return 0;
+}
+
+void hl_cn_fini(struct hl_device *hdev)
+{
+	struct hl_cn *cn = &hdev->cn;
+
+	/* The NIC capability bit of each ASIC cannot be used as a prerequisite for this function,
+	 * as we may arrive here after a failing hard reset w/o calling to hl_cn_reopen().
+	 * But we can check if the NIC is totally disabled.
+	 */
+	if (!hdev->cn.ports_mask)
+		return;
+
+	if (!cn->is_initialized)
+		return;
+
+	hl_cn_aux_drv_fini(hdev);
+
+	cn->is_initialized = false;
+}
+
+void hl_cn_stop(struct hl_device *hdev)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	if (!cn_funcs->get_hw_cap(hdev))
+		return;
+
+	if (aux_ops->ports_stop)
+		aux_ops->ports_stop(aux_dev);
+
+	/* Set NIC as not initialized. */
+	cn_funcs->set_hw_cap(hdev, false);
+}
+
+void hl_cn_hard_reset_prepare(struct hl_device *hdev, bool fw_reset)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+
+	if (!cn_funcs->get_hw_cap(hdev))
+		return;
+
+	cn_funcs->port_funcs->ports_stop_prepare(hdev, fw_reset, hdev->device_fini_pending);
+}
+
+int hl_cn_send_status(struct hl_device *hdev, int port, u8 cmd, u8 period)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+
+	if (!cn_funcs->get_hw_cap(hdev)) {
+		if (cmd != HBL_CN_STATUS_PERIODIC_STOP)
+			return hl_cn_send_empty_status(hdev, port);
+		return 0;
+	}
+
+	return cn_funcs->port_funcs->send_port_cpucp_status(hdev, port, cmd, period);
+}
+
+void hl_cn_synchronize_irqs(struct hl_device *hdev)
+{
+	struct hl_cn_funcs *cn_funcs = hdev->asic_funcs->cn_funcs;
+	struct hbl_aux_dev *aux_dev = &hdev->cn.cn_aux_dev;
+	struct hbl_cn_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+
+	if (!cn_funcs->get_hw_cap(hdev))
+		return;
+
+	if (aux_ops->synchronize_irqs)
+		aux_ops->synchronize_irqs(aux_dev);
+}
+
+int hl_cn_cpucp_info_get(struct hl_device *hdev)
+{
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct cpucp_nic_info *cpucp_nic_info;
+	dma_addr_t cpucp_nic_info_dma_addr;
+	int rc;
+
+	cpucp_nic_info = hl_cpu_accessible_dma_pool_alloc(hdev,
+							sizeof(struct cpucp_nic_info),
+							&cpucp_nic_info_dma_addr);
+	if (!cpucp_nic_info) {
+		dev_err(hdev->dev,
+			"Failed to allocate DMA memory for CPU-CP NIC info packet\n");
+		return -ENOMEM;
+	}
+
+	memset(cpucp_nic_info, 0, sizeof(struct cpucp_nic_info));
+
+	/* Unfortunately, 0 is a valid type in this field from f/w perspective,
+	 * so to support older f/w where they don't return this field, put
+	 * here the max value so when converting serdes type to server type,
+	 * we will put the UNKNOWN value into the server type.
+	 */
+	cpucp_nic_info->serdes_type = cpu_to_le16(U16_MAX);
+
+	rc = hl_fw_cpucp_nic_info_get(hdev, cpucp_nic_info_dma_addr);
+	if (rc)
+		goto out;
+
+	hl_cn_cpucp_info_le_to_cpu(cpucp_nic_info, &prop->cn_props.cpucp_info);
+
+out:
+	hl_cpu_accessible_dma_pool_free(hdev, sizeof(struct cpucp_nic_info), cpucp_nic_info);
+
+	return 0;
+}
diff --git a/drivers/accel/habanalabs/cn/cn.h b/drivers/accel/habanalabs/cn/cn.h
new file mode 100644
index 000000000000..8cab5423aaca
--- /dev/null
+++ b/drivers/accel/habanalabs/cn/cn.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+
+#ifndef CN_H_
+#define CN_H_
+
+#include <uapi/drm/habanalabs_accel.h>
+#include <linux/net/intel/cn_aux.h>
+
+#include <linux/kfifo.h>
+#include <linux/hashtable.h>
+#include <linux/ctype.h>
+
+#include <linux/habanalabs/cpucp_if.h>
+
+struct hl_device;
+struct hl_ctx;
+
+#define NIC_MACRO_CFG_SIZE		hdev->asic_prop.macro_cfg_size
+#define NIC_MACRO_CFG_BASE(port)	(NIC_MACRO_CFG_SIZE * ((port) >> 1))
+#define NIC_MACRO_WREG32(reg, val)	WREG32(NIC_MACRO_CFG_BASE(port) + (reg), (val))
+
+/**
+ * struct hl_cn - habanalabs CN common structure.
+ * @cn_aux_dev: pointer to CN auxiliary device structure.
+ * @ctx: compute user context.
+ * @hw_access_lock: protects the HW access from CN flows.
+ * @ports_mask: contains mask of the CN ports that are enabled, as received from the f/w. This
+ *              field can contain different values based on the server type
+ * @ports_ext_mask: contains mask of the CN ports that are external (used for scale-out), as
+ *                  received from the f/w. This field can contain different values based on the
+ *                  server type.
+ * @auto_neg_mask: mask of ports with Autonegotiation enabled.
+ * @eth_ports_mask: Ethernet ports enable mask.
+ * @ctx_registered: is user context registered.
+ * @card_location: the OAM number in the HLS (relevant for PMC card type).
+ * @lanes_per_port: number of physical lanes per port.
+ * @use_fw_serdes_info: true if NIC should use serdes values from F/W, false if CN should use hard
+ *                      coded values.
+ * @is_cn_aux_dev_initialized: true if the CN auxiliary device is initialized.
+ * @is_initialized: is device initialized.
+ * @load_fw: load PHY FW from ASIC path.
+ * @skip_phy_init: skip PHY init phase.
+ * @eth_on_internal: set internal ports as Ethernet ports.
+ */
+struct hl_cn {
+	struct hbl_aux_dev	cn_aux_dev;
+	struct hl_ctx		*ctx;
+	struct mutex		hw_access_lock;
+	u64			ports_mask;
+	u64			ports_ext_mask;
+	u64			auto_neg_mask;
+	u64			eth_ports_mask;
+	atomic_t		ctx_registered;
+	u32			card_location;
+	u8			lanes_per_port;
+	u8			use_fw_serdes_info;
+	u8			is_cn_aux_dev_initialized;
+	u8			is_initialized;
+	u8			load_fw;
+	u8			skip_phy_init;
+	u8			eth_on_internal;
+};
+
+/**
+ * struct hl_cn_port_funcs - ASIC specific CN functions that are called from common code for a
+ *                            specific port.
+ * @spmu_get_stats_info: get SPMU statistics information.
+ * @spmu_config: config the SPMU.
+ * @spmu_sample: read the SPMU counters.
+ * @post_send_status: ASIC-specific handler for post sending status packet to FW.
+ * @ports_stop_prepare: prepare the ports for a stop.
+ * @send_port_cpucp_status: Send port status to FW.
+ */
+struct hl_cn_port_funcs {
+	void (*spmu_get_stats_info)(struct hl_device *hdev, u32 port, struct hbl_cn_stat **stats,
+					u32 *n_stats);
+	int (*spmu_config)(struct hl_device *hdev, u32 port, u32 num_event_types, u32 event_types[],
+				bool enable);
+	int (*spmu_sample)(struct hl_device *hdev, u32 port, u32 num_out_data, u64 out_data[]);
+	void (*post_send_status)(struct hl_device *hdev, u32 port);
+	void (*ports_stop_prepare)(struct hl_device *hdev, bool fw_reset, bool in_teardown);
+	int (*send_port_cpucp_status)(struct hl_device *hdev, u32 port, u8 cmd, u8 period);
+};
+
+/**
+ * struct hl_cn_funcs - ASIC specific CN functions that are called from common code.
+ * @pre_core_init: NIC initializations to be done only once on device probe.
+ * @get_hw_cap: check rather HW capability bitmap is set for NIC.
+ * @set_hw_cap: set HW capability (on/off).
+ * @set_cn_data: ASIC data to be used by the CN driver.
+ * @port_funcs: functions called from common code for a specific NIC port.
+ */
+struct hl_cn_funcs {
+	int (*pre_core_init)(struct hl_device *hdev);
+	bool (*get_hw_cap)(struct hl_device *hdev);
+	void (*set_hw_cap)(struct hl_device *hdev, bool enable);
+	void (*set_cn_data)(struct hl_device *hdev);
+	struct hl_cn_port_funcs *port_funcs;
+};
+
+int hl_cn_init(struct hl_device *hdev);
+void hl_cn_fini(struct hl_device *hdev);
+void hl_cn_stop(struct hl_device *hdev);
+int hl_cn_reopen(struct hl_device *hdev);
+int hl_cn_send_status(struct hl_device *hdev, int port, u8 cmd, u8 period);
+void hl_cn_hard_reset_prepare(struct hl_device *hdev, bool fw_reset);
+void hl_cn_synchronize_irqs(struct hl_device *hdev);
+int hl_cn_cpucp_info_get(struct hl_device *hdev);
+void *hl_cn_dma_alloc_coherent(struct hbl_aux_dev *aux_dev, size_t size, dma_addr_t *dma_handle,
+			       gfp_t flag);
+void hl_cn_dma_free_coherent(struct hbl_aux_dev *aux_dev, size_t size, void *cpu_addr,
+			     dma_addr_t dma_handle);
+void *hl_cn_dma_pool_zalloc(struct hbl_aux_dev *aux_dev, size_t size, gfp_t mem_flags,
+			    dma_addr_t *dma_handle);
+void hl_cn_dma_pool_free(struct hbl_aux_dev *aux_dev, void *vaddr, dma_addr_t dma_addr);
+void hl_cn_spmu_get_stats_info(struct hbl_aux_dev *aux_dev, u32 port, struct hbl_cn_stat **stats,
+				u32 *n_stats);
+int hl_cn_spmu_config(struct hbl_aux_dev *aux_dev, u32 port, u32 num_event_types, u32 event_types[],
+			bool enable);
+int hl_cn_spmu_sample(struct hbl_aux_dev *aux_dev, u32 port, u32 num_out_data, u64 out_data[]);
+int hl_cn_poll_reg(struct hbl_aux_dev *aux_dev, u32 reg, u64 timeout_us, hbl_cn_poll_cond_func func,
+			void *arg);
+int hl_cn_send_cpu_message(struct hbl_aux_dev *aux_dev, u32 *msg, u16 len, u32 timeout,
+				u64 *result);
+void hl_cn_post_send_status(struct hbl_aux_dev *aux_dev, u32 port);
+
+#endif /* CN_H_ */
diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 39e23d625a3c..bba6765100b2 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -2262,7 +2262,7 @@ static int cs_ioctl_signal_wait(struct hl_fpriv *hpriv, enum hl_cs_type cs_type,
 			goto free_cs_chunk_array;
 		}
 
-		if (!hdev->nic_ports_mask) {
+		if (!hdev->cn.ports_mask) {
 			atomic64_inc(&ctx->cs_counters.validation_drop_cnt);
 			atomic64_inc(&cntr->validation_drop_cnt);
 			dev_err(hdev->dev,
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 8f92445c5a90..bda3524fb1b4 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -963,6 +963,7 @@ static int device_early_init(struct hl_device *hdev)
 	INIT_LIST_HEAD(&hdev->fpriv_ctrl_list);
 	mutex_init(&hdev->fpriv_list_lock);
 	mutex_init(&hdev->fpriv_ctrl_list_lock);
+	mutex_init(&hdev->cn.hw_access_lock);
 	mutex_init(&hdev->clk_throttling.lock);
 
 	return 0;
@@ -1007,6 +1008,7 @@ static void device_early_fini(struct hl_device *hdev)
 	mutex_destroy(&hdev->debug_lock);
 	mutex_destroy(&hdev->send_cpu_message_lock);
 
+	mutex_destroy(&hdev->cn.hw_access_lock);
 	mutex_destroy(&hdev->fpriv_list_lock);
 	mutex_destroy(&hdev->fpriv_ctrl_list_lock);
 
@@ -1251,6 +1253,10 @@ static void take_release_locks(struct hl_device *hdev)
 	mutex_unlock(&hdev->fpriv_list_lock);
 	mutex_lock(&hdev->fpriv_ctrl_list_lock);
 	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
+
+	/* Flush CN flows */
+	mutex_lock(&hdev->cn.hw_access_lock);
+	mutex_unlock(&hdev->cn.hw_access_lock);
 }
 
 static void hl_abort_waiting_for_completions(struct hl_device *hdev)
@@ -1868,6 +1874,12 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 			goto out_err;
 		}
 
+		rc = hdev->asic_funcs->cn_init(hdev);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to init CN driver\n");
+			goto out_err;
+		}
+
 		if (!hdev->asic_prop.fw_security_enabled)
 			hl_fw_set_max_power(hdev);
 	} else {
@@ -2330,6 +2342,14 @@ int hl_device_init(struct hl_device *hdev)
 		goto out_disabled;
 	}
 
+	/* must be called after sysfs init for the auxiliary bus */
+	rc = hdev->asic_funcs->cn_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init CN driver\n");
+		rc = 0;
+		goto out_disabled;
+	}
+
 	/* Need to call this again because the max power might change,
 	 * depending on card type for certain ASICs
 	 */
@@ -2517,6 +2537,9 @@ void hl_device_fini(struct hl_device *hdev)
 
 	hl_cb_pool_fini(hdev);
 
+	/* CN uses the kernel context for MMU mappings, therefore must be cleaned before it */
+	hdev->asic_funcs->cn_fini(hdev);
+
 	/* Reset the H/W. It will be in idle state after this returns */
 	rc = hdev->asic_funcs->hw_fini(hdev, true, false);
 	if (rc)
diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 4bd02778a970..52bbfa093ae3 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1040,6 +1040,26 @@ int hl_fw_get_monitor_dump(struct hl_device *hdev, void *data)
 	return rc;
 }
 
+int hl_fw_cpucp_nic_info_get(struct hl_device *hdev, dma_addr_t cpucp_nic_info_dma_addr)
+{
+	struct cpucp_packet pkt = {};
+	u64 result;
+	int rc;
+
+	pkt.ctl = cpu_to_le32(CPUCP_PACKET_NIC_INFO_GET <<
+				CPUCP_PKT_CTL_OPCODE_SHIFT);
+	pkt.addr = cpu_to_le64(cpucp_nic_info_dma_addr);
+	pkt.data_max_size = cpu_to_le32(sizeof(struct cpucp_nic_info));
+
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
+					HL_CPUCP_INFO_TIMEOUT_USEC, &result);
+	if (rc)
+		dev_err(hdev->dev,
+			"Failed to handle CPU-CP NIC info pkt, error %d\n", rc);
+
+	return rc;
+}
+
 int hl_fw_cpucp_pci_counters_get(struct hl_device *hdev,
 		struct hl_info_pci_counters *counters)
 {
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 48f0f3eea1ef..907e54ce0066 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -32,6 +32,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 
+#include "../cn/cn.h"
 #include "security.h"
 
 #define HL_NAME				"habanalabs"
@@ -542,11 +543,25 @@ struct hl_hints_range {
 	u64 end_addr;
 };
 
+/**
+ * struct hl_cn_properties - ASIC specific properties.
+ * @cpucp_info: received various information from CPU-CP regarding the NIC
+ *              H/W, e.g. MAC addresses.
+ * @status_packet_size: size of the status packet we are going to send to F/W.
+ * @max_num_of_ports: maximum number of ports supported by ASIC.
+ */
+struct hl_cn_properties {
+	struct hbl_cn_cpucp_info cpucp_info;
+	u32 status_packet_size;
+	u8 max_num_of_ports;
+};
+
 /**
  * struct asic_fixed_properties - ASIC specific immutable properties.
  * @hw_queues_props: H/W queues properties.
  * @special_blocks: points to an array containing special blocks info.
  * @skip_special_blocks_cfg: special blocks skip configs.
+ * @cn_props: CN driver properties.
  * @cpucp_info: received various information from CPU-CP regarding the H/W, e.g.
  *		available sensors.
  * @uboot_ver: F/W U-boot version.
@@ -590,6 +605,9 @@ struct hl_hints_range {
  * @max_freq_value: current max clk frequency.
  * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
  *                                  in order to raise events toward FW.
+ * @nic_drv_addr: base address for NIC driver on DRAM.
+ * @nic_drv_size: driver size reserved for NIC driver on DRAM.
+ * @macro_cfg_size: the size of the macro configuration space.
  * @clk_pll_index: clock PLL index that specify which PLL determines the clock
  *                 we display to the user
  * @mmu_pgt_size: MMU page tables total size.
@@ -666,6 +684,7 @@ struct hl_hints_range {
  * @cache_line_size: device cache line size.
  * @server_type: Server type that the ASIC is currently installed in.
  *               The value is according to enum hl_server_type in uapi file.
+ * @clk: clock frequency in MHz.
  * @completion_queues_count: number of completion queues.
  * @completion_mode: 0 - job based completion, 1 - cs based completion
  * @mme_master_slave_mode: 0 - Each MME works independently, 1 - MME works
@@ -705,6 +724,7 @@ struct asic_fixed_properties {
 	struct hw_queue_properties	*hw_queues_props;
 	struct hl_special_block_info	*special_blocks;
 	struct hl_skip_blocks_cfg	skip_special_blocks_cfg;
+	struct hl_cn_properties		cn_props;
 	struct cpucp_info		cpucp_info;
 	char				uboot_ver[VERSION_MAX_LEN];
 	char				preboot_ver[VERSION_MAX_LEN];
@@ -742,6 +762,9 @@ struct asic_fixed_properties {
 	u64				host_end_address;
 	u64				max_freq_value;
 	u64				engine_core_interrupt_reg_addr;
+	u64				nic_drv_addr;
+	u64				nic_drv_size;
+	u32				macro_cfg_size;
 	u32				clk_pll_index;
 	u32				mmu_pgt_size;
 	u32				mmu_pte_size;
@@ -796,6 +819,7 @@ struct asic_fixed_properties {
 	u16				eq_interrupt_id;
 	u16				cache_line_size;
 	u16				server_type;
+	u16				clk;
 	u8				completion_queues_count;
 	u8				completion_mode;
 	u8				mme_master_slave_mode;
@@ -1562,10 +1586,14 @@ struct engines_data {
  *                    then the timeout is the default timeout for the specific
  *                    ASIC
  * @get_hw_state: retrieve the H/W state
+ * @cn_init: init the CN H/W and I/F. This should be called in the final stage of the init flow, as
+ *            we must not have anything that might fail during its initialization after the CN init.
+ * @cn_fini: perform CN cleanup.
  * @pci_bars_map: Map PCI BARs.
  * @init_iatu: Initialize the iATU unit inside the PCI controller.
  * @rreg: Read a register. Needed for simulator support.
  * @wreg: Write a register. Needed for simulator support.
+ * @get_reg_pcie_addr: Retrieve pci address.
  * @halt_coresight: stop the ETF and ETR traces.
  * @ctx_init: context dependent initialization.
  * @ctx_fini: context dependent cleanup.
@@ -1617,6 +1645,7 @@ struct engines_data {
  * @send_device_activity: indication to FW about device availability
  * @set_dram_properties: set DRAM related properties.
  * @set_binning_masks: set binning/enable masks for all relevant components.
+ * @cn_funcs: ASIC specific CN functions.
  */
 struct hl_asic_funcs {
 	int (*early_init)(struct hl_device *hdev);
@@ -1692,10 +1721,13 @@ struct hl_asic_funcs {
 	int (*get_monitor_dump)(struct hl_device *hdev, void *data);
 	int (*send_cpu_message)(struct hl_device *hdev, u32 *msg,
 				u16 len, u32 timeout, u64 *result);
+	int (*cn_init)(struct hl_device *hdev);
+	void (*cn_fini)(struct hl_device *hdev);
 	int (*pci_bars_map)(struct hl_device *hdev);
 	int (*init_iatu)(struct hl_device *hdev);
 	u32 (*rreg)(struct hl_device *hdev, u32 reg);
 	void (*wreg)(struct hl_device *hdev, u32 reg, u32 val);
+	int (*get_reg_pcie_addr)(struct hl_device *hdev, u32 reg, u64 *pci_addr);
 	void (*halt_coresight)(struct hl_device *hdev, struct hl_ctx *ctx);
 	int (*ctx_init)(struct hl_ctx *ctx);
 	void (*ctx_fini)(struct hl_ctx *ctx);
@@ -1751,6 +1783,7 @@ struct hl_asic_funcs {
 	int (*send_device_activity)(struct hl_device *hdev, bool open);
 	int (*set_dram_properties)(struct hl_device *hdev);
 	int (*set_binning_masks)(struct hl_device *hdev);
+	struct hl_cn_funcs *cn_funcs;
 };
 
 
@@ -3234,6 +3267,7 @@ struct hl_reset_info {
  * @asic_prop: ASIC specific immutable properties.
  * @asic_funcs: ASIC specific functions.
  * @asic_specific: ASIC specific information to use only from ASIC files.
+ * @cn: CN common structure.
  * @vm: virtual memory manager for MMU.
  * @hwmon_dev: H/W monitor device.
  * @hl_chip_info: ASIC's sensors information.
@@ -3353,7 +3387,6 @@ struct hl_reset_info {
  * @supports_ctx_switch: true if a ctx switch is required upon first submission.
  * @support_preboot_binning: true if we support read binning info from preboot.
  * @eq_heartbeat_received: indication that eq heartbeat event has received from FW.
- * @nic_ports_mask: Controls which NIC ports are enabled. Used only for testing.
  * @fw_components: Controls which f/w components to load to the device. There are multiple f/w
  *                 stages and sometimes we want to stop at a certain stage. Used only for testing.
  * @mmu_disable: Disable the device MMU(s). Used only for testing.
@@ -3413,6 +3446,7 @@ struct hl_device {
 	struct asic_fixed_properties	asic_prop;
 	const struct hl_asic_funcs	*asic_funcs;
 	void				*asic_specific;
+	struct hl_cn			cn;
 	struct hl_vm			vm;
 	struct device			*hwmon_dev;
 	struct hwmon_chip_info		*hl_chip_info;
@@ -3518,7 +3552,6 @@ struct hl_device {
 	u8				eq_heartbeat_received;
 
 	/* Parameters for bring-up to be upstreamed */
-	u64				nic_ports_mask;
 	u64				fw_components;
 	u8				mmu_disable;
 	u8				cpu_queues_enable;
@@ -3843,6 +3876,8 @@ void hl_userptr_delete_list(struct hl_device *hdev,
 bool hl_userptr_is_pinned(struct hl_device *hdev, u64 addr, u32 size,
 				struct list_head *userptr_list,
 				struct hl_userptr **userptr);
+int hl_map_vmalloc_range(struct hl_ctx *ctx, u64 vmalloc_va, u64 device_va, u64 size);
+int hl_unmap_vmalloc_range(struct hl_ctx *ctx, u64 device_va);
 
 int hl_mmu_init(struct hl_device *hdev);
 void hl_mmu_fini(struct hl_device *hdev);
@@ -3943,6 +3978,7 @@ int hl_fw_cpucp_handshake(struct hl_device *hdev,
 				u32 boot_err1_reg);
 int hl_fw_get_eeprom_data(struct hl_device *hdev, void *data, size_t max_size);
 int hl_fw_get_monitor_dump(struct hl_device *hdev, void *data);
+int hl_fw_cpucp_nic_info_get(struct hl_device *hdev, dma_addr_t cpucp_nic_info_dma_addr);
 int hl_fw_cpucp_pci_counters_get(struct hl_device *hdev,
 		struct hl_info_pci_counters *counters);
 int hl_fw_cpucp_total_energy_get(struct hl_device *hdev,
@@ -4059,6 +4095,9 @@ void hl_capture_engine_err(struct hl_device *hdev, u16 engine_id, u16 error_coun
 void hl_enable_err_info_capture(struct hl_error_info *captured_err_info);
 void hl_init_cpu_for_irq(struct hl_device *hdev);
 void hl_set_irq_affinity(struct hl_device *hdev, int irq);
+int hl_get_hw_block_handle(struct hl_device *hdev, u64 address,
+				u64 *handle, u32 *size);
+bool hl_check_fd(struct file *file);
 
 #ifdef CONFIG_DEBUG_FS
 
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index e542fd40e16c..cee81375bfdc 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -110,6 +110,11 @@ static const struct drm_driver hl_driver = {
 	.num_ioctls = ARRAY_SIZE(hl_drm_ioctls)
 };
 
+bool hl_check_fd(struct file *filp)
+{
+	return (filp->f_op == &hl_fops);
+}
+
 /*
  * get_asic_type - translate device id to asic type
  *
@@ -328,9 +333,27 @@ int hl_device_open_ctrl(struct inode *inode, struct file *filp)
 	return rc;
 }
 
+static u32 get_dev_nic_ports_mask(struct hl_device *hdev)
+{
+	enum hl_asic_type asic_type = hdev->asic_type;
+	u32 mask;
+
+	switch (asic_type) {
+	case ASIC_GAUDI2:
+	case ASIC_GAUDI2B:
+	case ASIC_GAUDI2C:
+		/* 24 ports are supported */
+		mask = 0xFFFFFF;
+		break;
+	default:
+		mask = 0;
+	}
+
+	return mask;
+}
+
 static void set_driver_behavior_per_device(struct hl_device *hdev)
 {
-	hdev->nic_ports_mask = 0;
 	hdev->fw_components = FW_TYPE_ALL_TYPES;
 	hdev->cpu_queues_enable = 1;
 	hdev->pldm = 0;
@@ -338,6 +361,7 @@ static void set_driver_behavior_per_device(struct hl_device *hdev)
 	hdev->bmc_enable = 1;
 	hdev->reset_on_preboot_fail = 1;
 	hdev->heartbeat = 1;
+	hdev->card_type = cpucp_card_type_pmc;
 }
 
 static void copy_kernel_module_params_to_device(struct hl_device *hdev)
@@ -377,6 +401,8 @@ static void fixup_device_params_per_asic(struct hl_device *hdev, int timeout)
 
 static int fixup_device_params(struct hl_device *hdev)
 {
+	struct hl_cn *cn = &hdev->cn;
+	u32 dev_nic_ports_mask;
 	int tmp_timeout;
 
 	tmp_timeout = timeout_locked;
@@ -405,6 +431,15 @@ static int fixup_device_params(struct hl_device *hdev)
 	/* If CPU queues not enabled, no way to do heartbeat */
 	if (!hdev->cpu_queues_enable)
 		hdev->heartbeat = 0;
+
+	/* Adjust NIC ports parameters according to the device in-hand */
+	dev_nic_ports_mask = get_dev_nic_ports_mask(hdev);
+
+	cn->ports_mask = dev_nic_ports_mask;
+	cn->ports_ext_mask = dev_nic_ports_mask;
+	cn->auto_neg_mask = dev_nic_ports_mask;
+	cn->skip_phy_init = hdev->pldm;
+
 	fixup_device_params_per_asic(hdev, tmp_timeout);
 
 	return 0;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 1dd6e23172ca..d8809c74ac0f 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -108,6 +108,8 @@ static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
 
 	hw_ip.edma_enabled_mask = prop->edma_enabled_mask;
 	hw_ip.server_type = prop->server_type;
+	hw_ip.nic_ports_mask = hdev->cn.ports_mask;
+	hw_ip.nic_ports_external_mask = hdev->cn.eth_ports_mask;
 	hw_ip.security_enabled = prop->fw_security_enabled;
 	hw_ip.revision_id = hdev->pdev->revision;
 	hw_ip.rotator_enabled_mask = prop->rotator_enabled_mask;
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 3348ad12c237..dd52b0ee0eef 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1424,6 +1424,12 @@ static int map_block(struct hl_device *hdev, u64 address, u64 *handle, u32 *size
 	return 0;
 }
 
+int hl_get_hw_block_handle(struct hl_device *hdev, u64 address,
+				u64 *handle, u32 *size)
+{
+	return map_block(hdev, address, handle, size);
+}
+
 static void hw_block_vm_close(struct vm_area_struct *vma)
 {
 	struct hl_vm_hw_block_list_node *lnode =
@@ -2940,3 +2946,120 @@ void hl_hw_block_mem_fini(struct hl_ctx *ctx)
 
 	mutex_destroy(&ctx->hw_block_list_lock);
 }
+
+/**
+ * hl_map_vmalloc_range - Map vmalloc allocation to PMMU.
+ * @ctx: Associated context.
+ * @vmalloc_va: Start vmalloc virtual address.
+ * @device_va: Start device virtual address.
+ * @size: Size of allocation to map.
+ *
+ * Return: 0 on success, -ve on failure.
+ */
+int hl_map_vmalloc_range(struct hl_ctx *ctx, u64 vmalloc_va, u64 device_va, u64 size)
+{
+	struct hl_device *hdev = ctx->hdev;
+	struct hl_userptr *userptr = NULL;
+	struct hl_vm_phys_pg_pack *phys_pg_pack = NULL;
+	struct hl_vm_hash_node *hnode;
+	int rc;
+
+	/*
+	 * Iterate through vmalloc pages and map them for DMA via sg-list.
+	 * No need to pin the pages since we are mapping kernel memory which
+	 * is never swapped out.
+	 */
+	rc = dma_map_host_va(hdev, vmalloc_va, size, &userptr);
+	if (rc) {
+		dev_err(hdev->dev, "DMA mapping failed, vaddr 0x%llx\n", vmalloc_va);
+		return rc;
+	}
+
+	/*
+	 * Create pack of host pages which we will later map to pmmu.
+	 * Do not allow huge page optimization. We have pre allocated
+	 * device VA with preset notion of alignment which is same as
+	 * host page alignment.
+	 */
+	rc = init_phys_pg_pack_from_userptr(ctx, userptr, &phys_pg_pack, true);
+	if (rc) {
+		dev_err(hdev->dev, "Unable to init page pack, vaddr 0x%llx\n", vmalloc_va);
+		goto err_dma_unmap;
+	}
+
+	/* Validate kernel host VA and device VA are aligned to pmmu page size. */
+	if (device_va & (phys_pg_pack->page_size - 1) ||
+		vmalloc_va & (phys_pg_pack->page_size - 1)) {
+		dev_err(hdev->dev,
+			"Unaligned mapping, host VA 0x%llx, device VA 0x%llx, page size 0x%x",
+			vmalloc_va, device_va, phys_pg_pack->page_size);
+		rc = -EINVAL;
+		goto err_free_page_pack;
+	}
+
+	mutex_lock(&hdev->mmu_lock);
+
+	/* Map page pack to pmmu */
+	rc = map_phys_pg_pack(ctx, device_va, phys_pg_pack);
+	if (rc) {
+		mutex_unlock(&hdev->mmu_lock);
+		dev_err(hdev->dev, "Mapping page pack failed, vaddr 0x%llx, device VA 0x%llx\n",
+			vmalloc_va, device_va);
+		goto err_free_page_pack;
+	}
+
+	rc = hl_mmu_invalidate_cache_range(hdev,
+			false, userptr->vm_type | MMU_OP_SKIP_LOW_CACHE_INV,
+			ctx->asid, device_va, phys_pg_pack->total_size);
+
+	mutex_unlock(&hdev->mmu_lock);
+
+	if (rc)
+		goto err_free_unmap_page_pack;
+
+	/*
+	 * Keep track of mapping. Add mapped chunk to global hash list.
+	 * Context release uses this list for force release if this mapping
+	 * is not released gracefully.
+	 */
+	hnode = kzalloc(sizeof(*hnode), GFP_KERNEL);
+	if (!hnode) {
+		rc = -ENOMEM;
+		goto err_free_unmap_page_pack;
+	}
+
+	hnode->ptr = (void *) userptr;
+	hnode->vaddr = device_va;
+
+	mutex_lock(&ctx->mem_hash_lock);
+	hash_add(ctx->mem_hash, &hnode->node, device_va);
+	mutex_unlock(&ctx->mem_hash_lock);
+
+	free_phys_pg_pack(hdev, phys_pg_pack);
+
+	return 0;
+
+err_free_unmap_page_pack:
+	unmap_phys_pg_pack(ctx, device_va, phys_pg_pack);
+err_free_page_pack:
+	free_phys_pg_pack(hdev, phys_pg_pack);
+err_dma_unmap:
+	dma_unmap_host_va(hdev, userptr);
+	return rc;
+}
+
+/**
+ * hl_unmap_vmalloc_range - Unmap vmalloc allocation from PMMU.
+ * @ctx: Associated context.
+ * @device_va: Start device virtual address.
+ *
+ * Return: 0 on success, -ve on failure.
+ */
+int hl_unmap_vmalloc_range(struct hl_ctx *ctx, u64 device_va)
+{
+	struct hl_mem_in args = {
+		.unmap.device_virt_addr = device_va,
+	};
+
+	return unmap_device_va(ctx, &args, false);
+}
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index f2b04ffb0ecb..e46bbe73fb82 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -1618,10 +1618,10 @@ static int gaudi_late_init(struct hl_device *hdev)
 	}
 
 	if ((hdev->card_type == cpucp_card_type_pci) &&
-			(hdev->nic_ports_mask & 0x3)) {
+			(hdev->cn.ports_mask & 0x3)) {
 		dev_info(hdev->dev,
 			"PCI card detected, only 8 ports are enabled\n");
-		hdev->nic_ports_mask &= ~0x3;
+		hdev->cn.ports_mask &= ~0x3;
 
 		/* Stop and disable unused NIC QMANs */
 		WREG32(mmNIC0_QM0_GLBL_CFG1, NIC0_QM0_GLBL_CFG1_PQF_STOP_MASK |
@@ -3243,7 +3243,7 @@ static void gaudi_init_nic_qmans(struct hl_device *hdev)
 			mmNIC1_QM0_GLBL_CFG0 - mmNIC0_QM0_GLBL_CFG0;
 	int i, nic_id, internal_q_index;
 
-	if (!hdev->nic_ports_mask)
+	if (!hdev->cn.ports_mask)
 		return;
 
 	if (gaudi->hw_cap_initialized & HW_CAP_NIC_MASK)
@@ -3252,7 +3252,7 @@ static void gaudi_init_nic_qmans(struct hl_device *hdev)
 	dev_dbg(hdev->dev, "Initializing NIC QMANs\n");
 
 	for (nic_id = 0 ; nic_id < NIC_NUMBER_OF_ENGINES ; nic_id++) {
-		if (!(hdev->nic_ports_mask & (1 << nic_id))) {
+		if (!(hdev->cn.ports_mask & (1 << nic_id))) {
 			nic_offset += nic_delta_between_qmans;
 			if (nic_id & 1) {
 				nic_offset -= (nic_delta_between_qmans * 2);
@@ -9117,6 +9117,11 @@ static int gaudi_send_device_activity(struct hl_device *hdev, bool open)
 	return 0;
 }
 
+static int gaudi_get_reg_pcie_addr(struct hl_device *hdev, u32 reg, u64 *pci_addr)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct hl_asic_funcs gaudi_funcs = {
 	.early_init = gaudi_early_init,
 	.early_fini = gaudi_early_fini,
@@ -9172,6 +9177,7 @@ static const struct hl_asic_funcs gaudi_funcs = {
 	.init_iatu = gaudi_init_iatu,
 	.rreg = hl_rreg,
 	.wreg = hl_wreg,
+	.get_reg_pcie_addr = gaudi_get_reg_pcie_addr,
 	.halt_coresight = gaudi_halt_coresight,
 	.ctx_init = gaudi_ctx_init,
 	.ctx_fini = gaudi_ctx_fini,
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index fa1c4feb9f89..a22d2a93394e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3222,7 +3222,7 @@ static void gaudi2_init_arcs(struct hl_device *hdev)
 			continue;
 
 		if (gaudi2_is_arc_nic_owned(arc_id) &&
-				!(hdev->nic_ports_mask & BIT_ULL(arc_id - CPU_ID_NIC_QMAN_ARC0)))
+				!(hdev->cn.ports_mask & BIT_ULL(arc_id - CPU_ID_NIC_QMAN_ARC0)))
 			continue;
 
 		if (gaudi2_is_arc_tpc_owned(arc_id) && !(gaudi2->tpc_hw_cap_initialized &
@@ -3996,7 +3996,7 @@ static void gaudi2_stop_nic_qmans(struct hl_device *hdev)
 	queue_id = GAUDI2_QUEUE_ID_NIC_0_0;
 
 	for (i = 0 ; i < NIC_NUMBER_OF_ENGINES ; i++, queue_id += NUM_OF_PQ_PER_QMAN) {
-		if (!(hdev->nic_ports_mask & BIT(i)))
+		if (!(hdev->cn.ports_mask & BIT(i)))
 			continue;
 
 		reg_base = gaudi2_qm_blocks_bases[queue_id];
@@ -4192,7 +4192,7 @@ static void gaudi2_disable_nic_qmans(struct hl_device *hdev)
 	queue_id = GAUDI2_QUEUE_ID_NIC_0_0;
 
 	for (i = 0 ; i < NIC_NUMBER_OF_ENGINES ; i++, queue_id += NUM_OF_PQ_PER_QMAN) {
-		if (!(hdev->nic_ports_mask & BIT(i)))
+		if (!(hdev->cn.ports_mask & BIT(i)))
 			continue;
 
 		reg_base = gaudi2_qm_blocks_bases[queue_id];
@@ -4661,7 +4661,7 @@ static void gaudi2_nic_qmans_manual_flush(struct hl_device *hdev)
 	queue_id = GAUDI2_QUEUE_ID_NIC_0_0;
 
 	for (i = 0 ; i < NIC_NUMBER_OF_ENGINES ; i++, queue_id += NUM_OF_PQ_PER_QMAN) {
-		if (!(hdev->nic_ports_mask & BIT(i)))
+		if (!(hdev->cn.ports_mask & BIT(i)))
 			continue;
 
 		gaudi2_qman_manual_flush_common(hdev, queue_id);
@@ -7279,7 +7279,7 @@ static bool gaudi2_get_nic_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 	u64 offset = 0;
 
 	/* NIC, twelve macros in Full chip */
-	if (e && hdev->nic_ports_mask)
+	if (e && hdev->cn.ports_mask)
 		hl_engine_data_sprintf(e,
 					"\nNIC  is_idle  QM_GLBL_STS0  QM_CGM_STS\n"
 					"---  -------  ------------  ----------\n");
@@ -7290,7 +7290,7 @@ static bool gaudi2_get_nic_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 		else
 			offset += NIC_QM_OFFSET;
 
-		if (!(hdev->nic_ports_mask & BIT(i)))
+		if (!(hdev->cn.ports_mask & BIT(i)))
 			continue;
 
 		engine_idx = GAUDI2_ENGINE_ID_NIC0_0 + i;
@@ -8333,7 +8333,7 @@ static void gaudi2_check_if_razwi_happened(struct hl_device *hdev)
 
 	/* check all NICs */
 	for (mod_idx = 0 ; mod_idx < NIC_NUMBER_OF_PORTS ; mod_idx++)
-		if (hdev->nic_ports_mask & BIT(mod_idx))
+		if (hdev->cn.ports_mask & BIT(mod_idx))
 			gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_NIC, mod_idx >> 1, 0,
 								NULL);
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index 34bf80c5a44b..bb837be47908 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -3493,7 +3493,7 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 	rc |= hl_init_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET,
 			HL_PB_SINGLE_INSTANCE, HL_PB_NA,
 			gaudi2_pb_nic0, ARRAY_SIZE(gaudi2_pb_nic0),
-			NULL, HL_PB_NA, hdev->nic_ports_mask);
+			NULL, HL_PB_NA, hdev->cn.ports_mask);
 
 	/* NIC QM and QPC */
 	rc |= hl_init_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET,
@@ -3501,7 +3501,7 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 			gaudi2_pb_nic0_qm_qpc, ARRAY_SIZE(gaudi2_pb_nic0_qm_qpc),
 			gaudi2_pb_nic0_qm_qpc_unsecured_regs,
 			ARRAY_SIZE(gaudi2_pb_nic0_qm_qpc_unsecured_regs),
-			hdev->nic_ports_mask);
+			hdev->cn.ports_mask);
 
 	/* NIC QM ARC */
 	rc |= hl_init_pb_ranges_with_mask(hdev, NIC_NUMBER_OF_MACROS,
@@ -3510,7 +3510,7 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 			ARRAY_SIZE(gaudi2_pb_nic0_qm_arc_aux0),
 			gaudi2_pb_nic0_qm_arc_aux0_unsecured_regs,
 			ARRAY_SIZE(gaudi2_pb_nic0_qm_arc_aux0_unsecured_regs),
-			hdev->nic_ports_mask);
+			hdev->cn.ports_mask);
 
 	/* NIC UMR */
 	rc |= hl_init_pb_ranges_with_mask(hdev, NIC_NUMBER_OF_MACROS,
@@ -3519,7 +3519,7 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 			ARRAY_SIZE(gaudi2_pb_nic0_umr),
 			gaudi2_pb_nic0_umr_unsecured_regs,
 			ARRAY_SIZE(gaudi2_pb_nic0_umr_unsecured_regs),
-			hdev->nic_ports_mask);
+			hdev->cn.ports_mask);
 
 	/* Rotators */
 	instance_offset = mmROT1_BASE - mmROT0_BASE;
@@ -3799,22 +3799,22 @@ void gaudi2_ack_protection_bits_errors(struct hl_device *hdev)
 
 	/* NIC */
 	hl_ack_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET, HL_PB_SINGLE_INSTANCE, HL_PB_NA,
-			gaudi2_pb_nic0, ARRAY_SIZE(gaudi2_pb_nic0), hdev->nic_ports_mask);
+			gaudi2_pb_nic0, ARRAY_SIZE(gaudi2_pb_nic0), hdev->cn.ports_mask);
 
 	/* NIC QM and QPC */
 	hl_ack_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET, NIC_NUMBER_OF_QM_PER_MACRO,
 			NIC_QM_OFFSET, gaudi2_pb_nic0_qm_qpc, ARRAY_SIZE(gaudi2_pb_nic0_qm_qpc),
-			hdev->nic_ports_mask);
+			hdev->cn.ports_mask);
 
 	/* NIC QM ARC */
 	hl_ack_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET, NIC_NUMBER_OF_QM_PER_MACRO,
 			NIC_QM_OFFSET, gaudi2_pb_nic0_qm_arc_aux0,
-			ARRAY_SIZE(gaudi2_pb_nic0_qm_arc_aux0), hdev->nic_ports_mask);
+			ARRAY_SIZE(gaudi2_pb_nic0_qm_arc_aux0), hdev->cn.ports_mask);
 
 	/* NIC UMR */
 	hl_ack_pb_with_mask(hdev, NIC_NUMBER_OF_MACROS, NIC_OFFSET, NIC_NUMBER_OF_QM_PER_MACRO,
 			NIC_QM_OFFSET, gaudi2_pb_nic0_umr, ARRAY_SIZE(gaudi2_pb_nic0_umr),
-			hdev->nic_ports_mask);
+			hdev->cn.ports_mask);
 
 	/* Rotators */
 	instance_offset = mmROT1_BASE - mmROT0_BASE;
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 5a359c3bdc78..e0a803bde463 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -5438,6 +5438,11 @@ static int goya_send_device_activity(struct hl_device *hdev, bool open)
 	return 0;
 }
 
+static int goya_get_reg_pcie_addr(struct hl_device *hdev, u32 reg, u64 *pci_addr)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct hl_asic_funcs goya_funcs = {
 	.early_init = goya_early_init,
 	.early_fini = goya_early_fini,
@@ -5493,6 +5498,7 @@ static const struct hl_asic_funcs goya_funcs = {
 	.init_iatu = goya_init_iatu,
 	.rreg = hl_rreg,
 	.wreg = hl_wreg,
+	.get_reg_pcie_addr = goya_get_reg_pcie_addr,
 	.halt_coresight = goya_halt_coresight,
 	.ctx_init = goya_ctx_init,
 	.ctx_fini = goya_ctx_fini,
diff --git a/drivers/accel/habanalabs/include/hw_ip/nic/nic_general.h b/drivers/accel/habanalabs/include/hw_ip/nic/nic_general.h
new file mode 100644
index 000000000000..5d300118d069
--- /dev/null
+++ b/drivers/accel/habanalabs/include/hw_ip/nic/nic_general.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+
+#ifndef INCLUDE_NIC_GENERAL_H_
+#define INCLUDE_NIC_GENERAL_H_
+
+#define HABANALABS_MAC_OUI_1	0xB0FD0B
+#define HABANALABS_MAC_OUI_2	0x68932E
+
+#endif /* INCLUDE_NIC_GENERAL_H_ */
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index a512dc4cffd0..c2c987ba3998 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -935,14 +935,14 @@ struct hl_info_hw_ip_info {
 	__u8 reserved2;
 	__u64 reserved3;
 	__u64 device_mem_alloc_default_page_size;
-	__u64 reserved4;
-	__u64 reserved5;
-	__u32 reserved6;
-	__u8 reserved7;
+	__u64 nic_ports_mask;
+	__u64 nic_ports_external_mask;
+	__u32 reserved4;
+	__u8 reserved5;
 	__u8 revision_id;
 	__u16 tpc_interrupt_id;
 	__u32 rotator_enabled_mask;
-	__u32 reserved9;
+	__u32 reserved6;
 	__u64 engine_core_interrupt_reg_addr;
 	__u64 reserved_dram_size;
 };
-- 
2.34.1

