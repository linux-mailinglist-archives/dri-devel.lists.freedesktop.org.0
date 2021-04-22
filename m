Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D03676DB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F69B6EA29;
	Thu, 22 Apr 2021 01:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8E46E9B9;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMfjgD+c4/jLJ3PGF99L0WzlseGHc/N0Pa+bv/fjnowDnGBPviZ0GvyFDhBA53wqYCSgBufftHyJ2vIseCg50RTyRa8vRPZOUDgJzsmvXW4qy0bCA6xYJvwu616EhynBD1uaAKQ4/HhkJ3HLAj68yD1QKZlTR3N8xgm4lxXdbMiUueeSzH85/14d6zUj19Hjg9SQQEcuF2vG1Vdy7SVlTbkOItODRu9PZfmJjQIrHb0ZQJAOLgDLgzrEupqF6eqIPLgUjC1necZ1RbQQXY2uxNATxpJXa33b+OYjI9FpBKGqF4QwxijZX9hzp7i/YN0j38pBcf6QILYwbMnv88YryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OSNqCVUPE4iCtBCcI4bMlwtQqGaY6BGBy/DPxKZQRg=;
 b=J4nnhbHOQNF0eYz4mrQ8YbuS/KrMXXdwzyz7Bhtcca4GJgWryLPrRzqgiAOoNWPUdf/ZegB0VcLrP+Eua1nMU56jg1cX0yuIJf8vA8t28R533SKKhQMRTmmo8DVwT3F6/fa2/bNJqEuCG0RCsMff4ihQF5QPTG0K4wp1YaMx0XpseSh3FMmzPLF8WemCmhB10PsYc8o8Nom1f9OMRpnLFlhc4xWykx6Exct7zkGt1UBDXwmj2XCKJ28hX7LTpndcTpyabc9eMW1jyv69YRgfQsUyVezJUOKqkuWeUrcxllt/7hb6lfrY08+tJ3RvTds694JjbpnvTWuGSm/CUBN8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OSNqCVUPE4iCtBCcI4bMlwtQqGaY6BGBy/DPxKZQRg=;
 b=gNhjN9z+HiMN+jO5PpH2eLsxmJ23Ct3V9Gm31drUk+xoqWNAOwPrFR0k5YM7T15lYFxo4/IHH0TLapal7ONQqgd5DX8ihcrUtUHCVIpEeap+z9KpZ3il5qrsJclZ1XOTmvsCbhBcL/BZT6hJuN/IJDZEws7GJPO/2DSbF5rpZ6k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:15 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:15 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/10] drm/amdgpu: Rename kfd_bo_va_list to
 kfd_mem_attachment
Date: Wed, 21 Apr 2021 21:30:50 -0400
Message-Id: <20210422013058.6305-3-Felix.Kuehling@amd.com>
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
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0debc9d2-a24a-4991-baec-08d9052e5240
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44380F808CDCBE4E6184FC6192469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fN9TQOvk06sY5piT97zvl29h9WbvhcP0YXQr82koOxJk5pNsmTu4NZVNVkfWXh1feV4K+rjoWJX2sE+TThnZYSNC3mNciN87NgkSShoaQbM+7qADVgGZprGqcLeOVEINKMQswmVYKSMcEyKWnoWC/k7IzQ1voh1KFsOasH3yFVzqHO22Wer3YIsqV4Z9/fxtFTHOaPVnpbgbknOAHjj78Xzror7MPJruQRPC+AE+ZX6avYX5GLOqfqGPakIkMGSyzUMUxAeIX1ax8bSrm+oTPi+BdqAsYtDr8uB2IcGilsZMC34HTAlBdD8+JLc1a8NrR/Tb86ZsLsQe6eqErJbv51WrA4gxlhfTRtzcNyA0KuArFjv5caM/VvG9EGhMO+VHPoT8gyBEGfxZcK7TsX7xUfBB3I8Lq5w8zrvyFzQLUdRGXdGto5Gt9rEUIuLZ5ZaQgSe4KHYhLwSy8DKyi0i6vSxa4qI0Xfn/+5GkQxMltqIgoWSvQ7IqfwhxapuMDael10n58Ah9cfdllorRYZjTROwJE5fW9Ew0b2/Xpvjk8Fj6CzqMl1CjpNqhdMNJ5H86Bsd8x6YcvELA2psZjGLHz7c2AA/Slx5zC6Q6SdP4KNY84abv3UXE5DpaQrmxgFHEdu0+uYncTWES2bC5gTR28KD2YDMRvjZs3jhkYBkEL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(30864003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UXesu930t6fjQYMYfYUcjkF8uk8sNwne7GCVMO6iURCPbmkgA6UQB+XEJ/28?=
 =?us-ascii?Q?BiaQchsP4b99+puMDlktqx1UF4fN3TBMDKy6jt8O4/3/KEdUrGykg+jAjyB4?=
 =?us-ascii?Q?KwGCh/ozhtJpjN3hyOMeoJ05Q5ONwuXCb94Job5KYHIsDbd5wAvf5Ah3O5wc?=
 =?us-ascii?Q?abFKvvSbHQOskx354nT0imcfa1Vk+q7xqsk5Gt9uROTDveA0JAknepZxCQb0?=
 =?us-ascii?Q?VIlKPIebSTt1feahvZd8dY5jPtL4kITLcnyqWwjsnUPfErc7uo8fUTVrvMvH?=
 =?us-ascii?Q?s4hPq5D0KhL2NeWQiz7hcW+GIZyi1s3y0MLN2Kzjqfe52gOJH1i3T44aAb0H?=
 =?us-ascii?Q?LOiNQLS3dSopi0nwTEv3hEv5iyMrxnhXnR11DljKTQE43ShX9+AVFYLXMtCC?=
 =?us-ascii?Q?0wDxs7B364KLs5X+Dbu3N0E/Z6UTKs0sEqHpdLcAs3GAo9s/EVu9KJUOPwWm?=
 =?us-ascii?Q?mBiRZKrGpSi2hN/jNglPhjA9XtYv2pZpi13lZx9u/ir4aEynmOrS43mdqC3C?=
 =?us-ascii?Q?9OcSYTSEhcYITYOhLDSj208lEeXUp107YAxRtUyPGFcdR167ZBOV2Z7JIMDD?=
 =?us-ascii?Q?N24Ulr63qnhsO55rl/aUjae9CuVZv7DKZseFgD8+SAkGeTIfTT7kmtwbTMVc?=
 =?us-ascii?Q?QKqpTuOIT+Uvyx98ca7KmBbhvaR+UVF9cSKrZe+GTbbX5TfQ3pGfYlv9gKQ1?=
 =?us-ascii?Q?0nrZCcfug82uRDSxHl2UxoWoLGkrN1FXIVm+CRKcQW+nTvtAUC22LdzZrZrm?=
 =?us-ascii?Q?tk87Q1dNCZOPN82hAN+kzmSdt+azHAPknHlN7z+J4qkYK/h2TP2PJdh0orU3?=
 =?us-ascii?Q?erlvyUfn17siYLfK1GwU6PBU8dH49qqPEM7rNAxW5QRSe2rN5u2oNKfh5kcY?=
 =?us-ascii?Q?ypVQkic5mX3S0GGMFXmAKYs5WpZxtlQwgnMJ921fetDG51zjbfirIsna6J89?=
 =?us-ascii?Q?xLVdRsg3TIr67YfjHTwsDJztMTWBuVuCPzpLdyOLVcHEhQ3LpXGSaONO45Gi?=
 =?us-ascii?Q?tc9MtBQFqsiZIilwKsqvOuwHXA0ftlQajuz5Ab6Z9KUOA1vamhE2zlf7E7HF?=
 =?us-ascii?Q?0z3ORHBnTqvrLe63ZTjvaRxsGMR4sPy+7Ibfl8sfSbFQOr+RUK8/GkJxZUKh?=
 =?us-ascii?Q?+Qpa70CwUpLEQ5TJ68qFDu6QOLXEs9UoE+XcoP2izgPF1/EL/ZxZ8Ze/GHGr?=
 =?us-ascii?Q?/9X41FeOCO5F2Ugvl0Pbw7TzsXj8cNoCN1iMnY7r8h1m/ej+ViE2sP/40upf?=
 =?us-ascii?Q?s3B7yeSHiJMQAb2VZ7d7S8nn+s/Dgl7GG/duoBSsrcfV8i+/sBrBPYdhMeyG?=
 =?us-ascii?Q?h6qMKOdIz6yuXr4gkKk4kUV4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0debc9d2-a24a-4991-baec-08d9052e5240
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:15.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbumvE046H6hZoEu6RN5ycpQJHgd6ugsTD6VEX+HpQIwF4Tt7OJatHOsmSQ6pmm2aUr7M0chI4zFzhyPEgLoag==
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

This name is more fitting, especially for the changes coming next to
support multi-GPU systems with proper DMA mappings. Cleaned up the code
and renamed some related functions and variables to improve readability.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 209 +++++++++---------
 2 files changed, 104 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 313ee49b9f17..c24b2478f445 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -38,10 +38,10 @@ extern uint64_t amdgpu_amdkfd_total_mem_size;
 
 struct amdgpu_device;
 
-struct kfd_bo_va_list {
-	struct list_head bo_list;
+struct kfd_mem_attachment {
+	struct list_head list;
 	struct amdgpu_bo_va *bo_va;
-	void *kgd_dev;
+	struct amdgpu_device *adev;
 	bool is_mapped;
 	uint64_t va;
 	uint64_t pte_flags;
@@ -50,7 +50,7 @@ struct kfd_bo_va_list {
 struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
-	struct list_head bo_va_list;
+	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
 	struct ttm_validate_buffer validate_list;
 	struct ttm_validate_buffer resv_list;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index dfa025d694f8..fee4c64dd051 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -72,16 +72,16 @@ static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)
 	return (struct amdgpu_device *)kgd;
 }
 
-static bool check_if_add_bo_to_vm(struct amdgpu_vm *avm,
+static bool kfd_mem_is_attached(struct amdgpu_vm *avm,
 		struct kgd_mem *mem)
 {
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list)
+	list_for_each_entry(entry, &mem->attachments, list)
 		if (entry->bo_va->base.vm == avm)
-			return false;
+			return true;
 
-	return true;
+	return false;
 }
 
 /* Set memory usage limits. Current, limits are
@@ -473,7 +473,7 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
 	return pte_flags;
 }
 
-/* add_bo_to_vm - Add a BO to a VM
+/* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
  * to a VM. It can later be mapped and unmapped many times without
@@ -485,15 +485,14 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
  * 4. Alloc page tables and directories if needed
  * 4a.  Validate new page tables and directories
  */
-static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
+static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql,
-		struct kfd_bo_va_list **p_bo_va_entry)
+		struct kfd_mem_attachment **p_attachment)
 {
 	int ret;
-	struct kfd_bo_va_list *bo_va_entry;
+	struct kfd_mem_attachment *attachment;
 	struct amdgpu_bo *bo = mem->bo;
 	uint64_t va = mem->va;
-	struct list_head *list_bo_va = &mem->bo_va_list;
 	unsigned long bo_size = bo->tbo.base.size;
 
 	if (!va) {
@@ -504,29 +503,29 @@ static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
 	if (is_aql)
 		va += bo_size;
 
-	bo_va_entry = kzalloc(sizeof(*bo_va_entry), GFP_KERNEL);
-	if (!bo_va_entry)
+	attachment = kzalloc(sizeof(*attachment), GFP_KERNEL);
+	if (!attachment)
 		return -ENOMEM;
 
 	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			va + bo_size, vm);
 
 	/* Add BO to VM internal data structures*/
-	bo_va_entry->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
-	if (!bo_va_entry->bo_va) {
+	attachment->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
+	if (!attachment->bo_va) {
 		ret = -EINVAL;
 		pr_err("Failed to add BO object to VM. ret == %d\n",
 				ret);
 		goto err_vmadd;
 	}
 
-	bo_va_entry->va = va;
-	bo_va_entry->pte_flags = get_pte_flags(adev, mem);
-	bo_va_entry->kgd_dev = (void *)adev;
-	list_add(&bo_va_entry->bo_list, list_bo_va);
+	attachment->va = va;
+	attachment->pte_flags = get_pte_flags(adev, mem);
+	attachment->adev = adev;
+	list_add(&attachment->list, &mem->attachments);
 
-	if (p_bo_va_entry)
-		*p_bo_va_entry = bo_va_entry;
+	if (p_attachment)
+		*p_attachment = attachment;
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
@@ -538,22 +537,20 @@ static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return 0;
 
 err_alloc_pts:
-	amdgpu_vm_bo_rmv(adev, bo_va_entry->bo_va);
-	list_del(&bo_va_entry->bo_list);
+	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
+	list_del(&attachment->list);
 err_vmadd:
-	kfree(bo_va_entry);
+	kfree(attachment);
 	return ret;
 }
 
-static void remove_bo_from_vm(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry, unsigned long size)
+static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 {
-	pr_debug("\t remove VA 0x%llx - 0x%llx in entry %p\n",
-			entry->va,
-			entry->va + size, entry);
-	amdgpu_vm_bo_rmv(adev, entry->bo_va);
-	list_del(&entry->bo_list);
-	kfree(entry);
+	pr_debug("\t remove VA 0x%llx in entry %p\n",
+			attachment->va, attachment);
+	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	list_del(&attachment->list);
+	kfree(attachment);
 }
 
 static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
@@ -728,7 +725,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 				struct bo_vm_reservation_context *ctx)
 {
 	struct amdgpu_bo *bo = mem->bo;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	unsigned int i;
 	int ret;
 
@@ -740,7 +737,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	INIT_LIST_HEAD(&ctx->list);
 	INIT_LIST_HEAD(&ctx->duplicates);
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
+	list_for_each_entry(entry, &mem->attachments, list) {
 		if ((vm && vm != entry->bo_va->base.vm) ||
 			(entry->is_mapped != map_type
 			&& map_type != BO_VM_ALL))
@@ -762,7 +759,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	i = 0;
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
+	list_for_each_entry(entry, &mem->attachments, list) {
 		if ((vm && vm != entry->bo_va->base.vm) ||
 			(entry->is_mapped != map_type
 			&& map_type != BO_VM_ALL))
@@ -817,7 +814,7 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 }
 
 static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
-				struct kfd_bo_va_list *entry,
+				struct kfd_mem_attachment *entry,
 				struct amdgpu_sync *sync)
 {
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
@@ -833,7 +830,7 @@ static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
 }
 
 static int update_gpuvm_pte(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry,
+		struct kfd_mem_attachment *entry,
 		struct amdgpu_sync *sync)
 {
 	int ret;
@@ -850,7 +847,7 @@ static int update_gpuvm_pte(struct amdgpu_device *adev,
 }
 
 static int map_bo_to_gpuvm(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry, struct amdgpu_sync *sync,
+		struct kfd_mem_attachment *entry, struct amdgpu_sync *sync,
 		bool no_update_pte)
 {
 	int ret;
@@ -1194,7 +1191,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		ret = -ENOMEM;
 		goto err;
 	}
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	mutex_init(&(*mem)->lock);
 	(*mem)->aql_queue = !!(flags & KFD_IOC_ALLOC_MEM_FLAGS_AQL_QUEUE_MEM);
 
@@ -1283,7 +1280,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
-	struct kfd_bo_va_list *entry, *tmp;
+	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
 	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
@@ -1327,9 +1324,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		mem->va + bo_size * (1 + mem->aql_queue));
 
 	/* Remove from VM internal data structures */
-	list_for_each_entry_safe(entry, tmp, &mem->bo_va_list, bo_list)
-		remove_bo_from_vm((struct amdgpu_device *)entry->kgd_dev,
-				entry, bo_size);
+	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
+		kfd_mem_detach(entry);
 
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
@@ -1372,10 +1368,10 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	int ret;
 	struct amdgpu_bo *bo;
 	uint32_t domain;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
-	struct kfd_bo_va_list *bo_va_entry = NULL;
-	struct kfd_bo_va_list *bo_va_entry_aql = NULL;
+	struct kfd_mem_attachment *attachment = NULL;
+	struct kfd_mem_attachment *attachment_aql = NULL;
 	unsigned long bo_size;
 	bool is_invalid_userptr = false;
 
@@ -1424,21 +1420,20 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	    bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
 		is_invalid_userptr = true;
 
-	if (check_if_add_bo_to_vm(avm, mem)) {
-		ret = add_bo_to_vm(adev, mem, avm, false,
-				&bo_va_entry);
+	if (!kfd_mem_is_attached(avm, mem)) {
+		ret = kfd_mem_attach(adev, mem, avm, false, &attachment);
 		if (ret)
-			goto add_bo_to_vm_failed;
+			goto attach_failed;
 		if (mem->aql_queue) {
-			ret = add_bo_to_vm(adev, mem, avm,
-					true, &bo_va_entry_aql);
+			ret = kfd_mem_attach(adev, mem, avm, true,
+					     &attachment_aql);
 			if (ret)
-				goto add_bo_to_vm_failed_aql;
+				goto attach_failed_aql;
 		}
 	} else {
 		ret = vm_validate_pt_pd_bos(avm);
 		if (unlikely(ret))
-			goto add_bo_to_vm_failed;
+			goto attach_failed;
 	}
 
 	if (mem->mapped_to_gpu_memory == 0 &&
@@ -1454,30 +1449,30 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		}
 	}
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == avm && !entry->is_mapped) {
-			pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
-					entry->va, entry->va + bo_size,
-					entry);
+	list_for_each_entry(entry, &mem->attachments, list) {
+		if (entry->bo_va->base.vm != avm || entry->is_mapped)
+			continue;
 
-			ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
-					      is_invalid_userptr);
-			if (ret) {
-				pr_err("Failed to map bo to gpuvm\n");
-				goto map_bo_to_gpuvm_failed;
-			}
+		pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
+			 entry->va, entry->va + bo_size, entry);
 
-			ret = vm_update_pds(avm, ctx.sync);
-			if (ret) {
-				pr_err("Failed to update page directories\n");
-				goto map_bo_to_gpuvm_failed;
-			}
+		ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
+				      is_invalid_userptr);
+		if (ret) {
+			pr_err("Failed to map bo to gpuvm\n");
+			goto map_bo_to_gpuvm_failed;
+		}
 
-			entry->is_mapped = true;
-			mem->mapped_to_gpu_memory++;
-			pr_debug("\t INC mapping count %d\n",
-					mem->mapped_to_gpu_memory);
+		ret = vm_update_pds(avm, ctx.sync);
+		if (ret) {
+			pr_err("Failed to update page directories\n");
+			goto map_bo_to_gpuvm_failed;
 		}
+
+		entry->is_mapped = true;
+		mem->mapped_to_gpu_memory++;
+		pr_debug("\t INC mapping count %d\n",
+			 mem->mapped_to_gpu_memory);
 	}
 
 	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
@@ -1489,12 +1484,12 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	goto out;
 
 map_bo_to_gpuvm_failed:
-	if (bo_va_entry_aql)
-		remove_bo_from_vm(adev, bo_va_entry_aql, bo_size);
-add_bo_to_vm_failed_aql:
-	if (bo_va_entry)
-		remove_bo_from_vm(adev, bo_va_entry, bo_size);
-add_bo_to_vm_failed:
+	if (attachment_aql)
+		kfd_mem_detach(attachment_aql);
+attach_failed_aql:
+	if (attachment)
+		kfd_mem_detach(attachment);
+attach_failed:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
 	mutex_unlock(&mem->process_info->lock);
@@ -1509,7 +1504,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
 	int ret;
 
@@ -1533,26 +1528,24 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		mem->va + bo_size * (1 + mem->aql_queue),
 		avm);
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == avm && entry->is_mapped) {
-			pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
-					entry->va,
-					entry->va + bo_size,
-					entry);
+	list_for_each_entry(entry, &mem->attachments, list) {
+		if (entry->bo_va->base.vm != avm || !entry->is_mapped)
+			continue;
 
-			ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
-			if (ret == 0) {
-				entry->is_mapped = false;
-			} else {
-				pr_err("failed to unmap VA 0x%llx\n",
-						mem->va);
-				goto unreserve_out;
-			}
+		pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
+			 entry->va, entry->va + bo_size, entry);
 
-			mem->mapped_to_gpu_memory--;
-			pr_debug("\t DEC mapping count %d\n",
-					mem->mapped_to_gpu_memory);
+		ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
+		if (ret == 0) {
+			entry->is_mapped = false;
+		} else {
+			pr_err("failed to unmap VA 0x%llx\n", mem->va);
+			goto unreserve_out;
 		}
+
+		mem->mapped_to_gpu_memory--;
+		pr_debug("\t DEC mapping count %d\n",
+			 mem->mapped_to_gpu_memory);
 	}
 
 	/* If BO is unmapped from all VMs, unfence it. It can be evicted if
@@ -1701,7 +1694,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	if (mmap_offset)
 		*mmap_offset = amdgpu_bo_mmap_offset(bo);
 
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	mutex_init(&(*mem)->lock);
 
 	(*mem)->alloc_flags =
@@ -1898,7 +1891,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
 				 validate_list.head) {
-		struct kfd_bo_va_list *bo_va_entry;
+		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
 
@@ -1921,13 +1914,13 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 		 * VM faults if the GPU tries to access the invalid
 		 * memory.
 		 */
-		list_for_each_entry(bo_va_entry, &mem->bo_va_list, bo_list) {
-			if (!bo_va_entry->is_mapped)
+		list_for_each_entry(attachment, &mem->attachments, list) {
+			if (!attachment->is_mapped)
 				continue;
 
 			ret = update_gpuvm_pte((struct amdgpu_device *)
-					       bo_va_entry->kgd_dev,
-					       bo_va_entry, &sync);
+					       attachment->adev,
+					       attachment, &sync);
 			if (ret) {
 				pr_err("%s: update PTE failed\n", __func__);
 				/* make sure this gets validated again */
@@ -2108,7 +2101,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
-		struct kfd_bo_va_list *bo_va_entry;
+		struct kfd_mem_attachment *attachment;
 
 		total_size += amdgpu_bo_size(bo);
 
@@ -2128,11 +2121,9 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 			pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
 			goto validate_map_fail;
 		}
-		list_for_each_entry(bo_va_entry, &mem->bo_va_list,
-				    bo_list) {
+		list_for_each_entry(attachment, &mem->attachments, list) {
 			ret = update_gpuvm_pte((struct amdgpu_device *)
-					      bo_va_entry->kgd_dev,
-					      bo_va_entry,
+					      attachment->adev, attachment,
 					      &sync_obj);
 			if (ret) {
 				pr_debug("Memory eviction: update PTE failed. Try again\n");
@@ -2208,7 +2199,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void *gws, struct kgd_mem **mem
 		return -ENOMEM;
 
 	mutex_init(&(*mem)->lock);
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	(*mem)->bo = amdgpu_bo_ref(gws_bo);
 	(*mem)->domain = AMDGPU_GEM_DOMAIN_GWS;
 	(*mem)->process_info = process_info;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
