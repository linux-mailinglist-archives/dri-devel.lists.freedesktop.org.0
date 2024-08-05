Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90638948089
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1577F10E264;
	Mon,  5 Aug 2024 17:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wmVVMdcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B037B10E238
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxk5QuHhO15nwBee8nGBiVEub561e2sKWfFXJ5AphLnLpPUGfa0g3ySFjBI1Lf5n8kntcA8WANG+1m/Twdo8yfAoDy+niBQ80vaIRmLggxC58s/VngsRcP5C/LbA0o3mqKgVlNn31gTOwfltVEzE+jnMsgTDBH807IPNbJrr9NaIM7JOYhg6hw8W1AuhEs0/mnLyuJucejYpEY02Lh8sxB7VFrlmzJkOPL3oyIDcFw2JOszy1R1BYwU4LjWvQySgI9IEsu4JgKaA++OSt6z2qfb9330uE9RngMnsnpNgpsFCuvyCXK+Njw8RTE+8RP4Aduz9O9GzX/9KpR977ssYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTAC4WlW8zEuQJqUTbC0s8XpCtP0BkZm49n3ZEm1nUs=;
 b=fEYx7Xkk3Rwwu6mvci4kjEqkY/4s0UYYKZ41AdHSFHzHkYG5SypM9bmQyH1blH8eRVuTrbq47ZIboAffdYsjMTxR1V07FXV0UB0YTXWpB6V3T1kXwuKXNr6CcU1+bvwr7Sq9zDAzys5Q4W+4d/Mwrdpjttfz7A/1ZL7avnVUCJ2Gdc7wollqhXTfVYqvJQ/kdIyPB51R89fkmxTyYo0aFIhYLzwpQPtmYaWxDVK7GqU4ZDtnkkswoUaDQSbPhOvvM23lxZx//U831QIpPnrlyiM/tHIz2kLC2LzmhDwzW66tFCFjSpRqgHh5A2pKEctBcnsijQpCfkyh1hrSruKbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTAC4WlW8zEuQJqUTbC0s8XpCtP0BkZm49n3ZEm1nUs=;
 b=wmVVMdcJKgTpCEJmkU5a4aoRJDloFm4xTlR13UjNYyqbKBQq0+6m3lm0fDNhd+CiyN2sfXgTU6AfWI1Gx2paNfaAo2LN2M15QWMyVUrDArOY3vCFj2kE2Nmm/1AgQmq9YnQPX2KPmFwjanDsnlJBLymJnqEoTToVVTvVZ//skzk=
Received: from CH0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:610:76::27)
 by MW4PR12MB6681.namprd12.prod.outlook.com (2603:10b6:303:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 5 Aug
 2024 17:40:25 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::f0) by CH0PR04CA0022.outlook.office365.com
 (2603:10b6:610:76::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 17:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 17:40:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 12:40:23 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 12:40:22 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, George Yang <George.Yang@amd.com>
Subject: [PATCH V2 02/10] accel/amdxdna: Support hardware mailbox
Date: Mon, 5 Aug 2024 10:39:51 -0700
Message-ID: <20240805173959.3181199-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805173959.3181199-1-lizhi.hou@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MW4PR12MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4cd6ef-548f-427d-43c1-08dcb575b03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Grh1Be+KbYlPZkDP60IKNXbJg8XfJjshxCJpeX5PEsMhAHrHS/hgfa8uic0M?=
 =?us-ascii?Q?iBcOKS7fnxH2J2YAXZku/xmG08bKqo+5SKCENBs9doUoUCMvBSXjqsci0kka?=
 =?us-ascii?Q?SZPZ1FKOz2+FLyr4FILhwAetuJOoN4vtPkkvxgnjV0/PX3DcNyLCtwPDdBOD?=
 =?us-ascii?Q?tbQFlBncEYu7vWL8cF4H/IDeAei1CELJULIebF5NNs3Im2lJGEL2H+bQdZnx?=
 =?us-ascii?Q?RUMs7/qgcprmj0hhbBHElZJspPZYA/+rkkyW8ZkARGDenfCyb0nI6NWxBlCF?=
 =?us-ascii?Q?/aE7e35auMAbTgVf0EvdNNZiGPnZL5NDjJxksBySGIsg+u3l66gGZKgxp5UF?=
 =?us-ascii?Q?CRGkoItj72L1ZO3TeS4tUQDNxof71ZZW+/0KFtLGgl30185eBiaSRnu9mfUb?=
 =?us-ascii?Q?7Do8j6R1f3T6OoOmm5VYg8Q+WRqtlmuebKGyKcGw78oDg+GB9hQKSmPlPc+h?=
 =?us-ascii?Q?bZfnOCgerW3OMudHk13hvoQBWXAqe4BdG8TdtD3/cpHWy4JD+f66jSes2vnB?=
 =?us-ascii?Q?o6MN6bF85IdYrCQ2t4Ne7dkiIiazsuoRqWGWTRINinU0TJxERvn2WLAAJ5fE?=
 =?us-ascii?Q?VP2OF8kr7B/zPaqvIUgnS/dkyr5hVbIiwdklviEVsI+m9ztqJlTaPH+cRT8q?=
 =?us-ascii?Q?SI0Al3KV0RIaxEcNzUF+/hQHYtG0T2wQTaGHOtnTPEQp+AQ1+zdkEX8GRnIB?=
 =?us-ascii?Q?qm8nmYbzHmsZ0FINTluCn7H8CVF0otRT0lmF4eMCCjmw0HJvPo9FgpkP3tjg?=
 =?us-ascii?Q?O8cxjzL28lpuWPU743Os1bcRYQfgo4NoTaivx03EurFUSG81wPRm/SWw0FkL?=
 =?us-ascii?Q?kAiJNTeWqpbJNVWpvz6asmdDDBjhuphCA6I/AiT0PjjzW+zGExeUYlkBorz2?=
 =?us-ascii?Q?f8MJ4Snpc6yE333ucg2PNCJ11qYrpxwg4tBJzlaM/YON9dN4mcD9JkkwTuNP?=
 =?us-ascii?Q?JzVeyKnBdzR2vo1bp7kVqGlJtSuClh06Qzi3iquRTE1G5inYXEkYKI7vhQbj?=
 =?us-ascii?Q?VG8eLLYWSl/Z91Aef3MHepESc4T14Vtra2HXHKYgyJLgoZ01tZBHOwFsMRHg?=
 =?us-ascii?Q?mgIYVk29F4EV0S33z7bEjrJ6FpFvh68Eclbnfxx9Nfrb5GFLh8I//GCdPkOi?=
 =?us-ascii?Q?Vuj/LZw3PHo9ULmGAww7EPiYy43nrVoYbtVdmp9M6xjEXxMWiYu0jdZHj9Sa?=
 =?us-ascii?Q?gjGMnDo5Wko6KKsEq3wp5+hQ7Ifgr0DETfJzShka8e64FfKHewownKpKByOA?=
 =?us-ascii?Q?RAHSUngXNbOcRAkUd+FeM/NTRHgDH+TtTyj854+6OWWizoaMgNfihKEKeueo?=
 =?us-ascii?Q?AzB0sQYvIOiPELASW03kQH2d5P6UZlYFBb4ChGeaH/SaYnTWBZ2I5j09YZ7v?=
 =?us-ascii?Q?8PLfW0amHYhcq1XAiUU/F/UBKCjNhfCs8QoGv7Sqs4pALFU0QevVOTtDuoQF?=
 =?us-ascii?Q?4WlkJ/XeRIQcyLAUafzOD4FHtX8bc+WY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:40:25.1396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4cd6ef-548f-427d-43c1-08dcb575b03a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6681
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

The hardware mailboxes are used by the driver to submit requests to
firmware and receive the completion notices from hardware.

Initially, a management mailbox channel is up and running. The driver may
request firmware to create/destroy more channels dynamically through
management channel.

Add driver internal mailbox interfaces.
  - create/destroy a mailbox channel instance
  - send a message to the firmware through a specific channel
  - wait for a notification from the specific channel

Co-developed-by: George Yang <George.Yang@amd.com>
Signed-off-by: George Yang <George.Yang@amd.com>
Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 MAINTAINERS                                   |   1 +
 drivers/accel/amdxdna/Makefile                |   3 +
 drivers/accel/amdxdna/aie2_message.c          | 187 ++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++++++
 drivers/accel/amdxdna/aie2_pci.c              | 254 +++++++-
 drivers/accel/amdxdna/aie2_pci.h              |  59 ++
 drivers/accel/amdxdna/amdxdna_drm.h           |   8 +
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 ++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 ++++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 ++
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  11 +
 include/trace/events/amdxdna.h                |  60 ++
 13 files changed, 1753 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 include/trace/events/amdxdna.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d2b9f1f1a07..9ddcbb9945c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1152,6 +1152,7 @@ M:	Lizhi Hou <lizhi.hou@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/accel/amdxdna
+F:	include/trace/events/amdxdna.h
 F:	include/uapi/drm/amdxdna_accel.h
 
 AMD XGBE DRIVER
diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index eb3de5a144b5..c21e6856057f 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -1,10 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 amdxdna-y := \
+	aie2_message.o \
 	aie2_pci.o \
 	aie2_psp.o \
 	aie2_smu.o \
 	amdxdna_drm.o \
+	amdxdna_mailbox.o \
+	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
 	amdxdna_sysfs.o \
 	npu1_regs.o \
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
new file mode 100644
index 000000000000..71df005b7408
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include "aie2_msg_priv.h"
+#include "aie2_pci.h"
+#include "amdxdna_mailbox_helper.h"
+
+#define DECLARE_AIE2_MSG(name, op) \
+	DECLARE_XDNA_MSG_COMMON(name, op, MAX_AIE2_STATUS_CODE)
+
+static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
+				   struct xdna_mailbox_msg *msg)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+	struct xdna_notify *hdl = msg->handle;
+	int ret;
+
+	if (!ndev->mgmt_chann)
+		return -ENODEV;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
+	if (ret == -ETIME) {
+		xdna_mailbox_stop_channel(ndev->mgmt_chann);
+		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+		ndev->mgmt_chann = NULL;
+	}
+
+	if (!ret && *hdl->data != AIE2_STATUS_SUCCESS) {
+		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
+			 msg->opcode, *hdl->data);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
+{
+	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
+
+	return aie2_send_mgmt_msg_wait(ndev, &msg);
+}
+
+int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
+{
+	DECLARE_AIE2_MSG(suspend, MSG_OP_RESUME);
+
+	return aie2_send_mgmt_msg_wait(ndev, &msg);
+}
+
+int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value)
+{
+	DECLARE_AIE2_MSG(set_runtime_cfg, MSG_OP_SET_RUNTIME_CONFIG);
+
+	req.type = type;
+	req.value = value;
+
+	return aie2_send_mgmt_msg_wait(ndev, &msg);
+}
+
+int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value)
+{
+	DECLARE_AIE2_MSG(get_runtime_cfg, MSG_OP_GET_RUNTIME_CONFIG);
+	int ret;
+
+	req.type = type;
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Failed to get runtime config, ret %d", ret);
+		return ret;
+	}
+
+	*value = resp.value;
+	return 0;
+}
+
+int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev)
+{
+	DECLARE_AIE2_MSG(protocol_version, MSG_OP_GET_PROTOCOL_VERSION);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	int ret;
+
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to get protocol version, ret %d", ret);
+		return ret;
+	}
+
+	if (resp.major != ndev->priv->protocol_major) {
+		XDNA_ERR(xdna, "Incompatible firmware protocol version major %d minor %d",
+			 resp.major, resp.minor);
+		return -EINVAL;
+	}
+
+	if (resp.minor < ndev->priv->protocol_minor) {
+		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid)
+{
+	DECLARE_AIE2_MSG(assign_mgmt_pasid, MSG_OP_ASSIGN_MGMT_PASID);
+
+	req.pasid = pasid;
+
+	return aie2_send_mgmt_msg_wait(ndev, &msg);
+}
+
+int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct aie_version *version)
+{
+	DECLARE_AIE2_MSG(aie_version_info, MSG_OP_QUERY_AIE_VERSION);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	int ret;
+
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret)
+		return ret;
+
+	XDNA_DBG(xdna, "Query AIE version - major: %u minor: %u completed",
+		 resp.major, resp.minor);
+
+	version->major = resp.major;
+	version->minor = resp.minor;
+
+	return 0;
+}
+
+int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_metadata *metadata)
+{
+	DECLARE_AIE2_MSG(aie_tile_info, MSG_OP_QUERY_AIE_TILE_INFO);
+	int ret;
+
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret)
+		return ret;
+
+	metadata->size = resp.info.size;
+	metadata->cols = resp.info.cols;
+	metadata->rows = resp.info.rows;
+
+	metadata->version.major = resp.info.major;
+	metadata->version.minor = resp.info.minor;
+
+	metadata->core.row_count = resp.info.core_rows;
+	metadata->core.row_start = resp.info.core_row_start;
+	metadata->core.dma_channel_count = resp.info.core_dma_channels;
+	metadata->core.lock_count = resp.info.core_locks;
+	metadata->core.event_reg_count = resp.info.core_events;
+
+	metadata->mem.row_count = resp.info.mem_rows;
+	metadata->mem.row_start = resp.info.mem_row_start;
+	metadata->mem.dma_channel_count = resp.info.mem_dma_channels;
+	metadata->mem.lock_count = resp.info.mem_locks;
+	metadata->mem.event_reg_count = resp.info.mem_events;
+
+	metadata->shim.row_count = resp.info.shim_rows;
+	metadata->shim.row_start = resp.info.shim_row_start;
+	metadata->shim.dma_channel_count = resp.info.shim_dma_channels;
+	metadata->shim.lock_count = resp.info.shim_locks;
+	metadata->shim.event_reg_count = resp.info.shim_events;
+
+	return 0;
+}
+
+int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
+				struct amdxdna_fw_ver *fw_ver)
+{
+	DECLARE_AIE2_MSG(firmware_version, MSG_OP_GET_FIRMWARE_VERSION);
+	int ret;
+
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret)
+		return ret;
+
+	fw_ver->major = resp.major;
+	fw_ver->minor = resp.minor;
+	fw_ver->sub = resp.sub;
+	fw_ver->build = resp.build;
+
+	return 0;
+}
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
new file mode 100644
index 000000000000..d9d88f1e0fe1
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -0,0 +1,372 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_MSG_PRIV_H_
+#define _AIE2_MSG_PRIV_H_
+
+#include <linux/uuid.h>
+
+enum aie2_msg_opcode {
+	MSG_OP_CREATE_CONTEXT              = 0x2,
+	MSG_OP_DESTROY_CONTEXT             = 0x3,
+	MSG_OP_SYNC_BO			   = 0x7,
+	MSG_OP_EXECUTE_BUFFER_CF           = 0xC,
+	MSG_OP_QUERY_COL_STATUS            = 0xD,
+	MSG_OP_QUERY_AIE_TILE_INFO         = 0xE,
+	MSG_OP_QUERY_AIE_VERSION           = 0xF,
+	MSG_OP_EXEC_DPU                    = 0x10,
+	MSG_OP_CONFIG_CU                   = 0x11,
+	MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
+	MSG_OP_CHAIN_EXEC_DPU              = 0x13,
+	MSG_OP_MAX_XRT_OPCODE,
+	MSG_OP_SUSPEND                     = 0x101,
+	MSG_OP_RESUME                      = 0x102,
+	MSG_OP_ASSIGN_MGMT_PASID           = 0x103,
+	MSG_OP_INVOKE_SELF_TEST            = 0x104,
+	MSG_OP_MAP_HOST_BUFFER             = 0x106,
+	MSG_OP_GET_FIRMWARE_VERSION        = 0x108,
+	MSG_OP_SET_RUNTIME_CONFIG          = 0x10A,
+	MSG_OP_GET_RUNTIME_CONFIG          = 0x10B,
+	MSG_OP_REGISTER_ASYNC_EVENT_MSG    = 0x10C,
+	MSG_OP_MAX_DRV_OPCODE,
+	MSG_OP_GET_PROTOCOL_VERSION        = 0x301,
+	MSG_OP_MAX_OPCODE
+};
+
+enum aie2_msg_status {
+	AIE2_STATUS_SUCCESS				= 0x0,
+	/* AIE Error codes */
+	AIE2_STATUS_AIE_SATURATION_ERROR		= 0x1000001,
+	AIE2_STATUS_AIE_FP_ERROR			= 0x1000002,
+	AIE2_STATUS_AIE_STREAM_ERROR			= 0x1000003,
+	AIE2_STATUS_AIE_ACCESS_ERROR			= 0x1000004,
+	AIE2_STATUS_AIE_BUS_ERROR			= 0x1000005,
+	AIE2_STATUS_AIE_INSTRUCTION_ERROR		= 0x1000006,
+	AIE2_STATUS_AIE_ECC_ERROR			= 0x1000007,
+	AIE2_STATUS_AIE_LOCK_ERROR			= 0x1000008,
+	AIE2_STATUS_AIE_DMA_ERROR			= 0x1000009,
+	AIE2_STATUS_AIE_MEM_PARITY_ERROR		= 0x100000a,
+	AIE2_STATUS_AIE_PWR_CFG_ERROR			= 0x100000b,
+	AIE2_STATUS_AIE_BACKTRACK_ERROR			= 0x100000c,
+	AIE2_STATUS_MAX_AIE_STATUS_CODE,
+	/* MGMT ERT Error codes */
+	AIE2_STATUS_MGMT_ERT_SELF_TEST_FAILURE		= 0x2000001,
+	AIE2_STATUS_MGMT_ERT_HASH_MISMATCH,
+	AIE2_STATUS_MGMT_ERT_NOAVAIL,
+	AIE2_STATUS_MGMT_ERT_INVALID_PARAM,
+	AIE2_STATUS_MGMT_ERT_ENTER_SUSPEND_FAILURE,
+	AIE2_STATUS_MGMT_ERT_BUSY,
+	AIE2_STATUS_MGMT_ERT_APPLICATION_ACTIVE,
+	MAX_MGMT_ERT_STATUS_CODE,
+	/* APP ERT Error codes */
+	AIE2_STATUS_APP_ERT_FIRST_ERROR			= 0x3000001,
+	AIE2_STATUS_APP_INVALID_INSTR,
+	AIE2_STATUS_APP_LOAD_PDI_FAIL,
+	MAX_APP_ERT_STATUS_CODE,
+	/* NPU RTOS Error Codes */
+	AIE2_STATUS_INVALID_INPUT_BUFFER		= 0x4000001,
+	AIE2_STATUS_INVALID_COMMAND,
+	AIE2_STATUS_INVALID_PARAM,
+	AIE2_STATUS_INVALID_OPERATION                    = 0x4000006,
+	AIE2_STATUS_ASYNC_EVENT_MSGS_FULL,
+	AIE2_STATUS_MAX_RTOS_STATUS_CODE,
+	MAX_AIE2_STATUS_CODE
+};
+
+struct assign_mgmt_pasid_req {
+	u16	pasid;
+	u16	reserved;
+} __packed;
+
+struct assign_mgmt_pasid_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct map_host_buffer_req {
+	u32		context_id;
+	u64		buf_addr;
+	u64		buf_size;
+} __packed;
+
+struct map_host_buffer_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+#define MAX_CQ_PAIRS		2
+struct cq_info {
+	u32 head_addr;
+	u32 tail_addr;
+	u32 buf_addr;
+	u32 buf_size;
+};
+
+struct cq_pair {
+	struct cq_info x2i_q;
+	struct cq_info i2x_q;
+};
+
+struct create_ctx_req {
+	u32	aie_type;
+	u8	start_col;
+	u8	num_col;
+	u16	reserved;
+	u8	num_cq_pairs_requested;
+	u8	reserved1;
+	u16	pasid;
+	u32	pad[2];
+	u32	sec_comm_target_type;
+	u32     context_priority;
+} __packed;
+
+struct create_ctx_resp {
+	enum aie2_msg_status	status;
+	u32			context_id;
+	u16			msix_id;
+	u8			num_cq_pairs_allocated;
+	u8			reserved;
+	struct cq_pair		cq_pair[MAX_CQ_PAIRS];
+} __packed;
+
+struct destroy_ctx_req {
+	u32	context_id;
+} __packed;
+
+struct destroy_ctx_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct execute_buffer_req {
+	u32	cu_idx;
+	u32	payload[19];
+} __packed;
+
+struct exec_dpu_req {
+	u64	inst_buf_addr;
+	u32     inst_size;
+	u32     inst_prop_cnt;
+	u32     cu_idx;
+	u32	payload[35];
+} __packed;
+
+struct execute_buffer_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct aie_tile_info {
+	u32		size;
+	u16		major;
+	u16		minor;
+	u16		cols;
+	u16		rows;
+	u16		core_rows;
+	u16		mem_rows;
+	u16		shim_rows;
+	u16		core_row_start;
+	u16		mem_row_start;
+	u16		shim_row_start;
+	u16		core_dma_channels;
+	u16		mem_dma_channels;
+	u16		shim_dma_channels;
+	u16		core_locks;
+	u16		mem_locks;
+	u16		shim_locks;
+	u16		core_events;
+	u16		mem_events;
+	u16		shim_events;
+	u16		reserved;
+};
+
+struct aie_tile_info_req {
+	u32	reserved;
+} __packed;
+
+struct aie_tile_info_resp {
+	enum aie2_msg_status	status;
+	struct aie_tile_info	info;
+} __packed;
+
+struct aie_version_info_req {
+	u32		reserved;
+} __packed;
+
+struct aie_version_info_resp {
+	enum aie2_msg_status	status;
+	u16			major;
+	u16			minor;
+} __packed;
+
+struct aie_column_info_req {
+	u64 dump_buff_addr;
+	u32 dump_buff_size;
+	u32 num_cols;
+	u32 aie_bitmap;
+} __packed;
+
+struct aie_column_info_resp {
+	enum aie2_msg_status	status;
+	u32 size;
+} __packed;
+
+struct suspend_req {
+	u32		place_holder;
+} __packed;
+
+struct suspend_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct resume_req {
+	u32		place_holder;
+} __packed;
+
+struct resume_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct check_header_hash_req {
+	u64		hash_high;
+	u64		hash_low;
+} __packed;
+
+struct check_header_hash_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct query_error_req {
+	u64		buf_addr;
+	u32		buf_size;
+	u32		next_row;
+	u32		next_column;
+	u32		next_module;
+} __packed;
+
+struct query_error_resp {
+	enum aie2_msg_status	status;
+	u32			num_err;
+	u32			has_next_err;
+	u32			next_row;
+	u32			next_column;
+	u32			next_module;
+} __packed;
+
+struct protocol_version_req {
+	u32		reserved;
+} __packed;
+
+struct protocol_version_resp {
+	enum aie2_msg_status	status;
+	u32			major;
+	u32			minor;
+} __packed;
+
+struct firmware_version_req {
+	u32		reserved;
+} __packed;
+
+struct firmware_version_resp {
+	enum aie2_msg_status	status;
+	u32			major;
+	u32			minor;
+	u32			sub;
+	u32			build;
+} __packed;
+
+#define MAX_NUM_CUS			32
+#define AIE2_MSG_CFG_CU_PDI_ADDR	GENMASK(16, 0)
+#define AIE2_MSG_CFG_CU_FUNC		GENMASK(24, 17)
+struct config_cu_req {
+	u32	num_cus;
+	u32	cfgs[MAX_NUM_CUS];
+} __packed;
+
+struct config_cu_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct set_runtime_cfg_req {
+	u32	type;
+	u64	value;
+} __packed;
+
+struct set_runtime_cfg_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct get_runtime_cfg_req {
+	u32	type;
+} __packed;
+
+struct get_runtime_cfg_resp {
+	enum aie2_msg_status	status;
+	u64			value;
+} __packed;
+
+enum async_event_type {
+	ASYNC_EVENT_TYPE_AIE_ERROR,
+	ASYNC_EVENT_TYPE_EXCEPTION,
+	MAX_ASYNC_EVENT_TYPE
+};
+
+#define ASYNC_BUF_SIZE 0x2000
+struct async_event_msg_req {
+	u64 buf_addr;
+	u32 buf_size;
+} __packed;
+
+struct async_event_msg_resp {
+	enum aie2_msg_status	status;
+	enum async_event_type	type;
+} __packed;
+
+#define MAX_CHAIN_CMDBUF_SIZE 0x1000
+#define slot_cf_has_space(offset, payload_size) \
+	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
+	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))
+struct cmd_chain_slot_execbuf_cf {
+	u32 cu_idx;
+	u32 arg_cnt;
+	u32 args[] __counted_by(arg_cnt);
+};
+
+#define slot_dpu_has_space(offset, payload_size) \
+	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
+	 offsetof(struct cmd_chain_slot_dpu, args[0]))
+struct cmd_chain_slot_dpu {
+	u64 inst_buf_addr;
+	u32 inst_size;
+	u32 inst_prop_cnt;
+	u32 cu_idx;
+	u32 arg_cnt;
+#define MAX_DPU_ARGS_SIZE (34 * sizeof(u32))
+	u32 args[] __counted_by(arg_cnt);
+};
+
+struct cmd_chain_req {
+	u64 buf_addr;
+	u32 buf_size;
+	u32 count;
+} __packed;
+
+struct cmd_chain_resp {
+	enum aie2_msg_status	status;
+	u32			fail_cmd_idx;
+	enum aie2_msg_status	fail_cmd_status;
+} __packed;
+
+#define AIE2_MSG_SYNC_BO_SRC_TYPE	GENMASK(3, 0)
+#define AIE2_MSG_SYNC_BO_DST_TYPE	GENMASK(7, 4)
+struct sync_bo_req {
+	u64 src_addr;
+	u64 dst_addr;
+	u32 size;
+#define SYNC_BO_DEV_MEM  0
+#define SYNC_BO_HOST_MEM 2
+	u32 type;
+} __packed;
+
+struct sync_bo_resp {
+	enum aie2_msg_status	status;
+} __packed;
+#endif /* _AIE2_MSG_PRIV_H_ */
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 3660967c00e6..03ff3f496279 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -8,13 +8,205 @@
 #include <linux/firmware.h>
 #include <linux/iommu.h>
 
+#include "aie2_msg_priv.h"
 #include "aie2_pci.h"
 
+/*
+ * The management mailbox channel is allocated by firmware.
+ * The related register and ring buffer information is on SRAM BAR.
+ * This struct is the register layout.
+ */
+struct mgmt_mbox_chann_info {
+	u32	x2i_tail;
+	u32	x2i_head;
+	u32	x2i_buf;
+	u32	x2i_buf_sz;
+	u32	i2x_tail;
+	u32	i2x_head;
+	u32	i2x_buf;
+	u32	i2x_buf_sz;
+};
+
+static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+
+	XDNA_DBG(xdna, "i2x tail    0x%x", ndev->mgmt_i2x.mb_tail_ptr_reg);
+	XDNA_DBG(xdna, "i2x head    0x%x", ndev->mgmt_i2x.mb_head_ptr_reg);
+	XDNA_DBG(xdna, "i2x ringbuf 0x%x", ndev->mgmt_i2x.rb_start_addr);
+	XDNA_DBG(xdna, "i2x rsize   0x%x", ndev->mgmt_i2x.rb_size);
+	XDNA_DBG(xdna, "x2i tail    0x%x", ndev->mgmt_x2i.mb_tail_ptr_reg);
+	XDNA_DBG(xdna, "x2i head    0x%x", ndev->mgmt_x2i.mb_head_ptr_reg);
+	XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
+	XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
+	XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
+}
+
+static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
+{
+	struct mgmt_mbox_chann_info info_regs;
+	struct xdna_mailbox_chann_res *i2x;
+	struct xdna_mailbox_chann_res *x2i;
+	u32 addr, off;
+	u32 *reg;
+	int ret;
+	int i;
+
+	/*
+	 * Once firmware is alive, it will write management channel
+	 * information in SRAM BAR and write the address of that information
+	 * at FW_ALIVE_OFF offset in SRMA BAR.
+	 *
+	 * Read a non-zero value from FW_ALIVE_OFF implies that firmware
+	 * is alive.
+	 */
+	ret = readx_poll_timeout(readl, SRAM_GET_ADDR(ndev, FW_ALIVE_OFF),
+				 addr, addr, AIE2_INTERVAL, AIE2_TIMEOUT);
+	if (ret || !addr)
+		return -ETIME;
+
+	off = AIE2_SRAM_OFF(ndev, addr);
+	reg = (u32 *)&info_regs;
+	for (i = 0; i < sizeof(info_regs) / sizeof(u32); i++)
+		reg[i] = readl(ndev->sram_base + off + i * sizeof(u32));
+
+	i2x = &ndev->mgmt_i2x;
+	x2i = &ndev->mgmt_x2i;
+
+	i2x->mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.i2x_head);
+	i2x->mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.i2x_tail);
+	i2x->rb_start_addr   = AIE2_SRAM_OFF(ndev, info_regs.i2x_buf);
+	i2x->rb_size         = info_regs.i2x_buf_sz;
+
+	x2i->mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.x2i_head);
+	x2i->mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.x2i_tail);
+	x2i->rb_start_addr   = AIE2_SRAM_OFF(ndev, info_regs.x2i_buf);
+	x2i->rb_size         = info_regs.x2i_buf_sz;
+	ndev->mgmt_chan_idx  = CHANN_INDEX(ndev, x2i->rb_start_addr);
+
+	aie2_dump_chann_info_debug(ndev);
+
+	/* Must clear address at FW_ALIVE_OFF */
+	writel(0, SRAM_GET_ADDR(ndev, FW_ALIVE_OFF));
+
+	return 0;
+}
+
+static int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev)
+{
+	const struct rt_config *cfg = &ndev->priv->rt_config;
+	u64 value;
+	int ret;
+
+	ret = aie2_set_runtime_cfg(ndev, cfg->type, cfg->value);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Set runtime type %d value %d failed",
+			 cfg->type, cfg->value);
+		return ret;
+	}
+
+	ret = aie2_get_runtime_cfg(ndev, cfg->type, &value);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Get runtime cfg failed");
+		return ret;
+	}
+
+	if (value != cfg->value)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int aie2_xdna_reset(struct amdxdna_dev_hdl *ndev)
+{
+	int ret;
+
+	ret = aie2_suspend_fw(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Suspend firmware failed");
+		return ret;
+	}
+
+	ret = aie2_resume_fw(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Resume firmware failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
+{
+	int ret;
+
+	ret = aie2_check_protocol_version(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Check header hash failed");
+		return ret;
+	}
+
+	ret = aie2_runtime_cfg(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Runtime config failed");
+		return ret;
+	}
+
+	ret = aie2_assign_mgmt_pasid(ndev, 0);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Can not assign PASID");
+		return ret;
+	}
+
+	ret = aie2_xdna_reset(ndev);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Reset firmware failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aie2_mgmt_fw_query(struct amdxdna_dev_hdl *ndev)
+{
+	int ret;
+
+	ret = aie2_query_firmware_version(ndev, &ndev->xdna->fw_ver);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "query firmware version failed");
+		return ret;
+	}
+
+	ret = aie2_query_aie_version(ndev, &ndev->version);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Query AIE version failed");
+		return ret;
+	}
+
+	ret = aie2_query_aie_metadata(ndev, &ndev->metadata);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Query AIE metadata failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void aie2_mgmt_fw_fini(struct amdxdna_dev_hdl *ndev)
+{
+	if (aie2_suspend_fw(ndev))
+		XDNA_ERR(ndev->xdna, "Suspend_fw failed");
+	XDNA_DBG(ndev->xdna, "Firmware suspended");
+}
+
 static void aie2_hw_stop(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
 
+	aie2_mgmt_fw_fini(ndev);
+	xdna_mailbox_stop_channel(ndev->mgmt_chann);
+	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
 	aie2_psp_stop(ndev->psp_hdl);
 	aie2_smu_fini(ndev);
 	pci_clear_master(pdev);
@@ -25,7 +217,9 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
-	int ret;
+	struct xdna_mailbox_res mbox_res;
+	u32 xdna_mailbox_intr_reg;
+	int mgmt_mb_irq, ret;
 
 	ret = pci_enable_device(pdev);
 	if (ret) {
@@ -46,8 +240,56 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto fini_smu;
 	}
 
+	ret = aie2_get_mgmt_chann_info(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "firmware is not alive");
+		goto stop_psp;
+	}
+
+	mbox_res.ringbuf_base = (u64)ndev->sram_base;
+	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
+	mbox_res.mbox_base = (u64)ndev->mbox_base;
+	mbox_res.mbox_size = MBOX_SIZE(ndev);
+	mbox_res.name = "xdna_mailbox";
+	ndev->mbox = xdnam_mailbox_create(&pdev->dev, &mbox_res);
+	if (!ndev->mbox) {
+		XDNA_ERR(xdna, "failed to create mailbox device");
+		ret = -ENODEV;
+		goto stop_psp;
+	}
+
+	mgmt_mb_irq = pci_irq_vector(pdev, ndev->mgmt_chan_idx);
+	if (mgmt_mb_irq < 0) {
+		ret = mgmt_mb_irq;
+		XDNA_ERR(xdna, "failed to alloc irq vector, ret %d", ret);
+		goto stop_psp;
+	}
+
+	xdna_mailbox_intr_reg = ndev->mgmt_i2x.mb_head_ptr_reg + 4;
+	ndev->mgmt_chann = xdna_mailbox_create_channel(ndev->mbox,
+						       &ndev->mgmt_x2i,
+						       &ndev->mgmt_i2x,
+						       xdna_mailbox_intr_reg,
+						       mgmt_mb_irq);
+	if (!ndev->mgmt_chann) {
+		XDNA_ERR(xdna, "failed to create management mailbox channel");
+		ret = -EINVAL;
+		goto stop_psp;
+	}
+
+	ret = aie2_mgmt_fw_init(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
+		goto destroy_mgmt_chann;
+	}
+
 	return 0;
 
+destroy_mgmt_chann:
+	xdna_mailbox_stop_channel(ndev->mgmt_chann);
+	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+stop_psp:
+	aie2_psp_stop(ndev->psp_hdl);
 fini_smu:
 	aie2_smu_fini(ndev);
 disable_dev:
@@ -110,6 +352,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	}
 	ndev->sram_base = tbl[xdna->dev_info->sram_bar];
 	ndev->smu_base = tbl[xdna->dev_info->smu_bar];
+	ndev->mbox_base = tbl[xdna->dev_info->mbox_bar];
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret) {
@@ -154,9 +397,18 @@ static int aie2_init(struct amdxdna_dev *xdna)
 		goto disable_sva;
 	}
 
+	ret = aie2_mgmt_fw_query(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "Query firmware failed, ret %d", ret);
+		goto stop_hw;
+	}
+	ndev->total_col = ndev->metadata.cols;
+
 	release_firmware(fw);
 	return 0;
 
+stop_hw:
+	aie2_hw_stop(xdna);
 disable_sva:
 	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
 free_irq:
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 984bf65b7a2b..a6b734f24955 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 
 #include "amdxdna_pci_drv.h"
+#include "amdxdna_mailbox.h"
 
 #define AIE2_INTERVAL	20000	/* us */
 #define AIE2_TIMEOUT	1000000	/* us */
@@ -45,6 +46,17 @@
 	((_ndev)->sram_base + SRAM_REG_OFF((_ndev), (idx))); \
 })
 
+#define CHAN_SLOT_SZ 0x2000
+#define CHANN_INDEX(ndev, rbuf_off) \
+	(((rbuf_off) - SRAM_REG_OFF((ndev), MBOX_CHANN_OFF)) / CHAN_SLOT_SZ)
+
+#define MBOX_SIZE(ndev) \
+({ \
+	typeof(ndev) _ndev = (ndev); \
+	((_ndev)->priv->mbox_size) ? (_ndev)->priv->mbox_size : \
+	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
+})
+
 #define SMU_MPNPUCLK_FREQ_MAX(ndev) \
 	((ndev)->priv->smu_mpnpuclk_freq_max)
 #define SMU_HCLK_FREQ_MAX(ndev) \
@@ -83,6 +95,29 @@ struct psp_config {
 	void __iomem	*psp_regs[PSP_MAX_REGS];
 };
 
+struct aie_version {
+	u16 major;
+	u16 minor;
+};
+
+struct aie_tile_metadata {
+	u16 row_count;
+	u16 row_start;
+	u16 dma_channel_count;
+	u16 lock_count;
+	u16 event_reg_count;
+};
+
+struct aie_metadata {
+	u32 size;
+	u16 cols;
+	u16 rows;
+	struct aie_version version;
+	struct aie_tile_metadata core;
+	struct aie_tile_metadata mem;
+	struct aie_tile_metadata shim;
+};
+
 struct clock_entry {
 	char name[16];
 	u32 freq_mhz;
@@ -98,9 +133,22 @@ struct amdxdna_dev_hdl {
 	const struct amdxdna_dev_priv	*priv;
 	void			__iomem *sram_base;
 	void			__iomem *smu_base;
+	void			__iomem *mbox_base;
 	struct psp_device		*psp_hdl;
+
+	struct xdna_mailbox_chann_res	mgmt_x2i;
+	struct xdna_mailbox_chann_res	mgmt_i2x;
+	u32				mgmt_chan_idx;
+
+	u32				total_col;
+	struct aie_version		version;
+	struct aie_metadata		metadata;
 	struct clock_entry		mp_npu_clock;
 	struct clock_entry		h_clock;
+
+	/* Mailbox and the management channel */
+	struct mailbox			*mbox;
+	struct mailbox_channel		*mgmt_chann;
 };
 
 #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
@@ -141,4 +189,15 @@ struct psp_device *aie2m_psp_create(struct device *dev, struct psp_config *conf)
 int aie2_psp_start(struct psp_device *psp);
 void aie2_psp_stop(struct psp_device *psp);
 
+/* aie2_message.c */
+int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
+int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
+int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value);
+int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value);
+int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev);
+int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid);
+int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct aie_version *version);
+int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_metadata *metadata);
+int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
+				struct amdxdna_fw_ver *fw_ver);
 #endif /* _AIE2_PCI_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
index 2b18bcbdc23e..8a31bf552796 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.h
+++ b/drivers/accel/amdxdna/amdxdna_drm.h
@@ -54,12 +54,20 @@ struct amdxdna_dev_info {
 	const struct amdxdna_dev_ops	*ops;
 };
 
+struct amdxdna_fw_ver {
+	u32 major;
+	u32 minor;
+	u32 sub;
+	u32 build;
+};
+
 struct amdxdna_dev {
 	struct drm_device		ddev;
 	struct amdxdna_dev_hdl		*dev_handle;
 	const struct amdxdna_dev_info	*dev_info;
 
 	struct mutex			dev_lock; /* per device lock */
+	struct amdxdna_fw_ver		fw_ver;
 };
 
 #endif /* _AMDXDNA_DRM_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
new file mode 100644
index 000000000000..0805fd9659ab
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -0,0 +1,582 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/iopoll.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/amdxdna.h>
+
+#include "amdxdna_mailbox.h"
+
+#define MB_ERR(chann, fmt, args...) \
+({ \
+	typeof(chann) _chann = chann; \
+	dev_err((_chann)->mb->dev, "xdna_mailbox.%d: "fmt, \
+		(_chann)->msix_irq, ##args); \
+})
+#define MB_DBG(chann, fmt, args...) \
+({ \
+	typeof(chann) _chann = chann; \
+	dev_dbg((_chann)->mb->dev, "xdna_mailbox.%d: "fmt, \
+		(_chann)->msix_irq, ##args); \
+})
+#define MB_WARN_ONCE(chann, fmt, args...) \
+({ \
+	typeof(chann) _chann = chann; \
+	dev_warn_once((_chann)->mb->dev, "xdna_mailbox.%d: "fmt, \
+		      (_chann)->msix_irq, ##args); \
+})
+
+#define MAGIC_VAL			0x1D000000U
+#define MAGIC_VAL_MASK			0xFF000000
+#define MAX_MSG_ID_ENTRIES		256
+#define MSG_RX_TIMER			200 /* milliseconds */
+#define MAILBOX_NAME			"xdna_mailbox"
+
+enum channel_res_type {
+	CHAN_RES_X2I,
+	CHAN_RES_I2X,
+	CHAN_RES_NUM
+};
+
+struct mailbox {
+	struct device		*dev;
+	struct xdna_mailbox_res	res;
+};
+
+struct mailbox_channel {
+	struct mailbox			*mb;
+	struct xdna_mailbox_chann_res	res[CHAN_RES_NUM];
+	int				msix_irq;
+	u32				iohub_int_addr;
+	struct idr			chan_idr;
+	spinlock_t			chan_idr_lock; /* protect chan_idr */
+	u32				x2i_tail;
+
+	/* Received msg related fields */
+	struct workqueue_struct		*work_q;
+	struct work_struct		rx_work;
+	u32				i2x_head;
+	bool				bad_state;
+};
+
+struct xdna_msg_header {
+	u32 total_size;
+	u32 size		: 11;
+	u32 rsvd0		: 5;
+	u32 protocol_version	: 8;
+	u32 rsvd1		: 8;
+	u32 id;
+	u32 opcode;
+} __packed;
+
+static_assert(sizeof(struct xdna_msg_header) == 16);
+
+struct mailbox_pkg {
+	struct xdna_msg_header	header;
+	u32			payload[];
+};
+
+/* The protocol version. */
+#define MSG_PROTOCOL_VERSION	0x1
+/* The tombstone value. */
+#define TOMBSTONE		0xDEADFACE
+
+struct mailbox_msg {
+	void			*handle;
+	int			(*notify_cb)(void *handle, const u32 *data, size_t size);
+	size_t			pkg_size; /* package size in bytes */
+	struct mailbox_pkg	pkg;
+};
+
+static void mailbox_reg_write(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 data)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+
+	iowrite32(data, (void *)ringbuf_addr);
+}
+
+static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+
+	return ioread32((void *)ringbuf_addr);
+}
+
+static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+	int ret, value;
+
+	/* Poll till value is not zero */
+	ret = readx_poll_timeout(ioread32, (void *)ringbuf_addr, value,
+				 value, 1 /* us */, 100);
+	if (ret < 0)
+		return ret;
+
+	*val = value;
+	return 0;
+}
+
+static inline void
+mailbox_set_headptr(struct mailbox_channel *mb_chann, u32 headptr_val)
+{
+	mailbox_reg_write(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_head_ptr_reg, headptr_val);
+	mb_chann->i2x_head = headptr_val;
+}
+
+static inline void
+mailbox_set_tailptr(struct mailbox_channel *mb_chann, u32 tailptr_val)
+{
+	mailbox_reg_write(mb_chann, mb_chann->res[CHAN_RES_X2I].mb_tail_ptr_reg, tailptr_val);
+	mb_chann->x2i_tail = tailptr_val;
+}
+
+static inline u32
+mailbox_get_headptr(struct mailbox_channel *mb_chann, enum channel_res_type type)
+{
+	return mailbox_reg_read(mb_chann, mb_chann->res[type].mb_head_ptr_reg);
+}
+
+static inline u32
+mailbox_get_tailptr(struct mailbox_channel *mb_chann, enum channel_res_type type)
+{
+	return mailbox_reg_read(mb_chann, mb_chann->res[type].mb_tail_ptr_reg);
+}
+
+static inline u32
+mailbox_get_ringbuf_size(struct mailbox_channel *mb_chann, enum channel_res_type type)
+{
+	return mb_chann->res[type].rb_size;
+}
+
+static inline int mailbox_validate_msgid(int msg_id)
+{
+	return (msg_id & MAGIC_VAL_MASK) == MAGIC_VAL;
+}
+
+static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
+{
+	unsigned long flags;
+	int msg_id;
+
+	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
+	msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
+				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
+	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+	if (msg_id < 0)
+		return msg_id;
+
+	/*
+	 * The IDR becomes less efficient when dealing with larger IDs.
+	 * Thus, add MAGIC_VAL to the higher bits.
+	 */
+	msg_id |= MAGIC_VAL;
+	return msg_id;
+}
+
+static void mailbox_release_msgid(struct mailbox_channel *mb_chann, int msg_id)
+{
+	unsigned long flags;
+
+	msg_id &= ~MAGIC_VAL_MASK;
+	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
+	idr_remove(&mb_chann->chan_idr, msg_id);
+	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+}
+
+static int mailbox_release_msg(int id, void *p, void *data)
+{
+	struct mailbox_channel *mb_chann = data;
+	struct mailbox_msg *mb_msg = p;
+
+	MB_DBG(mb_chann, "msg_id 0x%x msg opcode 0x%x",
+	       mb_msg->pkg.header.id, mb_msg->pkg.header.opcode);
+	mb_msg->notify_cb(mb_msg->handle, NULL, 0);
+	kfree(mb_msg);
+
+	return 0;
+}
+
+static int
+mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
+{
+	u32 ringbuf_size;
+	u32 head, tail;
+	u32 start_addr;
+	u64 write_addr;
+	u32 tmp_tail;
+
+	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
+	tail = mb_chann->x2i_tail;
+	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
+	start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
+	tmp_tail = tail + mb_msg->pkg_size;
+
+	if (tail < head && tmp_tail >= head)
+		goto no_space;
+
+	if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
+			     mb_msg->pkg_size >= head))
+		goto no_space;
+
+	if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
+		write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
+		iowrite32(TOMBSTONE, (void *)write_addr);
+
+		/* tombstone is set. Write from the start of the ringbuf */
+		tail = 0;
+	}
+
+	write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
+	memcpy_toio((void *)write_addr, &mb_msg->pkg, mb_msg->pkg_size);
+	mailbox_set_tailptr(mb_chann, tail + mb_msg->pkg_size);
+
+	trace_mbox_set_tail(MAILBOX_NAME, mb_chann->msix_irq,
+			    mb_msg->pkg.header.opcode,
+			    mb_msg->pkg.header.id);
+
+	return 0;
+
+no_space:
+	return -ENOSPC;
+}
+
+static int
+mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *header,
+		 void *data)
+{
+	struct mailbox_msg *mb_msg;
+	unsigned long flags;
+	int msg_id;
+	int ret;
+
+	msg_id = header->id;
+	if (!mailbox_validate_msgid(msg_id)) {
+		MB_ERR(mb_chann, "Bad message ID 0x%x", msg_id);
+		return -EINVAL;
+	}
+
+	msg_id &= ~MAGIC_VAL_MASK;
+	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
+	mb_msg = idr_find(&mb_chann->chan_idr, msg_id);
+	if (!mb_msg) {
+		MB_ERR(mb_chann, "Cannot find msg 0x%x", msg_id);
+		spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+		return -EINVAL;
+	}
+	idr_remove(&mb_chann->chan_idr, msg_id);
+	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+
+	MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
+	       header->opcode, header->total_size, header->id);
+	ret = mb_msg->notify_cb(mb_msg->handle, data, header->total_size);
+	if (unlikely(ret))
+		MB_ERR(mb_chann, "Message callback ret %d", ret);
+
+	kfree(mb_msg);
+	return ret;
+}
+
+static int mailbox_get_msg(struct mailbox_channel *mb_chann)
+{
+	struct xdna_msg_header header;
+	u32 msg_size, rest;
+	u32 ringbuf_size;
+	u32 head, tail;
+	u32 start_addr;
+	u64 read_addr;
+	int ret;
+
+	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
+		return -EINVAL;
+	head = mb_chann->i2x_head;
+	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
+	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
+
+	if (unlikely(tail > ringbuf_size || !IS_ALIGNED(tail, 4))) {
+		MB_WARN_ONCE(mb_chann, "Invalid tail 0x%x", tail);
+		return -EINVAL;
+	}
+
+	/* ringbuf empty */
+	if (head == tail)
+		return -ENOENT;
+
+	if (head == ringbuf_size)
+		head = 0;
+
+	/* Peek size of the message or TOMBSTONE */
+	read_addr = mb_chann->mb->res.ringbuf_base + start_addr + head;
+	header.total_size = ioread32((void *)read_addr);
+	/* size is TOMBSTONE, set next read from 0 */
+	if (header.total_size == TOMBSTONE) {
+		if (head < tail) {
+			MB_WARN_ONCE(mb_chann, "Tombstone, head 0x%x tail 0x%x",
+				     head, tail);
+			return -EINVAL;
+		}
+		mailbox_set_headptr(mb_chann, 0);
+		return 0;
+	}
+
+	if (unlikely(!header.total_size || !IS_ALIGNED(header.total_size, 4))) {
+		MB_WARN_ONCE(mb_chann, "Invalid total size 0x%x", header.total_size);
+		return -EINVAL;
+	}
+	msg_size = sizeof(header) + header.total_size;
+
+	if (msg_size > ringbuf_size - head || msg_size > tail - head) {
+		MB_WARN_ONCE(mb_chann, "Invalid message size %d, tail %d, head %d",
+			     msg_size, tail, head);
+		return -EINVAL;
+	}
+
+	rest = sizeof(header) - sizeof(u32);
+	read_addr += sizeof(u32);
+	memcpy_fromio((u32 *)&header + 1, (void *)read_addr, rest);
+	read_addr += rest;
+
+	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
+
+	mailbox_set_headptr(mb_chann, head + msg_size);
+	/* After update head, it can equal to ringbuf_size. This is expected. */
+	trace_mbox_set_head(MAILBOX_NAME, mb_chann->msix_irq,
+			    header.opcode, header.id);
+
+	return ret;
+}
+
+static irqreturn_t mailbox_irq_handler(int irq, void *p)
+{
+	struct mailbox_channel *mb_chann = p;
+
+	trace_mbox_irq_handle(MAILBOX_NAME, irq);
+	/* Schedule a rx_work to call the callback functions */
+	queue_work(mb_chann->work_q, &mb_chann->rx_work);
+	/* Clear IOHUB register */
+	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
+
+	return IRQ_HANDLED;
+}
+
+static void mailbox_rx_worker(struct work_struct *rx_work)
+{
+	struct mailbox_channel *mb_chann;
+	int ret;
+
+	mb_chann = container_of(rx_work, struct mailbox_channel, rx_work);
+
+	if (READ_ONCE(mb_chann->bad_state)) {
+		MB_ERR(mb_chann, "Channel in bad state, work aborted");
+		return;
+	}
+
+	while (1) {
+		/*
+		 * If return is 0, keep consuming next message, until there is
+		 * no messages or an error happened.
+		 */
+		ret = mailbox_get_msg(mb_chann);
+		if (ret == -ENOENT)
+			break;
+
+		/* Other error means device doesn't look good, disable irq. */
+		if (unlikely(ret)) {
+			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
+			WRITE_ONCE(mb_chann->bad_state, true);
+			disable_irq(mb_chann->msix_irq);
+			break;
+		}
+	}
+}
+
+int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
+			  const struct xdna_mailbox_msg *msg, u64 tx_timeout)
+{
+	struct xdna_msg_header *header;
+	struct mailbox_msg *mb_msg;
+	size_t pkg_size;
+	int ret;
+
+	pkg_size = sizeof(*header) + msg->send_size;
+	if (pkg_size > mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I)) {
+		MB_ERR(mb_chann, "Message size larger than ringbuf size");
+		return -EINVAL;
+	}
+
+	if (unlikely(!IS_ALIGNED(msg->send_size, 4))) {
+		MB_ERR(mb_chann, "Message must be 4 bytes align");
+		return -EINVAL;
+	}
+
+	/* The fist word in payload can NOT be TOMBSTONE */
+	if (unlikely(((u32 *)msg->send_data)[0] == TOMBSTONE)) {
+		MB_ERR(mb_chann, "Tomb stone in data");
+		return -EINVAL;
+	}
+
+	if (READ_ONCE(mb_chann->bad_state)) {
+		MB_ERR(mb_chann, "Channel in bad state");
+		return -EPIPE;
+	}
+
+	mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
+	if (!mb_msg)
+		return -ENOMEM;
+
+	mb_msg->handle = msg->handle;
+	mb_msg->notify_cb = msg->notify_cb;
+	mb_msg->pkg_size = pkg_size;
+
+	header = &mb_msg->pkg.header;
+	/*
+	 * Hardware use total_size and size to split huge message.
+	 * We do not support it here. Thus the values are the same.
+	 */
+	header->total_size = msg->send_size;
+	header->size = msg->send_size;
+	header->opcode = msg->opcode;
+	header->protocol_version = MSG_PROTOCOL_VERSION;
+	memcpy(mb_msg->pkg.payload, msg->send_data, msg->send_size);
+
+	ret = mailbox_acquire_msgid(mb_chann, mb_msg);
+	if (unlikely(ret < 0)) {
+		MB_ERR(mb_chann, "mailbox_acquire_msgid failed");
+		goto msg_id_failed;
+	}
+	header->id = ret;
+
+	MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
+	       header->opcode, header->total_size, header->id);
+
+	ret = mailbox_send_msg(mb_chann, mb_msg);
+	if (ret) {
+		MB_DBG(mb_chann, "Error in mailbox send msg, ret %d", ret);
+		goto release_id;
+	}
+
+	return 0;
+
+release_id:
+	mailbox_release_msgid(mb_chann, header->id);
+msg_id_failed:
+	kfree(mb_msg);
+	return ret;
+}
+
+struct mailbox_channel *
+xdna_mailbox_create_channel(struct mailbox *mb,
+			    const struct xdna_mailbox_chann_res *x2i,
+			    const struct xdna_mailbox_chann_res *i2x,
+			    u32 iohub_int_addr,
+			    int mb_irq)
+{
+	struct mailbox_channel *mb_chann;
+	int ret;
+
+	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
+		pr_err("Ring buf size must be power of 2");
+		return NULL;
+	}
+
+	mb_chann = kzalloc(sizeof(*mb_chann), GFP_KERNEL);
+	if (!mb_chann)
+		return NULL;
+
+	mb_chann->mb = mb;
+	mb_chann->msix_irq = mb_irq;
+	mb_chann->iohub_int_addr = iohub_int_addr;
+	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
+	memcpy(&mb_chann->res[CHAN_RES_I2X], i2x, sizeof(*i2x));
+
+	spin_lock_init(&mb_chann->chan_idr_lock);
+	idr_init(&mb_chann->chan_idr);
+	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
+	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
+
+	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
+	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
+	if (!mb_chann->work_q) {
+		MB_ERR(mb_chann, "Create workqueue failed");
+		goto free_and_out;
+	}
+
+	/* Everything look good. Time to enable irq handler */
+	ret = request_irq(mb_irq, mailbox_irq_handler, 0, MAILBOX_NAME, mb_chann);
+	if (ret) {
+		MB_ERR(mb_chann, "Failed to request irq %d ret %d", mb_irq, ret);
+		goto destroy_wq;
+	}
+
+	mb_chann->bad_state = false;
+
+	MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", mb_chann->msix_irq);
+	return mb_chann;
+
+destroy_wq:
+	destroy_workqueue(mb_chann->work_q);
+free_and_out:
+	kfree(mb_chann);
+	return NULL;
+}
+
+int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
+{
+	if (!mb_chann)
+		return 0;
+
+	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
+	free_irq(mb_chann->msix_irq, mb_chann);
+	destroy_workqueue(mb_chann->work_q);
+	/* We can clean up and release resources */
+
+	idr_for_each(&mb_chann->chan_idr, mailbox_release_msg, mb_chann);
+	idr_destroy(&mb_chann->chan_idr);
+
+	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
+	kfree(mb_chann);
+	return 0;
+}
+
+void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
+{
+	if (!mb_chann)
+		return;
+
+	/* Disalbe an irq and wait. This might sleep. */
+	disable_irq(mb_chann->msix_irq);
+
+	/* Cancel RX work and wait for it to finish */
+	cancel_work_sync(&mb_chann->rx_work);
+	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
+}
+
+struct mailbox *xdnam_mailbox_create(struct device *dev,
+				     const struct xdna_mailbox_res *res)
+{
+	struct mailbox *mb;
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return NULL;
+	mb->dev = dev;
+
+	/* mailbox and ring buf base and size information */
+	memcpy(&mb->res, res, sizeof(*res));
+
+	return mb;
+}
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
new file mode 100644
index 000000000000..7987f015f2f8
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_MAILBOX_H_
+#define _AIE2_MAILBOX_H_
+
+struct mailbox;
+struct mailbox_channel;
+
+/*
+ * xdna_mailbox_msg - message struct
+ *
+ * @opcode:	opcode for firmware
+ * @handle:	handle used for the notify callback
+ * @notify_cb:  callback function to notify the sender when there is response
+ * @send_data:	pointing to sending data
+ * @send_size:	size of the sending data
+ *
+ * The mailbox will splite the sending data in to multiple firmware message if
+ * the size of the data is too big. This is transparent to the sender. The
+ * sender will receive one notification.
+ */
+struct xdna_mailbox_msg {
+	u32		opcode;
+	void		*handle;
+	int		(*notify_cb)(void *handle, const u32 *data, size_t size);
+	u8		*send_data;
+	size_t		send_size;
+};
+
+/*
+ * xdna_mailbox_res - mailbox hardware resource
+ *
+ * @ringbuf_base:	ring buffer base address
+ * @ringbuf_size:	ring buffer size
+ * @mbox_base:		mailbox base address
+ * @mbox_size:		mailbox size
+ */
+struct xdna_mailbox_res {
+	u64		ringbuf_base;
+	size_t		ringbuf_size;
+	u64		mbox_base;
+	size_t		mbox_size;
+	const char	*name;
+};
+
+/*
+ * xdna_mailbox_chann_res - resources
+ *
+ * @rb_start_addr:	ring buffer start address
+ * @rb_size:		ring buffer size
+ * @mb_head_ptr_reg:	mailbox head pointer register
+ * @mb_tail_ptr_reg:	mailbox tail pointer register
+ */
+struct xdna_mailbox_chann_res {
+	u32 rb_start_addr;
+	u32 rb_size;
+	u32 mb_head_ptr_reg;
+	u32 mb_tail_ptr_reg;
+};
+
+/*
+ * xdna_mailbox_create() -- create mailbox subsystem and initialize
+ *
+ * @dev: device pointer
+ * @res: SRAM and mailbox resources
+ *
+ * Return: If success, return a handle of mailbox subsystem.
+ * Otherwise, return NULL pointer.
+ */
+struct mailbox *xdnam_mailbox_create(struct device *dev,
+				     const struct xdna_mailbox_res *res);
+
+/*
+ * xdna_mailbox_create_channel() -- Create a mailbox channel instance
+ *
+ * @mailbox: the handle return from xdna_mailbox_create()
+ * @x2i: host to firmware mailbox resources
+ * @i2x: firmware to host mailbox resources
+ * @xdna_mailbox_intr_reg: register addr of MSI-X interrupt
+ * @mb_irq: Linux IRQ number associated with mailbox MSI-X interrupt vector index
+ *
+ * Return: If success, return a handle of mailbox channel. Otherwise, return NULL.
+ */
+struct mailbox_channel *
+xdna_mailbox_create_channel(struct mailbox *mailbox,
+			    const struct xdna_mailbox_chann_res *x2i,
+			    const struct xdna_mailbox_chann_res *i2x,
+			    u32 xdna_mailbox_intr_reg,
+			    int mb_irq);
+
+/*
+ * xdna_mailbox_destroy_channel() -- destroy mailbox channel
+ *
+ * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
+ *
+ * Return: if success, return 0. otherwise return error code
+ */
+int xdna_mailbox_destroy_channel(struct mailbox_channel *mailbox_chann);
+
+/*
+ * xdna_mailbox_stop_channel() -- stop mailbox channel
+ *
+ * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
+ *
+ * Return: if success, return 0. otherwise return error code
+ */
+void xdna_mailbox_stop_channel(struct mailbox_channel *mailbox_chann);
+
+/*
+ * xdna_mailbox_send_msg() -- Send a message
+ *
+ * @mailbox_chann: Mailbox channel handle
+ * @msg: message struct for message information
+ * @tx_timeout: the timeout value for sending the message in ms.
+ *
+ * Return: If success return 0, otherwise, return error code
+ */
+int xdna_mailbox_send_msg(struct mailbox_channel *mailbox_chann,
+			  const struct xdna_mailbox_msg *msg, u64 tx_timeout);
+
+#endif /* _AIE2_MAILBOX_ */
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
new file mode 100644
index 000000000000..57e2dee61a1c
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include "amdxdna_mailbox_helper.h"
+
+int xdna_msg_cb(void *handle, const u32 *data, size_t size)
+{
+	struct xdna_notify *cb_arg = handle;
+	int ret;
+
+	if (unlikely(!data))
+		goto out;
+
+	if (unlikely(cb_arg->size != size)) {
+		cb_arg->error = -EINVAL;
+		goto out;
+	}
+
+	print_hex_dump_debug("resp data: ", DUMP_PREFIX_OFFSET,
+			     16, 4, data, cb_arg->size, true);
+	memcpy(cb_arg->data, data, cb_arg->size);
+out:
+	ret = cb_arg->error;
+	complete(&cb_arg->comp);
+	return ret;
+}
+
+int xdna_send_msg_wait(struct amdxdna_dev *xdna, struct mailbox_channel *chann,
+		       struct xdna_mailbox_msg *msg)
+{
+	struct xdna_notify *hdl = msg->handle;
+	int ret;
+
+	ret = xdna_mailbox_send_msg(chann, msg, TX_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(xdna, "Send message failed, ret %d", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&hdl->comp,
+					  msecs_to_jiffies(RX_TIMEOUT));
+	if (!ret) {
+		XDNA_ERR(xdna, "Wait for completion timeout");
+		return -ETIME;
+	}
+
+	return hdl->error;
+}
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
new file mode 100644
index 000000000000..098b9d50cb9c
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_MAILBOX_HELPER_H
+#define _AMDXDNA_MAILBOX_HELPER_H
+
+#include "amdxdna_drm.h"
+#include "amdxdna_mailbox.h"
+
+#define TX_TIMEOUT 2000 /* miliseconds */
+#define RX_TIMEOUT 5000 /* miliseconds */
+
+struct xdna_notify {
+	struct completion       comp;
+	u32			*data;
+	size_t			size;
+	int			error;
+};
+
+#define DECLARE_XDNA_MSG_COMMON(name, op, status)		\
+	struct name##_req	req = { 0 };			\
+	struct name##_resp	resp = { status	};		\
+	struct xdna_notify	hdl = {				\
+		.error = 0,					\
+		.data = (u32 *)&resp,				\
+		.size = sizeof(resp),				\
+		.comp = COMPLETION_INITIALIZER(hdl.comp),	\
+	};							\
+	struct xdna_mailbox_msg msg = {				\
+		.send_data = (u8 *)&req,			\
+		.send_size = sizeof(req),			\
+		.handle = &hdl,					\
+		.opcode = op,					\
+		.notify_cb = xdna_msg_cb,			\
+	}
+
+int xdna_msg_cb(void *handle, const u32 *data, size_t size);
+int xdna_send_msg_wait(struct amdxdna_dev *xdna, struct mailbox_channel *chann,
+		       struct xdna_mailbox_msg *msg);
+
+#endif /* _AMDXDNA_MAILBOX_HELPER_H */
diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
index 95b5b7352cf3..8e165165bc99 100644
--- a/drivers/accel/amdxdna/amdxdna_sysfs.c
+++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
@@ -20,9 +20,20 @@ static ssize_t device_type_show(struct device *dev, struct device_attribute *att
 }
 static DEVICE_ATTR_RO(device_type);
 
+static ssize_t fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amdxdna_dev *xdna = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d.%d.%d.%d\n", xdna->fw_ver.major,
+		       xdna->fw_ver.minor, xdna->fw_ver.sub,
+		       xdna->fw_ver.build);
+}
+static DEVICE_ATTR_RO(fw_version);
+
 static struct attribute *amdxdna_attrs[] = {
 	&dev_attr_device_type.attr,
 	&dev_attr_vbnv.attr,
+	&dev_attr_fw_version.attr,
 	NULL,
 };
 
diff --git a/include/trace/events/amdxdna.h b/include/trace/events/amdxdna.h
new file mode 100644
index 000000000000..33343d8f0622
--- /dev/null
+++ b/include/trace/events/amdxdna.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM amdxdna
+
+#if !defined(_TRACE_AMDXDNA_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_AMDXDNA_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(xdna_mbox_msg,
+		    TP_PROTO(char *name, u8 chann_id, u32 opcode, u32 msg_id),
+
+		    TP_ARGS(name, chann_id, opcode, msg_id),
+
+		    TP_STRUCT__entry(__string(name, name)
+				     __field(u32, chann_id)
+				     __field(u32, opcode)
+				     __field(u32, msg_id)),
+
+		    TP_fast_assign(__assign_str(name);
+				   __entry->chann_id = chann_id;
+				   __entry->opcode = opcode;
+				   __entry->msg_id = msg_id;),
+
+		    TP_printk("%s.%d id 0x%x opcode 0x%x", __get_str(name),
+			      __entry->chann_id, __entry->msg_id, __entry->opcode)
+);
+
+DEFINE_EVENT(xdna_mbox_msg, mbox_set_tail,
+	     TP_PROTO(char *name, u8 chann_id, u32 opcode, u32 id),
+	     TP_ARGS(name, chann_id, opcode, id)
+);
+
+DEFINE_EVENT(xdna_mbox_msg, mbox_set_head,
+	     TP_PROTO(char *name, u8 chann_id, u32 opcode, u32 id),
+	     TP_ARGS(name, chann_id, opcode, id)
+);
+
+TRACE_EVENT(mbox_irq_handle,
+	    TP_PROTO(char *name, int irq),
+
+	    TP_ARGS(name, irq),
+
+	    TP_STRUCT__entry(__string(name, name)
+			     __field(int, irq)),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->irq = irq;),
+
+	    TP_printk("%s.%d", __get_str(name), __entry->irq)
+);
+
+#endif /* !defined(_TRACE_AMDXDNA_H) || defined(TRACE_HEADER_MULTI_READ) */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.34.1

