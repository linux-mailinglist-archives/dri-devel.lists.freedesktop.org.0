Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A711F9084B3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCB10EC59;
	Fri, 14 Jun 2024 07:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Eu2+b7l7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F59E10E289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:29:23 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266947; bh=tROurj44MDt+ylbSSkbxtJYw54QlWnfS1BuwQI8GCpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Eu2+b7l7Tcxmir+3/WHeLKSJ83yUKfWcWgHASrxlcsfE2uSJTI5uHqlsdrCc3f4kr
 5ZiYkViNT6g2HafQ02zwn+5L8uKQ0La69G5Gg+GL5XTkHBlyrWBb0Tsf8ta7IRzCUx
 xLGiPnTXXyMwWI+/6kokZYUGHkzGepZmrxAEvIXmz2H7g4sDJkwfv34JZaaiFkW73o
 /14h8P5BL7ut4GUOIyGzAfKxuMH4AnCr69rWkZRtb2wGKeojUZqDSdOA4epmCOugzq
 2CIaCZ4JTw+xFFZ/c2C0J+JLXNgSH0qxA7OPEry5JGYvyP9/dzPEpgiuc8uTThRN8H
 ozhvTBSLX/J3g==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hb1440009; Thu, 13 Jun 2024 11:22:09 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 06/15] net: hbl_cn: debugfs support
Date: Thu, 13 Jun 2024 11:21:59 +0300
Message-Id: <20240613082208.1439968-7-oshpigelman@habana.ai>
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

Add debugfs files for advanced settings, debug options and testing.

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
 .../ABI/testing/debugfs-driver-habanalabs_cn  |  195 +++
 MAINTAINERS                                   |    1 +
 drivers/net/ethernet/intel/hbl_cn/Makefile    |    2 +
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.c |    4 +
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.h |   37 +
 .../intel/hbl_cn/common/hbl_cn_debugfs.c      | 1457 +++++++++++++++++
 .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |   19 +-
 7 files changed, 1714 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/debugfs-driver-habanalabs_cn
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_debugfs.c

diff --git a/Documentation/ABI/testing/debugfs-driver-habanalabs_cn b/Documentation/ABI/testing/debugfs-driver-habanalabs_cn
new file mode 100644
index 000000000000..5de689b0986d
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-driver-habanalabs_cn
@@ -0,0 +1,195 @@
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_accumulate_fec_duration
+Date:           May 2024
+KernelVersion:  N/A
+Contact:        kvabhilash@habana.ai
+Description:    Time (in ms) to accumulate FEC errors for. This is used as
+                divisor in calculation of pre & post FEC (Forward Error
+                Correction) SER (Symbol Error Rate).
+                Valid values are from 1 to ACCUMULATE_FEC_STATS_DURATION_MS_MAX.
+                Default value is ACCUMULATE_FEC_STATS_DURATION_MS.
+                Usage: echo <time_ms> > nic_accumulate_fec_duration
+                cat nic_accumulate_fec_duration
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_disable_decap
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        gkgurumurthy@habana.ai
+Description:    Allows the root user to enable/disable the decapsulation logic
+                on the RX path.
+                '1' disables the logic, '0' enables the logic.
+                The typical use case is to disable the decap on rx with encap
+                enabled on the tx, and run the RDMA traffic. This causes the
+                packets to be forwarded to ethernet ring which is ultimately
+                sent to linux kernel. The user can analyze the RDMA packet using
+                tcpdump and validate the encapsulation header.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_inject_rx_err
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        akishore@habana.ai
+Description:    Allows the root user to force RX packet drop.
+                Usage: echo <drop_percent> > nic_inject_rx_err
+                       cat nic_inject_rx_err
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_mac_lane_remap
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        akishore@habana.ai
+Description:    Allows root user to change MAC to PHY lane mapping. User should
+                provide space separated bitmap for all lanes on all NIC macros.
+                Usage: echo macro0 macro1 macro2 ... macroX > nic_mac_lane_remap
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_mac_loopback
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Allows the root user to disable/enable MAC loopback for each NIC
+                port. The ports will function as if a physical loopback
+                transceiver was connected. A bitmask should be provided where
+                each bit represents a port.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_mmu_bypass
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        zyehudai@habana.ai
+Description:    Sets the NIC to use MMU bypass for its allocated data structure.
+                Value of "0" is for disable, otherwise enable.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_nrz_tx_taps
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to set and show the NRZ Tx taps for the
+                port lanes. The lanes indices are 0-47.
+                Acceptable input string form:
+                <lane> <tx_pre2> <tx_pre1> <tx_main> <tx_post1> <tx_post2>.
+                cat nic_nrz_tx_taps will dump all taps.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_override_port_status
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        aagranovich@habana.ai
+Description:    Allows the root user to force set ports link status.
+                Usage: echo <port> <status> > nic_override_port_status
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_pam4_tx_taps
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Allows the root user to set and show the PAM4 Tx taps for the
+                port lanes. The lanes indices are 0-47.
+                Acceptable input string form:
+                <lane> <tx_pre2> <tx_pre1> <tx_main> <tx_post1> <tx_post2>.
+                cat nic_pam4_tx_taps will dump all taps.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_calc_ber
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to enable calculation of PHY BER during the
+                PHY power_up flow.
+                value "0" is for disable, otherwise enable.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_calc_ber_wait_sec
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to set the waiting time in seconds before
+                BER calculating.
+                Usage: echo <time_in_seconds> > nic_phy_calc_ber_wait_sec
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_dump_serdes_params
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to dump serdes parameters for a given port.
+                Need to write the port and then read it in order to dump the
+                parameters.
+                Usage: echo <port> > nic_phy_dump_serdes_params
+                       cat nic_phy_dump_serdes_params
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_force_first_tx_taps_cfg
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to determine that every PHY power-up will
+                set the first Tx taps cfg instead of the current one.
+                Usage: echo 1 > nic_phy_force_first_tx_taps_cfg
+                cat nic_phy_force_first_tx_taps_cfg
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_regs_print
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to dump all PHY registers reads/writes
+                during the PHY power_up flow.
+                value "0" is for disable, otherwise enable.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_phy_set_nrz
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to set/unset NRZ mode (25Gbps speed).
+                Usage: echo 0/1 > nic_phy_set_nrz
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_polarity
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Allows the root user to set the polarity for the port lanes.
+                The lanes indices are 0-47.
+                Acceptable input string form: <lane> <pol_tx> <pol_rx>.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_print_fec_stats
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to dump the FEC stats for all NIC ports to
+                dmesg.
+                Usage: cat nic_print_fec_stats
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_qp
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Read a QP (Queue Pair) HW structure content. Need to write the
+                QP number, port, type and other flags to the file and then read
+                it in order to dump the QP content.
+                Input form: <port> <qpn> <is_req> <is_full_print> <force_read>.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_rand_status
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Enable randomization for the values returned in the NIC status
+                packet. Value of "0" is for disable, otherwise enable.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_reset_cnt
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        oshpigelman@habana.ai
+Description:    Resets nic counters. Any decimal value is a valid input.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_show_internal_ports_status
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        sozeri@habana.ai
+Description:    Allows the root user to read the link status of all internal
+                NIC ports.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_wqe
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        zyehudai@habana.ai
+Description:    Read a WQE (Work Queue Entry) HW structure content. Need to
+                write the port, QP number, WQE index and it's type to the file
+                and then read it in order to dump the WQE content.
+                Input form: <port> <qpn> <wqe_idx> <is_tx>.
+
+What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_wqe_index_checker
+Date:           May 2024
+KernelVersion:  6.9
+Contact:        dmeriin@habana.ai
+Description:    Allows the root user to enable/disable the WQE index checker.
+                value "0" is for disable, otherwise enable.
+                Usage: echo <enable> > nic_wqe_index_checker
diff --git a/MAINTAINERS b/MAINTAINERS
index e948e33e990d..906224204aba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9610,6 +9610,7 @@ L:	netdev@vger.kernel.org
 L:	linux-rdma@vger.kernel.org
 S:	Supported
 W:	https://www.habana.ai
+F:	Documentation/ABI/testing/debugfs-driver-habanalabs_cn
 F:	Documentation/networking/device_drivers/ethernet/intel/hbl.rst
 F:	drivers/net/ethernet/intel/hbl_cn/
 F:	include/linux/habanalabs/
diff --git a/drivers/net/ethernet/intel/hbl_cn/Makefile b/drivers/net/ethernet/intel/hbl_cn/Makefile
index 84ee2a6d7c3b..c2c4142f18a0 100644
--- a/drivers/net/ethernet/intel/hbl_cn/Makefile
+++ b/drivers/net/ethernet/intel/hbl_cn/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_HABANA_CN) := habanalabs_cn.o
 
 include $(src)/common/Makefile
 habanalabs_cn-y += $(HBL_CN_COMMON_FILES)
+
+habanalabs_cn-$(CONFIG_DEBUG_FS) += common/hbl_cn_debugfs.o
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
index 4e910b2cb8ac..fc7bd6474404 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
@@ -1842,6 +1842,8 @@ int hbl_cn_dev_init(struct hbl_cn_device *hdev)
 
 	hbl_cn_late_init(hdev);
 
+	hbl_cn_debugfs_dev_init(hdev);
+
 	hdev->is_initialized = true;
 
 	return 0;
@@ -1878,6 +1880,8 @@ void hbl_cn_dev_fini(struct hbl_cn_device *hdev)
 		hbl_cn_stop(hdev->cn_aux_dev);
 	}
 
+	hbl_cn_debugfs_dev_fini(hdev);
+
 	hbl_cn_late_fini(hdev);
 
 	hbl_cn_ib_aux_drv_fini(hdev);
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
index 27139e93d990..0b96cd3db719 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
@@ -142,6 +142,34 @@
 #define hbl_cn_dma_pool_free(hdev, vaddr, dma_addr) \
 	__hbl_cn_dma_pool_free(hdev, vaddr, dma_addr, __func__)
 
+/* CN debugfs files enum */
+enum hbl_cn_debugfs_files_idx {
+	NIC_MAC_LOOPBACK = 0,
+	NIC_PAM4_TX_TAPS,
+	NIC_NRZ_TX_TAPS,
+	NIC_POLARITY,
+	NIC_QP,
+	NIC_WQE,
+	NIC_RESET_CNT,
+	NIC_MAC_LANE_REMAP,
+	NIC_RAND_STATUS,
+	NIC_MMU_BYPASS,
+	NIC_ETH_LOOPBACK,
+	NIC_PHY_REGS_PRINT,
+	NIC_SHOW_INTERNAL_PORTS_STATUS,
+	NIC_PRINT_FEC_STATS,
+	NIC_DISABLE_DECAP,
+	NIC_PHY_SET_NRZ,
+	NIC_PHY_DUMP_SERDES_PARAMS,
+	NIC_INJECT_RX_ERR,
+	NIC_PHY_CALC_BER,
+	NIC_PHY_CALC_BER_WAIT_SEC,
+	NIC_OVERRIDE_PORT_STATUS,
+	NIC_WQE_INDEX_CHECKER,
+	NIC_ACCUMULATE_FEC_DURATION,
+	NIC_PHY_FORCE_FIRST_TX_TAPS_CFG,
+};
+
 extern struct hbl_cn_stat hbl_cn_mac_fec_stats[];
 extern struct hbl_cn_stat hbl_cn_mac_stats_rx[];
 extern struct hbl_cn_stat hbl_cn_mac_stats_tx[];
@@ -1312,6 +1340,7 @@ struct hbl_cn_properties {
  * struct hbl_cn_device - habanalabs CN device structure.
  * @pdev: pointer to PCI device.
  * @dev: related kernel basic device structure.
+ * @cn_dentry: CN debugfs root dentry.
  * @cpucp_info: FW info.
  * @asic_funcs: ASIC specific functions that can be called from common code.
  * @phy_tx_taps: array that holds all PAM4 Tx taps of all lanes.
@@ -1341,6 +1370,7 @@ struct hbl_cn_properties {
  * @mac_loopback: enable MAC loopback on specific ports.
  * @dram_size: available DRAM size.
  * @mmap_type_flag: flag to indicate NIC MMAP type.
+ * @debugfs_supp_mask: mask of supported debugfs files.
  * @pol_tx_mask: bitmap of tx polarity for all lanes.
  * @pol_rx_mask: bitmap of rx polarity for all lanes.
  * @device_timeout: device access timeout in usec.
@@ -1411,6 +1441,7 @@ struct hbl_cn_properties {
 struct hbl_cn_device {
 	struct pci_dev *pdev;
 	struct device *dev;
+	struct dentry *cn_dentry;
 	struct hbl_cn_cpucp_info *cpucp_info;
 	struct hbl_cn_asic_funcs *asic_funcs;
 	struct hbl_cn_tx_taps *phy_tx_taps;
@@ -1441,6 +1472,7 @@ struct hbl_cn_device {
 	u64 mac_loopback;
 	u64 dram_size;
 	u64 mmap_type_flag;
+	u64 debugfs_supp_mask;
 	u64 pol_tx_mask;
 	u64 pol_rx_mask;
 	u32 device_timeout;
@@ -1534,6 +1566,8 @@ void hbl_cn_phy_set_port_status(struct hbl_cn_port *cn_port, bool up);
 int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data[], u32 *num_out_data);
 int hbl_cn_qp_modify(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
 		     enum hbl_cn_qp_state new_state, void *params);
+void hbl_cn_debugfs_dev_init(struct hbl_cn_device *hdev);
+void hbl_cn_debugfs_dev_fini(struct hbl_cn_device *hdev);
 u32 hbl_cn_get_max_qp_id(struct hbl_cn_port *cn_port);
 bool hbl_cn_is_port_open(struct hbl_cn_port *cn_port);
 u32 hbl_cn_get_pflags(struct hbl_cn_port *cn_port);
@@ -1614,6 +1648,9 @@ int __hbl_cn_ports_reopen(struct hbl_cn_device *hdev);
 void __hbl_cn_hard_reset_prepare(struct hbl_cn_device *hdev, bool fw_reset, bool in_teardown);
 void __hbl_cn_stop(struct hbl_cn_device *hdev);
 
+void __init hbl_cn_debugfs_init(void);
+void hbl_cn_debugfs_fini(void);
+
 /* DMA memory allocations */
 void *__hbl_cn_dma_alloc_coherent(struct hbl_cn_device *hdev, size_t size, dma_addr_t *dma_handle,
 				  gfp_t flag, const char *caller);
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_debugfs.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_debugfs.c
new file mode 100644
index 000000000000..b13da28fdcb7
--- /dev/null
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_debugfs.c
@@ -0,0 +1,1457 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "hbl_cn.h"
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/nospec.h>
+
+#define POLARITY_KBUF_SIZE		8
+#define TX_TAPS_KBUF_SIZE		25
+#define KBUF_IN_SIZE			18
+#define KBUF_OUT_SIZE			BIT(12)
+#define KBUF_OUT_BIG_SIZE		BIT(14)
+#define MAC_LANE_REMAP_READ_SIZE	10
+#define MAX_INT_PORT_STS_KBUF_SIZE	20
+#define HBL_CN_DEBUGFS_CREATE_FILE(op, perm, dir, dev, fops) \
+	do { \
+		enum hbl_cn_debugfs_files_idx __op = op; \
+		if (hdev->debugfs_supp_mask & BIT(__op)) \
+			debugfs_create_file(hbl_cn_debugfs_names[__op], perm, dir, dev, fops); \
+	} while (0)
+
+#define HBL_CN_DEBUGFS_CREATE_U8(op, perm, dir, fops) \
+	do { \
+		enum hbl_cn_debugfs_files_idx __op = op; \
+		if (hdev->debugfs_supp_mask & BIT(__op)) \
+			debugfs_create_u8(hbl_cn_debugfs_names[__op], perm, dir, fops); \
+	} while (0)
+
+#define HBL_CN_DEBUGFS_CREATE_U16(op, perm, dir, fops) \
+	do { \
+		enum hbl_cn_debugfs_files_idx __op = op; \
+		if (hdev->debugfs_supp_mask & BIT(__op)) \
+			debugfs_create_u16(hbl_cn_debugfs_names[__op], perm, dir, fops); \
+	} while (0)
+
+static char hbl_cn_debugfs_names[][NAME_MAX] = {
+	[NIC_MAC_LOOPBACK] = "nic_mac_loopback",
+	[NIC_PAM4_TX_TAPS] = "nic_pam4_tx_taps",
+	[NIC_NRZ_TX_TAPS] = "nic_nrz_tx_taps",
+	[NIC_POLARITY] = "nic_polarity",
+	[NIC_QP] = "nic_qp",
+	[NIC_WQE] = "nic_wqe",
+	[NIC_RESET_CNT] = "nic_reset_cnt",
+	[NIC_MAC_LANE_REMAP] = "nic_mac_lane_remap",
+	[NIC_RAND_STATUS] = "nic_rand_status",
+	[NIC_MMU_BYPASS] = "nic_mmu_bypass",
+	[NIC_ETH_LOOPBACK] = "nic_eth_loopback",
+	[NIC_PHY_REGS_PRINT] = "nic_phy_regs_print",
+	[NIC_SHOW_INTERNAL_PORTS_STATUS] = "nic_show_internal_ports_status",
+	[NIC_PRINT_FEC_STATS] = "nic_print_fec_stats",
+	[NIC_DISABLE_DECAP] = "nic_disable_decap",
+	[NIC_PHY_SET_NRZ] = "nic_phy_set_nrz",
+	[NIC_PHY_DUMP_SERDES_PARAMS] = "nic_phy_dump_serdes_params",
+	[NIC_INJECT_RX_ERR] = "nic_inject_rx_err",
+	[NIC_PHY_CALC_BER] = "nic_phy_calc_ber",
+	[NIC_PHY_CALC_BER_WAIT_SEC] = "nic_phy_calc_ber_wait_sec",
+	[NIC_OVERRIDE_PORT_STATUS] = "nic_override_port_status",
+	[NIC_WQE_INDEX_CHECKER] = "nic_wqe_index_checker",
+	[NIC_ACCUMULATE_FEC_DURATION] = "nic_accumulate_fec_duration",
+	[NIC_PHY_FORCE_FIRST_TX_TAPS_CFG] = "nic_phy_force_first_tx_taps_cfg",
+};
+
+static struct dentry *hbl_cn_debug_root;
+
+static int hbl_device_hard_reset_sync(struct hbl_cn_device *hdev)
+{
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	ktime_t timeout;
+
+	aux_dev = hdev->cn_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+
+	aux_ops->device_reset(aux_dev);
+
+	timeout = ktime_add_ms(ktime_get(), hdev->pending_reset_long_timeout * 1000ull);
+	while (!hbl_cn_comp_device_operational(hdev) && !READ_ONCE(hdev->in_teardown)) {
+		ssleep(1);
+		if (ktime_compare(ktime_get(), timeout) > 0) {
+			dev_crit(hdev->dev, "Timed out waiting for hard reset to finish\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t debugfs_print_value_to_buffer(void *buf, size_t count, loff_t *ppos, char *fmt,
+					     u32 val)
+{
+	size_t fmt_len = strlen(fmt);
+	char tmp_fmt[32] = {0};
+	char tmp[32] = {0};
+
+	if (*ppos)
+		return 0;
+
+	if (fmt_len > sizeof(tmp_fmt) - 2)
+		return -ENOMEM;
+
+	strscpy(tmp_fmt, fmt, sizeof(tmp_fmt));
+
+	tmp_fmt[fmt_len] = '\n';
+	tmp_fmt[fmt_len + 1] = '\0';
+
+	snprintf(tmp, sizeof(tmp), tmp_fmt, val);
+
+	return simple_read_from_buffer(buf, count, ppos, tmp, strlen(tmp) + 1);
+}
+
+static ssize_t debugfs_pam4_tx_taps_write(struct file *f, const char __user *buf, size_t count,
+					  loff_t *ppos)
+{
+	s32 tx_pre2, tx_pre1, tx_main, tx_post1, tx_post2, *taps;
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[TX_TAPS_KBUF_SIZE] = {0};
+	u32 lane, max_num_of_lanes;
+	char *c1, *c2;
+	ssize_t rc;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &lane);
+	if (rc)
+		goto err;
+
+	if (lane >= max_num_of_lanes) {
+		dev_err(hdev->dev, "lane max value is %d\n", max_num_of_lanes - 1);
+		return -EINVAL;
+	}
+
+	/* Turn off speculation due to Spectre vulnerability */
+	lane = array_index_nospec(lane, max_num_of_lanes);
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_pre2);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_pre1);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_main);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_post1);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	rc = kstrtos32(c1, 10, &tx_post2);
+	if (rc)
+		goto err;
+
+	taps = hdev->phy_tx_taps[lane].pam4_taps;
+	taps[0] = tx_pre2;
+	taps[1] = tx_pre1;
+	taps[2] = tx_main;
+	taps[3] = tx_post1;
+	taps[4] = tx_post2;
+
+	return count;
+err:
+	dev_err(hdev->dev,
+		"usage: echo <lane> <tx_pre2> <tx_pre1> <tx_main> <tx_post1> <tx_post2> > nic_pam4_tx_taps\n");
+
+	return -EINVAL;
+}
+
+static ssize_t debugfs_pam4_tx_taps_read(struct file *f, char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	u32 lane, max_num_of_lanes;
+	ssize_t rc, len;
+	char *kbuf;
+	s32 *taps;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (*ppos)
+		return 0;
+
+	kbuf = kzalloc(KBUF_OUT_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	sprintf(kbuf + strlen(kbuf), "PAM4 tx taps:\n");
+
+	for (lane = 0; lane < max_num_of_lanes; lane++) {
+		taps = hdev->phy_tx_taps[lane].pam4_taps;
+		len = strlen(kbuf);
+		if ((KBUF_OUT_SIZE - len) <= 1) {
+			rc = -EFBIG;
+			goto out;
+		}
+		snprintf(kbuf + len, KBUF_OUT_SIZE - len, "lane %u: %d %d %d %d %d\n", lane,
+			 taps[0], taps[1], taps[2], taps[3], taps[4]);
+	}
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+out:
+	kfree(kbuf);
+
+	return rc;
+}
+
+static const struct file_operations debugfs_pam4_tx_taps_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_pam4_tx_taps_write,
+	.read = debugfs_pam4_tx_taps_read,
+};
+
+static ssize_t debugfs_nrz_tx_taps_write(struct file *f, const char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	s32 tx_pre2, tx_pre1, tx_main, tx_post1, tx_post2, *taps;
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[TX_TAPS_KBUF_SIZE] = {0};
+	u32 lane, max_num_of_lanes;
+	char *c1, *c2;
+	ssize_t rc;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &lane);
+	if (rc)
+		goto err;
+
+	if (lane >= max_num_of_lanes) {
+		dev_err(hdev->dev, "lane max value is %d\n", max_num_of_lanes - 1);
+		return -EINVAL;
+	}
+
+	/* Turn off speculation due to Spectre vulnerability */
+	lane = array_index_nospec(lane, max_num_of_lanes);
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_pre2);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_pre1);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_main);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtos32(c1, 10, &tx_post1);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	rc = kstrtos32(c1, 10, &tx_post2);
+	if (rc)
+		goto err;
+
+	taps = hdev->phy_tx_taps[lane].nrz_taps;
+	taps[0] = tx_pre2;
+	taps[1] = tx_pre1;
+	taps[2] = tx_main;
+	taps[3] = tx_post1;
+	taps[4] = tx_post2;
+
+	return count;
+err:
+	dev_err(hdev->dev,
+		"usage: echo <lane> <tx_pre2> <tx_pre1> <tx_main> <tx_post1> <tx_post2> > nic_nrz_tx_taps\n");
+
+	return -EINVAL;
+}
+
+static ssize_t debugfs_nrz_tx_taps_read(struct file *f, char __user *buf, size_t count,
+					loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	u32 lane, max_num_of_lanes;
+	ssize_t rc, len;
+	char *kbuf;
+	s32 *taps;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (*ppos)
+		return 0;
+
+	kbuf = kzalloc(KBUF_OUT_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	sprintf(kbuf + strlen(kbuf), "NRZ tx taps:\n");
+
+	for (lane = 0; lane < max_num_of_lanes; lane++) {
+		taps = hdev->phy_tx_taps[lane].nrz_taps;
+		len = strlen(kbuf);
+		if ((KBUF_OUT_SIZE - len) <= 1) {
+			rc = -EFBIG;
+			goto out;
+		}
+		snprintf(kbuf + len, KBUF_OUT_SIZE - len, "lane %u: %d %d %d %d %d\n", lane,
+			 taps[0], taps[1], taps[2], taps[3], taps[4]);
+	}
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+out:
+	kfree(kbuf);
+
+	return rc;
+}
+
+static const struct file_operations debugfs_nrz_tx_taps_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_nrz_tx_taps_write,
+	.read = debugfs_nrz_tx_taps_read,
+};
+
+static ssize_t debugfs_polarity_write(struct file *f, const char __user *buf, size_t count,
+				      loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[POLARITY_KBUF_SIZE] = {0};
+	u32 lane, max_num_of_lanes;
+	u8 pol_tx, pol_rx;
+	char *c1, *c2;
+	ssize_t rc;
+	u64 val;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &lane);
+	if (rc)
+		goto err;
+
+	if (lane >= max_num_of_lanes) {
+		dev_err(hdev->dev, "lane max value is %d\n", max_num_of_lanes - 1);
+		return -EINVAL;
+	}
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou8(c1, 10, &pol_tx);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	rc = kstrtou8(c1, 10, &pol_rx);
+	if (rc)
+		goto err;
+
+	if ((pol_tx & ~1) || (pol_rx & ~1)) {
+		dev_err(hdev->dev, "pol_tx and pol_rx should be 0 or 1\n");
+		goto err;
+	}
+
+	val = hdev->pol_tx_mask;
+	val &= ~BIT_ULL(lane);
+	val |= ((u64)pol_tx) << lane;
+	hdev->pol_tx_mask = val;
+
+	val = hdev->pol_rx_mask;
+	val &= ~BIT_ULL(lane);
+	val |= ((u64)pol_rx) << lane;
+	hdev->pol_rx_mask = val;
+
+	/* This flag is set to prevent overwriting the new values after reset */
+	hdev->skip_phy_pol_cfg = true;
+
+	return count;
+err:
+	dev_err(hdev->dev, "usage: echo <lane> <pol_tx> <pol_rx> > nic_polarity\n");
+
+	return -EINVAL;
+}
+
+static const struct file_operations debugfs_polarity_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_polarity_write,
+};
+
+static ssize_t debugfs_qp_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	char *kbuf;
+	ssize_t rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (*ppos)
+		return 0;
+
+	kbuf = kzalloc(KBUF_OUT_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	rc = asic_funcs->qp_read(hdev, &hdev->qp_info, kbuf, KBUF_OUT_SIZE);
+	if (rc)
+		goto out;
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+out:
+	kfree(kbuf);
+
+	return rc;
+}
+
+static ssize_t debugfs_qp_write(struct file *f, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_qp_info *qp_info = &hdev->qp_info;
+	u32 port, qpn, max_num_of_ports;
+	u8 req, full_print, force_read;
+	char kbuf[KBUF_IN_SIZE] = {0};
+	char *c1, *c2;
+	ssize_t rc;
+
+	max_num_of_ports = hdev->cn_props.max_num_of_ports;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &port);
+	if (rc)
+		goto err;
+
+	if (port >= max_num_of_ports) {
+		dev_err(hdev->dev, "port max value is %d\n", max_num_of_ports - 1);
+		return -EINVAL;
+	}
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &qpn);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou8(c1, 10, &req);
+	if (rc)
+		goto err;
+
+	if (req & ~1) {
+		dev_err(hdev->dev, "req should be 0 or 1\n");
+		goto err;
+	}
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou8(c1, 10, &full_print);
+	if (rc)
+		goto err;
+
+	if (full_print & ~1) {
+		dev_err(hdev->dev, "full_print should be 0 or 1\n");
+		goto err;
+	}
+
+	c1 = c2 + 1;
+
+	/* may not be the last element due to the optional params */
+	c2 = strchr(c1, ' ');
+	if (c2)
+		*c2 = '\0';
+
+	rc = kstrtou8(c1, 10, &force_read);
+	if (rc)
+		goto err;
+
+	if (force_read & ~1) {
+		dev_err(hdev->dev, "force_read should be 0 or 1\n");
+		goto err;
+	}
+
+	qp_info->port = port;
+	qp_info->qpn = qpn;
+	qp_info->req = req;
+	qp_info->full_print = full_print;
+	qp_info->force_read = force_read;
+
+	return count;
+err:
+	dev_err(hdev->dev,
+		"usage: echo <port> <qpn> <is_req> <is_full_print> <force_read> [<exts_print>] > nic_qp\n");
+
+	return -EINVAL;
+}
+
+static const struct file_operations debugfs_qp_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_qp_read,
+	.write = debugfs_qp_write
+};
+
+static ssize_t debugfs_wqe_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	char *kbuf;
+	ssize_t rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (*ppos)
+		return 0;
+
+	kbuf = kzalloc(KBUF_OUT_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	rc = asic_funcs->wqe_read(hdev, kbuf, KBUF_OUT_SIZE);
+	if (rc)
+		goto out;
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+out:
+	kfree(kbuf);
+
+	return rc;
+}
+
+static ssize_t debugfs_wqe_write(struct file *f, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_wqe_info *wqe_info = &hdev->wqe_info;
+	u32 port, qpn, wqe_idx, max_num_of_lanes;
+	char kbuf[KBUF_IN_SIZE] = {0};
+	char *c1, *c2;
+	ssize_t rc;
+	u8 tx;
+
+	max_num_of_lanes = hdev->cn_props.max_num_of_lanes;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &port);
+	if (rc)
+		goto err;
+
+	if (port >= max_num_of_lanes) {
+		dev_err(hdev->dev, "port max value is %d\n", max_num_of_lanes - 1);
+		return -EINVAL;
+	}
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &qpn);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &wqe_idx);
+	if (rc)
+		goto err;
+
+	c1 = c2 + 1;
+
+	rc = kstrtou8(c1, 10, &tx);
+	if (rc)
+		goto err;
+
+	if (tx & ~1) {
+		dev_err(hdev->dev, "tx should be 0 or 1\n");
+		goto err;
+	}
+
+	wqe_info->port = port;
+	wqe_info->qpn = qpn;
+	wqe_info->wqe_idx = wqe_idx;
+	wqe_info->tx = tx;
+
+	return count;
+err:
+	dev_err(hdev->dev, "usage: echo <port> <qpn> <wqe_idx> <is_tx> > nic_wqe\n");
+
+	return -EINVAL;
+}
+
+static const struct file_operations debugfs_wqe_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_wqe_read,
+	.write = debugfs_wqe_write
+};
+
+static ssize_t debugfs_reset_cnt_write(struct file *f, const char __user *buf, size_t count,
+				       loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	ssize_t rc;
+	u32 val;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	hbl_cn_reset_ports_toggle_counters(hdev);
+	hbl_cn_reset_stats_counters(hdev);
+
+	return count;
+}
+
+static const struct file_operations debugfs_reset_cnt_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_reset_cnt_write
+};
+
+static int parse_user_mac_lane_remap_data(u32 *dest_arr, int *dest_arr_cnt, char *buf, int count)
+{
+	int i = 0, j = 0, rc;
+	int offset;
+	u32 val;
+
+	while (i < count) {
+		offset = strcspn(&buf[i], " ");
+		buf[i + offset] = '\0';
+
+		rc = kstrtou32(&buf[i], 16, &val);
+		if (rc)
+			return rc;
+
+		dest_arr[j++] = val;
+		i += (offset + 1);
+	}
+
+	*dest_arr_cnt = j;
+
+	return 0;
+}
+
+static ssize_t debugfs_mac_lane_remap_write(struct file *f, const char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_properties *cn_props;
+	u32 *mac_lane_remap_buf;
+	int rc, n_parsed = 0;
+	char *kbuf;
+
+	cn_props = &hdev->cn_props;
+
+	kbuf = kcalloc(count + 1, sizeof(*buf), GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	mac_lane_remap_buf = kcalloc(cn_props->num_of_macros, sizeof(*mac_lane_remap_buf),
+				     GFP_KERNEL);
+	if (!mac_lane_remap_buf) {
+		rc = -ENOMEM;
+		goto err_free_kbuf;
+	}
+
+	rc = copy_from_user(kbuf, buf, count);
+	if (rc)
+		goto err_free_mac_lane_remap_buf;
+
+	/* Add trailing space to simplify parsing user data. */
+	kbuf[count] = ' ';
+
+	rc = parse_user_mac_lane_remap_data(mac_lane_remap_buf, &n_parsed, kbuf, count + 1);
+	if (rc || n_parsed != cn_props->num_of_macros) {
+		rc = -EINVAL;
+		goto err_parse;
+	}
+
+	memcpy(hdev->mac_lane_remap, mac_lane_remap_buf,
+	       sizeof(*mac_lane_remap_buf) * cn_props->num_of_macros);
+
+	rc = hbl_device_hard_reset_sync(hdev);
+	if (rc)
+		goto err_free_mac_lane_remap_buf;
+
+	kfree(mac_lane_remap_buf);
+	kfree(kbuf);
+
+	return count;
+err_parse:
+	dev_err_ratelimited(hdev->dev,
+			    "usage: echo macro0 macro1 macro2 ... macroX > mac_lane_remap\n");
+err_free_mac_lane_remap_buf:
+	kfree(mac_lane_remap_buf);
+err_free_kbuf:
+	kfree(kbuf);
+	return -EINVAL;
+}
+
+static ssize_t debugfs_mac_lane_remap_read(struct file *f, char __user *buf, size_t count,
+					   loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[MAC_LANE_REMAP_READ_SIZE];
+	struct hbl_cn_properties *cn_props;
+	int i, j;
+
+	cn_props = &hdev->cn_props;
+
+	if (*ppos)
+		return 0;
+
+	for (i = 0, j = 0; i < cn_props->num_of_macros; i++, j += MAC_LANE_REMAP_READ_SIZE) {
+		memset(kbuf, 0, MAC_LANE_REMAP_READ_SIZE);
+		sprintf(kbuf, "0x%x ", hdev->mac_lane_remap[i]);
+
+		if (copy_to_user(&buf[j], kbuf, MAC_LANE_REMAP_READ_SIZE)) {
+			dev_err(hdev->dev, "error in copying lane info to user\n");
+			return -EFAULT;
+		}
+
+		*ppos += MAC_LANE_REMAP_READ_SIZE;
+	}
+
+	return j + 1;
+}
+
+static const struct file_operations debugfs_mac_lane_remap_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_mac_lane_remap_write,
+	.read = debugfs_mac_lane_remap_read,
+};
+
+static ssize_t debugfs_eth_loopback_write(struct file *f, const char __user *buf, size_t count,
+					  loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	u32 val = 0;
+	int rc;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	hdev->eth_loopback = !!val;
+
+	dev_info(hdev->dev, "%s eth_loopback\n", hdev->eth_loopback ? "enable" : "disable");
+
+	return count;
+}
+
+static ssize_t debugfs_eth_loopback_read(struct file *f, char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "%u", hdev->eth_loopback);
+}
+
+static const struct file_operations debugfs_eth_loopback_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_eth_loopback_write,
+	.read = debugfs_eth_loopback_read,
+};
+
+static ssize_t debugfs_phy_regs_print_write(struct file *f, const char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	u32 val = 0;
+	int rc;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	hdev->phy_regs_print = !!val;
+
+	dev_info(hdev->dev, "%s printing PHY registers\n",
+		 hdev->phy_regs_print ? "enable" : "disable");
+
+	return count;
+}
+
+static ssize_t debugfs_phy_regs_print_read(struct file *f, char __user *buf, size_t count,
+					   loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "%u", hdev->phy_regs_print);
+}
+
+static const struct file_operations debugfs_phy_regs_print_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_phy_regs_print_write,
+	.read = debugfs_phy_regs_print_read,
+};
+
+static ssize_t debugfs_show_internal_ports_status_read(struct file *f, char __user *buf,
+						       size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[MAX_INT_PORT_STS_KBUF_SIZE];
+	struct hbl_cn_port *cn_port;
+	int i, cnt, total_cnt;
+
+	if (*ppos)
+		return 0;
+
+	total_cnt = 0;
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)) || (hdev->ext_ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		memset(kbuf, 0, MAX_INT_PORT_STS_KBUF_SIZE);
+		cnt = sprintf(kbuf, "Port %-2u: %s\n",
+			      cn_port->port, cn_port->pcs_link ? "UP" : "DOWN");
+
+		if (copy_to_user(&buf[total_cnt], kbuf, cnt)) {
+			dev_err(hdev->dev, "error in copying info to user\n");
+			return -EFAULT;
+		}
+
+		total_cnt += cnt;
+		*ppos += cnt;
+	}
+
+	if (!total_cnt) {
+		char *msg = "No internal ports found\n";
+
+		return simple_read_from_buffer(buf, count, ppos, msg, strlen(msg));
+	}
+
+	return total_cnt + 1;
+}
+
+static const struct file_operations debugfs_show_internal_ports_status_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_show_internal_ports_status_read,
+};
+
+static ssize_t debugfs_print_fec_stats_read(struct file *f, char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_port *cn_port;
+	char *kbuf;
+	int i, rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (*ppos)
+		return 0;
+
+	kbuf = kzalloc(KBUF_OUT_BIG_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	sprintf(kbuf + strlen(kbuf), "Card %u FEC stats:\n", hdev->card_location);
+
+	for (i = 0; i < hdev->cn_props.max_num_of_ports; i++) {
+		if (!(hdev->ports_mask & BIT(i)))
+			continue;
+
+		cn_port = &hdev->cn_ports[i];
+
+		asic_funcs->port_funcs->collect_fec_stats(cn_port, kbuf, KBUF_OUT_BIG_SIZE);
+	}
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+	kfree(kbuf);
+
+	return rc;
+}
+
+static const struct file_operations debugfs_print_fec_stats_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_print_fec_stats_read,
+};
+
+static ssize_t debugfs_phy_set_nrz_write(struct file *f, const char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	bool val;
+	int rc;
+
+	rc = kstrtobool_from_user(buf, count, &val);
+	if (rc)
+		return rc;
+
+	if (val == hdev->phy_set_nrz)
+		return count;
+
+	hdev->phy_set_nrz = val;
+	hdev->skip_phy_default_tx_taps_cfg = 0;
+
+	dev_info(hdev->dev, "%s NRZ mode\n", hdev->phy_set_nrz ? "Enable" : "Disable");
+
+	rc = hbl_device_hard_reset_sync(hdev);
+	if (rc)
+		return -EINVAL;
+
+	return count;
+}
+
+static const struct file_operations debugfs_phy_set_nrz_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_phy_set_nrz_write,
+};
+
+static ssize_t debugfs_phy_dump_serdes_params_read(struct file *f, char __user *buf, size_t count,
+						   loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	char *kbuf;
+	ssize_t rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (*ppos)
+		return 0;
+
+	/* For ASICs that don't support this feature, return an error */
+	if (!asic_funcs->phy_dump_serdes_params)
+		return -EINVAL;
+
+	kbuf = kzalloc(KBUF_OUT_BIG_SIZE, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	asic_funcs->phy_dump_serdes_params(hdev, kbuf, KBUF_OUT_BIG_SIZE);
+
+	rc = simple_read_from_buffer(buf, count, ppos, kbuf, strlen(kbuf) + 1);
+
+	kfree(kbuf);
+
+	return rc;
+}
+
+static ssize_t debugfs_phy_dump_serdes_params_write(struct file *f, const char __user *buf,
+						    size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 port;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	/* For ASICs that don't support this feature, return an error */
+	if (!asic_funcs->phy_dump_serdes_params)
+		return -EINVAL;
+
+	rc = kstrtou32_from_user(buf, count, 10, &port);
+	if (rc)
+		return rc;
+
+	if (port >= hdev->cn_props.max_num_of_ports) {
+		dev_err(hdev->dev, "Invalid port number %u\n", port);
+		return -EINVAL;
+	}
+
+	hdev->phy_port_to_dump = port;
+
+	return count;
+}
+
+static const struct file_operations debugfs_phy_dump_serdes_params_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_phy_dump_serdes_params_read,
+	.write = debugfs_phy_dump_serdes_params_write,
+};
+
+static ssize_t debugfs_inject_rx_err_read(struct file *f, char __user *buf, size_t count,
+					  loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "%u", hdev->rx_drop_percent);
+}
+
+static ssize_t debugfs_inject_rx_err_write(struct file *f, const char __user *buf, size_t count,
+					   loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 val;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (*ppos)
+		return 0;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	if (val > 100) {
+		dev_dbg_ratelimited(hdev->dev, "Invalid drop percentage %d\n", val);
+		return -EINVAL;
+	}
+
+	asic_funcs->inject_rx_err(hdev, val);
+
+	return count;
+}
+
+static const struct file_operations debugfs_inject_rx_err_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_inject_rx_err_read,
+	.write = debugfs_inject_rx_err_write,
+};
+
+static ssize_t debugfs_override_port_status_write(struct file *f, const char __user *buf,
+						  size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	char kbuf[KBUF_IN_SIZE] = {0};
+	struct hbl_cn_port *cn_port;
+	u32 port, max_num_of_ports;
+	char *c1, *c2;
+	ssize_t rc;
+	u8 up;
+
+	max_num_of_ports = hdev->cn_props.max_num_of_ports;
+
+	if (count > sizeof(kbuf) - 1)
+		goto err;
+	if (copy_from_user(kbuf, buf, count))
+		goto err;
+	kbuf[count] = '\0';
+
+	c1 = kbuf;
+	c2 = strchr(c1, ' ');
+	if (!c2)
+		goto err;
+	*c2 = '\0';
+
+	rc = kstrtou32(c1, 10, &port);
+	if (rc)
+		goto err;
+
+	if (port >= max_num_of_ports) {
+		dev_err(hdev->dev, "port max value is %d\n", max_num_of_ports - 1);
+		return -EINVAL;
+	}
+
+	/* Turn off speculation due to Spectre vulnerability */
+	port = array_index_nospec(port, max_num_of_ports);
+
+	c1 = c2 + 1;
+
+	rc = kstrtou8(c1, 10, &up);
+	if (rc)
+		goto err;
+
+	if (hdev->ports_mask & BIT(port)) {
+		cn_port = &hdev->cn_ports[port];
+
+		cn_port->pcs_link = !!up;
+		hbl_cn_phy_set_port_status(cn_port, !!up);
+	}
+
+	return count;
+err:
+	dev_err(hdev->dev, "usage: echo <port> <status> > nic_override_port_status\n");
+
+	return -EINVAL;
+}
+
+static const struct file_operations debugfs_override_port_status_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_override_port_status_write,
+};
+
+static ssize_t debugfs_write_wqe_index_checker(struct file *f, const char __user *buf, size_t count,
+					       loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 val;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	/* For ASICs that don't support this feature, return an error */
+	if (!asic_funcs->set_wqe_index_checker)
+		return -EINVAL;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	rc = asic_funcs->set_wqe_index_checker(hdev, !!val);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t debugfs_read_wqe_index_checker(struct file *f, char __user *buf, size_t count,
+					      loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	u32 index_checker;
+
+	asic_funcs = hdev->asic_funcs;
+
+	if (!asic_funcs->get_wqe_index_checker)
+		return -EINVAL;
+
+	index_checker = asic_funcs->get_wqe_index_checker(hdev);
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "%u", index_checker);
+}
+
+static const struct file_operations debugfs_wqe_index_checker_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_write_wqe_index_checker,
+	.read = debugfs_read_wqe_index_checker,
+};
+
+static ssize_t debugfs_accumulate_fec_duration_write(struct file *f, const char __user *buf,
+						     size_t count, loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	u32 val = 0;
+	int rc;
+
+	rc = kstrtou32_from_user(buf, count, 10, &val);
+	if (rc)
+		return rc;
+
+	if (!val || val > ACCUMULATE_FEC_STATS_DURATION_MS_MAX)
+		return -EINVAL;
+
+	hdev->accumulate_fec_duration = val;
+
+	return count;
+}
+
+static ssize_t debugfs_accumulate_fec_duration_read(struct file *f, char __user *buf, size_t count,
+						    loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "%u",
+					     hdev->accumulate_fec_duration);
+}
+
+static const struct file_operations debugfs_accumulate_fec_duration_fops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_accumulate_fec_duration_write,
+	.read = debugfs_accumulate_fec_duration_read,
+};
+
+static ssize_t debugfs_mac_loopback_read(struct file *f, char __user *buf, size_t count,
+					 loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+
+	return debugfs_print_value_to_buffer(buf, count, ppos, "0x%llx", hdev->mac_loopback);
+}
+
+static ssize_t debugfs_mac_loopback_write(struct file *f, const char __user *buf, size_t count,
+					  loff_t *ppos)
+{
+	struct hbl_cn_device *hdev = file_inode(f)->i_private;
+	ssize_t ret;
+	u64 val;
+	int rc;
+
+	ret = kstrtoull_from_user(buf, count, 16, &val);
+	if (ret)
+		return ret;
+
+	if (val == hdev->mac_loopback)
+		return count;
+
+	hdev->mac_loopback = val;
+	rc = hbl_device_hard_reset_sync(hdev);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static const struct file_operations debugfs_mac_loopback_fops = {
+	.owner = THIS_MODULE,
+	.read = debugfs_mac_loopback_read,
+	.write = debugfs_mac_loopback_write,
+};
+
+static void __hbl_cn_debugfs_dev_init(struct hbl_cn_device *hdev, struct dentry *root_dir)
+{
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_MAC_LOOPBACK, 0644, root_dir, hdev,
+				   &debugfs_mac_loopback_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_PAM4_TX_TAPS, 0444, root_dir, hdev,
+				   &debugfs_pam4_tx_taps_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_NRZ_TX_TAPS, 0444, root_dir, hdev,
+				   &debugfs_nrz_tx_taps_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_POLARITY, 0444, root_dir, hdev, &debugfs_polarity_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_QP, 0444, root_dir, hdev, &debugfs_qp_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_WQE, 0444, root_dir, hdev, &debugfs_wqe_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_RESET_CNT, 0444, root_dir, hdev,
+				   &debugfs_reset_cnt_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_MAC_LANE_REMAP, 0644, root_dir, hdev,
+				   &debugfs_mac_lane_remap_fops);
+
+	HBL_CN_DEBUGFS_CREATE_U8(NIC_RAND_STATUS, 0644, root_dir, &hdev->rand_status);
+
+	HBL_CN_DEBUGFS_CREATE_U8(NIC_MMU_BYPASS, 0644, root_dir, &hdev->mmu_bypass);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_ETH_LOOPBACK, 0644, root_dir, hdev,
+				   &debugfs_eth_loopback_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_PHY_REGS_PRINT, 0444, root_dir, hdev,
+				   &debugfs_phy_regs_print_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_SHOW_INTERNAL_PORTS_STATUS, 0444, root_dir, hdev,
+				   &debugfs_show_internal_ports_status_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_PRINT_FEC_STATS, 0444, root_dir, hdev,
+				   &debugfs_print_fec_stats_fops);
+
+	HBL_CN_DEBUGFS_CREATE_U8(NIC_DISABLE_DECAP, 0644, root_dir, &hdev->is_decap_disabled);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_PHY_SET_NRZ, 0444, root_dir, hdev,
+				   &debugfs_phy_set_nrz_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_PHY_DUMP_SERDES_PARAMS, 0444, root_dir, hdev,
+				   &debugfs_phy_dump_serdes_params_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_INJECT_RX_ERR, 0444, root_dir, hdev,
+				   &debugfs_inject_rx_err_fops);
+
+	HBL_CN_DEBUGFS_CREATE_U8(NIC_PHY_CALC_BER, 0644, root_dir, &hdev->phy_calc_ber);
+
+	HBL_CN_DEBUGFS_CREATE_U16(NIC_PHY_CALC_BER_WAIT_SEC, 0644, root_dir,
+				  &hdev->phy_calc_ber_wait_sec);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_OVERRIDE_PORT_STATUS, 0200, root_dir, hdev,
+				   &debugfs_override_port_status_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_WQE_INDEX_CHECKER, 0644, root_dir, hdev,
+				   &debugfs_wqe_index_checker_fops);
+
+	HBL_CN_DEBUGFS_CREATE_FILE(NIC_ACCUMULATE_FEC_DURATION, 0644, root_dir, hdev,
+				   &debugfs_accumulate_fec_duration_fops);
+
+	HBL_CN_DEBUGFS_CREATE_U8(NIC_PHY_FORCE_FIRST_TX_TAPS_CFG, 0644, root_dir,
+				 &hdev->phy_force_first_tx_taps_cfg);
+}
+
+void hbl_cn_debugfs_dev_init(struct hbl_cn_device *hdev)
+{
+	char name[64] = {0};
+
+	snprintf(name, sizeof(name), "hbl_cn%d", hdev->id);
+	hdev->cn_dentry = debugfs_create_dir(name, hbl_cn_debug_root);
+	__hbl_cn_debugfs_dev_init(hdev, hdev->cn_dentry);
+}
+
+void hbl_cn_debugfs_dev_fini(struct hbl_cn_device *hdev)
+{
+	debugfs_remove_recursive(hdev->cn_dentry);
+}
+
+void __init hbl_cn_debugfs_init(void)
+{
+	hbl_cn_debug_root = debugfs_create_dir(module_name(THIS_MODULE), NULL);
+}
+
+void hbl_cn_debugfs_fini(void)
+{
+	debugfs_remove_recursive(hbl_cn_debug_root);
+}
+
+#else
+
+void hbl_cn_debugfs_dev_init(struct hbl_cn_device *hdev)
+{
+}
+
+void hbl_cn_debugfs_dev_fini(struct hbl_cn_device *hdev)
+{
+}
+
+void __init hbl_cn_debugfs_init(void)
+{
+}
+
+void hbl_cn_debugfs_fini(void)
+{
+}
+
+#endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
index 5ea690509592..1a26d9f3b9a4 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
@@ -207,15 +207,32 @@ static struct auxiliary_driver hbl_cn_driver = {
 
 static int __init hbl_cn_init(void)
 {
+	int rc;
+
 	pr_info("loading driver\n");
 
-	return auxiliary_driver_register(&hbl_cn_driver);
+	hbl_cn_debugfs_init();
+
+	rc = auxiliary_driver_register(&hbl_cn_driver);
+	if (rc) {
+		pr_err("Failed to register auxiliary driver\n");
+		goto remove_debugfs;
+	}
+
+	return 0;
+
+remove_debugfs:
+	hbl_cn_debugfs_fini();
+
+	return rc;
 }
 
 static void __exit hbl_cn_exit(void)
 {
 	auxiliary_driver_unregister(&hbl_cn_driver);
 
+	hbl_cn_debugfs_fini();
+
 	pr_info("driver removed\n");
 }
 
-- 
2.34.1

