Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADF937BE6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9E10EC87;
	Fri, 19 Jul 2024 17:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SQ3VNrfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E2A10EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyhFW/XAxsWretousikam80XSizYAtKwlZiY5bnlWAWG3W5oPx38T+MQwapi7xnYGkXfeAEotxon25tXPiNFSB3358f830IFO82+WAmCoeLlE+1JgdVipoYdU0xM+TNk2g7Q0PzNnxbClC4evovmpJFBWFVGf/W6uhgyUnQpak0vyBRtPIDZ3NNi3BpNDwTqbBV58lk5xFQAQ58bjLrPvc/uU09WBpgh3K9ocSLBVkwMrLcNNnHEZdsIj/Jq//p7Y90iWy7BDrY1cDXxkmf8jyEFq9l0Gn4HWowwFlLe4zhXO0x6RFV4fJmKF6aqRtIrL9syXxPCpHO4RACBDgSbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/eoMf8+7xWDdqqK7qvxcabWDXwjjQtnl0zJKNLJ4p8=;
 b=V2F13s//f3w8PIo+16//b6QyytV7564cNB9cuV5XO8FwwsB9E/vCOX23nU7+HasxLBrFZZQNPHxsTbyNgaNHWB/1rMpq2B8o+pPigXkrlQPm2gczZpvDK6eYxcKE77qjcnG61oBjnr/9br6a/J6bvJeAJiBHBnris9FmwECklm4Rg1aG2TvbgJFXHwy/E3uJesAZzh3wENrJBFwRQkmRC8buzcdtyFrOZytm8GInK/gX2QgSJjus0YePxe2QjQ7YfJDSl+A9CUqCWkKCgW08RAkwiFXkxaq7NW6OyPeyOpVM5UcvWeU+0IjqYgZkI8dB3FlxthCNWbOcE+kUJ8Sjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/eoMf8+7xWDdqqK7qvxcabWDXwjjQtnl0zJKNLJ4p8=;
 b=SQ3VNrfmRIDkN4yat4HchFr4k7UFpBqQZQdMA/111ngHxj0DVt1Bz+a+WUVHD4661UkGDBKk9KEaDOrtNRzpP6CD+TrwmGv0uZv22ohQ9omdGcTCKnFNDN3Z9bMe26dSQo4KAxja7Vi192c+sXihAqEM133gu1ubbe8vg2ObUgo=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 17:51:30 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::ad) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Fri, 19 Jul 2024 17:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Fri, 19 Jul 2024 17:51:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 12:51:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 12:51:28 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 12:51:28 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>
Subject: [PATCH V1 10/10] accel/amdxdna: Add firmware debug buffer support
Date: Fri, 19 Jul 2024 10:51:28 -0700
Message-ID: <20240719175128.2257677-11-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719175128.2257677-1-lizhi.hou@amd.com>
References: <20240719175128.2257677-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e99ce86-3852-48b6-8e14-08dca81b6b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8cyUDV/+K4XVCIAvfOn5Ru8tSFnhsKnbTdCKEXELuttpRvuoJiSP0LzyWw4l?=
 =?us-ascii?Q?Td+eFSRR4DF6x18yWhllzpXf8D574NDhV2ZTkY46z0wXxeL1fSM8tTJfWk2+?=
 =?us-ascii?Q?fNtLjg0tNRTPpJOwK6C2rt58dhBuAyPgn+5U7n5TzbihC2qVvaiV1fhpath5?=
 =?us-ascii?Q?r0gsKbm6f72fNgfD363/YzgAl34GtjYgT24ZAJlEQZwKuP3h/qx/VtsUtHQ6?=
 =?us-ascii?Q?sKO7iRl4pDHLs1pRsnMIabGo+ZrJ25qKmoC28bix/TtfPKbeu9l7ajfgxfVf?=
 =?us-ascii?Q?3RJF3j0tEwP3Q/T9AEP9fxAcPAC50TQgVWGcGeQWkuAAdNZw5IaHNEgmyevx?=
 =?us-ascii?Q?PVWim0zc2ayrfF8TiK3v6A3ZpNP5Y8nrMtg+2MwyoyVjZBbMA224NQtcPapR?=
 =?us-ascii?Q?koNtTHg3glYul0Ph1X1sxuudKAxxAS9V2u6AcXoCxQGj6R/TuhY+hnvhwa7W?=
 =?us-ascii?Q?DHXCKLb2GqrNSJEShI9DAMxFWWga7s78/1LPkGiLD0YeI8OaDxVljKYkcf8e?=
 =?us-ascii?Q?PMy1ll8bk246ObF4W8ecBbY2gLgc+5EgLLbabwhnDTZoFzXdsXqe9gdueHtX?=
 =?us-ascii?Q?cP+O75QVGFzG8zXGXTFWcwBTuMPl8hbh8MqHaFN9s0xeRWgdoBDvPcDxBLiV?=
 =?us-ascii?Q?n+d76rPdnXCTK8GB5L68V9jx2ygUTnmj99l/V0j3dQ7XAZYacrx5P2TDmMyi?=
 =?us-ascii?Q?vHAaGG+muVMCvl+i2B3tCXckNS4lDPJRiQb7LF+aTU7a+5OAtJsxGMUx/GF7?=
 =?us-ascii?Q?4m0s1FCAkgRa6vdX4DsRumZaAlXaBdgN2KE8VfmgeHlU2GWj6xDGlsuuSO7t?=
 =?us-ascii?Q?5ypV5GBKk3NQkHfyGB0YLjytVUWA/UXbdZP78VrYdbMW/XtvxomMKJD5FjJv?=
 =?us-ascii?Q?0qflvpWgnQxAkR8TmbkORE070CoX/WxxOBb/Uj/uBbM6cV1MYbPHfgz8Q4vJ?=
 =?us-ascii?Q?99rhxbYJ6R75yER0/37FR+o8VrDvXIDCWU2zWz3JKbB6rkXpudeIdB7+AnKe?=
 =?us-ascii?Q?2GptlArCHm9dYG1sGCYFXHJGDdJMvuRipPolQmNjZmWv6cu3D742s4KAbavp?=
 =?us-ascii?Q?iR5NKsEEyV6K/xmghEQ6wkEwuPLlOIASdumzFCuvBeriklNYeymeRTB8iIth?=
 =?us-ascii?Q?dTyYOsBe4JUwciJ+3M7lhNqDM8fmkI6EeVpX8oq2zZksKqDDnIwV/9iCxStJ?=
 =?us-ascii?Q?67NiZSxiT3EkEUsFLZjC//8n3aAljoBOjArJiILCP68i1f3T7ZDQOkNakowM?=
 =?us-ascii?Q?xWbDjKYGpn5425XXrr0+ygPKUpuSpI3W5OQDwj8ueaxoP/Ku+YDyAJIY3fXN?=
 =?us-ascii?Q?bETGZdRwRwVUSEfQoNL/SnE3Nz0rqWhtWbnxvDqw7aKFeaVjCui+FWrZGPFQ?=
 =?us-ascii?Q?WF8sVaSIFMzj6pobxuPrZsySYoj2rbnnjCAw2qDxz8BUytVCtC6tS1KQydYq?=
 =?us-ascii?Q?ZAUPpPyBKmgqX5HqVdTgLD55cQvrNifE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:51:29.9506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e99ce86-3852-48b6-8e14-08dca81b6b82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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

User application may allocate a debug buffer and attach it to an NPU
context through the driver. Then the NPU firmware prints its debug
information to this buffer for debugging.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 45 +++++++++++++++-
 drivers/accel/amdxdna/amdxdna_ctx.c |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
 drivers/accel/amdxdna/amdxdna_gem.c | 81 +++++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h |  4 ++
 5 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index a392cc2b9237..310a9b63024f 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -708,6 +708,48 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	return ret;
 }
 
+static int aie2_hwctx_attach_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl)
+{
+	struct amdxdna_client *client = hwctx->client;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_gem_obj *abo;
+	int ret;
+
+	abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_DEV);
+	if (!abo) {
+		XDNA_ERR(xdna, "Get bo %d failed", bo_hdl);
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	ret = amdxdna_gem_set_assigned_hwctx(client, bo_hdl, hwctx->id);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to attach debug BO %d to %s: %d", bo_hdl, hwctx->name, ret);
+		goto put_obj;
+	}
+	XDNA_DBG(xdna, "Attached debug BO %d to %s", bo_hdl, hwctx->name);
+
+put_obj:
+	amdxdna_gem_put_obj(abo);
+err_out:
+	return ret;
+}
+
+static int aie2_hwctx_detach_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl)
+{
+	struct amdxdna_client *client = hwctx->client;
+	struct amdxdna_dev *xdna = client->xdna;
+
+	if (amdxdna_gem_get_assigned_hwctx(client, bo_hdl) != hwctx->id) {
+		XDNA_ERR(xdna, "Debug BO %d isn't attached to %s", bo_hdl, hwctx->name);
+		return -EINVAL;
+	}
+
+	amdxdna_gem_clear_assigned_hwctx(client, bo_hdl);
+	XDNA_DBG(xdna, "Detached debug BO %d from %s", bo_hdl, hwctx->name);
+	return 0;
+}
+
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -717,8 +759,9 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 	case DRM_AMDXDNA_HWCTX_CONFIG_CU:
 		return aie2_hwctx_cu_config(hwctx, buf, size);
 	case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
+		return aie2_hwctx_attach_debug_bo(hwctx, (u32)value);
 	case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
-		return -EOPNOTSUPP;
+		return aie2_hwctx_detach_debug_bo(hwctx, (u32)value);
 	default:
 		XDNA_DBG(xdna, "Not supported type %d", type);
 		return -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index bafca7f0415f..174bad2efc33 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -143,6 +143,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	hwctx->num_tiles = args->num_tiles;
 	hwctx->mem_size = args->mem_size;
 	hwctx->max_opc = args->max_opc;
+	hwctx->log_buf_bo = args->log_buf_bo;
 	mutex_lock(&client->hwctx_lock);
 	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
 	if (ret < 0) {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 1a42964a2f87..895450d9923c 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -80,6 +80,7 @@ struct amdxdna_hwctx {
 	u32				*col_list;
 	u32				start_col;
 	u32				num_col;
+	u32				log_buf_bo;
 #define HWCTX_STAT_INIT  0
 #define HWCTX_STAT_READY 1
 #define HWCTX_STAT_STOP  2
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 77224adbc77f..a12e885f0628 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -584,10 +584,12 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
 int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 			      void *data, struct drm_file *filp)
 {
+	struct amdxdna_client *client = filp->driver_priv;
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_drm_sync_bo *args = data;
 	struct amdxdna_gem_obj *abo;
 	struct drm_gem_object *gobj;
+	u32 hwctx_hdl;
 	int ret;
 
 	gobj = drm_gem_object_lookup(filp, args->handle);
@@ -610,6 +612,28 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 
 	amdxdna_gem_unpin(abo);
 
+	if (abo->assigned_hwctx != AMDXDNA_INVALID_CTX_HANDLE &&
+	    args->direction == SYNC_DIRECT_FROM_DEVICE) {
+		u64 seq;
+
+		hwctx_hdl = amdxdna_gem_get_assigned_hwctx(client, args->handle);
+		if (hwctx_hdl == AMDXDNA_INVALID_CTX_HANDLE ||
+		    args->direction != SYNC_DIRECT_FROM_DEVICE) {
+			XDNA_ERR(xdna, "Sync failed, dir %d", args->direction);
+			ret = -EINVAL;
+			goto put_obj;
+		}
+
+		ret = amdxdna_cmd_submit(client, AMDXDNA_INVALID_BO_HANDLE,
+					 &args->handle, 1, hwctx_hdl, &seq);
+		if (ret) {
+			XDNA_ERR(xdna, "Submit command failed");
+			goto put_obj;
+		}
+
+		ret = amdxdna_cmd_wait(client, hwctx_hdl, seq, 3000 /* ms */);
+	}
+
 	XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
 		 args->handle, args->offset, args->size);
 
@@ -617,3 +641,60 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 	drm_gem_object_put(gobj);
 	return ret;
 }
+
+u32 amdxdna_gem_get_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl)
+{
+	struct amdxdna_gem_obj *abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_INVALID);
+	u32 ctxid;
+
+	if (!abo) {
+		XDNA_DBG(client->xdna, "Get bo %d failed", bo_hdl);
+		return AMDXDNA_INVALID_CTX_HANDLE;
+	}
+
+	mutex_lock(&abo->lock);
+	ctxid = abo->assigned_hwctx;
+	if (!idr_find(&client->hwctx_idr, ctxid))
+		ctxid = AMDXDNA_INVALID_CTX_HANDLE;
+	mutex_unlock(&abo->lock);
+
+	amdxdna_gem_put_obj(abo);
+	return ctxid;
+}
+
+int amdxdna_gem_set_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl, u32 ctxid)
+{
+	struct amdxdna_gem_obj *abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_INVALID);
+	int ret = 0;
+
+	if (!abo) {
+		XDNA_DBG(client->xdna, "Get bo %d failed", bo_hdl);
+		return -EINVAL;
+	}
+
+	mutex_lock(&abo->lock);
+	if (!idr_find(&client->hwctx_idr, abo->assigned_hwctx))
+		abo->assigned_hwctx = ctxid;
+	else if (ctxid != abo->assigned_hwctx)
+		ret = -EBUSY;
+	mutex_unlock(&abo->lock);
+
+	amdxdna_gem_put_obj(abo);
+	return ret;
+}
+
+void amdxdna_gem_clear_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl)
+{
+	struct amdxdna_gem_obj *abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_INVALID);
+
+	if (!abo) {
+		XDNA_DBG(client->xdna, "Get bo %d failed", bo_hdl);
+		return;
+	}
+
+	mutex_lock(&abo->lock);
+	abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
+	mutex_unlock(&abo->lock);
+
+	amdxdna_gem_put_obj(abo);
+}
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index fe5d1142c904..a1ec1415e74b 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -62,6 +62,10 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo);
 int amdxdna_gem_pin(struct amdxdna_gem_obj *abo);
 void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo);
 
+u32 amdxdna_gem_get_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl);
+int amdxdna_gem_set_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl, u32 ctx_hdl);
+void amdxdna_gem_clear_assigned_hwctx(struct amdxdna_client *client, u32 bo_hdl);
+
 int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
 int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
 int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
-- 
2.34.1

