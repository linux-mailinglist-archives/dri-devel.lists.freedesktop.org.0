Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28F9084A6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ACF10EC4E;
	Fri, 14 Jun 2024 07:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gRZ+N8MA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A950E10E289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:29:08 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266947; bh=LXPpYlQbukwr46Uvpa2zCO+HU7QRqfS4gh+M9bYoir0=;
 h=From:To:Cc:Subject:Date:From;
 b=gRZ+N8MAADLnpNz9r4Ca0lNbAZlDy0p+6AXqjuwBIdG3YhR4k5Cyozg7ozN4vRlVS
 qVlPCk/HnTnJmAzikbTQq5jl35FYCOVgsDGejnRA4BCoVN97TXrAuoTODYfU03me0w
 Bqfm9yLM5wNNjoFwPbWtobQGdXQb73H4gBhhs4FtSJlKUh0DkP4+xW3aIsCBmbHVQZ
 QIib2BPBxFFXLYfb7e2nX/yqwjQAWbyD89iIxPQSqeqx08UAQ+zehDP2GwjRW+hTUT
 VqVSTbA3n2IpVsMhNVAX2gF/Qy+IQpBVn3camnkssvj3PY2y5dxhM+mDK1Mb96gYEi
 UudQJnJUA5IwQ==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hV1440009; Thu, 13 Jun 2024 11:22:08 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 00/15] Introduce HabanaLabs network drivers
Date: Thu, 13 Jun 2024 11:21:53 +0300
Message-Id: <20240613082208.1439968-1-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
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

This patch set implements the HabanaLabs network drivers for Gaudi2 ASIC
which is designed for scaling of AI neural networks training.
The patch set includes the common code which is shared by all Gaudi ASICs
and the Gaudi2 ASIC specific code. Newer ASICs code will be followed.
All of these network drivers are modeled as an auxiliary devices to the
parent driver.

The newly added drivers are Core Network (CN), Ethernet and InfiniBand.
All of these drivers are based on the existing habanalabs driver which
serves as the compute driver and the entire platform.
The habanalabs driver probes the network drivers which configure the
relevant NIC HW of the device. In addition, it continuously communicates
with the CN driver for providing some services which are not NIC specific
e.g. PCI, MMU, FW communication etc.

See the drivers scheme at:
Documentation/networking/device_drivers/ethernet/intel/hbl.rst

The CN driver is both a parent and a son driver. It serves as the common
layer of many shared operations that are required by both EN and IB
drivers.

The Gaudi2 NIC HW is composed of 48 physical lanes, 56Gbps each. Each pair
of lanes represent a 100Gbps logical port.

The NIC HW was designed specifically for scaling AI training.
Hence it basically functions as a regular NIC device but it is tuned for
its dedicated purpose. As a result, the NIC HW supports Ethernet traffic
and RDMA over modified ROCEv2 protocol.
For example, with respect to the IB driver, the HW supports a single
context and a single PD. The reason for this is that the operational use
case of AI training for Gaudi2 consists of a single user
application/process.
Another example related to the IB driver is the lack of MR since a single
application/process can share the entire MMU with the compute device.
Moreover, the memory allocation of user data buffers which are used for
RDMA communication is done via the habanalabs compute driver uAPI.
With respect to the Ethernet driver, since the Ethernet flow is used
mainly for control, the HW is not performance tuned e.g. it assumes a
contiguous memory for the Rx buffers. Thus the EN driver needs to copy the
Rx packets from the Rx buffer into the skb memory.

The first 8 patches implement the CN driver.
The next 2 patches implement the EN driver.
The next 2 patches implement the IB driver.
The last 3 patches modify the compute driver to support the CN driver.

The patches are rebased on v6.10-rc3 tag:
https://github.com/torvalds/linux/releases/tag/v6.10-rc3

The patches are also available at:
https://github.com/HabanaAI/drivers.gpu.linux-nic.kernel/tree/hbl_next

The user-mode of the driver is being reviewed at:
https://github.com/linux-rdma/rdma-core/pull/1472

Any feedback, comment or question is welcome.

Thanks,
Omer

Omer Shpigelman (15):
  net: hbl_cn: add habanalabs Core Network driver
  net: hbl_cn: memory manager component
  net: hbl_cn: physical layer support
  net: hbl_cn: QP state machine
  net: hbl_cn: memory trace events
  net: hbl_cn: debugfs support
  net: hbl_cn: gaudi2: ASIC register header files
  net: hbl_cn: gaudi2: ASIC specific support
  net: hbl_en: add habanalabs Ethernet driver
  net: hbl_en: gaudi2: ASIC specific support
  RDMA/hbl: add habanalabs RDMA driver
  RDMA/hbl: direct verbs support
  accel/habanalabs: network scaling support
  accel/habanalabs/gaudi2: CN registers header files
  accel/habanalabs/gaudi2: network scaling support

 .../ABI/testing/debugfs-driver-habanalabs_cn  |   195 +
 .../device_drivers/ethernet/index.rst         |     1 +
 .../device_drivers/ethernet/intel/hbl.rst     |    82 +
 MAINTAINERS                                   |    33 +
 drivers/accel/habanalabs/Kconfig              |     1 +
 drivers/accel/habanalabs/Makefile             |     3 +
 drivers/accel/habanalabs/cn/Makefile          |     2 +
 drivers/accel/habanalabs/cn/cn.c              |   815 +
 drivers/accel/habanalabs/cn/cn.h              |   133 +
 .../habanalabs/common/command_submission.c    |     2 +-
 drivers/accel/habanalabs/common/device.c      |    23 +
 drivers/accel/habanalabs/common/firmware_if.c |    20 +
 drivers/accel/habanalabs/common/habanalabs.h  |    43 +-
 .../accel/habanalabs/common/habanalabs_drv.c  |    37 +-
 .../habanalabs/common/habanalabs_ioctl.c      |     2 +
 drivers/accel/habanalabs/common/memory.c      |   123 +
 drivers/accel/habanalabs/gaudi/gaudi.c        |    14 +-
 drivers/accel/habanalabs/gaudi2/Makefile      |     2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |   440 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |    41 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_cn.c   |   424 +
 drivers/accel/habanalabs/gaudi2/gaudi2_cn.h   |    42 +
 .../habanalabs/gaudi2/gaudi2_coresight.c      |   145 +-
 .../accel/habanalabs/gaudi2/gaudi2_security.c |    16 +-
 drivers/accel/habanalabs/goya/goya.c          |     6 +
 .../include/gaudi2/asic_reg/gaudi2_regs.h     |    10 +-
 .../include/gaudi2/asic_reg/nic0_phy_regs.h   |    59 +
 .../nic0_qm0_axuser_nonsecured_regs.h         |    61 +
 .../include/gaudi2/asic_reg/nic0_qpc1_regs.h  |   905 +
 .../include/gaudi2/asic_reg/nic0_rxe0_regs.h  |   725 +
 .../include/gaudi2/asic_reg/nic0_rxe1_regs.h  |   725 +
 .../include/gaudi2/asic_reg/nic0_txe0_regs.h  |   529 +
 .../include/gaudi2/asic_reg/nic0_txs0_regs.h  |   289 +
 .../include/hw_ip/nic/nic_general.h           |    15 +
 drivers/infiniband/Kconfig                    |     1 +
 drivers/infiniband/hw/Makefile                |     1 +
 drivers/infiniband/hw/hbl/Kconfig             |    18 +
 drivers/infiniband/hw/hbl/Makefile            |    12 +
 drivers/infiniband/hw/hbl/hbl.h               |   326 +
 drivers/infiniband/hw/hbl/hbl_encap.c         |   216 +
 drivers/infiniband/hw/hbl/hbl_main.c          |   493 +
 drivers/infiniband/hw/hbl/hbl_query_port.c    |    96 +
 drivers/infiniband/hw/hbl/hbl_set_port_ex.c   |    96 +
 drivers/infiniband/hw/hbl/hbl_usr_fifo.c      |   252 +
 drivers/infiniband/hw/hbl/hbl_verbs.c         |  2686 +
 drivers/net/ethernet/intel/Kconfig            |    38 +
 drivers/net/ethernet/intel/Makefile           |     2 +
 drivers/net/ethernet/intel/hbl_cn/Makefile    |    14 +
 .../net/ethernet/intel/hbl_cn/common/Makefile |     3 +
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.c |  5984 ++
 .../net/ethernet/intel/hbl_cn/common/hbl_cn.h |  1666 +
 .../intel/hbl_cn/common/hbl_cn_debugfs.c      |  1457 +
 .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |   240 +
 .../intel/hbl_cn/common/hbl_cn_memory.c       |   368 +
 .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c |   234 +
 .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  |   491 +
 .../net/ethernet/intel/hbl_cn/gaudi2/Makefile |     3 +
 .../asic_reg/arc_farm_kdma_ctx_axuser_masks.h |   135 +
 .../asic_reg/dcore0_sync_mngr_objs_regs.h     | 43543 +++++++++++++++
 .../asic_reg/gaudi2_blocks_linux_driver.h     | 45068 ++++++++++++++++
 .../hbl_cn/gaudi2/asic_reg/gaudi2_regs.h      |    77 +
 .../asic_reg/nic0_mac_ch0_mac_128_masks.h     |   339 +
 .../asic_reg/nic0_mac_ch0_mac_128_regs.h      |   101 +
 .../asic_reg/nic0_mac_ch0_mac_pcs_masks.h     |   713 +
 .../asic_reg/nic0_mac_ch0_mac_pcs_regs.h      |   271 +
 .../asic_reg/nic0_mac_ch1_mac_pcs_regs.h      |   271 +
 .../asic_reg/nic0_mac_ch2_mac_pcs_regs.h      |   271 +
 .../asic_reg/nic0_mac_ch3_mac_pcs_regs.h      |   271 +
 .../nic0_mac_glob_stat_control_reg_masks.h    |    67 +
 .../nic0_mac_glob_stat_control_reg_regs.h     |    37 +
 .../asic_reg/nic0_mac_glob_stat_rx0_regs.h    |    93 +
 .../asic_reg/nic0_mac_glob_stat_rx2_regs.h    |    93 +
 .../asic_reg/nic0_mac_glob_stat_tx0_regs.h    |    75 +
 .../asic_reg/nic0_mac_glob_stat_tx2_regs.h    |    75 +
 .../gaudi2/asic_reg/nic0_mac_rs_fec_regs.h    |   157 +
 .../hbl_cn/gaudi2/asic_reg/nic0_phy_masks.h   |    77 +
 .../hbl_cn/gaudi2/asic_reg/nic0_phy_regs.h    |    59 +
 .../nic0_qm0_axuser_nonsecured_regs.h         |    61 +
 .../asic_reg/nic0_qpc0_axuser_cong_que_regs.h |    61 +
 .../asic_reg/nic0_qpc0_axuser_db_fifo_regs.h  |    61 +
 .../asic_reg/nic0_qpc0_axuser_err_fifo_regs.h |    61 +
 .../nic0_qpc0_axuser_ev_que_lbw_intr_regs.h   |    61 +
 .../asic_reg/nic0_qpc0_axuser_qpc_req_regs.h  |    61 +
 .../asic_reg/nic0_qpc0_axuser_qpc_resp_regs.h |    61 +
 .../asic_reg/nic0_qpc0_axuser_rxwqe_regs.h    |    61 +
 .../nic0_qpc0_axuser_txwqe_lbw_qman_bp_regs.h |    61 +
 .../nic0_qpc0_dbfifo0_ci_upd_addr_regs.h      |    27 +
 .../nic0_qpc0_dbfifosecur_ci_upd_addr_regs.h  |    27 +
 .../hbl_cn/gaudi2/asic_reg/nic0_qpc0_masks.h  |   963 +
 .../hbl_cn/gaudi2/asic_reg/nic0_qpc0_regs.h   |   905 +
 .../hbl_cn/gaudi2/asic_reg/nic0_qpc1_regs.h   |   905 +
 .../gaudi2/asic_reg/nic0_rxb_core_masks.h     |   459 +
 .../gaudi2/asic_reg/nic0_rxb_core_regs.h      |   665 +
 .../nic0_rxe0_axuser_axuser_cq0_regs.h        |    61 +
 .../nic0_rxe0_axuser_axuser_cq1_regs.h        |    61 +
 .../hbl_cn/gaudi2/asic_reg/nic0_rxe0_masks.h  |   705 +
 .../hbl_cn/gaudi2/asic_reg/nic0_rxe0_regs.h   |   725 +
 .../asic_reg/nic0_rxe0_wqe_aruser_regs.h      |    61 +
 .../hbl_cn/gaudi2/asic_reg/nic0_rxe1_regs.h   |   725 +
 .../gaudi2/asic_reg/nic0_serdes0_masks.h      |  7163 +++
 .../gaudi2/asic_reg/nic0_serdes0_regs.h       |  1679 +
 .../gaudi2/asic_reg/nic0_serdes1_regs.h       |  1679 +
 .../asic_reg/nic0_tmr_axuser_tmr_fifo_regs.h  |    61 +
 .../nic0_tmr_axuser_tmr_free_list_regs.h      |    61 +
 .../asic_reg/nic0_tmr_axuser_tmr_fsm_regs.h   |    61 +
 .../hbl_cn/gaudi2/asic_reg/nic0_tmr_masks.h   |   361 +
 .../hbl_cn/gaudi2/asic_reg/nic0_tmr_regs.h    |   183 +
 .../hbl_cn/gaudi2/asic_reg/nic0_txb_regs.h    |   167 +
 .../hbl_cn/gaudi2/asic_reg/nic0_txe0_masks.h  |   759 +
 .../hbl_cn/gaudi2/asic_reg/nic0_txe0_regs.h   |   529 +
 .../hbl_cn/gaudi2/asic_reg/nic0_txs0_masks.h  |   555 +
 .../hbl_cn/gaudi2/asic_reg/nic0_txs0_regs.h   |   289 +
 .../nic0_umr0_0_completion_queue_ci_1_regs.h  |    27 +
 .../nic0_umr0_0_unsecure_doorbell0_regs.h     |    31 +
 .../nic0_umr0_0_unsecure_doorbell1_regs.h     |    31 +
 .../gaudi2/asic_reg/prt0_mac_core_masks.h     |   137 +
 .../gaudi2/asic_reg/prt0_mac_core_regs.h      |    67 +
 .../ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.c  |  5689 ++
 .../ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.h  |   427 +
 .../intel/hbl_cn/gaudi2/gaudi2_cn_debugfs.c   |   319 +
 .../intel/hbl_cn/gaudi2/gaudi2_cn_eq.c        |   732 +
 .../intel/hbl_cn/gaudi2/gaudi2_cn_phy.c       |  2743 +
 drivers/net/ethernet/intel/hbl_en/Makefile    |    12 +
 .../net/ethernet/intel/hbl_en/common/Makefile |     3 +
 .../net/ethernet/intel/hbl_en/common/hbl_en.c |  1170 +
 .../net/ethernet/intel/hbl_en/common/hbl_en.h |   208 +
 .../intel/hbl_en/common/hbl_en_dcbnl.c        |   101 +
 .../ethernet/intel/hbl_en/common/hbl_en_drv.c |   211 +
 .../intel/hbl_en/common/hbl_en_ethtool.c      |   452 +
 .../net/ethernet/intel/hbl_en/gaudi2/Makefile |     2 +
 .../ethernet/intel/hbl_en/gaudi2/gaudi2_en.c  |   728 +
 .../ethernet/intel/hbl_en/gaudi2/gaudi2_en.h  |    53 +
 .../intel/hbl_en/gaudi2/gaudi2_en_dcbnl.c     |    32 +
 include/linux/habanalabs/cpucp_if.h           |   125 +-
 include/linux/habanalabs/hl_boot_if.h         |     9 +-
 include/linux/net/intel/cn.h                  |   474 +
 include/linux/net/intel/cn_aux.h              |   298 +
 include/linux/net/intel/cni.h                 |   636 +
 include/linux/net/intel/gaudi2.h              |   432 +
 include/linux/net/intel/gaudi2_aux.h          |    94 +
 include/trace/events/habanalabs_cn.h          |   116 +
 include/uapi/drm/habanalabs_accel.h           |    10 +-
 include/uapi/rdma/hbl-abi.h                   |   204 +
 include/uapi/rdma/hbl_user_ioctl_cmds.h       |    66 +
 include/uapi/rdma/hbl_user_ioctl_verbs.h      |   106 +
 include/uapi/rdma/ib_user_ioctl_verbs.h       |     1 +
 146 files changed, 148514 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-driver-habanalabs_cn
 create mode 100644 Documentation/networking/device_drivers/ethernet/intel/hbl.rst
 create mode 100644 drivers/accel/habanalabs/cn/Makefile
 create mode 100644 drivers/accel/habanalabs/cn/cn.c
 create mode 100644 drivers/accel/habanalabs/cn/cn.h
 create mode 100644 drivers/accel/habanalabs/gaudi2/gaudi2_cn.c
 create mode 100644 drivers/accel/habanalabs/gaudi2/gaudi2_cn.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_phy_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_qpc1_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_rxe1_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txe0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/nic0_txs0_regs.h
 create mode 100644 drivers/accel/habanalabs/include/hw_ip/nic/nic_general.h
 create mode 100644 drivers/infiniband/hw/hbl/Kconfig
 create mode 100644 drivers/infiniband/hw/hbl/Makefile
 create mode 100644 drivers/infiniband/hw/hbl/hbl.h
 create mode 100644 drivers/infiniband/hw/hbl/hbl_encap.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_main.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_query_port.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_set_port_ex.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_usr_fifo.c
 create mode 100644 drivers/infiniband/hw/hbl/hbl_verbs.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_debugfs.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_drv.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_memory.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/gaudi2_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch0_mac_128_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch0_mac_128_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch0_mac_pcs_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch0_mac_pcs_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch1_mac_pcs_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch2_mac_pcs_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_ch3_mac_pcs_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_control_reg_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_control_reg_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_rx0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_rx2_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_tx0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_glob_stat_tx2_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_mac_rs_fec_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_phy_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_phy_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qm0_axuser_nonsecured_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_cong_que_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_db_fifo_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_err_fifo_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_ev_que_lbw_intr_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_qpc_req_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_qpc_resp_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_rxwqe_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_axuser_txwqe_lbw_qman_bp_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_dbfifo0_ci_upd_addr_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_dbfifosecur_ci_upd_addr_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_qpc1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxb_core_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxb_core_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe0_axuser_axuser_cq0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe0_axuser_axuser_cq1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe0_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe0_wqe_aruser_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_rxe1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_serdes0_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_serdes0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_serdes1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_tmr_axuser_tmr_fifo_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_tmr_axuser_tmr_free_list_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_tmr_axuser_tmr_fsm_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_tmr_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_tmr_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_txb_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_txe0_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_txe0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_txs0_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_txs0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell1_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/prt0_mac_core_masks.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/asic_reg/prt0_mac_core_regs.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.h
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/gaudi2_cn_debugfs.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/gaudi2_cn_eq.c
 create mode 100644 drivers/net/ethernet/intel/hbl_cn/gaudi2/gaudi2_cn_phy.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en.h
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_dcbnl.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_drv.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_ethtool.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/gaudi2/Makefile
 create mode 100644 drivers/net/ethernet/intel/hbl_en/gaudi2/gaudi2_en.c
 create mode 100644 drivers/net/ethernet/intel/hbl_en/gaudi2/gaudi2_en.h
 create mode 100644 drivers/net/ethernet/intel/hbl_en/gaudi2/gaudi2_en_dcbnl.c
 create mode 100644 include/linux/net/intel/cn.h
 create mode 100644 include/linux/net/intel/cn_aux.h
 create mode 100644 include/linux/net/intel/cni.h
 create mode 100644 include/linux/net/intel/gaudi2.h
 create mode 100644 include/linux/net/intel/gaudi2_aux.h
 create mode 100644 include/trace/events/habanalabs_cn.h
 create mode 100644 include/uapi/rdma/hbl-abi.h
 create mode 100644 include/uapi/rdma/hbl_user_ioctl_cmds.h
 create mode 100644 include/uapi/rdma/hbl_user_ioctl_verbs.h

-- 
2.34.1

