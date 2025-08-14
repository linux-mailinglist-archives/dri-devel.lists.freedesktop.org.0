Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF6B2702E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 22:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B0210E213;
	Thu, 14 Aug 2025 20:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FvplTijl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4310E213
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 20:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhR+RNm5sbjtRfYQdkcQ2LSDIh/yLA4aiNUHyW0rE37Nx+VCt5TbweNSa1PeqYQn6tP2GTlwTHIuRjypsAW1Ry3w3+slisxMhEhuRlW/CiFrFFppc/6hTATr1PcHKbFEfFiex6TWIxqizZivrSlo0MM5U34G08nvqo8/jn3+FnQ2Emk5FFuiPMboWiX6aJPQNfl060j/nFeyMTjfymRHqMyHWwwGb8Yfmg/I+KfUCzpFragc5pHUT2mvkhczijb6PMSk1/V757Q698fqKlDrjlqTMzgckiPfvPKNKpXJ4JHYxPDZ35WlnFi8YPfradIn1MopOAazujOVELUFHp7DIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx5jX6JuuiMhkQoqEirQRwsr6KiCTdbPlXc2hbFmjtc=;
 b=WmOF+tDu7AyO1MhzegEZc0LqpsCjO78qDCqpQbc4HoTxZQIW4OgLfCxCVLqhUCNVA/RRwEltCcLM0QmXicTtY2yAEK2zOYABaS+rfbJuDLT4SKAJfaYTmPkHag+uVxgzytQbMknhRxXcfKAbHfCov4hN1kXMBcWQlUsuK4FTh1NCYED+JHanHm2gNHNo5OR3w1TUf/LuZi4poVvU9LirI3n6TpmpA1b7RY+InEvM//JP56Id5L5qYuofR8QFFCBfYJO0TOTBWF5wfcLF6TlyB5+BT6KvrJhF6jTEzCCyK49Ul2Q9ammxCA+9ZJdATSvMkg9KnOPjuxoBwVtXKe8+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx5jX6JuuiMhkQoqEirQRwsr6KiCTdbPlXc2hbFmjtc=;
 b=FvplTijlgmYd3rlsBzWNZkS1r7UrgKcXjz/AxBMKz+iRDNCqqsd1IWHlY9kTJtbFufGuSEyzt81iG073Rp02nJ66Rsw9THcvPOp1P2564+5LpE624mWAKIpjB9ffINE2iDrFjGdCfGKWSnVTSNKzNG6pZKcArUL99+Sqqc0zGPA=
Received: from MW4PR03CA0224.namprd03.prod.outlook.com (2603:10b6:303:b9::19)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 20:29:32 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::b7) by MW4PR03CA0224.outlook.office365.com
 (2603:10b6:303:b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Thu,
 14 Aug 2025 20:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 20:29:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 15:29:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 14 Aug
 2025 13:29:30 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 15:29:30 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Add a function to walk hardware contexts
Date: Thu, 14 Aug 2025 13:29:24 -0700
Message-ID: <20250814202924.3335547-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|DS0PR12MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: beb28a4f-0875-48d4-e3af-08dddb71469b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yjp+Q5Fe+qzNk4AZamO3YvLbryk4RY3yBkGoPsfFcWvsHMskQx3nD5manjYt?=
 =?us-ascii?Q?/R0Jzswpjw6lU1ywnW10RAnx7s5YWnNezkFoKB4FsagFwEZ7TIiZ98i2VfMp?=
 =?us-ascii?Q?sE2XgfnTa1mAvEON37NcJaJoIJh49/FPYzKZE+t/0w4ZFJp4n7yK6ZA3x+KQ?=
 =?us-ascii?Q?OWsPHv4xGZDvFCRQ2YgMM/OZ9APqqFZ+ozVaTpHFzBRRht2yS5PHkA40ulYP?=
 =?us-ascii?Q?aTbV6I215kDHx6e8H6rynHSQjcqX9AWAlHRIf8foPB1hXt1nDyDdQ0yuLwrx?=
 =?us-ascii?Q?YhmO5wg+/UtfUwZaFhXqFtq0iCIFsNUjaWvoYp00JhLNn2n84GNOBmnFy2+T?=
 =?us-ascii?Q?oIXfj+VWeSqTxPvBBKr1YLzybG4Mcpl0YNlf8++OEOhDi+qpVRcWMU1CI+mQ?=
 =?us-ascii?Q?J0m7qlTH/c8IFXclKLf906DcGsqmmeKo2FFkpk4KbUm5hlpwHmOc7OFAyi/J?=
 =?us-ascii?Q?L+e1RmrGHrsFYD7JJoM/X4B2f3+2jlFE+Mgm2txkZFm582qN/iJH+RnDXqyo?=
 =?us-ascii?Q?QuG/GhdhS5kNr044YJC2MZPSa7RES6GFj7ZifyqH35JBvxB0X8mc+YQz9Yll?=
 =?us-ascii?Q?zzawJYz7dBZKtgIjH83KYtqu/lN0K3Lpnr6H12NCp1xPWYHLgGC4FlBd9U2d?=
 =?us-ascii?Q?krYOojFr22SjTopDDjb926vZA4p8wXbeTCoRmcyP871+NzYBpySm04GJLn7z?=
 =?us-ascii?Q?mvBlMbYVDAh/JxwZVIpNtZqdR0+XcFXwS+KetDLaW1SMUExAyf6Stbm7plSo?=
 =?us-ascii?Q?VA7uvQRuFrrZVYS7Dyi8OmkwAVkxdtmFtisH8XlPMVK/TcfMfz+GAtVK6tu/?=
 =?us-ascii?Q?bNHGnIB+81b7f5d4kqA136H+05jM0/uHcrL6PzNmA9uuxeUXLQ2svcCLGmcU?=
 =?us-ascii?Q?Cb8AW1c61FP/DJlGbCak0PAdp6Byv8KyjgkSMGRUIe+aRiBi5MTm8L4q7tA9?=
 =?us-ascii?Q?GfVaq6PBdOFDsV6yewdBw5lDMvcz561OJXv0CEPmv5sSok4NJ/ZzYGwPsTbE?=
 =?us-ascii?Q?VmKZAykGfM1uT8IYYnG1mCIBKFVO+6O0PnWu3B22k9WBH82AkjZ7A4Jf36gv?=
 =?us-ascii?Q?WHScs79u17i6VxSYLWSOElc6OlfcU0OMXu6h+CbrmUh3MKrBs2lplDwwRg4r?=
 =?us-ascii?Q?MdoKlNtbC+96nH2JulIlE6mIQ8Mejhx3SCHzZ6CRDNQCv5BoGBAI9WNkULjB?=
 =?us-ascii?Q?ArySjqse04lIoGcS/paGf4wwhmDdf1zTbh2aQFp6Q4Yck4dbvlkXmAiJVr/r?=
 =?us-ascii?Q?whmnvglD7IRADmQQ8QlztsE47X8v73iltUwq3DO4W9e0j9ypR8WWrfoQ4XOn?=
 =?us-ascii?Q?aNb6PMPzolDjP6y9X7zvojEM6qEwmoSqQ3wkbDMKPBuOqhNDnp7JA1C84gUs?=
 =?us-ascii?Q?ga1jZbL+qhvE9Cb90ZgsIilJrhGsaR9XTfI6stAwDeS4c0GTvJF3HdHLl/CE?=
 =?us-ascii?Q?VF8XUABta/QFNFjy7ebRKMRTDKAW3u5yveKRZr9chnF2zL0ABwrkBc8LDM/3?=
 =?us-ascii?Q?Q9o5+rKuSu9u2SkCn3juOeLC04+tXl0kspbH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:29:31.8002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb28a4f-0875-48d4-e3af-08dddb71469b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
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
 drivers/accel/amdxdna/aie2_ctx.c        | 38 ++++++-----
 drivers/accel/amdxdna/aie2_message.c    | 21 +++---
 drivers/accel/amdxdna/aie2_pci.c        | 86 +++++++++++--------------
 drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ++++++--
 drivers/accel/amdxdna/amdxdna_ctx.h     |  8 +--
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  7 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  2 -
 7 files changed, 97 insertions(+), 91 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 910ffb7051f4..b76877179b62 100644
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
@@ -145,19 +154,22 @@ void aie2_hwctx_suspend(struct amdxdna_client *client)
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
+}
+
+static int aie2_hwctx_resume_cb(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	aie2_hwctx_status_restore(hwctx);
+	aie2_hwctx_restart(xdna, hwctx);
+
+	return 0;
 }
 
 void aie2_hwctx_resume(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
 
 	/*
 	 * The resume path cannot guarantee that mailbox channel can be
@@ -165,11 +177,7 @@ void aie2_hwctx_resume(struct amdxdna_client *client)
 	 * mailbox channel, error will return.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	guard(mutex)(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
-		aie2_hwctx_status_restore(hwctx);
-		aie2_hwctx_restart(xdna, hwctx);
-	}
+	amdxdna_hwctx_walk(client, NULL, aie2_hwctx_resume_cb);
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
index 6fc3191c3097..b3ae03d05fb0 100644
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
@@ -779,65 +780,56 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
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

