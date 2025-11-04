Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C569DC2F70A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 07:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DEB10E247;
	Tue,  4 Nov 2025 06:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1B52cc0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010042.outbound.protection.outlook.com
 [40.93.198.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA1210E247
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIc9EnZeBdIA1VsUZM/E6IWBu8AVPUXsTXf/1Er/zaEVKxnmy6wBOglQ7rePol+LO0P0Iit0tNiSAWyw15IhWvHwPv486fngFvb1FcsayuYWs9xt6ynWKCSOvWqBpbXjsOzYyQYttlxFuG8LaMBcIieWoYwmWp/obminnRB98//Qd604pcO17fsSbLG3DQlD3ecbEosmPaTYmgpxjhhmoWOikWsi3XSzxUInHQs2/DVqNrvg7gihPbmK8ffkGFFNVm5FpOcN5Ie0b4nky1HpyW2zDQjMRFlpnLLldipKaVkc+Lnbw7uEHFaAUzxq247RrDHLDRruAr9yfecB+6QcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOYf8rTjORptt3gkW/Jo96aljD4iBVdUE5uTKQsUkz4=;
 b=EqP8zhDffUjfSqeD+vOMGo+1CRL8QiXZirhaB95JMgRN5w1pt4LzI7vPYIRfHA0SNCN/2vg77zNNTF+QR95AxvszC9G5FI67MZVD5JiwX+oJF0DZSIY5JkFfbQcuYQRGbaN8Z8o5uymghoRirSxxMi2WKiWoL1RA/2zme/b5q+i2v1vekndqolDs6ThkACDwSRqbxVR/gMkMWCLO5AxhKX/51PKc/poth/EW41auaUVdMQ93SjpqwHlKnst0matedPkmPe8p00oO85e+4DXZkuyy37rIemF48WlijQLh26oZgWjRhPDGiNFsl0oewzKeHoJpNOoKB+Edu4emxaf0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOYf8rTjORptt3gkW/Jo96aljD4iBVdUE5uTKQsUkz4=;
 b=1B52cc0nfCheKaTcTRPXF37tt/Yi0lHAmzjEJry1uyIB+UNwPaDYz8Tf3GpD2mj43YB/CvN1kQrXOLKGqSsTEVK6Wvxfkt9uCBIz44DvxpJIk47maPRgrc/8l0CGhEsXo3EggaRmbkryARgBVUGa4vri/Iunv+VdGgBp+VtQhQ8=
Received: from BY5PR20CA0007.namprd20.prod.outlook.com (2603:10b6:a03:1f4::20)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 06:26:12 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::4c) by BY5PR20CA0007.outlook.office365.com
 (2603:10b6:a03:1f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 06:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 06:26:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 22:26:11 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 00:26:10 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 22:26:10 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH 2/3] accel/amdxdna: Add IOCTL parameter for resource data
Date: Mon, 3 Nov 2025 22:25:44 -0800
Message-ID: <20251104062546.833771-2-lizhi.hou@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 02299ff4-1479-49ee-fa0f-08de1b6b0cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/I9weh7f46mzqnysiNd7HklXuijxnzDIy+jB0HB4Ob616IwwRDIFrMA1fBGj?=
 =?us-ascii?Q?te2BpB3JV1+4sAphOCsntqXViq+FCPJtCsnVWvDWK8UmeeFg8q1HpXmTEU/Z?=
 =?us-ascii?Q?CdeIJrv8s/NRLjzknuDahpsTlyH4FynvCH2Bae5WBHpsfuszSgZQn4gIRPIB?=
 =?us-ascii?Q?Pd4uc/9D9Ky9BzaegRxGFQtEP+mrkhMRHopg1Wsl7/8GIH1LVMUeBYe7TBRe?=
 =?us-ascii?Q?3SYx/eYPSQSfPLqhE+UhALncF46rQaPK2QAQac6sKtsHOKN4MeIrObThsJN6?=
 =?us-ascii?Q?E29rlIX16EYZxQQGoBxTgWSfoWxXXht1FNgpHT2SZNacnGZzcwuK3SAEOtTK?=
 =?us-ascii?Q?cT+N5EglEYR6f5QfUUQILG0cCwAXfuWbN5nSAw9n37SL7rMmEs1zmFnY4gRS?=
 =?us-ascii?Q?IN1ICOKfNQoPVXXV2tdh2+DtzRXDLxjDRdkpkbQfVcaufODQrP0FVVgUVR3A?=
 =?us-ascii?Q?xe90BVM6NFPTHIP9gnV04ySbmoamgdmsCCgFDqqLk2UggEpYVbQi97aM2MdI?=
 =?us-ascii?Q?HsT5d7WZVucw9XqSFew4Rnixnk7yRaCCiXQidpMIHzDx+whNskBnBcihqF1p?=
 =?us-ascii?Q?byjNk0J4y3UQk4OuxEC/V2Qbt0XeV1hIMPNSVlMphzlgWewVsUfjCXPiIOV4?=
 =?us-ascii?Q?PaZeiUA7lTaXBub+YtZy6P8nT1bMcHh9j+NJzxM9ZbWogRPaXSKCoLKUnFRl?=
 =?us-ascii?Q?jojWKzR/BAGz+3OVnMZByEExbKjoBBBoCTVhgjrbW2nSquJkExjVA/XzQkRz?=
 =?us-ascii?Q?Rn6aZ2EBsHBJkzK+YinVfQtrezIOGiChAec1FdLe7TlizW0GL4aI3N0jJCTr?=
 =?us-ascii?Q?zyeIp7lbv3zZgSaZsYsu9G+ssVz/dBtd6CZ7lcCHXqejJsAETZKPSx9wEmgb?=
 =?us-ascii?Q?kWhTFztJPk+T8zXbOL/UN/Efnok5KGdYLjEUqTvVJU6d7F8+8pvJ4tNoN8O2?=
 =?us-ascii?Q?BZwRqfPk5f9DkYN7NqlyeO5agLwIEsAwSAkdRv7MGgTSrcTw1hT7Uf+I9YFQ?=
 =?us-ascii?Q?+LyXcJlnRgMEPwQbsEikn198TiSaNSVTC+9hJ8aa4U4b7V7aKeDyZOEP4UMD?=
 =?us-ascii?Q?yVzwCNA23bWe0gDU6h5/aBvSuGEXaf+CurzZLg2nYRyh3d5QNYUAGXyrWG/i?=
 =?us-ascii?Q?FvNpj91T0W6Nkl+HSaAF908qfDqaHua6m+aXY9DhNza7kOxLBKghlu1db71j?=
 =?us-ascii?Q?N7dY/LCPTwI7EsTHssta0OLga4VqfReBAjobgszDGRTwX7vhQpFm1jhZh+E2?=
 =?us-ascii?Q?kDOHb1KsEnD3F7RQgV3bH5xRm44vOk+sJzHCM1TRI+K6+aP/BexS/uMKRvb2?=
 =?us-ascii?Q?PnRDAqHgVwSECmO64voVfpRtGc/yjPiN7dcuRxOGz/TEuuLiz/siXy0qbMLs?=
 =?us-ascii?Q?ToA/kFLDEfCXV5TkNYVZ3g6rg0QG2bPXtQJnkDCPPeJVZxurSnt8Woy2zXZL?=
 =?us-ascii?Q?gSCk80ch04dLEqqQGiXQLoOYp2ppfMdL0GTPVgOZXOMndzpeRUOzGOXluDXu?=
 =?us-ascii?Q?q2Cm3ltPNZmelhqi3KRcGr0cV/d80YvJxwADXIuru5Zix6OnmXlt6AdAJfzm?=
 =?us-ascii?Q?VBa2cdPFeJQSUJfd/eI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:26:12.4658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02299ff4-1479-49ee-fa0f-08de1b6b0cf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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
that allow collection of resource data.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        |  6 ------
 drivers/accel/amdxdna/aie2_message.c    |  2 ++
 drivers/accel/amdxdna/aie2_pci.c        | 27 +++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
 include/uapi/drm/amdxdna_accel.h        | 17 ++++++++++++++++
 5 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 289a2aaf4cae..b78c47ed0d34 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -556,7 +556,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct drm_gpu_scheduler *sched;
 	struct amdxdna_hwctx_priv *priv;
 	struct amdxdna_gem_obj *heap;
-	struct amdxdna_dev_hdl *ndev;
 	int i, ret;
 
 	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
@@ -654,8 +653,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	amdxdna_pm_suspend_put(xdna);
 
 	hwctx->status = HWCTX_STAT_INIT;
-	ndev = xdna->dev_handle;
-	ndev->hwctx_num++;
 	init_waitqueue_head(&priv->job_free_wq);
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
@@ -688,13 +685,10 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 
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
index 339dec998247..39214253d804 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -235,6 +235,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 		ret = -EINVAL;
 		goto out_destroy_context;
 	}
+	ndev->hwctx_num++;
 
 	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
 		 hwctx->name, ret, resp.msix_id);
@@ -269,6 +270,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 		 hwctx->fw_ctx_id);
 	hwctx->priv->mbox_chann = NULL;
 	hwctx->fw_ctx_id = -1;
+	ndev->hwctx_num--;
 
 	return ret;
 }
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index ce57b915004e..396dc6e06007 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -838,6 +838,30 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
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
 static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
 {
 	struct amdxdna_dev *xdna = client->xdna;
@@ -872,6 +896,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_GET_POWER_MODE:
 		ret = aie2_get_power_mode(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
+		ret = aie2_query_resource_info(client, args);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 3599e713bfcb..af943a603ad1 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -29,9 +29,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
  * 0.2: Support getting last error hardware error
  * 0.3: Support firmware debug buffer
+ * 0.4: Support getting resource information
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		3
+#define AMDXDNA_DRIVER_MINOR		4
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index c7eec9ceb2ae..8b679c38d308 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -442,6 +442,23 @@ enum amdxdna_drm_get_param {
 	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
 	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
 	DRM_AMDXDNA_GET_POWER_MODE,
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
 };
 
 /**
-- 
2.34.1

