Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84F9F19E3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A593610F11C;
	Fri, 13 Dec 2024 23:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iZCfvOBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA0910F118
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIDcu4RxMDhzh//U0DGrNAVrxf9vA6PCYmNyKdnDiLz+xDjar/3dBN9jQHYiFwvFRpIuLdWjVgat5mxZTSdddKLV0+0ZrR/hFOunswvINV+TqAbhCOo9bX9nj1CpdVMfx9v4YBI4TM+oo4ak6as9K7U3F4AXGFrXC0xGc3Z6AyJDWOuMvlLAyeTZjbBO1jaluMTU7TWvZSU9sbWgJyP6XqJ2/qj15/XYNo/SJJSK6Fav5ruySx4O0PNMXEGsBPasjO4OD7Gm758c87Aina9FKtUB929n5trWPmECB/73bXHxiqD3ojTwZj7VpGdrXwmErllK5MWU6+m2J+dHVbc8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjeU+ONQktvqEWXUSvecKrCN5wUBZ0Z7wfWNxZUy63c=;
 b=V5jVF6E0m1T7HeFQHh6YOoTFJaQBCECsHliQBtsMTpX3C7QrE17rS7Ud4BmJEZuAtHUXWtCNfXTwYj9nCXyfxg3f8+HgK8njKtj4Iu0jplAHMBqquRx+o9yuWhbRyukKEyRdD3e0ZDSV2p9ba1KDN70tMB03KqdyU8CjKj2o0gMwBjdNoCf5fhl3sGJxoiux2Kvo1I/YgDgjkgXevx7jdgGH17GZQ9L42gpK27jt+z9y5s9EdHgzZpyl+6otw21fjF2oRYRMY9qhrTz/tjxGJvDdaSFo9kn7r9AkROe6q5ZZXDJZj+2b57nk4yFLMLtoLFkvvZPeNlxyICNEmzE8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjeU+ONQktvqEWXUSvecKrCN5wUBZ0Z7wfWNxZUy63c=;
 b=iZCfvOBzJPYgbZTgoLmp4FVduN3SJVZEv/GxUN78UoVInFMxGEko512Sp2v4yJ9ebrEewGkJ/2hSTGsfp9hCpdfub6d2QrbWUdl5/p6FHmSm6zM90iR/RK3aItrD5K5d7qBW9JBpRQSNMTMp7NprZOpZLMgDeBOF8N4w7+RVqow=
Received: from CH2PR18CA0038.namprd18.prod.outlook.com (2603:10b6:610:55::18)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 23:29:51 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::4f) by CH2PR18CA0038.outlook.office365.com
 (2603:10b6:610:55::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:29:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:29:50 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:29:50 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Xiaoming Ren
 <xiaoming.ren@amd.com>
Subject: [PATCH V3 1/5] accel/amdxdna: Add RyzenAI-npu6 support
Date: Fri, 13 Dec 2024 15:29:29 -0800
Message-ID: <20241213232933.1545388-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213232933.1545388-1-lizhi.hou@amd.com>
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df820be-24c1-4f21-782d-08dd1bce0ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QWDeTeZbEqgOMvl6+3jkTZ3VjjuRpQbqw+qwJcwZ2SjIbeBeRY7k6/V0Gl5L?=
 =?us-ascii?Q?HgMFVRmFRjf0ic71HE6UmoarECuhNQJ0jM++tHZoQO2aK++aXIgxEu+CLhUY?=
 =?us-ascii?Q?vyOuQObQ2/Qm+vd8VAwVRHu0OU+6PsR8fEwzhklYLGMmaG3s7kGwlNrsUnuf?=
 =?us-ascii?Q?7LmHeiLNTiHo8rwFF6Fb0uX5cTKe4FIZtoONCjcubq/z0kOcLrsJ7rCwq8/e?=
 =?us-ascii?Q?jburtnz7wsOLrn3PVWagNf+nGRdj9UF2hXSKqDu1Cgh3O8gFSVRy+3rxHPYt?=
 =?us-ascii?Q?Fin6p9fZdQq02J/0F51wL2RQV2ZrWdbGsBQT6hktcAw9EYEMCNjj6Sxvc1ow?=
 =?us-ascii?Q?zjie6WaG5tc+5r/X2kJBNpe7LJ/UQhQk/naGSIekxkqBVkVoqiCEWQ3R9kLs?=
 =?us-ascii?Q?ASgkTUi2ozWgoY0sSd8qGDVFhNsyiRmcq4xRzY1694x9CXNCsajvAbQO/KUd?=
 =?us-ascii?Q?hIUIbREJL+YSFhfWYUrAIxAJhDuJZqfoUdxFVkiugAqcnBCCLfLmSoyi25On?=
 =?us-ascii?Q?4zR5FZny2hcAQ9nsbVgTIwuXnpT90DBb3Ic5bd1IyRS7pp3tr9Hg/WyqEev/?=
 =?us-ascii?Q?6KLEJZWFpkNm3hKjFch5AsCvPTZpHpObEJKbUeJnXkiBiAGQV+WC95zoz/sW?=
 =?us-ascii?Q?V24f6po6p/4vEyglj6Z330kMwdhlkHq9J9HNpBWUmKpLQAFi4Qpp62UCthwt?=
 =?us-ascii?Q?sWEMxRRafRb7i/0LTFqIdbcNw/U6vvXGm4jTkMyL39+s12VZgGKgiltvy048?=
 =?us-ascii?Q?fSW0YiFvodz+D5azkdZHRvXPHoDzmRSULrtI0wzlA/OPLiEyPcUtNs/ThRhy?=
 =?us-ascii?Q?/tSlq3m5BWwnok8rCNId3rpYEedIwMtubAL0787aUubEe/vyIkwhrHUorRHW?=
 =?us-ascii?Q?K2JcZnK4xpn16BxAXWk7qDFLRp22+af/ofNigZ3oLmtSmoH2MYSVJi5fwZBV?=
 =?us-ascii?Q?8DwzN1FcNmeLkU+60q2N4iThepA8gbYwHK8sm8Ilx5ku54kF5xRQQrSY7bfD?=
 =?us-ascii?Q?/FStZS8ctN8qxozNHv/hw1JUI6yX6fQcZK2wJ1GK6gkf9/ATIGd5YHqMkT4x?=
 =?us-ascii?Q?5LwGTDi3XU+yoVTntyqxkN5Iuw+GQb0obrDW8eNADqtvSWLjuOuiElRReW7i?=
 =?us-ascii?Q?oOAjZtQi4rUvQZDfbpwnocBKvtxYaC22MP50PVAIzfpV6mfmNRvp5ObwiUvM?=
 =?us-ascii?Q?ENERmja5E/xdr5b3nfTmdNYMyvxHbyZCSH89MYC5gUz2rWqDFv+3W9rT2Zlt?=
 =?us-ascii?Q?4iLP3YlCNLIBV5ttVLrw/Zib5Sa8+dG0+RgzQ5O+Qlz7+6DVxLUevNpC/X6n?=
 =?us-ascii?Q?MjY/PqywLlQ0I8GOwS/3qKMVSzcN+NBapA51MTE/LwLMY/YCZAvxaDuIm0dO?=
 =?us-ascii?Q?FSD0AoevPjt5CZdi22m48tBSKWq9sMxCPMFvCoMwqCuqVpf4cmhaAxUqraLy?=
 =?us-ascii?Q?P4+Or97N1dXcq1C3JtSdHVOPVTxRAv06?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:29:51.5433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df820be-24c1-4f21-782d-08dd1bce0ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile          |   3 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c |   1 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 drivers/accel/amdxdna/npu6_regs.c       | 121 ++++++++++++++++++++++++
 4 files changed, 125 insertions(+), 1 deletion(-)
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
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index b2342abdddc6..0ba2af987837 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -39,6 +39,7 @@ static const struct amdxdna_device_id amdxdna_ids[] = {
 	{ 0x17f0, 0x0,  &dev_npu2_info },
 	{ 0x17f0, 0x10, &dev_npu4_info },
 	{ 0x17f0, 0x11, &dev_npu5_info },
+	{ 0x17f0, 0x20, &dev_npu6_info },
 	{0}
 };
 
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index c50d65a050ad..0c2e31c05d3e 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -116,6 +116,7 @@ extern const struct amdxdna_dev_info dev_npu1_info;
 extern const struct amdxdna_dev_info dev_npu2_info;
 extern const struct amdxdna_dev_info dev_npu4_info;
 extern const struct amdxdna_dev_info dev_npu5_info;
+extern const struct amdxdna_dev_info dev_npu6_info;
 
 int amdxdna_sysfs_init(struct amdxdna_dev *xdna);
 void amdxdna_sysfs_fini(struct amdxdna_dev *xdna);
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

