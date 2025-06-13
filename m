Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2725AD9748
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 23:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103410EA55;
	Fri, 13 Jun 2025 21:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FF010E1F3;
 Fri, 13 Jun 2025 13:45:44 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 4/8] drm/xe: Add fabric code from i915 backport repository.
Date: Fri, 13 Jun 2025 15:45:23 +0200
Message-ID: <20250613134520.2458175-14-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613134520.2458175-10-dev@lankhorst.se>
References: <20250613134520.2458175-10-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Jun 2025 21:19:39 +0000
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

This is just a rough copy from the backport repository, made to work
with the current xe code (compile fixes, etc).

The fabric code attempts to enumerate the PSCBIN through MTD, and thus
requires the MTD patch series from Alexander Usyskin to work.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/Kconfig                    |    2 +
 drivers/gpu/drm/xe/Makefile                   |    1 +
 drivers/gpu/drm/xe/fabric/Kconfig             |   53 +
 drivers/gpu/drm/xe/fabric/Makefile            |   42 +
 drivers/gpu/drm/xe/fabric/csr.h               |  497 ++++
 drivers/gpu/drm/xe/fabric/debugfs.c           |  112 +
 drivers/gpu/drm/xe/fabric/debugfs.h           |   26 +
 drivers/gpu/drm/xe/fabric/dev_diag.c          |  723 ++++++
 drivers/gpu/drm/xe/fabric/dev_diag.h          |   15 +
 drivers/gpu/drm/xe/fabric/error.c             | 1490 ++++++++++++
 drivers/gpu/drm/xe/fabric/error.h             |   15 +
 drivers/gpu/drm/xe/fabric/fw.c                | 2089 +++++++++++++++++
 drivers/gpu/drm/xe/fabric/fw.h                |   21 +
 drivers/gpu/drm/xe/fabric/iaf_drv.h           | 1341 +++++++++++
 drivers/gpu/drm/xe/fabric/iaf_netlink.h       |  208 ++
 drivers/gpu/drm/xe/fabric/io.h                |   82 +
 drivers/gpu/drm/xe/fabric/main.c              | 1098 +++++++++
 drivers/gpu/drm/xe/fabric/mbdb.c              | 1173 +++++++++
 drivers/gpu/drm/xe/fabric/mbdb.h              |  171 ++
 drivers/gpu/drm/xe/fabric/mbox.c              |  440 ++++
 drivers/gpu/drm/xe/fabric/mbox.h              |   18 +
 drivers/gpu/drm/xe/fabric/mei_iaf_user.c      |  440 ++++
 drivers/gpu/drm/xe/fabric/mei_iaf_user.h      |   19 +
 drivers/gpu/drm/xe/fabric/netlink.c           | 1532 ++++++++++++
 drivers/gpu/drm/xe/fabric/netlink.h           |   15 +
 drivers/gpu/drm/xe/fabric/ops.c               | 1476 ++++++++++++
 drivers/gpu/drm/xe/fabric/ops.h               |  525 +++++
 drivers/gpu/drm/xe/fabric/parallel.c          |   96 +
 drivers/gpu/drm/xe/fabric/parallel.h          |   33 +
 drivers/gpu/drm/xe/fabric/port.c              | 1884 +++++++++++++++
 drivers/gpu/drm/xe/fabric/port.h              |   41 +
 drivers/gpu/drm/xe/fabric/port_diag.c         | 1892 +++++++++++++++
 drivers/gpu/drm/xe/fabric/port_diag.h         |   19 +
 drivers/gpu/drm/xe/fabric/routing_debug.c     |  484 ++++
 drivers/gpu/drm/xe/fabric/routing_debug.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_engine.c    |  565 +++++
 drivers/gpu/drm/xe/fabric/routing_engine.h    |   25 +
 drivers/gpu/drm/xe/fabric/routing_event.c     |  249 ++
 drivers/gpu/drm/xe/fabric/routing_event.h     |   19 +
 drivers/gpu/drm/xe/fabric/routing_io.c        |  496 ++++
 drivers/gpu/drm/xe/fabric/routing_io.h        |   15 +
 drivers/gpu/drm/xe/fabric/routing_logic.c     |  934 ++++++++
 drivers/gpu/drm/xe/fabric/routing_logic.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_p2p.c       |  883 +++++++
 drivers/gpu/drm/xe/fabric/routing_p2p.h       |   22 +
 drivers/gpu/drm/xe/fabric/routing_pause.c     |  282 +++
 drivers/gpu/drm/xe/fabric/routing_pause.h     |   16 +
 drivers/gpu/drm/xe/fabric/routing_topology.c  |  200 ++
 drivers/gpu/drm/xe/fabric/routing_topology.h  |  376 +++
 .../drm/xe/fabric/selftests/routing_mock.c    |  291 +++
 .../drm/xe/fabric/selftests/routing_mock.h    |   22 +
 .../xe/fabric/selftests/routing_selftest.c    |  424 ++++
 .../xe/fabric/selftests/routing_selftest.h    |   12 +
 .../gpu/drm/xe/fabric/selftests/selftest.c    |   73 +
 .../gpu/drm/xe/fabric/selftests/selftest.h    |   34 +
 drivers/gpu/drm/xe/fabric/statedump.c         |  283 +++
 drivers/gpu/drm/xe/fabric/statedump.h         |   32 +
 drivers/gpu/drm/xe/fabric/sysfs.c             |  327 +++
 drivers/gpu/drm/xe/fabric/sysfs.h             |   16 +
 drivers/gpu/drm/xe/fabric/trace.c             |    8 +
 drivers/gpu/drm/xe/fabric/trace.h             |   11 +
 drivers/gpu/drm/xe/fabric/trace_mbx.h         |   99 +
 drivers/gpu/drm/xe/fabric/trace_nl.h          |   54 +
 drivers/gpu/drm/xe/fabric/trace_pm.h          |  102 +
 drivers/gpu/drm/xe/fabric/trace_rt.h          |  110 +
 include/drm/intel/intel_iaf_platform.h        |  145 ++
 66 files changed, 24230 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/fabric/Kconfig
 create mode 100644 drivers/gpu/drm/xe/fabric/Makefile
 create mode 100644 drivers/gpu/drm/xe/fabric/csr.h
 create mode 100644 drivers/gpu/drm/xe/fabric/debugfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/debugfs.h
 create mode 100644 drivers/gpu/drm/xe/fabric/dev_diag.c
 create mode 100644 drivers/gpu/drm/xe/fabric/dev_diag.h
 create mode 100644 drivers/gpu/drm/xe/fabric/error.c
 create mode 100644 drivers/gpu/drm/xe/fabric/error.h
 create mode 100644 drivers/gpu/drm/xe/fabric/fw.c
 create mode 100644 drivers/gpu/drm/xe/fabric/fw.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_drv.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_netlink.h
 create mode 100644 drivers/gpu/drm/xe/fabric/io.h
 create mode 100644 drivers/gpu/drm/xe/fabric/main.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbdb.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbdb.h
 create mode 100644 drivers/gpu/drm/xe/fabric/mbox.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mbox.h
 create mode 100644 drivers/gpu/drm/xe/fabric/mei_iaf_user.c
 create mode 100644 drivers/gpu/drm/xe/fabric/mei_iaf_user.h
 create mode 100644 drivers/gpu/drm/xe/fabric/netlink.c
 create mode 100644 drivers/gpu/drm/xe/fabric/netlink.h
 create mode 100644 drivers/gpu/drm/xe/fabric/ops.c
 create mode 100644 drivers/gpu/drm/xe/fabric/ops.h
 create mode 100644 drivers/gpu/drm/xe/fabric/parallel.c
 create mode 100644 drivers/gpu/drm/xe/fabric/parallel.h
 create mode 100644 drivers/gpu/drm/xe/fabric/port.c
 create mode 100644 drivers/gpu/drm/xe/fabric/port.h
 create mode 100644 drivers/gpu/drm/xe/fabric/port_diag.c
 create mode 100644 drivers/gpu/drm/xe/fabric/port_diag.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_debug.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_debug.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_engine.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_engine.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_event.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_event.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_io.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_io.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_logic.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_logic.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_p2p.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_p2p.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_pause.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_pause.h
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_topology.c
 create mode 100644 drivers/gpu/drm/xe/fabric/routing_topology.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_mock.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_mock.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_selftest.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/routing_selftest.h
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/selftest.c
 create mode 100644 drivers/gpu/drm/xe/fabric/selftests/selftest.h
 create mode 100644 drivers/gpu/drm/xe/fabric/statedump.c
 create mode 100644 drivers/gpu/drm/xe/fabric/statedump.h
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace.c
 create mode 100644 drivers/gpu/drm/xe/fabric/trace.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_mbx.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_nl.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_pm.h
 create mode 100644 drivers/gpu/drm/xe/fabric/trace_rt.h
 create mode 100644 include/drm/intel/intel_iaf_platform.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c57f1da0791d9..1bfaba0a5b2e0 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -134,3 +134,5 @@ menu "drm/xe Profile Guided Optimisation"
 	depends on DRM_XE
 	source "drivers/gpu/drm/xe/Kconfig.profile"
 endmenu
+
+source "drivers/gpu/drm/xe/fabric/Kconfig"
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4c51fe3520dcc..7b6fee7fd1a65 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -321,6 +321,7 @@ xe-$(CONFIG_DRM_XE_DP_TUNNEL) += \
 
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
+obj-$(CONFIG_DRM_INTEL_FABRIC) += fabric/
 
 # header test
 hdrtest_find_args := -not -path xe_rtp_helpers.h
diff --git a/drivers/gpu/drm/xe/fabric/Kconfig b/drivers/gpu/drm/xe/fabric/Kconfig
new file mode 100644
index 0000000000000..ef1f6643ad22e
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/Kconfig
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_INTEL_FABRIC
+	tristate "Intel Fabric Connectivity driver support"
+	depends on DRM_XE
+	depends on 64BIT
+	depends on NET
+	depends on CRYPTO_CRC32C
+	default m
+	help
+	  This kernel driver provides support for the Intel glueless
+	  fabric adapter. The Intel fabric adapter allows GPUs to share
+	  device memory space in a device specific address space.
+
+config IAF_DEBUG_ENABLE
+	bool "Enable Intel Accelerator Fabric debug configurations"
+	depends on DRM_INTEL_FABRIC
+	default n
+	help
+	  Support Intel Accelerator Fabric debug Kconfig options
+
+config IAF_DEBUG_ALTERNATE_FW_LOAD
+	bool "Enable Intel Accelerator Fabric load of alternative FW images"
+	depends on IAF_DEBUG_ENABLE
+	default y
+	help
+	  Allow fw_image to specify alternate firmware and psc_file_override
+	  to load PSC binaries using the FW API instead of SPI flash
+
+config IAF_DEBUG_SELFTESTS
+	bool "Enable Intel Accelerator Fabric tests"
+	depends on IAF_DEBUG_ENABLE
+	default n
+	help
+	  Enable Intel Accelerator Fabric driver self-tests to be triggered
+	  by the 'selftests' module parameter
+
+config IAF_DEBUG_MBOX_ACCESS
+	bool "Enable Intel Accelerator Fabric mbox access interface"
+	depends on EXPERT && IAF_DEBUG_ENABLE
+	default y
+	help
+	  DO NOT UPSTREAM:
+	  The mbox interface is an external debug mechanism
+	  for supporting debugging of the fabric device firmware
+
+config IAF_DEBUG_STARTUP
+	bool "Enable Intel Accelerator Fabric debug startup mode"
+	depends on EXPERT && IAF_DEBUG_ENABLE
+	default y
+	help
+	  DO NOT UPSTREAM:
+	  Allow startup_mode parameter to boot devices into debug modes
+
diff --git a/drivers/gpu/drm/xe/fabric/Makefile b/drivers/gpu/drm/xe/fabric/Makefile
new file mode 100644
index 0000000000000..9351ef2bd4e05
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/Makefile
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright(c) 2020 - 2022 Intel Corporation.
+#
+# Intel Connectivity fabric driver
+#
+
+obj-$(CONFIG_DRM_INTEL_FABRIC) += iaf.o
+
+iaf-y := debugfs.o \
+	 dev_diag.o \
+	 error.o \
+	 fw.o \
+	 main.o \
+	 mei_iaf_user.o \
+	 mbdb.o \
+	 netlink.o \
+	 ops.o \
+	 parallel.o \
+	 port.o \
+	 port_diag.o \
+	 routing_debug.o \
+	 routing_engine.o \
+	 routing_event.o \
+	 routing_io.o \
+	 routing_logic.o \
+	 routing_p2p.o \
+	 routing_pause.o \
+	 routing_topology.o \
+	 statedump.o \
+	 sysfs.o \
+	 trace.o \
+
+iaf-$(CONFIG_IAF_DEBUG_MBOX_ACCESS) += mbox.o
+
+#export CONFIG_IAF_DEBUG_SELFTESTS=y
+subdir-ccflags-$(CONFIG_IAF_DEBUG_SELFTESTS) += -DCONFIG_IAF_DEBUG_SELFTESTS
+iaf-$(CONFIG_IAF_DEBUG_SELFTESTS) += selftests/selftest.o\
+				     selftests/routing_selftest.o\
+				     selftests/routing_mock.o\
+
+CFLAGS_trace.o = -I$(src)
diff --git a/drivers/gpu/drm/xe/fabric/csr.h b/drivers/gpu/drm/xe/fabric/csr.h
new file mode 100644
index 0000000000000..47b9a9a48f57d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/csr.h
@@ -0,0 +1,497 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef IAF_CSR_H_INCLUDED
+#define IAF_CSR_H_INCLUDED
+
+#include <linux/types.h>
+
+#define CSR_SIZE sizeof(u64)
+
+/*
+ * TOP CSRs
+ */
+
+#define CP_ADDR_TOP_BASE		(0)
+#define CPORT_INIT_CTRL_ADDR		(CP_ADDR_TOP_BASE + 0)
+#define RISC_RESET_BIT			BIT_ULL(0)
+#define RISC_NMI_BIT			BIT_ULL(2)
+#define RISC_PAUSED_BIT			BIT_ULL(3)
+#define BOOTROM_PARITY_ERROR_BIT	BIT_ULL(4)
+#define WATCHDOG_STATUS_BIT		BIT_ULL(5)
+#define RISC_RESET_CAUSE_BIT		BIT_ULL(7)
+#define DINIT_FSM_STATE_MASK		GENMASK_ULL(31, 8)
+#define CSR_GPIO_CTRL			(CP_ADDR_TOP_BASE + 0x18)
+#define GPIO_CTRL_PIN_LINK_CONFIG	GENMASK_ULL(7, 3)
+#define GPIO_CTRL_OE_LINK_CONFIG	GENMASK_ULL(15, 11)
+#define CSR_ASIC_REV_INFO		(CP_ADDR_TOP_BASE + 0x40)
+#define MASK_ARI_PLATFORM		GENMASK_ULL(55, 40)
+#define MASK_ARI_STEP			GENMASK_ULL(39, 32)
+#define ARB_REG_BASE			(CP_ADDR_TOP_BASE + 0x100)
+#define FW_MIN_SVN_ADDR			(ARB_REG_BASE + 0x0)
+#define FW_UPDATED_SVN_ADDR		(ARB_REG_BASE + 0x8)
+#define FW_SVN_MASK			GENMASK_ULL(15, 0)
+#define CSR_CP_DEV_EFUSE_VERSION	0x18150
+#define CP_DEV_EFUSE_VERSION_VARIANT_MASK	GENMASK_ULL(23, 16)
+#define CP_DEV_EFUSE_VERSION_VARIANT_NORMAL	0
+#define CP_DEV_EFUSE_VERSION_VARIANT_EXPORT	1
+
+#define CSR_ROPTION				0x80000008
+#define ROPTION_FORCE_FEC_HEAVY_ON		BIT(0)
+#define ROPTION_CBUF_MGR_TRACE_XBAR		BIT(1)
+#define ROPTION_CBUF_MGR_TRACE_PCI		BIT(2)
+#define ROPTION_CBUF_MGR_TRACE_ATTRIBUTES	BIT(3)
+#define ROPTION_PD_PHASE			GENMASK(5, 4)
+#define ROPTION_STOP_IN_CONFIGLT_WITH_BCC	BIT(6)
+#define ROPTION_TRACE_ERROR_RECOVERY		BIT(7)
+#define ROPTION_EV_MODE				BIT(8)
+#define ROPTION_TRACE_LNI_DEBUG			BIT(9)
+#define ROPTION_TRACE_SBUS_OPS			BIT(10)
+#define ROPTION_TRACE_STOP_ON_FULL		BIT(11)
+#define ROPTION_12G_ALLOWED			BIT(12)
+#define ROPTION_NO_DLA				BIT(13)
+#define ROPTION_DYNAMIC_SCREEN			BIT(14)
+#define ROPTION_UNUSED15			BIT(15)
+#define ROPTION_LOOP_BANDWIDTH			GENMASK(20, 16)
+#define ROPTION_1D_CODING			BIT(21)
+#define ROPTION_LCB_LOOPBACK			GENMASK(23, 22)
+#define ROPTION_TX_PRBS_GEN			BIT(24)
+#define ROPTION_STOP_IN_DEBOUNCE		BIT(25)
+#define ROPTION_NO_TUNING_IN_DEBOUNCE		BIT(26)
+#define ROPTION_CONFIGLT_NO_HAMMERS		BIT(27)
+#define ROPTION_FORCE_LNI			BIT(28)
+#define ROPTION_ALLOW_MARGINAL_LINKS		BIT(29)
+#define ROPTION_FORCE_FEC_LIGHT_ON		BIT(30)
+#define ROPTION_SERDES_ILB			BIT(31)
+
+/*
+ * PORT CSRs
+ */
+
+#define CSR_PORTS_BASE 0x10000000
+
+/*
+ * Each port is at a 4MB offset from CSR_PORTS_BASE, index by physical port
+ * number.
+ */
+#define CSR_PORT_OFFSET 0x400000
+
+/*
+ * Fabric ports are in memory region 0, while bridge ports are in region 1.
+ *
+ * When referencing bridge port addresses, both when using the raw CSR ops
+ * as well as the LINK_MGR_PORT_CSR ops, you must add this offset to
+ * addresses.
+ */
+#define CSR_REGION1_OFFSET 0x20000000
+
+/**
+ * get_raw_port_base - Calculates the base address of the given port for
+ * use with the CSR_RAW ops.
+ * @ppn: physical port number
+ *
+ * Return: The base address required for the CSR_RAW ops.
+ */
+static inline u32 get_raw_port_base(u8 ppn)
+{
+	return CSR_PORTS_BASE + ((ppn) - 1) * CSR_PORT_OFFSET;
+}
+
+#define CSR_FIDGEN_BASE 0
+
+#define CSR_FIDGEN_MASK_A     (CSR_FIDGEN_BASE + 0x00)
+#define CSR_FIDGEN_SHIFT_A    (CSR_FIDGEN_BASE + 0x08)
+#define CSR_FIDGEN_MASK_B     (CSR_FIDGEN_BASE + 0x10)
+#define CSR_FIDGEN_SHIFT_B    (CSR_FIDGEN_BASE + 0x18)
+#define CSR_FIDGEN_RSVD0      (CSR_FIDGEN_BASE + 0x20)
+#define CSR_FIDGEN_RSVD1      (CSR_FIDGEN_BASE + 0x28)
+#define CSR_FIDGEN_MASK_H     (CSR_FIDGEN_BASE + 0x30)
+#define CSR_FIDGEN_SHIFT_H    (CSR_FIDGEN_BASE + 0x38)
+#define CSR_FIDGEN_MODULO     (CSR_FIDGEN_BASE + 0x40)
+#define CSR_FIDGEN_WHOAMI     (CSR_FIDGEN_BASE + 0x48)
+#define CSR_FIDGEN_MASK_D     (CSR_FIDGEN_BASE + 0x50)
+#define CSR_FIDGEN_STATIC_RND (CSR_FIDGEN_BASE + 0x58)
+
+/*
+ * These apply to all of the shift registers.  Bit 6 is the direction of
+ * shift, while bits 5 through 0 are the amount to shift by.
+ */
+#define MASK_FIDGEN_SHIFT_BY    GENMASK(5, 0)
+#define MASK_FIDGEN_SHIFT_RIGHT GENMASK(6, 6)
+
+/*
+ * The LUT contains 8192 64-bit registers, each mapping a lookup index
+ * to a 20-bit DFID.
+ */
+#define CSR_FIDGEN_LUT_BASE (CSR_FIDGEN_BASE + 0x10000)
+
+#define CSR_FIDGEN_LUT_INDEX_WIDTH 13
+
+#define CSR_BRIDGE_TOP_BASE 0x30000
+
+#define CSR_BT_CTX_TRACKER_CFG CSR_BRIDGE_TOP_BASE
+#define MASK_BT_CTC_ENABLE_SRC          GENMASK(0, 0)
+#define MASK_BT_CTC_ENABLE_DST          GENMASK(1, 1)
+#define MASK_BT_CTC_DISABLE_TIMEOUT_SRC GENMASK(2, 2)
+#define MASK_BT_CTC_DISABLE_TIMEOUT_DST GENMASK(3, 3)
+
+#define CSR_BT_PORT_CTRL (CSR_BRIDGE_TOP_BASE + 0x08)
+#define MASK_BT_POC_DROP_FBRC_REQ     GENMASK(0, 0)
+#define MASK_BT_POC_DROP_FBRC_REQ_ERR GENMASK(1, 1)
+#define MASK_BT_POC_DROP_MDFI_REQ     GENMASK(2, 2)
+#define MASK_BT_POC_DROP_MDFI_REQ_ERR GENMASK(3, 3)
+#define MASK_BT_POC_DROP_FBRC_RSP     GENMASK(4, 4)
+#define MASK_BT_POC_DROP_MDFI_RSP     GENMASK(5, 5)
+
+#define CSR_BT_OUTSTANDING_TX (CSR_BRIDGE_TOP_BASE + 0x10)
+#define MASK_BT_OT_FBRC GENMASK(15,  0)
+#define MASK_BT_OT_MDFI GENMASK(31, 16)
+
+#define CSR_BT_FLUSH_CONTEXT (CSR_BRIDGE_TOP_BASE + 0x18)
+#define MASK_BT_FC_INITIATE    GENMASK(0, 0)
+#define MASK_BT_FC_IN_PROGRESS GENMASK(1, 1)
+
+#define CSR_BT_PAUSE_CTRL (CSR_BRIDGE_TOP_BASE + 0x20)
+#define MASK_BT_PAC_FBRC_REQ GENMASK(0, 0)
+#define MASK_BT_PAC_MDFI_REQ GENMASK(1, 1)
+#define MASK_BT_PAC_FBRC_RSP GENMASK(2, 2)
+#define MASK_BT_PAC_MDFI_RSP GENMASK(3, 3)
+
+#define CSR_BT_PKG_ADDR_RANGE (CSR_BRIDGE_TOP_BASE + 0x28)
+#define MASK_BT_PAR_BASE  GENMASK(18, 1)
+#define MASK_BT_PAR_RANGE GENMASK(29, 20)
+
+/* csr encodes address bits [45:32] in register bits [13:0] */
+#define BT_ADDR_RANGE_SHIFT 32
+
+#define CSR_BT_VC2SC_MAP (CSR_BRIDGE_TOP_BASE + 0x50)
+
+#define CSR_BT_TILE0_RANGE (CSR_BRIDGE_TOP_BASE + 0x58)
+#define MASK_BT_T0_VALID GENMASK(0, 0)
+#define MASK_BT_T0_BASE  GENMASK(7, 1)
+#define MASK_BT_T0_RANGE GENMASK(14, 8)
+
+#define CSR_BT_TILE1_RANGE (CSR_BRIDGE_TOP_BASE + 0x60)
+#define MASK_BT_T1_VALID GENMASK(0, 0)
+#define MASK_BT_T1_BASE  GENMASK(7, 1)
+#define MASK_BT_T1_RANGE GENMASK(14, 8)
+
+/* xmit/recv flit/packet counter register offsets */
+#define O_FPC_PORTRCV_DATA_CNT 0x100490
+#define O_FPC_PORTRCV_PKT_CNT 0x100438
+#define TP_PRF_XMIT_DATA_OFFSET 0x200458
+#define TP_PRF_XMIT_PKTS_OFFSET 0x200400
+
+/* LCB counter offsets */
+#define O_LCB_ERR_INFO_OFFSET 0x308500
+#define O_LCB_STS_RX_CRC_FEC_MODE 0x3087A8
+#define O_LCB_STS_RX_LOGICAL_ID 0x3087B0
+#define O_LCB_PRF_OFFSET 0x308700
+
+#define BRG_PERF_OFFSET 0x34000
+#define BRG_PERF_END (BRG_PERF_OFFSET + 0xB8)
+#define BRG_ERR_OFFSET 0x36000
+#define BRG_ERR_END (BRG_ERR_OFFSET + 0x198)
+#define BRG_1_ERR_OFFSET (BRG_ERR_OFFSET + 0x200)
+#define BRG_1_ERR_END (BRG_ERR_OFFSET + 0x228)
+#define BRG_2_ERR_OFFSET (BRG_ERR_OFFSET + 0x300)
+#define BRG_2_ERR_END (BRG_ERR_OFFSET + 0x328)
+#define BRG_3_ERR_OFFSET (BRG_ERR_OFFSET + 0x400)
+#define BRG_3_ERR_END (BRG_ERR_OFFSET + 0x428)
+#define BRG_RTP_ERR_OFFSET (0x200000 + 0x1000)
+#define BRG_RTP_ERR_END (BRG_RTP_ERR_OFFSET + 0x28)
+#define BRG_RTP_STS_OFFSET (0x200000 + 0x2000)
+#define BRG_RTP_STS_START_1 (BRG_RTP_STS_OFFSET + 0x10)
+#define BRG_RTP_STS_END_1 (BRG_RTP_STS_OFFSET + 0x40)
+#define BRG_RTP_STS_START_2 (BRG_RTP_STS_OFFSET + 0x80)
+#define BRG_RTP_STS_END_2 (BRG_RTP_STS_OFFSET + 0xA0)
+#define TPM_ERR_START (0x100000 + 0x300)
+#define TPM_ERR_END (TPM_ERR_START + 0x108)
+#define TPM_ERR_MBE_START (0x100000 + 0x4A0)
+#define TPM_ERR_MBE_END (TPM_ERR_MBE_START + 0x88)
+#define TPM_PRF_START (0x100000 + 0x840)
+#define TPM_PRF_END (TPM_PRF_START + 0x108)
+
+#define RPM_OFFSET 0x180000
+#define RPM_INQ_ERR_OFFSET (RPM_OFFSET + 0x2000)
+#define RPM_INQ_STS_OFFSET (RPM_OFFSET + 0x2900)
+#define RPM_INQ_PRF_OFFSET (RPM_OFFSET + 0x2D00)
+
+#define RPM_PORT_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x100)
+#define RPM_PORT_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x7F8)
+
+#define RPM_INQ_PORT0_ERR_START (RPM_INQ_ERR_OFFSET)
+#define RPM_INQ_PORT0_ERR_END (RPM_INQ_ERR_OFFSET + 0x20)
+
+#define RPM_INQ_PORT1_ERR_START (RPM_INQ_ERR_OFFSET + 0x80)
+#define RPM_INQ_PORT1_ERR_END (RPM_INQ_ERR_OFFSET + 0xA0)
+
+#define RPM_INQ_PORT2_ERR_START (RPM_INQ_ERR_OFFSET + 0x100)
+#define RPM_INQ_PORT2_ERR_END (RPM_INQ_ERR_OFFSET + 0x120)
+
+#define RPM_INQ_PORT3_ERR_START (RPM_INQ_ERR_OFFSET + 0x180)
+#define RPM_INQ_PORT3_ERR_END (RPM_INQ_ERR_OFFSET + 0x1A0)
+
+#define RPM_INQ_PORT4_ERR_START (RPM_INQ_ERR_OFFSET + 0x200)
+#define RPM_INQ_PORT4_ERR_END (RPM_INQ_ERR_OFFSET + 0x220)
+
+#define RPM_INQ_PORT5_ERR_START (RPM_INQ_ERR_OFFSET + 0x280)
+#define RPM_INQ_PORT5_ERR_END (RPM_INQ_ERR_OFFSET + 0x2A0)
+
+#define RPM_INQ_PORT6_ERR_START (RPM_INQ_ERR_OFFSET + 0x300)
+#define RPM_INQ_PORT6_ERR_END (RPM_INQ_ERR_OFFSET + 0x320)
+
+#define RPM_INQ_PORT7_ERR_START (RPM_INQ_ERR_OFFSET + 0x380)
+#define RPM_INQ_PORT7_ERR_END (RPM_INQ_ERR_OFFSET + 0x3A0)
+
+#define RPM_INQ_FLSTOR_ERR_START (RPM_INQ_ERR_OFFSET + 0x400)
+#define RPM_INQ_FLSTOR_ERR_END (RPM_INQ_ERR_OFFSET + 0x420)
+
+#define RPM_PORT_STS_START (RPM_INQ_STS_OFFSET + 0x200)
+#define RPM_PORT_STS_END (RPM_INQ_STS_OFFSET + 0x2F8)
+
+#define RPM_SBE_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET)
+#define RPM_SBE_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x78)
+
+#define RPM_MBE_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x80)
+#define RPM_MBE_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0xF8)
+
+#define RPM_ARB_PERF_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x8C0)
+#define RPM_ARB_PERF_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x938)
+
+#define RPM_PERF_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x800)
+#define RPM_PERF_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x8B8)
+
+#define CRC_MODE GENMASK(1, 0)
+#define FEC_MODE GENMASK(5, 4)
+
+#define PEER_TX_ID_LN0 GENMASK(2, 0)
+#define PEER_TX_ID_LN1 GENMASK(6, 4)
+#define PEER_TX_ID_LN2 GENMASK(10, 8)
+#define PEER_TX_ID_LN3 GENMASK(14, 12)
+
+/* error csrs for sticky error reporting */
+#define O_FPC_ERR_STS                         0x100000
+#define O_FPC_ERR_CLR                         0x100008
+#define O_FPC_ERR_FIRST_HOST                  0x100020
+#define O_FPC_ERR_INFO_PORTRCV                0x100028
+#define O_FPC_ERR_INFO_PORTRCV_HDR0_A         0x100030
+#define O_FPC_ERR_INFO_PORTRCV_HDR0_B         0x100038
+#define O_FPC_ERR_INFO_PORTRCV_HDR1_A         0x100040
+#define O_FPC_ERR_INFO_PORTRCV_HDR1_B         0x100048
+#define O_FPC_ERR_INFO_FMCONFIG               0x100050
+#define O_FPC_ERR_INFO_FLOW_CTRL              0x100058
+#define O_FPC_ERR_INFO_UNCORRECTABLE          0x100060
+#define O_FPC_ERR_INFO_PORTRCVCONSTRAINT      0x100068
+#define O_RTP_ERR_STS                         0x141000
+#define O_RTP_ERR_CLR                         0x141008
+#define O_RTP_ERR_FIRST_HOST                  0x141020
+#define O_RTP_ERR_FIRST_INFO                  0x141028
+#define O_INQ_ERR_STS                         0x182000
+#define O_INQ_ERR_CLR                         0x182008
+#define O_INQ_ERR_EN_HOST                     0x182018
+#define O_INQ_ERR_FIRST_HOST                  0x182020
+#define O_TP_ERR_STS_0                        0x200180
+#define O_TP_ERR_CLR_0                        0x200188
+#define O_TP_ERR_EN_HOST_0                    0x200198
+#define O_TP_ERR_FIRST_HOST_0                 0x2001a0
+#define O_TP_ERR_STS_1                        0x200200
+#define O_TP_ERR_CLR_1                        0x200208
+#define O_TP_ERR_EN_HOST_1                    0x200218
+#define O_TP_ERR_FIRST_HOST_1                 0x200220
+#define O_TP_ERR_ERROR_INFO                   0x200230
+#define O_TP_ERR_PKEY_ERROR_INFO              0x200248
+#define O_TP_ERR_SBE_ERROR_CNT                0x200250
+#define O_TP_ERR_MBE_ERROR_CNT                0x200258
+#define O_TP_PE_ERROR_CNT                     0x200260
+#define O_8051_ERR_STS                        0x300100
+#define O_8051_ERR_CLR                        0x300108
+#define O_8051_FIRST_HOST                     0x300120
+#define O_LCB_ERR_STS                         0x308480
+#define O_LCB_ERR_CLR                         0x308488
+#define O_LCB_ERR_FIRST_HOST                  0x3084a0
+#define O_LCB_ERR_INFO_TOTAL_CRC_ERR          0x308500
+#define O_LCB_ERR_INFO_CRC_ERR_LN0            0x308508
+#define O_LCB_ERR_INFO_CRC_ERR_LN1            0x308510
+#define O_LCB_ERR_INFO_CRC_ERR_LN2            0x308518
+#define O_LCB_ERR_INFO_CRC_ERR_LN3            0x308520
+#define O_LCB_ERR_INFO_CRC_ERR_MULTI_LN       0x308528
+#define O_LCB_ERR_INFO_TX_REPLAY_CNT          0x308530
+#define O_LCB_ERR_INFO_RX_REPLAY_CNT          0x308538
+#define O_LCB_ERR_INFO_SEQ_CRC_CNT            0x308540
+#define O_LCB_ERR_INFO_ESCAPE_0_ONLY_CNT      0x308548
+#define O_LCB_ERR_INFO_ESCAPE_0_PLUS1_CNT     0x308550
+#define O_LCB_ERR_INFO_ESCAPE_0_PLUS2_CNT     0x308558
+#define O_LCB_ERR_INFO_REINIT_FROM_PEER_CNT   0x308560
+#define O_LCB_ERR_INFO_SBE_CNT                0x308568
+#define O_LCB_ERR_INFO_MISC_FLG_CNT           0x308570
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF          0x308578
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF_HGH      0x308580
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF_LOW      0x308588
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF         0x308590
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF_HGH     0x308598
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF_LOW     0x3085A0
+#define O_LCB_ERR_INFO_ECC_PM_TIME            0x3085A8
+#define O_LCB_ERR_INFO_ECC_PM_TIME_HGH        0x3085B0
+#define O_LCB_ERR_INFO_ECC_PM_TIME_LOW        0x3085B8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_1         0x3085C0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_2         0x3085C8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_3         0x3085D0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_4         0x3085D8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_5         0x3085E0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_6         0x3085E8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_7         0x3085F0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_8         0x3085F8
+#define O_LCB_ERR_INFO_FEC_UERR_CNT           0x308600
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_0        0x308608
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_1        0x308610
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_2        0x308618
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_3        0x308620
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_4        0x308628
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_VLD      0x308630
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_MISS_CNT 0x308638
+#define O_LCB_ERR_INFO_FEC_ERR_LN0            0x308640
+#define O_LCB_ERR_INFO_FEC_ERR_LN1            0x308648
+#define O_LCB_ERR_INFO_FEC_ERR_LN2            0x308650
+#define O_LCB_ERR_INFO_FEC_ERR_LN3            0x308658
+#define O_LCB_ERR_INFO_FX_RESYNC_CNT          0x308660
+#define O_BRG_CTX_ERR_STS                     0x036000
+#define O_BRG_CTX_ERR_CLR                     0x036008
+#define O_BRG_CTX_ERR_FIRST_HOST              0x036020
+#define O_BRG_CTX_ERR_FIRST_INFO              0x036028
+#define O_SRC_CTXT_SBE_CNT                    0x036040
+#define O_DST_CTXT_SBE_CNT                    0x036048
+#define O_SRC_CTXT_MBE_CNT                    0x036050
+#define O_DST_CTXT_MBE_CNT                    0x036058
+#define O_BRG_INCMD_PKTPAR_ERR                0x036060
+#define O_BRG_INPKT_POISON_SET                0x036068
+#define O_BRG_INRSP_PKTPAR_ERR                0x036070
+#define O_BRG_INDATA_PKTPAR_ERR               0x036078
+#define O_BRG_OUTPKT_POISON_SET               0x036080
+#define O_BRG_RPM_POISON_SET                  0x036088
+#define O_TPM_BRG_POISON_SET                  0x036090
+#define O_BRG_DROP_FABRIC_REQ                 0x036098
+#define O_BRG_DROP_MDFI_REQ                   0x0360a0
+#define O_BRG_DROP_FABRIC_RSP                 0x0360a8
+#define O_BRG_DROP_MDFI_RSP                   0x0360b0
+#define O_BRG_SRCCTXT_TO                      0x0360b8
+#define O_BRG_DSTCTXT_TO                      0x0360c0
+#define O_BRG_FIDMISS                         0x0360c8
+#define O_BRG_FIDMISS_INFO                    0x0360d0
+#define O_BRG_SRCCTXT_DUP_RSP                 0x0360d8
+#define O_BRG_SRCCTXT_DUP_RSPINFO             0x0360e0
+#define O_BRG_DSTCTXT_DUP_RSP                 0x0360e8
+#define O_BRG_DSTCTXT_DUP_RSPINFO             0x0360f0
+#define O_BRG_SFID_FILTER_DROP                0x0360f8
+#define O_BRG_0_ERR_STS                       0x036100
+#define O_BRG_0_ERR_CLR                       0x036108
+#define O_BRG_0_ERR_FIRST_HOST                0x036120
+#define O_BRG_0_ERR_FIRST_INFO                0x036128
+#define O_BRG_SBE_ADDR2FID_ERR                0x036130
+#define O_BRG_SBE_RSPARB_ERR                  0x036138
+#define O_BRG_SBE_EGRQ_ERR                    0x036140
+#define O_BRG_SBE_INGRQ_ERR                   0x036148
+#define O_BRG_SBE_TPMEGRQ_ERR                 0x036150
+#define O_BRG_SBE_TPMINGRQ_ERR                0x036158
+#define O_BRG_MBE_ADDR2FID_ERR                0x036160
+#define O_BRG_MBE_RSPARB_ERR                  0x036168
+#define O_BRG_MBE_EGRQ_ERR                    0x036170
+#define O_BRG_MBE_INGRQ_ERR                   0x036178
+#define O_BRG_MBE_TPMEGRQ_ERR                 0x036180
+#define O_BRG_MBE_TPMINGRQ_ERR                0x036188
+#define O_BRG_SBE_TPMDECAP_ERR                0x036190
+#define O_BRG_MBE_TPMDECAP_ERR                0x036198
+#define O_BRG_1_ERR_STS                       0x036200
+#define O_BRG_1_ERR_CLR                       0x036208
+#define O_BRG_1_ERR_FIRST_HOST                0x036220
+#define O_BRG_1_ERR_FIRST_INFO                0x036228
+#define O_BRG_2_ERR_STS                       0x036300
+#define O_BRG_2_ERR_CLR                       0x036308
+#define O_BRG_2_ERR_FIRST_HOST                0x036320
+#define O_BRG_2_ERR_FIRST_INFO                0x036328
+#define O_TPM_ERR_STS                         0x100300
+#define O_TPM_ERR_CLR                         0x100308
+#define O_TPM_ERR_FIRST_HOST                  0x100320
+#define O_TPM_ERR_RINFO_SBE_COUNT             0x100328
+#define O_TPM_ERR_RINFO_SBE_INFO              0x100330
+#define O_TPM_ERR_RINFO_MBE_COUNT             0x100338
+#define O_TPM_ERR_RINFO_MBE_INFO              0x100340
+#define O_TPM_ERR_QFLITDATA_SBE_COUNT         0x100348
+#define O_TPM_ERR_QFLITDATA_SBE_INFO          0x100350
+#define O_TPM_ERR_QFLITDATA_MBE_COUNT         0x100358
+#define O_TPM_ERR_QFLITDATA_MBE_INFO          0x100360
+#define O_TPM_ERR_RINFO_PE_COUNT              0x100368
+#define O_TPM_ERR_RINFO_PE_INFO               0x100370
+#define O_TPM_ERR_TAILLESS_PKT_CNT            0x100378
+#define O_TPM_ERR_RSVD_VL_CNT                 0x100380
+#define O_TPM_ERR_RSVD_VL_INFO                0x100388
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_0         0x100390
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_1         0x100398
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_2         0x1003a0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_3         0x1003a8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_4         0x1003b0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_5         0x1003b8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_6         0x1003c0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_7         0x1003c8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_8         0x1003d0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_9         0x1003d8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_10        0x1003e0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_11        0x1003e8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_12        0x1003f0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_13        0x1003f8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_14        0x100400
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_15        0x100408
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_0         0x1004a0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_1         0x1004a8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_2         0x1004b0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_3         0x1004b8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_4         0x1004c0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_5         0x1004c8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_6         0x1004d0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_7         0x1004d8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_8         0x1004e0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_9         0x1004e8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_10        0x1004f0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_11        0x1004f8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_12        0x100500
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_13        0x100508
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_14        0x100510
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_15        0x100518
+#define O_TPM_ERR_INQ_SBE_ERR_INFO            0x100520
+#define O_TPM_ERR_INQ_MBE_ERR_INFO            0x100528
+#define O_RPM_INQ_PORT0_ERR_STS               0x182000
+#define O_RPM_INQ_PORT0_ERR_CLR               0x182008
+#define O_RPM_INQ_PORT0_ERR_FIRST_HOST        0x182020
+#define O_RPM_INQ_PORT1_ERR_STS               0x182080
+#define O_RPM_INQ_PORT1_ERR_CLR               0x182088
+#define O_RPM_INQ_PORT1_ERR_FIRST_HOST        0x1820A0
+#define O_RPM_INQ_PORT2_ERR_STS               0x182100
+#define O_RPM_INQ_PORT2_ERR_CLR               0x182108
+#define O_RPM_INQ_PORT2_ERR_FIRST_HOST        0x182120
+#define O_RPM_INQ_PORT3_ERR_STS               0x182180
+#define O_RPM_INQ_PORT3_ERR_CLR               0x182188
+#define O_RPM_INQ_PORT3_ERR_FIRST_HOST        0x1821A0
+#define O_RPM_INQ_PORT4_ERR_STS               0x182200
+#define O_RPM_INQ_PORT4_ERR_CLR               0x182208
+#define O_RPM_INQ_PORT4_ERR_FIRST_HOST        0x182220
+#define O_RPM_INQ_PORT5_ERR_STS               0x182280
+#define O_RPM_INQ_PORT5_ERR_CLR               0x182288
+#define O_RPM_INQ_PORT5_ERR_FIRST_HOST        0x1822A0
+#define O_RPM_INQ_PORT6_ERR_STS               0x182300
+#define O_RPM_INQ_PORT6_ERR_CLR               0x182308
+#define O_RPM_INQ_PORT6_ERR_FIRST_HOST        0x182320
+#define O_RPM_INQ_PORT7_ERR_STS               0x182380
+#define O_RPM_INQ_PORT7_ERR_CLR               0x182388
+#define O_RPM_INQ_PORT7_ERR_FIRST_HOST        0x1823A0
+#define O_RPM_INQ_FLSTOR_ERR_STS              0x182400
+#define O_RPM_INQ_FLSTOR_ERR_CLR              0x182408
+#define O_RPM_INQ_FLSTOR_ERR_FIRST_HOST       0x182420
+#define O_BRG_RTP_ERR_STS                     0x201000
+#define O_BRG_RTP_ERR_CLR                     0x201008
+#define O_BRG_RTP_ERR_FIRST_HOST              0x201020
+#define O_BRG_RTP_ERR_FIRST_INFO              0x201028
+
+#endif /* IAF_CSR_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/debugfs.c b/drivers/gpu/drm/xe/fabric/debugfs.c
new file mode 100644
index 0000000000000..07919794ef4fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/debugfs.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2022 Intel Corporation.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+
+#include "debugfs.h"
+
+#define ROOT_NODE DRIVER_NAME
+
+#define FABRIC_ID_NODE_NAME "fabric_id"
+#define FABRIC_DPA_OFFSET "dpa_offset"
+#define FABRIC_DPA_SIZE "dpa_size"
+
+static struct dentry *root_node;
+static struct dentry *debugfs_fabric;
+static struct dentry *debugfs_dpa;
+
+struct dentry *get_debugfs_root_node(void)
+{
+	return root_node;
+}
+
+void print_diag(char *buf, size_t *buf_offset, size_t buf_size, const char *fmt,  ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	i = vscnprintf(buf + *buf_offset, buf_size - *buf_offset, fmt, args);
+	va_end(args);
+
+	*buf_offset += i;
+}
+
+/*
+ * This is a copy of the kernel's read_file_blob in fs/debugfs/file.c which is declared static.
+ * If it every was exported this could be removed and the kernel's function could be used instead.
+ */
+ssize_t blob_read(struct file *file, char __user *user_buffer, size_t count, loff_t *ppos)
+{
+	struct debugfs_blob_wrapper *blob = file->private_data;
+	struct dentry *dentry = F_DENTRY(file);
+	ssize_t ret;
+
+	ret = debugfs_file_get(dentry);
+	if (ret)
+		return ret;
+
+	ret = simple_read_from_buffer(user_buffer, count, ppos, blob->data, blob->size);
+
+	debugfs_file_put(dentry);
+
+	return ret;
+}
+
+int blob_release(struct inode *inode, struct file *file)
+{
+	kfree(file->private_data);
+
+	return 0;
+}
+
+void init_debugfs(struct fdev *dev)
+{
+	char name[128];
+	char dest[128];
+
+	dev->dir_node = debugfs_create_dir(dev_name(&dev->pdev->dev), root_node);
+
+	debugfs_create_x32(FABRIC_ID_NODE_NAME, 0400, dev->dir_node, &dev->fabric_id);
+	debugfs_create_x32(FABRIC_DPA_OFFSET, 0400, dev->dir_node, (u32 *)&dev->pd->dpa.pkg_offset);
+	debugfs_create_x16(FABRIC_DPA_SIZE, 0400, dev->dir_node, (u16 *)&dev->pd->dpa.pkg_size);
+
+	snprintf(dest, ARRAY_SIZE(dest), "../%s", dev_name(&dev->pdev->dev));
+
+	snprintf(name, ARRAY_SIZE(name), "0x%08x", dev->fabric_id);
+	dev->fabric_node = debugfs_create_symlink(name, debugfs_fabric, dest);
+
+	snprintf(name, ARRAY_SIZE(name), "0x%016llx-0x%016llx",
+		 (u64)dev->pd->dpa.pkg_offset * SZ_1G,
+		 (u64)dev->pd->dpa.pkg_offset * SZ_1G +
+		 (u64)dev->pd->dpa.pkg_size * SZ_1G - 1);
+	dev->dpa_node = debugfs_create_symlink(name, debugfs_dpa, dest);
+}
+
+void remove_debugfs(struct fdev *dev)
+{
+	/* clean up the "global" entries */
+	debugfs_remove(dev->fabric_node);
+	debugfs_remove(dev->dpa_node);
+
+	/* and now the device specific stuff */
+	debugfs_remove_recursive(dev->dir_node);
+}
+
+void create_debugfs_root_nodes(void)
+{
+	root_node = debugfs_create_dir(ROOT_NODE, NULL);
+	debugfs_fabric = debugfs_create_dir("fabric", root_node);
+	debugfs_dpa = debugfs_create_dir("dpa", root_node);
+}
+
+void remove_debugfs_root_nodes(void)
+{
+	debugfs_remove_recursive(root_node);
+}
diff --git a/drivers/gpu/drm/xe/fabric/debugfs.h b/drivers/gpu/drm/xe/fabric/debugfs.h
new file mode 100644
index 0000000000000..6227f0620fab0
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/debugfs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2022 Intel Corporation.
+ *
+ */
+
+#ifndef DEBUGFS_H_INCLUDED
+#define DEBUGFS_H_INCLUDED
+
+#include <linux/dcache.h>
+
+#include "iaf_drv.h"
+
+#define F_DENTRY(filp) ((filp)->f_path.dentry)
+
+__printf(4, 5)
+void print_diag(char *buf, size_t *buf_offset, size_t buf_size, const char *fmt, ...);
+struct dentry *get_debugfs_root_node(void);
+ssize_t blob_read(struct file *file, char __user *user_buffer, size_t count, loff_t *ppos);
+int blob_release(struct inode *inode, struct file *file);
+void init_debugfs(struct fdev *dev);
+void remove_debugfs(struct fdev *dev);
+void create_debugfs_root_nodes(void);
+void remove_debugfs_root_nodes(void);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/dev_diag.c b/drivers/gpu/drm/xe/fabric/dev_diag.c
new file mode 100644
index 0000000000000..35b8c99c258b6
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/dev_diag.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2022 Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/compiler.h>
+#include <linux/compiler_types.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/semaphore.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/stringify.h>
+#include <linux/timekeeping.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+
+#include "debugfs.h"
+#include "dev_diag.h"
+#include "fw.h"
+#include "io.h"
+#include "mbdb.h"
+#include "ops.h"
+#include "port.h"
+#include "routing_engine.h"
+#include "statedump.h"
+
+#define CAPABILITIES_FILE_NAME "capabilities"
+
+static int capabilities_open(struct inode *inode, struct file *file)
+{
+	/*
+	 * New strings are placed here along with the associated index into capabilities_index when
+	 * new capabilities are added
+	 */
+	static const char * const capabilities[] = { "serdes_margin2", "throughput" };
+	static const char *cap_fmt = "%s\n";
+	enum capabilities_index {
+		CAP_SERDES_MARGIN2,
+		CAP_THROUGHPUT,
+		CAPABILITIES_MAX,
+	};
+	struct fsubdev *sd = inode->i_private;
+	struct capabilities_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[0];
+	} *info;
+	size_t buf_offset;
+	size_t buf_size;
+	char *buf;
+	u8 i;
+
+	if (!sd)
+		return -EINVAL;
+
+	for (i = 0, buf_size = 0; i < CAPABILITIES_MAX; i++)
+		buf_size += strlen(capabilities[i]);
+
+	/* Add space for newlines and terminating NULL */
+	buf_size += i + 1;
+
+	info = kzalloc(sizeof(*info) + buf_size, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf = info->buf;
+	buf_offset = 0;
+
+	/* Check firmware for availability */
+	if (test_bit(MBOX_OP_CODE_SERDES_TX_DCC_MARGIN, sd->fw_version.supported_opcodes))
+		buf_offset += scnprintf(buf + buf_offset, buf_size, cap_fmt,
+					capabilities[CAP_SERDES_MARGIN2]);
+
+	buf_offset += scnprintf(buf + buf_offset, buf_size, cap_fmt, capabilities[CAP_THROUGHPUT]);
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations capabilities_fops = {
+	.owner = THIS_MODULE,
+	.open = capabilities_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define FW_VERSION_FILE_NAME "fw_version"
+#define FW_VERSION_BUF_SIZE 256
+
+static int fw_version_open(struct inode *inode, struct file *file)
+{
+	struct fsubdev *sd = inode->i_private;
+	struct mbdb_op_fw_version_rsp fw_version = {};
+	struct fw_version_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[FW_VERSION_BUF_SIZE];
+	} *info;
+	ssize_t element_count;
+	size_t buf_offset;
+	size_t buf_size;
+	char *buf;
+	int ret;
+
+	if (!sd)
+		return -EINVAL;
+
+	ret = ops_fw_version(sd, &fw_version);
+	if (ret == MBOX_RSP_STATUS_SEQ_NO_ERROR)
+		ret = ops_fw_version(sd, &fw_version);
+	if (ret)
+		return ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+
+	buf_offset = scnprintf(buf, buf_size, "MBox Version  : %d\n",
+			       fw_version.mbox_version);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"Environment   : %s%s\n",
+				(fw_version.environment & FW_VERSION_ENV_BIT)
+				? "run-time" : "bootloader",
+				(fw_version.environment & FW_VERSION_INIT_BIT)
+				? ", ready" : "");
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"FW Version    : %s\n",
+				fw_version.fw_version_string);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"OPs supported : 0x");
+
+	for (element_count = ARRAY_SIZE(fw_version.supported_opcodes) - 1;
+	     element_count >= 0; element_count--)
+		buf_offset +=
+			scnprintf(buf + buf_offset, buf_size - buf_offset,
+				  "%016lx",
+				  fw_version.supported_opcodes[element_count]);
+
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset, "\n");
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations fw_version_fops = {
+	.owner = THIS_MODULE,
+	.open = fw_version_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define SWITCHINFO_FILE_NAME "switchinfo"
+#define SWITCHINFO_BUF_SIZE 1024
+
+static int switchinfo_open(struct inode *inode, struct file *file)
+{
+	struct fsubdev *sd = inode->i_private;
+	struct mbdb_op_switchinfo switchinfo = {};
+	struct switchinfo_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[SWITCHINFO_BUF_SIZE];
+	} *info;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	int ret;
+
+	if (!sd)
+		return -EINVAL;
+
+	ret = ops_switchinfo_get(sd, &switchinfo);
+	if (ret)
+		return ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+
+	buf_offset = scnprintf(buf, buf_size, "IAF GUID               : 0x%0llx\n",
+			       switchinfo.guid);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"Num Ports              : %d\n",
+				switchinfo.num_ports);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"SLL                    : %ld\n",
+				switchinfo.slt_psc_ep0 &
+				SLT_PSC_EP0_SWITCH_LIFETIME);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"portStateChange        : %d\n",
+				(switchinfo.slt_psc_ep0 &
+				SLT_PSC_EP0_PORT_STATE_CHANGE) ? 1 : 0);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"enhancedPort0          : %d\n",
+				(switchinfo.slt_psc_ep0 &
+				SLT_PSC_EP0_ENHANCED_PORT_0) ? 1 : 0);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"routingModeSupported   : %d\n",
+				switchinfo.routing_mode_supported);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"routingModeEnabled     : %d\n",
+				switchinfo.routing_mode_enabled);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"lftTop                 : 0x%x\n",
+				switchinfo.lft_top);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"unalignedCount         : %d\n",
+				switchinfo.unaligned_cnt);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"unalignedPortWindow    : %d\n",
+				switchinfo.unaligned_portwin);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"unalignedVirtAddr      : 0x%x\n",
+				switchinfo.unaligned_vaddr);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"unalignedPC            : 0x%x\n",
+				switchinfo.unaligned_pc);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifDataErrorCount      : %d\n",
+				switchinfo.pif_data_error_cnt);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifDataErrorPortWindow : %d\n",
+				switchinfo.pif_data_error_portwin);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifDataErrorVirtAddr   : 0x%x\n",
+				switchinfo.pif_data_error_vaddr);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifDataErrorPC         : 0x%x\n",
+				switchinfo.pif_data_error_pc);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifAddrErrorCount      : %d\n",
+				switchinfo.pif_addr_error_cnt);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifAddrErrorPortWindow : %d\n",
+				switchinfo.pif_addr_error_portwin);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifAddrErrorVirtAddr   : 0x%x\n",
+				switchinfo.pif_addr_error_vaddr);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"pifAddrErrorPC         : 0x%x\n",
+				switchinfo.pif_addr_error_pc);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"memScrubSize           : %d\n",
+				switchinfo.mem_scrub_size);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"memScrubCount          : %d\n",
+				switchinfo.mem_scrub_count);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"vffScrubDisable        : %s\n",
+				switchinfo.vff_scrub_disable ? "yes" : "no");
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"vffScrubCount          : %d\n",
+				switchinfo.vff_scrub_count);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"rpipeScrubDisable      : %s\n",
+				switchinfo.rpipe_scrub_disable ? "yes" : "no");
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"rpipeScrubCount        : %d\n",
+				switchinfo.rpipe_scrub_count);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"mrtScrubCount          : %d\n",
+				switchinfo.mrt_scrub_count);
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"4opselScrubCount       : %d\n",
+				switchinfo.fouropsel_scrub_count);
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations switchinfo_fops = {
+	.owner = THIS_MODULE,
+	.open = switchinfo_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define RISC_RESET_FILE_NAME "risc_reset"
+#define RISC_NMI_FILE_NAME "risc_nmi"
+
+static ssize_t risc_reset_write(struct file *fp, const char __user *buf,
+				size_t count, loff_t *fpos)
+{
+	void __iomem *cport_init_ctrl_reg_addr;
+	u64 cport_init_ctrl_reg_val;
+	struct fsubdev *sd;
+
+	/* always absorb everything written */
+	*fpos += count;
+
+	sd = fp->private_data;
+
+	if (!sd)
+		return -EBADF;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	if (!mutex_trylock(&sd->cport_init_ctrl_reg_lock))
+		return -EAGAIN;
+
+	routing_sd_destroy(sd);
+
+	cport_init_ctrl_reg_addr = sd->csr_base + CPORT_INIT_CTRL_ADDR;
+	cport_init_ctrl_reg_val = readq(cport_init_ctrl_reg_addr);
+
+	cport_init_ctrl_reg_val |= RISC_RESET_BIT;
+	writeq(cport_init_ctrl_reg_val, cport_init_ctrl_reg_addr);
+
+	cport_init_ctrl_reg_val ^= RISC_RESET_BIT;
+	writeq(cport_init_ctrl_reg_val, cport_init_ctrl_reg_addr);
+
+	mutex_unlock(&sd->cport_init_ctrl_reg_lock);
+
+	sd_info(sd, "RISC RESET requested\n");
+
+	WRITE_ONCE(sd->fw_running, false);
+	mbdb_reinit(sd);
+
+	return count;
+}
+
+static const struct file_operations risc_reset_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = risc_reset_write
+};
+
+static ssize_t risc_nmi_read(struct file *fp, char __user *buf, size_t count,
+			     loff_t *fpos)
+{
+	void __iomem *cport_init_ctrl_reg_addr;
+	u64 cport_init_ctrl_reg_val;
+	struct fsubdev *sd;
+	char read_buf[10];
+	bool nmi_val;
+	size_t siz;
+
+	sd = fp->private_data;
+
+	if (!sd)
+		return -EBADF;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	if (!mutex_trylock(&sd->cport_init_ctrl_reg_lock))
+		return -EAGAIN;
+
+	cport_init_ctrl_reg_addr = sd->csr_base + CPORT_INIT_CTRL_ADDR;
+	cport_init_ctrl_reg_val = readq(cport_init_ctrl_reg_addr);
+	nmi_val = (bool)FIELD_GET(RISC_NMI_BIT, cport_init_ctrl_reg_val);
+
+	mutex_unlock(&sd->cport_init_ctrl_reg_lock);
+
+	siz = scnprintf(read_buf, sizeof(read_buf), "%.1u\n", nmi_val);
+
+	return simple_read_from_buffer(buf, count, fpos, read_buf, siz);
+}
+
+static ssize_t risc_nmi_write(struct file *fp, const char __user *buf,
+			      size_t count, loff_t *fpos)
+{
+	void __iomem *cport_init_ctrl_reg_addr;
+	u64 cport_init_ctrl_reg_val;
+	struct fsubdev *sd;
+	bool nmi_desired;
+	bool nmi_val;
+	int err;
+
+	sd = fp->private_data;
+	if (!sd)
+		return -EBADF;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	err = kstrtobool_from_user(buf, count, &nmi_desired);
+	if (err)
+		return err;
+
+	if (!mutex_trylock(&sd->cport_init_ctrl_reg_lock))
+		return -EAGAIN;
+
+	cport_init_ctrl_reg_addr = sd->csr_base + CPORT_INIT_CTRL_ADDR;
+	cport_init_ctrl_reg_val = readq(cport_init_ctrl_reg_addr);
+	nmi_val = (bool)FIELD_GET(RISC_NMI_BIT, cport_init_ctrl_reg_val);
+
+	if (nmi_val != nmi_desired) {
+		cport_init_ctrl_reg_val ^= RISC_NMI_BIT;
+		writeq(cport_init_ctrl_reg_val, cport_init_ctrl_reg_addr);
+	}
+
+	mutex_unlock(&sd->cport_init_ctrl_reg_lock);
+
+	*fpos += count;
+	return count;
+}
+
+static const struct file_operations risc_nmi_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = risc_nmi_read,
+	.write = risc_nmi_write
+};
+
+#define ASIC_REV_FILE_NAME "asic_rev"
+#define ASIC_REV_BUF_SIZE 256
+
+static int asic_rev_open(struct inode *inode, struct file *file)
+{
+	struct fsubdev *sd = inode->i_private;
+	struct asci_rev_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[ASIC_REV_BUF_SIZE];
+	} *info;
+	size_t buf_offset;
+	size_t buf_size;
+	char *buf;
+
+	if (!sd)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+
+	buf_offset = scnprintf(buf, buf_size, "Platform : 0x%04x\n",
+			       (int)FIELD_GET(MASK_ARI_PLATFORM, sd->asic_rev_info));
+	buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+				"Revision : 0x%02x\n",
+				(int)FIELD_GET(MASK_ARI_STEP, sd->asic_rev_info));
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations asic_rev_fops = {
+	.owner = THIS_MODULE,
+	.open = asic_rev_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+static const char * const mbdb_counter_names[] = {
+	"posted requests             : ",
+	"non posted requests         : ",
+	"timedout requests           : ",
+	"handled received requests   : ",
+	"unhandled received requests : ",
+	"non error responses         : ",
+	"error responses             : ",
+	"unmatched responses         : ",
+	"timedout responses          : ",
+	"retry responses             : ",
+	"outbound seqnum mismatches  : ",
+	"inbound seqnum mismatches   : ",
+};
+
+#define MAILBOX_COUNTERS_FILE_NAME "mailbox_counters"
+#define COUNTER_NAME_WIDTH 31
+#define MAX_U64_WIDTH 21
+
+#define MAILBOX_COUNTER_DISPLAY_BUF_SIZE ((COUNTER_NAME_WIDTH + MAX_U64_WIDTH) * MBDB_COUNTERS_MAX)
+
+static int mbdb_counters_open(struct inode *inode, struct file *file)
+{
+	struct fsubdev *sd = inode->i_private;
+	u64 *mailbox_counter_values;
+	struct mbdb_counters_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[MAILBOX_COUNTER_DISPLAY_BUF_SIZE];
+	} *info;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	enum mbdb_counters i;
+
+	if (!sd)
+		return -EINVAL;
+
+	mailbox_counter_values = mbdb_get_mailbox_counters(sd);
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+
+	for (buf_offset = 0, i = MBDB_COUNTERS_FIRST; i < MBDB_COUNTERS_MAX; i++)
+		buf_offset += scnprintf(buf + buf_offset, buf_size - buf_offset,
+					"%s%llu\n", mbdb_counter_names[i],
+					mailbox_counter_values[i]);
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations mbdb_counter_fops = {
+	.owner = THIS_MODULE,
+	.open = mbdb_counters_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+/*
+ * LinkMgr Trace data
+ *
+ */
+#define LM_MAGIC 0x4d4c4453
+#define LM_VERSION 1
+#define DUMP_VERSION GENMASK(31, 0)
+#define DUMP_MAGIC GENMASK(63, 32)
+
+struct linkmgr_trace_hdr {
+	__be64 magic;
+	ktime_t timestamp;
+	u8 fw_version_string[24];
+};
+
+#define LINKMGR_TRACE_HDR_SIZE sizeof(struct linkmgr_trace_hdr)
+#define LINKMGR_TRACE_MAX_BUF_SIZE (40 * 1024)
+#define LINKMGR_TRACE_FILE_NAME "linkmgr_trace"
+
+static int linkmgr_trace_open(struct inode *inode, struct file *file)
+{
+	struct linkmgr_trace_info {
+		struct debugfs_blob_wrapper blob;
+		struct mbdb_op_linkmgr_trace_dump_rsp rsp;
+		char buf[LINKMGR_TRACE_MAX_BUF_SIZE + LINKMGR_TRACE_HDR_SIZE];
+	} *info;
+	struct fsubdev *sd = inode->i_private;
+
+	struct linkmgr_trace_hdr *hdr;
+	size_t buf_offset = LINKMGR_TRACE_HDR_SIZE;
+	bool first = true;
+	int err;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	if (!(sd->fw_version.environment & FW_VERSION_ENV_BIT))
+		return -EIO;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	hdr = (struct linkmgr_trace_hdr *)info->buf;
+	hdr->magic = cpu_to_be64(FIELD_PREP(DUMP_VERSION, LM_VERSION) |
+				 FIELD_PREP(DUMP_MAGIC, LM_MAGIC));
+	strncpy(hdr->fw_version_string, sd->fw_version.fw_version_string,
+		sizeof(hdr->fw_version_string));
+
+	hdr->timestamp = ktime_get_real();
+
+	do {
+		size_t len;
+
+		err = ops_linkmgr_trace_dump(sd, MAX_TRACE_ENTRIES, first, &info->rsp);
+		if (err) {
+			kfree(info);
+			return err;
+		}
+
+		/*
+		 * minimum of max size of entries, the count or whatever is
+		 * left of the buffer.
+		 */
+		len = min3(sizeof(info->rsp.entries),
+			   info->rsp.cnt * sizeof(u64),
+			   sizeof(info->buf) - buf_offset);
+		if (len) {
+			memcpy(&info->buf[buf_offset], &info->rsp.entries, len);
+			buf_offset += len;
+		}
+		first = false;
+	} while (info->rsp.more);
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations linkmgr_trace_fops = {
+	.owner = THIS_MODULE,
+	.open = linkmgr_trace_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define LINKMGR_TRACE_MASK_FILE_NAME "linkmgr_trace_mask"
+
+static ssize_t linkmgr_trace_mask_read(struct file *fp, char __user *buf, size_t count,
+				       loff_t *fpos)
+{
+	struct fsubdev *sd;
+	char read_buf[20];
+	u64 mask = 0;
+	size_t siz;
+	int err;
+
+	sd = fp->private_data;
+	if (!sd)
+		return -EBADF;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	err = ops_linkmgr_trace_mask_get(sd, &mask);
+
+	if (err)
+		return err;
+
+	siz = scnprintf(read_buf, sizeof(read_buf), "%-18llx\n", mask);
+
+	return simple_read_from_buffer(buf, count, fpos, read_buf, siz);
+}
+
+static ssize_t linkmgr_trace_mask_write(struct file *fp, const char __user *buf,
+					size_t count, loff_t *fpos)
+{
+	struct fsubdev *sd;
+	u64 mask = 0;
+	int err;
+
+	sd = fp->private_data;
+	if (!sd)
+		return -EBADF;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	err = kstrtoull_from_user(buf, count, 16, &mask);
+	if (err)
+		return err;
+
+	err = ops_linkmgr_trace_mask_set(sd, mask);
+
+	if (err)
+		return err;
+
+	*fpos += count;
+	return count;
+}
+
+static const struct file_operations linkmgr_trace_mask_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = linkmgr_trace_mask_read,
+	.write = linkmgr_trace_mask_write
+};
+
+void create_optional_dev_debugfs_files(struct fsubdev *sd)
+{
+	if (test_bit(MBOX_OP_CODE_LINK_MGR_TRACE_DUMP, sd->fw_version.supported_opcodes))
+		debugfs_create_file(LINKMGR_TRACE_FILE_NAME, 0400, sd->debugfs_dir, sd,
+				    &linkmgr_trace_fops);
+	if (test_bit(MBOX_OP_CODE_LINK_MGR_TRACE_MASK_GET, sd->fw_version.supported_opcodes) &&
+	    test_bit(MBOX_OP_CODE_LINK_MGR_TRACE_MASK_SET, sd->fw_version.supported_opcodes))
+		debugfs_create_file(LINKMGR_TRACE_MASK_FILE_NAME, 0600, sd->debugfs_dir, sd,
+				    &linkmgr_trace_mask_fops);
+}
+
+void create_dev_debugfs_dir(struct fsubdev *sd)
+{
+	struct dentry *debugfs_dir = debugfs_create_dir(sd->name, sd->fdev->dir_node);
+	/*
+	 * currently works in all startup modes, could be conditioned here by
+	 * setting sd->debugfs_dir = ERR_PTR(-ENODEV) instead
+	 */
+	sd->debugfs_dir = debugfs_dir;
+
+	debugfs_create_file(FW_VERSION_FILE_NAME, 0400, debugfs_dir, sd, &fw_version_fops);
+	debugfs_create_file(SWITCHINFO_FILE_NAME, 0400, debugfs_dir, sd, &switchinfo_fops);
+	debugfs_create_file(RISC_RESET_FILE_NAME, 0200, debugfs_dir, sd, &risc_reset_fops);
+	debugfs_create_file(RISC_NMI_FILE_NAME, 0644, debugfs_dir, sd, &risc_nmi_fops);
+	debugfs_create_file(ASIC_REV_FILE_NAME, 0400, debugfs_dir, sd, &asic_rev_fops);
+	debugfs_create_file(MAILBOX_COUNTERS_FILE_NAME, 0400, debugfs_dir, sd, &mbdb_counter_fops);
+	debugfs_create_file(CAPABILITIES_FILE_NAME, 0400, debugfs_dir, sd, &capabilities_fops);
+
+	statedump_node_init(sd);
+}
diff --git a/drivers/gpu/drm/xe/fabric/dev_diag.h b/drivers/gpu/drm/xe/fabric/dev_diag.h
new file mode 100644
index 0000000000000..f42aea854c6d2
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/dev_diag.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2022 Intel Corporation.
+ *
+ */
+
+#ifndef DEV_DIAG_H_INCLUDED
+#define DEV_DIAG_H_INCLUDED
+
+#include "iaf_drv.h"
+
+void create_optional_dev_debugfs_files(struct fsubdev *sd);
+void create_dev_debugfs_dir(struct fsubdev *sd);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/error.c b/drivers/gpu/drm/xe/fabric/error.c
new file mode 100644
index 0000000000000..9e1637dae756d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/error.c
@@ -0,0 +1,1490 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ *
+ */
+
+#include "error.h"
+#include "ops.h"
+
+/* sequences multi-line log output between devices */
+static DEFINE_MUTEX(report_lock);
+
+/*
+ * "error info" registers are generally asociated with a corresponding error
+ * status register, offering more detail.  these are undefined when the status
+ * register does not indicate a status that enables the info register.
+ *
+ * use this flag-set to track whether the triggering condition for each
+ * info register has been met or not, and consume this during reporting
+ * to omit these unless they've been armed by their preconditions.
+ */
+struct register_armed {
+	u8 fpc_err_info_portrcv:1;
+	u8 fpc_err_info_fmconfig:1;
+	u8 fpc_err_info_flow_ctrl:1;
+	u8 fpc_err_info_uncorrectable:1;
+	u8 fpc_err_info_portrcvconstraint:1;
+	u8 rtp_err_first_info:1;
+	u8 tp_err_error_info:1;
+	u8 tp_err_pkey_error_info:1;
+	u8 brg_ctx_err_first_info:1;
+	u8 brg_fidmiss_info:1;
+	u8 brg_srcctxt_dup_rspinfo:1;
+	u8 brg_dstctxt_dup_rspinfo:1;
+	u8 brg_0_err_first_info:1;
+	u8 brg_1_err_first_info:1;
+	u8 brg_2_err_first_info:1;
+	u8 tpm_err_rinfo_sbe_info:1;
+	u8 tpm_err_rinfo_mbe_info:1;
+	u8 tpm_err_qflitdata_sbe_info:1;
+	u8 tpm_err_qflitdata_mbe_info:1;
+	u8 tpm_err_rinfo_pe_info:1;
+	u8 tpm_err_rsvd_vl_info:1;
+	u8 tpm_err_inq_sbe_err_info:1;
+	u8 tpm_err_inq_mbe_err_info:1;
+	u8 brg_rtp_err_first_info:1;
+};
+
+/*
+ * define a error register in the query set, including metadata about
+ * how to clear this register.
+ */
+struct error_reg {
+	const char *name;
+	u32 offset;
+	u32 clear_offset;
+	u64 clear_value;
+};
+
+/* these INQ status bits can NOT be cleared while INQ is not in reset */
+#define MASK_INQ_ERR_STS_PKT_NO_TAIL         BIT_ULL(35)
+#define MASK_INQ_ERR_STS_PRE_READER_OVERFLOW BIT_ULL(28)
+#define MASK_INQ_ERR_STS_USED_POINTER_RF_MBE BIT_ULL(26)
+#define MASK_INQ_ERR_STS_FREE_POINTER_RF_MBE BIT_ULL(24)
+#define MASK_INQ_ERR_STS_FREE_PTR_NOT_AVAIL  BIT_ULL(16)
+
+#define MASK_INQ_ERR_CLR_EXEMPT (\
+	MASK_INQ_ERR_STS_PKT_NO_TAIL         | \
+	MASK_INQ_ERR_STS_PRE_READER_OVERFLOW | \
+	MASK_INQ_ERR_STS_USED_POINTER_RF_MBE | \
+	MASK_INQ_ERR_STS_FREE_POINTER_RF_MBE | \
+	MASK_INQ_ERR_STS_FREE_PTR_NOT_AVAIL)
+
+/*
+ * define a register with "write 1 to clear" semantics, which requires an
+ * associated clear register (which may or may not be the register itself)
+ * and a write mask.
+ */
+#define MK_REG_W1C(name, clr_name, clr_mask) {#name, (name), (clr_name), (clr_mask)}
+
+/*
+ * define a register with "write 0 to clear" semantics, which simply
+ * directly writes 0 to the register itself.
+ */
+#define MK_REG_W0C(name) {#name, (name), (name), (0ull)}
+
+static const struct mbdb_op_csr_range s_fabric_query_ranges[] = {
+	{O_FPC_ERR_STS,                   1},
+	{O_FPC_ERR_FIRST_HOST,           10},
+	{O_RTP_ERR_STS,                   1},
+	{O_RTP_ERR_FIRST_HOST,            2},
+	{O_INQ_ERR_STS,                   1},
+	{O_INQ_ERR_FIRST_HOST,            1},
+	{O_TP_ERR_STS_0,                  1},
+	{O_TP_ERR_FIRST_HOST_0,           1},
+	{O_TP_ERR_STS_1,                  1},
+	{O_TP_ERR_FIRST_HOST_1,           1},
+	{O_TP_ERR_ERROR_INFO,             1},
+	{O_TP_ERR_PKEY_ERROR_INFO,        4},
+	{O_8051_ERR_STS,                  1},
+	{O_8051_FIRST_HOST,               1},
+	{O_LCB_ERR_STS,                   1},
+	{O_LCB_ERR_FIRST_HOST,            1},
+	{O_LCB_ERR_INFO_SBE_CNT,         11},
+};
+
+static const struct error_reg s_fabric_regs[] = {
+	MK_REG_W1C(O_FPC_ERR_STS,
+		   O_FPC_ERR_CLR,
+		   GENMASK_ULL(55, 0)),
+	MK_REG_W0C(O_FPC_ERR_FIRST_HOST),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCV),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCV_HDR0_A),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCV_HDR0_B),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCV_HDR1_A),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCV_HDR1_B),
+	MK_REG_W0C(O_FPC_ERR_INFO_FMCONFIG),
+	MK_REG_W0C(O_FPC_ERR_INFO_FLOW_CTRL),
+	MK_REG_W0C(O_FPC_ERR_INFO_UNCORRECTABLE),
+	MK_REG_W0C(O_FPC_ERR_INFO_PORTRCVCONSTRAINT),
+	MK_REG_W1C(O_RTP_ERR_STS,
+		   O_RTP_ERR_CLR,
+		   GENMASK_ULL(31, 0)),
+	MK_REG_W0C(O_RTP_ERR_FIRST_HOST),
+	MK_REG_W0C(O_RTP_ERR_FIRST_INFO),
+	MK_REG_W1C(O_INQ_ERR_STS,
+		   O_INQ_ERR_CLR,
+		   GENMASK_ULL(52, 0) & ~MASK_INQ_ERR_CLR_EXEMPT),
+	MK_REG_W0C(O_INQ_ERR_FIRST_HOST),
+	MK_REG_W1C(O_TP_ERR_STS_0,
+		   O_TP_ERR_CLR_0,
+		   GENMASK_ULL(23, 0)),
+	MK_REG_W0C(O_TP_ERR_FIRST_HOST_0),
+	MK_REG_W1C(O_TP_ERR_STS_1,
+		   O_TP_ERR_CLR_1,
+		   GENMASK_ULL(44, 0)),
+	MK_REG_W0C(O_TP_ERR_FIRST_HOST_1),
+	MK_REG_W0C(O_TP_ERR_ERROR_INFO),
+	MK_REG_W0C(O_TP_ERR_PKEY_ERROR_INFO),
+	MK_REG_W0C(O_TP_ERR_SBE_ERROR_CNT),
+	MK_REG_W0C(O_TP_ERR_MBE_ERROR_CNT),
+	MK_REG_W0C(O_TP_PE_ERROR_CNT),
+	MK_REG_W1C(O_8051_ERR_STS,
+		   O_8051_ERR_CLR,
+		   GENMASK_ULL(8, 0)),
+	MK_REG_W0C(O_8051_FIRST_HOST),
+	MK_REG_W1C(O_LCB_ERR_STS,
+		   O_LCB_ERR_CLR,
+		   GENMASK_ULL(32, 0)),
+	MK_REG_W0C(O_LCB_ERR_FIRST_HOST),
+	MK_REG_W0C(O_LCB_ERR_INFO_SBE_CNT),
+	MK_REG_W0C(O_LCB_ERR_INFO_MISC_FLG_CNT),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_INPUT_BUF),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_INPUT_BUF_HGH),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_INPUT_BUF_LOW),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_REPLAY_BUF),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_REPLAY_BUF_HGH),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_REPLAY_BUF_LOW),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_PM_TIME),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_PM_TIME_HGH),
+	MK_REG_W0C(O_LCB_ERR_INFO_ECC_PM_TIME_LOW),
+};
+
+struct fabric_port_status_rsp {
+	DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(rsp, ARRAY_SIZE(s_fabric_regs));
+};
+
+static const struct mbdb_op_csr_range s_bridge_query_ranges[] = {
+	{O_BRG_CTX_ERR_STS,                  1},
+	{O_BRG_CTX_ERR_FIRST_HOST,           2},
+	{O_SRC_CTXT_SBE_CNT,                24},
+	{O_BRG_0_ERR_STS,                    1},
+	{O_BRG_0_ERR_FIRST_HOST,            16},
+	{O_BRG_1_ERR_STS,                    1},
+	{O_BRG_1_ERR_FIRST_HOST,             2},
+	{O_BRG_2_ERR_STS,                    1},
+	{O_BRG_2_ERR_FIRST_HOST,             2},
+	{O_TPM_ERR_STS,                      1},
+	{O_TPM_ERR_FIRST_HOST,              14},
+	{O_TPM_ERR_STORG_SBE_ERR_CNT_0,     16},
+	{O_TPM_ERR_STORG_MBE_ERR_CNT_0,     16},
+	{O_TPM_ERR_INQ_SBE_ERR_INFO,         2},
+	{O_RPM_INQ_PORT0_ERR_STS,            1},
+	{O_RPM_INQ_PORT0_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT1_ERR_STS,            1},
+	{O_RPM_INQ_PORT1_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT2_ERR_STS,            1},
+	{O_RPM_INQ_PORT2_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT3_ERR_STS,            1},
+	{O_RPM_INQ_PORT3_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT4_ERR_STS,            1},
+	{O_RPM_INQ_PORT4_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT5_ERR_STS,            1},
+	{O_RPM_INQ_PORT5_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT6_ERR_STS,            1},
+	{O_RPM_INQ_PORT6_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_PORT7_ERR_STS,            1},
+	{O_RPM_INQ_PORT7_ERR_FIRST_HOST,     1},
+	{O_RPM_INQ_FLSTOR_ERR_STS,           1},
+	{O_RPM_INQ_FLSTOR_ERR_FIRST_HOST,    1},
+	{O_BRG_RTP_ERR_STS,                  1},
+	{O_BRG_RTP_ERR_FIRST_HOST,           2}
+};
+
+static const struct error_reg s_bridge_regs[] = {
+	MK_REG_W1C(O_BRG_CTX_ERR_STS,
+		   O_BRG_CTX_ERR_CLR,
+		   GENMASK_ULL(17, 0)),
+	MK_REG_W0C(O_BRG_CTX_ERR_FIRST_HOST),
+	MK_REG_W0C(O_BRG_CTX_ERR_FIRST_INFO),
+	MK_REG_W1C(O_SRC_CTXT_SBE_CNT,
+		   O_SRC_CTXT_SBE_CNT,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_DST_CTXT_SBE_CNT,
+		   O_DST_CTXT_SBE_CNT,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_SRC_CTXT_MBE_CNT,
+		   O_SRC_CTXT_MBE_CNT,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_DST_CTXT_MBE_CNT,
+		   O_DST_CTXT_MBE_CNT,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_INCMD_PKTPAR_ERR,
+		   O_BRG_INCMD_PKTPAR_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_INPKT_POISON_SET,
+		   O_BRG_INPKT_POISON_SET,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_INRSP_PKTPAR_ERR,
+		   O_BRG_INRSP_PKTPAR_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_INDATA_PKTPAR_ERR,
+		   O_BRG_INDATA_PKTPAR_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_OUTPKT_POISON_SET,
+		   O_BRG_OUTPKT_POISON_SET,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_RPM_POISON_SET,
+		   O_BRG_RPM_POISON_SET,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_TPM_BRG_POISON_SET,
+		   O_TPM_BRG_POISON_SET,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_DROP_FABRIC_REQ,
+		   O_BRG_DROP_FABRIC_REQ,
+		   GENMASK_ULL(47, 0)),
+	MK_REG_W1C(O_BRG_DROP_MDFI_REQ,
+		   O_BRG_DROP_MDFI_REQ,
+		   GENMASK_ULL(47, 0)),
+	MK_REG_W1C(O_BRG_DROP_FABRIC_RSP,
+		   O_BRG_DROP_FABRIC_RSP,
+		   GENMASK_ULL(47, 0)),
+	MK_REG_W1C(O_BRG_DROP_MDFI_RSP,
+		   O_BRG_DROP_MDFI_RSP,
+		   GENMASK_ULL(47, 0)),
+	MK_REG_W1C(O_BRG_SRCCTXT_TO,
+		   O_BRG_SRCCTXT_TO,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_DSTCTXT_TO,
+		   O_BRG_DSTCTXT_TO,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_FIDMISS,
+		   O_BRG_FIDMISS,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W0C(O_BRG_FIDMISS_INFO),
+	MK_REG_W1C(O_BRG_SRCCTXT_DUP_RSP,
+		   O_BRG_SRCCTXT_DUP_RSP,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W0C(O_BRG_SRCCTXT_DUP_RSPINFO),
+	MK_REG_W1C(O_BRG_DSTCTXT_DUP_RSP,
+		   O_BRG_DSTCTXT_DUP_RSP,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W0C(O_BRG_DSTCTXT_DUP_RSPINFO),
+	MK_REG_W1C(O_BRG_SFID_FILTER_DROP,
+		   O_BRG_SFID_FILTER_DROP,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_0_ERR_STS,
+		   O_BRG_0_ERR_CLR,
+		   GENMASK_ULL(63, 0)),
+	MK_REG_W0C(O_BRG_0_ERR_FIRST_HOST),
+	MK_REG_W0C(O_BRG_0_ERR_FIRST_INFO),
+	MK_REG_W1C(O_BRG_SBE_ADDR2FID_ERR,
+		   O_BRG_SBE_ADDR2FID_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_RSPARB_ERR,
+		   O_BRG_SBE_RSPARB_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_EGRQ_ERR,
+		   O_BRG_SBE_EGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_INGRQ_ERR,
+		   O_BRG_SBE_INGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_TPMEGRQ_ERR,
+		   O_BRG_SBE_TPMEGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_TPMINGRQ_ERR,
+		   O_BRG_SBE_TPMINGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_ADDR2FID_ERR,
+		   O_BRG_MBE_ADDR2FID_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_RSPARB_ERR,
+		   O_BRG_MBE_RSPARB_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_EGRQ_ERR,
+		   O_BRG_MBE_EGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_INGRQ_ERR,
+		   O_BRG_MBE_INGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_TPMEGRQ_ERR,
+		   O_BRG_MBE_TPMEGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_TPMINGRQ_ERR,
+		   O_BRG_MBE_TPMINGRQ_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_SBE_TPMDECAP_ERR,
+		   O_BRG_SBE_TPMDECAP_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_MBE_TPMDECAP_ERR,
+		   O_BRG_MBE_TPMDECAP_ERR,
+		   GENMASK_ULL(15, 0)),
+	MK_REG_W1C(O_BRG_1_ERR_STS,
+		   O_BRG_1_ERR_CLR,
+		   GENMASK_ULL(63, 0)),
+	MK_REG_W0C(O_BRG_1_ERR_FIRST_HOST),
+	MK_REG_W0C(O_BRG_1_ERR_FIRST_INFO),
+	MK_REG_W1C(O_BRG_2_ERR_STS,
+		   O_BRG_2_ERR_CLR,
+		   GENMASK_ULL(63, 0)),
+	MK_REG_W0C(O_BRG_2_ERR_FIRST_HOST),
+	MK_REG_W0C(O_BRG_2_ERR_FIRST_INFO),
+	MK_REG_W1C(O_TPM_ERR_STS,
+		   O_TPM_ERR_CLR,
+		   GENMASK_ULL(47, 0)),
+	MK_REG_W0C(O_TPM_ERR_FIRST_HOST),
+	MK_REG_W0C(O_TPM_ERR_RINFO_SBE_COUNT),
+	MK_REG_W0C(O_TPM_ERR_RINFO_SBE_INFO),
+	MK_REG_W0C(O_TPM_ERR_RINFO_MBE_COUNT),
+	MK_REG_W0C(O_TPM_ERR_RINFO_MBE_INFO),
+	MK_REG_W0C(O_TPM_ERR_QFLITDATA_SBE_COUNT),
+	MK_REG_W0C(O_TPM_ERR_QFLITDATA_SBE_INFO),
+	MK_REG_W0C(O_TPM_ERR_QFLITDATA_MBE_COUNT),
+	MK_REG_W0C(O_TPM_ERR_QFLITDATA_MBE_INFO),
+	MK_REG_W0C(O_TPM_ERR_RINFO_PE_COUNT),
+	MK_REG_W0C(O_TPM_ERR_RINFO_PE_INFO),
+	MK_REG_W0C(O_TPM_ERR_TAILLESS_PKT_CNT),
+	MK_REG_W0C(O_TPM_ERR_RSVD_VL_CNT),
+	MK_REG_W0C(O_TPM_ERR_RSVD_VL_INFO),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_0),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_1),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_2),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_3),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_4),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_5),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_6),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_7),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_8),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_9),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_10),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_11),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_12),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_13),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_14),
+	MK_REG_W0C(O_TPM_ERR_STORG_SBE_ERR_CNT_15),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_0),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_1),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_2),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_3),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_4),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_5),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_6),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_7),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_8),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_9),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_10),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_11),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_12),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_13),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_14),
+	MK_REG_W0C(O_TPM_ERR_STORG_MBE_ERR_CNT_15),
+	MK_REG_W0C(O_TPM_ERR_INQ_SBE_ERR_INFO),
+	MK_REG_W0C(O_TPM_ERR_INQ_MBE_ERR_INFO),
+	MK_REG_W1C(O_RPM_INQ_PORT0_ERR_STS,
+		   O_RPM_INQ_PORT0_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT0_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT1_ERR_STS,
+		   O_RPM_INQ_PORT1_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT1_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT2_ERR_STS,
+		   O_RPM_INQ_PORT2_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT2_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT3_ERR_STS,
+		   O_RPM_INQ_PORT3_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT3_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT4_ERR_STS,
+		   O_RPM_INQ_PORT4_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT4_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT5_ERR_STS,
+		   O_RPM_INQ_PORT5_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT5_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT6_ERR_STS,
+		   O_RPM_INQ_PORT6_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT6_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_PORT7_ERR_STS,
+		   O_RPM_INQ_PORT7_ERR_CLR,
+		   GENMASK_ULL(27, 0)),
+	MK_REG_W0C(O_RPM_INQ_PORT7_ERR_FIRST_HOST),
+	MK_REG_W1C(O_RPM_INQ_FLSTOR_ERR_STS,
+		   O_RPM_INQ_FLSTOR_ERR_CLR,
+		   GENMASK_ULL(31, 0)),
+	MK_REG_W0C(O_RPM_INQ_FLSTOR_ERR_FIRST_HOST),
+	MK_REG_W1C(O_BRG_RTP_ERR_STS,
+		   O_BRG_RTP_ERR_CLR,
+		   GENMASK_ULL(31, 0)),
+	MK_REG_W0C(O_BRG_RTP_ERR_FIRST_HOST),
+	MK_REG_W0C(O_BRG_RTP_ERR_FIRST_INFO),
+};
+
+struct bridge_port_status_rsp {
+	DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(rsp, ARRAY_SIZE(s_bridge_regs));
+};
+
+/* clear helper macros */
+#undef MK_REG_W0C
+#undef MK_REG_W1C
+
+static int clear_errors(struct fport *port, const u64 *errors,
+			const struct error_reg *regs, size_t len)
+{
+	size_t i;
+	int err;
+
+	for (i = 0; i < len; ++i) {
+		const struct error_reg *entry = regs + i;
+
+		/* only clear non-zero error registers */
+		if (!errors[i])
+			continue;
+
+		err = ops_linkmgr_port_csr_wr(port->sd, port->lpn, entry->clear_offset,
+					      &entry->clear_value, 8, false);
+		if (err) {
+			fport_err(port, "failed to clear offset 0x%08x: %d\n", entry->offset, err);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static int read_fabric_errors(struct fport *port, struct mbdb_op_port_status_get_rsp *rsp)
+{
+	int err;
+
+	err = ops_port_status_get(port->sd, port->lpn, ARRAY_SIZE(s_fabric_query_ranges),
+				  s_fabric_query_ranges, rsp);
+	if (err) {
+		fport_err(port, "failed to get port status: %d\n", err);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int read_bridge_errors(struct fport *port, struct mbdb_op_port_status_get_rsp *rsp)
+{
+	int err;
+
+	err = ops_port_status_get(port->sd, port->lpn, ARRAY_SIZE(s_bridge_query_ranges),
+				  s_bridge_query_ranges, rsp);
+	if (err) {
+		fport_err(port, "failed to get port status: %d\n", err);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/*
+ * Implement a set of DSL macros to simplify the error specifications.
+ * Closure over the port and error value for retaining clarity.
+ * Local use only.  Undef them afterward.
+ */
+
+/* report a single-bit named flag */
+#define REPORT_FLAG(bit, desc) \
+	do { \
+		if (error & BIT_ULL(bit)) \
+			fport_info(port, "sticky hw error:  flag: %s\n", (desc)); \
+	} while (0) \
+
+/* report a masked subfield as an integer value */
+#define REPORT_VALUE(mask, desc) \
+	do { \
+		u64 __tmp = FIELD_GET((mask), error); \
+		\
+		if (__tmp) \
+			fport_info(port, "sticky hw error:  field: %s: 0x%llx (%llu)\n", \
+				   (desc), __tmp, __tmp); \
+	} while (0)
+
+/* report a masked subfield as an enumeration */
+#define REPORT_ENUM(mask, value, name, desc) \
+	do { \
+		if (FIELD_GET((mask), error) == (value)) \
+			fport_info(port, "sticky hw error:  field: %s: %s\n", \
+				   (name), (desc)); \
+	} while (0)
+
+static void report_fabric_error(struct fport *port, u32 csr, u64 error)
+{
+	switch (csr) {
+	case O_FPC_ERR_STS:
+	case O_FPC_ERR_FIRST_HOST:
+		REPORT_FLAG(55, "rvcport_err");
+		REPORT_FLAG(54, "fmconfig_err");
+		REPORT_FLAG(53, "uncorrectable_err");
+		REPORT_FLAG(52, "portconstraint_err");
+		REPORT_FLAG(38, "ltp_buf_ovflow");
+		REPORT_FLAG(37, "ltp_buf_unflow");
+		REPORT_FLAG(35, "late_long_err");
+		REPORT_FLAG(34, "late_short_err");
+		REPORT_FLAG(31, "length_mtu_err");
+		REPORT_FLAG(30, "dlid_zero_err");
+		REPORT_FLAG(29, "slid_zero_err");
+		REPORT_FLAG(28, "perm_nvl15_err");
+		REPORT_FLAG(26, "pkt_length_err");
+		REPORT_FLAG(25, "vl15_multi_err");
+		REPORT_FLAG(24, "nonvl15_state_err");
+		REPORT_FLAG(23, "head_dist_err");
+		REPORT_FLAG(22, "tail_dist_err");
+		REPORT_FLAG(21, "ctrl_dist_err");
+		REPORT_FLAG(20, "mkr_dist_err");
+		REPORT_FLAG(19, "link_err");
+		REPORT_FLAG(18, "event_cntr_rollover_err");
+		REPORT_FLAG(17, "mbe_inbound");
+		REPORT_FLAG(16, "crdt_sb_parity_err");
+		REPORT_FLAG(15, "unsup_pkt_type");
+		REPORT_FLAG(14, "crdt_ack_err");
+		REPORT_FLAG(13, "mbe_outbound");
+		REPORT_FLAG(8,  "unsup_vl_err");
+		REPORT_FLAG(7,  "sc_mkr_err");
+		REPORT_FLAG(6,  "l2hdr_err");
+		REPORT_FLAG(5,  "preemt_same_vl_err");
+		REPORT_FLAG(4,  "pkey_err");
+		REPORT_FLAG(3,  "headless_err");
+		REPORT_FLAG(2,  "sc_err");
+		REPORT_FLAG(1,  "l2_err");
+		break;
+	case O_FPC_ERR_INFO_PORTRCV:
+		REPORT_ENUM(GENMASK_ULL(7, 0), 14, "e_code", "PreemptL2Header");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 13, "e_code", "BadSC (marker)");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 12, "e_code", "PreemptVL15");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 11, "e_code", "PreemptError");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  9, "e_code", "Headless");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  7, "e_code", "BadSC (unsupported)");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  6, "e_code", "BadL2");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  5, "e_code", "BadDLID");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  4, "e_code", "BadSLID");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  3, "e_code", "PktLenTooShort");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  2, "e_code", "PktLenTooLong");
+		REPORT_ENUM(GENMASK_ULL(7, 0),  1, "e_code", "BadPktLen");
+		break;
+	case O_FPC_ERR_INFO_FMCONFIG:
+		REPORT_VALUE(GENMASK_ULL(14, 11), "vl");
+		REPORT_VALUE(GENMASK_ULL(10,  8), "distance");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 8, "e_code", "BadMarkerDist");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 7, "e_code", "ExceedMulticastLimit");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 6, "e_code", "BadCtrlFlit");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 5, "e_code", "BadPreempt");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 4, "e_code", "UnsupportedVL");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 3, "e_code", "BadCrdtAck");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 2, "e_code", "BadCtrlDist");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 1, "e_code", "BadTailDist");
+		REPORT_ENUM(GENMASK_ULL(7, 0), 0, "e_code", "BadHeadDist");
+		break;
+	case O_FPC_ERR_INFO_UNCORRECTABLE:
+		REPORT_ENUM(GENMASK_ULL(3, 0), 4, "e_code", "Internal");
+		REPORT_ENUM(GENMASK_ULL(3, 0), 3, "e_code", "BadCtrl");
+		REPORT_ENUM(GENMASK_ULL(3, 0), 2, "e_code", "BadTail");
+		REPORT_ENUM(GENMASK_ULL(3, 0), 1, "e_code", "BadBody");
+		REPORT_ENUM(GENMASK_ULL(3, 0), 0, "e_code", "BadHead");
+		break;
+	case O_FPC_ERR_INFO_PORTRCVCONSTRAINT:
+		REPORT_VALUE(GENMASK_ULL(47, 24), "slid");
+		REPORT_VALUE(GENMASK_ULL(23, 8),  "pkey");
+		REPORT_ENUM(GENMASK_ULL(1, 0), 3, "e_code", "SwitchPort0PkeyViolation");
+		REPORT_ENUM(GENMASK_ULL(1, 0), 2, "e_code", "SlidSecurityViolation");
+		REPORT_ENUM(GENMASK_ULL(1, 0), 1, "e_code", "PkeyViolation");
+		break;
+	case O_RTP_ERR_STS:
+	case O_RTP_ERR_FIRST_HOST:
+	case O_BRG_RTP_ERR_STS:
+	case O_BRG_RTP_ERR_FIRST_HOST:
+		REPORT_FLAG(31,                   "cport_dos_err_lweg_redir");
+		REPORT_FLAG(30,                   "csr_rd_miss");
+		REPORT_FLAG(29,                   "csr_wr_miss");
+		REPORT_VALUE(GENMASK_ULL(28, 27), "tcam_parity_err");
+		REPORT_FLAG(26,                   "loop_pkt_err");
+		REPORT_FLAG(25,                   "zero_valid_oports_err");
+		REPORT_FLAG(24,                   "adaptive_cport_err");
+		REPORT_FLAG(23,                   "deterministic_gt1_err");
+		REPORT_FLAG(22,                   "cport_dos_err");
+		REPORT_VALUE(GENMASK_ULL(21, 16), "urt_top_err");
+		REPORT_FLAG(15,                   "dlid_top_err");
+		REPORT_FLAG(14,                   "mlid_top_err");
+		REPORT_FLAG(13,                   "op4sel_mbe");
+		REPORT_FLAG(12,                   "op4sel_sbe");
+		REPORT_VALUE(GENMASK_ULL(11,  6), "urt_mbe");
+		REPORT_VALUE(GENMASK_ULL(5,   0), "urt_sbe");
+		break;
+	case O_RTP_ERR_FIRST_INFO:
+	case O_BRG_RTP_ERR_FIRST_INFO:
+		REPORT_VALUE(GENMASK_ULL(63, 62), "l2_pkt");
+		REPORT_FLAG(61,                   "mcast");
+		REPORT_FLAG(60,                   "tcam_hit");
+		REPORT_VALUE(GENMASK_ULL(59, 56), "vlr");
+		REPORT_VALUE(GENMASK_ULL(55, 53), "rc");
+		REPORT_VALUE(GENMASK_ULL(52, 48), "sc");
+		REPORT_VALUE(GENMASK_ULL(47, 24), "dlid");
+		REPORT_VALUE(GENMASK_ULL(23,  0), "slid");
+		break;
+	case O_INQ_ERR_STS:
+	case O_INQ_ERR_FIRST_HOST:
+		REPORT_FLAG(52, "magic_fifo_ovrfl");
+		REPORT_FLAG(51, "blks_available_ovrfl");
+		REPORT_FLAG(50, "invalid_decode_vlf");
+		REPORT_FLAG(48, "qflits_used_cnt_vl_ovrfl");
+		REPORT_FLAG(47, "qflits_used_cnt_ovrfl");
+		REPORT_FLAG(45, "mc_data_fifo_ovrfl");
+		REPORT_FLAG(44, "mc_fifo_err");
+		REPORT_FLAG(43, "pkt_data_flit3_mbe");
+		REPORT_FLAG(42, "pkt_data_flit3_sbe");
+		REPORT_FLAG(41, "pkt_data_flit2_mbe");
+		REPORT_FLAG(40, "pkt_data_flit2_sbe");
+		REPORT_FLAG(39, "unexp_tail_err");
+		REPORT_FLAG(38, "unexp_head_err");
+		REPORT_FLAG(37, "mbe_active_vl");
+		REPORT_FLAG(36, "mbe_inactive_vl");
+		REPORT_FLAG(35, "pkt_no_tail");
+		REPORT_FLAG(32, "vlr_out_of_range");
+		REPORT_FLAG(30, "perf_perr");
+		REPORT_FLAG(29, "perf_rollover");
+		REPORT_FLAG(28, "pre_reader_overflow");
+		REPORT_FLAG(27, "init_ram_complete");
+		REPORT_FLAG(26, "used_pointer_rf_mbe");
+		REPORT_FLAG(25, "used_pointer_rf_sbe");
+		REPORT_FLAG(24, "free_pointer_rf_mbe");
+		REPORT_FLAG(23, "free_pointer_rf_sbe");
+		REPORT_FLAG(22, "sideband_storage_rf_mbe");
+		REPORT_FLAG(21, "sideband_storage_rf_sbe");
+		REPORT_FLAG(20, "pkt_data_flit1_mbe");
+		REPORT_FLAG(19, "pkt_data_flit1_sbe");
+		REPORT_FLAG(18, "pkt_data_flit0_mbe");
+		REPORT_FLAG(17, "pkt_data_flit0_sbe");
+		REPORT_FLAG(16, "free_ptr_not_avail");
+		REPORT_FLAG(15, "rb_credit_err_col_7");
+		REPORT_FLAG(14, "rb_credit_err_col_6");
+		REPORT_FLAG(13, "rb_credit_err_col_5");
+		REPORT_FLAG(12, "rb_credit_err_col_4");
+		REPORT_FLAG(11, "rb_credit_err_col_3");
+		REPORT_FLAG(10, "rb_credit_err_col_2");
+		REPORT_FLAG(9,  "rb_credit_err_col_1");
+		REPORT_FLAG(8,  "rb_credit_err_col_0");
+		REPORT_FLAG(7,  "sc_tbl_perr_on_csr_rd");
+		REPORT_FLAG(6,  "sc15_err");
+		REPORT_FLAG(5,  "cp_dos_drop");
+		REPORT_FLAG(4,  "sc_tbl_perr");
+		REPORT_FLAG(3,  "rowbus_perr");
+		REPORT_FLAG(2,  "invalid_oport_err");
+		REPORT_FLAG(1,  "invalid_mc_err");
+		REPORT_FLAG(0,  "epoch_to_err");
+		break;
+	case O_TP_ERR_STS_0:
+	case O_TP_ERR_FIRST_HOST_0:
+		REPORT_VALUE(GENMASK_ULL(23, 14), "vlp_sc_error");
+		REPORT_FLAG(13,                   "congested");
+		REPORT_FLAG(12,                   "l2_error");
+		REPORT_FLAG(11,                   "invalid_vlt");
+		REPORT_FLAG(10,                   "vlt_error");
+		REPORT_FLAG(9,                    "mtu_error");
+		REPORT_FLAG(8,                    "drop_data_pkt");
+		REPORT_FLAG(7,                    "headless_pkt");
+		REPORT_FLAG(6,                    "tailless_pkt");
+		REPORT_FLAG(5,                    "short_grh_pkt");
+		REPORT_FLAG(4,                    "long_pkt");
+		REPORT_FLAG(3,                    "short_pkt");
+		REPORT_FLAG(2,                    "subsw_pkt_ebp");
+		REPORT_FLAG(1,                    "tport_pkt_ebp");
+		REPORT_FLAG(0,                    "pkey_discard");
+		break;
+	case O_TP_ERR_STS_1:
+	case O_TP_ERR_FIRST_HOST_1:
+		REPORT_FLAG(44,                   "crdt_misc_ctrl_err");
+		REPORT_FLAG(43,                   "crdt_rtrn_par_err");
+		REPORT_FLAG(42,                   "crdt_rtrn_illegal_vl");
+		REPORT_FLAG(41,                   "perf_cntr_rollover");
+		REPORT_FLAG(40,                   "perf_cntr_perr");
+		REPORT_VALUE(GENMASK_ULL(39, 30), "sll_timeout");
+		REPORT_VALUE(GENMASK_ULL(29, 20), "hoq_discard");
+		REPORT_FLAG(19,                   "oc_credit_underflow");
+		REPORT_FLAG(18,                   "credit_overflow");
+		REPORT_FLAG(17,                   "csr_addr_err");
+		REPORT_FLAG(16,                   "dataq_spill_overflow");
+		REPORT_FLAG(15,                   "dataq_spill_underflow");
+		REPORT_FLAG(14,                   "dataq_underflow");
+		REPORT_FLAG(13,                   "dataq_underflow");
+		REPORT_FLAG(12,                   "rinfoq_spill_overflow");
+		REPORT_FLAG(11,                   "rinfoq_spill_underflow");
+		REPORT_FLAG(10,                   "rinfoq_spill_mbe");
+		REPORT_FLAG(9,                    "rinfoq_spill_sbe");
+		REPORT_FLAG(8,                    "rinfoq_overflow");
+		REPORT_FLAG(7,                    "rinfoq_underflow");
+		REPORT_FLAG(6,                    "rinfoq_pe");
+		REPORT_FLAG(5,                    "rinfoq_mbe");
+		REPORT_FLAG(4,                    "rinfoq_sbe");
+		REPORT_FLAG(3,                    "subsw_pe");
+		REPORT_FLAG(2,                    "subsw_mbe");
+		REPORT_FLAG(1,                    "subsw_sbe");
+		REPORT_FLAG(0,                    "request_to");
+		break;
+	case O_TP_ERR_ERROR_INFO:
+		REPORT_VALUE(GENMASK_ULL(59, 50), "cb3_error_vl");
+		REPORT_FLAG(49,                   "cb3_data_error");
+		REPORT_FLAG(48,                   "cb3_pkt_error");
+		REPORT_VALUE(GENMASK_ULL(43, 34), "cb2_error_vl");
+		REPORT_FLAG(33,                   "cb2_data_error");
+		REPORT_FLAG(32,                   "cb2_pkt_error");
+		REPORT_VALUE(GENMASK_ULL(27, 18), "cb1_error_vl");
+		REPORT_FLAG(17,                   "cb1_data_error");
+		REPORT_FLAG(16,                   "cb1_pkt_error");
+		REPORT_VALUE(GENMASK_ULL(11,  2), "cb0_error_vl");
+		REPORT_FLAG(1,                    "cb0_data_error");
+		REPORT_FLAG(0,                    "cb0_pkt_error");
+		break;
+	case O_TP_ERR_PKEY_ERROR_INFO:
+		REPORT_VALUE(GENMASK_ULL(35, 20), "tx_first_pkey");
+		REPORT_VALUE(GENMASK_ULL(19,  0), "tx_first_slid");
+		break;
+	case O_TP_ERR_SBE_ERROR_CNT:
+	case O_TP_ERR_MBE_ERROR_CNT:
+		REPORT_VALUE(GENMASK_ULL(23, 16), "synd");
+		REPORT_VALUE(GENMASK_ULL(15,  0), "count");
+		break;
+	case O_TP_PE_ERROR_CNT:
+		REPORT_VALUE(GENMASK_ULL(15,  0), "count");
+		break;
+	case O_8051_ERR_STS:
+	case O_8051_FIRST_HOST:
+		REPORT_FLAG(8, "unmatched_secure_msg_across_bcc_lanes");
+		REPORT_FLAG(7, "iram_sbe");
+		REPORT_FLAG(6, "iram_mbe");
+		REPORT_FLAG(5, "dram_sbe");
+		REPORT_FLAG(4, "dram_mbe");
+		REPORT_FLAG(3, "cram_sbe");
+		REPORT_FLAG(2, "cram_mbe");
+		REPORT_FLAG(1, "lost8051_heart_beat");
+		REPORT_FLAG(0, "set_by_8051");
+		break;
+	case O_LCB_ERR_STS:
+	case O_LCB_ERR_FIRST_HOST:
+		REPORT_FLAG(32, "fec_err_cnt_hit_limit");
+		REPORT_FLAG(31, "pm_sbe");
+		REPORT_FLAG(30, "pm_mbe");
+		REPORT_FLAG(29, "csr_cport_address_miss");
+		REPORT_FLAG(28, "csr_chain_parity_err");
+		REPORT_FLAG(27, "quarantine");
+		REPORT_FLAG(26, "unexpected_master_time_flit");
+		REPORT_FLAG(25, "neg_edge_link_transfer_active");
+		REPORT_FLAG(24, "hold_reinit");
+		REPORT_FLAG(23, "rst_for_incomplt_rnd_trip");
+		REPORT_FLAG(22, "rst_for_link_timeout");
+		REPORT_FLAG(21, "replay_buf_sbe");
+		REPORT_FLAG(20, "replay_buf_mbe");
+		REPORT_FLAG(19, "flit_input_buf_sbe");
+		REPORT_FLAG(18, "flit_input_buf_mbe");
+		REPORT_FLAG(17, "vl_ack_input_wrong_crc_mode");
+		REPORT_FLAG(16, "vl_ack_input_parity_err");
+		REPORT_FLAG(15, "vl_ack_input_buf_oflw");
+		REPORT_FLAG(14, "flit_input_buf_oflw");
+		REPORT_FLAG(13, "illegal_flit_encoding");
+		REPORT_FLAG(12, "illegal_null_ltp");
+		REPORT_FLAG(11, "unexpected_round_trip_marker");
+		REPORT_FLAG(10, "unexpected_replay_marker");
+		REPORT_FLAG(9,  "rclk_stopped");
+		REPORT_FLAG(8,  "crc_err_cnt_hit_limit");
+		REPORT_FLAG(7,  "reinit_for_ln_degrade");
+		REPORT_FLAG(6,  "reinit_from_peer");
+		REPORT_FLAG(5,  "seq_crc_err");
+		REPORT_FLAG(4,  "rx_less_than_four_lns");
+		REPORT_FLAG(3,  "tx_less_than_four_lns");
+		REPORT_FLAG(2,  "lost_reinit_stall_or_tos");
+		REPORT_FLAG(1,  "all_lns_failed_reinit_test");
+		REPORT_FLAG(0,  "rst_for_failed_deskew");
+		break;
+	case O_LCB_ERR_INFO_SBE_CNT:
+		REPORT_VALUE(GENMASK_ULL(39, 32), "pm_time_flits");
+		REPORT_VALUE(GENMASK_ULL(31, 24), "replay_buffer_side");
+		REPORT_VALUE(GENMASK_ULL(23, 16), "replay_buffer1");
+		REPORT_VALUE(GENMASK_ULL(15,  8), "replay_buffer0");
+		REPORT_VALUE(GENMASK_ULL(7,   0), "input_buffer");
+		break;
+	case O_LCB_ERR_INFO_MISC_FLG_CNT:
+		REPORT_VALUE(GENMASK_ULL(31, 24), "rst_for_incomplt_rnd_trip");
+		REPORT_VALUE(GENMASK_ULL(23, 16), "rst_for_link_timeout");
+		REPORT_VALUE(GENMASK_ULL(15,  8), "all_lns_failed_reinit_test");
+		REPORT_VALUE(GENMASK_ULL(7,   0), "rst_for_failed_deskew");
+		break;
+	case O_LCB_ERR_INFO_ECC_INPUT_BUF:
+		REPORT_FLAG(20,                     "csr_created");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 0, "location", "mbe in flit_0");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1, "location", "mbe in flit_1");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 2, "location", "mbe in flit_2");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 3, "location", "mbe in flit_3");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 4, "location", "sbe in flit_0");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 5, "location", "sbe in flit_1");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 6, "location", "sbe in flit_2");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 7, "location", "sbe in flit_3");
+		REPORT_VALUE(GENMASK_ULL(15, 8),    "syndrome");
+		REPORT_VALUE(GENMASK_ULL(7,  0),    "chk");
+		break;
+	case O_LCB_ERR_INFO_ECC_REPLAY_BUF:
+		REPORT_FLAG(24,                      "csr_created");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  0, "location", "mbe ram 0 flit_0");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  1, "location", "mbe ram 0 flit_1");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  2, "location", "mbe ram 0 flit_2");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  3, "location", "mbe ram 0 flit_3");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  4, "location", "mbe ram 1 flit_0");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  5, "location", "mbe ram 1 flit_1");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  6, "location", "mbe ram 1 flit_2");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  7, "location", "mbe ram 1 flit_3");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  8, "location", "sbe ram 0 flit_0");
+		REPORT_ENUM(GENMASK_ULL(20, 16),  9, "location", "sbe ram 0 flit_1");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 10, "location", "sbe ram 0 flit_2");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 11, "location", "sbe ram 0 flit_3");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 12, "location", "sbe ram 1 flit_0");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 13, "location", "sbe ram 1 flit_1");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 14, "location", "sbe ram 1 flit_2");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 15, "location", "sbe ram 1 flit_3");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 16, "location", "mbe side");
+		REPORT_ENUM(GENMASK_ULL(20, 16), 17, "location", "sbe side");
+		REPORT_VALUE(GENMASK_ULL(15, 8),     "syndrome");
+		REPORT_VALUE(GENMASK_ULL(7,  0),     "chk");
+		break;
+	case O_LCB_ERR_INFO_ECC_PM_TIME:
+		REPORT_FLAG(24,                          "csr_created");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 0, "location", "flit 0 sbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 1, "location", "flit 0 mbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 2, "location", "flit 1 sbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 3, "location", "flit 1 mbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 4, "location", "flit 2 sbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 5, "location", "flit 2 mbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 6, "location", "flit 3 sbe");
+		REPORT_ENUM(GENMASK_ULL(23, 16), 1 << 7, "location", "flit 3 mbe");
+		REPORT_VALUE(GENMASK_ULL(15, 8),         "syndrome");
+		REPORT_VALUE(GENMASK_ULL(7,  0),         "chk");
+		break;
+	}
+}
+
+static void report_bridge_error(struct fport *port, u32 csr, u64 error)
+{
+	switch (csr) {
+	case O_BRG_CTX_ERR_STS:
+	case O_BRG_CTX_ERR_FIRST_HOST:
+		REPORT_FLAG(17, "dst_ctxt_timeout");
+		REPORT_FLAG(16, "dst_fl_mem_mbe");
+		REPORT_FLAG(15, "dst_fl_mem_sbe");
+		REPORT_FLAG(14, "dst_tmr_mem_mbe");
+		REPORT_FLAG(13, "dst_tmr_mem_sbe");
+		REPORT_FLAG(12, "dst_ctxt_mem_mbe");
+		REPORT_FLAG(11, "dst_ctxt_mem_sbe");
+		REPORT_FLAG(10, "dst_fl_underflow");
+		REPORT_FLAG(9,  "dst_fl_overflow");
+		REPORT_FLAG(8,  "src_ctxt_timeout");
+		REPORT_FLAG(7,  "src_fl_mem_mbe");
+		REPORT_FLAG(6,  "src_fl_mem_sbe");
+		REPORT_FLAG(5,  "src_tmr_mem_mbe");
+		REPORT_FLAG(4,  "src_tmr_mem_sbe");
+		REPORT_FLAG(3,  "src_ctxt_mem_mbe");
+		REPORT_FLAG(2,  "src_ctxt_mem_sbe");
+		REPORT_FLAG(1,  "src_fl_underflow");
+		REPORT_FLAG(0,  "src_fl_overflow");
+		break;
+	case O_BRG_CTX_ERR_FIRST_INFO:
+		REPORT_VALUE(GENMASK_ULL(63, 56), "context mem output syndrome");
+		REPORT_VALUE(GENMASK_ULL(55, 51), "timer mem output ecc");
+		REPORT_VALUE(GENMASK_ULL(50, 46), "timer mem output syndrome");
+		REPORT_VALUE(GENMASK_ULL(45, 40), "fl mem output ecc");
+		REPORT_VALUE(GENMASK_ULL(39, 34), "fl mem output syndrome");
+		REPORT_VALUE(GENMASK_ULL(33, 27), "context mem outpu tecc");
+		REPORT_VALUE(GENMASK_ULL(26, 20), "context mem output syndrome");
+		REPORT_VALUE(GENMASK_ULL(19, 15), "timer mem output ecc");
+		REPORT_VALUE(GENMASK_ULL(14, 10), "timer mem output syndrome");
+		REPORT_VALUE(GENMASK_ULL(9,   5), "fl mem output ecc");
+		REPORT_VALUE(GENMASK_ULL(4,   0), "fl mem output syndrome");
+		break;
+	case O_BRG_0_ERR_STS:
+	case O_BRG_0_ERR_FIRST_HOST:
+	case O_BRG_1_ERR_STS:
+	case O_BRG_1_ERR_FIRST_HOST:
+	case O_BRG_2_ERR_STS:
+	case O_BRG_2_ERR_FIRST_HOST:
+		REPORT_FLAG(63, "brg_tpm_egrq_ctxs_cmp_overflow");
+		REPORT_FLAG(62, "brg_tpm_egrq_rddata_overflow");
+		REPORT_FLAG(61, "brg_tpm_egrq_cmp_overflow");
+		REPORT_FLAG(60, "brg_tpm_egrq_nhcmd_overflow");
+		REPORT_FLAG(59, "brg_tpm_egrq_hcmd_oveflow");
+		REPORT_FLAG(58, "brg_egrq_lnep_wrcmp_overflow");
+		REPORT_FLAG(57, "brg_egrq_lnep_rddata_overflow");
+		REPORT_FLAG(56, "brg_egrq_lnep_h_wrdata_overflow");
+		REPORT_FLAG(55, "brg_egrq_lnep_nh_wrdata_overflow");
+		REPORT_FLAG(54, "brg_egrq_lnep_h_cmd_overflow");
+		REPORT_FLAG(53, "brg_egrq_lnep_nh_cmd_overflow");
+		REPORT_FLAG(52, "brg_egrq_lnep_ctxd_cmp_overflow");
+		REPORT_FLAG(51, "brg_egrq_lnep_ctxd_rr_overflow");
+		REPORT_FLAG(50, "brg_egrq_lnep_wrcmp_egr_overflow");
+		REPORT_FLAG(49, "brg_egrq_lnep_rddata_egr_overflow");
+		REPORT_FLAG(48, "brg_egrq_lnep_hegr_uport_overflow");
+		REPORT_FLAG(47, "brg_egrq_lnep_nhegr_uport_overflow");
+		REPORT_FLAG(46, "brg_egrq_lnep_hegr_fid_overflow");
+		REPORT_FLAG(45, "brg_egrq_lnep_nhegr_fid_overflow");
+		REPORT_FLAG(44, "brg_egrq_lnep_h_egrdata2nd_overflow");
+		REPORT_FLAG(43, "brg_egrq_lnep_nh_egrdata2nd_overflow");
+		REPORT_FLAG(42, "brg_egrq_lnep_h_egrdata_overflow");
+		REPORT_FLAG(41, "brg_egrq_lnep_nh_egrdata_overflow");
+		REPORT_FLAG(40, "brg_egrq_lnep_h_egrcmd_overflow");
+		REPORT_FLAG(39, "brg_egrq_lnep_nh_egrcmd_overflow");
+		REPORT_FLAG(38, "brg_tpm_egrq_rdata_sbe");
+		REPORT_FLAG(37, "brg_tpm_egrq_nhdata2_jbe");
+		REPORT_FLAG(36, "brg_tpm_egrq_hdata2_sbe");
+		REPORT_FLAG(35, "brg_tpm_egrq_nhdata_sbe");
+		REPORT_FLAG(34, "brg_tpm_egrq_hdata_sbe");
+		REPORT_FLAG(33, "brg_tpm_egrq_nhcmd_sbe");
+		REPORT_FLAG(32, "brg_tpm_egrq_hcmd_sbe");
+		REPORT_FLAG(31, "brg_tpm_egrq_cmp_sbe");
+		REPORT_FLAG(30, "brg_tpm_egrq_ctxs_rdata_to_sbe");
+		REPORT_FLAG(29, "brg_tpm_egrq_ctxs_to_sbe");
+		REPORT_FLAG(28, "brg_tpm_egrq_ctxs_rdata_sbe");
+		REPORT_FLAG(27, "brg_tpm_egrq_tcmp_sbe");
+		REPORT_FLAG(26, "brg_tpm_egrq_rdata_sbe");
+		REPORT_FLAG(25, "brg_tpm_egrq_tcmpctx_sbe");
+		REPORT_FLAG(24, "brg_tpm_egrq_nhcmd_sbe");
+		REPORT_FLAG(23, "brg_tpm_egrq_hcmd_sbe");
+		REPORT_FLAG(22, "brg_ingrq_cmpfifo_sbe");
+		REPORT_FLAG(21, "brg_ingrq_rdatafifo_sbe");
+		REPORT_FLAG(20, "brg_ingrq_h_datafifo_sbe");
+		REPORT_FLAG(19, "brg_ingrq_nh_datafifo_sbe");
+		REPORT_FLAG(18, "brg_ingrq_h_cmdfifo_sbe");
+		REPORT_FLAG(17, "brg_ingrq_nh_cmdfifo_sbe");
+		REPORT_FLAG(16, "brg_egrq_ctxd_cmp_sbe");
+		REPORT_FLAG(15, "brg_egrq_ctxd_rr_sbe");
+		REPORT_FLAG(14, "brg_egrq_cmp_mem_sbe");
+		REPORT_FLAG(13, "brg_egrq_rr_mem_sbe");
+		REPORT_FLAG(12, "brg_egrq_h_urt_sbe");
+		REPORT_FLAG(11, "brg_egrq_nh_urt_sbe");
+		REPORT_FLAG(10, "brg_egrq_h_fid_sbe");
+		REPORT_FLAG(9,  "brg_egrq_nh_fid_sbe");
+		REPORT_FLAG(8,  "brg_egrq_nh_data2_sbe");
+		REPORT_FLAG(7,  "brg_egrq_h_data2_sbe");
+		REPORT_FLAG(6,  "brg_egrq_nh_data_sbe");
+		REPORT_FLAG(5,  "brg_egrq_h_data_sbe");
+		REPORT_FLAG(4,  "brg_egrq_nh_cmd_sbe");
+		REPORT_FLAG(3,  "brg_egrq_h_cmd_sbe");
+		REPORT_FLAG(2,  "ctxd_rsparb_cmp_sbe");
+		REPORT_FLAG(1,  "ctxd_rsparb_rr_sbe");
+		REPORT_FLAG(0,  "addr2fid_sbe");
+		break;
+	case O_TPM_ERR_STS:
+	case O_TPM_ERR_FIRST_HOST:
+		REPORT_FLAG(47,                  "control_flit_except_idle_received");
+		REPORT_FLAG(46,                  "routeinfo_head_not_received");
+		REPORT_FLAG(45,                  "async_credit_fifo_ovflw_sync");
+		REPORT_FLAG(44,                  "async_data_fifo_ovflw");
+		REPORT_FLAG(43,                  "shallow_fifo_full_96b");
+		REPORT_FLAG(42,                  "shallow_fifo_full_24b");
+		REPORT_FLAG(41,                  "shallow_fifo_full_16b");
+		REPORT_VALUE(GENMASK_ULL(40, 9), "flit_stor_err_sts");
+		REPORT_FLAG(8,                   "address_allocation_err");
+		REPORT_FLAG(7,                   "invalid_vl_err");
+		REPORT_FLAG(6,                   "routeinfo_ecc_mbe_err");
+		REPORT_FLAG(5,                   "routeinfo_ecc_sbe_err");
+		REPORT_FLAG(4,                   "qflitdata_ecc_mbe_err");
+		REPORT_FLAG(3,                   "qflitdata_ecc_sbe_err");
+		REPORT_FLAG(2,                   "routeinfo_parity_err");
+		REPORT_FLAG(1,                   "tailless_packet_err");
+		REPORT_FLAG(0,                   "csr_addr_err");
+		break;
+	case O_TPM_ERR_RINFO_SBE_INFO:
+	case O_TPM_ERR_RINFO_MBE_INFO:
+		REPORT_VALUE(GENMASK_ULL(9, 7), "rport");
+		REPORT_VALUE(GENMASK_ULL(5, 0), "syndrome");
+		break;
+	case O_TPM_ERR_QFLITDATA_SBE_INFO:
+	case O_TPM_ERR_QFLITDATA_MBE_INFO:
+		REPORT_VALUE(GENMASK_ULL(13, 11), "rport");
+		REPORT_VALUE(GENMASK_ULL(9,   8), "domain");
+		REPORT_VALUE(GENMASK_ULL(7,   0), "syndrome");
+		break;
+	case O_TPM_ERR_RINFO_PE_INFO:
+		REPORT_VALUE(GENMASK_ULL(3, 1), "rport");
+		break;
+	case O_TPM_ERR_RSVD_VL_INFO:
+		REPORT_VALUE(GENMASK_ULL(2, 0), "rsvd_vl_port");
+		break;
+	case O_RPM_INQ_PORT0_ERR_STS:
+	case O_RPM_INQ_PORT0_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT1_ERR_STS:
+	case O_RPM_INQ_PORT1_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT2_ERR_STS:
+	case O_RPM_INQ_PORT2_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT3_ERR_STS:
+	case O_RPM_INQ_PORT3_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT4_ERR_STS:
+	case O_RPM_INQ_PORT4_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT5_ERR_STS:
+	case O_RPM_INQ_PORT5_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT6_ERR_STS:
+	case O_RPM_INQ_PORT6_ERR_FIRST_HOST:
+	case O_RPM_INQ_PORT7_ERR_STS:
+	case O_RPM_INQ_PORT7_ERR_FIRST_HOST:
+		REPORT_FLAG(26, "qfft_12f_bad_err");
+		REPORT_FLAG(25, "vl_ack_parity_err");
+		REPORT_FLAG(24, "vlr_xlate_err");
+		REPORT_FLAG(23, "vl2_crdt_err_uf");
+		REPORT_FLAG(22, "vl1_crdt_err_uf");
+		REPORT_FLAG(21, "vl0_crdt_err_uf");
+		REPORT_FLAG(20, "vl2_crdt_err_of");
+		REPORT_FLAG(19, "vl1_crdt_err_of");
+		REPORT_FLAG(18, "vl0_crdt_err_of");
+		REPORT_FLAG(17, "vl2_txq_err_of");
+		REPORT_FLAG(16, "vl2_txq_err_uf");
+		REPORT_FLAG(15, "vl2_bq_err_of");
+		REPORT_FLAG(14, "vl2_bq_err_uf");
+		REPORT_FLAG(13, "vl2_sq_err_of");
+		REPORT_FLAG(12, "vl2_sq_err_uf");
+		REPORT_FLAG(11, "vl1_txq_err_of");
+		REPORT_FLAG(10, "vl1_txq_err_uf");
+		REPORT_FLAG(9,  "vl1_bq_err_of");
+		REPORT_FLAG(8,  "vl1_bq_err_uf");
+		REPORT_FLAG(7,  "vl1_sq_err_of");
+		REPORT_FLAG(6,  "vl1_sq_err_uf");
+		REPORT_FLAG(5,  "vl0_txq_err_of");
+		REPORT_FLAG(4,  "vl0_txq_err_uf");
+		REPORT_FLAG(3,  "vl0_bq_err_of");
+		REPORT_FLAG(2,  "vl0_bq_err_uf");
+		REPORT_FLAG(1,  "vl0_sq_err_of");
+		REPORT_FLAG(0,  "vl0_sq_err_uf");
+		break;
+	case O_RPM_INQ_FLSTOR_ERR_STS:
+	case O_RPM_INQ_FLSTOR_ERR_FIRST_HOST:
+		REPORT_FLAG(30, "sbe on 2f freelist");
+		REPORT_FLAG(29, "sbe on 3f freelist");
+		REPORT_FLAG(28, "sbe on 12f freelist");
+		REPORT_FLAG(27, "sbe_2f flit data o/p to shfifo in port");
+		REPORT_FLAG(26, "sbe_2f from freelist manager");
+		REPORT_FLAG(25, "sbe_2f on link list reading entries/next pointer");
+		REPORT_FLAG(24, "sbe_2f during flit data input to flit storage");
+		REPORT_FLAG(23, "sbe_3f flit data o/p to shfifo in port");
+		REPORT_FLAG(22, "sbe_3f from freelist manager");
+		REPORT_FLAG(21, "sbe_3f on link list reading entries/next pointer");
+		REPORT_FLAG(20, "sbe_3f during flit data input to flit storage");
+		REPORT_FLAG(19, "sbe_12f flit data o/p to shfifo in port");
+		REPORT_FLAG(18, "sbe_12f from freelist manager");
+		REPORT_FLAG(17, "sbe_12f on link list reading entries/next pointer");
+		REPORT_FLAG(16, "sbe_12f during flit data input to flit storage");
+		REPORT_FLAG(15, "parity error");
+		REPORT_FLAG(14, "mbe on 2f freelist");
+		REPORT_FLAG(13, "mbe on 3f freelist");
+		REPORT_FLAG(12, "mbe on 12f freelist");
+		REPORT_FLAG(11, "mbe_2f flit data o/p to shfifo in port");
+		REPORT_FLAG(10, "mbe_2f from freelist manager");
+		REPORT_FLAG(9,  "mbe_2f on link list reading entries/next pointer");
+		REPORT_FLAG(8,  "mbe_2f during flit data input to flit storage");
+		REPORT_FLAG(7,  "mbe_3f flit data o/p to shfifo in port");
+		REPORT_FLAG(6,  "mbe_3f from freelist manager");
+		REPORT_FLAG(5,  "mbe_3f on link list reading entries/next pointer");
+		REPORT_FLAG(4,  "mbe_3f during flit data input to flit storage");
+		REPORT_FLAG(3,  "mbe_12f flit data o/p to shfifo in port");
+		REPORT_FLAG(2,  "mbe_12f from freelist manager");
+		REPORT_FLAG(1,  "mbe_12f on link list reading entries/next pointer");
+		REPORT_FLAG(0,  "mbe_12f during flit data input to flit storage");
+		break;
+	case O_BRG_RTP_ERR_STS:
+	case O_BRG_RTP_ERR_FIRST_HOST:
+		REPORT_FLAG(31,                   "cport_dos_err_lweg_redir");
+		REPORT_FLAG(30,                   "csr_rd_miss");
+		REPORT_FLAG(29,                   "csr_wr_miss");
+		REPORT_VALUE(GENMASK_ULL(28, 27), "tcam_parity_err");
+		REPORT_FLAG(26,                   "loop_pkt_err");
+		REPORT_FLAG(25,                   "zero_valid_oports_err");
+		REPORT_FLAG(24,                   "adaptive_cport_err");
+		REPORT_FLAG(23,                   "deterministic_gt1_err");
+		REPORT_FLAG(22,                   "cport_dos_err");
+		REPORT_VALUE(GENMASK_ULL(21, 16), "urt_top_err");
+		REPORT_FLAG(15,                   "dlid_top_err");
+		REPORT_FLAG(14,                   "mlid_top_err");
+		REPORT_FLAG(13,                   "op4sel_mbe");
+		REPORT_FLAG(12,                   "op4sel_sbe");
+		REPORT_VALUE(GENMASK_ULL(11,  6), "urt_mbe");
+		REPORT_VALUE(GENMASK_ULL(5,   0), "urt_sbe");
+		break;
+	case O_BRG_RTP_ERR_FIRST_INFO:
+		REPORT_VALUE(GENMASK_ULL(63, 62), "l2_pkt");
+		REPORT_FLAG(61,                   "mcast");
+		REPORT_FLAG(60,                   "tcam_hit");
+		REPORT_VALUE(GENMASK_ULL(59, 56), "vlr");
+		REPORT_VALUE(GENMASK_ULL(55, 53), "rc");
+		REPORT_VALUE(GENMASK_ULL(52, 48), "sc");
+		REPORT_VALUE(GENMASK_ULL(47, 24), "dlid");
+		REPORT_VALUE(GENMASK_ULL(23,  0), "slid");
+		break;
+	}
+}
+
+/* END use of error spec helpers */
+#undef REPORT_FLAG
+#undef REPORT_VALUE
+#undef REPORT_ENUM
+
+/* returns true if the csr should be reported as an error */
+static bool is_error(struct fport *port, u64 error, const struct error_reg *result,
+		     const struct register_armed *armed)
+{
+	if (test_bit(port->lpn, port->sd->fport_lpns)) {
+		switch (result->offset) {
+		case O_FPC_ERR_STS:
+		case O_FPC_ERR_FIRST_HOST:
+			/* "link_err" (bit 19) is not a fatal error */
+			return error & ~BIT_ULL(19);
+		case O_FPC_ERR_INFO_PORTRCV:
+		case O_FPC_ERR_INFO_PORTRCV_HDR0_A:
+		case O_FPC_ERR_INFO_PORTRCV_HDR0_B:
+		case O_FPC_ERR_INFO_PORTRCV_HDR1_A:
+		case O_FPC_ERR_INFO_PORTRCV_HDR1_B:
+			return armed->fpc_err_info_portrcv;
+		case O_FPC_ERR_INFO_FMCONFIG:
+			return armed->fpc_err_info_fmconfig;
+		case O_FPC_ERR_INFO_FLOW_CTRL:
+			return armed->fpc_err_info_flow_ctrl;
+		case O_FPC_ERR_INFO_UNCORRECTABLE:
+			return armed->fpc_err_info_uncorrectable;
+		case O_FPC_ERR_INFO_PORTRCVCONSTRAINT:
+			return armed->fpc_err_info_portrcvconstraint;
+		case O_RTP_ERR_FIRST_INFO:
+			return armed->rtp_err_first_info;
+		case O_TP_ERR_ERROR_INFO:
+			return armed->tp_err_error_info;
+		case O_TP_ERR_PKEY_ERROR_INFO:
+			return armed->tp_err_pkey_error_info;
+		case O_INQ_ERR_STS:
+			/* "init_ram_complete" (bit 27) is not an error */
+			return error & ~BIT_ULL(27);
+		case O_TP_ERR_STS_0:
+		case O_TP_ERR_FIRST_HOST_0:
+			/* "congested" (bit 13) is not an error */
+			return error & ~BIT_ULL(13);
+		case O_8051_ERR_STS:
+			/*
+			 * "set_by_8051" (bit 0) is a status bit indicating
+			 * the validity of a non-PAWR register (which itself
+			 * may contain a non-error host command status)
+			 *
+			 * "lost_8051_heart_beat" (bit 1) can false positive due
+			 * to reset flow timing.
+			 */
+			return error & ~(BIT_ULL(1) | BIT_ULL(0));
+		case O_LCB_ERR_STS:
+		case O_LCB_ERR_FIRST_HOST:
+			/*
+			 * "fec_err_cnt_hit_limit" (bit 32) is not a fatal error
+			 * "crc_err_cnt_hit_limit" (bit 8) is not a fatal error
+			 * "reinit_from_peer" (bit 6) is not a fatal error
+			 * "seq_crc_err" (bit 5) is not a fatal error
+			 */
+			return error & ~(BIT_ULL(32) | BIT_ULL(8) | BIT_ULL(6) | BIT_ULL(5));
+		case O_LCB_ERR_INFO_FEC_CERR_MASK_VLD:
+			/*
+			 * this csr has a non-zero power on default.
+			 * it is only an error if "val" (bit 0) is set.
+			 */
+			return error & BIT_ULL(0);
+		}
+	}
+
+	if (test_bit(port->lpn, port->sd->bport_lpns)) {
+		switch (result->offset) {
+		case O_BRG_CTX_ERR_FIRST_INFO:
+			return armed->brg_ctx_err_first_info;
+		case O_BRG_FIDMISS_INFO:
+			return armed->brg_fidmiss_info;
+		case O_BRG_SRCCTXT_DUP_RSPINFO:
+			return armed->brg_srcctxt_dup_rspinfo;
+		case O_BRG_DSTCTXT_DUP_RSPINFO:
+			return armed->brg_dstctxt_dup_rspinfo;
+		case O_BRG_0_ERR_FIRST_INFO:
+			return armed->brg_0_err_first_info;
+		case O_BRG_1_ERR_FIRST_INFO:
+			return armed->brg_1_err_first_info;
+		case O_BRG_2_ERR_FIRST_INFO:
+			return armed->brg_2_err_first_info;
+		case O_TPM_ERR_RINFO_SBE_INFO:
+			return armed->tpm_err_rinfo_sbe_info;
+		case O_TPM_ERR_RINFO_MBE_INFO:
+			return armed->tpm_err_rinfo_mbe_info;
+		case O_TPM_ERR_QFLITDATA_SBE_INFO:
+			return armed->tpm_err_qflitdata_sbe_info;
+		case O_TPM_ERR_QFLITDATA_MBE_INFO:
+			return armed->tpm_err_qflitdata_mbe_info;
+		case O_TPM_ERR_RINFO_PE_INFO:
+			return armed->tpm_err_rinfo_pe_info;
+		case O_TPM_ERR_RSVD_VL_INFO:
+			return armed->tpm_err_rsvd_vl_info;
+		case O_TPM_ERR_INQ_SBE_ERR_INFO:
+			return armed->tpm_err_inq_sbe_err_info;
+		case O_TPM_ERR_INQ_MBE_ERR_INFO:
+			return armed->tpm_err_inq_mbe_err_info;
+		case O_BRG_RTP_ERR_FIRST_INFO:
+			return armed->brg_rtp_err_first_info;
+		}
+	}
+
+	return true;
+}
+
+static bool report_errors(struct fport *port, const u64 *errors,
+			  const struct error_reg *regs, size_t len,
+			  const struct register_armed *armed)
+{
+	bool has_errors = false;
+	size_t i;
+
+	mutex_lock(&report_lock);
+
+	for (i = 0; i < len; ++i) {
+		if (!errors[i])
+			continue;
+
+		if (!is_error(port, errors[i], regs + i, armed))
+			continue;
+
+		fport_info(port, "sticky hw error: %s 0x%016llx (%llu)\n",
+			   regs[i].name, errors[i], errors[i]);
+
+		if (test_bit(port->lpn, port->sd->fport_lpns))
+			report_fabric_error(port, regs[i].offset, errors[i]);
+		else if (test_bit(port->lpn, port->sd->bport_lpns))
+			report_bridge_error(port, regs[i].offset, errors[i]);
+
+		has_errors = true;
+	}
+
+	mutex_unlock(&report_lock);
+
+	return has_errors;
+}
+
+static void arm_fabric_errors(struct fport *port, const u64 *errors,
+			      const struct error_reg *regs, size_t len,
+			      struct register_armed *armed)
+{
+	int i;
+
+	for (i = 0; i < len; ++i) {
+		switch (regs[i].offset) {
+		case O_FPC_ERR_STS:
+		case O_FPC_ERR_FIRST_HOST:
+			if (errors[i] & BIT_ULL(55))
+				armed->fpc_err_info_portrcv = true;
+			if (errors[i] & BIT_ULL(54))
+				armed->fpc_err_info_fmconfig = true;
+			if (errors[i] & BIT_ULL(53))
+				armed->fpc_err_info_uncorrectable = true;
+			if (errors[i] & BIT_ULL(52))
+				armed->fpc_err_info_portrcvconstraint = true;
+			break;
+		case O_RTP_ERR_STS:
+		case O_RTP_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->rtp_err_first_info = true;
+			break;
+		case O_TP_ERR_STS_0:
+		case O_TP_ERR_FIRST_HOST_0:
+			if (errors[i])
+				armed->tp_err_error_info = true;
+			if (errors[i] & BIT_ULL(0))
+				armed->tp_err_pkey_error_info = true;
+			break;
+		case O_TP_ERR_STS_1:
+		case O_TP_ERR_FIRST_HOST_1:
+			if (errors[i])
+				armed->tp_err_error_info = true;
+			break;
+		}
+	}
+}
+
+static void arm_bridge_errors(struct fport *port, const u64 *errors,
+			      const struct error_reg *regs, size_t len,
+			      struct register_armed *armed)
+{
+	int i;
+
+	for (i = 0; i < len; ++i) {
+		switch (regs[i].offset) {
+		case O_BRG_CTX_ERR_STS:
+		case O_BRG_CTX_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->brg_ctx_err_first_info = true;
+			break;
+		case O_BRG_FIDMISS:
+			if (errors[i])
+				armed->brg_fidmiss_info = true;
+			break;
+		case O_BRG_SRCCTXT_DUP_RSP:
+			if (errors[i])
+				armed->brg_srcctxt_dup_rspinfo = true;
+			break;
+		case O_BRG_DSTCTXT_DUP_RSP:
+			if (errors[i])
+				armed->brg_dstctxt_dup_rspinfo = true;
+			break;
+		case O_BRG_0_ERR_STS:
+		case O_BRG_0_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->brg_0_err_first_info = true;
+			break;
+		case O_BRG_1_ERR_STS:
+		case O_BRG_1_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->brg_1_err_first_info = true;
+			break;
+		case O_BRG_2_ERR_STS:
+		case O_BRG_2_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->brg_2_err_first_info = true;
+			break;
+		case O_TPM_ERR_RINFO_SBE_COUNT:
+			if (errors[i])
+				armed->tpm_err_rinfo_sbe_info = true;
+			break;
+		case O_TPM_ERR_RINFO_MBE_COUNT:
+			if (errors[i])
+				armed->tpm_err_rinfo_mbe_info = true;
+			break;
+		case O_TPM_ERR_QFLITDATA_SBE_COUNT:
+			if (errors[i])
+				armed->tpm_err_qflitdata_sbe_info = true;
+			break;
+		case O_TPM_ERR_QFLITDATA_MBE_COUNT:
+			if (errors[i])
+				armed->tpm_err_qflitdata_mbe_info = true;
+			break;
+		case O_TPM_ERR_RINFO_PE_COUNT:
+			if (errors[i])
+				armed->tpm_err_rinfo_pe_info = true;
+			break;
+		case O_TPM_ERR_RSVD_VL_CNT:
+			if (errors[i])
+				armed->tpm_err_rsvd_vl_info = true;
+			break;
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_0:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_1:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_2:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_3:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_4:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_5:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_6:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_7:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_8:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_9:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_10:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_11:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_12:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_13:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_14:
+		case O_TPM_ERR_STORG_SBE_ERR_CNT_15:
+			if (errors[i])
+				armed->tpm_err_inq_sbe_err_info = true;
+			break;
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_0:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_1:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_2:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_3:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_4:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_5:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_6:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_7:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_8:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_9:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_10:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_11:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_12:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_13:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_14:
+		case O_TPM_ERR_STORG_MBE_ERR_CNT_15:
+			if (errors[i])
+				armed->tpm_err_inq_mbe_err_info = true;
+			break;
+		case O_BRG_RTP_ERR_STS:
+		case O_BRG_RTP_ERR_FIRST_HOST:
+			if (errors[i])
+				armed->brg_rtp_err_first_info = true;
+			break;
+		}
+	}
+}
+
+static void reset_fabric_errors(struct fsubdev *sd)
+{
+	struct fabric_port_status_rsp rsp = {};
+	struct register_armed armed = {};
+	struct fport *port;
+	int err;
+	u8 lpn;
+
+	for_each_fabric_port(port, lpn, sd) {
+		err = read_fabric_errors(port, &rsp.rsp);
+		if (err) {
+			sd_warn(sd, "unable to read fabric errors: %d\n", err);
+			return;
+		}
+
+		arm_fabric_errors(port, rsp.regs, s_fabric_regs,
+				  ARRAY_SIZE(s_fabric_regs), &armed);
+
+		report_errors(port, rsp.regs, s_fabric_regs,
+			      ARRAY_SIZE(s_fabric_regs), &armed);
+
+		err = clear_errors(port, rsp.regs, s_fabric_regs,
+				   ARRAY_SIZE(s_fabric_regs));
+		if (err) {
+			sd_warn(sd, "unable to clear fabric errors: %d\n", err);
+			return;
+		}
+	}
+}
+
+static void reset_bridge_errors(struct fsubdev *sd)
+{
+	struct bridge_port_status_rsp *rsp;
+	struct register_armed armed = {};
+	struct fport *port;
+	int err;
+	u8 lpn;
+
+	rsp = kmalloc(sizeof(*rsp), GFP_KERNEL);
+	if (!rsp)
+		return;
+
+	for_each_bridge_port(port, lpn, sd) {
+		err = read_bridge_errors(port, &rsp->rsp);
+		if (err) {
+			sd_warn(sd, "unable to read bridge errors: %d\n", err);
+			goto end;
+		}
+
+		arm_bridge_errors(port, rsp->regs, s_bridge_regs,
+				  ARRAY_SIZE(s_bridge_regs), &armed);
+
+		report_errors(port, rsp->regs, s_bridge_regs,
+			      ARRAY_SIZE(s_bridge_regs), &armed);
+
+		err = clear_errors(port, rsp->regs, s_bridge_regs,
+				   ARRAY_SIZE(s_bridge_regs));
+		if (err) {
+			sd_warn(sd, "unable to clear bridge errors: %d\n", err);
+			goto end;
+		}
+	}
+
+end:
+	kfree(rsp);
+}
+
+void reset_errors(struct fsubdev *sd)
+{
+	reset_fabric_errors(sd);
+	reset_bridge_errors(sd);
+}
+
diff --git a/drivers/gpu/drm/xe/fabric/error.h b/drivers/gpu/drm/xe/fabric/error.h
new file mode 100644
index 0000000000000..0033f56326110
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/error.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2022 Intel Corporation.
+ *
+ */
+
+#ifndef IAF_ERROR_H_INCLUDED
+#define IAF_ERROR_H_INCLUDED
+
+#include "iaf_drv.h"
+
+void reset_errors(struct fsubdev *sd);
+
+#endif /* IAF_ERROR_H_INCLUDED */
+
diff --git a/drivers/gpu/drm/xe/fabric/fw.c b/drivers/gpu/drm/xe/fabric/fw.c
new file mode 100644
index 0000000000000..013a48c4bfde8
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/fw.c
@@ -0,0 +1,2089 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/crc32c.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+
+#include "dev_diag.h"
+#include "error.h"
+#include "fw.h"
+#include "iaf_drv.h"
+#include "ops.h"
+#include "mbdb.h"
+#include "port.h"
+#include "routing_engine.h"
+#include "sysfs.h"
+
+/*
+ * Pad bytes needed to reach _type boundary. If sizeof(_type) is a power of
+ * two, this should optimize to -(_size) & (sizeof(_type) - 1)
+ */
+#define PAD_TO(_type, _size)    ((sizeof(_type) - (_size) % sizeof(_type)) % sizeof(_type))
+
+/*
+ * how many times to check FW_VERSION for completion of firmware initialization
+ * before declaring failure (there is a 20 ms delay before each check -- 50
+ * delays is a minimum of 1 second)
+ */
+#define MAX_20MS_DELAYS (50 * 6)
+
+/*
+ * how many times to retry PSC bin read waiting for SPI to become available
+ * before declaring failure (there is a 200 ms delay between each check -- 5
+ * delays is a minimum of 1 second)
+ */
+#define MAX_200MS_RETRIES (5 * 60 * 10)
+#define ONE_MINUTE_COUNT 300 /* (300 * 200ms) = 1 min */
+
+#define MODULE_TYPE_CSS_GENERIC	(6)
+#define HEADER_VER_RSA		(0x00010000)
+#define MODULE_VENDOR_NAME	GENMASK(15, 0)
+#define MODULE_VENDOR_INTEL	(0x8086)
+#define MODULE_ID_DEBUG_SIGNED	BIT(31)
+#define KEY_SIZE_SHA384		(96)
+#define MODULUS_SIZE_SHA384	(96)
+#define EXPONENT_SIZE_SHA384	(1)
+#define CSS_DATE_YEAR		GENMASK(31, 16)
+#define CSS_DATE_MONTH		GENMASK(15, 8)
+#define CSS_DATE_DAY		GENMASK(7, 0)
+#define PSC_TIME_HOUR		GENMASK(31, 16)
+#define PSC_TIME_MINUTE		GENMASK(15, 8)
+#define PSC_TIME_SECOND		GENMASK(7, 0)
+
+struct fw_css_header {
+	u32 module_type;	/* always 0x00000006 */
+	u32 header_len;		/* always 0x000000e1 */
+	u32 header_ver;		/* always 0x00010000 */
+	u32 module_id;		/* bit 31 = debug signed */
+	u32 module_vendor;	/* always 0x00008086 */
+	u32 date;		/* format 0xYYYYMMDD */
+	u32 size;		/* size in dwords */
+	u32 key_size;		/* typical 0x00000060, must be valid */
+	u32 modulus_size;	/* typical 0x00000060, must be valid */
+	u32 exponent_size;	/* typical 0x00000001, don't care */
+	u32 reserved[22];
+	u8 modulus[384];
+	u8 exponent[4];
+	u8 signature[384];
+};
+
+#define FW_MAX_SEGMENTS	(3)
+
+#define BASE_LOAD_ADDRESS	(0xaffe0000)
+
+struct fw_segment {
+	u32 start;
+	u32 end;
+};
+
+struct fw_module_header {
+	u32 init_addr;
+	struct fw_segment segment[FW_MAX_SEGMENTS];
+	u32 fw_version;
+	u32 fw_build;
+};
+
+#define PSCBIN_MAGIC_NUMBER (0x42435350)
+#define MAX_INIS ((MAX_SOCKET_IDS) * 2)
+
+/* Format of struct psc_data being used: */
+enum {
+	PSCBIN_VERSION_V0 = 0,	/* NULL PSC */
+	PSCBIN_VERSION_V1,	/* unsupported */
+	PSCBIN_VERSION_V2,
+	PSCBIN_VERSION_V3,
+	PSCBIN_VERSION_CURRENT = PSCBIN_VERSION_V3,
+	PSCBIN_VERSION_MIN = PSCBIN_VERSION_V2,
+	PSCBIN_VERSION_MAX = PSCBIN_VERSION_V3,
+};
+
+/* Form factor: */
+enum {
+	FORM_FACTOR_PCI = 0,
+	FORM_FACTOR_OAM,
+	FORM_FACTOR_A21,
+	FORM_FACTOR_END
+};
+
+/* PSC must be at least as large as header and no greater than 1 MB */
+#define MIN_PSC_SIZE sizeof(struct psc_data)
+#define MAX_PSC_SIZE (1024 * 1024)
+#define SPI_HEADER_SIZE (8 * 1024)
+
+#define I915_SPI_DRIVER_NAME_AUX "i915_spi"
+#define I915_SPI_DRIVER_NAME_MFD "i915-spi"
+#define PSC_REGION_QUALIFIER	".PSC"
+
+#define PVC_FW_IMAGE  "i915/pvc_iaf_ver1.bin"
+#define PVC_FW_IMAGE_DEBUG_SIGNED  "i915/pvc_iaf_ver1d.bin"
+#define PVC_FW_IMAGE_EXPORT_LIMITED  "i915/pvc_iaf_ver1e.bin"
+/*
+ * FW image
+ */
+#if IS_ENABLED(CONFIG_IAF_DEBUG_ALTERNATE_FW_LOAD)
+static char *fw_image = "";
+module_param(fw_image, charp, 0600);
+MODULE_PARM_DESC(fw_image, "Retrieve FW image from specified FW file");
+#endif
+
+/**
+ * struct psc_identifier - platform specific configuration identifier
+ * @magic: must be PSCBIN_MAGIC_NUMBER
+ * @psc_format_version: interface version being used
+ *
+ * This identifier is at the start of all psc data structures. It identifies
+ * it as platform specific configuration data and identifies which version of
+ * the structure is being used.
+ */
+struct psc_identifier {
+	u32 magic;
+	u32 psc_format_version;
+};
+
+/**
+ * struct psc_item - Identify index/size of variably-sized data item
+ * @idx: Index of item in data[] (in bytes)
+ * @size: Size of item in data[] (in bytes)
+ *
+ * Used with &struct psc_data to identify variably-sized data elements in
+ * &struct psc_data.data[]. If size is 0, the item is not present. It is
+ * possible for two items to refer to the same data.
+ */
+struct psc_item {
+	u32 idx;
+	u32 size;
+};
+
+/**
+ * struct psc_data - platform specific configuration data
+ * @identifier: identify the version of this structure being used
+ * @identifier.magic: must be PSCBIN_MAGIC_NUMBER
+ * @identifier.psc_format_version: must be 0 or in [PSCBIN_VERSION_MIN:PSCBIN_VERSION_MAX]
+ * @form_factor: type of the product (PCI, OAM, A21)
+ * @cfg_version: should only increment to prevent unintentional downgrades
+ * @date: UTC generation date in BCD (YYYYMMDD)
+ * @time: UTC generation time in BCD (HHMMSS)
+ * @flags: for routing and other extension options, should be 0 currently
+ * @reserved1: reserved for future use, should be 0 currently
+ * @reserved2: reserved for future use, should be 0 currently
+ * @data_size: size of @data[] array
+ * @brand_name: OEM-provided
+ * @product_name: OEM-provided, shouldn't change when a new PSCBIN is burned
+ * @comment: OEM-provided comment
+ * @ini_name: names of ini_bin files used
+ * @ini_bin: binary ini data to provide to FW
+ * @ext_data: extra data, reserved for future use
+ * @cust_data: arbitrary customer data in PSC file, not used or displayed
+ * @presence_data: refers to presence configuration if present
+ * @reserved3: forces data[] to be 64-bit aligned, should be 0 currently
+ * @crc32c_hdr: CRC covering all other header fields
+ * @data: array containing all variably-sized data items
+ *
+ * Identifies platform-specific configuration data corresponding to a device.
+ * Retrieved from SPI flash (or optionally as a firmware file) during boot.
+ * Normally the same PSC data would be present on all devices in the system,
+ * both socket number and subdevice index are used to locate INI_BIN data,
+ * which can differ between subdevices.
+ *
+ * Optional/variably-sized items are contained in @data[] and indexed using
+ * fields of type &struct psc_item. &(struct psc_item).size is the size of the
+ * actual data item, although as of PSCBIN_VERSION_V3 each item except presence
+ * data is 0-padded to a 32-bit boundary in @data[] and followed immediately by
+ * a CRC32C checksum (presence data is fully covered by its own checksums).
+ *
+ * @presence_data is introduced as of PSCBIN_VERSION_V3. If @presence_data is
+ * configured, it should refer to an instance of &struct psc_presence_config
+ * contained within @data[].
+ *
+ * This structure is defined identically in PSCBIN_VERSION_V2, except that
+ * @presence_data becomes crc_data, which refers to a CRC32C at the end of
+ * @data[] which covers all other items in @data[] instead of using per-item
+ * CRC32C checksums.
+ *
+ * The first two fields are the same in all versions of this structure to
+ * support versioning of this interface: all prior versions are either
+ * deprecated or no longer supported.
+ */
+struct psc_data {
+	struct psc_identifier identifier;
+	u32 form_factor;
+	u32 cfg_version;
+	u32 date;
+	u32 time;
+	u32 flags;
+	u32 reserved1;
+	u32 reserved2;
+	u32 data_size;
+	struct psc_item brand_name;
+	struct psc_item product_name;
+	struct psc_item comment;
+	struct psc_item ini_name[MAX_INIS];
+	struct psc_item ini_bin[MAX_INIS];
+	struct psc_item ext_data;
+	struct psc_item cust_data;
+	struct psc_item presence_data;
+	u32 reserved3;
+	u32 crc32c_hdr;
+	u8 data[];
+};
+
+/**
+ * struct psc_presence_config - presence configuration data
+ * @rules: variably-sized per-device presence detection rules
+ * @data_size: size of @data[] array
+ * @crc32c_hdr: CRC covering all other header fields
+ * @data: array containing variably-sized data items
+ *
+ * Identifies device presence configuration data. This is configured based
+ * on socket_id. Should be referred to by &(struct psc_data).presence_data
+ * and reside in &(struct psc_data).data[]
+ *
+ * Optional/variably-sized items are contained in @data[] and indexed using
+ * fields of type &struct psc_item. Each populated @rules entry refers to
+ * an array of &struct psc_presence_rule items contained in @data[]
+ */
+struct psc_presence_config {
+	struct psc_item rules[MAX_SOCKET_IDS];
+	u32 data_size;
+	u32 crc32c_hdr;
+	u8 data[];
+};
+
+/*
+ * PSC image
+ */
+static char *psc_file_override = "";
+module_param(psc_file_override, charp, 0600);
+MODULE_PARM_DESC(psc_file_override,
+		 "Get PSC data from file (via FW API) instead of flash");
+
+/*
+ * firmware roption override
+ */
+/* must match the module param description */
+#define ROPTION_DEFAULT ( \
+	ROPTION_FORCE_FEC_HEAVY_ON | \
+	ROPTION_TRACE_LNI_DEBUG    | \
+	ROPTION_FORCE_FEC_LIGHT_ON)
+
+static unsigned int firmware_roption = ROPTION_DEFAULT;
+module_param(firmware_roption, uint, 0600);
+MODULE_PARM_DESC(firmware_roption,
+		 "Set the firmware roption debug register (default: 0x40000201)");
+
+/*
+ * Workqueue and timer support functions
+ */
+static void wrk_load_and_init_subdev(struct work_struct *work);
+static void queue_load_and_init_all_subdevs(struct fdev *dev);
+static void wrk_load_psc_data(struct work_struct *work);
+
+static DECLARE_BITMAP(load_fw_opcodes, MAILBOX_OPCODE_COUNT);
+static DECLARE_BITMAP(required_runtime_opcodes, MAILBOX_OPCODE_COUNT);
+
+static void init_opcodes(void)
+{
+	__set_bit(MBOX_OP_CODE_FW_VERSION, load_fw_opcodes);
+	__set_bit(MBOX_OP_CODE_CSR_RAW_WR, load_fw_opcodes);
+	__set_bit(MBOX_OP_CODE_FW_START, load_fw_opcodes);
+
+	__set_bit(MBOX_OP_CODE_FW_VERSION, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_CSR_RAW_RD, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_CSR_RAW_WR, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_WALLOC, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_INI_TABLE_LOAD, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_INI_LOADED_SET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LINK_STATE_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_MAJOR_PHYSICAL_STATE_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_CSR_RD, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_CSR_WR, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_RESET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_STATES_GET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_BEACON_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ENABLE_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_NOTIFICATION,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ACKNOWLEDGE,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_SWITCHINFO_GET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_SWITCHINFO_SET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_PORTINFO_GET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_RPIPE_GET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_RPIPE_SET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ENABLE_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_NOTIFICATION,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ACKNOWLEDGE,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ENABLE_SET,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_NOTIFICATION,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ACKNOWLEDGE,
+		  required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_PORT_STATUS_GET, required_runtime_opcodes);
+	__set_bit(MBOX_OP_CODE_STATE_DUMP, required_runtime_opcodes);
+}
+
+/**
+ * fw_init_module - Early device-independent fw module initialization
+ */
+void fw_init_module(void)
+{
+	init_opcodes();
+}
+
+/**
+ * fw_init_dev - Early device-dependent fw module initialization
+ * @dev: device to initialize
+ */
+void fw_init_dev(struct fdev *dev)
+{
+	u8 i;
+
+	init_completion(&dev->psc.done);
+	init_completion(&dev->psc.abort);
+
+	INIT_WORK(&dev->psc.work, wrk_load_psc_data);
+
+	atomic_set(&dev->fwinit_refcnt, dev->pd->sd_cnt);
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i)
+		INIT_WORK(&dev->sd[i].fw_work, wrk_load_and_init_subdev);
+}
+
+static void report_fw_info(struct fsubdev *sd,
+			   struct mbdb_op_fw_version_rsp *fw_version,
+			   const char *when)
+{
+	sd_dbg(sd, "ROM/Firmware Version Info: (%s)\n", when);
+	sd_dbg(sd, "    MBox Version:  %d\n", fw_version->mbox_version);
+	sd_dbg(sd, "    Environment:   %s%s\n",
+	       (fw_version->environment & FW_VERSION_ENV_BIT) ?
+	       "run-time" :
+	       "bootloader",
+	       (fw_version->environment & FW_VERSION_INIT_BIT) ?
+	       ", ready" :
+	       "");
+	sd_dbg(sd, "    FW Version:    %s\n", fw_version->fw_version_string);
+}
+
+/* convert BCD-coded unsigned number to decimal */
+static u32 decode_bcd(u32 bcd_value)
+{
+	u32 value = 0;
+	u32 place;
+	u32 digit;
+
+	for (place = 1; bcd_value; bcd_value >>= 4, place *= 10) {
+		digit = bcd_value & 0xf;
+		if (digit > 9)
+			return -EINVAL;
+		value += digit * place;
+	}
+
+	return value;
+}
+
+/* Leap year every 4 years unless year is divisible by 100 and not 400 */
+static bool leap_year(u32 year)
+{
+	if (year % 4 != 0)
+		return false;
+	else if ((year % 100 == 0) || (year % 400 != 0))
+		return false;
+	else
+		return true;
+}
+
+/* Verify that date is of form 0xYYYYMMDD (or 0 for NULL date code) */
+static bool valid_bcd_date(u32 date)
+{
+	u32 month;
+	u32 year;
+	u32 day;
+
+	if (!date)
+		return true;
+
+	year = decode_bcd(FIELD_GET(CSS_DATE_YEAR, date));
+	month = decode_bcd(FIELD_GET(CSS_DATE_MONTH, date));
+	day = decode_bcd(FIELD_GET(CSS_DATE_DAY, date));
+
+	if (day < 1 || year < 2019)
+		return false;
+
+	switch (month) {
+	case 1:
+	case 3:
+	case 5:
+	case 7:
+	case 8:
+	case 10:
+	case 12:
+		if (day > 31)
+			return false;
+		break;
+
+	case 4:
+	case 6:
+	case 9:
+	case 11:
+		if (day > 30)
+			return false;
+		break;
+
+	case 2:
+		if (day > 29 || (day == 29 && !leap_year(year)))
+			return false;
+		break;
+
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+/* Leap seconds occur at the end of the UTC day */
+static bool leap_second(u32 hour, u32 minute, u32 second)
+{
+	return hour == 23 && minute == 59 && second == 60;
+}
+
+/* Verify that date is of form 0xHHMMSS */
+static bool valid_bcd_time(u32 time)
+{
+	u32 second;
+	u32 minute;
+	u32 hour;
+
+	hour = decode_bcd(FIELD_GET(PSC_TIME_HOUR, time));
+	minute = decode_bcd(FIELD_GET(PSC_TIME_MINUTE, time));
+	second = decode_bcd(FIELD_GET(PSC_TIME_SECOND, time));
+
+	return hour < 24 && minute < 60 && (second < 60 || leap_second(hour, minute, second));
+}
+
+/*
+ * When loading the PSC as firmware via the psc_file_override parameter or with older formats that
+ * did not support per-item CRCs, the entire PSC blob is loaded in memory. As of V3, when loading
+ * from SPI, only required items are loaded to reduce expensive reads.
+ */
+static inline bool full_pscbin_in_memory(struct fdev *dev, u32 psc_format_version)
+{
+	return dev->psc.as_fw || psc_format_version < PSCBIN_VERSION_V3;
+}
+
+static inline bool psc_has_per_item_crc(u32 psc_format_version)
+{
+	return psc_format_version > PSCBIN_VERSION_V2;
+}
+
+static inline bool psc_has_presence_rules(u32 psc_format_version)
+{
+	return psc_format_version > PSCBIN_VERSION_V2;
+}
+
+static u32 crc32c_with_padding(const u8 *buf, u32 size)
+{
+	static const u8 zero_bytes[sizeof(u32)] = {};
+
+	return crc32c(crc32c(0, buf, size), zero_bytes, PAD_TO(u32, size));
+}
+
+static bool psc_item_crc_ok(const struct psc_data *psc, const struct psc_item *item)
+{
+	u32 *crc;
+
+	if (!psc_has_per_item_crc(psc->identifier.psc_format_version))
+		return true;
+
+	crc = (u32 *)&psc->data[item->idx + item->size + PAD_TO(u32, item->size)];
+
+	return *crc == crc32c_with_padding(&psc->data[item->idx], item->size);
+}
+
+static int verify_fw(struct fdev *dev)
+{
+	struct fw_module_header *mod_hdr;
+	struct fw_css_header *css_hdr;
+	u8 *segment_data_end;
+	u8 *segment_data;
+	const u8 *data;
+	size_t size;
+	int i;
+
+	dev_dbg(fdev_dev(dev), "Checking firmware header\n");
+
+	data = dev->fw->data;
+	size = dev->fw->size;
+
+	css_hdr = (struct fw_css_header *)data;
+	mod_hdr = (struct fw_module_header *)(css_hdr + 1);
+
+	segment_data = (u8 *)(mod_hdr + 1);
+	segment_data_end = segment_data;
+
+	if (data + size < segment_data) {
+		dev_err(fdev_dev(dev), "Incomplete firmware header\n");
+		return -EINVAL;
+	}
+
+	if (css_hdr->module_type != MODULE_TYPE_CSS_GENERIC ||
+	    css_hdr->header_ver != HEADER_VER_RSA ||
+	    FIELD_GET(MODULE_VENDOR_NAME, css_hdr->module_vendor) !=
+	     MODULE_VENDOR_INTEL) {
+		dev_err(fdev_dev(dev),
+			"Illegal firmware type/version/vendor: %d/0x%x/0x%x\n",
+			css_hdr->module_type, css_hdr->header_ver,
+			css_hdr->module_vendor);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < FW_MAX_SEGMENTS; ++i)
+		if (mod_hdr->segment[i].end > mod_hdr->segment[i].start)
+			segment_data_end += (mod_hdr->segment[i].end -
+					     mod_hdr->segment[i].start);
+
+	if (data + size < segment_data_end) {
+		dev_err(fdev_dev(dev), "Incomplete fw data\n");
+		return -EINVAL;
+	}
+
+	if (css_hdr->header_len * sizeof(u32) != sizeof(*css_hdr) ||
+	    data + css_hdr->size * sizeof(u32) != segment_data_end ||
+	    css_hdr->key_size != KEY_SIZE_SHA384 ||
+	    css_hdr->modulus_size != MODULUS_SIZE_SHA384 ||
+	    css_hdr->exponent_size != EXPONENT_SIZE_SHA384) {
+		dev_err(fdev_dev(dev), "Mismatched size information in fw header\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(fdev_dev(dev), "Firmware available, dated: %08x\n",
+		css_hdr->date);
+
+	if (css_hdr->date == 0 || !valid_bcd_date(css_hdr->date)) {
+		dev_err(fdev_dev(dev), "Invalid date format in firmware header\n");
+		return -EINVAL;
+	}
+
+	if (css_hdr->module_id & MODULE_ID_DEBUG_SIGNED)
+		dev_dbg(fdev_dev(dev), "Firmware is debug signed\n");
+
+	return 0;
+}
+
+static int copy_fw_to_device(struct fsubdev *sd, const u8 *data, size_t size)
+{
+	struct fw_module_header *mod_hdr;
+	struct fw_css_header *css_hdr;
+	u8 *segment_data;
+	u32 ld_addr;
+	u32 len;
+	int err;
+	int i;
+
+	sd_dbg(sd, "Downloading firmware\n");
+
+	/* verify_fw() ensures that this data is all in the FW image */
+
+	css_hdr = (struct fw_css_header *)data;
+	mod_hdr = (struct fw_module_header *)(css_hdr + 1);
+	segment_data = (u8 *)(mod_hdr + 1);
+
+	ld_addr = BASE_LOAD_ADDRESS;
+
+	err = ops_mem_posted_wr(sd, ld_addr, (u8 *)css_hdr, sizeof(*css_hdr));
+	if (err) {
+		sd_err(sd, "Could not write CSS hdr\n");
+		goto end;
+	}
+
+	ld_addr += sizeof(*css_hdr);
+
+	err = ops_mem_posted_wr(sd, ld_addr, (u8 *)mod_hdr, sizeof(*mod_hdr));
+	if (err) {
+		sd_err(sd, "Could not write module hdr\n");
+		goto end;
+	}
+
+	for (i = 0; i < FW_MAX_SEGMENTS; ++i) {
+		if (mod_hdr->segment[i].end <= mod_hdr->segment[i].start)
+			continue;
+
+		ld_addr = mod_hdr->segment[i].start;
+		len = mod_hdr->segment[i].end - ld_addr;
+		err = ops_mem_posted_wr(sd, ld_addr, segment_data, len);
+		if (err) {
+			sd_err(sd, "Could not write segment %d\n", i);
+			goto end;
+		}
+		segment_data += len;
+	}
+
+end:
+	return err;
+}
+
+bool is_opcode_valid(struct fsubdev *sd, const u8 op_code)
+{
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	u8 fw_environment = fw_version->environment & FW_VERSION_ENV_BIT;
+
+	/* Validate op_code is one that is available in the current environment */
+	if (test_bit(op_code, fw_version->supported_opcodes))
+		return true;
+
+	sd_warn(sd, "opcode %d not supported in %s mode by firmware version %s\n", op_code,
+		fw_environment ? "runtime" : "firmware load", fw_version->fw_version_string);
+
+	return false;
+}
+
+static bool has_all_opcodes(unsigned long *supported, unsigned long *needed)
+{
+	DECLARE_BITMAP(common, MAILBOX_OPCODE_COUNT);
+
+	bitmap_and(common, supported, needed, MAILBOX_OPCODE_COUNT);
+	return bitmap_equal(common, needed, MAILBOX_OPCODE_COUNT);
+}
+
+static int load_fw(struct fsubdev *sd)
+{
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	int err;
+
+	report_fw_info(sd, fw_version, "at boot");
+
+	if (fw_version->environment & FW_VERSION_ENV_BIT) {
+		/*
+		 * Found runtime FW, expecting boot loader
+		 */
+
+		sd_info(sd, "runtime firmware detected at boot\n");
+
+		sd_info(sd, "resetting to boot loader\n");
+
+		err = ops_reset(sd, false);
+		if (err)
+			goto load_failed;
+
+		/* more than enough time for FW to do 1 write */
+		msleep(20);
+
+		mbdb_reinit(sd);
+
+		err = ops_fw_version(sd, fw_version);
+
+		if (err) {
+			sd_err(sd, "error checking FW version\n");
+			goto load_failed;
+		}
+
+		report_fw_info(sd, fw_version, "after RESET");
+	}
+
+	if (fw_version->environment & FW_VERSION_ENV_BIT) {
+		sd_err(sd, "unable to reset to boot loader\n");
+		err = -EPERM;
+		goto load_failed;
+	}
+
+	if (!has_all_opcodes(fw_version->supported_opcodes, load_fw_opcodes)) {
+		sd_err(sd, "FW LOAD opcodes not supported\n");
+		err = -EPERM;
+		goto load_failed;
+	}
+
+	/*
+	 * This shouldn't be possible
+	 */
+	if (WARN_ON(!sd->fdev->fw)) {
+		err = -ENOENT;
+		goto load_failed;
+	}
+
+	err = copy_fw_to_device(sd, sd->fdev->fw->data, sd->fdev->fw->size);
+	if (err) {
+		sd_err(sd, "error copying firmware to device\n");
+		goto load_failed;
+	}
+
+	return 0;
+
+load_failed:
+
+	sd_err(sd, "could not load firmware\n");
+	return err;
+}
+
+static int start_fw(struct fsubdev *sd)
+{
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	int err;
+
+	mbdb_tile_number_set(sd);
+
+	sd_dbg(sd, "Starting firmware\n");
+
+	err = ops_fw_start(sd);
+	if (err)
+		goto start_failed;
+
+	err = ops_fw_version(sd, fw_version);
+	if (err)
+		goto start_failed;
+
+	report_fw_info(sd, fw_version, "after firmware start");
+
+	if (!has_all_opcodes(fw_version->supported_opcodes,
+			     required_runtime_opcodes)) {
+		sd_err(sd, "Required FW opcodes not supported\n");
+		err = -EPERM;
+		goto start_failed;
+	}
+
+	return 0;
+
+start_failed:
+	sd_err(sd, "could not start firmware\n");
+	return err;
+}
+
+static int set_roption(struct fsubdev *sd)
+{
+	u32 reg = firmware_roption;
+	int err;
+
+	sd_dbg(sd, "setting roption: 0x%08x\n", reg);
+
+	err = ops_csr_raw_write(sd, CSR_ROPTION, &reg, sizeof(reg), false);
+	if (err)
+		sd_err(sd, "failed to set firmware roption register: %d\n", err);
+
+	return err;
+}
+
+#define OP_ERR_NOT_SET	(999)
+
+static int copy_ini_to_device(struct fsubdev *sd, const u8 *data, size_t size)
+{
+	struct mbdb_op_ini_table_load_req ini = {};
+	u32 *end = (u32 *)(data + size);
+	u32 *dword = (u32 *)data;
+	u32 op_err = OP_ERR_NOT_SET;
+	int err = -EINVAL;
+	u32 *crc;
+	u32 cnt;
+
+	sd_dbg(sd, "Loading INI file, size=%ld\n", size);
+
+	while (dword + 2 < end) {
+		ini.header1 = *dword++;
+		ini.header2 = *dword++;
+
+		sd_dbg(sd,
+		       "HDR1/HDR2=0x%08x/0x%08x cnt=%d, left=%ld, index=%d, type=%d\n",
+		       ini.header1, ini.header2, (ini.header1 >> 16) & 0xfff,
+		       end - dword, ini.header1 & 0x3f, ini.header1 >> 28);
+
+		if (ini.header1 != ~ini.header2) {
+			sd_err(sd, "Invalid INIBIN header\n");
+			goto end;
+		}
+		cnt = (ini.header1 >> 16) & 0xfff;
+		crc = dword + cnt;
+		if (crc >= end) {
+			sd_err(sd, "Incomplete INIBIN block\n");
+			goto end;
+		}
+
+		sd_dbg(sd, "WALLOC dwords=0x%x\n", cnt);
+		err = ops_walloc(sd, cnt, &ini.address);
+		if (err) {
+			sd_err(sd, "FW could not allocate INIBIN space\n");
+			goto end;
+		}
+
+		sd_dbg(sd, "CSR_RAW_WR address=ADDR len=%lu\n",
+		       cnt * sizeof(u32));
+
+		err = ops_mem_posted_wr(sd, ini.address, (u8 *)dword,
+					cnt * sizeof(u32));
+		if (err) {
+			sd_err(sd, "Error writing INIBIN block\n");
+			goto end;
+		}
+
+		sd_dbg(sd, "INI_TABLE_LOAD header=0x%08x crc=0x%08x\n",
+		       ini.header1, *crc);
+
+		ini.crc = *crc;
+
+		err = ops_ini_table_load(sd, &ini, &op_err);
+		if (err) {
+			sd_err(sd, "Error loading INIBIN block, err %d, op_err %u\n", err, op_err);
+			goto end;
+		}
+
+		if (op_err) {
+			/* FW should return 0 if successful, 1 if no data or CRC error */
+			sd_err(sd, "FW rejected INIBIN block, op_err %u\n", op_err);
+			err = -ENODATA;
+			goto end;
+		}
+
+		dword = (crc + 1);
+	}
+
+	err = set_roption(sd);
+	if (err)
+		goto end;
+
+	sd_dbg(sd, "INI_LOADED_SET\n");
+	err = ops_ini_loaded_set(sd, false);
+	if (err)
+		goto end;
+
+	sd_dbg(sd, "ini load complete\n");
+
+end:
+	return err;
+}
+
+static int read_spi_data(struct fdev *dev, loff_t offset, size_t size, void *buf, const char *desc)
+{
+	size_t bytes_read = 0;
+	int err = -ENODEV;
+
+	if (dev->psc.mtd)
+		err = mtd_read(dev->psc.mtd, offset, size, &bytes_read, (u_char *)buf);
+
+	if (!err && bytes_read != size)
+		err = -ENODATA;
+
+	if (err)
+		dev_err(fdev_dev(dev), "Error %d reading PSC %s, read %lu/%lu bytes\n", err, desc,
+			bytes_read, size);
+
+	return err;
+}
+
+/**
+ * check_and_extract_ini_data() - Check and if necessary extract INIBIN data for subdevice
+ *
+ * @dev: fabric device object
+ * @sd_idx: subdevice index
+ * @item: reference to PSC index data for this subdevice
+ *
+ * If the entire PSCBIN is in memory, simply verify any section-specific CRC values.
+ *
+ * If not, make sure the INIBIN data is in @dev->psc.ini_buf[sd_idx] Data is loaded from NVMEM and
+ * CRC-checked. If multiple subdevices refer to the same INIBIN data, buffer pointers are reused.
+ * request_pscdata_from_spi must set dev->psc.mtd if reading from SPI.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+static int check_and_extract_ini_data(struct fdev *dev, u8 sd_idx, const struct psc_item *item)
+{
+	const struct psc_data *psc = (const struct psc_data *)dev->psc.data;
+	loff_t offset;
+	u32 check_crc;
+	u8 buf_idx;
+	u8 *buf;
+	int err;
+
+	if (sd_idx >= IAF_MAX_SUB_DEVS) {
+		dev_err(fdev_dev(dev), "Illegal subdevice index %u for INI_BIN data\n", sd_idx);
+		return -EINVAL;
+	}
+
+	if (full_pscbin_in_memory(dev, psc->identifier.psc_format_version)) {
+		if (psc_item_crc_ok(psc, item))
+			return 0;
+
+		dev_err(fdev_dev(dev), "INI_BIN CRC mismatch\n");
+		return -EIO;
+	}
+
+	/*
+	 * get INI_BIN data for this subdevice
+	 */
+
+	/* if INI_BIN was already extracted for another subdevice, use it */
+	for (buf_idx = 0; buf_idx < sd_idx; ++buf_idx)
+		if (dev->psc.ini_buf[buf_idx].idx == item->idx &&
+		    dev->psc.ini_buf[buf_idx].size == item->size) {
+			dev->psc.ini_buf[sd_idx].data = dev->psc.ini_buf[buf_idx].data;
+			dev->psc.ini_buf[sd_idx].idx = item->idx;
+			dev->psc.ini_buf[sd_idx].size = item->size;
+			dev->psc.ini_buf[sd_idx].do_not_free = true;
+			return 0;
+		}
+
+	/* otherwise extract the INI_BIN data for this subdevice */
+	buf = kmalloc(item->size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	offset = SPI_HEADER_SIZE + sizeof(*psc) + item->idx;
+	err = read_spi_data(dev, offset, item->size, buf, "INI_BIN data");
+	if (err)
+		goto fail;
+
+	offset += item->size + PAD_TO(u32, item->size);
+	err = read_spi_data(dev, offset, sizeof(u32), &check_crc, "INI_BIN CRC");
+	if (err)
+		goto fail;
+
+	if (check_crc != crc32c_with_padding(buf, item->size)) {
+		dev_err(fdev_dev(dev), "INI_BIN CRC mismatch\n");
+		goto fail;
+	}
+
+	dev->psc.ini_buf[buf_idx].data = buf;
+	dev->psc.ini_buf[buf_idx].idx = item->idx;
+	dev->psc.ini_buf[buf_idx].size = item->size;
+	dev->psc.ini_buf[sd_idx].do_not_free = false;
+
+	return 0;
+
+fail:
+	kfree(buf);
+	return -EIO;
+}
+
+static bool exceeds_psc_data_bounds(const struct psc_item *item,
+				    const struct psc_identifier *psc_id, u32 data_size)
+{
+	if (!psc_has_per_item_crc(psc_id->psc_format_version))
+		return (item->idx + item->size > data_size);
+
+	return (item->idx + item->size + PAD_TO(u32, item->size) + sizeof(u32) > data_size);
+}
+
+/**
+ * check_and_copy_psc_string() - Extract and copy a string from the PSC data
+ *
+ * @dev: fabric device object
+ * @item: reference to PSC index data for this string
+ *
+ * If the entire PSCBIN is in memory, verify any section-specific CRC values and return a copy
+ * of the string data.
+ *
+ * If not, extract the data from NVMEM and verify its CRC. request_pscdata_from_spi must set
+ * dev->psc.mtd if reading from SPI.
+ *
+ * Return: pointer to a new NUL-terminated string on success, NULL on error
+ */
+static char *check_and_copy_psc_string(struct fdev *dev, const struct psc_item *item)
+{
+	const struct psc_data *psc = (const struct psc_data *)dev->psc.data;
+	unsigned int offset;
+	u32 check_crc;
+	char *buf;
+	int err;
+
+	if (full_pscbin_in_memory(dev, psc->identifier.psc_format_version)) {
+		if (psc_item_crc_ok(psc, item))
+			return kmemdup_nul(&psc->data[item->idx], item->size, GFP_KERNEL);
+
+		dev_err(fdev_dev(dev), "PSC string data CRC mismatch\n");
+		return NULL;
+	}
+
+	buf = kmalloc(item->size + 1, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	offset = SPI_HEADER_SIZE + sizeof(*psc) + item->idx;
+	err = read_spi_data(dev, offset, item->size, buf, "string");
+	if (err)
+		goto fail;
+
+	buf[item->size] = '\0';
+
+	offset += item->size + PAD_TO(u32, item->size);
+	err = read_spi_data(dev, offset, sizeof(u32), &check_crc, "string CRC");
+	if (err)
+		goto fail;
+
+	if (check_crc != crc32c_with_padding((u8 *)buf, item->size)) {
+		dev_err(fdev_dev(dev), "PSC string CRC mismatch\n");
+		goto fail;
+	}
+
+	return buf;
+
+fail:
+	kfree(buf);
+	return NULL;
+}
+
+/**
+ * read_presence_config() - Copy presence config data from PSC
+ *
+ * @config: pointer to presence config header to populate
+ * @dev: fabric device object
+ * @item: reference to PSC index data for the presence config section
+ *
+ * If the entire PSCBIN is in memory, copy the presence config header from the identified section.
+ *
+ * If not, extract the data from NVMEM and verify its CRC. request_pscdata_from_spi must set
+ * dev->psc.mtd if reading from SPI.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+static int read_presence_config(struct psc_presence_config *config, struct fdev *dev,
+				const struct psc_item *item)
+{
+	const struct psc_data *psc = (const struct psc_data *)dev->psc.data;
+	unsigned int offset;
+	int err;
+
+	if (!psc_has_presence_rules(psc->identifier.psc_format_version)) {
+		dev_err(fdev_dev(dev), "PSC version does not support presence rules\n");
+		return -EINVAL;
+	}
+
+	if (item->size < sizeof(*config)) {
+		dev_err(fdev_dev(dev), "Incomplete presence config header\n");
+		return -ENODATA;
+	}
+
+	if (full_pscbin_in_memory(dev, psc->identifier.psc_format_version)) {
+		memcpy(config, &psc->data[item->idx], sizeof(*config));
+	} else {
+		offset = SPI_HEADER_SIZE + sizeof(*psc) + item->idx;
+		err = read_spi_data(dev, offset, sizeof(*config), config, "presence data");
+		if (err)
+			return -ENOENT;
+	}
+
+	if (config->crc32c_hdr != crc32c(0, config, offsetof(typeof(*config), crc32c_hdr))) {
+		dev_err(fdev_dev(dev), "Presence config header CRC mismatch\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * check_and_copy_presence_rules() - Extract and copy presence rules from PSC data
+ *
+ * @dev: fabric device object
+ * @item: reference to PSC index data for the presence rules section
+ * @subitem: reference to presence config index data for this device
+ *
+ * If the entire PSCBIN is in memory, verify section-specific CRC values and return a copy of the
+ * presence rules for this device.
+ *
+ * If not, extract the data from NVMEM and verify its CRC. request_pscdata_from_spi must set
+ * dev->psc.mtd if reading from SPI.
+ *
+ * Return: pointer to a new array of presence_data on success, NULL on error
+ */
+static struct psc_presence_rule *check_and_copy_presence_rules(struct fdev *dev,
+							       const struct psc_item *item,
+							       const struct psc_item *subitem)
+{
+	const struct psc_data *psc = (const struct psc_data *)dev->psc.data;
+	struct psc_presence_config *config;
+	struct psc_presence_rule *buf;
+	unsigned int offset;
+	u32 check_crc;
+	int err;
+
+	if (!psc_has_presence_rules(psc->identifier.psc_format_version)) {
+		dev_err(fdev_dev(dev), "PSC version does not support presence rules\n");
+		return NULL;
+	}
+
+	if (full_pscbin_in_memory(dev, psc->identifier.psc_format_version)) {
+		u32 *crc;
+
+		config = (struct psc_presence_config *)&psc->data[item->idx];
+		crc = (u32 *)&config->data[subitem->idx + subitem->size];
+		if (*crc != crc32c(0, &config->data[subitem->idx], subitem->size)) {
+			dev_err(fdev_dev(dev), "Presence rules CRC mismatch\n");
+			return NULL;
+		}
+
+		return kmemdup(&config->data[subitem->idx], subitem->size, GFP_KERNEL);
+	}
+
+	buf = kmalloc(item->size, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	offset = SPI_HEADER_SIZE + sizeof(*psc) + item->idx + sizeof(*config) + subitem->idx;
+	err = read_spi_data(dev, offset, subitem->size, buf, "presence rules");
+	if (err)
+		goto fail;
+
+	offset += subitem->size;
+	err = read_spi_data(dev, offset, sizeof(u32), &check_crc, "presence rules CRC");
+	if (err)
+		goto fail;
+
+	if (check_crc != crc32c(0, buf, subitem->size)) {
+		dev_err(fdev_dev(dev), "Presence rules CRC mismatch\n");
+		goto fail;
+	}
+
+	return buf;
+
+fail:
+	kfree(buf);
+	return NULL;
+}
+
+static int parse_presence_rules(struct fdev *dev, const struct psc_item *item)
+{
+	struct psc_presence_config config;
+	struct psc_item *subitem;
+	int err;
+
+	err = read_presence_config(&config, dev, item);
+	if (err)
+		goto end;
+
+	subitem = &config.rules[dev->pd->socket_id];
+	if (!subitem->size)
+		return 0;
+
+	dev->psc.presence_rules = check_and_copy_presence_rules(dev, item, subitem);
+	err = dev->psc.presence_rules ? 0 : -ENOENT;
+	if (err)
+		goto end;
+
+	dev->psc.n_presence_rules = subitem->size / sizeof(struct psc_presence_rule);
+
+	if (dev->psc.n_presence_rules) {
+		struct psc_presence_rule *rule = dev->psc.presence_rules;
+		int i;
+
+		for (i = 0; i < dev->psc.n_presence_rules; ++i, ++rule) {
+			dev_dbg(fdev_dev(dev), "Presence rule %d: %u:%u sd:%x p:%03x\n", i,
+				rule->method, rule->index, rule->subdev_map, rule->port_map);
+		}
+	}
+
+end:
+	if (err)
+		dev_err(fdev_dev(dev), "PSC invalid presence rules\n");
+
+	return err;
+}
+
+static int validate_psc(struct fdev *dev)
+{
+	const struct psc_item *crc_data = NULL;
+	const struct psc_item *presence_data;
+	const struct psc_identifier *psc_id;
+	const struct psc_item *product_name;
+	const struct psc_item *brand_name;
+	const struct psc_item *cust_data;
+	const struct psc_item *ext_data;
+	const struct psc_item *ini_name;
+	const struct psc_item *comment;
+	const struct psc_item *ini_bin;
+	const u32 *hdr_crc32c;
+	size_t hdr_crc_off;
+	size_t hdr_size;
+	u32 form_factor;
+	const u8 *data;
+	u32 data_size;
+	u32 cfg_ver;
+	int err = 0;
+	u32 flags;
+	u32 date;
+	u32 time;
+	u8 i;
+
+	if (WARN_ON(dev->pd->socket_id >= MAX_SOCKET_IDS || dev->pd->sd_cnt > IAF_MAX_SUB_DEVS))
+		return -EINVAL;
+
+	if (dev->psc.size < sizeof(*psc_id) || !dev->psc.data) {
+		dev_err(fdev_dev(dev), "No PSC header found\n");
+		return -ENODATA;
+	}
+
+	psc_id = (const struct psc_identifier *)dev->psc.data;
+
+	if (psc_id->magic != PSCBIN_MAGIC_NUMBER) {
+		dev_err(fdev_dev(dev), "Invalid PSC header found\n");
+		return -ENOENT;
+	}
+
+	switch (psc_id->psc_format_version) {
+	case PSCBIN_VERSION_V0:
+	case PSCBIN_VERSION_V2:
+	case PSCBIN_VERSION_CURRENT:
+		hdr_size = sizeof(struct psc_data);
+		if (dev->psc.size >= hdr_size) {
+			const struct psc_data *psc;
+
+			psc = (const struct psc_data *)dev->psc.data;
+			form_factor = psc->form_factor;
+			cfg_ver = psc->cfg_version;
+			date = psc->date;
+			time = psc->time;
+			flags = psc->flags;
+			data_size = psc->data_size;
+			brand_name = &psc->brand_name;
+			product_name = &psc->product_name;
+			comment = &psc->comment;
+			ini_name = psc->ini_name;
+			ini_bin = psc->ini_bin;
+			ext_data = &psc->ext_data;
+			cust_data = &psc->cust_data;
+			presence_data = &psc->presence_data;
+			hdr_crc32c = &psc->crc32c_hdr;
+			hdr_crc_off = offsetof(struct psc_data, crc32c_hdr);
+			data = psc->data;
+		} else {
+			dev_err(fdev_dev(dev), "Incomplete PSC header\n");
+			return -ENODATA;
+		}
+		break;
+
+	default:
+		dev_err(fdev_dev(dev), "Unsupported PSC version %u detected\n",
+			psc_id->psc_format_version);
+		return -ENOENT;
+	}
+
+	/* V2 format has single data checksum (presence_data replaces it in V3) */
+	if (psc_id->psc_format_version < PSCBIN_VERSION_V3) {
+		crc_data = presence_data;
+		presence_data = NULL;
+	}
+
+	if (full_pscbin_in_memory(dev, psc_id->psc_format_version) &&
+	    hdr_size + data_size > dev->psc.size) {
+		dev_err(fdev_dev(dev), "PSC data incomplete\n");
+		return -ENODATA;
+	}
+
+	/* Check header CRC */
+	if (*hdr_crc32c != crc32c(0, dev->psc.data, hdr_crc_off)) {
+		dev_err(fdev_dev(dev), "PSC header CRC mismatch\n");
+		return -ENOENT;
+	}
+
+	/* Check overall data CRC if present */
+	if (crc_data) {
+		const u32 *data_crc32c;
+
+		if (crc_data->size != sizeof(u32) ||
+		    crc_data->idx + crc_data->size > data_size) {
+			dev_err(fdev_dev(dev), "PSC data CRC not found\n");
+			return -ENOENT;
+		}
+
+		data_crc32c = (const u32 *)&data[crc_data->idx];
+		if (*data_crc32c != crc32c(0, data, crc_data->idx)) {
+			dev_err(fdev_dev(dev), "PSC data CRC mismatch\n");
+			return -ENOENT;
+		}
+	}
+
+	/*
+	 * validate PSC fields
+	 */
+
+	if (form_factor >= FORM_FACTOR_END) {
+		dev_err(fdev_dev(dev), "PSC invalid form factor specified\n");
+		return -ENOENT;
+	}
+
+	if (!valid_bcd_date(date)) {
+		dev_err(fdev_dev(dev), "PSC invalid date format\n");
+		return -ENOENT;
+	}
+
+	if (!valid_bcd_time(time)) {
+		dev_err(fdev_dev(dev), "PSC invalid time format\n");
+		return -ENOENT;
+	}
+
+	if (flags)
+		dev_warn(fdev_dev(dev), "Unrecognised PSC flags: %08x\n", flags);
+
+	if (exceeds_psc_data_bounds(brand_name, psc_id, data_size)) {
+		dev_err(fdev_dev(dev), "PSC invalid brand data\n");
+		return -ENOENT;
+	}
+
+	if (exceeds_psc_data_bounds(product_name, psc_id, data_size)) {
+		dev_err(fdev_dev(dev), "PSC invalid product data\n");
+		return -ENOENT;
+	}
+
+	if (exceeds_psc_data_bounds(comment, psc_id, data_size)) {
+		dev_err(fdev_dev(dev), "PSC invalid comment data\n");
+		return -ENOENT;
+	}
+
+	scnprintf(dev->psc.version, sizeof(dev->psc.version),
+		  "version %u : %04x/%02x/%02x %02x:%02x:%02x",
+		  cfg_ver,
+		  date >> 16, date >> 8 & 0xff, date & 0xff,
+		  time >> 16, time >> 8 & 0xff, time & 0xff);
+
+	/* Use as NULL terminated strings... */
+	if (brand_name->size)
+		dev->psc.brand = check_and_copy_psc_string(dev, brand_name);
+
+	if (product_name->size)
+		dev->psc.product = check_and_copy_psc_string(dev, product_name);
+
+	dev_info(fdev_dev(dev), "PSC [%s] [%s] %s\n", dev->psc.brand,
+		 dev->psc.product, dev->psc.version);
+
+	if (psc_id->psc_format_version == PSCBIN_VERSION_V0) {
+		dev_err(fdev_dev(dev), "SPI default NULL PSC provisioned, valid PSCBIN required\n");
+		return -ENODATA;
+	}
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i) {
+		u8 n = dev->pd->socket_id * IAF_MAX_SUB_DEVS + i;
+
+		if (exceeds_psc_data_bounds(&ini_name[n], psc_id, data_size)) {
+			dev_err(fdev_dev(dev), "PSC invalid ini name %u\n", n);
+			return -ENOENT;
+		}
+
+		if (!ini_bin[n].size) {
+			dev_err(fdev_dev(dev), "PSC missing inibin[%u]\n", n);
+			return -ENODATA;
+		}
+
+		if (exceeds_psc_data_bounds(&ini_bin[n], psc_id, data_size)) {
+			dev_err(fdev_dev(dev), "PSC inibin[%u] outside of PSC data\n", n);
+			return -EFBIG;
+		}
+
+		err = check_and_extract_ini_data(dev, i, &ini_bin[n]);
+
+		if (err) {
+			dev_err(fdev_dev(dev), "PSC inibin[%u] invalid\n", n);
+			goto end;
+		}
+	}
+
+	if (exceeds_psc_data_bounds(ext_data, psc_id, data_size)) {
+		dev_err(fdev_dev(dev), "PSC invalid extra data\n");
+		return -ENOENT;
+	}
+
+	if (exceeds_psc_data_bounds(cust_data, psc_id, data_size)) {
+		dev_err(fdev_dev(dev), "PSC invalid customer data\n");
+		return -ENOENT;
+	}
+
+	if (presence_data && presence_data->size)
+		err = parse_presence_rules(dev, presence_data);
+
+end:
+	return err;
+}
+
+static int init_fw(struct fsubdev *sd)
+{
+	struct fdev *dev = sd->fdev;
+	const struct psc_data *psc;
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	u8 socket = sd->fdev->pd->socket_id;
+	u8 sd_idx = sd_index(sd);
+	const u8 *data;
+	size_t size;
+	int cnt;
+	int err;
+
+	err = wait_for_completion_killable(&dev->psc.done);
+	if (err) {
+		sd_err(sd, "Wait for psc done failed: %d\n", err);
+		return err;
+	}
+
+	if (dev->psc.err)
+		return dev->psc.err;
+
+	/* psc is only valid after the completion and if no error occurred */
+	psc = (const struct psc_data *)READ_ONCE(dev->psc.data);
+
+	if (full_pscbin_in_memory(dev, psc->identifier.psc_format_version)) {
+		size = psc->ini_bin[socket * IAF_MAX_SUB_DEVS + sd_idx].size;
+		data = &psc->data[psc->ini_bin[socket * IAF_MAX_SUB_DEVS + sd_idx].idx];
+	} else {
+		size = dev->psc.ini_buf[sd_idx].size;
+		data = dev->psc.ini_buf[sd_idx].data;
+	}
+	err = data && size ? 0 : -ENOENT;
+	if (err) {
+		sd_err(sd, "ini_bin data missing\n");
+		goto init_failed;
+	}
+
+	err = copy_ini_to_device(sd, data, size);
+	if (err)
+		goto init_failed;
+
+	/*
+	 * FW documentation indicates to wait 20 ms, then verify that the INIT
+	 * bit reported by FW_VERSION is set. Allow for slightly longer delays
+	 * in case the FW is somehow busy.
+	 */
+	cnt = 1;
+	do {
+		msleep(20);
+		err = ops_fw_version(sd, fw_version);
+	} while (!err &&
+		 !(fw_version->environment & FW_VERSION_INIT_BIT) &&
+		 cnt++ < MAX_20MS_DELAYS);
+
+	if (err)
+		goto init_failed;
+
+	sd_dbg(sd, "FW init took at least %d ms\n", 20 * cnt);
+
+	if (!(fw_version->environment & FW_VERSION_INIT_BIT)) {
+		sd_err(sd, "FW never finished initializing\n");
+		err = -EBUSY;
+		goto init_failed;
+	}
+
+	report_fw_info(sd, fw_version, "after firmware init");
+
+	if (!has_all_opcodes(fw_version->supported_opcodes,
+			     required_runtime_opcodes)) {
+		sd_err(sd, "Required FW opcodes not supported\n");
+		err = -EPERM;
+		goto init_failed;
+	}
+
+	return 0;
+
+init_failed:
+	sd_err(sd, "could not initialize firmware\n");
+	return err;
+}
+
+static int request_pscdata_from_fw(struct fdev *dev, const char *filename)
+{
+	int err;
+
+	err = request_firmware(&dev->psc.as_fw, filename, fdev_dev(dev));
+	if (err) {
+		dev_err(fdev_dev(dev), "%s not found via FW API\n", filename);
+		goto end;
+	}
+
+	dev->psc.data = dev->psc.as_fw->data;
+	dev->psc.size = dev->psc.as_fw->size;
+	dev_info(fdev_dev(dev), "Loaded %s via FW API\n", filename);
+
+end:
+	return err;
+}
+
+static int spi_driver_match_fn(struct device *dev, const void *data)
+{
+	return strcmp(dev_driver_string(dev), "mtd_intel_dg") == 0;
+}
+
+/**
+ * request_pscdata_from_spi() - Read PSC data from SPI flash into device object
+ *
+ * @dev: Fabric device object
+ *
+ * Attempts to locate the PSC SPI region using the MTD infrastructure.
+ *
+ * Return: 0 on success, -ENODEV if SPI or MTD device not found (caller should retry after giving
+ * SPI time to load), other values indicate a non-recoverable error.
+ */
+static int request_pscdata_from_spi(struct fdev *dev)
+{
+	struct psc_data *header;
+	struct device *spi_dev;
+	struct mtd_info *mtd;
+	unsigned int offset;
+	char *mtd_name;
+	u8 *buf = NULL;
+	size_t size;
+	int err = 0;
+
+	/* see if the SPI device that is a child of our parent i915 device is ready */
+	spi_dev = device_find_child(dev->pdev->dev.parent, NULL, spi_driver_match_fn);
+	if (!spi_dev)
+		return dev_warn_probe(&dev->pdev->dev, -ENODEV, "MTD device not found");
+
+	mtd_name = kasprintf(GFP_KERNEL, "%s%s", dev_name(spi_dev), PSC_REGION_QUALIFIER);
+	put_device(spi_dev);
+	if (!mtd_name)
+		return -ENOMEM;
+
+	/* get_mtd_device_nm returns -ENODEV if not found */
+	mtd = get_mtd_device_nm(mtd_name);
+	kfree(mtd_name);
+	if (IS_ERR(mtd)) {
+		dev_warn(&dev->pdev->dev, "Could not get MTD device: %pe", mtd);
+		return PTR_ERR(mtd);
+	}
+
+	dev->psc.mtd = mtd;
+
+	header = kmalloc(sizeof(*header), GFP_KERNEL);
+
+	if (!header) {
+		err = -ENOMEM;
+		goto cleanup;
+	}
+
+	offset = SPI_HEADER_SIZE;
+	err = read_spi_data(dev, offset, sizeof(*header), header, "header");
+	if (err)
+		goto cleanup;
+
+	/*
+	 * V2 or earlier: read the rest of the PSCBIN data now, required for CRC checking
+	 * V3 or later: read only the header now, each data item has its own CRC
+	 */
+	if (header->identifier.psc_format_version < PSCBIN_VERSION_V3) {
+		size = struct_size(header, data, header->data_size);
+		if (size > MAX_PSC_SIZE) {
+			err = -EBADF;
+			goto cleanup;
+		}
+
+		buf = kmalloc(size, GFP_KERNEL);
+		if (!buf) {
+			err = -ENOMEM;
+			goto cleanup;
+		}
+
+		memcpy(buf, header, sizeof(*header));
+		offset += sizeof(*header);
+
+		err = read_spi_data(dev, offset, header->data_size, buf + sizeof(*header), "data");
+		if (err)
+			goto cleanup;
+	} else {
+		size = sizeof(*header);
+		buf = (u8 *)header;
+		header = NULL;
+	}
+
+	dev->psc.size = size;
+	dev->psc.data = buf;
+
+cleanup:
+
+	if (err) {
+		dev_err(fdev_dev(dev), "Error %d loading PSC\n", err);
+		kfree(buf);
+	}
+
+	kfree(header);
+
+	return err;
+}
+
+static void release_pscdata(struct fdev *dev)
+{
+	if (dev->psc.as_fw)
+		release_firmware(dev->psc.as_fw);
+	else
+		kfree(dev->psc.data);
+
+	dev->psc.as_fw = NULL;
+	dev->psc.data = NULL;
+	dev->psc.size = 0;
+}
+
+static void fw_initialization_complete(struct fdev *dev)
+{
+	/*
+	 * A failure before init_fw() will leave memory in use by the PSCBIN
+	 * thread.  Wait for PSCBIN thread to complete before cleanup.
+	 * The abort ensures clean up if an error has occurred by causing the psc thread to exit.
+	 * Completing the abort completion wakes the PSC thread (if it exists) and ensures it
+	 * reaches the done completion in a timely manner, avoiding the need to handle timeouts on
+	 * the done completion here.
+	 */
+
+	complete_all(&dev->psc.abort);
+	wait_for_completion(&dev->psc.done);
+
+	if (is_fdev_registered(dev))
+		dev_info(fdev_dev(dev), "Firmware Version: %s\n",
+			 dev->sd[0].fw_version.fw_version_string);
+
+	/* release resources required for FW initialization */
+	release_pscdata(dev);
+	release_firmware(dev->fw);
+
+	/* complete remaining device initialization */
+	iaf_complete_init_dev(dev);
+}
+
+static int verify_preload(struct fsubdev *sd)
+{
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	int err;
+
+	/* initial query to preloaded firmware likely to be a seq error */
+	err = ops_fw_version(sd, fw_version);
+	if (err == MBOX_RSP_STATUS_SEQ_NO_ERROR)
+		err = ops_fw_version(sd, fw_version);
+
+	if (err) {
+		sd_err(sd, "fw version query failed: %d\n", err);
+		return err;
+	}
+
+	if (!(fw_version->environment & FW_VERSION_ENV_BIT)) {
+		sd_err(sd, "FW not preloaded\n");
+		return -EINVAL;
+	}
+
+	report_fw_info(sd, fw_version, "preloaded firmware");
+
+	if (!(fw_version->environment & FW_VERSION_INIT_BIT)) {
+		sd_err(sd, "FW not ready\n");
+		return -EINVAL;
+	}
+
+	if (!has_all_opcodes(fw_version->supported_opcodes, required_runtime_opcodes)) {
+		sd_err(sd, "Required FW opcodes not supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void load_and_init_subdev(struct fsubdev *sd)
+{
+	struct fdev *dev = sd->fdev;
+	int err;
+
+	if (dev_is_preload(sd->fdev)) {
+		err = verify_preload(sd);
+		if (err)
+			goto cleanup;
+	} else {
+		err = load_fw(sd);
+		if (err)
+			goto cleanup;
+
+		err = start_fw(sd);
+		if (err)
+			goto cleanup;
+
+		err = init_fw(sd);
+		if (err)
+			goto cleanup;
+	}
+
+	WRITE_ONCE(sd->fw_running, true);
+
+	if (!dev_is_runtime_debug(sd->fdev)) {
+		err = initialize_fports(sd);
+		if (err)
+			goto cleanup;
+	} else {
+		sd_dbg(sd, "debug mode: skipping port init\n");
+	}
+
+	reset_errors(sd);
+
+	sd_dbg(sd, "subdevice init complete\n");
+
+cleanup:
+
+	if (err)
+		indicate_subdevice_error(sd, SD_ERROR_FW);
+
+	/* clean up/complete device init if this is the last sd */
+	if (atomic_dec_and_test(&dev->fwinit_refcnt))
+		fw_initialization_complete(dev);
+
+	/* release the per-sd initialization flow reference on the parent */
+	fdev_put(dev);
+}
+
+static void fetch_tx_calibration(struct fdev *dev)
+{
+	const struct psc_data *psc_blob = (const struct psc_data *)dev->psc.data;
+	u32 txcal_start = round_up(psc_blob->data_size, sizeof(u32));
+	unsigned int spi_offset = SPI_HEADER_SIZE + struct_size(psc_blob, data, txcal_start);
+	struct txcal_blob hdr_from_spi;
+	const struct txcal_blob *hdr;
+	size_t blob_size;
+	int err;
+
+	if (dev->psc.as_fw) {
+		const struct txcal_settings *psc_buf_end;
+
+		hdr = (const struct txcal_blob *)&psc_blob->data[txcal_start];
+		psc_buf_end = (const struct txcal_settings *)&dev->psc.data[dev->psc.size];
+
+		/* verify both header and data fit */
+		if (hdr->data > psc_buf_end || &hdr->data[hdr->num_settings] > psc_buf_end) {
+			dev_warn(fdev_dev(dev), "TX calibration header not in PSC image");
+			return;
+		}
+	} else {
+		/* attempt to read header from SPI */
+		hdr = &hdr_from_spi;
+		err = read_spi_data(dev, spi_offset, sizeof(hdr_from_spi), &hdr_from_spi,
+				    "TX calibration header");
+		if (err) {
+			dev_warn(fdev_dev(dev), "TX calibration header does not fit in SPI");
+			return;
+		}
+	}
+
+	/* verify txcal_blob */
+
+	blob_size = struct_size(hdr, data, hdr->num_settings);
+
+	if (hdr->magic[0] != TXCAL_BLOB_MAGIC_0 || hdr->magic[1] != TXCAL_BLOB_MAGIC_1 ||
+	    hdr->magic[2] != TXCAL_BLOB_MAGIC_2 || hdr->magic[3] != TXCAL_BLOB_MAGIC_3) {
+		dev_warn(fdev_dev(dev), "TX calibration header not found");
+		return;
+	}
+
+	if (hdr->crc32c_hdr != crc32c(0, hdr, offsetof(struct txcal_blob, crc32c_hdr))) {
+		dev_warn(fdev_dev(dev), "TX calibration header CRC mismatch\n");
+		goto error;
+	}
+
+	if (hdr->format_version < TXCAL_VERSION_MIN || hdr->format_version > TXCAL_VERSION_MAX) {
+		dev_warn(fdev_dev(dev), "TX calibration unsupported version\n");
+		goto error;
+	}
+
+	if (hdr->size < blob_size) {
+		dev_warn(fdev_dev(dev), "TX calibration data size mismatch\n");
+		goto error;
+	}
+
+	if (!valid_bcd_date(hdr->date)) {
+		dev_warn(fdev_dev(dev), "TX calibration invalid date format\n");
+		goto error;
+	}
+
+	if (!valid_bcd_time(hdr->time)) {
+		dev_warn(fdev_dev(dev), "TX calibration invalid time format\n");
+		goto error;
+	}
+
+	/* BCD-encoded date/time: upper time byte should be 0x00, but ensure all bits are shown */
+	dev_info(fdev_dev(dev), "TX calibration version %u : %04x/%02x/%02x %02x:%02x:%02x",
+		 hdr->cfg_version, hdr->date >> 16, hdr->date >> 8 & 0xff, hdr->date & 0xff,
+		 hdr->time >> 16, hdr->time >> 8 & 0xff, hdr->time & 0xff);
+
+	dev->psc.txcal = kmalloc(blob_size, GFP_KERNEL);
+	if (!dev->psc.txcal)
+		goto error;
+
+	if (dev->psc.as_fw) {
+		memcpy(dev->psc.txcal, hdr, blob_size);
+	} else {
+		memcpy(dev->psc.txcal, hdr, sizeof(*hdr));
+		err = read_spi_data(dev,
+				    spi_offset + offsetof(struct txcal_blob, data),
+				    hdr->num_settings * sizeof(struct txcal_settings),
+				    dev->psc.txcal->data,
+				    "TX calibration data");
+		if (err) {
+			dev_warn(fdev_dev(dev), "TX calibration data does not fit in SPI");
+			goto error;
+		}
+	}
+
+	if (hdr->crc32c_data !=
+	    crc32c(0, dev->psc.txcal->data, flex_array_size(hdr, data, hdr->num_settings))) {
+		dev_warn(fdev_dev(dev), "TX calibration data CRC mismatch\n");
+		goto error;
+	}
+
+	return;
+
+error:
+	kfree(dev->psc.txcal);
+	dev->psc.txcal = NULL;
+	dev_warn(fdev_dev(dev), "TX calibration data incomplete or corrupted");
+}
+
+static void fetch_platform_specific_config(struct fdev *dev)
+{
+	bool fetching_psc_from_spi;
+	u16 cnt;
+
+	dev_dbg(fdev_dev(dev), "Reading provisioned psc data\n");
+
+	dev->psc.err = -ENOENT;
+
+	/* cnt (u16) can hold MAX_200MS_RETRIES+1 */
+	cnt = 1;
+
+	kernel_param_lock(THIS_MODULE);
+	fetching_psc_from_spi = !(psc_file_override && *psc_file_override);
+	if (!fetching_psc_from_spi)
+		dev->psc.err = request_pscdata_from_fw(dev, psc_file_override);
+	kernel_param_unlock(THIS_MODULE);
+
+	if (fetching_psc_from_spi)
+		do {
+			/* Only emit one time after 1 minute */
+			if (cnt == ONE_MINUTE_COUNT)
+				dev_info(fdev_dev(dev), "Waiting on psc data from spi device\n");
+			dev->psc.err = request_pscdata_from_spi(dev);
+		} while (dev->psc.err == -ENODEV &&
+			 cnt++ < MAX_200MS_RETRIES &&
+			 !wait_for_completion_killable_timeout(&dev->psc.abort,
+							       msecs_to_jiffies(200)));
+
+	if (dev->psc.err) {
+		dev_err(fdev_dev(dev), "Error %d requesting PSC data\n", dev->psc.err);
+		goto end;
+	}
+
+	dev->psc.err = validate_psc(dev);
+
+	fetch_tx_calibration(dev);
+
+end:
+
+	if (dev->psc.mtd) {
+		put_mtd_device(dev->psc.mtd);
+		dev->psc.mtd = NULL;
+	}
+
+	/*
+	 * Subdevice initialization threads only use the PSC data after waiting for this completion
+	 * and only if psc.err is not set
+	 *
+	 * The last subdevice initialization thread to end (successfully or in error) then calls
+	 * fw_initialization_complete(), which also waits for this completion (in case subdevice
+	 * initialization fails early) before releasing PSC data
+	 */
+
+	complete_all(&dev->psc.done);
+
+	fdev_put(dev);
+}
+
+/**
+ * prep_ops_and_fw_version - set the FW version and make sure the sequence is in line
+ * @dev: valid ANR device
+ *
+ * Make sure mailbox seq_nos are synced between KMD and FW.  If a good response
+ * is received, the driver will check that it is communicating with the bootrom
+ * and take appropriate actions if not
+ *
+ * ops_fw_version is the only ops request that does not need a ops valiation.
+ * For any ops_xxx calls, the current firmware is need.
+ *
+ * NOTE: if this is not the bootloader, later init will reset the SD.
+ *
+ * Return: 0 on success, else negative error code
+ */
+static int prep_ops_and_fw_version(struct fdev *dev)
+{
+	struct mbdb_op_fw_version_rsp *fw_version;
+	int err;
+	int i;
+
+	for (i = 0; i < dev->pd->sd_cnt; i++) {
+		fw_version = &dev->sd[i].fw_version;
+		err = ops_fw_version(&dev->sd[i], fw_version);
+		if (err == MBOX_RSP_STATUS_SEQ_NO_ERROR)
+			err = ops_fw_version(&dev->sd[i], fw_version);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static const char *select_pvc_fw(struct fsubdev *sd)
+{
+	u64 fuses = 0;
+	int err;
+
+	err = ops_csr_raw_read(sd, CSR_CP_DEV_EFUSE_VERSION, sizeof(fuses), &fuses);
+	if (err) {
+		sd_err(sd, "Failed to read efuse info: %d\n", err);
+		return NULL;
+	}
+	switch (FIELD_GET(CP_DEV_EFUSE_VERSION_VARIANT_MASK, fuses)) {
+	case CP_DEV_EFUSE_VERSION_VARIANT_NORMAL:
+		/* WA: HSD-16011092478 */
+		if (IS_ANR_STEP(sd, ANR_ARI_STEP_A0, ANR_ARI_STEP_A_LAST)) {
+			sd_info(sd, "A0 firmware\n");
+			return PVC_FW_IMAGE_DEBUG_SIGNED;
+		}
+
+		return PVC_FW_IMAGE;
+
+	case CP_DEV_EFUSE_VERSION_VARIANT_EXPORT:
+		return PVC_FW_IMAGE_EXPORT_LIMITED;
+
+	default:
+		sd_err(sd, "Invalid fuse info: %llu\n", fuses);
+		break;
+	}
+
+	return NULL;
+}
+
+static const char *get_fw_image(struct fdev *dev)
+{
+#if IS_ENABLED(CONFIG_IAF_DEBUG_ALTERNATE_FW_LOAD)
+	if (fw_image && fw_image[0])
+		return fw_image;
+#endif
+	switch (dev->pd->product) {
+	case IAF_PONTEVECCHIO:
+		return select_pvc_fw(&dev->sd[0]);
+
+	default:
+		break;
+	}
+
+	return NULL;
+}
+
+/**
+ * load_and_init_fw() - Loads and initializes the device with firmware
+ *
+ * @dev: Fabric device object
+ *
+ * Multiple work items are started with this function:
+ *  1 per device to retrieve the device PSCBIN
+ *  1 per sub-device for firmware load and initialization
+ *
+ * The firmware initialization is dependent on the PSCBIN and will block until the PSCBIN is
+ * available.
+ *
+ * The PSCBIN load is put on a work queue because it may need to wait for the SPI driver to load.
+ * If this was done inline, the wait could block the probe for MAX_200MS_RETRIES before failing.
+ *
+ * Return: 0 on success, -EINVAL if firmware cannot be found, other values indicate a
+ * non-recoverable error.
+ */
+int load_and_init_fw(struct fdev *dev)
+{
+	const char *fw_image = NULL;
+	int err;
+
+	if (dev_is_startup_debug(dev)) {
+		/* complete remaining device initialization immediately */
+		iaf_complete_init_dev(dev);
+		return 0;
+	}
+
+	err = prep_ops_and_fw_version(dev);
+	if (err) {
+		dev_err(fdev_dev(dev), "Ops sequence init failed: %d\n", err);
+		return err;
+	}
+
+	fw_image = get_fw_image(dev);
+	if (!fw_image) {
+		dev_err(fdev_dev(dev), "Could not determine fw file\n");
+		return -EINVAL;
+	}
+
+	kernel_param_lock(THIS_MODULE);
+	dev_dbg(fdev_dev(dev), "Reading firmware file: %s\n", fw_image);
+	err = request_firmware(&dev->fw, fw_image, fdev_dev(dev));
+	kernel_param_unlock(THIS_MODULE);
+
+	if (err) {
+		dev_err(fdev_dev(dev), "Could not open fw file\n");
+		return err;
+	}
+
+	err = verify_fw(dev);
+	if (err) {
+		dev_err(fdev_dev(dev), "Invalid fw file\n");
+		release_firmware(dev->fw);
+		return err;
+	}
+
+	queue_load_and_init_all_subdevs(dev);
+
+	fdev_get_early(dev);
+	queue_work(iaf_unbound_wq, &dev->psc.work);
+
+	return 0;
+}
+
+void flush_any_outstanding_fw_initializations(struct fdev *dev)
+{
+	int i;
+
+	complete_all(&dev->psc.abort);
+	flush_work(&dev->psc.work);
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i)
+		flush_work(&dev->sd[i].fw_work);
+}
+
+/*
+ * Workqueue support functions
+ */
+
+static void queue_load_and_init_all_subdevs(struct fdev *dev)
+{
+	int i;
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i) {
+		/*
+		 * each subdevice holds an initialization reference for the
+		 * lifetime of the subdevice init flow to prevent parent device
+		 * remove races.
+		 */
+		fdev_get_early(dev);
+
+		queue_work(iaf_unbound_wq, &dev->sd[i].fw_work);
+	}
+}
+
+static void wrk_load_and_init_subdev(struct work_struct *work)
+{
+	struct fsubdev *sd = container_of(work, struct fsubdev, fw_work);
+
+	load_and_init_subdev(sd);
+
+	create_optional_dev_debugfs_files(sd);
+}
+
+static void wrk_load_psc_data(struct work_struct *work)
+{
+	fetch_platform_specific_config(container_of(work, struct fdev, psc.work));
+}
diff --git a/drivers/gpu/drm/xe/fabric/fw.h b/drivers/gpu/drm/xe/fabric/fw.h
new file mode 100644
index 0000000000000..4562e7eecedf4
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/fw.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef _FW_H_
+#define _FW_H_
+
+#include "iaf_drv.h"
+
+#define FW_VERSION_INIT_BIT	BIT(1)
+#define FW_VERSION_ENV_BIT	BIT(0)
+
+void fw_init_module(void);
+void fw_init_dev(struct fdev *dev);
+int load_and_init_fw(struct fdev *dev);
+void flush_any_outstanding_fw_initializations(struct fdev *dev);
+bool is_opcode_valid(struct fsubdev *sd, u8 op_code);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/iaf_drv.h b/drivers/gpu/drm/xe/fabric/iaf_drv.h
new file mode 100644
index 0000000000000..519e9aa65e7e7
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/iaf_drv.h
@@ -0,0 +1,1341 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ */
+
+#ifndef IAF_DRV_H_INCLUDED
+#define IAF_DRV_H_INCLUDED
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+#include <linux/auxiliary_bus.h>
+#else
+#include <linux/platform_device.h>
+#endif
+#include <linux/dcache.h>
+#include <linux/irqreturn.h>
+#include <linux/mtd/mtd.h>
+#include <linux/rwsem.h>
+#include <linux/semaphore.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/kref.h>
+
+#include <drm/intel/i915_mei_iaf_interface.h>
+#include <drm/intel/intel_iaf_platform.h>
+
+#include "csr.h"
+
+#include "statedump.h"
+
+#define DRIVER_NAME "iaf"
+
+#undef pr_fmt
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#define MAILBOX_OPCODE_COUNT 256
+
+/*
+ * The maximum number of tiles for the PVC product type.
+ *
+ * Revisit if future product types or variations are developed that require
+ * a product type table.
+ */
+#define IAF_MAX_SUB_DEVS 2
+
+/*
+ * The maximum characters kept from the PSCBIN "version" information
+ */
+#define MAX_PSCBIN_VERSION 64
+
+/*
+ * Currently, ports are numbered as follows (port numbers come from PSCBIN/INIBIN data):
+ * 0 : reserved/CPORT
+ * 1-8 : fabric ports
+ * 9-11 : bridge ports
+ *
+ * The driver uses sd->fport_lpns and sd->bport_lpns to avoid hardcoding the numbering scheme,
+ * although some external interfaces such as the TX calibration blob rely on it.
+ */
+
+/* current device/firmware allows only 3 bridge ports, historically up to 4 were supported */
+#define PORT_PHYSICAL_START	(1)
+#define PORT_FABRIC_COUNT	(8)
+#define PORT_BRIDGE_COUNT	(4)
+#define PORT_COUNT		(PORT_PHYSICAL_START + PORT_FABRIC_COUNT + PORT_BRIDGE_COUNT)
+
+/* This limits the range of fabric port numbers to [PORT_PHYSICAL_START..TXCAL_PORT_COUNT]. */
+#define TXCAL_PORT_COUNT	(8)
+
+/* prevent overruns when calibration data is copied into sd->txcal[] */
+#if TXCAL_PORT_COUNT + PORT_PHYSICAL_START >= PORT_COUNT
+#error TXCAL_PORT_COUNT cannot exceed largest port number
+#endif
+
+#define CPORT_LPN_MASK BIT(0)
+
+/*
+ * Recognized discrete socket IDs
+ */
+#define MAX_SOCKET_IDS (32)
+
+/*
+ * Platforms and revisions.
+ *
+ * Note that these conform to the ANR ASIC_REV_INFO (ARI) register values,
+ * not the PCI revision IDs reported by the packaged product.
+ */
+
+#define ANR_ARI_PLATFORM	0x0101
+
+#define ANR_ARI_STEP_A0		0x00
+#define ANR_ARI_STEP_A1		0x01
+#define ANR_ARI_STEP_A_LAST	ANR_ARI_STEP_A1
+#define ANR_ARI_STEP_B0		0x10
+#define ANR_ARI_STEP_B_LAST	ANR_ARI_STEP_B0
+
+#define IS_ANR(sd) \
+	(FIELD_GET(MASK_ARI_PLATFORM, (sd)->asic_rev_info) == ANR_ARI_PLATFORM)
+
+#define IS_ANR_STEP(sd, since, until) (IS_ANR(sd) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) >= (since) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) <= (until))
+
+/*
+ * Device, subdevice and port message formats
+ *
+ * Device expands dev->name, sd/port expand relevant indices
+ * ": " separates info. *_FMT ends in ": ", *_ID_FMT does not
+ */
+
+#define DEV_ID_FMT "iaf.%d"
+#define SD_ID_FMT "sd.%d"
+#define PORT_ID_FMT "p.%d"
+
+#define DEV_FMT DEV_ID_FMT ": "
+#define SD_FMT SD_ID_FMT ": "
+#define PORT_FMT PORT_ID_FMT ": "
+
+#define DEV_SD_FMT DEV_FMT "" SD_FMT
+#define SD_PORT_FMT SD_FMT "" PORT_FMT
+
+#define DEV_SD_PORT_FMT DEV_FMT "" SD_PORT_FMT
+
+/*
+ * Subdevice-specific messaging
+ */
+
+#define sd_emerg(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_emerg(sd_dev(_sd), SD_FMT _fmt, \
+				  sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_alert(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_alert(sd_dev(_sd), SD_FMT _fmt, \
+				  sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_crit(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_crit(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_err(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_err(sd_dev(_sd), SD_FMT _fmt, \
+				sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_warn(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_warn(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_notice(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_notice(sd_dev(_sd), SD_FMT _fmt, \
+				   sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_info(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_info(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_dbg(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_dbg(sd_dev(_sd), SD_FMT _fmt, \
+				sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+/*
+ * Port-specific messaging
+ */
+
+#define fport_emerg(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_emerg(fport_dev(_p), SD_PORT_FMT _fmt, \
+				  sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_alert(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_alert(fport_dev(_p), SD_PORT_FMT _fmt, \
+				  sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_crit(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_crit(fport_dev(_p), SD_PORT_FMT _fmt, \
+				 sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_err(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_err(fport_dev(_p), SD_PORT_FMT _fmt, \
+				sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_warn(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_warn(fport_dev(_p), SD_PORT_FMT _fmt, \
+				 sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_notice(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_notice(fport_dev(_p), SD_PORT_FMT _fmt, \
+				   sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_info(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_info(fport_dev(_p), SD_PORT_FMT _fmt, \
+				 sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+#define fport_dbg(__p, _fmt, ...) \
+		do { \
+			struct fport *_p = (__p); \
+			dev_dbg(fport_dev(_p), SD_PORT_FMT _fmt, \
+				sd_index(_p->sd), _p->lpn, ##__VA_ARGS__); \
+		} while (0)
+
+/**
+ * struct mbdb_op_fw_version_rsp - currently loaded firmware information
+ * @mbox_version: this version will be 0
+ * @environment: 0 = bootloader, 1 = run-time firmware
+ * @fw_version_string: ASCII-NUL terminated version string. e.g "w.x.y.z" 255.255.255.255
+ * @supported_opcodes: bit mask of opcodes that the environment supports as requests from the host
+ */
+struct mbdb_op_fw_version_rsp {
+	u8 mbox_version;
+	u8 environment;
+	u8 fw_version_string[22];
+	DECLARE_BITMAP(supported_opcodes, MAILBOX_OPCODE_COUNT);
+} __packed;
+
+/**
+ * struct mbdb_op_switchinfo - Per-IAF subdevice information
+ * @guid: RO, from FUSES
+ * @num_ports: RO, fixed, 8, 12, or 13 (TBD)
+ * @slt_psc_ep0: RW, bit 0-4: max in-switch packet lifetime
+ *		 RO, bit 5: redundant to PSC notification
+ *		 RO, bit 6: Q7 presence?
+ * @routing_mode_supported: RO, hierarchical/linear routing enumeration
+ * @routing_mode_enabled: RW, hierarchical/linear routing enumeration
+ * @lft_top: RW, max FID value
+ * @unaligned_cnt: unaligned error count
+ * @unaligned_portwin: contents of port window csr - port being accessed
+ * @unaligned_vaddr: address being accessed
+ * @unaligned_pc: program counter
+ * @pif_data_error_cnt: load store data error count
+ * @pif_data_error_portwin: contents of port window csr - port being accessed
+ * @pif_data_error_vaddr: address being accessed
+ * @pif_data_error_pc: program counter
+ * @pif_addr_error_cnt: load store address error count
+ * @pif_addr_error_portwin: contents of port window csr - port being accessed
+ * @pif_addr_error_vaddr: address being accessed
+ * @pif_addr_error_pc: program counter
+ * @mem_scrub_size: amount of memory to scrub per pass in dwords; 0 to disable memory scrubbing
+ * @mem_scrub_count: number of times we have scrubbed memory
+ * @vff_scrub_disable: disable VFF scrubbing
+ * @vff_scrub_count: number of times we have scrubbed CSRs list
+ * @rpipe_scrub_disable: disable Routing Tables scrubbing
+ * @rpipe_scrub_count: number of times we have scrubbed URT tables
+ * @mrt_scrub_count: number of times we have scrubbed MRT tables
+ * @fouropsel_scrub_count: number of times we have scrubbed 4opsel tables
+ *
+ * Used with ops_switchinfo_set() and ops_switchinfo_get() to access
+ * switch information for the entire subdevice. A copy is maintained in
+ * &struct fsubdev.
+ */
+struct mbdb_op_switchinfo {
+	u64 guid;
+	u8 num_ports;
+#define SLT_PSC_EP0_SWITCH_LIFETIME	GENMASK(4, 0)
+#define SLT_PSC_EP0_PORT_STATE_CHANGE	BIT(5)
+#define SLT_PSC_EP0_ENHANCED_PORT_0	BIT(6)
+	u8 slt_psc_ep0;
+	u8 routing_mode_supported;
+	u8 routing_mode_enabled;
+	u32 lft_top;
+	u32 unaligned_cnt;
+	u32 unaligned_portwin;
+	u32 unaligned_vaddr;
+	u32 unaligned_pc;
+	u32 pif_data_error_cnt;
+	u32 pif_data_error_portwin;
+	u32 pif_data_error_vaddr;
+	u32 pif_data_error_pc;
+	u32 pif_addr_error_cnt;
+	u32 pif_addr_error_portwin;
+	u32 pif_addr_error_vaddr;
+	u32 pif_addr_error_pc;
+	u32 mem_scrub_size;
+	u32 mem_scrub_count;
+	u32 vff_scrub_disable;
+	u32 vff_scrub_count;
+	u32 rpipe_scrub_disable;
+	u32 rpipe_scrub_count;
+	u32 mrt_scrub_count;
+	u32 fouropsel_scrub_count;
+} __packed;
+
+/**
+ * struct portinfo - per-port information
+ * @fid: RW, port Fabric ID set by routing logic
+ * @link_down_count: RO, counter (saturating?, clearable), check at PSC
+ * @neighbor_guid: RO, from neighbor, check valid at link up
+ * @port_error_action: RW, policy bitmask, which errors cause port to bounce
+ * @neighbor_port_number: RO, from neighbor, check valid at link up
+ * @port_type: RO, disabled/variable/etc.
+ * @port_link_mode_active: RO, enumeration, fabric (STL)/bridge port (FLIT BUS)
+ * @neighbor_link_down_reason: RO, link_down_reason from neighbor, check when
+ *			       working link goes down
+ * @h_o_q_lifetime: RW, head of queue lifetime
+ * @vl_cap: RO, max VL supported
+ * @operational_vls: RW, how many VLs active, write once, routing sets??
+ * @neighbor_mtu: RW, neighbor MTU, routing sets (default should be OK)
+ * @crc_mode_supported: RO, bitfield of modes supported
+ * @crc_mode_enabled: RW, bitfield of driver requested modes
+ * @crc_mode_active: RO, 1-hot bitfield of mode in use, valid after link-up
+ * @reserved1: reserved
+ * @link_width_supported: RO, bitfield of initial link width supported
+ * @link_width_enabled: RW, bitfield of driver-requested initial link width
+ * @link_width_active: RO, 1-hot bitfield of link width, valid after link-up
+ * @reserved2: reserved
+ * @link_speed_supported: RO, bitfield of link speed supported
+ * @link_speed_enabled: RW, bitfield of driver-requested link speed
+ * @link_speed_active: RO, 1-hot bitfield of link speed in use
+ * @reserved3: reserved
+ * @link_width_downgrade_rx_active: RO, current active downgraded RX link
+ *				    width (format TBD)
+ * @link_width_downgrade_tx_active: RO, current active downgraded TX link
+ *				    width (format TBD)
+ * @link_init_reason: RW?, ?
+ * @link_down_reason: RW, why shutting link down, enumeration, set before link
+ *		      brought down (can be overwritten by FW)
+ * @port_state_port_physical_state: RW, bit 0-3: port logical state (look for
+ *				    transition to INIT, set CPORT to Down
+ *				    to bounce)
+ *				    RW, bit 4-7: port physical state (set to
+ *				    POLLING to start training process)
+ * @oldr_nn_lqi: RO?, bit 0-3: bitfield/enumeration (TBD) why disabling a link
+ *		 RO, bit 4: whether neighbor is armed, used by routing
+ *		 RO, bit 5-7: 0-5 link quality, degraded if less than 4
+ * @reserved4: reserved
+ * @lqi_change_count: RO, number of times link quality has changed
+ * @reserved5: reserved for future expansion with mailbox
+ * @reserved6: reserved for future expansion with mailbox
+ * @???: RW, policy config for max allowable downgrade
+ *
+ * Included in &struct mbdb_op_portinfo.
+ */
+struct portinfo {
+	u32 fid;
+	u32 link_down_count;
+	u64 neighbor_guid;
+	u32 port_error_action;
+	u8 neighbor_port_number;
+	u8 port_type;
+	u8 port_link_mode_active;
+	u8 neighbor_link_down_reason;
+	u8 h_o_q_lifetime;
+	u8 vl_cap;
+	u8 operational_vls;
+	u8 neighbor_mtu;
+	u8 crc_mode_supported;
+	u8 crc_mode_enabled;
+	u8 crc_mode_active;
+	u8 reserved1;
+	u8 link_width_supported;
+	u8 link_width_enabled;
+	u8 link_width_active;
+	u8 reserved2;
+	u8 link_speed_supported;
+	u8 link_speed_enabled;
+	u8 link_speed_active;
+	u8 reserved3;
+	u8 link_width_downgrade_rx_active;
+	u8 link_width_downgrade_tx_active;
+	u8 link_init_reason;
+	u8 link_down_reason;
+#define PS_PPS_PORT_STATE	GENMASK(3, 0)
+#define PS_PPS_PHYSICAL_STATE	GENMASK(7, 4)
+	u8 port_state_port_physical_state;
+#define OLDR_NN_LQI_OFFLINE_DISABLED_REASON	GENMASK(3, 0)
+#define OLDR_NN_LQI_NEIGHBOR_NORMAL		BIT(4)
+#define OLDR_NN_LQI_LINK_QUALITY_INDICATOR	GENMASK(7, 5)
+	u8 oldr_nn_lqi;
+	u16 reserved4;
+	u32 lqi_change_count;
+	u32 reserved5;
+	u64 reserved6;
+} __packed;
+
+/*
+ * if FIELD_GET(OLDR_NN_LQI_LINK_QUALITY_INDICATOR, oldr_nn_lqi) is below
+ * this threshold, the link is in poor health
+ */
+#define LQI_HEALTHY_THRESHOLD (4)
+
+/*
+ * These definitions are from the firmware
+ */
+
+#define IAF_FW_PORT_TYPE_UNKNOWN (0)
+#define IAF_FW_PORT_TYPE_DISCONNECTED (1)
+#define IAF_FW_PORT_TYPE_FIXED (2)
+#define IAF_FW_PORT_TYPE_VARIABLE (3)
+#define IAF_FW_PORT_TYPE_STANDARD (4)
+#define IAF_FW_PORT_TYPE_SI_PHOTONICS (5)
+
+#define IAF_FW_PORT_NOP (0)
+#define IAF_FW_PORT_DOWN (1)
+#define IAF_FW_PORT_INIT (2)
+#define IAF_FW_PORT_ARMED (3)
+#define IAF_FW_PORT_ACTIVE (4)
+
+#define IAF_FW_PORT_PHYS_NOP (0)
+#define IAF_FW_PORT_PHYS_POLLING (2)
+#define IAF_FW_PORT_PHYS_DISABLED (3)
+#define IAF_FW_PORT_PHYS_TRAINING (4)
+#define IAF_FW_PORT_PHYS_LINKUP (5)
+#define IAF_FW_PORT_PHYS_LINK_ERROR_RECOVERY (6)
+#define IAF_FW_PORT_PHYS_OFFLINE (9)
+#define IAF_FW_PORT_PHYS_TEST (11)
+
+#define IAF_FW_PORT_LINK_MODE_NOP (0)
+#define IAF_FW_PORT_LINK_MODE_FLIT_BUS (2)
+#define IAF_FW_PORT_LINK_MODE_FABRIC (4)
+
+enum pm_port_state {
+	PM_PORT_STATE_INACTIVE,
+	PM_PORT_STATE_REQUESTED,
+	PM_PORT_STATE_ISOLATED,
+	PM_PORT_STATE_ARMED,
+	PM_PORT_STATE_ACTIVE
+};
+
+#define LINK_SPEED_12G 1
+#define LINK_SPEED_25G 2
+#define LINK_SPEED_53G 4
+#define LINK_SPEED_90G 8
+
+#define LINK_SPEED_SLOW	(0x07)
+#define LINK_SPEED_FAST	(0x18)
+
+#define BPS_LINK_SPEED_12G  12500000000ULL
+#define BPS_LINK_SPEED_25G  25781250000ULL
+#define BPS_LINK_SPEED_53G  53125000000ULL
+#define BPS_LINK_SPEED_90G  90000000000ULL
+#define BPS_LINK_SPEED_106G 106000000000ULL
+
+#define LINK_WIDTH_1X 1
+#define LINK_WIDTH_2X 2
+#define LINK_WIDTH_3X 4
+#define LINK_WIDTH_4X 8
+
+#define LANES 4
+
+enum iaf_startup_mode {
+	STARTUP_MODE_DEFAULT = 0,
+	STARTUP_MODE_PRELOAD = 1,
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+	STARTUP_MODE_DEBUG   = 2,
+	STARTUP_MODE_FWDEBUG = 3,
+#endif
+};
+
+struct fsubdev; /* from this file */
+
+/**
+ * enum PORT_CONTROL - control port behavior
+ *
+ * @PORT_CONTROL_ENABLED: port enabled for PM to set up
+ * @PORT_CONTROL_ROUTABLE: port enabled for routing
+ * @PORT_CONTROL_BEACONING: beaconing requested (flash LEDs)
+ * @NUM_PORT_CONTROLS: number of controls (always last)
+ *
+ * Each maps to a bit accessed atomically in &struct fport->controls
+ */
+enum PORT_CONTROL {
+	PORT_CONTROL_ENABLED,
+	PORT_CONTROL_ROUTABLE,
+	PORT_CONTROL_BEACONING,
+	NUM_PORT_CONTROLS
+};
+
+/*
+ * fport_routing - routing-specific port data
+ * @routable: true if the port meets the port_is_routable condition
+ * @neighbor: reference to neighbor port
+ *
+ * These values are saved under the exclusive routing lock, remain
+ * valid under a downgrade to shared, and are invalided on unlock.
+ */
+struct fport_routing {
+	bool routable;
+	struct fport *neighbor;
+};
+
+/**
+ * struct fport - Per-port state, used for fabric ports only
+ * @sd: link to containing subdevice
+ * @portinfo: link to relevant &struct fsubdev.portinfo_op.per_portinfo
+ * @kobj: kobject for this port's sysfs directory node
+ * @link_failures: attribute for link_failures sysfs file
+ * @link_degrades: attribute for link_degrades sysfs file
+ * @lpn: logical port number in firmware
+ * @port_type: type of port (hardwired, QFSP, etc.)
+ * @lanes_port: for each lane the port to which it belongs
+ * @log_state: firmware logical state (DOWN, INIT, ARMED, ACTIVE)
+ * @phys_state: firmware physical state (DISABLED, POLLING, ..., LINKUP)
+ * @state: driver-abstracted high level view of port state
+ * @bounce_count: number of bounces in current flap-check leaky bucket period for the most recent
+ *		  successful sweep
+ * @flap_check_since: timestamp indicating beginning of current flap-check leaky bucket period
+ * @linkup_timer: to verify port link up timeliness
+ * @routing: routing-specific data
+ * @unroute_link: Entry into the list of ports that are waiting to be unrouted.
+ * @controls: atomically-accessed control bits to enable/disable features
+ * @routed: indicates whether this port was included in the routing logic
+ *
+ * Used throughout the driver (mostly by the port manager and routing engine) to maintain
+ * information about a given port.
+ *
+ * Protection mechanisms used outside of init/destroy are documented inline. A single PM thread per
+ * tile manages port-related data for that tile: per-tile data written by PM is written by a single
+ * thread and not accessed by any other PM threads.
+ */
+struct fport {
+	/* pointers const after async probe, content protection is by object type */
+	struct fsubdev *sd;
+	struct portinfo *portinfo;
+	struct kobject *kobj;
+	struct device_attribute link_failures;
+	struct device_attribute link_degrades;
+
+	/* values const after async probe */
+	u8 lpn;
+	u8 port_type;
+	struct fport *lanes_port[LANES];
+
+	/* protected by routable_lock, written by PM thread with shared lock */
+	u8 log_state;
+	u8 phys_state;
+	enum pm_port_state state;
+
+	/* private to PM, written by PM thread with shared routable_lock */
+	u16 bounce_count;
+	s64 flap_check_since;
+	struct timer_list linkup_timer;
+
+	/* protected by routable_lock, written by routing with exclusive lock */
+	struct fport_routing routing;
+
+	/* protected by routable_lock, written by routing or parent device with exclusive lock */
+	struct list_head unroute_link;
+
+	/* atomic with no need for additional barrier constraints */
+	DECLARE_BITMAP(controls, NUM_PORT_CONTROLS);
+	atomic_t routed;
+};
+
+/**
+ * struct mbdb_op_portinfo - Consolidation of per-port information
+ * @port_mask: bitmask of logical ports, 0=CPORT, 1-12=fabric/bridge (TBD)
+ * @reserved: 4 byte pad
+ * @per_portinfo: one &struct portinfo entry for each bit set in
+ *		  &mbdb_op_portinfo.port_mask
+ *
+ * Used with ops_portinfo_set() and ops_portinfo_get() to access
+ * information about sets of ports on a subdevice. A copy is maintained in
+ * &struct fsubdev.
+ */
+struct mbdb_op_portinfo {
+	u32 port_mask;
+	u32 reserved;
+	struct portinfo per_portinfo[];
+} __packed;
+
+/*
+ * Use this to declare an instance of mbdb_op_portinfo sized to a given number
+ * of ports
+ */
+#define DECLARE_MBDB_OP_PORTINFO(_p, _n) \
+	union { \
+		struct mbdb_op_portinfo _p; \
+		struct { \
+			u32 _port_mask; \
+			u32 _reserved; \
+			struct portinfo _per_portinfo[_n]; \
+		} __packed; \
+	}
+
+struct mbdb; /* from mbdb.c */
+struct fdev; /* from this file */
+
+struct routing_topology; /* from routing_topology.h */
+struct routing_plane; /* from routing_topology.h */
+struct routing_dfid_map; /* from routing_topology.h */
+struct routing_uft; /* from routing_topology.h */
+
+/**
+ * enum pm_trigger_reasons - Cause for PM thread trigger
+ * @INIT_EVENT: Initialization of PM subsystem for this sd
+ * @DEISOLATE_EVENT: Request to deisolate all ports (possible fabric change)
+ * @PSC_TRAP: Port state change reported
+ * @LWD_TRAP: Link width degrade reported
+ * @LQI_TRAP: Link quality change reported
+ * @QSFP_PRESENCE_TRAP: QSFP presence change reported
+ * @QSFP_FAULT_TRAP: QSFP fault reported
+ * @RESCAN_EVENT: PM-initiated trigger to rescan ports
+ * @NL_PM_CMD_EVENT: Netlink request affecting PM processed
+ * @NUM_PM_TRIGGERS: Number of trigger reasons (always last)
+ *
+ * Used as bit index into &fsubdev.pm_triggers
+ */
+enum pm_trigger_reasons {
+	INIT_EVENT,
+	DEISOLATE_EVENT,
+	PSC_TRAP,
+	LWD_TRAP,
+	LQI_TRAP,
+	QSFP_PRESENCE_TRAP,
+	QSFP_FAULT_TRAP,
+	RESCAN_EVENT,
+	NL_PM_CMD_EVENT,
+	NUM_PM_TRIGGERS
+};
+
+/**
+ * enum sd_error - Subdevice error conditions
+ * @SD_ERROR_FAILED: Subdevice has been marked as FAILED
+ * @SD_ERROR_FW: Firmware error
+ * @NUM_SD_ERRORS: Number of error conditions (always last)
+ */
+enum sd_error {
+	SD_ERROR_FAILED,
+	SD_ERROR_FW,
+	NUM_SD_ERRORS
+};
+
+/**
+ * enum fport_health - Port health indicator
+ * @FPORT_HEALTH_OFF: disabled/not present
+ * @FPORT_HEALTH_FAILED: not functional
+ * @FPORT_HEALTH_DEGRADED: functional, degraded
+ * @FPORT_HEALTH_HEALTHY: functional, healthy
+ */
+enum fport_health {
+	FPORT_HEALTH_OFF,
+	FPORT_HEALTH_FAILED,
+	FPORT_HEALTH_DEGRADED,
+	FPORT_HEALTH_HEALTHY
+};
+
+/**
+ * enum fport_issue - Cause(s) for link degradation (YELLOW)
+ * @FPORT_ISSUE_LQI: too many link errors (link quality < 4)
+ * @FPORT_ISSUE_LWD: link width degraded
+ * @FPORT_ISSUE_RATE: bit rate degraded
+ * @NUM_FPORT_ISSUES: Number of FPORT degradation reasons (always last)
+ *
+ * Used as bit index into &fport_status.issues
+ */
+enum fport_issue {
+	FPORT_ISSUE_LQI,
+	FPORT_ISSUE_LWD,
+	FPORT_ISSUE_RATE,
+	NUM_FPORT_ISSUES
+};
+
+/**
+ * enum fport_error - Cause for link failure (RED)
+ * @FPORT_ERROR_FAILED: Driver operation on port failed
+ * @FPORT_ERROR_ISOLATED: Invalid neighbor GUID, isolated by driver
+ * @FPORT_ERROR_FLAPPING: Driver detected link flapping
+ * @FPORT_ERROR_LINK_DOWN: Firmware reported link down (PSC)
+ * @FPORT_ERROR_DID_NOT_TRAIN: Driver timed out link training
+ * @FPORT_ERROR_LOOPBACK: Both ends of the link are the same device.
+ * @NUM_FPORT_ERRORS: Number of FPORT error reasons (always last)
+ */
+enum fport_error {
+	FPORT_ERROR_FAILED,
+	FPORT_ERROR_ISOLATED,
+	FPORT_ERROR_FLAPPING,
+	FPORT_ERROR_LINK_DOWN,
+	FPORT_ERROR_DID_NOT_TRAIN,
+	FPORT_ERROR_LOOPBACK,
+	NUM_FPORT_ERRORS
+};
+
+/**
+ * struct fport_status - Logical port state for external query
+ * @linkup_since: timestamp indicating when link up was noticed
+ * @health: port health indicator
+ * @link_failures: number of link failures detected
+ * @link_degrades: number of link degrades detected
+ * @issues: causes for link degradation
+ * @errors: causes for link error
+ */
+struct fport_status {
+	s64 linkup_since;
+	enum fport_health health;
+	u64 link_failures;
+	u64 link_degrades;
+	DECLARE_BITMAP(issues, NUM_FPORT_ISSUES);
+	DECLARE_BITMAP(errors, NUM_FPORT_ERRORS);
+};
+
+struct routing_fidgen {
+	/*
+	 * mask over the full physical address (NOT 46-bit bridge address
+	 * line)
+	 *   [51:0] address mask
+	 */
+	u64 mask_a;
+	u64 mask_b;
+	u64 mask_d;
+	u64 mask_h;
+
+	/* [6:6] shift right flag */
+	/* [5:0] shift amount */
+	u8 shift_a;
+	u8 shift_b;
+	u8 shift_h;
+
+	/* [2:0] hash mask modulo operand */
+	u8 modulo;
+};
+
+/**
+ * struct fsubdev_routing_info - Tracks per-sd routing state.
+ * @topo: the topology context that tracks sweep state
+ * @plane_link: entry in plane list
+ * @plane: pointer to plane
+ * @state: routing-level subdevice state
+ * @uft: currently active routing tables
+ * @uft_next: next uft being built by active sweep
+ * @dfid_map: currently active DPA->DFID map
+ * @dfid_map_next: next DFID map being built by active sweep
+ * @fidgen: bridge fidgen register configuration
+ * @dpa_idx_base: dpa lookup table index base
+ * @dpa_idx_range: dpa lookup table range
+ * @fid_group: abstract fid "group" which determines assigned fids
+ * @fid_mgmt: management fid for cport
+ * @fid_base: base fid of the bridge's fid block
+ * @plane_index: per-plane index of this subdevice
+ */
+struct fsubdev_routing_info {
+	struct routing_topology *topo;
+	struct list_head plane_link;
+	struct routing_plane *plane;
+	enum fsubdev_routing_info_state {
+		TILE_ROUTING_STATE_ERROR = 0,
+		TILE_ROUTING_STATE_VALID,
+	} state;
+	struct routing_uft *uft;
+	struct routing_uft *uft_next;
+	struct routing_dfid_map *dfid_map;
+	struct routing_dfid_map *dfid_map_next;
+	struct routing_fidgen fidgen;
+	u16 dpa_idx_base;
+	u16 dpa_idx_range;
+	u16 fid_group;
+	u16 fid_mgmt;
+	u16 fid_base;
+	u16 plane_index;
+};
+
+/**
+ * struct fsubdev - Per-subdevice state
+ * @fdev: link to containing device
+ * @mbdb: link to dedicated mailbox struct
+ * @csr_base: base address of this subdevice's memory
+ * @irq: assigned interrupt
+ * @name: small string to describe SD
+ * @asic_rev_info: raw contents of the asic rev info register
+ * @fw_work: workitem for firmware programming
+ * @pm_work: workitem for port management
+ * @ue_work: workitem for uevent processing
+ * @rescan_work: workitem to signal PM thread if ports need rescanning
+ * @debugfs_dir: sd-level debugfs dentry
+ * @debugfs_port_dir: debugfs_dir/port-level debugfs dentry
+ * @kobj: kobject for this sd in the sysfs tree
+ * @fw_comm_errors: attribute for fw_comm_errors sysfs file
+ * @fw_error: attribute for fw_error sysfs file
+ * @sd_failure: attribute for sd_failure sysfs file
+ * @firmware_version: attribute for firmware_version sysfs file
+ * @guid: GUID retrieved from firmware
+ * @txcal: TX calibration data for all fabric ports
+ * @switchinfo: switch information read directly from firmware
+ * @extended_port_cnt: count of all ports including CPORT and bridge ports
+ * @port_cnt: count of all fabric ports
+ * @PORT_COUNT: number of supported ports
+ * @fport_lpns: bitmap of which logical ports are fabric ports
+ * @bport_lpns: bitmap of which logical ports are bridge ports
+ * @fw_version: version information of firmware
+ * @fw_running: whether runtime firmware is initialized/running
+ * @errors: bitmap of active error states
+ * @pm_work_lock: protects ok_to_schedule_pm_work
+ * @ok_to_schedule_pm_work: indicates it is OK to request port management
+ * @pm_triggers: event triggering for port management
+ * @routable_link: link in global routable_list
+ * @routing: routing information
+ * @port: internal port state, includes references into @portinfo_op
+ * @portinfo_op: all port information, read from firmware via MBDB op
+ * @_portstatus: logical port status, access via @port_status/@next_port_status
+ * @port_status: for querying port status via RCU (organized by lpn)
+ * @next_port_status: for updating port status via RCU (organized by lpn)
+ * @psc_trap_count: number of port state change trap notifications reported
+ * @lwd_trap_count: number of link width degrade trap notifications reported
+ * @lqi_trap_count: number of link quality issue trap notifications reported
+ * @qsfp_fault_trap_count: number of qsfp faulted trap notifications reported
+ * @qsfp_present_trap_count: number of qsfp present trap notifications reported
+ * @cport_init_ctrl_reg_lock: controls access to the cport_init_ctrl_reg
+ * @statedump: state dump data information
+ *
+ * Used throughout the driver to maintain information about a given subdevice.
+ *
+ * Protection mechanisms used outside of init/destroy are documented inline. Sync probe is the
+ * context of the initial probe function. Async probe includes the initialization threads used to
+ * load the firmware and platform configuration before enabling general processing.
+ */
+struct fsubdev {
+	/* pointers const after sync probe, content protection is by object type */
+	struct fdev *fdev;
+	struct mbdb *mbdb;
+	char __iomem *csr_base;
+
+	/* values const after sync probe */
+	int irq;
+	char name[8];
+	u64 asic_rev_info;
+
+	/* work items for thread synchronization */
+	struct work_struct fw_work;
+	struct work_struct pm_work;
+	struct delayed_work ue_work;
+	struct work_struct rescan_work;
+
+	/* values const after async probe */
+	struct dentry *debugfs_dir;
+	struct dentry *debugfs_port_dir;
+	struct kobject *kobj;
+	struct device_attribute fw_comm_errors;
+	struct device_attribute fw_error;
+	struct device_attribute sd_failure;
+	struct device_attribute firmware_version;
+
+	u64 guid;
+	u16 txcal[PORT_COUNT];
+	struct mbdb_op_switchinfo switchinfo;
+	u8 extended_port_cnt;
+	u8 port_cnt;
+	DECLARE_BITMAP(fport_lpns, PORT_COUNT);
+	DECLARE_BITMAP(bport_lpns, PORT_COUNT);
+	struct mbdb_op_fw_version_rsp fw_version;
+
+	/* essentially const after async probe (RISC RESET invalidates driver state anyway) */
+	bool fw_running;
+
+	/* atomic, never cleared after sync probe */
+	DECLARE_BITMAP(errors, NUM_SD_ERRORS);
+
+	/* protects ok_to_schedule_pm_work */
+	struct mutex pm_work_lock;
+
+	/* for PM thread interaction, protected by pm_work_lock */
+	bool ok_to_schedule_pm_work;
+
+	/* for PM thread interaction, protected by atomic bitops */
+	DECLARE_BITMAP(pm_triggers, NUM_PM_TRIGGERS);
+
+	/* protected by routable_lock, written by routing with exclusive lock */
+	struct list_head routable_link;
+	struct fsubdev_routing_info routing;
+
+	/* protections are documented in &struct fport */
+	struct fport port[PORT_COUNT];
+
+	/* protected by routable_lock, written by PM thread with shared lock */
+	DECLARE_MBDB_OP_PORTINFO(portinfo_op, PORT_COUNT);
+
+	/* protected by RCU, owned by PM, ping-pong data structure accessed by pointer only */
+	struct fport_status _portstatus[2 * PORT_COUNT]; /* backing data, owned by PM thread */
+	struct fport_status __rcu *port_status; /* read by any */
+	struct fport_status *next_port_status; /* written by PM thread */
+
+	/*
+	 * atomic, incremented by PM thread
+	 */
+	atomic64_t psc_trap_count;
+	atomic64_t lwd_trap_count;
+	atomic64_t lqi_trap_count;
+	atomic64_t qsfp_fault_trap_count;
+	atomic64_t qsfp_present_trap_count;
+
+	/* protects cport_init_ctrl_reg */
+	struct mutex cport_init_ctrl_reg_lock;
+
+	/* protections are documented in &struct statedump */
+	struct state_dump statedump;
+};
+
+/* to iterate over all fabric ports on a subdevice by logical port number */
+#define for_each_fabric_lpn(bit, sd)	\
+	for_each_set_bit(bit, (sd)->fport_lpns, PORT_COUNT)
+
+/* to iterate over all bridge ports on a subdevice by logical port number */
+#define for_each_bridge_lpn(bit, sd)	\
+	for_each_set_bit(bit, (sd)->bport_lpns, PORT_COUNT)
+
+#define for_each_masked_port(port, lpn, ports, mask, size)     \
+	for ((lpn) = find_first_bit((mask), (size)),           \
+	     (port) = (lpn) < (size) ? (ports) + (lpn) : NULL; \
+	     (lpn) < (size);                                   \
+	     (lpn) = find_next_bit((mask), (size), (lpn) + 1), \
+	     (port) = (lpn) < (size) ? (ports) + (lpn) : NULL)
+
+#define for_each_fabric_port(port_, lpn, sd) \
+	for_each_masked_port(port_, lpn, (sd)->port, (sd)->fport_lpns, PORT_COUNT)
+
+#define for_each_bridge_port(port_, lpn, sd) \
+	for_each_masked_port(port_, lpn, (sd)->port, (sd)->bport_lpns, PORT_COUNT)
+
+/**
+ * get_fport_handle - Returns the fabric port for a given logical port number.
+ * @sd: subdevice pointer
+ * @lpn: logical port number
+ *
+ * Return: The fport pointer at the lpn if valid, otherwise NULL.
+ */
+static inline struct fport *get_fport_handle(struct fsubdev *sd, u8 lpn)
+{
+	return lpn < PORT_COUNT && test_bit(lpn, sd->fport_lpns) ? sd->port + lpn : NULL;
+}
+
+/**
+ * struct psc_presence_rule - presence detection rule
+ * @method: method used for presence detection
+ * @index: method-specific index used for presence detection
+ * @subdev_map: which subdevices this affects (bitmap, 0=all)
+ * @reserved: forces port_map to be 32-bit aligned, should be 0 currently
+ * @port_map: which ports this affects (bitmap, 0=all)
+ *
+ * Identifies a presence detection rule, used to identify which ports are
+ * physically connected to another device so that only connected ports need be
+ * enabled.
+ *
+ * Presence detection rules are given in sets, where each set contains all
+ * rules for a given socket_id (there may be multiple devices in a system with
+ * the same socket_id).
+ *
+ * If a socket_id has no presence-detection rules, the default KMD behavior
+ * (automatically enabling FIXED or VARIABLE ports) applies. If any rules are
+ * specified, these are used to determine which ports are enabled at startup
+ * automatically, and by default no other ports are enabled on this device.
+ * Presence rules are OR'ed together: a port is enabled at startup if any rule
+ * enables it.
+ *
+ * For hardware detection, set @method to PRESENCE_RULE_LINK_CONTROL, in which
+ * case the rule corresponds to the link_control bit identified by @index
+ * (these bits are read via GPIO automatically at startup). If the bit is set,
+ * the port is enabled. This is normally the only method used.
+ *
+ * Set @method to PRESENCE_RULE_DEFAULT to override the default rule, in which
+ * case @index specifies behavior (disable on zero, else enable). This may be
+ * used with @index=0 as the only presence rule to prevent ports from being
+ * automatically enabled on that device. This may be used with @index=1 in
+ * conjunction with other presence rules to allow specific ports to be enabled
+ * by default while others use hardware detection rules.
+ *
+ * In all cases, subdev_map and port_map are bitfield maps corresponding to a
+ * set of subdevices and ports (subdev_map=1/port_map=6 corresponds to
+ * subdevice 0 ports 1 and 2, for instance), except that a value of 0
+ * corresponds to all instances. Thus, subdev_map=0/port_map=0 maps to all
+ * ports on all subdevices.
+ *
+ * It is possible for two rules to identify the same @method and @index, to
+ * allow different sets of ports to be controlled on each subdevice, for
+ * instance.
+ */
+struct psc_presence_rule {
+	u8 method;
+	u8 index;
+	u8 subdev_map;
+	u8 reserved;
+	u32 port_map;
+};
+
+/*
+ * TX calibration blob, optionally found after PSC
+ */
+
+/*
+ * TXCAL BLOB magic number: corresponds to the string "Xe Tx Cal Blob\0\0"
+ */
+#define TXCAL_BLOB_MAGIC_0 (0x54206558)
+#define TXCAL_BLOB_MAGIC_1 (0x61432078)
+#define TXCAL_BLOB_MAGIC_2 (0x6c42206c)
+#define TXCAL_BLOB_MAGIC_3 (0x0000626f)
+
+/*
+ * Format of struct txcal_blob being used
+ */
+#define TXCAL_VERSION_CURRENT (1)
+#define TXCAL_VERSION_MIN (1)
+#define TXCAL_VERSION_MAX (1)
+
+/**
+ * struct txcal_settings - TX calibration settings for a subdevice
+ * @guid: GUID of subdevice
+ * @port_settings: array of settings for each possible fabric port
+ *
+ * Identifies the SERDES TX DCC MARGIN parameters for each possible fabric
+ * port on a subdevice. @port_settings[lpn] == 0 means there is no calibration
+ * data for that fabric port. These are applied before bringing any ports up
+ * via the TX_DCC_MARGIN_PARAM subopcode of the SERDES_MARGIN opcode.
+ */
+struct txcal_settings {
+	u64 guid;
+	u16 port_settings[TXCAL_PORT_COUNT];
+};
+
+/**
+ * struct txcal_blob - TX calibration settings for all subdevices
+ * @magic: must be 0x54206558, 0x61432078, 0x6c42206c, 0x0000626f ("Xe Tx Cal Blob\0\0")
+ * @format_version: must be in range [TXCAL_VERSION_MIN : TXCAL_VERSION_MAX]
+ * @cfg_version: configuration version, if specified
+ * @date: UTC generation date in BCD (YYYYMMDD)
+ * @time: UTC generation time in BCD (HHMMSS)
+ * @size: size of entire structure including @data array
+ * @num_settings: number of elements in @data array
+ * @crc32c_data: CRC covering @data array
+ * @crc32c_hdr: CRC covering all other header fields
+ * @data: Array of per-subdevice TX calibration settings
+ *
+ * Identifies all TX calibration settings for a set of subdevices. The set
+ * must include all subdevices for the device from which this blob was read
+ * and will typically include all subdevices in the system (like the binary
+ * PSC blob). This blob is normally located in SPI flash immediately after
+ * the PSC blob, and is only used if present (as indicated by valid magic
+ * and CRC fields).
+ */
+struct txcal_blob {
+	u32 magic[4];
+	u32 format_version;
+	u32 cfg_version;
+	u32 date;
+	u32 time;
+	u32 size;
+	u32 num_settings;
+	u32 crc32c_data;
+	u32 crc32c_hdr;
+	struct txcal_settings data[];
+};
+
+/**
+ * struct fdev - Device structure for IAF/fabric device component
+ * @registered: Registered with platform device
+ * @sd: subdevice structures
+ * @dev_disabled: On a PCIe error, disable access to the PCI bus
+ * @fwinit_refcnt: number of subdevices needing firmware initialization
+ * @all_sds_inited: indicates all subdevices have been initialized
+ * @pdev: bus device passed in probe
+ * @pd: platform specific data
+ * @fabric_id: xarray index based on parent index and product type
+ * @link_config: link config pin values read from GPIO at startup
+ * @port_unroute_list: list of ports with pending unroute request
+ * @mappings_ref.lock: protect the mappings_ref data
+ * @mappings_ref.count: current mapped buffer count
+ * @mappings_ref.remove_in_progress: indicate unmap should show completion
+ * @mappings_ref.complete: completion after all buffers are unmapped
+ * @mappings_ref: Reference count of parent mapped buffers
+ * @fw: used for interacting with FW API
+ * @mei_ops_lock: mutex lock for mei_ops/dev/bind_continuation/work
+ * @mei_ops: bound MEI operation functions (if not NULL)
+ * @mei_dev: device to use with @mei_ops
+ * @mei_bind_continuation: set when unbound @mei_ops needed, called by bind
+ * @mei_continuation_timer: used to timeout receipt of MEI bind continuation
+ * @mei_work: work struct for MEI completion
+ * @psc.work: work struct for PSC processing
+ * @psc.done: signals that PSC processing is done
+ * @psc.abort: indicates whether to stop waiting for PSC availability
+ * @psc.err: indicates whether PSC processing encountered an error
+ * @psc.data: PSC data, from flash or FW API
+ * @psc.size: size of PSC data, from flash or FW API
+ * @psc.as_fw: used to access PSC override via FW API
+ * @psc.mtd: used to access PSC data from NVMEM via MTD API
+ * @psc.brand: copied, NUL-terminated brand string extracted from PSC data
+ * @psc.product: copied, NUL-terminated product string extracted from PSC data
+ * @psc.version: copied, NUL-terminated version string constructed from PSC data
+ * @psc.ini_buf: buffers for extracting ini_bin data from NVMEM
+ * @psc.ini_buf.data: copied PSC data of @psc.ini_buf
+ * @psc.ini_buf.idx: PSC data indices of @psc.ini_buf to identify buffers for reuse
+ * @psc.ini_buf.size: PSC data size of @psc.ini_buf to identify buffers for reuse
+ * @psc.ini_buf.do_not_free: @psc.ini_buf.data refers to another buffer that will be freed
+ * @psc.n_presence_rules: number of presence rules for this device in PSC data
+ * @psc.presence_rules: copied presence rules for this device, extracted from PSC data
+ * @psc: PSC processing info
+ * @p2p: the active cached peer connectivity results (rcu protected)
+ * @p2p_next: the pending peer connectivity results
+ * @dir_node: debugfs directory node for this device
+ * @fabric_node: debugfs file fabric symbolic link
+ * @dpa_node: debugfs file dpa symbolic link
+ * @refs: references on this instance
+ * @fdev_released: signals fdev has been erased from the xarray
+ * @startup_mode: startup mode
+ *
+ * Used throughout the driver to maintain information about a given device.
+ */
+struct fdev {
+	bool registered;
+	struct fsubdev sd[IAF_MAX_SUB_DEVS];
+	bool dev_disabled;
+	atomic_t fwinit_refcnt;
+	bool all_sds_inited;
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	struct auxiliary_device *pdev;
+#else
+	struct platform_device *pdev;
+#endif
+	const struct iaf_pdata *pd;
+	u32 fabric_id;
+	u32 link_config;
+	struct list_head port_unroute_list;
+
+	struct {
+		/* protect the mapping count and remove_in_progress flag */
+		struct mutex lock;
+		int count;
+		bool remove_in_progress;
+		struct completion complete;
+	} mappings_ref;
+
+	const struct firmware *fw;
+	/* protects mei_ops/mei_dev/mei_bind_continuation */
+	struct mutex mei_ops_lock;
+	const struct i915_iaf_component_ops *mei_ops;
+	struct device *mei_dev;
+	void (*mei_bind_continuation)(struct fdev *dev);
+	struct timer_list mei_continuation_timer;
+	struct work_struct mei_work;
+	struct {
+		struct work_struct work;
+		struct completion done;
+		struct completion abort;
+		int err;
+		const u8 *data;
+		size_t size;
+		const struct firmware *as_fw;
+		struct mtd_info *mtd;
+		char *brand;
+		char *product;
+		char version[MAX_PSCBIN_VERSION];
+		struct {
+			const u8 *data;
+			u32 idx;
+			u32 size;
+			bool do_not_free;
+		} ini_buf[IAF_MAX_SUB_DEVS];
+		size_t n_presence_rules;
+		struct psc_presence_rule *presence_rules;
+		struct txcal_blob *txcal;
+	} psc;
+	struct routing_p2p_entry __rcu *p2p;
+	struct routing_p2p_entry *p2p_next;
+	struct dentry *dir_node;
+	struct dentry *fabric_node;
+	struct dentry *dpa_node;
+	struct kref refs;
+	struct completion fdev_released;
+	enum iaf_startup_mode startup_mode;
+};
+
+u64 bps_link_speed(u8 port_info_link_speed);
+
+void fdev_put(struct fdev *dev);
+void fdev_get_early(struct fdev *dev);
+int fdev_insert(struct fdev *dev);
+
+/*
+ * This is the fdev_process_each callback function signature
+ * Returning 0 indicates continue
+ * Any other return value indicates terminate
+ */
+typedef int (*fdev_process_each_cb_t)(struct fdev *dev, void *args);
+
+int fdev_process_each(fdev_process_each_cb_t cb, void *args);
+
+struct fdev *fdev_find(u32 fabric_id);
+
+/*
+ * Returns the sd index/offset relative to its device.
+ */
+static inline u8 sd_index(struct fsubdev *sd)
+{
+	return sd - sd->fdev->sd;
+}
+
+/*
+ * dev_is_startup_debug - Test for full debug startup mode.
+ * @dev: device
+ *
+ * Return: True if we're actually starting up straight into debug mode,
+ * bypassing all normal device init behavior.
+ */
+static inline bool dev_is_startup_debug(struct fdev *dev)
+{
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+	return dev && dev->startup_mode == STARTUP_MODE_DEBUG;
+#else
+	return false;
+#endif
+}
+
+/**
+ * dev_is_runtime_debug - Test for runtime debug startup mode.
+ * @dev: device
+ *
+ * Return: True if, regardless of the startup logic, we end up in debug mode
+ * once we're past firmware init.
+ */
+static inline bool dev_is_runtime_debug(struct fdev *dev)
+{
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+	return dev && (dev->startup_mode == STARTUP_MODE_DEBUG ||
+		       dev->startup_mode == STARTUP_MODE_FWDEBUG);
+#else
+	return false;
+#endif
+}
+
+/*
+ * dev_is_preload - Test for preload startup mode.
+ * @dev: device
+ *
+ * Return: True if the device is in preload startup mode.
+ */
+static inline bool dev_is_preload(struct fdev *dev)
+{
+	return dev && dev->startup_mode == STARTUP_MODE_PRELOAD;
+}
+
+/*
+ * routable_lock affects ALL devices in the system and protects data structures that must not
+ * change during routing, specifically all routing fields of all elements in the routable list. It
+ * also protects port state written by port manager instances that affect routing. Individual port
+ * managers must be blocked from updating their state while they are being used by routing but must
+ * not be blocked from updating their own state by port managers working on other tiles.
+ *
+ * rw_semaphore down_write operations take the lock exclusively (traditionally protecting the data
+ * for writing) and down_read operations take it in a shared manner (traditionally protecting the
+ * data for reading). Port managers exclusively access their own data in single threads are thus
+ * allowed to update their own data while using a shared read lock. All other consumers must use an
+ * exclusive write lock to access that data.
+ *
+ * Routing and general consumers must use down_write and treat routable_lock as a mutex to acquire
+ * read/write access to all data protected by the lock. Port managers (only) may use down_read to
+ * access ONE tile's data and must be guaranteed to be race free independent of the lock.
+ *
+ * Routing data structures that are not written by port managers can be protected for read-only
+ * access using down_read() to obtain a shared lock in the traditional manner. During a routing
+ * sweep, after routing has computed new routing state, that state is frozen and the exclusive
+ * write lock is downgraded to a shared read lock for remaining device programming. A shared lock is
+ * also used to protect debugfs read access of frozen routing state.
+ */
+extern struct rw_semaphore routable_lock;
+extern struct list_head routable_list;
+
+static inline struct device *sd_dev(const struct fsubdev *sd)
+{
+	return &sd->fdev->pdev->dev;
+}
+
+static inline struct device *fdev_dev(const struct fdev *dev)
+{
+	return &dev->pdev->dev;
+}
+
+static inline struct device *fport_dev(const struct fport *port)
+{
+	return &port->sd->fdev->pdev->dev;
+}
+
+#define BYTES_PER_FLIT 8
+
+static inline u64 flits_to_bytes(u64 flits)
+{
+	u64 bytes;
+
+	return __builtin_umulll_overflow(flits, BYTES_PER_FLIT, &bytes) ? ULLONG_MAX : bytes;
+}
+
+static inline u32 lane_number(struct fport **port)
+{
+	return port - (*port)->lanes_port;
+}
+
+void indicate_subdevice_error(struct fsubdev *sd, enum sd_error err);
+
+/* The following two functions increase device reference count: */
+struct fdev *fdev_find_by_sd_guid(u64 guid);
+struct fsubdev *find_sd_id(u32 fabric_id, u8 sd_index);
+
+/* routable_lock must be held across this (shared OK) */
+struct fsubdev *find_routable_sd(u64 guid);
+
+void iaf_complete_init_dev(struct fdev *dev);
+
+bool is_fdev_registered(struct fdev *dev);
+
+bool is_fport_registered(struct fport *port);
+
+bool mappings_ref_check(struct fdev *dev);
+
+extern struct workqueue_struct *iaf_unbound_wq;
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/iaf_netlink.h b/drivers/gpu/drm/xe/fabric/iaf_netlink.h
new file mode 100644
index 0000000000000..06c3b9562dd45
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/iaf_netlink.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2021 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef IAF_NETLINK_H_INCLUDED
+#define IAF_NETLINK_H_INCLUDED
+
+#define INTERFACE_VERSION 1
+
+enum cmd_op {
+	IAF_CMD_OP_UNSPEC = 0,
+	IAF_CMD_OP_DEVICE_ENUM = 1,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_ENABLE = 2,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_DISABLE = 3,
+	IAF_CMD_OP_PORT_STATE_QUERY = 4,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_USAGE_ENABLE = 5,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_USAGE_DISABLE = 6,
+	IAF_CMD_OP_PORT_USAGE_STATE_QUERY = 7,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_BEACON_ENABLE = 8,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_PORT_BEACON_DISABLE = 9,
+	IAF_CMD_OP_PORT_BEACON_STATE_QUERY = 10,
+	IAF_CMD_OP_PORT_ROUTED_QUERY = 11,
+	/* Requires GENL_UNS_ADMIN_PERM */
+	IAF_CMD_OP_REM_REQUEST = 12,
+	IAF_CMD_OP_ROUTING_GEN_QUERY = 13,
+	IAF_CMD_OP_FABRIC_DEVICE_PROPERTIES = 14,
+	IAF_CMD_OP_SUB_DEVICE_PROPERTIES_GET = 15,
+	IAF_CMD_OP_FPORT_STATUS_QUERY = 16,
+	IAF_CMD_OP_SUB_DEVICE_TRAP_COUNT_QUERY = 17,
+	IAF_CMD_OP_FPORT_PROPERTIES = 18,
+	IAF_CMD_OP_FPORT_XMIT_RECV_COUNTS = 19,
+	IAF_CMD_OP_FPORT_THROUGHPUT = 20,
+
+	_IAF_CMD_OP_COUNT,
+};
+
+enum cmd_msg_type {
+	IAF_CMD_MSG_REQUEST = 0,
+	IAF_CMD_MSG_RESPONSE = 1,
+
+	_IAF_CMD_MSG_TYPE_COUNT,
+};
+
+enum cmd_rsp {
+	IAF_CMD_RSP_SUCCESS = 0,
+	IAF_CMD_RSP_FAILURE = 1,
+	IAF_CMD_RSP_MAIL_BOX_ERROR = 2,
+	IAF_CMD_RSP_NOMEM = 3,
+	IAF_CMD_RSP_MSGSIZE = 4,
+	IAF_CMD_RSP_AGAIN = 5,
+	IAF_CMD_RSP_INVALID_INTERFACE_VERSION = 6,
+	IAF_CMD_RSP_MISSING_FABRIC_ID = 7,
+	IAF_CMD_RSP_MISSING_SD_INDEX = 8,
+	IAF_CMD_RSP_UNKNOWN_FABRIC_ID = 9,
+	IAF_CMD_RSP_SD_INDEX_OUT_OF_RANGE = 10,
+	IAF_CMD_RSP_PORT_RANGE_ERROR = 11,
+	IAF_CMD_RSP_MISSING_PORT_NUMBER = 12,
+	IAF_CMD_RSP_MISSING_MSG_TYPE = 13,
+	IAF_CMD_RSP_MSG_TYPE_NOT_REQUEST = 14,
+
+	_IAF_CMD_RSP_COUNT,
+};
+
+enum attr {
+	IAF_ATTR_UNSPEC = 0,
+
+	IAF_ATTR_CMD_OP_MSG_TYPE = 1,
+	IAF_ATTR_CMD_OP_CONTEXT = 2,
+	IAF_ATTR_CMD_OP_RESULT = 3,
+
+	/* Attributes for SD identification */
+	IAF_ATTR_FABRIC_ID = 4,
+	IAF_ATTR_SD_INDEX = 5,
+
+	IAF_ATTR_PAD = 6,
+
+	IAF_ATTR_ENTRIES = 7,
+
+	/* Attributes for fabric devices */
+	IAF_ATTR_FABRIC_DEVICE = 8,
+
+	IAF_ATTR_DEV_NAME = 9,
+	IAF_ATTR_PARENT_DEV_NAME = 10,
+
+	IAF_ATTR_SOCKET_ID = 11,
+	IAF_ATTR_PCI_SLOT_NUM = 12,
+	IAF_ATTR_SUBDEVICE_COUNT = 13,
+	IAF_ATTR_VERSION = 14,
+	IAF_ATTR_PRODUCT_TYPE = 15,
+
+	IAF_ATTR_SUB_DEVICE = 16,
+
+	/* Attributes for sub devices */
+	IAF_ATTR_GUID = 17,
+	IAF_ATTR_EXTENDED_PORT_COUNT = 18,
+	IAF_ATTR_FABRIC_PORT_COUNT = 19,
+	IAF_ATTR_SWITCH_LIFETIME = 20,
+	IAF_ATTR_ROUTING_MODE_SUPPORTED = 21,
+	IAF_ATTR_ROUTING_MODE_ENABLED = 22,
+	IAF_ATTR_EHHANCED_PORT_0_PRESENT = 23,
+
+	IAF_ATTR_FABRIC_PORT = 24,
+
+	IAF_ATTR_FABRIC_PORT_NUMBER = 25,
+	IAF_ATTR_FABRIC_PORT_TYPE = 26,
+
+	IAF_ATTR_BRIDGE_PORT_NUMBER = 27,
+
+	IAF_ATTR_ENABLED_STATE = 28,
+
+	IAF_ATTR_ROUTING_GEN_START = 29,
+	IAF_ATTR_ROUTING_GEN_END = 30,
+
+	IAF_ATTR_FPORT_HEALTH = 31,
+	IAF_ATTR_FPORT_ISSUE_LQI = 32,
+	IAF_ATTR_FPORT_ISSUE_LWD = 33,
+	IAF_ATTR_FPORT_ISSUE_RATE = 34,
+	IAF_ATTR_FPORT_ERROR_FAILED = 35,
+	IAF_ATTR_FPORT_ERROR_ISOLATED = 36,
+	IAF_ATTR_FPORT_ERROR_FLAPPING = 37,
+	IAF_ATTR_FPORT_ERROR_LINK_DOWN = 38,
+	IAF_ATTR_FPORT_ERROR_DID_NOT_TRAIN = 39,
+
+	IAF_ATTR_SUB_DEVICE_TRAP_COUNT = 40,
+
+	IAF_ATTR_FPORT_PM_PORT_STATE = 41,
+	IAF_ATTR_FPORT_ROUTED = 42,
+	IAF_ATTR_FPORT_LOGICAL_STATE = 43,
+	IAF_ATTR_FPORT_PHYSICAL_STATE = 44,
+
+	IAF_ATTR_FPORT_FID = 45,
+	IAF_ATTR_FPORT_LINK_DOWN_COUNT = 46,
+	IAF_ATTR_FPORT_NEIGHBOR_GUID = 47,
+	IAF_ATTR_FPORT_PORT_ERROR_ACTION = 48,
+	IAF_ATTR_FPORT_NEIGHBOR_PORT_NUMBER = 49,
+	IAF_ATTR_FPORT_PORT_LINK_MODE_ACTIVE = 50,
+	IAF_ATTR_FPORT_NEIGHBOR_LINK_DOWN_REASON = 51,
+	IAF_ATTR_FPORT_H_O_Q_LIFETIME = 52,
+	IAF_ATTR_FPORT_VL_CAP = 53,
+	IAF_ATTR_FPORT_OPERATIONAL_VLS = 54,
+	IAF_ATTR_FPORT_NEIGHBOR_MTU = 55,
+	IAF_ATTR_FPORT_LTP_CRC_MODE_SUPPORTED = 56,
+	IAF_ATTR_FPORT_LTP_CRC_MODE_ENABLED = 57,
+	IAF_ATTR_FPORT_LTP_CRC_MODE_ACTIVE = 58,
+	IAF_ATTR_FPORT_LINK_WIDTH_SUPPORTED = 59,
+	IAF_ATTR_FPORT_LINK_WIDTH_ENABLED = 60,
+	IAF_ATTR_FPORT_LINK_WIDTH_ACTIVE = 61,
+	IAF_ATTR_FPORT_LINK_SPEED_SUPPORTED = 62,
+	IAF_ATTR_FPORT_LINK_SPEED_ENABLED = 63,
+	IAF_ATTR_FPORT_LINK_SPEED_ACTIVE = 64,
+	IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_RX_ACTIVE = 65,
+	IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_TX_ACTIVE = 66,
+	IAF_ATTR_FPORT_LINK_INIT_REASON = 67,
+	IAF_ATTR_FPORT_LINK_DOWN_REASON = 68,
+	IAF_ATTR_FPORT_LQI_OFFLINE_DISABLED_REASON = 69,
+	IAF_ATTR_FPORT_LQI_NEIGHBOR_NORMAL = 70,
+	IAF_ATTR_FPORT_LINK_QUALITY_INDICATOR = 71,
+	IAF_ATTR_FPORT_BPS_LINK_SPEED_ACTIVE = 72,
+
+	IAF_ATTR_TIMESTAMP = 73,
+
+	IAF_ATTR_FPORT_TX_BYTES = 74,
+	IAF_ATTR_FPORT_RX_BYTES = 75,
+
+	IAF_ATTR_FPORT_BPS_LINK_SPEED_MAX = 76,
+
+	IAF_ATTR_FPORT_LQI_CHANGE_COUNT = 77,
+
+	IAF_ATTR_SUB_DEVICE_PORT_STATE_CHANGE_TRAP_COUNT = 78,
+	IAF_ATTR_SUB_DEVICE_PORT_LWD_TRAP_COUNT = 79,
+	IAF_ATTR_SUB_DEVICE_PORT_LQI_TRAP_COUNT = 80,
+	IAF_ATTR_SUB_DEVICE_QSFP_MGR_FAULT_TRAP_COUNT = 81,
+	IAF_ATTR_SUB_DEVICE_QSFP_MGR_PORT_PRESENT_TRAP_COUNT = 82,
+
+	IAF_ATTR_FABRIC_PORT_THROUGHPUT = 85,
+
+	_IAF_ATTR_COUNT,
+};
+
+enum iaf_fport_health {
+	IAF_FPORT_HEALTH_OFF = 0,
+	IAF_FPORT_HEALTH_FAILED = 1,
+	IAF_FPORT_HEALTH_DEGRADED = 2,
+	IAF_FPORT_HEALTH_HEALTHY = 3,
+
+	_IAF_FPORT_HEALTH_COUNT,
+};
+
+enum iaf_fport_type {
+	IAF_FPORT_TYPE_UNKNOWN = 0,
+	IAF_FPORT_TYPE_DISCONNECTED = 1,
+	IAF_FPORT_TYPE_FIXED = 2,
+	IAF_FPORT_TYPE_VARIABLE = 3,
+	IAF_FPORT_TYPE_STANDARD = 4,
+	IAF_FPORT_TYPE_SI_PHOTONICS = 5,
+
+	_IAF_FPORT_TYPE_COUNT,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/io.h b/drivers/gpu/drm/xe/fabric/io.h
new file mode 100644
index 0000000000000..46f622475fe44
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/io.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2020 Intel Corporation.
+ *
+ */
+
+#ifndef IO_H_INCLUDED
+#define IO_H_INCLUDED
+
+#include <linux/io.h>
+#include <linux/types.h>
+#include <linux/stddef.h>
+
+#include "iaf_drv.h"
+
+#define LEN_BYTES_SHIFT 3
+#define LEN_BYTES_MASK 0x0000000000000007ULL
+
+static inline
+void io_write(u64 __iomem *addr, const void *data, size_t len)
+{
+	size_t qwords = len >> LEN_BYTES_SHIFT;
+	u64 *qw_data = (u64 *)data;
+
+	for ( ; qwords; qwords--, addr++, qw_data++)
+		writeq(*qw_data, addr);
+
+	if (len & LEN_BYTES_MASK) {
+		u64 remaining_data = 0;
+
+		memcpy(&remaining_data, qw_data, len & LEN_BYTES_MASK);
+		writeq(remaining_data, addr);
+	}
+}
+
+static inline
+void io_readq_aligned(u64 __iomem *addr, void *data, size_t len)
+{
+	size_t qwords = len >> LEN_BYTES_SHIFT;
+	u64 *qw_data = (u64 *)data;
+
+	for ( ; qwords; qwords--, addr++, qw_data++)
+		*qw_data = readq(addr);
+
+	if (len & LEN_BYTES_MASK) {
+		u64 remaining_data = readq(addr);
+
+		memcpy(qw_data, &remaining_data, len & LEN_BYTES_MASK);
+	}
+}
+
+static inline
+void io_readq_unaligned(void __iomem *addr, void *data, size_t len)
+{
+	u64 __iomem *addr_aligned_64;
+	u64 leading_data;
+	size_t leading_data_offset;
+	size_t leading_data_sz;
+
+	if (!len)
+		return;
+
+	addr_aligned_64 = PTR_ALIGN_DOWN(addr, sizeof(u64));
+
+	if (addr_aligned_64 == addr) {
+		io_readq_aligned(addr_aligned_64, data, len);
+		return;
+	}
+
+	leading_data = readq(addr_aligned_64);
+	leading_data_offset = (u8 __iomem *)addr - (u8 __iomem *)addr_aligned_64;
+	leading_data_sz = sizeof(leading_data) - leading_data_offset;
+
+	memcpy(data, (u8 *)&leading_data + leading_data_offset, min(leading_data_sz, len));
+
+	if (len <= leading_data_sz)
+		return;
+
+	io_readq_aligned(++addr_aligned_64, (u8 *)data + leading_data_sz, len - leading_data_sz);
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/main.c b/drivers/gpu/drm/xe/fabric/main.c
new file mode 100644
index 0000000000000..4b220d5fa657e
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/main.c
@@ -0,0 +1,1098 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ */
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+#include <linux/auxiliary_bus.h>
+#else
+#include <linux/platform_device.h>
+#endif
+#include <linux/bitfield.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/rwsem.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+#include <generated/utsrelease.h>
+
+#include <drm/intel/intel_iaf_platform.h>
+
+#include "csr.h"
+#include "debugfs.h"
+#include "dev_diag.h"
+#include "fw.h"
+#include "iaf_drv.h"
+#include "mbdb.h"
+#include "mbox.h"
+#include "mei_iaf_user.h"
+#include "netlink.h"
+#include "port.h"
+#include "routing_engine.h"
+#include "routing_event.h"
+#include "routing_p2p.h"
+#if IS_ENABLED(CONFIG_IAF_DEBUG_SELFTESTS)
+#include "selftests/selftest.h"
+#endif
+#include "sysfs.h"
+#ifdef BPM_ADD_MODULE_VERSION_MACRO_IN_ALL_MOD
+#include <backport/bp_module_version.h>
+#endif
+
+#define MODULEDETAILS "Intel Corp. Intel fabric Driver"
+
+/* xarray of IAF devices */
+static DEFINE_XARRAY_ALLOC(intel_fdevs);
+
+/* Protects routable_list access and data with shared/excl semantics */
+DECLARE_RWSEM(routable_lock);
+LIST_HEAD(routable_list);
+
+/*
+ * Used for creating unique xarray hash.  Products need to be defined
+ * in the intel_iaf_platform.h file.
+ */
+#define PRODUCT_SHIFT 16
+
+static enum iaf_startup_mode param_startup_mode = STARTUP_MODE_DEFAULT;
+
+struct workqueue_struct *iaf_unbound_wq;
+
+static const char *startup_mode_name(enum iaf_startup_mode m)
+{
+	switch (m) {
+	case STARTUP_MODE_DEFAULT: return "default";
+	case STARTUP_MODE_PRELOAD: return "preload";
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+	case STARTUP_MODE_DEBUG: return "debug";
+	case STARTUP_MODE_FWDEBUG: return "fwdebug";
+#endif
+	}
+
+	return "(unknown)";
+}
+
+static int mode_set(const char *val, const struct kernel_param *kp)
+{
+	enum iaf_startup_mode new_mode;
+
+	if (sysfs_streq(val, "default"))
+		new_mode = STARTUP_MODE_DEFAULT;
+	else if (sysfs_streq(val, "preload"))
+		new_mode = STARTUP_MODE_PRELOAD;
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+	else if (sysfs_streq(val, "debug"))
+		new_mode = STARTUP_MODE_DEBUG;
+	else if (sysfs_streq(val, "fwdebug"))
+		new_mode = STARTUP_MODE_FWDEBUG;
+#endif
+	else
+		return -EINVAL;
+
+	param_startup_mode = new_mode;
+
+	return 0;
+}
+
+static int mode_get(char *val, const struct kernel_param *kp)
+{
+	return snprintf(val, PAGE_SIZE, startup_mode_name(param_startup_mode));
+}
+
+static const struct kernel_param_ops startup_mode_ops = {
+	.set = mode_set,
+	.get = mode_get,
+};
+
+module_param_cb(startup_mode, &startup_mode_ops, &param_startup_mode, 0600);
+#if IS_ENABLED(CONFIG_IAF_DEBUG_STARTUP)
+MODULE_PARM_DESC(startup_mode,
+		 "Operational mode for newly probed devices:\n"
+		 "\t\t - default: Operate normally\n"
+		 "\t\t - preload: Assume firmware/ini has already been loaded\n"
+		 "\t\t - debug:   Do not interact with the device outside of L8sim debug netlink\n"
+		 "\t\t - fwdebug: As per debug, but load firmware during device init"
+		 );
+#else
+MODULE_PARM_DESC(startup_mode,
+		 "Operational mode for newly probed devices:\n"
+		 "\t\t - default: Operate normally\n"
+		 "\t\t - preload: Assume firmware/ini has already been loaded"
+		 );
+#endif
+
+/* BPS Link Speed indexed by bit # as returned by fls set in port info fields */
+static u64 bps_link_speeds[] = {
+	0, /* fls returns index 0 when no bits are set. */
+	BPS_LINK_SPEED_12G,
+	BPS_LINK_SPEED_25G,
+	BPS_LINK_SPEED_53G,
+	BPS_LINK_SPEED_90G,
+	0,
+	0,
+	0,
+	0,
+};
+
+/**
+ * bps_link_speed - Returns link speed in bps for highest bit set in
+ *                  port info link speed
+ * @port_info_link_speed: speed as encoded in port info link speed
+ *
+ * Return: Speed in bits per second.
+ * 0 when no bits are set or bit set is out of range
+ */
+u64 bps_link_speed(u8 port_info_link_speed)
+{
+	return bps_link_speeds[fls(port_info_link_speed)];
+}
+
+#define RELEASE_TIMEOUT (HZ * 60)
+
+static void fdev_release(struct kref *kref)
+{
+	struct fdev *dev = container_of(kref, typeof(*dev), refs);
+
+	xa_erase(&intel_fdevs, dev->fabric_id);
+	complete(&dev->fdev_released);
+}
+
+void fdev_put(struct fdev *dev)
+{
+	kref_put(&dev->refs, fdev_release);
+}
+
+static struct fdev *fdev_get(struct fdev *dev)
+{
+	if (dev && kref_get_unless_zero(&dev->refs))
+		return dev;
+
+	return NULL;
+}
+
+/**
+ * fdev_get_early - Acquire a reference unconditionally from probe context.
+ * @dev: the device to operate on
+ */
+void fdev_get_early(struct fdev *dev)
+{
+	kref_get(&dev->refs);
+}
+
+int fdev_insert(struct fdev *dev)
+{
+	int err;
+
+	kref_init(&dev->refs);
+	init_completion(&dev->fdev_released);
+
+	err = xa_insert(&intel_fdevs, dev->fabric_id, dev, GFP_KERNEL);
+	if (err)
+		dev_warn(fdev_dev(dev), "fabric_id 0x%08x already in use\n",
+			 dev->fabric_id);
+
+	return err;
+}
+
+int fdev_process_each(fdev_process_each_cb_t cb, void *args)
+{
+	struct fdev *dev;
+	unsigned long i;
+
+	xa_lock(&intel_fdevs);
+	xa_for_each(&intel_fdevs, i, dev) {
+		int ret;
+
+		if (!fdev_get(dev))
+			continue;
+
+		xa_unlock(&intel_fdevs);
+		ret = cb(dev, args);
+		fdev_put(dev);
+		if (ret)
+			return ret;
+
+		xa_lock(&intel_fdevs);
+	}
+	xa_unlock(&intel_fdevs);
+
+	return 0;
+}
+
+static void fdev_wait_on_release(struct fdev *dev)
+{
+	fdev_put(dev);
+
+	wait_for_completion_killable_timeout(&dev->fdev_released,
+					     RELEASE_TIMEOUT);
+}
+
+/*
+ * Returns with reference count for the fdev incremented when found.
+ * It is the callers responsibility to decrement the reference count.
+ */
+struct fdev *fdev_find(u32 fabric_id)
+{
+	struct fdev *dev;
+
+	xa_lock(&intel_fdevs);
+	dev = fdev_get(xa_load(&intel_fdevs, fabric_id));
+	xa_unlock(&intel_fdevs);
+
+	return dev;
+}
+
+struct fdev *fdev_find_by_sd_guid(u64 guid)
+{
+	struct fdev *dev, *referenced_dev;
+	unsigned long d;
+	u8 s;
+
+	xa_lock(&intel_fdevs);
+
+	/* dev becomes NULL if xa_for_each() completes */
+	xa_for_each(&intel_fdevs, d, dev)
+		for (s = 0; s < dev->pd->sd_cnt; ++s)
+			if (dev->sd[s].guid == guid)
+				goto end_iteration;
+
+end_iteration:
+
+	referenced_dev = fdev_get(dev);
+
+	xa_unlock(&intel_fdevs);
+
+	return referenced_dev;
+}
+
+struct fsubdev *find_sd_id(u32 fabric_id, u8 sd_index)
+{
+	struct fdev *dev = fdev_find(fabric_id);
+
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	if (sd_index < dev->pd->sd_cnt) {
+		struct fsubdev *sd = &dev->sd[sd_index];
+
+		/* prevents aggressive netlink use from accessing sd before we are ready */
+		if (READ_ONCE(sd->fw_running))
+			return sd;
+
+		fdev_put(dev);
+
+		return ERR_PTR(-EAGAIN);
+	}
+
+	fdev_put(dev);
+
+	return ERR_PTR(-EINVAL);
+}
+
+struct fsubdev *find_routable_sd(u64 guid)
+{
+	struct fsubdev *sd = NULL;
+
+	list_for_each_entry(sd, &routable_list, routable_link)
+		if (sd->guid == guid)
+			return sd;
+
+	return NULL;
+}
+
+/* configured by request_irq() to refer to corresponding struct fsubdev */
+static irqreturn_t handle_iaf_irq(int irq, void *arg)
+{
+	struct fsubdev *sd = arg;
+
+	return mbdb_handle_irq(sd);
+}
+
+static struct query_info *handle_query(void *handle, u32 fabric_id)
+{
+	struct fdev *src, *dst;
+	struct query_info *qi;
+
+	/*
+	 * src fdev is guaranteed to never be removed during this invocation by
+	 * the caller
+	 */
+	src = handle;
+
+	dst = fdev_find(fabric_id);
+	if (!dst)
+		return ERR_PTR(-ENODEV);
+
+	qi = kmalloc(struct_size(qi, sd2sd, src->pd->sd_cnt * dst->pd->sd_cnt),
+		     GFP_KERNEL);
+	if (qi) {
+		qi->src_cnt = src->pd->sd_cnt;
+		qi->dst_cnt = dst->pd->sd_cnt;
+		routing_p2p_lookup(src, dst, qi);
+	} else {
+		qi = ERR_PTR(-ENOMEM);
+	}
+
+	fdev_put(dst);
+
+	return qi;
+}
+
+/**
+ * mappings_ref_get - Increment mapping reference count
+ * @dev: pointer to a valid fdev
+ *
+ * Allow the parent to indicate that a buffer has been mapped
+ *
+ * NOTE: NO other lock can be taken with mapping_ref lock held.
+ * (see disable_<usage_>fports()).
+ *
+ * return: -1 reference count failed, do not allow mapping
+ */
+static int mappings_ref_get(struct fdev *dev)
+{
+	/* protect port_unroute_list read */
+	down_write(&routable_lock); /* exclusive lock */
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev_dbg(fdev_dev(dev), "count: %d\n", dev->mappings_ref.count);
+
+	if (!list_empty(&dev->port_unroute_list) ||
+	    dev->mappings_ref.remove_in_progress) {
+		mutex_unlock(&dev->mappings_ref.lock);
+		up_write(&routable_lock);
+		return -EBUSY;
+	}
+
+	dev->mappings_ref.count++;
+
+	mutex_unlock(&dev->mappings_ref.lock);
+	up_write(&routable_lock);
+
+	return 0;
+}
+
+/**
+ * mappings_ref_put - Decrement mapping reference count
+ * @dev: pointer to a valid fdev
+ *
+ * Allow the parent to indicate that a buffer has been unmapped
+ *
+ * A negative value allows remove to proceed.
+ *
+ * return: -1 indicate an unbalanced put call
+ */
+static int mappings_ref_put(struct fdev *dev)
+{
+	int ret = 0;
+
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev_dbg(fdev_dev(dev), "count: %d\n", dev->mappings_ref.count);
+
+	/*
+	 * in the case of device removal, permit an extra decrement, which is
+	 * used to signal completion to the remove context.
+	 */
+	if (dev->mappings_ref.count > 1 ||
+	    dev->mappings_ref.remove_in_progress) {
+		dev->mappings_ref.count--;
+
+		if (dev->mappings_ref.count == 0)
+			complete(&dev->mappings_ref.complete);
+
+	} else {
+		ret = -1;
+	}
+
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	return ret;
+}
+
+/**
+ * mappings_ref_wait - Driver decrement (inited to 1), and wait for zero count
+ * @dev: valid device
+ *
+ */
+static void mappings_ref_wait(struct fdev *dev)
+{
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev->mappings_ref.remove_in_progress = true;
+	dev->mappings_ref.count--;
+
+	if (dev->mappings_ref.count == 0) {
+		mutex_unlock(&dev->mappings_ref.lock);
+		return;
+	}
+
+	dev_warn(fdev_dev(dev), "mappings_ref_map != 0 (%d) will wait\n",
+		 dev->mappings_ref.count);
+
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	wait_for_completion_killable(&dev->mappings_ref.complete);
+}
+
+/**
+ * mappings_ref_check - Determine if there are any pending mappings
+ * @dev: valid device
+ *
+ * Return: true: mappings reference is in use
+ */
+bool mappings_ref_check(struct fdev *dev)
+{
+	int count;
+
+	mutex_lock(&dev->mappings_ref.lock);
+	count = dev->mappings_ref.count;
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	return count > 1;
+}
+
+static int handle_parent_event(void *handle, enum iaf_parent_event event)
+{
+	struct fdev *dev = handle;
+
+	switch (event) {
+	case IAF_PARENT_PCIE_ERR:
+		dev_err(fdev_dev(dev), "PCIE error received\n");
+		WRITE_ONCE(dev->dev_disabled, true);
+		return 0;
+
+	case IAF_PARENT_MAPPING_GET:
+		return mappings_ref_get(dev);
+
+	case IAF_PARENT_MAPPING_PUT:
+		return mappings_ref_put(dev);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct iaf_ops iaf_ops = {
+	.connectivity_query = handle_query,
+	.parent_event = handle_parent_event,
+};
+
+static int validate_product(struct fsubdev *sd)
+{
+	if (dev_is_startup_debug(sd->fdev))
+		return 0;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	switch (sd->fdev->pd->product) {
+	case IAF_PONTEVECCHIO:
+		sd->asic_rev_info = readq(sd->csr_base + CSR_ASIC_REV_INFO);
+		if (!IS_ANR(sd)) {
+			sd_err(sd, "Unsupported subdevice revision 0x%016llx\n",
+			       sd->asic_rev_info);
+			return -EINVAL;
+		}
+		sd_dbg(sd, "asic rev info 0x%016llx\n", sd->asic_rev_info);
+		break;
+	default:
+		sd_err(sd, "Unrecognized product type %d for subdevice\n",
+		       sd->fdev->pd->product);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct resource *iaf_find_res(struct fdev *dev, unsigned int type,
+				     int index)
+{
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	int i;
+	int offset;
+
+	for (i = 0; i < dev->pd->num_resources; i++) {
+		offset = index * dev->pd->sd_cnt + i;
+		if (resource_type(&dev->pd->resources[offset]) == type)
+			return &dev->pd->resources[offset];
+	}
+
+	return NULL;
+#else
+	return platform_get_resource(dev->pdev, type, index);
+#endif
+}
+
+static int add_subdevice(struct fsubdev *sd, struct fdev *dev, int index)
+{
+	struct resource *res;
+	int err;
+
+	sd->fdev = dev;
+
+	snprintf(sd->name, sizeof(sd->name), SD_ID_FMT, index);
+
+	res = iaf_find_res(dev, IORESOURCE_MEM, index);
+	if (!res) {
+		sd_err(sd, "No MEM resource available\n");
+		return -ENOMEM;
+	}
+	sd->csr_base = ioremap(res->start, resource_size(res));
+	if (!sd->csr_base) {
+		sd_err(sd, "Unable to map resource %pR to kvirt\n", res);
+		return -ENOMEM;
+	}
+	sd_dbg(sd, "mapped resource %pR to mb_base %p\n", res, sd->csr_base);
+
+	err = validate_product(sd);
+	if (err) {
+		iounmap(sd->csr_base);
+		return err;
+	}
+
+	WRITE_ONCE(sd->fw_running, false);
+
+	mutex_init(&sd->pm_work_lock);
+	sd->ok_to_schedule_pm_work = false;
+
+	res = iaf_find_res(dev, IORESOURCE_IRQ, index);
+	if (!res) {
+		sd_err(sd, "No IRQ resource available\n");
+		iounmap(sd->csr_base);
+		return -EINVAL;
+	}
+	sd_dbg(sd, "IRQ resource %pR\n", res);
+
+	sd->irq = res->start;
+	err = request_irq(sd->irq, handle_iaf_irq, 0, "intel_sd_irq", sd);
+	if (err) {
+		sd_err(sd, "failed to request_irq %d  err: %d\n", sd->irq, err);
+		iounmap(sd->csr_base);
+		return err;
+	}
+
+	mutex_init(&sd->cport_init_ctrl_reg_lock);
+
+	create_dev_debugfs_dir(sd);
+
+	err = create_mbdb(sd);
+
+	if (err) {
+		sd_err(sd, "Message Box allocation failure\n");
+		free_irq(sd->irq, sd);
+		iounmap(sd->csr_base);
+		return err;
+	}
+
+	routing_sd_init(sd);
+
+	sd_dbg(sd, "Adding IAF subdevice: %d\n", index);
+
+	INIT_LIST_HEAD(&sd->routable_link);
+
+	return 0;
+}
+
+static void remove_subdevice(struct fsubdev *sd)
+{
+	destroy_fports(sd);
+	destroy_mbdb(sd);
+	mutex_destroy(&sd->cport_init_ctrl_reg_lock);
+	free_irq(sd->irq, sd);
+	iounmap(sd->csr_base);
+	sd_dbg(sd, "Removed IAF resource: %p\n", sd->csr_base);
+	sd->csr_base = NULL;
+}
+
+/*
+ * Cause a subdevice to (eventually) fail, synchronizing with routing. The full
+ * effect may not be immediate.
+ */
+static void fail_subdevice(struct fsubdev *sd)
+{
+	if (test_and_set_bit(SD_ERROR_FAILED, sd->errors))
+		return;
+
+	sd_err(sd, "subdevice failed, shutting down\n");
+}
+
+/*
+ * Indicate that there has been a subdevice error
+ */
+void indicate_subdevice_error(struct fsubdev *sd, enum sd_error err)
+{
+	if (test_and_set_bit(err, sd->errors))
+		return;
+
+	switch (err) {
+	case SD_ERROR_FW:
+		sd_err(sd, "FW error detected\n");
+		break;
+
+	case SD_ERROR_FAILED:
+	default:
+		sd_err(sd, "unknown error detected\n");
+		break;
+	}
+
+	fail_subdevice(sd);
+}
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+static void iaf_remove(struct auxiliary_device *pdev)
+#else
+static int iaf_remove(struct platform_device *pdev)
+#endif
+{
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	struct iaf_pdata *pd = container_of(pdev, struct iaf_pdata, aux_dev);
+#else
+	struct iaf_pdata *pd = dev_get_platdata(&pdev->dev);
+#endif
+	struct fdev *dev = dev_get_drvdata(&pdev->dev);
+	u8 i;
+
+	dev_dbg(&pdev->dev, "Removing %s\n", dev_name(&pdev->dev));
+
+	/*
+	 * let the parent know an unregister is coming and allow it
+	 * to do some pre-cleanup if possible
+	 */
+	pd->dev_event(pd->parent, dev, IAF_DEV_REMOVE, NULL);
+
+	mappings_ref_wait(dev);
+
+	/*
+	 * intentionally unregister with mei before the flush to maximize
+	 * the chance that remove will prevent an outstanding async init
+	 * from programming a new min SVN
+	 */
+	iaf_mei_stop(dev);
+
+	/*
+	 * NOTE: any remove steps performed prior to this flush will race
+	 *       with the asynchronous device initialization
+	 */
+	flush_any_outstanding_fw_initializations(dev);
+
+	remove_debugfs(dev);
+
+	iaf_sysfs_remove(dev);
+
+	pd->unregister_dev(pd->parent, dev);
+
+	WRITE_ONCE(dev->registered, false);
+
+	fdev_wait_on_release(dev);
+
+	/*
+	 * synchronize with routing to remove the device without disrupting
+	 * traffic.  note that during driver unload, both the routing engine
+	 * and event manager will be stopped, and this will not wait
+	 */
+	routing_dev_unroute(dev);
+
+	for (i = 0; i < pd->sd_cnt; i++)
+		remove_subdevice(&dev->sd[i]);
+
+	routing_p2p_clear(dev);
+
+	pm_runtime_put(fdev_dev(dev));
+	pm_runtime_allow(fdev_dev(dev));
+	pm_runtime_disable(fdev_dev(dev));
+
+	WARN(kref_read(&dev->refs), "fabric_id 0x%08x has %u references",
+	     dev->fabric_id, kref_read(&dev->refs));
+
+	kfree(dev->psc.brand);
+	kfree(dev->psc.product);
+	for (i = 0; i < pd->sd_cnt; i++)
+		if (!dev->psc.ini_buf[i].do_not_free)
+			kfree(dev->psc.ini_buf[i].data);
+	kfree(dev->psc.presence_rules);
+	kfree(dev->psc.txcal);
+	kfree(dev);
+#if !IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	return 0;
+#endif
+}
+
+static u32 dev_fabric_id(struct iaf_pdata *pd)
+{
+	return pd->product << PRODUCT_SHIFT | pd->index;
+}
+
+/**
+ * iaf_complete_init_dev - Complete initialization for a device
+ * @dev: the device to operate on
+ *
+ * called by load_and_init_subdev [fw.c] after last sd initialized
+ * - set up sysfs
+ * - indicate that all sd's for this device have been initialized
+ * - commit software version number for anti-rollback
+ */
+void iaf_complete_init_dev(struct fdev *dev)
+{
+	/*
+	 * currently works in all startup modes, could be conditioned here by
+	 * skipping this call
+	 */
+	iaf_sysfs_init(dev);
+
+	/*
+	 * when appropriate, indicate that all sd's for this device have been
+	 * fully initialized
+	 */
+	if (!dev_is_runtime_debug(dev))
+		/* checked by netlink agent to reject early requests */
+		smp_store_release(&dev->all_sds_inited, true);
+
+	/*
+	 * Poke the MEI submodule to indicate that the device is functioning properly. If enabled
+	 * and currently allowed, automatic anti-rollback protection will be initiated.
+	 */
+	iaf_mei_indicate_device_ok(dev);
+
+	dev_dbg(fdev_dev(dev), "device init complete\n");
+}
+
+static void read_gpio_link_config_pins(struct fdev *dev)
+{
+	u64 gpio_ctrl;
+
+	if (unlikely(READ_ONCE(dev->dev_disabled)))
+		return;
+
+	gpio_ctrl = readq(dev->sd[0].csr_base + CSR_GPIO_CTRL);
+
+	dev->link_config = FIELD_GET(GPIO_CTRL_PIN_LINK_CONFIG, gpio_ctrl);
+
+	if (FIELD_GET(GPIO_CTRL_OE_LINK_CONFIG, gpio_ctrl))
+		dev_warn(fdev_dev(dev), "Link config pins are configured as outputs: %02llx\n",
+			 FIELD_GET(GPIO_CTRL_OE_LINK_CONFIG, gpio_ctrl));
+}
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+static int iaf_probe(struct auxiliary_device *pdev, const struct auxiliary_device_id *id)
+#else
+static int iaf_probe(struct platform_device *pdev)
+#endif
+{
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	struct iaf_pdata *pd = container_of(pdev, struct iaf_pdata, aux_dev);
+	struct device *dev_parent = pdev->dev.parent;
+#else
+	struct iaf_pdata *pd = dev_get_platdata(&pdev->dev);
+	struct device *dev_parent = pdev->dev.parent;
+#endif
+	struct fdev *dev;
+	u8 sds_added = 0;
+	int err;
+	u8 i;
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	dev_info(&pdev->dev,
+		 "Probing %s, connection point for %s, fabric_id 0x%08x socket_id 0x%02x, sd_cnt %u\n",
+		 dev_name(&pdev->dev),
+		 dev_parent ? dev_name(dev_parent) : "UNKNOWN SOURCE",
+		 dev_fabric_id(pd), pd->socket_id, pd->sd_cnt);
+#else
+	dev_info(&pdev->dev,
+		 "Probing %s with MFD, connection point for %s, fabric_id 0x%08x socket_id 0x%02x, sd_cnt %u\n",
+		 dev_name(&pdev->dev),
+		 dev_parent ? dev_name(dev_parent) : "UNKNOWN SOURCE",
+		 dev_fabric_id(pd), pd->socket_id, pd->sd_cnt);
+#endif
+
+	if (pd->version != IAF_VERSION)
+		return -EPERM;
+
+	if (!pd->register_dev || !pd->unregister_dev)
+		return -EINVAL;
+
+	if (pd->socket_id >= MAX_SOCKET_IDS)
+		return -EINVAL;
+
+	if (!pd->sd_cnt || pd->sd_cnt > IAF_MAX_SUB_DEVS)
+		return -EINVAL;
+
+	if (!pd->dpa.pkg_size)
+		return -EINVAL;
+
+	dev_dbg(&pdev->dev, "DPA offset: %dGB  size: %dGB\n",
+		pd->dpa.pkg_offset, pd->dpa.pkg_size);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	kernel_param_lock(THIS_MODULE);
+	dev->startup_mode = param_startup_mode;
+	kernel_param_unlock(THIS_MODULE);
+
+	if (dev->startup_mode != STARTUP_MODE_DEFAULT)
+		dev_info(&pdev->dev, "startup_mode: %s",
+			 startup_mode_name(dev->startup_mode));
+
+	dev->fabric_id = dev_fabric_id(pd);
+	dev->pd = pd;
+	dev->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, dev);
+
+	err = fdev_insert(dev);
+	if (err) {
+		kfree(dev);
+		return err;
+	}
+
+	err = iaf_sysfs_probe(dev);
+	if (err)
+		goto sysfs_error;
+
+	dev->mappings_ref.count = 1;
+	mutex_init(&dev->mappings_ref.lock);
+	init_completion(&dev->mappings_ref.complete);
+	INIT_LIST_HEAD(&dev->port_unroute_list);
+
+	/*
+	 * The IAF cannot be suspended via runtime, but the parent could have
+	 * the capability.  Set runtime to forbid to be explicit about what
+	 * the requirement is.  Do a get to make sure that suspend cannot be
+	 * started externally (i.e. sysfs), to keep the parent from going to
+	 * sleep.
+	 * If the parent is asleep at this time, pm_runtime_forbid will cause
+	 * it to resume.
+	 */
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+	pm_runtime_get(&pdev->dev);
+
+	err = pd->register_dev(pd->parent, dev, dev->fabric_id, &iaf_ops);
+	if (err) {
+		iaf_sysfs_remove(dev);
+		goto sysfs_error;
+	}
+
+	WRITE_ONCE(dev->registered, true);
+
+	init_debugfs(dev);
+
+	for (sds_added = 0; sds_added < pd->sd_cnt; ++sds_added) {
+		err = add_subdevice(&dev->sd[sds_added], dev, sds_added);
+		if (err)
+			goto add_error;
+	}
+
+	err = iaf_mei_start(dev);
+	if (err) {
+		dev_err(fdev_dev(dev), "failed to register as MEI user\n");
+		goto add_error;
+	}
+
+	/* read link config before initializing FW since it may also use GPIO */
+	read_gpio_link_config_pins(dev);
+
+	fw_init_dev(dev);
+
+	err = load_and_init_fw(dev);
+	if (err)
+		goto load_error;
+
+	return 0;
+
+load_error:
+	flush_any_outstanding_fw_initializations(dev);
+	iaf_mei_stop(dev);
+
+add_error:
+	iaf_sysfs_remove(dev);
+	for (i = 0; i < sds_added; ++i)
+		remove_subdevice(&dev->sd[i]);
+
+	pd->unregister_dev(pd->parent, dev);
+
+sysfs_error:
+	remove_debugfs(dev);
+	dev->dir_node = NULL;
+	fdev_wait_on_release(dev);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	kfree(dev);
+	return err;
+}
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+static const struct auxiliary_device_id iaf_id_table[] = {
+	{ .name = "i915.iaf", },
+	{ .name = "xe.iaf", },
+	{},
+};
+
+static struct auxiliary_driver iaf_driver = {
+	.probe = iaf_probe,
+	.remove = iaf_remove,
+	.id_table = iaf_id_table,
+};
+
+#else
+
+static struct platform_driver iaf_driver = {
+	.driver = {
+		.name           = DRIVER_NAME,
+	},
+	.probe                  = iaf_probe,
+	.remove                 = iaf_remove,
+};
+#endif
+
+/*
+ * If the driver is waiting for the SPI driver to become available,
+ * (to get PSCBIN information from the IFWI, short circuit the wait
+ * time so unload can complete without waiting for the timeout.
+ */
+static void fw_abort(void)
+{
+	struct fdev *dev;
+	unsigned long i;
+
+	xa_lock(&intel_fdevs);
+	xa_for_each(&intel_fdevs, i, dev)
+		complete_all(&dev->psc.abort);
+	xa_unlock(&intel_fdevs);
+}
+
+bool is_fdev_registered(struct fdev *dev)
+{
+	return READ_ONCE(dev->registered);
+}
+
+/*
+ * Check that both ends of the port pair are registered.
+ */
+bool is_fport_registered(struct fport *port)
+{
+	if (is_fdev_registered(port->sd->fdev)) {
+		struct fdev *neighbor_dev = fdev_find_by_sd_guid(port->portinfo->neighbor_guid);
+
+		if (neighbor_dev) {
+			bool registered = is_fdev_registered(neighbor_dev);
+
+			fdev_put(neighbor_dev);
+			return registered;
+		}
+	}
+
+	return false;
+}
+
+static void __exit iaf_unload_module(void)
+{
+	pr_notice("Unloading %s\n", MODULEDETAILS);
+
+	mbox_term_module();
+	nl_term();
+
+	fw_abort();
+
+	flush_workqueue(iaf_unbound_wq);
+
+	/* notify routing event manager to minimize delays since we are shutting down */
+	rem_shutting_down();
+
+	/* remove all existing iaf devices */
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	auxiliary_driver_unregister(&iaf_driver);
+#else
+	platform_driver_unregister(&iaf_driver);
+#endif
+	/* stop routing and destroy the network topology */
+	rem_stop();
+	routing_stop();
+	routing_destroy();
+
+	remove_debugfs_root_nodes();
+
+	destroy_workqueue(iaf_unbound_wq);
+
+	pr_notice("%s Unloaded\n", MODULEDETAILS);
+}
+module_exit(iaf_unload_module);
+
+/*
+ * \brief Loads the module into kernel space and does global initializations.
+ * Called by insmod or modprobe.
+ */
+static int __init iaf_load_module(void)
+{
+	int err;
+
+	pr_notice("Initializing %s\n", MODULEDETAILS);
+	pr_debug("Built for Linux Kernel %s\n", UTS_RELEASE);
+
+	iaf_unbound_wq = alloc_workqueue("iaf_unbound_wq", WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!iaf_unbound_wq)
+		return -ENOMEM;
+
+	create_debugfs_root_nodes();
+
+#if IS_ENABLED(CONFIG_IAF_DEBUG_SELFTESTS)
+	if (selftests_run()) {
+		err = -ENODEV;
+		goto exit;
+	}
+#endif
+
+	routing_init();
+	rem_init();
+	mbdb_init_module();
+	mbox_init_module();
+	err = nl_init();
+	if (err)
+		goto exit;
+	fw_init_module();
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	err = auxiliary_driver_register(&iaf_driver);
+	if (err)
+		pr_err("Cannot register with auxiliary bus\n");
+#else
+	err = platform_driver_register(&iaf_driver);
+	if (err)
+		pr_err("Cannot register with platform bus\n");
+#endif
+
+exit:
+	if (err) {
+		mbox_term_module();
+		nl_term();
+		remove_debugfs_root_nodes();
+		destroy_workqueue(iaf_unbound_wq);
+	}
+
+	return err;
+}
+module_init(iaf_load_module);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION(MODULEDETAILS);
+MODULE_LICENSE("GPL and additional rights");
+#ifdef BPM_ADD_MODULE_VERSION_MACRO_IN_ALL_MOD
+MODULE_VERSION(BACKPORT_MOD_VER);
+#endif
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+MODULE_ALIAS("auxiliary:i915.iaf");
+MODULE_ALIAS("auxiliary:xe.iaf");
+#else
+MODULE_ALIAS("platform:iaf");
+#endif
+MODULE_FIRMWARE("i915/pvc_iaf_ver1.bin");
+MODULE_FIRMWARE("i915/pvc_iaf_ver1d.bin");
+MODULE_FIRMWARE("i915/pvc_iaf_ver1e.bin");
+MODULE_FIRMWARE("i915/default_iaf.pscbin");
diff --git a/drivers/gpu/drm/xe/fabric/mbdb.c b/drivers/gpu/drm/xe/fabric/mbdb.c
new file mode 100644
index 0000000000000..0b19a6628be96
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mbdb.c
@@ -0,0 +1,1173 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/semaphore.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/completion.h>
+#include <linux/io.h>
+
+#include "fw.h"
+#include "iaf_drv.h"
+#include "io.h"
+#include "mbdb.h"
+#include "ops.h"
+#include "port.h"
+#include "trace.h"
+
+/* Mailbox private structures */
+
+#define CP_ADDR_MBDB_INT_STATUS_UNMASKED (CP_ADDR_MBDB_BASE + 0x00)
+#define CP_ADDR_MBDB_INT_ENABLE_MASK     (CP_ADDR_MBDB_BASE + 0x08)
+#define CP_ADDR_MBDB_INT_STATUS_MASKED   (CP_ADDR_MBDB_BASE + 0x10)
+#define CP_ADDR_MBDB_INT_ACK             (CP_ADDR_MBDB_BASE + 0x18)
+#define CP_ADDR_MBDB_INT_PARTNER_SET     (CP_ADDR_MBDB_BASE + 0x20)
+#define CP_ADDR_MBDB_INT_STATUS_GPSB     (CP_ADDR_MBDB_BASE + 0x28)
+#define CP_ADDR_MBDB_DB0_STATUS          (CP_ADDR_MBDB_BASE + 0x40)
+#define CP_ADDR_MBDB_DB0_DEC             (CP_ADDR_MBDB_BASE + 0x48)
+#define CP_ADDR_MBDB_DB0_RESET           (CP_ADDR_MBDB_BASE + 0x50)
+#define CP_ADDR_MBDB_DB1_STATUS          (CP_ADDR_MBDB_BASE + 0x60)
+#define CP_ADDR_MBDB_DB1_DEC             (CP_ADDR_MBDB_BASE + 0x68)
+#define CP_ADDR_MBDB_DB1_RESET           (CP_ADDR_MBDB_BASE + 0x60)
+#define CP_ADDR_MBDB_DB2_STATUS          (CP_ADDR_MBDB_BASE + 0x80)
+#define CP_ADDR_MBDB_DB2_INC             (CP_ADDR_MBDB_BASE + 0x88)
+#define CP_ADDR_MBDB_DB3_STATUS          (CP_ADDR_MBDB_BASE + 0xA0)
+#define CP_ADDR_MBDB_DB3_INC             (CP_ADDR_MBDB_BASE + 0xA8)
+#define CP_ADDR_MBDB_SEM0_ACQUIRE        (CP_ADDR_MBDB_BASE + 0xC0)
+#define CP_ADDR_MBDB_SEM0_RELEASE        (CP_ADDR_MBDB_BASE + 0xC8)
+#define CP_ADDR_MBDB_SEM1_ACQUIRE        (CP_ADDR_MBDB_BASE + 0xD0)
+#define CP_ADDR_MBDB_SEM1_RELEASE        (CP_ADDR_MBDB_BASE + 0xD8)
+#define CP_ADDR_MBDB_SEM2_ACQUIRE        (CP_ADDR_MBDB_BASE + 0xE0)
+#define CP_ADDR_MBDB_SEM2_RELEASE        (CP_ADDR_MBDB_BASE + 0xE8)
+#define CP_ADDR_MBDB_SEM3_ACQUIRE        (CP_ADDR_MBDB_BASE + 0xF0)
+#define CP_ADDR_MBDB_SEM3_RELEASE        (CP_ADDR_MBDB_BASE + 0xF8)
+#define CP_ADDR_MBDB_MISC_SHARED         (CP_ADDR_MBDB_BASE + 0x100)
+#define CP_ADDR_MBDB_GP_DATA             (CP_ADDR_MBDB_BASE + 0x1000)
+
+#define S_INT_STATUS_DB0_INT       0
+#define S_INT_STATUS_DB1_INT       1
+#define S_INT_STATUS_SEM0_ACQUIRED 2
+#define S_INT_STATUS_SEM1_ACQUIRED 3
+#define S_INT_STATUS_SEM2_ACQUIRED 4
+#define S_INT_STATUS_SEM3_ACQUIRED 5
+#define S_INT_STATUS_INBOX_FULL    6
+#define S_INT_STATUS_OUTBOX_EMPTY  7
+
+#define INBOX_FULL_MASK   (BIT_ULL_MASK(S_INT_STATUS_INBOX_FULL))
+#define OUTBOX_EMPTY_MASK (BIT_ULL_MASK(S_INT_STATUS_OUTBOX_EMPTY))
+
+#define TIMEOUT (60 * HZ)
+
+#include <linux/module.h>
+#include <linux/timer.h>
+
+struct mbdb {
+	struct fsubdev *sd;
+	bool stopping;
+	bool polling;
+	atomic_t pending_new_seq;
+
+	u64 __iomem *int_status_unmasked_addr;
+	u64 __iomem *int_status_masked_addr;
+	u64 __iomem *int_ack_addr;
+	u64 __iomem *int_partner_set_addr;
+	u64 __iomem *int_enable_mask_addr;
+	u64 __iomem *gp_outbox_data_addr;
+	u64 __iomem *gp_outbox_cw_addr;
+	u64 __iomem *gp_outbox_param_addr;
+	u64 __iomem *gp_inbox_data_addr;
+	u64 __iomem *gp_inbox_cw_addr;
+	u64 __iomem *gp_inbox_param_addr;
+
+	u64 __iomem *gp_misc_shared;
+
+	/* Protect outbox access */
+	struct semaphore outbox_sem;
+	struct completion outbox_empty;
+	u8 outbox_seqno;
+
+	struct work_struct inbox_full;
+	u8 inbox_seqno;
+
+	/* tid get+increment protected by inbox_mutex */
+	u32 inbox_tid;
+
+	/* list mutation protected by inbox_mutex */
+	struct list_head ibox_list;
+
+	/* Protect irq access */
+	spinlock_t irq_spinlock;
+	u64 int_enables;
+
+	/* Protect pci bar space access */
+	struct mutex ack_mutex;
+	/* Protect pci bar space access */
+	struct mutex partner_set_mutex;
+
+	u64 counters[MBDB_COUNTERS_MAX];
+
+	/* Serializes inbox accesses */
+	struct mutex inbox_mutex;
+	atomic_t ibox_waiters;
+	struct completion ibox_waiters_done;
+
+	/* Protect inbox access */
+	struct timer_list inbox_timer;
+};
+
+#define MBDB_SLOW_POLL_TIMEOUT (HZ)
+#define MBDB_FAST_POLL_TIMEOUT 5
+
+static unsigned int mbdb_polling_mode;
+
+static void mbdb_disable_interrupts(struct mbdb *mbdb, u64 intr_mask);
+static void mbdb_enable_interrupts(struct mbdb *mbdb, u64 intr_mask);
+
+static void inbox_full_enqueue(struct mbdb *mbdb)
+{
+	/*
+	 * general-purpose guard to ensure that a post-stop flush() in the
+	 * destroy path is sufficient to guarantee the inbox worker is dead
+	 */
+	if (!READ_ONCE(mbdb->stopping))
+		queue_work(iaf_unbound_wq, &mbdb->inbox_full);
+}
+
+static void inbox_timer_fn(struct timer_list *timer)
+{
+	struct mbdb *mbdb = timer_container_of(mbdb, timer, inbox_timer);
+
+	inbox_full_enqueue(mbdb);
+	mod_timer(&mbdb->inbox_timer, jiffies + MBDB_SLOW_POLL_TIMEOUT);
+}
+
+/**
+ * mbdb_readq - Perform csr readq checking for pci bus in error condition
+ * @mbdb: mailbox being checked
+ * @addr: address of csr to read
+ * @reg_val: address where read csr data should be returned
+ *
+ * This should only be used for status csr reads as they never return ~0ULL.
+ * Data reads of the mailbox, in response to a mailbox operation, can return ~0ULL and should NEVER
+ * call this function as this would cause the device to be disabled when it is functioning normally.
+ *
+ * Return:
+ * * 0 on success
+ * * -EIO on failure
+ */
+static int mbdb_readq(struct mbdb *mbdb, u64 __iomem *addr, u64 *reg_val)
+{
+	if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled)))
+		return -EIO;
+
+	*reg_val = readq(addr);
+
+	/* Check if the pci bus has failed */
+	if (unlikely(*reg_val == ~0ULL)) {
+		WRITE_ONCE(mbdb->sd->fdev->dev_disabled, true);
+		dev_err(fdev_dev(mbdb->sd->fdev),
+			"PCIE bus error detected. Device has been disabled\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int mbdb_wait_outbox_empty(struct mbdb *mbdb)
+{
+	int wait_time;
+	int timeout;
+	u64 reg_val;
+
+	for (wait_time = 0; wait_time < TIMEOUT;
+	     wait_time += MBDB_FAST_POLL_TIMEOUT - timeout) {
+		if (READ_ONCE(mbdb->stopping))
+			return -ENODEV;
+
+		if (mbdb_readq(mbdb, mbdb->int_status_unmasked_addr, &reg_val))
+			return -EIO;
+
+		if (reg_val & OUTBOX_EMPTY_MASK)
+			return 0;
+
+		timeout =
+			schedule_timeout_interruptible(MBDB_FAST_POLL_TIMEOUT);
+	}
+
+	return -ETIMEDOUT;
+}
+
+#define MBDB_POLLING_MODE_TILE_ENABLE BIT(31)
+#define MBDB_POLLING_MODE_TILE_MASK GENMASK(IAF_MAX_SUB_DEVS - 1, 0)
+
+static int mbdb_polling_mode_set(const char *val, const struct kernel_param *kp)
+{
+	unsigned int as_uint;
+	bool as_bool;
+	bool is_uint;
+	bool is_bool;
+
+	is_uint = !kstrtouint(val, 0, &as_uint);
+	is_bool = !kstrtobool(val, &as_bool);
+
+	/*
+	 * check for boolean mode: interpret as a single boolean that globally
+	 * selects interrupts (off) or polling (on), applying WAs as necessary.
+	 */
+	if (is_uint && as_uint <= 1) {
+		mbdb_polling_mode = as_uint;
+		return 0;
+	}
+	if (!is_uint && is_bool) {
+		mbdb_polling_mode = as_bool;
+		return 0;
+	}
+
+	/*
+	 * check for tile mask mode: interpret the lower bits as explicit
+	 * polling mode enables for each corresponding tile, with WAs disabled
+	 */
+	if (is_uint) {
+		if (!(as_uint & MBDB_POLLING_MODE_TILE_ENABLE)) {
+			/* the mask bit MUST be set */
+			return -EINVAL;
+		}
+		mbdb_polling_mode = as_uint;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct kernel_param_ops mbdb_polling_mode_ops = {
+	.set = mbdb_polling_mode_set,
+	.get = param_get_uint,
+};
+
+/*
+ * If bit 31 is clear, the remaining bits are interpreted as a boolean value
+ * that enables polling mode as documented in the help text.  In this mode, any
+ * workarounds relevant to the device will be applied.  Intended as a general
+ * debug workaround for interrupt issues.
+ *
+ * If bit 31 is set, the remaining bits are interpreted as a mask of tiles
+ * to explicitly set polling mode for.  In this mode, workarounds are NOT
+ * applied and the user is in complete control of the mailbox mode.  Intended
+ * for debugging software in the mailbox control path that depends on a
+ * particular mode.
+ */
+module_param_cb(mbdb_polling_mode, &mbdb_polling_mode_ops, &mbdb_polling_mode, 0400);
+MODULE_PARM_DESC(mbdb_polling_mode,
+		 "Use polling instead of interrupts to access Mailbox (default: N)");
+
+/**
+ * mbdb_apply_pvc_rc6_wa - use polling mode on tile 1 to avoid
+ * RC6-related mailbox latency (WA_14017048588).
+ * @mbdb: subdevice mailbox reference
+ */
+static void mbdb_apply_pvc_rc6_wa(struct mbdb *mbdb)
+{
+	struct fsubdev *sd = mbdb->sd;
+
+	if (mbdb->polling)
+		return;
+
+	if (sd->fdev->pd->product == IAF_PONTEVECCHIO && sd_index(sd) == 1) {
+		sd_info(sd, "mbdb polling mode pvc wa enabled for tile 1\n");
+		mbdb->polling = true;
+	}
+}
+
+static void mbdb_polling_mode_apply(struct mbdb *mbdb)
+{
+	if (mbdb_polling_mode & MBDB_POLLING_MODE_TILE_ENABLE) {
+		/* do NOT apply any WAs in tile mask mode */
+		mbdb->polling = mbdb_polling_mode
+			      & MBDB_POLLING_MODE_TILE_MASK
+			      & BIT(sd_index(mbdb->sd));
+	} else {
+		/* apply applicable WAs in legacy boolean mode */
+		mbdb->polling = mbdb_polling_mode;
+		mbdb_apply_pvc_rc6_wa(mbdb);
+	}
+}
+
+/**
+ * mbdb_init_module - Early device-independent module initialization
+ */
+void mbdb_init_module(void)
+{
+	unsigned int tile, mask;
+
+	if (!mbdb_polling_mode) {
+		pr_debug("mailbox mode: interrupts enabled\n");
+		return;
+	}
+
+	if (!(mbdb_polling_mode & MBDB_POLLING_MODE_TILE_ENABLE)) {
+		pr_info("mailbox mode: polling enabled for all tiles\n");
+		return;
+	}
+
+	pr_info("mailbox mode: workarounds disabled\n");
+	for (tile = 0, mask = 1; mask < MBDB_POLLING_MODE_TILE_MASK; ++tile, mask <<= 1) {
+		if (mbdb_polling_mode & mask)
+			pr_info("mailbox mode: polling enabled for tile %u\n", tile);
+	}
+}
+
+static void mbdb_int_ack_wr(struct mbdb *mbdb, u64 mask)
+{
+	if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled)))
+		return;
+
+	mutex_lock(&mbdb->ack_mutex);
+	writeq(mask, mbdb->int_ack_addr);
+	mutex_unlock(&mbdb->ack_mutex);
+}
+
+static void mbdb_int_partner_set_wr(struct mbdb *mbdb, u64 mask)
+{
+	if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled)))
+		return;
+
+	mutex_lock(&mbdb->partner_set_mutex);
+	writeq(mask, mbdb->int_partner_set_addr);
+	mutex_unlock(&mbdb->partner_set_mutex);
+}
+
+static void mbdb_enable_interrupts(struct mbdb *mbdb, u64 intr_mask)
+{
+	unsigned long flags;
+
+	if (READ_ONCE(mbdb->stopping))
+		return;
+
+	if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled)))
+		return;
+
+	spin_lock_irqsave(&mbdb->irq_spinlock, flags);
+
+	if (~mbdb->int_enables & intr_mask) {
+		mbdb->int_enables |= intr_mask;
+		writeq(mbdb->int_enables, mbdb->int_enable_mask_addr);
+	}
+
+	spin_unlock_irqrestore(&mbdb->irq_spinlock, flags);
+}
+
+static void mbdb_disable_interrupts(struct mbdb *mbdb, u64 intr_mask)
+{
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled)))
+		return;
+
+	spin_lock_irqsave(&mbdb->irq_spinlock, flags);
+
+	if (mbdb->int_enables & intr_mask) {
+		mbdb->int_enables &= ~intr_mask;
+		writeq(mbdb->int_enables, mbdb->int_enable_mask_addr);
+	}
+
+	spin_unlock_irqrestore(&mbdb->irq_spinlock, flags);
+}
+
+irqreturn_t mbdb_handle_irq(struct fsubdev *sd)
+{
+	struct mbdb *mbdb = sd->mbdb;
+	u64 contrib;
+
+	if (!mbdb)
+		return IRQ_NONE;
+
+	if (mbdb_readq(mbdb, mbdb->int_status_masked_addr, &contrib))
+		return IRQ_HANDLED;
+
+	/*
+	 * This warrants some further investigation: If this indicates an
+	 * interrupt for THIS IAF, returning IRQ_HANDLED might be more
+	 * resilient, though that probably should never happen anyway.
+	 */
+	if (!contrib)
+		return IRQ_NONE;
+
+	mbdb_disable_interrupts(mbdb, contrib);
+
+	if (contrib & INBOX_FULL_MASK)
+		inbox_full_enqueue(mbdb);
+
+	if (contrib & OUTBOX_EMPTY_MASK)
+		complete(&mbdb->outbox_empty);
+
+	return IRQ_HANDLED;
+}
+
+u64 mbdb_get_mbox_comm_errors(struct fsubdev *sd)
+{
+	u64 *counters = sd->mbdb->counters;
+
+	return counters[TIMEDOUT_REQUESTS] + counters[UNHANDLED_RECEIVED_REQUESTS] +
+	       counters[ERROR_RESPONSES] + counters[UNMATCHED_RESPONSES] +
+	       counters[TIMEDOUT_RESPONSES];
+}
+
+u64 *mbdb_get_mailbox_counters(struct fsubdev *sd)
+{
+	return sd->mbdb->counters;
+}
+
+/**
+ * mbdb_stop_from_handler - Stops mailbox processing without tearing down the
+ * mailbox
+ * @mbdb: mailbox reference
+ *
+ * Expects to be called from the inbox handler (i.e. with the inbox mutex
+ * held and interrupts disabled) when it encounters a fatal condition.
+ *
+ * This just marks the mailbox as stopping to prevent any future operations
+ * from making progress, disables the timer to prevent mailbox processing, and
+ * pre-emptively wakes any inbox/outbox waiters, which will abandon their
+ * operation upon waking since stopping is true.  If they're already awake and
+ * post-wait, they'll continue as normal since we're not invalidating any
+ * resources here.
+ */
+static void mbdb_stop_from_handler(struct mbdb *mbdb)
+{
+	struct mbdb_ibox *ibox;
+
+	lockdep_assert_held(&mbdb->inbox_mutex);
+
+	WRITE_ONCE(mbdb->stopping, true);
+
+	if (mbdb->polling)
+		timer_delete_sync(&mbdb->inbox_timer);
+	else
+		complete(&mbdb->outbox_empty);
+
+	list_for_each_entry(ibox, &mbdb->ibox_list, ibox_list_link)
+		complete(&ibox->ibox_full);
+}
+
+static void mbdb_inbox_empty(struct mbdb *mbdb)
+{
+	/* tell our partner it can put a new message in its outbox */
+
+	if (!mbdb->polling)
+		mbdb_enable_interrupts(mbdb, INBOX_FULL_MASK);
+
+	mbdb_int_partner_set_wr(mbdb, OUTBOX_EMPTY_MASK);
+
+	if (mbdb->polling)
+		inbox_full_enqueue(mbdb);
+}
+
+static void mbdb_ibox_handle_request(struct fsubdev *sd, u64 cw)
+{
+	u16 len;
+
+	switch (mbdb_mbox_op_code(cw)) {
+	case MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_NOTIFICATION:
+		sd->mbdb->counters[HANDLED_RECEIVED_REQUESTS]++;
+		port_state_change_trap_handler(sd);
+		break;
+
+	case MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_NOTIFICATION:
+		sd->mbdb->counters[HANDLED_RECEIVED_REQUESTS]++;
+		port_link_width_degrade_trap_handler(sd);
+		break;
+
+	case MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_NOTIFICATION:
+		sd->mbdb->counters[HANDLED_RECEIVED_REQUESTS]++;
+		port_link_quality_indicator_trap_handler(sd);
+		break;
+
+	case MBOX_OP_CODE_QSFP_MGR_FAULT_TRAP_NOTIFICATION:
+		sd->mbdb->counters[HANDLED_RECEIVED_REQUESTS]++;
+		port_qsfp_fault_trap_handler(sd);
+		break;
+
+	/*
+	 * Not implemented yet:
+	 *
+	 * case MBOX_OP_CODE_QSFP_MGR_PRESENCE_TRAP_NOTIFICATION:
+	 *	sd-mbdb->counters[HANDLED_REQUESTS]++;
+	 *	port_qsfp_presence_trap_handler(sd);
+	 *	break;
+	 */
+
+	case MBOX_OP_CODE_FAULT_TRAP:
+		sd->mbdb->counters[HANDLED_RECEIVED_REQUESTS]++;
+		mbdb_stop_from_handler(sd->mbdb);
+		sd_err(sd, "firmware reported fatal error: cause 0x%08x\n", mbdb_mbox_tid(cw));
+		len = mbdb_mbox_params_len(cw);
+		if (len) {
+			u64 __iomem *addr = sd->mbdb->gp_inbox_param_addr;
+			char optional[16];
+
+			if (len > MBOX_PARAM_AREA_IN_BYTES)
+				len = MBOX_PARAM_AREA_IN_BYTES;
+			while (len) {
+				char line[80];
+				u16 chunk = (len < sizeof(optional)) ?
+					    len : sizeof(optional);
+
+				if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+					return;
+
+				io_readq_aligned(addr, optional, chunk);
+				hex_dump_to_buffer(optional, chunk,
+						   sizeof(optional), 1, line,
+						   sizeof(line), true);
+				sd_err(sd, "%s", line);
+				len -= chunk;
+				addr += chunk / sizeof(u64);
+			}
+		}
+		indicate_subdevice_error(sd, SD_ERROR_FW);
+		break;
+	default:
+		sd->mbdb->counters[UNHANDLED_RECEIVED_REQUESTS]++;
+		sd_warn(sd, "Received MBOX request cw=0x%016llx opCode=%u tid=%u rsp_status=%u\n",
+			cw, mbdb_mbox_op_code(cw), mbdb_mbox_tid(cw), mbdb_mbox_rsp_status(cw));
+		break;
+	}
+}
+
+/**
+ * mbdb_seq_reset - Resets sequence numbers on a successful bootloader<->fw
+ * transition, and unblocks the outbox.
+ * @ibox: inbox to operate on
+ * @cw: inbound control word in flight
+ */
+static void mbdb_seq_reset(struct mbdb_ibox *ibox, u64 cw)
+{
+	struct mbdb *mbdb = ibox->mbdb;
+
+	/* This only applies to FW_START and RESET responses */
+	if (mbdb_mbox_op_code(cw) != MBOX_OP_CODE_RESET &&
+	    mbdb_mbox_op_code(cw) != MBOX_OP_CODE_FW_START)
+		return;
+
+	if (mbdb_mbox_rsp_status(cw) != MBOX_RSP_STATUS_OK) {
+		/* don't reset seqs if the ops were rejected */
+	} else if (mbdb_mbox_op_code(cw) == MBOX_OP_CODE_FW_START) {
+		/*
+		 * FW_START encodes the result of the start attempt as a U32 in
+		 * the response payload.  only reset seqs if this succeeded
+		 */
+		u32 result = *(u32 *)ibox->response;
+
+		if (!result) {
+			mbdb->inbox_seqno = 0;
+			mbdb->outbox_seqno = 0;
+		}
+	} else {
+		/* RESET has no payload */
+		mbdb->inbox_seqno = 0;
+		mbdb->outbox_seqno = 0;
+	}
+
+	/*
+	 * whether pass or fail, we're no longer pending a new seq and can
+	 * release the outbox to other users
+	 */
+	if (atomic_cmpxchg(&mbdb->pending_new_seq, 1, 0))
+		up(&mbdb->outbox_sem);
+}
+
+static struct mbdb_ibox *mbdb_find_ibox(struct mbdb *mbdb, u32 tid, u8 op_code)
+{
+	struct mbdb_ibox *ibox;
+	bool found = false;
+
+	lockdep_assert_held(&mbdb->inbox_mutex);
+
+	/*
+	 * see if we can find the associated ibox in the list for this
+	 * op_code and tid
+	 */
+
+	list_for_each_entry(ibox, &mbdb->ibox_list, ibox_list_link) {
+		if (ibox->tid == tid && ibox->op_code == op_code) {
+			found = true;
+			break;
+		}
+	}
+
+	return found ? ibox : NULL;
+}
+
+static void mbdb_update_response_counters(struct mbdb *mbdb, u8 rsp_status, u64 cw)
+{
+	switch (rsp_status) {
+	case MBOX_RSP_STATUS_OK:
+		mbdb->counters[NON_ERROR_RESPONSES]++;
+		break;
+	case MBOX_RSP_STATUS_RETRY:
+		mbdb->counters[RETRY_RESPONSES]++;
+		break;
+	case MBOX_RSP_STATUS_SEQ_NO_ERROR:
+		mbdb->counters[OUTBOUND_SEQNUM_MISMATCHES]++;
+		sd_warn(mbdb->sd, "Synchronizing outbound sequence number\n");
+		break;
+	case MBOX_RSP_STATUS_OP_CODE_ERROR:
+	case MBOX_RSP_STATUS_LOGICAL_ERROR:
+	case MBOX_RSP_STATUS_DENIED:
+		mbdb->counters[ERROR_RESPONSES]++;
+		sd_err(mbdb->sd, "Errored MBOX control word: 0x%016llx\n", cw);
+		break;
+	default:
+		mbdb->counters[ERROR_RESPONSES]++;
+		break;
+	}
+}
+
+static void mbdb_ibox_handle_response(struct mbdb *mbdb, u64 cw)
+{
+	struct mbdb_ibox *ibox = mbdb_find_ibox(mbdb, mbdb_mbox_tid(cw), mbdb_mbox_op_code(cw));
+
+	if (likely(ibox)) {
+		if (mbdb_mbox_params_len(cw) > MBOX_PARAM_AREA_IN_BYTES) {
+			ibox->rsp_status = MBOX_RSP_STATUS_LOGICAL_ERROR;
+		} else {
+			if (unlikely(READ_ONCE(mbdb->sd->fdev->dev_disabled))) {
+				ibox->rsp_status = -EIO;
+			} else {
+				ibox->cw = cw;
+				ibox->rsp_status = mbdb_mbox_rsp_status(cw);
+
+				if (ibox->rsp_status == MBOX_RSP_STATUS_OK)
+					/* transfer the h/w data into the virtual ibox */
+					ibox->op_rsp_handler(ibox);
+			}
+		}
+
+		mbdb_update_response_counters(mbdb, ibox->rsp_status, cw);
+
+		mbdb_seq_reset(ibox, cw);
+
+		complete(&ibox->ibox_full);
+	} else {
+		mbdb->counters[UNMATCHED_RESPONSES]++;
+		if (mbdb_mbox_is_posted(cw))
+			sd_warn(mbdb->sd, "Received response to posted request cw=0x%016llx op_code=%u tid=%u rsp_status=%u\n",
+				cw, mbdb_mbox_op_code(cw), mbdb_mbox_tid(cw),
+				mbdb_mbox_rsp_status(cw));
+		else
+			sd_warn(mbdb->sd, "NOT found cw=0x%016llx op_code=%u tid=%u rsp_status=%u\n",
+				cw, mbdb_mbox_op_code(cw), mbdb_mbox_tid(cw),
+				mbdb_mbox_rsp_status(cw));
+	}
+}
+
+static bool mbdb_get_polling_input(struct mbdb *mbdb)
+{
+	u64 int_status_unmasked;
+
+	if (mbdb_readq(mbdb, mbdb->int_status_unmasked_addr, &int_status_unmasked))
+		return false;
+
+	if (!(int_status_unmasked & INBOX_FULL_MASK)) {
+		if (atomic_read(&mbdb->ibox_waiters))
+			inbox_full_enqueue(mbdb);
+		return false;
+	}
+
+	return true;
+}
+
+static void mbdb_inbox_full_fn(struct work_struct *inbox_full)
+{
+	struct mbdb *mbdb = container_of(inbox_full, struct mbdb, inbox_full);
+	u64 cw;
+
+	if (READ_ONCE(mbdb->stopping))
+		return;
+
+	mutex_lock(&mbdb->inbox_mutex);
+
+	if (mbdb->polling)
+		if (!mbdb_get_polling_input(mbdb))
+			goto exit;
+
+	/* Get the control word info */
+	if (mbdb_readq(mbdb, mbdb->gp_inbox_cw_addr, &cw))
+		goto exit;
+
+	/* acknowlege the inbox full */
+	mbdb_int_ack_wr(mbdb, INBOX_FULL_MASK);
+
+	trace_iaf_mbx_in(mbdb->sd->fdev->pd->index, sd_index(mbdb->sd), mbdb_mbox_op_code(cw),
+			 mbdb->inbox_seqno, mbdb_mbox_seq_no(cw), mbdb_mbox_rsp_status(cw),
+			 mbdb_mbox_tid(cw), cw);
+
+	/* Check that the "inbound" sequence number in the cw matches what we expect to receive */
+	if (mbdb_mbox_seqno_error(mbdb_mbox_seq_no(cw), mbdb->inbox_seqno)) {
+		mbdb->counters[INBOUND_SEQNUM_MISMATCHES]++;
+		sd_warn(mbdb->sd, "Synchronizing inbound sequence number\n");
+	}
+
+	/*
+	 * synchronize our expected "inbound" sequence number for the next message received from the
+	 * firmware
+	 */
+	mbdb->inbox_seqno = mbdb_mbox_seqno_next(mbdb_mbox_seq_no(cw));
+
+	if (mbdb_mbox_msg_type(cw) == MBOX_REQUEST)
+		mbdb_ibox_handle_request(mbdb->sd, cw);
+	else
+		mbdb_ibox_handle_response(mbdb, cw);
+
+	mbdb_inbox_empty(mbdb);
+
+exit:
+	mutex_unlock(&mbdb->inbox_mutex);
+}
+
+static void mbdb_init(struct mbdb *mbdb)
+{
+	mbdb->int_enables = 0ull;
+	mbdb_int_partner_set_wr(mbdb, OUTBOX_EMPTY_MASK);
+
+	if (!mbdb->polling)
+		mbdb_enable_interrupts(mbdb, INBOX_FULL_MASK);
+}
+
+struct fsubdev *mbdb_ibox_sd(struct mbdb_ibox *ibox)
+{
+	return ibox->mbdb->sd;
+}
+
+u64 __iomem *mbdb_ibox_gp_inbox_param_addr(struct mbdb_ibox *ibox)
+{
+	return ibox->mbdb->gp_inbox_param_addr;
+}
+
+void mbdb_reinit(struct fsubdev *sd)
+{
+	if (sd && sd->mbdb)
+		mbdb_init(sd->mbdb);
+}
+
+u8 mbdb_outbox_seqno(struct fsubdev *sd)
+{
+	u8 result;
+
+	result = sd->mbdb->outbox_seqno;
+	sd->mbdb->outbox_seqno = mbdb_mbox_seqno_next(result);
+	return result;
+}
+
+static int mbdb_outbox_is_empty(struct mbdb *mbdb)
+{
+	bool completed;
+	u64 reg_val;
+
+	if (mbdb_readq(mbdb, mbdb->int_status_unmasked_addr, &reg_val))
+		return -EIO;
+
+	if (reg_val & OUTBOX_EMPTY_MASK)
+		return 0;
+
+	if (mbdb->polling) {
+		int ret = mbdb_wait_outbox_empty(mbdb);
+
+		if (ret == -ETIMEDOUT) {
+			mbdb->counters[TIMEDOUT_REQUESTS]++;
+			sd_err(mbdb->sd, "OUTBOX timed out\n");
+		}
+
+		return ret;
+	}
+
+	mbdb_enable_interrupts(mbdb, OUTBOX_EMPTY_MASK);
+
+	completed = wait_for_completion_timeout(&mbdb->outbox_empty, TIMEOUT);
+	if (READ_ONCE(mbdb->stopping))
+		return -ENODEV;
+
+	if (completed) {
+		reinit_completion(&mbdb->outbox_empty);
+		return 0;
+	}
+
+	if (mbdb_readq(mbdb, mbdb->int_status_unmasked_addr, &reg_val))
+		return -EIO;
+
+	if (reg_val & OUTBOX_EMPTY_MASK)
+		return 0;
+
+	mbdb->counters[TIMEDOUT_REQUESTS]++;
+	sd_err(mbdb->sd, "OUTBOX timed out\n");
+
+	return -ETIMEDOUT;
+}
+
+struct mbox_msg __iomem *mbdb_outbox_acquire(struct fsubdev *sd, u64 *cw)
+{
+	struct mbdb *mbdb = sd->mbdb;
+	int ret;
+
+	if  (!mbdb)
+		return IOMEM_ERR_PTR(-EINVAL);
+
+	ret = down_killable(&mbdb->outbox_sem);
+	if (ret)
+		return IOMEM_ERR_PTR(ret);
+
+	if (READ_ONCE(mbdb->stopping)) {
+		up(&mbdb->outbox_sem);
+		return IOMEM_ERR_PTR(-ENODEV);
+	}
+
+	if (mbdb_mbox_is_posted(*cw) == MBOX_NO_RESPONSE_REQUESTED)
+		++mbdb->counters[POSTED_REQUESTS];
+	else
+		++mbdb->counters[NON_POSTED_REQUESTS];
+
+	ret = mbdb_outbox_is_empty(mbdb);
+	if (ret < 0) {
+		up(&mbdb->outbox_sem);
+		return IOMEM_ERR_PTR(ret);
+	}
+
+	mbdb_int_ack_wr(mbdb, OUTBOX_EMPTY_MASK);
+
+	/* Add a sequence number to the control word */
+	*cw |= FIELD_PREP(MBOX_CW_SEQ_NO, mbdb_outbox_seqno(sd));
+
+	/* For posted RESET, reset sequences immediately */
+	if (mbdb_mbox_op_code(*cw) == MBOX_OP_CODE_RESET &&
+	    mbdb_mbox_is_posted(*cw) == MBOX_NO_RESPONSE_REQUESTED) {
+		mbdb->inbox_seqno = 0;
+		mbdb->outbox_seqno = 0;
+	}
+
+	/* For FW_START and posted RESET, lock outbox */
+	if (mbdb_mbox_op_code(*cw) == MBOX_OP_CODE_FW_START ||
+	    (mbdb_mbox_op_code(*cw) == MBOX_OP_CODE_RESET &&
+	     mbdb_mbox_is_posted(*cw) == MBOX_RESPONSE_REQUESTED))
+		atomic_set(&mbdb->pending_new_seq, 1);
+
+	return (struct mbox_msg __iomem *)mbdb->gp_outbox_data_addr;
+}
+
+/**
+ * mbdb_outbox_release - Releases the outbox.
+ * @sd: The subdevice to operate on.
+ *
+ * Will not release the outbox lock if the operation issued was a firmware
+ * start.  Instead the outbox will remain blocked until the fw start operation
+ * resolves to prevent sequence number desyncs.
+ */
+void mbdb_outbox_release(struct fsubdev *sd)
+{
+	struct mbdb *mbdb = sd->mbdb;
+
+	if (!mbdb)
+		return;
+
+	mbdb_int_partner_set_wr(mbdb, INBOX_FULL_MASK);
+
+	if (!atomic_read(&mbdb->pending_new_seq))
+		up(&mbdb->outbox_sem);
+}
+
+/**
+ * mbdb_tile_number_set - Help firmware identify which tile it's running on.
+ * @sd: The subdevice to operate on.
+ *
+ * Hardware provides no straps to communicate tile-number to firmware. Since KMD knows ANR's tile
+ * number (a.k.a. subdevice), we can communicate it here. This should be called after downloading
+ * firmware but before starting it.
+ */
+void mbdb_tile_number_set(struct fsubdev *sd)
+{
+	u64 tmp;
+	struct mbdb *mbdb = sd->mbdb;
+
+	if (!mbdb)
+		return;
+
+	if (mbdb_readq(mbdb, mbdb->gp_misc_shared, &tmp))
+		return;
+
+#define MISC_SHARED_TILE_NUM GENMASK(7, 0)
+
+	tmp = u64_replace_bits(tmp, sd_index(sd), MISC_SHARED_TILE_NUM);
+	writeq(tmp, mbdb->gp_misc_shared);
+}
+
+struct mbdb_ibox *mbdb_ibox_acquire(struct fsubdev *sd, u8 op_code, void *response, u32 rsp_len,
+				    bool posted, op_response_handler op_rsp_handler)
+{
+	struct mbdb *mbdb = sd->mbdb;
+	struct mbdb_ibox *ibox;
+
+	if (!mbdb)
+		return ERR_PTR(-EINVAL);
+
+	if (posted)
+		return NULL;
+
+	ibox = kzalloc(sizeof(*ibox), GFP_KERNEL);
+	if (!ibox)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&mbdb->inbox_mutex);
+
+	ibox->mbdb = mbdb;
+	ibox->op_code = op_code;
+
+	INIT_LIST_HEAD(&ibox->ibox_list_link);
+	ibox->tid = mbdb->inbox_tid++;
+	ibox->response = response;
+	ibox->rsp_len = response ? rsp_len : 0;
+	ibox->op_rsp_handler = op_rsp_handler;
+
+	init_completion(&ibox->ibox_full);
+
+	/*
+	 * MBDB shutdown (due to destroy or a fw fault) will mark any inboxes
+	 * on the list as complete in order to prevent them from enduring a
+	 * full timeout.
+	 *
+	 * No inboxes should go on the list after that point, and checking for
+	 * stopping under the inbox mutex guaratees that it'll be observed to
+	 * be true if the MBDB stopping logic has already walked the list.
+	 */
+	if (READ_ONCE(mbdb->stopping)) {
+		mutex_unlock(&mbdb->inbox_mutex);
+		kfree(ibox);
+		return ERR_PTR(-EINVAL);
+	}
+
+	list_add_tail(&ibox->ibox_list_link, &mbdb->ibox_list);
+
+	mutex_unlock(&mbdb->inbox_mutex);
+
+	return ibox;
+}
+
+/**
+ * mbdb_ibox_release_pre_wait - Remove from the ibox list and free the ibox
+ * @ibox: inbox to free
+ *
+ * Only call this function if mbdb_ibox_wait() has NOT been called on this
+ * ibox.
+ *
+ */
+void mbdb_ibox_release_pre_wait(struct mbdb_ibox *ibox)
+{
+	/* posted requests have no ibox */
+	if (!ibox)
+		return;
+
+	mutex_lock(&ibox->mbdb->inbox_mutex);
+	list_del_init(&ibox->ibox_list_link);
+	mutex_unlock(&ibox->mbdb->inbox_mutex);
+
+	kfree(ibox);
+}
+
+/**
+ * mbdb_ibox_release - Free an ibox that is not on a list
+ * @ibox: inbox to free
+ *
+ */
+void mbdb_ibox_release(struct mbdb_ibox *ibox)
+{
+	kfree(ibox);
+}
+
+/**
+ * mbdb_ibox_wait - Waits on the specified inbox for IO completion
+ * @ibox: inbox to wait on
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+int mbdb_ibox_wait(struct mbdb_ibox *ibox)
+{
+	struct mbdb *mbdb = ibox->mbdb;
+	bool completed;
+	bool stopping;
+	int ret = 0;
+
+	atomic_inc(&mbdb->ibox_waiters);
+
+	if (mbdb->polling)
+		inbox_full_enqueue(mbdb);
+
+	completed = wait_for_completion_timeout(&ibox->ibox_full, TIMEOUT);
+
+	mutex_lock(&mbdb->inbox_mutex);
+	stopping = READ_ONCE(mbdb->stopping);
+
+	/* handle timeout */
+	if (!completed && !stopping) {
+		/* inbox handler has not run; time the ibox out */
+		mbdb->counters[TIMEDOUT_RESPONSES]++;
+		sd_err(mbdb->sd, "INBOX timed out: opcode %u tid 0x%08x\n",
+		       ibox->op_code, ibox->tid);
+		ret = -ETIMEDOUT;
+
+		/*
+		 * if we time out a msg that was blocking the outbox for a
+		 * seq update, release it
+		 */
+		if (ibox->op_code == MBOX_OP_CODE_FW_START ||
+		    ibox->op_code == MBOX_OP_CODE_RESET)
+			if (atomic_cmpxchg(&mbdb->pending_new_seq, 1, 0))
+				up(&mbdb->outbox_sem);
+	}
+
+	/* ibox processing is complete remove it from the list */
+	list_del_init(&ibox->ibox_list_link);
+	mutex_unlock(&ibox->mbdb->inbox_mutex);
+
+	/*
+	 * the completion is only valid in the mailbox teardown path to
+	 * indicate to the inbox drain logic that pending waiters have
+	 * completed, so ensure we're stopping before completing it.
+	 */
+	if (atomic_dec_and_test(&mbdb->ibox_waiters) && stopping)
+		complete(&mbdb->ibox_waiters_done);
+
+	if (mbdb->polling)
+		inbox_full_enqueue(mbdb);
+
+	return ret;
+}
+
+/* assumes mbdb->stopping == true in order for the completions to fire */
+static void mbdb_ibox_drain(struct mbdb *mbdb)
+{
+	struct mbdb_ibox *ibox;
+
+	/* we should not be tearing down the mailbox with live clients */
+	if (WARN_ON(!list_empty(&mbdb->ibox_list))) {
+		mutex_lock(&mbdb->inbox_mutex);
+
+		/* if waiters remain; force them to time out */
+		list_for_each_entry(ibox, &mbdb->ibox_list, ibox_list_link)
+			complete(&ibox->ibox_full);
+
+		/* wait for them to complete */
+		mutex_unlock(&mbdb->inbox_mutex);
+
+		WARN_ON(wait_for_completion_killable(&mbdb->ibox_waiters_done));
+	}
+}
+
+void destroy_mbdb(struct fsubdev *sd)
+{
+	struct mbdb *mbdb = sd->mbdb;
+
+	if (!mbdb)
+		return;
+
+	WRITE_ONCE(mbdb->stopping, true);
+
+	if (mbdb->polling) {
+		timer_delete_sync(&mbdb->inbox_timer);
+	} else {
+		mbdb_disable_interrupts(mbdb, mbdb->int_enables);
+		complete(&mbdb->outbox_empty);
+	}
+
+	flush_work(&mbdb->inbox_full);
+	mbdb_ibox_drain(mbdb);
+	mutex_destroy(&mbdb->partner_set_mutex);
+	mutex_destroy(&mbdb->ack_mutex);
+	mutex_destroy(&mbdb->inbox_mutex);
+
+	sd->mbdb = NULL;
+	kfree(mbdb);
+}
+
+static void mbdb_set_mem_addresses(struct mbdb *mbdb)
+{
+	char __iomem *csr_base = mbdb->sd->csr_base;
+
+	mbdb->int_status_unmasked_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_INT_STATUS_UNMASKED);
+
+	mbdb->int_status_masked_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_INT_STATUS_MASKED);
+
+	mbdb->int_ack_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_INT_ACK);
+
+	mbdb->int_partner_set_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_INT_PARTNER_SET);
+
+	mbdb->int_enable_mask_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_INT_ENABLE_MASK);
+
+	mbdb->gp_outbox_data_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_GP_DATA);
+
+	mbdb->gp_outbox_cw_addr = mbdb->gp_outbox_data_addr;
+
+	mbdb->gp_outbox_param_addr = mbdb->gp_outbox_data_addr + 1;
+
+	mbdb->gp_inbox_data_addr = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_GP_DATA + MBOX_SIZE_IN_BYTES);
+
+	mbdb->gp_inbox_cw_addr = mbdb->gp_inbox_data_addr;
+
+	mbdb->gp_inbox_param_addr = mbdb->gp_inbox_data_addr + 1;
+
+	mbdb->gp_misc_shared = (u64 __iomem *)
+		(csr_base + CP_ADDR_MBDB_MISC_SHARED);
+}
+
+int create_mbdb(struct fsubdev *sd)
+{
+	struct mbdb *mbdb;
+
+	mbdb = kzalloc(sizeof(*sd->mbdb), GFP_KERNEL);
+	if (!mbdb)
+		return -ENOMEM;
+
+	sd->mbdb = mbdb;
+	mbdb->sd = sd;
+	mbdb->stopping = false;
+	atomic_set(&mbdb->pending_new_seq, 0);
+
+	mbdb_polling_mode_apply(mbdb);
+
+	mbdb_set_mem_addresses(mbdb);
+
+	init_completion(&mbdb->outbox_empty);
+
+	INIT_LIST_HEAD(&mbdb->ibox_list);
+
+	INIT_WORK(&mbdb->inbox_full, mbdb_inbox_full_fn);
+
+	sema_init(&mbdb->outbox_sem, 1);
+
+	mutex_init(&mbdb->inbox_mutex);
+	mutex_init(&mbdb->ack_mutex);
+	mutex_init(&mbdb->partner_set_mutex);
+
+	atomic_set(&mbdb->ibox_waiters, 0);
+	init_completion(&mbdb->ibox_waiters_done);
+
+	spin_lock_init(&mbdb->irq_spinlock);
+
+	mbdb_init(mbdb);
+
+	if (mbdb->polling) {
+		timer_setup(&mbdb->inbox_timer, inbox_timer_fn, 0);
+		add_timer(&mbdb->inbox_timer);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/fabric/mbdb.h b/drivers/gpu/drm/xe/fabric/mbdb.h
new file mode 100644
index 0000000000000..922e770513fd2
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mbdb.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef MBDB_H_INCLUDED
+#define MBDB_H_INCLUDED
+
+#include <linux/types.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+
+#include "iaf_drv.h"
+
+#define MBOX_CW_OPCODE GENMASK_ULL(7, 0)
+#define MBOX_CW_IS_REQ BIT_ULL_MASK(8)
+#define MBOX_CW_POSTED BIT_ULL_MASK(9)
+#define MBOX_CW_SEQ_NO GENMASK_ULL(15, 10)
+#define MBOX_CW_PARAMS_LEN GENMASK_ULL(27, 16)
+#define MBOX_CW_RSP_STATUS GENMASK_ULL(31, 28)
+#define MBOX_CW_TID GENMASK_ULL(63, 32)
+
+#define MBOX_CW_SEQ_NO_MASK 0x3F
+
+#define CP_ADDR_MBDB_BASE 0x6000
+
+enum mbdb_counters {
+	MBDB_COUNTERS_FIRST,
+	POSTED_REQUESTS = MBDB_COUNTERS_FIRST,
+	NON_POSTED_REQUESTS,
+	TIMEDOUT_REQUESTS,
+	HANDLED_RECEIVED_REQUESTS,
+	UNHANDLED_RECEIVED_REQUESTS,
+	NON_ERROR_RESPONSES,
+	ERROR_RESPONSES,
+	UNMATCHED_RESPONSES,
+	TIMEDOUT_RESPONSES,
+	RETRY_RESPONSES,
+	OUTBOUND_SEQNUM_MISMATCHES,
+	INBOUND_SEQNUM_MISMATCHES,
+	MBDB_COUNTERS_MAX,
+};
+
+enum mbdb_msg_type {
+	MBOX_RESPONSE = 0,
+	MBOX_REQUEST  = 1
+};
+
+enum posted {
+	MBOX_RESPONSE_REQUESTED    = 0,
+	MBOX_NO_RESPONSE_REQUESTED = 1
+};
+
+struct mbdb_ibox;
+
+typedef void (*op_response_handler)(struct mbdb_ibox *ibox);
+
+struct mbdb_ibox {
+	struct list_head ibox_list_link;
+	struct mbdb *mbdb;
+	struct completion ibox_full;
+	u64 cw;
+	u32 tid;
+	u16 rsp_len;
+	void *response;
+	int rsp_status; /* MBDB_RSP_STATUS value from the cw or errno from a response handler */
+	op_response_handler op_rsp_handler;
+	u8 op_code;
+	u8 retries;
+};
+
+/* Outbox related */
+u8 mbdb_outbox_seqno(struct fsubdev *sd);
+struct mbox_msg __iomem *mbdb_outbox_acquire(struct fsubdev *sd, u64 *cw);
+void mbdb_outbox_release(struct fsubdev *sd);
+
+/* Communicate miscellaneous info to firmware via MISC_SHARED registers */
+void mbdb_tile_number_set(struct fsubdev *sd);
+
+/* ibox related (i.e. virtual inbox) */
+struct mbdb_ibox *mbdb_ibox_acquire(struct fsubdev *sd, u8 op_code,
+				    void *response, u32 rsp_len, bool posted,
+				    op_response_handler op_rsp_handler);
+
+void mbdb_ibox_release_pre_wait(struct mbdb_ibox *ibox);
+void mbdb_ibox_release(struct mbdb_ibox *ibox);
+int mbdb_ibox_wait(struct mbdb_ibox *ibox);
+
+void destroy_mbdb(struct fsubdev *sd);
+int create_mbdb(struct fsubdev *sd);
+
+irqreturn_t mbdb_handle_irq(struct fsubdev *sd);
+
+u64 mbdb_get_mbox_comm_errors(struct fsubdev *sd);
+
+u64 *mbdb_get_mailbox_counters(struct fsubdev *sd);
+
+static inline u64 build_cw(u8 op_code, enum mbdb_msg_type req_rsp,
+			   enum posted is_posted, u16 seq_no, u16 length,
+			   u32 tid)
+{
+	return (FIELD_PREP(MBOX_CW_OPCODE, op_code) |
+		FIELD_PREP(MBOX_CW_IS_REQ, req_rsp) |
+		FIELD_PREP(MBOX_CW_POSTED, is_posted) |
+		FIELD_PREP(MBOX_CW_SEQ_NO, seq_no) |
+		FIELD_PREP(MBOX_CW_PARAMS_LEN, length) |
+		FIELD_PREP(MBOX_CW_TID, tid));
+}
+
+static inline u8 mbdb_mbox_op_code(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_OPCODE, cw);
+}
+
+static inline enum mbdb_msg_type mbdb_mbox_msg_type(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_IS_REQ, cw);
+}
+
+static inline enum posted mbdb_mbox_is_posted(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_POSTED, cw);
+}
+
+static inline u8 mbdb_mbox_seq_no(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_SEQ_NO, cw);
+}
+
+static inline u8 mbdb_mbox_seqno_next(u8 seqno)
+{
+	return (seqno + 1) & MBOX_CW_SEQ_NO_MASK;
+}
+
+static inline bool mbdb_mbox_seqno_error(u8 seqno, u8 expected_seqno)
+{
+	return seqno != expected_seqno;
+}
+
+static inline u16 mbdb_mbox_params_len(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_PARAMS_LEN, cw);
+}
+
+static inline u32 mbdb_mbox_tid(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_TID, cw);
+}
+
+static inline u32 mbdb_ibox_tid(struct mbdb_ibox *ibox)
+{
+	return ibox ? ibox->tid : 0;
+}
+
+static inline u8 mbdb_mbox_rsp_status(u64 cw)
+{
+	return FIELD_GET(MBOX_CW_RSP_STATUS, cw);
+}
+
+struct fsubdev *mbdb_ibox_sd(struct mbdb_ibox *ibox);
+
+u64 __iomem *mbdb_ibox_gp_inbox_param_addr(struct mbdb_ibox *ibox);
+
+int mbdb_ibox_waiters(struct fsubdev *sd);
+
+void mbdb_reinit(struct fsubdev *sd);
+
+void mbdb_init_module(void);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/mbox.c b/drivers/gpu/drm/xe/fabric/mbox.c
new file mode 100644
index 0000000000000..124cc7e07a7e0
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mbox.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/types.h>
+#include <linux/netlink.h>
+#include <net/genetlink.h>
+#include <linux/skbuff.h>
+#include <net/sock.h>
+
+#include "iaf_drv.h"
+#include "io.h"
+#include "mbdb.h"
+#include "ops.h"
+#include "mbox.h"
+
+#define INTERFACE_VERSION 1
+
+enum mbox_cmd {
+	CMD_MB_UNSPEC,
+	CMD_MB,
+	_CMD_MAX,
+};
+
+enum mbox_attr {
+	ATTR_UNSPEC,
+
+	/* MB operation */
+	ATTR_MB,
+	_ATTR_MAX,
+};
+
+#define ATTR_MAX (_ATTR_MAX - 1)
+#define CMD_MAX (_CMD_MAX - 1)
+
+enum mbox_ops {
+	OP_MBOX_SEND,
+	OP_MBOX_RECV,
+	OP_CSR_READ_SEND,
+	OP_CSR_READ_RECV,
+	OP_CSR_WRITE_SEND,
+	OP_CSR_WRITE_RECV,
+};
+
+struct mbox_send_msg {
+	/* Request Info */
+	u32 msg_len;
+	u32 reserved;
+	struct mbox_msg msg;
+} __packed;
+
+struct mbox_recv_msg {
+	/* Response Info */
+	struct mbox_msg msg;
+};
+
+struct csr_read_send_msg {
+	/* Request Info */
+	u32 bar_offset;
+};
+
+struct csr_read_recv_msg {
+	/* Response Info */
+	u32 bar_offset;
+	u32 reserved;
+	u64 csr_data;
+} __packed;
+
+struct csr_write_send_msg {
+	/* Request Info */
+	u32 bar_offset;
+	u32 reserved;
+	u64 csr_data;
+} __packed;
+
+struct csr_write_recv_msg {
+	/* Response Info */
+	u32 bar_offset;
+};
+
+struct sd_id {
+	u32 fabric_id;
+	u8 sd_index;
+	u8 port;
+	u16 reserved;
+} __packed;
+
+struct mbox_op_msg {
+	u64 context;
+	u32 op;
+	struct sd_id sd_hdl;
+	u32 reserved1;
+	union {
+		struct mbox_send_msg mbox_send;
+		struct mbox_recv_msg mbox_recv;
+		struct csr_read_send_msg csr_read_send;
+		struct csr_read_recv_msg csr_read_recv;
+		struct csr_write_send_msg csr_write_send;
+		struct csr_write_recv_msg csr_write_recv;
+	};
+	/* Response Info */
+	s32 result;
+	u32 reserved2;
+} __packed;
+
+static struct genl_family mbox_iaf_family;
+
+static DEFINE_MUTEX(mbnl_lock);
+
+static struct mbox_op_msg *mbox_alloc_rsp(struct mbox_op_msg *req,
+					  enum mbox_ops op)
+{
+	struct mbox_op_msg *rsp;
+
+	rsp = kmalloc(sizeof(*rsp), GFP_KERNEL);
+	if (!rsp)
+		return ERR_PTR(-ENOMEM);
+
+	rsp->context = req->context;
+	rsp->sd_hdl = req->sd_hdl;
+	rsp->op = op;
+	rsp->result = 0;
+
+	return rsp;
+}
+
+static int mbox_send_reply(struct genl_info *info, struct mbox_op_msg *op_msg)
+{
+	struct sk_buff *msg;
+	void *usrhdr;
+	int ret;
+
+	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_NOWAIT);
+	if (!msg)
+		return -ENOMEM;
+
+	usrhdr = genlmsg_put_reply(msg, info, &mbox_iaf_family, 0,
+				   info->genlhdr->cmd);
+	if (!usrhdr) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	ret = nla_put(msg, ATTR_MB, sizeof(*op_msg), op_msg);
+	if (ret) {
+		nlmsg_free(msg);
+		return ret;
+	}
+
+	genlmsg_end(msg, usrhdr);
+
+	ret = genlmsg_reply(msg, info);
+	if (ret) {
+		pr_err("Unable to send response msg.\n");
+		nlmsg_free(msg);
+	}
+
+	return ret;
+}
+
+static int mbox_ack_op_req(struct mbox_op_msg *req, struct genl_info *info)
+{
+	return mbox_send_reply(info, req);
+}
+
+static int mbox_nak_op_req(struct mbox_op_msg *req, struct genl_info *info,
+			   int result)
+{
+	req->result = result;
+	return mbox_ack_op_req(req, info);
+}
+
+static u64 mbox_build_rsp_cw(u64 cw, u64 req_cw, int rsp_result)
+{
+	u64 rsp_cw;
+
+	rsp_cw = build_cw(mbdb_mbox_op_code(cw), mbdb_mbox_msg_type(cw),
+			  mbdb_mbox_is_posted(cw), mbdb_mbox_seq_no(cw),
+			  mbdb_mbox_params_len(cw), mbdb_mbox_tid(req_cw));
+
+	if (rsp_result) {
+		rsp_result = rsp_result < 0 ? MBOX_RSP_STATUS_LOGICAL_ERROR
+					    : rsp_result;
+		rsp_cw |= FIELD_PREP(MBOX_CW_RSP_STATUS, rsp_result);
+	}
+
+	return rsp_cw;
+}
+
+static struct mbox_op_msg *mbox_execute_op(struct fsubdev *sd,
+					   struct mbox_op_msg *req,
+					   u64 *cw,
+					   int *op_result)
+{
+	u64 req_cw = req->mbox_send.msg.cw;
+	bool posted = mbdb_mbox_is_posted(req_cw) == MBOX_NO_RESPONSE_REQUESTED;
+	struct mbox_op_msg *rsp = NULL;
+	void *recv_data = NULL;
+	u32 recv_len = 0;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_params;
+	int ret;
+
+	if (!posted) {
+		rsp = mbox_alloc_rsp(req, OP_MBOX_RECV);
+		if (IS_ERR(rsp))
+			return rsp;
+
+		recv_data = rsp->mbox_recv.msg.param_area;
+		recv_len = sizeof(rsp->mbox_recv.msg.param_area);
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, mbdb_mbox_op_code(req_cw),
+							  mbdb_mbox_params_len(req_cw), recv_data,
+							  recv_len, cw, POSTED(posted),
+							  ops_rsp_handler_relaxed);
+	if (IS_ERR(ibox)) {
+		ret = PTR_ERR(ibox);
+		kfree(rsp);
+		return ERR_PTR(ret);
+	}
+
+	if (req->mbox_send.msg_len < sizeof(*cw)) {
+		mbdb_ibox_release_pre_wait(ibox);
+		kfree(rsp);
+		return ERR_PTR(-EINVAL);
+	}
+
+	op_params.len = req->mbox_send.msg_len - sizeof(*cw);
+
+	if (op_params.len) {
+		op_params.data = req->mbox_send.msg.param_area;
+		ret = ops_execute(sd, cw, 1, &op_params, ibox);
+	} else {
+		ret = ops_execute(sd, cw, 0, NULL, ibox);
+	}
+
+	if (ret < 0) {
+		/* ops_execute failed to communicate with the mailbox */
+		kfree(rsp);
+		return ERR_PTR(ret);
+	}
+
+	/* Set the response result returned by the mailbox operation */
+	*op_result = ret;
+
+	return rsp;
+}
+
+static int mbox_send_op(struct fsubdev *sd, struct mbox_op_msg *req,
+			struct genl_info *info)
+{
+	struct mbox_op_msg *rsp;
+	u64 cw;
+	int op_result = MBOX_RSP_STATUS_OK;
+	int ret;
+
+	req->result = 0;
+
+	rsp = mbox_execute_op(sd, req, &cw, &op_result);
+	if (IS_ERR(rsp))
+		return mbox_nak_op_req(req, info, PTR_ERR(rsp));
+
+	ret = mbox_ack_op_req(req, info);
+	if (!ret && rsp) {
+		rsp->result = op_result;
+		rsp->mbox_recv.msg.cw =
+			mbox_build_rsp_cw(cw, req->mbox_send.msg.cw, op_result);
+
+		ret = mbox_send_reply(info, rsp);
+	}
+
+	kfree(rsp);
+
+	return ret;
+}
+
+static int mbox_csr_read_op(struct fsubdev *sd, struct mbox_op_msg *req,
+			    struct genl_info *info)
+{
+	struct mbox_op_msg *rsp;
+	u64 __iomem *addr;
+	int ret;
+
+	req->result = 0;
+
+	rsp = mbox_alloc_rsp(req, OP_CSR_READ_RECV);
+	if (IS_ERR(rsp))
+		return mbox_nak_op_req(req, info, PTR_ERR(rsp));
+
+	addr = (u64 __iomem *)(sd->csr_base + req->csr_read_send.bar_offset);
+
+	rsp->csr_read_recv.bar_offset = req->csr_read_send.bar_offset;
+	rsp->csr_read_recv.csr_data = readq(addr);
+
+	ret = mbox_ack_op_req(req, info);
+	if (!ret)
+		ret = mbox_send_reply(info, rsp);
+
+	kfree(rsp);
+
+	return ret;
+}
+
+static int mbox_csr_write_op(struct fsubdev *sd, struct mbox_op_msg *req,
+			     struct genl_info *info)
+{
+	struct mbox_op_msg *rsp;
+	u64 __iomem *addr;
+	int ret;
+
+	req->result = 0;
+
+	rsp = mbox_alloc_rsp(req, OP_CSR_WRITE_RECV);
+	if (IS_ERR(rsp))
+		return mbox_nak_op_req(req, info, PTR_ERR(rsp));
+
+	addr = (u64 __iomem *)(sd->csr_base + req->csr_write_send.bar_offset);
+	writeq(req->csr_write_send.csr_data, addr);
+
+	rsp->csr_write_recv.bar_offset = req->csr_write_send.bar_offset;
+
+	ret = mbox_ack_op_req(req, info);
+	if (!ret)
+		ret = mbox_send_reply(info, rsp);
+
+	kfree(rsp);
+
+	return ret;
+}
+
+static int mbox_process_op(struct sk_buff *msg, struct genl_info *info)
+{
+	struct nlattr *attr = info->attrs[ATTR_MB];
+	struct mbox_op_msg *req;
+	struct fsubdev *sd;
+	int ret;
+
+	mutex_lock(&mbnl_lock);
+
+	if (info->genlhdr->version != INTERFACE_VERSION) {
+		ret = -EINVAL;
+		goto unlock_mbnl;
+	}
+
+	if (!attr) {
+		ret = -ENODATA;
+		goto unlock_mbnl;
+	}
+
+	req = nla_data(attr);
+
+	sd = find_sd_id(req->sd_hdl.fabric_id, req->sd_hdl.sd_index);
+	if (IS_ERR(sd)) {
+		ret = mbox_nak_op_req(req, info, PTR_ERR(sd));
+		goto unlock_mbnl;
+	}
+
+	switch (req->op) {
+	case OP_MBOX_SEND:
+		ret = mbox_send_op(sd, req, info);
+		break;
+
+	case OP_CSR_READ_SEND:
+		ret = mbox_csr_read_op(sd, req, info);
+		break;
+
+	case OP_CSR_WRITE_SEND:
+		ret = mbox_csr_write_op(sd, req, info);
+		break;
+
+	case OP_MBOX_RECV:
+	case OP_CSR_READ_RECV:
+	case OP_CSR_WRITE_RECV:
+	default:
+		ret = mbox_nak_op_req(req, info, -EINVAL);
+		break;
+	}
+
+	fdev_put(sd->fdev);
+
+unlock_mbnl:
+	mutex_unlock(&mbnl_lock);
+	return ret;
+}
+
+static struct nla_policy mbox_iaf_policy[ATTR_MAX + 1] = {
+	[ATTR_MB] = NLA_POLICY_EXACT_LEN(sizeof(struct mbox_op_msg)),
+};
+
+static struct genl_ops mbox_iaf_cmds[CMD_MAX] = {
+	{
+		.cmd = CMD_MB,
+		.doit = mbox_process_op,
+		.flags = GENL_UNS_ADMIN_PERM,
+
+	},
+};
+
+/* Change name, need flag day with L8sim */
+static struct genl_family mbox_iaf_family = {
+	.name = "intel_cd",
+	.version = INTERFACE_VERSION,
+	.maxattr = ATTR_MAX,
+	.ops = mbox_iaf_cmds,
+	.n_ops = ARRAY_SIZE(mbox_iaf_cmds),
+	.policy = mbox_iaf_policy,
+	.parallel_ops = true,
+};
+
+static bool mbox_iaf_family_registered;
+
+/**
+ * mbox_term_module - Unregisters the interface between kernel and user space.
+ */
+void mbox_term_module(void)
+{
+	if (!mbox_iaf_family_registered)
+		return;
+
+	if (genl_unregister_family(&mbox_iaf_family))
+		pr_err("Unable to unregister netlink family %s\n", mbox_iaf_family.name);
+	else
+		mbox_iaf_family_registered = false;
+}
+
+/**
+ * mbox_init_module - Registers the interface between kernel and user space.
+ */
+void mbox_init_module(void)
+{
+	if (genl_register_family(&mbox_iaf_family)) {
+		pr_err("Cannot register mbox_iaf family %s\n", mbox_iaf_family.name);
+		pr_info("Green Link interface is not available\n");
+	} else {
+		mbox_iaf_family_registered = true;
+	}
+}
diff --git a/drivers/gpu/drm/xe/fabric/mbox.h b/drivers/gpu/drm/xe/fabric/mbox.h
new file mode 100644
index 0000000000000..3ba4fcec822b7
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mbox.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ *
+ */
+
+#ifndef MBOX_H_INCLUDED
+#define MBOX_H_INCLUDED
+
+#if IS_ENABLED(CONFIG_IAF_DEBUG_MBOX_ACCESS)
+void mbox_init_module(void);
+void mbox_term_module(void);
+#else
+static inline void mbox_init_module(void) {}
+static inline void mbox_term_module(void) {}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/mei_iaf_user.c b/drivers/gpu/drm/xe/fabric/mei_iaf_user.c
new file mode 100644
index 0000000000000..337bb657f7cc6
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mei_iaf_user.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ */
+
+#include <linux/device.h>
+#include <linux/component.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/i915_mei_iaf_interface.h>
+
+#include "iaf_drv.h"
+#include "mei_iaf_user.h"
+
+/*
+ * This submodule provides anti-rollback (ARB) support using the MEI interface. ARB uses a simple
+ * software version number (SVN) scheme and is checked automatically by the boot loader. The
+ * required minimum SVN value is written by a protected processor which is accessed via the MEI
+ * component-based interface.
+ */
+
+/*
+ * module parameters
+ */
+
+/* MEI interaction timeout */
+static unsigned short mei_timeout = 5 * 60;
+module_param(mei_timeout, ushort, 0400);
+MODULE_PARM_DESC(mei_timeout,
+		 "Seconds to wait for MEI before warning (default: 5 minutes)");
+
+/* MEI automatic SVN request on init */
+static bool automatic_rollback_protection;
+module_param(automatic_rollback_protection, bool, 0600);
+MODULE_PARM_DESC(automatic_rollback_protection,
+		 "Protect booted/initialized FW against rollback (default: N)");
+
+/*
+ * register access helper functions - can be called at any time
+ */
+
+/**
+ * get_min_svn - query currently-programmed minimum required SVN value
+ * @dev: device being queried
+ *
+ * Return: SVN value
+ */
+u16 get_min_svn(struct fdev *dev)
+{
+	void __iomem *fw_min_svn_reg_addr;
+	u64 fw_min_svn_reg_val;
+
+	if (unlikely(READ_ONCE(dev->dev_disabled)))
+		return 0;
+
+	/* tile 0 is the master for SVN */
+	fw_min_svn_reg_addr = dev->sd[0].csr_base + FW_MIN_SVN_ADDR;
+
+	fw_min_svn_reg_val = readq(fw_min_svn_reg_addr);
+
+	return fw_min_svn_reg_val & FW_SVN_MASK;
+}
+
+/**
+ * get_updated_svn - query currently-programmed requested new minimum SVN value
+ * @dev: device being queried
+ *
+ * Return: SVN value
+ */
+static u16 get_updated_svn(struct fdev *dev)
+{
+	void __iomem *fw_updated_svn_reg_addr;
+	u64 fw_updated_svn_reg_val;
+
+	if (unlikely(READ_ONCE(dev->dev_disabled)))
+		return 0;
+
+	/* tile 0 is the master for SVN */
+	fw_updated_svn_reg_addr = dev->sd[0].csr_base + FW_UPDATED_SVN_ADDR;
+
+	fw_updated_svn_reg_val = readq(fw_updated_svn_reg_addr);
+
+	return fw_updated_svn_reg_val & FW_SVN_MASK;
+}
+
+/*
+ * SVN commit support - only used once requested by the ARB request interface
+ */
+
+/**
+ * queue_commit_svn_work - trigger a work queue to complete SVN update
+ * @dev: device being queried
+ *
+ * Called automatically as a "continuation function" if the MEI binds after an SVN update was
+ * automatically triggered.
+ */
+static void queue_commit_svn_work(struct fdev *dev)
+{
+	queue_work(iaf_unbound_wq, &dev->mei_work);
+}
+
+/**
+ * mei_iaf_user_continuation - set or clear a "continuation function" for a not-yet-bound MEI
+ * @dev: device being registered
+ * @fn: function to call upon successful MEI bind, NULL to clear
+ *
+ * When set, the "continuation function" is called by the component bind operation.
+ *
+ * Return: 0 if successful, -EPERM if continuation is already pending on set request
+ */
+static int mei_iaf_user_continuation(struct fdev *dev, void (*fn)(struct fdev *))
+{
+	if (fn && (dev->mei_bind_continuation || timer_pending(&dev->mei_continuation_timer)))
+		return -EPERM;
+
+	if (fn)
+		mod_timer(&dev->mei_continuation_timer, jiffies + mei_timeout * HZ);
+	else if (timer_pending(&dev->mei_continuation_timer))
+		timer_delete_sync(&dev->mei_continuation_timer);
+
+	dev->mei_bind_continuation = fn;
+
+	return 0;
+}
+
+/* non-error values for continuation results */
+#define COMPLETED_IMMEDIATELY	(2)
+#define CONTINUATION_DISALLOWED	(1)
+#define CONTINUATION_SCHEDULED	(0)
+
+/* convenience macros for specifying allow_continuation value */
+#define AUTOMATICALLY_RETRY	(true)
+#define TRY_ONCE		(false)
+
+/**
+ * try_commit_svn - try to commit current software version number
+ * @dev: the device to operate on
+ * @allow_continuation: whether to automatically retry when MEI is bound
+ *
+ * Use the MEI driver to commit the current active SVN. If the MEI driver is not currently bound to
+ * this driver and @allow_continuation is set, schedule a contination request.
+ *
+ * Return: 0 on success, non-zero on failure
+ */
+static int try_commit_svn(struct fdev *dev, bool allow_continuation)
+{
+	int status = COMPLETED_IMMEDIATELY;
+	int exp_mei_err = 0;
+	int mei_err = 0;
+	u16 old_min_svn;
+	u16 updated_svn;
+	u16 new_min_svn;
+	u8 i;
+
+	old_min_svn = get_min_svn(dev);
+
+	for (i = 0; i < dev->pd->sd_cnt; i++)
+		if (test_bit(SD_ERROR_FAILED, dev->sd[i].errors))
+			return -ENODEV;
+
+	mutex_lock(&dev->mei_ops_lock);
+
+	if (dev->mei_ops)
+		mei_err = dev->mei_ops->commit_svn(dev->mei_dev);
+	else if (allow_continuation)
+		status = mei_iaf_user_continuation(dev, queue_commit_svn_work);
+	else
+		status = CONTINUATION_DISALLOWED;
+
+	mutex_unlock(&dev->mei_ops_lock);
+
+	switch (status) {
+	case COMPLETED_IMMEDIATELY:
+		/* operation finished, go on and check mei results */
+		break;
+
+	case CONTINUATION_DISALLOWED:
+		/* retry disallowed, caller reports when appropriate */
+		return -ENODEV;
+
+	case CONTINUATION_SCHEDULED:
+		/* operation will be automatically tried again */
+		dev_dbg(fdev_dev(dev), "MEI not ready, SVN update deferred\n");
+		return 0;
+
+	default:
+		dev_err(fdev_dev(dev), "error continuing MEI, code %d\n",
+			status);
+		return status;
+	}
+
+	/* check and/or propagate result of MEI call */
+
+	updated_svn = get_updated_svn(dev);
+
+	if (updated_svn < old_min_svn)
+		exp_mei_err = -EBADF;
+	else if (updated_svn == old_min_svn)
+		exp_mei_err = -EACCES;
+
+	new_min_svn = get_min_svn(dev);
+
+	switch (mei_err) {
+	case 0:
+		dev_info(fdev_dev(dev), "Minimum SVN updated to %u\n", new_min_svn);
+		if (new_min_svn != updated_svn) {
+			dev_err(fdev_dev(dev), "Confirmed SVN update not detected, %u != %u\n",
+				new_min_svn, updated_svn);
+			return -EIO;
+		}
+		break;
+
+	case -ENOENT:
+		dev_dbg(fdev_dev(dev), "SVN update (%u -> %u) disabled, remains %u\n",
+			old_min_svn, updated_svn, new_min_svn);
+		return mei_err;
+
+	case -EACCES:
+		dev_dbg(fdev_dev(dev), "SVN same (%u == %u), not updated, remains %u\n",
+			old_min_svn, updated_svn, new_min_svn);
+		break;
+
+	case -EBADF:
+		dev_dbg(fdev_dev(dev), "SVN smaller (%u > %u), not updated, remains %u\n",
+			old_min_svn, updated_svn, new_min_svn);
+		break;
+
+	default:
+		dev_err(fdev_dev(dev), "SVN update failed, code %d\n", mei_err);
+		return mei_err;
+	}
+
+	/*
+	 * non-exceptional case: SVN has been updated or not based on min_svn/updated_svn values;
+	 * also verify that the driver and MEI/CSC views match since this is a security feature
+	 */
+	if (mei_err != exp_mei_err) {
+		dev_err(fdev_dev(dev), "Expected MEI errcode %d, got %d\n", exp_mei_err, mei_err);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * commit_svn_work - commit requested SVN from a work queue
+ * @work: the MEI work queue for the device to commit
+ *
+ * Triggered if the MEI binds after an SVN update was requested.
+ */
+static void commit_svn_work(struct work_struct *work)
+{
+	struct fdev *dev;
+	int err;
+
+	dev = container_of(work, typeof(*dev), mei_work);
+	err = try_commit_svn(dev, TRY_ONCE);
+	if (err && err != -ENOENT)
+		dev_err(fdev_dev(dev),
+			"Error %d, bound MEI unable to commit IAF FW version\n",
+			-err);
+}
+
+/*
+ * component interface - for this driver to request services from the MEI driver
+ */
+
+static int bind_to_mei(struct device *dev, struct device *mei_dev, void *data)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+	struct i915_iaf_component_ops *mei_ops = data;
+
+	dev_dbg(dev, "binding to MEI device %s\n", dev_name(mei_dev));
+
+	mutex_lock(&fdev->mei_ops_lock);
+
+	fdev->mei_dev = mei_dev;
+	fdev->mei_ops = mei_ops;
+
+	if (fdev->mei_bind_continuation)
+		fdev->mei_bind_continuation(fdev);
+
+	fdev->mei_bind_continuation = NULL;
+
+	mutex_unlock(&fdev->mei_ops_lock);
+
+	return 0;
+}
+
+static void unbind_from_mei(struct device *dev, struct device *mei_dev,
+			    void *data)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+	struct i915_iaf_component_ops *mei_ops = data;
+
+	dev_dbg(dev, "unbinding from MEI device %s\n", dev_name(mei_dev));
+
+	mutex_lock(&fdev->mei_ops_lock);
+
+	if (fdev->mei_bind_continuation)
+		dev_err(dev, "MEI unbound while bind continuation pending\n");
+
+	if (fdev->mei_ops != mei_ops)
+		dev_warn(dev, "MEI unbound OPs differ from bound OPs\n");
+
+	fdev->mei_bind_continuation = NULL;
+	fdev->mei_dev = NULL;
+
+	fdev->mei_ops = NULL;
+
+	mutex_unlock(&fdev->mei_ops_lock);
+}
+
+static const struct component_ops bind_ops = {
+	.bind = bind_to_mei,
+	.unbind = unbind_from_mei,
+};
+
+/*
+ * component system support interface
+ */
+
+/**
+ * mei_continuation_timeout - indicate that no MEI driver has registered
+ * @timer: MEI timer for device being registered
+ *
+ * If no MEI module has registered AND an automatic SVN update was requested, warn the
+ * administrator. Currently the only action taken is logging a kernel warning.
+ */
+static void mei_continuation_timeout(struct timer_list *timer)
+{
+	struct fdev *dev = timer_container_of(dev, timer, mei_continuation_timer);
+
+	if (dev->mei_bind_continuation)
+		dev_warn(fdev_dev(dev),
+			 "No MEI driver registered after %u seconds\n",
+			 mei_timeout);
+}
+
+/**
+ * mei_iaf_user_register - register for MEI access using component system
+ * @dev: device to register
+ *
+ * Return: 0 if successful, non-zero if component add request fails
+ */
+static int mei_iaf_user_register(struct fdev *dev)
+{
+	dev_dbg(fdev_dev(dev), "Registering as MEI_IAF user\n");
+
+	timer_setup(&dev->mei_continuation_timer, mei_continuation_timeout, 0);
+
+	return component_add_typed(fdev_dev(dev), &bind_ops,
+				   I915_COMPONENT_IAF);
+}
+
+/**
+ * mei_iaf_user_unregister - unregister for MEI access using component system
+ * @dev: device to register
+ */
+static void mei_iaf_user_unregister(struct fdev *dev)
+{
+	dev_dbg(fdev_dev(dev), "Unregistering as MEI_IAF user\n");
+
+	if (timer_pending(&dev->mei_continuation_timer))
+		timer_delete_sync(&dev->mei_continuation_timer);
+
+	component_del(fdev_dev(dev), &bind_ops);
+}
+
+/*
+ * ARB request interface - external interface used to request SVN updates for ARB
+ */
+
+/**
+ * iaf_mei_start - configure the driver for MEI requests
+ * @dev: device to configure
+ *
+ * must be called before calling iaf_mei_indicate_device_ok or iaf_commit_svn
+ *
+ * Return: 0 if successful, non-zero if request fails
+ */
+int iaf_mei_start(struct fdev *dev)
+{
+	mutex_init(&dev->mei_ops_lock);
+
+	INIT_WORK(&dev->mei_work, commit_svn_work);
+
+	return mei_iaf_user_register(dev);
+}
+
+/**
+ * iaf_mei_stop - deconfigure the driver for MEI requests
+ * @dev: device to deconfigure
+ *
+ * called during device removal process
+ */
+void iaf_mei_stop(struct fdev *dev)
+{
+	cancel_work_sync(&dev->mei_work);
+	mei_iaf_user_unregister(dev);
+}
+
+/**
+ * iaf_mei_indicate_device_ok - indicate device is functioning, initiate ARB as appropriate
+ * @dev: functioning device
+ *
+ * During regular booting, ARB is initiated once the device is deemed functioning properly if the
+ * automatic_rollback_protection module parameter is set. It can also be initiated iaf_commit_svn.
+ */
+void iaf_mei_indicate_device_ok(struct fdev *dev)
+{
+	if (automatic_rollback_protection &&
+	    dev->startup_mode == STARTUP_MODE_DEFAULT) {
+		int err;
+
+		err = try_commit_svn(dev, AUTOMATICALLY_RETRY);
+		if (err && err != -ENOENT)
+			dev_err(fdev_dev(dev), "unable to commit FW version, error %d\n", err);
+	} else {
+		if (is_fdev_registered(dev))
+			pr_info_once("FW version not automatically committed\n");
+	}
+}
+
+/**
+ * iaf_commit_svn - commit current software version number for ARB
+ * @dev: the device to operate on
+ *
+ * Use the MEI driver, if registered, to commit the current active software version number for
+ * anti-rollback protection, and prevent automatic continuation if the MEI driver is not currently
+ * bound to this driver. This is bound to a sysfs entry and errors propagate to the requestor.
+ *
+ * Return: 0 on success, non-zero if MEI not registered or on other failures
+ */
+int iaf_commit_svn(struct fdev *dev)
+{
+	mei_iaf_user_continuation(dev, NULL);
+	return try_commit_svn(dev, TRY_ONCE);
+}
diff --git a/drivers/gpu/drm/xe/fabric/mei_iaf_user.h b/drivers/gpu/drm/xe/fabric/mei_iaf_user.h
new file mode 100644
index 0000000000000..0d70044d1d55e
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/mei_iaf_user.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ */
+
+#ifndef _MEI_IAF_USER_H_
+#define _MEI_IAF_USER_H_
+
+#include <linux/device.h>
+
+#include "iaf_drv.h"
+
+int iaf_mei_start(struct fdev *dev);
+void iaf_mei_stop(struct fdev *dev);
+void iaf_mei_indicate_device_ok(struct fdev *dev);
+int iaf_commit_svn(struct fdev *dev);
+u16 get_min_svn(struct fdev *dev);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/netlink.c b/drivers/gpu/drm/xe/fabric/netlink.c
new file mode 100644
index 0000000000000..9cef70f21caa1
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/netlink.c
@@ -0,0 +1,1532 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/types.h>
+#include <linux/netlink.h>
+#include <net/genetlink.h>
+#include <linux/skbuff.h>
+#include <net/sock.h>
+
+#include "csr.h"
+#include "iaf_drv.h"
+#include "io.h"
+#include "mbdb.h"
+#include "netlink.h"
+#include "ops.h"
+#include "port.h"
+#include "routing_engine.h"
+#include "routing_event.h"
+#include "trace.h"
+
+#define IAF_ATTR_MAX (_IAF_ATTR_COUNT - 1)
+#define MSG_ENLARGE_RETRIES 4
+
+/*
+ * Prefix definitions:
+ * nla_ - netlink attribute
+ * genl_ - generic netlink
+ * nl_ - this modules names
+ */
+
+typedef enum cmd_rsp (*nl_process_op_cb_t)(struct sk_buff *msg,
+		      struct genl_info *info);
+
+struct nl_device_enum_cb_args {
+	struct sk_buff *msg;
+	u16 entries;
+};
+
+static struct genl_family nl_iaf_family;
+
+static DEFINE_MUTEX(nl_lock);
+
+static enum cmd_rsp nl_add_rsp_attrs(struct sk_buff *msg, struct nlattr *context, enum cmd_rsp rsp)
+{
+	if (nla_put_u8(msg, IAF_ATTR_CMD_OP_RESULT, rsp) ||
+	    nla_put_u8(msg, IAF_ATTR_CMD_OP_MSG_TYPE, IAF_CMD_MSG_RESPONSE)) {
+		return IAF_CMD_RSP_MSGSIZE;
+	}
+
+	/* Client need not specify a context attribute */
+	if (context)
+		if (nla_put_u64_64bit(msg, IAF_ATTR_CMD_OP_CONTEXT,
+				      nla_get_u64(context), IAF_ATTR_PAD))
+			return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_alloc_msg(struct genl_info *info, size_t msg_sz,
+				 struct sk_buff **msg, void **usrhdr)
+{
+	*msg = genlmsg_new(msg_sz, GFP_KERNEL);
+	if (!*msg)
+		return IAF_CMD_RSP_NOMEM;
+
+	*usrhdr = genlmsg_put_reply(*msg, info, &nl_iaf_family, 0, info->genlhdr->cmd);
+	if (!*usrhdr) {
+		nlmsg_free(*msg);
+		return IAF_CMD_RSP_NOMEM;
+	}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_send_reply(struct genl_info *info, struct sk_buff *msg, void *usrhdr,
+				  enum cmd_rsp rsp)
+{
+	enum cmd_rsp ret;
+
+	ret = nl_add_rsp_attrs(msg, info->attrs[IAF_ATTR_CMD_OP_CONTEXT], rsp);
+	if (ret != IAF_CMD_RSP_SUCCESS) {
+		nlmsg_free(msg);
+		return IAF_CMD_RSP_MSGSIZE;
+	}
+
+	genlmsg_end(msg, usrhdr);
+
+	if (genlmsg_reply(msg, info)) {
+		ret = IAF_CMD_RSP_FAILURE;
+		pr_err("Unable to send reply msg.\n");
+		nlmsg_free(msg);
+	}
+
+	return ret;
+}
+
+static enum cmd_rsp nl_alloc_process_and_send_reply(struct genl_info *info, size_t msg_sz,
+						    nl_process_op_cb_t op_cb)
+{
+	struct sk_buff *msg;
+	void *usrhdr;
+	enum cmd_rsp ret;
+
+	if (nl_alloc_msg(info, msg_sz, &msg, &usrhdr) != IAF_CMD_RSP_SUCCESS)
+		return IAF_CMD_RSP_NOMEM;
+
+	ret = op_cb(msg, info);
+	if (ret != IAF_CMD_RSP_SUCCESS) {
+		nlmsg_free(msg);
+		return ret;
+	}
+
+	return nl_send_reply(info, msg, usrhdr, IAF_CMD_RSP_SUCCESS);
+}
+
+static enum cmd_rsp nl_send_error_reply(struct genl_info *info, enum cmd_rsp rsp)
+{
+	struct sk_buff *msg;
+	void *usrhdr;
+
+	if (nl_alloc_msg(info, NLMSG_GOODSIZE, &msg, &usrhdr) != IAF_CMD_RSP_SUCCESS)
+		return IAF_CMD_RSP_NOMEM;
+
+	return nl_send_reply(info, msg, usrhdr, rsp);
+}
+
+static enum cmd_rsp nl_process_op_req(struct genl_info *info, nl_process_op_cb_t op_cb)
+{
+	enum cmd_rsp ret = IAF_CMD_RSP_FAILURE;
+	size_t msg_sz;
+	int retries;
+
+	trace_nl_rsp(info->genlhdr->cmd, NLMSG_GOODSIZE, info->snd_seq);
+
+	/* If we run out of space in the message, try to enlarge it */
+	for (msg_sz = NLMSG_GOODSIZE, retries = MSG_ENLARGE_RETRIES; retries; retries--,
+	     msg_sz += NLMSG_GOODSIZE) {
+		pr_debug("netlink response message buffer size is %lu\n", msg_sz);
+		ret = nl_alloc_process_and_send_reply(info, msg_sz, op_cb);
+		if (ret == IAF_CMD_RSP_SUCCESS)
+			return ret;
+
+		/* Only enlarge if msg was too small for the response */
+		if (ret != IAF_CMD_RSP_MSGSIZE)
+			break;
+	}
+
+	return nl_send_error_reply(info, ret);
+}
+
+static int nl_process_query(struct sk_buff *msg, struct genl_info *info, nl_process_op_cb_t op_cb)
+{
+	enum cmd_rsp ret;
+
+	mutex_lock(&nl_lock);
+
+	trace_nl_req(info->genlhdr->cmd, info->nlhdr->nlmsg_len, info->snd_seq);
+
+	if (info->genlhdr->version != INTERFACE_VERSION) {
+		ret = nl_send_error_reply(info, IAF_CMD_RSP_INVALID_INTERFACE_VERSION);
+		goto unlock;
+	}
+
+	if (!info->attrs[IAF_ATTR_CMD_OP_MSG_TYPE]) {
+		ret = nl_send_error_reply(info, IAF_CMD_RSP_MISSING_MSG_TYPE);
+		goto unlock;
+	}
+
+	if (nla_get_u8(info->attrs[IAF_ATTR_CMD_OP_MSG_TYPE]) != IAF_CMD_MSG_REQUEST) {
+		ret = nl_send_error_reply(info, IAF_CMD_RSP_MSG_TYPE_NOT_REQUEST);
+		goto unlock;
+	}
+
+	ret = nl_process_op_req(info, op_cb);
+
+unlock:
+	mutex_unlock(&nl_lock);
+	return ret == IAF_CMD_RSP_SUCCESS ? 0 : -EIO;
+}
+
+static enum cmd_rsp nl_get_sd(struct genl_info *info, struct fsubdev **sd)
+{
+	struct nlattr *fabric_id_attr = info->attrs[IAF_ATTR_FABRIC_ID];
+	struct nlattr *sd_idx_attr = info->attrs[IAF_ATTR_SD_INDEX];
+
+	if (!fabric_id_attr)
+		return IAF_CMD_RSP_MISSING_FABRIC_ID;
+
+	if (!sd_idx_attr)
+		return IAF_CMD_RSP_MISSING_SD_INDEX;
+
+	*sd = find_sd_id(nla_get_u32(fabric_id_attr), nla_get_u8(sd_idx_attr));
+	if (IS_ERR(*sd)) {
+		if (PTR_ERR(*sd) == -ENODEV)
+			return IAF_CMD_RSP_UNKNOWN_FABRIC_ID;
+
+		return IAF_CMD_RSP_SD_INDEX_OUT_OF_RANGE;
+	}
+
+	if (dev_is_runtime_debug((*sd)->fdev))
+		return IAF_CMD_RSP_UNKNOWN_FABRIC_ID;
+
+	/* Check that all sd's for this fabric device have been initialized */
+	if (!smp_load_acquire(&(*sd)->fdev->all_sds_inited)) {
+		fdev_put((*sd)->fdev);
+		return IAF_CMD_RSP_AGAIN;
+	}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_get_fdev(struct genl_info *info, struct fdev **dev)
+{
+	struct nlattr *fabric_id = info->attrs[IAF_ATTR_FABRIC_ID];
+
+	if (!fabric_id)
+		return IAF_CMD_RSP_MISSING_FABRIC_ID;
+
+	*dev = fdev_find(nla_get_u32(fabric_id));
+	if (!(*dev))
+		return IAF_CMD_RSP_UNKNOWN_FABRIC_ID;
+
+	if (dev_is_runtime_debug(*dev)) {
+		fdev_put(*dev);
+		return IAF_CMD_RSP_UNKNOWN_FABRIC_ID;
+	}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_add_fabric_device_attrs(struct sk_buff *msg,
+					       struct fdev *dev)
+{
+	const struct iaf_pdata *pd = dev->pd;
+
+	if (nla_put_string(msg, IAF_ATTR_DEV_NAME,
+			   dev_name(&dev->pdev->dev)) ||
+	    nla_put_string(msg, IAF_ATTR_PARENT_DEV_NAME,
+			   dev_name(dev->pdev->dev.parent)) ||
+
+	    nla_put_u8(msg, IAF_ATTR_PCI_SLOT_NUM, pd->slot) ||
+	    nla_put_u8(msg, IAF_ATTR_SOCKET_ID, pd->socket_id) ||
+	    nla_put_u8(msg, IAF_ATTR_VERSION, pd->version) ||
+	    nla_put_u8(msg, IAF_ATTR_PRODUCT_TYPE, pd->product) ||
+	    nla_put_u8(msg, IAF_ATTR_SUBDEVICE_COUNT, pd->sd_cnt))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_add_fabric_ports(struct sk_buff *msg, struct fsubdev *sd)
+{
+	struct fport *port;
+	u8 lpn;
+
+	for_each_fabric_port(port, lpn, sd) {
+		struct nlattr *nested_attr;
+
+		nested_attr = nla_nest_start(msg, IAF_ATTR_FABRIC_PORT);
+		if (!nested_attr)
+			return IAF_CMD_RSP_MSGSIZE;
+
+		if (nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_NUMBER, lpn) ||
+		    nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_TYPE, port->port_type)) {
+			nla_nest_cancel(msg, nested_attr);
+			return IAF_CMD_RSP_MSGSIZE;
+		}
+
+		nla_nest_end(msg, nested_attr);
+	}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_add_bridge_ports(struct sk_buff *msg, struct fsubdev *sd)
+{
+	u8 lpn;
+
+	for_each_bridge_lpn(lpn, sd)
+		if (nla_put_u8(msg, IAF_ATTR_BRIDGE_PORT_NUMBER, lpn))
+			return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_add_sub_device_attrs(struct sk_buff *msg,
+					    struct fsubdev *sd)
+{
+	if (nla_put_u64_64bit(msg, IAF_ATTR_GUID, sd->guid, IAF_ATTR_PAD) ||
+	    nla_put_u8(msg, IAF_ATTR_EXTENDED_PORT_COUNT,
+		       sd->extended_port_cnt) ||
+	    nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_COUNT, sd->port_cnt) ||
+	    nla_put_u8(msg, IAF_ATTR_SWITCH_LIFETIME,
+		       FIELD_GET(SLT_PSC_EP0_SWITCH_LIFETIME,
+				 sd->switchinfo.slt_psc_ep0)) ||
+	    nla_put_u8(msg, IAF_ATTR_ROUTING_MODE_SUPPORTED,
+		       sd->switchinfo.routing_mode_supported) ||
+	    nla_put_u8(msg, IAF_ATTR_ROUTING_MODE_ENABLED,
+		       sd->switchinfo.routing_mode_enabled) ||
+	    nla_put_u8(msg, IAF_ATTR_EHHANCED_PORT_0_PRESENT,
+		       FIELD_GET(SLT_PSC_EP0_ENHANCED_PORT_0,
+				 sd->switchinfo.slt_psc_ep0)))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	if (nl_add_fabric_ports(msg, sd))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	return nl_add_bridge_ports(msg, sd);
+}
+
+static int nl_process_device_enum_cb(struct fdev *dev, void *args)
+{
+	struct nl_device_enum_cb_args *device_enum_args = args;
+	struct sk_buff *msg = device_enum_args->msg;
+
+	struct nlattr *nested_attr =
+		nla_nest_start(msg, IAF_ATTR_FABRIC_DEVICE);
+
+	if (dev_is_runtime_debug(dev))
+		return -ENODEV;
+
+	if (!nested_attr)
+		return -EMSGSIZE;
+
+	if (nla_put_u32(msg, IAF_ATTR_FABRIC_ID, dev->fabric_id)) {
+		nla_nest_cancel(msg, nested_attr);
+		return -EMSGSIZE;
+	}
+
+	if (nl_add_fabric_device_attrs(msg, dev)) {
+		nla_nest_cancel(msg, nested_attr);
+		return -EMSGSIZE;
+	}
+
+	nla_nest_end(msg, nested_attr);
+
+	device_enum_args->entries++;
+
+	return 0;
+}
+
+static enum cmd_rsp nl_process_device_enum(struct sk_buff *msg,
+					   struct genl_info *info)
+{
+	struct nl_device_enum_cb_args device_enum_args;
+
+	device_enum_args.msg = msg;
+	device_enum_args.entries = 0;
+
+	/* Get each fdev from xarray and fill in nested information */
+	if (fdev_process_each(nl_process_device_enum_cb, &device_enum_args))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	if (nla_put_u16(msg, IAF_ATTR_ENTRIES, device_enum_args.entries))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_port_bitmap(struct fsubdev *sd, struct genl_info *info,
+				   unsigned long *port_mask)
+{
+	struct nlattr *nla;
+	int remaining;
+
+	nlmsg_for_each_attr(nla, info->nlhdr, GENL_HDRLEN, remaining)
+		if (nla_type(nla) == IAF_ATTR_FABRIC_PORT_NUMBER) {
+			u8 lpn = nla_get_u8(nla);
+
+			if (!get_fport_handle(sd, lpn))
+				return IAF_CMD_RSP_PORT_RANGE_ERROR;
+
+			set_bit(lpn, port_mask);
+		}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_set_port_state(struct sk_buff *msg,
+					      struct genl_info *info)
+{
+	struct fsubdev *sd;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	enum cmd_rsp ret;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret == IAF_CMD_RSP_SUCCESS) {
+		switch (info->genlhdr->cmd) {
+		case IAF_CMD_OP_PORT_ENABLE:
+			if (enable_fports(sd, port_mask, PORT_COUNT) == -EAGAIN)
+				ret = IAF_CMD_RSP_AGAIN;
+			break;
+		case IAF_CMD_OP_PORT_DISABLE:
+			if (disable_fports(sd, port_mask, PORT_COUNT) == -EAGAIN)
+				ret = IAF_CMD_RSP_AGAIN;
+			break;
+		case IAF_CMD_OP_PORT_USAGE_ENABLE:
+			ret = enable_usage_fports(sd, port_mask, PORT_COUNT);
+			break;
+		case IAF_CMD_OP_PORT_USAGE_DISABLE:
+			if (disable_usage_fports(sd, port_mask, PORT_COUNT) == -EAGAIN)
+				ret = IAF_CMD_RSP_AGAIN;
+			break;
+		default:
+			ret = IAF_CMD_RSP_FAILURE;
+			break;
+		}
+	}
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_set_port_beacon(struct sk_buff *msg, struct fsubdev *sd,
+				       u8 lpn, bool enable)
+{
+	struct fport *port = get_fport_handle(sd, lpn);
+	bool beacon_enabled;
+	enum cmd_rsp err;
+
+	if (!port)
+		return IAF_CMD_RSP_PORT_RANGE_ERROR;
+
+	beacon_enabled = test_bit(PORT_CONTROL_BEACONING, port->controls);
+
+	if ((enable && beacon_enabled) || (!enable && !beacon_enabled))
+		return IAF_CMD_RSP_SUCCESS;
+
+	err = ops_linkmgr_port_beacon_set(sd, lpn, enable);
+	if (err)
+		return IAF_CMD_RSP_MAIL_BOX_ERROR;
+
+	change_bit(PORT_CONTROL_BEACONING, port->controls);
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_set_port_beacon_state(struct sk_buff *msg,
+						     struct genl_info *info)
+{
+	bool enable = info->genlhdr->cmd == IAF_CMD_OP_PORT_BEACON_ENABLE;
+	struct fsubdev *sd;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	enum cmd_rsp ret;
+	u8 lpn;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret == IAF_CMD_RSP_SUCCESS) {
+		/*
+		 * When the caller does not specify any ports, all lpns are
+		 * walked and it's corresponding control_bit setting is set to
+		 * "enable" for that port's lpn.
+		 * Otherwise, only lpns specified in the message are examined
+		 * and set to "enable".
+		 */
+		if (bitmap_empty(port_mask, PORT_COUNT)) {
+			for_each_fabric_lpn(lpn, sd) {
+				ret = nl_set_port_beacon(msg, sd, lpn, enable);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		} else {
+			for_each_set_bit(lpn, port_mask, PORT_COUNT) {
+				ret = nl_set_port_beacon(msg, sd, lpn, enable);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		}
+	}
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_add_enabled_state(struct sk_buff *msg, u8 lpn,
+					 bool enabled)
+{
+	struct nlattr *nested_attr;
+
+	/* The caller guarantees the lpn is a valid fport and won't be NULL */
+
+	nested_attr = nla_nest_start(msg, IAF_ATTR_FABRIC_PORT);
+	if (!nested_attr)
+		return IAF_CMD_RSP_MSGSIZE;
+
+	if (nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_NUMBER, lpn) ||
+	    nla_put_u8(msg, IAF_ATTR_ENABLED_STATE, enabled)) {
+		nla_nest_cancel(msg, nested_attr);
+		return IAF_CMD_RSP_MSGSIZE;
+	}
+
+	nla_nest_end(msg, nested_attr);
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_query_port_control_state(struct sk_buff *msg,
+							struct genl_info *info)
+{
+	struct fsubdev *sd;
+	struct fport *port;
+	int bit;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	unsigned long *mask;
+	enum cmd_rsp ret;
+	u8 lpn;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		goto exit;
+
+	switch (info->genlhdr->cmd) {
+	case IAF_CMD_OP_PORT_STATE_QUERY:
+		bit = PORT_CONTROL_ENABLED;
+		break;
+	case IAF_CMD_OP_PORT_USAGE_STATE_QUERY:
+		bit = PORT_CONTROL_ROUTABLE;
+		break;
+	case IAF_CMD_OP_PORT_BEACON_STATE_QUERY:
+		bit = PORT_CONTROL_BEACONING;
+		break;
+	default:
+		ret = IAF_CMD_RSP_FAILURE;
+		goto exit;
+	}
+
+	/*
+	 * When the caller does not specify any ports, all lpns are
+	 * walked and it's corresponding control_bit setting is added to
+	 * the response for that port's lpn.
+	 * Otherwise, only lpns specified in the message are examined
+	 * and added to the response.
+	 */
+	if (bitmap_empty(port_mask, PORT_COUNT)) {
+		for_each_fabric_port(port, lpn, sd) {
+			mask = port->controls;
+
+			ret = nl_add_enabled_state(msg, lpn, test_bit(bit, mask));
+			if (ret != IAF_CMD_RSP_SUCCESS)
+				break;
+		}
+	} else {
+		for_each_masked_port(port, lpn, sd->port, port_mask, PORT_COUNT) {
+			mask = port->controls;
+
+			ret = nl_add_enabled_state(msg, lpn, test_bit(bit, mask));
+			if (ret != IAF_CMD_RSP_SUCCESS)
+				break;
+		}
+	}
+
+exit:
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_process_port_routed_query(struct sk_buff *msg,
+						 struct genl_info *info)
+{
+	struct fsubdev *sd;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	DECLARE_BITMAP(usage_mask, PORT_COUNT) = {};
+	u8 lpn;
+	enum cmd_rsp ret;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret == IAF_CMD_RSP_SUCCESS) {
+		routing_port_routed_query(sd, port_mask, usage_mask);
+
+		for_each_set_bit(lpn, port_mask, PORT_COUNT) {
+			ret = nl_add_enabled_state(msg, lpn,
+						   test_bit(lpn, usage_mask));
+			if (ret != IAF_CMD_RSP_SUCCESS)
+				break;
+		}
+	}
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_process_rem_request(struct sk_buff *msg,
+					   struct genl_info *info)
+{
+	rem_request();
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_routing_gen_query(struct sk_buff *msg,
+						 struct genl_info *info)
+{
+	u32 counter_start, counter_end;
+
+	routing_generation_read(&counter_start, &counter_end);
+
+	if (nla_put_u32(msg, IAF_ATTR_ROUTING_GEN_START, counter_start) ||
+	    nla_put_u32(msg, IAF_ATTR_ROUTING_GEN_END, counter_end))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_fabric_device_properties(struct sk_buff *msg,
+							struct genl_info *info)
+{
+	struct fdev *dev = NULL;
+	enum cmd_rsp ret;
+
+	ret = nl_get_fdev(info, &dev);
+	if (ret)
+		return ret;
+
+	ret = nl_add_fabric_device_attrs(msg, dev);
+
+	fdev_put(dev);
+	return ret;
+}
+
+static enum cmd_rsp nl_process_sub_device_properties_get(struct sk_buff *msg,
+							 struct genl_info *info)
+{
+	struct fsubdev *sd;
+	enum cmd_rsp ret;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_add_sub_device_attrs(msg, sd);
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_add_fport_status(struct sk_buff *msg, u8 lpn,
+					struct fsubdev *sd)
+{
+	struct fport_status status;
+	struct nlattr *nested_attr;
+	enum cmd_rsp err;
+
+	err = get_fport_status(sd, lpn, &status);
+	if (err)
+		return IAF_CMD_RSP_PORT_RANGE_ERROR;
+
+	/* The caller guarantees the lpn is a valid fport and won't be NULL */
+
+	nested_attr = nla_nest_start(msg, IAF_ATTR_FABRIC_PORT);
+	if (!nested_attr)
+		return IAF_CMD_RSP_MSGSIZE;
+
+	if (nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_NUMBER, lpn) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_HEALTH, status.health)) {
+		nla_nest_cancel(msg, nested_attr);
+		return IAF_CMD_RSP_MSGSIZE;
+	}
+
+	switch (status.health) {
+	case FPORT_HEALTH_OFF:
+	case FPORT_HEALTH_HEALTHY:
+		break;
+
+	case FPORT_HEALTH_FAILED:
+		if (test_bit(FPORT_ERROR_FAILED, status.errors))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ERROR_FAILED, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ERROR_ISOLATED, status.errors))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ERROR_ISOLATED, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ERROR_FLAPPING, status.errors))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ERROR_FLAPPING, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ERROR_LINK_DOWN, status.errors))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ERROR_LINK_DOWN, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ERROR_DID_NOT_TRAIN, status.errors))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ERROR_DID_NOT_TRAIN,
+				       1))
+				err = IAF_CMD_RSP_MSGSIZE;
+		break;
+
+	case FPORT_HEALTH_DEGRADED:
+		if (test_bit(FPORT_ISSUE_LQI, status.issues))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ISSUE_LQI, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ISSUE_LWD, status.issues))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ISSUE_LWD, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+
+		if (test_bit(FPORT_ISSUE_RATE, status.issues))
+			if (nla_put_u8(msg, IAF_ATTR_FPORT_ISSUE_RATE, 1))
+				err = IAF_CMD_RSP_MSGSIZE;
+		break;
+	}
+
+	if (err) {
+		nla_nest_cancel(msg, nested_attr);
+		return err;
+	}
+
+	nla_nest_end(msg, nested_attr);
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_fport_status_query(struct sk_buff *msg,
+						  struct genl_info *info)
+{
+	struct fsubdev *sd;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	enum cmd_rsp ret;
+	u8 lpn;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret == IAF_CMD_RSP_SUCCESS) {
+		/*
+		 * When the caller does not specify any ports, all lpns are
+		 * walked and it's corresponding nested status setting is added
+		 * to the response for that port's lpn.
+		 * Otherwise, only lpns specified in the message are examined
+		 * and added to the response.
+		 */
+
+		if (bitmap_empty(port_mask, PORT_COUNT)) {
+			for_each_fabric_lpn(lpn, sd) {
+				ret = nl_add_fport_status(msg, lpn, sd);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		} else {
+			for_each_set_bit(lpn, port_mask, PORT_COUNT) {
+				ret = nl_add_fport_status(msg, lpn, sd);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		}
+	}
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_process_sub_device_trap_count_query(struct sk_buff *msg,
+							   struct genl_info *info)
+{
+	struct fsubdev *sd;
+	enum cmd_rsp ret;
+	u64 psc_trap_count;
+	u64 lwd_trap_count;
+	u64 lqi_trap_count;
+	u64 qsfp_fault_trap_count;
+	u64 qsfp_present_trap_count;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	psc_trap_count = atomic64_read(&sd->psc_trap_count);
+	lwd_trap_count = atomic64_read(&sd->lwd_trap_count);
+	lqi_trap_count = atomic64_read(&sd->lqi_trap_count);
+	qsfp_fault_trap_count = atomic64_read(&sd->qsfp_fault_trap_count);
+	qsfp_present_trap_count = atomic64_read(&sd->qsfp_present_trap_count);
+
+	if (nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_TRAP_COUNT,
+			      psc_trap_count + lwd_trap_count + lqi_trap_count +
+			      qsfp_fault_trap_count + qsfp_present_trap_count, IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_PORT_STATE_CHANGE_TRAP_COUNT,
+			      psc_trap_count, IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_PORT_LWD_TRAP_COUNT,
+			      lwd_trap_count, IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_PORT_LQI_TRAP_COUNT,
+			      lqi_trap_count, IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_QSFP_MGR_FAULT_TRAP_COUNT,
+			      qsfp_fault_trap_count, IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_SUB_DEVICE_QSFP_MGR_PORT_PRESENT_TRAP_COUNT,
+			      qsfp_present_trap_count, IAF_ATTR_PAD))
+		ret = IAF_CMD_RSP_MSGSIZE;
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_add_fport_properties(struct sk_buff *msg, u8 lpn,
+					    struct fsubdev *sd)
+{
+	struct nlattr *nested_attr;
+	struct fport *fabric_port = get_fport_handle(sd, lpn);
+	struct portinfo *port_info;
+
+	/*
+	 * The caller guarantees the lpn is a valid fport and won't be NULL
+	 * but guard against the condition anyway.
+	 * There should be no reason to include logging an error.
+	 */
+	if (!fabric_port)
+		return IAF_CMD_RSP_PORT_RANGE_ERROR;
+
+	port_info = fabric_port->portinfo;
+
+	nested_attr = nla_nest_start(msg, IAF_ATTR_FABRIC_PORT);
+	if (!nested_attr)
+		return IAF_CMD_RSP_MSGSIZE;
+
+	if (nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_NUMBER, lpn) ||
+	    nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_TYPE, fabric_port->port_type) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_PM_PORT_STATE, fabric_port->state) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_ROUTED,
+		       atomic_read(&fabric_port->routed)) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LOGICAL_STATE,
+		       fabric_port->log_state) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_PHYSICAL_STATE,
+		       fabric_port->phys_state) ||
+	    nla_put_u32(msg, IAF_ATTR_FPORT_FID, port_info->fid) ||
+	    nla_put_u32(msg, IAF_ATTR_FPORT_LINK_DOWN_COUNT,
+			port_info->link_down_count) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_FPORT_NEIGHBOR_GUID,
+			      port_info->neighbor_guid, IAF_ATTR_PAD) ||
+	    nla_put_u32(msg, IAF_ATTR_FPORT_PORT_ERROR_ACTION,
+			port_info->port_error_action) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_NEIGHBOR_PORT_NUMBER,
+		       port_info->neighbor_port_number) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_PORT_LINK_MODE_ACTIVE,
+		       port_info->port_link_mode_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_NEIGHBOR_LINK_DOWN_REASON,
+		       port_info->neighbor_link_down_reason) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_H_O_Q_LIFETIME,
+		       port_info->h_o_q_lifetime) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_VL_CAP, port_info->vl_cap) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_OPERATIONAL_VLS,
+		       port_info->operational_vls) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_NEIGHBOR_MTU,
+		       port_info->neighbor_mtu) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LTP_CRC_MODE_SUPPORTED,
+		       port_info->crc_mode_supported) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LTP_CRC_MODE_ENABLED,
+		       port_info->crc_mode_enabled) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LTP_CRC_MODE_ACTIVE,
+		       port_info->crc_mode_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_WIDTH_SUPPORTED,
+		       port_info->link_width_supported) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_WIDTH_ENABLED,
+		       port_info->link_width_enabled) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_WIDTH_ACTIVE,
+		       port_info->link_width_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_SPEED_SUPPORTED,
+		       port_info->link_speed_supported) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_SPEED_ENABLED,
+		       port_info->link_speed_enabled) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_SPEED_ACTIVE,
+		       port_info->link_speed_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_RX_ACTIVE,
+		       port_info->link_width_downgrade_rx_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_TX_ACTIVE,
+		       port_info->link_width_downgrade_tx_active) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_INIT_REASON,
+		       port_info->link_init_reason) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_DOWN_REASON,
+		       port_info->link_down_reason) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LQI_OFFLINE_DISABLED_REASON,
+		       FIELD_GET(OLDR_NN_LQI_OFFLINE_DISABLED_REASON,
+				 port_info->oldr_nn_lqi)) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LQI_NEIGHBOR_NORMAL,
+		       FIELD_GET(OLDR_NN_LQI_NEIGHBOR_NORMAL,
+				 port_info->oldr_nn_lqi)) ||
+	    nla_put_u8(msg, IAF_ATTR_FPORT_LINK_QUALITY_INDICATOR,
+		       FIELD_GET(OLDR_NN_LQI_LINK_QUALITY_INDICATOR,
+				 port_info->oldr_nn_lqi)) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_FPORT_BPS_LINK_SPEED_MAX,
+			      bps_link_speed(port_info->link_speed_enabled),
+			      IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_FPORT_BPS_LINK_SPEED_ACTIVE,
+			      bps_link_speed(port_info->link_speed_active),
+			      IAF_ATTR_PAD) ||
+	    nla_put_u32(msg, IAF_ATTR_FPORT_LQI_CHANGE_COUNT,
+			port_info->lqi_change_count)) {
+		nla_nest_cancel(msg, nested_attr);
+		return IAF_CMD_RSP_MSGSIZE;
+	}
+
+	nla_nest_end(msg, nested_attr);
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_fport_properties_query(struct sk_buff *msg,
+						      struct genl_info *info)
+{
+	struct fsubdev *sd;
+	DECLARE_BITMAP(port_mask, PORT_COUNT) = {};
+	enum cmd_rsp ret;
+	u8 lpn;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_port_bitmap(sd, info, port_mask);
+	if (ret == IAF_CMD_RSP_SUCCESS) {
+		/*
+		 * When the caller does not specify any ports, all lpns are
+		 * walked and it's corresponding nested status setting is added
+		 * to the response for that port's lpn.
+		 * Otherwise, only lpns specified in the message are examined
+		 * and added to the response.
+		 */
+		down_write(&routable_lock); /* exclusive lock */
+
+		if (bitmap_empty(port_mask, PORT_COUNT)) {
+			for_each_fabric_lpn(lpn, sd) {
+				ret = nl_add_fport_properties(msg, lpn, sd);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		} else {
+			for_each_set_bit(lpn, port_mask, PORT_COUNT) {
+				ret = nl_add_fport_properties(msg, lpn, sd);
+				if (ret != IAF_CMD_RSP_SUCCESS)
+					break;
+			}
+		}
+
+		up_write(&routable_lock);
+	}
+
+	fdev_put(sd->fdev);
+	return ret;
+}
+
+static enum cmd_rsp nl_get_throughput(struct sk_buff *msg, struct fsubdev *sd, u8 lpn)
+{
+	struct fport *port;
+	u64 rsp_area[3];
+	struct mbdb_op_port_status_get_rsp *rsp = (struct mbdb_op_port_status_get_rsp *)rsp_area;
+	static struct mbdb_op_csr_range csr_ranges[] = {
+		{ .offset = O_FPC_PORTRCV_DATA_CNT,
+		  .num_csrs = 1
+		},
+		{ .offset = TP_PRF_XMIT_DATA_OFFSET,
+		  .num_csrs = 1
+		},
+	};
+
+	port = get_fport_handle(sd, lpn);
+	if (!port)
+		return IAF_CMD_RSP_PORT_RANGE_ERROR;
+
+	if (ops_port_status_get(sd, lpn, ARRAY_SIZE(csr_ranges),
+				csr_ranges, rsp))
+		return IAF_CMD_RSP_MAIL_BOX_ERROR;
+
+	if (nla_put_u64_64bit(msg, IAF_ATTR_TIMESTAMP, rsp->cp_free_run_rtc,
+			      IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_FPORT_RX_BYTES,
+			      flits_to_bytes(rsp->regs[0]), IAF_ATTR_PAD) ||
+	    nla_put_u64_64bit(msg, IAF_ATTR_FPORT_TX_BYTES,
+			      flits_to_bytes(rsp->regs[1]), IAF_ATTR_PAD))
+		return IAF_CMD_RSP_MSGSIZE;
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+static enum cmd_rsp nl_process_fport_xmit_recv_counts(struct sk_buff *msg,
+						      struct genl_info *info)
+{
+	struct fsubdev *sd;
+	enum cmd_rsp ret;
+
+	if (!info->attrs[IAF_ATTR_FABRIC_PORT_NUMBER])
+		return IAF_CMD_RSP_MISSING_PORT_NUMBER;
+
+	/* Get the sd to access */
+	ret = nl_get_sd(info, &sd);
+	if (ret != IAF_CMD_RSP_SUCCESS)
+		return ret;
+
+	ret = nl_get_throughput(msg, sd, nla_get_u8(info->attrs[IAF_ATTR_FABRIC_PORT_NUMBER]));
+
+	fdev_put(sd->fdev);
+
+	return ret;
+}
+
+static enum cmd_rsp nl_process_fport_throughput(struct sk_buff *msg, struct genl_info *info)
+{
+	struct nlattr *nla;
+	int remaining;
+	int remaining_nested;
+	enum cmd_rsp ret = IAF_CMD_RSP_SUCCESS;
+	struct fsubdev *sd;
+
+	nlmsg_for_each_attr(nla, info->nlhdr, GENL_HDRLEN, remaining) {
+		if (nla_type(nla) == IAF_ATTR_FABRIC_PORT) {
+			struct nlattr *fabric_id_attr;
+			struct nlattr *sd_idx_attr;
+			struct nlattr *lpn_attr;
+			struct nlattr *cur;
+			struct nlattr *nested_attr;
+
+			fabric_id_attr = NULL;
+			sd_idx_attr = NULL;
+			lpn_attr = NULL;
+
+			nla_for_each_nested(cur, nla, remaining_nested) {
+				switch (nla_type(cur)) {
+				case IAF_ATTR_FABRIC_ID:
+					fabric_id_attr = cur;
+					break;
+				case IAF_ATTR_SD_INDEX:
+					sd_idx_attr = cur;
+					break;
+				case IAF_ATTR_FABRIC_PORT_NUMBER:
+					lpn_attr = cur;
+					break;
+				default:
+					break;
+				}
+			}
+
+			if (!fabric_id_attr)
+				return IAF_CMD_RSP_MISSING_FABRIC_ID;
+
+			if (!sd_idx_attr)
+				return IAF_CMD_RSP_MISSING_SD_INDEX;
+
+			if (!lpn_attr)
+				return IAF_CMD_RSP_MISSING_PORT_NUMBER;
+
+			sd = find_sd_id(nla_get_u32(fabric_id_attr), nla_get_u8(sd_idx_attr));
+			if (IS_ERR(sd)) {
+				if (PTR_ERR(sd) == -ENODEV)
+					return IAF_CMD_RSP_UNKNOWN_FABRIC_ID;
+
+				return IAF_CMD_RSP_SD_INDEX_OUT_OF_RANGE;
+			}
+
+			nested_attr = nla_nest_start(msg, IAF_ATTR_FABRIC_PORT_THROUGHPUT);
+			if (!nested_attr) {
+				fdev_put(sd->fdev);
+				return IAF_CMD_RSP_MSGSIZE;
+			}
+
+			if (nla_put_u32(msg, IAF_ATTR_FABRIC_ID,
+					nla_get_u32(fabric_id_attr)) ||
+				nla_put_u8(msg, IAF_ATTR_SD_INDEX, nla_get_u8(sd_idx_attr)) ||
+				nla_put_u8(msg, IAF_ATTR_FABRIC_PORT_NUMBER,
+					   nla_get_u8(lpn_attr))) {
+				fdev_put(sd->fdev);
+				nla_nest_cancel(msg, nested_attr);
+				return IAF_CMD_RSP_MSGSIZE;
+			}
+
+			ret = nl_get_throughput(msg, sd, nla_get_u8(lpn_attr));
+
+			fdev_put(sd->fdev);
+
+			if (ret) {
+				nla_nest_cancel(msg, nested_attr);
+				return ret;
+			}
+
+			nla_nest_end(msg, nested_attr);
+		}
+	}
+
+	return IAF_CMD_RSP_SUCCESS;
+}
+
+#ifdef BPM_GENL_OPS_POLICY_MEMBER_NOT_PRESENT
+static const struct nla_policy nl_iaf_policy[] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+	[IAF_ATTR_CMD_OP_RESULT] = { .type = NLA_U8 },
+
+	[IAF_ATTR_FABRIC_ID] = { .type = NLA_U32 },
+	[IAF_ATTR_SD_INDEX] = { .type = NLA_U8 },
+
+	[IAF_ATTR_ENTRIES] = { .type = NLA_U16 },
+
+	[IAF_ATTR_FABRIC_DEVICE] = { .type = NLA_NESTED },
+	[IAF_ATTR_DEV_NAME] = { .type = NLA_NUL_STRING },
+	[IAF_ATTR_PARENT_DEV_NAME] = { .type = NLA_NUL_STRING },
+	[IAF_ATTR_PCI_SLOT_NUM] = { .type = NLA_U8 },
+	[IAF_ATTR_SOCKET_ID] = { .type = NLA_U8 },
+	[IAF_ATTR_SUBDEVICE_COUNT] = { .type = NLA_U8 },
+	[IAF_ATTR_VERSION] = { .type = NLA_U8 },
+	[IAF_ATTR_PRODUCT_TYPE] = { .type = NLA_U8 },
+
+	[IAF_ATTR_SUB_DEVICE] = { .type = NLA_NESTED },
+
+	[IAF_ATTR_GUID] = { .type = NLA_U64 },
+	[IAF_ATTR_EXTENDED_PORT_COUNT] = { .type = NLA_U8 },
+	[IAF_ATTR_FABRIC_PORT_COUNT] = { .type = NLA_U8 },
+	[IAF_ATTR_SWITCH_LIFETIME] = { .type = NLA_U8 },
+	[IAF_ATTR_ROUTING_MODE_SUPPORTED] = { .type = NLA_U8 },
+	[IAF_ATTR_ROUTING_MODE_ENABLED] = { .type = NLA_U8 },
+	[IAF_ATTR_EHHANCED_PORT_0_PRESENT] = { .type = NLA_U8 },
+
+	[IAF_ATTR_FABRIC_PORT] = { .type = NLA_NESTED },
+
+	[IAF_ATTR_FABRIC_PORT_NUMBER] = { .type = NLA_U8 },
+	[IAF_ATTR_FABRIC_PORT_TYPE] = { .type = NLA_U8 },
+
+	[IAF_ATTR_BRIDGE_PORT_NUMBER] = { .type = NLA_U8 },
+
+	[IAF_ATTR_ENABLED_STATE] = { .type = NLA_U8 },
+
+	[IAF_ATTR_ROUTING_GEN_START] = { .type = NLA_U32 },
+	[IAF_ATTR_ROUTING_GEN_END] = { .type = NLA_U32 },
+
+	[IAF_ATTR_FPORT_HEALTH] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ISSUE_LQI] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ISSUE_LWD] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ISSUE_RATE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ERROR_FAILED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ERROR_ISOLATED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ERROR_FLAPPING] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ERROR_LINK_DOWN] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ERROR_DID_NOT_TRAIN] = { .type = NLA_U8 },
+
+	[IAF_ATTR_SUB_DEVICE_TRAP_COUNT] = { .type = NLA_U64 },
+
+	[IAF_ATTR_FPORT_PM_PORT_STATE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_ROUTED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LOGICAL_STATE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_PHYSICAL_STATE] = { .type = NLA_U8 },
+
+	[IAF_ATTR_FPORT_FID] = { .type = NLA_U32 },
+	[IAF_ATTR_FPORT_LINK_DOWN_COUNT] = { .type = NLA_U32 },
+	[IAF_ATTR_FPORT_NEIGHBOR_GUID] = { .type = NLA_U64 },
+	[IAF_ATTR_FPORT_PORT_ERROR_ACTION] = { .type = NLA_U32 },
+	[IAF_ATTR_FPORT_NEIGHBOR_PORT_NUMBER] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_PORT_LINK_MODE_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_NEIGHBOR_LINK_DOWN_REASON] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_H_O_Q_LIFETIME] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_VL_CAP] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_OPERATIONAL_VLS] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_NEIGHBOR_MTU] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LTP_CRC_MODE_SUPPORTED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LTP_CRC_MODE_ENABLED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LTP_CRC_MODE_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_WIDTH_SUPPORTED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_WIDTH_ENABLED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_WIDTH_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_SPEED_SUPPORTED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_SPEED_ENABLED] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_SPEED_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_RX_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_WIDTH_DOWNGRADE_TX_ACTIVE] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_INIT_REASON] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_DOWN_REASON] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LQI_OFFLINE_DISABLED_REASON] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LQI_NEIGHBOR_NORMAL] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_LINK_QUALITY_INDICATOR] = { .type = NLA_U8 },
+	[IAF_ATTR_FPORT_BPS_LINK_SPEED_ACTIVE] = { .type = NLA_U64 },
+	[IAF_ATTR_TIMESTAMP] = { .type = NLA_U64 },
+	[IAF_ATTR_FPORT_RX_BYTES] = { .type = NLA_U64 },
+	[IAF_ATTR_FPORT_TX_BYTES] = { .type = NLA_U64 },
+	[IAF_ATTR_FPORT_BPS_LINK_SPEED_MAX] = { .type = NLA_U64 },
+	[IAF_ATTR_FPORT_LQI_CHANGE_COUNT] = { .type = NLA_U32 },
+	[IAF_ATTR_SUB_DEVICE_PORT_STATE_CHANGE_TRAP_COUNT] = { .type = NLA_U64 },
+	[IAF_ATTR_SUB_DEVICE_PORT_LWD_TRAP_COUNT] = { .type = NLA_U64 },
+	[IAF_ATTR_SUB_DEVICE_PORT_LQI_TRAP_COUNT] = { .type = NLA_U64 },
+	[IAF_ATTR_SUB_DEVICE_QSFP_MGR_FAULT_TRAP_COUNT] = { .type = NLA_U64 },
+	[IAF_ATTR_SUB_DEVICE_QSFP_MGR_PORT_PRESENT_TRAP_COUNT] = { .type = NLA_U64 },
+	[IAF_ATTR_FABRIC_PORT_THROUGHPUT] = { .type = NLA_NESTED },
+};
+#else
+static const struct nla_policy nl_iaf_policy_basic[IAF_ATTR_MAX + 1] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+};
+
+static const struct nla_policy nl_iaf_policy_fabric_id[IAF_ATTR_MAX + 1] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+	[IAF_ATTR_FABRIC_ID] = { .type = NLA_U32 },
+};
+
+static const struct nla_policy nl_iaf_policy_fabric_id_sd_index[IAF_ATTR_MAX + 1] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+	[IAF_ATTR_FABRIC_ID] = { .type = NLA_U32 },
+	[IAF_ATTR_SD_INDEX] = { .type = NLA_U8 },
+};
+
+static const struct nla_policy nl_iaf_policy_fabric_id_sd_index_port[IAF_ATTR_MAX + 1] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+	[IAF_ATTR_FABRIC_ID] = { .type = NLA_U32 },
+	[IAF_ATTR_SD_INDEX] = { .type = NLA_U8 },
+	[IAF_ATTR_FABRIC_PORT_NUMBER] = { .type = NLA_U8 },
+};
+
+static const struct nla_policy nl_iaf_policy_fabric_id_sd_index_nested_port[IAF_ATTR_MAX + 1] = {
+	[IAF_ATTR_CMD_OP_MSG_TYPE] = { .type = NLA_U8 },
+	[IAF_ATTR_CMD_OP_CONTEXT] = { .type = NLA_U64 },
+	[IAF_ATTR_FABRIC_PORT] = { .type = NLA_NESTED},
+	[IAF_ATTR_FABRIC_ID] = { .type = NLA_U32 },
+	[IAF_ATTR_SD_INDEX] = { .type = NLA_U8 },
+	[IAF_ATTR_FABRIC_PORT_NUMBER] = { .type = NLA_U8 },
+};
+#endif
+
+static int nl_device_enum_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_device_enum);
+}
+
+static int nl_port_enable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_state);
+}
+
+static int nl_port_disable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_state);
+}
+
+static int nl_port_state_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_query_port_control_state);
+}
+
+static int nl_port_usage_enable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_state);
+}
+
+static int nl_port_usage_disable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_state);
+}
+
+static int nl_port_usage_state_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_query_port_control_state);
+}
+
+static int nl_port_beacon_enable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_beacon_state);
+}
+
+static int nl_port_beacon_disable_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_set_port_beacon_state);
+}
+
+static int nl_port_beacon_state_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_query_port_control_state);
+}
+
+static int nl_port_routed_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_port_routed_query);
+}
+
+static int nl_rem_request_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_rem_request);
+}
+
+static int nl_routing_gen_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_routing_gen_query);
+}
+
+static int nl_fabric_device_properties_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_fabric_device_properties);
+}
+
+static int nl_fabric_sub_device_properties_get_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_sub_device_properties_get);
+}
+
+static int nl_fport_status_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_fport_status_query);
+}
+
+static int nl_sub_device_trap_count_query_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_sub_device_trap_count_query);
+}
+
+static int nl_fport_properties_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_fport_properties_query);
+}
+
+static int nl_fport_xmit_recv_counts_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_fport_xmit_recv_counts);
+}
+
+static int nl_fport_throughput_op(struct sk_buff *msg, struct genl_info *info)
+{
+	return nl_process_query(msg, info, nl_process_fport_throughput);
+}
+
+#ifdef BPM_GENL_OPS_POLICY_MEMBER_NOT_PRESENT
+static const struct genl_ops nl_iaf_cmds[] = {
+	{ .cmd = IAF_CMD_OP_DEVICE_ENUM, .doit = nl_device_enum_op, },
+	{ .cmd = IAF_CMD_OP_PORT_ENABLE, .doit = nl_port_enable_op, .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_DISABLE, .doit = nl_port_disable_op,
+	  .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_STATE_QUERY, .doit = nl_port_state_query_op, },
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_ENABLE, .doit = nl_port_usage_enable_op,
+	  .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_DISABLE, .doit = nl_port_usage_disable_op,
+	  .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_STATE_QUERY, .doit = nl_port_usage_state_query_op, },
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_ENABLE, .doit = nl_port_beacon_enable_op,
+	  .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_DISABLE, .doit = nl_port_beacon_disable_op,
+	  .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_STATE_QUERY, .doit = nl_port_beacon_state_query_op, },
+	{ .cmd = IAF_CMD_OP_PORT_ROUTED_QUERY, .doit = nl_port_routed_query_op, },
+	{ .cmd = IAF_CMD_OP_REM_REQUEST, .doit = nl_rem_request_op, .flags = GENL_UNS_ADMIN_PERM, },
+	{ .cmd = IAF_CMD_OP_ROUTING_GEN_QUERY, .doit = nl_routing_gen_query_op, },
+	{ .cmd = IAF_CMD_OP_FABRIC_DEVICE_PROPERTIES, .doit = nl_fabric_device_properties_op, },
+	{ .cmd = IAF_CMD_OP_SUB_DEVICE_PROPERTIES_GET,
+	  .doit = nl_fabric_sub_device_properties_get_op, },
+	{ .cmd = IAF_CMD_OP_FPORT_STATUS_QUERY, .doit = nl_fport_status_query_op, },
+	{ .cmd = IAF_CMD_OP_SUB_DEVICE_TRAP_COUNT_QUERY,
+	  .doit = nl_sub_device_trap_count_query_op, },
+	{ .cmd = IAF_CMD_OP_FPORT_PROPERTIES, .doit = nl_fport_properties_op, },
+	{ .cmd = IAF_CMD_OP_FPORT_XMIT_RECV_COUNTS, .doit = nl_fport_xmit_recv_counts_op, },
+	{ .cmd = IAF_CMD_OP_FPORT_THROUGHPUT, .doit = nl_fport_throughput_op, },
+};
+#else
+static const struct genl_ops nl_iaf_cmds[] = {
+	{ .cmd = IAF_CMD_OP_DEVICE_ENUM,
+	  .doit = nl_device_enum_op,
+	  .policy = nl_iaf_policy_basic,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_ENABLE,
+	  .doit = nl_port_enable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_DISABLE,
+	  .doit = nl_port_disable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_STATE_QUERY,
+	  .doit = nl_port_state_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_ENABLE,
+	  .doit = nl_port_usage_enable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_DISABLE,
+	  .doit = nl_port_usage_disable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_USAGE_STATE_QUERY,
+	  .doit = nl_port_usage_state_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_ENABLE,
+	  .doit = nl_port_beacon_enable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_DISABLE,
+	  .doit = nl_port_beacon_disable_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_BEACON_STATE_QUERY,
+	  .doit = nl_port_beacon_state_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_PORT_ROUTED_QUERY,
+	  .doit = nl_port_routed_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_REM_REQUEST,
+	  .doit = nl_rem_request_op,
+	  .policy = nl_iaf_policy_basic,
+	  .flags = GENL_UNS_ADMIN_PERM,
+	},
+
+	{ .cmd = IAF_CMD_OP_ROUTING_GEN_QUERY,
+	  .doit = nl_routing_gen_query_op,
+	  .policy = nl_iaf_policy_basic,
+	},
+
+	{ .cmd = IAF_CMD_OP_FABRIC_DEVICE_PROPERTIES,
+	  .doit = nl_fabric_device_properties_op,
+	  .policy = nl_iaf_policy_fabric_id,
+	},
+
+	{ .cmd = IAF_CMD_OP_SUB_DEVICE_PROPERTIES_GET,
+	  .doit = nl_fabric_sub_device_properties_get_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index,
+	},
+
+	{ .cmd = IAF_CMD_OP_FPORT_STATUS_QUERY,
+	  .doit = nl_fport_status_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_SUB_DEVICE_TRAP_COUNT_QUERY,
+	  .doit = nl_sub_device_trap_count_query_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index,
+	},
+
+	{ .cmd = IAF_CMD_OP_FPORT_PROPERTIES,
+	  .doit = nl_fport_properties_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_FPORT_XMIT_RECV_COUNTS,
+	  .doit = nl_fport_xmit_recv_counts_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_port,
+	},
+
+	{ .cmd = IAF_CMD_OP_FPORT_THROUGHPUT,
+	  .doit = nl_fport_throughput_op,
+	  .policy = nl_iaf_policy_fabric_id_sd_index_nested_port,
+	},
+};
+#endif
+
+static struct genl_family nl_iaf_family = {
+	.name = "iaf_ze",
+	.version = INTERFACE_VERSION,
+	.maxattr = IAF_ATTR_MAX,
+	.ops = nl_iaf_cmds,
+	.n_ops = ARRAY_SIZE(nl_iaf_cmds),
+#ifdef BPM_GENL_OPS_POLICY_MEMBER_NOT_PRESENT
+	.policy = nl_iaf_policy,
+#endif
+	.parallel_ops = true,
+};
+
+static bool nl_iaf_family_registered;
+
+/**
+ * nl_term - Unregisters the interface between kernel and user space.
+ */
+void nl_term(void)
+{
+	if (!nl_iaf_family_registered)
+		return;
+
+	if (genl_unregister_family(&nl_iaf_family))
+		pr_err("Unable to unregister netlink family %s\n", nl_iaf_family.name);
+	else
+		nl_iaf_family_registered = false;
+}
+
+/**
+ * nl_init - Registers the interface between kernel and user space.
+ *
+ * Return: genl_register_family result
+ */
+int nl_init(void)
+{
+	int err;
+
+#ifdef BPM_GENL_OPS_POLICY_MEMBER_NOT_PRESENT
+	BUILD_BUG_ON(ARRAY_SIZE(nl_iaf_policy) != _IAF_ATTR_COUNT);
+#endif
+	/* IAF_CMD_OP_UNSPEC is not included so-1 */
+	BUILD_BUG_ON(ARRAY_SIZE(nl_iaf_cmds) != _IAF_CMD_OP_COUNT - 1);
+
+	err = genl_register_family(&nl_iaf_family);
+	if (err)
+		pr_err("Cannot register iaf family %s\n", nl_iaf_family.name);
+	else
+		nl_iaf_family_registered = true;
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/fabric/netlink.h b/drivers/gpu/drm/xe/fabric/netlink.h
new file mode 100644
index 0000000000000..ba06575917d26
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/netlink.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2021 Intel Corporation.
+ *
+ */
+
+#ifndef NETLINK_H_INCLUDED
+#define NETLINK_H_INCLUDED
+
+#include "iaf_netlink.h"
+
+void nl_term(void);
+int nl_init(void);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/ops.c b/drivers/gpu/drm/xe/fabric/ops.c
new file mode 100644
index 0000000000000..84061c2d49e0a
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/ops.c
@@ -0,0 +1,1476 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/delay.h>
+
+#include "csr.h"
+#include "fw.h"
+#include "iaf_drv.h"
+#include "io.h"
+#include "mbdb.h"
+#include "ops.h"
+#include "trace.h"
+
+#define MAX_OP_RETRIES 16
+
+enum lock_state {
+	LOCK,
+	NOLOCK,
+};
+
+void ops_rsp_handler_relaxed(struct mbdb_ibox *ibox)
+{
+	u16 rsp_len = mbdb_mbox_params_len(ibox->cw);
+
+	if (unlikely(rsp_len != ibox->rsp_len))
+		/* Adjust response returned by firmware */
+		rsp_len = min(rsp_len, ibox->rsp_len);
+
+	io_readq_aligned(mbdb_ibox_gp_inbox_param_addr(ibox), ibox->response, rsp_len);
+}
+
+void ops_rsp_handler_default(struct mbdb_ibox *ibox)
+{
+	if (unlikely(mbdb_mbox_params_len(ibox->cw) != ibox->rsp_len)) {
+		ibox->rsp_status = -EINVAL;
+		sd_err(mbdb_ibox_sd(ibox), "mbdb inbox rsp_len mismatch: cw 0x%016llx actual %u expected %u\n",
+		       ibox->cw, mbdb_mbox_params_len(ibox->cw), ibox->rsp_len);
+	} else {
+		ops_rsp_handler_relaxed(ibox);
+	}
+}
+
+/**
+ * ops_element_copy - Copy array element data from src to dst even when they are of different sizes
+ * @src: src to be copied from
+ * @dst: dst to be copied into
+ * @src_sz: size of src element
+ * @dst_sz: size of dst element
+ * @elements: array element count
+ *
+ * Note: It is the responsibility of the caller to recognize the possibility that if dst > src
+ *       extra space at the tail of dst will not be altered
+ */
+void ops_element_copy(void __iomem *src, void *dst, size_t src_sz, size_t dst_sz, size_t elements)
+{
+	u8 __iomem *src_ptr;
+	u8 *dst_ptr;
+	size_t copy_sz;
+
+	for (src_ptr = src, dst_ptr = dst, copy_sz = min(src_sz, dst_sz); elements;
+	     elements--, src_ptr += src_sz, dst_ptr += dst_sz)
+		io_readq_unaligned(src_ptr, dst_ptr, copy_sz);
+}
+
+struct mbdb_ibox *
+mbdb_op_build_cw_and_acquire_ibox_set_hdlr(struct fsubdev *sd, const u8 op_code, size_t parm_len,
+					   void *response, u32 rsp_len, u64 *cw,
+					   unsigned long flags, op_response_handler op_rsp_handler)
+{
+	bool posted = FIELD_GET(OP_CODE_POSTED, flags);
+	struct mbdb_ibox *ibox;
+
+	if (FIELD_GET(OP_CODE_CHECK_IS_VALID, flags))
+		if (!is_opcode_valid(sd, op_code))
+			return ERR_PTR(-EPERM);
+
+	ibox = mbdb_ibox_acquire(sd, op_code, response, rsp_len, posted, op_rsp_handler);
+	if (IS_ERR(ibox)) {
+		sd_err(sd, "Unable to acquire ibox\n");
+		return ibox;
+	}
+
+	*cw = build_cw(op_code, MBOX_REQUEST,
+		       posted ? MBOX_NO_RESPONSE_REQUESTED
+			      : MBOX_RESPONSE_REQUESTED,
+		       0, parm_len, mbdb_ibox_tid(ibox));
+
+	return ibox;
+}
+
+struct mbdb_ibox *
+mbdb_op_build_cw_and_acquire_ibox(struct fsubdev *sd, const u8 op_code, size_t parm_len,
+				  void *response, u32 rsp_len, u64 *cw, unsigned long flags)
+{
+	return mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, op_code, parm_len, response, rsp_len,
+							  cw, flags, ops_rsp_handler_default);
+}
+
+int ops_tx_dcc_interp_override_enable_set(struct fsubdev *sd, u32 port, u32 lane, u32 enable,
+					  bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct dcc_interp_override_enable_set {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+		u32 enable;
+	} __packed req = {};
+	struct tx_dcc_margin_error_rsp rsp;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), posted ? NULL : &rsp,
+						 sizeof(rsp), &cw, POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OV_EN_SET;
+	req.port = port;
+	req.lane = lane;
+	req.enable = enable;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_interp_override_enable_get(struct fsubdev *sd, u32 port, u32 lane,
+					  struct tx_dcc_interp_override_enable_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct dcc_interp_override_enable_get {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OV_EN_GET;
+	req.port = port;
+	req.lane = lane;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_interp_override_set(struct fsubdev *sd, u32 port, u32 lane, u32 value, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct dcc_interp_override_set {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+		u32 value;
+	} __packed req = {};
+	struct tx_dcc_margin_error_rsp rsp;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), posted ? NULL : &rsp,
+						 posted ? 0 : sizeof(rsp), &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OVVL_SET;
+	req.port = port;
+	req.lane = lane;
+	req.value = value;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_interp_override_get(struct fsubdev *sd, u32 port, u32 lane,
+				   struct tx_dcc_interp_override_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct dcc_interp_override_get {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OVVL_GET;
+	req.port = port;
+	req.lane = lane;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_maint_mode_set(struct fsubdev *sd, u32 port, u32 mode, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct maint_mode_set_req {
+		u32 sub_op;
+		u32 port;
+		u32 mode;
+	} __packed req = {};
+	struct tx_dcc_margin_error_rsp rsp;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), posted ? NULL : &rsp,
+						 posted ? 0 : sizeof(rsp), &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_MAINT_MODE_SET;
+	req.port = port;
+	req.mode = mode;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_maint_mode_get(struct fsubdev *sd, u32 port, struct maint_mode_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct maint_mode_get_req {
+		u32 sub_op;
+		u32 port;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_MAINT_MODE_GET;
+	req.port = port;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_index_set(struct fsubdev *sd, u32 port, u32 lane, u32 index, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct serdes_margin_param_set_req {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+		u32 index;
+	} __packed req = {};
+	struct tx_dcc_margin_error_rsp rsp;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), posted ? NULL : &rsp,
+						 posted ? 0 : sizeof(rsp), &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INDEX_SET;
+	req.port = port;
+	req.lane = lane;
+	req.index = index;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_interp_get(struct fsubdev *sd, u32 port, u32 lane, struct tx_dcc_interp_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct dcc_interp_get_req {
+		u32 sub_op;
+		u32 port;
+		u32 lane;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_GET;
+	req.port = port;
+	req.lane = lane;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_margin_param_set(struct fsubdev *sd, u32 port, u16 value, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct serdes_margin_param_set_req {
+		u32 sub_op;
+		u32 port;
+		u16 value;
+	} __packed req = {};
+	struct tx_dcc_margin_error_rsp rsp;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), posted ? NULL : &rsp,
+						 posted ? 0 : sizeof(rsp), &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_MARGIN_PARAM_SET;
+	req.port = port;
+	req.value = value;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_tx_dcc_margin_param_get(struct fsubdev *sd, u32 port,
+				struct tx_dcc_margin_param_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_TX_DCC_MARGIN;
+	struct mbdb_ibox *ibox;
+	struct serdes_margin_param_get_req {
+		u32 sub_op;
+		u32 port;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.sub_op = SERDES_MARGIN_SUB_OP_CODE_TX_DCC_MARGIN_PARAM_GET;
+	req.port = port;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_serdes_channel_estimate_get(struct fsubdev *sd, u32 port, u32 lane,
+				    struct mbdb_serdes_ch_est_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_CHEST_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_serdes_ch_est_req {
+		u32 port;
+		u32 lane;
+		u32 ilv;
+		u32 range_min;
+		u32 range_max;
+	} __packed req = {};
+	struct mbdb_op_param op_param;
+	u64 cw;
+	int ret;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, op_code, sizeof(req), rsp->data,
+							  sizeof(rsp->data), &cw,
+							  NON_POSTED_CHECK_OP,
+							  ops_rsp_handler_relaxed);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.lane = lane;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	ret = ops_execute(sd, &cw, 1, &op_param, ibox);
+	if (!ret)
+		rsp->elements = mbdb_mbox_params_len(cw) / sizeof(rsp->data[0]);
+
+	return ret;
+}
+
+int ops_port_var_table_write(struct fsubdev *sd, u32 port, u32 link_speed,
+			     struct port_var_data *data, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_VARIABLE_TABLE_WRITE;
+	struct mbdb_ibox *ibox;
+	struct mbdb_var_table_write_req {
+		u32 port;
+		u32 link_speed;
+		struct port_var_data data;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	/* must write a valid port/speed setting, can write multiple speeds */
+	if (!port || !(link_speed & (LINK_SPEED_SLOW | LINK_SPEED_FAST)))
+		return -EINVAL;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.link_speed = link_speed;
+	memcpy(&req.data, data, sizeof(*data));
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_port_var_table_read(struct fsubdev *sd, u32 port, u32 link_speed, struct port_var_data *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_VARIABLE_TABLE_READ;
+	struct mbdb_ibox *ibox;
+	struct mbdb_var_table_read_req {
+		u32 port;
+		u32 link_speed;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	/* must read a single valid port/speed setting */
+	if (!port || (bool)(link_speed & LINK_SPEED_SLOW) == (bool)(link_speed & LINK_SPEED_FAST))
+		return -EINVAL;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.link_speed = link_speed;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+static void ops_serdes_eqinfo_rsp_handler(struct mbdb_ibox *ibox)
+{
+	u16 rsp_len = mbdb_mbox_params_len(ibox->cw);
+	struct mbdb_serdes_eq_info_get_rsp *rsp = ibox->response;
+	u64 __iomem *gp_inbox_param_addr = mbdb_ibox_gp_inbox_param_addr(ibox);
+
+	/* B0 response received */
+	if (rsp_len == sizeof(struct mbdb_serdes_eq_info_get_rsp)) {
+		ops_element_copy(gp_inbox_param_addr, rsp, rsp_len / LANES,
+				 sizeof(*rsp) / LANES, LANES);
+	} else {
+		ibox->rsp_status = -EINVAL;
+		sd_err(mbdb_ibox_sd(ibox), "mbdb inbox rsp_len mismatch: cw 0x%016llx actual %u expected %u\n",
+		       ibox->cw, rsp_len, ibox->rsp_len);
+	}
+}
+
+int ops_linkmgr_trace_mask_set(struct fsubdev *sd, u64 mask)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_TRACE_MASK_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_linkmgr_trace_mask_set_req {
+		u64 mask;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.mask = mask;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_trace_mask_get(struct fsubdev *sd, u64 *mask)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_TRACE_MASK_GET;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, mask, sizeof(*mask), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_trace_dump(struct fsubdev *sd, u32 cnt, bool first,
+			   struct mbdb_op_linkmgr_trace_dump_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_TRACE_DUMP;
+	struct mbdb_ibox *ibox;
+	struct mbdb_linkmgr_trace_dump_req {
+		u32 cnt;
+		u32 first;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.cnt = cnt;
+	req.first = first;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_serdes_eqinfo_get(struct fsubdev *sd, u32 port, struct mbdb_serdes_eq_info_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_EQINFO_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_serdes_eqinfo_req {
+		u32 port;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, op_code, sizeof(req), rsp,
+							  sizeof(*rsp), &cw, NON_POSTED_CHECK_OP,
+							  ops_serdes_eqinfo_rsp_handler);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_serdes_histogram_get(struct fsubdev *sd, u32 port, struct mbdb_serdes_histogram_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SERDES_HISTOGRAM_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_serdes_histogram_req {
+		u32 port;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_statedump(struct fsubdev *sd, u32 offset, struct mbdb_statedump_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_STATE_DUMP;
+	struct mbdb_ibox *ibox;
+	struct mbdb_statedump_req {
+		u32 offset;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+	int ret;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, op_code, sizeof(req), rsp->descs,
+							  sizeof(rsp->descs), &cw,
+							  NON_POSTED_CHECK_OP,
+							  ops_rsp_handler_relaxed);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.offset = offset;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	ret = ops_execute_nolock(sd, &cw, 1, &op_param, ibox);
+	if (!ret)
+		rsp->desc_count = mbdb_mbox_params_len(cw) / sizeof(rsp->descs[0]);
+
+	return ret;
+}
+
+int ops_port_status_get(struct fsubdev *sd, u32 port, u8 num_csr_ranges,
+			const struct mbdb_op_csr_range *csr_ranges,
+			struct mbdb_op_port_status_get_rsp *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_PORT_STATUS_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_port_status_get_req {
+		u32 port;
+		u32 reserved;
+	} __packed req;
+	struct mbdb_op_param op_param[2];
+	u64 cw;
+	int csr_count = 0;
+	int i;
+	size_t req_len;
+	size_t rsp_len;
+
+	for (i = 0; i < num_csr_ranges; i++)
+		csr_count += csr_ranges[i].num_csrs;
+
+	if (!csr_count || csr_count > MAX_CSRS) {
+		sd_err(sd, "Wrong number of csrs(%d) specified\n", csr_count);
+		return -EINVAL;
+	}
+
+	req_len = sizeof(req) + sizeof(*csr_ranges) * num_csr_ranges;
+	rsp_len = sizeof(*rsp) + CSR_SIZE * csr_count;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, req_len, rsp, rsp_len, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.reserved = 0;
+
+	op_param[0].len = sizeof(req);
+	op_param[0].data = &req;
+	/*
+	 * The req struct which only identifies the port on which to act is
+	 * immediately followed by a list of csr ranges to be obtained.
+	 */
+	op_param[1].len = sizeof(*csr_ranges) * num_csr_ranges;
+	op_param[1].data = csr_ranges;
+
+	return ops_execute(sd, &cw, ARRAY_SIZE(op_param), op_param, ibox);
+}
+
+int ops_linkmgr_port_lqi_trap_ack(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ACKNOWLEDGE;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_port_lqi_trap_ena_set(struct fsubdev *sd, bool enabled,
+				      bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ENABLE_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_enable_param req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	mbdb_op_enable_param_set(&req, enabled);
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_port_lwd_trap_ack(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ACKNOWLEDGE;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_port_lwd_trap_ena_set(struct fsubdev *sd, bool enabled,
+				      bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ENABLE_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_enable_param req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	mbdb_op_enable_param_set(&req, enabled);
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_rpipe_get(struct fsubdev *sd, struct mbdb_op_rpipe_get *req,
+		  struct mbdb_op_rpipe_get *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_RPIPE_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+	size_t rsp_len;
+
+	rsp_len = sizeof(*rsp) + (req->num_entries * sizeof(u8));
+	if (rsp_len > MBOX_PARAM_AREA_IN_BYTES) {
+		sd_err(sd, "Too many entries specified.\n");
+		return -EINVAL;
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(*req), rsp, rsp_len, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(*req);
+	op_param.data = req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_rpipe_set(struct fsubdev *sd, struct mbdb_op_rpipe_set *req,
+		  struct mbdb_op_rpipe_set *rsp, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_RPIPE_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+	size_t req_len;
+	size_t rsp_len;
+
+	if (WARN_ON(!posted && !rsp))
+		return -EINVAL;
+
+	req_len = sizeof(*req) + (req->num_entries * sizeof(u8));
+	rsp_len = posted ? 0 : sizeof(*rsp) + (req->num_entries * sizeof(u8));
+	if (req_len > MBOX_PARAM_AREA_IN_BYTES ||
+	    rsp_len > MBOX_PARAM_AREA_IN_BYTES) {
+		sd_err(sd, "Too many entries specified\n");
+		return -EINVAL;
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, req_len, rsp, rsp_len, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = req_len;
+	op_param.data = req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+void ops_portinfo_rsp_handler(struct mbdb_ibox *ibox)
+{
+	u16 rsp_len = mbdb_mbox_params_len(ibox->cw);
+	struct mbdb_op_portinfo *rsp;
+	struct portinfo *per_portinfo;
+	u8 port_count;
+	size_t fw_portinfo_sz;
+	u8 __iomem *gp_inbox_param_addr;
+
+	if (likely(rsp_len == ibox->rsp_len)) {
+		io_readq_aligned(mbdb_ibox_gp_inbox_param_addr(ibox), ibox->response, rsp_len);
+		return;
+	}
+
+	sd_warn(mbdb_ibox_sd(ibox), "mbdb inbox rsp_len mismatch: cw 0x%016llx actual %u expected %u\n",
+		ibox->cw, rsp_len, ibox->rsp_len);
+
+	gp_inbox_param_addr = (u8 __iomem *)mbdb_ibox_gp_inbox_param_addr(ibox);
+
+	rsp = ibox->response;
+	per_portinfo = rsp->per_portinfo;
+
+	io_readq_aligned((u64 __iomem *)gp_inbox_param_addr, rsp, sizeof(*rsp));
+
+	port_count = hweight32(rsp->port_mask);
+
+	fw_portinfo_sz = (rsp_len - sizeof(*rsp)) / port_count;
+
+	ops_element_copy((void __iomem *)(gp_inbox_param_addr + sizeof(*rsp)), per_portinfo,
+			 fw_portinfo_sz, sizeof(struct portinfo), port_count);
+}
+
+int ops_portinfo_get(struct fsubdev *sd, u32 port_mask,
+		     struct mbdb_op_portinfo *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_PORTINFO_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+	size_t rsp_len;
+
+	rsp_len = sizeof(*rsp) + (hweight32(port_mask) * sizeof(struct portinfo));
+	if (rsp_len > MBOX_PARAM_AREA_IN_BYTES) {
+		sd_err(sd, "Too many ports specified.\n");
+		return -EINVAL;
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, op_code, sizeof(port_mask), rsp,
+							  rsp_len, &cw, NON_POSTED_CHECK_OP,
+							  ops_portinfo_rsp_handler);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(port_mask);
+	op_param.data = &port_mask;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_switchinfo_set(struct fsubdev *sd, struct mbdb_op_switchinfo *req,
+		       struct mbdb_op_switchinfo *rsp, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_SWITCHINFO_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	if (WARN_ON(!posted && !rsp))
+		return -EINVAL;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(*req), rsp,
+						 posted ? 0 : sizeof(*rsp), &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(*req);
+	op_param.data = req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_switchinfo_get(struct fsubdev *sd, struct mbdb_op_switchinfo *rsp)
+{
+	const u8 op_code = MBOX_OP_CODE_SWITCHINFO_GET;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, rsp, sizeof(*rsp), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_psc_trap_ack(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ACKNOWLEDGE;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_psc_trap_ena_set(struct fsubdev *sd, bool enabled, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ENABLE_SET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_enable_param req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	mbdb_op_enable_param_set(&req, enabled);
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_port_beacon_set(struct fsubdev *sd, u32 port, bool enable)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_BEACON_SET;
+	struct mbdb_ibox *ibox;
+	struct linkmgr_port_beacon_set_req {
+		u32 port;
+		struct mbdb_op_enable_param enable;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), NULL, 0, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	mbdb_op_enable_param_set(&req.enable, enable);
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_ps_get(struct fsubdev *sd, u32 port, u32 *result)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_STATES_GET;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(port), result, sizeof(*result),
+						 &cw, NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(port);
+	op_param.data = &port;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_qsfpmgr_fault_trap_ack(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_QSFP_MGR_FAULT_TRAP_ACKNOWLEDGE;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	/*
+	 * This opcode is optional and may not be supported in firmware.
+	 * Return EIO so the caller logs a message indicating we cannot issue the ack opcode.
+	 */
+	if (!test_bit(op_code, sd->fw_version.supported_opcodes))
+		return -EIO;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_reset(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_RESET;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_linkmgr_port_csr_wr(struct fsubdev *sd, u32 lpn, u32 offset,
+			    const void *data, u16 len, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_CSR_WR;
+	struct mbdb_ibox *ibox;
+	struct linkmgr_port_csr_wr_req {
+		u32 lpn;
+		u32 offset;
+	} __packed req;
+	struct mbdb_op_param op_param[2];
+	u64 cw;
+
+	if (WARN_ON(!FIELD_FIT(MBOX_CW_PARAMS_LEN, len)))
+		return -EINVAL;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, len, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.lpn = lpn;
+	req.offset = offset;
+
+	op_param[0].len = sizeof(req);
+	op_param[0].data = &req;
+	op_param[1].len = len;
+	op_param[1].data = data;
+
+	return ops_execute(sd, &cw, ARRAY_SIZE(op_param), op_param, ibox);
+}
+
+int ops_linkmgr_port_csr_rd(struct fsubdev *sd, u32 lpn, u32 offset, u16 len,
+			    u64 *result)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_CSR_RD;
+	struct mbdb_ibox *ibox;
+	struct linkmgr_port_csr_rd_req {
+		u32 lpn;
+		u32 offset;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	if (WARN_ON(!FIELD_FIT(MBOX_CW_PARAMS_LEN, len)))
+		return -EINVAL;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, len, result, len, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.lpn = lpn;
+	req.offset = offset;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_port_maj_phystate_set(struct fsubdev *sd, u32 port,
+				      u32 new_state, u32 *result)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_MAJOR_PHYSICAL_STATE_SET;
+	struct mbdb_ibox *ibox;
+	struct linkmgr_port_maj_phystate_set_req {
+		u32 port;
+		u32 new_state;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), result, sizeof(*result),
+						 &cw, NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.new_state = new_state;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_linkmgr_port_link_state_set(struct fsubdev *sd, u32 port, u32 new_state,
+				    u32 *result)
+{
+	const u8 op_code = MBOX_OP_CODE_LINK_MGR_PORT_LINK_STATE_SET;
+	struct mbdb_ibox *ibox;
+	struct linkmgr_port_link_state_set_req {
+		u32 port;
+		u32 new_state;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(req), result, sizeof(*result),
+						 &cw, NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.port = port;
+	req.new_state = new_state;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_ini_loaded_set(struct fsubdev *sd, bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_INI_LOADED_SET;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_ini_table_load(struct fsubdev *sd,
+		       struct mbdb_op_ini_table_load_req *info, u32 *result)
+{
+	const u8 op_code = MBOX_OP_CODE_INI_TABLE_LOAD;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(*info), result,
+						 sizeof(*result), &cw, NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(*info);
+	op_param.data = info;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_walloc(struct fsubdev *sd, u16 dwords, u32 *addr)
+{
+	const u8 op_code = MBOX_OP_CODE_WALLOC;
+	struct mbdb_ibox *ibox;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, sizeof(dwords), addr, sizeof(*addr),
+						 &cw, NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	op_param.len = sizeof(dwords);
+	op_param.data = &dwords;
+
+	return ops_execute(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_fw_start(struct fsubdev *sd)
+{
+	const u8 op_code = MBOX_OP_CODE_FW_START;
+	struct mbdb_ibox *ibox;
+	u32 result = 0;
+	u64 cw;
+	int err;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, &result, sizeof(result), &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	err = ops_execute(sd, &cw, 0, NULL, ibox);
+	if (err)
+		return err;
+
+	/* map fw start failures to an op status error */
+	return result ? MBOX_RSP_STATUS_LOGICAL_ERROR : 0;
+}
+
+int ops_csr_raw_write(struct fsubdev *sd, u32 addr, const void *data, u32 len,
+		      bool posted)
+{
+	const u8 op_code = MBOX_OP_CODE_CSR_RAW_WR;
+	struct mbdb_ibox *ibox = NULL;
+	struct csr_raw_write_req {
+		u32 addr;
+		u32 reserved;
+	} __packed req;
+	struct mbdb_op_param op_param[2];
+	u64 cw;
+
+	if (len > MBOX_WRITE_DATA_SIZE_IN_BYTES) {
+		sd_err(sd, "Write of raw buffer to mailbox, max size was exceeded. len %d\n",
+		       len);
+		return -EINVAL;
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, len, NULL, 0, &cw,
+						 POSTED_CHECK_OP(posted));
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.addr = addr;
+	req.reserved = 0;
+
+	op_param[0].len = sizeof(req);
+	op_param[0].data = &req;
+	op_param[1].len = len;
+	op_param[1].data = data;
+
+	return ops_execute(sd, &cw, ARRAY_SIZE(op_param), op_param, ibox);
+}
+
+static int ops_csr_raw_read_exec(struct fsubdev *sd, u32 addr, size_t read_len, void *data,
+				 enum lock_state lockit)
+{
+	const u8 op_code = MBOX_OP_CODE_CSR_RAW_RD;
+	struct mbdb_ibox *ibox;
+	struct csr_raw_write_req {
+		u32 addr;
+	} __packed req;
+	struct mbdb_op_param op_param;
+	u64 cw;
+
+	if (read_len > MBOX_READ_DATA_SIZE_IN_BYTES) {
+		sd_err(sd, "Read of raw buffer from mailbox, max size was exceeded. read_len %ld\n",
+		       read_len);
+		return -EINVAL;
+	}
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, read_len, data, read_len, &cw,
+						 NON_POSTED_CHECK_OP);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	req.addr = addr;
+
+	op_param.len = sizeof(req);
+	op_param.data = &req;
+
+	if (lockit == LOCK)
+		return ops_execute(sd, &cw, 1, &op_param, ibox);
+
+	return ops_execute_nolock(sd, &cw, 1, &op_param, ibox);
+}
+
+int ops_csr_raw_read_nolock(struct fsubdev *sd, u32 addr, size_t read_len, void *data)
+{
+	return ops_csr_raw_read_exec(sd, addr, read_len, data, NOLOCK);
+}
+
+int ops_csr_raw_read(struct fsubdev *sd, u32 addr, size_t read_len, void *data)
+{
+	return ops_csr_raw_read_exec(sd, addr, read_len, data, LOCK);
+}
+
+int ops_fw_version(struct fsubdev *sd,
+		   struct mbdb_op_fw_version_rsp *fw_version)
+{
+	const u8 op_code = MBOX_OP_CODE_FW_VERSION;
+	struct mbdb_ibox *ibox;
+	u64 cw;
+
+	ibox = mbdb_op_build_cw_and_acquire_ibox(sd, op_code, 0, fw_version, sizeof(*fw_version),
+						 &cw, NON_POSTED);
+	if (IS_ERR(ibox))
+		return PTR_ERR(ibox);
+
+	return ops_execute(sd, &cw, 0, NULL, ibox);
+}
+
+int ops_mem_posted_wr(struct fsubdev *sd, u32 addr, const u8 *data, u32 len)
+{
+	int ret = 0;
+
+	if (!len)
+		return -EINVAL;
+
+	while (len) {
+		int xfer_len = len <= MBOX_WRITE_DATA_SIZE_IN_BYTES
+			       ? len : MBOX_WRITE_DATA_SIZE_IN_BYTES;
+		ret = ops_csr_raw_write(sd, addr, data, xfer_len, true);
+		if (ret)
+			break;
+
+		len -= xfer_len;
+		addr += xfer_len;
+		data += xfer_len;
+	}
+
+	return ret;
+}
+
+static int ops_execute_exec(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+			    struct mbdb_op_param *op_param, struct mbdb_ibox *ibox);
+
+static int ops_retry(struct fsubdev *sd, u64 *cw, u8 op_param_count, struct mbdb_op_param *op_param,
+		     struct mbdb_ibox *ibox)
+{
+	if (ibox->retries < MAX_OP_RETRIES) {
+		struct mbdb_ibox *new_ibox =
+			mbdb_op_build_cw_and_acquire_ibox_set_hdlr(sd, mbdb_mbox_op_code(*cw),
+								   mbdb_mbox_params_len(*cw),
+								   ibox->response, ibox->rsp_len,
+								   cw, NON_POSTED,
+								   ibox->op_rsp_handler);
+		if (IS_ERR(new_ibox))
+			return PTR_ERR(new_ibox);
+
+		if (WARN(!new_ibox, " ibox acquire must be NON_POSTED only\n"))
+			return -EINVAL;
+
+		new_ibox->retries = ibox->retries + 1;
+
+		msleep(100 * new_ibox->retries);
+
+		sd_dbg(sd, "Retry %u for op code %u\n", new_ibox->retries, mbdb_mbox_op_code(*cw));
+
+		return ops_execute_exec(sd, cw, op_param_count, op_param, new_ibox);
+	}
+
+	return -EBUSY;
+}
+
+/**
+ * ops_execute_exec - Executes a mailbox operation
+ *
+ * @sd: subdevice to be actioned
+ * @cw: mailbox control word
+ * @op_param_count: count of parameters in op_param
+ * @op_param: array of parameters for the mailbox operation
+ * @ibox: when present, the response area for non-posted operations
+ *
+ * Return: Zero on success, Negative on resource error.
+ * Positive on mailbox response status indicating an error from the mailbox
+ *
+ * Note: The ibox is consumed when present
+ *
+ */
+static int ops_execute_exec(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+			    struct mbdb_op_param *op_param, struct mbdb_ibox *ibox)
+{
+	struct mbox_msg __iomem *mbox_msg;
+	u64 __iomem *mbox_msg_param_area;
+	int ret = 0;
+
+	mbox_msg = mbdb_outbox_acquire(sd, cw);
+	if (IS_ERR(mbox_msg)) {
+		mbdb_ibox_release_pre_wait(ibox);
+		return PTR_ERR(mbox_msg);
+	}
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	writeq(*cw, &mbox_msg->cw);
+
+	mbox_msg_param_area = mbox_msg->param_area;
+
+	if (op_param) {
+		struct mbdb_op_param *cur_op_param = op_param;
+		u8 i;
+
+		for (i = 0; i < op_param_count; cur_op_param++, i++) {
+			io_write(mbox_msg_param_area, cur_op_param->data, cur_op_param->len);
+			mbox_msg_param_area += cur_op_param->len >> 3;
+		}
+	}
+
+	trace_iaf_mbx_exec(sd->fdev->pd->index, sd_index(sd),
+			   mbdb_mbox_op_code(*cw), mbdb_mbox_seq_no(*cw),
+			   mbdb_mbox_tid(*cw), *cw);
+
+	mbdb_outbox_release(sd);
+
+	if (ibox) {
+		ret = mbdb_ibox_wait(ibox);
+		if (!ret) {
+			if (ibox->rsp_status == MBOX_RSP_STATUS_RETRY) {
+				ret = ops_retry(sd, cw, op_param_count, op_param, ibox);
+			} else {
+				*cw = ibox->cw;
+				ret = ibox->rsp_status;
+			}
+		}
+
+		mbdb_ibox_release(ibox);
+	}
+
+	return ret;
+}
+
+/**
+ * ops_execute_nolock - Executes a mailbox operation with no locking
+ *
+ * @sd: subdevice to be actioned
+ * @cw: mailbox control word
+ * @op_param_count: count of parameters in op_param
+ * @op_param: array of parameters for the mailbox operation
+ * @ibox: when present, the response area for non-posted operations
+ *
+ * Return: Zero on success, Negative on resource error.
+ * Positive on mailbox response status indicating an error from the mailbox
+ *
+ * Note: The ibox is consumed when present
+ *
+ */
+int ops_execute_nolock(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+		       struct mbdb_op_param *op_param, struct mbdb_ibox *ibox)
+{
+	return ops_execute_exec(sd, cw, op_param_count, op_param, ibox);
+}
+
+/**
+ * ops_execute - Executes a mailbox operation obtaining a read lock
+ *
+ * @sd: subdevice to be actioned
+ * @cw: mailbox control word
+ * @op_param_count: count of parameters in op_param
+ * @op_param: array of parameters for the mailbox operation
+ * @ibox: when present, the response area for non-posted operations
+ *
+ * Return: Zero on success, Negative on resource error.
+ * Positive on mailbox response status indicating an error from the mailbox
+ *
+ * Note: The ibox is consumed when present
+ *
+ */
+int ops_execute(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+		struct mbdb_op_param *op_param, struct mbdb_ibox *ibox)
+{
+	int ret;
+
+	ret = down_read_killable(&sd->statedump.state_dump_mbdb_sem);
+	if (ret) {
+		mbdb_ibox_release_pre_wait(ibox);
+		return ret;
+	}
+
+	ret = ops_execute_exec(sd, cw, op_param_count, op_param, ibox);
+	up_read(&sd->statedump.state_dump_mbdb_sem);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/fabric/ops.h b/drivers/gpu/drm/xe/fabric/ops.h
new file mode 100644
index 0000000000000..6f705f3e9804e
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/ops.h
@@ -0,0 +1,525 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef OPS_H_INCLUDED
+#define OPS_H_INCLUDED
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/list.h>
+#include <linux/types.h>
+
+#include "iaf_drv.h"
+#include "mbdb.h"
+
+/* MBOX opcodes */
+/* Firmware Load and Generic CSR Access opcodes */
+#define MBOX_OP_CODE_FW_VERSION 0
+#define MBOX_OP_CODE_CSR_RAW_RD 1
+#define MBOX_OP_CODE_CSR_RAW_WR 2
+#define MBOX_OP_CODE_FW_START 3
+
+/* Configuration Required opcodes */
+#define MBOX_OP_CODE_WALLOC 4
+#define MBOX_OP_CODE_INI_TABLE_LOAD 6
+#define MBOX_OP_CODE_INI_LOADED_SET 7
+#define MBOX_OP_CODE_LINK_MGR_PORT_LINK_STATE_SET 9
+#define MBOX_OP_CODE_LINK_MGR_PORT_MAJOR_PHYSICAL_STATE_SET 10
+#define MBOX_OP_CODE_LINK_MGR_PORT_CSR_RD 11
+#define MBOX_OP_CODE_LINK_MGR_PORT_CSR_WR 12
+
+/* System Management Related opcodes */
+#define MBOX_OP_CODE_RESET 13
+#define MBOX_OP_CODE_QSFP_MGR_FAULT_TRAP_NOTIFICATION 22
+#define MBOX_OP_CODE_QSFP_MGR_FAULT_TRAP_ACKNOWLEDGE 23
+#define MBOX_OP_CODE_LINK_MGR_PORT_STATES_GET 29
+#define MBOX_OP_CODE_LINK_MGR_PORT_BEACON_SET 31
+#define MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ENABLE_SET 33
+#define MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_NOTIFICATION 34
+#define MBOX_OP_CODE_LINK_MGR_PORT_STATE_CHANGE_TRAP_ACKNOWLEDGE 35
+
+/* Fabric Discovery, Configuration and basic Monitoring  Related Opcodes */
+
+#define MBOX_OP_CODE_SWITCHINFO_GET 53
+#define MBOX_OP_CODE_SWITCHINFO_SET 54
+#define MBOX_OP_CODE_PORTINFO_GET 55
+#define MBOX_OP_CODE_RPIPE_GET 59
+#define MBOX_OP_CODE_RPIPE_SET 60
+
+/* trap related mbox messages relating to link health */
+
+#define MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ENABLE_SET 64
+#define MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_NOTIFICATION 65
+#define MBOX_OP_CODE_LINK_MGR_PORT_LWD_TRAP_ACKNOWLEDGE 66
+#define MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ENABLE_SET 68
+#define MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_NOTIFICATION 69
+#define MBOX_OP_CODE_LINK_MGR_PORT_LQI_TRAP_ACKNOWLEDGE 70
+#define MBOX_OP_CODE_PORT_STATUS_GET 80
+#define MBOX_OP_CODE_STATE_DUMP 81
+#define MBOX_OP_CODE_SERDES_HISTOGRAM_GET 82
+#define MBOX_OP_CODE_SERDES_EQINFO_GET 83
+#define MBOX_OP_CODE_SERDES_CHEST_GET 84
+
+#define MBOX_OP_CODE_VARIABLE_TABLE_READ 88
+#define MBOX_OP_CODE_VARIABLE_TABLE_WRITE 89
+
+/*  Firmware and System Related Debugging opcodes */
+
+#define MBOX_OP_CODE_LINK_MGR_TRACE_DUMP 85
+#define MBOX_OP_CODE_LINK_MGR_TRACE_MASK_GET 86
+#define MBOX_OP_CODE_LINK_MGR_TRACE_MASK_SET 87
+
+#define MBOX_OP_CODE_SERDES_TX_DCC_MARGIN 92
+
+// Sub-Ops for SerDes Tx Dcc Margin Op
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_MARGIN_PARAM_GET 0
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_MARGIN_PARAM_SET 1
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_GET 2
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INDEX_SET 3
+#define SERDES_MARGIN_SUB_OP_CODE_MAINT_MODE_GET 4
+#define SERDES_MARGIN_SUB_OP_CODE_MAINT_MODE_SET 5
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OVVL_GET 6
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OVVL_SET 7
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OV_EN_GET 8
+#define SERDES_MARGIN_SUB_OP_CODE_TX_DCC_INTERP_OV_EN_SET 9
+
+#define MBOX_OP_CODE_FAULT_TRAP 254
+
+#define MBOX_RSP_STATUS_OK            0
+#define MBOX_RSP_STATUS_SEQ_NO_ERROR  1
+#define MBOX_RSP_STATUS_OP_CODE_ERROR 2
+#define MBOX_RSP_STATUS_LOGICAL_ERROR 3
+#define MBOX_RSP_STATUS_RETRY         4
+#define MBOX_RSP_STATUS_DENIED        5 // access was denied
+
+// MBOX declarations
+#define MBDB_GP_DATA_U64_LOCATIONS 512
+#define MBOX_SIZE_IN_BYTES (MBDB_GP_DATA_U64_LOCATIONS * sizeof(u64) / 2)
+#define MBOX_SIZE_IN_QWORDS (MBDB_GP_DATA_U64_LOCATIONS / 2)
+#define MBOX_CW_FIELD_TYPE u64
+#define MBOX_CW_SIZE_IN_BYTES sizeof(MBOX_CW_FIELD_TYPE)
+#define MBOX_CW_SIZE_IN_QWORDS 1
+#define MBOX_PARAM_AREA_IN_BYTES (MBOX_SIZE_IN_BYTES - MBOX_CW_SIZE_IN_BYTES)
+#define MBOX_PARAM_AREA_IN_QWORDS (MBOX_SIZE_IN_QWORDS - MBOX_CW_SIZE_IN_QWORDS)
+#define MBOX_READ_DATA_SIZE_IN_BYTES MBOX_PARAM_AREA_IN_BYTES
+/* The first 8 bytes (u64) is the address where the data is to be written */
+#define MBOX_WRITE_DATA_SIZE_IN_BYTES (MBOX_PARAM_AREA_IN_BYTES - sizeof(u64))
+
+#define OP_CODE_POSTED         BIT_ULL(0)
+#define OP_CODE_CHECK_IS_VALID BIT_ULL(1)
+
+#define NON_POSTED          (0)
+#define NON_POSTED_CHECK_OP (OP_CODE_CHECK_IS_VALID)
+#define POSTED(p)           (p ? OP_CODE_POSTED : NON_POSTED)
+#define POSTED_CHECK_OP(p)  (OP_CODE_CHECK_IS_VALID | POSTED(p))
+
+struct mbox_msg {
+	u64 cw;
+	u64 param_area[MBOX_PARAM_AREA_IN_QWORDS];
+} __packed;
+
+struct mbdb_serdes_ch_est_req {
+	u32 port;
+	u32 lane;
+	u32 ilv;
+	u32 range_min;
+	u32 range_max;
+} __packed;
+
+struct mbdb_serdes_ch_est_rsp {
+	u16 elements;
+	s16 data[MBOX_PARAM_AREA_IN_BYTES / sizeof(s16)];
+} __packed;
+
+#define LANE_DATA_ELEMENTS 128
+
+struct mbdb_serdes_eq_info {
+	u32 eq_p4_rev;
+	u32 eq_p4_time;
+	u32 rxd_txd_p4_rev;
+	u32 rxd_txd_p4_time;
+	u8 eq_compile_options;
+	u8 agc_mode;
+	u8 agc1_lms_mu;
+	u8 agc1_peak_ncyc_exp;
+	u8 agc2_lms_mu;
+	u8 agc2_peak_ncyc_exp;
+	u8 agc_lpf_mu;
+	u8 agc_targ;
+	u8 agc1_lms_en;
+	u8 agc1_lms_ld;
+	u8 agc2_lms_en;
+	u8 agc2_lms_ld;
+	u8 agc1_lms_ld_val;
+	u8 agc1_ctl;
+	u8 agc1_peak;
+	u8 agc1_ppeak;
+	u8 agc2_lms_ld_val;
+	u8 agc2_ctl[4];
+	u8 agc2_peak[4];
+	u8 agc2_ppeak[4];
+	u8 cdr_prop_mu;
+	u8 cdr_intg_mu;
+	u8 cdr_flt_mu;
+	u8 cdr_pherr_scale;
+	u8 cdr_ss_en;
+	u8 cdr_flt_en;
+	u8 cdr_intg_en;
+	u8 cdr_phase;
+	s8 cdr_intg;
+	s16 cdr_ph_err_flt;
+	u64 cntr_ilv_excl_msk;
+	s32 pphm;
+	u8 cntr_sh;
+	u8 hcntr[5];
+	s16 cntr_ch_est[5];
+	u8 ffe_lms_mu;
+	u8 ffe_lms_lk_mu_delta;
+	u8 ffe_lms_lk_en;
+	u8 dfe_lms_mu;
+	s16 eq_targ[4];
+	s16 dfe_nthr[2];
+	s16 dfe_zthr[2];
+	s16 dfe_pthr[2];
+	s16 hffe[30];
+	s16 reserved1[30];
+	s32 gf0;
+	s16 hdfe;
+	u8 nrz_slice_en;
+	u8 rmt_tx_lane;
+	u16 lms_sum_err;
+	u16 lms_sum_err_shf;
+	u8 tx_fir_eh[4];
+	u8 tx_fir_eh_m1;
+	u8 pll_lol_cnt;
+	u16 pmon_ulvt_freq;
+} __packed;
+
+struct mbdb_serdes_eq_info_get_rsp {
+	struct mbdb_serdes_eq_info eq_info[LANES];
+} __packed;
+
+struct mbdb_serdes_histogram_data {
+	u16 data[LANE_DATA_ELEMENTS];
+} __packed;
+
+struct mbdb_serdes_histogram_rsp {
+	struct mbdb_serdes_histogram_data lane[LANES];
+} __packed;
+
+struct mbdb_statedump_rsp {
+	u64 descs[MBOX_PARAM_AREA_IN_QWORDS];
+	u16 desc_count;
+} __packed;
+
+struct mbdb_op_ini_table_load_req {
+	u32 header1;
+	u32 header2;
+	u32 address;
+	u32 crc;
+} __packed;
+
+struct mbdb_op_rpipe_get {
+	u32 port_number;
+	u16 start_index;
+	u16 num_entries;
+	u8 rpipe_data[];
+} __packed;
+
+struct mbdb_op_rpipe_set {
+	u32 port_mask;
+	u16 start_index;
+	u16 num_entries;
+	u8 rpipe_data[];
+} __packed;
+
+struct port_var_data {
+	u8 tx_tuning[LANES];
+} __packed;
+
+struct tx_dcc_margin_error_rsp {
+	u32 sub_op;
+} __packed;
+
+struct tx_dcc_margin_param_get_rsp {
+	u32 sub_op;
+	u16 value;
+} __packed;
+
+struct tx_dcc_interp_get_rsp {
+	u32 sub_op;
+	u32 dccp;
+	u32 dccnb;
+	u32 tx_interp2_ctl;
+	u32 tx_mux_delay_ctrl2;
+	u32 reverse_pd;
+} __packed;
+
+struct maint_mode_get_rsp {
+	u32 sub_op;
+	u32 mode;
+} __packed;
+
+struct tx_dcc_interp_override_get_rsp {
+	u32 sub_op;
+	u32 value;
+} __packed;
+
+struct tx_dcc_interp_override_enable_get_rsp {
+	u32 sub_op;
+	u32 enable;
+} __packed;
+
+#define QSFP_PAGE_SIZE (CINFO_PAGE_SIZE)
+
+#define MAX_TRACE_ENTRIES ((MBOX_READ_DATA_SIZE_IN_BYTES - sizeof(u64)) / sizeof(u64))
+
+struct mbdb_op_linkmgr_trace_dump_rsp {
+	u32 cnt;
+	u32 more;
+	u64 entries[MAX_TRACE_ENTRIES];
+} __packed;
+
+#define MAX_CSRS 254
+
+/**
+ * struct mbdb_op_csr_range - range of registers to read
+ * @offset: starting register offset
+ * @num_csrs: number of registers to read
+ */
+struct mbdb_op_csr_range {
+	u32 offset;
+	u32 num_csrs;
+} __packed;
+
+struct mbdb_op_port_status_get_rsp {
+	u64 cp_free_run_rtc;
+	u64 regs[];
+} __packed;
+
+/*
+ * Use this to declare an instance of mbdb_op_port_status_get_rsp sized to a given number
+ * of registers
+ */
+#define DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(_p, _n) \
+	union { \
+		struct mbdb_op_port_status_get_rsp _p; \
+		struct { \
+			u64 cp_free_run_rtc; \
+			u64 regs[_n]; \
+		} __packed; \
+	}
+
+struct mbdb_op_param {
+	size_t len;
+	const void *data;
+};
+
+struct mbdb_op_enable_param {
+	u32 enabled;
+};
+
+void ops_rsp_handler_relaxed(struct mbdb_ibox *ibox);
+void ops_rsp_handler_default(struct mbdb_ibox *ibox);
+
+void ops_element_copy(void __iomem *src, void *dst, size_t src_sz, size_t dst_sz, size_t elements);
+
+void ops_portinfo_rsp_handler(struct mbdb_ibox *ibox);
+
+static inline void mbdb_op_enable_param_set(struct mbdb_op_enable_param *param,
+					    bool enabled)
+{
+	/* encapsulate enable information for op data structures. */
+	param->enabled = enabled ? 1 : 0;
+}
+
+struct mbdb_ibox *
+mbdb_op_build_cw_and_acquire_ibox_set_hdlr(struct fsubdev *sd, const u8 op_code, size_t parm_len,
+					   void *response, u32 rsp_len, u64 *cw,
+					   unsigned long flags, op_response_handler op_rsp_handler)
+	__attribute__((nonnull(1, 6, 8)));
+
+struct mbdb_ibox *
+mbdb_op_build_cw_and_acquire_ibox(struct fsubdev *sd, const u8 op_code, size_t parm_len,
+				  void *response, u32 rsp_len, u64 *cw, unsigned long flags)
+	__attribute__((nonnull(1, 6)));
+
+int ops_tx_dcc_interp_override_enable_set(struct fsubdev *sd, u32 port, u32 lane, u32 enable,
+					  bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_tx_dcc_interp_override_enable_get(struct fsubdev *sd, u32 port, u32 lane,
+					  struct tx_dcc_interp_override_enable_get_rsp *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_tx_dcc_interp_override_set(struct fsubdev *sd, u32 port, u32 lane, u32 value, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_tx_dcc_interp_override_get(struct fsubdev *sd, u32 port, u32 lane,
+				   struct tx_dcc_interp_override_get_rsp *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_maint_mode_set(struct fsubdev *sd, u32 port, u32 mode, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_maint_mode_get(struct fsubdev *sd, u32 port, struct maint_mode_get_rsp *rsp)
+	__attribute__((nonnull(1, 3)));
+
+int ops_tx_dcc_index_set(struct fsubdev *sd, u32 port, u32 lane, u32 index, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_tx_dcc_interp_get(struct fsubdev *sd, u32 port, u32 lane, struct tx_dcc_interp_get_rsp *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_tx_dcc_margin_param_set(struct fsubdev *sd, u32 port, u16 value, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_tx_dcc_margin_param_get(struct fsubdev *sd, u32 port,
+				struct tx_dcc_margin_param_get_rsp *rsp)
+	__attribute__((nonnull(1, 3)));
+
+int ops_serdes_channel_estimate_get(struct fsubdev *sd, u32 port, u32 lane,
+				    struct mbdb_serdes_ch_est_rsp *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_port_var_table_write(struct fsubdev *sd, u32 port, u32 link_speed,
+			     struct port_var_data *data, bool posted)
+	__attribute__((nonnull(1, 4)));
+
+int ops_port_var_table_read(struct fsubdev *sd, u32 port, u32 link_speed, struct port_var_data *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_serdes_eqinfo_get(struct fsubdev *sd, u32 port, struct mbdb_serdes_eq_info_get_rsp *rsp)
+		__attribute__((nonnull(1, 3)));
+
+int ops_serdes_histogram_get(struct fsubdev *sd, u32 port, struct mbdb_serdes_histogram_rsp *rsp)
+	__attribute__((nonnull(1, 3)));
+
+int ops_statedump(struct fsubdev *sd, u32 offset, struct mbdb_statedump_rsp *rsp)
+	__attribute__((nonnull(1, 3)));
+
+int ops_port_status_get(struct fsubdev *sd, u32 port, u8 num_csr_ranges,
+			const struct mbdb_op_csr_range *csr_ranges,
+			struct mbdb_op_port_status_get_rsp *rsp)
+	__attribute__((nonnull(1, 4, 5)));
+
+int ops_linkmgr_port_lqi_trap_ack(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_port_lqi_trap_ena_set(struct fsubdev *sd, bool enabled,
+				      bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_port_lwd_trap_ack(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_port_lwd_trap_ena_set(struct fsubdev *sd, bool enabled,
+				      bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_rpipe_get(struct fsubdev *sd, struct mbdb_op_rpipe_get *req,
+		  struct mbdb_op_rpipe_get *rsp)
+	__attribute__((nonnull(1, 2, 3)));
+
+int ops_rpipe_set(struct fsubdev *sd, struct mbdb_op_rpipe_set *req,
+		  struct mbdb_op_rpipe_set *rsp, bool posted)
+	__attribute__((nonnull(1, 2)));
+
+int ops_portinfo_get(struct fsubdev *sd, u32 port_mask,
+		     struct mbdb_op_portinfo *rsp)
+	__attribute__((nonnull(1, 3)));
+
+int ops_switchinfo_set(struct fsubdev *sd, struct mbdb_op_switchinfo *req,
+		       struct mbdb_op_switchinfo *rsp, bool posted)
+	__attribute__((nonnull(1, 2)));
+
+int ops_switchinfo_get(struct fsubdev *sd, struct mbdb_op_switchinfo *rsp)
+	__attribute__((nonnull(1, 2)));
+
+int ops_linkmgr_psc_trap_ack(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_psc_trap_ena_set(struct fsubdev *sd, bool enabled, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_port_beacon_set(struct fsubdev *sd, u32 port, bool enabled)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_ps_get(struct fsubdev *sd, u32 port, u32 *result)
+	__attribute__((nonnull(1, 3)));
+
+int ops_qsfpmgr_fault_trap_ack(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_reset(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_linkmgr_port_csr_wr(struct fsubdev *sd, u32 lpn, u32 offset,
+			    const void *data, u16 len, bool posted)
+	__attribute__((nonnull(1, 4)));
+
+int ops_linkmgr_port_csr_rd(struct fsubdev *sd, u32 lpn, u32 offset, u16 len,
+			    u64 *result)
+	__attribute__((nonnull(1, 5)));
+
+int ops_linkmgr_port_maj_phystate_set(struct fsubdev *sd, u32 port,
+				      u32 new_state, u32 *result)
+	__attribute__((nonnull(1, 4)));
+
+int ops_linkmgr_port_link_state_set(struct fsubdev *sd, u32 port, u32 new_state,
+				    u32 *result)
+	__attribute__((nonnull(1, 4)));
+
+int ops_ini_loaded_set(struct fsubdev *sd, bool posted)
+	__attribute__((nonnull(1)));
+
+int ops_ini_table_load(struct fsubdev *sd,
+		       struct mbdb_op_ini_table_load_req *info, u32 *result)
+	__attribute__((nonnull(1, 2, 3)));
+
+int ops_walloc(struct fsubdev *sd, u16 dwords, u32 *addr)
+	__attribute__((nonnull(1, 3)));
+
+int ops_fw_start(struct fsubdev *sd)
+	__attribute__((nonnull(1)));
+
+int ops_csr_raw_write(struct fsubdev *sd, u32 addr, const void *data, u32 len,
+		      bool posted)
+	__attribute__((nonnull(1, 3)));
+
+int ops_csr_raw_read_nolock(struct fsubdev *sd, u32 addr, size_t read_len, void *data)
+	__attribute__((nonnull(1, 4)));
+
+int ops_csr_raw_read(struct fsubdev *sd, u32 addr, size_t read_len, void *data)
+	__attribute__((nonnull(1, 4)));
+
+int ops_fw_version(struct fsubdev *sd,
+		   struct mbdb_op_fw_version_rsp *fw_version)
+	__attribute__((nonnull(1, 2)));
+
+int ops_linkmgr_trace_dump(struct fsubdev *sd, u32 cnt, bool begin,
+			   struct mbdb_op_linkmgr_trace_dump_rsp *rsp)
+	__attribute__((nonnull(1, 4)));
+
+int ops_linkmgr_trace_mask_get(struct fsubdev *sd, u64 *mask)
+	__attribute__((nonnull(1, 2)));
+
+int ops_linkmgr_trace_mask_set(struct fsubdev *sd, u64 mask)
+	__attribute__((nonnull(1)));
+
+int ops_mem_posted_wr(struct fsubdev *sd, u32 addr, const u8 *data, u32 len)
+	__attribute__((nonnull(1)));
+
+int ops_execute_nolock(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+		       struct mbdb_op_param *op_param, struct mbdb_ibox *ibox)
+	__attribute__((nonnull(1, 2)));
+
+int ops_execute(struct fsubdev *sd, u64 *cw, u8 op_param_count,
+		struct mbdb_op_param *op_param, struct mbdb_ibox *ibox)
+	__attribute__((nonnull(1, 2)));
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/parallel.c b/drivers/gpu/drm/xe/fabric/parallel.c
new file mode 100644
index 0000000000000..88764bd454755
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/parallel.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/slab.h>
+
+#include "iaf_drv.h"
+#include "parallel.h"
+
+/**
+ * par_start - Initializes a parallel execution context.
+ * @group: group instance to operate on
+ */
+void par_start(struct par_group *group)
+{
+	/*
+	 * hold an additional ref to prevent work transitioning the ref to
+	 * zero while queueing is in progress
+	 */
+	atomic_set(&group->outstanding, 1);
+	init_completion(&group->done);
+}
+
+/**
+ * par_wait - Waits for all parallel execution tied to the context to complete.
+ * @group: group instance to operate on
+ */
+void par_wait(struct par_group *group)
+{
+	/*
+	 * remove the "queueing in progress" ref, and wait only if other refs
+	 * remain
+	 */
+	if (!atomic_dec_and_test(&group->outstanding))
+		wait_for_completion(&group->done);
+}
+
+/**
+ * struct par_work - The per-work-item execution context.
+ * @work: the kernel workqueue item
+ * @group: the parent parallel execution group
+ * @fn: the function to execute
+ * @fn_ctx: arbitrary context passed to the execution function
+ */
+struct par_work {
+	struct work_struct work;
+	struct par_group *group;
+	void (*fn)(void *ctx);
+	void *fn_ctx;
+};
+
+/**
+ * par_work_fn - The workqueue function which passes control to the user
+ * supplied execution function.
+ * @work: the kernel workqueue item associated with the work
+ */
+static void par_work_fn(struct work_struct *work)
+{
+	struct par_work *pw = container_of(work, struct par_work, work);
+
+	pw->fn(pw->fn_ctx);
+
+	if (atomic_dec_and_test(&pw->group->outstanding))
+		complete(&pw->group->done);
+
+	kfree(pw);
+}
+
+/**
+ * par_work_queue - Queues a new function to run in parallel.
+ * @group: the parallel execution group
+ * @fn: the function to execute
+ * @fn_ctx: the context to pass to the execution function
+ *
+ * Return: zero on success; negative errno otherwise.
+ */
+int par_work_queue(struct par_group *group,
+		   void (*fn)(void *), void *fn_ctx)
+{
+	struct par_work *pw;
+
+	pw = kmalloc(sizeof(*pw), GFP_KERNEL);
+	if (!pw)
+		return -ENOMEM;
+
+	INIT_WORK(&pw->work, par_work_fn);
+	pw->group = group;
+	pw->fn = fn;
+	pw->fn_ctx = fn_ctx;
+	atomic_inc(&group->outstanding);
+	queue_work(iaf_unbound_wq, &pw->work);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/fabric/parallel.h b/drivers/gpu/drm/xe/fabric/parallel.h
new file mode 100644
index 0000000000000..22d554b9f7ac4
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/parallel.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef PARALLEL_H_INCLUDED
+#define PARALLEL_H_INCLUDED
+
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct par_group - Parallel execution context for a group of functions that
+ * can be collectively waited on.
+ * @outstanding: the number of outstanding functions
+ * @done: signalled when all parallel work completes
+ *
+ * This schedules functions onto the system workqueue, and associates them with
+ * a shared context.  An API call is provided to wait on this group of
+ * functions for completion.
+ */
+struct par_group {
+	atomic_t outstanding;
+	struct completion done;
+};
+
+void par_start(struct par_group *ctx);
+void par_wait(struct par_group *ctx);
+int par_work_queue(struct par_group *ctx,
+		   void (*fn)(void *), void *fn_ctx);
+
+#endif /* PARALLEL_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/port.c b/drivers/gpu/drm/xe/fabric/port.c
new file mode 100644
index 0000000000000..f4a35ecef5a82
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/port.c
@@ -0,0 +1,1884 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/dcache.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/timekeeping.h>
+
+#include "debugfs.h"
+#include "fw.h"
+#include "port.h"
+#include "port_diag.h"
+#include "ops.h"
+#include "routing_debug.h"
+#include "routing_engine.h"
+#include "routing_event.h"
+#include "trace.h"
+
+/*
+ * Presence detection types used in &struct psc_presence_rule.method
+ */
+enum {
+	PRESENCE_RULE_DEFAULT = 0,
+	PRESENCE_RULE_LINK_CONTROL
+};
+
+/*
+ * Port initialization timeout
+ */
+static unsigned short linkup_timeout = 5 * 60;
+module_param(linkup_timeout, ushort, 0400);
+MODULE_PARM_DESC(linkup_timeout, "Seconds to wait for port link up (default: 5 minutes)");
+
+static void start_linkup_timer(struct fsubdev *sd, struct fport *p)
+{
+	mutex_lock(&sd->pm_work_lock);
+	if (sd->ok_to_schedule_pm_work)
+		mod_timer(&p->linkup_timer, jiffies + linkup_timeout * HZ);
+	/* else we are shutting down so don't time out linkup */
+	mutex_unlock(&sd->pm_work_lock);
+}
+
+s64 ms_elapsed_since_boot(void)
+{
+	return ktime_to_ms(ktime_get_boottime());
+}
+
+static const char *state_name(enum pm_port_state s)
+{
+	switch (s) {
+	case PM_PORT_STATE_INACTIVE:  return "INACTIVE";
+	case PM_PORT_STATE_REQUESTED: return "REQUESTED";
+	case PM_PORT_STATE_ISOLATED:  return "ISOLATED";
+	case PM_PORT_STATE_ARMED:     return "ARMED";
+	case PM_PORT_STATE_ACTIVE:    return "ACTIVE";
+	}
+
+	return "UNKNOWN";
+}
+
+const char *fw_log_state_name(u8 s)
+{
+	static const char * const names[] = { "NOP", "DOWN", "INIT", "ARMED",
+					      "ACTIVE" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "UNKNOWN";
+	else
+		return names[s];
+}
+
+#define UEVENT_DELAY (HZ)
+
+static bool param_reset = true;
+module_param_named(reset, param_reset, bool, 0600);
+MODULE_PARM_DESC(reset, "Disable to prevent resetting devices on shutdown (default: Y)");
+
+/**
+ * struct fsm_io - Port FSM I/O
+ * @deisolating: input - are we currently deisolating ports?
+ * @request_deisolation: output - should PM request all ports be deisolated?
+ * @routing_changed: output - should PM notify routing event manager?
+ * @status_changed: output - has an event potentially changed sd->port_status?
+ *
+ * I/O from FSM updates, used to exchange requests with update_ports_work().
+ * Before each FSM update, deisolating is set to indicate if a DEISOLATE_EVENT
+ * was requested and the outputs are set to false. The former indicates whether
+ * ports should be deisolated. The outputs are used to request followup
+ * actions.
+ */
+struct fsm_io {
+	bool deisolating;
+	bool request_deisolation;
+	bool routing_changed;
+	bool status_changed;
+};
+
+/*
+ * This wakes the PM thread
+ */
+int signal_pm_thread(struct fsubdev *sd, enum pm_trigger_reasons event)
+{
+	int err = 0;
+
+	set_bit(event, sd->pm_triggers);
+
+	mutex_lock(&sd->pm_work_lock);
+	if (sd->ok_to_schedule_pm_work)
+		queue_work(iaf_unbound_wq, &sd->pm_work); /* implies a full memory barrier */
+	else
+		err = -EAGAIN;
+	mutex_unlock(&sd->pm_work_lock);
+
+	return err;
+}
+
+/*
+ * number of isolated ports in the entire system
+ */
+static atomic_t isolated_port_cnt = ATOMIC_INIT(0);
+
+static void deisolate_all_ports(void)
+{
+	if (atomic_read(&isolated_port_cnt) > 0) {
+		struct fsubdev *sd;
+
+		list_for_each_entry(sd, &routable_list, routable_link)
+			signal_pm_thread(sd, DEISOLATE_EVENT); /* ignore (per-device) errors */
+	}
+}
+
+static bool port_manual_bringup;
+module_param(port_manual_bringup, bool, 0600);
+MODULE_PARM_DESC(port_manual_bringup,
+		 "Disable automatic port bringup (default: N)");
+
+/*
+ * These will be useful at least during early hardware validation.
+ */
+
+static bool port_enable_loopback = true;
+module_param_named(enable_loopback, port_enable_loopback, bool, 0400);
+MODULE_PARM_DESC(enable_loopback, "Enable loopback fabric configurations (default: Y)");
+
+/*
+ * Helpers to update port health
+ */
+
+static void set_health_off(struct fport_status *status)
+{
+	status->health = FPORT_HEALTH_OFF;
+	bitmap_zero(status->issues, NUM_FPORT_ISSUES);
+	bitmap_zero(status->errors, NUM_FPORT_ERRORS);
+}
+
+static void set_health_failed(struct fport_status *status, enum fport_error error_reason)
+{
+	if (status->health != FPORT_HEALTH_FAILED && status->health != FPORT_HEALTH_DEGRADED)
+		status->link_degrades++;
+	if (status->health != FPORT_HEALTH_FAILED)
+		status->link_failures++;
+	status->health = FPORT_HEALTH_FAILED;
+	bitmap_zero(status->issues, NUM_FPORT_ISSUES);
+	set_bit(error_reason, status->errors);
+}
+
+static void set_health_degraded(struct fport_status *status, enum fport_issue issue)
+{
+	if (status->health != FPORT_HEALTH_FAILED && status->health != FPORT_HEALTH_DEGRADED)
+		status->link_degrades++;
+	status->health = FPORT_HEALTH_DEGRADED;
+	set_bit(issue, status->issues);
+	bitmap_zero(status->errors, NUM_FPORT_ERRORS);
+}
+
+static void set_health_healthy(struct fport_status *status)
+{
+	status->health = FPORT_HEALTH_HEALTHY;
+	bitmap_zero(status->issues, NUM_FPORT_ISSUES);
+	bitmap_zero(status->errors, NUM_FPORT_ERRORS);
+}
+
+static void clear_status_linkup_detected(struct fport_status *status)
+{
+	status->linkup_since = 0;
+}
+
+static void clear_status_link_failures(struct fport_status *status)
+{
+	status->link_failures = 0;
+}
+
+static void clear_status_link_degrades(struct fport_status *status)
+{
+	status->link_degrades = 0;
+}
+
+/*
+ * Flapping period parameters
+ */
+
+static unsigned short link_flapping_leaky_bucket_period = 5 * 60;
+module_param(link_flapping_leaky_bucket_period, ushort, 0600);
+MODULE_PARM_DESC(link_flapping_leaky_bucket_period,
+		 "Seconds to auto-decrement link bounce count (default: 5 minutes, 0 disables)");
+
+static unsigned short link_flapping_threshold = 5;
+module_param(link_flapping_threshold, ushort, 0600);
+MODULE_PARM_DESC(link_flapping_threshold,
+		 "Bounce count to declare a link flapping (default: 5, 0 disables)");
+
+/**
+ * linkup_detected_now - get timestamp and perform timestamp-based checks when linkup is detected
+ * @sd: subdevice containing port
+ * @p: port being updated/checked
+ *
+ * Indicate that a linkup detected was just detected and maintain a leaky bucket counter of port
+ * bounces. Time is indicated as ms elapsed since boot. The leaky bucket models this behavior:
+ * - while the leaky bucket is active, the bounce count is decremented every bucket period
+ * - the leaky bucket becomes inactive one period after the bounce count reaches zero
+ * - if the leaky bucket is considered active now, the bounce count is incremented
+ * - if the leaky bucket is considered not active, it is started now
+ * - if the bounce count exceeds the flapping threshold, the port is declared flapping
+ * - once a port is flapping, an SMI enable operation is needed to clear its state
+ *
+ * No timer triggers these events, they are all computed here. Timestamp calculations are used to
+ * determine which events occurred and update the model. Note that the bucket end condition is
+ * defined such that if a port is flapping every flapping period, the leaky bucket will remain
+ * continuously active and the bounce count will remain 1 rather than bouncing between 0 and 1.
+ *
+ * Return: true if the port is OK, false if it is considered flapping
+ */
+static bool linkup_detected_now(struct fsubdev *sd, struct fport *p)
+{
+	s64 now = ms_elapsed_since_boot();
+	unsigned short flapping_threshold;
+	s64 flapping_period_ms;
+
+	sd->next_port_status[p->lpn].linkup_since = now;
+
+	kernel_param_lock(THIS_MODULE);
+	flapping_threshold = link_flapping_threshold;
+	/* s64 is much larger than (unsigned short) link_flapping_leaky_bucket_period */
+	flapping_period_ms = (s64)link_flapping_leaky_bucket_period * 1000;
+	kernel_param_unlock(THIS_MODULE);
+
+	/* we divide by flapping_period_ms later, so ensure the non-zero check remains */
+	if (!flapping_threshold || !flapping_period_ms)
+		return true;
+
+	if (test_bit(FPORT_ERROR_FLAPPING, sd->next_port_status[p->lpn].errors))
+		return false;
+
+	if (p->flap_check_since && now - p->flap_check_since >= flapping_period_ms) {
+		u64 periods_elapsed = (now - p->flap_check_since) / flapping_period_ms;
+
+		if (periods_elapsed > p->bounce_count) {
+			p->flap_check_since = 0;
+		} else {
+			p->flap_check_since += periods_elapsed * flapping_period_ms;
+			p->bounce_count -= periods_elapsed;
+		}
+	}
+
+	if (p->flap_check_since)
+		return ++p->bounce_count < flapping_threshold;
+
+	p->flap_check_since = now;
+	p->bounce_count = 0;
+
+	return true;
+}
+
+static void linkdown_detected(struct fsubdev *sd, struct fport *p)
+{
+	clear_status_linkup_detected(&sd->next_port_status[p->lpn]);
+}
+
+/*
+ * FSM Actions
+ */
+
+/* PM state and port health are related but there is not a direct mapping.
+ *
+ * Port health is as follows:
+ *
+ * FPORT_HEALTH_OFF: port disabled by PSC bin or SMI or in initial training
+ * FPORT_HEALTH_FAILED: port in error or went down (PSC trap)
+ * FPORT_HEALTH_DEGRADED: port ACTIVE but at reduced width/speed/quality (LWD/LQI trap)
+ * FPORT_HEALTH_HEALTHY: port ACTIVE at full width/speed/quality
+ *
+ * Thus when a port first comes up, it remains OFF until it becomes active at which point
+ * it becomes HEALTHY (or DEGRADED if RX/TX width is reduced or LQI < 4: later width/LQI
+ * changes can transition between HEALTHY/DEGRADED).
+ *
+ * Ports transition to FAILED when ISOLATED, timed out, in error, or if they go down
+ * for some reason and can be transitioned to/from OFF by port disable/enable requests.
+ * Ports may also be marked FAILED if they are flapping (disconnecting and reconnecting
+ * repeatedly).
+ */
+
+static void port_in_error(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	timer_delete(&p->linkup_timer);
+
+	if (p->state == PM_PORT_STATE_ISOLATED)
+		atomic_dec(&isolated_port_cnt);
+
+	clear_bit(PORT_CONTROL_ENABLED, p->controls);
+
+	p->state = PM_PORT_STATE_INACTIVE;
+	fio->routing_changed = true;
+
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_FAILED);
+	fio->status_changed = true;
+
+	state = IAF_FW_PORT_PHYS_DISABLED;
+
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, state, &op_err);
+
+	/* op_err should never be set when DISABLING */
+	if (err || op_err) {
+		fport_err(p, "failed mailbox error %d %u\n", err, op_err);
+	} else {
+		/* update local state to be consistent with op on success */
+		p->log_state = IAF_FW_PORT_DOWN;
+		p->phys_state = IAF_FW_PORT_PHYS_DISABLED;
+		linkdown_detected(sd, p);
+	}
+}
+
+static void port_disable(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	if (p->state == PM_PORT_STATE_ISOLATED)
+		atomic_dec(&isolated_port_cnt);
+
+	state = IAF_FW_PORT_PHYS_DISABLED;
+
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, state, &op_err);
+
+	/* op_err should never be set when DISABLING */
+	if (err || op_err)
+		goto failed;
+
+	/* update local state to be consistent with op on success */
+	p->log_state = IAF_FW_PORT_DOWN;
+	p->phys_state = IAF_FW_PORT_PHYS_DISABLED;
+	linkdown_detected(sd, p);
+
+	p->state = PM_PORT_STATE_INACTIVE;
+	fio->routing_changed = true;
+
+	set_health_off(&sd->next_port_status[p->lpn]);
+	fio->status_changed = true;
+
+	fport_dbg(p, "port disabled\n");
+	return;
+
+failed:
+	fport_err(p, "disable request failed\n");
+	port_in_error(sd, p, fio);
+}
+
+static void port_enable_polling(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	int err;
+
+	if (sd->next_port_status[p->lpn].health == FPORT_HEALTH_FAILED) {
+		err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, IAF_FW_PORT_PHYS_DISABLED,
+							&op_err);
+
+		/* op_err should never be set when DISABLING */
+		if (err || op_err)
+			goto failed;
+
+		set_health_off(&sd->next_port_status[p->lpn]);
+		fio->status_changed = true;
+	}
+
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, IAF_FW_PORT_PHYS_POLLING, &op_err);
+
+	if (err)
+		goto failed;
+
+	if (op_err) {
+		u32 state = 0;
+
+		/*
+		 * op_err could be set if port is somehow already enabled and not OFFLINE -- bounce
+		 * the port and give it one more try
+		 */
+		fport_warn(p, "bouncing port since POLL request failed\n");
+
+		err = ops_linkmgr_ps_get(sd, p->lpn, &state);
+		if (err)
+			goto failed;
+
+		switch (FIELD_GET(PS_PPS_PHYSICAL_STATE, state)) {
+		case IAF_FW_PORT_PHYS_POLLING:
+		case IAF_FW_PORT_PHYS_TRAINING:
+		case IAF_FW_PORT_PHYS_LINKUP:
+		case IAF_FW_PORT_PHYS_LINK_ERROR_RECOVERY:
+		case IAF_FW_PORT_PHYS_OFFLINE:
+			/* recoverable PHY state during error recovery */
+			err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn,
+								IAF_FW_PORT_PHYS_DISABLED, &op_err);
+
+			/* op_err should never be set when DISABLING */
+			if (err || op_err)
+				goto failed;
+			break;
+
+		case IAF_FW_PORT_PHYS_DISABLED:
+			/* already down, should be able to bring port up now */
+			break;
+
+		case IAF_FW_PORT_PHYS_TEST:
+		default:
+			/* ports should not be able to get here on their own */
+			goto failed;
+		}
+
+		set_health_off(&sd->next_port_status[p->lpn]);
+		fio->status_changed = true;
+
+		err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, IAF_FW_PORT_PHYS_POLLING,
+							&op_err);
+
+		/* op_err should not be set now since the port should be disabled */
+		if (err || op_err)
+			goto failed;
+	}
+
+	/* update local state to be consistent with op on success */
+	p->log_state = IAF_FW_PORT_DOWN;
+	p->phys_state = IAF_FW_PORT_PHYS_POLLING;
+	linkdown_detected(sd, p);
+
+	p->state = PM_PORT_STATE_REQUESTED;
+	start_linkup_timer(sd, p);
+	fio->request_deisolation = true;
+
+	fport_dbg(p, "polling enabled\n");
+	return;
+
+failed:
+	fport_err(p, "polling request failed, error %d, op_err %d\n", err, op_err);
+	port_in_error(sd, p, fio);
+}
+
+static void port_isolate(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	bool loopback;
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	state = IAF_FW_PORT_PHYS_DISABLED;
+
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, state, &op_err);
+
+	/* op_err should never be set when DISABLING */
+	if (err || op_err)
+		goto failed;
+
+	/* update local state to be consistent with op on success */
+	p->log_state = IAF_FW_PORT_DOWN;
+	p->phys_state = IAF_FW_PORT_PHYS_DISABLED;
+	linkdown_detected(sd, p);
+
+	p->state = PM_PORT_STATE_ISOLATED;
+
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_ISOLATED);
+	fio->status_changed = true;
+
+	atomic_inc(&isolated_port_cnt);
+
+	loopback = test_bit(FPORT_ERROR_LOOPBACK, sd->next_port_status[p->lpn].errors);
+
+	if (is_fport_registered(p))
+		fport_warn(p, "isolated: neighbor 0x%016llx port %u%s\n",
+			   p->portinfo->neighbor_guid,
+			   p->portinfo->neighbor_port_number,
+			   loopback ? " (loopback)" : "");
+	else
+		fport_dbg(p, "isolated: neighbor 0x%016llx port %u%s\n",
+			  p->portinfo->neighbor_guid,
+			  p->portinfo->neighbor_port_number,
+			  loopback ? " (loopback)" : "");
+
+	return;
+
+failed:
+	fport_err(p, "isolate request failed\n");
+	port_in_error(sd, p, fio);
+}
+
+static void port_deisolate(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	int err;
+
+	atomic_dec(&isolated_port_cnt);
+
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, IAF_FW_PORT_PHYS_POLLING, &op_err);
+
+	if (err)
+		goto failed;
+
+	if (op_err) {
+		u32 state = 0;
+
+		/*
+		 * op_err could be set if port is somehow already enabled and not OFFLINE -- bounce
+		 * the port and give it one more try
+		 */
+		fport_warn(p, "bouncing port since POLL request failed\n");
+
+		err = ops_linkmgr_ps_get(sd, p->lpn, &state);
+		if (err)
+			goto failed;
+
+		switch (FIELD_GET(PS_PPS_PHYSICAL_STATE, state)) {
+		case IAF_FW_PORT_PHYS_POLLING:
+		case IAF_FW_PORT_PHYS_TRAINING:
+		case IAF_FW_PORT_PHYS_LINKUP:
+		case IAF_FW_PORT_PHYS_LINK_ERROR_RECOVERY:
+		case IAF_FW_PORT_PHYS_OFFLINE:
+			/* recoverable PHY state during error recovery */
+			err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn,
+								IAF_FW_PORT_PHYS_DISABLED, &op_err);
+
+			/* op_err should never be set when DISABLING */
+			if (err || op_err)
+				goto failed;
+			break;
+
+		case IAF_FW_PORT_PHYS_DISABLED:
+			/* already down, should be able to bring port up now */
+			break;
+
+		case IAF_FW_PORT_PHYS_TEST:
+		default:
+			/* ports should not be able to get here on their own */
+			goto failed;
+		}
+
+		set_health_off(&sd->next_port_status[p->lpn]);
+		fio->status_changed = true;
+
+		err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, IAF_FW_PORT_PHYS_POLLING,
+							&op_err);
+
+		/* op_err should not be set now since the port should be disabled */
+		if (err || op_err)
+			goto failed;
+	}
+
+	/* update local state to be consistent with op on success */
+	p->log_state = IAF_FW_PORT_DOWN;
+	p->phys_state = IAF_FW_PORT_PHYS_POLLING;
+	linkdown_detected(sd, p);
+
+	p->state = PM_PORT_STATE_REQUESTED;
+	start_linkup_timer(sd, p);
+	fio->status_changed = true;
+	fport_dbg(p, "deisolated, polling enabled\n");
+	return;
+
+failed:
+	fport_err(p, "deisolate request failed, error %d, op_err %d\n", err, op_err);
+	port_in_error(sd, p, fio);
+}
+
+static void port_did_not_train(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_DID_NOT_TRAIN);
+	fio->status_changed = true;
+	if (is_fport_registered(p))
+		fport_warn(p, "port failed to train in %u seconds\n", linkup_timeout);
+	else
+		fport_dbg(p, "port failed to train in %u seconds\n", linkup_timeout);
+}
+
+static void port_linkup_timedout(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (test_bit(FPORT_ERROR_ISOLATED, sd->next_port_status[p->lpn].errors))
+		port_isolate(sd, p, fio);
+	else
+		port_did_not_train(sd, p, fio);
+}
+
+static bool lqi_ok(u8 lqi)
+{
+	return lqi >= LQI_HEALTHY_THRESHOLD;
+}
+
+static void set_active_health(struct fsubdev *sd, struct fport *p)
+{
+	struct fport_status *status = &sd->next_port_status[p->lpn];
+	struct portinfo *pi = p->portinfo;
+	u8 oldr_nn_lqi = pi->oldr_nn_lqi;
+
+	set_health_healthy(status);
+
+	if (!lqi_ok(FIELD_GET(OLDR_NN_LQI_LINK_QUALITY_INDICATOR, oldr_nn_lqi)))
+		set_health_degraded(status, FPORT_ISSUE_LQI);
+
+	if (fls(pi->link_width_enabled) > fls(pi->link_width_active) ||
+	    pi->link_width_downgrade_rx_active != pi->link_width_active ||
+	    pi->link_width_downgrade_tx_active != pi->link_width_active)
+		set_health_degraded(status, FPORT_ISSUE_LWD);
+
+	if (fls(pi->link_speed_enabled) > fls(pi->link_speed_active))
+		set_health_degraded(status, FPORT_ISSUE_RATE);
+}
+
+static void port_activate(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	state = IAF_FW_PORT_ACTIVE;
+
+	err = ops_linkmgr_port_link_state_set(sd, p->lpn, state, &op_err);
+
+	if (err)
+		goto failed;
+
+	if (op_err) {
+		/*
+		 * op_err could be set if link state is not ARMED (e.g., if it just bounced)
+		 */
+		fport_dbg(p, "querying port since ACTIVATE request failed\n");
+
+		err = ops_linkmgr_ps_get(sd, p->lpn, &state);
+
+		if (err)
+			goto failed;
+
+		switch (FIELD_GET(PS_PPS_PHYSICAL_STATE, state)) {
+		case IAF_FW_PORT_PHYS_POLLING:
+		case IAF_FW_PORT_PHYS_TRAINING:
+		case IAF_FW_PORT_PHYS_LINKUP:
+		case IAF_FW_PORT_PHYS_LINK_ERROR_RECOVERY:
+		case IAF_FW_PORT_PHYS_OFFLINE:
+			/* possible PHY state during error recovery */
+			break;
+
+		case IAF_FW_PORT_PHYS_DISABLED:
+		case IAF_FW_PORT_PHYS_TEST:
+		default:
+			/* ports should not be able to get here on their own */
+			goto failed;
+		}
+
+		switch (FIELD_GET(PS_PPS_PORT_STATE, state)) {
+		case IAF_FW_PORT_DOWN:
+		case IAF_FW_PORT_INIT:
+			/* port bounced, notify the port manager */
+			signal_pm_thread(sd, RESCAN_EVENT);
+			return;
+
+		case IAF_FW_PORT_ACTIVE:
+			/* port already activated */
+			break;
+
+		case IAF_FW_PORT_ARMED:
+		default:
+			/* wrongly rejected and/or in unknown state */
+			goto failed;
+		}
+	}
+
+	p->state = PM_PORT_STATE_ACTIVE;
+
+	set_active_health(sd, p);
+
+	fio->status_changed = true;
+	fio->routing_changed = true;
+
+	fport_dbg(p, "ACTIVE\n");
+
+	return;
+
+failed:
+	fport_err(p, "activate request failed\n");
+	port_in_error(sd, p, fio);
+}
+
+enum neighbor_result {
+	NEIGHBOR_VALID,
+	NEIGHBOR_INVALID,
+	NEIGHBOR_LOOP_DISALLOWED,
+};
+
+/**
+ * valid_neighbor() - Is this connection to a valid neighbor?
+ * @sd: subdevice being checked
+ * @p: port being checked
+ *
+ * Indicates whether the connection is to a valid neighbor. To be a valid
+ * neighbor, the neighbor GUID must correspond to a known device. If it is a
+ * loopback (connected to same device), then whether it is valid is controlled
+ * by the enable_loopback module parameter.
+ *
+ * return: true if this is a valid neighbor, false if it should be isolated
+ */
+static enum neighbor_result valid_neighbor(struct fsubdev *sd, struct fport *p)
+{
+	struct fdev *neighbor_dev;
+
+	/* due to init races, we don't enforce isolation in preload mode */
+	if (sd->fdev->startup_mode == STARTUP_MODE_PRELOAD)
+		return NEIGHBOR_VALID;
+
+	neighbor_dev = fdev_find_by_sd_guid(p->portinfo->neighbor_guid);
+
+	if (!neighbor_dev)
+		return NEIGHBOR_INVALID;
+
+	/*
+	 * It's safe to decrement neighbor_dev's reference count immediately
+	 * since we're only testing whether it's our own device pointer
+	 */
+	fdev_put(neighbor_dev);
+
+	if (neighbor_dev != sd->fdev)
+		return NEIGHBOR_VALID;
+
+	return port_enable_loopback ? NEIGHBOR_VALID : NEIGHBOR_LOOP_DISALLOWED;
+}
+
+static void port_arm(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	state = IAF_FW_PORT_ARMED;
+
+	err = ops_linkmgr_port_link_state_set(sd, p->lpn, state, &op_err);
+
+	if (err)
+		goto failed;
+
+	if (op_err) {
+		/*
+		 * op_err could be set if link state is not INIT (e.g., if it just bounced)
+		 */
+		fport_dbg(p, "querying port since ARM request failed\n");
+
+		err = ops_linkmgr_ps_get(sd, p->lpn, &state);
+
+		if (err)
+			goto failed;
+
+		switch (FIELD_GET(PS_PPS_PHYSICAL_STATE, state)) {
+		case IAF_FW_PORT_PHYS_POLLING:
+		case IAF_FW_PORT_PHYS_TRAINING:
+		case IAF_FW_PORT_PHYS_LINKUP:
+		case IAF_FW_PORT_PHYS_LINK_ERROR_RECOVERY:
+		case IAF_FW_PORT_PHYS_OFFLINE:
+			/* possible PHY state during error recovery */
+			break;
+
+		case IAF_FW_PORT_PHYS_DISABLED:
+		case IAF_FW_PORT_PHYS_TEST:
+		default:
+			/* ports should not be able to get here on their own */
+			goto failed;
+		}
+
+		if (FIELD_GET(PS_PPS_PORT_STATE, state) != IAF_FW_PORT_ARMED) {
+			/* port bounced or already activated, notify the port manager */
+			signal_pm_thread(sd, RESCAN_EVENT);
+			return;
+		}
+	}
+
+	if (sd->next_port_status[p->lpn].health == FPORT_HEALTH_FAILED) {
+		set_health_off(&sd->next_port_status[p->lpn]);
+		fio->status_changed = true;
+	}
+
+	p->state = PM_PORT_STATE_ARMED;
+
+	if (FIELD_GET(OLDR_NN_LQI_NEIGHBOR_NORMAL, p->portinfo->oldr_nn_lqi))
+		port_activate(sd, p, fio);
+
+	return;
+
+failed:
+	fport_err(p, "arm request failed\n");
+	port_in_error(sd, p, fio);
+}
+
+static void port_arm_or_isolate(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	timer_delete(&p->linkup_timer);
+
+	switch (valid_neighbor(sd, p)) {
+	case NEIGHBOR_VALID:
+		port_arm(sd, p, fio);
+		break;
+	case NEIGHBOR_INVALID:
+		port_isolate(sd, p, fio);
+		break;
+	case NEIGHBOR_LOOP_DISALLOWED:
+		set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_LOOPBACK);
+		port_isolate(sd, p, fio);
+		break;
+	}
+}
+
+static void port_retry(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	/* downed port. retry by re-init and re-arm */
+	if (is_fport_registered(p))
+		fport_warn(p, "link went down, attempting to reconnect\n");
+	else
+		fport_dbg(p, "link went down, attempting to reconnect\n");
+
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_LINK_DOWN);
+	fio->status_changed = true;
+
+	p->state = PM_PORT_STATE_REQUESTED;
+	start_linkup_timer(sd, p);
+}
+
+static void port_rearm(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	/* port reverted to INIT. retry by re-arm */
+	if (is_fport_registered(p))
+		fport_warn(p, "link reinitialized itself, attempting to reconnect\n");
+	else
+		fport_dbg(p, "link reinitialized itself, attempting to reconnect\n");
+
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_LINK_DOWN);
+	fio->status_changed = true;
+
+	port_arm(sd, p, fio);
+}
+
+static void port_retry_active(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (is_fport_registered(p))
+		fport_warn(p, "active link went down...\n");
+	else
+		fport_dbg(p, "active link went down...\n");
+
+	port_retry(sd, p, fio);
+	fio->routing_changed = true;
+}
+
+static void port_rearm_active(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (is_fport_registered(p))
+		fport_warn(p, "active link reinitialized itself...\n");
+	else
+		fport_dbg(p, "active link reinitialized itself...\n");
+
+	port_rearm(sd, p, fio);
+	fio->routing_changed = true;
+}
+
+static void port_flapping(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u32 op_err = 0;
+	u32 state;
+	int err;
+
+	timer_delete(&p->linkup_timer);
+
+	set_health_failed(&sd->next_port_status[p->lpn], FPORT_ERROR_FLAPPING);
+
+	clear_bit(PORT_CONTROL_ENABLED, p->controls);
+
+	state = IAF_FW_PORT_PHYS_DISABLED;
+	err = ops_linkmgr_port_maj_phystate_set(sd, p->lpn, state, &op_err);
+
+	/* op_err should never be set when DISABLING */
+	if (err || op_err)
+		goto failed;
+
+	/* update local state to be consistent with op on success */
+	p->log_state = IAF_FW_PORT_DOWN;
+	p->phys_state = IAF_FW_PORT_PHYS_DISABLED;
+	linkdown_detected(sd, p);
+
+	p->state = PM_PORT_STATE_INACTIVE;
+	fio->routing_changed = true;
+	fio->status_changed = true;
+
+	fport_warn(p, "flapping port disabled\n");
+	return;
+
+failed:
+	fport_err(p, "flapping disable request failed\n");
+	port_in_error(sd, p, fio);
+}
+
+/*
+ * FSM States
+ */
+
+static void fsm_INACTIVE(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (test_bit(PORT_CONTROL_ENABLED, p->controls))
+		port_enable_polling(sd, p, fio);
+}
+
+static void fsm_REQUESTED(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (!test_bit(PORT_CONTROL_ENABLED, p->controls)) {
+		port_disable(sd, p, fio);
+		return;
+	}
+
+	switch (p->log_state) {
+	case IAF_FW_PORT_DOWN:
+		linkdown_detected(sd, p);
+		if (!timer_pending(&p->linkup_timer))
+			port_linkup_timedout(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_INIT:
+		if (linkup_detected_now(sd, p))
+			port_arm_or_isolate(sd, p, fio);
+		else
+			port_flapping(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_ARMED:
+	case IAF_FW_PORT_ACTIVE:
+	default:
+		fport_err(p, "unexpected FW startup state %s\n",
+			  fw_log_state_name(p->log_state));
+		port_in_error(sd, p, fio);
+		indicate_subdevice_error(sd, SD_ERROR_FW);
+		break;
+	}
+}
+
+static void fsm_ISOLATED(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (!test_bit(PORT_CONTROL_ENABLED, p->controls)) {
+		port_disable(sd, p, fio);
+		return;
+	}
+
+	if (fio->deisolating)
+		port_deisolate(sd, p, fio);
+}
+
+static void fsm_ARMED(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	u8 oldr_nn_lqi = p->portinfo->oldr_nn_lqi;
+
+	if (!test_bit(PORT_CONTROL_ENABLED, p->controls)) {
+		port_disable(sd, p, fio);
+		return;
+	}
+
+	switch (p->log_state) {
+	case IAF_FW_PORT_DOWN:
+		linkdown_detected(sd, p);
+		port_retry(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_INIT:
+		if (linkup_detected_now(sd, p))
+			port_rearm(sd, p, fio);
+		else
+			port_flapping(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_ARMED:
+	case IAF_FW_PORT_ACTIVE:
+	default:
+		if (FIELD_GET(OLDR_NN_LQI_NEIGHBOR_NORMAL, oldr_nn_lqi))
+			port_activate(sd, p, fio);
+		break;
+	}
+}
+
+static void fsm_ACTIVE(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	if (!test_bit(PORT_CONTROL_ENABLED, p->controls)) {
+		port_disable(sd, p, fio);
+		return;
+	}
+
+	switch (p->log_state) {
+	case IAF_FW_PORT_DOWN:
+		linkdown_detected(sd, p);
+		port_retry_active(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_INIT:
+		if (linkup_detected_now(sd, p))
+			port_rearm_active(sd, p, fio);
+		else
+			port_flapping(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_ARMED:
+	case IAF_FW_PORT_ACTIVE:
+	default:
+		set_active_health(sd, p);
+
+		fio->status_changed = true;
+		break;
+	}
+}
+
+/*
+ * FSM driver function
+ */
+
+static void kick_fsms(struct fsubdev *sd, struct fsm_io *fio)
+{
+	struct fport *p;
+	u8 lpn;
+
+	for_each_fabric_port(p, lpn, sd) {
+		fport_dbg(p, "state: %s\n", state_name(p->state));
+		switch (p->state) {
+		case PM_PORT_STATE_INACTIVE:
+			fsm_INACTIVE(sd, p, fio);
+			break;
+
+		case PM_PORT_STATE_REQUESTED:
+			fsm_REQUESTED(sd, p, fio);
+			break;
+
+		case PM_PORT_STATE_ISOLATED:
+			fsm_ISOLATED(sd, p, fio);
+			break;
+
+		case PM_PORT_STATE_ARMED:
+			fsm_ARMED(sd, p, fio);
+			break;
+
+		case PM_PORT_STATE_ACTIVE:
+			fsm_ACTIVE(sd, p, fio);
+			break;
+
+		default:
+			port_in_error(sd, p, fio);
+			break;
+		}
+		fport_dbg(p, "new state: %s\n", state_name(p->state));
+	}
+}
+
+/*
+ * Module service functions
+ */
+
+static int read_portinfo(struct fsubdev *sd)
+{
+	u32 port_mask;
+
+	/* Fetch all ports including CPORT */
+	port_mask = ~(~0UL << sd->extended_port_cnt);
+
+	return ops_portinfo_get(sd, port_mask, &sd->portinfo_op);
+}
+
+static void publish_status_updates(struct fsubdev *sd)
+{
+	struct fport_status *old_unpublished = sd->next_port_status;
+	struct fport_status *new_unpublished;
+	u8 lpn;
+
+	/* Swap published state pointer */
+	sd->next_port_status = rcu_replace_pointer(sd->port_status,
+						   sd->next_port_status, true);
+	synchronize_rcu();
+
+	/* copy new unpublished data */
+	new_unpublished = sd->next_port_status;
+
+	for_each_fabric_lpn(lpn, sd)
+		new_unpublished[lpn] = old_unpublished[lpn];
+
+	sd_dbg(sd, "Port status change published");
+}
+
+static void handle_rescan_work(struct work_struct *work)
+{
+	struct fsubdev *sd = container_of(work, struct fsubdev, rescan_work);
+
+	signal_pm_thread(sd, RESCAN_EVENT);
+}
+
+static void issue_sub_device_trap_count_work(struct work_struct *work)
+{
+	struct fsubdev *sd = container_of(to_delayed_work(work), struct fsubdev, ue_work);
+	static char *type_msg = "TYPE=PORT_CHANGE";
+	char fabric_id_msg[21];
+	char sd_index_msg[13];
+	u64 psc_trap_count = atomic64_read(&sd->psc_trap_count);
+	u64 lwd_trap_count = atomic64_read(&sd->lwd_trap_count);
+	u64 lqi_trap_count = atomic64_read(&sd->lqi_trap_count);
+	u64 qsfp_fault_trap_count = atomic64_read(&sd->qsfp_fault_trap_count);
+	u64 qsfp_present_trap_count = atomic64_read(&sd->qsfp_present_trap_count);
+	char trap_count_msg[32];
+	char psc_trap_count_msg[36];
+	char lwd_trap_count_msg[36];
+	char lqi_trap_count_msg[36];
+	char qsfp_fault_trap_count_msg[43];
+	char qsfp_present_trap_count_msg[45];
+	char *envp[10] = { type_msg, fabric_id_msg, sd_index_msg, trap_count_msg,
+			   psc_trap_count_msg, lwd_trap_count_msg, lqi_trap_count_msg,
+			   qsfp_fault_trap_count_msg, qsfp_present_trap_count_msg, NULL, };
+
+	snprintf(fabric_id_msg, sizeof(fabric_id_msg), "FABRIC_ID=0x%x", sd->fdev->fabric_id);
+	snprintf(sd_index_msg, sizeof(sd_index_msg), "SD_INDEX=%u", sd_index(sd));
+	snprintf(trap_count_msg, sizeof(trap_count_msg), "TRAP_COUNT=%llu",
+		 psc_trap_count + lwd_trap_count + lqi_trap_count +
+		 qsfp_fault_trap_count + qsfp_present_trap_count);
+	snprintf(psc_trap_count_msg, sizeof(psc_trap_count_msg),
+		 "PSC_TRAP_COUNT=%llu", psc_trap_count);
+	snprintf(lwd_trap_count_msg, sizeof(lwd_trap_count_msg),
+		 "LWD_TRAP_COUNT=%llu", lwd_trap_count);
+	snprintf(lqi_trap_count_msg, sizeof(lqi_trap_count_msg),
+		 "LQI_TRAP_COUNT=%llu", lqi_trap_count);
+	snprintf(qsfp_fault_trap_count_msg, sizeof(qsfp_fault_trap_count_msg),
+		 "QSFP_FAULT_TRAP_COUNT=%llu", qsfp_fault_trap_count);
+	snprintf(qsfp_present_trap_count_msg, sizeof(qsfp_present_trap_count_msg),
+		 "QSFP_PRESENT_TRAP_COUNT=%llu", qsfp_present_trap_count);
+
+	kobject_uevent_env(&sd->fdev->pdev->dev.kobj, KOBJ_CHANGE, envp);
+}
+
+static void detect_preload_state(struct fsubdev *sd, struct fport *p, struct fsm_io *fio)
+{
+	switch (p->log_state) {
+	case IAF_FW_PORT_DOWN:
+		fport_info(p, "preload: DOWN\n");
+		if (p->phys_state == IAF_FW_PORT_PHYS_DISABLED) {
+			p->state = PM_PORT_STATE_INACTIVE;
+		} else {
+			p->state = PM_PORT_STATE_REQUESTED;
+			start_linkup_timer(sd, p);
+		}
+		break;
+
+	case IAF_FW_PORT_INIT:
+		fport_info(p, "preload: INIT\n");
+		p->state = PM_PORT_STATE_REQUESTED;
+		linkup_detected_now(sd, p);
+		port_arm(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_ARMED:
+		fport_info(p, "preload: ARMED\n");
+		p->state = PM_PORT_STATE_ARMED;
+		linkup_detected_now(sd, p);
+		port_activate(sd, p, fio);
+		break;
+
+	case IAF_FW_PORT_ACTIVE:
+		fport_info(p, "preload: ACTIVE\n");
+		p->state = PM_PORT_STATE_ACTIVE;
+		set_active_health(sd, p);
+		linkup_detected_now(sd, p);
+
+		fio->status_changed = true;
+		fio->routing_changed = true;
+		break;
+
+	default:
+		fport_err(p, "unexpected FW preload state: log %s phys %u\n",
+			  fw_log_state_name(p->log_state), p->phys_state);
+		indicate_subdevice_error(sd, SD_ERROR_FW);
+		break;
+	}
+
+	/* even if port_manual_bringup, default to enabled if it was preloaded as such */
+	if (p->state != PM_PORT_STATE_INACTIVE)
+		set_bit(PORT_CONTROL_ENABLED, p->controls);
+}
+
+static void check_init_state(struct fsubdev *sd, struct fport *p, bool initializing)
+{
+	if (initializing && p->log_state != IAF_FW_PORT_DOWN) {
+		fport_err(p, "unexpected FW initial state %s\n",
+			  fw_log_state_name(p->log_state));
+		indicate_subdevice_error(sd, SD_ERROR_FW);
+	}
+}
+
+/* Main PM thread runs on WQ, max of one running and one queued at a time */
+static void update_ports_work(struct work_struct *work)
+{
+	struct fsubdev *sd = container_of(work, struct fsubdev, pm_work);
+	bool initializing = false;
+	bool port_change = false;
+	bool qsfp_change = false;
+	bool rescanning = false;
+	struct fsm_io fio;
+	struct fport *p;
+	int err;
+	u8 lpn;
+	u8 pspps;
+
+	/* PM should never be running against a debug device */
+	if (WARN_ON(dev_is_runtime_debug(sd->fdev)))
+		return;
+
+	/* FSM-affecting/affected state */
+	fio.deisolating = false;
+	fio.request_deisolation = false;
+	fio.routing_changed = false;
+	fio.status_changed = false;
+
+	/* lock may take a while to acquire if routing is running */
+	down_read(&routable_lock); /* shared lock */
+
+	/*
+	 * Note that it is possible that update_ports could be queued again
+	 * while it was waiting to get the lock. If so it will rerun and
+	 * discover that nothing has changed.
+	 *
+	 * In that case, we could skip the kick_fsms() call since they
+	 * shouldn't have any effect.
+	 *
+	 * Also, the odds of that happening could have been greatly reduced by
+	 * calling cancel_work() here, though that function was removed from
+	 * kernel 4.16 when (according to the commit msg) it was discovered by
+	 * accident that it wasn't being used. It might be worth investigating
+	 * alternatives in the future, since the underlying support functions
+	 * appear to still support it.
+	 */
+
+	if (test_and_clear_bit(INIT_EVENT, sd->pm_triggers)) {
+		initializing = true;
+		port_change = true; /* might have missed PSC trap */
+		qsfp_change = true;
+	}
+
+	if (test_and_clear_bit(DEISOLATE_EVENT, sd->pm_triggers)) {
+		for_each_fabric_port(p, lpn, sd)
+			if (p->state == PM_PORT_STATE_ISOLATED)
+				fio.deisolating = true;
+
+		if (fio.deisolating) {
+			rescanning = true;
+			port_change = true;
+			qsfp_change = true;
+		}
+	}
+
+	if (test_and_clear_bit(PSC_TRAP, sd->pm_triggers)) {
+		port_change = true;
+		err = ops_linkmgr_psc_trap_ack(sd, false);
+		if (err)
+			sd_err(sd, "failed to ACK PSC trap\n");
+		atomic64_inc(&sd->psc_trap_count);
+	}
+
+	if (test_and_clear_bit(LWD_TRAP, sd->pm_triggers)) {
+		port_change = true;
+		err = ops_linkmgr_port_lwd_trap_ack(sd, false);
+		if (err)
+			sd_err(sd, "failed to ACK LWD trap\n");
+		atomic64_inc(&sd->lwd_trap_count);
+	}
+
+	if (test_and_clear_bit(LQI_TRAP, sd->pm_triggers)) {
+		port_change = true;
+		err = ops_linkmgr_port_lqi_trap_ack(sd, false);
+		if (err)
+			sd_err(sd, "failed to ACK LQI trap\n");
+		atomic64_inc(&sd->lqi_trap_count);
+	}
+
+	if (test_and_clear_bit(QSFP_PRESENCE_TRAP, sd->pm_triggers)) {
+		qsfp_change = true;
+		/*
+		 * Not implemented yet:
+		 *
+		 * err = ops_qsfp_mgr_fault_trap_acknowledge(sd, 0, 0, false);
+		 * if (err)
+		 *	sd_err(sd, "failed to ACK QSFP presence trap\n");
+		 * atomic64_inc(&sd->qsfp_present_trap_count);
+		 */
+	}
+
+	if (test_and_clear_bit(QSFP_FAULT_TRAP, sd->pm_triggers)) {
+		qsfp_change = true;
+		err = ops_qsfpmgr_fault_trap_ack(sd, false);
+		if (err)
+			sd_err(sd, "failed to ACK qsfp fault trap\n");
+		atomic64_inc(&sd->qsfp_fault_trap_count);
+	}
+
+	if (test_and_clear_bit(RESCAN_EVENT, sd->pm_triggers)) {
+		rescanning = true;
+		port_change = true;
+		qsfp_change = true;
+	}
+
+	if (test_and_clear_bit(NL_PM_CMD_EVENT, sd->pm_triggers))
+		rescanning = true;
+
+	sd_dbg(sd, "Updating ports:%s%s%s%s%s\n",
+	       initializing ? " INIT" : "",
+	       port_change ? " PSC" : "",
+	       qsfp_change ? " QSFP" : "",
+	       rescanning ? " RESCAN" : "",
+	       fio.deisolating ? " DEISOLATE" : "");
+
+	/*
+	 * Read state as needed
+	 */
+	if (initializing || port_change) {
+		cancel_work_sync(&sd->rescan_work);
+
+		err = read_portinfo(sd);
+		if (err)
+			sd_err(sd, "failed to update portinfo\n");
+
+		for_each_fabric_port(p, lpn, sd) {
+			pspps = p->portinfo->port_state_port_physical_state;
+
+			p->log_state = FIELD_GET(PS_PPS_PORT_STATE, pspps);
+			p->phys_state = FIELD_GET(PS_PPS_PHYSICAL_STATE, pspps);
+
+			if (sd->fdev->startup_mode == STARTUP_MODE_PRELOAD)
+				detect_preload_state(sd, p, &fio);
+			else
+				check_init_state(sd, p, initializing);
+
+			fport_dbg(p,
+				  "info: type %u LMA %u PPS %x OLDRNNLQI %x neighbor %016llx/%u/%u/%u LIR %u LDR %u FID %08x LDC %u PEA %u LQC %u\n",
+				  p->portinfo->port_type,
+				  p->portinfo->port_link_mode_active,
+				  p->portinfo->port_state_port_physical_state,
+				  p->portinfo->oldr_nn_lqi,
+				  p->portinfo->neighbor_guid,
+				  p->portinfo->neighbor_port_number,
+				  p->portinfo->neighbor_link_down_reason,
+				  p->portinfo->neighbor_mtu,
+				  p->portinfo->link_init_reason,
+				  p->portinfo->link_down_reason,
+				  p->portinfo->fid,
+				  p->portinfo->link_down_count,
+				  p->portinfo->port_error_action,
+				  p->portinfo->lqi_change_count);
+
+			trace_pm_psc(sd->fdev->pd->index, sd_index(sd), lpn, p->portinfo);
+		}
+	}
+
+	/*
+	 * Not implemented yet:
+	 *
+	 * if (qsfp_change)
+	 *	read_qsfp_data;
+	 */
+
+	/* Kick the FSMs if any request was seen */
+	if (initializing || port_change || qsfp_change || rescanning)
+		kick_fsms(sd, &fio);
+
+	if (fio.request_deisolation)
+		deisolate_all_ports();
+
+	up_read(&routable_lock);
+
+	if (initializing || fio.status_changed)
+		publish_status_updates(sd);
+
+	if (fio.routing_changed)
+		rem_request();
+
+	if (initializing || port_change || qsfp_change || rescanning) {
+		mutex_lock(&sd->pm_work_lock);
+		if (sd->ok_to_schedule_pm_work)
+			queue_delayed_work(iaf_unbound_wq, &sd->ue_work, UEVENT_DELAY);
+		/* else we are shutting down so don't send a state change UEVENT */
+		mutex_unlock(&sd->pm_work_lock);
+	}
+
+	sd_dbg(sd, "Ports updated%s%s%s\n",
+	       fio.request_deisolation ? " DEISOLATION_REQUESTED" : "",
+	       fio.routing_changed ? " ROUTING_CHANGED" : "",
+	       fio.status_changed ? " STATUS_CHANGED" : "");
+}
+
+static int initial_switchinfo_state(struct fsubdev *sd)
+{
+	/* num_ports does not include CPORT, which is always present */
+	sd->extended_port_cnt = sd->switchinfo.num_ports + 1;
+
+	sd_dbg(sd, "Detected %d ports\n", sd->extended_port_cnt);
+
+	if (sd->extended_port_cnt > PORT_COUNT) {
+		sd_err(sd, "Too many overall ports detected\n");
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static void linkup_timer_expired(struct timer_list *timer)
+{
+	struct fport *p = timer_container_of(p, timer, linkup_timer);
+
+	/*
+	 * signal_pm_thread() cannot be called from atomic context, so use another workitem to wake
+	 * the PM thread
+	 *
+	 * it is only safe to do this since del_timer_sync is called on all timers before canceling
+	 * rescan_work when cleaning up
+	 */
+	queue_work(iaf_unbound_wq, &p->sd->rescan_work);
+}
+
+/**
+ * ports_to_automatically_enable() - Determine which ports to enable at startup
+ * @sd: fabric subdevice object
+ *
+ * If port manual bringup is specified, no ports are brought up automatically, If not and PSC
+ * presence rules are found, these control which eligible ports are brought up (based on link
+ * config pins and/or default rules). Otherwise, all eligible ports are brought up by default.
+ *
+ * Presence rules by default affect all subdevices--a non-zero subdev_map is a bitfield indexed
+ * by subdevice number identifying which are affected by the rule. For DEFAULT rules, a non-zero
+ * index means to enable these ports by default. For LINK_CONTROL rules, index identifies which
+ * link control bit enables these ports. Either way, port_map is a bitmap indexed by port number
+ * identifying which port enables are controlled.
+ *
+ * In addition to the return value of this function, port type is also used to determine which
+ * ports are eligible. Currently only FIXED or VARIABLE ports are brought up automatically.
+ *
+ * Context: device initialization
+ * Return: bitmap indexed by port number indicating which ports may be enabled
+ */
+static u32 ports_to_automatically_enable(struct fsubdev *sd)
+{
+	struct psc_presence_rule *rule = sd->fdev->psc.presence_rules;
+	size_t rule_count = sd->fdev->psc.n_presence_rules;
+	u32 link_config = sd->fdev->link_config;
+	u32 port_enable_map;
+	size_t i;
+
+	if (port_manual_bringup)
+		return 0;
+
+	if (!rule)
+		return ~0;
+
+	port_enable_map = 0;
+
+	for (i = 0; i < rule_count; ++i, ++rule) {
+		if (rule->subdev_map && !(rule->subdev_map & BIT(sd_index(sd))))
+			continue;
+		if ((rule->method == PRESENCE_RULE_DEFAULT      && rule->index) ||
+		    (rule->method == PRESENCE_RULE_LINK_CONTROL && link_config & BIT(rule->index)))
+			port_enable_map |= rule->port_map ? rule->port_map : ~0;
+	}
+
+	return port_enable_map;
+}
+
+/*
+ * Module Entry points
+ */
+
+/*
+ * Go through extended port structures, identifying all fabric ports. Set up
+ * ports array (e.g., refer to relevant portinfo pointers) and set port_cnt to
+ * number of fabric ports.
+ */
+static int initial_port_state(struct fsubdev *sd)
+{
+	struct fport_status *init_status;
+	struct portinfo *curr_portinfo;
+	u32 port_enable_map;
+	struct fport *p;
+	u8 port_cnt;
+	u8 lpn;
+	int err;
+
+	p = sd->port + PORT_PHYSICAL_START;
+	port_cnt = 0;
+
+	init_status = sd->_portstatus;
+
+	port_enable_map = ports_to_automatically_enable(sd);
+
+	for (lpn = PORT_PHYSICAL_START, curr_portinfo = &sd->portinfo_op.per_portinfo[lpn];
+	     lpn < sd->extended_port_cnt;
+	     ++lpn, ++p, ++curr_portinfo) {
+		u8 mode = curr_portinfo->port_link_mode_active;
+		u8 type = curr_portinfo->port_type;
+		u8 lane;
+
+		sd_dbg(sd, PORT_FMT "mode %u type %u\n", lpn, mode, type);
+
+		p->lpn = lpn;
+		p->portinfo = curr_portinfo;
+		p->sd = sd;
+		p->port_type = type;
+		for (lane = 0; lane < LANES; lane++)
+			p->lanes_port[lane] = p;
+		timer_setup(&p->linkup_timer, linkup_timer_expired, 0);
+
+		INIT_LIST_HEAD(&p->unroute_link);
+
+		create_port_debugfs_dir(sd, lpn);
+
+		switch (mode) {
+		case IAF_FW_PORT_LINK_MODE_FABRIC:
+			if (port_cnt >= PORT_FABRIC_COUNT)
+				return -ENOENT;
+
+			if (lpn > TXCAL_PORT_COUNT) {
+				sd_err(sd, "p.%u: fabric port numbers cannot exceed %u\n",
+				       lpn, TXCAL_PORT_COUNT);
+
+				return -EINVAL;
+			}
+
+			bitmap_zero(p->controls, NUM_PORT_CONTROLS);
+
+			if (port_enable_map & BIT(lpn) &&
+			    (type == IAF_FW_PORT_TYPE_FIXED || type == IAF_FW_PORT_TYPE_VARIABLE))
+				set_bit(PORT_CONTROL_ENABLED, p->controls);
+
+			set_bit(PORT_CONTROL_ROUTABLE, p->controls);
+
+			p->state = PM_PORT_STATE_INACTIVE;
+
+			sd->port_cnt = ++port_cnt;
+
+			set_health_off(&init_status[lpn]);
+			clear_status_linkup_detected(&init_status[lpn]);
+			clear_status_link_failures(&init_status[lpn]);
+			clear_status_link_degrades(&init_status[lpn]);
+			set_bit(lpn, sd->fport_lpns);
+
+			create_fabric_port_debugfs_files(sd, p);
+
+			if (sd->fdev->psc.txcal) {
+				if (sd->txcal[lpn]) {
+					err = ops_tx_dcc_margin_param_set(sd, lpn, sd->txcal[lpn],
+									  true);
+					if (err) {
+						sd_err(sd, "p.%u: TX calibration write failed\n",
+						       lpn);
+						return err;
+					}
+				} else if (type != IAF_FW_PORT_TYPE_DISCONNECTED &&
+					type != IAF_FW_PORT_TYPE_UNKNOWN) {
+					if (is_fdev_registered(sd->fdev))
+						sd_warn(sd, "p.%u: missing TX calibration data\n",
+							lpn);
+				}
+			}
+
+			break;
+
+		case IAF_FW_PORT_LINK_MODE_FLIT_BUS:
+			set_bit(lpn, sd->bport_lpns);
+			create_bridge_port_debugfs_files(sd, p);
+
+			if (sd->txcal[lpn])
+				sd_warn(sd, "p.%u: has unexpected TX calibration data\n", lpn);
+
+			break;
+
+		default:
+			sd_err(sd, "p.%u: Invalid port mode %u\n", lpn, mode);
+			return -ENOENT;
+		}
+
+		routing_debug_port_init(sd, lpn);
+	}
+
+	/* published and unpublished queryable port state */
+
+	rcu_assign_pointer(sd->port_status, init_status);
+
+	sd->next_port_status = &sd->_portstatus[PORT_COUNT];
+	for_each_fabric_lpn(lpn, sd)
+		sd->next_port_status[lpn] = init_status[lpn];
+
+	return 0;
+}
+
+int initialize_fports(struct fsubdev *sd)
+{
+	struct fdev *dev = sd->fdev;
+	int err;
+	u32 i;
+
+	bitmap_zero(sd->pm_triggers, NUM_PM_TRIGGERS);
+
+	mutex_lock(&sd->pm_work_lock);
+	INIT_WORK(&sd->pm_work, update_ports_work);
+	INIT_DELAYED_WORK(&sd->ue_work, issue_sub_device_trap_count_work);
+	INIT_WORK(&sd->rescan_work, handle_rescan_work);
+	sd->ok_to_schedule_pm_work = true;
+	mutex_unlock(&sd->pm_work_lock);
+
+	atomic64_set(&sd->psc_trap_count, 0);
+	atomic64_set(&sd->lwd_trap_count, 0);
+	atomic64_set(&sd->lqi_trap_count, 0);
+	atomic64_set(&sd->qsfp_fault_trap_count, 0);
+	atomic64_set(&sd->qsfp_present_trap_count, 0);
+
+	err = ops_switchinfo_get(sd, &sd->switchinfo);
+	if (err)
+		goto init_failed;
+
+	sd->guid = sd->switchinfo.guid;
+	sd_dbg(sd, "guid 0x%016llx\n", sd->guid);
+
+	/*
+	 * Look for this subdevice's GUID in TX calibration blob data and extract settings for
+	 * all fabric ports. No need to warn on failure: ports warn when initialized
+	 */
+	if (dev->psc.txcal)
+		for (i = 0; i < dev->psc.txcal->num_settings; ++i)
+			if (dev->psc.txcal->data[i].guid == sd->guid)
+				memcpy(&sd->txcal[PORT_PHYSICAL_START],
+				       dev->psc.txcal->data[i].port_settings,
+				       sizeof(dev->psc.txcal->data[i].port_settings));
+
+	err = initial_switchinfo_state(sd);
+	if (err)
+		goto init_failed;
+
+	err = read_portinfo(sd);
+	if (err)
+		goto init_failed;
+
+	err = initial_port_state(sd);
+	if (err)
+		goto init_failed;
+
+	err = ops_linkmgr_psc_trap_ena_set(sd, true, false);
+	if (err)
+		goto init_failed;
+	err = ops_linkmgr_port_lwd_trap_ena_set(sd, true, false);
+	if (err)
+		goto init_failed;
+	err = ops_linkmgr_port_lqi_trap_ena_set(sd, true, false);
+	if (err)
+		goto init_failed;
+
+	err = routing_sd_once(sd);
+	if (err)
+		goto init_failed;
+
+	signal_pm_thread(sd, INIT_EVENT);
+
+	return 0;
+
+init_failed:
+
+	sd_err(sd, "Could not initialize ports: %d\n", err);
+	return err;
+}
+
+void destroy_fports(struct fsubdev *sd)
+{
+	struct mbdb_op_fw_version_rsp *fw_version = &sd->fw_version;
+	bool pm_wq_was_active;
+	struct fport *p;
+	u8 lpn;
+
+	mutex_lock(&sd->pm_work_lock);
+	pm_wq_was_active = sd->ok_to_schedule_pm_work;
+	if (pm_wq_was_active)
+		sd->ok_to_schedule_pm_work = false;
+	mutex_unlock(&sd->pm_work_lock);
+
+	/*
+	 * must cancel/sync timers (or anything else capable of triggering rescan_work) after
+	 * clearing ok_to_schedule_pm_work (so pm_work does not reschedule a timer) and before
+	 * canceling rescan_work (in case canceling a timer triggers it)
+	 */
+	for_each_fabric_port(p, lpn, sd)
+		timer_delete_sync(&p->linkup_timer);
+
+	if (pm_wq_was_active) {
+		cancel_delayed_work_sync(&sd->ue_work);
+		cancel_work_sync(&sd->rescan_work);
+		cancel_work_sync(&sd->pm_work);
+	}
+	/* else INIT_WORK calls were not completed */
+
+	if (READ_ONCE(sd->fw_running)) {
+		/* ignore MBDB errors here */
+		ops_linkmgr_port_lqi_trap_ena_set(sd, false, true);
+		ops_linkmgr_port_lwd_trap_ena_set(sd, false, true);
+		ops_linkmgr_psc_trap_ena_set(sd, false, true);
+	}
+
+	routing_sd_destroy(sd);
+
+	if (param_reset && (fw_version->environment & FW_VERSION_INIT_BIT))
+		ops_reset(sd, true);
+
+	for_each_fabric_port(p, lpn, sd)
+		if (p->state == PM_PORT_STATE_ISOLATED)
+			atomic_dec(&isolated_port_cnt);
+
+	rem_request();
+}
+
+int enable_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports)
+{
+	int unchanged = 1;
+	struct fport *p;
+	u8 lpn;
+
+	for_each_masked_port(p, lpn, sd->port, lpnmask, max_ports)
+		unchanged &= test_and_set_bit(PORT_CONTROL_ENABLED, p->controls);
+
+	return unchanged ? 0 : signal_pm_thread(sd, NL_PM_CMD_EVENT);
+}
+
+int disable_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports)
+{
+	bool any_was_enabled = false;
+	struct fport *p;
+	u8 lpn;
+
+	/* routing lock, then mappings lock */
+	down_write(&routable_lock); /* exclusive lock */
+	if (mappings_ref_check(sd->fdev)) {
+		up_write(&routable_lock);
+		return -EAGAIN;
+	}
+
+	for_each_masked_port(p, lpn, sd->port, lpnmask, max_ports) {
+		bool enabled = test_and_clear_bit(PORT_CONTROL_ENABLED, p->controls);
+
+		if (enabled && test_bit(PORT_CONTROL_ROUTABLE, p->controls) &&
+		    list_empty(&p->unroute_link))
+			list_add_tail(&p->unroute_link, &sd->fdev->port_unroute_list);
+		any_was_enabled |= enabled;
+	}
+	up_write(&routable_lock);
+
+	return any_was_enabled ? signal_pm_thread(sd, NL_PM_CMD_EVENT) : 0;
+}
+
+int enable_usage_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports)
+{
+	int unchanged = 1;
+	struct fport *p;
+	u8 lpn;
+
+	for_each_masked_port(p, lpn, sd->port, lpnmask, max_ports)
+		unchanged &= test_and_set_bit(PORT_CONTROL_ROUTABLE, p->controls);
+
+	if (!unchanged)
+		rem_request();
+
+	return 0;
+}
+
+int disable_usage_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports)
+{
+	bool any_was_routable = false;
+	struct fport *p;
+	u8 lpn;
+
+	down_write(&routable_lock); /* exclusive lock */
+	if (mappings_ref_check(sd->fdev)) {
+		up_write(&routable_lock);
+		return -EAGAIN;
+	}
+
+	for_each_masked_port(p, lpn, sd->port, lpnmask, max_ports) {
+		bool routable = test_and_clear_bit(PORT_CONTROL_ROUTABLE, p->controls);
+
+		if (routable && list_empty(&p->unroute_link))
+			list_add_tail(&p->unroute_link, &sd->fdev->port_unroute_list);
+		any_was_routable |= routable;
+	}
+	up_write(&routable_lock);
+
+	if (any_was_routable)
+		rem_request();
+
+	return 0;
+}
+
+int enable_port(struct fport *p)
+{
+	unsigned long lpnmask = 1 << p->lpn;
+
+	return enable_fports(p->sd, &lpnmask, PORT_COUNT);
+}
+
+int disable_port(struct fport *p)
+{
+	unsigned long lpnmask = 1 << p->lpn;
+
+	return disable_fports(p->sd, &lpnmask, PORT_COUNT);
+}
+
+int enable_usage_port(struct fport *p)
+{
+	unsigned long lpnmask = 1 << p->lpn;
+
+	return enable_usage_fports(p->sd, &lpnmask, PORT_COUNT);
+}
+
+int disable_usage_port(struct fport *p)
+{
+	unsigned long lpnmask = 1 << p->lpn;
+
+	return disable_usage_fports(p->sd, &lpnmask, PORT_COUNT);
+}
+
+int get_fport_status(struct fsubdev *sd, u8 lpn, struct fport_status *status)
+{
+	struct fport_status *curr_status;
+	int err = 0;
+
+	if (!get_fport_handle(sd, lpn))
+		return -EINVAL;
+
+	rcu_read_lock();
+	curr_status = rcu_dereference(sd->port_status);
+
+	if (curr_status)
+		*status = curr_status[lpn];
+	else
+		err = -EINVAL;
+
+	rcu_read_unlock();
+	return err;
+}
+
+void port_state_change_trap_handler(struct fsubdev *sd)
+{
+	signal_pm_thread(sd, PSC_TRAP);
+}
+
+void port_link_width_degrade_trap_handler(struct fsubdev *sd)
+{
+	signal_pm_thread(sd, LWD_TRAP);
+}
+
+void port_link_quality_indicator_trap_handler(struct fsubdev *sd)
+{
+	signal_pm_thread(sd, LQI_TRAP);
+}
+
+void port_qsfp_presence_trap_handler(struct fsubdev *sd)
+{
+	signal_pm_thread(sd, QSFP_PRESENCE_TRAP);
+}
+
+void port_qsfp_fault_trap_handler(struct fsubdev *sd)
+{
+	signal_pm_thread(sd, QSFP_FAULT_TRAP);
+}
diff --git a/drivers/gpu/drm/xe/fabric/port.h b/drivers/gpu/drm/xe/fabric/port.h
new file mode 100644
index 0000000000000..75c67f1a950bd
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/port.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2022 Intel Corporation.
+ */
+#ifndef PORT_H_
+#define PORT_H_
+
+#include "iaf_drv.h"
+
+#define LINK_CRC_MODE_16B 0
+#define LINK_CRC_MODE_14B 1
+#define LINK_CRC_MODE_48B 2
+#define LINK_CRC_MODE_PLN 3
+
+#define LINK_FEC_MODE_NONE    0
+#define LINK_FEC_MODE_F132    1
+#define LINK_FEC_MODE_F528    2
+#define LINK_FEC_MODE_UNKNOWN 3
+
+int initialize_fports(struct fsubdev *sd);
+void destroy_fports(struct fsubdev *sd);
+
+int enable_port(struct fport *p);
+int disable_port(struct fport *p);
+int enable_usage_port(struct fport *p);
+int disable_usage_port(struct fport *p);
+int enable_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports);
+int disable_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports);
+int enable_usage_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports);
+int disable_usage_fports(struct fsubdev *sd, unsigned long *lpnmask, u8 max_ports);
+int get_fport_status(struct fsubdev *sd, u8 lpn, struct fport_status *status);
+void port_state_change_trap_handler(struct fsubdev *sd);
+void port_link_width_degrade_trap_handler(struct fsubdev *sd);
+void port_link_quality_indicator_trap_handler(struct fsubdev *sd);
+void port_qsfp_presence_trap_handler(struct fsubdev *sd);
+void port_qsfp_fault_trap_handler(struct fsubdev *sd);
+const char *fw_log_state_name(u8 s);
+int signal_pm_thread(struct fsubdev *sd, enum pm_trigger_reasons event);
+s64 ms_elapsed_since_boot(void);
+
+#endif /* end of header file */
diff --git a/drivers/gpu/drm/xe/fabric/port_diag.c b/drivers/gpu/drm/xe/fabric/port_diag.c
new file mode 100644
index 0000000000000..143242812cb72
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/port_diag.c
@@ -0,0 +1,1892 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2021 - 2023 Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/stringify.h>
+#include <linux/uaccess.h>
+
+#include "debugfs.h"
+#include "ops.h"
+#include "port.h"
+#include "port_diag.h"
+
+static const char *port_health_name(enum fport_health s)
+{
+	switch (s) {
+	case FPORT_HEALTH_OFF:      return "OFF";
+	case FPORT_HEALTH_FAILED:   return "FAILED";
+	case FPORT_HEALTH_DEGRADED: return "DEGRADED";
+	case FPORT_HEALTH_HEALTHY:  return "HEALTHY";
+	}
+
+	return "UNKNOWN";
+}
+
+static const char *fw_phys_state_name(u8 s)
+{
+	static const char * const names[] = { "NOP", "UNKNOWN", "POLLING", "DISABLED", "TRAINING",
+					      "LINKUP", "LINK ERROR RECOVERY", "UNKNOWN", "UNKNOWN",
+					      "OFFLINE", "UNKNOWN", "TEST" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "UNKNOWN";
+	else
+		return names[s];
+}
+
+static const char *link_width_name(u8 s)
+{
+	static const char * const names[] = { "N/A", "1X", "2X", "N/A", "3X", "N/A", "N/A", "N/A",
+					      "4X" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "N/A";
+	else
+		return names[s];
+}
+
+static const char *link_speed_name(u8 s)
+{
+	static const char * const names[] = { "N/A", "12G", "25G", "N/A", "53G", "N/A", "N/A",
+					      "N/A", "90G" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "N/A";
+	else
+		return names[s];
+}
+
+static const char *crc_mode_name(u8 s)
+{
+	static const char * const names[] = { "16b", "14b", "48b", "pLn" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "N/A";
+	else
+		return names[s];
+}
+
+static const char *fec_mode_name(u8 s)
+{
+	static const char * const names[] = { "NONE",
+					      "F132",
+					      "F528",
+					      "UNKNOWN" };
+	if (s >= ARRAY_SIZE(names))
+		return "N/A";
+	else
+		return names[s];
+}
+
+static const char *port_type_name(u8 s)
+{
+	static const char * const names[] = { "UNKNOWN", "DISCONNECTED", "FIXED", "VARIABLE",
+					      "STANDARD", "SI_PHOTONICS" };
+
+	if (s >= ARRAY_SIZE(names))
+		return "UNKNOWN";
+	else
+		return names[s];
+}
+
+/*
+ * port_show debugfs functions
+ */
+
+#define PORT_SHOW_FILE_NAME "port_show"
+#define PORT_SHOW_BUF_SIZE 1024
+
+enum port_show_csr_rsp_idx {
+	TP_PRF_XMIT_PKTS_OFFSET_IDX,
+	O_FPC_PORTRCV_PKT_CNT_IDX,
+	O_LCB_STS_RX_CRC_FEC_MODE_IDX,
+	O_LCB_ERR_INFO_SEQ_CRC_CNT_IDX,
+	O_LCB_ERR_INFO_REINIT_FROM_PEER_CNT_IDX,
+	O_LCB_ERR_INFO_TX_REPLAY_CNT_IDX,
+	O_LCB_ERR_INFO_RX_REPLAY_CNT_IDX,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_1,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_2,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_3,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_4,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_5,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_6,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_7,
+	O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_8,
+	_RSP_IDX_COUNT,
+};
+
+struct port_show_query_fw_rsp {
+	DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(port_status_op, _RSP_IDX_COUNT);
+	DECLARE_MBDB_OP_PORTINFO(portinfo_op, 1);
+};
+
+static int port_show_query_fw(struct fsubdev *sd, u8 lpn, struct port_show_query_fw_rsp *rsp)
+{
+	static const struct mbdb_op_csr_range port_show_csr_ranges_b0[] = {
+		{ .offset = TP_PRF_XMIT_PKTS_OFFSET, .num_csrs = 1, },
+		{ .offset = O_FPC_PORTRCV_PKT_CNT, .num_csrs = 1, },
+		{ .offset = O_LCB_STS_RX_CRC_FEC_MODE, .num_csrs = 1, },
+		{ .offset = O_LCB_ERR_INFO_SEQ_CRC_CNT, .num_csrs = 1, },
+		{ .offset = O_LCB_ERR_INFO_REINIT_FROM_PEER_CNT, .num_csrs = 1, },
+		{ .offset = O_LCB_ERR_INFO_TX_REPLAY_CNT, .num_csrs = 2, },
+		{ .offset = O_LCB_ERR_INFO_FEC_CERR_CNT_1, .num_csrs = 8, }
+	};
+	const struct mbdb_op_csr_range *csr_ranges = port_show_csr_ranges_b0;
+	u8 num_csr_ranges = ARRAY_SIZE(port_show_csr_ranges_b0);
+
+	if (ops_port_status_get(sd, lpn, num_csr_ranges, csr_ranges,
+				&rsp->port_status_op))
+		return -EINVAL;
+
+	if (ops_portinfo_get(sd, 1U << lpn, &rsp->portinfo_op))
+		return -EINVAL;
+
+	signal_pm_thread(sd, RESCAN_EVENT);
+
+	return 0;
+}
+
+struct port_show_stats {
+	u64 rx_fec_correction_count;
+	u64 error_recovery_count;
+	u64 tx_packet_count;
+	u64 rx_packet_count;
+	u64 tx_replay_count;
+	u64 rx_replay_count;
+	u64 neighbor_guid;
+	s64 linkup_ms;
+	struct fport_status status;
+	u32 link_down_count;
+	u8 lpn;
+	u8 port_type;
+	u8 log_state;
+	u8 phys_state;
+	u8 crc_mode;
+	u8 fec_mode;
+	u8 link_tx_width_active;
+	u8 link_rx_width_active;
+	u8 link_speed_active;
+	u8 lqi;
+	u8 neighbor_port_number;
+};
+
+static int port_show_get_stats(struct fsubdev *sd, u8 lpn, struct port_show_stats *stats)
+{
+	struct port_show_query_fw_rsp rsp = {};
+	struct portinfo *port_info = rsp.portinfo_op.per_portinfo;
+	u64 *regs = rsp.port_status_op.regs;
+
+	if (port_show_query_fw(sd, lpn, &rsp))
+		return -EINVAL;
+
+	if (get_fport_status(sd, lpn, &stats->status))
+		return -EINVAL;
+
+	stats->lpn = lpn;
+	stats->log_state = FIELD_GET(PS_PPS_PORT_STATE, port_info->port_state_port_physical_state);
+	stats->phys_state = FIELD_GET(PS_PPS_PHYSICAL_STATE,
+				      port_info->port_state_port_physical_state);
+	stats->port_type = port_info->port_type;
+
+	stats->link_down_count = port_info->link_down_count;
+	stats->lqi = FIELD_GET(OLDR_NN_LQI_LINK_QUALITY_INDICATOR, port_info->oldr_nn_lqi);
+
+	if (stats->log_state > IAF_FW_PORT_DOWN) {
+		stats->link_tx_width_active = port_info->link_width_downgrade_tx_active;
+		stats->link_rx_width_active = port_info->link_width_downgrade_rx_active;
+		stats->link_speed_active = port_info->link_speed_active;
+		stats->crc_mode = FIELD_GET(CRC_MODE, regs[O_LCB_STS_RX_CRC_FEC_MODE_IDX]);
+		if (stats->crc_mode > LINK_CRC_MODE_48B)
+			stats->crc_mode = LINK_CRC_MODE_PLN;
+		stats->fec_mode = FIELD_GET(FEC_MODE, regs[O_LCB_STS_RX_CRC_FEC_MODE_IDX]);
+		if (stats->fec_mode > LINK_FEC_MODE_UNKNOWN)
+			stats->fec_mode = LINK_FEC_MODE_UNKNOWN;
+		stats->neighbor_guid = port_info->neighbor_guid;
+		stats->neighbor_port_number = port_info->neighbor_port_number;
+		if (stats->status.linkup_since)
+			stats->linkup_ms = ms_elapsed_since_boot() - stats->status.linkup_since;
+		else
+			stats->linkup_ms = 0;
+	} else {
+		stats->link_tx_width_active = 0xFF;
+		stats->link_rx_width_active = 0xFF;
+		stats->link_speed_active = 0xFF;
+		stats->crc_mode = 0xFF;
+		stats->fec_mode = 0xFF;
+		stats->neighbor_guid = 0;
+		stats->neighbor_port_number = 0xFF;
+		stats->linkup_ms = 0;
+	}
+
+	stats->tx_packet_count = regs[TP_PRF_XMIT_PKTS_OFFSET_IDX];
+	stats->rx_packet_count = regs[O_FPC_PORTRCV_PKT_CNT_IDX];
+	stats->error_recovery_count = regs[O_LCB_ERR_INFO_SEQ_CRC_CNT_IDX] +
+				      regs[O_LCB_ERR_INFO_REINIT_FROM_PEER_CNT_IDX];
+	stats->tx_replay_count = regs[O_LCB_ERR_INFO_TX_REPLAY_CNT_IDX];
+	stats->rx_replay_count = regs[O_LCB_ERR_INFO_RX_REPLAY_CNT_IDX];
+	stats->rx_fec_correction_count = regs[O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_1] +
+					 regs[O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_2];
+
+	if (stats->fec_mode == LINK_FEC_MODE_F528) {
+		int i;
+
+		for (i = O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_3;
+		     i <= O_LCB_ERR_INFO_FEC_CERR_CNT_IDX_8; i++)
+			stats->rx_fec_correction_count += regs[i];
+	}
+
+	return 0;
+}
+
+static size_t port_show_print_stats(struct port_show_stats *stats, char *buf)
+{
+	size_t buf_offset = 0;
+
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %u\n", "Port Number",
+		   stats->lpn);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "FW Phys State",
+		   fw_phys_state_name(stats->phys_state));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "FW Link State",
+		   fw_log_state_name(stats->log_state));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Port Health",
+		   port_health_name(stats->status.health));
+
+	if (stats->status.health == FPORT_HEALTH_FAILED) {
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Failed",
+			   test_bit(FPORT_ERROR_FAILED, stats->status.errors) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Isolated",
+			   test_bit(FPORT_ERROR_ISOLATED, stats->status.errors) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Flapping",
+			   test_bit(FPORT_ERROR_FLAPPING, stats->status.errors) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Link Down",
+			   test_bit(FPORT_ERROR_LINK_DOWN, stats->status.errors) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Did Not Train",
+			   test_bit(FPORT_ERROR_DID_NOT_TRAIN, stats->status.errors) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n",
+			   "Port Error Loopback",
+			   test_bit(FPORT_ERROR_LOOPBACK, stats->status.errors) ? "Y" : "N");
+	}
+
+	if (stats->status.health == FPORT_HEALTH_DEGRADED) {
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Port Issue LQI",
+			   test_bit(FPORT_ISSUE_LQI, stats->status.issues) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Port Issue LWD",
+			   test_bit(FPORT_ISSUE_LWD, stats->status.issues) ? "Y" : "N");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Port Issue RATE",
+			   test_bit(FPORT_ISSUE_RATE, stats->status.issues) ? "Y" : "N");
+	}
+
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Tx Width",
+		   link_width_name(stats->link_tx_width_active));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Rx Width",
+		   link_width_name(stats->link_rx_width_active));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Link Speed",
+		   link_speed_name(stats->link_speed_active));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "CRC Mode",
+		   crc_mode_name(stats->crc_mode));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "FEC Mode",
+		   fec_mode_name(stats->fec_mode));
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "TX Packet Count",
+		   stats->tx_packet_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "RX Packet Count",
+		   stats->rx_packet_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %u\n", "Link Down Count",
+		   stats->link_down_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "Error Recovery Count",
+		   stats->error_recovery_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "TX Replays",
+		   stats->tx_replay_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "RX Replays",
+		   stats->rx_replay_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %llu\n", "RX FEC Corr Count",
+		   stats->rx_fec_correction_count);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %u\n", "Link Quality",
+		   stats->lqi);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %s\n", "Port Type",
+		   port_type_name(stats->port_type));
+	if (stats->neighbor_port_number != 0xFF) {
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : 0x%0llx\n",
+			   "Neighbor GUID", stats->neighbor_guid);
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %u\n",
+			   "Neighbor Port Number", stats->neighbor_port_number);
+	} else {
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : N/A\n", "Neighbor GUID");
+		print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : N/A\n",
+			   "Neighbor Port Number");
+	}
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "%-24s : %lld\n", "Link Up Milliseconds",
+		   stats->linkup_ms);
+	print_diag(buf, &buf_offset, PORT_SHOW_BUF_SIZE, "\n");
+
+	return buf_offset;
+}
+
+static int port_show_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct port_show_stats stats;
+	struct port_show_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[PORT_SHOW_BUF_SIZE];
+	} *info;
+
+	if (!port)
+		return -EINVAL;
+
+	if (port_show_get_stats(port->sd, port->lpn, &stats))
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->blob.data = info->buf;
+	info->blob.size = port_show_print_stats(&stats, info->blob.data);
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations port_show_fops = {
+	.owner = THIS_MODULE,
+	.open = port_show_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define SERDES_HISTOGRAM_FILE_NAME "serdes_histogram"
+
+#define LANE_COLUMN_WIDTH        9
+#define NEWLINE_WIDTH            1
+#define NULL_TERMINATOR_WIDTH    1
+#define MAX_LINE_WIDTH           ((LANE_COLUMN_WIDTH * LANES) + NEWLINE_WIDTH)
+
+#define SERDES_HISTOGRAM_HEADERS 2
+
+#define LPN_HEADER_FMT   "Logical Port %d\n"
+/* Each Lane # label is LANE_COLUMN_WIDTH in size and right justified */
+#define LANE_HEADER_FMT  "   Lane 0   Lane 1   Lane 2   Lane 3\n"
+#define DATA_ELEMENT_FMT "%" __stringify(LANE_COLUMN_WIDTH) "u"
+
+#define HISTOGRAM_DISPLAY_BUF_SIZE ((MAX_LINE_WIDTH * SERDES_HISTOGRAM_HEADERS) + \
+				    (MAX_LINE_WIDTH * LANE_DATA_ELEMENTS) + \
+				    NULL_TERMINATOR_WIDTH)
+
+static int serdes_histogram_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct serdes_histogram_info {
+		struct debugfs_blob_wrapper blob;
+		struct mbdb_serdes_histogram_rsp rsp;
+		char buf[HISTOGRAM_DISPLAY_BUF_SIZE];
+	} *info;
+	struct mbdb_serdes_histogram_rsp *rsp;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	int lane;
+	int data_element;
+	int ret;
+
+	if (!port)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rsp = &info->rsp;
+
+	ret = ops_serdes_histogram_get(port->sd, port->lpn, rsp);
+	if (ret) {
+		kfree(info);
+		return ret;
+	}
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+	buf_offset = 0;
+
+	print_diag(buf, &buf_offset, buf_size, LPN_HEADER_FMT, port->lpn);
+	print_diag(buf, &buf_offset, buf_size, LANE_HEADER_FMT);
+
+	for (data_element = 0; data_element < LANE_DATA_ELEMENTS; data_element++) {
+		for (lane = 0; lane < LANES; lane++)
+			print_diag(buf, &buf_offset, buf_size, DATA_ELEMENT_FMT,
+				   rsp->lane[lane].data[data_element]);
+		print_diag(buf, &buf_offset, buf_size, "\n");
+	}
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations serdes_histogram_fops = {
+	.owner = THIS_MODULE,
+	.open = serdes_histogram_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define SERDES_EQINFO_FILE_NAME "serdes_eqinfo"
+
+#define EQINFO_MAX_LINE_LENGTH 94
+#define EQINFO_OUTPUT_LINES 113
+
+#define EQINFO_DISPLAY_BUF_SIZE (EQINFO_OUTPUT_LINES * EQINFO_MAX_LINE_LENGTH)
+
+#define EQINFO_LANE_HDR_FMT  "SerdesEqInfo       lane 0             lane 1             lane 2             lane 3\n"
+
+#define EQINFO_8BIT_HDR_FMT  "%-16s %#-18hhx %#-18hhx %#-18hhx %#-18hhx\n"
+#define EQINFO_16BIT_HDR_FMT "%-16s %#-18hx %#-18hx %#-18hx %#-18hx\n"
+#define EQINFO_32BIT_HDR_FMT "%-16s %#-18x %#-18x %#-18x %#-18x\n"
+#define EQINFO_64BIT_HDR_FMT "%-16s %#-18llx %#-18llx %#-18llx %#-18llx\n"
+
+#define PRINT_LANES_EQINFO_FIELD_8(name, field, buf, buf_offset, buf_size) \
+	print_diag(buf, buf_offset, buf_size, EQINFO_8BIT_HDR_FMT, name, \
+		   (unsigned char)eq_info[0].field, (unsigned char)eq_info[1].field, \
+		   (unsigned char)eq_info[2].field, (unsigned char)eq_info[3].field)
+
+#define PRINT_LANES_EQINFO_FIELD_16(name, field, buf, buf_offset, buf_size) \
+	print_diag(buf, buf_offset, buf_size, EQINFO_16BIT_HDR_FMT, name, \
+		   (unsigned short)eq_info[0].field, (unsigned short)eq_info[1].field, \
+		   (unsigned short)eq_info[2].field, (unsigned short)eq_info[3].field)
+
+#define PRINT_LANES_EQINFO_FIELD_32(name, field, buf, buf_offset, buf_size) \
+	print_diag(buf, buf_offset, buf_size, EQINFO_32BIT_HDR_FMT, name, \
+		   (unsigned int)eq_info[0].field, (unsigned int)eq_info[1].field, \
+		   (unsigned int)eq_info[2].field, (unsigned int)eq_info[3].field)
+
+#define PRINT_LANES_EQINFO_FIELD_64(name, field, buf, buf_offset, buf_size) \
+	print_diag(buf, buf_offset, buf_size, EQINFO_64BIT_HDR_FMT, name, \
+		   eq_info[0].field, eq_info[1].field, \
+		   eq_info[2].field, eq_info[3].field)
+
+static void serdes_eqinfo_process(char *buf, size_t *buf_offset, size_t buf_size,
+				  struct mbdb_serdes_eq_info *eq_info)
+{
+	char name[17];
+	int i;
+
+	PRINT_LANES_EQINFO_FIELD_32("eqP4Rev", eq_p4_rev, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_32("eqP4Time", eq_p4_time, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_32("rxdTxdP4Rev", rxd_txd_p4_rev, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_32("rxdTxdP4Time", rxd_txd_p4_time, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("eqCompileOptions", eq_compile_options, buf, buf_offset,
+				   buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agcMode", agc_mode, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1LmsMu", agc1_lms_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1PeakNcycExp", agc1_peak_ncyc_exp, buf, buf_offset,
+				   buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc2LmsMu", agc2_lms_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc2PeakNcycExp", agc2_peak_ncyc_exp, buf, buf_offset,
+				   buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agcLpfMu", agc_lpf_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agcTarg", agc_targ, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1LmsEn", agc1_lms_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1LmsLd", agc1_lms_ld, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc2LmsEn", agc2_lms_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc2LmsLd", agc2_lms_ld, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1LmsLdVal", agc1_lms_ld_val, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1Ctl", agc1_ctl, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1Peak", agc1_peak, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc1Ppeak", agc1_ppeak, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("agc2LmsLdVal", agc2_lms_ld_val, buf, buf_offset, buf_size);
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].agc2_ctl); i++) {
+		scnprintf(name, sizeof(name), "agc2Ctl[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_8(name, agc2_ctl[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].agc2_peak); i++) {
+		scnprintf(name, sizeof(name), "agc2Peak[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_8(name, agc2_peak[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].agc2_ppeak); i++) {
+		scnprintf(name, sizeof(name), "agc2Ppeak[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_8(name, agc2_ppeak[i], buf, buf_offset, buf_size);
+	}
+
+	PRINT_LANES_EQINFO_FIELD_8("cdrPropMu", cdr_prop_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrIntgMu", cdr_intg_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrFltMu", cdr_flt_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrPherrScale", cdr_pherr_scale, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrSsEn", cdr_ss_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrFltEn", cdr_flt_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrIntgEn", cdr_intg_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrPhase", cdr_phase, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cdrIntg", cdr_intg, buf, buf_offset, buf_size);
+
+	PRINT_LANES_EQINFO_FIELD_16("cdrPhErrFlt", cdr_ph_err_flt, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_64("cntrIlvExclMsk", cntr_ilv_excl_msk, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_32("pphm", pphm, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("cntrSh", cntr_sh, buf, buf_offset, buf_size);
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].hcntr); i++) {
+		scnprintf(name, sizeof(name), "hcntr[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_8(name, hcntr[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].cntr_ch_est); i++) {
+		scnprintf(name, sizeof(name), "cntrChEst[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, cntr_ch_est[i], buf, buf_offset, buf_size);
+	}
+
+	PRINT_LANES_EQINFO_FIELD_8("ffeLmsMu", ffe_lms_mu, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("ffeLmsLkMuDelta", ffe_lms_lk_mu_delta, buf, buf_offset,
+				   buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("ffeLmsLkEn", ffe_lms_lk_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("dfeLmsMu", dfe_lms_mu, buf, buf_offset, buf_size);
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].eq_targ); i++) {
+		scnprintf(name, sizeof(name), "eqTarg[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, eq_targ[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].dfe_nthr); i++) {
+		scnprintf(name, sizeof(name), "dfeNthr[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, dfe_nthr[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].dfe_zthr); i++) {
+		scnprintf(name, sizeof(name), "dfeZthr[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, dfe_zthr[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].dfe_pthr); i++) {
+		scnprintf(name, sizeof(name), "dfePthr[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, dfe_pthr[i], buf, buf_offset, buf_size);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].hffe); i++) {
+		scnprintf(name, sizeof(name), "hffe[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_16(name, hffe[i], buf, buf_offset, buf_size);
+	}
+
+	PRINT_LANES_EQINFO_FIELD_32("gf0", gf0, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_16("hdfe", hdfe, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("nrzSliceEn", nrz_slice_en, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("rmtTxLane", rmt_tx_lane, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_16("lmsSumErr", lms_sum_err, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_16("lmsSumErrShf", lms_sum_err_shf, buf, buf_offset, buf_size);
+
+	for (i = 0; i < ARRAY_SIZE(eq_info[0].tx_fir_eh); i++) {
+		scnprintf(name, sizeof(name), "txFirEh[%d]", i);
+		PRINT_LANES_EQINFO_FIELD_8(name, tx_fir_eh[i], buf, buf_offset, buf_size);
+	}
+
+	PRINT_LANES_EQINFO_FIELD_8("txFirEhM1", tx_fir_eh_m1, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_8("pllLolCnt", pll_lol_cnt, buf, buf_offset, buf_size);
+	PRINT_LANES_EQINFO_FIELD_16("pmonUlvtFreq", pmon_ulvt_freq, buf, buf_offset, buf_size);
+}
+
+static int serdes_eqinfo_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct serdes_eqinfo_info {
+		struct debugfs_blob_wrapper blob;
+		struct mbdb_serdes_eq_info_get_rsp rsp;
+		char buf[EQINFO_DISPLAY_BUF_SIZE];
+	} *info;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	int ret;
+
+	if (!port)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = ops_serdes_eqinfo_get(port->sd, port->lpn, &info->rsp);
+	if (ret) {
+		kfree(info);
+		return ret;
+	}
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+	buf_offset = 0;
+
+	print_diag(buf, &buf_offset, buf_size, LPN_HEADER_FMT, port->lpn);
+	print_diag(buf, &buf_offset, buf_size, EQINFO_LANE_HDR_FMT);
+
+	serdes_eqinfo_process(buf, &buf_offset, buf_size, info->rsp.eq_info);
+
+	info->blob.data = buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations serdes_eqinfo_fops = {
+	.owner = THIS_MODULE,
+	.open = serdes_eqinfo_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define LCB_COUNTERS_FILE_NAME "lcb_ctrs"
+
+#define LCB_ERR_INFO_NAMES_B0 \
+	"TOTAL_CRC_ERR", \
+	"CRC_ERR_LN0", \
+	"CRC_ERR_LN1", \
+	"CRC_ERR_LN2", \
+	"CRC_ERR_LN3", \
+	"CRC_ERR_MULTI_LN", \
+	"TX_REPLAY", \
+	"RX_REPLAY", \
+	"SEQ_CRC", \
+	"ESCAPE_0_ONLY", \
+	"ESCAPE_0_PLUS1", \
+	"ESCAPE_0_PLUS2", \
+	"REINIT_FROM_PEER", \
+	"SBE", \
+	"MISC_FLG", \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	"FEC_CERR_1", \
+	"FEC_CERR_2", \
+	"FEC_CERR_3", \
+	"FEC_CERR_4", \
+	"FEC_CERR_5", \
+	"FEC_CERR_6", \
+	"FEC_CERR_7", \
+	"FEC_CERR_8", \
+	"FEC_UERR_CNT", \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	NULL, \
+	"FEC_ERR_LN0", \
+	"FEC_ERR_LN1", \
+	"FEC_ERR_LN2", \
+	"FEC_ERR_LN3", \
+	"RX_RESYNC_CNT"
+
+static const char * const lcb_err_info_names_b0[] = {
+	LCB_ERR_INFO_NAMES_B0
+};
+
+static const char * const lcb_prf_names[] = {
+	"GOOD_LTP",
+	"ACCEPTED_LTP",
+	"TX_RELIABLE_LTP",
+	"RX_FLIT",
+	"TX_FLIT",
+	NULL,
+	"GOOD_FECCW"
+};
+
+#define LCB_ERR_INFO_VALUES_B0 ARRAY_SIZE(lcb_err_info_names_b0)
+#define LCB_ERR_INFO_VALUES_NUM LCB_ERR_INFO_VALUES_B0
+#define LCB_PRF_VALUES ARRAY_SIZE(lcb_prf_names)
+
+#define LCB_COUNTERS_DISPLAY_BUF_SIZE (PAGE_SIZE - sizeof(struct debugfs_blob_wrapper))
+
+#define LCB_COUNTERS_FMT "%-16s %llu\n"
+
+struct lcb_counters_regs_data {
+	DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(regs_op, LCB_ERR_INFO_VALUES_NUM + LCB_PRF_VALUES);
+} __packed;
+
+static int lcb_counters_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct mbdb_op_csr_range csr_ranges[] = {
+		{ .offset = O_LCB_ERR_INFO_OFFSET,
+		  .num_csrs = LCB_ERR_INFO_VALUES_B0
+		},
+		{ .offset = O_LCB_PRF_OFFSET,
+		  .num_csrs = LCB_PRF_VALUES
+		},
+	};
+	struct lcb_counters_regs_data regs = {};
+	struct lcb_counters_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[LCB_COUNTERS_DISPLAY_BUF_SIZE];
+	} *info;
+	const char * const *lcb_err_info_names = lcb_err_info_names_b0;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	int ret;
+	int i;
+
+	ret = ops_port_status_get(port->sd, port->lpn, ARRAY_SIZE(csr_ranges), csr_ranges,
+				  &regs.regs_op);
+	if (ret)
+		return ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+	buf_offset = 0;
+
+	print_diag(buf, &buf_offset, buf_size, "%s %u\n", "LOGICAL_PORT", port->lpn);
+	print_diag(buf, &buf_offset, buf_size, LCB_COUNTERS_FMT, "FR_RTC", regs.cp_free_run_rtc);
+
+	for (i = 0; i < csr_ranges[0].num_csrs; i++)
+		if (lcb_err_info_names[i])
+			print_diag(buf, &buf_offset, buf_size, LCB_COUNTERS_FMT,
+				   lcb_err_info_names[i], regs.regs[i]);
+
+	for (i = 0; i < LCB_PRF_VALUES; i++)
+		if (lcb_prf_names[i])
+			print_diag(buf, &buf_offset, buf_size, LCB_COUNTERS_FMT, lcb_prf_names[i],
+				   regs.regs[i + csr_ranges[0].num_csrs]);
+
+	info->blob.data = buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations lcb_counters_fops = {
+	.owner = THIS_MODULE,
+	.open = lcb_counters_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+#define SERDES_CHANNEL_ESTIMATION_MAX_BUF_SIZE (PAGE_SIZE * 10)
+#define SERDES_CHANNEL_ESTIMATION_MAX_ELEMENTS 1020
+#define SERDES_CHANNEL_ESTIMATION_FILE_NAME "serdes_channel_estimation"
+#define SERDES_CHANNEL_ESTIMATION_DATA_ELEMENT_FMT "%9hd"
+
+static int serdes_channel_estimation_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct serdes_channel_estimation_info {
+		struct debugfs_blob_wrapper blob;
+		struct mbdb_serdes_ch_est_rsp rsp[LANES];
+		char buf[SERDES_CHANNEL_ESTIMATION_MAX_BUF_SIZE];
+	} *info;
+	struct mbdb_serdes_ch_est_rsp *rsp;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+	u8 lane;
+	u16 elements;
+	u16 data_element;
+	int ret;
+
+	if (!port)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	elements = SERDES_CHANNEL_ESTIMATION_MAX_ELEMENTS;
+
+	for (lane = 0; lane < LANES; lane++) {
+		rsp = &info->rsp[lane];
+		ret = ops_serdes_channel_estimate_get(port->sd, port->lpn, lane, rsp);
+		if (ret) {
+			kfree(info);
+			return ret;
+		}
+
+		elements = min_t(u16, elements, rsp->elements);
+	}
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+	buf_offset = 0;
+
+	print_diag(buf, &buf_offset, buf_size, LPN_HEADER_FMT, port->lpn);
+	print_diag(buf, &buf_offset, buf_size, LANE_HEADER_FMT);
+
+	for (data_element = 0; data_element < elements; data_element++) {
+		for (lane = 0; lane < LANES; lane++)
+			print_diag(buf, &buf_offset, buf_size,
+				   SERDES_CHANNEL_ESTIMATION_DATA_ELEMENT_FMT,
+				   info->rsp[lane].data[data_element]);
+
+		print_diag(buf, &buf_offset, buf_size, "\n");
+	}
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations serdes_channel_estimation_fops = {
+	.owner = THIS_MODULE,
+	.open = serdes_channel_estimation_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+/*
+ * Remote TX lanes
+ *
+ * Data is transmitted on up to four lanes and may be "swizzled" so that TX lanes are connected to
+ * differently-numbered RX lanes. Report the source lane for all four lanes.
+ */
+
+#define REMOTE_TX_LANES_FILE_NAME "remote_tx_lanes"
+#define TX_LANES_STRING_SIZE (10)
+
+/* lane number as a character, replacing illegal lane values with x (lane is unconnected) */
+static char lane_indicator(u8 lane)
+{
+	return lane < LANES ? '0' + lane : 'x';
+}
+
+static ssize_t remote_tx_lanes_read(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	char rd_buf[TX_LANES_STRING_SIZE];
+	size_t siz;
+	u64 value = 0;
+	int err;
+
+	err = ops_linkmgr_port_csr_rd(port->sd, port->lpn, O_LCB_STS_RX_LOGICAL_ID, sizeof(value),
+				      &value);
+	if (err)
+		return err;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%c %c %c %c\n",
+			lane_indicator(FIELD_GET(PEER_TX_ID_LN0, value)),
+			lane_indicator(FIELD_GET(PEER_TX_ID_LN1, value)),
+			lane_indicator(FIELD_GET(PEER_TX_ID_LN2, value)),
+			lane_indicator(FIELD_GET(PEER_TX_ID_LN3, value)));
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static const struct file_operations remote_lanes_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = remote_tx_lanes_read
+};
+
+/*
+ * Port enables
+ *
+ * "enable" identifies whether the port is used at all; "usage_enable" identifies whether routing
+ * will configure it to carry data
+ */
+
+#define PORT_ENABLE_FILE_NAME "enable"
+#define USAGE_ENABLE_FILE_NAME "usage_enable"
+#define ENABLE_STRING_SIZE 3
+
+/* port control as a character indicating boolean state */
+static char control_flag(struct fport *port, enum PORT_CONTROL bit)
+{
+	return test_bit(bit, port->controls) ? 'Y' : 'N';
+}
+
+static ssize_t port_ena_read(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	char rd_buf[ENABLE_STRING_SIZE];
+	size_t siz;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%c\n", control_flag(port, PORT_CONTROL_ENABLED));
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t usage_ena_read(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	char rd_buf[ENABLE_STRING_SIZE];
+	size_t siz;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%c\n", control_flag(port, PORT_CONTROL_ROUTABLE));
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t func_ena_write(struct file *fp, const char __user *buf, size_t count, loff_t *fpos,
+			      int (*enablefn)(struct fport *), int (*disablefn)(struct fport *))
+{
+	struct fport *port = fp->private_data;
+	char *kbuf;
+	bool set;
+	int err;
+
+	if (!count)
+		return 0;
+
+	kbuf = kzalloc(count + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	/* only proceed if entire string can be copied */
+	if (copy_from_user(kbuf, buf, count)) {
+		kfree(kbuf);
+		return -EFAULT;
+	}
+
+	err = kstrtobool(kbuf, &set);
+	kfree(kbuf);
+	if (err)
+		return err;
+
+	err = set ? enablefn(port) : disablefn(port);
+	if (err)
+		return err;
+
+	*fpos += count;
+	return count;
+}
+
+static ssize_t port_ena_write(struct file *fp, const char __user *buf, size_t count, loff_t *fpos)
+{
+	return func_ena_write(fp, buf, count, fpos, enable_port, disable_port);
+}
+
+static ssize_t usage_ena_write(struct file *fp, const char __user *buf, size_t count, loff_t *fpos)
+{
+	return func_ena_write(fp, buf, count, fpos, enable_usage_port, disable_usage_port);
+}
+
+static const struct file_operations port_enable_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = port_ena_read,
+	.write = port_ena_write
+};
+
+static const struct file_operations usage_enable_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = usage_ena_read,
+	.write = usage_ena_write
+};
+
+static void enable_nodes_init(struct fsubdev *sd, struct fport *port)
+{
+	debugfs_create_file(PORT_ENABLE_FILE_NAME, 0600, sd->debugfs_port_dir, port,
+			    &port_enable_fops);
+	debugfs_create_file(USAGE_ENABLE_FILE_NAME, 0600, sd->debugfs_port_dir, port,
+			    &usage_enable_fops);
+}
+
+/*
+ * Per-port TX tuning parameters
+ *
+ * There are two sets of TX tuning parameters for each port, based on speed class: FAST (>= 90G) and
+ * SLOW (<= 53G). Each set contains one value per lane. A third set of parameters allows users to
+ * query or set parameters corresponding to the currently-configured speed.
+ */
+#define TX_TUNING_FAST_FILE_NAME "tx_tuning_fast"
+#define TX_TUNING_SLOW_FILE_NAME "tx_tuning_slow"
+#define TX_TUNING_CURR_FILE_NAME "tx_tuning_current"
+
+#define BAD_TUNE_IDX (~0)
+#define UNSPECIFIED_TX_TUNING_INDICES { BAD_TUNE_IDX, BAD_TUNE_IDX, BAD_TUNE_IDX, BAD_TUNE_IDX }
+#define LONGEST_TX_TUNING_STRING (48)
+#define TUNING_SEPS " \t"
+
+#define LEGAL_TX_TUNING_INDEX(_i) ((_i) < 256)
+
+static int read_tx_tunings(struct fport *port, u32 link_speed, u32 idx[LANES])
+{
+	struct port_var_data var_data = {};
+	int err;
+	int i;
+
+	err = ops_port_var_table_read(port->sd, port->lpn, link_speed, &var_data);
+	if (err)
+		return err;
+
+	for (i = 0; i < LANES; ++i)
+		idx[i] = var_data.tx_tuning[i];
+
+	return 0;
+}
+
+static int write_tx_tunings(struct fport *port, u32 link_speed, const u32 idx[LANES])
+{
+	struct port_var_data var_data = {};
+	int err;
+	int i;
+
+	for (i = 0; i < LANES; ++i)
+		if (!LEGAL_TX_TUNING_INDEX(idx[i]))
+			break;
+
+	err = i < LANES ? ops_port_var_table_read(port->sd, port->lpn, link_speed, &var_data) : 0;
+	if (err)
+		return err;
+
+	for (i = 0; i < LANES; ++i)
+		if (LEGAL_TX_TUNING_INDEX(idx[i]))
+			var_data.tx_tuning[i] = idx[i];
+
+	return ops_port_var_table_write(port->sd, port->lpn, link_speed, &var_data, false);
+}
+
+static ssize_t tune_read_spd(struct file *fp, char __user *buf, size_t count, loff_t *fpos,
+			     u32 link_speed)
+{
+	char rd_buf[LONGEST_TX_TUNING_STRING];
+	u32 idx[LANES];
+	size_t siz;
+	int err;
+
+	if (!link_speed) {
+		siz = scnprintf(rd_buf, sizeof(rd_buf), "? ? ? ?\n");
+		return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+	}
+
+	err = read_tx_tunings(fp->private_data, link_speed, idx);
+	if (err)
+		return err;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%u %u %u %u\n", idx[0], idx[1], idx[2], idx[3]);
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t tune_write_spd(struct file *fp, const char __user *buf, size_t count, loff_t *fpos,
+			      u32 link_speed)
+{
+	u32 idx[LANES] = UNSPECIFIED_TX_TUNING_INDICES;
+	char *next_token;
+	char *curr_token;
+	char *kbuf;
+	int lane;
+	int err;
+
+	if (!count)
+		return 0;
+
+	/* do not try to process unreasonably long input */
+	if (count > LONGEST_TX_TUNING_STRING)
+		return -EINVAL;
+
+	kbuf = kzalloc(count + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(kbuf, buf, count)) {
+		kfree(kbuf);
+		return -EFAULT;
+	}
+
+	/*
+	 * process only fully-copied input, consisting of 4 unsigned numbers separated by
+	 * single spaces/tabs: any illegal number (e.g., "-", "none") causes the existing
+	 * corresponding value to be retained
+	 */
+
+	next_token = kbuf;
+
+	for (lane = 0; next_token && *next_token && lane < LANES; ++lane) {
+		curr_token = strsep(&next_token, TUNING_SEPS);
+		err = kstrtou32(curr_token, 0, &idx[lane]);
+		if (err)
+			idx[lane] = BAD_TUNE_IDX;
+	}
+
+	kfree(kbuf);
+
+	err = write_tx_tunings(fp->private_data, link_speed, idx);
+	if (err < 0)
+		return err;
+
+	*fpos += count;
+
+	return count;
+}
+
+static ssize_t tune_read_fast(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	return tune_read_spd(fp, buf, count, fpos, LINK_SPEED_FAST);
+}
+
+static ssize_t tune_read_slow(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	return tune_read_spd(fp, buf, count, fpos, LINK_SPEED_SLOW);
+}
+
+static ssize_t tune_read_current(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	u32 link_speed;
+
+	/*
+	 * read tuning parameters for active speed class, which must uniquely match either FAST or
+	 * SLOW bitmap
+	 *
+	 * if active speed does not match this criterion (i.e., if no speed is active), fall back to
+	 * enabled speed(s) if it/they uniquely match either FAST or SLOW bitmap
+	 */
+
+	link_speed = port->portinfo->link_speed_active;
+
+	if ((bool)(link_speed & LINK_SPEED_SLOW) == (bool)(link_speed & LINK_SPEED_FAST)) {
+		link_speed = port->portinfo->link_speed_enabled;
+
+		if ((bool)(link_speed & LINK_SPEED_SLOW) == (bool)(link_speed & LINK_SPEED_FAST))
+			link_speed = 0;
+	}
+
+	return tune_read_spd(fp, buf, count, fpos, link_speed);
+}
+
+static ssize_t tune_write_fast(struct file *fp, const char __user *buf, size_t count, loff_t *fpos)
+{
+	return tune_write_spd(fp, buf, count, fpos, LINK_SPEED_FAST);
+}
+
+static ssize_t tune_write_slow(struct file *fp, const char __user *buf, size_t count, loff_t *fpos)
+{
+	return tune_write_spd(fp, buf, count, fpos, LINK_SPEED_SLOW);
+}
+
+static ssize_t tune_write_current(struct file *fp, const char __user *buf, size_t count,
+				  loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	u32 link_speed;
+
+	/*
+	 * write tuning parameters for active speed class which must match either FAST or SLOW
+	 * bitmap
+	 *
+	 * if active speed does not match this criterion (i.e., if no speed is active), instead
+	 * enabled speed(s)
+	 */
+
+	link_speed = port->portinfo->link_speed_active;
+
+	if (!(link_speed & (LINK_SPEED_SLOW | LINK_SPEED_FAST)))
+		link_speed = port->portinfo->link_speed_enabled;
+
+	return tune_write_spd(fp, buf, count, fpos, link_speed);
+}
+
+static const struct file_operations tune_fast_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tune_read_fast,
+	.write = tune_write_fast
+};
+
+static const struct file_operations tune_slow_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tune_read_slow,
+	.write = tune_write_slow
+};
+
+static const struct file_operations tune_current_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tune_read_current,
+	.write = tune_write_current
+};
+
+static void tx_tuning_nodes_init(struct fport *port, struct dentry *debugfs_dir)
+{
+	debugfs_create_file(TX_TUNING_FAST_FILE_NAME, 0600, debugfs_dir, port, &tune_fast_fops);
+	debugfs_create_file(TX_TUNING_SLOW_FILE_NAME, 0600, debugfs_dir, port, &tune_slow_fops);
+	debugfs_create_file(TX_TUNING_CURR_FILE_NAME, 0600, debugfs_dir, port, &tune_current_fops);
+}
+
+/*
+ * Serdes Margin query and associated subops
+ */
+
+#define TX_DCC_DIR_NAME "tx_dcc"
+#define TX_DCC_MARGIN_PARAMS_FILE_NAME "margin_params"
+#define TX_DCC_INTERP_FILE_NAME "interp"
+#define TX_DCC_INDEX_FILE_NAME "index"
+#define MAINT_MODE_FILE_NAME "maint_mode"
+#define TX_DCC_INTERP_OVVL_FILE_NAME "interp_override"
+#define TX_DCC_INTERP_OV_ENABLE_FILE_NAME "interp_override_enable"
+
+#define LANE_SUFFIX 6
+/* Max tx_dcc file name + _lanex + 1 */
+#define MAX_TX_DCC_FILE_NAME_BUF_SIZE (22 + LANE_SUFFIX + 1)
+
+#define MARGIN_PARAMS_BUF_SIZE 7
+#define DCC_INTERP_BUF_SIZE 165
+#define MAINT_MODE_BUF_SIZE 12
+#define DCC_INTERP_OVERRIDE_BUF_SIZE 12
+#define DCC_INTERP_OVERRIDE_ENABLE_BUF_SIZE 3
+
+static ssize_t tx_dcc_margin_params_read(struct file *fp, char __user *buf, size_t count,
+					 loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	struct tx_dcc_margin_param_get_rsp rsp = {};
+	char rd_buf[MARGIN_PARAMS_BUF_SIZE];
+	size_t siz;
+
+	if (!port)
+		return -EINVAL;
+
+	if (ops_tx_dcc_margin_param_get(port->sd, port->lpn, &rsp))
+		return -EINVAL;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%u\n", rsp.value);
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t tx_dcc_margin_params_write(struct file *fp, const char __user *buf, size_t count,
+					  loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	u16 value;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	if (kstrtou16_from_user(buf, count, 0, &value))
+		return -EINVAL;
+
+	if (ops_tx_dcc_margin_param_set(port->sd, port->lpn, value, true))
+		return -EINVAL;
+
+	*fpos += count;
+	return count;
+}
+
+static int tx_dcc_interp_open(struct inode *inode, struct file *file)
+{
+	struct fport **lane = inode->i_private;
+	struct fport *port = lane ? *lane : NULL;
+	struct dcc_interp_info {
+		struct debugfs_blob_wrapper blob;
+		struct tx_dcc_interp_get_rsp rsp;
+		char buf[DCC_INTERP_BUF_SIZE];
+	} *info;
+	struct tx_dcc_interp_get_rsp *rsp;
+	size_t buf_size;
+	size_t buf_offset;
+	char *buf;
+
+	if (!port)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rsp = &info->rsp;
+
+	if (ops_tx_dcc_interp_get(port->sd, port->lpn, lane_number(lane), rsp)) {
+		kfree(info);
+		return -EINVAL;
+	}
+
+	buf_size = ARRAY_SIZE(info->buf);
+	buf = info->buf;
+	buf_offset = 0;
+
+	print_diag(buf, &buf_offset, buf_size, "%-18s : %u\n", "dccp", rsp->dccp);
+	print_diag(buf, &buf_offset, buf_size, "%-18s : %u\n", "dccnb", rsp->dccnb);
+	print_diag(buf, &buf_offset, buf_size, "%-18s : %u\n", "tx_interp2_ctl",
+		   rsp->tx_interp2_ctl);
+	print_diag(buf, &buf_offset, buf_size, "%-18s : %u\n", "tx_mux_delay_ctrl2",
+		   rsp->tx_mux_delay_ctrl2);
+	print_diag(buf, &buf_offset, buf_size, "%-18s : %u\n", "reverse_pd", rsp->reverse_pd);
+
+	info->blob.data = info->buf;
+	info->blob.size = buf_offset;
+	file->private_data = info;
+
+	return 0;
+}
+
+static ssize_t tx_dcc_index_write(struct file *fp, const char __user *buf, size_t count,
+				  loff_t *fpos)
+{
+	struct fport **lane = fp->private_data;
+	struct fport *port = lane ? *lane : NULL;
+	u32 index;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	if (kstrtou32_from_user(buf, count, 0, &index))
+		return -EINVAL;
+
+	if (ops_tx_dcc_index_set(port->sd, port->lpn, lane_number(lane), index, false))
+		return -EINVAL;
+
+	*fpos += count;
+	return count;
+}
+
+static ssize_t maint_mode_read(struct file *fp, char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	struct maint_mode_get_rsp rsp = {};
+	char rd_buf[MAINT_MODE_BUF_SIZE];
+	size_t siz;
+
+	if (!port)
+		return -EINVAL;
+
+	if (ops_maint_mode_get(port->sd, port->lpn, &rsp))
+		return -EINVAL;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%u\n", rsp.mode);
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t maint_mode_write(struct file *fp, const char __user *buf, size_t count, loff_t *fpos)
+{
+	struct fport *port = fp->private_data;
+	u32 mode;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	if (kstrtou32_from_user(buf, count, 0, &mode))
+		return -EINVAL;
+
+	if (ops_maint_mode_set(port->sd, port->lpn, mode, false))
+		return -EINVAL;
+
+	*fpos += count;
+	return count;
+}
+
+static ssize_t tx_dcc_interp_override_read(struct file *fp, char __user *buf, size_t count,
+					   loff_t *fpos)
+{
+	struct fport **lane = fp->private_data;
+	struct fport *port = lane ? *lane : NULL;
+	struct tx_dcc_interp_override_get_rsp rsp = {};
+	char rd_buf[DCC_INTERP_OVERRIDE_BUF_SIZE];
+	size_t siz;
+
+	if (!port)
+		return -EINVAL;
+
+	if (ops_tx_dcc_interp_override_get(port->sd, port->lpn, lane_number(lane), &rsp))
+		return -EINVAL;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%u\n", rsp.value);
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t tx_dcc_interp_override_write(struct file *fp, const char __user *buf, size_t count,
+					    loff_t *fpos)
+{
+	struct fport **lane = fp->private_data;
+	struct fport *port = lane ? *lane : NULL;
+	u32 value;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	if (kstrtou32_from_user(buf, count, 0, &value))
+		return -EINVAL;
+
+	if (ops_tx_dcc_interp_override_set(port->sd, port->lpn, lane_number(lane), value, true))
+		return -EINVAL;
+
+	*fpos += count;
+	return count;
+}
+
+static ssize_t tx_dcc_interp_override_enable_read(struct file *fp, char __user *buf, size_t count,
+						  loff_t *fpos)
+{
+	struct fport **lane = fp->private_data;
+	struct fport *port = lane ? *lane : NULL;
+	struct tx_dcc_interp_override_enable_get_rsp rsp = {};
+	char rd_buf[DCC_INTERP_OVERRIDE_ENABLE_BUF_SIZE];
+	size_t siz;
+
+	if (!port)
+		return -EINVAL;
+
+	if (ops_tx_dcc_interp_override_enable_get(port->sd, port->lpn, lane_number(lane), &rsp))
+		return -EINVAL;
+
+	siz = scnprintf(rd_buf, sizeof(rd_buf), "%s\n", rsp.enable ? "Y" : "N");
+
+	return simple_read_from_buffer(buf, count, fpos, rd_buf, siz);
+}
+
+static ssize_t tx_dcc_interp_override_enable_write(struct file *fp, const char __user *buf,
+						   size_t count, loff_t *fpos)
+{
+	struct fport **lane = fp->private_data;
+	struct fport *port = lane ? *lane : NULL;
+	bool enable;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	if (kstrtobool_from_user(buf, count, &enable))
+		return -EINVAL;
+
+	if (ops_tx_dcc_interp_override_enable_set(port->sd, port->lpn, lane_number(lane),
+						  enable ? 1 : 0, true))
+		return -EINVAL;
+
+	*fpos += count;
+	return count;
+}
+
+static const struct file_operations tx_dcc_margin_params_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tx_dcc_margin_params_read,
+	.write = tx_dcc_margin_params_write
+};
+
+static const struct file_operations tx_dcc_interp_fops = {
+	.owner = THIS_MODULE,
+	.open = tx_dcc_interp_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations tx_dcc_index_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = tx_dcc_index_write
+};
+
+static const struct file_operations maint_mode_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = maint_mode_read,
+	.write = maint_mode_write
+};
+
+static const struct file_operations tx_dcc_interp_override_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tx_dcc_interp_override_read,
+	.write = tx_dcc_interp_override_write
+};
+
+static const struct file_operations tx_dcc_interp_override_enable_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = tx_dcc_interp_override_enable_read,
+	.write = tx_dcc_interp_override_enable_write
+};
+
+static void tx_dcc_margin_nodes_init(struct fport *port, struct dentry *debugfs_port_dir)
+{
+	struct dentry *tx_dcc_dir = debugfs_create_dir(TX_DCC_DIR_NAME, debugfs_port_dir);
+	u8 lane;
+
+	debugfs_create_file(MAINT_MODE_FILE_NAME, 0600, debugfs_port_dir, port, &maint_mode_fops);
+
+	debugfs_create_file(TX_DCC_MARGIN_PARAMS_FILE_NAME, 0600, tx_dcc_dir, port,
+			    &tx_dcc_margin_params_fops);
+
+	for (lane = 0; lane < LANES; lane++) {
+		char buf[MAX_TX_DCC_FILE_NAME_BUF_SIZE];
+
+		scnprintf(buf, sizeof(buf), TX_DCC_INTERP_FILE_NAME "_lane%u", lane);
+		debugfs_create_file(buf, 0400, tx_dcc_dir, &port->lanes_port[lane],
+				    &tx_dcc_interp_fops);
+
+		scnprintf(buf, sizeof(buf), TX_DCC_INDEX_FILE_NAME "_lane%u", lane);
+		debugfs_create_file(buf, 0200, tx_dcc_dir, &port->lanes_port[lane],
+				    &tx_dcc_index_fops);
+
+		scnprintf(buf, sizeof(buf), TX_DCC_INTERP_OVVL_FILE_NAME "_lane%u", lane);
+		debugfs_create_file(buf, 0600, tx_dcc_dir, &port->lanes_port[lane],
+				    &tx_dcc_interp_override_fops);
+
+		scnprintf(buf, sizeof(buf), TX_DCC_INTERP_OV_ENABLE_FILE_NAME "_lane%u", lane);
+		debugfs_create_file(buf, 0600, tx_dcc_dir, &port->lanes_port[lane],
+				    &tx_dcc_interp_override_enable_fops);
+	}
+}
+
+/**
+ * create_fabric_port_debugfs_files() - Add diagnostic nodes to a fabric port debugfs hierarchy
+ * @sd: sub device port directory (debugfs_port_dir) in debugfs to populate under
+ * @port: fabric port to reference
+ * Create debugfs nodes to query (and in the case of tx tuning parameters, set) SERDES-related
+ * information and LCB counters. They are removed recursively, so no matching remove function is
+ * needed.
+ */
+void create_fabric_port_debugfs_files(struct fsubdev *sd, struct fport *port)
+{
+	debugfs_create_file(PORT_SHOW_FILE_NAME, 0400, sd->debugfs_port_dir, port,
+			    &port_show_fops);
+
+	debugfs_create_file(LCB_COUNTERS_FILE_NAME, 0400, sd->debugfs_port_dir, port,
+			    &lcb_counters_fops);
+
+	if (test_bit(MBOX_OP_CODE_SERDES_HISTOGRAM_GET, port->sd->fw_version.supported_opcodes))
+		debugfs_create_file(SERDES_HISTOGRAM_FILE_NAME, 0400, sd->debugfs_port_dir, port,
+				    &serdes_histogram_fops);
+
+	if (test_bit(MBOX_OP_CODE_SERDES_EQINFO_GET, port->sd->fw_version.supported_opcodes))
+		debugfs_create_file(SERDES_EQINFO_FILE_NAME, 0400, sd->debugfs_port_dir, port,
+				    &serdes_eqinfo_fops);
+
+	if (test_bit(MBOX_OP_CODE_SERDES_CHEST_GET, port->sd->fw_version.supported_opcodes))
+		debugfs_create_file(SERDES_CHANNEL_ESTIMATION_FILE_NAME, 0400, sd->debugfs_port_dir,
+				    port, &serdes_channel_estimation_fops);
+
+	debugfs_create_file(REMOTE_TX_LANES_FILE_NAME, 0400, sd->debugfs_port_dir, port,
+			    &remote_lanes_fops);
+
+	enable_nodes_init(sd, port);
+
+	if (test_bit(MBOX_OP_CODE_VARIABLE_TABLE_READ, port->sd->fw_version.supported_opcodes))
+		tx_tuning_nodes_init(port, sd->debugfs_port_dir);
+
+	if (test_bit(MBOX_OP_CODE_SERDES_TX_DCC_MARGIN, port->sd->fw_version.supported_opcodes))
+		tx_dcc_margin_nodes_init(port, sd->debugfs_port_dir);
+}
+
+/*
+ * bridge port register debugfs functions
+ */
+
+#define BRG_FILE_NAME "stats_brg"
+#define RTP_FILE_NAME "stats_rtp"
+#define TPM_FILE_NAME "stats_tpm"
+#define RPM_FILE_NAME "stats_rpm"
+
+#define STATS_BUF_SIZE (PAGE_SIZE * 3)
+
+#define BRG_PERF_COUNT (((BRG_PERF_END - BRG_PERF_OFFSET) / sizeof(u64)) + 1)
+
+#define BRG_ERR_COUNT (((BRG_ERR_END - BRG_ERR_OFFSET) / sizeof(u64)) + 1)
+
+#define BRG_1_ERR_COUNT (((BRG_1_ERR_END - BRG_1_ERR_OFFSET) / sizeof(u64)) + 1)
+#define BRG_2_ERR_COUNT (((BRG_2_ERR_END - BRG_2_ERR_OFFSET) / sizeof(u64)) + 1)
+#define BRG_3_ERR_COUNT (((BRG_3_ERR_END - BRG_3_ERR_OFFSET) / sizeof(u64)) + 1)
+
+#define BRG_RTP_ERR_COUNT (((BRG_RTP_ERR_END - BRG_RTP_ERR_OFFSET) / sizeof(u64)) + 1)
+#define BRG_RTP_STS_COUNT_1 (((BRG_RTP_STS_END_1 - BRG_RTP_STS_START_1) / sizeof(u64)) + 1)
+#define BRG_RTP_STS_COUNT_2 (((BRG_RTP_STS_END_2 - BRG_RTP_STS_START_2) / sizeof(u64)) + 1)
+
+#define TPM_ERR_COUNT (((TPM_ERR_END - TPM_ERR_START) / sizeof(u64)) + 1)
+#define TPM_ERR_MBE_COUNT (((TPM_ERR_MBE_END - TPM_ERR_MBE_START) / sizeof(u64)) + 1)
+#define TPM_PRF_COUNT (((TPM_PRF_END - TPM_PRF_START) / sizeof(u64)) + 1)
+
+#define RPM_INQ_PORT0_ERR_COUNT \
+	(((RPM_INQ_PORT0_ERR_END - RPM_INQ_PORT0_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT1_ERR_COUNT \
+	(((RPM_INQ_PORT1_ERR_END - RPM_INQ_PORT1_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT2_ERR_COUNT \
+	(((RPM_INQ_PORT2_ERR_END - RPM_INQ_PORT2_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT3_ERR_COUNT \
+	(((RPM_INQ_PORT3_ERR_END - RPM_INQ_PORT3_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT4_ERR_COUNT \
+	(((RPM_INQ_PORT4_ERR_END - RPM_INQ_PORT4_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT5_ERR_COUNT \
+	(((RPM_INQ_PORT5_ERR_END - RPM_INQ_PORT5_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT6_ERR_COUNT \
+	(((RPM_INQ_PORT6_ERR_END - RPM_INQ_PORT6_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_PORT7_ERR_COUNT \
+	(((RPM_INQ_PORT7_ERR_END - RPM_INQ_PORT7_ERR_START) / sizeof(u64)) + 1)
+#define RPM_INQ_FLSTOR_ERR_COUNT \
+	(((RPM_INQ_FLSTOR_ERR_END - RPM_INQ_FLSTOR_ERR_START) / sizeof(u64)) + 1)
+
+#define RPM_PORT_STS_COUNT (((RPM_PORT_STS_END - RPM_PORT_STS_START) / sizeof(u64)) + 1)
+
+#define RPM_SBE_ERR_COUNTERS_COUNT \
+	(((RPM_SBE_ERR_COUNTERS_END - RPM_SBE_ERR_COUNTERS_START) / sizeof(u64)) + 1)
+#define RPM_MBE_ERR_COUNTERS_COUNT \
+	(((RPM_MBE_ERR_COUNTERS_END - RPM_MBE_ERR_COUNTERS_START) / sizeof(u64)) + 1)
+
+#define RPM_ARB_PERF_COUNTERS_COUNT \
+	(((RPM_ARB_PERF_COUNTERS_END - RPM_ARB_PERF_COUNTERS_START) / sizeof(u64)) + 1)
+
+#define RPM_PORT_ERR_COUNTERS_COUNT \
+	(((RPM_PORT_ERR_COUNTERS_END - RPM_PORT_ERR_COUNTERS_START) / sizeof(u64)) + 1)
+
+#define RPM_PERF_COUNTERS_COUNT \
+	(((RPM_PERF_COUNTERS_END - RPM_PERF_COUNTERS_START) / sizeof(u64)) + 1)
+
+static const char * const time_names[] = {
+	"NO_TIME",
+	"BRG_TIME",
+	"RTP_TIME",
+	"TPM_TIME",
+	"RPM_PORT_ERRS_TIME",
+	"RPM_TIME",
+};
+
+enum time_type {
+	NO_TIME,
+	BRG_TIME,
+	RTP_TIME,
+	TPM_TIME,
+	RPM_PORT_ERRS_TIME,
+	RPM_TIME,
+};
+
+struct regs_data {
+	DECLARE_MBDB_OP_PORT_STATUS_GET_RSP(regs_op, MAX_CSRS);
+} __packed;
+
+static struct mbdb_op_csr_range brg_csr_ranges[] = {
+	{ .offset = BRG_PERF_OFFSET, .num_csrs = BRG_PERF_COUNT, },
+	{ .offset = BRG_ERR_OFFSET, .num_csrs = BRG_ERR_COUNT, },
+	{ .offset = BRG_1_ERR_OFFSET, .num_csrs = BRG_1_ERR_COUNT, },
+	{ .offset = BRG_2_ERR_OFFSET, .num_csrs = BRG_2_ERR_COUNT, },
+	{ .offset = BRG_3_ERR_OFFSET, .num_csrs = BRG_3_ERR_COUNT, },
+};
+
+static struct mbdb_op_csr_range rtp_csr_ranges[] = {
+	{ .offset = BRG_RTP_ERR_OFFSET, .num_csrs = BRG_RTP_ERR_COUNT, },
+	{ .offset = BRG_RTP_STS_START_1, .num_csrs = BRG_RTP_STS_COUNT_1, },
+	{ .offset = BRG_RTP_STS_START_2, .num_csrs = BRG_RTP_STS_COUNT_2, },
+};
+
+static struct mbdb_op_csr_range tpm_csr_ranges[] = {
+	{ .offset = TPM_ERR_START, .num_csrs = TPM_ERR_COUNT, },
+	{ .offset = TPM_ERR_MBE_START, .num_csrs = TPM_ERR_MBE_COUNT, },
+	{ .offset = TPM_PRF_START, .num_csrs = TPM_PRF_COUNT, },
+};
+
+static struct mbdb_op_csr_range rpm_port_errs_csr_ranges[] = {
+	{ .offset = RPM_PORT_ERR_COUNTERS_START, .num_csrs = RPM_PORT_ERR_COUNTERS_COUNT, },
+};
+
+static struct mbdb_op_csr_range rpm_csr_ranges[] = {
+	{ .offset = RPM_INQ_PORT0_ERR_START, .num_csrs = RPM_INQ_PORT0_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT1_ERR_START, .num_csrs = RPM_INQ_PORT1_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT2_ERR_START, .num_csrs = RPM_INQ_PORT2_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT3_ERR_START, .num_csrs = RPM_INQ_PORT3_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT4_ERR_START, .num_csrs = RPM_INQ_PORT4_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT5_ERR_START, .num_csrs = RPM_INQ_PORT5_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT6_ERR_START, .num_csrs = RPM_INQ_PORT6_ERR_COUNT, },
+	{ .offset = RPM_INQ_PORT7_ERR_START, .num_csrs = RPM_INQ_PORT7_ERR_COUNT, },
+	{ .offset = RPM_INQ_FLSTOR_ERR_START, .num_csrs = RPM_INQ_FLSTOR_ERR_COUNT, },
+	{ .offset = RPM_SBE_ERR_COUNTERS_START, .num_csrs = RPM_SBE_ERR_COUNTERS_COUNT, },
+	{ .offset = RPM_MBE_ERR_COUNTERS_START, .num_csrs = RPM_MBE_ERR_COUNTERS_COUNT, },
+	{ .offset = RPM_ARB_PERF_COUNTERS_START, .num_csrs = RPM_ARB_PERF_COUNTERS_COUNT, },
+	{ .offset = RPM_PORT_STS_START, .num_csrs = RPM_PORT_STS_COUNT, },
+	{ .offset = RPM_PERF_COUNTERS_START, .num_csrs = RPM_PERF_COUNTERS_COUNT, },
+};
+
+static void regs_print_ranges(char *buf, size_t *buf_offset, struct mbdb_op_csr_range *csr_ranges,
+			      size_t csr_ranges_elements, struct regs_data *regs)
+{
+	size_t elem;
+	size_t i = 0;
+
+	for (elem = 0; elem < csr_ranges_elements; elem++) {
+		u32 addr = csr_ranges[elem].offset;
+		u32 end_addr = addr + (csr_ranges[elem].num_csrs * sizeof(u64));
+
+		while (addr < end_addr) {
+			print_diag(buf, buf_offset, STATS_BUF_SIZE, "0x%08x 0x%016llx\n",
+				   addr, regs->regs_op.regs[i++]);
+			addr += sizeof(u64);
+		}
+	}
+}
+
+static size_t regs_print(char *buf, size_t buf_offset, enum time_type time_name,
+			 size_t csr_ranges_sz, struct mbdb_op_csr_range *csr_ranges,
+			 struct regs_data *regs)
+{
+	print_diag(buf, &buf_offset, STATS_BUF_SIZE, "%-8s 0x%016llx\n", time_names[time_name],
+		   regs->regs_op.cp_free_run_rtc);
+
+	regs_print_ranges(buf, &buf_offset, csr_ranges, csr_ranges_sz, regs);
+
+	return buf_offset;
+}
+
+static struct regs_data *regs_query_data(struct fsubdev *sd, u8 lpn, size_t csr_ranges_sz,
+					 struct mbdb_op_csr_range *csr_ranges)
+{
+	struct regs_data *regs;
+
+	regs = kzalloc(sizeof(*regs), GFP_KERNEL);
+	if (!regs)
+		return NULL;
+
+	if (ops_port_status_get(sd, lpn, csr_ranges_sz, csr_ranges, &regs->regs_op)) {
+		kfree(regs);
+		return NULL;
+	}
+
+	return regs;
+}
+
+static int regs_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = inode->i_private;
+	struct regs_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[STATS_BUF_SIZE];
+	} *info;
+	struct mbdb_op_csr_range *csr_ranges[] = { NULL, NULL, NULL, };
+	enum time_type time_name[] = { NO_TIME, NO_TIME, NO_TIME, };
+	struct regs_data *regs[] = { NULL, NULL, NULL, };
+	struct dentry *dentry = F_DENTRY(file);
+	size_t csr_range_sz[] = { 0, 0, 0, };
+	int ret = 0;
+	int i;
+
+	if (!port)
+		return -EINVAL;
+
+	if (!strcmp(dentry->d_iname, BRG_FILE_NAME)) {
+		csr_ranges[0] = brg_csr_ranges;
+		csr_range_sz[0] = ARRAY_SIZE(brg_csr_ranges);
+		time_name[0] = BRG_TIME;
+	}
+
+	if (!strcmp(dentry->d_iname, RTP_FILE_NAME)) {
+		csr_ranges[0] = rtp_csr_ranges;
+		csr_range_sz[0] = ARRAY_SIZE(rtp_csr_ranges);
+		time_name[0] = RTP_TIME;
+	}
+
+	if (!strcmp(dentry->d_iname, TPM_FILE_NAME)) {
+		csr_ranges[0] = tpm_csr_ranges;
+		csr_range_sz[0] = ARRAY_SIZE(tpm_csr_ranges);
+		time_name[0] = TPM_TIME;
+	}
+
+	if (!strcmp(dentry->d_iname, RPM_FILE_NAME)) {
+		csr_ranges[0] = rpm_port_errs_csr_ranges;
+		csr_range_sz[0] = ARRAY_SIZE(rpm_port_errs_csr_ranges);
+		time_name[0] = RPM_PORT_ERRS_TIME;
+
+		csr_ranges[1] = rpm_csr_ranges;
+		csr_range_sz[1] = ARRAY_SIZE(rpm_csr_ranges);
+		time_name[1] = RPM_TIME;
+	}
+
+	for (i = 0; csr_ranges[i]; i++) {
+		regs[i] = regs_query_data(port->sd, port->lpn, csr_range_sz[i], csr_ranges[i]);
+		if (!regs[i]) {
+			ret = -EIO;
+			goto exit;
+		}
+	}
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	info->blob.data = &info->buf;
+
+	print_diag(info->buf, &info->blob.size, STATS_BUF_SIZE, "%-8s 0x%08x\n", "FABRIC_ID",
+		   port->sd->fdev->fabric_id);
+	print_diag(info->buf, &info->blob.size, STATS_BUF_SIZE, "%-8s %-u\n", "TILE_NUMBER",
+		   sd_index(port->sd));
+	print_diag(info->buf, &info->blob.size, STATS_BUF_SIZE, "%-3s %-u\n", "LPN", port->lpn);
+
+	for (i = 0; regs[i]; i++)
+		info->blob.size = regs_print(info->buf, info->blob.size, time_name[i],
+					     csr_range_sz[i], csr_ranges[i], regs[i]);
+
+	file->private_data = info;
+
+exit:
+	for (i = 0; regs[i]; i++)
+		kfree(regs[i]);
+
+	return ret;
+}
+
+static const struct file_operations regs_fops = {
+	.owner = THIS_MODULE,
+	.open = regs_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+/**
+ * create_bridge_port_debugfs_files() - Add diagnostic nodes to a bridge port debugfs hierarchy
+ * @sd: sub device port directory (debugfs_port_dir) in debugfs to populate under
+ * @port: bridge port to reference
+ *
+ * Create debugfs nodes to query They are removed recursively, so no matching remove function is
+ * needed.
+ */
+void create_bridge_port_debugfs_files(struct fsubdev *sd, struct fport *port)
+{
+	debugfs_create_file(BRG_FILE_NAME, 0400, sd->debugfs_port_dir, port, &regs_fops);
+	debugfs_create_file(RTP_FILE_NAME, 0400, sd->debugfs_port_dir, port, &regs_fops);
+	debugfs_create_file(TPM_FILE_NAME, 0400, sd->debugfs_port_dir, port, &regs_fops);
+	debugfs_create_file(RPM_FILE_NAME, 0400, sd->debugfs_port_dir, port, &regs_fops);
+}
+
+void create_port_debugfs_dir(struct fsubdev *sd, u8 lpn)
+{
+	char debugfs_dir_name[9] = {};
+
+	snprintf(debugfs_dir_name, ARRAY_SIZE(debugfs_dir_name), "port.%u", lpn);
+	sd->debugfs_port_dir = debugfs_create_dir(debugfs_dir_name, sd->debugfs_dir);
+}
diff --git a/drivers/gpu/drm/xe/fabric/port_diag.h b/drivers/gpu/drm/xe/fabric/port_diag.h
new file mode 100644
index 0000000000000..3091b89eeb8fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/port_diag.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2021 - 2022 Intel Corporation.
+ *
+ */
+
+#ifndef PORT_DIAG_H_INCLUDED
+#define PORT_DIAG_H_INCLUDED
+
+#include <linux/dcache.h>
+#include <linux/types.h>
+
+#include "iaf_drv.h"
+
+void create_fabric_port_debugfs_files(struct fsubdev *sd, struct fport *port);
+void create_bridge_port_debugfs_files(struct fsubdev *sd, struct fport *port);
+void create_port_debugfs_dir(struct fsubdev *sd, u8 lpn);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/routing_debug.c b/drivers/gpu/drm/xe/fabric/routing_debug.c
new file mode 100644
index 0000000000000..e11179a6b97f9
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_debug.c
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ *
+ */
+
+#include <linux/seq_file.h>
+
+#include "iaf_drv.h"
+#include "ops.h"
+#include "routing_debug.h"
+#include "routing_topology.h"
+
+#define BLOCK_UNINITIALIZED (~0ul)
+
+static struct fport *find_neighbor_by_lpn(struct fsubdev *sd, u8 lpn)
+{
+	struct fport *port;
+	struct fsubdev *nsd;
+
+	port = get_fport_handle(sd, lpn);
+	if (!port)
+		return NULL;
+
+	if (!port->portinfo->neighbor_guid || !port->portinfo->neighbor_port_number)
+		return NULL;
+
+	nsd = find_routable_sd(port->portinfo->neighbor_guid);
+	if (!nsd)
+		return NULL;
+
+	return get_fport_handle(nsd, port->portinfo->neighbor_port_number);
+}
+
+struct uft_iter {
+	unsigned long block;
+};
+
+static void uft_iter_end(struct uft_iter *iter)
+{
+	up_read(&routable_lock);
+	kfree(iter);
+}
+
+static void *uft_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct fport *port = s->private;
+	struct uft_iter *iter = v;
+	void *elem;
+
+	if (WARN_ON(IS_ERR_OR_NULL(iter)))
+		return iter;
+
+	if (iter->block == BLOCK_UNINITIALIZED) {
+		iter->block = 0;
+		elem = xa_find(&port->sd->routing.uft->bridges, &iter->block,
+			       ROUTING_DPA_DFID_MAP_SIZE, XA_PRESENT);
+	} else {
+		elem = xa_find_after(&port->sd->routing.uft->bridges, &iter->block,
+				     ROUTING_DPA_DFID_MAP_SIZE, XA_PRESENT);
+	}
+
+	if (!elem) {
+		uft_iter_end(iter);
+		iter = NULL;
+	}
+
+	if (pos)
+		(*pos)++;
+
+	return iter;
+}
+
+static void *uft_seq_to_pos(struct seq_file *s, void *v, const loff_t *pos)
+{
+	loff_t i = *pos;
+
+	while (i--) {
+		v = uft_seq_next(s, v, NULL);
+		if (!v)
+			return NULL;
+	}
+
+	return v;
+}
+
+static void *uft_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct fport *port = s->private;
+	struct uft_iter *iter;
+
+	if (!port->sd->routing.uft)
+		return NULL; /* eof */
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
+
+	iter->block = BLOCK_UNINITIALIZED;
+
+	down_read(&routable_lock); /* shared lock */
+
+	/*
+	 * from this point on, we must either next() to a final state, or
+	 * stop(), in order to clean up resources (via end())
+	 */
+
+	iter = uft_seq_to_pos(s, iter, pos);
+	if (!iter)
+		return NULL; /* eof */
+
+	return iter;
+}
+
+static void uft_seq_stop(struct seq_file *s, void *v)
+{
+	struct uft_iter *iter = v;
+
+	if (!IS_ERR_OR_NULL(v))
+		uft_iter_end(iter);
+}
+
+struct uft_seq_show_ctx {
+	struct seq_file *s;
+	struct fport *port;
+	struct uft_iter *iter;
+	struct mbdb_op_rpipe_get *rpipe;
+	u32 num_entries;
+	u32 len_rpipe;
+};
+
+static int uft_seq_show_init(struct uft_seq_show_ctx *ctx)
+{
+	/* allocate space for an rpipe for every port */
+	if (ctx->iter->block == BLOCK_UNINITIALIZED) {
+		/* first time through; print the mgmt block */
+		ctx->num_entries = ROUTING_MAX_DEVICES;
+		ctx->len_rpipe = sizeof(struct mbdb_op_rpipe_get) + ctx->num_entries;
+	} else {
+		/* after the mgmt block; print the nth bridge block */
+		ctx->num_entries = ROUTING_FID_BLOCK_SIZE;
+		ctx->len_rpipe = sizeof(struct mbdb_op_rpipe_get) + ctx->num_entries;
+	}
+
+	ctx->rpipe = kzalloc(sizeof(*ctx->rpipe) + ctx->num_entries, GFP_KERNEL);
+	if (!ctx->rpipe)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int uft_seq_show_query(struct uft_seq_show_ctx *ctx)
+{
+	int err;
+
+	if (ctx->iter->block == BLOCK_UNINITIALIZED) {
+		/* first time through; print the mgmt block */
+		ctx->rpipe->port_number = ctx->port->lpn;
+		ctx->rpipe->start_index = ROUTING_FID_CPORT_BASE;
+		ctx->rpipe->num_entries = ctx->num_entries;
+	} else {
+		/* after the mgmt block; print the nth bridge block */
+		ctx->rpipe->port_number = ctx->port->lpn;
+		ctx->rpipe->start_index = ROUTING_FID_BLOCK_BASE
+					+ ctx->iter->block * ROUTING_FID_BLOCK_SIZE;
+		ctx->rpipe->num_entries = ctx->num_entries;
+	}
+
+	err = ops_rpipe_get(ctx->port->sd, ctx->rpipe, ctx->rpipe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void uft_seq_show_render(struct uft_seq_show_ctx *ctx)
+{
+	struct fsubdev *nsd;
+	struct fport *nport;
+	u16 fid_offset;
+	u8 olpn;
+	u8 i;
+
+	/* print each dfid on one line */
+	for (fid_offset = 0; fid_offset < ctx->num_entries; ++fid_offset) {
+		/* don't print unrouted dfids */
+		olpn = ctx->rpipe->rpipe_data[fid_offset];
+		if (olpn == ROUTING_UFT_INVALID_PORT8)
+			continue;
+
+		/* print dfid row header */
+		seq_printf(ctx->s, "0x%04x %02u ", ctx->rpipe->start_index + fid_offset, olpn);
+
+		nport = find_neighbor_by_lpn(ctx->port->sd, olpn);
+		if (nport) {
+			/* case: external neighbor */
+			seq_printf(ctx->s, "%03u.%01u.%02u",
+				   nport->sd->fdev->pd->index, sd_index(nport->sd), nport->lpn);
+		} else if (olpn == 0) {
+			/* case: cport */
+			seq_printf(ctx->s, "%03u.%01u.cp",
+				   ctx->port->sd->fdev->pd->index, sd_index(ctx->port->sd));
+		} else if (olpn > PORT_FABRIC_COUNT) {
+			/* case: bridge: try to report the particular tile owning the dfid */
+			nsd = NULL;
+			for (i = 0; i < ctx->port->sd->fdev->pd->sd_cnt; ++i) {
+				if (ctx->port->sd->routing.fid_base == ctx->rpipe->start_index) {
+					nsd = ctx->port->sd;
+					break;
+				}
+			}
+			if (nsd) {
+				/* case: local package ("base die") */
+				seq_printf(ctx->s, "%03u.%01u.bd",
+					   nsd->fdev->pd->index, sd_index(nsd));
+			} else {
+				/* case: no owning tile? at least report the dev */
+				seq_printf(ctx->s, "%03u.-.bd",
+					   ctx->port->sd->fdev->pd->index);
+			}
+		} else {
+			/* case: invalid */
+			seq_puts(ctx->s, "---.-.--");
+		}
+
+		seq_puts(ctx->s, "\n");
+	}
+}
+
+static int uft_seq_show(struct seq_file *s, void *v)
+{
+	struct uft_seq_show_ctx ctx = {};
+	struct fport *port = s->private;
+	int err;
+
+	if (WARN_ON(!v || !port))
+		return -EINVAL;
+
+	/* no warn here; just means the read came in a bit early */
+	if (!port->sd)
+		return -EINVAL;
+
+	ctx.s = s;
+	ctx.port = port;
+	ctx.iter = v;
+
+	err = uft_seq_show_init(&ctx);
+	if (err)
+		goto end;
+
+	err = uft_seq_show_query(&ctx);
+	if (err)
+		goto end;
+
+	uft_seq_show_render(&ctx);
+
+end:
+	kfree(ctx.rpipe);
+	return err;
+}
+
+static const struct seq_operations uft_seq_ops = {
+	.start = uft_seq_start,
+	.next = uft_seq_next,
+	.stop = uft_seq_stop,
+	.show = uft_seq_show,
+};
+
+static int uft_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = WARN_ON(!inode) ? NULL : inode->i_private;
+	struct seq_file *s;
+	int err;
+
+	if (WARN_ON(!port))
+		return -EINVAL;
+
+	err = seq_open(file, &uft_seq_ops);
+	if (err)
+		return err;
+
+	s = file->private_data;
+	if (WARN_ON(!s)) {
+		seq_release(inode, file);
+		return -EINVAL;
+	}
+
+	s->private = port;
+	return 0;
+}
+
+/*
+ * outputs the unicast forwarding table with columns:
+ *   1. destination FID
+ *   2. output port
+ *   3. <dev_idx>.<subdev_idx>.<lpn> of the neighbor of this entry
+ *        - if the neighbor is over a fabric link: lpn will be the neighbor port
+ *        - if the neighbor is the cport: lpn will be "cp"
+ *        - if the neighbor is the base die: lpn will be "bd"
+ */
+static const struct file_operations uft_ops = {
+	.open = uft_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = seq_release,
+};
+
+struct dpa_iter {
+	struct fsubdev *sd_dst;
+};
+
+static void dpa_iter_end(struct dpa_iter *iter)
+{
+	up_read(&routable_lock);
+	kfree(iter);
+}
+
+static void *dpa_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct dpa_iter *iter = v;
+
+	if (WARN_ON(IS_ERR_OR_NULL(iter)))
+		return iter;
+
+	iter->sd_dst = routing_sd_next(iter->sd_dst, 0);
+	if (!iter->sd_dst) {
+		dpa_iter_end(iter);
+		iter = NULL;
+	}
+
+	if (pos)
+		(*pos)++;
+
+	return iter;
+}
+
+static void *dpa_seq_to_pos(struct seq_file *s, void *v, const loff_t *pos)
+{
+	loff_t i = *pos;
+
+	while (i--) {
+		v = dpa_seq_next(s, v, NULL);
+		if (!v)
+			return NULL;
+	}
+
+	return v;
+}
+
+static void *dpa_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct dpa_iter *iter;
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
+
+	iter->sd_dst = routing_sd_iter(0);
+	if (!iter->sd_dst) {
+		kfree(iter);
+		return ERR_PTR(-EINVAL);
+	}
+
+	down_read(&routable_lock); /* shared lock */
+
+	/*
+	 * from this point on, we must either next() to a final state, or
+	 * stop(), in order to clean up resources (via end())
+	 */
+
+	iter = dpa_seq_to_pos(s, iter, pos);
+	if (!iter)
+		return NULL; /* eof */
+
+	return iter;
+}
+
+static void dpa_seq_stop(struct seq_file *s, void *v)
+{
+	struct dpa_iter *iter = v;
+
+	if (!IS_ERR_OR_NULL(v))
+		dpa_iter_end(iter);
+}
+
+static int dpa_seq_show(struct seq_file *s, void *v)
+{
+	struct dpa_iter *iter = v;
+	struct fport *port = s->private;
+	size_t size = ROUTING_DEV_DPA_ALIGNMENT / ROUTING_MIN_DPA_PER_SD / 2 * sizeof(u64);
+	u64 *map;
+	u32 addr;
+	u32 len;
+	u64 dpa;
+	u16 dfid;
+	u16 i;
+	int err;
+
+	if (WARN_ON(!iter || !port))
+		return -EINVAL;
+
+	/* no warn here; just means the read came in a bit early */
+	if (!port->sd)
+		return -EINVAL;
+
+	map = kzalloc(size, GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	addr = CSR_FIDGEN_LUT_BASE + iter->sd_dst->routing.dpa_idx_base * sizeof(u64);
+	len = iter->sd_dst->routing.dpa_idx_range * sizeof(u64);
+
+	err = ops_linkmgr_port_csr_rd(port->sd, port->lpn, addr, len, map);
+	if (err) {
+		kfree(map);
+		return err;
+	}
+
+	for (i = 0; i < iter->sd_dst->routing.dpa_idx_range; ++i) {
+		dpa = (iter->sd_dst->routing.dpa_idx_base + i) * ROUTING_MIN_DPA_PER_SD;
+		dfid = (map[i] << ROUTING_DPA_DFID_MAP_SHIFT) & 0xffff;
+		seq_printf(s, "0x%016llx 0x%04x %03u.%01u",
+			   dpa, dfid, iter->sd_dst->fdev->pd->index,
+			   sd_index(iter->sd_dst));
+
+		seq_puts(s, "\n");
+	}
+
+	kfree(map);
+	return 0;
+}
+
+static const struct seq_operations dpa_seq_ops = {
+	.start = dpa_seq_start,
+	.next = dpa_seq_next,
+	.stop = dpa_seq_stop,
+	.show = dpa_seq_show,
+};
+
+static int dpa_open(struct inode *inode, struct file *file)
+{
+	struct fport *port = WARN_ON(!inode) ? NULL : inode->i_private;
+	struct seq_file *s;
+	int err;
+
+	if (WARN_ON(!port))
+		return -EINVAL;
+
+	err = seq_open(file, &dpa_seq_ops);
+	if (err)
+		return err;
+
+	s = file->private_data;
+	if (WARN_ON(!s)) {
+		seq_release(inode, file);
+		return -EINVAL;
+	}
+
+	s->private = port;
+	return 0;
+}
+
+/*
+ * outputs the dpa to fid map with columns:
+ *   1. full byte-addressed device physical address
+ *   2. destination FID
+ *   3. <dev_idx>.<subdev_idx> of the sd the driver associates with this entry
+ */
+static const struct file_operations dpa_ops = {
+	.open = dpa_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = seq_release,
+};
+
+void routing_debug_port_init(struct fsubdev *sd, u8 lpn)
+{
+	struct fport *port = &sd->port[lpn];
+
+	debugfs_create_file("uft", 0400, sd->debugfs_port_dir, port, &uft_ops);
+
+	if (test_bit(lpn, sd->bport_lpns))
+		debugfs_create_file("dpa", 0400, sd->debugfs_port_dir, port, &dpa_ops);
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_debug.h b/drivers/gpu/drm/xe/fabric/routing_debug.h
new file mode 100644
index 0000000000000..e22601f9011ea
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_debug.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ */
+
+#ifndef ROUTING_DEBUG_H_INCLUDED
+#define ROUTING_DEBUG_H_INCLUDED
+
+#include <linux/debugfs.h>
+
+#include "iaf_drv.h"
+
+void routing_debug_port_init(struct fsubdev *sd, u8 lpn);
+
+#endif /* ROUTING_DEBUG_H_INCLUDED */
+
diff --git a/drivers/gpu/drm/xe/fabric/routing_engine.c b/drivers/gpu/drm/xe/fabric/routing_engine.c
new file mode 100644
index 0000000000000..088f99d4511eb
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_engine.c
@@ -0,0 +1,565 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2022 Intel Corporation.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/sched/clock.h>
+#include <linux/wait.h>
+
+#include "debugfs.h"
+#include "port.h"
+#include "routing_engine.h"
+#include "routing_event.h"
+#include "routing_logic.h"
+#include "routing_io.h"
+#include "routing_p2p.h"
+#include "trace.h"
+
+#define DEBUGFS_ROUTING_ROOT_NAME "routing"
+#define DEBUGFS_ROUTING_STATUS_NAME "status"
+
+/**
+ * struct routing_context - tracks routing engine state
+ * @topo: the topology structure tracking per-sweep state
+ * @shutdown: true if the routing engine has been stopped
+ * @gen_start: the generation counter incremented at sweep start
+ * @gen_end: the generation counter incremented at sweep end
+ * @gen_wait: the wait queue associated with sweep sync
+ * @status: snapshot of routing status for query
+ *
+ * The start generation counter is incremented at the beginning of every
+ * sweep attempt, regardless of whether any previous sweep passed or failed.
+ *
+ * The end generation counter is incremented to match start at the end of a
+ * successful sweep attempt.
+ *
+ * For clients, if they make changes and then observe start == N, their changes
+ * may have raced with sweep N.  To confirm that their changes have taken
+ * effect, they want to wait until end > N, i.e. "at least one new sweep was
+ * scheduled and completed successfully after sweep N."
+ */
+struct routing_context {
+	struct routing_topology topo;
+	bool shutdown;
+	atomic_t gen_start;
+	atomic_t gen_end;
+	wait_queue_head_t gen_wait;
+	struct routing_status {
+		u64 serviced_requests;
+		u64 usec_logic;
+		u64 usec_io;
+		u64 usec_p2p;
+		int err;
+		u16 num_devs;
+		u16 num_sds_used;
+		u16 num_sds_total;
+		u16 num_ports_routed;
+		u16 num_ports_routable;
+		u16 num_ports_linkable;
+		u16 num_ports_total;
+		u16 num_planes;
+	} status;
+};
+
+static struct routing_context routing_context;
+
+static int debugfs_routing_status_open(struct inode *inode, struct file *file)
+{
+	struct routing_status *status = &routing_context.status;
+	struct routing_status_info {
+		struct debugfs_blob_wrapper blob;
+		char buf[256];
+	} *info;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	down_write(&routable_lock); /* exclusive lock */
+
+	info->blob.size = scnprintf(info->buf, ARRAY_SIZE(info->buf),
+				    "gs %d ge %d err %d d %u s %u %u p %u %u %u %u pl %u req %llu tl %llu ti %llu tp %llu\n",
+				    atomic_read(&routing_context.gen_start),
+				    atomic_read(&routing_context.gen_end),
+				    status->err, status->num_devs,
+				    status->num_sds_used, status->num_sds_total,
+				    status->num_ports_routed, status->num_ports_routable,
+				    status->num_ports_linkable, status->num_ports_total,
+				    status->num_planes, status->serviced_requests,
+				    status->usec_logic, status->usec_io, status->usec_p2p);
+
+	up_write(&routable_lock);
+
+	info->blob.data = info->buf;
+	file->private_data = info;
+
+	return 0;
+}
+
+static const struct file_operations debugfs_routing_status_ops = {
+	.owner = THIS_MODULE,
+	.open = debugfs_routing_status_open,
+	.read = blob_read,
+	.release = blob_release,
+	.llseek = default_llseek,
+};
+
+static int routing_policy_param;
+
+module_param_named(routing_policy, routing_policy_param, int, 0400);
+MODULE_PARM_DESC(routing_policy, "Determine the routing policy (0=default 1=resiliency 2=route-through)");
+
+static void topology_destroy(struct routing_topology *topo)
+{
+	struct routing_plane *plane, *plane_tmp;
+	struct fsubdev *sd;
+
+	list_for_each_entry(sd, &routable_list, routable_link)
+		routing_sd_destroy(sd);
+
+	list_for_each_entry_safe(plane, plane_tmp, &topo->plane_list, topo_link)
+		routing_plane_destroy(plane);
+}
+
+/**
+ * routing_init - Initializes the routing engine.
+ */
+void routing_init(void)
+{
+	struct routing_topology *topo = &routing_context.topo;
+	struct dentry *root;
+
+	switch (routing_policy_param) {
+	case ROUTING_POLICY_DEFAULT:
+		pr_info("routing policy: default\n");
+		break;
+	case ROUTING_POLICY_RESILIENCY:
+		pr_info("routing policy: resiliency\n");
+		break;
+	case ROUTING_POLICY_ROUTE_THROUGH:
+		pr_info("routing policy: route through\n");
+		break;
+	default:
+		pr_err("routing policy: invalid; using default\n");
+		routing_policy_param = ROUTING_POLICY_DEFAULT;
+		break;
+	}
+
+	init_waitqueue_head(&routing_context.gen_wait);
+
+	root = debugfs_create_dir(DEBUGFS_ROUTING_ROOT_NAME,
+				  get_debugfs_root_node());
+
+	debugfs_create_file(DEBUGFS_ROUTING_STATUS_NAME, 0400, root, NULL,
+			    &debugfs_routing_status_ops);
+
+	INIT_LIST_HEAD(&topo->plane_list);
+	topo->policy = routing_policy_param;
+
+	routing_p2p_init(root);
+}
+
+static void print_status(int err, u64 serviced_requests,
+			 u64 logic_nsecs, u64 io_nsecs, u64 p2p_nsecs)
+{
+	DECLARE_BITMAP(devs_seen, (ROUTING_MAX_DEVICES + 1) / 2) = {};
+	struct routing_status *status = &routing_context.status;
+	struct fsubdev *sd;
+	struct fport *port;
+	bool complete;
+	u8 lpn;
+
+	memset(status, 0, sizeof(*status));
+	status->num_planes = routing_context.topo.num_planes;
+	status->serviced_requests = serviced_requests;
+	status->usec_logic = logic_nsecs / 1000;
+	status->usec_io = io_nsecs / 1000;
+	status->usec_p2p = p2p_nsecs / 1000;
+	status->err = err;
+
+	list_for_each_entry(sd, &routable_list, routable_link) {
+		pr_debug("routing status: device %u sd %u state %u\n",
+			 sd->fdev->pd->index, sd_index(sd),
+			 sd->routing.state);
+
+		++status->num_sds_total;
+		if (!test_bit(sd->fdev->pd->index, devs_seen)) {
+			__set_bit(sd->fdev->pd->index, devs_seen);
+			++status->num_devs;
+		}
+
+		if (routing_sd_is_error(sd))
+			continue;
+
+		++status->num_sds_used;
+
+		for_each_fabric_port(port, lpn, sd) {
+			bool routable = port->routing.routable;
+			bool routed = port->routing.neighbor;
+
+			switch (port->port_type) {
+			case IAF_FW_PORT_TYPE_UNKNOWN:
+			case IAF_FW_PORT_TYPE_DISCONNECTED:
+				// disregard ports that are disabled for the sku
+				break;
+			case IAF_FW_PORT_TYPE_FIXED:
+			case IAF_FW_PORT_TYPE_VARIABLE:
+			case IAF_FW_PORT_TYPE_STANDARD:
+			case IAF_FW_PORT_TYPE_SI_PHOTONICS:
+				++status->num_ports_total;
+				break;
+			}
+
+			switch (port->state) {
+			case PM_PORT_STATE_INACTIVE:
+			case PM_PORT_STATE_ISOLATED:
+				// disregard ports that can't achieve link
+				break;
+			case PM_PORT_STATE_REQUESTED:
+			case PM_PORT_STATE_ARMED:
+			case PM_PORT_STATE_ACTIVE:
+				++status->num_ports_linkable;
+				break;
+			}
+
+			if (routable)
+				++status->num_ports_routable;
+			if (routed)
+				++status->num_ports_routed;
+
+			pr_debug("routing status: device %u sd %u port %u type %u state %u routable %u routed %u\n",
+				 sd->fdev->pd->index, sd_index(sd), port->lpn,
+				 port->port_type, port->state, routable, routed);
+		}
+	}
+
+	complete = status->num_ports_routed == status->num_ports_linkable;
+
+	pr_info("routing status: gen %d %s %s: devs %u sds %u/%u ports %u/%u/%u/%u planes %u\n",
+		atomic_read(&routing_context.gen_end), err ? "fail" : "pass",
+		complete ? "complete" : "partial", status->num_devs,
+		status->num_sds_used, status->num_sds_total,
+		status->num_ports_routed, status->num_ports_routable,
+		status->num_ports_linkable, status->num_ports_total,
+		status->num_planes);
+
+	pr_debug("routing status debug: reqs %llu logic %llu io %llu p2p %llu\n",
+		 status->serviced_requests, status->usec_logic, status->usec_io, status->usec_p2p);
+}
+
+/**
+ * cleanup_next - Cleanup the "next" versions of data structures generated
+ * during a sweep (generally when we're on an error path and won't be
+ * activating them).
+ */
+static void cleanup_next(void)
+{
+	struct fsubdev *sd;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0)) {
+		routing_uft_destroy(sd->routing.uft_next);
+		sd->routing.uft_next = NULL;
+
+		kfree(sd->routing.dfid_map_next);
+		sd->routing.dfid_map_next = NULL;
+	}
+}
+
+/*
+ * update_routed_status - Updates the "routed" field of all ports to reflect
+ * whether they are in use.
+ *
+ * Assumes sweep success.
+ *
+ * If a device is in the error state, its "routed" status will be forced to
+ * false here.  We don't do this at the moment of error transition to prevent
+ * the previous status from changing until a sweep has succeeded, ensuring the
+ * status correctly reflects that the fabric-wide routing is no longer using
+ * it.
+ */
+static void update_routed_status(void)
+{
+	struct fsubdev *sd;
+	struct fport *port;
+	u8 lpn;
+
+	/* enumerate ALL devices to handle forcing failed devices to false */
+	for (sd = routing_sd_iter(1); sd; sd = routing_sd_next(sd, 1)) {
+		for_each_fabric_port(port, lpn, sd) {
+			bool routed = !routing_sd_is_error(sd) &&
+				      port->routing.neighbor;
+
+			if (!routed)
+				list_del_init(&port->unroute_link);
+
+			atomic_set(&port->routed, routed);
+		}
+	}
+}
+
+/**
+ * routing_sweep - Perform routing calculation and programming.
+ * @serviced_requests: number of rem requests serviced at the time of route
+ * start
+ */
+void routing_sweep(u64 serviced_requests)
+{
+	u64 ref;
+	u64 logic_nsecs = 0;
+	u64 io_nsecs = 0;
+	u64 p2p_nsecs = 0;
+	int gen_start;
+	int err;
+
+	down_write(&routable_lock); /* exclusive lock */
+
+	gen_start = atomic_inc_return(&routing_context.gen_start);
+
+	pr_debug("routing start: gen %u\n", gen_start);
+
+	routing_topo_reset_sd_error(&routing_context.topo);
+
+	ref = local_clock();
+	err = routing_logic_run(&routing_context.topo);
+	logic_nsecs = local_clock() - ref;
+
+	downgrade_write(&routable_lock); /* downgrade to shared/read lock */
+
+	if (err) {
+		pr_err("failed to route fabric: %d\n", err);
+		cleanup_next();
+		goto finalize;
+	}
+
+	ref = local_clock();
+	err = routing_io_run();
+	io_nsecs = local_clock() - ref;
+
+	if (err) {
+		pr_err("failed to program fabric: %d\n", err);
+		cleanup_next();
+		goto finalize;
+	}
+
+	ref = local_clock();
+	routing_p2p_cache();
+	p2p_nsecs = local_clock() - ref;
+
+finalize:
+	/*
+	 * If any device transitioned to error, we likely have an inconsistent
+	 * fabric programmed, or at least may see a recovery on a resweep
+	 * due to the device being excluded.  Explicitly reschedule routing.
+	 *
+	 * Otherwise, device-agnostic routing errors with no change in device
+	 * error states are unlikely to be recoverable; skip explicit resweep
+	 * and just wait for normal event driven sweep signals.
+	 */
+	if (routing_topo_check_sd_error(&routing_context.topo)) {
+		pr_warn("device error during routing; scheduling resweep\n");
+		rem_request();
+	} else if (!err) {
+		update_routed_status();
+		atomic_set(&routing_context.gen_end,
+			   atomic_read(&routing_context.gen_start));
+		wake_up(&routing_context.gen_wait);
+	}
+
+	print_status(err, serviced_requests, logic_nsecs, io_nsecs, p2p_nsecs);
+	up_read(&routable_lock);
+}
+
+/**
+ * routing_stop - Stops the routing engine, but doesn't invalidate it.
+ */
+void routing_stop(void)
+{
+	routing_context.shutdown = true;
+	wake_up(&routing_context.gen_wait);
+}
+
+/**
+ * routing_destroy - Tears down the routing engine.
+ */
+void routing_destroy(void)
+{
+	topology_destroy(&routing_context.topo);
+}
+
+#define DPA_BITS order_base_2(ROUTING_MIN_DPA_PER_SD)
+
+/**
+ * fidgen_init - Fills out the bridge FIDGEN registers for DFID lookup.
+ * @fidgen: The fidgen struct to operate on.
+ *
+ * Assumes the incoming structure is zeroed.
+ *
+ * Mask A selects tile DPA ranges as indexes into the LUT.
+ * Mask B is unused.
+ * Mask D selects all hashable bits as hash input.
+ * Mask H selects all hashed path bits as modulo input.
+ * Modulo selects the maximum number of alternate paths from H.
+ * Net result is that we map each DPA range into 64 DFIDs.
+ */
+static void fidgen_init(struct routing_fidgen *fidgen)
+{
+	fidgen->mask_a = GENMASK_ULL(CSR_FIDGEN_LUT_INDEX_WIDTH, 0) << DPA_BITS;
+	fidgen->shift_a = DPA_BITS | FIELD_PREP(MASK_FIDGEN_SHIFT_RIGHT, 1);
+	fidgen->mask_h = GENMASK_ULL(63, 0);
+	fidgen->mask_d = GENMASK_ULL(DPA_BITS - 1, 0);
+	fidgen->modulo = 7;
+}
+
+/**
+ * routing_sd_init - Initializes the routing-specific data within a sd.
+ * @sd: The sd to initialize.
+ */
+void routing_sd_init(struct fsubdev *sd)
+{
+	/* shift from 1GB space in platform device to routing block size */
+	static const int shift = order_base_2(ROUTING_MIN_DPA_PER_SD) - 30;
+
+	u16 sd_size = sd->fdev->pd->dpa.pkg_size / sd->fdev->pd->sd_cnt;
+
+	WARN(sd_size & ((1u << shift) - 1),
+	     "package size not a multiple of the minimum DPA block size");
+
+	sd->routing.topo = &routing_context.topo;
+	sd->routing.state = TILE_ROUTING_STATE_VALID;
+	INIT_LIST_HEAD(&sd->routing.plane_link);
+
+	sd->routing.dpa_idx_range = sd_size >> shift;
+	sd->routing.dpa_idx_base = (sd->fdev->pd->dpa.pkg_offset >> shift) +
+				   (sd_index(sd) * sd->routing.dpa_idx_range);
+
+	sd->routing.fid_group = sd->fdev->pd->index * IAF_MAX_SUB_DEVS +
+				sd_index(sd);
+	sd->routing.fid_mgmt = ROUTING_FID_CPORT_BASE + sd->routing.fid_group;
+	sd->routing.fid_base = ROUTING_FID_BLOCK_BASE +
+			       ROUTING_FID_BLOCK_SIZE * sd->routing.fid_group;
+
+	fidgen_init(&sd->routing.fidgen);
+
+	pr_debug("device %u sd %u fid_mgmt 0x%04x fid_base 0x%04x\n",
+		 sd->fdev->pd->index, sd_index(sd),
+		 sd->routing.fid_mgmt, sd->routing.fid_base);
+
+	trace_rt_assign_fids(sd);
+}
+
+/**
+ * routing_sd_once - Performs one-time programming of the static subset of
+ * routing data.
+ * @sd: the subdevice to initialize
+ *
+ * Return: 0 on success, non-zero otherwise.
+ */
+int routing_sd_once(struct fsubdev *sd)
+{
+	int err;
+
+	err = routing_io_sd_once(sd);
+	if (err)
+		return err;
+
+	down_write(&routable_lock); /* exclusive lock */
+	list_add(&sd->routable_link, &routable_list);
+	up_write(&routable_lock);
+
+	return 0;
+}
+
+/**
+ * sweep_sync - Synchronously waits for a successful routing sweep.
+ *
+ * Note: will return without waiting during driver unload.
+ */
+static void sweep_sync(void)
+{
+	int target = atomic_read(&routing_context.gen_start) + 1;
+
+	if (rem_request())
+		wait_event_killable
+			(routing_context.gen_wait,
+			 routing_context.shutdown ||
+			 atomic_read(&routing_context.gen_end) >= target);
+}
+
+/**
+ * routing_dev_unroute - Synchronously ensures the device is no longer actively
+ * routed.
+ * @dev: fabric device
+ *
+ * Clears the routability of all ports on all subdevices of the device, then
+ * waits for a sweep to complete.
+ *
+ * Note that if the routing event manager has been disabled (the common case
+ * during driver unload), this will return without waiting for routing.
+ */
+void routing_dev_unroute(struct fdev *dev)
+{
+	struct fsubdev *sd;
+	struct fport *p;
+	bool changed = false;
+	u8 lpn;
+	u8 i;
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i) {
+		sd = dev->sd + i;
+
+		/* don't unroute that which can't be routed */
+		if (list_empty(&sd->routable_link))
+			continue;
+
+		for_each_fabric_port(p, lpn, sd)
+			changed |= test_and_clear_bit(PORT_CONTROL_ROUTABLE, p->controls);
+	}
+
+	if (changed)
+		sweep_sync();
+}
+
+/**
+ * routing_sd_destroy - Uninitializes the routing-specific data within a sd.
+ * @sd: The sd to destroy.
+ */
+void routing_sd_destroy(struct fsubdev *sd)
+{
+	down_write(&routable_lock); /* exclusive lock */
+
+	list_del_init(&sd->routable_link);
+	routing_sd_transition_error(sd);
+	memset(&sd->routing, 0, sizeof(sd->routing));
+
+	up_write(&routable_lock);
+}
+
+/**
+ * routing_port_routed_query - Returns port usage status.
+ * @sd: sd to operate on
+ * @port_mask: mask of ports to query
+ * @usage_mask: mask of usage by port
+ *
+ * The bits in both masks are logical port numbers, inclusive of port 0, and
+ * must be long enough to include the maximum fabric port number.
+ */
+void routing_port_routed_query(struct fsubdev *sd, unsigned long *port_mask,
+			       unsigned long *usage_mask)
+{
+	struct fport *port;
+	u8 lpn;
+
+	for_each_masked_port(port, lpn, sd->port, port_mask, PORT_COUNT)
+		if (port && atomic_read(&port->routed))
+			__set_bit(port->lpn, usage_mask);
+}
+
+void routing_generation_read(u32 *counter_start, u32 *counter_end)
+{
+	*counter_start = (u32)atomic_read(&routing_context.gen_start);
+	*counter_end = (u32)atomic_read(&routing_context.gen_end);
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_engine.h b/drivers/gpu/drm/xe/fabric/routing_engine.h
new file mode 100644
index 0000000000000..76223f2731252
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_engine.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_ENGINE_H_INCLUDED
+#define ROUTING_ENGINE_H_INCLUDED
+
+#include "routing_topology.h"
+
+void routing_init(void);
+void routing_stop(void);
+void routing_destroy(void);
+void routing_sweep(u64 serviced_requests);
+void routing_sd_init(struct fsubdev *sd);
+void routing_sd_destroy(struct fsubdev *sd);
+int routing_sd_once(struct fsubdev *sd);
+void routing_dev_unroute(struct fdev *dev);
+
+void routing_port_routed_query(struct fsubdev *sd, unsigned long *port_mask,
+			       unsigned long *usage_mask);
+void routing_generation_read(u32 *counter_start, u32 *counter_end);
+
+#endif /* ROUTING_ENGINE_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_event.c b/drivers/gpu/drm/xe/fabric/routing_event.c
new file mode 100644
index 0000000000000..fbbd5716bb836
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_event.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2022 Intel Corporation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/debugfs.h>
+
+#include "debugfs.h"
+#include "iaf_drv.h"
+#include "routing_event.h"
+#include "routing_engine.h"
+
+static bool routing_shutting_down;
+static bool routing_disable;
+static unsigned long routing_min_delay_ms = 1000;
+static unsigned long routing_max_delay_ms = 10000;
+
+enum rem_state {
+	REM_STATE_DISABLED = 0,
+	REM_STATE_IDLE,
+	REM_STATE_QUEUED,
+	REM_STATE_RUNNING
+};
+
+static DEFINE_MUTEX(rem_lock);
+static enum rem_state rem_state;
+static u64 rem_pending_requests;
+static u64 rem_serviced_requests;
+static unsigned long rem_last_route_jiffies;
+static struct delayed_work rem_routing_work;
+
+/**
+ * rem_schedule - Schedules routing work.
+ *
+ * Assumes caller holds the lock and has done the state checks required to
+ * validate a schedule attempt.
+ */
+static void rem_schedule(void)
+{
+	unsigned long now = jiffies;
+	unsigned long min_delay = msecs_to_jiffies(routing_min_delay_ms);
+	unsigned long max_delay = msecs_to_jiffies(routing_max_delay_ms);
+	unsigned long next = rem_last_route_jiffies + max_delay;
+	unsigned long delay;
+
+	if (time_after(next, now) && !routing_shutting_down) {
+		delay = next - now;
+		if (delay < min_delay)
+			delay = min_delay;
+	} else {
+		delay = min_delay;
+	}
+
+	queue_delayed_work(iaf_unbound_wq, &rem_routing_work, delay);
+
+	rem_state = REM_STATE_QUEUED;
+}
+
+static int rem_disable_change_callback(void)
+{
+	int ret = 0;
+
+	mutex_lock(&rem_lock);
+
+	switch (rem_state) {
+	case REM_STATE_DISABLED:
+		if (!routing_disable) {
+			rem_state = REM_STATE_IDLE;
+			if (rem_pending_requests != rem_serviced_requests)
+				rem_schedule();
+		}
+
+		break;
+	case REM_STATE_IDLE:
+		if (routing_disable)
+			rem_state = REM_STATE_DISABLED;
+		break;
+	default:
+		ret = -EBUSY;
+		break;
+	}
+
+	mutex_unlock(&rem_lock);
+
+	return ret;
+}
+
+static void routing_work_fn(struct work_struct *work)
+{
+	u64 serviced_requests;
+
+	if (rem_route_start(&serviced_requests))
+		return;
+
+	routing_sweep(serviced_requests);
+
+	rem_route_finish();
+}
+
+void rem_init(void)
+{
+	struct dentry *root_node = get_debugfs_root_node();
+
+	rem_state = routing_disable ? REM_STATE_DISABLED : REM_STATE_IDLE;
+	rem_last_route_jiffies = jiffies;
+	INIT_DELAYED_WORK(&rem_routing_work, routing_work_fn);
+
+	debugfs_create_u32("rem_state", 0400, root_node, &rem_state);
+	debugfs_create_u64("rem_pending_requests", 0400, root_node,
+			   &rem_pending_requests);
+	debugfs_create_u64("rem_serviced_requests", 0400, root_node,
+			   &rem_serviced_requests);
+	debugfs_create_ulong("rem_last_route_jiffies", 0400, root_node,
+			     &rem_last_route_jiffies);
+}
+
+void rem_shutting_down(void)
+{
+	routing_shutting_down = 1;
+}
+
+void rem_stop(void)
+{
+	routing_disable = 1;
+	rem_disable_change_callback();
+	cancel_delayed_work_sync(&rem_routing_work);
+}
+
+/**
+ * rem_request - Requests a routing sweep to be initiated.
+ *
+ * Return: true if routing was requested; false otherwise.
+ */
+bool rem_request(void)
+{
+	bool first;
+	bool requested = true;
+
+	mutex_lock(&rem_lock);
+
+	first = rem_pending_requests == rem_serviced_requests;
+	++rem_pending_requests;
+
+	switch (rem_state) {
+	case REM_STATE_DISABLED:
+		requested = false;
+		break;
+	case REM_STATE_IDLE:
+		if (first)
+			rem_schedule();
+		break;
+	default:
+		break;
+	}
+
+	mutex_unlock(&rem_lock);
+
+	return requested;
+}
+
+/**
+ * rem_route_start - Returns non-zero when starting was unsuccessful and the
+ * routing engine should not proceed; zero otherwise.
+ * @serviced_requests: number of rem requests serviced at the time of route
+ * start (output parameter)
+ *
+ * Return: Zero on success, non-zero otherwise.
+ */
+int rem_route_start(u64 *serviced_requests)
+{
+	u64 events;
+
+	mutex_lock(&rem_lock);
+
+	switch (rem_state) {
+	case REM_STATE_QUEUED:
+		rem_state = REM_STATE_RUNNING;
+		events = rem_pending_requests - rem_serviced_requests;
+		rem_serviced_requests = rem_pending_requests;
+		rem_last_route_jiffies = jiffies;
+		*serviced_requests = rem_serviced_requests;
+		pr_debug("routing fabric due to %llu events\n", events);
+		break;
+	default:
+		mutex_unlock(&rem_lock);
+		return -1;
+	}
+
+	mutex_unlock(&rem_lock);
+
+	return 0;
+}
+
+void rem_route_finish(void)
+{
+	u64 events;
+
+	mutex_lock(&rem_lock);
+
+	switch (rem_state) {
+	case REM_STATE_RUNNING:
+		events = rem_pending_requests - rem_serviced_requests;
+		if (routing_disable)
+			rem_state = REM_STATE_DISABLED;
+		else if (!events)
+			rem_state = REM_STATE_IDLE;
+		else
+			rem_schedule();
+		break;
+	default:
+		pr_warn("unexpected route finish in state %u\n", rem_state);
+		break;
+	}
+
+	mutex_unlock(&rem_lock);
+}
+
+static int rem_routing_disable_set(const char *val,
+				   const struct kernel_param *kp)
+{
+	bool cur = routing_disable;
+	int err;
+
+	err = param_set_bool(val, kp);
+	if (err)
+		return err;
+
+	err = rem_disable_change_callback();
+	if (err)
+		routing_disable = cur;
+
+	return err;
+}
+
+static const struct kernel_param_ops disable_ops = {
+	.set = rem_routing_disable_set,
+	.get = param_get_bool,
+};
+
+module_param_cb(routing_disable, &disable_ops, &routing_disable, 0600);
+MODULE_PARM_DESC(routing_disable, "Disables routing engine from automatically running (default: N) (bool)");
+
+module_param(routing_min_delay_ms, ulong, 0600);
+MODULE_PARM_DESC(routing_min_delay_ms, "Minimum delay for scheduling the routing engine in milliseconds (default: 1000)");
+
+module_param(routing_max_delay_ms, ulong, 0600);
+MODULE_PARM_DESC(routing_max_delay_ms, "Maximum delay for scheduling the routing engine in milliseconds (default: 10000)");
diff --git a/drivers/gpu/drm/xe/fabric/routing_event.h b/drivers/gpu/drm/xe/fabric/routing_event.h
new file mode 100644
index 0000000000000..85bc6789135f2
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_event.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_EVENT_H_INCLUDED
+#define ROUTING_EVENT_H_INCLUDED
+
+#include <linux/types.h>
+
+void rem_init(void);
+void rem_shutting_down(void);
+void rem_stop(void);
+bool rem_request(void);
+int rem_route_start(u64 *serviced_requests);
+void rem_route_finish(void);
+
+#endif /* ROUTING_EVENT_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_io.c b/drivers/gpu/drm/xe/fabric/routing_io.c
new file mode 100644
index 0000000000000..aeb42d9107cc2
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_io.c
@@ -0,0 +1,496 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+
+#include "csr.h"
+#include "ops.h"
+#include "parallel.h"
+#include "routing_io.h"
+#include "routing_pause.h"
+
+#define MAX_UFT_ENTRIES \
+	(MBOX_PARAM_AREA_IN_BYTES - sizeof(struct mbdb_op_rpipe_set))
+
+static void block_to_rpipe(u8 *rpipe, u8 *block, enum uft_sel sel, u16 len)
+{
+	u16 i;
+	u8 lpn;
+
+	for (i = 0; i < len; ++i) {
+		lpn = routing_uft_entry_get(block, sel, i);
+		rpipe[i] = lpn == ROUTING_UFT_INVALID_PORT4 ?
+			   ROUTING_UFT_INVALID_PORT8 : lpn;
+	}
+}
+
+static int rpipe_clear_block(struct fsubdev *sd, u32 port_mask,
+			     struct mbdb_op_rpipe_set *set, u16 fid_base,
+			     u16 fid_range)
+{
+	int err;
+
+	sd_dbg(sd, "writing base 0x%04x range %u\n", fid_base,
+	       fid_range);
+
+	if (fid_range > MAX_UFT_ENTRIES)
+		return -EINVAL;
+
+	set->port_mask = port_mask;
+	set->start_index = fid_base;
+	set->num_entries = fid_range;
+	memset(set->rpipe_data, ROUTING_UFT_INVALID_PORT8, fid_range);
+
+	err = ops_rpipe_set(sd, set, set, false);
+	if (err) {
+		sd_err(sd, "rpipe clear: set failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static u32 filter_mask(struct fsubdev *sd, enum uft_sel sel, u32 port_mask)
+{
+	u8 lpn;
+
+	switch (sel) {
+	case UFT_SEL_ORIGIN:
+		/* local sources only; exclude fabric ports */
+		for_each_fabric_lpn(lpn, sd)
+			port_mask &= ~BIT(lpn);
+		return port_mask;
+	case UFT_SEL_HOP:
+		/* fabric sources only; exclude cport and bridge ports */
+		port_mask &= ~CPORT_LPN_MASK;
+		for_each_bridge_lpn(lpn, sd)
+			port_mask &= ~BIT(lpn);
+		return port_mask;
+	case UFT_SEL_BOTH:
+		return port_mask;
+	}
+
+	return 0;
+}
+
+static int rpipe_write_block_sel(struct fsubdev *sd, u32 port_mask,
+				 struct mbdb_op_rpipe_set *set,
+				 u8 *block, enum uft_sel sel,
+				 u16 fid_base, u16 fid_range)
+{
+	int err;
+
+	sd_dbg(sd, "writing mask %08x sel %u base 0x%04x range %u\n",
+	       port_mask, sel, fid_base, fid_range);
+
+	set->port_mask = filter_mask(sd, sel, port_mask);
+	if (!set->port_mask)
+		return 0;
+
+	set->start_index = fid_base;
+	set->num_entries = fid_range;
+
+	block_to_rpipe(set->rpipe_data, block, sel, fid_range);
+
+	err = ops_rpipe_set(sd, set, set, false);
+	if (err) {
+		sd_err(sd, "rpipe write: set failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int rpipe_write_block(struct fsubdev *sd, u32 port_mask,
+			     struct mbdb_op_rpipe_set *set,
+			     u8 *block, u16 fid_base, u16 fid_range)
+{
+	int err;
+
+	if (fid_range > MAX_UFT_ENTRIES)
+		return -EINVAL;
+
+	err = rpipe_write_block_sel(sd, port_mask, set, block, UFT_SEL_ORIGIN,
+				    fid_base, fid_range);
+	if (err)
+		return err;
+
+	err = rpipe_write_block_sel(sd, port_mask, set, block, UFT_SEL_HOP,
+				    fid_base, fid_range);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static bool rpipe_bridge_changed(u8 *block_curr, unsigned long block_idx,
+				 struct routing_uft *uft_prev)
+{
+	u8 *block_prev;
+
+	if (!uft_prev)
+		return true;
+
+	block_prev = xa_load(&uft_prev->bridges, block_idx);
+	if (!block_prev)
+		return true;
+
+	return memcmp(block_curr, block_prev, ROUTING_FID_BLOCK_SIZE) != 0;
+}
+
+/**
+ * rpipe_write_bridge_update - Finds and writes rpipe entries for blocks in the
+ * newly computed UFT if they differ from the previous UFT.
+ * @sd: The sd to write to.
+ * @rpipe_buf: The mbdb op buffer to use.
+ * @port_mask: The mask of ports to write to.
+ *
+ * Return: Zero on success, non-zero otherwise.
+ */
+static int rpipe_write_bridge_update(struct fsubdev *sd,
+				     struct mbdb_op_rpipe_set *rpipe_buf,
+				     u32 port_mask)
+{
+	u8 *block;
+	u16 base;
+	unsigned long i;
+	int err;
+
+	xa_for_each(&sd->routing.uft_next->bridges, i, block) {
+		base = ROUTING_FID_BLOCK_BASE + i * ROUTING_FID_BLOCK_SIZE;
+
+		if (!rpipe_bridge_changed(block, i, sd->routing.uft))
+			continue;
+
+		err = rpipe_write_block(sd, port_mask, rpipe_buf, block, base,
+					ROUTING_FID_BLOCK_SIZE);
+		if  (err) {
+			sd_err(sd, "failed to write rpipe bridge block %u: %d",
+			       base, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * rpipe_write_bridge_remove - Finds and clears rpipe entries for blocks in the
+ * old/previous UFT that no longer exist in the newly computed UFT.
+ * @sd: The sd to write to.
+ * @rpipe_buf: The mbdb op buffer to use.
+ * @port_mask: The mask of ports to write to.
+ *
+ * Return: Zero on success, non-zero otherwise.
+ */
+static int rpipe_write_bridge_remove(struct fsubdev *sd,
+				     struct mbdb_op_rpipe_set *rpipe_buf,
+				     u32 port_mask)
+{
+	u8 *block;
+	u16 base;
+	unsigned long i;
+	int err;
+
+	xa_for_each(&sd->routing.uft->bridges, i, block) {
+		if (xa_load(&sd->routing.uft_next->bridges, i))
+			continue;
+
+		base = ROUTING_FID_BLOCK_BASE + i * ROUTING_FID_BLOCK_SIZE;
+
+		err = rpipe_clear_block(sd, port_mask, rpipe_buf, base,
+					ROUTING_FID_BLOCK_SIZE);
+		if  (err) {
+			sd_err(sd, "failed to write rpipe bridge block %u: %d",
+			       base, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int rpipe_write(struct fsubdev *sd)
+{
+	struct mbdb_op_rpipe_set *rpipe_buf;
+	size_t max_block_size = max(ROUTING_MAX_DEVICES,
+				    ROUTING_FID_BLOCK_SIZE);
+	size_t rpipe_size = struct_size(rpipe_buf, rpipe_data, max_block_size);
+	u32 port_mask = ~(~(u32)0 << sd->extended_port_cnt);
+	int err;
+
+	rpipe_buf = kzalloc(rpipe_size, GFP_KERNEL);
+	if (!rpipe_buf)
+		return -ENOMEM;
+
+	err = rpipe_write_block(sd, port_mask, rpipe_buf,
+				sd->routing.uft_next->mgmt,
+				ROUTING_FID_CPORT_BASE, ROUTING_MAX_DEVICES);
+	if (err) {
+		sd_err(sd, "failed to write rpipe mgmt block: %d\n", err);
+		goto exit;
+	}
+
+	err = rpipe_write_bridge_update(sd, rpipe_buf, port_mask);
+	if (err)
+		goto exit;
+
+	if (sd->routing.uft) {
+		err = rpipe_write_bridge_remove(sd, rpipe_buf, port_mask);
+		if (err)
+			goto exit;
+	}
+
+exit:
+	kfree(rpipe_buf);
+	return err;
+}
+
+static int write_port_pkgaddr(struct fsubdev *sd, u8 lpn)
+{
+	u64 addr_base = sd->fdev->pd->dpa.pkg_offset;
+	u64 addr_range = sd->fdev->pd->dpa.pkg_size;
+	u64 addr_csr = FIELD_PREP(MASK_BT_PAR_BASE, addr_base) |
+		       FIELD_PREP(MASK_BT_PAR_RANGE, addr_range);
+	int err;
+
+	err = ops_linkmgr_port_csr_wr(sd, lpn, CSR_BT_PKG_ADDR_RANGE,
+				      &addr_csr, sizeof(addr_csr), false);
+	if (err) {
+		dev_err(sd_dev(sd), "failed to set package address range: %d\n",
+			err);
+		return err;
+	}
+
+	return 0;
+}
+
+#define FIDGEN_BLOCK_SIZE 12
+
+/*
+ * Note that the FID isn't specific to current/next because it's invariant.
+ */
+static void build_fidgen_block(struct fsubdev *sd, u64 *data)
+{
+	data[0] = sd->routing.fidgen.mask_a;
+	data[1] = sd->routing.fidgen.shift_a;
+	data[2] = sd->routing.fidgen.mask_b;
+	data[3] = sd->routing.fidgen.shift_b;
+	data[4] = 0; /* rsvd0 */
+	data[5] = 0; /* rsvd1 */
+	data[6] = sd->routing.fidgen.mask_h;
+	data[7] = sd->routing.fidgen.shift_h;
+	data[8] = sd->routing.fidgen.modulo;
+	data[9] = sd->routing.fid_base >> ROUTING_DPA_DFID_MAP_SHIFT;
+	data[10] = sd->routing.fidgen.mask_d;
+	data[11] = 0; /* static random */
+}
+
+static int write_port_fidgen(struct fsubdev *sd, u8 lpn)
+{
+	u64 data[FIDGEN_BLOCK_SIZE];
+	u16 len = sizeof(data);
+	int err;
+
+	build_fidgen_block(sd, data);
+
+	err = ops_linkmgr_port_csr_wr(sd, lpn, CSR_FIDGEN_MASK_A, data, len, false);
+	if (err) {
+		dev_err(sd_dev(sd),
+			"failed to write fidgen block: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * check_port_activation - Checks that the port logical state is active.
+ * @sd: the subdevice to operate on
+ * @lpn: the bridge port lpn to check
+ *
+ * Return: 0 on success, negative errno otherwise.
+ *
+ * This only warns if a port is inactive, as this is an expected case for
+ * platforms running in standalone mode.  The KMD has no explicit dependencies
+ * on port state, and will continue to operate normally.
+ */
+static int check_port_activation(struct fsubdev *sd, u8 lpn)
+{
+	u32 result = 0;
+	int err;
+	u8 state;
+
+	err = ops_linkmgr_ps_get(sd, lpn, &result);
+	if (err) {
+		sd_err(sd, "p.%u: failed to get port state: %d\n",
+		       lpn, err);
+		return err;
+	}
+
+	state = FIELD_GET(PS_PPS_PORT_STATE, result);
+	if (state != IAF_FW_PORT_ACTIVE)
+		sd_info(sd, "p.%u: bridge port not active: result 0x%08x\n", lpn, result);
+
+	return 0;
+}
+
+static int write_port_dfid_map(struct fsubdev *sd, u8 lpn)
+{
+	u8 *data = sd->routing.dfid_map ? (u8 *)sd->routing.dfid_map->dfid
+					: NULL;
+	u8 *data_next = (u8 *)sd->routing.dfid_map_next->dfid;
+	u32 addr = CSR_FIDGEN_LUT_BASE;
+	u32 remaining = (sd->routing.topo->max_dpa_index + 1) * sizeof(u64);
+	u32 len;
+	int err;
+
+	while (remaining) {
+		len = min_t(u32, remaining, MBOX_WRITE_DATA_SIZE_IN_BYTES);
+
+		if (!data || memcmp(data, data_next, len)) {
+			err = ops_linkmgr_port_csr_wr(sd, lpn, addr, data_next,
+						      len, false);
+			if (err) {
+				dev_err(sd_dev(sd),
+					"failed to write fidgen top csrs: %d\n",
+					err);
+				return err;
+			}
+		}
+
+		addr += len;
+		data_next += len;
+		remaining -= len;
+
+		if (data)
+			data += len;
+	}
+
+	return 0;
+}
+
+static int bridge_write(struct fsubdev *sd)
+{
+	int err;
+	u8 lpn;
+
+	if (!sd->routing.dfid_map_next) {
+		sd_err(sd, "invalid dfid map");
+		return -EINVAL;
+	}
+
+	for_each_bridge_lpn(lpn, sd) {
+		err = write_port_dfid_map(sd, lpn);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int switchinfo_write(struct fsubdev *sd)
+{
+	struct mbdb_op_switchinfo si = sd->switchinfo;
+	int err;
+
+	si.lft_top = ROUTING_UFT_SIZE - 1;
+	err = ops_switchinfo_set(sd, &si, &si, false);
+	if (err) {
+		sd_err(sd, "failed to set switchinfo: %d\n", err);
+		return err;
+	}
+
+	sd->switchinfo = si;
+
+	return 0;
+}
+
+static void io_work_fn(void *ctx)
+{
+	struct fsubdev *sd = ctx;
+	int err;
+
+	err = rpipe_write(sd);
+	if (err)
+		goto err;
+
+	err = bridge_write(sd);
+	if (err)
+		goto err;
+
+	routing_update(sd);
+	return;
+
+err:
+	routing_sd_transition_error(sd);
+}
+
+int routing_io_run(void)
+{
+	struct routing_pause_ctx *quiesce_ctx;
+	struct par_group group;
+	struct fsubdev *sd;
+
+	quiesce_ctx = routing_pause_init();
+	if (!quiesce_ctx) {
+		pr_err("unable to initialize quiesce context; abandoning fabric programming\n");
+		return -EIO;
+	}
+
+	routing_pause_start(quiesce_ctx);
+
+	par_start(&group);
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0))
+		par_work_queue(&group, io_work_fn, sd);
+
+	par_wait(&group);
+
+	routing_pause_end(quiesce_ctx);
+
+	return 0;
+}
+
+/**
+ * routing_io_sd_once - Performs one-time programming of invariant data.
+ * @sd: the subdevice to initialize
+ *
+ * Return: 0 on success, non-zero otherwise.
+ *
+ * The specified subdevice must not yet be on the routable list, or routing
+ * must be blocked via the routing lock.
+ */
+int routing_io_sd_once(struct fsubdev *sd)
+{
+	int err;
+	u8 lpn;
+
+	err = switchinfo_write(sd);
+	if (err)
+		goto fail;
+
+	for_each_bridge_lpn(lpn, sd) {
+		err = write_port_fidgen(sd, lpn);
+		if (err)
+			goto fail;
+
+		err = write_port_pkgaddr(sd, lpn);
+		if (err)
+			goto fail;
+
+		err = check_port_activation(sd, lpn);
+		if (err)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	routing_sd_transition_error(sd);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_io.h b/drivers/gpu/drm/xe/fabric/routing_io.h
new file mode 100644
index 0000000000000..c3a6769690250
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_io.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_IO_H_INCLUDED
+#define ROUTING_IO_H_INCLUDED
+
+#include "routing_topology.h"
+
+int routing_io_run(void);
+int routing_io_sd_once(struct fsubdev *sd);
+
+#endif /* ROUTING_IO_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_logic.c b/drivers/gpu/drm/xe/fabric/routing_logic.c
new file mode 100644
index 0000000000000..ee898b8b75522
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_logic.c
@@ -0,0 +1,934 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bitfield.h>
+#include <linux/version.h>
+
+#include "csr.h"
+#include "routing_logic.h"
+#include "trace.h"
+
+/*
+ * Returns the bridge endpoint port index corresponding to the FID.
+ */
+static u8 fid_to_bridge_offset(u16 fid)
+{
+	return FIELD_GET(ROUTING_FID_MDFI_MASK, fid);
+}
+
+/*
+ * Returns the cost between the specified source and destination subdevices.
+ *
+ * Returns ROUTING_COST_INFINITE if the two do not share a plane.
+ */
+u16 routing_cost_lookup(struct fsubdev *sd_src, struct fsubdev *sd_dst)
+{
+	u16 i, j, n;
+
+	if (!sd_src->routing.plane ||
+	    sd_src->routing.plane != sd_dst->routing.plane)
+		return ROUTING_COST_INFINITE;
+
+	i = sd_src->routing.plane_index;
+	j = sd_dst->routing.plane_index;
+	n = sd_src->routing.plane->num_subdevs;
+
+	return sd_src->routing.plane->cost[i * n + j];
+}
+
+static void validate_routing_policy(struct routing_topology *topo,
+				    struct fsubdev *sd)
+{
+	switch (topo->policy) {
+	case ROUTING_POLICY_ROUTE_THROUGH:
+	case ROUTING_POLICY_RESILIENCY:
+		if (IS_ANR_STEP(sd, ANR_ARI_STEP_A0, ANR_ARI_STEP_A_LAST)) {
+			pr_err(DEV_SD_FMT
+			       "ASIC A-series rev is incompatible with the selected routing policy (%d)\n",
+			       sd->fdev->pd->index, sd_index(sd), topo->policy);
+			routing_sd_transition_error(sd);
+		}
+		break;
+	case ROUTING_POLICY_DEFAULT:
+		break;
+	}
+}
+
+/**
+ * init - Perform top-level scan of subdevices and initialize any necessary
+ * state.
+ * @topo: The topology to operate on.
+ */
+static void init(struct routing_topology *topo)
+{
+	struct fsubdev *sd;
+	struct fport *port;
+	u16 sd_max;
+	u8 lpn;
+
+	topo->max_dpa_index = 0;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0)) {
+		/* routing should never be running against a debug device */
+		if (WARN_ON(dev_is_runtime_debug(sd->fdev)))
+			continue;
+
+		pr_debug("device %u sd %u dpa_base 0x%04x dpa_range 0x%04x\n",
+			 sd->fdev->pd->index, sd_index(sd),
+			 sd->routing.dpa_idx_base, sd->routing.dpa_idx_range);
+
+		sd_max = sd->routing.dpa_idx_base +
+			 sd->routing.dpa_idx_range - 1;
+
+		if (topo->max_dpa_index < sd_max)
+			topo->max_dpa_index = sd_max;
+
+		for_each_fabric_port(port, lpn, sd)
+			port->routing.routable = port_is_routable(port);
+
+		validate_routing_policy(topo, sd);
+	}
+}
+
+/*
+ * Establishes the cached neighbor pointer for a single fabric port.
+ */
+static void process_neighbor(struct fsubdev *sd_src,
+			     struct fport *port_src)
+{
+	struct fsubdev *sd_dst;
+	struct fport *port_dst;
+	u64 nguid;
+
+	port_src->routing.neighbor = NULL;
+
+	if (!port_is_routable(port_src))
+		return;
+
+	if (!port_src->portinfo)
+		return;
+
+	nguid = port_src->portinfo->neighbor_guid;
+	if (!nguid || sd_src->guid == nguid)
+		return;
+
+	sd_dst = find_routable_sd(nguid);
+	if (!sd_dst)
+		return;
+
+	port_dst = get_fport_handle(sd_dst,
+				    port_src->portinfo->neighbor_port_number);
+	if (!port_dst)
+		return;
+
+	if (!port_is_routable(port_dst))
+		return;
+
+	if (!port_dst->portinfo)
+		return;
+	if (port_dst->portinfo->neighbor_guid != sd_src->guid)
+		return;
+	if (port_dst->portinfo->neighbor_port_number != port_src->lpn)
+		return;
+
+	port_src->routing.neighbor = port_dst;
+}
+
+/*
+ * Establishes the cached neighbor pointers across all sd fabric ports.
+ */
+static void process_neighbors(void)
+{
+	struct fsubdev *sd;
+	struct fport *port;
+	u8 lpn;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0))
+		for_each_fabric_port(port, lpn, sd)
+			process_neighbor(sd, port);
+}
+
+static struct routing_plane *plane_alloc(struct routing_topology *topo)
+{
+	struct routing_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+
+	if (!plane)
+		return NULL;
+
+	INIT_LIST_HEAD(&plane->topo_link);
+	INIT_LIST_HEAD(&plane->sd_list);
+	plane->index = topo->num_planes;
+	plane->topo = topo;
+
+	list_add_tail(&plane->topo_link, &topo->plane_list);
+	topo->num_planes++;
+
+	return plane;
+}
+
+/**
+ * routing_plane_destroy - Destroys and deallocs the specified plane.
+ * @plane: The plane to destroy.
+ *
+ * Tiles that were members of the plane have their plane assignment cleared,
+ * but otherwise remain in their present state.
+ */
+void routing_plane_destroy(struct routing_plane *plane)
+{
+	struct fsubdev *sd, *sd_next;
+
+	list_for_each_entry_safe(sd, sd_next, &plane->sd_list,
+				 routing.plane_link) {
+		list_del_init(&sd->routing.plane_link);
+		sd->routing.plane = NULL;
+		sd->routing.plane_index = 0;
+	}
+
+	list_del(&plane->topo_link);
+	plane->topo->num_planes--;
+
+	kfree(plane->cost);
+	kfree(plane);
+}
+
+/**
+ * plane_fail - Takes all subdevices in a plane to their error state, then
+ * destroys the plane.
+ * @plane: The plane to operate on.
+ */
+static void plane_fail(struct routing_plane *plane)
+{
+	struct fsubdev *sd, *sd_next;
+
+	/* _safe since the error trasitions remove subdevices from the plane */
+	list_for_each_entry_safe(sd, sd_next, &plane->sd_list,
+				 routing.plane_link)
+		routing_sd_transition_error(sd);
+
+	routing_plane_destroy(plane);
+}
+
+static void propagate_plane_entry(struct list_head *queue,
+				  struct routing_plane *plane,
+				  struct fsubdev *sd)
+{
+	struct fsubdev *sd_neighbor;
+	struct fport *port, *port_neighbor;
+	u8 lpn;
+
+	list_add_tail(&sd->routing.plane_link, &plane->sd_list);
+	sd->routing.plane_index = sd->routing.plane->num_subdevs++;
+
+	for_each_fabric_port(port, lpn, sd) {
+		port_neighbor = neighbor_of(port);
+		if (!port_neighbor)
+			continue;
+
+		sd_neighbor = port_neighbor->sd;
+		if (routing_sd_is_error(sd_neighbor) ||
+		    sd_neighbor->routing.plane)
+			continue;
+
+		sd_neighbor->routing.plane = plane;
+		list_add_tail(&sd_neighbor->routing.plane_link, queue);
+	}
+}
+
+/**
+ * propagate_plane - Propagates a plane to the specified sd's neighbors in a
+ * breadth-first manner.
+ * @plane: The current plane being searched.
+ * @root: The root sd of the search.
+ *
+ * Uses whether a given sd has a plane assigned as an indicator of whether it
+ * has been visited already.
+ */
+static void propagate_plane(struct routing_plane *plane,
+			    struct fsubdev *root)
+{
+	struct fsubdev *sd;
+	LIST_HEAD(queue);
+
+	trace_rt_plane(root);
+
+	list_add_tail(&root->routing.plane_link, &queue);
+
+	while (!list_empty(&queue)) {
+		sd = list_first_entry(&queue, struct fsubdev,
+				      routing.plane_link);
+		list_del_init(&sd->routing.plane_link);
+
+		pr_debug("plane %u device %u sd %u\n",
+			 sd->routing.plane->index, sd->fdev->pd->index,
+			 sd_index(sd));
+
+		propagate_plane_entry(&queue, plane, sd);
+	}
+}
+
+/*
+ * build_planes - Dynamically calculates the planes that exist on the fabric.
+ *
+ * It does this by a single linear top-level pass over all subdevices.  If the
+ * subdevice is unassigned to a plane, it allocates a new plane, and then
+ * propagates that plane to all of that subdevice's neighbors transitively by a
+ * breadth-first traversal.
+ *
+ * After propagating a plane, all subdevices on that plane have been visited
+ * and assigned, and all subdevices still unassigned correspond to new planes.
+ */
+static int build_planes(struct routing_topology *topo)
+{
+	struct routing_plane *plane, *plane_next;
+	struct fsubdev *sd;
+
+	list_for_each_entry_safe(plane, plane_next, &topo->plane_list,
+				 topo_link)
+		routing_plane_destroy(plane);
+
+	if (WARN_ON(topo->num_planes))
+		return -EINVAL;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0)) {
+		if (sd->routing.plane)
+			continue;
+
+		sd->routing.plane = plane_alloc(topo);
+		if (!sd->routing.plane) {
+			routing_sd_transition_error(sd);
+			return -ENOMEM;
+		}
+
+		propagate_plane(sd->routing.plane, sd);
+	}
+
+	return 0;
+}
+
+/**
+ * compute_cost_for_plane - Computes a cost matrix for the given plane.
+ * @plane: The plane to operate on.
+ *
+ * This is an N^2 matrix that encodes the cost between any source and
+ * destination sd by "plane index", or the per-plane index assigned to
+ * each sd during plane creation.
+ *
+ * Cost is currently hop distance, but could in the future be weighted
+ * by link width/speed, LQI, or other factors.
+ *
+ * Return: Zero on success, non-zero otherwise.
+ */
+static int compute_cost_for_plane(struct routing_plane *plane)
+{
+	struct fsubdev *sd;
+	struct fport *port, *port_neighbor;
+	u16 n = plane->num_subdevs;
+	size_t cost_size = sizeof(*plane->cost) * n * n;
+	u16 i, j, k;
+	u32 ij, ik, kj;
+	u16 value;
+	u8 lpn;
+
+	plane->cost = kmalloc(cost_size, GFP_KERNEL);
+	if (!plane->cost)
+		return -ENOMEM;
+
+	memset(plane->cost, 0xff, cost_size);
+
+	/* generate a single-hop cost matrix */
+	list_for_each_entry(sd, &plane->sd_list, routing.plane_link) {
+		i = sd->routing.plane_index;
+		plane->cost[i * n + i] = 0;
+		for_each_fabric_port(port, lpn, sd) {
+			port_neighbor = neighbor_of(port);
+			if (!port_neighbor)
+				continue;
+
+			j = port_neighbor->sd->routing.plane_index;
+			plane->cost[i * n + j] = 1;
+		}
+	}
+
+	/*
+	 * relax single-hop to multi-hop all-pairs shortest-path via
+	 * floyd-warshall
+	 */
+	for (k = 0; k < n; ++k) {
+		for (i = 0; i < n; ++i) {
+			if (i == k)
+				continue;
+			/* ik (u32) can hold UINT16_MAX*UINT16_MAX+UINT16_MAX */
+			ik = i * n + k;
+			if (plane->cost[ik] == ROUTING_COST_INFINITE)
+				continue;
+			for (j = 0; j < n; ++j) {
+				if (j == k || i == j)
+					continue;
+				/* kj (u32) can hold UINT16_MAX*UINT16_MAX+UINT16_MAX */
+				kj = k * n + j;
+				if (plane->cost[kj] == ROUTING_COST_INFINITE)
+					continue;
+				/* ij (u32) can hold UINT16_MAX*UINT16_MAX+UINT16_MAX */
+				ij = i * n + j;
+				value = plane->cost[ik] + plane->cost[kj];
+				if (plane->cost[ij] > value)
+					plane->cost[ij] = value;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void compute_costs(struct routing_topology *topo)
+{
+	struct routing_plane *plane, *plane_next;
+	int err;
+
+	list_for_each_entry_safe(plane, plane_next, &topo->plane_list,
+				 topo_link) {
+		err = compute_cost_for_plane(plane);
+		if (err) {
+			pr_err("%s: failed to compute cost matrix for plane %u: %d\n",
+			       __func__, plane->index, err);
+			plane_fail(plane);
+		}
+	}
+}
+
+static void set_dpa_lut(struct fsubdev *sd_src, struct fsubdev *sd_dst,
+			u16 dfid)
+{
+	u16 start = sd_dst->routing.dpa_idx_base;
+	/* end (u32) can hold UINT16_MAX+UINT16_MAX */
+	u32 end = start + sd_dst->routing.dpa_idx_range;
+	u32 i;
+
+	/* i (u32) can hold UINT16_MAX+UINT16_MAX+1 */
+	for (i = start; i < end; ++i) {
+		sd_src->routing.dfid_map_next->dfid[i] =
+			dfid >> ROUTING_DPA_DFID_MAP_SHIFT;
+		pr_debug("device %u sd %u to device %u sd %u: dpa_idx %d dfid 0x%04x\n",
+			 sd_src->fdev->pd->index, sd_index(sd_src),
+			 sd_dst->fdev->pd->index, sd_index(sd_dst), i, dfid);
+	}
+}
+
+static void map_addresses_for_sd_dst(struct fsubdev *sd_src,
+				     struct fsubdev *sd_dst)
+{
+	struct fdev *dev_dst;
+	struct fsubdev *neighbor;
+	u8 i;
+
+	/*
+	 * same-package addresses are invalid.
+	 * hw has no support for bridge->bridge data path, and we do not
+	 * support routing tiles within a package.
+	 */
+	if (sd_src->fdev == sd_dst->fdev) {
+		set_dpa_lut(sd_src, sd_dst, 0);
+		return;
+	}
+
+	/* directly accessibile addresses route normally */
+	if (routing_cost_lookup(sd_src, sd_dst) != ROUTING_COST_INFINITE) {
+		set_dpa_lut(sd_src, sd_dst, sd_dst->routing.fid_base);
+		return;
+	}
+
+	/*
+	 * indirectly accessibile dpas route via directly acessible
+	 * subdevices on the same package
+	 */
+	dev_dst = sd_dst->fdev;
+	for (i = 0; i < dev_dst->pd->sd_cnt; ++i) {
+		neighbor = &dev_dst->sd[i];
+		if (sd_dst == neighbor)
+			continue;
+		if (routing_sd_is_error(neighbor))
+			continue;
+		if (routing_cost_lookup(sd_src, neighbor) == ROUTING_COST_INFINITE)
+			continue;
+
+		set_dpa_lut(sd_src, sd_dst, neighbor->routing.fid_base);
+		return;
+	}
+}
+
+/**
+ * dfid_map_alloc - Allocates and initializes the DPA->DFID map.
+ * @topo: The topology to operate on.
+ *
+ * Return: A pointer to the dfid map struct, or NULL otherwise.
+ */
+static struct routing_dfid_map *dfid_map_alloc(struct routing_topology *topo)
+{
+	struct routing_dfid_map *dfid_map;
+	u16 dfid_count = topo->max_dpa_index + 1;
+
+	dfid_map = kzalloc(struct_size(dfid_map, dfid, dfid_count),
+			   GFP_KERNEL);
+	if (!dfid_map)
+		return NULL;
+
+	dfid_map->size = dfid_count;
+
+	return dfid_map;
+}
+
+/**
+ * map_addresses_for_sd - Build the DPA-to-DFID map.
+ * @topo: The topology to operate on.
+ * @sd_src: The source sd.
+ *
+ * For each source/dest pair, if the destination is accessible according to
+ * the routing rules, map the destination's address to the destination's DFID.
+ * If the destination is not accessible, attempt to find the first sd on the
+ * destination device that is, and use it instead.
+ *
+ * Currently specific to point-to-point without route-through, where
+ * "accessible" is defined as reachable in a single hop.
+ */
+static void map_addresses_for_sd(struct routing_topology *topo,
+				 struct fsubdev *sd_src)
+{
+	struct fsubdev *sd_dst;
+	struct routing_dfid_map *dfid_map;
+
+	dfid_map = dfid_map_alloc(topo);
+	if (!dfid_map) {
+		routing_sd_transition_error(sd_src);
+		return;
+	}
+
+	sd_src->routing.dfid_map_next = dfid_map;
+
+	for (sd_dst = routing_sd_iter(0); sd_dst;
+	     sd_dst = routing_sd_next(sd_dst, 0))
+		map_addresses_for_sd_dst(sd_src, sd_dst);
+}
+
+/**
+ * map_addresses - Build the DPA-to-DFID maps for all devices.
+ * @topo: The topology to operate on.
+ */
+static void map_addresses(struct routing_topology *topo)
+{
+	struct fsubdev *sd;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0))
+		map_addresses_for_sd(topo, sd);
+}
+
+/**
+ * find_next_port - Finds the next applicable output port for routing
+ * table generation.
+ * @sd_src: source subdevice
+ * @sd_dst: destination subdevice
+ * @sel: UFT source selector
+ * @ports: array of ports to select from
+ * @num_ports: length of the ports array
+ * @curr_port: input/output param indicating the current port array index
+ * @reuse_port: whether to resuse the last used port (A series modulo WA)
+ *
+ * Return: The next available port to use for routing table generation.
+ *
+ * Port selection assumes the incoming port list already eliminates
+ * routes not valid for the policy.
+ *
+ * Port selection by policy:
+ *   DEFAULT:
+ *     round robin
+ *   RESILIENCY:
+ *     route fabric source via direct only
+ *     route bridge source:
+ *       direct if possible
+ *       else round robin
+ *   ROUTE_THROUGH:
+ *     route fabric source via direct only
+ *     route bridge source:
+ *       round robin
+ */
+static u8 find_next_port(struct fsubdev *sd_src, const struct fsubdev *sd_dst, enum uft_sel sel,
+			 const u8 *ports, u8 num_ports, u8 *curr_port, bool reuse_port)
+{
+	struct fport *port;
+	u8 first_port = *curr_port;
+	u8 lpn;
+
+	if (reuse_port)
+		return ports[*curr_port];
+
+	do {
+		lpn = ports[*curr_port];
+		*curr_port = (*curr_port + 1) % num_ports;
+		switch (sel) {
+		case UFT_SEL_ORIGIN:
+			/* from bridge: allow to any port in the list */
+			return lpn;
+		case UFT_SEL_HOP:
+			/* from fabric: allow only to direct destinations */
+			if (test_bit(lpn, sd_src->bport_lpns))
+				return lpn;
+			port = get_fport_handle(sd_src, lpn);
+			if (!port || !port->routing.neighbor)
+				continue;
+			if (port->routing.neighbor->sd == sd_dst)
+				return lpn;
+			break;
+		case UFT_SEL_BOTH:
+		default:
+			/* no support for routing BOTH using port lists */
+			return ROUTING_UFT_INVALID_PORT4;
+		}
+	} while (*curr_port != first_port);
+
+	return ROUTING_UFT_INVALID_PORT4;
+}
+
+/**
+ * unicast_route_pair_once - Programs a specific DFID offset using the
+ *   specified context, and updates the index state accordingly.
+ * @sd_src: the source subdevice
+ * @sd_dst: the destination subdevice
+ * @block: the UFT block being routed
+ * @ports: the array of sd_src ports being routed over
+ * @num_ports: number of valid ports in the ports array
+ * @idx_origin: the current index into the ports list for the origin uft
+ * @idx_hop: the current index into the ports list for the hop uft
+ * @dfid_base: the dfid corresponding to block offset 0
+ * @dfid_offset: the uft block offset being programmed
+ * @reuse_port: whether to resuse the last used port (A series modulo WA)
+ */
+static void unicast_route_pair_once(struct fsubdev *sd_src, struct fsubdev *sd_dst, u8 *block,
+				    u8 *ports, u8 num_ports, u8 *idx_origin, u8 *idx_hop,
+				    u16 dfid_base, u16 dfid_offset, bool reuse_port)
+{
+	u8 lpn_origin;
+	u8 lpn_hop;
+
+	lpn_origin = find_next_port(sd_src, sd_dst, UFT_SEL_ORIGIN,
+				    ports, num_ports, idx_origin, reuse_port);
+	if (lpn_origin == ROUTING_UFT_INVALID_PORT4)
+		return;
+
+	routing_uft_entry_set(block, UFT_SEL_ORIGIN, dfid_offset, lpn_origin);
+
+	lpn_hop = find_next_port(sd_src, sd_dst, UFT_SEL_HOP,
+				 ports, num_ports, idx_hop, reuse_port);
+	if (lpn_hop == ROUTING_UFT_INVALID_PORT4)
+		return;
+
+	routing_uft_entry_set(block, UFT_SEL_HOP, dfid_offset, lpn_hop);
+
+	trace_rt_pair(sd_src->fdev->pd->index, sd_index(sd_src),
+		      dfid_base + dfid_offset, lpn_origin, lpn_hop);
+}
+
+/**
+ * unicast_route_pair_via - Route all remote DFIDs of the dest device via a
+ * specific list of egress ports.
+ * @uft: The unicast forwarding table to update.
+ * @sd_src: The source sd being routed.
+ * @sd_dst: The destination sd being routed.
+ * @ports: The array of outbound ports on the source that point to the
+ *         destination.
+ * @num_ports: The size of the ports array.
+ *
+ * Return: Zero on success; negative otherwise.
+ */
+static int unicast_route_pair_via(struct routing_uft *uft,
+				  struct fsubdev *sd_src,
+				  struct fsubdev *sd_dst,
+				  u8 *ports, u8 num_ports)
+{
+	bool is_astep = IS_ANR_STEP(sd_src, ANR_ARI_STEP_A0, ANR_ARI_STEP_A_LAST);
+	bool reuse_port;
+	u8 *block;
+	u16 fid;
+	u8 mdfi;
+	u8 path;
+	u8 idx_origin = 0;
+	u8 idx_hop = 0;
+
+	if (WARN_ON(!num_ports))
+		return -EINVAL;
+
+	/* route the cport/mgmt fid */
+	unicast_route_pair_once(sd_src, sd_dst, uft->mgmt, ports, num_ports,
+				&idx_origin, &idx_hop, sd_dst->routing.fid_mgmt,
+				sd_dst->routing.fid_mgmt - ROUTING_FID_CPORT_BASE, false);
+
+	block = routing_uft_bridge_get(uft, sd_dst);
+	if (!block)
+		return -ENOMEM;
+
+	/*
+	 * reset the indices after routing the cport/mgmt fid, as we don't
+	 * consider management traffic when balancing data traffic
+	 */
+	idx_origin = 0;
+	idx_hop = 0;
+
+	/*
+	 * stripe FIDs over available ports
+	 *
+	 * assign the FIDs in channel order to prevent any one channel
+	 * from not spreading out over the port space efficiently
+	 */
+	for (mdfi = 0; mdfi < ROUTING_FID_NUM_CHANNELS; ++mdfi) {
+		for (path = 0; path < ROUTING_FID_NUM_PATHS; ++path) {
+			/* fid as an offset from the base fid */
+			fid = FIELD_PREP(ROUTING_FID_PATH_MASK, path) |
+			      FIELD_PREP(ROUTING_FID_MDFI_MASK, mdfi);
+
+			/*
+			 * on ANR A0, FIDs will never use the highest path due
+			 * to a HW modulus bug.
+			 *
+			 * we'll assign these FIDs, but skip factoring them
+			 * into the accounting by simply not incrementing the
+			 * index (i.e. the next fid will overlap it)
+			 */
+			reuse_port = is_astep && path == ROUTING_FID_NUM_PATHS - 1;
+
+			unicast_route_pair_once(sd_src, sd_dst, block, ports,
+						num_ports, &idx_origin, &idx_hop,
+						sd_dst->routing.fid_base, fid, reuse_port);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * unicast_route_pair - Route all remote DFIDs of the dest device over fabric
+ * ports of the source device.
+ * @uft: The unicast forwarding table to update.
+ * @sd_src: The source sd being routed.
+ * @sd_dst: The destination sd being routed.
+ *
+ * Return: Zero on success; negative otherwise.
+ */
+static int unicast_route_pair(struct routing_uft *uft,
+			      struct fsubdev *sd_src,
+			      struct fsubdev *sd_dst)
+{
+	struct fport *port_src;
+	struct fport *port_next;
+	enum routing_policy policy = sd_src->routing.topo->policy;
+	u8 ports[PORT_FABRIC_COUNT] = {};
+	u8 indirect_ports[PORT_FABRIC_COUNT] = {};
+	u8 num_ports = 0;
+	u8 num_indirect = 0;
+	u8 lpn;
+
+	/* determine candidate ports to destination */
+	for_each_fabric_port(port_src, lpn, sd_src) {
+		port_next = neighbor_of(port_src);
+		if (!port_next)
+			continue;
+
+		if (port_next->sd == sd_dst)
+			ports[num_ports++] = lpn;
+		else if (routing_cost_lookup(port_next->sd, sd_dst) == 1)
+			indirect_ports[num_indirect++] = lpn;
+	}
+
+	/* leave unreachable destinations with invalid routes */
+	if (!num_ports && !num_indirect) {
+		pr_debug("no egress ports found: device %u sd %u to device %u sd %u\n",
+			 sd_src->fdev->pd->index, sd_index(sd_src),
+			 sd_dst->fdev->pd->index, sd_index(sd_dst));
+		return 0;
+	}
+
+	/* a port should end up on one of the two lists; never both */
+	if (WARN_ON(num_ports + num_indirect > PORT_FABRIC_COUNT))
+		return -EINVAL;
+
+	/* select/validate final port list based on routing policy */
+	switch (policy) {
+	case ROUTING_POLICY_ROUTE_THROUGH:
+		/* route through uses direct and indirect paths freely */
+		memcpy(ports + num_ports, indirect_ports, num_indirect);
+		num_ports += num_indirect;
+		break;
+	case ROUTING_POLICY_RESILIENCY:
+		/* resiliency only uses indirect if direct not available */
+		if (!num_ports && num_indirect) {
+			memcpy(ports, indirect_ports, num_indirect);
+			num_ports = num_indirect;
+		}
+		break;
+	case ROUTING_POLICY_DEFAULT:
+	default:
+		/* default relies on only direct paths */
+		if (!num_ports) {
+			pr_debug("no egress ports found: device %u sd %u to device %u sd %u\n",
+				 sd_src->fdev->pd->index, sd_index(sd_src),
+				 sd_dst->fdev->pd->index, sd_index(sd_dst));
+			return 0;
+		}
+		break;
+	}
+
+	/* submit final non-empty port list to uft writer */
+	return unicast_route_pair_via(uft, sd_src, sd_dst, ports, num_ports);
+}
+
+#if KERNEL_VERSION(6, 1, 0) > LINUX_VERSION_CODE
+#ifndef BPM_FIND_NTH_BIT_PRESENT
+static int find_nth_bit(unsigned long *mask, unsigned long len, unsigned long n)
+{
+	int bit = find_first_bit(mask, len);
+
+	if (bit == len)
+		return len;
+
+	while (n--) {
+		bit = find_next_bit(mask, len, bit + 1);
+		if (bit == len)
+			return len;
+	}
+
+	return bit;
+}
+#endif
+#endif
+
+/**
+ * unicast_route_local - Route the FIDs local to the sd via the bridge ports.
+ * @uft: The unicast forwarding table to update.
+ * @sd_src: The source sd being routed.
+ *
+ * Return: Zero on success; negative otherwise.
+ */
+static int unicast_route_local(struct routing_uft *uft, struct fsubdev *sd_src)
+{
+	u8 *block;
+	u16 fid;
+	u16 base;
+	u8 bridge_offset;
+	u8 port;
+
+	routing_uft_entry_set(uft->mgmt, UFT_SEL_BOTH,
+			      sd_src->routing.fid_mgmt -
+			      ROUTING_FID_CPORT_BASE, 0);
+
+	trace_rt_local(sd_src->fdev->pd->index, sd_index(sd_src),
+		       sd_src->routing.fid_mgmt, 0, 0);
+
+	block = routing_uft_bridge_get(uft, sd_src);
+	if (!block)
+		return -ENOMEM;
+
+	for (fid = 0; fid < ROUTING_FID_BLOCK_SIZE; ++fid) {
+		if (!is_valid_fid(fid)) {
+			routing_uft_entry_set(block, UFT_SEL_BOTH, fid, ROUTING_UFT_INVALID_PORT4);
+			continue;
+		}
+
+		base = sd_src->routing.fid_base;
+		bridge_offset = fid_to_bridge_offset(base + fid);
+		/* find_nth_bit() result will always be in range 0..PORT_COUNT */
+		port = (u8)find_nth_bit(sd_src->bport_lpns, PORT_COUNT, bridge_offset);
+		if (unlikely(port == PORT_COUNT))
+			continue;
+
+		routing_uft_entry_set(block, UFT_SEL_BOTH, fid, port);
+
+		trace_rt_local(sd_src->fdev->pd->index,
+			       sd_index(sd_src), fid, port, port);
+	}
+
+	return 0;
+}
+
+/**
+ * unicast_route_src - Route all FIDs accessible from a given sd.
+ * @sd_src: The source sd being routed.
+ */
+static void unicast_route_src(struct fsubdev *sd_src)
+{
+	struct fsubdev *sd_dst;
+	int err;
+
+	sd_src->routing.uft_next = routing_uft_alloc();
+	if (!sd_src->routing.uft_next)
+		goto err;
+
+	for (sd_dst = routing_sd_iter(0); sd_dst;
+	     sd_dst = routing_sd_next(sd_dst, 0)) {
+		if (sd_src == sd_dst)
+			continue;
+		if (routing_cost_lookup(sd_src, sd_dst) ==
+						ROUTING_COST_INFINITE)
+			continue;
+		err = unicast_route_pair(sd_src->routing.uft_next,
+					 sd_src, sd_dst);
+		if (err)
+			goto err;
+	}
+
+	err = unicast_route_local(sd_src->routing.uft_next, sd_src);
+	if (err)
+		goto err;
+
+	return;
+
+err:
+	routing_sd_transition_error(sd_src);
+}
+
+/**
+ * unicast_routing - Route all FIDs across all devices.
+ */
+static void unicast_routing(void)
+{
+	struct fsubdev *sd;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0))
+		unicast_route_src(sd);
+}
+
+/**
+ * routing_logic_run - Fully programs/routes the specified topology in the
+ * manner of a one-time programming.
+ * @topo: The topology to program/route.
+ *
+ * Return: Zero on success, non-zero otherwise.
+ */
+int routing_logic_run(struct routing_topology *topo)
+{
+	int err;
+
+	pr_debug("initialize sweep\n");
+	init(topo);
+
+	pr_debug("process neighbors\n");
+	process_neighbors();
+
+	pr_debug("build planes\n");
+	err = build_planes(topo);
+	if (err) {
+		pr_err("%s: failed to build planes: %d\n", __func__, err);
+		return err;
+	}
+
+	pr_debug("compute costs\n");
+	compute_costs(topo);
+
+	pr_debug("unicast routing\n");
+	unicast_routing();
+
+	pr_debug("map addresses\n");
+	map_addresses(topo);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_logic.h b/drivers/gpu/drm/xe/fabric/routing_logic.h
new file mode 100644
index 0000000000000..771b35bf513ad
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_logic.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_LOGIC_H_INCLUDED
+#define ROUTING_LOGIC_H_INCLUDED
+
+#include "routing_topology.h"
+
+u16 routing_cost_lookup(struct fsubdev *sd_src, struct fsubdev *sd_dst);
+void routing_plane_destroy(struct routing_plane *plane);
+int routing_logic_run(struct routing_topology *topo);
+
+#endif /* ROUTING_LOGIC_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_p2p.c b/drivers/gpu/drm/xe/fabric/routing_p2p.c
new file mode 100644
index 0000000000000..9b8eea1ad5c08
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_p2p.c
@@ -0,0 +1,883 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/seq_file.h>
+#include <linux/debugfs.h>
+
+#include "routing_logic.h"
+#include "routing_p2p.h"
+
+/**
+ * struct routing_p2p_entry - The peer connectivity data from a single source
+ * device (NOT subdevice) to all destination devices.
+ * @devs: mapping from dev->pd->index to struct query_info
+ */
+struct routing_p2p_entry {
+	struct xarray devs;
+};
+
+/**
+ * bw_from_speed - Returns the bandwidth as a function of link speed only.
+ * @link_speed: The STL-encoded link speed.
+ *
+ * Return: - The bandwidth in units of tenths of Gbps, or 0 otherwise.
+ */
+static u32 bw_from_speed(u32 link_speed)
+{
+	switch (link_speed) {
+	case LINK_SPEED_12G: return 125;
+	case LINK_SPEED_25G: return 258;
+	case LINK_SPEED_53G: return 531;
+	case LINK_SPEED_90G: return 900;
+	}
+
+	return 0;
+}
+
+/**
+ * bw_from_width - Returns the bandwidth represented by a link width only.
+ * @link_width: The STL-encoded link width.
+ *
+ * Return: The bandwidth in units of tenths of Gbps.
+ */
+static u32 bw_from_width(u32 link_width)
+{
+	/* order_base_2() is always positive */
+	return (u32)(order_base_2(link_width) + 1);
+}
+
+/**
+ * get_bandwidth_port - Returns the bandwidth of a port.
+ * @port: The port to operate on.
+ *
+ * Return: The bandwidth in tenths of Gbps.
+ */
+static u32 get_bandwidth_port(struct fport *port)
+{
+	u32 speed = bw_from_speed(port->portinfo->link_speed_active);
+	u32 rx = bw_from_width(port->portinfo->link_width_downgrade_rx_active);
+	u32 tx = bw_from_width(port->portinfo->link_width_downgrade_tx_active);
+
+	return speed * min(rx, tx);
+}
+
+/*
+ * get_bandwidth_link - Returns the bandwidth of a link, factoring in the
+ * port on either end.
+ * @port: A port on either end of the link.
+ *
+ * Return: The bandwidth in tenths of Gbps.
+ */
+static u32 get_bandwidth_link(struct fport *port)
+{
+	u32 bw_a = get_bandwidth_port(port);
+	u32 bw_b = get_bandwidth_port(port->routing.neighbor);
+
+	return min(bw_a, bw_b);
+}
+
+/**
+ * struct trace_path - Represents the tracing state for a single path, which
+ * is a collection of identically routed DFIDs.
+ * @sd_curr: The "current" sd (at the tail of the intermediate path)
+ * @dfid_mask: The mask of the FID offsets (from the base FID) that follow
+ * this path
+ * @hops: The length of the path in hops.
+ * @done: True if this path has reached the ingress sd for the destination
+ * device, or is otherwise invalid (i.e. no further processing required)
+ */
+struct trace_path {
+	struct fsubdev *sd_curr;
+	u64 dfid_mask;
+	u8 hops;
+	bool done;
+};
+
+/*
+ * struct trace - Tracks the tracing state for an entire trace of all paths
+ * between a single subdevice pair.
+ * @sd_src: The source subdevice.
+ * @sd_dst: The destination subdevice.
+ * @port_mask_ingress: The mask of port offsets used to ingress into the fabric
+ * from the source subdevice.
+ * @port_mask_egress: The mask of port offsets used to egress from the fabric
+ * into the egress subdevice.
+ * @num_paths: The number of paths in the paths array.
+ * @paths: The set of traced paths, each one defined as a path through the
+ * fabric shared by a subset of the DFIDs.
+ *
+ * A trace will begin with one trace path, representing start of the
+ * path of the entire block of DFIDs.
+ */
+struct trace {
+	struct fsubdev *sd_src;
+	struct fsubdev *sd_dst;
+	DECLARE_BITMAP(port_mask_ingress, PORT_COUNT);
+	DECLARE_BITMAP(port_mask_egress, PORT_COUNT);
+	u8 num_paths;
+	struct trace_path paths[ROUTING_FID_BLOCK_SIZE];
+};
+
+/*
+ * extend_path_one - Extends a single path trace by one hop.
+ * @trace: The trace to operate on.
+ * @path: The path to operate on.
+ * @port: The egress port to extend this path along.
+ *
+ * Return: 0 on success, non-zero otherwise.
+ */
+static int extend_path_one(struct trace *trace,
+			   struct trace_path *path,
+			   struct fport *port)
+{
+	struct fsubdev *sd_neighbor;
+	struct fport *port_neighbor;
+	u16 cost_before, cost_after;
+	u8 lpn_neighbor = port->portinfo->neighbor_port_number;
+
+	sd_neighbor = find_routable_sd(port->portinfo->neighbor_guid);
+	if (!sd_neighbor)
+		goto fail;
+
+	/* watch for trivial cycles */
+	if (path->sd_curr == sd_neighbor)
+		goto fail;
+
+	/* ensure we're at least not regressing (NOTE: won't prevent loops) */
+	cost_before = routing_cost_lookup(path->sd_curr, trace->sd_dst);
+	cost_after = routing_cost_lookup(sd_neighbor, trace->sd_dst);
+	if (cost_after > cost_before)
+		goto fail;
+
+	port_neighbor = get_fport_handle(sd_neighbor, lpn_neighbor);
+	if (!port_neighbor)
+		goto fail;
+
+	if (path->sd_curr == trace->sd_src) {
+		/*
+		 * beginning of trace:
+		 * cache the ingress port for the bw calculation
+		 */
+		port->routing.neighbor = port_neighbor;
+	}
+
+	path->sd_curr = sd_neighbor;
+	path->hops++;
+
+	/* if we've reached the destination, we're done */
+	if (path->sd_curr == trace->sd_dst) {
+		path->done = true;
+		__set_bit(lpn_neighbor, trace->port_mask_egress);
+
+		/*
+		 * end of trace:
+		 * cache the egress port for the bw calculation
+		 */
+		port_neighbor->routing.neighbor = port;
+	}
+
+	return 0;
+
+fail:
+	path->hops = 0;
+	path->done = true;
+	return -EINVAL;
+}
+
+/**
+ * extend_path - Extends the trace of a specific path by one hop.
+ * @trace: The trace to operate on.
+ * @path: The specific path within the trace being operated on.
+ *
+ * Possibly forks additional trace paths if the path diverges at this hop
+ * via multiple egress ports.
+ */
+static void extend_path(struct trace *trace, struct trace_path *path)
+{
+	struct trace_path *path_curr = path;
+	struct trace_path *path_next;
+	struct fport *port;
+	u8 *block;
+	/* the mask of FIDs remaining to be assigned to a port */
+	unsigned long mask_remaining = path->dfid_mask;
+	/* the mask of FIDs assigned to the current port */
+	u64 mask_port;
+	u16 fid_offset;
+	u8 lpn;
+	u8 uft_src;
+
+	BUILD_BUG_ON(ROUTING_FID_BLOCK_SIZE > BITS_PER_LONG);
+
+	if (routing_sd_is_error(path_curr->sd_curr)) {
+		path_curr->hops = 0;
+		path_curr->done = true;
+		return;
+	}
+
+	block = routing_uft_bridge_get(path_curr->sd_curr->routing.uft,
+				       trace->sd_dst);
+	if (!block) {
+		path_curr->hops = 0;
+		path_curr->done = true;
+		return;
+	}
+
+	/*
+	 * determine what subset of the DFID set applies to each port.
+	 * if the entire set is not exhausted on a given port, the remaining
+	 * is split into a new path
+	 */
+	for_each_fabric_port(port, lpn, path_curr->sd_curr) {
+		/* the path origin sources traffic from the bridge */
+		uft_src = path_curr->sd_curr == trace->sd_src ? UFT_SEL_ORIGIN : UFT_SEL_HOP;
+
+		/* determine the set of FIDs that use this port */
+		mask_port = 0;
+		for_each_set_bit(fid_offset, &mask_remaining, ROUTING_FID_BLOCK_SIZE) {
+			if (routing_uft_entry_get(block, uft_src, fid_offset) == lpn)
+				mask_port |= 1ull << fid_offset;
+		}
+
+		/* if no FIDs use this port: skip */
+		if (!mask_port)
+			continue;
+
+		if (path_curr->sd_curr == trace->sd_src)
+			__set_bit(lpn, trace->port_mask_ingress);
+
+		/* this path is now local to this port; update the dfid mask */
+		path_curr->dfid_mask = mask_port;
+
+		/*
+		 * if all FIDs have been assigned to a port: done.
+		 * otherwise, split off a new path for the remaining FIDs.
+		 */
+		mask_remaining &= ~mask_port;
+		if (mask_remaining) {
+			path_next = &trace->paths[trace->num_paths];
+			trace->num_paths++;
+
+			/* we should never generate more paths than we have FIDs */
+			WARN(trace->num_paths > ROUTING_FID_BLOCK_SIZE,
+			     "traced paths exceeds FID block size");
+
+			*path_next = *path_curr;
+			path_next->dfid_mask = mask_remaining;
+		}
+
+		/*
+		 * extending the path mutates the curr pointer.
+		 * do so after cloning the next path
+		 */
+		extend_path_one(trace, path_curr, port);
+		if (!mask_remaining)
+			break;
+
+		path_curr = path_next;
+	}
+
+	if (mask_remaining) {
+		/* remaining FIDs were not assigned to a port; fail the path */
+		path_curr->hops = 0;
+		path_curr->done = true;
+		return;
+	}
+}
+
+/**
+ * union_sd2sd - Returns the union of two link connectivities.
+ * @dst: The first connectivity, which will contain the result.
+ * @other: The second connectivity.
+ *
+ * Return: The unified link connectivity.
+ */
+static void union_sd2sd(struct sd2sd_info *dst, struct sd2sd_info *other)
+{
+	dst->bandwidth = min(dst->bandwidth, other->bandwidth);
+	dst->latency = max(dst->latency, other->latency);
+}
+
+/**
+ * find_egress - Determines the subdevice within the destination device that
+ * traffic will arrive on (fabric egress) for a given src/dst subdevice pair.
+ * @src: The source subdevice.
+ * @dst: The destination subdevice.
+ *
+ * Return: The egress subdevice within the destination device, or NULL if not
+ * found.
+ */
+static struct fsubdev *find_egress(struct fsubdev *src, struct fsubdev *dst)
+{
+	struct fsubdev *ingress;
+	u16 dpa = dst->routing.dpa_idx_base;
+	u16 dfid;
+	int i;
+
+	/* driver only ever sets bits 9:0 of the DFID */
+	WARN_ON(src->routing.dfid_map->dfid[dpa] > 0x3ff);
+
+	dfid = (u16)(src->routing.dfid_map->dfid[dpa] << ROUTING_DPA_DFID_MAP_SHIFT);
+
+	for (i = 0; i < dst->fdev->pd->sd_cnt; ++i) {
+		ingress = &dst->fdev->sd[i];
+		if (ingress->routing.fid_base == dfid)
+			return ingress;
+	}
+
+	return NULL;
+}
+
+/**
+ * reduce_bandwidth - Reduces the bandwidth of a set of paths down to a
+ * single bandwidth.
+ * @trace: The trace to operate on.
+ *
+ * Return: The bandwidth in Gbps.
+ *
+ * Note that this only considers the bandwidth of the links that ingress
+ * traffic into the fabric from the source subdevice, and the links that
+ * egress traffic from the fabric at the destination subdevice.  If paths
+ * are longer than two hops, the intermediate hops are ignored.
+ */
+static u16 reduce_bandwidth(struct trace *trace)
+{
+	struct fport *port;
+	u32 bw_ingress = 0;
+	u32 bw_egress = 0;
+	u8 lpn;
+
+	for_each_set_bit(lpn, trace->port_mask_ingress, PORT_COUNT) {
+		port = get_fport_handle(trace->sd_src, lpn);
+		if (!port)
+			continue;
+		bw_ingress += get_bandwidth_link(port);
+	}
+
+	for_each_set_bit(lpn, trace->port_mask_egress, PORT_COUNT) {
+		port = get_fport_handle(trace->sd_dst, lpn);
+		if (!port)
+			continue;
+		bw_egress += get_bandwidth_link(port);
+	}
+
+	/* 90 Gps * 4x * 8 fabric ports == 2880 max, which fits a u16 */
+	return (u16)(min(bw_ingress, bw_egress) / 10);
+}
+
+/**
+ * reduce_latency - Reduces the latency of a set of paths down to a single
+ * average latency.
+ * @trace: The trace to operate on.
+ *
+ * Return: The latency in tenths of hops.
+ */
+static u16 reduce_latency(struct trace *trace)
+{
+	struct trace_path *path;
+	u32 l = 0;
+	u8 i;
+
+	/* cannot be more than 32 paths per trace */
+	WARN_ON(trace->num_paths > 32);
+	for (i = 0; i < trace->num_paths; ++i) {
+		path = &trace->paths[i];
+		if (!path->hops)
+			return 0;
+
+		/* weighted by DFIDs per path */
+		l += path->hops * hweight64(path->dfid_mask);
+	}
+
+	/* dfid masks are disjoint per path */
+	WARN_ON(l > 255 * 64);
+
+	/* convert latency to tenths and divide out the DFID weight */
+	return (u16)(l * 10 / ROUTING_VALID_FIDS_PER_BLOCK);
+}
+
+/**
+ * reduce - Reduces all traced paths in a trace to a single output result.
+ * @trace: The trace to operate on.
+ * @dst: The output in which to store results.
+ */
+static void reduce(struct trace *trace, struct sd2sd_info *dst)
+{
+	dst->latency = reduce_latency(trace);
+	dst->bandwidth = dst->latency ? reduce_bandwidth(trace) : 0;
+}
+
+/**
+ * trace - Traces all routes between endpoints to determine the
+ * available bandwidth/latency.
+ * @sd_src: The source subdevice.
+ * @sd_dst: The destination subdevice.
+ * @si: The output populate with results.
+ *
+ * Return: 0 on success, non-zero otherwise.
+ *
+ * Assumes sd_src != sd_dst.
+ */
+static int trace(struct fsubdev *sd_src, struct fsubdev *sd_dst,
+		 struct sd2sd_info *si)
+{
+	struct trace_path *path;
+	struct trace *trace;
+	u8 num_paths;
+	bool done;
+	int limit;
+	int pass;
+	u8 i;
+
+	if (routing_cost_lookup(sd_src, sd_dst) == ROUTING_COST_INFINITE)
+		return -EINVAL;
+
+	trace = kzalloc(sizeof(*trace), GFP_KERNEL);
+	if (!trace)
+		return -ENOMEM;
+
+	trace->sd_src = sd_src;
+	trace->sd_dst = sd_dst;
+	trace->num_paths = 1;
+	trace->paths[0].sd_curr = sd_src;
+	trace->paths[0].dfid_mask = ROUTING_FID_BLOCK_MASK;
+
+	/*
+	 * limit iterations arbitrarily to prevent a broken fabric routing
+	 * with cycles from inducing a runaway trace
+	 */
+	limit = ROUTING_FID_BLOCK_SIZE * ROUTING_HOP_LIMIT;
+	for (pass = 0; pass < limit; ++pass) {
+		/*
+		 * although each pass may add paths, they will already have
+		 * been processed; save off the initial count
+		 */
+		num_paths = trace->num_paths;
+
+		done = true;
+
+		for (i = 0; i < num_paths; ++i) {
+			path = &trace->paths[i];
+
+			if (path->done)
+				continue;
+
+			extend_path(trace, path);
+
+			if (!path->done)
+				done = false;
+		}
+
+		if (done)
+			break;
+	}
+
+	if (pass >= limit) {
+		pr_err("%s: iterations exceeded (possible cyclic fabric routing)",
+		       __func__);
+		kfree(trace);
+		return -EINVAL;
+	}
+
+	reduce(trace, si);
+
+	kfree(trace);
+
+	return 0;
+}
+
+/**
+ * p2p_sd - calculates the connectivity between subdevices
+ * @src: the source subdevice
+ * @dst: the destination subdevice
+ * @si: the output connectivity info structure
+ *
+ * This first determines the EGRESS subdev (i.e. the subdev at which traffic
+ * egresses the fabric), and traces in both directions between SRC and EGRESS.
+ *
+ * If SRC and DST are on the same plane, then EGRESS == DST, as in:
+ *
+ * -------------                      --------------------
+ * | 0.0 (SRC) |---(fabric plane 0)---| 1.0 (EGRESS/DST) |
+ * -------------                      --------------------
+ * | 0.1       |---(fabric plane 1)---| 1.1              |
+ * -------------                      --------------------
+ *
+ * If SRC and DST they're on different planes, EGRESS will be the tile at the
+ * destination that shares a plane with SRC, as in:
+ *
+ * -------------                      ----------------
+ * | 0.0 (SRC) |---(fabric plane 0)---| 1.0 (EGRESS) |
+ * -------------                      ----------------
+ * | 0.1       |---(fabric plane 1)---| 1.1 (DST)    |
+ * -------------                      ----------------
+ *
+ * The reason we trace SRC/EGRESS rather than SRC/DST is that if we're routing
+ * from SRC to DST in the second diagram, a request takes:
+ *   0.0 -> plane 0 -> 1.0 -> 1.1
+ * and a response will retrace the request path, and thus go:
+ *   1.1 -> 1.0 -> plane 0 -> 0.0
+ *
+ * Responses might not travel through plane 0 the same way requests did (hence
+ * needing to trace the paths in the driver), but the point is they WILL NOT
+ * take the path:
+ *   1.1 -> plane 1 -> 0.1 -> 0.0
+ */
+static void p2p_sd(struct fsubdev *src, struct fsubdev *dst,
+		   struct sd2sd_info *si)
+{
+	struct fsubdev *egress;
+	struct sd2sd_info si_reverse;
+
+	if (src->fdev == dst->fdev)
+		goto zero;
+
+	if (list_empty(&src->routable_link) || list_empty(&dst->routable_link))
+		goto zero;
+
+	if (routing_sd_is_error(src) || routing_sd_is_error(dst))
+		goto zero;
+
+	egress = find_egress(src, dst);
+	if (!egress)
+		goto zero;
+
+	if (trace(src, egress, si))
+		goto zero;
+
+	if (trace(egress, src, &si_reverse))
+		goto zero;
+
+	union_sd2sd(si, &si_reverse);
+	return;
+
+zero:
+	si->bandwidth = 0;
+	si->latency = 0;
+}
+
+static void p2p_dev(struct fdev *src, struct fdev *dst,
+		    struct query_info *qi)
+{
+	struct fsubdev *sd_src, *sd_dst;
+	struct sd2sd_info *si;
+	u8 i, j;
+
+	for (i = 0; i < qi->src_cnt; ++i) {
+		sd_src = &src->sd[i];
+		for (j = 0; j < qi->dst_cnt; ++j) {
+			sd_dst = &dst->sd[j];
+			si = &qi->sd2sd[i * qi->dst_cnt + j];
+			p2p_sd(sd_src, sd_dst, si);
+		}
+	}
+}
+
+/*
+ * this may be used on the "current" rcu entry, or the "next" non-rcu entry.
+ * use __force to strip __rcu-ness to appease the checker in both cases,
+ * given that this will never be invoked on the rcu entry except on device
+ * teardown.
+ */
+static void p2p_entry_clear(__force struct routing_p2p_entry **entry)
+{
+	struct query_info *qi;
+	unsigned long i;
+
+	xa_for_each(&(*entry)->devs, i, qi)
+		kfree(qi);
+	xa_destroy(&(*entry)->devs);
+	kfree(*entry);
+	*entry = NULL;
+}
+
+static void cache_pair(struct fdev *src, struct fdev *dst)
+{
+	struct query_info *qi;
+
+	qi = kmalloc(struct_size(qi, sd2sd, src->pd->sd_cnt * dst->pd->sd_cnt),
+		     GFP_KERNEL);
+	if (!qi)
+		return;
+
+	qi->src_cnt = src->pd->sd_cnt;
+	qi->dst_cnt = dst->pd->sd_cnt;
+
+	p2p_dev(src, dst, qi);
+
+	xa_store(&src->p2p_next->devs, dst->pd->index, qi, GFP_KERNEL);
+}
+
+static int cache_src_cb(struct fdev *dst, void *src)
+{
+	cache_pair((struct fdev *)src, dst);
+
+	return 0;
+}
+
+static void cache_src(struct fdev *src)
+{
+	fdev_process_each(cache_src_cb, src);
+}
+
+static int p2p_entry_alloc_cb(struct fdev *dev, void *args)
+{
+	dev->p2p_next = kmalloc(sizeof(*dev->p2p_next), GFP_KERNEL);
+	if (dev->p2p_next) {
+		xa_init(&dev->p2p_next->devs);
+		cache_src(dev);
+
+		dev->p2p_next = rcu_replace_pointer(dev->p2p, dev->p2p_next,
+						    true);
+	}
+
+	return 0;
+}
+
+static int p2p_entry_clear_cb(struct fdev *dev, void *args)
+{
+	if (dev->p2p_next)
+		p2p_entry_clear(&dev->p2p_next);
+
+	return 0;
+}
+
+/**
+ * routing_p2p_cache - Updates cached peer-to-peer connectivity queries
+ * for all devices.
+ *
+ * Invoked with the routing lock held, preserving the lifetime of the devices
+ * in the xarray.
+ *
+ * Note that devices may contain subdevices that are not routable (i.e. not
+ * on the routable list) or in an error state, which the connectivity query
+ * logic must account for.
+ */
+void routing_p2p_cache(void)
+{
+	fdev_process_each(p2p_entry_alloc_cb, NULL);
+
+	synchronize_rcu();
+
+	fdev_process_each(p2p_entry_clear_cb, NULL);
+}
+
+static void p2p_zero(struct fdev *src, struct fdev *dst, struct query_info *qi)
+{
+	u16 i, n;
+
+	qi->src_cnt = src->pd->sd_cnt;
+	qi->dst_cnt = dst->pd->sd_cnt;
+
+	/* i,n (u16) can hold UINT8_MAX*UINT8_MAX+1 */
+	for (i = 0, n = qi->src_cnt * qi->dst_cnt; i < n; ++i) {
+		qi->sd2sd[i].bandwidth = 0;
+		qi->sd2sd[i].latency = 0;
+	}
+}
+
+void routing_p2p_lookup(struct fdev *src, struct fdev *dst,
+			struct query_info *qi)
+{
+	struct routing_p2p_entry *src_entry;
+	struct query_info *qi_cached;
+
+	rcu_read_lock();
+
+	src_entry = rcu_dereference(src->p2p);
+	if (!src_entry) {
+		rcu_read_unlock();
+		p2p_zero(src, dst, qi);
+		return;
+	}
+
+	qi_cached = xa_load(&src_entry->devs, dst->pd->index);
+	if (!qi_cached) {
+		p2p_zero(src, dst, qi);
+	} else if (qi->src_cnt != qi_cached->src_cnt ||
+		   qi->dst_cnt != qi_cached->dst_cnt) {
+		p2p_zero(src, dst, qi);
+	} else {
+		memcpy(qi->sd2sd, qi_cached->sd2sd,
+		       sizeof(*qi->sd2sd) * qi->src_cnt * qi->dst_cnt);
+	}
+
+	rcu_read_unlock();
+}
+
+void routing_p2p_clear(struct fdev *dev)
+{
+	if (dev->p2p)
+		p2p_entry_clear(&dev->p2p);
+
+	if (dev->p2p_next)
+		p2p_entry_clear(&dev->p2p_next);
+}
+
+/**
+ * struct debugfs_p2p_iter - Represents a pairwise iteration of all base
+ * tile pairs (tile 0).
+ * @src: the current source tile
+ * @dst: the current destination tile
+ *
+ * Given N devices, this produces N^2 entries, one for every pair of source
+ * and destination subdevice with index 0.
+ */
+struct debugfs_p2p_iter {
+	struct fsubdev *src, *dst;
+};
+
+/**
+ * debugfs_p2p_iter_end - Destroys the iteration context.
+ * @iter: the seq iterator
+ *
+ * The routing lock was taken when the iteration began to prevent the routing
+ * list from being modified across multiple userspace reads of the debugfs
+ * interface.  All paths out of the seq interface end in this call, which
+ * releases the lock.
+ */
+static void debugfs_p2p_iter_end(struct debugfs_p2p_iter *iter)
+{
+	up_read(&routable_lock);
+	kfree(iter);
+}
+
+/**
+ * debugfs_p2p_seq_start - Initialize an iterator for the seq interface.
+ * @s: the seq interface
+ * @pos: the read position being requested
+ *
+ * Return: a new iterator, or NULL on failure
+ *
+ * For simplicity, we require the read begin at offset 0.
+ *
+ * We also require the routing lock be held during the seq lifetime to
+ * prevent invalidation of the iteration over the routable device list.
+ */
+static void *debugfs_p2p_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct debugfs_p2p_iter *iter;
+
+	if (*pos)
+		return NULL;
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return NULL;
+
+	down_read(&routable_lock); /* shared lock */
+
+	iter->src = routing_sd_iter(0);
+	if (!iter->src) {
+		debugfs_p2p_iter_end(iter);
+		return NULL;
+	}
+
+	iter->dst = iter->src;
+
+	return iter;
+}
+
+/**
+ * debugfs_p2p_iter_inc - Increment the p2p debugfs seq file iterator.
+ * @iter: The iterator to operate on.
+ *
+ * Return: The incremented iterator, or NULL if terminated.
+ *
+ * This effectively enumerates devices, as it skips over subdevices that
+ * are not index 0.
+ */
+static void *debugfs_p2p_iter_inc(struct debugfs_p2p_iter *iter)
+{
+	do {
+		iter->dst = routing_sd_next(iter->dst, 0);
+		if (!iter->dst) {
+			iter->src = routing_sd_next(iter->src, 0);
+			if (!iter->src) {
+				debugfs_p2p_iter_end(iter);
+				return NULL;
+			}
+
+			iter->dst = routing_sd_iter(0);
+			if (!iter->dst) {
+				debugfs_p2p_iter_end(iter);
+				return NULL;
+			}
+		}
+	} while (sd_index(iter->src) || sd_index(iter->dst));
+
+	return iter;
+}
+
+static void *debugfs_p2p_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct debugfs_p2p_iter *iter = v;
+
+	(*pos)++;
+	return debugfs_p2p_iter_inc(iter);
+}
+
+static void debugfs_p2p_seq_stop(struct seq_file *s, void *v)
+{
+	if (v)
+		debugfs_p2p_iter_end(v);
+}
+
+static int debugfs_p2p_seq_show(struct seq_file *s, void *v)
+{
+	struct debugfs_p2p_iter *iter = v;
+	struct query_info *qi;
+	struct sd2sd_info *si;
+	u8 src_cnt = iter->src->fdev->pd->sd_cnt;
+	u8 dst_cnt = iter->dst->fdev->pd->sd_cnt;
+	u8 i, j;
+
+	qi = kmalloc(struct_size(qi, sd2sd, src_cnt * dst_cnt), GFP_KERNEL);
+	if (!qi)
+		return -ENOMEM;
+
+	qi->src_cnt = src_cnt;
+	qi->dst_cnt = dst_cnt;
+	routing_p2p_lookup(iter->src->fdev, iter->dst->fdev, qi);
+
+	for (i = 0; i < src_cnt; ++i) {
+		for (j = 0; j < dst_cnt; ++j) {
+			si = &qi->sd2sd[i * dst_cnt + j];
+			seq_printf(s, "%u %u %u %u %u %u\n",
+				   iter->src->fdev->pd->index, i,
+				   iter->dst->fdev->pd->index, j,
+				   si->bandwidth, si->latency);
+		}
+	}
+
+	kfree(qi);
+	return 0;
+}
+
+static const struct seq_operations debugfs_p2p_seq_ops = {
+	.start = debugfs_p2p_seq_start,
+	.next = debugfs_p2p_seq_next,
+	.stop = debugfs_p2p_seq_stop,
+	.show = debugfs_p2p_seq_show,
+};
+
+static int debugfs_p2p_open(struct inode *inode, struct file *file)
+{
+	return seq_open(file, &debugfs_p2p_seq_ops);
+}
+
+static const struct file_operations debugfs_ops = {
+	.open = debugfs_p2p_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = seq_release,
+};
+
+#define DEBUGFS_NAME_P2P "p2p"
+
+void routing_p2p_init(struct dentry *root)
+{
+	debugfs_create_file(DEBUGFS_NAME_P2P, 0400, root, NULL, &debugfs_ops);
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_p2p.h b/drivers/gpu/drm/xe/fabric/routing_p2p.h
new file mode 100644
index 0000000000000..cf8742ea5fef5
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_p2p.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_P2P_H_INCLUDED
+#define ROUTING_P2P_H_INCLUDED
+
+#include "routing_topology.h"
+
+struct routing_p2p_entry;
+
+void routing_p2p_init(struct dentry *root);
+
+void routing_p2p_cache(void);
+void routing_p2p_lookup(struct fdev *src, struct fdev *dst,
+			struct query_info *qi);
+
+void routing_p2p_clear(struct fdev *dev);
+
+#endif /* ROUTING_P2P_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_pause.c b/drivers/gpu/drm/xe/fabric/routing_pause.c
new file mode 100644
index 0000000000000..9b9070483ecee
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_pause.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+
+#include "csr.h"
+#include "iaf_drv.h"
+#include "ops.h"
+#include "parallel.h"
+#include "routing_pause.h"
+#include "routing_topology.h"
+
+static bool routing_pause_enable = true;
+static unsigned long routing_pause_timeout = 60; /* seconds */
+
+static void write_pause(struct fsubdev *sd)
+{
+	/* only pause bridge requests; let the rest flush */
+	u64 value = FIELD_PREP(MASK_BT_PAC_MDFI_REQ, 1);
+	u32 offset = CSR_BT_PAUSE_CTRL;
+	int err;
+	u8 lpn;
+
+	for_each_bridge_lpn(lpn, sd) {
+		err = ops_linkmgr_port_csr_wr(sd, lpn, offset, &value,
+					      sizeof(value), false);
+		if (err) {
+			sd_err(sd, "unable to pause bridge port %d: %d\n",
+			       lpn, err);
+			routing_sd_transition_error(sd);
+			return;
+		}
+	}
+}
+
+static void write_unpause(struct fsubdev *sd)
+{
+	u64 value = 0; /* all pause flags clear */
+	u32 offset = CSR_BT_PAUSE_CTRL;
+	int err;
+	u8 lpn;
+
+	for_each_bridge_lpn(lpn, sd) {
+		err = ops_linkmgr_port_csr_wr(sd, lpn, offset, &value,
+					      sizeof(value), false);
+		if (err) {
+			sd_err(sd, "unable to unpause bridge port %d: %d\n",
+			       lpn, err);
+			routing_sd_transition_error(sd);
+			return;
+		}
+	}
+}
+
+static int read_outstanding_tx(struct fsubdev *sd, u64 *count)
+{
+	u64 value = 0;
+	u64 total = 0;
+	u32 offset = CSR_BT_OUTSTANDING_TX;
+	int err;
+	u8 lpn;
+
+	for_each_bridge_lpn(lpn, sd) {
+		err = ops_linkmgr_port_csr_rd(sd, lpn, offset, sizeof(value),
+					      &value);
+		if (err) {
+			sd_err(sd,
+			       "unable to read outstanding tx for bridge port %d: %d\n",
+			       lpn, err);
+			routing_sd_transition_error(sd);
+			return err;
+		}
+
+		total += FIELD_GET(MASK_BT_OT_FBRC, value);
+		total += FIELD_GET(MASK_BT_OT_MDFI, value);
+	}
+
+	*count = total;
+	return 0;
+}
+
+/**
+ * struct pause_ctx_sd - Tracks per-sd pause state.
+ * @sd: the sd being tracked
+ * @alive: true if the sd has not failed along the way
+ * @quiet: true once the sd has been observed to be paused and flushed
+ */
+struct pause_ctx_sd {
+	struct fsubdev *sd;
+	bool quiet;
+};
+
+/**
+ * struct routing_pause_ctx - Tracks overall pause state.
+ * @sd_count: count of sds in the sd array
+ * @sd: array of per-sd contexts
+ */
+struct routing_pause_ctx {
+	int sd_count;
+	struct pause_ctx_sd sd[];
+};
+
+static void pause_fn(void *ctx)
+{
+	struct pause_ctx_sd *sd_ctx = ctx;
+
+	write_pause(sd_ctx->sd);
+}
+
+static void pause_all(struct routing_pause_ctx *ctx)
+{
+	struct par_group group;
+	int i;
+
+	par_start(&group);
+
+	for (i = 0; i < ctx->sd_count; ++i)
+		par_work_queue(&group, pause_fn, ctx->sd + i);
+
+	par_wait(&group);
+}
+
+static void unpause_fn(void *ctx)
+{
+	struct pause_ctx_sd *sd_ctx = ctx;
+
+	write_unpause(sd_ctx->sd);
+}
+
+static void unpause_all(struct routing_pause_ctx *ctx)
+{
+	struct par_group group;
+	int i;
+
+	par_start(&group);
+
+	for (i = 0; i < ctx->sd_count; ++i)
+		if (!routing_sd_is_error(ctx->sd[i].sd))
+			par_work_queue(&group, unpause_fn, ctx->sd + i);
+
+	par_wait(&group);
+}
+
+static void poll_fn(void *ctx)
+{
+	struct pause_ctx_sd *sd = ctx;
+	u64 count;
+	int err;
+
+	err = read_outstanding_tx(sd->sd, &count);
+	if (err)
+		return;
+
+	if (!count)
+		sd->quiet = 1;
+}
+
+/**
+ * poll_all - Polls all devices in the context for outstanding transactions.
+ * @ctx: the context to operate on
+ *
+ * Return: true if all devices are quiesced; false otherwise
+ */
+static bool poll_all(struct routing_pause_ctx *ctx)
+{
+	struct par_group group;
+	struct pause_ctx_sd *sd;
+	int i;
+
+	par_start(&group);
+
+	for (i = 0; i < ctx->sd_count; ++i) {
+		sd = ctx->sd + i;
+
+		if (routing_sd_is_error(sd->sd) || sd->quiet)
+			continue;
+
+		par_work_queue(&group, poll_fn, sd);
+	}
+
+	par_wait(&group);
+
+	for (i = 0; i < ctx->sd_count; ++i) {
+		sd = ctx->sd + i;
+
+		if (!routing_sd_is_error(sd->sd) && !sd->quiet)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * routing_pause_init - Allocs a new pause context.
+ *
+ * Return: pointer to context, or NULL on failure.
+ */
+struct routing_pause_ctx *routing_pause_init(void)
+{
+	struct routing_pause_ctx *ctx;
+	struct pause_ctx_sd *sd_ctx;
+	struct fsubdev *sd;
+	int count = 0;
+
+	/*
+	 * if pause is not enabled, just return an empty context; calling code
+	 * can continue as normal and the pause api calls will naturally
+	 * degrade to no-ops
+	 */
+	if (!routing_pause_enable)
+		return kzalloc(sizeof(*ctx), GFP_KERNEL);
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0))
+		++count;
+
+	ctx = kzalloc(struct_size(ctx, sd, count), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	for (sd = routing_sd_iter(0); sd; sd = routing_sd_next(sd, 0)) {
+		sd_ctx = ctx->sd + ctx->sd_count++;
+		sd_ctx->sd = sd;
+		sd_ctx->quiet = false;
+	}
+
+	return ctx;
+}
+
+/**
+ * routing_pause_start - Starts a pause period by pausing bridge
+ * requests and waiting for the fabric to flush.
+ * @ctx: context to operate on
+ */
+void routing_pause_start(struct routing_pause_ctx *ctx)
+{
+	unsigned long interval;
+	unsigned long remaining;
+	unsigned long end_jif;
+
+	pause_all(ctx);
+
+	end_jif = jiffies + msecs_to_jiffies(routing_pause_timeout * 1000);
+
+	for (interval = 1; time_before(jiffies, end_jif); interval *= 10) {
+		bool quiet = poll_all(ctx);
+
+		if (quiet)
+			break;
+
+		/*
+		 * skip the short wait on the first pass.  note that in
+		 * general we expect the fabric to quiesce much faster than
+		 * we spend polling for it.
+		 */
+		if (interval == 1)
+			continue;
+
+		remaining = jiffies_delta_to_msecs(end_jif - jiffies);
+		msleep(min(interval, remaining));
+	}
+}
+
+/**
+ * routing_pause_end - Ends a pause period by unpausing devices
+ * and frees the context.
+ * @ctx: context to operate on
+ */
+void routing_pause_end(struct routing_pause_ctx *ctx)
+{
+	unpause_all(ctx);
+	kfree(ctx);
+}
+
+module_param(routing_pause_enable, bool, 0400);
+MODULE_PARM_DESC(routing_pause_enable, "Determines whether routing will attempt to pause the fabric when making programming changes (default: Y)");
+
+module_param(routing_pause_timeout, ulong, 0400);
+MODULE_PARM_DESC(routing_pause_timeout, "Maximum time to wait before declaring a timeout when waiting for fabric to quiesce in seconds (default: 60s)");
diff --git a/drivers/gpu/drm/xe/fabric/routing_pause.h b/drivers/gpu/drm/xe/fabric/routing_pause.h
new file mode 100644
index 0000000000000..5b878c8dfea4d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_pause.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_PAUSE_H_INCLUDED
+#define ROUTING_PAUSE_H_INCLUDED
+
+struct routing_pause_ctx;
+
+struct routing_pause_ctx *routing_pause_init(void);
+void routing_pause_start(struct routing_pause_ctx *ctx);
+void routing_pause_end(struct routing_pause_ctx *ctx);
+
+#endif /* ROUTING_PAUSE_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/routing_topology.c b/drivers/gpu/drm/xe/fabric/routing_topology.c
new file mode 100644
index 0000000000000..2d9d8f63c96a3
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_topology.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include "routing_topology.h"
+
+u8 *routing_uft_block_alloc(u16 num_fids)
+{
+	u8 *block = kmalloc(num_fids, GFP_KERNEL);
+
+	if (!block)
+		return NULL;
+
+	memset(block, 0xff, num_fids);
+	return block;
+}
+
+/**
+ * routing_uft_bridge_get - Returns the unicast fowarding table (UFT) block of
+ * the source sd corresponding to the DFIDs of the destination sd's bridge.
+ * @uft: The unicast forwarding table being queried (owned by source sd).
+ * @sd_dst: The destination sd for which the block is being requested.
+ *
+ * Return: The requested block if found, otherwise NULL.
+ */
+u8 *routing_uft_bridge_get(struct routing_uft *uft, struct fsubdev *sd_dst)
+{
+	u8 *block;
+
+	block = xa_load(&uft->bridges, sd_dst->routing.fid_group);
+	if (!block) {
+		block = routing_uft_block_alloc(ROUTING_FID_BLOCK_SIZE);
+		if (!block)
+			return NULL;
+		xa_store(&uft->bridges, sd_dst->routing.fid_group, block,
+			 GFP_KERNEL);
+	}
+
+	return block;
+}
+
+/**
+ * routing_uft_alloc - Returns an newly allocated UFT with empty destination
+ * bridge blocks.
+ *
+ * Return: The allocated unicast forwarding table, else NULL.
+ */
+struct routing_uft *routing_uft_alloc(void)
+{
+	struct routing_uft *uft = kzalloc(sizeof(*uft), GFP_KERNEL);
+
+	if (!uft)
+		return NULL;
+
+	uft->mgmt = routing_uft_block_alloc(ROUTING_MAX_DEVICES);
+	if (!uft->mgmt) {
+		kfree(uft);
+		return NULL;
+	}
+
+	xa_init(&uft->bridges);
+
+	return uft;
+}
+
+/**
+ * routing_uft_destroy - Destroys the specified UFT, deallocating all UFT
+ * blocks within.
+ * @uft: The unicast fowarding table to destroy.
+ */
+void routing_uft_destroy(struct routing_uft *uft)
+{
+	u8 *block;
+	unsigned long i;
+
+	if (!uft)
+		return;
+
+	kfree(uft->mgmt);
+
+	xa_for_each(&uft->bridges, i, block) {
+		xa_erase(&uft->bridges, i);
+		kfree(block);
+	}
+
+	xa_destroy(&uft->bridges);
+
+	kfree(uft);
+}
+
+void routing_uft_update(struct fsubdev *sd)
+{
+	struct routing_uft *prev = sd->routing.uft;
+
+	sd->routing.uft = sd->routing.uft_next;
+	sd->routing.uft_next = NULL;
+	routing_uft_destroy(prev);
+}
+
+void routing_dfid_map_update(struct fsubdev *sd)
+{
+	struct routing_dfid_map *prev = sd->routing.dfid_map;
+
+	sd->routing.dfid_map = sd->routing.dfid_map_next;
+	sd->routing.dfid_map_next = NULL;
+	kfree(prev);
+}
+
+/**
+ * routing_sd_transition_error - Transitions the specified sd into an error
+ * state and frees resources.
+ * @sd: The sd to transition.
+ */
+void routing_sd_transition_error(struct fsubdev *sd)
+{
+	if (sd->routing.state == TILE_ROUTING_STATE_ERROR)
+		return;
+
+	routing_topo_signal_sd_error(sd->routing.topo);
+
+	sd->routing.state = TILE_ROUTING_STATE_ERROR;
+
+	if (sd->routing.fid_mgmt) {
+		sd->routing.fid_group = 0;
+		sd->routing.fid_mgmt = 0;
+		sd->routing.fid_base = 0;
+	}
+
+	if (sd->routing.plane) {
+		sd->routing.plane->num_subdevs--;
+		list_del_init(&sd->routing.plane_link);
+		sd->routing.plane = NULL;
+		sd->routing.plane_index = 0;
+	}
+
+	routing_uft_destroy(sd->routing.uft);
+	sd->routing.uft = NULL;
+
+	routing_uft_destroy(sd->routing.uft_next);
+	sd->routing.uft_next = NULL;
+
+	kfree(sd->routing.dfid_map);
+	sd->routing.dfid_map = NULL;
+
+	kfree(sd->routing.dfid_map_next);
+	sd->routing.dfid_map_next = NULL;
+}
+
+static struct fsubdev *next(struct fsubdev *sd)
+{
+	if (sd) {
+		sd = list_next_entry(sd, routable_link);
+		if (&sd->routable_link == &routable_list)
+			sd = NULL;
+	}
+
+	return sd;
+}
+
+/**
+ * routing_sd_iter - Initializes an iterator to traverse subdevices.
+ * @all: non-zero if all subdevices should be iterated; otherwise only
+ * subdevices not in an error state are iterated
+ *
+ * Return: The first sd in the iteration.
+ */
+struct fsubdev *routing_sd_iter(int all)
+{
+	struct fsubdev *sd;
+
+	sd = list_first_entry_or_null(&routable_list, struct fsubdev,
+				      routable_link);
+
+	if (!all)
+		while (sd && routing_sd_is_error(sd))
+			sd = next(sd);
+
+	return sd;
+}
+
+/**
+ * routing_sd_next - Returns the next sd in the iteration.
+ * @sd: The current sd, relative to which the next sd will be fetched.
+ * @all: non-zero if all subdevices should be iterated; otherwise only
+ * subdevices not in an error state are iterated
+ *
+ * Return: The next sd in the iteration.
+ */
+struct fsubdev *routing_sd_next(struct fsubdev *sd, int all)
+{
+	sd = next(sd);
+
+	if (!all)
+		while (sd && routing_sd_is_error(sd))
+			sd = next(sd);
+
+	return sd;
+}
diff --git a/drivers/gpu/drm/xe/fabric/routing_topology.h b/drivers/gpu/drm/xe/fabric/routing_topology.h
new file mode 100644
index 0000000000000..cbe3083c26459
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/routing_topology.h
@@ -0,0 +1,376 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef ROUTING_TOPO_H_INCLUDED
+#define ROUTING_TOPO_H_INCLUDED
+
+#include <linux/sizes.h>
+#include <linux/bitfield.h>
+
+#include "csr.h"
+#include "iaf_drv.h"
+
+#define ROUTING_UFT_SIZE (48u * SZ_1K)
+
+/* the alignment of the top-level devices in the DPA space */
+#define ROUTING_DEV_DPA_ALIGNMENT (128ull * SZ_1G)
+
+/* the minimum size of the dpa range for a subdevice */
+#define ROUTING_MIN_DPA_PER_SD (8ull * SZ_1G)
+
+/*
+ * FID Structure
+ *
+ * [19:6] base fid
+ *          - pulled from the whoami register (source) or the bridge fid
+ *            lookup table (destination)
+ * [ 5:3] path id
+ *          - pulled from the hash/modulo logic applied to the destination
+ *            physical address
+ *          - note that this is configurable from 0 to 3 bits
+ * [ 2:1] mdfi channel
+ *          - set by the originator... source and destination always use
+ *            the same mdfi channel
+ * [ 0:0] host flag
+ *          - not currently used; spec'd for a method of indication that
+ *            this traffic is bound for a host memory interface
+ *
+ * Due to the host flag being unused, all odd FIDs are invalid within a
+ * block.
+ */
+#define ROUTING_FID_BASE_MASK GENMASK(19, 6)
+#define ROUTING_FID_PATH_MASK GENMASK(5, 3)
+#define ROUTING_FID_MDFI_MASK GENMASK(2, 1)
+#define ROUTING_FID_HOST_MASK GENMASK(0, 0)
+
+#define ROUTING_FID_NUM_PATHS 8
+#define ROUTING_FID_NUM_CHANNELS 3
+
+static inline bool is_valid_fid(u16 fid)
+{
+	bool host_fid =  FIELD_GET(ROUTING_FID_HOST_MASK, fid);
+	u16 channel = FIELD_GET(ROUTING_FID_MDFI_MASK, fid);
+
+	return !host_fid && channel < ROUTING_FID_NUM_CHANNELS;
+}
+
+/*
+ * FID Address Space
+ *
+ * The following shows the layout of the FID address space.
+ *
+ * Tiles are assumed to be 64 GB aligned; thus the upper bits of the DPA
+ * starting at bit 36 determine the address range index.  This index then maps
+ * twice into the FID space: once for the management FID, and once for the
+ * contiguous block of FIDs assigned to the bridge endpoints.
+ *
+ * The first 64 FIDs are reserved to ensure any that any a DFID lookup that
+ * emits 0 can not overlap any valid FIDs.
+ *
+ * The second reserved block merely pads to the next by-64 alignment to begin
+ * addressing bridge blocks.
+ *
+ * ---------
+ *      0 : reserved
+ *    ...
+ *     63 : reserved
+ * ---------
+ *     64 : Mgmt FID for sd with DPA index 0 (0 GB)
+ *     65 : Mgmt FID for sd with DPA index 1 (64 GB)
+ *     66 : Mgmt FID for sd with DPA index 2 (128 GB)
+ *    ...
+ *    818 : Mgmt FID for sd with DPA index 755 (48320 GB)
+ * ---------
+ *    819 : reserved
+ *    ...
+ *    831 : reserved
+ * ---------
+ *    832 : Starting bridge FID for sd with DPA index 0
+ *    896 : Starting bridge FID for sd with DPA index 1
+ *    960 : Starting bridge FID for sd with DPA index 2
+ *    ...
+ *  49088 : Starting bridge FID for sd with DPA index 755
+ * ---------
+ */
+
+/* The size of a FID block assigned to a sd for bridge ports. */
+#define ROUTING_FID_BLOCK_SIZE 64
+
+/*
+ * Generates a FID mask for a FID block consisting of only valid DFIDs
+ * (those without the host flag set and those avoiding the fourth
+ * MDFI channel).
+ */
+#define ROUTING_FID_BLOCK_MASK 0x1515151515151515ull
+
+/* The number of valid (non-host) FIDs per block. */
+#define ROUTING_VALID_FIDS_PER_BLOCK (ROUTING_FID_NUM_PATHS * ROUTING_FID_NUM_CHANNELS)
+
+/* Limit on maximum path length through a fabric. */
+#define ROUTING_HOP_LIMIT 64
+
+/*
+ * The starting FID for management port assignment.
+ *
+ * Defaulted to the block size so that all FIDs in the "zero" block are
+ * unused.  This allows a zero output in the DPA->DFID LUT to refer
+ * to an entire invalid block, rather than just an invalid base FID.
+ */
+#define ROUTING_FID_CPORT_BASE ROUTING_FID_BLOCK_SIZE
+
+/*
+ * The starting FID for bridge port assignment.
+ *
+ * Must be aligned to the block size.
+ */
+#define ROUTING_FID_BLOCK_BASE 832
+
+/*
+ * The maximum number of supported devices.
+ *
+ * A device with a DPA range index less than this is guaranteed to receive a
+ * FID and be mappable by the DFID LUT.
+ *
+ * Determined by the minimum of:
+ *   - the number of CPORT FIDs that fit into the FID address space
+ *   - the number of bridge FID blocks that fit into the FID address space
+ *   - the number of entries available in the DPA->DFID lookup table
+ */
+#define ROUTING_MAX_DEVICES 755
+
+/*
+ * The number of entries in the bridge DFID lookup table.
+ */
+#define ROUTING_DPA_DFID_MAP_SIZE 8192
+
+/*
+ * The FIDGEN LUT maps DPA indexes to only the upper bits of the DFID, which
+ * varies based on the modulo in use.  Since we're statically configuring a
+ * maximum modulo, this is statically 6 bits of shift to convert between
+ * LUT entries and DFIDs.
+ *
+ * DFID == (LUT[i] << 6) | (PATH << 3) | (MDFI << 1) | HOST
+ */
+#define ROUTING_DPA_DFID_MAP_SHIFT 6
+
+struct routing_topology;
+
+struct routing_dfid_map {
+	u16 size;
+
+	/*
+	 * each entry:
+	 *   [19:0] base DFID, after shifting out the lower path/mdfi bits
+	 */
+	u64 dfid[];
+};
+
+/*
+ * invalid port value for the uncompressed 8-bit hw rpipe used by the mbdb
+ * mailbox operations
+ *
+ * don't set the upper 'X' bit used for override tables or adaptive routing,
+ * as these features are disabled by HW
+ */
+#define ROUTING_UFT_INVALID_PORT8 0x7f
+
+/*
+ * invalid port value for the compressed 4-bit driver uft structure used by
+ * the in-memory driver structures
+ */
+#define ROUTING_UFT_INVALID_PORT4 0xf
+
+/*
+ * Routing Table Structure
+ *
+ * A unicast forwarding table (UFT) is a mapping from destination FID (DFID)
+ * to output port.
+ *
+ * On devices, this is stored in the route pipe IP block (RPIPE), with 48k
+ * entries, indexed by DFID, each mapping to an 8-bit port.
+ *
+ * In the driver all management FIDs are allocated as a single contiguous
+ * block.  Each subdevice is additionally allocated a single contiguous block
+ * for its bridge endpoint FIDs, and these blocks are stored in an xarray.
+ *
+ * The driver builds two (potentially) different UFTs for each subdevice: one
+ * for CPORT and bridge ports, and another for fabric ports.  This lets the
+ * driver route traffic entering the fabric differently than traffic that is
+ * making a hop through an intermediate switch.
+ *
+ * Since the driver only needs 4 bits to indicate a valid fabric port, and it
+ * builds only two UFTs, it can map each FID to both ports in a single byte.
+ * In the result::
+ *  - the lower nibble represents the entry for the "origin" UFT, and...
+ *  - the upper nibble represents the entry for the "hop" UFT.
+ *
+ * The routing_entry_* functions abstract away this encoding, taking as a
+ * parameter a selector to distinguish between the two UFTs.
+ */
+
+/**
+ * struct routing_uft - Sparsely stores all of the unicast forwarding table
+ * (UFT) entries for a sd.
+ * @mgmt: A single UFT block mapping mgmt DFIDs to ports.
+ * @bridges: An xarray of UFT blocks mapping bridge DFIDs to ports, one block
+ *   per destination sd, indexed by DPA index.  Entries are allocated
+ *   on demand during routing.
+ */
+struct routing_uft {
+	u8 *mgmt;
+	struct xarray bridges;
+};
+
+u8 *routing_uft_block_alloc(u16 num_fids);
+u8 *routing_uft_bridge_get(struct routing_uft *uft, struct fsubdev *sd_dst);
+
+struct routing_uft *routing_uft_alloc(void);
+void routing_uft_destroy(struct routing_uft *uft);
+void routing_uft_update(struct fsubdev *sd);
+
+void routing_dfid_map_update(struct fsubdev *sd);
+
+static inline void routing_update(struct fsubdev *sd)
+{
+	routing_uft_update(sd);
+	routing_dfid_map_update(sd);
+}
+
+/* UFT source selector (fabric vs bridge UFTs are programmed differently) */
+enum uft_sel {
+	/* used for traffic arriving locally */
+	UFT_SEL_ORIGIN = 1,
+	/* used for traffic arriving from the fabric */
+	UFT_SEL_HOP = 2,
+	/* used for all traffic */
+	UFT_SEL_BOTH = 3,
+};
+
+static inline void routing_uft_entry_set(u8 *block, enum uft_sel sel,
+					 u16 fid_offset, u8 port)
+{
+	switch (sel) {
+	case UFT_SEL_ORIGIN:
+		block[fid_offset] = (block[fid_offset] & 0xf0) | (port & 0xf);
+		break;
+	case UFT_SEL_HOP:
+		block[fid_offset] = ((port & 0xf) << 4) |
+				    (block[fid_offset] & 0xf);
+		break;
+	case UFT_SEL_BOTH:
+		block[fid_offset] = ((port & 0xf) << 4) | (port & 0xf);
+		break;
+	}
+}
+
+static inline u8 routing_uft_entry_get(const u8 *block, enum uft_sel sel,
+				       u16 fid_offset)
+{
+	u8 port = ROUTING_UFT_INVALID_PORT4;
+
+	switch (sel) {
+	case UFT_SEL_ORIGIN:
+		port = block[fid_offset] & 0xf;
+		break;
+	case UFT_SEL_HOP:
+		port = (block[fid_offset] >> 4) & 0xf;
+		break;
+	case UFT_SEL_BOTH:
+		break;
+	}
+
+	return port;
+}
+
+static inline int routing_sd_is_error(struct fsubdev *sd)
+{
+	return sd->routing.state == TILE_ROUTING_STATE_ERROR;
+}
+
+#define ROUTING_COST_INFINITE 0xffff
+
+struct routing_plane {
+	struct list_head topo_link;
+	struct list_head sd_list;
+	struct routing_topology *topo;
+	u16 index;
+	u16 num_subdevs;
+	u16 *cost;
+};
+
+enum routing_policy {
+	ROUTING_POLICY_DEFAULT,
+	ROUTING_POLICY_RESILIENCY,
+	ROUTING_POLICY_ROUTE_THROUGH,
+};
+
+/**
+ * struct routing_topology - Top-level fabric context maintained during a
+ * routing sweep.
+ * @plane_list: list of planes discovered
+ * @num_planes: number of planes in plane_list
+ * @max_dpa_index: maximum DPA index (inclusive)
+ * @sd_error_signal: true if an sd transitioned to error during the sweep
+ * @policy: routing policy enablement flags
+ * @fid_groups: bit mask of in-use fid groups
+ */
+struct routing_topology {
+	struct list_head plane_list;
+	u16 num_planes;
+	u16 max_dpa_index;
+	bool sd_error_signal;
+	enum routing_policy policy;
+	unsigned long fid_groups[BITS_TO_LONGS(ROUTING_MAX_DEVICES)];
+};
+
+/*
+ * The following API methods wrap the error flag in a tiny API that clarifies
+ * its usage: to allow the topology context for a sweep to be signalled of any
+ * subdevices transitioning to error, which guides error recovery behavior in
+ * the routing engine.
+ */
+
+static inline void routing_topo_reset_sd_error(struct routing_topology *topo)
+{
+	topo->sd_error_signal = false;
+}
+
+static inline void routing_topo_signal_sd_error(struct routing_topology *topo)
+{
+	topo->sd_error_signal = true;
+}
+
+static inline bool routing_topo_check_sd_error(struct routing_topology *topo)
+{
+	return topo->sd_error_signal;
+}
+
+/**
+ * neighbor_of - Returns the neighbor port associated with the specified port.
+ * @port: The local port to query the neighbor of.
+ *
+ * Only valid if the routing.neighbor field has been populated, and only
+ * remains valid as long as the routing lock is held.
+ *
+ * Return: The port neighboring the specified port.
+ */
+static inline struct fport *neighbor_of(struct fport *port)
+{
+	return port->routing.neighbor;
+}
+
+static inline bool port_is_routable(struct fport *port)
+{
+	return port->state == PM_PORT_STATE_ACTIVE &&
+			test_bit(PORT_CONTROL_ROUTABLE, port->controls);
+}
+
+void routing_sd_transition_error(struct fsubdev *sd);
+
+struct fsubdev *routing_sd_iter(int all);
+struct fsubdev *routing_sd_next(struct fsubdev *sd, int all);
+
+#endif /* ROUTING_TOPO_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/selftests/routing_mock.c b/drivers/gpu/drm/xe/fabric/selftests/routing_mock.c
new file mode 100644
index 0000000000000..69e314a32c245
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/routing_mock.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include "routing_mock.h"
+#include "../routing_engine.h"
+#include "../routing_logic.h"
+#include "../routing_p2p.h"
+
+struct spec {
+	u16 num_devices;
+	u8 num_subdevs;
+};
+
+static void routing_mock_populate_a21_spec(struct spec *spec)
+{
+	spec->num_devices = 6;
+	spec->num_subdevs = 2;
+}
+
+static void init_port_maps(struct fsubdev *sd)
+{
+	u8 lpn;
+
+	for (lpn = PORT_FABRIC_START; lpn <= PORT_FABRIC_END; ++lpn)
+		__set_bit(lpn, sd->fport_lpns);
+
+	for (lpn = PORT_BRIDGE_START; lpn <= PORT_BRIDGE_END; ++lpn)
+		__set_bit(lpn, sd->bport_lpns);
+}
+
+static int routing_mock_sd(struct spec *spec,
+			   struct routing_topology *topo,
+			   struct fdev *dev, int dev_id,
+			   struct fsubdev *sd, int sd_index)
+{
+	struct portinfo *pi;
+	u8 lpn;
+
+	WARN_ON(dev_id >= spec->num_devices);
+	WARN_ON(sd_index >= spec->num_subdevs);
+
+	sd->fdev = dev;
+	sd->port_cnt = PORT_FABRIC_COUNT;
+	sd->guid = (0xffull << 56) | (dev_id << 8) | sd_index;
+	sd->switchinfo.guid = sd->guid;
+	sd->asic_rev_info = FIELD_PREP(MASK_ARI_PLATFORM, ANR_ARI_PLATFORM)
+			  | FIELD_PREP(MASK_ARI_STEP, ANR_ARI_STEP_B0);
+
+	init_port_maps(sd);
+
+	routing_sd_init(sd);
+
+	list_add_tail(&sd->routable_link, &routable_list);
+
+	for (lpn = 1; lpn <= PORT_FABRIC_COUNT; ++lpn) {
+		pi = &sd->portinfo_op.per_portinfo[lpn];
+		pi->link_speed_active = LINK_SPEED_90G;
+		pi->link_width_active = LINK_WIDTH_4X;
+		pi->link_width_downgrade_rx_active = LINK_WIDTH_4X;
+		pi->link_width_downgrade_tx_active = LINK_WIDTH_4X;
+
+		sd->port[lpn].sd = sd;
+		sd->port[lpn].lpn = lpn;
+		sd->port[lpn].portinfo = pi;
+		set_bit(PORT_CONTROL_ROUTABLE, sd->port[lpn].controls);
+		if (lpn < spec->num_devices) {
+			/* initialize first N-1 ports as ISLs */
+			sd->port[lpn].state = PM_PORT_STATE_ACTIVE;
+			sd->port[lpn].phys_state = IAF_FW_PORT_PHYS_LINKUP;
+			sd->port[lpn].log_state = IAF_FW_PORT_ACTIVE;
+		} else {
+			/* rest of ports are offline */
+			sd->port[lpn].state = PM_PORT_STATE_INACTIVE;
+			sd->port[lpn].phys_state = IAF_FW_PORT_PHYS_DISABLED;
+			sd->port[lpn].log_state = IAF_FW_PORT_DOWN;
+		}
+	}
+
+	return 0;
+}
+
+static int routing_mock_device(struct spec *spec,
+			       struct routing_topology *topo,
+			       struct fdev *dev, int dev_id)
+{
+	int sd_idx;
+	int err;
+
+	WARN_ON(dev_id >= spec->num_devices);
+
+	for (sd_idx = 0; sd_idx < spec->num_subdevs; ++sd_idx) {
+		err = routing_mock_sd(spec, topo, dev, dev_id,
+				      &dev->sd[sd_idx], sd_idx);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+struct port_vec {
+	struct fdev *dev;
+	int sd;
+	u8 lpn;
+};
+
+static void routing_mock_interconnect_port(struct spec *spec,
+					   struct routing_topology *topo,
+					   struct port_vec *src)
+{
+	struct port_vec dst;
+	struct portinfo *pi_src;
+
+	/*
+	 * target device is chosen by contiguous assignment toward increasing
+	 * indices (port 1 to src.d+1, port 2 to src.d+2, etc.)
+	 */
+	dst.dev = fdev_find((src->dev->pd->index + src->lpn) %
+			    spec->num_devices);
+
+	/* target sd is always the same as the source sd */
+	dst.sd = src->sd;
+
+	/*
+	 * target port uses the same assignment rule, which ends up counting
+	 * backwards relative to the source (1->5, 2->4, 3->3, etc.)
+	 */
+	dst.lpn = spec->num_devices - src->lpn;
+
+	pi_src = src->dev->sd[src->sd].port[src->lpn].portinfo;
+	pi_src->neighbor_guid = dst.dev->sd[dst.sd].switchinfo.guid;
+	pi_src->neighbor_port_number = dst.lpn;
+
+	fdev_put(dst.dev);
+}
+
+/*
+ * Connects devices in an all-to-all topology.
+ *
+ * Each individual device assigns outbound port 1 to their first neighbor
+ * to the right, then port 2 to their second neighbor to the right, and
+ * so on.
+ *
+ * So given N devices, the jth port of the ith device goes to device
+ * ((i + j) % N).
+ */
+static void routing_mock_interconnect(struct spec *spec,
+				      struct routing_topology *topo)
+{
+	struct port_vec src;
+	int dev_id;
+
+	for (dev_id = 0; dev_id < spec->num_devices; ++dev_id) {
+		src.dev = fdev_find(dev_id);
+		for (src.sd = 0; src.sd < spec->num_subdevs; ++src.sd)
+			for (src.lpn = PORT_FABRIC_START;
+			     src.lpn < spec->num_devices; ++src.lpn)
+				routing_mock_interconnect_port(spec, topo,
+							       &src);
+		fdev_put(src.dev);
+	}
+}
+
+static struct iaf_pdata *routing_mock_pd_create(struct spec *spec, int dev_id)
+{
+	struct iaf_pdata *pd;
+	u64 dpa_per_sd;
+
+	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return ERR_PTR(-ENOMEM);
+
+	pd->index = dev_id;
+	pd->sd_cnt = spec->num_subdevs;
+
+	/* initially determine maximum DPA per SD... */
+	dpa_per_sd = ROUTING_DEV_DPA_ALIGNMENT / pd->sd_cnt;
+
+	/*
+	 * ...then use as much memory as available to exercise logic for
+	 * multiple dpa->fid lut entries, but reduced by one so that we also
+	 * have to deal with holes
+	 */
+	dpa_per_sd = max(ROUTING_MIN_DPA_PER_SD,
+			 dpa_per_sd - ROUTING_MIN_DPA_PER_SD);
+
+	pd->dpa.pkg_offset = dev_id * ROUTING_DEV_DPA_ALIGNMENT / SZ_1G;
+	pd->dpa.pkg_size = dpa_per_sd * pd->sd_cnt / SZ_1G;
+
+	return pd;
+}
+
+int routing_mock_create_topology(struct routing_topology *topo)
+{
+	struct spec spec;
+	struct fdev *dev;
+	int dev_id;
+	int err;
+
+	routing_mock_populate_a21_spec(&spec);
+
+	if (spec.num_devices > ROUTING_MAX_DEVICES) {
+		pr_err("%s: invalid topology spec: devices exceeds limit: %u > %u",
+		       __func__, spec.num_devices, ROUTING_MAX_DEVICES);
+		return -EINVAL;
+	}
+
+	memset(topo, 0, sizeof(*topo));
+	INIT_LIST_HEAD(&topo->plane_list);
+
+	for (dev_id = 0; dev_id < spec.num_devices; ++dev_id) {
+		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+		if (!dev)
+			return -ENOMEM;
+
+		dev->pd = routing_mock_pd_create(&spec, dev_id);
+		if (IS_ERR(dev->pd)) {
+			err = PTR_ERR(dev->pd);
+			kfree(dev);
+			return err;
+		}
+
+		err = routing_mock_device(&spec, topo, dev, dev_id);
+		if (err) {
+			kfree(dev->pd);
+			kfree(dev);
+			return err;
+		}
+
+		dev->fabric_id = dev->pd->index;
+		err = fdev_insert(dev);
+		if (err) {
+			kfree(dev->pd);
+			kfree(dev);
+			return err;
+		}
+	}
+
+	routing_mock_interconnect(&spec, topo);
+
+	return 0;
+}
+
+static int routing_mock_destroy_cb(struct fdev *dev, void *args)
+{
+	int i;
+	struct xarray *fdevs_to_free = args;
+
+	for (i = 0; i < dev->pd->sd_cnt; ++i)
+		routing_sd_destroy(dev->sd + i);
+
+	routing_p2p_clear(dev);
+
+	if (xa_insert(fdevs_to_free, dev->fabric_id, dev, GFP_KERNEL))
+		pr_warn("fabric_id 0x%08x already in use\n", dev->fabric_id);
+
+	return 0;
+}
+
+void routing_mock_destroy(struct routing_topology *topo)
+{
+	struct routing_plane *plane, *plane_tmp;
+	struct xarray fdevs_to_free;
+	struct fdev *dev;
+	unsigned long i;
+	int refcount;
+
+	xa_init(&fdevs_to_free);
+
+	fdev_process_each(routing_mock_destroy_cb, &fdevs_to_free);
+
+	xa_for_each(&fdevs_to_free, i, dev) {
+		for (refcount = refcount_read(&dev->refs.refcount); refcount;
+		     refcount = refcount_read(&dev->refs.refcount)) {
+			if (refcount != 1)
+				pr_warn("fabric_id 0x%08x refcount %d\n", dev->fabric_id, refcount);
+			fdev_put(dev);
+		}
+
+		kfree(dev->pd);
+		kfree(dev);
+	}
+
+	xa_destroy(&fdevs_to_free);
+
+	list_for_each_entry_safe(plane, plane_tmp, &topo->plane_list, topo_link)
+		routing_plane_destroy(plane);
+}
diff --git a/drivers/gpu/drm/xe/fabric/selftests/routing_mock.h b/drivers/gpu/drm/xe/fabric/selftests/routing_mock.h
new file mode 100644
index 0000000000000..a8d39f81dd9d9
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/routing_mock.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef SELFTESTS_ROUTING_MOCK_H_INCLUDED
+#define SELFTESTS_ROUTING_MOCK_H_INCLUDED
+
+#if IS_ENABLED(CONFIG_IAF_DEBUG_SELFTESTS)
+#include "../routing_topology.h"
+
+#define PORT_FABRIC_START      1
+#define PORT_FABRIC_END        8
+#define PORT_BRIDGE_START      9
+#define PORT_BRIDGE_END        (PORT_COUNT - 1)
+
+int routing_mock_create_topology(struct routing_topology *topo);
+void routing_mock_destroy(struct routing_topology *topo);
+#endif
+
+#endif /* SELFTESTS_ROUTING_MOCK_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.c b/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.c
new file mode 100644
index 0000000000000..1f190992899ca
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include "../routing_logic.h"
+#include "../routing_p2p.h"
+#include "selftest.h"
+#include "routing_selftest.h"
+#include "routing_mock.h"
+
+static int validate_single_dpa(struct routing_topology *topo,
+			       struct fsubdev *sd_src)
+{
+	int i;
+	int start = sd_src->routing.dpa_idx_base;
+	int end = start + sd_src->routing.dpa_idx_range;
+	u16 dfid;
+
+	for (i = start; i < end; ++i) {
+		TEST(i <= topo->max_dpa_index,
+		     "topology has an accurate max dpa index");
+
+		dfid = (u16)(sd_src->routing.dfid_map_next->dfid[i] <<
+			     ROUTING_DPA_DFID_MAP_SHIFT);
+		TEST(dfid == 0,
+		     "sds configure their local memory range to invalid fids: device %u sd %u dpa_idx %d lut_value 0x%04x",
+		     sd_src->fdev->pd->index, sd_index(sd_src), i,
+		     (u16)sd_src->routing.dfid_map_next->dfid[i]);
+	}
+
+	return 0;
+}
+
+static int validate_single(struct routing_topology *topo,
+			   struct fsubdev *sd_src)
+{
+	struct fport *port;
+	u8 *block;
+	int err;
+	u16 dfid;
+	u16 i, j, n;
+	u8 fid_channel, port_channel;
+	u8 lpn, lpn_neighbor;
+
+	TEST(sd_src->routing.state != TILE_ROUTING_STATE_ERROR,
+	     "the sd has not errored");
+
+	TEST(sd_src->routing.plane, "the sd is assigned to a plane");
+
+	TEST(sd_src->routing.uft_next->mgmt,
+	     "the sd received a unicast forwarding table for mgmt fids");
+
+	TEST(!xa_empty(&sd_src->routing.uft_next->bridges),
+	     "the sd received a unicast forwarding table for bridge fids");
+
+	TEST(sd_src->routing.dfid_map_next, "the sd received a dfid map");
+
+	err = validate_single_dpa(topo, sd_src);
+	if (err)
+		return err;
+
+	lpn = routing_uft_entry_get(sd_src->routing.uft_next->mgmt,
+				    UFT_SEL_ORIGIN, sd_src->routing.fid_mgmt -
+				    ROUTING_FID_CPORT_BASE);
+
+	TEST(lpn == 0,
+	     "subdevs route their own mgmt fid to port 0: device %u sd %u fid 0x%04x port %u",
+	     sd_src->fdev->pd->index, sd_index(sd_src),
+	     sd_src->routing.fid_mgmt, lpn);
+
+	block = routing_uft_bridge_get(sd_src->routing.uft_next, sd_src);
+
+	TEST(block, "sd uft block to self is valid");
+
+	for (dfid = 0; dfid < ROUTING_FID_BLOCK_SIZE; ++dfid) {
+		lpn = routing_uft_entry_get(block, UFT_SEL_ORIGIN, dfid);
+
+		if (!is_valid_fid(dfid)) {
+			TEST(lpn == ROUTING_UFT_INVALID_PORT4,
+			     "routes to invalid fids are invalid: device %u sd %u dfid 0x%04x port %u",
+			     sd_src->fdev->pd->index, sd_index(sd_src),
+			     dfid, lpn);
+
+			continue;
+		}
+		fid_channel = FIELD_GET(ROUTING_FID_MDFI_MASK, dfid);
+		if (fid_channel == ROUTING_FID_NUM_CHANNELS) {
+			TEST(lpn == ROUTING_UFT_INVALID_PORT4,
+			     "fids to the fourth bridge are not routed: device %u sd %u dfid 0x%04x port %u",
+			     sd_src->fdev->pd->index, sd_index(sd_src),
+			     dfid, lpn);
+			continue;
+		}
+
+		TEST(lpn >= PORT_BRIDGE_START && lpn <= PORT_BRIDGE_END,
+		     "local fids map to the local bridge ports: device %u sd %u fid 0x%04x port %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_src->routing.fid_base + dfid, lpn);
+
+		port_channel = lpn - PORT_BRIDGE_START;
+		TEST(fid_channel == port_channel,
+		     "fid mdfi channel is consistent with bridge port: device %u sd %u fid 0x%04x port %u fid_channel %u port_channel %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_src->routing.fid_base + dfid, lpn,
+		     fid_channel, port_channel);
+	}
+
+	for_each_fabric_port(port, lpn, sd_src) {
+		TEST(!port->portinfo->neighbor_guid || neighbor_of(port),
+		     "ports with neighbor guids have neighbors: device %u sd %u port %u neighbor_guid 0x%016llx neighbor_valid %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     port->lpn, port->portinfo->neighbor_guid,
+		     !!neighbor_of(port));
+
+		if (!port->portinfo->neighbor_guid)
+			continue;
+
+		lpn_neighbor = port->portinfo->neighbor_port_number;
+
+		TEST(!port->portinfo->neighbor_port_number ||
+		     test_bit(lpn_neighbor, sd_src->fport_lpns),
+		     "neighbors of fabric ports are fabric ports");
+
+		n = sd_src->routing.plane->num_subdevs;
+		i = sd_src->routing.plane_index;
+		j = neighbor_of(port)->sd->routing.plane_index;
+		TEST(sd_src->routing.plane->cost[i * n + j] == 1,
+		     "the cost to a neighbor is exactly 1");
+	}
+
+	return 0;
+}
+
+static int validate_pair_dfid(struct routing_topology *topo,
+			      struct fsubdev *sd_src,
+			      struct fsubdev *sd_dst,
+			      u16 dfid)
+{
+	u8 *block;
+	struct fport *port, *nport;
+	u8 lpn;
+
+	TEST(sd_index(sd_src) != sd_index(sd_dst) ||
+	     sd_src->routing.plane == sd_dst->routing.plane,
+	     "subdevices with the same offset share a plane");
+
+	block = routing_uft_bridge_get(sd_src->routing.uft_next, sd_dst);
+
+	TEST(block, "sd uft block to destination is valid");
+
+	lpn = routing_uft_entry_get(block, UFT_SEL_ORIGIN,
+				    dfid - sd_dst->routing.fid_base);
+
+	if (!is_valid_fid(dfid)) {
+		TEST(lpn == ROUTING_UFT_INVALID_PORT4,
+		     "routes to invalid fids are invalid: device %u sd %u dfid 0x%04x port %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     dfid, lpn);
+	} else if (sd_src->routing.plane == sd_dst->routing.plane) {
+		TEST(lpn < PORT_COUNT,
+		     "uft entries exist for every on-plane dfid: source devce %u sd %u; dest device %u sd %u; dfid 0x%04x port %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_dst->fdev->pd->index, sd_index(sd_dst),
+		     dfid, lpn);
+
+		port = get_fport_handle(sd_src, lpn);
+		TEST(port,
+		     "fabric port numbers map to valid ports: port %u", lpn);
+
+		nport = neighbor_of(port);
+		TEST(nport && nport->sd == sd_dst,
+		     "uft entries point to the correct neighbor: source device %u sd %u; dest device %u sd %u; dfid 0x%04x port %u neighbor valid %u device %u sd %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_dst->fdev->pd->index, sd_index(sd_dst),
+		     dfid, lpn, nport ? 1 : 0,
+		     nport ? nport->sd->fdev->pd->index : 0,
+		     nport ? sd_index(nport->sd) : 0);
+	} else {
+		TEST(lpn == ROUTING_UFT_INVALID_PORT4,
+		     "routes to off-plane fids are invalid");
+	}
+
+	return 0;
+}
+
+static int validate_pair_dpa_entry(struct routing_topology *topo,
+				   struct fsubdev *sd_src,
+				   struct fsubdev *sd_dst, u16 dpa_idx)
+{
+	struct fsubdev *neighbor;
+	u16 dfid = (u16)(sd_src->routing.dfid_map_next->dfid[dpa_idx] <<
+			 ROUTING_DPA_DFID_MAP_SHIFT);
+	int i;
+
+	for (i = 0; i < sd_dst->fdev->pd->sd_cnt; ++i) {
+		neighbor = &sd_dst->fdev->sd[i];
+		if (neighbor->routing.fid_base != dfid)
+			continue;
+		if (routing_cost_lookup(sd_src, neighbor) ==
+		    ROUTING_COST_INFINITE)
+			continue;
+		return 0;
+	}
+
+	FAIL("dfid does not map to a reachable subdevice: src device %u sd %u;"
+	     " dst device %u sd %u; dpa_idx %u dfid 0x%04x\n",
+	     sd_src->fdev->pd->index, sd_index(sd_src),
+	     sd_dst->fdev->pd->index, sd_index(sd_dst), dpa_idx, dfid);
+}
+
+static int validate_pair_dpa(struct routing_topology *topo,
+			     struct fsubdev *sd_src,
+			     struct fsubdev *sd_dst)
+{
+	u16 i;
+	u16 dst_start = sd_dst->routing.dpa_idx_base;
+	u16 dst_end = dst_start + sd_dst->routing.dpa_idx_range;
+	u16 src_start = sd_src->routing.dpa_idx_base;
+	u16 src_end = src_start + sd_src->routing.dpa_idx_range;
+	int err;
+
+	for (i = dst_start; i < dst_end; ++i) {
+		err = validate_pair_dpa_entry(topo, sd_src, sd_dst, i);
+		if (err)
+			return err;
+
+		TEST(src_start >= dst_end || dst_start >= src_end,
+		     "addresses are unique across all sds, regardless of plane");
+	}
+
+	return 0;
+}
+
+static int validate_p2p_test(struct fsubdev *sd_src, struct fsubdev *sd_dst,
+			     struct query_info *qi, u16 bw, u16 lat)
+{
+	int i;
+
+	for (i = 0; i < qi->src_cnt * qi->dst_cnt; ++i) {
+		TEST(qi->sd2sd[i].bandwidth == bw,
+		     "bandwidth is valid: src %u dst %u index %u: actual %u expected %u",
+		     sd_src->fdev->pd->index, sd_dst->fdev->pd->index, i,
+		     qi->sd2sd[i].bandwidth, bw);
+		TEST(qi->sd2sd[i].latency == lat,
+		     "latency is valid: src %u dst %u index %u: actual %u expected %u",
+		     sd_src->fdev->pd->index, sd_dst->fdev->pd->index, i,
+		     qi->sd2sd[i].latency, lat);
+	}
+
+	return 0;
+}
+
+static int validate_p2p(struct fsubdev *sd_src, struct fsubdev *sd_dst)
+{
+	struct query_info *qi;
+	int n;
+	u16 bw, lat;
+	int err;
+
+	/* only do p2p test once per device */
+	if (sd_index(sd_src) || sd_index(sd_dst))
+		return 0;
+
+	n = sd_src->fdev->pd->sd_cnt * sd_dst->fdev->pd->sd_cnt;
+	qi = kzalloc(struct_size(qi, sd2sd, n), GFP_KERNEL);
+	if (!qi)
+		return -ENOMEM;
+
+	qi->src_cnt = sd_src->fdev->pd->sd_cnt;
+	qi->dst_cnt = sd_dst->fdev->pd->sd_cnt;
+
+	routing_p2p_lookup(sd_src->fdev, sd_dst->fdev, qi);
+
+	if (sd_src->fdev == sd_dst->fdev) {
+		/* intra-device is reported as no fabric connectivity */
+		bw = 0;
+		lat = 0;
+	} else {
+		/* inter-device is one hop at 90g/4x link config */
+		bw = 360;
+		lat = 10;
+	}
+
+	err = validate_p2p_test(sd_src, sd_dst, qi, bw, lat);
+
+	kfree(qi);
+	return err;
+}
+
+static int validate_pair(struct routing_topology *topo,
+			 struct fsubdev *sd_src,
+			 struct fsubdev *sd_dst)
+{
+	int err;
+	u16 dfid;
+	u8 lpn;
+
+	TEST(sd_src->routing.fid_base != sd_dst->routing.fid_base,
+	     "fids are unique across all subdevs, regardless of plane");
+
+	err = validate_pair_dpa(topo, sd_src, sd_dst);
+	if (err)
+		return err;
+
+	lpn = routing_uft_entry_get(sd_src->routing.uft_next->mgmt,
+				    UFT_SEL_ORIGIN, sd_dst->routing.fid_mgmt -
+				    ROUTING_FID_CPORT_BASE);
+
+	if (sd_src->routing.plane == sd_dst->routing.plane) {
+		TEST(lpn >= PORT_FABRIC_START && lpn <= PORT_FABRIC_END,
+		     "routes to on-plane remote mgmt fids go via fabric ports: device %u sd %u dfid 0x%04x port %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_dst->routing.fid_mgmt, lpn);
+	} else {
+		TEST(lpn == ROUTING_UFT_INVALID_PORT4,
+		     "routes to off-plane remote mgmt fids are invalid: device %u sd %u dfid 0x%04x port %u",
+		     sd_src->fdev->pd->index, sd_index(sd_src),
+		     sd_dst->routing.fid_mgmt, lpn);
+	}
+
+	for (dfid = sd_dst->routing.fid_base;
+	     dfid < sd_dst->routing.fid_base + ROUTING_FID_BLOCK_SIZE; ++dfid) {
+		err = validate_pair_dfid(topo, sd_src, sd_dst, dfid);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/*
+ * Validate the routing calculations, assuming a healthy point-to-point
+ * topology.
+ */
+static int validate(struct routing_topology *topo)
+{
+	struct fsubdev *sd_src, *sd_dst;
+	int err;
+
+	for (sd_src = routing_sd_iter(1); sd_src;
+	     sd_src = routing_sd_next(sd_src, 1)) {
+		err = validate_single(topo, sd_src);
+		if (err)
+			return err;
+
+		for (sd_dst = routing_sd_iter(1); sd_dst;
+		     sd_dst = routing_sd_next(sd_dst, 1)) {
+			if (sd_src == sd_dst ||
+			    sd_src->fdev == sd_dst->fdev)
+				continue;
+
+			TEST(sd_src->fdev->pd->index !=
+			     sd_dst->fdev->pd->index,
+			     "devices do not share indices");
+
+			err = validate_pair(topo, sd_src, sd_dst);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static void mock_io(struct routing_topology *topo)
+{
+	struct fsubdev *sd;
+
+	/* just update the pending structures as if they were written */
+	for (sd = routing_sd_iter(1); sd; sd = routing_sd_next(sd, 1))
+		routing_update(sd);
+
+	routing_p2p_cache();
+}
+
+static int validate_post_io(void)
+{
+	struct fsubdev *sd_src, *sd_dst;
+	int err;
+
+	for (sd_src = routing_sd_iter(1); sd_src;
+	     sd_src = routing_sd_next(sd_src, 1)) {
+		for (sd_dst = routing_sd_iter(1); sd_dst;
+		     sd_dst = routing_sd_next(sd_dst, 1)) {
+			err = validate_p2p(sd_src, sd_dst);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+int routing_selftest(void)
+{
+	struct routing_topology topo;
+	int err;
+
+	err = routing_mock_create_topology(&topo);
+	if (err) {
+		pr_err("%s: failed to create topology: %d\n", __func__, err);
+		goto exit;
+	}
+
+	err = routing_logic_run(&topo);
+	if (err) {
+		pr_err("%s: failed to route topology: %d\n", __func__, err);
+		goto exit;
+	}
+
+	err = validate(&topo);
+	if (err)
+		goto exit;
+
+	mock_io(&topo);
+
+	err = validate_post_io();
+
+exit:
+	routing_mock_destroy(&topo);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.h b/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.h
new file mode 100644
index 0000000000000..7a9efc431cdad
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/routing_selftest.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef SELFTESTS_ROUTING_SELFTEST_H_INCLUDED
+#define SELFTESTS_ROUTING_SELFTEST_H_INCLUDED
+
+int routing_selftest(void);
+
+#endif /* SELFTESTS_ROUTING_SELFTEST_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/selftests/selftest.c b/drivers/gpu/drm/xe/fabric/selftests/selftest.c
new file mode 100644
index 0000000000000..042cd7bd34503
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/selftest.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+
+#include "selftest.h"
+#include "routing_selftest.h"
+
+enum selftest_mode {
+	SELFTEST_MODE_DISABLED = 0,
+	SELFTEST_MODE_RUN_CONTINUE = 1,
+	SELFTEST_MODE_RUN_EXIT = -1,
+};
+
+static enum selftest_mode selftest_mode;
+
+typedef int (*selftest_fn)(void);
+
+struct selftest_entry {
+	char *name;
+	selftest_fn fn;
+};
+
+#define SELFTEST_ENTRY(name) { #name, name }
+#define SELFTEST_END { NULL, NULL }
+
+static struct selftest_entry selftests[] = {
+	SELFTEST_ENTRY(routing_selftest),
+	SELFTEST_END,
+};
+
+static int execute(void)
+{
+	struct selftest_entry *entry = selftests;
+	int err = 0;
+
+	for (; entry->fn; entry++) {
+		err = entry->fn();
+		if (err) {
+			pr_err("SELFTEST: %s: FAIL: %d\n", entry->name, err);
+			goto exit;
+		} else {
+			pr_info("SELFTEST: %s: SUCCESS\n", entry->name);
+		}
+	}
+
+exit:
+	pr_info("selftests complete\n");
+	return err;
+}
+
+int selftests_run(void)
+{
+	switch (selftest_mode) {
+	case SELFTEST_MODE_DISABLED:
+		return 0;
+	case SELFTEST_MODE_RUN_CONTINUE:
+		return execute();
+	case SELFTEST_MODE_RUN_EXIT:
+		execute();
+		return -1;
+	}
+
+	pr_err("%s: invalid selftest mode: %d\n", __func__, selftest_mode);
+	return -1;
+}
+
+module_param_named(selftests, selftest_mode, int, 0400);
+MODULE_PARM_DESC(selftests, "Run selftests on driver load (0:disabled [default], 1:run tests then continue, -1:run tests then exit module)");
diff --git a/drivers/gpu/drm/xe/fabric/selftests/selftest.h b/drivers/gpu/drm/xe/fabric/selftests/selftest.h
new file mode 100644
index 0000000000000..c29a703e8081f
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/selftests/selftest.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef SELFTESTS_SELFTEST_H_INCLUDED
+#define SELFTESTS_SELFTEST_H_INCLUDED
+
+/**
+ * selftests_run - Execute selftests.
+ *
+ * Return: 0 if the driver should continue; non-zero otherwise.
+ */
+int selftests_run(void);
+
+/*
+ * 'make checkpatch' will complain about the return statment in the following
+ * macro:
+ */
+#define FAIL(msg, ...) \
+	do { \
+		pr_err("TEST FAILED: %s: assert: " msg "\n", __func__, ##__VA_ARGS__); \
+		return -EINVAL; \
+	} while (0)
+
+#define TEST(cond, msg, ...) \
+	do { \
+		if (!(cond)) { \
+			FAIL(msg, ##__VA_ARGS__); \
+		} \
+	} while (0)
+
+#endif /* SELFTESTS_SELFTEST_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/statedump.c b/drivers/gpu/drm/xe/fabric/statedump.c
new file mode 100644
index 0000000000000..2528f5e2307bd
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/statedump.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include "debugfs.h"
+#include "iaf_drv.h"
+#include "io.h"
+#include "mbdb.h"
+#include "ops.h"
+#include "statedump.h"
+
+#define STATEDUMP_FILE_NAME "statedump"
+
+#define STATEDUMP_MAX_OFFSETS 64
+
+/* State Dump descriptor fields */
+#define DUMP_START_ADDR GENMASK(31, 0)
+#define DUMP_LENGTH     GENMASK(55, 32)
+#define DUMP_COMMENT    GENMASK(59, 56)
+#define DUMP_TYPE       GENMASK(63, 60)
+
+#define SD_MAGIC   0x46575344
+#define SD_VERSION 1
+
+#define DUMP_VERSION GENMASK(31, 0)
+#define DUMP_MAGIC   GENMASK(63, 32)
+
+enum DUMP_TYPE_t {
+	DUMP_TYPE_XX,
+	DUMP_TYPE_32,
+	DUMP_TYPE_64,
+	DUMP_TYPE_32_OF_64,
+};
+
+struct statedump_rsp {
+	struct list_head rsp_list_link;
+	struct mbdb_statedump_rsp mbdb_rsp;
+};
+
+static int statedump_read_desc_data(struct fsubdev *sd, u8 *dst, size_t desc_len, u32 addr)
+{
+	do {
+		size_t xfer_len = min(MBOX_READ_DATA_SIZE_IN_BYTES, desc_len);
+		int ret;
+
+		ret = ops_csr_raw_read_nolock(sd, addr, xfer_len, dst);
+		if (ret)
+			return ret;
+
+		dst += xfer_len;
+		addr += xfer_len;
+		desc_len -= xfer_len;
+	} while (desc_len);
+
+	return 0;
+}
+
+static u8 *statedump_process_desc_rsp(struct fsubdev *sd, struct statedump_rsp *rsp, u8 *data)
+{
+	u64 *desc;
+	u16 desc_count;
+
+	for (desc = rsp->mbdb_rsp.descs, desc_count = rsp->mbdb_rsp.desc_count; desc_count--;
+	     desc++) {
+		u32 addr = FIELD_GET(DUMP_START_ADDR, *desc);
+		size_t desc_len = FIELD_GET(DUMP_LENGTH, *desc);
+		int ret;
+
+		if (FIELD_GET(DUMP_TYPE, *desc) == DUMP_TYPE_XX)
+			break;
+
+		memcpy(data, desc, sizeof(*desc));
+		data += sizeof(*desc);
+
+		if (!desc_len)
+			continue;
+
+		ret = statedump_read_desc_data(sd, data, desc_len, addr);
+		if (likely(!ret)) {
+			data += desc_len;
+		} else {
+			if (ret != MBOX_RSP_STATUS_DENIED)
+				return ERR_PTR(ret);
+
+			sd_warn(sd, "Access Denied for addr 0x%08x\n", addr);
+			data -= sizeof(*desc);
+			sd->statedump.blob.size -= sizeof(*desc) + desc_len;
+		}
+	}
+
+	return data;
+}
+
+static int statedump_process_desc_list(struct fsubdev *sd, struct list_head *rsp_list)
+{
+	u8 *data = sd->statedump.blob.data;
+	struct statedump_rsp *rsp;
+	__be64 magic_ver = cpu_to_be64(FIELD_PREP(DUMP_VERSION, SD_VERSION) |
+				       FIELD_PREP(DUMP_MAGIC, SD_MAGIC));
+
+	memcpy(data, &magic_ver, sizeof(magic_ver));
+	data += sizeof(magic_ver);
+
+	memcpy(data, &sd->fw_version, sizeof(sd->fw_version));
+	data += sizeof(sd->fw_version);
+
+	sd->statedump.blob.size += sizeof(magic_ver) + sizeof(sd->fw_version);
+
+	list_for_each_entry(rsp, rsp_list, rsp_list_link) {
+		data = statedump_process_desc_rsp(sd, rsp, data);
+		if (IS_ERR(data))
+			return PTR_ERR(data);
+	}
+
+	return 0;
+}
+
+static int statedump_build_desc_list(struct fsubdev *sd, struct list_head *rsp_list)
+{
+	struct state_dump *statedump = &sd->statedump;
+	u32 offset;
+	int ret;
+
+	statedump->blob.size = 0;
+
+	for (offset = 0; offset < STATEDUMP_MAX_OFFSETS; offset++) {
+		struct statedump_rsp *rsp;
+		u64 *desc;
+		u16 desc_count;
+
+		rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
+		if (!rsp)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&rsp->rsp_list_link);
+		list_add_tail(&rsp->rsp_list_link, rsp_list);
+
+		ret = ops_statedump(sd, offset, &rsp->mbdb_rsp);
+		if (ret)
+			return ret;
+
+		for (desc = rsp->mbdb_rsp.descs, desc_count = rsp->mbdb_rsp.desc_count;
+		     desc_count--; desc++) {
+			if (FIELD_GET(DUMP_TYPE, *desc) == DUMP_TYPE_XX)
+				goto alloc_data;
+
+			statedump->blob.size += sizeof(*desc) + FIELD_GET(DUMP_LENGTH, *desc);
+		}
+	}
+
+	if (offset == STATEDUMP_MAX_OFFSETS)
+		sd_warn(sd, "Not able to obtain all state dump data descriptors\n");
+
+alloc_data:
+	statedump->blob.data = vzalloc(statedump->blob.size);
+	if (statedump->blob.data)
+		return 0;
+
+	return -ENOMEM;
+}
+
+static int statedump_process_dump(struct fsubdev *sd)
+{
+	struct list_head rsp_list;
+	struct statedump_rsp *rsp;
+	struct statedump_rsp *tmp;
+	int ret;
+
+	INIT_LIST_HEAD(&rsp_list);
+
+	ret = statedump_build_desc_list(sd, &rsp_list);
+	if (ret)
+		goto cleanup;
+
+	ret = statedump_process_desc_list(sd, &rsp_list);
+	if (ret) {
+		vfree(sd->statedump.blob.data);
+		sd->statedump.blob.data = NULL;
+		sd->statedump.blob.size = 0;
+	}
+
+cleanup:
+	list_for_each_entry_safe(rsp, tmp, &rsp_list, rsp_list_link) {
+		list_del(&rsp->rsp_list_link);
+		kfree(rsp);
+	}
+
+	return ret;
+}
+
+static int statedump_open(struct inode *inode, struct file *file)
+{
+	void __iomem *cport_init_ctrl_reg_addr;
+	struct state_dump *statedump;
+	u64 cport_init_ctrl_reg_val;
+	struct fsubdev *sd;
+	int ret;
+
+	if (!inode->i_private)
+		return -EINVAL;
+
+	sd = inode->i_private;
+
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	statedump = &sd->statedump;
+	file->private_data = statedump;
+
+	ret = down_killable(&statedump->state_dump_sem);
+	if (ret)
+		return ret;
+
+	ret = down_write_killable(&statedump->state_dump_mbdb_sem);
+	if (ret) {
+		up(&statedump->state_dump_sem);
+		return ret;
+	}
+
+	mutex_lock(&sd->cport_init_ctrl_reg_lock);
+
+	cport_init_ctrl_reg_addr = sd->csr_base + CPORT_INIT_CTRL_ADDR;
+	cport_init_ctrl_reg_val = readq(cport_init_ctrl_reg_addr);
+
+	writeq(cport_init_ctrl_reg_val | RISC_NMI_BIT, cport_init_ctrl_reg_addr);
+
+	ret = statedump_process_dump(sd);
+
+	writeq(cport_init_ctrl_reg_val, cport_init_ctrl_reg_addr);
+
+	mutex_unlock(&sd->cport_init_ctrl_reg_lock);
+
+	up_write(&statedump->state_dump_mbdb_sem);
+
+	if (ret)
+		up(&statedump->state_dump_sem);
+
+	return ret;
+}
+
+static int statedump_release(struct inode *inode, struct file *file)
+{
+	if (inode->i_private) {
+		struct fsubdev *sd = inode->i_private;
+		struct state_dump *statedump = &sd->statedump;
+
+		vfree(statedump->blob.data);
+		statedump->blob.size = 0;
+		statedump->blob.data = NULL;
+		up(&statedump->state_dump_sem);
+	}
+
+	return 0;
+}
+
+static const struct file_operations statedump_fops = {
+	.owner = THIS_MODULE,
+	.open = statedump_open,
+	.read = blob_read,
+	.release = statedump_release,
+	.llseek = default_llseek,
+};
+
+void statedump_node_init(struct fsubdev *sd)
+{
+	sema_init(&sd->statedump.state_dump_sem, 1);
+	init_rwsem(&sd->statedump.state_dump_mbdb_sem);
+	sd->statedump.blob.size = 0;
+	sd->statedump.blob.data = NULL;
+
+	debugfs_create_file(STATEDUMP_FILE_NAME, 0400, sd->debugfs_dir, sd, &statedump_fops);
+}
diff --git a/drivers/gpu/drm/xe/fabric/statedump.h b/drivers/gpu/drm/xe/fabric/statedump.h
new file mode 100644
index 0000000000000..c23d529168fb7
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/statedump.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ *
+ */
+
+#ifndef STATEDUMP_H_INCLUDED
+#define STATEDUMP_H_INCLUDED
+
+#include <linux/debugfs.h>
+#include <linux/rwsem.h>
+#include <linux/semaphore.h>
+
+struct state_dump {
+	struct debugfs_blob_wrapper blob;
+	/*
+	 * Blocks so only one process can state dump across open/read/release
+	 * of the debugfs node
+	 */
+	struct semaphore state_dump_sem;
+	/*
+	 * Stops all new mailbox traffic and waits until all ops in the device
+	 * have finished
+	 */
+	struct rw_semaphore state_dump_mbdb_sem;
+};
+
+struct fsubdev;
+
+void statedump_node_init(struct fsubdev *sd);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/sysfs.c b/drivers/gpu/drm/xe/fabric/sysfs.c
new file mode 100644
index 0000000000000..4474b0e38913f
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/sysfs.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2022 Intel Corporation.
+ *
+ */
+
+#include <linux/device.h>
+#include "csr.h"
+#include "fw.h"
+#include "iaf_drv.h"
+#include "mbdb.h"
+#include "mei_iaf_user.h"
+#include "ops.h"
+#include "port.h"
+#include "sysfs.h"
+
+static ssize_t link_failures_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fport *port;
+	struct fport_status status;
+
+	port = container_of(attr, struct fport, link_failures);
+
+	get_fport_status(port->sd, port->lpn, &status);
+
+	return sysfs_emit(buf, "%llu\n", status.link_failures);
+}
+
+static ssize_t link_degrades_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fport *port;
+	struct fport_status status;
+
+	port = container_of(attr, struct fport, link_degrades);
+
+	get_fport_status(port->sd, port->lpn, &status);
+
+	return sysfs_emit(buf, "%llu\n", status.link_degrades);
+}
+
+static ssize_t fw_comm_errors_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsubdev *sd;
+
+	sd = container_of(attr, struct fsubdev, fw_comm_errors);
+
+	return sysfs_emit(buf, "%llu\n", mbdb_get_mbox_comm_errors(sd));
+}
+
+static ssize_t fw_error_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsubdev *sd;
+
+	sd = container_of(attr, struct fsubdev, fw_error);
+
+	return sysfs_emit(buf, "%u\n", test_bit(SD_ERROR_FW, sd->errors));
+}
+
+static ssize_t sd_failure_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsubdev *sd;
+
+	sd = container_of(attr, struct fsubdev, sd_failure);
+
+	return sysfs_emit(buf, "%u\n", test_bit(SD_ERROR_FAILED, sd->errors));
+}
+
+static ssize_t firmware_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct mbdb_op_fw_version_rsp fw_version = {};
+	struct fsubdev *sd;
+	int err;
+
+	sd = container_of(attr, struct fsubdev, firmware_version);
+
+	err = ops_fw_version(sd, &fw_version);
+	if (err == MBOX_RSP_STATUS_SEQ_NO_ERROR)
+		err = ops_fw_version(sd, &fw_version);
+	if (err) {
+		sd_err(sd, "unable to query firmware version\n");
+		return -EIO;
+	}
+
+	return sysfs_emit(buf, "%.*s\n", (int)sizeof(fw_version.fw_version_string),
+			  (fw_version.environment & FW_VERSION_ENV_BIT) ?
+			  (char *)fw_version.fw_version_string : "UNKNOWN");
+}
+
+static ssize_t iaf_fabric_id_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%x\n", fdev->fabric_id);
+}
+
+static DEVICE_ATTR_RO(iaf_fabric_id);
+
+static ssize_t pscbin_brand_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", fdev->psc.brand ? fdev->psc.brand :
+			  "UNKNOWN");
+}
+
+static ssize_t pscbin_product_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", fdev->psc.product ? fdev->psc.product :
+			  "UNKNOWN");
+}
+
+static ssize_t pscbin_version_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", fdev->psc.version[0] ?
+			  fdev->psc.version : "UNKNOWN");
+}
+
+static DEVICE_ATTR_RO(pscbin_brand);
+static DEVICE_ATTR_RO(pscbin_product);
+static DEVICE_ATTR_RO(pscbin_version);
+
+static ssize_t min_svn_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", get_min_svn(fdev));
+}
+
+static DEVICE_ATTR_ADMIN_RO(min_svn);
+
+/**
+ * prevent_rollback_store - Initiate anti-rollback protection
+ * @dev: device from sysfs call
+ * @attr: device attribute from sysfs call
+ * @buf: buffer pointer from sysfs call
+ * @count: buffer count from sysfs call
+ *
+ * cause automatic rollback protection to be initiated and absorb whatever was
+ * written to the prevent_rollback device attribute: if automatic rollback
+ * protection is enabled, it is triggered after the device is successfully
+ * initialized; otherwise, it is only triggered by writing (any data) to the
+ * device's prevent_rollback sysfs entry (it is safe to do both)
+ *
+ * Return: @count on success, -EACCESS on failure
+ */
+static ssize_t prevent_rollback_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+	int err;
+
+	err = iaf_commit_svn(fdev);
+
+	if (err)
+		return -EACCES;
+
+	return count;
+}
+
+static DEVICE_ATTR_WO(prevent_rollback);
+
+static const struct attribute *iaf_attrs[] = {
+	&dev_attr_iaf_fabric_id.attr,
+	&dev_attr_prevent_rollback.attr,
+	&dev_attr_min_svn.attr,
+	&dev_attr_pscbin_brand.attr,
+	&dev_attr_pscbin_product.attr,
+	&dev_attr_pscbin_version.attr,
+	NULL,
+};
+
+static void iaf_sysfs_cleanup(struct fsubdev *sd)
+{
+	struct fport *port;
+	u8 lpn;
+
+	for_each_fabric_port(port, lpn, sd) {
+		kobject_put(port->kobj);
+		port->kobj = NULL;
+	}
+
+	kobject_put(sd->kobj);
+	sd->kobj = NULL;
+}
+
+typedef ssize_t (*show_fn)(struct device *dev, struct device_attribute *attr, char *buf);
+
+static int iaf_sysfs_add_node(const char *name, umode_t mode, show_fn show,
+			      struct device_attribute *attr, struct kobject *parent)
+{
+	sysfs_attr_init(&attr->attr);
+	attr->attr.name = name;
+	attr->attr.mode = mode;
+	attr->show = show;
+
+	return sysfs_create_file(parent, &attr->attr);
+}
+
+static int iaf_sysfs_add_port_nodes(struct fsubdev *sd)
+{
+	struct fport *port;
+	u8 lpn;
+
+	for_each_fabric_port(port, lpn, sd) {
+		int err;
+		char port_name[9];
+
+		snprintf(port_name, sizeof(port_name), "port.%u", lpn);
+
+		port->kobj = kobject_create_and_add(port_name, sd->kobj);
+		if (!port->kobj)
+			return -ENOMEM;
+
+		err = iaf_sysfs_add_node("link_failures", 0400, link_failures_show,
+					 &port->link_failures, port->kobj);
+		if (err) {
+			sd_warn(sd, "Failed to add sysfs node %s for port %s\n", "link_failures",
+				port_name);
+			return err;
+		}
+
+		err = iaf_sysfs_add_node("link_degrades", 0400, link_degrades_show,
+					 &port->link_degrades, port->kobj);
+		if (err) {
+			sd_warn(sd, "Failed to add sysfs node %s for port %s\n", "link_degrades",
+				port_name);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int iaf_sysfs_add_sd_nodes(struct fsubdev *sd)
+{
+	int err;
+
+	err = iaf_sysfs_add_node("fw_comm_errors", 0400, fw_comm_errors_show,
+				 &sd->fw_comm_errors, sd->kobj);
+	if (err) {
+		sd_warn(sd, "Failed to add sysfs node %s for %s\n", "fw_comm_errors", sd->name);
+		goto exit;
+	}
+
+	err = iaf_sysfs_add_node("fw_error", 0400, fw_error_show, &sd->fw_error, sd->kobj);
+	if (err) {
+		sd_warn(sd, "Failed to add sysfs node %s for %s\n", "fw_error", sd->name);
+		goto exit;
+	}
+
+	err = iaf_sysfs_add_node("sd_failure", 0400, sd_failure_show, &sd->sd_failure, sd->kobj);
+	if (err) {
+		sd_warn(sd, "Failed to add sysfs node %s for %s\n", "sd_failure", sd->name);
+		goto exit;
+	}
+
+	err = iaf_sysfs_add_node("firmware_version", 0444, firmware_version_show,
+				 &sd->firmware_version, sd->kobj);
+	if (err)
+		sd_warn(sd, "Failed to add sysfs node %s for %s\n", "firmware_version", sd->name);
+
+exit:
+	return err;
+}
+
+static void iaf_sysfs_sd_init(struct fsubdev *sd)
+{
+	int err;
+
+	sd->kobj = kobject_create_and_add(sd->name, &sd->fdev->pdev->dev.kobj);
+	if (!sd->kobj) {
+		sd_warn(sd, "Failed to add sysfs directory %s\n", sd->name);
+		return;
+	}
+
+	err = iaf_sysfs_add_port_nodes(sd);
+	if (err)
+		goto error_return;
+
+	err = iaf_sysfs_add_sd_nodes(sd);
+	if (err)
+		goto error_return;
+
+	return;
+
+error_return:
+	iaf_sysfs_cleanup(sd);
+}
+
+void iaf_sysfs_init(struct fdev *fdev)
+{
+	u8 i;
+
+	for (i = 0; i < fdev->pd->sd_cnt; i++)
+		iaf_sysfs_sd_init(&fdev->sd[i]);
+}
+
+void iaf_sysfs_remove(struct fdev *fdev)
+{
+	u8 i;
+
+	for (i = 0; i < fdev->pd->sd_cnt; i++)
+		iaf_sysfs_cleanup(&fdev->sd[i]);
+
+	sysfs_remove_files(&fdev->pdev->dev.kobj, iaf_attrs);
+}
+
+int iaf_sysfs_probe(struct fdev *fdev)
+{
+	int err;
+
+	err = sysfs_create_files(&fdev->pdev->dev.kobj, iaf_attrs);
+	if (err) {
+		dev_err(&fdev->pdev->dev, "Failed to add sysfs\n");
+		return err;
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/fabric/sysfs.h b/drivers/gpu/drm/xe/fabric/sysfs.h
new file mode 100644
index 0000000000000..059a89a31b0a1
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/sysfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2021 Intel Corporation.
+ *
+ */
+
+#ifndef SYSFS_H_INCLUDED
+#define SYSFS_H_INCLUDED
+
+#include "iaf_drv.h"
+
+void iaf_sysfs_init(struct fdev *fdev);
+void iaf_sysfs_remove(struct fdev *fdev);
+int iaf_sysfs_probe(struct fdev *fdev);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/trace.c b/drivers/gpu/drm/xe/fabric/trace.c
new file mode 100644
index 0000000000000..d22f04a5de78b
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/gpu/drm/xe/fabric/trace.h b/drivers/gpu/drm/xe/fabric/trace.h
new file mode 100644
index 0000000000000..8503b6fb50639
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#include "iaf_drv.h"
+#include "trace_mbx.h"
+#include "trace_nl.h"
+#include "trace_pm.h"
+#include "trace_rt.h"
diff --git a/drivers/gpu/drm/xe/fabric/trace_mbx.h b/drivers/gpu/drm/xe/fabric/trace_mbx.h
new file mode 100644
index 0000000000000..266715dacdc4d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace_mbx.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#if !defined(__TRACE_MBX_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __TRACE_MBX_H
+
+#include <linux/tracepoint.h>
+#include <linux/trace_seq.h>
+
+#include "iaf_drv.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM iaf_mbx
+
+DECLARE_EVENT_CLASS(iaf_mbx_in_template,
+		    TP_PROTO(u32 dev, u8 sd, u8 op_code, u8 expected_seq_no,
+			     u8 seq_no, u8 rsp_status, u32 tid, u64 cw),
+		    TP_ARGS(dev, sd, op_code, expected_seq_no, seq_no,
+			    rsp_status, tid, cw),
+		    TP_STRUCT__entry(__field(u32, dev)
+				     __field(u8, sd)
+				     __field(u8, op_code)
+				     __field(u8, expected_seq_no)
+				     __field(u8, seq_no)
+				     __field(u8, rsp_status)
+				     __field(u32, tid)
+				     __field(u64, cw)
+				    ),
+		    TP_fast_assign(__entry->dev = dev;
+				   __entry->sd = sd;
+				   __entry->op_code = op_code;
+				   __entry->expected_seq_no = expected_seq_no;
+				   __entry->seq_no = seq_no;
+				   __entry->rsp_status = rsp_status;
+				   __entry->tid = tid;
+				   __entry->cw = cw;
+				  ),
+		    TP_printk("dev %u sd %u op_code 0x%x expected_seq_no %u seq_no %u rsp_status %u tid %u cw 0x%llx",
+			      __entry->dev,
+			      __entry->sd,
+			      __entry->op_code,
+			      __entry->expected_seq_no,
+			      __entry->seq_no,
+			      __entry->rsp_status,
+			      __entry->tid,
+			      __entry->cw
+			     )
+		    );
+
+DEFINE_EVENT(iaf_mbx_in_template, iaf_mbx_in,
+	     TP_PROTO(u32 dev, u8 sd, u8 op_code, u8 expected_seq_no,
+		      u8 seq_no, u8 rsp_status, u32 tid, u64 cw),
+	     TP_ARGS(dev, sd, op_code, expected_seq_no, seq_no, rsp_status,
+		     tid, cw)
+	    );
+
+	DECLARE_EVENT_CLASS(iaf_mbx_exec_template,
+			    TP_PROTO(u32 dev, u8 sd, u8 op_code, u8 seq_no,
+				     u32 tid, u64 cw),
+			    TP_ARGS(dev, sd, op_code, seq_no, tid, cw),
+			    TP_STRUCT__entry(__field(u32, dev)
+					     __field(u8, sd)
+					     __field(u8, op_code)
+					     __field(u8, seq_no)
+					     __field(u32, tid)
+					     __field(u64, cw)
+					    ),
+			    TP_fast_assign(__entry->dev = dev;
+					   __entry->sd = sd;
+					   __entry->op_code = op_code;
+					   __entry->seq_no = seq_no;
+					   __entry->tid = tid;
+					   __entry->cw = cw;
+					  ),
+			    TP_printk("dev %u sd %u op_code 0x%x seq_no %u tid %u cw 0x%llx",
+				      __entry->dev,
+				      __entry->sd,
+				      __entry->op_code,
+				      __entry->seq_no,
+				      __entry->tid,
+				      __entry->cw
+				     )
+			    );
+
+DEFINE_EVENT(iaf_mbx_exec_template, iaf_mbx_exec,
+	     TP_PROTO(u32 dev, u8 sd, u8 op_code, u8 seq_no, u32 tid, u64 cw),
+	     TP_ARGS(dev, sd, op_code, seq_no, tid, cw)
+	    );
+
+#endif /* __TRACE_MBX_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace_mbx
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/xe/fabric/trace_nl.h b/drivers/gpu/drm/xe/fabric/trace_nl.h
new file mode 100644
index 0000000000000..3580dccf872f7
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace_nl.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#if !defined(__TRACE_NL_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __TRACE_NL_H
+
+#include <linux/tracepoint.h>
+#include <linux/trace_seq.h>
+
+#include "iaf_drv.h"
+#include "ops.h"
+#include "netlink.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM iaf_nl
+
+DECLARE_EVENT_CLASS(iaf_nl_template,
+		    TP_PROTO(enum cmd_op r_cmd_op, u32 len, u32 snd_seq),
+		    TP_ARGS(r_cmd_op, len, snd_seq),
+		    TP_STRUCT__entry(__field(enum cmd_op, r_cmd_op)
+				     __field(u32, len)
+				     __field(u32, snd_seq)
+				    ),
+		    TP_fast_assign(__entry->r_cmd_op = r_cmd_op;
+				   __entry->len = len;
+				   __entry->snd_seq = snd_seq;
+				  ),
+		    TP_printk("cmd op %u len %u snd_seq %u",
+			      __entry->r_cmd_op,
+			      __entry->len,
+			      __entry->snd_seq
+			     )
+		    );
+
+DEFINE_EVENT(iaf_nl_template, nl_rsp,
+	     TP_PROTO(enum cmd_op r_cmd_op, u32 len, u32 snd_seq),
+	     TP_ARGS(r_cmd_op, len, snd_seq)
+	    );
+
+DEFINE_EVENT(iaf_nl_template, nl_req,
+	     TP_PROTO(enum cmd_op r_cmd_op, u32 len, u32 snd_seq),
+	     TP_ARGS(r_cmd_op, len, snd_seq)
+	    );
+
+#endif /* __TRACE_NL_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace_nl
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/xe/fabric/trace_pm.h b/drivers/gpu/drm/xe/fabric/trace_pm.h
new file mode 100644
index 0000000000000..872d1c54a561d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace_pm.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#if !defined(__TRACE_PM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __TRACE_PM_H
+
+#include <linux/tracepoint.h>
+#include <linux/trace_seq.h>
+
+#include "iaf_drv.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM iaf_pm
+#define PORT_STATE_CHANGE_PRN "D%uT%uP%d: type %u LMA %u PPS %x OLDRNNLQI %x " \
+			      "nbr %016llx/%u/%u/%u LIR %u LDR %u FID %08x " \
+			      "LDC %u PEA %u"
+
+DECLARE_EVENT_CLASS(iaf_pm_template,
+		    TP_PROTO(u8 dev,
+			     u8 tile,
+			     u8 port_num,
+			     struct portinfo *portinfo),
+		    TP_ARGS(dev, tile, port_num, portinfo),
+		    TP_STRUCT__entry(__field(u8, dev)
+				     __field(u8, tile)
+				     __field(u8, port_num)
+				     __field(u8, port_type)
+				     __field(u8, port_link_mode_active)
+				     __field(u8, port_state_port_physical_state)
+				     __field(u8, oldr_nn_lqi)
+				     __field(u64, neighbor_guid)
+				     __field(u8, neighbor_port_number)
+				     __field(u8, neighbor_link_down_reason)
+				     __field(u8, neighbor_mtu)
+				     __field(u8, link_init_reason)
+				     __field(u8, link_down_reason)
+				     __field(u16, fid)
+				     __field(u32, link_down_count)
+				     __field(u32, port_error_action)
+				    ),
+		    TP_fast_assign(__entry->dev = dev;
+				   __entry->tile = tile;
+				   __entry->port_num = port_num;
+				   __entry->port_type = portinfo->port_type;
+				   __entry->port_link_mode_active =
+				   portinfo->port_link_mode_active;
+				   __entry->port_state_port_physical_state =
+				   portinfo->port_state_port_physical_state;
+				   __entry->oldr_nn_lqi = portinfo->oldr_nn_lqi;
+				   __entry->neighbor_guid =
+				   portinfo->neighbor_guid;
+				   __entry->neighbor_port_number =
+				   portinfo->neighbor_port_number;
+				   __entry->neighbor_link_down_reason =
+				   portinfo->neighbor_link_down_reason;
+				   __entry->neighbor_mtu =
+				   portinfo->neighbor_mtu;
+				   __entry->link_init_reason =
+				   portinfo->link_init_reason;
+				   __entry->link_down_reason =
+				   portinfo->link_down_reason;
+				   __entry->fid = portinfo->fid;
+				   __entry->link_down_count =
+				   portinfo->link_down_count;
+				   __entry->port_error_action =
+				   portinfo->port_error_action;
+				  ),
+		    TP_printk(PORT_STATE_CHANGE_PRN,
+			      __entry->dev,
+			      __entry->tile,
+			      __entry->port_num,
+			      __entry->port_type,
+			      __entry->port_link_mode_active,
+			      __entry->port_state_port_physical_state,
+			      __entry->oldr_nn_lqi,
+			      __entry->neighbor_guid,
+			      __entry->neighbor_port_number,
+			      __entry->neighbor_link_down_reason,
+			      __entry->neighbor_mtu,
+			      __entry->link_init_reason,
+			      __entry->link_down_reason,
+			      __entry->fid,
+			      __entry->link_down_count,
+			      __entry->port_error_action
+			     )
+		    );
+
+DEFINE_EVENT(iaf_pm_template, pm_psc,
+	     TP_PROTO(u8 dev, u8 tile, u8 port_num, struct portinfo *portinfo),
+	     TP_ARGS(dev, tile, port_num, portinfo)
+	    );
+
+#endif /* __TRACE_PM_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace_pm
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/xe/fabric/trace_rt.h b/drivers/gpu/drm/xe/fabric/trace_rt.h
new file mode 100644
index 0000000000000..45d8c5a113767
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/trace_rt.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2021 Intel Corporation.
+ *
+ */
+
+#if !defined(__TRACE_RT_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __TRACE_RT_H
+
+#include <linux/tracepoint.h>
+#include <linux/trace_seq.h>
+
+#include "iaf_drv.h"
+#include "routing_topology.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM iaf_rt
+#define ROUTE_PAIR_LOCAL_PRN "uft: device %u sd %u fid 0x%04x bport %u fport %u"
+#define ASSIGN_FIDS_PRN "device %u sd %u fid_mgmt 0x%04x fid_base 0x%04x"
+
+DECLARE_EVENT_CLASS(iaf_rt_template,
+		    TP_PROTO(u8 id, u8 sd_index, u16 fid, u8 bport, u8 fport),
+		    TP_ARGS(id, sd_index, fid, bport, fport),
+		    TP_STRUCT__entry(__field(u8, id)
+				     __field(u8, sd_index)
+				     __field(u16, fid)
+				     __field(u8, bport)
+				     __field(u8, fport)
+				    ),
+		    TP_fast_assign(__entry->id = id;
+				   __entry->sd_index = sd_index;
+				   __entry->fid = fid;
+				   __entry->bport = bport;
+				   __entry->fport = fport;
+				  ),
+		    TP_printk(ROUTE_PAIR_LOCAL_PRN,
+			      __entry->id,
+			      __entry->sd_index,
+			      __entry->fid,
+			      __entry->bport,
+			      __entry->fport
+			     )
+		    );
+
+DEFINE_EVENT(iaf_rt_template, rt_pair,
+	     TP_PROTO(u8 id, u8 sd_index, u16 fid, u8 bport, u8 fport),
+	     TP_ARGS(id, sd_index, fid, bport, fport)
+	    );
+
+DEFINE_EVENT(iaf_rt_template, rt_local,
+	     TP_PROTO(u8 id, u8 sd_index, u16 fid, u8 bport, u8 fport),
+	     TP_ARGS(id, sd_index, fid, bport, fport)
+	    );
+
+DECLARE_EVENT_CLASS(iaf_rt_fid_template,
+		    TP_PROTO(struct fsubdev *sd),
+		    TP_ARGS(sd),
+		    TP_STRUCT__entry(__field(u32, id)
+				     __field(u8, sd_index)
+				     __field(u16, fid_mgmt)
+				     __field(u16, fid_base)
+				    ),
+		    TP_fast_assign(__entry->id = sd->fdev->pd->index;
+				   __entry->sd_index = sd_index(sd);
+				   __entry->fid_mgmt = sd->routing.fid_mgmt;
+				   __entry->fid_base = sd->routing.fid_base;
+				  ),
+		    TP_printk(ASSIGN_FIDS_PRN,
+			      __entry->id,
+			      __entry->sd_index,
+			      __entry->fid_mgmt,
+			      __entry->fid_base
+			     )
+		    );
+
+DEFINE_EVENT(iaf_rt_fid_template, rt_assign_fids,
+	     TP_PROTO(struct fsubdev *sd),
+	     TP_ARGS(sd)
+	    );
+
+DECLARE_EVENT_CLASS(iaf_rt_plane_template,
+		    TP_PROTO(struct fsubdev *root),
+		    TP_ARGS(root),
+		    TP_STRUCT__entry(__field(u8, index)
+				     __field(u8, id)
+				     __field(u8, sd_index)
+				    ),
+		    TP_fast_assign(__entry->index = root->routing.plane->index;
+				   __entry->id = sd_index(root);
+				   __entry->sd_index = sd_index(root);
+				  ),
+		    TP_printk("plane %u device %u sd %u",
+			      __entry->index,
+			      __entry->id,
+			      __entry->sd_index
+			     )
+		    );
+
+DEFINE_EVENT(iaf_rt_plane_template, rt_plane,
+	     TP_PROTO(struct fsubdev *root),
+	     TP_ARGS(root)
+	    );
+
+#endif /* __TRACE_RT_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace_rt
+#include <trace/define_trace.h>
diff --git a/include/drm/intel/intel_iaf_platform.h b/include/drm/intel/intel_iaf_platform.h
new file mode 100644
index 0000000000000..4c78c236d9adf
--- /dev/null
+++ b/include/drm/intel/intel_iaf_platform.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2022 Intel Corporation.
+ */
+
+#ifndef __INTEL_IAF_PLATFORM_H
+#define __INTEL_IAF_PLATFORM_H
+
+#define IAF_VERSION 1
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+#include <linux/auxiliary_bus.h>
+#endif
+#include <linux/types.h>
+
+/**
+ * enum product_type - Product type identifying the parent
+ * @IAF_UNDEFINED: no product type hints
+ * @IAF_PONTEVECCHIO: parent is a PVC
+ * @IAF_PRODUCTS: end of the list
+ *
+ * i.e. Pontevecchio is the first product.  Other products would
+ * be next generation GPU, NIC, etc.
+ */
+enum product_type {
+	IAF_UNDEFINED,
+	IAF_PONTEVECCHIO,
+	IAF_PRODUCTS
+};
+
+/**
+ * enum iaf_dev_event - events generated to the parent device
+ * @IAF_DEV_REMOVE: Notify parent that device is being removed
+ * @IAF_DEV_EVENTS: end of list
+ *
+ * Connectivity events, possible errors, etc.
+ */
+enum iaf_dev_event {
+	IAF_DEV_REMOVE,
+	IAF_DEV_EVENTS
+};
+
+/**
+ * enum iaf_parent_event - Events generated by the parent device
+ * @IAF_PARENT_PCIE_ERR: Parent had a PCI error
+ * @IAF_PARENT_MAPPING_GET: Notify IAF of buffer mapping
+ * @IAF_PARENT_MAPPING_PUT: Notify IAF of buffer unmapping
+ *
+ * These are examples.
+ */
+enum iaf_parent_event {
+	IAF_PARENT_PCIE_ERR,
+	IAF_PARENT_MAPPING_GET,
+	IAF_PARENT_MAPPING_PUT,
+};
+
+/**
+ * struct sd2sd_info - Subdevice to subdevice connectivity info
+ * @bandwidth: in Gbps units not factoring in width or quality degredation
+ * @latency: in 1/10 hops units
+ */
+struct sd2sd_info {
+	u16 bandwidth;
+	u16 latency;
+};
+
+/**
+ * struct query_info - connectivity query response information
+ * @src_cnt: Requester subdevice count
+ * @dst_cnt: Destination path count
+ * @sd2sd: array of src/dst bandwidth/latency information
+ *
+ * Query info will be a variably sized data structure allocated by the
+ * IAF driver.  The access will be indexed by
+ *    (src_index * dst_cnt) + dst_index
+ *
+ * The caller will need to free the buffer when done.
+ */
+struct query_info {
+	u8 src_cnt;
+	u8 dst_cnt;
+	struct sd2sd_info sd2sd[];
+};
+
+/**
+ * struct iaf_ops - Communication path from parent to IAF instance
+ * @connectivity_query: Query a device for fabric_id connectivity
+ * @parent_event: Any events needed by the IAF device
+ *
+ * connectivity_query() returns:
+ *   a populated query_info on success,
+ *   an ERR_PTR() on failure
+ *
+ */
+struct iaf_ops {
+	struct query_info *(*connectivity_query)(void *handle, u32 fabric_id);
+	int (*parent_event)(void *handle, enum iaf_parent_event event);
+};
+
+struct dpa_space {
+	u32 pkg_offset;
+	u16 pkg_size;
+};
+
+/**
+ * struct iaf_pdata - Platform specific data that needs to be shared
+ * @version: PSD version information
+ * @parent: Handle to use when calling the parent device
+ * @product: a product hint for any necessary special case requirements
+ * @index: unique device index. This will be part of the device name
+ * @dpa: Device physical address offset and size
+ * @sd_cnt: parent subdevice count
+ * @socket_id: device socket information
+ * @slot: PCI/CXL slot number
+ * @aux_dev: Auxiliary bus device
+ * @resources: Array of resources (Assigned by i915, the IRQ/MEM for the device)
+ * @num_resources: number of resources in resources array
+ * @register_dev: Register an IAF instance and ops with the parent device
+ * @unregister_dev: Unregister an IAF instance from the parent device
+ * @dev_event: Notify parent that an event has occurred
+ */
+struct iaf_pdata {
+	u16 version;
+	void *parent;
+	enum product_type product;
+	u16 index;
+	struct dpa_space dpa;
+	u8 sd_cnt;
+	u8 socket_id;
+	u8 slot;
+
+#if IS_ENABLED(CONFIG_AUXILIARY_BUS)
+	struct auxiliary_device aux_dev;
+	struct resource *resources;
+	u32 num_resources;
+#endif
+
+	int (*register_dev)(void *parent, void *handle, u32 fabric_id,
+			    const struct iaf_ops *ops);
+	void (*unregister_dev)(void *parent, const void *handle);
+	int (*dev_event)(void *parent, const void *handle,
+			 const enum iaf_dev_event event, void *event_data);
+};
+
+#endif /* __INTEL_IAF_PLATFORM_H */
-- 
2.45.2

