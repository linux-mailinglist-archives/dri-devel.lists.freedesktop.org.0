Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415B9E7B3F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFACC10E1B1;
	Fri,  6 Dec 2024 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T17i7/4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED8310E1B1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODZ6nBVWTNcQuAJshoJSZ3yTfWl8jvGFTK/j69XhYpHPQWqdQ78C19qFF/B7ZYmveJbXaBqXSmV1DFHwcMmRb/pNLKIYeNL/Jyq513fg1YsuI1J4qyEkLcHCBFv4RXN0H5yR3kJsK530MPhFxvVktBNM7LK6w7tYb3HRKEpTkyZeptJOki5JzOfClMPmKOvcG2iHgKgjiT1ASeuJ+lFTKPqzbXclmqQXxLlzVUmUlJCIBqYLUKcCtxzSz7lAQR8vT+TGz7Jyg41h0SbqPNx5slfqFAU+k2eaELvwvdtZxLuxspBzNBAbtMBxw2FSJy3ClfKYKV56wTvDIKjE3Ro75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0f4ehzELSCTbuMVUolxwLu9K8VPQ39aOO+sH6t/KdE=;
 b=gHIVKyDwjHmU4sXGIfYmkfkRDB19/A+IekdJr+RW32l7oqI0r10MZrr7kBqlzK+OuiMpNc5uFSrahN9+DBKv3AQnCdrHaCDDGL7i2LX6nmBQAmPacli3iT0Ahx3TUe/Qk+pdBraOvrXBH5QtmvbpnXgl9vH7+8gH7dD6gFZqM2XWu5e21tGpTDW3FDcxNWmV5cJeqKCnoIURiz8V2L0KTw60LgLiA9H3ID/igK0haEZ6K80hf6peOmY2aWHQBVrRsJ3aPyUGNmPNdK2vYJFyQBQhXCX+2VLIUS+FhqMCGlFOd9MgtYodzjhiTI/m8nTXLCKx1jgS9O/a88D7MdZgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0f4ehzELSCTbuMVUolxwLu9K8VPQ39aOO+sH6t/KdE=;
 b=T17i7/4ggwHfQdAn3uq3S5aBs580G50MyBNjlwX577ORJfRRdNGwRBCIEo8N/wOvYliV8YhLr2Q9G/tqzLgDcj9cfgoN4fhZE3Znwsr5u/iYkzWj8SYZ+gWZxW/trPtW7Q3AM4mLrXS+sMlq+cfjAY5nECYBz1YrB0nC/paR838=
Received: from SJ0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:a03:33e::34)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 6 Dec
 2024 22:00:17 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::33) by SJ0PR03CA0059.outlook.office365.com
 (2603:10b6:a03:33e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Fri,
 6 Dec 2024 22:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:16 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:15 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Xiaoming Ren
 <xiaoming.ren@amd.com>
Subject: [PATCH V2 3/8] accel/amdxdna: Add RyzenAI-npu6 support
Date: Fri, 6 Dec 2024 13:59:56 -0800
Message-ID: <20241206220001.164049-4-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206220001.164049-1-lizhi.hou@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 051a830e-9000-494c-3199-08dd16415eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUO1nUGLdGwkFm3VIT6Rqb7uOLC7lr8sVwKjNuo/m1I/QHH6sG2cf2puPnvC?=
 =?us-ascii?Q?5Zs2NEDJgYTDnNCDSzUYlz8cyKqWrKJCh1ZHmKtq4Fn0kSTb6aHGDSUWBHOY?=
 =?us-ascii?Q?520aWDOv9l+F2iXHRXEw9SjOR+XnNNYkWVWL4Vu94pu2yFRVZ9qbMSnX53Ft?=
 =?us-ascii?Q?Odsb8ffZonyuJCHGXZcGM+5etnQ1OjGSmVFH+RNNMf49245Ck7KAhn2PE010?=
 =?us-ascii?Q?pR9tPvlUMrMLnl4fhbM8DTNhBEzi0mF7wJM9POJYZpLqUL3HFhO7CQGL7m/A?=
 =?us-ascii?Q?cyBP4LCN20lD6IgthgNh12BKLHtcvPP3+x7bcT2nhGlU20v1rOgN8e2KUlsJ?=
 =?us-ascii?Q?8AhKp6dijZRYj0S7cqvtEBJm89ky5cCXZhbcxY12+zAnEwazZShz0iqRVxTs?=
 =?us-ascii?Q?6+QpfQD+GfrsFBkrfhQO7pDBvHpU5afuz/BkoY1rvbL2jS2BORG9yN9doDdR?=
 =?us-ascii?Q?vI7kY7m9JEaEsybf9c0bSDmWMOfP+dl4gT6AbyeavspSMxoLYzLeEaAgSPkw?=
 =?us-ascii?Q?Yu1x12E9fNc2jnzWdbf3uy/jRHvE9LgsTZ9SYZO8fjb8uYIhkMgUSOuO0jjH?=
 =?us-ascii?Q?qinmyLIkX5vB6DVMLX5A21tLzks8sHmwjsUkUkp+iD+AZyxUpEEftc1PQ/Hm?=
 =?us-ascii?Q?D+JHEdih4hs7b7DdLOrIYCSR52gswjrIsKnUJHZKVtLVeW/TT/WE1TyaLO59?=
 =?us-ascii?Q?02IGwBXDHd84kMX7qT3OmitF//le8avgjyYIzKZZudr/kLRjftX9L1BaRl+Z?=
 =?us-ascii?Q?PaRT40mmxikAEHv/FYnSmKKha/DrgS4PSk+1qHBqaOkpcOsmv8X/y62Ra44Z?=
 =?us-ascii?Q?1kWbPeAYP7ZDMlWVhbN1IVj53nilOEv7OyFRKM3e/xGakk8KuJNMZv1RcDSH?=
 =?us-ascii?Q?5jAnY5dhewNawAE7cU4gpT8B0DpfdjoAQ1fSd25kPz0rgjev226yyiwarEd+?=
 =?us-ascii?Q?H72IAvrFr//o3MUheytYLZorykBZLXSkGd0K6uYGEj3URHAgtcZhxe++mVJf?=
 =?us-ascii?Q?3jBAQBK5Nk4xPg5FXjqj5aB0kbLHGpBWkKK1IhciOQimdwO7z6769QlCLR/U?=
 =?us-ascii?Q?OSb6S7QfluMjXBmdJa17GOjKOU8tfkBwa4QsenDZ1TMYgQgE3wqXtos31y/w?=
 =?us-ascii?Q?oN5ZFcudXB3+DfUvj/2jB55Ge451F9gHkmOuETLNV55CFK31EmZU1xKD6tnK?=
 =?us-ascii?Q?fH1af5Lmh9YimOqAViQ+WSIkTaV64r0RK8mcgzVaSdPDxc7DkIHEoOkmfTMy?=
 =?us-ascii?Q?4GIFM0NGtasYo/+EVUX8O+u8bEFgfR87ee+1xDCtfNPi9jgQUz6pKNt8yLj6?=
 =?us-ascii?Q?wo12pC1EhE4MCk2F+DpV2vCOh3UctqC1PwzzQrkA3yHewdI2sCeqpedCBJf+?=
 =?us-ascii?Q?UOB2PYu+UFsCaPfoYnN5Oye4FtFXWr+mEZF4LBaotSth4C2fBq2p+cKlJK+S?=
 =?us-ascii?Q?zHKoBqKgFF3gnkos+XaF0YeNvtS0pwwV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:17.3003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051a830e-9000-494c-3199-08dd16415eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649
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

Add NPU6 registers and other private configurations.

Co-developed-by: Xiaoming Ren <xiaoming.ren@amd.com>
Signed-off-by: Xiaoming Ren <xiaoming.ren@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile    |   3 +-
 drivers/accel/amdxdna/npu6_regs.c | 121 ++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/npu6_regs.c

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index ed6f87910880..6baf181298de 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -17,5 +17,6 @@ amdxdna-y := \
 	npu1_regs.o \
 	npu2_regs.o \
 	npu4_regs.o \
-	npu5_regs.o
+	npu5_regs.o \
+	npu6_regs.o
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA) = amdxdna.o
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
new file mode 100644
index 000000000000..d1168fc55533
--- /dev/null
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
+#include <linux/sizes.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
+#include "amdxdna_pci_drv.h"
+
+/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PUB_SEC_INTR             0x3010060
+#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
+#define MPNPU_PUB_SCRATCH0             0x301006C
+#define MPNPU_PUB_SCRATCH1             0x3010070
+#define MPNPU_PUB_SCRATCH2             0x3010074
+#define MPNPU_PUB_SCRATCH3             0x3010078
+#define MPNPU_PUB_SCRATCH4             0x301007C
+#define MPNPU_PUB_SCRATCH5             0x3010080
+#define MPNPU_PUB_SCRATCH6             0x3010084
+#define MPNPU_PUB_SCRATCH7             0x3010088
+#define MPNPU_PUB_SCRATCH8             0x301008C
+#define MPNPU_PUB_SCRATCH9             0x3010090
+#define MPNPU_PUB_SCRATCH10            0x3010094
+#define MPNPU_PUB_SCRATCH11            0x3010098
+#define MPNPU_PUB_SCRATCH12            0x301009C
+#define MPNPU_PUB_SCRATCH13            0x30100A0
+#define MPNPU_PUB_SCRATCH14            0x30100A4
+#define MPNPU_PUB_SCRATCH15            0x30100A8
+#define MP0_C2PMSG_73                  0x3810A24
+#define MP0_C2PMSG_123                 0x3810AEC
+
+#define MP1_C2PMSG_0                   0x3B10900
+#define MP1_C2PMSG_60                  0x3B109F0
+#define MP1_C2PMSG_61                  0x3B109F4
+
+#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
+#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
+#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
+#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
+
+#define MMNPU_APERTURE0_BASE           0x3000000
+#define MMNPU_APERTURE1_BASE           0x3600000
+#define MMNPU_APERTURE3_BASE           0x3810000
+#define MMNPU_APERTURE4_BASE           0x3B10000
+
+/* PCIe BAR Index for NPU6 */
+#define NPU6_REG_BAR_INDEX	0
+#define NPU6_MBOX_BAR_INDEX	0
+#define NPU6_PSP_BAR_INDEX	4
+#define NPU6_SMU_BAR_INDEX	5
+#define NPU6_SRAM_BAR_INDEX	2
+/* Associated BARs and Apertures */
+#define NPU6_REG_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU6_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU6_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
+#define NPU6_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
+#define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
+
+#define NPU6_RT_CFG_TYPE_PDI_LOAD 5
+#define NPU6_RT_CFG_TYPE_DEBUG_BO 10
+
+#define NPU6_RT_CFG_VAL_PDI_LOAD_MGMT 0
+#define NPU6_RT_CFG_VAL_PDI_LOAD_APP 1
+
+#define NPU6_RT_CFG_VAL_DEBUG_BO_DEFAULT 0
+#define NPU6_RT_CFG_VAL_DEBUG_BO_LARGE   1
+
+#define NPU6_MPNPUCLK_FREQ_MAX  1267
+#define NPU6_HCLK_FREQ_MAX      1800
+
+const struct amdxdna_dev_priv npu6_dev_priv = {
+	.fw_path        = "amdnpu/17f0_10/npu.sbin",
+	.protocol_major = 0x6,
+	.protocol_minor = 12,
+	.rt_config	= {NPU6_RT_CFG_TYPE_PDI_LOAD, NPU6_RT_CFG_VAL_PDI_LOAD_APP},
+	.col_align	= COL_ALIGN_NATURE,
+	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
+	.mbox_size      = 0, /* Use BAR size */
+	.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
+	.sram_offs      = {
+		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
+		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
+	},
+	.psp_regs_off   = {
+		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU6_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU6_REG, MPNPU_PUB_SCRATCH4),
+		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU6_REG, MPNPU_PUB_SCRATCH9),
+		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
+		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
+	},
+	.smu_regs_off   = {
+		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
+		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU6_SMU, MP1_C2PMSG_60),
+		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU6_SMU, MMNPU_APERTURE4_BASE),
+		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU6_SMU, MP1_C2PMSG_61),
+		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU6_SMU, MP1_C2PMSG_60),
+	},
+};
+
+const struct amdxdna_dev_info dev_npu6_info = {
+	.reg_bar           = NPU6_REG_BAR_INDEX,
+	.mbox_bar          = NPU6_MBOX_BAR_INDEX,
+	.sram_bar          = NPU6_SRAM_BAR_INDEX,
+	.psp_bar           = NPU6_PSP_BAR_INDEX,
+	.smu_bar           = NPU6_SMU_BAR_INDEX,
+	.first_col         = 0,
+	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
+	.dev_mem_base      = AIE2_DEVM_BASE,
+	.dev_mem_size      = AIE2_DEVM_SIZE,
+	.vbnv              = "RyzenAI-npu6",
+	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
+	.dev_priv          = &npu6_dev_priv,
+	.ops               = &aie2_ops,
+};
-- 
2.34.1

