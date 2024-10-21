Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA62E9A6F40
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020310E55B;
	Mon, 21 Oct 2024 16:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NxaqnWtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1410E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZV9uqW0i7bHu80R/gq08IzZXq49AKzvXUNZIGfnC2P8vvFRkuikl0zQJZ34RpBnAZlElFp2y4nVzSVn19Wsuw6xR0qvUXftBkEzqdbxtL0kaQYWS2NMuUarTvozGqi/Q6X1xLXtyjyyiCo+SVVDLih7HPClqT93K8VPeTIVWQdwTaL9D0Om15yAJSl+oMico5e7LEzGG/b8q+YOmP9K9SYhMSpLCzSFhdeKnT+AmaIztB4cTHXeHdYVN3y5ru251d9vYhqd+JtZAvsatb/+0RJNZqowjgW6ckdvJZoyBDYKBV9BXlu0MvQGcAZsK/8+N/bVnJYLYxXOEwWqUfXNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBIo5sXBVX61Z/JG7J7MxmfZj9M8LUYzN8uLjVDZWpw=;
 b=UOQfYacroI62LQLHcKCSI8qJjpik12HNxNBcj3KpW895227g5RiFtYg/YOLkvwCSuOnB9s2nbnyBAXgwFrq3EVbk0vQEStVDdFfZf3TzKerxOflUsdMNy6kTxtD+J2inOt+5ye2mS/zskCaZ1bzSFhyZQ2dmV/ELMWWvSKCqRXKp8YOwLtUta3nHJfHrFXRBabK/N5nfPPkvmtRz3WJRlE9wBn+STUBrh62atXM+Hi6xj1mQ1bmSAwLnr0YnlAGejsmo7vK951TI2VmnE/uQIDwRY3KP7sxfmygAzJuDVywQEZYjkQSvJ8FY8yTgdJwDMWUoeUQpUzI4dyJoavpi0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBIo5sXBVX61Z/JG7J7MxmfZj9M8LUYzN8uLjVDZWpw=;
 b=NxaqnWtEr+JbXuPz+SRSfYZ7YWHQQ6TCXawdJsd94Z5gBFfTkfofqW6kg8H6cJU57J21sZxYmlKstmYFGY0arkXiD1tekkKKxwUVBVPJVme5tZFeWZsS4imQpy38m75Rtvs0LXaoEVb4r5jrDVwZ/Fdchabp+fdTOWlsTrL9mao=
Received: from SJ0PR03CA0172.namprd03.prod.outlook.com (2603:10b6:a03:338::27)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:19:57 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::de) by SJ0PR03CA0172.outlook.office365.com
 (2603:10b6:a03:338::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 16:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:19:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:54 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 11:19:53 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH V5 06/10] accel/amdxdna: Add GEM buffer object management
Date: Mon, 21 Oct 2024 09:19:27 -0700
Message-ID: <20241021161931.3701754-7-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021161931.3701754-1-lizhi.hou@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 475a4e6c-e7ba-447f-83f2-08dcf1ec3430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jddCu0YqIo5M12FZpkSaES/9dIL3l4aCVJW354MG1sUb4vZCsEMPjhTSaepS?=
 =?us-ascii?Q?LWFoRlT+FItdng6JeXMd/4R2rlJk/dcuOWln09604kcopYhFBwjiAQS2vKsL?=
 =?us-ascii?Q?jFOLTV74MtmuoMvqeV9K0x6+FZ9cdMwOq5FADA/ICkHuAIdbRHVmTY/NiSXs?=
 =?us-ascii?Q?jQxodU/KxY1CH3MkqO6k4IRPlDV8hpWsEpssik1V/fFyy1a95fcL5JHnd6av?=
 =?us-ascii?Q?CVZQzyNvvO568C1kZ+uN8e7E934qapALVZN9QBu2nwYsb6D8cGeM9RJbBeRV?=
 =?us-ascii?Q?sFlNTLY1bGPyyqVxLV2JJCU4X2VN3iiuRAdoCZUf0H3FcnrwCqAaMDSHE4KU?=
 =?us-ascii?Q?r7xWYvGNwL5VJgCtddXlNZiwa4/H2ac40cC40L39RwvyoUI31gqFu4Yh7iCK?=
 =?us-ascii?Q?q0MKC3eA/20ryr/SUC/WjiqZV9OgK8e0KNCOmysNZQk3ptXJHBz5nOQ5wanF?=
 =?us-ascii?Q?Jgw2Z3jnIYF+we5YlstocSJ1vCCukkDZ5zrKRI9aeMpxbRPtQ3Ms2qVVFYwO?=
 =?us-ascii?Q?gcFq1c7KBc4zPePfq7QJRWLrnHyuJfPs3IrrK2jCUFS2J40wUSMtmziqec0h?=
 =?us-ascii?Q?06D27INvwyv9rS2vQzD7tjjTJYClvJgOk5vlUKNqO+sZQIOG5HCRQPZnPQ2d?=
 =?us-ascii?Q?+Nr8fvt1eAiaG6xWhoUinaFMmfzlaQyJhKjLbzrmQ3LFVGCXD9Gq2lWuWhY0?=
 =?us-ascii?Q?ZrdkvetEQ30v0dWZmuX2qDCb0hhl8gktYjyhx6P3Yvas/yiSRVDLSAzjUuek?=
 =?us-ascii?Q?tjDGGF3Sk3Xxix8smnoxVm2nFNBdsA6dYeFAtQk58OTRU4HXv5MPbCt3bJHD?=
 =?us-ascii?Q?uGy+ZIPvvJxHwutJPexchbAUr5zXdTIncLWUEuBjHXT6ZpeRyX5eoUeISrSi?=
 =?us-ascii?Q?dmHnEJOdWxQdLI0ewgIIZz4J6tGLPIn39q/URuamP/OtBBQTZUVmT8Elu+Sr?=
 =?us-ascii?Q?7lyQ5XuX65GBGKM7rm1etpv1U94FGJF7BKyk/2Y4vbIbhw767xoKWNQPoYXV?=
 =?us-ascii?Q?4SQchsY4qAdhEoRt75Vu4WOHyzpFB84SJJ384hXSrG/M/qQRUi83BCauWOQf?=
 =?us-ascii?Q?eiWGQ2PA7lGMleXeqd//ukbEBczVjETl9NiQnrusXG/1GUPa4XD8EQb6RVQB?=
 =?us-ascii?Q?JGGs52URp4pI7mO/QEbiTYvCaX53ZeN7odqC6Des1vAShB4M7c2yfZdbmpG7?=
 =?us-ascii?Q?XOHSRw6dMhD4+kSFqnbFN5apcYtqhYFY2X9MGlrS7g3TEjAm7aACHs7RZXup?=
 =?us-ascii?Q?R+S8PKXs+x2fgML1zPMVKh2CwtrvqaOG178BmMXaFap7GQ0hU4oRsdDU/OKr?=
 =?us-ascii?Q?/eTgyVNpMCyvM+uUx/JhYTzq7wwrfD1N+Cu9Zz0VvO5f6ic/7yD0LjXr2g1C?=
 =?us-ascii?Q?KT9mC6NphzosAf0aNJJABe6NcWUM+MiCDKbeh6nl27+Co5feeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:19:56.8375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 475a4e6c-e7ba-447f-83f2-08dcf1ec3430
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile          |   1 +
 drivers/accel/amdxdna/aie2_ctx.c        |  85 +++-
 drivers/accel/amdxdna/aie2_message.c    |  79 +++
 drivers/accel/amdxdna/aie2_pci.h        |   3 +
 drivers/accel/amdxdna/amdxdna_ctx.h     |  10 +
 drivers/accel/amdxdna/amdxdna_gem.c     | 621 ++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h     |  65 +++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  12 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   6 +
 include/uapi/drm/amdxdna_accel.h        |  77 +++
 10 files changed, 958 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index c86c90dfd303..a688c378761f 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -8,6 +8,7 @@ amdxdna-y := \
 	aie2_smu.o \
 	aie2_solver.o \
 	amdxdna_ctx.o \
+	amdxdna_gem.o \
 	amdxdna_mailbox.o \
 	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 022b2b0b015d..617fc05077d9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -5,12 +5,15 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <linux/types.h>
 
 #include "aie2_pci.h"
 #include "aie2_solver.h"
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
@@ -128,6 +131,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_client *client = hwctx->client;
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx_priv *priv;
+	struct amdxdna_gem_obj *heap;
 	int ret;
 
 	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
@@ -135,10 +139,28 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
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
@@ -147,14 +169,26 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
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
@@ -164,11 +198,59 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 {
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
@@ -176,6 +258,7 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	switch (type) {
 	case DRM_AMDXDNA_HWCTX_CONFIG_CU:
+		return aie2_hwctx_cu_config(hwctx, buf, size);
 	case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
 	case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
 		return -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 4b8a71bf4fae..28bd0560db61 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -5,6 +5,8 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <linux/errno.h>
 #include <linux/pci.h>
@@ -13,6 +15,7 @@
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_mailbox_helper.h"
 #include "amdxdna_pci_drv.h"
@@ -282,3 +285,79 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 
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
index b789286bc9d4..3ac936e2c9d1 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -119,6 +119,7 @@ struct rt_config {
 };
 
 struct amdxdna_hwctx_priv {
+	struct amdxdna_gem_obj		*heap;
 	void				*mbox_chann;
 };
 
@@ -196,6 +197,8 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 				struct amdxdna_fw_ver *fw_ver);
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
+int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
+int aie2_config_cu(struct amdxdna_hwctx *hwctx);
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 3627770e5a98..665b3208897d 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -6,6 +6,16 @@
 #ifndef _AMDXDNA_CTX_H_
 #define _AMDXDNA_CTX_H_
 
+/* Exec buffer command header format */
+#define AMDXDNA_CMD_STATE		GENMASK(3, 0)
+#define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
+#define AMDXDNA_CMD_COUNT		GENMASK(22, 12)
+#define AMDXDNA_CMD_OPCODE		GENMASK(27, 23)
+struct amdxdna_cmd {
+	u32 header;
+	u32 data[];
+};
+
 struct amdxdna_hwctx {
 	struct amdxdna_client		*client;
 	struct amdxdna_hwctx_priv	*priv;
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
new file mode 100644
index 000000000000..f2ba86ae9e1a
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_cache.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <linux/iosys-map.h>
+#include <linux/vmalloc.h>
+
+#include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
+#include "amdxdna_pci_drv.h"
+
+#define XDNA_MAX_CMD_BO_SIZE	SZ_32K
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
+	abo->mem.pfns = kvcalloc(nr_pages, sizeof(*abo->mem.pfns),
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
+		ret = drm_gem_shmem_pin(&abo->dev_heap->base);
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
+	if (abo->type == AMDXDNA_BO_DEV)
+		abo = abo->dev_heap;
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
+	if (abo->type == AMDXDNA_BO_DEV)
+		abo = abo->dev_heap;
+
+	mutex_lock(&abo->lock);
+	drm_gem_shmem_unpin(&abo->base);
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
+	if (args->ext || args->ext_flags)
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
index 000000000000..8ccc0375dd9d
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_GEM_H_
+#define _AMDXDNA_GEM_H_
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
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index aad480db8ca0..e48a01a1c235 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -7,12 +7,14 @@
 #include <drm/drm_accel.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <linux/iommu.h>
 #include <linux/pci.h>
 
 #include "amdxdna_ctx.h"
+#include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
 
 /*
@@ -63,6 +65,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	}
 	mutex_init(&client->hwctx_lock);
 	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
+	mutex_init(&client->mm_lock);
 
 	mutex_lock(&xdna->dev_lock);
 	list_add_tail(&client->node, &xdna->client_list);
@@ -91,6 +94,9 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	idr_destroy(&client->hwctx_idr);
 	mutex_destroy(&client->hwctx_lock);
+	mutex_destroy(&client->mm_lock);
+	if (client->dev_heap)
+		drm_gem_object_put(to_gobj(client->dev_heap));
 
 	iommu_sva_unbind_device(client->sva);
 
@@ -123,6 +129,10 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_DESTROY_HWCTX, amdxdna_drm_destroy_hwctx_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(AMDXDNA_CONFIG_HWCTX, amdxdna_drm_config_hwctx_ioctl, 0),
+	/* BO */
+	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_BO, amdxdna_drm_create_bo_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_BO_INFO, amdxdna_drm_get_bo_info_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(AMDXDNA_SYNC_BO, amdxdna_drm_sync_bo_ioctl, 0),
 };
 
 static const struct file_operations amdxdna_fops = {
@@ -148,6 +158,8 @@ const struct drm_driver amdxdna_drm_drv = {
 	.postclose = amdxdna_drm_close,
 	.ioctls = amdxdna_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(amdxdna_drm_ioctls),
+
+	.gem_create_object = amdxdna_gem_create_object_cb,
 };
 
 static const struct amdxdna_dev_info *
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 5ec7fe168406..3dddde4ac12a 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -18,6 +18,7 @@
 extern const struct drm_driver amdxdna_drm_drv;
 
 struct amdxdna_dev;
+struct amdxdna_gem_obj;
 struct amdxdna_hwctx;
 
 /*
@@ -29,6 +30,7 @@ struct amdxdna_dev_ops {
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 };
 
 /*
@@ -89,6 +91,10 @@ struct amdxdna_client {
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
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 133da8c007d0..3792750834b2 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -13,7 +13,9 @@
 extern "C" {
 #endif
 
+#define AMDXDNA_INVALID_ADDR		(~0UL)
 #define AMDXDNA_INVALID_CTX_HANDLE	0
+#define AMDXDNA_INVALID_BO_HANDLE	0
 
 enum amdxdna_device_type {
 	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
@@ -24,6 +26,9 @@ enum amdxdna_drm_ioctl_id {
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
+ * @vaddr: User VA of buffer if applied. MBZ.
+ * @size: Size in bytes.
+ * @type: Buffer type.
+ * @handle: Returned DRM buffer object handle.
+ */
+struct amdxdna_drm_create_bo {
+	__u64	flags;
+	__u64	vaddr;
+	__u64	size;
+	__u32	type;
+	__u32	handle;
+};
+
+/**
+ * struct amdxdna_drm_get_bo_info - Get buffer object information.
+ * @ext: MBZ.
+ * @ext_flags: MBZ.
+ * @handle: DRM buffer object handle.
+ * @pad: Structure padding.
+ * @map_offset: Returned DRM fake offset for mmap().
+ * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
+ * @xdna_addr: Returned XDNA device virtual address.
+ */
+struct amdxdna_drm_get_bo_info {
+	__u64 ext;
+	__u64 ext_flags;
+	__u32 handle;
+	__u32 pad;
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

