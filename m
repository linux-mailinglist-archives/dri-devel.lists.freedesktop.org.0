Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0FCC95D5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 20:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0003910E913;
	Wed, 17 Dec 2025 19:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RnLmpPjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F05F10E2C9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 19:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUG4haiqoEhEU5KibS3qbAtJTHfJVki4VJNGFNXB8cdYUk2YbhIFsD4jNtYizhLQ7V0dB6Y9gbjtvsQnZJg6/T/eNwJlNS3pMCiJmrTF66TYcjX0mYgis2Jvo9kGxs/U3JvyfMjNt9AAbp88i4COxPaZwxPChzSUvL4IRC3wLdHAHsU35rEzFn7RC30JZB1TKuipKa8O0cbHpGZAFb4rIOrEDdcbGXAyM/xOmOg/dwRZGMh2Ha0oZk2QRh3jIE/vZ9MfV6MzJZ3ON1mhjihFoG6Kk/AWoetuxWFck8lZa/Iq1jdKhietU7YIU7zsGzDU3lAiwqXLIHtRpA8CQVLyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nUUe0eg2qk+IRLLjLZ9X6hxaARVHnOTePzrVphkX+M=;
 b=pJQlYjO052L7Vzyxd3hFyWZkVIj9g+Y4Kg+U4w8lNf3+gmbpow8fiesd3ryOXcBduaKBJWhc76pwbbeTF8jqswPFFbbpHBUW13+xx/45u8YS4Z2rhloFBeXisgXIWrEyqFjbkEB+G7to08At0jpeQnMOKcq0b0xO5mNHvlTHc5TS2trRAkUpLFOf4myBimVxnJ4FgXwFEY/sn76Gr8oKTTOON4LNLi1RcBcFdSX/2icaIk8SWTod9TMAM8W9KmRbvuSylebYxyAMR8ORVAPVp6HtecsHFgVFAwcnOzScBxhw3tOZw3dJyLzZO1Plm9wtF10PrJQH85CKVeYLlfVeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nUUe0eg2qk+IRLLjLZ9X6hxaARVHnOTePzrVphkX+M=;
 b=RnLmpPjGXlJSBnqNLGrpCvPfxglANn4dUbgQ7n5aQPVWA8EqiXQRTIGDbKla4/DYBBHUw93wASSyZDC0BFYgTh5Rig48FgluCbFe99ZhiP7SjSBLUT/uXMSSQoV+1PF3wBr+HR3EaPAUEx3/IWUNYqSicg31k4fwR69PFobTPpU=
Received: from CH0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:610:74::32)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Wed, 17 Dec
 2025 19:08:26 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::9d) by CH0PR04CA0087.outlook.office365.com
 (2603:10b6:610:74::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 19:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 19:08:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:08:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:08:26 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 11:08:25 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Remove NPU2 support
Date: Wed, 17 Dec 2025 11:08:18 -0800
Message-ID: <20251217190818.2145781-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b6987e-9e16-4f2d-f4e9-08de3d9fa884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oO66KZ3UQDmEyvGqSi/hY/mTtuldtMHV+Ev6kbF79NVydWQVx22a3gsEyEqt?=
 =?us-ascii?Q?Ip9kBfoUi6/8FBtbHbtJG+Wg9O963n7RkgFjqeS71c/6EjPIELFHdH741d00?=
 =?us-ascii?Q?lSbeAHALPX9EPCzcACsChz/cBxpZSHCJR3UB5UQ+FV5nyxzrDgR2He5ilkGD?=
 =?us-ascii?Q?nano1EPw1H8vA0kHCm3h/n1xIn7TUcbVFdt3EQPjaWkM5dqXNaO8nfePWdUj?=
 =?us-ascii?Q?Teo/BV4ZGY/LYdiIiNYrV/AlMxJCqYPaKxBul5loNV7RbXO6pK/3OjAy9bse?=
 =?us-ascii?Q?ctTvPaS0xsEeKHB3/6sUl59W131uhuXo4nScTMaqXgvC+2Mb/+nAJP5KlaaS?=
 =?us-ascii?Q?9G4NsQJD8y6/iWo2XYx9Ksw/2gjIOHeZAcDBA0kvaGSygVQb3YnLqju+9/Af?=
 =?us-ascii?Q?txrL/PSeMK8WH1R/CLZJ4/ltSC6/N50a41TE4WHg0i3GnAxr+JI8gpU3gIbj?=
 =?us-ascii?Q?XfOYRg24mwijOWzDCRfN9vROvK5Vcb+1pujdXdVznDiewo/8MO4G5PGeruR8?=
 =?us-ascii?Q?wJnkJ+eHbgNxMDted0K6s0X6XseldP2oHehJlu2chj2oem0JKbyxC/g4jaIc?=
 =?us-ascii?Q?Xi8i6yNgsBB5WRQauDZIibJ8Z6x6f69tMSZ1KVSKsjE2GrLMys0Niu6P+JkY?=
 =?us-ascii?Q?tE6gqpS9gY2/S+t2u6PjFEnLw7DHGoAKPszLe0xdlqs+Lj6MPdXhQXE/NBCm?=
 =?us-ascii?Q?td84cr7ApX/ZfzurZ4GxKwpQ3htByqQYFwhAppkkvNdT6yBKFjXo8zGbAb5q?=
 =?us-ascii?Q?4ze5bx/R4gb6ItomoqzVeBy/1FoF7ao0maLiCdmMsw/ZKxDucA4OMh49qcke?=
 =?us-ascii?Q?jznh7h7JcgygoY5aMg948IJzmmgRFjPxJGFErRdN//zJ6l46cmH4iHsK4Xj7?=
 =?us-ascii?Q?9DRxRplcvh0i5QLo0WScwWv2kpbxIGaAULbGH0JWH66BKclmOFeaYkZnvQUf?=
 =?us-ascii?Q?/nWSKzysjb9joE15Gh8+hm0BkJE5DEY15Bet8VsX6Fd5o+DMbK0+WUe0+ssJ?=
 =?us-ascii?Q?K+x9fX+SKNCPCM5Nct7XTgvNZ01Ot6JH+YGDAYjRk1CpLrHPVCMOAJbbLvsA?=
 =?us-ascii?Q?2rVJF87N5dF7p3zNPxslq9Ktk5Yjc+Znik3Qi4hw5J+SvRHpEnvhkubo787S?=
 =?us-ascii?Q?1xkRegYFzFSmanqdazXfPNbveoqKSn52r9BPTMBvsjhOQPeRRtrKuQ0ajyPQ?=
 =?us-ascii?Q?iKwl1osewPDjTj1j5utqaARnlzoq35sCEatJQ+QgfWvN7f9Eu3K/hhoLoyTR?=
 =?us-ascii?Q?NN+50gsZWZFSIKRlck+mg+hO0suD02nmhIMDptfXjNyAt/L5BSLfiGLMlT7T?=
 =?us-ascii?Q?wMpxqcwvI2Ugks63DWdIvmdK+YSgEfthPBy0TIAyFZrAaK2PeIw0q4UOrNNu?=
 =?us-ascii?Q?dYLpFo9aZbo1AFhjjNqbsCyuPTaExY3p0xeJPVmS5bABWEWyOvef8PCoD6bI?=
 =?us-ascii?Q?Oc7lkhSSDu7fG5jRMRwpBSUSOH6+EI9gcWAuofAlvLx+r7b6IZN79Q8H6dw8?=
 =?us-ascii?Q?2hnWyoYzjYG8Ghj73x/l8Z21aAlp1Uk938SF+uitqb1MRvUE/7TYaMTZp0VJ?=
 =?us-ascii?Q?eI0VdAkQsaZSa4gM/So=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 19:08:26.9253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b6987e-9e16-4f2d-f4e9-08de3d9fa884
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010
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

NPU2 hardware was never publicly released and is now obsolete.
Remove all remaining NPU2 support from the driver.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile          |   1 -
 drivers/accel/amdxdna/amdxdna_pci_drv.c |   1 -
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 -
 drivers/accel/amdxdna/npu2_regs.c       | 117 ------------------------
 4 files changed, 120 deletions(-)
 delete mode 100644 drivers/accel/amdxdna/npu2_regs.c

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 6344aaf523fa..3fa0e74fd8f5 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -18,7 +18,6 @@ amdxdna-y := \
 	amdxdna_sysfs.o \
 	amdxdna_ubuf.o \
 	npu1_regs.o \
-	npu2_regs.o \
 	npu4_regs.o \
 	npu5_regs.o \
 	npu6_regs.o
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index fcf7e7869007..7d59764d7869 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -51,7 +51,6 @@ MODULE_DEVICE_TABLE(pci, pci_ids);
 
 static const struct amdxdna_device_id amdxdna_ids[] = {
 	{ 0x1502, 0x0,  &dev_npu1_info },
-	{ 0x17f0, 0x0,  &dev_npu2_info },
 	{ 0x17f0, 0x10, &dev_npu4_info },
 	{ 0x17f0, 0x11, &dev_npu5_info },
 	{ 0x17f0, 0x20, &dev_npu6_info },
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 0d50c4c8b353..6580cb5ec7e2 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -137,7 +137,6 @@ struct amdxdna_client {
 
 /* Add device info below */
 extern const struct amdxdna_dev_info dev_npu1_info;
-extern const struct amdxdna_dev_info dev_npu2_info;
 extern const struct amdxdna_dev_info dev_npu4_info;
 extern const struct amdxdna_dev_info dev_npu5_info;
 extern const struct amdxdna_dev_info dev_npu6_info;
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
deleted file mode 100644
index ad0743fb06d5..000000000000
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ /dev/null
@@ -1,117 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
- */
-
-#include <drm/amdxdna_accel.h>
-#include <drm/drm_device.h>
-#include <drm/gpu_scheduler.h>
-#include <linux/sizes.h>
-
-#include "aie2_pci.h"
-#include "amdxdna_mailbox.h"
-#include "amdxdna_pci_drv.h"
-
-/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
-#define MPNPU_PWAITMODE                0x301003C
-#define MPNPU_PUB_SEC_INTR             0x3010060
-#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
-#define MPNPU_PUB_SCRATCH0             0x301006C
-#define MPNPU_PUB_SCRATCH1             0x3010070
-#define MPNPU_PUB_SCRATCH2             0x3010074
-#define MPNPU_PUB_SCRATCH3             0x3010078
-#define MPNPU_PUB_SCRATCH4             0x301007C
-#define MPNPU_PUB_SCRATCH5             0x3010080
-#define MPNPU_PUB_SCRATCH6             0x3010084
-#define MPNPU_PUB_SCRATCH7             0x3010088
-#define MPNPU_PUB_SCRATCH8             0x301008C
-#define MPNPU_PUB_SCRATCH9             0x3010090
-#define MPNPU_PUB_SCRATCH10            0x3010094
-#define MPNPU_PUB_SCRATCH11            0x3010098
-#define MPNPU_PUB_SCRATCH12            0x301009C
-#define MPNPU_PUB_SCRATCH13            0x30100A0
-#define MPNPU_PUB_SCRATCH14            0x30100A4
-#define MPNPU_PUB_SCRATCH15            0x30100A8
-#define MP0_C2PMSG_73                  0x3810A24
-#define MP0_C2PMSG_123                 0x3810AEC
-
-#define MP1_C2PMSG_0                   0x3B10900
-#define MP1_C2PMSG_60                  0x3B109F0
-#define MP1_C2PMSG_61                  0x3B109F4
-
-#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
-#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
-#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
-#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
-
-#define MMNPU_APERTURE0_BASE           0x3000000
-#define MMNPU_APERTURE1_BASE           0x3600000
-#define MMNPU_APERTURE3_BASE           0x3810000
-#define MMNPU_APERTURE4_BASE           0x3B10000
-
-/* PCIe BAR Index for NPU2 */
-#define NPU2_REG_BAR_INDEX	0
-#define NPU2_MBOX_BAR_INDEX	0
-#define NPU2_PSP_BAR_INDEX	4
-#define NPU2_SMU_BAR_INDEX	5
-#define NPU2_SRAM_BAR_INDEX	2
-/* Associated BARs and Apertures */
-#define NPU2_REG_BAR_BASE	MMNPU_APERTURE0_BASE
-#define NPU2_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
-#define NPU2_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
-#define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
-#define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
-
-static const struct amdxdna_dev_priv npu2_dev_priv = {
-	.fw_path        = "amdnpu/17f0_00/npu.sbin",
-	.protocol_major = 0x6,
-	.protocol_minor = 0x6,
-	.rt_config	= npu4_default_rt_cfg,
-	.dpm_clk_tbl	= npu4_dpm_clk_table,
-	.fw_feature_tbl = npu4_fw_feature_table,
-	.col_align	= COL_ALIGN_NATURE,
-	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
-	.mbox_size      = 0, /* Use BAR size */
-	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
-	.hwctx_limit    = 16,
-	.sram_offs      = {
-		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
-		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
-	},
-	.psp_regs_off   = {
-		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU2_PSP, MP0_C2PMSG_123),
-		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
-		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU2_REG, MPNPU_PUB_SCRATCH4),
-		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU2_REG, MPNPU_PUB_SCRATCH9),
-		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
-		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
-		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
-		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, MPNPU_PWAITMODE),
-	},
-	.smu_regs_off   = {
-		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
-		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU2_SMU, MP1_C2PMSG_60),
-		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU2_SMU, MMNPU_APERTURE4_BASE),
-		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU2_SMU, MP1_C2PMSG_61),
-		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU2_SMU, MP1_C2PMSG_60),
-	},
-	.hw_ops	=	 {
-		.set_dpm = npu4_set_dpm,
-	},
-};
-
-const struct amdxdna_dev_info dev_npu2_info = {
-	.reg_bar           = NPU2_REG_BAR_INDEX,
-	.mbox_bar          = NPU2_MBOX_BAR_INDEX,
-	.sram_bar          = NPU2_SRAM_BAR_INDEX,
-	.psp_bar           = NPU2_PSP_BAR_INDEX,
-	.smu_bar           = NPU2_SMU_BAR_INDEX,
-	.first_col         = 0,
-	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
-	.dev_mem_base      = AIE2_DEVM_BASE,
-	.dev_mem_size      = AIE2_DEVM_SIZE,
-	.vbnv              = "RyzenAI-npu2",
-	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
-	.dev_priv          = &npu2_dev_priv,
-	.ops               = &aie2_ops, /* NPU2 can share NPU1's callback */
-};
-- 
2.34.1

