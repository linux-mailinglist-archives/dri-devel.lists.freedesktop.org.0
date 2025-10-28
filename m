Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762EC16577
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444CB10E640;
	Tue, 28 Oct 2025 17:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GNuuzkfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011056.outbound.protection.outlook.com
 [40.93.194.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117A910E640
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ+8VX2OP2K7b9wxTUGoAFFSzPSUMldnJBfYqhxqeRF31QiDGLKDsDFoEi9A32DkxvRUpz1mg8sfUK+IxRVGXR0wDZauifR+fegjSfTqD22CGhhJQiagvYnLMrs6WDghRqa71h05apX2o58zEZornbiTSIJChFK3qvvQPjmtoNihH/uV2ihKeOmT40kQljprfqL7rTlBDHtLiyrQIR6TgMO2hGlGcNp5OLx7TlY+3MrVumrZHgA34/7aGqHd1kvs1vuOaoGmLCpCmEEZC7zWmY8n9MyTcXSVi8HIYgEREz2NP4+KHB2k0rQypVbEv2No5Ibthdq6UYAmO4Vur9KpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8VUYyGe/QktG2abzcP6yesrrSltNXRUe6GMwSGnSy8=;
 b=V/NtY5ptI3uEtrHfGAMKKXMiHlat2tFrG7SmxdHrmJOaft+v0V9ZGWAYBFgursqdFWJLh1IDwhSjXMDKTTXZsLGmW5yZ3EcsLMjpbwEQeJC31UH1T7cehM7cT0sZ0AN1ZnekySi8T9yHNPFIg3X9bHwnLfWSDCvULhGYukyoorLZ8CXT135SaWpUBaWopca7bJOiMKSgAG2CDTcP/hB+y/UCuAmnC9X04yzVafQXcAWeQSBhcOjOk2lycGGKtOJG7jxvWtCM80/ToTnwQfoG93m8CPW2ZowYdZv/ZwPkiReN9U7NfxIjmdH0354mfm+rMnUA02weKc9f5IiQXHXIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8VUYyGe/QktG2abzcP6yesrrSltNXRUe6GMwSGnSy8=;
 b=GNuuzkfxBALSfmiFLdLcp5nYoq2UnZZNkC0KTnWkoaG2/SoUuMITceu2e7kphrSNbkOUJKUhnUQVSHD/FXouA0pFQPaceE0dCqKA2cnLFHEOlC8+QhwUBZcPXEt2CFSosjVKc4uhw9fvfAs5lqXjuiMQhEKfGDpWQ0/09gQuAro=
Received: from MN2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:208:23e::32)
 by PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 17:58:27 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::30) by MN2PR14CA0027.outlook.office365.com
 (2603:10b6:208:23e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 17:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 17:58:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 10:58:27 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 12:58:26 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 10:58:26 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Add IOCTL parameters for resource and
 telemetry data
Date: Tue, 28 Oct 2025 10:58:17 -0700
Message-ID: <20251028175817.2329738-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|PH0PR12MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: aea23143-a6ac-486e-c0d1-08de164b98e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VwcUWjd562v2NQB/LJ0BBM0yhgJkHTaDrLdMvFQ6w+qDmMqOUoS9z9JxaJAJ?=
 =?us-ascii?Q?k6e3RpT3gy1tj628AwiLuDmBBfDXmnP9OGxxNIuowrpBzo8gCfljg65yrd6m?=
 =?us-ascii?Q?NEWkTrW/iXYbuNUt9qFq1mEb6BhpHLBXRseUKCjQPfVVA6Gp8dU+G2Hk0AZW?=
 =?us-ascii?Q?9UJ/Z+wfWth9ARUhiflE/dxyEINMvdVDBSM/YgAz2GTgPDghowiD8sd0hWHw?=
 =?us-ascii?Q?Fh8BHdl2Fi5i5U25aUix47HOVs1GBo52cKyuG/m8obQ3ChLA7sHHo/fxV/8G?=
 =?us-ascii?Q?Shzevm3orjlWy8bpGDfzWTgoOUABC+yIwFCwNXCkEQD/+uTt52AGHN57Sm5w?=
 =?us-ascii?Q?nfrNbavNdmV6rKPm119ty5weo1GK9wBO08YL1rGAAeL9f6gSVgnmyG9byjq5?=
 =?us-ascii?Q?Ql9iA/E2TxomTvBCNnj7XF7hmPV6QTot5Zyy4zQv+QA0DXfTAqSyxKdNPFm9?=
 =?us-ascii?Q?ZHQ7cLD5D9HnhWVa5YPacCLRg0ffuECnlm4r6ch7PSPp9nI/24sB0OFuQh5I?=
 =?us-ascii?Q?nWqpxTHzAIMhiJowXUOyMFPwQi0s4nU3NluMnnCECIYwdI4sICiFL3/SfSIS?=
 =?us-ascii?Q?/jJ+ESYwIce0YlGV/L4eLVWuu3jm0uukIhJFUQ4ktsplIeYrvvlTL5vKZwTY?=
 =?us-ascii?Q?P+SZbTBWYfUCtYwGaXjFectCh56gSyuSRWBBb6UgEXp4ivaDF5UNLG7Veut6?=
 =?us-ascii?Q?hiIB+e24TWr808ujA/d6uIySwEidhIqsrdsMZCaMlJfU8e3A2O/KmJCmahXi?=
 =?us-ascii?Q?FVuHT4MUZnQakY0whkMyFlMeXl8biP9fGyABaFihQl+hdocP1BS+DbzWmyct?=
 =?us-ascii?Q?tcjTYarl9zDzmdQZDgDnuwJS61AE0RK80SBxhgFyFkpfajgyUhK1fMSzAVZy?=
 =?us-ascii?Q?n3LQE6pPsALt2VhRIhcDEB14hrH4wM8kyLP+B9TsLsOfkTaYXpUhOEhZodAn?=
 =?us-ascii?Q?Rwcyqx/Z15az/SebeZ7hcnSQn0qqTi4HbxuumEDEcCROEPwONViBSklPSwrl?=
 =?us-ascii?Q?nUSuDSuFQowXtIIY8eeTmZEN8GQDLKzYW7bHMwdE/aXQNt/Zjd86me109vqj?=
 =?us-ascii?Q?nI7sPjy/XPfT57uJovUHXkszkM4/gwT/fs968SRVjaJK41MVoFmMZJzLJ9tQ?=
 =?us-ascii?Q?MVrKNSmaarXsv8bZQx5btJgmMaYIXQNA5EJpclbWeowyySl1wrJ3uzpYKhHq?=
 =?us-ascii?Q?XESln0aL9N6GkxgYINa85YoWxa4e099Ykn2LlViwPDBiyptS2rpRVZGBhjoq?=
 =?us-ascii?Q?M/XB2fbznaDB6PWSbQt8cwWeqeLTOh+yD16CZ6JeMDU9wCdIF7dVVo1oFMaz?=
 =?us-ascii?Q?HD7dtkrG/sexmH3/J2ndSBSdvLNtD+TLGry5oKxVMOAbOkFC89Y9Tz0abEsv?=
 =?us-ascii?Q?dQNb/fxi55/Zji9BJkdxqyqJYOR8mHT7lqgoPF02NwnIwD2YIYNe0kWtlyxu?=
 =?us-ascii?Q?W2YoQgXNjFxUBGIo0ixU/yH5B37+zCkODVSg9h7DcH37R1ZKbUN+bnE1h6HV?=
 =?us-ascii?Q?NQBmGrMql3SfM/VkQVf0O10O62vUnJDf8qO95IJiTBQv04jXJCeUuIXrFzjn?=
 =?us-ascii?Q?tgU37o0gkt3yQ7wuaQs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:58:27.6036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea23143-a6ac-486e-c0d1-08de164b98e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981
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

Extend DRM_IOCTL_AMDXDNA_GET_INFO to include additional parameters
that allow collection of resource and telemetry data.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c              |   6 --
 drivers/accel/amdxdna/aie2_message.c          |  58 ++++++++--
 drivers/accel/amdxdna/aie2_msg_priv.h         |  25 ++++-
 drivers/accel/amdxdna/aie2_pci.c              | 100 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              |   6 ++
 drivers/accel/amdxdna/aie2_smu.c              |  11 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |   6 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c       |   3 +-
 drivers/accel/amdxdna/npu1_regs.c             |   1 +
 drivers/accel/amdxdna/npu2_regs.c             |   1 +
 drivers/accel/amdxdna/npu4_regs.c             |   1 +
 drivers/accel/amdxdna/npu5_regs.c             |   1 +
 drivers/accel/amdxdna/npu6_regs.c             |   1 +
 include/uapi/drm/amdxdna_accel.h              |  34 ++++++
 14 files changed, 238 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 958a64bb5251..2b51c5211c2d 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -553,7 +553,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct drm_gpu_scheduler *sched;
 	struct amdxdna_hwctx_priv *priv;
 	struct amdxdna_gem_obj *heap;
-	struct amdxdna_dev_hdl *ndev;
 	int i, ret;
 
 	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
@@ -651,8 +650,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	amdxdna_pm_suspend_put(xdna);
 
 	hwctx->status = HWCTX_STAT_INIT;
-	ndev = xdna->dev_handle;
-	ndev->hwctx_num++;
 	init_waitqueue_head(&priv->job_free_wq);
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
@@ -685,13 +682,10 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 {
-	struct amdxdna_dev_hdl *ndev;
 	struct amdxdna_dev *xdna;
 	int idx;
 
 	xdna = hwctx->client->xdna;
-	ndev = xdna->dev_handle;
-	ndev->hwctx_num--;
 
 	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
 	drm_sched_entity_destroy(&hwctx->priv->entity);
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 0ec1dc6fe668..3a4c845d783a 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -45,7 +45,7 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 		ndev->mgmt_chann = NULL;
 	}
 
-	if (!ret && *hdl->data != AIE2_STATUS_SUCCESS) {
+	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
 		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
 			 msg->opcode, *hdl->data);
 		ret = -EINVAL;
@@ -233,6 +233,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 		ret = -EINVAL;
 		goto out_destroy_context;
 	}
+	ndev->hwctx_num++;
 
 	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
 		 hwctx->name, ret, resp.msix_id);
@@ -267,6 +268,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 		 hwctx->fw_ctx_id);
 	hwctx->priv->mbox_chann = NULL;
 	hwctx->fw_ctx_id = -1;
+	ndev->hwctx_num--;
 
 	return ret;
 }
@@ -332,11 +334,6 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 		goto fail;
 	}
 
-	if (resp.status != AIE2_STATUS_SUCCESS) {
-		XDNA_ERR(xdna, "Query NPU status failed, status 0x%x", resp.status);
-		ret = -EINVAL;
-		goto fail;
-	}
 	XDNA_DBG(xdna, "Query NPU status completed");
 
 	if (size < resp.size) {
@@ -358,6 +355,55 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	return ret;
 }
 
+int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
+			 char __user *buf, u32 size,
+			 struct amdxdna_drm_query_telemetry_header *header)
+{
+	DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	dma_addr_t dma_addr;
+	u8 *addr;
+	int ret;
+
+	if (header->type >= MAX_TELEMETRY_TYPE)
+		return -EINVAL;
+
+	addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
+				     DMA_FROM_DEVICE, GFP_KERNEL);
+	if (!addr)
+		return -ENOMEM;
+
+	req.buf_addr = dma_addr;
+	req.buf_size = size;
+	req.type = header->type;
+
+	drm_clflush_virt_range(addr, size); /* device can access */
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret) {
+		XDNA_ERR(xdna, "Query telemetry failed, status %d", ret);
+		goto free_buf;
+	}
+
+	if (size < resp.size) {
+		ret = -EINVAL;
+		XDNA_ERR(xdna, "Bad buffer size. Available: %u. Needs: %u", size, resp.size);
+		goto free_buf;
+	}
+
+	if (copy_to_user(buf, addr, resp.size)) {
+		ret = -EFAULT;
+		XDNA_ERR(xdna, "Failed to copy telemetry to user space");
+		goto free_buf;
+	}
+
+	header->major = resp.major;
+	header->minor = resp.minor;
+
+free_buf:
+	dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, DMA_FROM_DEVICE);
+	return ret;
+}
+
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, void __iomem *, size_t))
 {
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index cb53132029eb..2dbea1d09980 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -9,7 +9,8 @@
 enum aie2_msg_opcode {
 	MSG_OP_CREATE_CONTEXT              = 0x2,
 	MSG_OP_DESTROY_CONTEXT             = 0x3,
-	MSG_OP_SYNC_BO			   = 0x7,
+	MSG_OP_GET_TELEMETRY               = 0x4,
+	MSG_OP_SYNC_BO                     = 0x7,
 	MSG_OP_EXECUTE_BUFFER_CF           = 0xC,
 	MSG_OP_QUERY_COL_STATUS            = 0xD,
 	MSG_OP_QUERY_AIE_TILE_INFO         = 0xE,
@@ -136,6 +137,28 @@ struct destroy_ctx_resp {
 	enum aie2_msg_status	status;
 } __packed;
 
+enum telemetry_type {
+	TELEMETRY_TYPE_DISABLED,
+	TELEMETRY_TYPE_HEALTH,
+	TELEMETRY_TYPE_ERROR_INFO,
+	TELEMETRY_TYPE_PROFILING,
+	TELEMETRY_TYPE_DEBUG,
+	MAX_TELEMETRY_TYPE
+};
+
+struct get_telemetry_req {
+	enum telemetry_type	type;
+	__u64	buf_addr;
+	__u32	buf_size;
+} __packed;
+
+struct get_telemetry_resp {
+	__u32	major;
+	__u32	minor;
+	__u32	size;
+	enum aie2_msg_status	status;
+} __packed;
+
 struct execute_buffer_req {
 	__u32	cu_idx;
 	__u32	payload[19];
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f1a8112b080f..80313a2a98d4 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -825,6 +825,100 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	return 0;
 }
 
+static int aie2_query_resource_info(struct amdxdna_client *client,
+				    struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_get_resource_info res_info;
+	const struct amdxdna_dev_priv *priv;
+	struct amdxdna_dev_hdl *ndev;
+	struct amdxdna_dev *xdna;
+
+	xdna = client->xdna;
+	ndev = xdna->dev_handle;
+	priv = ndev->priv;
+
+	res_info.npu_clk_max = priv->dpm_clk_tbl[ndev->max_dpm_level].hclk;
+	res_info.npu_tops_max = ndev->max_tops;
+	res_info.npu_task_max = priv->hwctx_limit;
+	res_info.npu_tops_curr = ndev->curr_tops;
+	res_info.npu_task_curr = ndev->hwctx_num;
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &res_info, sizeof(res_info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int aie2_fill_hwctx_map(struct amdxdna_hwctx *hwctx, void *arg)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	u32 *map = arg;
+
+	if (hwctx->fw_ctx_id >= xdna->dev_handle->priv->hwctx_limit) {
+		XDNA_ERR(xdna, "Invalid fw ctx id %d/%d ", hwctx->fw_ctx_id,
+			 xdna->dev_handle->priv->hwctx_limit);
+		return -EINVAL;
+	}
+
+	map[hwctx->fw_ctx_id] = hwctx->id;
+	return 0;
+}
+
+static int aie2_get_telemetry(struct amdxdna_client *client,
+			      struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_telemetry_header *header __free(kfree) = NULL;
+	u32 telemetry_data_sz, header_sz, elem_num;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_client *tmp_client;
+	int ret;
+
+	elem_num = xdna->dev_handle->priv->hwctx_limit;
+	header_sz = struct_size(header, map, elem_num);
+	if (args->buffer_size <= header_sz) {
+		XDNA_ERR(xdna, "Invalid buffer size");
+		return -EINVAL;
+	}
+
+	telemetry_data_sz = args->buffer_size - header_sz;
+	if (telemetry_data_sz > SZ_4M) {
+		XDNA_ERR(xdna, "Buffer size is too big, %d", telemetry_data_sz);
+		return -EINVAL;
+	}
+
+	header = kzalloc(header_sz, GFP_KERNEL);
+	if (!header)
+		return -ENOMEM;
+
+	if (copy_from_user(header, u64_to_user_ptr(args->buffer), sizeof(*header))) {
+		XDNA_ERR(xdna, "Failed to copy telemetry header from user");
+		return -EFAULT;
+	}
+
+	header->map_num_elements = elem_num;
+	list_for_each_entry(tmp_client, &xdna->client_list, node) {
+		ret = amdxdna_hwctx_walk(tmp_client, &header->map,
+					 aie2_fill_hwctx_map);
+		if (ret)
+			return ret;
+	}
+
+	ret = aie2_query_telemetry(xdna->dev_handle,
+				   u64_to_user_ptr(args->buffer + header_sz),
+				   telemetry_data_sz, header);
+	if (ret) {
+		XDNA_ERR(xdna, "Query telemetry failed ret %d", ret);
+		return ret;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), header, header_sz)) {
+		XDNA_ERR(xdna, "Copy header failed");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
 {
 	struct amdxdna_dev *xdna = client->xdna;
@@ -859,6 +953,12 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_GET_POWER_MODE:
 		ret = aie2_get_power_mode(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_TELEMETRY:
+		ret = aie2_get_telemetry(client, args);
+		break;
+	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
+		ret = aie2_query_resource_info(client, args);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 243ac21d50c1..cfe42b0d4242 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -182,6 +182,8 @@ struct amdxdna_dev_hdl {
 	u32				clk_gating;
 	u32				npuclk_freq;
 	u32				hclk_freq;
+	u64				max_tops;
+	u64				curr_tops;
 
 	/* Mailbox and the management channel */
 	struct mailbox			*mbox;
@@ -219,6 +221,7 @@ struct amdxdna_dev_priv {
 	u32				mbox_dev_addr;
 	/* If mbox_size is 0, use BAR size. See MBOX_SIZE macro */
 	u32				mbox_size;
+	u32				hwctx_limit;
 	u32				sram_dev_addr;
 	struct aie2_bar_off_pair	sram_offs[SRAM_MAX_INDEX];
 	struct aie2_bar_off_pair	psp_regs_off[PSP_MAX_REGS];
@@ -273,6 +276,9 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
 int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
+int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
+			 char __user *buf, u32 size,
+			 struct amdxdna_drm_query_telemetry_header *header);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, void __iomem *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx,
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 7f292a615ed8..11c0e9e7b03a 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -23,6 +23,13 @@
 #define AIE2_SMU_SET_SOFT_DPMLEVEL	0x7
 #define AIE2_SMU_SET_HARD_DPMLEVEL	0x8
 
+#define NPU4_DPM_TOPS(ndev, dpm_level) \
+({ \
+	typeof(ndev) _ndev = ndev; \
+	(4096 * (_ndev)->total_col * \
+	 (_ndev)->priv->dpm_clk_tbl[dpm_level].hclk / 1000000); \
+})
+
 static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
 			 u32 reg_arg, u32 *out)
 {
@@ -84,6 +91,8 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	amdxdna_pm_suspend_put(ndev->xdna);
 	ndev->hclk_freq = freq;
 	ndev->dpm_level = dpm_level;
+	ndev->max_tops = 2 * ndev->total_col;
+	ndev->curr_tops = ndev->max_tops * freq / 1028;
 
 	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
 		 ndev->npuclk_freq, ndev->hclk_freq);
@@ -121,6 +130,8 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
 	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
 	ndev->dpm_level = dpm_level;
+	ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
+	ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
 
 	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
 		 ndev->npuclk_freq, ndev->hclk_freq);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
index 710ff8873d61..556c712cad0a 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
@@ -16,16 +16,18 @@ struct xdna_notify {
 	u32			*data;
 	size_t			size;
 	int			error;
+	u32			*status;
 };
 
-#define DECLARE_XDNA_MSG_COMMON(name, op, status)			\
+#define DECLARE_XDNA_MSG_COMMON(name, op, s)				\
 	struct name##_req	req = { 0 };				\
-	struct name##_resp	resp = { status	};			\
+	struct name##_resp	resp = { .status = s };			\
 	struct xdna_notify	hdl = {					\
 		.error = 0,						\
 		.data = (u32 *)&resp,					\
 		.size = sizeof(resp),					\
 		.comp = COMPLETION_INITIALIZER_ONSTACK(hdl.comp),	\
+		.status = (u32 *)&resp.status,				\
 	};								\
 	struct xdna_mailbox_msg msg = {					\
 		.send_data = (u8 *)&req,				\
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 3599e713bfcb..2e47a09f10cc 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -29,9 +29,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
  * 0.2: Support getting last error hardware error
  * 0.3: Support firmware debug buffer
+ * 0.4: Support getting resource and telemetry information
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		3
+#define AMDXDNA_DRIVER_MINOR		4
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 10124cccb102..23feb5f6fad3 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -73,6 +73,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
 	.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU1_SRAM_BAR_BASE,
+	.hwctx_limit	= 6,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU1_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU1_SRAM, MPNPU_SRAM_I2X_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index a081cac75ee0..67c2ae931c62 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
 	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
+	.hwctx_limit	= 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index e1da882420ec..fac6c1b0b74b 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -93,6 +93,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
 	.mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU4_SRAM_BAR_BASE,
+	.hwctx_limit	= 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 5f1cf83461c4..c91e1fa76ff5 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
 	.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU5_SRAM_BAR_BASE,
+	.hwctx_limit	= 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index 94a7005685a7..773f738915a7 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -71,6 +71,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
 	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
+	.hwctx_limit	= 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index c7eec9ceb2ae..8ad254bc35a5 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -442,6 +442,40 @@ enum amdxdna_drm_get_param {
 	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
 	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
 	DRM_AMDXDNA_GET_POWER_MODE,
+	DRM_AMDXDNA_QUERY_TELEMETRY,
+	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
+};
+
+/**
+ * struct amdxdna_drm_get_resource_info - Get resource information
+ */
+struct amdxdna_drm_get_resource_info {
+	/** @npu_clk_max: max H-Clocks */
+	__u64 npu_clk_max;
+	/** @npu_tops_max: max TOPs */
+	__u64 npu_tops_max;
+	/** @npu_task_max: max number of tasks */
+	__u64 npu_task_max;
+	/** @npu_tops_curr: current TOPs */
+	__u64 npu_tops_curr;
+	/** @npu_task_curr: current number of tasks */
+	__u64 npu_task_curr;
+};
+
+/**
+ * struct amdxdna_drm_query_telemetry_header - Telemetry data header
+ */
+struct amdxdna_drm_query_telemetry_header {
+	/** @major: Firmware telemetry interface major version number */
+	__u32 major;
+	/** @minor: Firmware telemetry interface minor version number */
+	__u32 minor;
+	/** @type: Telemetry query type */
+	__u32 type;
+	/** @map_num_elements: Total number of elements in the map table */
+	__u32 map_num_elements;
+	/** @map: Element map */
+	__u32 map[];
 };
 
 /**
-- 
2.34.1

