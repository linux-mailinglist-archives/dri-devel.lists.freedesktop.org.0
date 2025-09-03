Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82759B41462
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 07:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EC510E86E;
	Wed,  3 Sep 2025 05:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="36MkesSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6236D10E86E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 05:34:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQnsARInf9S2n+1Jh9rO1AFWII/M42vgXjvE4+wnoHvOifffucnhRSrpkmBoaKubGfjQX0X6UCrWMe6uHsYbR2gX7UA2e7WYZx7ZVZHs42qAtGb3XzOODVJBxC/qIFP+Y9i7W5BY0C2/4A7se79EwLnlWwMkR4Ej8iwtiwm/DyF8WXK3/y1YlINKI8v7U12Bp0LTONtBt3ea78/rybz2d82egC5z5wL1ST8/ZT8wIpdkeaaA3kvZri9/LVMlpGJ5YPlKyl/hyVZxjpryjumV5ZrPtKIhhji/npkGc9z8RnRNG3LZYjLKf144g7AfCuT7uTZDHdDeoRFFc4pfjyAeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQdBqycsVUPcUR3DqQ7aomEqHZEE9okAuuK5nPa8ns8=;
 b=mGJEhbTq8v1MvqJj+PsPAlKKlfMFWsisn2j4hlMapPbnKFt5c/VLNLWor3BGjR+O+KhIAHrGL5d1k2qACj/S7N610llhteYVZColv/L7DP1hprOZC0g0cdtQzKYsQk8XWHk9JAv2kt2gErSHxQoiPf/wSaITz4i/1lR0Xrzad0ekQycYY3Fz8zV8fNeAVj7SMVVy5SXjPdAW5fL3gRcTHpc0Q2JY0xcBb5GiWW+6pjXq9GklV/aTpaqZRAFSYIHgIn2z/uJzIKh2Ky/gdmvAyA7qGrIw0fGuU3JbGS9Tnq3IanziXmFD1itqV1yuquW+KtEVxi6pFtKX9vOc27yclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQdBqycsVUPcUR3DqQ7aomEqHZEE9okAuuK5nPa8ns8=;
 b=36MkesSJxIp47VN39HmAZppqJqG++J/2YC2yLUZE2GsqZrq3YCuLWQSHGJKkYHQhvPPxOZ1rEdWOUkg/ZnAcsWfvWm01Ccf2xTOmhjmi59lDR4aixhl/IFUeJF9Oo20VibtVKzLKcYQ9X/8x7dOQqUdAv0Sa9WMynmsbxk/fEkg=
Received: from SA1P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::20)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 05:34:16 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::f1) by SA1P222CA0019.outlook.office365.com
 (2603:10b6:806:22c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Wed,
 3 Sep 2025 05:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 05:34:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 00:34:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 22:34:14 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Sep 2025 00:34:13 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <maciej.falkowski@linux.intel.com>, Mario Limonciello <superm1@kernel.org>
Subject: [PATCH V4] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Date: Tue, 2 Sep 2025 22:34:02 -0700
Message-ID: <20250903053402.2103196-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: a4136f07-d4b0-4859-f215-08ddeaab85fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HCwNiDZZf4HfxCjf9K5ciTz7Jzto//uuvTF+F5eXl1NZXIOj9LGAd5g6Pd6S?=
 =?us-ascii?Q?dCT249cLnEIMxhc3HfxvA2m9pewGllr4zcUgR7ejbJMD9MSQUqwOtUtsSE6G?=
 =?us-ascii?Q?ODRxiL6jbDkSRRtrmMknCTDXrFyllarhws8sZkqiqppjhz2dzE4Ulhp9JY3N?=
 =?us-ascii?Q?QoH1xAjlzQKNrS3B5ojBAIu/jNgH4Y7TMD52PP4b9AOA7L2WjbAF3UBXvDoQ?=
 =?us-ascii?Q?XWHUqJwlxHj4dYW081PUQY1Mggga9Ylz1u7Ta4w0+svYWG/4rD22d5nXKSb2?=
 =?us-ascii?Q?NGCgwHdzsIqodHUxTxZ1VwefeOIUI88VcH95WfJ+F55JrkW19sTGRkCtRl9+?=
 =?us-ascii?Q?avWUXcXo84qfy4S37XBXtjyUTz9eIJHFguoxrnw0rFZPLsacXFWgiM2E/hLv?=
 =?us-ascii?Q?wtBzYY/QgDdry/nX3ItxbyJxJQMC3Mp9VbXr34XprDSe7ggJgYdi9qAJ0VSV?=
 =?us-ascii?Q?Fo2Ehq3Fr1qSKzQoLWNmNJq/VckCZComokmpxLPFhkSW0IABnT7gdOzopNRg?=
 =?us-ascii?Q?vbQ7WTyI/29PVd5bZ4yXkLiqpNe+kO2YJnqos9bT1KBsIYIy9KB/OHgCyT4l?=
 =?us-ascii?Q?M1zGFkg8K9Y00jRaQA025g+pD+fjzogfk8kdw7M5wdU/zHjJTwd03xJGfTQt?=
 =?us-ascii?Q?D+nHUO37wTPNP7dU8jkG5DI+czIVl9v1/K6JOlKnNDYrQkrxuLdqvP/Mx48L?=
 =?us-ascii?Q?w1F6+cbIpRBMRJ2Y0C+iPbfA66e2nUCJvWWLJoBTxHCcWhWv1F8zVZ/O0TzK?=
 =?us-ascii?Q?h7V2FeSCj+BXghtuAOZR11/G3Vqt1Hl5tbwOL+wc121622+yPXlkS5h1ANTv?=
 =?us-ascii?Q?phIfDn6ZDaQY7LpImMGaikWI1E1P5c8/EVLRiaHTE612ctkjVHSB/Wob99S3?=
 =?us-ascii?Q?OyA/3M8Fzm1Iy6NQfN1h/oPpnDiw8LckL99jd6+rvuuG1RM9VRrxwNpSlPBj?=
 =?us-ascii?Q?DbFwaNyGXC8V39tz1V2xZR53SjFI54p5QFcKY7rdVDEcPagC6+e7mgQTa7KT?=
 =?us-ascii?Q?Ej5phcg4PrU59nR/2Lr+/dBJS4JQg5BLVkfD/R73JY4DBs1gULe88mqzf1a/?=
 =?us-ascii?Q?aCsdUSyNfGv6ijKplQZ4NPFJXtratAyvHwQF1QZpnnS8okpktrwDl2DFbM6Q?=
 =?us-ascii?Q?qsyofhPYWzOuD9FTjZU+RQ3H5+26jA1xbf4PbMtsblt35gr4UUWJo4UrAL9c?=
 =?us-ascii?Q?8VHJvXRYcKHtEv/LTiNgE1q0HYyE6sjgKJhkPOKH42Ah0GVUEb9eXDUxVFey?=
 =?us-ascii?Q?VsU3xNpMDRgbiiLjhJ50Rm5VPywoEmj2CvP/FkwM2GTTkph53kJXHYyx9H7E?=
 =?us-ascii?Q?lXb2ikA97fkuGIYj+W9CVQJlsTrrT6AwW6ChCcmQ55SjkbCmHTZmZI9bPctE?=
 =?us-ascii?Q?NId62XBxJJEHb3GdwIw+xMu2vjAisBkvV9X6KFB989WexiatwhyI8GKqcbUC?=
 =?us-ascii?Q?VzZJWDz4uVeX0YGHa4YwIFjyAwieXpKm6l5lEmfmR0aAP+U3Ujp6Xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:34:16.4166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4136f07-d4b0-4859-f215-08ddeaab85fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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
actual number of entries and entry size are returned. (see [1], used by
driver runtime library)

[1] https://github.com/amd/xdna-driver/blob/main/src/shim/host/platform_host.cpp#L337

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  27 ++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 include/uapi/drm/amdxdna_accel.h        | 111 +++++++++++++++++++++++
 4 files changed, 229 insertions(+), 26 deletions(-)

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
index 8ef5e4f27f5e..569cd703729d 100644
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
@@ -164,6 +171,23 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
 	return ret;
 }
 
+static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_get_array *args = data;
+
+	if (!xdna->dev_info->ops->get_array)
+		return -EOPNOTSUPP;
+
+	if (args->pad || !args->num_element || !args->element_size)
+		return -EINVAL;
+
+	guard(mutex)(&xdna->dev_lock);
+	return xdna->dev_info->ops->get_array(client, args);
+}
+
 static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
@@ -195,6 +219,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
 	/* AIE hardware */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
 };
 
@@ -218,6 +243,8 @@ const struct drm_driver amdxdna_drm_drv = {
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
index ce523e9ccc52..a1fb9785db77 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_EXEC_CMD,
 	DRM_AMDXDNA_GET_INFO,
 	DRM_AMDXDNA_SET_STATE,
+	DRM_AMDXDNA_GET_ARRAY = 10,
 };
 
 /**
@@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
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
+	/** @pad: Structure pad. */
+	__u32 pad;
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
@@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
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

