Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045D35ED93
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5CB6E8DA;
	Wed, 14 Apr 2021 06:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A347D6E8CD;
 Wed, 14 Apr 2021 06:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ5SFqyIM+CQk43f+ZIP2r0tvb8WqggOrOr7d+yao2IgN37yHcMBL+4GvpcrLRMdw5ieKMwan2hMyweel+VaeJhoQifEPpElFcZoOBoYvaAkE32yA0FxB+s5ILzp/vzz680HajgAY/KVyTC9H6/+jsI5y0zjGgOGv4HP0HL2QH3Rm7SFbNqz/pFebFmxUyHOrpgke2Bfa0EI+aygqR7d+9KMDnwJAPYdbRUxd2Drlsfzrs3NvV6W75v1A4DBJpxfGk98NcSjW+Vbup/JcJhDLKYjSBp3wpXpNKP7OYqHmm7pFmdsHDs89ym0Pj+krlDRX0gw74hHWi1OlnJgh6hCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TK/o7AidCakKRfTtzZvV0HJAVQwbNXls9+EfNohUvJk=;
 b=CRsE73VIqpdxbsuvxsxhEZz4eFIiY/V9sEfKgdQR0mieR/LD04yHjc1U7H/qqDS54IEFYaEPrqHCxX2Ll3561K+18uY8r8qrcAWXIiRr//eaHOmm8KQGqSzrLCvmZBVFqtlbpJRInoAx18O8YqzarQMBxshnLg12vEiakSvZpWeagttkJprs25cxKunktuNYikkdTl74pSZoHVoT5T89rtrKtWxL2h35rgGpa4xsIxDL4iTOwm7gULxH3CzBAKSdxDtYaRqU8qaZVC5sWh/QJfuKWx0MI39rnm9GG7+l3xqJ1USirOG3KYUhD0WdP/Lq9fEhprNvwlux2eJ55li1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TK/o7AidCakKRfTtzZvV0HJAVQwbNXls9+EfNohUvJk=;
 b=TnHbU8altQeoU8bxJXzhpmoqyYP+wBsjDH67A54Oo2C4LGz0N6zdDiax45sqIIiwXUTx7kwNfwklWOP1dmD/HrGeWHFx6hQcpqd77iTSfCGqPPxn4NMwdiZcPeay1i5XGEsiS1v7XSSWQQdc8tqf+qSBVuTZjx/FP6w58gZwF7w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:20 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/amdgpu: Add multi-GPU DMA mapping helpers
Date: Wed, 14 Apr 2021 02:47:59 -0400
Message-Id: <20210414064804.29356-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f09728d2-af67-44c0-d2a9-08d8ff114a43
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125122426A42216C6C0AAF8924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNnpFX/4LSs9fEr5T3C/SiVMih3e4hiGCzTaQMrIaQCpaW1yC+TJxPcR4t760rmFcYhH7gNnkJse+cOqSSQqFzr2x+6YM3eETWKxrLNlm/DDrLPPobJeIL7SoE0lIMTN/prVCsRNjOhiqwxbJn8C5+oH53c7hjTy5R1hZ3v3VA+3Xg/Radcoi7KJ3rhWPSHdh77/cl4DRRm4RbJoYtSRaHIgxdf/XISXeYqlOlp+MSuIMF42hWIhVcZk2cLsXOObGh9kqQsEnn0Han2Ki+uhlkrBmiNU51LaweiUoel8/5Q/I7hM1OHkqkLw+6J6oDCQY33vLTZo7bp7v370AgkXhAydrkyqL9KBD+5CWI6ikhSyi/3JCAUfxeV0Q+TJIzzJQSHC8yIPMegwqdeZ8iQgXntUulsTMjzcAeTMFYuF27KyFRRdD9XcMI3U4TLh4u/COHjeEK8xSJxtEkZ1ArXK0UHCK5b/W7GmXp9WqlHoNCYxjq5Y5UZAGhDLSNQmoihIsYhKQ1pyHqIwRIAYl9aBfBJGCPCddbAB7rXj1h20d6QgPwRmI7+9cWn3OjUTH374uTGkJ0tR9pzjvNZsILAxoa4saErLbJA+vWADaKTMKRCvdZct0ysNUwts2D3BAhnTVMoQ1HgLbsUzIMHwL4efbSjRvgZ3i9OXHohkSPKUADY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Wzcj+BQfsJO8bexCzZHLN0reDNJ+X2fImMYciOz0dVkH5aRf+I1ayDAS7Qcg?=
 =?us-ascii?Q?eQ5A7wewWteSwDWdDfZehMWl0EgzuwGM6zlKWZyQF2zVaLnoJmlIA392c0f5?=
 =?us-ascii?Q?bAid1ds6QEqO3+owrxIcnNTO7EAd7MZAdAD/4HxdJXv0QXJ0IBCufQV3DV+J?=
 =?us-ascii?Q?5FFmwgOP8aMybz27hF94KMsC+TbzCSvmdYbMi2S+qgMjdf2w2lkniLALiYzt?=
 =?us-ascii?Q?193Sd8ra1nZFb3SIx9qYwaIrJDvI2A79uRhBc8UHVpt/Ku9sPvGSUCQCwpj+?=
 =?us-ascii?Q?S2fWerAtBeb9xTpBS62UWJEOsrFRJ7zZBmyiSx74jeWGIHXRv2Lia0BC+Huz?=
 =?us-ascii?Q?dIz7sc2fd8U3q7slx6Mu9BX6Qm6ajwo7xqIm7hSlZhso+6rvNnOlp9dolm7O?=
 =?us-ascii?Q?DDPJxzJ7ChW2zyztrfAG2vrgxzBMsYXf5G70SWaGSl7ZHUW0jM5FqmBGZ8bB?=
 =?us-ascii?Q?xuiHBKxIjWezoyKeja12H15m2wjRQerb1yMwFO+LE1qXqwOLFOlvgA11pv5q?=
 =?us-ascii?Q?2RZlaZkDvBVzrxrw9jzVjrdXNkqcB0JlzQEWuO0er1sSeGQgPKOSdUax1SYS?=
 =?us-ascii?Q?cTqVbCOIyral1WD2t/gOuO8x7n47haR8ikO65IKSLH1NY02bMxzVNppi5bk6?=
 =?us-ascii?Q?aSWvP60oUtHTecKHcpdd+Borj8RiDaVmDc/ndfVwsH3LnlBfHQi3XRhfmUwT?=
 =?us-ascii?Q?Nl4R6+ORwIp7VxNulJ4M7ZPALfKk0rSeLa3Bj2iOritpPvcC/TGXBnLk9Sq1?=
 =?us-ascii?Q?LfQcGdauE5r2T+NjDpvwWWeg7P/pI/6KxSCFww6XfcUfiHYjhBYu04B3epYF?=
 =?us-ascii?Q?PjafHY70uk5ksI6pmHURwCk84nWP5PyYQ7nISlIOgsWhxM30et3R6qW4V4Gl?=
 =?us-ascii?Q?gp/WfOUQx3/6yWUYsr+drRMqqiJPVKhoJSkZkx1SPIJ2cgxTfeqCIyPeQQqZ?=
 =?us-ascii?Q?SQoLx8zjpwUw1HBWOBnOodMDbKK8shn51OkFBW37z/4IJPxnPUKs0z5vC8/Z?=
 =?us-ascii?Q?XDCQUdAdDOqk6AaazNIz/U4rYhgR+xw3C8iJ8qz+Bs7jlD2T1UUQlNroDdrR?=
 =?us-ascii?Q?zGqmUgQCEjiFbdUgiUKNZJz7NBq9YQoyPMgBvw0VSI/Y8NNScVj3WpEX9PdZ?=
 =?us-ascii?Q?Gy75tEkryfKyFQv6goU5GvNLgSEKCy+sViamgYUkgeUu+J7HqkBznsQJcHCJ?=
 =?us-ascii?Q?J8nMr1hpgc36PJnrNKkbmMTrmN4Q8mClocVkQla6gqwiJchedmJc3W+vcf9a?=
 =?us-ascii?Q?uB2eykgFpbsvLpk9lwfxh5rrshYaNa/FRNzn5Hb1cX5fIAqIK6Ra5oY2gapR?=
 =?us-ascii?Q?6bw34g42ogLw/PIxrUhPcjOt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09728d2-af67-44c0-d2a9-08d8ff114a43
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:19.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpnQkwuXY/9dvo0MQaDG/fyscirveShA9eEfhnnp5JYEh0OOccj/mfzJWoV5fDZF4pusiCQ7O8mRMWGlo9fu0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
