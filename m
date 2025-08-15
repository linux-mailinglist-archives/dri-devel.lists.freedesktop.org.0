Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEBB284D4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 19:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1F610E277;
	Fri, 15 Aug 2025 17:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i3huzt8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43F10E277
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 17:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjwZ3oUktYPB1ExzeT7nSpkZoam/VPU6I1ZWITtiHu4Ooq5p4B6a8FfMADlOK8nj3++b8wlKZm+NMKbfZpiBrDIDkypBxX93BuR6Lu30XvJZHbzSZgUZENU/8W1JRr8Xz8PFt7aEexarIuHFO6L43PHRaKS4blbC1wIEqYsVn8uaxz2jwPGKtCEHkn0klassyOUrayommQESWu5wy82nRgspbpSuYiR14vaCrPHyB9BC5+ZFxJB57mLtzvmgClnUzv9NfXVkHZaNcsi8L/GiJfmM8iWRAc5mkzD2a1vj2IG2oaoqFyx0/XfAPSOHsRU4EVksujgZatLlJrp2lT03og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RxR+kP3Hc1TfiIK2G+xZfkJOeErhRMw5VwBfu2SIkA=;
 b=Y3Y9+NeQCwHtuuoG0PjiHdO+BpPY1QcNK98wFtOPx82p1aoxXOKV6k5bxbsCGKdgNTiyaLZJzblrejmx+z3znd9Y7tGmyyakC28Y7YAwYICKJUKd7qDF3+qzOtFo6lUthzujH6TEgzZpLklQBLYxLhiU3WQxdP221IuxiWBBSoLoeo0v7RcP/scU4q13KLbIqQoViYQBCXOQ0G/yBHGkj8u0a6jnAspvrYBTL/ZmdOt2TihwEMEk3U3p0KUGHqZS38SbIpGinLFrgH5jbstdNA7ES/HykeSHtt4aBoqVufBuNd0CDjuw8ex2jeRf3N2a0R48XvvKukjSRIsEOfhHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RxR+kP3Hc1TfiIK2G+xZfkJOeErhRMw5VwBfu2SIkA=;
 b=i3huzt8Q8nY1XoXLeL1tPFng7PKlWpMdkJF9v7n93kBVrRcchX5F0IxbrMBnXCTd05FzBYIe+3aBkj3B/7q6mYvq+oFKXz3gS6iOuiswfP0RhR1wMzv8sSueA/Pvb+TDSxwdAtS0J2rQjKvo3sYm/HOcYpOhyJVrneFYHKqL+HQ=
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 17:17:00 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::bb) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 17:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 17:16:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 12:16:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 12:16:58 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 12:16:57 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Add a function to walk hardware contexts
Date: Fri, 15 Aug 2025 10:16:34 -0700
Message-ID: <20250815171634.3417487-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 748f6b20-ccab-4d1f-a88b-08dddc1f8b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iGc0i81/RmL4rcrDI/fRKzoZnph4GyPuj2OntpGe4GDWzr+tIKhqH5+EY8Ya?=
 =?us-ascii?Q?ibSR4y+gT7+E0vFbDaJ2tq25u+wNWpmILc12Y1q7ZAFVWyTKy/mutCZ9ZY3D?=
 =?us-ascii?Q?maUIJ/JWSxLoHDViKdOvYzCRYQuHF/vgF/kmKuW1OqcM6XXfOLnx0zsY+P3g?=
 =?us-ascii?Q?9/JE3AWDv/AQ94eg9gf0etgDytCl42mRAuqFF3QIJle6k+oMA5hCikCQIUUi?=
 =?us-ascii?Q?4HzEqqtS90MjW/fBICH7tw1wzgy5Uu+Os84atXaGd7vj7cc+707KNqdn7F/1?=
 =?us-ascii?Q?9Sn3Uh34dM6jkHPbBF2gVvG4HviGts1bUQjJHTxAMiOuVhfBFpaMFYTRJWA2?=
 =?us-ascii?Q?LtcZOxPDHhw7r8nIql7sJsmfs5va7mr42wgHw4wtW/xRNdsauNcrPy1tYN2+?=
 =?us-ascii?Q?YyzMqAC369IzjD4/8CPbPGBmvRQ+DassFjanVTM9pzsr+nBfIveXQVBxXRsU?=
 =?us-ascii?Q?775LnvSARX8uu/SnLaZLYs17KvDp2M3kn1+GKKIJId+96iStdgCIn9GWnHIn?=
 =?us-ascii?Q?9kS4FXSEbJ/GFO157XHOMp9NVFj0hBta8lqYp8su2mm4C9/JWczoaVjkY8Wb?=
 =?us-ascii?Q?psxUf0G3AhbxKZfcq4C4/WXP++l1lT2t+0VvMJ1SYGYIPENNzMnREuVCLF4n?=
 =?us-ascii?Q?rMKMuJVG/+kUq16GPjjvtSk/pXEQc4xE1zc8D5PVhpvhU+PuEriy8W3FBhZN?=
 =?us-ascii?Q?/s3hLc+RnR64gCY4DIjMvkFtNmLBX+6Xv+TckxpFBm4/mVS7aUrdcDKh5QCK?=
 =?us-ascii?Q?9fn34z8Re8JybmGKTl7gwgRID8RsiJBEsvvr9E21oBp8PydKooYDNFCLvwcA?=
 =?us-ascii?Q?FyU4pliwlrD2DE+aLZ6S4k9+QjLazBQj9ILdhtbFfoj3SN6BOwyHK+YWmmkX?=
 =?us-ascii?Q?MLSzKyURduqZiG6uxB2vmF03rDXEj6GZ1kglPpjcd2NKBb8EvfUwvLKIbXoo?=
 =?us-ascii?Q?T999oWe6FwERmtmJVb/SMX50PIeLa7ao0dFAgrDok3d8d/jmWbyT5d+SrNhJ?=
 =?us-ascii?Q?PaPwau6I5WtYIPjz8GHzmWfF362AbJIQPGGYpeziF78M4ZzWAuot1JmxjQiR?=
 =?us-ascii?Q?uaTkqVIZafz/KCIl6Nz4duVX4DAyZu15JLGy2c0uHtqMg5+ax8JB2GofwVZU?=
 =?us-ascii?Q?PNa5crT9uZbIyt+RntJtuwHQwDtZLPTrPGJhemYB8R3hl/1FYxmpB3DI1wkQ?=
 =?us-ascii?Q?5Y9aSFRd7KkupvbENGBLu7wXq0YWarTAOoN1YI9mp0aU75f9TjU2u5MwlyVN?=
 =?us-ascii?Q?q6xFzg640JuM1SZ1ZF1KbjNlcOLacYjy/iTV6EqY/qC6M3BT+TFccDoqLDjp?=
 =?us-ascii?Q?UGJHb6boVAn7Z5IE2JGeOyFisbhV9omtnOTrujbe/E6kV+aGpXNEDfHihBWU?=
 =?us-ascii?Q?xRWkDkkxJapqXimnQTH6UA5E/OICTMf2Mm4vst4Mv6e9rAfq0tlr79pR2fWH?=
 =?us-ascii?Q?2rr/21XxIk8FfRedEuNtEVTK9nkYS0ZzmEfu90wWDVlI/OUGa1IwRIftKKAg?=
 =?us-ascii?Q?aGvVuVJhkfnthn0obgsTZC4FekspQgdVxDH8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 17:16:59.5320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 748f6b20-ccab-4d1f-a88b-08dddc1f8b5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
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

Walking hardware contexts created by a process is duplicated in multiple
spots. Add a function, amdxdna_hwctx_walk(), and replace all spots.

hwctx_srcu and dev_lock are good enough to protect hardware context list.
Remove hwctx_lock.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        | 38 +++++-----
 drivers/accel/amdxdna/aie2_message.c    | 21 +++---
 drivers/accel/amdxdna/aie2_pci.c        | 93 ++++++++++++-------------
 drivers/accel/amdxdna/aie2_pci.h        |  2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c     | 26 +++++--
 drivers/accel/amdxdna/amdxdna_ctx.h     |  8 +--
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  7 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  2 -
 8 files changed, 102 insertions(+), 95 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 910ffb7051f4..420467a5325c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -133,11 +133,20 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
 }
 
+static int aie2_hwctx_suspend_cb(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	aie2_hwctx_wait_for_idle(hwctx);
+	aie2_hwctx_stop(xdna, hwctx, NULL);
+	aie2_hwctx_status_shift_stop(hwctx);
+
+	return 0;
+}
+
 void aie2_hwctx_suspend(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
 
 	/*
 	 * Command timeout is unlikely. But if it happens, it doesn't
@@ -145,19 +154,20 @@ void aie2_hwctx_suspend(struct amdxdna_client *client)
 	 * and abort all commands.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	guard(mutex)(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
-		aie2_hwctx_wait_for_idle(hwctx);
-		aie2_hwctx_stop(xdna, hwctx, NULL);
-		aie2_hwctx_status_shift_stop(hwctx);
-	}
+	amdxdna_hwctx_walk(client, NULL, aie2_hwctx_suspend_cb);
 }
 
-void aie2_hwctx_resume(struct amdxdna_client *client)
+static int aie2_hwctx_resume_cb(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	aie2_hwctx_status_restore(hwctx);
+	return aie2_hwctx_restart(xdna, hwctx);
+}
+
+int aie2_hwctx_resume(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
 
 	/*
 	 * The resume path cannot guarantee that mailbox channel can be
@@ -165,11 +175,7 @@ void aie2_hwctx_resume(struct amdxdna_client *client)
 	 * mailbox channel, error will return.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	guard(mutex)(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
-		aie2_hwctx_status_restore(hwctx);
-		aie2_hwctx_restart(xdna, hwctx);
-	}
+	return amdxdna_hwctx_walk(client, NULL, aie2_hwctx_resume_cb);
 }
 
 static void
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 82412eec9a4b..9caad083543d 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -290,18 +290,25 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u6
 	return 0;
 }
 
+static int amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	u32 *bitmap = arg;
+
+	*bitmap |= GENMASK(hwctx->start_col + hwctx->num_col - 1, hwctx->start_col);
+
+	return 0;
+}
+
 int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 		      u32 size, u32 *cols_filled)
 {
 	DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
 	struct amdxdna_dev *xdna = ndev->xdna;
 	struct amdxdna_client *client;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
 	dma_addr_t dma_addr;
 	u32 aie_bitmap = 0;
 	u8 *buff_addr;
-	int ret, idx;
+	int ret;
 
 	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
 					  DMA_FROM_DEVICE, GFP_KERNEL);
@@ -309,12 +316,8 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 		return -ENOMEM;
 
 	/* Go through each hardware context and mark the AIE columns that are active */
-	list_for_each_entry(client, &xdna->client_list, node) {
-		idx = srcu_read_lock(&client->hwctx_srcu);
-		amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
-		srcu_read_unlock(&client->hwctx_srcu, idx);
-	}
+	list_for_each_entry(client, &xdna->client_list, node)
+		amdxdna_hwctx_walk(client, &aie_bitmap, amdxdna_hwctx_col_map);
 
 	*cols_filled = 0;
 	req.dump_buff_addr = dma_addr;
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 6fc3191c3097..16ac0cab4f44 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/iommu.h>
@@ -465,8 +466,11 @@ static int aie2_hw_resume(struct amdxdna_dev *xdna)
 		return ret;
 	}
 
-	list_for_each_entry(client, &xdna->client_list, node)
-		aie2_hwctx_resume(client);
+	list_for_each_entry(client, &xdna->client_list, node) {
+		ret = aie2_hwctx_resume(client);
+		if (ret)
+			break;
+	}
 
 	return ret;
 }
@@ -779,65 +783,56 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 	return ret;
 }
 
+static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
+	struct amdxdna_drm_get_info *get_info_args = arg;
+
+	if (get_info_args->buffer_size < sizeof(*tmp))
+		return -EINVAL;
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	tmp->pid = hwctx->client->pid;
+	tmp->context_id = hwctx->id;
+	tmp->start_col = hwctx->start_col;
+	tmp->num_col = hwctx->num_col;
+	tmp->command_submissions = hwctx->priv->seq;
+	tmp->command_completions = hwctx->priv->completed;
+
+	buf = u64_to_user_ptr(get_info_args->buffer);
+
+	if (copy_to_user(buf, tmp, sizeof(*tmp)))
+		return -EFAULT;
+
+	get_info_args->buffer += sizeof(*tmp);
+	get_info_args->buffer_size -= sizeof(*tmp);
+
+	return 0;
+}
+
 static int aie2_get_hwctx_status(struct amdxdna_client *client,
 				 struct amdxdna_drm_get_info *args)
 {
-	struct amdxdna_drm_query_hwctx __user *buf;
 	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_drm_query_hwctx *tmp;
+	struct amdxdna_drm_get_info info_args;
 	struct amdxdna_client *tmp_client;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-	bool overflow = false;
-	u32 req_bytes = 0;
-	u32 hw_i = 0;
-	int ret = 0;
-	int idx;
+	int ret;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 
-	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
+	info_args.buffer = args->buffer;
+	info_args.buffer_size = args->buffer_size;
 
-	buf = u64_to_user_ptr(args->buffer);
 	list_for_each_entry(tmp_client, &xdna->client_list, node) {
-		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
-		amdxdna_for_each_hwctx(tmp_client, hwctx_id, hwctx) {
-			req_bytes += sizeof(*tmp);
-			if (args->buffer_size < req_bytes) {
-				/* Continue iterating to get the required size */
-				overflow = true;
-				continue;
-			}
-
-			memset(tmp, 0, sizeof(*tmp));
-			tmp->pid = tmp_client->pid;
-			tmp->context_id = hwctx->id;
-			tmp->start_col = hwctx->start_col;
-			tmp->num_col = hwctx->num_col;
-			tmp->command_submissions = hwctx->priv->seq;
-			tmp->command_completions = hwctx->priv->completed;
-
-			if (copy_to_user(&buf[hw_i], tmp, sizeof(*tmp))) {
-				ret = -EFAULT;
-				srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
-				goto out;
-			}
-			hw_i++;
-		}
-		srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
-	}
-
-	if (overflow) {
-		XDNA_ERR(xdna, "Invalid buffer size. Given: %u Need: %u.",
-			 args->buffer_size, req_bytes);
-		ret = -EINVAL;
+		ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
+		if (ret)
+			break;
 	}
 
-out:
-	kfree(tmp);
-	args->buffer_size = req_bytes;
+	args->buffer_size = (u32)(info_args.buffer - args->buffer);
 	return ret;
 }
 
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 488d8ee568eb..91a8e948f82a 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -289,7 +289,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 void aie2_hwctx_suspend(struct amdxdna_client *client);
-void aie2_hwctx_resume(struct amdxdna_client *client);
+int aie2_hwctx_resume(struct amdxdna_client *client);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index b47a7f8e9017..4bfe4ef20550 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -68,14 +68,30 @@ static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 	synchronize_srcu(ss);
 
 	/* At this point, user is not able to submit new commands */
-	mutex_lock(&xdna->dev_lock);
 	xdna->dev_info->ops->hwctx_fini(hwctx);
-	mutex_unlock(&xdna->dev_lock);
 
 	kfree(hwctx->name);
 	kfree(hwctx);
 }
 
+int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
+		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg))
+{
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
+	int ret = 0, idx;
+
+	idx = srcu_read_lock(&client->hwctx_srcu);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		ret = walk(hwctx, arg);
+		if (ret)
+			break;
+	}
+	srcu_read_unlock(&client->hwctx_srcu, idx);
+
+	return ret;
+}
+
 void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
 {
 	struct amdxdna_cmd *cmd = abo->mem.kva;
@@ -126,16 +142,12 @@ void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
 	struct amdxdna_hwctx *hwctx;
 	unsigned long hwctx_id;
 
-	mutex_lock(&client->hwctx_lock);
 	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
 		XDNA_DBG(client->xdna, "PID %d close HW context %d",
 			 client->pid, hwctx->id);
 		xa_erase(&client->hwctx_xa, hwctx->id);
-		mutex_unlock(&client->hwctx_lock);
 		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
-		mutex_lock(&client->hwctx_lock);
 	}
-	mutex_unlock(&client->hwctx_lock);
 }
 
 int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
@@ -225,6 +237,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
+	mutex_lock(&xdna->dev_lock);
 	hwctx = xa_erase(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
 		ret = -EINVAL;
@@ -241,6 +254,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 
 	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
 out:
+	mutex_unlock(&xdna->dev_lock);
 	drm_dev_exit(idx);
 	return ret;
 }
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index c652229547a3..7cd7a55936f0 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -139,14 +139,10 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
 void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
 int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
 
-static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
-{
-	return GENMASK(hwctx->start_col + hwctx->num_col - 1,
-		       hwctx->start_col);
-}
-
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
+		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg));
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index fbca94183f96..8ef5e4f27f5e 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -81,7 +81,6 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 		ret = -ENODEV;
 		goto unbind_sva;
 	}
-	mutex_init(&client->hwctx_lock);
 	init_srcu_struct(&client->hwctx_srcu);
 	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
 	mutex_init(&client->mm_lock);
@@ -116,7 +115,6 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	xa_destroy(&client->hwctx_xa);
 	cleanup_srcu_struct(&client->hwctx_srcu);
-	mutex_destroy(&client->hwctx_lock);
 	mutex_destroy(&client->mm_lock);
 	if (client->dev_heap)
 		drm_gem_object_put(to_gobj(client->dev_heap));
@@ -142,8 +140,8 @@ static int amdxdna_flush(struct file *f, fl_owner_t id)
 
 	mutex_lock(&xdna->dev_lock);
 	list_del_init(&client->node);
-	mutex_unlock(&xdna->dev_lock);
 	amdxdna_hwctx_remove_all(client);
+	mutex_unlock(&xdna->dev_lock);
 
 	drm_dev_exit(idx);
 	return 0;
@@ -330,11 +328,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
 					  struct amdxdna_client, node);
 	while (client) {
 		list_del_init(&client->node);
-		mutex_unlock(&xdna->dev_lock);
-
 		amdxdna_hwctx_remove_all(client);
 
-		mutex_lock(&xdna->dev_lock);
 		client = list_first_entry_or_null(&xdna->client_list,
 						  struct amdxdna_client, node);
 	}
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 40bbb3c06320..b6b3b424d1d5 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -116,8 +116,6 @@ struct amdxdna_device_id {
 struct amdxdna_client {
 	struct list_head		node;
 	pid_t				pid;
-	struct mutex			hwctx_lock; /* protect hwctx */
-	/* do NOT wait this srcu when hwctx_lock is held */
 	struct srcu_struct		hwctx_srcu;
 	struct xarray			hwctx_xa;
 	u32				next_hwctxid;
-- 
2.34.1

