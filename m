Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB99B686F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D610E7C9;
	Wed, 30 Oct 2024 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tFhsz2E8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3BD10E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6lJ6HrD70aoJByPPL61GJLWq4dxwr6+iK313xMeIUyaghfur5MMtxR1HoQm9AJpIJkwusIbvmYCHz4+hj1Hf+IuKYVwDxpPjBWabs+uc0Kv34Fd0X9O31WWef6td/KqZQObGmgtlaVSAYq4TFZSXi5Qcgd3iuyQ3SCH980J+GcPyWUdAuaP4oxn2gj2vkjGJE8HePg6sBny5kma5mMt2cYKNmShiHFot/4BvA9Zk05t+Fc1tLEZchZzSqPjeOQVFKjcjeeLv4MOUVRGJB8mrk40ZIso5y0/cgUcQFWw6+u+Yl3y0UoA5OEFoayYWYgLef8UR+rFZF7T/WIfS/7bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69Sp7piqeGMS15Kz78jyW16hiS0aBw2J4sjIzRRVwMw=;
 b=QaLemo+04G7zch+G9XrSpInUCBB5z0MZ6KXDDD3gKVPA5a2XfimxQASeZIdNiMEtdYlT2qJPTJH4X94lAnjHzW1IDywJtdMp0nTR3EbhYgttO2nRLVBFVVtuxsQtAVuONUrk5g0z6SGVUx1l9ZFiDXgiqC85hG8YpBmzv6s3QUEolF6kbU7kzx95P41nN1LknQFT2bsJe4L5hXJFqDpE/58AXLwz9t3uy+pdyYBYBzqHFTZmdPj4CL0F64h2JlmGnLKH7o+aQnMxS39yNZp6fT2KKco1AfyKiFHDFN59xE5KdSE0JVPxljIl3c6LPTOB64s/LQdjJgpR7ejZzemK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69Sp7piqeGMS15Kz78jyW16hiS0aBw2J4sjIzRRVwMw=;
 b=tFhsz2E87Y0YpYrvScw9DQfjaxFaBjuLvaHqwDRFMv4CxuvJMd1uj8x/ZPRyGtwLlMkqWjANeAX3VFnTNdTDxdyCkP7kQNarB+YK3XdMvz/fkk9fl4K363MpElHoQYu9UHiTr8kvqvnnkNYeZ6RDtt54xRR8bJZ+y3DGeLG2PmA=
Received: from MN2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:208:e8::17)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 15:52:13 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::33) by MN2PR20CA0004.outlook.office365.com
 (2603:10b6:208:e8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Wed, 30 Oct 2024 15:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 15:52:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:08 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 10:52:07 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V6 04/10] accel/amdxdna: Add hardware resource solver
Date: Wed, 30 Oct 2024 08:51:41 -0700
Message-ID: <20241030155147.103908-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030155147.103908-1-lizhi.hou@amd.com>
References: <20241030155147.103908-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 3312519d-aab9-44c6-d385-08dcf8fad21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kbgi57qhBnQABWBo72UJQarIudHabzhkYeoNME9mwhvkry0iV/4zAFRNaV8j?=
 =?us-ascii?Q?qBCNPns552c1Ux2XdyT2rPe3KECL/DnPFTTV50tOwABwYfjleKSSXta+PmAT?=
 =?us-ascii?Q?RILwXHpPShJKDROmyLN0+Nrwya+GvSYTfNt+lb8uEpEL90Q8xIM8wPRFv+La?=
 =?us-ascii?Q?tVkElnu3/HaPm259uGj5QZUtxpGFqYUK9pmjVzMHFWHYTQKxez4W2itw5ikr?=
 =?us-ascii?Q?YGi3sgZXB5iWWta8QkKlWGkwhRld/dcJ5lJxEJPLsPSQx1cJlcdaxajgtNuZ?=
 =?us-ascii?Q?WpJRbHM9BlvDrTXWWZFvBv7tNgPCOofQVl65dAOzpeeCcTcIX4nsW8m0SL9L?=
 =?us-ascii?Q?BScQ2NLqdYXcYvaOPYHawA91kZMn0UhLbssmZNvWvNNVAkRD7aOup4/QsnwN?=
 =?us-ascii?Q?8Zn7YFNjDWZHoF9pN5grbfDeisTgeNLhmxvGCrGZHIf8g1uEGcRNuR5tAQQL?=
 =?us-ascii?Q?BQ8Gl3KJwBake26Kb2veIEqsa3c2Kcfka0knV8F7MhbXyehljAU0MZZImefY?=
 =?us-ascii?Q?wui1sXCsrVx2Yp0joOQk4tFkOVb578xoMTVPOXGMzpEXaBOeYD2bXqWMHB6/?=
 =?us-ascii?Q?S7kr3sSRrmK9Yj4hkBC9kEnrP9lRWKZp5Tq2pFA9FuDXwFuimnGwfUCtZZc0?=
 =?us-ascii?Q?00J2pssvkJWfInlX4w4x9I+0l/FdV+ot1wf7xxxzf+qnd7vzTGpCyVk65dhz?=
 =?us-ascii?Q?NSDSaTIKZ0h8mUxJ6SiZBWBAeMVTtZ0hFtc2tXnWzdE5gNW5JzCFJrXtXn1H?=
 =?us-ascii?Q?OqaMateJKO56/ZRNOieIDp9XXJUwjkPffbBtz1qnap4KE6vui463iJ4wA/ir?=
 =?us-ascii?Q?mLunRwH4f7nhXy3Ig0dWJom/ogwG92PIZt02eSZZKOnodNHzQkalTeEk59fq?=
 =?us-ascii?Q?Lv0XtaCxovzEp4ZG3qbfIWClhSO2MtEfTovCOO3b3au3otAQ58Fts/5F8r2m?=
 =?us-ascii?Q?cvfpLRMGsFp1Ks6HLo6aSLP6OQzzreIxZGeB9RShj5z+oUJ1zGThssm/Jo/b?=
 =?us-ascii?Q?7TeE1BI//u2yDILR1XEUDuN6qQ+SyCZqiV0UKeDHWDdoLGddF4zIOfLxul5s?=
 =?us-ascii?Q?9lK2vDD02zSi4hXL6m8qvX1it05T9cv+RdTYwbwZNBpz/7YfoAFCVRoxtklu?=
 =?us-ascii?Q?wXhhQX9XLqmYa7bm3w+YYATavytcbf3GIgT6cETvH0FrmiKn1xBEnNr2pXM4?=
 =?us-ascii?Q?AZg5Pwyt2iugus+fSi5JtfB99zeX1HX+uMZSzLHFKDRe7As/9ZSG4bZi8u5U?=
 =?us-ascii?Q?K3So4Tk1cw0X/s9YLvP0QaJpfwe0CVRiIxvhlRI5WCssykCkMnRnesT9O0ri?=
 =?us-ascii?Q?NasjYZ381urMJ6EEHdJZb+SlE3szVc/cE+FUGgULrjUPor2jygkhO5ryPa/M?=
 =?us-ascii?Q?YHsxqcFy9NpIQJER9R5lLHgg3cKXvC2v0GyCDVvLLLKXAnE5eA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:52:12.9734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3312519d-aab9-44c6-d385-08dcf8fad21e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
index 73dfcbae2ea7..27e92621c05b 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -14,9 +14,14 @@
 
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
+#include "aie2_solver.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
+int aie2_max_col = XRS_MAX_COL;
+module_param(aie2_max_col, uint, 0600);
+MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
+
 /*
  * The management mailbox channel is allocated by firmware.
  * The related register and ring buffer information is on SRAM BAR.
@@ -307,6 +312,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	void __iomem *tbl[PCI_NUM_RESOURCES] = {0};
+	struct init_config xrs_cfg = { 0 };
 	struct amdxdna_dev_hdl *ndev;
 	struct psp_config psp_conf;
 	const struct firmware *fw;
@@ -402,7 +408,22 @@ static int aie2_init(struct amdxdna_dev *xdna)
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

