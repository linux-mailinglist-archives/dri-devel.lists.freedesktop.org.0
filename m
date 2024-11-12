Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABB9C61C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 20:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7410E625;
	Tue, 12 Nov 2024 19:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MOJu+1AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F02410E629
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 19:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB36UC4OiQUgHa/2vSeGfJD/jwgFizr+nLqSjAlf82ZprrL4ygP90DcPl51nTZQ8nInLpnZYh5OobZk/UzEH9zB1CkiP2y86QPYj2ciCVRNV2gvw0Pvg5jsmhIO6zTNmUkv+msOB/tbewOl5doYtupbnfbAO23OZHtqWMZcJIc0RyqgJicqhyjngV3ASRQGJVP5QuNiDK6x6qOd4977xcuRfzfOJZXzszDyVitfDmmkAVd1pwRSmLnRskZTfdEhkwwcizECaMwm1dUEinPMT1Uk4NN5wcmZwz3SI46oShsWvnujEHKS6ONc/KkT5Q+2XlVZXaDRoZBasfmMvyK7Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZktMlmMdbRLcz6bNdeAMG/bQ+pEO6SX6Z5+weBCwUM=;
 b=sgZ2pZVcEX8Ps1onHuUPtaAvqO35ZzOhEXaXlSHgMIG1W9saCkUEEAqzXmB7QUENo3etkWfsEaPP+QWy0nV8Hwpkg37fLPokW9KIwLoi8R7tqpiVYb6pc3AUfUH6N/d0VChaPRPd81212o/UrfrXFsCJjQuBopoaNdTPMRxY4WbyrUnxuq0HGuA3zHdYc4C1pZCsccZDEzknUQMCn4a/QVr+72mUun4V7YS2YwlMSgv3awp6cnphHRKuLKzy1LwMUbIVhzZRqwz23HrU6uJ/lw0THLcJvI0OEx4i6ouUnpw0F/SHjpZ/qbC7FfUr2f0tNmc/udFO+dCk80ftu5twVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZktMlmMdbRLcz6bNdeAMG/bQ+pEO6SX6Z5+weBCwUM=;
 b=MOJu+1AQtigwrCeZlNzI/1EOmLIzjuXUPyQmsE4l0mW3RingW4r90HcAjdr0RrWAjnsJcNSSBE/IOZ9CQQSptN+w327IU8XGDoO7fLc6QbdeYYe3uZPlAV4bJJcdG9xNkiTVZ+ce82ok3dDF67HKkpJ5jkeEDIrTG1iFRzFpVWA=
Received: from SA1P222CA0103.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::7)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 19:48:10 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::c1) by SA1P222CA0103.outlook.office365.com
 (2603:10b6:806:3c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 19:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 19:48:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:09 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 13:48:09 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V10 10/10] accel/amdxdna: Add query functions
Date: Tue, 12 Nov 2024 11:47:45 -0800
Message-ID: <20241112194745.854626-11-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112194745.854626-1-lizhi.hou@amd.com>
References: <20241112194745.854626-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|PH0PR12MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbbeaae-21f0-4e20-8371-08dd0352f006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?28IC8HKW64sdV8cKyAAbebEuaoaZ1mJrHdul8Ct193udhUGzHHI54ftaNFLS?=
 =?us-ascii?Q?AEqZEty1DC53dwaULXD0VOwUsRmwOS8QF2gVjfDNbwuz1OYACx5hjFVaQtzR?=
 =?us-ascii?Q?2b3wi1CTHGr5fNBwHPL17ODCNVDR/4ps7Es0R6hrYRsF4CENCr0iNcBy7ksr?=
 =?us-ascii?Q?KJa1Hnc+kShDI6JjW0Cc9/AlYrToVa2RhMgGIGF3Q/D0sFbm2/TxvHItEduG?=
 =?us-ascii?Q?eTiX5fgxtQG7iI9EN0mEo/jBk4dTRQGwVlhffsj8DZ4Oq+MFKdV19jAw15Va?=
 =?us-ascii?Q?6TNKMfr8vcian7InipPFXSCVYsXcodPHwtFQ8r1pnk+XwZbBGFVU5sXnskbm?=
 =?us-ascii?Q?T4HCQemSkaF6BCEAoGddOnyEE50NH+oFB29Ot8vNXVp2T5Za19rWpp9Nc4m8?=
 =?us-ascii?Q?AwY7W8jNwUZoKbLsl7RkspH9jOOGZITzz35N55IWl92wlgGbiYiGepZSvFzm?=
 =?us-ascii?Q?RenuJjj8oCN+C3w6b2SQZtDqynVO1FH4Aa6MiCz9wxTwHHOG3HI94gx4XX/9?=
 =?us-ascii?Q?CTHWdKGakfIq/idz3wbDZrDxS4r6Aax3o86hw08S1Ck0buxmGRD0Lx2O9xbG?=
 =?us-ascii?Q?WZtcpnHZAd4T8tYRYJ0wmMQ142nwPW4iZ76S40cS+z8qGGsTTCB22xIzyxfN?=
 =?us-ascii?Q?JmvkQ6Lp7vU896Qbi1A1tz/qiyThoqm9GvBX0QFSLAprCJESA0U3nJYYmoaC?=
 =?us-ascii?Q?jUZ3AsC8EkYEGf4sJVKs94/0a6T1f+k0+WiXHQ1rRgCaGbDe0OHawSylY/4y?=
 =?us-ascii?Q?auJs1twUeSd6nJjt/y8gc0tc5jacvUvwQxhW8XKAu9RnewX7Sgn9e87Sz/9C?=
 =?us-ascii?Q?UpI+MDVHz/bOMdylsRCb5fCL3QWE1PN/BlaKZ9yFuolZKc1EWmR0QHTyPMWe?=
 =?us-ascii?Q?yowPzpKT+qFSjDsGPRvhOSMVNohKgGXehiIgfNk8chXvLEFY2gZ4TrMfFrHP?=
 =?us-ascii?Q?qLIpUct7S8Pk+pyok1XS5dRaqJpDQL8mhDHUzacAJTwhN6GNPn1r62KtOfW1?=
 =?us-ascii?Q?09fzlZhisvREA/v3fJHKlrLg4cNCZ4kpYgV/xnbl5pt4M6e3TS6DOTqmRYWh?=
 =?us-ascii?Q?+q9+zUuWXdqN93x9s7BClkL54ofufqFN10eT+mCD1RIs1pBLvwR04uAXIXoc?=
 =?us-ascii?Q?FhmOj5WebMqiQNG0+ik3jk/+MGmtvoMMA/2fHRgVv/KoVQ+xSTWHephuhLVB?=
 =?us-ascii?Q?A+TAKWruSfBqD5rTLSJ1UKsOtsC55G7lZGII6I1rNDkUWHxUh89fW6qcmq3e?=
 =?us-ascii?Q?XQZaumOSrnzMiLtoaAtcwNpW85yls1mq0X/38Kb8nlu3TTdBobxIVcx52ZM8?=
 =?us-ascii?Q?JaiL74HtiHPlt0wBrTyCCvXf0Ms1btww2TooLhRlPsKsi+dapeKemIZGlDWP?=
 =?us-ascii?Q?e47ehrPsEBt9VP9KDNe9TO4hbp5g1xKO+gSTgVnWocfFDeyhqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 19:48:10.4857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbbeaae-21f0-4e20-8371-08dd0352f006
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c    |  65 +++++++
 drivers/accel/amdxdna/aie2_pci.c        | 222 ++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        |   1 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  19 ++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   3 +
 include/uapi/drm/amdxdna_accel.h        | 166 ++++++++++++++++++
 6 files changed, 476 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index eb7e27045213..c01a1d957b56 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -308,6 +308,71 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u6
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
index 5467aabe7308..349ada697e48 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -5,6 +5,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -525,11 +526,232 @@ static void aie2_fini(struct amdxdna_dev *xdna)
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
index 4422dd6c985e..6a2686255c9c 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -231,6 +231,7 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
+int aie2_query_status(struct amdxdna_dev_hdl *ndev, char *buf, u32 size, u32 *cols_filled);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, const u32 *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index c4df674fdf50..02533732d4ca 100644
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
@@ -154,6 +171,8 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_SYNC_BO, amdxdna_drm_sync_bo_ioctl, 0),
 	/* Execution */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
+	/* AIE hardware */
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
 };
 
 static const struct file_operations amdxdna_fops = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 89e0bbc5e962..11d017c17ac3 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -17,7 +17,9 @@
 
 extern const struct drm_driver amdxdna_drm_drv;
 
+struct amdxdna_client;
 struct amdxdna_dev;
+struct amdxdna_drm_get_info;
 struct amdxdna_gem_obj;
 struct amdxdna_hwctx;
 struct amdxdna_sched_job;
@@ -37,6 +39,7 @@ struct amdxdna_dev_ops {
 	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
+	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 };
 
 /*
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 3e88ed386fac..af12af8bd699 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -32,6 +32,7 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_GET_BO_INFO,
 	DRM_AMDXDNA_SYNC_BO,
 	DRM_AMDXDNA_EXEC_CMD,
+	DRM_AMDXDNA_GET_INFO,
 };
 
 /**
@@ -235,6 +236,167 @@ struct amdxdna_drm_exec_cmd {
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
+ * @pad: Structure padding.
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
+ * @pad: Structure padding.
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
+ * @pad: Structure padding.
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
+ * @pad: Structure padding.
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
@@ -263,6 +425,10 @@ struct amdxdna_drm_exec_cmd {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_EXEC_CMD, \
 		 struct amdxdna_drm_exec_cmd)
 
+#define DRM_IOCTL_AMDXDNA_GET_INFO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_INFO, \
+		 struct amdxdna_drm_get_info)
+
 #if defined(__cplusplus)
 } /* extern c end */
 #endif
-- 
2.34.1

