Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0843676CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B46E135;
	Thu, 22 Apr 2021 01:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697A6E0DE;
 Thu, 22 Apr 2021 01:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW0/TA6sQzOQqDVMsFgv8NsdwRdUd19b+cVfj4gp5F8ikVZBEnqUWqjw3zb4JKMXtKF2iqWtEn/pJaPj2UWdZgy2nDHruQaSiFyJTjZKroi0cUkPeqTYCJKoidSTwIIvlhnd6lKMkFZyFT907jYiayWs8oU8ir2pOGcPmpygIsNFsK7/ntfjw2bzFvYdqs/NCbyXAsFz97bpjPvihWZ6rthYFAuWieC4qaQL3lJGSYaVcPgibCp6EUtiK+O8p5XN27Ta6x6bE7Lc10gCsNxpfznVsPefmi3Bm2An/OEyKhUSQ0UvmIQjBGpr95k6a6QZSWO2prFF4+85YE3DseG7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igF2IJxGaibEBWeZ2QJ4P6MWb6FQIFHlo8eM57cbMWo=;
 b=NX+qIIo7lhMgKSrEvoWP/PFybrUTmXuV1CSOWWy2epCCXtg4RPCEEqBxwqdDjPPD453qwj9bt/hoQsaPxCeD03N0tIHxgYYNDjCqgXoECJ6mmsYub6jfMYTTpkmcX1ZqI4M9McFnzHoU/k059lfC4TVQIaTUEyMI+3yax00QZ/m0Aalbj+XrlmVrB1VnjOrdkIGuQ4uL124CHEe5VdTaYnIAd8FF+Tv8AoDq+okhDgtU65zCbh9UyBy/WnweFj2TH6bggdnyj/nTfXRE3lWDQ74OZYWTOdRtLPl7yDxogkhGoQrVZJ11gL26az7yGQuFNuhNje/m9znriYjwgNQeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igF2IJxGaibEBWeZ2QJ4P6MWb6FQIFHlo8eM57cbMWo=;
 b=JTO1nAdPz/fU9CkOupN5ECb5dhlQn80nv5xvcaSpHD4qFhQjlpAk1uIxtfkV+zacyjT4lvNAO7WRQVJMWSg4VYT2VChs5HBZfa6CnP3aUPMp8VoTu0oZVIATLL3Co7nR81IopIBIZXVP6tOSciWDTHG9wpBd5EfaxYKGqV/cADQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:17 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/10] drm/amdgpu: Add multi-GPU DMA mapping helpers
Date: Wed, 21 Apr 2021 21:30:53 -0400
Message-Id: <20210422013058.6305-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fdfc313-1f67-46f9-ae63-08d9052e52fa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438442EECD201305EE5226992469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCWw7d5PhmrAM36+NGA4LTIVKk4Vl+Nm0sCuLjGX/H8hFx1qi6JMQ+83fUjY0k+Tni0Q4+DW2txBlv0JFzr3tYejd0ZQmiKYy+lZ09wU4RHGOaDt53+lcbBKRH9YtsnOhyEQwqlQf++mWfXNCn44QI3xzH0qL9tiavh7iMFlr+9jsBiBA3RL7o1cdTUKj83PV5Ur4JJG29+AWl/WM1n6nHVa+qY9CgyzQinhVL5LgdMx41H4FhyqlhUULCHX90WxMUdhlqDBjSDodrE+w3+tHbhnWiVB0dGaKT9YkIi7C9kriiQl0Z0kXXARPVLw0dFVTOYQmFSC9XBLGIqwVkrIhxNlU32/VEemf5B9Vtf/Eqf0YiWZn4TuoIeA6FRTBx+GzdoJMWFGIYNU1Wc5rmF0rydRPoR1SsvmmEwdddGaEpuJLxv6++l5gLVu2scZd2f0ce+Q5gUJXYg3nnSC5Fxx7PIlxt7ydG1OSTJ3TBXTUwbMT5CJ0sUvaO3rYH2cJsYt6s3clEqs8iI7babmYEtqtZ9ohEdGoTictp0SzDtMULUcTjP9oELzdtr1IoiE1ni0L0RWjpeduwE7dwcdJY72D4nqal3Q+kJKEhAjemenpmr/ceKsUtrUj5hRj5KeFndw+CqGogTBIqQVeizAvveIgXkNKT7luoPSU2tlHrCx6ck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6kqoVvra5ad2Vdu21wZVvO/EoXk2BwouwafaTMoDyIAAGRWl7yYJ08Cb2mXb?=
 =?us-ascii?Q?4Dio6rBC7/nm/Z1UI1avREotudLUUChRDMb9La+OT1br5YRBEQEV61tsZMmL?=
 =?us-ascii?Q?x/RC8POOJnaYH2h0FBIpxHvFYsFdmHqF+8m96rRarvK1gqnFIuYgjq82qD2P?=
 =?us-ascii?Q?PHQo//o9k1miGeScjh/amLtnXk16z9M97mTDDE/DbI1+/YcAU4tP8G/efcvw?=
 =?us-ascii?Q?j1f1pLrGPFt6TiectRmsbkKO24nz2WIv0LtOQUdWZwZ40jGlSf0HrkoHoXSD?=
 =?us-ascii?Q?nHS9prKqCfoFUPaOhY8MkUTVy+im/NTGfLsGWM9vQRnD/00GafQ07DoZbMGj?=
 =?us-ascii?Q?uYDzRJXLI21NipLBZdDOUK96wbkRfNDcFPg5vtd1f6SfkbNijQKDRf1N1SCR?=
 =?us-ascii?Q?8FEsfE635nB+eMpSjJlTCuFWBHE4lbDfl/4GkhUEfJqe5My3etkUCt1xwIbi?=
 =?us-ascii?Q?Fuxa7bVLznNpzJe86KMyahJPWMpw+qjgtVDAfxzo1XCNUfj1MTOUQQSLhfS/?=
 =?us-ascii?Q?K4Par0EOXdicxbnr5kJfPcwTbTX2EraqJ18bSf2O+jCO7IYGQ8WqLQHAXJ/W?=
 =?us-ascii?Q?ETv9ww/ZlOECj6JB88qkT3VAi7EKcg9kau/J+6Z8T1U4OOUIO3IwayYdOJcs?=
 =?us-ascii?Q?PTCBxfX8cafGJfov9z4j7gup5mNVilEjCEfjebjJOCPCcB5t0lZ2+uvu1lHq?=
 =?us-ascii?Q?dZJkuT9mg5chuW4Da/k1pyBquuYBVKtof3AdGn+L1FKtxDGPiwx6f6ZnAK3U?=
 =?us-ascii?Q?NwbpkO+88cShPctgRPDnPCmDV1w7/ABT/9JWP+dLiYK6IWYicIggITI/PzmC?=
 =?us-ascii?Q?LFIkJ6mqTrUtHcuSH8nRDuC9OrzxwPW4ODkZICC65b1fqJsXElfEqqfZB6Hb?=
 =?us-ascii?Q?GDqJ2sPsxXac/3d6HD8xnLlSZpQPcN07H9tzgJs1A4IiDMG1GHyNYszgYvZa?=
 =?us-ascii?Q?dld1j8l8tt9Vy/cxB7kOVghesgeg1QIownGkgU/8sLd6Vj5he9AQB7/t5/24?=
 =?us-ascii?Q?KbVSO15KmwTliuQnvM6dyJcL1ljMyORLeElRat2Q/fNomHTyvHduOqP1ZuP4?=
 =?us-ascii?Q?iE2m9MlG0wwtA/73OqJ3KRTi01pFCanohk9LROI7xkpxd59mcn6HcGqEaVTn?=
 =?us-ascii?Q?r5yFZ8hJ9E8XSyhnvSyxgVhAGGqB99Y3B287oMIBU5QhdryxE4bOsjJWotaO?=
 =?us-ascii?Q?B5OHl1RRJdORx2a8Mo+2hC315cpBGS9LNB0D/0WSQYsYpUd6XFFj+JdcEsQu?=
 =?us-ascii?Q?4VRFH5N0K/KnUaoPEkSfg8tP8mmhnsp6E+hUW4KrcldgvK6Uj8Xv5lL/WNzr?=
 =?us-ascii?Q?IM7HB8xGCd4rEhoPReLdpWfM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdfc313-1f67-46f9-ae63-08d9052e52fa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:17.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81sxl+h26dL+hJNAeUiacw1SxgTeSg2cyojCApxuifz7JhepmtvCsIlNwsz3pgDNB9W68F3bpWspv0cKiPdyBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 146 +++++++++++++++++-
 2 files changed, 145 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index c24b2478f445..63668433f5a6 100644
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
index fbd7e786b54e..49d1af4aa5f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -473,12 +473,117 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
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
@@ -488,10 +593,12 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
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
@@ -509,14 +616,37 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
+			bo[i]->parent = amdgpu_bo_ref(mem->bo);
+		} else {
+			/* FIXME: Need to DMA-map other BO types */
+			attachment[i]->type = KFD_MEM_ATT_SHARED;
+			bo[i] = mem->bo;
+			drm_gem_object_get(&bo[i]->tbo.base);
+		}
 
 		/* Add BO to VM internal data structures */
 		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
