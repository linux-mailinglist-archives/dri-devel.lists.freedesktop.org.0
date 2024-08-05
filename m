Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98F948090
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9757510E26C;
	Mon,  5 Aug 2024 17:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lNDiuJH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F325410E270
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amgMCWGR4eHBBPc3iZljexDqZlIFakpp2ZuhtkCDFXYehFTyxvCaEHHj0yDPwIjM15RMxmRDqkuknCahFlRKpJ3T9alKRDJ8Lf0MIjEY7hWXBhclF5jZtXEa+wyvgdHkEw3o1m5y8F1TRlipha163kQRznA8bJwDBdb2zzucuistVR5Sm2gUCwZ+eNbJ8QrEQoqXuM2CyaHbbnDtNoH3ILNpeurpcXT3/Pq9p+vIHxTaYENOXTPb2JCLf2oZ0Mlm3kaHwXEWQ4LVNbCNSxkXXnE5xlmlufli82KDJxB0OWpGxmQP+z0UQz/S14Vs7zsSpRb9BQRfJ8WgypgpsyFJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR1uEnBYlT/w0b8oMZ5ObvDnyTDfqHkxfU/M0Ny5fig=;
 b=Ml7f9F14sGYiqYCROaMnl1+1lqQTxUwMpyX7YAzzXfzmsk8u0T+P6BdMjCyIKt+wqPosHsSPet1juS6KcYb5S8ME5Y3lB6PYfxNw/jOiWqSEXZoVALSWFtK97/Ibr0b7fzO033MPM2b4iB86gSzkUPe/WIgYXLL0o6jSlrvfosv3wThiIbyvhg6Q9xmREv2ft5U8WQ0huvI3/X2v5k9ozGr2QQTA2mTZChdvXicgnJT0kXylGNML92g9J2wAX6eFnP8sI2wJIWVDCjRt5cd9q4an4GejFoTO3DhWYV3vQboruj64U4Tw6L61sUoddEAgJauioQysB+nfGFg0eKidRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR1uEnBYlT/w0b8oMZ5ObvDnyTDfqHkxfU/M0Ny5fig=;
 b=lNDiuJH0YhKiKpn2gshNeeDK/0ynUbo5Q2TTUMOqUHlEqnpCKS9aOvUoucyYyYmyTZMON8tmNcXy1EhQipnENKVlabdqzLO4kJu9Uc9E60N4KdSERsRMFXKfQNXTVYpquzvwDvIIGzUDwNEwLJMXnVMCkPoMBh4X6j/IViF4aIs=
Received: from CH2PR15CA0003.namprd15.prod.outlook.com (2603:10b6:610:51::13)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 5 Aug
 2024 17:40:32 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::9a) by CH2PR15CA0003.outlook.office365.com
 (2603:10b6:610:51::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 17:40:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 17:40:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 12:40:30 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 12:40:30 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V2 10/10] accel/amdxdna: Add firmware debug buffer support
Date: Mon, 5 Aug 2024 10:39:59 -0700
Message-ID: <20240805173959.3181199-11-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805173959.3181199-1-lizhi.hou@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 13725130-48f8-41db-ee0a-08dcb575b482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8tK5ctsVHF7RGgZ2p0GTSdUsz3VNLOIgRrR5AjCgg60XM81E8ZLZmiUHHyTF?=
 =?us-ascii?Q?yN7fiKAOZVqdT3WZuuP8atZ6Ybq5XwZKpf718j49cVn/ECL36poTEaVYPDHl?=
 =?us-ascii?Q?vl6Jpx2WHvsZexuxLV8Har08VEKq2DfKATPQ3ve301AEbHeE1bFJMvhT4rvV?=
 =?us-ascii?Q?kZidZc6Mu9f7ocFB0Z5IXRkFZSvlptybs7C9bHOSGPR1vhGQ5+0KOEN4hfLF?=
 =?us-ascii?Q?VPAryX80iwb1TvExpf6Pj4+HiDZTXCoqOamEiDRUNXDyv8NcyrQcpY8vWJSP?=
 =?us-ascii?Q?Jq5SmB1hcf9lztocuRUdH83sdvhYjjP/8y+mf9EuBSSop4UB0pSEBmLqRyiH?=
 =?us-ascii?Q?+a+XTuuEFO/cpR/in2lFkO+qjpohviVlxGv8xeV0BqPSxvnSEjxpapXPHmBP?=
 =?us-ascii?Q?xf5ycVJ2gfj2i8llzp8J4QVoKR65+WIiYSZukS6NfgVUynUaSII+gg4L0k4B?=
 =?us-ascii?Q?rMmKvtku+f8grfJ8kRFrGY7UwuyVW9yxUZQ8TCzn+6zygOzn37dAkxU/YVgD?=
 =?us-ascii?Q?HfxL8yGgTg5QULjLBLXy4OswXI9mHNNxkgw+fJWFyByz+XDjxe97O7zuTYAq?=
 =?us-ascii?Q?Jnw+OfHNPZdUNv/p1kGEXkFvfbzan7w1szzWNt8+x2N9+0RW14+gl6UrPZc9?=
 =?us-ascii?Q?YfZB+YVhYHaCDDGvYbMfCS82uqXUXfeKuZK8sFtQKJQ3xkYjkIYyUpzGWDhB?=
 =?us-ascii?Q?4Iy5C2CbJusKSq37ccsaANd1spX30LUpABiLSG3EUgAIZiUTzUZRllNo6v3P?=
 =?us-ascii?Q?Da/36teiinbr/FlNdVWAKg39fSlX4zxhZxcK89dcO3o/UcdtpHW9SA47GTJd?=
 =?us-ascii?Q?EQ4eKyZkQYzwKrxSLzhSF3JSUUi+wGAIIaZg+0/WJ+F+MsDNinVv00MZyOei?=
 =?us-ascii?Q?ZXvKEX6XXZmtWE/ugGBQoyFFoJmCtJKPrPaGm6Af13e5/fh2GiCNbERJAyQ5?=
 =?us-ascii?Q?mI9IZcfZ7U+BI8OBa50OkiUSKefA3qumNk/PtPu9hNXlLCDaZIH4p19N+bLN?=
 =?us-ascii?Q?+YU89tMGjDk51qVRZe82idX1dNBsE+i1+6E0PEQaO+5RHco6acymlqP5lbKf?=
 =?us-ascii?Q?9A90/qMOqF+nVg0Kj6I+tUHKFz3ny4JpaYttHs+feL4tOglg4XOYh1iwkUK/?=
 =?us-ascii?Q?h/FExKhN1seRbymIh0TAc6SCAXg0Ww5yM1nF/MrGbWzRZ4T1peAeJUDZsl6P?=
 =?us-ascii?Q?N4wcRrKXA3TJMtQD0eIdGG8V1Istvs+b58CHVgwM4L9sp3UsOLc/Zq8EN2X7?=
 =?us-ascii?Q?UKZZltMqrHDTaNKiChj5rsD4mETLu5I+DMG0NgR4E4jkFKcqWJ5GIDYJcz/D?=
 =?us-ascii?Q?Rv+58xjWwp7+SoJKDtJ8RP27ISsRWW4W6IsxrBRRYZgDuw38H5N34lkl0xuH?=
 =?us-ascii?Q?Lulzj7ZsynHmDwSqHgXNnjT0CDwqe6LK34gCe57CldNxR7lqJo3Rlg2K7aO9?=
 =?us-ascii?Q?7g9vfvIWDSNnljscB4k06hEzQyVxH7lg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:40:32.3110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13725130-48f8-41db-ee0a-08dcb575b482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
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
index 1dbb89d28004..b1e3690b240c 100644
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
index 35f84f8884a7..5e4fbb5692b2 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -183,6 +183,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	hwctx->num_tiles = args->num_tiles;
 	hwctx->mem_size = args->mem_size;
 	hwctx->max_opc = args->max_opc;
+	hwctx->log_buf_bo = args->log_buf_bo;
 	mutex_lock(&client->hwctx_lock);
 	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
 	if (ret < 0) {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index e8aa2ed9f392..f88ba8666331 100644
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
index a63be07428fc..09d03b6e032e 100644
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

