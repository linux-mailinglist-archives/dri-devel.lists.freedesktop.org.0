Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D59C61C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 20:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50C510E62D;
	Tue, 12 Nov 2024 19:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZHx1iMFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB43010E637
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 19:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRkOrXY0TqsnBxtC0B/QuXLfVlWhAYjuf+hcc6ypWjzkUeFx5xTfTGPTotiZ5Gm7Y8hdhXpuNWrT+DwVH5SjyYmJGOzjqiGpGjfGdL1iwsf+w9k8/E0/hX5TMoYgff42rUp7x6TV7OH8kZEWDBTg9c3+Wk/BWg0sZ7lX8oCF26GHb5Lbd7Z9CiBKJHhTmBtDeMxr73kcByfgLQBkGGSH1qh63MmQ7Pk2EYmYePVlX/4wCXfnJYI6meN+guOK3tLVpqsryo//1OOOzeSCAbeXlqm3g1wl7iMs7VoDX7qCmcsxzN+D5Tuw0EOjMq9zJzpS2c71wPulCQGhGIHbMkyq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rErBZsLAGuOfq21zm37t08AD+i6lWLJtI1hZQuWyE24=;
 b=KhTYuc2tAFokBYzmzUpOJvHE+69Iu/n8/gTa/hrY8+BHekQkCav4TSk28IlZbd3u4n1cHA1Osp99QhWcdyvbqSz+onSuAZuAgzUHmUYohwpumC0TtoLJ6DVi/IIauTbCBOAq8ELeSYncx0eOhMg34XdzNroab95SxHnQa1yEcDrFlMKx40VnJwtlhtUXYQn9GMmKvPxPDcuOBX4blox6D7CohF0wp+avgV3hhCjk/o5QuwLrxgOO5r7Xxtwp9FR4HXs1VvGFrMRnUIs28OWsCnXQJCkmsGwUYwQYmZj5XFytfXc5tOpyoUkpgqchGGk9JFJ+hobY51PPVO7cKO1QnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rErBZsLAGuOfq21zm37t08AD+i6lWLJtI1hZQuWyE24=;
 b=ZHx1iMFy5I7XZQwI07eJFVYiq4rFWOSgAlWFsWVFm2RMuc7nQJiCQESek3Bqi3EutTooBQRqc26Lwb83jsK71SY0wiVqNfg3Ar/mKFVbiwSJehHOvapHUZEm+JO7oOwVILCrPwUXbmL78i3ytCvVtzbrb+5jyep31VobH5NUzdU=
Received: from SA1P222CA0118.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::6)
 by DS7PR12MB6120.namprd12.prod.outlook.com (2603:10b6:8:98::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Tue, 12 Nov 2024 19:48:09 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::2c) by SA1P222CA0118.outlook.office365.com
 (2603:10b6:806:3c5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 19:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 19:48:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:08 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 13:48:08 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V10 09/10] accel/amdxdna: Add error handling
Date: Tue, 12 Nov 2024 11:47:44 -0800
Message-ID: <20241112194745.854626-10-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112194745.854626-1-lizhi.hou@amd.com>
References: <20241112194745.854626-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS7PR12MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 3631bea6-0f8a-4192-3c3c-08dd0352ef5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ahVwDnbDEkMqKgxOWIVMe48gREFgpjnhsDMkdAckc95ZBslCFuwmeFj05L97?=
 =?us-ascii?Q?UDmjj7ING/jZlNBt7VDNEvMFmb7xGTTVXPwn/XyovCWPWiUyZLIun4IVlYAy?=
 =?us-ascii?Q?pPV7EhfXEhTzHZDqavY5BVcH7uMQH1A2ZQuUCMypaLrTOleoBO1sRTurG/WW?=
 =?us-ascii?Q?XghhxsrqrHU1HfozeaMfyZoBa75kSsS+ujYQ2S6gHUkqHFvpblYIj73ch2Ms?=
 =?us-ascii?Q?VGV+0gRR0qmHAn1B7OqzkfVS1WfDmFB2crbcvGbrVc4N9KvSJhRjMyXtQSin?=
 =?us-ascii?Q?qniiRufmUq/RLeMNqk8+ofx5i5mOb4yZ4708UPlaVHURooRZgO9U54iETZ8Q?=
 =?us-ascii?Q?Q91SQeIcB5lcRAVzcYJ4PPf5PFhaU6tfzRfVOMlj49kUvv01/nrAXVxE2XFw?=
 =?us-ascii?Q?YGHn+NAOtII4yadmtHeVFlGoqDN9QuUMBejV4SJA5PvLZx3+bFE4Rmdfw1b2?=
 =?us-ascii?Q?JswJ1h/M0nvk6DrPAdfWhwAdvXQuP8AGlZAzMNC34SOJFiA80AtaSxM9b2QV?=
 =?us-ascii?Q?/Jd9UDoxIisy8pDWEwHqZo7ihf8quoqQ3Q4KL0OZ777e8gxfXGgw27YOfzdc?=
 =?us-ascii?Q?ut9UwYBILP6QzjuX2Cb7ULuq6QwPCXedv53iysNYrXImawk5CSC5+6xCIQzX?=
 =?us-ascii?Q?AqgmahOaa1grHEyArgm2buljjDgKFoqmGIcX7L5T2p15IG2dr6KIiPAeenSh?=
 =?us-ascii?Q?1belOhYc9+DXA2WIDkWw9+I+q+rlc+u9Avhwf1Fo6x0xWJWHLGMD3hENQdz2?=
 =?us-ascii?Q?Wpgpow9Ac8pm20ZMlVwCDBMjv4xZnEvomDR9+1MngDG94HwDx9GRlaRR4dO1?=
 =?us-ascii?Q?nXSThuBWz9PRDa7khsIBiBgygCXqb5HR5hzoE6ruNtFFpFc36Jo4k9XDvYv/?=
 =?us-ascii?Q?LGnazGQo4+x3C+XLK/ouDKH1U4OPryJ6oQQ6cIAVbQCA6KMeqqbRJGAo+cR7?=
 =?us-ascii?Q?OGC2h3v2tbzI7iMyBCOU8CZ5StuoMZO9TwxAZ7kNIQewb2UCW4ObFDXqGijl?=
 =?us-ascii?Q?A+5gMKT3VBgShBF6eBUxs7xEet1LdRFGM0yw8zYkE6awwCbiFJIklNro3BzZ?=
 =?us-ascii?Q?5o3Ffpkl5hghky3m23BVdMNlava808L6itIwvsQA9BUpaqfUa8Pub/KPsb1i?=
 =?us-ascii?Q?gYF0/Cvi1A9RyrEkKY1F5ycALvZn+bAtU6PRlj+zgSNVInAOP+qBqiYaFyOk?=
 =?us-ascii?Q?29YS/9t8VCp+K88kd9ozV2PQ9HoaOdSKeiKa2zMUw0LEW6KoqqQJaLBsAsHv?=
 =?us-ascii?Q?tFzU6M5UQ+35KbYt+eH0CUSjgSokPEVB/lyqfg+ugfI6m2ry4BqQbI+Eg196?=
 =?us-ascii?Q?2uotFVM18Gtx2kno1QyPJ1shMpCOKLmQ7mov7trOLnJet0Y3D0cBBZ5F6rfD?=
 =?us-ascii?Q?m02BvsSTpOf12vl4Sztd9jm6cBGiRBG9uWdWtS+E7kujg65nFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 19:48:09.3607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3631bea6-0f8a-4192-3c3c-08dd0352ef5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6120
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
index 803ebb237971..5467aabe7308 100644
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
 
@@ -469,9 +478,30 @@ static int aie2_init(struct amdxdna_dev *xdna)
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
@@ -487,8 +517,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
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
index 72691c9eebd7..4422dd6c985e 100644
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

