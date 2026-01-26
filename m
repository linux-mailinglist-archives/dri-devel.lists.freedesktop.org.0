Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPw3G2XAd2m+kgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8118C8BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343610E473;
	Mon, 26 Jan 2026 19:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aLp66i9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440510E473
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glYHpj0/QG38/iHsDbbgUp4dMy2vYVgbpJauhdonkD621OzrRUfq3D3iVuX0dAIDhCp6fiVqeMZlB5Ld30fAwm3jW79E26W/LGdG01o6GDZHrqmBF1kJNlx+IAbnwNL9Ixf14QPb5/sZpPeZZfDpXStAfhIAcNdEVqzLpW2Kt15FBJb2d2mi3b9nM5nVvBtVR4Khtr5FTime8x61zULNRDgDbqocZZ00izP7Eb7fLuyJnTY8KWlxWHvFiED8K3FGbG4CYNZTKJShQKb1v2a/CrMXmHfgxFCWQJpKXTnOG1YdfCydnHNn1nPSt5h34OgulC2Gdmo9A9OHr1H0UZx9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1QFkkImaolvsdX5EJRjaov+4nRfKO71oyXi2s3hQYM=;
 b=fyRcH2y0dNmZEa8P3LCdv/lyhzHefNysz0PcnZRdOqq08NnvJ0gs8IrO9ByZNtLrZhhCm6azXKGShAJioTwW1Qxcs2ATeHt3NtB9Rwi6BIDHLO2uWhZwbPLnDqyY4QAdtTcN2zwzOo7gKdyo6MuGVg6bLEK303MlpsVRz75W2XKBfs9+Rw1ZZ4L7rvYacuY0XrxgCou3l+jR6LyG8cj/RaPU3pcCteuGkNeYJ65jk22EnwMs9IimSskEeodT3Ql5wRlEl1F4YjuQc0qowjae5g6hdg7I1sCURD5luPkcRUMum/WmEXLf713aWZkOYKj02yts1+h2SxtCuKI9/b/UOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1QFkkImaolvsdX5EJRjaov+4nRfKO71oyXi2s3hQYM=;
 b=aLp66i9s1S6Dfv4sFRrSG5T5aGVrnEgwExcnhwQeWw+BajzjUtUOnb+zI2j4II8OgMiZKU9SB0OjPchqtN79m6OAQxMTk3O/7Jkb0lOGpLQZKtcFv45soNUCO/fderpkWVVCVFCSGKKKJwJVpFqlkV806iGknQIt8j8b9F3T4Dk=
Received: from MN0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:52f::13)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:28:22 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::90) by MN0PR03CA0011.outlook.office365.com
 (2603:10b6:208:52f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 19:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:28:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:28:03 -0600
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 26 Jan 2026 13:28:03 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <yidong.zhang@amd.com>, <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Nishad Saraf
 <nishads@amd.com>
Subject: [PATCH V2 5/5] accel/amd_vpci: Add communication channel service
Date: Mon, 26 Jan 2026 11:27:32 -0800
Message-ID: <20260126192732.1507084-6-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126192732.1507084-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 088c4a54-a3e4-4d56-9154-08de5d1111a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cFpHbQR4RpI7qHWxEDnHCbsfL/+Cz6LiyHCiGo3FgNvgFoHdA//k/b9fpU+l?=
 =?us-ascii?Q?lUB/Qf1LQZ1Nwg07VUAhQGRY4yh2W8islpve4U+fpwxIH0btmlbWUkQ4RrT/?=
 =?us-ascii?Q?c6p8SCqw711ApDjY0lmuLTV3IhLMPed9gHlVamdkDsJw61ITqzQDML3iml8C?=
 =?us-ascii?Q?OebjarZWK1BoSS9dpb57yelTYkX1Yj+bdAPS8LCRWp9xz5+oOrmzvDmNI8qU?=
 =?us-ascii?Q?5jJx8lG3UsQYRM/J3ee+2tgkSBJBfr388zshI6/dX4X8Er8MBo3w41hjHD1S?=
 =?us-ascii?Q?TyO81qSuw1SsCfMai5ZDEoOUGj6Xt5zOp+gHcEFLaUUh9Rfji224PzgretQu?=
 =?us-ascii?Q?abP1Wq4nNAYovel8Vya1iqTdWO+Osn5Bk9tPKG8p7l0vwoGH0j2oPcPHPqDA?=
 =?us-ascii?Q?DRtWbwuV7UWagJmtmQpWCdkCc0VkA8qAtuIxvyUN8Bi0t6o4QjZGAWC6T7W7?=
 =?us-ascii?Q?pRPReXQtg5MmAxVZmiJrPCkGKgOWqB8YCuL4EB3nTCE5bonugDoPjwurmScG?=
 =?us-ascii?Q?bzEdSHDBW+p++0/KNXWVjxNZ4iCBv3WtxVbdoKuyjtT9r2ixli6MsNNTZSfZ?=
 =?us-ascii?Q?41jniDlQGYGGtp9fMveAd0NwSi6uzuPApN6jydbObgGVl3RrZVJ39yvkzURc?=
 =?us-ascii?Q?1rtI8A2Z5tjDDSG8pZFzaxLKXaBGooLDM9DYrIWQMkkz9sBXs6q/J3OdluiF?=
 =?us-ascii?Q?3ULPpsbcoMIGn25xGyfFcEd37lDBOEM6hdkCtJwqsjTGbmJWuAJ9qzVIJsY0?=
 =?us-ascii?Q?dAW7KiTGR7P7MBGPNoOZYQWZJr5Mz7CaAfwCVGykqXdZ4ELxrRXkTFeee1Rd?=
 =?us-ascii?Q?qhyJoBqawA6c2TxgcXeLFlnHbIHdeoJzwZh9gxY17ciOufoqaZI1A4NuNIfG?=
 =?us-ascii?Q?5DCCcq3Jo31P9KA2LHh5gdDWpOP2LjJF7i+a3QOHzc9YT9j6GF6M83RaohaE?=
 =?us-ascii?Q?VMs//tZdXuOxM7UyZ0rsXnZqX45uuR9ZijIz8JVCwZVXthXwMpYiEjgSVHay?=
 =?us-ascii?Q?6bMujA5acILpQbjzzJwN3uu8WlfDOOu0Nf/rbh+n2CKFIawMfp6VopAqYRx+?=
 =?us-ascii?Q?LkNBuhpyqwGExCr1RaPM6t/Sap2MbBabjIPOrR/9G6KbWqR8Z5c2CG5JJyAD?=
 =?us-ascii?Q?M3g2mNrUMorkyUXsywvQa3mY5GO7LoIKOrkN4hah/ysIxFWgpc4cxMq3BIcr?=
 =?us-ascii?Q?AFxKBd1RUGEv+1Th09l9M/PfjodfU+xalooPQY+eMczRIO5V/ynkvAz/KsUw?=
 =?us-ascii?Q?q/70Ay22Det2xmZbzU/t59DvX+jDd/mpKQg1Xtl/clNdIGB2I193FucDsMVp?=
 =?us-ascii?Q?7gogmwyctKGicZ1LbnTxytJH17y+5fY+nBwwr+wIT+NkkpmBieOrK/UI7ANl?=
 =?us-ascii?Q?IbzbivSjF9jbss+MFoOa07TTTy0X5pRu/DcE5/ugindPHJIha/TARjimIkRP?=
 =?us-ascii?Q?3MB+1VFNkQPpWNrsqIYpZou8nGOui2YOYX1tr8X9AClmlgswHhf3OitgGI0F?=
 =?us-ascii?Q?47xKbYTxv2AS8eIbO2DDklP1J5ncS9wl61rwknAAdJnBptG4P99ZCrPA/fp8?=
 =?us-ascii?Q?g1UgTkx0F//SrlrMbaI/v0jnb3F1dt7MmtevGC8Ug1U4S71U98Sy0lColSFc?=
 =?us-ascii?Q?ExnvAK7d1WYvyHnDWY7az9BdzIJ8od3Q4I1E4JXuvdgho9quhWbk4medRizn?=
 =?us-ascii?Q?UKGLIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:28:22.4394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 088c4a54-a3e4-4d56-9154-08de5d1111a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yidong.zhang@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:nishads@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D8118C8BE
X-Rspamd-Action: no action

This patch introduces the communication channel (comm_chan) service, which
enables communication between the management PF driver and the user PF
driver.

The comm_chan service provides a shared-memory-based command channel
located in a BAR-mapped region. The user PF driver issues requests by
writing command messages into this region. The management PF driver
periodically polls the region and process any pending requests.

Supported operations include firmware (xclbin) reloads, where the
management PF invokes 'versal_pci_load_xclbin' to reprogram the embedded
firmware through the remote management queue service.

This service provides the foundation for dynamic firmware updates and other
management requests from the user PFs.

Co-developed-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amd_vpci/Makefile               |   3 +-
 drivers/accel/amd_vpci/versal-pci-comm-chan.c | 295 ++++++++++++++++++
 drivers/accel/amd_vpci/versal-pci-comm-chan.h |  14 +
 drivers/accel/amd_vpci/versal-pci-main.c      |  82 ++++-
 drivers/accel/amd_vpci/versal-pci.h           |   6 +
 5 files changed, 396 insertions(+), 4 deletions(-)
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.h

diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
index bacd305783dd..8adfde3490fd 100644
--- a/drivers/accel/amd_vpci/Makefile
+++ b/drivers/accel/amd_vpci/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
 versal-pci-y := \
 	versal-pci-main.o \
 	versal-pci-rm-queue.o \
-	versal-pci-rm-service.o
+	versal-pci-rm-service.o \
+	versal-pci-comm-chan.o
diff --git a/drivers/accel/amd_vpci/versal-pci-comm-chan.c b/drivers/accel/amd_vpci/versal-pci-comm-chan.c
new file mode 100644
index 000000000000..fef6fff4e501
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-comm-chan.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/pci.h>
+
+#include "versal-pci.h"
+#include "versal-pci-comm-chan.h"
+
+#define COMM_CHAN_PROTOCOL_VERSION		1
+#define COMM_CHAN_PCI_BAR_OFF			0x2000000
+#define COMM_CHAN_TIMER				(HZ / 10)
+#define COMM_CHAN_DATA_LEN			16
+#define COMM_CHAN_DATA_TYPE_MASK		GENMASK(7, 0)
+#define COMM_CHAN_DATA_EOM_MASK			BIT(31)
+#define COMM_CHAN_MSG_END			BIT(31)
+
+#define COMM_CHAN_REG_WRDATA_OFF		0x0
+#define COMM_CHAN_REG_RDDATA_OFF		0x8
+#define COMM_CHAN_REG_STATUS_OFF		0x10
+#define COMM_CHAN_REG_ERROR_OFF			0x14
+#define COMM_CHAN_REG_RIT_OFF			0x1C
+#define COMM_CHAN_REG_IS_OFF			0x20
+#define COMM_CHAN_REG_IE_OFF			0x24
+#define COMM_CHAN_REG_CTRL_OFF			0x2C
+#define COMM_CHAN_REGS_SIZE			SZ_4K
+
+#define COMM_CHAN_IRQ_DISABLE_ALL		0
+#define COMM_CHAN_IRQ_RECEIVE_ENABLE		BIT(1)
+#define COMM_CHAN_IRQ_CLEAR_ALL			GENMASK(2, 0)
+#define COMM_CHAN_CLEAR_FIFO			GENMASK(1, 0)
+#define COMM_CHAN_RECEIVE_THRESHOLD		15
+
+enum comm_chan_req_ops {
+	COMM_CHAN_REQ_OPS_UNKNOWN		= 0,
+	COMM_CHAN_REQ_OPS_HOT_RESET		= 5,
+	COMM_CHAN_REQ_OPS_GET_PROTOCOL_VERSION	= 19,
+	COMM_CHAN_REQ_OPS_LOAD_XCLBIN_UUID	= 20,
+	COMM_CHAN_REQ_OPS_MAX,
+};
+
+enum comm_chan_msg_type {
+	COMM_CHAN_MSG_INVALID			= 0,
+	COMM_CHAN_MSG_START			= 2,
+	COMM_CHAN_MSG_BODY			= 3,
+};
+
+enum comm_chan_msg_service_type {
+	COMM_CHAN_MSG_SRV_RESPONSE		= BIT(0),
+	COMM_CHAN_MSG_SRV_REQUEST		= BIT(1),
+};
+
+struct comm_chan_hw_msg {
+	struct {
+		__u32		type;
+		__u32		payload_size;
+	} header;
+	struct {
+		__u64		id;
+		__u32		flags;
+		__u32		size;
+		__u32		payload[COMM_CHAN_DATA_LEN - 6];
+	} body;
+} __packed;
+
+struct comm_chan_srv_req {
+	__u64			flags;
+	__u32			opcode;
+	__u32			data[];
+};
+
+struct comm_chan_srv_ver_resp {
+	__u32			version;
+};
+
+struct comm_chan_srv_uuid_resp {
+	__u32			ret;
+};
+
+struct comm_chan_msg {
+	__u64			id;
+	__u32			flags;
+	__u32			len;
+	__u32			bytes_read;
+	__u32			data[10];
+};
+
+struct comm_chan_device {
+	struct versal_pci_device	*vdev;
+	struct timer_list		timer;
+	struct work_struct		work;
+};
+
+static inline struct comm_chan_device *to_ccdev_work(struct work_struct *w)
+{
+	return container_of(w, struct comm_chan_device, work);
+}
+
+static inline struct comm_chan_device *to_ccdev_timer(struct timer_list *t)
+{
+	return container_of(t, struct comm_chan_device, timer);
+}
+
+static inline u32 comm_chan_read(struct comm_chan_device *cdev, u32 offset)
+{
+	return readl(cdev->vdev->io_regs + COMM_CHAN_PCI_BAR_OFF + offset);
+}
+
+static inline void comm_chan_write(struct comm_chan_device *cdev, u32 offset, const u32 value)
+{
+	writel(value, cdev->vdev->io_regs + COMM_CHAN_PCI_BAR_OFF + offset);
+}
+
+static u32 comm_chan_set_uuid_resp(void *payload, int ret)
+{
+	struct comm_chan_srv_uuid_resp *resp = (struct comm_chan_srv_uuid_resp *)payload;
+	u32 resp_len = sizeof(*resp);
+
+	resp->ret = (u32)ret;
+
+	return resp_len;
+}
+
+static u32 comm_chan_set_protocol_resp(void *payload)
+{
+	struct comm_chan_srv_ver_resp *resp = (struct comm_chan_srv_ver_resp *)payload;
+	u32 resp_len = sizeof(*resp);
+
+	resp->version = COMM_CHAN_PROTOCOL_VERSION;
+
+	return resp_len;
+}
+
+static void comm_chan_write_response(struct comm_chan_device *ccdev,
+				     struct comm_chan_hw_msg *response,
+				     u64 msg_id, u32 size)
+{
+	response->header.type = COMM_CHAN_MSG_START | COMM_CHAN_MSG_END;
+	response->header.payload_size = size;
+
+	response->body.flags = COMM_CHAN_MSG_SRV_RESPONSE;
+	response->body.size = size;
+	response->body.id = msg_id;
+
+	for (int i = 0; i < COMM_CHAN_DATA_LEN; i++)
+		comm_chan_write(ccdev, COMM_CHAN_REG_WRDATA_OFF, ((u32 *)response)[i]);
+}
+
+static void comm_chan_send_response(struct comm_chan_device *ccdev, u64 msg_id, int ret)
+{
+	struct versal_pci_device *vdev = ccdev->vdev;
+	struct comm_chan_hw_msg response = {0};
+	u32 size;
+
+	vdev_err(vdev, "return response ret: %d", ret);
+	size = comm_chan_set_uuid_resp(response.body.payload, ret);
+
+	comm_chan_write_response(ccdev, &response, msg_id, size);
+}
+
+static void comm_chan_opcode_response(struct comm_chan_device *ccdev, u64 msg_id, void *payload)
+{
+	struct comm_chan_srv_req *req = (struct comm_chan_srv_req *)payload;
+	struct versal_pci_device *vdev = ccdev->vdev;
+	struct comm_chan_hw_msg response = {0};
+	u32 size;
+	int ret;
+
+	switch (req->opcode) {
+	case COMM_CHAN_REQ_OPS_GET_PROTOCOL_VERSION:
+		size = comm_chan_set_protocol_resp(response.body.payload);
+		break;
+	case COMM_CHAN_REQ_OPS_LOAD_XCLBIN_UUID:
+		ret = versal_pci_load_xclbin(vdev, (uuid_t *)req->data);
+		size = comm_chan_set_uuid_resp(response.body.payload, ret);
+		break;
+	default:
+		vdev_err(vdev, "Unsupported request opcode: %d", req->opcode);
+		size = comm_chan_set_uuid_resp(response.body.payload, -EOPNOTSUPP);
+		break;
+	}
+
+	vdev_dbg(vdev, "Response opcode: %d", req->opcode);
+	comm_chan_write_response(ccdev, &response, msg_id, size);
+}
+
+#define STATUS_IS_READY(status) ((status) & BIT(1))
+#define STATUS_IS_ERROR(status) ((status) & BIT(2))
+
+static void comm_chan_check_request(struct work_struct *w)
+{
+	struct comm_chan_device *ccdev = to_ccdev_work(w);
+	u32 status = 0, request[COMM_CHAN_DATA_LEN] = {0};
+	struct comm_chan_hw_msg *hw_msg;
+	u8 type, eom;
+	int i;
+
+	status = comm_chan_read(ccdev, COMM_CHAN_REG_IS_OFF);
+	if (!STATUS_IS_READY(status))
+		return;
+	if (STATUS_IS_ERROR(status)) {
+		vdev_err(ccdev->vdev, "An error has occurred with comms");
+		return;
+	}
+
+	/* ACK status */
+	comm_chan_write(ccdev, COMM_CHAN_REG_IS_OFF, status);
+
+	for (i = 0; i < COMM_CHAN_DATA_LEN; i++)
+		request[i] = comm_chan_read(ccdev, COMM_CHAN_REG_RDDATA_OFF);
+
+	hw_msg = (struct comm_chan_hw_msg *)request;
+	type = FIELD_GET(COMM_CHAN_DATA_TYPE_MASK, hw_msg->header.type);
+	eom = FIELD_GET(COMM_CHAN_DATA_EOM_MASK, hw_msg->header.type);
+
+	/*
+	 * Only support fixed size 64B messages, therefor every msg should
+	 * have EndOfMsg(eom) as 1. Ignore invalid messages.
+	 */
+	if (!eom || type != COMM_CHAN_MSG_START) {
+		vdev_err(ccdev->vdev, "Unsupported eom 0x%x but type 0x%x", eom, type);
+		goto enotsupp;
+	}
+
+	if (hw_msg->body.flags != COMM_CHAN_MSG_SRV_REQUEST) {
+		vdev_err(ccdev->vdev, "Unsupported service request");
+		goto enotsupp;
+	}
+
+	if (hw_msg->body.size > sizeof(hw_msg->body.payload)) {
+		vdev_err(ccdev->vdev, "msg is too big: %d", hw_msg->body.size);
+		goto enotsupp;
+	}
+
+	/* Now decode and respond appropriately */
+	comm_chan_opcode_response(ccdev, hw_msg->body.id, hw_msg->body.payload);
+	return;
+
+enotsupp:
+	comm_chan_send_response(ccdev, hw_msg->body.id, -EOPNOTSUPP);
+}
+
+static void comm_chan_sched_work(struct timer_list *t)
+{
+	struct comm_chan_device *ccdev = to_ccdev_timer(t);
+
+	/* Schedule a work in the general workqueue */
+	schedule_work(&ccdev->work);
+	/* Periodic timer */
+	mod_timer(&ccdev->timer, jiffies + COMM_CHAN_TIMER);
+}
+
+static void comm_chan_config(struct comm_chan_device *ccdev)
+{
+	/* Disable interrupts */
+	comm_chan_write(ccdev, COMM_CHAN_REG_IE_OFF, COMM_CHAN_IRQ_DISABLE_ALL);
+	/* Clear request and response FIFOs */
+	comm_chan_write(ccdev, COMM_CHAN_REG_CTRL_OFF, COMM_CHAN_CLEAR_FIFO);
+	/* Clear interrupts */
+	comm_chan_write(ccdev, COMM_CHAN_REG_IS_OFF, COMM_CHAN_IRQ_CLEAR_ALL);
+	/* Setup RIT reg */
+	comm_chan_write(ccdev, COMM_CHAN_REG_RIT_OFF, COMM_CHAN_RECEIVE_THRESHOLD);
+	/* Enable RIT interrupt */
+	comm_chan_write(ccdev, COMM_CHAN_REG_IE_OFF, COMM_CHAN_IRQ_RECEIVE_ENABLE);
+
+	/* Create and schedule timer to do recurring work */
+	INIT_WORK(&ccdev->work, &comm_chan_check_request);
+	timer_setup(&ccdev->timer, &comm_chan_sched_work, 0);
+	mod_timer(&ccdev->timer, jiffies + COMM_CHAN_TIMER);
+}
+
+void versal_pci_comm_chan_fini(struct comm_chan_device *ccdev)
+{
+	/* First stop scheduling new work then cancel work */
+	timer_delete_sync(&ccdev->timer);
+	cancel_work_sync(&ccdev->work);
+}
+
+struct comm_chan_device *versal_pci_comm_chan_init(struct versal_pci_device *vdev)
+{
+	struct comm_chan_device *ccdev;
+
+	ccdev = devm_kzalloc(&vdev->pdev->dev, sizeof(*ccdev), GFP_KERNEL);
+	if (!ccdev)
+		return ERR_PTR(-ENOMEM);
+
+	ccdev->vdev = vdev;
+
+	comm_chan_config(ccdev);
+	return ccdev;
+}
diff --git a/drivers/accel/amd_vpci/versal-pci-comm-chan.h b/drivers/accel/amd_vpci/versal-pci-comm-chan.h
new file mode 100644
index 000000000000..a6ad3228c3ff
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-comm-chan.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __VERSAL_PCI_COMM_CHAN_H
+#define __VERSAL_PCI_COMM_CHAN_H
+
+struct comm_chan_device *versal_pci_comm_chan_init(struct versal_pci_device *vdev);
+void versal_pci_comm_chan_fini(struct comm_chan_device *ccdev);
+
+#endif	/* __VERSAL_PCI_COMM_CHAN_H */
diff --git a/drivers/accel/amd_vpci/versal-pci-main.c b/drivers/accel/amd_vpci/versal-pci-main.c
index f8d32f9c0e0c..ad3f4645cd5e 100644
--- a/drivers/accel/amd_vpci/versal-pci-main.c
+++ b/drivers/accel/amd_vpci/versal-pci-main.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 
 #include "versal-pci.h"
+#include "versal-pci-comm-chan.h"
 #include "versal-pci-rm-service.h"
 #include "versal-pci-rm-queue.h"
 
@@ -98,6 +99,67 @@ static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
 	return ret;
 }
 
+int versal_pci_load_xclbin(struct versal_pci_device *vdev, uuid_t *xuuid)
+{
+	const char *xclbin_location = "xilinx/xclbins";
+	char fw_name[128];
+	const struct firmware *fw;
+	struct axlf *xclbin;
+	int ret;
+
+	ret = snprintf(fw_name, sizeof(fw_name), "%s/%pUb_%s.xclbin",
+		       xclbin_location, xuuid, vdev->fw_id);
+	if (ret >= sizeof(fw_name)) {
+		vdev_err(vdev, "uuid is too long");
+		return -EINVAL;
+	}
+
+	vdev_info(vdev, "trying to load %s", fw_name);
+	ret = request_firmware(&fw, fw_name, &vdev->pdev->dev);
+	if (ret) {
+		vdev_warn(vdev, "request xclbin fw %s failed %d", fw_name, ret);
+		return ret;
+	}
+
+	xclbin = (struct axlf *)fw->data;
+	if (memcmp(xclbin->magic, VERSAL_XCLBIN_MAGIC_ID, sizeof(VERSAL_XCLBIN_MAGIC_ID))) {
+		vdev_err(vdev, "Invalid fpga firmware");
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!fw->size ||
+	    fw->size != xclbin->header.length ||
+	    fw->size < sizeof(*xclbin)) {
+		vdev_err(vdev, "Invalid xclbin size %zu", fw->size);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!uuid_equal(&vdev->intf_uuid, &xclbin->header.rom_uuid)) {
+		vdev_err(vdev, "base shell doesn't match uuid %pUb", &xclbin->header.uuid);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	ret = versal_pci_upload_fw(vdev, RM_QUEUE_OP_LOAD_XCLBIN,
+				   (char *)xclbin, xclbin->header.length);
+	if (ret) {
+		vdev_err(vdev, "failed to load xclbin %s : %d", fw_name, ret);
+		goto release_firmware;
+	}
+
+	vdev_info(vdev, "Downloaded xclbin %pUb of size %lld Bytes",
+		  &xclbin->header.uuid, xclbin->header.length);
+
+	uuid_copy(&vdev->xclbin_uuid, &xclbin->header.uuid);
+
+release_firmware:
+	release_firmware(fw);
+
+	return ret;
+}
+
 static inline struct versal_pci_device *item_to_vdev(struct config_item *item)
 {
 	return container_of(to_configfs_subsystem(to_config_group(item)),
@@ -160,10 +222,13 @@ static const struct config_item_type versal_pci_cfs_table = {
 static int versal_pci_cfs_init(struct versal_pci_device *vdev)
 {
 	struct configfs_subsystem *subsys = &vdev->cfs_subsys;
+	char dev_name[64];
+
+	snprintf(dev_name, sizeof(dev_name), "%s%x", DRV_NAME, versal_pci_devid(vdev));
 
-	snprintf(subsys->su_group.cg_item.ci_namebuf,
-		 sizeof(subsys->su_group.cg_item.ci_namebuf),
-		 "%s%x", DRV_NAME, versal_pci_devid(vdev));
+	scnprintf(subsys->su_group.cg_item.ci_namebuf,
+		  sizeof(subsys->su_group.cg_item.ci_namebuf),
+		  "%s", dev_name);
 
 	subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
 
@@ -185,6 +250,7 @@ static void versal_pci_device_teardown(struct versal_pci_device *vdev)
 {
 	versal_pci_cfs_fini(&vdev->cfs_subsys);
 	versal_pci_fw_fini(vdev);
+	versal_pci_comm_chan_fini(vdev->ccdev);
 	versal_pci_rm_fini(vdev->rdev);
 }
 
@@ -236,6 +302,13 @@ static int versal_pci_device_setup(struct versal_pci_device *vdev)
 		return ret;
 	}
 
+	vdev->ccdev = versal_pci_comm_chan_init(vdev);
+	if (IS_ERR(vdev->ccdev)) {
+		ret = PTR_ERR(vdev->ccdev);
+		vdev_err(vdev, "Failed to init comm channel, err %d", ret);
+		goto rm_fini;
+	}
+
 	ret = versal_pci_fw_init(vdev);
 	if (ret) {
 		vdev_err(vdev, "Failed to init fw, err %d", ret);
@@ -251,6 +324,9 @@ static int versal_pci_device_setup(struct versal_pci_device *vdev)
 	return 0;
 
 comm_chan_fini:
+	versal_pci_comm_chan_fini(vdev->ccdev);
+
+rm_fini:
 	versal_pci_rm_fini(vdev->rdev);
 	versal_pci_fw_fini(vdev);
 
diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
index 092cac6afa26..ef02cefd8f48 100644
--- a/drivers/accel/amd_vpci/versal-pci.h
+++ b/drivers/accel/amd_vpci/versal-pci.h
@@ -26,6 +26,7 @@
 	dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
 
 struct versal_pci_device;
+struct comm_chan_device;
 struct rm_cmd;
 
 struct axlf_header {
@@ -52,13 +53,18 @@ struct versal_pci_device {
 	struct pci_dev			*pdev;
 
 	struct rm_device		*rdev;
+	struct comm_chan_device         *ccdev;
 	struct fw_info			fw;
 
 	void __iomem			*io_regs;
+	uuid_t				xclbin_uuid;
 	uuid_t				intf_uuid;
 	__u8				fw_id[UUID_STRING_LEN + 1];
 
 	struct configfs_subsystem	cfs_subsys;
 };
 
+/* versal pci driver APIs */
+int versal_pci_load_xclbin(struct versal_pci_device *vdev, uuid_t *xclbin_uuid);
+
 #endif	/* __VERSAL_PCI_H */
-- 
2.34.1

