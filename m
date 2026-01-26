Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCKQKtDAd2nKkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:30:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D368C8FC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC8110E476;
	Mon, 26 Jan 2026 19:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yma5zMFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013027.outbound.protection.outlook.com
 [40.93.196.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF5710E476
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGwKY+ItUSjTyJaTc9jbUiCPhaUYPT5HCeRXYmDodI4lVXPbiLJ5sUlHPYXU+uaCxG5ciiRUCq8F2dXzvx4xeOhsHhNji5U8XfYulBxSCMnqrjsiuU0P+ThZyuEm2g+APQlIfA8zYem7wx3LAoSzoioA+yxBci0VOR1KdSMxft/fUE4all4twk1DP/aIdrgC15JNDTZMI2lpiLOlOWlc83aqmnuUp6Be4cq05EX8rgBgM4xciBUd7+1ga1MvOd3kL6c6zd68kAscjZd8tTsOOMB/jQjOF17RZgMl7XSYlldWBgSSoLtRzUspe3ODO04waDglVIBrEseiK+G54MzF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RySQ3NMfikOsk+UgnZhpjW/KPCZCP73p+H/rDWWGVDU=;
 b=qO6FnqUFvoz6Q1IOAm07aUs1PYilxNJhnwMfvHcpZx+ct6NBaYoCfLMngtsFUY0cWKjM+SVoS4Eii4MDoSo8jBaoM7dpK/yEuidjLnCygRnnlbQzEbVbuQ7L605PfOtZsfYJdQ/7qWZZWzApOHUX9KlObCP5735mlLor0ZaZbBg386cwDd6e7B0LCApChDzMlkmwUMfk8XYRD+5PfYlM5Qb5x3u56Hyl+U1M6z0oq01qXVJ3TFrrMv3HfZ++yuTSCv+JxW5XSYeswd3RbuRool1o8OCxn1OPJHyFaceVqxKrCHsGedBsThyFUtFRsmh1s0sg7dNKf/P4fw05uO/7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RySQ3NMfikOsk+UgnZhpjW/KPCZCP73p+H/rDWWGVDU=;
 b=Yma5zMFWil/eEKjb7OOcDT9gj/4K5ygzEnpTVpc28q05InCGXhoK7K+6+eZCX0Li/9vI3LfdTUHTRzAM+P1iqy41lneSlZ0TRYxJQE5K7Yx4ZICYK4dLmic3E2dN/Nh2TKnHKoWdWp/UZLvfJMW/w2+rtVUgAK6DyvfA6n3cQ/0=
Received: from CH2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:59::16)
 by MN6PR12MB8513.namprd12.prod.outlook.com (2603:10b6:208:472::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 19:30:12 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::2f) by CH2PR03CA0006.outlook.office365.com
 (2603:10b6:610:59::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 19:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:30:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:30:03 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 13:30:03 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Allow forcing IOVA-based DMA via module
 parameter
Date: Mon, 26 Jan 2026 11:30:01 -0800
Message-ID: <20260126193001.1400545-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|MN6PR12MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: a978830d-6bf8-4db9-89eb-08de5d1152e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LDqaaFV7AKoeDRn1nLnl1FztaSp2R77hnWIYD548s288nFG7TYEQ1PzQSHZk?=
 =?us-ascii?Q?K3IH3xJCD1nzxQTR6ibjlxf1UwDgvGM1nBewOThLWm3W/gONFT1DQU7muehq?=
 =?us-ascii?Q?6ZSJ4ACuJwdAHOE75o3UyqN0Guw5bqjud1B/mQVmz2i+5OvizMhpotyDrlXe?=
 =?us-ascii?Q?O0d8VWGnMmh6boFYDJTAMn6fyZw0/OHn8KzvX7BB6yyfiVr0jwPt2k/RlM+0?=
 =?us-ascii?Q?T03/NC+bkERUvXp+7hDODs+SUe1/a/iNqjUp4QYRN2WAv8KtRwksonv8Zede?=
 =?us-ascii?Q?F5Qof3DyR0RVX87U8WVdzqT+ciKIriGKj/Xr+KJIpfjuxBdfSyf4aKUOAYTl?=
 =?us-ascii?Q?n30mzuE8VopKHgHNJNGbKCTutfSp6dmdzDF8GpjmfACajgB89wYKwM6/7EmN?=
 =?us-ascii?Q?+BeFxuMKzT063qlpjHXhAjZ+qI+/ESfJUrnCOHv/vycMWGw4pldaUdrjiS7R?=
 =?us-ascii?Q?YMDWSkhv37iWApMjilXcGhoG5fOGQFKNcp4ucLYl/wteQDjUwUzNLmPWSjMh?=
 =?us-ascii?Q?FWSTPjhwRSANJQhEfeyGN/6Q2euVEea79RPX2WDBHIUlPNnpoS+6BHI1F3t5?=
 =?us-ascii?Q?lDtZItTPdOkS6WTuHl1+2mgaqtM92VIv7sYWMkkfcYBbJ7wkPSRf85vYqwD/?=
 =?us-ascii?Q?mDqLqYAoACS4rrdBzbOXdCgRQmaTuueGjEXxoNulFa5N1NzxKJ7KSFEVT1lJ?=
 =?us-ascii?Q?28pDt3b0rpb88ljpE66sua7uWc5IyP6EBsWxD12he9BmQdDZdrYkamSmhnPg?=
 =?us-ascii?Q?MVEbALk7qNmgJ8Y2mDeCsy/P/xwJwywezIzd04YzbqVXBiDAubYKw4vdfzoQ?=
 =?us-ascii?Q?xMZOYuAylGLo8SCoitscuvq+co+Ge31wSU5lzyPgzJAmG0GuZG7FM4reNx9A?=
 =?us-ascii?Q?9LYjLbWhbjZC6YdqhMXGJ4vKc9+gLL/yUfKbr/Bhls1GtH52/hpPSqNLhw81?=
 =?us-ascii?Q?u8LiawZ0uwhrBRzbJaSVXz0dXwb3s5ZLJDAUx+ldf8tsAul4TJbN6nRphA9p?=
 =?us-ascii?Q?j7Z579F//sUYfERN7JO3b6KPyz4Q/EUWIsw9XF+EiROINK3LKqKmzUn+sl/I?=
 =?us-ascii?Q?3nnDrT1FoRHR75wQ52yM0CnujRM5wToLxCEq8h+qPLRknsmkfR43VHxd/Nlv?=
 =?us-ascii?Q?iKTLjRgSJAlgp+mx7Qc7KJIap+2/xrvTIn/DXQCzsklqKSuSD+YV/JJc9qKy?=
 =?us-ascii?Q?sPMa0Iufd5AubtHUgE2a7DkzRqC5bL0zYXURLxI/LM6lPYPYgZdxkjTNw9CX?=
 =?us-ascii?Q?2NK6V/kkq7m6BmNdHE8CZxwqfb7H3bqfNBTHYXJgL1gMpjkypE3nAXdrEsSg?=
 =?us-ascii?Q?k+J5kz1UVA7/VFt0jKU++CLBJ/4f9NHUfJuvnVaj7Ud3pzLM6pLf7HcJZJdX?=
 =?us-ascii?Q?n5idOp+g+iXFwT8+kvSmkIW6YiZNhH+I0troN00UoluHVsPOKGtzKW/GfpB6?=
 =?us-ascii?Q?JPV/juoi3yDT9tYtF1apDIXWtnDW96Z4GCD3TfHSNbHn+1E74DN/wuP/c/zR?=
 =?us-ascii?Q?BQXVHuWZr3NBUhrjhHwNvvrUHHPCYavMt9nO25iSjddiW12wYtNxbjH14eZm?=
 =?us-ascii?Q?5mn+usc0aSo6eTBoP+xQLjzdL2kpwhj+krnFEssjnAcAW2wwl2YL4oruwmmn?=
 =?us-ascii?Q?OD++taB3XU2pOknSkQvssxTSrJgD93YXAo6Nvdl5Z4hZKtLt2Y7VwFWJKQkq?=
 =?us-ascii?Q?uqAIQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:30:11.9219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a978830d-6bf8-4db9-89eb-08de5d1152e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8513
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
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19D368C8FC
X-Rspamd-Action: no action

The amdxdna driver normally performs DMA using userspace virtual address
plus PASID. For debugging and validation purposes, add a module parameter,
force_iova, to force DMA to go through IOMMU IOVA mapping.

When force_iova=1 is set, the driver will allocate and map DMA buffers
using IOVA.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
v2:
  Add lock for abo->ref
  Add warning when force_iova is on

 drivers/accel/amdxdna/Makefile          |   1 +
 drivers/accel/amdxdna/aie2_ctx.c        |   6 +-
 drivers/accel/amdxdna/aie2_error.c      |   5 +-
 drivers/accel/amdxdna/aie2_message.c    |  30 +++-
 drivers/accel/amdxdna/aie2_pci.h        |   5 +-
 drivers/accel/amdxdna/amdxdna_gem.c     |  45 +++++-
 drivers/accel/amdxdna/amdxdna_gem.h     |  10 ++
 drivers/accel/amdxdna/amdxdna_iommu.c   | 184 ++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  47 +++---
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  24 ++++
 10 files changed, 325 insertions(+), 32 deletions(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_iommu.c

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 3fa0e74fd8f5..cf9bf19dedb9 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -11,6 +11,7 @@ amdxdna-y := \
 	aie2_solver.o \
 	amdxdna_ctx.o \
 	amdxdna_gem.o \
+	amdxdna_iommu.o \
 	amdxdna_mailbox.o \
 	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5511ab2ef242..3c1173eca43a 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -78,7 +78,8 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
 	}
 
 	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
-				heap->mem.userptr, heap->mem.size);
+				amdxdna_obj_dma_addr(hwctx->client, heap),
+				heap->mem.size);
 	if (ret) {
 		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
 		goto out;
@@ -650,7 +651,8 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	}
 
 	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
-				heap->mem.userptr, heap->mem.size);
+				amdxdna_obj_dma_addr(hwctx->client, heap),
+				heap->mem.size);
 	if (ret) {
 		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
 		goto release_resource;
diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index 5e82df2b7cf6..2966b7e34a96 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -355,9 +355,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 		return -ENOMEM;
 
 	events->buf = aie2_alloc_msg_buffer(ndev, &total_size, &events->addr);
-
-	if (!events->buf) {
-		ret = -ENOMEM;
+	if (IS_ERR(events->buf)) {
+		ret = PTR_ERR(events->buf);
 		goto free_events;
 	}
 	events->size = total_size;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 99215328505e..a590b3ed4d80 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -64,11 +64,27 @@ void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
 	*size = max(*size, SZ_8K);
 	order = get_order(*size);
 	if (order > MAX_PAGE_ORDER)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	*size = PAGE_SIZE << order;
 
+	if (amdxdna_iova_on(xdna))
+		return amdxdna_iommu_alloc(xdna, *size, dma_addr);
+
 	return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
-				     DMA_FROM_DEVICE, GFP_KERNEL);
+				      DMA_FROM_DEVICE, GFP_KERNEL);
+}
+
+void aie2_free_msg_buffer(struct amdxdna_dev_hdl *ndev, size_t size,
+			  void *cpu_addr, dma_addr_t dma_addr)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+
+	if (amdxdna_iova_on(xdna)) {
+		amdxdna_iommu_free(xdna, size, cpu_addr, dma_addr);
+		return;
+	}
+
+	dma_free_noncoherent(xdna->ddev.dev, size, cpu_addr, dma_addr, DMA_FROM_DEVICE);
 }
 
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
@@ -257,7 +273,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	req.num_col = hwctx->num_col;
 	req.num_unused_col = hwctx->num_unused_col;
 	req.num_cq_pairs_requested = 1;
-	req.pasid = hwctx->client->pasid;
+	req.pasid = amdxdna_pasid_on(hwctx->client) ? hwctx->client->pasid : 0;
 	req.context_priority = aie2_get_context_priority(ndev, hwctx);
 
 	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
@@ -369,8 +385,8 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	int ret;
 
 	buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
-	if (!buff_addr)
-		return -ENOMEM;
+	if (IS_ERR(buff_addr))
+		return PTR_ERR(buff_addr);
 
 	/* Go through each hardware context and mark the AIE columns that are active */
 	list_for_each_entry(client, &xdna->client_list, node)
@@ -425,8 +441,8 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
 		return -EINVAL;
 
 	addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
-	if (!addr)
-		return -ENOMEM;
+	if (IS_ERR(addr))
+		return PTR_ERR(addr);
 
 	req.buf_addr = dma_addr;
 	req.buf_size = buf_sz;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index b20a3661078c..18c252690d9c 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -337,9 +337,8 @@ int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *
 			 int (*notify_cb)(void *, void __iomem *, size_t));
 void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
 			    dma_addr_t *dma_addr);
-#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)		\
-	dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,	\
-			     dma_addr, DMA_FROM_DEVICE)
+void aie2_free_msg_buffer(struct amdxdna_dev_hdl *ndev, size_t size,
+			  void *cpu_addr, dma_addr_t dma_addr);
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index dfa916eeb2d9..36eaf0ae5841 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -477,12 +477,50 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 	drm_gem_shmem_free(&abo->base);
 }
 
+static int amdxdna_gem_obj_open(struct drm_gem_object *gobj, struct drm_file *filp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	int ret;
+
+	guard(mutex)(&abo->lock);
+	if (abo->ref) {
+		abo->ref++;
+		return 0;
+	}
+
+	if (amdxdna_iova_on(xdna)) {
+		ret = amdxdna_iommu_map_bo(xdna, abo);
+		if (ret)
+			return ret;
+	}
+	abo->ref++;
+
+	return 0;
+}
+
+static void amdxdna_gem_obj_close(struct drm_gem_object *gobj, struct drm_file *filp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+
+	guard(mutex)(&abo->lock);
+	abo->ref--;
+	if (abo->ref)
+		return;
+
+	if (amdxdna_iova_on(xdna))
+		amdxdna_iommu_unmap_bo(xdna, abo);
+}
+
 static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
 	.free = amdxdna_gem_dev_obj_free,
 };
 
 static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.free = amdxdna_gem_obj_free,
+	.open = amdxdna_gem_obj_open,
+	.close = amdxdna_gem_obj_close,
 	.print_info = drm_gem_shmem_object_print_info,
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
@@ -509,6 +547,7 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
 
 	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
 	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
+	abo->mem.dma_addr = AMDXDNA_INVALID_ADDR;
 	abo->mem.size = size;
 	INIT_LIST_HEAD(&abo->mem.umap_list);
 
@@ -624,6 +663,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 	abo = to_xdna_obj(gobj);
 	abo->attach = attach;
 	abo->dma_buf = dma_buf;
+	abo->type = AMDXDNA_BO_SHMEM;
 
 	return gobj;
 
@@ -906,7 +946,10 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
 
 	abo = to_xdna_obj(gobj);
 	args->vaddr = abo->mem.userptr;
-	args->xdna_addr = abo->mem.dev_addr;
+	if (abo->mem.dev_addr != AMDXDNA_INVALID_ADDR)
+		args->xdna_addr = abo->mem.dev_addr;
+	else
+		args->xdna_addr = abo->mem.dma_addr;
 
 	if (abo->type != AMDXDNA_BO_DEV)
 		args->map_offset = drm_vma_node_offset_addr(&gobj->vma_node);
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index f79fc7f3c93b..fbeb622e7cf9 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -6,7 +6,9 @@
 #ifndef _AMDXDNA_GEM_H_
 #define _AMDXDNA_GEM_H_
 
+#include <drm/drm_gem_shmem_helper.h>
 #include <linux/hmm.h>
+#include <linux/iova.h>
 #include "amdxdna_pci_drv.h"
 
 struct amdxdna_umap {
@@ -25,6 +27,7 @@ struct amdxdna_mem {
 	u64				userptr;
 	void				*kva;
 	u64				dev_addr;
+	u64				dma_addr;
 	size_t				size;
 	struct page			**pages;
 	u32				nr_pages;
@@ -39,6 +42,7 @@ struct amdxdna_gem_obj {
 	bool				pinned;
 	struct mutex			lock; /* Protects: pinned */
 	struct amdxdna_mem		mem;
+	u32				ref;
 
 	/* Below members is uninitialized when needed */
 	struct drm_mm			mm; /* For AMDXDNA_BO_DEV_HEAP */
@@ -68,6 +72,12 @@ static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj *abo)
 	return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
 }
 
+static inline u64 amdxdna_obj_dma_addr(struct amdxdna_client *client,
+				       struct amdxdna_gem_obj *abo)
+{
+	return amdxdna_pasid_on(client) ? abo->mem.userptr : abo->mem.dma_addr;
+}
+
 void amdxdna_umap_put(struct amdxdna_umap *mapp);
 
 struct drm_gem_object *
diff --git a/drivers/accel/amdxdna/amdxdna_iommu.c b/drivers/accel/amdxdna/amdxdna_iommu.c
new file mode 100644
index 000000000000..4626434d4180
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_iommu.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+
+#include "amdxdna_gem.h"
+#include "amdxdna_pci_drv.h"
+
+static bool force_iova;
+module_param(force_iova, bool, 0600);
+MODULE_PARM_DESC(force_iova, "Force use IOVA (Default false)");
+
+static struct iova *amdxdna_iommu_alloc_iova(struct amdxdna_dev *xdna,
+					     size_t size,
+					     dma_addr_t *dma_addr,
+					     bool size_aligned)
+{
+	unsigned long shift, end;
+	struct iova *iova;
+
+	end = xdna->domain->geometry.aperture_end;
+	shift = iova_shift(&xdna->iovad);
+	size = iova_align(&xdna->iovad, size);
+
+	iova = alloc_iova(&xdna->iovad, size >> shift, end >> shift, size_aligned);
+	if (!iova)
+		return ERR_PTR(-ENOMEM);
+
+	*dma_addr = iova_dma_addr(&xdna->iovad, iova);
+
+	return iova;
+}
+
+int amdxdna_iommu_map_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo)
+{
+	struct sg_table *sgt;
+	dma_addr_t dma_addr;
+	struct iova *iova;
+	size_t size;
+
+	if (abo->type != AMDXDNA_BO_DEV_HEAP && abo->type != AMDXDNA_BO_SHMEM)
+		return 0;
+
+	sgt = drm_gem_shmem_get_pages_sgt(&abo->base);
+	if (IS_ERR(sgt)) {
+		XDNA_ERR(xdna, "Get sgt failed, ret %ld", PTR_ERR(sgt));
+		return PTR_ERR(sgt);
+	}
+
+	if (!sgt->orig_nents || !sg_page(sgt->sgl)) {
+		XDNA_ERR(xdna, "sgl is zero length or not page backed");
+		return -EOPNOTSUPP;
+	}
+
+	iova = amdxdna_iommu_alloc_iova(xdna, abo->mem.size, &dma_addr,
+					(abo->type == AMDXDNA_BO_DEV_HEAP));
+	if (IS_ERR(iova)) {
+		XDNA_ERR(xdna, "Alloc iova failed, ret %ld", PTR_ERR(iova));
+		return PTR_ERR(iova);
+	}
+
+	size = iommu_map_sgtable(xdna->domain, dma_addr, sgt,
+				 IOMMU_READ | IOMMU_WRITE);
+	if (size < abo->mem.size) {
+		__free_iova(&xdna->iovad, iova);
+		return -ENXIO;
+	}
+
+	abo->mem.dma_addr = dma_addr;
+
+	return 0;
+}
+
+void amdxdna_iommu_unmap_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo)
+{
+	size_t size;
+
+	if (abo->mem.dma_addr == AMDXDNA_INVALID_ADDR)
+		return;
+
+	size = iova_align(&xdna->iovad, abo->mem.size);
+	iommu_unmap(xdna->domain, abo->mem.dma_addr, size);
+	free_iova(&xdna->iovad, iova_pfn(&xdna->iovad, abo->mem.dma_addr));
+	abo->mem.dma_addr = AMDXDNA_INVALID_ADDR;
+}
+
+void *amdxdna_iommu_alloc(struct amdxdna_dev *xdna, size_t size, dma_addr_t *dma_addr)
+{
+	struct iova *iova;
+	void *cpu_addr;
+	int ret;
+
+	iova = amdxdna_iommu_alloc_iova(xdna, size, dma_addr, true);
+	if (IS_ERR(iova)) {
+		XDNA_ERR(xdna, "Alloc iova failed, ret %ld", PTR_ERR(iova));
+		return iova;
+	}
+
+	cpu_addr = (void *)__get_free_pages(GFP_KERNEL, get_order(size));
+	if (!cpu_addr) {
+		ret = -ENOMEM;
+		goto free_iova;
+	}
+
+	ret = iommu_map(xdna->domain, *dma_addr, virt_to_phys(cpu_addr),
+			iova_align(&xdna->iovad, size),
+			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	if (ret)
+		goto free_iova;
+
+	return cpu_addr;
+
+free_iova:
+	__free_iova(&xdna->iovad, iova);
+	return ERR_PTR(ret);
+}
+
+void amdxdna_iommu_free(struct amdxdna_dev *xdna, size_t size,
+			void *cpu_addr, dma_addr_t dma_addr)
+{
+	iommu_unmap(xdna->domain, dma_addr, iova_align(&xdna->iovad, size));
+	free_iova(&xdna->iovad, iova_pfn(&xdna->iovad, dma_addr));
+	free_pages((unsigned long)cpu_addr, get_order(size));
+}
+
+int amdxdna_iommu_init(struct amdxdna_dev *xdna)
+{
+	unsigned long order;
+	int ret;
+
+	xdna->group = iommu_group_get(xdna->ddev.dev);
+	if (!xdna->group || !force_iova)
+		return 0;
+
+	XDNA_WARN(xdna, "Enabled force_iova mode.");
+	xdna->domain = iommu_paging_domain_alloc_flags(xdna->ddev.dev,
+						       IOMMU_HWPT_ALLOC_PASID);
+	if (IS_ERR(xdna->domain)) {
+		XDNA_ERR(xdna, "Failed to alloc iommu domain");
+		ret = PTR_ERR(xdna->domain);
+		goto put_group;
+	}
+
+	ret = iova_cache_get();
+	if (ret)
+		goto free_domain;
+
+	order = __ffs(xdna->domain->pgsize_bitmap);
+	init_iova_domain(&xdna->iovad, 1UL << order, 0);
+
+	ret = iommu_attach_group(xdna->domain, xdna->group);
+	if (ret)
+		goto put_iova;
+
+	return 0;
+
+put_iova:
+	put_iova_domain(&xdna->iovad);
+	iova_cache_put();
+free_domain:
+	iommu_domain_free(xdna->domain);
+put_group:
+	iommu_group_put(xdna->group);
+	xdna->domain = NULL;
+
+	return ret;
+}
+
+void amdxdna_iommu_fini(struct amdxdna_dev *xdna)
+{
+	if (xdna->domain) {
+		iommu_detach_group(xdna->domain, xdna->group);
+		put_iova_domain(&xdna->iovad);
+		iova_cache_put();
+		iommu_domain_free(xdna->domain);
+	}
+
+	if (xdna->group)
+		iommu_group_put(xdna->group);
+}
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 45f5c12fc67f..ed5fe643293d 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -69,18 +69,21 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 
 	client->pid = pid_nr(rcu_access_pointer(filp->pid));
 	client->xdna = xdna;
-
-	client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
-	if (IS_ERR(client->sva)) {
-		ret = PTR_ERR(client->sva);
-		XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
-		goto failed;
-	}
-	client->pasid = iommu_sva_get_pasid(client->sva);
-	if (client->pasid == IOMMU_PASID_INVALID) {
-		XDNA_ERR(xdna, "SVA get pasid failed");
-		ret = -ENODEV;
-		goto unbind_sva;
+	client->pasid = IOMMU_PASID_INVALID;
+
+	if (!amdxdna_iova_on(xdna)) {
+		client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
+		if (IS_ERR(client->sva)) {
+			ret = PTR_ERR(client->sva);
+			XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
+			goto failed;
+		}
+		client->pasid = iommu_sva_get_pasid(client->sva);
+		if (client->pasid == IOMMU_PASID_INVALID) {
+			XDNA_ERR(xdna, "SVA get pasid failed");
+			ret = -ENODEV;
+			goto unbind_sva;
+		}
 	}
 	init_srcu_struct(&client->hwctx_srcu);
 	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
@@ -97,7 +100,8 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	return 0;
 
 unbind_sva:
-	iommu_sva_unbind_device(client->sva);
+	if (!IS_ERR_OR_NULL(client->sva))
+		iommu_sva_unbind_device(client->sva);
 failed:
 	kfree(client);
 
@@ -115,7 +119,8 @@ static void amdxdna_client_cleanup(struct amdxdna_client *client)
 	if (client->dev_heap)
 		drm_gem_object_put(to_gobj(client->dev_heap));
 
-	iommu_sva_unbind_device(client->sva);
+	if (!IS_ERR_OR_NULL(client->sva))
+		iommu_sva_unbind_device(client->sva);
 
 	kfree(client);
 }
@@ -275,9 +280,15 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		fs_reclaim_release(GFP_KERNEL);
 	}
 
+	ret = amdxdna_iommu_init(xdna);
+	if (ret)
+		return ret;
+
 	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", WQ_MEM_RECLAIM);
-	if (!xdna->notifier_wq)
-		return -ENOMEM;
+	if (!xdna->notifier_wq) {
+		ret = -ENOMEM;
+		goto iommu_fini;
+	}
 
 	mutex_lock(&xdna->dev_lock);
 	ret = xdna->dev_info->ops->init(xdna);
@@ -309,6 +320,8 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mutex_unlock(&xdna->dev_lock);
 destroy_notifier_wq:
 	destroy_workqueue(xdna->notifier_wq);
+iommu_fini:
+	amdxdna_iommu_fini(xdna);
 	return ret;
 }
 
@@ -334,6 +347,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
 
 	xdna->dev_info->ops->fini(xdna);
 	mutex_unlock(&xdna->dev_lock);
+
+	amdxdna_iommu_fini(xdna);
 }
 
 static const struct dev_pm_ops amdxdna_pm_ops = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 6580cb5ec7e2..231f8c127781 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -6,7 +6,10 @@
 #ifndef _AMDXDNA_PCI_DRV_H_
 #define _AMDXDNA_PCI_DRV_H_
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_print.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 
@@ -101,6 +104,10 @@ struct amdxdna_dev {
 	struct amdxdna_fw_ver		fw_ver;
 	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
 	struct workqueue_struct		*notifier_wq;
+
+	struct iommu_group		*group;
+	struct iommu_domain		*domain;
+	struct iova_domain		iovad;
 };
 
 /*
@@ -144,4 +151,21 @@ extern const struct amdxdna_dev_info dev_npu6_info;
 int amdxdna_sysfs_init(struct amdxdna_dev *xdna);
 void amdxdna_sysfs_fini(struct amdxdna_dev *xdna);
 
+int amdxdna_iommu_init(struct amdxdna_dev *xdna);
+void amdxdna_iommu_fini(struct amdxdna_dev *xdna);
+int amdxdna_iommu_map_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo);
+void amdxdna_iommu_unmap_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo);
+void *amdxdna_iommu_alloc(struct amdxdna_dev *xdna, size_t size, dma_addr_t *dma_addr);
+void amdxdna_iommu_free(struct amdxdna_dev *xdna, size_t size,
+			void *cpu_addr, dma_addr_t dma_addr);
+
+static inline bool amdxdna_iova_on(struct amdxdna_dev *xdna)
+{
+	return !!xdna->domain;
+}
+
+static inline bool amdxdna_pasid_on(struct amdxdna_client *client)
+{
+	return client->pasid != IOMMU_PASID_INVALID;
+}
 #endif /* _AMDXDNA_PCI_DRV_H_ */
-- 
2.34.1

