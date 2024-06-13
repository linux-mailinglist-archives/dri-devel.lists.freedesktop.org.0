Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B19084B6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AC710EC5F;
	Fri, 14 Jun 2024 07:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="L6TR9YnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86B910E2C9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:23:00 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266936; bh=E0TN4H/JRQHvYXFmwJD+4g20Cf0z/4A5nWsj+AQmWVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L6TR9YnMS1c190isK/CHy8E0i8FqhOno/qJVtiLAw6Q83uQZ1WxGkwXCYi4nlFYk+
 vauxgaq4/YFnBvD1LIrlVVuuV8KssCgKvuMPKm12YpLZsPwfjfCVLyfJfmE730hHKP
 9o/+3rocAfR9SKtIc8DhhgN2r7aWj9zjwwymbw9KgRDgXSCGFxh6oj7bWwrz8J4mdT
 v/qHJaNDFRsm11LBVETnmoB+hGIKo8e2RjpljTjcPQTuMr+TD1VDsZicgLGjLx/e74
 RkfkNfNfyPfTiaGQGZ9O5bBpOeDIqkNbEhh5SWdshxeXHJxqsE4rr3vYZj2Ge+2hyR
 DhdpfU8tPphvA==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hW1440009; Thu, 13 Jun 2024 11:22:08 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Date: Thu, 13 Jun 2024 11:21:54 +0300
Message-Id: <20240613082208.1439968-2-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:51 +0000
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

Add the hbl_cn driver which will serve both Ethernet and InfiniBand
drivers.
hbl_cn is the layer which is used by the satellite drivers for many shared
operations that are needed by both EN and IB subsystems like QPs, CQs etc.
The CN driver is initialized via auxiliary bus by the habanalabs driver.

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
 .../device_drivers/ethernet/index.rst         |    1 +
 .../device_drivers/ethernet/intel/hbl.rst     |   82 +
 MAINTAINERS                                   |   11 +
 drivers/net/ethernet/intel/Kconfig            |   20 +
 drivers/net/ethernet/intel/Makefile           |    1 +
 drivers/net/ethernet/intel/hbl_cn/Makefile    |    9 +
 .../net/ethernet/intel/hbl_cn/common/Makefile |    3 +
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.c | 5954 +++++++++++++++++
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.h | 1627 +++++
 .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |  220 +
 .../intel/hbl_cn/common/hbl_cn_memory.c       |   40 +
 .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c |   33 +
 .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  |   13 +
 include/linux/habanalabs/cpucp_if.h           |  125 +-
 include/linux/habanalabs/hl_boot_if.h         |    9 +-
 include/linux/net/intel/cn.h                  |  474 ++
 include/linux/net/intel/cn_aux.h              |  298 +
 include/linux/net/intel/cni.h                 |  636 ++
 18 files changed, 9545 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/ethernet/intel/hbl.rst
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
 create mode 100644 include/linux/net/intel/cn.h
 create mode 100644 include/linux/net/intel/cn_aux.h
 create mode 100644 include/linux/net/intel/cni.h

diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 6932d8c043c2..2fe975aae7b1 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -40,6 +40,7 @@ Contents:
    intel/i40e
    intel/iavf
    intel/ice
+   intel/hbl
    marvell/octeontx2
    marvell/octeon_ep
    marvell/octeon_ep_vf
diff --git a/Documentation/networking/device_drivers/ethernet/intel/hbl.rst b/Documentation/networking/device_drivers/ethernet/intel/hbl.rst
new file mode 100644
index 000000000000..ebf436d0da7c
--- /dev/null
+++ b/Documentation/networking/device_drivers/ethernet/intel/hbl.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0
+======================================================================
+Linux kernel drivers for HabanaLabs (an Intel company) Network
+======================================================================
+
+Copyright 2020-2024 HabanaLabs, Ltd.
+Copyright(c) 2023-2024 Intel Corporation.
+
+Contents
+========
+
+- Overview
+- Identifying Your Adapter
+- Important Notes
+- Support
+- Trademarks
+
+Overview
+========
+
+These drivers enables the infrastructure for network functionality which is part
+of the GAUDI ASIC family of AI Accelerators.
+
+The network interfaces are mainly used for scaling the training of AI neural
+networks through ROCEv2 protocol.
+
+Driver's information can be obtained using lspci.
+
+For questions related to hardware requirements, refer to the documentation
+supplied with your HabanaLabs adapter. All hardware requirements listed apply to
+use with Linux.
+
+The included network drivers are Core Network, Ethernet and InfiniBand which are
+all based on the habanalabs driver which serves as the compute driver and the
+general platform.
+This is the drivers scheme:
+
++------------+  |      +-----+       |    +-------+
+| INFINIBAND |  |      | NET |       |    | ACCEL |
++------------+  |      +-----+       |    +-------+
+                |                    |
+    +----+      |  +----+   +----+   |  +------------+
+    | IB |      |  | EN <---| CN |   |  | HABANALABS |
+    +-^--+      |  +----+   +---^+   |  +------------+
+      |                       | |              |
+      +-----------------------+ +--------------+
+
+The parent driver is at the arrow base and the son is at the arrow head.
+The CN driver is both a parent and a son driver.
+
+Identifying Your Adapter
+========================
+For information on how to identify your adapter, and for the latest Intel
+network drivers, refer to the Intel Support website:
+https://www.intel.com/support
+
+Important Notes
+===============
+
+hbl_cn main goal is to provide core functionalities that are shared between the
+Ethernet (hbl_en) and the InfiniBand (hbl) drivers.
+It contains all core logic that is needed to operate the satellite drivers while
+keeping them as minimal as possible. Only pure Ethernet/InfiniBand code should
+reside in the satellite drivers.
+This code structure ensures a single and common infrastructure layer for both
+functionalities which makes it easier to modify and maintain.
+
+Support
+=======
+For general information, go to the Intel support website at:
+https://www.intel.com/support/
+
+If an issue is identified with the released source code on a supported kernel
+with a supported adapter, email the specific information related to the issue
+to intel-wired-lan@lists.osuosl.org.
+
+Trademarks
+==========
+Intel is a trademark or registered trademark of Intel Corporation or its
+subsidiaries in the United States and/or other countries.
+
+* Other names and brands may be claimed as the property of others.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8754ac2c259d..e948e33e990d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9604,6 +9604,17 @@ F:	include/linux/habanalabs/
 F:	include/trace/events/habanalabs.h
 F:	include/uapi/drm/habanalabs_accel.h
 
+HABANALABS CORE NETWORK DRIVER
+M:	Omer Shpigelman <oshpigelman@habana.ai>
+L:	netdev@vger.kernel.org
+L:	linux-rdma@vger.kernel.org
+S:	Supported
+W:	https://www.habana.ai
+F:	Documentation/networking/device_drivers/ethernet/intel/hbl.rst
+F:	drivers/net/ethernet/intel/hbl_cn/
+F:	include/linux/habanalabs/
+F:	include/linux/net/intel/cn*
+
 HACKRF MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/drivers/net/ethernet/intel/Kconfig b/drivers/net/ethernet/intel/Kconfig
index e0287fbd501d..0d1b8a2bae99 100644
--- a/drivers/net/ethernet/intel/Kconfig
+++ b/drivers/net/ethernet/intel/Kconfig
@@ -397,4 +397,24 @@ config IDPF
 	  To compile this driver as a module, choose M here. The module
 	  will be called idpf.
 
+config HABANA_CN
+	tristate "HabanaLabs (an Intel Company) Core Network driver"
+	depends on X86_64
+	depends on PCI
+	select AUXILIARY_BUS
+	default n
+	help
+	  This driver enables the infrastructure for network functionality that
+	  is part of the GAUDI ASIC family of AI Accelerators.
+	  For more information on how to identify your adapter, go to the
+	  Adapter & Driver ID Guide that can be located at:
+
+	  <http://support.intel.com>
+
+	  More specific information on configuring the driver is in
+	  <file:Documentation/networking/device_drivers/ethernet/intel/hbl.rst>.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called habanalabs_cn.
+
 endif # NET_VENDOR_INTEL
diff --git a/drivers/net/ethernet/intel/Makefile b/drivers/net/ethernet/intel/Makefile
index 04c844ef4964..10049a28e336 100644
--- a/drivers/net/ethernet/intel/Makefile
+++ b/drivers/net/ethernet/intel/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_IAVF) += iavf/
 obj-$(CONFIG_FM10K) += fm10k/
 obj-$(CONFIG_ICE) += ice/
 obj-$(CONFIG_IDPF) += idpf/
+obj-$(CONFIG_HABANA_CN) += hbl_cn/
diff --git a/drivers/net/ethernet/intel/hbl_cn/Makefile b/drivers/net/ethernet/intel/hbl_cn/Makefile
new file mode 100644
index 000000000000..84ee2a6d7c3b
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for HabanaLabs (an Intel Company) core network driver
+#
+
+obj-$(CONFIG_HABANA_CN) := habanalabs_cn.o
+
+include $(src)/common/Makefile
+habanalabs_cn-y += $(HBL_CN_COMMON_FILES)
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/Makefile b/drivers/net/ethernet/intel/hbl_cn/common/Makefile
new file mode 100644
index 000000000000..c8cf092db786
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+HBL_CN_COMMON_FILES := common/hbl_cn_drv.o common/hbl_cn.o \
+	common/hbl_cn_phy.o common/hbl_cn_qp.o common/hbl_cn_memory.o
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
new file mode 100644
index 000000000000..946b11bfa61b
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
@@ -0,0 +1,5954 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl_cn.h"
+
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+
+#define NIC_MIN_WQS_PER_PORT		2
+
+#define NIC_SEQ_RESETS_TIMEOUT_MS	15000 /* 15 seconds */
+#define NIC_MAX_SEQ_RESETS		3
+
+#define HBL_CN_IPV4_PROTOCOL_UDP	17
+
+/* SOB mask is not expected to change across ASIC. Hence common defines. */
+#define NIC_SOB_INC_MASK		0x80000000
+#define NIC_SOB_VAL_MASK		0x7fff
+
+#define NIC_DUMP_QP_SZ			SZ_4K
+
+#define HBL_AUX2NIC(aux_dev)	\
+	({ \
+		struct hbl_aux_dev *__aux_dev = (aux_dev); \
+		((__aux_dev)->type == HBL_AUX_DEV_ETH) ? \
+		container_of(__aux_dev, struct hbl_cn_device, en_aux_dev) : \
+		container_of(__aux_dev, struct hbl_cn_device, ib_aux_dev); \
+	})
+
+#define RAND_STAT_CNT(cnt) \
+	do { \
+		u32 __cnt = get_random_u32(); \
+		(cnt) = __cnt; \
+		dev_info(hdev->dev, "port %d, %s: %u\n", port, #cnt, __cnt); \
+	} while (0)
+
+struct hbl_cn_stat hbl_cn_mac_fec_stats[] = {
+	{"correctable_errors", 0x2, 0x3},
+	{"uncorrectable_errors", 0x4, 0x5}
+};
+
+struct hbl_cn_stat hbl_cn_mac_stats_rx[] = {
+	{"Octets", 0x0},
+	{"OctetsReceivedOK", 0x4},
+	{"aAlignmentErrors", 0x8},
+	{"aPAUSEMACCtrlFramesReceived", 0xC},
+	{"aFrameTooLongErrors", 0x10},
+	{"aInRangeLengthErrors", 0x14},
+	{"aFramesReceivedOK", 0x18},
+	{"aFrameCheckSequenceErrors", 0x1C},
+	{"VLANReceivedOK", 0x20},
+	{"ifInErrors", 0x24},
+	{"ifInUcastPkts", 0x28},
+	{"ifInMulticastPkts", 0x2C},
+	{"ifInBroadcastPkts", 0x30},
+	{"DropEvents", 0x34},
+	{"Pkts", 0x38},
+	{"UndersizePkts", 0x3C},
+	{"Pkts64Octets", 0x40},
+	{"Pkts65to127Octets", 0x44},
+	{"Pkts128to255Octets", 0x48},
+	{"Pkts256to511Octets", 0x4C},
+	{"Pkts512to1023Octets", 0x50},
+	{"Pkts1024to1518Octets", 0x54},
+	{"Pkts1519toMaxOctets", 0x58},
+	{"OversizePkts", 0x5C},
+	{"Jabbers", 0x60},
+	{"Fragments", 0x64},
+	{"aCBFCPAUSERx0", 0x68},
+	{"aCBFCPAUSERx1", 0x6C},
+	{"aCBFCPAUSERx2", 0x70},
+	{"aCBFCPAUSERx3", 0x74},
+	{"aCBFCPAUSERx4", 0x78},
+	{"aCBFCPAUSERx5", 0x7C},
+	{"aCBFCPAUSERx6", 0x80},
+	{"aCBFCPAUSERx7", 0x84},
+	{"aMACControlFramesReceived", 0x88}
+};
+
+struct hbl_cn_stat hbl_cn_mac_stats_tx[] = {
+	{"Octets", 0x0},
+	{"OctetsTransmittedOK", 0x4},
+	{"aPAUSEMACCtrlFramesTransmitted", 0x8},
+	{"aFramesTransmittedOK", 0xC},
+	{"VLANTransmittedOK", 0x10},
+	{"ifOutErrors", 0x14},
+	{"ifOutUcastPkts", 0x18},
+	{"ifOutMulticastPkts", 0x1C},
+	{"ifOutBroadcastPkts", 0x20},
+	{"Pkts64Octets", 0x24},
+	{"Pkts65to127Octets", 0x28},
+	{"Pkts128to255Octets", 0x2C},
+	{"Pkts256to511Octets", 0x30},
+	{"Pkts512to1023Octets", 0x34},
+	{"Pkts1024to1518Octets", 0x38},
+	{"Pkts1519toMaxOctets", 0x3C},
+	{"aCBFCPAUSETx0", 0x40},
+	{"aCBFCPAUSETx1", 0x44},
+	{"aCBFCPAUSETx2", 0x48},
+	{"aCBFCPAUSETx3", 0x4C},
+	{"aCBFCPAUSETx4", 0x50},
+	{"aCBFCPAUSETx5", 0x54},
+	{"aCBFCPAUSETx6", 0x58},
+	{"aCBFCPAUSETx7", 0x5C},
+	{"aMACControlFramesTx", 0x60},
+	{"Pkts", 0x64}
+};
+
+static const char pcs_counters_str[][ETH_GSTRING_LEN] = {
+	{"pcs_local_faults"},
+	{"pcs_remote_faults"},
+	{"pcs_remote_fault_reconfig"},
+	{"pcs_link_restores"},
+	{"pcs_link_toggles"},
+};
+
+static size_t pcs_counters_str_len = ARRAY_SIZE(pcs_counters_str);
+size_t hbl_cn_mac_fec_stats_len = ARRAY_SIZE(hbl_cn_mac_fec_stats);
+size_t hbl_cn_mac_stats_rx_len = ARRAY_SIZE(hbl_cn_mac_stats_rx);
+size_t hbl_cn_mac_stats_tx_len = ARRAY_SIZE(hbl_cn_mac_stats_tx);
+
+static void qps_stop(struct hbl_cn_device *hdev);
+static void qp_destroy_work(struct work_struct *work);
+static int __user_wq_arr_unset(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type);
+static void user_cq_destroy(struct kref *kref);
+static void set_app_params_clear(struct hbl_cn_device *hdev);
+static int hbl_cn_ib_cmd_ctrl(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx, u32 op, void *input,
+			      void *output);
+static int hbl_cn_ib_query_mem_handle(struct hbl_aux_dev *ib_aux_dev, u64 mem_handle,
+				      struct hbl_ib_mem_info *info);
+
+static void hbl_cn_reset_stats_counters_port(struct hbl_cn_device *hdev, u32 port);
+static void hbl_cn_late_init(struct hbl_cn_device *hdev);
+static void hbl_cn_late_fini(struct hbl_cn_device *hdev);
+static int hbl_cn_sw_init(struct hbl_cn_device *hdev);
+static void hbl_cn_sw_fini(struct hbl_cn_device *hdev);
+static void hbl_cn_spmu_init(struct hbl_cn_port *cn_port, bool full);
+static int hbl_cn_cmd_port_check(struct hbl_cn_device *hdev, u32 port, u32 flags);
+static void hbl_cn_qps_stop(struct hbl_cn_port *cn_port);
+
+static int hbl_cn_request_irqs(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->request_irqs(hdev);
+}
+
+static void hbl_cn_free_irqs(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs =  hdev->asic_funcs;
+
+	asic_funcs->free_irqs(hdev);
+}
+
+static void hbl_cn_synchronize_irqs(struct hbl_aux_dev *cn_aux_dev)
+{
+	struct hbl_cn_device *hdev = cn_aux_dev->priv;
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->synchronize_irqs(hdev);
+}
+
+void hbl_cn_get_frac_info(u64 numerator, u64 denominator, u64 *integer, u64 *exp)
+{
+	u64 high_digit_n, high_digit_d, integer_tmp, exp_tmp;
+	u8 num_digits_n, num_digits_d;
+	int i;
+
+	num_digits_d = hbl_cn_get_num_of_digits(denominator);
+	high_digit_d = denominator;
+	for (i = 0; i < num_digits_d - 1; i++)
+		high_digit_d /= 10;
+
+	integer_tmp = 0;
+	exp_tmp = 0;
+
+	if (numerator) {
+		num_digits_n = hbl_cn_get_num_of_digits(numerator);
+		high_digit_n = numerator;
+		for (i = 0; i < num_digits_n - 1; i++)
+			high_digit_n /= 10;
+
+		exp_tmp = num_digits_d - num_digits_n;
+
+		if (high_digit_n < high_digit_d) {
+			high_digit_n *= 10;
+			exp_tmp++;
+		}
+
+		integer_tmp = div_u64(high_digit_n, high_digit_d);
+	}
+
+	*integer = integer_tmp;
+	*exp = exp_tmp;
+}
+
+int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data[], u32 *num_out_data)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_stat *ignore;
+	int rc;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->spmu_get_stats_info(cn_port, &ignore, num_out_data);
+
+	/* this function can be called from ethtool, get_statistics ioctl and FW status thread */
+	mutex_lock(&cn_port->cnt_lock);
+	rc = port_funcs->spmu_sample(cn_port, *num_out_data, out_data);
+	mutex_unlock(&cn_port->cnt_lock);
+
+	return rc;
+}
+
+static u32 hbl_cn_get_port_toggle_cnt(struct hbl_cn_port *cn_port)
+{
+	/* We should not count the first toggle, as it marks that port was brought up for
+	 * the first time. In case port connection wasn't established, the counter should be 0.
+	 */
+	return cn_port->port_toggle_cnt ? cn_port->port_toggle_cnt - 1 : 0;
+}
+
+static int __hbl_cn_get_cnts_num(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+
+	return pcs_counters_str_len +
+		hdev->asic_funcs->port_funcs->get_cnts_num(cn_port);
+}
+
+static void __hbl_cn_get_cnts_names(struct hbl_cn_port *cn_port, u8 *data, bool ext)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	int i, len;
+
+	len = ext ? HBL_IB_CNT_NAME_LEN : ETH_GSTRING_LEN;
+
+	for (i = 0; i < pcs_counters_str_len; i++)
+		memcpy(data + i * len, pcs_counters_str[i], ETH_GSTRING_LEN);
+	data += i * len;
+
+	hdev->asic_funcs->port_funcs->get_cnts_names(cn_port, data, ext);
+}
+
+static void __hbl_cn_get_cnts_values(struct hbl_cn_port *cn_port, u64 *data)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+
+	data[0] = cn_port->pcs_local_fault_cnt;
+	data[1] = cn_port->pcs_remote_fault_cnt;
+	data[2] = cn_port->pcs_remote_fault_reconfig_cnt;
+	data[3] = cn_port->pcs_link_restore_cnt;
+	data[4] = hbl_cn_get_port_toggle_cnt(cn_port);
+
+	data += pcs_counters_str_len;
+
+	hdev->asic_funcs->port_funcs->get_cnts_values(cn_port, data);
+}
+
+static int __hbl_cn_port_hw_init(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+
+	if (cn_port->disabled) {
+		dev_err(hdev->dev, "Port %u is disabled\n", cn_port->port);
+		return -EPERM;
+	}
+
+	hbl_cn_reset_stats_counters_port(hdev, cn_port->port);
+
+	return hdev->asic_funcs->port_funcs->port_hw_init(cn_port);
+}
+
+static void __hbl_cn_port_hw_fini(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = hdev->asic_funcs;
+
+	/* in hard reset the QPs were stopped by hbl_cn_stop called from halt engines */
+	if (hdev->operational)
+		hbl_cn_qps_stop(cn_port);
+
+	asic_funcs->port_funcs->port_hw_fini(cn_port);
+}
+
+bool hbl_cn_comp_device_operational(struct hbl_cn_device *hdev)
+{
+	struct hbl_aux_dev *aux_dev = hdev->cn_aux_dev;
+	struct hbl_cn_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+
+	return aux_ops->device_operational(aux_dev);
+}
+
+void hbl_cn_spmu_get_stats_info(struct hbl_cn_port *cn_port, struct hbl_cn_stat **stats,
+				u32 *n_stats)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+
+	hdev->asic_funcs->port_funcs->spmu_get_stats_info(cn_port, stats, n_stats);
+}
+
+int hbl_cn_reserve_dva_block(struct hbl_cn_ctx *ctx, u64 size, u64 *dva)
+{
+	struct hbl_cn_device *hdev = ctx->hdev;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	return aux_ops->vm_reserve_dva_block(aux_dev, ctx->driver_vm_info.vm_handle, size, dva);
+}
+
+void hbl_cn_unreserve_dva_block(struct hbl_cn_ctx *ctx, u64 dva, u64 size)
+{
+	struct hbl_cn_device *hdev = ctx->hdev;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	aux_ops->vm_unreserve_dva_block(aux_dev, ctx->driver_vm_info.vm_handle, dva, size);
+}
+
+int hbl_cn_get_hw_block_handle(struct hbl_cn_device *hdev, u64 address, u64 *handle)
+{
+	return hdev->asic_funcs->get_hw_block_handle(hdev, address, handle);
+}
+
+static int hbl_cn_get_hw_block_addr(struct hbl_cn_device *hdev, u64 handle, u64 *addr, u64 *size)
+{
+	return hdev->asic_funcs->get_hw_block_addr(hdev, handle, addr, size);
+}
+
+int hbl_cn_send_cpucp_packet(struct hbl_cn_device *hdev, u32 port, enum cpucp_packet_id pkt_id,
+			     int val)
+{
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return hdev->asic_funcs->port_funcs->send_cpucp_packet(cn_port, pkt_id, val);
+}
+
+static bool hbl_cn_device_operational(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+
+	return hdev->operational;
+}
+
+static void hbl_cn_hw_access_lock(struct hbl_aux_dev *aux_dev)
+	__acquires(&hdev->hw_access_lock)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+
+	mutex_lock(&hdev->hw_access_lock);
+}
+
+static void hbl_cn_hw_access_unlock(struct hbl_aux_dev *aux_dev)
+	__releases(&hdev->hw_access_lock)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+
+	mutex_unlock(&hdev->hw_access_lock);
+}
+
+static bool hbl_cn_is_eth_lpbk(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+
+	return hdev->eth_loopback;
+}
+
+static int hbl_cn_port_hw_init(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return __hbl_cn_port_hw_init(cn_port);
+}
+
+static void hbl_cn_port_hw_fini(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	__hbl_cn_port_hw_fini(cn_port);
+}
+
+static int hbl_cn_phy_port_init(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return hdev->asic_funcs->port_funcs->phy_port_init(cn_port);
+}
+
+static void hbl_cn_phy_port_fini(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	hdev->asic_funcs->port_funcs->phy_port_fini(cn_port);
+}
+
+static int hbl_cn_set_pfc(struct hbl_aux_dev *aux_dev, u32 port, bool enable)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	cn_port->pfc_enable = enable;
+
+	return hdev->asic_funcs->port_funcs->set_pfc(cn_port);
+}
+
+static int hbl_cn_get_cnts_num(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return __hbl_cn_get_cnts_num(cn_port);
+}
+
+static void hbl_cn_get_cnts_names(struct hbl_aux_dev *aux_dev, u32 port, u8 *data)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	__hbl_cn_get_cnts_names(cn_port, data, false);
+}
+
+static void hbl_cn_get_cnts_values(struct hbl_aux_dev *aux_dev, u32 port, u64 *data)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	__hbl_cn_get_cnts_values(cn_port, data);
+}
+
+static bool hbl_cn_get_mac_lpbk(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return cn_port->mac_loopback;
+}
+
+static int hbl_cn_set_mac_lpbk(struct hbl_aux_dev *aux_dev, u32 port, bool enable)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	if (atomic_read(&cn_port->num_of_allocated_qps)) {
+		dev_dbg(hdev->dev,
+			"There are active QPs under this port - Can't %s mac loopback\n",
+			enable ? "enable" : "disable");
+		return -EBUSY;
+	}
+
+	cn_port->mac_loopback = enable;
+
+	if (enable)
+		hdev->mac_loopback |= BIT(port);
+	else
+		hdev->mac_loopback &= ~BIT(port);
+
+	return 0;
+}
+
+static int hbl_cn_update_mtu(struct hbl_aux_dev *aux_dev, u32 port, u32 mtu)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	unsigned long qp_id = 0;
+	struct hbl_cn_qp *qp;
+	int rc = 0;
+
+	cn_port = &hdev->cn_ports[port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+	mtu += HBL_EN_MAX_HEADERS_SZ;
+
+	port_funcs->cfg_lock(cn_port);
+	xa_for_each(&cn_port->qp_ids, qp_id, qp) {
+		if (qp->mtu_type == MTU_FROM_NETDEV && qp->mtu != mtu) {
+			rc = port_funcs->update_qp_mtu(cn_port, qp, mtu);
+			if (rc) {
+				dev_err(hdev->dev, "Failed to update MTU, port: %d, qpn: %ld, %d\n",
+					port, qp_id, rc);
+				break;
+			}
+		}
+	}
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int hbl_cn_qpc_write(struct hbl_aux_dev *aux_dev, u32 port, void *qpc,
+			    struct qpc_mask *qpc_mask, u32 qpn, bool is_req)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	int rc;
+
+	cn_port = &hdev->cn_ports[port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->cfg_lock(cn_port);
+	rc = port_funcs->qpc_write(cn_port, qpc, qpc_mask, qpn, is_req);
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static void hbl_cn_ctrl_lock(struct hbl_aux_dev *aux_dev, u32 port)
+	__acquires(&cn_port->control_lock)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	mutex_lock(&cn_port->control_lock);
+}
+
+static void hbl_cn_ctrl_unlock(struct hbl_aux_dev *aux_dev, u32 port)
+	__releases(&cn_port->control_lock)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	mutex_unlock(&cn_port->control_lock);
+}
+
+static int hbl_cn_dispatcher_register_qp(struct hbl_aux_dev *aux_dev, u32 port, u32 asid, u32 qp_id)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return hbl_cn_eq_dispatcher_register_qp(cn_port, asid, qp_id);
+}
+
+static int hbl_cn_dispatcher_unregister_qp(struct hbl_aux_dev *aux_dev, u32 port, u32 qp_id)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return hbl_cn_eq_dispatcher_unregister_qp(cn_port, qp_id);
+}
+
+static u32 hbl_cn_get_speed(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	return cn_port->speed;
+}
+
+static void hbl_cn_track_ext_port_reset(struct hbl_aux_dev *aux_dev, u32 port, u32 syndrome)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	hbl_cn_track_port_reset(cn_port, syndrome);
+}
+
+static void hbl_cn_port_toggle_count(struct hbl_aux_dev *aux_dev, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	cn_port->port_toggle_cnt++;
+}
+
+/* Check for initialized hbl IB device. */
+bool hbl_cn_is_ibdev(struct hbl_cn_device *hdev)
+{
+	return !!hdev->ib_aux_dev.priv;
+}
+
+/* Check for opened hbl IB device. */
+static bool hbl_cn_is_ibdev_opened(struct hbl_cn_device *hdev)
+{
+	return hdev->ib_aux_dev.priv && hdev->ib_device_opened;
+}
+
+static int hbl_cn_ib_alloc_ucontext(struct hbl_aux_dev *ib_aux_dev, int user_fd, void **cn_ib_ctx)
+{
+	struct hbl_cn_comp_vm_info *user_vm_info, *driver_vm_info;
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(ib_aux_dev);
+	struct hbl_aux_dev *aux_dev = hdev->cn_aux_dev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_cn_ctx *ctx;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+	aux_ops = aux_dev->aux_ops;
+
+	if (!hdev->multi_ctx_support && hdev->ctx) {
+		dev_err(hdev->dev, "There is already an active user context\n");
+		return -EBUSY;
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->hdev = hdev;
+	mutex_init(&ctx->lock);
+
+	user_vm_info = &ctx->user_vm_info;
+	driver_vm_info = &ctx->driver_vm_info;
+
+	rc = aux_ops->register_cn_user_context(aux_dev, user_fd, ctx, &ctx->comp_handle,
+					       &user_vm_info->vm_handle);
+	if (rc) {
+		dev_dbg(hdev->dev, "Failed to register user context with FD %d\n", user_fd);
+		goto release_ctx;
+	}
+
+	if (user_vm_info->vm_handle != ctx->comp_handle) {
+		rc = aux_ops->get_vm_info(aux_dev, user_vm_info->vm_handle, &user_vm_info->vm_info);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to get user VM info for handle 0x%llx\n",
+				user_vm_info->vm_handle);
+			goto deregister_ctx;
+		}
+
+		if (user_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB)
+			ctx->user_asid = user_vm_info->vm_info.net_tlb.pasid;
+		else
+			ctx->user_asid = user_vm_info->vm_info.ext_mmu.work_id;
+	} else {
+		/* No data transfer in this mode */
+		ctx->user_asid = -1;
+	}
+
+	rc = aux_ops->vm_create(aux_dev, ctx->comp_handle, 0, &driver_vm_info->vm_handle);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to create driver VM for vompute handle 0x%llx\n",
+			ctx->comp_handle);
+		goto deregister_ctx;
+	}
+
+	rc = aux_ops->get_vm_info(aux_dev, driver_vm_info->vm_handle, &driver_vm_info->vm_info);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to get driver VM info for handle 0x%llx\n",
+			driver_vm_info->vm_handle);
+		goto destroy_driver_vm;
+	}
+
+	if (driver_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB)
+		ctx->asid = driver_vm_info->vm_info.net_tlb.pasid;
+	else
+		ctx->asid = driver_vm_info->vm_info.ext_mmu.work_id;
+
+	/* must be called before calling create_mem_ctx */
+	rc = asic_funcs->ctx_init(ctx);
+	if (rc) {
+		dev_err(hdev->dev, "failed to init user context with ASID %d\n", ctx->asid);
+		goto destroy_driver_vm;
+	}
+
+	if (ctx->user_asid != -1 && user_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB) {
+		rc = asic_funcs->create_mem_ctx(ctx, user_vm_info->vm_info.net_tlb.pasid,
+						user_vm_info->vm_info.net_tlb.page_tbl_addr);
+		if (rc) {
+			dev_err(hdev->dev,
+				"failed to create HW memory context for user VM, FD %d\n", user_fd);
+			goto ctx_cleanup;
+		}
+	}
+
+	if (driver_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB) {
+		rc = asic_funcs->create_mem_ctx(ctx, driver_vm_info->vm_info.net_tlb.pasid,
+						driver_vm_info->vm_info.net_tlb.page_tbl_addr);
+		if (rc) {
+			dev_err(hdev->dev,
+				"failed to create HW memory context for driver VM, FD %d\n",
+				user_fd);
+			goto user_vm_ctx_cleanup;
+		}
+	}
+
+	*cn_ib_ctx = ctx;
+	hdev->ib_device_opened = true;
+	hdev->ctx = ctx;
+
+	return 0;
+
+user_vm_ctx_cleanup:
+	if (ctx->user_asid != -1 && user_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB)
+		asic_funcs->destroy_mem_ctx(ctx, user_vm_info->vm_info.net_tlb.pasid,
+					    user_vm_info->vm_info.net_tlb.page_tbl_addr);
+ctx_cleanup:
+	asic_funcs->ctx_fini(ctx);
+destroy_driver_vm:
+	aux_ops->vm_destroy(aux_dev, driver_vm_info->vm_handle);
+deregister_ctx:
+	aux_ops->deregister_cn_user_context(aux_dev, user_vm_info->vm_handle);
+release_ctx:
+	mutex_destroy(&ctx->lock);
+	kfree(ctx);
+
+	return rc;
+}
+
+static void hbl_cn_ib_dealloc_ucontext(struct hbl_aux_dev *ib_aux_dev, void *cn_ib_ctx)
+{
+	struct hbl_cn_comp_vm_info *user_vm_info, *driver_vm_info;
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(ib_aux_dev);
+	struct hbl_aux_dev *aux_dev = hdev->cn_aux_dev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_ctx *ctx = cn_ib_ctx;
+	struct hbl_cn_aux_ops *aux_ops;
+
+	aux_ops = aux_dev->aux_ops;
+	asic_funcs = hdev->asic_funcs;
+	user_vm_info = &ctx->user_vm_info;
+	driver_vm_info = &ctx->driver_vm_info;
+
+	dev_dbg(hdev->dev, "IB context dealloc\n");
+
+	if (driver_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB)
+		asic_funcs->destroy_mem_ctx(ctx, driver_vm_info->vm_info.net_tlb.pasid,
+					    driver_vm_info->vm_info.net_tlb.page_tbl_addr);
+
+	if (ctx->user_asid != -1 && user_vm_info->vm_info.mmu_mode == HBL_CN_MMU_MODE_NETWORK_TLB)
+		asic_funcs->destroy_mem_ctx(ctx, user_vm_info->vm_info.net_tlb.pasid,
+					    user_vm_info->vm_info.net_tlb.page_tbl_addr);
+
+	hbl_cn_ctx_resources_destroy(hdev, ctx);
+	hdev->asic_funcs->ctx_fini(ctx);
+
+	aux_ops->vm_destroy(aux_dev, driver_vm_info->vm_handle);
+	aux_ops->deregister_cn_user_context(aux_dev, user_vm_info->vm_handle);
+
+	hdev->ctx = NULL;
+	mutex_destroy(&ctx->lock);
+	kfree(ctx);
+
+	hdev->ib_device_opened = false;
+}
+
+static void hbl_cn_ib_query_port(struct hbl_aux_dev *aux_dev, u32 port,
+				 struct hbl_ib_port_attr *port_attr)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+
+	asic_funcs = hdev->asic_funcs;
+	cn_port = &hdev->cn_ports[port];
+
+	port_attr->open = hbl_cn_is_port_open(cn_port);
+	port_attr->link_up = cn_port->pcs_link;
+	port_attr->speed = cn_port->speed;
+	port_attr->max_msg_sz = asic_funcs->get_max_msg_sz(hdev);
+	port_attr->num_lanes = hdev->lanes_per_port;
+	port_attr->max_mtu = SZ_8K;
+}
+
+static inline void parse_fw_ver(struct hbl_cn_device *hdev, char *str, u32 *maj, u16 *min, u16 *sub)
+{
+	char *ver = strstr(str, "fw-");
+	int ret;
+
+	if (!ver)
+		goto failure;
+
+	ret = sscanf(ver, "fw-%d.%hu.%hu", maj, min, sub);
+	if (ret < 3) {
+failure:
+		dev_dbg(hdev->dev, "Failed to read version string\n");
+		*maj = *min = *sub = 0;
+	}
+}
+
+static void hbl_cn_ib_query_device(struct hbl_aux_dev *aux_dev, struct hbl_ib_device_attr *dev_attr)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_properties *cn_props;
+	struct hbl_ib_aux_data *aux_data;
+	u16 minor, sub_ver;
+	u32 major;
+
+	aux_data = aux_dev->aux_data;
+	cn_props = &hdev->cn_props;
+
+	if (hdev->cpucp_fw) {
+		parse_fw_ver(hdev, hdev->fw_ver, &major, &minor, &sub_ver);
+		dev_attr->fw_ver = ((u64)major << 32) | ((u64)minor << 16) | sub_ver;
+	}
+
+	dev_attr->max_mr_size = aux_data->dram_size;
+
+	dev_attr->page_size_cap = PAGE_SIZE;
+
+	dev_attr->vendor_id = hdev->pdev->vendor;
+	dev_attr->vendor_part_id = hdev->pdev->device;
+	dev_attr->hw_ver = hdev->pdev->subsystem_device;
+
+	dev_attr->max_qp = cn_props->max_qps_num;
+
+	dev_attr->max_qp_wr = aux_data->max_num_of_wqes;
+	dev_attr->max_cqe = cn_props->user_cq_max_entries;
+
+	dev_attr->cqe_size = cn_props->cqe_size;
+	dev_attr->min_cq_entries = cn_props->user_cq_min_entries;
+}
+
+static void hbl_cn_ib_set_ip_addr_encap(struct hbl_aux_dev *aux_dev, u32 ip_addr, u32 port)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 encap_id;
+
+	asic_funcs = hdev->asic_funcs;
+	cn_port = &hdev->cn_ports[port];
+
+	asic_funcs->port_funcs->set_ip_addr_encap(cn_port, &encap_id, ip_addr);
+}
+
+static char *hbl_cn_ib_qp_syndrome_to_str(struct hbl_aux_dev *aux_dev, u32 syndrome)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->qp_syndrome_to_str(syndrome);
+}
+
+static int hbl_cn_ib_verify_qp_id(struct hbl_aux_dev *aux_dev, u32 qp_id, u32 port)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	struct hbl_cn_device *hdev;
+	struct hbl_cn_qp *qp;
+	int rc = 0;
+
+	hdev = HBL_AUX2NIC(aux_dev);
+	port_funcs = hdev->asic_funcs->port_funcs;
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs->cfg_lock(cn_port);
+	qp = xa_load(&cn_port->qp_ids, qp_id);
+
+	if (IS_ERR_OR_NULL(qp)) {
+		dev_dbg(hdev->dev, "Failed to find matching QP for handle %d, port %d\n", qp_id,
+			port);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	/* sanity test the port IDs */
+	if (qp->port != port) {
+		dev_dbg(hdev->dev, "QP port %d does not match requested port %d\n", qp->port, port);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int hbl_cn_ib_dump_qp(struct hbl_aux_dev *aux_dev, struct hbl_ib_dump_qp_attr *attr,
+			     char *buf, size_t size)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_qp_info qp_info = {};
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	qp_info.port = attr->port;
+	qp_info.qpn = attr->qpn;
+	qp_info.req = attr->req;
+	qp_info.full_print = attr->full;
+	qp_info.force_read = attr->force;
+
+	rc = asic_funcs->qp_read(hdev, &qp_info, buf, size);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to read QP %u, port %u\n", attr->qpn, attr->port);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int hbl_cn_en_aux_data_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_en_aux_data *en_aux_data;
+	struct hbl_cn_properties *cn_props;
+	struct hbl_en_aux_ops *en_aux_ops;
+	struct hbl_aux_dev *en_aux_dev;
+	char **mac_addr;
+	int i;
+
+	en_aux_dev = &hdev->en_aux_dev;
+	en_aux_dev->type = HBL_AUX_DEV_ETH;
+	en_aux_data = en_aux_dev->aux_data;
+	en_aux_ops = en_aux_dev->aux_ops;
+	cn_props = &hdev->cn_props;
+
+	en_aux_data->pdev = hdev->pdev;
+	en_aux_data->dev = hdev->dev;
+	en_aux_data->ports_mask = hdev->ext_ports_mask;
+	en_aux_data->auto_neg_mask = hdev->auto_neg_mask;
+	en_aux_data->id = hdev->id;
+	en_aux_data->fw_ver = hdev->fw_ver;
+	en_aux_data->qsfp_eeprom = hdev->cpucp_info->qsfp_eeprom;
+	en_aux_data->pending_reset_long_timeout = hdev->pending_reset_long_timeout;
+	en_aux_data->max_frm_len = cn_props->max_frm_len;
+	en_aux_data->raw_elem_size = cn_props->raw_elem_size;
+	en_aux_data->max_raw_mtu = cn_props->max_raw_mtu;
+	en_aux_data->min_raw_mtu = cn_props->min_raw_mtu;
+	en_aux_data->max_num_of_ports = hdev->cn_props.max_num_of_ports;
+	en_aux_data->has_eq = hdev->has_eq;
+	en_aux_data->asic_type = hdev->asic_type;
+
+	mac_addr = kcalloc(hdev->cn_props.max_num_of_ports, sizeof(*mac_addr), GFP_KERNEL);
+	if (!mac_addr)
+		return -ENOMEM;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(en_aux_data->ports_mask & BIT(i)))
+			continue;
+
+		mac_addr[i] = hdev->cpucp_info->mac_addrs[i].mac_addr;
+	}
+
+	en_aux_data->mac_addr = mac_addr;
+
+	/* set en -> cn ops */
+	/* device functions */
+	en_aux_ops->device_operational = hbl_cn_device_operational;
+	en_aux_ops->hw_access_lock = hbl_cn_hw_access_lock;
+	en_aux_ops->hw_access_unlock = hbl_cn_hw_access_unlock;
+	en_aux_ops->is_eth_lpbk = hbl_cn_is_eth_lpbk;
+	/* port functions */
+	en_aux_ops->port_hw_init = hbl_cn_port_hw_init;
+	en_aux_ops->port_hw_fini = hbl_cn_port_hw_fini;
+	en_aux_ops->phy_init = hbl_cn_phy_port_init;
+	en_aux_ops->phy_fini = hbl_cn_phy_port_fini;
+	en_aux_ops->set_pfc = hbl_cn_set_pfc;
+	en_aux_ops->get_cnts_num = hbl_cn_get_cnts_num;
+	en_aux_ops->get_cnts_names = hbl_cn_get_cnts_names;
+	en_aux_ops->get_cnts_values = hbl_cn_get_cnts_values;
+	en_aux_ops->get_mac_lpbk = hbl_cn_get_mac_lpbk;
+	en_aux_ops->set_mac_lpbk = hbl_cn_set_mac_lpbk;
+	en_aux_ops->update_mtu = hbl_cn_update_mtu;
+	en_aux_ops->qpc_write = hbl_cn_qpc_write;
+	en_aux_ops->ctrl_lock = hbl_cn_ctrl_lock;
+	en_aux_ops->ctrl_unlock = hbl_cn_ctrl_unlock;
+	en_aux_ops->eq_dispatcher_register_qp = hbl_cn_dispatcher_register_qp;
+	en_aux_ops->eq_dispatcher_unregister_qp = hbl_cn_dispatcher_unregister_qp;
+	en_aux_ops->get_speed = hbl_cn_get_speed;
+	en_aux_ops->track_ext_port_reset = hbl_cn_track_ext_port_reset;
+	en_aux_ops->port_toggle_count = hbl_cn_port_toggle_count;
+
+	asic_funcs->set_en_data(hdev);
+
+	return 0;
+}
+
+static void hbl_cn_en_aux_data_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->en_aux_dev;
+	struct hbl_en_aux_data *aux_data;
+
+	aux_data = aux_dev->aux_data;
+
+	kfree(aux_data->mac_addr);
+	aux_data->mac_addr = NULL;
+}
+
+static int hbl_cn_ib_aux_data_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_ib_port_cnts_data *cnts_data;
+	struct hbl_ib_aux_data *ib_aux_data;
+	struct hbl_ib_aux_ops *ib_aux_ops;
+	struct hbl_aux_dev *ib_aux_dev;
+	struct hbl_cn_port *cn_port;
+	int rc, i;
+
+	ib_aux_dev = &hdev->ib_aux_dev;
+	ib_aux_dev->type = HBL_AUX_DEV_IB;
+	ib_aux_data = ib_aux_dev->aux_data;
+	ib_aux_ops = ib_aux_dev->aux_ops;
+
+	ib_aux_data->pdev = hdev->pdev;
+	ib_aux_data->dev = hdev->dev;
+	ib_aux_data->ports_mask = hdev->ports_mask;
+	ib_aux_data->ext_ports_mask = hdev->ext_ports_mask;
+	ib_aux_data->max_num_of_wqes = hdev->cn_props.max_hw_user_wqs_num;
+	ib_aux_data->max_num_of_ports = hdev->cn_props.max_num_of_ports;
+	ib_aux_data->pending_reset_long_timeout = hdev->pending_reset_long_timeout;
+	ib_aux_data->id = hdev->id;
+	ib_aux_data->dram_size = hdev->dram_size;
+	ib_aux_data->mixed_qp_wq_types = hdev->mixed_qp_wq_types;
+	ib_aux_data->umr_support = hdev->umr_support;
+	ib_aux_data->cc_support = hdev->cc_support;
+
+	ib_aux_data->cnts_data = kcalloc(hdev->cn_props.max_num_of_ports,
+					 sizeof(*ib_aux_data->cnts_data), GFP_KERNEL);
+	if (!ib_aux_data->cnts_data)
+		return -ENOMEM;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(ib_aux_data->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+		cnts_data = &ib_aux_data->cnts_data[i];
+
+		cnts_data->num = __hbl_cn_get_cnts_num(cn_port);
+
+		cnts_data->names = kcalloc(cnts_data->num, HBL_IB_CNT_NAME_LEN, GFP_KERNEL);
+		if (!cnts_data->names) {
+			rc = -ENOMEM;
+			goto free_cnts_data;
+		}
+
+		__hbl_cn_get_cnts_names(cn_port, cnts_data->names, true);
+	}
+
+	/* set ib -> cn ops */
+	/* the following functions are used even if the IB verbs API is disabled */
+	ib_aux_ops->device_operational = hbl_cn_device_operational;
+	ib_aux_ops->hw_access_lock = hbl_cn_hw_access_lock;
+	ib_aux_ops->hw_access_unlock = hbl_cn_hw_access_unlock;
+	ib_aux_ops->alloc_ucontext = hbl_cn_ib_alloc_ucontext;
+	ib_aux_ops->dealloc_ucontext = hbl_cn_ib_dealloc_ucontext;
+	ib_aux_ops->query_port = hbl_cn_ib_query_port;
+	ib_aux_ops->query_device = hbl_cn_ib_query_device;
+	ib_aux_ops->set_ip_addr_encap = hbl_cn_ib_set_ip_addr_encap;
+	ib_aux_ops->qp_syndrome_to_str = hbl_cn_ib_qp_syndrome_to_str;
+	ib_aux_ops->verify_qp_id = hbl_cn_ib_verify_qp_id;
+	ib_aux_ops->get_cnts_values = hbl_cn_get_cnts_values;
+	ib_aux_ops->dump_qp = hbl_cn_ib_dump_qp;
+
+	/* these functions are used only if the IB verbs API is enabled */
+	ib_aux_ops->cmd_ctrl = hbl_cn_ib_cmd_ctrl;
+	ib_aux_ops->query_mem_handle = hbl_cn_ib_query_mem_handle;
+
+	return 0;
+
+free_cnts_data:
+	for (--i; i >= 0; i--) {
+		if (!(ib_aux_data->ports_mask & BIT(i)))
+			continue;
+
+		kfree(ib_aux_data->cnts_data[i].names);
+	}
+	kfree(ib_aux_data->cnts_data);
+
+	return rc;
+}
+
+static void hbl_cn_ib_aux_data_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_ib_aux_data *aux_data;
+	struct hbl_aux_dev *aux_dev;
+	int i;
+
+	aux_dev = &hdev->ib_aux_dev;
+	aux_data = aux_dev->aux_data;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(aux_data->ports_mask & BIT(i)))
+			continue;
+
+		kfree(aux_data->cnts_data[i].names);
+	}
+	kfree(aux_data->cnts_data);
+}
+
+static void eth_adev_release(struct device *dev)
+{
+	struct hbl_aux_dev *aux_dev = container_of(dev, struct hbl_aux_dev, adev.dev);
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+
+	hdev->is_eth_aux_dev_initialized = false;
+}
+
+static int hbl_cn_en_aux_drv_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->en_aux_dev;
+	struct auxiliary_device *adev;
+	int rc;
+
+	rc = hbl_cn_en_aux_data_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "eth aux data init failed\n");
+		return rc;
+	}
+
+	adev = &aux_dev->adev;
+	adev->id = hdev->id;
+	adev->name = "en";
+	adev->dev.parent = hdev->dev;
+	adev->dev.release = eth_adev_release;
+
+	rc = auxiliary_device_init(adev);
+	if (rc) {
+		dev_err(hdev->dev, "eth auxiliary_device_init failed\n");
+		goto aux_data_free;
+	}
+
+	rc = auxiliary_device_add(adev);
+	if (rc) {
+		dev_err(hdev->dev, "eth auxiliary_device_add failed\n");
+		goto uninit_adev;
+	}
+
+	hdev->is_eth_aux_dev_initialized = true;
+
+	return 0;
+
+uninit_adev:
+	auxiliary_device_uninit(adev);
+aux_data_free:
+	hbl_cn_en_aux_data_fini(hdev);
+
+	return rc;
+}
+
+static void hbl_cn_en_aux_drv_fini(struct hbl_cn_device *hdev)
+{
+	struct auxiliary_device *adev;
+
+	if (!hdev->is_eth_aux_dev_initialized)
+		return;
+
+	adev = &hdev->en_aux_dev.adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+
+	hbl_cn_en_aux_data_fini(hdev);
+}
+
+static void ib_adev_release(struct device *dev)
+{
+	struct hbl_aux_dev *aux_dev = container_of(dev, struct hbl_aux_dev, adev.dev);
+	struct hbl_cn_device *hdev;
+
+	hdev = container_of(aux_dev, struct hbl_cn_device, ib_aux_dev);
+
+	hdev->is_ib_aux_dev_initialized = false;
+}
+
+static int hbl_cn_ib_aux_drv_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->ib_aux_dev;
+	struct auxiliary_device *adev;
+	int rc;
+
+	if (!hdev->ib_support)
+		return 0;
+
+	rc = hbl_cn_ib_aux_data_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "IB aux data init failed\n");
+		return rc;
+	}
+
+	adev = &aux_dev->adev;
+	adev->id = hdev->id;
+	adev->name = "ib";
+	adev->dev.parent = hdev->dev;
+	adev->dev.release = ib_adev_release;
+
+	rc = auxiliary_device_init(adev);
+	if (rc) {
+		dev_err(hdev->dev, "ib auxiliary_device_init failed\n");
+		goto aux_data_free;
+	}
+
+	rc = auxiliary_device_add(adev);
+	if (rc) {
+		dev_err(hdev->dev, "ib auxiliary_device_add failed\n");
+		goto uninit_adev;
+	}
+
+	hdev->is_ib_aux_dev_initialized = true;
+
+	return 0;
+
+uninit_adev:
+	auxiliary_device_uninit(adev);
+aux_data_free:
+	hbl_cn_ib_aux_data_fini(hdev);
+
+	return rc;
+}
+
+static void hbl_cn_ib_aux_drv_fini(struct hbl_cn_device *hdev)
+{
+	struct auxiliary_device *adev;
+
+	if (!hdev->ib_support || !hdev->is_ib_aux_dev_initialized)
+		return;
+
+	adev = &hdev->ib_aux_dev.adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+
+	hbl_cn_ib_aux_data_fini(hdev);
+}
+
+void hbl_cn_internal_port_fini_locked(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (!cn_port->port_open)
+		return;
+
+	cn_port->port_open = false;
+
+	/* verify that the port is marked as closed before continuing */
+	mb();
+
+	asic_funcs->port_funcs->phy_port_fini(cn_port);
+
+	__hbl_cn_port_hw_fini(cn_port);
+}
+
+static void hbl_cn_internal_ports_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)) || (hdev->ext_ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		mutex_lock(&cn_port->control_lock);
+
+		hbl_cn_internal_port_fini_locked(cn_port);
+
+		mutex_unlock(&cn_port->control_lock);
+	}
+}
+
+void hbl_cn_ports_cancel_status_work(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		cancel_delayed_work_sync(&cn_port->fw_status_work);
+	}
+}
+
+int hbl_cn_internal_port_init_locked(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 port = cn_port->port;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	rc = __hbl_cn_port_hw_init(cn_port);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to configure the HW, port: %d, %d", port, rc);
+		return rc;
+	}
+
+	rc = asic_funcs->port_funcs->phy_port_init(cn_port);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to configure the HW, port: %d, %d", port, rc);
+		goto phy_fail;
+	}
+
+	cn_port->port_open = true;
+
+	return 0;
+
+phy_fail:
+	__hbl_cn_port_hw_fini(cn_port);
+
+	return rc;
+}
+
+static int hbl_cn_internal_ports_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	u32 port;
+	int rc, i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)) || (hdev->ext_ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+		port = cn_port->port;
+
+		mutex_lock(&cn_port->control_lock);
+
+		rc = hbl_cn_internal_port_init_locked(cn_port);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to configure the HW, port: %d, %d", port, rc);
+			mutex_unlock(&cn_port->control_lock);
+			goto port_init_fail;
+		}
+
+		mutex_unlock(&cn_port->control_lock);
+	}
+
+	return 0;
+
+port_init_fail:
+	hbl_cn_internal_ports_fini(hdev);
+
+	return rc;
+}
+
+static int hbl_cn_kernel_ctx_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->kernel_ctx_init(hdev, hdev->kernel_asid);
+}
+
+static void hbl_cn_kernel_ctx_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->kernel_ctx_fini(hdev, hdev->kernel_asid);
+}
+
+static void hbl_cn_mac_loopback_init(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	u32 port = cn_port->port;
+	bool enable;
+
+	aux_dev = &hdev->en_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	enable = !!(hdev->mac_loopback & BIT(port));
+	cn_port->mac_loopback = enable;
+
+	if (cn_port->eth_enable && aux_ops->set_dev_lpbk)
+		aux_ops->set_dev_lpbk(aux_dev, port, enable);
+}
+
+static int hbl_cn_core_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_macro *cn_macro;
+	struct hbl_cn_port *cn_port;
+	int rc, i, port_cnt = 0;
+	u32 port;
+
+	/* RX packet drop config is not preserved across hard reset. */
+	hdev->rx_drop_percent = 0;
+
+	if (hdev->load_phy_fw) {
+		if (hdev->cn_props.is_phy_fw_binary) {
+			rc = hbl_cn_phy_has_binary_fw(hdev);
+			if (rc) {
+				dev_err(hdev->dev, "F/W file was not found\n");
+				return rc;
+			}
+		}
+
+		rc = asic_funcs->phy_fw_load_all(hdev);
+		if (rc) {
+			dev_err(hdev->dev, "F/W load for all failed\n");
+			return rc;
+		}
+	}
+
+	if (hdev->phy_config_fw)
+		dev_dbg(hdev->dev, "F/W CRC: 0x%x\n", asic_funcs->phy_get_crc(hdev));
+
+	for (i = 0; i < hdev->cn_props.num_of_macros; i++) {
+		hdev->cn_macros[i].phy_macro_needs_reset = true;
+		hdev->cn_macros[i].rec_link_sts = 0;
+	}
+
+	memset(hdev->phy_ber_info, 0,
+	       hdev->cn_props.max_num_of_lanes * sizeof(struct hbl_cn_ber_info));
+
+	rc = asic_funcs->core_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "core init failed\n");
+		return rc;
+	}
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++, port_cnt++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+		cn_macro = cn_port->cn_macro;
+		port = cn_port->port;
+
+		/* In case this port got disabled, enable it back here */
+		cn_port->disabled = false;
+		/* Port toggle count should be reinitialized for each port upond hard reset only */
+		cn_port->port_toggle_cnt = 0;
+		cn_port->port_toggle_cnt_prev = 0;
+
+		/* Reset the macro PHY once on boot.
+		 * This function resets all the 4 lanes in the PHY macro, therefore only one of the
+		 * two ports of the macro should call it.
+		 */
+		if (hdev->phy_config_fw && cn_macro->phy_macro_needs_reset) {
+			rc = asic_funcs->phy_reset_macro(cn_macro);
+			if (rc) {
+				dev_err(hdev->dev, "PHY reset macro failed for port %d\n", port);
+				goto err;
+			}
+
+			cn_macro->phy_macro_needs_reset = false;
+		}
+
+		hbl_cn_spmu_init(cn_port, false);
+
+		cn_port->auto_neg_enable = !!(hdev->auto_neg_mask & BIT(port));
+
+		if (!hdev->in_reset)
+			cn_port->eth_enable = !!(BIT(port) & hdev->ext_ports_mask);
+
+		/* This function must be called after setting cn_port->eth_enable */
+		hbl_cn_mac_loopback_init(cn_port);
+	}
+
+	return 0;
+
+err:
+	asic_funcs->core_fini(hdev);
+
+	return rc;
+}
+
+static void hbl_cn_core_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->core_fini(hdev);
+}
+
+static void wq_arrays_pool_destroy(struct hbl_cn_device *hdev)
+{
+	if (!hdev->wq_arrays_pool_enable)
+		return;
+
+	gen_pool_destroy(hdev->wq_arrays_pool);
+}
+
+static int wq_arrays_pool_alloc(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_properties *cn_props;
+	int rc;
+
+	if (!hdev->wq_arrays_pool_enable)
+		return 0;
+
+	cn_props = &hdev->cn_props;
+
+	hdev->wq_arrays_pool = gen_pool_create(ilog2(hdev->cache_line_size), -1);
+	if (!hdev->wq_arrays_pool) {
+		dev_err(hdev->dev, "Failed to create a pool to manage WQ arrays on HBM\n");
+		rc = -ENOMEM;
+		goto gen_pool_create_fail;
+	}
+
+	gen_pool_set_algo(hdev->wq_arrays_pool, gen_pool_best_fit, NULL);
+
+	rc = gen_pool_add(hdev->wq_arrays_pool, cn_props->wq_base_addr, cn_props->wq_base_size,
+			  -1);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to add memory to the WQ arrays pool\n");
+		goto gen_pool_add_fail;
+	}
+
+	return 0;
+
+gen_pool_add_fail:
+	gen_pool_destroy(hdev->wq_arrays_pool);
+gen_pool_create_fail:
+	return rc;
+}
+
+int __hbl_cn_ports_reopen(struct hbl_cn_device *hdev)
+{
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *en_aux_dev;
+	int rc;
+
+	en_aux_dev = &hdev->en_aux_dev;
+	aux_ops = en_aux_dev->aux_ops;
+
+	rc = hbl_cn_kernel_ctx_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init kernel context\n");
+		return rc;
+	}
+
+	rc = hbl_cn_core_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init core\n");
+		goto core_init_fail;
+	}
+
+	rc = hbl_cn_internal_ports_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init internal ports\n");
+		goto internal_ports_fail;
+	}
+
+	hdev->in_reset = false;
+	hdev->fw_reset = false;
+	hdev->operational = true;
+
+	if (aux_ops->ports_reopen) {
+		rc = aux_ops->ports_reopen(en_aux_dev);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to reopen en ports\n");
+			goto en_ports_reopen_fail;
+		}
+	}
+
+	return 0;
+
+en_ports_reopen_fail:
+	hdev->operational = false;
+	hbl_cn_internal_ports_fini(hdev);
+internal_ports_fail:
+	hbl_cn_core_fini(hdev);
+core_init_fail:
+	hbl_cn_kernel_ctx_fini(hdev);
+
+	return rc;
+}
+
+void __hbl_cn_stop(struct hbl_cn_device *hdev)
+{
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *en_aux_dev;
+
+	en_aux_dev = &hdev->en_aux_dev;
+	aux_ops = en_aux_dev->aux_ops;
+
+	/* Cancelling all outstanding works for all ports should be done first when stopping */
+	hdev->asic_funcs->ports_cancel_status_work(hdev);
+
+	qps_stop(hdev);
+
+	if (aux_ops->ports_stop)
+		aux_ops->ports_stop(en_aux_dev);
+
+	hbl_cn_internal_ports_fini(hdev);
+	hbl_cn_core_fini(hdev);
+	hbl_cn_kernel_ctx_fini(hdev);
+}
+
+void __hbl_cn_hard_reset_prepare(struct hbl_cn_device *hdev, bool fw_reset, bool in_teardown)
+{
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *en_aux_dev;
+
+	en_aux_dev = &hdev->en_aux_dev;
+	aux_ops = en_aux_dev->aux_ops;
+
+	hdev->in_reset = true;
+	hdev->fw_reset = fw_reset;
+	hdev->in_teardown = in_teardown;
+	hdev->operational = false;
+
+	mutex_lock(&hdev->hw_access_lock);
+	mutex_unlock(&hdev->hw_access_lock);
+
+	if (aux_ops->ports_stop_prepare)
+		aux_ops->ports_stop_prepare(en_aux_dev);
+}
+
+void hbl_cn_hard_reset_prepare(struct hbl_aux_dev *cn_aux_dev, bool fw_reset, bool in_teardown)
+{
+	struct hbl_cn_device *hdev = cn_aux_dev->priv;
+
+	__hbl_cn_hard_reset_prepare(hdev, fw_reset, in_teardown);
+}
+
+int hbl_cn_send_port_cpucp_status(struct hbl_aux_dev *aux_dev, u32 port, u8 cmd, u8 period)
+{
+	struct hbl_cn_device *hdev = aux_dev->priv;
+	struct hbl_cn_port *cn_port;
+
+	cn_port = &hdev->cn_ports[port];
+
+	if (cmd > HBL_CN_STATUS_PERIODIC_STOP) {
+		dev_err(hdev->dev, "Received invalid CN status cmd (%d) from F/W, port %d", cmd,
+			port);
+		return -EINVAL;
+	}
+
+	hdev->status_cmd = cmd;
+	hdev->status_period = (cmd == HBL_CN_STATUS_PERIODIC_START) ? period : 0;
+
+	if (cmd == HBL_CN_STATUS_PERIODIC_STOP)
+		cancel_delayed_work_sync(&cn_port->fw_status_work);
+	else
+		queue_delayed_work(cn_port->wq, &cn_port->fw_status_work, 0);
+
+	return 0;
+}
+
+static void hbl_cn_get_cpucp_info(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	aux_ops->get_cpucp_info(aux_dev, hdev->cpucp_info);
+}
+
+static int hbl_cn_ports_reopen(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_device *hdev = aux_dev->priv;
+	int rc;
+
+	/* update CPUCP info after device reset */
+	hbl_cn_get_cpucp_info(hdev);
+
+	rc = hbl_cn_request_irqs(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to request IRQs\n");
+		return rc;
+	}
+
+	rc = __hbl_cn_ports_reopen(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to reopen ports\n");
+		goto free_irqs;
+	}
+
+	return 0;
+
+free_irqs:
+	hbl_cn_free_irqs(hdev);
+
+	return rc;
+}
+
+static void hbl_cn_stop(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_device *hdev = aux_dev->priv;
+
+	__hbl_cn_stop(hdev);
+
+	hbl_cn_synchronize_irqs(aux_dev);
+	hbl_cn_free_irqs(hdev);
+}
+
+static int hbl_cn_set_static_properties(struct hbl_cn_device *hdev)
+{
+	return hdev->asic_funcs->set_static_properties(hdev);
+}
+
+static int hbl_cn_set_dram_properties(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->set_dram_properties(hdev);
+}
+
+static int hbl_cn_set_asic_funcs(struct hbl_cn_device *hdev)
+{
+	switch (hdev->asic_type) {
+	case HBL_ASIC_GAUDI2:
+	default:
+		dev_err(hdev->dev, "Unrecognized ASIC type %d\n", hdev->asic_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int hbl_cn_dev_init(struct hbl_cn_device *hdev)
+{
+	int rc;
+
+	if (!hdev->ports_mask) {
+		dev_err(hdev->dev, "All ports are disabled\n");
+		return -EINVAL;
+	}
+
+	/* must be called first to init the ASIC funcs */
+	rc = hbl_cn_set_asic_funcs(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "failed to set ASIC aux ops\n");
+		return rc;
+	}
+
+	/* get CPUCP info before initializing the device */
+	hbl_cn_get_cpucp_info(hdev);
+
+	/* init static cn properties */
+	rc = hbl_cn_set_static_properties(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to set static properties\n");
+		return rc;
+	}
+
+	/* init DRAM cn properties */
+	rc = hbl_cn_set_dram_properties(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "failed to set DRAM properties\n");
+		return rc;
+	}
+
+	rc = hbl_cn_sw_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "SW init failed\n");
+		return rc;
+	}
+
+	rc = hbl_cn_request_irqs(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to request IRQs\n");
+		goto request_irqs_fail;
+	}
+
+	rc = hbl_cn_kernel_ctx_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init kernel context\n");
+		goto kernel_ctx_init_fail;
+	}
+
+	rc = hbl_cn_core_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init core\n");
+		goto core_init_fail;
+	}
+
+	rc = hbl_cn_internal_ports_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init internal ports\n");
+		goto internal_ports_init_fail;
+	}
+
+	rc = wq_arrays_pool_alloc(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init WQ arrays pool\n");
+		goto wq_arrays_pool_alloc_fail;
+	}
+
+	hbl_cn_mem_init(hdev);
+
+	hdev->operational = true;
+
+	rc = hbl_cn_en_aux_drv_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init Ethernet driver\n");
+		goto en_aux_drv_fail;
+	}
+
+	rc = hbl_cn_ib_aux_drv_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init IB driver\n");
+		goto ib_aux_drv_fail;
+	}
+
+	hbl_cn_late_init(hdev);
+
+	hdev->is_initialized = true;
+
+	return 0;
+
+ib_aux_drv_fail:
+	hbl_cn_en_aux_drv_fini(hdev);
+en_aux_drv_fail:
+	hdev->operational = false;
+	hbl_cn_mem_fini(hdev);
+	wq_arrays_pool_destroy(hdev);
+wq_arrays_pool_alloc_fail:
+	hbl_cn_internal_ports_fini(hdev);
+internal_ports_init_fail:
+	hbl_cn_core_fini(hdev);
+core_init_fail:
+	hbl_cn_kernel_ctx_fini(hdev);
+kernel_ctx_init_fail:
+	hbl_cn_free_irqs(hdev);
+request_irqs_fail:
+	hbl_cn_sw_fini(hdev);
+
+	return rc;
+}
+
+void hbl_cn_dev_fini(struct hbl_cn_device *hdev)
+{
+	if (!hdev->is_initialized)
+		return;
+
+	hdev->is_initialized = false;
+
+	if (hdev->hw_stop_during_teardown) {
+		hbl_cn_hard_reset_prepare(hdev->cn_aux_dev, false, true);
+		hbl_cn_stop(hdev->cn_aux_dev);
+	}
+
+	hbl_cn_late_fini(hdev);
+
+	hbl_cn_ib_aux_drv_fini(hdev);
+	/* must be called after MSI was disabled */
+	hbl_cn_en_aux_drv_fini(hdev);
+	hbl_cn_mem_fini(hdev);
+	wq_arrays_pool_destroy(hdev);
+	hbl_cn_sw_fini(hdev);
+}
+
+static int hbl_cn_cmd_port_check(struct hbl_cn_device *hdev, u32 port, u32 flags)
+{
+	bool check_open = flags & NIC_PORT_CHECK_OPEN,
+		check_enable = (flags & NIC_PORT_CHECK_ENABLE) || check_open,
+		print_on_err = flags & NIC_PORT_PRINT_ON_ERR;
+	struct hbl_cn_port *cn_port;
+
+	if (port >= hdev->cn_props.max_num_of_ports) {
+		if (print_on_err)
+			dev_dbg(hdev->dev, "Invalid port %d\n", port);
+		return -EINVAL;
+	}
+
+	if (check_enable && !(hdev->ports_mask & BIT(port))) {
+		if (print_on_err)
+			dev_dbg(hdev->dev, "Port %d is disabled\n", port);
+		return -ENODEV;
+	}
+
+	cn_port = &hdev->cn_ports[port];
+
+	if (check_open && !hbl_cn_is_port_open(cn_port)) {
+		if (print_on_err)
+			dev_dbg(hdev->dev, "Port %d is closed\n", port);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void hbl_cn_get_qp_id_range(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->port_funcs->get_qp_id_range(cn_port, min_id, max_id);
+
+	/* Take the minimum between the max id supported by the port and the max id supported by
+	 * the WQs number the user asked to allocate.
+	 */
+	*max_id = min(cn_port->qp_idx_offset + cn_port->num_of_wqs - 1, *max_id);
+}
+
+static void hbl_cn_qp_do_release(struct hbl_cn_qp *qp)
+{
+	struct hbl_cn_qpc_drain_attr drain_attr = { .wait_for_idle = false, };
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+
+	if (IS_ERR_OR_NULL(qp))
+		return;
+
+	cn_port = qp->cn_port;
+	port_funcs = cn_port->hdev->asic_funcs->port_funcs;
+
+	cancel_delayed_work(&qp->adaptive_tmr_reset);
+
+	port_funcs->qp_pre_destroy(qp);
+
+	/* QP was found before, hence use xa_store to replace the pointer but don't release index.
+	 * xa_store should not fail in such scenario.
+	 */
+	xa_store(&qp->cn_port->qp_ids, qp->qp_id, NULL, GFP_KERNEL);
+
+	/* drain the Req QP now in order to make sure that accesses to the WQ will not
+	 * be performed from this point on.
+	 * Waiting for the WQ to drain is performed in the reset work
+	 */
+	hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_SQD, &drain_attr);
+
+	queue_work(cn_port->qp_wq, &qp->async_work);
+}
+
+static void qp_adaptive_tmr_reset(struct work_struct *work)
+{
+	struct hbl_cn_qp *qp = container_of(work, struct hbl_cn_qp, adaptive_tmr_reset.work);
+	struct hbl_cn_port *cn_port = qp->cn_port;
+	struct hbl_cn_device *hdev;
+
+	hdev = cn_port->hdev;
+
+	hdev->asic_funcs->port_funcs->adaptive_tmr_reset(qp);
+}
+
+static int alloc_qp(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx,
+		    struct hbl_cni_alloc_conn_in *in, struct hbl_cni_alloc_conn_out *out)
+{
+	struct hbl_cn_wq_array_properties *swq_arr_props, *rwq_arr_props;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	struct xa_limit id_limit;
+	u32 min_id, max_id, port;
+	struct hbl_cn_qp *qp;
+	int id, rc;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	qp = kzalloc(sizeof(*qp), GFP_KERNEL);
+	if (!qp)
+		return -ENOMEM;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	cn_port = &hdev->cn_ports[port];
+	qp->cn_port = cn_port;
+	qp->port = port;
+	qp->ctx = ctx;
+	qp->curr_state = CN_QP_STATE_RESET;
+	INIT_WORK(&qp->async_work, qp_destroy_work);
+	INIT_DELAYED_WORK(&qp->adaptive_tmr_reset, qp_adaptive_tmr_reset);
+
+	hbl_cn_get_qp_id_range(cn_port, &min_id, &max_id);
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to allocate QP, set_app_params wasn't called yet, port %d\n", port);
+		rc = -EPERM;
+		goto error_exit;
+	}
+
+	swq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_SEND];
+	rwq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_RECV];
+
+	if (!swq_arr_props->enabled || !rwq_arr_props->enabled) {
+		dev_dbg(hdev->dev, "Failed to allocate QP as WQs are not configured, port %d\n",
+			port);
+		rc = -EPERM;
+		goto error_exit;
+	}
+
+	if (swq_arr_props->under_unset || rwq_arr_props->under_unset) {
+		dev_dbg(hdev->dev, "Failed to allocate QP as WQs are under unset, port %d\n", port);
+		rc = -EPERM;
+		goto error_exit;
+	}
+
+	id_limit = XA_LIMIT(min_id, max_id);
+	rc = xa_alloc(&cn_port->qp_ids, &id, qp, id_limit, GFP_KERNEL);
+	if (rc) {
+		dev_dbg(hdev->dev, "Failed allocate QP IDR entry, port %d", port);
+		goto error_exit;
+	}
+
+	qp->qp_id = id;
+
+	rc = port_funcs->register_qp(cn_port, id, ctx->asid);
+	if (rc) {
+		dev_dbg(hdev->dev, "Failed to register QP %d, port %d\n", id, port);
+		goto qp_register_error;
+	}
+
+	atomic_inc(&cn_port->num_of_allocated_qps);
+
+	port_funcs->cfg_unlock(cn_port);
+
+	out->conn_id = id;
+
+	return 0;
+
+qp_register_error:
+	xa_erase(&qp->cn_port->qp_ids, qp->qp_id);
+error_exit:
+	port_funcs->cfg_unlock(cn_port);
+	kfree(qp);
+	return rc;
+}
+
+u32 hbl_cn_get_wq_array_type(bool is_send)
+{
+	return is_send ? HBL_CNI_USER_WQ_SEND : HBL_CNI_USER_WQ_RECV;
+}
+
+static int alloc_and_map_wq(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, u32 n_wq,
+			    bool is_swq)
+{
+	u32 wq_arr_type, wqe_size, qp_idx_offset, wq_idx;
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_mem_data mem_data = {};
+	struct hbl_cn_properties *cn_props;
+	struct hbl_cn_device *hdev;
+	struct hbl_cn_mem_buf *buf;
+	u64 wq_arr_size, wq_size;
+	int rc;
+
+	hdev = cn_port->hdev;
+	cn_props = &hdev->cn_props;
+	qp_idx_offset = cn_port->qp_idx_offset;
+	wq_idx = qp->qp_id - qp_idx_offset;
+
+	wq_arr_type = hbl_cn_get_wq_array_type(is_swq);
+	wq_arr_props = &cn_port->wq_arr_props[wq_arr_type];
+	wqe_size = is_swq ? cn_port->swqe_size : cn_props->rwqe_size;
+
+	if (wq_arr_props->dva_base) {
+		mem_data.mem_id = HBL_CN_DRV_MEM_HOST_VIRTUAL;
+		mem_data.size = PAGE_ALIGN(n_wq * wqe_size);
+
+		/* Get offset into device VA block pre-allocated for SWQ.
+		 *
+		 * Note: HW indexes into SWQ array using qp_id.
+		 * In general, it's HW requirement to leave holes in a WQ array if corresponding QP
+		 * indexes are allocated on another WQ array.
+		 */
+		mem_data.device_va = wq_arr_props->dva_base + wq_arr_props->offset +
+				     wq_arr_props->wq_size * wq_idx;
+
+		/* Check for out of range. */
+		if (mem_data.device_va + mem_data.size >
+			wq_arr_props->dva_base + wq_arr_props->dva_size) {
+			dev_dbg(hdev->dev,
+				"Out of range device VA. device_va 0x%llx, size 0x%llx\n",
+				mem_data.device_va, mem_data.size);
+			return -EINVAL;
+		}
+	} else {
+		/* DMA coherent allocate case. Memory for WQ array is already allocated in
+		 * user_wq_arr_set(). Here we use the allocated base addresses and QP id to
+		 * calculate the CPU & bus addresses of the WQ for current QP and return that
+		 * handle to the user. User may mmap() this handle returned by set_req_qp_ctx()
+		 * to write WQEs.
+		 */
+		mem_data.mem_id = HBL_CN_DRV_MEM_HOST_MAP_ONLY;
+
+		buf = hbl_cn_mem_buf_get(hdev, wq_arr_props->handle);
+		if (!buf) {
+			dev_err(hdev->dev, "Failed to retrieve WQ arr handle for port %d\n",
+				cn_port->port);
+			return -EINVAL;
+		}
+
+		/* Actual size to allocate. Page aligned since we mmap to user. */
+		mem_data.size = PAGE_ALIGN(n_wq * wqe_size);
+		wq_size = wq_arr_props->wq_size;
+		wq_arr_size = buf->mappable_size;
+
+		 /* Get offset into kernel buffer block pre-allocated for SWQ. */
+		mem_data.in.host_map_data.kernel_address = buf->kernel_address +
+							   wq_arr_props->offset + wq_size * wq_idx;
+
+		mem_data.in.host_map_data.bus_address = buf->bus_address + wq_arr_props->offset +
+							wq_size * wq_idx;
+
+		/* Check for out of range. */
+		if ((u64)mem_data.in.host_map_data.kernel_address + mem_data.size >
+		    (u64)buf->kernel_address + wq_arr_size) {
+			dev_dbg(hdev->dev,
+				"Out of range kernel addr. kernel addr 0x%p, size 0x%llx\n",
+				mem_data.in.host_map_data.kernel_address, mem_data.size);
+			return -EINVAL;
+		}
+	}
+
+	/* Allocate host vmalloc memory and map its physical pages to PMMU. */
+	rc = hbl_cn_mem_alloc(qp->ctx, &mem_data);
+	if (rc) {
+		dev_dbg(hdev->dev, "Failed to allocate %s. Port %d, QP %d\n",
+			is_swq ? "SWQ" : "RWQ", cn_port->port, qp->qp_id);
+		return rc;
+	}
+
+	/* Retrieve mmap handle. */
+	if (is_swq) {
+		qp->swq_handle = mem_data.handle;
+		qp->swq_size = mem_data.size;
+	} else {
+		qp->rwq_handle = mem_data.handle;
+		qp->rwq_size = mem_data.size;
+	}
+
+	return 0;
+}
+
+static int set_req_qp_ctx(struct hbl_cn_device *hdev, struct hbl_cni_req_conn_ctx_in *in,
+			  struct hbl_cni_req_conn_ctx_out *out)
+{
+	struct hbl_cn_wq_array_properties *swq_arr_props, *rwq_arr_props;
+	struct hbl_cn_encap_xarray_pdata *encap_data;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 wq_size, port, max_wq_size;
+	struct hbl_cn_port *cn_port;
+	struct hbl_cn_qp *qp;
+	int rc;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	asic_funcs = hdev->asic_funcs;
+	port_funcs = asic_funcs->port_funcs;
+	cn_port = &hdev->cn_ports[port];
+
+	if (in->timer_granularity > NIC_TMR_TIMEOUT_MAX_GRAN) {
+		dev_err(hdev->dev,
+			"timer granularity %d is not supported\n", in->timer_granularity);
+		return -EINVAL;
+	}
+
+	if (!in->timer_granularity && !hbl_cn_is_ibdev_opened(hdev))
+		in->timer_granularity = NIC_TMR_TIMEOUT_DEFAULT_GRAN;
+
+	port_funcs->cfg_lock(cn_port);
+	qp = xa_load(&cn_port->qp_ids, in->conn_id);
+
+	if (IS_ERR_OR_NULL(qp)) {
+		dev_dbg(hdev->dev, "Failed to find matching QP for handle %d, port %d\n",
+			in->conn_id, port);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	/* sanity test the port IDs */
+	if (qp->port != port) {
+		dev_dbg(hdev->dev, "QP port %d does not match requested port %d\n", qp->port, port);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	if (in->encap_en) {
+		encap_data = xa_load(&cn_port->encap_ids, in->encap_id);
+		if (!encap_data) {
+			dev_dbg_ratelimited(hdev->dev,
+					    "Encapsulation ID %d not found, ignoring\n",
+					    in->encap_id);
+			in->encap_en = 0;
+			in->encap_id = 0;
+		}
+	}
+
+	if (qp->is_req) {
+		dev_dbg(hdev->dev, "Port %d, QP %d - Requester QP is already set\n", port,
+			qp->qp_id);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	wq_size = in->wq_size;
+
+	/* verify that size does not exceed wq_array size */
+	max_wq_size = cn_port->num_of_wq_entries;
+
+	if (wq_size > max_wq_size) {
+		dev_dbg(hdev->dev,
+			"Port %d, Requester QP %d - requested size (%d) > max size (%d)\n", port,
+			qp->qp_id, wq_size, max_wq_size);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	swq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_SEND];
+	rwq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_RECV];
+
+	if (!swq_arr_props->on_device_mem) {
+		rc = alloc_and_map_wq(cn_port, qp, wq_size, true);
+		if (rc)
+			goto cfg_unlock;
+
+		out->swq_mem_handle = qp->swq_handle;
+		out->swq_mem_size = qp->swq_size;
+	}
+
+	if (!rwq_arr_props->on_device_mem) {
+		rc = alloc_and_map_wq(cn_port, qp, wq_size, false);
+		if (rc)
+			goto err_free_swq;
+
+		out->rwq_mem_handle = qp->rwq_handle;
+		out->rwq_mem_size = qp->rwq_size;
+	}
+
+	qp->remote_key = in->remote_key;
+
+	rc = hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_RTS, in);
+	if (rc)
+		goto err_free_rwq;
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+
+err_free_rwq:
+	if (qp->rwq_handle) {
+		hbl_cn_mem_destroy(hdev, qp->rwq_handle);
+		qp->rwq_handle = 0;
+		out->rwq_mem_handle = qp->rwq_handle;
+		if (!rwq_arr_props->dva_base) {
+			int ret;
+
+			ret = hbl_cn_mem_buf_put_handle(hdev, rwq_arr_props->handle);
+			if (ret == 1)
+				rwq_arr_props->handle = 0;
+		}
+	}
+err_free_swq:
+	if (qp->swq_handle) {
+		hbl_cn_mem_destroy(hdev, qp->swq_handle);
+		qp->swq_handle = 0;
+		out->swq_mem_handle = qp->swq_handle;
+		if (!swq_arr_props->dva_base) {
+			int ret;
+
+			ret = hbl_cn_mem_buf_put_handle(hdev, swq_arr_props->handle);
+			if (ret == 1)
+				swq_arr_props->handle = 0;
+		}
+	}
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int set_res_qp_ctx(struct hbl_cn_device *hdev, struct hbl_cni_res_conn_ctx_in *in)
+{
+	struct hbl_cn_encap_xarray_pdata *encap_data;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+	struct hbl_cn_qp *qp;
+	u32 port;
+	int rc;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	asic_funcs = hdev->asic_funcs;
+	port_funcs = asic_funcs->port_funcs;
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs->cfg_lock(cn_port);
+	qp = xa_load(&cn_port->qp_ids, in->conn_id);
+
+	if (IS_ERR_OR_NULL(qp)) {
+		dev_dbg(hdev->dev, "Failed to find matching QP for handle %d, port %d\n",
+			in->conn_id, port);
+		rc = -EINVAL;
+		goto unlock_cfg;
+	}
+
+	if (in->encap_en) {
+		encap_data = xa_load(&cn_port->encap_ids, in->encap_id);
+		if (!encap_data) {
+			dev_dbg_ratelimited(hdev->dev,
+					    "Encapsulation ID %d not found, ignoring\n",
+					    in->encap_id);
+			in->encap_en = 0;
+			in->encap_id = 0;
+		}
+	}
+
+	if (qp->is_res) {
+		dev_dbg(hdev->dev, "Port %d, QP %d - Responder QP is already set\n", port,
+			qp->qp_id);
+		rc = -EINVAL;
+		goto unlock_cfg;
+	}
+
+	/* sanity test the port IDs */
+	if (qp->port != port) {
+		dev_dbg(hdev->dev, "QP port %d does not match requested port %d\n", qp->port, port);
+		rc = -EINVAL;
+		goto unlock_cfg;
+	}
+
+	qp->local_key = in->local_key;
+
+	if (qp->curr_state == CN_QP_STATE_RESET) {
+		rc = hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_INIT, NULL);
+		if (rc)
+			goto unlock_cfg;
+	}
+
+	/* all is well, we are ready to receive */
+	rc = hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_RTR, in);
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+
+unlock_cfg:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+/* must be called under the port cfg lock */
+u32 hbl_cn_get_max_qp_id(struct hbl_cn_port *cn_port)
+{
+	int max_qp_id = cn_port->qp_idx_offset;
+	unsigned long qp_id = 0;
+	struct hbl_cn_qp *qp;
+
+	xa_for_each(&cn_port->qp_ids, qp_id, qp)
+		if (qp->qp_id > max_qp_id)
+			max_qp_id = qp->qp_id;
+
+	return max_qp_id;
+}
+
+static void qp_destroy_work(struct work_struct *work)
+{
+	struct hbl_cn_qp *qp = container_of(work, struct hbl_cn_qp, async_work);
+	struct hbl_cn_wq_array_properties *swq_arr_props, *rwq_arr_props;
+	struct hbl_cn_port *cn_port = qp->cn_port;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_qpc_drain_attr drain_attr;
+	struct hbl_cn_qpc_reset_attr rst_attr;
+	struct hbl_cn_ctx *ctx = qp->ctx;
+	struct hbl_cn_device *hdev;
+	int rc;
+
+	hdev = cn_port->hdev;
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	if (!hdev->operational) {
+		drain_attr.wait_for_idle = false;
+		rst_attr.reset_mode = hdev->qp_reset_mode;
+	} else {
+		drain_attr.wait_for_idle = true;
+		rst_attr.reset_mode = CN_QP_RESET_MODE_GRACEFUL;
+	}
+
+	/* Complete the wait for SQ to drain. To allow parallel QPs destruction, don't take the cfg
+	 * lock here. This is safe because SQD->SQD QP transition is a simple wait to drain the QP
+	 * without any access to the HW.
+	 */
+	if (qp->curr_state == CN_QP_STATE_SQD)
+		hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_SQD, &drain_attr);
+
+	port_funcs->cfg_lock(cn_port);
+
+	hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_RESET, &rst_attr);
+
+	port_funcs->unregister_qp(cn_port, qp->qp_id);
+
+	swq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_SEND];
+	rwq_arr_props = &cn_port->wq_arr_props[HBL_CNI_USER_WQ_RECV];
+
+	if (qp->swq_handle) {
+		hbl_cn_mem_destroy(hdev, qp->swq_handle);
+		qp->swq_handle = 0;
+		if (!swq_arr_props->dva_base) {
+			rc = hbl_cn_mem_buf_put_handle(hdev, swq_arr_props->handle);
+			if (rc == 1)
+				swq_arr_props->handle = 0;
+		}
+	}
+
+	if (qp->rwq_handle) {
+		hbl_cn_mem_destroy(hdev, qp->rwq_handle);
+		qp->rwq_handle = 0;
+		if (!rwq_arr_props->dva_base) {
+			rc = hbl_cn_mem_buf_put_handle(hdev, rwq_arr_props->handle);
+			if (rc == 1)
+				rwq_arr_props->handle = 0;
+		}
+	}
+
+	xa_erase(&cn_port->qp_ids, qp->qp_id);
+
+	if (atomic_dec_and_test(&cn_port->num_of_allocated_qps)) {
+		if (swq_arr_props->under_unset)
+			__user_wq_arr_unset(ctx, cn_port, HBL_CNI_USER_WQ_SEND);
+
+		if (rwq_arr_props->under_unset)
+			__user_wq_arr_unset(ctx, cn_port, HBL_CNI_USER_WQ_RECV);
+	}
+
+	if (qp->req_user_cq)
+		hbl_cn_user_cq_put(qp->req_user_cq);
+
+	if (qp->res_user_cq)
+		hbl_cn_user_cq_put(qp->res_user_cq);
+
+	port_funcs->qp_post_destroy(qp);
+
+	/* hbl_cn_mem_destroy should be included inside lock not due to protection.
+	 * The handles (swq_handle and rwq_handle) are created based on QP id.
+	 * Lock is to avoid concurrent memory access from a new handle created before freeing
+	 * memory.
+	 */
+	port_funcs->cfg_unlock(cn_port);
+
+	kfree(qp);
+}
+
+static void qps_drain_async_work(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	int i, num_gen_qps;
+
+	/* wait for the workers to complete */
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		drain_workqueue(cn_port->qp_wq);
+
+		num_gen_qps = atomic_read(&cn_port->num_of_allocated_qps);
+		if (num_gen_qps)
+			dev_warn(hdev->dev, "Port %d still has %d QPs alive\n", i, num_gen_qps);
+	}
+}
+
+static inline int __must_check PTR_ERR_OR_EINVAL(__force const void *ptr)
+{
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+	else
+		return -EINVAL;
+}
+
+static int destroy_qp(struct hbl_cn_device *hdev, struct hbl_cni_destroy_conn_in *in)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+	struct hbl_cn_qp *qp;
+	u32 port, flags;
+	int rc;
+
+	port = in->port;
+
+	if (port >= hdev->cn_props.max_num_of_ports) {
+		dev_dbg(hdev->dev, "Invalid port %d\n", port);
+		return -EINVAL;
+	}
+
+	cn_port = &hdev->cn_ports[port];
+
+	/* in case of destroying QPs of external ports, the port may be already closed by a user
+	 * issuing "ip link set down" command so we only check if the port is enabled in these
+	 * ports.
+	 */
+	flags = cn_port->eth_enable ? NIC_PORT_CHECK_ENABLE : NIC_PORT_CHECK_OPEN;
+	flags |= NIC_PORT_PRINT_ON_ERR;
+	rc = hbl_cn_cmd_port_check(hdev, port, flags);
+	if (rc)
+		return rc;
+
+	asic_funcs = hdev->asic_funcs;
+	port_funcs = asic_funcs->port_funcs;
+
+	/* prevent reentrancy by locking the whole process of destroy_qp */
+	port_funcs->cfg_lock(cn_port);
+	qp = xa_load(&cn_port->qp_ids, in->conn_id);
+
+	if (IS_ERR_OR_NULL(qp)) {
+		rc = PTR_ERR_OR_EINVAL(qp);
+		goto out_err;
+	}
+
+	hbl_cn_qp_do_release(qp);
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+
+out_err:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static void hbl_cn_qps_stop(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = cn_port->hdev->asic_funcs->port_funcs;
+	struct hbl_cn_qpc_drain_attr drain = { .wait_for_idle = false, };
+	unsigned long qp_id = 0;
+	struct hbl_cn_qp *qp;
+
+	port_funcs->cfg_lock(cn_port);
+
+	xa_for_each(&cn_port->qp_ids, qp_id, qp) {
+		if (IS_ERR_OR_NULL(qp))
+			continue;
+
+		hbl_cn_qp_modify(cn_port, qp, CN_QP_STATE_QPD, (void *)&drain);
+	}
+
+	port_funcs->cfg_unlock(cn_port);
+}
+
+static void qps_stop(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	int i;
+
+	/* stop the QPs */
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		hbl_cn_qps_stop(cn_port);
+	}
+}
+
+static int user_wq_arr_set(struct hbl_cn_device *hdev, struct hbl_cni_user_wq_arr_set_in *in,
+			   struct hbl_cni_user_wq_arr_set_out *out, struct hbl_cn_ctx *ctx)
+{
+	u32 port, type, num_of_wqs, num_of_wq_entries, min_wqs_per_port, mem_id;
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_properties *cn_props;
+	struct hbl_cn_port *cn_port;
+	char *type_str;
+	int rc;
+
+	if (in->swq_granularity > HBL_CNI_SWQE_GRAN_64B) {
+		dev_dbg(hdev->dev, "Invalid send WQE granularity %d\n", in->swq_granularity);
+		return -EINVAL;
+	}
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+	cn_props = &hdev->cn_props;
+
+	type = in->type;
+
+	if (type > cn_props->max_wq_arr_type) {
+		dev_dbg(hdev->dev, "invalid type %d, can't set user WQ\n", type);
+		return -EINVAL;
+	}
+
+	mem_id = in->mem_id;
+
+	if (mem_id != HBL_CNI_MEM_HOST && mem_id != HBL_CNI_MEM_DEVICE) {
+		dev_dbg(hdev->dev, "invalid memory type %d for user WQ\n", mem_id);
+		return -EINVAL;
+	}
+
+	port = in->port;
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	wq_arr_props = &cn_port->wq_arr_props[type];
+	type_str = wq_arr_props->type_str;
+
+	/* For generic WQs minimum number of wqs required is 2, one for raw eth and one for rdma */
+	min_wqs_per_port = NIC_MIN_WQS_PER_PORT;
+	if (in->num_of_wqs < min_wqs_per_port) {
+		dev_dbg(hdev->dev, "number of %s WQs must be minimum %d, port %d\n", type_str,
+			min_wqs_per_port, port);
+		return -EINVAL;
+	}
+
+	/* H/W limitation */
+	if (in->num_of_wqs > cn_props->max_hw_qps_num) {
+		dev_dbg(hdev->dev, "number of %s WQs (0x%x) can't be bigger than 0x%x, port %d\n",
+			type_str, in->num_of_wqs, cn_props->max_hw_qps_num, port);
+		return -EINVAL;
+	}
+
+	if (!is_power_of_2(in->num_of_wq_entries)) {
+		dev_dbg(hdev->dev,
+			"number of %s WQ entries (0x%x) must be a power of 2, port %d\n", type_str,
+			in->num_of_wq_entries, port);
+		return -EINVAL;
+	}
+
+	/* H/W limitation */
+	if (in->num_of_wq_entries < cn_props->min_hw_user_wqs_num) {
+		dev_dbg(hdev->dev,
+			"number of %s WQ entries (0x%x) must be at least %d, port %d\n", type_str,
+			in->num_of_wq_entries, cn_props->min_hw_user_wqs_num, port);
+		return -EINVAL;
+	}
+
+	/* H/W limitation */
+	if (in->num_of_wq_entries > cn_props->max_hw_user_wqs_num) {
+		dev_dbg(hdev->dev,
+			"number of %s WQ entries (0x%x) can't be bigger than 0x%x, port %d\n",
+			type_str, in->num_of_wq_entries, cn_props->max_hw_user_wqs_num, port);
+		return -EINVAL;
+	}
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to set %s WQ array, set_app_params wasn't called yet, port %d\n",
+			type_str, port);
+		rc = -EPERM;
+		goto out;
+	}
+
+	/* we first check the wq_under_unset condition since a prev WQ unset (async) operation may
+	 * still be in progress, and since in such cases we would like to return -EAGAIN to the
+	 * caller and not -EINVAL
+	 */
+	if (wq_arr_props->enabled && wq_arr_props->under_unset) {
+		dev_dbg_ratelimited(hdev->dev,
+				    "Retry to set %s WQ array as it is under unset, port %d\n",
+				    type_str, port);
+		rc = -EAGAIN;
+		goto out;
+	}
+
+	if (wq_arr_props->enabled) {
+		dev_dbg(hdev->dev, "%s WQ array is already enabled, port %d\n", type_str, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (wq_arr_props->under_unset) {
+		dev_dbg(hdev->dev,
+			"Failed to set %s WQ array as it is not enabled and under unset, port %d\n",
+			type_str, port);
+		rc = -EPERM;
+		goto out;
+	}
+
+	num_of_wq_entries = cn_port->num_of_wq_entries;
+	num_of_wqs = cn_port->num_of_wqs;
+
+	if (num_of_wq_entries && num_of_wq_entries != in->num_of_wq_entries) {
+		dev_dbg(hdev->dev, "%s WQ number of entries (0x%x) should be 0x%x, port %d\n",
+			type_str, in->num_of_wq_entries, num_of_wq_entries, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (num_of_wqs && num_of_wqs != in->num_of_wqs) {
+		dev_dbg(hdev->dev, "%s WQs number (0x%x) should be 0x%x, port %d\n",
+			type_str, in->num_of_wqs, num_of_wqs, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = hdev->asic_funcs->user_wq_arr_set(hdev, in, out, ctx);
+	if (rc) {
+		dev_err(hdev->dev, "%s WQ array set failed, port %d, err %d\n", type_str, port, rc);
+		goto out;
+	}
+
+	cn_port->num_of_wq_entries = in->num_of_wq_entries;
+	cn_port->num_of_wqs = in->num_of_wqs;
+
+	wq_arr_props->enabled = true;
+
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int __user_wq_arr_unset(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_device *hdev;
+	char *type_str;
+	u32 port;
+	int rc;
+
+	hdev = ctx->hdev;
+	wq_arr_props = &cn_port->wq_arr_props[type];
+	type_str = wq_arr_props->type_str;
+	port = cn_port->port;
+
+	rc = hdev->asic_funcs->port_funcs->user_wq_arr_unset(ctx, cn_port, type);
+	if (rc)
+		dev_err(hdev->dev, "%s WQ array unset failed, port %d, err %d\n", type_str, port,
+			rc);
+
+	wq_arr_props->enabled = false;
+	wq_arr_props->under_unset = false;
+
+	if (!cn_port->wq_arr_props[HBL_CNI_USER_WQ_SEND].enabled &&
+	    !cn_port->wq_arr_props[HBL_CNI_USER_WQ_RECV].enabled) {
+		cn_port->num_of_wq_entries = 0;
+		cn_port->num_of_wqs = 0;
+	}
+
+	return rc;
+}
+
+static int user_wq_arr_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_wq_arr_unset_in *in,
+			     struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_properties *cn_props;
+	struct hbl_cn_port *cn_port;
+	u32 port, type;
+	char *type_str;
+	int rc;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+	cn_props = &hdev->cn_props;
+
+	type = in->type;
+
+	if (type > cn_props->max_wq_arr_type) {
+		dev_dbg(hdev->dev, "invalid type %d, can't unset user WQ\n", type);
+		return -EINVAL;
+	}
+
+	port = in->port;
+
+	/* No need to check if the port is open because internal ports are always open and external
+	 * ports might be closed by a user command e.g. "ip link set down" after a WQ was
+	 * configured, but we still want to unset it.
+	 */
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_ENABLE | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	wq_arr_props = &cn_port->wq_arr_props[type];
+	type_str = wq_arr_props->type_str;
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!wq_arr_props->enabled) {
+		dev_dbg(hdev->dev, "%s WQ array is disabled, port %d\n", type_str, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (wq_arr_props->under_unset) {
+		dev_dbg(hdev->dev, "%s WQ array is already under unset, port %d\n", type_str, port);
+		rc = -EPERM;
+		goto out;
+	}
+
+	/* Allocated QPs might still use the WQ, hence unset the WQ once they are destroyed */
+	if (atomic_read(&cn_port->num_of_allocated_qps)) {
+		wq_arr_props->under_unset = true;
+		rc = 0;
+		goto out;
+	}
+
+	rc = __user_wq_arr_unset(ctx, cn_port, type);
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int alloc_user_cq_id(struct hbl_cn_device *hdev, struct hbl_cni_alloc_user_cq_id_in *in,
+			    struct hbl_cni_alloc_user_cq_id_out *out, struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_properties *cn_props = &hdev->cn_props;
+	u32 min_id, max_id, port, flags;
+	struct hbl_cn_user_cq *user_cq;
+	struct hbl_cn_port *cn_port;
+	struct xa_limit id_limit;
+	int id, rc;
+
+	port = in->port;
+	flags = NIC_PORT_PRINT_ON_ERR;
+
+	if (!cn_props->force_cq)
+		flags |= NIC_PORT_CHECK_OPEN;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, flags);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	user_cq = kzalloc(sizeof(*user_cq), GFP_KERNEL);
+	if (!user_cq)
+		return -ENOMEM;
+
+	user_cq->state = USER_CQ_STATE_ALLOC;
+	user_cq->ctx = ctx;
+	user_cq->cn_port = cn_port;
+	kref_init(&user_cq->refcount);
+
+	port_funcs->get_cq_id_range(cn_port, &min_id, &max_id);
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to allocate a CQ ID, set_app_params wasn't called yet, port %d\n",
+			port);
+		rc = -EPERM;
+		goto cfg_unlock;
+	}
+
+	id_limit = XA_LIMIT(min_id, max_id);
+	rc = xa_alloc(&cn_port->cq_ids, &id, user_cq, id_limit, GFP_KERNEL);
+	if (rc) {
+		dev_err(hdev->dev, "No available user CQ, port %d\n", port);
+		goto cfg_unlock;
+	}
+
+	user_cq->id = id;
+
+	mutex_init(&user_cq->overrun_lock);
+
+	port_funcs->cfg_unlock(cn_port);
+
+	dev_dbg(hdev->dev, "Allocating CQ id %d in port %d", id, port);
+
+	out->id = id;
+
+	return 0;
+
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+	kfree(user_cq);
+
+	return rc;
+}
+
+static bool validate_cq_id_range(struct hbl_cn_port *cn_port, u32 cq_id)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	u32 min_id, max_id;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->get_cq_id_range(cn_port, &min_id, &max_id);
+
+	return (cq_id >= min_id) && (cq_id <= max_id);
+}
+
+static int __user_cq_set(struct hbl_cn_device *hdev, struct hbl_cni_user_cq_set_in_params *in,
+			 struct hbl_cni_user_cq_set_out_params *out)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_properties *cn_props = &hdev->cn_props;
+	struct hbl_cn_user_cq *user_cq;
+	struct hbl_cn_port *cn_port;
+	u32 port, flags, id;
+	int rc;
+
+	id = in->id;
+	port = in->port;
+
+	flags = NIC_PORT_PRINT_ON_ERR;
+
+	if (!cn_props->force_cq)
+		flags |= NIC_PORT_CHECK_OPEN;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, flags);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	if (!validate_cq_id_range(cn_port, id)) {
+		dev_dbg(hdev->dev, "user CQ %d is invalid, port %d\n", id, port);
+		return -EINVAL;
+	}
+
+	if (in->num_of_cqes < cn_props->user_cq_min_entries) {
+		dev_dbg(hdev->dev,
+			"user CQ %d buffer length must be at least 0x%x entries, port %d\n",
+			id, cn_props->user_cq_min_entries, port);
+		return -EINVAL;
+	}
+
+	if (!is_power_of_2(in->num_of_cqes)) {
+		dev_dbg(hdev->dev, "user CQ %d buffer length must be at power of 2, port %d\n",
+			id, port);
+		return -EINVAL;
+	}
+
+	if (in->num_of_cqes > cn_props->user_cq_max_entries) {
+		dev_dbg(hdev->dev,
+			"user CQ %d buffer length must not be more than 0x%x entries, port %d\n",
+			id, cn_props->user_cq_max_entries, port);
+		return -EINVAL;
+	}
+
+	port_funcs->cfg_lock(cn_port);
+
+	/* Validate if user CQ is allocated. */
+	user_cq = xa_load(&cn_port->cq_ids, id);
+	if (!user_cq) {
+		dev_dbg(hdev->dev, "user CQ %d wasn't allocated, port %d\n", id, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	/* Validate that user CQ is in ALLOC state. */
+	if (user_cq->state != USER_CQ_STATE_ALLOC) {
+		dev_dbg(hdev->dev, "user CQ %d set failed, current state %d, port %d\n",
+			id, user_cq->state, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = port_funcs->user_cq_set(user_cq, in, out);
+	if (rc) {
+		dev_dbg(hdev->dev, "user CQ %d set failed, port %d\n", id, port);
+		goto out;
+	}
+
+	user_cq->state = USER_CQ_STATE_SET;
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int user_cq_id_set(struct hbl_cn_device *hdev, struct hbl_cni_user_cq_id_set_in *in,
+			  struct hbl_cni_user_cq_id_set_out *out)
+{
+	struct hbl_cni_user_cq_set_out_params out2 = {};
+	struct hbl_cni_user_cq_set_in_params in2 = {};
+	int rc;
+
+	in2.port = in->port;
+	in2.num_of_cqes = in->num_of_cqes;
+	in2.id = in->id;
+
+	rc = __user_cq_set(hdev, &in2, &out2);
+	if (rc)
+		return rc;
+
+	out->mem_handle = out2.mem_handle;
+	out->pi_handle = out2.pi_handle;
+	out->regs_handle = out2.regs_handle;
+	out->regs_offset = out2.regs_offset;
+
+	return 0;
+}
+
+static void user_cq_destroy(struct kref *kref)
+{
+	struct hbl_cn_user_cq *user_cq = container_of(kref, struct hbl_cn_user_cq, refcount);
+	struct hbl_cn_port *cn_port = user_cq->cn_port;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	/* Destroy the remaining resources allocated during SET state. The below callback needs to
+	 * be called only if the CQ moved to unset from set state. This is because, this resource
+	 * was created only during set state. If the CQ moved directly to unset from alloc then we
+	 * shouldn't be trying to clear the resource.
+	 */
+	if (user_cq->state == USER_CQ_STATE_SET_TO_UNSET)
+		port_funcs->user_cq_destroy(user_cq);
+
+	mutex_destroy(&user_cq->overrun_lock);
+	xa_erase(&cn_port->cq_ids, user_cq->id);
+	kfree(user_cq);
+}
+
+struct hbl_cn_user_cq *hbl_cn_user_cq_get(struct hbl_cn_port *cn_port, u8 cq_id)
+{
+	struct hbl_cn_user_cq *user_cq;
+
+	user_cq = xa_load(&cn_port->cq_ids, cq_id);
+	if (!user_cq || user_cq->state != USER_CQ_STATE_SET)
+		return NULL;
+
+	kref_get(&user_cq->refcount);
+
+	return user_cq;
+}
+
+int hbl_cn_user_cq_put(struct hbl_cn_user_cq *user_cq)
+{
+	return kref_put(&user_cq->refcount, user_cq_destroy);
+}
+
+static int user_cq_unset_locked(struct hbl_cn_user_cq *user_cq, bool warn_if_alive)
+{
+	struct hbl_cn_port *cn_port = user_cq->cn_port;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	u32 port = cn_port->port, id = user_cq->id;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	int rc = 0, ret;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	/* Call unset only if the CQ has already been SET */
+	if (user_cq->state == USER_CQ_STATE_SET) {
+		rc = port_funcs->user_cq_unset(user_cq);
+		if (rc)
+			dev_dbg(hdev->dev, "user CQ %d unset failed, port %d\n", id, port);
+
+		user_cq->state = USER_CQ_STATE_SET_TO_UNSET;
+	} else {
+		user_cq->state = USER_CQ_STATE_ALLOC_TO_UNSET;
+	}
+
+	/* we'd like to destroy even if the unset callback returned error */
+	ret = hbl_cn_user_cq_put(user_cq);
+
+	if (warn_if_alive && ret != 1)
+		dev_warn(hdev->dev, "user CQ %d was not destroyed, port %d\n", id, port);
+
+	return rc;
+}
+
+static int __user_cq_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_cq_unset_in_params *in)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_properties *cn_props = &hdev->cn_props;
+	struct hbl_cn_user_cq *user_cq;
+	struct hbl_cn_port *cn_port;
+	u32 port, flags, id;
+	int rc;
+
+	port = in->port;
+	id = in->id;
+
+	if (port >= cn_props->max_num_of_ports) {
+		dev_dbg(hdev->dev, "Invalid port %d\n", port);
+		return -EINVAL;
+	}
+
+	cn_port = &hdev->cn_ports[port];
+
+	flags = NIC_PORT_PRINT_ON_ERR;
+
+	/* Unless force_cq flag in enabled, in case of user CQ unset of external ports, the port
+	 * may be already closed by the user, so we only check if the port is enabled.
+	 */
+	if (!cn_props->force_cq)
+		flags |= cn_port->eth_enable ? NIC_PORT_CHECK_ENABLE : NIC_PORT_CHECK_OPEN;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, flags);
+	if (rc)
+		return rc;
+
+	if (!validate_cq_id_range(cn_port, id)) {
+		dev_dbg(hdev->dev, "user CQ %d is invalid, port %d\n", id, port);
+		return -EINVAL;
+	}
+
+	port_funcs->cfg_lock(cn_port);
+
+	/* Validate if user CQ is allocated. */
+	user_cq = xa_load(&cn_port->cq_ids, id);
+	if (!user_cq) {
+		dev_dbg(hdev->dev, "user CQ %d wasn't allocated, port %d\n", id, port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = user_cq_unset_locked(user_cq, false);
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int user_cq_id_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_cq_id_unset_in *in)
+{
+	struct hbl_cni_user_cq_unset_in_params in2 = {};
+
+	in2.port = in->port;
+	in2.id = in->id;
+
+	return __user_cq_unset(hdev, &in2);
+}
+
+static int user_set_app_params(struct hbl_cn_device *hdev,
+			       struct hbl_cni_set_user_app_params_in *in, struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	bool modify_wqe_checkers;
+	u32 port;
+	int rc;
+
+	port_funcs = asic_funcs->port_funcs;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	/* We must take rtnl_lock here prior to taking cfg_lock, as we may land into flow that
+	 * extracts the IP port and that can cause a deadlock in case an operation from the
+	 * net subsystem that requires the cfg_lock is executed at the same time. As such operation
+	 * will first obtain rtnl_lock and then will try to take a cfg_lock, hence a deadlock.
+	 */
+	rtnl_lock();
+	port_funcs->cfg_lock(cn_port);
+
+	rc = asic_funcs->user_set_app_params(hdev, in, &modify_wqe_checkers, ctx);
+	if (rc)
+		goto out;
+
+	if (modify_wqe_checkers) {
+		rc = hdev->asic_funcs->port_funcs->disable_wqe_index_checker(cn_port);
+		if (rc) {
+			dev_err(hdev->dev, "Failed disable wqe index checker, port %d rc %d\n",
+				port, rc);
+			goto out;
+		}
+	}
+
+	cn_port->set_app_params = true;
+
+out:
+	port_funcs->cfg_unlock(cn_port);
+	rtnl_unlock();
+
+	return rc;
+}
+
+static int user_get_app_params(struct hbl_cn_device *hdev,
+			       struct hbl_cni_get_user_app_params_in *in,
+			       struct hbl_cni_get_user_app_params_out *out)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 port;
+	int rc;
+
+	port_funcs = asic_funcs->port_funcs;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs->cfg_lock(cn_port);
+	asic_funcs->user_get_app_params(hdev, in, out);
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+}
+
+static int eq_poll(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx,
+		   struct hbl_cni_eq_poll_in *in, struct hbl_cni_eq_poll_out *out)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 port;
+	int rc;
+
+	port = in->port;
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+	rc = asic_funcs->port_funcs->eq_poll(cn_port, ctx->asid, out);
+	switch (rc) {
+	case 0:
+		out->status = HBL_CNI_EQ_POLL_STATUS_SUCCESS;
+		break;
+	case -EOPNOTSUPP:
+		out->status = HBL_CNI_EQ_POLL_STATUS_ERR_UNSUPPORTED_OP;
+		break;
+	case -EINVAL:
+		out->status = HBL_CNI_EQ_POLL_STATUS_ERR_NO_SUCH_PORT;
+		break;
+	case -ENXIO:
+		out->status = HBL_CNI_EQ_POLL_STATUS_ERR_PORT_DISABLED;
+		break;
+	case -ENODATA:
+		out->status = HBL_CNI_EQ_POLL_STATUS_EQ_EMPTY;
+		break;
+	case -ESRCH:
+		out->status = HBL_CNI_EQ_POLL_STATUS_ERR_NO_SUCH_EQ;
+		break;
+	default:
+		out->status = HBL_CNI_EQ_POLL_STATUS_ERR_UNDEF;
+		break;
+	}
+
+	return 0;
+}
+
+static void get_user_db_fifo_id_range(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id,
+				      u32 id_hint)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+
+	port_funcs = cn_port->hdev->asic_funcs->port_funcs;
+
+	/* id_hint comes from user. Driver enforces allocation of the requested
+	 * db fifo HW resource. i.e. driver fails if requested resource is not
+	 * available. Reason, user stack has hard coded user fifo resource IDs.
+	 */
+	if (id_hint) {
+		*min_id = id_hint;
+		*max_id = id_hint;
+	} else {
+		port_funcs->get_db_fifo_id_range(cn_port, min_id, max_id);
+	}
+}
+
+static int alloc_user_db_fifo(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx,
+			      struct hbl_cni_alloc_user_db_fifo_in *in,
+			      struct hbl_cni_alloc_user_db_fifo_out *out)
+{
+	struct hbl_cn_db_fifo_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	struct xa_limit id_limit;
+	u32 min_id, max_id;
+	int rc, id;
+	u32 port;
+
+	port = in->port;
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	get_user_db_fifo_id_range(cn_port, &min_id, &max_id, in->id_hint);
+
+	/* IDR private data. */
+	xa_pdata = kzalloc(sizeof(*xa_pdata), GFP_KERNEL);
+	if (!xa_pdata)
+		return -ENOMEM;
+
+	xa_pdata->asid = ctx->asid;
+	xa_pdata->state = DB_FIFO_STATE_ALLOC;
+	xa_pdata->port = port;
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to allocate DB FIFO, set_app_params wasn't called yet, port %d\n",
+			port);
+		rc = -EPERM;
+		goto cfg_unlock;
+	}
+
+	id_limit = XA_LIMIT(min_id, max_id);
+	rc = xa_alloc(&cn_port->db_fifo_ids, &id, xa_pdata, id_limit, GFP_KERNEL);
+	if (rc) {
+		dev_dbg_ratelimited(hdev->dev, "DB FIFO ID allocation failed, port %d\n", port);
+		goto cfg_unlock;
+	}
+
+	xa_pdata->id = id;
+
+	port_funcs->cfg_unlock(cn_port);
+
+	out->id = id;
+
+	return 0;
+
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+	kfree(xa_pdata);
+	return rc;
+}
+
+static int validate_db_fifo_id_range(struct hbl_cn_port *cn_port, u32 db_fifo_id)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_device *hdev;
+	u32 min_id, max_id;
+
+	hdev = cn_port->hdev;
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->port_funcs->get_db_fifo_id_range(cn_port, &min_id, &max_id);
+
+	if (db_fifo_id < min_id || db_fifo_id > max_id) {
+		dev_dbg_ratelimited(hdev->dev, "Invalid db fifo ID, %d, port: %d\n", db_fifo_id,
+				    cn_port->port);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_db_fifo_mode(struct hbl_cn_port *cn_port, u8 fifo_mode)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_device *hdev;
+	u32 modes_mask;
+
+	hdev = cn_port->hdev;
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->port_funcs->get_db_fifo_modes_mask(cn_port, &modes_mask);
+
+	if (!(BIT(fifo_mode) & modes_mask)) {
+		dev_dbg_ratelimited(hdev->dev, "Invalid db fifo mode, %d, port: %d\n", fifo_mode,
+				    cn_port->port);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_db_fifo_ioctl(struct hbl_cn_port *cn_port, u32 db_fifo_id)
+{
+	return validate_db_fifo_id_range(cn_port, db_fifo_id);
+}
+
+static int user_db_fifo_unset_and_free(struct hbl_cn_port *cn_port,
+				       struct hbl_cn_db_fifo_xarray_pdata *xa_pdata)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	int rc = 0;
+
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->port_funcs->db_fifo_unset(cn_port, xa_pdata->id, xa_pdata);
+
+	/* Destroy CI buffer if we allocated one.
+	 * Note: Not all DB fifo modes need CI memory buffer.
+	 * Track CI via sync objects.
+	 * If there is an issue in destroying the CI memory, then we might exit this function
+	 * without freeing the db_fifo_pool. This would cause a kernel assertion when we try to do
+	 * rmmod as the gen_alloc_destroy for db_fifo_pool would fail as there are allocations
+	 * still left in the pool. So, the db_fifo_pool needs to be freed irrespective of the ci
+	 * memory being destroyed or not.
+	 */
+	if (xa_pdata->ci_mmap_handle)
+		rc = hbl_cn_mem_destroy(hdev, xa_pdata->ci_mmap_handle);
+
+	asic_funcs->port_funcs->db_fifo_free(cn_port, xa_pdata->db_pool_addr, xa_pdata->fifo_size);
+
+	return rc;
+}
+
+static int user_db_fifo_set(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx,
+			    struct hbl_cni_user_db_fifo_set_in *in,
+			    struct hbl_cni_user_db_fifo_set_out *out)
+{
+	u64 umr_block_addr, umr_mmap_handle, ci_mmap_handle = 0, ci_device_handle;
+	struct hbl_cn_db_fifo_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_mem_data mem_data = {};
+	struct hbl_cn_port *cn_port;
+	u32 umr_db_offset, port, id;
+	int rc;
+
+	port = in->port;
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+	id = in->id;
+
+	rc = validate_db_fifo_ioctl(cn_port, id);
+	if (rc)
+		return rc;
+
+	/* Get allocated ID private data. Having meta data associated with IDR also helps validate
+	 * that user do not trick kernel into configuring db fifo HW for an unallocated ID.
+	 */
+	port_funcs->cfg_lock(cn_port);
+	xa_pdata = xa_load(&cn_port->db_fifo_ids, id);
+	if (!xa_pdata) {
+		dev_dbg_ratelimited(hdev->dev, "DB FIFO ID %d is not allocated, port: %d\n", id,
+				    port);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	rc = validate_db_fifo_mode(cn_port, in->mode);
+	if (rc)
+		goto cfg_unlock;
+
+	xa_pdata->fifo_mode = in->mode;
+
+	/* User may call db_fifo_set multiple times post db_fifo_alloc. So, before doing any
+	 * further register changes, make sure to unset the previous settings for this id
+	 */
+	if (xa_pdata->state == DB_FIFO_STATE_SET) {
+		rc = user_db_fifo_unset_and_free(cn_port, xa_pdata);
+		if (rc) {
+			dev_dbg(hdev->dev, "Fail to unset DB FIFO %d before set, port %d\n", id,
+				port);
+			goto cfg_unlock;
+		}
+	}
+
+	rc = port_funcs->db_fifo_allocate(cn_port, xa_pdata);
+	if (rc) {
+		dev_dbg(hdev->dev, "DB FIFO %d allocation failed, port %d, mode %d\n", id, port,
+			in->mode);
+		goto cfg_unlock;
+	}
+
+	/* Get the user mapped register(UMR) block address and
+	 * db fifo offset associated with the ID.
+	 */
+	port_funcs->get_db_fifo_umr(cn_port, id, &umr_block_addr, &umr_db_offset);
+
+	/* Get mmap handle for UMR block. */
+	rc = hbl_cn_get_hw_block_handle(hdev, umr_block_addr, &umr_mmap_handle);
+	if (rc) {
+		dev_dbg_ratelimited(hdev->dev,
+				    "Failed to get UMR mmap handle of DB FIFO %d, port %d\n", id,
+				    port);
+		goto free_db_fifo;
+	}
+
+	/* Allocate a consumer-index(CI) buffer in host kernel.
+	 * HW updates CI when it pops a db fifo. User mmaps CI buffer and may poll to read current
+	 * CI.
+	 * Allocate page size, else we risk exposing kernel data to userspace inadvertently.
+	 */
+	mem_data.mem_id = HBL_CN_DRV_MEM_HOST_DMA_COHERENT;
+	mem_data.size = PAGE_SIZE;
+	rc = hbl_cn_mem_alloc(ctx, &mem_data);
+	if (rc) {
+		dev_dbg_ratelimited(hdev->dev,
+				    "DB FIFO id %d, CI buffer allocation failed, port %d\n",
+				    id, port);
+		goto free_db_fifo;
+	}
+
+	ci_mmap_handle = mem_data.handle;
+	ci_device_handle = mem_data.addr;
+
+	rc = port_funcs->db_fifo_set(cn_port, ctx, id, ci_device_handle, xa_pdata);
+	if (rc) {
+		dev_dbg_ratelimited(hdev->dev, "DB FIFO id %d, HW config failed, port %d\n", id,
+				    port);
+		goto free_ci;
+	}
+
+	/* Cache IDR metadata and init IOCTL out. */
+	out->ci_handle = ci_mmap_handle;
+	out->regs_handle = umr_mmap_handle;
+	out->regs_offset = umr_db_offset;
+
+	xa_pdata->ci_mmap_handle = out->ci_handle;
+	xa_pdata->umr_mmap_handle = out->regs_handle;
+	xa_pdata->umr_db_offset = out->regs_offset;
+	xa_pdata->state = DB_FIFO_STATE_SET;
+
+	out->fifo_size = xa_pdata->fifo_size;
+	out->fifo_bp_thresh = xa_pdata->fifo_size / 2;
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+
+free_ci:
+	if (ci_mmap_handle)
+		hbl_cn_mem_destroy(hdev, ci_mmap_handle);
+free_db_fifo:
+	port_funcs->db_fifo_free(cn_port, xa_pdata->db_pool_addr, xa_pdata->fifo_size);
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int __user_db_fifo_unset(struct hbl_cn_port *cn_port,
+				struct hbl_cn_db_fifo_xarray_pdata *xa_pdata)
+{
+	u32 id = xa_pdata->id;
+	int rc = 0;
+
+	/* User may call unset or the context may be destroyed while a db fifo is still in
+	 * allocated state. When we call alloc_user_db_fifo next time, we would skip that
+	 * particular id. This way, the id is blocked indefinitely until a full reset is done.
+	 * So to fix this issue, we maintain the state of the idr. Perform unset only if set had
+	 * been previously done for the idr.
+	 */
+	if (xa_pdata->state == DB_FIFO_STATE_SET)
+		rc = user_db_fifo_unset_and_free(cn_port, xa_pdata);
+
+	kfree(xa_pdata);
+	xa_erase(&cn_port->db_fifo_ids, id);
+
+	return rc;
+}
+
+static int user_db_fifo_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_db_fifo_unset_in *in)
+{
+	struct hbl_cn_db_fifo_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	int rc;
+	u32 id;
+
+	rc = hbl_cn_cmd_port_check(hdev, in->port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[in->port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+	id = in->id;
+
+	rc = validate_db_fifo_ioctl(cn_port, id);
+	if (rc)
+		return rc;
+
+	port_funcs->cfg_lock(cn_port);
+
+	xa_pdata = xa_load(&cn_port->db_fifo_ids, id);
+	if (!xa_pdata) {
+		dev_dbg_ratelimited(hdev->dev, "DB fifo ID %d is not allocated, port: %d\n", id,
+				    in->port);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = __user_db_fifo_unset(cn_port, xa_pdata);
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int user_encap_alloc(struct hbl_cn_device *hdev, struct hbl_cni_user_encap_alloc_in *in,
+			    struct hbl_cni_user_encap_alloc_out *out)
+{
+	struct hbl_cn_encap_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	struct xa_limit id_limit;
+	u32 min_id, max_id;
+	int rc, id;
+	u32 port;
+
+	port = in->port;
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->get_encap_id_range(cn_port, &min_id, &max_id);
+
+	/* IDR private data. */
+	xa_pdata = kzalloc(sizeof(*xa_pdata), GFP_KERNEL);
+	if (!xa_pdata)
+		return -ENOMEM;
+
+	xa_pdata->port = port;
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to allocate encapsulation ID, set_app_params wasn't called yet, port %d\n",
+			port);
+		rc = -EPERM;
+		goto cfg_unlock;
+	}
+
+	id_limit = XA_LIMIT(min_id, max_id);
+	rc = xa_alloc(&cn_port->encap_ids, &id, xa_pdata, id_limit, GFP_KERNEL);
+	if (rc) {
+		dev_dbg_ratelimited(hdev->dev, "Encapsulation ID allocation failed, port %d\n",
+				    port);
+		goto cfg_unlock;
+	}
+
+	xa_pdata->id = id;
+	port_funcs->cfg_unlock(cn_port);
+
+	out->id = id;
+
+	return 0;
+
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+	kfree(xa_pdata);
+
+	return rc;
+}
+
+static int validate_encap_id_range(struct hbl_cn_port *cn_port, u32 encap_id)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_device *hdev;
+	u32 min_id, max_id;
+
+	hdev = cn_port->hdev;
+	asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->port_funcs->get_encap_id_range(cn_port, &min_id, &max_id);
+
+	if (encap_id < min_id || encap_id > max_id) {
+		dev_dbg_ratelimited(hdev->dev, "Invalid encapsulation ID, %d\n", encap_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_encap_ioctl(struct hbl_cn_port *cn_port, u32 encap_id)
+{
+	return validate_encap_id_range(cn_port, encap_id);
+}
+
+static bool is_encap_supported(struct hbl_cn_device *hdev, struct hbl_cni_user_encap_set_in *in)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->is_encap_supported(hdev, in);
+}
+
+static int user_encap_set(struct hbl_cn_device *hdev, struct hbl_cni_user_encap_set_in *in)
+{
+	struct hbl_cn_encap_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 id, encap_type_data = 0;
+	void *encap_header = NULL;
+	int rc;
+
+	/* Check if the user request for encap set is supported */
+	if (!is_encap_supported(hdev, in))
+		return -EOPNOTSUPP;
+
+	rc = hbl_cn_cmd_port_check(hdev, in->port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[in->port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+	id = in->id;
+
+	rc = validate_encap_ioctl(cn_port, id);
+	if (rc)
+		return rc;
+
+	switch (in->encap_type) {
+	case HBL_CNI_ENCAP_OVER_IPV4:
+		encap_type_data = in->ip_proto;
+		break;
+	case HBL_CNI_ENCAP_OVER_UDP:
+		encap_type_data = in->udp_dst_port;
+		break;
+	case HBL_CNI_ENCAP_NONE:
+		/* No encapsulation/tunneling mode. Just set
+		 * source IPv4 address and UDP protocol.
+		 */
+		encap_type_data = HBL_CN_IPV4_PROTOCOL_UDP;
+		break;
+	default:
+		dev_dbg_ratelimited(hdev->dev, "Invalid encapsulation type, %d\n", in->encap_type);
+		return -EINVAL;
+	}
+
+	port_funcs->cfg_lock(cn_port);
+
+	xa_pdata = xa_load(&cn_port->encap_ids, id);
+	if (!xa_pdata) {
+		dev_dbg_ratelimited(hdev->dev, "Encapsulation ID %d is not allocated\n", id);
+		rc = -EINVAL;
+		goto cfg_unlock;
+	}
+
+	/* There could be a use case wherein the user allocates a encap ID and then calls encap_set
+	 * with IPv4 encap. Now, without doing a unset, the user can call the encap_set with UDP
+	 * encap or encap_none. In this case, we should be clearing the existing settings as well
+	 * as freeing any allocated buffer. So, call unset API to clear the settings
+	 */
+	port_funcs->encap_unset(cn_port, id, xa_pdata);
+
+	if (xa_pdata->encap_type != HBL_CNI_ENCAP_NONE)
+		kfree(xa_pdata->encap_header);
+
+	if (in->encap_type != HBL_CNI_ENCAP_NONE) {
+		if (in->tnl_hdr_size > NIC_MAX_TNL_HDR_SIZE) {
+			dev_dbg_ratelimited(hdev->dev, "Invalid tunnel header size, %d\n",
+					    in->tnl_hdr_size);
+			rc = -EINVAL;
+			goto cfg_unlock;
+		}
+
+		/* Align encapsulation header to 32bit register fields. */
+		encap_header = kzalloc(ALIGN(in->tnl_hdr_size, 4), GFP_KERNEL);
+		if (!encap_header) {
+			rc = -ENOMEM;
+			goto cfg_unlock;
+		}
+
+		rc = copy_from_user(encap_header, u64_to_user_ptr(in->tnl_hdr_ptr),
+				    in->tnl_hdr_size);
+		if (rc) {
+			dev_dbg_ratelimited(hdev->dev,
+					    "Copy encapsulation header data failed, %d\n", rc);
+			rc = -EFAULT;
+			goto free_header;
+		}
+
+		xa_pdata->encap_header = encap_header;
+		xa_pdata->encap_header_size = in->tnl_hdr_size;
+	}
+
+	xa_pdata->encap_type = in->encap_type;
+	xa_pdata->encap_type_data = encap_type_data;
+	xa_pdata->src_ip = in->ipv4_addr;
+	xa_pdata->is_set = true;
+
+	rc = port_funcs->encap_set(cn_port, id, xa_pdata);
+	if (rc)
+		goto free_header;
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+
+free_header:
+	if (in->encap_type != HBL_CNI_ENCAP_NONE)
+		kfree(encap_header);
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int user_encap_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_encap_unset_in *in)
+{
+	struct hbl_cn_encap_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	int rc;
+	u32 id;
+
+	rc = hbl_cn_cmd_port_check(hdev, in->port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[in->port];
+	port_funcs = hdev->asic_funcs->port_funcs;
+	id = in->id;
+
+	rc = validate_encap_ioctl(cn_port, id);
+	if (rc)
+		return rc;
+
+	port_funcs->cfg_lock(cn_port);
+
+	xa_pdata = xa_load(&cn_port->encap_ids, id);
+	if (!xa_pdata) {
+		dev_dbg_ratelimited(hdev->dev, "Encapsulation ID %d is not allocated\n", id);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (xa_pdata->is_set) {
+		port_funcs->encap_unset(cn_port, id, xa_pdata);
+
+		if (xa_pdata->encap_type != HBL_CNI_ENCAP_NONE)
+			kfree(xa_pdata->encap_header);
+	}
+
+	xa_erase(&cn_port->encap_ids, id);
+	kfree(xa_pdata);
+
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int user_ccq_set(struct hbl_cn_device *hdev, struct hbl_cni_user_ccq_set_in *in,
+			struct hbl_cni_user_ccq_set_out *out, struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	u64 ccq_mmap_handle, ccq_device_addr, pi_mmap_handle, pi_device_addr;
+	struct hbl_cn_mem_data mem_data = {};
+	struct hbl_cn_port *cn_port;
+	u32 port, ccqn;
+	int rc;
+
+	rc = hbl_cn_cmd_port_check(hdev, in->port, NIC_PORT_CHECK_OPEN | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	port = in->port;
+
+	if (!hdev->mmu_bypass) {
+		dev_dbg(hdev->dev, "Allocation of non physical dma-mem is not supported, port %d\n",
+			port);
+		return -EOPNOTSUPP;
+	}
+
+	if (!is_power_of_2(in->num_of_entries)) {
+		dev_dbg(hdev->dev, "user CCQ buffer length must be at power of 2, port %d\n",
+			port);
+		return -EINVAL;
+	}
+
+	if (in->num_of_entries > USER_CCQ_MAX_ENTRIES ||
+	    in->num_of_entries < USER_CCQ_MIN_ENTRIES) {
+		dev_dbg(hdev->dev, "CCQ buffer length invalid 0x%x, port %d\n", in->num_of_entries,
+			port);
+		return -EINVAL;
+	}
+
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->set_app_params) {
+		dev_dbg(hdev->dev,
+			"Failed to set CCQ handler, set_app_params wasn't called yet, port %d\n",
+			port);
+		rc = -EPERM;
+		goto cfg_unlock;
+	}
+
+	if (cn_port->ccq_enable) {
+		dev_dbg(hdev->dev, "Failed setting CCQ handler - it is already set, port %d\n",
+			port);
+		rc = -EBUSY;
+		goto cfg_unlock;
+	}
+
+	/* Allocate the queue memory buffer in host kernel */
+	mem_data.mem_id = HBL_CN_DRV_MEM_HOST_DMA_COHERENT;
+	mem_data.size = in->num_of_entries * CC_CQE_SIZE;
+	rc = hbl_cn_mem_alloc(ctx, &mem_data);
+	if (rc) {
+		dev_err(hdev->dev, "CCQ memory buffer allocation failed, port %d\n", port);
+		goto cfg_unlock;
+	}
+
+	ccq_mmap_handle = mem_data.handle;
+	ccq_device_addr = mem_data.addr;
+
+	/* Allocate a producer-index (PI) buffer in host kernel */
+	memset(&mem_data, 0, sizeof(mem_data));
+	mem_data.mem_id = HBL_CN_DRV_MEM_HOST_DMA_COHERENT;
+	mem_data.size = PAGE_SIZE;
+	rc = hbl_cn_mem_alloc(ctx, &mem_data);
+	if (rc) {
+		dev_err(hdev->dev, "CCQ PI buffer allocation failed, port %d\n", port);
+		goto free_ccq;
+	}
+
+	pi_mmap_handle = mem_data.handle;
+	pi_device_addr = mem_data.addr;
+
+	port_funcs->user_ccq_set(cn_port, ccq_device_addr, pi_device_addr, in->num_of_entries,
+				 &ccqn);
+
+	rc = hbl_cn_eq_dispatcher_register_ccq(cn_port, ctx->asid, ccqn);
+	if (rc) {
+		dev_err(hdev->dev, "failed to register CCQ EQ handler, port %u, asid %u\n", port,
+			ctx->asid);
+		goto free_pi;
+	}
+
+	cn_port->ccq_handle = ccq_mmap_handle;
+	cn_port->ccq_pi_handle = pi_mmap_handle;
+
+	out->mem_handle = cn_port->ccq_handle;
+	out->pi_handle = cn_port->ccq_pi_handle;
+	out->id = ccqn;
+
+	cn_port->ccq_enable = true;
+
+	port_funcs->cfg_unlock(cn_port);
+
+	return 0;
+
+free_pi:
+	hbl_cn_mem_destroy(hdev, pi_mmap_handle);
+free_ccq:
+	hbl_cn_mem_destroy(hdev, ccq_mmap_handle);
+cfg_unlock:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int __user_ccq_unset(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx, u32 port)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	bool has_errors = false;
+	u32 ccqn;
+	int rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+	port_funcs->user_ccq_unset(cn_port, &ccqn);
+
+	rc = hbl_cn_mem_destroy(hdev, cn_port->ccq_pi_handle);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to free CCQ PI memory, port %d\n", port);
+		has_errors = true;
+	}
+
+	rc = hbl_cn_mem_destroy(hdev, cn_port->ccq_handle);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to free CCQ memory, port %d\n", port);
+		has_errors = true;
+	}
+
+	rc = hbl_cn_eq_dispatcher_unregister_ccq(cn_port, ctx->asid, ccqn);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to unregister CCQ EQ handler, port %u, asid %u\n", port,
+			ctx->asid);
+		has_errors = true;
+	}
+
+	if (has_errors)
+		return -EIO;
+
+	cn_port->ccq_enable = false;
+
+	return 0;
+}
+
+static int user_ccq_unset(struct hbl_cn_device *hdev, struct hbl_cni_user_ccq_unset_in *in,
+			  struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 port;
+	int rc;
+
+	port = in->port;
+
+	rc = hbl_cn_cmd_port_check(hdev, port, NIC_PORT_CHECK_ENABLE | NIC_PORT_PRINT_ON_ERR);
+	if (rc)
+		return rc;
+
+	cn_port = &hdev->cn_ports[port];
+
+	port_funcs->cfg_lock(cn_port);
+
+	if (!cn_port->ccq_enable) {
+		dev_dbg(hdev->dev, "Failed unsetting CCQ handler - it is already unset, port %u\n",
+			port);
+		rc = -ENXIO;
+		goto out;
+	}
+
+	rc = __user_ccq_unset(hdev, ctx, in->port);
+out:
+	port_funcs->cfg_unlock(cn_port);
+
+	return rc;
+}
+
+static int dump_qp(struct hbl_cn_device *hdev, struct hbl_cni_dump_qp_in *in)
+{
+	struct hbl_cn_qp_info qp_info = {};
+	u32 buf_size;
+	char *buf;
+	int rc;
+
+	buf_size = in->user_buf_size;
+
+	if (!buf_size || buf_size > NIC_DUMP_QP_SZ) {
+		dev_err(hdev->dev, "Invalid buffer size %u\n", buf_size);
+		return -EINVAL;
+	}
+
+	buf = kzalloc(buf_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	qp_info.port = in->port;
+	qp_info.qpn = in->qpn;
+	qp_info.req = in->req;
+	qp_info.full_print = true;
+	qp_info.force_read = true;
+
+	rc = hdev->asic_funcs->qp_read(hdev, &qp_info, buf, buf_size);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to read QP %u, port %u\n", in->qpn, in->port);
+		goto out;
+	}
+
+	if (copy_to_user((void __user *)(uintptr_t)in->user_buf, buf, buf_size)) {
+		dev_err(hdev->dev, "copy to user failed in debug ioctl\n");
+		rc = -EFAULT;
+		goto out;
+	}
+
+out:
+	kfree(buf);
+	return rc;
+}
+
+static int __hbl_cn_control(struct hbl_cn_device *hdev, u32 op, void *input, void *output,
+			    struct hbl_cn_ctx *ctx)
+{
+	int rc;
+
+	if (!(hdev->ctrl_op_mask & BIT(op))) {
+		dev_dbg(hdev->dev, "CN control request %d is not supported on this device\n", op);
+		return -EOPNOTSUPP;
+	}
+
+	switch (op) {
+	case HBL_CNI_OP_ALLOC_CONN:
+		rc = alloc_qp(hdev, ctx, input, output);
+		break;
+	case HBL_CNI_OP_SET_REQ_CONN_CTX:
+		rc = set_req_qp_ctx(hdev, input, output);
+		break;
+	case HBL_CNI_OP_SET_RES_CONN_CTX:
+		rc = set_res_qp_ctx(hdev, input);
+		break;
+	case HBL_CNI_OP_DESTROY_CONN:
+		rc = destroy_qp(hdev, input);
+		break;
+	case HBL_CNI_OP_USER_WQ_SET:
+		rc = user_wq_arr_set(hdev, input, output, ctx);
+		break;
+	case HBL_CNI_OP_USER_WQ_UNSET:
+		rc = user_wq_arr_unset(hdev, input, ctx);
+		break;
+	case HBL_CNI_OP_ALLOC_USER_CQ_ID:
+		rc = alloc_user_cq_id(hdev, input, output, ctx);
+		break;
+	case HBL_CNI_OP_SET_USER_APP_PARAMS:
+		rc = user_set_app_params(hdev, input, ctx);
+		break;
+	case HBL_CNI_OP_GET_USER_APP_PARAMS:
+		rc = user_get_app_params(hdev, input, output);
+		break;
+	case HBL_CNI_OP_EQ_POLL:
+		rc = eq_poll(hdev, ctx, input, output);
+		break;
+	case HBL_CNI_OP_ALLOC_USER_DB_FIFO:
+		rc = alloc_user_db_fifo(hdev, ctx, input, output);
+		break;
+	case HBL_CNI_OP_USER_DB_FIFO_SET:
+		rc = user_db_fifo_set(hdev, ctx, input, output);
+		break;
+	case HBL_CNI_OP_USER_DB_FIFO_UNSET:
+		rc = user_db_fifo_unset(hdev, input);
+		break;
+	case HBL_CNI_OP_USER_ENCAP_ALLOC:
+		rc = user_encap_alloc(hdev, input, output);
+		break;
+	case HBL_CNI_OP_USER_ENCAP_SET:
+		rc = user_encap_set(hdev, input);
+		break;
+	case HBL_CNI_OP_USER_ENCAP_UNSET:
+		rc = user_encap_unset(hdev, input);
+		break;
+	case HBL_CNI_OP_USER_CCQ_SET:
+		rc = user_ccq_set(hdev, input, output, ctx);
+		break;
+	case HBL_CNI_OP_USER_CCQ_UNSET:
+		rc = user_ccq_unset(hdev, input, ctx);
+		break;
+	case HBL_CNI_OP_USER_CQ_ID_SET:
+		rc = user_cq_id_set(hdev, input, output);
+		break;
+	case HBL_CNI_OP_USER_CQ_ID_UNSET:
+		rc = user_cq_id_unset(hdev, input);
+		break;
+	case HBL_CNI_OP_DUMP_QP:
+		rc = dump_qp(hdev, input);
+		break;
+	default:
+		/* we shouldn't get here as we check the opcode mask before */
+		dev_dbg(hdev->dev, "Invalid CN control request %d\n", op);
+		return -EINVAL;
+	}
+
+	return rc;
+}
+
+static int hbl_cn_ib_cmd_ctrl(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx, u32 op, void *input,
+			      void *output)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(aux_dev);
+	struct hbl_cn_ctx *ctx = cn_ib_ctx;
+	int rc;
+
+	mutex_lock(&ctx->lock);
+
+	do
+		rc = __hbl_cn_control(hdev, op, input, output, ctx);
+	while (rc == -EAGAIN);
+
+	mutex_unlock(&ctx->lock);
+
+	return rc;
+}
+
+static enum hbl_ib_mem_type mem_id_to_mem_type(enum hbl_cn_drv_mem_id id)
+{
+	switch (id) {
+	case HBL_CN_DRV_MEM_HOST_DMA_COHERENT:
+		return HBL_IB_MEM_HOST_DMA_COHERENT;
+	case HBL_CN_DRV_MEM_HOST_VIRTUAL:
+		return HBL_IB_MEM_HOST_VIRTUAL;
+	case HBL_CN_DRV_MEM_DEVICE:
+		return HBL_IB_MEM_DEVICE;
+	case HBL_CN_DRV_MEM_HOST_MAP_ONLY:
+		return HBL_IB_MEM_HOST_MAP_ONLY;
+	case HBL_CN_DRV_MEM_INVALID:
+	default:
+		return HBL_IB_MEM_INVALID;
+	}
+}
+
+static int hbl_cn_ib_query_mem_handle(struct hbl_aux_dev *ib_aux_dev, u64 mem_handle,
+				      struct hbl_ib_mem_info *info)
+{
+	struct hbl_cn_device *hdev = HBL_AUX2NIC(ib_aux_dev);
+	struct hbl_cn_mem_buf *buf;
+	u64 mem_type;
+
+	mem_type = (mem_handle >> PAGE_SHIFT) & HBL_CN_MMAP_TYPE_MASK;
+
+	memset(info, 0, sizeof(*info));
+	info->mem_handle = mem_handle;
+
+	switch (mem_type) {
+	case HBL_CN_MMAP_TYPE_BLOCK:
+		info->mtype = HBL_IB_MEM_HW_BLOCK;
+		if (!hbl_cn_get_hw_block_addr(hdev, mem_handle, &info->bus_addr, &info->size))
+			return 0;
+
+		dev_err(hdev->dev, "NIC: No hw block address for handle %#llx\n", mem_handle);
+		break;
+	case HBL_CN_MMAP_TYPE_CN_MEM:
+		buf = hbl_cn_mem_buf_get(hdev, mem_handle);
+		if (!buf) {
+			dev_err(hdev->dev, "NIC: No buffer for handle %#llx\n", mem_handle);
+			break;
+		}
+
+		info->cpu_addr = buf->kernel_address;
+		info->bus_addr = buf->bus_address;
+		info->size = buf->mappable_size;
+		info->vmalloc = false;
+		info->mtype = mem_id_to_mem_type(buf->mem_id);
+
+		hbl_cn_mem_buf_put(buf);
+		return 0;
+	default:
+		dev_err(hdev->dev, "NIC: Invalid handle %#llx\n", mem_handle);
+		break;
+	}
+	return -EINVAL;
+}
+
+static void qps_destroy(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_port *cn_port;
+	unsigned long qp_id = 0;
+	struct hbl_cn_qp *qp;
+	int i;
+
+	/* destroy the QPs */
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		/* protect against destroy_qp occurring in parallel */
+		port_funcs->cfg_lock(cn_port);
+
+		xa_for_each(&cn_port->qp_ids, qp_id, qp) {
+			if (IS_ERR_OR_NULL(qp))
+				continue;
+
+			hbl_cn_qp_do_release(qp);
+		}
+
+		port_funcs->cfg_unlock(cn_port);
+	}
+
+	/* wait for the workers to complete */
+	qps_drain_async_work(hdev);
+
+	/* Verify the lists are empty */
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		port_funcs->cfg_lock(cn_port);
+
+		xa_for_each(&cn_port->qp_ids, qp_id, qp)
+			dev_err_ratelimited(hdev->dev, "Port %d QP %ld is still alive\n",
+					    cn_port->port, qp_id);
+
+		port_funcs->cfg_unlock(cn_port);
+	}
+}
+
+static void user_cqs_destroy(struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_device *hdev = ctx->hdev;
+	struct hbl_cn_properties *cn_props;
+	struct hbl_cn_user_cq *user_cq;
+	struct hbl_cn_port *cn_port;
+	unsigned long id;
+	int i;
+
+	cn_props = &hdev->cn_props;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!cn_props->force_cq && !(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		xa_for_each(&cn_port->cq_ids, id, user_cq) {
+			if (user_cq->state == USER_CQ_STATE_ALLOC)
+				hbl_cn_user_cq_put(user_cq);
+			else if (user_cq->state == USER_CQ_STATE_SET)
+				user_cq_unset_locked(user_cq, true);
+		}
+	}
+}
+
+static void wq_arrs_destroy(struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_device *hdev = ctx->hdev;
+	struct hbl_cn_port *cn_port;
+	u32 type;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		wq_arr_props = cn_port->wq_arr_props;
+
+		for (type = 0; type < HBL_CNI_USER_WQ_TYPE_MAX; type++) {
+			if (wq_arr_props[type].enabled)
+				__user_wq_arr_unset(ctx, cn_port, type);
+		}
+	}
+}
+
+static void ccqs_destroy(struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_device *hdev = ctx->hdev;
+	struct hbl_cn_port *cn_port;
+	int port;
+
+	for (port = 0; port < hdev->cn_props.max_num_of_ports; port++) {
+		if (!(hdev->ports_mask & BIT(port)))
+			continue;
+
+		cn_port = &hdev->cn_ports[port];
+		if (cn_port->ccq_enable)
+			__user_ccq_unset(hdev, ctx, port);
+	}
+}
+
+static void user_db_fifos_destroy(struct hbl_cn_ctx *ctx)
+{
+	struct hbl_cn_db_fifo_xarray_pdata *xa_pdata;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_port *cn_port;
+	struct hbl_cn_device *hdev;
+	unsigned long id;
+	int i;
+
+	hdev = ctx->hdev;
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		port_funcs->cfg_lock(cn_port);
+
+		xa_for_each(&cn_port->db_fifo_ids, id, xa_pdata)
+			if (xa_pdata->asid == ctx->asid)
+				__user_db_fifo_unset(cn_port, xa_pdata);
+
+		port_funcs->cfg_unlock(cn_port);
+	}
+}
+
+static void encap_ids_destroy(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs = hdev->asic_funcs->port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_encap_xarray_pdata *xa_pdata;
+	struct hbl_cn_port *cn_port;
+	unsigned long encap_id;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		port_funcs->cfg_lock(cn_port);
+
+		xa_for_each(&cn_port->encap_ids, encap_id, xa_pdata) {
+			asic_funcs->port_funcs->encap_unset(cn_port, encap_id, xa_pdata);
+
+			if (xa_pdata->encap_type != HBL_CNI_ENCAP_NONE)
+				kfree(xa_pdata->encap_header);
+
+			kfree(xa_pdata);
+			xa_erase(&cn_port->encap_ids, encap_id);
+		}
+
+		port_funcs->cfg_unlock(cn_port);
+	}
+}
+
+static void set_app_params_clear(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+	u32 max_num_of_ports, port;
+
+	asic_funcs = hdev->asic_funcs;
+	max_num_of_ports = hdev->cn_props.max_num_of_ports;
+
+	asic_funcs->app_params_clear(hdev);
+
+	for (port = 0; port < max_num_of_ports; port++) {
+		if (!(hdev->ports_mask & BIT(port)))
+			continue;
+
+		cn_port = &hdev->cn_ports[port];
+		cn_port->set_app_params = false;
+	}
+}
+
+void hbl_cn_ctx_resources_destroy(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx)
+{
+	qps_destroy(hdev);
+	user_cqs_destroy(ctx);
+	wq_arrs_destroy(ctx);
+	ccqs_destroy(ctx);
+	user_db_fifos_destroy(ctx);
+	encap_ids_destroy(hdev);
+	set_app_params_clear(hdev);
+}
+
+int hbl_cn_alloc_ring(struct hbl_cn_device *hdev, struct hbl_cn_ring *ring, int elem_size,
+		      int count)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	int rc;
+
+	ring->count = count;
+	ring->elem_size = elem_size;
+	ring->asid = hdev->kernel_asid;
+
+	RING_BUF_SIZE(ring) = elem_size * count;
+	RING_BUF_ADDRESS(ring) = hbl_cn_dma_alloc_coherent(hdev, RING_BUF_SIZE(ring),
+							   &RING_BUF_DMA_ADDRESS(ring), GFP_KERNEL);
+	if (!RING_BUF_ADDRESS(ring))
+		return -ENOMEM;
+
+	/* ring's idx_ptr shall point on pi/ci address */
+	RING_PI_SIZE(ring) = sizeof(u64);
+	RING_PI_ADDRESS(ring) = hbl_cn_dma_pool_zalloc(hdev, RING_PI_SIZE(ring),
+						       GFP_KERNEL | __GFP_ZERO,
+						       &RING_PI_DMA_ADDRESS(ring));
+	if (!RING_PI_ADDRESS(ring)) {
+		rc = -ENOMEM;
+		goto pi_alloc_fail;
+	}
+
+	return 0;
+
+pi_alloc_fail:
+	asic_funcs->dma_free_coherent(hdev, RING_BUF_SIZE(ring), RING_BUF_ADDRESS(ring),
+				      RING_BUF_DMA_ADDRESS(ring));
+
+	return rc;
+}
+
+void hbl_cn_free_ring(struct hbl_cn_device *hdev, struct hbl_cn_ring *ring)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->dma_pool_free(hdev, RING_PI_ADDRESS(ring), RING_PI_DMA_ADDRESS(ring));
+
+	asic_funcs->dma_free_coherent(hdev, RING_BUF_SIZE(ring), RING_BUF_ADDRESS(ring),
+				      RING_BUF_DMA_ADDRESS(ring));
+}
+
+static void hbl_cn_randomize_status_cnts(struct hbl_cn_port *cn_port,
+					 struct hbl_cn_cpucp_status *status)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	u32 port = cn_port->port;
+
+	RAND_STAT_CNT(status->high_ber_reinit);
+	RAND_STAT_CNT(status->correctable_err_cnt);
+	RAND_STAT_CNT(status->uncorrectable_err_cnt);
+	RAND_STAT_CNT(status->bad_format_cnt);
+	RAND_STAT_CNT(status->responder_out_of_sequence_psn_cnt);
+}
+
+static void hbl_cn_get_status(struct hbl_cn_port *cn_port, struct hbl_cn_cpucp_status *status)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	u32 port = cn_port->port;
+
+	/* Port toggle counter should always be filled regardless of the logical state of the
+	 * port.
+	 */
+	status->port_toggle_cnt = hbl_cn_get_port_toggle_cnt(cn_port);
+
+	status->port = port;
+	status->up = hbl_cn_is_port_open(cn_port);
+
+	if (!status->up)
+		return;
+
+	status->pcs_link = cn_port->pcs_link;
+	status->phy_ready = cn_port->phy_fw_tuned;
+	status->auto_neg = cn_port->auto_neg_enable;
+
+	if (hdev->rand_status) {
+		hbl_cn_randomize_status_cnts(cn_port, status);
+		return;
+	}
+
+	status->high_ber_reinit = cn_port->pcs_remote_fault_reconfig_cnt;
+
+	/* Each ASIC will fill the rest of the statistics */
+	hdev->asic_funcs->port_funcs->get_status(cn_port, status);
+}
+
+static void hbl_cn_convert_cpucp_status(struct cpucp_nic_status *to,
+					struct hbl_cn_cpucp_status *from)
+{
+	to->port = cpu_to_le32(from->port);
+	to->bad_format_cnt = cpu_to_le32(from->bad_format_cnt);
+	to->responder_out_of_sequence_psn_cnt =
+					cpu_to_le32(from->responder_out_of_sequence_psn_cnt);
+	to->high_ber_reinit = cpu_to_le32(from->high_ber_reinit);
+	to->correctable_err_cnt = cpu_to_le32(from->correctable_err_cnt);
+	to->uncorrectable_err_cnt = cpu_to_le32(from->uncorrectable_err_cnt);
+	to->retraining_cnt = cpu_to_le32(from->retraining_cnt);
+	to->up = from->up;
+	to->pcs_link = from->pcs_link;
+	to->phy_ready = from->phy_ready;
+	to->auto_neg = from->auto_neg;
+	to->timeout_retransmission_cnt = cpu_to_le32(from->timeout_retransmission_cnt);
+	to->high_ber_cnt = cpu_to_le32(from->high_ber_cnt);
+	to->pre_fec_ser.integer = cpu_to_le16(from->pre_fec_ser.integer);
+	to->pre_fec_ser.exp = cpu_to_le16(from->pre_fec_ser.exp);
+	to->post_fec_ser.integer = cpu_to_le16(from->post_fec_ser.integer);
+	to->post_fec_ser.exp = cpu_to_le16(from->post_fec_ser.exp);
+	to->bandwidth.integer = cpu_to_le16(from->bandwidth.integer);
+	to->bandwidth.frac = cpu_to_le16(from->bandwidth.frac);
+	to->lat.integer = cpu_to_le16(from->lat.integer);
+	to->lat.frac = cpu_to_le16(from->lat.frac);
+	to->port_toggle_cnt = cpu_to_le32(from->port_toggle_cnt);
+}
+
+static int hbl_cn_send_cpucp_status(struct hbl_cn_device *hdev, u32 port,
+				    struct hbl_cn_cpucp_status *cn_status)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct cpucp_nic_status_packet *pkt;
+	struct cpucp_nic_status status = {};
+	struct hbl_cn_properties *cn_props;
+	size_t total_pkt_size, data_size;
+	struct hbl_cn_port *cn_port;
+	u64 result;
+	int rc;
+
+	cn_props = &hdev->cn_props;
+	data_size = cn_props->status_packet_size;
+	asic_funcs = hdev->asic_funcs;
+	port_funcs = asic_funcs->port_funcs;
+	cn_port = &hdev->cn_ports[port];
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
+	hbl_cn_convert_cpucp_status(&status, cn_status);
+
+	pkt->length = cpu_to_le32(data_size / sizeof(u32));
+	memcpy(&pkt->data, &status, data_size);
+
+	pkt->cpucp_pkt.ctl = cpu_to_le32(CPUCP_PACKET_NIC_STATUS << CPUCP_PKT_CTL_OPCODE_SHIFT);
+
+	rc = asic_funcs->send_cpu_message(hdev, (u32 *)pkt, total_pkt_size, 0, &result);
+	if (rc)
+		dev_err(hdev->dev, "failed to send NIC status, port %d\n", port);
+
+	kfree(pkt);
+out:
+	port_funcs->post_send_status(cn_port);
+
+	return rc;
+}
+
+void hbl_cn_fw_status_work(struct work_struct *work)
+{
+	struct hbl_cn_port *cn_port = container_of(work, struct hbl_cn_port, fw_status_work.work);
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_cpucp_status status = {};
+	u32 port = cn_port->port;
+	int rc;
+
+	hbl_cn_get_status(cn_port, &status);
+
+	rc = hbl_cn_send_cpucp_status(hdev, port, &status);
+	if (rc)
+		return;
+
+	if (hdev->status_cmd == HBL_CN_STATUS_PERIODIC_START)
+		queue_delayed_work(cn_port->wq, &cn_port->fw_status_work,
+				   msecs_to_jiffies(hdev->status_period * 1000));
+}
+
+static void cn_port_sw_fini(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = cn_port->hdev->asic_funcs;
+
+	if (!cn_port->sw_initialized)
+		return;
+
+	cn_port->sw_initialized = false;
+
+	asic_funcs->port_funcs->port_sw_fini(cn_port);
+
+	xa_destroy(&cn_port->cq_ids);
+	xa_destroy(&cn_port->encap_ids);
+	xa_destroy(&cn_port->db_fifo_ids);
+	xa_destroy(&cn_port->qp_ids);
+
+	mutex_destroy(&cn_port->cnt_lock);
+	mutex_destroy(&cn_port->control_lock);
+
+	kfree(cn_port->reset_tracker);
+
+	destroy_workqueue(cn_port->qp_wq);
+	destroy_workqueue(cn_port->wq);
+}
+
+static void cn_wq_arr_props_init(struct hbl_cn_wq_array_properties *wq_arr_props)
+{
+	wq_arr_props[HBL_CNI_USER_WQ_SEND].type_str = "send";
+	wq_arr_props[HBL_CNI_USER_WQ_SEND].is_send = true;
+
+	wq_arr_props[HBL_CNI_USER_WQ_RECV].type_str = "recv";
+	wq_arr_props[HBL_CNI_USER_WQ_RECV].is_send = false;
+}
+
+static int cn_port_sw_init(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_reset_tracker *reset_tracker;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 port, max_qp_error_syndromes;
+	char wq_name[32] = {0};
+	int rc;
+
+	port = cn_port->port;
+	asic_funcs = hdev->asic_funcs;
+	port_funcs = asic_funcs->port_funcs;
+	wq_arr_props = cn_port->wq_arr_props;
+	reset_tracker = NULL;
+
+	snprintf(wq_name, sizeof(wq_name) - 1, "hbl%u-cn%d-wq", hdev->id, port);
+	cn_port->wq = alloc_workqueue(wq_name, 0, 0);
+	if (!cn_port->wq) {
+		dev_err(hdev->dev, "Failed to create WQ, port: %d\n", port);
+		return -ENOMEM;
+	}
+
+	snprintf(wq_name, sizeof(wq_name) - 1, "hbl%u-cn%d-qp-wq", hdev->id, port);
+	cn_port->qp_wq = alloc_workqueue(wq_name, WQ_UNBOUND, 0);
+	if (!cn_port->qp_wq) {
+		dev_err(hdev->dev, "Failed to create QP WQ, port: %d\n", port);
+		rc = -ENOMEM;
+		goto qp_wq_err;
+	}
+
+	max_qp_error_syndromes = hdev->cn_props.max_qp_error_syndromes;
+	if (max_qp_error_syndromes) {
+		reset_tracker = kcalloc(max_qp_error_syndromes, sizeof(*reset_tracker), GFP_KERNEL);
+		if (!reset_tracker) {
+			rc = -ENOMEM;
+			goto reset_tracker_err;
+		}
+
+		cn_port->reset_tracker = reset_tracker;
+	}
+
+	mutex_init(&cn_port->control_lock);
+	mutex_init(&cn_port->cnt_lock);
+
+	xa_init_flags(&cn_port->qp_ids, XA_FLAGS_ALLOC);
+	xa_init_flags(&cn_port->db_fifo_ids, XA_FLAGS_ALLOC);
+	xa_init_flags(&cn_port->encap_ids, XA_FLAGS_ALLOC);
+	xa_init_flags(&cn_port->cq_ids, XA_FLAGS_ALLOC);
+
+	INIT_DELAYED_WORK(&cn_port->link_status_work, port_funcs->phy_link_status_work);
+
+	cn_port->speed = asic_funcs->get_default_port_speed(hdev);
+	cn_port->pfc_enable = true;
+	cn_port->pflags = PFLAGS_PCS_LINK_CHECK | PFLAGS_PHY_AUTO_NEG_LPBK;
+
+	cn_wq_arr_props_init(wq_arr_props);
+
+	rc = port_funcs->port_sw_init(cn_port);
+	if (rc)
+		goto sw_init_err;
+
+	cn_port->sw_initialized = true;
+
+	return 0;
+
+sw_init_err:
+	xa_destroy(&cn_port->cq_ids);
+	xa_destroy(&cn_port->encap_ids);
+	xa_destroy(&cn_port->db_fifo_ids);
+	xa_destroy(&cn_port->qp_ids);
+
+	mutex_destroy(&cn_port->cnt_lock);
+	mutex_destroy(&cn_port->control_lock);
+
+	if (max_qp_error_syndromes)
+		kfree(reset_tracker);
+reset_tracker_err:
+	destroy_workqueue(cn_port->qp_wq);
+qp_wq_err:
+	destroy_workqueue(cn_port->wq);
+
+	return rc;
+}
+
+static int cn_macro_sw_init(struct hbl_cn_macro *cn_macro)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = cn_macro->hdev->asic_funcs;
+
+	return asic_funcs->macro_sw_init(cn_macro);
+}
+
+static void cn_macro_sw_fini(struct hbl_cn_macro *cn_macro)
+{
+	struct hbl_cn_asic_funcs *asic_funcs;
+
+	asic_funcs = cn_macro->hdev->asic_funcs;
+
+	asic_funcs->macro_sw_fini(cn_macro);
+}
+
+static void hbl_cn_sw_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++)
+		cn_port_sw_fini(&hdev->cn_ports[i]);
+
+	for (i = 0; i < hdev->cn_props.num_of_macros; i++)
+		cn_macro_sw_fini(&hdev->cn_macros[i]);
+
+	asic_funcs->sw_fini(hdev);
+
+	kfree(hdev->ib_aux_dev.aux_data);
+	kfree(hdev->ib_aux_dev.aux_ops);
+	kfree(hdev->en_aux_dev.aux_data);
+	kfree(hdev->en_aux_dev.aux_ops);
+	kfree(hdev->mac_lane_remap);
+	kfree(hdev->phy_ber_info);
+	kfree(hdev->phy_tx_taps);
+	kfree(hdev->cn_macros);
+	kfree(hdev->cn_ports);
+}
+
+static int hbl_cn_sw_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	struct hbl_cn_macro *cn_macro, *cn_macros;
+	int rc, i, macro_cnt = 0, port_cnt = 0;
+	struct hbl_cn_port *cn_port, *cn_ports;
+	struct hbl_en_aux_data *en_aux_data;
+	struct hbl_ib_aux_data *ib_aux_data;
+	struct hbl_en_aux_ops *en_aux_ops;
+	struct hbl_ib_aux_ops *ib_aux_ops;
+	struct hbl_cn_ber_info *ber_info;
+	struct hbl_cn_tx_taps *tx_taps;
+	u32 *mac_lane_remap;
+
+	asic_funcs->pre_sw_init(hdev);
+
+	/* Allocate per port common structure array */
+	cn_ports = kcalloc(hdev->cn_props.max_num_of_ports, sizeof(*cn_ports), GFP_KERNEL);
+	if (!cn_ports)
+		return -ENOMEM;
+
+	/* Allocate per macro common structure array */
+	cn_macros = kcalloc(hdev->cn_props.num_of_macros, sizeof(*cn_macros), GFP_KERNEL);
+	if (!cn_macros) {
+		rc = -ENOMEM;
+		goto macro_alloc_fail;
+	}
+
+	tx_taps = kcalloc(hdev->cn_props.max_num_of_lanes, sizeof(*tx_taps), GFP_KERNEL);
+	if (!tx_taps) {
+		rc = -ENOMEM;
+		goto taps_alloc_fail;
+	}
+
+	ber_info = kcalloc(hdev->cn_props.max_num_of_lanes, sizeof(*ber_info), GFP_KERNEL);
+	if (!ber_info) {
+		rc = -ENOMEM;
+		goto ber_info_alloc_fail;
+	}
+
+	mac_lane_remap = kcalloc(hdev->cn_props.num_of_macros, sizeof(*mac_lane_remap),
+				 GFP_KERNEL);
+	if (!mac_lane_remap) {
+		rc = -ENOMEM;
+		goto mac_remap_alloc_fail;
+	}
+
+	en_aux_data = kzalloc(sizeof(*en_aux_data), GFP_KERNEL);
+	if (!en_aux_data) {
+		rc = -ENOMEM;
+		goto en_aux_data_alloc_fail;
+	}
+
+	en_aux_ops = kzalloc(sizeof(*en_aux_ops), GFP_KERNEL);
+	if (!en_aux_ops) {
+		rc = -ENOMEM;
+		goto en_aux_ops_alloc_fail;
+	}
+
+	ib_aux_data = kzalloc(sizeof(*ib_aux_data), GFP_KERNEL);
+	if (!ib_aux_data) {
+		rc = -ENOMEM;
+		goto ib_aux_data_alloc_fail;
+	}
+
+	ib_aux_ops = kzalloc(sizeof(*ib_aux_ops), GFP_KERNEL);
+	if (!ib_aux_ops) {
+		rc = -ENOMEM;
+		goto ib_aux_ops_alloc_fail;
+	}
+
+	hdev->en_aux_dev.aux_data = en_aux_data;
+	hdev->en_aux_dev.aux_ops = en_aux_ops;
+	hdev->ib_aux_dev.aux_data = ib_aux_data;
+	hdev->ib_aux_dev.aux_ops = ib_aux_ops;
+
+	hdev->phy_tx_taps = tx_taps;
+	hdev->phy_ber_info = ber_info;
+	hdev->mac_lane_remap = mac_lane_remap;
+	hdev->phy_config_fw = !hdev->pldm && !hdev->skip_phy_init;
+	hdev->mmu_bypass = true;
+	hdev->phy_calc_ber_wait_sec = 30;
+
+	rc = asic_funcs->sw_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "ASIC SW init failed\n");
+		goto sw_init_fail;
+	}
+
+	hdev->cn_ports = cn_ports;
+	hdev->cn_macros = cn_macros;
+	for (i = 0; i < hdev->cn_props.num_of_macros; i++, macro_cnt++) {
+		cn_macro = &hdev->cn_macros[i];
+
+		cn_macro->hdev = hdev;
+		cn_macro->idx = i;
+
+		rc = cn_macro_sw_init(cn_macro);
+		if (rc) {
+			dev_err(hdev->dev, "Macro %d SW init failed\n", i);
+			goto macro_init_fail;
+		}
+	}
+
+	/* At this stage, we don't know how many ports we have, so we must
+	 * allocate for the maximum number of ports (and also free all of them
+	 * in sw_fini)
+	 */
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++, port_cnt++) {
+		cn_port = &hdev->cn_ports[i];
+		cn_port->hdev = hdev;
+		cn_port->port = i;
+		atomic_set(&cn_port->num_of_allocated_qps, 0);
+		rc = cn_port_sw_init(cn_port);
+		if (rc) {
+			dev_err(hdev->dev, "S/W init failed, port %d\n", i);
+			goto port_init_fail;
+		}
+	}
+
+	return 0;
+
+port_init_fail:
+	for (i = 0; i < port_cnt; i++)
+		cn_port_sw_fini(&hdev->cn_ports[i]);
+
+macro_init_fail:
+	for (i = 0; i < macro_cnt; i++)
+		cn_macro_sw_fini(&hdev->cn_macros[i]);
+
+	asic_funcs->sw_fini(hdev);
+sw_init_fail:
+	kfree(ib_aux_ops);
+ib_aux_ops_alloc_fail:
+	kfree(ib_aux_data);
+ib_aux_data_alloc_fail:
+	kfree(en_aux_ops);
+en_aux_ops_alloc_fail:
+	kfree(en_aux_data);
+en_aux_data_alloc_fail:
+	kfree(mac_lane_remap);
+mac_remap_alloc_fail:
+	kfree(ber_info);
+ber_info_alloc_fail:
+	kfree(tx_taps);
+taps_alloc_fail:
+	kfree(cn_macros);
+macro_alloc_fail:
+	kfree(cn_ports);
+
+	return rc;
+}
+
+static void hbl_cn_late_init(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	/* compute2cn */
+	aux_ops->ports_reopen = hbl_cn_ports_reopen;
+	aux_ops->ports_stop_prepare = hbl_cn_hard_reset_prepare;
+	aux_ops->ports_stop = hbl_cn_stop;
+	aux_ops->synchronize_irqs = hbl_cn_synchronize_irqs;
+
+	hdev->asic_funcs->late_init(hdev);
+}
+
+static void hbl_cn_late_fini(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	/* compute2cn */
+	aux_ops->ports_reopen = NULL;
+	aux_ops->ports_stop_prepare = NULL;
+	aux_ops->ports_stop = NULL;
+	aux_ops->synchronize_irqs = NULL;
+
+	hdev->asic_funcs->late_fini(hdev);
+}
+
+bool hbl_cn_is_port_open(struct hbl_cn_port *cn_port)
+{
+	struct hbl_aux_dev *aux_dev = &cn_port->hdev->en_aux_dev;
+	struct hbl_en_aux_ops *aux_ops = aux_dev->aux_ops;
+	u32 port = cn_port->port;
+
+	if (cn_port->eth_enable && aux_ops->is_port_open)
+		return aux_ops->is_port_open(aux_dev, port);
+
+	return cn_port->port_open;
+}
+
+u32 hbl_cn_get_pflags(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	u32 port = cn_port->port;
+
+	aux_dev = &hdev->en_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	if (cn_port->eth_enable && aux_ops->get_pflags)
+		return aux_ops->get_pflags(aux_dev, port);
+
+	return cn_port->pflags;
+}
+
+u8 hbl_cn_get_num_of_digits(u64 num)
+{
+	u8 n_digits = 0;
+
+	while (num) {
+		n_digits++;
+		num /= 10;
+	}
+
+	return n_digits;
+}
+
+static void hbl_cn_spmu_init(struct hbl_cn_port *cn_port, bool full)
+{
+	u32 spmu_events[NIC_SPMU_STATS_LEN_MAX], num_event_types, port = cn_port->port;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_stat *event_types;
+	int rc, i;
+
+	if (!hdev->supports_coresight)
+		return;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->spmu_get_stats_info(cn_port, &event_types, &num_event_types);
+	num_event_types = min_t(u32, num_event_types, NIC_SPMU_STATS_LEN_MAX);
+
+	for (i = 0; i < num_event_types; i++)
+		spmu_events[i] = event_types[i].lo_offset;
+
+	if (full) {
+		rc = port_funcs->spmu_config(cn_port, num_event_types, spmu_events, false);
+		if (rc)
+			dev_err(hdev->dev, "Failed to disable spmu for port %d\n", port);
+	}
+
+	rc = port_funcs->spmu_config(cn_port, num_event_types, spmu_events, true);
+	if (rc)
+		dev_err(hdev->dev, "Failed to enable spmu for port %d\n", port);
+}
+
+static void hbl_cn_reset_stats_counters_port(struct hbl_cn_device *hdev, u32 port)
+{
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_cn_port *cn_port;
+	struct hbl_aux_dev *aux_dev;
+
+	cn_port = &hdev->cn_ports[port];
+	aux_dev = &hdev->en_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	/* Ethernet */
+	if (cn_port->eth_enable && aux_ops->reset_stats)
+		aux_ops->reset_stats(aux_dev, port);
+
+	/* MAC */
+	port_funcs->reset_mac_stats(cn_port);
+
+	/* SPMU */
+	hbl_cn_spmu_init(cn_port, true);
+
+	/* XPCS91 */
+	cn_port->correctable_errors_cnt = 0;
+	cn_port->uncorrectable_errors_cnt = 0;
+
+	/* PCS */
+	cn_port->pcs_local_fault_cnt = 0;
+	cn_port->pcs_remote_fault_cnt = 0;
+	cn_port->pcs_remote_fault_reconfig_cnt = 0;
+	cn_port->pcs_link_restore_cnt = 0;
+
+	/* Congestion Queue */
+	cn_port->cong_q_err_cnt = 0;
+}
+
+void hbl_cn_reset_stats_counters(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	u32 port;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		if (!hbl_cn_is_port_open(cn_port))
+			continue;
+
+		port = cn_port->port;
+
+		hbl_cn_reset_stats_counters_port(hdev, port);
+	}
+}
+
+void hbl_cn_reset_ports_toggle_counters(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_port *cn_port;
+	int i;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		cn_port->port_toggle_cnt = 0;
+		cn_port->port_toggle_cnt_prev = 0;
+	}
+}
+
+/* The following implements the events dispatcher
+ * Each application registering with the device is assigned a unique ASID
+ * by the driver, it is also being associated with a SW-EQ by the dispatcher
+ * (The Eth driver is handled by the kernel associated with ASID 0).
+ * during the lifetime of the app/ASID, each resource allocated to it
+ * that can generate events (such as QP and CQ) is being associated by the
+ * dispatcher the appropriate ASID.
+ * During the course of work of the NIC, the HW EQ is accessed
+ * (by poling or interrupt), and for each event found in it
+ * - The resource ID which generated the event is retrieved from it (CQ# or QP#)
+ * - The ASID it retrieved from the ASID-resource association lists,
+ * - The event is inserted to the ASID-specific SW-EQ to be retrieved later on
+ *   by the app. An exception is the Eth driver which as for today is tightly
+ *   coupled with the EQ so the dispatcher calls the Eth event handling routine
+ *   (if registered) immediately after dispatching the events to the SW-EQs.
+ * Note: The Link events which are always handled by the Eth driver (ASID 0).
+ */
+
+struct hbl_cn_ev_dq *hbl_cn_cqn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 cqn,
+				      struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_properties *cn_prop = &hdev->cn_props;
+	struct hbl_cn_ev_dq *dq;
+
+	if (cqn >= cn_prop->max_cqs)
+		return NULL;
+
+	dq = ev_dqs->cq_dq[cqn];
+	if (!dq || !dq->associated)
+		return NULL;
+
+	return dq;
+}
+
+struct hbl_cn_ev_dq *hbl_cn_ccqn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 ccqn,
+				       struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_properties *cn_prop = &hdev->cn_props;
+	struct hbl_cn_ev_dq *dq;
+
+	if (ccqn >= cn_prop->max_ccqs)
+		return NULL;
+
+	dq = ev_dqs->ccq_dq[ccqn];
+	if (!dq || !dq->associated)
+		return NULL;
+
+	return dq;
+}
+
+struct hbl_cn_dq_qp_info *hbl_cn_get_qp_info(struct hbl_cn_ev_dqs *ev_dqs, u32 qpn)
+{
+	struct hbl_cn_dq_qp_info *qp_info = NULL;
+
+	hash_for_each_possible(ev_dqs->qps, qp_info, node, qpn)
+		if (qpn == qp_info->qpn)
+			return qp_info;
+
+	return NULL;
+}
+
+struct hbl_cn_ev_dq *hbl_cn_qpn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 qpn)
+{
+	struct hbl_cn_dq_qp_info *qp_info = hbl_cn_get_qp_info(ev_dqs, qpn);
+
+	if (qp_info)
+		return qp_info->dq;
+
+	return NULL;
+}
+
+struct hbl_cn_ev_dq *hbl_cn_dbn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 dbn,
+				      struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_properties *cn_prop = &hdev->cn_props;
+	struct hbl_cn_ev_dq *dq;
+
+	if (dbn >= cn_prop->max_db_fifos)
+		return NULL;
+
+	dq = ev_dqs->db_dq[dbn];
+	if (!dq || !dq->associated)
+		return NULL;
+
+	return dq;
+}
+
+struct hbl_cn_ev_dq *hbl_cn_asid_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 asid)
+{
+	struct hbl_cn_ev_dq *dq;
+	int i;
+
+	for (i = 0; i < NIC_NUM_CONCUR_ASIDS; i++) {
+		dq = &ev_dqs->edq[i];
+		if (dq->associated && dq->asid == asid)
+			return dq;
+	}
+
+	return NULL;
+}
+
+static void hbl_cn_dq_reset(struct hbl_cn_ev_dq *dq)
+{
+	struct hbl_cn_eq_raw_buf *buf = &dq->buf;
+
+	dq->overflow = 0;
+	buf->tail = 0;
+	buf->head = buf->tail;
+	buf->events_count = 0;
+	memset(buf->events, 0, sizeof(buf->events));
+}
+
+bool hbl_cn_eq_dispatcher_is_empty(struct hbl_cn_ev_dq *dq)
+{
+	return (dq->buf.events_count == 0);
+}
+
+bool hbl_cn_eq_dispatcher_is_full(struct hbl_cn_ev_dq *dq)
+{
+	return (dq->buf.events_count == (NIC_EQ_INFO_BUF_SIZE - 1));
+}
+
+void hbl_cn_eq_dispatcher_init(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	int i;
+
+	hash_init(ev_dqs->qps);
+	mutex_init(&ev_dqs->lock);
+
+	hbl_cn_dq_reset(&ev_dqs->default_edq);
+
+	for (i = 0; i < NIC_NUM_CONCUR_ASIDS; i++)
+		hbl_cn_dq_reset(&ev_dqs->edq[i]);
+
+	for (i = 0; i < NIC_DRV_MAX_CQS_NUM; i++)
+		ev_dqs->cq_dq[i] = NULL;
+
+	for (i = 0; i < NIC_DRV_NUM_DB_FIFOS; i++)
+		ev_dqs->db_dq[i] = NULL;
+}
+
+void hbl_cn_eq_dispatcher_fini(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_ev_dqs *edqs = ev_dqs;
+	struct hbl_cn_dq_qp_info *qp_info;
+	u32 port = cn_port->port;
+	struct hlist_node *tmp;
+	int i;
+
+	if (!hash_empty(edqs->qps))
+		dev_err(hdev->dev, "port %d dispatcher is closed while there are QPs in use\n",
+			port);
+
+	hash_for_each_safe(edqs->qps, i, tmp, qp_info, node) {
+		dev_err_ratelimited(hdev->dev, "port %d QP %d was not destroyed\n", port,
+				    qp_info->qpn);
+		hash_del(&qp_info->node);
+		kfree(qp_info);
+	}
+
+	mutex_destroy(&ev_dqs->lock);
+}
+
+void hbl_cn_eq_dispatcher_reset(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dqs *edqs = ev_dqs;
+	int i;
+
+	mutex_lock(&edqs->lock);
+
+	hbl_cn_dq_reset(&edqs->default_edq);
+
+	for (i = 0; i < NIC_NUM_CONCUR_ASIDS; i++)
+		hbl_cn_dq_reset(&edqs->edq[i]);
+
+	mutex_unlock(&edqs->lock);
+}
+
+int hbl_cn_eq_dispatcher_associate_dq(struct hbl_cn_port *cn_port, u32 asid)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+	int i, rc = -ENOSPC;
+
+	mutex_lock(&ev_dqs->lock);
+
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (dq) {
+		rc = 0;
+		goto exit;
+	}
+
+	for (i = 0; i < NIC_NUM_CONCUR_ASIDS; i++) {
+		dq = &ev_dqs->edq[i];
+		if (!dq->associated) {
+			dq->associated = true;
+			dq->asid = asid;
+			rc = 0;
+			break;
+		}
+	}
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_dissociate_dq(struct hbl_cn_port *cn_port, u32 asid)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+
+	mutex_lock(&ev_dqs->lock);
+
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (!dq)
+		goto exit;
+
+	hbl_cn_dq_reset(dq);
+	dq->associated = false;
+	dq->asid = U32_MAX;
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+
+	return 0;
+}
+
+int hbl_cn_eq_dispatcher_register_qp(struct hbl_cn_port *cn_port, u32 asid, u32 qp_id)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_dq_qp_info *qp_info;
+	struct hbl_cn_ev_dq *dq;
+	int rc = 0;
+
+	mutex_lock(&ev_dqs->lock);
+
+	/* check if such qp is already registered and if with the same asid */
+	dq = hbl_cn_qpn_to_dq(ev_dqs, qp_id);
+	if (dq) {
+		if (dq->asid != asid)
+			rc = -EINVAL;
+
+		goto exit;
+	}
+
+	/* find the dq associated with the given asid */
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (!dq) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	/* register the QP */
+	qp_info = kmalloc(sizeof(*qp_info), GFP_KERNEL);
+	if (!qp_info) {
+		rc = -ENOMEM;
+		goto exit;
+	}
+
+	qp_info->dq = dq;
+	qp_info->qpn = qp_id;
+	hash_add(ev_dqs->qps, &qp_info->node, qp_id);
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_unregister_qp(struct hbl_cn_port *cn_port, u32 qp_id)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_dq_qp_info *qp_info;
+
+	mutex_lock(&ev_dqs->lock);
+
+	qp_info = hbl_cn_get_qp_info(ev_dqs, qp_id);
+	if (qp_info) {
+		hash_del(&qp_info->node);
+		kfree(qp_info);
+	}
+
+	mutex_unlock(&ev_dqs->lock);
+
+	return 0;
+}
+
+int hbl_cn_eq_dispatcher_register_cq(struct hbl_cn_port *cn_port, u32 asid, u32 cqn)
+{
+	struct hbl_cn_properties *cn_prop = &cn_port->hdev->cn_props;
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+	int rc = 0;
+
+	if (cqn >= cn_prop->max_cqs)
+		return -EINVAL;
+
+	mutex_lock(&ev_dqs->lock);
+
+	/* check if such qp is already registered and if with the same
+	 * asid
+	 */
+	dq = ev_dqs->cq_dq[cqn];
+	if (dq) {
+		if (dq->asid != asid)
+			rc = -EINVAL;
+
+		goto exit;
+	}
+
+	/* find the dq associated with the given asid */
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (!dq) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	ev_dqs->cq_dq[cqn] = dq;
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_unregister_cq(struct hbl_cn_port *cn_port, u32 cqn)
+{
+	struct hbl_cn_properties *cn_prop = &cn_port->hdev->cn_props;
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+
+	if (cqn >= cn_prop->max_cqs)
+		return -EINVAL;
+
+	mutex_lock(&ev_dqs->lock);
+
+	ev_dqs->cq_dq[cqn] = NULL;
+
+	mutex_unlock(&ev_dqs->lock);
+
+	return 0;
+}
+
+int hbl_cn_eq_dispatcher_register_ccq(struct hbl_cn_port *cn_port, u32 asid, u32 ccqn)
+{
+	struct hbl_cn_properties *cn_prop = &cn_port->hdev->cn_props;
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+	int rc = 0;
+
+	if (ccqn >= cn_prop->max_ccqs)
+		return -EINVAL;
+
+	mutex_lock(&ev_dqs->lock);
+
+	/* check if such qp is already registered and if with the same asid */
+	dq = ev_dqs->ccq_dq[ccqn];
+	if (dq) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	/* find the dq associated with the given asid */
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (!dq) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	ev_dqs->ccq_dq[ccqn] = dq;
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_unregister_ccq(struct hbl_cn_port *cn_port, u32 asid, u32 ccqn)
+{
+	struct hbl_cn_properties *cn_prop = &cn_port->hdev->cn_props;
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+
+	if (ccqn >= cn_prop->max_ccqs)
+		return -EINVAL;
+
+	if (!hbl_cn_asid_to_dq(ev_dqs, asid))
+		return -ENODATA;
+
+	mutex_lock(&ev_dqs->lock);
+
+	ev_dqs->ccq_dq[ccqn] = NULL;
+
+	mutex_unlock(&ev_dqs->lock);
+
+	return 0;
+}
+
+int hbl_cn_eq_dispatcher_register_db(struct hbl_cn_port *cn_port, u32 asid, u32 dbn)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+	u32 min, max;
+	int rc = 0;
+
+	cn_port->hdev->asic_funcs->port_funcs->get_db_fifo_hw_id_range(cn_port, &min, &max);
+	if (dbn < min || dbn > max) {
+		dev_err(cn_port->hdev->dev,
+			"Failed to register dbn %u to the dispatcher (valid range %u-%u)\n", dbn,
+			min, max);
+		return -EINVAL;
+	}
+
+	mutex_lock(&ev_dqs->lock);
+
+	/* check if doorbell is already registered and if so is it with the same
+	 * asid
+	 */
+	dq = ev_dqs->db_dq[dbn];
+	if (dq) {
+		if (dq->asid != asid)
+			rc = -EINVAL;
+
+		goto exit;
+	}
+
+	/* find the dq associated with the given asid and transport */
+	dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+	if (!dq) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	ev_dqs->db_dq[dbn] = dq;
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_unregister_db(struct hbl_cn_port *cn_port, u32 dbn)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	u32 min, max;
+
+	cn_port->hdev->asic_funcs->port_funcs->get_db_fifo_hw_id_range(cn_port, &min, &max);
+	if (dbn < min || dbn > max) {
+		dev_err(cn_port->hdev->dev,
+			"Failed to unregister dbn %u from the dispatcher (valid range %u-%u)\n",
+			dbn, min, max);
+		return -EINVAL;
+	}
+
+	mutex_lock(&ev_dqs->lock);
+
+	ev_dqs->db_dq[dbn] = NULL;
+
+	mutex_unlock(&ev_dqs->lock);
+
+	return 0;
+}
+
+static int __hbl_cn_eq_dispatcher_enqueue(struct hbl_cn_port *cn_port, struct hbl_cn_ev_dq *dq,
+					  const struct hbl_cn_eqe *eqe)
+{
+	struct hbl_aux_dev *aux_dev = &cn_port->hdev->ib_aux_dev;
+	struct hbl_ib_aux_ops *aux_ops = aux_dev->aux_ops;
+
+	if (hbl_cn_eq_dispatcher_is_full(dq)) {
+		dq->overflow++;
+		return -ENOSPC;
+	}
+
+	memcpy(&dq->buf.events[dq->buf.head], eqe, min(sizeof(*eqe), sizeof(dq->buf.events[0])));
+	dq->buf.head = (dq->buf.head + 1) & (NIC_EQ_INFO_BUF_SIZE - 1);
+	dq->buf.events_count++;
+
+	/* If IB device exist, call work scheduler for hbl to poll eq */
+	if (aux_ops->eqe_work_schd)
+		aux_ops->eqe_work_schd(aux_dev, cn_port->port);
+
+	return 0;
+}
+
+/* Broadcast event to all user ASIDs */
+int hbl_cn_eq_dispatcher_enqueue_bcast(struct hbl_cn_port *cn_port, const struct hbl_cn_eqe *eqe)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_ev_dq *dq;
+	int i, rc = 0;
+
+	if (!hbl_cn_is_port_open(cn_port))
+		return 0;
+
+	mutex_lock(&ev_dqs->lock);
+
+	for (i = 0; i < NIC_NUM_CONCUR_ASIDS; i++) {
+		if (i == hdev->kernel_asid)
+			continue;
+
+		dq = hbl_cn_asid_to_dq(ev_dqs, i);
+		if (!dq)
+			continue;
+
+		rc = __hbl_cn_eq_dispatcher_enqueue(cn_port, dq, eqe);
+		if (rc) {
+			dev_dbg_ratelimited(cn_port->hdev->dev,
+					    "Port %d, failed to enqueue dispatcher for ASID %d. %d\n",
+					    cn_port->port, i, rc);
+			break;
+		}
+	}
+
+	mutex_unlock(&ev_dqs->lock);
+
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_enqueue(struct hbl_cn_port *cn_port, const struct hbl_cn_eqe *eqe)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_ev_dq *dq;
+	int rc;
+
+	if (!hbl_cn_is_port_open(cn_port))
+		return 0;
+
+	port_funcs = cn_port->hdev->asic_funcs->port_funcs;
+
+	mutex_lock(&ev_dqs->lock);
+
+	dq = port_funcs->eq_dispatcher_select_dq(cn_port, eqe);
+	if (!dq) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	rc = __hbl_cn_eq_dispatcher_enqueue(cn_port, dq, eqe);
+	if (rc)
+		dev_dbg_ratelimited(cn_port->hdev->dev,
+				    "Port %d, failed to enqueue dispatcher. %d\n", cn_port->port,
+				    rc);
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+	return rc;
+}
+
+int hbl_cn_eq_dispatcher_dequeue(struct hbl_cn_port *cn_port, u32 asid, struct hbl_cn_eqe *eqe,
+				 bool is_default)
+{
+	struct hbl_cn_ev_dqs *ev_dqs = &cn_port->ev_dqs;
+	struct hbl_cn_ev_dq *dq;
+	int rc;
+
+	mutex_lock(&ev_dqs->lock);
+
+	if (is_default)
+		dq = &ev_dqs->default_edq;
+	else
+		dq = hbl_cn_asid_to_dq(ev_dqs, asid);
+
+	if (!dq) {
+		rc = -ESRCH;
+		goto exit;
+	}
+
+	if (hbl_cn_eq_dispatcher_is_empty(dq)) {
+		rc = -ENODATA;
+		goto exit;
+	}
+
+	/* We do a copy here instead of returning a pointer since a reset or
+	 * destroy operation may occur after we return from the routine
+	 */
+	memcpy(eqe, &dq->buf.events[dq->buf.tail], min(sizeof(*eqe), sizeof(dq->buf.events[0])));
+
+	dq->buf.tail = (dq->buf.tail + 1) & (NIC_EQ_INFO_BUF_SIZE - 1);
+	dq->buf.events_count--;
+	rc = 0;
+
+exit:
+	mutex_unlock(&ev_dqs->lock);
+	return rc;
+}
+
+u32 hbl_cn_dram_readl(struct hbl_cn_device *hdev, u64 addr)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	return aux_ops->dram_readl(aux_dev, addr);
+}
+
+void hbl_cn_dram_writel(struct hbl_cn_device *hdev, u32 val, u64 addr)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	aux_ops->dram_writel(aux_dev, val, addr);
+}
+
+u32 hbl_cn_rreg(struct hbl_cn_device *hdev, u32 reg)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	return aux_ops->rreg(aux_dev, reg);
+}
+
+void hbl_cn_wreg(struct hbl_cn_device *hdev, u32 reg, u32 val)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	return aux_ops->wreg(aux_dev, reg, val);
+}
+
+int hbl_cn_reserve_wq_dva(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u64 wq_arr_size,
+			  u32 type, u64 *dva)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props;
+	int rc;
+
+	/* The Device VA block for WQ array is just reserved here. It will be backed by host
+	 * physical pages once the MMU mapping is done via hbl_map_vmalloc_range inside the
+	 * alloc_and_map_wq. Using host page alignment ensures we start with offset 0, both
+	 * on host and device side.
+	 */
+	rc = hbl_cn_reserve_dva_block(ctx, wq_arr_size, dva);
+	if (rc)
+		return rc;
+
+	wq_arr_props = &cn_port->wq_arr_props[type];
+
+	wq_arr_props->dva_base = *dva;
+	wq_arr_props->dva_size = wq_arr_size;
+
+	return 0;
+}
+
+void hbl_cn_unreserve_wq_dva(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type)
+{
+	struct hbl_cn_wq_array_properties *wq_arr_props = &cn_port->wq_arr_props[type];
+
+	hbl_cn_unreserve_dva_block(ctx, wq_arr_props->dva_base, wq_arr_props->dva_size);
+	wq_arr_props->dva_base = 0;
+}
+
+void hbl_cn_track_port_reset(struct hbl_cn_port *cn_port, u32 syndrome)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_reset_tracker *reset_tracker;
+	unsigned long timestamp_jiffies = jiffies;
+	u32 max_qp_error_syndromes;
+
+	max_qp_error_syndromes = hdev->cn_props.max_qp_error_syndromes;
+	if (syndrome >= max_qp_error_syndromes) {
+		dev_dbg(hdev->dev, "Invalid syndrome %u\n", syndrome);
+		return;
+	}
+
+	reset_tracker = &cn_port->reset_tracker[syndrome];
+
+	/* In case the timeout passed, reset the tracker parameters and return */
+	if (time_after_eq(timestamp_jiffies, reset_tracker->timeout_jiffies)) {
+		reset_tracker->num_seq_resets = 1;
+		reset_tracker->timeout_jiffies = timestamp_jiffies +
+						 msecs_to_jiffies(NIC_SEQ_RESETS_TIMEOUT_MS);
+		return;
+	}
+
+	reset_tracker->num_seq_resets++;
+
+	/* In case the max sequential resets was reached before we passed the timeout,
+	 * disable that port.
+	 */
+	if (reset_tracker->num_seq_resets == NIC_MAX_SEQ_RESETS) {
+		dev_err(hdev->dev,
+			"Disabling port %u due to %d sequential resets, syndrome %u\n",
+			cn_port->port, NIC_MAX_SEQ_RESETS, syndrome);
+		cn_port->disabled = true;
+	}
+}
+
+void hbl_cn_eq_handler(struct hbl_cn_port *cn_port)
+{
+	struct hbl_en_aux_ops *en_aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	struct hbl_cn_device *hdev;
+	struct hbl_cn_eqe eqe;
+	u32 port;
+
+	if (!cn_port->eq_handler_enable)
+		return;
+
+	hdev = cn_port->hdev;
+	aux_dev = &hdev->en_aux_dev;
+	en_aux_ops = aux_dev->aux_ops;
+	port = cn_port->port;
+
+	mutex_lock(&cn_port->control_lock);
+
+	if (!hbl_cn_is_port_open(cn_port)) {
+		dev_dbg(hdev->dev, "ignoring events while port %d closed", port);
+		goto out;
+	}
+
+	if (en_aux_ops->handle_eqe)
+		while (!hbl_cn_eq_dispatcher_dequeue(cn_port, hdev->kernel_asid, &eqe, false))
+			en_aux_ops->handle_eqe(aux_dev, port, &eqe);
+
+out:
+	mutex_unlock(&cn_port->control_lock);
+}
+
+void hbl_cn_get_self_hw_block_handle(struct hbl_cn_device *hdev, u64 address, u64 *handle)
+{
+	*handle = lower_32_bits(address) | (HBL_CN_MMAP_TYPE_BLOCK);
+	*handle <<= PAGE_SHIFT;
+}
+
+u32 hbl_cn_hw_block_handle_to_addr32(struct hbl_cn_device *hdev, u64 handle)
+{
+	return lower_32_bits(handle >> PAGE_SHIFT);
+}
+
+void *__hbl_cn_dma_alloc_coherent(struct hbl_cn_device *hdev, size_t size, dma_addr_t *dma_handle,
+				  gfp_t flag, const char *caller)
+{
+	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->dma_alloc_coherent(hdev, size, dma_handle, flag);
+}
+
+void __hbl_cn_dma_free_coherent(struct hbl_cn_device *hdev, size_t size, void *cpu_addr,
+				dma_addr_t dma_addr, const char *caller)
+{
+	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->dma_free_coherent(hdev, size, cpu_addr, dma_addr);
+}
+
+void *__hbl_cn_dma_pool_zalloc(struct hbl_cn_device *hdev, size_t size, gfp_t mem_flags,
+			       dma_addr_t *dma_handle, const char *caller)
+{
+	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	return asic_funcs->dma_pool_zalloc(hdev, size, mem_flags, dma_handle);
+}
+
+void __hbl_cn_dma_pool_free(struct hbl_cn_device *hdev, void *vaddr, dma_addr_t dma_addr,
+			    const char *caller)
+{
+	const struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+
+	asic_funcs->dma_pool_free(hdev, vaddr, dma_addr);
+}
+
+int hbl_cn_get_reg_pcie_addr(struct hbl_cn_device *hdev, u8 bar_id, u32 reg, u64 *pci_addr)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	u64 offset;
+	int rc;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	rc = aux_ops->get_reg_pcie_addr(aux_dev, reg, &offset);
+	if (rc)
+		return rc;
+
+	*pci_addr = pci_resource_start(hdev->pdev, bar_id) + offset;
+
+	return 0;
+}
+
+int hbl_cn_get_src_ip(struct hbl_cn_port *cn_port, u32 *src_ip)
+{
+	struct hbl_aux_dev *aux_dev = &cn_port->hdev->en_aux_dev;
+	struct hbl_en_aux_ops *aux_ops = aux_dev->aux_ops;
+	u32 port = cn_port->port;
+
+	if (cn_port->eth_enable && aux_ops->get_src_ip)
+		return aux_ops->get_src_ip(aux_dev, port, src_ip);
+
+	*src_ip = 0;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
new file mode 100644
index 000000000000..27139e93d990
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
@@ -0,0 +1,1627 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HABANALABS_CN_H_
+#define HABANALABS_CN_H_
+
+#include <linux/habanalabs/cpucp_if.h>
+#include <linux/net/intel/cni.h>
+#include <linux/net/intel/cn.h>
+
+#include <linux/bitfield.h>
+#include <linux/ctype.h>
+#include <linux/kfifo.h>
+#include <linux/netdevice.h>
+#include <linux/types.h>
+#include <linux/genalloc.h>
+
+/* Use upper bits of mmap offset to store habana CN driver specific information.
+ * bits[63:60] - Encode mmap type
+ * bits[45:0]  - mmap offset value
+ *
+ * NOTE: struct vm_area_struct.vm_pgoff uses offset in pages. Hence, these
+ *  defines are w.r.t to PAGE_SIZE
+ */
+#define HBL_CN_MMAP_TYPE_SHIFT			(60 - PAGE_SHIFT)
+#define HBL_CN_MMAP_TYPE_MASK			(0xfull << HBL_CN_MMAP_TYPE_SHIFT)
+#define HBL_CN_MMAP_TYPE_CN_MEM			(0x2ull << HBL_CN_MMAP_TYPE_SHIFT)
+#define HBL_CN_MMAP_TYPE_BLOCK			(0x1ull << HBL_CN_MMAP_TYPE_SHIFT)
+
+#define HBL_CN_MMAP_OFFSET_VALUE_MASK		(0x0FFFFFFFFFFFull >> PAGE_SHIFT)
+#define HBL_CN_MMAP_OFFSET_VALUE_GET(off)	((off) & HBL_CN_MMAP_OFFSET_VALUE_MASK)
+
+#define RREG32(reg)			hbl_cn_rreg(hdev, (reg))
+#define WREG32(reg, v)			hbl_cn_wreg(hdev, (reg), (v))
+#define WREG32_P(reg, val, mask)				\
+	do {							\
+		u32 __reg = (reg);				\
+		u32 tmp_ = RREG32(__reg);			\
+		u32 __mask = (mask);				\
+		tmp_ &= __mask;					\
+		tmp_ |= ((val) & ~__mask);			\
+		WREG32(__reg, tmp_);				\
+	} while (0)
+
+#define RMWREG32_SHIFTED(reg, val, mask) WREG32_P(reg, val, ~(mask))
+
+#define RMWREG32(reg, val, mask)					\
+	do {								\
+		u32 _mask = (mask);					\
+		RMWREG32_SHIFTED(reg, (val) << __ffs(_mask), _mask);	\
+	} while (0)
+
+#define __snprintf(buf, bsize, fmt, ...)						\
+	do {										\
+		size_t _bsize = (bsize);						\
+		char *_buf = (buf);							\
+		size_t _blen;								\
+											\
+		_blen = strlen(_buf);							\
+											\
+		if (_blen < _bsize)							\
+			snprintf(_buf + _blen, _bsize - _blen, fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+#define NIC_MAX_TNL_HDR_SIZE		32 /* Bytes */
+
+#define NIC_EQ_INFO_BUF_SIZE		256
+#define NIC_NUM_CONCUR_ASIDS		4
+#define RDMA_OFFSET			1
+
+#define NIC_QPC_INV_USEC		1000000 /* 1s */
+#define NIC_SIM_QPC_INV_USEC		(NIC_QPC_INV_USEC * 5)
+#define NIC_PLDM_QPC_INV_USEC		(NIC_QPC_INV_USEC * 10)
+
+#define NIC_SPMU_STATS_LEN_MAX		6
+
+#define NIC_TMR_TIMEOUT_DEFAULT_GRAN	13
+#define NIC_TMR_TIMEOUT_MAX_GRAN	31
+#define NIC_ADAPTIVE_TIMEOUT_RANGE	6
+#define NIC_GRAN_TO_USEC(gran)		(1UL << ((gran) + 2))
+#define NIC_TMR_RESET_FACTOR		3
+
+#define PARSE_FIELD(data, shift, size)		(((data) >> (shift)) & (BIT(size) - 1))
+#define MERGE_FIELDS(data_hi, data_lo, shift)	((data_hi) << (shift) | (data_lo))
+
+#define NIC_MACRO_CFG_SIZE		hdev->cn_props.macro_cfg_size
+#define NIC_MACRO_CFG_BASE(port)	(NIC_MACRO_CFG_SIZE * ((port) >> 1))
+
+#define NIC_MACRO_RREG32(reg)		RREG32(NIC_MACRO_CFG_BASE(port) + (reg))
+#define NIC_MACRO_WREG32(reg, val)	WREG32(NIC_MACRO_CFG_BASE(port) + (reg), (val))
+#define NIC_MACRO_RMWREG32(reg, val, mask) RMWREG32(NIC_MACRO_CFG_BASE(port) + (reg), val, mask)
+
+#define NIC_PORT_CHECK_ENABLE	BIT(0)
+#define NIC_PORT_CHECK_OPEN	BIT(1)
+#define NIC_PORT_PRINT_ON_ERR	BIT(2)
+#define NIC_PORT_CHECK_ALL	GENMASK(2, 0)
+
+#define QPC_REQ_BURST_SIZE	16
+#define QPC_REQ_SCHED_Q		3
+#define QPC_RES_SCHED_Q		2
+#define QPC_RAW_SCHED_Q		1
+
+#define REGMASK(V, F)		(((V) << F##_SHIFT) & F##_MASK)
+#define REGMASK2(V, F)		(((V) << F##_S) & F##_M)
+
+#define NIC_DR_10		1031250
+#define NIC_DR_25		2578125
+#define NIC_DR_26		2656250
+#define NIC_DR_50		5312500
+#define NIC_DR_100		10625000
+
+#define NIC_MAC_LANE_0		0U
+#define NIC_MAC_LANE_1		1U
+#define NIC_MAC_LANE_2		2U
+#define NIC_MAC_LANE_3		3U
+#define NIC_MAC_LANES		4U
+
+#define CC_CQE_SIZE		16
+#define USER_CCQ_MAX_ENTRIES	(BIT(21) / CC_CQE_SIZE) /* dma_alloc can only allocate 2M */
+#define USER_CCQ_MIN_ENTRIES	16
+
+#define DMA_COHERENT_MAX_SIZE	SZ_4M
+
+#define PHY_TX_TAPS_NUM		5
+
+#define ACCUMULATE_FEC_STATS_DURATION_MS	100 /* ms */
+#define ACCUMULATE_FEC_STATS_DURATION_MS_MAX	10000 /* ms */
+
+#define HBL_CN_BLOCK_SIZE	0x1000
+
+/* DMA alloc/free wrappers */
+#define hbl_cn_dma_alloc_coherent(hdev, size, dma_handle, flags) \
+	__hbl_cn_dma_alloc_coherent(hdev, size, dma_handle, flags, __func__)
+#define hbl_cn_dma_free_coherent(hdev, size, cpu_addr, dma_addr) \
+	__hbl_cn_dma_free_coherent(hdev, size, cpu_addr, dma_addr, __func__)
+
+#define hbl_cn_dma_pool_zalloc(hdev, size, mem_flags, dma_handle) \
+	__hbl_cn_dma_pool_zalloc(hdev, size, mem_flags, dma_handle, __func__)
+#define hbl_cn_dma_pool_free(hdev, vaddr, dma_addr) \
+	__hbl_cn_dma_pool_free(hdev, vaddr, dma_addr, __func__)
+
+extern struct hbl_cn_stat hbl_cn_mac_fec_stats[];
+extern struct hbl_cn_stat hbl_cn_mac_stats_rx[];
+extern struct hbl_cn_stat hbl_cn_mac_stats_tx[];
+extern size_t hbl_cn_mac_fec_stats_len;
+extern size_t hbl_cn_mac_stats_rx_len;
+extern size_t hbl_cn_mac_stats_tx_len;
+
+/**
+ * enum mtu_type - Describes QP's MTU value source.
+ * @MTU_INVALID: MTU is not configured yet.
+ * @MTU_FROM_USER: MTU gotten from user call to set requester context.
+ * @MTU_FROM_NETDEV: MTU gotten from netdev.
+ * @MTU_DEFAULT: Use default MTU value.
+ */
+enum mtu_type {
+	MTU_INVALID,
+	MTU_FROM_USER,
+	MTU_FROM_NETDEV,
+	MTU_DEFAULT
+};
+
+/**
+ * enum hbl_cn_qp_state - The states the QPs can be.
+ *                        Follows the spirit of "10.3.1 QUEUE PAIR AND EE CONTEXT STATES" section in
+ *                        InfiniBand(TM) Architecture Release.
+ * CN_QP_STATE_RESET: QP is in reset state
+ * CN_QP_STATE_INIT: Initialized state where all QP resources are allocated. QP can post Recv WRs.
+ * CN_QP_STATE_RTR: Ready to receive state. QP can post & process Rcv WRs & send ACKs,
+ * CN_QP_STATE_RTS: Ready to send state. QP can post and process recv & send WRs
+ * CN_QP_STATE_SQD: SQ is in drained state (a sub-state of the QP draining process).
+ * CN_QP_STATE_QPD: QP is in drained state, both RQ and SQ are drained.
+ * CN_QP_STATE_SQERR: Send queue error state. QP can Post & process Receive WRs, Send WRs are
+ *                    completed in error.
+ * CN_QP_STATE_ERR: Error state.
+ * CN_QP_NUM_STATE: Number of states the QP can be in.
+ */
+enum hbl_cn_qp_state {
+	CN_QP_STATE_RESET = 0,
+	CN_QP_STATE_INIT,
+	CN_QP_STATE_RTR,
+	CN_QP_STATE_RTS,
+	CN_QP_STATE_SQD,
+	CN_QP_STATE_QPD,
+	CN_QP_STATE_SQERR,
+	CN_QP_STATE_ERR,
+	CN_QP_NUM_STATE, /* must be last */
+};
+
+/**
+ * enum hbl_cn_qp_state_op - The Valid state transition operations on QP.
+ * CN_QP_OP_INVAL: Invalid OP, indicates invalid state transition path, not to be used. Must be 0.
+ * CN_QP_OP_RST_2INIT: Move the QP from the Reset state to the Init state.
+ * CN_QP_OP_INIT_2RTR: Move the QP from the Init state to the Ready-to-receive state.
+ * CN_QP_OP_RTR_2RTR: Reconfig Responder.
+ * CN_QP_OP_RTR_2QPD: drain the Responder.
+ * CN_QP_OP_RTR_2RTS: Move the QP from RTR state to the Ready-to-send state.
+ * CN_QP_OP_RTR_2SQD: Move the QP from RTR state to the drained state.
+ * CN_QP_OP_RTS_2RTS: Reconfigure the requester.
+ * CN_QP_OP_RTS_2SQERR: move the QP from RTS to the SQER state due to HW errors.
+ * CN_QP_OP_RTS_2SQD: Drain the SQ and move to the SQ-Drained state.
+ * CN_QP_OP_RTS_2QPD: drain the QP (requester and responder).
+ * CN_QP_OP_SQD_2SQD: Re-drain the SQ.
+ * CN_QP_OP_SQD_2QPD: Drain the QP (Responder too).
+ * CN_QP_OP_SQD_2RTS: Enable the requester after draining is done.
+ * CN_QP_OP_SQD_2SQ_ERR: move the QP to SQ_Err due to HW error.
+ * CN_QP_OP_QPD_2RTR: restart the Responder.
+ * CN_QP_OP_QPD_2QPD: drain the QP (again).
+ * CN_QP_OP_SQ_ERR_2SQD: recover from SQ err and return to work
+ * CN_QP_OP_2ERR: Place the QP in error state (due to HW errors).
+ *                An error can be forced from any state, except Reset.
+ * CN_QP_OP_2RESET: Move to reset state.
+ *                  it is possible to transition from any state to the Reset state.
+ * CN_QP_OP_NOP: Do nothing.
+ */
+enum hbl_cn_qp_state_op {
+	CN_QP_OP_INVAL = 0,
+	CN_QP_OP_RST_2INIT,
+	CN_QP_OP_INIT_2RTR,
+	CN_QP_OP_RTR_2RTR,
+	CN_QP_OP_RTR_2QPD,
+	CN_QP_OP_RTR_2RTS,
+	CN_QP_OP_RTR_2SQD,
+	CN_QP_OP_RTS_2RTS,
+	CN_QP_OP_RTS_2SQERR,
+	CN_QP_OP_RTS_2SQD,
+	CN_QP_OP_RTS_2QPD,
+	CN_QP_OP_SQD_2SQD,
+	CN_QP_OP_SQD_2QPD,
+	CN_QP_OP_SQD_2RTS,
+	CN_QP_OP_SQD_2SQ_ERR,
+	CN_QP_OP_QPD_2RTR,
+	CN_QP_OP_QPD_2QPD,
+	CN_QP_OP_SQ_ERR_2SQD,
+	CN_QP_OP_2ERR,
+	CN_QP_OP_2RESET,
+	CN_QP_OP_NOP,
+};
+
+/**
+ * enum db_fifo_state - Describes db fifo's current state. Starting it from 1 because by default
+ *                      on reset when the state is 0, it shouldn't be confused as Allocated state.
+ * @DB_FIFO_STATE_ALLOC: db fifo id has been allocated.
+ * @DB_FIFO_STATE_SET: db fifo set is done for the corresponding id.
+ */
+enum db_fifo_state {
+	DB_FIFO_STATE_ALLOC = 1,
+	DB_FIFO_STATE_SET,
+};
+
+/**
+ * struct hbl_cn_qp_reset_mode - QP reset method.
+ * @CN_QP_RESET_MODE_GRACEFUL: Graceful reset, reset the QP components in an orderly manner and wait
+ *                             on each component to settle before moving to the next step.
+ * @CN_QP_RESET_MODE_FAST: Fast reset, reset the QP components in an orderly manner, without waiting
+ *                         for the components to settle .
+ * @CN_QP_RESET_MODE_HARD: Clear the QP contexts immediately.
+ */
+enum hbl_cn_qp_reset_mode {
+	CN_QP_RESET_MODE_GRACEFUL = 0,
+	CN_QP_RESET_MODE_FAST = 1,
+	CN_QP_RESET_MODE_HARD = 2,
+};
+
+/**
+ * enum hbl_cn_user_cq_state - User CQ states.
+ * @USER_CQ_STATE_ALLOC: ID allocated.
+ * @USER_CQ_STATE_SET: HW configured. Resources allocated.
+ * @USER_CQ_STATE_ALLOC_TO_UNSET: CQ moved to unset state from alloc state directly.
+ * @USER_CQ_STATE_SET_TO_UNSET: CQ moved to unset from set state. HW config cleared.
+ *                              Resources ready to be reclaimed.
+ */
+enum hbl_cn_user_cq_state {
+	USER_CQ_STATE_ALLOC = 1,
+	USER_CQ_STATE_SET,
+	USER_CQ_STATE_ALLOC_TO_UNSET,
+	USER_CQ_STATE_SET_TO_UNSET,
+};
+
+/**
+ * enum hbl_cn_drv_mem_id - Memory allocation methods:
+ * HBL_CN_DRV_MEM_INVALID: N/A option.
+ * HBL_CN_DRV_MEM_HOST_DMA_COHERENT: Host DMA coherent memory.
+ * HBL_CN_DRV_MEM_HOST_VIRTUAL: Host virtual memory.
+ * HBL_CN_DRV_MEM_DEVICE: Device HBM memory.
+ * HBL_CN_DRV_MEM_HOST_MAP_ONLY: Host mapping only.
+ */
+enum hbl_cn_drv_mem_id {
+	HBL_CN_DRV_MEM_INVALID,
+	HBL_CN_DRV_MEM_HOST_DMA_COHERENT,
+	HBL_CN_DRV_MEM_HOST_VIRTUAL,
+	HBL_CN_DRV_MEM_DEVICE,
+	HBL_CN_DRV_MEM_HOST_MAP_ONLY,
+};
+
+struct hbl_cn_port;
+struct hbl_cn_device;
+struct hbl_cn_macro;
+
+/**
+ * struct hbl_cn_dq_qp_info - structure to hold qp info for dispatch queue.
+ * @node: reference to a QP within the list
+ * @dq: dq per asid event dispatcher queue
+ * @qpn: QP id
+ */
+struct hbl_cn_dq_qp_info {
+	struct hlist_node node;
+	struct hbl_cn_ev_dq *dq;
+	u32 qpn;
+};
+
+/**
+ * struct hbl_cn_eq_raw_buf - a buffer holding unparsed raw EQ events
+ * @events: an array which stores the events
+ * @head: the queue head
+ * @tail: the queue tail
+ * @events_count: number of available events in the queue
+ */
+struct hbl_cn_eq_raw_buf {
+	struct hbl_cn_eqe events[NIC_EQ_INFO_BUF_SIZE];
+	u32 head;
+	u32 tail;
+	u32 events_count;
+};
+
+/**
+ * struct hbl_cn_ev_dq - per-asid/app event dispatch queue
+ * @buf: the dispatched events queue.
+ * @asid: the asid registered on this dq
+ * @overflow: buffer overflow counter
+ * @associated: if this dq associate with a user/asid or not.
+ */
+struct hbl_cn_ev_dq {
+	struct hbl_cn_eq_raw_buf buf;
+	u32 asid;
+	u32 overflow;
+	u8 associated;
+};
+
+/**
+ * struct hbl_cn_ev_dqs - software managed events dispatch queues.
+ *                        used for dispatching events to their applications.
+ * @qps: a hash table to convert QP-numbers to their owner (ASID).
+ * @cq_dq: array to associate/convert cq-numbers to the dispatch queues.
+ * @ccq_dq: array to associate/convert ccq-numbers to the dispatch queues.
+ * @db_dq: array to associate/convert doorbell-numbers to the dispatch queues.
+ * @edq: the events dispatch queues (as many queues as the number of possible same-time ASIDs).
+ * @default_edq: default events dispatch queue for unknown resources and events.
+ * @lock: protects from simultaneous operations.
+ */
+struct hbl_cn_ev_dqs {
+	DECLARE_HASHTABLE(qps, 11);
+	struct hbl_cn_ev_dq *cq_dq[NIC_DRV_MAX_CQS_NUM];
+	struct hbl_cn_ev_dq *ccq_dq[NIC_DRV_MAX_CCQS_NUM];
+	struct hbl_cn_ev_dq *db_dq[NIC_DRV_NUM_DB_FIFOS];
+	struct hbl_cn_ev_dq edq[NIC_NUM_CONCUR_ASIDS];
+	struct hbl_cn_ev_dq default_edq;
+	/* protects from simultaneous operations */
+	struct mutex lock;
+};
+
+/**
+ * struct hbl_cn_qp_info - holds information of a QP to read via debugfs.
+ * @port: the port the QP belongs to.
+ * @qpn: QP number.
+ * @req: true for requester QP, otherwise responder.
+ * @full_print: print full QP information.
+ * @force_read: force reading a QP in invalid/error state.
+ */
+struct hbl_cn_qp_info {
+	u32 port;
+	u32 qpn;
+	u8 req;
+	u8 full_print;
+	u8 force_read;
+};
+
+/**
+ * struct hbl_cn_wqe_info - holds information of a WQE to read via debugfs.
+ * @port: the port the WQE belongs to.
+ * @qpn: QP number.
+ * @wqe_idx: WQE index.
+ * @tx: true for tx WQE, otherwise rx WQE.
+ */
+struct hbl_cn_wqe_info {
+	u32 port;
+	u32 qpn;
+	u32 wqe_idx;
+	u8 tx;
+};
+
+/**
+ * struct hbl_cn_db_fifo_xarray_pdata - Holds private data of userspace doorbell xarray
+ * @asid: Associated user context.
+ * @port: Associated port index.
+ * @id: fifo index.
+ * @ci_mmap_handle: Consumer index mmap handle.
+ * @umr_mmap_handle: UMR block mmap handle.
+ * @umr_db_offset: db fifo offset in UMR block.
+ * @state: db fifo's state.
+ * @db_pool_addr: offset of the allocated address in gen pool.
+ * @fifo_offset: actual fifo offset allocated for that id.
+ * @fifo_size: size of the fifo allocated.
+ * @fifo_mode: mode of the fifo as received in the IOCTL.
+ */
+struct hbl_cn_db_fifo_xarray_pdata {
+	u32 asid;
+	u32 port;
+	u32 id;
+	u64 ci_mmap_handle;
+	u64 umr_mmap_handle;
+	u32 umr_db_offset;
+	enum db_fifo_state state;
+	u32 db_pool_addr;
+	u32 fifo_offset;
+	u32 fifo_size;
+	u8 fifo_mode;
+};
+
+/**
+ * struct hbl_cn_encap_xarray_pdata - Holds private data of userspace encapsulation xarray
+ * @port: Associated port index
+ * @id: Encapsulation ID
+ * @src_ip: Source port IPv4 address.
+ * @encap_type: L3/L4 encapsulation
+ * @encap_type_data: IPv4 protocol or UDP port
+ * @encap_header: Encapsulation header
+ * @encap_header_size: Encapsulation header size
+ * @is_set: True if encap was set, false otherwise
+ */
+struct hbl_cn_encap_xarray_pdata {
+	u32 port;
+	u32 id;
+	u32 src_ip;
+	enum hbl_nic_encap_type encap_type;
+	u32 encap_type_data;
+	void *encap_header;
+	u32 encap_header_size;
+	u8 is_set;
+};
+
+/**
+ * struct hbl_cn_user_cq - user CQ data.
+ * @cn_port: associated port.
+ * @refcount: number of QPs that use this CQ.
+ * @ctx: Associated user context.
+ * @state: User CQ state.
+ * @overrun_lock: protects the setting\unsetting of CQ overrun.
+ * @mem_handle: mmap handle of buffer memory.
+ * @pi_handle: mmap handle of PI memory.
+ * @id: CQ ID.
+ * @qp_set_overrun_cnt: number of QPs which expect CQ overrun to be enabled.
+ * @is_mmu_bp: is MMU bypass enabled for the memory buffer.
+ */
+struct hbl_cn_user_cq {
+	struct hbl_cn_port *cn_port;
+	struct kref refcount;
+	struct hbl_cn_ctx *ctx;
+	enum hbl_cn_user_cq_state state;
+	/* protects the setting\unsetting of CQ overrun */
+	struct mutex overrun_lock;
+	u64 mem_handle;
+	u64 pi_handle;
+	u32 id;
+	u32 qp_set_overrun_cnt;
+	u8 is_mmu_bp;
+};
+
+/**
+ * struct hbl_cn_wq_array_properties - WQ array properties.
+ * @type_str: string of this WQ array type.
+ * @handle: handle for this WQ array.
+ * @dva_base: reserved device VA for this WQ array.
+ * @dva_size: size in bytes of device VA block of this WQ array.
+ * @wq_size: size in bytes of each WQ in this WQ array.
+ * @idx: index of this WQ array.
+ * @offset: offset inside the memory chunk.
+ * @under_unset: true if this WQ array is waiting for unset (will be done when all QPs are
+ *               destroyed), false otherwise.
+ * @on_device_mem: true if this WQ array resides on HBM, false if on host.
+ * @is_send: true if this WQ array should contain send WQEs, false if recv WQEs.
+ * @wq_mmu_bypass: true if WQs has MMU-BP access, false otherwise.
+ * @enabled: true if this WQ array is enabled, false otherwise.
+ */
+struct hbl_cn_wq_array_properties {
+	char *type_str;
+	u64 handle;
+	u64 dva_base;
+	u64 dva_size;
+	u64 wq_size;
+	u32 idx;
+	u32 offset;
+	u8 under_unset;
+	u8 on_device_mem;
+	u8 is_send;
+	u8 wq_mmu_bypass;
+	u8 enabled;
+};
+
+/**
+ * struct hbl_cn_reset_tracker - port reset tracking information.
+ * @timeout_jiffies: end of the measurement window.
+ * @num_seq_resets: how many sequential resets were triggered inside the measurement window.
+ */
+struct hbl_cn_reset_tracker {
+	unsigned long timeout_jiffies;
+	u8 num_seq_resets;
+};
+
+/**
+ * struct hbl_cn_mem_buf - describes a memory allocation.
+ * @ctx: pointer to the context this memory belongs to.
+ * @bus_address: Holds the memory's DMA address.
+ * @kernel_address: Holds the memory's kernel virtual address.
+ * @refcount: reference counter for buffer users.
+ * @mmap: atomic boolean indicating whether or not the buffer is mapped right now.
+ * @real_mapped_size: the actual size of buffer mapped, after part of it may be released, may
+ *                    change at runtime.
+ * @mappable_size: the original mappable size of the buffer, does not change after the allocation.
+ * @device_addr: Holds the HBM address.
+ * @device_va: Device virtual address. Valid only for MMU mapped allocations.
+ * @handle: The buffer id that is stored in the mem xarray.
+ * @mem_id: specify host/device memory allocation.
+ * @is_destroyed: Indicates whether or not the memory was destroyed.
+ */
+struct hbl_cn_mem_buf {
+	struct hbl_cn_ctx *ctx;
+	dma_addr_t bus_address;
+	void *kernel_address;
+	struct kref refcount;
+	atomic_t mmap;
+	u64 real_mapped_size;
+	u64 mappable_size;
+	u64 device_addr;
+	u64 device_va;
+	u64 handle;
+	u32 mem_id;
+	atomic_t is_destroyed;
+};
+
+/**
+ * struct hbl_cn_qp - Describes a Queue Pair.
+ * @cn_port: Pointer to the port this QP belongs to.
+ * @async_work: async work performed on QP, when destroying the QP.
+ * @adaptive_tmr_reset: reset work performed on QP, for adaptive timer.
+ * @req_user_cq: CQ ID used by the requester context.
+ * @res_user_cq: CQ ID used by the responder context.
+ * @ctx: Associated user context.
+ * @curr_state: The current state of the QP.
+ * @mtu_type: Source of MTU value from user, from netdev or default.
+ * @swq_handle: Send WQ mmap handle.
+ * @rwq_handle: Receive WQ mmap handle.
+ * @port: The port number this QP belongs to.
+ * @qp_id: The QP number within its port.
+ * @local_key: Key for local access.
+ * @remote_key: Key for remote access.
+ * @mtu: Current MTU value.
+ * @swq_size: Send WQ mmap size.
+ * @rwq_size: Receive WQ mmap size.
+ * @is_req: is requester context was set for the QP.
+ * @is_res: is responder context was set for the QP.
+ * @force_cq_overrun: force CQ overrun, if needed, during destruction phase.
+ * @timeout_granularity: User supplied granularity value.
+ * @timeout_curr: Currently used granularity value.
+ */
+struct hbl_cn_qp {
+	struct hbl_cn_port *cn_port;
+	struct work_struct async_work;
+	struct delayed_work adaptive_tmr_reset;
+	struct hbl_cn_user_cq *req_user_cq;
+	struct hbl_cn_user_cq *res_user_cq;
+	struct hbl_cn_ctx *ctx;
+	enum hbl_cn_qp_state curr_state;
+	enum mtu_type mtu_type;
+	u64 swq_handle;
+	u64 rwq_handle;
+	u32 port;
+	u32 qp_id;
+	u32 local_key;
+	u32 remote_key;
+	u32 mtu;
+	u32 swq_size;
+	u32 rwq_size;
+	u8 is_req;
+	u8 is_res;
+	u8 force_cq_overrun;
+	u8 timeout_granularity;
+	u8 timeout_curr;
+};
+
+/**
+ * enum qp_conn_state - State of retransmission flow.
+ * @QP_CONN_STATE_OPEN: connection is open.
+ * @QP_CONN_STATE_CLOSED: connection is closed.
+ * @QP_CONN_STATE_RESYNC: Connection is re-synchronizing.
+ * @QP_CONN_STATE_ERROR: Connection is in error state.
+ */
+enum qp_conn_state {
+	QP_CONN_STATE_OPEN = 0,
+	QP_CONN_STATE_CLOSED = 1,
+	QP_CONN_STATE_RESYNC = 2,
+	QP_CONN_STATE_ERROR = 3,
+};
+
+/**
+ * struct hbl_cn_qpc_attr - QPC attributes as read from the HW.
+ * @valid: QPC is valid.
+ * @in_work: qp was scheduled to work.
+ * @error: QPC is in error state (relevant in Req QPC only).
+ * @conn_state - state of retransmission flow (relevant in Res QPC only).
+ */
+struct hbl_cn_qpc_attr {
+	u8 valid;
+	u8 in_work;
+	u8 error;
+	enum qp_conn_state conn_state;
+};
+
+/**
+ * struct hbl_cn_qpc_reset_attr - attributes used when setting QP state to reset.
+ * @reset_mode: the type/mode of reset to be used.
+ */
+struct hbl_cn_qpc_reset_attr {
+	enum hbl_cn_qp_reset_mode reset_mode;
+};
+
+/**
+ * struct hbl_cn_qpc_drain_attr - QPC attributes used for draining operation.
+ * @wait_for_idle: wait for QPC to become idle.
+ */
+struct hbl_cn_qpc_drain_attr {
+	bool wait_for_idle;
+};
+
+/**
+ * struct hbl_cn_mem_data - memory allocation metadata.
+ * @in: mem_id specific allocation parameters.
+ * @in.device_mem_data: mem_id HBL_CN_DRV_MEM_DEVICE specific allocation parameters.
+ * @in.device_mem_data.port: Associated port index.
+ * @in.device_mem_data.type: enum hbl_nic_mem_type to be allocated.
+ * @in.host_map_data: mem_id HBL_CN_DRV_MEM_HOST_MAP_ONLY specific mapping parameters.
+ * @in.host_map_data.bus_address: Memory DMA address.
+ * @in.host_map_data.kernel_address: Memory kernel virtual address.
+ * @mem_id: Allocation type, enum hbl_cn_mem_id.
+ * @size: Allocation size.
+ * @device_va: Device virtual address. Valid only for MMU mapped allocation.
+ * @handle: Returned mmap handle.
+ * @addr: Returned allocation address.
+ */
+struct hbl_cn_mem_data {
+	union {
+		/* HBL_CN_DRV_MEM_DEVICE */
+		struct {
+			u32 port;
+			enum hbl_nic_mem_type type;
+		} device_mem_data;
+
+		/* HBL_CN_DRV_MEM_HOST_MAP_ONLY */
+		struct {
+			dma_addr_t bus_address;
+			void *kernel_address;
+		} host_map_data;
+	} in;
+
+	/* Common in params */
+	enum hbl_cn_drv_mem_id mem_id;
+	u64 size;
+	u64 device_va;
+
+	/* Common out params */
+	u64 handle;
+	u64 addr;
+};
+
+/**
+ * struct hbl_cni_user_cq_set_in_params - user CQ configuration in params.
+ * @port: port index.
+ * @num_of_cqes: Number of CQ entries in the buffer.
+ * @id: CQ ID.
+ */
+struct hbl_cni_user_cq_set_in_params {
+	u32 port;
+	u32 num_of_cqes;
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_cq_set_out_params - user CQ configuration out params.
+ * @mem_handle: Handle of CQ memory buffer.
+ * @pi_handle: Handle of CQ producer-inder memory buffer.
+ * @regs_handle: Handle of CQ Registers base-address.
+ * @regs_offset: CQ Registers sub-offset.
+ */
+struct hbl_cni_user_cq_set_out_params {
+	u64 mem_handle;
+	u64 pi_handle;
+	u64 regs_handle;
+	u32 regs_offset;
+};
+
+/**
+ * struct hbl_cni_user_cq_unset_in_params - user CQ unconfiguration in params.
+ * @port: port index.
+ * @id: CQ ID.
+ */
+struct hbl_cni_user_cq_unset_in_params {
+	u32 port;
+	u32 id;
+};
+
+/**
+ * struct hbl_cn_cpucp_status - describes the status of a port.
+ * @port: port index.
+ * @bad_format_cnt: e.g. CRC.
+ * @responder_out_of_sequence_psn_cnt: e.g NAK.
+ * @high_ber_reinit_cnt: link reinit due to high BER.
+ * @correctable_err_cnt: e.g. bit-flip.
+ * @uncorrectable_err_cnt: e.g. MAC errors.
+ * @retraining_cnt: re-training counter.
+ * @up: is port up.
+ * @pcs_link: has PCS link.
+ * @phy_ready: is PHY ready.
+ * @auto_neg: is Autoneg enabled.
+ * @timeout_retransmission_cnt: timeout retransmission events.
+ * @high_ber_cnt: high ber events.
+ * @pre_fec_ser: pre FEC SER value.
+ * @post_fec_ser: post FEC SER value.
+ * @bandwidth: measured bandwidth.
+ * @lat: measured latency.
+ * @port_toggle_cnt: counts how many times the link toggled since last port PHY init.
+ */
+struct hbl_cn_cpucp_status {
+	u32 port;
+	u32 bad_format_cnt;
+	u32 responder_out_of_sequence_psn_cnt;
+	u32 high_ber_reinit;
+	u32 correctable_err_cnt;
+	u32 uncorrectable_err_cnt;
+	u32 retraining_cnt;
+	u8 up;
+	u8 pcs_link;
+	u8 phy_ready;
+	u8 auto_neg;
+	u32 timeout_retransmission_cnt;
+	u32 high_ber_cnt;
+	struct hbl_cn_cpucp_ser_val pre_fec_ser;
+	struct hbl_cn_cpucp_ser_val post_fec_ser;
+	struct hbl_cn_cpucp_frac_val bandwidth;
+	struct hbl_cn_cpucp_frac_val lat;
+	u32 port_toggle_cnt;
+};
+
+/**
+ * struct hbl_cn_asic_port_funcs - ASIC specific functions that are can be called from common code
+ *                                 for a specific port.
+ * @port_hw_init: initialize the port HW.
+ * @port_hw_fini: cleanup the port HW.
+ * @phy_port_init: port PHY init.
+ * @phy_port_start_stop: port PHY start/stop.
+ * @phy_port_power_up: port PHY power-up.
+ * @phy_port_reconfig: port PHY reconfigure.
+ * @phy_port_fini: port PHY cleanup.
+ * @phy_link_status_work: link status handler.
+ * @update_mtu: updates MTU inside a requestor QP context.
+ * @user_wq_arr_unset: unset user WQ array (check whether user_wq_lock should be taken).
+ * @get_cq_id_range: get user CQ ID range.
+ * @user_cq_set: set user CQ.
+ * @user_cq_unset: unset user CQ.
+ * @user_cq_destroy: destroy user CQ.
+ * @get_cnts_num: get the number of available counters.
+ * @get_cnts_names: get the names of the available counters.
+ * @get_cnts_values: get the values of the available counters.
+ * @port_sw_init: initialize per port software components.
+ * @port_sw_fini: finalize per port software components.
+ * @register_qp: register a new qp-id with the NIC.
+ * @unregister_qp: unregister a qp.
+ * @get_qp_id_range: Get unsecure QP ID range.
+ * @eq_poll: poll the EQ for asid/app-specific events.
+ * @get_db_fifo_id_range: Get the fifo ID range that is available to the user.
+ * @get_db_fifo_hw_id_range: Get the actual HW fifo ID range.
+ * @db_fifo_set: Config unsecure userspace doorbell fifo.
+ * @db_fifo_unset: Destroy unsecure userspace doorbell fifo.
+ * @get_db_fifo_umr: Get UMR block address and db fifo offset.
+ * @get_db_fifo_modes_mask: Get the supported db fifo modes
+ * @db_fifo_allocate: Allocate fifo for the specific mode
+ * @db_fifo_free: Free the fifo for the specific id
+ * @set_pfc: enable/disable PFC.
+ * @get_encap_id_range: Get user encapsulation ID range
+ * @encap_set: Start encapsulation
+ * @encap_unset: Stop encapsulation
+ * @set_ip_addr_encap: Setup IP address encapsulation.
+ * @qpc_write: write a QP context to the HW.
+ * @qpc_invalidate: invalidate a QP context.
+ * @qpc_query: read a QP context.
+ * @qpc_clear: clear a QP context.
+ * @user_ccq_set: set user congestion completion queue.
+ * @user_ccq_unset: unset user congestion completion queue.
+ * @reset_mac_stats: reset MAC statistics.
+ * @collect_fec_stats: collect FEC statistics.
+ * @disable_wqe_index_checker: Disable WQE index checker for both Rx and Tx.
+ * @get_status: get status information for F/W.
+ * @cfg_lock: acquire the port configuration lock.
+ * @cfg_unlock: release the port configuration lock.
+ * @cfg_is_locked: check if the port configuration lock is locked.
+ * @qp_pre_destroy: prepare for a QP destroy. Called under the cfg lock.
+ * @qp_post_destroy: cleanup after a QP destroy. Called under the cfg lock.
+ * @set_port_status: config port status before notifying user.
+ * @send_cpucp_packet: Send cpucp packet to FW.
+ * @adaptive_tmr_reset: Reset timer granularity for adaptive timeout feature.
+ * @spmu_get_stats_info: get SPMU statistics information.
+ * @spmu_config: config the SPMU.
+ * @spmu_sample: read SPMU counters.
+ * @post_send_status: handler for post sending status packet to FW.
+ */
+struct hbl_cn_asic_port_funcs {
+	int (*port_hw_init)(struct hbl_cn_port *cn_port);
+	void (*port_hw_fini)(struct hbl_cn_port *cn_port);
+	int (*phy_port_init)(struct hbl_cn_port *cn_port);
+	void (*phy_port_start_stop)(struct hbl_cn_port *cn_port, bool is_start);
+	int (*phy_port_power_up)(struct hbl_cn_port *cn_port);
+	void (*phy_port_reconfig)(struct hbl_cn_port *cn_port);
+	void (*phy_port_fini)(struct hbl_cn_port *cn_port);
+	void (*phy_link_status_work)(struct work_struct *work);
+	int (*update_qp_mtu)(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, u32 mtu);
+	int (*user_wq_arr_unset)(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type);
+	void (*get_cq_id_range)(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id);
+	int (*user_cq_set)(struct hbl_cn_user_cq *user_cq, struct hbl_cni_user_cq_set_in_params *in,
+			   struct hbl_cni_user_cq_set_out_params *out);
+	int (*user_cq_unset)(struct hbl_cn_user_cq *user_cq);
+	void (*user_cq_destroy)(struct hbl_cn_user_cq *user_cq);
+	int (*get_cnts_num)(struct hbl_cn_port *cn_port);
+	void (*get_cnts_names)(struct hbl_cn_port *cn_port, u8 *data, bool ext);
+	void (*get_cnts_values)(struct hbl_cn_port *cn_port, u64 *data);
+	int (*port_sw_init)(struct hbl_cn_port *cn_port);
+	void (*port_sw_fini)(struct hbl_cn_port *cn_port);
+	int (*register_qp)(struct hbl_cn_port *cn_port, u32 qp_id, u32 asid);
+	void (*unregister_qp)(struct hbl_cn_port *cn_port, u32 qp_id);
+	void (*get_qp_id_range)(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id);
+	int (*eq_poll)(struct hbl_cn_port *cn_port, u32 asid,
+		       struct hbl_cni_eq_poll_out *event);
+	struct hbl_cn_ev_dq * (*eq_dispatcher_select_dq)(struct hbl_cn_port *cn_port,
+							 const struct hbl_cn_eqe *eqe);
+	void (*get_db_fifo_id_range)(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id);
+	void (*get_db_fifo_hw_id_range)(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id);
+	int (*db_fifo_set)(struct hbl_cn_port *cn_port, struct hbl_cn_ctx *ctx, u32 id,
+			   u64 ci_device_handle, struct hbl_cn_db_fifo_xarray_pdata *xa_pdata);
+	void (*db_fifo_unset)(struct hbl_cn_port *cn_port, u32 id,
+			      struct hbl_cn_db_fifo_xarray_pdata *xa_pdata);
+	void (*get_db_fifo_umr)(struct hbl_cn_port *cn_port, u32 id,
+				u64 *umr_block_addr, u32 *umr_db_offset);
+	void (*get_db_fifo_modes_mask)(struct hbl_cn_port *cn_port, u32 *mode_mask);
+	int (*db_fifo_allocate)(struct hbl_cn_port *cn_port,
+				struct hbl_cn_db_fifo_xarray_pdata *xa_pdata);
+	void (*db_fifo_free)(struct hbl_cn_port *cn_port, u32 db_pool_addr, u32 fifo_size);
+	int (*set_pfc)(struct hbl_cn_port *cn_port);
+	void (*get_encap_id_range)(struct hbl_cn_port *cn_port, u32 *min_id, u32 *max_id);
+	int (*encap_set)(struct hbl_cn_port *cn_port, u32 encap_id,
+			 struct hbl_cn_encap_xarray_pdata *xa_pdata);
+	void (*encap_unset)(struct hbl_cn_port *cn_port, u32 encap_id,
+			    struct hbl_cn_encap_xarray_pdata *xa_pdata);
+	void (*set_ip_addr_encap)(struct hbl_cn_port *cn_port, u32 *encap_id, u32 src_ip);
+	int (*qpc_write)(struct hbl_cn_port *cn_port, void *qpc, struct qpc_mask *qpc_mask,
+			 u32 qpn, bool is_req);
+	int (*qpc_invalidate)(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, bool is_req);
+	int (*qpc_query)(struct hbl_cn_port *cn_port, u32 qpn, bool is_req,
+			 struct hbl_cn_qpc_attr *attr);
+	int (*qpc_clear)(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, bool is_req);
+	void (*user_ccq_set)(struct hbl_cn_port *cn_port, u64 ccq_device_addr, u64 pi_device_addr,
+			     u32 num_of_entries, u32 *ccqn);
+	void (*user_ccq_unset)(struct hbl_cn_port *cn_port, u32 *ccqn);
+	void (*reset_mac_stats)(struct hbl_cn_port *cn_port);
+	void (*collect_fec_stats)(struct hbl_cn_port *cn_port, char *buf, size_t size);
+	int (*disable_wqe_index_checker)(struct hbl_cn_port *cn_port);
+	void (*get_status)(struct hbl_cn_port *cn_port, struct hbl_cn_cpucp_status *status);
+	void (*cfg_lock)(struct hbl_cn_port *cn_port);
+	void (*cfg_unlock)(struct hbl_cn_port *cn_port);
+	bool (*cfg_is_locked)(struct hbl_cn_port *cn_port);
+	void (*qp_pre_destroy)(struct hbl_cn_qp *qp);
+	void (*qp_post_destroy)(struct hbl_cn_qp *qp);
+	void (*set_port_status)(struct hbl_cn_port *cn_port, bool up);
+	int (*send_cpucp_packet)(struct hbl_cn_port *cn_port, enum cpucp_packet_id packet_id,
+				 int val);
+	void (*adaptive_tmr_reset)(struct hbl_cn_qp *qp);
+	void (*spmu_get_stats_info)(struct hbl_cn_port *cn_port, struct hbl_cn_stat **stats,
+				    u32 *n_stats);
+	int (*spmu_config)(struct hbl_cn_port *cn_port, u32 num_event_types, u32 event_types[],
+			   bool enable);
+	int (*spmu_sample)(struct hbl_cn_port *cn_port, u32 num_out_data, u64 out_data[]);
+	void (*post_send_status)(struct hbl_cn_port *cn_port);
+};
+
+/**
+ * struct hbl_cn_asic_funcs - ASIC specific functions that are can be called from common code.
+ * @core_init: core infrastructure init.
+ * @core_fini: core infrastructure cleanup.
+ * @get_default_port_speed: get the default port BW in MB/s.
+ * @phy_reset_macro: macro PHY reset.
+ * @phy_get_crc: get PHY CRC.
+ * @set_req_qp_ctx: set up a requester QP context.
+ * @set_res_qp_ctx: set up a responder QP context.
+ * @user_wq_arr_set: set user WQ array (check whether user_wq_lock should be taken).
+ * @user_set_app_params: update user params to be later retrieved by user_get_app_params.
+ * @user_get_app_params: retrieve user params, previously configured or saved by
+ *                       user_set_app_params.
+ * @get_phy_fw_name: returns the PHY FW file name.
+ * @pre_sw_init: initialize device SW fixed properties.
+ * @sw_init: initialize device SW.
+ * @sw_fini: cleanup device SW.
+ * @macro_sw_init: initialize per macro software components.
+ * @macro_sw_fini: finalize per macro software components.
+ * @kernel_ctx_init: initialize kernel context.
+ * @kernel_ctx_fini: de-initialize kernel context.
+ * @ctx_init: initialize user context.
+ * @ctx_fini: de-initialize user context.
+ * @qp_read: read a QP content.
+ * @wqe_read: read a WQE content.
+ * @phy_fw_load_all: load PHY fw on all the ports.
+ * @set_en_data: ASIC data to be used by the Ethernet driver.
+ * @request_irqs: Add handlers to interrupt lines.
+ * @free_irqs: Free interrupts allocated with request_irqs.
+ * @synchronize_irqs: Wait for pending IRQ handlers (on other CPUs).
+ * @phy_dump_serdes_params: dump the serdes parameters.
+ * @get_max_msg_sz: get maximum message size.
+ * @qp_syndrome_to_str: convert a QP error syndrome to an error string.
+ * @app_params_clear: clear app params.
+ * @inject_rx_err: Force RX packet drops.
+ * @is_encap_supported: true if encapsulation is supported according to the given parameters.
+ * @set_wqe_index_checker: set wqe index checker (enable/disable).
+ * @get_wqe_index_checker: get wqe index checker (enabled/disabled).
+ * @set_static_properties: Sets static CN properties.
+ * @set_dram_properties: Sets DRAM CN properties.
+ * @late_init: set post initialization properties, e.g., compute2cn ops.
+ * @late_fini: clear post initialization properties, e.g., compute2cn ops.
+ * @get_hw_block_handle: Map block and return its handle.
+ * @get_hw_block_addr: Get address and size for a memory handle.
+ * @create_mem_ctx: create a HW memory context.
+ * @destroy_mem_ctx: destroy a HW memory context.
+ * @phy_speed_rate_write: set PHY speed rate ID.
+ * @phy_speed_rate_read: get PHY speed rate ID.
+ * @phy_training_type_write: set PHY training type ID.
+ * @phy_training_type_read: get PHY training type ID.
+ * @dma_alloc_coherent: Allocate coherent DMA memory.
+ * @dma_free_coherent: Free coherent DMA memory.
+ * @dma_pool_zalloc: Allocate a memory block from a DMA memory pool.
+ * @dma_pool_free: Free a DMA memory pool block.
+ * @set_maintenance_work_interval: Set maintenance work interval.
+ * @get_maintenance_work_interval: Get maintenance work interval.
+ * @send_cpu_message: Send message to F/W. If the message is timedout, the driver will eventually
+ *                    reset the device. The timeout is passed as an argument. If it is 0 the
+ *                    timeout set is the default timeout for the specific ASIC.
+ * @ports_cancel_status_work: Cancel status work of all ports.
+ * @port_funcs: Functions called from common code for a specific port.
+ */
+struct hbl_cn_asic_funcs {
+	int (*core_init)(struct hbl_cn_device *hdev);
+	void (*core_fini)(struct hbl_cn_device *hdev);
+	u32 (*get_default_port_speed)(struct hbl_cn_device *hdev);
+	int (*phy_reset_macro)(struct hbl_cn_macro *cn_macro);
+	u16 (*phy_get_crc)(struct hbl_cn_device *hdev);
+	int (*set_req_qp_ctx)(struct hbl_cn_device *hdev, struct hbl_cni_req_conn_ctx_in *in,
+			      struct hbl_cn_qp *qp);
+	int (*set_res_qp_ctx)(struct hbl_cn_device *hdev, struct hbl_cni_res_conn_ctx_in *in,
+			      struct hbl_cn_qp *qp);
+	int (*user_wq_arr_set)(struct hbl_cn_device *hdev, struct hbl_cni_user_wq_arr_set_in *in,
+			       struct hbl_cni_user_wq_arr_set_out *out, struct hbl_cn_ctx *ctx);
+	int (*user_set_app_params)(struct hbl_cn_device *hdev,
+				   struct hbl_cni_set_user_app_params_in *in,
+				   bool *modify_wqe_checkers, struct hbl_cn_ctx *ctx);
+	void (*user_get_app_params)(struct hbl_cn_device *hdev,
+				    struct hbl_cni_get_user_app_params_in *in,
+				    struct hbl_cni_get_user_app_params_out *out);
+	const char* (*get_phy_fw_name)(void);
+	void (*pre_sw_init)(struct hbl_cn_device *hdev);
+	int (*sw_init)(struct hbl_cn_device *hdev);
+	void (*sw_fini)(struct hbl_cn_device *hdev);
+	int (*macro_sw_init)(struct hbl_cn_macro *cn_macro);
+	void (*macro_sw_fini)(struct hbl_cn_macro *cn_macro);
+	int (*kernel_ctx_init)(struct hbl_cn_device *hdev, u32 asid);
+	void (*kernel_ctx_fini)(struct hbl_cn_device *hdev, u32 asid);
+	int (*ctx_init)(struct hbl_cn_ctx *ctx);
+	void (*ctx_fini)(struct hbl_cn_ctx *ctx);
+	int (*qp_read)(struct hbl_cn_device *hdev, struct hbl_cn_qp_info *qp_info, char *buf,
+		       size_t bsize);
+	int (*wqe_read)(struct hbl_cn_device *hdev, char *buf, size_t bsize);
+	int (*phy_fw_load_all)(struct hbl_cn_device *hdev);
+	void (*set_en_data)(struct hbl_cn_device *hdev);
+	int (*request_irqs)(struct hbl_cn_device *hdev);
+	void (*free_irqs)(struct hbl_cn_device *hdev);
+	void (*synchronize_irqs)(struct hbl_cn_device *hdev);
+	void (*phy_dump_serdes_params)(struct hbl_cn_device *hdev, char *buf, size_t size);
+	u32 (*get_max_msg_sz)(struct hbl_cn_device *hdev);
+	char *(*qp_syndrome_to_str)(u32 syndrome);
+	void (*app_params_clear)(struct hbl_cn_device *hdev);
+	int (*inject_rx_err)(struct hbl_cn_device *hdev, u8 drop_percent);
+	bool (*is_encap_supported)(struct hbl_cn_device *hdev,
+				   struct hbl_cni_user_encap_set_in *in);
+	int (*set_wqe_index_checker)(struct hbl_cn_device *hdev, u32 enable);
+	int (*get_wqe_index_checker)(struct hbl_cn_device *hdev);
+	int (*set_static_properties)(struct hbl_cn_device *hdev);
+	int (*set_dram_properties)(struct hbl_cn_device *hdev);
+	void (*late_init)(struct hbl_cn_device *hdev);
+	void (*late_fini)(struct hbl_cn_device *hdev);
+	int (*get_hw_block_handle)(struct hbl_cn_device *hdev, u64 address, u64 *handle);
+	int (*get_hw_block_addr)(struct hbl_cn_device *hdev, u64 handle, u64 *addr, u64 *size);
+	int (*create_mem_ctx)(struct hbl_cn_ctx *ctx, u32 pasid, u64 page_tbl_addr);
+	void (*destroy_mem_ctx)(struct hbl_cn_ctx *ctx, u32 pasid, u64 page_tbl_addr);
+	int (*phy_speed_rate_write)(struct hbl_cn_device *hdev, u32 speed_rate_id);
+	u32 (*phy_speed_rate_read)(struct hbl_cn_device *hdev);
+	int (*phy_training_type_write)(struct hbl_cn_device *hdev, u32 training_type_id);
+	u32 (*phy_training_type_read)(struct hbl_cn_device *hdev);
+	void *(*dma_alloc_coherent)(struct hbl_cn_device *hdev, size_t size, dma_addr_t *dma_handle,
+				    gfp_t flag);
+	void (*dma_free_coherent)(struct hbl_cn_device *hdev, size_t size, void *cpu_addr,
+				  dma_addr_t dma_addr);
+	void *(*dma_pool_zalloc)(struct hbl_cn_device *hdev, size_t size, gfp_t mem_flags,
+				 dma_addr_t *dma_handle);
+	void (*dma_pool_free)(struct hbl_cn_device *hdev, void *vaddr, dma_addr_t dma_addr);
+	void (*set_maintenance_work_interval)(struct hbl_cn_device *hdev, u32 value);
+	u32 (*get_maintenance_work_interval)(struct hbl_cn_device *hdev);
+	int (*send_cpu_message)(struct hbl_cn_device *hdev, u32 *msg, u16 len, u32 timeout,
+				u64 *result);
+	void (*ports_cancel_status_work)(struct hbl_cn_device *hdev);
+	struct hbl_cn_asic_port_funcs *port_funcs;
+};
+
+/**
+ * struct hbl_cn_tx_taps - holds the Tx taps values for a specific lane (tx_pre2, tx_pre1, tx_main,
+ *                         tx_post1 and tx_post2).
+ * @pam4_taps: taps for PAM4 mode.
+ * @nrz_taps: taps for NRZ mode.
+ */
+struct hbl_cn_tx_taps {
+	s32 pam4_taps[PHY_TX_TAPS_NUM];
+	s32 nrz_taps[PHY_TX_TAPS_NUM];
+};
+
+/**
+ * struct hbl_cn_ber_info - holds the last calculated BER info for a specific lane.
+ * the BER (bit error rate) value is represented by "integer.frac * e ^ -exp".
+ * @integer: the integer part of the BER value.
+ * @frac: the fracture part of the BER value.
+ * @exp: the exponent part of the BER value.
+ * @valid: is info valid.
+ */
+struct hbl_cn_ber_info {
+	u64 integer;
+	u64 frac;
+	u8 exp;
+	u8 valid;
+};
+
+/**
+ * struct hbl_cn_macro - manage specific macro that holds multiple engines.
+ * @hdev: habanalabs device structure.
+ * @rec_link_sts: link status bits as received from the MAC_REC_STS0 register.
+ * @phy_macro_needs_reset: true if the PHY macro needs to be reset.
+ * @idx: index of the macro.
+ */
+struct hbl_cn_macro {
+	struct hbl_cn_device *hdev;
+	u32 rec_link_sts;
+	u8 phy_macro_needs_reset;
+	u8 idx;
+};
+
+/**
+ * struct hbl_cn_port - manage specific port common structure.
+ * @hdev: habanalabs device structure.
+ * @cn_specific: pointer to an ASIC specific port structure.
+ * @cn_macro: pointer to the manage structure of the containing macro.
+ * @wq: general purpose WQ for low/medium priority jobs like link status detection or status fetch.
+ * @qp_wq: QP work queue for handling the reset or destruction of QPs.
+ * @wq_arr_props: array per type of WQ array properties.
+ * @ev_dqs: per ASID/App events dispatch queues managed by the driver.
+ * @num_of_allocated_qps: the currently number of allocated qps for this port.
+ * @link_status_work: work for checking port link status.
+ * @fw_status_work: work for sending port status to the FW.
+ * @control_lock: protects from a race between port open/close and other stuff that might run in
+ *                parallel (such as event handling).
+ * @cnt_lock: protects the counters from concurrent reading. Needed for SPMU and XPCS91 counters.
+ * @qp_ids: xarray to hold all QP IDs.
+ * @db_fifo_ids: Allocated doorbell fifo IDs.
+ * @cq_ids: xarray to hold all CQ IDs.
+ * @encap_ids: Allocated encapsulation IDs.
+ * @fw_tuning_limit_ts: time stamp of FW tuning time limit.
+ * @correctable_errors_cnt: count the correctable FEC blocks.
+ * @uncorrectable_errors_cnt: count the uncorrectable FEC blocks.
+ * @port: port index.
+ * @speed: the bandwidth of the port in Mb/s.
+ * @pflags: private flags bit mask.
+ * @retry_cnt: counts the number of retries during link establishment.
+ * @pcs_local_fault_cnt: counter of PCS link local errors since last F/W configuration. These errors
+ *                       can appear even when link is up.
+ * @pcs_remote_fault_cnt: counter of PCS link remote errors since last F/W configuration. These
+ *                        errors can appear even when link is up.
+ * @pcs_remote_fault_seq_cnt: counter for number of PCS remote faults in a row, or in other words
+ *                            the length of their sequence.
+ * @pcs_remote_fault_reconfig_cnt: counter of PHY reconfigurations due to remote fault errors since
+ *                                 last port open.
+ * @pcs_link_restore_cnt: counter of PCS link momentary loss (glitch) since last F/W configuration.
+ * @data_rate: data rate according to speed and number of lanes.
+ * @num_of_wq_entries: number of entries configured in the port WQ.
+ * @num_of_wqs: number of WQs configured for this port.
+ * @qp_idx_offset: offset to the base QP index of this port for generic QPs.
+ * @port_toggle_cnt: counts number of times port link status was toggled since PHY init.
+ * @port_toggle_cnt_prev: holds the value of port_toggle_cnt in the last pcs link check.
+ * @cong_q_err_cnt: error count of congestion queue error.
+ * @port_open: true if the port H/W is initialized, false otherwise.
+ * @mac_loopback: true if port in MAC loopback mode, false otherwise.
+ * @pfc_enable: true if this port supports Priority Flow Control, false otherwise.
+ * @sw_initialized: true if the basic SW initialization was completed successfully for this port,
+ *                  false otherwise.
+ * @phy_fw_tuned: true if F/W is tuned, false otherwise.
+ * @phy_func_mode_en: true if PHY is set to functional mode, false otherwise.
+ * @pcs_link: true if the port has PCS link, false otherwise.
+ * @eq_pcs_link: true if the port got PCS link in the EQ, false otherwise..
+ * @link_eqe: cache link status EQE. Dispatched to user for internal ports only.
+ * @auto_neg_enable: true if this port supports Autonegotiation, false otherwise.
+ * @auto_neg_resolved: true if Autonegotiation was completed for this port, false otherwise.
+ * @auto_neg_skipped: true if Autonegotiation was skipped for this port, false otherwise.
+ * @eth_enable: is Ethernet traffic enabled in addition to RDMA.
+ * @ccq_enable: true if the CCQ was initialized successfully for this port, false otherwise.
+ * @set_app_params: set_app_params operation was executed by the user. This is a mandatory step in
+ *                  order to initialize the uAPI.
+ * @disabled: true if this port is disabled, i.e. need to block its initialization, false otherwise.
+ * @bp_enable: true if WQ back-pressure was enabled, false otherwise.
+ * @eq_handler_enable: true if event queue events are handled, false otherwise.
+ */
+struct hbl_cn_port {
+	struct hbl_cn_device *hdev;
+	void *cn_specific;
+	struct hbl_cn_macro *cn_macro;
+	struct workqueue_struct *wq;
+	struct workqueue_struct *qp_wq;
+	struct hbl_cn_wq_array_properties wq_arr_props[HBL_CNI_USER_WQ_TYPE_MAX];
+	struct hbl_cn_ev_dqs ev_dqs;
+	struct hbl_cn_reset_tracker *reset_tracker;
+	atomic_t num_of_allocated_qps;
+	struct delayed_work link_status_work;
+	struct delayed_work fw_status_work;
+	/* protects from a race between port open/close and event handling */
+	struct mutex control_lock;
+	/* protects the counters from concurrent reading */
+	struct mutex cnt_lock;
+	struct xarray qp_ids;
+	struct xarray db_fifo_ids;
+	struct xarray cq_ids;
+	struct xarray encap_ids;
+	struct hbl_cn_eqe link_eqe;
+	ktime_t fw_tuning_limit_ts;
+	u64 ccq_handle;
+	u64 ccq_pi_handle;
+	u64 correctable_errors_cnt;
+	u64 uncorrectable_errors_cnt;
+	u32 port;
+	u32 speed;
+	u32 pflags;
+	u32 retry_cnt;
+	u32 pcs_local_fault_cnt;
+	u32 pcs_remote_fault_seq_cnt;
+	u32 pcs_remote_fault_reconfig_cnt;
+	u32 pcs_remote_fault_cnt;
+	u32 pcs_link_restore_cnt;
+	u32 data_rate;
+	u32 num_of_wq_entries;
+	u32 num_of_wqs;
+	u32 qp_idx_offset;
+	u32 swqe_size;
+	u32 port_toggle_cnt;
+	u32 port_toggle_cnt_prev;
+	u32 cong_q_err_cnt;
+	u8 port_open;
+	u8 mac_loopback;
+	u8 pfc_enable;
+	u8 sw_initialized;
+	u8 phy_fw_tuned;
+	u8 phy_func_mode_en;
+	u8 pcs_link;
+	u8 eq_pcs_link;
+	u8 auto_neg_enable;
+	u8 auto_neg_resolved;
+	u8 auto_neg_skipped;
+	u8 eth_enable;
+	u8 ccq_enable;
+	u8 set_app_params;
+	u8 disabled;
+	u8 bp_enable;
+	u8 eq_handler_enable;
+};
+
+/**
+ * struct hbl_cn_comp_vm_info - Compute virtual memory info.
+ * @vm_info: VM info.
+ * @vm_handle: VM handle.
+ */
+struct hbl_cn_comp_vm_info {
+	struct hbl_cn_vm_info vm_info;
+	u64 vm_handle;
+};
+
+/**
+ * struct hbl_cn_ctx - user context common structure.
+ * @hdev: device structure.
+ * @user_vm_info: info of user compute VM.
+ * @driver_vm_info: info of driver compute VM.
+ * @lock: protects context from specific concurrent operations.
+ * @comp_handle: compute handle.
+ * @asid: ASID for accessing driver memory.
+ * @user_asid: ASID for accessing user memory:
+ */
+struct hbl_cn_ctx {
+	struct hbl_cn_device *hdev;
+	struct hbl_cn_comp_vm_info user_vm_info;
+	struct hbl_cn_comp_vm_info driver_vm_info;
+	/* protects context from specific concurrent operations */
+	struct mutex lock;
+	u64 comp_handle;
+	u32 asid;
+	u32 user_asid;
+};
+
+/**
+ * struct hbl_cn_properties - ASIC specific properties.
+ * @phy_base_addr: base address of the PHY.
+ * @nic_drv_addr: the base address of the memory in the device
+ * @nic_drv_size: the size of the memory in the device
+ * @nic_drv_base_addr: the aligned base address of the memory in the device
+ * @nic_drv_end_addr: the aligned end address of the memory in the device
+ * @txs_base_addr: base address of the ports timer cfg
+ * @txs_base_size: size of the ports timer cfg
+ * @wq_base_addr: base address of send and receive work-q
+ * @wq_base_size: base address of send and receive work-q
+ * @tmr_base_addr: base address of the macros timer cfg
+ * @tmr_base_size: size of the macros timer cfg
+ * @req_qpc_base_addr: the base address of a requester (sender) QP context buffer
+ * @req_qpc_base_size: the size of a requester (sender) QP context buffer
+ * @res_qpc_base_addr: the base address of a responder (receiver) QP context buffer
+ * @res_qpc_base_size: the size of a requester (receiver) QP context buffer
+ * @max_hw_qps_num: maximum number of QPs supported by HW.
+ * @max_qps_num: maximum number of QPs to allocate.
+ * @max_hw_user_wqs_num: maximum number of WQ entries supported by HW.
+ * @min_hw_user_wqs_num: minimum number of WQ entries supported by HW.
+ * @macro_cfg_size: the size of the macro configuration space.
+ * @rwqe_size: receive WQE size.
+ * @user_cq_min_entries: minimum number of supported user CQ entries.
+ * @user_cq_max_entries: max number of supported user CQ entries.
+ * @max_frm_len: maximum allowed frame length.
+ * @raw_elem_size: size of element in raw buffers.
+ * @status_packet_size: size of the status packet we are going to send to F/W.
+ * @cqe_size: Size of the Completion queue Entry.
+ * @max_qp_error_syndromes: maximum number of QP error syndromes.
+ * @max_raw_mtu: maximum MTU size for raw packets.
+ * @min_raw_mtu: minimum MTU size for raw packets.
+ * @clk: clock frequency in MHz.
+ * @force_cq: all CQs should be enabled regardless of the ports link mask.
+ * @max_num_of_lanes: maximum number of lanes supported by ASIC.
+ * @max_num_of_ports: maximum number of ports supported by ASIC.
+ * @num_of_macros: number of macros supported by ASIC.
+ * @max_cqs: maximum number of completion queues.
+ * @max_ccqs: maximum number of congestion control completion queues.
+ * @max_db_fifos: maximum number of DB fifos.
+ * @max_wq_arr_type: maximum WQ array type number.
+ * @is_phy_fw_binary: True if phy FW is in binary format, false otherwise.
+ */
+struct hbl_cn_properties {
+	u64 phy_base_addr;
+	u64 nic_drv_addr;
+	u64 nic_drv_size;
+	u64 nic_drv_base_addr;
+	u64 nic_drv_end_addr;
+	u64 txs_base_addr;
+	u64 txs_base_size;
+	u64 wq_base_addr;
+	u64 wq_base_size;
+	u64 tmr_base_addr;
+	u64 tmr_base_size;
+	u64 req_qpc_base_addr;
+	u64 req_qpc_base_size;
+	u64 res_qpc_base_addr;
+	u64 res_qpc_base_size;
+	u32 max_hw_qps_num;
+	u32 max_qps_num;
+	u32 max_hw_user_wqs_num;
+	u32 min_hw_user_wqs_num;
+	u32 macro_cfg_size;
+	u32 rwqe_size;
+	u32 user_cq_min_entries;
+	u32 user_cq_max_entries;
+	u32 max_frm_len;
+	u32 raw_elem_size;
+	u32 status_packet_size;
+	u32 cqe_size;
+	u32 max_qp_error_syndromes;
+	u16 max_raw_mtu;
+	u16 min_raw_mtu;
+	u16 clk;
+	u8 force_cq;
+	u8 max_num_of_lanes;
+	u8 max_num_of_ports;
+	u8 num_of_macros;
+	u8 max_cqs;
+	u8 max_ccqs;
+	u8 max_db_fifos;
+	u8 max_wq_arr_type;
+	u8 is_phy_fw_binary;
+};
+
+/**
+ * struct hbl_cn_device - habanalabs CN device structure.
+ * @pdev: pointer to PCI device.
+ * @dev: related kernel basic device structure.
+ * @cpucp_info: FW info.
+ * @asic_funcs: ASIC specific functions that can be called from common code.
+ * @phy_tx_taps: array that holds all PAM4 Tx taps of all lanes.
+ * @phy_ber_info: array that holds last calculated BER info of all lanes.
+ * @cn_ports: pointer to an array that holds all ports manage common structures.
+ * @cn_macros: pointer to an array that holds all macros manage structures.
+ * @wq_arrays_pool: memory pool for WQ arrays on HBM.
+ * @cn_props: fixed NIC properties.
+ * @asic_specific: ASIC specific information to use only from ASIC files.
+ * @cn_aux_dev: pointer to CN auxiliary device.
+ * @en_aux_dev: Ethernet auxiliary device.
+ * @ib_aux_dev: InfiniBand auxiliary device.
+ * @qp_info: details of a QP to read via debugfs.
+ * @wqe_info: details of a WQE to read via debugfs.
+ * @ctx: user context.
+ * @hw_access_lock: protects from HW access during reset flows.
+ * @asic_type: ASIC specific type.
+ * @status_cmd: status packet command from FW.
+ * @qp_reset_mode: Graceful/fast reset.
+ * @fw_ver: FW version.
+ * @mem_ids: an xarray holding all active memory handles.
+ * @ctrl_op_mask: mask of supported control operations.
+ * @ports_mask: mask of available ports.
+ * @ext_ports_mask: mask of external ports (subset of ports_mask).
+ * @phys_auto_neg_mask: mask of ports with Autonegotiation availability.
+ * @auto_neg_mask: mask of port with Autonegotiation enabled.
+ * @mac_loopback: enable MAC loopback on specific ports.
+ * @dram_size: available DRAM size.
+ * @mmap_type_flag: flag to indicate NIC MMAP type.
+ * @pol_tx_mask: bitmap of tx polarity for all lanes.
+ * @pol_rx_mask: bitmap of rx polarity for all lanes.
+ * @device_timeout: device access timeout in usec.
+ * @mac_lane_remap: MAC to PHY lane mapping.
+ * @pending_reset_long_timeout: Long timeout for pending hard reset to finish in seconds.
+ * @kernel_asid: kernel ASID.
+ * @qp_drain_time: drain waiting time in seconds after QP invalidation.
+ * @card_location: the OAM number in the HLS (relevant for PMC card type).
+ * @phy_port_to_dump: the port which its serdes params will be dumped.
+ * @fw_major_version: major version of current loaded preboot.
+ * @fw_minor_version: minor version of current loaded preboot.
+ * @qpc_cache_inv_timeout: timeout for QPC cache invalidation.
+ * @fw_app_cpu_boot_dev_sts0: bitmap representation of application security status reported by FW,
+ *                            bit description can be found in CPU_BOOT_DEV_STS0.
+ * @fw_app_cpu_boot_dev_sts1: bitmap representation of application security status reported by FW,
+ *                            bit description can be found in CPU_BOOT_DEV_STS1.
+ * @accumulate_fec_duration: Time (ms) to accumulate FEC errors for.
+ * @id: device ID.
+ * @phy_calc_ber_wait_sec: time in seconds to wait before BER calculation.
+ * @cache_line_size: device cache line size.
+ * @operational: is device operational.
+ * @in_reset: is device under reset.
+ * @fw_reset: is device under reset which was initiated by FW.
+ * @in_teardown: is device under teardown.
+ * @is_initialized: is device initialized.
+ * @pldm: is running on Palladium setup.
+ * @skip_phy_init: avoid writing/reading PHY registers.
+ * @load_phy_fw: true if the PHY F/W should be loaded, false otherwise.
+ * @cpucp_fw: is CPUCP FW enabled.
+ * @supports_coresight: is CoreSight supported.
+ * @use_fw_serdes_info: true if FW serdes values should be used, false if hard coded values should
+ *                      be used.
+ * @phy_config_fw: true if the PHY F/W should be configured, false otherwise. The PHY F/W should be
+ *                 configured on ASIC only, in contrary to Palladium.
+ * @mmu_bypass: use MMU bypass for allocated data structures (false is used only for debug mode).
+ * @wq_arrays_pool_enable: Use device memory pool for WQ arrays.
+ * @poll_enable: enable polling mode rather than interrupt mode.
+ * @has_eq: is event queue is supported.
+ * @skip_mac_reset: skip MAC reset.
+ * @skip_mac_cnts: Used to skip MAC counters if not supported.
+ * @skip_odd_ports_cfg_lock: do not lock the odd ports when acquiring the cfg lock for all ports.
+ * @ib_support: InfiniBand support.
+ * @mmu_enable: is MMU enabled.
+ * @eth_loopback: enable hack in hbl_en_handle_tx to test eth traffic.
+ * @lanes_per_port: number of physical lanes per port.
+ * @is_eth_aux_dev_initialized: true if the eth auxiliary device is initialized.
+ * @is_ib_aux_dev_initialized: true if the IB auxiliary device is initialized.
+ * @rx_drop_percent: RX packet drop percentage set via debugfs.
+ * @rand_status: randomize the FW status counters (used for testing).
+ * @status_period: periodic time in secs at which FW expects status packet.
+ * @phy_regs_print: print all PHY registers reads/writes.
+ * @phy_calc_ber: show PHY BER statistics during power-up.
+ * @is_decap_disabled: true if need to skip decapsulation, false otherwise.
+ * @phy_set_nrz: Set the PHY to NRZ mode (25Gbps speed).
+ * @skip_phy_default_tx_taps_cfg: Used to skip re-configuration of the default tx_taps.
+ * @cpucp_checkers_shift: CPUCP checkers flags shift.
+ * @mixed_qp_wq_types: Using mixed QP WQ types is supported.
+ * @hw_stop_during_teardown: Stopping the HW should take place during device teardown.
+ * @qp_wait_for_idle: Wait for QP to be idle.
+ * @hw_invalid_while_teardown: HW is unavailable during device teardown.
+ * @umr_support: device supports UMR.
+ * @ib_device_opened: Is true if IB deviced has been opened.
+ * @multi_ctx_support: device supports multiple contexts.
+ * @skip_phy_pol_cfg: Used to prevent overwriting polarity cfg after setting them via debugfs.
+ * @cc_support: device supports congestion control.
+ * @phy_force_first_tx_taps_cfg: start with first Tx taps config in PHY power-up.
+ */
+struct hbl_cn_device {
+	struct pci_dev *pdev;
+	struct device *dev;
+	struct hbl_cn_cpucp_info *cpucp_info;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_tx_taps *phy_tx_taps;
+	struct hbl_cn_ber_info *phy_ber_info;
+	struct hbl_cn_port *cn_ports;
+	struct hbl_cn_macro *cn_macros;
+	struct gen_pool *wq_arrays_pool;
+	struct hbl_cn_properties cn_props;
+	void *asic_specific;
+	char *fw_ver;
+	struct hbl_aux_dev *cn_aux_dev;
+	struct hbl_aux_dev en_aux_dev;
+	struct hbl_aux_dev ib_aux_dev;
+	struct hbl_cn_qp_info qp_info;
+	struct hbl_cn_wqe_info wqe_info;
+	struct hbl_cn_ctx *ctx;
+	/* protects from HW access during reset flows */
+	struct mutex hw_access_lock;
+	enum hbl_cn_asic_type asic_type;
+	enum hbl_cn_status_cmd status_cmd;
+	enum hbl_cn_qp_reset_mode qp_reset_mode;
+	struct xarray mem_ids;
+	u64 ctrl_op_mask;
+	u64 ports_mask;
+	u64 ext_ports_mask;
+	u64 phys_auto_neg_mask;
+	u64 auto_neg_mask;
+	u64 mac_loopback;
+	u64 dram_size;
+	u64 mmap_type_flag;
+	u64 pol_tx_mask;
+	u64 pol_rx_mask;
+	u32 device_timeout;
+	u32 *mac_lane_remap;
+	u32 pending_reset_long_timeout;
+	u32 kernel_asid;
+	u32 qp_drain_time;
+	u32 card_location;
+	u32 phy_port_to_dump;
+	u32 fw_major_version;
+	u32 fw_minor_version;
+	u32 qpc_cache_inv_timeout;
+	u32 fw_app_cpu_boot_dev_sts0;
+	u32 fw_app_cpu_boot_dev_sts1;
+	u32 accumulate_fec_duration;
+	u16 id;
+	u16 phy_calc_ber_wait_sec;
+	u16 cache_line_size;
+	u8 operational;
+	u8 in_reset;
+	u8 fw_reset;
+	u8 in_teardown;
+	u8 is_initialized;
+	u8 pldm;
+	u8 skip_phy_init;
+	u8 load_phy_fw;
+	u8 cpucp_fw;
+	u8 supports_coresight;
+	u8 use_fw_serdes_info;
+	u8 phy_config_fw;
+	u8 mmu_bypass;
+	u8 wq_arrays_pool_enable;
+	u8 poll_enable;
+	u8 has_eq;
+	u8 skip_mac_reset;
+	u8 skip_mac_cnts;
+	u8 skip_odd_ports_cfg_lock;
+	u8 ib_support;
+	u8 mmu_enable;
+	u8 eth_loopback;
+	u8 lanes_per_port;
+	u8 is_eth_aux_dev_initialized;
+	u8 is_ib_aux_dev_initialized;
+	u8 rx_drop_percent;
+	u8 rand_status;
+	u8 status_period;
+	u8 phy_regs_print;
+	u8 phy_calc_ber;
+	u8 is_decap_disabled;
+	u8 phy_set_nrz;
+	u8 skip_phy_default_tx_taps_cfg;
+	u8 cpucp_checkers_shift;
+	u8 mixed_qp_wq_types;
+	u8 hw_stop_during_teardown;
+	u8 qp_wait_for_idle;
+	u8 hw_invalid_while_teardown;
+	u8 umr_support;
+	u8 ib_device_opened;
+	u8 multi_ctx_support;
+	u8 skip_phy_pol_cfg;
+	u8 cc_support;
+	u8 phy_force_first_tx_taps_cfg;
+};
+
+static inline void hbl_cn_strtolower(char *str)
+{
+	while (*str) {
+		*str = tolower(*str);
+		str++;
+	}
+}
+
+int hbl_cn_dev_init(struct hbl_cn_device *hdev);
+void hbl_cn_dev_fini(struct hbl_cn_device *hdev);
+bool hbl_cn_comp_device_operational(struct hbl_cn_device *hdev);
+void hbl_cn_spmu_get_stats_info(struct hbl_cn_port *cn_port, struct hbl_cn_stat **stats,
+				u32 *n_stats);
+int hbl_cn_reserve_dva_block(struct hbl_cn_ctx *ctx, u64 size, u64 *dva);
+void hbl_cn_unreserve_dva_block(struct hbl_cn_ctx *ctx, u64 dva, u64 size);
+int hbl_cn_get_hw_block_handle(struct hbl_cn_device *hdev, u64 address, u64 *handle);
+int hbl_cn_send_cpucp_packet(struct hbl_cn_device *hdev, u32 port, enum cpucp_packet_id pkt_id,
+			     int val);
+int hbl_cn_internal_port_init_locked(struct hbl_cn_port *cn_port);
+void hbl_cn_internal_port_fini_locked(struct hbl_cn_port *cn_port);
+int hbl_cn_phy_init(struct hbl_cn_port *cn_port);
+void hbl_cn_phy_fini(struct hbl_cn_port *cn_port);
+void hbl_cn_phy_port_reconfig(struct hbl_cn_port *cn_port);
+int hbl_cn_phy_has_binary_fw(struct hbl_cn_device *hdev);
+void hbl_cn_phy_set_fw_polarity(struct hbl_cn_device *hdev);
+void hbl_cn_phy_set_port_status(struct hbl_cn_port *cn_port, bool up);
+int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data[], u32 *num_out_data);
+int hbl_cn_qp_modify(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+		     enum hbl_cn_qp_state new_state, void *params);
+u32 hbl_cn_get_max_qp_id(struct hbl_cn_port *cn_port);
+bool hbl_cn_is_port_open(struct hbl_cn_port *cn_port);
+u32 hbl_cn_get_pflags(struct hbl_cn_port *cn_port);
+u8 hbl_cn_get_num_of_digits(u64 num);
+void hbl_cn_reset_stats_counters(struct hbl_cn_device *hdev);
+void hbl_cn_reset_ports_toggle_counters(struct hbl_cn_device *hdev);
+void hbl_cn_get_self_hw_block_handle(struct hbl_cn_device *hdev, u64 address, u64 *handle);
+u32 hbl_cn_hw_block_handle_to_addr32(struct hbl_cn_device *hdev, u64 handle);
+
+struct hbl_cn_ev_dq *hbl_cn_asid_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 asid);
+struct hbl_cn_ev_dq *hbl_cn_dbn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 dbn,
+				      struct hbl_cn_device *hdev);
+struct hbl_cn_ev_dq *hbl_cn_qpn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 qpn);
+struct hbl_cn_dq_qp_info *hbl_cn_get_qp_info(struct hbl_cn_ev_dqs *ev_dqs, u32 qpn);
+struct hbl_cn_ev_dq *hbl_cn_cqn_to_dq(struct hbl_cn_ev_dqs *ev_dqs,
+				      u32 cqn, struct hbl_cn_device *hdev);
+struct hbl_cn_ev_dq *hbl_cn_ccqn_to_dq(struct hbl_cn_ev_dqs *ev_dqs, u32 ccqn,
+				       struct hbl_cn_device *hdev);
+
+int hbl_cn_reserve_wq_dva(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u64 wq_arr_size,
+			  u32 type, u64 *dva);
+void hbl_cn_unreserve_wq_dva(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type);
+u32 hbl_cn_get_wq_array_type(bool is_send);
+
+void hbl_cn_track_port_reset(struct hbl_cn_port *cn_port, u32 syndrome);
+int hbl_cn_get_reg_pcie_addr(struct hbl_cn_device *hdev, u8 bar_id, u32 reg, u64 *pci_addr);
+void hbl_cn_ports_cancel_status_work(struct hbl_cn_device *hdev);
+
+/* Memory related functions */
+int hbl_cn_mem_alloc(struct hbl_cn_ctx *ctx, struct hbl_cn_mem_data *mem_data);
+int hbl_cn_mem_destroy(struct hbl_cn_device *hdev, u64 handle);
+struct hbl_cn_mem_buf *hbl_cn_mem_buf_get(struct hbl_cn_device *hdev, u64 handle);
+int hbl_cn_mem_buf_put(struct hbl_cn_mem_buf *buf);
+int hbl_cn_mem_buf_put_handle(struct hbl_cn_device *hdev, u64 handle);
+void hbl_cn_mem_init(struct hbl_cn_device *hdev);
+void hbl_cn_mem_fini(struct hbl_cn_device *hdev);
+
+u32 hbl_cn_dram_readl(struct hbl_cn_device *hdev, u64 addr);
+void hbl_cn_dram_writel(struct hbl_cn_device *hdev, u32 val, u64 addr);
+u32 hbl_cn_rreg(struct hbl_cn_device *hdev, u32 reg);
+void hbl_cn_wreg(struct hbl_cn_device *hdev, u32 reg, u32 val);
+void hbl_cn_get_frac_info(u64 numerator, u64 denominator, u64 *integer, u64 *exp);
+
+bool hbl_cn_eq_dispatcher_is_empty(struct hbl_cn_ev_dq *dq);
+bool hbl_cn_eq_dispatcher_is_full(struct hbl_cn_ev_dq *dq);
+void hbl_cn_eq_dispatcher_init(struct hbl_cn_port *cn_port);
+void hbl_cn_eq_dispatcher_fini(struct hbl_cn_port *cn_port);
+void hbl_cn_eq_dispatcher_reset(struct hbl_cn_port *cn_port);
+int hbl_cn_eq_dispatcher_associate_dq(struct hbl_cn_port *cn_port, u32 asid);
+int hbl_cn_eq_dispatcher_dissociate_dq(struct hbl_cn_port *cn_port, u32 asid);
+int hbl_cn_eq_dispatcher_register_qp(struct hbl_cn_port *cn_port, u32 asid, u32 qp_id);
+int hbl_cn_eq_dispatcher_unregister_qp(struct hbl_cn_port *cn_port, u32 qp_id);
+int hbl_cn_eq_dispatcher_register_cq(struct hbl_cn_port *cn_port, u32 asid, u32 cqn);
+int hbl_cn_eq_dispatcher_unregister_cq(struct hbl_cn_port *cn_port, u32 cqn);
+int hbl_cn_eq_dispatcher_register_db(struct hbl_cn_port *cn_port, u32 asid, u32 dbn);
+int hbl_cn_eq_dispatcher_unregister_db(struct hbl_cn_port *cn_port, u32 dbn);
+int hbl_cn_eq_dispatcher_dequeue(struct hbl_cn_port *cn_port, u32 asid,
+				 struct hbl_cn_eqe *eqe, bool is_default);
+int hbl_cn_eq_dispatcher_register_ccq(struct hbl_cn_port *cn_port, u32 asid, u32 ccqn);
+int hbl_cn_eq_dispatcher_unregister_ccq(struct hbl_cn_port *cn_port, u32 asid, u32 ccqn);
+int hbl_cn_eq_dispatcher_enqueue(struct hbl_cn_port *cn_port, const struct hbl_cn_eqe *eqe);
+int hbl_cn_eq_dispatcher_enqueue_bcast(struct hbl_cn_port *cn_port, const struct hbl_cn_eqe *eqe);
+void hbl_cn_eq_handler(struct hbl_cn_port *cn_port);
+int hbl_cn_alloc_ring(struct hbl_cn_device *hdev, struct hbl_cn_ring *ring, int elem_size,
+		      int count);
+void hbl_cn_free_ring(struct hbl_cn_device *hdev, struct hbl_cn_ring *ring);
+
+struct hbl_cn_user_cq *hbl_cn_user_cq_get(struct hbl_cn_port *cn_port, u8 cq_id);
+int hbl_cn_user_cq_put(struct hbl_cn_user_cq *user_cq);
+bool hbl_cn_is_ibdev(struct hbl_cn_device *hdev);
+void hbl_cn_hard_reset_prepare(struct hbl_aux_dev *cn_aux_dev, bool fw_reset, bool in_teardown);
+int hbl_cn_send_port_cpucp_status(struct hbl_aux_dev *aux_dev, u32 port, u8 cmd, u8 period);
+void hbl_cn_fw_status_work(struct work_struct *work);
+int hbl_cn_get_src_ip(struct hbl_cn_port *cn_port, u32 *src_ip);
+void hbl_cn_ctx_resources_destroy(struct hbl_cn_device *hdev, struct hbl_cn_ctx *ctx);
+
+int __hbl_cn_ports_reopen(struct hbl_cn_device *hdev);
+void __hbl_cn_hard_reset_prepare(struct hbl_cn_device *hdev, bool fw_reset, bool in_teardown);
+void __hbl_cn_stop(struct hbl_cn_device *hdev);
+
+/* DMA memory allocations */
+void *__hbl_cn_dma_alloc_coherent(struct hbl_cn_device *hdev, size_t size, dma_addr_t *dma_handle,
+				  gfp_t flag, const char *caller);
+void __hbl_cn_dma_free_coherent(struct hbl_cn_device *hdev, size_t size, void *cpu_addr,
+				dma_addr_t dma_addr, const char *caller);
+void *__hbl_cn_dma_pool_zalloc(struct hbl_cn_device *hdev, size_t size, gfp_t mem_flags,
+			       dma_addr_t *dma_handle, const char *caller);
+void __hbl_cn_dma_pool_free(struct hbl_cn_device *hdev, void *vaddr, dma_addr_t dma_addr,
+			    const char *caller);
+
+#endif /* HABANALABS_CN_H_ */
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
new file mode 100644
index 000000000000..47eedd27f36e
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#define pr_fmt(fmt)		"habanalabs_cn: " fmt
+
+#include "hbl_cn.h"
+
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/sched/clock.h>
+
+#define HBL_DRIVER_AUTHOR	"HabanaLabs Kernel Driver Team"
+
+#define HBL_DRIVER_DESC		"HabanaLabs AI accelerators Core Network driver"
+
+MODULE_AUTHOR(HBL_DRIVER_AUTHOR);
+MODULE_DESCRIPTION(HBL_DRIVER_DESC);
+MODULE_LICENSE("GPL");
+
+/* QP drain time in seconds */
+#define HBL_CN_QP_DRAIN_TIME		5
+
+static bool poll_enable;
+static uint qp_drain_time = HBL_CN_QP_DRAIN_TIME;
+
+module_param(poll_enable, bool, 0444);
+MODULE_PARM_DESC(poll_enable,
+		 "Enable driver in polling mode rather than IRQ (0 = no, 1 = yes, default: no)");
+
+module_param(qp_drain_time, uint, 0444);
+MODULE_PARM_DESC(qp_drain_time, "QP drain time in seconds after QP invalidation (default: 2)");
+
+static int hdev_init(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_aux_data *aux_data = aux_dev->aux_data;
+	struct hbl_cn_device *hdev;
+	int rc;
+
+	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
+	if (!hdev)
+		return -ENOMEM;
+
+	hdev->cpucp_info = kzalloc(sizeof(*hdev->cpucp_info), GFP_KERNEL);
+	if (!hdev->cpucp_info) {
+		rc = -ENOMEM;
+		goto free_hdev;
+	}
+
+	aux_dev->priv = hdev;
+	hdev->cn_aux_dev = aux_dev;
+	hdev->pdev = aux_data->pdev;
+	hdev->dev = aux_data->dev;
+	hdev->asic_type = aux_data->asic_type;
+	hdev->pending_reset_long_timeout = aux_data->pending_reset_long_timeout;
+	hdev->pldm = aux_data->pldm;
+	hdev->skip_phy_init = aux_data->skip_phy_init;
+	hdev->cpucp_fw = aux_data->cpucp_fw;
+	hdev->load_phy_fw = aux_data->load_phy_fw;
+	hdev->supports_coresight = aux_data->supports_coresight;
+	hdev->use_fw_serdes_info = aux_data->use_fw_serdes_info;
+	hdev->fw_ver = aux_data->fw_ver;
+	hdev->id = aux_data->id;
+	hdev->dram_size = aux_data->dram_size;
+	hdev->ports_mask = aux_data->ports_mask;
+	hdev->ext_ports_mask = aux_data->ext_ports_mask;
+	hdev->phys_auto_neg_mask = aux_data->auto_neg_mask;
+	hdev->cache_line_size = aux_data->cache_line_size;
+	hdev->kernel_asid = aux_data->kernel_asid;
+	hdev->qp_drain_time = qp_drain_time;
+	hdev->card_location = aux_data->card_location;
+	hdev->mmu_enable = aux_data->mmu_enable;
+	hdev->lanes_per_port = aux_data->lanes_per_port;
+	hdev->device_timeout = aux_data->device_timeout;
+	hdev->fw_major_version = aux_data->fw_major_version;
+	hdev->fw_minor_version = aux_data->fw_minor_version;
+	hdev->fw_app_cpu_boot_dev_sts0 = aux_data->fw_app_cpu_boot_dev_sts0;
+	hdev->fw_app_cpu_boot_dev_sts1 = aux_data->fw_app_cpu_boot_dev_sts1;
+	hdev->cpucp_checkers_shift = aux_data->cpucp_checkers_shift;
+	hdev->accumulate_fec_duration = ACCUMULATE_FEC_STATS_DURATION_MS;
+	hdev->poll_enable = poll_enable;
+
+	mutex_init(&hdev->hw_access_lock);
+
+	return 0;
+
+free_hdev:
+	kfree(hdev);
+	return rc;
+}
+
+static void hdev_fini(struct hbl_aux_dev *aux_dev)
+{
+	struct hbl_cn_device *hdev = aux_dev->priv;
+
+	mutex_destroy(&hdev->hw_access_lock);
+
+	kfree(hdev->cpucp_info);
+	kfree(hdev);
+	aux_dev->priv = NULL;
+}
+
+static const struct auxiliary_device_id hbl_cn_id_table[] = {
+	{ .name = "habanalabs.cn", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, hbl_cn_id_table);
+
+static int hbl_cn_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
+	struct hbl_cn_aux_ops *aux_ops = aux_dev->aux_ops;
+	struct hbl_cn_device *hdev;
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
+		dev_notice_once(hdev->dev, "Waiting for hard reset to finish before probing CN\n");
+
+		msleep_interruptible(MSEC_PER_SEC);
+	}
+
+	rc = hbl_cn_dev_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to init CN device\n");
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
+/* This function can be called only from the compute driver when deleting the aux bus, because we
+ * incremented the module refcount on probing. Hence no need to protect here from hard reset.
+ */
+static void hbl_cn_remove(struct auxiliary_device *adev)
+{
+	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
+	struct hbl_cn_device *hdev = aux_dev->priv;
+
+	if (!hdev)
+		return;
+
+	hbl_cn_dev_fini(hdev);
+
+	/* allow module unloading as now it is detached */
+	module_put(THIS_MODULE);
+
+	hdev_fini(aux_dev);
+}
+
+static struct auxiliary_driver hbl_cn_driver = {
+	.name = "cn",
+	.probe = hbl_cn_probe,
+	.remove = hbl_cn_remove,
+	.id_table = hbl_cn_id_table,
+};
+
+static int __init hbl_cn_init(void)
+{
+	pr_info("loading driver\n");
+
+	return auxiliary_driver_register(&hbl_cn_driver);
+}
+
+static void __exit hbl_cn_exit(void)
+{
+	auxiliary_driver_unregister(&hbl_cn_driver);
+
+	pr_info("driver removed\n");
+}
+
+module_init(hbl_cn_init);
+module_exit(hbl_cn_exit);
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
new file mode 100644
index 000000000000..93c97fad6a20
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl_cn.h"
+
+int hbl_cn_mem_alloc(struct hbl_cn_ctx *ctx, struct hbl_cn_mem_data *mem_data)
+{
+	return 0;
+}
+
+int hbl_cn_mem_destroy(struct hbl_cn_device *hdev, u64 handle)
+{
+	return 0;
+}
+
+struct hbl_cn_mem_buf *hbl_cn_mem_buf_get(struct hbl_cn_device *hdev, u64 handle)
+{
+	return NULL;
+}
+
+int hbl_cn_mem_buf_put(struct hbl_cn_mem_buf *buf)
+{
+	return 0;
+}
+
+int hbl_cn_mem_buf_put_handle(struct hbl_cn_device *hdev, u64 handle)
+{
+	return 0;
+}
+
+void hbl_cn_mem_init(struct hbl_cn_device *hdev)
+{
+}
+
+void hbl_cn_mem_fini(struct hbl_cn_device *hdev)
+{
+}
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
new file mode 100644
index 000000000000..0d07cd78221d
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl_cn.h"
+
+void hbl_cn_phy_set_port_status(struct hbl_cn_port *cn_port, bool up)
+{
+}
+
+int hbl_cn_phy_init(struct hbl_cn_port *cn_port)
+{
+	return 0;
+}
+
+void hbl_cn_phy_fini(struct hbl_cn_port *cn_port)
+{
+}
+
+void hbl_cn_phy_port_reconfig(struct hbl_cn_port *cn_port)
+{
+}
+
+int hbl_cn_phy_has_binary_fw(struct hbl_cn_device *hdev)
+{
+	return 0;
+}
+
+void hbl_cn_phy_set_fw_polarity(struct hbl_cn_device *hdev)
+{
+}
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
new file mode 100644
index 000000000000..9ddc23bf8194
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl_cn.h"
+
+int hbl_cn_qp_modify(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+		     enum hbl_cn_qp_state new_state, void *params)
+{
+	return 0;
+}
diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index f316c8d0f3fc..7fe3f3e68b04 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -366,6 +366,27 @@ struct hl_eq_addr_dec_intr_data {
 	__u8 pad[7];
 };
 
+#define MAX_PORTS_PER_NIC	4
+
+/* NIC interrupt type */
+enum hl_nic_interrupt_type {
+	NIC_INTR_NONE = 0,
+	NIC_INTR_TMR = 1,
+	NIC_INTR_RXB_CORE_SPI,
+	NIC_INTR_RXB_CORE_SEI,
+	NIC_INTR_QPC_RESP_ERR,
+	NIC_INTR_RXE_SPI,
+	NIC_INTR_RXE_SEI,
+	NIC_INTR_TXS,
+	NIC_INTR_TXE,
+};
+
+struct hl_eq_nic_intr_cause {
+	__le32 intr_type; /* enum hl_nic_interrupt_type */
+	__le32 pad;
+	struct hl_eq_intr_cause intr_cause[MAX_PORTS_PER_NIC];
+};
+
 struct hl_eq_entry {
 	struct hl_eq_header hdr;
 	union {
@@ -382,6 +403,7 @@ struct hl_eq_entry {
 		struct hl_eq_hbm_sei_data sei_data;	/* Gaudi2 HBM */
 		struct hl_eq_engine_arc_intr_data arc_data;
 		struct hl_eq_addr_dec_intr_data addr_dec;
+		struct hl_eq_nic_intr_cause nic_intr_cause;
 		__le64 data[7];
 	};
 };
@@ -665,6 +687,9 @@ enum pq_init_status {
  *       by the host to prevent replay attacks. public key and certificate also
  *       provided as part of the FW response.
  *
+ * CPUCP_PACKET_NIC_SET_CHECKERS -
+ *       Packet to set a specific NIC checker bit.
+ *
  * CPUCP_PACKET_MONITOR_DUMP_GET -
  *       Get monitors registers dump from the CpuCP kernel.
  *       The CPU will put the registers dump in the a buffer allocated by the driver
@@ -673,6 +698,14 @@ enum pq_init_status {
  *       data corruption in case of mismatched driver/FW versions.
  *       Obsolete.
  *
+ * CPUCP_PACKET_NIC_WQE_ASID_SET -
+ *       Packet to set nic wqe asid as the registers needed are privilege and to be configured by FW
+ *
+ * CPUCP_PACKET_NIC_ECC_INTRS_UNMASK -
+ *       Packet to unmask NIC memory registers which are masked at preboot stage. As per the Arch
+ *       team recommendation, NIC memory ECC errors should be unmasked after NIC driver is up and
+ *       running
+ *
  * CPUCP_PACKET_GENERIC_PASSTHROUGH -
  *       Generic opcode for all firmware info that is only passed to host
  *       through the LKD, without getting parsed there.
@@ -681,12 +714,28 @@ enum pq_init_status {
  *       LKD sends FW indication whether device is free or in use, this indication is reported
  *       also to the BMC.
  *
+ * CPUCP_PACKET_NIC_MAC_TX_RESET -
+ *       Packet to reset the NIC MAC Tx.
+ *
+ * CPUCP_PACKET_NIC_WQE_ASID_UNSET -
+ *       Packet to unset nic wqe asid as the registers needed are privilege and to be configured
+ *       by FW.
+ *
  * CPUCP_PACKET_SOFT_RESET -
  *       Packet to perform soft-reset.
  *
  * CPUCP_PACKET_INTS_REGISTER -
  *       Packet to inform FW that queues have been established and LKD is ready to receive
  *       EQ events.
+ *
+ * CPUCP_PACKET_NIC_INIT_TXS_MEM -
+ *      Init TXS related memory in HBM.
+ *
+ * CPUCP_PACKET_NIC_INIT_TMR_MEM -
+ *      Init HW timer related memory in HBM.
+ *
+ * CPUCP_PACKET_NIC_CLR_MEM -
+ *      Clear NIC related memory in HBM.
  */
 
 enum cpucp_packet_id {
@@ -740,21 +789,24 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_RESERVED2,			/* not used */
 	CPUCP_PACKET_SEC_ATTEST_GET,		/* internal */
 	CPUCP_PACKET_INFO_SIGNED_GET,		/* internal */
-	CPUCP_PACKET_RESERVED4,			/* not used */
+	CPUCP_PACKET_NIC_SET_CHECKERS,		/* internal */
 	CPUCP_PACKET_MONITOR_DUMP_GET,		/* debugfs */
-	CPUCP_PACKET_RESERVED5,			/* not used */
-	CPUCP_PACKET_RESERVED6,			/* not used */
-	CPUCP_PACKET_RESERVED7,			/* not used */
+	CPUCP_PACKET_RESERVED3,			/* not used */
+	CPUCP_PACKET_NIC_WQE_ASID_SET,		/* internal */
+	CPUCP_PACKET_NIC_ECC_INTRS_UNMASK,	/* internal */
 	CPUCP_PACKET_GENERIC_PASSTHROUGH,	/* IOCTL */
-	CPUCP_PACKET_RESERVED8,			/* not used */
+	CPUCP_PACKET_RESERVED4,			/* not used */
 	CPUCP_PACKET_ACTIVE_STATUS_SET,		/* internal */
-	CPUCP_PACKET_RESERVED9,			/* not used */
-	CPUCP_PACKET_RESERVED10,		/* not used */
-	CPUCP_PACKET_RESERVED11,		/* not used */
-	CPUCP_PACKET_RESERVED12,		/* internal */
-	CPUCP_PACKET_RESERVED13,                /* internal */
+	CPUCP_PACKET_NIC_MAC_TX_RESET,		/* internal */
+	CPUCP_PACKET_RESERVED5,			/* not used */
+	CPUCP_PACKET_NIC_WQE_ASID_UNSET,	/* internal */
+	CPUCP_PACKET_RESERVED6,			/* internal */
+	CPUCP_PACKET_RESERVED7,			/* internal */
 	CPUCP_PACKET_SOFT_RESET,		/* internal */
 	CPUCP_PACKET_INTS_REGISTER,		/* internal */
+	CPUCP_PACKET_NIC_INIT_TXS_MEM,		/* internal */
+	CPUCP_PACKET_NIC_INIT_TMR_MEM,		/* internal */
+	CPUCP_PACKET_NIC_CLR_MEM,		/* internal */
 	CPUCP_PACKET_ID_MAX			/* must be last */
 };
 
@@ -862,6 +914,9 @@ struct cpucp_packet {
 		/* For NIC requests */
 		__le32 port_index;
 
+		/* For NIC requests */
+		__le32 macro_index;
+
 		/* For Generic packet sub index */
 		__le32 pkt_subidx;
 	};
@@ -1058,6 +1113,21 @@ enum pvt_index {
 	PVT_NE
 };
 
+#define NIC_CHECKERS_TYPE_SHIFT		0
+#define NIC_CHECKERS_TYPE_MASK		0xFFFF
+#define NIC_CHECKERS_CHECK_SHIFT	16
+#define NIC_CHECKERS_CHECK_MASK		0x1
+#define NIC_CHECKERS_DROP_SHIFT		17
+#define NIC_CHECKERS_DROP_MASK		0x1
+
+enum nic_checkers_types {
+	RX_PKT_BAD_FORMAT = 0,
+	RX_INV_OPCODE,
+	RX_INV_SYNDROME,
+	RX_WQE_IDX_MISMATCH,
+	TX_WQE_IDX_MISMATCH = 0x80
+};
+
 /* Event Queue Packets */
 
 struct eq_generic_event {
@@ -1273,6 +1343,7 @@ struct ser_val {
  * @post_fec_ser: post FEC SER value.
  * @throughput: measured throughput.
  * @latency: measured latency.
+ * @port_toggle_cnt: counts how many times the link toggled since last port PHY init.
  */
 struct cpucp_nic_status {
 	__le32 port;
@@ -1292,6 +1363,8 @@ struct cpucp_nic_status {
 	struct ser_val post_fec_ser;
 	struct frac_val bandwidth;
 	struct frac_val lat;
+	__le32 port_toggle_cnt;
+	__u8 reserved[4];
 };
 
 enum cpucp_hbm_row_replace_cause {
@@ -1420,4 +1493,36 @@ enum hl_passthrough_type {
 	HL_PASSTHROUGH_VERSIONS,
 };
 
+/* structure cpucp_cn_init_hw_mem_packet - used for initializing the associated CN (Core Network)
+ * hw(TIMER, TX-SCHEDQ) memory in HBM using the provided parameters.
+ * @cpucp_pkt: basic cpucp packet, the rest of the parameters extend the packet.
+ * @mem_base_addr: base address of the associated memory
+ * @num_entries: number of entries.
+ * @entry_size: size of entry.
+ * @granularity: base value for first element.
+ * @pad: padding
+ */
+struct cpucp_cn_init_hw_mem_packet {
+	struct cpucp_packet cpucp_pkt;
+	__le64 mem_base_addr;
+	__le16 num_entries;
+	__le16 entry_size;
+	__le16 granularity;
+	__u8 pad[2];
+};
+
+/* structure cpucp_cn_clear_mem_packet - used for clearing the associated CN (Core Network)
+ * memory in HBM using the provided parameters.
+ * @cpucp_pkt: basic cpucp packet, the rest of the parameters extend the packet.
+ * @mem_base_addr: base address of the associated memory
+ * @size: size in bytes of the associated memory.
+ * @pad: padding
+ */
+struct cpucp_cn_clear_mem_packet {
+	struct cpucp_packet cpucp_pkt;
+	__le64 mem_base_addr;
+	__le32 size;
+	__u8 pad[4];
+};
+
 #endif /* CPUCP_IF_H */
diff --git a/include/linux/habanalabs/hl_boot_if.h b/include/linux/habanalabs/hl_boot_if.h
index 93366d5621fd..a6d9e510a974 100644
--- a/include/linux/habanalabs/hl_boot_if.h
+++ b/include/linux/habanalabs/hl_boot_if.h
@@ -194,6 +194,7 @@ enum cpu_boot_dev_sts {
 	CPU_BOOT_DEV_STS_FW_NIC_STAT_EXT_EN = 24,
 	CPU_BOOT_DEV_STS_IS_IDLE_CHECK_EN = 25,
 	CPU_BOOT_DEV_STS_MAP_HWMON_EN = 26,
+	CPU_BOOT_DEV_STS_NIC_MEM_CLEAR_EN = 27,
 	CPU_BOOT_DEV_STS_ENABLED = 31,
 	CPU_BOOT_DEV_STS_SCND_EN = 63,
 	CPU_BOOT_DEV_STS_LAST = 64 /* we have 2 registers of 32 bits */
@@ -331,6 +332,11 @@ enum cpu_boot_dev_sts {
  *					HWMON enum mapping to cpucp enums.
  *					Initialized in: linux
  *
+ * CPU_BOOT_DEV_STS0_NIC_MEM_CLEAR_EN
+ *					If set, means f/w supports nic hbm memory clear and
+ *					tmr,txs hbm memory init.
+ *					Initialized in: zephyr-mgmt
+ *
  * CPU_BOOT_DEV_STS0_ENABLED		Device status register enabled.
  *					This is a main indication that the
  *					running FW populates the device status
@@ -367,6 +373,7 @@ enum cpu_boot_dev_sts {
 #define CPU_BOOT_DEV_STS0_FW_NIC_STAT_EXT_EN	(1 << CPU_BOOT_DEV_STS_FW_NIC_STAT_EXT_EN)
 #define CPU_BOOT_DEV_STS0_IS_IDLE_CHECK_EN	(1 << CPU_BOOT_DEV_STS_IS_IDLE_CHECK_EN)
 #define CPU_BOOT_DEV_STS0_MAP_HWMON_EN		(1 << CPU_BOOT_DEV_STS_MAP_HWMON_EN)
+#define CPU_BOOT_DEV_STS0_NIC_MEM_CLEAR_EN	(1 << CPU_BOOT_DEV_STS_NIC_MEM_CLEAR_EN)
 #define CPU_BOOT_DEV_STS0_ENABLED		(1 << CPU_BOOT_DEV_STS_ENABLED)
 #define CPU_BOOT_DEV_STS1_ENABLED		(1 << CPU_BOOT_DEV_STS_ENABLED)
 
@@ -403,7 +410,7 @@ enum kmd_msg {
 	KMD_MSG_GOTO_WFE,
 	KMD_MSG_FIT_RDY,
 	KMD_MSG_SKIP_BMC,
-	RESERVED,
+	KMD_MSG_RESERVED,
 	KMD_MSG_RST_DEV,
 	KMD_MSG_LAST
 };
diff --git a/include/linux/net/intel/cn.h b/include/linux/net/intel/cn.h
new file mode 100644
index 000000000000..d040b0bbd94c
--- /dev/null
+++ b/include/linux/net/intel/cn.h
@@ -0,0 +1,474 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_CN_H_
+#define HBL_CN_H_
+
+#include <linux/types.h>
+#include <linux/sizes.h>
+#include <linux/net/intel/cn_aux.h>
+
+#define HBL_EN_PFC_PRIO_NUM	4
+#define CQ_ARM_TIMEOUT_USEC	10
+
+struct qpc_mask;
+
+/**
+ * enum hbl_cn_pflags - mutable capabilities of the port.
+ * PFLAGS_PCS_LINK_CHECK: check for PCS link periodically.
+ * PFLAGS_PHY_AUTO_NEG_LPBK: allow Autonegotiation in loopback.
+ */
+enum hbl_cn_pflags {
+	PFLAGS_PCS_LINK_CHECK = BIT(0),
+	PFLAGS_PHY_AUTO_NEG_LPBK = BIT(1),
+};
+
+enum hbl_ts_type {
+	TS_RC = 0,
+	TS_RAW = 1
+};
+
+enum hbl_trust_level {
+	UNSECURED = 0,
+	SECURED = 1,
+	PRIVILEGE = 2
+};
+
+/**
+ * enum qpc_req_wq_type - QP REQ WQ type.
+ * @QPC_REQ_WQ_TYPE_WRITE: WRITE, "native" SEND, RECV-RDV or READ-RDV operations are allowed.
+ * @QPC_REQ_WQ_TYPE_RDV_READ: No operation is allowed on this endpoint QP.
+ * @QPC_REQ_WQ_TYPE_RDV_WRITE: SEND-RDV operation is allowed on this QP.
+ */
+enum qpc_req_wq_type {
+	QPC_REQ_WQ_TYPE_WRITE = 1,
+	QPC_REQ_WQ_TYPE_RDV_READ = 2,
+	QPC_REQ_WQ_TYPE_RDV_WRITE = 3
+};
+
+/**
+ * enum hbl_ib_mem_type - Memory allocation types.
+ * @HBL_IB_MEM_INVALID: N/A option.
+ * @HBL_IB_MEM_HOST_DMA_COHERENT: Host DMA coherent memory.
+ * @HBL_IB_MEM_HOST_VIRTUAL: Host virtual memory.
+ * @HBL_IB_MEM_DEVICE: Device HBM memory.
+ * @HBL_IB_MEM_HOST_MAP_ONLY: Host mapping only.
+ * @HBL_IB_MEM_HW_BLOCK: Hw registers.
+ */
+enum hbl_ib_mem_type {
+	HBL_IB_MEM_INVALID,
+	HBL_IB_MEM_HOST_DMA_COHERENT,
+	HBL_IB_MEM_HOST_VIRTUAL,
+	HBL_IB_MEM_DEVICE,
+	HBL_IB_MEM_HOST_MAP_ONLY,
+	HBL_IB_MEM_HW_BLOCK,
+};
+
+/**
+ * struct hbl_cn_eqe - describes an event-queue entry
+ * @data: the data each event-queue entry contains
+ */
+struct hbl_cn_eqe {
+	u32 data[4];
+};
+
+/**
+ * struct hbl_cn_mem_resources - memory resource used by a memory ring.
+ * @addr: virtual address of the memory.
+ * @dma_addr: physical address of the memory.
+ * @size: memory size.
+ */
+struct hbl_cn_mem_resource {
+	void *addr;
+	dma_addr_t dma_addr;
+	u32 size;
+};
+
+/**
+ * struct hbl_cn_ring - represents a memory ring.
+ * @buf: the ring buffer memory resource.
+ * @pi: the memory-resident producer index of the ring, updated by HW
+ * @pi_shadow: producer shadow index - used by SW
+ * @ci_shadow: consumer shadow index - used by SW
+ * @rep_idx: use to count until a threshold value, like HW update
+ * @asid: the asid of the ring
+ * @count: the number of elements the ring can hold
+ * @elem_size: the rings's element size
+ */
+struct hbl_cn_ring {
+	struct hbl_cn_mem_resource buf;
+	struct hbl_cn_mem_resource pi;
+	u32 pi_shadow;
+	u32 ci_shadow;
+	u32 rep_idx;
+	u32 asid;
+	u32 count;
+	u32 elem_size;
+};
+
+/* ring support */
+#define RING_BUF_DMA_ADDRESS(ring)	((ring)->buf.dma_addr)
+#define RING_BUF_ADDRESS(ring)		((ring)->buf.addr)
+#define RING_BUF_SIZE(ring)		((ring)->buf.size)
+#define RING_PI_DMA_ADDRESS(ring)	((ring)->pi.dma_addr)
+#define RING_PI_ADDRESS(ring)		((ring)->pi.addr)
+#define RING_PI_SIZE(ring)		((ring)->pi.size)
+#define RING_CI_ADDRESS(ring)		RING_BUF_ADDRESS(ring)
+
+/* Ethernet */
+
+/**
+ * struct hbl_en_aux_data - habanalabs data for the Ethernet driver.
+ * @pdev: pointer to PCI device.
+ * @dev: related kernel basic device structure.
+ * @asic_specific: ASIC specific data.
+ * @fw_ver: FW version.
+ * @qsfp_eeprom: QSFPD EEPROM info.
+ * @mac_addr: array of all MAC addresses.
+ * @asic_type: ASIC specific type.
+ * @ports_mask: mask of available ports.
+ * @auto_neg_mask: mask of port with Autonegotiation enabled.
+ * @pending_reset_long_timeout: long timeout for pending hard reset to finish in seconds.
+ * @max_frm_len: maximum allowed frame length.
+ * @raw_elem_size: size of element in raw buffers.
+ * @max_raw_mtu: maximum MTU size for raw packets.
+ * @min_raw_mtu: minimum MTU size for raw packets.
+ * @id: device ID.
+ * @max_num_of_ports: max number of available ports.
+ * @has_eq: true if event queue is supported.
+ */
+struct hbl_en_aux_data {
+	struct pci_dev *pdev;
+	struct device *dev;
+	void *asic_specific;
+	char *fw_ver;
+	char *qsfp_eeprom;
+	char **mac_addr;
+	enum hbl_cn_asic_type asic_type;
+	u64 ports_mask;
+	u64 auto_neg_mask;
+	u32 pending_reset_long_timeout;
+	u32 max_frm_len;
+	u32 raw_elem_size;
+	u16 max_raw_mtu;
+	u16 min_raw_mtu;
+	u16 id;
+	u8 max_num_of_ports;
+	u8 has_eq;
+};
+
+/**
+ * struct hbl_en_aux_ops - pointer functions for cn <-> en drivers communication.
+ * @device_operational: is device operational.
+ * @hw_access_lock: prevent HW access.
+ * @hw_access_unlock: allow HW access.
+ * @is_eth_lpbk: is Ethernet loopback enabled.
+ * @port_hw_init: port HW init.
+ * @port_hw_fini: port HW cleanup.
+ * @phy_init: port PHY init.
+ * @phy_fini: port PHY cleanup.
+ * @set_pfc: enable/disable PFC.
+ * @get_cnts_num: get the number of available counters.
+ * @get_cnts_names: get the names of the available counters.
+ * @get_cnts_values: get the values of the available counters.
+ * @eq_dispatcher_register_qp: register QP to its event dispatch queue.
+ * @eq_dispatcher_unregister_qp: un-register QP from its event dispatch queue.
+ * @get_speed: get the port speed in Mb/s.
+ * @track_ext_port_reset: track the reset of the given port according to the given syndrome.
+ * @port_toggle_count: count port toggles upon actions that teardown or create a port.
+ * @ports_reopen: reopen the ports after hard reset.
+ * @ports_stop_prepare: prepare the ports for a stop.
+ * @ports_stop: stop traffic.
+ * @set_port_status: set the link port status.
+ * @get_mac_lpbk: get MAC loopback status.
+ * @set_mac_lpbk: set MAC loopback status.
+ * @update_mtu: update all QPs to use the new MTU value.
+ * @qpc_write: write a QP context to the HW.
+ * @ctrl_lock: control mutex lock.
+ * @ctrl_unlock: control mutex unlock.
+ * @is_port_open: is port open;
+ * @get_src_ip: get the source IP of the given port.
+ * @reset_stats: reset port statistics (called from debugfs only).
+ * @get_mtu: get the port MTU value.
+ * @get_pflags: get the port private flags.
+ * @set_dev_lpbk: set loopback status on the net-device.
+ * @handle_eqe: handle event queue entry from H/W.
+ * @asic_ops: pointer for ASIC specific ops struct.
+ */
+struct hbl_en_aux_ops {
+	/* en2cn */
+	bool (*device_operational)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_lock)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_unlock)(struct hbl_aux_dev *aux_dev);
+	bool (*is_eth_lpbk)(struct hbl_aux_dev *aux_dev);
+	int (*port_hw_init)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*port_hw_fini)(struct hbl_aux_dev *aux_dev, u32 port);
+	int (*phy_init)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*phy_fini)(struct hbl_aux_dev *aux_dev, u32 port);
+	int (*set_pfc)(struct hbl_aux_dev *aux_dev, u32 port, bool enable);
+	int (*get_cnts_num)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*get_cnts_names)(struct hbl_aux_dev *aux_dev, u32 port, u8 *data);
+	void (*get_cnts_values)(struct hbl_aux_dev *aux_dev, u32 port, u64 *data);
+	bool (*get_mac_lpbk)(struct hbl_aux_dev *aux_dev, u32 port);
+	int (*set_mac_lpbk)(struct hbl_aux_dev *aux_dev, u32 port, bool enable);
+	int (*update_mtu)(struct hbl_aux_dev *aux_dev, u32 port, u32 mtu);
+	int (*qpc_write)(struct hbl_aux_dev *aux_dev, u32 port, void *qpc,
+			 struct qpc_mask *qpc_mask, u32 qpn, bool is_req);
+	void (*ctrl_lock)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*ctrl_unlock)(struct hbl_aux_dev *aux_dev, u32 port);
+	int (*eq_dispatcher_register_qp)(struct hbl_aux_dev *aux_dev, u32 port, u32 asid,
+					 u32 qp_id);
+	int (*eq_dispatcher_unregister_qp)(struct hbl_aux_dev *aux_dev, u32 port, u32 qp_id);
+	u32 (*get_speed)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*track_ext_port_reset)(struct hbl_aux_dev *aux_dev, u32 port, u32 syndrome);
+	void (*port_toggle_count)(struct hbl_aux_dev *aux_dev, u32 port);
+
+	/* cn2en */
+	int (*ports_reopen)(struct hbl_aux_dev *aux_dev);
+	void (*ports_stop_prepare)(struct hbl_aux_dev *aux_dev);
+	void (*ports_stop)(struct hbl_aux_dev *aux_dev);
+	void (*set_port_status)(struct hbl_aux_dev *aux_dev, u32 port_idx, bool up);
+	bool (*is_port_open)(struct hbl_aux_dev *aux_dev, u32 port_idx);
+	int (*get_src_ip)(struct hbl_aux_dev *aux_dev, u32 port_idx, u32 *src_ip);
+	void (*reset_stats)(struct hbl_aux_dev *aux_dev, u32 port_idx);
+	u32 (*get_mtu)(struct hbl_aux_dev *aux_dev, u32 port_idx);
+	u32 (*get_pflags)(struct hbl_aux_dev *aux_dev, u32 port_idx);
+	void (*set_dev_lpbk)(struct hbl_aux_dev *aux_dev, u32 port_idx, bool enable);
+	void (*handle_eqe)(struct hbl_aux_dev *aux_dev, u32 port, struct hbl_cn_eqe *eqe);
+	void *asic_ops;
+};
+
+/* InfiniBand */
+
+#define HBL_IB_CNT_NAME_LEN	(ETH_GSTRING_LEN * 2)
+
+/**
+ * struct hbl_ib_device_attr - IB device attributes.
+ * @fw_ver: firmware version.
+ * @max_mr_size: max size of a memory region.
+ * @page_size_cap: largest page size in MMU.
+ * @vendor_id: device vendor ID.
+ * @vendor_part_id: device vendor part ID.
+ * @hw_ver: device chip version.
+ * @cqe_size: Size of Completion Queue Entry.
+ * @min_cq_entries: Minimum completion queue entries needed.
+ * @max_qp: max QPs supported.
+ * @max_qp_wr: max QPs per work-request supported.
+ * @max_cqe: max completion-queue entries supported.
+ */
+struct hbl_ib_device_attr {
+	u64 fw_ver;
+	u64 max_mr_size;
+	u64 page_size_cap;
+	u32 vendor_id;
+	u32 vendor_part_id;
+	u32 hw_ver;
+	u32 cqe_size;
+	u32 min_cq_entries;
+	s32 max_qp;
+	s32 max_qp_wr;
+	s32 max_cqe;
+};
+
+/**
+ * struct hbl_ib_port_attr - IB port attributes.
+ * @speed: speed in Mb/s.
+ * @max_msg_sz: max message size
+ * @max_mtu: max mtu size
+ * @open: is open and fully initialized.
+ * @link_up: has PCS link.
+ * @num_lanes: number of lanes per port.
+ */
+struct hbl_ib_port_attr {
+	u32 speed;
+	u32 max_msg_sz;
+	u32 max_mtu;
+	u8 open;
+	u8 link_up;
+	u8 num_lanes;
+};
+
+/**
+ * struct hbl_ib_port_cnts_data - IB port counters data.
+ * @names: Names of the counters.
+ * @num: Number of counters.
+ */
+struct hbl_ib_port_cnts_data {
+	u8 *names;
+	u32 num;
+};
+
+/**
+ * struct hbl_ib_dump_qp_attr - IB QP dump attributes.
+ * @port: Port ID the QP belongs to.
+ * @qpn: QP number.
+ * @req: Requester QP, otherwise responder.
+ * @full: Include full QP information.
+ * @force: Force reading a QP in invalid/error state.
+ */
+struct hbl_ib_dump_qp_attr {
+	u32 port;
+	u32 qpn;
+	u8 req;
+	u8 full;
+	u8 force;
+};
+
+/**
+ * struct hbl_ib_mem_info - Information for a memory region pertaining to a memory handle.
+ * @cpu_addr: The kernel virtual address.
+ * @bus_addr: The bus address.
+ * @mtype: The memory type.
+ * @mem_handle: The memory handle.
+ * @size: The size of the memory region.
+ * @vmalloc: The memory is virtually contiguous only.
+ */
+struct hbl_ib_mem_info {
+	void *cpu_addr;
+	dma_addr_t bus_addr;
+	enum hbl_ib_mem_type mtype;
+	u64 mem_handle;
+	u64 size;
+	u8 vmalloc;
+};
+
+/**
+ * struct hbl_ib_aux_data - habanalabs data for the IB driver.
+ * @pdev: pointer to PCI device.
+ * @dev: related kernel basic device structure.
+ * @cnts_data: Ports counters data.
+ * @ports_mask: mask of available ports.
+ * @ext_ports_mask: mask of external ports (subset of ports_mask).
+ * @dram_size: available DRAM size.
+ * @max_num_of_wqes: maximum number of WQ entries.
+ * @pending_reset_long_timeout: long timeout for pending hard reset to finish in seconds.
+ * @id: device ID.
+ * @max_num_of_ports: maximum number of ports supported by ASIC.
+ * @mixed_qp_wq_types: Using mixed QP WQ types is supported.
+ * @umr_support: device supports UMR.
+ * @cc_support: device supports congestion control.
+ */
+struct hbl_ib_aux_data {
+	struct pci_dev *pdev;
+	struct device *dev;
+	struct hbl_ib_port_cnts_data *cnts_data;
+	u64 ports_mask;
+	u64 ext_ports_mask;
+	u64 dram_size;
+	u32 max_num_of_wqes;
+	u32 pending_reset_long_timeout;
+	u16 id;
+	u8 max_num_of_ports;
+	u8 mixed_qp_wq_types;
+	u8 umr_support;
+	u8 cc_support;
+};
+
+/**
+ * struct hbl_ib_aux_ops - pointer functions for cn <-> ib drivers communication.
+ * @device_operational: is device operational.
+ * @hw_access_lock: prevent HW access.
+ * @hw_access_unlock: allow HW access.
+ * @alloc_ucontext: allocate user context.
+ * @dealloc_ucontext: deallocate user context.
+ * @query_port: get port attributes.
+ * @cmd_ctrl: operate the device with proprietary opcodes.
+ * @query_device: get device attributes.
+ * @set_ip_addr_encap: setup IP address encapsulation.
+ * @qp_syndrome_to_str: translates syndrome qp number to string.
+ * @verify_qp_id: verify if the specified QP id is valid.
+ * @get_cnts_values: get the values of the available counters.
+ * @dump_qp: dump QP context to the given buffer.
+ * @query_mem_handle: query information for a memory handle.
+ * @eqe_work_schd: schedule a user eq poll work on hbl side.
+ * @dispatch_fatal_event: raise a fatal event to user space.
+ */
+struct hbl_ib_aux_ops {
+	/* ib2cn */
+	bool (*device_operational)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_lock)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_unlock)(struct hbl_aux_dev *aux_dev);
+	int (*alloc_ucontext)(struct hbl_aux_dev *aux_dev, int user_fd, void **cn_ib_ctx);
+	void (*dealloc_ucontext)(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx);
+	void (*query_port)(struct hbl_aux_dev *aux_dev, u32 port,
+			   struct hbl_ib_port_attr *port_attr);
+	int (*cmd_ctrl)(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx, u32 op, void *input,
+			void *output);
+	void (*query_device)(struct hbl_aux_dev *aux_dev, struct hbl_ib_device_attr *device_attr);
+	void (*set_ip_addr_encap)(struct hbl_aux_dev *aux_dev, u32 ip_addr, u32 port);
+	char *(*qp_syndrome_to_str)(struct hbl_aux_dev *aux_dev, u32 syndrome);
+	int (*verify_qp_id)(struct hbl_aux_dev *aux_dev, u32 qp_id, u32 port);
+	void (*get_cnts_values)(struct hbl_aux_dev *aux_dev, u32 port, u64 *data);
+	int (*dump_qp)(struct hbl_aux_dev *aux_dev, struct hbl_ib_dump_qp_attr *attr, char *buf,
+		       size_t size);
+	int (*query_mem_handle)(struct hbl_aux_dev *aux_dev, u64 mem_handle,
+				struct hbl_ib_mem_info *info);
+
+	/* cn2ib */
+	void (*eqe_work_schd)(struct hbl_aux_dev *aux_dev, u32 port);
+	void (*dispatch_fatal_event)(struct hbl_aux_dev *aux_dev, u32 asid);
+};
+
+/* CN */
+
+/* interrupt type */
+enum hbl_cn_cpucp_interrupt_type {
+	HBL_CN_CPUCP_INTR_NONE = 0,
+	HBL_CN_CPUCP_INTR_TMR = 1,
+	HBL_CN_CPUCP_INTR_RXB_CORE_SPI,
+	HBL_CN_CPUCP_INTR_RXB_CORE_SEI,
+	HBL_CN_CPUCP_INTR_QPC_RESP_ERR,
+	HBL_CN_CPUCP_INTR_RXE_SPI,
+	HBL_CN_CPUCP_INTR_RXE_SEI,
+	HBL_CN_CPUCP_INTR_TXS,
+	HBL_CN_CPUCP_INTR_TXE,
+};
+
+/*
+ * struct hbl_cn_eq_port_intr_cause - port interrupt cause data.
+ * @intr_cause_data: interrupt cause data.
+ */
+struct hbl_cn_eq_port_intr_cause {
+	u64 intr_cause_data;
+};
+
+/*
+ * struct hbl_cn_eq_intr_cause - interrupt cause data.
+ * @intr_type: interrupt type.
+ * @intr_cause: array of ports interrupt cause data.
+ */
+struct hbl_cn_eq_intr_cause {
+	u32 intr_type; /* enum hbl_cn_cpucp_interrupt_type */
+	u32 pad;
+	struct hbl_cn_eq_port_intr_cause intr_cause[MAX_PORTS_PER_NIC];
+};
+
+/*
+ * struct hbl_cn_cpucp_frac_val - fracture value represented by "integer.frac".
+ * @integer: the integer part of the fracture value;
+ * @frac: the fracture part of the fracture value.
+ */
+struct hbl_cn_cpucp_frac_val {
+	union {
+		struct {
+			u16 integer;
+			u16 frac;
+		};
+		u16 val;
+	};
+};
+
+/*
+ * struct hbl_cn_cpucp_ser_val - Symbol Error Rate value represented by "integer * 10 ^ -exp".
+ * @integer: the integer part of the SER value.
+ * @exp: the exponent part of the SER value.
+ */
+struct hbl_cn_cpucp_ser_val {
+	u16 integer;
+	u16 exp;
+};
+
+#endif /* HBL_CN_H_ */
diff --git a/include/linux/net/intel/cn_aux.h b/include/linux/net/intel/cn_aux.h
new file mode 100644
index 000000000000..8a7f54e78afb
--- /dev/null
+++ b/include/linux/net/intel/cn_aux.h
@@ -0,0 +1,298 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_CN_AUX_H_
+#define HBL_CN_AUX_H_
+
+#include <linux/irqreturn.h>
+#include <linux/habanalabs/cpucp_if.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/if_vlan.h>
+#include <uapi/linux/ethtool.h>
+
+#define HBL_EN_MAX_HEADERS_SZ	(ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN)
+
+/* driver specific value, should always be >= asic specific h/w resource */
+#define NIC_DRV_MAX_CQS_NUM	32
+#define NIC_DRV_MAX_CCQS_NUM	4
+#define NIC_DRV_NUM_DB_FIFOS	32
+
+/**
+ * enum hbl_cn_asic_type - supported ASIC types.
+ * @ASIC_GAUDI2: Gaudi2 device.
+ */
+enum hbl_cn_asic_type {
+	HBL_ASIC_GAUDI2,
+};
+
+/**
+ * enum hbl_cn_status_cmd - status cmd type.
+ * @HBL_CN_STATUS_ONE_SHOT: one shot command.
+ * @HBL_CN_STATUS_PERIODIC_START: start periodic status update.
+ * @HBL_CN_STATUS_PERIODIC_STOP: stop periodic status update.
+ */
+enum hbl_cn_status_cmd {
+	HBL_CN_STATUS_ONE_SHOT,
+	HBL_CN_STATUS_PERIODIC_START,
+	HBL_CN_STATUS_PERIODIC_STOP,
+};
+
+/**
+ * enum hbl_aux_dev_type - auxiliary device type.
+ * HBL_AUX_DEV_CN: Shared Network Interface.
+ * HBL_AUX_DEV_ETH: Ethernet.
+ * HBL_AUX_DEV_IB: InfiniBand.
+ */
+enum hbl_aux_dev_type {
+	HBL_AUX_DEV_CN,
+	HBL_AUX_DEV_ETH,
+	HBL_AUX_DEV_IB,
+};
+
+/**
+ * struct hbl_aux_dev - habanalabs auxiliary device structure.
+ * @adev: auxiliary device.
+ * @aux_ops: pointer functions for drivers communication.
+ * @aux_data: essential data for operating the auxiliary device.
+ * @priv: auxiliary device private data.
+ * @type: type of the auxiliary device.
+ */
+struct hbl_aux_dev {
+	struct auxiliary_device adev;
+	void *aux_ops;
+	void *aux_data;
+	void *priv;
+	enum hbl_aux_dev_type type;
+};
+
+/**
+ * struct hbl_cn_stat - Holds ASIC specific statistics string and default register offset.
+ * @str: String name of ethtool stat.
+ * @lo_offset: Register offset of the stat.
+ * @hi_offset: High register offset. May be unused for some stats.
+ */
+struct hbl_cn_stat {
+	char str[ETH_GSTRING_LEN];
+	int lo_offset;
+	int hi_offset;
+};
+
+/*
+ * struct hbl_cn_cpucp_mac_addr - port MAC address received from FW.
+ * @mac_addr: port MAC address.
+ */
+struct hbl_cn_cpucp_mac_addr {
+	u8 mac_addr[ETH_ALEN];
+};
+
+/*
+ * struct hbl_cn_cpucp_info - info received from FW.
+ * @mac_addrs: array of MAC address for all physical ports.
+ * @link_mask: mask of available ports.
+ * @pol_tx_mask: array of Tx polarity value for all ports.
+ * @pol_rx_mask: array of Rx polarity value for all ports.
+ * @link_ext_mask: mask of external ports.
+ * @qsfp_eeprom: QSFP EEPROM info.
+ * @auto_neg_mask: mask of ports which supports Autonegotiation.
+ * @serdes_type: type of serdes.
+ * @tx_swap_map: lane swapping map.
+ */
+struct hbl_cn_cpucp_info {
+	struct hbl_cn_cpucp_mac_addr mac_addrs[CPUCP_MAX_NICS];
+	u64 link_mask[CPUCP_NIC_MASK_ARR_LEN];
+	u64 pol_tx_mask[CPUCP_NIC_POLARITY_ARR_LEN];
+	u64 pol_rx_mask[CPUCP_NIC_POLARITY_ARR_LEN];
+	u64 link_ext_mask[CPUCP_NIC_MASK_ARR_LEN];
+	u8 qsfp_eeprom[CPUCP_NIC_QSFP_EEPROM_MAX_LEN];
+	u64 auto_neg_mask[CPUCP_NIC_MASK_ARR_LEN];
+	enum cpucp_serdes_type serdes_type;
+	u16 tx_swap_map[CPUCP_MAX_NICS];
+};
+
+/**
+ * struct hbl_cn_aux_data - habanalabs data for the cn driver.
+ * @pdev: pointer to PCI device.
+ * @dev: related kernel basic device structure.
+ * @asic_specific: ASIC specific data.
+ * @fw_ver: FW version.
+ * @asic_type: ASIC specific type.
+ * @ports_mask: mask of available ports.
+ * @ext_ports_mask: mask of external ports (subset of ports_mask).
+ * @auto_neg_mask: mask of ports with Autonegotiation enabled.
+ * @dram_size: available DRAM size.
+ * @nic_drv_addr: base address for NIC driver on DRAM.
+ * @nic_drv_size: driver size reserved for NIC driver on DRAM.
+ * @macro_cfg_size: the size of the macro configuration space.
+ * @max_num_of_ports: max number of available ports.
+ * @pending_reset_long_timeout: long timeout for pending hard reset to finish in seconds.
+ * @kernel_asid: kernel ASID.
+ * @card_location: the OAM number in the HLS (relevant for PMC card type).
+ * @device_timeout: device access timeout in usec.
+ * @fw_major_version: major version of current loaded preboot.
+ * @fw_minor_version: minor version of current loaded preboot.
+ * @fw_app_cpu_boot_dev_sts0: bitmap representation of application security
+ *                            status reported by FW, bit description can be
+ *                            found in CPU_BOOT_DEV_STS0
+ * @fw_app_cpu_boot_dev_sts1: bitmap representation of application security
+ *                            status reported by FW, bit description can be
+ *                            found in CPU_BOOT_DEV_STS1
+ * @id: device ID.
+ * @cache_line_size: device cache line size.
+ * @clk: clock frequency in MHz.
+ * @pldm: is running on Palladium setup.
+ * @skip_phy_init: avoid writing/reading PHY registers.
+ * @load_phy_fw: load PHY F/W.
+ * @cpucp_fw: is CPUCP FW enabled.
+ * @supports_coresight: is CoreSight supported.
+ * @use_fw_serdes_info: true if FW serdes values should be used, false if hard coded values should
+ *                      be used.
+ * @mmu_enable: is MMU enabled.
+ * @lanes_per_port: number of physical lanes per port.
+ * @cpucp_checkers_shift: CPUCP checkers flags shift.
+ */
+struct hbl_cn_aux_data {
+	struct pci_dev *pdev;
+	struct device *dev;
+	void *asic_specific;
+	char *fw_ver;
+	enum hbl_cn_asic_type asic_type;
+	u64 ports_mask;
+	u64 ext_ports_mask;
+	u64 auto_neg_mask;
+	u64 dram_size;
+	u64 nic_drv_addr;
+	u64 nic_drv_size;
+	u32 macro_cfg_size;
+	u32 pending_reset_long_timeout;
+	u32 kernel_asid;
+	u32 card_location;
+	u32 device_timeout;
+	u32 fw_major_version;
+	u32 fw_minor_version;
+	u32 fw_app_cpu_boot_dev_sts0;
+	u32 fw_app_cpu_boot_dev_sts1;
+	u16 id;
+	u16 cache_line_size;
+	u16 clk;
+	u8 pldm;
+	u8 skip_phy_init;
+	u8 load_phy_fw;
+	u8 cpucp_fw;
+	u8 supports_coresight;
+	u8 use_fw_serdes_info;
+	u8 mmu_enable;
+	u8 lanes_per_port;
+	u8 cpucp_checkers_shift;
+};
+
+/**
+ * enum hbl_cn_mmu_mode - MMU modes the CN can work with.
+ * @HBL_CN_MMU_MODE_EXTERNAL: using external MMU HW IP.
+ * @HBL_CN_MMU_MODE_NETWORK_TLB: Using internal network TLB (but external page-table).
+ */
+enum hbl_cn_mmu_mode {
+	HBL_CN_MMU_MODE_EXTERNAL,
+	HBL_CN_MMU_MODE_NETWORK_TLB,
+};
+
+/**
+ * struct hbl_cn_vm_info - VM related info for the cn driver.
+ * @mmu_mode: the type (or mode) of MMU currently configured.
+ * @ext_mmu.work_id: the unique work-ID assigned to this VM when in external MMU mode.
+ * @net_tlb.pasid: the PCI process space address ID assigned to the device.
+ * @net_tlb.page_tbl_addr: the address of the MMU page table of this VM.
+ */
+struct hbl_cn_vm_info {
+	enum hbl_cn_mmu_mode mmu_mode;
+	union {
+		struct {
+			u32 work_id;
+		} ext_mmu;
+
+		struct {
+			u32 pasid;
+			u64 page_tbl_addr;
+		} net_tlb;
+	};
+};
+
+typedef bool (*hbl_cn_poll_cond_func)(u32 val, void *arg);
+
+enum hbl_cn_mem_type {
+	HBL_CN_MEM_TYPE_HOST,
+	HBL_CN_MEM_TYPE_DEVICE,
+};
+
+/**
+ * struct hbl_cn_aux_ops - pointer functions for cn <-> compute drivers communication.
+ * @device_operational: is device operational.
+ * @hw_access_lock: prevent HW access.
+ * @hw_access_unlock: allow HW access.
+ * @device_reset: Perform device reset.
+ * @vm_dev_mmu_map: map cpu/kernel address or device memory range to device address range in order
+ *                  to provide device-memory access.
+ * @vm_dev_mmu_unmap: unmap a previously mapped address range.
+ * @vm_reserve_dva_block: Reserve a device virtual block of a given size.
+ * @vm_unreserve_dva_block: Release a given device virtual block.
+ * @dram_readl: Read long from DRAM.
+ * @dram_writel: Write long to DRAM.
+ * @rreg: Read register.
+ * @wreg: Write register.
+ * @get_reg_pcie_addr: Retrieve pci address.
+ * @poll_reg: Poll on a register until a given condition is fulfilled or timeout.
+ * @get_cpucp_info: fetch updated CPUCP info.
+ * @register_cn_user_context: register a user context represented by user provided FD. If the
+ *                            returned comp_handle and vm_handle are equal then this context doesn't
+ *                            support data transfer.
+ * @deregister_cn_user_context: de-register the user context represented by the vm_handle returned
+ *                              from calling register_cn_user_context.
+ * @vm_create: create a VM in registered context.
+ * @vm_destroy: destroy a VM in registered context.
+ * @get_vm_info: get information on a VM.
+ * @ports_reopen: reopen the ports after hard reset.
+ * @ports_stop_prepare: prepare the ports for a stop.
+ * @ports_stop: stop traffic.
+ * @synchronize_irqs: Synchronize IRQs.
+ * @asic_ops: pointer for ASIC specific ops struct.
+ */
+struct hbl_cn_aux_ops {
+	/* cn2compute */
+	bool (*device_operational)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_lock)(struct hbl_aux_dev *aux_dev);
+	void (*hw_access_unlock)(struct hbl_aux_dev *aux_dev);
+	void (*device_reset)(struct hbl_aux_dev *aux_dev);
+	int (*vm_dev_mmu_map)(struct hbl_aux_dev *aux_dev, u64 vm_handle,
+			      enum hbl_cn_mem_type mem_type, u64 addr, u64 dva, size_t size);
+	void (*vm_dev_mmu_unmap)(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 dva, size_t size);
+	int (*vm_reserve_dva_block)(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 size, u64 *dva);
+	void (*vm_unreserve_dva_block)(struct hbl_aux_dev *aux_dev, u64 vm_handle, u64 dva,
+				       u64 size);
+	u32 (*dram_readl)(struct hbl_aux_dev *aux_dev, u64 addr);
+	void (*dram_writel)(struct hbl_aux_dev *aux_dev, u32 val, u64 addr);
+	u32 (*rreg)(struct hbl_aux_dev *aux_dev, u32 reg);
+	void (*wreg)(struct hbl_aux_dev *aux_dev, u32 reg, u32 val);
+	int (*get_reg_pcie_addr)(struct hbl_aux_dev *aux_dev, u32 reg, u64 *pci_addr);
+	int (*poll_reg)(struct hbl_aux_dev *aux_dev, u32 reg, u64 timeout_us,
+			hbl_cn_poll_cond_func func, void *arg);
+	void (*get_cpucp_info)(struct hbl_aux_dev *aux_dev,
+			       struct hbl_cn_cpucp_info *hbl_cn_cpucp_info);
+	int (*register_cn_user_context)(struct hbl_aux_dev *aux_dev, int user_fd,
+					const void *cn_ctx, u64 *comp_handle, u64 *vm_handle);
+	void (*deregister_cn_user_context)(struct hbl_aux_dev *aux_dev, u64 vm_handle);
+	int (*vm_create)(struct hbl_aux_dev *aux_dev, u64 comp_handle, u32 flags, u64 *vm_handle);
+	void (*vm_destroy)(struct hbl_aux_dev *aux_dev, u64 vm_handle);
+	int (*get_vm_info)(struct hbl_aux_dev *aux_dev, u64 vm_handle,
+			   struct hbl_cn_vm_info *vm_info);
+
+	/* compute2cn */
+	int (*ports_reopen)(struct hbl_aux_dev *aux_dev);
+	void (*ports_stop_prepare)(struct hbl_aux_dev *aux_dev, bool fw_reset, bool in_teardown);
+	void (*ports_stop)(struct hbl_aux_dev *aux_dev);
+	void (*synchronize_irqs)(struct hbl_aux_dev *aux_dev);
+	void *asic_ops;
+};
+
+#endif /* HBL_CN_AUX_H_ */
diff --git a/include/linux/net/intel/cni.h b/include/linux/net/intel/cni.h
new file mode 100644
index 000000000000..206b93ffd0e8
--- /dev/null
+++ b/include/linux/net/intel/cni.h
@@ -0,0 +1,636 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#ifndef HBL_CNI_H_
+#define HBL_CNI_H_
+
+#include <linux/if_ether.h>
+#include <linux/types.h>
+
+#define HBL_CNI_STAT_STR_LEN	32
+
+/* Requester */
+#define HBL_CNI_CQE_TYPE_REQ	0
+/* Responder */
+#define HBL_CNI_CQE_TYPE_RES	1
+
+/* Number of backpressure offsets */
+#define HBL_CNI_USER_BP_OFFS_MAX	16
+
+/* Number of FnA addresses for SRAM/DCCM completion */
+#define HBL_CNI_FNA_CMPL_ADDR_NUM 2
+
+/**
+ * struct hbl_cni_alloc_conn_in - NIC opcode HBL_CNI_OP_ALLOC_CONN in param.
+ * @port: NIC port ID.
+ * @hint: this may be used as the connection-number hint for the driver as a recommendation of user.
+ */
+struct hbl_cni_alloc_conn_in {
+	u32 port;
+	u32 hint;
+};
+
+/**
+ * struct hbl_cni_alloc_conn_out - NIC opcode HBL_CNI_OP_ALLOC_CONN out param.
+ * @conn_id: Connection ID.
+ */
+struct hbl_cni_alloc_conn_out {
+	u32 conn_id;
+};
+
+/**
+ * struct hbl_cni_req_conn_ctx_in - NIC opcode HBL_CNI_OP_SET_REQ_CONN_CTX in param.
+ * @dst_ip_addr: Destination IP address in native endianness.
+ * @dst_conn_id: Destination connection ID.
+ * @port: NIC port ID.
+ * @conn_id: Connection ID.
+ * @dst_mac_addr: Destination MAC address.
+ * @priority: Connection priority [0..3].
+ * @timer_granularity: Timer granularity [0..127].
+ * @swq_granularity: SWQ granularity [0 for 32B or 1 for 64B].
+ * @wq_type: Work queue type [1..3].
+ * @cq_number: Completion queue number.
+ * @wq_remote_log_size: Remote Work queue log size [2^QPC] Rendezvous.
+ * @congestion_en: Enable/disable Congestion-Control.
+ * @congestion_wnd: Congestion-Window size.
+ * @mtu: Max Transmit Unit.
+ * @encap_en: used as boolean; indicates if this QP has encapsulation support.
+ * @encap_id: Encapsulation-id; valid only if 'encap_en' is set.
+ * @wq_size: Max number of elements in the work queue.
+ * @loopback: used as boolean; indicates if this QP used for loopback mode.
+ * @compression_en: Enable compression.
+ * @remote_key: Remote-key to be used to generate on outgoing packets.
+ */
+struct hbl_cni_req_conn_ctx_in {
+	u32 reserved0;
+	u32 dst_ip_addr;
+	u32 dst_conn_id;
+	u32 deprecated0;
+	u32 reserved1;
+	u32 port;
+	u32 conn_id;
+	u8 dst_mac_addr[ETH_ALEN];
+	u8 deprecated1;
+	u8 priority;
+	u8 deprecated2;
+	u8 timer_granularity;
+	u8 swq_granularity;
+	u8 wq_type;
+	u8 deprecated3;
+	u8 cq_number;
+	u8 wq_remote_log_size;
+	u8 congestion_en;
+	u32 congestion_wnd;
+	u16 mtu;
+	u8 encap_en;
+	u8 encap_id;
+	u32 wq_size;
+	u8 loopback;
+	u8 reserved2;
+	u8 reserved3;
+	u8 compression_en;
+	u32 remote_key;
+};
+
+/**
+ * struct hbl_cni_req_conn_ctx_out - NIC opcode HBL_CNI_OP_SET_REQ_CONN_CTX out param.
+ * @swq_mem_handle: Handle for send WQ memory.
+ * @rwq_mem_handle: Handle for receive WQ memory.
+ * @swq_mem_size: Size of the send WQ memory.
+ * @rwq_mem_size: Size of the receive WQ memory.
+ */
+struct hbl_cni_req_conn_ctx_out {
+	u64 swq_mem_handle;
+	u64 rwq_mem_handle;
+	u32 swq_mem_size;
+	u32 rwq_mem_size;
+};
+
+/**
+ * struct hbl_cni_res_conn_ctx_in - NIC opcode HBL_CNI_OP_SET_RES_CONN_CTX in param.
+ * @dst_ip_addr: Destination IP address in native endianness.
+ * @dst_conn_id: Destination connection ID.
+ * @port: NIC port ID.
+ * @conn_id: Connection ID.
+ * @dst_mac_addr: Destination MAC address.
+ * @priority: Connection priority [0..3].
+ * @wq_peer_granularity: Work queue granularity.
+ * @cq_number: Completion queue number.
+ * @conn_peer: Connection peer.
+ * @rdv: used as boolean; indicates if this QP is RDV (WRITE or READ).
+ * @loopback: used as boolean; indicates if this QP used for loopback mode.
+ * @encap_en: used as boolean; indicates if this QP has encapsulation support.
+ * @encap_id: Encapsulation-id; valid only if 'encap_en' is set.
+ * @wq_peer_size: size of the peer Work queue.
+ * @local_key: Local-key to be used to validate against incoming packets.
+ */
+struct hbl_cni_res_conn_ctx_in {
+	u32 reserved;
+	u32 dst_ip_addr;
+	u32 dst_conn_id;
+	u32 port;
+	u32 conn_id;
+	u8 dst_mac_addr[ETH_ALEN];
+	u8 priority;
+	u8 deprecated1;
+	u8 deprecated2;
+	u8 wq_peer_granularity;
+	u8 cq_number;
+	u8 deprecated3;
+	u32 conn_peer;
+	u8 rdv;
+	u8 loopback;
+	u8 encap_en;
+	u8 encap_id;
+	u32 wq_peer_size;
+	u32 local_key;
+};
+
+/**
+ * struct hbl_cni_destroy_conn_in - NIC opcode HBL_CNI_OP_DESTROY_CONN in param.
+ * @port: NIC port ID.
+ * @conn_id: Connection ID.
+ */
+struct hbl_cni_destroy_conn_in {
+	u32 port;
+	u32 conn_id;
+};
+
+/**
+ * enum hbl_nic_mem_type - NIC WQ memory allocation type.
+ * @HBL_CNI_USER_WQ_SEND: Allocate memory for the user send WQ array.
+ * @HBL_CNI_USER_WQ_RECV: Allocate memory for the user receive WQ array.
+ * @HBL_CNI_USER_WQ_TYPE_MAX: number of values in enum.
+ */
+enum hbl_nic_mem_type {
+	HBL_CNI_USER_WQ_SEND,
+	HBL_CNI_USER_WQ_RECV,
+	HBL_CNI_USER_WQ_TYPE_MAX
+};
+
+/**
+ * enum hbl_nic_mem_id - memory allocation methods.
+ * @HBL_CNI_MEM_HOST: memory allocated on the host memory.
+ * @HBL_CNI_MEM_DEVICE: memory allocated on the device memory.
+ */
+enum hbl_nic_mem_id {
+	HBL_CNI_MEM_HOST = 1,
+	HBL_CNI_MEM_DEVICE
+};
+
+/**
+ * enum hbl_nic_swq_granularity - send WQE granularity.
+ * @HBL_CNI_SWQE_GRAN_32B: 32 byte WQE for linear write.
+ * @HBL_CNI_SWQE_GRAN_64B: 64 byte WQE for multi-stride write.
+ */
+enum hbl_nic_swq_granularity {
+	HBL_CNI_SWQE_GRAN_32B,
+	HBL_CNI_SWQE_GRAN_64B
+};
+
+/**
+ * struct hbl_cni_user_wq_arr_set_in - NIC opcode HBL_CNI_OP_USER_WQ_SET in param.
+ * @port: NIC port ID.
+ * @num_of_wqs: Number of user WQs.
+ * @num_of_wq_entries: Number of entries per user WQ.
+ * @type: Type of user WQ array.
+ * @mem_id: Specify host/device memory allocation.
+ * @swq_granularity: Specify the granularity of send WQ, 0: 32 bytes, 1: 64 bytes.
+ */
+struct hbl_cni_user_wq_arr_set_in {
+	u64 reserved;
+	u32 port;
+	u32 num_of_wqs;
+	u32 num_of_wq_entries;
+	u32 type;
+	u32 mem_id;
+	u8 swq_granularity;
+};
+
+/**
+ * struct hbl_cni_user_wq_arr_set_out - NIC opcode HBL_CNI_OP_USER_WQ_SET out param.
+ * @mem_handle: Handle of WQ array memory buffer.
+ */
+struct hbl_cni_user_wq_arr_set_out {
+	u64 mem_handle;
+};
+
+/**
+ * struct hbl_cni_user_wq_arr_unset_in - NIC opcode HBL_CNI_OP_USER_WQ_UNSET in param.
+ * @port: NIC port ID.
+ * @type: Type of user WQ array.
+ */
+struct hbl_cni_user_wq_arr_unset_in {
+	u32 port;
+	u32 type;
+};
+
+/**
+ * struct hbl_cni_alloc_user_cq_id_in - NIC opcode HBL_CNI_OP_ALLOC_USER_CQ_ID in param.
+ * @port: NIC port ID.
+ */
+struct hbl_cni_alloc_user_cq_id_in {
+	u32 port;
+};
+
+/**
+ * struct hbl_cni_alloc_user_cq_id_out - NIC opcode HBL_CNI_OP_ALLOC_USER_CQ_ID out param.
+ * @id: CQ ID.
+ */
+struct hbl_cni_alloc_user_cq_id_out {
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_cq_id_set_in - NIC opcode HBL_CNI_OP_USER_CQ_SET in param.
+ * @port: NIC port ID.
+ * @num_of_cqes: Number of CQ entries in the buffer.
+ * @id: CQ ID.
+ */
+struct hbl_cni_user_cq_id_set_in {
+	u32 port;
+	u32 num_of_cqes;
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_cq_id_set_out - NIC opcode HBL_CNI_OP_USER_CQ_ID_SET out param.
+ * @mem_handle: Handle of CQ memory buffer.
+ * @pi_handle: Handle of CQ producer-inder memory buffer.
+ * @regs_handle: Handle of CQ Registers base-address.
+ * @regs_offset: CQ Registers sub-offset.
+ */
+struct hbl_cni_user_cq_id_set_out {
+	u64 mem_handle;
+	u64 pi_handle;
+	u64 regs_handle;
+	u32 regs_offset;
+};
+
+/**
+ * struct hbl_cni_user_cq_id_unset_in - NIC opcode HBL_CNI_OP_USER_CQ_ID_UNSET in param.
+ * @port: NIC port ID.
+ * @id: NIC CQ ID.
+ */
+struct hbl_cni_user_cq_id_unset_in {
+	u32 port;
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_dump_qp_in - NIC opcode HBL_CNI_OP_DUMP_QP in param.
+ * @user_buf_address: Pre-allocated user buffer address to hold the dump output.
+ * @user_buf_size: Size of the user buffer.
+ * @port: NIC port ID.
+ * @qpn: NIC QP ID.
+ * @req: is requester (otherwise responder).
+ */
+struct hbl_cni_dump_qp_in {
+	u64 user_buf;
+	u32 user_buf_size;
+	u32 port;
+	u32 qpn;
+	u8 req;
+};
+
+/* User App Params */
+
+/**
+ * struct hbl_cni_set_user_app_params_in - NIC opcode HBL_CNI_OP_SET_USER_APP_PARAMS in param.
+ *                                         allow the user application to set general parameters
+ *                                         regarding the RDMA nic operation. These parameters stay
+ *                                         in effect until the application releases the device
+ * @port: NIC port ID.
+ * @bp_offs: Offsets in NIC memory to signal a back pressure. Note that the advanced flag must be
+ *           enabled in case it's being set.
+ * @advanced: A boolean that indicates whether this WQ should support advanced operations, such as
+ *            RDV, QMan, WTD, etc.
+ * @adaptive_timeout_en: Enable adaptive timeout feature for this port.
+ */
+struct hbl_cni_set_user_app_params_in {
+	u32 port;
+	u32 bp_offs[HBL_CNI_USER_BP_OFFS_MAX];
+	u8 advanced;
+	u8 adaptive_timeout_en;
+};
+
+/**
+ * struct hbl_cni_get_user_app_params_in - NIC opcode HBL_CNI_OP_GET_USER_APP_PARAMS in param.
+ * @port: NIC port ID.
+ */
+struct hbl_cni_get_user_app_params_in {
+	u32 port;
+};
+
+/**
+ * struct hbl_cni_get_user_app_params_out - NIC opcode HBL_CNI_OP_GET_USER_APP_PARAMS out param.
+ * @max_num_of_qps: Number of QPs that are supported by the driver. User must allocate enough room
+ *                  for his work-queues according to this number.
+ * @num_allocated_qps: Number of QPs that were already allocated (in use).
+ * @max_allocated_qp_idx: The highest index of the allocated QPs (i.e. this is where the
+ *                        driver may allocate its next QP).
+ * @max_cq_size: Maximum size of a CQ buffer.
+ * @advanced: true if advanced features are supported.
+ * @max_num_of_cqs: Maximum number of CQs.
+ * @max_num_of_db_fifos: Maximum number of DB-FIFOs.
+ * @max_num_of_encaps: Maximum number of encapsulations.
+ * @speed: port speed in Mbps.
+ * @nic_macro_idx: macro index of this specific port.
+ * @nic_phys_port_idx: physical port index (AKA lane) of this specific port.
+ */
+struct hbl_cni_get_user_app_params_out {
+	u32 max_num_of_qps;
+	u32 num_allocated_qps;
+	u32 max_allocated_qp_idx;
+	u32 max_cq_size;
+	u8 advanced;
+	u8 max_num_of_cqs;
+	u8 max_num_of_db_fifos;
+	u8 max_num_of_encaps;
+	u32 speed;
+	u8 nic_macro_idx;
+	u8 nic_phys_port_idx;
+};
+
+/**
+ * struct hbl_cni_alloc_user_db_fifo_in - NIC opcode HBL_CNI_OP_ALLOC_USER_DB_FIFO in param
+ * @port: NIC port ID
+ * @id_hint: Hint to allocate a specific HW resource
+ */
+struct hbl_cni_alloc_user_db_fifo_in {
+	u32 port;
+	u32 id_hint;
+};
+
+/**
+ * struct hbl_cni_alloc_user_db_fifo_out - NIC opcode HBL_CNI_OP_ALLOC_USER_DB_FIFO out param
+ * @id: DB-FIFO ID
+ */
+struct hbl_cni_alloc_user_db_fifo_out {
+	u32 id;
+};
+
+/**
+ * enum hbl_nic_db_fifo_type - NIC users FIFO modes of operation.
+ * @HBL_CNI_DB_FIFO_TYPE_DB: mode for direct user door-bell submit.
+ * @HBL_CNI_DB_FIFO_TYPE_CC: mode for congestion control.
+ */
+enum hbl_nic_db_fifo_type {
+	HBL_CNI_DB_FIFO_TYPE_DB = 0,
+	HBL_CNI_DB_FIFO_TYPE_CC,
+};
+
+/**
+ * struct hbl_cni_user_db_fifo_set_in - NIC opcode HBL_CNI_OP_USER_DB_FIFO_SET in param.
+ * @port: NIC port ID
+ * @id: NIC DB-FIFO ID
+ * @mode: represents desired mode of operation for provided FIFO, according to hbl_nic_db_fifo_type
+ */
+struct hbl_cni_user_db_fifo_set_in {
+	u32 port;
+	u32 id;
+	u8 mode;
+};
+
+/**
+ * struct hbl_cni_user_db_fifo_set_out - NIC opcode HBL_CNI_OP_USER_DB_FIFO_SET out param.
+ * @ci_handle: Handle of DB-FIFO consumer-inder memory buffer.
+ * @regs_handle: Handle of DB-FIFO Registers base-address.
+ * @regs_offset: Offset to the DB-FIFO Registers.
+ * @fifo_size: fifo size that was allocated.
+ * @fifo_bp_thresh: fifo threshold that was set by the driver.
+ */
+struct hbl_cni_user_db_fifo_set_out {
+	u64 ci_handle;
+	u64 regs_handle;
+	u32 regs_offset;
+	u32 fifo_size;
+	u32 fifo_bp_thresh;
+};
+
+/**
+ * struct hbl_cni_user_db_fifo_unset_in - NIC opcode HBL_CNI_OP_USER_DB_FIFO_UNSET in param.
+ * @port: NIC port ID.
+ * @id: NIC DB-FIFO ID.
+ */
+struct hbl_cni_user_db_fifo_unset_in {
+	u32 port;
+	u32 id;
+};
+
+/* The operation completed successfully and an event was read */
+#define HBL_CNI_EQ_POLL_STATUS_SUCCESS			0
+/* The operation completed successfully, no event was found */
+#define HBL_CNI_EQ_POLL_STATUS_EQ_EMPTY			1
+/* The operation failed since it is not supported by the device/driver */
+#define HBL_CNI_EQ_POLL_STATUS_ERR_UNSUPPORTED_OP	2
+/* The operation failed, port was not found */
+#define HBL_CNI_EQ_POLL_STATUS_ERR_NO_SUCH_PORT		3
+/* The operation failed, port is disabled */
+#define HBL_CNI_EQ_POLL_STATUS_ERR_PORT_DISABLED	4
+/* The operation failed, an event-queue associated with the app was not found */
+#define HBL_CNI_EQ_POLL_STATUS_ERR_NO_SUCH_EQ		5
+/* The operation failed with an undefined error */
+#define HBL_CNI_EQ_POLL_STATUS_ERR_UNDEF		6
+
+/* completion-queue events */
+#define HBL_CNI_EQ_EVENT_TYPE_CQ_ERR			0
+/* Queue-pair events */
+#define HBL_CNI_EQ_EVENT_TYPE_QP_ERR			1
+/* Doorbell events */
+#define HBL_CNI_EQ_EVENT_TYPE_DB_FIFO_ERR		2
+/* congestion completion-queue events */
+#define HBL_CNI_EQ_EVENT_TYPE_CCQ			3
+/* Direct WQE security error. */
+#define HBL_CNI_EQ_EVENT_TYPE_WTD_SECURITY_ERR		4
+/* Numerical error */
+#define HBL_CNI_EQ_EVENT_TYPE_NUMERICAL_ERR		5
+/* Link status. */
+#define HBL_CNI_EQ_EVENT_TYPE_LINK_STATUS		6
+/* Queue-pair counters aligned */
+#define HBL_CNI_EQ_EVENT_TYPE_QP_ALIGN_COUNTERS		7
+
+/**
+ * struct hbl_cni_eq_poll_in - NIC opcode HBL_CNI_OP_EQ_POLL in param.
+ * @port: NIC port ID.
+ */
+struct hbl_cni_eq_poll_in {
+	u32 port;
+};
+
+/**
+ * struct hbl_cni_eq_poll_out - NIC opcode HBL_CNI_OP_EQ_POLL out param.
+ * @status: HBL_CNI_EQ_POLL_STATUS_*.
+ * @idx: Connection/CQ/DB-fifo index, depends on event type.
+ * @ev_data: Event-specific data.
+ * @ev_type: Event type.
+ * @rest_occurred: Was the error due to reset.
+ * @is_req: For QP events marks if corresponding QP is requestor.
+ */
+struct hbl_cni_eq_poll_out {
+	u32 status;
+	u32 idx;
+	u32 ev_data;
+	u8 ev_type;
+	u8 rest_occurred;
+	u8 is_req;
+};
+
+/**
+ * enum hbl_nic_encap_type - Supported encapsulation types
+ * @HBL_CNI_ENCAP_NONE: No Tunneling.
+ * @HBL_CNI_ENCAP_OVER_IPV4: Tunnel RDMA packets through L3 layer
+ * @HBL_CNI_ENCAP_OVER_UDP: Tunnel RDMA packets through L4 layer
+ */
+enum hbl_nic_encap_type {
+	HBL_CNI_ENCAP_NONE,
+	HBL_CNI_ENCAP_OVER_IPV4,
+	HBL_CNI_ENCAP_OVER_UDP,
+};
+
+/**
+ * struct hbl_cni_user_encap_alloc_in - NIC opcode HBL_CNI_OP_USER_ENCAP_ALLOC in param.
+ * @port: NIC port ID.
+ */
+struct hbl_cni_user_encap_alloc_in {
+	u32 port;
+};
+
+/**
+ * struct hbl_cni_user_encap_alloc_out - NIC opcode HBL_CNI_OP_USER_ENCAP_ALLOC out param.
+ * @id: Encapsulation ID.
+ */
+struct hbl_cni_user_encap_alloc_out {
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_encap_set_in - NIC opcode HBL_CNI_OP_USER_ENCAP_SET in param.
+ * @tnl_hdr_ptr: Pointer to the tunnel encapsulation header. i.e. specific tunnel header data to be
+ *               used in the encapsulation by the HW.
+ * @tnl_hdr_size: Tunnel encapsulation header size.
+ * @port: NIC port ID.
+ * @id: Encapsulation ID.
+ * @ipv4_addr: Source IP address, set regardless of encapsulation type.
+ * @udp_dst_port: The UDP destination-port. Valid for L4 tunnel.
+ * @ip_proto: IP protocol to use. Valid for L3 tunnel.
+ * @encap_type: Encapsulation type. May be either no-encapsulation or encapsulation over L3 or L4.
+ */
+struct hbl_cni_user_encap_set_in {
+	u64 tnl_hdr_ptr;
+	u32 tnl_hdr_size;
+	u32 port;
+	u32 id;
+	u32 ipv4_addr;
+	union {
+		u16 udp_dst_port;
+		u16 ip_proto;
+	};
+	u8 encap_type;
+};
+
+/**
+ * struct hbl_cni_user_encap_unset_in - NIC opcode HBL_CNI_OP_USER_ENCAP_UNSET in param.
+ * @port: NIC port ID.
+ * @id: Encapsulation ID.
+ */
+struct hbl_cni_user_encap_unset_in {
+	u32 port;
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_ccq_set_in - NIC opcode HBL_CNI_OP_USER_CCQ_SET in param.
+ * @port: NIC port ID.
+ * @num_of_entries: Number of CCQ entries in the buffer.
+ */
+struct hbl_cni_user_ccq_set_in {
+	u32 port;
+	u32 num_of_entries;
+};
+
+/**
+ * struct hbl_cni_user_ccq_set_out - NIC opcode HBL_CNI_OP_USER_CCQ_SET out param.
+ * @mem_handle: Handle of CCQ memory buffer.
+ * @pi_handle: Handle of CCQ producer-index memory buffer.
+ * @id: CQ ID.
+ */
+struct hbl_cni_user_ccq_set_out {
+	u64 mem_handle;
+	u64 pi_handle;
+	u32 id;
+};
+
+/**
+ * struct hbl_cni_user_ccq_unset_in - NIC opcode HBL_CNI_OP_USER_CCQ_UNSET in param.
+ * @port: NIC port ID.
+ */
+struct hbl_cni_user_ccq_unset_in {
+	u32 port;
+};
+
+/* Opcode to allocate connection ID */
+#define HBL_CNI_OP_ALLOC_CONN			0
+/* Opcode to set up a requester connection context */
+#define HBL_CNI_OP_SET_REQ_CONN_CTX		1
+/* Opcode to set up a responder connection context */
+#define HBL_CNI_OP_SET_RES_CONN_CTX		2
+/* Opcode to destroy a connection */
+#define HBL_CNI_OP_DESTROY_CONN			3
+/* Opcode reserved (deprecated) */
+#define HBL_CNI_OP_RESERVED0			4
+/* Opcode reserved (deprecated) */
+#define HBL_CNI_OP_RESERVED1			5
+/* Opcode reserved (deprecated) */
+#define HBL_CNI_OP_RESERVED2			6
+/* Opcode reserved (deprecated) */
+#define HBL_CNI_OP_RESERVED3			7
+/* Opcode reserved (deprecated) */
+#define HBL_CNI_OP_RESERVED4			8
+/* Opcode to set a user WQ array */
+#define HBL_CNI_OP_USER_WQ_SET			9
+/* Opcode to unset a user WQ array */
+#define HBL_CNI_OP_USER_WQ_UNSET		10
+/* Opcode reserved */
+#define HBL_CNI_OP_RESERVED5			11
+/* Opcode reserved */
+#define HBL_CNI_OP_RESERVED6			12
+/* Opcode reserved */
+#define HBL_CNI_OP_RESERVED7			13
+/* Opcode to allocate a CQ */
+#define HBL_CNI_OP_ALLOC_USER_CQ_ID		14
+/* Opcode to set specific user-application parameters */
+#define HBL_CNI_OP_SET_USER_APP_PARAMS		15
+/* Opcode to get specific user-application parameters */
+#define HBL_CNI_OP_GET_USER_APP_PARAMS		16
+/* Opcode to allocate a DB-FIFO */
+#define HBL_CNI_OP_ALLOC_USER_DB_FIFO		17
+/* Opcode to create a DB-FIFO */
+#define HBL_CNI_OP_USER_DB_FIFO_SET		18
+/* Opcode to destroy a DB-FIFO */
+#define HBL_CNI_OP_USER_DB_FIFO_UNSET		19
+/* Opcode to poll on EQ */
+#define HBL_CNI_OP_EQ_POLL			20
+/* Opcode to allocate encapsulation ID */
+#define HBL_CNI_OP_USER_ENCAP_ALLOC		21
+/* Opcode to create an encapsulation */
+#define HBL_CNI_OP_USER_ENCAP_SET		22
+/* Opcode to destroy an encapsulation */
+#define HBL_CNI_OP_USER_ENCAP_UNSET		23
+/* Opcode to create a CCQ */
+#define HBL_CNI_OP_USER_CCQ_SET			24
+/* Opcode to destroy a CCQ */
+#define HBL_CNI_OP_USER_CCQ_UNSET		25
+/* Opcode to set user CQ by ID */
+#define HBL_CNI_OP_USER_CQ_ID_SET		26
+/* Opcode to unset user CQ by ID */
+#define HBL_CNI_OP_USER_CQ_ID_UNSET		27
+/* Opcode reserved */
+#define HBL_CNI_OP_RESERVED8			28
+/* Opcode to dump the context of a QP */
+#define HBL_CNI_OP_DUMP_QP			29
+
+#endif /* HBL_CNI_H_ */
-- 
2.34.1

