Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1E9759F5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD3110EA71;
	Wed, 11 Sep 2024 18:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w41sQl1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2781110EA6D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:06:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtYTVThPxCx7dYbgkffyXegay/FxW24Mp7SacpNKK8OXk4yZa56ka0lDSC9RRUekxXyk1xI19liCnO6+GV7ryOnsEOEaF3mQL4NLkGcDbWsJMdQshcAc1NXenraANzuuN2XFDPJmGdQ4hodoqxhGOvdSixPlfEngQFoRJYJuRCcV1qt8ZDiiEVHr3HA4By11AdvhLhrfTnUyYDrEfZSZYP65uD3IJEJsekMYxw8QO2VtREjKh7I6+nLEz48eUYa2vHma9XYHWZhH0wO9UTPMRwdtO7v5zVwaLnUetSEngcK087NBBRhrgPXh5gjIk2EAWu1LereZlisVtd3jeDMpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yvSGLUjvXj2uUl3HLsaBm8CJUmuSvmHTa4ETBpWpGo=;
 b=euwgBavvsqQTUHKL7pUWh2niY/1HnnmvUfOnQ87LWXFBqImPUov76N/zlA3QOuP8BL9T1b7c+AAc/s0xSKRUitMI6p/qLrUDAOlHPZtgH+XRQ4wC/oYfRUxxjiGozXlKy+4zo7N01uVSAe7g6VdR6iyAE/t62BBW37i8LBWTvFNqQ6Fbes5Jb5YoFe+UdNM6L1uLfnkQ9FImSIj4KfxdWBl6U7aUn1I93vdNWYiQAaImBQI8bhZceuxKP99Oums/cvI7xKMxt5DuKH8Ofa0/IV/2B4jl3Cxkfe8otstDSzwlkYSRgxnqIpv+BbbWlJYXNkwp19LhzSqqTpQA9tmrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yvSGLUjvXj2uUl3HLsaBm8CJUmuSvmHTa4ETBpWpGo=;
 b=w41sQl1NuzrQ7dD43Wakrqo2spmp+cZrwo4G4U5IGC9JbbOXJkNmXC62I5Ujjj4Xydnrjw2nnqWbh8ep1BWYHOvLxbt0KbKDE/X3UBCR00P1+YxAIBaG3y1b3T2kFz1gHz909GWeW+LV4TsjjinQWtmLxjeOf5XaFjhHdcgqXUs=
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 11 Sep
 2024 18:06:35 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::e3) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 18:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 18:06:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:30 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 13:06:29 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V3 10/11] accel/amdxdna: Add query functions
Date: Wed, 11 Sep 2024 11:06:03 -0700
Message-ID: <20240911180604.1834434-11-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911180604.1834434-1-lizhi.hou@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: d25166a1-e984-4816-7191-08dcd28c7818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OBmHCvvhOUGTngtf+6N9q7dJskvNaAbfjabtaS5/ZRVt5k8PmYmTMG3bKNPQ?=
 =?us-ascii?Q?K/0bbBgLf4/fqhj+z2kVilKHmaOnyIXgp/lV8CX5dxiCdpAD6nTOFTJ9Mlzf?=
 =?us-ascii?Q?hdSwvhPMffTPhyp7+je4Kr1qWL2huyxYH9/U9i5y12wyRsRwnEXPtQOnlUJN?=
 =?us-ascii?Q?CAYEhsB+PLYOj2LIGQJ8d6WrtA6LUWy7XQ599Gw6rGPV9vkM8dzBVg9+wykM?=
 =?us-ascii?Q?GuysdcRO8P97b1J46QzJgZlp1dYhPYHfAVLGNvBG/tGzLyQ9LQkqr+Xw3mQX?=
 =?us-ascii?Q?1SjeVz4eBUUOBRwtwHTgugSVLRLmrMjyxSO449Gk2SVcxn/b/6sUwZeaKb5A?=
 =?us-ascii?Q?3OfQY/hicV83lGvQDRr9ltFvYQ/dOEwZiF2wc7qsTz+22YkBxcC2m37SiA98?=
 =?us-ascii?Q?MI/R3Rgd6+9CF3EMN1A+feFFNmoPUQltwaflTaPNV6hGXufwYK5eVyolXNNu?=
 =?us-ascii?Q?DDh2MAU+XywdhPSLYcqKwuqyfZn+lMo/yDTAwz/q4EyaqI40ejKZ25hlV8g9?=
 =?us-ascii?Q?4xCPhnLONbMy2XY99qPH4gYGYecVRPq6l1Nyu/AYDIDfYqoV/qZ21KOl/gXE?=
 =?us-ascii?Q?PLkyrVAOKqln76LBIuppS5Z0OHKdgPb14OSqJHher66hGziMmpXVqJLXpL2t?=
 =?us-ascii?Q?zqDYqv9uGrC/6GkslnuLKuAwAAKiivsqjHAT0KaqFW43LmvYoVwF8JsvU0r5?=
 =?us-ascii?Q?aLy39wPgvjLORijpHQ9vGY/CMPal0Kytk0UzPMg7DdOQp4B4zfO9/gVeiUan?=
 =?us-ascii?Q?rJ7tvNILDXBeCpSh5jYrLhLVNnPSPc81eTFVVYnfKeLVXgU0W9TUpP7c0Zj8?=
 =?us-ascii?Q?Q3iy96YkzteaOgWI0DiUCSkx0F/MC22X4kePlmbYE+htuWKq3rLSoPduOjCp?=
 =?us-ascii?Q?YnXd5/huPCwuS5efXEZvTNHfIP+I0hQLwvOpqtwb5LJcxhiZwAQCtX//p/bp?=
 =?us-ascii?Q?JegN8K8zbx+TdlyOTGAgfVOxaC+GQ62M6RCxdnMQ9I4q3MdAK3qW+OG1TFXK?=
 =?us-ascii?Q?WaPT6OV7Tm27oXeJLj3dMvRlvCBWzAn135lioRRqfxwa8pXUetcs6nAaCDU7?=
 =?us-ascii?Q?a6uMZ63Y3eqhR2jdg1PUFS6boSRgDywPdWa2luMYxmRfrYLFP/2LYf8VvDVx?=
 =?us-ascii?Q?DZGk5/4q5SxnqkmfqlibjMfA8Xn1lZhXxJb84+rxD0SKiFeCjq0j/f/WHG2O?=
 =?us-ascii?Q?MVqpoF+saH0YTVaCyfQs+B/UR6woDR4wvKPgLUp1vzTP6vPXTEOSQYUktrgV?=
 =?us-ascii?Q?nHc3mDgKjWUPC+7ErVxhMkH3MMaahdG20Xo9KQe1uHc+zQKztzBmLQV6FTOQ?=
 =?us-ascii?Q?spzSVrPOkXUqKxU5xR/qzszgbm5Wpofx19i/d2EBGwOO4A5w8xUT0Rxfsxr+?=
 =?us-ascii?Q?w9fZDJuDO8NRXaEwsTh9DlhWqeVELtrluNI1I79d0aJspx/SWJntAWP/wuH5?=
 =?us-ascii?Q?BoyiwqJdQK1AFeNXnshAXpJnqLRt9ZtL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 18:06:33.0327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d25166a1-e984-4816-7191-08dcd28c7818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

Add GET_INFO ioctl to retrieve hardware information, including
AIE, clock, hardware context etc.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_error.c      |   1 +
 drivers/accel/amdxdna/aie2_message.c    |  65 +++++++
 drivers/accel/amdxdna/aie2_pci.c        | 222 ++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        |   1 +
 drivers/accel/amdxdna/aie2_psp.c        |   1 +
 drivers/accel/amdxdna/aie2_smu.c        |   1 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  19 ++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   2 +
 include/uapi/drm/amdxdna_accel.h        | 166 ++++++++++++++++++
 9 files changed, 478 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index 3b8223420f5b..9dc44ecf2adb 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
  */
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 0eaa233b72b2..b3630f4ccebe 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -307,6 +307,71 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u6
 	return 0;
 }
 
+int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
+		      u32 size, u32 *cols_filled)
+{
+	DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	struct amdxdna_client *client;
+	struct amdxdna_hwctx *hwctx;
+	dma_addr_t dma_addr;
+	u32 aie_bitmap = 0;
+	u8 *buff_addr;
+	int next = 0;
+	int ret, idx;
+
+	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
+					  DMA_FROM_DEVICE, GFP_KERNEL);
+	if (!buff_addr)
+		return -ENOMEM;
+
+	/* Go through each hardware context and mark the AIE columns that are active */
+	list_for_each_entry(client, &xdna->client_list, node) {
+		idx = srcu_read_lock(&client->hwctx_srcu);
+		idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
+		srcu_read_unlock(&client->hwctx_srcu, idx);
+	}
+
+	*cols_filled = 0;
+	req.dump_buff_addr = dma_addr;
+	req.dump_buff_size = size;
+	req.num_cols = hweight32(aie_bitmap);
+	req.aie_bitmap = aie_bitmap;
+
+	drm_clflush_virt_range(buff_addr, size); /* device can access */
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret) {
+		XDNA_ERR(xdna, "Error during NPU query, status %d", ret);
+		goto fail;
+	}
+
+	if (resp.status != AIE2_STATUS_SUCCESS) {
+		XDNA_ERR(xdna, "Query NPU status failed, status 0x%x", resp.status);
+		ret = -EINVAL;
+		goto fail;
+	}
+	XDNA_DBG(xdna, "Query NPU status completed");
+
+	if (size < resp.size) {
+		ret = -EINVAL;
+		XDNA_ERR(xdna, "Bad buffer size. Available: %u. Needs: %u", size, resp.size);
+		goto fail;
+	}
+
+	if (copy_to_user(buf, buff_addr, resp.size)) {
+		ret = -EFAULT;
+		XDNA_ERR(xdna, "Failed to copy NPU status to user space");
+		goto fail;
+	}
+
+	*cols_filled = aie_bitmap;
+
+fail:
+	dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, dma_addr, DMA_FROM_DEVICE);
+	return ret;
+}
+
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, const u32 *, size_t))
 {
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 0ec042aaa39f..177b51bee8b1 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -528,11 +529,232 @@ static void aie2_fini(struct amdxdna_dev *xdna)
 	pci_free_irq_vectors(pdev);
 }
 
+static int aie2_get_aie_status(struct amdxdna_client *client,
+			       struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_aie_status status;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev_hdl *ndev;
+	int ret;
+
+	ndev = xdna->dev_handle;
+	if (copy_from_user(&status, u64_to_user_ptr(args->buffer), sizeof(status))) {
+		XDNA_ERR(xdna, "Failed to copy AIE request into kernel");
+		return -EFAULT;
+	}
+
+	if (ndev->metadata.cols * ndev->metadata.size < status.buffer_size) {
+		XDNA_ERR(xdna, "Invalid buffer size. Given Size: %u. Need Size: %u.",
+			 status.buffer_size, ndev->metadata.cols * ndev->metadata.size);
+		return -EINVAL;
+	}
+
+	ret = aie2_query_status(ndev, u64_to_user_ptr(status.buffer),
+				status.buffer_size, &status.cols_filled);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to get AIE status info. Ret: %d", ret);
+		return ret;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &status, sizeof(status))) {
+		XDNA_ERR(xdna, "Failed to copy AIE request info to user space");
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int aie2_get_aie_metadata(struct amdxdna_client *client,
+				 struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_aie_metadata *meta;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev_hdl *ndev;
+	int ret = 0;
+
+	ndev = xdna->dev_handle;
+	meta = kzalloc(sizeof(*meta), GFP_KERNEL);
+	if (!meta)
+		return -ENOMEM;
+
+	meta->col_size = ndev->metadata.size;
+	meta->cols = ndev->metadata.cols;
+	meta->rows = ndev->metadata.rows;
+
+	meta->version.major = ndev->metadata.version.major;
+	meta->version.minor = ndev->metadata.version.minor;
+
+	meta->core.row_count = ndev->metadata.core.row_count;
+	meta->core.row_start = ndev->metadata.core.row_start;
+	meta->core.dma_channel_count = ndev->metadata.core.dma_channel_count;
+	meta->core.lock_count = ndev->metadata.core.lock_count;
+	meta->core.event_reg_count = ndev->metadata.core.event_reg_count;
+
+	meta->mem.row_count = ndev->metadata.mem.row_count;
+	meta->mem.row_start = ndev->metadata.mem.row_start;
+	meta->mem.dma_channel_count = ndev->metadata.mem.dma_channel_count;
+	meta->mem.lock_count = ndev->metadata.mem.lock_count;
+	meta->mem.event_reg_count = ndev->metadata.mem.event_reg_count;
+
+	meta->shim.row_count = ndev->metadata.shim.row_count;
+	meta->shim.row_start = ndev->metadata.shim.row_start;
+	meta->shim.dma_channel_count = ndev->metadata.shim.dma_channel_count;
+	meta->shim.lock_count = ndev->metadata.shim.lock_count;
+	meta->shim.event_reg_count = ndev->metadata.shim.event_reg_count;
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), meta, sizeof(*meta)))
+		ret = -EFAULT;
+
+	kfree(meta);
+	return ret;
+}
+
+static int aie2_get_aie_version(struct amdxdna_client *client,
+				struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_aie_version version;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev_hdl *ndev;
+
+	ndev = xdna->dev_handle;
+	version.major = ndev->version.major;
+	version.minor = ndev->version.minor;
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &version, sizeof(version)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int aie2_get_clock_metadata(struct amdxdna_client *client,
+				   struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_clock_metadata *clock;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev_hdl *ndev;
+	int ret = 0;
+
+	ndev = xdna->dev_handle;
+	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
+	if (!clock)
+		return -ENOMEM;
+
+	memcpy(clock->mp_npu_clock.name, ndev->mp_npu_clock.name,
+	       sizeof(clock->mp_npu_clock.name));
+	clock->mp_npu_clock.freq_mhz = ndev->mp_npu_clock.freq_mhz;
+	memcpy(clock->h_clock.name, ndev->h_clock.name, sizeof(clock->h_clock.name));
+	clock->h_clock.freq_mhz = ndev->h_clock.freq_mhz;
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), clock, sizeof(*clock)))
+		ret = -EFAULT;
+
+	kfree(clock);
+	return ret;
+}
+
+static int aie2_get_hwctx_status(struct amdxdna_client *client,
+				 struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_hwctx __user *buf;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_drm_query_hwctx *tmp;
+	struct amdxdna_client *tmp_client;
+	struct amdxdna_hwctx *hwctx;
+	bool overflow = false;
+	u32 req_bytes = 0;
+	u32 hw_i = 0;
+	int ret = 0;
+	int next;
+	int idx;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	buf = u64_to_user_ptr(args->buffer);
+	list_for_each_entry(tmp_client, &xdna->client_list, node) {
+		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
+		next = 0;
+		idr_for_each_entry_continue(&tmp_client->hwctx_idr, hwctx, next) {
+			req_bytes += sizeof(*tmp);
+			if (args->buffer_size < req_bytes) {
+				/* Continue iterating to get the required size */
+				overflow = true;
+				continue;
+			}
+
+			memset(tmp, 0, sizeof(*tmp));
+			tmp->pid = tmp_client->pid;
+			tmp->context_id = hwctx->id;
+			tmp->start_col = hwctx->start_col;
+			tmp->num_col = hwctx->num_col;
+			tmp->command_submissions = hwctx->priv->seq;
+			tmp->command_completions = hwctx->priv->completed;
+
+			if (copy_to_user(&buf[hw_i], tmp, sizeof(*tmp))) {
+				ret = -EFAULT;
+				srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
+				goto out;
+			}
+			hw_i++;
+		}
+		srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
+	}
+
+	if (overflow) {
+		XDNA_ERR(xdna, "Invalid buffer size. Given: %u Need: %u.",
+			 args->buffer_size, req_bytes);
+		ret = -EINVAL;
+	}
+
+out:
+	kfree(tmp);
+	args->buffer_size = req_bytes;
+	return ret;
+}
+
+static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	int ret, idx;
+
+	if (!drm_dev_enter(&xdna->ddev, &idx))
+		return -ENODEV;
+
+	switch (args->param) {
+	case DRM_AMDXDNA_QUERY_AIE_STATUS:
+		ret = aie2_get_aie_status(client, args);
+		break;
+	case DRM_AMDXDNA_QUERY_AIE_METADATA:
+		ret = aie2_get_aie_metadata(client, args);
+		break;
+	case DRM_AMDXDNA_QUERY_AIE_VERSION:
+		ret = aie2_get_aie_version(client, args);
+		break;
+	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
+		ret = aie2_get_clock_metadata(client, args);
+		break;
+	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
+		ret = aie2_get_hwctx_status(client, args);
+		break;
+	default:
+		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
+		ret = -EOPNOTSUPP;
+	}
+	XDNA_DBG(xdna, "Got param %d", args->param);
+
+	drm_dev_exit(idx);
+	return ret;
+}
+
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
 	.resume         = aie2_hw_start,
 	.suspend        = aie2_hw_stop,
+	.get_aie_info   = aie2_get_info,
 	.hwctx_init     = aie2_hwctx_init,
 	.hwctx_fini     = aie2_hwctx_fini,
 	.hwctx_config   = aie2_hwctx_config,
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 5c09f2693787..0deb849edddf 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -221,6 +221,7 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
+int aie2_query_status(struct amdxdna_dev_hdl *ndev, char *buf, u32 size, u32 *cols_filled);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, const u32 *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index d6e71d4df0e5..facb52740ddc 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
  */
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/gpu_scheduler.h>
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index f9197b8715c8..956c488c4650 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
  */
 
+#include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 193c9babdb9f..2c0d6e9a2c86 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -143,6 +143,23 @@ static int amdxdna_flush(struct file *f, fl_owner_t id)
 	return 0;
 }
 
+static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_get_info *args = data;
+	int ret;
+
+	if (!xdna->dev_info->ops->get_aie_info)
+		return -EOPNOTSUPP;
+
+	XDNA_DBG(xdna, "Request parameter %u", args->param);
+	mutex_lock(&xdna->dev_lock);
+	ret = xdna->dev_info->ops->get_aie_info(client, args);
+	mutex_unlock(&xdna->dev_lock);
+	return ret;
+}
+
 static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	/* Context */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_ioctl, 0),
@@ -155,6 +172,8 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	/* Exectuion */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_WAIT_CMD, amdxdna_drm_wait_cmd_ioctl, 0),
+	/* AIE hardware */
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
 };
 
 static const struct file_operations amdxdna_fops = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 01b516743a00..a3e7e525c54d 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -17,6 +17,7 @@
 
 extern const struct drm_driver amdxdna_drm_drv;
 
+struct amdxdna_client;
 struct amdxdna_dev;
 struct amdxdna_gem_obj;
 struct amdxdna_hwctx;
@@ -38,6 +39,7 @@ struct amdxdna_dev_ops {
 	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*cmd_wait)(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
+	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 };
 
 /*
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 6d26dfab508c..eeb9d32d6103 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -32,6 +32,7 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_SYNC_BO,
 	DRM_AMDXDNA_EXEC_CMD,
 	DRM_AMDXDNA_WAIT_CMD,
+	DRM_AMDXDNA_GET_INFO,
 };
 
 /**
@@ -256,6 +257,167 @@ struct amdxdna_drm_wait_cmd {
 	__u64 seq;
 };
 
+/**
+ * struct amdxdna_drm_query_aie_status - Query the status of the AIE hardware
+ * @buffer: The user space buffer that will return the AIE status.
+ * @buffer_size: The size of the user space buffer.
+ * @cols_filled: A bitmap of AIE columns whose data has been returned in the buffer.
+ */
+struct amdxdna_drm_query_aie_status {
+	__u64 buffer; /* out */
+	__u32 buffer_size; /* in */
+	__u32 cols_filled; /* out */
+};
+
+/**
+ * struct amdxdna_drm_query_aie_version - Query the version of the AIE hardware
+ * @major: The major version number.
+ * @minor: The minor version number.
+ */
+struct amdxdna_drm_query_aie_version {
+	__u32 major; /* out */
+	__u32 minor; /* out */
+};
+
+/**
+ * struct amdxdna_drm_query_aie_tile_metadata - Query the metadata of AIE tile (core, mem, shim)
+ * @row_count: The number of rows.
+ * @row_start: The starting row number.
+ * @dma_channel_count: The number of dma channels.
+ * @lock_count: The number of locks.
+ * @event_reg_count: The number of events.
+ * @pad: MBZ.
+ */
+struct amdxdna_drm_query_aie_tile_metadata {
+	__u16 row_count;
+	__u16 row_start;
+	__u16 dma_channel_count;
+	__u16 lock_count;
+	__u16 event_reg_count;
+	__u16 pad[3];
+};
+
+/**
+ * struct amdxdna_drm_query_aie_metadata - Query the metadata of the AIE hardware
+ * @col_size: The size of a column in bytes.
+ * @cols: The total number of columns.
+ * @rows: The total number of rows.
+ * @version: The version of the AIE hardware.
+ * @core: The metadata for all core tiles.
+ * @mem: The metadata for all mem tiles.
+ * @shim: The metadata for all shim tiles.
+ */
+struct amdxdna_drm_query_aie_metadata {
+	__u32 col_size;
+	__u16 cols;
+	__u16 rows;
+	struct amdxdna_drm_query_aie_version version;
+	struct amdxdna_drm_query_aie_tile_metadata core;
+	struct amdxdna_drm_query_aie_tile_metadata mem;
+	struct amdxdna_drm_query_aie_tile_metadata shim;
+};
+
+/**
+ * struct amdxdna_drm_query_clock - Metadata for a clock
+ * @name: The clock name.
+ * @freq_mhz: The clock frequency.
+ * @pad: MBZ.
+ */
+struct amdxdna_drm_query_clock {
+	__u8 name[16];
+	__u32 freq_mhz;
+	__u32 pad;
+};
+
+/**
+ * struct amdxdna_drm_query_clock_metadata - Query metadata for clocks
+ * @mp_npu_clock: The metadata for MP-NPU clock.
+ * @h_clock: The metadata for H clock.
+ */
+struct amdxdna_drm_query_clock_metadata {
+	struct amdxdna_drm_query_clock mp_npu_clock;
+	struct amdxdna_drm_query_clock h_clock;
+};
+
+enum amdxdna_sensor_type {
+	AMDXDNA_SENSOR_TYPE_POWER
+};
+
+/**
+ * struct amdxdna_drm_query_sensor - The data for single sensor.
+ * @label: The name for a sensor.
+ * @input: The current value of the sensor.
+ * @max: The maximum value possible for the sensor.
+ * @average: The average value of the sensor.
+ * @highest: The highest recorded sensor value for this driver load for the sensor.
+ * @status: The sensor status.
+ * @units: The sensor units.
+ * @unitm: Translates value member variables into the correct unit via (pow(10, unitm) * value).
+ * @type: The sensor type from enum amdxdna_sensor_type.
+ * @pad: MBZ.
+ */
+struct amdxdna_drm_query_sensor {
+	__u8  label[64];
+	__u32 input;
+	__u32 max;
+	__u32 average;
+	__u32 highest;
+	__u8  status[64];
+	__u8  units[16];
+	__s8  unitm;
+	__u8  type;
+	__u8  pad[6];
+};
+
+/**
+ * struct amdxdna_drm_query_hwctx - The data for single context.
+ * @context_id: The ID for this context.
+ * @start_col: The starting column for the partition assigned to this context.
+ * @num_col: The number of columns in the partition assigned to this context.
+ * @pad: MBZ.
+ * @pid: The Process ID of the process that created this context.
+ * @command_submissions: The number of commands submitted to this context.
+ * @command_completions: The number of commands completed by this context.
+ * @migrations: The number of times this context has been moved to a different partition.
+ * @preemptions: The number of times this context has been preempted by another context in the
+ *               same partition.
+ * @errors: The errors for this context.
+ */
+struct amdxdna_drm_query_hwctx {
+	__u32 context_id;
+	__u32 start_col;
+	__u32 num_col;
+	__u32 pad;
+	__s64 pid;
+	__u64 command_submissions;
+	__u64 command_completions;
+	__u64 migrations;
+	__u64 preemptions;
+	__u64 errors;
+};
+
+enum amdxdna_drm_get_param {
+	DRM_AMDXDNA_QUERY_AIE_STATUS,
+	DRM_AMDXDNA_QUERY_AIE_METADATA,
+	DRM_AMDXDNA_QUERY_AIE_VERSION,
+	DRM_AMDXDNA_QUERY_CLOCK_METADATA,
+	DRM_AMDXDNA_QUERY_SENSORS,
+	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
+	DRM_AMDXDNA_NUM_GET_PARAM,
+};
+
+/**
+ * struct amdxdna_drm_get_info - Get some information from the AIE hardware.
+ * @param: Value in enum amdxdna_drm_get_param. Specifies the structure passed in the buffer.
+ * @buffer_size: Size of the input buffer. Size needed/written by the kernel.
+ * @buffer: A structure specified by the param struct member.
+ */
+struct amdxdna_drm_get_info {
+	__u32 param; /* in */
+	__u32 buffer_size; /* in/out */
+	__u64 buffer; /* in/out */
+};
+
 #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
 		 struct amdxdna_drm_create_hwctx)
@@ -288,6 +450,10 @@ struct amdxdna_drm_wait_cmd {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_WAIT_CMD, \
 		 struct amdxdna_drm_wait_cmd)
 
+#define DRM_IOCTL_AMDXDNA_GET_INFO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_INFO, \
+		 struct amdxdna_drm_get_info)
+
 #if defined(__cplusplus)
 } /* extern c end */
 #endif
-- 
2.34.1

