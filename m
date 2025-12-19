Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB317CCE2BE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A778910EC3D;
	Fri, 19 Dec 2025 01:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ridlY/V3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E62F10EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2MjOQ66KmLTJyeHBBqUi3/YfgIs6PRbbygTZxSTn1sgnWvOAbh/8PSgOpEEvIyfBHp8Hjw/ljehv0CX3PXDjbFe1q4ulTUPauNFWh2moV4SMdTx8ETZw1s5b9Cc61a3ef2wIWk52SUVRueLYwLF24yPXooynaZwlfg04NxUtFRTYvzgQ5z4TW/R5iX/8PwiijIaD5NZwxVaKX18KkGOTgkfHHeOsbzzfVrla4gQGpl1rcoLovLkM3aqxTf/mOP3F7JXcyaIV8nvetScucuf1BX2AfOO81TmZrfNhATaMYrdRaLAE3s6dBL2gi+5Xe3+x9KyenB9AGG4dPqr7SbrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoR2Jhc7tqj4ePd1V2Tds9dzY/v8E0CGQBAz5ghMCgw=;
 b=C137uo5x+0+d0XuLazNd64tTeUwRJzoSx0rr8Kin87ASADdU7YEtsvD0n8vEyw3ufBMhR3IouJ8bDhM53gFyqnx8Mr0uLIghsLnvgjXr0AyhGh3q4l50JTyhDQ8rhTJJeP4qu21EVGDK6M97zPP0PLx6mY756Vmk6LiNgenY2DZUY9fiO7lPTvFPuMm06havuwOe+vvSZsGTtg6ceM60UVmcHzVWIIMuhwdif9PgSeGtXMDGmNNjn6BbSSJ0PWhb8UOanbq7GdaZwjvdZSVxUddndGE0Ovsr11exeuNBRB11qtenPZdKx/a4rpUU/Y0uFgnb40WHEgPJD6RTlJ+WOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoR2Jhc7tqj4ePd1V2Tds9dzY/v8E0CGQBAz5ghMCgw=;
 b=ridlY/V31OLM50rlvhPtj3NtpjrpKo4vEzySd7LXr6BX8mr1gi/tXtQjLgQA1xKeU/ADv/czj+KIcnY5rgWmf3JNRt2ZhQuz0X/29MptP23DjrmXMcF5dFxALNGj2MpX+PUVyzUSvpsx7D6jisAhjcWGeZig4vipwWOotoSuJmA=
Received: from BLAPR03CA0119.namprd03.prod.outlook.com (2603:10b6:208:32a::34)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 01:44:18 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::dd) by BLAPR03CA0119.outlook.office365.com
 (2603:10b6:208:32a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Fri,
 19 Dec 2025 01:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 01:44:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:17 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Dec
 2025 19:44:17 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 19:44:16 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
Date: Thu, 18 Dec 2025 17:43:55 -0800
Message-ID: <20251219014356.2234241-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SA0PR12MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: 49862efc-716d-44d1-fa34-08de3ea01fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hBqlCY+ogHmYKl7SSZN0XI354H3Q09Q8ZKDbQTsSkwlwfxKdpxoHrCCXLjqj?=
 =?us-ascii?Q?Ybddw9kFyuZZsSO6CgzguHiFtAsqXfU2qSUPmI+3KXF7jQj7k9Y3FNcPYfNS?=
 =?us-ascii?Q?LDB3ccavbjw9QHvZPszsSHyvQr1wv7aeSdKCVEFMKrWyv0s3WbK4fdmBkIWO?=
 =?us-ascii?Q?uQOEFvxO/Qs11KKQK1QgDp4Gldm09Jkdm/wrH0/vFxsg6i/MsstcjBiBcw2W?=
 =?us-ascii?Q?DxaOw9+ADT+yPfxC33HKanqm2ZnK57Ug3DjGmKVJ59H/S4xRfl7Jq72WICWb?=
 =?us-ascii?Q?Zi+S8tyke+Jwd+EPVM3vyajl1qrhPo/xW7fYNZGS+tFIgvydWed5nS44A+gE?=
 =?us-ascii?Q?q0n0NFAA4oixXBcg3y2ONzsIfj71+VwULw2tSLO/bLjRfUoTY6RciBGh2JJ3?=
 =?us-ascii?Q?ALJ7QxHg1Gy0NJogMu5rP2Gz0E55lY4oZpAyiFuaR03x4UQhXjcJXQiydBIy?=
 =?us-ascii?Q?nrO3Ba6hirNWhidPWo2lf/g+NDNAk0Hc8QYB9Orh/hbD4snmVbycPwkIwN9y?=
 =?us-ascii?Q?scOTGSlRMCF55cMJz0kwp6nS0w22sHCf0EMqMrdAIBDOgOj6tnWHcTP2oMtz?=
 =?us-ascii?Q?ZNEqzmpm7w6esJ07j3qcb40dCAAA+K/f6DolXfVf304XGhYd3qCa2qZYb8Eg?=
 =?us-ascii?Q?qXE90FjL5SFf6XbpbgNGHggGqlYV6MpY4T3AnDdVFFL4QplVGbN9hYhwExhK?=
 =?us-ascii?Q?DSZ0+SlQKBcAYl1aE3qoOUpFMG1kjhYjN5RAk0L4sE7po6srHp0s5a39kb+G?=
 =?us-ascii?Q?klHFMgMRgiInXw4dVjpiEpHnakva3Qv9qQuqxfmSVn0e2/9UwCil96Biytgx?=
 =?us-ascii?Q?5PXe3hfOtMxNzvmUFqp7gYHfpRQmxXyySipy0GZnzfD3oXWVkc/vJGqoXJWR?=
 =?us-ascii?Q?FFZUltAj7xNiqyiAadJ47JMctxdSEFZIYuZpssTXUp2upG/1+y5AU8+Y3xTN?=
 =?us-ascii?Q?p4HEfKqth8ork2puIC0gu2iRrsgVrO5rAq9UhHCePMuDstYEQSfT3XBsRshj?=
 =?us-ascii?Q?PbBAI63sxuTVVJzpydEzk/JVK2+4ay85k1DQZXmUBrpLbiaV+1aX47NRCJ8r?=
 =?us-ascii?Q?y5KrcR3EPrAaoouhAlY9VJVdKPl/gDFclup+FabKkz8Fy4Fd6RVgbgpG6qde?=
 =?us-ascii?Q?M15pj+EG7rdHXDKrozSY87N1fKtUD7pBMhEDro+5ZA1jL7VNa9sitBAXNfVg?=
 =?us-ascii?Q?sFcaBe3bUsPKpzi7z59fZV6G7LMER2CjWqoYo5fC8y25hEkbrF0fopfg09h/?=
 =?us-ascii?Q?L/oaFszL034tUhABHgLqUJiqgmNLa/8YtTtGyMu2s4MaCK3JGLWG5rifkxKX?=
 =?us-ascii?Q?UvANCfT9aeXO6HBx9akoKzp+j5fvdiU4mjdhDS6qjAkhKg3A+7SBPHwJXljh?=
 =?us-ascii?Q?CoSabRv3EIFl+dGta6SE2V2tSUkDLWcbMSYexZFn6r2mBPZ7jpZ3knh7VBiQ?=
 =?us-ascii?Q?C0HYi5lHpfPCerM5R3JG80g+jEmgFI6/iH7oO0HqobruR1b7ZSSkAs4wQU7m?=
 =?us-ascii?Q?P7T3fXISfcSdCvK/k3elKtxSZ8saCNdeHoYU9FHqnXewK1fMlCRL2c8eXzMc?=
 =?us-ascii?Q?ovQvSrYLv8GHfS6Oyaw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:44:18.0595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49862efc-716d-44d1-fa34-08de3ea01fb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
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

The latest firmware requires the message DMA buffer to
  - have a minimum size of 8K
  - use a power-of-two size
  - be aligned to the buffer size
  - not cross 64M boundary

Update the buffer allocation logic to meet these requirements and support
the latest firmware.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
 drivers/accel/amdxdna/aie2_message.c | 33 ++++++++++++++++++++--------
 drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index d452008ec4f4..5e82df2b7cf6 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
 	destroy_workqueue(events->wq);
 	mutex_lock(&xdna->dev_lock);
 
-	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
-			     events->addr, DMA_FROM_DEVICE);
+	aie2_free_msg_buffer(ndev, events->size, events->buf, events->addr);
 	kfree(events);
 }
 
@@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 	if (!events)
 		return -ENOMEM;
 
-	events->buf = dma_alloc_noncoherent(xdna->ddev.dev, total_size, &events->addr,
-					    DMA_FROM_DEVICE, GFP_KERNEL);
+	events->buf = aie2_alloc_msg_buffer(ndev, &total_size, &events->addr);
+
 	if (!events->buf) {
 		ret = -ENOMEM;
 		goto free_events;
@@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 free_wq:
 	destroy_workqueue(events->wq);
 free_buf:
-	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
-			     events->addr, DMA_FROM_DEVICE);
+	aie2_free_msg_buffer(ndev, events->size, events->buf, events->addr);
 free_events:
 	kfree(events);
 	return ret;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 051f4ceaabae..99215328505e 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 	return ret;
 }
 
+void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
+			    dma_addr_t *dma_addr)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+	int order;
+
+	*size = max(*size, SZ_8K);
+	order = get_order(*size);
+	if (order > MAX_PAGE_ORDER)
+		return NULL;
+	*size = PAGE_SIZE << order;
+
+	return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
+				     DMA_FROM_DEVICE, GFP_KERNEL);
+}
+
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
 {
 	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
@@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 {
 	DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
 	struct amdxdna_dev *xdna = ndev->xdna;
+	u32 buf_sz = size, aie_bitmap = 0;
 	struct amdxdna_client *client;
 	dma_addr_t dma_addr;
-	u32 aie_bitmap = 0;
 	u8 *buff_addr;
 	int ret;
 
-	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
-					  DMA_FROM_DEVICE, GFP_KERNEL);
+	buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
 	if (!buff_addr)
 		return -ENOMEM;
 
@@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 
 	*cols_filled = 0;
 	req.dump_buff_addr = dma_addr;
-	req.dump_buff_size = size;
+	req.dump_buff_size = buf_sz;
 	req.num_cols = hweight32(aie_bitmap);
 	req.aie_bitmap = aie_bitmap;
 
@@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	*cols_filled = aie_bitmap;
 
 fail:
-	dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, dma_addr, DMA_FROM_DEVICE);
+	aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
 	return ret;
 }
 
@@ -402,19 +417,19 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
 	DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
 	struct amdxdna_dev *xdna = ndev->xdna;
 	dma_addr_t dma_addr;
+	u32 buf_sz = size;
 	u8 *addr;
 	int ret;
 
 	if (header->type >= MAX_TELEMETRY_TYPE)
 		return -EINVAL;
 
-	addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
-				     DMA_FROM_DEVICE, GFP_KERNEL);
+	addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
 	if (!addr)
 		return -ENOMEM;
 
 	req.buf_addr = dma_addr;
-	req.buf_size = size;
+	req.buf_size = buf_sz;
 	req.type = header->type;
 
 	drm_clflush_virt_range(addr, size); /* device can access */
@@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
 	header->minor = resp.minor;
 
 free_buf:
-	dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, DMA_FROM_DEVICE);
+	aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
 	return ret;
 }
 
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index a929fa98a121..e1745f07b268 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		 int (*notify_cb)(void *, void __iomem *, size_t));
 int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 			 int (*notify_cb)(void *, void __iomem *, size_t));
+void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
+			    dma_addr_t *dma_addr);
+#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)		\
+	dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,	\
+			     dma_addr, DMA_FROM_DEVICE)
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
-- 
2.34.1

