Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C103C4A4CC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE310E4DC;
	Tue, 11 Nov 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KX4/N2nb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010014.outbound.protection.outlook.com
 [52.101.193.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819010E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 01:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAOtXfGf4k22QgjDuBatLWBmnwBwM5QZ7raJuFUt/vLT19XmXXZ0LH+oiSibj4mp2RCGqgaiRMkRpITh10qggC5GLudHlI114TC8FgHlFuu4WILs8tByq1YAzEVIoGspi6BIZWXQkyocIraRkPYl+1FX8/g/i4zvo+a+hQ/dPC4z7voH/X3nS2uKvj+ZGidIq9iviWFmyLCNigfxrODRJhtyvCWpr9F2iJlMFqGRYy06uF8RYYEhWSdVopC7WMQWZZppU42cl2DK8xi5Dc0Iq2Xws/jaEKyarmDls1omTO7m12DxmC/0J+CEHZjMiL863aJnTbH2ppVkpZZuYVqN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SFaDdOwr9649wm/vpSpn8kJFNGceBT3jP3ah3qcaHQ=;
 b=ip9LvAaXwQMa2Y8y4Y+CshCAhI3eXS2tBG3RzEbcqRP4H5eEEQPK468bN8ubha/BHHgZIyoNs+/Jz/ZTMsHNvEfnFDPOavCLZcBsW5YqBhx9SWJqoxh85W/TS2ykwUCX+g8FIkR1dWS0brHa6k/MXRM/u6XQHdnE0S3uNlwv53kbzQy7K2Y+Zl5Zkm+q59df/CbjkyYEuytCg3zb42jaF12RBLeqT0bQcNVHwxzv53dVh8Rqe9/2ffVfW3xiiJIKhDMOj8ZQiWaPDI8Cq62Ac+wpJcsJ2SCmxitV/1dVoeLPBGpkvdzGPnzD4bLIxEXzQ+e4bJqNWaX3ZmvawQkGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFaDdOwr9649wm/vpSpn8kJFNGceBT3jP3ah3qcaHQ=;
 b=KX4/N2nbYzdzCyesTzTL46XlIT41QsyMnNasqcNWTUSUtCl8se7jcGo4ZybGsRrGgHaCTC85pW9UpKXQahgDatBP9E6MJ8R4xYND/oDfbEDSYnnUbPuxI78hU3K5LO8w4uU72krmmcsbc0I0q0oKDWBtHMk9Nb4d3NiHAIgBeVc=
Received: from SJ0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:a03:39e::19)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:16:14 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::99) by SJ0PR03CA0284.outlook.office365.com
 (2603:10b6:a03:39e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 01:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 01:16:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:16:01 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 10 Nov 2025 17:16:00 -0800
From: David Zhang <yidong.zhang@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: David Zhang <yidong.zhang@amd.com>, <linux-kernel@vger.kernel.org>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, <lizhi.hou@amd.com>,
 Nishad Saraf <nishads@amd.com>
Subject: [PATCH V1 3/5] accel/amd_vpci: Add Remote Management(RM) queue
 infrastructure
Date: Mon, 10 Nov 2025 17:15:48 -0800
Message-ID: <20251111011550.439157-4-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111011550.439157-1-yidong.zhang@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d91beb5-2920-4bf8-98ba-08de20bfe828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GHQFOD+16Ji8Gl3NsKqSkGq5z06nnqdG79ToFb1l2KxvXGRzTWuCCv2TZoEc?=
 =?us-ascii?Q?OlifQpimFqkh3buBIFvDzfBexe/5kKazQnLtaja0UJmAQ9CpACLgxMRf9HQQ?=
 =?us-ascii?Q?1ovZKcP85MbcoZLX5BXgcTK8ffaQW3wuyQWkvcq4rAqLcF5zqBO7zDHyYSgJ?=
 =?us-ascii?Q?Eco/yIj3yi/DXPzg3KKWbQH6Rhf7KvwlN9zF4HgH0jeUhAXwRdlj8KUFYf4p?=
 =?us-ascii?Q?YGJ9+q5+DflhLm60r3+m3zAI+bl/aBr6b9zh2IdNnPUy9zURkPrH30piJ/s/?=
 =?us-ascii?Q?cEuSp+ipuPka0dFxIBnvI2wmnDOS9Q2GB87tnt66a1Q3k06O9ODHBz0c+4mf?=
 =?us-ascii?Q?McWbeSm2sA/BZEyQqbD/ga/wsHSgAQQm1UBtzOpzztydVs65JVojynHpa6Wq?=
 =?us-ascii?Q?My3n7E7PZEWV28oa6St4AFF5KBDbXOKZhlLan0pS2hiY73AXW5mavBIFmgSz?=
 =?us-ascii?Q?NZU7aa+VErSXdgM/QJLN/eF4r8wWV1uLwRY3yCEibaBar559m7fPhW/wQ2Oz?=
 =?us-ascii?Q?hXcKm5+2Jq0oQnRRSWo0tPpQplsbDVLld2JwWa75zjzOes74P4Y0VqM3asnD?=
 =?us-ascii?Q?D6ycK5f5Y9yqOKUu+NELR3/RKC5wO/rePz1meFKFB5CNYiF4mx9yp+YOY3wr?=
 =?us-ascii?Q?XDzN7rcXfyvOKl/g13aYbFehownIZtmCQD9uBavggpKJRXviio3hv1ZKV//P?=
 =?us-ascii?Q?R6+W0KYYY2PeItO0o1WN59hE7vgAS89XLG4e3gca7W/qM/zh1cO1s+42ehVN?=
 =?us-ascii?Q?F+tFAso63p/HwduJ4EQdqq+wppFLVR0oH2fCR9zShyHqLoWzqQNNDUlMAHk4?=
 =?us-ascii?Q?nn/U9QdDdCGWKAR0Q6pab76WwcroVUUqBPBMpFHjRuFlmXjOtm/jS06nB8t+?=
 =?us-ascii?Q?KPTgs1rD1+dzAZtdRb29+LBgP2/WQ8T4p5o6pCJnlBkGohxjXPZxNL0hy4Ao?=
 =?us-ascii?Q?Sv6GfLGeYKssYPsWoE9LjSOz2M803OXW5fU80LM+5XMh3BfL6dqmWA6gaLBa?=
 =?us-ascii?Q?Wo3kUKxEtIN32jrtWWyPYZW0VPgQIv5mQQqwpBvt15z5S/KMsqpiCFRNNOEZ?=
 =?us-ascii?Q?l3IBVg319ukavXAG3aNHDvV7rzJpiQhSBQTKVd5FWaBENFUaeCEf2w0jKqf+?=
 =?us-ascii?Q?DPS9LIzwnNmFr9CozjoOq4ljNrQbASVvzlmM97erT+HHiBV/hyRXpnbCK7WK?=
 =?us-ascii?Q?va6CJKSrOLvHeFsekHKCfXO+PmuEBWf8B3/Y+gEczzs3KlQUI7bVB9JlnC5P?=
 =?us-ascii?Q?j8LPuZGmCABR9485r4rthSC7fH4gRQFn60UTE9om6Q8J/HBbYrX4EjwZieTW?=
 =?us-ascii?Q?las24mvc8Kymz5hgsX4rznBYL65sTQ++PzpT//4JCt1fKC7yuZJ5aL9BihN/?=
 =?us-ascii?Q?OfApTtLUy2z/qZlg6og/9YfMzUVspEBtluP+52+M85ekwxVxHZzt4KTppu3O?=
 =?us-ascii?Q?l2qHe5Kvk004rteznOalps37xt1XQGvBXuFsy6Aj2lXw/D7ivgYuXTcR9cEa?=
 =?us-ascii?Q?u5iME9l0DsJQocUwHbmWF4Jto+0ARtxfID53M0uAUT3EVQtWOjzqwlyZcH4h?=
 =?us-ascii?Q?7Ar8XCw9B7rPuqF5gZ8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:16:13.7657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d91beb5-2920-4bf8-98ba-08de20bfe828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
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

This patch introduces a Remote Management (RM) queue service, which
provides a way to communicate between the management PCIe function (PF0)
and the embedded firmware running on AMD Versal SoCs.

The RM service implements a hardware-based ring buffer for bidirectional
command and response exchange between the host driver and the firmware.

This patch adds the core infrastructure for:
  - Initializing and managing the RM queue
  - Submitting commands to the embedded firmware
  - Polling for command completion

Subsequent patches will integrate the infrastructure with the firmware
management logic to enable firmware download, status query, and other
control operations.

Co-developed-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amd_vpci/Makefile               |   3 +-
 drivers/accel/amd_vpci/versal-pci-rm-queue.c  | 316 ++++++++++++++++++
 drivers/accel/amd_vpci/versal-pci-rm-queue.h  |  21 ++
 .../accel/amd_vpci/versal-pci-rm-service.h    | 209 ++++++++++++
 drivers/accel/amd_vpci/versal-pci.h           |   1 +
 5 files changed, 549 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.h

diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
index 03849875ad0b..9e4e56ac2dee 100644
--- a/drivers/accel/amd_vpci/Makefile
+++ b/drivers/accel/amd_vpci/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
 
 versal-pci-y := \
-	versal-pci-main.o
+	versal-pci-main.o \
+	versal-pci-rm-queue.o
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-queue.c b/drivers/accel/amd_vpci/versal-pci-rm-queue.c
new file mode 100644
index 000000000000..e67c506af752
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-rm-queue.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/pci.h>
+
+#include "versal-pci.h"
+#include "versal-pci-rm-queue.h"
+#include "versal-pci-rm-service.h"
+
+static inline struct rm_device *to_rdev_msg_monitor(struct work_struct *w)
+{
+	return container_of(w, struct rm_device, msg_monitor);
+}
+
+static inline struct rm_device *to_rdev_msg_timer(struct timer_list *t)
+{
+	return container_of(t, struct rm_device, msg_timer);
+}
+
+static inline u32 rm_io_read(struct rm_device *rdev, u32 offset)
+{
+	/* TODO */
+	return 0;
+}
+
+static inline int rm_io_write(struct rm_device *rdev, u32 offset, u32 value)
+{
+	/* TODO */
+	return 0;
+}
+
+static inline u32 rm_queue_read(struct rm_device *rdev, u32 offset)
+{
+	/* TODO */
+	return 0;
+}
+
+static inline void rm_queue_write(struct rm_device *rdev, u32 offset, u32 value)
+{
+	/* TODO */
+}
+
+static inline void rm_queue_bulk_read(struct rm_device *rdev, u32 offset,
+				      u32 *value, u32 size)
+{
+	/* TODO */
+}
+
+static inline void rm_queue_bulk_write(struct rm_device *rdev, u32 offset,
+				       u32 *value, u32 size)
+{
+	/* TODO */
+}
+
+static inline u32 rm_queue_get_cidx(struct rm_device *rdev, enum rm_queue_type type)
+{
+	u32 off;
+
+	if (type == RM_QUEUE_SQ)
+		off = offsetof(struct rm_queue_header, sq_cidx);
+	else
+		off = offsetof(struct rm_queue_header, cq_cidx);
+
+	return rm_queue_read(rdev, off);
+}
+
+static inline void rm_queue_set_cidx(struct rm_device *rdev, enum rm_queue_type type,
+				     u32 value)
+{
+	u32 off;
+
+	if (type == RM_QUEUE_SQ)
+		off = offsetof(struct rm_queue_header, sq_cidx);
+	else
+		off = offsetof(struct rm_queue_header, cq_cidx);
+
+	rm_queue_write(rdev, off, value);
+}
+
+static inline u32 rm_queue_get_pidx(struct rm_device *rdev, enum rm_queue_type type)
+{
+	if (type == RM_QUEUE_SQ)
+		return rm_io_read(rdev, RM_IO_SQ_PIDX_OFF);
+	else
+		return rm_io_read(rdev, RM_IO_CQ_PIDX_OFF);
+}
+
+static inline int rm_queue_set_pidx(struct rm_device *rdev,
+				    enum rm_queue_type type, u32 value)
+{
+	if (type == RM_QUEUE_SQ)
+		return rm_io_write(rdev, RM_IO_SQ_PIDX_OFF, value);
+	else
+		return rm_io_write(rdev, RM_IO_CQ_PIDX_OFF, value);
+}
+
+static inline u32 rm_queue_get_sq_slot_offset(struct rm_device *rdev)
+{
+	u32 index;
+
+	if ((rdev->sq.pidx - rdev->sq.cidx) >= rdev->queue_size)
+		return RM_INVALID_SLOT;
+
+	index = rdev->sq.pidx & (rdev->queue_size - 1);
+	return rdev->sq.offset + RM_CMD_SQ_SLOT_SIZE * index;
+}
+
+static inline u32 rm_queue_get_cq_slot_offset(struct rm_device *rdev)
+{
+	u32 index;
+
+	index = rdev->cq.cidx & (rdev->queue_size - 1);
+	return rdev->cq.offset + RM_CMD_CQ_SLOT_SIZE * index;
+}
+
+static int rm_queue_submit_cmd(struct rm_cmd *cmd)
+{
+	struct versal_pci_device *vdev = cmd->rdev->vdev;
+	struct rm_device *rdev = cmd->rdev;
+	u32 offset;
+	int ret;
+
+	guard(mutex)(&rdev->queue);
+
+	offset = rm_queue_get_sq_slot_offset(rdev);
+	if (!offset) {
+		vdev_err(vdev, "No SQ slot available");
+		return -ENOSPC;
+	}
+
+	rm_queue_bulk_write(rdev, offset, (u32 *)&cmd->sq_msg,
+			    sizeof(cmd->sq_msg));
+
+	ret = rm_queue_set_pidx(rdev, RM_QUEUE_SQ, ++rdev->sq.pidx);
+	if (ret) {
+		vdev_err(vdev, "Failed to update PIDX, ret %d", ret);
+		return ret;
+	}
+
+	list_add_tail(&cmd->list, &rdev->submitted_cmds);
+	return ret;
+}
+
+void rm_queue_withdraw_cmd(struct rm_cmd *cmd)
+{
+	guard(mutex)(&cmd->rdev->queue);
+	list_del(&cmd->list);
+}
+
+static int rm_queue_wait_cmd_timeout(struct rm_cmd *cmd, unsigned long timeout)
+{
+	struct versal_pci_device *vdev = cmd->rdev->vdev;
+	int ret;
+
+	if (wait_for_completion_timeout(&cmd->executed, timeout)) {
+		ret = cmd->cq_msg.data.rcode;
+		if (!ret)
+			return 0;
+
+		vdev_err(vdev, "CMD returned with a failure: %d", ret);
+		return ret;
+	}
+
+	/*
+	 * each cmds will be cleaned up by complete before it times out.
+	 * if we reach here, the cmd should be cleared and hot reset should
+	 * be issued.
+	 */
+	vdev_err(vdev, "cmd timed out, please reset the card");
+	rm_queue_withdraw_cmd(cmd);
+	return -ETIME;
+}
+
+int rm_queue_send_cmd(struct rm_cmd *cmd, unsigned long timeout)
+{
+	int ret;
+
+	ret = rm_queue_submit_cmd(cmd);
+	if (ret)
+		return ret;
+
+	return rm_queue_wait_cmd_timeout(cmd, timeout);
+}
+
+static int rm_process_msg(struct rm_device *rdev)
+{
+	struct versal_pci_device *vdev = rdev->vdev;
+	struct rm_cmd *cmd, *next;
+	struct rm_cmd_cq_hdr header;
+	u32 offset;
+
+	offset = rm_queue_get_cq_slot_offset(rdev);
+	if (!offset) {
+		vdev_err(vdev, "Invalid CQ offset");
+		return -EINVAL;
+	}
+
+	rm_queue_bulk_read(rdev, offset, (u32 *)&header, sizeof(header));
+
+	list_for_each_entry_safe(cmd, next, &rdev->submitted_cmds, list) {
+		u32 value = 0;
+
+		if (cmd->sq_msg.hdr.id != header.id)
+			continue;
+
+		rm_queue_bulk_read(rdev, offset + sizeof(cmd->cq_msg.hdr),
+				   (u32 *)&cmd->cq_msg.data,
+				   sizeof(cmd->cq_msg.data));
+
+		rm_queue_write(rdev, offset, value);
+
+		list_del(&cmd->list);
+		complete(&cmd->executed);
+		return 0;
+	}
+
+	vdev_err(vdev, "Unknown cmd ID %d found in CQ", header.id);
+	return -EFAULT;
+}
+
+static void rm_check_msg(struct work_struct *w)
+{
+	struct rm_device *rdev = to_rdev_msg_monitor(w);
+	int ret;
+
+	guard(mutex)(&rdev->queue);
+
+	rdev->sq.cidx = rm_queue_get_cidx(rdev, RM_QUEUE_SQ);
+	rdev->cq.pidx = rm_queue_get_pidx(rdev, RM_QUEUE_CQ);
+
+	while (rdev->cq.cidx < rdev->cq.pidx) {
+		ret = rm_process_msg(rdev);
+		if (ret)
+			break;
+
+		rdev->cq.cidx++;
+
+		rm_queue_set_cidx(rdev, RM_QUEUE_CQ, rdev->cq.cidx);
+	}
+}
+
+static void rm_sched_work(struct timer_list *t)
+{
+	struct rm_device *rdev = to_rdev_msg_timer(t);
+
+	/* Schedule a work in the general workqueue */
+	schedule_work(&rdev->msg_monitor);
+	/* Periodic timer */
+	mod_timer(&rdev->msg_timer, jiffies + RM_COMPLETION_TIMER);
+}
+
+void rm_queue_fini(struct rm_device *rdev)
+{
+	timer_delete_sync(&rdev->msg_timer);
+	cancel_work_sync(&rdev->msg_monitor);
+}
+
+int rm_queue_init(struct rm_device *rdev)
+{
+	struct versal_pci_device *vdev = rdev->vdev;
+	struct rm_queue_header header = {0};
+	int ret;
+
+	INIT_LIST_HEAD(&rdev->submitted_cmds);
+	ret = devm_mutex_init(&vdev->pdev->dev, &rdev->queue);
+	if (ret)
+		return ret;
+
+	rm_queue_bulk_read(rdev, RM_HDR_OFF, (u32 *)&header, sizeof(header));
+
+	if (header.magic != RM_QUEUE_HDR_MAGIC_NUM) {
+		vdev_err(vdev, "Invalid RM queue header");
+		return -ENODEV;
+	}
+
+	if (!header.version) {
+		vdev_err(vdev, "Invalid RM queue header");
+		return -ENODEV;
+	}
+
+	sema_init(&rdev->sq.data_lock, 1);
+	sema_init(&rdev->cq.data_lock, 1);
+	rdev->queue_size = header.size;
+	rdev->sq.offset = header.sq_off;
+	rdev->cq.offset = header.cq_off;
+	rdev->sq.type = RM_QUEUE_SQ;
+	rdev->cq.type = RM_QUEUE_CQ;
+	rdev->sq.data_size = rdev->queue_buffer_size - RM_CMD_CQ_BUFFER_SIZE;
+	rdev->cq.data_size = RM_CMD_CQ_BUFFER_SIZE;
+	rdev->sq.data_offset = rdev->queue_buffer_start +
+			       RM_CMD_CQ_BUFFER_OFFSET + RM_CMD_CQ_BUFFER_SIZE;
+	rdev->cq.data_offset = rdev->queue_buffer_start +
+			       RM_CMD_CQ_BUFFER_OFFSET;
+	rdev->sq.cidx = header.sq_cidx;
+	rdev->cq.cidx = header.cq_cidx;
+
+	rdev->sq.pidx = rm_queue_get_pidx(rdev, RM_QUEUE_SQ);
+	rdev->cq.pidx = rm_queue_get_pidx(rdev, RM_QUEUE_CQ);
+
+	if (rdev->cq.cidx != rdev->cq.pidx) {
+		vdev_warn(vdev, "Clearing stale completions");
+		rdev->cq.cidx = rdev->cq.pidx;
+		rm_queue_set_cidx(rdev, RM_QUEUE_CQ, rdev->cq.cidx);
+	}
+
+	/* Create and schedule timer to do recurring work */
+	INIT_WORK(&rdev->msg_monitor, &rm_check_msg);
+	timer_setup(&rdev->msg_timer, &rm_sched_work, 0);
+	mod_timer(&rdev->msg_timer, jiffies + RM_COMPLETION_TIMER);
+
+	return 0;
+}
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-queue.h b/drivers/accel/amd_vpci/versal-pci-rm-queue.h
new file mode 100644
index 000000000000..d5d991704d5c
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-rm-queue.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __RM_QUEUE_H
+#define __RM_QUEUE_H
+
+struct rm_device;
+
+/* rm queue hardware setup */
+int rm_queue_init(struct rm_device *rdev);
+void rm_queue_fini(struct rm_device *rdev);
+
+/* rm queue common API */
+int rm_queue_send_cmd(struct rm_cmd *cmd, unsigned long timeout);
+void rm_queue_withdraw_cmd(struct rm_cmd *cmd);
+
+#endif	/* __RM_QUEUE_H */
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-service.h b/drivers/accel/amd_vpci/versal-pci-rm-service.h
new file mode 100644
index 000000000000..d2397a1a672c
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-rm-service.h
@@ -0,0 +1,209 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __RM_SERVICE_H
+#define __RM_SERVICE_H
+
+#define RM_HDR_OFF			0x0
+#define RM_HDR_MAGIC_NUM		0x564D5230
+#define RM_QUEUE_HDR_MAGIC_NUM		0x5847513F
+#define RM_PCI_IO_BAR_OFF		0x2010000
+#define RM_PCI_IO_SIZE			SZ_4K
+#define RM_PCI_SHMEM_BAR_OFF		0x8000000
+#define RM_PCI_SHMEM_SIZE		SZ_128M
+#define RM_PCI_SHMEM_HDR_SIZE		0x28
+
+#define RM_QUEUE_HDR_MAGIC_NUM_OFF	0x0
+#define RM_IO_SQ_PIDX_OFF		0x0
+#define RM_IO_CQ_PIDX_OFF		0x100
+
+#define RM_CMD_ID_MIN			1
+#define RM_CMD_ID_MAX			(BIT(17) - 1)
+#define RM_CMD_SQ_HDR_OPS_MSK		GENMASK(15, 0)
+#define RM_CMD_SQ_HDR_SIZE_MSK		GENMASK(14, 0)
+#define RM_CMD_SQ_SLOT_SIZE		SZ_512
+#define RM_CMD_CQ_SLOT_SIZE		SZ_16
+#define RM_CMD_CQ_BUFFER_SIZE		(1024 * 1024)
+#define RM_CMD_CQ_BUFFER_OFFSET		0x0
+#define RM_CMD_LOG_PAGE_TYPE_MASK	GENMASK(15, 0)
+#define RM_CMD_VMR_CONTROL_MSK		GENMASK(10, 8)
+#define RM_CMD_VMR_CONTROL_PS_MASK	BIT(9)
+
+#define RM_CMD_WAIT_CONFIG_TIMEOUT	msecs_to_jiffies(10 * 1000)
+#define RM_CMD_WAIT_DOWNLOAD_TIMEOUT	msecs_to_jiffies(300 * 1000)
+
+#define RM_COMPLETION_TIMER		(HZ / 10)
+#define RM_HEALTH_CHECK_TIMER		(HZ)
+
+#define RM_INVALID_SLOT			0
+
+enum rm_queue_opcode {
+	RM_QUEUE_OP_LOAD_XCLBIN		= 0x0,
+	RM_QUEUE_OP_GET_LOG_PAGE	= 0x8,
+	RM_QUEUE_OP_LOAD_FW		= 0xA,
+	RM_QUEUE_OP_LOAD_APU_FW		= 0xD,
+	RM_QUEUE_OP_VMR_CONTROL		= 0xE,
+	RM_QUEUE_OP_IDENTIFY		= 0x202,
+};
+
+struct rm_cmd_sq_hdr {
+	__u16 opcode;
+	__u16 msg_size;
+	__u16 id;
+	__u16 reserved;
+} __packed;
+
+struct rm_cmd_cq_hdr {
+	__u16 id;
+	__u16 reserved;
+} __packed;
+
+struct rm_cmd_sq_bin {
+	__u64			address;
+	__u32			size;
+	__u32			reserved1;
+	__u32			reserved2;
+	__u32			reserved3;
+	__u64			reserved4;
+} __packed;
+
+struct rm_cmd_sq_log_page {
+	__u64			address;
+	__u32			size;
+	__u32			reserved1;
+	__u32			type;
+	__u32			reserved2;
+} __packed;
+
+struct rm_cmd_sq_ctrl {
+	__u32			status;
+} __packed;
+
+struct rm_cmd_sq_data {
+	union {
+		struct rm_cmd_sq_log_page	page;
+		struct rm_cmd_sq_bin		bin;
+		struct rm_cmd_sq_ctrl		ctrl;
+	};
+} __packed;
+
+struct rm_cmd_cq_identify {
+	__u16			major;
+	__u16			minor;
+	__u32			reserved;
+} __packed;
+
+struct rm_cmd_cq_log_page {
+	__u32			len;
+	__u32			reserved;
+} __packed;
+
+struct rm_cmd_cq_control {
+	__u16			status;
+	__u16			reserved1;
+	__u32			reserved2;
+} __packed;
+
+struct rm_cmd_cq_data {
+	union {
+		struct rm_cmd_cq_identify	identify;
+		struct rm_cmd_cq_log_page	page;
+		struct rm_cmd_cq_control	ctrl;
+		__u32				reserved[2];
+	};
+	__u32			rcode;
+} __packed;
+
+struct rm_cmd_sq_msg {
+	struct rm_cmd_sq_hdr	hdr;
+	struct rm_cmd_sq_data	data;
+} __packed;
+
+struct rm_cmd_cq_msg {
+	struct rm_cmd_cq_hdr	hdr;
+	struct rm_cmd_cq_data	data;
+} __packed;
+
+struct rm_cmd {
+	struct rm_device	*rdev;
+	struct list_head	list;
+	struct completion	executed;
+	struct rm_cmd_sq_msg	sq_msg;
+	struct rm_cmd_cq_msg	cq_msg;
+	enum rm_queue_opcode	opcode;
+	__u8			*buffer;
+	ssize_t			size;
+};
+
+enum rm_queue_type {
+	RM_QUEUE_SQ,
+	RM_QUEUE_CQ
+};
+
+enum rm_cmd_log_page_type {
+	RM_CMD_LOG_PAGE_AXI_TRIP_STATUS	= 0x0,
+	RM_CMD_LOG_PAGE_FW_ID		= 0xA,
+};
+
+struct rm_queue {
+	enum rm_queue_type	type;
+	__u32			pidx;
+	__u32			cidx;
+	__u32			offset;
+	__u32			data_offset;
+	__u32			data_size;
+	struct semaphore	data_lock;
+};
+
+struct rm_queue_header {
+	__u32			magic;
+	__u32			version;
+	__u32			size;
+	__u32			sq_off;
+	__u32			sq_slot_size;
+	__u32			cq_off;
+	__u32			sq_cidx;
+	__u32			cq_cidx;
+};
+
+struct rm_header {
+	__u32			magic;
+	__u32			queue_base;
+	__u32			queue_size;
+	__u32			status_off;
+	__u32			status_len;
+	__u32			log_index;
+	__u32			log_off;
+	__u32			log_size;
+	__u32			data_start;
+	__u32			data_end;
+};
+
+struct rm_device {
+	struct versal_pci_device	*vdev;
+
+	struct rm_header	rm_metadata;
+	__u32			queue_buffer_start;
+	__u32			queue_buffer_size;
+	__u32			queue_base;
+
+	/* Lock to queue access */
+	struct mutex		queue;
+	struct rm_queue		sq;
+	struct rm_queue		cq;
+	__u32			queue_size;
+
+	struct timer_list	msg_timer;
+	struct work_struct	msg_monitor;
+	struct timer_list	health_timer;
+	struct work_struct	health_monitor;
+	struct list_head	submitted_cmds;
+
+	__u32			firewall_tripped;
+};
+
+#endif	/* __RM_SERVICE_H */
diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
index ca309aee87ad..33f0ef881a33 100644
--- a/drivers/accel/amd_vpci/versal-pci.h
+++ b/drivers/accel/amd_vpci/versal-pci.h
@@ -26,6 +26,7 @@
 	dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
 
 struct versal_pci_device;
+struct rm_cmd;
 
 struct axlf_header {
 	__u64				length;
-- 
2.34.1

