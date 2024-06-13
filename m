Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F259084A7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB810EC51;
	Fri, 14 Jun 2024 07:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="hfTupOTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AB810E2C9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:22:48 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266939; bh=yVSciKdYFhFHpg7BUj/pTgB6YRqhLHxfDnzbpiV//T4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hfTupOTQZSrDsSANjT9+J0EfzhHG1ymNEj9esrpk9+TRanOuz6jo3NlqefLZ3onXB
 bIqpDblYO33+iSFziipKENiyg24KEh56T4XLWMf9ftslhbOdjrqUwvCpH1blD3Xafa
 q9qzMajYD1/eaXK9WgFE9Kcp1JYt/qrzC3P96ps2qhsdQdhtC1NdQm6lPu8Kk42P9P
 moqG54/B0wVapxZgEyCqL58TmDEmHIn6oPoP8IQuusgMJ+EXEDyLNleDfnZZzDs8/I
 Y+uIh4F83uXVBrTjlptSLZMDs4QhV/fIbMWi3p59HTF8bj0GAT/6Aj6iaSYre54cLe
 8IT8LmoiRtQ+g==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hg1440009; Thu, 13 Jun 2024 11:22:11 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Date: Thu, 13 Jun 2024 11:22:04 +0300
Message-Id: <20240613082208.1439968-12-oshpigelman@habana.ai>
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

Add an RDMA driver of Gaudi ASICs family for AI scaling.
The driver itself is agnostic to the ASIC in action, it operates according
to the capabilities that were passed on device initialization.
The device is initialized by the hbl_cn driver via auxiliary bus.
The driver also supports QP resource tracking and port/device HW counters.

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
 MAINTAINERS                              |   10 +
 drivers/infiniband/Kconfig               |    1 +
 drivers/infiniband/hw/Makefile           |    1 +
 drivers/infiniband/hw/hbl/Kconfig        |   17 +
 drivers/infiniband/hw/hbl/Makefile       |    8 +
 drivers/infiniband/hw/hbl/hbl.h          |  326 +++
 drivers/infiniband/hw/hbl/hbl_main.c     |  478 ++++
 drivers/infiniband/hw/hbl/hbl_verbs.c    | 2686 ++++++++++++++++++++++
 include/uapi/rdma/hbl-abi.h              |  204 ++
 include/uapi/rdma/hbl_user_ioctl_cmds.h  |   66 +
 include/uapi/rdma/hbl_user_ioctl_verbs.h |  106 +
 include/uapi/rdma/ib_user_ioctl_verbs.h  |    1 +
 12 files changed, 3904 insertions(+)
 create mode 100644 drivers/infiniband/hw/hbl/Kconfig
 create mode 100644 drivers/infiniband/hw/hbl/Makefile
 create mode 100644 drivers/infiniband/hw/hbl/hbl.h
 create mode 100644 drivers/infiniband/hw/hbl/hbl_main.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_verbs.c
 create mode 100644 include/uapi/rdma/hbl-abi.h
 create mode 100644 include/uapi/rdma/hbl_user_ioctl_cmds.h
 create mode 100644 include/uapi/rdma/hbl_user_ioctl_verbs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 01b82e9b672c..d754eb13cb58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9627,6 +9627,16 @@ F:	drivers/net/ethernet/intel/hbl_en/
 F:	include/linux/net/intel/cn*
 F:	include/linux/net/intel/gaudi2*
 
+HABANALABS IB DRIVER
+M:	Omer Shpigelman <oshpigelman@habana.ai>
+L:	linux-rdma@vger.kernel.org
+S:	Supported
+W:	https://www.habana.ai
+Q:	https://patchwork.kernel.org/project/linux-rdma/list/
+F:	drivers/infiniband/hw/hbl/
+F:	include/linux/net/intel/cn*
+F:	include/uapi/rdma/hbl-abi.h
+
 HACKRF MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
index a5827d11e934..8f913558b816 100644
--- a/drivers/infiniband/Kconfig
+++ b/drivers/infiniband/Kconfig
@@ -83,6 +83,7 @@ source "drivers/infiniband/hw/bnxt_re/Kconfig"
 source "drivers/infiniband/hw/cxgb4/Kconfig"
 source "drivers/infiniband/hw/efa/Kconfig"
 source "drivers/infiniband/hw/erdma/Kconfig"
+source "drivers/infiniband/hw/hbl/Kconfig"
 source "drivers/infiniband/hw/hfi1/Kconfig"
 source "drivers/infiniband/hw/hns/Kconfig"
 source "drivers/infiniband/hw/irdma/Kconfig"
diff --git a/drivers/infiniband/hw/Makefile b/drivers/infiniband/hw/Makefile
index 1211f4317a9f..e8fc49b1bb03 100644
--- a/drivers/infiniband/hw/Makefile
+++ b/drivers/infiniband/hw/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_INFINIBAND_MTHCA)		+= mthca/
 obj-$(CONFIG_INFINIBAND_QIB)		+= qib/
 obj-$(CONFIG_INFINIBAND_CXGB4)		+= cxgb4/
 obj-$(CONFIG_INFINIBAND_EFA)		+= efa/
+obj-$(CONFIG_INFINIBAND_HBL)		+= hbl/
 obj-$(CONFIG_INFINIBAND_IRDMA)		+= irdma/
 obj-$(CONFIG_MANA_INFINIBAND)		+= mana/
 obj-$(CONFIG_MLX4_INFINIBAND)		+= mlx4/
diff --git a/drivers/infiniband/hw/hbl/Kconfig b/drivers/infiniband/hw/hbl/Kconfig
new file mode 100644
index 000000000000..90c865a82540
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# HabanaLabs (an Intel Company) Infiniband driver configuration
+#
+
+config INFINIBAND_HBL
+	tristate "HabanaLabs (an Intel Company) InfiniBand driver"
+	depends on NETDEVICES && ETHERNET && PCI && INET
+	select HABANA_CN
+	help
+	  This driver enables InfiniBand functionality for the network
+	  interfaces that are part of the GAUDI ASIC family of AI Accelerators.
+	  The network interfaces are mainly used for scaling-out the training of
+	  AI Neural Networks through ROCEv2 protocol.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called habanalabs_ib.
diff --git a/drivers/infiniband/hw/hbl/Makefile b/drivers/infiniband/hw/hbl/Makefile
new file mode 100644
index 000000000000..659d4bbfec0f
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for HabanaLabs (an Intel Company) Infiniband driver
+#
+
+obj-$(CONFIG_INFINIBAND_HBL) := habanalabs_ib.o
+
+habanalabs_ib-y += hbl_main.o hbl_verbs.o
diff --git a/drivers/infiniband/hw/hbl/hbl.h b/drivers/infiniband/hw/hbl/hbl.h
new file mode 100644
index 000000000000..4fbe2368fd11
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl.h
@@ -0,0 +1,326 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef _HBL_H_
+#define _HBL_H_
+
+#include <linux/net/intel/cn.h>
+
+#include <uapi/rdma/hbl-abi.h>
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+#include <uapi/rdma/hbl_user_ioctl_verbs.h>
+#include <rdma/ib_verbs.h>
+#include <linux/pci.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/xarray.h>
+
+#define HBL_IB_MAX_PORT_GIDS 13
+
+/* For internal ports, only one GID is required and that is based on the MAC address. */
+#define HBL_IB_MAX_PORT_GIDS_INTERNAL 1
+
+/* define maximum supported send and receive SGEs */
+#define HBL_IB_MAX_SEND_SGE 2
+#define HBL_IB_MAX_RECV_SGE 2
+
+#define HBL_IB_EQ_PORT_FIELD_MASK 0xFFFF
+#define HBL_IB_EQ_PORT_FIELD_SIZE 16
+
+/**
+ * struct hbl_ib_user_mmap_entry - Mmap information.
+ * @rdma_entry: IB core rdma mmap entry.
+ * @info: Information for performing mmap.
+ */
+struct hbl_ib_user_mmap_entry {
+	struct rdma_user_mmap_entry rdma_entry;
+	struct hbl_ib_mem_info info;
+};
+
+/**
+ * struct hbl_ib_pd - Habanalabs IB PD.
+ * @ibpd: IB core PD.
+ * @pdn: PD ID.
+ */
+struct hbl_ib_pd {
+	struct ib_pd ibpd;
+	u32 pdn;
+};
+
+/**
+ * struct hbl_ib_ucontext - Habanalabs IB user context.
+ * @ibucontext: IB core user context.
+ * @qp_xarray: QP handle.
+ * @cn_ctx: CN context private data.
+ * @pd_allocated: is PD allocated.
+ * @ports_mask: Mask of ports associated with this context.
+ */
+struct hbl_ib_ucontext {
+	struct ib_ucontext ibucontext;
+	struct xarray qp_xarray;
+	void *cn_ctx;
+	atomic_t pd_allocated;
+	u64 ports_mask;
+};
+
+/**
+ * struct hbl_ib_cq - Habanalabs IB CQ.
+ * @ibcq: IB core CQ.
+ * @hctx: HBL IB context.
+ * @mem_handle_entry: Mmap entry for the mem handle.
+ * @pi_handle_entry: Mmap entry for the pi handle.
+ * @regs_handle_entry: Mmap entry for the regs handle.
+ * @port_cq: contains the hbl_ib_cq structure per port.
+ * @cq_type: Type of CQ resource
+ * @cq_num: CQ number that was allocated.
+ * @hbl_port_num: hbl port number that matches with the core code's port number.
+ * @is_native: If this is native create cq call or dv create cq call.
+ */
+struct hbl_ib_cq {
+	struct ib_cq ibcq;
+	struct hbl_ib_ucontext *hctx;
+	struct rdma_user_mmap_entry *mem_handle_entry;
+	struct rdma_user_mmap_entry *pi_handle_entry;
+	struct rdma_user_mmap_entry *regs_handle_entry;
+	struct hbl_ib_cq *port_cq;
+	enum hbl_ibv_cq_type cq_type;
+	u32 cq_num;
+	u8 hbl_port_num;
+	u8 is_native;
+};
+
+/**
+ * struct hbl_ib_qp - Habanalabs IB QP.
+ * @ibqp: IB core QP.
+ * @hctx: hbl IB context.
+ * @swq_mem_handle_entry: Mmap entry for the swq mem handle.
+ * @rwq_mem_handle_entry: Mmap entry for the rwq mem handle.
+ * @qp_state: Current QP state.
+ * @wq_type: WQ type.
+ * @qp_id: hbl core QP ID.
+ * @dest_qp_num: destination qp number.
+ * @max_send_wr: maximum send work requests supported.
+ * @max_recv_wr: maximum receive work requests supported.
+ * @mtu: QP mtu.
+ * @dst_ip_addr: destination IPv4 address.
+ * @dst_mac_addr: destination MAC address.
+ * @wq_granularity: send WQE granularity.
+ */
+struct hbl_ib_qp {
+	struct ib_qp ibqp;
+	struct hbl_ib_ucontext *hctx;
+	struct rdma_user_mmap_entry *swq_mem_handle_entry;
+	struct rdma_user_mmap_entry *rwq_mem_handle_entry;
+	enum ib_qp_state qp_state;
+	enum qpc_req_wq_type wq_type;
+	u32 qp_id;
+	u32 dest_qp_num;
+	u32 max_send_wr;
+	u32 max_recv_wr;
+	u32 mtu;
+	u32 dst_ip_addr;
+	u8 dst_mac_addr[ETH_ALEN];
+	u8 wq_granularity;
+};
+
+/**
+ * struct gid_entry - IB GID structure.
+ * @gid: IB global identifier.
+ * @gid_type: IB GID type.
+ */
+struct gid_entry {
+	union ib_gid gid;
+	enum ib_gid_type gid_type;
+};
+
+/**
+ * struct hbl_ib_port_init_params - Habanalabs IB port input parameters.
+ * @wq_arr_attr: Array of WQ-array attributes for each WQ-array type.
+ * @qp_wq_bp_offs: Offsets in NIC memory to signal a back pressure.
+ * @hbl_port_num: hbl port number that matches with the core code's port number.
+ * @advanced: WQ should support advanced operations such as RDV, QMan, WTD, etc.
+ * @adaptive_timeout_en: Enable adaptive_timeout feature on the port.
+ */
+struct hbl_ib_port_init_params {
+	struct hbl_wq_array_attr wq_arr_attr[HBL_IB_WQ_ARRAY_TYPE_MAX];
+	u32 qp_wq_bp_offs[HBL_IB_MAX_BP_OFFS];
+	u32 hbl_port_num;
+	u8 advanced;
+	u8 adaptive_timeout_en;
+};
+
+/**
+ * struct hbl_ib_port - Habanalabs IB port.
+ * @hdev: Habanalabs IB device.
+ * @hctx: hbl IB context.
+ * @gids: Array of GIDs (group IDs).
+ * @hbl_ibcq_tbl: CQ IDs table.
+ * @eq_comp: Completion object for event queue.
+ * @eq_thread: Event queue thread.
+ * @eq_lock: Event queue handling synchronization object.
+ * @port: Port ID.
+ * @mtu: Port MTU.
+ * @swqs_enabled: Array of send WQs from each type which indicate if WQ is enabled.
+ * @rwqs_enabled: Array of receive WQs from each type which indicate if WQ is enabled.
+ * @open: Port initialized.
+ */
+struct hbl_ib_port {
+	struct hbl_ib_device *hdev;
+	struct hbl_ib_ucontext *hctx;
+	struct gid_entry gids[HBL_IB_MAX_PORT_GIDS];
+	struct xarray hbl_ibcq_tbl;
+	struct completion eq_comp;
+	struct task_struct *eq_thread;
+	atomic_t eq_lock;
+	u32 port;
+	u32 mtu;
+	u8 swqs_enabled[HBL_IB_WQ_ARRAY_TYPE_MAX];
+	u8 rwqs_enabled[HBL_IB_WQ_ARRAY_TYPE_MAX];
+	u8 open;
+};
+
+/**
+ * struct hbl_ib_device_stats - IB device counters structure.
+ * @fatal_event: Fatal events counter.
+ */
+struct hbl_ib_device_stats {
+	atomic_t fatal_event;
+};
+
+/**
+ * struct hbl_ib_port_stats - IB port counters info.
+ * @stat_desc: Core rdma stats structure of the counters.
+ * @names: Names of the counters.
+ * @num: Number of counters.
+ */
+struct hbl_ib_port_stats {
+	struct rdma_stat_desc *stat_desc;
+	u8 **names;
+	u32 num;
+};
+
+/**
+ * struct hbl_ib_device - habanalabs IB device structure.
+ * @ibdev: IB device.
+ * @dev_stats: Device counters.
+ * @netdev_notifier: netdev events notifier.
+ * @port_stats: Array of port counters.
+ * @pdev: Pointer to PCI device.
+ * @dev: Related kernel basic device structure.
+ * @aux_dev: Pointer to auxiliary device.
+ * @ib_port: IB port structure.
+ * @hbl_to_ib_port_map: mapping array between hbl port to IB port.
+ * @dev_lock: Device lock for configuration serialization.
+ * @ctx_open: User context allocated.
+ * @ports_mask: Mask of available ports.
+ * @ext_ports_mask: Mask of external ports (subset of ports_mask).
+ * @pending_reset_long_timeout: Long timeout for pending hard reset to finish in seconds.
+ * @id: Core device ID.
+ * @max_num_of_ports: Maximum number of ports supported by ASIC.
+ * @mixed_qp_wq_types: Using mixed QP WQ types is supported.
+ * @umr_support: device supports UMR.
+ * @cc_support: device supports congestion control.
+ */
+struct hbl_ib_device {
+	struct ib_device ibdev;
+	struct hbl_ib_device_stats dev_stats;
+	struct notifier_block netdev_notifier;
+	struct hbl_ib_port_stats *port_stats;
+	struct pci_dev *pdev;
+	struct device *dev;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_port *ib_port;
+	u32 *hbl_to_ib_port_map;
+	atomic_t ctx_open;
+	u64 ports_mask;
+	u64 ext_ports_mask;
+	u32 pending_reset_long_timeout;
+	u16 id;
+	u8 max_num_of_ports;
+	u8 mixed_qp_wq_types;
+	u8 umr_support;
+	u8 cc_support;
+};
+
+extern const struct ib_device_ops hbl_ib_dev_ops;
+extern const struct uapi_definition hbl_usr_fifo_defs[];
+extern const struct uapi_definition hbl_set_port_ex_defs[];
+extern const struct uapi_definition hbl_query_port_defs[];
+extern const struct uapi_definition hbl_encap_defs[];
+
+static inline struct hbl_ib_device *to_hbl_ib_dev(struct ib_device *ibdev)
+{
+	return container_of(ibdev, struct hbl_ib_device, ibdev);
+}
+
+static inline struct hbl_ib_ucontext *to_hbl_ib_ucontext(struct ib_ucontext *ibucontext)
+{
+	return container_of(ibucontext, struct hbl_ib_ucontext, ibucontext);
+}
+
+static inline u32 hbl_to_ib_port_num(struct hbl_ib_device *hdev, u32 hbl_port_num)
+{
+	return hdev->hbl_to_ib_port_map[hbl_port_num];
+}
+
+static inline int ib_to_hbl_port_num(struct hbl_ib_device *hdev, u32 ib_port_num, u32 *hbl_port_num)
+{
+	u32 hbl_port;
+
+	if (!ib_port_num)
+		return -EINVAL;
+
+	for (hbl_port = 0; hbl_port < hdev->max_num_of_ports; hbl_port++)
+		if (hbl_to_ib_port_num(hdev, hbl_port) == ib_port_num) {
+			*hbl_port_num = hbl_port;
+			return 0;
+		}
+
+	return -EINVAL;
+}
+
+static inline struct hbl_ib_user_mmap_entry *
+to_hbl_ib_user_mmap_entry(struct rdma_user_mmap_entry *rdma_entry)
+{
+	return container_of(rdma_entry, struct hbl_ib_user_mmap_entry, rdma_entry);
+}
+
+struct rdma_user_mmap_entry *
+hbl_ib_user_mmap_entry_insert(struct ib_ucontext *ucontext, u64 address, size_t length,
+			      u64 *offset);
+
+#define hbl_ibdev_emerg(ibdev, format, ...)	ibdev_emerg(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_alert(ibdev, format, ...)	ibdev_alert(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_crit(ibdev, format, ...)	ibdev_crit(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_err(ibdev, format, ...)	ibdev_err(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_warn(ibdev, format, ...)	ibdev_warn(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_notice(ibdev, format, ...)	ibdev_notice(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_info(ibdev, format, ...)	ibdev_info(ibdev, format, ##__VA_ARGS__)
+#define hbl_ibdev_dbg(ibdev, format, ...)	ibdev_dbg(ibdev, format, ##__VA_ARGS__)
+
+#define hbl_ibdev_emerg_ratelimited(ibdev, fmt, ...)		\
+	ibdev_emerg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_alert_ratelimited(ibdev, fmt, ...)		\
+	ibdev_alert_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_crit_ratelimited(ibdev, fmt, ...)		\
+	ibdev_crit_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_err_ratelimited(ibdev, fmt, ...)		\
+	ibdev_err_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_warn_ratelimited(ibdev, fmt, ...)		\
+	ibdev_warn_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_notice_ratelimited(ibdev, fmt, ...)		\
+	ibdev_notice_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_info_ratelimited(ibdev, fmt, ...)		\
+	ibdev_info_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+#define hbl_ibdev_dbg_ratelimited(ibdev, fmt, ...)		\
+	ibdev_dbg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
+
+int hbl_ib_port_init(struct hbl_ib_ucontext *hctx, struct hbl_ib_port_init_params *init_params);
+void hbl_ib_eqe_handler(struct hbl_ib_port *ib_port);
+void hbl_ib_eqe_null_work(struct hbl_aux_dev *aux_dev, u32 port);
+void hbl_ib_eqe_work_schd(struct hbl_aux_dev *aux_dev, u32 port);
+
+#endif /* _HBL_H_ */
diff --git a/drivers/infiniband/hw/hbl/hbl_main.c b/drivers/infiniband/hw/hbl/hbl_main.c
new file mode 100644
index 000000000000..98d3ed46bfe2
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_main.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#define pr_fmt(fmt)		"habanalabs_ib: " fmt
+
+#include "hbl.h"
+
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+
+#define HBL_DRIVER_AUTHOR	"HabanaLabs Kernel Driver Team"
+
+#define HBL_DRIVER_DESC		"HabanaLabs AI accelerators InfiniBand driver"
+
+MODULE_AUTHOR(HBL_DRIVER_AUTHOR);
+MODULE_DESCRIPTION(HBL_DRIVER_DESC);
+MODULE_LICENSE("GPL");
+
+#define MTU_DEFAULT	SZ_4K
+
+static void hbl_ib_port_event(struct ib_device *ibdev, u32 port_num, enum ib_event_type reason)
+{
+	struct ib_event event;
+
+	event.device = ibdev;
+	event.element.port_num = port_num;
+	event.event = reason;
+
+	ib_dispatch_event(&event);
+}
+
+static void hbl_ib_port_mtu_update(struct ib_device *ibdev, u32 hbl_port, u32 mtu)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+
+	hdev->ib_port[hbl_port].mtu = mtu;
+}
+
+static bool hbl_ib_match_netdev(struct ib_device *ibdev, struct net_device *netdev)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+	struct hbl_ib_aux_data *aux_data;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->aux_dev;
+	aux_data = aux_dev->aux_data;
+
+	/* IB and EN share the same PCI device, hence we can find the correct netdev to bind to
+	 * ibdev through the pointer to this device and port index.
+	 */
+	if (&hdev->pdev->dev == netdev->dev.parent)
+		return true;
+
+	return false;
+}
+
+static int hbl_ib_netdev_event(struct notifier_block *notifier, unsigned long event, void *ptr)
+{
+	struct hbl_ib_device *hdev = container_of(notifier, struct hbl_ib_device, netdev_notifier);
+	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
+	struct ib_device *ibdev = &hdev->ibdev;
+	u32 ib_port;
+
+	if (hbl_ib_match_netdev(ibdev, netdev))
+		ib_port = hbl_to_ib_port_num(hdev, netdev->dev_port);
+	else
+		return NOTIFY_DONE;
+
+	switch (event) {
+	case NETDEV_UP:
+		hbl_ib_port_event(ibdev, ib_port, IB_EVENT_PORT_ACTIVE);
+		break;
+	case NETDEV_DOWN:
+		hbl_ib_port_event(ibdev, ib_port, IB_EVENT_PORT_ERR);
+		break;
+	case NETDEV_REGISTER:
+		ib_device_set_netdev(ibdev, netdev, ib_port);
+		hbl_ib_port_mtu_update(ibdev, netdev->dev_port, netdev->mtu);
+		break;
+	case NETDEV_UNREGISTER:
+		hbl_ib_port_mtu_update(ibdev, netdev->dev_port, MTU_DEFAULT);
+		ib_device_set_netdev(ibdev, NULL, ib_port);
+		break;
+	case NETDEV_CHANGEMTU:
+		hbl_ib_port_mtu_update(ibdev, netdev->dev_port, netdev->mtu);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static void hbl_ib_dispatch_fatal_event(struct hbl_aux_dev *aux_dev, u32 asid)
+{
+	struct hbl_ib_device *hdev = aux_dev->priv;
+	struct ib_event ibev = {};
+
+	atomic_inc(&hdev->dev_stats.fatal_event);
+
+	hbl_ibdev_err(&hdev->ibdev, "raising fatal event for context with ASID %d\n", asid);
+
+	ibev.device = &hdev->ibdev;
+	ibev.event = IB_EVENT_DEVICE_FATAL;
+	ibev.element.port_num = HBL_IB_EQ_PORT_FIELD_MASK | (asid << HBL_IB_EQ_PORT_FIELD_SIZE);
+	ib_dispatch_event(&ibev);
+}
+
+static void hbl_ib_set_aux_ops(struct hbl_ib_device *hdev, bool enable)
+{
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+
+	/* map cn2ib functions */
+	if (enable)
+		aux_ops->eqe_work_schd = hbl_ib_eqe_null_work;
+	else
+		aux_ops->eqe_work_schd = NULL;
+
+	aux_ops->dispatch_fatal_event = hbl_ib_dispatch_fatal_event;
+}
+
+static int hbl_ib_dev_init(struct hbl_ib_device *hdev)
+{
+	char name[IB_DEVICE_NAME_MAX] = {0};
+	struct ib_device *ibdev;
+	u32 max_num_of_ports;
+	int rc, i, port_cnt;
+
+	ibdev = &hdev->ibdev;
+
+	ibdev->node_type = RDMA_NODE_UNSPECIFIED;
+	ibdev->dev.parent = &hdev->pdev->dev;
+
+	max_num_of_ports = hdev->max_num_of_ports;
+
+	/* Allocation of the mapping array between hbl<->ib ports.
+	 * We don't need to initialize this array with some special value as 0 is an invalid value
+	 * for IB port.
+	 */
+	hdev->hbl_to_ib_port_map = kcalloc(max_num_of_ports, sizeof(u32), GFP_KERNEL);
+	if (!hdev->hbl_to_ib_port_map)
+		return -ENOMEM;
+
+	port_cnt = 0;
+	for (i = 0; i < max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		port_cnt++;
+		hdev->hbl_to_ib_port_map[i] = port_cnt;
+	}
+
+	ibdev->phys_port_cnt = port_cnt;
+
+	/* The number of Completion vectors (i.e. MSI-X vectors) available for this RDMA device.
+	 * For now have it as '1'
+	 */
+	ibdev->num_comp_vectors = 1;
+
+	ib_set_device_ops(ibdev, &hbl_ib_dev_ops);
+
+	/* The CN driver might start calling the aux functions after registering the device so set
+	 * the callbacks here.
+	 */
+	hbl_ib_set_aux_ops(hdev, true);
+
+	snprintf(name, sizeof(name), "hbl_%d", hdev->id);
+
+	rc = ib_register_device(ibdev, name, &hdev->pdev->dev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to register IB device, err %d\n", rc);
+		goto ibdev_register_fail;
+	}
+
+	hdev->netdev_notifier.notifier_call = hbl_ib_netdev_event;
+
+	rc = register_netdevice_notifier(&hdev->netdev_notifier);
+	if (rc) {
+		hbl_ibdev_err(ibdev, "Failed to register netdev notifier, err %d\n", rc);
+		goto notifier_register_fail;
+	}
+
+	hbl_ibdev_info(ibdev, "IB device registered\n");
+
+	return 0;
+
+notifier_register_fail:
+	ib_unregister_device(ibdev);
+ibdev_register_fail:
+	hbl_ib_set_aux_ops(hdev, false);
+	kfree(hdev->hbl_to_ib_port_map);
+	return rc;
+}
+
+static void hbl_ib_dev_fini(struct hbl_ib_device *hdev)
+{
+	struct ib_device *ibdev = &hdev->ibdev;
+
+	hbl_ibdev_info(ibdev, "Unregister IB device\n");
+	unregister_netdevice_notifier(&hdev->netdev_notifier);
+	ib_unregister_device(ibdev);
+	hbl_ib_set_aux_ops(hdev, false);
+	kfree(hdev->hbl_to_ib_port_map);
+}
+
+/* Initialize an array of strings to hold the counters names.
+ * We get the names as one long spaced string and then we convert it to an array of strings like the
+ * IB counters API expects.
+ */
+static int hbl_ib_cnts_init(struct hbl_ib_device *hdev, int port)
+{
+	struct hbl_ib_port_cnts_data *cnts_data;
+	struct hbl_ib_port_stats *port_stats;
+	struct rdma_stat_desc *stat_desc;
+	struct hbl_ib_aux_data *aux_data;
+	u8 *ptr, *data, **data2;
+	int cnt_num, i;
+
+	aux_data = hdev->aux_dev->aux_data;
+	port_stats = &hdev->port_stats[port];
+	cnts_data = &aux_data->cnts_data[port];
+	cnt_num = cnts_data->num;
+
+	/* array for strings and pointers for them */
+	data = kcalloc(cnt_num, (sizeof(u8 *) + HBL_IB_CNT_NAME_LEN), GFP_KERNEL);
+	if (!data)
+		goto exit_err;
+
+	stat_desc = kcalloc(cnt_num, sizeof(*stat_desc), GFP_KERNEL);
+	if (!stat_desc)
+		goto free_data;
+
+	/* copy the strings after the pointers to them */
+	ptr = data + cnt_num * sizeof(u8 *);
+	memcpy(ptr, cnts_data->names, cnt_num * HBL_IB_CNT_NAME_LEN);
+
+	data2 = (u8 **)data;
+
+	/* set the pointers to the strings */
+	for (i = 0; i < cnt_num; i++)
+		data2[i] = ptr + i * HBL_IB_CNT_NAME_LEN;
+
+	port_stats->num = cnt_num;
+	port_stats->names = data2;
+
+	for (i = 0; i < cnt_num; i++)
+		stat_desc[i].name = data2[i];
+
+	port_stats->stat_desc = stat_desc;
+
+	return 0;
+
+free_data:
+	kfree(data);
+exit_err:
+	return -ENOMEM;
+}
+
+static void hbl_ib_cnts_fini(struct hbl_ib_device *hdev, int port)
+{
+	kfree(hdev->port_stats[port].stat_desc);
+	kfree(hdev->port_stats[port].names);
+}
+
+static int hdev_init(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_ib_aux_data *aux_data = aux_dev->aux_data;
+	struct hbl_ib_device *hdev;
+	int rc, i;
+
+	hdev = ib_alloc_device(hbl_ib_device, ibdev);
+	if (!hdev)
+		return -ENOMEM;
+
+	aux_dev->priv = hdev;
+	hdev->aux_dev = aux_dev;
+	hdev->pdev = aux_data->pdev;
+	hdev->dev = aux_data->dev;
+	hdev->ports_mask = aux_data->ports_mask;
+	hdev->ext_ports_mask = aux_data->ext_ports_mask;
+	hdev->pending_reset_long_timeout = aux_data->pending_reset_long_timeout;
+	hdev->id = aux_data->id;
+	hdev->max_num_of_ports = aux_data->max_num_of_ports;
+	hdev->mixed_qp_wq_types = aux_data->mixed_qp_wq_types;
+	hdev->umr_support = aux_data->umr_support;
+	hdev->cc_support = aux_data->cc_support;
+
+	/* Allocate port structs */
+	hdev->ib_port = kcalloc(hdev->max_num_of_ports, sizeof(*hdev->ib_port), GFP_KERNEL);
+	if (!hdev->ib_port) {
+		rc = -ENOMEM;
+		goto free_device;
+	}
+
+	/* Set default MTU value that can be overridden later by netdev */
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		hdev->ib_port[i].mtu = MTU_DEFAULT;
+	}
+
+	hdev->port_stats = kcalloc(hdev->max_num_of_ports, sizeof(*hdev->port_stats), GFP_KERNEL);
+	if (!hdev->port_stats) {
+		rc = -ENOMEM;
+		goto free_ports;
+	}
+
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		rc = hbl_ib_cnts_init(hdev, i);
+		if (rc)
+			goto free_cnts;
+	}
+
+	return 0;
+
+free_cnts:
+	for (--i; i >= 0; i--) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		hbl_ib_cnts_fini(hdev, i);
+	}
+	kfree(hdev->port_stats);
+free_ports:
+	kfree(hdev->ib_port);
+free_device:
+	aux_dev->priv = NULL;
+	ib_dealloc_device(&hdev->ibdev);
+
+	return rc;
+}
+
+static void hdev_fini(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_ib_device *hdev = aux_dev->priv;
+	int i;
+
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		hbl_ib_cnts_fini(hdev, i);
+	}
+	kfree(hdev->port_stats);
+
+	kfree(hdev->ib_port);
+
+	aux_dev->priv = NULL;
+	ib_dealloc_device(&hdev->ibdev);
+}
+
+static const struct auxiliary_device_id hbl_ib_id_table[] = {
+	{ .name = "habanalabs_cn.ib", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, hbl_ib_id_table);
+
+static int hbl_ib_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
+	struct hbl_ib_aux_ops *aux_ops = aux_dev->aux_ops;
+	struct hbl_ib_device *hdev;
+	ktime_t timeout;
+	int rc;
+
+	rc = hdev_init(aux_dev);
+	if (rc) {
+		dev_err(&aux_dev->adev.dev, "Failed to init hdev\n");
+		return -EIO;
+	}
+
+	hdev = aux_dev->priv;
+
+	/* don't allow module unloading while it is attached */
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(hdev->dev, "Failed to increment %s module refcount\n",
+			module_name(THIS_MODULE));
+		rc = -EIO;
+		goto module_get_err;
+	}
+
+	timeout = ktime_add_ms(ktime_get(), hdev->pending_reset_long_timeout * MSEC_PER_SEC);
+	while (1) {
+		aux_ops->hw_access_lock(aux_dev);
+
+		/* if the device is operational, proceed to actual init while holding the lock in
+		 * order to prevent concurrent hard reset
+		 */
+		if (aux_ops->device_operational(aux_dev))
+			break;
+
+		aux_ops->hw_access_unlock(aux_dev);
+
+		if (ktime_compare(ktime_get(), timeout) > 0) {
+			dev_err(hdev->dev, "Timeout while waiting for hard reset to finish\n");
+			rc = -EBUSY;
+			goto timeout_err;
+		}
+
+		dev_notice_once(hdev->dev, "Waiting for hard reset to finish before probing IB\n");
+
+		msleep_interruptible(MSEC_PER_SEC);
+	}
+
+	rc = hbl_ib_dev_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init ib device\n");
+		goto dev_init_err;
+	}
+
+	aux_ops->hw_access_unlock(aux_dev);
+
+	return 0;
+
+dev_init_err:
+	aux_ops->hw_access_unlock(aux_dev);
+timeout_err:
+	module_put(THIS_MODULE);
+module_get_err:
+	hdev_fini(aux_dev);
+
+	return rc;
+}
+
+/* This function can be called only from the CN driver when deleting the aux bus, because we
+ * incremented the module refcount on probing. Hence no need to protect here from hard reset.
+ */
+static void hbl_ib_remove(struct auxiliary_device *adev)
+{
+	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
+	struct hbl_ib_device *hdev = aux_dev->priv;
+
+	if (!hdev)
+		return;
+
+	hbl_ib_dev_fini(hdev);
+
+	/* allow module unloading as now it is detached */
+	module_put(THIS_MODULE);
+
+	hdev_fini(aux_dev);
+}
+
+static struct auxiliary_driver hbl_ib_driver = {
+	.name = "ib",
+	.probe = hbl_ib_probe,
+	.remove = hbl_ib_remove,
+	.id_table = hbl_ib_id_table,
+};
+
+static int __init hbl_ib_init(void)
+{
+	pr_info("loading driver\n");
+
+	return auxiliary_driver_register(&hbl_ib_driver);
+}
+
+static void __exit hbl_ib_exit(void)
+{
+	auxiliary_driver_unregister(&hbl_ib_driver);
+
+	pr_info("driver removed\n");
+}
+
+module_init(hbl_ib_init);
+module_exit(hbl_ib_exit)
diff --git a/drivers/infiniband/hw/hbl/hbl_verbs.c b/drivers/infiniband/hw/hbl/hbl_verbs.c
new file mode 100644
index 000000000000..624bcd7290f0
--- /dev/null
+++ b/drivers/infiniband/hw/hbl/hbl_verbs.c
@@ -0,0 +1,2686 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include <rdma/ib_addr.h>
+#include <rdma/uverbs_ioctl.h>
+#include <linux/net/intel/cni.h>
+#include <linux/bitfield.h>
+#include <linux/ctype.h>
+#include <linux/vmalloc.h>
+
+#include "hbl.h"
+#include <uapi/rdma/hbl_user_ioctl_cmds.h>
+#include <uapi/rdma/hbl_user_ioctl_verbs.h>
+
+#define HBL_IB_MAX_QP				BIT(10)
+#define HBL_IB_MAX_CQE				BIT(13)
+#define HBL_IB_MAX_MSG_SIZE			SZ_1G
+#define HBL_IB_DEFAULT_MAX_NUM_OF_QPS		128
+#define HBL_IB_DEFAULT_MAX_NUM_WQES_IN_WQ	256
+#define HBL_IB_DEFAULT_WQ_MEM_ID		HBL_CNI_MEM_HOST
+#define HBL_IB_DUMP_QP_SZ			SZ_1K
+
+static int verify_qp_xarray(struct hbl_ib_qp *hblqp);
+static void qp_user_mmap_entries_remove(struct hbl_ib_qp *qp);
+
+enum hbl_ib_device_stats_type {
+	FATAL_EVENT,
+};
+
+static const struct rdma_stat_desc hbl_ib_device_stats[] = {
+	{ .name = "fatal_event",},
+};
+
+static inline struct hbl_ib_pd *to_hbl_ib_pd(struct ib_pd *ibpd)
+{
+	return container_of(ibpd, struct hbl_ib_pd, ibpd);
+}
+
+static inline struct hbl_ib_qp *to_hbl_ib_qp(struct ib_qp *ibqp)
+{
+	return container_of(ibqp, struct hbl_ib_qp, ibqp);
+}
+
+static inline struct hbl_ib_cq *to_hbl_ib_cq(struct ib_cq *ibcq)
+{
+	return container_of(ibcq, struct hbl_ib_cq, ibcq);
+}
+
+static inline u64 to_hbl_port_mask(struct hbl_ib_device *hdev, u64 ib_port_mask)
+{
+	u32 hbl_port_num, ib_port_num;
+	u64 hbl_port_mask = 0x0;
+
+	for (hbl_port_num = 0; hbl_port_num < hdev->max_num_of_ports; hbl_port_num++) {
+		ib_port_num = hbl_to_ib_port_num(hdev, hbl_port_num);
+		if (!ib_port_num)
+			continue;
+
+		if (ib_port_mask & BIT_ULL(ib_port_num))
+			hbl_port_mask |= BIT_ULL(hbl_port_num);
+	}
+
+	return hbl_port_mask;
+}
+
+static inline u64 to_ib_port_mask(struct hbl_ib_device *hdev, u64 hbl_port_mask)
+{
+	u32 hbl_port_num, ib_port_num;
+	u64 ib_port_mask = 0x0;
+
+	for (hbl_port_num = 0; hbl_port_num < hdev->max_num_of_ports; hbl_port_num++) {
+		if (!(hbl_port_mask & BIT(hbl_port_num)))
+			continue;
+
+		ib_port_num = hbl_to_ib_port_num(hdev, hbl_port_num);
+
+		/* The IB ports are 1 based, hence getting zero value means that we have bug in the
+		 * hbl<->ib port mapping.
+		 */
+		WARN_ON(!ib_port_num);
+
+		ib_port_mask |= BIT_ULL(ib_port_num);
+	}
+
+	return ib_port_mask;
+}
+
+struct rdma_user_mmap_entry *
+hbl_ib_user_mmap_entry_insert(struct ib_ucontext *ucontext, u64 handle, size_t length, u64 *offset)
+{
+	struct hbl_ib_user_mmap_entry *entry;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	int rc;
+
+	ibdev = ucontext->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return ERR_PTR(-ENOMEM);
+
+	rc = aux_ops->query_mem_handle(aux_dev, handle, &entry->info);
+	if (rc)
+		goto err_free_entry;
+
+	rc = rdma_user_mmap_entry_insert_range(ucontext, &entry->rdma_entry, length, 1,  U32_MAX);
+	if (rc)
+		goto err_free_entry;
+
+	*offset = rdma_user_mmap_get_offset(&entry->rdma_entry);
+
+	return &entry->rdma_entry;
+
+err_free_entry:
+	kfree(entry);
+	return ERR_PTR(rc);
+}
+
+static int to_hbl_wq_arr_types(struct ib_device *ibdev, enum hbl_ib_wq_array_type ib_wq_arr_type,
+			       enum hbl_nic_mem_type *swq_type, enum hbl_nic_mem_type *rwq_type)
+{
+	switch (ib_wq_arr_type) {
+	case HBL_IB_WQ_ARRAY_TYPE_GENERIC:
+		*swq_type = HBL_CNI_USER_WQ_SEND;
+		*rwq_type = HBL_CNI_USER_WQ_RECV;
+		break;
+	default:
+		hbl_ibdev_err(ibdev, "Invalid WQ array type %d\n", ib_wq_arr_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hbl_ib_wqs_init(struct hbl_ib_port *ib_port, struct hbl_ib_ucontext *hctx,
+			   struct hbl_ib_port_init_params *init_params,
+			   enum hbl_ib_wq_array_type ib_wq_arr_type)
+{
+	struct hbl_cni_user_wq_arr_unset_in wq_arr_unset_in = {};
+	struct hbl_cni_user_wq_arr_set_out wq_arr_set_out = {};
+	struct hbl_cni_user_wq_arr_set_in wq_arr_set_in = {};
+	enum hbl_nic_mem_type swq_type, rwq_type;
+	struct hbl_wq_array_attr *wq_arr_attr;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	u32 port;
+	int rc;
+
+	hdev = ib_port->hdev;
+	port = ib_port->port;
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = to_hbl_wq_arr_types(ibdev, ib_wq_arr_type, &swq_type, &rwq_type);
+	if (rc)
+		return rc;
+
+	wq_arr_attr = &init_params->wq_arr_attr[ib_wq_arr_type];
+
+	if (!wq_arr_attr->max_num_of_wqs || !wq_arr_attr->max_num_of_wqes_in_wq)
+		return 0;
+
+	wq_arr_set_in.port = port;
+	wq_arr_set_in.num_of_wqs = wq_arr_attr->max_num_of_wqs;
+	wq_arr_set_in.num_of_wq_entries = wq_arr_attr->max_num_of_wqes_in_wq;
+	wq_arr_set_in.mem_id = wq_arr_attr->mem_id;
+	wq_arr_set_in.swq_granularity = wq_arr_attr->swq_granularity;
+
+	wq_arr_set_in.type = swq_type;
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_WQ_SET,  &wq_arr_set_in,
+			       &wq_arr_set_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set send WQ, port %d\n", port);
+		return rc;
+	}
+
+	ib_port->swqs_enabled[ib_wq_arr_type] = true;
+
+	wq_arr_set_in.type = rwq_type;
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_WQ_SET, &wq_arr_set_in,
+			       &wq_arr_set_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set recv WQ, port %d\n", port);
+		goto clear_send_wq;
+	}
+
+	ib_port->rwqs_enabled[ib_wq_arr_type] = true;
+
+	return 0;
+
+clear_send_wq:
+	wq_arr_unset_in.port = port;
+	wq_arr_unset_in.type = swq_type;
+	aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_WQ_UNSET, &wq_arr_unset_in, NULL);
+	ib_port->swqs_enabled[ib_wq_arr_type] = false;
+
+	return rc;
+}
+
+static void hbl_ib_wqs_fini(struct hbl_ib_port *ib_port, struct hbl_ib_ucontext *hctx,
+			    enum hbl_ib_wq_array_type ib_wq_arr_type)
+{
+	struct hbl_cni_user_wq_arr_unset_in wq_arr_unset_in = {};
+	enum hbl_nic_mem_type swq_type, rwq_type;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	u32 port;
+	int rc;
+
+	hdev = ib_port->hdev;
+	port = ib_port->port;
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = to_hbl_wq_arr_types(ibdev, ib_wq_arr_type, &swq_type, &rwq_type);
+	if (rc)
+		return;
+
+	wq_arr_unset_in.port = port;
+
+	if (ib_port->rwqs_enabled[ib_wq_arr_type]) {
+		wq_arr_unset_in.type = rwq_type;
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_WQ_UNSET,
+				       &wq_arr_unset_in, NULL);
+		if (rc)
+			hbl_ibdev_dbg(ibdev, "failed to unset recv WQ, port %d\n", port);
+
+		ib_port->rwqs_enabled[ib_wq_arr_type] = false;
+	}
+
+	if (ib_port->swqs_enabled[ib_wq_arr_type]) {
+		wq_arr_unset_in.type = swq_type;
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_WQ_UNSET,
+				       &wq_arr_unset_in, NULL);
+		if (rc)
+			hbl_ibdev_dbg(ibdev, "failed to unset send WQ, port %d\n", port);
+
+		ib_port->swqs_enabled[ib_wq_arr_type] = false;
+	}
+}
+
+static void hbl_ib_port_clear(struct hbl_ib_ucontext *hctx, int port)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	struct hbl_ib_port *ib_port = &hdev->ib_port[port];
+
+	/* Clean IB port struct from previous CTX allocations */
+	memset(ib_port, 0, sizeof(*ib_port));
+}
+
+static int hbl_ib_eq_func(void *param)
+{
+	unsigned long timeout = msecs_to_jiffies(60 * MSEC_PER_SEC);
+	struct hbl_ib_port *ib_port = param;
+	int rc;
+
+	while (!kthread_should_stop()) {
+		/* Use timeout to avoid warnings for sleeping too long */
+		rc = wait_for_completion_interruptible_timeout(&ib_port->eq_comp, timeout);
+
+		/* No need to iterate on the devices when timed out or signaled, but only when
+		 * completed.
+		 */
+		if (rc > 0)
+			hbl_ib_eqe_handler(ib_port);
+	}
+
+	return 0;
+}
+
+static int hbl_ib_eq_init(struct hbl_ib_port *ib_port)
+{
+	struct ib_device *ibdev = &ib_port->hdev->ibdev;
+	char eq_th_name[32] = {0};
+	u32 port = ib_port->port;
+	int rc;
+
+	init_completion(&ib_port->eq_comp);
+	atomic_set(&ib_port->eq_lock, 0);
+
+	snprintf(eq_th_name, sizeof(eq_th_name) - 1, "hbl_eq%d", port);
+	ib_port->eq_thread = kthread_run(hbl_ib_eq_func, ib_port, eq_th_name);
+	if (IS_ERR(ib_port->eq_thread)) {
+		rc = PTR_ERR(ib_port->eq_thread);
+		hbl_ibdev_dbg(ibdev, "failed to create an EQ thread, port %d, err %d\n", port, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void hbl_ib_eqe_fini(struct hbl_ib_port *ib_port)
+{
+	while (atomic_cmpxchg(&ib_port->eq_lock, 0, 1))
+		usleep_range(50, 200);
+
+	complete_all(&ib_port->eq_comp);
+	kthread_stop(ib_port->eq_thread);
+}
+
+int hbl_ib_port_init(struct hbl_ib_ucontext *hctx, struct hbl_ib_port_init_params *init_params)
+{
+	struct hbl_cni_set_user_app_params_in set_app_params_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_port *ib_port;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	u32 port;
+	int rc;
+
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	port = init_params->hbl_port_num;
+
+	ib_port = &hdev->ib_port[port];
+
+	ib_port->hdev = hdev;
+	ib_port->port = port;
+
+	ib_port->hctx = hctx;
+
+	set_app_params_in.port = port;
+	set_app_params_in.advanced = init_params->advanced;
+	set_app_params_in.adaptive_timeout_en = init_params->adaptive_timeout_en;
+	memcpy(set_app_params_in.bp_offs, init_params->qp_wq_bp_offs,
+	       sizeof(set_app_params_in.bp_offs));
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_SET_USER_APP_PARAMS,
+			       &set_app_params_in, NULL);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set app params, port %d\n", port);
+		return rc;
+	}
+
+	/* Create pointer table to hold pointer to allocated ib_cq structs.
+	 * We need them to post dispatch IB events.
+	 */
+	xa_init(&ib_port->hbl_ibcq_tbl);
+
+	rc = hbl_ib_wqs_init(ib_port, hctx, init_params, HBL_IB_WQ_ARRAY_TYPE_GENERIC);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to init WQs, port %d\n", port);
+		goto destroy_xa;
+	}
+
+	rc = hbl_ib_eq_init(ib_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to init EQ completion object, port %d\n", port);
+		goto clean_wqs;
+	}
+
+	ib_port->open = true;
+
+	return 0;
+
+clean_wqs:
+	hbl_ib_wqs_fini(ib_port, hctx, HBL_IB_WQ_ARRAY_TYPE_GENERIC);
+destroy_xa:
+	xa_destroy(&ib_port->hbl_ibcq_tbl);
+	return rc;
+}
+
+static void hbl_ib_port_fini(struct hbl_ib_ucontext *hctx, u32 port)
+{
+	struct hbl_ib_port *ib_port;
+	struct hbl_ib_device *hdev;
+
+	hdev = to_hbl_ib_dev(hctx->ibucontext.device);
+	ib_port = &hdev->ib_port[port];
+
+	if (!ib_port->open)
+		return;
+
+	hbl_ib_eqe_fini(ib_port);
+
+	hbl_ib_wqs_fini(ib_port, hctx, HBL_IB_WQ_ARRAY_TYPE_GENERIC);
+
+	xa_destroy(&ib_port->hbl_ibcq_tbl);
+}
+
+static int hbl_ib_alloc_ucontext(struct ib_ucontext *ibucontext, struct ib_udata *udata)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibucontext->device);
+	struct hbl_ib_ucontext *hctx = to_hbl_ib_ucontext(ibucontext);
+	struct hbl_ib_port_init_params port_init_params = {};
+	struct hbl_ibv_alloc_ucontext_resp resp = {};
+	struct ib_device *ibdev = ibucontext->device;
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ibv_alloc_ucontext_req req = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	u64 user_ports_mask;
+	int rc, i;
+
+	aux_ops = aux_dev->aux_ops;
+
+	rc = ib_copy_from_udata(&req, udata, min(sizeof(req), udata->inlen));
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to copy in udata for alloc_ucontext\n");
+		return rc;
+	}
+
+	user_ports_mask = req.ports_mask;
+
+	/* If the user didn't provide mask, we should use the core mask, which is 0-based.
+	 * Otherwise, the user provides 1-based mask, so we need to convert it to core mask.
+	 */
+	if (!user_ports_mask)
+		user_ports_mask = hdev->ports_mask;
+	else
+		user_ports_mask = to_hbl_port_mask(hdev, user_ports_mask);
+
+	if (user_ports_mask & ~hdev->ports_mask) {
+		hbl_ibdev_dbg(ibdev, "user ports mask (0x%llx) contains a disabled port\n",
+			      user_ports_mask);
+		return -EINVAL;
+	}
+
+	if (atomic_cmpxchg(&hdev->ctx_open, 0, 1)) {
+		hbl_ibdev_dbg(ibdev, "ucontext is already allocated\n");
+		return -EBUSY;
+	}
+
+	rc = aux_ops->alloc_ucontext(aux_dev, req.core_fd, &hctx->cn_ctx);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "alloc context failed\n");
+		goto exit;
+	}
+
+	/* Clear all the Ports */
+	for (i = 0; i < hdev->max_num_of_ports; i++)
+		hbl_ib_port_clear(hctx, i);
+
+	xa_init_flags(&hctx->qp_xarray, XA_FLAGS_ALLOC);
+
+	/* If alloc context called from non-DV flow, need to initialize the ports here */
+	if (!req.use_dvs) {
+		struct hbl_wq_array_attr *gen_wq_arr_attr =
+				&port_init_params.wq_arr_attr[HBL_IB_WQ_ARRAY_TYPE_GENERIC];
+
+		gen_wq_arr_attr->max_num_of_wqs = HBL_IB_DEFAULT_MAX_NUM_OF_QPS;
+		gen_wq_arr_attr->max_num_of_wqes_in_wq = HBL_IB_DEFAULT_MAX_NUM_WQES_IN_WQ;
+		gen_wq_arr_attr->mem_id = HBL_IB_DEFAULT_WQ_MEM_ID;
+
+		for (i = 0; i < hdev->max_num_of_ports; i++) {
+			if (!(user_ports_mask & BIT(i)))
+				continue;
+
+			port_init_params.hbl_port_num = i;
+			rc = hbl_ib_port_init(hctx, &port_init_params);
+			if (rc)
+				goto uninit_ports;
+		}
+	}
+
+	hctx->ports_mask = user_ports_mask;
+
+	/* Here we should return ib mask, which is 1-based */
+	resp.ports_mask = to_ib_port_mask(hdev, user_ports_mask);
+
+	if (hdev->umr_support)
+		resp.cap_mask |= HBL_UCONTEXT_CAP_MMAP_UMR;
+	if (hdev->cc_support)
+		resp.cap_mask |= HBL_UCONTEXT_CAP_CC;
+
+	rc = ib_copy_to_udata(udata, &resp, min(sizeof(resp), udata->outlen));
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to copy out udata for alloc ucontext\n");
+		goto uninit_ports;
+	}
+
+	/* User context is allocated - set the handler for future EQE (should be last) */
+	aux_ops->eqe_work_schd = hbl_ib_eqe_work_schd;
+
+	hbl_ibdev_dbg(ibdev, "IB context was allocated\n");
+
+	return 0;
+
+uninit_ports:
+	for (--i; i >= 0; i--) {
+		if (!(user_ports_mask & BIT(i)))
+			continue;
+
+		hbl_ib_port_fini(hctx, i);
+	}
+	xa_destroy(&hctx->qp_xarray);
+	aux_ops->dealloc_ucontext(aux_dev, hctx->cn_ctx);
+exit:
+	atomic_set(&hdev->ctx_open, 0);
+
+	return rc;
+}
+
+static void hbl_ib_dealloc_ucontext(struct ib_ucontext *ibucontext)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibucontext->device);
+	struct hbl_ib_ucontext *hctx = to_hbl_ib_ucontext(ibucontext);
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_aux_ops *aux_ops;
+	int i;
+
+	aux_ops = aux_dev->aux_ops;
+
+	/* User context is dealocated, prevent from future EQE call the handler */
+	aux_ops->eqe_work_schd = hbl_ib_eqe_null_work;
+
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (!(hctx->ports_mask & BIT(i)))
+			continue;
+
+		hbl_ib_port_fini(hctx, i);
+	}
+
+	/* Core uverbs enforces that all ucontext sub-resources (e.g. QPs) are already released by
+	 * the time we reach here. Hence, no need to check for active xarray IDs.
+	 */
+	xa_destroy(&hctx->qp_xarray);
+
+	aux_ops->dealloc_ucontext(aux_dev, hctx->cn_ctx);
+
+	atomic_set(&hdev->ctx_open, 0);
+
+	hbl_ibdev_dbg(&hdev->ibdev, "IB context was deallocated\n");
+}
+
+static void hbl_ib_get_dev_fw_str(struct ib_device *device, char *str)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(device);
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_device_attr dev_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+	aux_ops->query_device(aux_dev, &dev_attr);
+
+	snprintf(str, IB_FW_VERSION_NAME_MAX, "%d.%u.%u", (u32)(dev_attr.fw_ver >> 32),
+		 (u16)FIELD_GET((0xffff << 16), dev_attr.fw_ver), (u16)(dev_attr.fw_ver & 0xffff));
+}
+
+static enum rdma_link_layer hbl_ib_port_link_layer(struct ib_device *ibdev, u32 port_num)
+{
+	return IB_LINK_LAYER_ETHERNET;
+}
+
+static int hbl_ib_get_port_immutable(struct ib_device *ibdev, u32 port_num,
+				     struct ib_port_immutable *immutable)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+	struct ib_port_attr attr;
+	u32 hport = 0;
+	int rc;
+
+	rc = ib_to_hbl_port_num(hdev, port_num, &hport);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", port_num);
+		return rc;
+	}
+
+	rc = ib_query_port(ibdev, port_num, &attr);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Couldn't query port %d, rc %d\n", port_num, rc);
+		return rc;
+	}
+
+	immutable->pkey_tbl_len = attr.pkey_tbl_len;
+	immutable->gid_tbl_len = attr.gid_tbl_len;
+
+	if (hdev->ext_ports_mask & BIT(hport))
+		/* RoCEv1 is used for MAC based address resolution on L2 networks.
+		 * while RoCEv2 is used for IP based address resolution on L3 networks.
+		 */
+		immutable->core_cap_flags = RDMA_CORE_CAP_PROT_ROCE_UDP_ENCAP |
+					    RDMA_CORE_CAP_PROT_ROCE;
+	else
+		/* Since the internal ports are not advertised to netdev, we need to advertise them
+		 * as plain IB to the IB core.
+		 */
+		immutable->core_cap_flags = RDMA_CORE_CAP_PROT_IB;
+
+	return 0;
+}
+
+static int hbl_ib_query_device(struct ib_device *ibdev, struct ib_device_attr *props,
+			       struct ib_udata *udata)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_device_attr dev_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+
+	if (udata && udata->inlen && !ib_is_udata_cleared(udata, 0, udata->inlen)) {
+		hbl_ibdev_dbg(ibdev, "Incompatible ABI params, udata not cleared\n");
+		return -EINVAL;
+	}
+
+	memset(props, 0, sizeof(*props));
+
+	aux_ops->query_device(aux_dev, &dev_attr);
+
+	props->fw_ver = dev_attr.fw_ver;
+	props->max_mr = 1;
+	props->max_mr_size = dev_attr.max_mr_size;
+	props->page_size_cap = dev_attr.page_size_cap;
+
+	props->vendor_id = dev_attr.vendor_id;
+	props->vendor_part_id = dev_attr.vendor_part_id;
+	props->hw_ver = dev_attr.hw_ver;
+
+	props->max_qp = dev_attr.max_qp;
+	props->max_qp_wr = dev_attr.max_qp_wr;
+
+	props->device_cap_flags = IB_DEVICE_RAW_MULTI |
+				  IB_DEVICE_CHANGE_PHY_PORT |
+				  IB_DEVICE_CURR_QP_STATE_MOD |
+				  IB_DEVICE_SHUTDOWN_PORT |
+				  IB_DEVICE_PORT_ACTIVE_EVENT |
+				  IB_DEVICE_RC_RNR_NAK_GEN |
+				  IB_DEVICE_N_NOTIFY_CQ;
+
+	/* RR is unsupported but we need at least 2 max sge to pass pyverbs test */
+	props->max_send_sge = HBL_IB_MAX_SEND_SGE;
+	props->max_recv_sge = HBL_IB_MAX_RECV_SGE;
+
+	/* RD is unsupported */
+	props->max_sge_rd = 0;
+	props->max_cq = 1;
+	props->max_cqe = dev_attr.max_cqe;
+
+	props->max_pd = 1;
+	props->atomic_cap = IB_ATOMIC_NONE;
+	props->max_raw_ipv6_qp = 1;
+	props->max_raw_ethy_qp = 1;
+	props->max_pkeys = 1;
+
+	if (udata && udata->outlen)
+		hbl_ibdev_dbg(ibdev, "Failed to copy udata for query_device\n");
+
+	return 0;
+}
+
+static u32 conv_lane_to_ib_width(u32 num_lanes)
+{
+	switch (num_lanes) {
+	case 1:
+		return IB_WIDTH_1X;
+	case 2:
+		return IB_WIDTH_2X;
+	case 4:
+		return IB_WIDTH_4X;
+	default:
+		return IB_WIDTH_4X;
+	}
+}
+
+static u32 conv_speed_to_ib_speed(u32 port_speed, u8 lanes)
+{
+	u32 speed_per_lane = port_speed / lanes;
+
+	switch (speed_per_lane) {
+	case SPEED_25000:
+		return IB_SPEED_EDR;
+	case SPEED_50000:
+		return IB_SPEED_HDR;
+	case SPEED_100000:
+		return IB_SPEED_NDR;
+	default:
+		return IB_SPEED_HDR;
+	}
+}
+
+static int hbl_ib_query_port(struct ib_device *ibdev, u32 port, struct ib_port_attr *props)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_port_attr port_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	u32 hport;
+	int rc;
+
+	rc = ib_to_hbl_port_num(hdev, port, &hport);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", port);
+		return rc;
+	}
+
+	aux_ops = aux_dev->aux_ops;
+	aux_ops->query_port(aux_dev, hport, &port_attr);
+
+	props->state = port_attr.open ? IB_PORT_ACTIVE : IB_PORT_DOWN;
+	props->max_mtu = ib_mtu_int_to_enum(port_attr.max_mtu);
+
+	/* external ports: Use value initialized in hbl_ib_port.
+	 * Internal ports: Hard code 4KB for now
+	 */
+	props->active_mtu = ib_mtu_int_to_enum(hdev->ib_port[hport].mtu);
+	if (hdev->ext_ports_mask & BIT(hport))
+		props->gid_tbl_len = HBL_IB_MAX_PORT_GIDS;
+	else
+		props->gid_tbl_len = HBL_IB_MAX_PORT_GIDS_INTERNAL;
+
+	props->max_msg_sz = port_attr.max_msg_sz;
+	props->pkey_tbl_len = 1;
+
+	props->active_speed = conv_speed_to_ib_speed(port_attr.speed, port_attr.num_lanes);
+	props->active_width = conv_lane_to_ib_width(port_attr.num_lanes);
+
+	props->phys_state = port_attr.link_up ? IB_PORT_PHYS_STATE_LINK_UP :
+			    IB_PORT_PHYS_STATE_DISABLED;
+
+	return 0;
+}
+
+static int hbl_ib_alloc_pd(struct ib_pd *ibpd, struct ib_udata *udata)
+{
+	struct hbl_ib_ucontext *hctx = rdma_udata_to_drv_context(udata, struct hbl_ib_ucontext,
+								 ibucontext);
+	struct hbl_ib_pd *pd = to_hbl_ib_pd(ibpd);
+	struct hbl_ibv_alloc_pd_resp resp = {};
+	struct ib_device *ibdev = ibpd->device;
+	int rc;
+
+	if (udata->inlen && !ib_is_udata_cleared(udata, 0, udata->inlen)) {
+		hbl_ibdev_dbg(ibdev, "Incompatible ABI params, udata not cleared\n");
+		return -EINVAL;
+	}
+
+	/* currently only a single PD is supoprted */
+	if (atomic_cmpxchg(&hctx->pd_allocated, 0, 1)) {
+		hbl_ibdev_dbg(ibdev, "no available PD\n");
+		return -ESRCH;
+	}
+
+	pd->pdn = 1;
+	resp.pdn = pd->pdn;
+
+	if (udata->outlen) {
+		rc = ib_copy_to_udata(udata, &resp, min(sizeof(resp), udata->outlen));
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Failed to copy udata for alloc_pd\n");
+			goto err;
+		}
+	}
+
+	hbl_ibdev_dbg(ibdev, "allocated PD %d\n", pd->pdn);
+
+	return 0;
+
+err:
+	atomic_set(&hctx->pd_allocated, 0);
+
+	return rc;
+}
+
+static void cq_user_mmap_entries_remove(struct hbl_ib_cq *cq)
+{
+	if (cq->regs_handle_entry)
+		rdma_user_mmap_entry_remove(cq->regs_handle_entry);
+
+	rdma_user_mmap_entry_remove(cq->pi_handle_entry);
+	rdma_user_mmap_entry_remove(cq->mem_handle_entry);
+}
+
+static int cq_user_mmap_entries_setup(struct hbl_ib_device *dev, struct hbl_ib_cq *cq,
+				      struct hbl_ib_ucontext *hctx, u32 cq_size, u64 *mem_handle,
+				      u64 *pi_handle, u64 *regs_handle)
+{
+	int rc;
+
+	cq->mem_handle_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext, *mem_handle,
+							     cq_size, mem_handle);
+	if (IS_ERR(cq->mem_handle_entry))
+		return PTR_ERR(cq->mem_handle_entry);
+
+	cq->pi_handle_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext, *pi_handle,
+							    PAGE_SIZE, pi_handle);
+	if (IS_ERR(cq->pi_handle_entry)) {
+		rc = PTR_ERR(cq->pi_handle_entry);
+		goto err_free_mem;
+	}
+
+	if (regs_handle) {
+		cq->regs_handle_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext,
+								      *regs_handle, PAGE_SIZE,
+								      regs_handle);
+		if (IS_ERR(cq->regs_handle_entry)) {
+			rc = PTR_ERR(cq->regs_handle_entry);
+			goto err_free_pi;
+		}
+	}
+
+	return 0;
+
+err_free_pi:
+	rdma_user_mmap_entry_remove(cq->pi_handle_entry);
+
+err_free_mem:
+	rdma_user_mmap_entry_remove(cq->mem_handle_entry);
+
+	return rc;
+}
+
+/* Get the max supported port from ports_mask.
+ * based on MSB we are counting the maximum valid ports.
+ */
+static int get_max_ports_from_port_mask(int ports_mask)
+{
+	int max_num_ports = 0;
+	int msb_index = 0;
+
+	if (ports_mask == 0)
+		return -1;
+
+	while (ports_mask > 1) {
+		ports_mask >>= 1;
+		msb_index++;
+	}
+
+	max_num_ports = msb_index + 1;
+
+	return max_num_ports;
+}
+
+static int __create_per_port_cq(struct hbl_ib_cq *hblcq, struct hbl_ib_device *hdev,
+				const struct ib_cq_init_attr *attr, struct ib_udata *udata)
+{
+	u64 mmap_set_mask = 0, cq_set_mask = 0, ports_mask, ib_ports_mask;
+	struct hbl_cni_alloc_user_cq_id_out alloc_cq_out = {};
+	struct hbl_cni_alloc_user_cq_id_in alloc_cq_in = {};
+	struct hbl_cni_user_cq_id_unset_in cq_unset_in = {};
+	struct hbl_cni_user_cq_id_set_out cq_set_out = {};
+	struct hbl_ibv_port_create_cq_resp *port_cq_resp;
+	struct hbl_cni_user_cq_id_set_in cq_set_in = {};
+	struct hbl_ibv_create_cq_resp *resp = NULL;
+	struct hbl_ib_device_attr dev_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_ib_cq *port_hblcq;
+	struct hbl_ib_port *ib_port;
+	struct hbl_aux_dev *aux_dev;
+	u32 cq_ib_port, cq_num, i;
+	struct ib_device *ibdev;
+	size_t resp_size;
+	int cqes, rc = 0;
+	int max_ports;
+
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	cqes = attr->cqe;
+	hctx = hblcq->hctx;
+	ports_mask = hctx->ports_mask;
+
+	ib_ports_mask = to_ib_port_mask(hdev, ports_mask);
+	max_ports = get_max_ports_from_port_mask(ib_ports_mask);
+	if (max_ports < 0) {
+		hbl_ibdev_dbg(ibdev, "port mask is empty: %llx\n", ib_ports_mask);
+		return -EINVAL;
+	}
+
+	resp = kzalloc((sizeof(struct hbl_ibv_port_create_cq_resp) * max_ports) +
+		       (sizeof(struct hbl_ibv_create_cq_resp)), GFP_KERNEL);
+	resp_size = (sizeof(struct hbl_ibv_port_create_cq_resp) * max_ports) +
+		    (sizeof(struct hbl_ibv_create_cq_resp));
+
+	hblcq->port_cq = kzalloc((sizeof(struct hbl_ib_cq) * max_ports), GFP_KERNEL);
+
+	for (i = 0; i < max_ports; i++) {
+		if (!(ports_mask & BIT(i)))
+			continue;
+
+		cq_ib_port = hbl_to_ib_port_num(hdev, i);
+		ib_port = &hdev->ib_port[i];
+
+		/* Step 1: Alloc cq */
+		alloc_cq_in.port = i;
+
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_ALLOC_USER_CQ_ID,
+				       &alloc_cq_in, &alloc_cq_out);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Allocation of cq_id failed, port: %u\n", i);
+			goto err_cq;
+		}
+
+		cq_num = alloc_cq_out.id;
+
+		port_hblcq = &hblcq->port_cq[cq_ib_port];
+		port_hblcq->hbl_port_num = i;
+		port_hblcq->cq_num = cq_num;
+		port_hblcq->cq_type = HBL_CQ_TYPE_QP;
+
+		cq_set_mask |= BIT(cq_ib_port);
+		aux_ops->query_device(aux_dev, &dev_attr);
+
+		if (cqes < dev_attr.min_cq_entries) {
+			cqes = dev_attr.min_cq_entries;
+			hbl_ibdev_dbg(ibdev,
+				      "Requested cqe: %d is less than minimum required cqe: %d. Hence ceiling it to min required CQE\n",
+				      cqes, dev_attr.min_cq_entries);
+		}
+
+		/* Step 2: USER_CQ Set */
+		cq_set_in.port = i;
+		cq_set_in.id = cq_num;
+		cq_set_in.num_of_cqes = cqes;
+
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CQ_ID_SET, &cq_set_in,
+				       &cq_set_out);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "CQ_ID Set failed, port: %u\n", i);
+			goto err_cq;
+		}
+
+		port_cq_resp = &resp->port_cq_resp[cq_ib_port];
+		port_cq_resp->cq_num = cq_num;
+		port_cq_resp->mem_handle = cq_set_out.mem_handle;
+		port_cq_resp->pi_handle = cq_set_out.pi_handle;
+		port_cq_resp->regs_handle = cq_set_out.regs_handle;
+		port_cq_resp->regs_offset = cq_set_out.regs_offset;
+		port_cq_resp->cq_size = PAGE_ALIGN(dev_attr.cqe_size * cqes);
+
+		rc = cq_user_mmap_entries_setup(hdev, &hblcq->port_cq[cq_ib_port], hctx,
+						port_cq_resp->cq_size, &port_cq_resp->mem_handle,
+						&port_cq_resp->pi_handle,
+						&port_cq_resp->regs_handle);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "unable to set up cq mmap entries\n");
+			goto err_cq;
+		}
+
+		mmap_set_mask |= BIT(cq_ib_port);
+		xa_store(&ib_port->hbl_ibcq_tbl, cq_num, &hblcq->ibcq, GFP_KERNEL);
+	}
+
+	if (udata->outlen) {
+		rc = ib_copy_to_udata(udata, resp, min(resp_size, udata->outlen));
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Failed to copy udata to userspace\n");
+			goto err_cq;
+		}
+	}
+
+	kfree(resp);
+	return 0;
+
+err_cq:
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (mmap_set_mask & BIT(i))
+			cq_user_mmap_entries_remove(&hblcq->port_cq[i]);
+
+		if (cq_set_mask & BIT(i)) {
+			cq_unset_in.port = hblcq->port_cq[i].hbl_port_num;
+			cq_unset_in.id = hblcq->port_cq[i].cq_num;
+			if (aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CQ_ID_UNSET,
+					      &cq_unset_in, NULL)) {
+				hbl_ibdev_dbg(ibdev, "Failed to destroy cq, port: %d, cq_num: %d\n",
+					      cq_unset_in.port, hblcq->port_cq[i].cq_num);
+			}
+		}
+	}
+
+	kfree(hblcq->port_cq);
+	kfree(resp);
+
+	return rc;
+}
+
+static int __create_cq(struct hbl_ib_cq *hblcq, struct hbl_ib_device *hdev,
+		       const struct ib_cq_init_attr *attr, struct ib_udata *udata, u32 hbl_port_num)
+{
+	struct hbl_cni_alloc_user_cq_id_out alloc_cq_out = {};
+	struct hbl_cni_alloc_user_cq_id_in alloc_cq_in = {};
+	struct hbl_cni_user_cq_id_unset_in cq_unset_in = {};
+	struct hbl_cni_user_cq_id_set_out cq_set_out = {};
+	struct hbl_cni_user_cq_id_set_in cq_set_in = {};
+	struct hbl_ibv_create_cq_resp resp = {};
+	struct hbl_ib_device_attr dev_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_ib_port *ib_port;
+	struct hbl_aux_dev *aux_dev;
+	struct ib_device *ibdev;
+	int cqes, rc;
+	u32 cq_num;
+
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	cqes = attr->cqe;
+	ib_port = &hdev->ib_port[hbl_port_num];
+	hctx = hblcq->hctx;
+
+	/* Step 1: Alloc cq */
+	alloc_cq_in.port = hbl_port_num;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_ALLOC_USER_CQ_ID, &alloc_cq_in,
+			       &alloc_cq_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Allocation of cq_id failed, port: %d\n", hbl_port_num);
+		return rc;
+	}
+
+	cq_num = alloc_cq_out.id;
+
+	aux_ops->query_device(aux_dev, &dev_attr);
+
+	/* If the number of cqes requested by the IB user is less than the minimum required by the
+	 * HW, ceil it to min required cq entries. This is needed to pass the test_cq pyverbs test.
+	 */
+	if (cqes < dev_attr.min_cq_entries) {
+		cqes = dev_attr.min_cq_entries;
+		hbl_ibdev_dbg(ibdev,
+			      "Requested cqe: %d is less than minimum required cqe: %d. Hence ceiling it to min required CQE\n",
+			      cqes, dev_attr.min_cq_entries);
+	}
+
+	/* Step 2: USER_CQ Set */
+	cq_set_in.port = hbl_port_num;
+	cq_set_in.id = cq_num;
+	cq_set_in.num_of_cqes = cqes;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CQ_ID_SET, &cq_set_in,
+			       &cq_set_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "CQ_ID Set failed, port: %d\n", hbl_port_num);
+		goto unset_cq;
+	}
+
+	resp.cq_num = cq_num;
+	resp.mem_handle = cq_set_out.mem_handle;
+	resp.pi_handle = cq_set_out.pi_handle;
+	resp.regs_handle = cq_set_out.regs_handle;
+	resp.regs_offset = cq_set_out.regs_offset;
+	resp.cq_size = PAGE_ALIGN(dev_attr.cqe_size * cqes);
+
+	rc = cq_user_mmap_entries_setup(hdev, hblcq, hctx, resp.cq_size, &resp.mem_handle,
+					&resp.pi_handle, &resp.regs_handle);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "unable to set up cq mmap entries\n");
+		goto unset_cq;
+	}
+
+	if (udata->outlen) {
+		rc = ib_copy_to_udata(udata, &resp, min(sizeof(resp), udata->outlen));
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Failed to copy udata to userspace\n");
+			goto unset_mmap_entries;
+		}
+	}
+
+	/* Number of cqes that are allocated. Also store the relevant data needed for
+	 * destroying the cq.
+	 */
+	hblcq->ibcq.cqe = cqes;
+	hblcq->hbl_port_num = hbl_port_num;
+	hblcq->cq_num = cq_num;
+	hblcq->cq_type = HBL_CQ_TYPE_QP;
+
+	xa_store(&ib_port->hbl_ibcq_tbl, cq_num, &hblcq->ibcq, GFP_KERNEL);
+
+	return 0;
+
+unset_mmap_entries:
+	cq_user_mmap_entries_remove(hblcq);
+
+unset_cq:
+	cq_unset_in.port = hbl_port_num;
+	cq_unset_in.id = cq_num;
+
+	if (aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CQ_ID_UNSET, &cq_unset_in,
+			      NULL))
+		hbl_ibdev_dbg(ibdev, "Failed to destroy cq, port: %d, cq_num: %d\n",
+			      hbl_port_num, cq_num);
+
+	return rc;
+}
+
+static int __create_cc_cq(struct hbl_ib_cq *hblcq, struct hbl_ib_device *hdev,
+			  const struct ib_cq_init_attr *attr, struct ib_udata *udata,
+			  u32 hbl_port_num)
+{
+	struct hbl_cni_user_ccq_unset_in cc_cq_unset_in = {};
+	struct hbl_cni_user_ccq_set_out cc_cq_set_out = {};
+	struct hbl_cni_user_ccq_set_in cc_cq_set_in = {};
+	struct hbl_ibv_create_cq_resp resp = {};
+	struct hbl_ib_device_attr dev_attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct ib_device *ibdev;
+	int rc;
+
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	hctx = hblcq->hctx;
+
+	cc_cq_set_in.port = hbl_port_num;
+	cc_cq_set_in.num_of_entries = attr->cqe;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CCQ_SET, &cc_cq_set_in,
+			       &cc_cq_set_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to set CC CQ, port %d\n", hbl_port_num);
+		return rc;
+	}
+
+	aux_ops->query_device(aux_dev, &dev_attr);
+
+	resp.cq_num = cc_cq_set_out.id;
+	resp.mem_handle = cc_cq_set_out.mem_handle;
+	resp.pi_handle = cc_cq_set_out.pi_handle;
+	resp.cq_size = PAGE_ALIGN(dev_attr.cqe_size * attr->cqe);
+
+	rc = cq_user_mmap_entries_setup(hdev, hblcq, hctx, resp.cq_size, &resp.mem_handle,
+					&resp.pi_handle, NULL);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "unable to set up cq mmap entries\n");
+		goto err_cc_cq_unset;
+	}
+
+	if (udata->outlen) {
+		rc = ib_copy_to_udata(udata, &resp, min(sizeof(resp), udata->outlen));
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Failed to copy udata to userspace\n");
+			goto err_mmap_entries_unset;
+		}
+	}
+
+	/* Number of cqes that are allocated. Also store the relevant data needed for destroying the
+	 * cq.
+	 */
+	hblcq->ibcq.cqe = attr->cqe;
+	hblcq->hbl_port_num = hbl_port_num;
+	hblcq->cq_num = cc_cq_set_out.id;
+	hblcq->cq_type = HBL_CQ_TYPE_CC;
+
+	return 0;
+
+err_mmap_entries_unset:
+	cq_user_mmap_entries_remove(hblcq);
+
+err_cc_cq_unset:
+	cc_cq_unset_in.port = hbl_port_num;
+
+	if (aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CCQ_UNSET, &cc_cq_unset_in,
+			      NULL))
+		hbl_ibdev_dbg(ibdev, "failed to unset CC CQ, port %d\n", hbl_port_num);
+
+	return rc;
+}
+
+static int create_cq(struct hbl_ib_cq *hblcq, struct hbl_ib_device *hdev,
+		     const struct ib_cq_init_attr *attr, struct ib_udata *udata)
+{
+	struct hbl_ibv_create_cq_req cmd = {};
+	struct hbl_ib_ucontext *hctx;
+	struct ib_device *ibdev;
+	u32 hbl_port_num = 0;
+	int rc;
+
+	hctx = rdma_udata_to_drv_context(udata, struct hbl_ib_ucontext, ibucontext);
+	ibdev = &hdev->ibdev;
+
+	if (attr->flags) {
+		hbl_ibdev_dbg(ibdev, "attr->flags: %d but should be 0\n", attr->flags);
+		return -EOPNOTSUPP;
+	}
+
+	rc = ib_copy_from_udata(&cmd, udata, min(sizeof(cmd), udata->inlen));
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to copy udata from user space\n");
+		return rc;
+	}
+
+	/* For native CQ port number is not relevant */
+	if (!(cmd.flags & CQ_FLAG_NATIVE)) {
+		rc = ib_to_hbl_port_num(hdev, cmd.port_num, &hbl_port_num);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", cmd.port_num);
+			return rc;
+		}
+
+		if (!(hctx->ports_mask & BIT(hbl_port_num))) {
+			hbl_ibdev_dbg(ibdev,
+				      "port %d is not part of the context's ports mask 0x%llx\n",
+				      hbl_port_num, hctx->ports_mask);
+			return -EINVAL;
+		}
+	}
+
+	hblcq->hctx = hctx;
+
+	switch (cmd.cq_type) {
+	case HBL_CQ_TYPE_QP:
+		if (cmd.flags & CQ_FLAG_NATIVE) {
+			hblcq->is_native = true;
+			rc = __create_per_port_cq(hblcq, hdev, attr, udata);
+		} else {
+			rc = __create_cq(hblcq, hdev, attr, udata, hbl_port_num);
+		}
+		break;
+	case HBL_CQ_TYPE_CC:
+		rc = __create_cc_cq(hblcq, hdev, attr, udata, hbl_port_num);
+		break;
+	default:
+		hbl_ibdev_dbg(ibdev, "Invalid CQ resource requested %u\n", cmd.cq_type);
+		rc = -EINVAL;
+	}
+
+	return rc;
+}
+
+static int hbl_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
+			    struct ib_udata *udata)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibcq->device);
+	struct hbl_ib_cq *hblcq = to_hbl_ib_cq(ibcq);
+	int rc;
+
+	rc = create_cq(hblcq, hdev, attr, udata);
+	if (rc) {
+		hbl_ibdev_dbg(&hdev->ibdev, "Failed to create a CQ\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static int create_qp(struct hbl_ib_qp *hblqp, struct ib_qp_init_attr *qp_init_attr,
+		     struct ib_udata *udata)
+{
+	struct hbl_ib_ucontext *hctx = rdma_udata_to_drv_context(udata, struct hbl_ib_ucontext,
+								 ibucontext);
+	struct ib_device *ibdev = hblqp->ibqp.device;
+	u32 qp_num;
+	int rc;
+
+	/* Allocate an IB QP handle. Note,
+	 * - It doesn't map to HW QPC index.
+	 * - No HW or hbl_cn QP resources are allocated yet.
+	 */
+	rc = xa_alloc(&hctx->qp_xarray, &qp_num, hblqp, xa_limit_32b, GFP_KERNEL);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to allocate IB QP handle\n");
+		return rc;
+	}
+
+	hblqp->ibqp.qp_num = qp_num;
+	hblqp->qp_state = IB_QPS_RESET;
+	hblqp->hctx = hctx;
+
+	/* Cache the required QP params */
+	hblqp->max_send_wr = qp_init_attr->cap.max_send_wr;
+	hblqp->max_recv_wr = qp_init_attr->cap.max_recv_wr;
+
+	return 0;
+}
+
+static int hbl_ib_create_qp(struct ib_qp *ibqp, struct ib_qp_init_attr *qp_init_attr,
+			    struct ib_udata *udata)
+{
+	struct hbl_ib_qp *hblqp = to_hbl_ib_qp(ibqp);
+
+	return create_qp(hblqp, qp_init_attr, udata);
+}
+
+static int __hbl_ib_dealloc_pd(struct ib_pd *ibpd, struct ib_udata *udata)
+{
+	struct hbl_ib_ucontext *hctx = rdma_udata_to_drv_context(udata, struct hbl_ib_ucontext,
+								 ibucontext);
+	struct hbl_ib_pd *pd = to_hbl_ib_pd(ibpd);
+	struct ib_device *ibdev = ibpd->device;
+
+	hbl_ibdev_dbg(ibdev, "deallocated PD %d\n", pd->pdn);
+
+	atomic_set(&hctx->pd_allocated, 0);
+
+	return 0;
+}
+
+static int hbl_ib_dealloc_pd(struct ib_pd *ibpd, struct ib_udata *udata)
+{
+	return __hbl_ib_dealloc_pd(ibpd, udata);
+}
+
+static int hbl_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
+{
+	return -EOPNOTSUPP;
+}
+
+static void __destroy_per_port_cq(struct hbl_ib_cq *hblcq, struct hbl_ib_device *hdev)
+{
+	struct hbl_cni_user_cq_id_unset_in cq_unset_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	u32 cq_ib_port, hbl_port_num;
+	struct hbl_ib_cq *port_hblcq;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_port *ib_port;
+	struct ib_device *ibdev;
+	u64 ports_mask, i;
+	int rc;
+
+	ibdev = &hdev->ibdev;
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	hctx = hblcq->hctx;
+	ports_mask = hctx->ports_mask;
+
+	for (i = 0; i < hdev->max_num_of_ports; i++) {
+		if (!(ports_mask & BIT(i)))
+			continue;
+
+		cq_ib_port = hbl_to_ib_port_num(hdev, i);
+		port_hblcq = &hblcq->port_cq[cq_ib_port];
+
+		cq_user_mmap_entries_remove(port_hblcq);
+
+		hbl_port_num = port_hblcq->hbl_port_num;
+		ib_port = &hdev->ib_port[hbl_port_num];
+		xa_erase(&ib_port->hbl_ibcq_tbl, port_hblcq->cq_num);
+		cq_unset_in.port = port_hblcq->hbl_port_num;
+		cq_unset_in.id = port_hblcq->cq_num;
+
+		if (aux_ops->device_operational(aux_dev)) {
+			rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_USER_CQ_ID_UNSET,
+					       &cq_unset_in, NULL);
+			if (rc) {
+				hbl_ibdev_dbg(ibdev, "Failed to destroy cq, port: %d, cq_num: %d\n",
+					      hblcq->hbl_port_num, hblcq->cq_num);
+			}
+		}
+	}
+
+	kfree(hblcq->port_cq);
+}
+
+static int destroy_cq(struct ib_cq *ibcq)
+{
+	struct hbl_cni_user_ccq_unset_in cc_cq_unset_in = {};
+	struct hbl_cni_user_cq_id_unset_in cq_unset_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_port *ib_port;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct hbl_ib_cq *hblcq;
+	int rc;
+
+	hblcq = to_hbl_ib_cq(ibcq);
+	ibdev = ibcq->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	ib_port = &hdev->ib_port[hblcq->hbl_port_num];
+	hctx = hblcq->hctx;
+
+	if (hblcq->is_native) {
+		__destroy_per_port_cq(hblcq, hdev);
+	} else {
+		cq_user_mmap_entries_remove(hblcq);
+
+		if (hblcq->cq_type == HBL_CQ_TYPE_QP) {
+			xa_erase(&ib_port->hbl_ibcq_tbl, hblcq->cq_num);
+			cq_unset_in.port = hblcq->hbl_port_num;
+			cq_unset_in.id = hblcq->cq_num;
+
+			if (aux_ops->device_operational(aux_dev)) {
+				rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx,
+						       HBL_CNI_OP_USER_CQ_ID_UNSET, &cq_unset_in,
+						       NULL);
+				if (rc) {
+					hbl_ibdev_dbg(ibdev,
+						      "Failed to destroy cq, port: %d, cq_num: %d\n",
+						      hblcq->hbl_port_num, hblcq->cq_num);
+					return rc;
+				}
+			}
+		} else {
+			cc_cq_unset_in.port = hblcq->hbl_port_num;
+
+			if (aux_ops->device_operational(aux_dev)) {
+				rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx,
+						       HBL_CNI_OP_USER_CCQ_UNSET, &cc_cq_unset_in,
+						       NULL);
+				if (rc) {
+					hbl_ibdev_dbg(ibdev, "failed to unset CC CQ, port %d\n",
+						      hblcq->hbl_port_num);
+					return rc;
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int hbl_ib_destroy_cq(struct ib_cq *ibcq, struct ib_udata *udata)
+{
+	int rc;
+
+	rc = destroy_cq(ibcq);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int __destroy_qp(struct hbl_ib_qp *hblqp)
+{
+	struct hbl_cni_destroy_conn_in destroy_conn_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+	u32 hbl_port;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	hctx = hblqp->hctx;
+
+	qp_user_mmap_entries_remove(hblqp);
+
+	rc = ib_to_hbl_port_num(hdev, ibqp->port, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u, IB QP %u\n", ibqp->port, ibqp->qp_num);
+		return rc;
+	}
+
+	destroy_conn_in.port = hbl_port;
+	destroy_conn_in.conn_id = hblqp->qp_id;
+
+	if (aux_ops->device_operational(aux_dev)) {
+		rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_DESTROY_CONN,
+				       &destroy_conn_in, NULL);
+		if (rc) {
+			hbl_ibdev_dbg(ibdev, "Failed to destroy QP id %d, port %d\n", hblqp->qp_id,
+				      hbl_port);
+			return rc;
+		}
+	}
+	return 0;
+}
+
+static int destroy_qp(struct hbl_ib_qp *hblqp)
+{
+	struct hbl_ib_ucontext *hctx;
+	struct ib_qp *ibqp;
+	int rc;
+
+	rc = verify_qp_xarray(hblqp);
+	if (rc)
+		return rc;
+
+	ibqp = &hblqp->ibqp;
+	hctx = hblqp->hctx;
+
+	if (hblqp->qp_state >= IB_QPS_INIT) {
+		rc = __destroy_qp(hblqp);
+		if (rc)
+			return rc;
+	}
+
+	xa_erase(&hctx->qp_xarray, ibqp->qp_num);
+
+	return 0;
+}
+
+static int hbl_ib_destroy_qp(struct ib_qp *ibqp, struct ib_udata *udata)
+{
+	struct hbl_ib_qp *hblqp = to_hbl_ib_qp(ibqp);
+	int rc;
+
+	rc = destroy_qp(hblqp);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static struct rdma_hw_stats *__hbl_ib_alloc_hw_stats(struct ib_device *ibdev, u32 port_num)
+{
+	struct rdma_stat_desc *hbl_ib_port_stats;
+	struct hbl_ib_port_stats *port_stats;
+	struct hbl_ib_device *hdev;
+	u32 port;
+	int rc;
+
+	if (!port_num)
+		return rdma_alloc_hw_stats_struct(hbl_ib_device_stats,
+						  ARRAY_SIZE(hbl_ib_device_stats),
+						  RDMA_HW_STATS_DEFAULT_LIFESPAN);
+
+	hdev = to_hbl_ib_dev(ibdev);
+
+	rc = ib_to_hbl_port_num(hdev, port_num, &port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", port_num);
+		return NULL;
+	}
+
+	port_stats = &hdev->port_stats[port];
+
+	hbl_ib_port_stats = port_stats->stat_desc;
+
+	return rdma_alloc_hw_stats_struct(hbl_ib_port_stats, port_stats->num,
+					  RDMA_HW_STATS_DEFAULT_LIFESPAN);
+}
+
+static struct rdma_hw_stats *hbl_ib_alloc_hw_port_stats(struct ib_device *ibdev, u32 port_num)
+{
+	return __hbl_ib_alloc_hw_stats(ibdev, port_num);
+}
+
+static struct rdma_hw_stats *hbl_ib_alloc_hw_device_stats(struct ib_device *ibdev)
+{
+	return __hbl_ib_alloc_hw_stats(ibdev, 0);
+}
+
+static int hbl_ib_get_hw_stats(struct ib_device *ibdev, struct rdma_hw_stats *stats, u32 port_num,
+			       int index)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(ibdev);
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	u32 port;
+	int rc;
+
+	if (!port_num) {
+		stats->value[FATAL_EVENT] = atomic_read(&hdev->dev_stats.fatal_event);
+
+		return ARRAY_SIZE(hbl_ib_device_stats);
+	}
+
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = ib_to_hbl_port_num(hdev, port_num, &port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", port_num);
+		return rc;
+	}
+
+	if (!aux_ops->device_operational(aux_dev)) {
+		hbl_ibdev_dbg(ibdev, "device not operational, can't get stats\n");
+		return -EINVAL;
+	}
+
+	aux_ops->get_cnts_values(aux_dev, port, stats->value);
+
+	return stats->num_counters;
+}
+
+static int hbl_ib_mmap(struct ib_ucontext *ibucontext, struct vm_area_struct *vma)
+{
+	struct rdma_user_mmap_entry *rdma_entry;
+	struct hbl_ib_user_mmap_entry *entry;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	int rc;
+
+	ibdev = ibucontext->device;
+	hdev = to_hbl_ib_dev(ibdev);
+
+	rdma_entry = rdma_user_mmap_entry_get(ibucontext, vma);
+	if (!rdma_entry) {
+		hbl_ibdev_dbg(&hdev->ibdev, "pgoff[%#lx] does not have valid entry\n",
+			      vma->vm_pgoff);
+		return -EINVAL;
+	}
+
+	entry = to_hbl_ib_user_mmap_entry(rdma_entry);
+
+	switch (entry->info.mtype) {
+	case HBL_IB_MEM_HW_BLOCK:
+		vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY |
+			     VM_NORESERVE);
+
+		rc = rdma_user_mmap_io(ibucontext, vma, entry->info.bus_addr >> PAGE_SHIFT,
+				       entry->rdma_entry.npages * PAGE_SIZE,
+				       vma->vm_page_prot, rdma_entry);
+		break;
+	case HBL_IB_MEM_HOST_DMA_COHERENT:
+	case HBL_IB_MEM_HOST_MAP_ONLY:
+		if (entry->info.vmalloc) {
+			vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY | VM_NORESERVE);
+
+			rc = remap_vmalloc_range(vma, entry->info.cpu_addr, 0);
+		} else {
+			vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+				     VM_DONTCOPY | VM_NORESERVE);
+
+			rc = remap_pfn_range(vma, vma->vm_start,
+					     virt_to_phys(entry->info.cpu_addr) >> PAGE_SHIFT,
+					     vma->vm_end - vma->vm_start, vma->vm_page_prot);
+		}
+		break;
+	case HBL_IB_MEM_HOST_VIRTUAL:
+		vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY | VM_NORESERVE);
+
+		rc = remap_vmalloc_range(vma, entry->info.cpu_addr, 0);
+		break;
+	default:
+		hbl_ibdev_dbg(&hdev->ibdev,
+			      "pgoff[%#lx] does not have valid entry memory type %d\n",
+			      vma->vm_pgoff, entry->info.mtype);
+		rc = -EINVAL;
+	}
+
+	rdma_user_mmap_entry_put(rdma_entry);
+
+	return rc;
+}
+
+static void hbl_ib_mmap_free(struct rdma_user_mmap_entry *rdma_entry)
+{
+	struct hbl_ib_user_mmap_entry *entry = to_hbl_ib_user_mmap_entry(rdma_entry);
+
+	kfree(entry);
+}
+
+static int verify_qp_xarray(struct hbl_ib_qp *hblqp)
+{
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+
+	hblqp = xa_load(&hblqp->hctx->qp_xarray, ibqp->qp_num);
+	if (!hblqp) {
+		hbl_ibdev_dbg(ibdev, "Invalid IB QP %d modified\n", ibqp->qp_num);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int verify_modify_qp(struct hbl_ib_qp *hblqp, struct ib_qp_attr *qp_attr, int qp_attr_mask)
+{
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+
+	rc = verify_qp_xarray(hblqp);
+	if (rc)
+		return rc;
+
+	/* Verify state change and corresponding QP attribute mask. */
+	if (!ib_modify_qp_is_ok(hblqp->qp_state, qp_attr->qp_state, IB_QPT_RC, qp_attr_mask)) {
+		hbl_ibdev_dbg(ibdev, "Invalid IB QP %d params\n", ibqp->qp_num);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int get_qp_wq_type(struct hbl_ib_device *hdev, enum qpc_req_wq_type *to, u8 from)
+{
+	if (from & HBL_WQ_READ_RDV_ENDP) {
+		if (hweight_long(from) != 1)
+			return -EINVAL;
+
+		*to = QPC_REQ_WQ_TYPE_RDV_READ;
+
+		return 0;
+	}
+
+	if (from & HBL_WQ_SEND_RDV) {
+		if (hweight_long(from) != 1)
+			return -EINVAL;
+
+		*to = QPC_REQ_WQ_TYPE_RDV_WRITE;
+
+		return 0;
+	}
+
+	if (from & (HBL_WQ_WRITE | HBL_WQ_RECV_RDV | HBL_WQ_READ_RDV)) {
+		if (hdev->mixed_qp_wq_types) {
+			if ((from & HBL_WQ_RECV_RDV) && (from & HBL_WQ_READ_RDV))
+				return -EINVAL;
+		} else {
+			if (hweight_long(from) != 1)
+				return -EINVAL;
+		}
+
+		*to = QPC_REQ_WQ_TYPE_WRITE;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int alloc_qp(struct hbl_ib_qp *hblqp, struct ib_qp_attr *qp_attr, int qp_attr_mask,
+		    struct hbl_ibv_modify_qp_req *modify_qp_req,
+		    struct hbl_ibv_modify_qp_resp *modify_qp_resp)
+{
+	struct hbl_cni_alloc_conn_out alloc_conn_out = {};
+	struct hbl_cni_alloc_conn_in alloc_conn_in = {};
+	enum qpc_req_wq_type hbl_wq_type;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+	u8 ib_wq_type;
+	u32 hbl_port;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	hctx = hblqp->hctx;
+
+	rc = ib_to_hbl_port_num(hdev, qp_attr->port_num, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", qp_attr->port_num);
+		return rc;
+	}
+
+	ib_wq_type = modify_qp_req->wq_type;
+	rc = get_qp_wq_type(hdev, &hbl_wq_type, ib_wq_type);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid WQ type mask %d, port %u\n", ib_wq_type, hbl_port);
+		return rc;
+	}
+
+	alloc_conn_in.port = hbl_port;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_ALLOC_CONN, &alloc_conn_in,
+			       &alloc_conn_out);
+
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to allocate QP, port %d\n", hbl_port);
+		return rc;
+	}
+
+	hblqp->qp_id = alloc_conn_out.conn_id;
+	hblqp->qp_state = IB_QPS_INIT;
+	hblqp->wq_type = hbl_wq_type;
+	hblqp->wq_granularity = modify_qp_req->wq_granularity;
+
+	modify_qp_resp->qp_num = hblqp->qp_id;
+
+	return 0;
+}
+
+static u8 get_req_cq_number(struct hbl_ib_qp *hblqp)
+{
+	struct hbl_ib_cq *hblcq;
+	struct ib_cq *ibcq;
+	struct ib_qp *ibqp;
+
+	ibqp = &hblqp->ibqp;
+	ibcq = ibqp->send_cq;
+	hblcq = to_hbl_ib_cq(ibcq);
+
+	return hblcq->is_native ? hblcq->port_cq[ibqp->port].cq_num : hblcq->cq_num;
+}
+
+static u8 get_res_cq_number(struct hbl_ib_qp *hblqp)
+{
+	struct hbl_ib_cq *hblcq;
+	struct ib_qp *ibqp;
+	struct ib_cq *ibcq;
+
+	ibqp = &hblqp->ibqp;
+	ibcq = ibqp->recv_cq;
+	hblcq = to_hbl_ib_cq(ibcq);
+
+	return hblcq->is_native ? hblcq->port_cq[ibqp->port].cq_num : hblcq->cq_num;
+}
+
+static void copy_mac_reverse(u8 *dst, u8 *src)
+{
+	int i;
+
+	for (i = 0; i < ETH_ALEN; i++)
+		dst[i] = src[(ETH_ALEN - 1) - i];
+}
+
+static inline bool is_l2_gid(struct in6_addr *addr)
+{
+	return (addr->s6_addr32[0] == htonl(0xfe800000)) && (addr->s6_addr32[1] == 0);
+}
+
+static int set_res_qp_ctx(struct hbl_ib_qp *hblqp, struct ib_qp_attr *qp_attr, int qp_attr_mask,
+			  struct hbl_ibv_modify_qp_req *modify_qp_req)
+{
+	struct hbl_cni_res_conn_ctx_in res_conn_ctx_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	union ib_gid *dgid;
+	struct ib_qp *ibqp;
+	u32 hbl_port;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	dgid = &qp_attr->ah_attr.grh.dgid;
+	hctx = hblqp->hctx;
+
+	rc = ib_to_hbl_port_num(hdev, ibqp->port, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n, IB QP %u", ibqp->port, ibqp->qp_num);
+		return rc;
+	}
+
+	/* If the ports are internal, anyway we don't use the dst_mac_addr when configuring the QPC.
+	 * Instead we use the broadcast MAC for dest MAC. Refer the ASIC specific set_res_qp_ctx
+	 */
+	if (hdev->ext_ports_mask & BIT(hbl_port)) {
+		copy_mac_reverse(hblqp->dst_mac_addr, qp_attr->ah_attr.roce.dmac);
+		memcpy(res_conn_ctx_in.dst_mac_addr, hblqp->dst_mac_addr, ETH_ALEN);
+	}
+
+	if ((hdev->ext_ports_mask & BIT(hbl_port)) && !is_l2_gid((struct in6_addr *)dgid->raw)) {
+		hblqp->dst_ip_addr = htonl(((struct in6_addr *)dgid->raw)->s6_addr32[3]);
+		res_conn_ctx_in.dst_ip_addr = hblqp->dst_ip_addr;
+	}
+
+	res_conn_ctx_in.dst_conn_id = qp_attr->dest_qp_num;
+	res_conn_ctx_in.port = hbl_port;
+	res_conn_ctx_in.conn_id = hblqp->qp_id;
+	res_conn_ctx_in.cq_number = get_res_cq_number(hblqp);
+	res_conn_ctx_in.local_key = modify_qp_req->local_key;
+	res_conn_ctx_in.priority = modify_qp_req->priority;
+	res_conn_ctx_in.loopback = modify_qp_req->loopback;
+	res_conn_ctx_in.wq_peer_size = hblqp->max_send_wr;
+	res_conn_ctx_in.rdv = hblqp->wq_type == QPC_REQ_WQ_TYPE_RDV_READ ||
+			      hblqp->wq_type == QPC_REQ_WQ_TYPE_RDV_WRITE;
+	res_conn_ctx_in.conn_peer = hblqp->qp_id;
+	res_conn_ctx_in.wq_peer_granularity = hblqp->wq_granularity;
+	res_conn_ctx_in.encap_en = modify_qp_req->encap_en;
+	res_conn_ctx_in.encap_id = modify_qp_req->encap_num;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_SET_RES_CONN_CTX, &res_conn_ctx_in,
+			       NULL);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to config RTR, QP %d, port %d\n", hblqp->qp_id,
+			      hbl_port);
+		return rc;
+	}
+
+	hblqp->qp_state = IB_QPS_RTR;
+	hblqp->dest_qp_num = qp_attr->dest_qp_num;
+
+	if (qp_attr->path_mtu == HBL_IB_MTU_8192)
+		hblqp->mtu = 8192;
+	else
+		hblqp->mtu = ib_mtu_enum_to_int(qp_attr->path_mtu);
+
+	return 0;
+}
+
+static void qp_user_mmap_entries_remove(struct hbl_ib_qp *qp)
+{
+	if (qp->rwq_mem_handle_entry)
+		rdma_user_mmap_entry_remove(qp->rwq_mem_handle_entry);
+	if (qp->swq_mem_handle_entry)
+		rdma_user_mmap_entry_remove(qp->swq_mem_handle_entry);
+}
+
+static int qp_user_mmap_entries_setup(struct hbl_ib_device *dev, struct hbl_ib_qp *qp,
+				      struct hbl_ib_ucontext *hctx,
+				      struct hbl_ibv_modify_qp_resp *resp)
+{
+	int rc;
+
+	if (resp->swq_mem_handle) {
+		qp->swq_mem_handle_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext,
+									 resp->swq_mem_handle,
+									 resp->swq_mem_size,
+									 &resp->swq_mem_handle);
+		if (IS_ERR(qp->swq_mem_handle_entry)) {
+			rc = PTR_ERR(qp->swq_mem_handle_entry);
+			goto reset_swq_entry;
+		}
+	}
+
+	if (resp->rwq_mem_handle) {
+		qp->rwq_mem_handle_entry = hbl_ib_user_mmap_entry_insert(&hctx->ibucontext,
+									 resp->rwq_mem_handle,
+									 resp->rwq_mem_size,
+									 &resp->rwq_mem_handle);
+		if (IS_ERR(qp->rwq_mem_handle_entry)) {
+			rc = PTR_ERR(qp->rwq_mem_handle_entry);
+			goto reset_rwq_entry;
+		}
+	}
+
+	return 0;
+
+reset_rwq_entry:
+	qp->rwq_mem_handle_entry = NULL;
+	if (qp->swq_mem_handle_entry)
+		rdma_user_mmap_entry_remove(qp->swq_mem_handle_entry);
+
+reset_swq_entry:
+	qp->swq_mem_handle_entry = NULL;
+
+	return rc;
+}
+
+static int set_req_qp_ctx(struct hbl_ib_qp *hblqp, struct ib_qp_attr *qp_attr, int qp_attr_mask,
+			  struct hbl_ibv_modify_qp_req *modify_qp_req,
+			  struct hbl_ibv_modify_qp_resp *modify_qp_resp)
+{
+	struct hbl_cni_req_conn_ctx_out req_conn_ctx_out = {};
+	struct hbl_cni_req_conn_ctx_in req_conn_ctx_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+	u32 hbl_port;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	hctx = hblqp->hctx;
+
+	rc = ib_to_hbl_port_num(hdev, ibqp->port, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u, IB QP %u\n", ibqp->port, ibqp->qp_num);
+		return rc;
+	}
+
+	req_conn_ctx_in.port = hbl_port;
+	req_conn_ctx_in.conn_id = hblqp->qp_id;
+	req_conn_ctx_in.dst_conn_id = hblqp->dest_qp_num;
+	req_conn_ctx_in.wq_type = hblqp->wq_type;
+	req_conn_ctx_in.wq_size = hblqp->max_send_wr;
+	req_conn_ctx_in.cq_number = get_req_cq_number(hblqp);
+	req_conn_ctx_in.remote_key = modify_qp_req->remote_key;
+	req_conn_ctx_in.priority = modify_qp_req->priority;
+	req_conn_ctx_in.timer_granularity = qp_attr->timeout;
+
+	if (modify_qp_req->dest_wq_size) {
+		if (!is_power_of_2(modify_qp_req->dest_wq_size)) {
+			hbl_ibdev_dbg(ibdev, "dest_wq_size :%d is not power of 2, QP %d, port %d\n",
+				      modify_qp_req->dest_wq_size, hblqp->qp_id, hbl_port);
+			return -EINVAL;
+		}
+		req_conn_ctx_in.wq_remote_log_size = ilog2(modify_qp_req->dest_wq_size);
+	}
+
+	req_conn_ctx_in.congestion_en = modify_qp_req->congestion_en;
+	req_conn_ctx_in.congestion_wnd = modify_qp_req->congestion_wnd;
+	req_conn_ctx_in.loopback = modify_qp_req->loopback;
+	req_conn_ctx_in.compression_en = modify_qp_req->compression_en;
+	req_conn_ctx_in.encap_en = modify_qp_req->encap_en;
+	req_conn_ctx_in.encap_id = modify_qp_req->encap_num;
+	req_conn_ctx_in.swq_granularity = hblqp->wq_granularity;
+	req_conn_ctx_in.mtu = hblqp->mtu;
+
+	/* If the ports are internal, anyway we don't use the dst_mac_addr when configuring the QPC.
+	 * Instead we use the broadcast MAC for dest MAC. Refer the ASIC specific set_req_qp_ctx
+	 */
+	if (hdev->ext_ports_mask & BIT(hbl_port)) {
+		memcpy(req_conn_ctx_in.dst_mac_addr, hblqp->dst_mac_addr, ETH_ALEN);
+		req_conn_ctx_in.dst_ip_addr = hblqp->dst_ip_addr;
+	}
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_SET_REQ_CONN_CTX, &req_conn_ctx_in,
+			       &req_conn_ctx_out);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to config RTS, QP %d, port %d\n",
+			      hblqp->qp_id, hbl_port);
+		return rc;
+	}
+
+	modify_qp_resp->swq_mem_handle = req_conn_ctx_out.swq_mem_handle;
+	modify_qp_resp->swq_mem_size = req_conn_ctx_out.swq_mem_size;
+	modify_qp_resp->rwq_mem_handle = req_conn_ctx_out.rwq_mem_handle;
+	modify_qp_resp->rwq_mem_size = req_conn_ctx_out.rwq_mem_size;
+
+	WARN_ON_ONCE(!PAGE_ALIGNED(modify_qp_resp->swq_mem_size));
+	WARN_ON_ONCE(!PAGE_ALIGNED(modify_qp_resp->rwq_mem_size));
+
+	rc = qp_user_mmap_entries_setup(hdev, hblqp, hctx, modify_qp_resp);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed create mmap entries for QP %d, port %d\n",
+			      hblqp->qp_id, hbl_port);
+		return rc;
+	}
+
+	hblqp->qp_state = IB_QPS_RTS;
+
+	return 0;
+}
+
+static int reset_qp(struct hbl_ib_qp *hblqp)
+{
+	struct ib_device *ibdev;
+	struct ib_qp *ibqp;
+	int rc;
+
+	ibqp = &hblqp->ibqp;
+	ibdev = ibqp->device;
+
+	rc = __destroy_qp(hblqp);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to reset QP %d, port %d\n", hblqp->qp_id, ibqp->port);
+		return rc;
+	}
+
+	hblqp->qp_state = IB_QPS_RESET;
+
+	return 0;
+}
+
+static int hbl_ib_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *qp_attr, int qp_attr_mask,
+			    struct ib_udata *udata)
+{
+	struct hbl_ibv_modify_qp_resp modify_qp_resp = {};
+	struct hbl_ibv_modify_qp_req modify_qp_req = {};
+	struct hbl_ib_ucontext *hctx;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct hbl_ib_qp *hblqp;
+	u32 ib_port, hbl_port;
+	int rc;
+
+	ibdev = ibqp->device;
+	hdev = to_hbl_ib_dev(ibdev);
+	hblqp = to_hbl_ib_qp(ibqp);
+	hctx = hblqp->hctx;
+
+	rc = verify_modify_qp(hblqp, qp_attr, qp_attr_mask);
+	if (rc)
+		return rc;
+
+	ib_port = (qp_attr_mask & IB_QP_PORT) ? qp_attr->port_num : hblqp->ibqp.port;
+
+	rc = ib_to_hbl_port_num(hdev, ib_port, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", ib_port);
+		return rc;
+	}
+
+	if (!(hctx->ports_mask & BIT(hbl_port))) {
+		hbl_ibdev_dbg(ibdev, "port %d is not part of the context's ports mask 0x%llx\n",
+			      hbl_port, hctx->ports_mask);
+		return -EINVAL;
+	}
+
+	rc = ib_copy_from_udata(&modify_qp_req, udata, min(sizeof(modify_qp_req), udata->inlen));
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to copy from modify QP udata\n");
+		return rc;
+	}
+
+	if ((qp_attr_mask & IB_QP_STATE) && qp_attr->qp_state == IB_QPS_RESET) {
+		/* QP state transition IB_QPS_RESET ==> IB_QPS_RESET is NoOps */
+		if (hblqp->qp_state != IB_QPS_RESET) {
+			rc = reset_qp(hblqp);
+			if (rc)
+				return rc;
+		}
+	}
+
+	if ((qp_attr_mask & IB_QP_STATE) && qp_attr->qp_state == IB_QPS_INIT) {
+		/* QP state transition IB_QPS_INIT ==> IB_QPS_INIT. Destroy old QP. */
+		if (hblqp->qp_state == IB_QPS_INIT) {
+			rc = reset_qp(hblqp);
+			if (rc)
+				return rc;
+		}
+
+		rc = alloc_qp(hblqp, qp_attr, qp_attr_mask, &modify_qp_req, &modify_qp_resp);
+		if (rc)
+			return rc;
+	}
+
+	if ((qp_attr_mask & IB_QP_STATE) && qp_attr->qp_state == IB_QPS_RTR) {
+		rc = set_res_qp_ctx(hblqp, qp_attr, qp_attr_mask, &modify_qp_req);
+		if (rc)
+			goto err_reset_qp;
+	}
+
+	if ((qp_attr_mask & IB_QP_STATE) && qp_attr->qp_state == IB_QPS_RTS) {
+		rc = set_req_qp_ctx(hblqp, qp_attr, qp_attr_mask, &modify_qp_req, &modify_qp_resp);
+		if (rc)
+			goto err_reset_qp;
+	}
+
+	rc = ib_copy_to_udata(udata, &modify_qp_resp, min(sizeof(modify_qp_resp), udata->outlen));
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "Failed to copy to QP modify udata\n");
+		goto err_reset_qp;
+	}
+
+	return 0;
+
+err_reset_qp:
+	reset_qp(hblqp);
+
+	return rc;
+}
+
+static int hbl_ib_query_gid(struct ib_device *ibdev, u32 port, int index, union ib_gid *gid)
+{
+	/* The IB core would query the GID for non-ROCE ports i.e. internal ports */
+	memset(gid->raw, 0xFF, sizeof(gid->raw));
+
+	return 0;
+}
+
+static int hbl_ib_query_pkey(struct ib_device *ibdev, u32 port, u16 index, u16 *pkey)
+{
+	if (index > 0)
+		return -EINVAL;
+
+	*pkey = 0xffff;
+
+	return 0;
+}
+
+static int hbl_ib_query_qp(struct ib_qp *ibqp, struct ib_qp_attr *qp_attr, int qp_attr_mask,
+			   struct ib_qp_init_attr *qp_init_attr)
+{
+	struct hbl_ib_qp *hblqp;
+
+	hblqp = to_hbl_ib_qp(ibqp);
+
+	memset(qp_attr, 0, sizeof(*qp_attr));
+	memset(qp_init_attr, 0, sizeof(*qp_init_attr));
+
+	qp_attr->qp_state = hblqp->qp_state;
+	qp_attr->dest_qp_num = hblqp->dest_qp_num;
+	qp_attr->port_num = ibqp->port;
+
+	qp_init_attr->cap.max_send_wr = hblqp->max_send_wr;
+	qp_init_attr->cap.max_recv_wr = hblqp->max_recv_wr;
+
+	/* We need to populate these 2 params to pass query_qp pyverbs test */
+	qp_init_attr->cap.max_send_sge = HBL_IB_MAX_SEND_SGE;
+	qp_init_attr->cap.max_recv_sge = HBL_IB_MAX_RECV_SGE;
+
+	/* Both xrcd and qp_access_flags are not used by our flows, so we may override them in order
+	 * to pass extra data for EQ events.
+	 */
+	qp_attr->qp_access_flags = (int)(uintptr_t)ibqp->xrcd;
+
+	return 0;
+}
+
+static struct ib_mr *hbl_ib_reg_mr(struct ib_pd *ibpd, u64 start, u64 length, u64 virt_addr,
+				   int access_flags, struct ib_udata *udata)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static struct ib_mr *hbl_ib_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start, u64 length,
+					       u64 virt_addr, int fd, int access_flags,
+					       struct ib_udata *udata)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+/* The GID table is created and maintained by the kernel rdma cache module based on the gid_tbl_len
+ * provided. add_gid callback would be called whenever a new GID entry is added to the GID table. We
+ * get the gid details as part of the attr param. We can store that for our reference.
+ */
+static int hbl_ib_add_gid(const struct ib_gid_attr *attr, void **context)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(attr->device);
+	struct hbl_aux_dev *aux_dev = hdev->aux_dev;
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_ib_port *ib_port;
+	union hbl_ib_sockaddr {
+		struct sockaddr_in saddr_in;
+		struct sockaddr_in6 saddr_in6;
+	} sa;
+	u32 port, ip_addr;
+	int rc;
+
+	rc = ib_to_hbl_port_num(hdev, attr->port_num, &port);
+	if (rc) {
+		hbl_ibdev_dbg(&hdev->ibdev, "invalid IB port %u\n", attr->port_num);
+		return rc;
+	}
+
+	ib_port = &hdev->ib_port[port];
+	aux_ops = aux_dev->aux_ops;
+
+	memcpy(ib_port->gids[attr->index].gid.raw, attr->gid.raw, sizeof(attr->gid));
+	ib_port->gids[attr->index].gid_type = attr->gid_type;
+
+	if (ipv6_addr_v4mapped((struct in6_addr *)&attr->gid)) {
+		rdma_gid2ip((struct sockaddr *)&sa, &ib_port->gids[attr->index].gid);
+		ip_addr = be32_to_cpu(sa.saddr_in.sin_addr.s_addr);
+		aux_ops->set_ip_addr_encap(aux_dev, ip_addr, port);
+	}
+
+	return 0;
+}
+
+static int hbl_ib_del_gid(const struct ib_gid_attr *attr, void **context)
+{
+	struct hbl_ib_device *hdev = to_hbl_ib_dev(attr->device);
+	struct hbl_ib_port *ib_port;
+
+	if (attr->port_num > hdev->max_num_of_ports) {
+		hbl_ibdev_dbg(&hdev->ibdev, "%s, port num: %d out of bounds\n", __func__,
+			      attr->port_num);
+		return -EINVAL;
+	}
+
+	ib_port = &hdev->ib_port[attr->port_num - 1];
+
+	/* validate the params */
+	if (attr->index >= HBL_IB_MAX_PORT_GIDS) {
+		hbl_ibdev_dbg(&hdev->ibdev, "%s, GID index: %d out of bounds\n", __func__,
+			      attr->index);
+		return -EINVAL;
+	}
+
+	memset(ib_port->gids[attr->index].gid.raw, 0, sizeof(attr->gid));
+	ib_port->gids[attr->index].gid_type = 0;
+
+	return 0;
+}
+
+static int hbl_ib_fill_data(struct sk_buff *msg, struct ib_qp *ibqp, bool req, bool print_qp_id)
+{
+	char *data_buf, *str_buf, *ptr, *ptr2, *ptr3, *full_name, *name, *val, *prefix;
+	struct hbl_ib_dump_qp_attr attr = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_ib_device *hdev;
+	struct ib_device *ibdev;
+	struct hbl_ib_qp *hblqp;
+	int rc = 0, len, i;
+	u32 hbl_port;
+
+	ibdev = ibqp->device;
+	hblqp = to_hbl_ib_qp(ibqp);
+	hdev = to_hbl_ib_dev(ibdev);
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = ib_to_hbl_port_num(hdev, ibqp->port, &hbl_port);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "invalid IB port %u\n", ibqp->port);
+		return rc;
+	}
+
+	data_buf = kzalloc(HBL_IB_DUMP_QP_SZ, GFP_KERNEL);
+	if (!data_buf)
+		return -ENOMEM;
+
+	str_buf = kcalloc(2, NAME_MAX, GFP_KERNEL);
+	if (!str_buf) {
+		rc = -ENOMEM;
+		goto free_data_buf;
+	}
+
+	prefix = req ? "req_" : "res_";
+
+	full_name = str_buf;
+	memcpy(full_name, prefix, strlen(prefix));
+	name = full_name + strlen(prefix);
+
+	val = full_name + NAME_MAX;
+
+	attr.port = hbl_port;
+	attr.qpn = hblqp->qp_id;
+	attr.req = req;
+	attr.full = false;
+	attr.force = true;
+
+	rc = aux_ops->dump_qp(aux_dev, &attr, data_buf, HBL_IB_DUMP_QP_SZ);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed to dump QP %d, port %d\n", attr.qpn, attr.port);
+		rc = -ENODATA;
+		goto free_str_buf;
+	}
+
+	if (print_qp_id) {
+		snprintf(val, NAME_MAX, "%u", hblqp->qp_id);
+		rc = rdma_nl_put_driver_string(msg, "qp_id", val);
+		if (rc)
+			goto free_str_buf;
+	}
+
+	/* skip first line */
+	ptr = strchr(data_buf, '\n');
+	ptr++;
+
+	while (1) {
+		ptr2 = strchr(ptr, ':');
+		if (!ptr2)
+			break;
+
+		/* Skip section headlines and any empty lines - they don't have (:) separator */
+		do {
+			ptr3 = strchr(ptr, '\n');
+			if (!ptr3 || ptr3 >= ptr2)
+				break;
+
+			ptr = ptr3 + 1;
+		} while (1);
+
+		/* extract attribute name */
+		len = ptr2 - ptr;
+		memcpy(name, ptr, len);
+		name[len] = '\0';
+
+		/* to lowercase and no spaces */
+		for (i = 0; i < len; i++)
+			if (isspace(name[i]))
+				name[i] = '_';
+			else
+				name[i] = tolower(name[i]);
+
+		/* skip ':' and the following space */
+		ptr = ptr2 + 2;
+
+		ptr2 = strchr(ptr, '\n');
+
+		/* extract attribute value */
+		len = ptr2 - ptr;
+		memcpy(val, ptr, len);
+		val[len] = '\0';
+
+		if (rdma_nl_put_driver_string(msg, full_name, val)) {
+			rc = -EMSGSIZE;
+			goto free_str_buf;
+		}
+
+		/* move to next line */
+		ptr = ptr2 + 1;
+	}
+
+free_str_buf:
+	kfree(str_buf);
+free_data_buf:
+	kfree(data_buf);
+
+	return rc;
+}
+
+static int hbl_ib_fill_res_qp_entry(struct sk_buff *msg, struct ib_qp *ibqp)
+{
+	struct ib_device *ibdev = ibqp->device;
+	struct nlattr *table_attr;
+	int rc;
+
+	table_attr = nla_nest_start(msg, RDMA_NLDEV_ATTR_DRIVER);
+	if (!table_attr)
+		return -EMSGSIZE;
+
+	rc = hbl_ib_fill_data(msg, ibqp, true, true);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed get REQ QP %d data, port %d\n", ibqp->qp_num,
+			      ibqp->port);
+		rc = -ENODATA;
+		goto free_table;
+	}
+
+	rc = hbl_ib_fill_data(msg, ibqp, false, false);
+	if (rc) {
+		hbl_ibdev_dbg(ibdev, "failed get RES QP %d data, port %d\n", ibqp->qp_num,
+			      ibqp->port);
+		rc = -ENODATA;
+		goto free_table;
+	}
+
+	nla_nest_end(msg, table_attr);
+
+	return 0;
+
+free_table:
+	nla_nest_cancel(msg, table_attr);
+	return rc;
+}
+
+void hbl_ib_eqe_null_work(struct hbl_aux_dev *aux_dev, u32 port)
+{
+}
+
+void hbl_ib_eqe_work_schd(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_ib_device *hdev = aux_dev->priv;
+	struct hbl_ib_port *ib_port;
+
+	ib_port = &hdev->ib_port[port];
+
+	if (!ib_port->open)
+		return;
+
+	/* Use this atomic to prevent a race - a thread handling received EQE in hbl_cn enters here
+	 * to wake up the EQ thread while another thread is executing hbl_ib_port_fini which
+	 * releases it. In such case the first thread might access a released resource.
+	 */
+	if (atomic_cmpxchg(&ib_port->eq_lock, 0, 1))
+		return;
+
+	complete(&ib_port->eq_comp);
+
+	atomic_set(&ib_port->eq_lock, 0);
+}
+
+static bool hbl_ib_dispatch_event_qp(struct hbl_ib_device *hdev, struct hbl_ib_ucontext *hctx,
+				     u32 port, u32 qpn, enum ib_event_type event_type,
+				     u64 extra_data)
+{
+	struct ib_event ibev = {};
+	struct hbl_ib_qp *hblqp;
+	bool found_qp = false;
+	unsigned long id = 0;
+	struct ib_qp *ibqp;
+	u32 qp_port;
+	int rc;
+
+	xa_lock(&hctx->qp_xarray);
+	xa_for_each(&hctx->qp_xarray, id, hblqp) {
+		ibqp = &hblqp->ibqp;
+
+		rc = ib_to_hbl_port_num(hdev, ibqp->port, &qp_port);
+		if (rc) {
+			hbl_ibdev_dbg(&hdev->ibdev, "invalid IB port %u, IB QP %u\n", ibqp->port,
+				      ibqp->qp_num);
+			continue;
+		}
+
+		/* We need to iterate over all QPs that are allocated
+		 * under this CTX as we need to perform backward mapping
+		 * of QP ID we have in HBL to the corresponding IB QP struct
+		 */
+		if (hblqp->qp_id == qpn && qp_port == port) {
+			/* xrcd is not used by our flows, so we may override it in order to pass
+			 * extra data for EQ events.
+			 * This is not part of the event, but rather part of the qp structure.
+			 * Meaning an additional QP event will override the value stored in xrcd.
+			 * Since this is an error case, the QP should not receive anymore events.
+			 */
+			ibqp->xrcd = (void *)extra_data;
+			ibev.event = event_type;
+			ibev.element.qp = ibqp;
+
+			ibqp->event_handler(&ibev, ibqp->qp_context);
+
+			/* We should mark the QP as in error state */
+			hblqp->qp_state = IB_QPS_ERR;
+
+			found_qp = true;
+			break;
+		}
+	}
+
+	xa_unlock(&hctx->qp_xarray);
+
+	return found_qp;
+}
+
+void hbl_ib_eqe_handler(struct hbl_ib_port *ib_port)
+{
+	struct hbl_ib_ucontext *hctx = ib_port->hctx;
+	struct hbl_cni_eq_poll_out eq_poll_out = {};
+	struct hbl_ib_device *hdev = ib_port->hdev;
+	struct hbl_cni_eq_poll_in eq_poll_in = {};
+	struct hbl_ib_aux_ops *aux_ops;
+	enum ib_event_type event_type;
+	struct hbl_aux_dev *aux_dev;
+	struct ib_event ibev = {};
+	u32 port = ib_port->port;
+	bool found_qp = false;
+	struct ib_cq *ibcq;
+	int rc;
+
+	aux_dev = hdev->aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	eq_poll_in.port = port;
+
+	rc = aux_ops->cmd_ctrl(aux_dev, hctx->cn_ctx, HBL_CNI_OP_EQ_POLL, &eq_poll_in,
+			       &eq_poll_out);
+	if (rc) {
+		hbl_ibdev_err(&hdev->ibdev, "port %d - EQ poll failed %d\n", port, rc);
+		return;
+	}
+
+	switch (eq_poll_out.status) {
+	case HBL_CNI_EQ_POLL_STATUS_SUCCESS:
+
+		ibev.device = &hdev->ibdev;
+
+		switch (eq_poll_out.ev_type) {
+		case HBL_CNI_EQ_EVENT_TYPE_CQ_ERR:
+			hbl_ibdev_dbg(&hdev->ibdev, "port %d cq %d - received CQ ERR event\n", port,
+				      eq_poll_out.idx);
+
+			xa_lock(&ib_port->hbl_ibcq_tbl);
+			ibcq = xa_load(&ib_port->hbl_ibcq_tbl, eq_poll_out.idx);
+
+			if (ibcq) {
+				ibev.element.cq = ibcq;
+				ibev.event = IB_EVENT_CQ_ERR;
+
+				ibcq->event_handler(&ibev, ibcq->cq_context);
+			} else {
+				hbl_ibdev_err(&hdev->ibdev,
+					      "port %d cq %d - received CQ ERR event, but CQ is not allocated\n",
+					      port, eq_poll_out.idx);
+			}
+
+			xa_unlock(&ib_port->hbl_ibcq_tbl);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_QP_ERR:
+			/* In IBv we can't pass the syndrome value to user space via IB events
+			 * mechanism, and hence we will print it instead.
+			 */
+			hbl_ibdev_err(&hdev->ibdev, "port %d qp %d - received QP ERR syndrome: %s\n",
+				      port, eq_poll_out.idx,
+				      aux_ops->qp_syndrome_to_str(aux_dev, eq_poll_out.ev_data));
+
+			event_type = eq_poll_out.is_req ? IB_EVENT_QP_REQ_ERR : IB_EVENT_QP_FATAL;
+
+			found_qp = hbl_ib_dispatch_event_qp(hdev, hctx, port, eq_poll_out.idx,
+							    event_type, eq_poll_out.ev_data);
+
+			if (!found_qp)
+				hbl_ibdev_err(&hdev->ibdev,
+					      "port %d qp %d - received QP ERR event, but QP is not allocated\n",
+					      port, eq_poll_out.idx);
+
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_DB_FIFO_ERR:
+			hbl_ibdev_err(&hdev->ibdev, "port %d user fifo %d error\n", port,
+				      eq_poll_out.idx);
+
+			ibev.event = IB_EVENT_DEVICE_FATAL;
+			ibev.element.port_num = (port & HBL_IB_EQ_PORT_FIELD_MASK) |
+						(eq_poll_out.idx << HBL_IB_EQ_PORT_FIELD_SIZE);
+			ib_dispatch_event(&ibev);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_CCQ:
+			hbl_ibdev_dbg(&hdev->ibdev, "Port %u: got completion on congestion CQ %u\n",
+				      port, eq_poll_out.idx);
+
+			ibev.event = IB_EVENT_SM_CHANGE;
+			ibev.element.port_num = (port & HBL_IB_EQ_PORT_FIELD_MASK) |
+						(eq_poll_out.idx << HBL_IB_EQ_PORT_FIELD_SIZE);
+			ib_dispatch_event(&ibev);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_WTD_SECURITY_ERR:
+			hbl_ibdev_dbg(&hdev->ibdev, "Port %u: got WTD security error on QP %u\n",
+				      port, eq_poll_out.idx);
+
+			found_qp = hbl_ib_dispatch_event_qp(hdev, hctx, port, eq_poll_out.idx,
+							    IB_EVENT_PATH_MIG, 0);
+
+			if (!found_qp)
+				hbl_ibdev_err(&hdev->ibdev,
+					      "port %d qp %d - received WTD security event, but QP is not allocated\n",
+					      port, eq_poll_out.idx);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_NUMERICAL_ERR:
+			hbl_ibdev_dbg(&hdev->ibdev, "Port %u: got numerical error on QP %u\n",
+				      port, eq_poll_out.idx);
+
+			found_qp = hbl_ib_dispatch_event_qp(hdev, hctx, port, eq_poll_out.idx,
+							    IB_EVENT_PATH_MIG_ERR, 0);
+
+			if (!found_qp)
+				hbl_ibdev_err(&hdev->ibdev,
+					      "port %d qp %d - received numerical error event, but QP is not allocated\n",
+					      port, eq_poll_out.idx);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_LINK_STATUS:
+			hbl_ibdev_dbg(&hdev->ibdev, "port %d link %s\n", port,
+				      eq_poll_out.ev_data ? "up" : "down");
+
+			ibev.event = eq_poll_out.ev_data ?
+				     IB_EVENT_PORT_ACTIVE : IB_EVENT_PORT_ERR;
+			ibev.element.port_num = port;
+			ib_dispatch_event(&ibev);
+			break;
+		case HBL_CNI_EQ_EVENT_TYPE_QP_ALIGN_COUNTERS:
+			hbl_ibdev_dbg(&hdev->ibdev,
+				      "port %d qp %d - Align QP counters on QP timeout\n", port,
+				      eq_poll_out.idx);
+
+			found_qp = hbl_ib_dispatch_event_qp(hdev, hctx, port, eq_poll_out.idx,
+							    IB_EVENT_QP_LAST_WQE_REACHED, 0);
+
+			if (!found_qp)
+				hbl_ibdev_err(&hdev->ibdev,
+					      "port %d qp %d - received Align QP counters event, but QP is not allocated\n",
+					      port, eq_poll_out.idx);
+			break;
+		default:
+			hbl_ibdev_dbg(&hdev->ibdev, "port %d EQ poll success, event %d\n", port,
+				      eq_poll_out.ev_type);
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+const struct ib_device_ops hbl_ib_dev_ops = {
+	.owner = THIS_MODULE,
+	.driver_id = RDMA_DRIVER_HBL,
+	.uverbs_abi_ver = HBL_IB_UVERBS_ABI_VERSION,
+
+	.add_gid = hbl_ib_add_gid,
+	.del_gid = hbl_ib_del_gid,
+	.alloc_hw_port_stats = hbl_ib_alloc_hw_port_stats,
+	.alloc_hw_device_stats = hbl_ib_alloc_hw_device_stats,
+	.alloc_pd = hbl_ib_alloc_pd,
+	.alloc_ucontext = hbl_ib_alloc_ucontext,
+	.create_cq = hbl_ib_create_cq,
+	.create_qp = hbl_ib_create_qp,
+	.dealloc_pd = hbl_ib_dealloc_pd,
+	.dealloc_ucontext = hbl_ib_dealloc_ucontext,
+	.dereg_mr = hbl_ib_dereg_mr,
+	.destroy_cq = hbl_ib_destroy_cq,
+	.destroy_qp = hbl_ib_destroy_qp,
+	.fill_res_qp_entry = hbl_ib_fill_res_qp_entry,
+	.get_hw_stats = hbl_ib_get_hw_stats,
+	.get_dev_fw_str = hbl_ib_get_dev_fw_str,
+	.get_link_layer = hbl_ib_port_link_layer,
+	.get_port_immutable = hbl_ib_get_port_immutable,
+	.mmap = hbl_ib_mmap,
+	.mmap_free = hbl_ib_mmap_free,
+	.modify_qp = hbl_ib_modify_qp,
+	.query_device = hbl_ib_query_device,
+	.query_gid = hbl_ib_query_gid,
+	.query_pkey = hbl_ib_query_pkey,
+	.query_port = hbl_ib_query_port,
+	.query_qp = hbl_ib_query_qp,
+	.reg_user_mr = hbl_ib_reg_mr,
+	.reg_user_mr_dmabuf = hbl_ib_reg_user_mr_dmabuf,
+
+	INIT_RDMA_OBJ_SIZE(ib_cq, hbl_ib_cq, ibcq),
+	INIT_RDMA_OBJ_SIZE(ib_pd, hbl_ib_pd, ibpd),
+	INIT_RDMA_OBJ_SIZE(ib_qp, hbl_ib_qp, ibqp),
+	INIT_RDMA_OBJ_SIZE(ib_ucontext, hbl_ib_ucontext, ibucontext),
+};
diff --git a/include/uapi/rdma/hbl-abi.h b/include/uapi/rdma/hbl-abi.h
new file mode 100644
index 000000000000..c545e07c9734
--- /dev/null
+++ b/include/uapi/rdma/hbl-abi.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) */
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_IB_ABI_USER_H
+#define HBL_IB_ABI_USER_H
+
+#include <linux/types.h>
+
+/* Increment this value if any changes that break userspace ABI compatibility are made. */
+#define HBL_IB_UVERBS_ABI_VERSION	1
+
+#define HBL_IB_MTU_8192			6
+
+/**
+ * struct hbl_ibv_alloc_ucontext_req - Request udata for alloc ucontext.
+ * @ports_mask: Mask of ports associated with this context. 0 is for all available ports.
+ * @core_fd: Core device file descriptor.
+ * @use_dvs: Indicates if we're going to use our DVs.
+ */
+struct hbl_ibv_alloc_ucontext_req {
+	__aligned_u64 ports_mask;
+	__s32 core_fd;
+	__u8 use_dvs;
+	__u8 reserved[3];
+};
+
+/**
+ * enum hbl_ibv_ucontext_cap - Device capabilities.
+ * @HBL_UCONTEXT_CAP_MMAP_UMR: User memory region.
+ * @HBL_UCONTEXT_CAP_CC: Congestion control.
+ */
+enum hbl_ibv_ucontext_cap {
+	HBL_UCONTEXT_CAP_MMAP_UMR = 1 << 0,
+	HBL_UCONTEXT_CAP_CC = 1 << 1,
+};
+
+/**
+ * struct hbl_ibv_alloc_ucontext_resp - Response udata for alloc ucontext.
+ * @ports_mask: Mask of ports associated with this context.
+ * @cap_mask: Capabilities mask.
+ */
+struct hbl_ibv_alloc_ucontext_resp {
+	__aligned_u64 ports_mask;
+	__aligned_u64 cap_mask;
+};
+
+/**
+ * struct hbl_ibv_alloc_pd_resp - Response udata for alloc PD.
+ * @pdn: PD number.
+ */
+struct hbl_ibv_alloc_pd_resp {
+	__u32 pdn;
+	__u32 reserved;
+};
+
+/**
+ * enum hbl_ibv_qp_wq_types - QP WQ types.
+ * @HBL_WQ_WRITE: WRITE or "native" SEND operations are allowed on this QP.
+ *                NOTE: the last is not supported!
+ * @HBL_WQ_RECV_RDV: RECEIVE-RDV or WRITE operations are allowed on this QP.
+ *                   NOTE: posting all operations at the same time is not supported!
+ * @HBL_WQ_READ_RDV: READ-RDV or WRITE operations are allowed on this QP.
+ *                   NOTE: posting all operations at the same time is not supported!
+ * @HBL_WQ_SEND_RDV: SEND-RDV operation is allowed on this QP.
+ * @HBL_WQ_READ_RDV_ENDP: No operation is allowed on this endpoint QP!
+ */
+enum hbl_ibv_qp_wq_types {
+	HBL_WQ_WRITE = 0x1,
+	HBL_WQ_RECV_RDV = 0x2,
+	HBL_WQ_READ_RDV = 0x4,
+	HBL_WQ_SEND_RDV = 0x8,
+	HBL_WQ_READ_RDV_ENDP = 0x10,
+};
+
+/**
+ * struct hbl_ibv_modify_qp_req - Request udata for modify QP.
+ * @local_key: Unique key for local memory access.
+ * @remote_key: Unique key for remote memory access.
+ * @congestion_wnd: Congestion-Window size.
+ * @dest_wq_size: Number of WQEs on the destination.
+ * @priority: Requester/responder QP priority.
+ * @wq_type: WQ type. e.g. write, rdv etc
+ * @loopback: QP loopback enable/disable.
+ * @congestion_en: Congestion-control enable/disable.
+ * @compression_en: Compression enable/disable.
+ * @encap_en: Encapsulation enable flag.
+ * @encap_num: Encapsulation number.
+ * @wq_granularity: WQ granularity [0 for 32B or 1 for 64B].
+ */
+struct hbl_ibv_modify_qp_req {
+	__u32 local_key;
+	__u32 remote_key;
+	__u32 congestion_wnd;
+	__u32 reserved0;
+	__u32 dest_wq_size;
+	__u8 priority;
+	__u8 wq_type;
+	__u8 loopback;
+	__u8 congestion_en;
+	__u8 reserved1;
+	__u8 reserved2;
+	__u8 compression_en;
+	__u8 reserved3;
+	__u8 encap_en;
+	__u8 encap_num;
+	__u8 reserved4;
+	__u8 wq_granularity;
+	__u8 reserved5;
+	__u8 reserved6[5];
+};
+
+/**
+ * struct hbl_ibv_modify_qp_resp - Response udata for modify QP.
+ * @swq_mem_handle: Send WQ mmap handle.
+ * @rwq_mem_handle: Receive WQ mmap handle.
+ * @swq_mem_size: Send WQ mmap size.
+ * @rwq_mem_size: Receive WQ mmap size.
+ * @qp_num: HBL QP num.
+ */
+struct hbl_ibv_modify_qp_resp {
+	__aligned_u64 swq_mem_handle;
+	__aligned_u64 rwq_mem_handle;
+	__u32 swq_mem_size;
+	__u32 rwq_mem_size;
+	__u32 qp_num;
+	__u32 reserved;
+};
+
+/**
+ * enum hbl_ibv_cq_type - CQ types, used during allocation of CQs.
+ * @HBL_CQ_TYPE_QP: Standard CQ used for completion of a operation for a QP.
+ * @HBL_CQ_TYPE_CC: Congestion control CQ.
+ */
+enum hbl_ibv_cq_type {
+	HBL_CQ_TYPE_QP,
+	HBL_CQ_TYPE_CC,
+};
+
+/**
+ * hbl_ibv_cq_req_flags - CQ req flag used for distinguision between CQ based on attributes.
+ * @CQ_FLAG_NATIVE: Bit 1 is set, it represents the CQ is called for native create CQ.
+ */
+enum hbl_ibv_cq_req_flags {
+	CQ_FLAG_NATIVE = 1 << 0,
+};
+
+/**
+ * struct hbl_ibv_create_cq_req - Request udata for create CQ.
+ * @port_num: IB Port number.
+ * @cq_type: Type of CQ resource as mentioned in hbl_ibv_cq_type.
+ * @flags: CQ req flag used for cq attributes.
+ */
+struct hbl_ibv_create_cq_req {
+	__u32 port_num;
+	__u8 cq_type;
+	__u8 flags;
+	__u8 reserved[2];
+};
+
+/**
+ * struct hbl_ibv_port_create_cq_resp - Response udata for create CQ.
+ * @mem_handle: Handle for the CQ buffer.
+ * @pi_handle: Handle for the Pi memory.
+ * @regs_handle: Handle for the CQ UMR register.
+ * @regs_offset: Register offset of CQ UMR register.
+ * @cq_num: CQ number that is allocated.
+ * @cq_size: Size of the CQ.
+ */
+struct hbl_ibv_port_create_cq_resp {
+	__aligned_u64 mem_handle;
+	__aligned_u64 pi_handle;
+	__aligned_u64 regs_handle;
+	__u32 regs_offset;
+	__u32 cq_num;
+	__u32 cq_size;
+	__u32 reserved;
+};
+
+/**
+ * struct hbl_ibv_create_cq_resp - Response udata for create CQ.
+ * @mem_handle: Handle for the CQ buffer.
+ * @pi_handle: Handle for the Pi memory.
+ * @regs_handle: Handle for the CQ UMR register.
+ * @regs_offset: Register offset of CQ UMR register.
+ * @cq_num: CQ number that is allocated.
+ * @cq_size: Size of the CQ.
+ * @port_cq_resp: response data for create CQ per port.
+ */
+struct hbl_ibv_create_cq_resp {
+	__aligned_u64 mem_handle;
+	__aligned_u64 pi_handle;
+	__aligned_u64 regs_handle;
+	__u32 regs_offset;
+	__u32 cq_num;
+	__u32 cq_size;
+	__u32 reserved;
+	struct hbl_ibv_port_create_cq_resp port_cq_resp[];
+};
+
+#endif /* HBL_IB_ABI_USER_H */
diff --git a/include/uapi/rdma/hbl_user_ioctl_cmds.h b/include/uapi/rdma/hbl_user_ioctl_cmds.h
new file mode 100644
index 000000000000..7ac2bf116385
--- /dev/null
+++ b/include/uapi/rdma/hbl_user_ioctl_cmds.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) */
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_IB_USER_IOCTL_CMDS_H
+#define HBL_IB_USER_IOCTL_CMDS_H
+
+#include <linux/types.h>
+#include <rdma/ib_user_ioctl_cmds.h>
+
+enum hbl_ib_objects {
+	HBL_IB_OBJECT_USR_FIFO = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_OBJECT_SET_PORT_EX,
+	HBL_IB_OBJECT_QUERY_PORT,
+	HBL_IB_OBJECT_RESERVED,
+	HBL_IB_OBJECT_ENCAP,
+};
+
+enum hbl_ib_usr_fifo_obj_methods {
+	HBL_IB_METHOD_USR_FIFO_OBJ_CREATE = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_METHOD_USR_FIFO_OBJ_DESTROY,
+};
+
+enum hbl_ib_usr_fifo_create_attrs {
+	HBL_IB_ATTR_USR_FIFO_CREATE_IN = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_ATTR_USR_FIFO_CREATE_OUT,
+	HBL_IB_ATTR_USR_FIFO_CREATE_HANDLE,
+};
+
+enum hbl_ib_usr_fifo_destroy_attrs {
+	HBL_IB_ATTR_USR_FIFO_DESTROY_HANDLE = (1U << UVERBS_ID_NS_SHIFT),
+};
+
+enum hbl_ib_device_methods {
+	HBL_IB_METHOD_SET_PORT_EX = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_METHOD_QUERY_PORT,
+};
+
+enum hbl_ib_set_port_ex_attrs {
+	HBL_IB_ATTR_SET_PORT_EX_IN = (1U << UVERBS_ID_NS_SHIFT),
+};
+
+enum hbl_ib_query_port_attrs {
+	HBL_IB_ATTR_QUERY_PORT_IN = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_ATTR_QUERY_PORT_OUT,
+};
+
+enum hbl_ib_encap_methods {
+	HBL_IB_METHOD_ENCAP_CREATE = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_METHOD_ENCAP_DESTROY,
+};
+
+enum hbl_ib_encap_create_attrs {
+	HBL_IB_ATTR_ENCAP_CREATE_IN = (1U << UVERBS_ID_NS_SHIFT),
+	HBL_IB_ATTR_ENCAP_CREATE_OUT,
+	HBL_IB_ATTR_ENCAP_CREATE_HANDLE,
+};
+
+enum hbl_ib_encap_destroy_attrs {
+	HBL_IB_ATTR_ENCAP_DESTROY_HANDLE = (1U << UVERBS_ID_NS_SHIFT),
+};
+
+#endif /* HBL_IB_USER_IOCTL_CMDS_H */
diff --git a/include/uapi/rdma/hbl_user_ioctl_verbs.h b/include/uapi/rdma/hbl_user_ioctl_verbs.h
new file mode 100644
index 000000000000..ce896f5c58ba
--- /dev/null
+++ b/include/uapi/rdma/hbl_user_ioctl_verbs.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) */
+/*
+ * Copyright 2022-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_IB_USER_IOCTL_VERBS_H
+#define HBL_IB_USER_IOCTL_VERBS_H
+
+#include <linux/types.h>
+
+#define HBL_IB_MAX_BP_OFFS		16
+
+enum hbl_ib_wq_array_type {
+	HBL_IB_WQ_ARRAY_TYPE_GENERIC,
+	HBL_IB_WQ_ARRAY_TYPE_RESERVED1,
+	HBL_IB_WQ_ARRAY_TYPE_RESERVED2,
+	HBL_IB_WQ_ARRAY_TYPE_RESERVED3,
+	HBL_IB_WQ_ARRAY_TYPE_RESERVED4,
+	HBL_IB_WQ_ARRAY_TYPE_MAX,
+};
+
+struct hbl_wq_array_attr {
+	__u32 max_num_of_wqs;
+	__u32 max_num_of_wqes_in_wq;
+	__u8 mem_id;
+	__u8 swq_granularity;
+	__u8 reserved0[6];
+	__aligned_u64 reserved1[2];
+};
+
+struct hbl_uapi_usr_fifo_create_in {
+	__u32 port_num;
+	__u32 reserved0;
+	__u32 reserved1;
+	__u32 usr_fifo_num_hint;
+	__u8 mode;
+	__u8 reserved2;
+	__u8 reserved3[6];
+};
+
+struct hbl_uapi_usr_fifo_create_out {
+	__aligned_u64 ci_handle;
+	__aligned_u64 regs_handle;
+	__u32 usr_fifo_num;
+	__u32 regs_offset;
+	__u32 size;
+	__u32 bp_thresh;
+};
+
+struct hbl_uapi_set_port_ex_in {
+	struct hbl_wq_array_attr wq_arr_attr[HBL_IB_WQ_ARRAY_TYPE_MAX];
+	/* Pointer to u32 array */
+	__aligned_u64 qp_wq_bp_offs;
+	__u32 qp_wq_bp_offs_cnt;
+	__u32 port_num;
+	__aligned_u64 reserved0;
+	__u32 reserved1;
+	__u8 reserved2;
+	__u8 advanced;
+	__u8 adaptive_timeout_en;
+	__u8 reserved3;
+};
+
+struct hbl_uapi_query_port_in {
+	__u32 port_num;
+	__u32 reserved;
+};
+
+struct hbl_uapi_query_port_out {
+	__u32 max_num_of_qps;
+	__u32 num_allocated_qps;
+	__u32 max_allocated_qp_num;
+	__u32 max_cq_size;
+	__u32 reserved0;
+	__u32 reserved1;
+	__u32 reserved2;
+	__u32 reserved3;
+	__u32 reserved4;
+	__u8 advanced;
+	__u8 max_num_of_cqs;
+	__u8 max_num_of_usr_fifos;
+	__u8 max_num_of_encaps;
+	__u8 nic_macro_idx;
+	__u8 nic_phys_port_idx;
+	__u8 reserved[6];
+};
+
+struct hbl_uapi_encap_create_in {
+	__aligned_u64 tnl_hdr_ptr;
+	__u32 tnl_hdr_size;
+	__u32 port_num;
+	__u32 ipv4_addr;
+	__u16 udp_dst_port;
+	__u16 ip_proto;
+	__u8 encap_type;
+	__u8 reserved[7];
+};
+
+struct hbl_uapi_encap_create_out {
+	__u32 encap_num;
+	__u32 reserved;
+};
+
+#endif /* HBL_IB_USER_IOCTL_VERBS_H */
diff --git a/include/uapi/rdma/ib_user_ioctl_verbs.h b/include/uapi/rdma/ib_user_ioctl_verbs.h
index fe15bc7e9f70..016ac5c8fdea 100644
--- a/include/uapi/rdma/ib_user_ioctl_verbs.h
+++ b/include/uapi/rdma/ib_user_ioctl_verbs.h
@@ -255,6 +255,7 @@ enum rdma_driver_id {
 	RDMA_DRIVER_SIW,
 	RDMA_DRIVER_ERDMA,
 	RDMA_DRIVER_MANA,
+	RDMA_DRIVER_HBL,
 };
 
 enum ib_uverbs_gid_type {
-- 
2.34.1

