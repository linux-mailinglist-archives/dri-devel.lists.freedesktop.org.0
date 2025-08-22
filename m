Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D47B32178
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 19:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7101B10E178;
	Fri, 22 Aug 2025 17:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JlDIG0HU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F260710E178
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 17:23:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upnnvniToB99Rhx6h9vDIG9t2aaT3ptMijTs32uJHc1iaGmDonhX/yRCXUHpza9qJNSRUwnkyPwXmPO3B29Bt9a98HGghGy1TW4dtRQzVCGbhUf31WAtT7nQVc+dU3lNY5rBb0OCneB1T65IJ7UF1UOUm8QPHi09CifWkCTamrISFps1x4mm4D2BPzsW6Y/2r3SkhkvsNlACcdjIBWllLhtiqUe2WON2ViHu5YIKQUJF0TrR8EXL5YdYcjknGlcd8+rih2/4u8puPRrhSfEhsE2a2Rq0E4RbeCld+m+KYOlyPyJegQXhtBll0K5di5Uh0znVBaZwETSRDehSccYfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKGdTtkLxEubpOPViEWJWMsmtmEuSuSF/iTy1+RZmIc=;
 b=JN6kgHN3z6rFhy/uv5EuWoPJsk8uR6YRCOCDE5ZLF3wN0DYFEkvRTNOkrq3gETfW2BRJGAlFUmtotp1gqJ3XfE6zhdvLrDVzi7EIlVSh0xGGS+7qs9XfGVzai3sPb4qhVmdrCXrefaKfTuYVkosC5jb9QqNy/rqaTGceu3Gho2u25fcV6MD9vP+ys8HJSpS5LDmgMFaUS9iyMCzL60gLg69S/VlMonfukeAFS6U9JtgqsEk+7XKsKXtXBvX8DsLWiBBPnbvC7GKbUpz1v2WinIq614v289bPVHx6xoQMljhjUYRL/Rcq7J1Cu42Hsopj0WIKVu4fBLgUmpCSr3jLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKGdTtkLxEubpOPViEWJWMsmtmEuSuSF/iTy1+RZmIc=;
 b=JlDIG0HUAjIkk+Pdt3u10ivRuhaZAJz/kvQe8hVCG1HbyQuyqI8aTiIvJevMFDRMlRAz1zNLdC5E/nAGmQeJDRuhSD1zcgtfJUftudzpAPKX0986/7ehw2HDol2dq47DsFJfksUcdnzUqp+dk4j6WcRnkXdgS9GEa/ZgMDdWzyQ=
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 17:23:26 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::e6) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 17:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 17:23:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 12:23:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 22 Aug
 2025 10:23:21 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 12:23:20 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Date: Fri, 22 Aug 2025 10:23:19 -0700
Message-ID: <20250822172319.377848-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f8a6ad-19f9-441a-cee3-08dde1a09adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/7ScMeO4rDjmDHA0+nO4P9kbj3/6G/bwWO3vweMB8PcQtTue+DH/WdFgFoqb?=
 =?us-ascii?Q?lJ1PXEhmwdk3S9gS+qd+izBRYCwFBAoOMMa/p99iJ7z4b2R9IPSz6/8JgeiG?=
 =?us-ascii?Q?RFesrcdTCKlaOjzEhjTatAqezfayk6m9dKXnf/OvEeRFyTpG8Eo+SiDqzUlO?=
 =?us-ascii?Q?b6pdawz7zW9Nxgk/QHOZgi60shlam8lf9Fei8eSgpAO5qZ0ldOGSZ7JTE5Wk?=
 =?us-ascii?Q?awCGpeQL5l6KfLuMp5K4Yt35DrYWOGAha0H878OgqPoCKDDItKA5Hhkdjh4n?=
 =?us-ascii?Q?1Boozi9pFMXlhL5TDmYA2VtH7pldQ8QVldCPUShaye5wQAyylOjf/Q0sc1uT?=
 =?us-ascii?Q?OY1AQH8uw/ZQFn/Ki0WHsPOxC4MZacDlUOehzzV3UEvqQ7dvSGfM5voNxWd+?=
 =?us-ascii?Q?TSatr/l4N2G+Qx5+YerxoluxUUXTWNOWU4YC/1qHWYLn0W0fiC7qLqJk0cCb?=
 =?us-ascii?Q?wzWxF4fPriDk2apJG+PdohJd25IjfgK8F6+rrFtLMpmZ+IDsMVAOS5K7WT1w?=
 =?us-ascii?Q?Ox9RaKZObEeAlfeSLrwt4k0b4iF94MKHtXuZdhk1tW8sSJPtlztsAJn6M9/b?=
 =?us-ascii?Q?EOYxBfWZ8Eb2Lc4q+jKyXrNecw64PllNE9xLhBiqdJj7CYBf3iTrt0fAXYjR?=
 =?us-ascii?Q?1sA6FcpOYTMKPfavOzXzY5mk8aYRaMHiaFFeMT4DbhscQBHdTVvlXfn7Iu9G?=
 =?us-ascii?Q?LLM1oyvUFBWbdJK581yAqt97iy42Qz414iPDdhRORonmYKCuzb52R81rTr2Y?=
 =?us-ascii?Q?9GQL1LjrCL6lypnAlqnc5qpoie6JMa3jk4HFjmGGo9tA+gwqGIP4Mm1mW3jt?=
 =?us-ascii?Q?oZaZpT2mPulIfRR5sCGIyW6p+m3EQBOfmxRArIp0GyqYKRu/+CglN2TuN1IM?=
 =?us-ascii?Q?5IlL3SZedxIyTkW0HHis73ESbJXkATpSp7/cDN8LDlwt1ZMKvS8CCHNBO0iw?=
 =?us-ascii?Q?SX6B+GXSw1LWhU2QkqTm70KYiuH0CPCQeeFvDrwexboH7yTtzViNaQmOXAjx?=
 =?us-ascii?Q?Pr1DlZGdDW9rBWhw0lKlP17pG+ja8QGejIh02SZlYNU6R9FANcuSBsIP+dHK?=
 =?us-ascii?Q?PGlJhMXQct3fxXx6qBfUImLK3AwoXAg1meM7zzpQyfEIrgXXVNjBvfd8ygHI?=
 =?us-ascii?Q?GQc8SKbDozT1Q93/3hHD7wl2buriR3/HsI6pxKCP/qq3CLYS5VW36Vj6428D?=
 =?us-ascii?Q?J2dTHaxbsX73gwYctJatCBzliuSNy20zSajT+Gq5Py/wP4O1NVWHCKNUs3B7?=
 =?us-ascii?Q?5B8wOT0VuUgUJGQuUR4oCPbS7OioNpCC1w4lKuvmksggQlh9/SQa1jfonzxC?=
 =?us-ascii?Q?tr9OwKW+AM+0F0bZQgv0kn7pawZmwcJibshQwkc03WKGQlr1pHFFBFRQr9MR?=
 =?us-ascii?Q?2ugVAHE9FIhLY6ngR3lbbxppQOkeEozf/grcK3xeAsXhYOAehKIi7w0cn4yq?=
 =?us-ascii?Q?FruAuAe8Smo/r+MePOiwH5CPCTNUT8h4K8fve6eC7T59aEPbXssk032QsECv?=
 =?us-ascii?Q?TJUYUBIcrxbx29YZTqoVbT0/Or+k87yLv/Cj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 17:23:26.4242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f8a6ad-19f9-441a-cee3-08dde1a09adb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
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
 drivers/accel/amdxdna/aie2_pci.c        | 114 ++++++++++++++++++------
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  21 +++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
 4 files changed, 220 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 16ac0cab4f44..b8bfc0700798 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -785,10 +785,11 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
-	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
-	struct amdxdna_drm_get_info *get_info_args = arg;
+	struct amdxdna_drm_hwctx_entry __user *buf, *tmp __free(kfree) = NULL;
+	struct amdxdna_drm_get_array *array_args = arg;
+	u32 size;
 
-	if (get_info_args->buffer_size < sizeof(*tmp))
+	if (!array_args->num_element)
 		return -EINVAL;
 
 	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
@@ -801,14 +802,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
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
@@ -816,23 +826,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
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
 
@@ -876,6 +887,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
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
@@ -925,15 +988,16 @@ static int aie2_set_state(struct amdxdna_client *client,
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
index 8ef5e4f27f5e..ee89485299bc 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -164,6 +164,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
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
@@ -195,6 +215,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
 	/* AIE hardware */
 	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
 };
 
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
index ce523e9ccc52..e19e4cd04ffa 100644
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

