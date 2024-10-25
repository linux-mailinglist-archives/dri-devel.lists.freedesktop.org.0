Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99769B0BF3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94510EB60;
	Fri, 25 Oct 2024 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U4ljD2cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD110EB5A;
 Fri, 25 Oct 2024 17:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHVD1vu2jUY4un+75wzHh9ruFkByz/2FVwIyFmvexdsrtMZvbejx155uGy6KubFiS0SVlpZPiT7ZMqJCDFO+FhGTwQ4BkVo18Zlu8uWdX4TwoRDpK4/aAx3eibK9jhs/5LgneDhMGMNJVTx8J9RW6odLyQdI3tpSVAaemigf5PpcgdeDOHhA61P5WjnS/muvkqbyaeqYSyNRvQbu51FpQbj9qLcJBOKJs+hEdRZRFsYixptDJnl/QokaZAyCft0KCHVs/4V39VMWOc3aQ/gjK0dnhG8e2cM+vTozi6WkPfTOPlb6uYNcAE0iy+KJA9IPmxm9SMNGTChO1WaGQYPzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zklkeAufDV7XkmMc3VNME2yDXUhFAasa4JZeFr8x7k=;
 b=tTIUDClkm24Np9lf413j2NQLDjDI95yMijBEuf1TDazNOrl3ZX6dgC2PbPbf+sHi6zzzo2T/DpACGnbN+HGSk+ou5m7ZtWtIj6PW+P6VkzK5LjzyLcl9sSvC3W6+GjrQ44scUkPjbdPumvUnUmsZOilKMfZ4UhXIHx3a4mdCHL7FH2lmE5zEAM2+Cw1Sr7KmKgOUOpedjYpDGDr/a0gB7tC1Qlqs+OiiGpZv/ICZ/DIJWtUwPQc32MT2Ee00On4qFkxrUnkAtLwwqtQ8YLX6se4CzeLYRj7HbuAfm/bgGIfKTHDqy2jUQ/8htFvenCC+Y1EM1NFbIY7zRLsbxgAEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zklkeAufDV7XkmMc3VNME2yDXUhFAasa4JZeFr8x7k=;
 b=U4ljD2cwV1bayleXHn4VELopIeT4PvOJ9lbsUyHwFnpNYXVNqxtHnuRsvK2c6YcKwRKsNfvklsfChC6Ks/si4CBE5pxdBdshWlDPJJNZy/K8IUCVKpTSyLe/UybXHetcAI9XUqIezx6rh925Wv7nrXK9TJo3EqIQ7srsCycmOTQ=
Received: from SA9PR13CA0079.namprd13.prod.outlook.com (2603:10b6:806:23::24)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 17:41:48 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::5b) by SA9PR13CA0079.outlook.office365.com
 (2603:10b6:806:23::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Fri, 25 Oct 2024 17:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 17:41:48 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 12:41:46 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 5/5] drm/amdgpu: track bo memory stats at runtime
Date: Fri, 25 Oct 2024 13:41:13 -0400
Message-ID: <20241025174113.554-6-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025174113.554-1-Yunxiang.Li@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a03554-88db-4b7a-e69a-08dcf51c4d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1tzYDyq/5gLkVkdykaH4IvrrTaa26sss6Cw/lHaMcTj2u61ccCWZ5MxlwQIU?=
 =?us-ascii?Q?aNWlIqNAwrBNrFczb1T8ZysRsfMwsFJfwW5pdpAwWsVyvScViwpbh0iJu/wM?=
 =?us-ascii?Q?FkzcsHwt97In6y8miv50Xvdux9jEqecYFLclgnu4+SLDtkz3vZd15fMZ8v54?=
 =?us-ascii?Q?HffnuHHCHWVvBRNsi9iWeTuLKjvNpP9jP0vu3zY2kPFEWtVvwDPdm5+oRPfX?=
 =?us-ascii?Q?m9vtsJGRVSqguDLmaRkCjjlx7EEMpLP0OPt0lAUl7/d+t1yslJN1AUSiSnvT?=
 =?us-ascii?Q?Hvh8PLP2gvNmkvk7p0rYntZ24nVeFPZhfpZAdoSw/HjzmYoLZkuIQylIdgFN?=
 =?us-ascii?Q?rCIdueciOrKdu/oFawA2ZnG6RjbsUB/zEbkrCOyIPecN3R5YTCKhnq3FMN33?=
 =?us-ascii?Q?EPbuAIgwYnblPBd/EJtUQfQ9X25A9uYiROIbj7Wp21Y658HaiXlAxJbh2Q+o?=
 =?us-ascii?Q?bYrdCLwV43Mo8QJc0RTIAIzCMcxSkAaPg/eH9tTcRNUTsftoesGWY/Q4/Xh+?=
 =?us-ascii?Q?XK5e5QbmxyeiTR4qBT++io5JCBK5Pvt6X4V9M5hCDfWNhXEBj5+JYhmYokEn?=
 =?us-ascii?Q?KPJchKd1P3Hza3qmpbqN/AItyaS3VMQERoiTr78rPCifFEsoCEJQUPtrpkG5?=
 =?us-ascii?Q?7ijPNnoLJ4hqCEn3SQkpArcVi5qu1iIatpxjm/KzEOiFqyKGGo4XYLZIQi1m?=
 =?us-ascii?Q?YcBW95OXu5hMMdUHo4T0pznvJFKrc+ceO9+/KEn3aDJ+7bFdVdCMPYG32EsO?=
 =?us-ascii?Q?3FLXbnZM6aBWW4HGmEzXpK5LjtlueNoVjAEzHCL+J/4EtlsPTSKftRFZEb0W?=
 =?us-ascii?Q?1bjmhAuZISXJ81vLJfQQbB0BOKX8KUDlv3iUDsu4lUmIfBjRvYp9sQ3zv6lO?=
 =?us-ascii?Q?2Yyokg0xebYcIFP2EY1q0NUlZoOcCwzGZzRgD5uopZXnU7sNj1w4tH+jVFU+?=
 =?us-ascii?Q?7wW4Fb5WdsY8mxwFM4oh7V1xXUZ0RDe/Huha6VV7ubhbViNb1HwILj9Z6UB2?=
 =?us-ascii?Q?9j/w5wFpQPCioLD6gnUKRUC42Rp4AKOb4jvYpHbGwbADmqjh55OxVEsooy4H?=
 =?us-ascii?Q?qQyJKaTzEgcsJ5QlVnpz9Lx7r8VoL6vdsCWMmRXCz6Gr5Ot2gRO69T0XP4fi?=
 =?us-ascii?Q?5d5PSgB4+Klyt2wb4hgM3iegiWC2iJYfA5rvIjW2o8wYIGTvmOE/CJcQ1ifu?=
 =?us-ascii?Q?V8bGGXAvi3mEswSroRkPXChzDx6zYahLVcXTWZaQ9eJL0/Gjh4aO5r0bPAjc?=
 =?us-ascii?Q?xBT26nJpIWipA0G0aiCkziqXusVo+AhVIfnaJMfOXX8V2SVVoigsvw/973Wd?=
 =?us-ascii?Q?hcKbiVNUtb+skdKHgbghkHmwmX7MQOjxFObm+r20frPQRbkv9qizeQm/Bymf?=
 =?us-ascii?Q?hwwY5pMmV45qpnVXrtitMmwkGY6OTFXqKaANj2VOYk12e0wRUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:48.1271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a03554-88db-4b7a-e69a-08dcf51c4d26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271
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

Before, every time fdinfo is queried we try to lock all the BOs in the
VM and calculate memory usage from scratch. This works okay if the
fdinfo is rarely read and the VMs don't have a ton of BOs. If either of
these conditions is not true, we get a massive performance hit.

In this new revision, we track the BOs as they change states. This way
when the fdinfo is queried we only need to take the status lock and copy
out the usage stats with minimal impact to the runtime performance.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 107 +++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 189 +++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
 8 files changed, 199 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index b144404902255..1d8a0ff3c8604 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -36,6 +36,7 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_dma_buf.h"
 #include "amdgpu_xgmi.h"
+#include "amdgpu_vm.h"
 #include <drm/amdgpu_drm.h>
 #include <drm/ttm/ttm_tt.h>
 #include <linux/dma-buf.h>
@@ -190,6 +191,13 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
 	}
 }
 
+static void amdgpu_dma_buf_release(struct dma_buf *buf)
+{
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(buf->priv);
+	amdgpu_vm_bo_update_shared(bo, -1);
+	drm_gem_dmabuf_release(buf);
+}
+
 /**
  * amdgpu_dma_buf_begin_cpu_access - &dma_buf_ops.begin_cpu_access implementation
  * @dma_buf: Shared DMA buffer
@@ -237,7 +245,7 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.unpin = amdgpu_dma_buf_unpin,
 	.map_dma_buf = amdgpu_dma_buf_map,
 	.unmap_dma_buf = amdgpu_dma_buf_unmap,
-	.release = drm_gem_dmabuf_release,
+	.release = amdgpu_dma_buf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
@@ -265,8 +273,10 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 		return ERR_PTR(-EPERM);
 
 	buf = drm_gem_prime_export(gobj, flags);
-	if (!IS_ERR(buf))
+	if (!IS_ERR(buf)) {
 		buf->ops = &amdgpu_dmabuf_ops;
+		amdgpu_vm_bo_update_shared(bo, +1);
+	}
 
 	return buf;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 7a9573958d87c..e0e09f7b39d10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -60,7 +60,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
-	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
+	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST] = { };
 	ktime_t usage[AMDGPU_HW_IP_NUM];
 	const char *pl_name[] = {
 		[TTM_PL_VRAM] = "vram",
@@ -70,13 +70,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	unsigned int hw_ip, i;
 	int ret;
 
-	ret = amdgpu_bo_reserve(vm->root.bo, false);
-	if (ret)
-		return;
-
-	amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
-	amdgpu_bo_unreserve(vm->root.bo);
-
+	amdgpu_vm_get_memory(vm, stats);
 	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
 
 	/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2436b7c9ad12b..98563124ff99c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1156,7 +1156,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 		return;
 
 	abo = ttm_to_amdgpu_bo(bo);
-	amdgpu_vm_bo_invalidate(abo, evict);
+	amdgpu_vm_bo_move(abo, new_mem, evict);
 
 	amdgpu_bo_kunmap(abo);
 
@@ -1169,86 +1169,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			     old_mem ? old_mem->mem_type : -1);
 }
 
-void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int sz)
-{
-	const unsigned int domain_to_pl[] = {
-		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]	    = TTM_PL_SYSTEM,
-		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]	    = TTM_PL_TT,
-		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]	    = TTM_PL_VRAM,
-		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]	    = AMDGPU_PL_GDS,
-		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]	    = AMDGPU_PL_GWS,
-		[ilog2(AMDGPU_GEM_DOMAIN_OA)]	    = AMDGPU_PL_OA,
-		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
-	};
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct ttm_resource *res = bo->tbo.resource;
-	struct drm_gem_object *obj = &bo->tbo.base;
-	uint64_t size = amdgpu_bo_size(bo);
-	unsigned int type;
-
-	if (!res) {
-		/*
-		 * If no backing store use one of the preferred domain for basic
-		 * stats. We take the MSB since that should give a reasonable
-		 * view.
-		 */
-		BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
-			     TTM_PL_VRAM < TTM_PL_SYSTEM);
-		type = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
-		if (!type)
-			return;
-		type--;
-		if (drm_WARN_ON_ONCE(&adev->ddev,
-				     type >= ARRAY_SIZE(domain_to_pl)))
-			return;
-		type = domain_to_pl[type];
-	} else {
-		type = res->mem_type;
-	}
-
-	/* Squash some into 'cpu' to keep the legacy userspace view. */
-	switch (type) {
-	case TTM_PL_VRAM:
-	case TTM_PL_TT:
-	case TTM_PL_SYSTEM:
-		break;
-	default:
-		type = TTM_PL_SYSTEM;
-		break;
-	}
-
-	if (drm_WARN_ON_ONCE(&adev->ddev, type >= sz))
-		return;
-
-	/* DRM stats common fields: */
-
-	if (drm_gem_object_is_shared_for_memory_stats(obj))
-		stats[type].drm.shared += size;
-	else
-		stats[type].drm.private += size;
-
-	if (res) {
-		stats[type].drm.resident += size;
-
-		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP))
-			stats[type].drm.active += size;
-		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
-			stats[type].drm.purgeable += size;
-	}
-
-	/* amdgpu specific stats: */
-
-	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
-		stats[TTM_PL_VRAM].requested += size;
-		if (type != TTM_PL_VRAM)
-			stats[TTM_PL_VRAM].evicted += size;
-	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
-		stats[TTM_PL_TT].requested += size;
-	}
-}
-
 /**
  * amdgpu_bo_release_notify - notification about a BO being released
  * @bo: pointer to a buffer object
@@ -1463,6 +1383,31 @@ u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
 	return amdgpu_gmc_sign_extend(offset);
 }
 
+uint32_t amdgpu_bo_get_preferred_placement(struct amdgpu_bo *bo) {
+	uint32_t domain = bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK;
+	if (!domain)
+		return TTM_PL_SYSTEM;
+
+	switch (ilog2(domain)) {
+		case AMDGPU_GEM_DOMAIN_CPU:
+			return TTM_PL_SYSTEM;
+		case AMDGPU_GEM_DOMAIN_GTT:
+			return TTM_PL_TT;
+		case AMDGPU_GEM_DOMAIN_VRAM:
+			return TTM_PL_VRAM;
+		case AMDGPU_GEM_DOMAIN_GDS:
+			return AMDGPU_PL_GDS;
+		case AMDGPU_GEM_DOMAIN_GWS:
+			return AMDGPU_PL_GWS;
+		case AMDGPU_GEM_DOMAIN_OA:
+			return AMDGPU_PL_OA;
+		case AMDGPU_GEM_DOMAIN_DOORBELL:
+			return AMDGPU_PL_DOORBELL;
+		default:
+			return TTM_PL_SYSTEM;
+	}
+}
+
 /**
  * amdgpu_bo_get_preferred_domain - get preferred domain
  * @adev: amdgpu device object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index be6769852ece4..bd58a8b0ece66 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -30,6 +30,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
+#include "amdgpu_ttm.h"
 #include "amdgpu_res_cursor.h"
 
 #ifdef CONFIG_MMU_NOTIFIER
@@ -300,9 +301,7 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
-void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int size);
+uint32_t amdgpu_bo_get_preferred_placement(struct amdgpu_bo *bo);
 uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 					    uint32_t domain);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 2852a6064c9ac..a9088e864fde4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,8 +26,8 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
+#include <drm/ttm/ttm_placement.h>
 #include "amdgpu_vram_mgr.h"
-#include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
 #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9fab64edd0530..abd35c18ddaa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -36,6 +36,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/drm_exec.h>
 #include "amdgpu.h"
+#include "amdgpu_vm.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_gmc.h"
@@ -310,6 +311,94 @@ static void amdgpu_vm_bo_reset_state_machine(struct amdgpu_vm *vm)
 	spin_unlock(&vm->status_lock);
 }
 
+/**
+ * amdgpu_vm_update_shared - helper to update shared memory stat
+ * @base: base structure for tracking BO usage in a VM
+ * @sign: if we should add (+1) or subtract (-1) from the shared stat
+ *
+ * Takes the vm status_lock and updates the shared memory stat. If the basic
+ * stat changed (e.g. buffer was moved) amdgpu_vm_update_stats need to be called
+ * as well.
+ */
+static void amdgpu_vm_update_shared(struct amdgpu_vm_bo_base *base, int sign)
+{
+	struct amdgpu_vm *vm = base->vm;
+	struct amdgpu_bo *bo = base->bo;
+	struct ttm_resource *res;
+	int64_t size;
+	uint32_t type;
+
+	if (!vm || !bo)
+		return;
+
+	size = sign * amdgpu_bo_size(bo);
+	if ((res = bo->tbo.resource))
+		type = res->mem_type;
+	else
+		type = amdgpu_bo_get_preferred_placement(bo);
+	if (type >= __AMDGPU_PL_LAST)
+		return;
+
+	spin_lock(&vm->status_lock);
+	vm->stats[type].drm.shared += size;
+	vm->stats[type].drm.private -= size;
+	spin_unlock(&vm->status_lock);
+}
+
+/**
+ * amdgpu_vm_update_stats - helper to update normal memory stat
+ * @base: base structure for tracking BO usage in a VM
+ * @new_res:  if not NULL, the ttm_resource to use for the purpose of accounting
+ * (i.e. ignore the one in the BO)
+ * @sign: if we should add (+1) or subtract (-1) from the stat
+ *
+ * Takes the vm status_lock and updates the basic memory stat. If the shared
+ * stat changed (e.g. buffer was exported) amdgpu_vm_update_shared need to be
+ * called as well.
+ */
+void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
+			    struct ttm_resource *new_res, int sign)
+{
+	struct amdgpu_vm *vm = base->vm;
+	struct amdgpu_bo *bo = base->bo;
+	struct ttm_resource *res;
+	int64_t size;
+	uint32_t type;
+	bool shared;
+
+	if (!vm || !bo)
+		return;
+
+	size = sign * amdgpu_bo_size(bo);
+	res = new_res ? new_res : bo->tbo.resource;
+	type = res ? res->mem_type : amdgpu_bo_get_preferred_placement(bo);
+	shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);
+
+	if (type >= __AMDGPU_PL_LAST)
+		return;
+
+	spin_lock(&vm->status_lock);
+
+	if (shared)
+		vm->stats[type].drm.shared += size;
+	else
+		vm->stats[type].drm.private += size;
+	if (res)
+		vm->stats[type].drm.resident += size;
+	if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
+		vm->stats[type].drm.purgeable += size;
+
+	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
+		vm->stats[TTM_PL_VRAM].requested += size;
+		if (type != TTM_PL_VRAM)
+			vm->stats[TTM_PL_VRAM].evicted += size;
+	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
+			vm->stats[TTM_PL_TT].requested += size;
+	}
+
+	spin_unlock(&vm->status_lock);
+}
+
 /**
  * amdgpu_vm_bo_base_init - Adds bo to the list of bos associated with the vm
  *
@@ -332,6 +421,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 		return;
 	base->next = bo->vm_bo;
 	bo->vm_bo = base;
+	amdgpu_vm_update_stats(base, NULL, +1);
 
 	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
 		return;
@@ -1082,53 +1172,11 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	return r;
 }
 
-static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
-				    struct amdgpu_mem_stats *stats,
-				    unsigned int size)
-{
-	struct amdgpu_vm *vm = bo_va->base.vm;
-	struct amdgpu_bo *bo = bo_va->base.bo;
-
-	if (!bo)
-		return;
-
-	/*
-	 * For now ignore BOs which are currently locked and potentially
-	 * changing their location.
-	 */
-	if (!amdgpu_vm_is_bo_always_valid(vm, bo) &&
-	    !dma_resv_trylock(bo->tbo.base.resv))
-		return;
-
-	amdgpu_bo_get_memory(bo, stats, size);
-	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
-		dma_resv_unlock(bo->tbo.base.resv);
-}
-
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int size)
+			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST])
 {
-	struct amdgpu_bo_va *bo_va, *tmp;
-
 	spin_lock(&vm->status_lock);
-	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
-
-	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
-
-	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
-
-	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
-
-	list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
-
-	list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats, size);
+	memcpy(stats, vm->stats, sizeof(*stats) * __AMDGPU_PL_LAST);
 	spin_unlock(&vm->status_lock);
 }
 
@@ -2071,6 +2119,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 			if (*base != &bo_va->base)
 				continue;
 
+			amdgpu_vm_update_stats(*base, NULL, -1);
 			*base = bo_va->base.next;
 			break;
 		}
@@ -2136,6 +2185,22 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 	return true;
 }
 
+/**
+ * amdgpu_vm_bo_update_shared - called when bo gets shared/unshared
+ *
+ * @bo: amdgpu buffer object
+ * @sign: if we should add (+1) or subtract (-1) the memory stat
+ *
+ * Update the per VM stats for all the vm
+ */
+void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign)
+{
+	struct amdgpu_vm_bo_base *bo_base;
+
+	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next)
+		amdgpu_vm_update_shared(bo_base, sign);
+}
+
 /**
  * amdgpu_vm_bo_invalidate - mark the bo as invalid
  *
@@ -2169,6 +2234,28 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
 	}
 }
 
+/**
+ * amdgpu_vm_bo_move - handle BO move
+ *
+ * @bo: amdgpu buffer object
+ * @new_mem: the new placement of the BO move
+ * @evicted: is the BO evicted
+ *
+ * Update the memory stats for the new placement and mark @bo as invalid.
+ */
+void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
+		       bool evicted)
+{
+	struct amdgpu_vm_bo_base *bo_base;
+
+	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
+		amdgpu_vm_update_stats(bo_base, bo->tbo.resource, -1);
+		amdgpu_vm_update_stats(bo_base, new_mem, +1);
+	}
+
+	amdgpu_vm_bo_invalidate(bo, evicted);
+}
+
 /**
  * amdgpu_vm_get_block_size - calculate VM page table size as power of two
  *
@@ -2585,6 +2672,18 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	vm->is_compute_context = false;
 }
 
+static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
+{
+	int is_zero = 1;
+	for (int i = 0; i < __AMDGPU_PL_LAST; ++i) {
+		is_zero = drm_memory_stats_is_zero(&vm->stats[i].drm) &&
+			  vm->stats->evicted == 0 && vm->stats->requested == 0;
+		if (!is_zero)
+			break;
+	}
+	return is_zero;
+}
+
 /**
  * amdgpu_vm_fini - tear down a vm instance
  *
@@ -2656,6 +2755,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		}
 	}
 
+	if (!amdgpu_vm_stats_is_zero(vm))
+		dev_err(adev->dev, "VM memory stats is non-zero when fini\n");
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6a1b344e15e1b..03589559641c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -35,6 +35,7 @@
 #include "amdgpu_sync.h"
 #include "amdgpu_ring.h"
 #include "amdgpu_ids.h"
+#include "amdgpu_ttm.h"
 
 struct drm_exec;
 
@@ -345,6 +346,9 @@ struct amdgpu_vm {
 	/* Lock to protect vm_bo add/del/move on all lists of vm */
 	spinlock_t		status_lock;
 
+	/* Memory statistics for this vm, protected by the status_lock */
+	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST];
+
 	/* Per-VM and PT BOs who needs a validation */
 	struct list_head	evicted;
 
@@ -525,6 +529,11 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
 void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
+void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
+			    struct ttm_resource *new_res, int sign);
+void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign);
+void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
+		       bool evicted);
 uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
 struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
 				       struct amdgpu_bo *bo);
@@ -575,8 +584,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int size);
+			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST]);
 
 int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		       struct amdgpu_bo_vm *vmbo, bool immediate);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index f78a0434a48fa..384526d10a3bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -537,6 +537,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 	if (!entry->bo)
 		return;
 
+	amdgpu_vm_update_stats(entry, NULL, -1);
 	entry->bo->vm_bo = NULL;
 	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 
-- 
2.34.1

