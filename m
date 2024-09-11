Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45B9759ED
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA410EA6C;
	Wed, 11 Sep 2024 18:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FfuLoohA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313A10EA6B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atnbUwUbfrx95jHePketYXQrHNM8TgdJgIhFZ6RdveSyR4UIIlQ7H1e0i71zW38/fVw78wzYd+yFe18YdFguUIb1Mk109fJHNFwAHMI2aJH071pQ2muL7dNp3vBuzXHMM9/bbgHjLPkjS3qAXOKQRpaJZiJ2JL0YcpMvOd9o5OWr6di99C7+7XpckN4OCMY7VbzzZ/6G2fpDkx03UEUNkybUEImp8BUbbeLdQDJOkxD94ErXd8UFrSUb4FhAXLJ3mAYq/Mvc+wmFhxnq70L7w5S4CLmlp3bl5sOOouuuJ2rvyYXd3bd/UcDZJrpt0FmmgL2n09xAOgnV8M6nnl53pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcbJbIyVhLC3lSDuPjySvuAwXBu1+JE2SJw7Ifb5Mfo=;
 b=AQWqoSYdhBDYNDvIfnqDmLmVXA3SBYdzts1jH7/vSf/cdoIuyNaGOTwvGefrA0AQpgRul204aOdyzrj3HVeSVKtldr7Kdu5NMIPC8zZQsKMOha9T7xVjXkbaZEDRCU7cF8EPI/mKwgghIq9UrBLjGfn/TMv2a5+X1uqyfozVl90R3aLBUaKsoy3wEqy45X5aVt4UP8AHYRP22xNj+yroNA+jZabe6B91jaLtrwb/8XAaKmsNnOBZTh9Qbs8ciMuDH/TqHhM4qoqNuwyXC49pwO/XHzBc8gsUbnj1sp2XodQg4Rju94E92ej/saTBf7wcKKYUcEhAKGMIwonh264d9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcbJbIyVhLC3lSDuPjySvuAwXBu1+JE2SJw7Ifb5Mfo=;
 b=FfuLoohACu5qmFntIpOtikdVq7dMmdbpPhr6V+1eOI9gX6PBANzRp3dfNNxh9WUZQMqvVwrL8DYSlepLe7uxj7YzXkKMS3H4bHBnQAGNhxqAcHb2M3Exkt4qsjEBUsHADSbi/JH7GUlcNF0xZ1Ro7IyB1lFIGF6lFyCcgiQxnLM=
Received: from BN8PR15CA0020.namprd15.prod.outlook.com (2603:10b6:408:c0::33)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 18:06:25 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::c6) by BN8PR15CA0020.outlook.office365.com
 (2603:10b6:408:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 18:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 18:06:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:24 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 13:06:24 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V3 04/11] accel/amdxdna: Add hardware resource solver
Date: Wed, 11 Sep 2024 11:05:57 -0700
Message-ID: <20240911180604.1834434-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911180604.1834434-1-lizhi.hou@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec2fc2e-e434-41aa-c07b-08dcd28c73a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/gWRbJwF/yZpaj11OOzi2YjDXaLXOQVlqwpIonX82sMqOJy6zj/8GqJFjY1T?=
 =?us-ascii?Q?YPNnJ+lAdE7BZ9Fpi+JCT15SmT4ZgJ5hmK/df/lHGTNL0P5Fk67mZWJanHfY?=
 =?us-ascii?Q?DsmSt7be7N+clyKy3AiFhhIq1ubEKv2X1ChDSYJb02C2+a9MekebPbVVnHds?=
 =?us-ascii?Q?AWD0wcJ+Act4ZyDpC251DFIrmNl6pMNmoiugOHSG+uFDhrngdftGEf1uFBjN?=
 =?us-ascii?Q?FdtaSulhYcHEFASo6nwN3FX+1Bdcr1LSY/sCOaDBqyuOQE7TDdEKM63x9i4V?=
 =?us-ascii?Q?1gPBCWRVHgkBlluf3/z+J+83DqD6ZwDjeN0/to9koklqFOEHh+OjdHssHe8J?=
 =?us-ascii?Q?G++ge0zIXHVsqzJvgsKOxnnxMFttkfY3dwUIWjHezsEMInRP2rCFcMrnB59+?=
 =?us-ascii?Q?NWD0v5GoZhIJFeUujA/+okCJI06DhzfpJCUI63u0HhlN/I+cuY1SG5qechuM?=
 =?us-ascii?Q?o3U1q0pvxYbqE/IYOM8ZHuGVPiPBGPmYOjiLwIoYyNsa2Q0nXe8dHlEBqT6T?=
 =?us-ascii?Q?gEYykadVwaWaee1o1tGaXGqYlDdWlbsw6igfaD0OzOsEAvcKHhfXWm5b2obw?=
 =?us-ascii?Q?8hlX2R5AuyZqkS3KT/cuvRlPqcfruySrrfAmxwamXDsfYhylA3txyMZcBMGB?=
 =?us-ascii?Q?JOvg8wicXX2Bso7PROr3FH6fhTjpDAo8jqAD7ohFAVc7ZRYZRcc6e85myb7Z?=
 =?us-ascii?Q?OLwa+xvKfcYzREzkPCKN6bZnMEgs3+MyrLSFA9aJONbO84BXs3LwC4W5FskL?=
 =?us-ascii?Q?TxbvUY3riAtdbJUmtw3JPr9FbdwqZIv/raOzKEw1v88R+kk28iFtvXX429Vw?=
 =?us-ascii?Q?9HjDGPBdfL/CiW4UgDazwOmaITvMKkKOYkxVcBOe11VqEkTGqmMoLZDQCWrU?=
 =?us-ascii?Q?vMzMNV04/EOeiA/+6E9BO5hNllnsleB88jdrx1W14PnB9j6+AwmKHOvuWyoh?=
 =?us-ascii?Q?4Yt8dQL1rv5XxXF+4WFtCwgoURel9kUlGP+iCZ2/f9C0+NlBb3Hkdp4Ts5Im?=
 =?us-ascii?Q?jtH3IY1bVUROxqgarIVHcLzq3N4j5Li0KzlebQ/5XtACtnqpsOBd8YKt7uCi?=
 =?us-ascii?Q?12znHvhOClavMemSqwm9S6cVzb28fo1GI4BjaKnd1vFqOLPEm0/ivVMWKaqQ?=
 =?us-ascii?Q?FDeHVNBeSYe8IW7R9dImwq/22e+DVILBr+0qC9UJb1OcJzFSHn1I/diYljXl?=
 =?us-ascii?Q?3HsgUoCyTYxz/qG8MdVk4YVCcnVOe4/caHIwglK3cmN/LFj/dpsnoqAsHu1z?=
 =?us-ascii?Q?SNAeCgPyab5D0ad5FDHAAh1jlg524nXouQTi9pPG3eHEnN2hkaiu3a4JgHWQ?=
 =?us-ascii?Q?zFwySF7OGlG6ddWudJ7wlB/wbEwcy4amuTNqezFRI82xsQXH29P1A3ooBYq3?=
 =?us-ascii?Q?ac3TsFU2S9QPzgDWFGzo0cqzThKr9/b82gkoNADqV12I1bI9Bc9OgpvzK48y?=
 =?us-ascii?Q?jnffhNBsK44BzLWWzNs+u0+j6J4K7YLs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 18:06:25.6039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec2fc2e-e434-41aa-c07b-08dcd28c73a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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

The AI Engine consists of 2D array of tiles arranged as columns. Provides
the basic column allocation and release functions for the tile columns.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile          |   1 +
 drivers/accel/amdxdna/aie2_pci.c        |  23 +-
 drivers/accel/amdxdna/aie2_solver.c     | 330 ++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_solver.h     | 154 +++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 5 files changed, 508 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 1b4e78b43b44..39d3404fbc8f 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -5,6 +5,7 @@ amdxdna-y := \
 	aie2_pci.o \
 	aie2_psp.o \
 	aie2_smu.o \
+	aie2_solver.o \
 	amdxdna_mailbox.o \
 	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 490c36d94f50..fc1e5b2107d8 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -16,6 +16,11 @@
 #include "amdxdna_pci_drv.h"
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
+#include "aie2_solver.h"
+
+int aie2_max_col = XRS_MAX_COL;
+module_param(aie2_max_col, uint, 0600);
+MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
 
 /*
  * The management mailbox channel is allocated by firmware.
@@ -306,6 +311,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	struct init_config xrs_cfg = { 0 };
 	struct amdxdna_dev_hdl *ndev;
 	struct psp_config psp_conf;
 	const struct firmware *fw;
@@ -406,7 +412,22 @@ static int aie2_init(struct amdxdna_dev *xdna)
 		XDNA_ERR(xdna, "Query firmware failed, ret %d", ret);
 		goto stop_hw;
 	}
-	ndev->total_col = ndev->metadata.cols;
+	ndev->total_col = min(aie2_max_col, ndev->metadata.cols);
+
+	xrs_cfg.clk_list.num_levels = 3;
+	xrs_cfg.clk_list.cu_clk_list[0] = 0;
+	xrs_cfg.clk_list.cu_clk_list[1] = 800;
+	xrs_cfg.clk_list.cu_clk_list[2] = 1000;
+	xrs_cfg.sys_eff_factor = 1;
+	xrs_cfg.ddev = &xdna->ddev;
+	xrs_cfg.total_col = ndev->total_col;
+
+	xdna->xrs_hdl = xrsm_init(&xrs_cfg);
+	if (!xdna->xrs_hdl) {
+		XDNA_ERR(xdna, "Initialize resolver failed");
+		ret = -EINVAL;
+		goto stop_hw;
+	}
 
 	release_firmware(fw);
 	return 0;
diff --git a/drivers/accel/amdxdna/aie2_solver.c b/drivers/accel/amdxdna/aie2_solver.c
new file mode 100644
index 000000000000..a537c66589a4
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_solver.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+
+#include "aie2_solver.h"
+
+struct partition_node {
+	struct list_head	list;
+	u32			nshared;	/* # shared requests */
+	u32			start_col;	/* start column */
+	u32			ncols;		/* # columns */
+	bool			exclusive;	/* can not be shared if set */
+};
+
+struct solver_node {
+	struct list_head	list;
+	u64			rid;		/* Request ID from consumer */
+
+	struct partition_node	*pt_node;
+	void			*cb_arg;
+	u32			cols_len;
+	u32			start_cols[] __counted_by(cols_len);
+};
+
+struct solver_rgroup {
+	u32				rgid;
+	u32				nnode;
+	u32				npartition_node;
+
+	DECLARE_BITMAP(resbit, XRS_MAX_COL);
+	struct list_head		node_list;
+	struct list_head		pt_node_list;
+};
+
+struct solver_state {
+	struct solver_rgroup		rgp;
+	struct init_config		cfg;
+	struct xrs_action_ops		*actions;
+};
+
+static u32 calculate_gops(struct aie_qos *rqos)
+{
+	u32 service_rate = 0;
+
+	if (rqos->latency)
+		service_rate = (1000 / rqos->latency);
+
+	if (rqos->fps > service_rate)
+		return rqos->fps * rqos->gops;
+
+	return service_rate * rqos->gops;
+}
+
+/*
+ * qos_meet() - Check the QOS request can be met.
+ */
+static int qos_meet(struct solver_state *xrs, struct aie_qos *rqos, u32 cgops)
+{
+	u32 request_gops = calculate_gops(rqos) * xrs->cfg.sys_eff_factor;
+
+	if (request_gops <= cgops)
+		return 0;
+
+	return -EINVAL;
+}
+
+/*
+ * sanity_check() - Do a basic sanity check on allocation request.
+ */
+static int sanity_check(struct solver_state *xrs, struct alloc_requests *req)
+{
+	struct cdo_parts *cdop = &req->cdo;
+	struct aie_qos *rqos = &req->rqos;
+	u32 cu_clk_freq;
+
+	if (cdop->ncols > xrs->cfg.total_col)
+		return -EINVAL;
+
+	/*
+	 * We can find at least one CDOs groups that meet the
+	 * GOPs requirement.
+	 */
+	cu_clk_freq = xrs->cfg.clk_list.cu_clk_list[xrs->cfg.clk_list.num_levels - 1];
+
+	if (qos_meet(xrs, rqos, cdop->qos_cap.opc * cu_clk_freq / 1000))
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct solver_node *rg_search_node(struct solver_rgroup *rgp, u64 rid)
+{
+	struct solver_node *node;
+
+	list_for_each_entry(node, &rgp->node_list, list) {
+		if (node->rid == rid)
+			return node;
+	}
+
+	return NULL;
+}
+
+static void remove_partition_node(struct solver_rgroup *rgp,
+				  struct partition_node *pt_node)
+{
+	pt_node->nshared--;
+	if (pt_node->nshared > 0)
+		return;
+
+	list_del(&pt_node->list);
+	rgp->npartition_node--;
+
+	bitmap_clear(rgp->resbit, pt_node->start_col, pt_node->ncols);
+	kfree(pt_node);
+}
+
+static void remove_solver_node(struct solver_rgroup *rgp,
+			       struct solver_node *node)
+{
+	list_del(&node->list);
+	rgp->nnode--;
+
+	if (node->pt_node)
+		remove_partition_node(rgp, node->pt_node);
+
+	kfree(node);
+}
+
+static int get_free_partition(struct solver_state *xrs,
+			      struct solver_node *snode,
+			      struct alloc_requests *req)
+{
+	struct partition_node *pt_node;
+	u32 ncols = req->cdo.ncols;
+	u32 col, i;
+
+	for (i = 0; i < snode->cols_len; i++) {
+		col = snode->start_cols[i];
+		if (find_next_bit(xrs->rgp.resbit, XRS_MAX_COL, col) >= col + ncols)
+			break;
+	}
+
+	if (i == snode->cols_len)
+		return -ENODEV;
+
+	pt_node = kzalloc(sizeof(*pt_node), GFP_KERNEL);
+	if (!pt_node)
+		return -ENOMEM;
+
+	pt_node->nshared = 1;
+	pt_node->start_col = col;
+	pt_node->ncols = ncols;
+
+	/*
+	 * Before fully support latency in QoS, if a request
+	 * specifies a non-zero latency value, it will not share
+	 * the partition with other requests.
+	 */
+	if (req->rqos.latency)
+		pt_node->exclusive = true;
+
+	list_add_tail(&pt_node->list, &xrs->rgp.pt_node_list);
+	xrs->rgp.npartition_node++;
+	bitmap_set(xrs->rgp.resbit, pt_node->start_col, pt_node->ncols);
+
+	snode->pt_node = pt_node;
+
+	return 0;
+}
+
+static int allocate_partition(struct solver_state *xrs,
+			      struct solver_node *snode,
+			      struct alloc_requests *req)
+{
+	struct partition_node *pt_node, *rpt_node = NULL;
+	int idx, ret;
+
+	ret = get_free_partition(xrs, snode, req);
+	if (!ret)
+		return ret;
+
+	/* try to get a share-able partition */
+	list_for_each_entry(pt_node, &xrs->rgp.pt_node_list, list) {
+		if (pt_node->exclusive)
+			continue;
+
+		if (rpt_node && pt_node->nshared >= rpt_node->nshared)
+			continue;
+
+		for (idx = 0; idx < snode->cols_len; idx++) {
+			if (snode->start_cols[idx] != pt_node->start_col)
+				continue;
+
+			if (req->cdo.ncols != pt_node->ncols)
+				continue;
+
+			rpt_node = pt_node;
+			break;
+		}
+	}
+
+	if (!rpt_node)
+		return -ENODEV;
+
+	rpt_node->nshared++;
+	snode->pt_node = rpt_node;
+
+	return 0;
+}
+
+static struct solver_node *create_solver_node(struct solver_state *xrs,
+					      struct alloc_requests *req)
+{
+	struct cdo_parts *cdop = &req->cdo;
+	struct solver_node *node;
+	int ret;
+
+	node = kzalloc(struct_size(node, start_cols, cdop->cols_len), GFP_KERNEL);
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->rid = req->rid;
+	node->cols_len = cdop->cols_len;
+	memcpy(node->start_cols, cdop->start_cols, cdop->cols_len * sizeof(u32));
+
+	ret = allocate_partition(xrs, node, req);
+	if (ret)
+		goto free_node;
+
+	list_add_tail(&node->list, &xrs->rgp.node_list);
+	xrs->rgp.nnode++;
+	return node;
+
+free_node:
+	kfree(node);
+	return ERR_PTR(ret);
+}
+
+static void fill_load_action(struct solver_state *xrs,
+			     struct solver_node *snode,
+			     struct xrs_action_load *action)
+{
+	action->rid = snode->rid;
+	action->part.start_col = snode->pt_node->start_col;
+	action->part.ncols = snode->pt_node->ncols;
+}
+
+int xrs_allocate_resource(void *hdl, struct alloc_requests *req, void *cb_arg)
+{
+	struct xrs_action_load load_act;
+	struct solver_node *snode;
+	struct solver_state *xrs;
+	int ret;
+
+	xrs = (struct solver_state *)hdl;
+
+	ret = sanity_check(xrs, req);
+	if (ret) {
+		drm_err(xrs->cfg.ddev, "invalid request");
+		return ret;
+	}
+
+	if (rg_search_node(&xrs->rgp, req->rid)) {
+		drm_err(xrs->cfg.ddev, "rid %lld is in-use", req->rid);
+		return -EEXIST;
+	}
+
+	snode = create_solver_node(xrs, req);
+	if (IS_ERR(snode))
+		return PTR_ERR(snode);
+
+	fill_load_action(xrs, snode, &load_act);
+	ret = xrs->cfg.actions->load(cb_arg, &load_act);
+	if (ret)
+		goto free_node;
+
+	snode->cb_arg = cb_arg;
+
+	drm_dbg(xrs->cfg.ddev, "start col %d ncols %d\n",
+		snode->pt_node->start_col, snode->pt_node->ncols);
+
+	return 0;
+
+free_node:
+	remove_solver_node(&xrs->rgp, snode);
+
+	return ret;
+}
+
+int xrs_release_resource(void *hdl, u64 rid)
+{
+	struct solver_state *xrs = hdl;
+	struct solver_node *node;
+
+	node = rg_search_node(&xrs->rgp, rid);
+	if (!node) {
+		drm_err(xrs->cfg.ddev, "node not exist");
+		return -ENODEV;
+	}
+
+	xrs->cfg.actions->unload(node->cb_arg);
+	remove_solver_node(&xrs->rgp, node);
+
+	return 0;
+}
+
+void *xrsm_init(struct init_config *cfg)
+{
+	struct solver_rgroup *rgp;
+	struct solver_state *xrs;
+
+	xrs = drmm_kzalloc(cfg->ddev, sizeof(*xrs), GFP_KERNEL);
+	if (!xrs)
+		return NULL;
+
+	memcpy(&xrs->cfg, cfg, sizeof(*cfg));
+
+	rgp = &xrs->rgp;
+	INIT_LIST_HEAD(&rgp->node_list);
+	INIT_LIST_HEAD(&rgp->pt_node_list);
+
+	return xrs;
+}
diff --git a/drivers/accel/amdxdna/aie2_solver.h b/drivers/accel/amdxdna/aie2_solver.h
new file mode 100644
index 000000000000..9b1847bb46a6
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_solver.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_SOLVER_H
+#define _AIE2_SOLVER_H
+
+#define XRS_MAX_COL 128
+
+/*
+ * Structure used to describe a partition. A partition is column based
+ * allocation unit described by its start column and number of columns.
+ */
+struct aie_part {
+	u32	start_col;
+	u32	ncols;
+};
+
+/*
+ * The QoS capabilities of a given AIE partition.
+ */
+struct aie_qos_cap {
+	u32     opc;            /* operations per cycle */
+	u32     dma_bw;         /* DMA bandwidth */
+};
+
+/*
+ * QoS requirement of a resource allocation.
+ */
+struct aie_qos {
+	u32	gops;		/* Giga operations */
+	u32	fps;		/* Frames per second */
+	u32	dma_bw;		/* DMA bandwidth */
+	u32	latency;	/* Frame response latency */
+	u32	exec_time;	/* Frame execution time */
+	u32	priority;	/* Request priority */
+};
+
+/*
+ * Structure used to describe a relocatable CDO (Configuration Data Object).
+ */
+struct cdo_parts {
+	u32		   *start_cols;		/* Start column array */
+	u32		   cols_len;		/* Length of start column array */
+	u32		   ncols;		/* # of column */
+	struct aie_qos_cap qos_cap;		/* CDO QoS capabilities */
+};
+
+/*
+ * Structure used to describe a request to allocate.
+ */
+struct alloc_requests {
+	u64			rid;
+	struct cdo_parts	cdo;
+	struct aie_qos		rqos;		/* Requested QoS */
+};
+
+/*
+ * Load callback argument
+ */
+struct xrs_action_load {
+	u32                     rid;
+	struct aie_part         part;
+};
+
+/*
+ * Define the power level available
+ *
+ * POWER_LEVEL_MIN:
+ *     Lowest power level. Usually set when all actions are unloaded.
+ *
+ * POWER_LEVEL_n
+ *     Power levels 0 - n, is a step increase in system frequencies
+ */
+enum power_level {
+	POWER_LEVEL_MIN = 0x0,
+	POWER_LEVEL_0   = 0x1,
+	POWER_LEVEL_1   = 0x2,
+	POWER_LEVEL_2   = 0x3,
+	POWER_LEVEL_3   = 0x4,
+	POWER_LEVEL_4   = 0x5,
+	POWER_LEVEL_5   = 0x6,
+	POWER_LEVEL_6   = 0x7,
+	POWER_LEVEL_7   = 0x8,
+	POWER_LEVEL_NUM,
+};
+
+/*
+ * Structure used to describe the frequency table.
+ * Resource solver chooses the frequency from the table
+ * to meet the QOS requirements.
+ */
+struct clk_list_info {
+	u32        num_levels;                     /* available power levels */
+	u32        cu_clk_list[POWER_LEVEL_NUM];   /* available aie clock frequencies in Mhz*/
+};
+
+struct xrs_action_ops {
+	int (*load)(void *cb_arg, struct xrs_action_load *action);
+	int (*unload)(void *cb_arg);
+};
+
+/*
+ * Structure used to describe information for solver during initialization.
+ */
+struct init_config {
+	u32			total_col;
+	u32			sys_eff_factor; /* system efficiency factor */
+	u32			latency_adj;    /* latency adjustment in ms */
+	struct clk_list_info	clk_list;       /* List of frequencies available in system */
+	struct drm_device	*ddev;
+	struct xrs_action_ops	*actions;
+};
+
+/*
+ * xrsm_init() - Register resource solver. Resource solver client needs
+ *              to call this function to register itself.
+ *
+ * @cfg:	The system metrics for resource solver to use
+ *
+ * Return:	A resource solver handle
+ *
+ * Note: We should only create one handle per AIE array to be managed.
+ */
+void *xrsm_init(struct init_config *cfg);
+
+/*
+ * xrs_allocate_resource() - Request to allocate resources for a given context
+ *                           and a partition metadata. (See struct part_meta)
+ *
+ * @hdl:	Resource solver handle obtained from xrs_init()
+ * @req:	Input to the Resource solver including request id
+ *		and partition metadata.
+ * @cb_arg:	callback argument pointer
+ *
+ * Return:	0 when successful.
+ *		Or standard error number when failing
+ *
+ * Note:
+ *      There is no lock mechanism inside resource solver. So it is
+ *      the caller's responsibility to lock down XCLBINs and grab
+ *      necessary lock.
+ */
+int xrs_allocate_resource(void *hdl, struct alloc_requests *req, void *cb_arg);
+
+/*
+ * xrs_release_resource() - Request to free resources for a given context.
+ *
+ * @hdl:	Resource solver handle obtained from xrs_init()
+ * @rid:	The Request ID to identify the requesting context
+ */
+int xrs_release_resource(void *hdl, u64 rid);
+#endif /* _AIE2_SOLVER_H */
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 64bce970514b..c0710d3130fd 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -58,6 +58,7 @@ struct amdxdna_dev {
 	struct drm_device		ddev;
 	struct amdxdna_dev_hdl		*dev_handle;
 	const struct amdxdna_dev_info	*dev_info;
+	void				*xrs_hdl;
 
 	struct mutex			dev_lock; /* per device lock */
 	struct amdxdna_fw_ver		fw_ver;
-- 
2.34.1

