Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B6604B5B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078E10F278;
	Wed, 19 Oct 2022 15:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9FE10F278;
 Wed, 19 Oct 2022 15:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBfpMRimrYYyGO2jvw31jLb3nuDUz9T8sqX7ZBTnlWSWlAx+3rW78ysG7az6L6Ca/gJGWdHTnCW2ZqtrwreyogUrHYYEWXiVuSYtbOxgS1U92YEGsbYnyzy5QvGMplJxs7eThgGIB7ZidjPCUXFbRaIsPhaMOdZQ3fyooLF8hsRQ4OFDLOv3zK6e4MCMlqvufDEefQgom03RUN4scS+ipdpxg/z01jKLpifYpgjk8uisAfyfrrQAHZi2dy7vio6nytnsVQugMlJ+ahZw8sfYuVhFLuHvcYeU+nlSJIpws9zpsuMcPX00OOcxaCRqv0BGXcOGevsJzkyQt7nNSx8UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mLgxSdMRC/oOsrVgU/r6OiUgX67D+x8v3cjge2PGvY=;
 b=Ovbs1fx+MsT/2AGd4a1D72sOy5oAJPsZgxdfGGX+Xqay0XmznylDG2Wk/TAtZ4/BM0s0QqBipPaQxqFKc6sfFkf0IlW9Ab3K6dcmQke2/AsPPss264sc7hxWFvcOmIF4xp6Sewwhczw9FwvpTPST47I1ci3x+XR+CwLbuI+vgukGyZjIExXeMMM2+jH5yU9t3HDKT+FUAnGlxLWgRErhz6DBKpkZKhfMi0shWYbhHmB4W8mWMQtxgzk20KeCc0RSei56+PEjqZJaF/sBQjQyZXuBQb96SyliKE/hlzZT+V36abVJTXmvErqd/uVW9r0hvRMkvtM6uPkRLxbCJHAPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mLgxSdMRC/oOsrVgU/r6OiUgX67D+x8v3cjge2PGvY=;
 b=26CmjupIxILlHWffmsJzJm6GxrKICSTP9oklfYH37zumQEwm415UKs6sRKwT6uLS/KmnAhjR4jSfJKru4BM4VAeVcCC2KPd/mW9m2HJQUhAf2UwDym1aR3W1vgB7M6quUOjF/HEaUueC/y1NR9XyCHXpQtK5xiGm1tp9oDtbV5M=
Received: from DM6PR04CA0026.namprd04.prod.outlook.com (2603:10b6:5:334::31)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 15:28:23 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::57) by DM6PR04CA0026.outlook.office365.com
 (2603:10b6:5:334::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:28:22 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:28:18 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/ttm: rework on ttm_resource to use size_t type
Date: Wed, 19 Oct 2022 20:57:31 +0530
Message-ID: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 4040917f-4672-4115-be2e-08dab1e68f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPpnTVUFiO6fL8V99C0hjDcMV0jKdpLuLuDw6bwt2GuM7rLP/jmjGmhynlNZMTAkVMwtpg0bDw6ieRg26cCCqfFD7KqYwMIaRAFba3AXLRPerQUIwjthO3FDDPNoKy9Uab7xBQc8VzQ+pjZ3oV1plG+oLnXN4XbgCSF8rbaCnI5czNd4xauv8ljFkK7hHBgdBkAhvJgkklK2I0cAReu7xFTDcYz3oiszr3jrP3+2Ftmuyaw7xlt9sz1HzbDqLk8Czg/WizzbM1joktRyc2wdrxP2oB/8V9j3Vbt5F6z27jZAJdtP2Bck31kr+/anmYfC8F0aU0Xq/R2GtCPEW3qhzwts9v3nDzHKO95NuKmE4fkUjmj7bxc5A/KuRSfZreKH8nL8kLm3DAKY4njwF9gOb4zUjOwyJw61GxSdr2sglrdxUr9Ja6eexwPxhHZai4Q4RHELf3mTqkZ/CIKd6WOGsPxXAxSjDnf5MR8HmYuF5TEKEXfj+7kPZtHoU7nToY6H4VQrWlxWJCniJyP1pRPuvgsRU3WEgQ8j64y8Tx7AdrCBpToepuHsMrReRQDgXwgagWouTrQCfxdzYL0GqQ8ii7zHBHnoe8ksnKKRCcQjkmugP+8aiO1p9IT+uWxp0CJ1J8uWGSc3cFtk1oXpvcwVtOJGkiRH0H2Clh7AooYgo0QvEPNYutfZMKQxIT5PpcgFL7N/cKpVpqyHih1uDSgoUHa7GJxoLF/EpORN4etOKQv44CBZLKlHt2Y6MTKYkLxUBWGJvvR0jt049QsRXLkyV2RbcBbEbVq56x6GnUpstviwMbUSCZPOMXhhdA8gShuv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(81166007)(2906002)(8936002)(356005)(40480700001)(82740400003)(41300700001)(40460700003)(4326008)(36860700001)(36756003)(8676002)(70206006)(70586007)(83380400001)(110136005)(316002)(47076005)(54906003)(86362001)(2616005)(426003)(336012)(1076003)(16526019)(186003)(450100002)(26005)(82310400005)(478600001)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:28:22.6792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4040917f-4672-4115-be2e-08dab1e68f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change ttm_resource structure from num_pages to size_t size in bytes.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c            | 4 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 6 +++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c         | 4 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
 drivers/gpu/drm/ttm/ttm_resource.c      | 8 ++++----
 include/drm/ttm/ttm_resource.h          | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7c8e8be774f1..394ccb13eaed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -51,8 +51,8 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man;
 	int i, mem_type;
 
-	drm_printf(&p, "No space for %p (%lu pages, %zuK, %zuM)\n",
-		   bo, bo->resource->num_pages, bo->base.size >> 10,
+	drm_printf(&p, "No space for %p (%lu size, %zuK, %zuM)\n",
+		   bo, bo->resource->size, bo->base.size >> 10,
 		   bo->base.size >> 20);
 	for (i = 0; i < placement->num_placement; i++) {
 		mem_type = placement->placement[i].mem_type;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fa04e62202c1..da5493f789df 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -173,7 +173,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 
 	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
+		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
 
 	if (!src_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
@@ -357,9 +357,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 
 	map->virtual = NULL;
 	map->bo = bo;
-	if (num_pages > bo->resource->num_pages)
+	if (num_pages > PFN_UP(bo->resource->size))
 		return -EINVAL;
-	if ((start_page + num_pages) > bo->resource->num_pages)
+	if ((start_page + num_pages) > PFN_UP(bo->resource->size))
 		return -EINVAL;
 
 	ret = ttm_mem_io_reserve(bo->bdev, bo->resource);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 38119311284d..876e7d07273c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -217,7 +217,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	page_last = vma_pages(vma) + vma->vm_pgoff -
 		drm_vma_node_start(&bo->base.vma_node);
 
-	if (unlikely(page_offset >= bo->resource->num_pages))
+	if (unlikely(page_offset >= PFN_UP(bo->resource->size)))
 		return VM_FAULT_SIGBUS;
 
 	prot = ttm_io_prot(bo, bo->resource, prot);
@@ -412,7 +412,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		 << PAGE_SHIFT);
 	int ret;
 
-	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
+	if (len < 1 || (offset + len) > bo->resource->size)
 		return -EIO;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index f7c16c46cfbc..0a8bc0b7f380 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,7 +83,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  node->base.num_pages,
+					  PFN_UP(node->base.size),
 					  bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index a729c32a1e48..f9cce0727d40 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -177,7 +177,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man;
 
 	res->start = 0;
-	res->num_pages = PFN_UP(bo->base.size);
+	res->size = bo->base.size;
 	res->mem_type = place->mem_type;
 	res->placement = place->flags;
 	res->bus.addr = NULL;
@@ -192,7 +192,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 		list_add_tail(&res->lru, &bo->bdev->pinned);
 	else
 		list_add_tail(&res->lru, &man->lru[bo->priority]);
-	man->usage += res->num_pages << PAGE_SHIFT;
+	man->usage += res->size;
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
@@ -214,7 +214,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 
 	spin_lock(&bdev->lru_lock);
 	list_del_init(&res->lru);
-	man->usage -= res->num_pages << PAGE_SHIFT;
+	man->usage -= res->size;
 	spin_unlock(&bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
@@ -665,7 +665,7 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 		iosys_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
 		iter_io->needs_unmap = false;
 	} else {
-		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
+		size_t bus_size = (size_t)mem->size;
 
 		iter_io->needs_unmap = true;
 		memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 5afc6d664fde..f93c9e52b063 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -208,7 +208,7 @@ struct ttm_bus_placement {
  */
 struct ttm_resource {
 	unsigned long start;
-	unsigned long num_pages;
+	size_t size;
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
-- 
2.32.0

