Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEAB38AF5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE710E8B6;
	Wed, 27 Aug 2025 20:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N9crcNCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B08810E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8N2NUOwYJzs5+MReM9RBvLCKhx8mzyFwqm29eScUqaQgf3p5RqJOSIJHPpc+j1dxsDG/o6FVyJadkQ5I69GzjZEklF/acpV9e6WgsLP8O06SbpjiEqT6MLX0NTWNkOuOWQTBO8PnmrC9GlNPTFhC9WW12SObozzW6T3mmjM5QzWjXLOYaGhmEfydSjHLX15N7wcWFHibOYdEfg5Hk/+VDcvmU4OmKIN+ZGNd2zefrldE9lzqMiKTpXQ1/g6PaDAYCnfQlNAkD1nLOH95fjIMjQy6rg59r6VN0nEok4H/UfO2xtCGk5wROCTyChT3QLIAukCEX36mMFiPm5Dq8zILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/gNIKR/wXE4PIqlqzQuaC7K8KrCdmFXH+cnCR2mRrI=;
 b=aVU019MznTrI8qMsjW2B7DcWA0jPvfs8joQvFIV0tGaVBgdZ0P2FNd0ScdFzFruMA6bLtD3pAiI73rfxcgsxPCv8LMffBRX2CkNm/ru1PRf9iWBqxZ/QCEugNJLp95g31IBv+xitsoMD6U2FkGsd/1/euijo9g6heNv9Gr3ZDg1Ky2WaTu7uNr1F557tyBU3vlx336BgShOoeTrFk97cgGjraYoHchkVCnJP2WdSac0RDtc2l0M2f11hwqxeK9/SdAqJROU8+o8KhrEpSdOCYP6RsXgdc2m4faS4muRwd8enfHug7VYx6M2mFzOgi+APB69oNxfw9v4303uCc0+7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/gNIKR/wXE4PIqlqzQuaC7K8KrCdmFXH+cnCR2mRrI=;
 b=N9crcNCETFKxYL3n2N94qQ4HjsRsXtDz3KljBRTwxcufIpAHB1rQG5Cm8W2MTOmfCn/GFrFxfR0wH/IJJJbgOo2sDZK4SzkKNizkCa2h8d7KQ9PV9ROcOCe8/QWyeSA65HGjgG0ET5siNpdYg4QZ3Y8rE8J7NjmIYYuW/TPhRCM=
Received: from DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Wed, 27 Aug 2025 20:30:34 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::fc) by DS7P222CA0017.outlook.office365.com
 (2603:10b6:8:2e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Wed,
 27 Aug 2025 20:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 20:30:33 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 15:30:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 13:30:33 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 15:30:32 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Date: Wed, 27 Aug 2025 13:30:31 -0700
Message-ID: <20250827203031.1512508-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: 49047e1f-d589-4e13-7018-08dde5a892ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7zxeRLUTv09AzXzYGaaxflzUJV1tyGQoRfGAKntcM37Sf9HoE4+XWvWnVlkO?=
 =?us-ascii?Q?/f8znNFbp6yEGCIapQhuZ1AQY79MscYZGYCsOJ8cxh7Yk075PKtPP15h3ZOS?=
 =?us-ascii?Q?uv9tDlELhN6sG9C0fMczhwekZELjEyJ4U7cLyE4NAaUX6HBu64KhnESO7XQ+?=
 =?us-ascii?Q?pz+qYrC3Pia8FWFmfejkJXCODyHEdxYPVUTZd9xofg/ShAK/WsLOLCoei8/K?=
 =?us-ascii?Q?qShsNxe94hfPBLgCdnmZxfFPM5A5XpG4tt7aDWBc3IkpUQtAffL2mQj5gYtM?=
 =?us-ascii?Q?7HA67VywT8WIzg/kru9cBFT0eG98YFeam4gPOz8k7ACWSkpMFnFMCc6KDLSN?=
 =?us-ascii?Q?UME1jwTraB9AbQx/fITpQLr8k+B9JNignMHVjdQs9IxYVjkR4OqCEizH8DE3?=
 =?us-ascii?Q?befLv3WAjClkOZKlCKoC7wN1T26oqCenIPTaq+vVspmNXdBRrWqerQvF8DuE?=
 =?us-ascii?Q?cCQKnK6Sy6HoiRxZnZIrTh1d6CPxM/VoYDGYYBD9MgJvCD1T5wLx9FixKhLH?=
 =?us-ascii?Q?dZRHtnCQ9UX4gv/Io4XLDKvO6SazZiKR9ENt44d5q+PSRqUeKo/j4m9gpI1m?=
 =?us-ascii?Q?Js/m1NblBlNWGcEHJHBaCqqI6ZVh0OSeS/y2h6+IKJMWFh4Y10NUiEBBZBNA?=
 =?us-ascii?Q?PzI769EN8xAwYOVh+nnIXBdlfOHondM0RkCikYDOoKeq4d/DCtf3BNYLmWJg?=
 =?us-ascii?Q?HyFXhmHJTWHrGBApfstadMc5ikP7+nJyOkHUu3GOta03e3SiP3NdYw03wHLE?=
 =?us-ascii?Q?XnbF4g4G5b5gcPfrIhEXfCiYeJavRltS5ZK8uS/wiRTsQ0lWJvHi1GqDCY7y?=
 =?us-ascii?Q?0jkqu4T7H7ojFYlUYJMAJhMl11pBDr10B5Pbjihi0amkTdorD2ZSch5d0XVV?=
 =?us-ascii?Q?hwNPL5cUJ8SUt+WuHUGmkh3Y6f77PW6sgZN+oW5OlWva3lGTjeDVSK7f9Ynk?=
 =?us-ascii?Q?v4IQZNDbzRDV2V8SIHOsyVifInbCG9h2w571zV09d8j+6OljNFkjb8f+6pXX?=
 =?us-ascii?Q?vgWQR6sFD/ZWPDnFUVVorJ2dDvA6RHnZxgPJdrKfg5tJQ+AxL/iZ9hBq5VcS?=
 =?us-ascii?Q?jHdAVCrAv5yS9ckLCEHvot74crGAt1hnLpH+zfdjsPc9S3iRJG2KjHalC7mU?=
 =?us-ascii?Q?X0prQ4oLfPxlb1ZRG9hucbEbcf2+WGSzMnaeFNwwpDuL6PkZsUiwGP+vbya9?=
 =?us-ascii?Q?/dR2YAJ9KbpZezJuTUSFHQjpfMzFTFGIRTST/882wJD1BS/DBPYifsQftngC?=
 =?us-ascii?Q?nWgfAwVcNYCSxraJl48lx96kHvONgFqVhw+M2qHJvp/rPdBvangblzxy+a9z?=
 =?us-ascii?Q?LcbuiOIlloovZApfypNvE3w79hxb6BZXGItBqyLQ8c3vRhLVTz+Hftd551bU?=
 =?us-ascii?Q?fg3vqQryvjatCiNyxxzLtxT12LSoNIsc6rz7xfn4+GUOLkgKJPjsyCOKgkqE?=
 =?us-ascii?Q?M6Su2vbIGhF1S0MEolAIQBizpprX/BgjhIofTYAccoZbJSyA6S5YYjzZqE70?=
 =?us-ascii?Q?dJwz/djm5MaXO7Oh0dpFUTF44ksWXspBO8/l?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:30:33.8088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49047e1f-d589-4e13-7018-08dde5a892ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090
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

Add interface for applications to get information array. The application
provides a buffer pointer along with information type, maximum number of
entries and maximum size of each entry. The buffer may also contain match
conditions based on the information type. After the ioctl completes, the
actual number of entries and entry size are returned.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
 4 files changed, 230 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 7a3449541107..87c425e3d2b9 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
-	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
-	struct amdxdna_drm_get_info *get_info_args = arg;
-	struct amdxdna_drm_query_hwctx __user *buf;
+	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
+	struct amdxdna_drm_get_array *array_args = arg;
+	struct amdxdna_drm_hwctx_entry __user *buf;
+	u32 size;
 
-	if (get_info_args->buffer_size < sizeof(*tmp))
+	if (!array_args->num_element)
 		return -EINVAL;
 
 	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
@@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 	tmp->num_col = hwctx->num_col;
 	tmp->command_submissions = hwctx->priv->seq;
 	tmp->command_completions = hwctx->priv->completed;
-
-	buf = u64_to_user_ptr(get_info_args->buffer);
-
-	if (copy_to_user(buf, tmp, sizeof(*tmp)))
+	tmp->pasid = hwctx->client->pasid;
+	tmp->priority = hwctx->qos.priority;
+	tmp->gops = hwctx->qos.gops;
+	tmp->fps = hwctx->qos.fps;
+	tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
+	tmp->latency = hwctx->qos.latency;
+	tmp->frame_exec_time = hwctx->qos.frame_exec_time;
+	tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
+
+	buf = u64_to_user_ptr(array_args->buffer);
+	size = min(sizeof(*tmp), array_args->element_size);
+
+	if (copy_to_user(buf, tmp, size))
 		return -EFAULT;
 
-	get_info_args->buffer += sizeof(*tmp);
-	get_info_args->buffer_size -= sizeof(*tmp);
+	array_args->buffer += size;
+	array_args->num_element--;
 
 	return 0;
 }
@@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 static int aie2_get_hwctx_status(struct amdxdna_client *client,
 				 struct amdxdna_drm_get_info *args)
 {
+	struct amdxdna_drm_get_array array_args;
 	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_drm_get_info info_args;
 	struct amdxdna_client *tmp_client;
 	int ret;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 
-	info_args.buffer = args->buffer;
-	info_args.buffer_size = args->buffer_size;
-
+	array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
+	array_args.buffer = args->buffer;
+	array_args.num_element = args->buffer_size / array_args.element_size;
 	list_for_each_entry(tmp_client, &xdna->client_list, node) {
-		ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
+		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
+					 aie2_hwctx_status_cb);
 		if (ret)
 			break;
 	}
 
-	args->buffer_size = (u32)(info_args.buffer - args->buffer);
+	args->buffer_size -= (u32)(array_args.buffer - args->buffer);
 	return ret;
 }
 
@@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	return ret;
 }
 
+static int aie2_query_ctx_status_array(struct amdxdna_client *client,
+				       struct amdxdna_drm_get_array *args)
+{
+	struct amdxdna_drm_get_array array_args;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_client *tmp_client;
+	int ret;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+
+	array_args.element_size = min(args->element_size,
+				      sizeof(struct amdxdna_drm_hwctx_entry));
+	array_args.buffer = args->buffer;
+	array_args.num_element = args->num_element * args->element_size /
+				array_args.element_size;
+	list_for_each_entry(tmp_client, &xdna->client_list, node) {
+		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
+					 aie2_hwctx_status_cb);
+		if (ret)
+			break;
+	}
+
+	args->element_size = array_args.element_size;
+	args->num_element = (u32)((array_args.buffer - args->buffer) /
+				  args->element_size);
+
+	return ret;
+}
+
+static int aie2_get_array(struct amdxdna_client *client,
+			  struct amdxdna_drm_get_array *args)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	int ret, idx;
+
+	if (!drm_dev_enter(&xdna->ddev, &idx))
+		return -ENODEV;
+
+	switch (args->param) {
+	case DRM_AMDXDNA_HW_CONTEXT_ALL:
+		ret = aie2_query_ctx_status_array(client, args);
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
 static int aie2_set_power_mode(struct amdxdna_client *client,
 			       struct amdxdna_drm_set_state *args)
 {
@@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client *client,
 }
 
 const struct amdxdna_dev_ops aie2_ops = {
-	.init           = aie2_init,
-	.fini           = aie2_fini,
-	.resume         = aie2_hw_resume,
-	.suspend        = aie2_hw_suspend,
-	.get_aie_info   = aie2_get_info,
-	.set_aie_state	= aie2_set_state,
-	.hwctx_init     = aie2_hwctx_init,
-	.hwctx_fini     = aie2_hwctx_fini,
-	.hwctx_config   = aie2_hwctx_config,
-	.cmd_submit     = aie2_cmd_submit,
+	.init = aie2_init,
+	.fini = aie2_fini,
+	.resume = aie2_hw_resume,
+	.suspend = aie2_hw_suspend,
+	.get_aie_info = aie2_get_info,
+	.set_aie_state = aie2_set_state,
+	.hwctx_init = aie2_hwctx_init,
+	.hwctx_fini = aie2_hwctx_fini,
+	.hwctx_config = aie2_hwctx_config,
+	.cmd_submit = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
+	.get_array = aie2_get_array,
 };
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 8ef5e4f27f5e..cb574ad7bfc3 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
 
+/*
+ * 0.0: Initial version
+ * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
+ */
+#define AMDXDNA_DRIVER_MAJOR		0
+#define AMDXDNA_DRIVER_MINOR		1
+
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
  * (device_id, rev_id) pair as a key to select the devices. The devices with
@@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
 	return ret;
 }
 
+static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_get_array *args = data;
+	int ret;
+
+	if (!xdna->dev_info->ops->get_array)
+		return -EOPNOTSUPP;
+
+	if (args->pad || !args->num_element)
+		return -EINVAL;
+
+	mutex_lock(&xdna->dev_lock);
+	ret = xdna->dev_info->ops->get_array(client, args);
+	mutex_unlock(&xdna->dev_lock);
+	return ret;
+}
+
 static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
@@ -195,6 +222,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
 	/* AIE hardware */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
 };
 
@@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv = {
 	.fops = &amdxdna_fops,
 	.name = "amdxdna_accel_driver",
 	.desc = "AMD XDNA DRM implementation",
+	.major = AMDXDNA_DRIVER_MAJOR,
+	.minor = AMDXDNA_DRIVER_MINOR,
 	.open = amdxdna_drm_open,
 	.postclose = amdxdna_drm_close,
 	.ioctls = amdxdna_drm_ioctls,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index b6b3b424d1d5..72d6696d49da 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
+	int (*get_array)(struct amdxdna_client *client, struct amdxdna_drm_get_array *args);
 };
 
 /*
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index ce523e9ccc52..2e363880c1eb 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_EXEC_CMD,
 	DRM_AMDXDNA_GET_INFO,
 	DRM_AMDXDNA_SET_STATE,
+	DRM_AMDXDNA_GET_ARRAY = 10,
 };
 
 /**
@@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
 	__u64 buffer; /* in/out */
 };
 
+#define AMDXDNA_HWCTX_STATE_IDLE	0
+#define AMDXDNA_HWCTX_STATE_ACTIVE	1
+
+/**
+ * struct amdxdna_drm_hwctx_entry - The hardware context array entry
+ */
+struct amdxdna_drm_hwctx_entry {
+	/** @context_id: Context ID. */
+	__u32 context_id;
+	/** @start_col: Start AIE array column assigned to context. */
+	__u32 start_col;
+	/** @num_col: Number of AIE array columns assigned to context. */
+	__u32 num_col;
+	/** @hwctx_id: The real hardware context id. */
+	__u32 hwctx_id;
+	/** @pid: ID of process which created this context. */
+	__s64 pid;
+	/** @command_submissions: Number of commands submitted. */
+	__u64 command_submissions;
+	/** @command_completions: Number of commands completed. */
+	__u64 command_completions;
+	/** @migrations: Number of times been migrated. */
+	__u64 migrations;
+	/** @preemptions: Number of times been preempted. */
+	__u64 preemptions;
+	/** @errors: Number of errors happened. */
+	__u64 errors;
+	/** @priority: Context priority. */
+	__u64 priority;
+	/** @heap_usage: Usage of device heap buffer. */
+	__u64 heap_usage;
+	/** @suspensions: Number of times been suspended. */
+	__u64 suspensions;
+	/**
+	 * @state: Context state.
+	 * %AMDXDNA_HWCTX_STATE_IDLE
+	 * %AMDXDNA_HWCTX_STATE_ACTIVE
+	 */
+	__u32 state;
+	/** @pasid: PASID been bound. */
+	__u32 pasid;
+	/** @gops: Giga operations per second. */
+	__u32 gops;
+	/** @fps: Frames per second. */
+	__u32 fps;
+	/** @dma_bandwidth: DMA bandwidth. */
+	__u32 dma_bandwidth;
+	/** @latency: Frame response latency. */
+	__u32 latency;
+	/** @frame_exec_time: Frame execution time. */
+	__u32 frame_exec_time;
+	/** @txn_op_idx: Index of last control code executed. */
+	__u32 txn_op_idx;
+	/** @ctx_pc: Program counter. */
+	__u32 ctx_pc;
+	/** @fatal_error_type: Fatal error type if context crashes. */
+	__u32 fatal_error_type;
+	/** @fatal_error_exception_type: Firmware exception type. */
+	__u32 fatal_error_exception_type;
+	/** @fatal_error_exception_pc: Firmware exception program counter. */
+	__u32 fatal_error_exception_pc;
+	/** @fatal_error_app_module: Exception module name. */
+	__u32 fatal_error_app_module;
+};
+
+#define DRM_AMDXDNA_HW_CONTEXT_ALL	0
+
+/**
+ * struct amdxdna_drm_get_array - Get information array.
+ */
+struct amdxdna_drm_get_array {
+	/**
+	 * @param:
+	 *
+	 * Supported params:
+	 *
+	 * %DRM_AMDXDNA_HW_CONTEXT_ALL:
+	 * Returns all created hardware contexts.
+	 */
+	__u32 param;
+	/**
+	 * @element_size:
+	 *
+	 * Specifies maximum element size and returns the actual element size.
+	 */
+	__u32 element_size;
+	/**
+	 * @num_element:
+	 *
+	 * Specifies maximum number of elements and returns the actual number
+	 * of elements.
+	 */
+	__u32 num_element; /* in/out */
+	/** @pad: MBZ */
+	__u32 pad;
+	/**
+	 * @buffer:
+	 *
+	 * Specifies the match conditions and returns the matched information
+	 * array.
+	 */
+	__u64 buffer;
+};
+
 enum amdxdna_drm_set_param {
 	DRM_AMDXDNA_SET_POWER_MODE,
 	DRM_AMDXDNA_WRITE_AIE_MEM,
@@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
 		 struct amdxdna_drm_set_state)
 
+#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
+		 struct amdxdna_drm_get_array)
+
 #if defined(__cplusplus)
 } /* extern c end */
 #endif
-- 
2.34.1

