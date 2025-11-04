Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065FC2F710
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 07:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9910E520;
	Tue,  4 Nov 2025 06:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GRUBiT/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA4410E24D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw0GZzjlaRl+PnlCwtB6LOg0HblpW6oWmE/byCUmgtiOLWwB4KGGlpgro/dDc0U8FqY3Q4UNUBVrVXcGti6vCYloyG2tEPTs97S5DzFcYetIsKSu3iIbPFn88KMxAK3NgAFA0smrvMlly+9o45dP51BxiKIni9Q9hmzSVsBMFXr6YNjYVlkvjMb9dxQUcqehmdw/P9vOWV2HDe2y3NA6+CgJpTDT0SiLDYIsStiDTmUWcmPl7xJc+yPErZGzsx1sEpplTmXkBm4+Gn5V18EeCSxXTzLOyEX4jkxHXME1kplxmeC0/b/GgAYUgE0JauAb8rORAHWbU5Q8lBYSruiRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXdN484qXtwwN3uSDm18pgZjR0BmkoYb5emSsvAnMvg=;
 b=KprKRO/8G9k/lir8FNCgrpP0sHmF3tEx8yolmNAjI0sUwCgxOWaSz/170m9opaJ6OaigPX40qT2obXWvZvRC9E/jLezrFaNDzMdGsutfVQLIK4FJVZMuLn2HB9McnIGLaVwIk2FvkWNRw4WvbRXmJ9MLiRDIBSo6ACimc4mQ+0rFShMWYAqQARaD60HcSog2NBaYIcEKTOR4wX7werkIN6dcu9j4zasCPHcIR7gwNh+Oyb9HSwq1jbuRbFLTv/4kmS0sdgOCzWPjWX6eCEfrejQpbo+iF36CGAZXO8flOceHd3MnVjfHAtWiO5YIgiNSNIkAm31Yq4rGgMNcFJfq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXdN484qXtwwN3uSDm18pgZjR0BmkoYb5emSsvAnMvg=;
 b=GRUBiT/uWEdNcT1IvJvSdK4KrkodHS1wY15nnIfxFUWV1J5KcYSOMf39IT4V1sLqGdVLO0rBCYFCDHWg1gRdJzW2Y4T5GiyvjGT6c0KdUz2U2famVRu7WEx2BDFiZmR4H/NWbTFcXcRPQSMi5QdNgm3CtjXVD8J0HbmdUIeyJdg=
Received: from MN2PR01CA0060.prod.exchangelabs.com (2603:10b6:208:23f::29) by
 IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 06:26:21 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::ab) by MN2PR01CA0060.outlook.office365.com
 (2603:10b6:208:23f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 06:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 06:26:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 22:26:11 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 00:26:11 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 22:26:10 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH 3/3] accel/amdxdna: Add IOCTL parameter for telemetry data
Date: Mon, 3 Nov 2025 22:25:45 -0800
Message-ID: <20251104062546.833771-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104062546.833771-1-lizhi.hou@amd.com>
References: <20251104062546.833771-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b02f555-c497-4d22-69e9-08de1b6b123e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Un6DhamQ8tH80GB0Esn2N+ADH6MPUYTZDsxNjfyEu1ppw4YO5YHB0s/pFBow?=
 =?us-ascii?Q?Y4U3ksl2t96GO8aJ04ezrnVabwSB9DmnRHrzYe+DKS2kiaVr9yDAXX51cyfT?=
 =?us-ascii?Q?qcnR9VT/iYmCcszAAAxbRLaJzlG5CsyDzeyPkqzD5hO5WXNCxvlhJwKDiI9S?=
 =?us-ascii?Q?meOf8EQrQqfYFIA7Fa3mLJkO5uCKzAGPkuVjhxXQ5uosl1BcvyVyWewERFi+?=
 =?us-ascii?Q?yolnqui1y/g/LRgTDPgTf1n5faXgEA3TQzTVfcvNNJmFmTQ2vK3hlJE4yFU0?=
 =?us-ascii?Q?nneas+kkt76RYit9z/iEBpOG43kJ4sVSOJ4+Md1PYghBOPdDkQkjK7waPGK/?=
 =?us-ascii?Q?9O3hebIuVrmN3Jv5vGuWtJm8FpwQMxdrUrKy5gsXtOfxPtmhStOaYCeUjTsx?=
 =?us-ascii?Q?4MONKaKWBgifaCWF91BRhXDkgy78hoPJ5G5d/ZsuHzg/WHsLn3bqE80ikgmL?=
 =?us-ascii?Q?j4TWw99X2ZYhFMlcAp3gX1zpoj0JkCeLxK1UH+NHe44gPdJmVPP4GCzqhVmj?=
 =?us-ascii?Q?79xn7krgkPllkEuDb3TN2jUQOx1TuCDmzhRtnDk2/zF6xZBXZl8h/qT77Dpr?=
 =?us-ascii?Q?tVzyqB423EllskSOYRXdjsUVKJFc7QaYhUuEulbATjz5HNnCYmnhB6LJYrIG?=
 =?us-ascii?Q?WsCyTE/p3VJNUInhz99xq53uGO6gtyDkNp3FgyMAs2pj3iQW9KDuCoUO66IZ?=
 =?us-ascii?Q?V3+xs+dS3DK2WyJDcGWQ7vMicwFCHkaTvHxXtSKrrUJVwFYKALZeVHYqTOH2?=
 =?us-ascii?Q?zowwUDgOrpbiyFlkejVoWikJR+Khx9lrBEaUVtRjXLyn6kNC+Pzhkf+Imno3?=
 =?us-ascii?Q?VpC4mQWIa+SGnSqJfdUpgb/ZyDEz2w1D2q7lLnA5zgvsNY3YohL3EOgImebG?=
 =?us-ascii?Q?M2dA5ltNlNukRoKcRf9QwWe/06yPGrfJ5vIndOpTJaSEWRgE3YEmvOuTvJod?=
 =?us-ascii?Q?063jGPqwfmboIw1biqWf+7LqlN844/vo5XRXG7ZE7OAmYfWf8qYkjgVXtHAy?=
 =?us-ascii?Q?vh/72eCK8TghCmESvThGWPeHObw9FQ6UBiRzzJRVj4vpmMn5zsWmNVvohQA2?=
 =?us-ascii?Q?iPWo8HzWLoQifeLNFqF2ieCBdgb97a9Ge/d3oPT/TV+fGKW+3ZinPq4xPVg5?=
 =?us-ascii?Q?6SvFILlXtSNR9vI+b4Me6MQlZmDro18mpUzLgAPe9CsSjX4P5V5+t6Mv/qHi?=
 =?us-ascii?Q?X7Xva3Gp0F+DMmMksTE9Azrr4WgLw0ROQ2mLYFNjY0l4JP6srrjKIxj8Hlnb?=
 =?us-ascii?Q?J4dKnJMlkQah7XRnFvVBoh/TUr/zVRclzrhsU6YFuRCG6VkvItT6/F7ZgEEr?=
 =?us-ascii?Q?7wkPUaSqOjy6BJcye3XwzAXRrRaXT1qyAQv5tqcgSc/rgkXuC9LnyPJXv2Q2?=
 =?us-ascii?Q?f2xVCKBF6CXauenljuivwAmVnsnibVMO4D0Oy5r4FWmndPVEuQdCvKmoMACe?=
 =?us-ascii?Q?N03TM77RhSWM4pgGUq+VDEyu5lfPplJEwLo2oUfZvGQRrlfkpDUa3W3AleuD?=
 =?us-ascii?Q?zZeir1sBSs+An4ORhGJyipxAPLH0CniuXj/ee4RBjh49KnD4L/R6GnkAsMQp?=
 =?us-ascii?Q?B21J79ZlP7cwKgkX78g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:26:21.3832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b02f555-c497-4d22-69e9-08de1b6b123e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
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
that allow collection of telemetry data.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c          | 56 ++++++++++++--
 drivers/accel/amdxdna/aie2_msg_priv.h         | 25 ++++++-
 drivers/accel/amdxdna/aie2_pci.c              | 73 +++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              |  3 +
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  6 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c       |  3 +-
 include/uapi/drm/amdxdna_accel.h              | 17 +++++
 7 files changed, 173 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 39214253d804..69cdce9ff208 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -47,7 +47,7 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 		ndev->mgmt_chann = NULL;
 	}
 
-	if (!ret && *hdl->data != AIE2_STATUS_SUCCESS) {
+	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
 		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
 			 msg->opcode, *hdl->data);
 		ret = -EINVAL;
@@ -336,11 +336,6 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 		goto fail;
 	}
 
-	if (resp.status != AIE2_STATUS_SUCCESS) {
-		XDNA_ERR(xdna, "Query NPU status failed, status 0x%x", resp.status);
-		ret = -EINVAL;
-		goto fail;
-	}
 	XDNA_DBG(xdna, "Query NPU status completed");
 
 	if (size < resp.size) {
@@ -362,6 +357,55 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
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
index 945140011763..947daa63f064 100644
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
@@ -137,6 +138,28 @@ struct destroy_ctx_resp {
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
index 396dc6e06007..d7ccbdaf47f5 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -862,6 +862,76 @@ static int aie2_query_resource_info(struct amdxdna_client *client,
 	return 0;
 }
 
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
@@ -896,6 +966,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_GET_POWER_MODE:
 		ret = aie2_get_power_mode(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_TELEMETRY:
+		ret = aie2_get_telemetry(client, args);
+		break;
 	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
 		ret = aie2_query_resource_info(client, args);
 		break;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index a79f4f71ff6b..9793cd1e0c55 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -305,6 +305,9 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
 int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
+int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
+			 char __user *buf, u32 size,
+			 struct amdxdna_drm_query_telemetry_header *header);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, void __iomem *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx,
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
index af943a603ad1..7590265d4485 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -30,9 +30,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.2: Support getting last error hardware error
  * 0.3: Support firmware debug buffer
  * 0.4: Support getting resource information
+ * 0.5: Support getting telemetry data
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		4
+#define AMDXDNA_DRIVER_MINOR		5
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 8b679c38d308..8ad254bc35a5 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -442,6 +442,7 @@ enum amdxdna_drm_get_param {
 	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
 	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
 	DRM_AMDXDNA_GET_POWER_MODE,
+	DRM_AMDXDNA_QUERY_TELEMETRY,
 	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
 };
 
@@ -461,6 +462,22 @@ struct amdxdna_drm_get_resource_info {
 	__u64 npu_task_curr;
 };
 
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
+};
+
 /**
  * struct amdxdna_drm_get_info - Get some information from the AIE hardware.
  * @param: Value in enum amdxdna_drm_get_param. Specifies the structure passed in the buffer.
-- 
2.34.1

