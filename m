Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0329A3FC2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9910E92A;
	Fri, 18 Oct 2024 13:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qpo0ZZGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6410E91F;
 Fri, 18 Oct 2024 13:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myhDT02EqLix7cOzb5WnC+fIImYCSWfI8VJ1byWGq9oWlJt+cFqObzV7n/yCaFr73/X0uqOhWUHdCYEXaU4WCO+HmwaTltmpJe9IeXco44EceHscLpAnMwMsGlSkoz5mykguqCihekUD5/EuTWcn0SN+uohsXcQB408VmSchu+vQlBNQFU/W5kbbPd6FIkcX6wBlacDUif1ZIuoFpIXWRfUgjFIHCUllr/Yti3TENDP74Hx6UeplCs/iMEjlZYG+BWQw3zYzQ4bitSdn8OJxMWPdHJEPYaoRCIrcUit+aVsRR9Wh2pLfCJ+f1c62hMN54ucoFJSLseS5wv8fA/wQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYQfiYsJokk/wseiXPmgk37Drvu6aycOxZZZZwY6J5c=;
 b=OHwnVxya6qMLLj3frkffSnFxltF73UjEcwpOtSIJfYavjM/N2gYAjLp4diZ+IfvbXRtQjCOTY+QsfNx1hTmd+qhFGoH5qohQtrD8dvYyNL6Aq2RKJyfpsmBEW3FUax3D0uIrYXQs5nzDDdoc0Oc/o9GTk4yMpQUnNLe7vqS8T3s3at7mIidUELzmw3DzSIBEtbxqZHDu6Z84vvSuk+/vrZR2c5PlaMO/Ww6gru1123RfS4VIMXhSHgOv0+6l6EAtiUTk/07xMbgGyJ+mZZmOpCL7WewvKFLyc8qlFfANBDCrhNUMzE861u2m1kWeJQEFNgsesHQ31f8lj633IZb/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYQfiYsJokk/wseiXPmgk37Drvu6aycOxZZZZwY6J5c=;
 b=qpo0ZZGofHoDHRQNmQ/Uo1nPb/hFeIC4Yh03KhZEDoyU7kgc5g/7+whYvE1mYMIrlb5JMuVQLGkL2922WVRKLvGkeeFIz0HW4KwFpwTlLW3VquD54Tu4AWvOPVDYbEQjBPfBM6fyJ+xkScV4pd03z7qFzj/5X4mWdzt73V5eEMQ=
Received: from MN2PR22CA0010.namprd22.prod.outlook.com (2603:10b6:208:238::15)
 by CH0PR12MB8464.namprd12.prod.outlook.com (2603:10b6:610:184::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 13:33:49 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::cc) by MN2PR22CA0010.outlook.office365.com
 (2603:10b6:208:238::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 13:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:33:48 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 08:33:47 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v5 1/4] drm/amdgpu: remove unused function parameter
Date: Fri, 18 Oct 2024 09:33:05 -0400
Message-ID: <20241018133308.889-2-Yunxiang.Li@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CH0PR12MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e8ffbd-269a-46ca-5ffe-08dcef797f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x5JgGrOVje3iAyyYaF4PVVpw4bmOIbbGruaj13Ma1FjbfKYTSy6bfiFYsQuC?=
 =?us-ascii?Q?h/s9DjElVe2VbMgKLeagJ/zb1PcKigsL6iLGq6Sjj37+KL7SkucsKqDLu2Gr?=
 =?us-ascii?Q?OX7Z0p/qlMAjV/r8gwoJdiYCRnINR6IORxSLhidIkC+RjLbIz7wTymjxtu2s?=
 =?us-ascii?Q?stNt07Ok9tHeFwc0BCLWxkWZmXBbSKnKoEoXY83TnGjJhb1gYyZP2GRSO4O+?=
 =?us-ascii?Q?N81SSCp+2hWhZRWOLYbRMRUaonALCWYps2kbaQVdbHNDiWr4j7rqYwM71W3c?=
 =?us-ascii?Q?NCbNvr8/FQhbkjaS75QH8ezcLC0j92n5lJglb8+Q1REPcAtvsvUNUnq1Qh1v?=
 =?us-ascii?Q?OkG8ar2hase58KoY21EVWWPN2lerHZdzlv2B79T7LRhKC5zY+y/iFxTlLt59?=
 =?us-ascii?Q?NnOa51ZiSZVlz4vt8IuZx/VwH9qo7U3DCfJ8s8IwaBeKZVFxs3FAPTTUYGYS?=
 =?us-ascii?Q?lbF3DWBXB4tfyfO9uW9Pvs8LhHBq8TYFtadrgarOn53qXcc3kNHqJHIxsEhy?=
 =?us-ascii?Q?nu9NwKlqXetSzZuiNpsZk5bSMRMQ9bHtW6QWZ/MGKwye8xUAIT+SArKR2C1Q?=
 =?us-ascii?Q?jyB3KsaWX/BUHQL3iiy96o1DL7FnTZ0RASg9i4iAxPFQ+YSDHo8ppKSYq+u8?=
 =?us-ascii?Q?69gKwh7WREl/EFIn2aKc3MMf6NQZq2YJUZs0G6+ImSxaitgiP3+ze2VLbhH0?=
 =?us-ascii?Q?+wQVBaGvFseduMvirnmlCLpBNKMUqL7w+yUT4p5XvOGcY/on5CJ6YxJdFym4?=
 =?us-ascii?Q?+ndapUD+9shtRd5/VScda/YVmqAMIOE3xvnGUtYdkIpa4rKSl+OUJqaHO9a2?=
 =?us-ascii?Q?17Wf0LIgYK0ucET1P4lK7TeQGU3+AmDXOSPcDKVKxI6+DT78VHmWAYXOhZzd?=
 =?us-ascii?Q?KKgXBqbMbsJoqsaeGGs2hgcd5tdxsCCr/6UBV3z73vIE+csq/Uib2PAgtjKd?=
 =?us-ascii?Q?MZSk5uPBmek7rOZsn+3omvjDnLj4u7SD+BMuoCQxZadBdElWoSftsXZnN2aF?=
 =?us-ascii?Q?cUoLCTqrog66IUH0zrcf8VkKSewBCjKaPOed6SZPDZ+ojWl0/LsEPkAWdSmM?=
 =?us-ascii?Q?ohVj9DWCQGK4uCEtGIHul04UoPxCM38OpCKrzfdEvf/hPXKb4Wq/8ozJwt6I?=
 =?us-ascii?Q?/YcwsmGbAPgf7EKikbkdIhe1CaNPnxXSsbwRnJ6I+/uL5Hb30L5dsMrJBcm9?=
 =?us-ascii?Q?ing1r2a5OlYoKHyzkQdf6qsx2dkXGBF9KuAxw2lWX3TO6oAq0R06AsOEiw9d?=
 =?us-ascii?Q?iNfIUjY6LPAmL9S1/oTMPuV2B77/iHpicAuGPdYwmyQrI5FHQ9Sk/jd0UcS+?=
 =?us-ascii?Q?V1Yvau+0mN3p00o4kAkfVVYgOyuwf7AgB4uEeh6xZFIYfnnchS/z29EonA1+?=
 =?us-ascii?Q?rDmgXRtyS9QXfxNg/u8YYoP2vkRKfDkoUTTfwPw93uTcnHXbRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:33:48.7164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e8ffbd-269a-46ca-5ffe-08dcef797f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8464
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

amdgpu_vm_bo_invalidate doesn't use the adev parameter and not all
callers have a reference to adev handy, so remove it for cleanliness.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      | 3 +--
 6 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d891ab779ca7f..471f3dc81e8db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1105,7 +1105,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	 * We can't use gang submit on with reserved VMIDs when the VM changes
 	 * can't be invalidated by more than one engine at the same time.
 	 */
-	if (p->gang_size > 1 && !p->adev->vm_manager.concurrent_flush) {
+	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
 		for (i = 0; i < p->gang_size; ++i) {
 			struct drm_sched_entity *entity = p->entities[i];
 			struct drm_gpu_scheduler *sched = entity->rq->sched;
@@ -1189,7 +1189,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			if (!bo)
 				continue;
 
-			amdgpu_vm_bo_invalidate(adev, bo, false);
+			amdgpu_vm_bo_invalidate(bo, false);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 8e81a83d37d84..b144404902255 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -345,7 +345,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	/* FIXME: This should be after the "if", but needs a fix to make sure
 	 * DMABuf imports are initialized in the right VM list.
 	 */
-	amdgpu_vm_bo_invalidate(adev, bo, false);
+	amdgpu_vm_bo_invalidate(bo, false);
 	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1a5df8b946616..bc1ad6cdf0364 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -839,7 +839,6 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *filp)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_gem_op *args = data;
 	struct drm_gem_object *gobj;
 	struct amdgpu_vm_bo_base *base;
@@ -899,7 +898,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 			robj->allowed_domains |= AMDGPU_GEM_DOMAIN_GTT;
 
 		if (robj->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
-			amdgpu_vm_bo_invalidate(adev, robj, true);
+			amdgpu_vm_bo_invalidate(robj, true);
 
 		amdgpu_bo_unreserve(robj);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1e6a044e3143b..045222b6bd049 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1148,7 +1148,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
 			   struct ttm_resource *new_mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_resource *old_mem = bo->resource;
 	struct amdgpu_bo *abo;
 
@@ -1156,7 +1155,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 		return;
 
 	abo = ttm_to_amdgpu_bo(bo);
-	amdgpu_vm_bo_invalidate(adev, abo, evict);
+	amdgpu_vm_bo_invalidate(abo, evict);
 
 	amdgpu_bo_kunmap(abo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9d6ffe38b48ad..9fab64edd0530 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2139,14 +2139,12 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 /**
  * amdgpu_vm_bo_invalidate - mark the bo as invalid
  *
- * @adev: amdgpu_device pointer
  * @bo: amdgpu buffer object
  * @evicted: is the BO evicted
  *
  * Mark @bo as invalid.
  */
-void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
-			     struct amdgpu_bo *bo, bool evicted)
+void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
 {
 	struct amdgpu_vm_bo_base *bo_base;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index c5b41e3ed14f2..428f7379bd759 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -515,8 +515,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			struct amdgpu_bo_va *bo_va,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
-void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
-			     struct amdgpu_bo *bo, bool evicted);
+void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
 uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
 struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
 				       struct amdgpu_bo *bo);
-- 
2.34.1

