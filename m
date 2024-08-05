Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2994808A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE0910E238;
	Mon,  5 Aug 2024 17:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zO0FaTS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136B710E262
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtPuco8EkrE3LNCug60zoL14UfqPyjFDIqAMgmkpzyptNTU4+Jw8b2K6QG9ckZd6db2kQj9OGvPn4NVvccfYH2wS+lb+BcVoMvtedcsWyZwkC+t9NOfyB3eEcT4/DilIUhw+dD+B1iSRMphZ0LTsMZRhGsGimkUMnvJox1okuL+J5Es2IXxarpvlkHU/1wx4R7Gp4tXV3DYjL9dyq//LhBONiNGvJASHFi7SJwNWLV7vCzk20i6oKUPQ01xKlryjjZdfnVSMK+CqelZGVDHJ2WWPpgPKvCZj3uwHj125hM9Hb+sR11KJaJYM64ykyQTY/opvOlzDz0NwbFt+WUGDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBd2FHbdJvjwrtZDAdCHKcrN08DqpaWQXsxOELdybfY=;
 b=y5O+LEFrLSRb/VHfYE3koDg6OzG3aaFGxwdCL5/S1GIkCPuJlrh+Zyv/ISh9xxslOwmeWsezdhV30zty6SEI3FUmktZiqPgJtyRaj1kMizcVPqjLvrg7iKs3AW8wvVeoTINohv15YbrbLOIcEVIzZA8qM52jms5aYNvRsmOstHJw1JeyXeDe8ZZVn0/eIDF7hRn6j0SVu5WA7+c0mKolD1hrpVIECHcijxde3ih4D2y/w1ddX9Dmeaa/I+XqCrX34GJW7y+g3ZXFrO8lPr/r4Up1bSW2ljJ4js2/gyGCbsddPSi7d3L1xpb21ASEOyuelpPYJDIMNioE8jLpH0R7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBd2FHbdJvjwrtZDAdCHKcrN08DqpaWQXsxOELdybfY=;
 b=zO0FaTS0GvCC1eUmS1+eVe6ToyvBQ8HOPA6MdOVOEZPux+OX1zLRms1hYQMuZKB5dU1AnoNc/UzRrfxYcltuzX3BHq06Pqe/zyyuV1GX8o9a33z7drrZEwXShAoQrgeRPEkT6wrZRCP9uZUWwJ9kg8UI0fson4xBlp1GYPT0AEM=
Received: from BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20) by
 DM4PR12MB6568.namprd12.prod.outlook.com (2603:10b6:8:8f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 17:40:26 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::62) by BL0PR01CA0007.outlook.office365.com
 (2603:10b6:208:71::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 17:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 17:40:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 12:40:25 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 12:40:24 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V2 03/10] accel/amdxdna: Add hardware resource solver
Date: Mon, 5 Aug 2024 10:39:52 -0700
Message-ID: <20240805173959.3181199-4-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805173959.3181199-1-lizhi.hou@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DM4PR12MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 95504dd1-a699-48aa-3b4b-08dcb575b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?adb0jbJV6TspX7UkSKi5CuxRe82QTXCR5LOFWQfgViVNKtfWLksaQQRt+mtg?=
 =?us-ascii?Q?efFPbKUTOY/VkGEIqj/jVC9S6FrB1Gz7hgjevlR3OCdA6sYjanFVaCqN3qT7?=
 =?us-ascii?Q?vlh3JH6ri3TcgOxpKwAWypRYzjXoXCxrNogaKONABx0E1neQ08sOV32EBtCz?=
 =?us-ascii?Q?r8Ow1yoVjhozfubTypg5LsQVDCn+F49JKK5X9tm+kEYEYv7luPHsIyI1YrMG?=
 =?us-ascii?Q?OORb5KgIXO0Lc/QG6aKAEJ1E3FNQokQprqID95TP65gcpjXG+QdfGcb6FC9W?=
 =?us-ascii?Q?svvK55kTcTOSf5RFuGrWFKMkYE22Z/ig8N3QXVW66IxsmstZFVdHtLJPf6qo?=
 =?us-ascii?Q?VrxUcFee/4v5X9JqnOmCKAn2gy97FdjhBXHr6lG6gdU3a4cpssJiH283NI+T?=
 =?us-ascii?Q?VBygI1Nvv8ReeuJExTzx3jux7roQWGyf/vqTxCN5iiSDiAYc9HLgcuvin4VQ?=
 =?us-ascii?Q?R80Piwp2G8GOp3wO7QbQ4/eD3j57nCpzbJbzy+A+7sq52P8MyngTg5gGCBem?=
 =?us-ascii?Q?biz/S4mOiEiaYO8BCr8EF/yinCfwxaIQXt5zthoqqyFpUyNcSqCFz0dNeY3B?=
 =?us-ascii?Q?pqPn39E/8Pa3GvdVOq6tTn79pliYbSqNxiVLlF3+lvhWiezEYO0C4Kj+97yL?=
 =?us-ascii?Q?LfgfXKuy/CcuP0Pam/EUc1KIL1o95fHHPx98qzv4Gr6wm1A8TAFQbvsUDoQI?=
 =?us-ascii?Q?FZQEzjk0jb+siFE5gzWKfKx3ZWp8+YziRVuJKJn7pkpwMA5nbyta2dKbPV//?=
 =?us-ascii?Q?VNbFnZ8SboF5zOj9UneJUR6nb2qHIxqAAo69EwMYql7sSRt3qlOHBUyZs5aB?=
 =?us-ascii?Q?QW8yp8q0JzObiG/6OZmfk5+HGOY1dGGnOeqIKONpgh72FcBoQClsBQiSv+T6?=
 =?us-ascii?Q?4cN5br8KIJ+WCpIUfTdEd9vn+WNbxo8HarBqOutg5vb67hfB22Q0cB5+2nzl?=
 =?us-ascii?Q?2rviLlVJxYMCKcIoaa6jNGkqHIWADBviK0g/872ibwc6Eqp2/WjyPx2FhWFv?=
 =?us-ascii?Q?4zXHPMRntdGYkGq5Hw8wLSQO/g6TEK+tJMFEHEasRb+1p80Bhb/49eHwD9C0?=
 =?us-ascii?Q?mFJSAizXtnUtoCv/reCEUjERa0ziXWWM4KgcQhoTP/oICYG8r00Jt2K3bUat?=
 =?us-ascii?Q?7u6UbN3YLEmSBxUv/rz1CJzAO9xDSHFF6PFKJ7b7dVmFA4DDmypWrfoSl8V+?=
 =?us-ascii?Q?WRXIcx+lqqhxdPwwFg2Q+PlZ2IHQbu+lONSEE2WHXatcuMdJD87o7ffH1D4b?=
 =?us-ascii?Q?brUa8o+tSn53srKjjn8fY9DRVTFDuZqCOyZlF9hKQq7z3h0r1d5iJCw3OJ5/?=
 =?us-ascii?Q?JHGFSM2MPFTPxftOK36r6Z75XYmRmOJW8VWM31nrRgtPXdlLF8d6r8IIaKb4?=
 =?us-ascii?Q?+46JLEFwsC1swTfuWe7OUEaDndok4eZQKHTmBiWNTdiz6RmYa9MV2G78d0Tb?=
 =?us-ascii?Q?tptZ5ppK8WXb5V7eVsTeoEYAovFhSHBF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:40:25.8562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95504dd1-a699-48aa-3b4b-08dcb575b0a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6568
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
 drivers/accel/amdxdna/Makefile      |   1 +
 drivers/accel/amdxdna/aie2_pci.c    |  23 +-
 drivers/accel/amdxdna/aie2_solver.c | 329 ++++++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_solver.h | 156 +++++++++++++
 drivers/accel/amdxdna/amdxdna_drm.h |   1 +
 5 files changed, 509 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index c21e6856057f..b44de7fe0c9e 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -5,6 +5,7 @@ amdxdna-y := \
 	aie2_pci.o \
 	aie2_psp.o \
 	aie2_smu.o \
+	aie2_solver.o \
 	amdxdna_drm.o \
 	amdxdna_mailbox.o \
 	amdxdna_mailbox_helper.o \
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 03ff3f496279..8fb7ecbf35c1 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -10,6 +10,11 @@
 
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
+#include "aie2_solver.h"
+
+int aie2_max_col = XRS_MAX_COL;
+module_param(aie2_max_col, int, 0600);
+MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
 
 /*
  * The management mailbox channel is allocated by firmware.
@@ -302,6 +307,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
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
+	xrs_cfg.dev = xdna->ddev.dev;
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
index 000000000000..8e399b13643e
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_solver.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <linux/slab.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/device.h>
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
+		dev_err(xrs->cfg.dev, "invalid request");
+		return ret;
+	}
+
+	if (rg_search_node(&xrs->rgp, req->rid)) {
+		dev_err(xrs->cfg.dev, "rid %lld is in-use", req->rid);
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
+	dev_dbg(xrs->cfg.dev, "start col %d ncols %d\n",
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
+		dev_err(xrs->cfg.dev, "node not exist");
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
+	xrs = devm_kzalloc(cfg->dev, sizeof(*xrs), GFP_KERNEL);
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
index 000000000000..7f328bbf4960
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_solver.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_SOLVER_H
+#define _AIE2_SOLVER_H
+
+#include <linux/types.h>
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
+	struct device		*dev;
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
diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
index 8a31bf552796..bf4b0b786606 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.h
+++ b/drivers/accel/amdxdna/amdxdna_drm.h
@@ -65,6 +65,7 @@ struct amdxdna_dev {
 	struct drm_device		ddev;
 	struct amdxdna_dev_hdl		*dev_handle;
 	const struct amdxdna_dev_info	*dev_info;
+	void				*xrs_hdl;
 
 	struct mutex			dev_lock; /* per device lock */
 	struct amdxdna_fw_ver		fw_ver;
-- 
2.34.1

