Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE12EC8C9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EED36E430;
	Thu,  7 Jan 2021 03:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6A6E426;
 Thu,  7 Jan 2021 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZK5bBJQghckXSMr+ZycQXmLTlXkkrNNb1+AE2/903oIZfPPT3pD7WpAJpcTYYpYItWNfWZptTYBB6hjKGbEDJYLdpjQzGjYXINTLY25oQ3BAY718pRETKHt9+pnNylGJ6Xl0RxM4IJ9i3Mz2u20adej49OLh2DgnxM0Tb3R3UfxX/Mu02sjP3kZx8bHKNg+z8n21sjmsJbV8Vw52p4ZXXoyW6rA4vlD7DAVZcarLMo9nOb68gWXeQU4p++zntBbZLmSAukh2F2Zwfkg94lLwwAaJDl8u2NIeM4m6bezfTu7EKksHdha5g1SKNLMQjhm6bOhSDleY95ZNCVBO9ujEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf0LLSvTGC9XrJdhdl7mIASnBuILxRmGWjQEhCvSwvk=;
 b=kfo8Q9fgE6FHpZOG5l1bOuw8BksPh92Gh4o85TfYzIP4sazRq1PNIRyJYKo5WxmgdzJF4otv4yOFJaqveS8V2md0YkWAfMGgK5ht5Eo6FV5p72EkBLipkVwVNpRJax26hMJ5dHy1lpG5mMLWdYxV6nHcGpvMYmXivO2d5K63H/uETz2ecTw45NNRE+YciiAgq0uUE25jV6LK2hLfnzTnnYwAHqOhLvDsknJJvt4052/S8alWNFbFcuxruAu7HHnvesgDYl9X24/7NiBGWJzyuhPurmZnI8jSlyB+kNj/i5A3IeDR73d4wsfw7GwgK7NRoCiMK9EfP9j8bzbj4FFN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf0LLSvTGC9XrJdhdl7mIASnBuILxRmGWjQEhCvSwvk=;
 b=z8f3utS92y1Q52CMPE2id8+oDcJVTFbZlznAkTytIpOKshwOaW08YobgahFN7/y7FGszB84XptuzAguj+p7Pkq2dEIQWAi290yf22RTk09Dyae3kuUhgmtxI4IhyFGmOrQjb/PiNFVXnODyiZ4Zha0zORhQF415a/uWHCrqLDHQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:36 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:36 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 33/35] drm/amdkfd: refine migration policy with xnack on
Date: Wed,  6 Jan 2021 22:01:25 -0500
Message-Id: <20210107030127.20393-34-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c094bb5-9276-43dc-585e-08d8b2b8d3be
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408110B41BF0ADD070A002692AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fuZ1hYir2sgh4nqLn3rCJxCXSx2mR7K8DEQ6rrDdfiCE20teKouPBVKqDY/3AF3/FIMrfJVHrHu/rL8LeP/BQbClg0mSLVDJ0sr6NYsExqeSgpi413hVXcK6oZc1iMxJeLIjG67RS/G4To1IV8iwAmC1L54y51GkC/+cR1w6mta/m/AtZYrGWBOa7vnNYV6inCQnMKyv4W4aaNiUxnzqR6ELGNl+uVvVEohf7j8np+CjjpuHIyZ2P9/u9OIwIvwXPNLB0fTsHw8T+YeOBPJlXAFrIwKVnBaxO9TpszSW5CkWcubsTHt3/ls306hwPgBVzAeLIpOUYTsSoXVzQybqU9+d9MTZ98fOdmDSA6GPqPHRIwQRof4M7YKwNmtSIdqAkAPs+mouMO/McyJrjvcgyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(30864003)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KwRe4CcMJlPpLAmKKpkyYTic05nui8zsdEalskD/9GdaIx0SiwbbMJcPkAvP?=
 =?us-ascii?Q?GS+LWFtK7pBr2RSXflqdTgHtXg5ql/Dve2pQGsiqpPmgHvLMZKQv2AFhyDhY?=
 =?us-ascii?Q?4GIJ/iPt45+vkIOSqLFpkI0rzdf7UWO97KzRKJnkbPH2zSmtGUgrtDbOwiDp?=
 =?us-ascii?Q?cLnld5Od6s9zTvWijmuRJpeLb07CpGyHnMxcUb39RzfkEYKm3kCxqeL47DYR?=
 =?us-ascii?Q?ErNSmEUuzi8McnN2Y73siMJWfb8z4kf+6FAx5jgM8OjOTE4uFbokOf9LNKuR?=
 =?us-ascii?Q?TkO2OVzcOgjJczvyIOOUmdG/jiCVFjgY6M3dpQ+4hLf9iNdOOQyHtUpRoWII?=
 =?us-ascii?Q?JRceG7pfy6Ty35sDqlcYwsKzbR4LwecwOpOa11he4tc7b952ESaa5j78u2Kb?=
 =?us-ascii?Q?75xEjdFm0UHGzx9ToAnEL1fQLg8zLOZ93f04aBcakvzFWNQCwBnD6sVqPGkA?=
 =?us-ascii?Q?AWjzcB4IF39SdVhERKc3u4F+54mn02ZdCKC1LRYuK3b8HOsPns7fJbuCg4xh?=
 =?us-ascii?Q?+DP3MTwwn8qkv1B59woIvQlkQIT4v8g7M6VKTmQExDBaK3zy1nLQ4aDbukUs?=
 =?us-ascii?Q?KxmgeBWB/aoCCUoixhoBjKlvABVhIbQr6g1GpBBqMEbO+3AbzzX8pQjcZdPk?=
 =?us-ascii?Q?aP2t1sWT6VuhZ95j/WD1BjyxfTZQPCQaOi6aXKoOHYF09s7nd94VTsnAnjAJ?=
 =?us-ascii?Q?dyoFVojLa36Vt8PUPPZ5gldGsZcPMvqdfdOqmx46j8NV/DFrDwcfe4yuDzVh?=
 =?us-ascii?Q?FpmnTN5KgvtiK5U/EGX8nap8prDZ9q+sQYqwBiiaekHhuNH+m7m9OQXqJ9XY?=
 =?us-ascii?Q?ZecBr9ZkLCVDuiKGV55QqlDAHdKWc/V8Tvvv3OEnNb+UUcwsDN9UW3Bm72rE?=
 =?us-ascii?Q?vYPCtLogxNkM3Jm3mg4zKykVIoymZm38exEwTRQMzETdPgm2eFD85TQgqXJ1?=
 =?us-ascii?Q?YYo7DPfMNR4O3RGh+EcoUzf3RhMeWwAnriKd4h76bxNnyLlHel2hSiMldKu+?=
 =?us-ascii?Q?g+we?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:07.0032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c094bb5-9276-43dc-585e-08d8b2b8d3be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxE/HjNBalr2xBUAg36+M4gND2D/d9y4b6CmtaOeHQ4oUnVONX4NlCUe7c2r2goppiS3pJp4LO8O25W7MPl2HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

With xnack on, GPU vm fault handler decide the best restore location,
then migrate range to the best restore location and update GPU mapping
to recover the GPU vm fault.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  25 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  16 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 162 +++++++++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +-
 7 files changed, 180 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index bd9de870f8f1..50a8f4db22f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3320,7 +3320,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
 	addr /= AMDGPU_GPU_PAGE_SIZE;
 
 	if (!amdgpu_noretry && is_compute_context &&
-		!svm_range_restore_pages(adev, pasid, addr)) {
+		!svm_range_restore_pages(adev, vm, pasid, addr)) {
 		amdgpu_bo_unref(&root);
 		return true;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d33a4cc63495..2095417c7846 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -441,6 +441,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * svm_migrate_ram_to_vram - migrate svm range from system to device
  * @prange: range structure
  * @best_loc: the device to migrate to
+ * @mm: the process mm structure
  *
  * Context: Process context, caller hold mm->mmap_sem and prange->lock and take
  *          svms srcu read lock.
@@ -448,12 +449,12 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
+int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			    struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
 	struct amdgpu_device *adev;
-	struct mm_struct *mm;
 	int r = 0;
 
 	if (prange->actual_loc == best_loc) {
@@ -475,8 +476,6 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 	start = prange->it_node.start << PAGE_SHIFT;
 	end = (prange->it_node.last + 1) << PAGE_SHIFT;
 
-	mm = current->mm;
-
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
@@ -740,12 +739,26 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 	list_for_each_entry(prange, &list, update_list) {
 		mutex_lock(&prange->mutex);
 		r = svm_migrate_vram_to_ram(prange, vma->vm_mm);
-		mutex_unlock(&prange->mutex);
 		if (r) {
 			pr_debug("failed %d migrate [0x%lx 0x%lx] to ram\n", r,
 				 prange->it_node.start, prange->it_node.last);
-			goto out_srcu;
+			goto next;
 		}
+
+		/* xnack off, svm_range_restore_work will update GPU mapping */
+		if (!p->xnack_enabled)
+			goto next;
+
+		/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+		r = svm_range_map_to_gpus(prange, true);
+		if (r)
+			pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx]\n",
+				 r, prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+next:
+		mutex_unlock(&prange->mutex);
+		if (r)
+			break;
 	}
 
 out_srcu:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 95fd7b21791f..9949b55d3b6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,7 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			    struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d5367e770b39..db94f963eb7e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -864,6 +864,9 @@ int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
 int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
 int kfd_process_device_from_gpuidx(struct kfd_process *p,
 					uint32_t gpu_idx, struct kfd_dev **gpu);
+int kfd_process_gpuid_from_kgd(struct kfd_process *p,
+			       struct amdgpu_device *adev, uint32_t *gpuid,
+			       uint32_t *gpuidx);
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f7a50a364d78..69970a3bc176 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1637,6 +1637,22 @@ int kfd_process_device_from_gpuidx(struct kfd_process *p,
 	return -EINVAL;
 }
 
+int
+kfd_process_gpuid_from_kgd(struct kfd_process *p, struct amdgpu_device *adev,
+			   uint32_t *gpuid, uint32_t *gpuidx)
+{
+	struct kgd_dev *kgd = (struct kgd_dev *)adev;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && p->pdds[i]->dev->kgd == kgd) {
+			*gpuid = p->pdds[i]->dev->id;
+			*gpuidx = i;
+			return 0;
+		}
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 63b745a06740..8b57f5a471bd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1153,7 +1153,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	return r;
 }
 
-static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
+int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
@@ -1170,9 +1170,29 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	else
 		bo_adev = NULL;
 
-	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-		  MAX_GPU_INSTANCE);
 	p = container_of(prange->svms, struct kfd_process, svms);
+	if (p->xnack_enabled) {
+		bitmap_copy(bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
+
+		/* If prefetch range to GPU, or GPU retry fault migrate range to
+		 * GPU, which has ACCESS attribute to the range, create mapping
+		 * on that GPU.
+		 */
+		if (prange->actual_loc) {
+			gpuidx = kfd_process_gpuidx_from_gpuid(p,
+							prange->actual_loc);
+			if (gpuidx < 0) {
+				WARN_ONCE(1, "failed get device by id 0x%x\n",
+					 prange->actual_loc);
+				return -EINVAL;
+			}
+			if (test_bit(gpuidx, prange->bitmap_access))
+				bitmap_set(bitmap, gpuidx, 1);
+		}
+	} else {
+		bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+			  MAX_GPU_INSTANCE);
+	}
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
@@ -1678,16 +1698,77 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr)
 	return container_of(node, struct svm_range, it_node);
 }
 
+/* svm_range_best_restore_location - decide the best fault restore location
+ * @prange: svm range structure
+ * @adev: the GPU on which vm fault happened
+ *
+ * This is only called when xnack is on, to decide the best location to restore
+ * the range mapping after GPU vm fault. Caller uses the best location to do
+ * migration if actual loc is not best location, then update GPU page table
+ * mapping to the best location.
+ *
+ * If vm fault gpu is range preferred loc, the best_loc is preferred loc.
+ * If vm fault gpu idx is on range ACCESSIBLE bitmap, best_loc is vm fault gpu
+ * If vm fault gpu idx is on range ACCESSIBLE_IN_PLACE bitmap, then
+ *    if range actual loc is cpu, best_loc is cpu
+ *    if vm fault gpu is on xgmi same hive of range actual loc gpu, best_loc is
+ *    range actual loc.
+ * Otherwise, GPU no access, best_loc is -1.
+ *
+ * Return:
+ * -1 means vm fault GPU no access
+ * 0 for CPU or GPU id
+ */
+static int32_t
+svm_range_best_restore_location(struct svm_range *prange,
+				struct amdgpu_device *adev)
+{
+	struct amdgpu_device *bo_adev;
+	struct kfd_process *p;
+	int32_t gpuidx;
+	uint32_t gpuid;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	r = kfd_process_gpuid_from_kgd(p, adev, &gpuid, &gpuidx);
+	if (r < 0) {
+		pr_debug("failed to get gpuid from kgd\n");
+		return -1;
+	}
+
+	if (prange->preferred_loc == gpuid)
+		return prange->preferred_loc;
+
+	if (test_bit(gpuidx, prange->bitmap_access))
+		return gpuid;
+
+	if (test_bit(gpuidx, prange->bitmap_aip)) {
+		if (!prange->actual_loc)
+			return 0;
+
+		bo_adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+		if (amdgpu_xgmi_same_hive(adev, bo_adev))
+			return prange->actual_loc;
+		else
+			return 0;
+	}
+
+	return -1;
+}
+
 int
-svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
-			uint64_t addr)
+svm_range_restore_pages(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+			unsigned int pasid, uint64_t addr)
 {
-	int r = 0;
-	int srcu_idx;
+	struct amdgpu_device *bo_adev;
 	struct mm_struct *mm = NULL;
-	struct svm_range *prange;
 	struct svm_range_list *svms;
+	struct svm_range *prange;
 	struct kfd_process *p;
+	int32_t best_loc;
+	int srcu_idx;
+	int r = 0;
 
 	p = kfd_lookup_process_by_pasid(pasid);
 	if (!p) {
@@ -1706,20 +1787,20 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
 			 svms, addr);
 		r = -EFAULT;
-		goto unlock_out;
+		goto out_srcu_unlock;
 	}
 
 	if (!atomic_read(&prange->invalid)) {
 		pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
 			 svms, prange->it_node.start, prange->it_node.last);
-		goto unlock_out;
+		goto out_srcu_unlock;
 	}
 
 	mm = get_task_mm(p->lead_thread);
 	if (!mm) {
 		pr_debug("svms 0x%p failed to get mm\n", svms);
 		r = -ESRCH;
-		goto unlock_out;
+		goto out_srcu_unlock;
 	}
 
 	mmap_read_lock(mm);
@@ -1729,27 +1810,57 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	 */
 	mutex_lock(&prange->mutex);
 
+	best_loc = svm_range_best_restore_location(prange, adev);
+	if (best_loc == -1) {
+		pr_debug("svms %p failed get best restore loc [0x%lx 0x%lx]\n",
+			 svms, prange->it_node.start, prange->it_node.last);
+		r = -EACCES;
+		goto out_mmput;
+	}
+
+	pr_debug("svms %p [0x%lx 0x%lx] best restore 0x%x, actual loc 0x%x\n",
+		 svms, prange->it_node.start, prange->it_node.last, best_loc,
+		 prange->actual_loc);
+
+	if (prange->actual_loc != best_loc) {
+		if (best_loc)
+			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+		else
+			r = svm_migrate_vram_to_ram(prange, mm);
+		if (r) {
+			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
+				 r, svms, prange->it_node.start,
+				 prange->it_node.last);
+			goto out_mmput;
+		}
+	}
+
 	r = svm_range_validate(mm, prange);
 	if (r) {
-		pr_debug("failed %d to validate svms 0x%p [0x%lx 0x%lx]\n", r,
+		pr_debug("failed %d to validate svms %p [0x%lx 0x%lx]\n", r,
 			 svms, prange->it_node.start, prange->it_node.last);
-
-		goto mmput_out;
+		goto out_mmput;
 	}
 
-	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping\n",
-		 svms, prange->it_node.start, prange->it_node.last);
+	if (prange->svm_bo && prange->mm_nodes)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
+	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping, bo_adev is %s\n",
+		 svms, prange->it_node.start, prange->it_node.last,
+		 bo_adev ? "not NULL" : "NULL");
 
 	r = svm_range_map_to_gpus(prange, true);
 	if (r)
-		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
-			 svms, prange->it_node.start, prange->it_node.last);
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpus\n",
+			 r, svms, prange->it_node.start, prange->it_node.last);
 
-mmput_out:
+out_mmput:
 	mutex_unlock(&prange->mutex);
 	mmap_read_unlock(mm);
 	mmput(mm);
-unlock_out:
+out_srcu_unlock:
 	srcu_read_unlock(&svms->srcu, srcu_idx);
 	kfd_unref_process(p);
 
@@ -1882,7 +1993,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
-/* svm_range_best_location - decide the best actual location
+/* svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
  *
  * For xnack off:
@@ -1904,7 +2015,8 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
  * Return:
  * 0 for CPU or GPU id
  */
-static uint32_t svm_range_best_location(struct svm_range *prange)
+static uint32_t
+svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
@@ -1980,7 +2092,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	int r = 0;
 
 	*migrated = false;
-	best_loc = svm_range_best_location(prange);
+	best_loc = svm_range_best_prefetch_location(prange);
 
 	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
 	    best_loc == prange->actual_loc)
@@ -2001,10 +2113,10 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 		}
 
 		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc);
+		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
 	} else {
 		pr_debug("migrate from vram to ram\n");
-		r = svm_migrate_vram_to_ram(prange, current->mm);
+		r = svm_migrate_vram_to_ram(prange, mm);
 	}
 
 	if (!r)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 143573621956..0685eb04b87c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -125,8 +125,9 @@ int svm_range_vram_node_new(struct amdgpu_device *adev,
 void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, unsigned long addr,
 				   struct list_head *list);
-int svm_range_restore_pages(struct amdgpu_device *adev,
+int svm_range_restore_pages(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			    unsigned int pasid, uint64_t addr);
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
+int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm);
 
 #endif /* KFD_SVM_H_ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
