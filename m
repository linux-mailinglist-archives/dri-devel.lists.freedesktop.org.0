Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9948C9759EF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D26B10EA6E;
	Wed, 11 Sep 2024 18:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aDe2/rG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABD910EA6B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsaRxIyuArSN3kle6kyWB/VyJ0M8B/L+fBsfOY6XD4lKBWTRRPAX2zWR5lQxsVv33XzHiJ9qUFLPyuygPLPymMSaeBKSDRMOvX8+KBMIX5/Ac7gQ4ofeG4bkcQp38dTXNkQSGX95KwPOdJMeAQLVBduhSRha4z0c+MpHBaxH2yi51mI3sd6Z/A/um/DgUo+YzTHFfyKvvml2Bz6VeE0AN+OiMsZvHcsg7uxaHhtFXY+q5O13rwoVZ60KPRY9YIDWkuMTmXxZoZsLetnX3AVyUOY5HXDB63+CUXiR8zdFp8XgTB/K9mxGBLdDEZSYQ6sIV2qmtGSl7E4l/BLoOEbb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW0Y6L7OqfFcLyMUX8VF460PmVp7m9jg8Zltdt865WY=;
 b=O8gPWZBvr7T7TK8wzLpb8FwsPXhu68ZZYzZUeU9Jxnc9Pr44Q78M23ELSKPaxnw4ex+Pfd/EMDYMHvwSixtPGhds9shq/0TVU2nQ5YuGjjFyqk5ABWBIfiVXcsSnp3amuGzHl1S4mjGfTtEu10i/hzOFzWgD6/zTiuuQZPOBZM74wPmTfgjPUHpCmt+d+6XQ79oH8GJBYROjmJOtMAoVfZwnisKUUtW/sbeHsXm0sHx+60P5dWT6grH168OwOk9z8Moa1Zo0H+edJakWlSN9UOPHkbWx5lLDjViTdyeT9T6Aj1ZKiuyXKAOe9exnC4BJx1yAzDykzJbsktZLWyHgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XW0Y6L7OqfFcLyMUX8VF460PmVp7m9jg8Zltdt865WY=;
 b=aDe2/rG9UHJ7WEBP+FewTL9e5UfiuazYFJAwksPNPYLPupMpTIouL06Ts+wegwSs4A7FWEM395HfdGqo6/O9Dl1l+9zk6S3Fxi3hfW8SyetiwuyO6pIh5ByvdG9nbmhonRHOZddUco+zQKi2HqY3j91aAQgzPuA5FU1tYINdLqQ=
Received: from MW4PR03CA0106.namprd03.prod.outlook.com (2603:10b6:303:b7::21)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 18:06:34 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::33) by MW4PR03CA0106.outlook.office365.com
 (2603:10b6:303:b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 18:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 18:06:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:31 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 13:06:30 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V3 11/11] accel/amdxdna: Add firmware debug buffer support
Date: Wed, 11 Sep 2024 11:06:04 -0700
Message-ID: <20240911180604.1834434-12-lizhi.hou@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e860d4-14ef-4b5a-5db9-08dcd28c78aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pi8tXBYLHCnq8xWclp4lUBnE4XMWk+ZmsXbK3POFdsOTMTbAXJYsy2b1jbp8?=
 =?us-ascii?Q?ASNLt7Og0ieubS0Dgwo8b94nCofadVY6Eb85+Ewz1wg+GEmmQZ2b26YRCJxw?=
 =?us-ascii?Q?LwAPbyiL615mwL5YoKYCYvvViFZYe6v4duSoLGSXSTBzJRP0vjjghLf5mZBy?=
 =?us-ascii?Q?F8k6SwfbGW71FX7XOjdu9gSkI9Q/3CNHJHl+69HtM9wOApJximOq5eE+ky+y?=
 =?us-ascii?Q?vpQmZW18fl2ScoIDPWYjDeaqXxYi4oIbWzPdpPYcTJp/6LWU9zQF43iJc1hw?=
 =?us-ascii?Q?ppsysDSMHrOnikzWEFOqgWjjVALVn4MZTo6t8tcrDFG1L4ax9hDgkfbEEsX8?=
 =?us-ascii?Q?xLRx+p2bLieNAe8Ve165I7zSWZ8NMk0z1XkIpZwfNdrSNx9FoNr5rRmEnvnp?=
 =?us-ascii?Q?SCOP3RlYBLQBIdalZJT4bJDZMktThzFTZp0S0hIn3bMdau1FmP+7MXlEAqJc?=
 =?us-ascii?Q?4vaYp1KI/g5bs+hDd/lrslpc1GKAQ5xW/WAlQ0AoV3TLbgtBPLYfo2az2DXu?=
 =?us-ascii?Q?9VNx43G1FwVTPJPQu7ZzIxhwD0rcZyxjkLeUwdrnk+kas1P0vSz0pTsS/Lli?=
 =?us-ascii?Q?lcng5Gq699a2oalfTS+DRC64CiO5xlMqp5aHEKumUlKG0R5PrJiAtt5qlBIw?=
 =?us-ascii?Q?BX/y8nZmw1PrKRTS+VO9nC2ExnNXZKFczobaC90fSHJ77NkmphlQOPKMjDJF?=
 =?us-ascii?Q?av4qSGLIuUrcqds6L+Fq6dQfMC2m1iZh27fVLr3RagEIZriYt0tLseZ/6KuW?=
 =?us-ascii?Q?IpOfDPxeXW2ckcYqd91J5SK3gC9ggcsnPlHR2cXKqxDF8g1kfEhEubOG2KNX?=
 =?us-ascii?Q?gPLKM0/5SryTFauBaQBZX1LlhFy51dYFA208mBDU2TJr5tjL7rtqMHCp6q/r?=
 =?us-ascii?Q?QozbqjZAB0SYgzam38PFvS6yyTE93A2xP2Zdu22l7tJeDG3ddVX3HPmWAUXI?=
 =?us-ascii?Q?Hcc1P208EevdwWXQQLXpSBCm13qctEeuYQgaUZiWHuEJ/z9eo2E075hdfExR?=
 =?us-ascii?Q?FMReacynM9SYmTXcNQU6XjVJNxYzX1gm0GZxRXjxchPPxKWZnJ84HlWt1YYf?=
 =?us-ascii?Q?QLSrfxSDvIjQBrMty2ZhZb+I7xrKUZZ5zTICH5I/lNtbzX3DK/GbCazIybfs?=
 =?us-ascii?Q?9xdclNXCK58+uW9TnmiM8KdBIGssYfCJ8SG0j01GfvsiAlStKapI4Jt8tP8O?=
 =?us-ascii?Q?lgLkCZuCtrkfUNJQEMvLjANEx2jIRQKB6UC/Tv5GHbfxQmOE6toZ7gaExBOn?=
 =?us-ascii?Q?33hwOjcQpwaLMZ5QbaRlG5xtnhjCRDRARrSgCQL1ozDurZlcedjm1uOK92qt?=
 =?us-ascii?Q?fPygcKQiSFwDML16GhJE5PgwESzq2yKTWftL6QwimPqlc1rDo4FGv8D5E2BU?=
 =?us-ascii?Q?SsrX5MqxVMw92BRUGrRtHg6MExeDTqRszEHCKbbYvcoi4PkXzga/SNqB3HZE?=
 =?us-ascii?Q?FJai9689kGYWD5Ki4Cm6ChF5J9vPiO+s?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 18:06:33.8953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e860d4-14ef-4b5a-5db9-08dcd28c78aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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
index eba37d2dc933..6d35c67b9e47 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -719,6 +719,48 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
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
@@ -728,8 +770,9 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
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
index f242a92cb9aa..58b8dbbec7ce 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -194,6 +194,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	hwctx->num_tiles = args->num_tiles;
 	hwctx->mem_size = args->mem_size;
 	hwctx->max_opc = args->max_opc;
+	hwctx->log_buf_bo = args->log_buf_bo;
 	mutex_lock(&client->hwctx_lock);
 	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
 	if (ret < 0) {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index e035ebd54045..6349819cc959 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -76,6 +76,7 @@ struct amdxdna_hwctx {
 	u32				*col_list;
 	u32				start_col;
 	u32				num_col;
+	u32				log_buf_bo;
 #define HWCTX_STAT_INIT  0
 #define HWCTX_STAT_READY 1
 #define HWCTX_STAT_STOP  2
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 8d813edf371e..7df11c362a4d 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -593,10 +593,12 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
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
@@ -619,6 +621,28 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 
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
 
@@ -626,3 +650,60 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
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
index 8ccc0375dd9d..d7337191d5ea 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -58,6 +58,10 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo);
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

