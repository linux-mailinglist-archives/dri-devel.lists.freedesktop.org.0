Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FBA9A6F3C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D83010E558;
	Mon, 21 Oct 2024 16:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AxYi3GsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D270C10E55D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/ugHpFjJwk+ijbec265M+ldEaNpv4ijIdnLzS7unCbw9tqaeJiH4EZ+grWpOLdLOmp25jLOi4RIo/MlkrtEvUwYHap2XoOL5gt/hxqv/RKKym/uXr0ZMt4xxCq6Y/oWU/De98EOY9MHz9x/RT1vNuV6sniTrTsOygcH4ig86YX/tynWwUe9c2j4i/I61C7thBDc3oD3xfye6OBoAkh6vXjP0nnjpmF9I1r6zDHGlZFe1PyzA8YQYx918mlCLs8A9TfMKAvTKh1Hhbp5taXYLxpuZWBOyZoLkhvaXjoA7o3YANzaMApguPcm1ua+2ndC89GQp4zTFn6zrkegI0ZeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNgC34S4UpsSPjk5HEYfcFYL2shAqNuFiUvr5Jnc+EA=;
 b=WWsuD3XPdZF8+n2FgnOgaVYC2XR7pLP3Qv/hfZOY1UGnMasn43Udh9qAMVyMbnJO7xEY3DvwyTiMSk8b4+x21gHJjiMO7W5Vr6S73w9k3NaPsHmgcoob85ipAauyjmaz59Xn0zc533n8PFdHvDzwxrfv0l1YK0+li5SlmZxFKXxGB3uTDcYB9LnPhKs3XksgbvB8+G6w8X0AFpWw57Ah0iFe4FgeHbhRM3vrIppPefxXKfPuLLJ0DNQuO2S21hFKpCOiU5Jz0DZ95Ec64yKCe8n2u/JiWJz6VgKWwBINe6/TipvXalFZvtRwLcXjLp3tjj9VaWQAFXcWHqdBbOXdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNgC34S4UpsSPjk5HEYfcFYL2shAqNuFiUvr5Jnc+EA=;
 b=AxYi3GsB6sPWxVXyHz2C95PjkxdWTgQzgp8W4nJUvLOqUmXSg0rt+70kM1O7AsxHYzt+2Kig97n4PZMZedQUp9+Kul2BFAvtIpWx6h02wQoOcrQYekEaBpk6KuRHUNVruFcaogiKG+bVAuaED/m7rXDftdh3E7nSKMbZx0ZUKV4=
Received: from SJ0PR03CA0151.namprd03.prod.outlook.com (2603:10b6:a03:338::6)
 by MW4PR12MB6756.namprd12.prod.outlook.com (2603:10b6:303:1e9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:19:58 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::5e) by SJ0PR03CA0151.outlook.office365.com
 (2603:10b6:a03:338::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 16:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:19:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:55 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 11:19:54 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V5 07/10] accel/amdxdna: Add command execution
Date: Mon, 21 Oct 2024 09:19:28 -0700
Message-ID: <20241021161931.3701754-8-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021161931.3701754-1-lizhi.hou@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MW4PR12MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b34e95b-d06d-4a55-6b64-08dcf1ec3499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qpuxu6/4iEQ86aHy5FUrcWw4g4ZyQm+I0dhS72tn6L+jQjVJnQTDNLDsie8A?=
 =?us-ascii?Q?prbEDFK/qF7LbdPbgNfv5MHsTleU928PvQKymLeZymJZQsepy+2FXutbMpAR?=
 =?us-ascii?Q?WMBO1X+K6lLsD0104zFTfmsma8744kI0D3SLesQjk63tBQ1HLn3I+s78YXlt?=
 =?us-ascii?Q?CBf4NASUGKkBancNZ05A2Y4i4fA/Q7abK09m4RiVCsoiv46QG/vyEQasBSze?=
 =?us-ascii?Q?R+cgBsgm4RKh3q9dCHiKZtXWO92f9axvNsZH+VYXYQWLaKJ0q7JXk/lKBb1U?=
 =?us-ascii?Q?mYzYmfQIjzMmNBKKP8vjAhz6EoW10dALza1aOAhgG1/9j0r8k4V1/H5yMQ2/?=
 =?us-ascii?Q?uwm1elijdTsQG6n2WRqb95tLe8FoSMsrJ/7yxAZkskvaueHpBIjfJ6tNNmdx?=
 =?us-ascii?Q?tuRN/mEygJ61K2RZQPoHbXgqU9uTQXEXHyth1yvPDYquEdjWGz5WXxS5ck4z?=
 =?us-ascii?Q?FtVQKKu5LJ81YjxaW7n1PWNF9OXcQm60CylMPzW1XlSgYjQsGB7tus/c2Pki?=
 =?us-ascii?Q?XN/+tP92CnfzlzNqWB+jF4el1KtwpPpozbnaSSvTiBCcUockxqQBWgGXTHrY?=
 =?us-ascii?Q?cSASFkrWf+BeOq+FgD6qJ5pmCZsf/4mfNXsnEMu0mbA7tPGYty78L47FyILj?=
 =?us-ascii?Q?YK9+r6TqpnErkYSrePnGHwPb9wxTMIe/I3yvLCc50bmxm3pHmthoQBUh/AiN?=
 =?us-ascii?Q?0CxU6g9+r7L8PBAFdNXIfXpySpEB2CW3HK/RTXdUdh6Y0SEwN+9GF4Kzo1XK?=
 =?us-ascii?Q?xD5dvgp1Q1mgYtdluaWO4yANGA0impMQSY577H+Dn03eiF/k+xW0pAn3BjYn?=
 =?us-ascii?Q?XLn3A6J2jnMRO1wG/tbGElhVl3CejdVz/GogU5n79xnF7l0H9vGeKDPYeULm?=
 =?us-ascii?Q?E54fnn66wUJVfAqUkl88ydCOj+5Ft1Z2wF028KW8+xGO7iwZeSMBf/ZApAVy?=
 =?us-ascii?Q?1aHt11FxpWXBYkd6seABt0sQEGiBfE2JY0BjMsMbeDOnhJXfYwcTbgrvJMjk?=
 =?us-ascii?Q?zcN86QTHKA/jBzBz6dOLI+Id6FkFVZKydZGfUKHfyWlOcINmeJfrI3o9JAKc?=
 =?us-ascii?Q?e0kGOp8oKUwlfFiHaxz4OgUFaILaFqodwtbBXTuzYgYsLLta5mr6vbY2Kr6s?=
 =?us-ascii?Q?ixOQ6pNho9dAXboREqHPqYHHvExlnVc9GB3aIQH91M8d5Bea/hTgO+FDiSnk?=
 =?us-ascii?Q?xwCDQEkjc+llVbqptWarusVUDUGWt28t4ewOpTv8bqviinNbRlW3sk6Ks8WL?=
 =?us-ascii?Q?8OH8qnzs6iV2U3BvvNq+7vYulKchyruzvVmP0bxtEEuiuuViejSQlyuI/wNx?=
 =?us-ascii?Q?j7szHdmzsl7FKYeAeBoeafq0Zq72prLOjRB2XQFqNC7Ab7Nf10G3LKDdNTrc?=
 =?us-ascii?Q?SVVfhUXP2x+KrxppTAMl2mhAgh0gXfutzGvaXUpuq//NZ6Zb2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:19:57.5094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b34e95b-d06d-4a55-6b64-08dcf1ec3499
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6756
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

Add interfaces for user application to submit command and wait for its
completion.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c              | 626 +++++++++++++++++-
 drivers/accel/amdxdna/aie2_message.c          | 343 ++++++++++
 drivers/accel/amdxdna/aie2_pci.c              |   6 +
 drivers/accel/amdxdna/aie2_pci.h              |  35 +
 drivers/accel/amdxdna/aie2_psp.c              |   2 +
 drivers/accel/amdxdna/aie2_smu.c              |   2 +
 drivers/accel/amdxdna/amdxdna_ctx.c           | 375 ++++++++++-
 drivers/accel/amdxdna/amdxdna_ctx.h           | 110 +++
 drivers/accel/amdxdna/amdxdna_gem.c           |  10 +
 drivers/accel/amdxdna/amdxdna_gem.h           |   1 +
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |   5 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       |   6 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h       |   5 +
 drivers/accel/amdxdna/amdxdna_sysfs.c         |   5 +
 drivers/accel/amdxdna/npu1_regs.c             |   1 +
 drivers/accel/amdxdna/npu2_regs.c             |   1 +
 drivers/accel/amdxdna/npu4_regs.c             |   1 +
 drivers/accel/amdxdna/npu5_regs.c             |   1 +
 include/trace/events/amdxdna.h                |  41 ++
 include/uapi/drm/amdxdna_accel.h              |  59 ++
 20 files changed, 1626 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 617fc05077d9..67d88b37f73c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -8,8 +8,11 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
+#include <linux/hmm.h>
 #include <linux/types.h>
+#include <trace/events/amdxdna.h>
 
+#include "aie2_msg_priv.h"
 #include "aie2_pci.h"
 #include "aie2_solver.h"
 #include "amdxdna_ctx.h"
@@ -17,6 +20,361 @@
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
+bool force_cmdlist;
+module_param(force_cmdlist, bool, 0600);
+MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
+
+#define HWCTX_MAX_TIMEOUT	60000 /* miliseconds */
+
+static int
+aie2_hwctx_add_job(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job)
+{
+	struct amdxdna_sched_job *other;
+	int idx;
+
+	idx = get_job_idx(hwctx->priv->seq);
+	/* When pending list full, hwctx->seq points to oldest fence */
+	other = hwctx->priv->pending[idx];
+	if (other && other->fence)
+		return -EAGAIN;
+
+	if (other) {
+		dma_fence_put(other->out_fence);
+		amdxdna_job_put(other);
+	}
+
+	hwctx->priv->pending[idx] = job;
+	job->seq = hwctx->priv->seq++;
+	kref_get(&job->refcnt);
+
+	return 0;
+}
+
+static struct amdxdna_sched_job *
+aie2_hwctx_get_job(struct amdxdna_hwctx *hwctx, u64 seq)
+{
+	int idx;
+
+	/* Special sequence number for oldest fence if exist */
+	if (seq == AMDXDNA_INVALID_CMD_HANDLE) {
+		idx = get_job_idx(hwctx->priv->seq);
+		goto out;
+	}
+
+	if (seq >= hwctx->priv->seq)
+		return ERR_PTR(-EINVAL);
+
+	if (seq + HWCTX_MAX_CMDS < hwctx->priv->seq)
+		return NULL;
+
+	idx = get_job_idx(seq);
+
+out:
+	return hwctx->priv->pending[idx];
+}
+
+/* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
+static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
+			    struct drm_sched_job *bad_job)
+{
+	drm_sched_stop(&hwctx->priv->sched, bad_job);
+	aie2_destroy_context(xdna->dev_handle, hwctx);
+}
+
+static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_gem_obj *heap = hwctx->priv->heap;
+	int ret;
+
+	ret = aie2_create_context(xdna->dev_handle, hwctx);
+	if (ret) {
+		XDNA_ERR(xdna, "Create hwctx failed, ret %d", ret);
+		goto out;
+	}
+
+	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
+				heap->mem.userptr, heap->mem.size);
+	if (ret) {
+		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
+		goto out;
+	}
+
+	if (hwctx->status != HWCTX_STAT_READY) {
+		XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
+		goto out;
+	}
+
+	ret = aie2_config_cu(hwctx);
+	if (ret) {
+		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
+		goto out;
+	}
+
+out:
+	drm_sched_start(&hwctx->priv->sched);
+	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
+	return ret;
+}
+
+void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+		/* check if the HW context uses the error column */
+		if (!(col_map & amdxdna_hwctx_col_map(hwctx)))
+			continue;
+
+		aie2_hwctx_stop(xdna, hwctx, NULL);
+		hwctx->old_status = hwctx->status;
+		hwctx->status = HWCTX_STAT_STOP;
+		XDNA_DBG(xdna, "Stop %s", hwctx->name);
+	}
+	mutex_unlock(&client->hwctx_lock);
+}
+
+void aie2_restart_ctx(struct amdxdna_client *client)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+		if (hwctx->status != HWCTX_STAT_STOP)
+			continue;
+
+		hwctx->status = hwctx->old_status;
+		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
+		aie2_hwctx_restart(xdna, hwctx);
+	}
+	mutex_unlock(&client->hwctx_lock);
+}
+
+static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_sched_job *job;
+
+	mutex_lock(&hwctx->priv->io_lock);
+	if (!hwctx->priv->seq) {
+		mutex_unlock(&hwctx->priv->io_lock);
+		return 0;
+	}
+
+	job = aie2_hwctx_get_job(hwctx, hwctx->priv->seq - 1);
+	if (IS_ERR_OR_NULL(job)) {
+		mutex_unlock(&hwctx->priv->io_lock);
+		XDNA_WARN(hwctx->client->xdna, "Corrupted pending list");
+		return 0;
+	}
+	mutex_unlock(&hwctx->priv->io_lock);
+
+	wait_event(hwctx->priv->job_free_wq, !job->fence);
+
+	return 0;
+}
+
+static void
+aie2_sched_notify(struct amdxdna_sched_job *job)
+{
+	struct dma_fence *fence = job->fence;
+
+	job->hwctx->priv->completed++;
+	dma_fence_signal(fence);
+	trace_xdna_job(&job->base, job->hwctx->name, "signaled fence", job->seq);
+	dma_fence_put(fence);
+	mmput(job->mm);
+	amdxdna_job_put(job);
+}
+
+static int
+aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
+{
+	struct amdxdna_sched_job *job = handle;
+	struct amdxdna_gem_obj *cmd_abo;
+	u32 ret = 0;
+	u32 status;
+
+	cmd_abo = job->cmd_bo;
+
+	if (unlikely(!data))
+		goto out;
+
+	if (unlikely(size != sizeof(u32))) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	status = *data;
+	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
+	if (status == AIE2_STATUS_SUCCESS)
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
+	else
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
+
+out:
+	aie2_sched_notify(job);
+	return ret;
+}
+
+static int
+aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
+{
+	struct amdxdna_sched_job *job = handle;
+	u32 ret = 0;
+	u32 status;
+
+	if (unlikely(!data))
+		goto out;
+
+	if (unlikely(size != sizeof(u32))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	status = *data;
+	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
+
+out:
+	aie2_sched_notify(job);
+	return ret;
+}
+
+static int
+aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
+{
+	struct amdxdna_sched_job *job = handle;
+	struct amdxdna_gem_obj *cmd_abo;
+	struct cmd_chain_resp *resp;
+	struct amdxdna_dev *xdna;
+	u32 fail_cmd_status;
+	u32 fail_cmd_idx;
+	u32 ret = 0;
+
+	cmd_abo = job->cmd_bo;
+	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	resp = (struct cmd_chain_resp *)data;
+	xdna = job->hwctx->client->xdna;
+	XDNA_DBG(xdna, "Status 0x%x", resp->status);
+	if (resp->status == AIE2_STATUS_SUCCESS) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
+		goto out;
+	}
+
+	/* Slow path to handle error, read from ringbuf on BAR */
+	fail_cmd_idx = resp->fail_cmd_idx;
+	fail_cmd_status = resp->fail_cmd_status;
+	XDNA_DBG(xdna, "Failed cmd idx %d, status 0x%x",
+		 fail_cmd_idx, fail_cmd_status);
+
+	if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		ret = -EINVAL;
+		goto out;
+	}
+	amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
+
+	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
+		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
+
+		cc->error_index = fail_cmd_idx;
+		if (cc->error_index >= cc->command_count)
+			cc->error_index = 0;
+	}
+out:
+	aie2_sched_notify(job);
+	return ret;
+}
+
+static struct dma_fence *
+aie2_sched_job_run(struct drm_sched_job *sched_job)
+{
+	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
+	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
+	struct amdxdna_hwctx *hwctx = job->hwctx;
+	struct dma_fence *fence;
+	int ret;
+
+	if (!mmget_not_zero(job->mm))
+		return ERR_PTR(-ESRCH);
+
+	kref_get(&job->refcnt);
+	fence = dma_fence_get(job->fence);
+
+	if (unlikely(!cmd_abo)) {
+		ret = aie2_sync_bo(hwctx, job, aie2_sched_nocmd_resp_handler);
+		goto out;
+	}
+
+	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_NEW);
+
+	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN)
+		ret = aie2_cmdlist_multi_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
+	else if (force_cmdlist)
+		ret = aie2_cmdlist_single_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
+	else
+		ret = aie2_execbuf(hwctx, job, aie2_sched_resp_handler);
+
+out:
+	if (ret) {
+		dma_fence_put(job->fence);
+		amdxdna_job_put(job);
+		mmput(job->mm);
+		fence = ERR_PTR(ret);
+	}
+	trace_xdna_job(sched_job, hwctx->name, "sent to device", job->seq);
+
+	return fence;
+}
+
+static void aie2_sched_job_free(struct drm_sched_job *sched_job)
+{
+	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
+	struct amdxdna_hwctx *hwctx = job->hwctx;
+
+	trace_xdna_job(sched_job, hwctx->name, "job free", job->seq);
+	drm_sched_job_cleanup(sched_job);
+	job->fence = NULL;
+	amdxdna_job_put(job);
+
+	wake_up(&hwctx->priv->job_free_wq);
+}
+
+static enum drm_gpu_sched_stat
+aie2_sched_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
+	struct amdxdna_hwctx *hwctx = job->hwctx;
+	struct amdxdna_dev *xdna;
+
+	xdna = hwctx->client->xdna;
+	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
+	mutex_lock(&xdna->dev_lock);
+	aie2_hwctx_stop(xdna, hwctx, sched_job);
+
+	aie2_hwctx_restart(xdna, hwctx);
+	mutex_unlock(&xdna->dev_lock);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+const struct drm_sched_backend_ops sched_ops = {
+	.run_job = aie2_sched_job_run,
+	.free_job = aie2_sched_job_free,
+	.timedout_job = aie2_sched_job_timedout,
+};
+
 static int aie2_hwctx_col_list(struct amdxdna_hwctx *hwctx)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -130,9 +488,10 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 {
 	struct amdxdna_client *client = hwctx->client;
 	struct amdxdna_dev *xdna = client->xdna;
+	struct drm_gpu_scheduler *sched;
 	struct amdxdna_hwctx_priv *priv;
 	struct amdxdna_gem_obj *heap;
-	int ret;
+	int i, ret;
 
 	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
 	if (!priv)
@@ -157,10 +516,48 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		goto put_heap;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
+		struct amdxdna_gem_obj *abo;
+		struct amdxdna_drm_create_bo args = {
+			.flags = 0,
+			.type = AMDXDNA_BO_DEV,
+			.vaddr = 0,
+			.size = MAX_CHAIN_CMDBUF_SIZE,
+		};
+
+		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp, true);
+		if (IS_ERR(abo)) {
+			ret = PTR_ERR(abo);
+			goto free_cmd_bufs;
+		}
+
+		XDNA_DBG(xdna, "Command buf %d addr 0x%llx size 0x%lx",
+			 i, abo->mem.dev_addr, abo->mem.size);
+		priv->cmd_buf[i] = abo;
+	}
+
+	sched = &priv->sched;
+	mutex_init(&priv->io_lock);
+	ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
+			     HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
+			     NULL, NULL, hwctx->name, xdna->ddev.dev);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret %d", ret);
+		goto free_cmd_bufs;
+	}
+
+	ret = drm_sched_entity_init(&priv->entity, DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to initial sched entiry. ret %d", ret);
+		goto free_sched;
+	}
+	init_waitqueue_head(&priv->job_free_wq);
+
 	ret = aie2_hwctx_col_list(hwctx);
 	if (ret) {
 		XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
-		goto unpin;
+		goto free_entity;
 	}
 
 	ret = aie2_alloc_resource(hwctx);
@@ -185,7 +582,16 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	aie2_release_resource(hwctx);
 free_col_list:
 	kfree(hwctx->col_list);
-unpin:
+free_entity:
+	drm_sched_entity_destroy(&priv->entity);
+free_sched:
+	drm_sched_fini(&priv->sched);
+free_cmd_bufs:
+	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
+		if (!priv->cmd_buf[i])
+			continue;
+		drm_gem_object_put(to_gobj(priv->cmd_buf[i]));
+	}
 	amdxdna_gem_unpin(heap);
 put_heap:
 	drm_gem_object_put(to_gobj(heap));
@@ -196,11 +602,43 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 {
+	struct amdxdna_sched_job *job;
+	struct amdxdna_dev *xdna;
+	int idx;
+
+	xdna = hwctx->client->xdna;
+	drm_sched_wqueue_stop(&hwctx->priv->sched);
+
+	/* Now, scheduler will not send command to device. */
 	aie2_release_resource(hwctx);
 
+	/*
+	 * All submitted commands are aborted.
+	 * Restart scheduler queues to cleanup jobs. The amdxdna_sched_job_run()
+	 * will return NODEV if it is called.
+	 */
+	drm_sched_wqueue_start(&hwctx->priv->sched);
+
+	aie2_hwctx_wait_for_idle(hwctx);
+	drm_sched_entity_destroy(&hwctx->priv->entity);
+	drm_sched_fini(&hwctx->priv->sched);
+
+	for (idx = 0; idx < HWCTX_MAX_CMDS; idx++) {
+		job = hwctx->priv->pending[idx];
+		if (!job)
+			continue;
+
+		dma_fence_put(job->out_fence);
+		amdxdna_job_put(job);
+	}
+	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
+
+	for (idx = 0; idx < ARRAY_SIZE(hwctx->priv->cmd_buf); idx++)
+		drm_gem_object_put(to_gobj(hwctx->priv->cmd_buf[idx]));
 	amdxdna_gem_unpin(hwctx->priv->heap);
 	drm_gem_object_put(to_gobj(hwctx->priv->heap));
 
+	mutex_destroy(&hwctx->priv->io_lock);
 	kfree(hwctx->col_list);
 	kfree(hwctx->priv);
 	kfree(hwctx->cus);
@@ -267,3 +705,185 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 		return -EOPNOTSUPP;
 	}
 }
+
+static int aie2_populate_range(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct mm_struct *mm = abo->mem.notifier.mm;
+	struct hmm_range range = { 0 };
+	unsigned long timeout;
+	int ret;
+
+	XDNA_INFO_ONCE(xdna, "populate memory range %llx size %lx",
+		       abo->mem.userptr, abo->mem.size);
+	range.notifier = &abo->mem.notifier;
+	range.start = abo->mem.userptr;
+	range.end = abo->mem.userptr + abo->mem.size;
+	range.hmm_pfns = abo->mem.pfns;
+	range.default_flags = HMM_PFN_REQ_FAULT;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+again:
+	range.notifier_seq = mmu_interval_read_begin(&abo->mem.notifier);
+	mmap_read_lock(mm);
+	ret = hmm_range_fault(&range);
+	mmap_read_unlock(mm);
+	if (ret) {
+		if (time_after(jiffies, timeout)) {
+			ret = -ETIME;
+			goto put_mm;
+		}
+
+		if (ret == -EBUSY)
+			goto again;
+
+		goto put_mm;
+	}
+
+	mutex_lock(&abo->mem.notify_lock);
+	if (mmu_interval_read_retry(&abo->mem.notifier, range.notifier_seq)) {
+		mutex_unlock(&abo->mem.notify_lock);
+		goto again;
+	}
+	abo->mem.map_invalid = false;
+	mutex_unlock(&abo->mem.notify_lock);
+
+put_mm:
+	mmput(mm);
+	return ret;
+}
+
+int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct ww_acquire_ctx acquire_ctx;
+	struct amdxdna_gem_obj *abo;
+	unsigned long timeout = 0;
+	int ret, i;
+
+	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx);
+	if (ret) {
+		XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
+		return ret;
+	}
+
+	drm_sched_job_arm(&job->base);
+	job->out_fence = dma_fence_get(&job->base.s_fence->finished);
+
+retry:
+	ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
+	if (ret) {
+		XDNA_WARN(xdna, "Failed to reverve fence, ret %d", ret);
+		goto put_fence;
+	}
+
+	for (i = 0; i < job->bo_cnt; i++) {
+		abo = to_xdna_obj(job->bos[i]);
+		ret = dma_resv_reserve_fences(job->bos[i]->resv, 1);
+		if (ret) {
+			XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
+			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
+			goto put_fence;
+		}
+
+		mutex_lock(&abo->mem.notify_lock);
+		if (abo->mem.map_invalid) {
+			mutex_unlock(&abo->mem.notify_lock);
+			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
+			if (!timeout) {
+				timeout = jiffies +
+					msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+			} else if (time_after(jiffies, timeout)) {
+				ret = -ETIME;
+				goto put_fence;
+			}
+
+			ret = aie2_populate_range(abo);
+			if (ret)
+				goto put_fence;
+			goto retry;
+		}
+
+		dma_resv_add_fence(job->bos[i]->resv, job->out_fence, DMA_RESV_USAGE_WRITE);
+		mutex_unlock(&abo->mem.notify_lock);
+	}
+
+	drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
+
+	mutex_lock(&hwctx->priv->io_lock);
+	ret = aie2_hwctx_add_job(hwctx, job);
+	if (ret) {
+		mutex_unlock(&hwctx->priv->io_lock);
+		goto signal_fence;
+	}
+
+	*seq = job->seq;
+	drm_sched_entity_push_job(&job->base);
+	mutex_unlock(&hwctx->priv->io_lock);
+
+	return 0;
+
+signal_fence:
+	dma_fence_signal(job->out_fence);
+put_fence:
+	dma_fence_put(job->out_fence);
+	drm_sched_job_cleanup(&job->base);
+	return ret;
+}
+
+int aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout)
+{
+	signed long remaining = MAX_SCHEDULE_TIMEOUT;
+	struct amdxdna_sched_job *job;
+	struct dma_fence *out_fence;
+	long ret;
+
+	mutex_lock(&hwctx->priv->io_lock);
+	job = aie2_hwctx_get_job(hwctx, seq);
+	if (IS_ERR(job)) {
+		mutex_unlock(&hwctx->priv->io_lock);
+		ret = PTR_ERR(job);
+		goto out;
+	}
+
+	if (unlikely(!job)) {
+		mutex_unlock(&hwctx->priv->io_lock);
+		ret = 0;
+		goto out;
+	}
+	out_fence = dma_fence_get(job->out_fence);
+	mutex_unlock(&hwctx->priv->io_lock);
+
+	if (timeout)
+		remaining = msecs_to_jiffies(timeout);
+
+	ret = dma_fence_wait_timeout(out_fence, true, remaining);
+	if (!ret)
+		ret = -ETIME;
+	else if (ret > 0)
+		ret = 0;
+
+	dma_fence_put(out_fence);
+out:
+	return ret;
+}
+
+void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
+			 unsigned long cur_seq)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct drm_gem_object *gobj = to_gobj(abo);
+	long ret;
+
+	mutex_lock(&abo->mem.notify_lock);
+	abo->mem.map_invalid = true;
+	mmu_interval_set_seq(&abo->mem.notifier, cur_seq);
+	mutex_unlock(&abo->mem.notify_lock);
+	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
+				    true, MAX_SCHEDULE_TIMEOUT);
+	if (!ret || ret == -ERESTARTSYS)
+		XDNA_ERR(xdna, "Failed to wait for bo, ret %ld", ret);
+}
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 28bd0560db61..3dc4a9a8571e 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -4,10 +4,12 @@
  */
 
 #include <drm/amdxdna_accel.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/errno.h>
 #include <linux/pci.h>
 #include <linux/types.h>
@@ -361,3 +363,344 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
 		 msg.opcode, resp.status, ret);
 	return ret;
 }
+
+int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+		 int (*notify_cb)(void *, const u32 *, size_t))
+{
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
+	union {
+		struct execute_buffer_req ebuf;
+		struct exec_dpu_req dpu;
+	} req;
+	struct xdna_mailbox_msg msg;
+	u32 payload_len;
+	void *payload;
+	int cu_idx;
+	int ret;
+	u32 op;
+
+	if (!chann)
+		return -ENODEV;
+
+	payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
+	if (!payload) {
+		XDNA_ERR(xdna, "Invalid command, cannot get payload");
+		return -EINVAL;
+	}
+
+	cu_idx = amdxdna_cmd_get_cu_idx(cmd_abo);
+	if (cu_idx < 0) {
+		XDNA_DBG(xdna, "Invalid cu idx");
+		return -EINVAL;
+	}
+
+	op = amdxdna_cmd_get_op(cmd_abo);
+	switch (op) {
+	case ERT_START_CU:
+		if (unlikely(payload_len > sizeof(req.ebuf.payload)))
+			XDNA_DBG(xdna, "Invalid ebuf payload len: %d", payload_len);
+		req.ebuf.cu_idx = cu_idx;
+		memcpy(req.ebuf.payload, payload, sizeof(req.ebuf.payload));
+		msg.send_size = sizeof(req.ebuf);
+		msg.opcode = MSG_OP_EXECUTE_BUFFER_CF;
+		break;
+	case ERT_START_NPU: {
+		struct amdxdna_cmd_start_npu *sn = payload;
+
+		if (unlikely(payload_len - sizeof(*sn) > sizeof(req.dpu.payload)))
+			XDNA_DBG(xdna, "Invalid dpu payload len: %d", payload_len);
+		req.dpu.inst_buf_addr = sn->buffer;
+		req.dpu.inst_size = sn->buffer_size;
+		req.dpu.inst_prop_cnt = sn->prop_count;
+		req.dpu.cu_idx = cu_idx;
+		memcpy(req.dpu.payload, sn->prop_args, sizeof(req.dpu.payload));
+		msg.send_size = sizeof(req.dpu);
+		msg.opcode = MSG_OP_EXEC_DPU;
+		break;
+	}
+	default:
+		XDNA_DBG(xdna, "Invalid ERT cmd op code: %d", op);
+		return -EINVAL;
+	}
+	msg.handle = job;
+	msg.notify_cb = notify_cb;
+	msg.send_data = (u8 *)&req;
+	print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
+			     0x40, false);
+
+	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(xdna, "Send message failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int
+aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
+			      struct amdxdna_gem_obj *abo, u32 *size)
+{
+	struct cmd_chain_slot_execbuf_cf *buf = cmd_buf + offset;
+	int cu_idx = amdxdna_cmd_get_cu_idx(abo);
+	u32 payload_len;
+	void *payload;
+
+	if (cu_idx < 0)
+		return -EINVAL;
+
+	payload = amdxdna_cmd_get_payload(abo, &payload_len);
+	if (!payload)
+		return -EINVAL;
+
+	if (!slot_cf_has_space(offset, payload_len))
+		return -ENOSPC;
+
+	buf->cu_idx = cu_idx;
+	buf->arg_cnt = payload_len / sizeof(u32);
+	memcpy(buf->args, payload, payload_len);
+	/* Accurate buf size to hint firmware to do necessary copy */
+	*size = sizeof(*buf) + payload_len;
+	return 0;
+}
+
+static int
+aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
+			       struct amdxdna_gem_obj *abo, u32 *size)
+{
+	struct cmd_chain_slot_dpu *buf = cmd_buf + offset;
+	int cu_idx = amdxdna_cmd_get_cu_idx(abo);
+	struct amdxdna_cmd_start_npu *sn;
+	u32 payload_len;
+	void *payload;
+	u32 arg_sz;
+
+	if (cu_idx < 0)
+		return -EINVAL;
+
+	payload = amdxdna_cmd_get_payload(abo, &payload_len);
+	if (!payload)
+		return -EINVAL;
+	sn = payload;
+	arg_sz = payload_len - sizeof(*sn);
+	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
+		return -EINVAL;
+
+	if (!slot_dpu_has_space(offset, arg_sz))
+		return -ENOSPC;
+
+	buf->inst_buf_addr = sn->buffer;
+	buf->inst_size = sn->buffer_size;
+	buf->inst_prop_cnt = sn->prop_count;
+	buf->cu_idx = cu_idx;
+	buf->arg_cnt = arg_sz / sizeof(u32);
+	memcpy(buf->args, sn->prop_args, arg_sz);
+
+	/* Accurate buf size to hint firmware to do necessary copy */
+	*size += sizeof(*buf) + arg_sz;
+	return 0;
+}
+
+static int
+aie2_cmdlist_fill_one_slot(u32 op, struct amdxdna_gem_obj *cmdbuf_abo, u32 offset,
+			   struct amdxdna_gem_obj *abo, u32 *size)
+{
+	u32 this_op = amdxdna_cmd_get_op(abo);
+	void *cmd_buf = cmdbuf_abo->mem.kva;
+	int ret;
+
+	if (this_op != op) {
+		ret = -EINVAL;
+		goto done;
+	}
+
+	switch (op) {
+	case ERT_START_CU:
+		ret = aie2_cmdlist_fill_one_slot_cf(cmd_buf, offset, abo, size);
+		break;
+	case ERT_START_NPU:
+		ret = aie2_cmdlist_fill_one_slot_dpu(cmd_buf, offset, abo, size);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+done:
+	if (ret) {
+		XDNA_ERR(abo->client->xdna, "Can't fill slot for cmd op %d ret %d",
+			 op, ret);
+	}
+	return ret;
+}
+
+static inline struct amdxdna_gem_obj *
+aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
+{
+	int idx = get_job_idx(job->seq);
+
+	return job->hwctx->priv->cmd_buf[idx];
+}
+
+static void
+aie2_cmdlist_prepare_request(struct cmd_chain_req *req,
+			     struct amdxdna_gem_obj *cmdbuf_abo, u32 size, u32 cnt)
+{
+	req->buf_addr = cmdbuf_abo->mem.dev_addr;
+	req->buf_size = size;
+	req->count = cnt;
+	drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
+	XDNA_DBG(cmdbuf_abo->client->xdna, "Command buf addr 0x%llx size 0x%x count %d",
+		 req->buf_addr, size, cnt);
+}
+
+static inline u32
+aie2_cmd_op_to_msg_op(u32 op)
+{
+	switch (op) {
+	case ERT_START_CU:
+		return MSG_OP_CHAIN_EXEC_BUFFER_CF;
+	case ERT_START_NPU:
+		return MSG_OP_CHAIN_EXEC_DPU;
+	default:
+		return MSG_OP_MAX_OPCODE;
+	}
+}
+
+int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
+			       struct amdxdna_sched_job *job,
+			       int (*notify_cb)(void *, const u32 *, size_t))
+{
+	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_client *client = hwctx->client;
+	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
+	struct amdxdna_cmd_chain *payload;
+	struct xdna_mailbox_msg msg;
+	struct cmd_chain_req req;
+	u32 payload_len;
+	u32 offset = 0;
+	u32 size;
+	int ret;
+	u32 op;
+	u32 i;
+
+	op = amdxdna_cmd_get_op(cmd_abo);
+	payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
+	if (op != ERT_CMD_CHAIN || !payload ||
+	    payload_len < struct_size(payload, data, payload->command_count))
+		return -EINVAL;
+
+	for (i = 0; i < payload->command_count; i++) {
+		u32 boh = (u32)(payload->data[i]);
+		struct amdxdna_gem_obj *abo;
+
+		abo = amdxdna_gem_get_obj(client, boh, AMDXDNA_BO_CMD);
+		if (!abo) {
+			XDNA_ERR(client->xdna, "Failed to find cmd BO %d", boh);
+			return -ENOENT;
+		}
+
+		/* All sub-cmd should have same op, use the first one. */
+		if (i == 0)
+			op = amdxdna_cmd_get_op(abo);
+
+		ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, offset, abo, &size);
+		amdxdna_gem_put_obj(abo);
+		if (ret)
+			return -EINVAL;
+
+		offset += size;
+	}
+
+	/* The offset is the accumulated total size of the cmd buffer */
+	aie2_cmdlist_prepare_request(&req, cmdbuf_abo, offset, payload->command_count);
+
+	msg.opcode = aie2_cmd_op_to_msg_op(op);
+	if (msg.opcode == MSG_OP_MAX_OPCODE)
+		return -EOPNOTSUPP;
+	msg.handle = job;
+	msg.notify_cb = notify_cb;
+	msg.send_data = (u8 *)&req;
+	msg.send_size = sizeof(req);
+	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(hwctx->client->xdna, "Send message failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
+				struct amdxdna_sched_job *job,
+				int (*notify_cb)(void *, const u32 *, size_t))
+{
+	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
+	struct xdna_mailbox_msg msg;
+	struct cmd_chain_req req;
+	u32 size;
+	int ret;
+	u32 op;
+
+	op = amdxdna_cmd_get_op(cmd_abo);
+	ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, 0, cmd_abo, &size);
+	if (ret)
+		return ret;
+
+	aie2_cmdlist_prepare_request(&req, cmdbuf_abo, size, 1);
+
+	msg.opcode = aie2_cmd_op_to_msg_op(op);
+	if (msg.opcode == MSG_OP_MAX_OPCODE)
+		return -EOPNOTSUPP;
+	msg.handle = job;
+	msg.notify_cb = notify_cb;
+	msg.send_data = (u8 *)&req;
+	msg.send_size = sizeof(req);
+	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(hwctx->client->xdna, "Send message failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+		 int (*notify_cb)(void *, const u32 *, size_t))
+{
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct xdna_mailbox_msg msg;
+	struct sync_bo_req req;
+	int ret = 0;
+
+	req.src_addr = 0;
+	req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap->mem.dev_addr;
+	req.size = abo->mem.size;
+
+	/* Device to Host */
+	req.type = FIELD_PREP(AIE2_MSG_SYNC_BO_SRC_TYPE, SYNC_BO_DEV_MEM) |
+		FIELD_PREP(AIE2_MSG_SYNC_BO_DST_TYPE, SYNC_BO_HOST_MEM);
+
+	XDNA_DBG(xdna, "sync %d bytes src(0x%llx) to dst(0x%llx) completed",
+		 req.size, req.src_addr, req.dst_addr);
+
+	msg.handle = job;
+	msg.notify_cb = notify_cb;
+	msg.send_data = (u8 *)&req;
+	msg.send_size = sizeof(req);
+	msg.opcode = MSG_OP_SYNC_BO;
+
+	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(xdna, "Send message failed");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index ee9f114bc229..6017826a7104 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -5,8 +5,10 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/iommu.h>
@@ -17,6 +19,7 @@
 #include "aie2_pci.h"
 #include "aie2_solver.h"
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
@@ -499,4 +502,7 @@ const struct amdxdna_dev_ops aie2_ops = {
 	.hwctx_init     = aie2_hwctx_init,
 	.hwctx_fini     = aie2_hwctx_fini,
 	.hwctx_config   = aie2_hwctx_config,
+	.cmd_submit     = aie2_cmd_submit,
+	.cmd_wait       = aie2_cmd_wait,
+	.hmm_invalidate = aie2_hmm_invalidate,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 3ac936e2c9d1..81877d9c0542 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -76,6 +76,7 @@ enum psp_reg_idx {
 	PSP_MAX_REGS /* Keep this at the end */
 };
 
+struct amdxdna_client;
 struct amdxdna_fw_ver;
 struct amdxdna_hwctx;
 
@@ -118,9 +119,28 @@ struct rt_config {
 	u32	value;
 };
 
+/*
+ * Define the maximum number of pending commands in a hardware context.
+ * Must be power of 2!
+ */
+#define HWCTX_MAX_CMDS		4
+#define get_job_idx(seq) ((seq) & (HWCTX_MAX_CMDS - 1))
 struct amdxdna_hwctx_priv {
 	struct amdxdna_gem_obj		*heap;
 	void				*mbox_chann;
+
+	struct drm_gpu_scheduler	sched;
+	struct drm_sched_entity		entity;
+
+	struct mutex			io_lock; /* protect seq and cmd order */
+	struct wait_queue_head		job_free_wq;
+	struct amdxdna_sched_job	*pending[HWCTX_MAX_CMDS];
+	u32				num_pending;
+	u64				seq;
+	/* Completed job counter */
+	u64				completed;
+
+	struct amdxdna_gem_obj		*cmd_buf[HWCTX_MAX_CMDS];
 };
 
 struct amdxdna_dev_hdl {
@@ -199,10 +219,25 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
+int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+		 int (*notify_cb)(void *, const u32 *, size_t));
+int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
+				struct amdxdna_sched_job *job,
+				int (*notify_cb)(void *, const u32 *, size_t));
+int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
+			       struct amdxdna_sched_job *job,
+			       int (*notify_cb)(void *, const u32 *, size_t));
+int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+		 int (*notify_cb)(void *, const u32 *, size_t));
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
+int aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
+void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
+void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map);
+void aie2_restart_ctx(struct amdxdna_client *client);
 
 #endif /* _AIE2_PCI_H_ */
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index 2efcfd1941bf..35ba55e2ab1e 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -4,8 +4,10 @@
  */
 
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/iopoll.h>
 
 #include "aie2_pci.h"
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 3fa7064649aa..91893d438da7 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -4,7 +4,9 @@
  */
 
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/iopoll.h>
 
 #include "aie2_pci.h"
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 8acf8bfe0db9..b76640e1fdd0 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -7,17 +7,65 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
+#include <trace/events/amdxdna.h>
 
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
 
 #define MAX_HWCTX_ID		255
+#define MAX_ARG_COUNT		4095
 
-static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
+struct amdxdna_fence {
+	struct dma_fence	base;
+	spinlock_t		lock; /* for base */
+	struct amdxdna_hwctx	*hwctx;
+};
+
+static const char *amdxdna_fence_get_driver_name(struct dma_fence *fence)
+{
+	return KBUILD_MODNAME;
+}
+
+static const char *amdxdna_fence_get_timeline_name(struct dma_fence *fence)
+{
+	struct amdxdna_fence *xdna_fence;
+
+	xdna_fence = container_of(fence, struct amdxdna_fence, base);
+
+	return xdna_fence->hwctx->name;
+}
+
+static const struct dma_fence_ops fence_ops = {
+	.get_driver_name = amdxdna_fence_get_driver_name,
+	.get_timeline_name = amdxdna_fence_get_timeline_name,
+};
+
+static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return NULL;
+
+	fence->hwctx = hwctx;
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &fence_ops, &fence->lock, hwctx->id, 0);
+	return &fence->base;
+}
+
+static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
+				      struct srcu_struct *ss)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
 
+	synchronize_srcu(ss);
+
 	/* At this point, user is not able to submit new commands */
 	mutex_lock(&xdna->dev_lock);
 	xdna->dev_info->ops->hwctx_fini(hwctx);
@@ -27,6 +75,46 @@ static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
 	kfree(hwctx);
 }
 
+void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
+{
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+	u32 num_masks, count;
+
+	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
+		num_masks = 0;
+	else
+		num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
+
+	if (size) {
+		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
+		if (unlikely(count <= num_masks)) {
+			*size = 0;
+			return NULL;
+		}
+		*size = (count - num_masks) * sizeof(u32);
+	}
+	return &cmd->data[num_masks];
+}
+
+int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+	u32 num_masks, i;
+	u32 *cu_mask;
+
+	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
+		return -1;
+
+	num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
+	cu_mask = cmd->data;
+	for (i = 0; i < num_masks; i++) {
+		if (cu_mask[i])
+			return ffs(cu_mask[i]) - 1;
+	}
+
+	return -1;
+}
+
 /*
  * This should be called in close() and remove(). DO NOT call in other syscalls.
  * This guarantee that when hwctx and resources will be released, if user
@@ -43,7 +131,7 @@ void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
 			 client->pid, hwctx->id);
 		idr_remove(&client->hwctx_idr, hwctx->id);
 		mutex_unlock(&client->hwctx_lock);
-		amdxdna_hwctx_destroy(hwctx);
+		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 		mutex_lock(&client->hwctx_lock);
 	}
 	mutex_unlock(&client->hwctx_lock);
@@ -134,6 +222,12 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
+	/*
+	 * Use hwctx_lock to achieve exclusion with other hwctx writers,
+	 * SRCU to synchronize with exec/wait command ioctls.
+	 *
+	 * The pushed jobs are handled by DRM scheduler during destroy.
+	 */
 	mutex_lock(&client->hwctx_lock);
 	hwctx = idr_find(&client->hwctx_idr, args->handle);
 	if (!hwctx) {
@@ -146,7 +240,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	idr_remove(&client->hwctx_idr, hwctx->id);
 	mutex_unlock(&client->hwctx_lock);
 
-	amdxdna_hwctx_destroy(hwctx);
+	amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 
 	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
 out:
@@ -160,10 +254,10 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	struct amdxdna_drm_config_hwctx *args = data;
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_hwctx *hwctx;
+	int ret, idx;
 	u32 buf_size;
 	void *buf;
 	u64 val;
-	int ret;
 
 	if (!xdna->dev_info->ops->hwctx_config)
 		return -EOPNOTSUPP;
@@ -202,17 +296,286 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	}
 
 	mutex_lock(&xdna->dev_lock);
+	idx = srcu_read_lock(&client->hwctx_srcu);
 	hwctx = idr_find(&client->hwctx_idr, args->handle);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
 		ret = -EINVAL;
-		goto unlock;
+		goto unlock_srcu;
 	}
 
 	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
 
-unlock:
+unlock_srcu:
+	srcu_read_unlock(&client->hwctx_srcu, idx);
 	mutex_unlock(&xdna->dev_lock);
 	kfree(buf);
 	return ret;
 }
+
+static void
+amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
+{
+	int i;
+
+	for (i = 0; i < job->bo_cnt; i++) {
+		if (!job->bos[i])
+			break;
+		drm_gem_object_put(job->bos[i]);
+	}
+}
+
+static int
+amdxdna_arg_bos_lookup(struct amdxdna_client *client,
+		       struct amdxdna_sched_job *job,
+		       u32 *bo_hdls, u32 bo_cnt)
+{
+	struct drm_gem_object *gobj;
+	int i, ret;
+
+	job->bo_cnt = bo_cnt;
+	for (i = 0; i < job->bo_cnt; i++) {
+		struct amdxdna_gem_obj *abo;
+
+		gobj = drm_gem_object_lookup(client->filp, bo_hdls[i]);
+		if (!gobj) {
+			ret = -ENOENT;
+			goto put_shmem_bo;
+		}
+		abo = to_xdna_obj(gobj);
+
+		mutex_lock(&abo->lock);
+		if (abo->pinned) {
+			mutex_unlock(&abo->lock);
+			job->bos[i] = gobj;
+			continue;
+		}
+
+		ret = amdxdna_gem_pin_nolock(abo);
+		if (ret) {
+			mutex_unlock(&abo->lock);
+			drm_gem_object_put(gobj);
+			goto put_shmem_bo;
+		}
+		abo->pinned = true;
+		mutex_unlock(&abo->lock);
+
+		job->bos[i] = gobj;
+	}
+
+	return 0;
+
+put_shmem_bo:
+	amdxdna_arg_bos_put(job);
+	return ret;
+}
+
+static void amdxdna_sched_job_release(struct kref *ref)
+{
+	struct amdxdna_sched_job *job;
+
+	job = container_of(ref, struct amdxdna_sched_job, refcnt);
+
+	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
+	amdxdna_arg_bos_put(job);
+	amdxdna_gem_put_obj(job->cmd_bo);
+	kfree(job);
+}
+
+void amdxdna_job_put(struct amdxdna_sched_job *job)
+{
+	kref_put(&job->refcnt, amdxdna_sched_job_release);
+}
+
+int amdxdna_cmd_submit(struct amdxdna_client *client,
+		       u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
+		       u32 hwctx_hdl, u64 *seq)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_sched_job *job;
+	struct amdxdna_hwctx *hwctx;
+	int ret, idx;
+
+	XDNA_DBG(xdna, "Command BO hdl %d, Arg BO count %d", cmd_bo_hdl, arg_bo_cnt);
+	job = kzalloc(struct_size(job, bos, arg_bo_cnt), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
+		job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, AMDXDNA_BO_CMD);
+		if (!job->cmd_bo) {
+			XDNA_ERR(xdna, "Failed to get cmd bo from %d", cmd_bo_hdl);
+			ret = -EINVAL;
+			goto free_job;
+		}
+	} else {
+		job->cmd_bo = NULL;
+	}
+
+	ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, arg_bo_cnt);
+	if (ret) {
+		XDNA_ERR(xdna, "Argument BOs lookup failed, ret %d", ret);
+		goto cmd_put;
+	}
+
+	idx = srcu_read_lock(&client->hwctx_srcu);
+	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
+	if (!hwctx) {
+		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
+			 client->pid, hwctx_hdl);
+		ret = -EINVAL;
+		goto unlock_srcu;
+	}
+
+	if (hwctx->status != HWCTX_STAT_READY) {
+		XDNA_ERR(xdna, "HW Context is not ready");
+		ret = -EINVAL;
+		goto unlock_srcu;
+	}
+
+	job->hwctx = hwctx;
+	job->mm = current->mm;
+
+	job->fence = amdxdna_fence_create(hwctx);
+	if (!job->fence) {
+		XDNA_ERR(xdna, "Failed to create fence");
+		ret = -ENOMEM;
+		goto unlock_srcu;
+	}
+	kref_init(&job->refcnt);
+
+	ret = xdna->dev_info->ops->cmd_submit(hwctx, job, seq);
+	if (ret)
+		goto put_fence;
+
+	/*
+	 * The amdxdna_hwctx_destroy_rcu() will release hwctx and associated
+	 * resource after synchronize_srcu(). The submitted jobs should be
+	 * handled by the queue, for example DRM scheduler, in device layer.
+	 * For here we can unlock SRCU.
+	 */
+	srcu_read_unlock(&client->hwctx_srcu, idx);
+	trace_amdxdna_debug_point(hwctx->name, *seq, "job pushed");
+
+	return 0;
+
+put_fence:
+	dma_fence_put(job->fence);
+unlock_srcu:
+	srcu_read_unlock(&client->hwctx_srcu, idx);
+	amdxdna_arg_bos_put(job);
+cmd_put:
+	amdxdna_gem_put_obj(job->cmd_bo);
+free_job:
+	kfree(job);
+	return ret;
+}
+
+/*
+ * The submit command ioctl submits a command to firmware. One firmware command
+ * may contain multiple command BOs for processing as a whole.
+ * The command sequence number is returned which can be used for wait command ioctl.
+ */
+static int amdxdna_drm_submit_execbuf(struct amdxdna_client *client,
+				      struct amdxdna_drm_exec_cmd *args)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	u32 *arg_bo_hdls;
+	u32 cmd_bo_hdl;
+	int ret;
+
+	if (!args->arg_count || args->arg_count > MAX_ARG_COUNT) {
+		XDNA_ERR(xdna, "Invalid arg bo count %d", args->arg_count);
+		return -EINVAL;
+	}
+
+	/* Only support single command for now. */
+	if (args->cmd_count != 1) {
+		XDNA_ERR(xdna, "Invalid cmd bo count %d", args->cmd_count);
+		return -EINVAL;
+	}
+
+	cmd_bo_hdl = (u32)args->cmd_handles;
+	arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), GFP_KERNEL);
+	if (!arg_bo_hdls)
+		return -ENOMEM;
+	ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
+			     args->arg_count * sizeof(u32));
+	if (ret) {
+		ret = -EFAULT;
+		goto free_cmd_bo_hdls;
+	}
+
+	ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
+				 args->arg_count, args->hwctx, &args->seq);
+	if (ret)
+		XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
+
+free_cmd_bo_hdls:
+	kfree(arg_bo_hdls);
+	if (!ret)
+		XDNA_DBG(xdna, "Pushed cmd %lld to scheduler", args->seq);
+	return ret;
+}
+
+int amdxdna_drm_submit_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_drm_exec_cmd *args = data;
+
+	if (args->ext || args->ext_flags)
+		return -EINVAL;
+
+	switch (args->type) {
+	case AMDXDNA_CMD_SUBMIT_EXEC_BUF:
+		return amdxdna_drm_submit_execbuf(client, args);
+	}
+
+	XDNA_ERR(client->xdna, "Invalid command type %d", args->type);
+	return -EINVAL;
+}
+
+int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
+		     u64 seq, u32 timeout)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int ret, idx;
+
+	if (!xdna->dev_info->ops->cmd_wait)
+		return -EOPNOTSUPP;
+
+	/* For locking concerns, see amdxdna_drm_exec_cmd_ioctl. */
+	idx = srcu_read_lock(&client->hwctx_srcu);
+	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
+	if (!hwctx) {
+		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
+			 client->pid, hwctx_hdl);
+		ret = -EINVAL;
+		goto unlock_hwctx_srcu;
+	}
+
+	ret = xdna->dev_info->ops->cmd_wait(hwctx, seq, timeout);
+
+unlock_hwctx_srcu:
+	srcu_read_unlock(&client->hwctx_srcu, idx);
+	return ret;
+}
+
+int amdxdna_drm_wait_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_wait_cmd *args = data;
+	int ret;
+
+	XDNA_DBG(xdna, "PID %d hwctx %d timeout set %d ms for cmd %lld",
+		 client->pid, args->hwctx, args->timeout, args->seq);
+
+	ret = amdxdna_cmd_wait(client, args->hwctx, args->seq, args->timeout);
+
+	XDNA_DBG(xdna, "PID %d hwctx %d cmd %lld wait finished, ret %d",
+		 client->pid, args->hwctx, args->seq, ret);
+
+	return ret;
+}
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 665b3208897d..65f9c1dfe32c 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -6,6 +6,52 @@
 #ifndef _AMDXDNA_CTX_H_
 #define _AMDXDNA_CTX_H_
 
+#include "amdxdna_gem.h"
+
+struct amdxdna_hwctx_priv;
+
+enum ert_cmd_opcode {
+	ERT_START_CU      = 0,
+	ERT_CMD_CHAIN     = 19,
+	ERT_START_NPU     = 20,
+};
+
+enum ert_cmd_state {
+	ERT_CMD_STATE_INVALID,
+	ERT_CMD_STATE_NEW,
+	ERT_CMD_STATE_QUEUED,
+	ERT_CMD_STATE_RUNNING,
+	ERT_CMD_STATE_COMPLETED,
+	ERT_CMD_STATE_ERROR,
+	ERT_CMD_STATE_ABORT,
+	ERT_CMD_STATE_SUBMITTED,
+	ERT_CMD_STATE_TIMEOUT,
+	ERT_CMD_STATE_NORESPONSE,
+};
+
+/*
+ * Interpretation of the beginning of data payload for ERT_START_NPU in
+ * amdxdna_cmd. The rest of the payload in amdxdna_cmd is regular kernel args.
+ */
+struct amdxdna_cmd_start_npu {
+	u64 buffer;       /* instruction buffer address */
+	u32 buffer_size;  /* size of buffer in bytes */
+	u32 prop_count;	  /* properties count */
+	u32 prop_args[];  /* properties and regular kernel arguments */
+};
+
+/*
+ * Interpretation of the beginning of data payload for ERT_CMD_CHAIN in
+ * amdxdna_cmd. The rest of the payload in amdxdna_cmd is cmd BO handles.
+ */
+struct amdxdna_cmd_chain {
+	u32 command_count;
+	u32 submit_index;
+	u32 error_index;
+	u32 reserved[3];
+	u64 data[] __counted_by(command_count);
+};
+
 /* Exec buffer command header format */
 #define AMDXDNA_CMD_STATE		GENMASK(3, 0)
 #define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
@@ -40,9 +86,73 @@ struct amdxdna_hwctx {
 	struct amdxdna_hwctx_param_config_cu *cus;
 };
 
+#define drm_job_to_xdna_job(j) \
+	container_of(j, struct amdxdna_sched_job, base)
+
+struct amdxdna_sched_job {
+	struct drm_sched_job	base;
+	struct kref		refcnt;
+	struct amdxdna_hwctx	*hwctx;
+	struct mm_struct	*mm;
+	/* The fence to notice DRM scheduler that job is done by hardware */
+	struct dma_fence	*fence;
+	/* user can wait on this fence */
+	struct dma_fence	*out_fence;
+	u64			seq;
+	struct amdxdna_gem_obj	*cmd_bo;
+	size_t			bo_cnt;
+	struct drm_gem_object	*bos[] __counted_by(bo_cnt);
+};
+
+static inline u32
+amdxdna_cmd_get_op(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+
+	return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
+}
+
+static inline void
+amdxdna_cmd_set_state(struct amdxdna_gem_obj *abo, enum ert_cmd_state s)
+{
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+
+	cmd->header &= ~AMDXDNA_CMD_STATE;
+	cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
+}
+
+static inline enum ert_cmd_state
+amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+
+	return FIELD_GET(AMDXDNA_CMD_STATE, cmd->header);
+}
+
+void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
+int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
+
+static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
+{
+	return GENMASK(hwctx->start_col + hwctx->num_col - 1,
+		       hwctx->start_col);
+}
+
+void amdxdna_job_put(struct amdxdna_sched_job *job);
+
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+
+int amdxdna_cmd_submit(struct amdxdna_client *client,
+		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
+		       u32 hwctx_hdl, u64 *seq);
+
+int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
+		     u64 seq, u32 timeout);
+
 int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
 int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
 int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+int amdxdna_drm_submit_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+int amdxdna_drm_wait_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
 
 #endif /* _AMDXDNA_CTX_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index f2ba86ae9e1a..6a105430e726 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -8,6 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/iosys-map.h>
 #include <linux/vmalloc.h>
 
@@ -72,6 +73,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 		vunmap(abo->mem.kva);
 		drm_gem_object_put(to_gobj(abo->dev_heap));
 		drm_gem_object_release(gobj);
+		mutex_destroy(&abo->mem.notify_lock);
 		mutex_destroy(&abo->lock);
 		kfree(abo);
 		return;
@@ -81,6 +83,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 		drm_mm_takedown(&abo->mm);
 
 	drm_gem_vunmap_unlocked(gobj, &map);
+	mutex_destroy(&abo->mem.notify_lock);
 	mutex_destroy(&abo->lock);
 	drm_gem_shmem_free(&abo->base);
 }
@@ -234,6 +237,13 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
 	abo->pinned = false;
 	abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
 	mutex_init(&abo->lock);
+	mutex_init(&abo->mem.notify_lock);
+
+	if (IS_ENABLED(CONFIG_LOCKDEP)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&abo->mem.notify_lock);
+		fs_reclaim_release(GFP_KERNEL);
+	}
 
 	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
 	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index 8ccc0375dd9d..0c91348298da 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -16,6 +16,7 @@ struct amdxdna_mem {
 	struct mmu_interval_notifier	notifier;
 	unsigned long			*pfns;
 	bool				map_invalid;
+	struct mutex			notify_lock; /* for map_invalid */
 };
 
 struct amdxdna_gem_obj {
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
index 42b615394605..5139a9c96a91 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
@@ -3,10 +3,15 @@
  * Copyright (C) 2024, Advanced Micro Devices, Inc.
  */
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/completion.h>
 
+#include "amdxdna_gem.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_mailbox_helper.h"
 #include "amdxdna_pci_drv.h"
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index e48a01a1c235..400e93674dde 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/iommu.h>
 #include <linux/pci.h>
 
@@ -64,6 +65,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 		goto unbind_sva;
 	}
 	mutex_init(&client->hwctx_lock);
+	init_srcu_struct(&client->hwctx_srcu);
 	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
 	mutex_init(&client->mm_lock);
 
@@ -93,6 +95,7 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 	XDNA_DBG(xdna, "closing pid %d", client->pid);
 
 	idr_destroy(&client->hwctx_idr);
+	cleanup_srcu_struct(&client->hwctx_srcu);
 	mutex_destroy(&client->hwctx_lock);
 	mutex_destroy(&client->mm_lock);
 	if (client->dev_heap)
@@ -133,6 +136,9 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_BO, amdxdna_drm_create_bo_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_BO_INFO, amdxdna_drm_get_bo_info_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_SYNC_BO, amdxdna_drm_sync_bo_ioctl, 0),
+	/* Exectuion */
+	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_WAIT_CMD, amdxdna_drm_wait_cmd_ioctl, 0),
 };
 
 static const struct file_operations amdxdna_fops = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 3dddde4ac12a..0324e73094b2 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -20,6 +20,7 @@ extern const struct drm_driver amdxdna_drm_drv;
 struct amdxdna_dev;
 struct amdxdna_gem_obj;
 struct amdxdna_hwctx;
+struct amdxdna_sched_job;
 
 /*
  * struct amdxdna_dev_ops - Device hardware operation callbacks
@@ -31,6 +32,8 @@ struct amdxdna_dev_ops {
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
+	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
+	int (*cmd_wait)(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
 };
 
 /*
@@ -88,6 +91,8 @@ struct amdxdna_client {
 	struct list_head		node;
 	pid_t				pid;
 	struct mutex			hwctx_lock; /* protect hwctx */
+	/* do NOT wait this srcu when hwctx_lock is hold */
+	struct srcu_struct		hwctx_srcu;
 	struct idr			hwctx_idr;
 	struct amdxdna_dev		*xdna;
 	struct drm_file			*filp;
diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
index 668b94b92714..f27e4ee960a0 100644
--- a/drivers/accel/amdxdna/amdxdna_sysfs.c
+++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
@@ -3,9 +3,14 @@
  * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
  */
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
+#include <drm/gpu_scheduler.h>
+#include <linux/types.h>
 
+#include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
 
 static ssize_t vbnv_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 720aab0ed7c4..f00c50461b09 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index f3ea18bcf294..00cb381031d2 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index db61142f0d4e..b6dae9667cca 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index debf4e95b9bb..bed1baf8e160 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
diff --git a/include/trace/events/amdxdna.h b/include/trace/events/amdxdna.h
index 33343d8f0622..c6cb2da7b706 100644
--- a/include/trace/events/amdxdna.h
+++ b/include/trace/events/amdxdna.h
@@ -9,8 +9,49 @@
 #if !defined(_TRACE_AMDXDNA_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_AMDXDNA_H
 
+#include <drm/gpu_scheduler.h>
 #include <linux/tracepoint.h>
 
+TRACE_EVENT(amdxdna_debug_point,
+	    TP_PROTO(const char *name, u64 number, const char *str),
+
+	    TP_ARGS(name, number, str),
+
+	    TP_STRUCT__entry(__string(name, name)
+			     __field(u64, number)
+			     __string(str, str)),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->number = number;
+			   __assign_str(str);),
+
+	    TP_printk("%s:%llu %s", __get_str(name), __entry->number,
+		      __get_str(str))
+);
+
+TRACE_EVENT(xdna_job,
+	    TP_PROTO(struct drm_sched_job *sched_job, const char *name, const char *str, u64 seq),
+
+	    TP_ARGS(sched_job, name, str, seq),
+
+	    TP_STRUCT__entry(__string(name, name)
+			     __string(str, str)
+			     __field(u64, fence_context)
+			     __field(u64, fence_seqno)
+			     __field(u64, seq)),
+
+	    TP_fast_assign(__assign_str(name);
+			   __assign_str(str);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+			   __entry->seq = seq;),
+
+	    TP_printk("fence=(context:%llu, seqno:%lld), %s seq#:%lld %s",
+		      __entry->fence_context, __entry->fence_seqno,
+		      __get_str(name), __entry->seq,
+		      __get_str(str))
+);
+
 DECLARE_EVENT_CLASS(xdna_mbox_msg,
 		    TP_PROTO(char *name, u8 chann_id, u32 opcode, u32 msg_id),
 
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 3792750834b2..08f3ec7146ab 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -13,6 +13,7 @@
 extern "C" {
 #endif
 
+#define AMDXDNA_INVALID_CMD_HANDLE	(~0UL)
 #define AMDXDNA_INVALID_ADDR		(~0UL)
 #define AMDXDNA_INVALID_CTX_HANDLE	0
 #define AMDXDNA_INVALID_BO_HANDLE	0
@@ -29,6 +30,8 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_CREATE_BO,
 	DRM_AMDXDNA_GET_BO_INFO,
 	DRM_AMDXDNA_SYNC_BO,
+	DRM_AMDXDNA_EXEC_CMD,
+	DRM_AMDXDNA_WAIT_CMD,
 };
 
 /**
@@ -201,6 +204,54 @@ struct amdxdna_drm_sync_bo {
 	__u64 size;
 };
 
+enum amdxdna_cmd_type {
+	AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
+	AMDXDNA_CMD_SUBMIT_DEPENDENCY,
+	AMDXDNA_CMD_SUBMIT_SIGNAL,
+};
+
+/**
+ * struct amdxdna_drm_exec_cmd - Execute command.
+ * @ext: MBZ.
+ * @ext_flags: MBZ.
+ * @hwctx: Hardware context handle.
+ * @type: One of command type in enum amdxdna_cmd_type.
+ * @cmd_handles: Array of command handles or the command handle itself
+ *               in case of just one.
+ * @args: Array of arguments for all command handles.
+ * @cmd_count: Number of command handles in the cmd_handles array.
+ * @arg_count: Number of arguments in the args array.
+ * @seq: Returned sequence number for this command.
+ */
+struct amdxdna_drm_exec_cmd {
+	__u64 ext;
+	__u64 ext_flags;
+	__u32 hwctx;
+	__u32 type;
+	__u64 cmd_handles;
+	__u64 args;
+	__u32 cmd_count;
+	__u32 arg_count;
+	__u64 seq;
+};
+
+/**
+ * struct amdxdna_drm_wait_cmd - Wait exectuion command.
+ *
+ * @hwctx: hardware context handle.
+ * @timeout: timeout in ms, 0 implies infinite wait.
+ * @seq: sequence number of the command returned by execute command.
+ *
+ * Wait a command specified by seq to be completed.
+ * Using AMDXDNA_INVALID_CMD_HANDLE as seq means wait till there is a free slot
+ * to submit a new command.
+ */
+struct amdxdna_drm_wait_cmd {
+	__u32 hwctx;
+	__u32 timeout;
+	__u64 seq;
+};
+
 #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
 		 struct amdxdna_drm_create_hwctx)
@@ -225,6 +276,14 @@ struct amdxdna_drm_sync_bo {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SYNC_BO, \
 		 struct amdxdna_drm_sync_bo)
 
+#define DRM_IOCTL_AMDXDNA_EXEC_CMD \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_EXEC_CMD, \
+		 struct amdxdna_drm_exec_cmd)
+
+#define DRM_IOCTL_AMDXDNA_WAIT_CMD \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_WAIT_CMD, \
+		 struct amdxdna_drm_wait_cmd)
+
 #if defined(__cplusplus)
 } /* extern c end */
 #endif
-- 
2.34.1

