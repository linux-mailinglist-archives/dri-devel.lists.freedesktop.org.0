Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D09A6F41
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F06710E555;
	Mon, 21 Oct 2024 16:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MwTustCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1F710E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTGwrDRZmWhkxo7iO4WqYmG07OEFHSvQg0blY3Bp8K4eIpUczdJU4JKSix1T+Txu4Ol8PDSXSm9OQZn/k+n3V5oizUmEjqFwl12w6O3whuj0Dk2WuK3KlBuCzYtvYgEtNitqO79JGWhqUmVfEIGok5aK+DrEzx6dkciG0+20ZtobAa+fEFaEJZOg/3LJ77zsSQ1LWzjkx20mn0xgjN0s3iWEOEvmuRgK8P1BLK09+baw3NT9G1LBr0+V7lwB3s9VmQAhSTT/KvjCWtshlh/8+MKkuyyhun6vp+2oHqonoAyIiZAVkrKHQqtASPMaxvaZiFA8DPjFoCsiXku3TILUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/UENjyfhqozeWR1Kdly9Ia0/5ypJYVVSkNy2MsDfnM=;
 b=Y6oLr35zFmGP8GKvu2L0Dw8cQY4XxyshPTYokljVAUcTval2HvkFprzdCNPO4xr2uV+D5vhg6D78reZeAZwejsmZqztYmVh6b05FAtWg+mNXgSmBKxws9AMw1UO56KnFES5Q5jXPxj1ZwJwbYBnkKmfRLJyJKMFjKd5zfPwx2vhJpJGY08jzjGZ2EOoQj3xNCWN92F4SCrmiw+osCJKoO+fTNt+6jv4je2s2M44cq2nIhx53NJEXLsu1q7MF/GY1qbBlnZvEhq4ujNyGv4cN5RFLjngNecsAPEdaGXLdNTO963l9p2YDFw91ye1F+wUk/pXJ8voX1qLnzyXkdefjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/UENjyfhqozeWR1Kdly9Ia0/5ypJYVVSkNy2MsDfnM=;
 b=MwTustCJEk52qtDvKukd8VXcPytXiwrFaNrxi2orwCh04G0SKs1wM8Mi/6wW9CV4Q17OAZUzSf1J6eXtMPjw7P0MdH0NFJ5sbS9ZZ+KzsHO9XqiWnpj7PTZqKIJtndb9dbW5xLYAXsSd5wlQgbx0tH9z6yQVCv+mOOdfOtrGemY=
Received: from SJ0PR03CA0141.namprd03.prod.outlook.com (2603:10b6:a03:33c::26)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:19:56 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::67) by SJ0PR03CA0141.outlook.office365.com
 (2603:10b6:a03:33c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 16:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:19:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:51 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 11:19:50 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, George Yang <George.Yang@amd.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH V5 03/10] accel/amdxdna: Support hardware mailbox
Date: Mon, 21 Oct 2024 09:19:24 -0700
Message-ID: <20241021161931.3701754-4-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021161931.3701754-1-lizhi.hou@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d92d0bd-00d6-47ee-392a-08dcf1ec3398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2TcoCoJHDotoYTXwzex9VgmbTYe8d/oMJaBMoania4JTBRVQSKrM+nJh+BSF?=
 =?us-ascii?Q?wC8xvSpGuxR7ewWM/BCwHZ63RRKTnJ7jzIlLiH5lBeTNiLUYcyc++lxRTuuY?=
 =?us-ascii?Q?7/lU/KnvoEPu2IBPe+EcN42jSXVFocdX3mBNT6K2dplbquYH8tw7rVxeXSTW?=
 =?us-ascii?Q?M27+wsX7go4uV0EWhXMMB1KeUpGnB9krrgXBqx12ZYEEWAvypCUEhvrk6QcH?=
 =?us-ascii?Q?eJURqt0hE9KrYgev+dThYpLWd/KUgE9ovyPdd/L/mrTLa0IDjHpN+SPomTSB?=
 =?us-ascii?Q?OjEWnG/CPQKCqb/1FhDOItEn5oPNOU0gZ9fAFWlmvySuztaMr6SPuWqiGD3m?=
 =?us-ascii?Q?AGLHm2Vr4OxARTGxHPZUw/QKzXJ4ESiX8pRtExKBeiBFOaOhoWykoYwnlzBe?=
 =?us-ascii?Q?i0AOUbpWL1mXKbhOdcRbDfxk0cCNizhsFKFranA2M4sMYCLJBMZToxoI/0oL?=
 =?us-ascii?Q?b+ojujoWMJACAyPXHqYH4Xcx8arJbGMnHjouY6MK3v9L6KC7LGZB6ewoT/gM?=
 =?us-ascii?Q?B78KZjIjq3Jy5G49RigG7G225RlL0NDvuFXI6MyhrDlVBuZ+7sO7bV436JEQ?=
 =?us-ascii?Q?4jAOjj3kt10EImKCSx1syZ6KirxJPvQsTvqaOs+9aYc2qWFxBXip9wBQQiHa?=
 =?us-ascii?Q?JdWvYkvwTU4jzCIpXud6U8i5eEk/7h53zv3OZoLn4ynJ+o3h2Ldr0IB4JszE?=
 =?us-ascii?Q?wYuy73tDad+w0AyEtLaXac69VWLMJHZhF8QBXIvbU0NDGn1TsXA0FK6siUH8?=
 =?us-ascii?Q?CULqLobTCGlcf016SbDLTaz24G+5LCgd5yiLINOFdvjzbUUi7jTBVmvC3lbx?=
 =?us-ascii?Q?7H9AWjoUZ360xUPl/r5QyDlVDd4C/I5Dsoyy6PBcqc2i7HeFk1FsDL+HesoL?=
 =?us-ascii?Q?9jcUb87PV6UbykL5kVvMH8I6O3DyJ0t4p/nsEOXo/xfqPv6+N8euI/U0IY8L?=
 =?us-ascii?Q?GC3W2uyycLxaa9wQshZxKldF+j3ElySvxFmqQCla+0xA4/onwnDg6AJ/lnei?=
 =?us-ascii?Q?PgbJlps1rOK/HqhzidzsYNBxaFKCNiWADNbP2amZr1TOKwQT0r9huKGbOxSS?=
 =?us-ascii?Q?aJZKXgsPdDCqa9zrzlv2bdjx0FJHu6UeNRZngUPqsUxDfqismEUdrEGxvG5H?=
 =?us-ascii?Q?dQaZ2yKgUmJk8UIYZl1aonBDp4ppHupx4JVzoFx1xU+kY7/XArL2c33GdpKV?=
 =?us-ascii?Q?yd9OdPLD/q5GyAKhDyNJw08VPhJWxEMolBkB9F/gWv4CAZBz8/mFXsOkFsJu?=
 =?us-ascii?Q?q9J+yGwaut88xXmIaMI24lS0CDMZHGEzvyR+UrFnyIrwBECsPKbT3QfmKqmk?=
 =?us-ascii?Q?4mlLrUTT50y6TGz6As5WV+Czekq3N6JjAZ2IMkgmR/FJKG5t86Tg0dGzeIzS?=
 =?us-ascii?Q?/tEsm0E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:19:55.8551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d92d0bd-00d6-47ee-392a-08dcf1ec3398
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 MAINTAINERS                                   |   1 +
 drivers/accel/amdxdna/Makefile                |   3 +
 drivers/accel/amdxdna/aie2_message.c          | 194 ++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++++++
 drivers/accel/amdxdna/aie2_pci.c              | 256 +++++++-
 drivers/accel/amdxdna/aie2_pci.h              |  62 ++
 drivers/accel/amdxdna/aie2_psp.c              |   2 +
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 575 ++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 ++++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  56 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 ++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       |   8 +
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  11 +
 drivers/accel/amdxdna/npu1_regs.c             |   1 +
 drivers/accel/amdxdna/npu2_regs.c             |   1 +
 drivers/accel/amdxdna/npu4_regs.c             |   1 +
 drivers/accel/amdxdna/npu5_regs.c             |   1 +
 include/trace/events/amdxdna.h                |  60 ++
 18 files changed, 1767 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 include/trace/events/amdxdna.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 997cbcad8e3e..ae43451649f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1192,6 +1192,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/amdxdna/
+F:	include/trace/events/amdxdna.h
 F:	include/uapi/drm/amdxdna_accel.h
 
 AMD XGBE DRIVER
diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 1dee0cba8390..1b4e78b43b44 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -1,9 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 amdxdna-y := \
+	aie2_message.o \
 	aie2_pci.o \
 	aie2_psp.o \
 	aie2_smu.o \
+	amdxdna_mailbox.o \
+	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
 	amdxdna_sysfs.o \
 	npu1_regs.o \
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
new file mode 100644
index 000000000000..cbf8ee54c6c2
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include "aie2_msg_priv.h"
+#include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
+#include "amdxdna_mailbox_helper.h"
+#include "amdxdna_pci_drv.h"
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
index 000000000000..4e02e744b470
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_MSG_PRIV_H_
+#define _AIE2_MSG_PRIV_H_
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
+	AIE2_STATUS_INVALID_OPERATION			= 0x4000006,
+	AIE2_STATUS_ASYNC_EVENT_MSGS_FULL,
+	AIE2_STATUS_MAX_RTOS_STATUS_CODE,
+	MAX_AIE2_STATUS_CODE
+};
+
+struct assign_mgmt_pasid_req {
+	__u16	pasid;
+	__u16	reserved;
+} __packed;
+
+struct assign_mgmt_pasid_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct map_host_buffer_req {
+	__u32		context_id;
+	__u64		buf_addr;
+	__u64		buf_size;
+} __packed;
+
+struct map_host_buffer_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+#define MAX_CQ_PAIRS		2
+struct cq_info {
+	__u32 head_addr;
+	__u32 tail_addr;
+	__u32 buf_addr;
+	__u32 buf_size;
+};
+
+struct cq_pair {
+	struct cq_info x2i_q;
+	struct cq_info i2x_q;
+};
+
+struct create_ctx_req {
+	__u32	aie_type;
+	__u8	start_col;
+	__u8	num_col;
+	__u16	reserved;
+	__u8	num_cq_pairs_requested;
+	__u8	reserved1;
+	__u16	pasid;
+	__u32	pad[2];
+	__u32	sec_comm_target_type;
+	__u32	context_priority;
+} __packed;
+
+struct create_ctx_resp {
+	enum aie2_msg_status	status;
+	__u32			context_id;
+	__u16			msix_id;
+	__u8			num_cq_pairs_allocated;
+	__u8			reserved;
+	struct cq_pair		cq_pair[MAX_CQ_PAIRS];
+} __packed;
+
+struct destroy_ctx_req {
+	__u32	context_id;
+} __packed;
+
+struct destroy_ctx_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct execute_buffer_req {
+	__u32	cu_idx;
+	__u32	payload[19];
+} __packed;
+
+struct exec_dpu_req {
+	__u64	inst_buf_addr;
+	__u32	inst_size;
+	__u32	inst_prop_cnt;
+	__u32	cu_idx;
+	__u32	payload[35];
+} __packed;
+
+struct execute_buffer_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct aie_tile_info {
+	__u32		size;
+	__u16		major;
+	__u16		minor;
+	__u16		cols;
+	__u16		rows;
+	__u16		core_rows;
+	__u16		mem_rows;
+	__u16		shim_rows;
+	__u16		core_row_start;
+	__u16		mem_row_start;
+	__u16		shim_row_start;
+	__u16		core_dma_channels;
+	__u16		mem_dma_channels;
+	__u16		shim_dma_channels;
+	__u16		core_locks;
+	__u16		mem_locks;
+	__u16		shim_locks;
+	__u16		core_events;
+	__u16		mem_events;
+	__u16		shim_events;
+	__u16		reserved;
+};
+
+struct aie_tile_info_req {
+	__u32	reserved;
+} __packed;
+
+struct aie_tile_info_resp {
+	enum aie2_msg_status	status;
+	struct aie_tile_info	info;
+} __packed;
+
+struct aie_version_info_req {
+	__u32		reserved;
+} __packed;
+
+struct aie_version_info_resp {
+	enum aie2_msg_status	status;
+	__u16			major;
+	__u16			minor;
+} __packed;
+
+struct aie_column_info_req {
+	__u64 dump_buff_addr;
+	__u32 dump_buff_size;
+	__u32 num_cols;
+	__u32 aie_bitmap;
+} __packed;
+
+struct aie_column_info_resp {
+	enum aie2_msg_status	status;
+	__u32 size;
+} __packed;
+
+struct suspend_req {
+	__u32		place_holder;
+} __packed;
+
+struct suspend_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct resume_req {
+	__u32		place_holder;
+} __packed;
+
+struct resume_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct check_header_hash_req {
+	__u64		hash_high;
+	__u64		hash_low;
+} __packed;
+
+struct check_header_hash_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct query_error_req {
+	__u64		buf_addr;
+	__u32		buf_size;
+	__u32		next_row;
+	__u32		next_column;
+	__u32		next_module;
+} __packed;
+
+struct query_error_resp {
+	enum aie2_msg_status	status;
+	__u32			num_err;
+	__u32			has_next_err;
+	__u32			next_row;
+	__u32			next_column;
+	__u32			next_module;
+} __packed;
+
+struct protocol_version_req {
+	__u32		reserved;
+} __packed;
+
+struct protocol_version_resp {
+	enum aie2_msg_status	status;
+	__u32			major;
+	__u32			minor;
+} __packed;
+
+struct firmware_version_req {
+	__u32		reserved;
+} __packed;
+
+struct firmware_version_resp {
+	enum aie2_msg_status	status;
+	__u32			major;
+	__u32			minor;
+	__u32			sub;
+	__u32			build;
+} __packed;
+
+#define MAX_NUM_CUS			32
+#define AIE2_MSG_CFG_CU_PDI_ADDR	GENMASK(16, 0)
+#define AIE2_MSG_CFG_CU_FUNC		GENMASK(24, 17)
+struct config_cu_req {
+	__u32	num_cus;
+	__u32	cfgs[MAX_NUM_CUS];
+} __packed;
+
+struct config_cu_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct set_runtime_cfg_req {
+	__u32	type;
+	__u64	value;
+} __packed;
+
+struct set_runtime_cfg_resp {
+	enum aie2_msg_status	status;
+} __packed;
+
+struct get_runtime_cfg_req {
+	__u32	type;
+} __packed;
+
+struct get_runtime_cfg_resp {
+	enum aie2_msg_status	status;
+	__u64			value;
+} __packed;
+
+enum async_event_type {
+	ASYNC_EVENT_TYPE_AIE_ERROR,
+	ASYNC_EVENT_TYPE_EXCEPTION,
+	MAX_ASYNC_EVENT_TYPE
+};
+
+#define ASYNC_BUF_SIZE SZ_8K
+struct async_event_msg_req {
+	__u64 buf_addr;
+	__u32 buf_size;
+} __packed;
+
+struct async_event_msg_resp {
+	enum aie2_msg_status	status;
+	enum async_event_type	type;
+} __packed;
+
+#define MAX_CHAIN_CMDBUF_SIZE SZ_4K
+#define slot_cf_has_space(offset, payload_size) \
+	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
+	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))
+struct cmd_chain_slot_execbuf_cf {
+	__u32 cu_idx;
+	__u32 arg_cnt;
+	__u32 args[] __counted_by(arg_cnt);
+};
+
+#define slot_dpu_has_space(offset, payload_size) \
+	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
+	 offsetof(struct cmd_chain_slot_dpu, args[0]))
+struct cmd_chain_slot_dpu {
+	__u64 inst_buf_addr;
+	__u32 inst_size;
+	__u32 inst_prop_cnt;
+	__u32 cu_idx;
+	__u32 arg_cnt;
+#define MAX_DPU_ARGS_SIZE (34 * sizeof(__u32))
+	__u32 args[] __counted_by(arg_cnt);
+};
+
+struct cmd_chain_req {
+	__u64 buf_addr;
+	__u32 buf_size;
+	__u32 count;
+} __packed;
+
+struct cmd_chain_resp {
+	enum aie2_msg_status	status;
+	__u32			fail_cmd_idx;
+	enum aie2_msg_status	fail_cmd_status;
+} __packed;
+
+#define AIE2_MSG_SYNC_BO_SRC_TYPE	GENMASK(3, 0)
+#define AIE2_MSG_SYNC_BO_DST_TYPE	GENMASK(7, 4)
+struct sync_bo_req {
+	__u64 src_addr;
+	__u64 dst_addr;
+	__u32 size;
+#define SYNC_BO_DEV_MEM  0
+#define SYNC_BO_HOST_MEM 2
+	__u32 type;
+} __packed;
+
+struct sync_bo_resp {
+	enum aie2_msg_status	status;
+} __packed;
+#endif /* _AIE2_MSG_PRIV_H_ */
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f36549293053..c987c731172d 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -9,16 +9,210 @@
 #include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/iommu.h>
+#include <linux/iopoll.h>
 #include <linux/pci.h>
 
+#include "aie2_msg_priv.h"
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
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
 	pci_disable_device(pdev);
@@ -28,7 +222,9 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
-	int ret;
+	struct xdna_mailbox_res mbox_res;
+	u32 xdna_mailbox_intr_reg;
+	int mgmt_mb_irq, ret;
 
 	ret = pci_enable_device(pdev);
 	if (ret) {
@@ -49,8 +245,56 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
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
+	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
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
@@ -112,6 +356,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	}
 	ndev->sram_base = tbl[xdna->dev_info->sram_bar];
 	ndev->smu_base = tbl[xdna->dev_info->smu_bar];
+	ndev->mbox_base = tbl[xdna->dev_info->mbox_bar];
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret) {
@@ -156,9 +401,18 @@ static int aie2_init(struct amdxdna_dev *xdna)
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
index 34f344b4b662..4c81d10a0998 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -6,6 +6,8 @@
 #ifndef _AIE2_PCI_H_
 #define _AIE2_PCI_H_
 
+#include "amdxdna_mailbox.h"
+
 #define AIE2_INTERVAL	20000	/* us */
 #define AIE2_TIMEOUT	1000000	/* us */
 
@@ -33,6 +35,17 @@
 	((_ndev)->sram_base + SRAM_REG_OFF((_ndev), (idx))); \
 })
 
+#define CHAN_SLOT_SZ SZ_8K
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
 #define SMU_MPNPUCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_mpnpuclk_freq_max)
 #define SMU_HCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_hclk_freq_max)
 
@@ -63,12 +76,37 @@ enum psp_reg_idx {
 	PSP_MAX_REGS /* Keep this at the end */
 };
 
+struct amdxdna_fw_ver;
+
 struct psp_config {
 	const void	*fw_buf;
 	u32		fw_size;
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
@@ -84,9 +122,22 @@ struct amdxdna_dev_hdl {
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
@@ -127,4 +178,15 @@ struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *
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
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index c87ca322e206..2efcfd1941bf 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -9,6 +9,8 @@
 #include <linux/iopoll.h>
 
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
+#include "amdxdna_pci_drv.h"
 
 #define PSP_STATUS_READY	BIT(31)
 
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
new file mode 100644
index 000000000000..60b3bf518013
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+#include <linux/iopoll.h>
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
+#define MSG_BODY_SZ		GENMASK(10, 0)
+#define MSG_PROTO_VER		GENMASK(23, 16)
+struct xdna_msg_header {
+	__u32 total_size;
+	__u32 sz_ver;
+	__u32 id;
+	__u32 opcode;
+} __packed;
+
+static_assert(sizeof(struct xdna_msg_header) == 16);
+
+struct mailbox_pkg {
+	struct xdna_msg_header	header;
+	__u32			payload[];
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
+	writel(data, (void *)ringbuf_addr);
+}
+
+static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+
+	return readl((void *)ringbuf_addr);
+}
+
+static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+	int ret, value;
+
+	/* Poll till value is not zero */
+	ret = readx_poll_timeout(readl, (void *)ringbuf_addr, value,
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
+		writel(TOMBSTONE, (void *)write_addr);
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
+	header.total_size = readl((void *)read_addr);
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
+	header->sz_ver = FIELD_PREP(MSG_BODY_SZ, msg->send_size) |
+			FIELD_PREP(MSG_PROTO_VER, MSG_PROTOCOL_VERSION);
+	header->opcode = msg->opcode;
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
+struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
+				     const struct xdna_mailbox_res *res)
+{
+	struct mailbox *mb;
+
+	mb = drmm_kzalloc(ddev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return NULL;
+	mb->dev = ddev->dev;
+
+	/* mailbox and ring buf base and size information */
+	memcpy(&mb->res, res, sizeof(*res));
+
+	return mb;
+}
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
new file mode 100644
index 000000000000..65dc0aba0f35
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
+ * @ddev: device pointer
+ * @res: SRAM and mailbox resources
+ *
+ * Return: If success, return a handle of mailbox subsystem.
+ * Otherwise, return NULL pointer.
+ */
+struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
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
index 000000000000..42b615394605
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <linux/completion.h>
+
+#include "amdxdna_mailbox.h"
+#include "amdxdna_mailbox_helper.h"
+#include "amdxdna_pci_drv.h"
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
index 000000000000..7364e0172e2b
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_MAILBOX_HELPER_H
+#define _AMDXDNA_MAILBOX_HELPER_H
+
+#define TX_TIMEOUT 2000 /* miliseconds */
+#define RX_TIMEOUT 5000 /* miliseconds */
+
+struct amdxdna_dev;
+
+struct xdna_notify {
+	struct completion       comp;
+	u32			*data;
+	size_t			size;
+	int			error;
+};
+
+#define DECLARE_XDNA_MSG_COMMON(name, op, status)			\
+	struct name##_req	req = { 0 };				\
+	struct name##_resp	resp = { status	};			\
+	struct xdna_notify	hdl = {					\
+		.error = 0,						\
+		.data = (u32 *)&resp,					\
+		.size = sizeof(resp),					\
+		.comp = COMPLETION_INITIALIZER_ONSTACK(hdl.comp),	\
+	};								\
+	struct xdna_mailbox_msg msg = {					\
+		.send_data = (u8 *)&req,				\
+		.send_size = sizeof(req),				\
+		.handle = &hdl,						\
+		.opcode = op,						\
+		.notify_cb = xdna_msg_cb,				\
+	}
+
+int xdna_msg_cb(void *handle, const u32 *data, size_t size);
+int xdna_send_msg_wait(struct amdxdna_dev *xdna, struct mailbox_channel *chann,
+		       struct xdna_mailbox_msg *msg);
+
+#endif /* _AMDXDNA_MAILBOX_HELPER_H */
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 2f1a1c2441f9..64bce970514b 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -47,12 +47,20 @@ struct amdxdna_dev_info {
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
 
 /*
diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
index 5dd652fcf9d4..668b94b92714 100644
--- a/drivers/accel/amdxdna/amdxdna_sysfs.c
+++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
@@ -24,9 +24,20 @@ static ssize_t device_type_show(struct device *dev, struct device_attribute *att
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
 
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 858b31a82888..720aab0ed7c4 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -8,6 +8,7 @@
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
 /* Address definition from NPU1 docs */
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index 02b0f22c9f14..f3ea18bcf294 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -8,6 +8,7 @@
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index ca5ca5a6c751..db61142f0d4e 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -8,6 +8,7 @@
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 07fddcbb86ec..debf4e95b9bb 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -8,6 +8,7 @@
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
+#include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
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

