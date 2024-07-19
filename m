Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5D937BDD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DA610E04E;
	Fri, 19 Jul 2024 17:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N2caDhS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3410E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU6aKV6uuVOpuRb3+z2t1R7uTfYoZfFcg7Vyf2oMu+Eb+F6vOzpSUYWSs5ejhx5MqOSFz/a/rbUrRIMjlHqcFGBmSlIHvZ9rMbD49dcNoCzqry639YmskYthNs3Zrn/rvUIbZT17rm9b3zeHN26EJ0cageNXa1CXiKUd/uvKJ11cPTQpZm1IU8cQnLoFfs05BNjtF3wK8t/IycoiIRwu+sZMRaXr/dZTj4BL9uPQ8Vt4VphMeZqKce1k4Q3LNUfFyffGYRcOISw/s+U7vLsLlizy7RcVlFdEFpDAfVQtO7+QAe4dO0EJnt+K4w2oEonCIh0r8P9HB8ft2Ql1FnKouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In+rOzk+LjfJ4vmLtQUu3ZOT4H/Sm75eDaxfsmoT9co=;
 b=o1l7FlhYzW8Qvc6hs9+8k/ZREyJKvQzbjQUUXejpc6fCdwJTedkuIVfdhH6QJiTjhV1W82AtLGcHGslGmkhhx1YCr18bybv1Z9B8wMzsjhnqdOY3WlPTlmkFPIktwbszxYMS8/Z3TCHQEz8QWKitOExodUMW6pv195V5xhrokbaJzL40mLqSGJsbpSZAjlvKxZUJZZI6UdPScbvPWwrVqT7hsFSvh5pnpx9Bm/5nyEIJ30096hLBOI90LQKwOFn1AaSUTWNumFWM8Ev6N8zXLTccA0ox/KX9avuXBjkNJnYL70KLmDlkzH33xepytleJJq5iuFVcikKIF/FGVy1c7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In+rOzk+LjfJ4vmLtQUu3ZOT4H/Sm75eDaxfsmoT9co=;
 b=N2caDhS47bm6NT4Im97nA86rATo3kxb8dO8rwEEIeNXw204uXWdanskv0rW8l2nP0rfMcBKKelgchCwdFxTtIoBOGViCBSJPQVQixqSovPHR1MSzfNRbsTCVFzKPYTk3sDO8sxJdZ5b9f/TcXZXOlCj0n0Mx6WeCaBJhfagSe+0=
Received: from PH8PR05CA0010.namprd05.prod.outlook.com (2603:10b6:510:2cc::15)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 17:51:26 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6c) by PH8PR05CA0010.outlook.office365.com
 (2603:10b6:510:2cc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 17:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 17:51:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 12:51:25 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 12:51:24 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>
Subject: [PATCH V1 05/10] accel/amdxdna: Add GEM buffer object management
Date: Fri, 19 Jul 2024 10:51:23 -0700
Message-ID: <20240719175128.2257677-6-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719175128.2257677-1-lizhi.hou@amd.com>
References: <20240719175128.2257677-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d52a0c-bfd3-4c68-674f-08dca81b6907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zfw721b51zUtIjSUjJRVYpwGCkH/doYhhcBn0//0KdbCkqY0YX6kM/EHHtT8?=
 =?us-ascii?Q?U2dGRx8ZFdkAmITJnAXRY3bTmTYKVEGxdB8kVcuVYYWN1KlIqW6oAYd855q6?=
 =?us-ascii?Q?1lmryqV0YoyWP3Qf0XNuOWjgjFuHOm3UtWB7OsPWBrQVCR0ZukE9MdEQhAXe?=
 =?us-ascii?Q?0q5eWzz2C6yN0m3VgaaZg9WHU+Piy5wYqLcJNMMljBe8cmHkceONIgLu8Elg?=
 =?us-ascii?Q?ZtrntY5DZM6QAo9Wgb/t52oEi65BOAOzFeIkDLb24kxxTPfyRM7ZyBDA1+8l?=
 =?us-ascii?Q?h/P7oaHNt+xQcUKPtKOMcOBxRO5eKm9iC199rKmaCbUK6/onLdt4WZ3XWrHn?=
 =?us-ascii?Q?Fb2bXgKdJ91FGjUqIHvrefYJ6PXzz8Pixp8HhsDBgs3lk7xYIFVUs1ouG5Qt?=
 =?us-ascii?Q?LYbzl7LyRxH6uMhzj30hEq255p7I9SNtOYJsnrZupdM7aIkl95g+LAocfhKI?=
 =?us-ascii?Q?knN7QGNwi/io0IK0Q48m5udMi0OXfEidcyJfAAGSAVBiBJokINrQgo8Maz8X?=
 =?us-ascii?Q?us2DQdQ97U7uMnvDfO/q1Ok/wEKL4FfUXQLRjcokZqEdBExDUo3743XQ1zRX?=
 =?us-ascii?Q?929XKJhxH3s6zdSlUuY/rXT0K9tqLjd3LZCPPKV3e27TIcoSSAsGndSuH/6v?=
 =?us-ascii?Q?z+mNz1YGP8GXncLIkEptqc7x9XnBCMM9iPDbGEUc/lsJOPAs0/CZNgQpSMf3?=
 =?us-ascii?Q?hMP/nGbhW3+9WeTYEkTtIrmW7oHEH1caygU+wPOJrrAJyGT0+Bk0UvlAAi9Y?=
 =?us-ascii?Q?sa2gKt4TPGgPAgDQ+M8/fi9HMKOB+05rmL/G15LNZH30rNsMEoT5xdM0TAfB?=
 =?us-ascii?Q?V6kmTJbGLyH5hqJMm1b1cutz/Nayg/TC3qhWStrf3ezbObL01IwKGOm02pjA?=
 =?us-ascii?Q?Kci2uD60lSWyp8rhB4LPDtK8OGirodHNY2ddPY9cCil9bALHklREih6SrCr2?=
 =?us-ascii?Q?YD7lXyX2Aai++v/EtysJWSQocign9YJoZ2bUXX95S79QNayobSTgYfcMW3d5?=
 =?us-ascii?Q?1ogNbub++TjCIOI8pBXHC75BitJrEF9VCQL/S5qT0f3ZIybD7lwu9nzHbmBp?=
 =?us-ascii?Q?IyzV5wKD7yi+y3cO1EjEMhLXBnySOoCZubUSoi6RHds9whiJS39jHeSU/nw/?=
 =?us-ascii?Q?BkjCyD3kOgUegRLobxXNToZVRVIZQsDcjYPGtj2U3fjoUcQoPnPQstfEOiO1?=
 =?us-ascii?Q?4AbTefIEcPnsw+VSWa1ftEQeukUcgQVqQmmnD3F8nQLC4SVl2pN8pPY6FT9W?=
 =?us-ascii?Q?EuIEYyVpcZ4U89hYEd7ejhZwgbTNTkxlZPia/v9NC0cdHNenJ3Kat62hiAgx?=
 =?us-ascii?Q?yzz4Czf2jL4oCb494EaKj0W6O913GOFzLPOj//Z7KwSWhM5O6ARVJowtJPIN?=
 =?us-ascii?Q?AlJZFmubluePuFZhVFavDD4S2WL2AzvOHPCAixBzsfQJlXdupSRBRNQiTTJT?=
 =?us-ascii?Q?9G7Qh+Gz9Qk5+AGXvHej6c+FUDqpE78k?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:51:25.8662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d52a0c-bfd3-4c68-674f-08dca81b6907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
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

There different types of BOs are supported:

- shmem
A user application uses shmem BOs as input/output for its workload running
on NPU.

- device memory heap
The fixed size buffer dedicated to the device.

- device buffer
The buffer object allocated from device memory heap.

- command buffer
The buffer object created for delivering commands. The command buffer
object is small and pinned on creation.

New IOCTLs are added: CREATE_BO, GET_BO_INFO, SYNC_BO. SYNC_BO is used
to explicitly flush CPU cache for BO memory.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile       |   1 +
 drivers/accel/amdxdna/aie2_ctx.c     |  82 +++-
 drivers/accel/amdxdna/aie2_message.c |  76 ++++
 drivers/accel/amdxdna/aie2_pci.h     |   3 +
 drivers/accel/amdxdna/amdxdna_ctx.h  |  10 +
 drivers/accel/amdxdna/amdxdna_drm.c  |  10 +
 drivers/accel/amdxdna/amdxdna_drm.h  |   9 +
 drivers/accel/amdxdna/amdxdna_gem.c  | 619 +++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h  |  69 +++
 include/uapi/drm/amdxdna_accel.h     |  77 ++++
 10 files changed, 955 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 9cf90e92564d..7040e23d0ec6 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -9,6 +9,7 @@ amdxdna-y := \
 	aie2_solver.o \
 	amdxdna_ctx.o \
 	amdxdna_drm.o \
+	amdxdna_gem.o \
 	amdxdna_mailbox.o \
 	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 8843bc210cb2..435af66b2dd5 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -120,6 +120,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_client *client = hwctx->client;
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx_priv *priv;
+	struct amdxdna_gem_obj *heap;
 	int ret;
 
 	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
@@ -127,10 +128,28 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		return -ENOMEM;
 	hwctx->priv = priv;
 
+	mutex_lock(&client->mm_lock);
+	heap = client->dev_heap;
+	if (!heap) {
+		XDNA_ERR(xdna, "The client dev heap object not exist");
+		mutex_unlock(&client->mm_lock);
+		ret = -ENOENT;
+		goto free_priv;
+	}
+	drm_gem_object_get(to_gobj(heap));
+	mutex_unlock(&client->mm_lock);
+	priv->heap = heap;
+
+	ret = amdxdna_gem_pin(heap);
+	if (ret) {
+		XDNA_ERR(xdna, "Dev heap pin failed, ret %d", ret);
+		goto put_heap;
+	}
+
 	ret = aie2_hwctx_col_list(hwctx);
 	if (ret) {
 		XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
-		goto free_priv;
+		goto unpin;
 	}
 
 	ret = aie2_alloc_resource(hwctx);
@@ -139,14 +158,26 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		goto free_col_list;
 	}
 
+	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
+				heap->mem.userptr, heap->mem.size);
+	if (ret) {
+		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
+		goto release_resource;
+	}
 	hwctx->status = HWCTX_STAT_INIT;
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
 
 	return 0;
 
+release_resource:
+	aie2_release_resource(hwctx);
 free_col_list:
 	kfree(hwctx->col_list);
+unpin:
+	amdxdna_gem_unpin(heap);
+put_heap:
+	drm_gem_object_put(to_gobj(heap));
 free_priv:
 	kfree(priv);
 	return ret;
@@ -159,11 +190,59 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	xdna = hwctx->client->xdna;
 	aie2_release_resource(hwctx);
 
+	amdxdna_gem_unpin(hwctx->priv->heap);
+	drm_gem_object_put(to_gobj(hwctx->priv->heap));
+
 	kfree(hwctx->col_list);
 	kfree(hwctx->priv);
 	kfree(hwctx->cus);
 }
 
+static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size)
+{
+	struct amdxdna_hwctx_param_config_cu *config = buf;
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	u32 total_size;
+	int ret;
+
+	XDNA_DBG(xdna, "Config %d CU to %s", config->num_cus, hwctx->name);
+	if (hwctx->status != HWCTX_STAT_INIT) {
+		XDNA_ERR(xdna, "Not support re-config CU");
+		return -EINVAL;
+	}
+
+	if (!config->num_cus) {
+		XDNA_ERR(xdna, "Number of CU is zero");
+		return -EINVAL;
+	}
+
+	total_size = struct_size(config, cu_configs, config->num_cus);
+	if (total_size > size) {
+		XDNA_ERR(xdna, "CU config larger than size");
+		return -EINVAL;
+	}
+
+	hwctx->cus = kmemdup(config, total_size, GFP_KERNEL);
+	if (!hwctx->cus)
+		return -ENOMEM;
+
+	ret = aie2_config_cu(hwctx);
+	if (ret) {
+		XDNA_ERR(xdna, "Configu CU to firmware failed, ret %d", ret);
+		goto free_cus;
+	}
+
+	wmb(); /* To avoid locking in command submit when check status */
+	hwctx->status = HWCTX_STAT_READY;
+
+	return 0;
+
+free_cus:
+	kfree(hwctx->cus);
+	hwctx->cus = NULL;
+	return ret;
+}
+
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -171,6 +250,7 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	switch (type) {
 	case DRM_AMDXDNA_HWCTX_CONFIG_CU:
+		return aie2_hwctx_cu_config(hwctx, buf, size);
 	case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
 	case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
 		return -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 54fb0f68587a..c99c8df937cc 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -272,3 +272,79 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 
 	return ret;
 }
+
+int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size)
+{
+	DECLARE_AIE2_MSG(map_host_buffer, MSG_OP_MAP_HOST_BUFFER);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	int ret;
+
+	req.context_id = context_id;
+	req.buf_addr = addr;
+	req.buf_size = size;
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret)
+		return ret;
+
+	XDNA_DBG(xdna, "fw ctx %d map host buf addr 0x%llx size 0x%llx",
+		 context_id, addr, size);
+
+	return 0;
+}
+
+int aie2_config_cu(struct amdxdna_hwctx *hwctx)
+{
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	u32 shift = xdna->dev_info->dev_mem_buf_shift;
+	DECLARE_AIE2_MSG(config_cu, MSG_OP_CONFIG_CU);
+	struct drm_gem_object *gobj;
+	struct amdxdna_gem_obj *abo;
+	int ret, i;
+
+	if (!chann)
+		return -ENODEV;
+
+	if (hwctx->cus->num_cus > MAX_NUM_CUS) {
+		XDNA_DBG(xdna, "Exceed maximum CU %d", MAX_NUM_CUS);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < hwctx->cus->num_cus; i++) {
+		struct amdxdna_cu_config *cu = &hwctx->cus->cu_configs[i];
+
+		gobj = drm_gem_object_lookup(hwctx->client->filp, cu->cu_bo);
+		if (!gobj) {
+			XDNA_ERR(xdna, "Lookup GEM object failed");
+			return -EINVAL;
+		}
+		abo = to_xdna_obj(gobj);
+
+		if (abo->type != AMDXDNA_BO_DEV) {
+			drm_gem_object_put(gobj);
+			XDNA_ERR(xdna, "Invalid BO type");
+			return -EINVAL;
+		}
+
+		req.cfgs[i] = FIELD_PREP(AIE2_MSG_CFG_CU_PDI_ADDR,
+					 abo->mem.dev_addr >> shift);
+		req.cfgs[i] |= FIELD_PREP(AIE2_MSG_CFG_CU_FUNC, cu->cu_func);
+		XDNA_DBG(xdna, "CU %d full addr 0x%llx, cfg 0x%x", i,
+			 abo->mem.dev_addr, req.cfgs[i]);
+		drm_gem_object_put(gobj);
+	}
+	req.num_cus = hwctx->cus->num_cus;
+
+	ret = xdna_send_msg_wait(xdna, chann, &msg);
+	if (ret == -ETIME)
+		aie2_destroy_context(xdna->dev_handle, hwctx);
+
+	if (resp.status == AIE2_STATUS_SUCCESS) {
+		XDNA_DBG(xdna, "Configure %d CUs, ret %d", req.num_cus, ret);
+		return 0;
+	}
+
+	XDNA_ERR(xdna, "Command opcode 0x%x failed, status 0x%x ret %d",
+		 msg.opcode, resp.status, ret);
+	return ret;
+}
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 818fc52dabbf..0f9f7517c831 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -129,6 +129,7 @@ struct rt_config {
 };
 
 struct amdxdna_hwctx_priv {
+	struct amdxdna_gem_obj		*heap;
 	void				*mbox_chann;
 };
 
@@ -206,6 +207,8 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 				struct amdxdna_fw_ver *fw_ver);
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
+int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
+int aie2_config_cu(struct amdxdna_hwctx *hwctx);
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index ceaebe3daa03..deb8ad3e0884 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -9,6 +9,16 @@
 #include <drm/drm_drv.h>
 #include <linux/kref.h>
 
+/* Exec buffer command header format */
+#define AMDXDNA_CMD_STATE		GENMASK(3, 0)
+#define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
+#define AMDXDNA_CMD_COUNT		GENMASK(22, 12)
+#define AMDXDNA_CMD_OPCODE		GENMASK(27, 23)
+struct amdxdna_cmd {
+	u32 header;
+	u32 data[] __counted_by(count);
+};
+
 struct amdxdna_hwctx {
 	struct amdxdna_client		*client;
 	struct amdxdna_hwctx_priv	*priv;
diff --git a/drivers/accel/amdxdna/amdxdna_drm.c b/drivers/accel/amdxdna/amdxdna_drm.c
index 2365c064bad6..7b500db83795 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.c
+++ b/drivers/accel/amdxdna/amdxdna_drm.c
@@ -36,6 +36,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	}
 	mutex_init(&client->hwctx_lock);
 	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
+	mutex_init(&client->mm_lock);
 
 	mutex_lock(&xdna->dev_lock);
 	list_add_tail(&client->node, &xdna->client_list);
@@ -64,6 +65,9 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	idr_destroy(&client->hwctx_idr);
 	mutex_destroy(&client->hwctx_lock);
+	mutex_destroy(&client->mm_lock);
+	if (client->dev_heap)
+		drm_gem_object_put(to_gobj(client->dev_heap));
 
 	iommu_sva_unbind_device(client->sva);
 
@@ -96,6 +100,10 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_DESTROY_HWCTX, amdxdna_drm_destroy_hwctx_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CONFIG_HWCTX, amdxdna_drm_config_hwctx_ioctl, 0),
+	/* BO */
+	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_BO, amdxdna_drm_create_bo_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_BO_INFO, amdxdna_drm_get_bo_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_SYNC_BO, amdxdna_drm_sync_bo_ioctl, 0),
 };
 
 static const struct file_operations amdxdna_fops = {
@@ -122,4 +130,6 @@ const struct drm_driver amdxdna_drm_drv = {
 	.postclose = amdxdna_drm_close,
 	.ioctls = amdxdna_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(amdxdna_drm_ioctls),
+
+	.gem_create_object = amdxdna_gem_create_object_cb,
 };
diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
index 08331c51a130..49e9cd3468ee 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.h
+++ b/drivers/accel/amdxdna/amdxdna_drm.h
@@ -7,13 +7,17 @@
 #define _AMDXDNA_DRM_H_
 
 #include <drm/amdxdna_accel.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_file.h>
+#include <linux/hmm.h>
+#include <linux/vmalloc.h>
 
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 
 #define XDNA_INFO(xdna, fmt, args...)	drm_info(&(xdna)->ddev, fmt, ##args)
 #define XDNA_WARN(xdna, fmt, args...)	drm_warn(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
@@ -37,6 +41,7 @@ struct amdxdna_dev_ops {
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 };
 
 /*
@@ -88,6 +93,10 @@ struct amdxdna_client {
 	struct idr			hwctx_idr;
 	struct amdxdna_dev		*xdna;
 	struct drm_file			*filp;
+
+	struct mutex			mm_lock; /* protect memory related */
+	struct amdxdna_gem_obj		*dev_heap;
+
 	struct iommu_sva		*sva;
 	int				pasid;
 };
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
new file mode 100644
index 000000000000..77224adbc77f
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -0,0 +1,619 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include <linux/iosys-map.h>
+#include "amdxdna_drm.h"
+#include "amdxdna_gem.h"
+
+#define XDNA_MAX_CMD_BO_SIZE	0x8000
+
+static int
+amdxdna_gem_insert_node_locked(struct amdxdna_gem_obj *abo, bool use_vmap)
+{
+	struct amdxdna_client *client = abo->client;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_mem *mem = &abo->mem;
+	u64 offset;
+	u32 align;
+	int ret;
+
+	align = 1 << max(PAGE_SHIFT, xdna->dev_info->dev_mem_buf_shift);
+	ret = drm_mm_insert_node_generic(&abo->dev_heap->mm, &abo->mm_node,
+					 mem->size, align,
+					 0, DRM_MM_INSERT_BEST);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to alloc dev bo memory, ret %d", ret);
+		return ret;
+	}
+
+	mem->dev_addr = abo->mm_node.start;
+	offset = mem->dev_addr - abo->dev_heap->mem.dev_addr;
+	mem->userptr = abo->dev_heap->mem.userptr + offset;
+	mem->pages = &abo->dev_heap->base.pages[offset >> PAGE_SHIFT];
+	mem->nr_pages = mem->size >> PAGE_SHIFT;
+
+	if (use_vmap) {
+		mem->kva = vmap(mem->pages, mem->nr_pages, VM_MAP, PAGE_KERNEL);
+		if (!mem->kva) {
+			XDNA_ERR(xdna, "Failed to vmap");
+			drm_mm_remove_node(&abo->mm_node);
+			return -EFAULT;
+		}
+	}
+
+	return 0;
+}
+
+static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
+
+	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
+	if (abo->pinned)
+		amdxdna_gem_unpin(abo);
+
+	if (abo->type == AMDXDNA_BO_DEV) {
+		mutex_lock(&abo->client->mm_lock);
+		drm_mm_remove_node(&abo->mm_node);
+		mutex_unlock(&abo->client->mm_lock);
+
+		vunmap(abo->mem.kva);
+		drm_gem_object_put(to_gobj(abo->dev_heap));
+		drm_gem_object_release(gobj);
+		mutex_destroy(&abo->lock);
+		kfree(abo);
+		return;
+	}
+
+	if (abo->type == AMDXDNA_BO_DEV_HEAP)
+		drm_mm_takedown(&abo->mm);
+
+	drm_gem_vunmap_unlocked(gobj, &map);
+	mutex_destroy(&abo->lock);
+	drm_gem_shmem_free(&abo->base);
+}
+
+static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
+	.free = amdxdna_gem_obj_free,
+};
+
+static bool amdxdna_hmm_invalidate(struct mmu_interval_notifier *mni,
+				   const struct mmu_notifier_range *range,
+				   unsigned long cur_seq)
+{
+	struct amdxdna_gem_obj *abo = container_of(mni, struct amdxdna_gem_obj,
+						   mem.notifier);
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+
+	XDNA_DBG(xdna, "Invalid range 0x%llx, 0x%lx, type %d",
+		 abo->mem.userptr, abo->mem.size, abo->type);
+
+	if (!mmu_notifier_range_blockable(range))
+		return false;
+
+	xdna->dev_info->ops->hmm_invalidate(abo, cur_seq);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops amdxdna_hmm_ops = {
+	.invalidate = amdxdna_hmm_invalidate,
+};
+
+static void amdxdna_hmm_unregister(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+
+	if (!xdna->dev_info->ops->hmm_invalidate)
+		return;
+
+	mmu_interval_notifier_remove(&abo->mem.notifier);
+	kvfree(abo->mem.pfns);
+	abo->mem.pfns = NULL;
+}
+
+static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo, unsigned long addr,
+				size_t len)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	u32 nr_pages;
+	int ret;
+
+	if (!xdna->dev_info->ops->hmm_invalidate)
+		return 0;
+
+	if (abo->mem.pfns)
+		return -EEXIST;
+
+	nr_pages = (PAGE_ALIGN(addr + len) - (addr & PAGE_MASK)) >> PAGE_SHIFT;
+	abo->mem.pfns = kvcalloc(nr_pages, sizeof(unsigned long),
+				 GFP_KERNEL);
+	if (!abo->mem.pfns)
+		return -ENOMEM;
+
+	ret = mmu_interval_notifier_insert_locked(&abo->mem.notifier,
+						  current->mm,
+						  addr,
+						  len,
+						  &amdxdna_hmm_ops);
+	if (ret) {
+		XDNA_ERR(xdna, "Insert mmu notifier failed, ret %d", ret);
+		kvfree(abo->mem.pfns);
+	}
+	abo->mem.userptr = addr;
+
+	return ret;
+}
+
+static int amdxdna_gem_obj_mmap(struct drm_gem_object *gobj,
+				struct vm_area_struct *vma)
+{
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	unsigned long num_pages;
+	int ret;
+
+	ret = amdxdna_hmm_register(abo, vma->vm_start, gobj->size);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_shmem_mmap(&abo->base, vma);
+	if (ret)
+		goto hmm_unreg;
+
+	num_pages = gobj->size >> PAGE_SHIFT;
+	/* Try to insert the pages */
+	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
+	ret = vm_insert_pages(vma, vma->vm_start, abo->base.pages, &num_pages);
+	if (ret)
+		XDNA_ERR(abo->client->xdna, "Failed insert pages, ret %d", ret);
+
+	return 0;
+
+hmm_unreg:
+	amdxdna_hmm_unregister(abo);
+	return ret;
+}
+
+static vm_fault_t amdxdna_gem_vm_fault(struct vm_fault *vmf)
+{
+	return drm_gem_shmem_vm_ops.fault(vmf);
+}
+
+static void amdxdna_gem_vm_open(struct vm_area_struct *vma)
+{
+	drm_gem_shmem_vm_ops.open(vma);
+}
+
+static void amdxdna_gem_vm_close(struct vm_area_struct *vma)
+{
+	struct drm_gem_object *gobj = vma->vm_private_data;
+
+	amdxdna_hmm_unregister(to_xdna_obj(gobj));
+	drm_gem_shmem_vm_ops.close(vma);
+}
+
+static const struct vm_operations_struct amdxdna_gem_vm_ops = {
+	.fault = amdxdna_gem_vm_fault,
+	.open = amdxdna_gem_vm_open,
+	.close = amdxdna_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
+	.free = amdxdna_gem_obj_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = amdxdna_gem_obj_mmap,
+	.vm_ops = &amdxdna_gem_vm_ops,
+};
+
+static struct amdxdna_gem_obj *
+amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
+{
+	struct amdxdna_gem_obj *abo;
+
+	abo = kzalloc(sizeof(*abo), GFP_KERNEL);
+	if (!abo)
+		return ERR_PTR(-ENOMEM);
+
+	abo->pinned = false;
+	abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
+	mutex_init(&abo->lock);
+
+	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
+	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
+	abo->mem.size = size;
+
+	return abo;
+}
+
+/* For drm_driver->gem_create_object callback */
+struct drm_gem_object *
+amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
+{
+	struct amdxdna_gem_obj *abo;
+
+	abo = amdxdna_gem_create_obj(dev, size);
+	if (IS_ERR(abo))
+		return ERR_CAST(abo);
+
+	to_gobj(abo)->funcs = &amdxdna_gem_shmem_funcs;
+
+	return to_gobj(abo);
+}
+
+static struct amdxdna_gem_obj *
+amdxdna_drm_alloc_shmem(struct drm_device *dev,
+			struct amdxdna_drm_create_bo *args,
+			struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct drm_gem_shmem_object *shmem;
+	struct amdxdna_gem_obj *abo;
+
+	shmem = drm_gem_shmem_create(dev, args->size);
+	if (IS_ERR(shmem))
+		return ERR_CAST(shmem);
+
+	shmem->map_wc = false;
+
+	abo = to_xdna_obj(&shmem->base);
+	abo->client = client;
+	abo->type = AMDXDNA_BO_SHMEM;
+
+	return abo;
+}
+
+static struct amdxdna_gem_obj *
+amdxdna_drm_create_dev_heap(struct drm_device *dev,
+			    struct amdxdna_drm_create_bo *args,
+			    struct drm_file *filp)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct drm_gem_shmem_object *shmem;
+	struct amdxdna_gem_obj *abo;
+	int ret;
+
+	if (args->size > xdna->dev_info->dev_mem_size) {
+		XDNA_DBG(xdna, "Invalid dev heap size 0x%llx, limit 0x%lx",
+			 args->size, xdna->dev_info->dev_mem_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	mutex_lock(&client->mm_lock);
+	if (client->dev_heap) {
+		XDNA_DBG(client->xdna, "dev heap is already created");
+		ret = -EBUSY;
+		goto mm_unlock;
+	}
+
+	shmem = drm_gem_shmem_create(dev, args->size);
+	if (IS_ERR(shmem)) {
+		ret = PTR_ERR(shmem);
+		goto mm_unlock;
+	}
+
+	shmem->map_wc = false;
+	abo = to_xdna_obj(&shmem->base);
+
+	abo->type = AMDXDNA_BO_DEV_HEAP;
+	abo->client = client;
+	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
+	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
+
+	client->dev_heap = abo;
+	drm_gem_object_get(to_gobj(abo));
+	mutex_unlock(&client->mm_lock);
+
+	return abo;
+
+mm_unlock:
+	mutex_unlock(&client->mm_lock);
+	return ERR_PTR(ret);
+}
+
+struct amdxdna_gem_obj *
+amdxdna_drm_alloc_dev_bo(struct drm_device *dev,
+			 struct amdxdna_drm_create_bo *args,
+			 struct drm_file *filp, bool use_vmap)
+{
+	struct amdxdna_client *client = filp->driver_priv;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	size_t aligned_sz = PAGE_ALIGN(args->size);
+	struct amdxdna_gem_obj *abo, *heap;
+	int ret;
+
+	mutex_lock(&client->mm_lock);
+	heap = client->dev_heap;
+	if (!heap) {
+		ret = -EINVAL;
+		goto mm_unlock;
+	}
+
+	if (heap->mem.userptr == AMDXDNA_INVALID_ADDR) {
+		XDNA_ERR(xdna, "Invalid dev heap userptr");
+		ret = -EINVAL;
+		goto mm_unlock;
+	}
+
+	if (args->size > heap->mem.size) {
+		XDNA_ERR(xdna, "Invalid dev bo size 0x%llx, limit 0x%lx",
+			 args->size, heap->mem.size);
+		ret = -EINVAL;
+		goto mm_unlock;
+	}
+
+	abo = amdxdna_gem_create_obj(&xdna->ddev, aligned_sz);
+	if (IS_ERR(abo)) {
+		ret = PTR_ERR(abo);
+		goto mm_unlock;
+	}
+	to_gobj(abo)->funcs = &amdxdna_gem_dev_obj_funcs;
+	abo->type = AMDXDNA_BO_DEV;
+	abo->client = client;
+	abo->dev_heap = heap;
+	ret = amdxdna_gem_insert_node_locked(abo, use_vmap);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to alloc dev bo memory, ret %d", ret);
+		goto mm_unlock;
+	}
+
+	drm_gem_object_get(to_gobj(heap));
+	drm_gem_private_object_init(&xdna->ddev, to_gobj(abo), aligned_sz);
+
+	mutex_unlock(&client->mm_lock);
+	return abo;
+
+mm_unlock:
+	mutex_unlock(&client->mm_lock);
+	return ERR_PTR(ret);
+}
+
+static struct amdxdna_gem_obj *
+amdxdna_drm_create_cmd_bo(struct drm_device *dev,
+			  struct amdxdna_drm_create_bo *args,
+			  struct drm_file *filp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct drm_gem_shmem_object *shmem;
+	struct amdxdna_gem_obj *abo;
+	struct iosys_map map;
+	int ret;
+
+	if (args->size > XDNA_MAX_CMD_BO_SIZE) {
+		XDNA_ERR(xdna, "Command bo size 0x%llx too large", args->size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (args->size < sizeof(struct amdxdna_cmd)) {
+		XDNA_DBG(xdna, "Command BO size 0x%llx too small", args->size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	shmem = drm_gem_shmem_create(dev, args->size);
+	if (IS_ERR(shmem))
+		return ERR_CAST(shmem);
+
+	shmem->map_wc = false;
+	abo = to_xdna_obj(&shmem->base);
+
+	abo->type = AMDXDNA_BO_CMD;
+	abo->client = filp->driver_priv;
+
+	ret = drm_gem_vmap_unlocked(to_gobj(abo), &map);
+	if (ret) {
+		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
+		goto release_obj;
+	}
+	abo->mem.kva = map.vaddr;
+
+	return abo;
+
+release_obj:
+	drm_gem_shmem_free(shmem);
+	return ERR_PTR(ret);
+}
+
+int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_create_bo *args = data;
+	struct amdxdna_gem_obj *abo;
+	int ret;
+
+	if (args->flags || args->vaddr || !args->size)
+		return -EINVAL;
+
+	XDNA_DBG(xdna, "BO arg type %d vaddr 0x%llx size 0x%llx flags 0x%llx",
+		 args->type, args->vaddr, args->size, args->flags);
+	switch (args->type) {
+	case AMDXDNA_BO_SHMEM:
+		abo = amdxdna_drm_alloc_shmem(dev, args, filp);
+		break;
+	case AMDXDNA_BO_DEV_HEAP:
+		abo = amdxdna_drm_create_dev_heap(dev, args, filp);
+		break;
+	case AMDXDNA_BO_DEV:
+		abo = amdxdna_drm_alloc_dev_bo(dev, args, filp, false);
+		break;
+	case AMDXDNA_BO_CMD:
+		abo = amdxdna_drm_create_cmd_bo(dev, args, filp);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (IS_ERR(abo))
+		return PTR_ERR(abo);
+
+	/* ready to publish object to userspace */
+	ret = drm_gem_handle_create(filp, to_gobj(abo), &args->handle);
+	if (ret) {
+		XDNA_ERR(xdna, "Create handle failed");
+		goto put_obj;
+	}
+
+	XDNA_DBG(xdna, "BO hdl %d type %d userptr 0x%llx xdna_addr 0x%llx size 0x%lx",
+		 args->handle, args->type, abo->mem.userptr,
+		 abo->mem.dev_addr, abo->mem.size);
+put_obj:
+	/* Dereference object reference. Handle holds it now. */
+	drm_gem_object_put(to_gobj(abo));
+	return ret;
+}
+
+int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	int ret;
+
+	switch (abo->type) {
+	case AMDXDNA_BO_SHMEM:
+	case AMDXDNA_BO_DEV_HEAP:
+		ret = drm_gem_shmem_pin(&abo->base);
+		break;
+	case AMDXDNA_BO_DEV:
+		ret = amdxdna_gem_pin(abo->dev_heap);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	XDNA_DBG(xdna, "BO type %d ret %d", abo->type, ret);
+	return ret;
+}
+
+int amdxdna_gem_pin(struct amdxdna_gem_obj *abo)
+{
+	int ret;
+
+	mutex_lock(&abo->lock);
+	ret = amdxdna_gem_pin_nolock(abo);
+	mutex_unlock(&abo->lock);
+
+	return ret;
+}
+
+void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo)
+{
+	mutex_lock(&abo->lock);
+	XDNA_DBG(abo->client->xdna, "BO type %d", abo->type);
+	switch (abo->type) {
+	case AMDXDNA_BO_SHMEM:
+	case AMDXDNA_BO_DEV_HEAP:
+		drm_gem_shmem_unpin(&abo->base);
+		break;
+	case AMDXDNA_BO_DEV:
+		amdxdna_gem_unpin(abo->dev_heap);
+		break;
+	default:
+		/* Should never go here */
+		WARN_ONCE(1, "Unexpected BO type %d\n", abo->type);
+	}
+	mutex_unlock(&abo->lock);
+}
+
+struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
+					    u32 bo_hdl, u8 bo_type)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_gem_obj *abo;
+	struct drm_gem_object *gobj;
+
+	gobj = drm_gem_object_lookup(client->filp, bo_hdl);
+	if (!gobj) {
+		XDNA_DBG(xdna, "Can not find bo %d", bo_hdl);
+		return NULL;
+	}
+
+	abo = to_xdna_obj(gobj);
+	if (bo_type == AMDXDNA_BO_INVALID || abo->type == bo_type)
+		return abo;
+
+	drm_gem_object_put(gobj);
+	return NULL;
+}
+
+int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+{
+	struct amdxdna_drm_get_bo_info *args = data;
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_gem_obj *abo;
+	struct drm_gem_object *gobj;
+	int ret = 0;
+
+	if (args->ext_flags)
+		return -EINVAL;
+
+	gobj = drm_gem_object_lookup(filp, args->handle);
+	if (!gobj) {
+		XDNA_DBG(xdna, "Lookup GEM object %d failed", args->handle);
+		return -ENOENT;
+	}
+
+	abo = to_xdna_obj(gobj);
+	args->vaddr = abo->mem.userptr;
+	args->xdna_addr = abo->mem.dev_addr;
+
+	if (abo->type != AMDXDNA_BO_DEV)
+		args->map_offset = drm_vma_node_offset_addr(&gobj->vma_node);
+	else
+		args->map_offset = AMDXDNA_INVALID_ADDR;
+
+	XDNA_DBG(xdna, "BO hdl %d map_offset 0x%llx vaddr 0x%llx xdna_addr 0x%llx",
+		 args->handle, args->map_offset, args->vaddr, args->xdna_addr);
+
+	drm_gem_object_put(gobj);
+	return ret;
+}
+
+/*
+ * The sync bo ioctl is to make sure the CPU cache is in sync with memory.
+ * This is required because NPU is not cache coherent device. CPU cache
+ * flushing/invalidation is expensive so it is best to handle this outside
+ * of the command submission path. This ioctl allows explicit cache
+ * flushing/invalidation outside of the critical path.
+ */
+int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
+			      void *data, struct drm_file *filp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	struct amdxdna_drm_sync_bo *args = data;
+	struct amdxdna_gem_obj *abo;
+	struct drm_gem_object *gobj;
+	int ret;
+
+	gobj = drm_gem_object_lookup(filp, args->handle);
+	if (!gobj) {
+		XDNA_ERR(xdna, "Lookup GEM object failed");
+		return -ENOENT;
+	}
+	abo = to_xdna_obj(gobj);
+
+	ret = amdxdna_gem_pin(abo);
+	if (ret) {
+		XDNA_ERR(xdna, "Pin BO %d failed, ret %d", args->handle, ret);
+		goto put_obj;
+	}
+
+	if (abo->type == AMDXDNA_BO_DEV)
+		drm_clflush_pages(abo->mem.pages, abo->mem.nr_pages);
+	else
+		drm_clflush_pages(abo->base.pages, gobj->size >> PAGE_SHIFT);
+
+	amdxdna_gem_unpin(abo);
+
+	XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
+		 args->handle, args->offset, args->size);
+
+put_obj:
+	drm_gem_object_put(gobj);
+	return ret;
+}
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
new file mode 100644
index 000000000000..fe5d1142c904
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_GEM_H_
+#define _AMDXDNA_GEM_H_
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+
+struct amdxdna_mem {
+	u64				userptr;
+	void				*kva;
+	u64				dev_addr;
+	size_t				size;
+	struct page			**pages;
+	u32				nr_pages;
+	struct mmu_interval_notifier	notifier;
+	unsigned long			*pfns;
+	bool				map_invalid;
+};
+
+struct amdxdna_gem_obj {
+	struct drm_gem_shmem_object	base;
+	struct amdxdna_client		*client;
+	u8				type;
+	bool				pinned;
+	struct mutex			lock; /* Protects: pinned */
+	struct amdxdna_mem		mem;
+
+	/* Below members is uninitialized when needed */
+	struct drm_mm			mm; /* For AMDXDNA_BO_DEV_HEAP */
+	struct amdxdna_gem_obj		*dev_heap; /* For AMDXDNA_BO_DEV */
+	struct drm_mm_node		mm_node; /* For AMDXDNA_BO_DEV */
+	u32				assigned_hwctx;
+};
+
+#define to_gobj(obj)    (&(obj)->base.base)
+
+static inline struct amdxdna_gem_obj *to_xdna_obj(struct drm_gem_object *gobj)
+{
+	return container_of(gobj, struct amdxdna_gem_obj, base.base);
+}
+
+struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
+					    u32 bo_hdl, u8 bo_type);
+static inline void amdxdna_gem_put_obj(struct amdxdna_gem_obj *abo)
+{
+	drm_gem_object_put(to_gobj(abo));
+}
+
+struct drm_gem_object *
+amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size);
+struct amdxdna_gem_obj *
+amdxdna_drm_alloc_dev_bo(struct drm_device *dev,
+			 struct amdxdna_drm_create_bo *args,
+			 struct drm_file *filp, bool use_vmap);
+
+int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo);
+int amdxdna_gem_pin(struct amdxdna_gem_obj *abo);
+void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo);
+
+int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+
+#endif /* _AMDXDNA_GEM_H_ */
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 5c1d9707d6da..2af4f80dff57 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -16,7 +16,9 @@ extern "C" {
 #define AMDXDNA_DRIVER_MAJOR	1
 #define AMDXDNA_DRIVER_MINOR	0
 
+#define AMDXDNA_INVALID_ADDR		(~0UL)
 #define AMDXDNA_INVALID_CTX_HANDLE	0
+#define AMDXDNA_INVALID_BO_HANDLE	0
 
 enum amdxdna_device_type {
 	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
@@ -27,6 +29,9 @@ enum amdxdna_drm_ioctl_id {
 	DRM_AMDXDNA_CREATE_HWCTX,
 	DRM_AMDXDNA_DESTROY_HWCTX,
 	DRM_AMDXDNA_CONFIG_HWCTX,
+	DRM_AMDXDNA_CREATE_BO,
+	DRM_AMDXDNA_GET_BO_INFO,
+	DRM_AMDXDNA_SYNC_BO,
 };
 
 /**
@@ -136,6 +141,66 @@ struct amdxdna_drm_config_hwctx {
 	__u32 pad;
 };
 
+enum amdxdna_bo_type {
+	AMDXDNA_BO_INVALID = 0,
+	AMDXDNA_BO_SHMEM,
+	AMDXDNA_BO_DEV_HEAP,
+	AMDXDNA_BO_DEV,
+	AMDXDNA_BO_CMD,
+};
+
+/**
+ * struct amdxdna_drm_create_bo - Create a buffer object.
+ * @flags: Buffer flags. MBZ.
+ * @type: Buffer type.
+ * @vaddr: User VA of buffer if applied. MBZ.
+ * @size: Size in bytes.
+ * @handle: Returned DRM buffer object handle.
+ */
+struct amdxdna_drm_create_bo {
+	__u64	flags;
+	__u32	type;
+	__u32	_pad;
+	__u64	vaddr;
+	__u64	size;
+	__u32	handle;
+};
+
+/**
+ * struct amdxdna_drm_get_bo_info - Get buffer object information.
+ * @ext: MBZ.
+ * @ext_flags: MBZ.
+ * @handle: DRM buffer object handle.
+ * @map_offset: Returned DRM fake offset for mmap().
+ * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
+ * @xdna_addr: Returned XDNA device virtual address.
+ */
+struct amdxdna_drm_get_bo_info {
+	__u64 ext;
+	__u64 ext_flags;
+	__u32 handle;
+	__u32 _pad;
+	__u64 map_offset;
+	__u64 vaddr;
+	__u64 xdna_addr;
+};
+
+/**
+ * struct amdxdna_drm_sync_bo - Sync buffer object.
+ * @handle: Buffer object handle.
+ * @direction: Direction of sync, can be from device or to device.
+ * @offset: Offset in the buffer to sync.
+ * @size: Size in bytes.
+ */
+struct amdxdna_drm_sync_bo {
+	__u32 handle;
+#define SYNC_DIRECT_TO_DEVICE	0U
+#define SYNC_DIRECT_FROM_DEVICE	1U
+	__u32 direction;
+	__u64 offset;
+	__u64 size;
+};
+
 #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
 		 struct amdxdna_drm_create_hwctx)
@@ -148,6 +213,18 @@ struct amdxdna_drm_config_hwctx {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CONFIG_HWCTX, \
 		 struct amdxdna_drm_config_hwctx)
 
+#define DRM_IOCTL_AMDXDNA_CREATE_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_BO, \
+		 struct amdxdna_drm_create_bo)
+
+#define DRM_IOCTL_AMDXDNA_GET_BO_INFO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_BO_INFO, \
+		 struct amdxdna_drm_get_bo_info)
+
+#define DRM_IOCTL_AMDXDNA_SYNC_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SYNC_BO, \
+		 struct amdxdna_drm_sync_bo)
+
 #if defined(__cplusplus)
 } /* extern c end */
 #endif
-- 
2.34.1

