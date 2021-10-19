Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C262F43420D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BCF6E073;
	Tue, 19 Oct 2021 23:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7B6E073
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZpWfYvfuRjX6Un5e0kii/VHXswmnVNNYqSU2zR2/w2DREokSY5Bk7+qzcCmlRpjTcXzvYpFoMMqJESb+eUkwOmELYX/4Mxcp0YCO0GkDxJ4b75xga2G/YSBSnjnQvNFvMwBNI4S6muompXAMwPQoqHl2yyzkfzkYsFYTC2qZH2KbzBOfahHri9se8v4ko1R53W8uiqGXVyoijTORaeDRfykRDfLPrX/oImfkjFrfYSYcOVPjFMJrB8kU9JrhWgODDrtcrrdcPxWQFUkIHWt8WAoejFRHfUwHkAqFywAKFPU5awM+nOnKLCwaraXyJdoikCj3M5A29Ceb1CA00fJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVFQmQDYmwoIPu5PCq1aE4hPAvrJkIGcOHv7293m26E=;
 b=cPh4mGYpuxd/PQsV9bObK50jyX7GvpWruYrHYMT8CiVAymK+ENoc/KcblWIHa1YIZGcfBNLHONF4HO5j4s0Y1iHpz6PNKAO0IJ0YKxgEpK0n7ScYYkePzawNuJ6Ld+mKucsj4I31TkjqT326a8bcsaVvRpJ13xuVAvQUSbKx2ipT6YcXD9TO9QsAw8DS8fkpCTlFoNilmK3sq/DWVlEX/AAkfYTcDXjdYsqOw909Gok58fa9ZRhlhwKC1rlo+vK8JCP20KzAfZogEyjACG6XVU5nE1CKMXCf/SQ07uhuyrWJmnusUMC4p9gLv5fmc8dNaYLsmc35/LUYMa0335xQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVFQmQDYmwoIPu5PCq1aE4hPAvrJkIGcOHv7293m26E=;
 b=k1wqdVh1Y9wDsLtgr2NMrg7+UDeUA7K1BJ3hRCrWMx4je2r/gHkETODQRCDOCYAUM4deozaky6rgoYM0DQS2rsn5AX0fwdMf8NFFAkBjjgQXsnw3nQaRVqGwfp66KyJMOcSUrdB52FwsLb+yqp867N4FHuRy3rgtWVeQUhWgYH7ueJxKTPhIIa36HFEOcG4fvesybsMYKx0z0uEvkcuaTDBZi5ooSDTTFH7MJopKpFYFflrU73mvjMG+ipEd7/bBz78Y6/U7qWBQDj+qTi4wnRlMma2d/seoffAA+2/pj9+KLkTXz1sFUs+B9sASozIu3AAb1FhBKDPaUTnlytmR1A==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) by
 DM6PR12MB5550.namprd12.prod.outlook.com (2603:10b6:5:1b6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 23:27:35 +0000
Received: from DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::3817:44ce:52ad:3c0b]) by DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::3817:44ce:52ad:3c0b%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 23:27:35 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: [PATCH v2] drm/ttm: Do not put non-struct page memory into PUD/PMDs
Date: Tue, 19 Oct 2021 20:27:31 -0300
Message-Id: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:207:3d::42) To DM6PR12MB5520.namprd12.prod.outlook.com
 (2603:10b6:5:208::9)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0065.namprd02.prod.outlook.com (2603:10b6:207:3d::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Tue, 19 Oct 2021 23:27:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mcyW3-00HL1m-SB; Tue, 19 Oct 2021 20:27:31 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c16a386-b2f8-4327-a183-08d993580710
X-MS-TrafficTypeDiagnostic: DM6PR12MB5550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB5550ADF6D29551E32A7EA6F8C2BD9@DM6PR12MB5550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xj4A45gGUEc9Z07uq3w/FKJ5/FAKEpDkDYgbmlfd/+ewdR4uyt2KYnD8Qnb4HPXpMnuTwbv3Os6UBC6G9C6Tr0yGDUtNdSN51QiVICKbFzpo2OC+2AolUp0nKzU2DQjVduOP6EO15DgaTEB4Bil1zsAElOhFlWH7F7w7klyyZitjcZzATFfab5ZLk6Do9DobwHQ0wh4sLBWpVKTrbDaJSyiXNe7e3wuEuIkI5lv8hWMOVtRkt0c+CZjCj02Zur0eepCWYE1mldAdwqNcEm0s+baNwHh98KB/VCQeAmH+B87G0q6Wga3XOzjz3Cl5XkRQhyRIZ0Z5hOfY8S9bmxnjD6l7PZiCqucBAaxKgBGjhZMoPyyqMp1IXe+DK6rz8bnTlAhqyH758Z7OFpZP2H60gMogJFflXS3ts0yDZ/adCyFA5FfB5MaUPGYx/mjWeWLT1JGH10eSjz7iZUjyP1YIJZU0xXOZOa4ypXA5XEYWHY+rpxFZL7xoNzaNjk/hdAvEIdo3kZTUsTCHeGc1tpCrDj1753uJHv6F0BErKwxcMP4y8dxcjHcggWnpAEOQzpzDFeOEsPtY9W85+Qw9hXQNOoZ+CMiCwbZD/hJBHw4cYu7vOyqkkSM4g5dKQaRyuNL7ORO9q5Tb//faOfwfU7jgiws+N/j3T0kUlp4XjNib4VaF4DUAd+IUkkCQ9JDuwjf8gAQhhl6yYao8Xh9q4MiBrQB8HsVMwW7UEMNKXAeuIy+EZTVLi68JTmrRi+viOPekLfnSybvtPCg2xO5bFb7DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5520.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(966005)(2616005)(426003)(30864003)(9746002)(9786002)(38100700002)(36756003)(508600001)(5660300002)(66556008)(66476007)(8676002)(4326008)(186003)(26005)(8936002)(316002)(66946007)(83380400001)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Ev2QmEb2kzCeiUtR1fzGKK4ETsaK2W4ZltI6TtO5IcL3zkP1Lwp3U0JMg+l?=
 =?us-ascii?Q?7byQ6R7cpCJBSovZPn2sm0T/mC3856aSx0NNjanouoWHitLXCIBc8zTy0Zfe?=
 =?us-ascii?Q?bVw/1qWTU6V4TorQW7AKS4082kKlviTr0LN5jA8Ko8vsEKx+Oo3EbasEppLj?=
 =?us-ascii?Q?7cyQfeWGiX2YFlvr7E50xSOEqMMV54BQixRf9wvLob7et9gYDIJZxTUE3dQX?=
 =?us-ascii?Q?ht+L8wa6ptUkTitazh2BBlr6pu2yGAFibdtYeCKSQr/39T2/vaOdZzUPY/XA?=
 =?us-ascii?Q?IjzsD1Z5mWUYH8IMHOSrgYMLGcEFA5uxG1Id64BVycoe7Natw1GKy1IMSLWW?=
 =?us-ascii?Q?shei2Vfs2MA4aVg976DFECk8kDzcPsVZ1nSy//Z/lwrZd9Kkx8VVlUuvamRs?=
 =?us-ascii?Q?gzIRW69AR75iOJAKgxeRJ8JgiOHr8blZX6QZuboE3W49/ieoAKukzfLRgrSp?=
 =?us-ascii?Q?pNUW0e2bZEvrLN7LV8DZQWUuRvVOS7w43sPQ9qSNrtpmA+VpiSwPbdL+l3Mh?=
 =?us-ascii?Q?aIYL5/1QDOyIZtB6zfhjToxh9iMX4LoKCp69OylqrE88LAswO0PpYbWhGfkZ?=
 =?us-ascii?Q?T5+/1OplWxpuZ7kkmRhZqmfVyqRpeQnidY/olr2yvGjkoX4wQOwtg3km1iX/?=
 =?us-ascii?Q?C+4aK2Kz4Q5I354OKUwrjjr3m9wO6UqsQWdPlpLLHBde5HjttfvGQ83ToMBM?=
 =?us-ascii?Q?DN2T4FiPD3FUXN00/otteZ64rWVFUsd538ixODGLKKqG1rN/AgKSRtsOjWsf?=
 =?us-ascii?Q?ecTm8PM7v55HlU72NDZ0855wpo8KkamPFLoLBJcPYwj+K30F33wtxt/H3kQe?=
 =?us-ascii?Q?yak+2iQzdB5ybM7KAs4JU7hirBtCfgK7NHQZkTp0aM4p0ZTUGqKIt5Kgpj0H?=
 =?us-ascii?Q?DGaqbdW5vl3MvCUOORqMdK3/IfuqKwt7yXIV/ulJKo8Zj1WrlQj2aHtiwP7P?=
 =?us-ascii?Q?PAkqFOar9iAUZzrbPYbgK5QMIG0x8CxOe5BnWXqOCpI6nPE1AMEWYe+qvXg2?=
 =?us-ascii?Q?Ui9vhFn5ulIk66/8eeOaBcy+yl7Ko70r2jKGVUXdamsQtZ3BX6qRoGubADri?=
 =?us-ascii?Q?AxxQkb7+N7CoBEdlxIN6hNdJOe6+Rz5If/LEL7FT0ydy8GdFJHeHuRfiTa5z?=
 =?us-ascii?Q?oCBVGhlz8NNwC0GDRI1YFvvaijZgWAs4ldXgdsyoCgcuTjS2VdVAyBuelxx6?=
 =?us-ascii?Q?s4Nd3/CKj5sZISnc9/AnZuDLQo9ejdl3SJIQNmEUG5pX7+J9T8kw7L5XCbcT?=
 =?us-ascii?Q?PzUK+OqnRTv19B/gTgxDnd4+pAoEzZmxGG+QKSHeKXMg++Dnyq5ZKkT6hRaK?=
 =?us-ascii?Q?3n8jceGa3EB0Z07kSuTkcntf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c16a386-b2f8-4327-a183-08d993580710
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5520.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 23:27:35.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puEzeMiBioqcQ8Uk7m6ZsQxlzI1pFyTN+f2ZLRJQOw+N6QM1upw6ZhRbKkiIjqHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5550
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

PUD and PMD entries do not have a special bit.

get_user_pages_fast() considers any page that passed pmd_huge() as
usable:

	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
		     pmd_devmap(pmd))) {

And vmf_insert_pfn_pmd_prot() unconditionally sets

	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));

eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.

As such gup_huge_pmd() will try to deref a struct page:

	head = try_grab_compound_head(pmd_page(orig), refs, flags);

and thus crash.

Thomas further notices that the drivers are not expecting the struct page
to be used by anything - in particular the refcount incr above will cause
them to malfunction.

Thus everything about this is not able to fully work correctly considering
GUP_fast. Delete it entirely. It can return someday along with a proper
PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.

Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 94 +---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 72 +----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  3 -
 include/drm/ttm/ttm_bo_api.h               |  3 +-
 8 files changed, 7 insertions(+), 175 deletions(-)

v2:
 - Remove the entire thing as per Thomas's advice
v1: https://lore.kernel.org/r/0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com

After this patch the only users of the vmf_insert_pfn_pud/pmd_prot() functions
are DAX and DAX always has a struct page. Eliminating this non-working case
will simplify trying to fix the refcounting on ZONE_DEVICE pages.

Thanks,
Jason

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d6aa032890ee8b..a1e63ba4c54a59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -61,7 +61,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 		}
 
 		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-						TTM_BO_VM_NUM_PREFAULT, 1);
+						TTM_BO_VM_NUM_PREFAULT);
 
 		 drm_dev_exit(idx);
 	} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 8c2ecc28272322..c89d5964148fd5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 
 	nouveau_bo_del_io_reserve_lru(bo);
 	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 	nouveau_bo_add_io_reserve_lru(bo);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 458f92a7088797..a36a4f2c76b097 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -61,7 +61,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
 		goto unlock_resv;
 
 	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
+				       TTM_BO_VM_NUM_PREFAULT);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		goto unlock_mclk;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861ec..e5af7f9e94b273 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -171,89 +171,6 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_vm_reserve);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/**
- * ttm_bo_vm_insert_huge - Insert a pfn for PUD or PMD faults
- * @vmf: Fault data
- * @bo: The buffer object
- * @page_offset: Page offset from bo start
- * @fault_page_size: The size of the fault in pages.
- * @pgprot: The page protections.
- * Does additional checking whether it's possible to insert a PUD or PMD
- * pfn and performs the insertion.
- *
- * Return: VM_FAULT_NOPAGE on successful insertion, VM_FAULT_FALLBACK if
- * a huge fault was not possible, or on insertion error.
- */
-static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
-					struct ttm_buffer_object *bo,
-					pgoff_t page_offset,
-					pgoff_t fault_page_size,
-					pgprot_t pgprot)
-{
-	pgoff_t i;
-	vm_fault_t ret;
-	unsigned long pfn;
-	pfn_t pfnt;
-	struct ttm_tt *ttm = bo->ttm;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	/* Fault should not cross bo boundary. */
-	page_offset &= ~(fault_page_size - 1);
-	if (page_offset + fault_page_size > bo->resource->num_pages)
-		goto out_fallback;
-
-	if (bo->resource->bus.is_iomem)
-		pfn = ttm_bo_io_mem_pfn(bo, page_offset);
-	else
-		pfn = page_to_pfn(ttm->pages[page_offset]);
-
-	/* pfn must be fault_page_size aligned. */
-	if ((pfn & (fault_page_size - 1)) != 0)
-		goto out_fallback;
-
-	/* Check that memory is contiguous. */
-	if (!bo->resource->bus.is_iomem) {
-		for (i = 1; i < fault_page_size; ++i) {
-			if (page_to_pfn(ttm->pages[page_offset + i]) != pfn + i)
-				goto out_fallback;
-		}
-	} else if (bo->bdev->funcs->io_mem_pfn) {
-		for (i = 1; i < fault_page_size; ++i) {
-			if (ttm_bo_io_mem_pfn(bo, page_offset + i) != pfn + i)
-				goto out_fallback;
-		}
-	}
-
-	pfnt = __pfn_to_pfn_t(pfn, PFN_DEV);
-	if (fault_page_size == (HPAGE_PMD_SIZE >> PAGE_SHIFT))
-		ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	else if (fault_page_size == (HPAGE_PUD_SIZE >> PAGE_SHIFT))
-		ret = vmf_insert_pfn_pud_prot(vmf, pfnt, pgprot, write);
-#endif
-	else
-		WARN_ON_ONCE(ret = VM_FAULT_FALLBACK);
-
-	if (ret != VM_FAULT_NOPAGE)
-		goto out_fallback;
-
-	return VM_FAULT_NOPAGE;
-out_fallback:
-	count_vm_event(THP_FAULT_FALLBACK);
-	return VM_FAULT_FALLBACK;
-}
-#else
-static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
-					struct ttm_buffer_object *bo,
-					pgoff_t page_offset,
-					pgoff_t fault_page_size,
-					pgprot_t pgprot)
-{
-	return VM_FAULT_FALLBACK;
-}
-#endif
-
 /**
  * ttm_bo_vm_fault_reserved - TTM fault helper
  * @vmf: The struct vm_fault given as argument to the fault callback
@@ -261,7 +178,6 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
  * @num_prefault: Maximum number of prefault pages. The caller may want to
  * specify this based on madvice settings and the size of the GPU object
  * backed by the memory.
- * @fault_page_size: The size of the fault in pages.
  *
  * This function inserts one or more page table entries pointing to the
  * memory backing the buffer object, and then returns a return code
@@ -275,8 +191,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
  */
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault,
-				    pgoff_t fault_page_size)
+				    pgoff_t num_prefault)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
@@ -327,11 +242,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		prot = pgprot_decrypted(prot);
 	}
 
-	/* We don't prefault on huge faults. Yet. */
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && fault_page_size != 1)
-		return ttm_bo_vm_insert_huge(vmf, bo, page_offset,
-					     fault_page_size, prot);
-
 	/*
 	 * Speculatively prefault a number of pages. Only error on
 	 * first page.
@@ -429,7 +339,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 
 	prot = vma->vm_page_prot;
 	if (drm_dev_enter(ddev, &idx)) {
-		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, prot);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index a833751099b559..858aff99a3fe53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1550,10 +1550,6 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
 			pgoff_t start, pgoff_t end);
 vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf);
 vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf);
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
-				enum page_entry_size pe_size);
-#endif
 
 /* Transparent hugepage support - vmwgfx_thp.c */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index e5a9a5cbd01a7c..922317d1acc8a0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -477,7 +477,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	else
 		prot = vm_get_page_prot(vma->vm_flags);
 
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
@@ -486,73 +486,3 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 
 	return ret;
 }
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
-				enum page_entry_size pe_size)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
-	    vma->vm_private_data;
-	struct vmw_buffer_object *vbo =
-		container_of(bo, struct vmw_buffer_object, base);
-	pgprot_t prot;
-	vm_fault_t ret;
-	pgoff_t fault_page_size;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	switch (pe_size) {
-	case PE_SIZE_PMD:
-		fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
-		break;
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	case PE_SIZE_PUD:
-		fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
-		break;
-#endif
-	default:
-		WARN_ON_ONCE(1);
-		return VM_FAULT_FALLBACK;
-	}
-
-	/* Always do write dirty-tracking and COW on PTE level. */
-	if (write && (READ_ONCE(vbo->dirty) || is_cow_mapping(vma->vm_flags)))
-		return VM_FAULT_FALLBACK;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	if (vbo->dirty) {
-		pgoff_t allowed_prefault;
-		unsigned long page_offset;
-
-		page_offset = vmf->pgoff -
-			drm_vma_node_start(&bo->base.vma_node);
-		if (page_offset >= bo->resource->num_pages ||
-		    vmw_resources_clean(vbo, page_offset,
-					page_offset + PAGE_SIZE,
-					&allowed_prefault)) {
-			ret = VM_FAULT_SIGBUS;
-			goto out_unlock;
-		}
-
-		/*
-		 * Write protect, so we get a new fault on write, and can
-		 * split.
-		 */
-		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
-	} else {
-		prot = vm_get_page_prot(vma->vm_flags);
-	}
-
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-out_unlock:
-	dma_resv_unlock(bo->base.resv);
-
-	return ret;
-}
-#endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index e6b1f98ec99f09..0a4c340252ec4a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -61,9 +61,6 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 		.fault = vmw_bo_vm_fault,
 		.open = ttm_bo_vm_open,
 		.close = ttm_bo_vm_close,
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		.huge_fault = vmw_bo_vm_huge_fault,
-#endif
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc6982e..36f7eb9d066395 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -594,8 +594,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault,
-				    pgoff_t fault_page_size);
+				    pgoff_t num_prefault);
 
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
 

base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.33.0

