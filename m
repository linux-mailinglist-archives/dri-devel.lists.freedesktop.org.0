Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7A9A3FC6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B96F10E92F;
	Fri, 18 Oct 2024 13:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="siWXveam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357610E92A;
 Fri, 18 Oct 2024 13:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkY1L3PbCiYwAkzcSioJE769TDkj/j5zzOU3o04AqpTuGYFfgfBU1LAzVOI6ypjCEE6GNQ81H6UfHP7iy0rDRdCLmLFdyuSP8fNX6pSJjkCUJ3/rdhaIO7C5nD0/dXNM0hKCQFSb4CTQxsE6RE+6zm62iyIdxBVDsT9obIa1q17Q9JpMeQ7wuciTtHwIqQ97AU20YH+BHsQ0WnfAECXYazDN1wT0Y/QgEDtYlzj5J545rIaOSjmD71chgmLndcyeiVJqWPrB6V/gZRvOsmwXQ76sioKZKlbXHhFLyvLPszHCEFgYuUL2su9NdKhMFk4IV5XEFC37yy/xuoOMF/RIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocnrLIJwQAsrYWLC+Ze8UUzKOmziHXcx3NebWdzj04w=;
 b=nhCFp0P6IxJHZ0JgwuruVvLnPKoylxYAWygjvMjSzeJODckA45j3xp6yQVG3G+lMVi0+3EVzf7mPR/fuLtq/z/nKva0KwhnB9E2G9KtYhg4h2JCq9UDGEcdTtVjWt+33l9lHASlTpmF2mxIbtd7z+mGKW07xcqO3Kw7uhjCKom8KZjdPTvq5BbbmatCc+EMh2GaAtBoEw3auvyYzRlU1FojIB99N/2RlRjA12doGS/y3zPjAToEInFNcw0859cQ/z79cr4IOov52adp1rGDqEeqOSic1HRTn3wKIwcEXVXGE0+8FxaWyEGSDHemZ78/xI9BceHSd7kcJ/EUsnAHOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocnrLIJwQAsrYWLC+Ze8UUzKOmziHXcx3NebWdzj04w=;
 b=siWXveamWjk2vcqpuxtcF1RVwfI0Ius94z6/IvArd7rWHITBL/oRy5p2z0bkRfk0KPvQk+TJyCjxw5B/rCJmHfZ75KodjDfiLi0KtBsC9cJpGa44Fcbj4oev+YnYv0SSL0gZ/+NMl27jJVF3xSk0AqYDSn+H4rik69F20EFLFmQ=
Received: from BLAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:335::24)
 by CY8PR12MB7266.namprd12.prod.outlook.com (2603:10b6:930:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 13:33:54 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::34) by BLAPR05CA0041.outlook.office365.com
 (2603:10b6:208:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.10 via Frontend
 Transport; Fri, 18 Oct 2024 13:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:33:53 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 08:33:51 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Date: Fri, 18 Oct 2024 09:33:08 -0400
Message-ID: <20241018133308.889-5-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018133308.889-1-Yunxiang.Li@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CY8PR12MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b279fd-8686-4423-62bd-08dcef798275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MEyZMA62jGhytLPaqkpXTuakcG3M6vqrp5luzPG84dilseJJ+DV9WImXWetD?=
 =?us-ascii?Q?SCgjMlVwHFxDQDd/GOVeyQ3zW69SW0xVTV1SBje/1ptsY/GcA6nv24it/oa8?=
 =?us-ascii?Q?wvucD2J0BcZt4YUiIYw5iLS9bVF7AwGNdmCVBnN+hQzHquy09pDytNbXOihZ?=
 =?us-ascii?Q?JJg86kF1qo2C4Fazp5P5lwJH+v0VP8zorWFjljYeHau2i7cyCr6YoqhZEgQO?=
 =?us-ascii?Q?2ALxUSb5lsR6tZobmZkEoxrCQw8nIEwEpOVD8hrGcFAS2wi5vdKYHoqBDyeK?=
 =?us-ascii?Q?F44eTmJr2STh8Y/tAiSwBx5oDmWm4vpyad9R7i2PjZM7LhvrorNsO9xKYLPO?=
 =?us-ascii?Q?9QugvmHOANkQvkC7s5HqG8s04mAKS9ZprLeg7C/omrI6JFGODHzSB/r5uCMt?=
 =?us-ascii?Q?sil8DN5d7RKp6yDzCa7nZgCXOynCSI0CI4pJYwko46R5ABAVd/fMrUrnQqAv?=
 =?us-ascii?Q?tkGnZDWSY6esOoBkbDaJsJO6/h//6fnKvPpSBXHL+N2r4gr+zVA/fbs+boLI?=
 =?us-ascii?Q?YpiPpAXFTPbgpulQydjWTEK/Bd3FiVcTBxTVcKe6U75NMXA3R1EqXQyofrHD?=
 =?us-ascii?Q?amjZ9v6eEnuiBk/hIyMz33HdiP4z4bHrMutysaMzOtE2OamGvLODE6YOyUgN?=
 =?us-ascii?Q?TcU+6XSl8uq0xx5veGmtP30+kaiD+cUrNOFiti9xzQgFWyg3fMIM+rsYetmw?=
 =?us-ascii?Q?J0hou4/HWToV5QGC61rJX5JLgZHS4TBAEi/sDwNmb6y5C51hFjubB2lQ/uMg?=
 =?us-ascii?Q?nyY9gWqBjoOuJK7mJx1WBWSNaVIYlp7X0WQ9t0LrzzUR4F1+AoaIHMSgkBoK?=
 =?us-ascii?Q?B+IIYBUmjW78CFxdMfjppDkPFI1wN97Jgg8Gk/RGZRrJF/7+2djx9QH+YwTi?=
 =?us-ascii?Q?ehYT/eGki/pAbAdw8HP/ruSRkvz27ytKjsFRD/sfH370pVneoXPYdE16hTLZ?=
 =?us-ascii?Q?T5TwM6DcryJljqwaFiKX9HWct9kIFpng71E0NPzYsGiQ/Oc1N1uwt739S8I1?=
 =?us-ascii?Q?bnpDAIkgbQHL0w8Nku57c24IW9CxBVfjsDIiOmQD99E5Qw2B25EWWU/2f89a?=
 =?us-ascii?Q?6U6yX3dlKo0SliBaVcj5y8u9ErmTmDT+mXn/VPyQ9pv+AZNIVCfuXfUZ/rXV?=
 =?us-ascii?Q?z8BLDzfIrJIljOe86Z4DIznKc44qfHl4IaaL5xb07H+kbXgvpB369pimb5VS?=
 =?us-ascii?Q?HNeWDqq353KQ0MQ9smfquc3THUx3WU0XdJ+5uxaxiA7wgYkRlMbDdAO49BJE?=
 =?us-ascii?Q?UrXVG/a8f3jrpsEf7q4WHZuewIziVzNDjy7r76Q00FIUgDrXyrHnp2goTw77?=
 =?us-ascii?Q?v/EgHpMDqOu7X2ybGPyWhrqoWVJPValhx1DzgfREl/4xMwdrBTUPRWpxaDgQ?=
 =?us-ascii?Q?KMeicc2ODLvueNdFBdS319ehBPhTrv8cTD3HtuQVOWQynxijcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:33:53.7955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b279fd-8686-4423-62bd-08dcef798275
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7266
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  82 +-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 204 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
 drivers/gpu/drm/drm_file.c                  |   8 +
 include/drm/drm_file.h                      |   1 +
 9 files changed, 220 insertions(+), 117 deletions(-)

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
index 7a9573958d87c..ceedfc3665c18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -40,6 +40,7 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_ctx.h"
 #include "amdgpu_fdinfo.h"
+#include "amdgpu_ttm.h"
 
 
 static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] = {
@@ -60,7 +61,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
-	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
+	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST] = { };
 	ktime_t usage[AMDGPU_HW_IP_NUM];
 	const char *pl_name[] = {
 		[TTM_PL_VRAM] = "vram",
@@ -70,13 +71,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
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
index 2436b7c9ad12b..5ff147881da6d 100644
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index be6769852ece4..ebad4f96775d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -300,9 +300,6 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
-void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int size);
 uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 					    uint32_t domain);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9fab64edd0530..a802cea67a4d7 100644
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
@@ -310,6 +311,134 @@ static void amdgpu_vm_bo_reset_state_machine(struct amdgpu_vm *vm)
 	spin_unlock(&vm->status_lock);
 }
 
+static uint32_t fold_memtype(uint32_t memtype) {
+	/* Squash private placements into 'cpu' to keep the legacy userspace view. */
+	switch (mem_type) {
+	case TTM_PL_VRAM:
+	case TTM_PL_TT:
+		return memtype
+	default:
+		return TTM_PL_SYSTEM;
+	}
+}
+
+static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {
+	struct ttm_resource *res = bo->tbo.resource;
+	const uint32_t domain_to_pl[] = {
+		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]      = TTM_PL_SYSTEM,
+		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
+		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     = TTM_PL_VRAM,
+		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]      = AMDGPU_PL_GDS,
+		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]      = AMDGPU_PL_GWS,
+		[ilog2(AMDGPU_GEM_DOMAIN_OA)]       = AMDGPU_PL_OA,
+		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
+	};
+	uint32_t domain;
+
+	if (res)
+		return fold_memtype(res->mem_type);
+
+	/*
+	 * If no backing store use one of the preferred domain for basic
+	 * stats. We take the MSB since that should give a reasonable
+	 * view.
+	 */
+	BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT || TTM_PL_VRAM < TTM_PL_SYSTEM);
+	domain = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
+	if (drm_WARN_ON_ONCE(&adev->ddev,
+			     domain == 0 || --domain >= ARRAY_SIZE(domain_to_pl)))
+		return 0;
+	return fold_memtype(domain_to_pl[domain])
+}
+
+/**
+ * amdgpu_vm_update_shared - helper to update shared memory stat
+ * @base: base structure for tracking BO usage in a VM
+ * @sign: if we should add (+1) or subtract (-1) the memory stat
+ *
+ * Takes the vm status_lock and updates the shared memory stat. If the basic
+ * stat changed (e.g. buffer was moved) amdgpu_vm_update_stats need to be called
+ * as well.
+ */
+static void amdgpu_vm_update_shared(struct amdgpu_vm_bo_base *base, int sign)
+{
+	struct amdgpu_vm *vm = base->vm;
+	struct amdgpu_bo *bo = base->bo;
+	int64_t size;
+	int type;
+
+	if (!vm || !bo || !(sign == +1 || sign == -1))
+		return;
+
+	spin_lock(&vm->status_lock);
+	size = sign * amdgpu_bo_size(bo);
+	type = bo_get_memtype(bo);
+	vm->stats[type].drm.shared += size;
+	vm->stats[type].drm.private -= size;
+	spin_unlock(&vm->status_lock);
+}
+
+/**
+ * amdgpu_vm_update_stats - helper to update normal memory stat
+ * @base: base structure for tracking BO usage in a VM
+ * @new_mem: the new placement of the BO if any (e.g. NULL when BO is deleted)
+ * @old_mem: the old placement of the BO if any (e.g. NULL when BO is created)
+ *
+ * Takes the vm status_lock and updates the basic memory stat. If the shared
+ * stat changed (e.g. buffer was exported) amdgpu_vm_update_shared need to be
+ * called as well.
+ */
+void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
+			    struct ttm_resource *new_mem,
+			    struct ttm_resource *old_mem)
+{
+	struct amdgpu_vm *vm = base->vm;
+	struct amdgpu_bo *bo = base->bo;
+	uint64_t size;
+	int type;
+	bool shared;
+
+	if (!vm || !bo || (!new_mem && !old_mem))
+		return;
+
+	spin_lock(&vm->status_lock);
+
+	size = amdgpu_bo_size(bo);
+	shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);
+
+	if (old_mem) {
+		type = fold_memtype(old_mem->mem_type);
+		if (shared)
+			vm->stats[i].drm.shared -= size;
+		else
+			vm->stats[i].drm.private -= size;
+	}
+	if (new_mem) {
+		type = fold_memtype(new_mem->mem_type);
+		if (shared)
+			vm->stats[i].drm.shared += size;
+		else
+			vm->stats[i].drm.private += size;
+	}
+	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
+		if (!old_mem)
+			vm->stats[TTM_PL_VRAM].requested += size;
+		else if (old_mem->mem_type != TTM_PL_VRAM)
+			vm->stats[TTM_PL_VRAM].evicted -= size;
+		if (!new_mem)
+			vm->stats[TTM_PL_VRAM].requested -= size;
+		else if (new_mem->mem_type != TTM_PL_VRAM)
+			vm->stats[TTM_PL_VRAM].evicted += size;
+	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
+		if (!old_mem)
+			vm->stats[TTM_PL_TT].requested += size;
+		if (!new_mem)
+			vm->stats[TTM_PL_TT].requested -= size;
+	}
+
+	spin_unlock(&vm->status_lock);
+}
+
 /**
  * amdgpu_vm_bo_base_init - Adds bo to the list of bos associated with the vm
  *
@@ -332,6 +461,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 		return;
 	base->next = bo->vm_bo;
 	bo->vm_bo = base;
+	amdgpu_vm_update_stats(base, bo->tbo.resource, NULL);
 
 	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
 		return;
@@ -1106,29 +1236,10 @@ static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
 }
 
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
 
@@ -2071,6 +2182,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 			if (*base != &bo_va->base)
 				continue;
 
+			amdgpu_vm_update_stats(*base, NULL, bo->tbo.resource);
 			*base = bo_va->base.next;
 			break;
 		}
@@ -2136,6 +2248,22 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
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
@@ -2169,6 +2297,26 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
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
+	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next)
+		amdgpu_vm_update_stats(bo_base, new_mem, bo->tbo.resource);
+
+	amdgpu_vm_bo_invalidate(bo, evicted);
+}
+
 /**
  * amdgpu_vm_get_block_size - calculate VM page table size as power of two
  *
@@ -2585,6 +2733,18 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	vm->is_compute_context = false;
 }
 
+static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
+{
+	int is_zero = 1;
+	for (int i = 0; i < __AMDGPU_PL_LAST, ++i) {
+		if (!(is_zero = is_zero &&
+				drm_memory_stats_is_zero(&vm->stats[i].drm) &&
+				stats->evicted == 0 && stats->requested == 0))
+			break;
+	}
+	return is_zero;
+}
+
 /**
  * amdgpu_vm_fini - tear down a vm instance
  *
@@ -2656,6 +2816,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		}
 	}
 
+	if (!amdgpu_vm_stats_is_zero(vm))
+		dev_err(adev->dev, "VM memory stats is non-zero when fini\n");
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6a1b344e15e1b..7b3cd6367969d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -24,6 +24,7 @@
 #ifndef __AMDGPU_VM_H__
 #define __AMDGPU_VM_H__
 
+#include "amdgpu_ttm.h"
 #include <linux/idr.h>
 #include <linux/kfifo.h>
 #include <linux/rbtree.h>
@@ -345,6 +346,9 @@ struct amdgpu_vm {
 	/* Lock to protect vm_bo add/del/move on all lists of vm */
 	spinlock_t		status_lock;
 
+	/* Memory statistics for this vm, protected by the status_lock */
+	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST];
+
 	/* Per-VM and PT BOs who needs a validation */
 	struct list_head	evicted;
 
@@ -525,6 +529,12 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
 void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
+void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
+			    struct ttm_resource *new_mem,
+			    struct ttm_resource *old_mem);
+void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign);
+void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
+		       bool evicted);
 uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
 struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
 				       struct amdgpu_bo *bo);
@@ -575,8 +585,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
-			  struct amdgpu_mem_stats *stats,
-			  unsigned int size);
+			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST]);
 
 int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		       struct amdgpu_bo_vm *vmbo, bool immediate);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index f78a0434a48fa..bd57ced911e32 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -537,6 +537,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 	if (!entry->bo)
 		return;
 
+	amdgpu_vm_update_stats(entry, NULL, entry->bo->tbo.resource);
 	entry->bo->vm_bo = NULL;
 	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b051080..39e36fa1e89cd 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -859,6 +859,14 @@ static void print_size(struct drm_printer *p, const char *stat,
 	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
 }
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
+	return (stats->shared == 0 &&
+		stats->private == 0 &&
+		stats->resident == 0 &&
+		stats->purgeable == 0 &&
+		stats->active == 0);
+}
+
 /**
  * drm_print_memory_stats - A helper to print memory stats
  * @p: The printer to print output to
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138d..7f91e35d027d9 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -477,6 +477,7 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.34.1

