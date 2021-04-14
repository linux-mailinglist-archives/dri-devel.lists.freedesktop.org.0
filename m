Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342C35ED7D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29D16E8C8;
	Wed, 14 Apr 2021 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FEE6E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtnCfGTSAqzUmKbeKs+FknA1Ojxa5RH5z1B/3ZYvtyHThzljNnf8M0BlqjoOxXBzccR63bQd0Dx4yl59Jz7FUHfY91XN6TuVwSGyAAYy3xv1CqNsbYoIXUIaEWUZFyDcLtZ1uBZSuVRngBH6OmtwQPBQdoNxep8VubYJU1BO1VlEhD+56gAl0iefVSZMloDre5wxLqdQIW6OaF6OllJL+NdJEqpkLL/9NjYjbSnck+u3QBadrc8zKzqmdnd0om58px2cXgii84alRxaYeSVWCYt884tRSksPcKQRUVBsc5SQIAHmBavya1r5uGitDCz/9XmaaUXFTdhJa47MseqF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TK/o7AidCakKRfTtzZvV0HJAVQwbNXls9+EfNohUvJk=;
 b=ZwpxrWT6yx45e72KcMQgipvP9NNVX5VFS6K+23G8V52p4Mtse6/k60zqPASpPWX033T0vfoZ5Y/NdH2yAQGrNzcNd+CN05rlPZWZMrT+Jp8d07dFR54EMPkHYaOAzuVGguDFlCX4JEkbAhlKY/b+zY6Y/dc2mozs6XeTYM1lCFZwMlfsIB96b0sryqOxnnW6KiHs83Ay/xtnY533a2FECPjr/EuKnKRUXZ/FUdwoOCpzDdqGWK8WMKkprHi/nZOLOEKg8JK2GLzz266uMqbl7TQ2vEfe+cTlwnMyc7AUCu4E6J3sbEiiElPS/nGqe4kcygc9eEwr7omfzyudwIYipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TK/o7AidCakKRfTtzZvV0HJAVQwbNXls9+EfNohUvJk=;
 b=mIxXLp2E3embkKzCwKQghqB+5j7c/alMQ3yxl568Z1Of4Z8/xLqq8vUuYq/mnuEZTE9QbqhF5LIv+H9vwWl81A3Hzq2g5l1QvQ51aQ8t8VDMpHW4HbRpG3tbUs95APnn6a6I7lJ439AyWytDbe/NVurHTz7oVGems2EZ/gkPduw=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:46:50 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:50 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/amdgpu: Add multi-GPU DMA mapping helpers
Date: Wed, 14 Apr 2021 02:46:16 -0400
Message-Id: <20210414064621.29273-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5e7ae56-ce60-475a-9d8f-08d8ff1114b8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4689AAB9CB54421D06631C7B924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66hUke5qMA5BDDYO9syvDdWjv+QEugsDHfQQ/beIkc1nEyh9rtFxbM9SbF3ZE+mNflkUkT8+HWVWPTrXbSvIgN0TVJuWnCGasfCjMdnnN4Frxu+zmN+mBnIxQTTnAluRn/9YsYv1EhV4sGHVMUsDY0jLv+PXf4QFZ2nhOp7ZyPnCD6pqhUGpefAtEFvtR7oBDGZ+M7aRXbqHEjIZPv1rOYXbM0br4B8dbUjzDtIK37qyb1p7vq8dJo18VfEhsFtXu2AxpXbqzrwRMKcRC+cFXdgIwUoRnZvi7mBP4omn00IL8v9h/b3+GKazV8XsWvaenU2PFIDx5KsXe5L8GQHHUZeZA07MHoD1VfuydhXX/DcPP45+cGenVuXxTcYrHRe3Nk47Fx9CgSJ548ZHOsS6neBQQUBfL1B60aJPV3/rsAtas7G1XGcyXMY6MX7zPK6RZvKqYB44+fazktNXRUNyGG3y/Xuy5kyuR4gTZVMTLwnN+zFIGt5pgm3w5zg+a5yCqvHgtGTyNBCa7Fa8P2wUIq4PzAP8SOX7eBSz7a0kcd/Ebn0ffuCdAHeBn6xpqTO1S43/4WAknttVyWzaoKgQziQ2Gr4bjZO1IbeQYL94KWK4QWEJirYyDj0YD3mhwvZr7MRqW/wauVd+1ncwxXwiBvPIjOJvyH09Y3mVPCHsx+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bhDOYdf9pnvp5geTItBW72J7PTQcU2ZacDnB+X9gzVQDqXFrYni6Idf7Gmtk?=
 =?us-ascii?Q?A5bIQyZ8V9RFCW71neHOFB3861gmdjzZnfIEHa8MZahPaQ5XnyhRoKBRXRVP?=
 =?us-ascii?Q?b9unjnmPqeO0SKYpAslzjJ5VHDuRGJeU5TMMAbQkLwCWaV2LQgz2UY5rRvDs?=
 =?us-ascii?Q?P7cImSRYjLtf4HmZZ/Xm4sl0mXR4923dHNqii8kfrYtc1e6326g0D31Z+UXc?=
 =?us-ascii?Q?kt6BZPvINe9QR4WUsKzapYNns+eZYIQ3jdfoZYMghI+L9qF2b5yiMjsLPgC0?=
 =?us-ascii?Q?alL0WxmYT9NARtILfoFoApzhrLh5dErlHaVhUAAbv4V4LUMgVfa0phQJQiC0?=
 =?us-ascii?Q?jU2Rakfk+0lGcf2gNVWEcyMNHsngeMHsMVgAnZh6MRBFIb5tAssQg+dUiQG+?=
 =?us-ascii?Q?xq0ijak6DAFl6MQ64jn2HjBiY25EVrqRlSr2jN02/pYk2JTC3SCKga3tnuiX?=
 =?us-ascii?Q?tnt1BtaKu15F95B07HX1LQNqWiPSQ2yVNtwG++dnufbDYSpM/RPomUvi4p4N?=
 =?us-ascii?Q?q42Mlpr0WHGnWvoJSw8h4xkPU9kyfRZ5+Ls6e3gwGF28jk100+pqjpzrJssX?=
 =?us-ascii?Q?4TeRJdVcPLcIxKRg3EV6AZJx09D8l0yhdLT34SKJcyuDuLORW6CaPpukDv5p?=
 =?us-ascii?Q?8dMfSavX+xG/2EaPawILSqaXNYVQu+7atAbf9G7kIDgo9F0jEap1iW1FMn+b?=
 =?us-ascii?Q?9LiZMlYDt18R2aVNQkcrsbhMtHkNhhQEEki7U05msBpd2XPQURsJqwMXTVyc?=
 =?us-ascii?Q?w/9x65JdHlTtmzmsVbRxmsaHMNj6JolCHYwzqKVfZ8cLXUGlV5d803RGnWxA?=
 =?us-ascii?Q?jF/L2/tkFZGde/iIeRtqKU98fSvqoB9L46/ThnSd/ZTIZLmr1yPaYmV7leBB?=
 =?us-ascii?Q?fsrM0Ve45DPfsfEood0xeIGHnZnEAar2Zu1JuZHsOdKvpa7vAgigiMvjDbbl?=
 =?us-ascii?Q?QXNHclEn6SdbtMgmlvid+9FCu6TQ5J7DCZ3yuRUXtknuoFFuIZcCM0b/+Zsx?=
 =?us-ascii?Q?6Al764PnpXuZpw7ktxmu1asdelCLZFTjuOuS7EDPTWPJyMNn4eaHV/e0nE84?=
 =?us-ascii?Q?2hWVUUV8KQKU+RlzkiDj5hdZd9RL03QOxKDw9srLy/wyoOifFUUocIIezrmO?=
 =?us-ascii?Q?ZDtTY/EIUpUmuBnju52GlNLFS9D3XxW4h6T7/+4P7wdKrcfhEFIr9qktLjIL?=
 =?us-ascii?Q?zla4M0NuWWiI5M4vndMMio1JtV5w8U/Anqfi3OTgEAN1pWSmb/4TDk9mgtqV?=
 =?us-ascii?Q?R/aB7eG+Ze1oxQvs1pzQc7gIHFC0xBgHZNSPUibFEo+rzDTxHzMIAFOOkdp7?=
 =?us-ascii?Q?BoLBp3aoDQ+We4YRmDrcdL1Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e7ae56-ce60-475a-9d8f-08d8ff1114b8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:50.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etozg09eRUhqQPChEkVcNJ//KfL/FDjlfy99emQpPVi9nUPVnOB5OSC2jXxsR3Lmj+fG3jSvKT3VxHhQ8r2GtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add BO-type specific helpers functions to DMA-map and unmap
kfd_mem_attachments. Implement this functionality for userptrs by creating
one SG BO per GPU and filling it with a DMA mapping of the pages from the
original mem->bo.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 155 ++++++++++++++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 910c50956e16..fc3514ed1b74 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -38,11 +38,17 @@ extern uint64_t amdgpu_amdkfd_total_mem_size;
 
 struct amdgpu_device;
 
+enum kfd_mem_attachment_type {
+	KFD_MEM_ATT_SHARED,	/* Share kgd_mem->bo or another attachment's */
+	KFD_MEM_ATT_USERPTR,	/* SG bo to DMA map pages from a userptr bo */
+};
+
 struct kfd_mem_attachment {
 	struct list_head list;
+	enum kfd_mem_attachment_type type;
+	bool is_mapped;
 	struct amdgpu_bo_va *bo_va;
 	struct amdgpu_device *adev;
-	bool is_mapped;
 	uint64_t va;
 	uint64_t pte_flags;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 114fbf508707..51502a07fc1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -471,12 +471,117 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
 	return pte_flags;
 }
 
+static int
+kfd_mem_dmamap_userptr(struct kgd_mem *mem,
+		       struct kfd_mem_attachment *attachment)
+{
+	enum dma_data_direction direction =
+		mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	struct ttm_operation_ctx ctx = {.interruptible = true};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+	struct amdgpu_device *adev = attachment->adev;
+	struct ttm_tt *src_ttm = mem->bo->tbo.ttm;
+	struct ttm_tt *ttm = bo->tbo.ttm;
+	int ret;
+
+	ttm->sg = kmalloc(sizeof(*ttm->sg), GFP_KERNEL);
+	if (unlikely(!ttm->sg))
+		return -ENOMEM;
+
+	if (WARN_ON(ttm->num_pages != src_ttm->num_pages))
+		return -EINVAL;
+
+	/* Same sequence as in amdgpu_ttm_tt_pin_userptr */
+	ret = sg_alloc_table_from_pages(ttm->sg, src_ttm->pages,
+					ttm->num_pages, 0,
+					(u64)ttm->num_pages << PAGE_SHIFT,
+					GFP_KERNEL);
+	if (unlikely(ret))
+		goto release_sg;
+
+	ret = dma_map_sgtable(adev->dev, ttm->sg, direction, 0);
+	if (unlikely(ret))
+		goto release_sg;
+
+	drm_prime_sg_to_dma_addr_array(ttm->sg, ttm->dma_address,
+				       ttm->num_pages);
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
+	ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	if (ret)
+		goto release_sg;
+
+	return 0;
+
+release_sg:
+	pr_err("DMA map userptr failed: %d\n", ret);
+	sg_free_table(ttm->sg);
+	kfree(ttm->sg);
+	ttm->sg = NULL;
+	return ret;
+}
+
+static int
+kfd_mem_dmamap_attachment(struct kgd_mem *mem,
+			  struct kfd_mem_attachment *attachment)
+{
+	switch (attachment->type) {
+	case KFD_MEM_ATT_SHARED:
+		return 0;
+	case KFD_MEM_ATT_USERPTR:
+		return kfd_mem_dmamap_userptr(mem, attachment);
+	default:
+		WARN_ON_ONCE(1);
+	}
+	return -EINVAL;
+}
+
+static void
+kfd_mem_dmaunmap_userptr(struct kgd_mem *mem,
+			 struct kfd_mem_attachment *attachment)
+{
+	enum dma_data_direction direction =
+		mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	struct ttm_operation_ctx ctx = {.interruptible = false};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+	struct amdgpu_device *adev = attachment->adev;
+	struct ttm_tt *ttm = bo->tbo.ttm;
+
+	if (unlikely(!ttm->sg))
+		return;
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
+	ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+
+	dma_unmap_sgtable(adev->dev, ttm->sg, direction, 0);
+	sg_free_table(ttm->sg);
+	ttm->sg = NULL;
+}
+
+static void
+kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
+			    struct kfd_mem_attachment *attachment)
+{
+	switch (attachment->type) {
+	case KFD_MEM_ATT_SHARED:
+		break;
+	case KFD_MEM_ATT_USERPTR:
+		kfd_mem_dmaunmap_userptr(mem, attachment);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
  * to a VM. It can later be mapped and unmapped many times without
  * repeating these steps.
  *
+ * 0. Create BO for DMA mapping, if needed
  * 1. Allocate and initialize BO VA entry data structure
  * 2. Add BO to the VM
  * 3. Determine ASIC-specific PTE flags
@@ -486,10 +591,12 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
 static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql)
 {
+	struct amdgpu_device *bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
+	struct drm_gem_object *gobj;
 	int i, ret;
 
 	if (!va) {
@@ -507,14 +614,36 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			 va + bo_size, vm);
 
-		/* FIXME: For now all attachments use the same BO. This is
-		 * incorrect because one BO can only have one DMA mapping
-		 * for one GPU. We need one BO per GPU, e.g. a DMABuf
-		 * import with dynamic attachment. This will be addressed
-		 * one BO-type at a time in subsequent patches.
-		 */
-		bo[i] = mem->bo;
-		drm_gem_object_get(&bo[i]->tbo.base);
+		if (adev == bo_adev || (mem->domain == AMDGPU_GEM_DOMAIN_VRAM &&
+					amdgpu_xgmi_same_hive(adev, bo_adev))) {
+			/* Mappings on the local GPU and VRAM mappings in the
+			 * local hive share the original BO
+			 */
+			attachment[i]->type = KFD_MEM_ATT_SHARED;
+			bo[i] = mem->bo;
+			drm_gem_object_get(&bo[i]->tbo.base);
+		} else if (i > 0) {
+			/* Multiple mappings on the same GPU share the BO */
+			attachment[i]->type = KFD_MEM_ATT_SHARED;
+			bo[i] = bo[0];
+			drm_gem_object_get(&bo[i]->tbo.base);
+		} else if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
+			/* Create an SG BO to DMA-map userptrs on other GPUs */
+			attachment[i]->type = KFD_MEM_ATT_USERPTR;
+			ret = amdgpu_gem_object_create(adev, bo_size, 1,
+						       AMDGPU_GEM_DOMAIN_CPU,
+						       0, ttm_bo_type_sg,
+						       mem->bo->tbo.base.resv,
+						       &gobj);
+			if (ret)
+				goto unwind;
+			bo[i] = gem_to_amdgpu_bo(gobj);
+		} else {
+			/* FIXME: Need to DMA-map other BO types */
+			attachment[i]->type = KFD_MEM_ATT_SHARED;
+			bo[i] = mem->bo;
+			drm_gem_object_get(&bo[i]->tbo.base);
+		}
 
 		/* Add BO to VM internal data structures */
 		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
@@ -557,13 +686,19 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return ret;
 }
 
-static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
+static void
+kfd_mem_detach(struct kgd_mem *mem, struct kfd_mem_attachment *attachment)
 {
 	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
 
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
 	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	/* FIXME: For some reason SG BOs don't get individualized. Do this
+	 * now manually. This is probably not the right place to do this.
+	 */
+	if (bo != mem->bo)
+		bo->tbo.base.resv = &bo->tbo.base._resv;
 	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
@@ -1376,7 +1511,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Remove from VM internal data structures */
 	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
-		kfd_mem_detach(entry);
+		kfd_mem_detach(mem, entry);
 
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
