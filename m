Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0336C9C1581
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 05:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615410E918;
	Fri,  8 Nov 2024 04:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pgrRu54c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC0510E90F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 04:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCMB+iVRgBGhpEhQDc3IHCFPfWMlYOJ6xlIyrIh67d4PTZxRe408/EVCRjLRA2h+DmS29MzxmYdp6qhzhsrUHw4yOlIEa7C6BQXzv64mUmMTf4MsbI3g44rJ/4b78dt+zFGjCP3l20BtE6pTYwfPWjwVtD6hlRMVizQsqRJhKkFKF5Jb/n4rylYo+UpXEo6eJn/1cc9U/Fz37ca8oS1/GWYU7jsE4dChUfGU5rbRVeEtD3zTnef6UOLVVHc+6etnMqjZ9E5rNcYlea+hCtgp1yBRkkvAmDhMkUHlBS6nr7lR+CM/luKmJyzSzNU9+ZA0N5JskUpgkMZcQOhxX6HxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ2ZrBl9wPa/A0OyWclvVf4CowYaCRt7Oxi9ggbR9ak=;
 b=nYD+jST4eWuSb4U/VoCXJL/TMBOk9XtSdE8kuWO6FesgqwXEDtugSWogDDCiujPfBwgE3RqNh+k8AfqHj+IFbSoLZoxvg9cSRu0ZjBKhpAICIkXlvLUIRzCUepg2c03aa7AjuNhcEuOg5bvetjG4QJr4JETl50pFcsVrdDI9oOJFr5HIuY8c5aei4QJkAiqPsJ8NKXlKscwlc7CBBm1c76ENnKJzVhnDULfKZ0YqKQuachkV1c92xOTwxQa0wDh3xf0fkE5Jh4sL/gg6TK3PNhznfY2kpN1vH2CCN4tkgMkqS3ED3KKglI//HuDXaYK/rDkwoh/ZPtzksw6qPnXEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ2ZrBl9wPa/A0OyWclvVf4CowYaCRt7Oxi9ggbR9ak=;
 b=pgrRu54calA/uUN6fnn+qIcOXtXa93Eo4xVfscg24DfYr3+Zzau2Jzk1nGghPA30dlqkaXFlktW5kf5zUowCA1UylplxVDmToFTPU3P8CrVgjtj0osHLtJ3Hdopq75vkCjFQl5+FWUz1Z1VPocKNhQWAea4hNb6Xj95vZzZegDs=
Received: from BYAPR11CA0067.namprd11.prod.outlook.com (2603:10b6:a03:80::44)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Fri, 8 Nov
 2024 04:35:36 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::a) by BYAPR11CA0067.outlook.office365.com
 (2603:10b6:a03:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Fri, 8 Nov 2024 04:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 04:35:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 22:35:29 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 22:35:28 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 22:35:28 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V7 09/10] accel/amdxdna: Add error handling
Date: Thu, 7 Nov 2024 20:34:47 -0800
Message-ID: <20241108043448.449314-10-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108043448.449314-1-lizhi.hou@amd.com>
References: <20241108043448.449314-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dace11-7aed-4f60-699f-08dcffaeca48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QNPnUmqZeGR4GfkKIwT9oX3OuhDSy7THNhflhYnTwrPWBBoF2tAKBN0tARFW?=
 =?us-ascii?Q?HAdaO034GuZ7JHvcODgvtQXzp6G8ngKXsix/wcQsPyYuKpiYIEBw0v5pbQoX?=
 =?us-ascii?Q?YLNX2fNhSy4D3PoVWA2hZVTa9pCJdWdWoMBuaSgvNRHFQ4+W93bI6nXcbQeq?=
 =?us-ascii?Q?U0HKs8gYWV9P+9/Fe3LUZeFZH2vGkhGSFvIgx6fpaQjSnuaRNE37IIFxzxFk?=
 =?us-ascii?Q?F8CYirK7QAvIqfKKp6tYZXKIUqavIfxF1dSMtihp4ZIY1z8MzT6VgyQ784qu?=
 =?us-ascii?Q?Ej2t3aJYnY2TbwyZ7iRbzYQsbOpsvtcGd/QE6B7wfEXFpOYyVJx+m3LPAO/Y?=
 =?us-ascii?Q?9ShLHOVpxypjU+xLzOFXvKI/VZxei0dtFYUPjInegZovYTNlAvW8n3tsDTg0?=
 =?us-ascii?Q?O/wEVrfZK/qSGr1FDFs5sDPd7Isl9Lx5orgNGTqhWZDYj871yDygZvSKr0tn?=
 =?us-ascii?Q?8DTf5WV3l+E7FHY7+md+FHJhqPfPXkaS949t4tDsuP7zWcXlF5V5podqtheg?=
 =?us-ascii?Q?C48O6mwjJc95ccubFDAsm5R5Y40IfIhnOcsrocd4AwHOUSlmoqR3GzKollNz?=
 =?us-ascii?Q?tLWDUXXHgJAVIclqG3fz26LnDE+KrLn+GIbHspRdnGEZdb5jm7pAufOw8Fnr?=
 =?us-ascii?Q?B4lrP1oVak3TQKojuP7l++g2g+wVOd1I323pJ529l8GT5TuApeV35Zr93+3E?=
 =?us-ascii?Q?eCcIOBDxdGbwnFT+rYCUY/fkmDAnWTT3sto8F63neTayVXlPLiLyVPOErF3T?=
 =?us-ascii?Q?FFneFg3+M+9HpPEsIqg+52kgnDK6ja3jSL7lfwYHfIkbHWas1Td7vKGn6Fym?=
 =?us-ascii?Q?mPG+GgFtXCjWg9YzuajouuzgS+m7mP85dGNhI/0Cx5Oim5aZmeZDreMBK424?=
 =?us-ascii?Q?RO+D7nbWhvZNYWZQ3J2KcA8YlKRqNjTYwj8wyGGc8w7pfV5anDNocTboCPtv?=
 =?us-ascii?Q?kivN+54ntxU+u4bPrOXh9UMwH/2LoGU9axmfhfrgnhys75tWa23D5LsrEK8O?=
 =?us-ascii?Q?2lCPa5VDcZPaKImHlyUmiyPc6x2Pl8EZQkq/hS6saZSOZcyHXkG9FTd+EErJ?=
 =?us-ascii?Q?h1Rnzy2upB+K5n/HQbCSMapL0uE2f35mtXrqrWirW18+Y8nUyWZdmCkH3lib?=
 =?us-ascii?Q?s/zpp9LE2RbEYV2sTP3Dt0Pdi2oBK/FKeriakd3H5QFBgnHTjyGGyOdyaFzo?=
 =?us-ascii?Q?9xswOifWBXOdF6XozkgXz26OdUvQ3OYXXK7u6oTnpGt2Q2uRtd7FkvundlHn?=
 =?us-ascii?Q?UCbxQnllLMTYptccOumj4OgFcsC0aJLf2L6Xosli64K2GXiskBj7k+Pt7Hgi?=
 =?us-ascii?Q?erkWtbmONwyM6p7nwp0nQ5e7Hlmx9rdWZRHnfBdMbzL1TgiwhU3IAVm8Ai3p?=
 =?us-ascii?Q?axdKvSw/FjR9YMJZA/kpwR4/ClxfKnRismPPleX+WyigCz3pSQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 04:35:36.1340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dace11-7aed-4f60-699f-08dcffaeca48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
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

When there is a hardware error, the NPU firmware notifies the host through
a mailbox message. The message includes details of the error, such as the
tile and column indexes where the error occurred.

The driver starts a thread to handle the NPU error message. The thread
stops the clients which are using the column where error occurred. Then
the driver resets that column.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile       |   1 +
 drivers/accel/amdxdna/aie2_error.c   | 360 +++++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_message.c |  19 ++
 drivers/accel/amdxdna/aie2_pci.c     |  32 +++
 drivers/accel/amdxdna/aie2_pci.h     |   9 +
 5 files changed, 421 insertions(+)
 create mode 100644 drivers/accel/amdxdna/aie2_error.c

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index a688c378761f..ed6f87910880 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -2,6 +2,7 @@
 
 amdxdna-y := \
 	aie2_ctx.o \
+	aie2_error.o \
 	aie2_message.o \
 	aie2_pci.o \
 	aie2_psp.o \
diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
new file mode 100644
index 000000000000..b1defaa8513b
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_cache.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
+#include <linux/dma-mapping.h>
+#include <linux/kthread.h>
+#include <linux/kernel.h>
+
+#include "aie2_msg_priv.h"
+#include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
+#include "amdxdna_pci_drv.h"
+
+struct async_event {
+	struct amdxdna_dev_hdl		*ndev;
+	struct async_event_msg_resp	resp;
+	struct workqueue_struct		*wq;
+	struct work_struct		work;
+	u8				*buf;
+	dma_addr_t			addr;
+	u32				size;
+};
+
+struct async_events {
+	struct workqueue_struct		*wq;
+	u8				*buf;
+	dma_addr_t			addr;
+	u32				size;
+	u32				event_cnt;
+	struct async_event		event[] __counted_by(event_cnt);
+};
+
+/*
+ * Below enum, struct and lookup tables are porting from XAIE util header file.
+ *
+ * Below data is defined by AIE device and it is used for decode error message
+ * from the device.
+ */
+
+enum aie_module_type {
+	AIE_MEM_MOD = 0,
+	AIE_CORE_MOD,
+	AIE_PL_MOD,
+};
+
+enum aie_error_category {
+	AIE_ERROR_SATURATION = 0,
+	AIE_ERROR_FP,
+	AIE_ERROR_STREAM,
+	AIE_ERROR_ACCESS,
+	AIE_ERROR_BUS,
+	AIE_ERROR_INSTRUCTION,
+	AIE_ERROR_ECC,
+	AIE_ERROR_LOCK,
+	AIE_ERROR_DMA,
+	AIE_ERROR_MEM_PARITY,
+	/* Unknown is not from XAIE, added for better category */
+	AIE_ERROR_UNKNOWN,
+};
+
+/* Don't pack, unless XAIE side changed */
+struct aie_error {
+	__u8			row;
+	__u8			col;
+	__u32			mod_type;
+	__u8			event_id;
+};
+
+struct aie_err_info {
+	u32			err_cnt;
+	u32			ret_code;
+	u32			rsvd;
+	struct aie_error	payload[] __counted_by(err_cnt);
+};
+
+struct aie_event_category {
+	u8			event_id;
+	enum aie_error_category category;
+};
+
+#define EVENT_CATEGORY(id, cat) { id, cat }
+static const struct aie_event_category aie_ml_mem_event_cat[] = {
+	EVENT_CATEGORY(88U,  AIE_ERROR_ECC),
+	EVENT_CATEGORY(90U,  AIE_ERROR_ECC),
+	EVENT_CATEGORY(91U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(92U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(93U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(94U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(95U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(96U,  AIE_ERROR_MEM_PARITY),
+	EVENT_CATEGORY(97U,  AIE_ERROR_DMA),
+	EVENT_CATEGORY(98U,  AIE_ERROR_DMA),
+	EVENT_CATEGORY(99U,  AIE_ERROR_DMA),
+	EVENT_CATEGORY(100U, AIE_ERROR_DMA),
+	EVENT_CATEGORY(101U, AIE_ERROR_LOCK),
+};
+
+static const struct aie_event_category aie_ml_core_event_cat[] = {
+	EVENT_CATEGORY(55U, AIE_ERROR_ACCESS),
+	EVENT_CATEGORY(56U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(57U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(58U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(59U, AIE_ERROR_INSTRUCTION),
+	EVENT_CATEGORY(60U, AIE_ERROR_ACCESS),
+	EVENT_CATEGORY(62U, AIE_ERROR_ECC),
+	EVENT_CATEGORY(64U, AIE_ERROR_ECC),
+	EVENT_CATEGORY(65U, AIE_ERROR_ACCESS),
+	EVENT_CATEGORY(66U, AIE_ERROR_ACCESS),
+	EVENT_CATEGORY(67U, AIE_ERROR_LOCK),
+	EVENT_CATEGORY(70U, AIE_ERROR_INSTRUCTION),
+	EVENT_CATEGORY(71U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(72U, AIE_ERROR_BUS),
+};
+
+static const struct aie_event_category aie_ml_mem_tile_event_cat[] = {
+	EVENT_CATEGORY(130U, AIE_ERROR_ECC),
+	EVENT_CATEGORY(132U, AIE_ERROR_ECC),
+	EVENT_CATEGORY(133U, AIE_ERROR_DMA),
+	EVENT_CATEGORY(134U, AIE_ERROR_DMA),
+	EVENT_CATEGORY(135U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(136U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(137U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(138U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(139U, AIE_ERROR_LOCK),
+};
+
+static const struct aie_event_category aie_ml_shim_tile_event_cat[] = {
+	EVENT_CATEGORY(64U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(65U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(66U, AIE_ERROR_STREAM),
+	EVENT_CATEGORY(67U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(68U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(69U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(70U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(71U, AIE_ERROR_BUS),
+	EVENT_CATEGORY(72U, AIE_ERROR_DMA),
+	EVENT_CATEGORY(73U, AIE_ERROR_DMA),
+	EVENT_CATEGORY(74U, AIE_ERROR_LOCK),
+};
+
+static enum aie_error_category
+aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
+{
+	const struct aie_event_category *lut;
+	int num_entry;
+	int i;
+
+	switch (mod_type) {
+	case AIE_PL_MOD:
+		lut = aie_ml_shim_tile_event_cat;
+		num_entry = ARRAY_SIZE(aie_ml_shim_tile_event_cat);
+		break;
+	case AIE_CORE_MOD:
+		lut = aie_ml_core_event_cat;
+		num_entry = ARRAY_SIZE(aie_ml_core_event_cat);
+		break;
+	case AIE_MEM_MOD:
+		if (row == 1) {
+			lut = aie_ml_mem_tile_event_cat;
+			num_entry = ARRAY_SIZE(aie_ml_mem_tile_event_cat);
+		} else {
+			lut = aie_ml_mem_event_cat;
+			num_entry = ARRAY_SIZE(aie_ml_mem_event_cat);
+		}
+		break;
+	default:
+		return AIE_ERROR_UNKNOWN;
+	}
+
+	for (i = 0; i < num_entry; i++) {
+		if (event_id != lut[i].event_id)
+			continue;
+
+		return lut[i].category;
+	}
+
+	return AIE_ERROR_UNKNOWN;
+}
+
+static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
+{
+	struct aie_error *errs = err_info;
+	u32 err_col = 0; /* assume that AIE has less than 32 columns */
+	int i;
+
+	/* Get err column bitmap */
+	for (i = 0; i < num_err; i++) {
+		struct aie_error *err = &errs[i];
+		enum aie_error_category cat;
+
+		cat = aie_get_error_category(err->row, err->event_id, err->mod_type);
+		XDNA_ERR(ndev->xdna, "Row: %d, Col: %d, module %d, event ID %d, category %d",
+			 err->row, err->col, err->mod_type,
+			 err->event_id, cat);
+
+		if (err->col >= 32) {
+			XDNA_WARN(ndev->xdna, "Invalid column number");
+			break;
+		}
+
+		err_col |= (1 << err->col);
+	}
+
+	return err_col;
+}
+
+static int aie2_error_async_cb(void *handle, const u32 *data, size_t size)
+{
+	struct async_event_msg_resp *resp;
+	struct async_event *e = handle;
+
+	if (data) {
+		resp = (struct async_event_msg_resp *)data;
+		e->resp.type = resp->type;
+		wmb(); /* Update status in the end, so that no lock for here */
+		e->resp.status = resp->status;
+	}
+	queue_work(e->wq, &e->work);
+	return 0;
+}
+
+static int aie2_error_event_send(struct async_event *e)
+{
+	drm_clflush_virt_range(e->buf, e->size); /* device can access */
+	return aie2_register_asyn_event_msg(e->ndev, e->addr, e->size, e,
+					    aie2_error_async_cb);
+}
+
+static void aie2_error_worker(struct work_struct *err_work)
+{
+	struct aie_err_info *info;
+	struct amdxdna_dev *xdna;
+	struct async_event *e;
+	u32 max_err;
+	u32 err_col;
+
+	e = container_of(err_work, struct async_event, work);
+
+	xdna = e->ndev->xdna;
+
+	if (e->resp.status == MAX_AIE2_STATUS_CODE)
+		return;
+
+	e->resp.status = MAX_AIE2_STATUS_CODE;
+
+	print_hex_dump_debug("AIE error: ", DUMP_PREFIX_OFFSET, 16, 4,
+			     e->buf, 0x100, false);
+
+	info = (struct aie_err_info *)e->buf;
+	XDNA_DBG(xdna, "Error count %d return code %d", info->err_cnt, info->ret_code);
+
+	max_err = (e->size - sizeof(*info)) / sizeof(struct aie_error);
+	if (unlikely(info->err_cnt > max_err)) {
+		WARN_ONCE(1, "Error count too large %d\n", info->err_cnt);
+		return;
+	}
+	err_col = aie2_error_backtrack(e->ndev, info->payload, info->err_cnt);
+	if (!err_col) {
+		XDNA_WARN(xdna, "Did not get error column");
+		return;
+	}
+
+	mutex_lock(&xdna->dev_lock);
+	/* Re-sent this event to firmware */
+	if (aie2_error_event_send(e))
+		XDNA_WARN(xdna, "Unable to register async event");
+	mutex_unlock(&xdna->dev_lock);
+}
+
+int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+	struct async_event *e;
+	int i, ret;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	for (i = 0; i < ndev->async_events->event_cnt; i++) {
+		e = &ndev->async_events->event[i];
+		ret = aie2_error_event_send(e);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+	struct async_events *events;
+
+	events = ndev->async_events;
+
+	mutex_unlock(&xdna->dev_lock);
+	destroy_workqueue(events->wq);
+	mutex_lock(&xdna->dev_lock);
+
+	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
+			     events->addr, DMA_FROM_DEVICE);
+	kfree(events);
+}
+
+int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+	u32 total_col = ndev->total_col;
+	u32 total_size = ASYNC_BUF_SIZE * total_col;
+	struct async_events *events;
+	int i, ret;
+
+	events = kzalloc(struct_size(events, event, total_col), GFP_KERNEL);
+	if (!events)
+		return -ENOMEM;
+
+	events->buf = dma_alloc_noncoherent(xdna->ddev.dev, total_size, &events->addr,
+					    DMA_FROM_DEVICE, GFP_KERNEL);
+	if (!events->buf) {
+		ret = -ENOMEM;
+		goto free_events;
+	}
+	events->size = total_size;
+	events->event_cnt = total_col;
+
+	events->wq = alloc_ordered_workqueue("async_wq", 0);
+	if (!events->wq) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	for (i = 0; i < events->event_cnt; i++) {
+		struct async_event *e = &events->event[i];
+		u32 offset = i * ASYNC_BUF_SIZE;
+
+		e->ndev = ndev;
+		e->wq = events->wq;
+		e->buf = &events->buf[offset];
+		e->addr = events->addr + offset;
+		e->size = ASYNC_BUF_SIZE;
+		e->resp.status = MAX_AIE2_STATUS_CODE;
+		INIT_WORK(&e->work, aie2_error_worker);
+	}
+
+	ndev->async_events = events;
+
+	XDNA_DBG(xdna, "Async event count %d, buf total size 0x%x",
+		 events->event_cnt, events->size);
+	return 0;
+
+free_buf:
+	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
+			     events->addr, DMA_FROM_DEVICE);
+free_events:
+	kfree(events);
+	return ret;
+}
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index db62954eb378..eb7e27045213 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -308,6 +308,25 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u6
 	return 0;
 }
 
+int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
+				 void *handle, int (*cb)(void*, const u32 *, size_t))
+{
+	struct async_event_msg_req req = { 0 };
+	struct xdna_mailbox_msg msg = {
+		.send_data = (u8 *)&req,
+		.send_size = sizeof(req),
+		.handle = handle,
+		.opcode = MSG_OP_REGISTER_ASYNC_EVENT_MSG,
+		.notify_cb = cb,
+	};
+
+	req.buf_addr = addr;
+	req.buf_size = size;
+
+	XDNA_DBG(ndev->xdna, "Register addr 0x%llx size 0x%x", addr, size);
+	return xdna_mailbox_send_msg(ndev->mgmt_chann, &msg, TX_TIMEOUT);
+}
+
 int aie2_config_cu(struct amdxdna_hwctx *hwctx)
 {
 	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 7c7442df6e33..af1ad8093811 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -180,6 +180,15 @@ static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
 		return ret;
 	}
 
+	if (!ndev->async_events)
+		return 0;
+
+	ret = aie2_error_async_events_send(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Send async events failed");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -468,9 +477,30 @@ static int aie2_init(struct amdxdna_dev *xdna)
 		goto stop_hw;
 	}
 
+	ret = aie2_error_async_events_alloc(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "Allocate async events failed, ret %d", ret);
+		goto stop_hw;
+	}
+
+	ret = aie2_error_async_events_send(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "Send async events failed, ret %d", ret);
+		goto async_event_free;
+	}
+
+	/* Issue a command to make sure firmware handled async events */
+	ret = aie2_query_firmware_version(ndev, &ndev->xdna->fw_ver);
+	if (ret) {
+		XDNA_ERR(xdna, "Re-query firmware version failed");
+		goto async_event_free;
+	}
+
 	release_firmware(fw);
 	return 0;
 
+async_event_free:
+	aie2_error_async_events_free(ndev);
 stop_hw:
 	aie2_hw_stop(xdna);
 disable_sva:
@@ -486,8 +516,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
 static void aie2_fini(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
 
 	aie2_hw_stop(xdna);
+	aie2_error_async_events_free(ndev);
 	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
 	pci_free_irq_vectors(pdev);
 }
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 4d851a44a34b..144e93e05d8b 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -170,6 +170,7 @@ struct amdxdna_dev_hdl {
 	/* Mailbox and the management channel */
 	struct mailbox			*mbox;
 	struct mailbox_channel		*mgmt_chann;
+	struct async_events		*async_events;
 };
 
 #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
@@ -210,6 +211,12 @@ struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *
 int aie2_psp_start(struct psp_device *psp);
 void aie2_psp_stop(struct psp_device *psp);
 
+/* aie2_error.c */
+int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
+void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev);
+int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev);
+int aie2_error_async_msg_thread(void *data);
+
 /* aie2_message.c */
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
 int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
@@ -224,6 +231,8 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
+int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
+				 void *handle, int (*cb)(void*, const u32 *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
 int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		 int (*notify_cb)(void *, const u32 *, size_t));
-- 
2.34.1

