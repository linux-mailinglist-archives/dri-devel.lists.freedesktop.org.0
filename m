Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6E9E46EE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B222D10E59A;
	Wed,  4 Dec 2024 21:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L9HVR8tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9409B10E59A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 21:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzzTfN2VvM55YijaZ1WMfxgO5f0dWvrXiLqYuGN67DcU2UWZBZecHU/fnYQX8en17qbzPVMS1wth30O1tcc54jWmFl1hu6Eib4cPj5XbFxKYggo2wFdRsE4gMA378ZNKhtmdsJ1NPMDKkVb3wz/Zbt1+icwxEaLd4QhIRF4RLZiE3D9U9a/uKltOghzI6e5kDszL1im7fR3c1j3Cm/N0L25PD6Ity14T6pAUz0xB3a3gWkbGn4OtUByp62uwZ0hm6stH3BecCliCRgXj4wc5iJF02IJS+u1wMx3n/8K9yNtlEziL14Ce6gr0o59xJoffzEvd4s3A72piQ27ij8p3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0f4ehzELSCTbuMVUolxwLu9K8VPQ39aOO+sH6t/KdE=;
 b=asB3lp+zMm31vJKrD0nl9cw8pinJ2XDGLLnPs5QgkpXJpUvEkSpozCnJXYae5LgpingqLzBflnodtkcTiHjgxGJ/8TQZYQaXL3hyDdmjWHoZBWQweosRUnq1WFTxwGCzPdTQ22ovNj0gh6sfsnyg6dhKT/QYaVMPNeqMZ1PnWr3kw21AroOXHymDto3GHKOrUFYYfDCKUEg/Rf3zftUIC2enEa0qRhTjY2uZasYokCZlcgVS48z7Gzo1PmIVZrfO3FEjwtoZgbXYTnMmDbH32DtpzCwsIetr+d/ZjvoO1L8BeYee4RDUmXdZHf/sRQc+G5YQ/oLONt2PIg251HWSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0f4ehzELSCTbuMVUolxwLu9K8VPQ39aOO+sH6t/KdE=;
 b=L9HVR8tcrs/jMI4XsaJClpBcJqki0ei+DZ+iHjaNXobIqlUisqUvwJ5WtEF8wLrWBP/STeIpkS84m7NoTLnNwI30X84KXy4LNMgAMfnOMdUVhf3jNFjDzUSu4skOMfFNq4kJFm5nVbIHuJ2YiHKDMfe5q1gicRaZYZDk5zXW/DA=
Received: from CH0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:610:cd::29)
 by PH7PR12MB7966.namprd12.prod.outlook.com (2603:10b6:510:274::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 21:38:41 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::ea) by CH0PR03CA0114.outlook.office365.com
 (2603:10b6:610:cd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Wed,
 4 Dec 2024 21:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:38:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:40 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 15:38:39 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Xiaoming Ren
 <xiaoming.ren@amd.com>
Subject: [PATCH V1 3/7] accel/amdxdna: Add RyzenAI-npu6 support
Date: Wed, 4 Dec 2024 13:37:25 -0800
Message-ID: <20241204213729.3113941-4-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204213729.3113941-1-lizhi.hou@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH7PR12MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e019406-c08f-4c5e-78ee-08dd14ac0565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bIlRSnojxcG/Fofx2MWsFpR9rcVazYsCDPDU5K9qM1iioX1YLK/ez3lFEI86?=
 =?us-ascii?Q?b1MvAF4kY3JgbOo2qfwib3CGsddtrylc1nEEQffoPgKN4NUavQk7o46TqgQ+?=
 =?us-ascii?Q?aYtQuo8WsQn+jw7joZdqI3g9gN4qTRAwn7tphfJ1YAC1lKXZEGePcuO6gerE?=
 =?us-ascii?Q?UmmoONIMBXyypaBE9xLudVukOUyma7zKLSufWs+rml88CwfVlwSlJxwV5id8?=
 =?us-ascii?Q?znDSFejqCYPJlDDMEUmayJ7ug8E418Dw4ozbGeDfnzwN0Gj9s+wRE2NEVyxl?=
 =?us-ascii?Q?aYil4Ie+4P9UshXaqtXY0xETHnUQaG0x4VH3l1ZBFvGU2ftRfpbn1xmASrbW?=
 =?us-ascii?Q?fcbvMVO9U5KWU/azvyi+D0pU1DIMhV8+IH+aUUQxTeOfOy1AAFKKZrZ877Ue?=
 =?us-ascii?Q?V1jLmoFQRdzOJ419yTeRWXAKN6n0B107feaGCi7FjlLy0EFjAOxicZdoxqyn?=
 =?us-ascii?Q?ArjxhDKUhk6/H+OvI/NbHJyDKnYkFpNIYV1Roqtwy/PCUFNHNmJIiBo2NA7L?=
 =?us-ascii?Q?2QLGTG+AiYND2C/aFllGnZhSGOxD97ZJvLEenl9AodS98rH7oHtShYV+IfYd?=
 =?us-ascii?Q?JkTEwpqqx/xsSVyORbP1txOUFNdOMHOluLh2yjvYioj0E7OFIMci9V2eWvjO?=
 =?us-ascii?Q?7aSNY9dRPL4322Lg0H3USrzXBDKbxWWZ8Cz+DIyfqSn9LVflQJWjC6jSQkrH?=
 =?us-ascii?Q?au86KITsAC652liQzdfZJ02aYwrG+4+1vz3sBDH9PCtAYLHN0bOW1IXth9gj?=
 =?us-ascii?Q?tubh2WaW0sEkwUa23SNC0ImtC72LEn+5+7tQJUtGNC2GgayE3cugm+kd9Mvy?=
 =?us-ascii?Q?dd+7SVNMBknqUdQspLCZUZl31EFzUB9VCo2H98Id8LzRN4/griMzDMZsr/nH?=
 =?us-ascii?Q?Eh2jmhlODBwhGZ53nwj0j+XsAXzp3u4Kem2sdjZ7RuJeXSR4ZC5gSmZjnG5w?=
 =?us-ascii?Q?41bhXzHZushfeu1jI/hSM4hZ5+tPHyhiq6xQR7OPXE5ZvvdVJ3jFRg/dyy+V?=
 =?us-ascii?Q?Ap4x0g2GQfLOYfhdUBCJg3EvTk+HI0FcderiuedQW698/6eZx2TjgUXfHf9s?=
 =?us-ascii?Q?abhCkrdUTUePzeGP//L94IsWv1XZ5Hq5RtuVyqvIvEEk1pV7yg3tYwgFKO8H?=
 =?us-ascii?Q?WAS33uZKkMjxh2JZizTeSkXkoOyPG314rcdMrbdAb5sEYsphKJ5rZwJEY9SZ?=
 =?us-ascii?Q?RKB6wOWMq3EmzqWsCeqINFfg9O5xu0cmJ8FpLDaF8O222k5WuPMHXLX9gFIL?=
 =?us-ascii?Q?3j2U/5L0KoIySf2zzl6CyhvkaXrLPnBwJf1XnAAQCthoL71poAdvhTuWkbsw?=
 =?us-ascii?Q?1OuOazZtzWLV/HnyJhzGrxmUYl4WcvQaeFxA031P7mBfMMzMCc5THtK2tB12?=
 =?us-ascii?Q?9YVDkY+CpryVap5H4IPqnFAjd6YqN3ssTFrDq3Cs+mO/wYC2oMP8Xn4l0efd?=
 =?us-ascii?Q?SkoDuBUsngzphYCx/GtGAZwKiNZtiwWb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:38:41.3163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e019406-c08f-4c5e-78ee-08dd14ac0565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7966
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

